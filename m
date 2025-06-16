Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DE6ADA8B9
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 08:59:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016692.1393650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3or-0006KX-E2; Mon, 16 Jun 2025 06:59:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016692.1393650; Mon, 16 Jun 2025 06:59:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3or-0006I7-AR; Mon, 16 Jun 2025 06:59:49 +0000
Received: by outflank-mailman (input) for mailman id 1016692;
 Mon, 16 Jun 2025 06:59:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jh7D=Y7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uR3op-0006Hu-H5
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 06:59:47 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d072ce1-4a7f-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 08:59:46 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-606c5c9438fso8619813a12.2
 for <xen-devel@lists.xenproject.org>; Sun, 15 Jun 2025 23:59:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adec8158bdasm597539666b.20.2025.06.15.23.59.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Jun 2025 23:59:45 -0700 (PDT)
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
X-Inumbo-ID: 7d072ce1-4a7f-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750057186; x=1750661986; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0hOz3wq7rBMYcnCqYbyC3PEVumVIfMb9w57iEP5bteM=;
        b=KXT9IdEkNb5IZyUOS8Rcsr7+xWYRCJ+VwiT1D0tYi2GqUoolob+JdwTqmjLUQ5qDJ5
         GSu59RTkl2pw0W5u47pnOZhPBXu782Sce4GxEYrGi4k5dQtEKVklAFJPq622N3q3TzPt
         cxaljDkVZXT2peyK/wTh30XMSq5TbuhkDWPhvAhPgWseeSOhb6iltCJhWMXoSLv6su5D
         4hcChL/9Ubs8Pd/AGJnlex7QO7u0Awece6lVHJlfQjIG/hLCWPbs+ruGP6JUg5q4M69C
         QCa6sMKcjko5OEf+Dl5GkLzoKhzLkWtbJdyi7zVSINiM1oYomysCKg1W4L7aZTiWPQzd
         A1tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750057186; x=1750661986;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0hOz3wq7rBMYcnCqYbyC3PEVumVIfMb9w57iEP5bteM=;
        b=e2h3AvK6ocfAWL+XPEpyxLXwxoZwow+6AI5UYX11MPCL7P51qRRB/QQSzxFjzKwVgh
         4/eVl5bWzg/Y1Lq4a2md93321LDmsj/rqisocPHHmjLlWDhifGiotMCwziRw1MDdH/Fg
         NV6N/UgZ+sD2k+/GPvsljV/BQ59LA6nfmwXLf/aD6LK5aS6HO64RcQ7hq2R8epWSjsUJ
         zJAtKHRO9NpTRJXavRZK+g02A9kBLIriZrJgpnbDca9irBizYxmMglmQt9Vfm4v+h4Qe
         sgQYeKDrNRLpc4y3dHuamBpNVq+iK7Wlv/kCgRSRrjIhX/ic4CR0EJ0XmvOLvluDYrH1
         Gm/g==
X-Forwarded-Encrypted: i=1; AJvYcCVZBSEO04jC6rch8EhX9pQsleRBlL27W1HtOiD+gRHjGqkutwHIMa9L1351gP4Dq3GPgWjlBEbiXiU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyg8Xm8h/J3sn79MIB6lS8sucR9xo3VYaATQsj8tm1FPefsfXuW
	g8xxPN7FwHMhVL0hmoHOvvaHUmqj1tHsQLc35x7fVyzrAcQlpGC1ml9PF4lJ4JfL6w==
X-Gm-Gg: ASbGncsAfrb3pMa1s8+G7mnbIOJ9hRBcO/tc6KVYoz88YxD2D9Hs+a/gLlISOnPP2zc
	k7GiAJ5IdpRD/YclGDtwDTEK8ePczTwvzcZXRygFgIn2+/z1vsNlY6MqFYT4U5Jo45Tw3TXJAzd
	7keipZKSjMxMRhoHaCwMrJIxD6Q9XmfyvKZ758myFOy1HFEEnV/cOmpxXfU59mRf/cjjw5Rslwc
	zCEg3hWWeb48SpUjHU0ToxFvJQ0tKMhiyya7cVr5JBrCBKd1rdYW9LxUnvg1RcLEvMdgIHL/ULY
	WvaXAeiQiQEWTfc2g4/njYKGIe9WpYxuoaL7I7ZzhwovKcqRuGP0OsFT6CtADwfqGZbSSiluj5h
	iu7sDkjg1fhwegtp70qDj6WbY4H8T2PJiqtoHlHpB7bfmZAI=
X-Google-Smtp-Source: AGHT+IGpaiRi0PsvnZCKAAbFPnQd0k9JBybH154fLCF8xAclGeVV7k8oYjhv+7K6LuMzlOBw8hmqRg==
X-Received: by 2002:a17:907:97d5:b0:ace:c518:1327 with SMTP id a640c23a62f3a-adfad309382mr722513266b.14.1750057186165;
        Sun, 15 Jun 2025 23:59:46 -0700 (PDT)
Message-ID: <79722683-cd29-4b38-bd93-ef9458f95056@suse.com>
Date: Mon, 16 Jun 2025 08:59:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/14] kconfig: Allow x86 to pick CONFIG_DOM0LESS_BOOT
To: Alejandro Vallejo <agarciav@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250613151612.754222-1-agarciav@amd.com>
 <20250613151612.754222-15-agarciav@amd.com>
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
In-Reply-To: <20250613151612.754222-15-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.06.2025 17:13, Alejandro Vallejo wrote:
> Without picking CONFIG_HAS_DEVICE_TREE.
> 
> In order to do that. Allow CONFIG_DOM0LESS_BOOT to enable a subset
> of the common/device-tree/ directory. x86 doesn't want dom0less-build.c,
> as that's tightly integrated still to the ARM way of building domains.

Which then is grossly misleading: x86 also ought to select HAS_DEVICE_TREE
if it wants to use that machinery. Instead of theis an the previous patch,
I think what we need is a new Kconfig setting to control the use of
dom0less-build.c.

Jan

