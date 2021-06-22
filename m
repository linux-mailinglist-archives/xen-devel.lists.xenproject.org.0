Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A303AFFA5
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jun 2021 10:54:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145774.268109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvcAC-0004mj-KX; Tue, 22 Jun 2021 08:53:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145774.268109; Tue, 22 Jun 2021 08:53:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvcAC-0004k2-HU; Tue, 22 Jun 2021 08:53:44 +0000
Received: by outflank-mailman (input) for mailman id 145774;
 Tue, 22 Jun 2021 08:53:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lvcAB-0004jw-15
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 08:53:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lvcA9-0007FW-JZ; Tue, 22 Jun 2021 08:53:41 +0000
Received: from [54.239.6.182] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lvcA9-0004ZZ-B3; Tue, 22 Jun 2021 08:53:41 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=oiu1y/VFotGgWs6FCOYGAiLGP/wrlWBqk+Z0GNUHPBM=; b=CBtsKTGQJmAh0UVudCn8bFjvas
	cgx7nPNnq7Rth/eo/RyyzC28o/ObcKNvSk4h4MFEdRuLsupAavrboeN81ZcKBvjWtwAeLHMydC+4w
	w1fVt1x6Wbx+3YDlnNimePttsW4XSPRIRkSzH2iBuMDFIusIXfPt66xX430czdVSeXOs=;
Subject: Re: [PATCH] tools/xenstored: Don't crash xenstored when Live-Update
 is cancelled
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk, doebel@amazon.de, Julien GralL
 <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210617173857.6450-1-julien@xen.org>
 <e7458af5-a128-fc01-21ee-34a02f2fdf9b@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ba1c16d7-1820-a146-2d64-6d4cc5901f04@xen.org>
Date: Tue, 22 Jun 2021 10:53:38 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e7458af5-a128-fc01-21ee-34a02f2fdf9b@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 22/06/2021 10:46, Juergen Gross wrote:
> On 17.06.21 19:38, Julien Grall wrote:
>> From: Julien GralL <jgrall@amazon.com>
>>
>> As Live-Update is asynchronous, it is possible to receive a request to
>> cancel it (either on the same connection or from a different one).
>>
>> Currently, this will crash xenstored because do_lu_start() assumes
>> lu_status will be valid. This is not the case when Live-Update has been
>> cancelled. This will result to dereference a NULL pointer and
>> crash Xenstored.
> 
> Umm, you introduced that bug in "[PATCH 03/10] tools/xenstore: Don't
> assume conn->in points to the LU request".

No. I did reproduced this one without my series. If there are in-flight 
transaction this will crash in lu_check_lu_allowed() otherwise, it will 
crash when calling lu_dump_state().

The easiest way to reproduce is requesting live-update when there are 
long transactions and from a different connection (still in dom0) 
requesting to abort the connection.

In this case, lu_abort() will free lu_status and the destructor will set 
it to NULL. But the actual request is still in the delayed request queue 
for the other connection.

Cheers,

-- 
Julien Grall

