Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE46A6F7CE3
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 08:20:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530228.825707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puoo8-00050g-Mk; Fri, 05 May 2023 06:20:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530228.825707; Fri, 05 May 2023 06:20:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puoo8-0004xI-Ie; Fri, 05 May 2023 06:20:44 +0000
Received: by outflank-mailman (input) for mailman id 530228;
 Fri, 05 May 2023 06:20:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1puoo6-0004x8-SB
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 06:20:42 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2042.outbound.protection.outlook.com [40.107.7.42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f53ffeab-eb0c-11ed-8611-37d641c3527e;
 Fri, 05 May 2023 08:20:40 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by VI1PR04MB9834.eurprd04.prod.outlook.com (2603:10a6:800:1d8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Fri, 5 May
 2023 06:20:10 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7%7]) with mapi id 15.20.6363.027; Fri, 5 May 2023
 06:20:10 +0000
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
X-Inumbo-ID: f53ffeab-eb0c-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iW+9YASDFAiHQ1cOYC1L31SClQjeEEcHNqOoJxh6jz1k3MG++Ebd9T++0AjmQR2UZLIHVY4IAbgXUPg52ZYqv9qTwVg6TRXe6/NOR8+4touxdF8DMPGXhoZMvlJPWB3qiPoByjREkW4RJgAXaRtxHG8LErR182UFgsTg//sjTx2esS3VL3/bMToyxOhi30xXOLWynhXHBUuEs+3RRggWsBJKXZz8iPLQbqJUd+Aj8AVV8Icf78UFQuYrq57137zoOSo7qeUnib7gipOr38We+gHWf3lr+Tkxr82pBLTyiJFrziI+7h1iEGa1WBiaAT3ydwSfWbzqKyvkqWPz3ndgEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l2XOraMKft/weyDy7v9639q6Tj2Q7kLZesPrPA1WRv8=;
 b=ex9g4BPHRtCAg5ZuhVbI3+GA8traZN9pMW9OT9Fih9VIQTInrjJVYsBx59Q2/XyaQCFl5pYxr9JaFAKxat3iIpjY2dkVXx6ahPxiqtVq8LO77jsDlLkrlqrvk5nI16Cz+AY/PLv954790KK+jGqo33pbIk87t3Ewo5b8BnajMuEidEOacR/GwUVuVLvd7CNG/P7UZu7QTQgMVR8dR71LXyrdPPWfHK1xsc36A2D3NFv7EHxjIEZTPDUq8n/1VnpxbgGejNBSHGG1I1omUHkD3Q5iIAEzfBA21pbuia7k5Cupm1MkOQFUABCLNpJ4Y3ZmQjgSBZMge62TUaDJRkIaXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l2XOraMKft/weyDy7v9639q6Tj2Q7kLZesPrPA1WRv8=;
 b=RzBppbgDs9KQXENfkvt191B7awboU34hgpn21a/HUwMHXZw36yi87/NeJwBHweSrF5bR70jT4XiyBDfCBfqqnWeWvM09cqfGyXThIszOaDKu17/QCZzw+EqnM0DMmUJ0trOLWhClIwCOGLgaHYLybS5SFIYp4/ZFwKVlucI3Fq2nb/cJbNlEvBGwuvf+ZJwhyUJg6POGKxjXxWvj+rN2BHOC9dSODicTR4Z0Bi7FM2HURQY4td8cCRjKdw7yvn8gKVRwAvpd7KyX0m1PiE0pKuikBJyQxzYn73wQxi97H9Y0/F1YvUtBqCeVH5wj54uke7vJpfh3T9Yz3mWB6YAcnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <39f9548b-6a07-3d74-1975-8f17153f2d14@suse.com>
Date: Fri, 5 May 2023 08:20:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v1 3/6] iommu/arm: Introduce iommu_add_dt_pci_device API
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20230501200305.168058-1-stewart.hildebrand@amd.com>
 <20230501200305.168058-4-stewart.hildebrand@amd.com>
 <0e7404fe-e249-7b3f-0628-b8b8b1925765@suse.com>
 <6758ef37-bf66-99c3-1fd4-f2edfc12513a@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6758ef37-bf66-99c3-1fd4-f2edfc12513a@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0181.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::17) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|VI1PR04MB9834:EE_
