Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6698591446C
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 10:17:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746266.1153262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLet4-0005vi-4U; Mon, 24 Jun 2024 08:17:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746266.1153262; Mon, 24 Jun 2024 08:17:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLet4-0005tg-0i; Mon, 24 Jun 2024 08:17:18 +0000
Received: by outflank-mailman (input) for mailman id 746266;
 Mon, 24 Jun 2024 08:17:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wsRE=N2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sLet2-0005ta-1I
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 08:17:16 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 297a0610-3202-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 10:17:14 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2ec1ac1aed2so48859071fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 01:17:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb2f02e3sm57279705ad.62.2024.06.24.01.17.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 01:17:12 -0700 (PDT)
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
X-Inumbo-ID: 297a0610-3202-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719217033; x=1719821833; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UU3WMMZDg9YzwDXjWlHNVYyLjAOSWcztd/55m7NJfyw=;
        b=IBAkFfN0AkjZ0J0Epr8vOi0r9ZRbUNQzAuxw3i2L43VeLaR/z4ukhgokDIyRf5n9t5
         dNJQiz05+iXiCgWS5EvOebjS+AKxN3iBGg0NSUybQCeW4ceqZMORdfhO6ked8jI/rfXo
         j3hc01yl+htIpfm2Ntowpi5M6VLKjPxOtfmdt74jYDPnTutvMo8Svl3GaSScZN2/y+pc
         2MjYcRFN6wG1iUiEZ/mQMgb7yZ4shcwarz/CqWZvm5hBvJGTIgcIhJxxbIJtlkGGvqp0
         5wnWfLw6mokVwjti6wQRzrzTZHEOJtlmSkxsM5upA2PWrhkCK/3ZQyF123VB2gwjxOtW
         CNOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719217033; x=1719821833;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UU3WMMZDg9YzwDXjWlHNVYyLjAOSWcztd/55m7NJfyw=;
        b=nISfCTTa6PNa6xiG13sR145JiFp6XUouNNn8qsfhZ+p5ACXvGDPoPFL2H8pA7ZxZp/
         70dKFAAMN2KoPRbE0cz/pirk5M9EaE0iLSvEXSuGUtFi15kUT84k+QVqD1UH2CBPz76r
         m+04H+RQlE/Hbq65tXCZvqUmqhzBwFgYnxQwdKRobp7DCfuS0idEW4qDCn7PBEBPOJM0
         JsXi4SB3quNe7ETIUK+5RS2QSgY2/tZu0hQ3n2RcqHb0iwLkZjortNN6BBbDjia+Lxfy
         KiGIL+QZBRhZxbd6k/xbB1YOT/f9kOxC3vwxggdReDIXsw2aXlmSSzT+wv+cR6+ISFR+
         UUJA==
X-Forwarded-Encrypted: i=1; AJvYcCUHGtDtLPR552jj2O2VysptKJQZPlrIfzqRA+E2ich9eAPLieFOqI8oL7Lb68ELNckOq7cLr/KcUmW7b0RUZs5QNZNQa7J0Y73WsV57PbI=
X-Gm-Message-State: AOJu0YyL1Gna2myxDQn0sEQjLA8y2lE4MR7RtrQTEkSBHEWmhA/mxN6D
	UBYLcmTmRbfq9uK/Etw3d6+zIpP2qr7xxvBJfcDv1p0JInuOq4IWwfJOCyzlxA==
X-Google-Smtp-Source: AGHT+IHCtBD07fRf+xB1RHBJuWeCOsMOjKJPOI3xiyCTKWhSAETxrJRlYP0abKOObopBU2g1sPruAw==
X-Received: by 2002:a2e:9642:0:b0:2ec:595a:2d1f with SMTP id 38308e7fff4ca-2ec5b2844fcmr23152871fa.2.1719217033405;
        Mon, 24 Jun 2024 01:17:13 -0700 (PDT)
Message-ID: <1ffd019d-6bab-49d1-932c-7b5aee245f32@suse.com>
Date: Mon, 24 Jun 2024 10:17:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v10 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony@xenproject.org>
References: <20240617090035.839640-1-Jiqian.Chen@amd.com>
 <20240617090035.839640-6-Jiqian.Chen@amd.com>
 <b4b6cbcd-dd71-44da-aea8-6a4a170d73d5@suse.com>
 <BL1PR12MB584916579E2C16C6C9F86D1FE7CE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <b6beb3f3-9c33-4d4c-a607-ca0eba76f049@suse.com>
 <BL1PR12MB58493479F9EF4E56E9CB814FE7C82@BL1PR12MB5849.namprd12.prod.outlook.com>
 <96ba4e66-5d33-4c39-b733-790e7996332f@suse.com>
 <BL1PR12MB58493B55E074243D356B0CAAE7C92@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB58493B55E074243D356B0CAAE7C92@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.06.2024 10:20, Chen, Jiqian wrote:
