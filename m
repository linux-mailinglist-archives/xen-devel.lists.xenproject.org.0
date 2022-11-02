Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BE461604D
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 10:59:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435749.689481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqAWS-000165-BM; Wed, 02 Nov 2022 09:59:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435749.689481; Wed, 02 Nov 2022 09:59:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqAWS-00013W-8I; Wed, 02 Nov 2022 09:59:00 +0000
Received: by outflank-mailman (input) for mailman id 435749;
 Wed, 02 Nov 2022 09:58:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RDWw=3C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oqAWQ-00013O-P4
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 09:58:58 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70084.outbound.protection.outlook.com [40.107.7.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7a373e5-5a94-11ed-91b5-6bf2151ebd3b;
 Wed, 02 Nov 2022 10:58:57 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6860.eurprd04.prod.outlook.com (2603:10a6:10:112::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Wed, 2 Nov
 2022 09:58:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5769.021; Wed, 2 Nov 2022
 09:58:54 +0000
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
X-Inumbo-ID: f7a373e5-5a94-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BanlWiegPDymqOU6g3mNsZvtpU966Q7EQPV2nGyKoa8Eujn/YjMH5mMfjH/ul8/wf4RKfaDX5U+yjGcS2E4IHCE44UaSzfBAGQuR1lI39q2KzZvuNvkKspiKQOTMpdlaVf7ASOYjBbkJI2MmS/n1YF3aWFEGOB2va+79+cDy9k0W9GO8YmLQyO+vv5clXbxfnXdoXr1rsu3w18YnfIlWchSVJHviTrmudlvtZFfoOByBT630f3tHAtsPRSXntfOP47bvYQnIfMAQE3zCNpJz/vbZJlUf8LJKdJxb7+W8tJeSP953tx8hwgkyUpag28deuy7jn45PJHLPJwvI1BdF+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qFxOckmnoL1HTJeBqKIjLyAK7x5/XyGqlHSsZrCCOm4=;
 b=jK2o8nfmtTbYO8K9CM6CAK2RxTm5Hp78Bg4jp/N7UguKqQ33xdVQk4AaQ6XtEzdrKXcsGV+p0sf6D+RMSO9dgag5yQLpIqqbypYVvb4+p6HZVKOGUOMeLxth31O26j2kOoxSxrlRehz/Eo9DRaqOvfFVsDe840WzSFXS6dG3lTAWe6zM0/BtUmoYJgeFoSqmeF8vwov2FOXc3Z1DDxnRGMFOVlWgwmDQC4ptue/CeeaGZh5eZyZeX91bbbKdHlOMFCOpnqg9cJOXiOAkIveavLEA3Eu1/yxxoUeTE6SbBJ8DQQI1gyD40Nmx7QZ3Cskmk/dzMluQ1HGXpyrgk3NKLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qFxOckmnoL1HTJeBqKIjLyAK7x5/XyGqlHSsZrCCOm4=;
 b=LCxmOpwOAaTcJtxalyUvOOOQJ7Kf7IU7Qv9XK6yO0dLEdYmmrC5wFNIDIUh6n3oJacynqvW9+P2DmZt8c/sJim69GCzJJ6y23R0VKbueXYzFPyHsSH25IBs4PGxw90RZuf23ApeSDgm+ufSzcjszJKvurRzUz/s8Rhggj3CAnasK2fnaCrQNDCx0eMSwh6XcDc4gMOzGW8FvPhamvF9xQyVil0xId5FgmNU65uce5rxwXC0lYlIIx/wLdn5lsBukikW9xeHOGPZKorl6qlrVh8j8CVI8HGZqhGsXItkbfII/7KCIysGZ/y33wT7ON2acdPBzcf4AI/waQgw3rkmuMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ea2ac746-bed1-c43a-62e5-d2e693bef6f6@suse.com>
Date: Wed, 2 Nov 2022 10:58:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [linux-linus test] 174539: regressions - FAIL
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
References: <osstest-174539-mainreport@xen.org>
 <3c8a3be2-db65-253d-94ae-1bfcad1b94e2@suse.com>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3c8a3be2-db65-253d-94ae-1bfcad1b94e2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB6860:EE_
X-MS-Office365-Filtering-Correlation-Id: 55e75601-2de6-42ef-34d7-08dabcb8da11
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CtXzoCyb9HsveUq+LkbcXwWZNUH+Zqk/84LbJSePvb0DVtNAYg6iOdxlqZwOZe80NxCdx/3yi+aPq2puBwqPgb5qVoTBiO8LptaGUwXL7ZnipcrFxhL4mjUs5ThNTP+uBd1qyQFjF9v14Ffk9VL0oPx8esT7lSTdXDezQLKZ5g/MguTG48zn4cHLC0bGtX6lg1ntnxYUUg6gkj9F/gw90jJ5ADjBihaMbPGXxKU+Dpd56x4+moSDShlq/2kIhf8+XvEiEOrBpoYzvjaPDpq6yjGyzGsdc9NFrkEform67Hg4lsW0/1dg2VErPEPovOektsbRVOdaCiGK5TRTwVrC9k3lxKsDHr4nHvL4qZYh1RE7BpgKY7BlWkQG4A2vTph4vzfG3RAfmtkW43GQxG1YJe5viUn6IA+KtGUzF445oI5+fP0Vnbxu00pYMMRupYTQbRy3S+d2K+oaCvCQGDRRO0rlL93nNjdpMBBvTmRw/Cg+wbzZ2EuecbakFfvVbHgZDhMcvjOP3cS6suMk10r/MrfpkljnoCrJIDYAVoZ3WiqEqn62EzglH/xNaIAC0V9fSkI1iufY2uswTk9mw9BOpcGhVo6yRfXBHXyajoqdXxdw7u4h4RjPXSafK8ASXZ/e1lKLH3sLC1mnUGOABc0RN0dphvTr8IXMqXt+6nF3tt/oqNEh7uD4BFHBFys7woBk5//Hko6PssCLU3u3tVCZAkv/80/GwuO6sCUlqdibrnjuUK8yIMlVdBJggNm0SVpGoE8Nkswi6gK4A2j8ASaC8u2GkGWaQHI7IObdZowUbTwc1tY61LsfJ1+vu8WWpyxyULfoRXP+6P57/YJgjQNI/Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(376002)(396003)(136003)(39860400002)(346002)(451199015)(8936002)(5660300002)(4744005)(41300700001)(316002)(2906002)(6862004)(37006003)(6636002)(66946007)(66556008)(4326008)(8676002)(66476007)(966005)(38100700002)(86362001)(6486002)(31696002)(478600001)(186003)(83380400001)(26005)(6506007)(53546011)(6512007)(2616005)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1JzQy9IOGFwZGlGREJ3MGdRMGFtRGV4UldQQW4vS2crd0wwSUppUWtCdVVk?=
 =?utf-8?B?Q2p3cXpIUDUwTU5hRy8vY0Y2QlNyWFdsZytzUi9RUGh2azI3OGEzSFhIWHdk?=
 =?utf-8?B?eldsMDdzKzViMEczeHJRam1tMDhmVEYrL2pBOGdLNjJnRzJpUERuQXAxd1RO?=
 =?utf-8?B?b0tNRjJiRC9rZGp4RUF4a0Z5c1JLOHJ5aWwrMncyUGtoUU5RNHFPeER3L2dI?=
 =?utf-8?B?L0FyNjNjd2pIZ2YvL3h3b0xwZVBrVFZDSVRDb09NSVByTk4vMnljUkFHZ1RY?=
 =?utf-8?B?azRNWE9kTzFyRDZZR2c3bVFUOGJSL1EwdC9OUm1XbE1tR2pXejR5T1FlSnFW?=
 =?utf-8?B?L3loOExCSU1MOVNDbHpGbXhZbG9kYXBrd2Q5UCtnK25oYjNDTHdKVytHVDNz?=
 =?utf-8?B?dk85eHVBdFNhaExNTHRwcG96cGY0QzUyQVh3QS9JcURrdFlyR2JiTUYzMVZS?=
 =?utf-8?B?dXJaYTBFRHhyT2RUNXRtQkRIclNCRjN6ekVaVW0wTFdjbEhqWEVKVmNFWFNw?=
 =?utf-8?B?RDhzczZWc09UWmJ3K1JyUzFmbUNQQkNqU2MvSzM1Sml2U2VxWFhNTDFhelVF?=
 =?utf-8?B?NndNc3FRRVZmekxNd2VNSWZMa1EydHBockFtRUQvcFlJYjRZeHJjL0dqSlMr?=
 =?utf-8?B?L0U0T0pWZ0V2WEVLaGplUDhSdUNmME1vdUJLMG9nRmJXbS9KK0JQdlhvZWxh?=
 =?utf-8?B?RHVBU3NCK0JqeEFqRmttL2hxTTdNVDFyRlNtSTRVNkphWG0yQXZvSk8rdGFo?=
 =?utf-8?B?QmtwbzlIUmN0OGNiRDE4M0REREgxT09SeW95MlVqOGl2QlJWVVNzVGVLRDRC?=
 =?utf-8?B?Vk5iTG05NGVWTWlORzNvZm1NckxaR3BaZXY5cFR2NlBDWlltNGlXMGJSWjhh?=
 =?utf-8?B?dnYrUktaelRjb2E0MHR1cSs2T25yby9pTXJUYzNCcUJaMEpBb0U2T3QrNFNQ?=
 =?utf-8?B?QURFS01maVIxZ1NNZTk2Q1NJbkp1SFhlUXZsVHpSeUo2NExUdVM4SGVmRDVz?=
 =?utf-8?B?ZnlZR0tjeWNnTEhKSmdETkVZakRQVFQvR0xzZXdyY1BMYW9TeUFPTVlvamdM?=
 =?utf-8?B?Q3FwaXRzWGttQVpodmRjZWVWMVhKUnBWaXF3eDAvVHVnMWtYYzluU0FYdTk3?=
 =?utf-8?B?TkZaRDNSalppU0FNV2pnTXRmNHc1U3IxVUNOM0F3Ykd0NlVCRXlSOEZrUE1P?=
 =?utf-8?B?UWxSRlZoMHdlNEpZa1dwcER5NHByK2Q5OXdKcnNzNU9MclgwUXZjT0NNWWVE?=
 =?utf-8?B?OE42VmxFcG5TK21qUXpmTTdER0Q0a3FLenhhcUtvZEFEY1JDa0VWYTF3T0J3?=
 =?utf-8?B?cTBOM1llbjVEbEhYdG9IRDBHQmJkamRuTUQzelV1T2NqWkk3OHdSNXBhejcw?=
 =?utf-8?B?bnl2N2VDakdqWlQxT3lGck9SRmREc2V5NnorTm9xWGZHQzlDN24yQmFPSys5?=
 =?utf-8?B?Wjc2SHIxYWJUYW1zbWtibWN6T3JaTmpaY3J4TnpMV0hDU3FHZXlLQjVCV01F?=
 =?utf-8?B?ZnJVQmg4NHYySndjODhFU3FYdmFGVnBUZ2xKbmJVMk9RYTc2OUYyR0prR3hI?=
 =?utf-8?B?RHAvU2RRaEFDR3BKYjlWb3V3R2Z6RkVlS2RHRkxDN0U2N1NxeGE1dUJQbnZp?=
 =?utf-8?B?NUl6V01qclBVaHdXL0p4ckptcnFMRS9QQmdRTWZqZXNzQlF0WGJLbWlvOUIw?=
 =?utf-8?B?bklBTEtPc3Y5c2Z4Z2FVWWFCb2hSZUdsWERUdjBISGk2UnczcjRpV1VTR3ZR?=
 =?utf-8?B?Q0krdGlLdGxFV2FxdUR4MXhJNGZVbmpaajBvVU5qTS95aG4vZUQ3QytuNHRm?=
 =?utf-8?B?MHRLbGtDNEswSmlDbytFVFlJeDQ3bUpTckhmMzJINUF4Y0MwUVptQ1paaUpC?=
 =?utf-8?B?TkkzZVZ5V2lUQlJndFlEdHpTWlkvZGZwNEJsOW1hUmduSnZpQ0dPN0ZHUVhv?=
 =?utf-8?B?aTlDUzRmakJoL2MyMkUxRWVJcnhBUWdWVm9sZ0VicExqenhjRG1yWHJhZXN5?=
 =?utf-8?B?VXk1ZGRTazhJUlRlWVRqMjgrTUhYbnMwZ0ZtcDMwM3B4SER1WG82RmowRnUr?=
 =?utf-8?B?TjhPeHdPQ1RJclphMGRROW9rV2RXb0VCRmJhUGtiS1ZiY0hzc0VZNFIxVTJj?=
 =?utf-8?Q?dXtWXYMi9q0z33VHbOxaZ35sw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55e75601-2de6-42ef-34d7-08dabcb8da11
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2022 09:58:54.6161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6KUWBbB6O2yjLzaODW2I1Yf0uYfyUYHP9Xky5Hbne1/VYdhKyV9txGVE2psyWFfpXMLDNV4aMMbcC8C9ZV3Cng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6860

On 01.11.2022 08:56, Juergen Gross wrote:
> On 29.10.22 23:50, osstest service owner wrote:
>> flight 174539 linux-linus real [real]
>> http://logs.test-lab.xenproject.org/osstest/logs/174539/
>>
>> Regressions :-(
> 
> I'm rather sure this is not kernel related, as the issue is occurring only on
> Arm and it doesn't seem to be an architecture related issue (the volume group
> containing the root file system couldn't be found).
> 
> Could it be an infrastructure problem?

Why would such manifest on only linux-linus? Along the lines of what I
did say in reply to flight 173480's report I continue to think that
there's an issue with the loading of a driver, perhaps because of a
bad / missing dependency just on Arm. Sadly the log doesn't have any
data in that regard (perhaps because of too low verbosity), so I
suspect finding out can only be done by someone with actual access to
one of the affected systems.

Jan

