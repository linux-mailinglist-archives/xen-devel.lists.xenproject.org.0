Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD2CA9C34B
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 11:24:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967590.1357360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8FHu-00021k-3i; Fri, 25 Apr 2025 09:24:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967590.1357360; Fri, 25 Apr 2025 09:24:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8FHu-00020D-0K; Fri, 25 Apr 2025 09:24:02 +0000
Received: by outflank-mailman (input) for mailman id 967590;
 Fri, 25 Apr 2025 09:24:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u8FHs-000207-Mx
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 09:24:00 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04db3973-21b7-11f0-9eb3-5ba50f476ded;
 Fri, 25 Apr 2025 11:23:59 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-39c1efc457bso1417098f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 25 Apr 2025 02:23:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073c8cc81sm1808299f8f.19.2025.04.25.02.23.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 02:23:58 -0700 (PDT)
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
X-Inumbo-ID: 04db3973-21b7-11f0-9eb3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745573039; x=1746177839; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YL1JeHWZHkfCaHmk2y8qmdyiaUjZ0BhqFDXf/gZBLWc=;
        b=PCaxymV3THlHyJEffxkOj870Nf586TxNUWP6Xi17WlSAqbaZ1G+N+KeSEJEAYWza1T
         k/GSDnfTMcGzXNd+XJCooGA6726p8i9HIG8kx2r8rp2WsHvDZRGtw++PicdXZ4BWkFl0
         DoCr7pEGpQR+DLUgmUDJglPK2i7NmF+ZkpO9RIC/AAjdvXcbTXkMK+eUwByQXtLO7kkS
         IhUIowiiOteTESMqTPDt6lfoAHWmShqFx/xQsbXhihhQo0s624pB8MXUP9+Npb/PiHPI
         GCKusw6/GdOMKEUOIGhQhXPXeqT2Y2TsMk2mdYU+o8/AD52e8qO7iMm3FnTq01IcrJUJ
         lXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745573039; x=1746177839;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YL1JeHWZHkfCaHmk2y8qmdyiaUjZ0BhqFDXf/gZBLWc=;
        b=gHmuYoWUj9eieJe0r7cAYgxSQ/QCH3aiN7G7/2p/aVllDiUoG6YjXJNbhmc9nRdnZ+
         mcHfXebc7zXyfEjF2xAWvDj7I05Jpvl8DaSCRn2hXwRIscMmVzJzpxu11elMBoobQ7Kc
         SYx2Q3VsuWorWIgZort6yYWWPw8CTOZCBvjLIuPQ5TNZ7VfDzsnnQ498S7lGY8DIA20u
         GltFubQ6LJtfcIFzLjOKb9XIggHZb4US1bPCTso7UYzqqEZu7r4wEIidwyruJYv/CcfT
         EyqmkbEp/gksbz29ytE1LtBtjoAuTpmSTjcSiiHfgDMQX2QQxQyVOd7MNYPrzhcbh9Nt
         0PWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSt7X6NOUfRzis7B8SpNeAZsWqy0u7srXIj8RgnaHi6JK58MKk/atoeJGlIoyO9aNgEuH/G09obq8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxGwibG3fYVbiidWg+rJz5Lpa8p7iBwbT/89XMiyeC81IgqSbwU
	zMiam242JP8LZQe3ZQ2VbDAKnKuKqOjfTLKO7UbZG+FiNUNaG4vYHfRJp/C4XA==
X-Gm-Gg: ASbGncvBGZkudzZ6+5CheuIgtYw0LNyRjn06hHCkZ6u+MoEcxSpeVS9xlDRWR+zRLMp
	sqgFCGNTNEwbVghBroGm2nqZtCZlsQNH9tUVARWG+v2u7LIk2RDG6XaMf7gxZxenryZPWuzOn2N
	/gB+LNNJrsMegdonOVUXCeFwyaNScJ6mD67NmtsoyntqhE7c02Z1Wh+j5fEvCpzkPxioD1fYv5k
	/O3+wrEze9HCW6+gkDrVDrIN5nzavrFiySdmfaW21eFqLoLveg5cnRPBNXc2Y32QYey4yjnZvl8
	cfyT4saDGTGbmh0B54kSX1r/TvrsPSU/kG6Ij7/lANJmRAzKaxe2+D0Ffmg4CyAddJ2eF+rdRxz
	jLoBoQ43UgLhCYT96QPtet39yyQ==
X-Google-Smtp-Source: AGHT+IFbBMECwHqjdumjyUFCnWS4u2Z4n0cuqZfNYYGhiG3kI3FTzO9p3YjJvpRv3BBF711E4Lcefg==
X-Received: by 2002:a05:6000:2903:b0:39c:13fa:80b with SMTP id ffacd0b85a97d-3a074e0f772mr1045088f8f.12.1745573038885;
        Fri, 25 Apr 2025 02:23:58 -0700 (PDT)
Message-ID: <4b433cff-b39f-4603-bd2a-9cab71d75fdf@suse.com>
Date: Fri, 25 Apr 2025 11:23:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: UBSan bug in real mode fpu emulation
To: Fabian Specht <f.specht@tum.de>
Cc: manuel.andreas@tum.de, xen-devel@lists.xenproject.org
References: <l2jnq5cxgkzcdkndp3mjf76nd7wdp2pbstkqo7llaarmbfqdge@bxdydela4rcf>
 <40a5c44c-4ef1-4852-b441-ea65e31b2345@suse.com>
 <s6vpfyfzvp73va7geesgj6pmcuhebglqsz7vpug6c44c3qiawf@l3pxta3f7uxz>
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
In-Reply-To: <s6vpfyfzvp73va7geesgj6pmcuhebglqsz7vpug6c44c3qiawf@l3pxta3f7uxz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.04.2025 12:05, Fabian Specht wrote:
> On Thu, Apr 24, 2025 at 08:34:42AM +0200, Jan Beulich wrote:
>> Since ...
>>
>>> Similar code resides in the same file in lines 87, 125 and 127.
>>
>> ... all of these are shifts by 16, could you clarify what it is that you
>> want to shift by 4? Imo what we need to do here is add casts to unsigned
>> int, for the results thereof to be shifted (or use some extra arithmetic
>> to achieve the same effect, e.g. add in 0U). Or we could go and replace
>> the shifts by 16 with shifts by 12 (accounting for the later right shift
>> by 4, which would then need dropping).
> 
> I will submit a patch in the coming hours.

Since in another reply you said "yes" to the cast suggestion, I'd like to
point out that I was meaning to try the other route first. But that's not
going to be today.

Jan

