Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JmWdIHdoMmo6zgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 11:27:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB30697E62
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 11:27:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=UIU74M15;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1339929.1600972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZmYC-0005un-3R; Wed, 17 Jun 2026 09:27:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339929.1600972; Wed, 17 Jun 2026 09:27:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZmYC-0005tB-0h; Wed, 17 Jun 2026 09:27:12 +0000
Received: by outflank-mailman (input) for mailman id 1339929;
 Wed, 17 Jun 2026 09:27:10 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZmYA-0005st-JT
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 09:27:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZmY9-002qTb-T9
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:27:09 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a326868-bab6-0a2a0a5309dd-0a2a4501e492-8
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 11:27:09 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a32686d-c1f2-0a2a45010019-d155802eb92a-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 11:27:09 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4923139e940so9749495e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 02:27:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4620b1083e3sm7917646f8f.20.2026.06.17.02.27.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 02:27:08 -0700 (PDT)
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
        d=suse.com; s=google; t=1781688429; x=1782293229; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sh41o66qzkbWNV16vdLt/fbJ5iwYqzXBUgb3JCi8skE=;
        b=UIU74M15dpNvE+dQHMzcWscsCoBVHteznffq7U51UT9dnzrP0rRoaIL+REZpWfxBuU
         fUGU311YxC35pScCGR2eccOzOIDGOSHnYG8BbBZ8Y+sgmJYgR01zlWmpjJujrkIWjp//
         S2mEO0AqkcZqs4tyNijGGW6Z3IZLT20uOCeEAXSuGtenQS/ysPP/Z1HOS7cz5EVc9t54
         zgB8p45yrYIodLULuVGxW+NK7CkZKUo7FL5fhejVdL707gy5YeMdDO6Zt2Eblb1ohIH7
         VtaBnwtDMB2Z05eCOWQfHoTMVa1xZC3Gr5b0tn/IAMoV1Mvq6WwOb2McXe6Xe1Da6l0U
         6RhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781688429; x=1782293229;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sh41o66qzkbWNV16vdLt/fbJ5iwYqzXBUgb3JCi8skE=;
        b=GeoRmeMSZBOahqfi/+a0+frr6jwAoBl56MBpr5sabI0VAolILxK6/PL8JeLp3FAYUs
         A8XArzJuMGB/ijNeYgaqQZTMrWdIdy/YGSB9dWhGflmwv1t8EwLGrjvZqRLh30jCHFfv
         FcUeLS7lYKv0tQ/CWpotMHUskl3QUzcJtD+c/5kDG6zaZmr1C/d5kHXqAz6zrYfVz0Nk
         kkiB9INXMkTGnw28ZxxDc0vQfL48r62XaxBTHuowSE1xyTiqwzxGLoxQ/NE5j4NjAWS+
         PX7ioD1nM5su2YDlgouHA+MvCjBpx0coM0c080CDoDEs60sbXyytwgQnu/CXprhKeb5I
         cCxQ==
X-Gm-Message-State: AOJu0YzoNSa6/IddQJMISLRNEJcIHhun8g5rATjv6dm5gpbkgy3E+/qY
	DTPOnDo8JhL02QTF9fV1h3ob4vzIiPx38eHeA+GDVFQg4p642MMGbQFTi8TT0GvYf2eDQ1OKp4l
	VPok=
X-Gm-Gg: Acq92OGYpAIksy+01CCc/I8M4JehXenyJIb3DTwlUVz0CqPBKELRI6rcIurKRkIxI75
	dO/IZ6++We2Y/cPjxHMzbqpLB0xLe6ykF1EL7s2z361MgQD3QTU1TVPFMkil+Mly195Kl/ejZxa
	6BIhzYOtskgpDWqhh2HUMq5C4KA0iHpT1MGhsbwLJFy1OPV4gzJbvWi8PoHndZrMCWdjBIr7oCK
	AbN45/vYxQiwpFtqWlpi3fL3CHMyTtkfyYVLEI1T5zddQlRIj8YP/p1OdLN+sni+FmH8QGyOMIE
	KAf1umWnJvJ7sxlaRGkFDY8FXeUf9+iMwcv5MDjECPtRZqmbfeLcxb3oP4ZGVbj11sAtnnqpw7s
	AYUzYkyw7Zgj2duB+0BNQW16vsob3UgKS39IIezlay3oE5wh8zj9UyJMVPyLg/o7HOkUkDGeXb6
	N+46Nz/GdLxof36NFNjxmjRbBjBiYw/C+vkWivv3qpvRkyyavu2P10+T4db1J4siTqAF4LMhYZU
	iN/
X-Received: by 2002:a05:600c:1f86:b0:490:33b3:4be0 with SMTP id 5b1f17b1804b1-49234127a4dmr34973985e9.20.1781688429120;
        Wed, 17 Jun 2026 02:27:09 -0700 (PDT)
Message-ID: <51050157-236a-44dc-93c5-8b52a31a3e62@suse.com>
Date: Wed, 17 Jun 2026 11:27:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 for-4.22? 3/7] domctl: move early special casing of
 XEN_DOMCTL_shadow_op
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
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
X-purgate-ID: tlsNG-d62444/1781688429-B6B5EFF4-51579972/0/0
X-purgate-type: clean
X-purgate-size: 1552
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[citrix.com,xen.org,kernel.org,vates.tech,amd.com,gmail.com,apertussolutions.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:dpsmith@apertussolutions.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DEB30697E62

This wants xsm_domctl() invoked, but the domctl lock not taken. Move the
handling to the respective switch(), thus eliminating the need for a
separate xsm_domctl() invocation.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -512,17 +512,6 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
         /* Other sub-ops handled further down. */
         break;
 
-    case XEN_DOMCTL_shadow_op:
-        if ( op->u.shadow_op.op == XEN_DOMCTL_SHADOW_OP_CLEAN ||
-             op->u.shadow_op.op == XEN_DOMCTL_SHADOW_OP_PEEK )
-        {
-            ret = xsm_domctl(XSM_PRIV, d, op);
-            if ( !ret )
-                ret = arch_do_domctl(op, d, u_domctl);
-            goto domctl_out_unlock_rcuonly;
-        }
-        break;
-
     case XEN_DOMCTL_get_device_group:
         ret = iommu_do_domctl(op, d, u_domctl);
         goto domctl_out_unlock_rcuonly;
@@ -568,6 +557,16 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
         goto domctl_out_unlock_rcuonly;
     }
 
+    case XEN_DOMCTL_shadow_op:
+        if ( op->u.shadow_op.op == XEN_DOMCTL_SHADOW_OP_CLEAN ||
+             op->u.shadow_op.op == XEN_DOMCTL_SHADOW_OP_PEEK )
+        {
+            ret = arch_do_domctl(op, d, u_domctl);
+            goto domctl_out_unlock_rcuonly;
+        }
+        /* Other sub-ops handled by arch_do_domctl() further down. */
+        break;
+
     default:
         /* Everything else handled further up or further down. */
         break;


