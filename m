Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F957CAAEA
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 16:03:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617631.960409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsOB9-0003ko-Jo; Mon, 16 Oct 2023 14:02:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617631.960409; Mon, 16 Oct 2023 14:02:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsOB9-0003gM-H2; Mon, 16 Oct 2023 14:02:43 +0000
Received: by outflank-mailman (input) for mailman id 617631;
 Mon, 16 Oct 2023 14:02:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsOB8-0003gC-Cs
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 14:02:42 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20613.outbound.protection.outlook.com
 [2a01:111:f400:7d00::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abcd2b83-6c2c-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 16:02:41 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBAPR04MB7221.eurprd04.prod.outlook.com (2603:10a6:10:1b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 14:02:39 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 14:02:39 +0000
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
X-Inumbo-ID: abcd2b83-6c2c-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EzrX1GKYqZ5y0+WR92jfcrMS586wb/gQjOjE3/XeSzTPIF2jFwbF2a0CGV/6ZbNpCVz1X8Hrf0NBzmUsr3cvz9XTopoWOdpNUs084ewWZ9CV232K+VE1Eos++ZqFn412SaNwD5NBEabhhv9JA5FEjc3SuDG773lsGUADlJu21bbOwFKtyqRO48/7tf6MhAbMdqVS4mkMd7Jb4WuqHQP7NloRb6pgOrPcJiu7eYrs4SQKu2B65hzWFjGlRIyScRBxvbUnblkl7vOacqasSO5LdIiC1OtfuTB6gGFPjV+zZ56rnvPJI+mxDFXs6X3WiJMs0CKJd2k8xadFbiYckpe3SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ob3x6BYtkaKEimNcNv5aYkwYIMpLciqwTLDrtdFc+I=;
 b=mNvp33hVKkD2K2uu2WwD/GgQIX4dsipkWoFsL4lRjyFSeiEpjzW6ePD/zLC7sobsfy5hDY57xoDdujN2MMhuprkvpS+4J6vzgpEsGmDZ+dbB1KXhztbuqxWnDVcZcwzuZ0A82Opi13UJhiy2+/+pXTrz8FaXW9tH7e6LW7GXhQHYfZIdX+sa32d/fqorFYF1E4VA73pLvSbgNvR7X23k6G5aN/VaO4vEyAHlSTJRlDgPvUTXQe6P7oB3Lgnx+rfi2WWl21ijjPSKAN3x7UiPAq1mF1prlrqCuYgt0YGJaBIKO76FL2Ru86gTdzusiA82ClS/A634XmGLyge90o3gqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ob3x6BYtkaKEimNcNv5aYkwYIMpLciqwTLDrtdFc+I=;
 b=Hw7SnSQKbATXoCZM+wUSmsJCMz8dEJ89/Hic9i99asXV52M841mL6naDdnolwqWACjiy52D+jOuIuDWIhhR0OMGKviApQlhUlQJwjgrjyxnwPgG4d6NG8cEl8HvUK9Els2dmfmAOdNqOUIAoSfwTUrXG+BZBvoE88lrtPKP2P8MofK4xwawQBP3SlNGnbQg4hmOkOsGyXPGP09LgIXq1JPeqGZZ1SqjJXwUuvkI6pXeIkHabg4X3BlrumzASreCEyf6NUr84MaOx3LAndsIU4hvAGCepOSDXn7tMw39RBPUyWTS1mzAlUcRpxH6lpcvcHDQx1hQPiqMWhNR4O9Ww8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e882704e-6c60-73a3-0e16-d87224a1a22a@suse.com>
Date: Mon, 16 Oct 2023 16:02:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH for-4.18 v5] xen/pdx: Make CONFIG_PDX_COMPRESSION a common
 Kconfig option
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Julien Grall <jgrall@amazon.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Henry Wang <Henry.Wang@arm.com>, George Dunlap
 <George.Dunlap@eu.citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>
References: <20231006144405.1078260-1-andrew.cooper3@citrix.com>
 <efc2b22e-6650-4c1f-b4cf-9971d4d08b49@xen.org>
 <ZSAnX3xjM91-tYbE@MacBookPdeRoger>
 <ed43fb9f-590a-fd39-ba87-b45acddd19a9@suse.com> <ZS09Q8DU-1_ATw1j@macbook>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZS09Q8DU-1_ATw1j@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0027.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBAPR04MB7221:EE_
X-MS-Office365-Filtering-Correlation-Id: 76ac9b3d-1f47-4552-4e5d-08dbce508e9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oPR/mE9fVYXb/pjxBVFAevMqFUky0LQyKiae276JTNkTe6eDwb0C29ZQrxjpsmefbfxqdNtjR3esB7iU74BYliP2OIvq7RY0L8HwjlOgQGClUWN9IVi8Z4QY8ajnXAq2bLQ2iwSraTMVWcBO28MzESfysBYImtGAb6Ix0KkQArPbLUnXTzReO819wDduXJ6XTSYepD/NVIKi831wdEc3Hg/SHJwxdV2IHh/MtttTioxksaJBHg15fB1OzCXyUYK4BHWEqXemr+yk1H7swWjOA9TE9v3sCuHYCyveF3zZsSIkE8WL6vbYk5JgUiN5uD6gQG2XBKr5i/N8t/xDA776Lhp4wIPGbWTZAn1C2/uosD2acsZXcD1WEYt+jgKkJlshtll+cWlgsW7HKwLQIbs5NvJDzZfOnxYmHr4fZDAEV7JcNBTcZpnHYcJflSu1SoO7+tn8YsISklsMZyzM978LI4AP4aLeNqEvuO1R6P39cRy1oTuQcg9hP+jBifCDGjelVyyximCfFJFQCxraLpO3lLaXy6WXfHksjMuG9WpTme939NKDfmmDJhH4KAQAN6lSqyIz4Bb6k92KVxTX/vXNQUBZH9NZ+mOHID866sNYVByM5T35tO+T5FxHuP1iNzJzhRRvql/DlDPNduQxs3mXRw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(396003)(39850400004)(136003)(346002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(26005)(2616005)(8676002)(8936002)(4326008)(5660300002)(38100700002)(83380400001)(31686004)(41300700001)(478600001)(31696002)(86362001)(6486002)(7416002)(2906002)(316002)(6666004)(6506007)(6512007)(53546011)(66946007)(36756003)(66556008)(66476007)(54906003)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0RJSUVvNDlrbUthTStkQWRhUllFcUUvUVdUclM5dHN6MUtMMnI0cHBXZVE5?=
 =?utf-8?B?SXQwazdVdkdFb1NWREVTVmdYVUo1SnY1UG92Y1lIQ3pwM2hSdHM1UFE0REFX?=
 =?utf-8?B?ekE0VDRVVGJCS0dLNDJRZ1lnTjZacWxnWFp2QW8yMmJMelNCdXJkN3NZZlN2?=
 =?utf-8?B?K2d5enR6NlFLL01WSU55Z2FSQlVHa0YwQWZVU3BHdWVPUzFVblBDL29vYW92?=
 =?utf-8?B?REd6YnQwV05HbmhFQ2dFM0tmZWZZejlUOUpoZHlxZEVEc3p6eDVZK2lTUzUy?=
 =?utf-8?B?ZW9NVGNBd1RQeTY4cGpvNUVYa1ZFeFFEN21iQ0l3UlRYUTh6SHJSYXZtOEp6?=
 =?utf-8?B?RS9NWU9KbVFWTWZSMHJTRjV4VWE3U1JWQ2F5OFpLcVdBUGFwQURTNnVVanVk?=
 =?utf-8?B?bVdhZzRmaUU5Q0pYRDhBSXU2bDFoNG1ST1ZXaFBEYVQzSzhubThIai9heXBm?=
 =?utf-8?B?L3BoUmVJNzRHMWNJYWVxTG9rUGJreHJmMkV5bER2WXNXekF6bHgyOC9kMzlF?=
 =?utf-8?B?QVFsNjhyUllEb29tMWhHY2ZBc0V2ZjJTOGVwRmJOUk5wb2NiTnEwZGdvT3RG?=
 =?utf-8?B?b3drM1h6ZTFGQ1l6VWxQdTVwQ0phaU9SMVc2YmI0RTVBUzVnY1RRNVczdTRO?=
 =?utf-8?B?VGRxc2Z2YXI5QWZkWEw0T2FpS3pwN1lISk5mVFQzOFlnMzZ4ZnlkNFJPU1Er?=
 =?utf-8?B?RlB0cUdoQ0hndlc3Rk9DYmljZlhFYlpCRFA2eWwwZFlPYkNtZW1QKzY4S2V1?=
 =?utf-8?B?T3RqWGZuSUJXSnFPRlpVbkJTRzcxVmhudzRkcDhiQVdvbjRNWElIT1FycXdy?=
 =?utf-8?B?WlNUU3huODhCOTB4b05RMDVrQVhpYlJ0ZlBYRjI1WXB5eXNMS0d1eGlMakFK?=
 =?utf-8?B?Szc5Q2NQM2lqR2lUek05UURpTFpRU1JRMGlDQkZtVkVmNGxXcHkzN2kzcHYv?=
 =?utf-8?B?MDJJaE9EMWcwdm0zLzM2dld3QnNvMW9OL0dYY0FnQTRja1VCZUJKMXQzUG8r?=
 =?utf-8?B?a2xEYXl3MldaZFMxTDAwcU1mNUVDOGFYTVgzcmxDZ0dSbTlMVGhYUzFWR3F6?=
 =?utf-8?B?bTRVYyszTXpaUWZxLzhRZTFEdS85Tk9jbXlFUmZNMXVxbHhuMWQzcWhoNGNX?=
 =?utf-8?B?RGVIZXJpUDR3ZUJnU0ZqbGdNRUxsSENCRFU4c0I3SnNud1dobVV5bG92aFd6?=
 =?utf-8?B?ZXhnclZsYU1iZ2tHRHREeHpGTFppM3hZTnkzbVlRMTB3QklaTlFHYkhKS2lV?=
 =?utf-8?B?THozbitJVzRxd203Q1hOZllGdzAvNE9HMk1HcHliQzFZS3lXNm44VVVuaFJj?=
 =?utf-8?B?c2R4dmFpVXdKVDMwMWpDVk1rMEpkeUZlVmNUaFUzT25XU2Z3VDQ4SHpEakpR?=
 =?utf-8?B?U1dMdWl1STcyMEZROVQ2aDNZaHVWbldWelpCMTNodHIxQlN6UnpyZUMvem9D?=
 =?utf-8?B?d2cvSndSa08rd242TmdsRlI3dGR2RXkxY1VZK3htaGFVTHNJSzRFRXRjYUx1?=
 =?utf-8?B?QU1Ua01NTm0xb3hXakF5Zm9QOXNyMWdnakFDUHIyRVVvU3A0YytQajR5MjNS?=
 =?utf-8?B?UFFtZjVhZXBsV3BJMllDQ0Vyd090YlpsTHNQMittczlialBSWDhsY3E2MXRU?=
 =?utf-8?B?MjltdlpIUHdjdzF1Y1lZVjl6UXB1WDc2ZWRaV2hwdmg2eDBGcTRXanhiRXA3?=
 =?utf-8?B?dFkyMUZYc0pqamMzUWRGRDdzLzBrK0ttZGk1b250NjVoVlRCL05NMXdoQVZr?=
 =?utf-8?B?aW1zRDVhb3RqNHRucWRhbjlvWXF3V1VlOXVQbWh5M3dRT254aHByRkQ4S1hn?=
 =?utf-8?B?ei9qSDZQTDEySjA3MklHZHAwRk9wWCs1bVk5SXA1OGpjaWJqeEl0NVEyTTVl?=
 =?utf-8?B?OXNiWVdJTFlFUUZmOGIzaDFCSDJTeU8vVmUxWTkrTkhuV1RxWFVCcDdQVUxK?=
 =?utf-8?B?a1phejhWWVd1ZDBDYXZxcVpOR0pYRnh2Tlo4S3N0QWFYOEx5WERHYmlVSHBy?=
 =?utf-8?B?S1ZTUjJYVmpFRVYyR0VUZVJpREROY01mUTdyWGxZZk1wMjQvekI1cUNqbUxo?=
 =?utf-8?B?QzRweForQURVMVZJcEpVb0k0aFhKRHFKT2l3RmFXTExhMno3cXovcytSVWNR?=
 =?utf-8?Q?YeBNPA+C1XPH4YBVDH/iwBahq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76ac9b3d-1f47-4552-4e5d-08dbce508e9d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 14:02:39.0586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0F+VyRJt/fSdW4HSM/nXV99FmowLzyVClUkEP1YZMCivH/VIszRkhw5vhp++Rm2is2AO7eey4Fa9kZlzMTkvcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7221

On 16.10.2023 15:40, Roger Pau Monné wrote:
> On Mon, Oct 16, 2023 at 03:19:22PM +0200, Jan Beulich wrote:
>> On 06.10.2023 17:27, Roger Pau Monné wrote:
>>> On Fri, Oct 06, 2023 at 04:09:19PM +0100, Julien Grall wrote:
>>>> On 06/10/2023 15:44, Andrew Cooper wrote:
>>>>> From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>>>>>
>>>>> Adds a new compile-time flag to allow disabling PDX compression and
>>>>> compiles out compression-related code/data. It also shorts the pdx<->pfn
>>>>> conversion macros and creates stubs for masking functions.
>>>>>
>>>>> While at it, removes the old arch-defined CONFIG_HAS_PDX flag.  Despite the
>>>>> illusion of choice, it was not optional.
>>>>>
>>>>> There are ARM and PPC platforms with sparse RAM banks - leave compression
>>>>> active by default there.  OTOH, there are no known production x86 systems with
>>>>> sparse RAM banks, so disable compression.  This decision can be revisited if
>>>>> such a platform comes along.
>>>>
>>>> (Process remarks rather than the code itself)
>>>>
>>>> Jan is away this week so I want to make sure this doesn't go in without him
>>>> having a say.
>>>>
>>>> While I don't particularly care about the approach taken for x86, Jan voiced
>>>> concerned with this approach and so far I didn't see any conclusion. If
>>>> there is any, then please point me to them.
>>>>
>>>> For the record, the objections from Jan are in [1]. If we want to ignore
>>>> them, then I think we need a vote. Possibly only from the x86 folks (?).
>>>
>>> I would be fine in leaving the option to be selected if we knew that
>>> such x86 systems might be feasible, but so far we have seen 0 x86
>>> systems with sparse RAM.  That said, I don't have a strong opinion, but
>>> the hiding on x86 seems fine to me.  Interested parties can always
>>> forcefully select the option, and a case can be made to make it
>>> available again on Kconfig.
>>
>> I find it odd to demand people to change source code for aspects like
>> this. The very least I'd expect is that BIGMEM configurations (which
>> I've never seen any production use of) can actually also engage PDX.
> 
> So we expect BIGMEM to have sparse RAM regions?  I would have expected
> systems with >16TB of RAM to still be contiguous.

Well, the system kind I did the original work for were sparse for the
purpose of allowing huge hotplug areas which would then be contiguous
with the non-hotplugged memory on the same nodes. That said, me
mentioning BIGMEM was merely yet another step in trying to find some
compromise with Andrew. As pointed out before I'd really expect that
finding compromises doesn't really mean only one side moves, yet here
and elsewhere I can't help getting the impression that this is what's
expected (of me).

Jan

