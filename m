Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCI0D+XvcGk+awAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 16:25:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2C45924B
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 16:25:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209904.1521785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1via4g-0007rS-C5; Wed, 21 Jan 2026 15:24:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209904.1521785; Wed, 21 Jan 2026 15:24:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1via4g-0007p6-8l; Wed, 21 Jan 2026 15:24:50 +0000
Received: by outflank-mailman (input) for mailman id 1209904;
 Wed, 21 Jan 2026 15:24:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dypz=72=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1via4f-0007p0-E0
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 15:24:49 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5176f14a-f6dd-11f0-b15e-2bf370ae4941;
 Wed, 21 Jan 2026 16:24:46 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-42fbbc3df8fso3924600f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jan 2026 07:24:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4356992c6f2sm35956454f8f.19.2026.01.21.07.24.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jan 2026 07:24:45 -0800 (PST)
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
X-Inumbo-ID: 5176f14a-f6dd-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769009086; x=1769613886; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RZTtEpTOESTRhjvdUIXoliaEt16A7QryGKFv1Djsn9s=;
        b=H5liwMET1tmWIf9E6zfbuFBFByZTs4JeX3Dm6scJbK4xdia3di2DgeYg3j24h9hA+P
         8e/H99msMxFYbxElM1zprhi8yIqu7qXFNINRwr4WSEXDn1qEpkbFHg8D8Vcl0FoSiyFd
         H/WZHSBr5nNFFhqjTxPfkmgs+7t/kc3STKmeq2yY4DDQrkjiNBwjbn70lfe5CO3h4rzf
         LU/tBkJp4D1sqyy70np78+jhDIpGMNYQRdUVYnwZPv9tkfme4A37n7toHJ+8d6JTpFwy
         nYsrCv86yn3WtO/ZRKMiZjz4VbGTDnx8zy1JBS1/7ncXQXE257trO0Hv0vI+FlavHf+I
         xDWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769009086; x=1769613886;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RZTtEpTOESTRhjvdUIXoliaEt16A7QryGKFv1Djsn9s=;
        b=aPGnEZdbIPmiC5hW8DhIHH9RzcfFbRyb8XXbisGNZY0OPDR+GYcU3QUArW2n8WNWPe
         3TSx9nTy+1JUCrE/uxKsqkvOVFhhzvX8NZ6ypDTrdYlhj9B6tUflWTDO89glKWulyODf
         i1d5s7T55jlnjx8P12+eDD6EKw/Y4Izk7YPm0grWTj+U7CwgmQx/JnmSmyDOPlRUNWHp
         0SOcCigYPixIwpvG4kg1ytFCv9CD5wVaDSkD1vMfHVqJGwhyYdN0rR0kKJ14HMxXJXgB
         qWyB2CI8xScP+HiyMu0AcQd3cjNiBGv3o+4lib5FouxZCcCkUKm6nCpmRNB5MUcfCuwe
         g/Pg==
X-Gm-Message-State: AOJu0YyJoRu2lt1ynOvlTnjwpQxgu3qDsKh0tZWCoaOtzokmnMSv0oP/
	cZFmtHxS6AVrBTK1E5W3+ro4vT7eVRA/yNDppfwFh6A3ys/8wcyHdg1F9fNx0K7yyfZDsxrLEtn
	Id+k=
X-Gm-Gg: AZuq6aJvc6wSqp6OaPc9VA6LPD+6gcIOdQdYfSQql3RF5/8dBcGWC2Hw3l/0PrTh5IW
	oY7Ma9dI4DFAi6BId7y1hKvUumTSxAt8msiyHKa8LGkwK0CK72nGIE8moNvvN/09nLib0C/WMcC
	p6k3+QNuR4cVYl84X8Tq27nlsRD8gmpCNOOm8MHkS+XowHpud8yItp3s+bot1vHz9Me18Nec802
	uZ4dp6wcW7DIUYUg7zROQCe466dbNFYzbZrLusLW/60evVKvgtYjuY8gUBgpQSOzC8fIqTgrg1D
	veXTmQfnHz9lVcM6ILDjzIqk3+RzhwZSXCjoTXciGSxOCSMgvl6hJLyffBj6g9MzHdRKOXW26pM
	GAcVykVqwPT0BTxSprF/M4QQhr50rvtKOch6KUMjKmE855euX3xwHckiDTtkUvnI8i7GsJlNQel
	ggx71gyIHqbPFBkOl7UBDcW8QWjMvQtphB5l9nWJ7wsx1IA/W25yTOCvnp8L9vQFjKjtx2j/P2A
	uw=
X-Received: by 2002:a05:6000:18a8:b0:431:fc:694a with SMTP id ffacd0b85a97d-4358ff3f160mr9211207f8f.12.1769009085753;
        Wed, 21 Jan 2026 07:24:45 -0800 (PST)
Message-ID: <980b3fe5-ce30-449b-8e0b-d0f6e91dc688@suse.com>
Date: Wed, 21 Jan 2026 16:24:43 +0100
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
Subject: [PATCH] symbols: ensure sorting by value yields reproducible outcome
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
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:email,suse.com:dkim,suse.com:mid];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9D2C45924B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

qsort() implementations have freedom towards actions taken when two items
compare equal. The latest with the introduction of fake "end" symbols,
inconsistent sorting between the 1st and 2nd run can lead to extra "end"
symbols in one of the runs, making the resulting symbol table partly
unusable. (Note in particular that --warn-dup or --error-dup are passed
only on the 2nd run, and only for xen.syms, and that option has the effect
of doing a name sort ahead of doing the address sort. I.e. the inputs to
the 2nd qsort() are pretty different between the 1st and 2nd runs.)

Make the result stable by using original order to break ties.

Fixes: d3b637fba31b ("symbols: arrange to know where functions end")
Reported-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I can't exclude the unreliable sorting could have other bad effects, in
which case some much older commit would likely need referencing by Fixes:.

--- a/xen/tools/symbols.c
+++ b/xen/tools/symbols.c
@@ -40,6 +40,7 @@ struct sym_entry {
 	unsigned long long addr;
 	unsigned long size;
 	unsigned int len;
+	unsigned int orig_idx;
 	unsigned char *sym;
 	char *orig_symbol;
 	unsigned int addr_idx;
@@ -247,6 +248,9 @@ static void read_map(FILE *in)
 				exit (1);
 			}
 		}
+
+		table[table_cnt].orig_idx = table_cnt;
+
 		if (read_symbol(in, &table[table_cnt]) == 0)
 			table_cnt++;
 	}
@@ -639,7 +643,11 @@ static int compare_value(const void *p1,
 		return -1;
 	if (isupper(*sym2->sym))
 		return +1;
-	return 0;
+
+	/* Explicitly request "keep original order" otherwise. */
+	if (sym1->orig_idx < sym2->orig_idx)
+		return -1;
+	return sym1->orig_idx > sym2->orig_idx;
 }
 
 static int compare_name(const void *p1, const void *p2)

