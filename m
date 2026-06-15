Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7SePKHgIMGqjMAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 16:13:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBCD686FBA
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 16:13:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=K4QJfLPn;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1338268.1599284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ83j-0001Vd-SB; Mon, 15 Jun 2026 14:13:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338268.1599284; Mon, 15 Jun 2026 14:13:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ83j-0001Sk-Ol; Mon, 15 Jun 2026 14:13:03 +0000
Received: by outflank-mailman (input) for mailman id 1338268;
 Mon, 15 Jun 2026 14:13:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZ83i-0001SV-MD
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 14:13:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ83i-002zx9-2u
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 16:13:02 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a30086d-e002-0a2a0a5209dd-0a2a450698b4-2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 16:13:01 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a30086d-7371-0a2a45060019-d155802ec47f-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 16:13:01 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-490cdae130cso16438005e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 07:13:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49220372ed0sm229600395e9.14.2026.06.15.07.13.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 07:13:00 -0700 (PDT)
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
        d=suse.com; s=google; t=1781532781; x=1782137581; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K9wWG9O+maNG12dOUcbH4HjESbxFZUtQp5qiz1i/uAI=;
        b=K4QJfLPnCQSR4HM1CLgxZACY6deIVayQGtTK9D6Foq3hsFlBMac+nIrZu6Cd70B7Dr
         wKX8qPsQ1kQmkxfYttG2woMDnzUN9M8JnlHz+j2ZTTGUVVmShU/Q4Ejpvy/q3ngUYAvq
         CbkLmSLcvBqQt9OIl+xHq6y1GcpFoOQbBCrnvxeXghI0N8jM0GPdPe25nmKk/EgZSjpE
         5XEzQliayxNfi0evrLBBFYb9d2WtPhR8H3ZKjqv/duUHZTioGxqkIDregoz+/h4nC8Mk
         DmlF8DmEZRLnvlI6RjIEcaUxQ7xd1d4abc9EYB39m+u0+zclMnDiRXVyCZbAVJW3FI14
         U14A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781532781; x=1782137581;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9wWG9O+maNG12dOUcbH4HjESbxFZUtQp5qiz1i/uAI=;
        b=nyiW2Hb4l0ySW2pxn7GSQRRi42UaEiKSwPqRQ8vg1VwkXs4AvwJi3ULyvYU9aR8XMw
         C0mkRYQO+WYhCVpRh7ZUTU5+KU8OEuPABsK23Y5lDuEymF/RwZi9CwW0xvH2W5giP2ll
         QaT25/vNFVKHQhgdjFx7XY++tqruWJ1m2j/44Ilt5mmLh3nc4Z18mGLoj/qh7/Lq1nxH
         2wOYoRGfgvawRjXKwbRtNyYf4lXg5WNNY67IrwPvHrE464M7dubiDWRaADmh6h62HILN
         T0f7ZKb4rXgnOfDtoZprhXFqvbapnYQRC0a5mpRuxupdFipyydklqxSNIbZha9NXyQgr
         7+Rw==
X-Gm-Message-State: AOJu0Yz+0xmSwNLZbtx69MXy9/6Bj1sLun4UuwuAxj7A+CNyi50nztH+
	4gvgaRSr6c3fStrvS5juVfnc4rz9YHH8DNCIVClgAnivW+QCpM1lmADGSwQb+GDwFJqcvlGJg7W
	tcoo=
X-Gm-Gg: Acq92OHuRU5Umh/Umuns7Rgug3x1vfoUZAlNIO0OIDFVfmffVNrPNOsEwyfN8vbd+ok
	YINXwRx9DSswHKWU3MUA0REzholKbKz324wWXD130gYw6rolaIvwQKU2E18NDUO/rUcQBvXF2Cv
	x44QJOX0dgW5GNkOlIG4a7KC8FU4psWCC+Lvgr+IF1jYlq6bDoM050ffZDdURErttTuTIf+rOYS
	WbbNgYmkUBUXzkWg1WT0uGz+3Qh1+DIjpi43bcWuyuOJTipdRnm80wmHf2pCq2lNneCQItnQEsL
	3itHRF8zTb1eYRtZMFcN+hiDZ7TYF5eOYtZzv0PW86P9hDvjOGWZBx/3EQno6OSmCZt+rByQXIY
	JC/r1crG/gbXgy3UNQPqaooS7ihI5/VISHUZ3l8UuvJcRoO6HrB3ZMYiKsclTAASXEGDNmooi+M
	u+Fok3P9uh/sr1x1JlG6gHmtus9rR8BCcu226kypgH8ts6fx40P2+xtNWcfHQgK0zUiOwX4il+7
	veX+mMYfrOhgQQ=
X-Received: by 2002:a05:600c:6287:b0:485:9a50:3370 with SMTP id 5b1f17b1804b1-492200516d4mr135546605e9.8.1781532781169;
        Mon, 15 Jun 2026 07:13:01 -0700 (PDT)
Message-ID: <afd71b98-7f25-48af-97ca-4f772551f73e@suse.com>
Date: Mon, 15 Jun 2026 16:13:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH for-4.22? 3/9] domctl: rename a label
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <e2f2cd28-a8f9-4455-8a3b-f55f8c08e1dd@suse.com>
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
In-Reply-To: <e2f2cd28-a8f9-4455-8a3b-f55f8c08e1dd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1781532781-8777FD75-00145725/0/0
X-purgate-type: clean
X-purgate-size: 5383
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
X-Rspamd-Queue-Id: 0BBCD686FBA

