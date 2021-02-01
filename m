Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F8730A471
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 10:38:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79628.144993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Ve6-0006Mj-6x; Mon, 01 Feb 2021 09:37:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79628.144993; Mon, 01 Feb 2021 09:37:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Ve6-0006MK-3k; Mon, 01 Feb 2021 09:37:22 +0000
Received: by outflank-mailman (input) for mailman id 79628;
 Mon, 01 Feb 2021 09:37:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l6Ve5-0006MF-9A
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 09:37:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 328f6949-9202-4d8a-92f9-41c1fb6c9c0d;
 Mon, 01 Feb 2021 09:37:20 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 78510AE63;
 Mon,  1 Feb 2021 09:37:19 +0000 (UTC)
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
X-Inumbo-ID: 328f6949-9202-4d8a-92f9-41c1fb6c9c0d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612172239; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0TUqV3nK4hzpGWbVQxZaKAW4ccsDU8ScO6Q58BIGzOA=;
	b=XRGPfFwt5LvjIwxy7K5megpnnDKvfg/JEx/dnt+vYl9jKpHCDtGVv8a1+p7Tm/Gfew05Bi
	YQef0NdL9gk3sfY2hCO+9yhqqpLAEmO4ao5BiTqFQTalkaaOIBJ74ZPjNUZ7K3V5N7i6me
	M/wNLWpC6uOVwqkV+ygGAC48/2SKBP0=
Subject: Re: [PATCH] x86/debug: fix page-overflow bug in dbg_rw_guest_mem
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <caba05850df644814d75d5de0574c62ce90e8789.1611971959.git.tamas@tklengyel.com>
 <74f3263a-fe12-d365-ad45-e5556b575539@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <044823b7-1bbd-6405-7371-2b06e49cc147@suse.com>
Date: Mon, 1 Feb 2021 10:37:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <74f3263a-fe12-d365-ad45-e5556b575539@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.01.2021 03:59, Andrew Cooper wrote:
> On 30/01/2021 01:59, Tamas K Lengyel wrote:
>> When using gdbsx dbg_rw_guest_mem is used to read/write guest memory. When the
>> buffer being accessed is on a page-boundary, the next page needs to be grabbed
>> to access the correct memory for the buffer's overflown parts. While
>> dbg_rw_guest_mem has logic to handle that, it broke with 229492e210a. Instead
>> of grabbing the next page the code right now is looping back to the
>> start of the first page. This results in errors like the following while trying
>> to use gdb with Linux' lx-dmesg:
>>
>> [    0.114457] PM: hibernation: Registered nosave memory: [mem
>> 0xfdfff000-0xffffffff]
>> [    0.114460] [mem 0x90000000-0xfbffffff] available for PCI demem 0
>> [    0.114462] f]f]
>> Python Exception <class 'ValueError'> embedded null character:
>> Error occurred in Python: embedded null character
>>
>> Fixing this bug by taking the variable assignment outside the loop.
>>
>> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

I have to admit that I'm irritated: On January 14th I did submit
a patch ('x86/gdbsx: convert "user" to "guest" accesses') fixing this
as a side effect. I understand that one was taking care of more
issues here, but shouldn't that be preferred? Re-basing isn't going
to be overly difficult, but anyway.

Jan

