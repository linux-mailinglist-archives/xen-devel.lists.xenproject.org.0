Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4E19A2E12
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 21:51:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821278.1235028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1WW2-0006Ao-TP; Thu, 17 Oct 2024 19:50:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821278.1235028; Thu, 17 Oct 2024 19:50:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1WW2-000674-Qg; Thu, 17 Oct 2024 19:50:34 +0000
Received: by outflank-mailman (input) for mailman id 821278;
 Thu, 17 Oct 2024 19:50:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2/Py=RN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t1WW1-00066y-SJ
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 19:50:33 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11c0da09-8cc1-11ef-a0be-8be0dac302b0;
 Thu, 17 Oct 2024 21:50:32 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a99e3b3a411so388942466b.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2024 12:50:32 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a68ae549bsm5117766b.77.2024.10.17.12.50.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Oct 2024 12:50:31 -0700 (PDT)
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
X-Inumbo-ID: 11c0da09-8cc1-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729194632; x=1729799432; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vs9/oTPCF9qbA4fIhOkXAdawt4YsQJ75+QQenrjo9W8=;
        b=g+ay58BegcRUeuiJMVyN4chcSs4NtbLoFy0u6LBBQ5et9rzJylAS7/1HGXzEEzI+ge
         fNPreG4Bd2HGf2vJYoDAU0lv07sTdVzJnA9Gojx8GpB1QUFRN9flk53thMWUmVgim7sh
         T4Z4PMdXIWUxfIFn4RfxMFQJI4euaSOT3pDLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729194632; x=1729799432;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vs9/oTPCF9qbA4fIhOkXAdawt4YsQJ75+QQenrjo9W8=;
        b=oMzN9nHVRd6qZ3RCHr9opLM+WYeb286pyBc4r0PwM/n8mw/qXDC+R96nlo8uMhdDRY
         /fg/cNHjp0v49Zp+5Ta373HNKfWHjW5ZoptzhXQA3fqvAJJ5JI5HpkUOyHxT1JIG6upt
         G27sFSalkLQc9DruoLsvqeNLPr/5/wmTbFAsh0q4cyD/dpkEOGzQ+LBTIi6oe7vVaAcH
         ntUJ04Gbv2A70xQFsVGM3pb/b5cxrUAmtKPysxuEyJafPobdR5qDo6rALAdZ4GmABY5z
         /NTIovQajsVKIu9DKTsaIgNqDMDcAdPxUQ/dgJakE8YSiYh+qZepahhwRoojpfQB+Zzj
         IxSA==
X-Forwarded-Encrypted: i=1; AJvYcCXB7baiSlQEvi34pbwSRu7ICCEmovkOhOPrfSB22NZSWTOPZ5b4ldPEq0mFAfnkHJYTm8XcWKvEpKg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxq7Bzm5JGP5HxUBUcr2MAkb5hSyVNfjA1Q5sdjoNTuFVR5pPlF
	bADd4KGmXS/oEGdDm/TIxg8K38/QxMuOq+8eWQ8hcuUkIga8ISqLlGU/yYp4giY=
X-Google-Smtp-Source: AGHT+IGGm9hQThhajV8uvR7MN+R/+zyT2wMidtSx90gj6yM+gGzsQjp2CzRXI9T1N0t2OPnwdeL/lg==
X-Received: by 2002:a17:906:c105:b0:a9a:5b84:ac81 with SMTP id a640c23a62f3a-a9a67f1c8b6mr26315866b.31.1729194632076;
        Thu, 17 Oct 2024 12:50:32 -0700 (PDT)
Message-ID: <66fc898a-e346-4dce-a99a-b8fdf2590511@citrix.com>
Date: Thu, 17 Oct 2024 20:50:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/44] x86/boot: move x86 boot module counting into a
 new boot_info struct
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: Christopher Clark <christopher.w.clark@gmail.com>, jason.andryuk@amd.com,
 stefano.stabellini@amd.com, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
 <20241017170325.3842-2-dpsmith@apertussolutions.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241017170325.3842-2-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/10/2024 6:02 pm, Daniel P. Smith wrote:
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index a6e77c9ed9fc..6201ca0fad19 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -274,16 +275,28 @@ static int __init cf_check parse_acpi_param(const char *s)
>  custom_param("acpi", parse_acpi_param);
>  
>  static const module_t *__initdata initial_images;
> -static unsigned int __initdata nr_initial_images;
> +
> +struct boot_info __initdata xen_boot_info;
> +
> +static struct boot_info *__init multiboot_fill_boot_info(unsigned long mbi_p)
> +{
> +    struct boot_info *bi = &xen_boot_info;
> +    const multiboot_info_t *mbi = __va(mbi_p);
> +
> +    bi->nr_modules = (mbi->flags & MBI_MODULES) ? mbi->mods_count : 0;

Having looked to end of the series, this and a few other expressions are
still awkward.

The nicer way looks like:

struct boot_info __initdata xen_boot_info = {
    .loader = "unknown",
    .cmdline = "",
};

static struct boot_info *__init multiboot_fill_boot_info(unsigned long
mbi_p)
{
    struct boot_info *bi = &xen_boot_info;
    const multiboot_info_t *mbi = __va(mbi_p);
    module_t *mods = __va(mbi->mods_addr);
    unsigned int i;

    if ( mbi->flags & MBI_MODULES )
        bi->nr_modules = mbi->mods_count;

    if ( mbi->flags & MBI_LOADERNAME )
        bi->loader = __va(mbi->boot_loader_name);

    if ( mbi->flags & MBI_CMDLINE )
        bi->cmdline = cmdline_cook(__va(mbi->cmdline), bi->loader);

    if ( mbi->flags & MBI_MEMMAP )
    {
        bi->memmap_addr = mbi->mmap_addr;
        bi->memmap_length = mbi->mmap_length;
    }


which is easier to read and follow.  Thoughts?

~Andrew

