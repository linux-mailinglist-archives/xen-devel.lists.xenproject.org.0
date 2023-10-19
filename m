Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0F47CF72F
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 13:41:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619256.964053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtRP1-0003QF-1v; Thu, 19 Oct 2023 11:41:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619256.964053; Thu, 19 Oct 2023 11:41:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtRP0-0003Nx-UB; Thu, 19 Oct 2023 11:41:22 +0000
Received: by outflank-mailman (input) for mailman id 619256;
 Thu, 19 Oct 2023 11:41:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtROz-0003Np-Hi
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 11:41:21 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6bff0acf-6e74-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 13:41:20 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7875.eurprd04.prod.outlook.com (2603:10a6:20b:236::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.8; Thu, 19 Oct
 2023 11:41:17 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 11:41:17 +0000
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
X-Inumbo-ID: 6bff0acf-6e74-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cnln9jq+tfsWL/IBx1+woqLGSQ3kOdUVdkXO87rRpWF+52JTmHAPEM1lwm4L292GBSFjBHkQ3QSc20Vhq5Mm1CKpYnL26Pa7dUu/QheFLXRJbxTD/katdZw2tzHdo2Hp9s6dTrNXQFOk2mP8bMb6tpvP7Vippd7Vw14oBma3gK6BsQHVn38H8mWWSk6wBWy59BGYQ4EnNxGxKl2eONF7LshIIM2yYzdTcXVZl837pciqQi69wWIT+d45td9VSgUhtK/lNXN7z6YZ14FMtFCsWlcjZvjqi+aId7okkd5ypp2FMt0ieRo5KC0ythScDhY0rfGcPml8+kM1aQkAcfyZ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uh3FKjZG7FBKjBOKSDJKX7bot77F0rtYHNCF4LUXK8k=;
 b=aP7dQtwHkcGE0PfKtHD+I5Tttoer+fqe4lAcUPjzHxw3zEFPNhYAD1SgnOS98ElkvZEzy779dEZDYcrGBdhEcWs4ZSBRrwyZSVbgTE7OR6gGfFrFCRXvGNZGT7xuPHpWBdcNNUtL4KxEtUKbO/fT8BmMdJAd6lFZhBrAnqeX3JWIlEJNvjrV3bKdi2ILfhPH2UlMNT8WbvMAxMGBxeQsp9YnxoQyyZ9uZpwdMT0AmYvGsI4YuVy5EvpjNc0mCRS5qsoMs+JiegRfnDCJHUQC6HErv755dy26Ow7Dt9fM0fv5FqpOkTyEBniEkUmuLmxUmXdxc/yw7XolwEwbqxIQsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uh3FKjZG7FBKjBOKSDJKX7bot77F0rtYHNCF4LUXK8k=;
 b=yk+LFFAu9vp1r6Jh+OTNlluGId1GWC3Nw45F323h55+gCnZHj8e6udSt9iyl3t2HfHXtlb8JlGd+W4egC9NihgaWXPLtEP4QSes4NkhGWPaQ6N0vPDaeQ/Z+TI1kAWA1O7rjU3eAv8kkabFVJmS4GCPr9GeVABSaGGuPyNo7ZXQ2aEl/dTlxHm740psDWlFF3hr5ppWoXb7CQL+aJ4mV5iAdMV9sWH2FOvdzhnXsRMgkHNd/Zi5PLdq3kzfQuyE7XAr4a2i0AoQqv/k3X0xcbIgzel4VXEr8HOLsEf+Bt/ZLthjq6ZNxB4wO9ibytebmjEId3kS7029v+73c1/u2+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <63392d67-f1af-a53b-59c2-ad4752159726@suse.com>
Date: Thu, 19 Oct 2023 13:41:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 04/29] xen/asm-generic: introduce stub header device.h
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <3cc9ecc3abcd21c5ed7276b01bf5963e6a5fd5e0.1694702259.git.oleksii.kurochko@gmail.com>
 <a20f5783-7ee3-6ed1-d4cf-379c30c64a12@suse.com>
 <9ee7b3c9-de71-4790-815c-8b2859a85465@xen.org>
 <17d9102a-da9d-d41b-6362-1ccfe21b7976@suse.com>
 <5059771d-3842-4a7c-814d-69388179b246@xen.org>
 <61c20f5d-a324-9ece-2140-4d0c775e193c@suse.com>
 <54ac0161-7302-4190-9c6e-273caa652058@xen.org>
 <04fe316e-bc4f-0df8-7771-5be7ca878297@suse.com>
 <3ce85a73-96ab-41c8-8b90-f3899e771845@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3ce85a73-96ab-41c8-8b90-f3899e771845@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0284.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7875:EE_
