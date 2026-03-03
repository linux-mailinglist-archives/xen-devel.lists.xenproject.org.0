Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mI5nK+0Pp2k0cwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 17:44:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C991F4064
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 17:44:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244942.1544285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxSqC-0007Xw-6y; Tue, 03 Mar 2026 16:43:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244942.1544285; Tue, 03 Mar 2026 16:43:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxSqC-0007V8-3V; Tue, 03 Mar 2026 16:43:24 +0000
Received: by outflank-mailman (input) for mailman id 1244942;
 Tue, 03 Mar 2026 16:43:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKVY=BD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vxSqB-0007V2-Ih
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2026 16:43:23 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 173c1733-1720-11f1-b164-2bf370ae4941;
 Tue, 03 Mar 2026 17:43:22 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-439b97a8a8cso2319868f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Mar 2026 08:43:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439c4489279sm2911056f8f.20.2026.03.03.08.43.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2026 08:43:21 -0800 (PST)
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
X-Inumbo-ID: 173c1733-1720-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772556201; x=1773161001; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fVfSyzCJ07n5V8La9UVEMBtwFP68oj3ioMWaN4GLNUw=;
        b=cKzUAoF70FDBVDKOCr8eMsmqKvwid+U6liUniSISdEDkYCiZ0VJSOQOUpFxGYPZRDG
         ymJmUAJQhg7NLdfMLFw25dPAPjOiVkFYyekjuR03E10H63kf6MPzVdSUrZNTWFlwFlst
         0zmCWprawE9oKNQEAETn2W1Yao4yinDH7gyug1y0RIhAYqSJt78mZphFnn+9RPE/Ba2y
         GwnaEDsHY/Lry1YUEnmkMZt9GOxmeXcNiGsxvBEQPbcYncCMsm/Qgy6mxM1DLEWbSEpA
         e4Mwwwo5eC2z2WdeJGuhQP7rjZxxdt/gLyhnfITywxIW95W+Jquh+Zily3Gxaz4ymsu6
         1Jxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772556201; x=1773161001;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fVfSyzCJ07n5V8La9UVEMBtwFP68oj3ioMWaN4GLNUw=;
        b=UQbLZ9Hp436nEzpH9/OwuD2oAhIpvfuy4YfDaP3X6/xkCjQAMu9DoP6LxzlS+mwlYW
         lvtucXlC58WNz54rEiJhjbSHhN4lCzCTLoGkRJTzm/50Sn2581cw7LPJ0hfblRZddiZ3
         a1k0v4oHnXQuuw1Umw6uWrk7pOT8P+6LDeCmWcmlpOc3V6CBsCa+MVEfmF1qfDyRbYl7
         gezxdoS5/iQ5XilHdZTXmj8MY8KOAJOuFOcNFY60NYcIUIKKmBtPUN2sJY8Mj8F0NDcE
         Hsvk5CsBk4kM7KAL6x3fRp+yQNLb9/+R5Thdxn3a0U8CJtFFBE7FFckzyM7fC47WKvTv
         OGuA==
X-Forwarded-Encrypted: i=1; AJvYcCWXMSVil519MTLCm+7up2gS/6bqkquwbbRIsr4v4re9QS1YgJe0SVEp/LGcnc37J5AgMIhoFKw2whI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVaTAampdFuBNWKJ1N2uSdrVS79KJdMt5Xj5qiNoZD6Xq0cRvd
	cWYEGvZf0vK3rw372rwQx7WKloSXwkRdZlnftZPXq6yOsKX9aSgrco5GJ1wJ7t5P/g==
