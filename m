Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HzJ5NOKFT2rwigIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 13:28:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 367F3730529
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 13:28:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b="P/FRH1oi";
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1357981.1612286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whmvT-00040Q-Nt; Thu, 09 Jul 2026 11:28:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357981.1612286; Thu, 09 Jul 2026 11:28:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whmvT-0003y5-Kv; Thu, 09 Jul 2026 11:28:19 +0000
Received: by outflank-mailman (input) for mailman id 1357981;
 Thu, 09 Jul 2026 11:28:18 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1whmvS-0003xw-NG
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 11:28:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whmvR-002waC-IC
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 13:28:17 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4f85d1-bab6-0a2a0a5309dd-0a2a4502a1e6-2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 13:28:17 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4f85d1-5a27-0a2a45020019-d1558033acd6-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 13:28:17 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-493ece78b0cso3666385e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 04:28:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6ff432sm52531815e9.4.2026.07.09.04.28.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2026 04:28:16 -0700 (PDT)
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
        d=suse.com; s=google; t=1783596497; x=1784201297; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NvSb14cevwQPVvi78VohFEjC8Xp6Xg+GL/zWE9jMkd0=;
        b=P/FRH1oitkRrYJxb94f02ZsFavr3V8B2i9RHkIMbRrjX1gdbr3NB6PdKmNPmyjHc5h
         JwYz1xtbwQdaOc+ujB/vEpvQhD+h7T0yXlHbsllSyivS1RjH93/zxBYA1cq+Oh++Uihp
         rJ3VhBumxoDjH3tQ/Ola5fzQshPqYVh7oDiuMjW2j+AwZ+MCYyIJfPlHM995maKASFIe
         EXDCj0xdxfLckEvzY0Ve96cYSasTYi4JBWVWwnRFlAk4tcHsroI9qugOTZ15nmWXO4op
         8FYoKXo+vq4+8OMpnMHAHtaV1aMcSgiOTMW2WwFRMWZLh0iiWpoHjxPioyVeJ/d3Au53
         tpLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783596497; x=1784201297;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NvSb14cevwQPVvi78VohFEjC8Xp6Xg+GL/zWE9jMkd0=;
        b=bLzTkTF6g4ISjpugMa6is/EqXRBAm5r7W6l21DDgcnVa0jIdO8qBJ6vDNZqJ8auLqH
         uXaixijxPwEr/3peDNreytkcp26cJFdyWv/c7I5k2n9AT6FPiZQabMzgI5K6wyytcKHa
         P9wJiw1aUcVkuJlmqexZ8ERLJR5/7pf4txdEuJSzQWYBEVdQ5aI4w/0QJnXVB73YV9J8
         dwNod1d3qGUuyqNp+vqs4y+p0tYBirWa46Hz9rlTj9QRO6A9hpNtJGRK4CvtiNzYBvaH
         9GZEMOHkZrVb0BVLA1HLJC0xGvGA4Dutbq1NYbnE+zqfHNFCPr+tT19u4AClwPE5+7PB
         lWgA==
X-Forwarded-Encrypted: i=1; AHgh+RrZ0dXIOqgq+H92FghkczbQnlGfS7rqM2C/oGxDXauX5RtOlxvDWE8h1cB/MYcnGbF9iSgQlEnp54Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzM2P0KMv+y1XPoyRbidTIoEZlTYOW+cHWNPlj6p8mWDFgCoDe/
	Soj7S2hlgClAUYRO2DkHpWl+iQec3/R3W33gddiOEcJcURoJ0SHcIdVT3KYCmfUAMAegrEjMi9I
	8uNwSOQ==