There's no real domain unlocking here, it's merely RCU which is being
"unlocked".

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -373,7 +373,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
             copyback = true;
         }
 
-        goto domctl_out_unlock_domonly;
+        goto domctl_out_unlock_rcuonly;
 
     case XEN_DOMCTL_get_domain_state:
         ret = xsm_get_domain_state(XSM_XS_PRIV, d);
@@ -381,7 +381,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
             ret = get_domain_state(&op->u.get_domain_state, d, &op->domain);
         if ( !ret )
             copyback = true;
-        goto domctl_out_unlock_domonly;
+        goto domctl_out_unlock_rcuonly;
 
     case XEN_DOMCTL_iomem_permission:
     {
@@ -391,11 +391,11 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
 
         ret = -EINVAL;
         if ( (mfn + nr_mfns - 1) < mfn ) /* Wrap? */
-            goto domctl_out_unlock_domonly;
+            goto domctl_out_unlock_rcuonly;
 
         ret = xsm_iomem_permission(XSM_PRIV, d, mfn, mfn + nr_mfns - 1, allow);
         if ( ret )
-            goto domctl_out_unlock_domonly;
+            goto domctl_out_unlock_rcuonly;
 
         iocaps_double_lock(d, true);
 
@@ -408,7 +408,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
             ret = iomem_deny_access(d, mfn, mfn + nr_mfns - 1);
 
         iocaps_double_unlock(d, true);
-        goto domctl_out_unlock_domonly;
+        goto domctl_out_unlock_rcuonly;
     }
 
     case XEN_DOMCTL_memory_mapping:
@@ -423,17 +423,17 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
         if ( mfn_end < mfn || /* Wrap? */
              ((mfn | mfn_end) >> (paddr_bits - PAGE_SHIFT)) ||
              (gfn + nr_mfns - 1) < gfn ) /* Wrap? */
-            goto domctl_out_unlock_domonly;
+            goto domctl_out_unlock_rcuonly;
 
         ret = xsm_iomem_mapping(XSM_DM_PRIV, d, mfn, mfn_end, add);
         if ( ret || !paging_mode_translate(d) )
-            goto domctl_out_unlock_domonly;
+            goto domctl_out_unlock_rcuonly;
 
 #ifndef CONFIG_X86 /* XXX ARM!? */
         ret = -E2BIG;
         /* Must break hypercall up as this could take a while. */
         if ( nr_mfns > 64 )
-            goto domctl_out_unlock_domonly;
+            goto domctl_out_unlock_rcuonly;
 #endif
 
         iocaps_double_lock(d, false);
@@ -468,7 +468,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
         }
 
         iocaps_double_unlock(d, false);
-        goto domctl_out_unlock_domonly;
+        goto domctl_out_unlock_rcuonly;
     }
 
     case XEN_DOMCTL_set_target:
@@ -477,7 +477,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
 
         ret = -ESRCH;
         if ( !e )
-            goto domctl_out_unlock_domonly;
+            goto domctl_out_unlock_rcuonly;
 
         if ( d == e )
             ret = -EINVAL;
@@ -492,7 +492,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
 
         if ( ret )
             put_domain(e);
-        goto domctl_out_unlock_domonly;
+        goto domctl_out_unlock_rcuonly;
     }
 
     case XEN_DOMCTL_vm_event_op:
@@ -502,12 +502,12 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
             ret = vm_event_domctl(d, &op->u.vm_event_op);
             if ( !ret )
                 copyback = true;
-            goto domctl_out_unlock_domonly;
+            goto domctl_out_unlock_rcuonly;
         }
         if ( !d )
         {
             ret = -ESRCH;
-            goto domctl_out_unlock_domonly;
+            goto domctl_out_unlock_rcuonly;
         }
         /* Other sub-ops handled further down. */
         break;
@@ -517,17 +517,15 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
              op->u.shadow_op.op == XEN_DOMCTL_SHADOW_OP_PEEK )
         {
             ret = xsm_domctl(XSM_OTHER, d, op);
-            if ( ret )
-                goto domctl_out_unlock_domonly;
-
-            ret = arch_do_domctl(op, d, u_domctl);
-            goto domctl_out_unlock_domonly;
+            if ( !ret )
+                ret = arch_do_domctl(op, d, u_domctl);
+            goto domctl_out_unlock_rcuonly;
         }
         break;
 
     case XEN_DOMCTL_get_device_group:
         ret = iommu_do_domctl(op, d, u_domctl);
-        goto domctl_out_unlock_domonly;
+        goto domctl_out_unlock_rcuonly;
 
     case XEN_DOMCTL_ioport_permission:
     case XEN_DOMCTL_ioport_mapping:
@@ -537,7 +535,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
     case XEN_DOMCTL_unbind_pt_irq:
     case XEN_DOMCTL_getpageframeinfo3:
         ret = arch_do_domctl(op, d, u_domctl);
-        goto domctl_out_unlock_domonly;
+        goto domctl_out_unlock_rcuonly;
 
     default:
         /* Everything else handled further down. */
@@ -546,7 +544,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
 
     ret = xsm_domctl(XSM_OTHER, d, op);
     if ( ret )
-        goto domctl_out_unlock_domonly;
+        goto domctl_out_unlock_rcuonly;
 
     if ( !domctl_lock_acquire() )
     {
@@ -941,7 +939,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
 
     domctl_lock_release();
 
- domctl_out_unlock_domonly:
+ domctl_out_unlock_rcuonly:
     if ( d && !is_system_domain(d) )
         rcu_unlock_domain(d);
 


