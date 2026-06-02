Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xt5aManYHmr7VwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 15:20:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECD462E6D7
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 15:20:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=Gmnn30ZJ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1325029.1590548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUP2k-00011r-3L; Tue, 02 Jun 2026 13:20:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325029.1590548; Tue, 02 Jun 2026 13:20:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUP2k-0000z3-0C; Tue, 02 Jun 2026 13:20:30 +0000
Received: by outflank-mailman (input) for mailman id 1325029;
 Tue, 02 Jun 2026 13:20:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUP2i-0000yx-NE
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 13:20:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUP2i-00Ebud-3u
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 15:20:28 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ed894-bab6-0a2a0a5309dd-0a2a450ca6da-44
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 15:20:27 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ed89b-62f1-0a2a450c0019-d155802bbcfb-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 15:20:27 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-490a762db7aso20212705e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 06:20:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b0e37851sm70650385e9.13.2026.06.02.06.20.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 06:20:26 -0700 (PDT)
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
        d=suse.com; s=google; t=1780406427; x=1781011227; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sxv20Mr0Tf4L24+fePzY8EbdSpHRSWuEpECASIsK+30=;
        b=Gmnn30ZJlJ7bRlVHMMitarZVbwuL8oiYd7diSxAkjfoV9xGJuxa4xbgSGUy2IvzDqH
         l/NEcEoj7NoMIZYwFNGvhz2Wi5r+OPcyHHM5hsIH9zYmiiUplHDUKvNeBfkzC/CP0X3z
         nhkHV+L93DI+qRGOzo/qwO50LuD7k/1YibA5PKhIkqnpkuggTzO1TrbzvL4D+tLo1kpy
         7GAab0vroOSL6X9khbmvGC1o4TYEjL8uXqAsXSziOMAupV7Hh73PkIsa54avmp1gqpe3
         F2tXyCML04fL+8eEH5grdqF++6tY0LFT93iBbr2nUOg0XdyiA6Lm519sc7w3vcEeH3X/
         Yabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780406427; x=1781011227;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sxv20Mr0Tf4L24+fePzY8EbdSpHRSWuEpECASIsK+30=;
        b=Qlemd2Z6gl92/Da5SUAeRVPYJzlcXjMvI3SLZNfbV8fcgnJ+aISgIgB8cdO6vx1aDs
         gyafERxMilaC/6j42DB1Oi7drygc3ZGBjthQmXT3qU3PHT+HjiEGfd5y78qJpT5fL1Bf
         LKxJRlX/Z/XZc49bbuSWcii+d5aAqpI8fnMUBNpQByDz9BDsvGIKfbTrWF7LqKcP9xF5
         rfgL3xlDEsmt02vZDX2w27N1QdcVDCDSzAbGNoRWCdYxyh0HtXWJRLp1gK9HL6TpjTAo
         zSyjWj/J0hsUH+jJqU89MW50czTAeAj0awfCELii5a7KzzKE+4L67/vlzXkpVUlB/UaC
         G5Vg==
X-Gm-Message-State: AOJu0YzW1z2ygVBv04Pn3Bt3ZlQjcUaDnq93v/8YXD/H0PuFBQxadCsX
	EulRUxQhTdZMpNJNMTimBJLEWa3qOQNadb+HJhSHo23/Ye1gvuP3l/rrA2p1WVWTcrigWLXXe2x
	HBuo=
X-Gm-Gg: Acq92OHEDzIymgoMZyL30Dge/oL+9+7B3e8TBbxMSpAgmKljBWNVTK74+qAnfFL9YPb
	G2lCknVzeluQdXPxijPaJmxH5g/6o3ZSj7QC382fURbn5xda/JdOp5e7+WTrhZdIEEFuvwAEYiu
	n97VwBDuaBu/2Q1pxyzuIiP9RQV+l4quDvc837r3JURgtw9fZ8REE0HUQoVYgQT3XbiZrGWZvqU
	sVWPCMZgM+bm6XB2QL0c7TulSSIrWodrPsr/69QVUocGbPzgY1ZvyPEo5bt0Ao9RatOYCcAOdG2
	PuakVAfRD+mG/Zi2/ukJfSfd1ZR5yuZkxF08Lvb9b0swHiBT7QiCZ/dGbHLIbBwNP5o6Dgxkxen
	0gX171ChD+bHBZXVb8e6bOsg4Xj0sfAibJU6BjqFI8zAv9G283Q/T7fZyOTkmuqMYzWczrCO7oj
	1SYLGbHuq4wdybUWKBrGAcC59hNfRHgOEncq6ntNO0SbN8C3gz5zxAI9nRtUOy5nBfSRT8M5i0h
	ZGOVI8PlwwaB0doBfF/PJQi/A==
X-Received: by 2002:a05:600d:8648:10b0:48f:e245:394e with SMTP id 5b1f17b1804b1-490a2943943mr224720335e9.27.1780406427171;
        Tue, 02 Jun 2026 06:20:27 -0700 (PDT)
Message-ID: <b61214a2-6198-48eb-95ef-9104d57f3691@suse.com>
Date: Tue, 2 Jun 2026 15:20:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86/PV: rename a local variable in pv_emulate_gate_op()
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
X-purgate-ID: tlsNG-d25034/1780406427-E0766CF5-6487FC46/0/0
X-purgate-type: clean
X-purgate-size: 1992
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:nicola.vetrini@bugseng.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,bugseng.com,gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:from_mime,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
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
X-Rspamd-Queue-Id: 0ECD462E6D7

... shadowing a function scope one, thus violating Misra C:2012 rule 5.3
("An identifier declared in an inner scope shall not hide an identifier
declared in an outer scope"). No difference in generated code.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Technically, as the outer scope "rc" isn't used again later, we could
simply drop the inner decl. That seemed more error prone to me, though.
---
v2: Re-base.

--- a/xen/arch/x86/pv/emul-gate-op.c
+++ b/xen/arch/x86/pv/emul-gate-op.c
@@ -287,17 +287,17 @@ void pv_emulate_gate_op(struct cpu_user_
     {
         unsigned int ss, esp, *stkp;
         uint32_t value;
-        int rc;
+        int left;
 #define push(item) do \
         { \
             value = (item); \
             --stkp; \
             esp -= 4; \
-            rc = __copy_to_guest_pv(stkp, &value, sizeof(value)); \
-            if ( rc ) \
+            left = __copy_to_guest_pv(stkp, &value, sizeof(value)); \
+            if ( left ) \
             { \
                 pv_inject_page_fault(PFEC_write_access, \
-                                     (unsigned long)(stkp + 1) - rc); \
+                                     (unsigned long)(stkp + 1) - left); \
                 return; \
             } \
         } while ( 0 )
@@ -361,10 +361,11 @@ void pv_emulate_gate_op(struct cpu_user_
                     unsigned int parm;
 
                     --ustkp;
-                    rc = __copy_from_guest_pv(&parm, ustkp, sizeof(parm));
-                    if ( rc )
+                    left = __copy_from_guest_pv(&parm, ustkp, sizeof(parm));
+                    if ( left )
                     {
-                        pv_inject_page_fault(0, (unsigned long)(ustkp + 1) - rc);
+                        pv_inject_page_fault(0,
+                                             (unsigned long)(ustkp + 1) - left);
                         return;
                     }
                     push(parm);

