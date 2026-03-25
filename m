Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDY7Ohjiw2lvugQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 14:24:40 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54342325AE5
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 14:24:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262336.1554892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5ODp-0002Q9-Gv; Wed, 25 Mar 2026 13:24:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262336.1554892; Wed, 25 Mar 2026 13:24:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5ODp-0002NH-DF; Wed, 25 Mar 2026 13:24:33 +0000
Received: by outflank-mailman (input) for mailman id 1262336;
 Wed, 25 Mar 2026 13:24:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5ODn-0002N4-S5
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 13:24:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5ODn-00A2Wh-7v
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 14:24:31 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c3e1fd-5cb7-0a2a0a5109dd-0a2a450998f4-40
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 14:24:31 +0100
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c3e20e-e484-0a2a45090019-d155dd35e5bf-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 14:24:31 +0100
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-43b9144790dso2518f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 06:24:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b644bdaf8sm53050131f8f.13.2026.03.25.06.24.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2026 06:24:30 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774445070; x=1775049870; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9BxAnQbQlusdq+Un61mXTAQpPPP3xW8V/k0uzyq9UTY=;
        b=bkVe48Vk84IlAUBMmIwCIYXQFLPevH8kNgSVd7sRqcVqZGx32lmyYG0o4g6ml23RBX
         Q3NqIU/958xf9ieoz/VDEvXuSlZ/RhyOl4rg0hyFNooVBKW0Tvj3tGVfC6pPWjjvOOZY
         1H4NQlu++B9I/PVI0h4YsekjsWXRbw//3iM8M7nOlfOJMfXEEdc3rXv3Vd2CGccVJ1d3
         ppiIsh/5kvX0e9a5cPNzaIqTx8YcCztaCfqzK5kLHPO63CzE4OOxoVKDSSsKLB+Mnjy0
         FxyJwgVNZQNYSLU0UbkUC1OplEcamBZEHQrf41tZbYrr/ElfrsnUPmZOGHWN6ymNpgQ3
         Dgrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774445070; x=1775049870;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9BxAnQbQlusdq+Un61mXTAQpPPP3xW8V/k0uzyq9UTY=;
        b=r55fAWeaPP3HYP+PwnRg2cAEBHKcePvnK6NPqj3uK6AGaDFdOJUWYSknkzgDltGAfD
         Me7htZiu8TmdUeuElArgw2NiZRqV3KmIN81rwhRJTiDhJwmU4srxwYuyvUCUZ6UXFLkh
         sgPeXzeHc6rqeMb8rWTZ8V428b7XkWEdWA8h5y6VaAG1DuQ7H21/On4+EbLHD96jE16c
         NpXNtnSc+uwJ5hhFKeLtwP00G5KP735csb3AWMqO46aHgVfbKmgWv9cLY+RC+NDJlbOc
         jEnMS5AAArAXbYdrb9hgyg6I+NYh3b4QkdETEUwY9VOsdUMbp8mAGec+MCc0kD7bHNnp
         M8Ng==
X-Gm-Message-State: AOJu0YyFVt2tDCo7VBgsUOm/KUaKUpDlF6RXpyzirzT0EFP+keE/Gs1S
	Q1YFLt+UAGEW1Igu0cTm8fzBZDTbv33IwdnEvohk6KXqvhn+MhBwqZunDbgIsAfQ55nIlFvtAeT
	askTb5A==
X-Gm-Gg: ATEYQzwrlsZXDckFi5l+4T64Xf7eFmAl1xOdKfgPT67K86miSYzlIzIzHM+jlmArTTT
	Ja78SX/ndgZgt9fN6KFh1unN0BH2zggiexLeup46iBmg4b/O4MK/16PS5V/Jdzkg+4nUL3icZ8Z
	CSDq8ZSNOffAyRiNiucV3WjyvzfcyPsVHw3p8fWEIuCD3l3abrHR7I5aDRhrr6y5w/Z2rGvs4s0
	szRs0coAt6Mq1MYL+34VJ7DdknchXF3j8FKGXWSE3NK5H2wyWaeFfIToXKYRwijlZTD+TBsvmid
	Km/267EQMLdI/jlfVwQQdeYbQsZKw+AaUjyBJiEhX1H3kvTynOnkdqYEiLMQtwEMKf5xjtYSniZ
	MIkJEzSehf01C8yemg1lFZi7wxZc/vpfxzq1eVmKn+pwy5BqVTH3Fni16IjqqD56eXG4HRBDTmR
	tjjStbTFuMo4a/ePFNo32qmq9hj8M1Hx8Ay8PmjCv5eKW9Z5d0Xrnsu8/6BNa+QDwtybKO2nMnw
	lwPOWSUYt6Q7lA=
X-Received: by 2002:a5d:5d0b:0:b0:43b:4592:f91b with SMTP id ffacd0b85a97d-43b8899d295mr5377546f8f.5.1774445070438;
        Wed, 25 Mar 2026 06:24:30 -0700 (PDT)
Message-ID: <32ae65d3-8305-419e-8180-183a2fc8c29e@suse.com>
Date: Wed, 25 Mar 2026 14:24:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 2/2] EFI: move pre_parse() back next to get_value()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
References: <aa19318c-c91a-4cda-b36f-d2049914c42c@suse.com>
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
In-Reply-To: <aa19318c-c91a-4cda-b36f-d2049914c42c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1774445071-68152A73-45487F9D/0/0
X-purgate-type: clean
X-purgate-size: 1941
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:marmarek@invisiblethingslab.com,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid];
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
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 54342325AE5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

These are siblings, so better would live close together. Sadly in
1f9540cd8eb6 ("EFI: move efi-boot.h inclusion point") I moved get_value()
without also moving pre_parse().

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -581,6 +581,31 @@ static char * __init split_string(char *
     return NULL;
 }
 
+static void __init pre_parse(const struct file *file)
+{
+    char *ptr = file->str, *end = ptr + file->size;
+    bool start = true, comment = false;
+
+    for ( ; ptr < end; ++ptr )
+    {
+        if ( iscntrl(*ptr) )
+        {
+            comment = false;
+            start = true;
+            *ptr = 0;
+        }
+        else if ( comment || (start && isspace(*ptr)) )
+            *ptr = 0;
+        else if ( *ptr == '#' || (start && *ptr == ';') )
+        {
+            comment = true;
+            *ptr = 0;
+        }
+        else
+            start = 0;
+    }
+}
+
 static char *__init get_value(const struct file *file, const char *section,
                               const char *item)
 {
@@ -904,31 +929,6 @@ static bool __init read_section(const EF
     return true;
 }
 
-static void __init pre_parse(const struct file *file)
-{
-    char *ptr = file->str, *end = ptr + file->size;
-    bool start = true, comment = false;
-
-    for ( ; ptr < end; ++ptr )
-    {
-        if ( iscntrl(*ptr) )
-        {
-            comment = false;
-            start = true;
-            *ptr = 0;
-        }
-        else if ( comment || (start && isspace(*ptr)) )
-            *ptr = 0;
-        else if ( *ptr == '#' || (start && *ptr == ';') )
-        {
-            comment = true;
-            *ptr = 0;
-        }
-        else
-            start = 0;
-    }
-}
-
 static void __init init_secure_boot_mode(void)
 {
     static EFI_GUID __initdata gv_uuid = EFI_GLOBAL_VARIABLE;


