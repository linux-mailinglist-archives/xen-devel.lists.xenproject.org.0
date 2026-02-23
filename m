Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLtxEDR5nGlfIAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 16:58:44 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A54F3179347
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 16:58:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239157.1540595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuYJg-0006ER-Fz; Mon, 23 Feb 2026 15:57:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239157.1540595; Mon, 23 Feb 2026 15:57:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuYJg-0006CL-D1; Mon, 23 Feb 2026 15:57:48 +0000
Received: by outflank-mailman (input) for mailman id 1239157;
 Mon, 23 Feb 2026 15:57:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dhnJ=A3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vuYJf-0006CF-4f
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 15:57:47 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64152514-10d0-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Feb 2026 16:57:44 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso33230925e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Feb 2026 07:57:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a31bc068sm262920025e9.4.2026.02.23.07.57.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 07:57:43 -0800 (PST)
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
X-Inumbo-ID: 64152514-10d0-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771862264; x=1772467064; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ds/RoTQe03K5D71BFLV3I6HxMYBKXTEWzKepx1kqI+E=;
        b=Q9zO7Eretz2mVJl2K/LCf+bq18tmg2PsFofeVdwAK0B+ZgI9UrvfKIcqIN9FrYbCgI
         FM11juKLamQC/lymWo7keqyzDpJeNm5SeqjVbc7z3bRGGS1MNOHVR+Xy1KVCvD6ONizU
         geXZG/FnE7Ah6LcPRcXGMfM+30DgeNL5XK4xDZxSHpl44ea9P2sft5GEcHHbEYvOKKre
         IvCi0fgRtD1e73pD06RcawaOlc8izzLIcOILwG+jY7u0dAKiiTM+O2IX3SNmkIy9HGuP
         B6/EwvG6CpEcfqmJVXZfomPClFaY10/pUfqRUK7cKOsk2jgTcjn+ymHvyabZkVXcOQf8
         zHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771862264; x=1772467064;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ds/RoTQe03K5D71BFLV3I6HxMYBKXTEWzKepx1kqI+E=;
        b=ULy9586DTFuPzrZHPcsmqirPwfCraNnksBmaBqr39RD7R5o+m7JAaQypvslo/PCXfE
         dh7C1N6/YTeTT9oqi2NJEFFZo0xjqpIuNAn1zW8ebCwZSQkD2P8zUshHvefZtmzEhIHC
         tJoDeb1VL/UYNI8lzJVyOGbD8pyd9IIjaDSHElcgZ9VyDyup+UVWnFKRlXuWLF/e/vap
         IKwI3rdHoMBxGN7XJT4e+ORzBWgzZd4EiFGbKwiTrTrX93AjoeqxzVoONTX58YfOJqlt
         7gM4Vr+im+kIfm/afL3EHjhaMKvy+CXVGQeW6oLHzCRoW4GMbNfmk/qpOieo0iYtXT7n
         4WKA==
X-Forwarded-Encrypted: i=1; AJvYcCWc7bLqqJkpa2+S+iLWkHtLMTzzdJ3NU7Q4HQxDW5BdI9kaLSaOsM6C2gAZVA3D6Cx7lCG+BcKcWAA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxgK8ZBAsCseli2oQdK6D1TXKoXHcPtNDmeyacNgt4absfJVQJ4
	eirRRjNP0sh/3Hy6h6OEckqj05hg1+iqrJcEb1IIX6JFlRXJPhDLb71BMjNzG6yNBA==
