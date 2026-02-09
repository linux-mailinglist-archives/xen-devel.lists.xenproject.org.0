Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNkaGdOsiWndAgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 10:45:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DC110DB56
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 10:45:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225084.1531541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpNpp-0000JR-8u; Mon, 09 Feb 2026 09:45:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225084.1531541; Mon, 09 Feb 2026 09:45:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpNpp-0000GW-5a; Mon, 09 Feb 2026 09:45:37 +0000
Received: by outflank-mailman (input) for mailman id 1225084;
 Mon, 09 Feb 2026 09:45:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBDp=AN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpNpo-0000GN-1F
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 09:45:36 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 148d1fc3-059c-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 10:45:34 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-480142406b3so32077595e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 01:45:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48317d3e245sm351227245e9.8.2026.02.09.01.45.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Feb 2026 01:45:33 -0800 (PST)
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
X-Inumbo-ID: 148d1fc3-059c-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770630334; x=1771235134; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sMepS55pwInObmLx/M7587dXUiK3Ie5eihrONDd6dfk=;
        b=NVU2vyDpXr13Rf2zgNIrchuFh2v7MpIu2toPEd6yJ0hO3tCVb8u/h1H+a4CfkpWfNt
         N72o5bwTgvNEiJfTSh2freOlfpTBd7VIIBhnnZmIHPlpapKTke7cOYzTko/t0EMcLUU5
         nL4w0/80sMjA6mJ6xaebTw5KtgIpjH5vH4M+cHP3ahd6IIfXhZoqRyj1K9YOoMttX5+i
         S6RiPSPGZOW9ZYR3bmrUKJXVANrqz0NL282Kvo2lRj+iP8etn+9x6x7Y8dMICPR4LKqC
         n+PZwPqVicLMaBsVKe1u3MPMEXIkce5EwSkcT2bUWDozD/IqRFimavGgc42sOAMSsro9
         HBnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770630334; x=1771235134;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sMepS55pwInObmLx/M7587dXUiK3Ie5eihrONDd6dfk=;
        b=HpVeAFlyMq2o/AaekBUf8wofaMjg/YUZReRIdsuUi93iGOZE9lA0gEXoDer9tChHhq
         4V4AfHTaG1TwaviKqukOSoaFn8NBhjaZwNLYKFhi2qY6Ou/rAeOrvcUV+Wccb9cDWIZX
         EamGF01gKHrMB9LdG9bZ7pZHXBsMbMMhpmBexrs/Gm9boUl38dBGhcEpwyFXQrVJgFeO
         feUdG5Q9PY5X7bhIF46ttFK4eETlQfSU7te3sb1fEVmK67oRSayY9+mDnG5c6ICV41ra
         /Q1widsw4afQPt4gom+B1C4IZY5cUUaAasisaL86mLlpl9/P9U5liA1TSXZbAYutd314
         bA2g==
X-Gm-Message-State: AOJu0YxWeX4UY3NZwtySeiQ91QtEKF4YbyxMHmTwleXbSD/7PMluLw3s
	GbQ8kYAogBSH3HA7D0HuF7OvEYiEFASA4REUjJXufTik7qK9GPfgF7CzvxG1lvZRpQ==
X-Gm-Gg: AZuq6aLCdcNSPzy57gg9PecPuchDEiWgjdhTDrx5UmokQcv6KVDbCrH0Gul151+SvTE
	rEDIKheQbkeohI/vmSp0S1vbYclTxYEp+xmfBPFQpj5o3iDLiWUVaYtlYldLjbUL2j9bKc8CtBi
	rtYnu9I30aAPcvjkaUeI6+0YHBWB3EKKKctzpYqu1G9GHKGsYqPwKlD+UXgvwWrMqbezSIssoVg
	k7C0qv5mdhRGJccc7MJPWUcUpMunMmXOIfYsaqHBFDkODH3XfOnn6EPsa7/ZJoT1Cp3UQfvN5x+
	HUd8uSVmB256kYjyE4S+UYUXdS1bzv3fDTzU317gTSOZ7EVbHK9+sKAr5EEo77R8iThj8W25cXP
	Io1q1Cz2qpDQ/zzb4h3UqagU3Rop7NOV8zHjGLDPyNXV6YNr6NsEA+hJbvD+cr9CbwpCeDmMwch
	ebB+Szgw1z9bEi/Y3atASnJ2sH9Seie/ImGXyoLJjD/ZkY0T0bOpoObpe8zyMMEMezkGozGYduY
	g0=
X-Received: by 2002:a05:600c:34d1:b0:47e:e20e:bb9c with SMTP id 5b1f17b1804b1-483201d5ff1mr157582515e9.8.1770630333819;
        Mon, 09 Feb 2026 01:45:33 -0800 (PST)
Message-ID: <d43840ca-4e06-45c4-853d-bd666ea06bc0@suse.com>
Date: Mon, 9 Feb 2026 10:45:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen: Add Darwin.mk for GNU toolchains
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <ff14a313c6ec9b487263e8f823c96533bb70fe1d.1770394705.git.bertrand.marquis@arm.com>
 <aYYkAvGQygf2eNI7@Mac.lan> <28DF7F1E-BAA3-49AC-8A53-75100BAE74B5@arm.com>
 <aYmksdxh5PM7IHDN@Mac.lan>
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
In-Reply-To: <aYmksdxh5PM7IHDN@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:Bertrand.Marquis@arm.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,arm.com:email];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: C3DC110DB56
X-Rspamd-Action: no action

