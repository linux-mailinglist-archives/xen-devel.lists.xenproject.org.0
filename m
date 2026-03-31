Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kO+VDXmNy2kuIwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 11:01:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D71023669D5
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 11:01:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268774.1557978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7UyN-0001H5-Td; Tue, 31 Mar 2026 09:01:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268774.1557978; Tue, 31 Mar 2026 09:01:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7UyN-0001FM-Q0; Tue, 31 Mar 2026 09:01:19 +0000
Received: by outflank-mailman (input) for mailman id 1268774;
 Tue, 31 Mar 2026 09:01:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7UyM-0001FG-0T
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 09:01:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7UyL-00Fp44-CF
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 11:01:17 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69cb8d5c-2eae-0a2a0a5409dd-0a2a450ac4c2-4
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 11:01:17 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69cb8d5d-1772-0a2a450a0019-d1558036bd46-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 11:01:17 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-486ff201041so53630165e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 02:01:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887ad3fb99sm13444945e9.6.2026.03.31.02.01.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 02:01:16 -0700 (PDT)
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
        d=suse.com; s=google; t=1774947676; x=1775552476; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nxmxFbfU6XwFZJzhsPwSIQ70deXlJplSrRzvMRe9gn8=;
        b=PAbS5E8Ews1jO1eV0mgxVXOsfnXhlKpTC/yxqUH6xaC3u5QoggCoNwdFyJRPx+l9BQ
         jB4kL3va12niIxmh9TuBNw6SwDTr/75lgPAClh1w3F8clvy+dHbLLqcfM1kGGo6mh4ks
         eK6Z8sWpZZonc6e4DA/vcEf3V7KW3oR6RjAHAexZoiDQn349lADRP10XShwnpYbJDmnC
         CoQ1Vvnc7WE/RdoGlQZTgi24mHh+2LOvSdmyl02wM/cQsL/J+la7/P/F42F5r5yMCmRW
         6r9XwyyCJ3h9yerVjzf69uK4TlvmuFEjc7UryTgdHmHAdBabArjMpW0mxuDoRBPf9g9j
         YKHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774947676; x=1775552476;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxmxFbfU6XwFZJzhsPwSIQ70deXlJplSrRzvMRe9gn8=;
        b=CGgtKKcVnbDJJWorx0UoRFxE94qLdgiJTfghWY9VNWamimcyx2j4PqpWK6sN3Heqh7
         eRM83pasbHS6yN/bUCq9ckIWZwohkUG2sSnQIn8N3us8W0tv0QSMrYMs68vTGkmJZX09
         4+LYtGIqvnZn1enjDT9GDhh7UeW9dM704/bkFENA0VOcA6+Na0hhiXY3qkmYDXUUzAOm
         BdcuoAC87cSUBZUonQ426RWIy4tMRZg/WQxYPaI6TA1RbRpWVBgiPI+R++SIjHrQTA6a
         0pmZTtC1J8P++f8WU//oLYnprzE6LspZx2dZgPnLuuqDAXfmVw0VUVg+NRmhMlrJzmI6
         TvFg==
X-Forwarded-Encrypted: i=1; AJvYcCUryaEjoilHWI3ChzQOIz2MJ4fgkCZGTd81FfslmhOwTGwjagoTFjM9KuwazvKYYKK566OkgT1LzuE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxyVTOuufUq38wZTEA6bUTqosyRIw5OT+29sHso4dxnogUNkGdh
	0XLPz/VmH2NWSBR1aEwAUDw+jbdC85JXRL0YQ8vArVGkHZiFUfyki88YSQJZgnHibilMpcQ1iut
	6b7g/Bw==
X-Gm-Gg: ATEYQzwyZcvVH5wf3daPzK3U10APehw38H5A1H3ltDZLMOnLMoPNYakkQc5CsqMzfwv
	gyu3SOBZWmbBGoE7PcsTWRWSUQtef4l1ZD2XhPxRoKcLW0uVvs0ds3cbDtzpFD9YXgIao+i4OIG
	zXud++SX0160q5633hkADSIHlQlgsmli37SJXRb+yuTsBy6UeVxkHIUkyFTO7GmEpmwLqo2Rf/X
	Fz2sAoDPxPXVDLiDs59L8sfLK4HzjQlOzf1EJhQgGE8IgLVufYl0iSmUdHxIW6g2TUGhWC+LOFB
	Zksp7+kRogpJXWIX7dpYbmwChgHG5KUQbn8cK7NteR2PlXtiKKSNAXT9JvbaqB+a7h8hbhyPwtp
	Az61jfUxHa+mmBCRqEYjhBbR2Zc8auLKrqQIgmnzvOXcKYxJcg5gWAWb9nyCNyWdOlf6jmtx4B4
	5B0zmc6Rv0xr/AOq/TY91yiLssji9F9u++G47vnq7D5SayPH4Wbw/b2bW8vKkTkBy0RJwIi0O92
	Ikzzz9npXv034g=
X-Received: by 2002:a05:600c:c113:b0:487:1114:d431 with SMTP id 5b1f17b1804b1-48727ec3c36mr199355465e9.18.1774947676433;
        Tue, 31 Mar 2026 02:01:16 -0700 (PDT)
