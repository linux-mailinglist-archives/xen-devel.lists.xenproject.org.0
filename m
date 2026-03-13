Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFMdMyq5s2nbaAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 08:13:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8014927EA04
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 08:13:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253284.1549562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0wiE-0004qB-VH; Fri, 13 Mar 2026 07:13:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253284.1549562; Fri, 13 Mar 2026 07:13:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0wiE-0004ny-SR; Fri, 13 Mar 2026 07:13:34 +0000
Received: by outflank-mailman (input) for mailman id 1253284;
 Fri, 13 Mar 2026 07:13:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uwFZ=BN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w0wiD-0004nn-GD
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 07:13:33 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c4d09f0-1eab-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 08:09:16 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-439b97a8a8cso1866786f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 00:09:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439fe1a78cesm14389330f8f.11.2026.03.13.00.09.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2026 00:09:15 -0700 (PDT)
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
X-Inumbo-ID: 8c4d09f0-1eab-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773385756; x=1773990556; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rNQqkakXkY5AZuL5k/v2o9SVFrUQhvFa7P0eANxrizM=;
        b=ekv468Oxeb5Z5DzlSnrmk691A0fpC9UdUb4GdNzmoSAufyVAJx1NzMjCwdIg7by4n9
         T7OYfTNwsl/6kI73dhV4TReCuVZ4PRO0Uud6M7ggyZAzVqD9+MTm06/PiT8KTBF0Ai9a
         HD9aNqd8L8iP8VKUhuS1K/y/zMzgjtEjAT4ALDKvBr7xI5SucmJDe1dpy/eL1x/KpCQY
         QA+stSSj0vFXYit2VZt6T2GPTLVYpMufvA6ai13/PF3swvUN553Na4td+5/DCPKipium
         gGqZA4z6G8HyNqdmONH4gs4HRP2WSviNcN7jF5IcFUY8qjZBACV4uNxEp98PW6dO9UG4
         nMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773385756; x=1773990556;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNQqkakXkY5AZuL5k/v2o9SVFrUQhvFa7P0eANxrizM=;
        b=Ed7VaXtGsVG1Z3eLXJ1quDAEAoGlrXK+t/EsON617qq0wRctCEF2TklfTBPC7FqNHW
         7osjnusuFFNpdkd8t3YQhVr4dtek0IINyy91NfGqbLVHCLO9OOpg0hdVlv7JxtDso13+
         YNPLffvYUu64BI/2MuhfCod5nmakBU0kPTlSkayMDTxxnzI0RGwppfwFsJD0iHXHxWJB
         lAkxKm3hpva6oGcIb/Z3i0sXm3px3JYKSArItCC2DZYvgdwC+IdumkDI04ZBlOfKFiv2
         Q5yPn1cBtMVofAPTK2SSwROt3t2Q2TBDtyTwlNa3VC4WYbLEwCnnXRux/RMb1q3fXQWg
         LJSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeZMfqt5k3JP6XhTIqYflerjwQA2n77BKmjjC5rRPkCa4UaD8OZpcSJvOdttAbIHEanNp/axkMe5w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxPDwrRAopCX6gJ56+M8rDc+XwZyxS6qLnpgJGFPCB5Wr/BwwaI
	2ZNPhXByYX4z/0fh+fAmDKNHuZWu+YWwkv4nQbuMeBFnEzgCOJ3CI/RIzRo4zv16QQ==
X-Gm-Gg: ATEYQzzAx6fYtdwtcpsLtwc16PbPLuPQ+lm6vABhdVHE3yNIu6UHaHls3D9E1MrWhhJ
	xG8rhDGeb2moXzDjkyaAA6nTdzreMd+pgwYPEY/XReJcnbl8H6FrDfuTAfVl17ftz0T+FqNyvBo
	Hgi3i29VhWfuAij3dekEXtBwxPiMuf+9Kr0Cq7EW/kh5wK8/WWTckF2MK6Zd16SXJb/5m7FRQTr
	kBIxw+RPK6EZCHQtBYNNGTLMVH+YblLPhWz0+calXbho0dueT2dNzpysOw5duXcvJWr7C7YyWBw
	p/TcF8L/644P7gj9hPqlt14s65orJ936WB/uoCjNUIpLI1PDFvKhOqnDgww1u8urborzdYh/Cyt
	1QSW+mOgZfeRXK5UcWfe9/HG8yYX62sOuPF2dvIGzkMNBSzsUVIn+Wo6vJxtbOOcEvxO6vuQhJ5
	n4rfAIR0DrtThZR4FD2uCU4f/U86teE8Mr8QKOeHbvyQDWoSbQjoXVoQUPcHygaiiTBnag53qOv
	P8gJ+85NY17RVs=
X-Received: by 2002:a05:6000:1847:b0:439:bc31:a056 with SMTP id ffacd0b85a97d-43a04dcb7fcmr3876604f8f.51.1773385756169;
        Fri, 13 Mar 2026 00:09:16 -0700 (PDT)
Message-ID: <71ca64fe-63ae-4644-96ab-6912ecc0c8b4@suse.com>
Date: Fri, 13 Mar 2026 08:09:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v v2 1/7] x86: Remove x86 prefixed names from mcheck code
From: Jan Beulich <jbeulich@suse.com>
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: roger.pau@citrix.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20260312204339.740403-1-kevin.lampis@citrix.com>
 <20260312204339.740403-2-kevin.lampis@citrix.com>
 <abbcce95-836f-4a06-a250-4480061ac3cf@citrix.com>
 <7d4bd6e2-efcb-470b-a82e-83e693d28993@suse.com>
Content-Language: en-US
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
In-Reply-To: <7d4bd6e2-efcb-470b-a82e-83e693d28993@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kevin.lampis@citrix.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 8014927EA04
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13.03.2026 08:04, Jan Beulich wrote:
> On 13.03.2026 01:01, Andrew Cooper wrote:
>> On 12/03/2026 8:43 pm, Kevin Lampis wrote:
>>> diff --git a/xen/arch/x86/cpu/mcheck/mce_intel.c b/xen/arch/x86/cpu/mcheck/mce_intel.c
>>> index 839a0e5ba9..4d6b7d588e 100644
>>> --- a/xen/arch/x86/cpu/mcheck/mce_intel.c
>>> +++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
>>> @@ -711,10 +711,7 @@ static bool mce_is_broadcast(struct cpuinfo_x86 *c)
>>>       * DisplayFamily_DisplayModel encoding of 06H_EH and above,
>>>       * a MCA signal is broadcast to all logical processors in the system
>>>       */
>>> -    if ( c->x86_vendor == X86_VENDOR_INTEL && c->x86 == 6 &&
>>> -         c->x86_model >= 0xe )
>>> -        return true;
>>> -    return false;
>>> +    return c->vendor == X86_VENDOR_INTEL && c->vfm >= INTEL_CORE_YONAH;
>>>  }
>>
>> This breaks P4.
>>
>> It is not safe to write expressions like this, and I've already
>> explained why.
> 
> Plus I had asked whether the comparison needs to stay at all, seeing how
> Xen has been 64-bit only for a pretty long while.

I realize dropping it altogether would break P4 too. Looks like it wants to
be c->family != 0xf (assuming families 18 and 19 are to be included).

Jan

