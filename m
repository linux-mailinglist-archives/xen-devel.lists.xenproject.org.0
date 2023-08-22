Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CF37839D1
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 08:17:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588119.919579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYKhD-0008F2-TL; Tue, 22 Aug 2023 06:16:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588119.919579; Tue, 22 Aug 2023 06:16:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYKhD-0008C6-Qa; Tue, 22 Aug 2023 06:16:55 +0000
Received: by outflank-mailman (input) for mailman id 588119;
 Tue, 22 Aug 2023 06:16:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MJFy=EH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qYKhC-0008C0-Oi
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 06:16:54 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0610.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d0329d3-40b3-11ee-8782-cb3800f73035;
 Tue, 22 Aug 2023 08:16:53 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by PA4PR04MB9271.eurprd04.prod.outlook.com (2603:10a6:102:2a6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 06:16:51 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d%5]) with mapi id 15.20.6678.031; Tue, 22 Aug 2023
 06:16:51 +0000
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
X-Inumbo-ID: 7d0329d3-40b3-11ee-8782-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qxn9h92ersZdAIRIpqf2x2qf3Ryek397QLNiTcXhtB4Cma3OJLBtmzFh1XrpBvUVPG9UqXp0X5lccjwm6eDsnSVTLxgNiME/2PAfUOS/7g/6jiCo7znwZv+FTGzooDZ1NvSufAJKWC94yGQ4ax/z37b3Oo4TconwN7EP2l4Ui2KMofK28r2mk9CDXYRGd+tXfh1H4dIlRWX9wzJHNz+OnSK6XWJa8HzvxJhwLsXdllTc7O8JhY27nwucdl1Q0PaEseEcTTBMcAaUd7L+u5E/hOpe0YvJxJAH4DoFDVE20w0DthdNxB3H+mhawhYWWm9FKGCG+p5AoaBnszl/jYDGFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RLPgt4xzAP2iQGhYFPKU0Eumy0+k+sw4sxFp22ApvYk=;
 b=YuBJKpANWLBPSjb5xUnh7DbWnFjMOs1b80f0hVwycbx0EkrwyWdjwXmLC2tBgyA5nocoH+e+X7qAIERS3l87B/lfrj/8qouZwqXexrQdqw29bkMvMo5FpJBvbRXH92mMFaxH1IU+4m1jV2dAHPDvuG6ce3GUrmYTpP+wc/+oMC3SueIa5OKz2buOQJZbMNMiDtk/B1+WZ2nkfSWwJn29g8JMHnlBkAeaO0ax5S05HMWNJyP60V6DcCrU2DjpOIk2j4Erz5Ut3iqDWUktzeeD/9VZqFt8SqHZ/HLfKYn5HTbR4twx5SkWs662k4Ch5k7p4Tvgfxh7P82kY+U6TP1HUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLPgt4xzAP2iQGhYFPKU0Eumy0+k+sw4sxFp22ApvYk=;
 b=pnLVbaqgq+0q5vYR9o/dkugLcqmUbebGYG8/tzNoOLvPsQJJUfU3ow2uL2axoRDyXcylvoRYoElN01RfYcvTlbunBxLZch3b96TC5fDsVabRArL+1mcwXBWmUakLfK0uxGFY2X6eeAODV/Hu/D+cpnCTA+Y5rHq8DKBZypKP0mYojFG4Ap5i0/hHWB5KQudEvHqgZjr3Rre6NqNRmijbJozIwQuXzUxI/PKaOdmZlMW9piw8ssKxBDpyerzbVa7vx2v/AEOUpnOQSYGXQuQpi7cVAW0QWzCCJjmet9vXZPeXL/LNyeNhZMCDTS3pwt9hgr6i16uDxJXyCJBLq8OM1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cf1b1eed-1029-df44-b5c5-9935433640fc@suse.com>
