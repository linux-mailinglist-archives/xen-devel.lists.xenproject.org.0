Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 654CF9974FA
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 20:36:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815092.1228821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sybYE-0004NG-8n; Wed, 09 Oct 2024 18:36:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815092.1228821; Wed, 09 Oct 2024 18:36:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sybYE-0004La-6E; Wed, 09 Oct 2024 18:36:46 +0000
Received: by outflank-mailman (input) for mailman id 815092;
 Wed, 09 Oct 2024 18:36:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnIC=RF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sybYD-0004LU-3G
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 18:36:45 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d11d941-866d-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 20:36:42 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728498991381920.1946666915975;
 Wed, 9 Oct 2024 11:36:31 -0700 (PDT)
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
X-Inumbo-ID: 6d11d941-866d-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1728498998; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MTmfxWxvazSwrTr6ubw18i/0VLL2PwU92ew0L0kXQOEHH2CjZPd0F+yHV6vqYDTkL0gmRO11T287BgdD3UnIUmGUvMjkp/TzGFrKUKWLYHiOc8HldB1x1n643BSUJu03jYW5oYu84f+SIjWLnKjqubpYQg1F5LdGstYoS21Gq0c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728498998; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=S7xRb9t0TVRaKiVlpoDe5p38KKpnUIzlqsuq6Sm54bo=; 
	b=RWmi38A8lTLYDTLrLEVey3C9BD35Hsljj8xpIX282y1kAFlDZMGZaCgt+FGvnXHQTYrRS+miUndqlW/ColhAfm4JoPq0p4CzETAjZoqJVdAl8vMmzoAgmaM5kRZiSxZNe5D5dQ0qIx3KXA3EB19DzHOzwU5dBycGvBeoyl8QAyQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728498998;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=S7xRb9t0TVRaKiVlpoDe5p38KKpnUIzlqsuq6Sm54bo=;
	b=mOaN6Lwxk7retLRiZfE85+uzXvTj08dVJalwJp37JWrJK/mSuTONTzVHfdLfh5iF
	WpDUZ4Xvl5KFCH/te0n012XhWGdqbLWUjnXqjdjAI/DeBj2XVXHA+cm9RD8hUDqh/OT
	8kGWmywHWkEkl+vro9QQk9I2aKNP2hrDQGEhfk6g=
Message-ID: <0fa28d76-d0e9-4bcf-8782-02020127a2f6@apertussolutions.com>
Date: Wed, 9 Oct 2024 14:36:29 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 24/44] x86/boot: remove module_map usage by ramdisk
 loading
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-25-dpsmith@apertussolutions.com>
 <06618ae2-a7fd-484e-b1d5-87c5065df21c@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <06618ae2-a7fd-484e-b1d5-87c5065df21c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/8/24 12:46, Jason Andryuk wrote:
> On 2024-10-06 17:49, Daniel P. Smith wrote:
>> The ramdisk loading is the last user of module_map, remove
>> its usage and any remaining remnants of module_map.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   xen/arch/x86/setup.c | 11 +++++------
>>   1 file changed, 5 insertions(+), 6 deletions(-)
>>
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index b0946216ea3f..0d2ee19998aa 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1037,7 +1037,7 @@ void asmlinkage __init noreturn 
>> __start_xen(unsigned long mbi_p)
>>       struct boot_info *bi;
>>       multiboot_info_t *mbi;
>>       module_t *mod;
>> -    unsigned long nr_pages, raw_max_page, module_map[1];
>> +    unsigned long nr_pages, raw_max_page;
>>       int i, j, e820_warn = 0, bytes = 0;
>>       unsigned long eb_start, eb_end;
>>       bool acpi_boot_table_init_done = false, relocated = false;
>> @@ -1187,15 +1187,14 @@ void asmlinkage __init noreturn 
>> __start_xen(unsigned long mbi_p)
>>           panic("dom0 kernel not specified. Check bootloader 
>> configuration\n");
>>       /* Check that we don't have a silly number of modules. */
>> -    if ( bi->nr_modules > sizeof(module_map) * 8 )
>> +    if ( bi->nr_modules > MAX_NR_BOOTMODS + 1 )
> 
> Don't you want to check MAX_NR_BOOTMODS, to keep the last module for Xen 
> itself?

Good question. I went back to confirm and it does not look like any of 
the module_map bits was used for tracking xen in the module list. so 
yes, drop it back down to just MAX_NR_BOOTMODS.

v/r,
dps

