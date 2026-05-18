Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKJfNRjhCmqR8wQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 11:51:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A24456A144
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 11:51:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311735.1581857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOuct-0003gi-6f; Mon, 18 May 2026 09:51:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311735.1581857; Mon, 18 May 2026 09:51:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOuct-0003do-3l; Mon, 18 May 2026 09:51:07 +0000
Received: by outflank-mailman (input) for mailman id 1311735;
 Mon, 18 May 2026 09:51:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wOucr-0003de-CU
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 09:51:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOucq-00893p-Oc
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 11:51:04 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0ae0fa-2eae-0a2a0a5409dd-0a2a4509be50-34
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 11:51:04 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0ae108-2497-0a2a45090019-d155dd2cb0a7-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 11:51:04 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-43fe608cb92so1148921f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 02:51:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0fe0fecsm33420436f8f.26.2026.05.18.02.51.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2026 02:51:03 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Autocrypt:Content-Language:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779097864; x=1779702664; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yT10nE9+UeFw0lvNVFr/cnlH9rTSD2KxkA0YNAaxeRI=;
        b=aOob9NHM8zNN/6zS/2lYSuld9XLZhpz1eIpzqSeD6/SuDh/IWWCjjG9lyxW1N7bUSW
         XE+3Gv9KhmhfLAOODtDw9G5eUDN22Cz0sNnO81gtEr+XZxBKtjemtl6yAB2vzCuw8zlb
         PKddaFWWlyW0dD0WS8W+en9FFfb2lS7QIEMhf3zmeLDS6N/k7NAkWCzU7+0ceeKj33zT
         69dCiCpSTvOU/YzvyZspF+Eh6KAUsgkFmv4JcZ7ZraiS7p1Wdq8lPZPhRmd57d2iQpaf
         Mw/POZ0+RvU/TVw9gm7chVyX6XXtTkCrqQNFGooFLZdZJsypCGbsvD8C7S2TUmtMRPGg
         Dl5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779097864; x=1779702664;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yT10nE9+UeFw0lvNVFr/cnlH9rTSD2KxkA0YNAaxeRI=;
        b=nBGeJwDTe1w8KZB0JRYb1YPcMDraTnGTAS7krXjHXSa2wnh+9Ld6RUzRmYI8Sy6Cps
         gVLFwo90365to5mfKiAQXXA4scpf0+ZHABvQYLhzLgdsdaqfu3GLiW5uq76wnPbC8eRH
         d3TKon7ev9iPU7GbWi02AvQyphutHRqeXXLWe1v5YJnGrTIGfuBITC9avmBCwxjl4d/S
         d0gQr/D5e76Ee4jwYEGenkXmubKP4Q7IkPKX7cw+KgA8RZC4W5yIdbYaIbjEqYsGvv06
         CobXzCOmvLu5rbpK7XHK6LPlXxOhumAQb9/84dnuSLOxT0ozkDnoHDnXnGwa+KdWQ/jv
         K4Gw==
X-Gm-Message-State: AOJu0Yz0EzDzOU1e+TbdBF1ZEUkOfo8f2Era3rnsxwKD27CeaMyiVw5y
	UHodj8kCC4BPaacPj1RvpY7fep0EsOKn4bEAqu2HX8aXCrU8cBYK2a1ORiCDRQp+0cE/WGcr3Rq
	ci2E=
X-Gm-Gg: Acq92OGgA2dI4NY7ZASDn4LwfoYcKFrzLJlxLJ8mxJOIgDrwd5WuJhs41QZzH2n0fwl
	we/9N9MKA9ZwrSEIX4HC9/L7SgDFtDUThKKfdp2C1i5jpv8tOrjRLO4NOAyrM4MNbcVWyq4gepW
	WqAERdw2B6fDKPRc/S/AYBEcHKDReWrP7xiPgAFfPwla8b1ugsw7L4M5jkJIIKPv+9zP3Gj61t4
	8bNTKwaQEjRw2w4e/FM+IpqwbosK4ZXCOIrPjPPFMHtQx4urrNJ8qwF+PQCxCstQ3aCw/5y2mRj
	w4PaRWpoO9HhSvvGxxd+Z9/GjURncb4O3CDxyM//1pgeHzWDBvaxmGpsxVZlwCDM/XdNqXVuZen
	AXvFvT5YmL1PusVRnHxtiYc8O92wXOK/mKDEyMN2EbBBSTQlw7VUqDyPxvcttBS5RerWo7uSltE
	w+wCHCYkTqEFzeTezFeo9QwU9fgxli51J6AwE5oVr1jpMUITmPO4EWeZ7Qi1BDODoMBbdKuONqo
	AvjZpnQDTfRjkQ=
X-Received: by 2002:a05:6000:2508:b0:454:9655:43af with SMTP id ffacd0b85a97d-45e5c30d598mr21734439f8f.0.1779097863871;
        Mon, 18 May 2026 02:51:03 -0700 (PDT)
Message-ID: <ad17d551-139b-4edb-b820-6ab12a4d70fe@suse.com>
Date: Mon, 18 May 2026 11:51:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86/MCE: adjust ID2COOKIE() for Misra C:2012 rule 11.2
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1779097864-8A788A53-08BD1323/0/0
X-purgate-type: clean
X-purgate-size: 636
X-Rspamd-Queue-Id: 4A24456A144
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:nicola.vetrini@bugseng.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

... ("Conversions shall not be performed between a pointer to an
incomplete type and any other type"): Add an intermediate cast to
unsigned long.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Add comment.

--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -1264,7 +1264,8 @@ static void cf_check __maybe_unused x86_
 
 #if BITS_PER_LONG == 64
 
-#define ID2COOKIE(id) ((mctelem_cookie_t)(id))
+/* Two layers of casting to cover Misra C:2012 rule 11.2. */
+#define ID2COOKIE(id) ((mctelem_cookie_t)(void *)(id))
 #define COOKIE2ID(c) ((uint64_t)(c))
 
 #elif defined(BITS_PER_LONG)

