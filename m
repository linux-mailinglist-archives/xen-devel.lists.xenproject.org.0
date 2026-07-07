Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vFQ/JZMQTWr9uQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 16:43:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D8C71CC60
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 16:43:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b="DbiuuC/b";
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1356286.1610921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh718-0000jM-DY; Tue, 07 Jul 2026 14:43:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356286.1610921; Tue, 07 Jul 2026 14:43:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh718-0000gz-At; Tue, 07 Jul 2026 14:43:22 +0000
Received: by outflank-mailman (input) for mailman id 1356286;
 Tue, 07 Jul 2026 14:43:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wh717-0000gr-4L
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 14:43:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wh716-0057RY-HK
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 16:43:20 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4d107a-2eae-0a2a0a5409dd-0a2a4503bde8-40
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 16:43:20 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4d1088-ec1a-0a2a45030019-d155dd2de4f0-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 16:43:20 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-470174001a0so2357785f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 07:43:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa039b0cesm34734408f8f.22.2026.07.07.07.43.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2026 07:43:19 -0700 (PDT)
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
        d=suse.com; s=google; t=1783435400; x=1784040200; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zWdYCF/A+zQ3wz2P11T6f9u/k5R4lW8TcTPhxiBHdB8=;
        b=DbiuuC/b6rbH7agNGrR8tAaXm+f0VhVW4u6bNxJujt6Z+zzLt+cCwnoXr+iEXDyxcN
         LnAaFsTiyBcDoKtB02ahkpcAXv2YHoNtCrcLX886zN7qEPSN48DPBcGko2nI7x22y1VZ
         Z7kJVTt91tq7gP0L47UutmiRvEZekwIw23UXzsRu7SedIbsPj8PaYzKD3QLx1JrlHkpA
         JO+kYrJN1RfoFR22++aA4ru+0TyQcORKk59sjXIKe2VwKa8YoHsr0GnzqcBeoq2nHyS1
         cbo7h1EoRWWrK/UTnYlRKSr1FM2F9jOy8kQgLK9icMxDrtZLSloIuh4bR9QF3DnqRM5j
         QLRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435400; x=1784040200;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zWdYCF/A+zQ3wz2P11T6f9u/k5R4lW8TcTPhxiBHdB8=;
        b=O+gqbV6qA7Kkq/ibnSOmRrZSwKjs9v4M3GjdxCp3p5dQxpX92xUmY543uuZJA9MfSh
         Lz3epVXWgakatO1ciSTmEwL/Skusuh2ZAF75vlRiWfm4K2sx1rQt+LJVNkxeCcun2O8X
         tK23bhrJ+dC478KsLINYt/Z4opCX+nKEbuGPtq0aezN765R2hudRI+EHnbhbFIG1IQHi
         R9o4mUGKZ62z+rG7TD4pgyhwTgR9F+foTgtGoF1ow19VUhwHj1e2ilmhf69s3YE8gmO2
         PGcfgMaM0km8OoFKK3wx9brJpqLYJbVRoqwfwi33pK72RU3iESYr/tibiB6T3hjaDGTR
         1jwA==
X-Gm-Message-State: AOJu0YwI6nC6qx/QcYwvT/jnR7DR/TqCOIiILCR+SA+Pw12VkXZcJDTl
	4ydSerc9t0l+y/CnMf0JWyvW+iLTGJ8omrQRjfHY9eb7buNezhDiJzsQ8G/spYFWUkuUhbVg24f
	oE0TtUw==
