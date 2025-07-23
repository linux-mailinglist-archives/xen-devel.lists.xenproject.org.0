Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D4AB0EA43
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 07:59:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053238.1421965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueSUd-0004US-SS; Wed, 23 Jul 2025 05:58:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053238.1421965; Wed, 23 Jul 2025 05:58:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueSUd-0004RL-MD; Wed, 23 Jul 2025 05:58:19 +0000
Received: by outflank-mailman (input) for mailman id 1053238;
 Wed, 23 Jul 2025 05:58:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFh9=2E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueSUd-0004RC-2w
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 05:58:19 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe685605-6789-11f0-b894-0df219b8e170;
 Wed, 23 Jul 2025 07:58:02 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a4f379662cso4573421f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jul 2025 22:58:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-75f4fc4b4a7sm2429802b3a.18.2025.07.22.22.57.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 22:58:01 -0700 (PDT)
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
X-Inumbo-ID: fe685605-6789-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753250282; x=1753855082; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PRK9oXmpzD3rvjgqw6oJg2ArOkN69hfjga6+3cB2iwY=;
        b=EZgGwhHSWKj+nsi3QC1yv/tjPP0G53WkhouXH/RhP4kg3uKSGqmK9AQ27me1RSTH83
         54bGjgO35meSjmJbdRrLvYlaA0ewQ1jgRMEKZjJRKXXcwDB9TLsAaNYBACEP1pnEPyYr
         hcKnsK8KRDYB4msgXu1g5z2YthQOKYO83GhVGkYABK8ynq1XzjoYlHnj0ttsNqtuG+jO
         uRkjbu8f1dHVMFhglVd0eIdxsuZVjOirczW60YyN7L3hmwOYN3a8lquNBSGTvcPNt8sD
         UCR+wV08ZSX4BOsj25D9yOQqjlqcXIHdzlMyc3Kar2QhycbXJZ1lJvGA1Ziz/0N6tyRs
         8aPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753250282; x=1753855082;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PRK9oXmpzD3rvjgqw6oJg2ArOkN69hfjga6+3cB2iwY=;
        b=OLuahMqHkId/0GJQpLYUO+j0ucnHnBBC/FACsaI7cdPC32+IHwrCksG/CNNxNdWZYz
         +slyczoqb/zyGogbTIrdfMpSc5EVCfjGzkjm2pwpOgUp7HbTZwvk93XIyPd9NW8p73mh
         VDpE/VG/V7/jFH0IJNm99vu7MqYz+p0/7GZLoaozmdYXlaR4JBkkKXl7zEJqFHAk4e8B
         OOiS9w5MqPk+vOysJ0on8F7769j77CJ+Rz+aRMMWAAvVybfC9P+Xv23mzPNM3sgZV4tZ
         9lTWN7qNF/WEuREFrI0mk2PJPU+aopPAh9wbGtjjg9kYflGQh2oXxhq7Rzvl30JdJYUr
         YA6Q==
X-Forwarded-Encrypted: i=1; AJvYcCX1aGlYf7pEj9s9X9/LlBPOBkbg0KYyPwu9FxsnEXVhv+wR48SbY3f5W1LFXnNNdjvBnvdxXCWvJEg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxwyzNgT0d5ZGNdMZWaCN328uyqbR6lwc8iwV2Wwo/uyfOrnQ0q
	ffojqO9qT5MQwNyDKt4s3vCVekSFPLJIBjGucpn/oJj8+qhKhe/q5YdtKQMQaqLv7A==
