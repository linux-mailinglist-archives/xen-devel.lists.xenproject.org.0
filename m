Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0849E680F34
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 14:41:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486999.754470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMUOm-0004DZ-4m; Mon, 30 Jan 2023 13:40:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486999.754470; Mon, 30 Jan 2023 13:40:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMUOm-0004B2-1o; Mon, 30 Jan 2023 13:40:40 +0000
Received: by outflank-mailman (input) for mailman id 486999;
 Mon, 30 Jan 2023 13:40:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nJND=53=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pMUOl-0004Aw-0Z
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 13:40:39 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2087.outbound.protection.outlook.com [40.107.13.87])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac271747-a0a3-11ed-b8d1-410ff93cb8f0;
 Mon, 30 Jan 2023 14:40:35 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8374.eurprd04.prod.outlook.com (2603:10a6:102:1bd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 13:40:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 13:40:34 +0000
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
X-Inumbo-ID: ac271747-a0a3-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WVkspJj//cxGPqpPp6ENExDvkke4JdA1b9zSY8BgvXQTAKFW/PEmz38sqLksDhengsB80+v7fNbebki3nZVjX+o3lEVZwRSTUEjSFdL41xj+HzokSPjqE+mqUb+2Jc9HZb4Reg6amOPdUgVXMbNDZ5WQbpx+/gd/uZD+lC3HFhtNSiR4UuKY0fsSN9OqIlX36mSr0mR/YMtmdcPQKecEBfL5W5YYyb6YZh6Nz9i3qktG3e+yV4WaCbL1br+QoDBuyTTRg9a85QMYDguO7CWERrmBf8VQxsfGbPs1QWVPXr6Gl1ycH08i8zl9AMfmirblbk1FjOkxGPcqCJSuxVtjcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ExghRb3FOA6IrBrnaCyvwC8TiiK+aQDyfO402SkmcJ8=;
 b=TFQjQxalxlqg/9CR/wB8YgjnegfeeEhrqDkAMteCvO2Ypw0pF3G6x8C8CoFllXlxgGt3cISqWECDSFAtiUP9vbsmzewAJXltuE5x/vi7OSfIveyFXUFQlr6BFXWAxugAjAgtpgxrxFyORnHgRYVbYhmxDL96XVCPpQLUBy04E3RtqaNLjOHk+tr1FqUzPAwt7jY4YPEYLN5dnjONV+7/yOU5gLUDp0VOwaw1GFaWoPQGj1fH/V2DXjfzobJ4tO6NQx0aHyWAs/9fzRhmEbLGDvbfbZVMGMsZFDWKzVzHDE4UfiCfGprIXf7X+nqMQQTVi1KMX4z3LGGstGnH0SYQkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ExghRb3FOA6IrBrnaCyvwC8TiiK+aQDyfO402SkmcJ8=;
 b=2mHaSPdl9wBIbPwZ29qKNnqKBtnLSuYXZEQds4s/TkS8w0zKPBzu4HinhVHa6m0yz7HlcqKkpp1PZ/d4FGvZAQfvS1Dq5+2izf1TFgpMzfbtTBAd9HXGu8ggnVKtQ8rFsr7BFj7tqk1Npqoj9T/drzfhnt1icWSlKB7CALIgTZvxpMc8r4EyEozcDQHxZq2kYh5Z/0q7+hJVqk6XxpnNReFWfE3N9h1s22qWDfLh8RzU9T32BAQQYa+afNQOPDIzlSldwBoH+wDe3wFKUK2Ec7HPtfk6EHAGX0YnIo5lsENG5qXEdWnALAFcqVQKZZ7CcsSj5qYarg3+1uWBG6rj3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <72c88d99-5ddb-f156-e768-83d1861016f4@suse.com>
Date: Mon, 30 Jan 2023 14:40:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] Add more rules to docs/misra/rules.rst
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, "julien@xen.org"
 <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230125205735.2662514-1-sstabellini@kernel.org>
 <9d536cec-726d-4a39-da36-ecc19d35d420@suse.com>
 <alpine.DEB.2.22.394.2301260749150.1978264@ubuntu-linux-20-04-desktop>
 <5a3ef92e-281f-e337-1a3e-aa4c6825d964@suse.com>
 <alpine.DEB.2.22.394.2301261041440.1978264@ubuntu-linux-20-04-desktop>
 <db97da84-5f23-e7ed-119b-74aed02fb573@suse.com>
 <alpine.DEB.2.22.394.2301271016360.1978264@ubuntu-linux-20-04-desktop>
 <03ce9f48-191e-b1b5-a3b2-8b769aa8feeb@suse.com>
 <2733D8BE-CCA5-4322-BB9B-1D4318378525@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2733D8BE-CCA5-4322-BB9B-1D4318378525@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8374:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ecb0652-532d-45ae-54a3-08db02c78fe0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1mXg9W3sMoI+QBD/CPrBY4AddJx0qh3CRGBqt4MdLmDVGG+73/ctI7PuroyPbv5I1seyPF57I+YJVrBv3ft75/68Kd5VQMKQ5P8S9T9/h1OnLt6APiDDiKfzH58p8YiMJb1eI5exc0gDtaxdOT2vkiBetVdxlbfrwV16choiCa134r8uN2AHSctHdasSvnQoJClotjdJNFbg+5zhp0AiPmKH/Mhi/FbRUdpr1fMpMl/rTvlOPVx/HgHWptnmzAcwGFo9zkU826Fmat6a377njU94imdCVEb74aFpj8jDrYBkl8et2KDX22F5fCr/yAxNbKFSEEQ+mxXXBUvWUpEebPSjHV7vcSUXiWnZ1ORgd6P+rj7St59AoMgvX16OiyyH+i0eWSGBeF+TfK3Z54C+qMJlJSxrhcsH9C52xLnEOtb1K/beuieep5ZWR3vW3VVjqjgP1GXdDf22B166Wju2RvocK2xzOl+nDOtPNpPyNIPfh8xPBbWgoWXDHu/m7aFH6hYg60WsyCA8K0V7JRMcrNqE4xC0/pZEqGcsuU4PTZ/ScuH56kakfElfrn3TjAKmlj0qjd3+TnbDmRc+mSwRjRSYz8zk7fcbDbOsAr471IcSLrAr9k21xc9onuo3CmZHc/RZiaH+ZrdR8aXzyNiowNzqTEmsRg0X4GN3bGOXjBdglvueo5yA/3JTk4CikkG2iROZaKjm7Oi3mCHqsV5GBhGJvLtfjNqUtg+am1GiQ5Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(136003)(39860400002)(346002)(366004)(376002)(451199018)(316002)(83380400001)(54906003)(41300700001)(8936002)(66476007)(6916009)(66556008)(66946007)(8676002)(4326008)(6506007)(186003)(6512007)(53546011)(26005)(2616005)(6486002)(478600001)(36756003)(31696002)(5660300002)(38100700002)(2906002)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUgvaXBIdnF1OXdpRlpFcHFXTEVFM096L3RqNlBWbnMwQkd6Ty9TNEYzZXhI?=
 =?utf-8?B?TEVFclhENEdUZDFSWVJQdHBWTWxBTXErcXVzMnFmUWsvQ0pOREllU1NYdk9h?=
 =?utf-8?B?WXlpTlpSU1V5a090clBXMDdzUUhQTHRWT2pXaVc3c0l2aW1rQ0crQ3Nxb2hY?=
 =?utf-8?B?SDhuRFN3aTNQczE3bmQ4NURsNUUrMERBc3ZZbXJoVmtTVU5OelR3VDBTaTho?=
 =?utf-8?B?c0JsdFNaa081U0xleTlyS1p0WmZhSmZFMGZHeENyUVpQZzFHZjRybHB3S1ZJ?=
 =?utf-8?B?U1FPNmt1RGpLR25iVGhIR1EzaW4xdlNhRmJHTHJMTWljOGVvN3VDV1Z1eExY?=
 =?utf-8?B?aUhIUW91YWhvYThSMnczTnBjNFpMUUFIdzF1cXlmcHFIcHg5THZtK0NUbys0?=
 =?utf-8?B?V09vNkpZdFZxcENEMWhFWllpeDUzY29uUXpjMFhFb3l1VStiREtFRGVGczFH?=
 =?utf-8?B?WkdWSHlUUTlIWTY3bnZqNjdmcDc2UE9yU1ZKV2V3MWhxS3ZScklHTTlrRmNU?=
 =?utf-8?B?c014NG1xbG5MOTl4WFpSUStGK1lEY2hXSGpxVlBtbmpjdmx3Zkg2Y0JkZ3R5?=
 =?utf-8?B?NDlFQUlZWWZ1eTNGK3lXb0NrQmV6RktFUXRwVEROejkwSDF1ZG94TlhubFZS?=
 =?utf-8?B?UHpld0NLa2dneEQvbEc0VDZ2OVJ0WUR0bGpEVmV3enZwNkxxbis1SlNzT09Y?=
 =?utf-8?B?bFg3d3R6ZXhhU3JoSXhKZ1RLelZtM1JhMXNQc0tjVWVuQmM5ZngveWxTanl6?=
 =?utf-8?B?TG1JV3M4NWgzZFBnYU14YmpnbTc1MGF3MXhzRDVCTTh0WlB2N1Y0d2dHb3pF?=
 =?utf-8?B?WlFmRFNPWlBsTGZtQW9oY1hTbWZobDdMcG1aSUpXT0ViUncxRXlYNzI5dVZJ?=
 =?utf-8?B?V2g1dnFjSmRScHVCakowbVEzdVBpWmpLdDZFSzBKU0ZMeVlNU1laTGFTOFdm?=
 =?utf-8?B?Kytad1BSM1dIOTNUVEJ3TVJDcHE0RXMrSUphaDdIc3RNUCtYNWlac25hSHl1?=
 =?utf-8?B?T0RuZ1BMQ2poenQ3MkR4dlI0N1hBN3NBeVlrU25hSjNncjZlNmhtbmozT3BH?=
 =?utf-8?B?YnRXNUduYWh6TGRqbVVyM1ZhNTczSFhuY28wN0hMQXEwYXY0dytWV2dRb3pQ?=
 =?utf-8?B?SU84WDVYSzF4OWQ0OFJJT255cEphT3F4MkRHSjN2MjU4QTFObS8rdUE0ZWVp?=
 =?utf-8?B?WTEyVlVWRzRHU3d4U0cweHhCTEl5aHZpUGFPYnIwb1I2TytwVkt5VUlpSTI1?=
 =?utf-8?B?bWM1VWs5Z0JKbnROVTZPWVVmTU55TVlxL0ZXbkpxRFJ3TXFUYTNBcEZHVTBw?=
 =?utf-8?B?ZUhWVko4eUJGWlFxTEV1VTdrNGRWZEhiSTdnMTVPb1piMjZ5VyttQUIyRlI5?=
 =?utf-8?B?ZDVYSUVxYmY0QVdoaW13S3J6akhOMURZbStTazkxMS9lNXFQQ3lQZ0VXUzlD?=
 =?utf-8?B?NEI5dlVGWHJCZUZEekV5VVlXUkxIZWJURThwc3F6a2N5MnF0aHQrNUN4L3k1?=
 =?utf-8?B?MFhqSU94d1JGaGRkeGIyOGJ3RTNxMjlrcWVPOUxGSktkcGdyaGZMYk9JcUwv?=
 =?utf-8?B?YUNOcE4vVGp4SkZxU3hlQVlkZWdiQk5qaWQ3djA2UmllTExsWk9ybkRGaGRl?=
 =?utf-8?B?aVdSZTVrSFRodVM3dGgvYnVWc1NlTVUzQWFobmdFUjJzR3VrSmJnRHo5eUd2?=
 =?utf-8?B?MXVBVzZ3dk1mNVNBOTRITU5lbkFhRFdmbzFUVkhBY1g3UUJWekM1V2lhd3Ay?=
 =?utf-8?B?STVzNFFaNWlvTFZCcTdCWVFJZzZIaFoybHkzeDVYdEc2WFY3bXBtY25DWHc4?=
 =?utf-8?B?WlZ3NHlCNHlsRStKUlBzeE9TNG1sNVVkMXZjVzU2QVNwV0RCaXRCeU5SRHM3?=
 =?utf-8?B?dnI2RW5qVFdNTjUzQkNlYmMzcUdES2tsSGNLcnRVakRVNHN6M0daZm5SVFFN?=
 =?utf-8?B?b1pFUnJLUzZCTEpXU3ZVVGdPNDhtRkVEcEtmcEhCNUZUM2drSlRKWERtWHl1?=
 =?utf-8?B?N0ZmNmxBZUVqd0JyQnFlMXJpS3hyMExjeWpUTFhmNWFXUWswQTMrdjhEM2FT?=
 =?utf-8?B?T041aytlV25UNE5LSnpEK0JiZnhaNTlRTGlMcGJVc1kxaXlWZFFyOG5KQ29z?=
 =?utf-8?Q?Biv0MwTSYbTP2aiH36l45qlcD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ecb0652-532d-45ae-54a3-08db02c78fe0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 13:40:34.2554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ozoH4geuD9HvxIAdJP4LB2kEQKOhklKNhl9TxfcuBG1E13UriQ3Q5/9kSpW+YNkGiyAU1OZW3f3VT+xEjNXp7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8374

