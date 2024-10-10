Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 222FB9979F4
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 03:03:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815358.1229097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syha9-0003W8-RD; Thu, 10 Oct 2024 01:03:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815358.1229097; Thu, 10 Oct 2024 01:03:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syha9-0003Ts-OK; Thu, 10 Oct 2024 01:03:09 +0000
Received: by outflank-mailman (input) for mailman id 815358;
 Thu, 10 Oct 2024 01:03:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RAAn=RG=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1syha7-0003Ti-Qe
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 01:03:07 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67b4fe65-86a3-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 03:03:06 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728522179843234.98468546043046;
 Wed, 9 Oct 2024 18:02:59 -0700 (PDT)
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
X-Inumbo-ID: 67b4fe65-86a3-11ef-a0bd-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728522180; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OoRI3Q5y1SpBmRcPUNkJrkoC3wmFAkSCwUkCwY9QhF6sIEh6QZU2oXDFNk16lRAM0IdL2zmHAHGywp7/Z7y6SNRXApTAoxfrbzfCnNh04fZVTLtpZ5XjhEIJs5aixOUjnNdVepSCnF97eQD5TxhqqV9mxWpnUXf89n/1tz174U0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728522180; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yVhC6M2mU4XEU3wMpIHe172mth4+/epzj7mRr1heY9w=; 
	b=hxdinGa4TgRYpbgrhWjD9BRHRqx5JiQwetPC27leLOpDFIJKM/2FqjnClp4xzTGgi8UEdPMnUGV4qieSkuKnB/AUfOD3ZsFmU6gGaahu68OZuug4WwJ97QlrwFV6vjlZRtZEwBm6Dod3YR/Rk/xbnr0cAtWTCPrf+jNOd0CKzJ0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728522180;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=yVhC6M2mU4XEU3wMpIHe172mth4+/epzj7mRr1heY9w=;
	b=dmigOh0Cv5vNzSR+6hAB/wOwDFfkmUKpN6QxZoERo/OXAvPb2ggsufIxR5ZW8iFa
	Jys1EttVrp6lzH4jqHR7YKOgOEcFZfIPWpTvsL2AcEiRYpj9/AtxKzNDMpmgPdd2BHW
	zzVgCtAqEOc8+Qd0/GFOoY5tzOGPn9+qxmZg1IT8=
Message-ID: <97cf65af-b39f-4c4e-bbb9-60aa01004b75@apertussolutions.com>
Date: Wed, 9 Oct 2024 21:02:57 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/44] x86/boot: convert consider_modules to struct
 boot_module
To: Jan Beulich <jbeulich@suse.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-7-dpsmith@apertussolutions.com>
 <aa040161-b7f6-4520-b3b7-55d7e8ee867f@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <aa040161-b7f6-4520-b3b7-55d7e8ee867f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 10/9/24 11:22, Jan Beulich wrote:
> On 06.10.2024 23:49, Daniel P. Smith wrote:
>> @@ -639,20 +639,20 @@ static uint64_t __init consider_modules(
>>   
>>       for ( i = 0; i < nr_mods ; ++i )
>>       {
>> -        uint64_t start = (uint64_t)mod[i].mod_start << PAGE_SHIFT;
>> -        uint64_t end = start + PAGE_ALIGN(mod[i].mod_end);
>> +        uint64_t start = (uint64_t)pfn_to_paddr(mods[i].mod->mod_start);
> 
> With the switch to pfn_to_paddr() the cast isn't needed anymore.

Ack.

v/r,
dps

