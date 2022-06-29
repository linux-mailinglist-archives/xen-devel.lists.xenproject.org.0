Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A625602BD
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 16:31:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357906.586780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Yj4-0005E4-9J; Wed, 29 Jun 2022 14:31:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357906.586780; Wed, 29 Jun 2022 14:31:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Yj4-0005BT-5N; Wed, 29 Jun 2022 14:31:30 +0000
Received: by outflank-mailman (input) for mailman id 357906;
 Wed, 29 Jun 2022 14:31:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NFaf=XE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o6Yj2-0005BN-SL
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 14:31:28 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2052.outbound.protection.outlook.com [40.107.22.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2913f59f-f7b8-11ec-b725-ed86ccbb4733;
 Wed, 29 Jun 2022 16:31:27 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB5075.eurprd04.prod.outlook.com (2603:10a6:208:bf::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 29 Jun
 2022 14:31:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.014; Wed, 29 Jun 2022
 14:31:25 +0000
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
X-Inumbo-ID: 2913f59f-f7b8-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UpJpYzzLcZY6WzQSTxFcNqvtcCX2o2HxDzm48jJfhg+f5QdODD8XxbNgvtev4U0uRDaz7/12/xP7gTDrF1yqxz+EudedPlS+UtGDx9jHELQseqy56xC7Oe8P89QSMVcY43T/4TSIBwcoSAU6d7XH9KXYDY19TPXsFFSUsZdLULPXd+J1PD8jZI+v4nb/ej/uNB32pdkfr+46Bl4wrJijGJ/GY93KLEd4ReEQMT69yLUl0nCQPb4hsyVSzP1W+EGNvpFNYKWIBuWFGEBQQk/i8mqyG2siLogcEyXUBMB9d6Kj/qrQoUiZnhwv5m9Js5tRJRIyQyu5YYtrIXe3mMw2fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8MOtbfpUTGhtY80aLDTBGrhyMDKP1+UNoByz/7bLFKE=;
 b=Lf+vDvhXQswHPnKHzHnXusMlHiSzUoqlszR1HV3Eqisn4WeNy+JNL5oFnlBwzq++JlBv5ZFm/j+ZjkSOa0ntWwUYOa5SUcW94HlNWQABGNgD65ElaKi9M1IVzma1oJ4URjwGJEWYUy1eXlO+cNva5SSW1G4sO6xGSi0j8XetQsboDu4swQdWEqLvS4s9Rjr+/NzLlbRUsoqm7o1nqxwfFilda5dJ0xxJHk097uCSSDUdBn1IlfZO5JC+ygQQZ5YmOJ3qVXjIawdaYhCQZFyyhNCv1W72icnMYgJxNBIGwOC7rIhmiS5fFLspfrzPhyG2K3vJsBD3hTg3gGYd7yN1Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8MOtbfpUTGhtY80aLDTBGrhyMDKP1+UNoByz/7bLFKE=;
 b=lOePXD3oBjywNbgBKQ8ldCdEe9gRI8EdyHbryt4jmM8pv4lImwadf8JYF+ITZeB7o/frSrTYg9cHge8rEnPNngaN3Fgl+kn5Bf63FEpri8KLZ+V3hTsiyv6jVLQ1gU0ON22C2DnH15+LWT4cmiZ9iWk+rfDRxr2UK2EYrF5H39Giv0zaCsVKH4c+3v/547e2rBEuM0iamxk7PDnjxZWXxD6CVwAJ2fuqn7nH/UqVAjsj8wlQX58u1jGhuFa27LC4x6y0cO1KrHwW/cCZ42mL/E/nD4MSQg6YH/bxFt0ri2jxeyRY7W6drm3GG4PKFevW1jnGivZHBh3iw7bayoF96g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <48eac477-43a3-fd1b-f019-a8e3e239602d@suse.com>
Date: Wed, 29 Jun 2022 16:31:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v10 0/2] xen: Report and use hardware APIC virtualization
 capabilities
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Jane Malalane <jane.malalane@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220413112111.30675-1-jane.malalane@citrix.com>
 <e16b3b4b-45f3-a520-0360-c1d59602469b@suse.com>
 <Yrwste7T5DSeazjh@perard.uk.xensource.com>
 <3bb4c5d4-325a-d14f-038b-7206b3b6b29f@suse.com>
In-Reply-To: <3bb4c5d4-325a-d14f-038b-7206b3b6b29f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P189CA0060.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:458::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d4b130b-6812-491c-76c0-08da59dc0be0
X-MS-TrafficTypeDiagnostic: AM0PR04MB5075:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cX2gJSsdmmnpLy2ZmTYuukNaBK/fv/XLBCRdAuqNxE/aAVsGHwqlGOwNKl69O1rOGytJonG2Xknhn/Zh7e83dG05wJ/DwbcgpcSA7H+6lVIbzYOI8IvlSRh/PBfvYC54AIt0AElhk/uuqHU89WPPbvgjizHSXrYVafnmvcJSFY+NIYaLPtvnltfjvEG4mijZiGokF5E3j7OUEEUCNMUjhFBqQGNKrnali2FAL9Afy4YKEzBdyLrv7GFHxvEFcvPGT3J1MZOPqgmw4QJmhjX5Yyi/sW0csrEzY3iRYMVfttHv54hymZEwoBKE1B9H8u44TL9AAqcq/AICe6vvePXySBHRXZJD0e184swc8WhRc+6CNrFOIjSSk64uxF2jOHmt0TJePnSLIBcay9+3AOe3uA1gsLGibulKB5KuW69ECt6eQpMlbcZ3+h7ViOoCKSn+OQK8D5zaitLXWWLKR1xCX9bzX3y3/4ABwKjbwKtnwkSIxU1CINPlHhuPH25IRF19NXzdIGFXpqcmwpk9lcNHZOv+C0pshTilv3ekSAhnlhX8SGD2UD9oa3EJQhN52/EaHOXdmp1z9BgkNTebFU/y/cTbcRIHgRI8m7Nv5WnEd1UkJq4ZDreFePc6MWQIYwNrinqzdT/THgwobapkCwZN6fcq2n4KSbwXffRdDbM4VmlhSW2+AeJAZTDnuqD9kUenwJ1yVgm4Ids7OJTkXKB/ORIadiGXc/c1X+sNXyObnFe6buF1JYgGG3OwyX32lerXKFrVoYsIcegqzwc2980sr04tEtGy0wK1xAWzkfhAegamufoy/znMYOiQznYdDSpj4rLT1EKVu9kvidv3vvvBzw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(366004)(396003)(39860400002)(136003)(66476007)(26005)(4326008)(31686004)(8676002)(66946007)(66556008)(36756003)(6916009)(54906003)(38100700002)(83380400001)(6512007)(316002)(41300700001)(8936002)(5660300002)(186003)(2616005)(6486002)(2906002)(6506007)(53546011)(86362001)(478600001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzVVT0U2Snk1NGs3V3pMRlM4dUdyaVpvNUxaeVZLRXAxK2N5LzBXcGFmLy93?=
 =?utf-8?B?ZGNJRzF2Y0d0YTBKMDlVWDJLWHo5MHg2eHpNMFJsYktwNlBlNnpSM0NZRjhE?=
 =?utf-8?B?SjUySjRiRGlEZXNIVkdXdmFRRkNLWXY5Y2FubmtuanIxZzd5cXRyVFVacmhG?=
 =?utf-8?B?NGhRS1RXb2VyR3hJWmpFRUZIdU9CNE1XY3FxVkJxamdOS1M3YWplTzhzdlJY?=
 =?utf-8?B?NUV5Y1FNOXZLYjZKU2xudnVVbEFnMDBXWW1NZ1JpNzQ0c05kVlJMUG1JV0ZH?=
 =?utf-8?B?dG0yeGZaeXBqSjNwYUZ4Mk1wdlltQm9Ja3BSMXd5R3Jmc3QyUFQxdFUrZld3?=
 =?utf-8?B?VlRIYlJOSEQ1YjMzL2FJN2k2a1haMlMxT3d0U3VIR3JyYmxPaHNrRU1oR2lp?=
 =?utf-8?B?Z0pjQUY4a2JGR05ETXl4SUdvdytBcGkwbG8vMW5BOU1QOG1NVkxPSVpySFBR?=
 =?utf-8?B?QlhCUU9lenNvN1lIMlhmZHAwTmVSZ3czQ2dFWDRNQ0NCUG1DQkMwZ3MyS3VM?=
 =?utf-8?B?NXQ2MVNsR0R1eVNoRDZqc05nL0hJeVNCazllUlJmZzE0K3ArbVg5aHh3R3lQ?=
 =?utf-8?B?azVWSHkyWTBSKzY0OWUyaEYxeFNLRXJPRlpROHFGbTN4RTg1Sm9iVkM0L3d3?=
 =?utf-8?B?cjdkWTIrTUdndTM3L3dWT0tLaGNaeGVTcml4WDJVMkMwa04wMnRtSGg5OVRj?=
 =?utf-8?B?VldBdUNLc1FJdnpBUUo0UzlxeFhlOE9YcHNmbTBHd25MaXg5cmtPd0N3QTU3?=
 =?utf-8?B?M2RhZjRZZ3hSQ2JlV2ZMMkpTOG9zalpjR3N6a0d1QzdnQkE3U08rUHQyN1pB?=
 =?utf-8?B?bWNGcngycVhCNUliWUcyMndGRFBrbUFsdk5xQUZUa1NZNHpsQVNyRENMWFJW?=
 =?utf-8?B?a1lZOWhkVmh0cTlJUFEyQzhZL2dOU0kvbXZaQnlBM25xWDdBZjRCbldzRlJD?=
 =?utf-8?B?amJIUHlieU9nV2lmRGpJQmZOMEZXVEd6MnhRa2FNMVA2TmpDOEFHRU83WU1r?=
 =?utf-8?B?QVhQb2d1bisweGFvWHZ0Rm5MSlFLUjNoSW1WWGhwd1BWaUJtazFTMFFtNHh6?=
 =?utf-8?B?RVo5UlZRT0ZjT2lXSm9tZW13L2QwbFA4bk9Qa0pPQ3JDdm42UElIWjZlUGU2?=
 =?utf-8?B?VHgzdk9vOHVFMnFXamMxNFl6N1k5dUp2cTRuZnBtZG1zcVpLSUJyVWtiYXdO?=
 =?utf-8?B?NTBhdFFSUFN5Y080Vll4c29jV2dsaFVzSWlySzdOd2JJYkM3bCtrUENZNENT?=
 =?utf-8?B?NkRQVE5jSUhhaDh6bVFTdVJqd3NOYzRvdTFSaW5leUM2dk8yUUoxRzBLNGJF?=
 =?utf-8?B?dy9Eb1V4ZENpV0sxUTZEQUkwM2MwYlJJWjBHSldEV2cyZkxXMW5BYi9YbXdm?=
 =?utf-8?B?M2trYjRxdmZNcWx2SVNJSDgxUWxYMmdKWnp2V3lYUitvK1NLZ1pLRWpOU0J5?=
 =?utf-8?B?bWlGb1RhM2Y2STBqUnNPbkJRaXphR2RPanBNbFp2M1RJcjAxdjhTY0lHZ1c4?=
 =?utf-8?B?bWVJVmN1cnZSOWRpNzdOdDVra2c3c3pWY1p4N0RqZ2NrVUtVbEZBSTE5V0tM?=
 =?utf-8?B?aElTOUIrRXFqbVFRSVRVNlZneDM1NGxCZ0w4V1pia3UweCs5MlEwMkxmMXJH?=
 =?utf-8?B?aytSVitmWUd6VHFqbTFOV2pNYitvSUd4MzBZa2h2ZEoyaktQb0x1L1lPSStm?=
 =?utf-8?B?MFhFYjQ2c0Fjb0RBNDFjcGc0QXk3dHNQNEdjRW12c1VmVjNPUWRZa1puV3Fj?=
 =?utf-8?B?aFdaTko4Y3kxKzFTK0ZQQmlGUURjcUJ6NXFJWkpyekR6ek1YMW9xNW9zSEtI?=
 =?utf-8?B?SE1JTjBSOGVTVDdHcU5tSjRZUjJaMjFvc1IxbHAvc0ZZTWtoVy9YekhSbTk1?=
 =?utf-8?B?elJmRzNJcFZRY2NnbWtOSHBJdzZBekVNZER4V3d4ekI2bGNoOUhUdXZEMEJm?=
 =?utf-8?B?RXZqNFc4dnIrSGdDOTlWMkFYY1lYZkY2cmNWZUZqUVlsRzBCNUlZUjE3Mk8w?=
 =?utf-8?B?TTlJUENrdDVUbmxPbjBjSDJuTXpIZG1CcWRIVXQ2eDE4bmp2a24wekVqc1Vw?=
 =?utf-8?B?ZlpPS0E2cXFtYTZUUGVWUWRNcnBTOFMzTnorQmgxM2pDZTQzeUVJSWtsNGlz?=
 =?utf-8?Q?R8GLdIdPB6akyP28mZHS3NLfh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d4b130b-6812-491c-76c0-08da59dc0be0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 14:31:25.4533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1t7YLydCRX6U0iylE34ANYL60fjy2amWjkyW+kWhPeiXzQfq7WMBNc+xXF2OEsUlFfnrnhL+B/xBFXjc0FX1LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5075

On 29.06.2022 13:09, Jan Beulich wrote:
> On 29.06.2022 12:43, Anthony PERARD wrote:
>> On Thu, Jun 23, 2022 at 09:23:27AM +0200, Jan Beulich wrote:
>>> On 13.04.2022 13:21, Jane Malalane wrote:
>>>> Jane Malalane (2):
>>>>   xen+tools: Report Interrupt Controller Virtualization capabilities on
>>>>     x86
>>>>   x86/xen: Allow per-domain usage of hardware virtualized APIC
>>>>
>>>>  docs/man/xl.cfg.5.pod.in              | 15 ++++++++++++++
>>>>  docs/man/xl.conf.5.pod.in             | 12 +++++++++++
>>>>  tools/golang/xenlight/helpers.gen.go  | 16 ++++++++++++++
>>>>  tools/golang/xenlight/types.gen.go    |  4 ++++
>>>>  tools/include/libxl.h                 | 14 +++++++++++++
>>>>  tools/libs/light/libxl.c              |  3 +++
>>>>  tools/libs/light/libxl_arch.h         |  9 ++++++--
>>>>  tools/libs/light/libxl_arm.c          | 14 ++++++++++---
>>>>  tools/libs/light/libxl_create.c       | 22 ++++++++++++--------
>>>>  tools/libs/light/libxl_types.idl      |  4 ++++
>>>>  tools/libs/light/libxl_x86.c          | 39 +++++++++++++++++++++++++++++++++--
>>>>  tools/ocaml/libs/xc/xenctrl.ml        |  7 +++++++
>>>>  tools/ocaml/libs/xc/xenctrl.mli       |  7 +++++++
>>>>  tools/ocaml/libs/xc/xenctrl_stubs.c   | 17 ++++++++++++---
>>>>  tools/xl/xl.c                         |  8 +++++++
>>>>  tools/xl/xl.h                         |  2 ++
>>>>  tools/xl/xl_info.c                    |  6 ++++--
>>>>  tools/xl/xl_parse.c                   | 19 +++++++++++++++++
>>>>  xen/arch/x86/domain.c                 | 29 +++++++++++++++++++++++++-
>>>>  xen/arch/x86/hvm/hvm.c                |  3 +++
>>>>  xen/arch/x86/hvm/vmx/vmcs.c           | 11 ++++++++++
>>>>  xen/arch/x86/hvm/vmx/vmx.c            | 13 ++++--------
>>>>  xen/arch/x86/include/asm/hvm/domain.h |  6 ++++++
>>>>  xen/arch/x86/include/asm/hvm/hvm.h    | 10 +++++++++
>>>>  xen/arch/x86/sysctl.c                 |  4 ++++
>>>>  xen/arch/x86/traps.c                  |  5 +++--
>>>>  xen/include/public/arch-x86/xen.h     |  5 +++++
>>>>  xen/include/public/sysctl.h           | 11 +++++++++-
>>>>  28 files changed, 281 insertions(+), 34 deletions(-)
>>>>
>>>
>>> Just FYI: It's been over two months that v10 has been pending. There
>>> are still missing acks. You may want to ping the respective maintainers
>>> for this to make progress.
>>
>> Are you looking for a ack for the "docs/man" changes? If so, I guess
>> I'll have to make it more explicit next time that a review for "tools"
>> also mean review of the changes in their respective man pages.
> 
> No, the docs changes (being clearly tools docs) are fine.
> 
>> Or are you looking for a ack for the "golang" changes? Those changes are
>> automatically generated by a tool already in our repository.
> 
> Indeed it's Go (where I think an ack is still required, no matter
> if the changes are generated ones [which I wasn't even aware of, I
> have to confess]) and ...
> 
>> Or is it an "ocaml" ack for the first patch? Unfortunately, the
>> maintainers haven't been CCed, I guess that could be an issue.
> 
> ... OCaml which I was after.

Oh and actually for at least patch 2 also VMX. For patch 1 I've sent a
separate reply to the resent v10.

Jan

