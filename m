Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Wv+YLjjgHmoGXgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 15:52:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 133C662EBCE
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 15:52:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=NvWgky2c;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1325070.1590602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUPXx-0000Pi-PK; Tue, 02 Jun 2026 13:52:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325070.1590602; Tue, 02 Jun 2026 13:52:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUPXx-0000Og-L4; Tue, 02 Jun 2026 13:52:45 +0000
Received: by outflank-mailman (input) for mailman id 1325070;
 Tue, 02 Jun 2026 13:52:44 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUPXw-0000NV-NP
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 13:52:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUPXw-003qeU-3t
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 15:52:44 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ee026-e002-0a2a0a5209dd-0a2a450298c4-28
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 15:52:43 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ee02b-af86-0a2a45020019-d155802eb526-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 15:52:43 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4906869f0cbso107478555e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 06:52:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b0daefbbsm116929945e9.0.2026.06.02.06.52.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 06:52:42 -0700 (PDT)
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
        d=suse.com; s=google; t=1780408363; x=1781013163; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Tpnmn+L6WxBMBsYLWgK2xN4hOzNIW1jb44I8BXzpbs0=;
        b=NvWgky2cWBCBr0SUSwfqjYBzRYlk6tbejTlspp+5fo62TUmS++lD754WT9TmHBxJCe
         dlDlNxzfnLr1C8WW8livgZaiFRU2W/KSDgLq6WV11W4eKYLv/JvGO//y1UxhDH5N3tfo
         UXVCCdYeeKNJpMADW1LeZRiFa81Lc/DnZ4lfqEVMZP9t6uMF3VkZ/Vq+/btJ9pXh3gjY
         all1VQngffZYfWStDCqbZcOj0O6RIfU4C2g9TMN+Ca5qbdxluRx6Wc/qAnmu7cu3J4Oe
         82IiqnsTb/EsO0poTEA5gTmjQ7tOdcO9KHF5bpO7AGGFklQwPzC5NEZMWm3mU94dyC26
         +xgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780408363; x=1781013163;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tpnmn+L6WxBMBsYLWgK2xN4hOzNIW1jb44I8BXzpbs0=;
        b=LB2xnJqeK+KbBCK+HHEJIaJ/P1arEK5h8FN8fJaVNeqkBVm+VqINXHc0+/6Bx+jeky
         Wza6hvMjYRuhM/BgmpTfOBwvu3yjiDYiiQBaZ11GV+fNn6IpOhwEOHIYVAflbIq4E+z4
         h1dQtQ/juVpoSdZkhvV+tYViBLUSNk2PsRd5gVDsEgrtecS7Z9DJ+tjFseNyalTfJySC
         nrPjGMvZrN47rRRJjnvOtGJ2DerlGT6A/d+9t55hykN5+yvM5qGj1g3NQnfy8J3nyLv8
         ze1IV7bztGTY4REnz6EZJcjksmWayaU/JHZ8bJO61t8zjvpiV79N/myHaQ8WYFaM3p1k
         QBow==
X-Gm-Message-State: AOJu0Yw3IqmYc8edNkODrP5qkaeIKyRF69+pazBBXH0h54QPu861bFxT
	DaRi+Qgj7pMsolsxzEYRuBqHCbsxOb+4vXz5NbJrypWllhCghNf+nrQLmGqC48LGqSxtZJrQDMc
	G6Es=
X-Gm-Gg: Acq92OGZM/xY+B7PAvEwKrgBN9VYtbAgJ56FCUNVdNDjlIf3AfUWMpm296cqgvDNTmQ
	No1wacjpLp871heclh1aVDnmch1P0qlKt2ifK/JSRh+a+K0SiAY25NeqsZ6N2yJfv+FHz5/N/fZ
	+bbXrp8alnt5q8KOgb0DGpViTjyewBVm3pxUARkIrh47OOBFQ0/74RMqy4NcVzhXOPHPybB5H0P
	7D0EZzMJ2jrEp+RvMtJCxTCs50R1cdWrAnum7EDf4gdun++KaJ/bvdqMKCwDwE2Z03FuVLjsczT
	gLOPHCgXAtDQs+Hzhsjfqcm8aKjj90Ukf647dfcgTGg1p+729n3vgrlOgDU/AEgZK512Z3KWVE4
	f9vgZplCPAoy8GJY32DwQ7DRmZJPCxB+DQQxQ+GEKQB1YpUPSChnhMY5J5sO8MIBSJwt+wIat78
	3lTy99beaycYAan4CoObcJHHL2OybI+Pr15qyqmQ7LGYhJALrkT/ESG2PGdtqZhavqLJZev4Wfb
	baAolc43OmdYwdrgKFvbor1HA==
X-Received: by 2002:a05:600c:c0d1:20b0:490:688b:f10d with SMTP id 5b1f17b1804b1-490a290ec8fmr209884595e9.7.1780408363294;
        Tue, 02 Jun 2026 06:52:43 -0700 (PDT)
Message-ID: <a8a84f5b-05b9-4038-807c-8151cc705583@suse.com>
Date: Tue, 2 Jun 2026 15:52:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3] x86/PV: drop a local variable from pv_emulate_gate_op()
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1780408363-B0979161-9781395D/0/0
X-purgate-type: clean
X-purgate-size: 800
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:nicola.vetrini@bugseng.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,bugseng.com,gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:mid,suse.com:dkim,suse.com:from_mime,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 133C662EBCE

The inner "rc" shadows the function scope one, thus violating Misra C:2012
rule 5.3 ("An identifier declared in an inner scope shall not hide an
identifier declared in an outer scope"). Drop the inner variable, as
there's no other (later) use of the value it holds.

No difference in generated code.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Use alternative approach.
v2: Re-base.

--- unstable.orig/xen/arch/x86/pv/emul-gate-op.c	2026-06-02 15:15:17.960392177 +0200
+++ unstable/xen/arch/x86/pv/emul-gate-op.c	2026-06-02 15:40:58.000000000 +0200
@@ -287,7 +287,6 @@ void pv_emulate_gate_op(struct cpu_user_
     {
         unsigned int ss, esp, *stkp;
         uint32_t value;
-        int rc;
 #define push(item) do \
         { \
             value = (item); \

