Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMyFJ0YAp2k7bgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 16:37:42 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4541F2C6A
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 16:37:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244908.1544265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxRnu-0006Hq-7f; Tue, 03 Mar 2026 15:36:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244908.1544265; Tue, 03 Mar 2026 15:36:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxRnu-0006Ey-4Y; Tue, 03 Mar 2026 15:36:58 +0000
Received: by outflank-mailman (input) for mailman id 1244908;
 Tue, 03 Mar 2026 15:36:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKVY=BD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vxRns-0006Es-F3
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2026 15:36:56 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd9398e3-1716-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Mar 2026 16:36:53 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4834826e5a0so67078705e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Mar 2026 07:36:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483c3b44207sm373396575e9.7.2026.03.03.07.36.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2026 07:36:52 -0800 (PST)
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
X-Inumbo-ID: cd9398e3-1716-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772552213; x=1773157013; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6BgO+d69eIe8i/1P9hdXQKHfptXMFDHOVG9lzJC1iDw=;
        b=X7UXLeLhxHstlGQinAFphtSe/lCsJ0rVEYPer7tGe6IEa8s1sdXCi9/hwYS9Y1PNd9
         9nvGgXYNG7kDyt3loK4AtJoqqDHrD5w7odHLpYu4JOXmrhL8MqNm95sDZoTrzlyqbNc7
         sZwVpJFqm9OOFB+UxWBjkuGduF9my0LKPRUsEWorMz2sXVdYyrjPdROMHT4zHGEvwTYI
         xXLr9Kn90JmmPRvWaR87gK6RyKaQIStnCcFKl/dfEMwZ98+9+QMG0b4Ll3PMgAyYcVUU
         CTirwY+bPM0qf9gyBPaRQwz5ZRPmGPXvN7m8nnq1qsfqTTmKqmkT4otzzQOXq4Ft/Cbf
         Q9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772552213; x=1773157013;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6BgO+d69eIe8i/1P9hdXQKHfptXMFDHOVG9lzJC1iDw=;
        b=Cm5ot3/qqateMyiokiHh4xe1CQ3Lsa69ZEhpk5GEeZLz6Q1u848oUox6hT/G5zQmb4
         5S+Frlo9TEbXr0ZpNyY4qQyzUWvDfhTHBcAif+05n6Ai+iafCqcO6G+dbjGHyZFWY8SG
         mwiC4NhcB+7Oh6Nh6EZZC0S7y0Vg1tFx1jKRbyh5su23a0CdBHTHBOrsQE33jSgzHaq+
         HrjYXerorUkrC8bGAvb84JOsMfimtImqr4mwItEurKOTbKbKOBpAizvLLEZ5zXdBb5YU
         H0A4lN0ROfMm/HOwqoVKAaN8pbaJ4P5rgKnjjzP4kEAPjLTIZ8Nddor1VrK6OcICwPS/
         Eh8Q==
X-Forwarded-Encrypted: i=1; AJvYcCX0xplRgi5+oNDTSKH25pJnm026r6bafOqWIc564f/ecay3zyvAS1ANNx0xDcYyA0KTlurqnP71Wh0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxQW0y8t6id6gfMm1iKjLRtgp9u4WXwsaxdjlp4aiP0ArklScJp
	QiHb1q5oZ6gVc+5Ksor/5LgBBPFlGXxId3mhyFdjj6wN5tm+EU12lSR04a1ILCVaUg==
X-Gm-Gg: ATEYQzz3E1GDYncJYkyvkwfFbR2F1wY3QETkkgT1K7PrNsRSSggK5pRARYgr06f4jDf
	7yhxOmfG88BRtbsRBLFyPJ3Cb06Yjah4Xd89mLozPfDtQsX2GpJie7njjTNK5qXUpXoBWOM+NzY
	N3B+nrdmlyYja/F42jp4mLsCvvK6C1qeEiaT+V4sgCWvqh0/c+/4ZfAGzzpPgx6V8oNgH01hr4t
	J0Zjthfaj+pN0h3gtGvbf1Cq7kEtCwBWSE+jMfTQQE/9cbboBKtdjUDrUXryLVIhxCHzxsLFO4j
	VAdaRTlQ8/pc0maGGjJHZHxSpxEjofCXn1AIiD1rEPLzrMVxqyXcop5ZXZQhcEMWSE/bgPTMglW
	Dd3QieRu5Hk/BeIdIXrIak1Xf/VEe/4pDdBdfg/Ag3XkGiNJLJ3KjaVym8reRbv0744wUVBoB7W
	fZWpV9jjGevU+H+gpmcZCcIIaoXUIFIqNvLwXQQl8a2vUjHI2tSVVasw+1vMjeEnyG5pcwBwjOe
	Asrd/phUxjcsFygy0l5iYL//A==
X-Received: by 2002:a05:600c:3486:b0:480:3a72:524a with SMTP id 5b1f17b1804b1-483c9bed89emr329853505e9.19.1772552212536;
        Tue, 03 Mar 2026 07:36:52 -0800 (PST)
Message-ID: <d5c0e218-bfc4-4f37-901c-b622f90b7bd2@suse.com>
Date: Tue, 3 Mar 2026 16:36:51 +0100
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
In-Reply-To: <B5EFCE28-79BA-403B-8F44-C4E7606BACE7@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0E4541F2C6A
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

On 03.03.2026 16:09, Edwin Torok wrote:
>> On 3 Mar 2026, at 13:59, Jan Beulich <jbeulich@suse.com> wrote:
>> On 27.02.2026 11:58, Edwin Török wrote:
>>> --- a/tools/tests/x86_emulator/test_x86_emulator.c
>>> +++ b/tools/tests/x86_emulator/test_x86_emulator.c
>>> @@ -1882,8 +1882,13 @@ int main(int argc, char **argv)
>>> #define decl_insn(which) extern const unsigned char which[], \
>>>                          which##_end[] asm ( ".L" #which "_end" )
>>> #define put_insn(which, insn) ".pushsection .test\n" \
>>> -                              #which ": " insn "\n"  \
>>> +                              ".ifndef "#which"\n" \
>>> +                              #which ": \n" \
>>> +                              ".endif\n" \
>>> +                              insn "\n"  \
>>> +                              ".ifndef .L"#which"_end\n" \
>>>                               ".L" #which "_end:\n"  \
>>> +                              ".endif\n" \
>>>                               ".popsection"
>>
>> Nice idea, but why multiple .ifndef, and why emitting the insn even if the
>> labels are already there (and hence won't be emitted a 2nd time)?
> 
> I think we still need to execute the instructions, so they can be compared against the emulator.

Of course, but they cannot be executed without having a label. We use the
label to point the emulated IP there, and then we use the end label to
check that after emulation the emulated IP has advanced as expected.

Jan

