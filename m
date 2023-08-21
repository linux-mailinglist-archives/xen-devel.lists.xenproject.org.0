Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D91437823BF
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 08:33:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587287.918624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qXyT6-00089U-QV; Mon, 21 Aug 2023 06:32:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587287.918624; Mon, 21 Aug 2023 06:32:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qXyT6-00087L-Mw; Mon, 21 Aug 2023 06:32:52 +0000
Received: by outflank-mailman (input) for mailman id 587287;
 Mon, 21 Aug 2023 06:32:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=phPX=EG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qXyT4-00087F-VU
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 06:32:51 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bd8d5df-3fec-11ee-8782-cb3800f73035;
 Mon, 21 Aug 2023 08:32:49 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS5PR04MB10041.eurprd04.prod.outlook.com (2603:10a6:20b:67c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 06:32:47 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.029; Mon, 21 Aug 2023
 06:32:47 +0000
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
X-Inumbo-ID: 8bd8d5df-3fec-11ee-8782-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nObhOLZFAIvNbnLSeOJOaa3hZ6E0xqUKcpnBPRoxSSnz86Tte8eMqWVWgIRcUDKXjc5SofQerZc44yPc3ay/ITOPtCmYQtZ5rwzFAYn+YC76qLqSg5B11wJUx5772LWr3gFlZhWuoziStqYr63UnlY3gxBU2Zn7RwF50qKa7zdxR/4MgOXju0yYVoLpigr5X1JAhUkfV50GyG/km8u1Ao/79IP74rEoOgQNLALOPku/4ASoZlcDoxcLxOnRiVJfjBxlICFJEl14nnsgNcH5i/0sDK6WsmOo/bfiVV2fdKPRn88DJr0iXsr2Tj3Hmz1NFGfJwi/B9Uer7MIhfh4b/PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oox7X6dqDFrH8db/lL1C3csEOWheN1jNkxceHeJOEA4=;
 b=XD8wvzmLS/IDs6BpuCCYmIyZFcnVbhkGz1IHGokLggV4OlP8w/82wBl2NEm295665EJxGrXnMVQUY7ZLSM4kwtCFQFS52RhQWsKnLGbv8JszGDGuIUO5jYxqkER95xPwE9IEY1JFPZGcCUt4G2mfqFF1IOODT4i08joqIMkC77qqlTxdjOOJksskix259lwPDNcTxQORJmi7pAiuexY3yRoxediJcNblAaYLU+MzbRegbzko1eov7YlkwPFOf9UaqPuJ1pstAiC9DsVO4DjKiFnVk1TXwdDoVqWkM3ThcoJn9mwXdu8WgFG1sih52kPakG9VaJePnf4ePtuUyhRHeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oox7X6dqDFrH8db/lL1C3csEOWheN1jNkxceHeJOEA4=;
 b=nMRAEEdmjZeLUUn7xSc1vPPlSEnx+Zu96yw8CxfxrbElrjvVLGCUYFnIsMIL1K99HiuVyDl67P12+3E2EKtEV50hTP6+FXgH8+XdZi94AEN+zrbQEapQAIQbXCXvAy5t6D8noZ7fb4eEDLod2uyuXcMBS46FyLsxJ1yLhOK9XUTozX5Dyp0bLEwPlhb0aWBT5jf2XKkxEbFxvqp7MXr4qhQHdwg3LUMP6PvuN2nkJhpRnlUw69qxc3yjVsuGNXcLCW7+pMhSdjeVtAD+/K1hRbhxv5JIlESUGtM+OezawuChGMSBZaQ9lMHzgqaPoaWVLFExkY38fdYz5RIcfLtXyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <932ddc26-0cb6-07a5-b95b-1e103c0273c3@suse.com>
Date: Mon, 21 Aug 2023 08:32:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN][PATCH v8 09/19] xen/iommu: Move spin_lock from
 iommu_dt_device_is_assigned to caller
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: michal.orzel@amd.com, sstabellini@kernel.org,
 Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230817003947.3849-1-vikram.garhwal@amd.com>
 <20230817003947.3849-10-vikram.garhwal@amd.com>
 <4905ac18-85ba-40c1-4542-7355cecafdf4@suse.com> <ZN/MDcuo+IS0m5Cz@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZN/MDcuo+IS0m5Cz@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS5PR04MB10041:EE_
