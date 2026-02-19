Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MM9iApMvl2kcvgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 16:43:15 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BB01604B4
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 16:43:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236495.1539186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt6BH-0007S2-Nn; Thu, 19 Feb 2026 15:43:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236495.1539186; Thu, 19 Feb 2026 15:43:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt6BH-0007PD-Kf; Thu, 19 Feb 2026 15:43:07 +0000
Received: by outflank-mailman (input) for mailman id 1236495;
 Thu, 19 Feb 2026 15:43:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vt6BG-0006xV-T3
 for xen-devel@lists.xenproject.org; Thu, 19 Feb 2026 15:43:06 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aed94d37-0da9-11f1-b164-2bf370ae4941;
 Thu, 19 Feb 2026 16:43:06 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-4377174e1ebso825546f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Feb 2026 07:43:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796abd259sm52351967f8f.24.2026.02.19.07.43.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Feb 2026 07:43:05 -0800 (PST)
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
X-Inumbo-ID: aed94d37-0da9-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771515785; x=1772120585; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hCb38Ea1hOfNAfpEej2H+6DfKSlVXHCk1RdTslLQz1Q=;
        b=Gfa20Tge2m0+mkhNGOytvaS66UmmrxcIdKCRIq2twT1od2Qff85duqpEeqVB//NeZv
         Is/yAcJeq3XTPVDcMFuPadWy64H7E3wtup5fSOfoCmjXANyuQBDBuGnf2xRXpDUlPhRr
         MTRGIULr8AARRBYow10CfSwJLS31Zzla9u95TYPREBYfbMeDX5OYYhO/7GqjgoA/lWib
         AZlbGfxsJU5OxRzU6bPO0a6ULRwrz3WKtdHywX8VLDmA6rlfyuHKBWQzpq4ZjGpTZbCW
         PCopedB7uNlaHogsc4WbJjeJN77bK80EEvP48vwiOVXCMtfisbqntAahIElIlMUg76pX
         eNAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771515785; x=1772120585;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hCb38Ea1hOfNAfpEej2H+6DfKSlVXHCk1RdTslLQz1Q=;
        b=aeVPiriIwb/F4nBqzg5q3I6yEdB1tsN4SeYvhwbPNhcg/FgLmJZiO6PRUVBvwCGAGh
         ZIWim2OZDy7Orn73EY29/1fr0wsnU7hoLPpqHf9U0lggsT8eY1XHzQUAEXhJZCptHw32
         hL0x+9Ed64g8pKMAuaRI1nj4BrHAGE1hpYdoVh7R5GMezJcladdVYlvvZnwv7MjyeNPr
         xwG+1qNTcoqdh46YPkr2kNe/i3GWeKN1LKKKS23jAlaDyqLyQVA749ziRsZDTNTD2Lk5
         gkYlg7V67Q0HuaJU5dO88zQzNGf8EWu0rWfNj1wnaNYfnx44smBBJzKflrUe3wkVp/sl
         XF2w==
X-Gm-Message-State: AOJu0YyPjWRM9dkkyuiyGbRlII/IHV0AAQFrKNXsB7zWmazCZBPw5I3x
	uozLHZ3WfUwM3m1Huy7IZWAXdRTmJOzPxd+S4Gxl0QMttRLBi3OzoVePdCKzIK9umZBGTabtLJ7
	XKBI=
X-Gm-Gg: AZuq6aIeG0wEF52qps1jCIFnhf+wIM7cNFmv5cuOLNJZd5m9MmswSXRtFZVx5cf+c/4
	R3twdASX2TzqUDawukyxRQcCkY9FSGmBPtx7DPHwiCr/chdKaiiBuknvi8q9TeJj+1tAN4lMIqF
	LPbW59Cfw7h9VVWPnUFrJsNQeDN9j1qCP8+0g+m1CMBAzhQ7eRhD77FTkmd4rgmbYrPj9uUxnrA
	ZyC0heaFqEqXpsl2ySLko5ufJB2/WEMKYI+fj3+/zJCnhJP8hhA8K9PDaeLeGuNuG9cMEPvgJ7+
	wABch1Qmio0tEcvLEbobXwmH9xmA4DuxCVhUeXCUB3ju34uXVbDM21w2TAotJM6H38yKJMw3UP0
	MuirDDsRMx4AJs+3UzX/53wuX/D9j5riH1itSDK8pcJkKaee48WxnExwmh+4D/73CKEOq9SNtss
	BOqfOulD+4GL7/vAR1/La2Ztlwb6mr8XhXKfKEgL/ooqqxdYTTZPi9+jMZTy6AykSa6i2jrXZsX
	PgaEOGY/kZ3Bhk=
X-Received: by 2002:a05:6000:3101:b0:437:694d:fb6c with SMTP id ffacd0b85a97d-4395fd2ab83mr4521207f8f.9.1771515785516;
        Thu, 19 Feb 2026 07:43:05 -0800 (PST)
Message-ID: <0cd3f675-e310-4434-aa95-cb0cc86e3569@suse.com>
Date: Thu, 19 Feb 2026 16:43:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/bitops: drop redundant casts from find_next{,_zero}_bit()
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
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim,suse.com:email];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 95BB01604B4
X-Rspamd-Action: no action

It's not clear why they were put in place - a__ is of the very type
already.

No change in generated code.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/bitops.h
+++ b/xen/arch/x86/include/asm/bitops.h
@@ -343,7 +343,7 @@ static always_inline unsigned int __scan
     if ( o__ >= s__ )                                                       \
         r__ = s__;                                                          \
     else if ( __builtin_constant_p(size) && s__ <= BITS_PER_LONG )          \
-        r__ = o__ + __scanbit(*(const unsigned long *)(a__) >> o__, s__);   \
+        r__ = o__ + __scanbit(*a__ >> o__, s__);                            \
     else if ( __builtin_constant_p(off) && !o__ )                           \
         r__ = __find_first_bit(a__, s__);                                   \
     else                                                                    \
@@ -375,7 +375,7 @@ static always_inline unsigned int __scan
     if ( o__ >= s__ )                                                       \
         r__ = s__;                                                          \
     else if ( __builtin_constant_p(size) && s__ <= BITS_PER_LONG )          \
-        r__ = o__ + __scanbit(~*(const unsigned long *)(a__) >> o__, s__);  \
+        r__ = o__ + __scanbit(~*a__ >> o__, s__);                           \
     else if ( __builtin_constant_p(off) && !o__ )                           \
         r__ = __find_first_zero_bit(a__, s__);                              \
     else                                                                    \

