Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7798D4698DD
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 15:27:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239094.414435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muExQ-0002TH-0x; Mon, 06 Dec 2021 14:27:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239094.414435; Mon, 06 Dec 2021 14:27:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muExP-0002Jg-Qj; Mon, 06 Dec 2021 14:27:07 +0000
Received: by outflank-mailman (input) for mailman id 239094;
 Mon, 06 Dec 2021 14:27:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BmDh=QX=gmail.com=ltykernel@srs-se1.protection.inumbo.net>)
 id 1muEq7-0004et-40
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 14:19:35 +0000
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [2607:f8b0:4864:20::1029])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88b39947-569f-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 15:19:34 +0100 (CET)
Received: by mail-pj1-x1029.google.com with SMTP id
 cq22-20020a17090af99600b001a9550a17a5so10934053pjb.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 Dec 2021 06:19:34 -0800 (PST)
Received: from ?IPV6:2404:f801:0:5:8000::50b? ([2404:f801:9000:1a:efea::50b])
 by smtp.gmail.com with ESMTPSA id
 h1sm3517800pfh.219.2021.12.06.06.19.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Dec 2021 06:19:32 -0800 (PST)
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
X-Inumbo-ID: 88b39947-569f-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=7+TjBg26qYjN6N7+9VcAF9zyslm2ABiWax4bLutA+tA=;
        b=f9M5JLJRG6hZFPCcZ1VGBj6dk4h92i9GiiVgKsNNUQFiDTSIXmaER9IaQWziUfrQ/0
         qa3GNaf/njTkL1uJ81a318oppGqxeZ4BbcT9GGYMjs1cw8PHMlBEDdFp5Gu7W2ZYhqeP
         DQ0dE5SsoRhc/sIPqjG5IRHWnrHc+0w5hEjT3ppnETiBZyKvJyuh5hygqrwyVBhoEnmJ
         IwRmbyJ5sNomLrxjpRo1y9wtWt2MJXEM2X247X8t1UvJ2rV20IbyXdb2S1lE9i34MGPO
         C7yQKcwPzpoDJz5kk+NMg8L4gzvSsI27nnr11s1xyG3B7cafIHH1YyJFJ5x78gBD3amG
         bCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7+TjBg26qYjN6N7+9VcAF9zyslm2ABiWax4bLutA+tA=;
        b=AsLxf+NrMQ+Hdoz/4wR0YGhShW9kAzc97SHwTVyzapizK0eumDn3vJqeyJtAgpVXVY
         ZfQ3qUYl504DwXosCScNJyrxcSMXqToLly9RmUPbKHFadpLDysZL+4MYeVPMlxggljMs
         +1s2VYkc3S9dK2j5XYkyNZUAaUB+EBdr6ZYh0ajkPk38h9+x+TpkTd3knGEPM1niQD7s
         BImW0/TQHoD4odCYzLb0gGFqotfo0Tfsj+HsLITuO3CWkyFjCLfnh9vZx/gEIie3zmu0
         VByuMQVSfivZWX1gTQqiBXm/4VEyN0bh/OWtJTacCcpkVQqOabtiz5OsfVpk7OHT2cMD
         sAiA==
X-Gm-Message-State: AOAM533MyZYOulihaYOXlZkOmnE5ExOYDbQafSQuTK+sw7++Qr6IbFJI
	qkdpdTM/UV9xOiUPMEzxSew=
X-Google-Smtp-Source: ABdhPJw5eBcqMnlmCu3VP7SDK7JlPHBF3sS/6sU5CfZhorAn8F+Tm/Z37W+b1RJF7S8Gmv/jOQFzmw==
X-Received: by 2002:a17:90b:4b51:: with SMTP id mi17mr37838716pjb.48.1638800372941;
        Mon, 06 Dec 2021 06:19:32 -0800 (PST)
