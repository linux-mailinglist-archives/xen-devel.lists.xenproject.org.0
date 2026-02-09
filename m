Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHmEL1C0iWlLBAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 11:17:52 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FB410E110
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 11:17:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225139.1531611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpOKt-00084S-3D; Mon, 09 Feb 2026 10:17:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225139.1531611; Mon, 09 Feb 2026 10:17:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpOKt-000830-0V; Mon, 09 Feb 2026 10:17:43 +0000
Received: by outflank-mailman (input) for mailman id 1225139;
 Mon, 09 Feb 2026 10:17:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBDp=AN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpOKr-00082u-7P
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 10:17:41 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90205245-05a0-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 11:17:39 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-435a11957f6so3293641f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 02:17:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4831d0b5b31sm299241845e9.4.2026.02.09.02.17.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Feb 2026 02:17:38 -0800 (PST)
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
X-Inumbo-ID: 90205245-05a0-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770632259; x=1771237059; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ORPnRdZxS94JybiXJ+41RiztFeD57Sg9Hn8JQGd/EJw=;
        b=fKi3HjAfp60kHHHj7pJ/O23yGPzu9wfJu9rfdC3WPXouMam4SAa0b74sV6PsTAIxu/
         v+IRiapqj4sYuBdqf9kq8xRWGfP1H+9TQxTNwJvx7nk2KGih1wfUAfCC+n9yVFIG2rlO
         aiZcW41xnH3im66fK3b/kSj2kbmC6G39a95jHTGOkcCU1BUL1hSmaPEVZJD1gL5LcxMZ
         vx/d7+cSAhcCZhtpLmU/vFK5SORy5v+xPJeb8Qo/d4TNKmYDy0kYiTBPU07zAGxM7/mi
         97t2D6Jd6ede+WOKiPog/Bh6xilGnLJqMh6zdMpVbULRmezoAlp06RuLD03sX/K8u4Af
         TIfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770632259; x=1771237059;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ORPnRdZxS94JybiXJ+41RiztFeD57Sg9Hn8JQGd/EJw=;
        b=JGDIqIMOjrj8x/Q29GADZwsfGjn3BqcJIFvEB2E3LQ1q+/LR2Tsw/kHYB84TYk+dpE
         /naWAuh0PHJd/VDzLBujBNstS5faMNeNKhhyPxzn1QYkWT/7hEOK5MRhQd5OM0KVuIjb
         SXpU8Ge5phndcIJ3kAHMo/az8A/eaT+eT4426Wr0AsNbwO4Ax1957j13K8AGIYfihfU3
         fPULZ2Zeh4X30CF/OK1XPZWf3X0oHGw9DQzGRYPptccsePUVzcjUxhVEKOLlKjnl19F4
         FSXdjr7PGCFCUX0x/bYE1fXqH1zruH7qy9xjDK8MH8zLQocY+d/cqKhvStJhwhCEN3p3
         Cy3w==
X-Forwarded-Encrypted: i=1; AJvYcCUidQ5NI9Nz6ZnwT5WhdjLIeGnn+NaFoPkomeUjPtT+ZHuFXVh2DAoog5bE1vant3FlDVGeZKQHKXs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzGh4mPsa4AXf/1qPf5qNwVByj+Nm1S4rGhNUjb97TMmmTUEaar
	VnT3eR9F7TgdWWRpiEGJZbObDXud8hNCBmIQxghxT27SJ7BmS9xGaaxXX9esFVmoYg==
X-Gm-Gg: AZuq6aJx6ouZIbFENdf5GOENkg6I7NeNCSM5M+9kx57E8NpEXDoPUJPzpmvaBpwTb/x
	xrgYWFCv1aTLYRdnPd9D/z3SiabjOBlr01PERzZrvS2Su1mFiCtkVqQpIs+cDNcdyskzJXAnlVM
	mR6cEdBF+EDum8Nq6sFn43u9mMP2Ys/8zq1YcAva9JYeN4w2ezJfpG9gE1oqmwyxU2aPFv9z6gj
	c8Th3nldBUf1dUQ6koCudcgx2Mk/1azMJSr+XefCDyNImPIDLSgKQcZWAZpVLjvebFJjc0/ijhL
	WP+0DdSVYboK/gcpJPTfe2sW46iMPiVrIxiuegabNhRkRixo6rc8KpJ+WB1yhg8/tYR5YzZu7QU
	L6rgjRGy157y1CV+YcBoG4SQGbrspHyprKNwHe8ZrdqC22iuCuirMb4JIUez4AjQWAiLfhLQdC8
	exIz2LwSPVcwR7cJk2kbrAbuG8PvglFo2yySaFa9NtxuQ58LHvxXxMQnF+Q9bBbxEUWHq+Cv6p8
	ts=
