Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGriDHkp52mo4wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 09:38:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D2C437B5A
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 09:38:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288409.1568685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF5ga-0001Nn-RY; Tue, 21 Apr 2026 07:38:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288409.1568685; Tue, 21 Apr 2026 07:38:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF5ga-0001L7-Ng; Tue, 21 Apr 2026 07:38:20 +0000
Received: by outflank-mailman (input) for mailman id 1288409;
 Tue, 21 Apr 2026 07:38:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wF5gZ-0001Ki-3j
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 07:38:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF5gY-00DTgD-DA
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 09:38:18 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e72962-bab6-0a2a0a5309dd-0a2a4507d766-42
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 09:38:18 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e7296a-229c-0a2a45070019-d1558030e9a8-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 09:38:18 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4891d7164ddso11466695e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 00:38:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a5549f582sm13191255e9.33.2026.04.21.00.38.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 00:38:17 -0700 (PDT)
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
        d=suse.com; s=google; t=1776757098; x=1777361898; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=phBOziqZXh9EE62pJxbxmY03bAYvLJS7cJGH0nUQJLI=;
        b=KP558vMNMqYpHpjsm7uW6eBnutLcrxTLLIFX64m2ht+KyAcEyvzMFKz42hZQuCUcxr
         W0UE1EhONjsfZXK/LPdUI8pqTjVh9mzeRHs717oGjupwEt99yYYpvk5L4Px4J6VWX1wa
         zglciKQIjXeUJdz5kiTPVpGLn93hVwRPHmVlBXqAkeHDsfKjPvuN7Bmjy5A4YUoXCS+r
         dPku6OFBsopKV+4Q1QFXhTVNDsDLCn9/bKWHJiJuejipXgta2zOGSODCCnFZjMAvTDGb
         lrN2g4bMvATwQUIbYbP6cSITIzBLLdOUDMTl5MiRjpqwj7XeAsyg/m0i3dBfi4GJ3SAt
         sf2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776757098; x=1777361898;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=phBOziqZXh9EE62pJxbxmY03bAYvLJS7cJGH0nUQJLI=;
        b=VMi6l5fxXfzcGmb+Dp+ZSoK09+yIaMuvmBNigaDlPVZpxEMfDjd9iICyAETIq7fw12
         QwKRgO8u18rm5pWW5hhu5e1eKEqZLWiWgMz24Z2LVJLwVAnEb20neEKlAPgMMxTTrrku
         pRmCAFSJvFFE7Oy/zSvHD+zMQdU3TptXTEMK57/QeezevK5jE96zu4qEtJ57Uw0tQL12
         OZzAPpTHZnsy6mF9tDK8ta93UxTIuG+pa2lCrbx4pWCw12ShfRqnf49m8IKjg0DEAcUz
         pUpdh6OTMdaqOQQEIi9F3rAQryfSXSxD87dQlb2P3MDVTkE8IzgC9RwJcgGxyzi+k7aZ
         1gkQ==
X-Forwarded-Encrypted: i=1; AFNElJ8gG/NhJkxvCXb57v0bVj5QmTmPgojrXpHOkA27SyjzeRooCsKx9KYyLI7ZEK4FRvaCiTv+ews8FbI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyyy94CICSLjPyvmMtGd7dXe/mYSu7QkWgcpPuQD+U8TF4/o+mP
	qKjpD1KG6f0wePNzD2bv98Z1q079SX3KGxmFNIUcFoLI4/f3lVqtTiy3WXjXcO9J9A==
X-Gm-Gg: AeBDieu22csILXdd0XSVdmB8u4masy5troHqhP2iD/Oa/KL0PwdibireYd0SqEgRtID
	cGa6+le7J8jbuZ1NtJBNhXgxriLAU8tJd5Dy/JMzCIWXCCrdv6OywFANI/3xdtWZeQD7zIsGSGR
	xEbLRCPddZ/LRohgWq5Gp9rhp04OUE9YXoNwF4nJR1y2UuvtyZq23+qvwRSkmI09G/yDgrpJ/hC
	MKjmOge53RDm1LmdmAoAmSJSocl21eE7QV1EfMj5Eq0mih7qu2HMaFh/dbBNhyjAWJtCs4at7sI
	Lw+GvrgmKrOl6+VoBvjLg14ACQhH/nl5ogqzP3ZnaU/aVIBmoCsNE/rtavdb+xPXTGM0aNZV5wp
	nZaahUf1wGa0m1sA2z3872kRtfNq2fDuhDFCBblkXjfHNT++PdLlFVWnvFRuzAobbjOMPoyCs6N
	wAhAyfnLTiTwu7khTKYwpSNF9EdJK0aI16kyLI7PdRHYutQ1FIzTOjaRourAE9qLGNgcITEtaP6
	pFGLOD70rdYk55vcOXzucLjWw==
