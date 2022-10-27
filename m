Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BC460F3E1
	for <lists+xen-devel@lfdr.de>; Thu, 27 Oct 2022 11:41:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430994.683400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onzO9-0006Na-4T; Thu, 27 Oct 2022 09:41:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430994.683400; Thu, 27 Oct 2022 09:41:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onzO9-0006Kv-1O; Thu, 27 Oct 2022 09:41:25 +0000
Received: by outflank-mailman (input) for mailman id 430994;
 Thu, 27 Oct 2022 09:41:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9cef=24=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1onzO7-0006Kp-90
 for xen-devel@lists.xenproject.org; Thu, 27 Oct 2022 09:41:23 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82cb5e5b-55db-11ed-8fd0-01056ac49cbb;
 Thu, 27 Oct 2022 11:41:20 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DM6PR12MB4579.namprd12.prod.outlook.com (2603:10b6:5:2ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.14; Thu, 27 Oct
 2022 09:41:16 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2%7]) with mapi id 15.20.5746.028; Thu, 27 Oct 2022
 09:41:16 +0000
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
X-Inumbo-ID: 82cb5e5b-55db-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HRxBJM4YJ673YXFVec1DkLMKavOFe1FbIdqIdtPHQvQCOFkUF0QyWFazce9ARyJGsbUDc8D6jIk/7V8FXv//Oek3vlko2g+6mhWw89WmxYjf0LUzhfOFoSHztHV8IQUDvqs4HnQL6JSFIoQiAAUl2EqGF4l1G0HRM0Tp4X29fNvp0yqL+SKsn39FJTGXnSxAFD926M3ZBrPUOrBQPy6Kg9MwW+YQJf8luRxr5b2hM3gWUkIne8Hw7CzGVj6fEl2cmsedCR0wpwXVAsIthhE7O0r4s1tDhvB0cRohTehgRJzezjZ+uog6dkTS/VmM5DXguF4WW3Su7uIbs72iJdLlIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dogu5ETNCI2EUoNrtXonyQcFnvOcxAMQZqJ65IMw7jI=;
 b=ERWY6afrr13IvipR2KEoRG8kR3WVioYpWNd9m6gUpUVwqhwwIic4g5ElF27eWYxTujOX3dgq13b5G3/32z/QgBMZo2BdtHyaBxDNDSTpZrOXTHLWRUBPs5hA907OlHVE8iaH0D7paz9EOoT3mYOW5CDbVAWftm4eVEiCU7nTMMdvdyx51Jfuayxu1vfz2HSI6wdsBUHG64YtMRipbr4kpE+ZmjGUK/vJY4/uAfCAkyo2sfzCkIvqqJdyAgtAXHB7CmXA3qHTj4S1gEhFlk8lMx/zQE/v8cPXuLeqzc9XKSJMmk3mg3lnzc/QCeZWofozCwYnKlL01sfhonUAxudAbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dogu5ETNCI2EUoNrtXonyQcFnvOcxAMQZqJ65IMw7jI=;
 b=EMmiowDsJsgHu5HKM9EVF2fZj++9wlGgmhSdf/IcDrUlX2H3tNgok/6PHIH9eQDxm6ruQoQXqQAVd8ikiwLSci19ZTmzl9HM+miyO8sBTP3LuyM3ZJ5zw4cuwXmoQiYQRvgnVQHDW9ogt93bPL71olbqhXYInOnqJNSNt6kNU88=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <96129ac0-29c1-3d7a-b047-377c1b242887@amd.com>
Date: Thu, 27 Oct 2022 10:41:11 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: Proposal for virtual IOMMU binding b/w vIOMMU and passthrough
 devices
From: Ayan Kumar Halder <ayankuma@amd.com>
To: Rahul Singh <Rahul.Singh@arm.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>
References: <DD70007C-300F-44D3-B314-A5F8C4582CD3@arm.com>
 <00baa14d-59bd-e106-23c8-b3f151f19eca@amd.com>