X-Received: by 2002:a05:600c:34c7:b0:477:b0b9:3129 with SMTP id 5b1f17b1804b1-483201dc3ebmr151130145e9.3.1770632259097;
        Mon, 09 Feb 2026 02:17:39 -0800 (PST)
Message-ID: <51a91133-13d0-413a-b8fb-58b9d3018499@suse.com>
Date: Mon, 9 Feb 2026 11:17:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen: Add Darwin.mk for GNU toolchains
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <ff14a313c6ec9b487263e8f823c96533bb70fe1d.1770394705.git.bertrand.marquis@arm.com>
 <aYYkAvGQygf2eNI7@Mac.lan> <28DF7F1E-BAA3-49AC-8A53-75100BAE74B5@arm.com>
 <aYmksdxh5PM7IHDN@Mac.lan> <d43840ca-4e06-45c4-853d-bd666ea06bc0@suse.com>
 <C851E211-4B56-489A-8F06-6512D785B611@arm.com>
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
In-Reply-To: <C851E211-4B56-489A-8F06-6512D785B611@arm.com>
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Bertrand.Marquis@arm.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stdgnu.mk:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:email,suse.com:email,suse.com:dkim,suse.com:mid,citrix.com:email];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-0.994];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: F3FB410E110
X-Rspamd-Action: no action

