Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Ig8Mt02i2neRgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 14:47:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD3911B624
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 14:47:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226415.1532938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpo43-0008Lp-Bm; Tue, 10 Feb 2026 13:46:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226415.1532938; Tue, 10 Feb 2026 13:46:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpo43-0008Jh-92; Tue, 10 Feb 2026 13:46:03 +0000
Received: by outflank-mailman (input) for mailman id 1226415;
 Tue, 10 Feb 2026 13:46:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Z/2=AO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpo42-0008Ja-I0
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 13:46:02 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d55640d3-0686-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Feb 2026 14:46:00 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47edd9024b1so52355515e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Feb 2026 05:46:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48320961701sm224348085e9.5.2026.02.10.05.45.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Feb 2026 05:45:59 -0800 (PST)
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
X-Inumbo-ID: d55640d3-0686-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770731159; x=1771335959; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cgHfPTC4z5bFFFA0fzSzUfKRnSub+sZaEkb14srSsMI=;
        b=AqiLePhhKVjj77JoetJgZd9qPfEyCWkBSYE3y2thef5RPGYn3uwIghj6b9x8L/qcKf
         UlEcJ3BeZnCfUMplOlFMtAu4hJGu/xXElV25uJutcC8/E8x/sGzAedV19UGKCp5ZWg57
         rpEVU9fTCX+cJKjy9mUgKIurKDsJznuzEX/rSYGHUJIBrd9Ky+l0KV2IRiBx3G4TJI4o
         gNmYgHSa9X/3+Cqb4E7h2ji3LGe0KzthZmzG9cUt3P9nj6DoWw/qQVLQID5nsRc7gwE4
         1H/7LJLj3v9d/abSXR56AG/N0WQGI6bes8vE3yKfOAXmhH03sFyXGNaCiyCafjVSadx7
         Y79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770731159; x=1771335959;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cgHfPTC4z5bFFFA0fzSzUfKRnSub+sZaEkb14srSsMI=;
        b=bumVUTxFoUspKujB9EAGFpa0x9ESvyJW+zZeyYaPFT+YQcngPqDZ9Tf06G+ctFqzrM
         +4ZZwW930jO6OVuIVs5BNiNOnFeeVoeI6FFMI8XVqmZddO5a1sQP8MK3jX8zqNOE9hI5
         3pgb+eAzkKKkts3OHapD5iSOBU3CWZV5yeJ6wyMGgrqlGfGtVlEajIQllC5DrwMdc7Hc
         VpoRwQ9+m/Z+wF6QeM3YV9ns1eLGjcru/8rzd2Cyxa2MWbhnHt4PvN9eK3TFm2VjDT9g
         zSb7pSIH7SWrD+F3w+EeA82zIzE83E+vkenLvdJfTRVjsTMMJExRHZu7Ntc/HLYM7Ktm
         UYNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPWHvnoG176jVmSrwixK0WhrnnErHYw5Vd++LHFumwO0hfLmD2wF86EurtYSdAAYMbQb0wTgRqxYo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzZEEfJx0P6R2OTns0oPdNScAirubOnHxS/MQeua/CdvOZAKAmC
	dwOjzKQAwnlMkFFJ59jd5UJGmfN3q/a4OsILncl8vMNGX0w0rfOdMMgx5CVn5+NAYQ==
X-Gm-Gg: AZuq6aJdvSDP9ahgAJDLYwNOiPC1UdOuCeQUvC+H/ENOT/X/kGpcZcnyuEOtVpKHchN
	TcgxJZ45ycj9jqOYdRbV4qTWRgbPpcWH7Ui/f9nZM05rCRq5n+UVgdmNCcKQ0mkHAtbmMJ6LRW/
	J7nJgpKCJokxfJ7Kgnk09L2GH540l6LCuAaObj5w2L2QDakSHRJwa9sRto9pGtFJmlWZ88f/Mm6
	25LKUH5Ev5JywYjabQV8wjA+Y3c8Q1SYrtqy9D0tP6zB6+OufMCxB0NWE6IhZ5sz7PaEvTRytdX
	udDcYJ0F1thq3bMPjWZeUNfMSTl+RoGf8bGKv5SMzw+I7dBQnSSVc+i42KPWPEbj77SBxHiloyn
	gTXjeN0Yli4a1YUsoCNl81zRwoiNzoPvf8d1ql/kkv++NOAbXahtakKfUZTeuk9u4wdjgtq3O8Z
	YH8NjwZ1wvKXeyJ5UXAKzlyHDTZC8z/IPQRHqrHJjgcsZHlqhmGjLliqQ2+a2wrzQr0cC/9TbHO
	fQrqmruLPlNRrQ=