In-Reply-To: <00baa14d-59bd-e106-23c8-b3f151f19eca@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0520.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::16) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DM6PR12MB4579:EE_
X-MS-Office365-Filtering-Correlation-Id: 75334215-a9f2-4da1-1f3c-08dab7ff650c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yf52EcWxY6feFYufFbKfev1XmfIGTwDuU2+xN+nQ1db+9Asb4LPq2TuY3PNZr3K5xc511Z4RgxoNVi7rd8vXrwr0UkYZVmI9/C8sdqtHNlkdMPFwulnqiHUD9zsmYEbzDcv2M9MosY3R9YVuJjfhhE7KMtBlUp0c1R9Sdnlumis/YjSzIvrp/4tSoBcpINpZqc8LKYhxVhqGfR++Y/KFaARgK8uf5l/xvCk5vT2lWpoYmiKZBr1A1/7GRZpXq6ep/FjzE0a4xITp4CXLshzKLF2By6TyEL6gGLs3vRtuZ+mu7+GuhwB8SbIv2HxdAB745/Z92UCV/yiqt05YNSt3d9cJQPVpMfX2mBKcjn5Acp/hCfxzvp2WT4vwH5kezx5+Xig4JL+g1YhuQqjSPmd1u9MPi8N2vKwaJGZCPyBwB+vPpJ5CqhCG8HTfWQ50P5wdXD/hiYxgrtMezjL3lt+Uem58IqZPwQzsNuGu3AoUkpBNgySjPX0/x9uoR69qvonrh4Ttv16Wmq7+fd9i1NJe+ODJS80C2Z2Hx/CaUqlMGCNoqwXbVepNZ3OUrSVJGv0wSr93WhLfqzIijtL+Updzy7mZ8oo3OyHZnaLsNtbsy878pO98E5xNaTNlVNoHcggpV2zzCgM6RCPA2BG5QGfl1/vyLNJPzCOGc3MrHlypbYZYJIDDu+5fOn5mo9awqBcyoPuz2+WhYheRDxEUC39EJjh4Zsv0vy4uCtu8WIYgoaPZXsV4JeX4AO94cBYApnbv2XSIi0Lz8nSGRnP42WnhDiFT7+7tPq3kS2wqR7DL9W+Go/C3SC2yN9ZDKkVJbKB5mA5zZ1KANZQPHHsit+nXdnAfwSk5bwqXHf9gKSyEKsk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(346002)(39860400002)(376002)(396003)(451199015)(6666004)(6506007)(53546011)(36756003)(2906002)(8676002)(66476007)(66556008)(66946007)(316002)(110136005)(83380400001)(31696002)(2616005)(186003)(6512007)(26005)(41300700001)(8936002)(5660300002)(478600001)(6486002)(31686004)(966005)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUVuVVM5a0ZrSmdCREhOcVBvQk1hUklmREhBejF5L2NlZGtKSmZrMG9wT3pu?=
 =?utf-8?B?MXk0RTZGSEplanFSVWRtSXZ1OEpTeDI5T3RnUUVMSmNjcTBVQ3RmeW9UdHlm?=
 =?utf-8?B?NnlES2VGMy85cmNKQVlHUTNpUklXSWgwTGh0dlVLUjF4NGZtcEgxMXRadHRr?=
 =?utf-8?B?NlltT2VQQmdJYWQ1ZllpOXlCSmVEU1d6UTlsWnl1b1hBNjdRTng1dWQyMVdz?=
 =?utf-8?B?dmloY2UwWGJrYXlLRm1scHpremVyU3YrdjhFV3ZaM2h5VVdWQ1FmcTRnU3Fi?=
 =?utf-8?B?TTEzYnlUL1JxZy9oRVY1RXdOUDBLazZzRkFRUjRvbjk3RUlWamxJRFR3RnpN?=
 =?utf-8?B?MVZFYXBNOUgvMU5rd1U1WmVzL0dWSFJTY1JRZXdpb3JnMWhWZGp3d2RTYUdB?=
 =?utf-8?B?MHhJdzBHWFBGUGUrSFowZzlvaUNsQ1RCN2FjenFmekJwbWdPWVVPYngrUms1?=
 =?utf-8?B?VFBaSlZES2gzVGpoNWNPNlJrRzkwTzRlVWxucmNLVUl5WjZXd29ManNsdi9T?=
 =?utf-8?B?YmFRbGhZWEl0aUJXb3o3TmYzZXFub0FyZzlVVWE1VGhCd2VYNEFzMnl1U0w5?=
 =?utf-8?B?b3hWVERQV0ZYVFNtbkZiNmx5Wk82NjI2ekREV1R2THJlSUlta0MzOFJHeVM0?=
 =?utf-8?B?bmtQaUxPeGFUakorbEdpQzZzVEw1cExkaDJIY05LNWpWSWpsVHJEbXNSMVQx?=
 =?utf-8?B?bU05QjJtZ3ZmaHIyUFBGSjNhSVRGV2txYjVRYnlyb0hOQzVheHQ5ZjVoZ3RS?=
 =?utf-8?B?WjVuL1FvU3lMUHphUkYra25JVm1lam00d1VnVGVJQTVHVE1Uak5lQktidHBN?=
 =?utf-8?B?dlkrbU5wS3VxY0sxdFYvQjJYMDlvM1ZyRTVLeG9DOXBMS25ERS9sRjBSbmRp?=
 =?utf-8?B?ZnZvazZ6ejI5RDR0VjZLbWZyclZLK014MXhXZ2pHbW1zK01aQU4yMlpLYUxB?=
 =?utf-8?B?YzNBYlFYNUFkVHJ4SUZXcDgrdDFVQnhqYytocTFrK05TbGgySWE1bEZOL1A3?=
 =?utf-8?B?QjFCU1I1cnFVcW5rWXplL1EwK1RKdFVsZGJsd2Y5aUZvSWJVR3h3VCtRNUpX?=
 =?utf-8?B?SlFoNUltQmdWdHo2OEVIS0F0VkZvbWJoc2pYSndqUmRRR2RpWjhnaFpKR0I4?=
 =?utf-8?B?RmlJdURFNmFTOVIreGJrL0lvMmpDdlFzemlpaG0zWTB0VEdrTm04WWFOS2pE?=
 =?utf-8?B?Wm9GcEg5VmlOWEU4RzdaR1cwZ01DeEdGYXAzblR6OWZCMW5VUExOSmZQN3Ew?=
 =?utf-8?B?dG1RdDN5ayt4V2xaNEprbE5jMWZQYUJZWk0rYUxVWE5uVEZnV2NWNGthbmtx?=
 =?utf-8?B?dUFQTGx2dFk5czJ6L1Z1cE1aZkpFMFJ4alJUUlVjODZXMlEvaHltd3ZLVnNa?=
 =?utf-8?B?WjJLN2xndHMzTzIzSWl4Y1pObXBmVERlbklEbXk1cml5akJiRlZ5SUpueExl?=
 =?utf-8?B?SEhFN0NkU0RxSkNQRUxGRWw1d2RBOGJKYW1UWjdJbkNsZ0lXVE5pZ0JuMytY?=
 =?utf-8?B?d3RTRVFsYkVhRWZhVkNyamk4ZEtkUWl5Z0JleTJMRFRUMlpucTB2WVc3NEFK?=
 =?utf-8?B?UjQzeXZVeFdLYTZxQ2FoL0xiRk02dDBhT3FwRzl5cGZRNjlSc3VIK2NmRTE3?=
 =?utf-8?B?OEZpRG5reFZiaE1MeVhKTGlQbVhYeVlibko1NWUrc21vZmVYdExNUzc0K0Z6?=
 =?utf-8?B?ZXlHMFdpeDRuTERYaGkvL1VrU0ZoUlZadlNGZVVZanh5bHBXdVhwUmhJQmpX?=
 =?utf-8?B?TmhGUVhmdGdYN0JTK2FaWVpYN3QwdjZ0REhXdWw3UGtFNWJOWFRsZXVVNjVp?=
 =?utf-8?B?T21ZRU1HSi9Ndm1kNHUwd1RPTTNaRHBtZFdUem1vRXIzYTB0dU42aE9pWnE4?=
 =?utf-8?B?UE9HTXEvTytzQjlIMW9FbEswTk9WVEl1MWFERDNhYzBQNFgwdUVLMDhzQlpz?=
 =?utf-8?B?U0U0RlArRFBNWC9UdjA3SFhjTzVMbWNXTFF5UUtaYjVuTjEwK1lPVklQaGNh?=
 =?utf-8?B?elNRYUIxUDNRZjUxa2JFdFlBQzlJRlNCRTQrbWVJVjJEQjhlSm9rRnhnR3BC?=
 =?utf-8?B?S1JlbVlHblErYUpOTUhSRXZ6QVgxSSt0VGZodnBqNytVc0hZYVdKVGRrWGx3?=
 =?utf-8?Q?Z2O0diAyoVePo95rUr4v/LX+A?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75334215-a9f2-4da1-1f3c-08dab7ff650c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 09:41:16.7901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zZwzpsY4xD8/mCMjz5Qoj7TVD2cYw93WrTPsabyxGu3gBRrWJITIOa8tGgYu48rld2lhKoNjTe25qhDdY5NpIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4579


