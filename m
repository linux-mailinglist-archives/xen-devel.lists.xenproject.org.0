Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIccC9HqpmnjZgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 15:06:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BBB1F10A4
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 15:06:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244796.1544166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxQNg-00074j-Um; Tue, 03 Mar 2026 14:05:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244796.1544166; Tue, 03 Mar 2026 14:05:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxQNg-00071c-RV; Tue, 03 Mar 2026 14:05:48 +0000
Received: by outflank-mailman (input) for mailman id 1244796;
 Tue, 03 Mar 2026 14:05:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKVY=BD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vxQNf-00071S-M1
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2026 14:05:47 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 128020ed-170a-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Mar 2026 15:05:45 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso61561095e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Mar 2026 06:05:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485133426aesm25494955e9.3.2026.03.03.06.05.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2026 06:05:44 -0800 (PST)
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
X-Inumbo-ID: 128020ed-170a-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772546745; x=1773151545; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8ihoPi48xkGuWHBXmjYqxnC0s+ZR+a0aSNzSbBs2yQQ=;
        b=a8VAZRkI+40KDXNSDUb3P6AXnefLn2OfQwV6qkyQvtl3ATm1CFDYCRmmkN6teDloHF
         KvDcMdV5iAvDI1h+Flk0rjbfCZrXOQzw9NUHMgSD3RHyidDqSkegBD4A4O/s94LXpdXF
         yXdRBc7OB3mPeWh2fybRGm0z55Ylv7+dINUgDAzuFKPLEE4HmcgsXnEpG8dQGik4h8mW
         x/hJlOcSrmuj87e0gu5hJzk+xe65ymMr3NabPqJFhfy+sGWtyAunsAjyG2/1HAjCsbqA
         q0E9Vdtu25yrqWNEIEr6ti29oxtzJLLkUbEyqjEt5uMbWAlaXty1+sXxqPyLExCEDMlY
         T7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772546745; x=1773151545;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ihoPi48xkGuWHBXmjYqxnC0s+ZR+a0aSNzSbBs2yQQ=;
        b=QbF4fgp8DSdvJFkZjP248NFsGGDMcp07rGKmusqvPw6URAHTzduBaACufM89zvazUf
         uXdbEKUKTjBYmMW3fnsYFcG792KkFwhr6soF9QNqg4gc+QimvTBl5AqIAosD/6t91qSa
         3C3ocSTdQIVT45PB+MzZfLHaj8XYy2847saCWEoBpXlxFEmYvVPolH/UhiiWL25eBlal
         oh/PoVi6GIuA5gjxa5ZxyWFVtc9GOm/YzL0Hamo8/rz7h7+sHwNlTxQ9yzoep0XtVf9Z
         sH9JoOcDttBISGnxwUZPAtznqNHP7vNCE7IaisyJT1KdnFmW8aZteQ0aQelxzSrupLSh
         z3Ng==
X-Forwarded-Encrypted: i=1; AJvYcCWYty/LgHDabdipRI+NGykxWscROd4AX0M3ZOylmLufFqJckOMIE3k2zTsCcXZ9tcr7fv8lTvjuY0s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwfJnnQTd9TOJS8T/CQcF/wk8Ng1cvCWkgZmQ9oKDX7Iz5ZY8ZQ
	l+NS7c+geT4qVeYuIK4B9b/O8U6HnLLMex6KuS1CjUadido3Gh9mYv6ex8oYg5aMEg==
X-Gm-Gg: ATEYQzwLBgETlN/wuXZYLfFIG+DtXYaYJKTpInox3Fm6eA7naIl6w5imbCEoXkNHG58
	3ekiGx0LlXT3NjUWuglIWVAp2HuFt7NaOuYptIio8a8YJADIa+mTEKvV0pIqKJMyOxoqeKqZ06J
	DEU9qYNUo/YvNbdrI5R4PiZAc54EM0q+PQwIpas192daOKTF8Yz+wVKDVS6NC7RPXzWUNgnDaFh
	88Uown8ifwE4MhKUNlUr5O7QwgxlUyGsPEvlxX5/uyeEHYHokx/OSvg1XMTTsHBgU4TQd4nxwxh
	mTNDIubMrkIiEneDmyeWP2MU5aMvWBu9v6SRuhsHjW9S1fBsJcxSvV+r49Tqy3jokLB9ZZ1HyBC
	f+kVeeR+1tr9jgxhThaCPcN/pMAWbjSWVzKUD2J/T5FiltuseLVCb77aNC/lovBERQE0vO7J/6h
	rJDbVCWhH1q8/QWRzvw48MQuJHnPRL1dsQw6U0GqAKe1+LJKhQbhhKejaHWMSunTuc8PrCOVino
	5Sw/MBmGfpMISA=
X-Received: by 2002:a05:600c:4f95:b0:483:29f4:26b3 with SMTP id 5b1f17b1804b1-48513a5620amr38725815e9.1.1772546744457;
        Tue, 03 Mar 2026 06:05:44 -0800 (PST)
Message-ID: <5116fc4c-c002-44c0-bda8-5af60a075868@suse.com>
Date: Tue, 3 Mar 2026 15:05:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] tools/tests/x86_emulator: fix build on clang-21
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1772189234.git.edwin.torok@citrix.com>
 <e8bd2b2ac25bf3aa25e06a33c01511d040cc8bca.1772189234.git.edwin.torok@citrix.com>
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
In-Reply-To: <e8bd2b2ac25bf3aa25e06a33c01511d040cc8bca.1772189234.git.edwin.torok@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 92BBB1F10A4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:edwin.torok@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 27.02.2026 11:58, Edwin Török wrote:
> clang-21's built-in assembler is enabled by default, but it doesn't
> support some mnemonics:
> ```
> test_x86_emulator.c:2636:36: error: invalid instruction mnemonic 'fsaves'
>  2636 |                        "fidivs %1\n\t"
> test_x86_emulator.c:2640:24: error: invalid instruction mnemonic 'frstors'
>  2640 |         asm volatile ( "frstors %0" :: "m" (res[25]) : "memory" );
>       |                        ^
> test_x86_emulator.c:4251:24: error: invalid instruction mnemonic 'vpcmpestriq'
>  4251 |                        put_insn(vpcmpestri,
>       |                        ^
> ```

Btw, for this last one to work with gcc older than 7.x what I have in a
local "helper" patch is

# if __GNUC__ < 7//temp
                       put_insn(vpcmpestri,
                                ".byte 0xC4, 0xE3, 0xF9, 0x61, 0x16, 0x7A")
# else
                       put_insn(vpcmpestri,
                                "vpcmpestriq $0b01111010, (%1), %%xmm2")
# endif

> Use the external assembler with Clang for consistency with GCC.
> 
> Signed-off-by: Edwin Török <edwin.torok@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> --- a/tools/tests/x86_emulator/Makefile
> +++ b/tools/tests/x86_emulator/Makefile
> @@ -297,6 +297,11 @@ x86_emulate:
>  
>  HOSTCFLAGS-x86_64 := -fno-PIE
>  $(call cc-option-add,HOSTCFLAGS-x86_64,HOSTCC,-no-pie)
> +
> +# clang's integrated as does not support some mnemonics:
> +#  https://github.com/llvm/llvm-project/issues/183635

I see they already confirmed at least the {,v}pcmpestri issue.

Jan