X-MS-Office365-Filtering-Correlation-Id: 815c48f5-8092-4c98-9a5a-08db4d30c746
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P7khCtcfZuGVtTda07iRio+rgWc+4Non8tGRfMDNUe+cDXWyFQ2i/PBbZwR9M4YWy4A6FxjI5PiiExyY2fbklGVo2TsJ4cOOHTDFBbEYx0AoGJqIKJyBXHdfqcUPYQxOJSqa2ST+xpiAfOVn5yN6JKN5DjA4ZGbMmJ4EjjxMp9XVXsLzqlZ4QBv1Fq/YiPNv0r9wPK67lEgY8XmaomBy5Eb1jrAuELv60mDq4pLYzFrlBtdeVz+2lN84bW8FxP8He/SmrNJYP1QZnJIhYwP175CMFKTOV+wUH68fgMWTJEvuVgMm1O25qhwbgY6Xc5qCXSZPiGGjkyIzKLC8FTyjRqfN3e3KnB4rIlc6cvX3Cxx/unta6G1b5MQ5jGO6egfSmUAKrN6t8csw9OK92uHMOV5vLnB9NGZjaQSv1n6J3dgb7NH8tA4W3uwhX6Kv4bNmMlO8ABmuW7ZoRWCXKVdxLKorG2CxMXwSWjBTUmarBcemBkGX99oBZ7ZnEkeXOCSyl67CpFkNiH0yAtjStTTeleGGkXHlWjnXNNCWtGr10QMfD+2Ih6os34Fea2PDRXnPBkoy0nZQhtOs3nIVbZRhOrbCYBfLB9+tZNWS71Oo55o72alEU/Xc42UxZnFdER+h0Z+krymly1Tu1fJgE+sQ6A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39850400004)(136003)(396003)(366004)(346002)(451199021)(5660300002)(8676002)(8936002)(966005)(6486002)(38100700002)(86362001)(26005)(83380400001)(31696002)(2616005)(53546011)(186003)(66556008)(66476007)(2906002)(66946007)(316002)(6916009)(6506007)(6512007)(41300700001)(4326008)(36756003)(54906003)(31686004)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTZqemxGWk1wcmJod09JZlpKaWhjZXdMUTVZUGRzWktXc1pMRURUZ0paRE1B?=
 =?utf-8?B?V1pHenRmaEtDa3lESG9IamNQazdFdTRxbUNTbFhMbDI5QVN5RVlienVTdG85?=
 =?utf-8?B?b1BrOVQ1SWdlS1ZZNng0anBvbzdNeXlHYlA4bmRJeTZpSzhjaDBGWkdMY2c2?=
 =?utf-8?B?bGR2Q1RaZWwyR05CNlhITEFScENoT3A2aXpjNFFTaDhlNGxmWTVVeHVMckFj?=
 =?utf-8?B?eFZYblo2UXdMUmFJd1o0ejhqdHB3eUJnK2tEOTNDZjk5WjJBM0tjYjJjbE9C?=
 =?utf-8?B?eGdxN29jRnVsL053TUMwYVh5dVIxNWV5cFMxY1hWOE5MQzV0RU5qZUltTTdX?=
 =?utf-8?B?VDYrRUNQNUcvTVZmTDIrcXpyU0ZNdVZtUnhlcjZIMzhJM1FZWnpmSkkwMC9Q?=
 =?utf-8?B?bHhaZUkrU0pzYVA4cmgvTEhEY3VWOUJkdk52R1hmUFRmVkNnN0ZzbmRZbXds?=
 =?utf-8?B?T1crMUNCYlg5UFdzL25CcXdHWmFrTFhXY3BrZTVRY3ovb2dCVktxMmx6T0J5?=
 =?utf-8?B?SWJJdG1idXFod3k2TVhLTzBoVUFEaktla1dCdnVFWW5qQUZYdmdQU3hnV3Qw?=
 =?utf-8?B?c3MrYlpsWVhJZkxucHFTbzN2bWllOGgzZHp2dUF3ZHVXQ0w0UStiWFFJNVZY?=
 =?utf-8?B?TUFYNlpQS2hZWDZsenhkVzJudGxOV3RXZ29qQlkyeWRJSVlsdmYzSSt3Qys1?=
 =?utf-8?B?RnpSUnBLbHdPb0ZtYVNEVFd2L1RYdG5hNzB6UUJQMHNBU3NKL1AyYmNQYWgv?=
 =?utf-8?B?cjREay9ScXFBVTl0OURkdGdDYnErUTVadUJUQWZna2VrNFJuQVM5ZEE3NTYy?=
 =?utf-8?B?anRYQWxLQ002YkpkZVBnc3hiSklZVnNCbHBtYzc0a1huRTFlVmJ2anFaMmFu?=
 =?utf-8?B?cDJoeVNwSUMxa1ZvMDVscWEvaVVFZzh4VDBtTmxXcUpUazlCdGY0OTFIVnhy?=
 =?utf-8?B?UWNnYkNDb1FOU21USGJ3M0Y3UCt3Ri9BM1g1QlE3a09JKzgreSs3NmcrQThm?=
 =?utf-8?B?a0E5UllCajRodDBhK3lOam5SWW1KQjFrMkNzTGpySzZsMHgydWd2L0diQVBM?=
 =?utf-8?B?bGt0Sm45ZEMxWEpRUGJnMVVDbDdyaTNEQnhiamovTnBMT0dETDFzdDRnY1JS?=
 =?utf-8?B?bEV1QjFhVXR5bzV3alRjcEdkN2N4QTd2M0JaMCtKS1IwR01WcUhnTVVENzVt?=
 =?utf-8?B?SUN2QysxOGdROHBDRlJCSW1vbEswT0ZUQjk5ejc1K0ZTWk8xOTBtanJPR0NO?=
 =?utf-8?B?WFVuVEQzN0lIS0g2S1VwcmRpMThTWnYwOWNZc2QyRHlXNTB2Ni9mWDJZWU4x?=
 =?utf-8?B?RElab0s5eTRLNVlsQzZ3Zkt4R2dZb0RyQzdTelhYRjd1M0tZREsyckF0OXhw?=
 =?utf-8?B?dEh1cTR4cTdZZWlIOVhvL2dOajQwZTc0ZEgwM2p2cGZsV1Y0aFI4bVFmNjVq?=
 =?utf-8?B?SzZzQmxWY3pwYlRQeDhnWlJBWllXWUVnRTd6QjU2R2J1cThSZnNEczdUTEky?=
 =?utf-8?B?L2lUanNmMktJcVBmaUQzMldGdmxBbllObDdnY2ZoTnhjVnBKRmI5K3NLNFJt?=
 =?utf-8?B?RDVIS3JRWWRsZmJBdGdNVFZSNDl2T2lXaU0zclpXWUE3Ukh4QldJTkM1dFF2?=
 =?utf-8?B?aVJNc29ZM3VZaXI2cTFDd0pob1VqdU9WTCt4a01XQ3drMU15aGJYS1h3QlBw?=
 =?utf-8?B?SW1LVExDdEJ6UngyVDJPd2dVb1o1NXpkQmdtK0poSU9rRnRBN3M4dGpad2l1?=
 =?utf-8?B?cndFWk1IaUNRREd3T3pwUS90UzlZM1loS1RYZXZ1dFJPVEs5bHdtWWlnT0Fv?=
 =?utf-8?B?UENyc3BRTjJSazlFWG9vak1tOUwvTHlIZHk2Z3N0ekdGV3hmNEtLTElQRDFP?=
 =?utf-8?B?ZGp4Z2txTS9pOUxES2lZSXJBbzNNeEtLakpTSWtBM2Q1ZHc1ZmFhUkFBQWhX?=
 =?utf-8?B?dU0yRTEwTFBObXdlQjZkbmZOa2x1cDRtdGd5Zk5tdzNrS2J0ZkptcjNtVW1v?=
 =?utf-8?B?Z3J5NXc1NEdmQWFLUzRLWTdhdnFsZndhVS9EUHRWRzhJVFRkbjVlVU9QeUgw?=
 =?utf-8?B?TDh6YWRQT0V1MVlpRTZ4REE4ak9Od2Q3ZVpjNXZVbFNJMzVDZngrQVF3dmd1?=
 =?utf-8?Q?ZK6oyaiSvOguY5IuH4PBrYWCG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 815c48f5-8092-4c98-9a5a-08db4d30c746
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 06:20:10.1132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kg6ep13FrSSBGV2a/3Hp0Z4yJTlIXPxPDQ6g45eMRBCaJgDcA6+nSGH9OtsbD5M4YTi4RE2rUrUK5li14VMDJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9834

