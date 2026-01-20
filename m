Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBi4KiO0b2nHMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B9348207
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208851.1520988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viB3s-0006Li-Ic; Tue, 20 Jan 2026 12:42:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208851.1520988; Tue, 20 Jan 2026 12:42:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viB3s-0006Ji-Fw; Tue, 20 Jan 2026 12:42:20 +0000
Received: by outflank-mailman (input) for mailman id 1208851;
 Tue, 20 Jan 2026 12:42:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EVnc=7Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1viB3r-0006Jc-Ja
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 12:42:19 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73e80b21-f5fd-11f0-9ccf-f158ae23cfc8;
 Tue, 20 Jan 2026 13:42:17 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-42fed090e5fso3059430f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jan 2026 04:42:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43595e0a6fasm1032337f8f.10.2026.01.20.04.42.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jan 2026 04:42:15 -0800 (PST)
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
X-Inumbo-ID: 73e80b21-f5fd-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768912936; x=1769517736; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ii0uNLoX1b/x7y05Hjvm5oMk9ua2Woof/cAthaXuj7o=;
        b=Mva6r9dWau2cFAvpo5QhJ/mvGjsu9sNaLKUrpF+CiObudWpm08lzyEgz0ugADiFcED
         RiBuMxjR3LQT/t+AY05BQ8Aozjnc+mEuM0fs+4X/fyrfvOglEy5br3jX1A8ghvi4qUY7
         tldn7Q03uEXfm4HrNIJIkNs5WLSDUm8x2U0K1HtzLsxZQIjYH4xfU4bdaoHH4r+Mhk87
         gAPdf84387MsNrdW3SJPYuuBh2pD/sozo4ga6OEjlM5RunoQgOCLlZ1doN7qecJMIx9+
         MP0Dy+S6TpsSJA1puHCpUhNZBcTTPG6XdU5KFLiwf3gP8mPGU2eJtWtOVu9PicduZCKT
         lD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768912936; x=1769517736;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ii0uNLoX1b/x7y05Hjvm5oMk9ua2Woof/cAthaXuj7o=;
        b=gD+DS9Y43cbT8B6te4XjEoJDbkwTXy7AYMJI+dh6Fg6DKTw/YQq+VDCSAz4YgAOXrn
         33YUgt/oNhK13Gisw7Q2z31j0g2l+8v+JE1LybxkwdTWnHRRhr0Tt6J9D8NwqSDE948M
         ACMBZSZXZL+VWK753Q8f6Cn3FZrr/xC6bYoLMt//fwLaWXEEtDSqij4PwjYrQXpGyeMr
         0NvFzb5fmtutLeOLb6sXWnOHkMintdyJJrabgcSL2XgM+UulJNkjsFYeye4QUyT++/nR
         nCInyQFGA8aEZ4H2mLIEz+FQeLBpSbVxXV+SF5L+QiJq4nU7s6g2TeqV4L0yUnerlEKu
         zGzg==
X-Forwarded-Encrypted: i=1; AJvYcCVHgGGOuvAKz7hgc2MZQC/oz4frpB0Rl8KK+5eOWKCyPUhnfAs0TQ3NDENpHbXEnj+QWluKBPD+umI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwPTm6H9682Tazp6h99rzRfuSSKE152B71tbKPvSUJL77K4t3vN
	lwd9vrTT0Kw2lG3CIjZDVU6rR6LZb5Xk9hCKkWMY/WltPLh3KxOkxraekWVkqBuzGw==
