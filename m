Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 256083FC38E
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 09:56:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175528.319738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKycp-0003Kt-0I; Tue, 31 Aug 2021 07:56:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175528.319738; Tue, 31 Aug 2021 07:56:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKyco-0003J9-Tc; Tue, 31 Aug 2021 07:56:06 +0000
Received: by outflank-mailman (input) for mailman id 175528;
 Tue, 31 Aug 2021 07:56:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vpuq=NW=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mKycn-0003J3-Vo
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 07:56:06 +0000
Received: from mail-lj1-x22a.google.com (unknown [2a00:1450:4864:20::22a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 55488d5f-ef47-483a-9d92-65d10a4e0242;
 Tue, 31 Aug 2021 07:56:04 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id w4so30179622ljh.13
 for <xen-devel@lists.xenproject.org>; Tue, 31 Aug 2021 00:56:04 -0700 (PDT)
Received: from [192.168.10.179] ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id z4sm485339lfd.298.2021.08.31.00.56.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Aug 2021 00:56:02 -0700 (PDT)
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
X-Inumbo-ID: 55488d5f-ef47-483a-9d92-65d10a4e0242
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=3Y/7gSTPuhBhu3D8sxfp9aK/kQPJJ5nMl2xt1VIBTCU=;
        b=YZ5B9DO04WHX7rCCjmH0wuRdjwMiMG5W+MKzXusaJrKVnoJAeizabifFxkIU1bnF9j
         QmWfgpK30sa0bQh/2LeRyT7p7ws1+OdtE05oKG+HvbKqN9I0KqBWoq0Wc/RvEkUhPjeu
         tlgIl0fQFs0tYJKk35U3GrU9vOxJ5hitFJg40/OjymqlgwSpcPccPoXdER6hV1pGATKO
         StdanPTSVutCgEd9XMM94pw8EaujMKlRJYxpAzkR/ebmsXF76ZqsW2rmFw6DVckiAm9B
         5bOBHdLiGUTKV6OnRed5ft4xq1wI3gx4tHTxdKDXFjn2PqHc0Kdr+Ith5pXQVh2cj1sh
         YHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=3Y/7gSTPuhBhu3D8sxfp9aK/kQPJJ5nMl2xt1VIBTCU=;
        b=MS4TuvcJhgrttjbdiqJCbZ472c1pxV7Q6H3TrEPDEUpIcz7Q9vIYrgh1tmb0W85qQj
         PGzRUIGNXL+4L8tO1PqYkULdYiRz+DMm5dFBaBsCPXzJ0gXlk+mDC3dUWnYymKYdMTBx
         LZa/niG4WwsTUIB7yruhJTfpZKqyylDPBHjouyFi59Q/gZ7mEwhb03j+axomqDscH58N
         gWqmxiIR+j44nBAtN4RePwuFjmbdMZkbrbYMv/O5tAMuStok86XI1c3k5nBv/D+dUXH5
         sXul7RZzo7IjW2lSfB//xKzKdCfLYf7lQvfFFZ6rIHKkGI85sajAnTHEvy3T0f2jfRXm
         YRpA==
X-Gm-Message-State: AOAM531lpm98JavBF6TpZCBiCImxOVKvygywm70docg/EN9KNOYJ/0bl
	uHeix7R4OzctlzLqbBJyWqFN69t+yCvxzg==
X-Google-Smtp-Source: ABdhPJzwQhL/d8Y43WOH8pHJDqlN4ZOaLMsh/ntwZXZ6Cf0g1wp10dhZQjiq0bp3r+oAJxaArjXeqA==
X-Received: by 2002:a2e:9e04:: with SMTP id e4mr23384146ljk.431.1630396563323;
        Tue, 31 Aug 2021 00:56:03 -0700 (PDT)
Subject: Re: [PATCH RFC] vPCI: account for hidden devices in modify_bars()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6285981f-683f-a043-7025-993613eaea7c@suse.com>
 <b2e8863d-217a-fc0e-3176-a20ef5ad0872@gmail.com>
 <e87ad2a2-7ee0-a2e7-7bab-0c332aca7aec@suse.com>
 <3a6ca3ac-8771-2a80-285e-701c5c1b8343@gmail.com>
 <956dd02c-553e-6aa2-eedf-28703a6ded32@suse.com>
From: Oleksandr Andrushchenko <andr2000@gmail.com>
Message-ID: <13eb638e-c3c5-6794-c828-04c66bb2bd2f@gmail.com>
Date: Tue, 31 Aug 2021 10:56:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <956dd02c-553e-6aa2-eedf-28703a6ded32@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 31.08.21 10:47, Jan Beulich wrote:
> On 31.08.2021 09:06, Oleksandr Andrushchenko wrote:
>> On 31.08.21 09:51, Jan Beulich wrote:
>>> On 31.08.2021 07:35, Oleksandr Andrushchenko wrote:
>>>> Hello, Jan!
>>>>
>>>> On 30.08.21 16:04, Jan Beulich wrote:
>>>>> Hidden devices (e.g. an add-in PCI serial card used for Xen's serial
>>>>> console) are associated with DomXEN, not Dom0. This means that while
>>>>> looking for overlapping BARs such devices cannot be found on Dom0's
>>>>> list of devices; DomXEN's list also needs to be scanned.
>>>>>
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>> ---
>>>>> RFC: Patch intentionally mis-formatted, as the necessary re-indentation
>>>>>         would make the diff difficult to read. At this point I'd merely
>>>>>         like to gather input towards possible better approaches to solve
>>>>>         the issue (not the least because quite possibly there are further
>>>>>         places needing changing).
>>>>>
>>>>> --- a/xen/drivers/vpci/header.c
>>>>> +++ b/xen/drivers/vpci/header.c
>>>>> @@ -206,6 +206,7 @@ static int modify_bars(const struct pci_
>>>>>         struct vpci_header *header = &pdev->vpci->header;
>>>>>         struct rangeset *mem = rangeset_new(NULL, NULL, 0);
>>>>>         struct pci_dev *tmp, *dev = NULL;
>>>>> +    const struct domain *d;
>>>>>         const struct vpci_msix *msix = pdev->vpci->msix;
>>>>>         unsigned int i;
>>>>>         int rc;
>>>>> @@ -265,7 +266,8 @@ static int modify_bars(const struct pci_
>>>>>          * Check for overlaps with other BARs. Note that only BARs that are
>>>>>          * currently mapped (enabled) are checked for overlaps.
>>>>>          */
>>>>> -    for_each_pdev ( pdev->domain, tmp )
>>>>> +for ( d = pdev->domain; ; d = dom_xen ) {//todo
>>>> I am not quite sure this will be correct for the cases where pdev->domain != dom0,
>>>> e.g. in the series for PCI passthrough for Arm this can be any guest. For such cases
>>>> we'll force running the loop for dom_xen which I am not sure is desirable.
>>> It is surely not desirable, but it also doesn't happen - see the
>>> is_hardware_domain() check further down (keeping context below).
>> Right
>>>> Another question is why such a hidden device has its pdev->domain not set correctly,
>>>> so we need to work this around?
>>> Please see _setup_hwdom_pci_devices() and commit e46ea4d44dc0
>>> ("PCI: don't allow guest assignment of devices used by Xen")
>>> introducing that temporary override. To permit limited
>>> visibility to Dom0, these devices still need setting up in the
>>> IOMMU for Dom0. Consequently BAR overlap detection also needs
>>> to take these into account (i.e. the goal here is not just to
>>> prevent triggering the ASSERT() in question).
>> So, why don't we set pdev->domain = dom_xen for such devices and call
>> modify_bars or something from pci_hide_device for instance (I didn't get too
>> much into implementation details though)? If pci_hide_device already handles
>> such exceptions, so it should also take care of the correct BAR overlaps etc.
> How would it? It runs long before Dom0 gets created, let alone when
> Dom0 may make adjustments to the BAR arrangement.

So, why don't we call "yet another hide function" while creating Dom0 for that

exactly reason, e.g. BAR overlap handling? E.g. make it 2-stage hide for special

devices such as console etc.

>
> The temporary overriding of pdev->domain is because other IOMMU code
> takes the domain to act upon from that field.

So, you mean pdev->domain in that case is pointing to what?


>   This could have been
> solved without override, but then much heavier code churn would have
> resulted.
>
>> Otherwise it looks like we put some unrelated logic into vpci which is for hiding
>> the devices (on x86).
> Hiding devices is in no way x86-specific.

I mean that the use-case you have, e.g. a *PCI* console you want to hide,

is definitely not something used on Arm at least.

>
> Jan
>

