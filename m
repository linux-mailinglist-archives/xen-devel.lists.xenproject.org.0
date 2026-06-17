Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jFcVKZpoMmo9zgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 11:27:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1699F697E6E
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 11:27:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=ONZ+nhgi;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1339936.1600982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZmYk-0006WA-CS; Wed, 17 Jun 2026 09:27:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339936.1600982; Wed, 17 Jun 2026 09:27:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZmYk-0006TM-9f; Wed, 17 Jun 2026 09:27:46 +0000
Received: by outflank-mailman (input) for mailman id 1339936;
 Wed, 17 Jun 2026 09:27:45 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZmYj-0006T9-4a
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 09:27:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZmYi-008MWb-He
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:27:44 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a326890-e002-0a2a0a5209dd-0a2a4502b556-0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 11:27:44 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a326890-af86-0a2a45020019-d155802cd458-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 11:27:44 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-490acbb0f89so35883455e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 02:27:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49230a4f8d7sm139514015e9.5.2026.06.17.02.27.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 02:27:43 -0700 (PDT)
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
        d=suse.com; s=google; t=1781688464; x=1782293264; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OvgYFXrjxwjAEeit5+Y2ej8A7uiS4tWnpwH2lrGzVig=;
        b=ONZ+nhgi7j4UzUrgAmroXaeTwSEhH2seWjEBTIiC8A6XcMnat+weKySCzy6hjSNX6G
         /YdWeea23x2Z0KC9IhKp/z/GTrxeJfkGKKrfB9Oxm8VU1r7qUBjwlqrAA1xvzqrsE2FL
         WceVF79U23sOZHeDNANFH4Syn3cBAQbAhPR4Q6HQzLraMuLmhZwnrAx42uPVcMLTMRdz
         oqHUnlaW4bNHWygDZz/CAmM4bOWhhw7hyW0y98AD6XTQ0JlJk6sEz6ENQ3cDWA5LR4M2
         uhHsEthCR7cO4ynVLn5TPzWyD9fQQitDDmAiU3VMnatFsw39H//VVeH2VLtzkAczHCtE
         alUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781688464; x=1782293264;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OvgYFXrjxwjAEeit5+Y2ej8A7uiS4tWnpwH2lrGzVig=;
        b=pXOSKEjZ7nQLWS1TywwW7yq8xluU9Pw6HpykhKVXaCwgI81oRPKfB7mi40I6EQS9fw
         SqdNKVBz/ZpgYyFzDf1YkEPI32Go7G1PW6foP4KfCFyz/8sZ16gdwUHvak/xZTvjmV4e
         8MmbMUkG6476chr56fm0FEPR4R121ucb/TegZRGXd8J1QdJWy6ytGNz2wrHQ8W+1tNcy
         C4HQhUqYIUdTuUu23bi0hZpVYyxFI0CI0vLhGqYFyBND8R5TT1N/cIIuuxB9VJI7v8V4
         Ly4d7qg11HM8LgZgvT/f1+v3P/SeQvep1BhS/CgXRNZ4Ennib+tuL87fhWj4kOgs1KQL
         yJRg==
X-Gm-Message-State: AOJu0YypPQLKI3MFuOm/b1J3MYlIVZ9jywh68q4GXO2Sn4HeQ0b6Vmff
	vLZUzUi0/J/mEfXA1z1it3PApn+CksIbTlE+bpTkshAM7+cHs2uWcfdUMwzv/3MBkAuFi+ltUI1
	ZfYY=
