Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B30489979F8
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 03:08:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815367.1229107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syher-0004pM-DN; Thu, 10 Oct 2024 01:08:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815367.1229107; Thu, 10 Oct 2024 01:08:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syher-0004mC-94; Thu, 10 Oct 2024 01:08:01 +0000
Received: by outflank-mailman (input) for mailman id 815367;
 Thu, 10 Oct 2024 01:07:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RAAn=RG=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1syheo-0004m6-Um
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 01:07:58 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1546eabc-86a4-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 03:07:57 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728522469974591.300572494625;
 Wed, 9 Oct 2024 18:07:49 -0700 (PDT)
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
X-Inumbo-ID: 1546eabc-86a4-11ef-a0bd-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728522471; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Wzapc2H5edJqJx441lOiUVHJ7KGe3LKr1701yD44KrZ8Ve0iGYjUJiw2KWpLxtDE4szpyq/Q9WMX+ve5vA/XUO15QWSwDUGCGrooRvWuP2a3bqe9c1/NRafQS6a1ev+GC6L1xqV2iOt3lJMSBX0BkFQW+T7vSCmcrqO3ob8QsgM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728522471; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=uHS3cMQp8xkM8h7cg1quP597bOWP2sRF49KObS84wX0=; 
	b=OU1fddYIt83aTXZXRAX2uPADAMsGg3QF1sVAXnFyeG6q60baXJrxloXYeWiWClKL9DdDbMG7NyVztYUEfLsUlNKH5lqmAN0zC5aC1e0rmOxx8x0BLnJikWknHAnDUeaRsf8rAFP2aVjgUWKBKBxoNtg8tstlcRfM/b6YxmwfdYI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728522471;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=uHS3cMQp8xkM8h7cg1quP597bOWP2sRF49KObS84wX0=;
	b=XhD/gd1NvkCXWO7zxjx07+6Fpf/yXzf1hCBAPoHtbGVgWPa1Ry0phP7yMOpYMfEO
	ENyNHa/rDOVL+qUi6TnXmP4xPxCL/LI4bcl5wqNUhY01XMFrVZ3IBjzBwo4+yucvPkc
	cegKHmn/XMYZg0klD+ggJmdhqrIb35EPFBhtrpkI=
Message-ID: <27fec566-05ab-4405-ba65-a47e1460f293@apertussolutions.com>
Date: Wed, 9 Oct 2024 21:07:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/44] x86/boot: convert setup.c mod refs to early_mod
To: Jan Beulich <jbeulich@suse.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-9-dpsmith@apertussolutions.com>
 <c0b97711-6bf2-476c-a2f7-7f4dc075d2aa@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <c0b97711-6bf2-476c-a2f7-7f4dc075d2aa@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 10/9/24 11:29, Jan Beulich wrote:
> On 06.10.2024 23:49, Daniel P. Smith wrote:
>> @@ -2061,8 +2067,9 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>>        * We're going to setup domain0 using the module(s) that we stashed safely
>>        * above our heap. The second module, if present, is an initrd ramdisk.
>>        */
>> -    dom0 = create_dom0(mod, bi->mods[0].headroom,
>> -                       initrdidx < bi->nr_modules ? mod + initrdidx : NULL,
>> +    dom0 = create_dom0(bi->mods[0].mod, bi->mods[0].headroom,
>> +                       initrdidx < bi->nr_modules ?
>> +                            bi->mods[initrdidx].mod : NULL,
> 
> See an earlier comment regarding wrapped ?:. We certainly never have
> indentation levels of 5 blanks.

Can format similar as earlier, and just fyi, that is a stray space from 
wrapping and not a five space indent.

v/r,
dps

