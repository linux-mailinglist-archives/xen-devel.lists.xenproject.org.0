Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FCAA2725C
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 14:02:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881396.1291532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfIZ7-0004Kn-DI; Tue, 04 Feb 2025 13:02:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881396.1291532; Tue, 04 Feb 2025 13:02:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfIZ7-0004Ia-Ah; Tue, 04 Feb 2025 13:02:09 +0000
Received: by outflank-mailman (input) for mailman id 881396;
 Tue, 04 Feb 2025 13:02:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yELw=U3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tfIZ5-0003om-0q
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 13:02:07 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c24453b-e2f8-11ef-a0e7-8be0dac302b0;
 Tue, 04 Feb 2025 14:02:06 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aaf3c3c104fso1075801966b.1
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 05:02:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc723d0043sm9405388a12.12.2025.02.04.05.02.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 05:02:04 -0800 (PST)
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
X-Inumbo-ID: 3c24453b-e2f8-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738674126; x=1739278926; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6RvyDtGk9uukOr9PtLB087jXoCbv9C88nLmliW6XJIE=;
        b=cP+k2bqn9P+G0zBJlmjkYKm/73zPD7ZnffDdPxjcx6JnPsUjMABsJ2Tss5w7/TKcOV
         o0FUjqbTXYD4Z1lo0O11Nz1wy/W0Ss9ljT79A0RiCOuqvaAcLEAOBOddRPGDfkauQ1II
         OVQtfAc1yI5bDxTetdUcWI9Iiy7swkRVScfIQTKWGq05q9W+3WIj27L5afZp2ta6T99y
         rMpmqnbrDLkAP5Dp+T1TG1UNmK/LDy33EdrqeP83d/dwMhEN59fYRkU3VwTIfZPYFHwf
         EC9d82It+L+hpEGvkw5XWy52UzRsHaKAuX/JOCzPjUlzUGu5n+8Xw+KIxU60eiOf+RbC
         sXYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738674126; x=1739278926;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6RvyDtGk9uukOr9PtLB087jXoCbv9C88nLmliW6XJIE=;
        b=RJftdZjA1nMePTPwDZywd4pJubQDVQP9jvSpbSW8zNwBxeumwDri2wLkMtwtyLFLAI
         3lGo5TkJjXnm05O7xGKm7bwJIjFNHAlSAMbAL6xz6AcsIQNktZblnlmzwdgkMKSCUfGK
         uQVglVo3hsG22qkmBbRmLIpkIlc7DPBDQYjj0H4QBL0qbHWBSW3Gutun6HNcHo0Ahn8y
         IEWHV4i396g1fC1ahjBlanfn7hiCyv0ZtNU11RoQnGYqVSg/K62OSfg48Vp3ESO/NwUS
         6aIYJ57ATMJ8UEl/9l8i/B85oK0DnyxuUnD4iRd6PFRew/1qYC/fHCUAewE3SJIwvAX2
         8Sig==
X-Gm-Message-State: AOJu0YywNz5BD6wquWe6+/p0yiwKOF4UoSLz3AOu3mCPLL+JPAoT64op
	MxSn394zfXBA8lYXhL7NKduKYIFFBS63Hen6BYyAxnFEa+sDfwrgeoCf7zZLyFNov6n9QCjrlds
	=
X-Gm-Gg: ASbGncsntYBkyR7cH/vjP6RYwebMurxpzay1G94VLbMg8shmVd7K7jXIx4oTfCNoma/
	T0p+czV599YMzOQdWfk/X0dazF2tTFTK66NQEeuo4LX669EZXfR5EdNvO8AwWrxjgsHgAE1S4Mn
	tZnhnMP9/5GFx7o9G8yAVY5MDQPkjKg5T4aydjtycRXJy4GyCts/YRwYMD5aXn8HwaiZRwk8Rcv
	33OwN6g+IEMAq0wi8k9Yb4NsfgS3Alkd9L0Myvd9FUE4uRLyzSO4YjQ/9eB2DGbkam0l5kIO81q
	fMqrhLn5AU1BLuCIYLAl2L6OMfjCHTvwqgNoiPbcDVSy4NBRLpu/Z9RsNJ4BiMs1rQHDIuVHqze
	b
X-Google-Smtp-Source: AGHT+IEhyOjIZCmOVA0k4fvkoQ+zp2QBu39ctZljJnxK8dGWOYij0JtJy6HvfIm9V+d0WyyEGhD6mg==
X-Received: by 2002:a17:907:3d8f:b0:ab7:8e7:7df8 with SMTP id a640c23a62f3a-ab708e78014mr1884922966b.22.1738674125160;
        Tue, 04 Feb 2025 05:02:05 -0800 (PST)
Message-ID: <b2f8cd0d-69a8-4317-8fa8-9c54f45fff9e@suse.com>
Date: Tue, 4 Feb 2025 14:02:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 for-4.20 1/4] radix-tree: purge node allocation override
 hooks
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
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

These were needed by TMEM only, which is long gone. The Linux original
doesn't have such either. This effectively reverts one of the "Other
changes" from 8dc6738dbb3c ("Update radix-tree.[ch] from upstream Linux
to gain RCU awareness").

Positive side effect: Two cf_check go away.

While there also convert xmalloc()+memset() to xzalloc(). (Don't convert
to xvzalloc(), as that would require touching the freeing side, too.)

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
v3: Add a missing blank line.
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
@@ -66,26 +60,20 @@ static void cf_check _rcu_node_free(stru
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
+
+	call_rcu(&rcu_node->rcu_head, _rcu_node_free);
 }
 
 /*
@@ -718,19 +706,6 @@ void radix_tree_destroy(
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


