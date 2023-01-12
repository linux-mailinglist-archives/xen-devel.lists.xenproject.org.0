Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5CB6679E6
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 16:53:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476297.738402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFztR-0000wU-CX; Thu, 12 Jan 2023 15:53:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476297.738402; Thu, 12 Jan 2023 15:53:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFztR-0000tx-8w; Thu, 12 Jan 2023 15:53:29 +0000
Received: by outflank-mailman (input) for mailman id 476297;
 Thu, 12 Jan 2023 15:53:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmgi=5J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFztP-0000tr-DH
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 15:53:27 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2043.outbound.protection.outlook.com [40.107.22.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f604efb-9291-11ed-b8d0-410ff93cb8f0;
 Thu, 12 Jan 2023 16:53:25 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8993.eurprd04.prod.outlook.com (2603:10a6:20b:42c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 15:53:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 15:53:23 +0000
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
X-Inumbo-ID: 3f604efb-9291-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X6J/AS2PLPBwUq4wq972dHYGn7+UlZP2FN85NyweM+muJ4SMqgeYxMeOW/tCH10qRn1LaFULAN8K6m8eLSr6cjWeA2+vJSYSvvzWhD8uHFPAz3yHKH3Vw06CcMD5z9Lb4nv1gLVCjL/P+6WfwVOWto/q8vwmMO3SfYsCd3TCbp2O66bLrOVpbW7iqrc1eyFb6aji9afazJb5iPpC7KCbYH5cxyG9KloKvaTOh0Doz3raQi7OsZNbVGyn+SLdkjuLXexgtHb2dcpXQ3bwHKGuo716hraXCQo7N0vvlY6vUuNSsP30IAggesolhSVw/HeN8fhIHaT/1Tfzz2o2jVqwAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WYGRnZFO15xxiImwSL1q2e+5C4/uRRMhXSPe4Iw7tx4=;
 b=OFO+C+oWiTNVtEbSI+AaKfqxGbBLx3c4HPcr+uoFip3sa35vNr4F34CWnLztBlWTxQaikt40IASw3JRbaLHOH6f3YpcP/63wsK9bEGsjxIJ4Dvmnud+exj/SucOg/0z4jYBZQJ7q42203EPnmWEkRXom5jn0l6LIZxXSVA5YJHhOV9kBBCkVYw5X0MvxmWdizYLJCZgb4jA/F7OPPa5gtuLxhMVorgMYqE0vg3wXQzXVUwNuzaBysPJ8r0SfwDDt0htAaUPWZF9E7g/DpkebFBuD8isRuIhHY4WpFcnpo5c3gDEme4gqCz5v1e1kUVXKLCc9zRxgfSAejaMJia2Pdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WYGRnZFO15xxiImwSL1q2e+5C4/uRRMhXSPe4Iw7tx4=;
 b=eqhYaMDLTgXLytIsf9NvtLE2qGoj4Ksfju4ifIy9Ri4018dS84tS/SUziqegJuBpcNCEAXJVyTt7DUcAH3MKGlz3j6YQRsAZMXhHVyhlXYp3t5a6SNojzIV/cQwkqwbAJm2ZDX7/Br8WTg+k8smlLPNTbxSNe32yoBHzJIAxgkhz6wPDaGmiDL9rYcX9MCmAjDW8YQgkzzGFPabReVYexW/odzrMmpMbBxXrgy2uGQW69e/MupuWHs5SMp635GvEasMM5J886F3MdUYtVOOn1+5KuIYWXWPz/jYN1aDkzVJlKfjFbi3gLIHvMA1HVF0g+6uFaISZYUIKlCApBa4Cdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d4105a37-e24f-96b6-f0f3-5990768fa8f5@suse.com>
Date: Thu, 12 Jan 2023 16:53:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 3/8] x86/iommu: iommu_igfx, iommu_qinval and
 iommu_snoop are VT-d specific
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20230104084502.61734-1-burzalodowa@gmail.com>
 <20230104084502.61734-4-burzalodowa@gmail.com>
 <f2d68a4d-b9b3-7700-961d-f6888edfb858@suse.com>
 <f4771b3d-63e8-a44b-bdaf-4e2823f43fb8@gmail.com>
 <4bc3f2f6-9bf4-5810-89e3-526470e72d85@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4bc3f2f6-9bf4-5810-89e3-526470e72d85@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8993:EE_
X-MS-Office365-Filtering-Correlation-Id: 7242b07d-0da3-436f-d364-08daf4b52279
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J4SC/KYD/c1/mIAEiQkkqeiFmfmJeRHvj4j+v7gNU9YIujZzQIoVdcJmo0APqaAlKrVEUy7MtQljTDXitebD3RyRGsOp3EO90hOdGBTEzyxEhP/oxVv7ekYYZb/IWaUEFPMS3/PeGS9qsvcFIvxzZXwVVw+YSstcX8auKGMwkpXAlnNTpnR0Ww/ei3qXiTqabU9Q4PLhwYIFkzZdPkDREz52DkXsbr1yclDH/r4Y7JpTlCnbpoQH0yifiGpcOkiBPoK5AMgh+88sI/Q7XVsikMj/mi6gtZMRK0NMd0mf/UE2TC758ecQF4TRqYJ1NNBSx3pSsLk7oMWwpeS2+//ba5MS2T61c6Njq4TptZ/qPXEdfwJ+rTz26Hd50ZowQAhxQ48ekSbR27GdRtkeOWOhHfj9s0xk5j+wH/16odvQtCIxk+qW/FZEZeVAo5OVeP6cGmAZMsMAdMIWVe78f/YfEEyjyiNe1IB7GQYePHslfA9pKRue5nAZdDVqmT55RTkgp9mlK+WqOlV2Xe3eZtSUCxZCwORVZEvcVASlRAAUmdGU0a5vyMXfoLjwtbryOBNBr22o3gVOds7Aoel1fP3Hug7jjZkZwBYtiETWdbvVL0vfjOFH7lthIJdVJh7uZtPL31BtVu9gCW3y6WsXJ6Xrbgj22s3zOEM4au5Yq2r3ooYNNMIdJI/F6/NbB/feTmAF2tqM3ctFtsAqTCmHsa2xSaFpQ/CtauP6S6CR+EfwWcE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(39860400002)(396003)(376002)(136003)(451199015)(26005)(8936002)(5660300002)(2906002)(41300700001)(66556008)(4326008)(316002)(8676002)(6916009)(66946007)(66476007)(54906003)(6512007)(38100700002)(2616005)(31686004)(86362001)(186003)(31696002)(53546011)(36756003)(6506007)(478600001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3A4cTFwRldLTE5xVjBZRG9nS05IbkZPR2QyV2ZWV0NXdXZYdWg4d3Zibm42?=
 =?utf-8?B?UVdlTHVTeThvc2hRWFZ0aUZPY0VUNll2cFcrUXFZOU5NNjFzdXVRWGY2TFFK?=
 =?utf-8?B?UldkcnBWYUFNMk1oUWlpZmpZSlMrZndqMGlPK2RNK0FhTlhrU1l3d0V1dkVS?=
 =?utf-8?B?MzVVeW50UUUrTG5iZVpRN2ZaMTdIblJlSDVwbmNEYUVraG1qLy9FNFNWZFFq?=
 =?utf-8?B?TDdKSVNRTW9WeDd0dEhtQ0orU0hObWQrdVphT0dxRGdwV0dLRkptZE9DMWFm?=
 =?utf-8?B?TFRpeE9DWEQzUGptTHIyWW1aWWxGVnZySmVjUXA0SVlUOTcwR0lYelM2WEh6?=
 =?utf-8?B?Zk1aYTlXMjBaR050UW9ySkxpUmd1d1RlUThNaE0xTnNSQ2FKei9ZMFZyZ1Er?=
 =?utf-8?B?MmlBMmFFbFRPNHZ3OUFLZFV0VjRMYXl5U1VoWjFBdWp4b2dRVk5OMURDbWpS?=
 =?utf-8?B?cGlQdTZNL2JieWFaaXZkT1FFUTNiODZrU0kxKzZVc08zK1R0QlVyUGRPTWtO?=
 =?utf-8?B?RDdKdjRIZFJOcTFKellrQktPN1IxOHhsVXJJRStOcVgvRDhTT1hkTVNJNVNB?=
 =?utf-8?B?dW4yUjdhSlJwSXIvb2FHbGd1N24zQjd0MUdNc2E5T0NGc0pWN1JUR3ZTaFFZ?=
 =?utf-8?B?SUM4dGppZG9tNVBxOEVJQnVQRzNlTStzaWd5aFRBc0hINnFiVS9xVkdJRmkz?=
 =?utf-8?B?QzRDcUhDNWNpRU5mWnJnWEtjaXY3MDlIMFM2OWJaN2pVVVgyRVoxM1YrelQ0?=
 =?utf-8?B?d1VNMGg3akV5VkdXYS9HRzk4Q1F3Tm1ERFhtNVZvaVdkYWphb2pCVzZDdG8w?=
 =?utf-8?B?aThlQ3RvUHVDK01obDVvekFRYmE0NDE3WGlhRkt5NWNrSFZMMU5Tb00rbE82?=
 =?utf-8?B?OUNFWGt6bEF3WmNBMmg3c2Z2SDNUYTU0SkJMdTZBWThlT3RjUWZ0d0pYNmlH?=
 =?utf-8?B?UHlQblZYbXp1VFIvNkU5bmFxRzUyc21lbllkbDh4WXhKNUxaeGJvS1NjSG5G?=
 =?utf-8?B?WE9ZWWtJcUY3dHU1MlVnakRNM3JpRExYVTh4MjNWZWNZM0pOb2VreEc3OGxF?=
 =?utf-8?B?dGdMK0FsalJuWmdCcDY2NWNQWFcySlpBYTh1Z0Z0U1Nqc2FoVDM5QjR1Rzlz?=
 =?utf-8?B?MHp1aU16eUlZa3MveDVNc2Q4ZGlDL29PZGszVFliT1NxUU1pdGZ3bEtvSVUx?=
 =?utf-8?B?N25tYjZqWUd6eThxdFFxc2VMdXhIZ29uYnROSDVsNVY4aGFCSlFNME01cStK?=
 =?utf-8?B?V0J2SlY4WklFYkdWTjc5WXcxWFZiOVBtTUNBbW5VMkR6MXN4ZnNSV0RVUyt3?=
 =?utf-8?B?WElsWGFSc3lXTDdacEJRRW5FYVVWdlE4cjgvTk9LMDJMRDJMbEV3RzJPNmZ2?=
 =?utf-8?B?d0YwaGtibHRmL21XVmhHWGlNa2t4QW1nakova0VxUTljU2toRngwNFB4TGhZ?=
 =?utf-8?B?WnB5Q0h3YVVEYndvWTlaaS9MTjBWREFVa0k2RzlsZzBKRkJZMWtxaDdMV1Nm?=
 =?utf-8?B?RnBLWjZjb2o3TzI1Y3pOd3k4V0paUXoyUVovT3htMXQ1R3krVG5DUzRrNnBl?=
 =?utf-8?B?N21IcTlnaHF1ME1mbmJ2Z0xQRWtYbjRFVzcwcGVBYm5hRnFMTjZIcE9tVG9Y?=
 =?utf-8?B?Z05jdnRqSnl4MmdEeG4xWEJLTG43UUlkYTVTVStMamRFb3JEdTZzaU1ueGtM?=
 =?utf-8?B?aTM5Z2M0SEVrUlI1eEJqSWY4QTVBazhCazZLYW5ZVUZ1eXFXR3pweUsrS3hL?=
 =?utf-8?B?c1BtdVhCUlJianhOMkREb1BRZWVBM0pwdGR1bWRPdE1FR2I2aGJYTzViL01V?=
 =?utf-8?B?MzV1OTdaZVRNMUVkV3ZLOERkTWtMUlYzQnVTbWRRc0xnQjVQQ2lTeXhWMFIy?=
 =?utf-8?B?WE9VakFXUmxENmhsY1dETFpjZ0c5dm1NTTlhNzJtcHk0YU9ZMWQraCtrWGRG?=
 =?utf-8?B?dElhZVVHMVllM2l6ZC9QZUFBVkNHUlVoUTdmZFphNlJJaGpVYWZkNCtiNFk4?=
 =?utf-8?B?Z3V6eHE5MTNiTUJnVlJvaHhGMm0rc1lCWnJEWFVCNGw1ZXdqRkNkdXpxL2lv?=
 =?utf-8?B?YjZYb0NDbFJEWWI0OGNPekxjZitQNW9RL21JT21wTUlhS01UZGpnQldGNDBQ?=
 =?utf-8?Q?hXbYjrIOPhOAwSqdIyq1VubVD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7242b07d-0da3-436f-d364-08daf4b52279
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 15:53:23.2576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YqKt1XsMG3yvFoeCOdruwq1ducpltPF7XdSapkry09+VvcswZmG2I4SDXVAjTk24pyCeXcVTs4r7LpasS+M1gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8993

On 12.01.2023 16:43, Xenia Ragiadakou wrote:
> On 1/12/23 13:49, Xenia Ragiadakou wrote:
>> On 1/12/23 13:31, Jan Beulich wrote:
>>> On 04.01.2023 09:44, Xenia Ragiadakou wrote:
>>>> --- a/xen/include/xen/iommu.h
>>>> +++ b/xen/include/xen/iommu.h
>>>> @@ -74,9 +74,13 @@ extern enum __packed iommu_intremap {
>>>>      iommu_intremap_restricted,
>>>>      iommu_intremap_full,
>>>>   } iommu_intremap;
>>>> -extern bool iommu_igfx, iommu_qinval, iommu_snoop;
>>>>   #else
>>>>   # define iommu_intremap false
>>>> +#endif
>>>> +
>>>> +#ifdef CONFIG_INTEL_IOMMU
>>>> +extern bool iommu_igfx, iommu_qinval, iommu_snoop;
>>>> +#else
>>>>   # define iommu_snoop false
>>>>   #endif
>>>
>>> Do these declarations really need touching? In patch 2 you didn't move
>>> amd_iommu_perdev_intremap's either.
>>
>> Ok, I will revert this change (as I did in v2 of patch 2) since it is 
>> not needed.
> 
> Actually, my patch was altering the current behavior by defining 
> iommu_snoop as false when !INTEL_IOMMU.
> 
> IIUC, there is no control over snoop behavior when using the AMD iommu. 
> Hence, iommu_snoop should evaluate to true for AMD iommu.
> However, when using the INTEL iommu the user can disable it via the 
> "iommu" param, right?

That's the intended behavior, yes, but right now we allow the option
to also affect behavior on AMD - perhaps wrongly so, as there's one
use outside of VT-x and VT-d code. But of course the option is
documented to be there for VT-d only, so one can view it as user
error if it's used on a non-VT-d system.

> If that's the case then iommu_snoop needs to be moved from vtd/iommu.c 
> to x86/iommu.c and iommu_snoop assignment via iommu param needs to be 
> guarded by CONFIG_INTEL_IOMMU.

Or #define to true when !INTEL_IOMMU and keep the variable where it
is.

Jan

