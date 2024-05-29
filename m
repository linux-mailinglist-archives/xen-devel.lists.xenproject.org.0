Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1798D3318
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 11:33:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731756.1137437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCFgc-0003C2-Mh; Wed, 29 May 2024 09:33:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731756.1137437; Wed, 29 May 2024 09:33:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCFgc-00038q-Jm; Wed, 29 May 2024 09:33:34 +0000
Received: by outflank-mailman (input) for mailman id 731756;
 Wed, 29 May 2024 09:33:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mTS/=NA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sCFgb-00038k-98
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 09:33:33 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83552b71-1d9e-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 11:33:32 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a62ef52e837so197980466b.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 02:33:31 -0700 (PDT)
Received: from [10.125.231.30] ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c817b0asm701607466b.3.2024.05.29.02.33.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 May 2024 02:33:30 -0700 (PDT)
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
X-Inumbo-ID: 83552b71-1d9e-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716975211; x=1717580011; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Tq91sQ7nMEnbVq0UOMM1nyvnrVt5+YqmvGQDF/9V2UQ=;
        b=f6Q1vi5WdRumZePjXpEdl7AZGNdTOoPfibQjIGLeVAd0cdnNrLaGbdgpRMifH9wcpc
         XZgJOrEZHjgfjIMgBsDglfVC+qdTZWU3r2L8DlH/GH0MlA5OcPOgq41y0sb8v/XOGShX
         ZfsKX/vDQeqXK/jwxYLO1PhwpYvkhQkv7nIh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716975211; x=1717580011;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tq91sQ7nMEnbVq0UOMM1nyvnrVt5+YqmvGQDF/9V2UQ=;
        b=qmqdBOounqH0t6XXHdNhygTWDyTlpOLERAI4ZXr6S84qtEE5aZn93ATFlUwPolaTm/
         KFDlXaQ8xb4EjFnU5TTCMm7ZZOOJx+0Bwfn0+5VJFblvxfuHRs9x7HpdZO7xSKOqY2tu
         NM4Q0/a3oyqeNWJSt9pmMljTedLXNK6Pu7DdctR2qZh5rQ6cTCEBze4MZF2aUEVyDTbi
         Pc8PDkOjWyjVpTbnhI3zGt2zvE9kCsgZQEq4IUnck2u83NE6sF83PswykKeFxwOrpYRT
         L34a8F5LDWDMwstGVpnzexoyKtOUgiUfPvJOQf35ApsS/s1AiZFnNfC6dK7eSkpcyPyJ
         Fh0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVt5csBIEn4VCEudvgZxkwDrOhUSXzmEs4p0aRqm71zDVwtXkqtDN2d8goI+kXYMuEFcEoRGS55ds2XSjxJl8IYPJ+y95mxfd8VsC/SoBQ=
X-Gm-Message-State: AOJu0YxpvjB7MQFQCSgrAtWu+NAtr6OYGs7h6Lc1vPaSJQy8a3VTN1zK
	EQTBOYxQM8tggaSvhPU3YMwni1EPkuINb1oPg6XZ3IMkA211rkOMwYYwmJGQBNI=
X-Google-Smtp-Source: AGHT+IHEyyNHbJ24rsoHkCw6+E/xiD3ZDWVl4a+VTsiyXAhQb9bZZoRJ8Ip2j14k9ziLuOLJ3T1QvQ==
X-Received: by 2002:a17:906:1945:b0:a59:b807:330a with SMTP id a640c23a62f3a-a62641cf941mr1040170366b.32.1716975211237;
        Wed, 29 May 2024 02:33:31 -0700 (PDT)
Message-ID: <85b946d8-9f14-480e-9c47-20ace4587f4b@citrix.com>
Date: Wed, 29 May 2024 10:33:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 9/9] x86/irq: forward pending interrupts to new
 destination in fixup_irqs()
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20240529090132.59434-1-roger.pau@citrix.com>
 <20240529090132.59434-10-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240529090132.59434-10-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/05/2024 10:01 am, Roger Pau Monne wrote:
> diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
> index 6567af685a1b..4d77fba3ed19 100644
> --- a/xen/arch/x86/apic.c
> +++ b/xen/arch/x86/apic.c
> @@ -1543,3 +1543,8 @@ void check_for_unexpected_msi(unsigned int vector)
>  {
>      BUG_ON(apic_isr_read(vector));
>  }
> +
> +bool lapic_check_pending(unsigned int vector)
> +{
> +    return apic_read(APIC_IRR + (vector / 32 * 0x10)) & (1U << (vector % 32));
> +}
> diff --git a/xen/arch/x86/include/asm/apic.h b/xen/arch/x86/include/asm/apic.h
> index d1cb001fb4ab..7b5a0832c05e 100644
> --- a/xen/arch/x86/include/asm/apic.h
> +++ b/xen/arch/x86/include/asm/apic.h
> @@ -179,6 +179,9 @@ extern void record_boot_APIC_mode(void);
>  extern enum apic_mode current_local_apic_mode(void);
>  extern void check_for_unexpected_msi(unsigned int vector);
>  
> +/* Return whether vector is pending in IRR. */
> +bool lapic_check_pending(unsigned int vector);
> +

As a minor point, we've already got apic_isr_read() as a static inline. 
This wants to be a matching apic_irr_read() IMO.

~Andrew