Date: Tue, 22 Aug 2023 08:16:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 0/5] Fixes to debugging facilities
Content-Language: en-US
To: Jinoh Kang <jinoh.kang.kr@gmail.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Tim Deegan <tim@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <5fa229fc-9514-abc6-5e72-2447a2c637d0@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5fa229fc-9514-abc6-5e72-2447a2c637d0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0199.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::16) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|PA4PR04MB9271:EE_
X-MS-Office365-Filtering-Correlation-Id: df1cd515-078c-4c7c-33ff-08dba2d75fc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ghCHoN0lzEN3loTWD8P9fQoRhrEVRH7cUWBZEOPvdLgLsDkLfGrnaY/MY3TJvOOaPb2nqyRlIX/qBALS035CZnk4oGWoFfrIj512QeWwnn1AiboGCmek89VMRLiHJ80ZBCUAbsx9HPRVDAu6KsNEJHCzAcvMcOVrOan71C1Rog4PSY3iOOwVpR7guAZiduLwx1EhM57lD2hD29lmAJ2bKKMyJJxyDn7YFkjWjhI+szrnwt5wEWAyEr5zpi8mSixfwgTlj1a9Rxl6MWo5hmftLuK90BfT6w04H+9vAxGCxhnmPI83YrLIglk/AUNPwZwgpfugD8zaiCocGThKkqqme/34O+90rGJ8Sb5VJS29BVbDot/Xm40XuwW0KzxPdAZ+2i5j5m27cr2ZLvVSczlXyE9BYlP0qcTfW5X7yPQNmIKWhs/g+qRR0H4Is+e+r2NK+Q2vzm+YGtKxh8UcvY2XE4pGOIjgIbDCa24w9Ien7uEe2w3Gc3ZYFGbFNUe9fTnPN6np5N0uGyS19G3d+CqYN3vlNbbwzdk8GOCWqGHGZtqOeUiM/O+5rlRYIdw/J2RoKe/FAPUOogUaymY2/kenvvBmpMHNDqPLxvrbvP+RqdPCqbju9S5mLzZHmIXknbhsv/Br+V4kb9jQXmPIYW8k3g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(39860400002)(346002)(136003)(186009)(1800799009)(451199024)(86362001)(31696002)(36756003)(31686004)(316002)(66556008)(66476007)(6916009)(54906003)(966005)(41300700001)(478600001)(38100700002)(66946007)(6486002)(6506007)(6512007)(53546011)(26005)(83380400001)(4326008)(2906002)(66899024)(8676002)(2616005)(8936002)(5660300002)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzZjWGZiZU1zTEQvbHBkaWNGdkpSajU2bUFzYks4SXF5dzJUMEVjNXRRSndO?=
 =?utf-8?B?MEN2K1E5QitsVitqTlkvVmlyVllVS2JROVRsVm8rZGJFL1ZZcFplNWVDR21M?=
 =?utf-8?B?VzFwZmROa3BHS0NaSzdBUFp4SWR3UGtGTGJIRndpd29LWXl1R0RCQXJyWEt2?=
 =?utf-8?B?M2xkUUFuYTJDSHNwUGxqSHBlRnFkWVdXWFZoUnhIVm1ubmRKZ0lYdW1vei9y?=
 =?utf-8?B?ZkZ2WEVhbDdudDhYOHQwanZPZms3ZTlJWkZCT0R2WnlOL2tnckEydncxSXJJ?=
 =?utf-8?B?bGdaRmRZcHdWRDl4YXNGdmVrYWZEeUdZRnVDeWVhcXBYZVk5SkhVclBZYkJB?=
 =?utf-8?B?SFdXOC9uL3lLeDBkQ29tTmZuT3pKMGJDVGIreVBnMnVjb244cEFyRUpkN2o2?=
 =?utf-8?B?Y01Ddjlwa0wraStFQlE4cmFHeGhNeHRKcytONUt2R0xHNUNQZTJrdkNZOENN?=
 =?utf-8?B?MHByTHNSWEFrdmpUdmVFZGM4MWhnOVpGSDdHajY4eGpqK3ZIbjkvR2hUV0JH?=
 =?utf-8?B?emdKMEZYR3FJdnVaWWk1Z0I3N1NjNU90ck1MVll6UnFkYVl1LzVpNUhlUk5X?=
 =?utf-8?B?VkVPcHNYcFhHYzRabjJXZEwrbnJ3Z0o0YWJFbVZDWVFlKzR3K1ZIdi96SHdj?=
 =?utf-8?B?eitoOC8rdENTVm1PcnJ5SGloVHlpMmRYRDVUeUs3aUJXcldPMDhTdEdoWTQ2?=
 =?utf-8?B?WlMrVGhhaWsyZFgzcHQ3K1JNRFFnOGF2MDhMeDFyemtiUlhmN0V4ZzQycVNG?=
 =?utf-8?B?YjhuR2h0R3hCVTNCTjE5dE4vRW9tZ21HV09CZWtndTh1RGpXbTFHZithTUlC?=
 =?utf-8?B?N2UrRE8yTHpxMHI1YlAva2lyUXN3VVVxTnhXN1ZJWVFCRnpuWmtZOEdkU25i?=
 =?utf-8?B?bndOZ3VHbTcraEE2MTh3U3E5YmJ3bTAxd2VsTW00aVBFZXgvZUVyNkNSM2g1?=
 =?utf-8?B?a1hjbXB0eVJkMnp3emV4M21ZY1dKZThLRklDcEFybjdsNHJLM2E5ZGIzQ1JI?=
 =?utf-8?B?Ym9mOE9SbkdYUjdHK0RUTHphQzhlM2lzYmJYZ1hodUU1bWpWK240N21mdGNr?=
 =?utf-8?B?b1pvdTRZQmFMWHc2azFRS0dUQm9yYUY4ZnhiMm5TMkZBWW1DQytNY21WRjE5?=
 =?utf-8?B?ejd4RkJ6a2ZoVDVjM2JSUnc3NXZ1Myt1ejF2dVhXTEtLdkptTmEzTXNjVmRK?=
 =?utf-8?B?bk9XVE81M2tkand1TUNCLzRqcEl4a21DRHBGWEloSmQ3RmhnTjJ5eTd6a0k4?=
 =?utf-8?B?NDFjYW4rdDlkdHE3aHMyczlPa0FMd0IzcWtRZG1FdXQ1cTM5WEg3aVByeGdp?=
 =?utf-8?B?cURVaGwrcjdGNXVPSTR1UUNWT0JQTnZDeEkvdUQ4c3BBNzZyKy9zV21GNEFM?=
 =?utf-8?B?S1dLekg5ZVpOMVlMNzVJcVVScGZaMnhJekF1MzhhaFpoMWJuM1VjNzZIOG00?=
 =?utf-8?B?KzFEUHhSRDdWS092TnovVnNzenpPNDJyd0IxdDgrRkY2cUpXREZVY3VUZ0tM?=
 =?utf-8?B?Vk0rUGpkZEE2dmd5STFqQkxxMEw2N0UzMW90REhjYnJVWXlpckd0MzV1Z3Jl?=
 =?utf-8?B?bWRRWGxTVVpPUXZrS0l5dWJSd25PS2dQdytENlpHd3JqckV1UXJIWGdRVVdJ?=
 =?utf-8?B?QzFuN3U2c0JGeENRTW1RM3FadGd0THpMT3JvaDhicFJETnpMWWZLMW9XUHE3?=
 =?utf-8?B?TzZYZUtxc0tSVmlidi8xOHlBalRESXZOcWkzeUcwQ3lKNkhNb1dUNlJHbWpT?=
 =?utf-8?B?UkJ5cGNQbUVhTEQ5Qy8xSm12cm9pVTB4NkdRSEsvVkxiRHJwSWNBV2o4U1Zt?=
 =?utf-8?B?amhVZFo0V05GN3U1SWNiVWxWUXR2S1cwdFlPWlRod1BkaTRJN0FKZjc2Z1Er?=
 =?utf-8?B?SlZtZDVhN0pLc0hHaDIvTU9YN295ZG5qSmJaREVLQzlBNnNWVXpwWEdOZDhN?=
 =?utf-8?B?eTZkYlpzRUcreVVuS3FLckd4WDVFMStHTTBhS29IRWZqZWg3Nks1UVVvOW1R?=
 =?utf-8?B?NVNHd3JrQUw4cWN3L3lLVnd4eHd5eldWWTBxeDY5ZHZHY1BjNytxQmZXOXAv?=
 =?utf-8?B?SDlEc2ZMMXJ3VWFQUjRaVTJiazg1ZjhNVWZ2ZXJCZ0FNYTdMWDRzY2lrSmgr?=
 =?utf-8?Q?iAmv2vNVvvdgCO00QmNN0zVP/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df1cd515-078c-4c7c-33ff-08dba2d75fc7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 06:16:51.2987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +kj0tpRzPNcjySd64OxxOZZ5vqtCUYtW+kllzuajeGTvfXwd4X+qZZVV0YdnGunz+TgE85nf7a9iVCnbi9hOiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9271

