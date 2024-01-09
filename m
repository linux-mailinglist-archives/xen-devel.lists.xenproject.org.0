Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EC882835A
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 10:39:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664346.1034494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rN8ZS-0001Jf-Ud; Tue, 09 Jan 2024 09:38:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664346.1034494; Tue, 09 Jan 2024 09:38:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rN8ZS-0001H7-Re; Tue, 09 Jan 2024 09:38:54 +0000
Received: by outflank-mailman (input) for mailman id 664346;
 Tue, 09 Jan 2024 09:38:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RTBC=IT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rN8ZR-0001H1-A6
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 09:38:53 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e609cc13-aed2-11ee-98ef-6d05b1d4d9a1;
 Tue, 09 Jan 2024 10:38:52 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2cd33336b32so35511841fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 01:38:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f19-20020a056638169300b0046cf80c799fsm532366jat.120.2024.01.09.01.38.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jan 2024 01:38:51 -0800 (PST)
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
X-Inumbo-ID: e609cc13-aed2-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704793132; x=1705397932; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MVuwS8d1dXz5eyKe37312eTETOEEV7JHLCR9rSazd4E=;
        b=Cjnt4hVqsTz1/pjc/ZFYqQCKvMMcriJbCabdqhwo6aHPl+5Rz/7zJFqt+1cgAbHQkS
         oP1AducF/OuP5s8kTOsEuxge/lqxkpBz/Q3bRMdViRzEFuYzKcFhhtrpJ1EYQH/JRigm
         IKCLGvrAeEpQgsq3o5cZ9o+F6812/PuQsCHCKPH/9axm7SDdZeB6MRbWIcZPtMoIXCpN
         ll1gFUOtBEeypDOp1B+mISIZaIHv4lnbd0o/mtSRt4s/MzQInKTl9xoY29XyJhIjTVva
         /m0pMSs92pW+nOH8KkbtmEZ/yTpuO1ABihlms0HSqLciJpJyjL/MHNHseqzgOx0pYGoA
         NrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704793132; x=1705397932;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MVuwS8d1dXz5eyKe37312eTETOEEV7JHLCR9rSazd4E=;
        b=CV24ufV9LB7aBj2LZ71L4BigCjcymZ1Q7KTCmReB1gm8uqyBrGWRo6nXMxrDaYlgR4
         tnk4QzS/jKqZwS9k43ETh5YIFgssG1DTGMS6avblIfiaPqHPfYrWSaqYu7gpRFtQ/teD
         6YYEFiSMjzTR7Q8n1s+L39QogKLWDTfD6oKniGQz7ccP4j0gaiCWlmVQ0i8WNuHcJj9Y
         ZChVbbtk+Wbv+QFhwHqhRydTiYplXy6SXYJIpCuOVVfWn2uZOPMDZVez6Vss2fIEE5CI
         XB3sbFb3DUryHne6aDkHxEnsArkMADW0Qz489mJApZDS1LWvtpSRHNt/8YpWvmNlW2j6
         VPQQ==
X-Gm-Message-State: AOJu0YzUn9KEDlhKCXYje/k8sUvIpnKuo4SRVRbsk1QWdHnQo5EJZ21m
	VilaA7ZYtlDIRsUic4XloyDAVg85pLj+
X-Google-Smtp-Source: AGHT+IGiIq0zaZh/btgUHxJ+QF/THgb/C4d8hpXPtmu3u9DNwQxmkLvZqd3RLpyAcuUwkFoDPuqBkA==
X-Received: by 2002:a2e:a793:0:b0:2cd:284a:96e4 with SMTP id c19-20020a2ea793000000b002cd284a96e4mr2995623ljf.91.1704793131740;
        Tue, 09 Jan 2024 01:38:51 -0800 (PST)
Message-ID: <b4ed7764-a44c-4ac8-bb56-379fdeba16e8@suse.com>
Date: Tue, 9 Jan 2024 10:38:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v4 4/5] domctl: Use gsi to grant/revoke irq
 permission