X-Gm-Gg: Acq92OGayExClUuoslOFTSX1ktBgLQ8D8/x+ZzCnyxsXryOUpVfxCQl6pe7LEQ+3NMv
	4U8Vyg13A3Ha92JM653Rmu2gKGanxPddcHsX4k7MoqzuciiePWdt9HB5FNAvu/oJMog989c6LY7
	HKfxZKVlw0v/x+urDt4Nj+ToOcplp4d5nh1nvgSBoND21FfDnc7uGtVuwjSeXPCnO6ARY2o7LB3
	EHcqrlG2D8MffnQxZGUwfT5Tx3hGQr9DQ4h/Hadvm9Lbi7y3ubyo+HPHsEdAw60mwj2I/edZcOf
	NoKCvivfsVVEiJ3ryETX3Ew8ImY/xscDGUmxUOGOBssz/forh1Ca+SQHWmu32zkfDsvbAF231/i
	O0+DRf4E16E+qjIyi7cziLEaMIIstymnZ1A64T/gbhOUVVBM9pvjKB9DjTuImj3wUmVz8adYG2y
	ksIeSvz1b+La1I7rr59dA/iGLGSm+yGC4DovBeb7HIYuP8WsOirlf6zhvlqcvznovb7xMURrVBb
	szt
X-Received: by 2002:a05:600c:a148:b0:490:44eb:c1ec with SMTP id 5b1f17b1804b1-492333dafe8mr35524845e9.27.1781688463966;
        Wed, 17 Jun 2026 02:27:43 -0700 (PDT)
Message-ID: <f17b9ac9-abeb-44c1-8eab-6b08d563bc5a@suse.com>
Date: Wed, 17 Jun 2026 11:27:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 for-4.22? 4/7] domctl: restrict permission check for
 XEN_DOMCTL_memory_mapping's remove form
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
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1781688464-81573161-1BF51DA2/0/0
X-purgate-type: clean
X-purgate-size: 2492
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime];
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
X-Rspamd-Queue-Id: 1699F697E6E

While the granting of permissions when mapping was already removed from
this operation, check whether permissions actually were granted when
adding a mapping; the check of the requester having permission remains
unaltered.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Avoid double evaluation of "add". Re-do description, to avoid
    mentioning behavior introduced only by a subsequent patch.

--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -436,25 +436,16 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
             goto domctl_out_unlock_rcuonly;
 #endif
 
+        /*
+         * NB: The double lock isn't really needed when !add, but is used anyway
+         * to keep things simple.
+         */
         iocaps_double_lock(d, false);
 
         ret = -EPERM;
-        if ( !iomem_access_permitted(current->domain, mfn, mfn_end) ||
-             !iomem_access_permitted(d, mfn, mfn_end) )
+        if ( !iomem_access_permitted(current->domain, mfn, mfn_end) )
             /* Nothing. */;
-        else if ( add )
-        {
-            printk(XENLOG_G_DEBUG
-                   "memory_map:add: %pd gfn=%lx mfn=%lx nr=%lx\n",
-                   d, gfn, mfn, nr_mfns);
-
-            ret = map_mmio_regions(d, _gfn(gfn), nr_mfns, _mfn(mfn));
-            if ( ret < 0 )
-                printk(XENLOG_G_WARNING
-                       "memory_map:fail: %pd gfn=%lx mfn=%lx nr=%lx ret:%ld\n",
-                       d, gfn, mfn, nr_mfns, ret);
-        }
-        else
+        else if ( !add )
         {
             printk(XENLOG_G_DEBUG
                    "memory_map:remove: %pd gfn=%lx mfn=%lx nr=%lx\n",
@@ -466,6 +457,18 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
                        "memory_map: error %ld removing %pd access to [%lx,%lx]\n",
                        ret, d, mfn, mfn_end);
         }
+        else if ( iomem_access_permitted(d, mfn, mfn_end) )
+        {
+            printk(XENLOG_G_DEBUG
+                   "memory_map:add: %pd gfn=%lx mfn=%lx nr=%lx\n",
+                   d, gfn, mfn, nr_mfns);
+
+            ret = map_mmio_regions(d, _gfn(gfn), nr_mfns, _mfn(mfn));
+            if ( ret < 0 )
+                printk(XENLOG_G_WARNING
+                       "memory_map:fail: %pd gfn=%lx mfn=%lx nr=%lx ret:%ld\n",
+                       d, gfn, mfn, nr_mfns, ret);
+        }
 
         iocaps_double_unlock(d, false);
         goto domctl_out_unlock_rcuonly;


