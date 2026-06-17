Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SjrEDlpoMmo0zgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 11:26:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B886B697E45
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 11:26:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b="Vy2/5Qg/";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1339921.1600964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZmXi-0005Qe-T6; Wed, 17 Jun 2026 09:26:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339921.1600964; Wed, 17 Jun 2026 09:26:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZmXi-0005Nq-QE; Wed, 17 Jun 2026 09:26:42 +0000
Received: by outflank-mailman (input) for mailman id 1339921;
 Wed, 17 Jun 2026 09:26:41 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZmXh-0005Na-OJ
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 09:26:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZmXh-0007ED-4M
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:26:41 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a326846-e002-0a2a0a5209dd-0a2a4505b3e4-40
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 11:26:41 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a326850-aaa8-0a2a45050019-d1558029d172-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 11:26:41 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-490ace40f4bso52898455e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 02:26:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49230a8ebe3sm114505625e9.11.2026.06.17.02.26.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 02:26:40 -0700 (PDT)
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
        d=suse.com; s=google; t=1781688400; x=1782293200; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fGF9d0DGkimmxNNdmyKW4zK1ejuyjXUo2oTuxdzlH00=;
        b=Vy2/5Qg/s1ZpAtl/LwpIiknYmiAcPphCtP9Tj5EYPPDA+yodLeo1zYxzRIEXnV7ToE
         Pl8O4G4LXIg9w9Iv3cQYSrlGvK/F21YuHhmOfnUAlvXzTVTnffxspPYsXh8usXD5Ae+K
         d0w76OdWb1EF+ZFLYS37erJQJAIip7nOr3U6T2gTKga/q/6wOiD9MMc7cAgxarnsRvT/
         Lg/WBPnypaDxuUG0chuq56wRr6LIq2sVK3rt9jNFluY977+Bo62kOaq9TH7kgVaWBUxV
         N6KzHsE+jNRTa+8f0SRfjyy1s2/pBcyIx3RWPLKQAFPX9LmWHgFiUYfLgUEhAtGTETZo
         dERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781688400; x=1782293200;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGF9d0DGkimmxNNdmyKW4zK1ejuyjXUo2oTuxdzlH00=;
        b=jiA1QzKWPQQO4gto8oFTs7hdANXekAWRcMM/kJpjJ07qPAp56AyQpGpIJ38QUtmsts
         y6LgLdFRqu1gGe42JE346KPDlCmPdOx4ZWmpf/66ra3Wacfq14i9iI6TnQwCgWiujnns
         L6ZbUth4stv2n1BAOIGi35FeaFz8WJTk3DH/OnxF1MicRWwz/xeA9pb9YoSUipiwuWLb
         J6lTfhLl29J8ZK4HrauexsZ2tB9hCCpUoKMc+LUwcWd8+ae8e+K8wDrjs2DlUmKzs+uF
         2tL2iga2aOJRkirib65NZ0QZ46c1E77tQ7CrS/Fq67F10aWMlSvfAgRYJ1JKrx/hKkEw
         O5MQ==
X-Gm-Message-State: AOJu0YyD04KBagu4WcQ5XzFQ7L2kByeO7zdWLxzkvEzZNL4Jic3N96kH
	0y+xvCi7gl3GTkAxV8PiH1mKlXRM2Y4AMxpbiE1gIKEUJntb0LVa2Ew99zxTxS2NTGo21vuYKWw
	VIi4=
X-Gm-Gg: Acq92OEuDs8ll7noaFNYuISeXrUKFSlb2mTnARfoRd7Pa6kOnmaVrLgfo/4WAaHQb/N
	oRyiTB0nW2tjc0Bf+Fc95UX3jfgv4oPJU7t51/8yXkk9Jc0dGVA0Kniqo0dIa8jEjc7bfRjLshO
	PeObgD195DKEGi2ysQn2wChUCMCwak1x5cKB05NJLbdA0KROaraBoiyOlfgcznqlIWGzD0vSks+
	P0XrxB80Uyu+ShlLZBpI8CBjSyO8Y3CJmciQn1rBmc5sRNlut1GXHD6i3itHXoHZ8KVzY+Sa1f5
	bpGeWrCZ0m3bKuSoM0CZDVlVC+3KItUNW9196TyUvtMUvov4pLlIusK5e/AVpAzFKonH3TrGxIW
	NKsk1WAM9+U7NiQLkDmCC0tRghXf2hlspG3kxT8S/db7ZP2PlQrIHWYsrka3MZOd3T3ztRLem03
	HKR4q2wHkRoKpGyt+/sPqDOqPxeHl/Eacv35zLj5npawXXGwx8kT9USh2RnXshXl9bxhadLBEwX
	EdR
