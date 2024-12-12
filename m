Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 529269EE423
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 11:31:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855679.1268519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLgT0-0005BY-PY; Thu, 12 Dec 2024 10:30:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855679.1268519; Thu, 12 Dec 2024 10:30:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLgT0-00059O-Mj; Thu, 12 Dec 2024 10:30:46 +0000
Received: by outflank-mailman (input) for mailman id 855679;
 Thu, 12 Dec 2024 10:30:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QzH2=TF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLgSz-00059I-VI
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 10:30:45 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24ebc80d-b874-11ef-a0d5-8be0dac302b0;
 Thu, 12 Dec 2024 11:30:44 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-434a736518eso4685505e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2024 02:30:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa69afa395csm449919266b.71.2024.12.12.02.30.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2024 02:30:43 -0800 (PST)
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
X-Inumbo-ID: 24ebc80d-b874-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733999444; x=1734604244; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TrJ/D3rbPGQe4yyzZZUi7eBLXXQ8mzVAZH0cIW0dtWw=;
        b=efVt+notNlQ9Cxrj4FvZ2DSkfzD2lfZvvpc3ooT8MXairh7c0lsCZAn/i1ydvssyqo
         UySwnsQzZTcx9tTHFbZHKmk9n/wKxJWzvDrMTvhLacByBO5NZxRx74mpeq5HSmrCV1T0
         IrXLMZ+kK2ypKFzR26xFNATz0ufOoKT4zZLnIfAuflWFneuqs5dGTyP1Dt0YpNsO3f0N
         IeQ4gdcqcQ3u5CADrxd4Yrs4SYfksZmSkrBVoMKatvYyWTjTnIA9zc1pcLYkFjr7iFAu
         D4j4pzp9EzBIMDY9sU5385SvL36f8T9tKB4FFElvWUbm9c3WS1113+7GxGin03X6XjO9
         mHbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733999444; x=1734604244;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrJ/D3rbPGQe4yyzZZUi7eBLXXQ8mzVAZH0cIW0dtWw=;
        b=KTnx2cVo6OMY3dVzKahqDHV4AiHevuyvqbTPDIc2sRnJqYT0vplvhbvjlIxeyEXxBt
         Yl9y5ypZVPkkXZbMTPYWg6aWqRW0WRT5wkZWMLIFlPF0xPn2/jYm5tDkpkz0jdptipLn
         vLbOBwADRpxHSDFvGLUC/PAj1lIex6x8Y3jrcBnBVKKHjEbRoypy3G4dgbpqwpVFnwjl
         VbYDLlnLrBLoHRwhb+sQV8vMEobYuO7xsGqRvdZCM0LPTX1AX4xgQx2ZBMsPTyfo+Nab
         9HP4gJr39JfP/g27VIpfQq6oUOoaJudd9cfHLB5PUMnG6r47anhgPrDFwkPKhW6VSPet
         ZEVQ==
X-Forwarded-Encrypted: i=1; AJvYcCULFevLrnKoiZGb6/ciDwYw+JN1FeU1AEhDvI4Rz8/riob4zv3AMMevopZtXiJuVKCvzNkyBsyRGqM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzTltd4MNO+IS6Y58sF5+bj6vhF79hwfdtMtaWS24RiQc3TnFFd
	Fslncdq2LlI6QryR4/ygMk6LD2Z963odrqBqFkYcjGSEgATVd5+mmijAH1Z3Jw==
X-Gm-Gg: ASbGncvJFPBSB6OrMuMZi8W3M+TQlVYvkYK2L2AlusXlJrZ7wsv3gh8eQoRq+Om/hro
	+KyeSE7PTQQw78nqzzpvvgXXK0HTDvePRsKEDYyKHvzqsPjg+jg0Fmti3u64fsGCJsXxSbNttxl
	uiG2t2simwNJwOODiusvsNtotjsuzejxJWzqcb1kNKbDfdjagOOR9jDLQDaDrOf1Pf7/ETJZ3bv
	aDbpIfWyatWAaHApqe52KeaW1rxJ7XHuTn7vzGc/BTTcJ16etq0JmqDiDgsLInrLRFAj1zSbDC+
	XsQS1KuVmI+8Qldw25sJhsr+lD3phIDBTSeW2JVkgg==
X-Google-Smtp-Source: AGHT+IFFxia2esVZkvufQzKTQuDr0Fvealab5JMGSd1y+R/I3V0BYmxzC95TtbVJ1vrMjqH/F2PsJQ==
X-Received: by 2002:a5d:6c6c:0:b0:385:df73:2f42 with SMTP id ffacd0b85a97d-3864cea3b4bmr3969864f8f.32.1733999444282;
        Thu, 12 Dec 2024 02:30:44 -0800 (PST)
Message-ID: <2bc2b412-b567-45ce-ae8b-4f22b6e212f1@suse.com>
Date: Thu, 12 Dec 2024 11:30:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Add stack protector
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20241211020424.401614-1-volodymyr_babchuk@epam.com>
 <f1e86e0e-985a-41ae-a94c-979288275257@suse.com> <87pllx3gib.fsf@epam.com>
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
In-Reply-To: <87pllx3gib.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.12.2024 01:13, Volodymyr Babchuk wrote:
> Jan Beulich <jbeulich@suse.com> writes:
>> On 11.12.2024 03:04, Volodymyr Babchuk wrote:
>>> Both GCC and Clang support -fstack-protector feature, which add stack
>>> canaries to functions where stack corruption is possible. This series
>>> makes possible to use this feature in Xen. I tested this on ARM64 and
>>> it is working as intended. Tested both with GCC and Clang.
>>>
>>> It is hard to enable this feature on x86, as GCC stores stack canary
>>> in %fs:40 by default, but Xen can't use %fs for various reasons. It is
>>> possibly to change stack canary location new newer GCC versions, but
>>> this will change minimal GCC requirement, which is also hard due to
>>> various reasons. So, this series focus mostly on ARM and RISCV.
>>
>> Why exactly would it not be possible to offer the feature when new enough
>> gcc is in use?
> 
> It is possible to use this feature with a modern enough GCC, yes. Are
> you suggesting to make HAS_STACK_PROTECTOR dependent on GCC_VERSION for
> x86 platform?

Only kind of. I remain yet to be convinced (or formally outvoted) on such
wanting to live in (only) Kconfig. I actually proposed a hybrid model [1].
But yes - some time of build time dependency.

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2022-09/msg01793.html

