Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZayDL2WLMmo21wUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:56:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CE2699583
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:56:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b="F/L++RUu";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1340359.1601412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZosG-0000y9-Jj; Wed, 17 Jun 2026 11:56:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340359.1601412; Wed, 17 Jun 2026 11:56:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZosG-0000vq-H5; Wed, 17 Jun 2026 11:56:04 +0000
Received: by outflank-mailman (input) for mailman id 1340359;
 Wed, 17 Jun 2026 11:56:03 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZosF-0000vi-3G
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:56:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZosD-007MpT-7n
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:56:01 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a328b50-e002-0a2a0a5209dd-0a2a45018d2c-2
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:56:01 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a328b50-c1f2-0a2a45010019-d155802de06c-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:56:01 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-490be29c1c5so60038715e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 04:56:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa9f2c0sm189684825e9.15.2026.06.17.04.55.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 04:56:00 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781697360; x=1782302160; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4WcQTAoQXSeF1DT1GHSpSc8uhEGqlm27mbnk0mkGJk0=;
        b=F/L++RUuC4m5I7dL4+z4A+ymagpmSgh9tMkdzX4NQ4KiX8V1XCFX+EV/9/ZBuLrz0L
         ie1B7SSObndzsX5dP48h10IxlBBTzhyYcoNBVb8A0f3KvQNaMDPm0ZsOZaarN3cNvp/A
         tVZ3U3YKSOUUXl/TUqjrIlRg0ncT7e5C3l6Ru7ZQOGuRTKJ9yyO3f4kJ4DFynMxlSKBP
         JNz/NQB91FrzHNwxJDJTlwQvtqWGxFcQbuv5OGpZTatvIfHcWMZVZ7AobYIgraHB3bOZ
         qXnMuASWWRbknMBlbRidXjbFkO9ASP7bWN6UpQWnRWbobGQDYxOyIhqIE8Y44rM/jDBf
         1hbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781697360; x=1782302160;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4WcQTAoQXSeF1DT1GHSpSc8uhEGqlm27mbnk0mkGJk0=;
        b=aFVlmR0TAYhI2mU+agJNWv2qDOBFYkWkadOPIrq8Xv9SfjZAObWIy6EP+Vbx5EJ/Uj
         GsPwqBsxney3ToGbYQjNMaStj5tBMt0XJwMG3Fv3q9k2/gfTYmPtrHzUvQDv++8N1ong
         IJqc3faADgo/X/66s8kZNUJT8ujvt+GyFIVMQ2GYy4Z/BGS0Lppc9M9hWXDecdT3W4Ki
         KR+l0gfsryc5HlLd/0axTZpp9zOu8WQKPqRBZKB0d96tKuXfK70cB5RUPlQ16ilT6axN
         1fkisucTo06c9pvyYlf6QQcDgq5lGJdKI6RzihSpzSkeJrbAeGXJDRztFSvm5efc4lBl
         K9wQ==
X-Forwarded-Encrypted: i=1; AFNElJ9H+hgDLTnek7XxqwfHfuzKtCgnQSR5whLHSYSnN/+476Cg64T+/nkl/9UgGr/qMfisburzOT2c9oU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzNFiw0mBvERHWJD0qaCsMWJkN6pUftpvVBfT/eStJoxvR8Ffbh
	kHTmeNADYxG9//LdsQeuVoPOdfM0GxTGGSpfmYCPi8bIr0UOSasr4PlOvuDwCeEGIA==
X-Gm-Gg: Acq92OEyaDvX39Z9tLRySrGptT3zbvE+b3TiElc9go1fk9GXB1DXYQQbFx4Pp6IqfNE
	jTw5TUvrcdn80xk1JjT6n4GHQES12lvysOCQi9GrkTEHo8HDA/0lc9fWLrF7p5yQo11q9aEAieo
	6kv/pztDdYawTekb1kOCxZ4hNT8/3CviLAo/qJXwcf/SF/vxV+ocHDGQzGTHnLGQoFZGiMig2ye
	qL9NboWIAefr26jdFwGpsk9YIx8osxxJyXIZInvMHndlYmXW+zhz1qYe79tXkkZtpWSLbh8YELu
	/JPw38Tti6OQGVv2WtxztIcwVgPxbCOa36KTc0CAVBSi+E/t1++v/thWp8oezRIhzVU7QMySirh
	ALbMZ6PFsUS16j4MIPGS88TSfoPrJ27PJh47OdjywhDzx1WGrfeXe6i8Yhy9b8uOXGmu35sRpaE
	VSEnlzViuLOCkI7fSGk+HHgDspvyvkPjp+OwTvX4GZaZx8kUu/fuR3UjvfzAMlU7SNwTZ7dpBpT
	B7E
