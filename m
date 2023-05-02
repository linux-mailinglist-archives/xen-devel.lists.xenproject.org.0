Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA926F44F8
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 15:28:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528629.822037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptq2X-0006bp-Gz; Tue, 02 May 2023 13:27:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528629.822037; Tue, 02 May 2023 13:27:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptq2X-0006a6-EA; Tue, 02 May 2023 13:27:33 +0000
Received: by outflank-mailman (input) for mailman id 528629;
 Tue, 02 May 2023 13:27:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ptq2W-0006Zv-4W
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 13:27:32 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2077.outbound.protection.outlook.com [40.107.7.77])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 174f6465-e8ed-11ed-b225-6b7b168915f2;
 Tue, 02 May 2023 15:27:31 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8452.eurprd04.prod.outlook.com (2603:10a6:20b:348::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 13:27:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 13:27:01 +0000
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
X-Inumbo-ID: 174f6465-e8ed-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O8eCJdpp0OLIISXdXLYpvPn2geRzysqmT0C7gXspYUm3NWO0+SDGFQ4T5ZI9y3+WMjQX255xslw7OmaeysZiAVh9JLCWWWPkJ7HQzWvWG0asSSRvL6EtLjFEzHOkv0f8ltguDUjC++c5imA1ddUY07q2/TbAEVqWPApcuxdo805uJaVbc1Bj9PqXY9pItgFGT1CKyy/RRI7RruVzrqWYhk+04c8oiCFyaAgcNvCKjcKwgQ5Cw0mKyaR/xFMhd9AUVbOKGpfSvZThxEOMcg93oah2BLsDzLDkFvo1t6cWQxQPyAON8FD4inC17IV5FrIKzCtXhKcDiyPC6sxl8wWwzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yl+1NFWBDEgrcY/4RVNSJurCxhbAo/P0H3lFt4T6wzs=;
 b=PCmrXqYrHzweKipPBgiuESq80D34gSg71uNZyVQQISMLT3ymIbPUc5ZGs9vEcHelsMGXjE00ULQqnQlCMx+3yKEgo8oLadIB5FoGHr4gM9MVuoZtZ70wJcgtL67XXA24Qlj/nXOuX9Dss4CnMZx5cgxnXOVwXiXExpPgtGiKcXP6ug52SGOV/iJFbKNZjQq4Mx49dSCkrYIHVbLbhVKA7UyKQUJqr5Q93smzJo4Ez8g2XXqXmLwH7Tx7DbcIsQbxFZhJqwHPON4goXV6nPYKUech7zXxI2Xa14+87x4Knmy2kb2jWHgXO2zgzwnh3WGs3dxRK+fcdeEdGas8lbcadA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yl+1NFWBDEgrcY/4RVNSJurCxhbAo/P0H3lFt4T6wzs=;
 b=xAHmYzXHh4D6wp5gxRoh8QqEnHObpBNQ2UJeUqzc1PTR/7fBs5OmuKla2c/ibSl/6ZizZeDb+jTr4Fz3524VaQuqZqxSDnyMaBEXykZTL35c/+croyTSSa4WoBiGue4+DyfZipRNDLNH3c5mAH4Y21Q9Ux9P4CBCIRvOSixe9krjvBS8fOB1IvHALH6YTofZYi9lU+0FLToIUjjS2/VIn/CvB6sxrI/Px/4PPDjUJsMa6tv4GVhnVO5DqgWrXbA1hYPfEV8FuFDfcclwHASWcnpQrMCS/MWW82kev4WfXs+2nilv+7bhLVf6yKbm3RyKyrigSpEVkvrjyweNfSBpgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7a7661e7-b791-85ab-c638-eac471d02cd4@suse.com>
Date: Tue, 2 May 2023 15:27:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/2] x86/head: check base address alignment
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230502092224.52265-1-roger.pau@citrix.com>
 <20230502092224.52265-2-roger.pau@citrix.com>
 <89389465-f32c-7dfe-f62b-b957e2543cb8@citrix.com>
 <068ad06b-d766-4fc7-6bbc-289911441ee7@suse.com>
 <ZFDrT87RixpOmMfq@Air-de-Roger>
 <6aa9f2a5-bb57-4c56-84b8-5bc63b47cfa4@suse.com>
 <269b0894-5fe6-fd71-9f6d-24e3b08973cf@suse.com>
 <ZFEJ+LqEM2rwOxPG@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZFEJ+LqEM2rwOxPG@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8452:EE_
