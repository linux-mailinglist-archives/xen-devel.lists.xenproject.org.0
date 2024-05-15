Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D86C8C6770
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 15:35:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722355.1126211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Emv-0001dj-08; Wed, 15 May 2024 13:35:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722355.1126211; Wed, 15 May 2024 13:35:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Emu-0001cK-Tm; Wed, 15 May 2024 13:35:20 +0000
Received: by outflank-mailman (input) for mailman id 722355;
 Wed, 15 May 2024 13:35:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EWeN=MS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7Emt-0001cE-Is
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 13:35:19 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7f9eb4b-12bf-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 15:35:18 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a5a5cb0e6b7so175080166b.1
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 06:35:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a813cd3dasm234533866b.45.2024.05.15.06.35.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 06:35:16 -0700 (PDT)
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
X-Inumbo-ID: f7f9eb4b-12bf-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715780117; x=1716384917; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5lVIV7SdRR2/xZ3RC6TEhrkP/iWMaqIOeKVzrJaSm3g=;
        b=Hb2tUNo/9DNFCBqEkVPHdpKP4+2n/OtD0cwa4rpVb5EKonp88zWPGis+UdR2Cmz6He
         KEry5AdxGkQ7W3kAWtsCaWmSjIP1vaplZpT4X5xbVqa17NxgCbL8jzdyqklWFV32n/uf
         xJnnBOSOzB5qyZGhHzThl3J4FfOrFmNGZB2DwW1WBGsUp3fJUKka0bK8g6SBReIFEZod
         /+GSPbMtv46Z/iwOBdAb2jSDJ2/gsLOSZX3yqYVrxTnE5aPUfdAHygRTIeH0tHKPtd94
         XjAbx42m8H+rJ5bIFhGDmfG1eIobli2qk27hl1itOhFtimlbUoovJI3ooRJ3BUseoGFo
         9hMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715780117; x=1716384917;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5lVIV7SdRR2/xZ3RC6TEhrkP/iWMaqIOeKVzrJaSm3g=;
        b=B78VoZzSj+bZmEGv8tEbrEF2pPxp81s/veheyw//Rl15jLgPd8qBbfMGwOaS54m3NZ
         6mLwfIXBN7ucHUYOBOH0A0wCPZ6oYCHVJ7ZSiJWhHLnbZ7YjXmtIr5tJ1Q8nXLv5CPSb
         LHYOOYfXTYdi5X63g0XhabFqqmHXpJZ04qFm35ag7OHqtSzi5qgJUW41fHK2IOiL+QkQ
         0IzjQ0Mg0nPI/IZayhWJu7G4icrnH7ULAxe3kG+3sAzoHhfx9uCAVPwhcmNZcWbbW4Ls
         f8Xl27XdbSw7t+JruvqSdcbH+5PhQeMjn1ID50xNSTaxnoS35zZkyAjGC5pD1/L0n4Fi
         BJHg==
X-Gm-Message-State: AOJu0YzwyyWzCp6jpgizrkfXFt6pk7cNB3xGUozFGoG5zeyxaQiyCm1+
	j8Btb7DJy20GSjUsdyi2reziYJodJ+VTzX+eymOu/2n69iMVz8RaapWijf4Mm0uHxi+wHMwPXng
	=
X-Google-Smtp-Source: AGHT+IGBXko6mFBtn6CS5dy/lVH8hKVKaXD08OXyKoSaF3VDf1vRICSGMwM8FHnGBByynCOaBQDAmg==
X-Received: by 2002:a17:906:22c7:b0:a59:be21:3577 with SMTP id a640c23a62f3a-a5a2d5cd472mr1026405166b.43.1715780117637;
        Wed, 15 May 2024 06:35:17 -0700 (PDT)
Message-ID: <dc80cf26-8900-4848-84dd-6f3e47d59f57@suse.com>
Date: Wed, 15 May 2024 15:35:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Elias El Yandouzi <eliasely@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: respect mapcache_domain_init() failing
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The function itself properly handles and hands onwards failure from
create_perdomain_mapping(). Therefore its caller should respect possible
failure, too.

Fixes: 4b28bf6ae90b ("x86: re-introduce map_domain_page() et al")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Effectively split off of "x86/mapcache: Initialise the mapcache for the
idle domain", except that the change to respect the error wasn't even
mentioned there. Plus we likely want to backport this.

--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -858,7 +858,8 @@ int arch_domain_create(struct domain *d,
     }
     else if ( is_pv_domain(d) )
     {
-        mapcache_domain_init(d);
+        if ( (rc = mapcache_domain_init(d)) != 0 )
+            goto fail;
 
         if ( (rc = pv_domain_initialise(d)) != 0 )
             goto fail;

