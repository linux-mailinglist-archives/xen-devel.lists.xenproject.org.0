Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B72640308
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 10:16:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451640.709430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p129X-0006vd-E0; Fri, 02 Dec 2022 09:16:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451640.709430; Fri, 02 Dec 2022 09:16:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p129X-0006sf-At; Fri, 02 Dec 2022 09:16:15 +0000
Received: by outflank-mailman (input) for mailman id 451640;
 Fri, 02 Dec 2022 09:16:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JFaq=4A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p129V-0006sX-5L
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 09:16:13 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2199a8f-7221-11ed-8fd2-01056ac49cbb;
 Fri, 02 Dec 2022 10:16:04 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8127.eurprd04.prod.outlook.com (2603:10a6:102:1c5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.21; Fri, 2 Dec
 2022 09:16:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.023; Fri, 2 Dec 2022
 09:16:09 +0000
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
X-Inumbo-ID: f2199a8f-7221-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y41bVz0yYWmMcXhCWgy8TxnP3tCohTUtZ/M4Sp9vviPqLPDeglRJa8jO1mUh10vg+WKSiXXezqtjTK7Q0H3C2msYAur7v60eMkFf7A+MXhJjJErqWVAqHbC/plJ3Fky4arJSYe8kaNPWpjWZrb5ZoQASJXIG4Y5vwKLY7p3klPwWMoibYO5YLCqQG6bA3IbC4dpOmQ3+ALb1CoGd/kPDA7HV4SjBGgBOgfquj2/srFQYBsnJcYislF8Hvxsdm1oBZCTn5363Cw1Q7gdou/1TlV+/7PdE0LiWjui4PiMShw8Mg5V2Dzjti5xmJHS95coTkuH7thjhmwWfb4lBM63Bow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xravWeuT/7MDQRjQhpq/rsJAO6rEZe7B0+qBR8biXtg=;
 b=YH3IuiHelP//LZuiqYf7eBYqRAHmx0S8BOxOMaLrNtqPZwYEGxQDhPRqG6NM/1umfnDNL9SCG4uPmebnRlf+aadmxshHb+4xySv1/nPPvkxyGoeeXQ2F+nlmsdrzzyRZGUoqucGZhpIGOxs2cADLBXeLHzdHtZ15kFJAyGu/DzDMkLI/ZtiEiw7Xu3ouX5uzr4Vmt+RdCD2bkxuSM2oF/M7/ZHsStm4FzLpht0dxE1lp2ABGvuXApxVJHEweBP5x3X1804XuDlHEFdnpht4fH6bVTeJIsJFXR+8FxbZMOFMEStclIz1xbh/PFjvQeDiH9T6VmxelFNKZeG5285Plww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xravWeuT/7MDQRjQhpq/rsJAO6rEZe7B0+qBR8biXtg=;
 b=yNZlbQ7drxmkczDEEKhq8c1oBU7shEIrJomifS9tIiJg2OB0evQfZkuNqwLGCqrc3eDtp5FTcBPjJgpkwMU7Cd1B6xauAekF87KMXIHxjO8uRXOQkEhL2zdtN9Ay+ZrpsawfyKMAsKSOVBiItzAa0zIwMCB9OS3QzmbFFJZoCLST56i+6bNBoEA7XyefTIC2ZWfQGUJBbRL4bIzj0rH/CjxHh3mrfEMYSYgyuZO8jbuLOTx5rDV0nIjFmGu8te0KpGD0Za1ohKnEd0aKFoI4pO+szBFW/0VsPFlqP1jW7RWuEEZj3Jq3v+5w0jfLozg4ZWS4ijtieMuSahkSKanFsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cf42f44e-f96d-bde4-b4c4-8c08c14b1939@suse.com>
Date: Fri, 2 Dec 2022 10:16:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: preparations for 4.16.3
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2c4c605e-f8c5-abbb-db85-89465b7e10a6@suse.com>
 <7aeec9a0-628f-d1bd-994d-343ab7f8b85f@citrix.com>
 <d628796e-3b42-5d50-f8cc-039743d23057@suse.com>
 <45fcf658-c353-9fc5-e343-64a5f6c1f0f4@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <45fcf658-c353-9fc5-e343-64a5f6c1f0f4@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8127:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a5bc88a-3475-43f8-1cf2-08dad445d97a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YmC8sEkDJtWF6AHXgmQ/XvKtcztyssmBgzF+lApeGwyYThi5d3n+kZY16VGS9i/X2dVBOOwG6kJjrNIxT0+PM4/3JxfeU6fvhY+VsLJ3uIH+eZCGpv+RSbpTAW74eNoSzuaQN4h71qx65e6k/dN/INcps3v+KnudPEDHo3hhRYeAM6Q0G3vVyphAbxn6QO1VWMFrSS6Tslx9RPbxZdk4K4g6OXjrMCA6VpyMGqousbB3P9NAk+VyQ290CTudMjVHJaS+NkCslcwPRhf2Kw3J7eE/zg0EDL9G2BtbBdL99I5XBZ9kcT2qivH464nYbBEXlGPzWyHyN5rxQhrRVfFGHcuEAbhJJCN7frjxEnLidGiILMJXwUFhU7NSZG0XT72uUGBvYVkhsGBbQ8NCl0wB4f8e7FfKN0fNgYUvirP4pFO5MUVb9MtwjCMIse5b3mwnSy4WNZgdnSsv0y0O4yNxyRhfBV8Mp7zlGARYY1a7ZauVCtZGq4SJSSKZ1LnMxYYKUUjsDY4zHSdVXN9PSR3QWjVZYnAvyS/KxvJafyGvYcghw8wC5ftSqes8YCIfimC3UjAgXPHfZMwj0rF8gxZBv8NFEjJS73dv0F2j+62HDGMwECAYJng0sJthWCSzoGHXgVinZvioNj4+Zxj4L0rYiAIaeE/gNsjzbu2fPi91fyDEBOcwsJiAxeMvcRcqaGntj6JCfNpt6I5xKvmMvg+QyVzyp+/ECJgHvWk+UmUu/4Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(136003)(39860400002)(366004)(396003)(451199015)(8676002)(4326008)(41300700001)(5660300002)(7116003)(66476007)(66946007)(66556008)(316002)(2906002)(66899015)(31686004)(8936002)(53546011)(6916009)(6486002)(36756003)(478600001)(6506007)(26005)(6512007)(83380400001)(2616005)(31696002)(86362001)(38100700002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1liQ0QwMnViVXNuK1JndWJhTDFmVXM2VEVuWS9Cb3gzZzdEQTRibGJ6MzZE?=
 =?utf-8?B?OEZlZUpTbXllQTdDUnkwQWhaSkg3U29oY0pwK1piZnc4L2UvWnhpcWFSbGZ4?=
 =?utf-8?B?N3dLSTZqdTBsMXpCeHlWZjZCYW83VnR4dmhNcUxZZjlLRm1hbGwyMzFlRzRS?=
 =?utf-8?B?cHJDalg5U3JkTG5rOFIyS3V6VDNZL3N3dXl1QlBFUHU3dHJUNjlUTndGSjl0?=
 =?utf-8?B?UkpLelhBTXN3cEovaUV0bm92UXpHRlU5U3loR2hyRkszNVNCUDlZMnNuMHVG?=
 =?utf-8?B?bmlxVVVNVjI2eXFySU93dEl6d21lYzVYTkxWUVRDa1I1SDR3bHlCMHQ0M0FU?=
 =?utf-8?B?OUJPQzcvaUVuREpDQ1VWUTdKcnl0SkZDVDJOL3hEeXBkckJLektXVngveXVi?=
 =?utf-8?B?ZmxDN3VwanQwZjU4bWUxRStTZTN6SU4zZG45RW1nc0JZY2tGWTBpV2xoVDFs?=
 =?utf-8?B?WlNpQUdNTDBhdW53dGVpd0hxOVM5aVY3aWowOFJpYmxVeHpqMFpDM0ZnemJR?=
 =?utf-8?B?WE83L3I2dTdVWCtVUlZBSkxIaEpPN3p2YUtkMkJmZkU5eGNRbGRtRHNwNzFV?=
 =?utf-8?B?ZFVIVkNyNEEyQm1KZ3E3MWpoYjVmNDFNUWN4aVFnY3lxWittRStvK3QwaFEy?=
 =?utf-8?B?bG50OGpLblhMcW14bDY4eEFJMGljZTlINDBhdDNDWjUvUEE5VGxKRGlxdFdJ?=
 =?utf-8?B?MU5sTC9nU1lLM3ZkVXRCaFljd1JiRXZDS0hocjZIYjJjOVpwYytHUHZhRjdm?=
 =?utf-8?B?WTRGS2VGaktDSlhlUFJGWWYrc3RlYytCWXRZVHdYOHEwL3NZMWIxRUZGNHBW?=
 =?utf-8?B?bXhpSVV3SUt5K21kRC9JQUJLS1ZSVkcrT2RyL0NtQ1VhVjA2c2NPQldDeU9q?=
 =?utf-8?B?VTNBTjc4cFhieEYyMlNMc1lmeVpoSGZUK0Q1Wmd3cTNhcmZYa2dUcXZxMFZp?=
 =?utf-8?B?RDZKUnh4dWNyK3BOaVJjY3hqdDhQU1lHN0ZUNWdnNHBSQTBjQTdRazh1UmRO?=
 =?utf-8?B?SFB6NC9OQ1dtWWducG03b2xDVGtNVHdIUUhxN05VcDNDcHA2dGp4aDNNV2Mv?=
 =?utf-8?B?ZUo2R3NXKytISlYzSE5LMFZYdFFtN2R4MVNHUzJLbHVxNDlMN21uWXRWVlZo?=
 =?utf-8?B?cGNzZWM1cE9HRTNCZXM2YXIzeTQ0M1BZU2prWVFCSEtTWkJ1VjVjRG1LNXFJ?=
 =?utf-8?B?aXVpdVJjSW9JYlhxQk9GbDNFNVhIK1RCUUE5dzJRK1NmMmh6NVFWWTBjN2dq?=
 =?utf-8?B?MkJYcjNLd1ZvYXh6VEdNVXhFdWswVkY2Nk1WNitkMWF6bmFLczdZOEIwUTNz?=
 =?utf-8?B?TkFvenBud2ZXTEJTd2xTM2ZLdGEyWStZQlZRaUJLUFdQa2xZMWVtZ3ZUVDdH?=
 =?utf-8?B?MVM4a0kvVVFHcEtVc1Z6dzIvTHk4VERwVlVLek54VXZodU9wY0JhTjdFVUFI?=
 =?utf-8?B?c0JNWldjQm8vc05qZnJpc2JhK0JuVDVlZDZLZEhLTjRuaTEzcEZ6emc0cmo2?=
 =?utf-8?B?bEM4dXYzUHhPY282eTJTYWIxbWtlOEZvN2IxcWY4cSt1TEFEZzc3bTBoZnZa?=
 =?utf-8?B?RkdoTnZRellXdm1nODVzMW9QOHk3SHcyTTM2TUZMc2lra0t6M0tuTVUvSFNy?=
 =?utf-8?B?TnJhZ3pUUjZ5THEvcUYvZWo2bHdJNmJNcGpZUTVXVDc5czdKVjNCekEyT1FY?=
 =?utf-8?B?NEluUUtNVktzL0lraTFwZUV0K2x4VEwwbEhySXkzck84VnhDKzRGdy9rS1NW?=
 =?utf-8?B?ckRCOXBVWGwyRVdHWWJpYzB1V3NsazRkN3d2cGUwN0FaT1FTcEo2ZnFmczVR?=
 =?utf-8?B?Q3pxVHIwaHZlZ3h1Rk1rSFR1L2hqZDhNL09uaGRNM0creVpTaHozTCt1cDNG?=
 =?utf-8?B?SUNQdkNDM0lnM3NsRkFrUEtjRmZaSi9lUW1UNTE0cklDWWxnbnRYbkRKMU1M?=
 =?utf-8?B?akFOSWVhbFk2V1NKMC9uVitMcEUybG9WeEtqKzkrN3BzOTBSbUZET0lqeGt0?=
 =?utf-8?B?elJsb1p2c3FYUDBhNWRhbE5wN0w0QVk3UUQvZXRHWkdNTWZGeDF4TS9IUjZM?=
 =?utf-8?B?SEtHeVl3QUJHZjNrSG8veERURTFGQjV3MnpYakF1aFlBa3AzV1lFUFMxN0FW?=
 =?utf-8?Q?ODlQIBwixVYnEGx7sYFD/o5b/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a5bc88a-3475-43f8-1cf2-08dad445d97a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 09:16:09.3930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 50zWB+YVP+ZxF/tFh7pf+7En+6y+eQwIXGQfUE/I+CFllZS9ZDNeH7S7JpnKIDFuQq7eLowSTUy1xc4Krg/pkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8127

On 02.12.2022 10:11, Andrew Cooper wrote:
> On 02/12/2022 08:26, Jan Beulich wrote:
>> On 01.12.2022 14:20, Andrew Cooper wrote:
>>> On 28/11/2022 10:50, Jan Beulich wrote:
>>>> All,
>>>>
>>>> the release is due in a couple of weeks time; ideally we'd get it out
>>>> before the year end break.
>>>>
>>>> Please point out backports you find missing from the respective staging
>>>> branch, but which you consider relevant.
>>> I have a whole pile, all to do with (o)xenstored live update, but
>>> they're sadly in my pending 4.18 branch.
>>>
>>> Hopefully there's time for those to get into staging before it's too
>>> late to include for 4.16.3 too.
>> I see you've pushed a bunch; I can't guess though which ones you would
>> intend to be backported. Depending on the size of the set I may end up
>> asking you to take care of cherry-picking. And of course I'll assume
>> the oxenstored maintainers agree with whatever set is intended to be
>> backported.
> 
> Yeah - very fortunate timing yesterday.  The answer is all of them, plus
> some scattered earlier fixes which did manage to get into 4.17, and even
> some subsequent ones which are still pending for review.
> 
> The major bugfix is keeping /dev/xen/evtchn open, and the preceding 8
> patches are all part of that fix, but "not losing the critical
> information when things go wrong" is important too.
> 
> Perhaps it would be easier for me to prepare the backports when the time
> comes?

Well, yes, "all of them" certainly was what I was fearing when saying
"depending on the size of the set". So yes, please take care of the
backporting once they've passed the push gate on staging.

Jan

