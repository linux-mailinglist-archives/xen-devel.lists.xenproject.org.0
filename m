Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Jyw/MbR7Qmos8QkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 16:05:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 281EF6DBB94
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 16:05:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=B6nLgqWV;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1347561.1605395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weCc6-0005uo-L2; Mon, 29 Jun 2026 14:05:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347561.1605395; Mon, 29 Jun 2026 14:05:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weCc6-0005tg-IE; Mon, 29 Jun 2026 14:05:30 +0000
Received: by outflank-mailman (input) for mailman id 1347561;
 Mon, 29 Jun 2026 14:05:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weCc5-0005tV-Jm
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 14:05:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weCc4-00EWGJ-Bp
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 16:05:28 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a427b9e-e002-0a2a0a5209dd-0a2a4504b6d8-18
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 16:05:28 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a427ba8-a01d-0a2a45040019-d155802cadca-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 16:05:28 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-490b1bbcf3aso17490905e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 07:05:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4926c2954efsm209178635e9.2.2026.06.29.07.05.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 07:05:27 -0700 (PDT)
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
        d=suse.com; s=google; t=1782741928; x=1783346728; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D4I9wUbIVvvTjP7ZMlkcpb2mh95VgkljGsAJESVpA+4=;
        b=B6nLgqWVNXmiSVpXwdHPxN3kda6d+4tF2A+0K0sOYyNzNB0BNvo8l3a8U4ShWJL6Gf
         C+0g9tHpv/P+4HQu5SyGyQ7a13lAWPd1es8FezaHYKyAq1HadWIj84qVuM3lr/ifof3D
         9BfMGMvbnWJmzCYRTSfTYgjdfL8gCpkqmHLAHKfocXJMRL7QP2WGKI+1XTmJHV+hOaYu
         JNGDj/oc3A36CEXgacdYVpyCCjU9g3GleKqaw39oiUFmN3pYMZzAHdTGDD2eEGQGgaCm
         CaRnigF6p/PQYR8Igvkm0kAY8Kascnjj+66m66xOg7eGFvTgrKshhERi0/7rBiZsbyXU
         3FEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782741928; x=1783346728;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D4I9wUbIVvvTjP7ZMlkcpb2mh95VgkljGsAJESVpA+4=;
        b=TC50xErqgYbmK9Vpv8fVJvVxuGdjKTWz5c0cniyF4ucspQ95t/ZyTEQwTX342MpiWN
         TJqU2zQOmg2vgDeQDKuzQVXMaKurVMlhOR7FuAD9/2TDb2UCxyUHfcmUotIXm2B2r9O7
         /sJ3KAKqCpke7JeUy+um5leGFq6wKKTgJIgeFJKd4SeKD1VR/rz6Ms5g5sNquwUq09oG
         pnmC5x4g+/GEUHz1ZPHNT0ipolEDHx74Q9y/8EUHqQQinIYsQfaqEzPL7x4Ps2YTSC81
         +oo/UNXRGXaFXRBzzOmGHEpjoOwUnhjgmm7U9vyoEsvUE+egMSCQqw3/KdMZHGMLkITa
         pymw==
X-Gm-Message-State: AOJu0Yx0b2MTgvdm0tVGy4lzCf1JQeHgY4pO98MFgQEVAqE4hPXR6R15
	5Y7sCFQEfrbrRUFXlFRQGL8oA4D005MBt7L5eAlvXoVR8rmjYqLKyAcTzL9ljZsErZ9q3jAHXPZ
	j9Yz69Q==
X-Gm-Gg: AfdE7cnyhH6z00ARbSviC01G2f9QmxEfojLonacp2phPd1Dw47m1/qhxqk3KzzaykCP
	Cy2vhdfiyAb3NIQ032k0byAjvkLCjkM7NV3z83l2uSUewfF8tK31EdFFAFsfgJEIv02tfbUXyFY
	5hxntbifj16gYJ/TjXXDtOZZkhU5OR866WaYkQyW/6GOyzvdshkhgDSS2UxdD3FdOwh4qjyBufi
	TUSLv1v94nYef5r7kh5DYHjASqIPWqYja7yhvF1ilVi59P+UwrmHPiJ5Xjp5kc/vXeufidcwugQ
	/i9uSFSLYcV4fNU/GPxoPqyUWN5cQ22u/XqQLC9hB4jTOLkd0UwKvMV3rCPnIVfTv0U+rwAHpuJ
	nlqKBkbU6GqaLGlx6hEPvXGCKPSZoUoVMuyLuqAyhrzi9V5pflS8q9ZKiH6/Syr3sPBJTmW2cqg
	X75LRcaMgwC+vGYWGhjmWQA4WfPKlHbyA084UDrskqbskE/m7AHJfukI6lB/5C5VFNuEk4uOUK5
	dOEopjwyoVbVgM=
X-Received: by 2002:a05:600c:3b93:b0:493:b2e8:6378 with SMTP id 5b1f17b1804b1-493b2e863b6mr43109965e9.4.1782741927649;
        Mon, 29 Jun 2026 07:05:27 -0700 (PDT)
Message-ID: <c511b3fb-2bf6-4739-a3fd-114976b77cfc@suse.com>
Date: Mon, 29 Jun 2026 16:05:26 +0200
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
Subject: [PATCH] domain: domlist_update_lock can be static
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
X-purgate-ID: tlsNG-ebf023/1782741928-AD13E1CC-24E2C06F/0/0
X-purgate-type: clean
X-purgate-size: 1124
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
X-Rspamd-Queue-Id: 281EF6DBB94

For a long time (if not forever) this lock has been referenced only from a
single CU. Misra C:2012 rule 8.7 (which we didn't accept yet) wants us to
have such identifiers non-external.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -58,7 +58,7 @@ bool opt_dom0_vcpus_pin;
 boolean_param("dom0_vcpus_pin", opt_dom0_vcpus_pin);
 
 /* Protect updates/reads (resp.) of domain_list and domain_hash. */
-DEFINE_SPINLOCK(domlist_update_lock);
+static DEFINE_SPINLOCK(domlist_update_lock);
 DEFINE_RCU_READ_LOCK(domlist_read_lock);
 
 #define DOMAIN_HASH_SIZE 256
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -697,8 +697,10 @@ static inline unsigned int domain_tot_pa
     return d->tot_pages - d->extra_pages;
 }
 
-/* Protect updates/reads (resp.) of domain_list and domain_hash. */
-extern spinlock_t domlist_update_lock;
+/*
+ * Protect updates/reads (resp.) of domain_list and domain_hash, together with
+ * domlist_update_lock.
+ */
 extern rcu_read_lock_t domlist_read_lock;
 
 extern struct vcpu *idle_vcpu[NR_CPUS];

