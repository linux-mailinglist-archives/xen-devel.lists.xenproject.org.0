Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66206598603
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 16:36:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389638.626702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOgcm-00027y-E5; Thu, 18 Aug 2022 14:35:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389638.626702; Thu, 18 Aug 2022 14:35:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOgcm-00025R-AX; Thu, 18 Aug 2022 14:35:56 +0000
Received: by outflank-mailman (input) for mailman id 389638;
 Thu, 18 Aug 2022 14:35:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1x1s=YW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oOgcl-00025L-0o
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 14:35:55 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2074.outbound.protection.outlook.com [40.107.21.74])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0eff3f67-1f03-11ed-9250-1f966e50362f;
 Thu, 18 Aug 2022 16:35:52 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB5574.eurprd04.prod.outlook.com (2603:10a6:20b:28::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Thu, 18 Aug
 2022 14:35:50 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Thu, 18 Aug 2022
 14:35:50 +0000
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
X-Inumbo-ID: 0eff3f67-1f03-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YalLUltpJlVoRxb9JI086h6/g/vmxCRcBsSLM1rRwE4vWr9wKMgl0+7EHfgw9kW02F5JPxFCWEHwQZYxjMCChI7mZB5hA7OhI8pRxrCAZve33IHA5RRgOOQbCqZ9XuT+HxcPM34jd7xOPxDuo5Cj7u4QeznCv/593qqI+k/PpeBzGvMLX20mHD5CEOA6mmk4I4xyAHCiXmvlxM9LaBq6xLBcL0dCcwTc5BpmTfizQz2j/q5G22RseQarheEB6wkCIBnmHg+eh+1gOgpZ4Iibd/O7uJ+TTl+6wA9eAGrQC4mtRJnNn4FfcXjFIxCa1U1dc4fJoZjTXvT4ofo0qHW57w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YmZlVFccG7F7f4SXijI23mFVqjliHVMPi5oBHMZm8mY=;
 b=QCR6Nx+eooiy+fZzOqiZjceP+FT4tGrxChHKIiUPxzit+gt5anpvOAFfyY6BhgYMfGoNnS3goWvdRxR+87dLXpjYFvAg75QGsw7oW6/AQh1v8bL7Ls/ZE2KHuRizsaue4LhLaZbommokZ0V+2+Osf/vvo04R8QhfJolbeg9FQKRBoyrLwVIAoIh2/CsO8BJbr9or0taiCNqzZ/q0g//qzhrxDe3BDsYV6IAGBG4ofk0htxGaUnTcr24dDUL0ToHLBThMHBI+lD8XOZtuFRQCdVXKVmcq/tFgqSL7hjDVYT4s+Jh45mz9bkHNQa/DtaK6eNi11VR/no3sz6iRboFFmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YmZlVFccG7F7f4SXijI23mFVqjliHVMPi5oBHMZm8mY=;
 b=RY78zV57u2MTdUSvcnK83A926OSXIqvRKt84KTGOhfkXc9NPk6iEQGhKzQr+yvczoBFfGfCWn3mLH36DzI2nWUjqJFndYyBJ24JARra9mRyr3m/HWMDpypWcFx8Q7QrMxRlqnIGkiiqkw2HXw42gxQx7HuUFESizTgf1mSROhDZ9vrIygntJawVfmOcde6X9Vhtku9mTM4cPERZL6qTVsQU4vzShcedwdawILZgM/k4x9WNuEITD/oZ4b7wniO5G8HzRvyXIVWZG+Wuce7qMXJD8CFCJkPPTE4UlyDRuJ/ZHn79K19fPDnWb9V4f+fUbRqnobe0pLknrQPiGqLYc4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d60e2359-6b28-ab9e-0398-e88a1804a233@suse.com>
Date: Thu, 18 Aug 2022 16:35:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/3] libxl: use time_t for qmp_synchronous_send()'s last
 parameter
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Anthony Perard <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <68e71e3b-19a7-e062-9ebe-2e6f6aae0549@suse.com>
 <9ac207d1-8a20-b880-e564-57494bc5b551@suse.com>
 <6dcce6b3-7da3-1c65-0aa2-f69854619226@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6dcce6b3-7da3-1c65-0aa2-f69854619226@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85c74b57-fb6d-49aa-be70-08da8126f2a7
