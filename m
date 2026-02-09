Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6EX0FG+yiWndAgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 11:09:51 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0551A10DFF2
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 11:09:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225121.1531591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpOD6-0005qc-27; Mon, 09 Feb 2026 10:09:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225121.1531591; Mon, 09 Feb 2026 10:09:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpOD5-0005ny-VS; Mon, 09 Feb 2026 10:09:39 +0000
Received: by outflank-mailman (input) for mailman id 1225121;
 Mon, 09 Feb 2026 10:09:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBDp=AN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpOD4-0005nM-Ji
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 10:09:38 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7089330b-059f-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 11:09:37 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-48068127f00so39147295e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 02:09:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483209c1a64sm88195135e9.12.2026.02.09.02.09.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Feb 2026 02:09:36 -0800 (PST)
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
X-Inumbo-ID: 7089330b-059f-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770631777; x=1771236577; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EibnnF/NRdJa+aXezoTgnR3v2Eikbj51oP8GQxmVnpU=;
        b=IHohuq9lYujN/gHRG1c/0nwGeA4Y/UxJCebKu78EeN+daigbgdcr6i+aPP88yTaXIa
         ZC8SsYjWxVDRz97FOSjiOQY4/Y//D0vEtPtvWnp5LAQfPTGTCDM+V/k0QyNtcqPndiUz
         3VQUj4Fyw9qxxHQIrWeHDsQ7iL679mBdqkI8JSlbQcZMp5DWMjwNexUO4ZBseVCSFsT4
         1TnELSJ0SFzmTUky/7bCcETrq17Wmk1J/fDs2YLEuDtCstfY7c7m147cq8B13pkqXX83
         bOdNSzJF2snk7zENs9foaApJWnTvGdY7j50LdP6OXVpo50BqqffUfk3Hvu18djv8ifLr
         jJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770631777; x=1771236577;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EibnnF/NRdJa+aXezoTgnR3v2Eikbj51oP8GQxmVnpU=;
        b=OWbPc0sLL+DDIunKLhjTC0uQXp0/k4vsDX+WKkm8PPAc7J5Tg+W4ynfa6Q/VAKDakp
         FewJklrd8yEjzNmqxLRuUOHZ+vkncS1IoQFXsXd+BeoH8ZaZW3wJSTG1b5YvSzuFd80A
         /iM4l0WHeid4gkiIK4/FCxuzwWK0KtlSo8oXeyP2QO/FlMujazjT6vRzJPrUXFRxkKUt
         1WANYGEYWM6wLXxdl9YIC4v1qr//34kxGughd9rNup633yFSTPWLlm5Zpb+zUISa9qsH
         6C2EXUkSPxc1ysZYyTkZRfbjj7vefg3ukOUyxWDGI8Ry9xyQfRSfyGJc2QKGQ2vuuJc9
         UVGA==
X-Forwarded-Encrypted: i=1; AJvYcCVgKZCkiQpyAGwrm5hykfD8HXzeoWxdoK+10PsV9UJUfCXuXavNGwqob9vHaQIp66YJZrr+qrOUxZ0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyv8Tt9zCMtKzas4aP2Iu6na2OcCYFisVESQyyHsov62IAS7EEC
	FGtbYkDhSgOOjuWNsNHJ6No/iGVuWsyIbh8edEoiECBaujrNgS6ZBtTbFawhGmU81w==
X-Gm-Gg: AZuq6aJ54teb7aKuiPVZJuF//kdgke1n6a5S9KG7KlTHHK1x+gn+q2/DtPK3wTs8XVw
	Lx4KI1psGJQcRUBLSyXV7FrmUwTafbl400p9+oksXbz9DozwX07kiJnBDodp9byRO3E9TtdyzX5
	eZQIEf2GFLvR5X4U3E6Aj9ut2BQruxryNjqbKVrjM7BWzSBwxPwzWVpxMdG9tD4KkIaAE/rKKXf
	RA1f78JUdJAgtnUsXhTnPkahmjpDqDCTeXqvBFyJnDQ9B0Tw0rOUOXQivui7/3tOuSpKa5RuCUi
	bQATMG7HL55je7GpQ47X1YMFfTk2wLhYrS6rZYocY8mZuJPP7v2dWCraBqzXNpcc7IARk3inGI8
	cYRTvaPBMQ3jnP/nJuzQa65zV8P2ahLsGRBjT+bb4n1PpSw4MMcTEjGttsqicZPr/I195+6Bhx2
	/QgmKc3SM4H94kCEhzf+wwlbJEZKknfL5CqWtFSBIN4d5bo05Iqm0D826bzwzOlgDDXWexGGNZd
	TaLoGsPpBiAuA==
X-Received: by 2002:a05:600c:c4a7:b0:480:f27c:6335 with SMTP id 5b1f17b1804b1-48320236645mr152633405e9.25.1770631776517;
        Mon, 09 Feb 2026 02:09:36 -0800 (PST)
Message-ID: <210d133e-fa60-4116-b65f-039e46e31738@suse.com>
Date: Mon, 9 Feb 2026 11:09:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/memtype: Deduplicate rendering of X86_MT_*
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260206131305.2675905-1-andrew.cooper3@citrix.com>
 <20260206131305.2675905-3-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <20260206131305.2675905-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid,citrix.com:email];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.986];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0551A10DFF2
X-Rspamd-Action: no action

On 06.02.2026 14:13, Andrew Cooper wrote:
> The MTRR infrastructure has two different copies of mtrr_attrib_to_str(), one
> in .init and one in regular .text.  EPT has another variation.
> 
> All 3 are incomplete; they encode only the non-reserved values for the task,
> but hiding reserved values with ?'s is detrimental to the diagnostic purpose
> of these existing in the first place.
> 
> Implement a single function which covers all the architectural values.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> Yes I know EPT tries to render the reserved reserved encodings numerically.
> It's a cute trick, but does get foiled by the '[MTRR_NUM_TYPES] = "??";' row
> which breaks things.

Does it? 7 isn't UC- there, but is instead reserved, which we leverage to get
EPT-misconfig exits. 7 also isn't UC- when used in MTRRs; that's a PAT-only
type. I think we better wouldn't mix those. Therefore I'm also not really
happy with x86_mt_name() as a name - it should be clear from the name whether
this is about MTRR (and EPT memory type) or PAT.

> Putting this in traps.c isn't great, but there isn't an obviously better place
> either.

Any reason not to put them in one of the two mtrr/*.c files? Are we entertaining
the idea of allowing to compile out mtrr/?

> @@ -214,7 +201,7 @@ static void __init print_mtrr_state(const char *level)
>  			       level, i,
>  			       width, mtrr_state.var_ranges[i].base >> 12,
>  			       width, mtrr_state.var_ranges[i].mask >> 12,
> -			       mtrr_attrib_to_str(mtrr_state.var_ranges[i].base &
> +			       x86_mt_name(mtrr_state.var_ranges[i].base &
>  			                          MTRR_PHYSBASE_TYPE_MASK));

Nit: Indentation of this line then wants changing, too.

Jan