X-MS-Office365-Filtering-Correlation-Id: 589ead9d-61c3-4762-b10a-08dbd0984ecc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O+YPR/hlX13VWpyrXh30CMT+4OWd+GiHjP36+Nswt+F5h1HWZoV/NlsPysOWXCd7eL5VX1V/VdI74XasJI+DiaRE4OE7nPlZ0sT1qeuN2R7QIgGFNs0NT8uJqdA+ZfKqj2D4MHtCPAhn0Ou0QHe7/f4NOYPEjejbxFs7UcLccXYq9Llc1cykgAkkZKcBe6o04NswsOucSbz/Cr1cjgXpGJc5tPNnCNwQgICU2Xu1VYvEBi3nxi6hB5Xf3N9r/57yQV77P/tRgEAkMWBqXbzU9KqmpFNsKCqf2KtTmKttqHEwdFUST9RLC6GlJgUVj83guA2CM0aYrTMD6ybgROrZlpTRueG45c3IrxB8SkeW5B2JqcCTMbT2yVUML2MRmBDMLP4BKNjUPULzdDKq+JNfUijUXtf9PyWcOFbcQKrTj7cec8vm2vPSufsyCYeSLGTxD3lJc4vNoymRZ/50eKdGWl6uW9AF/No70SPnj4YtT3AFgvfnZGjmKOBa1+Z4ruKK0kMK+w0+IaJcsZoECfIJbLPe4kCBbCFQSOYBcI8ttwivFQ1/DwjOFfh/jO97lLoUnb1D18Wd1vfwC4ndru0NdIydv10RSo8n9qRX9ZvCSInyfgoKbh47T3H2o4LJtFvdWlVaCHIgr/MtjHnjfEbUptMQnesf4BEaiyBVNlNdy3k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(346002)(39860400002)(376002)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(6506007)(26005)(53546011)(6512007)(41300700001)(5660300002)(478600001)(2906002)(6486002)(6916009)(8676002)(8936002)(66476007)(66556008)(54906003)(316002)(2616005)(4326008)(66946007)(86362001)(31696002)(38100700002)(36756003)(31686004)(66899024)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXFpNFNmaDBhYWwrVVg2bUxTVllZTVlNSC9ZSHVSbVVRUVNNR1FtL0NCNURQ?=
 =?utf-8?B?dGU0K25rTTZoRWJabnVnK21rVEsyWG0wdVd6bnlvQU1ZcXVyTkVqTFRob3Nq?=
 =?utf-8?B?eUJIVk5hUEs2M2NXdVAyUFhIb2VTcjRqVEZXUjZzbFBCZStZM0VkUGdRem5R?=
 =?utf-8?B?T3RDTjdmZ1ZFRUhDUEZ3c1U5RjdLczNGc3VmRUxzakZzREwydDQ0dFNOOHJJ?=
 =?utf-8?B?c3ZaWWh4cW9RNkE5NVltOXhaVXRtNFRYenlwcFJIZ2tlcTN6WG5xUjdiUGRT?=
 =?utf-8?B?YzZ6RFRJMFovOVVUOFhsa21IblZLc2RhcjgzWGxWZy90VUVmeWMxYTFodS9Z?=
 =?utf-8?B?SzJSQVkvUVNHUDJ5RURaV1JRUjVRK1cxc0lBbTkzNEJuT0ptT01HemMwNnBQ?=
 =?utf-8?B?UzBzWnVmMDZNc2NsSVQ4OHdYTlVKekhYekVCc21TbzladjN3RnRwcjFPeFJj?=
 =?utf-8?B?ZmdnSy9KSDdXYWRSQklQZ29GSzNGOGdSeVJBZ3BsTVUvSWdSVmt0WjdIMEN6?=
 =?utf-8?B?NlpzbENkUGtGdnlxakpVaXlxb1hLVG0zWnpBaC9oa0Q0d0RjMjA2YTh4enNu?=
 =?utf-8?B?ZnpZeCtiNUFFV0xNc2pDdDBQZTVRWUdNc0JXUDZRQU5xTVpOMDdOMjdrZTY2?=
 =?utf-8?B?cFFFbHlVVC8xVU9JQlZDYlAwV0hFakdYYmVJWEhObG1lK0dyMmFpTmNOV0Yv?=
 =?utf-8?B?eWpORXZseVNUTWVBTXc3S2EvVWhxZElCcVR3SFh1bC85ME9Jc24zd3Z6c09N?=
 =?utf-8?B?S3c2Y2h5T2FvelF2bnRPamQrUUZDTkEyRS84YTVndXdiNVVsRmw5UkZUdW5O?=
 =?utf-8?B?RDJhUDJHcHhBREJldElrTGx5QVZPZ3Yyb3E2RTBQbjdwTWREVWpxMFZ2akg2?=
 =?utf-8?B?WDI0YW9saExzaG9ESk1uQzV2SCtDaVZoSXc1RDRyRlpzNVhlTUFrMS9XL3No?=
 =?utf-8?B?UmRtNCszUGdIb2JyMGpESkpFcWVLTHJOOTNJbEs2TGdEU1JTSEJKU1VvS3R5?=
 =?utf-8?B?K2MzeDVTaFI5Sk1LOWw2cHd4RnJ5d1gweWJNWUtUVHZ4S2dUWE9NL0Y1UnFl?=
 =?utf-8?B?VmF6VGpjOUk0NkROaHJlOWtBVkVMcmlMcEE4dFFGUXN4VVJLK1NpMnlMOGhR?=
 =?utf-8?B?cCtNMTZ0MmNTUGNxWGloOWRieGJmZDlrbGl4WmF6UWY1OHpUM2RmY2xnNnFY?=
 =?utf-8?B?L3pBcmlMd1VCWGI1dU5TbVA5L0Frak81NUJDaTM4SUQ0NXhpaDkwWXZIeVRU?=
 =?utf-8?B?ckFiNEFWVU50dGRCMnFkMlRLMm5yVm9QWENaaXUvYkZTNmNhT3BKOTJtaktl?=
 =?utf-8?B?TUtzUHlNcWxhVkYwbUtCbmtzRVRWWVRyajd2OGlpRUl2YzF2ZlVIWVhEYStD?=
 =?utf-8?B?NStSZ054U0hrTEpaYnNnOGtxbGxvczZuaGpxbGFEVCtkaTFwK1dRZ0g5RGo2?=
 =?utf-8?B?ZHBnWExOZDhQR05OdUdvNk5Jd2oxalZIZVRsY0FYQVE4Sy9jUWluOFVNc2ha?=
 =?utf-8?B?RFJ1NURCclAzN05yazNac2hlM3Eya3ZMQzN0TTBTUG5oMkMvVXM3emNnSzZB?=
 =?utf-8?B?a1dsZXY5NDZiTWRXMVFkZWFNejQyTTY0NWJZa3UyaWJkSU5xU2pMc0NtRTZu?=
 =?utf-8?B?SWt5dzRDNk1JVkhFNU5BaG1rWjlyNXdiS3p6NHpJTlhOUXdnb25ZMnRCSFp1?=
 =?utf-8?B?UmtMbWpaV0RyTTQzMEVTQWptUktPMDltV2hLTEdWZy9PUTJHSXRNL1QrR0VQ?=
 =?utf-8?B?NzJaWkQyU2ZXZVNuVndUYis3bmR2V1dYRCtZVUZuYnJhV1hGcUovRFNhQng4?=
 =?utf-8?B?VUEzS2FWVWJzVW80Wno1L1RUWkFuQmdjc2JTNVdRZi9JeHBqblRsYnU2U0Q5?=
 =?utf-8?B?SnNqYTIwL0lSeEc4OENDQkREeW1ocVM1Vm81dkVUSWc3d1g2b0FEbHZMNlhi?=
 =?utf-8?B?Tmo4TmNZZWxkZlV2M2hpK2tZUGdsdXYvUytDT3UzWWhnOGh0akJ5MGVXcUI0?=
 =?utf-8?B?YUh3VmVDQ0Jrd3VRcHRNa3VwVnhHdWt3QWJRVUVtSHdKYjlXb2kwT1hnL2Yy?=
 =?utf-8?B?QS9qazNqMU9XVGdyZVZSNFpERERjOEFtRWVWZ0Zkby92TEFuUmk3Z0sxWXcr?=
 =?utf-8?Q?4V7wz+0nm1JJmubOud2EdD/xG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 589ead9d-61c3-4762-b10a-08dbd0984ecc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 11:41:17.9774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JHeqlN7DLZ8RXq8wcfa2JLNVp16ywcwIgGfbjAnYJra5Y844n4TT8Vb/6RjgVGF/kFfyXtJwq2A2t+mTwtqJYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7875

