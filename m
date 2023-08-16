Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4CB77DF9E
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:52:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584710.915497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWE8F-0002Vk-8i; Wed, 16 Aug 2023 10:52:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584710.915497; Wed, 16 Aug 2023 10:52:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWE8F-0002Tj-5J; Wed, 16 Aug 2023 10:52:07 +0000
Received: by outflank-mailman (input) for mailman id 584710;
 Wed, 16 Aug 2023 10:52:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8IcS=EB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qWDok-0000Pd-Sm
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:31:58 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2045.outbound.protection.outlook.com [40.107.13.45])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f962821-3c20-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 12:31:56 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8696.eurprd04.prod.outlook.com (2603:10a6:10:2df::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Wed, 16 Aug
 2023 10:31:26 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 10:31:26 +0000
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
X-Inumbo-ID: 1f962821-3c20-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pj7ZbQ+gxoUIeAYv63JZH5qy7NAc7BpHK8iOnnSwhXkgThXUabKjAfoDwYUE99rDs1iVRsbGHJT1srGftoHG7JPK+vwZ1x9dELyBl4SM4OZSQkNUrLjaamSoTdOU7gmY/pfCPQ1jTEaNQNK8Y61Mz4FiZhmwl4+QEFvip/Q5j7NyXSVwj5uR2F1/j/wc8C97xWyvkWiDJD3WGfsIVC/udkmqrmA2+IL2bi9GsksDr1OJcxfYslTUXAgAhaRQPWchy/JVnfEasCEDHsAB24wF6hfCfzui3pHgJ7KPvmI94Aw6DjtL/Q8WQ46SoIvVt28uLsk1ex5wYSdPOQ6ZniFhRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xiQQXVGLsjc4BLZ053K5E8UHyM0o2O0wcy+cOAqWHYE=;
 b=LK2yodhXUScUzQ+Wx9nFHThrlzeU550SdSDFCsZr+bDqJJeQj90B6r0szlchpnsqx62EUGMkp2eITjeVZouvr4tjar8wE16Vfv6rRqNIsmk3UQUakiexQaKQS8EzjC4cQ4RX4C/eMW78SnM+mERUOngAcIhP7gzDfPBPVe8rKmHJMeYdTdyvXsy9t/qyTDeoynEqRxSk8n3wqjVwo7ZwAbBFZgN7WROQOB0YDAVrRb/7GVPSiWeqYRV+u7p540L/c5gYb1nBG4SEzMHqHp+UtJjLqE5X6AgOdwCG9MR+ldE0n7VTFGegbszNc/tANlnhh+1kLjTw0y6/5pxNUiO9hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xiQQXVGLsjc4BLZ053K5E8UHyM0o2O0wcy+cOAqWHYE=;
 b=hPZFEYeD7vk/RCNNcj+Ed8TZlXjYhnrmcBUqep05ubyDp5qcDbutyWepvuJx0TkOuNqyZMdgKaOukzPrMJUDcMjCk1pd68f09mDJXYa26xFt/XhC58f5r0mfqTYQUZRvUViLmig+gJslxGmCCwL73DIL4S04VR25iQggWJWGO245ruKGBkpYenhnGMGdQfg1ytrguQpPMR86PfEf+Pk9L+Sbk2Oh8cpulDJ4L8nN4HOi/Qj71s/VMJE+IXUiFYJkUOADm6QL81FMjRkteFMzZ71s/d4OKu3x7RcSrKl9LFplFyV0GWmIXO/olCeOdRLN58THRA/n1QWV0e0y2woM2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2b26baf0-6a82-0bff-99b5-ade067e0d74d@suse.com>
Date: Wed, 16 Aug 2023 12:31:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 07/11] xen: address MISRA C:2012 Rule 2.1
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1690985045.git.nicola.vetrini@bugseng.com>
 <7f8cbd8c8ad64cd3a0d099f31cb4d3fad48aa63b.1690985045.git.nicola.vetrini@bugseng.com>
 <e2d71138-e714-3c19-d5b9-94b322a47191@suse.com>
 <alpine.DEB.2.22.394.2308031648340.2127516@ubuntu-linux-20-04-desktop>
 <3a6ab847-fd31-60e4-2558-feed71d670dd@suse.com>
 <b0581f49ac01c923809c0e15c1a1dfed@bugseng.com>
 <6e1dbf093687e5fa66295621ce67e4dc@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6e1dbf093687e5fa66295621ce67e4dc@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8696:EE_