X-Gm-Gg: ATEYQzzzz1PUhJ5AslJcGLkVHlz9Trz03TYvwPjxROx+LVt1/MG4AeHhkuzJMRKBFUm
	I31O1uB8jb8lDTQnmZc4X1Oyd6c4xGKQpPSQpwf8BwaYlX6BKasIL3k6BM5zL8Qe8wDW4lUft44
	lTk397SyedA4nusMXxbfMAiPFEaYssHf6mu4THZdmWwPB6jBc0sNFpEejvJ9kipFj9F97o2+rYH
	zsEM14zf9rNz/y6TX7HVEY4es/l8xLusEaSl3iZirOxgldtjuWbaFssri6stjc2Bi1FSblD0DuZ
	qIlQjPKsIO6e68lM1KAkYXLKQRlhY0rTc5VCWx6bfk9E45nT9HnNJEG2/Cu/zCrcyQXVwOBBSFm
	4ZCAX5WBwDy78Xr4I9kQG0qWfDSVNUIfhM0w/kE5aCr6CrguemYton4bvtkzwQuxnHTHi1QRM4m
	FB8JWJcMsWj4o952j/IEuW0O4hkLIn+h/5evCVPAKrrY+vDCjTvFs3w+82rzecfuBYsfsrS5bbg
	S9JE3Gvf874870=
X-Received: by 2002:a05:6000:25c3:b0:439:be67:a038 with SMTP id ffacd0b85a97d-439be67a710mr8902339f8f.41.1772556201554;
        Tue, 03 Mar 2026 08:43:21 -0800 (PST)
Message-ID: <0210cf5c-6dc3-4db5-aa2a-0e14e634b463@suse.com>
Date: Tue, 3 Mar 2026 17:43:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] tools/tests/x86_emulator: avoid duplicate symbol
 error with clang
To: Edwin Torok <edwin.torok@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1772189234.git.edwin.torok@citrix.com>
 <358a87d89d50475a57f2a5d6ebea01d95a1df6d7.1772189234.git.edwin.torok@citrix.com>
 <766824c8-2ec5-45bd-9aed-1e84ad3ff779@suse.com>
 <B5EFCE28-79BA-403B-8F44-C4E7606BACE7@citrix.com>
 <d5c0e218-bfc4-4f37-901c-b622f90b7bd2@suse.com>
 <004F02CE-B8C8-40B5-8453-C754EBE92022@citrix.com>
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
In-Reply-To: <004F02CE-B8C8-40B5-8453-C754EBE92022@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 10C991F4064
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:edwin.torok@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 03.03.2026 16:55, Edwin Torok wrote:
>> On 3 Mar 2026, at 15:36, Jan Beulich <jbeulich@suse.com> wrote:
>> On 03.03.2026 16:09, Edwin Torok wrote:
>>>> On 3 Mar 2026, at 13:59, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 27.02.2026 11:58, Edwin Török wrote:
>>>>> --- a/tools/tests/x86_emulator/test_x86_emulator.c
>>>>> +++ b/tools/tests/x86_emulator/test_x86_emulator.c
>>>>> @@ -1882,8 +1882,13 @@ int main(int argc, char **argv)
>>>>> #define decl_insn(which) extern const unsigned char which[], \
>>>>>                         which##_end[] asm ( ".L" #which "_end" )
>>>>> #define put_insn(which, insn) ".pushsection .test\n" \
>>>>> -                              #which ": " insn "\n"  \
>>>>> +                              ".ifndef "#which"\n" \
>>>>> +                              #which ": \n" \
>>>>> +                              ".endif\n" \
>>>>> +                              insn "\n"  \
>>>>> +                              ".ifndef .L"#which"_end\n" \
>>>>>                              ".L" #which "_end:\n"  \
>>>>> +                              ".endif\n" \
>>>>>                              ".popsection"
>>>>
>>>> Nice idea, but why multiple .ifndef, and why emitting the insn even if the
>>>> labels are already there (and hence won't be emitted a 2nd time)?
>>>
>>> I think we still need to execute the instructions, so they can be compared against the emulator.
>>
>> Of course, but they cannot be executed without having a label. We use the
>> label to point the emulated IP there, and then we use the end label to
>> check that after emulation the emulated IP has advanced as expected.
> 
> Oh that means that we won’t actually be testing anything useful in iterations>=1
> (the test passes, but it runs the same test as it did on iteration 0).

May I ask for a little less bold statements? Of course the 2nd iteration isn't
identical to the 1st. The insn encoding is the same, but the operands (the mask
in particular, i.e. the value %k3 holds) aren't.

Jan