On 27/10/2022 10:01, Ayan Kumar Halder wrote:
>
> On 26/10/2022 14:17, Rahul Singh wrote:
>> CAUTION: This message has originated from an External Source. Please 
>> use proper judgment and caution when opening attachments, clicking 
>> links, or responding to this email.
>>
>>
>> Hi All,
>
> Hi Rahul,
>
> I have a very basic question.
>
>>
>> At Arm, we started to implement the POC to support 2 levels of page 
>> tables/nested translation in SMMUv3.
>> To support nested translation for guest OS Xen needs to expose the 
>> virtual IOMMU. If we passthrough the
>> device to the guest that is behind an IOMMU and virtual IOMMU is 
>> enabled for the guest there is a need to
>> add IOMMU binding for the device in the passthrough node as per [1]. 
>> This email is to get an agreement on
>> how to add the IOMMU binding for guest OS.
>>
>> Before I will explain how to add the IOMMU binding let me give a 
>> brief overview of how we will add support for virtual
>> IOMMU on Arm. In order to implement virtual IOMMU Xen need SMMUv3 
>> Nested translation support. SMMUv3 hardware
>> supports two stages of translation. Each stage of translation can be 
>> independently enabled. An incoming address is logically
>> translated from VA to IPA in stage 1, then the IPA is input to stage 
>> 2 which translates the IPA to the output PA. Stage 1 is
>> intended to be used by a software entity( Guest OS) to provide 
>> isolation or translation to buffers within the entity, for example,
>> DMA isolation within an OS. Stage 2 is intended to be available in 
>> systems supporting the Virtualization Extensions and is
>> intended to virtualize device DMA to guest VM address spaces. When 
>> both stage 1 and stage 2 are enabled, the translation
>> configuration is called nesting.
>>
>> Stage 1 translation support is required to provide isolation between 
>> different devices within the guest OS. XEN already supports
>
> Doesn't this imply that there is support for Stage 1 translation for 
> guests ? Otherwise, how will the guest provide isolation between 
> different devices or dma-masters ?

