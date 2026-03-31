Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PGUCNVwy2miHwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 08:59:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 680B7364AEF
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 08:59:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268510.1557771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7T43-0004Kk-Fk; Tue, 31 Mar 2026 06:59:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268510.1557771; Tue, 31 Mar 2026 06:59:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7T43-0004IO-Ca; Tue, 31 Mar 2026 06:59:03 +0000
Received: by outflank-mailman (input) for mailman id 1268510;
 Tue, 31 Mar 2026 06:59:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7T42-0004II-78
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 06:59:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7T41-000L6o-JH
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 08:59:01 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69cb70b3-5cb7-0a2a0a5109dd-0a2a450cca9a-14
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 08:59:01 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69cb70b5-f93d-0a2a450c0019-d155dd2cbd52-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 08:59:01 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-43cfd96354aso1125958f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 23:59:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43cf330872asm22694478f8f.17.2026.03.30.23.59.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2026 23:59:00 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774940341; x=1775545141; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1m6OErIgZMDvs1dLDcZt4fykCHfqlFKrzYYlAlue5hw=;
        b=WuQB/VVoa81zAfwRIaGve+Nlo6UJeavMIykIPaMX9ccyTGKpj6QwrJ5s6jgNBK13Ln
         t1JUc51wqpUJqD4fsZIC33ssXiCwDH8/fNMEZqWVQj8HMi2N3Ziznlsq72FaKLNQM2qY
         I9eDnrmD2tSLo2EAYsx0vaG61ReByLaEWXViMd6ccTLoOVS8HuGbcZQ0/0gGvfoQy9RN
         /T/V/J78oiIgB8dVtzjrO6hkYwUjbymoO5Hz1i+uTTAKJkSEEo5Usyl0CgqThzb5Rza8
         sxkEOthGzP1mzr5TnbkVrgwSi+tCCISjHztRovsHuWN1jQcSyIA8wz2AToTCsqhSgtSK
         m8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774940341; x=1775545141;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1m6OErIgZMDvs1dLDcZt4fykCHfqlFKrzYYlAlue5hw=;
        b=lDz+VvSRfhm+vMqUvt46uOvyCv8I2AD0n1juFcB4CbfH/s3SnqI3cm0TG1a7X1fx4y
         xdoC14F4Ls4iZrJUsQoYjg2K6/DxpNENxr3J8lFLH7K5Ycj6/949OjdyURRteCS7I/Zn
         H1og6f5FABs6nP3NBg21MI8XxvOuqEYK7x0fnQjWEVD0nLT0W1quE9BdUFtWiRMATT56
         YktPPKP731pf0+FAIbL81YrzKWFfGvJxXCc4ispbo1dVOFOCUPm9st4usx/+miWPmtfX
         TRyey4Xg6f4PKWm3OR8pu+17kmvWoteZDcuS1AoATGQkuGjaOecMiKTrOyLT+eY42C4l
         gJRw==
X-Forwarded-Encrypted: i=1; AJvYcCUbtM/VoAecuZjGMmf2z7pEAJ1/Oa+n8x1r33+VOw0KTvklf1vxMfpyB9MZ5L3+71LSItfxD+l9sz0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQwLYYSHLf+xwABSTBhTrGTJmyHuuTWNarVkGU9YBkVGNEXmwA
	BiuFDi7gHX703EnQf8GUpO7jVY6Bt4uADg+oymbKziA+EXyGu2xK+z72sDYvv0HYZOtga5nzYM5
	JFiQOKw==
X-Gm-Gg: ATEYQzy2OyFK2B3s4uhfy543EP0NV06Uud7yioQoXcfRyShYC85+Kdc7DL7jwy6VzI7
	9/DU1IyU77cVx2KvmREE0YpKUPlmDScwefL6YRxAtnguBCxD8Jg+4ehvl/GgwDtHJSztxqLOEy3
	o7evsDnLDSs4mZimCAZFdRoZFfMFwVyKcRDU9dGoIICKtf1rw9MZLz8aGSGxf9TsMbStnGiBspF
	sudXT9q0NaGEAWRsfMelmSfPqQclYxpQAAgXN87hG7U8Xl2xTd9oa9zzMU4nE09wbZGlbLOoYg7
	7rfmXNLeUjt8WsJk75Tb/QJzpclkw6GZZ8uI4RXJVLUuTq6uHaiHxKuh51xAyxtIvEohD6zTUOZ
	2XJ8ZRD+H2/2Z0vc5JHebZrDiYPhvabcmEQ//ZlPXgHegghTzTrXPe7tb5XFgAAt4MmODw6W1Gh
	IdiRXNmtOBigWbv0oLAQD5yvWD8YuyDX4rKppIKOy6wVS3YQ1PhTNi4owmFXqXXpM2fIjqmn7c+
	SHXtH1j8kiA3Fw=
