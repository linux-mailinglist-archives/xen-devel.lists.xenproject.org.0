Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 163AA904E60
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 10:45:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738977.1145859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHJbI-0001oK-Ux; Wed, 12 Jun 2024 08:45:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738977.1145859; Wed, 12 Jun 2024 08:45:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHJbI-0001lw-S4; Wed, 12 Jun 2024 08:45:00 +0000
Received: by outflank-mailman (input) for mailman id 738977;
 Wed, 12 Jun 2024 08:45:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h1N0=NO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sHJbI-0001lR-1o
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 08:45:00 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c78ff17-2898-11ef-b4bb-af5377834399;
 Wed, 12 Jun 2024 10:44:58 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a63359aaacaso271791366b.1
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 01:44:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f0d8b280esm545166366b.149.2024.06.12.01.44.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 01:44:57 -0700 (PDT)
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
X-Inumbo-ID: 0c78ff17-2898-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718181897; x=1718786697; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MJxOAo5SAvKlD+sCEsB+J6Gl8aLcSMBlLyM4QhDUGS0=;
        b=LophMwB4iiCz729ZKiEAmrnSC/YZavwTVS+V3KglVmdUS1q2toKNBKqhkE1qsD52kp
         /xy+IjWQuonFVfHk1pQpqWXJ6TBHtlMdJnhWsv56w63o9n8W6MneI1aoHBHIeFHLhnbI
         jwm13UD816Gq+1FQxUOJWBsGF+qeleMN3CNU/asj3U2HTAZ3GVVh+7gVo7aGMozSnSWX
         Y/yAUGzR+lJA6L1ltnUl0WOinCpFGeJZJzHPzwjg+OtApGJ0JAH9MCrCfbmoKtSECkB7
         C5SCKrTmDPA66sYrKelnZJIp4Qch0IGbmvLBmeVINXSztTtpkhZQzD4Q/oJqv50dhkEs
         DBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718181897; x=1718786697;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MJxOAo5SAvKlD+sCEsB+J6Gl8aLcSMBlLyM4QhDUGS0=;
        b=Dn2jm5K0gpqEY5hTR04IjHUviAJ81Qn8aO8bXWQr84E8Fz5TGeQd54B91oD3Z9PUu4
         67YETsSmr4Lun1/R1Z1eo7klRevXRyN76NggEn+4lLFAbsWdSlKKwg85GK0TxuVFLeCj
         /+vQZ72v7iCnxdL8s2a5DVZY/JDxmNBquuLblpA7HFinzgQT1sHT33XbvIUTqRhboo9L
         aStGHpNNkTrAtbVApQc2cEduSFttNXPm4dKnQSyib8NH9968hOZmkwUrx9ghofbZwd2v
         Q7/J3JBg8UAsAD+bCqUol/rpYSJrdMMHx2aAKzUCJXurYpjwjfSveBjochoLGFFpoV6E
         beew==
X-Gm-Message-State: AOJu0Yy1jTSRaXunDgIMDCO+uRrs/qZhskro9UBbBOq/NtPeb/7/0bSb
	OnK8Cep+R3KK5dAnLqJWKbarmJkHoos9aycZ1yAaCiVO5X7O45R3ALkNMwJMkdsrqL/Io25Exsg
	=
X-Google-Smtp-Source: AGHT+IH3/mJPB15Wxv4XcOSQ6xBp6KLbI28BGrGFp8yc4/A2JnPWSKI73tcpHR855408wahk8+ZyqA==
X-Received: by 2002:a17:907:9482:b0:a6f:4824:e2f2 with SMTP id a640c23a62f3a-a6f4824e4f3mr85716566b.55.1718181897589;
        Wed, 12 Jun 2024 01:44:57 -0700 (PDT)
Message-ID: <c7d12669-7851-4701-9b2d-0b22f9d32c1d@suse.com>
Date: Wed, 12 Jun 2024 10:44:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH for-4.19???] x86/physdev: replace physdev_{,un}map_pirq()
 checking against DOMID_SELF
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

It's hardly ever correct to check for just DOMID_SELF, as guests have
ways to figure out their domain IDs and hence could instead use those as
inputs to respective hypercalls. Note, however, that for ordinary DomU-s
the adjustment is relaxing things rather than tightening them, since
- as a result of XSA-237 - the respective XSM checks would have rejected
self (un)mapping attempts for other than the control domain.

Since in physdev_map_pirq() handling overall is a little easier this
way, move obtaining of the domain pointer into the caller. Doing the
same for physdev_unmap_pirq() is just to keep both consistent in this
regard. For both this has the advantage that it is now provable (by the
build not failing) that there are no DOMID_SELF checks left (and none
could easily be re-added).

Fixes: 0b469cd68708 ("Interrupt remapping to PIRQs in HVM guests")
Fixes: 9e1a3415b773 ("x86: fixes after emuirq changes")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Note that the moving of rcu_lock_domain_by_any_id() is also going to
help
https://lists.xen.org/archives/html/xen-devel/2024-06/msg00206.html.

