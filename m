Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B733A5F5414
	for <lists+xen-devel@lfdr.de>; Wed,  5 Oct 2022 13:56:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416105.660744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og2zi-00061U-Kh; Wed, 05 Oct 2022 11:55:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416105.660744; Wed, 05 Oct 2022 11:55:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og2zi-0005y1-Hw; Wed, 05 Oct 2022 11:55:22 +0000
Received: by outflank-mailman (input) for mailman id 416105;
 Wed, 05 Oct 2022 11:55:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L813=2G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1og2zg-0005xv-Qc
 for xen-devel@lists.xenproject.org; Wed, 05 Oct 2022 11:55:21 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2071.outbound.protection.outlook.com [40.107.105.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94d5825e-44a4-11ed-9377-c1cf23e5d27e;
 Wed, 05 Oct 2022 13:55:18 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6835.eurprd04.prod.outlook.com (2603:10a6:208:180::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.32; Wed, 5 Oct
 2022 11:55:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.031; Wed, 5 Oct 2022
 11:55:15 +0000
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
X-Inumbo-ID: 94d5825e-44a4-11ed-9377-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k2l4XnuQA0SPnwAcydE0j1vZE8P/1uZOJYE5U2HWbS6/QMhp3u6NsHPi5XUZq7WsTSCXZv8r5QZ31h61woJ9wpKE39CbnGEBPbN1iroGbG9zGxPlOGbVSsL6PTmBoLtTc5ttYKthosDXKWkMpEaonvvDkGo9//33JbkQdxlwUsZpBbgzMqey+Y6uxMuyihwH/u/YNwC8K5kNJzbJfNkgcWipk63YROI+DSP9wsCskbDpetVfbqQg4run2ZSA+3VYRO1wnWrfgI0lN8Guz+JvOd/7mp5mhZL8kAC3EtaAuefiOODX5FqIbNZYHUT3yFviKEatDX3BtBwP9TmV8d1JNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r7HUhkRC5uQAglFLYV1QaXlcHr1rewmUst5byxrL4J0=;
 b=TA8ZF7sU1bxy+XRjXUVnx1AgoMmy75ql8/AA+Iuh9I4shM6Wj9nl0Dje9lyicVUjQnGJljvzHlFQ+YZ3qigHK3lXDZmCgh1JPljtYpPa3ulnW3p8ac4KXQ4KsWcCymNfWvY9rnQMIJzY2aSKOjyIdy604nawP+O3apX+nj12ZdSX9byME0Oyasqnzc0wkAO6IdsAFeFSQy8P+vo5tyvwko94H87sd6VxF3MLVARqaGtyoVESkQarMj/L4z0J+ZxlmNGivhIJSb74eO6SjM+iZQYFfmIW90m9P9wjlgQMCOMC5g7qp0NU/GPuc8f04xNTElv3R/P7p8qG5uibAdO62Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r7HUhkRC5uQAglFLYV1QaXlcHr1rewmUst5byxrL4J0=;
 b=QzC8jE1SG/bPH0l0gWaLZVD6XLMulLMppMhnshGZSuj/9ezAhSsSFZu1SainSpABg8frjZ4juZ1iaxCPkhm6HK8hE2OYePFjS7pGbMyh5Jo7n+b3su8hj2vtoFE56zYpw3CbWtsCStt67zOOInxhribGzgc1kS3tJlfGxH/NQO9thGlPILor80w1MQ5eLzdXdwbwR2pCUBvIshKDDkM2eMbCmeAtIjI3i2P7J5XuNw+LkAK3PjmNtTc6RM4s4rGFo2GDkex4tlvrg5G/hC1M2P+oM7uJglG1CKt140Ntz5b3HAraNNOztUNqenMga7ed23ynAuhqK2Yn6Ldsuk0JcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0d33ecc6-898a-9379-f934-fe569cbdc8f9@suse.com>
Date: Wed, 5 Oct 2022 13:55:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH][4.17] EFI: don't convert memory marked for runtime use to
 ordinary RAM
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>, Bertrand Marquis
 <Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cc0fbcb4-5ea3-178c-e691-9acb7cc9a3a7@suse.com>
 <9C12552C-0A64-433D-9F0C-5672281DD45D@arm.com>
 <73faf43d-56e2-2bbf-6336-f6420a1aa0c0@suse.com>
 <f1a71d28-ed04-0936-47e3-aa7a9f8c6dbc@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f1a71d28-ed04-0936-47e3-aa7a9f8c6dbc@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6835:EE_
X-MS-Office365-Filtering-Correlation-Id: ac719aeb-8af5-4d75-0ace-08daa6c877a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ASvu/1ZVfJHAvXucMCgjIytSfsFKe3ysRTU9XFtDTmmcHUWFesytsf+oIj0OwEkay0K7iFOJNO1eWA5qoo6YwQv7HXbec5WW5gljxV37gxDEjGn96HdBlLL6U+//+1zdGtaXqd9350sMDzBpKkqV061P2Un5sNCgXxa3RqJn7XMBnB2/qoWs6mqIMaZpfMNMdMkQatObBjxnLzjTpGCjcmwcxGEJue1687a3QU7N9u+274+vDIDyfEeq6crvthTp7Hpzw/vpZZi77zEz26KfArpYxlzsj6LPc9nVJPkrdxB/V3IsNAdxYDktBYHbWr7sKFqoY+/Qcw6NmYGTEKkZPpEoHpQ2rJs/FZQ0qHRvfUi+geMkp76rtIkKwMc1LVG0ij33Fm/vr8ly+1e4kk6hrmq8rvQEN2qb65Wg/mBsxTW+p5xGmwQsck+uD6Pd1H21W6kuDPZ5LrU9c83CqGvKzujPfUEhjGreu8TjWi3Ssxi3xY1xo8ZyzMF5O5zYJyPrSarB90LpH/SuF9yPa3oFfUpiTuDMIQ+kK23rrCCjba8n+6wgSjnDEzcdYpnuZNmtrU9hOmTD5vzKqLnHlCvyAszjS61j7q8zMxhm9dWu+IcqYKWSaeA3dXj2o8mjERzZFnb0kIRyIQTeaamfaj8Pq023P9sM7eGesyZosk5hnRMdLgWsqO2SRDIxxERBSgT0FQEYKW2ctqk/XaPo2dGrqfzq2zTl39kCozOFQRBVDY53qyDedT0yYNj3Lo9Jd531OzyfPJ3KzECwdv2oBYnLsuVMj900l46SpzKlGBeng4Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(136003)(366004)(396003)(39860400002)(451199015)(8676002)(6512007)(186003)(26005)(36756003)(8936002)(5660300002)(2616005)(2906002)(4326008)(66476007)(66556008)(66946007)(41300700001)(83380400001)(6506007)(53546011)(6486002)(38100700002)(31686004)(86362001)(31696002)(54906003)(316002)(6916009)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkdSb3pSOFh1Sms3WFQ3VGVNcXdEU25xRVhic3p1S3JPZmYwKzYzWjViRGRx?=
 =?utf-8?B?c3VlNnhjd2t5b3h6ZXhKZnpnUFlpamlNOEduSXpkZWNJWXBFTVVnQjJFM0hP?=
 =?utf-8?B?THVyNHFKaWs2MUZnNnN1QWNYbTYyQTRCaSs5Z3ErTHZ5QWlOWnZ2N1J2d0Rj?=
 =?utf-8?B?Z0JiaWFiNk9NeVhnL3dvNjV6aG53ZVBocFZKQU5sMTViUjBUdWo2OWRvb3pp?=
 =?utf-8?B?YUVJK01pR3pXZHRqYkdETFZkVE8rOTc4UDVmb0h0MTZ4NHdZOUd5U0F6S2F2?=
 =?utf-8?B?TjR2ZUFHa0NLaVdORHZqNCtqczlFSXZ2dnRlYkw4aDk2anoyOVdpOWVpRXI1?=
 =?utf-8?B?UVRRSnhNRDZlYjY0YVlVcUdmMFJYOUdhNCtBWStWRUZJY05DZ1htRSs2TXlH?=
 =?utf-8?B?bytBdG5Da2dPMFlSdS8vbUk3L0hhV3dIUlE1Y2dyRVdSaSs0TzFnemRQN2Yx?=
 =?utf-8?B?bzl6d0tZZERaVFNvcnNtU0dVcFRyMTloR2ttUVV2U21rUFhvRTN4dnRhcDU3?=
 =?utf-8?B?SVhlbUFzYndadGtkaWJIYjdhV3oySUVWdWs4WUlTdGJsenBPVHFTMmdTSG9z?=
 =?utf-8?B?Z3hkYmFZUEh2bVlITUlCZE50UENianFWWXBwRUhBNGVhWWloL2REOExGVmo0?=
 =?utf-8?B?TDd0M0ptQ08rRmMvV1daR25PUlpUN3FXZzdFdUszbExXbzIra0h3SkNJbXJV?=
 =?utf-8?B?TnpsMDl2RTcvQ2hFVVVXTFJKUUhIK2VuTTcycGJ4eWd6N2lqR0lSdyt1eHll?=
 =?utf-8?B?NVRWN1ZVMHhJVmE5MmJFdHM2RnFVT0Q2SFNRWThYOWExdHQ2WG1YakErd3VZ?=
 =?utf-8?B?dVpnZGp3QXlYOWlUWks0bHJLL0RZcDhIQkV4ZUxjbGRLQjE2R3VjcGo0YU1j?=
 =?utf-8?B?TVV1M0xSVzVGWHdqbEhBQlZ3V0orS3A5aW50bjNvSmpjVWpLYXdyK1pYTlFo?=
 =?utf-8?B?NXE0UW9YQmVPU3BLVHgvL0tRd0JNVHVWNTdjRWVxVE11ZUlvL1lQMERKOVVT?=
 =?utf-8?B?NHkzSWIzbitDeW9iOUtjeTJ2a2lxQ1NKbEEwWFRJQ0Rjay9VWDVkbm9PMzdM?=
 =?utf-8?B?TlNqQ0RUYlJmRU5hMFBQcnp2bkRJdW9BcTBRN1FmTEljTU5UV2xXMjJISzRU?=
 =?utf-8?B?TWpxRTIwZnRYc053c0JPSWJTcndFWUY0SG9laEp0ZGNRVXJ6YkJjUDFocHkx?=
 =?utf-8?B?bWJxdE5wVUxpdFR6aFZFdklvRG5MSXQ0dzEvTGhXQ1JZYUswUXl3Rk1SZ2g3?=
 =?utf-8?B?cGZPWUFabVVpUzFndEtSMWxJODFmcjZJSW4yaGw3K3VQWkxMMVgwVjJIVnpT?=
 =?utf-8?B?N0JacFgrOVVxVmZQZFB5eEtLNjYvWm9uY2FIKzJ2RGhnc051VUZtUVlQZkpz?=
 =?utf-8?B?UEc4cTJ1UFFIK0xQS3B3alB0Wk1pb3pab2x4MjJ4MUZlaEZYN3BDQmNZWWZq?=
 =?utf-8?B?K2tueHhYTmNveXZyY0xmV2svTUpPMVM4Z0IwejhVdG14QjlkSFJyVVBhbjd0?=
 =?utf-8?B?U1JyZlFoTjAvYUswQUpmVlFmZ0ZBVElkU0wrT0JsYytyd09XTUFLZ2hUajd5?=
 =?utf-8?B?S0dQNFZ6T2s4YkphMDhXcXFpQWxxU0RhaXVTSEJNKys0bFcvdEtkYTVVNFdF?=
 =?utf-8?B?bnZSR25CcVFMR0FMbm93VHN3dm5Ra1RlUWQ3Q3l0b3g4bGh3b3lteHB1MlZ2?=
 =?utf-8?B?VkFPNmtPM2Z2U0VXOUNkZ01RR0hlRnJDNVpLVEhWZTRVQ3F1UEkvVyswZUVn?=
 =?utf-8?B?QkRBWmtOY1MxeGUvWlhyZC9DWWRScnU3OUFHYnhnZmRITWV4UWZSS1hjY3hE?=
 =?utf-8?B?THhVZU9LV2Eza0RzZnA4K1ZadHdNaVF3S2RCVkhDRHdkeWZhU1NZMmdFVDFN?=
 =?utf-8?B?NzRIWnZJTGdlY0dsVEk5b3VxTDgrcjdsQ0IvWWNvd1ZoTldpci9LSE9ZalBo?=
 =?utf-8?B?Y2VNY0RJY25YRE54c1JBRzJLVEdMUG9WOGl0dzlLSGt3VW1JRDVQRG1KaFVU?=
 =?utf-8?B?Z3RCdmVaYXVxcHUzM2JyQUZaL0FoNmQrVmg4bHJxQVF6QVdFU3E2L0pWdGN6?=
 =?utf-8?B?Z1U1cHVEamJIaEszS00wTUd6cEFVNG9pQUZ4dG1Bb1lpQnZydzVndUxZNlRX?=
 =?utf-8?Q?MMBZK6nyX4S+dGA0AAV/zt3ra?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac719aeb-8af5-4d75-0ace-08daa6c877a7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 11:55:15.8702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: trTLofwTg/LpLPPr2BdSZqucTs49VHICF0fQlt04nJSAKKrHWe1tSUxAGq+Dsx0jvYemRbxAQvFo8ITDA9kj6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6835

On 05.10.2022 12:44, Julien Grall wrote:
> On 04/10/2022 16:58, Jan Beulich wrote:
>> On 30.09.2022 14:51, Bertrand Marquis wrote:
>>>> On 30 Sep 2022, at 09:50, Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> efi_init_memory() in both relevant places is treating EFI_MEMORY_RUNTIME
>>>> higher priority than the type of the range. To avoid accessing memory at
>>>> runtime which was re-used for other purposes, make
>>>> efi_arch_process_memory_map() follow suit. While on x86 in theory the
>>>> same would apply to EfiACPIReclaimMemory, we don't actually "reclaim"
>>>> E820_ACPI memory there and hence that type's handling can be left alone.
>>>>
>>>> Fixes: bf6501a62e80 ("x86-64: EFI boot code")
>>>> Fixes: facac0af87ef ("x86-64: EFI runtime code")
>>>> Fixes: 6d70ea10d49f ("Add ARM EFI boot support")
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com> #arm
>>
>> Thanks. However ...
>>
>>>> ---
>>>> Partly RFC for Arm, for two reasons:
>>>>
>>>> On Arm I question the conversion of EfiACPIReclaimMemory, in two ways:
>>>> For one like on x86 such ranges would likely better be retained, as Dom0
>>>> may (will?) have a need to look at tables placed there. Plus converting
>>>> such ranges to RAM even if EFI_MEMORY_WB is not set looks suspicious to
>>>> me as well. I'd be inclined to make the latter adjustment right here
>>>> (while the other change probably would better be separate, if there
>>>> aren't actually reasons for the present behavior).
>>
>> ... any views on this WB aspect at least (also Stefano or Julien)? Would be
>> good to know before I send v2.
> 
> I don't quite understand what you are questioning here. Looking at the 
> code, EfiACPIReclaimMemory will not be converted to RAM but added in a 
> separate array.
> 
> Furthermore, all the EfiACPIReclaimMemory regions will be passed to dom0 
> (see acpi_create_efi_mmap_table()).
> 
> So to me the code looks correct.

Oh, I've indeed not paid enough attention to the first argument passed
to meminfo_add_bank(). I'm sorry for the extra noise. However, the
question I wanted to have addressed before sending out v3 was that
regarding the present using of memory when EFI_MEMORY_WB is not set.
Is that correct for the EfiACPIReclaimMemory case, i.e. is the
consumer (Dom0) aware that there might be a restriction? And would
this memory then be guaranteed to never be freed into the general pool
of RAM pages?

Jan

