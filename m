Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA1D5630FE
	for <lists+xen-devel@lfdr.de>; Fri,  1 Jul 2022 12:08:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358928.588314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7DYT-0001ir-03; Fri, 01 Jul 2022 10:07:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358928.588314; Fri, 01 Jul 2022 10:07:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7DYS-0001gj-S9; Fri, 01 Jul 2022 10:07:16 +0000
Received: by outflank-mailman (input) for mailman id 358928;
 Fri, 01 Jul 2022 10:07:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/an7=XG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o7DYR-0001gd-1e
 for xen-devel@lists.xenproject.org; Fri, 01 Jul 2022 10:07:15 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10044.outbound.protection.outlook.com [40.107.1.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92e65fa4-f925-11ec-bd2d-47488cf2e6aa;
 Fri, 01 Jul 2022 12:07:13 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR04MB3033.eurprd04.prod.outlook.com (2603:10a6:7:1d::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 10:07:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.015; Fri, 1 Jul 2022
 10:07:07 +0000
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
X-Inumbo-ID: 92e65fa4-f925-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+NTs4GQfia4NC7fvGHrAysuI8mLIy6a+pYS8V05LlRLlwqFFy30NSJMDsDMWsw7zpTTemqsplYNDBlKI1fB3o9iKG9hKGMqD4ydyKkXSjYezyxb+1BATQwA23p8AZHIUcMSrcd80LomUlPZtGF0dGQ/R1sq42OZd1fRBuxQsQeDVHekIq/gmr1ZWM4ganPji+8RNywBbi9u2vZ4XyPODkFgqPOFjlot+Nslrt2n2NCTsg4mjYOU6VCeAMEH6/mJQxy9p7K5T7V1dOrHVFHwYQiVy1PxOrSSI4Z8P0qNHcRAG6DZqrVna5+zTKTxOFRXrO9Tw+G7KcdUpGQWOrKnOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QE/ZsfTp4HR94aaoC2vqzmvLdkoUqNUorD1fOt6N8tA=;
 b=ln1onDQl/HbqjWVSEL/nsWVVmfC2Uj7sEbmVRaxioDcFaD2HIaeHl/gz5h/Al5oVbxcbBl/PxgUjHmOu0IQ+h24DpLzU+MhbWFZoQfnK8KgPWa9RKIfJOhzEtQFtTMJvQtg0SqzAyZvxQzmEpcPYTy2RwjX2FXx6cNohmugWQ+3xy52n76eCPVu3/F87dT0MNwk92gtrF6RBW8xsO+qbO7TKK4JRTdY59b3JkLkecy21dzbkdxxKw/Xacj7cgPjL3DoFPZYZpMS9svJUkEhV7nd505MLq4Pd4IOWqS9Mi0NX4jVRdaECu6zTPdpDRP9z3qqJqvOPKSFYV9UaH9NkBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QE/ZsfTp4HR94aaoC2vqzmvLdkoUqNUorD1fOt6N8tA=;
 b=mJThu+8TivbSnq23rfbti86QEVBMz+SGq+2WSBFcPFxyhbvMAYBFfGMC9hhUqB6LEFOoaH07jp6FewKHi2D9v+XIkA3mLUQKTUdjxt8FR1v3j5BMlahF3Dxo0Fv3dtkZ96sxDec9yEHafLB8S4rHakpnj1nKGMt7p29IKgnciyiQcGc2ZOBSjfd4+KfKLbPkbAz5jFsI3ZRuA18Xc2q8SWDeLN3GGTIwGfzi86jmhe8CymQdHaANR6Wi+yOf+3dX7Bs/sy3KCvGHFYj6qnabJoGKVYcZjSflNQDglLvehAxhAwba+PeqeGitxcaPcgLRy6Z/L0+Yoyj2a5OVBytFsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7a6515c1-840a-65d7-645d-8a67e0f3c109@suse.com>
Date: Fri, 1 Jul 2022 12:07:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 1/8] xen: reuse x86 EFI stub functions for Arm
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
Cc: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jiamei Xie <Jiamei.Xie@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>
References: <20220610055316.2197571-1-wei.chen@arm.com>
 <20220610055316.2197571-2-wei.chen@arm.com>
 <05dadcda-505d-d46a-776a-bb29b8915815@suse.com>
 <PAXPR08MB74205A192C0E6E2E4BDD64BB9EB49@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <8e44e765-c47f-4480-ee44-704ea13a170d@xen.org>
 <cd5d728c-a21e-780e-3b79-0cfb163eb824@suse.com>
 <a6844d62-c1aa-a29f-56ba-3556bc1d4dac@xen.org>
 <6e91d7d0-78d2-2eec-3b14-9aea00b2a028@suse.com>
 <bad83568-94c6-6d90-308b-ae9965f54754@suse.com>
 <PAXPR08MB7420AD8092F0FBA43C359DD19EBA9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <1d488f5d-bfd3-a816-dab1-515f49a57f67@suse.com>
 <PAXPR08MB7420F8745E83D013AAF566689EBD9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <13142c32-f67f-751d-4783-87e8afa1117a@suse.com>
 <PAXPR08MB74208E40EEE93B3EDA2DFF609EBD9@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB74208E40EEE93B3EDA2DFF609EBD9@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR0502CA0050.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::27) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28324b48-c577-47fe-3914-08da5b4974cb
