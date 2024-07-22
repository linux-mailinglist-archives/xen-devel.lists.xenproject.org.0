Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32ADA938998
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 09:06:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761497.1171429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVn7E-0006FA-Sh; Mon, 22 Jul 2024 07:05:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761497.1171429; Mon, 22 Jul 2024 07:05:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVn7E-0006Ce-Pw; Mon, 22 Jul 2024 07:05:48 +0000
Received: by outflank-mailman (input) for mailman id 761497;
 Mon, 22 Jul 2024 07:05:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sVn7D-0006CY-N6
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 07:05:47 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1027ab4-47f8-11ef-8776-851b0ebba9a2;
 Mon, 22 Jul 2024 09:05:45 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5854ac817afso2250961a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 00:05:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a51433f904sm2945160a12.40.2024.07.22.00.05.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 00:05:44 -0700 (PDT)
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
X-Inumbo-ID: d1027ab4-47f8-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721631945; x=1722236745; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3/peW/0/GCaqcuPKOsJNC+gk9eHp5K+xbvPXgtsTOC0=;
        b=Oq0Ha6uvJ9jCe/pSVWhJox8CSe4kQEmixEJ5fYohHQgL0e+XuFEhuKYQVmB4dyZ0pZ
         F/gq9352S1OzZsmG4gqcvE8JUAGZSNE4nvHBtUi5Mr5y7jb+2A6PyPjh4eNsE5ErRVc2
         LtbbFf1eQgeCZP8NOT/qgramADS0jOs3eXRqf0603A27EnQgXwbHFgInQr+L/fqthOMv
         6wM4l734PrYe6+Xkvz2vzKczrOZ/xhPPCjh6C0CZDJ3LGMrBfKqbtN1oFbPlXzD3i1co
         TLHz60Df1hpDFvl07uvTThOuD8tKQBUD3wu3tJJ+XTxLpnoLWL4yP+eC2rvvhAt3YjyD
         IQMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721631945; x=1722236745;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3/peW/0/GCaqcuPKOsJNC+gk9eHp5K+xbvPXgtsTOC0=;
        b=WxXrVy5zE1cN4z91fJRolR4mnApssSz6gSDKTXdM7/+70wykszRTcf3gfRjMU8kXTX
         gZb1M+FTiYkJ2FifBD3Tt3RXkMfhbWs6fBUKWq0q1AYXCTYWAebKO1NJB3wT0PclIaST
         WHT8fyixyEhXfKLVwFzAuuQLFc7CBV+WLD2bIZAs4lK/ahc3KmSa/AWq+fj/GyyIDjOK
         5Ah0HSjEmbtAFYzwAz6Ff6iiv5WgCFXM98XGnnJwxBF0jKf/CI909W3ut24cvumdAhsx
         UPIp6iXlVEbVTz/PgI+LitfYrJZe0vKPGr+0fcHT/vKe8eOKTbeNY9ZujwHaTmjEd6BW
         tX4g==
X-Gm-Message-State: AOJu0YzyA2IScijEb0zmSvaCfNXgTU2CqesPSg/1OjibFZFY0mqXIKPj
	tSR8KVyfNWw76QMGzIICopM6M5uYNoXA0StsWCFxUjRrPJ1JjodaUX7JQH13PA==
X-Google-Smtp-Source: AGHT+IGv9JeomGku2JpY57hOmMjRdelenITGX45UImYzWatrvhQFApxG0MLiwCcSIekkiHg2m1HSNA==
X-Received: by 2002:a05:6402:528c:b0:5a2:fc48:db12 with SMTP id 4fb4d7f45d1cf-5a479a72a4fmr3830829a12.19.1721631945125;
        Mon, 22 Jul 2024 00:05:45 -0700 (PDT)
Message-ID: <39d87a30-7722-45ec-bc13-11111eb46483@suse.com>
Date: Mon, 22 Jul 2024 09:05:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-linus test] 186932: regressions - FAIL
To: osstest service owner <osstest-admin@xenproject.org>
References: <osstest-186932-mainreport@xen.org>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
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
In-Reply-To: <osstest-186932-mainreport@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.07.2024 06:56, osstest service owner wrote:
> flight 186932 linux-linus real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/186932/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-arm64-arm64-examine      8 reboot                   fail REGR. vs. 186827
>  test-arm64-arm64-xl-credit1   8 xen-boot                 fail REGR. vs. 186827
>  test-arm64-arm64-xl-credit2   8 xen-boot                 fail REGR. vs. 186827
>  test-arm64-arm64-xl-xsm       8 xen-boot                 fail REGR. vs. 186827
>  test-arm64-arm64-xl-vhd       8 xen-boot                 fail REGR. vs. 186827
>  test-arm64-arm64-libvirt-xsm  8 xen-boot                 fail REGR. vs. 186827
>  test-arm64-arm64-xl-thunderx  8 xen-boot                 fail REGR. vs. 186827
>  test-arm64-arm64-libvirt-raw  8 xen-boot                 fail REGR. vs. 186827
>  test-arm64-arm64-xl           8 xen-boot                 fail REGR. vs. 186827

There looks to be a basic problem as of flight 186925, yet a brief look at one
of the logs doesn't really give any hint other than the system perhaps simply
being slow. Ideas, anyone?

Jan

