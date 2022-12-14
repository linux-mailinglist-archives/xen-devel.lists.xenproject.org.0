Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEDA64C58E
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 10:09:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461846.719999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5NlY-0005RO-J5; Wed, 14 Dec 2022 09:09:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461846.719999; Wed, 14 Dec 2022 09:09:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5NlY-0005O3-GI; Wed, 14 Dec 2022 09:09:28 +0000
Received: by outflank-mailman (input) for mailman id 461846;
 Wed, 14 Dec 2022 09:09:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dEbZ=4M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p5NlX-0005Nx-4M
 for xen-devel@lists.xen.org; Wed, 14 Dec 2022 09:09:27 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2056.outbound.protection.outlook.com [40.107.22.56])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0199b1c0-7b8f-11ed-91b6-6bf2151ebd3b;
 Wed, 14 Dec 2022 10:09:25 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB7185.eurprd04.prod.outlook.com (2603:10a6:208:19d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Wed, 14 Dec
 2022 09:09:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 09:09:23 +0000
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
X-Inumbo-ID: 0199b1c0-7b8f-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y38XZjczS4W/ks7xVsjr3tcUZGdBJ/PxpLoecZ0oYTDQ5y1oPa3mYd5BGO/OeT2f4xoSkdkVgZipixWErXBUPAivgEZHhHncUSqGIWK4VdcyYFcAzwxp/yS+S0aEl5qcb3t7J0oZ1GJeYti162srHCeUva7WDsOcCktYQS6GkHx1Fy2JhRWyQbd3zt6w6FU5PvSoRYa8OAx4UuCUhz3PdhccfA50ZoJ/aGa9WuG1DR5+wRFvGVLKD47Ly5Xr468w8ytoBpLnXrjsiGReR0d4em9c0lAtfqxL0GBRy+TJocUlRqb0HAZB3RblM139szCdw2rkyNQypJ5jCpe/fhlz4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IS4SLI/aYBwcqNtkEeoDT6szLWznrVlJ2qNED8YZLhY=;
 b=QKoDybMBdwFHU5DMwwUE0HoYJuVcAz3NU7QHQgl0jzdgc9ZEcO/1Qj6+5rWiGPUbWE8hRLfFP9dfkNGTsIwt+sQu6mJyMUYcZyg7ut0Tee79kUoEXMNGmB3KYN5V4Yj0JcTjLseNZn/HdJ7IBmu/jJ3U6lN/U2FJCnUIyPkoo/7Ac1EC3NP/4pGFkjhulXj+xU/iTc/Shly4nprqbe6m5Ou2QQvnElj730USMppv9MJ6ZLNJD4CpqlRtzmLayLeQIqzyxkEuCfhdgxbYpXEAPMe6F8KZJdiq4hVimAN3UgKoYYbjA9fJtf7LR7oWXfdmJHhXQ0Z0N3yX3n5fwR6s/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IS4SLI/aYBwcqNtkEeoDT6szLWznrVlJ2qNED8YZLhY=;
 b=yPEce5vpTBfR2wXGAeABGFRik/y1d4XofLs23u50BaSDpTYMvqTwZ2PXDUZCTX7PLXJSIGp5g2oNbepoGCt9aR/PW2CTQD2SRMeIdpxpugYxtpLomuBR7XfLp8fmzN5zR5h4ifAGzNgs9pXlVESqvFN4wSdm1HnX7IKbie1vh0OV250zguulQjb2XF06wl9j73nMjqeFOBywsujohrLykl08h8XOG5hk6ZWLJF65lHIM6Rh9aDVqOTH4DicRxW6llFzifw/RBKpgiI7kwtO2aE/yuvVDrXYnB8gysCzdxLUj+zbzQSIfd1dlswLM3UDZqwxFPZ7oA7EaMxEZYwKfvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f7f24676-b251-a7d0-b169-8229704c9f8c@suse.com>
Date: Wed, 14 Dec 2022 10:09:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH V10 0/3] toolstack support for generic virtio devices on
 Arm
Content-Language: en-US
To: Viresh Kumar <viresh.kumar@linaro.org>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Stefano Stabellini
 <stefano.stabellini@xilinx.com>, Mathieu Poirier
 <mathieu.poirier@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xen.org,
 Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>
