Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UODGNY1+nGm6IQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 17:21:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 475E0179A1B
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 17:21:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239226.1540668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuYgL-0005kb-K6; Mon, 23 Feb 2026 16:21:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239226.1540668; Mon, 23 Feb 2026 16:21:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuYgL-0005is-HP; Mon, 23 Feb 2026 16:21:13 +0000
Received: by outflank-mailman (input) for mailman id 1239226;
 Mon, 23 Feb 2026 16:21:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dhnJ=A3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vuYgK-0005im-CZ
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 16:21:12 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9d99402-10d3-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Feb 2026 17:21:10 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-43622089851so4543499f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Feb 2026 08:21:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970d3fdd0sm20816150f8f.19.2026.02.23.08.21.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 08:21:05 -0800 (PST)
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
X-Inumbo-ID: a9d99402-10d3-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771863669; x=1772468469; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PRG9q6g0BIkw9OsMY5t3dLCNBWvPTfNUJIccKq//V+k=;
        b=VjXg8NsvQ5d18s0k7B4PCUipo6vMmixd5y9xIrvlNqD6nhjYo2agJ6DMpWZ6FwQnfu
         yoE3gUVkGrnp5CgHcZAw5lNDUeBL4/ots+AeQN5nXpZPnJr7xl9ur+rN857l55ql26Tb
         FPbDoRWVguQLmYORZH6KWvr8o2X+AUyNJ1z6o6tjvNtg/+fwBV+1n+g0xmFaBSB/O9H2
         3+PMHaZXni3vNseuHPaNCJZ8W8J25aUVtEXGtM7V/mNlV8HjxSdj7UnpvSdnxdqbiNfM
         qrBzNfXuPiolbShiXxPrOSLseS9g3irtW9GaaHGIsBvSFOc95JfCu507Zhnsgpxf8Ji4
         HO6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771863669; x=1772468469;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PRG9q6g0BIkw9OsMY5t3dLCNBWvPTfNUJIccKq//V+k=;
        b=aPvEU+ABCW53Gc66rhuledF65Szv7/oYsbwBHD/gn7hbniaq4dmH/I2sNy4e2r+nJz
         jLcPfzgn7bjUR49OGleV9XtUoBweYndMCyLC8T/g1QeX2xI7yFotKwWvo6VVp7h+Vkm4
         mpbnszCuDJVgsFFfG9kvQ2j+l0sSxPKbLQ6+kg8KTfcuQdUIdMoDmpw3fHh/lFeRY7ZA
         ORmfH/rX0JluP6z+Wzg5S65hWuKRqlQmAhSiyepEQrQabf0Qpa7wPp3wpseQ6srhlraH
         FtrrPjhnlg41jsFvmVhQwH/O1W46+haxpMfA/YsTi7mmCSUoXwPKSJdq6mzY8Gnri+Oe
         Ng6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQyT1thvKcRdfUQ8J2xje7vr5h5KVasnK7QvUJxb5MyHLEjACf1Xa4Eb7hxAf/4KUFJnMuJzDOt5g=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzx3D37qwl/veZ0QvEEn8zRhouDHGYaqyh6urZjroWFXX2EljjE
	cyt/FxWGE10Lv4ad+HOkXSaQxOQys6MfuP8z9Zjs6T+3/SxYvnT6EIsJMMMTmphhrg==
X-Gm-Gg: ATEYQzyELFWURCBnjC2NunV4c86jNfrK8Uu51DjTKW9hKDxKl+dL7sJAt64n8rxSKtO
	MGZ+FntIQrjyUOidI3y7cEc/wqTwrrCPq7TkxfRRTq4Wcm9A0sXlff//470Y7ZmUIgu+X2Y6kcT
	A7P2lXtxil5AXV9xLx5CrsiNsclM4RTLOeR0cv/qcDReFOKScQw7exnjQwzF7ywOVIrdxb74Z0Q
	zvQhzAjhWvQMwWOihoRjHz+NjSv/cNEvp6/B/zF41Rk6tyNLNvJfJSZfJqCKK3Ilf+n9NQppT6Z
	eseAx5LIMLMLFNQBaWt/PNcMMEoAXqSncPV59z/HvvnW9nWlkpmVUcYZowLKzKWb16mVFyv174i
	SxCg3i+1nRLJ9CKT6dWdFpL2dEwt3E42OX9gQEXSWMkAy51WtEwXS+mD5TUfJiLIhV2RXyijJKI
	pFDkGwO7tesIX5yhXyuLdNxfiGBYkAanmvb+nb4irZYG9NLl8YPaR+E13X/kmyXMueK5pteMsrC
	Nso4UJ0MkI1qdL17oNjj8wZHQ==
X-Received: by 2002:a05:6000:40ca:b0:435:dbc4:3af0 with SMTP id ffacd0b85a97d-4396f15ae2fmr17853378f8f.14.1771863666146;
        Mon, 23 Feb 2026 08:21:06 -0800 (PST)
Message-ID: <76041b1f-aeb5-4d9e-af6a-a2616763e5c3@suse.com>
Date: Mon, 23 Feb 2026 17:21:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] tools/tests/x86_emulator: fix build on clang-21
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@citrix.com>
References: <cover.1771840208.git.edwin.torok@citrix.com>
 <7147fc3ef5d5bdf5a811e896925d9aa641ed0753.1771840208.git.edwin.torok@citrix.com>
 <6d564a09-b1bb-414f-ba8a-61bf9d9c7e5e@suse.com>
 <c69950cf-7544-40e4-a58c-e2b826f6a5c9@citrix.com>
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
In-Reply-To: <c69950cf-7544-40e4-a58c-e2b826f6a5c9@citrix.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:edwin.torok@citrix.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 475E0179A1B
X-Rspamd-Action: no action

On 23.02.2026 17:06, Andrew Cooper wrote:
> On 23/02/2026 4:02 pm, Jan Beulich wrote:
>> On 23.02.2026 11:04, Edwin Török wrote:
>>> clang-21's built-in assembler is enabled by default, but it doesn't
>>> support some mnemonics:
>>> ```
>>> test_x86_emulator.c:2636:36: error: invalid instruction mnemonic 'fsaves'
>>>  2636 |                        "fidivs %1\n\t"
>>> test_x86_emulator.c:2640:24: error: invalid instruction mnemonic 'frstors'
>>>  2640 |         asm volatile ( "frstors %0" :: "m" (res[25]) : "memory" );
>>>       |                        ^
>>> test_x86_emulator.c:4251:24: error: invalid instruction mnemonic 'vpcmpestriq'
>>>  4251 |                        put_insn(vpcmpestri,
>>>       |                        ^
>>> ```
>> Was this reported to them as a bug (or perhaps even two)?
> 
> Looking at just one of these, the mnemonic is FRSTOR without an S, and
> Clang 21 is happy with that.
> 
> What is the trailing S supposed to signify to GAS?

"short", i.e. the want for a 16-bit operand size prefix. Just like in
vpcmpestriq the request is for a REX64 prefix. Suffixes are the way to
go in AT&T syntax when operands alone can't disambiguate operand size.
The less nice alternative are data16 prefixes; not sure if Clang would
support those.

Jan

