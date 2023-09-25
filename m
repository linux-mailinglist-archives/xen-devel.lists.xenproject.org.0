Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4F07AD035
	for <lists+xen-devel@lfdr.de>; Mon, 25 Sep 2023 08:32:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607605.945845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkf8s-000256-FJ; Mon, 25 Sep 2023 06:32:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607605.945845; Mon, 25 Sep 2023 06:32:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkf8s-00022D-CA; Mon, 25 Sep 2023 06:32:26 +0000
Received: by outflank-mailman (input) for mailman id 607605;
 Mon, 25 Sep 2023 06:32:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3u+g=FJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qkf8q-000225-Oy
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 06:32:24 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060c.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4896a67c-5b6d-11ee-9b0d-b553b5be7939;
 Mon, 25 Sep 2023 08:32:22 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB7101.eurprd04.prod.outlook.com (2603:10a6:800:12e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Mon, 25 Sep
 2023 06:32:18 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::1353:3b49:2b70:6303]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::1353:3b49:2b70:6303%3]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 06:32:18 +0000
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
X-Inumbo-ID: 4896a67c-5b6d-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aQ0cbYAxcN0oPjvXvn4o1y4cPbNldF8NwqMjIKbkTHbvgHB4vZ/avdqwuHUFQK48VC3lfHXQlQ/aP4uK5Ra1IdE4pJp/3LslPiuf0/CsN4t0KGBMgFJnZZsZ16bRMK9lewzejEvkzK9NmmqyStMcLwuG0NhvXKEpDZgT2psZar1P09St/2wUm51/CWxO3bV9d/Q0BbkCbWEU8ek9L0k+W2YB897dRigKE6B+UgGgDRa9RHCfNePUUJsBTGRA1QRbRDGTGI0dktBP0EJHYm0zUb53rXOnslCO6QXNgeNIlmATlHoLudjFtpNE1MSDr2Ul1frmDugRP44ko+OMutgcqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NjiKFrj5pkgdi1CpOtbnTpwZEVgbLE6BbHNkt0LBRgo=;
 b=dVXCfNqQq3SdYHK+ezJIO5WoT6tGttNqJcUVQIBzVyGSXK+jJCe2KhVEOjHvtoLZPt7fDTjv/RpE4iTyEFuDVOV+a0dndF7mmxGs7FOfsBIEATmOPhujsYzvdjUIKimJq92jnkBnr+sVcwkGDNCrejQbiAe4H2755sEe1fYW1oj5WyHrh5IEbkHFw8MWmVNPnK5qkOcns8QS9aqOhNgvK897PpQTNulharLKQ6hWqtuQd+XsdM0h3dYv76wpIxVZTnk6l7P4x4NfC/vHvPpvKjuXpGJXuTKdso1tP1E3RZ8aYFX3Vu5rXkSYIV2+27igk9TnB3MBsDUA32FpUTAzPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NjiKFrj5pkgdi1CpOtbnTpwZEVgbLE6BbHNkt0LBRgo=;
 b=Vj83VYBrKOhgkzasWLczxBlEA2LLG4aS2Of7biRzDs9C52amYoyTjO2Q67bAOh0aig2N+YsywrizZadGJBN06HSgrNbfeDmboiC/yZNfIzm/NOWztBBVP47gw3xlSUsIXswP1q9RYSVoDJ7PCrWHYRXy2btzfzssoo2vanbLEIN9qy7K/3tAlnIymaBzJxiGrhwvZb94MNEmf/fHdsC+48camXJ7r4pcAKH8M3/U46gg42795xrU0NvePWO64wVnATXG3Krlcb524OfxOaD+jItPZfvZgxwOVgg1E8WLwPMezaepy6+SzP8rWgIHjE58/0kR7FjV8WLEImUkDo07Dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6399a816-ac1a-b741-ed52-b5d03b498ee6@suse.com>