X-MS-Office365-Filtering-Correlation-Id: 25c0102a-7087-47b6-4ca1-08db9e43f1c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bqbO1min8koPdnB5QMeaL0PE/lCs2lyWyzPGzzWSFweotcdZ3Efmc+4OPRXoS69uAeNiKvjkCElLOfLqcOgtgu/m1gLheew2e2nD6LyovH5sJDtg8xK68Z0Z7DiOY9y2yd/SJeqTpfp7aDKdWffZ0JDbBIwAwtlMR4V9L2SQUyOZ7OsUMafN5wXNhSjOBU+8v6LmTc3f48evrrDPw67i34HWmxR3FOGYKBGW91Kb3fwa6keVLvO09KeIJ55bHIN7MHkHjCqA+JQ4553B77LZf8Kl/LjbS4J8hJBgHkHgPsA9Dbz151U+vVLh5VaeSLBtU3NeKc59Q504FhZD0CqmZBLG0eoczjkVKG7TQRZnCv4v0oH/Gkm6Xyg8P+O+qMpJPdzdFVymuziKlp4lsI8fAFflPS2eK1l0T/d8XXnI4UP+7lMDcn/LlBvqkJyRY2G45s8Cwr9J2CUYsUJMjFgCI+vvVwNpoxEUtzdUnUmc/G+3PLvp80BClqoFbwYCexBDVaSMZGXDxb6SIoYMT4Q9TskIb4n5l6rjDwMd9e68O4cDA7LufYZFvjZkrNmY6gBVnb24QhSy8WxrRtWqJyx/51zJ+Lj9sOk4L6oXGaxDVPVk4eGV3+7ZrYedtPCNeST8sJXFVGItG4aQXZH4mYtlRw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(366004)(136003)(396003)(39850400004)(1800799009)(451199024)(186009)(2906002)(83380400001)(7416002)(86362001)(478600001)(31696002)(6506007)(36756003)(6486002)(2616005)(6666004)(6512007)(53546011)(26005)(5660300002)(41300700001)(6916009)(54906003)(316002)(66946007)(66556008)(66476007)(31686004)(8676002)(8936002)(4326008)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGxsOUtXNHRJRWNFSzVKK0QvMlcwMXpLdTQvUmU1amN1V0k5cnBvcVdLSEVr?=
 =?utf-8?B?WTNjNVgwbm9QZWtwVWRublJzQkQ2RFFjT3Z4bjdSOUR6QkhxTG1PTWZoV3J5?=
 =?utf-8?B?SE92VndTelNRUkM4Sk95Si9GMzdTNnViOVMzR0hlaGU5aFl1MmdkOVZWT3dB?=
 =?utf-8?B?dTFnWHNrZG1Iaml1bGtpeE9GMXhUNGszSzVxeVV3V3o5YnJPSndZVTQydzFZ?=
 =?utf-8?B?bERHVWQxeFJDN2VIN1pZcC9oZ040a0ZBcTBOMTVma0ZLZ3IrTWR0dDVUdGlC?=
 =?utf-8?B?TktIT3lZandDQXl2d3RZdWlDWDBwa1dSS0ZndThCYU1odkEyTnF2V2Z0WWJF?=
 =?utf-8?B?RW1qdTVUa1BoL3dzTCtGNGtuR2ZVU2RoemZkMXlkS2VIdS96UWxHMDZnNnQ0?=
 =?utf-8?B?WnQxVTRxRUs2a3FrcC9uR0dDSU8yRUJCeU1aQWtnZmc1cllMaW5EdW5zc3M0?=
 =?utf-8?B?dEsyazduZ1d3TVhCOW9LK2pObXhPUS9GbE45cnAwaGF3R3VzZGU3MEI5VHFw?=
 =?utf-8?B?ekJoYzJSZjRtb2ViSTRaeStIZ2cwbnBWWiswUTh5eW9OelZMNEVmcnpwUWFE?=
 =?utf-8?B?RUhBUjgzSGFqTldqaTNVeWFBNDRlUjdpcUF5VnhadFF0dmdtY2hpRGcxTEtw?=
 =?utf-8?B?S0E2eFppSXBuQjRRRTNUWjhjeE9PLyt3VzF5L1VjVGYzL2xFMzRibC9xNkZP?=
 =?utf-8?B?QmFubnZZV0hpMjdPZTFORDRodFlYbmlXQnIzTFl2WHpDNk9wakVjUjJXSUhs?=
 =?utf-8?B?RmN0YkdIeVhHdEY0WFNOaytEeUJ1a1R1MTVGeUNid29neFQzSy93WjlCY3Fy?=
 =?utf-8?B?SE9tLzNOTGpsb1pMbC9QNkRpQjQ4U3FBZGxFa081R256RU1jUUgrUkV5c2l0?=
 =?utf-8?B?QlhYSXBQRU9QWWI5c01ZaEdNOTM4NHQvc0d6WTQrQTk3R20vdE9HM1FJZkl6?=
 =?utf-8?B?UW9JM2NQWmMrTW56ZGZ6QWtTZUJmWFpNYVhYQ1BBaGtYQWhvMDlQWXRISC9j?=
 =?utf-8?B?eWFNeDJKbmVZMEFadnhxd2o3OFhwQzR1MzF0TzdoNWtmT3VERnhDZys5bzdL?=
 =?utf-8?B?Sk5Ub0l4cjUrK3ErTTNIVjhGZXpMWE1pVFoyTWpMcHB0MGpIYm5OMldpQi85?=
 =?utf-8?B?THRWOUhnazZCUmVMN0tCTHF4RU1aY2NHblU5OGcyUWtFYlRZaTE2bGdlSnRI?=
 =?utf-8?B?U0VPbmQ4bTN6T2ViL0UvVVJQa3ViYzFJNTNSRWU4U2ZMRFhhTXc4aEZnZHJj?=
 =?utf-8?B?NzNnVHBnVHNZVjF2a1ZmMUpOWDNNQ2s2ZHR3bklMSDVEZUJNaWthK043Z1FG?=
 =?utf-8?B?NVdOTndYT1dHTHBXeEI2a3NWMi8vMjBFSEwzTlQ1anBjMGZNNzg2MWkxU0Zj?=
 =?utf-8?B?TDRYTnplRkpuRUM0dEFyYjBXeWZBWXVDa2Q3RkY1c3RmWUxhNmk2d0x3Y2dC?=
 =?utf-8?B?TlhBUDhlb1ZTcjJ0b2NGbkZzSTk4ZXRqV01VREhONVhzZDVNQ25YNU4rRk5Z?=
 =?utf-8?B?Q0V3dXpJbzVGaGhxWWxDOGV3TDFRWjNsbGRkOGVoYkJ1N2V4TmhsRU5kNzBy?=
 =?utf-8?B?YzI3dE5mekwxcGcwMlNzWlpUMHc2akNXUFBBZk9LU2N3N3BNWHc0T0ZTTzBD?=
 =?utf-8?B?WFhoL2RVK25LZTJBZmpuMTBrSy9wc2xJekxsNXduZFFsZEk5ZTNZcGg0VWlE?=
 =?utf-8?B?UVBpeGxtb3hqNDR4bEVjSWlIdSs5ZjdNS3dTYjk3Z2JMemVuSnhTMUFjcmVB?=
 =?utf-8?B?dm8wSDZsQlROQ1V3QXFnU01rL3NTbUxjeWZncVhWZDg1NWE3Y3c2eHpMY0s3?=
 =?utf-8?B?NzJGYVE5MTI1NkJKRHlSWVBiWGJPTzR4UFVLeHNZaEdtU0NrSmx3bFRwdUd6?=
 =?utf-8?B?eFl0MmtNa1JJR25YSWRpeHdSTjNUZzUxbGVDV2NXT0dFVHQzemo1Nk5YbHRP?=
 =?utf-8?B?ZUJISkpZY0dBN1cwRmZ5NEc3QWRUV1dkVDFIRkdaZ2NndXFqSVJNMzRubHlR?=
 =?utf-8?B?Y1hYUkNNRkZEVVA1b0I2QmdPbTVkbzZhVzQrYnl3dE5rWlM2QTl6MWxBd2d0?=
 =?utf-8?B?Rjl4Wk5ZOTdQQVozMGYvY3lLd3FUOGsrcEFEN2dGcEhmRUxERmZ5Z2VWUHNx?=
 =?utf-8?Q?rDLHod9SUGvrMg7Xl5eR9VpKj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25c0102a-7087-47b6-4ca1-08db9e43f1c8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 10:31:26.1383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JYed4FOTH667w1M616bd6jH+xDuP3/nghOhVvthkXL66bZhKl4oX0IHTaLJ6VlHKIVKnPa/lSGG9uctKexsyoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8696

