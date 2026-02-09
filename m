Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADoeKmuqiWnfAQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 10:35:39 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1263B10D9E2
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 10:35:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225067.1531521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpNfi-0006K0-12; Mon, 09 Feb 2026 09:35:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225067.1531521; Mon, 09 Feb 2026 09:35:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpNfh-0006Hk-U3; Mon, 09 Feb 2026 09:35:09 +0000
Received: by outflank-mailman (input) for mailman id 1225067;
 Mon, 09 Feb 2026 09:35:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBDp=AN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpNfg-0006He-ED
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 09:35:08 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9db011c1-059a-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 10:35:05 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-4376c0bffc1so686698f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 01:35:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4376ab6e4c0sm10574590f8f.0.2026.02.09.01.35.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Feb 2026 01:35:04 -0800 (PST)
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
X-Inumbo-ID: 9db011c1-059a-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770629705; x=1771234505; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xfEZDwMetPdChnyM4arsicKXekHp8K+9aou74YwYZys=;
        b=E132Ws79hjujbvLosDL54FeGDS5hZHfdwW6fZTs774MvPG00LrV2wHVXgyknnkE/4y
         YTiafPQg7ayRJBNv2NscDJVIXVzUDaeV5wzBVCFdJrKistc4bFKNySqCpiOL6h9+gutP
         aKnFiNWZ2eFAfTD9VJIGBEyxB4z4+KlXVlIenwfjiUpa6P6D4vhN6YLt+q6pJZ8BdCbd
         mBZC5EA/DLOx1kI1qtaqQigqFrD/H1CQkrPK9zxO6qLRad3UYBiVWY+Dzw4Pc84+2Z61
         GFClwe1ZkaAT9BC1O1dNsf+GZI8w1QquB+1xEXyhra+HhMznHLD9+oKSzAUfgqHUmIKp
         hofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770629705; x=1771234505;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xfEZDwMetPdChnyM4arsicKXekHp8K+9aou74YwYZys=;
        b=KEZu3XnOHiVuHEyIiSxuM59W4W2gUfQeK7H0/6unWeIIfW1ivppY7+6ZSrnJvuuIO5
         fWQ7bn0jvcFsZ0oA6+d4t7wTQNVNx4W+LQU0JFJXS2/hDDu94US/sQfjWMHO+VFJh4R+
         /ufvjv6bOd0tixfjUe/QW3PNypIaPrSdSeN2FJ8QGGHM75+n4mJgBidpyZOfHfriRVYe
         RR3pg4NU91saV/Gc28O4GqNbGhEUugwQqgzozFcNZ+X6L6eMlTeZlAy3fWLjnXW1UlVC
         BZoggOtwZh4tODQMhj1QrgBUOvv3OxSy2oHZ7MsETmHg5s7lPP9JI0OFTvsadUxLlhsk
         304g==
X-Gm-Message-State: AOJu0YwS0U4mJ4jn8dCBnHPqxWR8++kealnMefGI8yUZWjcBqfIHxWC9
	O4agAFpTdIrZc1ciQqvJG6/RRYiSUmIw9y3afDbEiKoiP30vOuXeOGx49AYJMBc4/g==
X-Gm-Gg: AZuq6aKTiv8n6EhtkoNfBN/zarfPmAcYtHCv9dUNe1JPql60kKqWy7UY+8DEV5wnxeI
	r2BTzBb+k0jLZmx0hDptcwR+9AeEO8ZuFWt8B7pP70e+k36QZP33t8l3y7Ck5wU98j3drPRYVZS
	4/7wQfdi9NUjrJ7xVOfks5tQC5juBndANunoXrwFDN84DU1OhjbzrB3IN8mSFKJsfIyphttXEQI
	LKsY2yf+cmHpmgHM+OVdOyYDy215JmeoJl9v1M3aQQr3EqLalvkoI/xfHKccJodkNpWDEY7uJaZ
	l9TS1ryncxkkRF/D8D70BR9SCXJTJFRsqbLc9xGVuXxIFtQZOXFitAVtWAC1fXwZuFMEovA81ax
	//WpU3Zr8vRoKz6hfeQ6pKg/MFWQerFuRArzng1l66Xr/5UrUXAwr9HYeniozh+tUbSpCPp2kSE
	tsoaoExOoFuFRQK8y01GJWg0bmO/ed3lXmUP0h9euNDF/hTAC0wJPMv1+8glxQ/s2Sc7w6twbSC
	0I=
X-Received: by 2002:a05:6000:24c8:b0:432:8504:8d5b with SMTP id ffacd0b85a97d-4362968a722mr16717227f8f.50.1770629704869;
        Mon, 09 Feb 2026 01:35:04 -0800 (PST)
Message-ID: <7180e7a5-3075-4237-b23f-ddc0e370f692@suse.com>
Date: Mon, 9 Feb 2026 10:35:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen: Add Darwin.mk for GNU toolchains
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <ff14a313c6ec9b487263e8f823c96533bb70fe1d.1770394705.git.bertrand.marquis@arm.com>
 <aYYkAvGQygf2eNI7@Mac.lan>
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
In-Reply-To: <aYYkAvGQygf2eNI7@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1263B10D9E2
X-Rspamd-Action: no action

On 06.02.2026 18:25, Roger Pau Monné wrote:
> On Fri, Feb 06, 2026 at 05:21:44PM +0100, Bertrand Marquis wrote:
>> Xen does not provide a Darwin build configuration for selecting
>> GNU tool definitions. On macOS, the tools we use are either GNU
>> compatible or we only rely on features supported by Mac OS, so
>> using the GNU tool definitions is appropriate.
>>
>> Add config/Darwin.mk to include StdGNU.mk and force
>> XEN_COMPILE_ARCH=unknown, ensuring Darwin builds always follow
>> the cross-compile path as we depend on the Linux ABI so compiling
>> on Mac OS is always a cross compilation case.
>>
>> An example of how to build the hypervisor for arm64 on Mac OS
>> (tools cannot be build for now) using a toolchain from brew:
>> - brew install aarch64-elf-gcc aarch64-elf-binutils
>> - cd xen
>> - make XEN_TARGET_ARCH=arm64 CROSS_COMPILE=aarch64-elf- HOSTCC=clang
> 
> Instead of `cd xen` I would use `make xen ...`.

There are subtle differences, though. (Really I first wondered whether you
omitted -C ...)

>> --- /dev/null
>> +++ b/config/Darwin.mk
>> @@ -0,0 +1,7 @@
>> +# Use GNU tool definitions as the tools we are using are either GNU compatible
>> +# or we only use features which are supported on Mac OS.
>> +include $(XEN_ROOT)/config/StdGNU.mk
>> +
>> +# Xen uses Linux'es ABI so we are cross compiling on Mac OS.
> 
> Hm, is this actually fully true?  What's the Linux ABI exactly here?
> 
> FreeBSD builds Xen natively, and it's not using the Linux ABI.
> FreeBSD uses no specific -target to the compiler invocations, and the
> linker emulation is set to elf_x86_64_fbsd.
> 
> I think the point here is that the toolchain must support building ELF
> objects / images, because that's the binary format supported by Xen.
> Whether it's Linux ELF or FreeBSD ELF doesn't make a difference for
> standalone environments like the Xen kernel.

It's the ELF SVR4 psABI that we're after. This is more than just building
ELF objects: It's also about calling convention, for example. Which would
not matter much if Xen code was all written in C, as the ABI Xen surfaces
to guests is entirely different anyway.

Jan

