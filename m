Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAznABqeBGr3LwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 17:51:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 694AB536835
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 17:51:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308251.1579781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNBrz-0000hh-WC; Wed, 13 May 2026 15:51:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308251.1579781; Wed, 13 May 2026 15:51:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNBrz-0000gJ-Ta; Wed, 13 May 2026 15:51:35 +0000
Received: by outflank-mailman (input) for mailman id 1308251;
 Wed, 13 May 2026 15:51:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wNBry-0000gD-AE
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 15:51:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNBrw-00Cdap-5K
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 17:51:33 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a049dfe-e002-0a2a0a5209dd-0a2a4508abcc-6
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 17:51:33 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a049e05-63b5-0a2a45080019-d155dd32d56d-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 17:51:33 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-43d7645adbdso3825567f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 08:51:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4548e6a6a64sm43157039f8f.6.2026.05.13.08.51.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2026 08:51:32 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778687493; x=1779292293; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jUF/DEKVhVThSf8vu55fKjDHjFPpjINhinISnlyhVoc=;
        b=OgO2WLp7OFTfvZEEIu+n2tMLLu2vOHczZyd5qaPrWYCuJK6zAi7MwDohzKJn3CG++g
         aY43Y1DBI4kCmRNGewGisOwz6x2yv+QHbtx4fMmPCmd9SkTMERgA0kUOpDolFleejIEg
         d2de+WKD0tJs1s06O1iVfgvJmLo/6Az/LcJ7oSQe56X+hpJxJp6+yn3Xiy4SkrKIuPwp
         B9m/HAzwOJxXS3AwhLgeWo+Shcv12Csq74y7ps8lOTqltl8kTdD/sW3nYVQdZ/VJxg3I
         CwI872NVPNHi9ydBqfXWMxj9Glk6lprjLLPjaJfibsDYt/mCofprfrddLXIbMnQajsPh
         b3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778687493; x=1779292293;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jUF/DEKVhVThSf8vu55fKjDHjFPpjINhinISnlyhVoc=;
        b=ocNmL8M4K+6CW9PEeYhVHhZXBdj+I6oIjlS5jb9MoD6sRLAlU+f+KPDY4cdvlJM7oW
         ig9FatEg1F9fLOGK6WRNhVI6Zzpz8Ir4PZ+nF2AUMwwRYZmBWOorPJv5pkYYfDibQAvi
         wq3IU7R3rIWa2uavzLtICMNHb+NfZ0OyAUynX16PPDA/7adIDKqhsD4puHMhJ8JOFIcG
         pGNOPzqnn3T52zOk+guYEWjngwaXuC9ElYhq+h0nPQRhixe7am6SmAisfKBzdzLt6eXa
         s+Mtdf8lvNtZATuifBPP3eC0ioYpbyAO7LFozi3tpDciMZ96oPFn0AteN1jx97c0ivcB
         TotQ==
X-Gm-Message-State: AOJu0YwYqjeeitztVWQL6ssXAHJmGYhyPdknarvzMqVC727p2m44oGKE
	G+zC3hO0L1Cb6eQnb61D5rmXVwXr3sNtg6aag8YMriG3QErXxgHSGWfbpSu5yQiHJ80EHVIdNOR
	rqk8=
X-Gm-Gg: Acq92OFPz1uK6SUqvp62JG+f6XFPy3TBZYSyKn1vCv8bwBACkchgv7sfndkTUySt6RZ
	EYUrD/dqwimBPtwo/obIkW5YquhzisjScaEyX1MKjXMflTX5Ai0Kaxht9AsvJkn8K3EWJVH2LOO
	ZIjRBXI5reUp1PXgBVb8wxKuW65CD+ScYVc4SMX5wRFDu+YbFIFkX3ZfQhKH/27DIjoWIvkj/pQ
	O0drQfsKEBSvH5GWjHq/bqG91RkIwpFYEzYq2y9+6ykR7z1yfoA//nyLN4G6DzYM1kGEcMsSa7H
	ZJWgZs8bwcx0PUhk72q9RZKZ46FHCMeQdeZoqBrjZDC+835YOyEgmCHvCOpM1X218sEQKGhEXDZ
	3AjQTDqCIJUH+UJU7tFGa07YAkqAhc83UjeGYNHiSyVaz+SuoPNmLtNUKufghBAsyVUQFwBMm1s
	nZCFatalsg1id7EWVLwnxB+ku969o72Ii3FJ+yvMytVhYbmbpLsoh1rT5ZpMfmKjVJsDYqUhcPi
	Eh6AcP5x4agm8c=
