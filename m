Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IirBpMvl2kcvgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 16:43:15 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 565321604B3
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 16:43:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236488.1539175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt6AT-0006zg-ER; Thu, 19 Feb 2026 15:42:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236488.1539175; Thu, 19 Feb 2026 15:42:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt6AT-0006xb-Bv; Thu, 19 Feb 2026 15:42:17 +0000
Received: by outflank-mailman (input) for mailman id 1236488;
 Thu, 19 Feb 2026 15:42:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vt6AS-0006xV-8Q
 for xen-devel@lists.xenproject.org; Thu, 19 Feb 2026 15:42:16 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ffecd98-0da9-11f1-b164-2bf370ae4941;
 Thu, 19 Feb 2026 16:42:14 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4806f3fc50bso12629405e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Feb 2026 07:42:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a5b07fsm50352724f8f.2.2026.02.19.07.42.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Feb 2026 07:42:13 -0800 (PST)
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
X-Inumbo-ID: 8ffecd98-0da9-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771515734; x=1772120534; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=koQriyu5aOhXaj2tn/t6WG7EQMIWEKvKvMz55XZwejw=;
        b=RXaQpsXxzIWZFmd9js8B+2EMGofXZynnpogvPnXjz1jOOowu4DydSJ8iG/TDwD0z5r
         VuYnQCPT4I6iVReWBOeKLb0XBzA/L1p+nTIfpgW/Na027hekPEg2NVO7gld1r83qe0OM
         0yiHNXJJpIQTeBR7Vuffk4Znh6Z8WyHTZeKmF5Q1pXLxiYPIrgnYWZiZ+wexyqAwx8fv
         nPcV0XAUWab8sF8eqA/T5vLBNQRhpuF+FUpa0LwzSZ+dclXgZIsr7NwmFbTguVTy/pjT
         x9vwchvUf9N9X49txSEjFe3tgBRLzOB6VXlJ4RiWRuf5lrnyjYXta8/0ezHRkZS2nyJf
         +x5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771515734; x=1772120534;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=koQriyu5aOhXaj2tn/t6WG7EQMIWEKvKvMz55XZwejw=;
        b=KvSOQNVtpE6ePLh15Th2sibLZd9jBuwzzCciXh2+xrXnQ8hQgoCIpUwMeNEu4tInLw
         htd950380YV5aq6Xl8tcTwOqWKsb20sbFzrqMTgV8bjKdxbr2uprIQwYk6JFmJT4KH5O
         oaINpEimqjp1u00EXlJnwyXaaHFhXLm91ilUN5Xld9iF07/u3lXzQKSUjxdXl9DU+FBU
         Y5OmIgYLuexgX/QTNQHBilsOeHLVNfEBcZaeya4MQD/4vHy2HvNKD35x2IJ0wM7er4pd
         8zlFZUvOlS9Duf3bWrBQaBNl7VHfyWZxMy0FaPCxt8ZidotDRrVJ9XQrlNOsx3cPsHux
         LwxQ==
X-Gm-Message-State: AOJu0YzDUxnh+n7k9AAW2amzjUGWN+6XdWvu6RUumAZ5y5hFMFEfUJUI
	43EA+sqhZOKm/GbkGbMqZbf/hZAvLYNL8qqapcPf/IVGS/O29r0UZvl06h0/EPZUMsbuWvcgQhG
	xsQo=
X-Gm-Gg: AZuq6aJ/tjBo8sfyj4dyI9JiOZ1NKApU2SGfI1jNQS25SsxVKsgt8Lk53sxoaeI1sYZ
	IQYJbrOL/5IfkMJzbIz5WgNKPxfpI/1jmeriBs5ZIfkh069ySMR41hwQv0Xf7Ek8OiHT4Lwd6uf
	dFbZXzJzUKobB6KGziF4AWqRoHMCHZl5CrO2U1RlEUZJTdk1jkk2DaOpXnWAT18t4X7OhaqBYPP
	isFaTgiBrc6z7unZLS4y03FGFLjkKFPaK6BvEV1XtoG1umVpM2SAP/L7XKeWYSyYex3duyC25Z2
	K1A0C3TLK4o/jtjGT21VbI2VWTBXLpN0sYwVIHxhHaRbsEKabHz92PMo+DlM6vMvJggJAW4cBMV
	1q8fB8K4xffpe5trinO9/+l9h3MFI37/iWiLxjuVvgn1lG+SSgRVm5znRP51b17KoGVMDSOceth
	b/OGbX4UDgXWKOx4XK12NMyo5nh5ZPj2H6bjW7ngRCefVnnM4xV0xVNRrEjmRgTdO9l/1FiqQZH
	GuL55CtHHk/e+Q=
X-Received: by 2002:a05:600c:6098:b0:477:b734:8c53 with SMTP id 5b1f17b1804b1-48379ba08a6mr296036725e9.12.1771515733671;
        Thu, 19 Feb 2026 07:42:13 -0800 (PST)
Message-ID: <b2aa7f0b-147b-439f-8e25-2f7a5a2f75a8@suse.com>
Date: Thu, 19 Feb 2026 16:42:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/bitops: adjust partial first word handling in
 __find_next{,_zero}_bit()
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
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 565321604B3
X-Rspamd-Action: no action

There's no need to subtract "bit" in what is passed to __scanbit(), as the
other bits are zero anyway after the shift (in __find_next_bit()) or can
be made so (in __find_next_zero_bit()) by flipping negation and shift. (We
actually leverage the same facts in find_next{,_zero}_bit() as well.) This
way in __scanbit() the TZCNT alternative can be engaged.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Register allocation (and hence effects on code size of the change here)
is pretty "interesting". The compiler doesn't look to realize that while
for 64-bit insns it doesn't matter which GPR is used (a REX prefix is
needed anyway), 32-bit insns can be helped by preferring the low 8 GPRs.
(Granted the inline assembly in __scanbit() may also be a little difficult
to deal with.)

--- a/xen/arch/x86/bitops.c
+++ b/xen/arch/x86/bitops.c
@@ -35,8 +35,8 @@ unsigned int __find_next_bit(
     if ( bit != 0 )
     {
         /* Look for a bit in the first word. */
-        set = __scanbit(*p >> bit, BITS_PER_LONG - bit);
-        if ( set < (BITS_PER_LONG - bit) )
+        set = __scanbit(*p >> bit, BITS_PER_LONG);
+        if ( set < BITS_PER_LONG )
             return (offset + set);
         offset += BITS_PER_LONG - bit;
         p++;
@@ -85,8 +85,8 @@ unsigned int __find_next_zero_bit(
     if ( bit != 0 )
     {
         /* Look for zero in the first word. */
-        set = __scanbit(~(*p >> bit), BITS_PER_LONG - bit);
-        if ( set < (BITS_PER_LONG - bit) )
+        set = __scanbit(~*p >> bit, BITS_PER_LONG);
+        if ( set < BITS_PER_LONG )
             return (offset + set);
         offset += BITS_PER_LONG - bit;
         p++;

