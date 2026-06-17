Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V7sDLQhoMmojzgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 11:25:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 133B9697E02
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 11:25:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=HPDG3PhC;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1339907.1600945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZmVa-0004SF-Cc; Wed, 17 Jun 2026 09:24:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339907.1600945; Wed, 17 Jun 2026 09:24:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZmVa-0004Pd-6d; Wed, 17 Jun 2026 09:24:30 +0000
Received: by outflank-mailman (input) for mailman id 1339907;
 Wed, 17 Jun 2026 09:24:28 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZmVY-0004PR-B7
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 09:24:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZmVX-006qDL-BW
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:24:27 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3267c0-e002-0a2a0a5209dd-0a2a4507c1fa-36
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 11:24:27 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3267ca-229c-0a2a45070019-d155802af14d-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 11:24:27 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-490b64c8311so53969975e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 02:24:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922f9cd140sm137697255e9.0.2026.06.17.02.24.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 02:24:25 -0700 (PDT)
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
        d=suse.com; s=google; t=1781688266; x=1782293066; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FsFXFn26h3m/AJ+I/ja6X30TqyykKhFcLp6gwh9bgsQ=;
        b=HPDG3PhCCD6Bc/IWfc062kebixQLIDd9rO8Xe5rO3VMmiO3JnIrYCHj2J4pRFsNIkC
         n+aNWmT9R3fVUyVPHsA7PtFnefy0OurUG/g8vaTg7zky3l+Apcq3bd9RBHqHAuZGRdYN
         2hL6Dje/B6iMaNdywcCdqzexFYrt6p9DXgP6nyXBmWpAc/yaVM29moIOWJjfm6NJ/Ah7
         aAlCIDT1/C7pD4FefDfgFRC8Ayfpl/WQgkKRh33QkDX0qt7u9sFnVR0rceyv5vJxaLZT
         v41HJ1YwJtvA2OrqXJjKRbcK3Vs5nOQO5DxTSYKp3ohq5kQ/Ps+F2yAocoaI/aFyTzX5
         635w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781688266; x=1782293066;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FsFXFn26h3m/AJ+I/ja6X30TqyykKhFcLp6gwh9bgsQ=;
        b=Ht3B0JCvBOy+uVn6Z9oWb9BVXi4s+Sb4n2HvI6MhCB27Ed31TKW325h53tW3RiAC/4
         0TPPy5xJ5FIxm9wFbxFlKOine9m2W07yly5U9JGmgMFe8P3m3Lsv91FsgtN4I/F3uLlW
         rp97LoT1az+PIzC5p3pGi0p4y6xAe9NCc+rIhFy7ipr5eFlJeeWJyLuWS1Chy6HVzRzh
         vtbWK8i/4zZXiolp39HDacqxtTv8lZZEviTSJkqcI97IxwMvQTqzZDkFeW7oFhpZO8uA
         3c0QkjqNefNX08bKy7b6tMaJc0iKZCiCP1wntPc1CotHwyy4sKCw9y7QSU4v79ZilFzo
         i65w==
X-Gm-Message-State: AOJu0Yxj8W+SKXTU3TpbKq787XVFH65HaSHc6a4d2cUHrRJT2gp8wWfG
	Eud+W4ngvSWZRirI+rR0z//F+GR1J+KbN7XhlIvjuxMTR+f8hwJt4/c4wxip7ZQxd7oNFSdHuXv
	8g/8=
X-Gm-Gg: Acq92OH0WWM8/zsA7WqvD1nJQUnidFBfbIKmQWqoCO2rGtgmyqHJtgtcCmebpBYxqSG
	SC+HAF3lwieO9UrkwsS3tziInsfm76ynK09Q84had8akJrt1y+EMjVWvvTVn924QLlZQChHLWAs
	0q4m4eF+xYA2VPNoSa0xbeEjE18owpndFsSEonoSYyRktsaQ0U2+7BK0rAi3cyGoPg5FlbbjM/y
	daCqo7oB7uy0vCPoUID+hwAUVpQxdfz6sbZyM+rD0IH/UPofqkJwx/qXGRJZTDyc3Tx1B6e35zE
	GczcCxeJk8mUrj/lz7wGUVF/pUv3RPNKAh4shQQUgtY4ypc35D/Fq66PkNniEDs9rqRvcAy2/UD
	U6Dol67EffTnq7uLEite6Ie0+I1kjdHpkQs4Rjyb0CgLaHDvdjOK7I5TvUsXxB0YmNPP+n2c0Id
	cmlaXgMTQcOnuTHXgtcwi3qkttxR+mOHCGuF5H4K+jOp8MVVViPnL161eemhSlLdf1bseAKRCKo
	tLPk5m8TJPLvnk=
X-Received: by 2002:a05:600c:8b16:b0:490:ae52:499c with SMTP id 5b1f17b1804b1-492333ca24dmr54395395e9.21.1781688266499;
        Wed, 17 Jun 2026 02:24:26 -0700 (PDT)
Message-ID: <ad1eb834-b2f2-4db2-b2fd-9d7f5bb857a9@suse.com>
Date: Wed, 17 Jun 2026 11:24:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 for-4.22? 0/7] domctl: XSA-492 and -491 follow-on
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
X-purgate-ID: tlsNG-ef75cf/1781688267-22B70C48-749BF102/0/0
X-purgate-type: clean
X-purgate-size: 1104
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[citrix.com,xen.org,kernel.org,vates.tech,amd.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 133B9697E02

A number of further possible improvements were identified when putting
together the patches for these XSAs; some therefore already have acks or
alike. Some of these may want considering to take for 4.22.

Many of the patches here are largely independent, but the last one
(following on to XSA-491, while all others are XSA-492 related) really
depends on the 2nd to last one. Or else bigger changes would be
necessary there.

v2, besides addressing review comments, has one new patch and includes
one patch which was previously submitted independently. See individual
patches for details on changes.

1: sched: introduce specialization of "running only" vcpu_runstate_get()
2: domctl: handle XEN_DOMCTL_getvcpuinfo without acquiring domctl lock
3: domctl: move early special casing of XEN_DOMCTL_shadow_op
4: domctl: restrict permission check for XEN_DOMCTL_memory_mapping's remove form
5: domctl: correct return value of XEN_DOMCTL_[gs]etvcpuaffinity
6: x86/domctl: don't imply I/O port permissions from I/O port mapping
7: x86/HVM: more checking for XEN_DOMCTL_ioport_mapping

Jan

