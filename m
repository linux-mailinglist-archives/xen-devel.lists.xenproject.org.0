Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD266A27261
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 14:03:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881406.1291552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfIaU-0005Ex-Uk; Tue, 04 Feb 2025 13:03:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881406.1291552; Tue, 04 Feb 2025 13:03:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfIaU-0005Co-RE; Tue, 04 Feb 2025 13:03:34 +0000
Received: by outflank-mailman (input) for mailman id 881406;
 Tue, 04 Feb 2025 13:03:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yELw=U3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tfIaT-0004pU-S5
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 13:03:33 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70190486-e2f8-11ef-a0e7-8be0dac302b0;
 Tue, 04 Feb 2025 14:03:33 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-aaeef97ff02so878250066b.1
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 05:03:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e47d06casm931006266b.58.2025.02.04.05.03.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 05:03:32 -0800 (PST)
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
X-Inumbo-ID: 70190486-e2f8-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738674213; x=1739279013; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YA3OQxws77HgJGP3CurYrOn0Nh0s0d0+YcaOV1dj20Y=;
        b=UhTYoUnxwyi7NwOOHh9SnTCdSNveqaMe0f9vrAEZbLMBop9V/FQloAe4ab9tpDl+dc
         g6JXaXXqfR4b+6HLL52AZqH79Yi8eVsP39FCgiVm3/Js6bMHzNo2Hx0AalrGzk3Dt954
         828K4nWgo0Fo++Zn1g+RWLxGHbGD+D7b+kU/IW1LlqtsQIpcrTyb2aMKMA5vLg3+xTF/
         U/jQ4fEzU5uj//q8g6qs5G2IMboIUKpL/vzEfwsmZfSmv6mBqJk/efh+L97dLy747ztV
         eA6x1BPs8CR2+yF1DVFCAMPpU7WpygCeuIR+ju61W4sUGVnhr3B8UHodYJj4sLQ8S8CA
         p2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738674213; x=1739279013;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YA3OQxws77HgJGP3CurYrOn0Nh0s0d0+YcaOV1dj20Y=;
        b=uGa3EBXP9dX+mysL0hRauggDSEDV+Su5bp4UdtodUrsly/dZxCp5yti71qrlIIfWW6
         E9GfyiKv1qaf4YskQ8pD9m71TGRtzyTfNm6vlO4tpDIhUmwTcvGtcSm7xbmLLkpVBACE
         J5vF2BYUnoMMTKjmHyN2WwPLR/BodN0+6Gbj/j0JTg2GqAYQAphAadhu+xuhdXDUyqb9
         VebHbKz9qr49rc5ZnZeWXrtp0sppIpPSbpSROa8bGFbvtUjh6ooWCAGJvvikRLfOl6Q8
         32LjoUslh4rroVqOSMYvmiQrQU/X3AY45iEOOqg29KjLl8Dz/8NrGGCVuIi7bf86Ocxj
         gqHA==
X-Gm-Message-State: AOJu0YxzYheV5VzO1oZY0hS+N+ReMQ8s/fvlqrCHEpkeJt7A2DsQ7MUx
	LhgnkfbFtlDVPKpsIV0DaWKOFORDbi6OhsvVmZUpDkl+Z4ibJnWQhhp1/7QuWp1mMf1n8vevqeg
	=
X-Gm-Gg: ASbGnctt6zF1N9L+38BfmIUS2s5CBcxEmoYwZFJFKynGMEDr7tb+s3C1NP7EpQBZQO5
	PucKORrc+0WD4QuZ/I5XkIRGr97kwsraNOEkiQcdmlybsMM68MuAph/CcmIJbFICBmvBMj0yq8u
	yny0TBYhmsrushGhn6LuSEzwJBAZVB7RZEmoeTmQnqcyjWfNOQBfkep51BT5urzGgSyVtLkNSa8
	sRMHpfpZFCDIZRbRq567TP2BqahzCR/8L+y4BQEC6DOx/JO7g7TKwafOi3oVeQio5n+PZdmBor3
	ct4wN50zGunuFb6sgxYQAnefDroUzEzzDhPEfidbOnolTQ1pnwbfiMVwrkSo7BeDk1Np3kfOoV9
	q
