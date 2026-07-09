Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hctwGLCXT2q1kQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 14:44:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC1B73122A
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 14:44:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=GOVTtaAQ;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1358123.1612384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1who6x-00033c-Gi; Thu, 09 Jul 2026 12:44:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358123.1612384; Thu, 09 Jul 2026 12:44:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1who6x-00031o-Dw; Thu, 09 Jul 2026 12:44:15 +0000
Received: by outflank-mailman (input) for mailman id 1358123;
 Thu, 09 Jul 2026 12:44:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1who6v-00031i-S7
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 12:44:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1who6u-00DYL4-Qa
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 14:44:12 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4f9798-5cb7-0a2a0a5109dd-0a2a4508a01c-12
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 14:44:12 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <jbeulich@suse.com>)
 id 6a4f979c-ee29-0a2a45080019-d1558033d86f-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 14:44:12 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-493b786d6c0so9740135e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 05:44:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6ea082sm61015545e9.11.2026.07.09.05.44.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2026 05:44:11 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783601052; x=1784205852; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9bl3Xwf1E4x0kH8NmIkQ/ryo5KAtp2b6niNTcutMrmU=;
        b=GOVTtaAQVNKUcp4/oSsuDM7hAaV0usNKPij+1Q1Wnk2S2/D00ZDqBk8fAT9NeFZgWb
         TitV5Ju9KbzqaTytQDHyWCTxXyQedaMVaiD399dsf/rf+UoNU0WpJwDOvrcdsOoq/HLX
         gToeynmDtnjbZ/4BVoWVkW4UHicT3pxg+bu6cQjrgKLEhjzMcGhbjAh0OwYxA22Px1Pm
         pQ+yuy93nkj0CIMaRpeI9CS+Ci9bk6ZlxWYJZwreJicu0mlAK2JCiOsCCLUzQAZSKkGI
         Wa/u/uvZU6uUJmAnTTI6rc//XpU+ZGpq+lZwdsxOIsAGYP3xc9qP6JFnqGaT0JOBtXrx
         yU1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783601052; x=1784205852;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9bl3Xwf1E4x0kH8NmIkQ/ryo5KAtp2b6niNTcutMrmU=;
        b=MRfudKxldOfuTtubNE7p+01iLFOTLljwvP0ltO3p6x3YU8cQ08oEt0uKQDV27Bv9zI
         dwBSamAMQnbYGTUdGQ4eSWIxGZm1KoHZb0IFJI8rVD4b3RcOwRmYXOTHGENkkzeeSrzN
         23hWuXcHg3EQ2QP1Ru4G2AZZMXjq3e21TBjRgsmqPAGr3mm5VXqg0X9pVZ7560ux4zY6
         rm5kcOZ3odEEQf/8xdK3+r/y/7hE7v2+40rY2fWfVKZXn5RyFphkbtRo5v2+iU/Devi8
         plmNL4wztv1WMMCV0PEqgo32YPe66kRhg43ErURQOnQJkhetzkHpFJZK514FstWSVLTJ
         c8tw==
X-Gm-Message-State: AOJu0YwgUmXBJmwFAWSZeu2+mKg0qDWIoBLOaHTYa2m2UavYBYR1li5C
	p0NiSZqS5f2XAqZ8xSXfpjX9pxqDve2dAOXfEnsUhQtO4CFqxVtSOgSg2DibldUOXHUBTvI2Fxh
	jobXmAQ==
X-Gm-Gg: AfdE7cmqRR6zXK7OIEwwDmaI/lgNIx5/MOMJFFLC6296C5o7ABCNhcp+khPn6GZFb6y
	1MlpnZF/yPzev5NDZXtx0Ns3TqriFz/tq7Lrw+TPosH+fxDaJ7JJn/vzTQdyjw8iFOlMuDMFfQ5
	say3FgoWrLr0dNWJvN1PlHIhsZ1CZepDTxhaPqWm2wE8QB5Hk3/RulsjyiBQf13B317/YZ7rGGY
	APpQlicwD7cuOJazBakKJ5BhT18heMswt0E6sAM8Xklsjs8hEdHZymj5lkhA5HPaQo94+TWZeO6
	/ksJttV22PuOVHkG5Sbsde1Szo0nguoIBtvhrNiMLB57adorEp6bTJc6XjNc5z0s+xLrByNK/X8
	TvcclyHXSXV/SBp8j4w/06FTgbM+l7rBEPrLTFEHmrLiHuix7wiDg4TKxP1w6lokxEz/uLQ8pYK
	KQkPw+CbjnRp2Py6/vM8zhKzgA3ATCUhv2GiEPAwzwVFgNYBhEk939dg6Wza4cCZWAsx87KnlQP
	mif
