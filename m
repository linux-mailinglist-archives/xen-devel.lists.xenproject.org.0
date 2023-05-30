Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 573127163E6
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 16:24:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541202.843703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q40G3-00012R-Dk; Tue, 30 May 2023 14:23:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541202.843703; Tue, 30 May 2023 14:23:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q40G3-00010S-AP; Tue, 30 May 2023 14:23:31 +0000
Received: by outflank-mailman (input) for mailman id 541202;
 Tue, 30 May 2023 14:23:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8LP9=BT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q40G2-00010J-Bn
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 14:23:30 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2060d.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89b7d8b7-fef5-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 16:23:25 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8362.eurprd04.prod.outlook.com (2603:10a6:10:241::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 14:23:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 14:23:23 +0000
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
X-Inumbo-ID: 89b7d8b7-fef5-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mG13PowQrjIB3ZPLhcAQiFkrKgMWQZz3LwWBCtijeMxLYMByihSw1dlXbsSRumkKWOHBG5s9h5Y0gQEgUBHo806RfDMnHiM2ePNowkQqh1ud+GnAcSpmVAQIFFruF05K2jzgTarv2LHs44Z2azj0LeSx2DjAarZ7aE/8h8jcbfQgaHUkX0bhd6Jrhkb6sTb+0WuLhkVnCvJPlN01NFwAxqmcm/HOIbc9we9t1yTab8zZZJnTPCwhE0ZxaSPDqDIE6IFHcje57J8JG0n5Wv+FJl4RJw7QUfgID0nCq+vwM2kWKhScVCl2CSetgRr1fptpY9cncLN8tRWtRp/n4S318w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q/1Cks03xJjEHAGe4ku6/7jOBIrbgv0Gsyl3WkiQDQg=;
 b=F7UsFlT5EigGe2Deq6zCWdpFh9nEOasJIbRHTi0WlEHgEJQ9wS9Ra+ObdHX+8OR2L7Bq5f25RwlDntK8aqBh9jDuLKybvpw63dvRS711rBLNo1JvCOHRNissuhSw8BG4f2yv4trZ4abubpkayq85QF6tSErbtQwqNtmt5SSDizpRjCPui+IP+lh0rCZU4jqUcREsfpYs6VawkDJ/ltYlTXi6xZg7Zd/KGQAKzP5htl/d1ht1hUaWSkJNaOF8YBHaTM6EmPBXJNuh7UBfzSJZlSBIWIZOWt8ByGWqZtO3rPQ7lLMZSXeWfdXzb9O2WZAYPkSTxKYGLy8dWXrNWUpP7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q/1Cks03xJjEHAGe4ku6/7jOBIrbgv0Gsyl3WkiQDQg=;
 b=oh2IdJpQX9ch2CMRCCAkkQ1adMvPZMjheKc2XsMDfNoGHqOEtuSU0z8iJkaYNkwhc6b5XtD76dXclxhDmbjUHkYifr0HnNrvHib17vddtrfFUR538L7IVu1xhxqUnqx19IL4wnk20nI5XlNGmqin/7ZYvJvv0lbZXLuyXwX4Hm/O/8QXdDegmKzQyr2zQnJ3oz/ETWmbMqxTjJgNRSpLLkTMF+my4/XZlKSNsO6sWrf6SzSYjYaqIghlztDDvGH0MpPSLzbeE70sy4TOqCW+5QyenuNoHlyjssy45bjr+Q01isRjjjV7vucj3pAQ1c6qghwy8I1b/xwZLWfTJ+nCmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f87cf1cd-61ba-aaf1-dd81-f2352acf4273@suse.com>
Date: Tue, 30 May 2023 16:23:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/2] x86: annotate entry points with type and size
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <db10bc3d-962e-72a7-b53d-93a7ddd7f3ef@suse.com>
 <fd492a4a-11ba-b63a-daf4-99697db0db0e@suse.com>
 <ZHSp9+ouRrXFEY4R@Air-de-Roger>
 <bba057a2-0a68-bf05-9a92-59546b52c73c@suse.com>
 <ZHX4PR56MQZQCVUX@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZHX4PR56MQZQCVUX@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8362:EE_
