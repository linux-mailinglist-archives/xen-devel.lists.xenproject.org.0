Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB3D79CE18
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 12:20:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600332.935972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg0Ux-000502-Rm; Tue, 12 Sep 2023 10:19:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600332.935972; Tue, 12 Sep 2023 10:19:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg0Ux-0004yF-Om; Tue, 12 Sep 2023 10:19:59 +0000
Received: by outflank-mailman (input) for mailman id 600332;
 Tue, 12 Sep 2023 10:19:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z1UZ=E4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qg0Uw-0004uM-An
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 10:19:58 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062e.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec1b6c08-5155-11ee-8786-cb3800f73035;
 Tue, 12 Sep 2023 12:19:57 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB8034.eurprd04.prod.outlook.com (2603:10a6:20b:249::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Tue, 12 Sep
 2023 10:19:54 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 10:19:54 +0000
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
X-Inumbo-ID: ec1b6c08-5155-11ee-8786-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RyFBtmVtjQMwrrgWi3w+Y3bQtE7iNVVVSAeGCwPO7L7/K6+P+68n7ZFl77077C3XHRkC0Ml6zqqHA2qlRlXXRvC2V7lB6M4ayQb/IvNKMDCNLVEr8T9kEqyF4FQZ2ojg/G1iMCqxuV/7r8dV2N7cISYq5vjH8wwidNf5Cy8/V+RleO+md2ujrU9NyyyzIId2COIHEUEw0F/gjodz38vtf4jRzJGHvHjhkaDqTk3KLSAwvP6Zn0YOPaZTyY7dXwebP2ripohBTw/fybShnsS/H81jAeqg/MjgFkBUEU+TUDGPH+kvDndUvfiRRcXrHFdWN7amDQUxfYCW12t2+rd0kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=09dB5faftl3SSAg1DoXq8/IR+xSBU/JD0NbErUFqJz8=;
 b=KiFpj4KAexiuJ2/LM69UDyz+PxcWWCTd/CGYyLWB6oUdcP+1a9VkMFi0vwNtCCZFiUfYaIZEJ2iN7EA3Dbz0iGS8cpHlRTfC4EnWhjAzovGzDwkv5mo79FxNUZ5ssRjUwvvvqe1L2KFRDFiZeioZwckQs5tltArhzlGDQiCaTnEvVIcBaKHC7FPlrmqTRVUC24u6odOiTRxWDDb54AB1mL7oon4aYxnjDhmYgFxnvoTRzp2Z1lynbILlJKFxEUsbk9TdJBd5tIXzz1JyyGKZclWivZAvwAZns5RgH1e0QNlE87e82xeUklS732lmfQTGYzfmQGiVeihjpGhU/Ttotw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=09dB5faftl3SSAg1DoXq8/IR+xSBU/JD0NbErUFqJz8=;
 b=RCuG4NjvkpABZMOfJqocDCvdJIUDfxND/TEcB3X7uwjzEt06xqgHW1dTCGXRGs3bCNT9pAL5f3mCdnmFnTbloYD/Xg2CyF5NnuuxgfL0cjLv4Tqj6Nr90PG6CTmLWV+GEWq987PthoqPmwPV4i99ZEQ1kRoWh31GDU3ISW+kWikWSbr8AAEt5vB5B6WbPt36Gem4DuWMSyML8WMhm3uknw9ocVMY42A4nHmA+I4VKlXxaZ6Btta8u3e02iEF8A+DcEokkvli34sOajbKyCG823aWqyKO90PcW5aeztsPjTRhK3rZQ4Wf2QYrW3aT/GtW6xAuuTtJ8J3jqiixRPHtHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <19082bc8-6c5f-a207-0c69-33eb412fec01@suse.com>
Date: Tue, 12 Sep 2023 12:19:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH v2 03/10] misra: add deviations for direct inclusion
 guards
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1694510856.git.simone.ballarin@bugseng.com>
 <0c1fb82b539d939e7c6655a9a8f3d7fe8b213cef.1694510856.git.simone.ballarin@bugseng.com>
 <50e33371-8dc5-d4cb-a606-72d1ab005c21@suse.com>
 <ce839d89-931a-3595-584e-eab3f665cea3@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ce839d89-931a-3595-584e-eab3f665cea3@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: 33e7439e-e3a9-407b-f768-08dbb379ce6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UTzpp8z3OXe/7R4uEcjbPZolZnwqutb0AgdGV/tFTL8i5TtZzAJhCS3PKdHWDNpB0a6BvuNUmBOYBfX7HdMGRO3XhyUppp9I4QE0HpXWrVACWl/iuSR06mMGgSnptE7uNHMN3SIXMrpuAmgICvvOJ9B+ByeM0ZvnWSKczebez9c4BJDWzHVMliUn8Gyph7FsLDfDKo3orJ8srJ6KeO1pBKNCJFeZjzlmhiHMdDKnlTY9KhYQE2x9fvq669O1ufl0cCYO9vl/U6wSjrNGOUEpj93A4Vt98Mv69cW2rHvbVoGcgcrwbXaA3DlyXDN5YWiyLwL7s4VFlv11d5vkRBmSydR37UvDCNWIW6/E6YKHJCToJ6nm49DI0VHsj1qwPba0Dwzb5f/VgcPN0KThZxPp5+6hy+VEKLGlxteStNyTOl2iwfxzsTB7dBfOXfzz3CNVSin4/LVIIN0oWhdrOTnthlZr5kTimEumydFGhZDgzre6K2Lprba9PG4xjHfc8HVQ1VlCo4CsAXaAwWbNwo7I6/tLpK0cCvCiLRiZYw/ZgDSlIIbdmd+UUAISxyo1e2qpBJ8gMJZygO/uENOmRyogaAZxndIQsyyfy4q2NKNapqLIkTWSGivaBK6FdkHXzGYPSq56/KCDJ5cVsfpx+0QC3Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(39860400002)(136003)(396003)(451199024)(186009)(1800799009)(66946007)(316002)(6916009)(66476007)(66556008)(54906003)(41300700001)(478600001)(38100700002)(7416002)(2906002)(86362001)(36756003)(31696002)(5660300002)(4326008)(8676002)(8936002)(26005)(2616005)(31686004)(6506007)(6486002)(53546011)(6512007)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHJiSlV0THJkMDFGQTFUT25QTWswMjVFbmlpTW5TYUtHczU2aXQ0Q0xwb3k5?=
 =?utf-8?B?YXJzTWcyY0p3WHpCOXVOMkhpNEJuczFKVWZ4WGR2V3NWR0w4bWFWMk8zcjF6?=
 =?utf-8?B?TmcyanBYWHlHODlsRExBdnNhUC80LzViVEJ2YXgyRm5uZXA1bXpJOWJ5bU9v?=
 =?utf-8?B?UmZDVC9hTDN0eDNqZGJER1pFbkROblhPZUllc3NwZ25RbGpMU3UvTFBiVmVq?=
 =?utf-8?B?LzNKajJkMjVGWkl1Zmp3Q2tDTDk2NERYaE9xeTVzMkU5TUJhWG9mK2JteHhM?=
 =?utf-8?B?L011SWNIUVBWM0c5QWNlT3ZsSHpuVEd4UDdXL3Y3c3A3aXdHMWpjYjhCZm1L?=
 =?utf-8?B?eWZWR1Y0Q0JPR1pCRG9zRnZvZjZLQnpTNmVxK1JwZDFBem1Bc1pJTnJGQUVY?=
 =?utf-8?B?UDlpc1Y0aEtIQld6cTVYcnM1Rk1DWE9qdHdSUFJDVWNpNEhONHpManIzb3RV?=
 =?utf-8?B?N2djdGgvVFRDeFZibFdCK2Yxd3VneFdudnR6WXFPdnRJSWtzQk9wMDFJcTR4?=
 =?utf-8?B?WmF6Y1FibWFSTURGV2hEWEx5a0EvWjZBVS9lZndNcUJPWlVTbGJndFhTVVhG?=
 =?utf-8?B?cWNFdzJtSytnMXppMkNGZy82TTllN2UyUnVZcE91TEV2L3ZmMklHTnZFdlFO?=
 =?utf-8?B?K2MrdGNSWmIzN3lOKzcwRFJVVmxzTlZ6UnZXUFVFU25JNERsVUYzU25yQWRD?=
 =?utf-8?B?M25LZzZuQUpZWkVzOXROK2NWVGZVQkl6ZEc4NlJPbndwM3dnczJPTHRNcWV5?=
 =?utf-8?B?T3ZPOGI3dEk2cVV4aTB2cFBIOGE5aDRhb3RLNVpVdTh5cUpSOWRhOVp1RUpV?=
 =?utf-8?B?U3ArSG02a3ZkZDBJanFzYjR0YWcwVUFILzJneEtuZEs5U3ZrK2lxS2ZmamlL?=
 =?utf-8?B?NFEwLy9KWGpJQ2hwbnFTYlQrTDRGV3lFdk14WFR4dkpLV2tQUnR1VFRQdlVk?=
 =?utf-8?B?OHpuOEs2dG1jcWltK0VHTzYvcWtPdUQyaUJINDNKdmFrRFptOHpWYnQya2Zh?=
 =?utf-8?B?ZUxyQzN1cTU2cHZvVDhBQzdhSkFwUkRpUWlvR0hBMTNqMVROMjhGUmVCWFh1?=
 =?utf-8?B?R2N5TmhKcFpNK21UeEtpeUlaSzJZZURWTXU2TVF6Y2ZtaTR5SkdRNmJkUzRu?=
 =?utf-8?B?REFoOCsyV21KSk9UbmluTXVjNVVpSEZmZElOWFlMUm5EMWlZdEJFbHo1dEhU?=
 =?utf-8?B?dm03RlR4dE0velBMZ1lHTUZjZVpkYjkrUm9xblpsdC9YTll4ZmVZU3preDR0?=
 =?utf-8?B?S3NYMUwrK1lhb1I4TjRBTGw4aW4yTGRMbDdsVEljV2ErTW1KNmlxdEliRG54?=
 =?utf-8?B?UithcDZaWFBWVWpRcERQUFgwL3FyRFFNaGRyUk1kSTk5bWxEV1YxT201aVIw?=
 =?utf-8?B?NzhTNm5QZGc1anNIYlVWN0t4aG1JbEpFUDJSTU9XcVI0dkVHb0c1NWhZTklE?=
 =?utf-8?B?ejhEQnZ1Ly9sbjFXSXgrUWVvVk9VUFJwV0NSb2EwTUtmbXVVVGZaM2FYaU1t?=
 =?utf-8?B?OVFLRzg0MUtteVl1c1p0eHdWR0l4OEFpcER1TmJQa1AwWjNTNGJxTjVSM0dH?=
 =?utf-8?B?cVg3TVhmRTBNL3BENzJGMWVySnhYUFFQYi9IQ05ndUFHNk1FamlSTlYvMDhC?=
 =?utf-8?B?UUJTbDhGU1RUcDdaVG5uV29PNXdpS3VaeldWYURQeENDdHp4ZHhHSVZoSmw0?=
 =?utf-8?B?clViS3J6c3N6MXJwd0tDcTRrMmU3M2RxQjlWY3dWVy9FWmF2YjZaYkk3SkRF?=
 =?utf-8?B?eWdFdk13TmtFcGI4RFNRSmZISWF6V3QvU25RZlEyV2xCdGJUbDZkUlpzOVV3?=
 =?utf-8?B?SmpNNTdoM014b25QcFZRUy9QMGFiVU9nd29pQTBNZWxTdGg3MzluN2pIY3JI?=
 =?utf-8?B?K21yQkNWUTJMQkw0SEl3SXQ0L1h2TjBGUnVwQkFkTTV1MjlkWTY1YWdhK0tF?=
 =?utf-8?B?K3JWQkdOVnlKUTJWT2crVy9ob2prNGtlQWFYRXlvUnlVQ0FDMmMvcm92VkxK?=
 =?utf-8?B?SlhRU2lIRSt4cTB4YmljOUJSa00vRUFONm9KR2RoeTdDclBoWjRaMnFTNE9Q?=
 =?utf-8?B?RSs4T0RIdFFKYUN5eUtpcjdjakFEeVZDVEsydi9mM203Slp4ZEY5NysrNEdG?=
 =?utf-8?Q?TP55tTm/5bnPiVIP+Q4yFY+Kx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e7439e-e3a9-407b-f768-08dbb379ce6e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 10:19:54.0247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /CCLCjiXARUVopcAnHcWGMLuR8gPo9P0CA+WqPKf/iN0iJmwtiEb2yubnPakEpxhdFkGLxDOLz4O7id8Envatg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8034