On 04.05.2023 23:54, Stewart Hildebrand wrote:
> On 5/2/23 03:44, Jan Beulich wrote:
>> On 01.05.2023 22:03, Stewart Hildebrand wrote:
>>> @@ -228,6 +229,9 @@ int iommu_release_dt_devices(struct domain *d);
>>>   *      (IOMMU is not enabled/present or device is not connected to it).
>>>   */
>>>  int iommu_add_dt_device(struct dt_device_node *np);
>>> +#ifdef CONFIG_HAS_PCI
>>> +int iommu_add_dt_pci_device(uint8_t devfn, struct pci_dev *pdev);
>>> +#endif
>>
>> Why the first parameter? Doesn't the 2nd one describe the device in full?
> 
> It's related to phantom device/function handling, although this series unfortunately does not properly handle phantom devices.
> 
>> If this is about phantom devices, then I'd expect the function to take
>> care of those (like iommu_add_device() does), rather than its caller.
> 
> In the next patch ("[PATCH v1 4/6] pci/arm: Use iommu_add_dt_pci_device() instead of arch hook"), we will invoke iommu_add_dt_pci_device(devfn, pdev) from iommu_add_device().

Which I think I said there already I consider wrong.

> Since iommu_add_device() iterates over the phantom functions, it would be redundant to also have such a loop inside of iommu_add_dt_pci_device().
> 
> If we are to properly handle phantom devices on ARM, the SMMU drivers (smmu.c/smmu-v3.c) would need some more work. In patches 5/6 and 6/6 in this series, we have:
> 
> if ( devfn != pdev->devfn )
>     return -EOPNOTSUPP;
> 
> Also, the ARM SMMU drivers in Xen currently only support a single AXI stream ID per device, so some development would need to occur in order to support phantom devices.
> 
> Should phantom device support be part of this series, or would it be acceptable to introduce phantom device support on ARM as part of a future series?