X-Received: by 2002:a05:600c:4f8a:b0:477:63db:c718 with SMTP id 5b1f17b1804b1-483201eabf8mr247508225e9.16.1770731159462;
        Tue, 10 Feb 2026 05:45:59 -0800 (PST)
Message-ID: <4dbe4d2f-1f91-4c80-994e-86d42a9ad896@suse.com>
Date: Tue, 10 Feb 2026 14:45:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] xen: Add Darwin.mk
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <49c0bd388d45b6936bd852d99fbbc262fb078253.1770633598.git.bertrand.marquis@arm.com>
 <d1baa448-962c-4c2a-9a79-cf334b860450@suse.com> <aYsZb529xJvYSSRo@Mac.lan>
 <02BCBE82-C7F1-4631-AC9E-4A4B2E6065A3@arm.com>
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
In-Reply-To: <02BCBE82-C7F1-4631-AC9E-4A4B2E6065A3@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Bertrand.Marquis@arm.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 2AD3911B624
X-Rspamd-Action: no action

On 10.02.2026 13:56, Bertrand Marquis wrote:
> Hi Roger,
>=20
>> On 10 Feb 2026, at 12:41, Roger Pau Monn=C3=A9 <roger.pau@citrix.com> =
wrote:
>>
>> On Tue, Feb 10, 2026 at 11:46:44AM +0100, Jan Beulich wrote:
>>> On 09.02.2026 11:46, Bertrand Marquis wrote:
>>>> --- /dev/null
>>>> +++ b/config/Darwin.mk
>>>> @@ -0,0 +1,6 @@
>>>> +# Use GNU tool definitions as the tools we are using are either GNU=
 compatible
>>>> +# or we only use features which are supported on Mac OS.
>>>> +include $(XEN_ROOT)/config/StdGNU.mk
>>>> +
>>>> +# Cross compile on Mac OS, only hypervisor build has been tested, n=
o tools
>>>> +XEN_COMPILE_ARCH =3D unknow
>>>
>>> While editing in the ABI aspect, it occurred to me to check what Appl=
e has
>>> to say regarding their ABI. For both aarch64 and x86-64 they say they=
 use
>>> the standard ABI with some modifications. We may want to evaluate whe=
ther
>>> those modifications are actually compatible with what we need.
>>>
>>> Talking of x86-64: Has building on an x86 Mac been tested as well?
>>> Especially if that doesn't work, it may want mentioning.
>>
>> I no longer have access to an x86 Mac, those are about to disappear.
>>
>> FWIW, I build x86 on Mac using the Docker containers, just as the CI
>> does.  OSX Docker allows running x86 containers on arm64 using the
>> "Rosetta 2" binary translation layer.
>>
>> I've attempted doing a cross-build from an arm64 Mac using the x86-elf=

>> toolchain, but got the following error:

If it's really x86-elf (not x86-linux), then likely ...

>> % make XEN_TARGET_ARCH=3Dx86_64 CROSS_COMPILE=3Dx86_64-elf- HOSTCC=3Dg=
cc -C xen V=3D1
>> [...]
>> /Library/Developer/CommandLineTools/usr/bin/make -f ./Rules.mk obj=3Dc=
ommon need-builtin=3D1
>>  x86_64-elf-gcc -MMD -MP -MF common/.bitmap.o.d -m64 -DBUILD_ID -fno-s=
trict-aliasing -std=3Dgnu99 -Wall -Wstrict-prototypes -Wno-unused-but-set=
-variable -Wno-unused-local-typedefs   -O1 -fno-omit-frame-pointer -nostd=
inc -fno-builtin -fno-common -fzero-init-padding-bits=3Dall -Werror -Wred=
undant-decls -Wwrite-strings -Wno-pointer-arith -Wdeclaration-after-state=
ment -Wuninitialized -Wvla -Wflex-array-member-not-at-end -Winit-self -pi=
pe -D__XEN__ -include ./include/xen/config.h -Wa,--strip-local-absolute -=
ffunction-sections -fdata-sections -g -malign-data=3Dabi -mindirect-branc=
h=3Dthunk-extern -mindirect-branch-register -fno-jump-tables -mfunction-r=
eturn=3Dthunk-extern -Wa,-mx86-used-note=3Dno  -fno-stack-protector -I./i=
nclude -I./arch/x86/include -I./arch/x86/include/generated -DXEN_IMG_OFFS=
ET=3D0x200000 -msoft-float -fno-pie -fno-exceptions -fno-asynchronous-unw=
ind-tables -Wnested-externs -DHAVE_AS_QUOTED_SYM -DHAVE_AS_MOVDIR -DHAVE_=
AS_ENQCMD -DHAVE_AS_NOPS_DIRECTIVE -mno-red-zone -fpic -mno-mmx -mno-sse =
-mskip-rax-setup -fcf-protection=3Dbranch -mmanual-endbr -fno-jump-tables=
 -mmemcpy-strategy=3Dunrolled_loop:16:noalign,libcall:-1:noalign -mmemset=