X-Received: by 2002:a05:600c:3e05:b0:492:2e58:666c with SMTP id 5b1f17b1804b1-492333f8014mr64674765e9.37.1781697360483;
        Wed, 17 Jun 2026 04:56:00 -0700 (PDT)
Message-ID: <274b06b5-88b0-4a40-9af4-4ad80a99f3b5@suse.com>
Date: Wed, 17 Jun 2026 13:55:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] xen/x86: Always strip xen.efi
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Frediano Ziglio <frediano.ziglio@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260608173108.2848469-1-andrew.cooper3@citrix.com>
 <b310db60-850a-4096-8900-54d0816e5063@suse.com>
 <965bcf53-accf-4297-bf8c-903dce45cba0@suse.com>
 <CAHt6W4f5KzkRhbDnCMS82zpAJ04-UkBoOXowyG=A5CT3yNSv9A@mail.gmail.com>
 <547d8b85-3537-4bb0-bddb-2ca2f14eb355@suse.com>
 <CAHt6W4crK-Lgt6rTsERupEGhdXtjjKJvh3F=K_U-3vXDtcETBg@mail.gmail.com>
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
In-Reply-To: <CAHt6W4crK-Lgt6rTsERupEGhdXtjjKJvh3F=K_U-3vXDtcETBg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1781697361-B4B4EFF4-292F83B8/0/0
X-purgate-type: clean
X-purgate-size: 2018
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:andrew.cooper3@citrix.com,m:frediano.ziglio@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:marmarek@invisiblethingslab.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,gmail.com,invisiblethingslab.com,apertussolutions.com,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 26CE2699583

On 16.06.2026 16:28, Frediano Ziglio wrote:
> On Tue, 16 Jun 2026 at 15:15, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 16.06.2026 16:07, Frediano Ziglio wrote:
>>> On Thu, 11 Jun 2026 at 15:42, Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> On 11.06.2026 16:38, Jan Beulich wrote:
>>>>> On 08.06.2026 19:31, Andrew Cooper wrote:
>>>>>> Some old versions of binutils ld managed to produce efi files which the
>>>>>> matching version of strip couldn't process.  This includes Binutils 2.26
>>>>>> included in Ubuntu 16.04.  Delete the workaround for this bug, and require a
>>>>>> less broken toolchain.
>>>>>
>>>>> And we're certain newer versions of strip don't do any harm to the binaries?
>>>>> Already towards Frediano's posting I said that having looked at how things
>>>>> work there, I'm far from certain.
>>>>
>>>> I should have added: An option may be to link twice: Once with debug info
>>>> included, and once with it stripped. Personally I trust the linker creating
>>>> the various headers, including the section ones, more than strip's (or
>>>> objcopy's). Yet then I can only repeat my observation that linking PE+ from
>>>> ELF inputs looks to be significantly slower than linking ELF -> ELF.
>>>
>>> That was also attempted. See previous versions. And no, it does not work.
>>
>> How exactly does it not work? When stripping debug info while linking (as
>> we now do for the first two passes), the resulting image should be both
>> small enough and correct. What am I missing? The only caveat I'm aware of
>> is the Eclair scan, where we should avoid doing any work for the
>> "auxiliary" linking step (the one not producing the binary that's actually
>> going to be used for running Xen).
> 
> One thing I remember was the build-id was not the same and debugging
> tools could not work.

Hmm, yes, that's a little ugly, but can likely be dealt with by using
--build-id=0x<hexdigits> to replicate the build-id that was generated for
the main binary.

Jan

