Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bMvnMgZ8QmpT8QkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 16:07:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 320FD6DBBD1
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 16:07:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=KBwyb2bD;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1347569.1605404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weCdR-0006Qx-V3; Mon, 29 Jun 2026 14:06:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347569.1605404; Mon, 29 Jun 2026 14:06:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weCdR-0006PZ-Ry; Mon, 29 Jun 2026 14:06:53 +0000
Received: by outflank-mailman (input) for mailman id 1347569;
 Mon, 29 Jun 2026 14:06:52 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weCdQ-0006PM-AZ
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 14:06:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weCdP-000OE0-NZ
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 16:06:51 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a427be5-5cb7-0a2a0a5109dd-0a2a450aa978-42
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 16:06:51 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a427bfb-e40e-0a2a450a0019-d155802dcce5-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 16:06:51 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-49395888c7bso27394525e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 07:06:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493a55be64esm168239805e9.7.2026.06.29.07.06.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 07:06:49 -0700 (PDT)
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
        d=suse.com; s=google; t=1782742011; x=1783346811; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hu+gcgibmQ+tgMitLClBSqjV8kD6KM0JeAaRvCaPyF4=;
        b=KBwyb2bDquMg7PFbVo99RkD1s3eXAsufe0Q0orHLk1UpBjwqLc5ZQebfKy8TWhKUVY
         SWt/iLnZ8GxNk1GU4IJuml8j+JoWLCHKuMWiEBews0AfD2t7w5xWIz+gF/sUM0S1tcdD
         ZvW8lMRygwKWYGheBCI7R4Wvn6DXpWnC2BowTYLrL9MZZd/MKFQJvTwKiqsGhvacUvhg
         +Tea63MXMD8TA119gre2xZok6KDDr3lHg+Cg0o1uoSIf7wFwAdto8Vn3DC2sLYbv2pGT
         zHZjFwWrFw4IY8otgz5hVoLyMNAgDMPvUxYHLRqjwJglt3tSdjhQ7jfuYDmLzyFHp+wd
         4Htg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742011; x=1783346811;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hu+gcgibmQ+tgMitLClBSqjV8kD6KM0JeAaRvCaPyF4=;
        b=SMVq+Bg82qOzgSha5EDtBEO4Z5osHD1/EmABuSq8IJhfnzI/vbpSklmQHFk9QsJtUR
         ufxUw+U3yXkGvAnyLA/1Q7U/avWAeaDsCxIcdQwUawqKoAqN0cmqsDz0BCTtzFveD6Hz
         TJpYCgzGy/0AijyWOSR637yu5eO4MTQeRuETAL4Eeh+Q676V9zCtLHbYL8ILB0xBwFgr
         YBWZo+6sXtCe/l5D7KBOfJ4CHLtB9yaQHcBQgcswlhygysnzLZoLG+TmeZA/OwKPF16B
         5TMuDFl++o3fsayGUNLZxsEM2hIlK6+lpSqmoFznZp35blbdOsbOXNm1TGsGHCXpT+PC
         pshw==
X-Gm-Message-State: AOJu0Yz21pXlncChOJBV9Z/WmJzK6R8UHQA3W1HAzIpslN7hSIo+TYz/
	N3prT2uf2IkTW1fYa3t2D9cq+Tf1bjXXW+EWUhKKfjAsJZULSTWA8Gc0wzmJRZv33n8WwtAhZMQ
	sW1NVwA==
X-Gm-Gg: AfdE7cnIdWkrlIrmgraTKKD1EnNw5ZwWSRTfOiRygObWXuOVhhVK+eqIwrEKjbCSoQU
	R+/vcp3KdP3kYrLaf7/gu2nqwMTebPss7rTg2XH/SyGpExSPYv76CHJ73S8x5xviUZiNJCyJ6OH
	tFrYxj2e3/ZA/EuCJtK+iCngh1e2aMNR501TzrSwsieIjWE+g/E5+DNmLa4Y5FyQCPeTuA0wjn5
	0nv5yhd3qhee+fSipmD6uBbawu+6MW3PfNuyCVDJtG54keXWOWJmej19r7pnH9N5poMAAFWTpDT
	Zhdm/hbXV1tESI+p2kq0+kFSK+k7ipw86IWRdO5Fwy7NiJbI/IkYUZoV+cOc3mzxce1P2T1SEin
	wfUUbqydWZHNDoWj+G7CH4GZi91tOchZRYgCVsjt0fzWgGF97dJn7WwJ7RPWkjsovMM9uJeVtGv
	6/rxLtudxLIStyEExItoNdgnrXrExlpdi/wLQ4awMOxXcHFk4fiakL8cTq5WK0hFpDMuRus2c7o
	841
X-Received: by 2002:a05:600c:8519:b0:493:b637:60a0 with SMTP id 5b1f17b1804b1-493b63760b2mr23218005e9.36.1782742011025;
        Mon, 29 Jun 2026 07:06:51 -0700 (PDT)
Message-ID: <cd22dc70-9496-4f18-8476-62d445ff4518@suse.com>
Date: Mon, 29 Jun 2026 16:06:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] xmalloc: drop pool list
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
X-purgate-ID: tlsNG-4011c0/1782742011-3D275DDE-4BEDEC23/0/0
X-purgate-type: clean
X-purgate-size: 1380
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 320FD6DBBD1

From its introduction it has been used solely to add and remove pools.
No list traversal or alike did ever occur. Drop all of this as being dead
code.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/xmalloc_tlsf.c
+++ b/xen/common/xmalloc_tlsf.c
@@ -66,9 +66,6 @@
 #define PREV_FREE       (0x2)
 #define PREV_USED       (0x0)
 
-static DEFINE_SPINLOCK(pool_list_lock);
-static LIST_HEAD(pool_list_head);
-
 struct free_ptr {
     struct bhdr *prev;
     struct bhdr *next;
@@ -113,8 +110,6 @@ struct xmem_pool {
     xmem_pool_get_memory *get_mem;
     xmem_pool_put_memory *put_mem;
 
-    struct list_head list;
-
     char name[MAX_POOL_NAME_LEN];
 };
 
@@ -340,10 +335,6 @@ struct xmem_pool *xmem_pool_create(
 
     spin_lock_init(&pool->lock);
 
-    spin_lock(&pool_list_lock);
-    list_add_tail(&pool->list, &pool_list_head);
-    spin_unlock(&pool_list_lock);
-
     return pool;
 }
 
@@ -373,10 +364,6 @@ void xmem_pool_destroy(struct xmem_pool
                "%lu bytes still in use.\n",
                pool->name, pool, xmem_pool_get_used_size(pool));
 
-    spin_lock(&pool_list_lock);
-    list_del_init(&pool->list);
-    spin_unlock(&pool_list_lock);
-
     pool_bytes = ROUNDUP_SIZE(sizeof(*pool));
     pool_order = get_order_from_bytes(pool_bytes);
     free_xenheap_pages(pool,pool_order);