References: <cover.1670994930.git.viresh.kumar@linaro.org>
 <47096c1c-4b03-2e3d-c28b-c8920b7d31f9@suse.com>
 <20221214083456.4w6raz7wop3ajtve@vireshk-i7>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221214083456.4w6raz7wop3ajtve@vireshk-i7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB7185:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d647a58-a142-4b97-2946-08daddb2e4a9
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gB1LttCGBFKw8I5/aSCbj7f8Bj3v5w0BsYMu+0UInvGLv1wifdCK1jt0EMQEXNvkWBEG2QvaRQuZdK/9G14BKDurPKPe+5gIX/fKPoapTA66cNa64v1Q12DFMvo8kdj2MqZ7ajMNQ015HfrKoX2SktCw24KlLa07RlP1lH+5HT5c4BOT/WI+0nJqe7y8jo+oTItScQLqJGWoKSK618O/pb5VByuYreNnCWI5VPBiM6zyogqn89D1YJyX6+lCq8vZllcjdtP7vYL3RwGPMWe6LqJXczk1NM6BcZJcEZ4yyk9oon7ZHkN/boVjUVnDmJ9vP2DjkzJWmA9fCxsAeqAqTJXPe+VrEbc5bfrzLZg/eNy0gUxCIlryTXkmkg+57FnH45GeVwxznUn84seKou0KbxiJKIEezuWjZfMQNF5Vx4SaVU4+qKehzy4k+SPMrs8WGp+JlieyRqxevNhOU9xTs4QnAjWMBYuIe58rgfSL1PFhHt1mILcu4SwN6z5BP1fE5ZAg4tHIM+mjNmze0gjUJHP6of0Emvq0b+3yVFFH07NDQ0VXFiKphBaMEOnihRDLEBObjOMcnv0sxNKgmG46F6VuAzK2w1mZ85l/zCmMAXuxvaqR4UnpnGLdu1Zepk3hpqi4olTe6+GRoDF24+H8QQ64qIy+ERoMjhHpLBxJDORkTlDL2G+JL1IsItH4Tg1HhKUOisKOVXSHCZE6RSGXs0eAW8t0TILOYpFFQVBOGczygOV/JKyCsL/SUnSCa1T+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39860400002)(366004)(376002)(346002)(136003)(451199015)(31686004)(31696002)(86362001)(2616005)(83380400001)(110136005)(316002)(54906003)(36756003)(38100700002)(186003)(6506007)(53546011)(26005)(6512007)(7416002)(2906002)(478600001)(6486002)(8936002)(41300700001)(5660300002)(8676002)(4326008)(66556008)(66946007)(66476007)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmZXOUpFNnNRWEdHNjRLUGx1eUFHQkxwMlZIcVdLUG9nUFV6YW5qamVsNmNa?=
 =?utf-8?B?akwzbDRWN3Jmei9DVWlTUWhtelN1S0FFbHFPamtDME5iN3RkMXZTTWNQbkhy?=
 =?utf-8?B?TlJ2N29PaGEzb25FT3VjVkFDaHR6ZlM2K2hTVGNURXUxQ29oSkU0VEJkU2tl?=
 =?utf-8?B?d1gzdk1yWjZIaUQ1ZmtLMUFsbm9zcEYvVXU5SmsxZWp5ZGROQWdrUWRRTC9U?=
 =?utf-8?B?cWo4ZHplL2k5UVArVGxpY2JQbzR4SS9wQU5oelJHb3p2TURpQWx4SHdhZEw0?=
 =?utf-8?B?c1E0dEZkVFRhNUp4VFNzbWU2N3E1WGxiVUY2TjF2Yi96bkROK1p2UFJGR3Q0?=
 =?utf-8?B?UEw1SjhqUDNHRkNqTzRWNDA5WDBmaVliV1BPMHg1anBUQ204bjVwb0pXWnRX?=
 =?utf-8?B?Yit1VGNzTHRwOTNheW5TQ2pURENPaGloNS9lZXpMbXM4d0ZraHI0K0U3OFM2?=
 =?utf-8?B?NTJPY2xMdExzdG9wMWp1eWFOT1Z5VlJRK1huRjBVUTE4MEFGMEJaclVtOHc4?=
 =?utf-8?B?WFhRZTR5b0NkeHdmWXc0dGxuN0JzLzVzWlZjZjBNOXpLdHBMa0VSZ1FyZ05i?=
 =?utf-8?B?NXp6dVY4R3hRMUU0UGQ0dVNVeEU5SlNsQVV5Vnl6b2tpaDVjOHdXc1lMK013?=
 =?utf-8?B?c2QxcXhOb0xOZDc5S3pYR2dyRityUHRsc3hBVFR6Qnp6UUNqbkNLY3pCdlJY?=
 =?utf-8?B?Y1d3VExMK1ZNbzBNQUlScUNJZjU4WThrUUhPQ3VqTS90L3RJbFBnczdBcGxU?=
 =?utf-8?B?Tmt0RFZtWE1kNVJ0OFBzZWNWZ1RwTVdVOHhwUkRIWFhUSVZNSVdOWU13UGRo?=
 =?utf-8?B?VVVubEVZVnNVYmE4OU01OURGeXBTb05iUWVNakgvdDhZOFJlMEZqaG0vaWo2?=
 =?utf-8?B?U0NvYnNkVXdvdHFZVWk4WlFFNW1jUjUzaGNwdGdISFJ4QUtlRnJ1amZ2VS9o?=
 =?utf-8?B?SExac3dFcW84QTUvZFdHNS9ucmNGS2Ixeit2Ykh4QjZncnp0MEg2bDMxK3ZB?=
 =?utf-8?B?Z3JUd2UycU82QS91c1M3WEV4ckh5NFV2WGlkUVBLSlB1TmRJUXd0RlBYUlRK?=
 =?utf-8?B?dmNadXExTXNpWFpLUm5OMGJ1QUx4MDI5ZWNKekRzcUJMRElONXBVNVM5SzJk?=
 =?utf-8?B?ZTRhYWJaN0J0a1BucVJQWlFsTm52dWpBeUJVV3NyWUdIUW1PUEhBUTZueVFs?=
 =?utf-8?B?MFcxTC95aDlqN3JKV0lmVm50dlBDbTRDMVI3QWQxNXR2SlFDeHIvWFU2b3dn?=
 =?utf-8?B?Wi9ZQ0dZUkRVNkpFVThTdDFTcWJwWDlSM0lMSVFHSHN3TWl4Y2JUZXNRUWpk?=
 =?utf-8?B?RS9sNmVrT1lVS2prdFlhYzFJZitaKy9TNGNSYlFkeXlUbkg5d1JHdXdWenRM?=
 =?utf-8?B?WUxtNDdkQk12VGRYYmY3ZzAwRXNHYzFRVkhMTlV2dVUwQnFVUW1oV1M4UWFY?=
 =?utf-8?B?TlZyUXRreC9nN29Rd0lZaE96K01qUm9oSVNzTGVKTDExZ3Ryc1NJR3k0ZEdV?=
 =?utf-8?B?c2tPMHVqQlBuYkRLOFAyQ0FyWXluamQ3SUZ5UStzR0N3eE8zUTM1VTFIdFBR?=
 =?utf-8?B?Qi9zTFhqa0RqTnpGWnJRbnRXSnZzdnowTHRBR0R2Z1R1N2Jwb2NIQXZTN0tv?=
 =?utf-8?B?eGxCVDFGR09FWmFSL3AvQlhEdDlTU3ZHL2lWbm5oSUpkRlVFaFhCUFByTzJS?=
 =?utf-8?B?T3p5SDhNK1BnZGpwSkw1SG1obENJU0NnZHBwbDdnQ3JyL0wxczlVb0FWeXBk?=
 =?utf-8?B?Zm8yUDFORXFWaHBSeFhxQThoNlB1Y0Y2eEJXZ01Cb2RnOFZYL3U0YVB4VzJP?=
 =?utf-8?B?VEVTU2dNQU8yVGpLb1l3bm9sTXZ2aUI2NW13aWJucEtaM041NlNIUUZGRGxs?=
 =?utf-8?B?YWdES3V5Yk1pUmxtTXJLMDdEeWJxTnJhZlpYT2MzMnBCY1EvREdqNFpkK25N?=
 =?utf-8?B?VGVqczJ5akhlVjR6M2ZFUTVrVWo3MmRYencxRnh1Smo0WFRxUW8zYU9vL0VV?=
 =?utf-8?B?eCtIVzcyRXFkWTRtbDhMNmZaaEJqRk50bjF4bXU1b2ZxdEY4UW5DbE9zeFhB?=
 =?utf-8?B?UWxoWDJoZGt2K3ozcjJETGljSExxd2tldTZmQ0VFTFowSHh1Uzd0Z1RsMEFT?=
 =?utf-8?Q?Kyx1StdN4gyero4ToBdHy5U5s?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d647a58-a142-4b97-2946-08daddb2e4a9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 09:09:23.8898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CGwzX91Lv/eGZ4+WwdfZUBWQfNrqTRYh1EpbPnGE+jBc4VK/ql1EXpnq39MFtgLCFtG8gFOFNLiKxwObyEiRLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7185

On 14.12.2022 09:34, Viresh Kumar wrote:
> On 14-12-22, 09:21, Jan Beulich wrote:
>> On 14.12.2022 06:19, Viresh Kumar wrote:
>>> This patchset adds toolstack support for I2C, GPIO and generic virtio devices.
>>> This is inspired from the work done by Oleksandr for the Disk device.
>>>
>>> This is developed as part of Linaro's Project Stratos, where we are working
>>> towards Hypervisor agnostic Rust based backends [1].
>>>
>>> This is based of Xen's master branch.
>>>
>>> V9->V10:
>>> - Swap I2C/GPIO compatible strings, they were wrongly added earlier.
>>> - Arrange tags in timely order and add new ones.
>>
>> The affected patch surely needed all tags to be dropped which weren't
>> explicitly indicated to remain valid across the bug fix.
> 
> Hmm, since it was a very small change (only fixed the compatible
> strings) I thought it would be okay to carry the tags and rather harsh
> to the reviewers to drop them, since they invested a lot of time
> reviewing these. Though I do get what you are suggesting here.
> 
> Should I ask Oleksandr / Anthony to provide their tags for patch 1/3
> again ?

Let's simply wait for them to confirm their tags.

Jan