X-Gm-Gg: ASbGncuV0u4JWb4sOmJ+CTUamdiLSVLdw9t22V0tiN21aCrrjJySYclBNl/r2fQuOwW
	r9erFBATE7qJU4H+OCawIntiqxlPtrrH9TI6q0Cu4/Z7bKu+3BFcoftHd5pc5f65frJcaQ8QHpz
	wBTatfE7kXolvxCIKZBKxBx5UxN8w+KvPWszK9WaInryXD5L/jGBWyXb1RR58oQNMav1BTgVbfu
	IK3uGPWjoNv3OJht/v9VR+jNJAjUJ7Gec0cZZUKTXZHaLp5MSQdG06Y2+UkGnCpu5yTRYJoOA7l
	XcNUWdKF1Y+vLQFMuvzaD15bTUek3wvPHYZqil7s+Wd81va32+ij6VizZFJaZFBIkVODRsJOgj3
	RZWf6O4HVjTrOh6PO4J2tNVtVB51xessBdN0EtpdKuHWUY0A1oH/mwE7Wh8OnSJVxHw6lLX9P8d
	xqRMWw4Ys=
X-Google-Smtp-Source: AGHT+IEo09hBsUPl+fjkjlmNhtuSjqubohFsD4owSjSoqCkmFEUrtJEUhnMgATabDfwf156C9wjf+g==
X-Received: by 2002:a5d:64c5:0:b0:3a8:6262:6ef5 with SMTP id ffacd0b85a97d-3b768c9c148mr1223117f8f.10.1753250281730;
        Tue, 22 Jul 2025 22:58:01 -0700 (PDT)
Message-ID: <f75df6d6-ede6-41a6-9412-1a9b073902b5@suse.com>
Date: Wed, 23 Jul 2025 07:57:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen: move getdomaininfo() to domain.c
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Penny Zheng <Penny.Zheng@amd.com>, ray.huang@amd.com,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250722050410.853783-1-Penny.Zheng@amd.com>
 <0939219f-1c06-4d0d-a427-6b95b5943513@suse.com>
 <alpine.DEB.2.22.394.2507221738090.7043@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2507221738090.7043@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.07.2025 02:46, Stefano Stabellini wrote:
> On Tue, 22 Jul 2025, Jan Beulich wrote:
>> On 22.07.2025 07:04, Penny Zheng wrote:
>>> Function getdomaininfo() is not only invoked by domctl-op, but also sysctl-op,
>>> so it shall better live in domain.c, rather than domctl.c. Which is also
>>> applied for arch_get_domain_info(). Style corrections shall be applied at
>>> the same time while moving these functions, such as converting u64 to
>>> uint64_t.
>>>
>>> The movement could also fix CI error of a randconfig picking both SYSCTL=y
>>> and PV_SHIM_EXCLUSIVE=y results in sysctl.c being built, but domctl.c not
>>> being built, which leaves getdomaininfo() undefined, causing linking to fail.
>>>
>>> Fixes: 34317c508294 ("xen/sysctl: wrap around sysctl hypercall")
>>> Reported-by: Jan Beulich <jbeulich@suse.com>
>>> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
>>
>> I'm not convinced of this approach. In the longer run this would mean wrapping
>> everything you move in "#if defined(CONFIG_SYSCTL) || defined(CONFIG_DOMCTL)",
>> which I consider undesirable. Without DOMCTL, the usefulness of
>> XEN_SYSCTL_getdomaininfolist is at least questionable. Therefore adding more
>> isolated "#ifdef CONFIG_DOMCTL" just there may be an option. Similarly, as
>> mentioned on the other thread, having SYSCTL depend on DOMCTL is an approach
>> which imo wants at least considering. And there surely are further options.
>>
>> As indicated elsewhere, my preference goes towards reverting the final one or
>> two patches of that series. They can be re-applied once the dependencies were
>> properly sorted, which may (as per above) involve properly introducing a
>> DOMCTL Kconfig setting first.
> 
> I don't think this is a good idea.

And implicitly you say that what I put under question in the first paragraph
is a good way forward?

Jan

> The patch that Penny wrote addresses
> this specific issue effectively and allows us to move forward. It also
> helps us continue identifying problems in GitLab CI and prevents
> regressions with CONFIG_SYSCTL.
> 
> I am also aware that Penny has already more patches to send, including
> the DOMCTL Kconfig you are asking. 
> 
> I think this patch is fine as is:
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 


