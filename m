Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5CBAFB64F
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 16:45:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035611.1407942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYn5D-0001qV-5a; Mon, 07 Jul 2025 14:44:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035611.1407942; Mon, 07 Jul 2025 14:44:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYn5D-0001pf-2N; Mon, 07 Jul 2025 14:44:39 +0000
Received: by outflank-mailman (input) for mailman id 1035611;
 Mon, 07 Jul 2025 14:44:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hmpo=ZU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uYn5B-0001nr-Ni
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 14:44:37 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e515508c-5b40-11f0-b894-0df219b8e170;
 Mon, 07 Jul 2025 16:44:32 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a54700a46eso1655474f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Jul 2025 07:44:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ce359d1a7sm9839677b3a.11.2025.07.07.07.44.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jul 2025 07:44:31 -0700 (PDT)
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
X-Inumbo-ID: e515508c-5b40-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751899472; x=1752504272; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wZ9X5Hl3s9FGJpP576JGKdMgnAcD5xuEh3S3sVqmHtc=;
        b=a4f4OX8CRNwaOGB0DCwlp+ihi1l3Az/tmrKufGbVvk7KXiTu8YaUyJhwNYwitFY/Co
         O6vXsGOEYH59vkNlgpoKCk+XLMd2BNT6mfHOfFUW3h+czgtcXPx1tLe0Jm/g/USXqCWh
         zzMr9WJP5o31XmXP49auEKI3a/UIQYSetEBeOZrzUGwSLMdKGfmkHOh6DlyprSRWiDIz
         Rbl5NMpA8Hmxi1nmb1VcWBM0URJ0C/HspfmsWkVRJzUGgpJJU6fOkJ1VCHPFi8YGeCiY
         vHB8R5/3zUqm7vCX2VIo+M9q3oMOT3yD2rJm83ohT+ttTmshTKN5G9TN+2U4+rc5lVtk
         2M2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751899472; x=1752504272;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wZ9X5Hl3s9FGJpP576JGKdMgnAcD5xuEh3S3sVqmHtc=;
        b=ARzTpSCQAe20lMTDe6/FGi/FYaDQTgiBsD7Q4euHGkw9+aqA0Fh0jHf1CjLtZRaifD
         6VvCsv+NVW/EIAPiHbZQeRbIESl3ZUIdK0TYY6R0euEAcdO/COoP9fJa1MHZU3QvEHJE
         hdVK8GnGdCMbTODp3rFyW4v91ZYtgqF06HL6MAXEm1W4g41MNPnMgn+I7JMzsXFmnZdD
         4J7dPQZDAc8oFzdvt+KpflnBqvn0eWiBGbEywbENJg96eNcrwupA57vS0H0yRe9YwGWl
         1FY2EiKA4eTLTxkgcz1bcRlPgjdngFcdhDlIMjOArleKT4XmKCzUMB0a6QV8nc0UIVkE
         PMzQ==
X-Gm-Message-State: AOJu0YwtVZV9k4S28hsqiUcZ7d4Znh5e3EV+67gHTOxcoJu23TF+Qu7w
	YAkegjH6j7BRFIXIAXtJZHZi32Sauah5r4UFUlIW2kdjR1cdsuPbezLsHAD/sPiY6R0AZQmR/AW
	FlIk=
X-Gm-Gg: ASbGncsy/mjy11zAOE4RNKVpufefHBg3hNAXUSBuVzI0ANcw/O+VIRXb9/vzOdurLzj
	0b2n0GesqeX7mCeGJ2duYbn5Mexw+yQpiBbRPchkuXmmLG+jqG18TK7TVDJGGLFKd70ylAAOxhb
	+/n3ar+HW3gxH1m4Ik4JmxI0I6VprrE3rxm2WHkQVVH221pHZM7HKi0NPWh9710d6L+S3pElQ5J
	n1J+NIgUJLvDwCJ1NwaLGgL5QIVgvvtonpEFyOEdVGAKrKXwPHIoa7xPcVWln4HnWrSgu1CLlt/
	/DC2oufCxboJ5CpslB45YCf+ooeS63Ot8i+lgTyp6XtNiRMqrqFRAZ9+a+GXKjo1jtu8dz4dD3L
	o2O8wPtQjWRQaO4pJ3D+DqUn68RqKhNRVciZEVd7KcmyeuLA=
X-Google-Smtp-Source: AGHT+IEzDvjfjeZWVac6LpeDmNwrRsFNY9S/cPxtNEt7U/Hg1PmDITUgnwhNySYnMhbCu/N6v1iHcA==
X-Received: by 2002:a05:6000:41d4:b0:3a5:2ec5:35ba with SMTP id ffacd0b85a97d-3b49aa990f6mr7216842f8f.30.1751899472275;
        Mon, 07 Jul 2025 07:44:32 -0700 (PDT)
Message-ID: <664472bb-b375-46eb-999e-34f983275d92@suse.com>
Date: Mon, 7 Jul 2025 16:44:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/PVH: extend checking in hwdom_fixup_p2m()
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

We're generally striving to minimize behavioral differences between PV
and PVH Dom0. Using (just?) is_memory_hole() in the PVH case looks quite
a bit weaker to me, compared to the page ownership check done in the PV
case. Extend checking accordingly.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The addition may actually be suitable to replace the use of
is_memory_hole() here. While dropping that would in particular extend
coverage to E820_RESERVED regions, those are identity-mapped anyway
(albeit oddly enough still by IOMMU code).

--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -184,6 +184,22 @@ static int hwdom_fixup_p2m(paddr_t addr)
          !is_memory_hole(_mfn(gfn), _mfn(gfn)) )
         return -EPERM;
 
+    /*
+     * Much like get_page_from_l1e() for PV Dom0 does, check that the page
+     * accessed is actually an MMIO one: Either its MFN is out of range, or
+     * it's owned by DOM_IO.
+     */
+    if ( mfn_valid(_mfn(gfn)) )
+    {
+        struct page_info *pg = mfn_to_page(_mfn(gfn));
+        const struct domain *owner = page_get_owner_and_reference(pg);
+
+        if ( owner )
+            put_page(pg);
+        if ( owner != dom_io )
+            return -EPERM;
+    }
+
     mfn = get_gfn(currd, gfn, &type);
     if ( !mfn_eq(mfn, INVALID_MFN) || !p2m_is_hole(type) )
         rc = mfn_eq(mfn, _mfn(gfn)) ? -EEXIST : -ENOTEMPTY;

