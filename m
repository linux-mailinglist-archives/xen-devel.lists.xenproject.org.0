Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40603B1DB42
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 18:03:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073275.1436176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk35m-00044P-0Y; Thu, 07 Aug 2025 16:03:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073275.1436176; Thu, 07 Aug 2025 16:03:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk35l-00042e-Ta; Thu, 07 Aug 2025 16:03:45 +0000
Received: by outflank-mailman (input) for mailman id 1073275;
 Thu, 07 Aug 2025 16:03:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+2Ad=2T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uk35j-00042Y-N9
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 16:03:43 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16f27e16-73a8-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 18:03:42 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-60c9d8a169bso2035082a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 09:03:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0766f9sm1356758766b.24.2025.08.07.09.03.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Aug 2025 09:03:41 -0700 (PDT)
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
X-Inumbo-ID: 16f27e16-73a8-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754582622; x=1755187422; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s8z43+lqwpm/treF8d/TNueTQC5pYCRnxN093/aiu5o=;
        b=DCVgOX/0mRki3IvDYlPfPLrZsXaEmr2NcLeFsJnw6CSdayRbaoMofzayIKMcq8s7Dy
         9GP8r6X6ZbYd4JPpCHvEeYzfuFM0it57L5m+6DUfi4JUMlBh0Wf42t46l12yrhHh9e9+
         jY193RybETYtLpIVtgH6tWtRlP/WX3dO9Gr7RYj0bEH4k2gnUo0VNpGSzh5kvLwqGCyO
         VcC7c4ZFyuvsLq9dJ/Z2e5CKDXjUBEPtljl+fDbroi9fpIKyAYizDFSl17at+Q6npKzn
         MeDAv6z1HYG1qss8b56FcYTmzIRhJkp5k5TnbLZMRJHwI9wt1CqRnACQAXqST+lEBn3d
         cbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754582622; x=1755187422;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s8z43+lqwpm/treF8d/TNueTQC5pYCRnxN093/aiu5o=;
        b=Al8/dNvRH7jbo6Kjs2i5/V0m98voEWqAN6+7EWpGrdX6BhFCrK7DRv6bblL7/bDTTj
         2+JTSJJI4iLF1AMPXGbPjY+RaUXH8REK8hnnvyjgtMr04EhbETMyhNvCl8uKt9MZagr2
         Qzyi6BYAhue8aw9vGabwEWHinVtvuVVb07BeePSZ9bQtsq2pvxZq15ynxuhorD0vD/t0
         Yu/l3XwarI9A5mzdWqPeCCTcpB0R8sAIQEtP1pSm9hsKEEfIclFxlClwVybC09fJVcv+
         k/v5UBvoRfuNnLUVpcfXZu5QD8MS3aB6MkIt1FFnoPCi9yGya+to1L6ruUr3iwsYfJ8C
         teDw==
X-Forwarded-Encrypted: i=1; AJvYcCWdACisCeHHa5HdtNkr0FoMKVTWS9/okG7llon00L7IxleVKEN2FVaTVfliKJFqeZPwmPj6dL8TT7c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJ6tDRPy71agxrWJLM8unKS79dCj4D8DPtnNqtKlK4+M+zEW2/
	PNuWjj6BPEi7c4MFNr3zTDLVeAV0k9pKxj8sLJoYpMszSCfVxK8C0KwgpdO2gVdVzA==
X-Gm-Gg: ASbGnct/4OCM1RTRVPMpho3+o6ZrYOK/7GeAbdGtBOPbWIJMrHLYsmQAHOl8/48b+0g
	hMTRsAFUZNo49Z/KJxQx9JobV8Bh6TehOAekyjQSiBKzZUWqw7LS3VK8ZqlihHYV4NksuvHvWse
	2qtywKsGcIwZ0IOXsvoYpj6wYqmPrKCRypPSw2OomMyHquqVl9PuwrWgL27G+CVjZ+yY8FiggVo
	xMXrJZvui38XHO3KTenuI9P/hIyM8rdYWN9TtCMiH69mxmweoJ6W/fkROpGtPa7k1FTJftr35JJ
	OMGBJK4n/MN9mf8uws19PjOotnIt8LmdRePx+SnEDBUGFQGNFOc8VDl5LjRzgbWAxRcrCWy9clm
	Uf2uEjnGk7z2hXYXoaKDCjtHZRStNRoiUqYD5WmSzJDGo2OQU+unBwjrWKp8Q5tgPj414i4IIm+
	0m5r5W2Gc=
X-Google-Smtp-Source: AGHT+IGyWBZEyK3navZoOpsiNlN+Qi9aj2QGiY2HwK+Hkf91ZIbADUMvf+Yzc3Kao+bp/5JnjUfVhw==
X-Received: by 2002:a17:907:9810:b0:af8:fa64:917f with SMTP id a640c23a62f3a-af992c27b3emr707987366b.48.1754582621689;
        Thu, 07 Aug 2025 09:03:41 -0700 (PDT)
Message-ID: <412e9ac3-554f-41ee-b76c-86c38e13848a@suse.com>
Date: Thu, 7 Aug 2025 18:03:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/20] xen/riscv: add root page table allocation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <23c79f07221dee7eb782ebb160442f3a796a41b2.1753973161.git.oleksii.kurochko@gmail.com>
 <3c02593f-deae-4109-9334-0ac4376a9a9e@suse.com>
 <d160c6da-a4a8-44ca-9dc5-b1e3cb31bde5@gmail.com>
 <d81b41c9-59e1-4807-af27-9d952d35ba42@suse.com>
 <9fec023f-3b93-49a4-8ee2-ab2194951b19@gmail.com>
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
In-Reply-To: <9fec023f-3b93-49a4-8ee2-ab2194951b19@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.08.2025 17:59, Oleksii Kurochko wrote:
> On 8/7/25 5:30 PM, Jan Beulich wrote:
>> On 07.08.2025 14:00, Oleksii Kurochko wrote:
>>> On 8/5/25 12:37 PM, Jan Beulich wrote:
>>>> On 31.07.2025 17:58, Oleksii Kurochko wrote:
>>>>> +    /*
>>>>> +     * Return back nr_root_pages to assure the root table memory is also
>>>>> +     * accounted against the P2M pool of the domain.
>>>>> +     */
>>>>> +    if ( !paging_ret_pages_to_domheap(d, nr_root_pages) )
>>>>> +        return -ENOMEM;
>>>>> +
>>>>> +    page = p2m_allocate_root(d);
>>>>> +    if ( !page )
>>>>> +        return -ENOMEM;
>>>> Hmm, and the pool is then left shrunk by 4 pages?
>>> Yes until they are used for root table it shouldn't be in p2m pool (freelist),
>>> when root table will be freed then it makes sense to return them back.
>>> Am I missing something?
>> I'm commenting specifically on the error path here.
> 
> Ohh, got it.
> 
> In this case, should we really care about this 4 pages as a domain can't be ran
> without allocated page root table and a panic() will be occured anyway according
> to the create_domUs() common code (construct_domU() -> domain_p2m_set_allocation()
> -> p2m_set_allocation() -> p2m_alloc_root_table()):
> ...
>          rc = construct_domU(&ki, node);
>          if ( rc )
>              panic("Could not set up domain %s (rc = %d)\n",
>                    dt_node_name(node), rc);

Well, that's for dom0less. Even for tool-stack created VMs there would be
no problem. But root tables required on demand (altp2m, nested) would be
different. So what you do here may be good enough for now, but likely will
want improving later on. (Such temporary restrictions may want putting
down somewhere.)

Jan

