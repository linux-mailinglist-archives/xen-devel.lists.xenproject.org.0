Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2767D3BC81D
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 10:52:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150897.278947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0gnw-0006cf-IO; Tue, 06 Jul 2021 08:51:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150897.278947; Tue, 06 Jul 2021 08:51:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0gnw-0006Za-FI; Tue, 06 Jul 2021 08:51:44 +0000
Received: by outflank-mailman (input) for mailman id 150897;
 Tue, 06 Jul 2021 08:51:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m0gnv-0006ZU-1k
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 08:51:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m0gnt-00056t-Mk; Tue, 06 Jul 2021 08:51:41 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m0gnt-000596-Gr; Tue, 06 Jul 2021 08:51:41 +0000
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
	bh=krtht/hdkyvzqqjRLHnO5bZBqB+soqWfb0zgtV5qNBY=; b=QYUQOaGkFYMx5tVqGrPIvwwJeF
	KZ4JgQfkT8ti2lGtLC/2KyBRase2qY8QnYW1LsHyT2JiOINEaGQM6FmXD7F5QcHf4TdupiVlNK+VO
	DJD4ob40YweivCNzph6SPooNR7Qvtagou0IVw7y0ltWONbpNXL9pips/hZ3ikgLX2778=;
Subject: Re: [PATCH] tools/xenstored: Stash the correct request in
 lu_status->in
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk, doebel@amazon.de, Julien Grall
 <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210701140307.2516-1-julien@xen.org>
 <ce5e3bef-a075-275f-d638-67f987cf1088@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <277224dc-7eb9-442f-eb58-a38322aa4fcc@xen.org>
Date: Tue, 6 Jul 2021 09:51:39 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ce5e3bef-a075-275f-d638-67f987cf1088@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 05/07/2021 13:49, Juergen Gross wrote:
> On 01.07.21 16:03, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> When Live-Updating with some load, Xenstored may hit the assert
>> req->in == lu_status->in in do_lu_start().
>>
>> This is happening because the request is stashed when Live-Update
>> begins. This happens in a different request (see call lu_begin()
>> when select the new binary) from the one performing Live-Update.
>>
>> To avoid the problem, stash the request in lu_start().
>>
>> Fixes: 65f19ed62aa1 ("tools/xenstore: Don't assume conn->in points to 
>> the LU request")
>> Reported-by: Michael Kurth <mku@amazon.com>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Committed. Thanks!

Cheers,

-- 
Julien Grall