On 19.10.2023 13:27, Julien Grall wrote:
> Hi Jan,
> 
> On 19/10/2023 12:14, Jan Beulich wrote:
>> On 19.10.2023 13:07, Julien Grall wrote:
>>>
>>>
>>> On 19/10/2023 12:01, Jan Beulich wrote:
>>>> On 19.10.2023 12:57, Julien Grall wrote:
>>>>> On 19/10/2023 11:53, Jan Beulich wrote:
>>>>>> On 19.10.2023 12:42, Julien Grall wrote:
>>>>>>> On 19/10/2023 10:14, Jan Beulich wrote:
>>>>>>>> On 14.09.2023 16:56, Oleksii Kurochko wrote:
>>>>>>>>> --- /dev/null
>>>>>>>>> +++ b/xen/include/asm-generic/device.h
>>>>>>>>> @@ -0,0 +1,65 @@
>>>>>>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>>>>>>> +#ifndef __ASM_GENERIC_DEVICE_H__
>>>>>>>>> +#define __ASM_GENERIC_DEVICE_H__
>>>>>>>>> +
>>>>>>>>> +struct dt_device_node;
>>>>>>>>> +
>>>>>>>>> +enum device_type
>>>>>>>>> +{
>>>>>>>>> +    DEV_DT,
>>>>>>>>> +    DEV_PCI,
>>>>>>>>> +};
>>>>>>>>
>>>>>>>> Are both of these really generic?
>>>>>>>
>>>>>>> I think can be re-used for RISC-V to have an abstract view a device.
>>>>>>> This is for instance used in the IOMMU code where both PCI and platform
>>>>>>> (here called DT) can be assigned to a domain. The driver will need to
>>>>>>> know the difference, but the common layer doesn't need to.
>>>>>>
>>>>>> Question to me is whether DT and PCI can be considered "common", which
>>>>>> is a prereq for being used here.
>>>>>
>>>>> I think it can. See more below.
>>>>>
>>>>>>
>>>>>>>>> +struct device {
>>>>>>>>> +    enum device_type type;
>>>>>>>>> +#ifdef CONFIG_HAS_DEVICE_TREE
>>>>>>>>> +    struct dt_device_node *of_node; /* Used by drivers imported from Linux */
>>>>>>>>> +#endif
>>>>>>>>> +};
>>>>>>>>> +
>>>>>>>>> +enum device_class
>>>>>>>>> +{
>>>>>>>>> +    DEVICE_SERIAL,
>>>>>>>>> +    DEVICE_IOMMU,
>>>>>>>>> +    DEVICE_GIC,
>>>>>>>>
>>>>>>>> This one certainly is Arm-specific.
>>>>>>>
>>>>>>> This could be renamed to DEVICE_IC (or INTERRUPT_CONTROLLER)
>>>>>>>
>>>>>>>>
>>>>>>>>> +    DEVICE_PCI_HOSTBRIDGE,
>>>>>>>>
>>>>>>>> And this one's PCI-specific.
>>>>>>>
>>>>>>> Are you suggesting to #ifdef it? If so, I don't exactly see the value here.
>>>>>>
>>>>>> What to do with it is secondary to me. I was questioning its presence here.
>>>>>>
>>>>>>>> Overall same question as before: Are you expecting that RISC-V is going to
>>>>>>>> get away without a customized header? I wouldn't think so.
>>>>>>>
>>>>>>> I think it can be useful. Most likely you will have multiple drivers for
>>>>>>> a class and you may want to initialize certain device class early than
>>>>>>> others. See how it is used in device_init().
>>>>>>
>>>>>> I'm afraid I don't see how your reply relates to the question of such a
>>>>>> fallback header being sensible to have, or whether instead RISC-V will
>>>>>> need its own private header anyway.
>>>>>
>>>>> My point is that RISC-V will most likely duplicate what Arm did (they
>>>>> are already copying the dom0less code). So the header would end up to be
>>>>> duplicated. This is not ideal and therefore we want to share the header.
>>>>>
>>>>> I don't particularly care whether it lives in asm-generic or somewhere.
>>>>> I just want to avoid the duplication.
>>>>
>>>> Avoiding duplication is one goal, which I certainly appreciate. The header
>>>> as presented here is, however, only a subset of Arm's if I'm not mistaken.
>>>> If moving all of Arm's code here, I then wonder whether that really can
>>>> count as "generic".
>>>
>>>   From previous discussion, I recalled that we seemed to agree that if
>>> applies for most the architecture, then it should be considered common.
>>
>> Hmm, not my recollection - a certain amount of "does this make sense from
>> an abstract perspective" should also be applied.
>>
>>>> Avoiding duplication could e.g. be achieved by making RISC-V symlink Arm's
>>>> header.
>>>
>>> Ewwwwww. Removing the fact I dislike it, I can see some issues with this
>>> approach in term of review. Who is responsible to review for any changes
>>> here? Surely, we don't only want to the Arm folks to review.
>>
>> That could be achieved by an F: entry in the RISC-V section of ./MAINTAINERS.
> 
> This works for one arch. But if PPC needs the same, then this is another 
> symbolic link.
> 
> At which point, how would this be different from asm-generic? We need to 
> have a way to share common headers

... which are sufficiently arch-agnostic.

> that doesn't involve one arch to symlink headers from another arch.

Whether to use symlinks or #include "../../arch/..." or yet something else is
a matter of mechanics.

Jan

