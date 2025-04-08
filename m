Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1323DA81062
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 17:43:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942472.1341614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2B6N-00018I-Rl; Tue, 08 Apr 2025 15:43:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942472.1341614; Tue, 08 Apr 2025 15:43:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2B6N-00015w-P4; Tue, 08 Apr 2025 15:43:03 +0000
Received: by outflank-mailman (input) for mailman id 942472;
 Tue, 08 Apr 2025 15:43:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2B6M-00015q-SN
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 15:43:02 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27651bb6-1490-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 17:43:01 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43cfdc2c8c9so33635475e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 08:43:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c30096964sm15346356f8f.15.2025.04.08.08.43.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Apr 2025 08:43:00 -0700 (PDT)
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
X-Inumbo-ID: 27651bb6-1490-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744126981; x=1744731781; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QwuDHEKmIPuqjzKqtJCqsylf3l0M1F2UZNCBafrouec=;
        b=KHQSZoFyJ0CBTIvo8boERcdolMWm5HjVdO2wCSxg7CsM1UO8bjNWTFGS4rmsUCy39U
         9ahcMbLqoZBwVCW/P+aGEomvC8lD96uRtqnTat30l+shUXcD0MyFkDBe3mkyMBSTsrJc
         GoctXaYR6FmX7FtGGTLywnniSogSZ/6pTHq65+ivaBkwgtuAKtdlW3Y2QLVsgSTkuVY4
         VgySq7Pn+D7QaQN2R1BwGOUwKfGfTSajqKkPcb3k3A6SDleXuTgq9bUbnlBNcpV5ovyH
         XyzMHZMG0KoFBAknU1/K+2NfWo5smMggfLzvyBM9yvIP4nzm6zNYHl8xZj/uOsgPq4An
         TeGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744126981; x=1744731781;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwuDHEKmIPuqjzKqtJCqsylf3l0M1F2UZNCBafrouec=;
        b=MkO1vY2UOgRYJrmL1Uc7GnJ3RpSWApZekblDCDcZkn+OMvWGljLQeOum++TZRDUwde
         3G4c4ewHUSo1GvrhFJa96eoz4gDvYCZ6cDVR3e2NXEpu34tIpqCJdlvbOwU6ySGdE1t/
         1/Iwlr7Nnjmc/+xyliic2xpTs+75oYl9RI6IVb1+l+5duWqay8CujA2h6cmCFBkPNsPR
         P7yIuoFm9PpCS3oiI46QzeK+9V3gy1XhvQENkqYs6bO8/NdypM+GN7sUBdj224+r9qdH
         J+cNNyAvlLZoZCV/jFE6mZY+wsRfl8rL9bhoBnNFPi8/JIQ8rQFKxytgeG72ojqRczS6
         LFJA==
X-Forwarded-Encrypted: i=1; AJvYcCV++BVYkWKcCpCiiLnms167MRYd8gfs+bjegv1Nsokkn2Rzn+HouuElLv5etpH9lHf/4Ej+FGUEWRg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzUQUR6yHN/CEupSV56be16mRDeBxqvgfYmlEAYZkmMR5S1ywG5
	U3rPsWAYpXqUdR6tWFAZcDy7t3iqYszLRJzaZJdNa+RCxg1YjWm+0JMumMFGOw==
X-Gm-Gg: ASbGncv8jxL0H8YQD4KW5K3s6eEniY8raTW1lINkH/3c9Oiz3And8zUuXAYA5q1Eb50
	CUtvejoFBqLdngjxQ27VyiPOk4kqcuomTaWju9eH+A2CqUP77XEP5ml7dMpCVzOz5FPLSnLr7Xl
	AMlv8GLZuB6qBNdO627H1TvX4+1X2ThUP5hkf0drpnTADVB0brCKIqlsh0qFTVlj5dizO5GgJLA
	74E2MrITyaPQsJD59kDoZ1UshTNAK8tkH9StZZUaWTjH2c+cE8mxRG8n6q5ZXII/y9AxStBN8Of
	Wh5F3gSYRLyUo817qxZb3OJ0CtvAmEOe7C3J638PwEV6JPyy4WxFsvZ1TNpnve55h5uES9dtEc9
	Zt2WnmDbEAq1aBT/cQGjqak2YP0nD+A==
X-Google-Smtp-Source: AGHT+IFmhkCS0cXbG2o7KRjaWZwL754XSVlcXujbAhcS/LKLlfQB4PT5caYGiVdD4hCFhAdix+7kJA==
X-Received: by 2002:a05:600c:5814:b0:43d:cc9:b09d with SMTP id 5b1f17b1804b1-43ee0b1a288mr77080205e9.20.1744126981255;
        Tue, 08 Apr 2025 08:43:01 -0700 (PDT)
Message-ID: <5617f7da-e7ed-46a0-b77c-f8372833be4a@suse.com>
Date: Tue, 8 Apr 2025 17:43:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] xen: debug: gcov: add condition coverage support
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250407164608.2558071-1-volodymyr_babchuk@epam.com>
 <20250407164608.2558071-3-volodymyr_babchuk@epam.com>
 <abf11b31-0bf0-4add-a49a-17d7723c74f2@suse.com> <8734eifyts.fsf@epam.com>
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
In-Reply-To: <8734eifyts.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2025 17:38, Volodymyr Babchuk wrote:
> Jan Beulich <jbeulich@suse.com> writes:
>> On 07.04.2025 18:46, Volodymyr Babchuk wrote:
>>> @@ -133,19 +134,18 @@ $(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): CFLAGS-y += -DINIT_SECTIONS
>>>  
>>>  non-init-objects = $(filter-out %.init.o, $(obj-y) $(obj-bin-y) $(extra-y))
>>>  
>>> -ifeq ($(CONFIG_COVERAGE),y)
>>>  ifeq ($(CONFIG_CC_IS_CLANG),y)
>>> -    COV_FLAGS := -fprofile-instr-generate -fcoverage-mapping
>>> +    cov-flags-$(CONFIG_COVERAGE) := -fprofile-instr-generate -fcoverage-mapping
>>>  else
>>> -    COV_FLAGS := -fprofile-arcs -ftest-coverage
>>> +    cov-flags-$(CONFIG_COVERAGE) := -fprofile-arcs -ftest-coverage
>>> +    cov-flags-$(CONFIG_CONDITION_COVERAGE) += -fcondition-coverage
>>
>> Why's this inside the remaining ifeq(,)? Surely there's at least a chance for
>> Clang to also support the option at some point?
> 
> Yes, but Clang uses different option: -fcoverage-mcdc. I see no sense in
> adding it right now, as Xen does not support version 10 of llvm
> profiling format, in which they added MC/DC support.

Okay, but then can you amend "Clang is not supported right now" in the description
by another half sentence clarifying why that is?

Jan

