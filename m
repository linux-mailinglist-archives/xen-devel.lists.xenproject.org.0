Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C40BB1522
	for <lists+xen-devel@lfdr.de>; Wed, 01 Oct 2025 19:11:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1134969.1472441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v40Lm-0001kz-53; Wed, 01 Oct 2025 17:10:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1134969.1472441; Wed, 01 Oct 2025 17:10:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v40Lm-0001jY-2M; Wed, 01 Oct 2025 17:10:46 +0000
Received: by outflank-mailman (input) for mailman id 1134969;
 Wed, 01 Oct 2025 17:10:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JWtr=4K=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v40Lk-0001jS-Gv
 for xen-devel@lists.xenproject.org; Wed, 01 Oct 2025 17:10:44 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d8d00b4-9ee9-11f0-9809-7dc792cee155;
 Wed, 01 Oct 2025 19:10:38 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3f99ac9acc4so32244f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Oct 2025 10:10:38 -0700 (PDT)
Received: from [192.168.1.55] ([164.39.195.161])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8a6c3esm6494f8f.1.2025.10.01.10.10.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Oct 2025 10:10:37 -0700 (PDT)
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
X-Inumbo-ID: 8d8d00b4-9ee9-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759338638; x=1759943438; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KzxWwB99oP3l79lFc6FDqL9f4YkW1Rtp2Wu9wwUFf94=;
        b=PuRBufYVspHhdzSoS1bfzys7Q54j+vQBZWbkaU8mhQIU7laCeaonDqAlcMTiIa65I8
         Zo+TXZIseCPuHClC3a+baCSzhl+jBvfFDm/L6WApBQic+sic5uoAtUi6Z8wm6fZbWGdW
         yAktJZxVlPeCF2lLpLtJ4Avo0/TP9L6YyAXng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759338638; x=1759943438;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KzxWwB99oP3l79lFc6FDqL9f4YkW1Rtp2Wu9wwUFf94=;
        b=DsAhafT+zamPdDA0AOYObZjU9LRQL1OkQjBeGLQZMUGgTnzbzH6RVq2IJC5b9gVGJo
         6sB1P6VWgDCdbLRd8FOnbbcACtL/GIZ/Vpy+oIhutgD3tytJYWVm1r6iWKbU3A/vAsuk
         +k/aeAcw6nKZ5Gb9XN9wMr2cZQK1KUP34xyBP8u2h2MwVCViPmiHid+gkwYmvYyD/r8I
         pBViaRgB0SJg0SbleCdrtQ/sPJOkgzzjGRl2XGolTW9ctbH82GnLUu/RpKQSmw0hWaqf
         IxH9HeZ1oSub46nEIriSIVhndFcToSb3EI4+x4s6TGyK4ynzXRwXJlHT97cqWtcGuv40
         V1EA==
X-Forwarded-Encrypted: i=1; AJvYcCUi7XYiW5NDjFy3fNZHgEbIM6EXDtf0VsdRvtz/lThHT2UlNznlfQhAwWV4JBpt3pNomdPxt03lpTI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YydrkCCq0QggphDjX0MpIDZRttWWXon51R+WSw9LwWVjuq/cpcC
	GRkdFrAvNearAT+c8TL75ZfW3/V9E9YEdtGSPEDTeQ3BHpcxKh6/6VD0+CZDMHg6QhQ=
X-Gm-Gg: ASbGncvdyza/reGkFh7hZw7MDG+5Fy+6kGVpdZawaPb/1BbjNLz2fHsd5ETOYjh0CV8
	Rr80qdyNqvLOzsYfK3Tkh+FR0gnFtnjwIrfWd+Vq0Fydiy+qDVvKIEr0W00kWR6KnwJW1UILNPR
	28NlMcU76VvK72VbV68cZ1R46axwzUSS/Y0PvgDnJ3JfAmLnfUpxC0gHSWohWHcqdcAGWBadrea
	MSPFsweaOhqE5gY1006gjuyYCfhiDu+cfLHiLY70hfPcbDfW6osSmGsfLvaLl4FjpKDxeh8UAAc
	8fwomGH8iDy5RqzLBwV697PdfrsLNIEO3otuFRxOz+m5G/ZALDnXfgf9dPJ+MNDZSIEdLmqba9x
	zUvxzYYiC03mfzjypLqG/A2ffotTlEgNhL7knJNuLZ50Im9803exHTIQCmzuCOC43IAMFvMll
