Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A35E7CBBCF
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 08:59:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618073.961328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qse27-0001mv-DE; Tue, 17 Oct 2023 06:58:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618073.961328; Tue, 17 Oct 2023 06:58:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qse27-0001kv-AG; Tue, 17 Oct 2023 06:58:27 +0000
Received: by outflank-mailman (input) for mailman id 618073;
 Tue, 17 Oct 2023 06:58:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ibp0=F7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qse26-0001kp-7P
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 06:58:26 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0626.outbound.protection.outlook.com
 [2a01:111:f400:fe02::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f1713d8-6cba-11ee-9b0e-b553b5be7939;
 Tue, 17 Oct 2023 08:58:22 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GVXPR04MB10045.eurprd04.prod.outlook.com (2603:10a6:150:11a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Tue, 17 Oct
 2023 06:58:18 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 06:58:18 +0000
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
X-Inumbo-ID: 8f1713d8-6cba-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gahqIr7hzLLf/xZXtddXR5m8zWHDgyQj5kWhRG5dTc19XlmP/DnYYulbp0kmeqmawosLMNEgMOsGQVreLy1rq7eiUM8+32dKC6iBGoYLMOFlBPcSpUKrGwkkOvWcb1p13c868RjFemDBs+/Y/5UrleqKbJT7rXTj/VR8VMXNB9/rcVXqrgC2ncyxZShGVJyVIo6hN13z22MIskC1S+hVapSJN4D2TlGK9DCUE/dHs2DvN8r/56YQ7BaVpsc63xGaxvLDlTj6Eg+rPFZV+WkaVDwFDiuwgLrN364EJHdRuX4+/ThZczH9NifXev5YMj+AJglsE+eIzgE2k48GX57z1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U2PVwxb7tljwQjS2WtbBJY9Y6nHUWatUJ5/+dmiS4h8=;
 b=B16Him4zYQenQShrxkEY6IZoe1ya0i0uta/xFn9BS1iQCokhbsGsCrsFghzpqtFJGrUvTR7Z+m9unBZYIF2+sH7ALUUZ0yBXsSebYrCA0OFBZwv5xQkvNAG8/0ErZz4o32JGbJulbAbm58gUFqee7sWV+3qJqexKdANMIIzjzrZ6VqSBxmx0SRT1OXbhDsyLv0OMYMoDcXXGGzj8QIgisWC7m2BCVoaGcGdbSgSxPUPlBmPGMPO+ko71QdgdMoSbsE3DyW/yt7KHwtoEIE7BPN34mzmt/y3EAUAqnulhwNx9o9GYdLRKxBkzImeeTFY/UuyuVXv7mNFDeIKr6fHWSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2PVwxb7tljwQjS2WtbBJY9Y6nHUWatUJ5/+dmiS4h8=;
 b=fmLjidfsecD9Hn7ALrM2Cr5QU0ko9x3U0hlbsclS/0XSrPilHewTezDwpFXJrySTpBfDInIi9DbmDhVYPYdA0u4jVzx4at2vEcaTUng1l2mkj71r0Ryf5dp65fuzuovHutdyHwXhx1Uvw2jW/e+4hoEtKltyntosEPW4qdaxX/HKUnvTyApXzGhvobJ0ZZn1bNJdMcb76WgjkWG+7djzgbs1oR83Yizv/PNHLe3OxkQYM03lonYQJN2vdZ/EaDHS5hRHxIkpLe30Ai1agjNkAXRlzxDPpNj9WKhbZ9BS1Y3madJusBWi0oDrDtcs5SJbJLxFABoaW1ADINLxcufG9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <06a4b7ed-a6b3-a9ef-1f42-f44ff0497820@suse.com>
Date: Tue, 17 Oct 2023 08:58:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-next v2 5/8] x86/io_apic: address violation of
 MISRA C:2012 Rule 10.1
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1697123806.git.nicola.vetrini@bugseng.com>
 <1fe7602b48cabb7710025f6b4e32e9b99a1faacd.1697123806.git.nicola.vetrini@bugseng.com>
 <262b878b-578f-451a-6e7d-18af4a826848@suse.com>
 <e4e6f6e9e0157a89fe50179d6f8fdbcd@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e4e6f6e9e0157a89fe50179d6f8fdbcd@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GVXPR04MB10045:EE_
X-MS-Office365-Filtering-Correlation-Id: 01a3cc3b-4614-49f7-2acb-08dbcede70eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WHB3zuj1EmQ4fWL2DH/7KdiXI5GYib6/G0Ho+BXzPbhvbaM6E1pD9o5ZRDArB5EDLVsBWyyrwchtWQDM9X3L2q9jpTxIKTUAih58LNXgte4PShLOksQnXqDwTbGKJwfRAK58RjhgnaznfmR6bbxA6SurMWSteG+5ZXX94polRSWG5V3qM9RD62HlThx7+pyOvbJDRBSPKHQ72Oqp7CANU91m298+e7E3hKsB831tI0zT5N08Wkupb8H6Kh/JGBvuZadfOhqhh6r8s6GAHeiZWXBj1WV6eY5n2BtB4viucEGgjwOkblJ1ivothnrRk+qjKeyVLDHzfr3JsdRTINzXVAo3XFA+z8YkwnATGWjAofQuD7zQtQF8FQB7gwEfFdnw8zJj3gsKQFYKZqT3qLLn1MisQPYvn8MtQ66MPakDNV7U1OvXVZcb/fRFLbluAr3hGd+IzAamqcHCBBpkocdIxpk7nZRcV0JOTp3mAy2iiShjH6uWxgdYETCKpbQKc+CGVyJeARrWOamb1EF3MqNsUkrsDV2wXM/qGOKylQTT/mme4J85QdJRJZYCy9aqGtM7gwH/qKIa4QKcLyMwmoDXIQxLRkIo/QMpoCgr9OgLSoUZxMGVAG0/xnoFxAOS1i8BJV8/yHBD0mo2MEWQI6Wc1g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(376002)(346002)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(53546011)(6506007)(5660300002)(6666004)(2906002)(36756003)(26005)(2616005)(6512007)(38100700002)(86362001)(31696002)(7416002)(478600001)(316002)(6486002)(41300700001)(66556008)(66946007)(66476007)(6916009)(4326008)(8936002)(31686004)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDZTM24rVTZNdTQrSFhhbmZ3YXVGK1BXRnNKSEdCRHg3REh5dHNIWk1kU0V2?=
 =?utf-8?B?dGdZWmowUytWL2FDNU5Pdi9YMCtkcEQyOVdtdGpmajB4R2s1VTRHTTY3VnVh?=
 =?utf-8?B?cDI2dUdLZXZWVWozUXJubEZIZDJBY0txUHhpdmFYWml3bnAvMjdURGtkaUxl?=
 =?utf-8?B?OVkvNjRiY1VPeUx1YjkrWUVHcjRxYmdPbFE3MG9BVFg0RXNMWE1sZW9WWXpo?=
 =?utf-8?B?cHUyZmxVTkxsZkNsWkZzM0JXUkFtRTVSVXRBM2Ezajh4TDhBMlE1TWJnaGlK?=
 =?utf-8?B?YjdKUEpDQ3ZRNW1obHl0TjFhNTU4M0g4ZWxTckIrNTRhSm9XTWFRbEhYVlhz?=
 =?utf-8?B?TVBUbVhFR3lqdzdxRTVJYUtHNldjYldyQ3VFL2FQdnUyaklRTFNHV0pjR05V?=
 =?utf-8?B?a09mTUppQlE1ZnprRzg2NnZjME1HSTR1WGpzUU0yWWRSNUpQYmYrdlp1eS9h?=
 =?utf-8?B?Qi9FWHMvSURRZDdhYTJMTDBBSEJRNmZ6OXh4b0pkaUlRcDhnamRBbjZIN01T?=
 =?utf-8?B?R3A3RGlaNFhYUHNYUnFaUDB2dUxmdERFVzgxZzNBbkNBdnJQbGVFSGNuQ3Z0?=
 =?utf-8?B?OWozbEZKWW9INWdNdlBUWUZycjhMU1RWT05ObURiZG9FV2xSVkplZ3BSeTUz?=
 =?utf-8?B?Q09XT2ZKb1YwOTd3Y2l0R2RiWUV3L0x3UitLTG9Fd2c0dG9OcUh1UWRJU3V6?=
 =?utf-8?B?Z3dlVXIyZ1RxN0c2cUxTWG9yeHgxcDkrTE9iTUFhMWRJUlUyNGlsc0RKb0ZR?=
 =?utf-8?B?VUNGZmhZUkVNci8rc1pNUzV0OE1CQkh2MmNGZnpGV1l4OWQ0dE0rRUp6alB2?=
 =?utf-8?B?cE5Zd1FzKzFtaGlDTmRsQy9lazREeis1N3NKRnlMdGkwVlgrSXU4R1pMc0s2?=
 =?utf-8?B?YkdWbG1LY1JRbkNVT3JnODB1VmNFc1NCTzZpeFMzMW95RS9PaFQzWHBmZlZR?=
 =?utf-8?B?Y0ZObTdReGRrak5WZFR6Sy81MjdOdG51bUFkZUVpd3RIYUFycEh3TWo0U1pH?=
 =?utf-8?B?ZUVEaDZVYTM3M0trRWJLSCtzT0lwbHVUSWtHSVJuRmxxZzVQRElDbzFsazJr?=
 =?utf-8?B?SEJYWDN1dDgwcW1nMzZ0bkdITUFxSGQrS0dUT3gzblE5ZzlLQ285MW5rdk5n?=
 =?utf-8?B?cjhDSkZIRjdNYTJ5NzhhanNlMGd2cmkwRnJFREQ3R3E4SEZ5ZXQ1WXBpRE84?=
 =?utf-8?B?T2g0d0s3N3ErZ3E5aEp6dXowNVRELzRhazBGcXprdVFHa3AxUnVmSEx5OXYx?=
 =?utf-8?B?NlJEYkc2dGVBZTh3SXJLcTlpYTh4dlF2b3dGbktQU2gvck5Mc3VnYW9zVGNK?=
 =?utf-8?B?OFp6Rnd1ZnBHTmtEbmlsUlZkL0RJaENPL25IbUMrTHpwd201SkdsdmxuMTFh?=
 =?utf-8?B?K294VGxUQzlBUVpPMVRUeUxmdDRGNlV4VjFZTHZ0L05aOU9oNDY2OEptU1pU?=
 =?utf-8?B?TlJpcksyVnEyRjByWG9yU1NueEdhdHFoOEozODh4eEsvbFZWUHhFcEtMSEpa?=
 =?utf-8?B?S1FDQ3pjK0d0R0pWd2NmZ0VtRng3b1NrOHZVS1N6bkpUY0dyVUtRL0tQUDI4?=
 =?utf-8?B?a0dBZ3d2Szc4NDNmNG9lQWpvK21Wd201VEE2K29mRktUYUkyaVNna3dHV0hM?=
 =?utf-8?B?b0J4WjZjOHRoQS9SRlRuWEZQT1NKeFhjUHgrRTV2Q3Y2RVRnUHVpVVdJY0dm?=
 =?utf-8?B?VzcyNFcySkxmUW1mK05GSmIrMFUrK1FSN0lyUm9DSWU5L2I1Rjk5a3dqd3lk?=
 =?utf-8?B?SEdpQVZUYk45UDl0SXdFMjZ2dnZOc2I2b0lCT3hDMUhCOXJ6Y2lCNWk1WUdp?=
 =?utf-8?B?R3p5MndoYVFodmhRV3F1U2pVRlhoeUxTUmkzbjNXR2dPbm5DdXBGaXgwanhr?=
 =?utf-8?B?WkdFVnRLLzNnMXJITlhmUktpS1FyQnNnZzh3QlJjWjRrcGxkUndEY2xnT3ha?=
 =?utf-8?B?SXh0cExxMVlUQkFvN3BZemVJTVNjS2JBVExtNVJZbVZSZEpTeGtYb1RHcW1E?=
 =?utf-8?B?ZjZTMzgzTHBOS0phbEgvWHdRTHFib3V4a1Q4U2hZWGFqdGgrQjhnbCsrQ2tS?=
 =?utf-8?B?RE81V3l3d2RDZng2MHc2R3RFajdKVFhaajJUd1h0TGJYM3VsWEdYdXV2Yll6?=
 =?utf-8?Q?jFUijqtS3KQNQXEbd+UwIBQX5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01a3cc3b-4614-49f7-2acb-08dbcede70eb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 06:58:17.7373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ioup467Il2GjXzVuk45MNnuSXv1GT7hPDDC7obYskeINAaPjuP8bDLDlsseyhNPki7XnwSBvVD2dPgJyeGJjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10045

On 16.10.2023 18:36, Nicola Vetrini wrote:
> On 16/10/2023 17:42, Jan Beulich wrote:
>> On 12.10.2023 17:28, Nicola Vetrini wrote:
>>> --- a/xen/arch/x86/include/asm/io_apic.h
>>> +++ b/xen/arch/x86/include/asm/io_apic.h
>>> @@ -14,9 +14,10 @@
>>>   * Copyright (C) 1997, 1998, 1999, 2000 Ingo Molnar
>>>   */
>>>
>>> -#define IO_APIC_BASE(idx)                                             
>>>   \
>>> -    ((volatile uint32_t *)(__fix_to_virt(FIX_IO_APIC_BASE_0 + (idx))  
>>>   \
>>> -                           + (mp_ioapics[idx].mpc_apicaddr & 
>>> ~PAGE_MASK)))
>>> +#define IO_APIC_BASE(idx)                                     \
>>> +    ((volatile uint32_t *)                                    \
>>> +     (__fix_to_virt((unsigned int)FIX_IO_APIC_BASE_0 + (idx)) \
>>> +      + (mp_ioapics[idx].mpc_apicaddr & ~PAGE_MASK)))
>>
>> Let's assume that down the road we want to make __fix_to_virt() an 
>> inline
>> function (which perhaps it really ought to be already): Won't this 
>> trade
>> one violation for another then?
> 
> I don't think so: the violation is in the argument to the macro (i.e., 
> the fact that
> idx is unsigned and FIX_IO_APIC_BASE_0 is a constant from a named enum). 
> Do you see a way in
> which a MISRA rule is violated if __fix_to_virt becomes a function with 
> an unsigned int argument?

No. But I assumed such a function would take an enum parameter.

Jan