--- a/xen/arch/x86/physdev.c
+++ b/xen/arch/x86/physdev.c
@@ -18,9 +18,9 @@
 #include <xsm/xsm.h>
 #include <asm/p2m.h>
 
-int physdev_map_pirq(domid_t domid, int type, int *index, int *pirq_p,
+int physdev_map_pirq(struct domain *d, int type, int *index, int *pirq_p,
                      struct msi_info *msi);
-int physdev_unmap_pirq(domid_t domid, int pirq);
+int physdev_unmap_pirq(struct domain *d, int pirq);
 
 #include "x86_64/mmconfig.h"
 
@@ -88,13 +88,12 @@ static int physdev_hvm_map_pirq(
     return ret;
 }
 
-int physdev_map_pirq(domid_t domid, int type, int *index, int *pirq_p,
+int physdev_map_pirq(struct domain *d, int type, int *index, int *pirq_p,
                      struct msi_info *msi)
 {
-    struct domain *d = current->domain;
     int ret;
 
-    if ( domid == DOMID_SELF && is_hvm_domain(d) && has_pirq(d) )
+    if ( d == current->domain && is_hvm_domain(d) && has_pirq(d) )
     {
         /*
          * Only makes sense for vector-based callback, else HVM-IRQ logic
@@ -106,13 +105,9 @@ int physdev_map_pirq(domid_t domid, int
         return physdev_hvm_map_pirq(d, type, index, pirq_p);
     }
 
-    d = rcu_lock_domain_by_any_id(domid);
-    if ( d == NULL )
-        return -ESRCH;
-
     ret = xsm_map_domain_pirq(XSM_DM_PRIV, d);
     if ( ret )
-        goto free_domain;
+        return ret;
 
     /* Verify or get irq. */
     switch ( type )
@@ -135,24 +130,17 @@ int physdev_map_pirq(domid_t domid, int
         break;
     }
 
- free_domain:
-    rcu_unlock_domain(d);
     return ret;
 }
 
-int physdev_unmap_pirq(domid_t domid, int pirq)
+int physdev_unmap_pirq(struct domain *d, int pirq)
 {
-    struct domain *d;
     int ret = 0;
 
-    d = rcu_lock_domain_by_any_id(domid);
-    if ( d == NULL )
-        return -ESRCH;
-
-    if ( domid != DOMID_SELF || !is_hvm_domain(d) || !has_pirq(d) )
+    if ( d != current->domain || !is_hvm_domain(d) || !has_pirq(d) )
         ret = xsm_unmap_domain_pirq(XSM_DM_PRIV, d);
     if ( ret )
-        goto free_domain;
+        return ret;
 
     if ( is_hvm_domain(d) && has_pirq(d) )
     {
@@ -160,8 +148,8 @@ int physdev_unmap_pirq(domid_t domid, in
         if ( domain_pirq_to_emuirq(d, pirq) != IRQ_UNBOUND )
             ret = unmap_domain_pirq_emuirq(d, pirq);
         write_unlock(&d->event_lock);
-        if ( domid == DOMID_SELF || ret )
-            goto free_domain;
+        if ( d == current->domain || ret )
+            return ret;
     }
 
     pcidevs_lock();
@@ -170,8 +158,6 @@ int physdev_unmap_pirq(domid_t domid, in
     write_unlock(&d->event_lock);
     pcidevs_unlock();
 
- free_domain:
-    rcu_unlock_domain(d);
     return ret;
 }
 #endif /* COMPAT */
@@ -184,6 +170,8 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
 
     switch ( cmd )
     {
+        struct domain *d;
+
     case PHYSDEVOP_eoi: {
         struct physdev_eoi eoi;
         struct pirq *pirq;
@@ -331,8 +319,15 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
         msi.sbdf.devfn = map.devfn;
         msi.entry_nr = map.entry_nr;
         msi.table_base = map.table_base;
-        ret = physdev_map_pirq(map.domid, map.type, &map.index, &map.pirq,
-                               &msi);
+
+        d = rcu_lock_domain_by_any_id(map.domid);
+        ret = -ESRCH;
+        if ( !d )
+            break;
+
+        ret = physdev_map_pirq(d, map.type, &map.index, &map.pirq, &msi);
+
+        rcu_unlock_domain(d);
 
         if ( map.type == MAP_PIRQ_TYPE_MULTI_MSI )
             map.entry_nr = msi.entry_nr;
@@ -348,7 +343,15 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
         if ( copy_from_guest(&unmap, arg, 1) != 0 )
             break;
 
-        ret = physdev_unmap_pirq(unmap.domid, unmap.pirq);
+        d = rcu_lock_domain_by_any_id(unmap.domid);
+        ret = -ESRCH;
+        if ( !d )
+            break;
+
+        ret = physdev_unmap_pirq(d, unmap.pirq);
+
+        rcu_unlock_domain(d);
+
         break;
     }
 

