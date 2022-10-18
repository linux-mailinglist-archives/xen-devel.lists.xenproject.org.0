Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 141E1603056
	for <lists+xen-devel@lfdr.de>; Tue, 18 Oct 2022 17:57:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425299.673025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okoy1-0003CG-Ge; Tue, 18 Oct 2022 15:57:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425299.673025; Tue, 18 Oct 2022 15:57:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okoy1-00038w-DG; Tue, 18 Oct 2022 15:57:21 +0000
Received: by outflank-mailman (input) for mailman id 425299;
 Tue, 18 Oct 2022 15:57:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+2Ad=2T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1okoy0-00038q-Td
 for xen-devel@lists.xenproject.org; Tue, 18 Oct 2022 15:57:20 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140048.outbound.protection.outlook.com [40.107.14.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8baa5ad2-4efd-11ed-8fd0-01056ac49cbb;
 Tue, 18 Oct 2022 17:57:20 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8235.eurprd04.prod.outlook.com (2603:10a6:10:243::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Tue, 18 Oct
 2022 15:57:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.033; Tue, 18 Oct 2022
 15:57:16 +0000
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
X-Inumbo-ID: 8baa5ad2-4efd-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYd4GC5CrXyBB8HosyBzneKFaMoIMaYqwg2fkL7hYsS5AAByDXSL0DmeCK2weHP9S9Ta8U5AkdkaFZU07XNwXWdcR/feZcKJgJgXutdD3y1+sixyB2DsWrTmqCi8fdDb9AZRdUfBNH7M6Mdm8mivsGMIzpvDtfqZEFW1S0aej09zk0GqTDRm5VSMe7cVkgYCe1FuqZKZKdmXHm2Oz/at2i3wH/IguQj6dfS0VfPJTgMqdWygcMMAjtMAwNbgKMEYnP65xDHFGCPrThl8/P2+Wyj+ngG5rRq32nTrUlqryBaNvWu5c65D0FTH3XxOrppb2G29EWHii1reWpmKZjwIsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hG2br83tQxUeM0V05Wnkau+jniQ3+X83HQp6p918x84=;
 b=dCvPrsdK8kDtTGx3Q8EwNPc5Xo1GcpE3zjyfHoyWhXROpfEnl8chL4Y5+FuXXelJGhesB6YbMtxNCXRKBDTyCdYhW3ePiZjwY2c8o2xTJNjVu2omU+YIk2z1kZN4Y2rwj6HBCYbyFOvxJ3cDpyijxmeD31ajETlkJ2fyuq9pvpT8lMb9QXKvFkyk4uZ+4pHkOjWQeMnUKY+9zzR1yvhUP8Vv//556e6V1VR/OOJtVzkj5kaMoEA7EUB5HClvu1Jk3DPraXOhh1g63f6GG/eZtm94N9EU1qDgluGVfAUv6c9xG3Dnfb4rchNvY0J7qBKLJasyJzuEbLXZ6HgziazKYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hG2br83tQxUeM0V05Wnkau+jniQ3+X83HQp6p918x84=;
 b=LpfaYXmzG5AX3zT9efhkQOIEryJuyt+GFJwQquSsLEQ6z42WtWtTbr+IDOXkbUnzJGSPvQCEaKAlMtKidA3t+lpW2SGiAbEiWVN7pfcDdJbgzevbFD4Bx0P84ZDwlr8v+XIF5uj0QV5HtK9yfdBuS9uXR5XKdn7tO/Px8yLCFd11tda2Rrsxcd/gfaNzTfyQV63sAusad4+xDy6VjKxcK6/koluJMcprjKVbXcv8IQ+mOrLhk6o0ioiiW367ii9xL4B8yWwZxtKk86j48RZiIBZoEyRkKIE4d5k5c8De1FM5uXSmylRlVUkRI4wYDAwSgfYWjOv4Og8VfIFFtNRPwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d1345f8e-b51a-9104-4063-8dfbd5edffe9@suse.com>
Date: Tue, 18 Oct 2022 17:57:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: Proposal for deviations in static analyser findings
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <EBCDE6CE-A84A-48C7-B3C2-7856E5D2392B@arm.com>
 <ddc5039d-e312-326a-b71c-8d08d04100e0@suse.com>
 <186C83D7-6C7A-4319-86E4-69F7FDA7FDA5@arm.com>
 <559a3d4c-08ea-ef8c-9a56-2b53db3d51e4@suse.com>
 <E00E3AE4-7863-4231-9DB7-A7B66C8F6791@arm.com>
 <233a9356-b64f-37f7-d7ee-3d6223224497@suse.com>
 <F95C1103-8CDB-4CC3-BCB5-45254DBB286E@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <F95C1103-8CDB-4CC3-BCB5-45254DBB286E@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8235:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cff2c43-88a0-4c97-ce61-08dab1216e2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xGKsFpDs3LLcZL89OZZI8b9qDnuz/FR3gB+zDqHXhxbVo+Akyi3EFrFb69XslbninVvE11yxafcIVtAiGyvnjzF9SFD3fdZcTf/b1ya3meF665leZbFzBt32+2V9Le5+JXq1WXLJpkL9vTwydGPLOnyYIiHdu+dy0kk57f6z54rNnv4nJibSccPrGGd1l+N04ANbR+kp7xrEvLIVUGC/33Eo3sEgYxbgb2iqMtMaJr68/PYkDXwxyp+Zd+rmNrfMFKUijcFvpm5zxu2VLWDQrtH1SSjnaOsVGYEGKQrYdEaFnmzYY7RZQp6HsAFwMJWgP/DLycZ/cd8n8KtP7t4nIjCBNPwW1gAUAYRkLlxs6QwAw4vSivsgKfqJza1dFS5d3gsG+lZINk+G1ODUJJs4rZfCNDjYoGRo57Iywm2UqSyDuPYvLF3lVwYeRAzd280v7MPST2rVD5fwoCs/DY6XUmXYV1A1DCnvPC3ysPn4oWM7pDAqvsFlzkDgtZ83w75eBytdD1th3/Y/7OuQrfHBAZ0/U9R9j6VJDrOMNxfMCv8VNtU1l8dc8LeiFerE1ZgA1/4owsWhEfyLGA1mZYR2XzOg0IzVU7WTn/PY9OjMOq5eprROtT22+lT0xjqlM/2Dp4BiySzm1eAFdscPXzr42+E+ltRV7dfolRgy9DhJvWHbG2lgeBVnssdXEzaC/I6zPZ5oZFVbrGm8v0/AsLkJ184etOEw0XwVDjoyh6yB4YdRjqGeTafrgDWLt/zHme6B1Of2PMfmrSnGG83FnUOuq/j4tqx2r0gcu/8ABefFAUA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(366004)(39860400002)(396003)(346002)(451199015)(2906002)(31686004)(5660300002)(66556008)(4326008)(6916009)(54906003)(8676002)(316002)(36756003)(478600001)(66946007)(6506007)(8936002)(41300700001)(6486002)(6512007)(53546011)(83380400001)(26005)(66476007)(2616005)(38100700002)(31696002)(86362001)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0w4T1lYdGFyOVUrMDFLaTZHNjAvdEU2TVNYamxuZU5MMHpWZi81NWRYNnpZ?=
 =?utf-8?B?OWQ0OW4xZDloQUlXcjZaVW9QVnV6My9YTHRBanhjblpTODRaVDFtNlhBVnBv?=
 =?utf-8?B?ZEEyeXhTL2xZWnZlSXFPcVhQdDJ1emdSaWxjb2xnQUtMY2RraVQzZ3lIUnNk?=
 =?utf-8?B?NGU2UWRYZlBwNTA2SXNyUzlsVU93YmsyQ0VLdVhrdStHUDdzcjg1Ry8zNExp?=
 =?utf-8?B?aU51M2JiN3ZGaVRGWFN3ZXllVXVsS0JkcUU4c3NXcFZONGlUZDViUVlmMEtz?=
 =?utf-8?B?SFV1Vnd1M3RubW1PbW15bHB0Tm9XbVNFTElGWVB4YXN3RllhZCtBNVEvN3Fo?=
 =?utf-8?B?WkdicW9kOTk0dXY0RVl3dE5CQUZTZVpDS2hsZFRvZEhFTEtZOTN5L2ROdWJZ?=
 =?utf-8?B?TktLcHBQOXZMVTZaL1RGQmRTb2IwWnFzQmlhT0NpbU01ZEtNSnFTdGRwTTRI?=
 =?utf-8?B?WVZHT1J1a1VXQmREaDFFa2NlenZMOUdlSGNTRHduQnJiRmh5cEhpSnJpVnps?=
 =?utf-8?B?RnJDbTRLVE5haW5QNGFzd2RlWFE0bWFZeWVxbWhSc2xScFl5OXQ0bGxJNHVs?=
 =?utf-8?B?bGljcUd6ZndKTWhwNG4rWHovRnNrWUVOaExUYjV3bG1rZDhFNlhqNFlCNmxw?=
 =?utf-8?B?MnB2QnB4QlhIcC9PbWlON24yaTVJbE5NY01YT3VLQ25hYXIxSm9OM2FGWGNp?=
 =?utf-8?B?Mkh2YlRHWmZFNklFcWRjNkl4TFJhZkJlNzBVUnZmVTJSMFU5QUhsS2V1dXBx?=
 =?utf-8?B?M0l6RWRUZDFVczFML2ZXYjlKb0Zja2U3cUd0Z25aWUd4ZW9KWGJXalVzemM1?=
 =?utf-8?B?KzNBSUc3TE1YQnl3SEFHYUVyME1FbVY4aW9QREVYbzdkcktuNytqbmdlcTgw?=
 =?utf-8?B?V3lsRzRjNG1vemJabTgraFAzdmlXc1BVZExvTmU4cVRLdEtyUHFJVEdzMkht?=
 =?utf-8?B?QUtwQXBwaHFrZTBCY1ZiSGluT2pwVkJJZmN0VG9ZWFFnLzJYZjhNdDlJQVQx?=
 =?utf-8?B?NzNxWXVtVHdlcmUyQ05sRnZMNit0VWxqdjcybStqdmx0elJCYjl2YW5sRHU2?=
 =?utf-8?B?NDJPNzFUd0hobXh6eXdjcklIMk9NZVh2UDVBZFFFNmdQZkp0em9GWTVwTEpJ?=
 =?utf-8?B?NENWdmY0QTArQVY1azBVUS9hQzVOYnZKLzhRWDkyeUFySUNkUVB3cmJ1TFdp?=
 =?utf-8?B?NHk5ZnpJQlg3eStLSVNyTndENENuVzBDN0VzcUEvTC9NbmV1Z3ZRL0s3dXI0?=
 =?utf-8?B?WkY2aEZlNkZtVzVvcDErYVdxMER1R1ZkUG45YWNNLzRpQnZqNHN5U21SV1Qz?=
 =?utf-8?B?a1o0V240YnI5RzJlMkdRYVlnMTNqMkx2Zlk4YTBqdTczQmdYb2t5dHJuMDFw?=
 =?utf-8?B?NHZTLzlFSlIwVFVXbkZLNnhwcm5pZXp4RjAwZVdLVE9sS0pEVE1sWHlWOUlG?=
 =?utf-8?B?bEZoM2ZjdmdjQ2wvMjF4Y1ZIRk1zM3g2Szl4TjJCSUxRY1lZaU1UMllEcnVx?=
 =?utf-8?B?eW53WHhic3A4T09QamV0N0w3emNnQk5IbUk0dlZscDgxWmQ3K0Q1cjBRWWxC?=
 =?utf-8?B?cWdLcTZmOE1RajNsWnVmdUpUS29FTXFFTzg0aVJ0c1pzY2pQU25MRnRTZEEx?=
 =?utf-8?B?Wnp5WW1CS1duaHBEbmNvaWhkRU9INFVtdGExNzJ6S2NWTEprNityVThQaFRv?=
 =?utf-8?B?ZGhPRXRUUk9oY04yU2FkM2Q2bmhBNUtQdW9relJhdXJvZEhLR0wzenRKL3l1?=
 =?utf-8?B?OXllTkkrek54QjZucU9NbWZPbU9FQ3hBWDZJSTlNV2JzZnQrV1BqcTJ3L2Ur?=
 =?utf-8?B?SDBoZUk1bDlzWlJlVDhmLzlCcUY4bXlOVkJBaWdneTF2WWZmMWRzSkR0RnFR?=
 =?utf-8?B?RWd3M2tVbFNrL1hudkFJRFdZY0ZBclRiY1pNNnlUL1BtRjdOcVFuM0pHODdJ?=
 =?utf-8?B?d0Nzd0pVZElWS1Z6RklFL2x6Y1hsTnBucmVpbCtwbnZMQXhxLzRNZ0hhbkRN?=
 =?utf-8?B?Sml6MnRaQjFJRWpOeW92VlduRUozOTdoaFhJL1UvRXV5ZWJQeGhSeEc0bTBz?=
 =?utf-8?B?Y0lOa2RTQzIvMjk0SXZIMDEwTWhibHM2T1ZtNXVnYWFyUk1NNFhqcW53VFZn?=
 =?utf-8?Q?cHZWwqcMysaUG0q9eehU87GlS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cff2c43-88a0-4c97-ce61-08dab1216e2e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 15:57:16.8038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nh75vZ1TMM/NUbkE79ndTiD1XqvWJ7c7stazS3Ul8ZJRyp4MdGOYQ2smYtgT3AkQ8xmu1aUr5ZPE+1OE1OE9hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8235

On 18.10.2022 17:49, Luca Fancellu wrote:
>> On 18 Oct 2022, at 16:29, Jan Beulich <jbeulich@suse.com> wrote:
>> On 18.10.2022 17:17, Luca Fancellu wrote:
>>>> On 13 Oct 2022, at 12:34, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 13.10.2022 12:11, Luca Fancellu wrote:
>>>>>> On 13 Oct 2022, at 08:50, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>> Iirc at least Coverity ignores certain instances of what it might consider
>>>>>> violations (fall-through in switch() statements in particular) in case
>>>>>> _any_ comment is present. Therefore may I suggest that such comments be
>>>>>> deleted (really: replaced by a blank line, to maintain correct line
>>>>>> numbering) if there's no matching key-value pair?
>>>>>
>>>>> Yes the line won’t be altered if there is no match. This to ensure the correct line
>>>>> numbering is not affected.
>>>>
>>>> "won't be altered" is the opposite of what I've been asking to consider:
>>>> Observing that comments _regardless_ of their contents may silence findings,
>>>> the suggestion is to remove comments (leaving a blank line) when there's no
>>>> entry for the targeted tool in the table entry.
>>>
>>> Why? The tag comment won’t do anything, it would act as a blank line from the analyser
>>> perspective.
>>
>> The _tag_ won't do anything, but as said any _comment_ may have an effect.
> 
> Yes, any comment that is using a proprietary syntax for the tools we use:
> 
> /* cppcheck-suppress[proprietary_ID] */
> /* coverity[proprietary_ID] */
> /* -E> hide proprietary_ID 1 “" */
> 
> May have an effect.
> 
> If an entry in the database has no match with the used tool, then it would stay as (for example):
> 
> /* SAF-X-safe [blablabla] */
> 
> Which has no effect on any tool, hence I don’t see the needs to replace it with a blank line.

One more try: May I ask that you re-read the very beginning of the context
I've left in place? I did call out a case where, from all I know, a tool
would be silenced by the mere presence of a comment, regardless of comment
text. Hence by not purging SAF-X-... comments you may suppress findings.

Jan