X-Gm-Gg: AfdE7cm+z90Fbm3glWMI+Jtw0vTV9YXjBuOS6cvo7jONK5VuINS58/JKDUuIcyRxnF/
	Oc8FKEvzQRSiK+sgfUhVApPlz+46/h9w1chvmvT4frzM0sKmeu0CLogieYd7XDwVJbTm6jBNptp
	vfN6t6yLt1GFqHDi3Gcg2cVwNZJzBycuJc4Vt5dc4EtgKHspKf6mAHldN2vj5ZQprD890J6mm3k
	B3L7vKPcv1NA35NzOYx9I97bOgjlOh2UihxzKF0umoW7a3vZToWs0uUWXcU/JJcxbXPCKlcRDVw
	VCZM+O/r8V5VPwYicBYurF/9CzDP+aybuPzwdXuozWdSFjwvQjMzUvzYI8/05QalqYK3RnNuLZO
	8SXz/kr19yJhehq23MQTwVJFY8c8t1483Z1FaJ9lDiCVrqR0fQzKCKBSbz0qTTSVSh1x/66XKz+
	FbNXJqEuanG4zP3O5NL2U1AhLXMAzWsy2kwHIeiShTbJJ/J+9SPVq184uoOpzpyROfAy4dkPn1o
	l/M
X-Received: by 2002:a05:6000:d4b:b0:477:71ef:5d81 with SMTP id ffacd0b85a97d-47de66c7134mr5022894f8f.6.1783435399757;
        Tue, 07 Jul 2026 07:43:19 -0700 (PDT)
Message-ID: <a80dcba5-61cc-47f2-8fb7-01afd022c066@suse.com>
Date: Tue, 7 Jul 2026 16:43:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 1/3] x86/mkelf32: tidy what is written out
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <7a495793-53b1-4681-9c74-fa7e901ccf59@suse.com>
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
In-Reply-To: <7a495793-53b1-4681-9c74-fa7e901ccf59@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1783435400-B652F5D1-332A220F/0/0
X-purgate-type: clean
X-purgate-size: 2283
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:email,suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D6D8C71CC60

First, replace an open-coded literal number by an expression.

Then adjust tail padding: Don't write up to 4 bytes (and at least one),
but truly only pad to the next 4-byte boundary. And pad with zeroes, not
with whatever is left in buffer[].

Finally drop the explicit nul character in out_shstrtab_extra[] - the one
which is being appended anyway will do fine.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/boot/mkelf32.c
+++ b/xen/arch/x86/boot/mkelf32.c
@@ -68,7 +68,7 @@ static Elf32_Phdr note_phdr = {
 
 static uint8_t out_shstrtab[] = "\0.text\0.shstrtab";
 /* If num_phdrs >= 2, we need to tack the .note. */
-static uint8_t out_shstrtab_extra[] = ".note\0";
+static uint8_t out_shstrtab_extra[] = ".note";
 
 static Elf32_Shdr out_shdr[] = {
     { 0 },
@@ -97,11 +97,11 @@ static Elf32_Shdr out_shdr[] = {
 };
 
 /*
- * The 17 points to the '.note' in the out_shstrtab and out_shstrtab_extra
+ * .sh_name points to the '.note' in the out_shstrtab and out_shstrtab_extra
  * laid out in the file.
  */
 static Elf32_Shdr out_shdr_note = {
-      17,                                    /* sh_name */
+      sizeof(out_shstrtab),                  /* sh_name */
       SHT_NOTE,                              /* sh_type */
       0,                                     /* sh_flags */
       DYNAMICALLY_FILLED,                    /* sh_addr */
@@ -468,13 +468,21 @@ int main(int argc, char **argv)
         do_write(outfd, out_shstrtab, sizeof(out_shstrtab));
         /* Our .note */
         do_write(outfd, out_shstrtab_extra, sizeof(out_shstrtab_extra));
-        do_write(outfd, buffer, 4-((sizeof(out_shstrtab)+sizeof(out_shstrtab_extra)+dat_siz)&3));
+        bytes = sizeof(out_shstrtab) + sizeof(out_shstrtab_extra) + dat_siz;
     }
     else
     {
         do_write(outfd, out_shstrtab, sizeof(out_shstrtab));
-        do_write(outfd, buffer, 4-((sizeof(out_shstrtab)+dat_siz)&3));
+        bytes = sizeof(out_shstrtab) + dat_siz;
     }
+
+    /* Pad to a multiple of 4 bytes, whatever that's good for. */
+    if ( bytes & 3 )
+    {
+        memset(buffer, 0, 4);
+        do_write(outfd, buffer, 4 - (bytes & 3));
+    }
+
     close(infd);
     close(outfd);
 