Content-Language: en-US
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240105070920.350113-1-Jiqian.Chen@amd.com>
 <20240105070920.350113-5-Jiqian.Chen@amd.com>
 <alpine.DEB.2.22.394.2401051702200.3675@ubuntu-linux-20-04-desktop>
 <882bd39a-8a29-4f4f-b64f-765c4858b1c8@suse.com> <ZZwPSZoqyY6g9yhi@macbook>
 <BL1PR12MB58492746170F6BF777901141E76A2@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB58492746170F6BF777901141E76A2@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.01.2024 09:18, Chen, Jiqian wrote:
> On 2024/1/8 23:05, Roger Pau Monné wrote:
>> On Mon, Jan 08, 2024 at 09:55:26AM +0100, Jan Beulich wrote:
>>> On 06.01.2024 02:08, Stefano Stabellini wrote:
>>>> On Fri, 5 Jan 2024, Jiqian Chen wrote:
>>>>> --- a/tools/libs/light/libxl_pci.c
>>>>> +++ b/tools/libs/light/libxl_pci.c
>>>>> @@ -1418,6 +1418,7 @@ static void pci_add_dm_done(libxl__egc *egc,
>>>>>      unsigned long long start, end, flags, size;
>>>>>      int irq, i;
>>>>>      int r;
>>>>> +    int gsi;
>>>>>      uint32_t flag = XEN_DOMCTL_DEV_RDM_RELAXED;
>>>>>      uint32_t domainid = domid;
>>>>>      bool isstubdom = libxl_is_stubdom(ctx, domid, &domainid);
>>>>> @@ -1486,6 +1487,7 @@ static void pci_add_dm_done(libxl__egc *egc,
>>>>>          goto out_no_irq;
>>>>>      }
>>>>>      if ((fscanf(f, "%u", &irq) == 1) && irq) {
>>>>> +        gsi = irq;
>>>>
>>>> A question for Roger and Jan: are we always guaranteed that gsi == irq
>>>> (also in the PV case)?
>>>
>>> Iirc for IO-APIC based IRQs that's always the case;
>>
>> I think that's always the case on Linux, because it calls
>> PHYSDEVOP_map_pirq with index == pirq (see Linux
>> pci_xen_initial_domain()).  But other OSes could possibly make the
>> call with pirq == -1 and get a randomly allocated pirq for GSIs.
> I don't think it's important whether pirq is randomly generated. What's important is whether irq always equals gsi in xen.
> If so, we can directly pass in and grant gsi. However, according to Jan's previous email reply, in the case of Msi, irq may not be equal to gsi, so my patch cannot meet this situation.
> I am confusing if the current domain doesn't have PIRQ flag, then regarding to XEN_DOMCTL_irq_permission, which kind of irq we should grant to caller domain? The gsi or other irq?
> Or can we add a check in XEN_DOMCTL_irq_permission, if the current domain has PRIQ, we can get irq from pirq(like the original implementation), if not we can assign gsi to irq, and then grant irq. Of course, that needs to require the caller to pass in both the pirq and gsi.

I expect MSI will need handling differently from GSIs. When MSI is
set up for a device (and hence for a domain in possession of that
device), access ought to be granted right away.

>> IOW: I don't think the pirq field in xen_domctl_irq_permission can be
>> altered like proposed here to switch from passing a pirq to a GSI.  A
>> new hypercall should be introduced that either is GSI specific, or
>> contains a type field in order to specify the namespace the field
>> targets.
> A new hypercall using for granting gsi? If so, how does the caller know to call which hypercall to grant permission, XEN_DOMCTL_irq_permission or that new hypercall?

Either we add a feature indicator, or the caller simply tries the
new GSI interface first.

> I mean how the caller know if the current domain has PIRQ or not and when to pass in pirq number, when to pass in gsi number.

An interface that's GSI-centric would only ever be passed a GSI
(of course, I'm inclined to add).

Jan