X-MS-Office365-Filtering-Correlation-Id: 8beab0c3-fe21-4170-c1e6-08db4b10e93a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YjJi0nO/ghwHG9cpK5lOLrj3XRQh6nLMbHusdgKv2HHm3OrpoXD7vxx/4HA+AB8LEChGKQMJeppAAQFGV9qU4qKO8AQ/AC0/6gdVDkeVfy/lLUIZEo/MBuBIgi/mfEpT4s1GVu0lDf9iSmyLcRfk3AmeKbZjKcBZZm1zL52pIaf32UO8XT4cgHnNzlkHyxbfu8lLWLMcBbF1b9oO5eRMicABBCf5elAPkCUCz7ug58YqYUl7jLPVYmw5ek1+YFxEEk8VG193ZyAPEfdzUGfsMdIhlSJyky3GRxhF8DbYkQ/AnUgwkrWRXB9KcwN+2JiHQF2b8KontkJDrKQ/SUMsj+E1US9X893oU0iGIJCz2AXiLk8lgr8aM6Easu/JGswjlBONO4Uc1VnD0U/d1Rm6475fojXBcC8PJZPnKEV1HK+RNV0Dlf1JPr8+V8qxNxTla2NcJnLBI/wqOdGzLtaTXbwE0uL0nk5boJzYiaUewAjmu0hizc58PCBfH2L0WgQfv9Iz54qTNIwk7MhR/g2WN9bsJ7mgIqVjq1YkFm0mTnEUl1AB3A9HhkdaJ9TvCie0sRFmOM2aOtW0ztyvE0TO7wshmBmkvpTB9o9RQnISX0lKBD11gRTRkdLeoT91ZIo3IN/Js8vct96L9MAan76jIw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(346002)(396003)(39860400002)(366004)(451199021)(31686004)(6486002)(54906003)(316002)(4326008)(6916009)(5660300002)(478600001)(36756003)(31696002)(86362001)(41300700001)(66476007)(66556008)(66946007)(186003)(2616005)(6506007)(38100700002)(2906002)(8676002)(8936002)(26005)(6512007)(53546011)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjczVEtXL2tPS1Y3aWRmM3VZbnBKd0JBMm01eE5DNTJvMGZLODMxTjhyYjhl?=
 =?utf-8?B?T2dmN1Q4UndScWhXRzZ2VWJRZ2dKQWkzRTc4Nkk0MkJmbkZkclp0QWxKVWF2?=
 =?utf-8?B?Ty8zMTYzWG1Ha2pFekxwdjJ5VWZjc0llTkRWVTBzUVo5ek1PYVRkdkFpMlFH?=
 =?utf-8?B?MDFsUVR2bkZCdnRzNGwrTGpBZ2ltUXArVHhwTysyTnBoRUFtWEh3NFZZeURD?=
 =?utf-8?B?RHRKcm0yZytoSXBpM3dtVEdicklscUVobjlGYmQveDVKQktxTEZmWHRvaVp1?=
 =?utf-8?B?WlFzcU1DSG5vRGlmOWJOZTgvaVZ3TEZpNittejVFaWpOS25Sd1lkVHZabG0r?=
 =?utf-8?B?VmZLcTNOYVYzWU8yMmxTcUlWREM1UHIyaVRPdVNNVDIwVkFRWldUZ3dTOEtF?=
 =?utf-8?B?QzVPbnA3QWZVdXpSTTN5TFdFZEtYbEFsakNLb3hXa29wejl5b1JvZDVZRXZy?=
 =?utf-8?B?T0FYL1pmRzloZXhKSUllV1hmNkp1UWlCaFk5UjN5MUx4b2lFanhVM0JXeVRX?=
 =?utf-8?B?NzBWRXc0YXlyazBBZTA5RjJpcW1aMHQ3dmRDV2FZaGJ3eCsyTEpuSTNBdCtZ?=
 =?utf-8?B?c0VTdzhmQjloUU1ZQ3BjVFM0aXhKckJkRHB5ckpHckZJV0d0eVFyWkthdTUw?=
 =?utf-8?B?bzdlczdXcE0rTWM0MEYyZmZFQ1BjZWNlYlY1OGo2L003d0g4elZ0VUVySGtj?=
 =?utf-8?B?OWh2Q2pERTVQSUgrdDdKUzVDYkd4N2xxTWZMVjZoQk0wdWo1d3Vpd1lmOWJ4?=
 =?utf-8?B?cTA5Z1krOFhDR1VLUXZjUFIvVURRdnV6eXAvbUdVd2t3aE1VYkZ0SWJ1MDJR?=
 =?utf-8?B?TDBMRzJONzNPbXpoRnB0VWVUZThMb1JDQVlONTVsbXBMT0lJeGc4WnV5Wk1i?=
 =?utf-8?B?bnlDUG5xMzBzWk8xQTRiRVFqa0ozd0dVbVJ3WXhsblBJaC9VNFRPSFZWK0h2?=
 =?utf-8?B?M205WE1ibFlTcXBiaGNuS2dUdmNjaDhmNG84K1hjanBpK1BYSGVnc1I0b0pI?=
 =?utf-8?B?NzR2OUliVCtUNjlJczFIU2Y4ZFR0a3kreE1JV0Nld1Q1Mlp5UzFxaXR0eGZx?=
 =?utf-8?B?QkRPMWJodVhTT0dBdDl2czhrWlIwckxWSUcyWHFId0kxcTVHUXphRE5DQ0sw?=
 =?utf-8?B?RzZ4ckkybllRcVVZVitLdm1YS0F2UW9IeVBWemdYWHB3SVBEQk9Jb0dPSEUv?=
 =?utf-8?B?bTZ2V05EaTdqTDlWeFhyeTc5SFZlZ3pWT3JIdHAyelo1KzVJbEZkQno5OGxx?=
 =?utf-8?B?SEN4SXNYbU1VSWJnVG93Zm8rN2d4Tm1KOWN2ajJRMS9wcW9PWWFCNGQ4UE05?=
 =?utf-8?B?bitHVVdCK09XUFpYRkJLUEpuejk5Um5GU0tGaTcxbzd5dGFKM25RN2hXb1Fh?=
 =?utf-8?B?N2VLaWNrVXB5OVJ1Z2dZR0ZaZnVKV3JNR0RDR09RcEd0MU1OV1Rwd2l3VWhG?=
 =?utf-8?B?Y3FrQkdSOXR5NGlBdVlXUTlCTVBqeFUxVlRmMVJZQWRpS2tXUXZhZ2JrbG9V?=
 =?utf-8?B?OXpyOUZ4U01rQkoydXNHdFZNTlFlN1Z5aCtQTjBEdVR6NXByamtTWkZoSEgy?=
 =?utf-8?B?UU42cVJncjNTZ01SclhGTk1wb0ZNNjBoK0ZRQnhCa3NFdUVBdXIyU3p1bXFL?=
 =?utf-8?B?c2pCMGc0YUQxeVpjOG9PaTZGK1FiVWhMc1RhN1V2K3Vjc2dPSVpENmpIN3ZM?=
 =?utf-8?B?bC9tU3ZSYit5S0lTQ0pJenNCdjhJVkUxZDhRS2g2RjRFYlcvekxOM0xMOStV?=
 =?utf-8?B?WDVEMnZjVHRJdjd2aURwMDE1WWZzaFk5UVJ3d01OU1dqenF5M25aNjVXU0g3?=
 =?utf-8?B?eSt2clRqb08xS3AxZ2JweWZzOU9KbCtXaHlGdlY5cjNESm1tVy9nWnlzckZa?=
 =?utf-8?B?SUdWMmhVNC9FYlA4MFVQdzFUQURLeXB1dU1hakVaa0JkYmlEMXpCYnBYeG1S?=
 =?utf-8?B?WVVWRGFoUEwzOFhKdTVGUHhrTWRYMWVvVGRQc3F5UHo3TzR2QXV4VFRvSndv?=
 =?utf-8?B?cmlLblA2RUFwUFRjU0xYWlRaRkQvRmRQMU1hdjdIaXpuQmF1dTdYZVh0bFpr?=
 =?utf-8?B?NXB2QnV2UVljQ2UxRGNxQms4ZWVMdnYxQkt5L1lGN01KU0d2dDJNaE1qV1Ju?=
 =?utf-8?Q?iM6xKnl454Wy7uMpp8rk4+InY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8beab0c3-fe21-4170-c1e6-08db4b10e93a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 13:27:00.9515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bxHYrxNuJnxOXMDu3bVDnmVoUY9aWuc73arWnibg9JLlrc4OvtjatvdGi7X4PXGviW1siP2xekiDtsFXns6vRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8452

