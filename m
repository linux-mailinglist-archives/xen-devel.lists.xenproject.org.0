Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD316624C9
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 12:55:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473555.734238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEqkc-0007eO-Ut; Mon, 09 Jan 2023 11:55:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473555.734238; Mon, 09 Jan 2023 11:55:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEqkc-0007bD-Rn; Mon, 09 Jan 2023 11:55:38 +0000
Received: by outflank-mailman (input) for mailman id 473555;
 Mon, 09 Jan 2023 11:55:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f6do=5G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pEqkb-0007J9-Gt
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 11:55:37 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2057.outbound.protection.outlook.com [40.107.8.57])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86a8a279-9014-11ed-b8d0-410ff93cb8f0;
 Mon, 09 Jan 2023 12:55:35 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9400.eurprd04.prod.outlook.com (2603:10a6:102:2b2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 11:55:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 11:55:33 +0000
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
X-Inumbo-ID: 86a8a279-9014-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=crr5/fVaSMfV8/izX594wQZNidv+u79DFNfTsG9LI3y6C4Z4DUOhHyV+TUTTJ3NQXuVC30jocpCVKkowTZRxeSIrnxKnH9msbhZhVKUpgJPbXUfwGcSAVZ1NEaKc9vrLd5Z8khIKxSqCHOcCQ6SBRKrRi1kOboLKpEj+oMrmh4xhNr64ZJ/2nD1MZ2wRReByq3srDPogPxnieJTtHKZI6EWllmpiMbM6kKozTjxPLOwx19ALWYqkdXSbY+WjDMjVF9f+WrwfcEtWR8JF+zu6jjcfXYvZrbm0/T0BCgYQPqVN3V/vj4NHhbSwLNeGdRsYSl3CD3iFON8tgEsB8nCLFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0FwTL+KLmDvFMFlT0Yz3dMkCUPBpwkY5q/+tUnrTZl8=;
 b=De8y2WucBoSmmYNMTqnM46DpPXgd1F3QdSEtMhErnS8PSGk/HFg3MAQpnoGAMpwWCz9EmjUiLz6Gp4iWlVhYw6bmO9uMM0NxYVeNzmHv5Gz3rfNgch7sqUUydpoxktNZiyu3uIHJ7/dgeHjLDoWSrvNSnDvtmRO8v2L+F1w3Gqz5jUJ31yDrNmnWWh1aeGmpAHS1m4RY98XKAJ/Fe3KEdfC6F4iR2RhQZ6X1vfXNt6uQRMZ1hldLBrg6x1vGhOwOGt0Gyeyr9oHBgbqHg6ibbi8bPe5VX+IVqwD+MLbp7I3G8cmmBHZ41lNfQI6PJ3B0wOzzkJuc2bGXNOvAS4zT4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0FwTL+KLmDvFMFlT0Yz3dMkCUPBpwkY5q/+tUnrTZl8=;
 b=XmTPTlhqJurksy9GqtyefS4o4280jpcvUqH3Mzw+ZXjs/AVjinLYIeiO4QLvXu7uKJZbFaEoBW2+LC6H2OuBCEOY+MnRbjGFSE44enWmEMTDKQG5BhSNGaVM5WOYXINwzCrjMQ2E6kD24RVlMlCCcxReLbBR+pOXjvVIiLBA+RtgEDNb4ziRicEGidEfQ7P3yHM8dsZLSc0Af9vk0jIgfnqLrC9kOscMe0K/fm7B7lLBOMzyBJ7Jd+Vov82baXjn8uYhGt5OXYBu5ZbgQsU3y6xB2gvpqYVyaqNB6n3VpG5IUWCOi9JuH2dYTgdIjSrIgKMXomLABnat1BM8zpHOsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f237eab1-1555-97de-7151-58bc7abbac1b@suse.com>
Date: Mon, 9 Jan 2023 12:55:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/8] x86/paging: fold most HAP and shadow final teardown
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, "Tim (Xen.org)" <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f7d2c856-bf75-503b-ad96-02d25c63a2f6@suse.com>
 <8d519e00-83c6-aee9-e7ba-523aa4265e1e@suse.com>
 <af33fef0-46f7-b206-53ed-33d66f0f008c@citrix.com>
 <780eb542-34b9-c64f-0a40-acc462b87c72@suse.com>
 <4de3cf99-f8ab-c439-b383-859a41e90517@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4de3cf99-f8ab-c439-b383-859a41e90517@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FRYP281CA0011.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::21)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9400:EE_
