Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C081CC64AA8
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 15:37:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164056.1491077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL0M8-0005xx-Id; Mon, 17 Nov 2025 14:37:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164056.1491077; Mon, 17 Nov 2025 14:37:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL0M8-0005wE-FE; Mon, 17 Nov 2025 14:37:24 +0000
Received: by outflank-mailman (input) for mailman id 1164056;
 Mon, 17 Nov 2025 14:37:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Jhw=5Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vL0M6-0005ZT-PL
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 14:37:22 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed5a8193-c3c2-11f0-9d18-b5c5bf9af7f9;
 Mon, 17 Nov 2025 15:37:22 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-64162c04f90so7138732a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 06:37:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-644f13ff4d4sm893247a12.12.2025.11.17.06.37.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 06:37:20 -0800 (PST)
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
X-Inumbo-ID: ed5a8193-c3c2-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763390242; x=1763995042; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Pi3hAuAMJUxmVpqdTz3Up9yhIVz/lddzqlLZoEEpb3Y=;
        b=RvbtP2u5m2d/rQ5SI0xoWx/CitlxRnJj264SMUw1LxHRc2Oy2NQO2SnQLUJqxGCTsa
         7Z+K+mnwfzgVf8A+X975gsJrMTKet6mXBxgKC5pkVIEOv6kL8gHXVvGpQfGSptpWP0yn
         yXpZw07OQcS08j7z2bWmMFPBvmQfQ54oPO/kx1YUcou67Ur1xSNOPLV+j1Mo4Jkq0uDK
         3CwoF+PwiPlz0MeJd0SFp7kuCVbSNdkiK6+EjrjsLyFnNn8lJYpjU1tjCpO2VB6g6+za
         1SMSoxxRUroN8A17ep9C0XTbgedu9JQdKjy4r03yydSdNBS51y3iS22nFi2rzCiBdnZy
         B7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763390242; x=1763995042;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pi3hAuAMJUxmVpqdTz3Up9yhIVz/lddzqlLZoEEpb3Y=;
        b=oFEqW2XXM31+SXqz8ei/TEK75ivL+8RCNhzBOgBL3Fc/HnIKbqc1IcJG30MouGdvgI
         d36QYlvjjsSkC+ZxF0UkawnhfiBZAQzCDI11S06rXcsYg9eBgY8b/Wti9oQzkKJJ57cb
         i6FKl8bF26/zbFdLk5Yl1BetzpP20T711L7DFuQL+buisu57Mx29ETXZESDHHLK1JpqV
         0UDF2onUy8B9dwvmAbqWUYY8I9Kxt397yhkatgWj+iwcy21U3cMGKTCXOtP0OSLK4J1Y
         NQmMJbqXDaZZYmJEN4yLooqdAatZVfOWxHQlF9sIUYKyByCgd/uUrNsHZMRuuCxFf2/G
         X06Q==
X-Gm-Message-State: AOJu0YzCjc1PyEZgVTWmxtkDRR6Ejhwypr8e3kKt/sOHOgowqibRejNk
	AGNd7D7I5JZa+X63g8LBHoHsHpaf5phVIA4xjnpyZ3vcbLeg+GHD0XdaEIG/Ia2E1Gv39Duaz+S
	eQTk=
X-Gm-Gg: ASbGncsFuToW6x90LApVQ0qdbAUSAlpaqub8HcAwlta8x/1/JyUYp6DW47iBetMPuOe
	SiPJhNjwziv/zsTRNkb+5wI40DpL2s3aVaMiXwZ1+rwOUj8hGL0ZrPoSj3opoviFmbvJWWkeWbQ
	tkHy33pLO/VLVISqmaUFjXtR+c1l4+3UV6Mp5PTXYOkmEtgmBTIANIBBqkcIzejuywtd9Kw0CIZ
	mubROWmnLoqRlV61TxeRIRkJYxzC1bYt1wroVg/xMUnj6Z7eyyCIZREugV2eZzyECqb800PK1i+
	n5NT63uSiOOWu3GqL7B1OMudhG83PsTeMttErYA8djB5IWN3haD8NL9QD2k9J4QG6fIsXQZ31Ak
	esYv1t+NVlIV9ZnOksB6FM6gWepUXF+BLAqkg1fuia8txasuSO+Yn6KbxwQhg3nUKPUFp3WgTig
	llHv9z9Paeno3Z9wlXrhFQa5fY/dj6nsTXjFAhof7+cka90FdmiUZjT044bUlLXZBDumFFmXExr
	o8=
X-Google-Smtp-Source: AGHT+IFniZkxnTJdJQe9SScifhauIDQBS+wodcuIYDT2WN5jhRL8z9Lkoll/wu84wNy3F5AVzLg9gA==
X-Received: by 2002:a05:6402:354e:b0:640:ba44:c731 with SMTP id 4fb4d7f45d1cf-64350e76377mr9584890a12.21.1763390241623;
        Mon, 17 Nov 2025 06:37:21 -0800 (PST)
Message-ID: <757cba5d-2c9f-40ae-8eae-6309979bbba5@suse.com>
Date: Mon, 17 Nov 2025 15:37:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 2/8] x86/HPET: make another channel flags update atomic
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <57f34114-54b7-483d-8ac0-e9fa49df959f@suse.com>
Content-Language: en-US
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
In-Reply-To: <57f34114-54b7-483d-8ac0-e9fa49df959f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Unlike the setting of HPET_EVT_LEGACY in hpet_broadcast_init(), the
setting of HPET_EVT_DISABLE in hpet_disable_legacy_broadcast() isn't init-
only and hence can race other flag manipulation (not all of which occur
while holding the channel's lock). While possibly any such updates would
only ever occur when HPET_EVT_LEGACY isn't set in the first place, this
doesn't look straightforward to prove, so better be on the safe side.

Fixes: d09486dba36a ("cpuidle: Enable hpet broadcast by default")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -729,7 +729,7 @@ void hpet_disable_legacy_broadcast(void)
 
     spin_lock_irqsave(&hpet_events->lock, flags);
 
-    hpet_events->flags |= HPET_EVT_DISABLE;
+    set_bit(HPET_EVT_DISABLE_BIT, &hpet_events->flags);
 
     /* disable HPET T0 */
     cfg = hpet_read32(HPET_Tn_CFG(0));


