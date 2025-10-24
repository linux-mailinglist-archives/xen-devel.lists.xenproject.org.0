Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F438C063EB
	for <lists+xen-devel@lfdr.de>; Fri, 24 Oct 2025 14:26:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1150213.1481429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCGrv-0001sL-2y; Fri, 24 Oct 2025 12:26:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1150213.1481429; Fri, 24 Oct 2025 12:26:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCGru-0001mt-Ul; Fri, 24 Oct 2025 12:26:06 +0000
Received: by outflank-mailman (input) for mailman id 1150213;
 Fri, 24 Oct 2025 12:26:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XD6X=5B=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vCGj8-0006dK-Fb
 for xen-devel@lists.xenproject.org; Fri, 24 Oct 2025 12:17:02 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57eaf281-b0d3-11f0-9d16-b5c5bf9af7f9;
 Fri, 24 Oct 2025 14:17:02 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by CH7PR03MB7785.namprd03.prod.outlook.com (2603:10b6:610:24f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 12:16:58 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 12:16:58 +0000
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
X-Inumbo-ID: 57eaf281-b0d3-11f0-9d16-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t5pXUGM7ygsJmPBh4l8lTE1ojOoBdYwII9szOOmHnL23Ya0u4k0o7xGF43IQiqsFl6MXTV6OlY51NafnZr7EJUyF3inguFIDFaUJrLG1R4Fmqz7+T4YQVA4Pmr39+Bs4xFCTydWSPTTjRnStM5T1rNNQDzeQX3kNU8MHnt89GFHGQ4fzwlpWmi5GBmOcXtHOUDDL018e1DZMZKUsY+JuOfw7AxgfZUT7RvrJIgmYG7Nq5I2HyxjFkvHE58mVyo8lQHs9W35PuSp54/dtviJAyIC0Kwt3wmQkf8Kg5IvTKt+T3lwVMQms5UPAJ5U0kfIlOMMJrrbXZUEqh2H4VWu6mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UOPvwqV9dU3hISjRzvK9ZM+p+yeS0VFusSe3+GvKsYo=;
 b=GUI3c4odnBt9sdl6JRnMoH65AGP9Ik8hcV9qD17VpmPXjG5ihIVSbQSMXU6+ot71eosivakh2U1m2K5gU1aZJze5oGiiyp4E55UQgUCHJf1I0HFlCZrymAlNNrcw8i+3C482XVhhekk87kus6q8Z8012en/tVbRzp1sG0wIGNn7RAG+Gk03UOpSHsCWLOXJjtudXT7UKpC17Plo4DLqOxcwJyt5lE7vxFHMTLcKqK6vb9/X6zOXYGj2vQJCNghWbKntuDy8IbE5FLmXyhBS5hOZdeiXCKtU+kJ4IesYnNKvId6qDzNILXEY15CSzZvurUzoEyusW9Ycx2trUQm3pkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UOPvwqV9dU3hISjRzvK9ZM+p+yeS0VFusSe3+GvKsYo=;
 b=SW+rBgskBsgORsk1pJpDgFJzpNACpPjAx77oQ/Aqt65vDc4koG/Z8JvBHcEToNiqGaWsINUcmOgQlG4+e/yOzusGxxZD48wU1LcucA5IUYOQFh5g8jkvIQxtTungmywRXEocdATD1pqmEHTOzCNpQrU+s8J/CR4cpdyy3gfogVY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 24 Oct 2025 14:16:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v3 for-4.21 1/9] x86/HPET: deal with unused channels
Message-ID: <aPtuNclNlRd7mx2E@Mac.lan>
References: <6a8a912c-7276-42bd-af2b-b94fc6ce4291@suse.com>
 <86001bc5-de05-4a5b-9683-54d09c5fa8a8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86001bc5-de05-4a5b-9683-54d09c5fa8a8@suse.com>
