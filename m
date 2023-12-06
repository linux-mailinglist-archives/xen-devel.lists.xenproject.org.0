Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B988069FF
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 09:44:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648980.1013146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAnVj-0001Nh-QE; Wed, 06 Dec 2023 08:44:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648980.1013146; Wed, 06 Dec 2023 08:44:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAnVj-0001Ks-ML; Wed, 06 Dec 2023 08:44:03 +0000
Received: by outflank-mailman (input) for mailman id 648980;
 Wed, 06 Dec 2023 08:44:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X1yw=HR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAnVi-0001Ki-Sd
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 08:44:02 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9acb3dab-9413-11ee-98e5-6d05b1d4d9a1;
 Wed, 06 Dec 2023 09:44:02 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40b397793aaso3276775e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Dec 2023 00:44:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e2-20020adf9bc2000000b003332fa77a0fsm14315315wrc.21.2023.12.06.00.44.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Dec 2023 00:44:01 -0800 (PST)
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
X-Inumbo-ID: 9acb3dab-9413-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701852241; x=1702457041; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+/hfupQE0FCDpaIJHdnn/iB9CcbgSgDZqdvxwWfvR0I=;
        b=c8p+f9bwQ30MdSWvGM6+tEMOz+c+ha3WHlHOI/sSKnC7TQZ8mnb7fHJJFd+9224Das
         tpVij9jXTlCuhVt+kjUbSDOz4Ca5HGH2tpbtKsnGMUNCkYyl/tnEXChMt7/ex1PES18L
         9wF30S0a6F1dn0mvwOhUsZuAdIii2Av2PuLWrccsjY93fQc2KZV3zmt4ppfdXTeRb5Fy
         ZszKLuSOFCjc8Hh6tten34clVdF9aDNmp1pylrx5nSfL3HtsbCzA0ZlF/7QYur3BQ6zs
         r9h2Tpv1iNRXgkN9DrPti3JWF2IvoM+uv3JwLArNgkeX3MKFcrFLHDIpIc3rzumYxaMQ
         eDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701852241; x=1702457041;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+/hfupQE0FCDpaIJHdnn/iB9CcbgSgDZqdvxwWfvR0I=;
        b=TuGrJY1da9YvqHw69rXYq6aetZaOxdihywHPLzeDPEMZ9fBZZbn7SP5aXeToL4pipf
         4GRhxZYmUQqHZSlUJTld5Voy4/X0SM7/0RjfgH05TJ3HW7AmFo0JOyTPeKgQGUqhmSJt
         r0t82mdz66VUwLm1adYRPRI23Sz/h2/KeDjfKyEWWpi/TrPfJmT3CY+9QmSEmuas6CKz
         I56+qWXas74Mn+VVQ2nznfEtL0ZM7TKlhQVQs7XaQJ0YQzee0oASch3/4foVlU4pP2WH
         OfngCOrOg7QAFu62dIuZyGkRMcgm8RPkfk7cWXtoT4Jin4KB680zYcDKC3rjQ7VoyGAH
         LJMQ==
X-Gm-Message-State: AOJu0YzaNbfy0rgJwGTmrXXkgzPuhKbJio+SF3/xU6hA+enOoNH9NCZY
	SF8Bt8rRxJvK7LMuQYJAqwkj
X-Google-Smtp-Source: AGHT+IFf8IAVcvqUVDccrRt+TNWVNnDZ9iFbpHWMPgsmSHqcdGkksJUdYzrZ3KASUH6y6GRHLCGVyA==
X-Received: by 2002:a05:600c:3596:b0:40b:4072:54de with SMTP id p22-20020a05600c359600b0040b407254demr1281928wmq.13.1701852241369;
        Wed, 06 Dec 2023 00:44:01 -0800 (PST)
Message-ID: <606969b5-5ee3-4e15-92d4-86b142845437@suse.com>
Date: Wed, 6 Dec 2023 09:44:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] xen/arm: set -mno-unaligned-access compiler option
 for Arm32
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20231206071039.24435-1-jgross@suse.com>
 <20231206071039.24435-2-jgross@suse.com>
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
In-Reply-To: <20231206071039.24435-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.12.2023 08:10, Juergen Gross wrote:
> As the hypervisor is disabling unaligned accesses for Arm32, set the
> -mno-unaligned-access compiler option for building. This will prohibit
> unaligned accesses when e.g. accessing 2- or 4-byte data items in
> packed data structures.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Assuming this will want backporting, should it have some Fixes: tag?

Jan

