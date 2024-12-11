Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB5B9ED6CF
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 20:51:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855273.1268261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLSk3-000339-Ej; Wed, 11 Dec 2024 19:51:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855273.1268261; Wed, 11 Dec 2024 19:51:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLSk3-00030O-BS; Wed, 11 Dec 2024 19:51:27 +0000
Received: by outflank-mailman (input) for mailman id 855273;
 Wed, 11 Dec 2024 19:51:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lbUB=TE=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tLSk1-000306-Ea
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 19:51:25 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ba5debe-b7f9-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 20:51:23 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1733946675786887.6962878926549;
 Wed, 11 Dec 2024 11:51:15 -0800 (PST)
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
X-Inumbo-ID: 4ba5debe-b7f9-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1733946678; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Jh0XrYeuquUXX6DBpf2JWYuOW5S1J7Ef8oF2q3Ld9Xu0c1tkS3GkyZZ6r/RZEs9Cp41QBX2+NRbejhs6lvL10rBfHf6/KtN6JDtIeLodU94vE3dQGZQ1PkH1HC/WU34YUpxFikgimdhDYdaM33aFk+DrPvg3yvySYUSfdnPq27c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733946678; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Pt25ELFfkt7OmxOKkJjl/OzhaL1ZMQn6CcuxTcaayLQ=; 
	b=CnWE52WvhT7OPEEX1YRZgIkECiNdtwWDIXMxPOI7qmN4wWvErLgp/E3FbjOfQVkYgWf9KrpY9EYCQyaNGl8fgkr4uyIC9Fd+BgzuF6FxM9y1BrlC28R2hnSjfPS1gX0oKP1ZCbR6Iz58SnSCMBEX/g0P5qIs5vTiPGdYi7a6J0w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733946678;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Pt25ELFfkt7OmxOKkJjl/OzhaL1ZMQn6CcuxTcaayLQ=;
	b=sWgaK1XorCDo40IfxkcUZ3laPhSnpLwYhfW4KUXUSBFbYQR0HjxaWpcVx8qYGQ7O
	KSlaCjl5JbONKMY2lfkEcL57FDqCYqFImH8GNVNSlEgk/Tc4GUzUrQuSNemOHMwwoQg
	QjECRejZ1v5F5gOkeIebypkve193fcXI7dtzQEfI=
Message-ID: <34cb3914-eb85-41bd-8205-9d2aa1ffbc31@apertussolutions.com>
Date: Wed, 11 Dec 2024 14:51:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/15] x86/hyperlaunch: add capabilities to boot domain
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-16-dpsmith@apertussolutions.com>
 <d68f1b2c-06b1-4065-b81a-82463e060d8c@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <d68f1b2c-06b1-4065-b81a-82463e060d8c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 11/25/24 19:09, Jason Andryuk wrote:
> On 2024-11-23 13:20, Daniel P. Smith wrote:
>> Introduce the ability to assign capabilities to a domain via its 
>> definition in
>> device tree. The first capability enabled to select is the control domain
>> capability. The capability property is a bitfield in both the device 
>> tree and
>> `struct boot_domain`.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   xen/arch/x86/domain_builder/core.c    |  2 +-
>>   xen/arch/x86/domain_builder/fdt.c     | 13 +++++++++++++
>>   xen/arch/x86/include/asm/bootdomain.h |  4 ++++
>>   xen/arch/x86/setup.c                  |  6 +++++-
>>   4 files changed, 23 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/x86/domain_builder/core.c b/xen/arch/x86/ 
>> domain_builder/core.c
>> index 95cab06e6159..eaa019472724 100644
>> --- a/xen/arch/x86/domain_builder/core.c
>> +++ b/xen/arch/x86/domain_builder/core.c
>> @@ -93,9 +93,9 @@ void __init builder_init(struct boot_info *bi)
>>           i = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
>>           bi->mods[i].type = BOOTMOD_KERNEL;
>>           bi->domains[0].kernel = &bi->mods[i];
>> +        bi->domains[0].capabilities |= BUILD_CAPS_CONTROL;
>>           bi->nr_domains = 1;
>>       }
>> -
> 
> This will get cleaned up earlier.
> 
> With that:
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks!