X-Google-Smtp-Source: AGHT+IGIeQkGB76i3FAhXpPuqPMz2fqz8HAEA+arwy19owpboW918xPuobVxq8yyBVJLKykqxDmJIA==
X-Received: by 2002:a17:907:7f90:b0:ab2:c1da:b725 with SMTP id a640c23a62f3a-ab6cfd07cb1mr3104813066b.30.1738674212543;
        Tue, 04 Feb 2025 05:03:32 -0800 (PST)
Message-ID: <adc7fe1e-4d2d-4941-b514-c90977ab4566@suse.com>
Date: Tue, 4 Feb 2025 14:03:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 for-4.21 3/4] radix-tree: drop "root" parameters from
 radix_tree_node_{alloc,free}()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <0a006732-2b6e-46f0-a706-f432abd45d2c@suse.com>
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
In-Reply-To: <0a006732-2b6e-46f0-a706-f432abd45d2c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

They aren't used anymore.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
v2: New.

--- a/xen/common/radix-tree.c
+++ b/xen/common/radix-tree.c
@@ -60,16 +60,14 @@ static void cf_check _rcu_node_free(stru
 	xfree(rcu_node);
 }
 
-static struct radix_tree_node *radix_tree_node_alloc(
-	struct radix_tree_root *root)
+static struct radix_tree_node *radix_tree_node_alloc(void)
 {
 	struct rcu_node *rcu_node = xzalloc(struct rcu_node);
 
 	return rcu_node ? &rcu_node->node : NULL;
 }
 
-static void radix_tree_node_free(
-	struct radix_tree_root *root, struct radix_tree_node *node)
+static void radix_tree_node_free(struct radix_tree_node *node)
 {
 	struct rcu_node *rcu_node = container_of(node, struct rcu_node, node);
 
@@ -105,7 +103,7 @@ static int radix_tree_extend(struct radi
 
 	do {
 		unsigned int newheight;
-		if (!(node = radix_tree_node_alloc(root)))
+		if (!(node = radix_tree_node_alloc()))
 			return -ENOMEM;
 
 		/* Increase the height.  */
@@ -156,7 +154,7 @@ int radix_tree_insert(struct radix_tree_
 	while (height > 0) {
 		if (slot == NULL) {
 			/* Have to add a child node.  */
-			if (!(slot = radix_tree_node_alloc(root)))
+			if (!(slot = radix_tree_node_alloc()))
 				return -ENOMEM;
 			slot->height = height;
 			if (node) {
@@ -575,7 +573,7 @@ static inline void radix_tree_shrink(str
 			*((unsigned long *)&to_free->slots[0]) |=
 						RADIX_TREE_INDIRECT_PTR;
 
-		radix_tree_node_free(root, to_free);
+		radix_tree_node_free(to_free);
 	}
 }
 
@@ -640,7 +638,7 @@ void *radix_tree_delete(struct radix_tre
 		 * last reference to it disappears (set NULL, above).
 		 */
 		if (to_free)
-			radix_tree_node_free(root, to_free);
+			radix_tree_node_free(to_free);
 
 		if (pathp->node->count) {
 			if (pathp->node == indirect_to_ptr(root->rnode))
@@ -656,7 +654,7 @@ void *radix_tree_delete(struct radix_tre
 	root->height = 0;
 	root->rnode = NULL;
 	if (to_free)
-		radix_tree_node_free(root, to_free);
+		radix_tree_node_free(to_free);
 
 out:
 	return slot;
@@ -683,7 +681,7 @@ radix_tree_node_destroy(
 		}
 	}
 
-	radix_tree_node_free(root, node);
+	radix_tree_node_free(node);
 }
 
 void radix_tree_destroy(


