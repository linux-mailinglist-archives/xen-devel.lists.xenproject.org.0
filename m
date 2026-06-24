Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BHxDIvSQO2ozZwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 10:10:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4A56BC706
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 10:10:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=c5iNvEik;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1344640.1603687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcIgN-00049p-4j; Wed, 24 Jun 2026 08:10:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344640.1603687; Wed, 24 Jun 2026 08:10:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcIgN-00045n-1I; Wed, 24 Jun 2026 08:10:03 +0000
Received: by outflank-mailman (input) for mailman id 1344640;
 Wed, 24 Jun 2026 08:10:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wcIgM-0003r5-0H
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 08:10:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcIgL-000vtE-8s
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 10:10:01 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3b90cf-2eae-0a2a0a5409dd-0a2a450ae46e-34
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 10:10:01 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a3b90d8-93a5-0a2a450a0019-d1558033cd1e-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 10:10:00 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-490aaeabdb4so4624735e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 01:10:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49249207dabsm643814715e9.0.2026.06.24.01.09.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 01:09:59 -0700 (PDT)
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
        d=suse.com; s=google; t=1782288600; x=1782893400; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=he2PuSHZTY+9F4JP3Vl7GroBYvQJNz23URPwaek4d8w=;
        b=c5iNvEikCuqUam/j/XwD/DbWl7i7LiRuppeKk5zonk9tqBPhJWj9Z2A3H294VXb6lf
         l5nnmWaUEJDfkAkMYCfUbr06rXcvsNwIicXbWTy4h7R9/TsZIKHIbcg/WsbGrImBbzRB
         yMHEItq4IccskUKDCDhoh0NhGxOuIPdkUYOhTvzbtE4TmOAaAYVxPAjF65zA1RBQLJ16
         vAWIM/479bciGYWnfKzdo30YEIkbKHWMua/5MFfXPgZmGqJvbYyR9hkvruOqpAnkxNq1
         uSEjq08qrT+1oWwapscCuNE0tJjcOSzkduTgs3Udt97QWwkMlZPgdqvjOsTyOXHEHbYf
         u+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782288600; x=1782893400;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=he2PuSHZTY+9F4JP3Vl7GroBYvQJNz23URPwaek4d8w=;
        b=l/EDsDRtpdSpWPM8abkS++xv1bwMXDL/dCm/AbGT35oGkWK12irje72EiCLZXemQ23
         CRYBdQlV974kFv+YX8QfzzO0xFWz3CTD7V7hdVvtl1mYwhagN5a9zBHvgKUcSNhuv6HN
         oLFdGjCoLpnKlDJwI+BtJPusU4/P6Y1g8jHpqK/zeCyNlXDKwq4F+pm1SAfLAUX6Z2Yp
         Dm4uZg8f9K32HHaCYdVtDm6/m2xbtt6+6QyUXraFetVLGDhA2kQ6eRvhkCESbu96iY7a
         HHZDDJz6Mn43Ce+OgTrNpnFh7QIpgPHNJf/pp5OP6BB3fS2Dtr+6UFKhZqznSbSYnf5b
         IjTw==
X-Gm-Message-State: AOJu0Yxzf0AKDC9J/dBwONUjvMYzrQ8DU67NVYz2g+afNTpfTaC3vNFB
	ALne6vPiQ4Ze6dThEmeprMZGt5INN8CuTjjOt+GOE4MGMZOiAlI1PNTUmGFxQYr67UFv8+05n3d
	WlnBQiA==