Date: Mon, 25 Sep 2023 08:32:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Xen 4.18 release: Reminder about code freeze
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "jgross@suse.com" <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <AS8PR08MB7991D1099E32CC9F03B0E0F692FCA@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB7991D1099E32CC9F03B0E0F692FCA@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB7101:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a57b712-3c46-457b-f8d1-08dbbd912a4f
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/rLl+0tebWmsCcgor67QCS5g9VXsxC/WTiizLAIeAYE6I2ROAZMRXGpzPwFauo8+buBG/QUxL32hXV8WzkE7xAB2ugekBufB6GJK2PIrHa04t3LJ9Dfsm0BrPQpWANmz8Ea353PqDQ0ccjnx0JbnI2PThZhviP+WpqUpPLEIqJ/fAHBWRDO1giHtU8AiG7m8HxqH23Im+7Q6HhlmygsA6tnWfV/W3fTa1pmmoKgVhqyB9aZY7XJYwlwlmjUHv+LJ/ibVcrCWaNCdSzXUF7ypNtdommQBWsEBF1pNUmYjZC6h4rJ7D0YoIdnNOQcs+uYHVuY07+l6uoDJY51lrWkUoXV+A8ARmDdMQ5YwVEDMRoj5vmJsj8G2uV1dtZr9YFLN5Ui81WZz0Wt4gazg6m8eaIK9CSqsElU996ipxcrQhR3Qe4BwF/GzDl/iRdWndBjyMM439AsVyt54zCkZzNaQLQGGsnCrJ93IXkhfYxtaM4q76g4Eg6GFzzBmFQi6g9L93ZpUz4Izl+DT1VwwafvpoiB58uyUvCAOEJgFrM7StlgtbhkfZJW6p2o62oSECqB7XGfkoj9CmuQhgDB+5ePCoH56R/Pp0iBnVe5zsZfQdj+ukfuOrhLFtCTUkbmz+YPzU4goUb5H+qE0BH+SBOkWIw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(346002)(376002)(39850400004)(230922051799003)(186009)(1800799009)(451199024)(31686004)(26005)(53546011)(966005)(8676002)(2906002)(41300700001)(8936002)(5660300002)(6916009)(36756003)(86362001)(316002)(4326008)(54906003)(31696002)(478600001)(6486002)(38100700002)(6506007)(66946007)(66476007)(6512007)(66556008)(2616005)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWdhZFh1TW1PQUNsMWRjdjN5eTdhQ0g5L2RFWGlsVkhxQVhTNXpRRTFqNyt2?=
 =?utf-8?B?a0dTQllRaVJCdnM1TXBGRTlTU0N4VmNvRGFwbTNRSkl2TzR0MXJnVmg2NUhK?=
 =?utf-8?B?dXcyektpcW9nWlRwMnk5MitZRDZjaGNwbENyd2NWcTg4TWxnbFlnRktmdU9B?=
 =?utf-8?B?RXJhRmZYV09rbXVXWXJ0Y29aR1p2c3BlaWdrVG9oclhFNnVwOE1IWWVzWDZj?=
 =?utf-8?B?WEtPM1RVNG9hblpiM2gwczJZVmFNb1BMbEwxL051WGpnN213OFdnYkMzYUVa?=
 =?utf-8?B?ODVyM3dTeVNjNzYxRHVUa0ZXY3RzVDI5RGRWakhQNExLeXpvanNNTmVkeENq?=
 =?utf-8?B?ZmhrUm9OU2dmMmxjd3VlQkc5bFNxcWRrVEFYSHBMQVJGRUJuVWFwN0VVemZN?=
 =?utf-8?B?OTNoSHpQK2pZaUxHM1FNdEUyRVFyNzlMK0lxNThkcHlqRFlWSnV6OWhZR3dr?=
 =?utf-8?B?TzlMQXo3eTU0WWMvWGxLaEFVREJmUW9KcWRZTDJvZGVYZ2JhZVlCTGFZSS9k?=
 =?utf-8?B?dTJkcmtvc0dKMXcvcXMyek5PeUZadk1FbVExdXk5QW9yeENwdkx4TzArRTB6?=
 =?utf-8?B?eTNpS3IrTkIvdWROc0xuQVR0ZTVuNlNoTEdCYTlLRHNWOW5zVHptS3ZoOU5l?=
 =?utf-8?B?K0hoV2FEbHRhYnFXcW81VHBoT05YQWUyekZITDc3dTVJVFRHS20vREduY1dH?=
 =?utf-8?B?UFBnYnVtMllUOTVvN21rMmZXU1NIZTc2ZHgzbllMcUVPV2NKRkM4N09IRUwy?=
 =?utf-8?B?OHRiUjcwT2U1bk9ObXJlbTVIRU1kM1Q1TVVRblBzenRBMjhBNlNqNkR3aWxs?=
 =?utf-8?B?eTJrNGczVk1BbEJhSytlWTk3eU9lcXBUWEllb2RXYUtiLzJOem01L3IzYmRw?=
 =?utf-8?B?NVdNd0pOZ1RXeHRMdDRQVHZZYnBwK2ozUmZTeXRKU0NqdWUxNU5WVGJEL2RW?=
 =?utf-8?B?MGlRNmUvME90UG00Ri91YjVUVGErVWZ0TExJVkEycEZPdlNLU2NNcWVvc251?=
 =?utf-8?B?em1peWVSbWhSVzZXalh5d1p2cHVOM1EvU3JqSE9iY2Z2b3NxSmI5Ym1vZk13?=
 =?utf-8?B?d3pFemZaU0p2cVZZSGJsQWpDYUdxcDdtT2U3cTFPY2JCMVFyTTAzRS9zT2JX?=
 =?utf-8?B?UkJ4Tk0rMTBKWHZCSUxKbmtrL2pQdStpWjdrczlCSHdNdDRPc3B5NzV3OXdB?=
 =?utf-8?B?bDFJUkl4UzBFelRtWVJiOEdoRFIzYmJuM1pGUUFRUDVmdUY2ZHpIU2x6V2hW?=
 =?utf-8?B?LzF5MnZzaEg3NTFiYmlGNVhWTW5MREdHMHdFb3BOKytYdkZpRmVOQUdtZzFF?=
 =?utf-8?B?dExPMTdHWkpKeWgrV2dBRERvc3RWVEpXc1lkU0NFSW1TZzNILzVsZWpuY3Uz?=
 =?utf-8?B?RXA4SVR6S3FwTjY3R0dsRFBjaHlLREtSN3czOCtJbGk5TGowSm8ybDRsUy9V?=
 =?utf-8?B?dkxKcTJVaERNZFlYZDRyTkR6cWZ6SzVJdm92OWt3UmJ5QUJ6NHNOSHhFdlky?=
 =?utf-8?B?SkFaS1QyWFZXd0lpYUlWaWxEVHdmUE1jU1BMVGowRG1pZmF6THRMNVM3YVNC?=
 =?utf-8?B?T0R6ZTBZSDdOUFdmaHVRbmV4NlpWK2R0NWsycDlVckVtNFhkaE8ydnlyb0tG?=
 =?utf-8?B?MzJQZVJmKzhwTjNybllzWXVTU0RUVVM0Z2xhLzU3cEZPb0JBVE03YzFDQXFi?=
 =?utf-8?B?QjBPWHBRMW1reWVOMlAxWHRwMjMvak8xWVhEWU04UUhlVXpjOFRLeTF0NVh1?=
 =?utf-8?B?OUlFUno4Uk1heCtjYmVFWWtXVmJiWEgzYzFNMkMzY3NxelYzV25TaWtrNjNY?=
 =?utf-8?B?ejF0dzAwTW5qU2RMRDYzdTFNak9uOWFUMXJvdEJPb1JSb2xLM3IrN0ROOVdn?=
 =?utf-8?B?NkVNTTU3T2N0UFFDc0VuRHBUdjRFckttcmZrUnhablFza1JPTmZtRld2VjVP?=
 =?utf-8?B?VFdjUjdlNU9ITlhBcUhKRTFNNWUrWlJGY2s2aVRIRk9RRzJpSzk2amFHdW8r?=
 =?utf-8?B?ZVB5VkRKcmlzSXhmc3ZRYUpHMXhLTTFITDJHZnFlK0NsZnhMUEJtQTlGV0M2?=
 =?utf-8?B?V1BVWFZWYmlOOWFKK3I3cDdORU9wM2c4c25Uc3R5TXl4T1poeU01Qm5ydG44?=
 =?utf-8?Q?YYJFVxrPsPvYdld2rpefFzpg4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a57b712-3c46-457b-f8d1-08dbbd912a4f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 06:32:18.2096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h4OLsPAaxemtxXu+zEtG57VVC//uZ+9iX3QYQtTiYHLXb1jMJ56ufwFX9/eNKN5alXaI7qBRJgaXWgpElNIUaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7101

