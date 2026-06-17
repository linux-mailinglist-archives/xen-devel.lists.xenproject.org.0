Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jJDzN0hpMmpbzgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 11:30:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3F5697EBF
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 11:30:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=OgMyCOTM;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1339963.1601008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZmbX-0000a8-8Z; Wed, 17 Jun 2026 09:30:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339963.1601008; Wed, 17 Jun 2026 09:30:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZmbX-0000YJ-5y; Wed, 17 Jun 2026 09:30:39 +0000
Received: by outflank-mailman (input) for mailman id 1339963;
 Wed, 17 Jun 2026 09:30:38 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZmbW-0000Y5-27
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 09:30:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZmbV-002rom-F8
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:30:37 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a326939-2eae-0a2a0a5409dd-0a2a4509dc18-28
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 11:30:37 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a32693d-2497-0a2a45090019-d155dd35d452-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 11:30:37 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-45ef29c5561so2984754f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 02:30:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46289c3b3a3sm4317389f8f.30.2026.06.17.02.30.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 02:30:36 -0700 (PDT)
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
        d=suse.com; s=google; t=1781688637; x=1782293437; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QMsQR2U5brjtKAtTpmkPnvwCIP0z0Kfacg+eux8Vc3U=;
        b=OgMyCOTMz4/ere7pEoLh5ooQHPaAlodxq05G4u8fDsFqKj7z9CZkY90X+iqMTXu5gx
         exvqTaTYCiGQTlpR/dMxRMdzO0zWMRkZR6IBPT4LQAW4bZVnrqq1k1BwgYREE2eWu+TA
         9lEyC0krFYO/XFIveM4ZdyJVuv2QfFkWE6y7cyPOiMbs9Cg3TJ+YuKFA13YavXbvO25b
         wqoEg1+v5W/4T4jDjxk8/AmDQIrdzEEmKHzLWCp53GkQTeP1yyHaOx3LHXJ9DEcTOl8a
         6DG72VHxfu9t6310Yb6aMoFIfXeOmC8HSytNmCXPwgJ9tDyLGj0K0aZ5nI5CX/whZfvK
         8jzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781688637; x=1782293437;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QMsQR2U5brjtKAtTpmkPnvwCIP0z0Kfacg+eux8Vc3U=;
        b=ffgAYsrDTOGOA7C57cUqk7HSidxC1xdVqxZkMfai+ROCdBiIYzH7oqa4U32ZmJm1UV
         VWWcyprPv2eE5to3OPV3XRIjKLu6fWbXlYopuqDfqBO/jg2AqH/2MM2CbkVorKNvJAlz
         rfcBGhGLaFtqkjkifmS7qZL5pUnuldENuBiaEVAuhDQROyWoLmZJVW/MjKn+a8HJxr7c
         LPSjCicAjUQJZWqmCDUqWE6e8apkIHvkWJ1sBju67euDjUn5ndqgNE4Ayk6DZcNJDa7a
         YkIWhdWevV5NkH5soUeUWWWjaCKI2Jf7LBk6lXwSsXiG6w+owvEVeiO8lHj1hm4W5E3A
         sUcw==
X-Gm-Message-State: AOJu0YzBS0BRYajj8FB4Gx1Vt18MxjLXvp0V8m30UdfezofU4xIVR4Rx
	Aft8S45V9uL15dDzL03s2sogxdkf3Yg6UwwfShpL6d5ffliWEpsP6OgNQbBC4RjO65g2aI54Lhi
	OpL4=
X-Gm-Gg: AfdE7ck0ZKrPORDVPmveZ8b8DkZGQPs47+t6pTWf+HAx03RmHmZir8LQz2IcvaSvaol
	0bR+/kChAPkN3adTaPgcEcxv2izNhPVIMg6+8PiIPo+LYoa5Ho9NY5DTFPun9WzXa8xGGp2ouW0
	UhMbQclBPdywmCcJnQMhWNIGP7Mn1MK041DTVa7XxppqIbzWA6H0PZ32IiCvcr5hgZOwZfEBIjN
	Z4p8kd0eIhg+I3h1I4xG6cQiMq9n0xASbcJlA4gFPlEhnm6QTB8Zxa9eIVDXpeadFdWR0aA4nRW
	DoHmaFsjRoMkTTdSgf5+NPtbjaxspyn/cyd1r1e/DznvYZ/uJI3XCpWw8YZS17fUtKqb+LfAA9c
	0RT2Q+1FcEhty5SMvDcBvY1kUdswpZIs/fbMdouraMGPxGENkoANXySjTrCQVVntKARBvWkNeHx
	YA2hzcesMfcy4U+0i4qHz+Z1co5ZNdsi0bTYmWqsSqNIV/257zheZvoiEDthRgCjjK5MmasBRY9
	W00
X-Received: by 2002:a05:6000:1889:b0:45e:f31a:7ae6 with SMTP id ffacd0b85a97d-46238f97e32mr5361656f8f.30.1781688636626;
        Wed, 17 Jun 2026 02:30:36 -0700 (PDT)
Message-ID: <0446485d-353c-44c6-bf23-7fd373282476@suse.com>
Date: Wed, 17 Jun 2026 11:30:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 for-4.22? 7/7] x86/HVM: more checking for
 XEN_DOMCTL_ioport_mapping
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
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
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1781688637-40762A53-7867D809/10/73395122804
X-purgate-type: spam
X-purgate-size: 2183
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,citrix.com:email];
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
X-Rspamd-Queue-Id: 4E3F5697EBF

When adding ranges, only alter existing ones when there is an exact match.
Don't accept ranges overlapping existing ones.

When removing ranges, only remove a range if there's an exact match.
Return an error when the range isn't found.

Fixes: 192c4dabc344 ("domctl and p2m changes for PCI passthru")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
v2: Re-base over change to earlier patch.

--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -728,12 +728,14 @@ long arch_do_domctl(
                    "ioport_map:remove: %pd gport=%x mport=%x nr=%x\n",
                    d, fgp, fmp, np);
 
+            ret = -ENOENT;
             write_lock(&hvm->g2m_ioport_lock);
             list_for_each_entry(g2m_ioport, &hvm->g2m_ioport_list, list)
-                if ( g2m_ioport->mport == fmp )
+                if ( g2m_ioport->mport == fmp && g2m_ioport->np == np )
                 {
                     list_del(&g2m_ioport->list);
                     xfree(g2m_ioport);
+                    ret = 0;
                     break;
                 }
             write_unlock(&hvm->g2m_ioport_lock);
@@ -746,14 +748,21 @@ long arch_do_domctl(
 
             write_lock(&hvm->g2m_ioport_lock);
             list_for_each_entry(g2m_ioport, &hvm->g2m_ioport_list, list)
-                if (g2m_ioport->mport == fmp )
+            {
+                if ( g2m_ioport->mport == fmp && g2m_ioport->np == np )
                 {
                     g2m_ioport->gport = fgp;
-                    g2m_ioport->np = np;
                     found = 1;
                     break;
                 }
-            if ( !found )
+                if ( fmp + np >= g2m_ioport->mport &&
+                     g2m_ioport->mport + g2m_ioport->np >= fmp )
+                {
+                    ret = -EBUSY;
+                    break;
+                }
+            }
+            if ( !found && !ret )
             {
                 g2m_ioport = xmalloc(struct g2m_ioport);
                 if ( !g2m_ioport )


