Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE73F93AD90
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 09:57:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763836.1174171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWWrd-0002gW-8u; Wed, 24 Jul 2024 07:56:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763836.1174171; Wed, 24 Jul 2024 07:56:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWWrd-0002el-5c; Wed, 24 Jul 2024 07:56:45 +0000
Received: by outflank-mailman (input) for mailman id 763836;
 Wed, 24 Jul 2024 07:56:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D33k=OY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sWWrb-0002dO-Vm
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 07:56:43 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43809e0e-4992-11ef-8776-851b0ebba9a2;
 Wed, 24 Jul 2024 09:56:41 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a7ab5fc975dso19691166b.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 00:56:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a92dddccdsm162227466b.79.2024.07.24.00.56.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 00:56:41 -0700 (PDT)
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
X-Inumbo-ID: 43809e0e-4992-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721807801; x=1722412601; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Zg5TTElUNPOWDRdPE4JFJtFqpfHGgOG+47kNLVUVaYk=;
        b=QCIK2ZvZeLEQysOaGV1WGplYXvhudH2mzwH6yBGTfZTy3KciYV2DE4O9TBHlPDI6na
         C8k5K9ZOBbbr/MOLu2LJuKsSBGRRRWESb5UtY+qikdLLUqh6sdOFoe2HHj6auP5FyZZK
         Rh6EJ73KAHlLBqX6VsrxzXjd6bjnkVwqUJ8r0fPPBJMvyd82ItlVyMkimR9eNzyFIKJb
         U+5u1e8srjQIeUPDHdBqakrmzc337qSpoAGS/92ezvADTAcL2IGrFt1+VD77LpYF6ZCp
         C2uYhvSqjqkytlkqyn4hOwjngYEqHvkUR1bI4F2R/PYFbeZ1Uus00hi08F1+AY+owpAT
         cOyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721807801; x=1722412601;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zg5TTElUNPOWDRdPE4JFJtFqpfHGgOG+47kNLVUVaYk=;
        b=PBCHhTZWyuNACjValEhh2d8/U98Tjvwr32O5XO6sOMhff85W8xMEj5FUgG8BL7QZla
         strtzibwWUpnM4B1LZrIdNtVry/REqbFk8WqLjZ1Q1xmitf6I9+4vhhgHFDRx9Si6eM2
         bio1tN2ZTrQodZfXwExxfA3qL8R9DEFkbrKDtOiGRg4BkqgDL15r7wezMaR0HMRFAuOh
         cOWNiJLK2nv+J0UG/UPi8YOQOU01ZP9duVN5uAEMhgoQRhW86eUJWKdb1J/hAN2CBUih
         7Qw/CqwIxI28yDv/aa18hZQg4CMB7UHanN+UDrh6RFIzSoSdBkaWJrnLKegBAlgjjySs
         twUg==
X-Forwarded-Encrypted: i=1; AJvYcCUp5B0CDV+fM5OzONNXrjPWvxVsbebvDC20L9KZShg0UkisgzJRpA/vIigo20s0sSfJJnjG6I28IzDnaIOul09WHzNCBK4CWlTZ1j8y0u4=
X-Gm-Message-State: AOJu0YwjQ3yu9lsYLT3VgDQqLdoMZ7mmzrqex678TRsY34dVh1WT0Egd
	XiWiOc268cK9WVvlLA4WzWaYyyP/JwykCZiYcY7FPi15o4v10OXEeQJ3deHNVA==
X-Google-Smtp-Source: AGHT+IE9fxggadT2mF0F48MFKOLZBPQtE3LJO+wNeyTGjk2T3RiPKYops5mNJvl2dUXEIusfji6AZQ==
X-Received: by 2002:a17:907:7f0f:b0:a7a:a5ed:43d0 with SMTP id a640c23a62f3a-a7aa5ed4babmr194344766b.47.1721807801325;
        Wed, 24 Jul 2024 00:56:41 -0700 (PDT)
Message-ID: <14104805-0f0e-4741-877f-24afffc816ce@suse.com>
Date: Wed, 24 Jul 2024 09:56:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/IO-APIC: Improve APIC_TMR accesses
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240723203701.208018-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20240723203701.208018-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.07.2024 22:37, Andrew Cooper wrote:
> XenServer's instance of coverity complains of OVERFLOW_BEFORE_WIDEN in
> mask_and_ack_level_ioapic_irq(), which is ultimately because of v being
> unsigned long, and (1U << ...) being 32 bits.

Which of course is bogus when the shift amount is masked down to 5 bits.
May I ask that you express this somehow in the wording.

> Introduce a apic_tmr_read() helper like we already have for ISR and IRR, and
> use it to remove the opencoded access logic.  Introduce an is_level boolean to
> improve the legibility of the surrounding logic.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

The change is an improvement irrespective of Coverity's anomaly, so:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