X-MS-TrafficTypeDiagnostic: AM6PR04MB5574:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uOk9p+OifCe3dZPeleIpnbQEVox6uT6VL3DMcS2qdQWw5tVVWHQJgF2lwD/yv8L+8mGtp9L2KEk0E/4Nb2c5T1Tf0OzlfdeYLqMvF3nenKdR6JBxDe5TcJOvwXvcENHEU0eqIe9HoR+pYPqSwgu6ejxoi/fn64mR+mk8d/Y7ydjDWyAvyUQyX6sRO/xhsz97CZBBbveMklrj+2xKWyPLFLrDfqPQpEY+VOKJDavFsZy8TiCZ4M2mW1G95mWZhYa+veHguW0Nk9BI3N9obUsQSS0d9cTZjfQz2DfBcZW7fW3/oilzreoTY6lj/Ys+D82CXmPlYhDyQmXoNtBmBbZqdyEmfutnCOfTbk7iMSQYJJFGMKO8aNNkCiWJDYmLOFExh6U8F61Nyj8C8DRBYt2EPjUjWqxdEmVaNwshTOf1juEIbUoTz3gPBrmPXnykeg6gs2pFNCqm0dzem2CpMD7LskpLptT/gkpHH/IySvdVAC+QMrI8v6oHk5zUgw6S4bSGptaQu2vWnHJB/0l3aHONtOuqUKgP22ylvZV7F9jKnHmn0FCgTLDpoMtGG/3Ut46ujWnUripgkXTBHC/+P+F5GsKS/RxdC46Z2HPE3JFxh/k5gu3KMWqAwkj8tE5LFzBitLqzPWdxSo9IUefX919bxIR+BasWcRYkkU+HqbPQ4D9uQ4UWTK5KfIr20QZCNrbBuh9scloQttc4XyG7Pb9qzide1+GmgT9OjX3+ivoFHOY8m8Vi3RrQ4MJ7u+w4vTOV/jyReYLQSObIoK3aDCjoyGnBYnbyKqeCDgv6+UfLFcE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(376002)(346002)(396003)(366004)(136003)(26005)(316002)(6512007)(4744005)(6486002)(4326008)(8936002)(38100700002)(478600001)(6506007)(6862004)(53546011)(31696002)(186003)(66946007)(2906002)(5660300002)(41300700001)(2616005)(86362001)(31686004)(66556008)(36756003)(66476007)(8676002)(54906003)(37006003)(6636002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1ZvcHRaSVZ2WXJMcGJrblloK0JOWHJ0MGFNN0Q3TFY3T25ZQkFlOVk3Zmt1?=
 =?utf-8?B?TklIZGNVeDdNY0VxSytWdUhvNlVPM0kyTzljMjd0dVk5bU9PRFBFTDhhcGUv?=
 =?utf-8?B?U2s3a3daYXVIWW1tcDV2b3NqcUY0SkVHREtRVnhHcVFHZDNNZnFZa3ZKc040?=
 =?utf-8?B?QVNERG1JK1FKOU5FVGRNV3JEK2E4THE3SUFjNDdmWTJxdW9oQnRKQ3ZJajlR?=
 =?utf-8?B?YklKdVYzWFhyNHJLNDl1Z1JBeTJQSS9WZ0ZFRUx6dHMwbVZqSEFZcnA2dUJt?=
 =?utf-8?B?YTdGM0V4dk5MVGcvQlAzdzF5YnUxd2xTaWVVaVpJRVY1bEpVQzRIbXo4WUZ1?=
 =?utf-8?B?VzhpRXNGY3pBNlBRaFNhMVlPNWxsWlVQQXRKTWt5N0Rsc0dGbklDNUphOU1H?=
 =?utf-8?B?QkoxOFpJRVNpMGVQSXRlZEs1S1FEcE1MaStJN255NWRub2pkWWNWbWNxanZi?=
 =?utf-8?B?MllGbmg0azNkaWp4dGJ5YmNwRG5xNEZWQkQxazJWdWtsUm1FMkhJdDF3VVBC?=
 =?utf-8?B?NzdoZnNRQTZpbzVOVDZEQTRTYUF5SXB2WDBXR3NuRDhGZFdwb1JZQTZOa3ZQ?=
 =?utf-8?B?K081VjUrR0h2SGZrSG5yQlE2UTJVQlFSMVBaS1gwUk5ETzJUMU9OeC9oRnVM?=
 =?utf-8?B?Rm9EV1FmQlJMZzhSM0V2K0NNRnEzS2ZEMmFPNGl0R0wwbU84cGNsWURUd2Uz?=
 =?utf-8?B?Yk94bXBIc2sxaTd2ZkRvQW9sRDF6eVlVUDFnN2RoOUluQnZ6L3VLZ2NqUE40?=
 =?utf-8?B?cHJKOTRobzRoNVNaenoxU2pyZmJEaE56NHJHVkp5QStack14ellrOGd0WU5C?=
 =?utf-8?B?Q1VDNXdoVjY3L0w5YTJxdVBQc2dYVkRWQitHWVVTRENUVUM2QWJNY3JHbmRw?=
 =?utf-8?B?WEZUMHkrcFNkSTFnNkNzYTdOaSt1eDd2ZmdzanczTUJmOGp6VG5iUE5BUEpZ?=
 =?utf-8?B?aktaSHZ5TXljS0RrUGkzVll4RU94M2FYdzZaNzJzb0M3SWxVQWY1SUVqMCs2?=
 =?utf-8?B?U29OWTd3czZ2dnZxRG9tdWZuUWtLZ2pzbUdvWjRRWGVjaElKdWxaTVRDNjBi?=
 =?utf-8?B?bTUxblptU29sa2VlamhJay9jdldjWFZibWcrSWxtQlNLZmlTNE9NQWlnOWlG?=
 =?utf-8?B?amlIbHg5elBzS1FMaUJRZmprQ3EvYVh0M0RMQjFkZmdjcWVIZTVlQ3NGTE5k?=
 =?utf-8?B?aVl2aTVzSHhLZHVKK3JPZVFTeVVxdS84bjBIbm8vYWdHVGlCOStSMmpiZ25x?=
 =?utf-8?B?MnN6QVZiYS84OG9nY3R1S2hFNHZobk9scm8yQ1RlTEJ2VDlNUCthNWVHTktH?=
 =?utf-8?B?czN2RnZ3b0dMcTljKzk2S1c5UTFYR2diU2EveVZwUGhJNmVlZ2ZnT0FwU21F?=
 =?utf-8?B?WUl6TXhhZHkwQkJ1cDcyNkZrTi9WZTNsd0JZNVkwOCtiNTVIN0xOS0ZFcWtx?=
 =?utf-8?B?Mk1CdWVaSDlvOWpmRXNGdVlCaklZdmpLUVREeWdiNjlDVU51OW93MHlOZGMw?=
 =?utf-8?B?Tk44TndEV0phUzJSRngzLzhBQi9ZOGZ0VitpRXBvbmtLTEVreTZpNEZ6RFVL?=
 =?utf-8?B?SWR4bUI3b29ZV3dnQW5YT2JETkp6Z0RPRFhyek1MM2hEcitwaFM5djFLM2VB?=
 =?utf-8?B?R1VGQjFxcFppdHd1bld3TFpUNUVkQUhkRlpBaEQwcFJzOG5RdWQvckI0cjZm?=
 =?utf-8?B?eDYwQnJ5UTBuazhic3ZERXF3SVpnUzRpYjRVaTgzRitCT1M2RGk4cE5CMTRN?=
 =?utf-8?B?alJacmdnRGJ3OWEyWTJEdm1iaFVaVDk5cE5FSGFoZXMzb1JzeUZyM3plMkxa?=
 =?utf-8?B?Qktad1l1QnpOUGM2VVV1d0lvSzhRSElKYjV6OGs1ZjZtYW1qUzhwMGZocUlx?=
 =?utf-8?B?NFgza1N1eUVHelFaRlNWemZWM3hST1JkeldndjNjZGMyL1lJU0N6bjRWcEF3?=
 =?utf-8?B?MkRjWXhEUzRZcE9iRVhkRzBXeDRuUkl6QUEzQURybGxtTWczN0dvMTZxT21r?=
 =?utf-8?B?dllGcXc3Tlh6bTJlQzh3WlBxOWdiaDlFcGJFVUVZVUVWVm9iaVJRc1ZSRldI?=
 =?utf-8?B?QXFFSndGMURFQjh6d2ZQbjhSU3JrZFBPNC8wNStCVThMSmFsODJoU0d6OWNq?=
 =?utf-8?Q?8aKwrJ2UelmUXjDWogOhLS8D/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85c74b57-fb6d-49aa-be70-08da8126f2a7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 14:35:50.7416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: StBjaY7/pL/jr9N9NE8//aV5jO25ANr4nmVIQcXmbtseL0l9aWSfRgPjn2jRnix271JtrD+HPjD2OsZL2GXgIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5574

On 18.08.2022 16:20, Juergen Gross wrote:
> On 18.08.22 16:07, Jan Beulich wrote:
>> "int" is not a suitable type to hold / receive "time_t" values.
>>
>> The parameter is presently unused, so no functional change.
>>
>> Coverity ID: 1509377
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Thanks.

> The severity of this issue is rather low IMO. A timeout of more than
> 60 years not being handled correctly seems to have no relevance at all.

Agreed. The tool can't tell that a time_t-type value is used here for
a timeout, not a time stamp, and using the correct type is Generally
Better™ anyway, imo.

Jan

