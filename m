Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DQpXEFjXM2p/HAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 13:32:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9935D69FC41
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 13:32:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=ZblfOM0b;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1340985.1601597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waAym-00014I-3i; Thu, 18 Jun 2026 11:32:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340985.1601597; Thu, 18 Jun 2026 11:32:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waAym-00011W-0p; Thu, 18 Jun 2026 11:32:16 +0000
Received: by outflank-mailman (input) for mailman id 1340985;
 Thu, 18 Jun 2026 11:32:14 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1waAyk-00011Q-7i
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 11:32:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waAyi-00AyK7-QR
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 13:32:12 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a33d73c-bab6-0a2a0a5309dd-0a2a450bdaa2-0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 13:32:12 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a33d73c-212f-0a2a450b0019-d155802ae4c6-3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 13:32:12 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-49230a567a9so4006295e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 04:32:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2b0c10sm61652867f8f.21.2026.06.18.04.32.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jun 2026 04:32:11 -0700 (PDT)
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
        d=suse.com; s=google; t=1781782332; x=1782387132; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aNIwpQBNHE+2pIFnZ5l7EGPCe8fWz6r6TF4X1a7qy2I=;
        b=ZblfOM0bhaWU07/s3qO4r1fNpk1cbAYRHWmh8M4MjgnuDsWOXs7umTza68iwMMLvrz
         bn7ry9FmRx5ZXaGb5qGoN2kfQuNqP8CqPccJXyizG0RDclEq8NR7YV+u0/PUyRifKU1e
         +O7/A3lmycykXxp2is8aFW//6lWdrRX3s+KIBJ/RwrZbygwpLAEZ/8yPIwuHWBjaAM6N
         hsALX5WNulEz64Zwnph43N0QCrNxQFmw2ir/VGKfgm/UqIG6c01Bwny8ML6bYDTT/mqW
         qhuhPiMhq0J1I+mGb87STCa4+ko2xCxPlz5nG20RFLu7MG3vVm3WHz4XFylyAQA98dEE
         RYFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781782332; x=1782387132;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aNIwpQBNHE+2pIFnZ5l7EGPCe8fWz6r6TF4X1a7qy2I=;
        b=nJe6eBGvBHmHqtPJPiYm5w7mne9e7DDpRDoUwcGLw/ctsI7vEYK3ZxjYEwvriZJn3O
         eXc94ioHrbmppKuERG+TliqlrpbhuDg6CJDugPdmUdYy98teBZVgh87yKaUL6qz3kQVu
         +GKguP0ec31r0rKqtJofvK7qJZe3Rj0YmpXOUTjXBgWHYy5xXE2gpjwFCQwlD4GxL/FT
         HLKoF77zp/W5X1pGliuzTlys0gWzgA4hJNK1ASKHnIxtuBRIxuNo+gsoqEoAfS2iOTMh
         /bhao9eCJfYuWAPKGUTGBHLnttAQXAAIME3qUXIKevm5aQB9RVKJ6ZrnM+r5GRAOjws8
         g8LA==
X-Gm-Message-State: AOJu0Yw18c0V2bQmy5dNoFLamkQ5WO+VLnFewdxoLSKvioXaQyvgW15r
	BPQocPLqEsWKMyHKDCIXsD6fqCk6vWmk40xzBMAWDfzN2c/OmVm9H8EfdaQwPfPSxVBm1wvCKHA
	fPhQ=