X-Received: by 2002:a05:600c:c1c8:10b0:493:c310:4106 with SMTP id 5b1f17b1804b1-493e68a1a8amr53671695e9.35.1783601052108;
        Thu, 09 Jul 2026 05:44:12 -0700 (PDT)
Message-ID: <bcbf3975-55e5-406f-b60a-1c12e114704a@suse.com>
Date: Thu, 9 Jul 2026 14:44:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] memory: adjust MEMF_populate_on_demand checking
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
X-purgate-ID: tlsNG-c1860d/1783601052-7903401C-3FE76076/0/0
X-purgate-type: clean
X-purgate-size: 3209
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:email,suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BCC1B73122A

Pull loop-invariant checks out of the loop. Furthermore reject such
requests for non-HVM domains, rather than treating them as no-op and
signalling success to the caller.

Sadly with this the compiler can't DCE the function call anymore, so
we need a stub now.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I was tempted to invert the condition of the if() in the latter hunk, for
the remaining one in its present body to then become "else if()". The
larger resulting diff may be disliked, though ...

Handling of other sub-ops will continue to silently ignore
XENMEMF_populate_on_demand.

--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -626,12 +626,12 @@ int p2m_remove_page(struct domain *d, gf
 int __must_check guest_physmap_add_page(struct domain *d, gfn_t gfn, mfn_t mfn,
                                         unsigned int page_order);
 
-/* Set a p2m range as populate-on-demand */
-int guest_physmap_mark_populate_on_demand(struct domain *d, unsigned long gfn,
-                                          unsigned int order);
-
 #ifdef CONFIG_HVM
 
+/* Set a p2m range as populate-on-demand */
+int guest_physmap_mark_populate_on_demand(struct domain *d, unsigned long gfn,
+                                          unsigned int order);
+
 /* Enable hardware-assisted log-dirty. */
 void p2m_enable_hardware_log_dirty(struct domain *d);
 
@@ -645,6 +645,14 @@ void p2m_flush_hardware_cached_dirty(str
 
 static inline void p2m_flush_hardware_cached_dirty(struct domain *d) {}
 
+static inline int guest_physmap_mark_populate_on_demand(struct domain *d,
+                                                        unsigned long gfn,
+                                                        unsigned int order)
+{
+    ASSERT_UNREACHABLE();
+    return -EOPNOTSUPP;
+}
+
 #endif
 
 /* Change types across all p2m entries in a domain */
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -239,8 +239,16 @@ static void populate_physmap(struct memo
                                      a->nr_extents-1) )
         return;
 
-    if ( a->extent_order > (a->memflags & MEMF_populate_on_demand ? MAX_ORDER :
-                            max_order(curr_d)) )
+    if ( a->memflags & MEMF_populate_on_demand )
+    {
+        if ( a->extent_order > MAX_ORDER )
+            return;
+
+        /* Disallow populating PoD pages on oneself, or on non-HVM. */
+        if ( d == curr_d || !is_hvm_domain(d) )
+            return;
+    }
+    else if ( a->extent_order > max_order(curr_d) )
         return;
 
     if ( unlikely(!d->creation_finished) )
@@ -279,12 +287,7 @@ static void populate_physmap(struct memo
 
         if ( a->memflags & MEMF_populate_on_demand )
         {
-            /* Disallow populating PoD pages on oneself. */
-            if ( d == curr_d )
-                goto out;
-
-            if ( is_hvm_domain(d) &&
-                 guest_physmap_mark_populate_on_demand(d, gpfn,
+            if ( guest_physmap_mark_populate_on_demand(d, gpfn,
                                                        a->extent_order) < 0 )
                 goto out;
         }