X-MS-Office365-Filtering-Correlation-Id: b97d9fb5-9b32-4250-e350-08db61196cf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d1UrnbFzH2wy9KzxlwJM11RqAMEUiViFalabeT9ujtzE1f/zU7yeWurhNSzvpCPL+WGWkNDrPkZDcdkcZb7JTOZfqZTP6VRGTUtJBsXG16/Gi73MClaY5g8X1x+MBrHT8/9II+iY1IbRorm6HKsFv2cQl96YU3oWP1PenMW65p14kU5j3o6zZ5vE74eRpAugrxx54+TRpEKOkDh6MyPVx/aUZ+4VVZNC8O5ZQg3Ypw2gRvrw9AT1M4K53U4EBcWV3NjwXcFel7EjHUgACBrDDv2YRF84iyHs85fNaFliY/jb842rVM/1Bv5wMfgDb/5H4F1XEFGg8cpqWVJlA5a0fQ74ZRM33XwZNZwMe+KZOqg/1DHkY0RJsN5l5C/pB+73NOmvwiQCFyA6j4bMZrCt8qhMX33FzOCzDnIqrLUWEO/jk9jcl2JVbIQrpayXmY0roJiaumpjTjINXvTVLbPES3zI0gkdt5u4jx6nbiwPvtUegX4ENcj9+cz6Pe6nLV1M0UrPWiMMT2BCNzZeM+jkyNrLT6HzCbr2qZN4//1oz3xrDSInMGmnD0bzBCCzSlXuDvBbozVGPbzT2y0E6KaRL4ZeFgWaFRHvHWE5y0W0zBtg5a3h2rbPSPL6dcUYEapGRJRpx7Nsu3+WgbfRpAvd4g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(366004)(376002)(346002)(39860400002)(451199021)(31696002)(6486002)(86362001)(41300700001)(478600001)(6916009)(4326008)(316002)(66476007)(66556008)(66946007)(36756003)(7416002)(5660300002)(186003)(2906002)(53546011)(6506007)(6512007)(31686004)(2616005)(83380400001)(26005)(66899021)(8936002)(8676002)(54906003)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b29tc1YyR2NJa1BYMENPeFZLbHRoR3IxL2dxZG9JV2RIa29vMW0xRUtUditp?=
 =?utf-8?B?OU5OTThXdjZuTlhzVndrUjdsR2RhYlR2NE95eFdkMnEyeUlveEtvSzFZbi9i?=
 =?utf-8?B?T2loODNZRkhkN1ptMmxyZ3lZbzNVNTd2R3JuS3ptQ01qMzlkVDJNOE1oMito?=
 =?utf-8?B?a0tHb0xVY1Y3N214ZHVYbVJqTmdXaXNESDRBUDFUVytmTVFMREdFdmV2NklL?=
 =?utf-8?B?T0RLSkgrMC9HaCtQMzFXa3RmWTVqWExDaUFsZ0E4RTFSRWZFc0VrYUhETWNI?=
 =?utf-8?B?R3lEcFFTbDVWcFBMWDlJVDBRVXliZDRJb2lIZkxSdEU4aVkvVi80dXFCS3Nl?=
 =?utf-8?B?WjBtQXdDNFFZclJpaWlOVXdQa1FKZDhicTdJMmRhbm5YdWwvdnVKY3FBQ0NH?=
 =?utf-8?B?MElGQllSNkR3MDBUcXMzRDBDelBnYWgzZW9XcTZaNHhCMXNCaDNhdkgwcFhJ?=
 =?utf-8?B?M0dPbTR4cjlNdmtTRElQc1V4bzhwL2tQM2hIWEttclRGc3B0TWtkRnZIT3Bn?=
 =?utf-8?B?ZzIvNTBjSC8yakVNMFBnMDRpdTJrVzJlV2NlOHFnQTBpaWZqUUIyWDQwZHFo?=
 =?utf-8?B?Mlk1QUIzUC8xNkU4amZvSm5TcXJVODhhakdkdHBPYUplTGdPOW1nRkdDUTFp?=
 =?utf-8?B?UUVCdXNsVlJRZlVvYWgxMnpteEtMSXVKS1pvOXJmc2o3WU5uRi9mZC9pV2xH?=
 =?utf-8?B?dktRalI4d0pOb1B5TnFvYmhWNGJIMWV5VFVmU2FSSXhURlhjUEF0QW0wajIv?=
 =?utf-8?B?WlNqcm9qelc3UWw2c1JDVzdPZHl5RDdEVUphdThCbFdhOXc4Z1BUTURVaUxr?=
 =?utf-8?B?Vk42QXdsbktFbG5TWkF6ell0dk04QldVQVFTaE00WmpBWDJUWnZHK25iRjlJ?=
 =?utf-8?B?RzZVS1I0cy9nSXhXQ0lWRGRTWU9EWjVrNmxuY1VLT0JZUmVlVTJmcmpwYjQy?=
 =?utf-8?B?UEdCbzhaQnNqZzhBTU0rZDZ4OGcwWm5LcGR4N2ZndE5Dd1kvY01iMWxsUCtN?=
 =?utf-8?B?NjczWHJRUVRGQ1I0bk16L21VNk53SGFXWWhHTFlrQVhsNmM3bkI3ZElIUGVR?=
 =?utf-8?B?MlBmWGVDR081VHd0N2tsSEM0OU1NVUpDMDJvN0o4QXNQdVJvQnQvN21hZHpD?=
 =?utf-8?B?Z2hOQnVvL2E0WWQ5SlUwVlBnMkpYWDRWdVBsQU12SkJtMTJ0N080N3A1cG1T?=
 =?utf-8?B?ZWdscHVxQUtmRzVybk1DNkl0MjB3UVRsWlJZOGc5QW5MWTNvejJkdU9BYXR3?=
 =?utf-8?B?c0ZGK3czN2djQ1BoS0JYUUJ0S0FYaEJsakkxYmQzamhCc3hRcGVZUGhxMWJI?=
 =?utf-8?B?Z016cjhhUTlQcit1b2xVc0dJZDRmMjlqMW9zUHB6ZENXZ2hxNkZDWVIydEcz?=
 =?utf-8?B?SldXbVZSalpzbHBVTUVkMldERStxQmI4aWZjWWd0dGpWZ2xRbVpVNVlobWlU?=
 =?utf-8?B?TnBodGVSbzdkM1RYMmpVQnZFZFVCWDlURTE4T0Y5K1J5dDJ4YS9ZNURaemZj?=
 =?utf-8?B?K0lkTG00Kzc4RnFPTEZidFE2bmFxOWJ0aGN6U3psL3IxQ0prS2s0ZkNmdXVw?=
 =?utf-8?B?Z2JiT3lNZjc4b1RJSUhJVEdIOU9QUnMzTTNGMnB4VUtwZlVHSUtSUGNTMXg2?=
 =?utf-8?B?Vjg1WjBKREE4dit5TVRmbk55UlVXcnloTzB2UElIT1gxNks4cWtzOHFXb3lC?=
 =?utf-8?B?cGVVNU0yNHAzR1hCTE5GOHkzM2x6RExyazlHOTlsQmlJZU5wZnVILzlQYS80?=
 =?utf-8?B?NUg3NHNRVDdDMW13TTdqQnBHREJHaGRTYlNBOWpUUUt2aTJ1QlQ5WldjNUdl?=
 =?utf-8?B?YzZVVXRRKzE5QTRRdDEvWHRPb3pDN1VuUzNmMWkrQVZ6eXdEdUxCcEdFcEtE?=
 =?utf-8?B?TkIvenJQZlFOcWJZSE95cXdDUTk1VDMvUWpzQkxaREplNUJwaEViN1JGR3N5?=
 =?utf-8?B?NEx3Q2RHNllpZkRBb3JoUURQNmNQUWFGNSsxVHI4TzVsb0VEMVFkOFRtWWZD?=
 =?utf-8?B?aGFOK2IrTHFubklQVWZCSXE0NGhxNUJoVVI0ZFFzSDk1V2NJNzhCWUw2UUlF?=
 =?utf-8?B?aGlLdDBZZVZaNG43SVgzODdtaVdzWkhPZlBEb0hsSk1ta096cEVwNDE2MFZ4?=
 =?utf-8?Q?P8lfE7H1qQeTmpK66BcuxS28Z?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b97d9fb5-9b32-4250-e350-08db61196cf8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 14:23:23.4991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MELE1O/IIBm5XqHz6eI8f6SMW3AJIO0arHQrrSAQCvEPQ3slvUPsM8M/emHqA+NVme5hpNwXGjbTA1Gu8AUqBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8362

