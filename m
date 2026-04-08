Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAuzL3VF1mkFCwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 14:09:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E443BBC94
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 14:09:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275859.1561555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wARiV-0007dR-Ig; Wed, 08 Apr 2026 12:09:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275859.1561555; Wed, 08 Apr 2026 12:09:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wARiV-0007bY-Fr; Wed, 08 Apr 2026 12:09:07 +0000
Received: by outflank-mailman (input) for mailman id 1275859;
 Wed, 08 Apr 2026 12:09:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wARiU-0007bS-7E
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 12:09:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wARiT-007iev-JY
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 14:09:05 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d6455b-e002-0a2a0a5209dd-0a2a4503aab8-24
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 14:09:05 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d64561-02b3-0a2a45030019-d1558036a48d-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 14:09:05 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4887ca8e529so7025735e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 05:09:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48893f39027sm439904415e9.2.2026.04.08.05.09.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Apr 2026 05:09:04 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775650145; x=1776254945; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=STxNNAbhOhiEnR+KXq2pgjLC+ZNGxAxGakdQHXFTB1w=;
        b=KjMdOyPrrcMlXCyhBrceKOxGVM028M8qXmV4gTUvpSailCuTaUSqjFYwstKmpBvPWy
         ++2Nu/xFoNPaFu5JzEkXCiDvFyhAFPT602kZyGKyhyvUqXwyygqfbmK1XXXKPKzaLyJX
         I6jVwecHlz4l70J4kmGoQqlxzMBF2leFZ4s21IAkGDNtKStX8kzHf2jEgrfirhYefhv3
         9Ei+20d2lcv78lDKeB7rU0dTlOOidyct1ZRp83jAWgXUlQOQhAWEGozUVkyZGEP4L2jA
         /nckGocqwWRrl8EN1eGGXbh3aT+QVaN21mM+74hkCVfpYyjvYgmpv6RcA7rfFSeOE6CN
         NcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775650145; x=1776254945;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=STxNNAbhOhiEnR+KXq2pgjLC+ZNGxAxGakdQHXFTB1w=;
        b=euAMUzXDaDNkM4vXhmLE/n5QzvHWzudiY0XqSg+IrO/EYLuL14mO9cb9HtlcQ1dwkq
         n/+0aUBbiUE8UMuUB2Ob/vlcV2nPzzX0DzpnagSpvNQDVy/AeGlAcnORKlSwIhFhtBKl
         heCQTJ4lIcIWHN71T0zTJ0mQ0QDQgfVnFHswNvoucz3KjJovNjhtZ/FK0zYr5NJ3uvpY
         15XpJHYEphAAnHAIwm2Zu1GbxVQSfOJEj5kagYpNJ8WYxm5fe4RxtxOjh0t/NeTmkg/t
         5u19oChHQssWCHRUPya3IqXWh4I+Ys02WzhfBuXfR6tQn/rr3leeKDXB28O1XiXJ8kUU
         9PYQ==
X-Gm-Message-State: AOJu0YxJHDYN3MYRo7UjFAYToTEpRRjnwqdfz4HTsmySDbqCFkEUiJQk
	ARAMoRIkA3b2ZhF4P3eSMAxib+btWoCvAxdLIVGggSu0+5prgZuUmWMeS8gckrJtkaVMjeTjI3O
	cKAY9Uw==
X-Gm-Gg: AeBDiesAMRGy2612aexRMDcjXZB/66oSWIP9hpj3MLDrPzGynNKNfSmfc1L06FXSkFH
	I95tTkXycTZ0wxz2IdnJub+sfhAhBcazYm0pJKBK9GqeyCbKtvL/gVD+/57wpXPshkoUDi45Vih
	S6Evqq+SWDzbxqjmhKEh3duUj9BXaXFk1hReDCNlYCc8/XeF2BDboLf4zDhcM+uoscbjZNXePvk
	DM5/CRhNQDVqEiDHWrgkOQy8Xcr5ymdj5gTL81830r+EFpkLcD1tjhe1zIzSlDdQqcNxjeOEKoH
	iU37/ba61gp0yB/sWhZdP3QcltBMOibue+Tp8TbKgHZxAK+4QX6JJ0nxTeTqeyy+kzeMBPkEIdO
	tEpMN1d2LLkSBkq4H4ZJsBi/RB/xa9TvZaIaW5uzfdHzYYAwULRFNhHY8kZrW73CxC0cNlSSs5a
	Y6FQSCQSIeP9IoRi16rkRE8OlOay3twztQJIqdWsJFW6x/tIRoMSQPINgtVcstGveCozuoKJE7H
	7xrmi0aHpVNRzA=