On 25.09.2023 03:25, Henry Wang wrote:
> Hi everyone,
> 
> This is the reminder that we are currently in code freeze. The hard code
> freeze date will be in two weeks, i.e. Fri Oct 6, 2023.

Could you further remind us about what is (not) permitted to go in during
this time? I also understand all commits need a release ack from now on?
(I'm sorry, we're doing releases only every once in a while, so it is
always good for things to be re-spelled out, i.e. even if they haven't
changed from earlier releases.) This, for example, would then likely mean
that all Misra work now needs queuing for after the tree re-opens ...

Thanks, Jan

> The planned date for 4.18 rc1 is this Friday, i.e. Sep 29, 2023.
> 
> Also, below is the (updated) critical items on my list for 4.18 release:
> 1. [PATCH 0/7] tools: More Python 3 fixes (part 1 of N)
> https://gitlab.com/xen-project/xen/-/issues/114
> 
> 2. tools: Switch to non-truncating XENVER_* ops
> https://lore.kernel.org/xen-devel/20230117135336.11662-1-andrew.cooper3@citrix.com/
> 
> 3. dom0less vs xenstored setup race Was: xen | Failed pipeline for staging | 6a47ba2f
> https://marc.info/?l=xen-devel&m=168312468808977
> https://marc.info/?l=xen-devel&m=168312687610283
> 
> 4. [PATCH v2 0/8] Fixes to debugging facilities
> https://lore.kernel.org/xen-devel/21cc28b9-91d1-1e6e-23ac-00c44f3ec08e@gmail.com/
> 
> Kind regards,
> Henry
> 


