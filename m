Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF18BA25FD6
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 17:25:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880811.1290901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tezGK-0006iG-Kf; Mon, 03 Feb 2025 16:25:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880811.1290901; Mon, 03 Feb 2025 16:25:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tezGK-0006gq-HS; Mon, 03 Feb 2025 16:25:28 +0000
Received: by outflank-mailman (input) for mailman id 880811;
 Mon, 03 Feb 2025 16:25:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LRcK=U2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tezGJ-0006gZ-2s
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 16:25:27 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78de5357-e24b-11ef-99a4-01e77a169b0f;
 Mon, 03 Feb 2025 17:25:25 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-aaeef97ff02so734817366b.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 08:25:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e49ff75esm790295566b.99.2025.02.03.08.25.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 08:25:24 -0800 (PST)
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
X-Inumbo-ID: 78de5357-e24b-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738599924; x=1739204724; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O3fWtnzy8q95r0vZdz81zagpku9xK1NzgCFks3bIOlg=;
        b=bJV2W/Rvf07/4jIAFCcw5qW3zZ7s7Zfac23+4n9h6bs6TR5e3S7UAJwZiC9FfaU0iY
         28HCY16S9m8jn+e1PgjaGq95oZ6QvbQiMpuTf46o3prCbEvAo6h28nNH++fg0rMjNyxf
         o1Gsyglee621hXO+zNmdg1EfrdgtD2+Lg7pv1fwQh1IDrQYcWVzHIe4ywQ6b+TWPSlsH
         hWRGZPuHB0ROOuftHF6pzs3EFL2Yyl95NGKG6mvpx6YNOjvIkRLbklJWLmey0fwUbdgp
         7x970uAMbN0QfGwPS5SA3yzdd2BmYEfPiDtN/wtNOyPJbejqoStW5NTX8OBsgMYAQn7o
         n/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738599924; x=1739204724;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O3fWtnzy8q95r0vZdz81zagpku9xK1NzgCFks3bIOlg=;
        b=kmX88lNxm/BKfbdAVKiK+PTCgXmXG4pnqbJbywHIB3Iq0LVtuQJDpu/5Cxtn2fck9H
         cbN/RrXCD2wURigr8i2C4KMNDKFnkp6v38v4VF8oseC9VEfWZtD5Kfj2pO8UidA9TKoA
         zEO6tS9HqrFKbDGxouf37RZC3Ep3q0T8eiuaVv74WZ9nQvHs1oB4WV+7Q/b0gzCNuBsV
         gojYaYJozJ75NA+44Md6CD/wbztFopgDXY5b9oYbkDNupy5eroUJL6OOAOXX5PF2yiMt
         zfSNqvqQrwFMCJTzkPeSrE/iYoZn0ByjLZMfr4YQkW2bml4pcsAvNSIVqU5lGLRq57cb
         3ZuA==
X-Gm-Message-State: AOJu0Yw33/S4jRwVvoyBUGC96r+XinmWbQYGHeHxhFm9qxNni5y8n4VR
	2/vtHQwFdXHLlSXiP2/KvgdGLM38VbpaFe8DR1zY9T9/4/ghkZ478TJaAIqd8ynbHXW1z6dc3us
	=
X-Gm-Gg: ASbGnctxMj+bl14PTdzN8stu/vNB6pgk4bfNxcv0sxr/UpRYj8HjT0E9VtBXMaBcHTK
	YhuA53zS0uNMDtmnTgZe9xeEkzhanUGNA/sPssL6mRtq/xzdq5tNFmwG7RzD65EeUIh0MbzfRVw
	07Vp7n/UvRsc1cNU6QRHiICPBntLVGlP44J/T3Oxe5JaGjYOzdIZ95u8PyQABt8EYRs0uVCFy6y
	xr4UWAYqJugbDshHd4EooY7R1OLgCdk0TwxhJ8X/X5KMVNaO9EjHb+qepY9q05Fn9euTczFyAfM
	9gQCNV7DH0wQWtW9wHL+jkG5vhwEsEAhZQMWQmUENczMDppYidK4tD1mr6bgdbpZQMoQsghegRI
	/
X-Google-Smtp-Source: AGHT+IEh9r4ek3QzTRScwChgA3NhCa3o0NUsv5PuHAateBunzJOz8fX09E9gIRVtgsvQv9mzhi/DIw==
X-Received: by 2002:a17:907:868d:b0:ab6:d7c4:fc7d with SMTP id a640c23a62f3a-ab6d7c4fee7mr2571796666b.39.1738599924522;
        Mon, 03 Feb 2025 08:25:24 -0800 (PST)