> On 2024/6/20 18:42, Jan Beulich wrote:
>> On 20.06.2024 11:40, Chen, Jiqian wrote:
>>> On 2024/6/18 17:23, Jan Beulich wrote:
>>>> On 18.06.2024 10:23, Chen, Jiqian wrote:
>>>>> On 2024/6/17 23:32, Jan Beulich wrote:
>>>>>> On 17.06.2024 11:00, Jiqian Chen wrote:
>>>>>>> @@ -1516,14 +1519,39 @@ static void pci_add_dm_done(libxl__egc *egc,
>>>>>>>              rc = ERROR_FAIL;
>>>>>>>              goto out;
>>>>>>>          }
>>>>>>> -        r = xc_domain_irq_permission(ctx->xch, domid, irq, 1);
>>>>>>> +#ifdef CONFIG_X86
>>>>>>> +        /* If dom0 doesn't have PIRQs, need to use xc_domain_gsi_permission */
>>>>>>> +        r = xc_domain_getinfo_single(ctx->xch, 0, &info);
>>>>>>
>>>>>> Hard-coded 0 is imposing limitations. Ideally you would use DOMID_SELF, but
>>>>>> I didn't check if that can be used with the underlying hypercall(s). Otherwise
>>> From the commit 10ef7a91b5a8cb8c58903c60e2dd16ed490b3bcf, DOMID_SELF is not allowed for XEN_DOMCTL_getdomaininfo.
>>> And now XEN_DOMCTL_getdomaininfo gets domain through rcu_lock_domain_by_id.
>>>
>>>>>> you want to pass the actual domid of the local domain here.
>>> What is the local domain here?
>>
>> The domain your code is running in.
>>
>>> What is method for me to get its domid?
>>
>> I hope there's an available function in one of the libraries to do that.
> I didn't find relate function.
> Hi Anthony, do you know?
> 
>> But I wouldn't even know what to look for; that's a question to (primarily)
>> Anthony then, who sadly continues to be our only tool stack maintainer.
>>
>> Alternatively we could maybe enable XEN_DOMCTL_getdomaininfo to permit
>> DOMID_SELF.
> It didn't permit DOMID_SELF since below commit. Does it still have the same problem if permit DOMID_SELF?

To answer this, all respective callers would need auditing. However, ...

> commit 10ef7a91b5a8cb8c58903c60e2dd16ed490b3bcf
> Author: kfraser@localhost.localdomain <kfraser@localhost.localdomain>
> Date:   Tue Aug 14 09:56:46 2007 +0100
> 
>     xen: Do not accept DOMID_SELF as input to DOMCTL_getdomaininfo.
>     This was screwing up callers that loop on getdomaininfo(), if there
>     was a domain with domid DOMID_FIRST_RESERVED-1 (== DOMID_SELF-1).
>     They would see DOMID_SELF-1, then look up DOMID_SELF, which has domid
>     0 of course, and then start their domain-finding loop all over again!
>     Found by Kouya Shimura <kouya@jp.fujitsu.com>. Thanks!
>     Signed-off-by: Keir Fraser <keir@xensource.com>

... I view this as a pretty odd justification for the change, when imo the
bogus loops should instead have been adjusted.

Jan

> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
> index 09a1e84d98e0..5d29667b7c3d 100644
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -463,19 +463,13 @@ long do_domctl(XEN_GUEST_HANDLE(xen_domctl_t) u_domctl)
>      case XEN_DOMCTL_getdomaininfo:
>      {
>          struct domain *d;
> -        domid_t dom;
> -
> -        dom = op->domain;
> -        if ( dom == DOMID_SELF )
> -            dom = current->domain->domain_id;
> +        domid_t dom = op->domain;
> 
>          rcu_read_lock(&domlist_read_lock);
> 
>          for_each_domain ( d )
> -        {
>              if ( d->domain_id >= dom )
>                  break;
> -        }
> 
>          if ( d == NULL )
>          {


