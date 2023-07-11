Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4293F74EE5F
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 14:21:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561749.878256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJCLX-00030f-3c; Tue, 11 Jul 2023 12:19:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561749.878256; Tue, 11 Jul 2023 12:19:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJCLW-0002yl-Vw; Tue, 11 Jul 2023 12:19:58 +0000
Received: by outflank-mailman (input) for mailman id 561749;
 Tue, 11 Jul 2023 12:19:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B4LE=C5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJCLV-0002xM-6s
 for xen-devel@lists.xenproject.org; Tue, 11 Jul 2023 12:19:57 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20623.outbound.protection.outlook.com
 [2a01:111:f400:7d00::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ebe4a8d-1fe5-11ee-b239-6b7b168915f2;
 Tue, 11 Jul 2023 14:19:55 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by PAXPR04MB9595.eurprd04.prod.outlook.com (2603:10a6:102:23d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Tue, 11 Jul
 2023 12:19:54 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Tue, 11 Jul 2023
 12:19:54 +0000
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
X-Inumbo-ID: 3ebe4a8d-1fe5-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gVIbtFfAB0jWFmUbq5z4tqmG4HYVJVRqrgn7+58a1jbnVw6pqcOsDunkNZg2QZRS0RCw4gDsI/091U0BL+0YcyNF3LX687tjcMJ+a/lvNvgaWtr/0QPH6klWjboKWiEnJdNMbzoYswnM69JJBOSYFH65JxRPAF7M37ZjFt5CA96upPUVwYLbNdxaGInS2Y6pPR8ODUKinwQ6ou5dqm1QVlA/b/7WKpy2GC0LlhiEWoNoGIUiBZSxR2bGL1+I4BqcoJk3NVVM4+qR9Tvm8dlM6rUSGF9R6+RrdMBpV6KtG1SWeO4ivFY4SzYvvuXh90M9/YsYE15UJqvlhFQDnMCY/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KgSpG3/MCI5jpAoxrVGYqtnC9VjoxBr5nKP7YldgBbo=;
 b=ghFVWTightlKT25VIdi7UeXgGMrxAFg7ru7GsHP5E9MW0Rndhjm6MApd1innPu0Rbo3a27q0xYemCQ++B4y1pcV92uK7vMwIwAjCZGEV04UBeXhWU+bkgyT9vP0nPZdIZJfw91E/l452jjol3W51QkaymOgp1Vff9T/PkRvenhijw34HPGotPawsuUlad2o5P1fafIk+b+4nMwTVbhTpX3cUV+K1Wl88luXxMO90bza/nZpSVpB2UzUcreb/q3LkJVW5S58XQLr3Pa0QMFkIIpcMzA+b0H4/1JsTbgcWeRJvkoc/j8HIaD2ghb5nv2m5qoHVoiBQtQ0DeOfF5MAI6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KgSpG3/MCI5jpAoxrVGYqtnC9VjoxBr5nKP7YldgBbo=;
 b=sAuD8sMdteyo/3PAI24rVJVMSdvM0p3CvHr1/3PXaxhBj6zm3PZyeN0LShdwm6SkjRwocraUryWIOP9yuQK/40JWHacI/JnhaqeB2xf36d23I1uuPvtCg6K9xRdGc+/va3SgCBRaZL+bkzJIPfh3HZDLVfipoGq43LhktSsxdhaP5KPHf1SwIEg4FoVEUeCdEX67WWIMfOMEUWmWnOOEFSwkoQYg96NNMkecJL/EZEpeUFouNO8uYLoN9bcWdpcDTTjemDGz9Y7LO+inPiVCVgDJJRx2xnfH6+m6o+03vKXSdfK1IWG5socohTFjoyzgaoILdM5lJCOb+rN+V7HQVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <470b02cd-b98c-1819-ac99-d7a37f33b901@suse.com>
Date: Tue, 11 Jul 2023 14:19:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Ping: [PATCH v2 0/2] new CONFIG_HAS_PIRQ and extra_guest_irqs
 adjustment
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <85e59fd5-9a06-48b4-ba7e-81865d44e332@suse.com>
 <e14fdd8e-692b-bb19-627a-0462cce45de5@suse.com>
 <1c0ff25f-e3bd-e852-1836-c240d9273bc9@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1c0ff25f-e3bd-e852-1836-c240d9273bc9@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0215.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::19) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|PAXPR04MB9595:EE_
X-MS-Office365-Filtering-Correlation-Id: cac68d42-a474-43f0-7625-08db820921ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	usEaQ4iY9QXhqyX0L0D7vPvpM8blotVYTb/hekdxSjEif9pTmnqLWcw22RCIYOEnMxPHk9OGV9Q/Z2xOMe6bT6Nw3vzcFZIyrtBpbDMngKNWHKSN6IvDIJqIt4lOvaK7C3xFMFHfIthOXSzomvsOB+1FXCeIsRkyKQKpt4bvp/HUpm9w3YbBCep91Jv8+WlDOVZd8EX18ABrTtXrsFnylUMzPk6N+FS8t5ft40tBMGr7Yd8L+zt9rARdwCVswkJVHSpdij/m/JKE+BRLW3kmSMeJlY/7DwsDabnbq6fIvZIE7bTSwXMBxPZ5PeiyzeBZ6S8qnlXViSyqtvScprkYAtHDf4Mp+u0ONlcQ5WdzpG+vdAXdCl/ubmpNBM+w9MiSZ1C7C/+0gYvQ6T93YtEZQzaqnLo7Emt4QuFTAgRNf7aA7WHCXLPhBH1FMEqCXgi+LwGMLrwS1oRVuLwVhBdj859dJP/rlUhJz9v2a/etGI6WhZTNAvUSEO4suM01sfUkp/82Qhhfs/azeMllGzpPi2+/T+BoA5Po95UKTmxkkN4mULCQO3dBgHXPNkGgnv+cey7YKc6mK83OQ/G/+ceBwx3yS/eEvh3lmOHyu9+c+LAts6b/TpM3PkeVPFwSGTDR7UVFcAa2u6XtBW/ZtKRaQA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(346002)(396003)(39860400002)(376002)(451199021)(36756003)(31696002)(86362001)(38100700002)(478600001)(54906003)(6486002)(6512007)(8676002)(5660300002)(316002)(2906002)(6916009)(66946007)(4326008)(66476007)(31686004)(66556008)(8936002)(41300700001)(2616005)(26005)(53546011)(6506007)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWtsb2ZuQXZsN2ZIUnRTWE1ERm1GRXA4QmRZeWZXRkNhN08zT0VrdkJRTmw5?=
 =?utf-8?B?bnZNUXFKL2EvNktUMURxOFhROUZ1d216bTZBYnBEdmpRZ3pMekFwb0JoN09v?=
 =?utf-8?B?dTlqSnRLU2daQUt3NW1jVmFrRFdLanAvQzMrOWliZTZTbkloSlpvZHhZTzlu?=
 =?utf-8?B?bEVyKzIrWHM2cUJpbVF4c0RkOGJycFhmajNob3NzS1FEMlhmSVFwclZId1hD?=
 =?utf-8?B?UHVnS2c2THZZYkVSNGhBWjVDNFJObXRWLzZLNllYeCtWNDR5YmNJQU9rWmpP?=
 =?utf-8?B?Z1VHV0lMMkxaYmt5VmU0YkEwWWRaYVV5YnF1NWVsa0hSTDlSSEhadG1rWW4x?=
 =?utf-8?B?SkQ4VURQQU9wOWdOT1pVOVRuS1E5WHYxcHNPdk1MV1ptaEhEZzZPNTlzSVlW?=
 =?utf-8?B?NFlGMjd0eVFyT1JSWHdaeVY0WVVETlg1L3djK0pWT3JHazhYcTJoRm9CckZY?=
 =?utf-8?B?a09nNi9PQ0ZoNytvV01iQnBKSDREM2UwTkF1VE5EM21yZFhqSnlSeTMzdUlY?=
 =?utf-8?B?dzQ5ZEtuNmdZU0J3Vzk0OVRqaE9jdkJNTStHRCtheGRPQjFrZ1pXZENJemh3?=
 =?utf-8?B?UmdxeVRiQldZcHU2RFB4MTNRMUpBZnZ2c2FvUW52UitjQ3JTYkJ3dGpZa25M?=
 =?utf-8?B?ZlNScGM0ejJpZVl1S1Fvd2JFaVhzTnRGVDdRa3piN3dqMFg2Q2gzRVFyY00w?=
 =?utf-8?B?b2VNZE5xSy82c0FvZDl6YUl5dXdtVlM3N1UrSFdub3JNZFdpNDY2Mnc3UlBq?=
 =?utf-8?B?QWhZQ2VVMnlBVGh3aTFGcjl4djlrejNIMDdJZWxNS1ZoYy9MRFFJcTAwYnhW?=
 =?utf-8?B?KzI4NmFmMnozVDIzL1ZBK25xVzZnMFBGR2QyWDhhaGpWY3hOY1VYVy9IZVV0?=
 =?utf-8?B?NHZub255eHMrL01TRVN1YWpRUEdLU0tqQUNrV3NPdWU0L01ZZGtuRWZWWFhl?=
 =?utf-8?B?dnVDMkkwMHNBOWZxdG85ZGJ0R2tSenRvaFJKbW5PL1A1U3dIKzUyNlZ4TzRo?=
 =?utf-8?B?Yjh0UnA5WE5mRFBQS3ZUQnRqS3Zmb2xlNGo5aERuZGhmaUpwb2ozYnN2NXh6?=
 =?utf-8?B?WmRRRnNMNE5hYit4WDYrdzJ0ZVFWVlpVU3dUd3JPQkpueUhnYVQwY1lCY0lV?=
 =?utf-8?B?K1diN2dKZW43SkJhNU83RmpEUFgzMzFUekYyWmxzMmtLdXQ4ajVQeC8rajg0?=
 =?utf-8?B?cmtQeGdGMW0wV00xdVBNQVdGQTNpT2FzREJQb3dHZC9KaFF5SjZXUGR3UWVW?=
 =?utf-8?B?dFhGdm9QRy90b05INjNkZWQyQkVhb1ZTcnBzUWpyeWRFMmpPRDlCOXFocFdP?=
 =?utf-8?B?TjFwbG1Fem5PRDhnNTBkVmdJa1V6bExjMjlJZ0JsOE8rN2J1WUM3UU1venRy?=
 =?utf-8?B?VGFoeml4WC9xeE9CZkpkMmtuSHdlMjVrUWE5ZlBXU0dZajcyd291NzZhell2?=
 =?utf-8?B?dmpTamFqVU1KTkllVHdJTnQvSjk4NllGVEk0MHRUZ1VwbU82dnBFUkpWRCtW?=
 =?utf-8?B?WFBGZzQxYU04cE5iVXBCV25kQnB6K3FySmRnOWdCYnBoQWc3VDkxZzJ1NkZk?=
 =?utf-8?B?L25sWENkVXBja3ZQU3BzVHh3NVhmeUY3Lytiajc5Zm95RUpLZk5wMUxFRkhV?=
 =?utf-8?B?d2tTSENENHNzbDBDVHpXbmpSMEJHaVhBeWFRTU5nQmp4SDRoSDdCbjJSVEE0?=
 =?utf-8?B?a2J2MlVZc2RSWCt0REEzeDlSaGdQQkdiSlBqL3VDNHZHN1J1WmJqdGpiTlBT?=
 =?utf-8?B?SjNMVzEvUEU1aUhQVWlPMlZiUzlmT3RCZXZkNzFKMlNqemMzbDlTVWRNWGw5?=
 =?utf-8?B?bk96S1o4eWFrZnhRcGRHQURqSndLU1kxcWlOUmVDVXBGTzAzOFdSQUJQSVJ5?=
 =?utf-8?B?RjI1YTdBbFRiSFo0WTE1cU4xamFRV2FncmlTclNsd240bkRNVFRVYnJZY2hj?=
 =?utf-8?B?RUdNNm1qMzQ1VU9jWDRsbEFTZDkwY01LcVl4bC9UNmMzTnNxODRWWWJhMDFu?=
 =?utf-8?B?cDJac1NyNW40QWt3NVgrRkpDbElXVHpxTzVabXB4YzlTME5za1hLT3VvNlFi?=
 =?utf-8?B?akxOc0FOZjljdHhjSXN2OGVBNjdTSS9laTFkaWJaZTNrTSthdHJIaWNrWW91?=
 =?utf-8?Q?vljBAq4VbevLqTh56y6GmfPIr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cac68d42-a474-43f0-7625-08db820921ef
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 12:19:53.9777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TsQVEHwwfB0TkphXDYpiSz21+VZuz9FOTm4L9Kzlae15ovtU98+IDvmNJA98YJAyVmf/1+FZZOX7szJFVVhoGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9595

On 11.07.2023 09:27, Julien Grall wrote:
> On 10/07/2023 08:33, Jan Beulich wrote:
>> On 03.05.2023 17:31, Jan Beulich wrote:
>>> The 1st patch (new in v2) has the effect of the 2nd one no longer
>>> affecting Arm.
>>>
>>> 1: restrict concept of pIRQ to x86
>>> 2: cmdline: document and enforce "extra_guest_irqs" upper bounds
>>
>> REST- and Arm-maintainers,
>>
>> may I please ask for some feedback here? Roger did supply some, resulting
>> in me considering to revert back to the earlier version (i.e. patch 1
>> dropped again and patch 2 minimally adjusted to address feedback there),
>> but which route to go wants input from other maintainers. What I think is
>> unacceptable is that we continue to not document and enforce the upper
>> bound, leading to people needlessly running into issues on big enough
>> systems.
> 
> I looked at patch #1, I think this the right approach for Arm. Do you 
> need further input?

I guess I'll reply to your comments on the patch itself. Feedback
there was what I was pinging for. So thanks for getting back.

Jan