On 21.08.2023 17:55, Jinoh Kang wrote:
> This is a rebased version of Andrew Cooper's debugging facilities patch:
> https://lore.kernel.org/xen-devel/1528120755-17455-1-git-send-email-andrew.cooper3@citrix.com/
> 
>> So this started as a small fix for the vmentry failure (penultimate patch),
>> and has snowballed...
>>
>> I'm fairly confident that everything involving DEBUGCTL.BTF is broken, and
>> there are definitely bugs with configuring DEBUGCTL.RTM (which really isn't
>> helped by the fact that the GCC TSX intrinsics render the resulting code
>> un-debuggable.)  I'll defer fixing these swamps for now.
>>
>> The first 4 patches probably want backporting to the stable trees, so I've
>> taken care to move them ahead of patch 6 for backport reasons.  While all
>> fixes would ideally be backported, I can't find a way of fixing %dr6 merging
>> (as it needs to be done precicely once) without a behavioural change in the
>> monitor subsystem.
>>
>> Patch 8 probably breaks introspection, so can't be taken at this point.  See
>> that patch for discussion of the problem and my best guess at a solution.
> 
> 6 out of 11 patches from the 2018 patch series above, including the
> vmentry failure fix, have already been committed.  This covers the
> remaining 5 patches.

One important formal question: Where did Andrew's S-o-b go on all of the
patches?

Jan

