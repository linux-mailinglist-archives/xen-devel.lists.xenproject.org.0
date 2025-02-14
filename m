Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF938A358CE
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 09:25:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888582.1297933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tir0i-0007Er-J3; Fri, 14 Feb 2025 08:25:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888582.1297933; Fri, 14 Feb 2025 08:25:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tir0i-0007DO-FD; Fri, 14 Feb 2025 08:25:20 +0000
Received: by outflank-mailman (input) for mailman id 888582;
 Fri, 14 Feb 2025 08:25:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PTsb=VF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tir0g-0007DI-Gx
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 08:25:18 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38c3340a-eaad-11ef-9aa4-95dc52dad729;
 Fri, 14 Feb 2025 09:25:17 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5dee1626093so660736a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Feb 2025 00:25:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba53376bb3sm296265066b.109.2025.02.14.00.25.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2025 00:25:16 -0800 (PST)
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
X-Inumbo-ID: 38c3340a-eaad-11ef-9aa4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739521517; x=1740126317; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tqYHdNSd3JeW4/IKN7jIUEEHzJ7YsPeAZLt5VhjWWvo=;
        b=ajklcmwQWKiK9ulcg18ZLvmY1aH3Vc7em8h54EdiXsguXnmwKWUp1UyjRpcl86XY+C
         IAZqtIAkaABRvpAPVRUkDIMynku+f6IHx83rMsLiehvNUWH/m3appvingFbrsy1M/R8L
         S5uxEpZNC/d2QbDwVVU+//X9HR7I28wZSe9Znh8v30GONetU7O1E6TuzOVyLe5spnnAf
         X2v0ofARNLjojnjRzOo6EA9QS20gHAjNFPtlB76R0XuEtS7HkH4BYw4To28bWn40MXuE
         k9TkK3F4xjOh2RtKzTEOq/2CRV3DgBd6B2JeqesY7tiRpKVnZBCJCCdMMprDHwhip1t9
         zZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739521517; x=1740126317;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tqYHdNSd3JeW4/IKN7jIUEEHzJ7YsPeAZLt5VhjWWvo=;
        b=XH0K3V56rC3QCTWU5DjgZRvUWxf1AxtZalrjsZfaA2I6K8dld9GC9o1BTj+pfUrRsR
         ivqn9T1T54mDNiP0EjNNk0FlhS3NBTvFZ3cfL1Q33SDGA+MORH1QBpfBNVnW8fhMNlgx
         Ft1i/ombQVFUVZLv2xIACidSh+9zNAKtesYcl+HY3yIMUz6BqPrB37vepTD41ENOCouJ
         ypqAm7X88QSVveeNT5wPxBiMvviavFKSGllagfTx/nQlVImUJzZ16E/YcBZ8vNCkJoDE
         /3vTtuLn4ym1jurimsCnswW8FXJtfoAcA3lGv/u5eAnx3CqT5q/yjPQJfAH84RLGhQNX
         /PpA==
X-Forwarded-Encrypted: i=1; AJvYcCWCpt55aiX7jqPVVX9nWtpE8NvzqtWhbsWDhs8+pe/DBbk+8+UTI0C9GIQlg0jwb/UlH+bmFrLHfsU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzSMMxVa0uJ453Tan9+kUa8SCpvV6eSsN7eheGJqsk5Ufo3EEeL
	WXHGXiIxNttICkeGeYpRuld4r8di9fP+3dZZNqvnl1MC770PktfmNsxBncE2oVyx3yzpmLXn9sM
	=