X-Gm-Gg: AfdE7ck2N/wt2ZT9zm+o8Elm7zZOSmoekQIlXTrAUAfJyMfCQ+znCJAQLKU90LD3QB3
	Z+dkOCj1MVCwwYcV+SN0ojVeqUo0mkQWDAa4Sb4G1IX/yaB6+TLJ/4WeJVCijfqnShbtJt+4qIu
	khAdjUt+5Pr3MxO7U972tH+XeoQRK7nNSE9dkcrE1XQKBAAaFrwTLwsX0GBHE4eKTZV0z9Z4RZ2
	L+CDm1z1Aja6f67G+kReMgK0mEwesdcXvrcyHeaxQJq4Bgr+h8hZTMe8YQ6L0fYwOAJf6tsrowF
	s3o1M2FquFhd6tkGjcILejX21GuIcQ84gehg1Yw12UoV+wnlvQeW408uztDX5IJKmijRfqRaKao
	x6nAuN0lfn2FKGiDgaTJhiIPgR4RCgw1lJ2t79IefieiA79bgv7nQnPgiJXpK7anj9o5N2kZq7M
	MWTadNFpUKyLl58rh0KvSZZrfjDhfsh6l1PCyJrqRVkkVSptApt1T0wy+3tr7C3OU5WPSIUvr4o
	oeg
X-Received: by 2002:a05:600c:4e4b:b0:490:44eb:c1ea with SMTP id 5b1f17b1804b1-493ee5845admr14100525e9.24.1783596496856;
        Thu, 09 Jul 2026 04:28:16 -0700 (PDT)
Message-ID: <e94254ab-10ae-4cdb-bb9f-143fcf4c40c1@suse.com>
Date: Thu, 9 Jul 2026 13:28:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul: drop host_and_vcpu_must_have()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <fe377539-f32b-4202-8ef6-fd5b959a7f66@suse.com>
 <aec621b1-283d-46a4-9ffc-f515a33c26e7@citrix.com>
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
In-Reply-To: <aec621b1-283d-46a4-9ffc-f515a33c26e7@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1783596497-56CF57C5-92C8F9B9/0/0
X-purgate-type: clean
X-purgate-size: 2893
X-Rspamd-Action: no action
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:from_mime,suse.com:email,suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 367F3730529

On 09.07.2026 13:16, Andrew Cooper wrote:
> On 09/07/2026 10:46 am, Jan Beulich wrote:
>> With CPU policy dependency logic now properly in place and working, and
>> with us never enabling ISA bits in guest policies which the underlying
>> hardware doesn't support, the dual checks aren't needed anymore. In fact
>> in Misra terms they are dead code.
> 
> This absolutely cannot be called dead code, MISRA or otherwise.
> 
> We have a bunch of logic which is checking for A && B.  A and B are
> distinct objects in memory, with A always being evaluated, B being
> conditionally evaluated, and both having input into the final calculation.
> 
> We believe that in all cases, A has the same value as B, and therefore
> the logic can be simplified to just B, but that is a logical leap, not a
> transformation that any tooling can make.

Well, however much I agree with you, Misra's terminology defines "dead
code" thus: "Any operation that is executed but whose removal would not
affect program behaviour constitutes dead code." The removal of the
cpu_has_* checks here does not affect program behavior, so as per Misra
they are "dead code". Eclair would have a hard time spotting such, of
course.

>> In turn, a number of cpu_has_* can then also go away, when their only user
>> was the emulator code.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> In my build (with all the other pending work in place) this is a savings
>> of about 2k of generated code.
>>
>> A related question is in how far vcpu_has_*() are useful to retain. We
>> could as well access the policy directly, which would even be more
>> efficient when a "cp" local variable (or function parameter) is in scope.
>> Then x86_emulate()'s instance could also have its __maybe_unused dropped.
> 
> You'd need the test harness able to use a struct cpu_policy in order to
> drop vcpu_has_*().  It's doable, but isn't a small change.

vcpu_has_*() are already shared between Xen and the harnesses. A CPU policy
is also already in use everywhere. So I fear I don't understand what you're
trying to point out.

>> With the cpu_has_* being dropped I came to wonder why we have e.g.
>> cpu_has_lkgs. This particular one was added together with cpu_has_fred,
>> yet imo we better wouldn't add such #define-s when they're not going to be
>> used.
> 
> Older versions of the FRED series checked for cpu_has_fred &&
> cpu_has_lkgs, but I dropped the latter on discovering that Xen didn't
> need an LKGS instruction at all.
> 
> I think I will need in order to get the guest policies working
> correctly, so please don't drop it yet.

Sure, I had no immediate plan to do so. Such removal wouldn't belong here.

Overall - what does your reply mean for the patch itself? You don't point
out any change that would need making, yet you also didn't offer an ack.

Jan

