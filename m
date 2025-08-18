Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04053B29B5E
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 09:56:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1085522.1443844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unuip-0007rU-5B; Mon, 18 Aug 2025 07:56:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1085522.1443844; Mon, 18 Aug 2025 07:56:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unuip-0007oy-2G; Mon, 18 Aug 2025 07:56:03 +0000
Received: by outflank-mailman (input) for mailman id 1085522;
 Mon, 18 Aug 2025 07:56:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q+DX=26=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1unuin-0007oq-G4
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 07:56:01 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c750888b-7c08-11f0-b898-0df219b8e170;
 Mon, 18 Aug 2025 09:55:59 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-6188b5b7c72so5324099a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 00:55:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-618b01b5ebfsm6527478a12.42.2025.08.18.00.55.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 00:55:58 -0700 (PDT)
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
X-Inumbo-ID: c750888b-7c08-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755503759; x=1756108559; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BYqLOoEq7xEukfuS6r9GGa1bJycK3KYzC0x6yJyfG5g=;
        b=PhiTj81bE6TGyL/QhiP1uvThqtlLZ2jABxgm9n7xoMrPWYeIY6XFFPNdDSFWuH5Nvi
         IMCwzepKCZKiv9VtNCoQiAGM4SQOpz6NHboHFD07QUO3s8CnzcDbq/twvWIZZe+ykWX3
         YHwxhJ2Igho7+vd/MIOTlFj6Sito25Xyxke8czWmr+A3WTqp4Xc0sXojEHel/mPgtLdh
         lGfFE20QjDffoDn9JV8rGjlrDfqgrGVdIE64lh1PINTJjbzlQzx8Ss9UbeJ8+QYSZycT
         uPYHQDB5Lk4bU9UGHfy50WTgy2gFEmyW0TgBKwIAN+1Ha3ZGF5D8vzH/wswhH93YwI+f
         dFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755503759; x=1756108559;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BYqLOoEq7xEukfuS6r9GGa1bJycK3KYzC0x6yJyfG5g=;
        b=pTQrjeNZ3ZLgKyyGpjEo4hhEXb1UMfPi50a9HuXaFDRZdb+pXxhg8oLYZ2OL2Fg1gi
         Ei4wgZ3DCdougip8fi5phUiBXoLFWfgsgtUiEmCQ2+HjubMayjsH1GEj1CSVekblE07D
         1ULsdaKA8Yze+H3mJnHQV22PRterIdgNku8rScY1ql9Hum5AOqS9PaQvaqaNlHT7NUsp
         hC+jaoqj1B4CxOCDmAV+UoEzUDZmicauVWpKYBaXKMIcZ3/sCRuizHeR/kqwIPmdRk2y
         nEcTRCKV8mhK9HzSu+ZJ4g8eYzZMtJOj95dkP+/BPBqODigTREykaZAg0wDU94kPxovI
         mqSQ==
X-Gm-Message-State: AOJu0Ywcow5rIjhcfqTXfDbHJrpiJau86jcDBnk7dA4e1M+zoMR0ahI/
	jR+BJ4ALsSOcQvg04wd56A6bzwmrgoBQyCpe5kdsv0bMLVsvGayupjkF7nIYmOdKBPXCboz9wTr
	287E=
X-Gm-Gg: ASbGncu5E4M8l3uzLyPLdhlNI3xYyymKGESVMW6j0gUaOHzKT9po//e+LnRoBe7k/ma
	1NxDk0jCxbq3vQ13ArmwCT20Feut6CdxZQAvnznGao+2LYoaiM6KUJn/KgvgPP5Sf52YuLa9pRT
	r1QqI93kjB0/YWdmDqdNBqJje8szeNOzPCbfbJpKfgNZfe1wfudT4Bg7f8AloXQAoZhZnRowbD6
	9t4WPmlXWeuPVq4qVaYYngM3DKCMdoFnspnpO0d8gAp+mA2N7xTVxanlZCqgXvM+x++IDObfiNJ
	cyJ57Juu4kJ4avbqMgdnOnEVPIIrULL4byCue6SN8dmixTNQl3pirF8OcPC2fRTlZEQ/ii6qmqC
	XfeMyr2/HA9jCdbUJaBWbr479V+YPqPzb4x0ND5izaHlg6CbZBZlpZlztW7fMel0saB6bixN60d
	i5SIzZsndlg0Dk1vnjYg==
