Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C422297E670
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 09:23:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801682.1211653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssdPf-00011H-AS; Mon, 23 Sep 2024 07:23:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801682.1211653; Mon, 23 Sep 2024 07:23:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssdPf-0000yp-7p; Mon, 23 Sep 2024 07:23:15 +0000
Received: by outflank-mailman (input) for mailman id 801682;
 Mon, 23 Sep 2024 07:23:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZUN=QV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ssdPd-0000yf-RE
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 07:23:13 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b124bf25-797c-11ef-a0b9-8be0dac302b0;
 Mon, 23 Sep 2024 09:23:12 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a8d2b4a5bf1so579331466b.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 00:23:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9061096735sm1172573066b.44.2024.09.23.00.23.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 00:23:11 -0700 (PDT)
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
X-Inumbo-ID: b124bf25-797c-11ef-a0b9-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727076192; x=1727680992; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lLPoP8ZotADkSYpjChIuz8uWnE+xY2qGS2KXpshVAKg=;
        b=Jpzmu9urp7bZzcsdhImG1FnjYV2D84wCvVztqX6TPANoe9ugTi6L4EcREF94SPfg7x
         AbwzpNwwFm0BCKa2kwbSknpbMnYKi593lqFrUHzmh9JeY+5CDlMkBHYmWqx86CL7ERnq
         mMGQ+NKKSKR6EtmyL+Z0HhvAI8nhmMHESFWJFQXO4Yvw5sz5l6m15Jz9NAGkvg/6exeQ
         bsrFHgzNwtysoMpAlA7S8B8wTRrzb9fl9Lkv+o8H13aQXef8QugFc77LwaORFu+tsja0
         G2nujfEgo8BofWIbPxyjEKjKGDvWp0roXk87UKLhQon4PVaxsYPgnUz4dWjtBL+fJLUA
         yqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727076192; x=1727680992;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lLPoP8ZotADkSYpjChIuz8uWnE+xY2qGS2KXpshVAKg=;
        b=qpxjyOta1m6lTQVH/LgyryehR3z8lRF0LZq9zNhDRBL6Amzo1wJuxRVWC3l+r2ptK/
         27/OGqY36ydyVdrushxYNpSs7h5CJp0zzUiV28voKEq2PfwnFiZZMrIlA3frJ/DcUr+l
         WNo8uPAhItb/1aMHtTh8cvxad9/JMcyG/6cRnhk6cEhDspAgPAKkhPLi1AVCPZ2yodqY
         WcV/fRadvmHVyCl22pArulXZtMCASVF6BvKgWT1cx/ehTVm7AQjXezYglDdOKBV3Ox46
         N2mO5WYus9MAEfJBvAiTYWXUitmg83wKXmXiE2R51j4DocIVIqtnzdGqen0aRN5X3IbI
         uVMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzRTp+QU9boNCOZwwfQViHKVBlvCxtjeXn7FvwKbG/R/wD2eYdggcqmyaN4DCl1JwBigh9F3P+1b8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywmz6J+2Utt+tncG+7ef4m+gKYomkdhaZDMdsF9L3s4A2hzWtAc
	DyLPaDpW0Q/BAxEcHY1Q8WzbKQHTgOiMMAuVHLI33bOjeGkwl+ZjNhbkrvQHqg==
X-Google-Smtp-Source: AGHT+IFXnprC8dL7DD1n7ZUDTtmNRBciHrshwjJbfT8gwVUAN5O+korJUByz0lnUlf3Uc8+FO8hf/g==
X-Received: by 2002:a17:907:7e9a:b0:a8b:6ee7:ba1e with SMTP id a640c23a62f3a-a90d51967bemr1082397866b.60.1727076192055;
        Mon, 23 Sep 2024 00:23:12 -0700 (PDT)
Message-ID: <bfeda8c3-6ab4-4413-86f0-f4e1e2e16527@suse.com>
Date: Mon, 23 Sep 2024 09:23:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] x86/msi: fix locking for SR-IOV devices
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20240827035929.118003-1-stewart.hildebrand@amd.com>
 <0742fd21-d606-440a-a7fa-dd3bfccfa1c4@suse.com>
 <1afb1c23-a0a4-4d71-9a69-fdedd01e1e0c@amd.com>
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
In-Reply-To: <1afb1c23-a0a4-4d71-9a69-fdedd01e1e0c@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.09.2024 16:11, Stewart Hildebrand wrote:
> On 8/28/24 06:36, Jan Beulich wrote:
>> On 27.08.2024 05:59, Stewart Hildebrand wrote:
>>> +                list_for_each_entry_safe(vf_pdev, tmp, &pdev->physfn.vf_list,
>>> +                                         virtfn.entry)
>>> +                    ret = pci_remove_device(vf_pdev->sbdf.seg,
>>> +                                            vf_pdev->sbdf.bus,
>>> +                                            vf_pdev->sbdf.devfn) ?: ret;
>>
>> And if this fails, the VF will still remain orphaned. I think in the
>> model I had suggested no such risk would exist.
> 
> Are you referring to your suggestion "to refuse the request (in
> pci_remove_device()) when the list isn't empty" ? [1] Or something else?
> 
> [1] https://lore.kernel.org/xen-devel/74f88a45-a632-4ca6-9cee-95f52370b397@suse.com/

It's been a while, but yes, I think that's the one.

Jan