On 30.05.2023 15:21, Roger Pau Monné wrote:
> On Tue, May 30, 2023 at 10:06:27AM +0200, Jan Beulich wrote:
>> On 29.05.2023 15:34, Roger Pau Monné wrote:
>>> On Tue, May 23, 2023 at 01:30:51PM +0200, Jan Beulich wrote:
>>>> Note that the FB-label in autogen_stubs() cannot be converted just yet:
>>>> Such labels cannot be used with .type. We could further diverge from
>>>> Linux'es model and avoid setting STT_NOTYPE explicitly (that's the type
>>>> labels get by default anyway).
>>>>
>>>> Note that we can't use ALIGN() (in place of SYM_ALIGN()) as long as we
>>>> still have ALIGN.
>>>
>>> FWIW, as I'm looking into using the newly added macros in order to add
>>> annotations suitable for live-patching, I would need to switch some of
>>> the LABEL usages into it's own functions, as it's not possible to
>>> livepatch a function that has labels jumped into from code paths
>>> outside of the function.
>>
>> Hmm, I'm not sure what the best way is to overcome that restriction. I'm
>> not convinced we want to arbitrarily name things "functions".
> 
> Any external entry point in the middle of a function-like block will
> prevent it from being live patched.

Is there actually any particular reason for this restriction? As long
as old and new code has the same external entry points, redirecting
all old ones to their new counterparts would seem feasible.