X-Gm-Gg: ASbGncvU+JYtnLTURStV5EgDQtIoawfXyQvHJY8OF/R5/J4pCw6ANG4acmDAZE3wAE5
	fc/kX4WT7PsGNmkVTOALQ/SqKMPk4jM8m09iIQT+shHcd3jgfVhFNPU6YoDuaz7RsZ5rWkY8xE2
	XqgQMJ2/tEAH0fGCAthwaND8N8LcYarHEKueGOzMnbtLnH8OsSoHAyPAf3dcnbLcaN9SK7AuO16
	SmDAmfRJigir23IWGtwzxuh3FdmYjVWHCAZD6E1FCULrQemdWz8KKdoWh3aJOdqz3lOJ7DY74xx
	3z8eKk96dfmaB1kE+w3aNm9ijOdWKfKsdHKpHxpWrNIJGKFS+dra6YI1hDcEl8LbuzT2+1jTFEE
	1
X-Google-Smtp-Source: AGHT+IFy00h1T3pirc+LRC2mLrfiB5boMmwvuzam2BD+bct7HyJXw9nYP3rfFe/+wr0W3ShCB/QmuQ==
X-Received: by 2002:a17:907:1c92:b0:ab6:e04e:b29 with SMTP id a640c23a62f3a-aba50f81006mr594021066b.3.1739521517010;
        Fri, 14 Feb 2025 00:25:17 -0800 (PST)
Message-ID: <7cbc513b-b98c-494d-9623-ba31a7a14360@suse.com>
Date: Fri, 14 Feb 2025 09:25:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: fix build with CONFIG_HVM=n and -Og
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <20250213185055.711703-1-stewart.hildebrand@amd.com>
 <f5deca6a-313f-4daf-b774-cc05223ab034@citrix.com>
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
In-Reply-To: <f5deca6a-313f-4daf-b774-cc05223ab034@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.02.2025 02:05, Andrew Cooper wrote:
> On 13/02/2025 6:50 pm, Stewart Hildebrand wrote:
>> When building with CONFIG_HVM=n and -Og, we encounter:
>>
>> prelink.o: in function `pit_set_gate':
>> xen/xen/arch/x86/emul-i8254.c:195: undefined reference to `destroy_periodic_time'
>>
>> Add an IS_ENABLED(CONFIG_HVM) check to assist with dead code
>> elimination.
>>
>> Fixes: 14f42af3f52d ("x86/vPIT: account for "counter stopped" time")

While I don't mind this as a tag, you could equally blame the commit
having added support for EXTRA_CFLAGS_XEN_CORE, for not documenting
restrictions. As Andrew says further down, it's deemed known that -Og
doesn't work reliably. And who knows what other very special options
would cause havoc. I'm inclined to go as far as saying that quite
likely no Fixes: tag is appropriate here at all, as long as we have no
way to use -Og without making use of EXTRA_CFLAGS_XEN_CORE (or hacking
it in another way). People using EXTRA_CFLAGS_XEN_CORE are on their
own anyway, because the documenting of restrictions mentioned above
would be nice in theory, but is entirely impractical imo: We'd need to
exhaustively test all options, and then document which ones we've
found working (under what conditions).

>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> While I appreciate the effort to get -Og working (I tried and gave up
> due to frustration), this is gnarly.
> 
> PIT emulation is used by both PV and HVM guests.  All other uses of
> {create,destroy}_periodic_time() are behind something that explicitly
> short-circuits in !HVM cases (usually an is_hvm_*() predicate).
> 
> The PV path would normally passes 2 for the channel, which would
> normally get const-propagated and trigger DCE here.
> 
> One option might be to make pit_set_gate() be __always_inline.  It only
> has a single caller, and it's only because of -Og that it doesn't get
> inlined.  Then again, this is arguably more subtle than the fix
> presented here.

Making it always_inline on the basis that there's just a single caller
would be equivalent to simply dropping the handling of channel 0 when
the sole caller passes channel 2. I don't like either. Instead ...

> A preferable fix (but one that really won't get into 4.20 at this point)
> would be to genuinely compile pit->pt0 out in !HVM builds.  That would
> save structure space, but would also force the use of full #ifdef-ary
> across this file.

... I was about to also suggest this approach.

Jan