X-Google-Smtp-Source: AGHT+IFn1Yn9zHvul3DqXvxm444VQxKOtD6J7cBeK/MVQsyDDSov1cpw9kN0GsQjgqYOuYl/qrqztw==
X-Received: by 2002:a05:6000:290b:b0:3f5:d7c0:8e20 with SMTP id ffacd0b85a97d-42557816d55mr3370958f8f.59.1759338638283;
        Wed, 01 Oct 2025 10:10:38 -0700 (PDT)
Message-ID: <97b1a3cc-6e8b-4207-b467-4ab39396482e@citrix.com>
Date: Wed, 1 Oct 2025 18:10:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XTF PATCH] x86: Remove Xen as a hard requirement to run XTF.
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20250930085412.1643-1-alejandro.garciavallejo@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250930085412.1643-1-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/09/2025 9:54 am, Alejandro Vallejo wrote:
> If Xen isn't detected on CPUID, then:
>
>  * Skip setting up Xenbus/PV-console/shared_info/hypercalls/qemu-debug.
>  * Register COM1 as an output callback.
>
> This patch enables running XTF on QEMU-TCG/KVM out of the box.

When I did a KVM branch for amluto,
https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen-test-framework.git;a=shortlog;h=refs/heads/kvm
was what was necessary to get tests to pass.

I can see the need for MB1 going away now that KVM uses the PVH
entrypoint, but is the rest really unnecessary?

> diff --git a/arch/x86/setup.c b/arch/x86/setup.c
> index 2ac212e..6172c7e 100644
> --- a/arch/x86/setup.c
> +++ b/arch/x86/setup.c
> @@ -243,11 +245,19 @@ static void map_shared_info(void)
>          panic("Failed to map shared_info: %d\n", rc);
>  }
>  
> +static void pio_write(uint16_t port, const char *buf, size_t len)
> +{
> +    asm volatile("rep; outsb" : "+S" (buf), "+c" (len) : "d" (port));
> +}

I've factored out rep_movsb() in the proper place for library functions,
and without the rebasing issue reinserting the erroneous ;.

> @@ -255,12 +265,41 @@ static void xen_console_write(const char *buf, size_t len)
>      hypercall_console_write(buf, len);
>  }
>  
> +static bool detect_xen_runtime(void)
> +{
> +    uint32_t eax, ebx, ecx, edx;
> +
> +    /* PV tests always run under Xen */
> +    if ( IS_DEFINED(CONFIG_PV) )
> +        return true;
> +
> +    /* HVM tests may additionally run on non-Xen hypervisors or baremetal */
> +    cpuid_count(0x40000000, 0, &eax, &ebx, &ecx, &edx);
> +    if (  ebx == XEN_CPUID_SIGNATURE_EBX &&
> +          ecx == XEN_CPUID_SIGNATURE_ECX &&
> +          edx == XEN_CPUID_SIGNATURE_EDX )
> +        return true;
> +
> +    /* Viridian guests have the Xen leaves higher up, so check there too */
> +    cpuid_count(0x40000100, 0, &eax, &ebx, &ecx, &edx);
> +    return ebx == XEN_CPUID_SIGNATURE_EBX &&
> +           ecx == XEN_CPUID_SIGNATURE_ECX &&
> +           edx == XEN_CPUID_SIGNATURE_EDX;
> +}

This isn't quite correct.  There's a find_xen_leaves() helper which
should do what you want.

~Andrew