Michal explained to me offline. This query is answered. Sorry for the noise.

- Ayan

>
> - Ayan
>
>> Stage 2 translation but there is no support for Stage 1 translation 
>> for guests.
>
>> We will add support for guests to configure
>> the Stage 1 transition via virtual IOMMU. XEN will emulate the SMMU 
>> hardware and exposes the virtual SMMU to the guest.
>> Guest can use the native SMMU driver to configure the stage 1 
>> translation. When the guest configures the SMMU for Stage 1,
>> XEN will trap the access and configure the hardware accordingly.
>>
>> Now back to the question of how we can add the IOMMU binding between 
>> the virtual IOMMU and the master devices so that
>> guests can configure the IOMMU correctly. The solution that I am 
>> suggesting is as below:
>>
>> For dom0, while handling the DT node(handle_node()) Xen will replace 
>> the phandle in the "iommus" property with the virtual
>> IOMMU node phandle.
>>
>> For domU guests, when passthrough the device to the guest as per 
>> [2],  add the below property in the partial device tree
>> node that is required to describe the generic device tree binding for 
>> IOMMUs and their master(s)
>>
>> "iommus = < &magic_phandle 0xvMasterID>
>>          • magic_phandle will be the phandle ( vIOMMU phandle in xl)  
>> that will be documented so that the user can set that in partial DT 
>> node (0xfdea).
>>          • vMasterID will be the virtual master ID that the user will 
>> provide.
>>
>> The partial device tree will look like this:
>> /dts-v1/;
>>
>> / {
>>      /* #*cells are here to keep DTC happy */
>>      #address-cells = <2>;
>>      #size-cells = <2>;
>>
>>      aliases {
>>          net = &mac0;
>>      };
>>
>>      passthrough {
>>          compatible = "simple-bus";
>>          ranges;
>>          #address-cells = <2>;
>>          #size-cells = <2>;
>>          mac0: ethernet@10000000 {
>>              compatible = "calxeda,hb-xgmac";
>>              reg = <0 0x10000000 0 0x1000>;
>>              interrupts = <0 80 4  0 81 4  0 82 4>;
>>             iommus = <0xfdea 0x01>;
>>          };
>>      };
>> };
>>
>> In xl.cfg we need to define a new option to inform Xen about 
>> vMasterId to pMasterId mapping and to which IOMMU device this
>> the master device is connected so that Xen can configure the right 
>> IOMMU. This is required if the system has devices that have
>> the same master ID but behind a different IOMMU.
>>
>> iommu_devid_map = [ “PMASTER_ID[@VMASTER_ID],IOMMU_BASE_ADDRESS” , 
>> “PMASTER_ID[@VMASTER_ID],IOMMU_BASE_ADDRESS”]
>>
>>          • PMASTER_ID is the physical master ID of the device from 
>> the physical DT.
>>          • VMASTER_ID is the virtual master Id that the user will 
>> configure in the partial device tree.
>>          • IOMMU_BASE_ADDRESS is the base address of the physical 
>> IOMMU device to which this device is connected.
>>
>> Example: Let's say the user wants to assign the below physical device 
>> in DT to the guest.
>>
>> iommu@4f000000 {
>>                  compatible = "arm,smmu-v3";
>>                  interrupts = <0x00 0xe4 0xf04>;
>>                  interrupt-parent = <0x01>;
>>                  #iommu-cells = <0x01>;
>>                  interrupt-names = "combined";
>>                  reg = <0x00 0x4f000000 0x00 0x40000>;
>>                  phandle = <0xfdeb>;
>>                  name = "iommu";
>> };
>>
>> test@10000000 {
>>          compatible = "viommu-test”;
>>          iommus = <0xfdeb 0x10>;
>>          interrupts = <0x00 0xff 0x04>;
>>          reg = <0x00 0x10000000 0x00 0x1000>;
>>          name = "viommu-test";
>> };
>>
>> The partial Device tree node will be like this:
>>
>> / {
>>      /* #*cells are here to keep DTC happy */
>>      #address-cells = <2>;
>>      #size-cells = <2>;
>>
>>      passthrough {
>>          compatible = "simple-bus";
>>          ranges;
>>          #address-cells = <2>;
>>          #size-cells = <2>;
>>
>>          test@10000000 {
>>                  compatible = "viommu-test";
>>                  reg = <0 0x10000000 0 0x1000>;
>>                  interrupts = <0 80 4  0 81 4  0 82 4>;
>>                  iommus = <0xfdea 0x01>;
>>          };
>>      };
>> };
>>
>>   iommu_devid_map = [ “0x10@0x01,0x4f000000”]
>>          • 0x10 is the real physical master id from the physical DT.
>>          • 0x01 is the virtual master Id that the user defines as a 
>> partial device tree.
>>          • 0x4f000000 is the base address of the IOMMU device.
>>
>> [1] 
>> https://www.kernel.org/doc/Documentation/devicetree/bindings/iommu/iommu.txt
>> [2] https://xenbits.xen.org/docs/unstable/misc/arm/passthrough.txt
>>
>> Regards,
>> Rahul
>