X-Gm-Gg: AZuq6aJHWDTaaBb2Sje7p5JfblLZq8Xv3NeF+ipYx49ESv2SSHhlhxXZgaujunSfhXM
	eQCrozv0CAyJ8XMg78sRAYAebTEnxovhGpll+2xFNiUgOf1T4+tV0qtBQ9q4Qqj7/hdoztrcmT8
	LOw2mOjLYNcfQdLlFsg8eDmfjSr6S4z6eolhJ10v2Hdm+UZt79SA5YW0w0gIEvBGTwkn3xYACvf
	5h8MI4hw20ZILwbfiCLawxjh/x8QXo0O1/8omB5M4vpwDuf1Irigqt9fNl17Y+Zf1oEYxuLBz9x
	vuzgfjLJkwehO5E0hkSG5xK5f6/7QW9RzEqzMTZuuckLzIF36V1Z/V5Flnpvi1uuhahwWa+FFRz
	WcnKSmEKvzOHnP+HyyeR2a3GJEa6WrNBrrBWovOLgCg0jdOPxvz6mWhYf0lQCEzCOhIvLU7gOaP
	yeH+Vw+qacVXhf6Tvcgs7gd4ZRmVPZzjvVhpXVP1tNedm9Fw5IScYHEVJkdG7BztrkBBlv884Bk
	Ca1G8BH6Vtmhg==
X-Received: by 2002:a05:6000:2083:b0:432:8537:8592 with SMTP id ffacd0b85a97d-4356997867cmr18660075f8f.4.1768912936301;
        Tue, 20 Jan 2026 04:42:16 -0800 (PST)
Message-ID: <7a61a16c-93d7-4cc2-bc47-11e236cf83fb@suse.com>
Date: Tue, 20 Jan 2026 13:42:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: Expose time_offset in struct arch_shared_info
To: Tu Dinh <ngoc-tu.dinh@vates.tech>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20260120095657.237-1-ngoc-tu.dinh@vates.tech>
 <3213454a-38cd-4e5d-8a30-853e37f70c18@suse.com>
 <cff32c5b-a085-468a-be26-a858244b228d@vates.tech>
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
In-Reply-To: <cff32c5b-a085-468a-be26-a858244b228d@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ngoc-tu.dinh@vates.tech,m:anthony.perard@vates.tech,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 64B9348207
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20.01.2026 13:12, Tu Dinh wrote:
> On 20/01/2026 11:35, Jan Beulich wrote:
>> On 20.01.2026 10:57, Tu Dinh wrote:
>>> time_offset is currently always added to wc_sec. This means that without
>>> the actual value of time_offset, guests have no way of knowing what's
>>> the actual host clock. Once the guest clock drifts beyond 1 second,
>>> updates to the guest RTC would themselves change time_offset and make it
>>> impossible to resync guest time to host time.
>>
>> Despite my earlier comments this part of the description looks unchanged.
>> I still don't see why host time (or in fact about any host property) should
>> be exposed to guests.
> 
> I've answered this question in a followup reply from November, which 
> I'll reproduce here:

I did read your reply, yet nothing of it appeared here as additional
justification. Plus I fear I don't view any of this a basis to suggest
to expose some host property to guests.

>>> Since there's no way to add more fields to struct shared_info, the
>>> addition has to be done through struct arch_shared_info instead. Add two
>>> fields in arch_shared_info representing time_offset's low and high
>>> 32-bit halves.
>>
>> Again, despite my earlier question, reasoning of why two halves rather than
>> a (signed) 64-bit value isn't supplied here.
> 
> This was also in my last email:
> 
> Both are just for easy consumption of the time offset on 32-bit guests. 

I don't buy this. I should probably have replied to this effect when
you first wrote it. {,u}int64_t is hardly a hurdle anymore there. Nor
would I expect any halfway up-to-date 32-bit guest to manage time as
a 32-bit quantity anymore.

> Unsigned is particularly because these are only parts of an int64_t (and 
> therefore have no signedness themselves) and I prefer to let the 
> conversion happen after reading the two fields.

There may be benefits to this, yes, but imo they want to be spelled out,
rather than left vague.

> (Follow up: Also, the alignment of int64_t differs between GCC and MSVC 
> compilers. Using int64_t here would change the alignment of struct 
> arch_shared_info)

Does it? For which target and in which way? This would, after all, render
other uses of {,u}int64_t in the public headers problematic as well.

Jan

