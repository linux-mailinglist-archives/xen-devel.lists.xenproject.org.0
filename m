Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3107A0215
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 13:02:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602215.938644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgk61-0007Ye-Fq; Thu, 14 Sep 2023 11:01:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602215.938644; Thu, 14 Sep 2023 11:01:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgk61-0007Vk-D3; Thu, 14 Sep 2023 11:01:17 +0000
Received: by outflank-mailman (input) for mailman id 602215;
 Thu, 14 Sep 2023 11:01:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qgk60-0007Ve-E2
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 11:01:16 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20625.outbound.protection.outlook.com
 [2a01:111:f400:7d00::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06109bb1-52ee-11ee-8787-cb3800f73035;
 Thu, 14 Sep 2023 13:01:15 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB9341.eurprd04.prod.outlook.com (2603:10a6:102:2a5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Thu, 14 Sep
 2023 11:01:12 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 11:01:12 +0000
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
X-Inumbo-ID: 06109bb1-52ee-11ee-8787-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ROcyILzWH2WnrgJgNOtaT2752cVS9pYUVx1I7ibqDOHY1iu0QhwyI78evNJVI5O04QUHFsC1BfY08Z23b86ZEgdvOEyNGP5gWVx3Y/VDAm8a9heR2kh5Wu8C9At6p12ImW6IQE1ib+LkGdiFcVFqde8RD+2BPPRn05zMEWrTAIsqYdn+UFX2ejrrdzInCkdPNkOxac6kzeW/snxHMqxvebGSXrktfS0RCpWa5EhyPrlgA8aBVREdF/jW5R52ahAhdJOnIAykNzIXHwLk5uURhPcHSzUs5QOPU2tfbtTzVvcu/Nvpg3wA4A1Y/qqy98O9l7zE8U1atHzlHRKnhuIDGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6oj7Tp7zoyvd889iuVla1qheRc4l4dymx+ihoCo03fI=;
 b=OMvcaQeY/dqVXwlhrsUyApbkgW6BA3EMN8M+FMhbrkb+eMb0Vqu7m+rNxcSmCpFIG+CGz+nG1lrDZcjfb+UCPp5oUFz1tn9yLTfDGc2b5KkoHWVSvRvFpU/u0GS3hWaLuu5OKjIcvV5TF4igaNGcTk7CxXsK6YV5G4G3vbpRp53qDP9vQY3clRR2FZnbQT4Lq4xRcYGYD3y88AsOky23hdLeqK9N6VKVTt/HB8L6XhT+FBI/XEkvGruzwQLtP1IHdJOWVjusIfIIP32HXIzsMZspkqQ3mTxpGD3tyW9mWucfQh2vKcn7ItdkrweouUKpSrJQMXEEY2G5PWDHpAkqRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6oj7Tp7zoyvd889iuVla1qheRc4l4dymx+ihoCo03fI=;
 b=2a/Nevl28eTGltsFNZDKAa1ixtKi2CKxsIV2BuTbFGMp9AbJ4njQGA74uiGx6OoNTb6Wh5cla7R4EjpzByOeO4stA2Yw2z3mTuCwOW+RT34pGS4qD4AE6nrgI278H18KQXGFX24IFSTzvzCv4I1D31qXpQVAJ6BRlzDhpZ8W0/bBUfB+5FuGxWChi9UiBNJykUQYlYwkZw0Hxi7pkBVj3O9BeUn8jOoJDsMF/SBWrYPsp3AtjEbVV5h+NlEwKobv3wj+P8Y1sVyqlQ4HX0JV+rFKSRxofsMNmhltLDX1AL4qUAliY5CCD10JWiZnkOAZB2WvRF2n5YP6WTV21uK3lg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <66b6f226-bff9-7d05-33e9-3ee93bf04662@suse.com>
Date: Thu, 14 Sep 2023 13:01:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 for-4.18?] x86: support data operand independent timing
 mode
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Demi Marie Obenour <demi@invisiblethingslab.com>,
 Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <54005c49-b012-8265-246e-22b03a87f724@suse.com>
 <e4ab7415-cf72-4c04-93dd-fd393f49f6f5@xen.org>
 <dfbbf38c-8651-5396-c966-365fe954df48@suse.com>
 <bfe3a681-7dbd-462c-9a8c-969d5a99aaa1@xen.org>
 <e7618567-0108-ce7a-de78-df14f13740fc@suse.com>
 <3c0ce6b3-6b26-4265-b560-11faef768e0f@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3c0ce6b3-6b26-4265-b560-11faef768e0f@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB9341:EE_
X-MS-Office365-Filtering-Correlation-Id: 49a85caa-7178-4d54-3df6-08dbb511e874
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kGCmugdy3KKfg7He/P19m+Dx0iwL8ZsNwPtyNBfv9IkK8dm/dhPg/qPiFx9at/k1c8OTSxBGeIsnbSbusQNhvhgMqAHcpipa1P7kYH5jOMDhx7KN98qFm5pUvndOXzoAsCSJNj6fz0ldGy0jhgkhRK8RnhBhugKfVAAGH6okSf2nMPZ514Fvjn2AAdVGEx6FHNR8aSloaMb+ubTfXa0d/eeWH2uG0Xr4BGqKxeSU3uN8kpc/2/NZhahEX9FUUY4PnM+lpI2TzQFtNkXi91mebdDrx5iHd0T4QLOOttPSOUzI/Xetk4j7mqGqd7Nu+1S5TChiBHkmM8PRMG0uTftUNf068jWnT9OJdswRuVFduvNKTrdY3sr8KwOY+yY5RglBqu2jSLquZS5tUgVB4gasCnm4nZMviYjtoZ7A48huEHSRlE08S2WBy05uGmbtWQCjWLVpX0g7l6za+6TYdM9mddaV+AS1ReTH6H2sGJZY2slD/lFZUaokEfDjAPMQw0oARX5rnsh10f/2zErz7lTrZcl6nB4oyhwonPp78ytmgN54U9GbUvM0H+7Ar0kBYIGF3ACKZk/5FnigqcNjr36F2qwNGS4f5FHjNIM4rP82hHpa8uiv24OVJjqZG1KBjWMyPgg9W3o53myyRw2a5oAiyA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(366004)(396003)(39860400002)(186009)(451199024)(1800799009)(31686004)(6506007)(6666004)(36756003)(6486002)(53546011)(8676002)(86362001)(38100700002)(31696002)(5660300002)(6512007)(478600001)(83380400001)(2616005)(8936002)(66556008)(26005)(2906002)(41300700001)(316002)(54906003)(66476007)(4326008)(6916009)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjNmeGlyL2pSRXUvTGRyN2dTSUpranZ0YzhkSEhWRXlTQjFtTDlWbTRKZVJE?=
 =?utf-8?B?YnZKbWtYWDdXejRUMi8yN1RyeTZxZ0JReldKUkpWMFBVOVA2c2srOTNiZDMx?=
 =?utf-8?B?aEJXZU5zQ21SN0Zmd09DT1Q3UVFRQkpBRmYxRW9TeEJXZTFlNmgzOGRuVm5B?=
 =?utf-8?B?eWVCVDZFUHRFRmZoa0twcHlFUk56OEpEcWRFWmR3dkpON25qYWZyUkhnQlJI?=
 =?utf-8?B?OVZXY2V6blR3U0c0b3lVSzNreVZCbXduY0UyNEU5Ylhmb29DL0VxbHpBRWVQ?=
 =?utf-8?B?QVNVbnBjOEh2aUN1UVFvS21VcVpvYkx2UEJKbXl5RnViZXlockR2SnRXdFZQ?=
 =?utf-8?B?WFJDdGVvMFJobS9LZkRVVlloSHZiSmVUTmdxQmcxZ0NoQnd3a245R3JxWTJn?=
 =?utf-8?B?UXIwcjYxTkZhTHRTUUM5dm8rT2pwTXlMVFVXV1hZVFByRzhOZUViOW1INnpm?=
 =?utf-8?B?U1NwZ21BR0x5SHF6aFo4My96QmlpZ3lrakZJRmJQR3ZXUTlkYm9KWlFHYzJ5?=
 =?utf-8?B?R3lHZ1NYdy83Tnd4NDdTSkhHdDBUQXdjNG94eGpZSWIwS0w4dUpmWmh3Ukxz?=
 =?utf-8?B?ZzZWWk42YkY5ZnpQMG5HbzViTnRvUkZkRVJ2LzljdDVFdnJOQXRnamhoWnFW?=
 =?utf-8?B?dWdhQlkxM2wzRmcwVGM4WW9OT1BHUytEOCtDa1hHVTFXN21WcVZ1ZmZtNHZU?=
 =?utf-8?B?MVNMdFJZbEVEL3pMejU4eUh0Y3FobXp4MGFZRXRPWUl1bVdUYnBLOXJ0OXBt?=
 =?utf-8?B?WU9qVlNVcHFaY0lFWWM2QmxPTFcva2p2anJXSm5saEhMYS83cEJQZGpqMFNS?=
 =?utf-8?B?N1ZCZzBWZVRVdVdkV1RTNjJnSE01elpTRkRtNVo2U1dyT0EyWUVVVUNaUmZ5?=
 =?utf-8?B?Y04xN3laWjN0VlNGUlJGWjRYY3VpV3lWbGhua3dPVU01bVVpZE1sbzIwaVhY?=
 =?utf-8?B?R3U2VUp3WU1VMzBNY1VXR2RucXBmajdEeWkxdnd0cE1MMEpUdUFPOFFvSHJ3?=
 =?utf-8?B?UmdYd0NLWmxEdzdHZk5nckwyZjJON1UvNytmczFRT3NnOU9MR0xGQnJ5bUgz?=
 =?utf-8?B?c0hNb204M0VpMk1GcGE1bXVFT0J1T24rbzRSNHdwdHBHU3FidGlYZk1WZ3Jv?=
 =?utf-8?B?YTZ3dklVMGNrYUFDeWNmU05VTUc3ZG0vcGpqdTNrSnNCQ3NTRTA3a0tWY3hQ?=
 =?utf-8?B?T3g4M0RoNkg1bDFjRkp4c2RGNDg5cmU2bHdkK0laSmZqQjFjYXF1UUhRS0xu?=
 =?utf-8?B?QkFUd2pLVEJNMzgwbWVpcWFOeCt0c1BRYnFieC9KVEhQWTlRbzVUazZ6RFdE?=
 =?utf-8?B?VndDTXJiVTJkUndsQ1kzQklDMmR2Z3RTdTFiRklldzVNaTVpVTBWalkxcE1J?=
 =?utf-8?B?WTRsSldVaGlQaXVGek9ZU29NZnRUMUZFV0F5bzd1Ykcrb3Ura1NzZUFEWDBQ?=
 =?utf-8?B?L1ZEUzEvQTREZzBrWW9aUmNkd1RDTzBzZndQekh3RERrSU0rT24zc0xVYzBr?=
 =?utf-8?B?eit3anp1NDVXZk53Z3ZEbEFNSWI4a3FVQS9lWEZuTCtTSk5OTVR1WElXUWFQ?=
 =?utf-8?B?RjdlZG5aNjZRNjJodWs1TTNQSjBYWjlDTHpVWXJTN2lSWCtQaW9od3NnSnp5?=
 =?utf-8?B?R0xkOFpZcEhiRVVVRGpEVGJ4ekRBUXV3RWRaRDZ6U1M3UURuOFBnSjd1WFoy?=
 =?utf-8?B?MFA2WkIvY0svNWZXQk5pRmRabS9xSitpTDZrYkdlUzF6aEZ5dDArbWFlWFh0?=
 =?utf-8?B?bHRhcUVnL2tQNUJ2K0UxVDBCZ01GVkdFR29iYXFMT3lWTDlyMTBUWDJ6QVJy?=
 =?utf-8?B?dEUxYUtZanJXVzZ5TlIzV2lUK0xyOHltdmswN0dwQ1B2UXpIL2E0WlA3M0FH?=
 =?utf-8?B?clFrMUpMVzkyUjlBWGxiYjlHN3Z0MXdyTU00NHJvSGRjbmlzZHZ4Tk5Kd0Rq?=
 =?utf-8?B?M1oweUNFTGJNbDNBRlA2Z0xieVM2N21nK2VGVElKZnBQV0hydGRLdzRxUEJt?=
 =?utf-8?B?aEJNS1lkWkRoTUNCVkNBRWxhdElEbUR6eE9qY3gzV2IycUhCeUp4SFU4b2g1?=
 =?utf-8?B?L05QejNORmRualF6V09GREVSbC9ZalRrSlFVQTE1d2JFRFZYeTk4UVFjWE1U?=
 =?utf-8?Q?QcmdYYmhuqYpWyzPIu4D12z3p?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a85caa-7178-4d54-3df6-08dbb511e874
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 11:01:12.3298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dIO/6vcRJJAeIAym8tgW7wQ+XQB/coUk64+5dg49FkpYMYI+IjU2dL6AsKSsV0FHbahfd/2MouEiR2whwDakUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9341

On 14.09.2023 11:18, Julien Grall wrote:
> On 14/09/2023 10:11, Jan Beulich wrote:
>> On 14.09.2023 11:04, Julien Grall wrote:
>>> On 14/09/2023 07:32, Jan Beulich wrote:
>>>> On 13.09.2023 19:56, Julien Grall wrote:
>>>>> If not, I think we should taint Xen and/or print a message if the admin
>>>>> requested to use DIT. This would make clear that the admin is trying to
>>>>> do something that doesn't work.
>>>>
>>>> Tainting Xen on all hardware not exposing the bit would seem entirely
>>>> unreasonable to me. If we learned of specific cases where the vendor
>>>> promises are broken, we could taint there, sure. I guess that would be
>>>> individual XSAs / CVEs then for each instance.
>>>
>>> ... we need to somehow let the user know that the HW it is running on
>>> may not honor DIT. Tainting might be a bit too harsh, but I think
>>> printing a
>>> message with warning_add() is necessary.
>>
>> But Intel's claim is that with the bit unavailable hardware behaves as
>> if DIT was in effect.
> 
> I am confused. Above, you suggested it cannot be guaranteed. So I 
> interpreted we don't know what's happening on any processor.

Right. We can trust vendors, or not.

> So where 
> you referring to...
> 
> 
>   Therefore you're still suggesting to emit a
>> warning on most of Intel's hardware and on all non-Intel one.
> 
> ... non-Intel HW?
> 
>> That's
>> going too far, imo.
> 
> We could restrict the warning to non-Intel platform.

That still goes too far imo. I'm not convinced we should cover for
vendor uncertainty here. We can't make a system any safer than its
hardware is, in this regard. We simply have no (or not enough)
influence on the internal workings of their pipelines.

What I have done is add a sentence to the command line option's
documentation:

"Note that enabling this option cannot guarantee anything beyond what
 underlying hardware guarantees (with, where available and known to Xen,
 respective tweaks applied)."

Plus I've further qualified the option:

### dit (x86/Intel)

Jan

