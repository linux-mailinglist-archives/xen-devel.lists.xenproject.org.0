Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i8JgAYvKQ2pSiAoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 15:54:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA526E516E
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 15:54:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=TZTXZbyQ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1348972.1606760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weYuf-0001lT-4d; Tue, 30 Jun 2026 13:54:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348972.1606760; Tue, 30 Jun 2026 13:54:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weYuf-0001il-1s; Tue, 30 Jun 2026 13:54:09 +0000
Received: by outflank-mailman (input) for mailman id 1348972;
 Tue, 30 Jun 2026 13:54:07 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weYud-0001ia-Ct
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 13:54:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weYuc-00GrL2-HD
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 15:54:06 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43ca78-e002-0a2a0a5209dd-0a2a4509e71c-18
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 15:54:06 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43ca7e-97e6-0a2a45090019-d155dd2ec5f5-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 15:54:06 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-47640541585so235378f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 06:54:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47563d194bbsm7216382f8f.3.2026.06.30.06.54.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 06:54:05 -0700 (PDT)
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
        d=suse.com; s=google; t=1782827646; x=1783432446; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FL3xJ3R9ME6XiZOg1Vkm6Xt5EM0+KhV2x1X4ZdfMeFw=;
        b=TZTXZbyQg4PTdpqGQ3oXQpcIgnLoFkLFvRF4bE8Yn5U3vjxI7bgySM8ur4VEpXwu9t
         EE6HWqN9YR16zNRy2lknnBMg0CzhXk1fks039/3Nq+2jnjYi9Q43r46AsOY1KvXVElE4
         2JaYtsv2y11kmf27NZWXrcFUeqmxGQqD3un86fJdtUzFjM0OnDqxxaubPqznjJmkPTPx
         chzs6L33XooYxKSXR2ZA2Bx6ygI4xvGLWGCruy7oiiDeARNYE6t9Uf34cXNLDlDR8mWj
         zJ/CU8J/XaLW+4PwxyAD67IklKuxkq7FeNwZtMlIA4leU+mKvjfCEEZPnbbbWQcFeb25
         kTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782827646; x=1783432446;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FL3xJ3R9ME6XiZOg1Vkm6Xt5EM0+KhV2x1X4ZdfMeFw=;
        b=JM40bEfGTp+vcjxdpKCBFAjkTHzVEXGaBZBOQQBz2fNjGyceIlU8K1zC2ffhLjxKnh
         mNKzENbDrrXLfejbYfI3o8kVRZCTElbAoEND+nwHbtF89jNJhFwBpzMk+sG6OHVouI2N
         QnEPyevE4NHEplcuQokc+b6jW8QGpSfpZiv1KaYTT4L+vxOJ3tuUx8KyZJVh57VROB2r
         5w3ewEzXi6o9C24ybvEuPDAzf3bUjWv7UZFxZJ6Ot/N1ZlR5zEOYfXurrbv2Iv54KtMM
         cgQbdx8K3h8dY4PJeiTOX0DNbqdDTfq3hDL+e9dRGpQZ6QlC68giIK6WdZ8jH3I3V0xg
         XKoA==
X-Gm-Message-State: AOJu0YyBMxy+JEyIeWzzs7GX/Hh2x3qNUblIJo4jwTB9Ag3JuVKCaecQ
	TsyGh8M4tEavTttKQ3X0GPbciMw41rzeKwM5n06gSfsC0Z/N8ast/vYILLcBwE8XDR2iuJwof5q
	ov8bqlw==
X-Gm-Gg: AfdE7ckoZS4Ks9KI9kWNB8rSn293wI7zX5l2bHTIkwaU9bTUbmufn5OnlX8DE8EXHNl
	bfZS5eQf8gNSSKfIFu4zGf7DUDTOiz8Ich9IeRi6wNeOYOF2r+4IZjjP6SKRjQAFy+d4uQyuHry
	PUOBo+HaIKRalZOkydtpSZdTcTslQzVzRzZ2RphJOsH2lAodqoo8r1q+ywPGh4+d2mmn3XjsKwH
	aJZL9c+QxrgRf37DqrKyhVzC10jGqeNoI2tkpqvRIdUy/4+YTNqd7Fp75zE8mYW6+1Y/CU5z55C
	huOgxXT3ju0IzKstXosoNOd5rpU+PdhNhYzf9+qFbxlvb+viN6W6IKJXY7g17GcF7qrKx6WwBOU
	n3BKvWleKH/4PkWY+iHhxwuFXNJZfII1fpQJX0L8hOFoXiajV5Z5FIaOEmyw9KTgAMAiVglpFYs
	sE6pa+JceqmOiiWSq8Lsmbh9Lmpd3u0EqsLGEunOsjRvQuZh9SB88r1Z59RertSDNmU8+StQTyj
	Ktr
X-Received: by 2002:a5d:6308:0:b0:475:f0f0:9f04 with SMTP id ffacd0b85a97d-4765b418b0bmr840570f8f.59.1782827645814;
        Tue, 30 Jun 2026 06:54:05 -0700 (PDT)