On 30.01.2023 10:32, Luca Fancellu wrote:
> 
> 
>> On 30 Jan 2023, at 07:33, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 27.01.2023 19:33, Stefano Stabellini wrote:
>>> On Fri, 27 Jan 2023, Jan Beulich wrote:
>>>> On 26.01.2023 19:54, Stefano Stabellini wrote:
>>>> Looking back at the sheet, it says "rule already followed by
>>>> the community in most cases" which I assume was based on there being
>>>> only very few violations that are presently reported. Now we've found
>>>> the frame_table[] issue, I'm inclined to say that the statement was put
>>>> there by mistake (due to that oversight).
>>>
>>> cppcheck is unable to find violations; we know cppcheck has limitations
>>> and that's OK.
>>>
>>> Eclair is excellent and finds violations (including the frame_table[]
>>> issue you mentioned), but currently it doesn't read configs from xen.git
>>> and we cannot run a test to see if adding a couple of deviations for 2
>>> macros removes most of the violations. If we want to use Eclair as a
>>> reference (could be a good idea) then I think we need a better
>>> integration. I'll talk to Roberto and see if we can arrange something
>>> better.
>>>
>>> I am writing this with the assumption that if I could show that, as an
>>> example, adding 2 deviations reduces the Eclair violations down to less
>>> than 10, then we could adopt the rule. Do you think that would be
>>> acceptable in your opinion, as a process?
>>
>> Hmm, to be quite honest: Not sure. Having noticed the oversight of the
>> frame_table[] issue makes me wonder how much else may be missed in this
>> same area (18.1, 18.2, and 18.3).
> 
> Hi Jan,
> 
> I think I recall the frame_table[] issue but I was looking into the eclair reports to
> understand it better and I was unable to find it, do you recall where the tool was
> complaining for the 18.2 related to the frame_table[]?

I think you're meaning to ask Stefano instead? I have no pointers into
what Eclair may or may not have reported at any point in time.

Jan

> Any notes or link is appreciated, maybe we could speak with Roberto to understand
> It better, because I checked with Coverity and I was unable to link findings of 18.2 with
> the symbol frame_table[] (however I might be a bit lost in all the macros).
> 
> Thank you.
> 
> Cheers,
> Luca
> 
> 
>>
>> Jan
> 
> 