X-MS-Office365-Filtering-Correlation-Id: 47be8673-98a7-4577-4b38-08dba2106f1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NytVby11aNE58a54h+beBEdGwYbZHCuChmRHGRN8Yc/8bPxOri3Rw4mCuePY09Mauzz4cgkxVdbkBdHs03MGzKe72063eicoHfPCeeECEFdrQSsppKWGS1J1rIfPLPlT4/DtX2DNAYrSpz+OBMfKGC8VsQulfO6s18VBy+9epdeww2EFsZ6VoA7dclyVJlxxJi23XTy+AS91B+/5mxzMqaw+U91UrrBCj6DEw7xWskfaj0t/+c3cT6Fg2jrqvq1hvWXSK6jhaJN2GEhrPPZfw00D6EkSuk5lP4QuZs2iaWMTzbVfVAbzdsigLUqwVfTJOnI5oZrbEprcjq4PXU/WfWmx+LXvlfBXcYXwSAizIuFJCd7Km/PGdZn0ZwsB+1jfbdKxpFQP4qnSWtS3f2Hl5IpSO8+3V6N6H7HTASdqsLOVoDxr6N8Musnff4JPypo5EhMnpz37jfFm77eX3771OzZ3sZhLD27V1lS36eRLRs1DTBfXPjL2Biq6eajtoZfj9GiuZjS/S+yLoWhwjG7vRwhiC4nJNQamntNy4zgLLgyjRX3W/HntR/BQWdNFi5Mo+zzDHQFcvbOXjWpFE5pSR4RcsQhG9bYXy5zFbqSpg53l44K5S6OBQ9fbirBjkra/FWIBu8c9wiYCFeW3o+fZBg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(346002)(366004)(39860400002)(186009)(1800799009)(451199024)(6916009)(54906003)(66476007)(66556008)(66946007)(6512007)(316002)(8676002)(2616005)(8936002)(4326008)(36756003)(41300700001)(478600001)(38100700002)(53546011)(6506007)(6486002)(2906002)(83380400001)(86362001)(31686004)(31696002)(5660300002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2N5ODhXa0dsTElac1NqbTN0RWxiZWNyYklOSzhLYmFXU1FpY0xldUpmSisx?=
 =?utf-8?B?aldjdU5LNkMya1VXRk9UVzNrTkppdHRXNldRWmhrWGYyeHdBdUZCK0lmT2pt?=
 =?utf-8?B?U2UxdlVYMnJUY0RmVW1pMFJ2N1JVSmRBWDlnblo0cXB4bWR2QkluMkwxVnF3?=
 =?utf-8?B?Z2Fpd29tckRrWVNadzlKMGtDdVl1bmc2cnJpdFNpczlVWlQvbGtmdnJtN2xL?=
 =?utf-8?B?WWRkTC9sRHh3K0xXbGZybHpFUWRLTXQ0Z0Z0bGZFK2tOc1FYcUV4K1pRWXhq?=
 =?utf-8?B?OUFaQy9YRENVMVVIeFZFS0ovWDFISFNGbUtMY3MxMnI3dzJ2dFE2WU4vQTRQ?=
 =?utf-8?B?dzFDQnQ4QWVnUGdZUUdEN1JaUThjc0NMT0Y2MDdGbTQvV1ZWcXptdjlwZVNF?=
 =?utf-8?B?UVpTcWtlemxyb1hWZHpOWm5KcTN5OHNNaWx5ZjB6bWZ4Tk1VbzdpNG5obmtk?=
 =?utf-8?B?dWJMNDE3T0l6bVF5NzNHRE9say9UOFJUSzhyTUllT21YVFAwUVpRdW9nM0pY?=
 =?utf-8?B?dEZ5VXZ0VVZEbFpkc1MvZnVweDhtazdhVFZ0eFpzWS9QcEJ4bHFleGd1TzdI?=
 =?utf-8?B?UkhyMWJMOXFxZElKd2Mrb2tkMUw2a3VuOVdWdFZ1OWQxd1ZmbFFESVcydWZM?=
 =?utf-8?B?UFRUNnRBY1ZLTWZmZlVIT0Z0UmthZkFLb3hSMk1MVXdBWElrYkdhb3Q5YVRN?=
 =?utf-8?B?ZGdyU21wODFQVWl4Vm9yd3NMRE51YjFMblNodmVjM042S3BtSkh4eC9kbXRn?=
 =?utf-8?B?M2FJRnVzODVEbU5udHV4U083bEVTTGVMZWUxZGpCUDRiaUR3U0Z0SWlMdTgw?=
 =?utf-8?B?UTFpcitldFBJQWxPU3ZjNTVDWDhCa0xMRncvZDhmRncxa0g5cUkvaWZVbWkw?=
 =?utf-8?B?N3BIREE3WDkvbGhBbEx5Y1g5SXl2Y1FCajVEa0ZKOGJ1T2xmRDYvVnVYMy9G?=
 =?utf-8?B?ZitRQmVUSjRDbWlCRHhEYnUvaGZ4WDJsTTlVRkp4OEtucDdyZ2g5Q0tsVGpy?=
 =?utf-8?B?aldRUXdzN25zcFM2S0ZxZ2hod2RLb0dKK0lHQ2FZbHlhNTBCcmFCd056dXpZ?=
 =?utf-8?B?eDBuT0lJamFHQ1ZWOGx2cStSNlAyelE1dEk0VWNxL0ZKR2wyRnBsSTEzZ0lu?=
 =?utf-8?B?Ty9CT2hLQzFiSWNEYlovVXBqK0hud2VlUElUQnM2MndMY2VwWGZmbEdhOXR3?=
 =?utf-8?B?bkNQZmR0UHlFSjJYNW5IUXJab0NMWWp3TmpxdnVTVzJsZVA0RnpiUk9NQi9T?=
 =?utf-8?B?ZkY2b1VUclVOeWcySHJIcUluVTlWRExPQXNEOU9ReEFleGlENytNcXJiTjlz?=
 =?utf-8?B?UkNCS2dEcVBKWXZyYVdrY0pGMkpHL0ZRVU5YVW5rL0ljNi9GRFlHSUk5SUFy?=
 =?utf-8?B?NUtWL2ZxQUJSNGQ3clN0clJSV1BXcVRReGdCVzM3UHZkM3c2U1NpME9qOFEz?=
 =?utf-8?B?YnRxZHcwQ25VQXlvRk4yVklJRFFmM2FzYzZHQXJ0Z3BzekFSbk5JQmN6dlND?=
 =?utf-8?B?TlgrTklMZlViV0FUVlJLeTBLTVFnTmFUWWRvbVpKNWtoOTZtRThQbUM0dHNS?=
 =?utf-8?B?UURvUjVMeDM1RTM2dlhMbUNyWlhIM3QwMzVmNDE2UlZoMWlPdG45c1laaktu?=
 =?utf-8?B?cHNzSkxESHJ2MjVSY3BlZkVSU1hybGFrTktHZFFrUmJDajNreElnanBQZFR3?=
 =?utf-8?B?K29PcHdCSGthT3VpbmVpR1Q4ak9JRXFsRWxWNHhBa2o4bi9yaUsrV0tWMVJn?=
 =?utf-8?B?TE8xR3pqQVpJNjBsdEY1Vit1dHJXdTd6UHdRcUpPOGdCaHZQYU1BK2F2WHZC?=
 =?utf-8?B?VEpPQUtKV2dJZzcrUlVtdFVBZytqdkJ0bWFHckRmTncwa0hNMEY2TnJCZmlW?=
 =?utf-8?B?ZkhYK3h5cFI0RmRWM3pEUHdwRGpSUmg4cGFiUXgwaGVTdk1PaFhIZExGZWdI?=
 =?utf-8?B?TUtpSkdGR2tsZTN6Z21lbStxd0tvcDNna3g0b0IwcVAxYmxsMHg1Z2p0dERT?=
 =?utf-8?B?RzY1MWNpSnVDa1lHT0I4d0ZRM0VTSWtTNk1iaDkyRUtKSHpMVmg0QjREYW5I?=
 =?utf-8?B?UEd5MzhDVklHYTdIQjVBNk1EUXBQUG1BeWoyNGJqcUVFQm1CbHhZalNqV1pU?=
 =?utf-8?Q?S0uY4yoCuIZBMzSW4QWQ7oKO0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47be8673-98a7-4577-4b38-08dba2106f1d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 06:32:47.1575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7YlFpXg/iwZ6hqGu6mKhHEpAhGOZEGOX9gIYHCCK6iRVncpifoS60FL1NiAUrGRz9noO1O5ZEC2AAUSAzC9mLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10041

On 18.08.2023 21:52, Vikram Garhwal wrote:
> On Thu, Aug 17, 2023 at 09:05:44AM +0200, Jan Beulich wrote:
>> On 17.08.2023 02:39, Vikram Garhwal wrote:
>>> --- /dev/null
>>> +++ b/xen/include/xen/iommu-private.h
>>
>> I don't think private headers should live in include/xen/. Judging from only
>> the patches I was Cc-ed on, ...
> Thank you for suggestion. Do you where can i place it then?

Irrespective of Julien's reply (potentially rendering this moot), see ...

> Please see another comment down regarding who might be using this function.
>>
>>> @@ -0,0 +1,28 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * xen/iommu-private.h
>>> + */
>>> +#ifndef __XEN_IOMMU_PRIVATE_H__
>>> +#define __XEN_IOMMU_PRIVATE_H__
>>> +
>>> +#ifdef CONFIG_HAS_DEVICE_TREE
>>> +#include <xen/device_tree.h>
>>> +
>>> +/*
>>> + * Checks if dt_device_node is assigned to a domain or not. This function
>>> + * expects to be called with dtdevs_lock acquired by caller.
>>> + */
>>> +bool_t iommu_dt_device_is_assigned_locked(const struct dt_device_node *dev);
>>> +#endif
>>
>> ... I don't even see the need for the declaration, as the function is used
>> only from the file also defining it. But of course if there is a use
>> elsewhere (in Arm-only code, as is suggested by the description here), then
>> the header (under a suitable name) wants to live under drivers/passthrough/

... my earlier reply.

Jan

>> (and of course be included only from anywhere in that sub-tree).
>>
> This is also use in smmu.c:arm_smmu_dt_remove_device_legacy(). This is added in
> 12/19 patch(xen/smmu: Add remove_device callback for smmu_iommu ops).
> 
> I will make sure to cc you for all the patches in v9 series. I plan to send
> it today.
> 
>> Jan


