Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wK8zETh7rmnoFAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 08:48:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8682234FEB
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 08:48:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249136.1546640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzVKh-00088m-T1; Mon, 09 Mar 2026 07:47:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249136.1546640; Mon, 09 Mar 2026 07:47:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzVKh-00086l-PC; Mon, 09 Mar 2026 07:47:19 +0000
Received: by outflank-mailman (input) for mailman id 1249136;
 Mon, 09 Mar 2026 07:47:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TKtW=BJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vzVKg-00086D-4q
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 07:47:18 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3085d8e2-1b8c-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Mar 2026 08:47:15 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-483487335c2so93925775e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Mar 2026 00:47:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fae00absm319480845e9.4.2026.03.09.00.47.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Mar 2026 00:47:13 -0700 (PDT)
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
X-Inumbo-ID: 3085d8e2-1b8c-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773042434; x=1773647234; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qsabEXkhux99yzwsSjH5RxSJbqhPM5KtfGWU+0nIdFw=;
        b=V8R0Gc+fRw/R2eny8xsDRWTjHyX4T1/3+zjeeFbjPPO37kixGgOAD+69YlLoqJlnzZ
         Bxjqupd89cIlkpw+ekTL8cDZx62Ifv03sknR1kvCJlPDRbUZc97ccYlt/40MmwUem/Qk
         NkWPBIgOx1k+SAkTtmZ/frBxcI5ww89anf72VjEt35r3HseKBVd5FCAjwl5faFVn0occ
         n8R1rYDcAqfd8DJ6LW5iH5J/Ye/NhD0Ef0tjKO3HwLA6c8b4W8a8rAP1WEsJz7mCNigO
         I0zFwc1QkcpYKW6B778ok8hnGawaqklGsvhSvOcBgjOxbQpHVGAW5ddVmqxRiHZcGVRo
         JPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773042434; x=1773647234;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qsabEXkhux99yzwsSjH5RxSJbqhPM5KtfGWU+0nIdFw=;
        b=ef3kCtLcxnNsQwSiU6+UxQ2JTKBxL3jQyGCQCHD3b2ZUwfc2Imcd7iYV58HSfAinIm
         +KdrASbc3IP+7oYtVoVEPwiXJ54RPwJC7mbIrBBzo1xs9WehOwKZaWL0rjbv84NVBMyQ
         VpHHlk87JWmnhexc3wiiRL8uZYy65NaFwGAoOHIg/L+HDUvYLb2/2pRhqgRy47L63W4n
         BLtD5lyJJ1WnY4/x/YkZEfEVN6uRmX2BT76jCP9xORdAAIU/iPTQlQg29lngHhj4S24L
         vIjZF5z2PIKhEenbJdX4/Lijo8Zo5D3iC+3Y2KwnQS92MqibU220DvuAdK+/KjsyCJ6N
         4Lbg==
X-Forwarded-Encrypted: i=1; AJvYcCXV9Kk7K4HEaMY7udSOwAXJisql9T3Uu4sqRLDNqylhsSjAXFoTyxGUSMXYcf1DDEO8KNIGVvOCNuI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzMGEgXRt106PFGYg1OrGV4KZBcKN3xgSdQXXNjk7CJcKz2JuKw
	SnGQaVy8YzI+golTM2JEfPyDuYNzbaZxWPFyIbLfZvo2CPRrEdNrpo9j15yyZ7CjAA==
X-Gm-Gg: ATEYQzwLs/70U1xN9dIB8QT/k1uTfILE3nbMepGhxI7SmGk5eu8anqQU6g4W8NUoXDn
	WT555RAO4K6N812I6oZuLZnIqUKZpacobtAsje6NR5fJc+DMNXyQw7BBaFgAShZO8oiLX+uOaPM
	OITZsK8wr7HFavHNgoLHXA8bLx7o1ztKhmKV/tA6yXN4iple4VO1vYMLEpo3gRadC4rAXFBM4BR
	7FPhDK0y2yx17J9Tr4RhVzkIhhItj6105Fq7boX8C4ohsMkj2xWq5AC4CkrdObaXCZNYdRuYeX9
	0yuN4A1tK73gzhWCypimkEtFYXvkcn3PKW3uSasEddzV/H7GF2A2mi5DHNnFdW4e2vbo/Lh8a/o
	LYVAIalXHP154Tl43KcGoOX4DdqdQYcvdB18tvZuvjlRMxJk++1SehqBExaJzZH4qD4m4ajQUxm
	xmH8icKvAwGag/vuLhijwW67Jdp8G5QTSqmPK8r6vf5rYtQ67OJLuSKvr9Tr69S/bnYXgAtXDH/
	Z4ttu0QY9y/xao=
X-Received: by 2002:a05:600c:8209:b0:485:3a93:3aa3 with SMTP id 5b1f17b1804b1-4853a933e17mr42287645e9.12.1773042434345;
        Mon, 09 Mar 2026 00:47:14 -0700 (PDT)
Message-ID: <49d22b35-f5d8-4992-a32a-bb3f7c3e5ad2@suse.com>
Date: Mon, 9 Mar 2026 08:47:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] tools/tests/x86_emulator: avoid duplicate symbol
 error with clang: use -O0
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1772813802.git.edwin.torok@citrix.com>
 <a4a29c95b06a0352889bb6c032c19be6e4cf8288.1772813802.git.edwin.torok@citrix.com>
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
In-Reply-To: <a4a29c95b06a0352889bb6c032c19be6e4cf8288.1772813802.git.edwin.torok@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A8682234FEB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xen.org:url];
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
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 06.03.2026 17:25, Edwin Török wrote:
> clang would duplicate the loop body and end up with a double definition
> of the symbol:
> ```
> /tmp/test_x86_emulator-0f3576.s:27823: Error: symbol `vmovsh_to_mem' is already defined
> /tmp/test_x86_emulator-0f3576.s:27825: Error: symbol `.Lvmovsh_to_mem_end' is already defined
> ```
> 
> Until a better solution is found: disable all optimizations in the test runner.
> 
> Using -Os might also work, but we can't rely on the size optimization
> always avoiding the duplication of asm blocks.
> This is test code, not performance critical code, and -O0 is more future
> proof.

Hmm, yes, the good thing is that this then doesn't even conflict with my
https://lists.xen.org/archives/html/xen-devel/2023-04/msg00283.html.

> --- a/tools/tests/x86_emulator/Makefile
> +++ b/tools/tests/x86_emulator/Makefile
> @@ -323,4 +323,9 @@ x86-emulate.o x86_emulate/%.o: HOSTCFLAGS += -D__XEN_TOOLS__
>  $(call cc-option-add,HOSTCFLAGS-toplevel,HOSTCC,-fno-toplevel-reorder)
>  test_x86_emulator.o: HOSTCFLAGS += $(HOSTCFLAGS-toplevel)
>  
> +# clang duplicates inline assembly when unrolling loops,
> +# which causes a duplicate label error.
> +# Until a better solution is found: disable all optimizations in the test runner.
> +test_x86_emulator.o: HOSTCFLAGS += -O0

I think the first sentence may want wording a little differently, and I
further think it absolutely needs to mention put_insn(). Maybe:

"When unrolling loops, compilers may duplicate inline assembly. put_insn()
 emits labels, which may not be emitted multiple times."

Happy to adjust while committing if you're okay with me doing so. There's
one other question though: Isn't -O0 the default? Where would any other
optimization setting come from in HOSTCFLAGS? Ah, I see ./Config.mk does
this, for an unclear to me reason. Perhaps that would want mentioning
here then as well.

Jan

