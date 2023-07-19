Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78ACB759467
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 13:38:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565781.884279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM5Vu-00007W-Hg; Wed, 19 Jul 2023 11:38:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565781.884279; Wed, 19 Jul 2023 11:38:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM5Vu-0008WB-EX; Wed, 19 Jul 2023 11:38:38 +0000
Received: by outflank-mailman (input) for mailman id 565781;
 Wed, 19 Jul 2023 11:38:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qM5Vt-0008VU-4f
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 11:38:37 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2044.outbound.protection.outlook.com [40.107.13.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb32d503-2628-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 13:38:35 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8904.eurprd04.prod.outlook.com (2603:10a6:10:2e3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Wed, 19 Jul
 2023 11:38:04 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 11:38:04 +0000
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
X-Inumbo-ID: cb32d503-2628-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DG82uEcMRZc/LSokcWf8/F5vq1bJ5EGREiiLiwjJQp4ByVIITGHsnaCPRTwXy0o1dJRmNy5jmBbsvSr+EakuJdYVYZRPJPvAssdVznUsjJ7GxANxF0ptp0tX/dMUo16Zbxg0/T/euENcDPwu9gWUUvVCLE0WEvDXT5OZYmJsNUiXUE42RhxfFHRaL0b4l19XWdkCqJu5juyyAcpeAiwRoKX0lhaa/CbSd/0dBFzHn4wKe3S3Jl1mL+PmNm3Ue1Kdb7eZ/mBuNxEJ/aGu8uh8kNBXUO65yUI1Rfi1OuteB9d+uDJwF5GQ4M92DaD6So76rvP+N7kWfedhSLdOXn3WoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YAu+K1yGs6EyfiupcFnDZvDzmMJj/ZtuJmcoKmLMP/s=;
 b=PvFVVlA8Hq4pojMSD1Y+jrG9oXpIu5KJlUNZUaTVpGeHQMMczPe7ZlHo8eNcFiYIFNFXZ7x6LuKy5n4XgMIEPqGvAcIjGvMYGmpCDV4W3ZJ4qofCVPnFb6VGE2s5l7df2otc7RQcAhIhjWRfIpe/xwCkQD5KQFbyVRg6fjA0IH96Ol6urXAkXWlFpHYTZtALjFfmES5Q8ZLDw2XzDYDP2Xq8HW5m3ZuHmsINUjc7HsC7LoMGW4uJ8YwQ1RGFyZZTL7LzNnI6i9XKOsuHcX0RvdE6+J4fuOPAdUB/qmS5SQ9QPI2qlWPlsxvNtzHASt8Yvv28k7hRwLzDhBxSNdWp7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YAu+K1yGs6EyfiupcFnDZvDzmMJj/ZtuJmcoKmLMP/s=;
 b=MEMlxvrjs0+yvycure05umBIIq1shSnVPl3jGe24s1M5f0Q/ThFo6/ks2iFfguKZtdNpyctSqeFJXJD0ETkWFyY7RneIKheAgwTM1YM+RwKIchVl+ub6R5YWxKFh90QT+KQv6X5xpvtlBHoc1z7Xba/vRcPXWWsuE9MiWpYnLKNg5h1A0g0ctc0hbqWTyS544SMWHVNH7VAZ7ujqOHpO+/GjnSVtS+2qCemNjDYZiygt8p6q9VW9Q/GYdxr+CD69kHc+GekLL62BmPmc3wSwFcrDg8PC8OH5SbRhvQRMNbjn2ujT3B2PnEpzGGPyaftEcCxgryT3ADhNL/Ql9ARwug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5feef533-cfb7-bb17-9439-6efcb2fb9b2a@suse.com>
Date: Wed, 19 Jul 2023 13:38:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 3/3] xen/riscv: introduce identity mapping
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1689604562.git.oleksii.kurochko@gmail.com>
 <8c69050d7b1f42df5e776ca9494164a4d15f2d52.1689604562.git.oleksii.kurochko@gmail.com>
 <ad53c037-3c1b-ff1a-93df-b79ab2948174@suse.com>
 <dbb568a33691b1fed5cb7f8de801a87e4aebbe4d.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <dbb568a33691b1fed5cb7f8de801a87e4aebbe4d.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0136.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8904:EE_
X-MS-Office365-Filtering-Correlation-Id: b0ed1d82-e24a-4914-4048-08db884c9d97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E31dVL5SQtRv5JBNLfxAeQDq+ELpoKjJLl5c2yXkgki11apkIONVxGDu9z4sy1+FCuz9DHTPPAEWRU3HDRBOgDOrOhq72k2y72Im5a75XYEGyPKjSOTRW+tDHOhjEB2xLCGoQIMQqYF0JDvCY40u60jZJHIIPDbWBnyhTfiK6tDvDeJ/px/oQr9bjIhI5Eu0Oc6EeptOQ0XG5gwVFGjkiplUvamUyvOX0rFPSzvmHxj+L3eV6ypvRtmF/euFKqMlZ/54MxMQU9oOKAxOt3jVWmqiLCvNaIOQcg5LIfPJHgcr9N2vQ1rq/91Yy9SGbH3/zI11KQboBY9NbOyOCilIsTaV7QNFw++B9T9x6/NemgdPbKJvpwXZ0gcXWXWSt1kmCy6zFp+ygS7+D1QH72QcOuoBlgvgA1uWoMb51jZuOCn9YvJ+xOKyFl7kwsO/4CSlHtETo0u52txVsex/eF1CuIbExv0jNxHf4br23hfifdAWY80UmmXKStGQLIAMr41GdMYbC61+2WkDANrDRRozYA6FWSjDFRV2h6IXAy5sUrCWXyyd0eIS4D/1anYAeW/J7BO1zcs1TOoHWkc9yJ1y3rtal77V/vbZf932JHpDGsOOMJkJSWXJMz0fuV2sQglFl3TbhfFhfJzQNMrShQ2bKw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(376002)(396003)(366004)(136003)(451199021)(31696002)(86362001)(66476007)(31686004)(2906002)(4744005)(8936002)(66556008)(5660300002)(41300700001)(4326008)(8676002)(316002)(6916009)(38100700002)(66946007)(186003)(36756003)(2616005)(54906003)(6506007)(478600001)(53546011)(26005)(6486002)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGF3ckNZRi9FelQxR2ZHc1BxeEp1UnpiVFAxQ1dKVjJxS3FCZTI2ZjJxcUNB?=
 =?utf-8?B?eTJFck9zZ0hnSTRPaW5Qajg2dkxINXNtaExha2JrUEszenNGYkVJaXFyWDF3?=
 =?utf-8?B?bGxHdE9QUXBYR2VlaEZqdjBoQ2NyT3hYTE0yYlNobzJpY0gzQVN5SWNIOEs1?=
 =?utf-8?B?U2EzQXI4S3lrWlJKMHJmT3lZbHBhd0RuN3dEQm5YaHJwUENpYW5HNWE5OGxN?=
 =?utf-8?B?M2VnclBLMjR2VFBpQ0M5SWNJNnlyMXNLWk5DTHJGcUwycmFKb29rNDJHQmU4?=
 =?utf-8?B?aFhTZE9JcCtQVFJPb0ZsS3VDaXN2Sks2ay9MOXM0NFFZalkzL0NBZnhVL3BS?=
 =?utf-8?B?c05IR0FtdXBLQWZRMWtxWWN6TkIvQ3dWc1dpRzFxeDEzamdhOVg3cVBSVThh?=
 =?utf-8?B?SW5YVFQrZ05oWEpnMFZDNGNkb3d6d3pEWVdWLzNtOHZJTTRxQkdyb1JLdFlt?=
 =?utf-8?B?cmRTSWpDSFc0RjhzYnJNZGs3T3Y3ZU1ieG1nRGpVdURNek9wdnFvcWs4cW5r?=
 =?utf-8?B?YWIxOVZkYUxCUjRwTFRvRGZDeWRUeFJ3ZUkrV2h4MXp3VHJlUUViKzhuYTJt?=
 =?utf-8?B?NXQvYUJSa1BYNEJkOExtdlUyeDNPV1BlSGZKakxHWGRMV2o4T3JSeGozbk9p?=
 =?utf-8?B?c3lZaG44NnRPbGNEVFdDRzBQaTZRb2MvMmVQV1BTOThrL2U4ZFUxL3pVSXls?=
 =?utf-8?B?bnBBNGdDeWZ3THowSXFFNTJEOS9XMEhPczRQT3V6ZEl1OHFzUDRIY3NVeWd2?=
 =?utf-8?B?NXdnOGExWnB4SDZ6L3VXWVF6RWR2Q0JlUzdSVUJBcXRPQ0JnTlllRW5FMkg5?=
 =?utf-8?B?QnRuODM5Sms2c1k1YVhsdGNrTlQ3Z2F4eVdyWGdja3F1MGJkUUwwOXpLRFhh?=
 =?utf-8?B?Y1V2amtNTzZRQStWL2FsYkhqSVB6SW9BVnpoeWJaMmFObVd1WTNQZDVDODhW?=
 =?utf-8?B?MWpPaUNRbHk1NmpZS2dna0dkaHBUS1M2VzZkSUVHS2dzUjhtbWF4bWFYRkUw?=
 =?utf-8?B?dWtJcUJGcGpQcnRqbSswZDY3dXBYTmRoNlJUWDlCWmFiWVhnZG9PZWZWRFMw?=
 =?utf-8?B?UzhxOTBHdVNvcm5CaG1hWnhPd3N4THN2N1crZ3N4QU9PU0pReUFZUTJlZWhN?=
 =?utf-8?B?QTFFNzk1ZUllYlM5UjY3MzNWWGVmeDZIeW84RXpDWCtlZ3NHcnF4YlJIZlgy?=
 =?utf-8?B?bHpiMEZvdzFTQi9JL2JoYjVUSzN3VUZMUVdKSkNGUVg1Rncrd3hHcWJ4amFv?=
 =?utf-8?B?SzZZazlFWEpvazZCS2pkUDFLaFIyVmlBbjNWbUJ2cHpDUTJhVEx5WjRUcDI0?=
 =?utf-8?B?RUNOY2lDVFc0WEg5NDJwdDE4d01mNW9ZVzZua2J6cGRzQ1lCTHl2c1VVbkpo?=
 =?utf-8?B?MzNkZis3ME9XYTR4R2Q0MDh5ZlVjQmpCSU1NM0l6eHJCT3JGQ1pBQ1NJS3A2?=
 =?utf-8?B?emZNNEN4YnpGZ1p6YThWbTArYWNYKzBYdDh2cEovZzFJR3JldHJMMERnV2R3?=
 =?utf-8?B?NVdtbFVJL1hRREF4L0Y5Y1NaOVZLZXRLaU04UkpKRFQxSS9oUjRPRXVpcDM0?=
 =?utf-8?B?bTA3TDh3eGUyTlRhNFNMWFFBejJpQ3ZBT1NMa0dtWGEweWpaWlEvTDFsR3dh?=
 =?utf-8?B?Q1p3Um5oWjF0eWZEUllkZ083S3IwZ0RPTHBqTTI2MUJMRGYvc2M5dGNnNTJS?=
 =?utf-8?B?SDNPeHArNHRidXNENHhRdldrQ1E3VGNNZHJ5YXd0WUNRWWx0dXJidTJuOHIr?=
 =?utf-8?B?VmE2bEhtbkhwVytSMXNBTFpDMGNOTkVCQldNWituZVdKeTNFQ2p5TEp4b1lw?=
 =?utf-8?B?U2w0NFVlSXB0K3FPaHdPNFFORDB3NUlnYXlBTTFmM0ZQQ3JtWllWOVJkTGdT?=
 =?utf-8?B?ZCtJRXo0NWRMdVVWeUxMQkJROGRQcVJyOU1wakY3T2l4WE55RXd3alJFZklh?=
 =?utf-8?B?R1pZRVBzb2pwcGxXbzZ1clRiZ0pUWjRXUkRpTnJVQThFOW1oWmpNYVhFcW1M?=
 =?utf-8?B?VGNJMlVSb3QzdVhPbjRlL3p5OElNcnpoZ0w4aUFrU2VZNVVGZEoyZlRtTnpQ?=
 =?utf-8?B?ajFpajZqRmQxSVRoUFdIaHE3Y1BNbzdBWHI1SnFneTVhODRIelV1WGdXd29s?=
 =?utf-8?Q?q9um99gK9fOOXXYDixzitWc8w?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0ed1d82-e24a-4914-4048-08db884c9d97
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 11:38:04.7415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hz7yuoBrYgrxyy/LwK9Se5JCRfKphQX4C1d5ryjilhxc321l+K/MIM+nxnnBOYZhdGzSl7L3okA0wBDQ2WuEng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8904

On 19.07.2023 12:39, Oleksii wrote:
> On Tue, 2023-07-18 at 17:03 +0200, Jan Beulich wrote:
>> On 17.07.2023 16:40, Oleksii Kurochko wrote:
>>> @@ -35,8 +41,10 @@ unsigned long __ro_after_init phys_offset;
>>>   *
>>>   * It might be needed one more page table in case when Xen load
>>> address
>>>   * isn't 2 MB aligned.
>>> + *
>>> + * CONFIG_PAGING_LEVELS page tables are needed for identity
>>> mapping.
>>>   */
>>> -#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) + 1)
>>> +#define PGTBL_INITIAL_COUNT (CONFIG_PAGING_LEVELS * 2 + 1)
>>
>> Where did the "- 1" go?
> My fault. Should be:
>   #define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS * 2  - 1) + 1)

Why? I'd have expected

#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) * 2 + 1)

Jan