Message-ID: <724bd14c-ebba-4e29-be7c-012aa7aa82b2@suse.com>
Date: Tue, 30 Jun 2026 15:54:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 1/2] x86/domctl: don't imply I/O port permissions from I/O
 port mapping
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <65f69026-f284-4cfd-b502-8d8955b412f5@suse.com>
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
In-Reply-To: <65f69026-f284-4cfd-b502-8d8955b412f5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1782827646-44B2B986-E511BD74/0/0
X-purgate-type: clean
X-purgate-size: 4935
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,xenproject.org:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
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
X-Rspamd-Queue-Id: 5AA526E516E

Rather than granting permissions when mapping (an operation that DM-s are
allowed to carry out, while they can't invoke ioport-permission), check
whether permissions actually were granted when adding a mapping. This then
also allows relaxing the necessary locking.

While no longer granting permissions upon mapping is "only" at risk of
breaking guests, no longer revoking permissions upon unmapping strictly
requires callers to additionally invoke XEN_DOMCTL_ioport_permission. Or
else a security issue would arise. In-tree code already does so.

While there switch to using %pd in the two log messages.

Fixes: 192c4dabc344 ("domctl and p2m changes for PCI passthru")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
libxl has libxl__grant_vga_iomem_permission(), but I can't spot any I/O
port equivalent (nor a revoke counterpart, btw). Everywhere else MMIO and
I/O ports look to be treated equally.

Qemu uses both xc_domain_{iomem_permission,memory_mapping}() in
igd_write_opregion(), but only xc_domain_{memory,ioport}_mapping() in
xen_pt_region_update() and xen_pt_{,un}register_vga_regions(). Is the IGD
region special in any way? Clearly this can't work from a stubdom.
---
v3: Further extend ChangeLog entry.
v2: Avoid double evaluation of "add". Add ChangeLog entry.

--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -7,6 +7,11 @@ The format is based on [Keep a Changelog
 ## [4.23.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
 
 ### Changed
+ - On x86:
+   - XEN_DOMCTL_ioport_mapping no longer implicitly grants or revokes
+     permissions for the port range in question.
+     XEN_DOMCTL_ioport_permission now needs invoking up front /
+     afterwards.
 
 ### Added
 
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -714,15 +714,35 @@ long arch_do_domctl(
             break;
 
         hvm = &d->arch.hvm;
-        iocaps_double_lock(d, true);
+        /*
+         * NB: The double lock isn't really needed when !add, but is used anyway
+         * to keep things simple.
+         */
+        iocaps_double_lock(d, false);
 
         if ( !ioports_access_permitted(currd, fmp, fmp + np - 1) )
             ret = -EPERM;
-        else if ( add )
+        else if ( !add )
         {
             printk(XENLOG_G_INFO
-                   "ioport_map:add: dom%d gport=%x mport=%x nr=%x\n",
-                   d->domain_id, fgp, fmp, np);
+                   "ioport_map:remove: %pd gport=%x mport=%x nr=%x\n",
+                   d, fgp, fmp, np);
+
+            write_lock(&hvm->g2m_ioport_lock);
+            list_for_each_entry(g2m_ioport, &hvm->g2m_ioport_list, list)
+                if ( g2m_ioport->mport == fmp )
+                {
+                    list_del(&g2m_ioport->list);
+                    xfree(g2m_ioport);
+                    break;
+                }
+            write_unlock(&hvm->g2m_ioport_lock);
+        }
+        else if ( ioports_access_permitted(d, fmp, fmp + np - 1) )
+        {
+            printk(XENLOG_G_INFO
+                   "ioport_map:add: %pd gport=%x mport=%x nr=%x\n",
+                   d, fgp, fmp, np);
 
             write_lock(&hvm->g2m_ioport_lock);
             list_for_each_entry(g2m_ioport, &hvm->g2m_ioport_list, list)
@@ -747,40 +767,11 @@ long arch_do_domctl(
                 list_add_tail(&g2m_ioport->list, &hvm->g2m_ioport_list);
             }
             write_unlock(&hvm->g2m_ioport_lock);
-            if ( !ret )
-                ret = ioports_permit_access(d, fmp, fmp + np - 1);
-            if ( ret && !found && g2m_ioport )
-            {
-                write_lock(&hvm->g2m_ioport_lock);
-                list_del(&g2m_ioport->list);
-                write_unlock(&hvm->g2m_ioport_lock);
-                xfree(g2m_ioport);
-            }
         }
         else
-        {
-            printk(XENLOG_G_INFO
-                   "ioport_map:remove: dom%d gport=%x mport=%x nr=%x\n",
-                   d->domain_id, fgp, fmp, np);
-
-            write_lock(&hvm->g2m_ioport_lock);
-            list_for_each_entry(g2m_ioport, &hvm->g2m_ioport_list, list)
-                if ( g2m_ioport->mport == fmp )
-                {
-                    list_del(&g2m_ioport->list);
-                    xfree(g2m_ioport);
-                    break;
-                }
-            write_unlock(&hvm->g2m_ioport_lock);
-
-            ret = ioports_deny_access(d, fmp, fmp + np - 1);
-            if ( ret && is_hardware_domain(currd) )
-                printk(XENLOG_ERR
-                       "ioport_map: error %ld denying dom%d access to [%x,%x]\n",
-                       ret, d->domain_id, fmp, fmp + np - 1);
-        }
+            ret = -EPERM;
 
-        iocaps_double_unlock(d, true);
+        iocaps_double_unlock(d, false);
         break;
     }
 