On 02.05.2023 15:02, Roger Pau Monné wrote:
> On Tue, May 02, 2023 at 01:11:12PM +0200, Jan Beulich wrote:
>> On 02.05.2023 13:05, Jan Beulich wrote:
>>> On 02.05.2023 12:51, Roger Pau Monné wrote:
>>>> On Tue, May 02, 2023 at 12:28:55PM +0200, Jan Beulich wrote:
>>>>> On 02.05.2023 11:54, Andrew Cooper wrote:
>>>>>> On 02/05/2023 10:22 am, Roger Pau Monne wrote:
>>>>>>> @@ -670,6 +674,11 @@ trampoline_setup:
>>>>>>>          cmp     %edi, %eax
>>>>>>>          jb      1b
>>>>>>>  
>>>>>>> +        /* Check that the image base is aligned. */
>>>>>>> +        lea     sym_esi(_start), %eax
>>>>>>> +        and     $(1 << L2_PAGETABLE_SHIFT) - 1, %eax
>>>>>>> +        jnz     not_aligned
>>>>>>
>>>>>> You just want to check the value in %esi, which is the base of the Xen
>>>>>> image.  Something like:
>>>>>>
>>>>>> mov %esi, %eax
>>>>>> and ...
>>>>>> jnz
>>>>>
>>>>> Or yet more simply "test $..., %esi" and then "jnz ..."?
>>>>
>>>> As replied to Andrew, I would rather keep this inline with the address
>>>> used to build the PDE, which is sym_esi(_start).
>>>
>>> Well, I won't insist, and you've got Andrew's R-b already.
>>
>> Actually, one more remark here: While using sym_esi() is more in line
>> with the actual consumer of the data, the check triggering because of
>> the transformation yielding a misaligned value (in turn because of a
>> bug elsewhere) would yield a misleading error message: We might well
>> have been loaded at a 2Mb-aligned boundary, and instead its internal
>> logic which would then have been wrong. (I'm sorry, now you'll get to
>> judge whether keeping the check in line with other code or with the
>> diagnostic is going to be better. Or split things into a build-time
>> and a runtime check, as previously suggested.)
> 
> What about adding a build time check that XEN_VIRT_START is 2MB
> aligned, and then just switching to test instead of and, would that be
> acceptable?

Hmm, yes, why not. (Except I would still express it as sym_offs(0)
rather than a direct use of XEN_VIRT_START, once again to better
match surrounding code.)

Jan

> I know that using sym_esi(_start) instead of just esi won't change the
> result of the check if XEN_VIRT_START is aligned, but I would prefer
> to keep the usage of sym_esi(_start) for consistency with the value
> used to build the page tables, as I think it's clearer.
> 
> Thanks, Roger.