Message-ID: <581569ce-b166-1cad-2624-66de319cc2b9@gmail.com>
Date: Mon, 6 Dec 2021 22:19:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH V4 3/5] hyperv/IOMMU: Enable swiotlb bounce buffer for
 Isolation VM
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, kys@microsoft.com,
 haiyangz@microsoft.com, sthemmin@microsoft.com, wei.liu@kernel.org,
 decui@microsoft.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 sstabellini@kernel.org, boris.ostrovsky@oracle.com, joro@8bytes.org,
 will@kernel.org, davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
 martin.petersen@oracle.com, arnd@arndb.de, hch@infradead.org,
 m.szyprowski@samsung.com, robin.murphy@arm.com, thomas.lendacky@amd.com,
 Tianyu.Lan@microsoft.com, xen-devel@lists.xenproject.org,
 michael.h.kelley@microsoft.com
Cc: iommu@lists.linux-foundation.org, linux-arch@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, netdev@vger.kernel.org, vkuznets@redhat.com,
 brijesh.singh@amd.com, konrad.wilk@oracle.com, hch@lst.de,
 parri.andrea@gmail.com, dave.hansen@intel.com
References: <20211205081815.129276-1-ltykernel@gmail.com>
 <20211205081815.129276-4-ltykernel@gmail.com>
 <a5943893-510a-3fc8-cbb7-8742369bf36b@suse.com>
 <125ffb7d-958c-e77a-243b-4cf38f690396@gmail.com>
 <ed9aa3d5-9ac8-2195-e617-85599ffd7864@suse.com>
From: Tianyu Lan <ltykernel@gmail.com>
In-Reply-To: <ed9aa3d5-9ac8-2195-e617-85599ffd7864@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/5/2021 6:31 PM, Juergen Gross wrote:
> On 05.12.21 09:48, Tianyu Lan wrote:
>>
>>
>> On 12/5/2021 4:34 PM, Juergen Gross wrote:
>>> On 05.12.21 09:18, Tianyu Lan wrote:
>>>> From: Tianyu Lan <Tianyu.Lan@microsoft.com>
>>>>
>>>> hyperv Isolation VM requires bounce buffer support to copy
>>>> data from/to encrypted memory and so enable swiotlb force
>>>> mode to use swiotlb bounce buffer for DMA transaction.
>>>>
>>>> In Isolation VM with AMD SEV, the bounce buffer needs to be
>>>> accessed via extra address space which is above shared_gpa_boundary
>>>> (E.G 39 bit address line) reported by Hyper-V CPUID ISOLATION_CONFIG.
>>>> The access physical address will be original physical address +
>>>> shared_gpa_boundary. The shared_gpa_boundary in the AMD SEV SNP
>>>> spec is called virtual top of memory(vTOM). Memory addresses below
>>>> vTOM are automatically treated as private while memory above
>>>> vTOM is treated as shared.
>>>>
>>>> Hyper-V initalizes swiotlb bounce buffer and default swiotlb
>>>> needs to be disabled. pci_swiotlb_detect_override() and
>>>> pci_swiotlb_detect_4gb() enable the default one. To override
>>>> the setting, hyperv_swiotlb_detect() needs to run before
>>>> these detect functions which depends on the pci_xen_swiotlb_
>>>> init(). Make pci_xen_swiotlb_init() depends on the hyperv_swiotlb
>>>> _detect() to keep the order.
>>>
>>> Why? Does Hyper-V plan to support Xen PV guests? If not, I don't see
>>> the need for adding this change.
>>>
>>
>> This is to keep detect function calling order that Hyper-V detect 
>> callback needs to call before pci_swiotlb_detect_override() and 
>> pci_swiotlb_detect_4gb(). This is the same for why
>> pci_swiotlb_detect_override() needs to depend on the 
>> pci_xen_swiotlb_detect(). Hyper-V also has such request and so make 
>> xen detect callback depends on Hyper-V one.
> 
> And does this even work without CONFIG_SWIOTLB_XEN, i.e. without
> pci_xen_swiotlb_detect() being in the system?
> 
Hi Juergen:
	Thanks for your review. This is a issue and I just sent out a v5 which 
decouples the dependency between xen and hyperv.

