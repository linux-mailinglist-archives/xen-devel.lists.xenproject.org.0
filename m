Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B05FC87C131
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 17:23:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693370.1081347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rknr2-0007hV-AD; Thu, 14 Mar 2024 16:22:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693370.1081347; Thu, 14 Mar 2024 16:22:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rknr2-0007eJ-7T; Thu, 14 Mar 2024 16:22:52 +0000
Received: by outflank-mailman (input) for mailman id 693370;
 Thu, 14 Mar 2024 16:22:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n3nm=KU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rknr1-0007e2-7E
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 16:22:51 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1961c5ba-e21f-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 17:22:49 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a466c85ae5fso150941166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 09:22:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f23-20020a1709067f9700b00a43e8e76825sm858769ejr.149.2024.03.14.09.22.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 09:22:48 -0700 (PDT)
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
X-Inumbo-ID: 1961c5ba-e21f-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710433369; x=1711038169; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4oVKLablG+Qh/v1xDndKOU60srso5+m5m2GRhr72xYQ=;
        b=CtglCud747GQaqIfZVK93F2bimrSM0PDKsX/ij3KhGwAzh4xhS59rMOQTCBRvYv4Xn
         G0SbNlfz1NzbI8OrkxKtn9yXt0EU0mN0C51vHkQjKPv/YZwhAYMdP9Y60gRetHDLPtSr
         5dI5vIm/Z60ilFwk2G1CRxgESLlJLSVAJG2h1NbzS+N3kfteV0hJ+JLZ0T8+6slH4lwA
         87Mze86uky14/TdYC61ANwdaXD6HbrNhNXp3SVQZhrcGcRzFhOpCo/AXLLyi6joQCt7b
         /mBSe9SDYJOztBbSPOyNGkQDwCCUw9PnvM4UOM1gxsFGZg8NwtHe5qWuNnhCmhG0eStt
         EkGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710433369; x=1711038169;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4oVKLablG+Qh/v1xDndKOU60srso5+m5m2GRhr72xYQ=;
        b=jV5lzgC5nnWjQDLZjRCDAUVT+mWMuIj8pcMPi9YvWJyDaQZbF4cMmEdgHGQPDjqVRd
         kLzeHSmTujTHdQ5nSFWGLZta436Ec4Cti2IAq5CtS9SKrp7FxtHZFEgIZDuyKWS74A3R
         vbNpk42PsNHWbzmuFh2sovTLKLqpg5b/7s1gkPnDzxjG4WarBHqhv6/qWlqwF3SX5zWk
         0HVWQb18g4OYfzQrkvTpWunMPEGdx3S1ykvvETL5fRumMpHLTtNIW7Mepf/XAM6UehnA
         UQ7KcWbZOTKc+YxQznswVxu+jyh0Z/4w0wEAxYRK8JvzbHbqXSypRnc6rEHDbk4fHYUo
         4a/w==
X-Gm-Message-State: AOJu0YyOfJG8Ru63D0+J0kmxJG2Klomy8ie00u4Rbopw7xsud4xg3Gcp
	5Ym1RvpsCBEg28jPr2cZ1U+JhnF/DT+2Xt2rh71Wln5/CDo7T3makHyoeJZAQ8w842L7iq3j2eE
	=
X-Google-Smtp-Source: AGHT+IEHpBMPHNk2y/WCDGyZC78ua4d9WSRUI07OpQrt8gKth9vtDS8MK3umdsi8pFcU9R5nXIJaJQ==
X-Received: by 2002:a17:907:bb8a:b0:a3e:792f:3955 with SMTP id xo10-20020a170907bb8a00b00a3e792f3955mr1739649ejc.62.1710433368788;
        Thu, 14 Mar 2024 09:22:48 -0700 (PDT)
Message-ID: <36bf6c96-c266-4908-ae85-1ec9325b5bd9@suse.com>
Date: Thu, 14 Mar 2024 17:22:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] MAINTAINERS: drop AMD IOMMU and Intel VT-d sections
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
Content-Transfer-Encoding: 8bit

We'd like to thank Kevin, so far the VT-d maintainer, for his past
contributions, while at the same time we'd like to reflect reality as it
has been for quite some time. Have VT-d maintainership (and for symmetry
also AMD IOMMU's) fall back to the maintainers of general x86. This also
brings things in sync with how they are for Arm.

While touching the X86 section also append two so far missing slashes.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -220,12 +220,6 @@ F:	xen/drivers/acpi/
 F:	xen/include/acpi/
 F:	tools/libacpi/
 
-AMD IOMMU
-M:	Jan Beulich <jbeulich@suse.com>
-M:	Andrew Cooper <andrew.cooper3@citrix.com>
-S:	Maintained
-F:	xen/drivers/passthrough/amd/
-
 ARGO
 M:	Christopher Clark <christopher.w.clark@gmail.com>
 S:	Maintained
@@ -351,11 +345,6 @@ S:	Odd Fixes
 F:	xen/arch/x86/include/asm/tboot.h
 F:	xen/arch/x86/tboot.c
 
-INTEL(R) VT FOR DIRECTED I/O (VT-D)
-M:	Kevin Tian <kevin.tian@intel.com>
-S:	Supported
-F:	xen/drivers/passthrough/vtd/
-
 IOMMU VENDOR INDEPENDENT CODE
 M:	Jan Beulich <jbeulich@suse.com>
 R:	Roger Pau Monné <roger.pau@citrix.com>
@@ -587,9 +576,11 @@ R:	Wei Liu <wl@xen.org>
 S:	Supported
 L:	xen-devel@lists.xenproject.org
 F:	xen/arch/x86/
+F:	xen/drivers/passthrough/amd/
+F:	xen/drivers/passthrough/vtd/
 F:	xen/include/public/arch-x86/
-F:	xen/include/xen/lib/x86
-F:	xen/lib/x86
+F:	xen/include/xen/lib/x86/
+F:	xen/lib/x86/
 F:	xen/tools/gen-cpuid.py
 F:	tools/firmware/hvmloader/
 F:	tools/firmware/rombios/