X-MS-Office365-Filtering-Correlation-Id: e465f2dc-006c-4373-97f4-08daf2386994
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IVPgEcMNuAabCFFoJtKbCOF9VG6EB/Qf8GxGQRySmCdrRuT8EIMRvdN8cb36F9VDoQNIfF+k1yu+srMux2+JAVqLV51XCW5/pUFTYfzGNboYeCqqNbMn67VwH8j4x11Ngu0LahP6yKdqmmf/QNx0Vtift3U0rMzU+u/OzB6xdzWuZdL99MWkWv2TT7cMdQRkkvMSmlK1oNi4F06Kge/hRJ2tDsG8xTGAPa1EQC4aI528lWwL0uLph7SjcZ8Pu4VY3PAk3XxJaARBv5vfObsEHG55sDZwALSnpF5UL8oCWMpAEeF5To3/XPrkXV1MEfRw8khlwjgWiO8D3PgHRvAWRP13+u2/AG1GdmQrkGehgyfJcIM2QNsDptrAVDBwC2O8w3ry1QACemvQIJIzMY2ffGUiPVAx1JmglNKWdyRJugTRcZ3Fa1SO4Snsvou15cu9/GLDJ9uuOXHWQe8Uq4MT0lOTD27RS9ODsgrQjDO40QFtGjePvImdvp8Ryp/hdKBKmUPismFfllm/1BOgP5S5OZhuoaOLEhPxypqH0TCbyJ7FR/VsleB/y1nfPhVEupE6vqptAmKtCKCqEVf9gPYbPSm6SJkD6eX2beWwwGn9VoTPxpB4C3yYFtz1hjk8E2RnLqxnauX0ZF4ptgmAZmPBWl7ULVMdNOsLvQl9svBZY/EE/mAjEZxu36AfKkjTXtePjo4XClIzOA6VOY/EfPMKuaqcE8CdmdvxkmhnHGnhlD0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(136003)(39860400002)(396003)(366004)(376002)(451199015)(36756003)(186003)(53546011)(8936002)(26005)(6506007)(6512007)(2616005)(54906003)(5660300002)(66946007)(66476007)(66556008)(6916009)(4326008)(316002)(86362001)(31696002)(6486002)(38100700002)(478600001)(31686004)(41300700001)(8676002)(2906002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUkvMHV1YWlJT2VHODExcVpiV0dtY1kwbjFER2p2QS9LL0JaS0xvUXNLOXpi?=
 =?utf-8?B?WVlvcm9QWmxDU3VINzRNZUFlSDhoREhiU0RPaEhGbUFZaXoxNCtweWVyNy9p?=
 =?utf-8?B?SVFTOGdzRUN4alBZeHdFZVVpcFpOVzV2QU43U1hGRkRGMDh0UnhpTzMxSnVY?=
 =?utf-8?B?RFFjb3ZyUml2OFg2RXE0a3BXYlpIQnRMNVdsc1BWZ3NVc1dOd1pDUktRSnJi?=
 =?utf-8?B?TjhudHB1ci9zYld1UmsxSFIxLzNaUVM3TEFvMDlwWWNYVWNZV253d0RVWkxF?=
 =?utf-8?B?ajlJeXpHZ3MwenNDQ25mUEliK1ovbm5sc3NNNXd3SmtKcGJvbythRjVCblJw?=
 =?utf-8?B?cDdnMm1vTzBKNnJEd3Q0RkRUbVJkUlZkYlhjN1RpVG9yb01Ic0ZqeDQ2SWxO?=
 =?utf-8?B?K3lWNHpneXp1WGZTdE1wTG1RcTlRL05idlBWeC9VeVAvTVFqMzJtTEtmTlp6?=
 =?utf-8?B?WG95Z3A3SVRTTlZMbWtLYWluUjREd1h1U3Z4aFExckZXU1NNMGJLUDVwR0Uz?=
 =?utf-8?B?aGQwYXNxeWVyYzFLOEdEWXN1TlRTc1JOdFNROEZjRXN6VDkyQkxjenNveHh3?=
 =?utf-8?B?M0lzNy9QZnhBQitSY1NrbWN3YWo5SmIxeTFDL3RDOHhCZHRpejdnczFhK0Ri?=
 =?utf-8?B?N21pYnVLNG9FYmFqMlBoMjlNei8xQnd6bWgyblV1a3FNU0VKcnNDQTRKc3NU?=
 =?utf-8?B?eHFGaXc1aEYzeUo3TFZ1d3NwL2JCSUlMazdIVFM5YnRlcGhhL0dOWDhyU0F5?=
 =?utf-8?B?djcyTHlBYytpNkpQcCt0eHZ3eEd6SmVDTmsrNk9HMnE3ZjB6aGd6S1ZUcFZU?=
 =?utf-8?B?Q3lYVitDL2hRdGI2ZnlGa2VGbUtKcU53OUlVWFhJYS9zT2JKMWJkdXhjM2FX?=
 =?utf-8?B?aTNKeFg1WVJ5eTNsY0d0T2N0VTdWNEZYNW5FRHd3STNCd1k5akdLaTJqQk5H?=
 =?utf-8?B?SWtidUlrRkJPbkZGL094cjVmMFBhNUlHamhBUjk3NU9HYmRXTUJZbXB0Yzdn?=
 =?utf-8?B?RjJOd2NIU3ROMFJVNU4wUU9PU3AvQXhlVktHQi80bS8zSVkxbE5vdWppeFpJ?=
 =?utf-8?B?aFJUY1Jva3hKYzZoM2tLOUc1Sy84bGNvaGVVRkhOUkJkVEVRQ2RPMjZ6ZitJ?=
 =?utf-8?B?Sjg3M3BBSks2UzdYdUdTZnlBTzI0ZDJ0WEtaT0J1MitPaDNRMm9VaW54NGRS?=
 =?utf-8?B?cksrSGF2RnU1U3hnOVprMG1pUUxjMUNrcUEwZFlLVU5TOVVQcXVWRUd6a1lB?=
 =?utf-8?B?K0tXM1lDTHF3cUViZEtpYzgrczU3OWVya3RNVzkwaWVXbTE4Yi9oYi9LZkVr?=
 =?utf-8?B?U1plQ0RQellJS0c2anhEZXAvVEJpVEg4NisyYWxVWW5VdENyVFJlZ240WFps?=
 =?utf-8?B?MjJFVW5IdnJWT0pITU95d3NHaVQzTDA4TUtMaEIzTEw5WVYyekx5L3QzOEp6?=
 =?utf-8?B?OFBwdU53aldMakt4T0VxZTUzc3h6c2NoNHRiSHNWUzNpY3VxU1dzQTdmcWMz?=
 =?utf-8?B?WnBUR21jU0o0V2pRRElTMWtFamNZT1Y4c2N2TGpGV1J6T0l4aERJVFdJZUZh?=
 =?utf-8?B?anRINm81ZjhzYkllOS83L05ON2hzcUdmVnJ1VTN6MXRUVktoSHhPVTZDbnda?=
 =?utf-8?B?ay92UEtEb3g1b2ZIT0VVaVQveDlkalJjVFpJeVVoWDJPK1YzbXJEZTIxQ0pK?=
 =?utf-8?B?ZElRSEhmMS9mZ2ZuTHNTUWJuenZzT0ZDbjFVYzZlbkVrL2o3UDhRb0Mva3Qx?=
 =?utf-8?B?dzZUT0M5OWhMdCttSFNTdXZ0VTdOOWhkVVhGSHpuRy9hUWdVOGZVNGQ0UXFL?=
 =?utf-8?B?ZjljOUNvR3JBcW9zSE80NmpOOW1oV1c0eVBKdFVKTzNZaWYyZitsQU5LUEFj?=
 =?utf-8?B?Q3dOaS9FRWNNckpScTQvMlFEdWV5NXVxbnpwWW5zY2h6Zzd0bGNYSmxkVVhB?=
 =?utf-8?B?UnJHbE9waWR2S20zdHZid1BiVC9zd0lzY2Z2eFcvM3pFTUhCQ3Jmc1VOY3FP?=
 =?utf-8?B?QlhGQW5WaXUyc2FMa2FpbGkwRXZGZHIxaEVvVGl1TjFQUWx3d1VDNFdzSE8r?=
 =?utf-8?B?bVBVam42dWtHVmp3SkprN2UwY0pMU3VvOTJZZXh5YzU3Vk9Cay9kbDlLT09I?=
 =?utf-8?Q?O68vnlFMdNJbnWWYm2ccbxTps?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e465f2dc-006c-4373-97f4-08daf2386994
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 11:55:33.2751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lmq3W3luSVdb4fUE+wCZKY6ranJlBVhzo+ouP1/Je5iBR/PB6rod/ibN6QTkBmBRCrMOmG/HrRzuCKy3+R2BsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9400

On 05.01.2023 18:56, Andrew Cooper wrote:
> On 22/12/2022 7:51 am, Jan Beulich wrote:
>> On 21.12.2022 18:16, Andrew Cooper wrote:
>>> On 21/12/2022 1:25 pm, Jan Beulich wrote:
>>>> +                  d, d->arch.paging.total_pages,
>>>> +                  d->arch.paging.free_pages, d->arch.paging.p2m_pages);
>>>> +
>>>> +    if ( hap )
>>>>          hap_final_teardown(d);
>>>> +
>>>> +    /*
>>>> +     * Double-check that the domain didn't have any paging memory.
>>>> +     * It is possible for a domain that never got domain_kill()ed
>>>> +     * to get here with its paging allocation intact.
>>> I know you're mostly just moving this comment, but it's misleading.
>>>
>>> This path is used for the domain_create() error path, and there will be
>>> a nonzero allocation for HVM guests.
>>>
>>> I think we do want to rework this eventually - we will simplify things
>>> massively by splitting the things can can only happen for a domain which
>>> has run into relinquish_resources.
>>>
>>> At a minimum, I'd suggest dropping the first sentence.  "double check"
>>> implies it's an extraordinary case, which isn't warranted here IMO.
>> Instead of dropping I think I would prefer to make it start "Make sure
>> ...".
> 
> That's still awkward grammar, and a bit misleading IMO.  How about
> rewriting it entirely?
> 
> /* Remove remaining paging memory.  This can be nonzero on certain error
> paths. */

Fine with me, changed.

>>>> +     */
>>>> +    if ( d->arch.paging.total_pages )
>>>> +    {
>>>> +        if ( hap )
>>>> +            hap_teardown(d, NULL);
>>>> +        else
>>>> +            shadow_teardown(d, NULL);
>>>> +    }
>>>> +
>>>> +    /* It is now safe to pull down the p2m map. */
>>>> +    p2m_teardown(p2m_get_hostp2m(d), true, NULL);
>>>> +
>>>> +    /* Free any paging memory that the p2m teardown released. */
>>> I don't think this isn't true any more.  410 also made HAP/shadow free
>>> pages fully for a dying domain, so p2m_teardown() at this point won't
>>> add to the free memory pool.
>>>
>>> I think the subsequent *_set_allocation() can be dropped, and the
>>> assertions left.
>> I agree, but if anything this will want to be a separate patch then.
> 
> I'd be happy putting that in this patch, but if you don't want to
> combine it, then it should be a prerequisite IMO, so we don't have a
> "clean up $X" patch which is shuffling buggy code around.

Well, doing it the other way around (as I already had it before your
reply) also has its advantages. Are you feeling very strong about the
order?

Jan

