Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F4E903D2C
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 15:25:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738399.1145159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH1Ur-0002pc-Qd; Tue, 11 Jun 2024 13:25:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738399.1145159; Tue, 11 Jun 2024 13:25:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH1Ur-0002nE-Mc; Tue, 11 Jun 2024 13:25:09 +0000
Received: by outflank-mailman (input) for mailman id 738399;
 Tue, 11 Jun 2024 13:25:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WBrw=NN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sH1Up-0002n8-Lo
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 13:25:07 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04abf04d-27f6-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 15:25:06 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-57c72d6d5f3so3852775a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 06:25:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57aadf9e208sm9463309a12.6.2024.06.11.06.25.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jun 2024 06:25:05 -0700 (PDT)
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
X-Inumbo-ID: 04abf04d-27f6-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718112306; x=1718717106; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6NWwJIvxM8MsrXefBVGyw7mhdssnASXzZeq0sSzEt5w=;
        b=Tb5tvy2KOUhAuTpBGJUCLmMoCHmQEESD85divzRcnBIQTo6rLG1qOcQgNSm2juIz4b
         zPMkKVty3uu87nkrgRp21U4G6xy826aNrg9yc/XY940B4AWuzvoxtYikjhw3y7c3aupq
         3fNF0ZkJUM9s9khdUQs8HNmVtisDaDOiFqqA1+VhaB+sCFf55ucc3raWw7eoE5gXeNL7
         /rS7sNxa59l7pMG6x8v2q1koSxjpT2PApRYQGgx8j2BReLdMNFz18G2M2pVMhHIOUnOh
         R8XOHnJBegQFjw+UqxsTxfndo2xM5Op5iIWKHjvY9YsnmVebQ0p7dWqG9wmlsbOYtBKG
         OgNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718112306; x=1718717106;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6NWwJIvxM8MsrXefBVGyw7mhdssnASXzZeq0sSzEt5w=;
        b=hxhRDDtVwzmHXd7Js38h86CLK3VIc5VLyF+pZsaEH1helSHT7l1IjvhGtOEeQuuqXv
         8NdPJB9AViMM2UN6RByN587P8qtgvMFWSNM3I32peaHQsFThSlUFpzpX170zsVJeVl/D
         ojEwwF9sEHVOsM2tGN76LOWvsEKdjQkmPWHLmFctdZeLOQrtnavlTQeawHwZkBelQVTY
         JEWs4iabhiISbxNTqaDGICtgi47s6x+jXNWcJfRJlT82lQsfXuA0emvTUCdCHfGKongs
         dMFLYM3DWx3uxuQY05m6oNfnMnMd6Rw+mWSh5j7W81O68Ukjr5mfCLaxexWrA22sseLj
         AD6A==
X-Forwarded-Encrypted: i=1; AJvYcCWaRT88eKpLX+kVqKkbM+8yt3uTp0kVkj366vH31WgH7jZS2k7BFkF8mPSEKB7eIDRHUg+Yj2BSfLuf7B5wi7Ovjz/QTD7y8ZxfcnESz5I=
X-Gm-Message-State: AOJu0YwPjqOV9CvYeYzU0WXfXM0FDPdzkUGvXRyIJ9wI/kUtNKGdim4+
	A8aMtGPQy1jhu9jj+CBL2IqoVXs+xtSiI0WeM6yOuLYGLrksRpDrirF+83XAcQ==
X-Google-Smtp-Source: AGHT+IHYfknDb/YucadxbdWGFikeL3Wv29fKiLbLbH8bZhABJSdUP1HxhzE8tj/Z+EChnUmKlU0NOQ==
X-Received: by 2002:a50:cdda:0:b0:57c:7ce3:6cd9 with SMTP id 4fb4d7f45d1cf-57c7ce36e15mr3768898a12.23.1718112306048;
        Tue, 11 Jun 2024 06:25:06 -0700 (PDT)
Message-ID: <a93b4aee-6574-4442-8f14-40e9df96f56e@suse.com>
Date: Tue, 11 Jun 2024 15:25:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 0/9] x86/irq: fixes for CPU hot{,un}plug
To: "Oleksii K." <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20240529090132.59434-1-roger.pau@citrix.com>
 <96cbb9df754f35d8df805df0138c942466a8f904.camel@gmail.com>
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
In-Reply-To: <96cbb9df754f35d8df805df0138c942466a8f904.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.05.2024 11:37, Oleksii K. wrote:
> On Wed, 2024-05-29 at 11:01 +0200, Roger Pau Monne wrote:
>> Hello,
>>
>> The following series aim to fix interrupt handling when doing CPU
>> plug/unplug operations.  Without this series running:
>>
>> cpus=`xl info max_cpu_id`
>> while [ 1 ]; do
>>     for i in `seq 1 $cpus`; do
>>         xen-hptool cpu-offline $i;
>>         xen-hptool cpu-online $i;
>>     done
>> done
>>
>> Quite quickly results in interrupts getting lost and "No irq handler
>> for
>> vector" messages on the Xen console.  Drivers in dom0 also start
>> getting
>> interrupt timeouts and the system becomes unusable.
>>
>> After applying the series running the loop over night still result in
>> a
>> fully usable system, no  "No irq handler for vector" messages at all,
>> no
>> interrupt loses reported by dom0.  Test with
>> x2apic-mode={mixed,cluster}.
>>
>> I'm tagging this for 4.19 as it's IMO bugfixes, but the series has
>> grown
>> quite bigger than expected, and hence we need to be careful to not
>> introduce breakages late in the release cycle.  I've attempted to
>> document all code as good as I could, interrupt handling has some
>> unexpected corner cases that are hard to diagnose and reason about.
> Despite of the fact that it can be considered as bugfixes, it seems to
> me that this patch series can be risky. Let's wait for maintainers
> opinion...

Working my way through v2 of this series, I think I'd be okay with
including stuff there up to patch 5. Patch 6, which I just finished
taking a first look at, is likely correct (and it's just me missing some
aspects to fully grok the changes done there), but at the same time
looks to be more intrusive than we would like to have it at this point
of the release cycle. That said, I'd be pretty okay to be overridden in
this regard by Roger and/or Andrew.

Jan