On 16.08.2023 12:01, Nicola Vetrini wrote:
> Hi,
> 
> On 08/08/2023 11:03, Nicola Vetrini wrote:
>> On 04/08/2023 08:42, Jan Beulich wrote:
>>> On 04.08.2023 01:50, Stefano Stabellini wrote:
>>>> On Thu, 3 Aug 2023, Jan Beulich wrote:
>>>>> On 02.08.2023 16:38, Nicola Vetrini wrote:
>>>>>> Rule 2.1 states: "A project shall not contain unreachable code".
>>>>>>
>>>>>> The functions
>>>>>> - machine_halt
>>>>>> - maybe_reboot
>>>>>> - machine_restart
>>>>>> are not supposed to return, hence the following break statement
>>>>>> is marked as intentionally unreachable with the 
>>>>>> ASSERT_UNREACHABLE()
>>>>>> macro to justify the violation of the rule.
>>>>>
>>>>> During the discussion it was mentioned that this won't help with
>>>>> release builds, where right now ASSERT_UNREACHABLE() expands to
>>>>> effectively nothing. You want to clarify here how release builds
>>>>> are to be taken care of, as those are what eventual certification
>>>>> will be run against.
>>>>
>>>> Something along these lines:
>>>>
>>>> ASSERT_UNREACHABLE(), not only is used in non-release builds to 
>>>> actually
>>>> assert and detect errors, but it is also used as a marker to tag
>>>> unreachable code. In release builds ASSERT_UNREACHABLE() doesn't 
>>>> resolve
>>>> into an assert, but retains its role of a code marker.
>>>>
>>>> Does it work?
>>>
>>> Well, it states what is happening, but I'm not convinced it satisfies
>>> rule 2.1. There's then still code there which isn't reachable, and
>>> which a scanner will spot and report.
>>
>> It's not clear to me whether you dislike the patch itself or the commit
>> message. If it's the latter, how about:
>> "ASSERT_UNREACHABLE() is used as a marker for intentionally
>> unreachable code, which
>> constitutes a motivated deviation from Rule 2.1. Additionally, in 
>> non-release
>> builds, this macro performs a failing assertion to detect errors."
> 
> Any feedback on this (with one edit: s/a failing assertion/an 
> assertion/)

The patch here is kind of okay, but I'm afraid I view my earlier question
as not addressed: How will the proposed change prevent the scanner from
spotting issues here in release builds? Just stating in the description
that there's a deviation is not going to help that.

Jan