X-MS-TrafficTypeDiagnostic: HE1PR04MB3033:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iscbRJM4D5q283y2rrpoLp4kLR9AL+EmQ1wwDShLxGlnRFuel0iNSobqMANv9jT3t6HeeRCrYkxbVWqtXYUpGTyhqbBmxuXhvYkfYZMKaMZ9BcAUFpRwMjTT9nkTEN2sBZO9r3yFYGaiqHuFjBjCWnj3bYIaWaGpEmuZBESAYQikv7Rh8EfEl4v2u2mzcJcQfIhOEk9ZepcZ2Ma7TbODVwSwYCgkoDOyQ3F/NxS60cDpBJ3OuJdzhAYu+HlgvnBLp+y0f+ZuprcM+XhdYXN9SHFJrt8XTeDleejCXKltCCd5Mx9kPQT4WPtHxVcAPdRttBw/zH1S4QADDcUjP2AX8dXuKbpFiJ+uK7co1AXwHeSOXvkjNnFnP4xJdxzOnAwKDhmsE8s3sjZ4t4nZZQlAPdsq8JIfN79OIQjvEW9wVGoGsY8+LhT3VKKhZlywKWSIOTx/e2O3JJ0Xw0QApwhOtJlH98x47B3tnsxYqpdOADvpmIFAhi2/taS7aHOpYGQaz/gbmbUsuqtZuLpYSOcPdEYqDEcBuX+eWLArcgWpvbx1404sRYZR0MrpeyM8D5duTAlxe5CDIlf7eGwoRuRFEIWhTMS12Mv4XzPlEHy5a527/zPJadaKelH/b6nDBJbqbboja5U7lbKI43Oy4NChOBBnBq83wdXgmnAL4aEyWPQm3vebLZu3kEW9Zk16eeVcct45D1JI9yLO9nMhph8ix70weBJqZ9fAApd3HA74Bq79viObwhret/ph+fTJ73WcnJuBOn2yYtCycI5wokjTevknVkYGux6jXtgVat5FhaQdvMjlQZVMlE6BNNp2lnjsw0VsYBHMtr9xgQTbWpgQEwY/EcdYzSeNnGidvrf3AN8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39860400002)(376002)(346002)(396003)(366004)(53546011)(38100700002)(6506007)(31696002)(41300700001)(66946007)(4326008)(5660300002)(8936002)(6862004)(66556008)(66476007)(8676002)(6486002)(86362001)(478600001)(7416002)(26005)(186003)(6512007)(36756003)(316002)(31686004)(2616005)(83380400001)(54906003)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWNsVllLWG1aMy94M0RsYk5hdjFpaTVHaHUzTk8xZHZXYW5QazdKWGt6M0w0?=
 =?utf-8?B?NjVQeTJMUkRnU0RNVlcvQVdYQVYwc3dML1NIQWNNMGRrTG1RNHdFclkzTDlT?=
 =?utf-8?B?LzdQQ3dwUU5TTzF0K3duZTdwdkNYRW8xbXN3dGVXRVc5UFRqVXZ4WENEaHJ1?=
 =?utf-8?B?ajVaTEE1bE5NQzJ6M1JyOWpaOWlmSVZ0L0E2QmsycHNOY2RSaTdablhqZ2tz?=
 =?utf-8?B?OGtBU0ZsTUlSL0ZoUis0TFlZSHRMWndOdGlJeWVoR0hoT3VtdHExUDdmWHpC?=
 =?utf-8?B?b0l3WXF2U2V2WnNSM3BacXdKd3RjeG1iRjUzZGdyR3dxdkl2ODVCeGNkWnZk?=
 =?utf-8?B?azhJd1pvL0RkWVhvVmlzZW14TUp0S1ErOWEvNUd0ayt6Qnl6MDNQbTQ1ZE40?=
 =?utf-8?B?eiszc2ZHYzRXMmdQUk9NZStuZzlpUjRpT2xkT1lWL3VjTmo5MzdmWEtxNmlI?=
 =?utf-8?B?ZUk0eDJoZWN3cHlMaUJINW10Z05ac252RnV4VXVSU3cxMWZub3ZQTndjV2ZN?=
 =?utf-8?B?cjA0WVhpK2JnWjBTeW5OMzNmRlg5MGtDbWlOQ0xDVTdNaVpidDNvN2JzSWZ3?=
 =?utf-8?B?KzZqVTEySEJtV2lQNzBTU1VHVjBRQVpsUVhHT1liRUthRVNJSDErSHRNcjVT?=
 =?utf-8?B?U2IyQU9zV2NaMUtMTElOemNoOENpT0s5MFNmZ0lZM0lJZ0Qxd2loMC9BVWsy?=
 =?utf-8?B?cTVDUHJQMzF2ZFF4RXlYaGplSWtaZ3ZTcEVjSVdrUG5GSVBzTzlMN2dsaVUz?=
 =?utf-8?B?c0NtSU43ckhxODdDTGJyd0RXQStYa3lMd2tnYXRlL25kbDQyYjRNdTYvNGpu?=
 =?utf-8?B?ZWVDVG5jNGxXMmpEVFFwN3FjM2poVzgzQXRqM1JpNlhMUGY2QWg1Zzk1aW8x?=
 =?utf-8?B?VmNwaXUvZXJXZzlQaWRKdjU4N3Z1KzBCU0RzbUhtMkg0bUQrZVB1VG8rV1Rk?=
 =?utf-8?B?RlhKZXBicml0UWhjc2Zhc2dzenE2WEZVd0dTS0NKNU14dytaT1d1ZldVWDlw?=
 =?utf-8?B?WENMNWxncDZFbEJHVFh1ZFBuL0RscUYvUHlqWWhoV2NUL1Y5NmhGY1JHeWhq?=
 =?utf-8?B?dmhmY3FYVjYzM1hTalo1T0ttVlN1WGtlTW5kdHRhOWRoWDdqWnRGemhzMFVK?=
 =?utf-8?B?MmxWUVFkdnEwM0xqSTRzWUpKdmpnUmlybzNEMWRhWUprd0h2ZlpodUlRb0xL?=
 =?utf-8?B?bGFjSURJdzk0VUYwUkF0OWZHeEluckZBYzF3V0pndFNYRmloTUFucDkzVU5Q?=
 =?utf-8?B?cHoza1VUakRDdUVpeGFYbkZWTXlhdzQ2a1QxK09LM2NNeERVdnZZLzhGbFlY?=
 =?utf-8?B?bTlrSkJjZ2p6UmJUSVlLNzRCYWUxVUlCVld0aDMyNGFOWjUvMmgvSmZaVjRM?=
 =?utf-8?B?SDJjRmlRVnR0M0ROcU8vbHVMOHZ5Q2xYbFVkdHJsOUFXWDZrME5WeERaRVdn?=
 =?utf-8?B?dDNsZVdWdlRhODYrYUE1aVhTeFdJbW5OWWh1aldHMjl2Qkt4cUFySTNldVI5?=
 =?utf-8?B?VVpyNHY2UFlPbWhodU1HV1VTcW5oUlkyS1hZSXVkQ2w0QkU0YVdWcDJNNFRl?=
 =?utf-8?B?alVheGh0ZVVHRExBRXZZVkEzVzU4dVpIbUU5bHpVR1drcysvLzAxY0dpaGFt?=
 =?utf-8?B?Zy93RHJxQU1jTWF6WmlFdkhsdG54OEdHeHhOVlQzblVHd0t6ZXN6YXhWc1Nh?=
 =?utf-8?B?bnllM0dyMUc2TDZZb21hWU0wWVZlRkt5YUF3dVpwaUc2eVp4bUJTTmNIbEor?=
 =?utf-8?B?dnFDYjhsN1BPcW1CSEkzTUsxUFJ0czZrM0NTM2d6V2FDb3kxY3RYaEdPSk5K?=
 =?utf-8?B?VjJrK1Azbmkwak9FeDdUWmlEaWM3N3R5TlIycVp0OHdnTjd4d3RvSnZHUmxy?=
 =?utf-8?B?M3gySEpaWEE1ZkFpTFo2Q3ZZaTJUREZ1QkRIN3greTBiemlmRjc5UnNzSnBu?=
 =?utf-8?B?eHNoS0tGZ1gvUmp3WFRtV01TaG9BUXF6cGU4b1kzYWwzNTZDYlVwR2o0WDRy?=
 =?utf-8?B?b2t2RVdFUGdYTElnQmxrZzRqMEc1RUUzbVVLZ0Z6eSt3WDFvT0UvWGRybEFX?=
 =?utf-8?B?NVNOWVU0bmdhTDZ0Um8xRTdieUtiSFdCUTg5cVFIQ2ozZ2pHaFhuUnVPWE1t?=
 =?utf-8?Q?txFR4i8gbyLFzDv2fvX+fdjJd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28324b48-c577-47fe-3914-08da5b4974cb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 10:07:07.8280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e/kSnxHz0ki2OG37ZnPdqxMGtdDc9GvngLlp9Pphs4Q3cvsxHEhLhA0/iOrNk6+vt8oDCYteultQikArxCt9zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3033

