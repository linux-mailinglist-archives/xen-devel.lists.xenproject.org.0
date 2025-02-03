Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D282CA25FDB
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 17:26:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880819.1290911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tezGq-0007Hl-SA; Mon, 03 Feb 2025 16:26:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880819.1290911; Mon, 03 Feb 2025 16:26:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tezGq-0007FD-PC; Mon, 03 Feb 2025 16:26:00 +0000
Received: by outflank-mailman (input) for mailman id 880819;
 Mon, 03 Feb 2025 16:25:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LRcK=U2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tezGo-0006gZ-Uk
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 16:25:58 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c1dcf9e-e24b-11ef-99a4-01e77a169b0f;
 Mon, 03 Feb 2025 17:25:57 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-aaeef97ff02so734936366b.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 08:25:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc723e9fa7sm7887040a12.20.2025.02.03.08.25.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 08:25:56 -0800 (PST)
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
X-Inumbo-ID: 8c1dcf9e-e24b-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738599957; x=1739204757; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wjjO+oX3Rn5nOrCNhbNhuPdUywe7q/Lj3Qv2JuuHtvg=;
        b=E8nIwFD0EqfooZaNsX8C7Riolqtc27dXOmkabrvXWMUnrcrlPdPODX0h8YWUxZ5Q52
         tdrQ05qG/bcfSW6uQRN1fE9ufAEB2eu5+BpzQcAK2yAcWflqiccJseyvibhegRlX7wgJ
         R9Ia0htHCHg9HiI/p7QXrrHlxo47+jKZF5ulXBJIuYZRDhOg/OViqWJLafQIWKaknFoZ
         vGa+xTaN7zX0K06aoTcZS2HqbRsUyBAhmVK9644y62crnp111f/OmlCKurFHBQMyQONg
         LcPAc0LVFVIznOWJrGS+kczlwi65/Mu6kb3WVWFwLrvWE8ZBCxlI3DiFbheAuHKXihvp
         nl3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738599957; x=1739204757;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wjjO+oX3Rn5nOrCNhbNhuPdUywe7q/Lj3Qv2JuuHtvg=;
        b=FTiSZzknnU+PEVFfzAtcS//E89SBAATYTb6YAN1tO/B0GLRzTGSp7Lzv2sZdAAXObu
         JYEsM1Q0yOIbUnLcC7j06MEHgVWpUVdq4GjB4cq+bDKxjly+KdMZ19T/gddFCZ7uezd7
         IVxnaD4sqUtHVlPYu0MMys5GNvquls911xgjRmnoTCAYfTI8sL6Y7wagdEs8xJq02bwN
         W+fqGTAkxP2ilnjksE3tHhAMp74Q9Hjw6N7bcmHQYOw3QVLPc962rgcww5vNlE+Ho2bN
         6YvxqNCXKir0/QQ2V8bR+frHdXwbZr0LT9xSToUe9Bamsnwnd8kJf+xBSrS5gRhCQeOw
         p/yg==
X-Gm-Message-State: AOJu0YyGlgRa2/xM3eP3QocKl0GoW276v5d7uC8ve6H13cBeQoQD4Dcv
	xzVlRb7LvxCziyKvb++rXyxYabx57p5VUPquUoej0uZTgvju29ScaNP3sq/ydyFPLsosK7PYnr8
	=
X-Gm-Gg: ASbGncuJTCzlXHYZRHeurtfFhf53z/reJxXeIVVUhzfS8AaHf85tqmxGu16/C4TBTYq
	K91m/PhUEDuV+yUkFuMk0zNGVD1OJW4JeALdFxaDQgL48c9DqET7WfS8k8MGSbAWSOF0MoQtkPI
	tu83SJc0MTwzgyx0Mu4NshUQLqYeZRY7upQz1FR6Cvj2CA9PVoFnRrUsR+Any5K+iyttilB6PZD
	FtrK6XLFoNdNhbQ/Y1oITTxna+hjKuIZ2DnwA6/E91zwcuWRIvAijJe38ANx1pMw0n3NtPnvjOD
	m2GCu8uKlZPHrcbQhbTc19mGsI0yWv3Eanpoa42y0KeOZwjaPxs2xfUB1q53MgroeKmLf8NtKPk
	7
X-Google-Smtp-Source: AGHT+IEdvK6AIcKYCyPgN3B9KJ5lzFLVafJd2t7AILbdH44gdObuanhv/QOKLsCEcDEn3l0sdYonkQ==
X-Received: by 2002:a17:907:6d1d:b0:ab6:fd1d:ef6b with SMTP id a640c23a62f3a-ab6fd1df208mr1775760466b.27.1738599956872;
        Mon, 03 Feb 2025 08:25:56 -0800 (PST)
Message-ID: <c68586ea-9e6a-4922-9c33-1691bd26931c@suse.com>
Date: Mon, 3 Feb 2025 17:25:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 for-4.21 4/6] radix-tree: drop "root" parameters from
 radix_tree_node_{alloc,free}()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
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

They aren't used anymore.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
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
 	call_rcu(&rcu_node->rcu_head, _rcu_node_free);
@@ -104,7 +102,7 @@ static int radix_tree_extend(struct radi
 
 	do {
 		unsigned int newheight;
-		if (!(node = radix_tree_node_alloc(root)))
+		if (!(node = radix_tree_node_alloc()))
 			return -ENOMEM;
 
 		/* Increase the height.  */
@@ -155,7 +153,7 @@ int radix_tree_insert(struct radix_tree_
 	while (height > 0) {
 		if (slot == NULL) {
 			/* Have to add a child node.  */
-			if (!(slot = radix_tree_node_alloc(root)))
+			if (!(slot = radix_tree_node_alloc()))
 				return -ENOMEM;
 			slot->height = height;
 			if (node) {
@@ -574,7 +572,7 @@ static inline void radix_tree_shrink(str
 			*((unsigned long *)&to_free->slots[0]) |=
 						RADIX_TREE_INDIRECT_PTR;
 
-		radix_tree_node_free(root, to_free);
+		radix_tree_node_free(to_free);
 	}
 }
 
@@ -639,7 +637,7 @@ void *radix_tree_delete(struct radix_tre
 		 * last reference to it disappears (set NULL, above).
 		 */
 		if (to_free)
-			radix_tree_node_free(root, to_free);
+			radix_tree_node_free(to_free);
 
 		if (pathp->node->count) {
 			if (pathp->node == indirect_to_ptr(root->rnode))
@@ -655,7 +653,7 @@ void *radix_tree_delete(struct radix_tre
 	root->height = 0;
 	root->rnode = NULL;
 	if (to_free)
-		radix_tree_node_free(root, to_free);
+		radix_tree_node_free(to_free);
 
 out:
 	return slot;
@@ -682,7 +680,7 @@ radix_tree_node_destroy(
 		}
 	}
 
-	radix_tree_node_free(root, node);
+	radix_tree_node_free(node);
 }
 
 void radix_tree_destroy(