X-Received: by 2002:a5d:5d05:0:b0:43c:f90b:5661 with SMTP id ffacd0b85a97d-43cf90b5722mr15373162f8f.50.1774940340900;
        Mon, 30 Mar 2026 23:59:00 -0700 (PDT)
Message-ID: <a49f9840-7b8b-46a1-b171-ad0e81da7455@suse.com>
Date: Tue, 31 Mar 2026 08:58:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/5] CI: drop Ubuntu 16.04
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@citrix.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1774886602.git.edwin.torok@citrix.com>
 <587eb0701db6e5852e9628d0cb9db90250424c4a.1774886602.git.edwin.torok@citrix.com>
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
In-Reply-To: <587eb0701db6e5852e9628d0cb9db90250424c4a.1774886602.git.edwin.torok@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1774940341-6D0B8734-788A442F/0/0
X-purgate-type: clean
X-purgate-size: 2516
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:edwin.torok@citrix.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 680B7364AEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 30.03.2026 18:17, Edwin Török wrote:
> Ubuntu 16.04 is EoL on 2026-04-02.

It going EOL very soon is a good reason; it causing ...

> It fails to build the emulator tests, probably due to a binutils that is too old:
> 
> ```
> gcc -m32 -march=i686 -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes -Wno-unused-but-set-variable -Wno-unused-local-typedefs -Werror -O2 -fomit-frame-pointer -D__XEN_INTERFACE_VERSION__=__XEN_LATEST_INTERFACE_VERSION__ -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -mno-tls-direct-seg-refs -fno-pie -fno-exceptions -fno-asynchronous-unwind-tables -ffreestanding -nostdinc -I/builds/xen-project/people/edwintorok/xen/tools/tests/x86_emulator/../../../tools/firmware/include -fno-stack-protector -g0 -D_16 -mpclmul -mssse3 -mpclmul -ffixed-xmm0 -Os -DVEC_SIZE=16 -c ssse3-pclmul.c
> /tmp/cchhD6n5.s: Assembler messages:
> /tmp/cchhD6n5.s:202: Error: junk at end of line, first unrecognized character is `{'
> /tmp/cchhD6n5.s:203: Error: junk at end of line, first unrecognized character is `{'
> /tmp/cchhD6n5.s:205: Error: junk at end of line, first unrecognized character is `{'
> ```

... build issues in the test blobs isn't. The harness is specifically able to
cope with blob build failures. Another thing would be if test_x86_emulator.c
failed to build (but see below).

Is the above representative output anyway (i.e. is this not perhaps interleaved
output from a parallel build)? ssse3-pclmul.c, built with -mssse3 -mpclmul (i.e.
no AVX512 options), shouldn't really involve `{'. Furthermore we specifically
have a check in the Makefile, skipping building altogether when gcc and/or gas
are too old.

> Same test passes on Ubuntu 18.04.

Hard to believe that there wouldn't be at least some failures. Perhaps said
check prevents the attempt to build the harness there?

> Note: the minimum version of binutils might have to be updated.
> Ubuntu 16.04 had version 2.26.1, which satisfies the >= 2.25 requirement
> in the README, and yet it failed as shown above.

The harness is special, as said. Imo we shouldn't be updating the requirements
just for it. If anything, the mentioned gcc/gas check may need updating. {evex},
for example, requires gas 2.29 (i.e. gcc6 time frame). As does VPCMPESTRIQ. I
specifically have a local patch to make it possible to build the harness with
pre-gcc7 (I don't have any gcc6 anywhere, to that boundary may be off by 1). I
didn't think this hackery would be acceptable upstream.

Jan

