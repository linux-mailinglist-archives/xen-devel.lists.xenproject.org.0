Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 078E4AACB9E
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 18:56:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977694.1364706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLaM-0003d7-5w; Tue, 06 May 2025 16:56:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977694.1364706; Tue, 06 May 2025 16:56:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLaM-0003aG-2k; Tue, 06 May 2025 16:56:02 +0000
Received: by outflank-mailman (input) for mailman id 977694;
 Tue, 06 May 2025 16:56:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cniF=XW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uCLaL-0003a4-A4
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 16:56:01 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fcb86f3a-2a9a-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 18:56:00 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43cef035a3bso38010355e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 09:56:00 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b391c42bsm213418805e9.39.2025.05.06.09.55.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 May 2025 09:55:59 -0700 (PDT)
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
X-Inumbo-ID: fcb86f3a-2a9a-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746550560; x=1747155360; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f0QPuDckgmBjGtmjN6+ro2L4EL4408HeOivJnI0knug=;
        b=mumb5Drg+xbkgfXoDrDS7JDUBQYSlX4o3BmGSzoK4A4rs0mYZBx3YoxcwlJIHlDBM7
         E+4U7F/sHvvEdI/gz/oMzHAsfPVMMramPSqzIhovB3v0rdwZtbHebILejlohqLPswd1x
         X4umHUMADjn8ej8GHvM7UdKaTrDrAGLQ3Dm0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746550560; x=1747155360;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0QPuDckgmBjGtmjN6+ro2L4EL4408HeOivJnI0knug=;
        b=Ws88sj5luLKPc4K+501YRRZh7e9LAgG7rxnOAmZrQTC9r0cZqcqkQ6qJZXKal78SAr
         Xvz/hOwoSWhtrkUhz/hkNIkOZgZFCtCbLl+LMHKm9bOuJZ/8LOy3+1LJQgHBV/FVUA/P
         +fj5FApjSU8N1vAlL3aTCEqJdJei9EYg+AhL+wrTBoXwpZQdlW9HIRg1hhhX66dVBIkS
         rbVt7b7UlbPHm2aKI79IhrdWCOPd0O+eg7mCR1vrD22/5t8JrxIzOhmZU9sdeY3gYC0P
         PKN/2btNqEN+LRWCEIFlCrS7WM9gtG1C38tQRS3YEqnu4u01Orto/vWJuU2A1MIKHfz9
         FYag==
X-Forwarded-Encrypted: i=1; AJvYcCUTggKxxdLgh0DFCT8wK9P7vL8SZJ+2naqalI5x/JSEE1aUdBd595OMgDVVngCkyuf1QSqSMDqUMNA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwBGTqTx7o8PbTYiaZPCWt49E4LeO6gjw4jB3qSvoJKVWEWYWjv
	9TGkjdFTEue7vlFh8LhEMiYCLHzJZQvVndmMtFqqeSZ1omREcauuMLwr7cZ3v6S96SOyccg1Bk9
	C
X-Gm-Gg: ASbGnctAO1g6ZPiwhJHgaCF/6kcMXKf7jB5NcQ+iSCUqKk05Qi8hLTAfFam2cy5Nu6s
	Un1RcQYUhn5ABck6zsXIEn07V3o2iYtGe5m31YXgZMWt5uGMYU40g8nCLIEj0yNJ3w4C3vIQbxP
	eGL3cJCk7lE8BBLnM6/asw78LystqvMJ8ThY211NtLosT5lr9FgcrbYf64Sp2zIdY7EtOIgFvtW
	z/FY/5WZ6NaZdQAK9CGEK4fSy/WqB46BRBa1ztxgfiSTdzXNt/56casDkDOIK3POfkc0cnN23FW
	SJ2kgqLqmD/hvDS9BMGLrLQ+OAtoFyZpFHm94hfWlCzs8HGQvD7n/1GTMbuNhOke4BvTqxSMExg
	gVClezw7MMH1BOBHt
X-Google-Smtp-Source: AGHT+IEWs9FBr+MfhSGpyAnzkxWzwR5cuBv9L7wLnjU62hB26r925f/QCitetRdkbPpj6fQ8R1Lm0g==
X-Received: by 2002:a05:600c:4e09:b0:43d:224:86b5 with SMTP id 5b1f17b1804b1-441c48b0213mr115376295e9.4.1746550559648;
        Tue, 06 May 2025 09:55:59 -0700 (PDT)
Message-ID: <cf3e9dbf-7ea7-4b33-a4be-14cb5dac0ebc@citrix.com>
Date: Tue, 6 May 2025 17:55:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] efi: Add a function to check if Secure Boot mode is
 enabled
To: Kevin Lampis <kevin.lampis@cloud.com>, xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
References: <20250506162449.1676405-1-kevin.lampis@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250506162449.1676405-1-kevin.lampis@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

CC'ing the EFI maintainers.

On 06/05/2025 5:24 pm, Kevin Lampis wrote:
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index e39fbc3529..7c528cd5dd 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -870,6 +870,27 @@ static void __init pre_parse(const struct file *file)
>                     " last line will be ignored.\r\n");
>  }
>  
> +static void __init init_secure_boot_mode(void)
> +{
> +    EFI_STATUS status;
> +    EFI_GUID gv_uuid = EFI_GLOBAL_VARIABLE;
> +    uint8_t data = 0;
> +    UINTN size = sizeof(data);
> +    UINT32 attr = 0;

Newline between variables and code please.

> +    status = efi_rs->GetVariable((CHAR16 *)L"SecureBoot", &gv_uuid, &attr,
> +                                 &size, &data);
> +
> +    if ( status == EFI_NOT_FOUND ||
> +         (status == EFI_SUCCESS &&
> +          attr == (EFI_VARIABLE_BOOTSERVICE_ACCESS | EFI_VARIABLE_RUNTIME_ACCESS) &&
> +          size == 1 && data == 0) )
> +        /* Platform does not support Secure Boot or it's disabled. */
> +        efi_secure_boot = false;
> +    else
> +        /* Everything else play it safe and assume enabled. */
> +        efi_secure_boot = true;
> +}

I'm not sure this logic does what you want when a weird answer comes
back from GetVariable().

Also, you can't have this be a common function, yet ...

> diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
> index 7e1fce291d..b63d21f16c 100644
> --- a/xen/common/efi/runtime.c
> +++ b/xen/common/efi/runtime.c
> @@ -40,6 +40,9 @@ void efi_rs_leave(struct efi_rs_state *state);
>  unsigned int __read_mostly efi_num_ct;
>  const EFI_CONFIGURATION_TABLE *__read_mostly efi_ct;
>  
> +#if defined(CONFIG_X86) && !defined(CONFIG_PV_SHIM)
> +bool __ro_after_init efi_secure_boot;
> +#endif

... this variable exist only on x86.

Also, why adjust it for PV shim?  None of this is even compiled for PV shim.

~Andrew

