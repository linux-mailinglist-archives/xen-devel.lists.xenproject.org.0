Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F00CFB1E6EF
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 13:05:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074315.1436976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukKun-0003Ot-C6; Fri, 08 Aug 2025 11:05:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074315.1436976; Fri, 08 Aug 2025 11:05:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukKun-0003NB-8z; Fri, 08 Aug 2025 11:05:37 +0000
Received: by outflank-mailman (input) for mailman id 1074315;
 Fri, 08 Aug 2025 11:05:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dtzj=2U=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ukKum-0003N5-F9
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 11:05:36 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9bceb895-7447-11f0-a324-13f23c93f187;
 Fri, 08 Aug 2025 13:05:35 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3b78d337dd9so1212647f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Aug 2025 04:05:35 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3abec8sm31176637f8f.8.2025.08.08.04.05.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Aug 2025 04:05:34 -0700 (PDT)
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
X-Inumbo-ID: 9bceb895-7447-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754651135; x=1755255935; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gUT/hYCVu68Lcst+jSP/HdnuEfocUhU3Co36eEiQWpA=;
        b=aeGLCEZUD3+j3uS0+y98z6+xtrBvRK2T/eJ1lle5cma23+W5dOG43RK4ZCvorgXELc
         WntL80Be6s0zcJMDNbMxUE5c4P600tq/auu6VOqWhzzYZX8JrIVpAFULZmZ0/VyQvSXb
         E13mqDXE/+xRQ9ri15X0na0AyMCazAG6kLZzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754651135; x=1755255935;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUT/hYCVu68Lcst+jSP/HdnuEfocUhU3Co36eEiQWpA=;
        b=l9QVeW7zNUlK11EO2KbVFgZFnjKhFHNakFe2eqyjHNODSCj4Q4s20aBjjOFuEaYnt2
         zNVBaC7qBpNcvyah3EtrBJIW2syDDaEPn1UgWLOM4luBfaWl1c9mTeKYdSTC6XR+WkvC
         hPAW6U/tWVlOrgCB89X8JdL7GQC0Ie5+BHV5pnslJ6ofP/goT83UYqchsJCv05n+20T2
         pfFQZSIKYUViyuFdGh7jeJpC4RYP2lxs1X41jvwkH0IBAWOH30GBRuVqRQTv7TDocuzU
         L63HjP4b6+FvqGlPI9OD1/kH5EejSDc7TFO0RtHm86VBdC6AOofDMwFCHdiJbW6SUx1R
         kcFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaZ3O+A62isRHQXiRlwt9kOt3W9+SZxy7BR8Qmyq8ot2EcPZwiWEOAm+xVZK5WVMd1zQANyrPYZ2s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwkZpZmk/+jgBvXBAISmPmdBaztAwGl9Q//XbZbEQyHmfVNU2Y5
	MyIw22dLddHCq/E1LiBDDm4QGUINL45IyWcSayw45cTSa9s1zJwYYiQTAtsfu4NxdlQ=
X-Gm-Gg: ASbGncugGMZIM9dsPL/h5Q16LH6ciWGrTeZ7UKOClJiU+btOq+a9on9tLYqM7At5MW7
	1gaYop/D6aSVCdke8o8VrSVbwzrzsJpFV8AlzmF5fsAjmHA+Zj9XIVHLywMrxJNn00nPiahmksl
	FvYl4PHLNRgFaGr2ysKwoihWDrDhBdVQhBJK3VZV5Wi2Do9lC0r1dVUODzfRV2pFWIvuzqV+gjB
	m/skLHsxq8xm9tmsO6EjcnW3A5d5nzir/gxIg2ffJEHSBePrYe8a32amlv5IU3LaQT5Xglwmqdk
	0dVJUci49apnOiCtUYgjg57pGxP0Gp5Qk9LD85I2rWfVQxvj7rL4n4TeUQlq4phiF9YmhJfgUY8
	xqLXRgwAwG8GO+6xZvGRQBFULiw69vbNC0YzSSQrtVUdok1kvpEyd+CKmroZ07xH8JyXH
X-Google-Smtp-Source: AGHT+IF55V4ZIK0zJtzM5+9CRL05tbVVcZLHon75wjCLTio8NtGVKURHPAV5uf2l3tmOITaWTbywhg==
X-Received: by 2002:a05:6000:2386:b0:3b7:90c7:3277 with SMTP id ffacd0b85a97d-3b900b2d94amr2003293f8f.17.1754651134847;
        Fri, 08 Aug 2025 04:05:34 -0700 (PDT)
Message-ID: <1285633d-de71-42ba-89cc-993f8ac574c7@citrix.com>
Date: Fri, 8 Aug 2025 12:05:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: Remove x86 prefixed names from cpuinfo
To: Kevin Lampis <kevin.lampis@cloud.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, roger.pau@citrix.com
References: <20250808104349.635091-1-kevin.lampis@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250808104349.635091-1-kevin.lampis@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/08/2025 11:43 am, Kevin Lampis wrote:
> diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
> index d60a07bfd5..95a626f49c 100644
> --- a/xen/arch/x86/acpi/cpu_idle.c
> +++ b/xen/arch/x86/acpi/cpu_idle.c
> @@ -1059,8 +1059,8 @@ static void acpi_processor_power_init_bm_check(struct acpi_processor_flags *flag
>       * is not required while entering C3 type state on
>       * P4, Core and beyond CPUs
>       */
> -    if ( c->x86_vendor == X86_VENDOR_INTEL &&
> -        (c->x86 > 0x6 || (c->x86 == 6 && c->x86_model >= 14)) )
> +    if ( c->vendor == X86_VENDOR_INTEL &&
> +        (c->family > 0x6 || (c->family == 6 && c->model >= 14)) )
>              flags->bm_control = 0;
>  }

One of the purposes of the name change was to audit every use of these
fields for safety.

This is an example which needs reworking.  It is technically safe with
Family 18/19, because of the way the relation works, but


> @@ -468,8 +468,8 @@ static void Intel_errata_workarounds(struct
> cpuinfo_x86 *c) } } - if (c->x86 == 6 && cpu_has_clflush && -
> (c->x86_model == 29 || c->x86_model == 46 || c->x86_model == 47)) + if
> (c->family == 6 && cpu_has_clflush && + (c->model == 29 || c->model ==
> 46 || c->model == 47)) setup_force_cpu_cap(X86_BUG_CLFLUSH_MONITOR);
> probe_c3_errata(c);

This is one which wants converting to using real CPU names.

Also, this really cannot be one giant patch.  It's unreviewable by shear
volume of change (and isn't a mechanical change that can be trivially
confirmed).

Perhaps start by doing a patch covering mcheck (but even then you've got
one conversion to a real CPU name I can see), and one covering vPMU. 
They're both not oneliners, and about the right order of magnitude for a
change like this.

~Andrew



