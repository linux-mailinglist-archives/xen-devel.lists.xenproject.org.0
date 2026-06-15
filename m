Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TPpPLDgJMGrsMAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 16:16:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C7E687042
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 16:16:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=acH5xgoK;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1338305.1599329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ86o-00047M-8y; Mon, 15 Jun 2026 14:16:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338305.1599329; Mon, 15 Jun 2026 14:16:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ86o-00044V-6J; Mon, 15 Jun 2026 14:16:14 +0000
Received: by outflank-mailman (input) for mailman id 1338305;
 Mon, 15 Jun 2026 14:16:12 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZ86m-00043p-Lx
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 14:16:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ86m-000FX8-2b
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 16:16:12 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a300922-e002-0a2a0a5209dd-0a2a45099f46-46
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 16:16:12 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a30092b-2497-0a2a45090019-d155802cc1b3-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 16:16:12 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-49222b6e871so20334905e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 07:16:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2ce361sm33888958f8f.31.2026.06.15.07.16.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 07:16:10 -0700 (PDT)
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
        d=suse.com; s=google; t=1781532971; x=1782137771; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7ddBo5SyZdCvv9hPrYmhMposadC8eHObQUBDrwKreYA=;
        b=acH5xgoK/aK4q2zlqFYz9yM8S/lAAWhT3L0mOy75RFL2y4iVX7w8Vwu+Z2uG5qD/RA
         TJaRT1KiLmq19ekXEH5wuIWIyjujIC+VVDedV+H1O7rIs4QsMw4qrLE5Jmhciw0GBWMF
         FGieGv9Zj9fCB+XaiNF08iYJjFhdB2mhWO9oKIGOo9V1nn3rpJLvyBU1e0Tr75m6e948
         rMSOd1VtomTRXA3HkIyVxMXp/Ib27lO3Wu6ocbZydf2XKhPDCqh0kAz6/PKtg9iZUIUK
         bpeduzOrJCpNTfBL28HtNfBeI/gaJ0IsJxSLjcostZuakN8b+P6HNDHlY9510rlsZA8q
         DF+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781532971; x=1782137771;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ddBo5SyZdCvv9hPrYmhMposadC8eHObQUBDrwKreYA=;
        b=lwK5XDrpl7FadgJirUv+FF9ZZzoP/hZjVuxqFG9RAGd5v9/nr8rW1kAm/GHCo6JaEY
         Q3rGW88Fcmbw3pM5d3IcEe6qsZPDpiAoCK9Bg1xfS7aoLPNEmV7yVE1k8vxuShBFptXw
         eMLODFUs496XwGGvprHEEY762I48f1jmsvLG1drHHZa44oZbKut8DkZ5w22lMZB7DT38
         raK2JBsnXV/hh+SC4axW3YauPSviagIa1TeABKmZpWy+WyWb92xm8KlGJmP/rQjWK7oZ
         zoCbgRMaTON5EcwMn3AU5WO+xP6Gm8AomP1Xfzy5SQl+B/RDXTL1LhsL8EkRWPwQYL0C
         nNoQ==
X-Gm-Message-State: AOJu0YwYz8ZGSqlts2eBBaq/kNQdmdZpBsHmCcHehTjAWF/KACoXgVXI
	K+ArL65oGF5WBN6cyf5ebOtPYsTcHI2S0cio4m0f+fYd+EqMEscO8rXSE53urOwkMPr+eyP0BLY
	Dl6U=
X-Gm-Gg: Acq92OFmH3fp6quCg5ubWHS94SZX06R7JGc8ggqyPEdFUGvoJZTypfYqRXitBtxynoA
	mUe/ELgla4e2+TFS81H9Hf8uX2zX4A4RRgLCiymG0Ch7oSKqbLXpveAm6kfa9wtBAz0/to/u2ig
	6CSqOIutSqMYsbL9kSkthSAZ70xhTkUc0jLwePy/5rCslGgngQXRiz2lizT8Y0NrDH2R7H04qvQ
	0AR0zAjcrPBjxZ4jDmlqltvnKxhejI6MFO0yQrwFOwTgznG1tk+/w0GB3AN+PFSqrd+ezGUS5c4
	HukWonWOi/HfXkvO9cOmbObDXxVqgB3DD5bILxCIbDUzfSmqqCAuK1b6QFQBQysg//lPQjAE1GZ
	zdofaqg5joQpiOCgvrA0j3f3RZqGTSVsjUs7xwJFvj9z3xzj4IlBNqPHSzAfiQ4r7hdnwVEuXNq
	gzzvuX89uGsKJtJCPycpfl11LYORTSIwx852jZF44b3EnSw10AMERAbZPCQeRDv1zIoKVonyLqM
	UPNVIWDGAC3HI0=
X-Received: by 2002:a05:600c:34c8:b0:492:1e36:8c4b with SMTP id 5b1f17b1804b1-4921e368c91mr147026915e9.36.1781532971368;
        Mon, 15 Jun 2026 07:16:11 -0700 (PDT)
Message-ID: <a88eb54a-f0ff-4ad6-971f-ae526297a15d@suse.com>
Date: Mon, 15 Jun 2026 16:16:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH for-4.22? 8/9] x86/domctl: don't imply I/O port permissions
 from I/O port mapping
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
X-purgate-ID: tlsNG-bad1c0/1781532972-37979A53-6C973468/0/0
X-purgate-type: clean
X-purgate-size: 2688
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 13C7E687042

Rather than granting permissions when mapping (an operation that DM-s are
allowed to carry out, while they can't invoke ioport-permission), check
whether permissions actually were granted when adding a mapping. This then
also allows relaxing the necessary locking.

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

--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -714,9 +714,14 @@ long arch_do_domctl(
             break;
 
         hvm = &d->arch.hvm;
-        iocaps_double_lock(d, true);
+        /*
+         * NB: The double lock isn't really needed when !add, but is used anyway
+         * to keep things simple.
+         */
+        iocaps_double_lock(d, false);
 
-        if ( !ioports_access_permitted(currd, fmp, fmp + np - 1) )
+        if ( !ioports_access_permitted(currd, fmp, fmp + np - 1) ||
+             (add && !ioports_access_permitted(d, fmp, fmp + np - 1)) )
             ret = -EPERM;
         else if ( add )
         {
@@ -747,15 +752,6 @@ long arch_do_domctl(
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
         {
@@ -772,15 +768,9 @@ long arch_do_domctl(
                     break;
                 }
             write_unlock(&hvm->g2m_ioport_lock);
-
-            ret = ioports_deny_access(d, fmp, fmp + np - 1);
-            if ( ret && is_hardware_domain(currd) )
-                printk(XENLOG_ERR
-                       "ioport_map: error %ld denying dom%d access to [%x,%x]\n",
-                       ret, d->domain_id, fmp, fmp + np - 1);
         }
 
-        iocaps_double_unlock(d, true);
+        iocaps_double_unlock(d, false);
         break;
     }
 


