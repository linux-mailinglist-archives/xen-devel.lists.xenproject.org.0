Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9805FA3BB15
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 11:02:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892572.1301537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkguf-0008Jt-KY; Wed, 19 Feb 2025 10:02:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892572.1301537; Wed, 19 Feb 2025 10:02:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkguf-0008He-Hv; Wed, 19 Feb 2025 10:02:41 +0000
Received: by outflank-mailman (input) for mailman id 892572;
 Wed, 19 Feb 2025 10:02:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EceQ=VK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tkgue-0008Gq-Ta
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 10:02:40 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a76f3afe-eea8-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 11:02:40 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5e04861e7a6so6469766a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 02:02:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece1d369esm10052897a12.37.2025.02.19.02.02.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 02:02:39 -0800 (PST)
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
X-Inumbo-ID: a76f3afe-eea8-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739959360; x=1740564160; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=huuHSTKz6FBv2yxIimfejyNJTPN9uGmFSxcsvfxxhg0=;
        b=PEHuxhilNFZMCjcCLOKstjPd7gpHoT3eO60FGjwR+JuEmxPg/YAQjTpT1AdZRXwmoq
         ofuV3hzXLgZmjG54RJHfBKR56Z5etedaotU3sF9Cy/PWCYVfCwa2noVZDrhvoRjf6Cnm
         71CgiT0mjWvHdrJQlWBFmssN6vEuU6TYPrRx6qsx9jWdYw8UkWWJXUUrkQfd8TsUAVSS
         qV1DyOpiTEQgeVRJSmIYO8mzxPSmHOhG9iKZVObDSGdUUuyE/Ao1lxNMDYlfeJmaHZIb
         sBFXnJv58b2FCbmUYJhf1zw2bJs2wLiYXMurjGHCgMEyU3JbyQEpXPPsEwT6AItuS6P4
         SoqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739959360; x=1740564160;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=huuHSTKz6FBv2yxIimfejyNJTPN9uGmFSxcsvfxxhg0=;
        b=CiqAVd3fzbpGtZFDi/4holvsWdHrCnZBtlm8azaDN+YNOhhCi3yV7H/qhO94jI67k4
         PKy7IBI4knN/PkavLR4OiiR8q0+7T+AfzsawRONoVXwwg8azUSu9N1niXLzJUg43tuXc
         iDKlPOrUy7gfGZw4Q3e4s25y3ISJKvipVu1fpY7ktI+BgyCc5HJsIcegMT4lEXid7oAj
         8RpzRLQwvH4XhRB5L0qD+O8p8GSTrhN9C81MeN/3oyzB1UeGbJt4InjJWKq++UP4JAcl
         V4B+4ZprjsQeGeFhM0fxSvLEPh0zGia7H30Vc4jCLhNIbz30UFBXlpF1HiwuyEwGCMPo
         2Lzw==
X-Gm-Message-State: AOJu0YzkzPM77S+BPZfdnqEU9k5aLw/IjLObp/wRI4NvXbSu4tXSvLY4
	qs/Z1ohFbecXWushTglOaYoE/VQ+jBCvSPzJ/rVOfLXLL5+yZ8KuoMoNParKy1BYoDiDMigLkbA
	=
X-Gm-Gg: ASbGnctUgL4bf6LyhSpMxabvE4Hs/PcSXEdMIkKt7PjjbxlpQKhBcAEWcga8fYTsfAf
	YuRcDSnR9V9MboVf4oe9gVosp61a2DLHJgVvVhFYKkEdRpeWhW0ATGt5wu+KbVgO0nR2b/AXgnV
	4bXySrUWIduZRL00DEZV/8SoiGf2/IQjr6aa5ZY+rfqb9DRIJhQgqE1PuGSRSnGKVbLNPfUuAj5
	WF3lvT6EdabGUj/CJrUe1dX9hAB6sVQHT+QviqIzJhisixTes9bKuXIdNPFTsMFUabQT3fZCn44
	cSMplWhMkQaCQZx8+TafQqv41NUpTqcxB8f3ux4agDTBUC/C4o/7rwAo9KZfeW1wkWiWJpc/yHW
	T
X-Google-Smtp-Source: AGHT+IFkfLmqUQ7vMP1tFDa+3ugkuyAHKT+NUgu91S3jBN1sLdqryjYTluJg7kqwQBxnqeuBeiwTlw==
X-Received: by 2002:a05:6402:2548:b0:5e0:3567:8077 with SMTP id 4fb4d7f45d1cf-5e0360440abmr15905946a12.4.1739959359872;
        Wed, 19 Feb 2025 02:02:39 -0800 (PST)
Message-ID: <42688c2b-9f11-4c52-b83a-607374a858fd@suse.com>
Date: Wed, 19 Feb 2025 11:02:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/PV: don't half-open-code SIF_PM_MASK
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

Avoid using the same literal number (8) in two distinct places.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -886,7 +886,7 @@ static int __init dom0_construct(struct
         si->flags    = SIF_PRIVILEGED | SIF_INITDOMAIN;
     if ( !vinitrd_start && initrd_len )
         si->flags   |= SIF_MOD_START_PFN;
-    si->flags       |= (xen_processor_pmbits << 8) & SIF_PM_MASK;
+    si->flags       |= MASK_INSR(xen_processor_pmbits, SIF_PM_MASK);
     si->pt_base      = vpt_start;
     si->nr_pt_frames = nr_pt_pages;
     si->mfn_list     = vphysmap_start;