X-Google-Smtp-Source: AGHT+IEz2BSC3+F0OQuDnnZtZiXLSl8S9yWFaTZVSIX4b5r90OS+aIQvZWWGNNpRmC4rLRkkPT0Fmw==
X-Received: by 2002:a05:6402:2687:b0:615:9c88:59ef with SMTP id 4fb4d7f45d1cf-618b0543e33mr8556342a12.20.1755503758917;
        Mon, 18 Aug 2025 00:55:58 -0700 (PDT)
Message-ID: <753ce2a1-8d9c-41ba-a066-abf6f625cb60@suse.com>
Date: Mon, 18 Aug 2025 09:55:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 1/2] Arm: drop assertion from page_is_ram_type()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <a2dc40a8-908a-44a7-b443-90f492a775cc@suse.com>
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
In-Reply-To: <a2dc40a8-908a-44a7-b443-90f492a775cc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Its uses in offline_page() and query_page_offline() make it reachable on
Arm, as long as XEN_SYSCTL_page_offline_op doesn't have any Arm-specific
code added. It being reachable was even mentioned in the commit
introducing it, claiming it "clearly shouldn't be called on ARM just
yet".

However, dropping the assertion from a function of this name is deemed
problematic. Rename it to better reflect its sole purpose outside of
x86-specific code.

Fixes: 214c4cd94a80 ("xen: arm: stub page_is_ram_type")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Rename the function used in common code.
---
The new name is chosen such that, down the road, offlining of non-RAM
could in principle also become possible.

--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -64,10 +64,9 @@ int steal_page(
     return -EOPNOTSUPP;
 }
 
-int page_is_ram_type(unsigned long mfn, unsigned long mem_type)
+bool page_is_offlinable(mfn_t mfn)
 {
-    ASSERT_UNREACHABLE();
-    return 0;
+    return false;
 }
 
 unsigned long domain_get_maximum_gpfn(struct domain *d)
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -425,6 +425,11 @@ int page_is_ram_type(unsigned long mfn,
     return 0;
 }
 
+bool page_is_offlinable(mfn_t mfn)
+{
+    return page_is_ram_type(mfn_x(mfn), RAM_TYPE_CONVENTIONAL);
+}
+
 unsigned int page_get_ram_type(mfn_t mfn)
 {
     uint64_t last = 0, maddr = mfn_to_maddr(mfn);
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1635,7 +1635,7 @@ static unsigned long mark_page_offline(s
 {
     unsigned long nx, x, y = pg->count_info;
 
-    ASSERT(page_is_ram_type(mfn_x(page_to_mfn(pg)), RAM_TYPE_CONVENTIONAL));
+    ASSERT(page_is_offlinable(page_to_mfn(pg)));
     ASSERT(spin_is_locked(&heap_lock));
 
     do {
@@ -1711,7 +1711,7 @@ int offline_page(mfn_t mfn, int broken,
      * N.B. xen's txt in x86_64 is marked reserved and handled already.
      * Also kexec range is reserved.
      */
-    if ( !page_is_ram_type(mfn_x(mfn), RAM_TYPE_CONVENTIONAL) )
+    if ( !page_is_offlinable(mfn) )
     {
         *status = PG_OFFLINE_FAILED | PG_OFFLINE_NOT_CONV_RAM;
         return -EINVAL;
@@ -1851,7 +1851,7 @@ int query_page_offline(mfn_t mfn, uint32
 {
     struct page_info *pg;
 
-    if ( !mfn_valid(mfn) || !page_is_ram_type(mfn_x(mfn), RAM_TYPE_CONVENTIONAL) )
+    if ( !mfn_valid(mfn) || !page_is_offlinable(mfn) )
     {
         dprintk(XENLOG_WARNING, "call expand_pages() first\n");
         return -EINVAL;
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -144,9 +144,11 @@ unsigned long avail_domheap_pages_region
 unsigned long avail_node_heap_pages(unsigned int nodeid);
 #define alloc_domheap_page(d,f) (alloc_domheap_pages(d,0,f))
 #define free_domheap_page(p)  (free_domheap_pages(p,0))
+
 int online_page(mfn_t mfn, uint32_t *status);
 int offline_page(mfn_t mfn, int broken, uint32_t *status);
 int query_page_offline(mfn_t mfn, uint32_t *status);
+bool page_is_offlinable(mfn_t mfn);
 
 void heap_init_late(void);
 


