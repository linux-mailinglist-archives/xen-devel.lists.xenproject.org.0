Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VYlLGippMmpYzgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 11:30:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7B3697EB0
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 11:30:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=e5d+U6qU;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1339955.1601000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZmb3-00007x-1f; Wed, 17 Jun 2026 09:30:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339955.1601000; Wed, 17 Jun 2026 09:30:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZmb2-00005P-VD; Wed, 17 Jun 2026 09:30:08 +0000
Received: by outflank-mailman (input) for mailman id 1339955;
 Wed, 17 Jun 2026 09:30:07 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZmb1-0008R5-Gy
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 09:30:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZmb0-008NCT-TK
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:30:06 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a32691a-bab6-0a2a0a5309dd-0a2a4501a7ac-30
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 11:30:06 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a32691e-c1f2-0a2a45010019-d155802ccc1e-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 11:30:06 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4922244f7c7so35753415e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 02:30:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4923687d654sm87515e9.1.2026.06.17.02.30.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 02:30:04 -0700 (PDT)
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
        d=suse.com; s=google; t=1781688606; x=1782293406; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cGO//gFkgptc18LJxH00vrNQWKDEK04r3FP8T9nu6a8=;
        b=e5d+U6qUalKn8em66yt+c2BlMTDfQLJvbSCRUvQj1nSPgmmNfZgAilIHXUrFyAAuZn
         NiOlreqw+ic041zln9LG5X1dp6rscKloKxSNN8U+hBhycV5d6LTW5p+YEyDOCCKsq3y9
         qoTOPkGGOOtGT3vdWjkDFyhcJOjdyubKMqxLcHiPUtClzA5eogOxYSa/pCsuZkpSqbdT
         Dp6efzYfOWeUCjh1UVir9MLhiNtObmZsWh/bUedEzrzieBexPK45IacIczdZVmDtjad1
         h9XtyNwzVu0SZ5cVufwVM6EIIQ+x9KzAjFbDwc7SVra1/G0XI/x5BuJgDEVDh83PtRGa
         LLgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781688606; x=1782293406;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cGO//gFkgptc18LJxH00vrNQWKDEK04r3FP8T9nu6a8=;
        b=YLWvo7gdlcZKQg+/fKqOMhZc+4IO3aaHjZcR+XAWSkk4cgo32fXhG0BHlEIG+wztUy
         NegAOaUt4SAg+z9CUbahs7Ncvho53UnlxS+GDwok0nK5ksYr/+UCehS1CZFYMZ8wVMcZ
         WdUqFAbHTU1Aun48IyFDIN65rK87RbhFA67WEY6giJEYaeQyIickyo/R2cv3H8doLVIK
         zDmgBabQX6USMBTkoRK8cLT7MZ6aA96NQ2E3lL2xWzv3Jd/0NKCmmS2z2txkGPN65yGQ
         2D/X/7kH+NPiDerthYdbo/WkYJu+/SYll/CiMSBxu334D9jcJphwg80pyy7S1avXhuVB
         Nl8Q==
X-Gm-Message-State: AOJu0Yw0sfiOQ9hor+vRxPylcnQljKVkSPcM8aO3xgjQnyRIPljJSEHA
	YcbgHnVwraSST+fFy3d3qTQALvksnajYtw4PIVIlhhysSd8TQZFEpP46/yogNqUWP34Tf3Rb6mo
	XR+M=
X-Gm-Gg: Acq92OGix7UiydLwwKTD0WqyjgKz+4yacyn5yvUacMHEAODIQnlOaBZoqxY6UGERhco
	WfomkmGGCoX+OJJyPzh5cz9opTR+WTL8ivqF+G27IB4PFyb7RUWrBa1ti7ZomOqmreMOMpC3MMz
	4IFwtPZxiPq/qHjWE2Un2YgadCJSVnIpTN/JjZ5DPeDPDlP+yR+Fng/JSNlIWGfM+2wMEX6cjSS
	5MGDAQ0l9c9w5vn3u6eeB+qjwVisaJ7sSWC5Wac1aUHyaeyAtGr7r+ADG8mLPdCJs/BmVlS4C1k
	fBoU3WcHiaPLZ2uJnFJ24YB6FkkpUre6RhIAbcqDd9/PyWSKJS50yyxcNDg5XZnolO7e/PJjFNK
	tJashuAHv34F36OPiDqWwTHFDlHp2Wke7n3IajsYKWcUA9Rcrd9SFFhxUGWwtwdJekNK22gH0aS
	Lj8HJM/576ZbgoQcVbIL8u9JqWu631XlGPcW2kJsQuz4CMiTT2YyZo8BidA4pg98cfcuIjtM9p+
	jOK
X-Received: by 2002:a05:600c:a305:b0:490:3fa2:1b93 with SMTP id 5b1f17b1804b1-492333aa619mr39973715e9.13.1781688605070;
        Wed, 17 Jun 2026 02:30:05 -0700 (PDT)
Message-ID: <e88a6015-8867-41a8-907d-b6749b1d2549@suse.com>
Date: Wed, 17 Jun 2026 11:30:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 for-4.22? 6/7] x86/domctl: don't imply I/O port permissions
 from I/O port mapping
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1781688606-AEB5EFF4-96E306BC/0/0
X-purgate-type: clean
X-purgate-size: 4944
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	SUBJECT_HAS_QUESTION(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CB7B3697EB0

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
v2: Avoid double evaluation of "add". Add ChangeLog entry.

--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -14,6 +14,9 @@ The format is based on [Keep a Changelog
  - On x86:
    - Enable pf-fixup option by default for PVH dom0.
    - The libxenguest bzImage loader now uses the system liblz4 library.
+   - XEN_DOMCTL_ioport_mapping no longer implicitly grants permissions for the
+     port range in question.  XEN_DOMCTL_ioport_permission now needs invoking
+     up front.
 
 ### Added
  - Support for per-domain Xenstore quota in C xenstored (includes
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
 


