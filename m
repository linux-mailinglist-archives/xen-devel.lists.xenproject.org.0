Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AABC646CAF
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 11:26:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457020.714850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3E6D-0005ni-72; Thu, 08 Dec 2022 10:25:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457020.714850; Thu, 08 Dec 2022 10:25:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3E6D-0005lg-3w; Thu, 08 Dec 2022 10:25:53 +0000
Received: by outflank-mailman (input) for mailman id 457020;
 Thu, 08 Dec 2022 10:25:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u3z7=4G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p3E6B-0005lZ-RG
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 10:25:51 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20619.outbound.protection.outlook.com
 [2a01:111:f400:fe13::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afe7b0a7-76e2-11ed-8fd2-01056ac49cbb;
 Thu, 08 Dec 2022 11:25:50 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6970.eurprd04.prod.outlook.com (2603:10a6:10:fa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Thu, 8 Dec
 2022 10:25:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Thu, 8 Dec 2022
 10:25:49 +0000
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
X-Inumbo-ID: afe7b0a7-76e2-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A218SIT5VuY/V8e6F6/FTe+x/cJGzpR8ulWaZ9db7hV1jnZj5HD7+PX8Rqft/5+5YSjvlixxVoqZOe8WBrzA2UvmErVDmAyEANJEsEpam1oyy4YQWDp9nbFWTWUQzi1Bje8vCNGLHVmMFbf6K5Nvm68A8FM/WwME9A1ba8O9POkxl6H+hGYCRHK80OU4CU6auvAPlrl8PZUsqffoSdRjDRqNe7cWdILZMnDP+E9oOk1UOOqXsneoXpXQphJzEeTw2PBG+8ZH7O+6DFbIMErpjM77AP1PDNyfy0tyy5FuJuzsc0de2k/hqrsN7QKXmo1SG5ixViVIAcR1MWI6LQQqvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eNTHA+xcYq+ZCzQaTWzQeqO2zRQduUYH7N1HUd+X0cc=;
 b=HYRu+Hf+blly7ORVr6049UQwWYyLEbbhWlf0VmB6kAka10K2Zzub3ui4SSW4OuJ5sEaR3pwiC/8I6YU8un46K1CdlpYcT+yLia03zl5X6VBCGiAj+gA6+9T93Ts1OtCIFbWDNY/CG552rKP9JS+aCvecaY4STKwqblh39HpIK3HUxgpkeFCaFuW2zgAphV09rTNNPqD0wciH7fSZyttzvU0eo1Gf0KUw52FtfYqNJPOv/GOvFOEHIWuil0wgASW0kQ6aFUpvpkocyd3NEzuzHrNCtDp+y/2Yt76OIEUaD6K4xDntx1QRIGzMwuBHVZe2Xz5Hg7Bkr7miOWecQZUnlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNTHA+xcYq+ZCzQaTWzQeqO2zRQduUYH7N1HUd+X0cc=;
 b=XjlJC6WEyKE0YZ0xM8tuhdoD9qE8FDNzc7L6RbyvpNl3Bn76PtTyMTPW09gWGfi1IEOm+1u9v+ROvPTNysMPH4Gl0BlqS+9HEqUiRPeYntCErJtLJXDhkUt/V+e9CrMLDY5mc1CA/8vRym3Ov6lH8ynA1PtekxC6LmWpTk+8p+GqRDtY5JrfEpkUxdhFrr0XKg+jf5juxlEzBFGghoy16AyFB6QZurG1ji2hZgGzBGvnjUFKTMWbAgAsMBp0ky5aYAlLa+bCpAkvCnJ7OlsKk9TmrTeRkHgwrIuRSS1659oSgo5DHXNBGZuItOesQfD6BebQaOZBJk+bSGIyGAx8yw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bc468209-efd0-eddb-935c-81583f8dc7d9@suse.com>
Date: Thu, 8 Dec 2022 11:25:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: preparations for 4.16.3
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2c4c605e-f8c5-abbb-db85-89465b7e10a6@suse.com>
 <7aeec9a0-628f-d1bd-994d-343ab7f8b85f@citrix.com>
 <d628796e-3b42-5d50-f8cc-039743d23057@suse.com>
 <45fcf658-c353-9fc5-e343-64a5f6c1f0f4@citrix.com>
 <cf42f44e-f96d-bde4-b4c4-8c08c14b1939@suse.com>
In-Reply-To: <cf42f44e-f96d-bde4-b4c4-8c08c14b1939@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0178.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB6970:EE_
X-MS-Office365-Filtering-Correlation-Id: 84e044af-e87d-4624-c020-08dad9069324
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EcbqHhXsfJq0BTXkSpdxU5/bJhi4VRAwSMOsv91E2u4qm12dAxA3f+2SEpYjK63lsmocBMYaUQE9yLhnNKv+d1W8QW6pmb4Ox/bd7N8vpRYClNm31BlltmL42TJuCWCWFn9CseOTahsk4uDtS6gNdSeGZcBpkwbDGMoKVEnQiHMSH4Vx87JTJt5XEmNxXot4vz8q8UmPrS32bZzWkLrFgqpLOtEDvBze3LmWUxE38PLYamLSCXYBSt5bvwdSVtNz3Gxn2MfpeRwiGGtHTPLWXIfh/cNQ4WM8s/USiJDxJfRNdy6ZU/8vdYw4Pto9VSDg1c69IyhgmlBxRCgui6bE/3N90k+ASHVHAziQlJtVD2kygG/5z1pYjybRD+gVEPS/5e4iIuuaWqBCidv0maEriyqyWAx6P9vqUD337ZESlk8KHqdpyWB0q1gVSkGHZXoP/iSrlqbCNDZNl8EODx5W5RHd31FmrbBuC4DSncFwDGoYMU9Mb51qu+YPhs6Pe25REiHUjC1cYZA9YTi9iIqkfnttrPOb68KTGI1lsvLjuXTcEUFhwJwdmwzuhEBuk4FpCVibJE27gZYyvLwqU7FhJm8qNSAUwHK9yPVi2fZ0AstKe+dkYWZIJiGIhil31AzKshSP/piGEk10QsAfD/LeEqiOoMvH4Et8384FK7zZC2ERF6+fVW/V7/WdcyGc72ChL90/0W4fLJFjoTHL4ku8NRkpJVI5kzWKULiE2+UOqtY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(366004)(346002)(396003)(39860400002)(451199015)(7116003)(8676002)(36756003)(8936002)(41300700001)(66476007)(66556008)(66946007)(4326008)(5660300002)(316002)(6916009)(38100700002)(83380400001)(6506007)(6486002)(478600001)(186003)(31696002)(2616005)(53546011)(86362001)(6512007)(26005)(31686004)(66899015)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0I3a3REY2FaaEZnUlVMZnBTK0orNEcwWVNBbXlmTnB5THlvYU9zUmNPUENB?=
 =?utf-8?B?RlRBUTgzL1IzUlk3SGpYc2tGdTlLUVN1R21tY1EwdzVNa0p0Qm9yUnNOODFj?=
 =?utf-8?B?T1FNclhhaUN1MlZiVUpxSFdaWkJvWjRLekdMTUxYdStyRW85cjZlTjNlL1Fn?=
 =?utf-8?B?NHlqdC9nelNCRTV3OGJDYmFiRVB3ZmxPRHUxNEZicGY2Z29oZlFBK2o1ZVJW?=
 =?utf-8?B?MVVnM2VTUE5nMjc5aWdVNzIwUVhpY3pKV2lPSkoxSS83cTRPZVNTOEw4QmtM?=
 =?utf-8?B?M2lTdEdyaTc4RVR0SC9vSG13aXBHOWhhVUJIdE4wS1BoS2pmNklIMEhXbjA4?=
 =?utf-8?B?S0orZzI5Zk9VbnA3SUJTWC9Wd3JKUnNIUUFYcUh5WmcyUWVHOUpVQndZOHBK?=
 =?utf-8?B?SjJxdEp2NE4rRWxmT2sxZXRCV285Y0dmNVJyc09uSXFoTTJuVWlZcjU5UGdq?=
 =?utf-8?B?cnJqSVpWTmlIVnlFN0VsTENtRCtWbkt3MVg0RGtZU1dROEN3TEpWZlRsT3FK?=
 =?utf-8?B?ZklCR3FyaHovV04rR0pRU3FudDFtaUIzZjI1a05EUzY0NnptZHUrYWlhQzhT?=
 =?utf-8?B?SzF2NFJpQzYzd01hWi91TldRdGI5Qk9Xa0IxbVRiYy9XUU1Gd0lkTFlld1VM?=
 =?utf-8?B?cWl4cDBNdzlHOE9UZGNaK1hoL0VqNzJqSDZDODIyN3JSQWRwaTU5ZkRjc01r?=
 =?utf-8?B?RnhTbHoyQVNXNE13UDdITlZMamFtcTJycWZLVUIyNFMyUG1Pa3pMUi9JdmNP?=
 =?utf-8?B?QTlRU2dENGQ2eUYwRS9xb0FjMGdUbURMSHF3QTA5dlNPNXV4TDZXbGU4ay9w?=
 =?utf-8?B?Vy9kU3pEZ2dCa1l5SllwM2VvM3RUbXFoTHVvdXJTajdLUnRWNGw1Y2YyTXYy?=
 =?utf-8?B?L1JBT3FNS09yYVVvQUExdEhHay9qVkhOZUFGZnQwa1NEcG9tSGhza1E0emFH?=
 =?utf-8?B?VkIrN0ZxMEdkTTI0NEgySGd4RXpxSDg3T1poMm4xeS9zNFNPNGxFNGNqcXRL?=
 =?utf-8?B?NlcxdERzZk1ZVTVjOEVhV0FjT0t1Z0JJLytleFhZWVZWajJPQmNwZ2dQRG9z?=
 =?utf-8?B?YWgveE5yVFRrN28zSDNRWm41VlpnSUVqMnFtR0VEMlRDaWVhN0hieGI1cVlT?=
 =?utf-8?B?UnJXRlR6NzFYenliYWhYcUtXS3hPS01QSWpoZFlOeWplMHcxaDBxUHhpZnhG?=
 =?utf-8?B?RklHZXlqNUducGVxVnhPQkVudnFCMTNaTnJMUndjcnpHMWNCL1lDWUtGcUF0?=
 =?utf-8?B?aVFhY0c0RUk3Z1d0QlJXYVpwYk9XYkZSTmlQS3M1a3FNMVlHRWhDZG56L2RP?=
 =?utf-8?B?eGloMk1Ld204di9QV1dmNnBPME5kRGN0UUdURDRzUWc5VWlDOExRN3MvSjdp?=
 =?utf-8?B?OXpVWGovTWk5YjloSlArblN0VDBjdzFlbTQwU29zOTV3UHJNM3FWS0xoNldU?=
 =?utf-8?B?b3BBZ3FJOWNVa0ZtNG5JSXUxMjQwWnJVTHByV04vUXVGYWF4QjczYVljOTNt?=
 =?utf-8?B?cFA1Qnh2S2pqWFZSVGVGRjUxVEdpbUtrU0w1STMxQlNvT2dFZHYrdk9WNUVK?=
 =?utf-8?B?elgyME1VZG5LV21NbE95a1FhZ2pGaHdkWHd3ZUd4MFRpalc2Q3hlREtqUG45?=
 =?utf-8?B?NnpyTXZBTW96c2crcTV0NXRFdkFUMDZXeGFVVjhtdVA4MmxRb1Q3RXNqY05S?=
 =?utf-8?B?bnpWUlNFckE2WndsWmd1MnpObjlCeUtmaHFSWXRtSXQzZXJyWkZ2eUF2UHZV?=
 =?utf-8?B?OGpZY09yc0Q1QUtlb3p2K1gwUEt1Rlc3RG9ZYUJpaFczNTM2S29wdytKNysy?=
 =?utf-8?B?Z1NIUHNhNGNxMm9kQkFmZXhwQ0JrY3ZoMCtNYktaQy9OenFnTWxSZ0dveDBm?=
 =?utf-8?B?RjhKNHRDMGYvdEY0K0ZDT3lWZGc0OXlBaE85QUNZQW1ob1dhTjEzZ2xlam1q?=
 =?utf-8?B?ck5hRm54SW1jY1NuTGpqdHFxZEN1aXJjTEo2OVZaKzBrM3VyVFExaExYUHA0?=
 =?utf-8?B?ZFJBQ0R1VFBFMGxpRTU1Y1kralFuWDBRY1dWWHRCbU45RGZ6NnRCaWZieC9s?=
 =?utf-8?B?QVNFeVdjWUd2RVNvbXJpajQwYVB3UUZtMzNOMmxiMXVUYzVzNlg4NktTcnNl?=
 =?utf-8?Q?8wIfvpJQicJ+s7InOVcmRrIpq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84e044af-e87d-4624-c020-08dad9069324
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2022 10:25:49.1942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4kbi7fBdbns41mcuT8TCwHOaW8YHbBQWlCAe/9A+PuNgkd7tf0YRqFBkOadi9RrvLLwwRrw50n5kcKX8k7pUIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6970

On 02.12.2022 10:16, Jan Beulich wrote:
> On 02.12.2022 10:11, Andrew Cooper wrote:
>> On 02/12/2022 08:26, Jan Beulich wrote:
>>> On 01.12.2022 14:20, Andrew Cooper wrote:
>>>> On 28/11/2022 10:50, Jan Beulich wrote:
>>>>> All,
>>>>>
>>>>> the release is due in a couple of weeks time; ideally we'd get it out
>>>>> before the year end break.
>>>>>
>>>>> Please point out backports you find missing from the respective staging
>>>>> branch, but which you consider relevant.
>>>> I have a whole pile, all to do with (o)xenstored live update, but
>>>> they're sadly in my pending 4.18 branch.
>>>>
>>>> Hopefully there's time for those to get into staging before it's too
>>>> late to include for 4.16.3 too.
>>> I see you've pushed a bunch; I can't guess though which ones you would
>>> intend to be backported. Depending on the size of the set I may end up
>>> asking you to take care of cherry-picking. And of course I'll assume
>>> the oxenstored maintainers agree with whatever set is intended to be
>>> backported.
>>
>> Yeah - very fortunate timing yesterday.  The answer is all of them, plus
>> some scattered earlier fixes which did manage to get into 4.17, and even
>> some subsequent ones which are still pending for review.
>>
>> The major bugfix is keeping /dev/xen/evtchn open, and the preceding 8
>> patches are all part of that fix, but "not losing the critical
>> information when things go wrong" is important too.
>>
>> Perhaps it would be easier for me to prepare the backports when the time
>> comes?
> 
> Well, yes, "all of them" certainly was what I was fearing when saying
> "depending on the size of the set". So yes, please take care of the
> backporting once they've passed the push gate on staging.

You will want to have this done the latest by the end of next week,
ideally a little earlier, so we can get the release out early in the
last week before the year end break.

Jan

