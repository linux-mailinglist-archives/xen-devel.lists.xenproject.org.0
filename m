Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A8960F31A
	for <lists+xen-devel@lfdr.de>; Thu, 27 Oct 2022 11:01:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430952.683290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onyla-0005bi-1l; Thu, 27 Oct 2022 09:01:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430952.683290; Thu, 27 Oct 2022 09:01:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onylZ-0005Yy-Ub; Thu, 27 Oct 2022 09:01:33 +0000
Received: by outflank-mailman (input) for mailman id 430952;
 Thu, 27 Oct 2022 09:01:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9cef=24=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1onylY-0005Ys-Gt
 for xen-devel@lists.xenproject.org; Thu, 27 Oct 2022 09:01:32 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f21dd7b1-55d5-11ed-8fd0-01056ac49cbb;
 Thu, 27 Oct 2022 11:01:30 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DM4PR12MB7527.namprd12.prod.outlook.com (2603:10b6:8:111::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Thu, 27 Oct
 2022 09:01:27 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2%7]) with mapi id 15.20.5746.028; Thu, 27 Oct 2022
 09:01:27 +0000
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
X-Inumbo-ID: f21dd7b1-55d5-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ftU+HrbBEXE7Fyn9WUzrecZKPG/9J1SMJVYq/1ZAi6Q4/BBZN4KMRXw0LqH6ljsFAlBI3foJvAnjwjFVZRFr+8v2N3nsQLf6mIO8147dWRlsJ4IM+ZPAU06iTyVnoHtt34MlCuyKbZWOyRh5J0t5jt7BJG7oFSjTaovEV6wFOpnz9SEQxW76KdIi8ec0hZDQawOJDtkvOYnX1ZEl+Hyuv0Fb65tp/joSJtVvxDHTeNotAdkmfgnvt0aEJS4AtX6AsDi5nHowWT9OCTbujigoyuSFQ45SE0aAWSRylV/CDqw022gWRhfFznsNpT2nFJDLFN1FahVemLci7rhh51z8AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QCNgseUlavDw11utYCVKkqM59r1bvjXmnK53anDayQI=;
 b=EK1FQgNVJPinQD1YzfARDNlHOPkGPCwkiRUmQigSNhhPRYYOA77xRGp1UmBLq5hl190s2jFbfFOY8j0NBSUOX0uInUJlnMP74R9A5q3VMatl/5/ZmMunTzKRjuCanS1/X9FaJrF96kiM25ERiwYvEP6oHh+ts/E8Aea2guAGzh7wQjtbxv7lgAGMW3OvCzcrkXHoEoQ3lwKDd/yQCpfOVLce3RKhP9NotrUoLDgJ8ZUT4kZ7hVirCmajkL/3R5PBiRMFaPjHylct4VOZ2y6UzzUXGB5x39or80eR2USJKrxkzq5knDPCEcaIajW+U6gsWjE/ri+9t1md43e1xU2VZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QCNgseUlavDw11utYCVKkqM59r1bvjXmnK53anDayQI=;
 b=yTc42Z1SLokPfEvW/NtJMqAYKgNDTUWJ0imv/FuroiABluw83Imyomk8LAS0q6eeVvaeZSpbwkjfK5fzRBUOWIdy1CC+Sll2AJ2vLLt5JQM5v04Gx3fGI0OA3Rw/13RlQVhS9l4VKEt560nTDGQ/72S1i90gZs9ZnGKsoATjXFQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <00baa14d-59bd-e106-23c8-b3f151f19eca@amd.com>
Date: Thu, 27 Oct 2022 10:01:20 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: Proposal for virtual IOMMU binding b/w vIOMMU and passthrough
 devices