X-ClientProxiedBy: MA3P292CA0009.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::10) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|CH7PR03MB7785:EE_
X-MS-Office365-Filtering-Correlation-Id: a0957b53-f190-4728-a548-08de12f739b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K1FmV05wcFRnRWZVY05JNld6Y3dpemxGblgxR0szMjBSa3ZhSE5VWDZDbEtT?=
 =?utf-8?B?dldubmFqTytZT0ZCMng4Z0Zjd1pxK2VBNFpPTEVtOTVKQTNybVZJVDdvRmFj?=
 =?utf-8?B?azdrZzVCL0VxSFBTL0dWSmdWS0JiaHVWSGN4cUZ1TUpzVEVDYUp2OWpJeFJJ?=
 =?utf-8?B?RVR1b01IOCsza3NZQ002QmgwRHBUWENkUURuM2lFQnNOdUFxM3NaMDJHNjJa?=
 =?utf-8?B?ZzdFL0tIcXEyNWY4ME5mcm9NVzZQRGtmWGpVQWNvV1ltTUlVbDh4VEwyTTJ4?=
 =?utf-8?B?bG9JQVE1MGN1eWQzNDAwNGIwSUEzYnhjMEhqTHFoR01IbHAxS3NjUmh1NzV2?=
 =?utf-8?B?ZGMvcW56aEVWNHdxVFZYcTM5L1dGakdzeUhuZDRLZmc0anhpa1E0SnppZ2Nj?=
 =?utf-8?B?Z1ZDYlRQa1VzYlplSWRZbG8ya1Q0UGkvYmRacS9yNWx3ZWhWbFZKcmpkUFdx?=
 =?utf-8?B?Qis5VlIxYVltcURPZTV5UzNMMzFvQlBvQ21KVFI5cVpsQmlJT3FGQ0ZaMDE0?=
 =?utf-8?B?d1JuZGx2dVBJWHhhL1NBcmkzVW5aZWhzZEN0NUZBa1RuMmlQdjB2SXdxbzFQ?=
 =?utf-8?B?cGw4eXI3RG1CSGpCdU43ZjZYTTRMMUIxd0JRdTZTdmJkd3BEbWkza2NqRUI1?=
 =?utf-8?B?d0h4a1FlaStXQW40Y0o2ZTJhWkl6N0V1cGZUZmNCWDZXMllUNmZIZVVCVzQw?=
 =?utf-8?B?RmlPLzRUK0xXS09Ua1NFS2JnZHNTeGlIaVVMeHBwRDVTZkxwcHphRVVDQUJq?=
 =?utf-8?B?M1BnNllEeGNSSTZmL1dKMG53MU52WVVNNHMxbFNob3ArN2Q2NmJCL3FFNlpW?=
 =?utf-8?B?MGt1U0ZaaFc1UWRMeWpGNEZROERTQWZzR0JFN2hKU2d1WkRoTXVCUFVEakdl?=
 =?utf-8?B?YmFvQ2RxVlZwa0RHUnBNb1RNZVJPWmozcVd3TENvSElQSU94R1BZc3BVOW0v?=
 =?utf-8?B?VWxlZGhBNERrZ1NIQUJiMnEvVGNLL2JYZzU5MTlyQWhWNS9xRWkrZUNqd3Mz?=
 =?utf-8?B?L3FGR25GK1lyZXVMeDcrS3hBWG9aUld6Tm9TWlFVMTc1aUwzc1FmakkyNkM1?=
 =?utf-8?B?cFpUeHBSTFNUb2tDQ3k5Rzd4WGd2WFZDcVpwc1RjNnU5WUg3Y3JvQWErWEZ4?=
 =?utf-8?B?TWI0WTJMcWhzQzVlMDg2YVhWaVZXbktzbGYwTWJqQURxSVVycGN5U3lGQkly?=
 =?utf-8?B?enAxT0V1N3VFQnFjTlhWb3FienpHQXBYdFBvS1UwVnJMTTRHSSswMm9remRW?=
 =?utf-8?B?cktkdmF5L0dyVWFzOTJWenU5cGRNN2FHUGJoT3JUR3lTSDVYMzVraDM4OUEz?=
 =?utf-8?B?dVlrdEhiQkZnZUhhS2QwTGVWenR0WU40M09UQitPL2lNNzBqMk0rZmpNdldu?=
 =?utf-8?B?L1B4K1VZSTl4MnpZV3RFWk1sRWxEOTNIejlmTGxiMnFTNmFnTmtNdTNNOUp1?=
 =?utf-8?B?NjY1RkFQWW5WRTVoNkxHZUJJOXl3WkQxTEpWaXI1T0F6eGw4R0w2eHkwU3M2?=
 =?utf-8?B?N0IzOWcxanlBM0pxYndUSlk0VWpzazdmbTJVVTFJOVNTajFGNXZRWm1EaGor?=
 =?utf-8?B?dGFOUDdad1FjSjlUaDg3dGcwNDVRSjMxc1hDV2Q4eTRQcVdvbU0vdDZZbjBq?=
 =?utf-8?B?ODQraExSR0JUdzlGUkY4QXNDQ2craUNvcTl6c1ZnN3ZYNjdkakJnQ3Z4ZCtZ?=
 =?utf-8?B?NEthRnZubVBNU0VlQ2VaTWlSQUlJL3NHZ1FvaDlsSUJQZGRyMnpmT0NDOEQr?=
 =?utf-8?B?OEc5aUpKNWFzWmEwTURSR3kzQ3JoOVo4M25rek1nNzNQay94cFFKaXc2U05N?=
 =?utf-8?B?My9lTytDOWRJa1VRWGprd0cvUWlMMGhwSHoxQVhtbE5yMW8zcS9iQ2JLcGVv?=
 =?utf-8?B?SC9MdmxXdGxTVVhzRXVBSW5QK1hveW1MdWJ6ZEkvQnFsK2NDNkhhUjJtNXJG?=
 =?utf-8?Q?0kcldxcqopCCFb4mGZIIojllgpojKVNp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWxVMjlKNm9IeXM2YVpIV1VoZVB2Z3VlSlRSbm4xZmZ6VFl5S1cxZkJDL25B?=
 =?utf-8?B?N3ZCS2NobERtbnpEMGVEWmhyRlJNSllHTW5jUzlHR0gvRVl4SVJBMjZTY29z?=
 =?utf-8?B?NkhFejlCR2NYanFXWG1kbkVsN3V1eCt0cVlKVGFrWjJ6WmlNbWY4WmlzZDRh?=
 =?utf-8?B?ZWNZcU9aUUQ5VFVFamt0YWJPcDlCWWxBNk8rSU5tWjVVdHdLL3EzTXJ0UkZ2?=
 =?utf-8?B?eFJIc2txelJ0Yis4Qk5aNnZWZEJ0TUY4RWVpOEFmM1hsNFZYdysyQlVaRkpx?=
 =?utf-8?B?aVJxQi9tckZreHZUZmJSUHNyaWFwN0dsOGpOTkc0U0xkdTROSUNBSi9kU3p5?=
 =?utf-8?B?WnhuZHBoZHlhejdXYi9sTzd2OG13ZEdvcDlHSGVqYWFhRm1BN0VwcUlNcjh4?=
 =?utf-8?B?eTdNREJMdHdwSWRDM3lQQjFNTVg3b012RXI4RlZQenRyenhyK2Evb0ozT0Rk?=
 =?utf-8?B?UXRCMThQNVgya0RvLzdkaXdaM1BZYUpZWUNvdVhyZU1zbzYwN3dRMkZRczFW?=
 =?utf-8?B?ak5Ma0VodW1QcTJPRU9aRHZ2ZTYwUVJEcTZGMUsxK1JtWnpCUGNnS2RmS09k?=
 =?utf-8?B?aVVKUU9QYTBKTHN5cldFZWp0UkhIZ2RPVW5aMUpWZldETFVGY05CTnRLMlls?=
 =?utf-8?B?TGxNUFAvTnlNd2dac3FENnJYYnZudHNKZ1BVWUdFV01JUnBlQVYyY3Y0OEVw?=
 =?utf-8?B?cjF5MHhxZDdySUh0ZHZzNS9ITWp5MEpWZmtybGNOZUhGR3VIeHJnV29mL2JX?=
 =?utf-8?B?R1dFVlJ6RCt6angyNHIrMllxZ216N1lpZnJNZGJqdXJtQ1pnN0p4U1N6N3BF?=
 =?utf-8?B?Y3dXR0syNVZuYkN1R3pvZVRoZ0JTeG5nRDZmdFNWYk11MlZSclZodXkxOGJL?=
 =?utf-8?B?Vlh1OTNvTXQ4RkRjQVRvS3dmZjI1WEhZc2MrOTQvam1KYWhxK25nNVFET2dr?=
 =?utf-8?B?VHh6L0pTakNIcGZzMldWZlNLOTExUDVWQUJTamRxUWhqYlFkWVp3N29sWUV5?=
 =?utf-8?B?dml2YjNXeldGZmI3bWpRazN5UEFXaHBaY0w1K0lRbFBvUVkzUkxzdTY5bWVW?=
 =?utf-8?B?cFlqUGE1eENrNzBpalFBQWM3YWszdEJWTHEvL3BNS09FYnliZDZML1BtcFVZ?=
 =?utf-8?B?aldkbFQ4WEsrSWRRSGcxVXQ1K1hSNVp4MDZ3QlUwd3IwZlI3bElIYW5rOXl6?=
 =?utf-8?B?WGRYUGc3SkNodW9XbzdaaVhDQjJ1cWh5Q3VYTWxBWEFWNER0bS9ucWdXU2Mx?=
 =?utf-8?B?R2pPb3lIQ0xPUzdUSXc1MjdQQTdzNWYwVzRJelAvQVNtQUVSS0M0YisyclJv?=
 =?utf-8?B?TTdodWczaSsyUXp3WkxlY09saGR1OCswZXRDV2dTb2s1aWRSRzJvK3pDVm83?=
 =?utf-8?B?TkJYOFlhZGprUTdKMTUrRmpNYmVuQWJaUFl3aWdMczA2RG45QjVNWlIyQTM1?=
 =?utf-8?B?RDdBd2dFRGNzUkZkVlA4REo2UDhyaFlsVnAwTTlRVjdGbnpMUTJlNE9aQnBM?=
 =?utf-8?B?czE5czRlei9jaXQ2S1J4RjlnRU0wNTF2a25JMEZqZjMrajVFc2d1WWs0Z3VU?=
 =?utf-8?B?NkNKcGxEc1RaYXEzd2x1a0lBT1RScy93TVNNQlBLdkQvUzM1RnBDS2dmWUtm?=
 =?utf-8?B?WHlIYUJzR1dlYXNhcUpJQWxFc2h2NnBMakZFWG56Zzdmb2I0YWlVYWIwT3dV?=
 =?utf-8?B?ZjI2SytNYmJ5amQzcEVUWXAxZHlzK3RxSklYa2dIRWFpSFpibjN0TU4xaUFk?=
 =?utf-8?B?dFpUS3JYcFIyTHBmUDVNRWxEOUN3VmcrUmtQUHdSOGp5UWdZeTlXR25rTDFL?=
 =?utf-8?B?M0ZzTTArQ2tycVFrbENZZWNyUHorRDZ6TVJ4clRHSWM4U0MxVXVRekN4STMy?=
 =?utf-8?B?WUtmS3AwT3hRVXlhWTRnZEhaWXB0b2pubkwyd1MvNHdta2c0SXFiWjB0RkFS?=
 =?utf-8?B?U2xxMXdyU1YzMGhZa0ZSZjd5em1ldENyWHRBVGZzcHRPYkhMTjNRV3A0cTA4?=
 =?utf-8?B?NTc4VU04alMxK2JFU3drN2twaUxBaEJHNkF2N1RseG43UUdoa3kvUUtWcnMz?=
 =?utf-8?B?SEJaVDhvN1lrb3dFVFdtTzhCZWRoUHhIZGtnL1l5QnBQU1pVY0pKUVZtZEtU?=
 =?utf-8?Q?EJdMiBP4lf2afFOe3ySA4kC62?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0957b53-f190-4728-a548-08de12f739b3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 12:16:57.9897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d7t67dKD5K5ozmRYsL0uE5LSHnYhQLeOJIiGPykkJkM5QVNl1DYz1mEnrDRjkhJaAOpiZXx8j2ADk7Y1UX6D/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH7PR03MB7785