I wouldn't view this as a strict requirement, so long as it is made clear in
respective patch descriptions.

> Lastly, I'd like to check my understanding since phantom devices are new to me. Here's my understanding:
> 
> A phantom device is a device that advertises itself as single function, but actually has multiple phantom functions. These phantom functions will have unique requestor IDs (RID). The RID is essentially the BDF. To use a phantom device with Xen, we specify the pci-phantom command line option, and we identify phantom devices/functions in code by devfn != pdev->devfn.

The command line option is there only to work around errata, i.e. devices
behaving as if they had phantom functions without advertising themselves
as such. See our use of PCI_EXP_DEVCAP_PHANTOM. As you can see, this being
PCIe only, and legacy PCI device bevaing this way would require use of the
command line option.

> On ARM, we need to map/translate a BDF to an AXI stream ID in order for the SMMU to identify the device and apply translation. That BDF -> stream ID mapping is defined by the iommu-map/iommu-map-mask property in the device tree [1]. The BDF -> AXI stream ID mapping in DT could allow phantom devices (i.e. devices with phantom functions) to use different stream IDs based on the (phantom) function.
> 
> So, in theory, on ARM, there is a possibility we may have a device that advertises itself as single function, but will issue AXI transactions with multiple different AXI stream IDs due to phantom functions. In this case, we will want each AXI stream ID to be programmed into the SMMU to avoid SMMU faults.

Right, which of course first requires that you know the mapping between
these IDs.

Jan

> Please correct me if I've misunderstood anything.
> 
> [1] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/pci-iommu.txt