On 12.09.2023 12:05, Simone Ballarin wrote:
> On 12/09/23 11:52, Jan Beulich wrote:
>> On 12.09.2023 11:36, Simone Ballarin wrote:
>>> --- a/docs/misra/safe.json
>>> +++ b/docs/misra/safe.json
>>> @@ -36,6 +36,14 @@
>>>           },
>>>           {
>>>               "id": "SAF-4-safe",
>>> +            "analyser": {
>>> +                "eclair": "MC3R1.D4.10"
>>> +            },
>>> +            "name": "Dir 4.10: direct inclusion guard before",
>>> +            "text": "Headers with just the direct inclusion guard before the inclusion guard are safe."
>>> +        },
>>> +        {
>>> +            "id": "SAF-5-safe",
>>>               "analyser": {},
>>>               "name": "Sentinel",
>>>               "text": "Next ID to be used"
>>> diff --git a/xen/arch/arm/include/asm/hypercall.h b/xen/arch/arm/include/asm/hypercall.h
>>> index ccd26c5184..24f8c61a73 100644
>>> --- a/xen/arch/arm/include/asm/hypercall.h
>>> +++ b/xen/arch/arm/include/asm/hypercall.h
>>> @@ -1,3 +1,4 @@
>>> +/* SAF-3-safe direct inclusion guard before */
>>>   #ifndef __XEN_HYPERCALL_H__
>>>   #error "asm/hypercall.h should not be included directly - include xen/hypercall.h instead"
>>>   #endif
>>> diff --git a/xen/arch/x86/include/asm/hypercall.h b/xen/arch/x86/include/asm/hypercall.h
>>> index ec2edc771e..dfdfe80021 100644
>>> --- a/xen/arch/x86/include/asm/hypercall.h
>>> +++ b/xen/arch/x86/include/asm/hypercall.h
>>> @@ -2,6 +2,7 @@
>>>    * asm-x86/hypercall.h
>>>    */
>>>   
>>> +/* SAF-3-safe direct inclusion guard before */
>>>   #ifndef __XEN_HYPERCALL_H__
>>>   #error "asm/hypercall.h should not be included directly - include xen/hypercall.h instead"
>>>   #endif
>>> diff --git a/xen/include/xen/unaligned.h b/xen/include/xen/unaligned.h
>>> index 0a2b16d05d..190ada7800 100644
>>> --- a/xen/include/xen/unaligned.h
>>> +++ b/xen/include/xen/unaligned.h
>>> @@ -3,6 +3,7 @@
>>>    * without faulting, and at least reasonably efficiently.  Other architectures
>>>    * will need to have a custom asm/unaligned.h.
>>>    */
>>> +/* SAF-3-safe direct inclusion guard before */
>>>   #ifndef __ASM_UNALIGNED_H__
>>>   #error "xen/unaligned.h should not be included directly - include asm/unaligned.h instead"
>>>   #endif
>>
>> Apart from the recurring off-by-1, will this have the intended effect of
>> Eclair still choking if there's then no inclusion guard following these
>> early constructs?
> 
> No, if you put something between the direct inclusion guard and the 
> inclusion guard, no violation will be generated.

Hmm, that's not good. But the question was also the other way around: Will
there be a violation reported if the ordinary inclusion guard is missing
altogether? I.e. will the tool continue looking for the guard it expects
despite the SAF-<n>-safe comment?

Jan