X-Received: by 2002:a05:600c:3f14:b0:488:c6e9:1e0c with SMTP id 5b1f17b1804b1-488c6e91fe0mr27828085e9.5.1775650144904;
        Wed, 08 Apr 2026 05:09:04 -0700 (PDT)
Message-ID: <da4bf81d-7591-4f5d-8e0d-e6ed9ecb834e@suse.com>
Date: Wed, 8 Apr 2026 14:09:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 2/2] make ioremap_wc() x86 only (for the time being)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <145299a0-b25c-4612-82c6-9401a2f88ad2@suse.com>
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
In-Reply-To: <145299a0-b25c-4612-82c6-9401a2f88ad2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1775650145-C9B3BC9A-DE5420CB/10/73395122804
X-purgate-type: spam
X-purgate-size: 2835
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,xen.org,kernel.org,amd.com,wdc.com,gmail.com,arm.com,epam.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:bertrand.marquis@arm.com,m:volodymyr_babchuk@epam.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 24E443BBC94
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Its use in domain building is questionable: Already at the point both uses
were introduced, ioremap_cache() existed. I can't see why kernel and
initrd would need mapping WC, when at the same time other similar mappings
(in common/device-tree/) are done WB.

With those uses replaced, neither Arm nor RISC-V have a need for the
function anymore.

Amends: d8972aa9645f ("xen/arm: kernel: Rework kernel_zimage_load to use the generic copy helper")
Amends: bb7e6d565d92 ("xen/arm: domain_build: Rework initrd_load to use the generic copy helper")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -213,11 +213,6 @@ static inline void __iomem *ioremap_cach
     return ioremap_attr(start, len, PAGE_HYPERVISOR);
 }
 
-static inline void __iomem *ioremap_wc(paddr_t start, size_t len)
-{
-    return ioremap_attr(start, len, PAGE_HYPERVISOR_WC);
-}
-
 /* XXX -- account for base */
 #define mfn_valid(mfn)        ({                                              \
     unsigned long __m_f_n = mfn_x(mfn);                                       \
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -148,7 +148,7 @@ static void __init kernel_zimage_load(st
     printk("Loading zImage from %"PRIpaddr" to %"PRIpaddr"-%"PRIpaddr"\n",
            paddr, load_addr, load_addr + len);
 
-    kernel = ioremap_wc(paddr, len);
+    kernel = ioremap_cache(paddr, len);
     if ( !kernel )
         panic("Unable to map the %pd kernel\n", info->bd.d);
 
--- a/xen/arch/riscv/include/asm/io.h
+++ b/xen/arch/riscv/include/asm/io.h
@@ -43,7 +43,6 @@
 
 void __iomem *ioremap(paddr_t pa, size_t len);
 void __iomem *ioremap_cache(paddr_t pa, size_t len);
-void __iomem *ioremap_wc(paddr_t pa, size_t len);
 
 /* Generic IO read/write.  These perform native-endian accesses. */
 static inline void __raw_writeb(uint8_t val, volatile void __iomem *addr)
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -592,11 +592,6 @@ void __iomem *ioremap_cache(paddr_t pa,
     return ioremap_attr(pa, len, PAGE_HYPERVISOR);
 }
 
-void __iomem *ioremap_wc(paddr_t pa, size_t len)
-{
-    return ioremap_attr(pa, len, PAGE_HYPERVISOR_WC);
-}
-
 void __iomem *ioremap(paddr_t pa, size_t len)
 {
     return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
--- a/xen/common/device-tree/domain-build.c
+++ b/xen/common/device-tree/domain-build.c
@@ -395,7 +395,7 @@ void __init initrd_load(struct kernel_in
     if ( res )
         panic("Cannot fix up \"linux,initrd-end\" property\n");
 
-    initrd = ioremap_wc(paddr, len);
+    initrd = ioremap_cache(paddr, len);
     if ( !initrd )
         panic("Unable to map the %pd initrd\n", kinfo->bd.d);
 