-strategy=3Dunrolled_loop:16:noalign,libcall:-1:noalign -Wa,-I./include -=
Wa,-I./include '-D__OBJECT_LABEL__=3Dcommon/bitmap.o' -mpreferred-stack-b=
oundary=3D3   -c common/bitmap.c -o common/.bitmap.o.tmp -MQ common/bitma=
p.o
>> ./arch/x86/include/asm/bitops.h: Assembler messages:
>> ./arch/x86/include/asm/bitops.h:511: Error: found '
>> ', expected: ')'
>> ./arch/x86/include/asm/bitops.h:511: Error: found '
>> ', expected: ')'
>> ./arch/x86/include/asm/bitops.h:511: Error: found '
>> ', expected: ')'
>> ./arch/x86/include/asm/bitops.h:511: Error: found '
>> ', expected: ')'
>> ./arch/x86/include/asm/nospec.h:20: Error: found '
>> ', expected: ')'
>> ./arch/x86/include/asm/nospec.h:20: Error: found '
>> ', expected: ')'
>> ./arch/x86/include/asm/nospec.h:21: Error: alternative feature outside=
 of featureset range
>> ./arch/x86/include/asm/nospec.h:20: Error: found '
>> ', expected: ')'
>> ./arch/x86/include/asm/nospec.h:20: Error: found '
>> ', expected: ')'
>> ./arch/x86/include/asm/nospec.h:21: Error: alternative feature outside=
 of featureset range
>> ./arch/x86/include/asm/nospec.h:28: Error: found '
>> ', expected: ')'
>> ./arch/x86/include/asm/nospec.h:28: Error: found '
>> ', expected: ')'
>> ./arch/x86/include/asm/nospec.h:29: Error: alternative feature outside=
 of featureset range
>> ./arch/x86/include/asm/nospec.h:28: Error: found '
>> ', expected: ')'
>> ./arch/x86/include/asm/nospec.h:28: Error: found '
>> ', expected: ')'
>> ./arch/x86/include/asm/nospec.h:29: Error: alternative feature outside=
 of featureset range
>> ./arch/x86/include/asm/nospec.h:28: Error: found '
>> ', expected: ')'
>> ./arch/x86/include/asm/nospec.h:28: Error: found '
>> ', expected: ')'
>> ./arch/x86/include/asm/nospec.h:29: Error: alternative feature outside=
 of featureset range
>> ./arch/x86/include/asm/nospec.h:20: Error: found '
>> ', expected: ')'
>> ./arch/x86/include/asm/nospec.h:20: Error: found '
>> ', expected: ')'
>> ./arch/x86/include/asm/nospec.h:21: Error: alternative feature outside=
 of featureset range
>> ./arch/x86/include/asm/nospec.h:20: Error: found '
>> ', expected: ')'
>> ./arch/x86/include/asm/nospec.h:20: Error: found '
>> ', expected: ')'
>> ./arch/x86/include/asm/nospec.h:21: Error: alternative feature outside=
 of featureset range
>> ./arch/x86/include/asm/nospec.h:28: Error: found '
>> ', expected: ')'
>> ./arch/x86/include/asm/nospec.h:28: Error: found '
>> ', expected: ')'
>> ./arch/x86/include/asm/nospec.h:29: Error: alternative feature outside=
 of featureset range
>>
>> I haven't investigated further.  Seems like some issue with
>> alternative and the uses of CPUID defines.  We probably want to
>> mention in the commit message that only arm64 builds have been tested
>> so far.
>=20
> I just tried the same and could reproduce that.
>=20
> This is apparently not related to mac os but to binutils (2.45.1 on my =
side)
>=20
> After some digging i found out that this can be triggered with a simple=
 assembler test where
> .if (2/32)=20
> triggers the same error, while
> .if 2/32
> is fine (ie parenthesis are the source of the issue).

=2E.. the wrong conclusion is being drawn here. It's not the parenthesis =
then,
but the fact that '/' is a comment character there. Requires adding --div=
ide
to the command line options to have the character re-obtain its meaning a=
s
division operator. (GNU, Linux, FreeBSD, NetBSD, Haiku, and Dragonfly are=

the targets where '/' isn't a comment character by default, at present. Y=
es,
this is pretty confusing.)

Jan