X-Received: by 2002:a5d:5d83:0:b0:43c:fc5c:a9fe with SMTP id ffacd0b85a97d-45c5a1a92eemr6161695f8f.20.1778687493113;
        Wed, 13 May 2026 08:51:33 -0700 (PDT)
Message-ID: <036752dc-5333-4d01-acaf-ed450e09fe48@suse.com>
Date: Wed, 13 May 2026 17:51:31 +0200
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
Subject: [PATCH] crypto/vmac: adjust for Misra C:2012 rule 17.5
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
X-purgate-ID: tlsNG-c1860d/1778687493-B797DDB1-ECA2D6F4/0/0
X-purgate-type: clean
X-purgate-size: 2909
X-Rspamd-Queue-Id: 694AB536835
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:mid,suse.com:dkim];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

... ("The function argument corresponding to a parameter declared to have
an array type shall have an appropriate number of elements"). Instead of
casts, (ab)use unions.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/14354119193
(also covering the 20.12 patch)

There are also two cautions (in vmac()), which aren't dealt with for now.

--- a/xen/crypto/vmac.c
+++ b/xen/crypto/vmac.c
@@ -926,41 +926,41 @@ uint64_t vmac(unsigned char m[],
 
 void vmac_set_key(const unsigned char user_key[], vmac_ctx_t *ctx)
 {
-    uint64_t in[2] = {0}, out[2];
+    union {
+        uint64_t q[2];
+        uint8_t b[16];
+    } in, out;
     unsigned i;
     aes_key_setup(user_key, &ctx->cipher_key);
     
     /* Fill nh key */
-    ((unsigned char *)in)[0] = 0x80; 
+    in = (typeof(in)){ .b[0] = 0x80 };
     for (i = 0; i < sizeof(ctx->nhkey)/8; i+=2) {
-        aes_encryption((unsigned char *)in, (unsigned char *)out,
-                                                         &ctx->cipher_key);
-        ctx->nhkey[i  ] = get64BE(out);
-        ctx->nhkey[i+1] = get64BE(out+1);
-        ((unsigned char *)in)[15] += 1;
+        aes_encryption(in.b, out.b, &ctx->cipher_key);
+        ctx->nhkey[i  ] = get64BE(out.q);
+        ctx->nhkey[i+1] = get64BE(out.q + 1);
+        in.b[15] += 1;
     }
 
     /* Fill poly key */
-    ((unsigned char *)in)[0] = 0xC0; 
-    in[1] = 0;
+    in.b[0] = 0xC0;
+    in.q[1] = 0;
     for (i = 0; i < sizeof(ctx->polykey)/8; i+=2) {
-        aes_encryption((unsigned char *)in, (unsigned char *)out,
-                                                         &ctx->cipher_key);
-        ctx->polytmp[i  ] = ctx->polykey[i  ] = get64BE(out) & mpoly;
-        ctx->polytmp[i+1] = ctx->polykey[i+1] = get64BE(out+1) & mpoly;
-        ((unsigned char *)in)[15] += 1;
+        aes_encryption(in.b, out.b, &ctx->cipher_key);
+        ctx->polytmp[i  ] = ctx->polykey[i  ] = get64BE(out.q) & mpoly;
+        ctx->polytmp[i+1] = ctx->polykey[i+1] = get64BE(out.q + 1) & mpoly;
+        in.b[15] += 1;
     }
 
     /* Fill ip key */
-    ((unsigned char *)in)[0] = 0xE0;
-    in[1] = 0;
+    in.b[0] = 0xE0;
+    in.q[1] = 0;
     for (i = 0; i < sizeof(ctx->l3key)/8; i+=2) {
         do {
-            aes_encryption((unsigned char *)in, (unsigned char *)out,
-                                                         &ctx->cipher_key);
-            ctx->l3key[i  ] = get64BE(out);
-            ctx->l3key[i+1] = get64BE(out+1);
-            ((unsigned char *)in)[15] += 1;
+            aes_encryption(in.b, out.b, &ctx->cipher_key);
+            ctx->l3key[i  ] = get64BE(out.q);
+            ctx->l3key[i+1] = get64BE(out.q + 1);
+            in.b[15] += 1;
         } while (ctx->l3key[i] >= p64 || ctx->l3key[i+1] >= p64);
     }
     