On Thu, Oct 23, 2025 at 05:49:57PM +0200, Jan Beulich wrote:
> Keeping channels enabled when they're unused is only causing problems:
> Extra interrupts harm performance, and extra nested interrupts could even
> have caused worse problems. However, on all Intel hardware I looked at
> closely, a 0->1 transition of the enable bit causes an immediate IRQ.
> Hence disabling channels isn't a good idea there. Set a "long" timeout
> instead.
> 
> Along with that also "clear" the channel's "next event", for it to be
> properly written by whatever the next user is going to want (possibly
> avoiding too early an IRQ).
> 
> Further, along the same lines, don't enable channels early when starting
> up an IRQ. This doesn't need to happen earlier than from
> set_channel_irq_affinity() (once a channel goes into use the very first
> time). This eliminates a single instance of
> 
> (XEN) [VT-D]INTR-REMAP: Request device [0000:00:1f.0] fault index 0
> (XEN) [VT-D]INTR-REMAP: reason 25 - Blocked a compatibility format interrupt request
> 
> during boot. (Why exactly there's only one instance, when we use multiple
> counters and hence multiple IRQs, I can't tell. My understanding would be
> that this was due to __hpet_setup_msi_irq() being called only after
> request_irq() [and hence the .startup handler], yet that should have
> affected all channels.)
> 
> Fixes: 3ba523ff957c ("CPUIDLE: enable MSI capable HPET for timer broadcast")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