To: Rahul Singh <Rahul.Singh@arm.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <Michal.Orzel@arm.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <DD70007C-300F-44D3-B314-A5F8C4582CD3@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <DD70007C-300F-44D3-B314-A5F8C4582CD3@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P265CA0022.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::17) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DM4PR12MB7527:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b361a48-0496-479e-a360-08dab7f9d4f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1i4vhv3AicknXum+ZI1FK6O+mzn0oqXtamyEu+pO4iW4lVDbKBPkK4DobHmLiGVfPAT/9kSUFDTM9OI+n8UDG3vcGv86LaJQiq7prEcY7M8SbdY0fta4pmm7DB9LvdFb/7Ng9UYxINUX8uRbVEtTEkgC+SX+bgoUfCIpnBW6ylJJ+BD2pE2DsOQ2WGMrUmmSux9/XzuwFPtk/eHzFq6uCRl/wMB8h6wxs7yKbMs4xXZws0heTdWr8yJOuBTho+HyAMVZgYozsnaFzLcbVmQu/WlZSpdNWyjqHt7b5xQpE0BguP8uZP6z3KtjKdkfbCCQHgku1o+g5X6eiLAghv0yJb6whoH8F0jkEniMSBQdOH80NNzP1+kPaZUdON45V9O/SjiTW1c2F2F0SF9aWBOrAd7uxxERVHYXyZoXLr0TJEPpFI/0Zhw3Wk3fcvbLfepcOzg4d9r5xCdRfyeg+uA2f5WcvPwfusD1n5amD1SOY3elgcrATkLpMzC0AHbB9vxPvOEW0kuSqd/1AEER3mlf6BpWbRnMdVcbzjBqRUu771OaRpRprZ0CC7sxgdzow/ByUAGA+mt/hMLXs+VA/n0Iui7Ut272+5mpfa/7BaQYcJCw3FKwvclyXEOhiQilVf78oA0jK1IYC+waN55EfBvn1r1r/82ssqqx9elObHKTK0/B5h8P0U9s/kv9j1G+Uyfd5Gmq2SqOQpRDM8ehT5aCgfUE925Y2vAOZfTO3ekdLRH64YqhaY41CIcTXmGw2Zo6aTYWwp/O5zGF87cJ/BMdfLBs4rPSOSt9+TtHg9YpUgffJ3XH6xmTqec+KERVDcw/xeilX/Oqb9mIy1D4inJu71eBxWNyFCbOOL0gTI2y0UM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(396003)(366004)(376002)(451199015)(31696002)(36756003)(31686004)(38100700002)(5660300002)(2906002)(7416002)(8936002)(83380400001)(53546011)(186003)(2616005)(6506007)(6666004)(26005)(6512007)(66556008)(54906003)(8676002)(478600001)(66476007)(110136005)(41300700001)(6486002)(4326008)(966005)(316002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bE1TMmR0OUJ6REViSUl5Q3J5Zkh4SmJ3MDdtMWpFUlJ3NWlTSzZaVWtnaFZY?=
 =?utf-8?B?UG9uSjE4ZE5TTHpXRGliNS9oWVE0YWt5TEw1UW5YeDBnS21kS1QxT3VqSE5a?=
 =?utf-8?B?MkFiTlJKTlhBd1JHZlFMR2VtYU9vNVhTL1lKdFNTZEZhZTFXVEh3SDdDaWps?=
 =?utf-8?B?QVQ2ZTlXMldyMWF1c2w2Zlc5S3NOU0d1R1JWS0xiZU1ENzhuZFRJdnRpNWtr?=
 =?utf-8?B?MmIrb2l3MERsSWEyYTcwdjZSZGltMEpYUExGaDQxNWhtRFg0YWVndFh2eWZP?=
 =?utf-8?B?M2l6YkFjejVTZjAwNVlPNU4vZVBLWDRwd2RpcmNTRzBsZWZwRlVCWkFqTlUy?=
 =?utf-8?B?ZHZGbXFKMFcwWUc3RFBkcStVV1duTkhnTGFrNkM4MHV4dHRneTZXUjFxdCtU?=
 =?utf-8?B?L2RXT3FnZVRKd0NYZ0NsV2dYa2VmSXMzNHhpc0I1VlNsMytMZXUxN0d2REZM?=
 =?utf-8?B?d1VKd0UzZzM1NVRIK1hTWnNvekpDbkFUQURDU3FJNHIrMkNaMVJHSFd1alh1?=
 =?utf-8?B?SVVla1VnUjY0VVdmQnowNitNR3ZZS3lXU0ZmaTdmQlcrSXp1SjFERnNLdDcx?=
 =?utf-8?B?bW5ZbWxac3EzUDZJb0xROVlZeFAzcllRd3ZrYzZoVjZJRkRVZ3ZvcGcrT2ds?=
 =?utf-8?B?T2tyV1BOaEJjQy9mU0VZeThGSEN4SjZ3ZEZ0b1RWaW5VblhrYUxYTlEyRVJw?=
 =?utf-8?B?VmpJTFhRRGEybi92b3NFQ3VvMzdYS0FTRGVzb2h5alplMXpuTE5hbUdQMGJn?=
 =?utf-8?B?TFNZLzRTY1ozd2poQ3ZTdjFOcjJqeWpLSnRNekgyeVdYcDAzWUNnR3IzbUFn?=
 =?utf-8?B?UjRQL3lDT2g2Q28vbTFXZmV6TnBxWTNyVElyWHFTdE53WHF0MTB4VmsvSEtC?=
 =?utf-8?B?bEl6TG00ZnA5dXltSytOR01hN0luZ3QrS0oveHA0aEFoY1pETnFtaWludldX?=
 =?utf-8?B?aFVnTENFQWk0T1NURmlkZGd2alJqRHBGMW5sNUVJdmpQSkQ2MlpOS3V1U2VJ?=
 =?utf-8?B?K1Y0Qm9JNkh1RFpXaGhkY2dUYU1vMzBSQllxZFVNa1lhQitkMUVvQ1VJL3Y0?=
 =?utf-8?B?SEJTRWNYTitLTklEREs1VThPTi94Mi9ndGMrQmZzUnJTb0JVMXU1T0sweE14?=
 =?utf-8?B?THZDWDEvdTF3RUNGRTkyM1ZCaFZvMUQ3YnVlS0JUUERDUm1UNnltUnVZSzNx?=
 =?utf-8?B?bi9USkFaZUVsUFVtRUdPNEs4QzJ1ZnVRb2MwczYrRkdiajVJUVVuSG5nK3pT?=
 =?utf-8?B?eUdyNktpMmgwaDNSS1MrQ0JKNjlkMUs1VFdhdUpKaTFzOTc0aU1mWGI2Q05G?=
 =?utf-8?B?cWwrZjZFN2FreG1CSUYydGlXRThWM0ZjUUYxckZScXRBbXlKc2Y1MkFyN0hG?=
 =?utf-8?B?UVVZaytyNFdINTEwM1JlR3lZamlZT3lXOXZDaExpMVFiRTVENWN2NzZzc0hE?=
 =?utf-8?B?S3RHY3hiTmNOSHU5UTQ3ekU2Zjc1NUlsbkJ4WGVMVk5DdCtWTVcvbWQ3RWI4?=
 =?utf-8?B?RlRoL3VXNGRqUUF1WWlWZG5YOFRWUWUvOEI5RndRUGEyRWZQbmQvUFBCdE4y?=
 =?utf-8?B?VGkxZ2x0VWpIVy9qY3dHSXQ1U1dnZGVGQXRidnN6bmdtRXh6SXFjOStadEVw?=
 =?utf-8?B?M1lqTTNHVEpuVG5RZlhxTGlWdGxzWjdLS3BHM3RPK3lYOFg4MTNzM2pUdXU5?=
 =?utf-8?B?VG9salNWOG5lVjMxUnNETVIzS1NsNjgyc2c3dW04OUpyTmk0ZTY2S1ljYnpD?=
 =?utf-8?B?V05pOUNCTnI4bmdaaXB3NUo0cmNwYTRxYU81WHVoS0xXRXFFcHgzaExxOThy?=
 =?utf-8?B?Q0djWnZkNEE1NXh3RlNybEx2WERhUDVEZ1pvSk1UZEdNNlFVMVowbUIvRFlU?=
 =?utf-8?B?dUJqTzh0cEhjS21qK1JmNVlWMG5mUndOZ2FSTi93cThaY0NTSkVOVlp1RzVW?=
 =?utf-8?B?eE52a0ozYUxKVU1UOGlYc3FuRURNUU1xTTdTdDUrdWxhZTNtWnNWcnVqQURm?=
 =?utf-8?B?UjNER2FPOEl1dXEwUkk3OHk0TExKOGF6aS94Smw0S3g4Yk0rVmh0N2xmaEND?=
 =?utf-8?B?NitxTTBVb1ZIb3ROMmc1V0hRRHlncTlVSE1OdjBGSG0vVWNudk8zWlFQQjAr?=
 =?utf-8?Q?l+JVmcpkdL6naME5bqmyMvnF7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b361a48-0496-479e-a360-08dab7f9d4f3
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 09:01:27.6166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jq+UTOPkL9xaFLuCHIghJqiDRnOE2/afn2+THass6NXjbR1U/g2t62lwiHj+WgsDEtcOYyDrip9dpHjh10YR4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7527


On 26/10/2022 14:17, Rahul Singh wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> Hi All,

Hi Rahul,

I have a very basic question.

>
> At Arm, we started to implement the POC to support 2 levels of page tables/nested translation in SMMUv3.
> To support nested translation for guest OS Xen needs to expose the virtual IOMMU. If we passthrough the
> device to the guest that is behind an IOMMU and virtual IOMMU is enabled for the guest there is a need to
> add IOMMU binding for the device in the passthrough node as per [1]. This email is to get an agreement on
> how to add the IOMMU binding for guest OS.
>
> Before I will explain how to add the IOMMU binding let me give a brief overview of how we will add support for virtual
> IOMMU on Arm. In order to implement virtual IOMMU Xen need SMMUv3 Nested translation support. SMMUv3 hardware
> supports two stages of translation. Each stage of translation can be independently enabled. An incoming address is logically
> translated from VA to IPA in stage 1, then the IPA is input to stage 2 which translates the IPA to the output PA. Stage 1 is
> intended to be used by a software entity( Guest OS) to provide isolation or translation to buffers within the entity, for example,
> DMA isolation within an OS. Stage 2 is intended to be available in systems supporting the Virtualization Extensions and is
> intended to virtualize device DMA to guest VM address spaces. When both stage 1 and stage 2 are enabled, the translation
> configuration is called nesting.
>
> Stage 1 translation support is required to provide isolation between different devices within the guest OS. XEN already supports

Doesn't this imply that there is support for Stage 1 translation for 
guests ? Otherwise, how will the guest provide isolation between 
different devices or dma-masters ?

- Ayan

> Stage 2 translation but there is no support for Stage 1 translation for guests.

> We will add support for guests to configure
> the Stage 1 transition via virtual IOMMU. XEN will emulate the SMMU hardware and exposes the virtual SMMU to the guest.
> Guest can use the native SMMU driver to configure the stage 1 translation. When the guest configures the SMMU for Stage 1,
> XEN will trap the access and configure the hardware accordingly.
>
> Now back to the question of how we can add the IOMMU binding between the virtual IOMMU and the master devices so that
> guests can configure the IOMMU correctly. The solution that I am suggesting is as below:
>
> For dom0, while handling the DT node(handle_node()) Xen will replace the phandle in the "iommus" property with the virtual
> IOMMU node phandle.
>
> For domU guests, when passthrough the device to the guest as per [2],  add the below property in the partial device tree
> node that is required to describe the generic device tree binding for IOMMUs and their master(s)
>
> "iommus = < &magic_phandle 0xvMasterID>
>          • magic_phandle will be the phandle ( vIOMMU phandle in xl)  that will be documented so that the user can set that in partial DT node (0xfdea).
>          • vMasterID will be the virtual master ID that the user will provide.
>
> The partial device tree will look like this:
> /dts-v1/;
>
> / {
>      /* #*cells are here to keep DTC happy */
>      #address-cells = <2>;
>      #size-cells = <2>;
>
>      aliases {
>          net = &mac0;
>      };
>
>      passthrough {
>          compatible = "simple-bus";
>          ranges;
>          #address-cells = <2>;
>          #size-cells = <2>;
>          mac0: ethernet@10000000 {
>              compatible = "calxeda,hb-xgmac";
>              reg = <0 0x10000000 0 0x1000>;
>              interrupts = <0 80 4  0 81 4  0 82 4>;
>             iommus = <0xfdea 0x01>;
>          };
>      };
> };
>
> In xl.cfg we need to define a new option to inform Xen about vMasterId to pMasterId mapping and to which IOMMU device this
> the master device is connected so that Xen can configure the right IOMMU. This is required if the system has devices that have
> the same master ID but behind a different IOMMU.
>
> iommu_devid_map = [ “PMASTER_ID[@VMASTER_ID],IOMMU_BASE_ADDRESS” , “PMASTER_ID[@VMASTER_ID],IOMMU_BASE_ADDRESS”]
>
>          • PMASTER_ID is the physical master ID of the device from the physical DT.
>          • VMASTER_ID is the virtual master Id that the user will configure in the partial device tree.
>          • IOMMU_BASE_ADDRESS is the base address of the physical IOMMU device to which this device is connected.
>
> Example: Let's say the user wants to assign the below physical device in DT to the guest.
>
> iommu@4f000000 {
>                  compatible = "arm,smmu-v3";
>                  interrupts = <0x00 0xe4 0xf04>;
>                  interrupt-parent = <0x01>;
>                  #iommu-cells = <0x01>;
>                  interrupt-names = "combined";
>                  reg = <0x00 0x4f000000 0x00 0x40000>;
>                  phandle = <0xfdeb>;
>                  name = "iommu";
> };
>
> test@10000000 {
>          compatible = "viommu-test”;
>          iommus = <0xfdeb 0x10>;
>          interrupts = <0x00 0xff 0x04>;
>          reg = <0x00 0x10000000 0x00 0x1000>;
>          name = "viommu-test";
> };
>
> The partial Device tree node will be like this:
>
> / {
>      /* #*cells are here to keep DTC happy */
>      #address-cells = <2>;
>      #size-cells = <2>;
>
>      passthrough {
>          compatible = "simple-bus";
>          ranges;
>          #address-cells = <2>;
>          #size-cells = <2>;
>
>          test@10000000 {
>                  compatible = "viommu-test";
>                  reg = <0 0x10000000 0 0x1000>;
>                  interrupts = <0 80 4  0 81 4  0 82 4>;
>                  iommus = <0xfdea 0x01>;
>          };
>      };
> };
>
>   iommu_devid_map = [ “0x10@0x01,0x4f000000”]
>          • 0x10 is the real physical master id from the physical DT.
>          • 0x01 is the virtual master Id that the user defines as a partial device tree.
>          • 0x4f000000 is the base address of the IOMMU device.
>
> [1] https://www.kernel.org/doc/Documentation/devicetree/bindings/iommu/iommu.txt
> [2] https://xenbits.xen.org/docs/unstable/misc/arm/passthrough.txt
>
> Regards,
> Rahul