Message-ID: <b9600744-026f-4a18-ada7-8e8a2b956778@suse.com>
Date: Tue, 31 Mar 2026 11:01:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/5] CI: drop Ubuntu 16.04
To: Edwin Torok <edwin.torok@citrix.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1774886602.git.edwin.torok@citrix.com>
 <587eb0701db6e5852e9628d0cb9db90250424c4a.1774886602.git.edwin.torok@citrix.com>
 <a49f9840-7b8b-46a1-b171-ad0e81da7455@suse.com>
 <F51598F5-FFC7-49A5-9BF1-4AAC004036F1@citrix.com>
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
In-Reply-To: <F51598F5-FFC7-49A5-9BF1-4AAC004036F1@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1774947677-52892900-6C123C68/0/0
X-purgate-type: clean
X-purgate-size: 4638
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
	FORGED_RECIPIENTS(0.00)[m:edwin.torok@citrix.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[suse.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	RSPAMD_EMAILBL_FAIL(0.00)[jbeulich.suse.com:query timed out];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D71023669D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 31.03.2026 10:29, Edwin Torok wrote:
> 
> 
>> On 31 Mar 2026, at 07:58, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 30.03.2026 18:17, Edwin Török wrote:
>>> Ubuntu 16.04 is EoL on 2026-04-02.
>>
>> It going EOL very soon is a good reason; it causing ...
>>
>>> It fails to build the emulator tests, probably due to a binutils that is too old:
>>>
>>> ```
>>> gcc -m32 -march=i686 -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes -Wno-unused-but-set-variable -Wno-unused-local-typedefs -Werror -O2 -fomit-frame-pointer -D__XEN_INTERFACE_VERSION__=__XEN_LATEST_INTERFACE_VERSION__ -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -mno-tls-direct-seg-refs -fno-pie -fno-exceptions -fno-asynchronous-unwind-tables -ffreestanding -nostdinc -I/builds/xen-project/people/edwintorok/xen/tools/tests/x86_emulator/../../../tools/firmware/include -fno-stack-protector -g0 -D_16 -mpclmul -mssse3 -mpclmul -ffixed-xmm0 -Os -DVEC_SIZE=16 -c ssse3-pclmul.c
>>> /tmp/cchhD6n5.s: Assembler messages:
>>> /tmp/cchhD6n5.s:202: Error: junk at end of line, first unrecognized character is `{'
>>> /tmp/cchhD6n5.s:203: Error: junk at end of line, first unrecognized character is `{'
>>> /tmp/cchhD6n5.s:205: Error: junk at end of line, first unrecognized character is `{'
>>> ```
>>
>> ... build issues in the test blobs isn't. The harness is specifically able to
>> cope with blob build failures. Another thing would be if test_x86_emulator.c
>> failed to build (but see below).
> 
> The whole build pipeline failed, maybe I extracted the wrong part of the error message.
> https://gitlab.com/xen-project/people/edwintorok/xen/-/jobs/13661296490
> 
> Unfortunately the output is truncated:
> ```
> Job's log exceeded limit of 4194304 bytes.
> Job execution will continue but no more output will be collected.
> ```

With that we of course can't find out what's wrong.

> It looks like GCC accepted the mavx512dq flag, but then binutils failed to assemble the output?

But -mavx512dq would be passed only when building blobs, which ...

> Although as you say another way to avoid that would be to fix the gas version check,
> more on that below.
> 
>>
>> Is the above representative output anyway (i.e. is this not perhaps interleaved
>> output from a parallel build)? ssse3-pclmul.c, built with -mssse3 -mpclmul (i.e.
>> no AVX512 options), shouldn't really involve `{'. Furthermore we specifically
>> have a check in the Makefile, skipping building altogether when gcc and/or gas
>> are too old.
>>
>>> Same test passes on Ubuntu 18.04.
>>
>> Hard to believe that there wouldn't be at least some failures. Perhaps said
>> check prevents the attempt to build the harness there?
> 
> The passing build logs are at https://gitlab.com/xen-project/people/edwintorok/xen/-/jobs/13661296494/viewer
> There are failures about unrecognised compiler flags, which are indeed ignored:
> ```
> gcc: error: unrecognized command line option '-mavx512fp16'; did you mean '-mavx512f'?
> testcase.mk:16: recipe for target 'avx512fp16.bin' failed
> make[7]: *** [avx512fp16.bin] Error 1
> ```

... is tolerated to fail.

>>> Note: the minimum version of binutils might have to be updated.
>>> Ubuntu 16.04 had version 2.26.1, which satisfies the >= 2.25 requirement
>>> in the README, and yet it failed as shown above.
>>
>> The harness is special, as said. Imo we shouldn't be updating the requirements
>> just for it. If anything, the mentioned gcc/gas check may need updating. {evex},
>> for example, requires gas 2.29 (i.e. gcc6 time frame).
> 
> I think the problem might be that the checks aren’t done for the ‘run’ target (which is what I’m attempting to use in the CI):
> ```
> # Suppress building by default of the harness if the compiler can't deal
> # with some of the extensions used. Don't alter the "run" target dependencies
> # though, as this target needs to be specified manually, and things may work
> # partially even with older compilers.
> 
> TARGET-y := $(TARGET)
> 
> ifneq ($(filter-out run% clean% distclean,$(MAKECMDGOALS)),)
> ```
> 
> The simplest solution here would be to remove ‘run%’ from the filter rules.

No, as said elsewhere, run% being different is intentional.

> If it is useful I can introduce an alias force-run, that can be used to manually try to run anyway (although that attempt may in the end fail, as with Ubuntu 16.04).
> What do you think?

Maybe. Or maybe we should have "check" targets alongside the "run" ones,
being aliases of one another perhaps for everything but the emulator
harness?

Jan

