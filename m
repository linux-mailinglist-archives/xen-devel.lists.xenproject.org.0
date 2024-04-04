Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4DC8982D2
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 10:06:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700741.1094334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsI6r-0003wP-Hl; Thu, 04 Apr 2024 08:06:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700741.1094334; Thu, 04 Apr 2024 08:06:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsI6r-0003uC-ET; Thu, 04 Apr 2024 08:06:09 +0000
Received: by outflank-mailman (input) for mailman id 700741;
 Thu, 04 Apr 2024 08:06:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=stKz=LJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rsI6p-0003u6-MA
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 08:06:07 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 300e3b80-f25a-11ee-afe5-a90da7624cb6;
 Thu, 04 Apr 2024 10:06:06 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a4e39f5030dso93390066b.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2024 01:06:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 wn7-20020a170907068700b00a4e533085aesm5987619ejb.129.2024.04.04.01.06.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Apr 2024 01:06:05 -0700 (PDT)
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
X-Inumbo-ID: 300e3b80-f25a-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712217966; x=1712822766; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FAbbnbG6G2dHIU4OSFdP6tyQxnS9ScR6Fybs8e4almM=;
        b=FalDA6bGsZCl/yPTpXmNV2FdfOkkWqdSTDUtHD6WQ3l9doJego7Xg6TcWRcr0HJ041
         fn4RFsz6U8H8WDIR4P3CdWZ0+uUg3Yl7MxFHD1oWwamSMS2T5lkwIu6dIFbpKbVPhnud
         gsdJ7rWO4efSOA362gaBPLaMJMH/7jMKyUlL/44/rSPaIqmgEt4nHSj6Zf/aIL/jfijn
         sOE8d1sWG3MQX0NYfpW/RA6X9wcmBNRrnS3OlubEDHbi9Bzfn4nmfULBLIopd5i2J42f
         T//iAKCfMJvJ5AEjsGQYXYKHhlXAN1xbbtKCxBwcr1B3Ya+7/zBB7jhf70G5U950u46Z
         KyjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712217966; x=1712822766;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FAbbnbG6G2dHIU4OSFdP6tyQxnS9ScR6Fybs8e4almM=;
        b=RqU2clN01nZeAWraKbTrU3oe8ceBNAJpStwn71/6Vg1hpLzrfbUZRTX/CV4WaECd+m
         Zy9DFu6ExGeHq1yGlDk4B15xF7Be+r8zBi7EkmRovnWyuSEigNIm8DvaAY2k0n6TOpCy
         SEY6hVerqVNiyQmEpWUXM9sssSivI1hr8lIfLxouvutL4q6hZw35KrpDd5haSEVZXhR+
         ytrdILHI3CcwXF+JkFcbr9kSRVQLmTil7lbFqFnl9L+ACXTfGEiluUNkoHyV1EhsIeq5
         DGRiw22aFpef+XBxu4n6agKquJj07rRFhSfyCEVdIotWa2gSmm0fd1sXyNOE9HXlCDez
         zUCQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9+EPRkZ+VHO/7Asd6ZGW/77FFAKRcRUb7OWlxQMeHXTqttup/K8wKA39wrS4THFwxbjlM6GIduqnYQkG+Pl5YZtrAupbltUv1J3p/OVY=
X-Gm-Message-State: AOJu0Yx4zl/ukKp5wIuY5JLD87ApXhb8cY+huiy91PwSd8VNzCzNF4Fy
	OWzeM3qB8ajr18cUYlcuJ0Ba5u79e8vBPQY9DXQnMlabdFt1NhpbbMh/VNeeTQ==
X-Google-Smtp-Source: AGHT+IHxMI1XYZFKl1twdZdjiDw5l8VvjZxrIwpVkb30ZihpeInCiS0x2KyvNZmotEFj014tDSTh8w==
X-Received: by 2002:a17:907:7d93:b0:a51:8a58:237c with SMTP id oz19-20020a1709077d9300b00a518a58237cmr896618ejc.35.1712217966080;
        Thu, 04 Apr 2024 01:06:06 -0700 (PDT)
Message-ID: <012db229-8c84-4b74-b919-50e0231dd274@suse.com>
Date: Thu, 4 Apr 2024 10:06:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drivers: char: Drop useless suspend/resume stubs in
 Arm drivers
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20240404075143.25304-1-michal.orzel@amd.com>
 <20240404075143.25304-2-michal.orzel@amd.com>
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
In-Reply-To: <20240404075143.25304-2-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.04.2024 09:51, Michal Orzel wrote:
> On Arm we don't use console_{suspend,resume} and the corresponding
> stubs in serial drivers are being redundantly copied whenever a new
> driver is added. Drop them as well as useless .endboot = NULL assignment.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Since hook invocations are suitably guarded:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

However, from a Misra perspective more wants doing here if suspend/resume
indeed isn't wanted / needed on Arm: console_{suspend,resume}() are
unreachable there, and hence want hiding behind some (presumably)
CONFIG_HAS_*. In turn the two hooks then would also want making conditional
upon that option actually being selected by an architecture.

Jan