On 01.07.2022 08:10, Wei Chen wrote:
> Hi Jan,
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2022年7月1日 13:54
>> To: Wei Chen <Wei.Chen@arm.com>
>> Cc: nd <nd@arm.com>; Stefano Stabellini <sstabellini@kernel.org>; Bertrand
>> Marquis <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
>> <Volodymyr_Babchuk@epam.com>; Andrew Cooper <andrew.cooper3@citrix.com>;
>> Roger Pau Monné <roger.pau@citrix.com>; Wei Liu <wl@xen.org>; Jiamei Xie
>> <Jiamei.Xie@arm.com>; xen-devel@lists.xenproject.org; Julien Grall
>> <julien@xen.org>
>> Subject: Re: [PATCH v6 1/8] xen: reuse x86 EFI stub functions for Arm
>>
>>>>>>> this way.
>>>>>
>>>>> I have taken a look into this warning:
>>>>> This is because the "-fshort-wchar" flag causes GCC to generate
>>>>> code that is not binary compatible with code generated without
>>>>> that flag. Why this warning hasn't been triggered in Arm64 is
>>>>> because we don't use any wchar in Arm64 codes.
>>>>
>>>> I don't think that's quite right - you actually say below that we
>>>> do use it there when interacting with UEFI. There's no warning
>>>> there solely because the information isn't embedded in the object
>>>> files there, from all I can tell.
>>>>
>>>
>>> Maybe I should describe it this way: Arm64 does not use wchar type
>>> directly in any code for parameters, variables and return values.
>>> So Arm64 object files are exactly the same with "-fshort-wchar" and
>>> without "-fshort-wchar".
>>>
>>> Although Xen's EFI code interacts with UEFI firmware, similar to RPC
>>> function calls, these code also do not explicitly use wchar.
>>
>> How does it not? There are ample string literals as well as enough
>> uses of CHAR16 (the UEFI "abstraction" of wchar_t).
>>
> 
> But I don't think CHAR16 will be affected by -fshort-wchar, because we
> have specified CHAR16 as unsigned short type in typedef.

Oh, I didn't recall that anomaly. Yes, then only string literals are
affected. Albeit I'd hope gnu-efi would at some point switch to using
wchar_t as the underlying type, as long as the compiler provides it.

Jan

