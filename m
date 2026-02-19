Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EvANiAyl2kcvgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 16:54:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D73D1606AC
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 16:54:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236530.1539226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt6Lh-0002KG-9U; Thu, 19 Feb 2026 15:53:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236530.1539226; Thu, 19 Feb 2026 15:53:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt6Lh-0002IY-6i; Thu, 19 Feb 2026 15:53:53 +0000
Received: by outflank-mailman (input) for mailman id 1236530;
 Thu, 19 Feb 2026 15:53:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vt6Lf-0002IP-Ew
 for xen-devel@lists.xenproject.org; Thu, 19 Feb 2026 15:53:51 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e5e27a4-0dab-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Feb 2026 16:53:49 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4834826e5a0so12008115e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 19 Feb 2026 07:53:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4839ea454eesm19224865e9.11.2026.02.19.07.53.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Feb 2026 07:53:48 -0800 (PST)
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
X-Inumbo-ID: 2e5e27a4-0dab-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771516429; x=1772121229; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HXm7U3woukJFOwS2HcEUe3Wn0HbgyiyTjBKF1lMbwWo=;
        b=UdZmxcOqHGaMTulV1rUw5WLs8ZL8IFPdYle0jqfoBu43q7qsZoM4TMrs9eAfX3BwlU
         fQS2inKF/WOvAJajINxU86fdNZPT9+BjwY5CkOVpVcz/QoHrYnN3FFp7kaf9n4ubjoYR
         /1zQgGkRqJ/TLFwt7i5i38dFgt+eCZjUIzZTazfv0c2KGBQCQH255Dr3IAUcJ/9Op1pR
         ODKv22vfSatBpE3SlksX4+ZQdAdTgtI20Icca9YnMgQuYdGyVB+n32MsSVh4q2GpK3rm
         BfdXZxhNLID0WJE0rdEMp3FMjDKqmbwmE1wyYB8Ktmk5RwyPDuimcAkHSHgpMgjA/OGv
         qiTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771516429; x=1772121229;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HXm7U3woukJFOwS2HcEUe3Wn0HbgyiyTjBKF1lMbwWo=;
        b=UCjIhMknwpaZAklSCbSqIc4FGyblGmweHAXw2yApFh4HJfEj3wD1z3qz0p8V7NZjwq
         P8ZszlXB2yM6xVGuFXuds7PRNj5P5R3+rLXKaxEMj7KTLXon91IqrH63pJk5PN4Qr2Kg
         WUklOsIoROPTgo9e9/p8IEbhzQQz/yWEXe8tEBF++tPitCtEsEb+WgynrPx0zG7Fle2z
         /2a9AE604rn3BOfliT3+skAsWV+lo73Z/O2SpGEGSBElbIDehdW0aL9Pbu0VA9marB32
         mRDdd2cc/1jz3QkfleIOuZykQmZSKl+Tswgtqpj9FoUEzYY0qCadfFdcFTAIBzruNNQp
         z2Mg==
X-Gm-Message-State: AOJu0YzyxYAysoeiMYsvi7Dlv0WCLxsKoHawYuEw3XfF6ssh39PDyNbp
	7sHbZFmTlYa99ozEDYx7wfuKfRCCJv7Inwh7zTKvTLhLlbDEC84c0r6GYOvFpFaw46GtvH2SZhL
	BpVw=
X-Gm-Gg: AZuq6aImoXg82Hiq91Ph7s9898XfhTKv2uD3ECTAbySi2KNkSOwzKbFtReGC0vSLQdr
	mTcLKiO8aK63aDTyCBnxhQEyHLBFNjojrHm7Ivu5yTElldkLB6ndyUUg6yNcUcZAxT7/nw/c1eM
	dsp1Qhjd4pnOhS/A4D3ZasXJgs9QWbR13AZm07voe/nfpr5A7jY28kqt+htR/J4M6RohAd6Yp2c
	2cU/o9DpXInKNtCbJ4IxntNMd2lkD4wcQmVOHTjZc+skQmFHvefiyrgjaKXrDxuUS6DuTGqkLpc
	mMUEoLyEs4xfbmhxnjprWb0vizllCOpmhrzgMKa2Pc8IvjJpznRxZK2ojJuhkP1AjHO+iiTzUxT
	tFnlM2DctsR1kuNTmVEx1hhRCYSObfsus3q7xd4ExocOCLj4LlrwyCaeDjoVU59j4YrQSe/tfso
	vtKMYmVYlBZA/6g4KWV09iF2qvjxXbsYyc5APCt7LLPcvmC+QVHCqB1FoABO8Yw1eyQM3dkZVOQ
	C1Nyret9gfnUQI=
X-Received: by 2002:a05:600c:3e14:b0:483:7783:5363 with SMTP id 5b1f17b1804b1-48398b6e214mr88458575e9.26.1771516428918;
        Thu, 19 Feb 2026 07:53:48 -0800 (PST)
Message-ID: <20adacfa-06ce-4508-916d-f15d8f17788f@suse.com>
Date: Thu, 19 Feb 2026 16:53:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/2] make ioremap_wc() x86 only (for the time being)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <924f3ef2-7883-4322-a921-edc814c96719@suse.com>
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
In-Reply-To: <924f3ef2-7883-4322-a921-edc814c96719@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[xen.org,kernel.org,vates.tech,amd.com,wdc.com,gmail.com,arm.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim,suse.com:email];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:bertrand.marquis@arm.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 4D73D1606AC
X-Rspamd-Action: no action

Its use in domain building is questionable: Already at the point both uses
were introduced, ioremap_cache() existed. I can't see why kernel and
initrd would need mapping WC, when at the same time other similar mappings
(in common/device-tree/) are done WB.

With those uses replaced, neither Arm nor RISC-V have a need for the
function anymore.

Amends: d8972aa9645f ("xen/arm: kernel: Rework kernel_zimage_load to use the generic copy helper")
Amends: bb7e6d565d92 ("xen/arm: domain_build: Rework initrd_load to use the generic copy helper")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

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
 


