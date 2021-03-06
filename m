Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8238832FCD1
	for <lists+xen-devel@lfdr.de>; Sat,  6 Mar 2021 20:38:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94364.177896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIckJ-00046M-Dl; Sat, 06 Mar 2021 19:37:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94364.177896; Sat, 06 Mar 2021 19:37:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIckJ-000461-AX; Sat, 06 Mar 2021 19:37:51 +0000
Received: by outflank-mailman (input) for mailman id 94364;
 Sat, 06 Mar 2021 19:37:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lIckH-00045t-Dw
 for xen-devel@lists.xenproject.org; Sat, 06 Mar 2021 19:37:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lIckF-0007iD-Vr; Sat, 06 Mar 2021 19:37:47 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lIckF-0006Dg-MF; Sat, 06 Mar 2021 19:37:47 +0000
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
	bh=94O42RF8ZcOdd/rNkYU0e81C4ESfkvMGzVmyp8tD9Pg=; b=bzkVvrmr3Kr09oJ68vE6QlMDvX
	zX6BdGzFXhi7KuOEmPIG9ILucAOuoqHHMLM+xD2i82bkFCrl5kOwcWBF4PCQ+hrwRockBzKn3BeTd
	8Fj+EHZiStNzwy3lpLnn4s33HmpxADpKawFz0D8lKgvJb4dLJtqp2ocSpsuR62iQwvXc=;
Subject: Re: [PATCH for-4.15 2/2] tools/xenstore: Check the format printf for
 xprintf() and barf{,_perror}()
To: Ian Jackson <iwj@xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, raphning@amazon.co.uk, Julien Grall <jgrall@amazon.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210305124003.13582-1-julien@xen.org>
 <20210305124003.13582-3-julien@xen.org>
 <0994b7a0-c537-b312-b134-caf54c79c87f@suse.com>
 <74568cd7-143b-48ad-b9be-bf4229655376@suse.com>
 <7eb12174-3268-ccdb-df9c-c4fe23d3a332@xen.org>
 <24642.14600.124181.19574@mariner.uk.xensource.com>
From: Julien Grall <julien@xen.org>
Message-ID: <0249af89-ced0-0f7f-d370-9ffade6b1678@xen.org>
Date: Sat, 6 Mar 2021 19:37:45 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <24642.14600.124181.19574@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Ian,

On 05/03/2021 13:58, Ian Jackson wrote:
> Julien Grall writes ("Re: [PATCH for-4.15 2/2] tools/xenstore: Check the format printf for xprintf() and barf{,_perror}()"):
>> Urgh, you are right. Actually, the extern was added recently by Anthony:
>>
>> dacdbf7088d6a3705a9831e73991c2b14c519a65 ("tools/xenstore: mark variable
>> in header as extern")
>>
>> I completely forgot it despite I needed to backport the patch to our
>> downstream Xen.
> 
> How horrible.
> 
> Maybe we could add a comment to the code, next to the declaration,
> about this crazy situation.

Would the following comment work for you?

/* Function pointer as xprintf() can be configured at runtime. */

I can fold it in my patch while committing.

Cheers,

> 
> Ian.
> 

-- 
Julien Grall