Message-ID: <3c571436-b678-49bc-938d-892913e0e96e@suse.com>
Date: Mon, 3 Feb 2025 17:25:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 for-4.20 3/6] radix-tree: purge node allocation override
 hooks
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <30f29dde-15e1-4af9-b86f-0040658c381a@suse.com>
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
In-Reply-To: <30f29dde-15e1-4af9-b86f-0040658c381a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

These were needed by TMEM only, which is long gone. The Linux original
doesn't have such either. This effectively reverts one of the "Other
changes" from 8dc6738dbb3c ("Update radix-tree.[ch] from upstream Linux
to gain RCU awareness").

Positive side effect: Two cf_check go away.

While there also convert xmalloc()+memset() to xzalloc(). (Don't convert
to xvzalloc(), as that would require touching the freeing side, too.)

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/common/radix-tree.c
+++ b/xen/common/radix-tree.c
@@ -53,12 +53,6 @@ struct rcu_node {
 	struct rcu_head rcu_head;
 };
 
-static struct radix_tree_node *cf_check rcu_node_alloc(void *arg)
-{
-	struct rcu_node *rcu_node = xmalloc(struct rcu_node);
-	return rcu_node ? &rcu_node->node : NULL;
-}
-
 static void cf_check _rcu_node_free(struct rcu_head *head)
 {
 	struct rcu_node *rcu_node =
@@ -66,26 +60,19 @@ static void cf_check _rcu_node_free(stru
 	xfree(rcu_node);
 }
 
-static void cf_check rcu_node_free(struct radix_tree_node *node, void *arg)
-{
-	struct rcu_node *rcu_node = container_of(node, struct rcu_node, node);
-	call_rcu(&rcu_node->rcu_head, _rcu_node_free);
-}
-
 static struct radix_tree_node *radix_tree_node_alloc(
 	struct radix_tree_root *root)
 {
-	struct radix_tree_node *ret;
-	ret = root->node_alloc(root->node_alloc_free_arg);
-	if (ret)
-		memset(ret, 0, sizeof(*ret));
-	return ret;
+	struct rcu_node *rcu_node = xzalloc(struct rcu_node);
+
+	return rcu_node ? &rcu_node->node : NULL;
 }
 
 static void radix_tree_node_free(
 	struct radix_tree_root *root, struct radix_tree_node *node)
 {
-	root->node_free(node, root->node_alloc_free_arg);
+	struct rcu_node *rcu_node = container_of(node, struct rcu_node, node);
+	call_rcu(&rcu_node->rcu_head, _rcu_node_free);
 }
 
 /*
@@ -718,19 +705,6 @@ void radix_tree_destroy(
 void radix_tree_init(struct radix_tree_root *root)
 {
 	memset(root, 0, sizeof(*root));
-	root->node_alloc = rcu_node_alloc;
-	root->node_free = rcu_node_free;
-}
-
-void radix_tree_set_alloc_callbacks(
-	struct radix_tree_root *root,
-	radix_tree_alloc_fn_t *node_alloc,
-	radix_tree_free_fn_t *node_free,
-	void *node_alloc_free_arg)
-{
-	root->node_alloc = node_alloc;
-	root->node_free = node_free;
-	root->node_alloc_free_arg = node_alloc_free_arg;
 }
 
 static __init unsigned long __maxindex(unsigned int height)
--- a/xen/include/xen/radix-tree.h
+++ b/xen/include/xen/radix-tree.h
@@ -66,11 +66,6 @@ typedef void radix_tree_free_fn_t(struct
 struct radix_tree_root {
 	unsigned int		height;
 	struct radix_tree_node	__rcu *rnode;
-
-	/* Allow to specify custom node alloc/dealloc routines. */
-	radix_tree_alloc_fn_t *node_alloc;
-	radix_tree_free_fn_t *node_free;
-	void *node_alloc_free_arg;
 };
 
 /*
@@ -78,11 +73,6 @@ struct radix_tree_root {
  */
 
 void radix_tree_init(struct radix_tree_root *root);
-void radix_tree_set_alloc_callbacks(
-	struct radix_tree_root *root,
-	radix_tree_alloc_fn_t *node_alloc,
-	radix_tree_free_fn_t *node_free,
-	void *node_alloc_free_arg);
 
 void radix_tree_destroy(
 	struct radix_tree_root *root,