On 09.02.2026 11:02, Bertrand Marquis wrote:
> Hi Jan,
> 
>> On 9 Feb 2026, at 10:45, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 09.02.2026 10:11, Roger Pau Monné wrote:
>>> On Mon, Feb 09, 2026 at 07:30:30AM +0000, Bertrand Marquis wrote:
>>>> Hi Roger,
>>>>
>>>>> On 6 Feb 2026, at 18:25, Roger Pau Monné <roger.pau@citrix.com> wrote:
>>>>>
>>>>> On Fri, Feb 06, 2026 at 05:21:44PM +0100, Bertrand Marquis wrote:
>>>>>> Xen does not provide a Darwin build configuration for selecting
>>>>>> GNU tool definitions. On macOS, the tools we use are either GNU
>>>>>> compatible or we only rely on features supported by Mac OS, so
>>>>>> using the GNU tool definitions is appropriate.
>>>>>>
>>>>>> Add config/Darwin.mk to include StdGNU.mk and force
>>>>>> XEN_COMPILE_ARCH=unknown, ensuring Darwin builds always follow
>>>>>> the cross-compile path as we depend on the Linux ABI so compiling
>>>>>> on Mac OS is always a cross compilation case.
>>>>>>
>>>>>> An example of how to build the hypervisor for arm64 on Mac OS
>>>>>> (tools cannot be build for now) using a toolchain from brew:
>>>>>> - brew install aarch64-elf-gcc aarch64-elf-binutils
>>>>>> - cd xen
>>>>>> - make XEN_TARGET_ARCH=arm64 CROSS_COMPILE=aarch64-elf- HOSTCC=clang
>>>>>
>>>>> Instead of `cd xen` I would use `make xen ...`.
>>>>
>>>> Ack the 'cd xen' line is useless and should be removed.
>>>>
>>>>>
>>>>>>
>>>>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>>>>
>>>>> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>>
>>>>> One comment below.
>>>>>
>>>>>> ---
>>>>>> Changes since v3:
>>>>>> - set XEN_COMPILE_ARCH to unknown instead of Darwin
>>>>>> - list binutils as a dependency to install in brew in commit message
>>>>>>
>>>>>> Changes since v2:
>>>>>> - Subject was "xen: Add macOS hypervisor build configuration"
>>>>>> - Update Darwin.mk comments to more accurate versions (Jan)
>>>>>> - Remove the build-on-macos help as we have no dependency on anything
>>>>>> coming from brew anymore and the toolchain can be retrieved by lots of
>>>>>> other solutions than brew on mac os. Switch to a simple doc in the
>>>>>> commit message instead
>>>>>> ---
>>>>>> config/Darwin.mk | 7 +++++++
>>>>>> 1 file changed, 7 insertions(+)
>>>>>> create mode 100644 config/Darwin.mk
>>>>>>
>>>>>> diff --git a/config/Darwin.mk b/config/Darwin.mk
>>>>>> new file mode 100644
>>>>>> index 000000000000..176b27eac676
>>>>>> --- /dev/null
>>>>>> +++ b/config/Darwin.mk
>>>>>> @@ -0,0 +1,7 @@
>>>>>> +# Use GNU tool definitions as the tools we are using are either GNU compatible
>>>>>> +# or we only use features which are supported on Mac OS.
>>>>>> +include $(XEN_ROOT)/config/StdGNU.mk
>>>>>> +
>>>>>> +# Xen uses Linux'es ABI so we are cross compiling on Mac OS.
>>>>>
>>>>> Hm, is this actually fully true?  What's the Linux ABI exactly here?
>>>>>
>>>>> FreeBSD builds Xen natively, and it's not using the Linux ABI.
>>>>> FreeBSD uses no specific -target to the compiler invocations, and the
>>>>> linker emulation is set to elf_x86_64_fbsd.
>>>>>
>>>>> I think the point here is that the toolchain must support building ELF
>>>>> objects / images, because that's the binary format supported by Xen.
>>>>> Whether it's Linux ELF or FreeBSD ELF doesn't make a difference for
>>>>> standalone environments like the Xen kernel.
>>>>
>>>> This file is also use while compiling the tools and for those you definitely
>>>> to cross compile as they depend on Linux ABI.
>>>
>>> I'm not an expert on this at all, but IMO the tools don't depend on
>>> the Linux ABI at all.  Anyone can add the minimal OS-specific bindings
>>> required for the tools to work on environments different than Linux.
>>> We currently have {Net,Free}BSD and Linux.  In the past we also had
>>> Solaris, but that has bit rotten.
>>>
>>>> Maybe that works on BSD
>>>> but i doubt this would be the case on mac os.
>>>
>>> I doubt we would ever have any need to build an OSX native toolchain,
>>> as it's unlikely (?) that we will ever get Xen support in the Darwin
>>> kernel.
>>
>> If Darwin has some way to load "modules" (e.g. drivers) into the kernel, it
>> may in principle be possible to run OSX as a HVM-Dom0, with a Xen driver
>> loaded separately. That's far fetched, I know.
>>
>>>> Maybe we could simplify the sentence to not say anything we are unsure:
>>>>
>>>> # Cross compile on Mac OS
>>>>
>>>> Tell me if that works for you and i can submit a v5 or this might be possible to
>>>> fix on commit.
>>>
>>> I'm fine with it, I would like to hear Jan's opinion.
>>
>> As long as it's clear that all of this is only about building the hypervisor
>> (which doesn't look to be the case right now beyond the example given in the
>> commit message, which may be taken as really only an example), that's okay
>> [1]. I'd still prefer to mention the SVR4 ABI here, though, to at least
>> somewhat explain the "always cross" aspect.
>>
>> I can make edits while committing, but I'm unsure whether that's wanted in
>> this case.
> 
> I would suggest:
> 
> Cross compile on Mac OS, only hypervisor build has been tested, no tools
> 
> Please do the following edits on commit if that's ok for you :
> - remove 'cd xen' from commit message
> - use previous comment in Darwin.mk

There have been several "previous" comments there, so I think in this case
it may indeed be better ...

> Othewise happy to submit a v5

... if you do this. I'm sorry, it's quite a bit of bike-shedding on "merely"
commentary, yet I think we want to avoid misleading people.

Jan