X-Received: by 2002:a05:600c:a30b:b0:487:2671:fb8f with SMTP id 5b1f17b1804b1-488fb74dfe5mr165197925e9.8.1776757097708;
        Tue, 21 Apr 2026 00:38:17 -0700 (PDT)
Message-ID: <2c8c5cb9-c5bf-4e79-a390-33b75c5c3423@suse.com>
Date: Tue, 21 Apr 2026 09:38:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/16] x86emul: support AVX10.1
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Community Manager <community.manager@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1e2ff012-b07a-43be-9ba6-290b38d3c97c@suse.com>
 <e23fa09d-b189-4c76-a22a-42df9fb9f9ef@suse.com>
 <a682a6fb-83cb-4240-a5c5-ce39e999394b@gmail.com>
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
In-Reply-To: <a682a6fb-83cb-4240-a5c5-ce39e999394b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1776757098-AE971C48-7A8C7A27/10/73395122804
X-purgate-type: spam
X-purgate-size: 2863
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:community.manager@xenproject.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 94D2C437B5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21.04.2026 09:32, Oleksii Kurochko wrote:
> 
> 
> On 4/9/26 5:03 PM, Jan Beulich wrote:
>> This requires relaxing various pre-existing AVX512* checks, as AVX10.1
>> covers all AVX512* except PF, ER, 4FMAPS, 4VNNIW (support for all of
>> which was removed meanwhile anyway), and VP2INTERSECT. At the same time
>> all vector widths are always supported.
>>
>> Note that visa_check(), replacing host_and_vcpu_must_have() uses, checks
>> only the guest capability: We wouldn't expose AVX512* (nor AVX10)
>> without the hardware supporting it. Similarly in avx512_vlen_check() the
>> original host_and_vcpu_must_have() is reduced just vcpu_must_have().
>> This also simplifies (resulting) code in the test and fuzzing harnesses,
>> as there the XCR0 checks that are part of cpu_has_avx512* are only
>> needed in local code, not in the emulator itself (where respective
>> checking occurs elsewhere anyway, utilizing emul_test_read_xcr()).
>>
>> While in most cases the changes to x86_emulate() are entirely
>> mechanical, for opmask insns earlier unconditional AVX512F checks are
>> converted into "else" clauses to existing if/else-if ones.
>>
>> To be certain that no uses remain, also drop respective cpu_has_avx512*
>> (except in the test harness) and vcpu_has_avx512*().
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Probably avx512_vlen_check() should have the avx512_ prefix dropped, now
>> that it also covers AVX10. But if so that wants to be either a prereq or
>> a follow-on patch.
>>
>> visa_check() won't cover AVX10.2 and higher, but probably we will want
>> independent checking logic for that anyway.
>>
>> Spec version 2 still leaves unclear what the xstate components are which
>> would need enabling for AVX10/256. x86emul_get_fpu() is therefore
>> untouched for now.
>>
>> Since it'll be reducing code size, we may want to further convert
>> host_and_vcpu_must_have() to just vcpu_must_have() where appropriate
>> (should be [almost?] everywhere).
>> ---
>> v4: Switch to using fallthrough pseudo-keyword. Drop new _vlen_check()
>>      helper again. Re-base.
>> v3: Add ChangeLog entry.
>> v2: Drop use of vsz128 field. Re-base, in particular over dropping of
>>      Xeon Phi support.
>>
>> --- a/CHANGELOG.md
>> +++ b/CHANGELOG.md
>> @@ -16,6 +16,7 @@ The format is based on [Keep a Changelog
>>        mitigate (by rate-limiting) the system wide impact of an HVM guest
>>        misusing atomic instructions.
>>      - Support for CPIO microcode in discrete multiboot modules.
>> +   - Support for AVX10.1. (Experimental)
> 
> Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>.

Thanks.

> What should be done else to have not experimental support of AVX10.1?

Someone to actually try it out on real hardware. All my testing was with
Intel's SDE.

Jan

