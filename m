Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2D0B206C6
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 13:03:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077344.1438406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQIg-0001J7-RO; Mon, 11 Aug 2025 11:02:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077344.1438406; Mon, 11 Aug 2025 11:02:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQIg-0001Gk-OJ; Mon, 11 Aug 2025 11:02:46 +0000
Received: by outflank-mailman (input) for mailman id 1077344;
 Mon, 11 Aug 2025 11:02:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ku41=2X=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ulQIf-0001Ge-K5
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 11:02:45 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b48c48f7-76a2-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 13:02:43 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-615460d9897so4867695a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 04:02:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af985e63730sm1178098266b.67.2025.08.11.04.02.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 04:02:42 -0700 (PDT)
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
X-Inumbo-ID: b48c48f7-76a2-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754910163; x=1755514963; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0AbdxcfE/93uEpfKNSHP2CpS1hPezW07bTy7hhuuf1o=;
        b=SobbXrx8be3NVkAY7/197OlTsMTt2BoCY1541OAIzffX8K8VA6gXt6kBGI+RBIAk8/
         ccmHu0SvtBCokZo8odWJYa6PErzjI0BvJKQM3hB7qTjo8FJB0GQX6odgrqU10b55Jo2c
         VD8q38ox9BMzZwyodh/CPK4x7MREgqDRy/KgrRmadwd6XEzHo2Xxt1HBMWIz4fAUBHnr
         Ih0yZd18Jgz7LPMoipLMEFrr7bWzVf60QtWWuFtjnOGm3+JdWnQoy54TToTqm+4z0k5X
         upNuzayYWt5G8la17D7YBdFYiw7KxEnyUdwqgXJheLk12Yh+SzzHKjhNCXVSwPXTYJk5
         VDgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754910163; x=1755514963;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0AbdxcfE/93uEpfKNSHP2CpS1hPezW07bTy7hhuuf1o=;
        b=par7dekpa7uBQougi2hyr3VFj25Xs/5TnBbaxjESqeNZ75M7v6Fiwr67VsrcfMVnUc
         xsHtkbspTSkMkcWaMA0gONdIvHq2NJXYYYszR+NeISZitZecU1othPsT0O6s5k+icMHk
         tAWGILYcTPNAP8uk5iU467QVeOFIYJJMvZnz4oD+1/v6f+djohgjlVAgjpWuqGGh5Y4c
         E1bLKI3cgdLclEaV++aFD16an/BIwd6GiE0D37BMDVjnDNIIQVBbyxJeIwkhnqX5jl6+
         bcWg8dORvwDnnKhHJNWUguV/OcEcOBx6tvkK+aAiXaeEfQPjrZ+6NTdy5HgluTAVgM9P
         lFfg==
X-Gm-Message-State: AOJu0Yxcfs6YR8g1pEe8acywVCkPzR4yQQ5ZkRs42aXCIaOXLIq8E485
	x8RIsOPuHSl5mo/HQXzvRFe7YMiyS4qyPJsOssP3D+HjV/l32bJq2ntOCXWwZBgmlF0mkvGdDfD
	d1wM=
X-Gm-Gg: ASbGnctq3hJXgVNoZ8EE3djC0J8Hx+xsdUSr7ZJvtvnufp6xWH5DTatbwOREb+faWEB
	PBw9Z+1FEByl3u/3O1kL3Mxfnm98Ik159bgsmIbgMZQDfBMEaYAz4nFoPPVyokMlgvNbTFJ920C
	hq3bnsAl2Bm3mmUQpvRyXo726CF2ku/DKTstp5Q0Rz/jWg3VAv0tqppBryzlyhzRr7r7DUUn80q
	2qKwSMGAcEFljTAwRflXYinUYetPKg5Izs3ZGh5edGrASZjlBDAVyhdLkB9DKj5RJM2rx5fMZXB
	BRijPsrnQCGU9cnubjridC6tsC7e3+goYglXngrIWdtLkYDpb754As5gQZEVjQyIinVmfqAVOiC
	uGs0V/dXbLq9niebyafbpRhMOxSXCg8vBrpN0e8GnOaNrjtzOIUtV2JqQt26M+nfF0jr6pMU9pK
	et+fwwvDw3lsUQMkGFQQ==
X-Google-Smtp-Source: AGHT+IG7BI2fdJ+WmphpimgFK13VQDU56WaLOjncuHCXd8Joe2oal9SCDEXUZ+srDC7dmW7GTXa/AQ==
X-Received: by 2002:a17:906:730a:b0:af9:566c:4cd1 with SMTP id a640c23a62f3a-af9c6485b27mr1139701366b.24.1754910162737;
        Mon, 11 Aug 2025 04:02:42 -0700 (PDT)
Message-ID: <7a24d8c9-97c2-4721-9e38-600858b30119@suse.com>
Date: Mon, 11 Aug 2025 13:02:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH for-4.21?] x86: drop detection of ld supporting
 SORT_BY_INIT_PRIORITY()
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

GNU ld 2.25 supports this, and we already assume all lld versions do.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
While past the submission deadline, this fits the toolchain baseline
update we did in this release cycle, so I'd like to ask that it be
considered to still permit this in.

--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -72,16 +72,6 @@ ifeq ($(CONFIG_UBSAN),y)
 $(call cc-option-add,CFLAGS_UBSAN,CC,-fno-sanitize=alignment)
 endif
 
-ifeq ($(CONFIG_LD_IS_GNU),y)
-# While not much better than going by raw GNU ld version, utilize that the
-# feature we're after has appeared in the same release as the
-# --print-output-format command line option.
-AFLAGS-$(call ld-option,--print-output-format) += -DHAVE_LD_SORT_BY_INIT_PRIORITY
-else
-# Assume all versions of LLD support this.
-AFLAGS += -DHAVE_LD_SORT_BY_INIT_PRIORITY
-endif
-
 ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
 
 efi-check := arch/x86/efi/check
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -35,10 +35,6 @@ ENTRY(start_pa)
 # define SECTION_ALIGN PAGE_SIZE
 #endif
 
-#ifndef HAVE_LD_SORT_BY_INIT_PRIORITY
-# define SORT_BY_INIT_PRIORITY SORT
-#endif
-
 OUTPUT_FORMAT(FORMAT, FORMAT, FORMAT)
 
 OUTPUT_ARCH(i386:x86-64)

