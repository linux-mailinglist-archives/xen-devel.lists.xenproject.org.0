Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E2794FFF3
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 10:36:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776053.1186204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdn0q-0005Aw-7Y; Tue, 13 Aug 2024 08:36:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776053.1186204; Tue, 13 Aug 2024 08:36:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdn0q-00059S-4p; Tue, 13 Aug 2024 08:36:16 +0000
Received: by outflank-mailman (input) for mailman id 776053;
 Tue, 13 Aug 2024 08:36:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Wdkt=PM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sdn0o-00059M-PE
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 08:36:14 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19642e71-594f-11ef-a505-bb4a2ccca743;
 Tue, 13 Aug 2024 10:36:13 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a7a9a369055so404898866b.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Aug 2024 01:36:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f414bef2sm49913966b.143.2024.08.13.01.36.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 01:36:12 -0700 (PDT)
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
X-Inumbo-ID: 19642e71-594f-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723538173; x=1724142973; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sVjJTxOBX7geMbT7t4pB/xLxxc6TKA81wDXedEbM3k0=;
        b=UbHKGWLmZbKOL5AeuJjL4cUw5bj0FW7nCI0PeVaXVGNyqdFpkY0dn9MGhXmoYlmNBC
         jn3PPHkE2GD/64mP3fK+DE48Bq4sdkQdtXClLva4g8uxu4Oh4MdCGOkEbswPM8ty5ejh
         zskqTIXVykL5i7EqyszHBwErUvxhy4RLYDFSMYWD9f5Q7XRz1Or2kFxHT5KpsJP92vmw
         w/1dXy2Jb7gqPvusn5UVBGbQwqiWKQAqyo09QFs8anjiIfpa9R5k8KH74wgNw5XIFoyA
         IMTf7al04mxj0pGYjTIDQKXI35d1lErjDhaXuT/GjUfG9BzrsH/51UFtV03tyQw47sy9
         F1uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723538173; x=1724142973;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sVjJTxOBX7geMbT7t4pB/xLxxc6TKA81wDXedEbM3k0=;
        b=cJE+0WobZPc4ni4IFPBY4EOCiOqsA65G9LD0rhlDT9VMmfJBHOSlNa3SXIWePuJrxP
         EfPejYnE+CNIYB0GQuyddTiBZmQ6crIt0rYuCTaYEg1JKAhfP0/Te/lSkFkFF30QxObP
         dtOeauKVF8bjZ5yokxubRIUXuma4CrYn9FfRAR8Ahc2qFyZ54s5pNqnhM8o7fk1xH1qw
         mwY/aykyOZxnGbfmTBnejQNhyrYX4EW/2nZfL+JBHMHN2HEraqabgBu2sqNSpIPspT3z
         Vws1aexFTjkNPThm1E5ohs4KSFFOPXK1VUlwmY+K4YuqwV8ppHm8taP+E5wBrvoKokfp
         AinA==
X-Gm-Message-State: AOJu0Yw/w2vlg2IRpYIi3lrtImUikW8HH3EtcN+RFCHpFkSn1irKXS8i
	oz3aGaUWn34VxHKjlRnnkRj2lnal3Gq8P7iUJogc+kbtcw0uy4WQj7FmYULFinqKI7mJVSYlP5c
	=
X-Google-Smtp-Source: AGHT+IGtdeZoEoyFVwnqMHDkn0kH4ag7oua/d0DTtb5BFPdtt8jnPjRdq3orm6hh3N/IlZ1XIhPrPg==
X-Received: by 2002:a17:907:1c85:b0:a7a:9f0f:ab14 with SMTP id a640c23a62f3a-a80ed25893fmr182542066b.33.1723538173009;
        Tue, 13 Aug 2024 01:36:13 -0700 (PDT)
Message-ID: <ad60ded1-5feb-4fd9-8cf8-6dee2e153d11@suse.com>
Date: Tue, 13 Aug 2024 10:36:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] Arm: correct FIX_LAST
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

While reviewing a RISC-V patch cloning the Arm code, I noticed an
off-by-1 here: FIX_PMAP_{BEGIN,END} being an inclusive range, FIX_LAST
cannot be the same as FIX_PMAP_END, or else the BUG_ON() in
virt_to_fix() would trigger if FIX_PMAP_END ended up being used.

Fixes: 4f17357b52f6 ("xen/arm: add Persistent Map (PMAP) infrastructure")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Alternatively the definition of FIXADDR_TOP could be changed, if "last"
should retain its strict meaning. Possibly a guard page also wants
having at the end of the fixmap range, which could be effected by
changing both #define-s at the same time.

--- a/xen/arch/arm/include/asm/fixmap.h
+++ b/xen/arch/arm/include/asm/fixmap.h
@@ -15,7 +15,7 @@
 #define FIX_PMAP_BEGIN (FIX_ACPI_END + 1) /* Start of PMAP */
 #define FIX_PMAP_END (FIX_PMAP_BEGIN + NUM_FIX_PMAP - 1) /* End of PMAP */
 
-#define FIX_LAST FIX_PMAP_END
+#define FIX_LAST (FIX_PMAP_END + 1)
 
 #define FIXADDR_START FIXMAP_ADDR(0)
 #define FIXADDR_TOP FIXMAP_ADDR(FIX_LAST)

