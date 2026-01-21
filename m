Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KUkNB/wcGk+awAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 16:26:23 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A505927E
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 16:26:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209911.1521794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1via5y-0008L5-LM; Wed, 21 Jan 2026 15:26:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209911.1521794; Wed, 21 Jan 2026 15:26:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1via5y-0008Ia-IA; Wed, 21 Jan 2026 15:26:10 +0000
Received: by outflank-mailman (input) for mailman id 1209911;
 Wed, 21 Jan 2026 15:26:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dypz=72=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1via5x-0008IQ-DX
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 15:26:09 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80e7860b-f6dd-11f0-9ccf-f158ae23cfc8;
 Wed, 21 Jan 2026 16:26:07 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-4327555464cso3652196f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jan 2026 07:26:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43569921dddsm38605495f8f.6.2026.01.21.07.26.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jan 2026 07:26:05 -0800 (PST)
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
X-Inumbo-ID: 80e7860b-f6dd-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769009165; x=1769613965; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eSECRAgdJ7kh97tI1tfVcwsS2/Sh8RoFc4OEZoh/Wu0=;
        b=aHk3NoDL62knARGgtdwwq1BBypHfzxsby73koXeqYOcS+qIY5BcUd2ghM3VW4paB6V
         QL+1deMNKlZZFWcAgXverBDaGj8T2/5HmAbKOQFYNJ89RoDljX/+u8lZi7V5v/sLU4HW
         W6/eM7OaJ0jgi07YnDMz9ngrhLTlQx+XGXjiyJYK26+ceVBEW08/17SU+09UfemSneLp
         LAVy6kf09TSFWDT3wKnjsMXv/oIHDAedPRtIfc0MbjVkOgm4n/dSK3/Oc5n2JFTWHJYQ
         N+azcuDgO9CovDaRiUIRRhZSltGeqTrCxF9WRkUBPpTxfUlhQrdhZwTGXfICmwFQeqm5
         LuFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769009165; x=1769613965;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eSECRAgdJ7kh97tI1tfVcwsS2/Sh8RoFc4OEZoh/Wu0=;
        b=b+eWzN4uQUxvjxY51ftugMtBqxGRLVbacvw89d/MZVdo2RYS5iN3ljhzjxEvH9TIUa
         JeGNoGgRyqeDuorxqB+PKM3QtvgMtT6mAS49a9UrJxiDYUi+LPtFLzRdBxmpaZrgquFa
         oBaZQXIXmw2qbjA+XFYOpU6qOTJbDQXiaf5LBAWInNwwguXVvHDm8r8D9bYXuEw+cQgC
         01e68y/JgHdiCxbks/tQMn4/ILLC2KUU833MWhkdGxT8JBz4aQFesuZVddPgLNGx1Y6d
         p3dK4X1JCkA4KL7huYTbYzfMiksXcves6hHB799H3K8R+D2mP4ehMXfgUmtdxXSDnDr9
         BN/A==
X-Gm-Message-State: AOJu0YwpOXmGfRx5Ew62nD45aAhDk0yi8gf8qE6ugo3BegAZE0rf8xxj
	7M+vgH47bFppGMO0mEzaLPcrMWmJadoDV6sPDBgd8gKt7ol6RjX/had3g4ylphSE12ddJ3pgNq3
	zCd8=
X-Gm-Gg: AZuq6aLb8UHoPzFr5mnRaalTe0sN0saEipKGNOcCveSNthk+pVkd6TLeuebE42RVIUS
	EoXLqXtD37wIYeMcZ9ayWYOLJ/MGvBWIgqbyMynLDm/8mBQ5ZBkLb0pvaT6n61inkcb5cCoMboS
	AwL7KC2twtCYu5htL99nXTxG3Cx1uACcMBE+bVn7AAImj/UZwy3W9hz/ksicYiBkiSM4BElpb9m
	v31MF3WtHRno2eTtm2GYhf8QFCniYuhjLf7xBZztgUReg+3rCDVV/4+2CL60+kKUj5QSDwks//U
	5ODBZzHSKALEDom9ophNTuVpruXu9chclFWHc038vOjrjQqeQ/m6p3PSSlvrniez/iUEuEJVPqu
	tLgpkK3SImPm8opuxvaIgR7LdwGIE8egDcIawnScs9TJR4NlrupPnOplpZPabLZeF2F0v1kSQD8
	TpLuLsq5dAV8qjQ6gVTidtsLDmDbfv5Mv9bI6/+B5Sp/5WtTEGA9zQRn6+GB9xv31MK1t2zXYfd
	sw=
X-Received: by 2002:a05:600c:a412:b0:479:3a86:dc1d with SMTP id 5b1f17b1804b1-4803f2a438fmr65180595e9.37.1769009165525;
        Wed, 21 Jan 2026 07:26:05 -0800 (PST)
Message-ID: <9dc297d2-08f1-460a-b513-91deaecbd2d4@suse.com>
Date: Wed, 21 Jan 2026 16:26:03 +0100
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
Subject: [PATCH] symbols: don't omit "end" symbols upon mixed code / data
 aliases
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
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:email,suse.com:dkim,suse.com:mid];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
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
X-Rspamd-Queue-Id: 44A505927E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

At the example of _sinitext - that symbol has four aliases on x86:
__init_begin, __2M_init_start, __2M_rodata_end, and whatever the first
function in .init.text. With the GNU toolchain all of them are marked
'T' or 't'. With Clang/LLVM, however, some are marked 'r'. Since, to
save space, we want fake "end" symbols only for text, right now
want_symbol_end() has a respective check. That is getting in the way,
however, when the final of those symbols is 'r'. Remove the check and
instead zap the size for anything that is non-code.

Fixes: 6eede548df21 ('symbols: avoid emitting "end" symbols for data items')
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Roger, just fyi that I think that this change would mask the other issue
that you reported, without actually adressing the underlying problem.
Hence both changes will be wanted.

--- a/xen/tools/symbols.c
+++ b/xen/tools/symbols.c
@@ -164,6 +164,10 @@ static int read_symbol(FILE *in, struct
 	else if (str[0] == '$')
 		goto skip_tail;
 
+	/* We want fake "end" symbols only for text / code. */
+	if (toupper((uint8_t)stype) != 'T')
+		s->size = 0;
+
 	/* include the type field in the symbol name, so that it gets
 	 * compressed together */
 	s->len = strlen(str) + 1;
@@ -312,7 +316,6 @@ static int compare_name_orig(const void
 static bool want_symbol_end(unsigned int idx)
 {
 	return table[idx].size &&
-	       toupper(table[idx].type) == 'T' &&
 	       (idx + 1 == table_cnt ||
 	        table[idx].addr + table[idx].size < table[idx + 1].addr);
 }

