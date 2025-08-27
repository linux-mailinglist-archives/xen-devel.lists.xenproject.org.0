Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D53B37A0C
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 07:56:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095512.1450477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur98k-0005TJ-Kg; Wed, 27 Aug 2025 05:56:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095512.1450477; Wed, 27 Aug 2025 05:56:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur98k-0005R0-Gt; Wed, 27 Aug 2025 05:56:10 +0000
Received: by outflank-mailman (input) for mailman id 1095512;
 Wed, 27 Aug 2025 05:56:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gy2E=3H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ur98j-0005Qm-4S
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 05:56:09 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82e1620f-830a-11f0-b898-0df219b8e170;
 Wed, 27 Aug 2025 07:56:01 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-afcb731caaaso951842666b.0
 for <xen-devel@lists.xenproject.org>; Tue, 26 Aug 2025 22:56:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe79fba62dsm640757866b.100.2025.08.26.22.56.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Aug 2025 22:56:01 -0700 (PDT)
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
X-Inumbo-ID: 82e1620f-830a-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756274161; x=1756878961; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r/sRUv6By61dZfKrnfYyLwS1JPfsrQ60N+G2J8rf4SY=;
        b=Rc46VaO39YeKFAuPCiRgqGsklUiqqvYP6+aLzWrgbY5A9VVttqnJGRQeJS9IpmxgxH
         /YPR5VxevfGSLT9qy9V43uSfr5olil9/qHlNVE53bT1Ykqc998dAteQ8k4jiMFPPmQ9A
         ye3j7yMn4RdRdDdZzGixFXAq0TaprUG6lMBX8yjGmjTPb5O5A3eGWPWaukrrUZb4uhJT
         njZlmOB0kbFXsm/UVgTsnFoCgQidW7VpHmwbLnuUsPQAKaa2GThcMqQmHm4u4gB4Z//d
         muwETsUmKjxqQHT7QB+jL6SzrUym63fE/6Klq02FNt3kvNKVKfc4CnqHtV7b1FSGhtk5
         Ay1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756274161; x=1756878961;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r/sRUv6By61dZfKrnfYyLwS1JPfsrQ60N+G2J8rf4SY=;
        b=fLKTEZm2e9d/rsbBxCQH3PFYzmnOeUPxxI1oQjM0aav+sRmwDv3RS1pmnibRfv5geI
         mFYZr6UJFhGtMFA+3YZ8CqF3CKElx/vorWIOizi0Ip280+4yD8CorRjiRwfPdaljQHSX
         /QxJyrWmsT9pijC4CquV7VTiVnqZIF/zw2OvuzCiam38rnqSYgz2tJz9JZfoHMs8Hrvm
         w1rFTwQ2XvpmTgPSYGnig/UsC1BVMdjv+GOO4d55Y91X02CRCNeObOIwwnxpsQhNZjkX
         wqhQAA4+a/tNpYr0ziA4cYf7sHVC16cokOyUFap+kTtTohQ0k1y4hIzewEopcpKSe2YR
         Lgug==
X-Gm-Message-State: AOJu0Yz3lJbJAQeZ4vJM4jSaguku6qWNEumCN+CPNxf26CZeHwzEpikS
	0/pxYr2ASfih4+dm0ipk5/FBBgwQ3PKWYmm1o5bXNGMNL4POcKNltVvz7Gs3OfftFydfv622b7K
	QQAM=
X-Gm-Gg: ASbGncvA/vcn0urxm0on8e25izyqAcbAmV/LqXdsl7K5POdVWKOyN6STY0HJ8ga3Psn
	JcSLFPoDsEYP94ZRFgps3cyD04Y7eC5/QHR5lnZn0I8orgG5NM9RQgUIbmn+xCtHwukEvLwjqTx
	+LmXwecr9KYX5hDgr47hb8l6UlIxSAngnNWet0kXaUgVrx8NzoMtIVhVaqXES9wbvk2NwFVJkWp
	b1KdOpwbXVo22ZoigLRYLDshBHPgKnjFdvreLOch1nuj50MwNNVwsTRwyI5u1LwS8rOydLqWqSm
	n1ZEyEHmVeGY+MFMUqQOVmgU7ARXFy2XsL0xXHx8Qgv3JXM2Ka8OkTx85k7SzEuBuQiCdTsLZdi
	gdFbCDEoKtAhL4zxpT8QyfyAbnikNxrWsDskJDYTv+6/tp76CoGpilyRGCOLddwug/e5E4n7M4D
	ZHw/MZq+8=
X-Google-Smtp-Source: AGHT+IFcNn2GSa1AuikFpIYnj2ZfgN8+gOzmfv3WoYnw1tVrFPeNTtmpTZZWsZ4teuBHE9kHwMqPvQ==
X-Received: by 2002:a17:907:7e92:b0:af9:3c4d:e978 with SMTP id a640c23a62f3a-afec348acb4mr98224166b.41.1756274161294;
        Tue, 26 Aug 2025 22:56:01 -0700 (PDT)
Message-ID: <719c456b-927d-41c3-b28d-135a895958dd@suse.com>
Date: Wed, 27 Aug 2025 07:56:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] libxl: respect unset video_memkb for Dom0
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

Without this, Dom0 will have have a curiously off-by-1 target_memkb
value displayed by "xl list -l".

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
In retrieve_domain_configuration_end(), isn't it the wrong way round to
set both ->b_info.target_memkb and ->b_info.max_memkb only after calling
libxl__get_targetmem_fudge(), when that uses the two fields? This way we
could as well use ->b_info->video_memkb directly there.

Of course this may point at a bigger problem, as other fields may
similarly never be set for Dom0.

--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -4685,7 +4685,10 @@ uint64_t libxl__get_targetmem_fudge(libx
                                 info->max_memkb > info->target_memkb)
                                 ? LIBXL_MAXMEM_CONSTANT : 0;
 
-    return info->video_memkb + mem_target_fudge;
+    if (info->video_memkb != LIBXL_MEMKB_DEFAULT)
+        mem_target_fudge += info->video_memkb;
+
+    return mem_target_fudge;
 }
 
 int libxl__get_memory_target(libxl__gc *gc, uint32_t domid,