X-Gm-Gg: AfdE7ckH2lrUHSnbsHyiz2aX9OHGcJRAgJq1SY4WpeSchoNpsDZKOufdHXWgv4VHnwG
	6/DYxImC3/454CfjjVpvlozXy0k7eXEoYdOrX+pt/9Cr/+VGZz5l5ZpMs72FbOI9yISsz7LSAZr
	4bXsyRFBb1ZVfh31w2gmPBATXJxXpX3g5jQvc/XmeeyC7UdcXhGQVkyxJ5dLyM58KF0YcHzOmVc
	IGwBwXMFHmTu/V+YSzqVqH1paLi+/MHTh/8P8GpNG3fLmVKPfPaA+K1WW+vXystKvKj7wNp25BC
	uKu/QuAtjmcCvkaVd3P5iV7kaU98CQZ3F6I/BurHQoUjjQYvdGK7/Vct3IEtCe1k/wKtWWyi785
	IRe2C3RaSYF0MWmVwHi5M+wwj73EYSwjbsBWlRdITyyciSQHMp89ofPxfCVM8ew5LXUr93+38Qz
	Y3WTz+5QOLmBm0PTMpB/fZTMMW+24RwGMi587qiWDiOKOiM6IXpG+r96c2wuc/4nKaQI6CUp6Ji
	0Qa+ERJ1WQdQE8=
X-Received: by 2002:a05:600c:1906:b0:490:d38c:7836 with SMTP id 5b1f17b1804b1-4926084aa9fmr29226205e9.3.1782288599787;
        Wed, 24 Jun 2026 01:09:59 -0700 (PDT)
Message-ID: <57e4a05b-0037-428a-ad55-08764b84e70f@suse.com>
Date: Wed, 24 Jun 2026 10:09:58 +0200
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
Subject: [PATCH] IRQ: drop (effectively) unused flag constants
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
X-purgate-ID: tlsNG-4011c0/1782288600-2DBF3DB8-D3598A88/0/0
X-purgate-type: clean
X-purgate-size: 1767
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CB4A56BC706

IRQ_PER_CPU and IRQ_GUEST_EOI_PENDING are entirely unused. x86 uses
IRQ_REPLAY, but only ever to clear the bit. Drop all three constants.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2075,7 +2075,6 @@ void do_IRQ(struct cpu_user_regs *regs)
         goto out_no_end;
     }
 
-    desc->status &= ~IRQ_REPLAY;
     desc->status |= IRQ_PENDING;
 
     /*
--- a/xen/include/xen/irq.h
+++ b/xen/include/xen/irq.h
@@ -33,20 +33,15 @@ struct irqaction {
 #define _IRQ_INPROGRESS         0 /* IRQ handler active - do not enter! */
 #define _IRQ_DISABLED           1 /* IRQ disabled - do not enter! */
 #define _IRQ_PENDING            2 /* IRQ pending - replay on enable */
-#define _IRQ_REPLAY             3 /* IRQ has been replayed but not acked yet */
+/* 3 unused */
 #define _IRQ_GUEST              4 /* IRQ is handled by guest OS(es) */
 #define _IRQ_MOVE_PENDING       5 /* IRQ is migrating to another CPUs */
-#define _IRQ_PER_CPU            6 /* IRQ is per CPU */
-#define _IRQ_GUEST_EOI_PENDING  7 /* IRQ was disabled, pending a guest EOI */
-#define _IRQF_SHARED            8 /* IRQ is shared */
+#define _IRQF_SHARED            6 /* IRQ is shared */
 #define IRQ_INPROGRESS          (1u<<_IRQ_INPROGRESS)
 #define IRQ_DISABLED            (1u<<_IRQ_DISABLED)
 #define IRQ_PENDING             (1u<<_IRQ_PENDING)
-#define IRQ_REPLAY              (1u<<_IRQ_REPLAY)
 #define IRQ_GUEST               (1u<<_IRQ_GUEST)
 #define IRQ_MOVE_PENDING        (1u<<_IRQ_MOVE_PENDING)
-#define IRQ_PER_CPU             (1u<<_IRQ_PER_CPU)
-#define IRQ_GUEST_EOI_PENDING   (1u<<_IRQ_GUEST_EOI_PENDING)
 #define IRQF_SHARED             (1u<<_IRQF_SHARED)
 
 /* Special IRQ numbers. */

