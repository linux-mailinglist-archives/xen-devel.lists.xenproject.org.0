Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fXDvLuTEQ2oVhQoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 15:30:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 123C66E4DCB
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 15:30:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b="EI/xPCWw";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1348879.1606670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weYX7-0000wG-1r; Tue, 30 Jun 2026 13:29:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348879.1606670; Tue, 30 Jun 2026 13:29:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weYX6-0000uF-VQ; Tue, 30 Jun 2026 13:29:48 +0000
Received: by outflank-mailman (input) for mailman id 1348879;
 Tue, 30 Jun 2026 13:29:47 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weYX5-0000u8-9L
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 13:29:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weYX3-004aGV-Mn
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 15:29:45 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43c4c5-e002-0a2a0a5209dd-0a2a450a9396-16
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 15:29:45 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43c4c9-e40e-0a2a450a0019-d155dd29e82d-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 15:29:45 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-4629051c9d1so2604087f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 06:29:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-475641e4618sm7681986f8f.9.2026.06.30.06.29.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 06:29:43 -0700 (PDT)
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
        d=suse.com; s=google; t=1782826185; x=1783430985; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M9tmno+znSv/d2+fMnlwE81nLCVI/vorM28WqdREbFs=;
        b=EI/xPCWwHgWkZQx1r3SgPm7QuzzsNUorBOUK556vgB2dDiPWb5b3/d4v0nY2AQ7Gnj
         tIffHkg+/czgO4653NJro4ls7kTxypyPQM8ySj02jXmZEp9AYXHorASUaThictduHxaH
         SiCL7frTXCAc/Rl8FfKn3fS+vkY+dolAzRnhEtEYMEZ7zBksVL3YVUBzpKeX4liMsRMA
         5VxDB0rVJVNflcAmeV9Z4kZcXzVYR0k/4ioizLitrjPRIpR4jkaXsLhzDoMfCxH7CLJ7
         F0fePqDS+fvSyHjwUhSspbVfpXwbC2BTtsoLjY/nK0GkcMdqFO/wHjMTdrMX6qtUWtUS
         Xy2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782826185; x=1783430985;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M9tmno+znSv/d2+fMnlwE81nLCVI/vorM28WqdREbFs=;
        b=l1qxZgEC4ajTUKmT3JgoacmQSZnopFbgFUzNPbVT0bLOTbw/8CVMHxu007JhxQ8Tla
         6r+Ns5M3aTXZ7aESkH8cYZXDpkfK5NF5pIopJJUBMEeVzckY1KOQR+9pCb5rWpfZEWVx
         wL63Ti+jKuZqCVxv5YSGgl9OIhSsuiNO8WuFfM3vHP3c0TpD6Ay88qv77M00rMsf2ICY
         aY6cJu6RafZ6SgbfFYaC3swU0JEtswRgb8tACO03OCetgNMf5Gj2K61oaasaC2PU9T5T
         Trxupnk+sm1D50J1mSmnPN9YI6kYNo/eooo9CXzEBCnXkyj0QAq+xRToubpPlfuk4T8k
         Lh4g==
X-Gm-Message-State: AOJu0YzSedT+S6hVCqz9tArJlMe3Wd+zRe4+JG61Zcu0EbUfcrOOrDid
	wglJGUYc4gO6oROnw9qi2lKOE9Z5J+lrunrok2SoqU41TBlg3xm5rwQzWwhMB0+hRPOq0dhJj5/
	gwjyGMw==
X-Gm-Gg: AfdE7cmH8aKavrPmwXYghwvHhbpFiwczV68AxjXwcPdiX7DTDzIiR/F2ul/Me6fH0t/
	jKP88ymHnDt4D0n2Z6s6KnexGpRGV/Aswa9zw1TS9lOYlkHyVpTqhIeMAW61kHfXiyP6h49dOXf
	JSTC2LqISrm1FGT+mlf6bDmM7Lsioayt0LbHTKps3QuAQhB9kZCwPpqW9OsFceEhjQ0a1RdKvSZ
	C1dqYWfmXtp/V2mHVrk8pu9vr+KvwaTw0STjX8jILtoB9Jh4iiYO4ury2H9dqESMEEo8aXYzoFD
	ov8ytwfnvi5gg5xLi7kPCz32GCvF/krtvEcdSME/w58/1jbFHzXw9U7p6rQMGD3bU1Ub4Ig4kCN
	BREJ1fi7eRNKUUftv2m404A9zqATIg4TOTSSQpgB+HbPPtdV78knYqxNGyMwd9sqQIbkk4UDZ2T
	W4emXRnMXrjLo/0ZrIH9VEeHvTv+aGZ0EkkB0GQctCTeF+d23yv6NF62zJYtH9/IxRvDmo1tu85
	/51
X-Received: by 2002:a05:6000:2408:b0:475:f0f0:9ec7 with SMTP id ffacd0b85a97d-475f0f0a01bmr2639945f8f.50.1782826184622;
        Tue, 30 Jun 2026 06:29:44 -0700 (PDT)
Message-ID: <fb374bfb-73a5-47dc-8227-c0c172620f19@suse.com>
Date: Tue, 30 Jun 2026 15:29:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: drop dead conditional from decode
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
X-purgate-ID: tlsNG-4011c0/1782826185-D7D33DDE-534AAD68/0/0
X-purgate-type: clean
X-purgate-size: 757
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 123C66E4DCB

We know that opcode_table[0x0f] is 0, there's no need to check that. Up
until ab082ffa87d5 ("x86emul: generate and make use of a canonical opcode
representation") or maybe already c4e7a67e3a10 ("x86emul: drop
SrcInvalid") this may have been justified, but it no longer is.

This eliminates a Misra C:2012 rule 2.2 ("There shall be no dead code")
violation.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -1082,7 +1082,7 @@ int x86emul_decode(struct x86_emulate_st
 
     /* Opcode byte(s). */
     d = opcode_table[b];
-    if ( d == 0 && b == 0x0f )
+    if ( b == 0x0f )
     {
         /* Two-byte opcode. */
         b = insn_fetch_type(uint8_t);