X-Gm-Gg: AfdE7cms+cGz+531RK1mZ6gD9Ful2Aor8EEyDbCkJMkUwLQXThnDVE8k8UVL9R/Fxaa
	CcyM5XZ6ryhtoIwHpeEE4oTh1OiCxxk5lsxb3gXejVUymJOoqGAANlwm50FLgSbFEM2eKwV1mZJ
	g/lKsNkTc9MVoYD3fpPrKhbWSdv5SVYDerCg4C+Q42UCYjSBIGuP8gxijjInpQuptT/m7gzjDR9
	qT+HUtijvHJbQc1seqzct0oameWDqUDHqDGx6F1qPl9K0aLy6zrZmD/tNiRU8XAY7V3KUmGN6GZ
	eGViWaZisjQkxIFkUcf1Ij8WdQtrxuLYPCtOSLAUHeHK3YGtn7eFjPQldJTNDQbE1McGANG9osj
	/rLDWmE0/aiLCa+Uzcm/dTQOn39/SAHLQ7jhd2QcSA6jd1k/jqS4zZRiXi80ncgPNcsL2y71KwV
	J2s3ep9wmmmYqQLCzLCvmlq45X2/G5rEN1sAepjRnX+gIYHTmRGFp7c9GqnLm+NRYJn5Hm1tcg3
	amU
X-Received: by 2002:a05:600c:c3cc:10b0:492:3778:d452 with SMTP id 5b1f17b1804b1-4923778d457mr55221285e9.14.1781782332142;
        Thu, 18 Jun 2026 04:32:12 -0700 (PDT)
Message-ID: <bf642902-7235-45a8-a470-f164a930c0c1@suse.com>
Date: Thu, 18 Jun 2026 13:32:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Daniel Smith <dpsmith@apertussolutions.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH for-4.22] XSM: guard .sysctl() and .readconsole() hooks
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
X-purgate-ID: tlsNG-42698a/1781782332-21183F3B-72663479/0/0
X-purgate-type: clean
X-purgate-size: 2105
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[apertussolutions.com,gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dpsmith@apertussolutions.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9935D69FC41

Leaving the hook pointers in struct xsm_ops when !SYSCTL would lead to
the BUG_ON() in xsm_fixup_ops() triggering for respectively configured
hypervisors.

While moving the #ifdef for the corresponding xsm_*() wrappers, also move
those for xsm_page_offline() (where the hook pointer field already is
suitably guarded).

Fixes: c9eabaa03a68 ("xen/xsm: wrap around xsm_sysctl with CONFIG_SYSCTL")
Fixes: bddd9af6049f ("xen/sysctl: wrap around XEN_SYSCTL_readconsole")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -61,8 +61,10 @@ struct xsm_ops {
 #endif
     int (*set_target)(struct domain *d, struct domain *e);
     int (*domctl)(struct domain *d, struct xen_domctl *op);
+#ifdef CONFIG_SYSCTL
     int (*sysctl)(int cmd);
     int (*readconsole)(uint32_t clear);
+#endif
 
     int (*evtchn_unbound)(struct domain *d, struct evtchn *chn, domid_t id2);
     int (*evtchn_interdomain)(struct domain *d1, struct evtchn *chn1,
@@ -248,23 +250,17 @@ static inline int xsm_domctl(xsm_default
     return alternative_call(xsm_ops.domctl, d, op);
 }
 
+#ifdef CONFIG_SYSCTL
 static inline int xsm_sysctl(xsm_default_t def, int cmd)
 {
-#ifdef CONFIG_SYSCTL
     return alternative_call(xsm_ops.sysctl, cmd);
-#else
-    return -EOPNOTSUPP;
-#endif
 }
 
 static inline int xsm_readconsole(xsm_default_t def, uint32_t clear)
 {
-#ifdef CONFIG_SYSCTL
     return alternative_call(xsm_ops.readconsole, clear);
-#else
-    return -EOPNOTSUPP;
-#endif
 }
+#endif
 
 static inline int xsm_evtchn_unbound(
     xsm_default_t def, struct domain *d1, struct evtchn *chn, domid_t id2)
@@ -558,14 +554,12 @@ static inline int xsm_resource_setup_mis
     return alternative_call(xsm_ops.resource_setup_misc);
 }
 
+#ifdef CONFIG_SYSCTL
 static inline int xsm_page_offline(xsm_default_t def, uint32_t cmd)
 {
-#ifdef CONFIG_SYSCTL
     return alternative_call(xsm_ops.page_offline, cmd);
-#else
-    return -EOPNOTSUPP;
-#endif
 }
+#endif
 
 static inline int xsm_hypfs_op(xsm_default_t def)
 {