> If you want I can try to do a pass on top of your patch and see how
> that would end up looking.  I'm attempting to think about other
> solutions, but every other solution seems quite horrible.

Right, but splitting functions into piecemeal fragments isn't going
to be very nice either.

>>>> --- a/xen/arch/x86/include/asm/asm_defns.h
>>>> +++ b/xen/arch/x86/include/asm/asm_defns.h
>>>> @@ -81,6 +81,45 @@ register unsigned long current_stack_poi
>>>>  
>>>>  #ifdef __ASSEMBLY__
>>>>  
>>>> +#define SYM_ALIGN(algn...) .balign algn
>>>> +
>>>> +#define SYM_L_GLOBAL(name) .globl name
>>>> +#define SYM_L_WEAK(name)   .weak name
>>>
>>> Won't this better be added when required?  I can't spot any weak
>>> symbols in assembly ATM, and you don't introduce any _WEAK macro
>>> variants below.
>>
>> Well, Andrew specifically mentioned to desire to also have Linux'es
>> support for weak symbols. Hence I decided to add it here despite
>> (for now) being unused). I can certainly drop that again, but in
>> particular if we wanted to use the scheme globally, I think we may
>> want to make it "complete".
> 
> OK, as long as we know it's unused.

I've added a sentence to this effect to the description.

>>>> +#define SYM_L_LOCAL(name)  /* nothing */
>>>> +
>>>> +#define SYM_T_FUNC         STT_FUNC
>>>> +#define SYM_T_DATA         STT_OBJECT
>>>> +#define SYM_T_NONE         STT_NOTYPE
>>>> +
>>>> +#define SYM(name, typ, linkage, algn...)          \
>>>> +        .type name, SYM_T_ ## typ;                \
>>>> +        SYM_L_ ## linkage(name);                  \
>>>> +        SYM_ALIGN(algn);                          \
>>>> +        name:
>>>> +
>>>> +#define END(name) .size name, . - name
>>>> +
>>>> +#define ARG1_(x, y...) (x)
>>>> +#define ARG2_(x, y...) ARG1_(y)
>>>> +
>>>> +#define LAST__(nr) ARG ## nr ## _
>>>> +#define LAST_(nr)  LAST__(nr)
>>>> +#define LAST(x, y...) LAST_(count_args(x, ## y))(x, ## y)
>>>
>>> I find LAST not very descriptive, won't it better be named OPTIONAL()
>>> or similar? (and maybe placed in lib.h?)
>>
>> I don't think OPTIONAL describes the purpose. I truly mean "last" here.
>> As to placing in lib.h - perhaps, but then we may want to have forms
>> with more than 2 arguments right away (and it would be a little unclear
>> how far up to go).
> 
> Hm, I would be fine with adding that version with just 2 arguments, as
> it's better to have the helper in a generic place IMO.

I'll think about this some more.

>>>> +
>>>> +#define FUNC(name, algn...) \
>>>> +        SYM(name, FUNC, GLOBAL, LAST(16, ## algn), 0x90)
>>>
>>> A rant, should the alignment of functions use a different padding?
>>> (ie: ret or ud2?) In order to prevent stray jumps falling in the
>>> padding and fall trough into the next function.  That would also
>>> prevent the implicit fall trough used in some places.
>>
>> Yes, but that's a separate topic (for which iirc patches are pending
>> as well, just of course not integrated with the work here. There's
>> the slight risk of overlooking some "fall-through" case ...
> 
> Oh, OK, wasn't aware patches are floating for this already, just came
> across it while reviewing.

Well, those don't cover padding yet, but they deal with straight-line
speculation past RET or JMP.

>>>>          sti
>>>>          call  do_softirq
>>>>          jmp   compat_test_all_events
>>>>  
>>>> -        ALIGN
>>>>  /* %rbx: struct vcpu, %rdx: struct trap_bounce */
>>>> -.Lcompat_process_trapbounce:
>>>> +LABEL_LOCAL(.Lcompat_process_trapbounce)
>>>
>>> It's my understanding that here the '.L' prefix is pointless, since
>>> LABEL_LOCAL() will forcefully create a symbol for the label due to the
>>> usage of .type?
>>
>> I don't think .type has this effect. There's certainly no such label in
>> the symbol table of the object file I have as a result.
> 
> I was expecting .type to force the creation of a symbol, so the '.L'
> prefix does prevent the symbol from being created even if .type is
> specified.
> 
> Shouldn't the assembler complain that we are attempting to set a type
> for a not present symbol?

But .L symbols are still normal symbols to gas, just that it knows to not
emit them to the symbol table (unless there's a need, e.g. through a use
in a relocation that cannot be expressed as section-relative one). It
could flag the pointless use, but then it may get this wrong if in the
end the symbol does need emitting.

Jan