X-Received: by 2002:a05:600c:8283:b0:490:d38c:7836 with SMTP id 5b1f17b1804b1-492333a1683mr49112935e9.3.1781688400467;
        Wed, 17 Jun 2026 02:26:40 -0700 (PDT)
Message-ID: <046c3d8e-0672-4235-b84d-bccbded33264@suse.com>
Date: Wed, 17 Jun 2026 11:26:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 for-4.22? 2/7] domctl: handle XEN_DOMCTL_getvcpuinfo
 without acquiring domctl lock
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <ad1eb834-b2f2-4db2-b2fd-9d7f5bb857a9@suse.com>
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
In-Reply-To: <ad1eb834-b2f2-4db2-b2fd-9d7f5bb857a9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1781688401-D857B443-32ABDDCC/10/73395122804
X-purgate-type: spam
X-purgate-size: 2370
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:email];
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
X-Rspamd-Queue-Id: B886B697E45

Like for XEN_DOMCTL_getdomaininfo there's no need to hold the domctl
lock for XEN_DOMCTL_getvcpuinfo. While moving the code also switch to
using domain_vcpu().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Tentatively-acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
v2: Use initializer for local var.

--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -546,6 +546,33 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
     if ( ret )
         goto domctl_out_unlock_rcuonly;
 
+    switch ( op->cmd )
+    {
+    case XEN_DOMCTL_getvcpuinfo:
+    {
+        const struct vcpu *v = domain_vcpu(d, op->u.getvcpuinfo.vcpu);
+
+        if ( !v )
+        {
+            ret = -ENOENT;
+            goto domctl_out_unlock_rcuonly;
+        }
+
+        op->u.getvcpuinfo.online   = !(v->pause_flags & VPF_down);
+        op->u.getvcpuinfo.blocked  = !!(v->pause_flags & VPF_blocked);
+        op->u.getvcpuinfo.running  = v->is_running;
+        op->u.getvcpuinfo.cpu_time = vcpu_runstate_get_running(v);
+        op->u.getvcpuinfo.cpu      = v->processor;
+
+        copyback = true;
+        goto domctl_out_unlock_rcuonly;
+    }
+
+    default:
+        /* Everything else handled further up or further down. */
+        break;
+    }
+
     if ( !domctl_lock_acquire() )
     {
         if ( d && d != dom_io )
@@ -792,28 +819,6 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
         break;
     }
 
-    case XEN_DOMCTL_getvcpuinfo:
-    {
-        const struct vcpu *v;
-
-        ret = -EINVAL;
-        if ( op->u.getvcpuinfo.vcpu >= d->max_vcpus )
-            break;
-
-        ret = -ESRCH;
-        if ( (v = d->vcpu[op->u.getvcpuinfo.vcpu]) == NULL )
-            break;
-
-        op->u.getvcpuinfo.online   = !(v->pause_flags & VPF_down);
-        op->u.getvcpuinfo.blocked  = !!(v->pause_flags & VPF_blocked);
-        op->u.getvcpuinfo.running  = v->is_running;
-        op->u.getvcpuinfo.cpu_time = vcpu_runstate_get_running(v);
-        op->u.getvcpuinfo.cpu      = v->processor;
-        ret = 0;
-        copyback = 1;
-        break;
-    }
-
     case XEN_DOMCTL_max_mem:
     {
         uint64_t new_max = op->u.max_mem.max_memkb >> (PAGE_SHIFT - 10);