X-Gm-Gg: AZuq6aKiuU9jWWyrZDiW210dByFoTYfSE0cOcDQK9MxA2pf4t4xmozVRt5x0eXiaFie
	x5sEd0jA6Vpu0a8iDv2rUejDWSKq258Bre3LiHIZV2XQWwsdgEuKQmEkoSSDWjFpBwdb+yu+415
	WJO2IefveLFREDEI+9NUZS3SBevQMulY4nVFuj0I7O0hTCHkvNIw8jVpvxbUGfKcl/c7PnavwLa
	Chz0F3sGwmtzbvxSsmjMcJjthERiTm9MKoR9ISFZZM71CcQU3xTUXLp0nPXtbzPVJLq0giCUU94
	rNc4pazPPUZQMnwRjc6b6ug7IsGRRZgwebk1Yg1TOnjK4+ERCzztsaCAXisw/u+ZUlPJHL/9yEF
	OohTN/Ru2839mERnrfOwWrg6k2XN1cRDMa6FbBLtb95HIXTTDZM+cV6pKhy92fUJtNRJ3LqOty+
	fimEIDcr10ZI7CwG0PeCxjH85EGRyBOAwm8BzN3wcT/cgoaU/GXZq6hfS1DwYJaXaSuiyRauDP/
	pEhAsVkVREq8aaJbiHWYnEdpw==
X-Received: by 2002:a05:600c:8b31:b0:483:2c98:435e with SMTP id 5b1f17b1804b1-483a95ee684mr152402285e9.34.1771862263853;
        Mon, 23 Feb 2026 07:57:43 -0800 (PST)
Message-ID: <4711b676-82f8-48ec-a7dd-5c33bc7cd967@suse.com>
Date: Mon, 23 Feb 2026 16:57:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] tools/tests/x86_emulator: avoid duplicating loop body
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1771840208.git.edwin.torok@citrix.com>
 <c0dc7da75ee36d10863a8b28fa2f19b3b4c8a316.1771840208.git.edwin.torok@citrix.com>
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
In-Reply-To: <c0dc7da75ee36d10863a8b28fa2f19b3b4c8a316.1771840208.git.edwin.torok@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,gnu.org:url];
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
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A54F3179347
X-Rspamd-Action: no action

On 23.02.2026 11:04, Edwin Török wrote:
> clang would duplicate the loop body and end up with a double definition
> of the symbol:
> ```
> /tmp/test_x86_emulator-0f3576.s:27823: Error: symbol `vmovsh_to_mem' is already defined
> /tmp/test_x86_emulator-0f3576.s:27825: Error: symbol `.Lvmovsh_to_mem_end' is already defined
> ```
> 
> This is a valid transformation, that even GCC might do, see
> https://gcc.gnu.org/onlinedocs/gcc/Extended-Asm.html#Volatile-1 which
> says that `%=` should be used instead. However the C code here also
> needs to know the name of the label, so I don't immediately see how to
> solve that.
> 
> For now mark the loop variable `volatile` to prevent the optimization as a
> workaround.
> (another way to fix this could be to move the loop body into a function,
> but a compiler might inline it, or specialize it, leading to the same problem)

Hmm, moving decl and asm() out of the loop wouldn't really work. One option
would be to extend the long-pending [1] to also cover test_x86_emulator.c.
Another might be to make the upper loop bound not a literal 2, but one
loaded from memory, suitably arranged for the compiler to not be able to
const-propagate the value.

But I wonder how many other transformations the compiler could do, causing
the same issue elsewhere. Maybe we need to overhaul how this instruction
instantiation works. (I further wonder how many such issues are lurking in
the many patches I have out for review, plus the yet further ones I didn't
post yet to not pointlessly increase the pile.)

> --- a/tools/tests/x86_emulator/test_x86_emulator.c
> +++ b/tools/tests/x86_emulator/test_x86_emulator.c
> @@ -5248,7 +5248,7 @@ int main(int argc, char **argv)
>          memset(res + 3, ~0, 8);
>          regs.eax = (unsigned long)res;
>          regs.ecx = ~0;
> -        for ( i = 0; i < 2; ++i )
> +        for (volatile int i = 0; i < 2; ++i )

Even if we went with this as a workaround, style should please not be screwed
up.

Also, whichever the workaround, I think a comment wants leaving.

And then I don't think it is a good idea to introduce a shadowing induction
variable.

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2023-04/msg00283.html

