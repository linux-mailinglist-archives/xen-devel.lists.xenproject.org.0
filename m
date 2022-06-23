Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C74557422
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 09:43:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354486.581605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4HV4-0002WQ-0Q; Thu, 23 Jun 2022 07:43:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354486.581605; Thu, 23 Jun 2022 07:43:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4HV3-0002UQ-Tx; Thu, 23 Jun 2022 07:43:37 +0000
Received: by outflank-mailman (input) for mailman id 354486;
 Thu, 23 Jun 2022 07:43:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CRa/=W6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o4HV2-0002UK-LW
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 07:43:36 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150040.outbound.protection.outlook.com [40.107.15.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2fcbf194-f2c8-11ec-b725-ed86ccbb4733;
 Thu, 23 Jun 2022 09:43:35 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7806.eurprd04.prod.outlook.com (2603:10a6:102:c9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Thu, 23 Jun
 2022 07:43:32 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 07:43:32 +0000
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
X-Inumbo-ID: 2fcbf194-f2c8-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ukwbp3DshFxQoEHZERBX0EAlNMcubJRFLZGZn9wkxsJNSKStdSDQOh3aBLjRI25FAnseMDdVLLN8q6UGOAg5qHBCcb6C5gmAn7ABm0L1b5WkvBGI7QD7nBl/HKzoYpb/QFcHoSCb2ZTI9q5jYifUGZNJVPEXv6mPiS+Kr39iHzVwDAS5TY5aWvG7m0JWgsJsAfUTyxPxcPf+WujR1ZpffuhHjkEElihKKdwFgs+qdluyTLJWFSKMfEl0PXMIGlYsG3EWWaVQvaS1hnxledWeanGHD3cpnYTRUp8bBbyJIpsjqY4EpTDdfzExLpMCJORhkmcJNAPsnzi0YRRsnKviKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wNoRDXJWr5Cem3yQ0skWig081m+b8aU7iUPB84/w024=;
 b=Uj/apxuN+s1hbKxdiFHtwpw1CEVMDztexskIubdjUvngJTiV47GTvh214VJLuNPNxzOlPb2tYlFXMg7xxHc/LbfZBVz3CzDzzqMBpYkHZjxRjO5xvP1ffHs+rBnLykK20lVDmSU70evrUJk3NluG/Vjg8BnUEYDuP5GJbYagEraadru4N9dq5h+4cz6aou5ar8pF3baLNG8LPAPg9wzFr66T9+R4t8VjL61OOgbm1h3l4yYW3I06r8Jo9fV9uYHJW7Vwj9IDE216rbU534VV31phDSXJ1MQT3N8oAMitwhaP9h5C/n5oSVZAhGNfKkkjs1U8yHeLqRco54V4mWeQsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wNoRDXJWr5Cem3yQ0skWig081m+b8aU7iUPB84/w024=;
 b=SFajp8/kVKDe125R8WjyJ5K0GyHO6HUcTRl6dt9T+RvBezmLiacNu+10tRQS8zs7q76vh2/f9wKENaWYOt6Z1daK2M5xqO8W9DymyvTlOOERSN2WIduUx3DYq/KZXorUBXvzZFIkMJH9nWMTQrmI2gafV8NQKoYSybKqrQtiej85QJvuP6qiuPl4nkc6KdwXinWm0dh2JGRbPtCt3ZTatJFdpZjRDv2D68yHJN1U4LDnpagNT238rTna1PlxrSuo0RAP4w574o1c6pe4rA3PUgGI5EwQG8GMMQuIytQodq/w0Bx58PxCBcvPpc78E1Y/w2gs9Lcyax6+EMIQsE5gKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <16b02586-43a5-0f67-5479-1d7b77aa892e@suse.com>
Date: Thu, 23 Jun 2022 09:43:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] MAINTAINERS: drop XSM maintainer
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Cc: Daniel de Graaf <dgdegra@tycho.nsa.gov>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <baa7d303-1fcc-cd59-0872-a930ea43734d@suse.com>
In-Reply-To: <baa7d303-1fcc-cd59-0872-a930ea43734d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0521.eurprd06.prod.outlook.com
 (2603:10a6:20b:49d::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8301185d-d56f-4548-dca2-08da54ec1281
X-MS-TrafficTypeDiagnostic: PA4PR04MB7806:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR04MB7806CC5DE5A75168A9BB7BC5B3B59@PA4PR04MB7806.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rZoVAkF1dut+aMWUXZFQ7vJAohyVWSMg8OAq8Ljo6UohgeRJoiwdwdNeK8rFFKFIIdm0lL9AU6bhlghLwr8U9lCYdhle1KZVHOwhpKpDDSs8eJBv+jnxVDlyCsmLFW0O1IICR20HVJTUQ12bfRo5hhgoZZiH48mD+mtFlt7SbEAMYNWWdcUbSQB9pKg1+Gg0amDdIZ8Nbhsd8bS0ouWmOJysi6xU6VUkbqdSWhq1jc/3Q3dYnvH/D4i+RDs6TQXh8dCmDkTkPO9HwOhvEIbIiZkG3c6/JvC0WzoF2TR3QLsssrFmWlVPhPlHG1hPeVJwegsfEEhOsVI8AzZWf63ZPIqFApwQUT0AyRBz2txRfCg8amkExdFnkiDikGfEnDU4NfKyHwEnORiU+QlApmn8ANXtXsHELrhl2j4IOMVRDLcz6xIJVEMoYvKjcPqYN022VXCSAzat8UGNxG9wBHFx+M/1kbFAEZbULhmK7Od7JjxKtOedoF9Hxwog2NXTfFxiEThn9q4EbehkIQSrfFDQFRD8nH92qVPStZZPu8+QgT9EnPYQd3Yvper7Vl8vIJoFoRcolDV2YIGc9U+g0H3xOftmE40sjqsTpzqOWVR/MqOTaqJR5dZ7DvvnXL3xhnL4w2L2C4vEJ6bvrKElD6uF6ZdKzj2uvRQhhsMpaKBin5syJc1PLhqxhMwLfg9js0J4NvrHhHiWwcrqWCpxpGAQwoTQ/pxGRACWMFUDtphV6uczU12mfdlGbaRv7srBtWNO5A51VBXf7IpLm9cIfp1n2Cz1N7L/wknpWp5bSklxfEk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(136003)(396003)(39860400002)(366004)(376002)(36756003)(54906003)(110136005)(2906002)(66946007)(66556008)(8676002)(4326008)(31686004)(66476007)(316002)(26005)(6512007)(53546011)(6486002)(478600001)(5660300002)(8936002)(6506007)(41300700001)(38100700002)(2616005)(83380400001)(186003)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDNpUFhVYW1ELzJDd3BFR0Y3SHhSMjlqQmxhQlo3NW5aN2ZqRW5maDg4bFRJ?=
 =?utf-8?B?akExdXNTNnhCWmRIUEZPNVUwRGlDYm5YL2xMR0lmTW8walJUMjVtcVlNM1dP?=
 =?utf-8?B?azFkaXY0eFd3WnlZOHJ2a0N0M0dvdzJJVVl0OFI1Mm5wU0xjYlVpYUtrb1ZZ?=
 =?utf-8?B?Y1E1SWk4alpydnFtNW9RdmRCT2JvdUhZclByTkRmWWhiZlppeTdQK3Rqblh5?=
 =?utf-8?B?MGpERHZhZ2ZlRldwK283dW1TTU1XeE1SdU95SDN1cWVnRnJWa3lHcm9uQUtp?=
 =?utf-8?B?bjFJYmNpNlo2NzBjelJMaFJTaHRFNTQxSWdpUTFIUlNYOC9jRDV5SU9qVDg0?=
 =?utf-8?B?Rmd3OTlZbWpSWG8yc2VNc2tjREt2bXZXSzlyWDgrNUJzeHQ0N09Xczc2SGxz?=
 =?utf-8?B?bk9JMFMxWG5aYm4wMmJjODNyWmZqVWRGbW03QjdSdjJwU3RkN3lCTzZ2aFVw?=
 =?utf-8?B?M2VnOXJBNVp6cTBMSTlSSEtGNFJuem1ncERiZUVEV1l1TkRjMUVwUTJ6cXdD?=
 =?utf-8?B?RXI0UFlVbCtoWDk3U3Fnckh1NEg4T1hTekVSN0NXbFhOeW1zRGo3cldvMDY5?=
 =?utf-8?B?NGlwTnBSQm4rMDlzS3ZwN1hvN0w4cVZuSTRIeGRHQnZZclUzSjJ3RWNzUllu?=
 =?utf-8?B?L3BjeklGVXJzSUlPMFBaVFNYbUQ4NVBaQWh3UUNZdlowWHVaTHMvR0M0V1Z6?=
 =?utf-8?B?cXRVT2ZXV1NKbzlsMVA2T2t4Yy9XZzRwdUd0YW53WjUyd0RVTTBLNFNWNXEv?=
 =?utf-8?B?V2FFWTVkdG5CWU9nQ21zcTMwUVlFUjdVcEZpcWlYc3liSFd4b0hQYzhmYkJk?=
 =?utf-8?B?VzNudGZ6OVFQd0cvakpweGNkaG5MblFkR1pIZ0J4SDVWZkdtNE5IMVNqSEFi?=
 =?utf-8?B?MWtycjU3dHJrVlFWeHhmL09vdytHWVRsZ1JGMTczOUhBakI5dFNPR2g5Rndl?=
 =?utf-8?B?bVlxbTU5NHZ2R0FmTmY5eWtoa0U5eE1GeXAwWUhYekZ2UWNEV0xoSi9PdEhq?=
 =?utf-8?B?V1p6ZCt4THhocXVFWFNEWFNEZzFNQlhhNTFUaDIyb1RwKzMwOHhCYzhxRHlu?=
 =?utf-8?B?MSs1N1lESlgxQ3g5L1A1aG91cFZhSHI4bmJvV0xEZE0wTGhWZ1QzcmpydUpQ?=
 =?utf-8?B?cDVjNHVoUXVxc0U5T2pRU1lkWG55LzFCd0RSdHdvK0QxaTV4WGhZYzJRMjJW?=
 =?utf-8?B?b1Q2cTU4dmJ5dGkwOGtTckZVWDQrZnV4T3ArVnNrYnk5dFdXekQ3S0djaHph?=
 =?utf-8?B?em1Jc1FzTUlGYzl4RUZhR0krM3c2V0wzK3hFZHBtZ3Z0MlB6a0p3djBFWmM2?=
 =?utf-8?B?UVVEZ0M5R3dZanNQSEY3VUljWkRkR0J3OW1oUjBUdnFvUTNrSU1rV0VtOTFO?=
 =?utf-8?B?em1wWTYvVFNRQmc3TUJSb2NndFh4bDlXY1o3b1FreGJiaFcwRHBmYzcxaFBJ?=
 =?utf-8?B?R2E4KzNoWnpSWmd1ZnY5citmVVdVWXQwUkRVeDc0eWMxOEZtWG5jelE2SGNF?=
 =?utf-8?B?L2dlclgxNm1wME5Oc2ZaMmUwemRyalJCckxJdEJnTHpaRm1DeUlBZEExd3JR?=
 =?utf-8?B?ZU1YSlhKZkZFSGhxdGhKeTY5NGx3UHZXNVdnanpNQVRYd0l1UEdVUmZ6Z3E0?=
 =?utf-8?B?dGI0YTA0b2lVQjBVL09OZVVXODBISTgrVWFFYXhqeTgzYkZFYUhOU1FZVG9V?=
 =?utf-8?B?bW81QjFEajJDSE1NaGhnMU1ha0ZKblMybXFKVkNwTmZ6K24rS0dEM1lZZVVh?=
 =?utf-8?B?Z1IydWQxMjUwMHlNcWNBRzY5bmNFZkwvaXZIWjR2N0lmVWY0MUt0TlJkWFpB?=
 =?utf-8?B?UFpjNm5PYmY1Vmc4cmlpOVR2RlUwWUdQeUxHN1dBL2ZOT2p5TXRhZFp3Mlh5?=
 =?utf-8?B?UGF5SWx1TjV5c251RTNZSWRCVnhMN3pLbzFWQjN5bys4S2htbTV6dW1LQmQ0?=
 =?utf-8?B?M1Zta3Z4VlNtaDN0RnlDNDlaRkZXKzZ6SnJ3QUVCT0huNGdDc2k5UGFUUXpw?=
 =?utf-8?B?bzZod0pvZVpRR2lwRzFmVWpGY3d0TU9RaC9qTDBNMjk0ZnY0NTBFaFArNWJq?=
 =?utf-8?B?ZUVINmp3L1RVQjhhL2dZWHp1UlhPYWsyVlpFRXJjK3ZEZ21CQ1MzN1dkSVMr?=
 =?utf-8?Q?DwkZr5bkP8mrw376WSIG3m9WY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8301185d-d56f-4548-dca2-08da54ec1281
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 07:43:32.7580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1t3k9XCOh7qkn0fK9pledgGpV1d+A9M3rcRbevK2Pqxhx5QT4yZ1xcjlqHGDvZEPraRolEtyjyBCq6YnLJjBNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7806

On 09.06.2022 17:33, Jan Beulich wrote:
> While mail hasn't been bouncing, Daniel has not been responding to patch
> submissions or otherwise interacting with the community for several
> years. Move maintainership to THE REST in kind of an unusual way, with
> the goal to avoid
> - orphaning the component,
> - repeating all THE REST members here,
> - removing the entry altogether.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> We hope this to be transient, with a new maintainer to be established
> rather sooner than later.
> 
> I realize the way I'm expressing this may upset scripts/*_maintainer*.pl,
> so I'd welcome any better alternative suggestion.

Two weeks have passed. May I ask for an ack so this can go in?

Thanks, Jan

> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -648,7 +648,7 @@ F:	xen/common/trace.c
>  F:	xen/include/xen/trace.h
>  
>  XSM/FLASK
> -M:	Daniel De Graaf <dgdegra@tycho.nsa.gov>
> +M:	THE REST (see below)
>  R:	Daniel P. Smith <dpsmith@apertussolutions.com>
>  S:	Supported
>  F:	tools/flask/
> 