On 09.02.2026 10:11, Roger Pau Monné wrote:
> On Mon, Feb 09, 2026 at 07:30:30AM +0000, Bertrand Marquis wrote:
>> Hi Roger,
>>
>>> On 6 Feb 2026, at 18:25, Roger Pau Monné <roger.pau@citrix.com> wrote:
>>>
>>> On Fri, Feb 06, 2026 at 05:21:44PM +0100, Bertrand Marquis wrote:
>>>> Xen does not provide a Darwin build configuration for selecting
>>>> GNU tool definitions. On macOS, the tools we use are either GNU
>>>> compatible or we only rely on features supported by Mac OS, so
>>>> using the GNU tool definitions is appropriate.
>>>>
>>>> Add config/Darwin.mk to include StdGNU.mk and force
>>>> XEN_COMPILE_ARCH=unknown, ensuring Darwin builds always follow
>>>> the cross-compile path as we depend on the Linux ABI so compiling
>>>> on Mac OS is always a cross compilation case.
>>>>
>>>> An example of how to build the hypervisor for arm64 on Mac OS
>>>> (tools cannot be build for now) using a toolchain from brew:
>>>> - brew install aarch64-elf-gcc aarch64-elf-binutils
>>>> - cd xen
>>>> - make XEN_TARGET_ARCH=arm64 CROSS_COMPILE=aarch64-elf- HOSTCC=clang
>>>
>>> Instead of `cd xen` I would use `make xen ...`.
>>
>> Ack the 'cd xen' line is useless and should be removed.
>>
>>>
>>>>
>>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>>
>>> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
>>>
>>> One comment below.
>>>
>>>> ---
>>>> Changes since v3:
>>>> - set XEN_COMPILE_ARCH to unknown instead of Darwin
>>>> - list binutils as a dependency to install in brew in commit message
>>>>
>>>> Changes since v2:
>>>> - Subject was "xen: Add macOS hypervisor build configuration"
>>>> - Update Darwin.mk comments to more accurate versions (Jan)
>>>> - Remove the build-on-macos help as we have no dependency on anything
>>>>  coming from brew anymore and the toolchain can be retrieved by lots of
>>>>  other solutions than brew on mac os. Switch to a simple doc in the
>>>>  commit message instead
>>>> ---
>>>> config/Darwin.mk | 7 +++++++
>>>> 1 file changed, 7 insertions(+)
>>>> create mode 100644 config/Darwin.mk
>>>>
>>>> diff --git a/config/Darwin.mk b/config/Darwin.mk
>>>> new file mode 100644
>>>> index 000000000000..176b27eac676
>>>> --- /dev/null
>>>> +++ b/config/Darwin.mk
>>>> @@ -0,0 +1,7 @@
>>>> +# Use GNU tool definitions as the tools we are using are either GNU compatible
>>>> +# or we only use features which are supported on Mac OS.
>>>> +include $(XEN_ROOT)/config/StdGNU.mk
>>>> +
>>>> +# Xen uses Linux'es ABI so we are cross compiling on Mac OS.
>>>
>>> Hm, is this actually fully true?  What's the Linux ABI exactly here?
>>>
>>> FreeBSD builds Xen natively, and it's not using the Linux ABI.
>>> FreeBSD uses no specific -target to the compiler invocations, and the
>>> linker emulation is set to elf_x86_64_fbsd.
>>>
>>> I think the point here is that the toolchain must support building ELF
>>> objects / images, because that's the binary format supported by Xen.
>>> Whether it's Linux ELF or FreeBSD ELF doesn't make a difference for
>>> standalone environments like the Xen kernel.
>>
>> This file is also use while compiling the tools and for those you definitely
>> to cross compile as they depend on Linux ABI.
> 
> I'm not an expert on this at all, but IMO the tools don't depend on
> the Linux ABI at all.  Anyone can add the minimal OS-specific bindings
> required for the tools to work on environments different than Linux.
> We currently have {Net,Free}BSD and Linux.  In the past we also had
> Solaris, but that has bit rotten.
> 
>> Maybe that works on BSD
>> but i doubt this would be the case on mac os.
> 
> I doubt we would ever have any need to build an OSX native toolchain,
> as it's unlikely (?) that we will ever get Xen support in the Darwin
> kernel.

If Darwin has some way to load "modules" (e.g. drivers) into the kernel, it
may in principle be possible to run OSX as a HVM-Dom0, with a Xen driver
loaded separately. That's far fetched, I know.

>> Maybe we could simplify the sentence to not say anything we are unsure:
>>
>> # Cross compile on Mac OS
>>
>> Tell me if that works for you and i can submit a v5 or this might be possible to
>> fix on commit.
> 
> I'm fine with it, I would like to hear Jan's opinion.

As long as it's clear that all of this is only about building the hypervisor
(which doesn't look to be the case right now beyond the example given in the
commit message, which may be taken as really only an example), that's okay
[1]. I'd still prefer to mention the SVR4 ABI here, though, to at least
somewhat explain the "always cross" aspect.

I can make edits while committing, but I'm unsure whether that's wanted in
this case.

Jan

[1] Yet better might be if we refused to build other than the hypervisor.
I'm unsure though how easy it would be to achieve that in an at least
halfway tidy manner.

