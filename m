Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6D367797D
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 11:47:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482742.748414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJuM1-0002vU-RR; Mon, 23 Jan 2023 10:47:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482742.748414; Mon, 23 Jan 2023 10:47:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJuM1-0002sd-NZ; Mon, 23 Jan 2023 10:47:09 +0000
Received: by outflank-mailman (input) for mailman id 482742;
 Mon, 23 Jan 2023 10:47:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pJuM0-0002sV-Aa
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 10:47:08 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2041.outbound.protection.outlook.com [40.107.247.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47b63d1a-9b0b-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 11:47:07 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8574.eurprd04.prod.outlook.com (2603:10a6:102:215::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 10:47:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 10:47:04 +0000
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
X-Inumbo-ID: 47b63d1a-9b0b-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QisHU5FnDtlaYZY2EZvZ4o9Ri0Q79ObebrAEd7TY8AXmcEse3IUyilkM3xpxCylk74Zos4LYVxf4vrDijNCswG4o/T3Ya9Xa8Yu1Qwp4D2FMhDLBATwFwn5qRln+6RlAU6qWVuT3IsHsIaxIlTq58+DrBwYnIR1PvOe9buIm0gvfEJkhGBhCWoZFcFBkTXR9+LP1pLyzcxVofAmencJG7BOQ2rBXE9KjFX0wK8fCdz68UIGZewrzaMraQOJsj61h1BjSO3EPXC5KMP/qn0X33f1zaYy17pobr9292DqwaxQi+JGq9kHQR6lVGe8HsEt2eCRJH44fvYV48ajzNmr84g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kneIYbav4gRiGtpPvy9/qhxfdtfbw25nmewBJplUyRs=;
 b=NHoDeeZrrnN3Fx06oc8QpKY6/9VZidcgvVQOVTdIRroD+nh22q+0XZOvqrtdpCSbG1IRWFk1ECpYTrK83vzQhQjqnEN9oHBtWugaBaWnMO0a7VNtozxQi+/FnQ8B3hdbYs5vVowalwmON1jnrBd+Kf4nHNngKceKekgeHSkeKOFf/hYmoYpcDkr9+kHGXPh5EZX5Q1mAno9xN7gFJi0LdcK4HgxrQ3QJKNuzjS+DqGsvbo/rUFJXUXQPNbqK4+KbCRYXNpohv+jdG63NtB57za5S098TPv71TZ2aWsCetAS9K76EIhjcB1ai44sv3iuNcAc+ju8zRLeqL4gpgbfFBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kneIYbav4gRiGtpPvy9/qhxfdtfbw25nmewBJplUyRs=;
 b=aZlV+Kvv5Qj100DOEqJ4yrE4Wz9CcvbQt5htfHv50No5oFgMVC5TZWmG3c+duCFGHF0Z9I/Qgm8eAPGKF6QcZpWzun4QFv/ZLaQYAfPOO9EihCTXW8uahTtp1AAKvdpVulJzOqOUB+ZQQMBcEGvXOaiicuVhNSqSHnQ1adSIRrdQ2PvW9oljqGKW1w81EtikpYjmY8qA/dC7QaTIdJjdBuXuVtiRvRy303xDS+ZAThXBZ19mvDmWPGYL+isLysDqRwjQPxhVmGtvIckCfMlKljbsqql+LOAjvM8UjCJtXpNSIPOU0HcRKKEuN+t6OHOipMxLurVz7rSiZP3s3xCVrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2ec2a36e-4264-6c12-c2e6-1af85c91f1f6@suse.com>
Date: Mon, 23 Jan 2023 11:47:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] x86/shadow: sh_type_to_size[] needs L2H entry when
 HVM+PV32
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <942e1164-5ed0-bdda-424f-90134b0e22c5@suse.com>
 <79420a4f-358a-f404-7965-e5f215234ba9@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <79420a4f-358a-f404-7965-e5f215234ba9@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FRYP281CA0014.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::24)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8574:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dd21813-8d9c-4cdf-ffe7-08dafd2f2a79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rQhz6tHJaldf1i6DV0VdLn2DadreXMRQc4HbmgoPBMPTv013Rm95YjB2a7vEwLbbUmHGnL9bi/1Vz4+rs5nXxKmGAExuuSo6Egr1a7ByBPNM2LnPbhvEhaxN9tXldbi36ictl6YjWJtscVShvZbVQi0VoMnZLqcGYiZNzclxh+jxtV3GJodm0u7IFpS37XRMNyN61/VVXw9/y86Yth9/zZ6GiqU0qdjIVWyxLAs5Z7s74wGULAt6rIl4MCZQopeiAFKe/UYRnPbOojROxH0sbe5Go9N/SqmYDOey4Fpte7dnYoxZTQxbkQbSNUC7SaebjGjt526eCnTeo1jFDqvRgL5MR0PzKLZHudZexGgV6iIKzkfww4WdMGAjVGKlLFcfZ9wrtEOqG22aceu73umHw7iUvnDl7C1xwI2y2ZKI6E6q7BYOOH1x+CWt8GpFXWIpjgFAM7p5b7i3SBmwhAH1F7KPdyxC2miHZ7j06H4U9kg9VmpENq0vCsbA0Wf/KvNOciwfAUGRdjcJt4kBFY/yJZrqFqMxvRFR2Gy1Swc5WI8/XfraB94/8d9GTVKHeArxfQbof+Io1JgOS0lSPH3lwLv4PLD3y3pKTH/Fhp7z+migscQ6VxtmN4r+TxbOpcZm5M/BZDQrdzb7xRRMlHS0KWBHm1xYxmL343moZeMeDnnn8M6JBItZfgu/g8KQbMyzA122aBNXjS3hXLVQdNtbMSsdVTnK1ZaVHoRKiuAv8Z0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39860400002)(366004)(346002)(376002)(136003)(451199015)(38100700002)(31696002)(86362001)(41300700001)(2906002)(4326008)(5660300002)(8936002)(6916009)(8676002)(26005)(53546011)(6506007)(186003)(6512007)(66476007)(316002)(66946007)(54906003)(2616005)(66556008)(478600001)(6486002)(31686004)(66899015)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkloUE9vcUYvdUxSOW9WNmFuT1JBNFhhM1NtRDljNnJjRzc5Y0p2L085MDYx?=
 =?utf-8?B?dFBuL0tOUmdaZlJwOTFjK2VzUDJGMlJJdFk1U0NGWXFQdktIOVlYdVNISlh5?=
 =?utf-8?B?OUlIaUFRUjE0eVd6VG1vbmUvZFpFTm5rQWxYdzNyZXBDSExRcElIKzFmQmdW?=
 =?utf-8?B?elBNTW1GMGdFb2F1NVdZOGVLd0hXRVFzMFlMR0xDcjBMZG94Y2NuZDZ0aGJD?=
 =?utf-8?B?cXA0ODc1MkhNWFhZUzdIQzkwZWxoVHIwazF4RndkNzNXR2VWNHNaYk1vUE9C?=
 =?utf-8?B?enZFb1hpT0pRaTFySFZIZFRDK21mLzU4R0tuZThvZ2VSUHNOVW9aMm1jZlRr?=
 =?utf-8?B?WHdoSytNZVN3MS9XWTlJU2VjU1FSZGdFaFVrODNObVZDRkwyVzM2SEVuMEda?=
 =?utf-8?B?TlFlS1U1NUJtTkdqZkF1ZFBoc1RTbHJoTWVJUm9NL3VWNXVCc3Fwekh0WlA2?=
 =?utf-8?B?bndEQjNzbVZESkZsMm96ZTQrWnlOb1pVcnV6dEoycGg0bXphcktydlBvWDdF?=
 =?utf-8?B?QVRZMnBsTVMzQSs3Z0g4VzNCQ0xIVWc5R0FXMlJpcGRkVTQwYTNQTE5pUURX?=
 =?utf-8?B?cmNvQXFMWUw2RFhQNkM5WlVZMzh5MjZvay9UTkluM0diRU5JanFic3d0RzZu?=
 =?utf-8?B?ZTBzaHNrRVNmYUE4VlFIZGZTSEFzR01MZmNyeDJIYTNJR2I5bHJTTzB6d2ta?=
 =?utf-8?B?RjcyRDJ4cEsyQm5kZnRZcWdaS3J3Q0lBdWR0SWgyaTMwS09CMkJsdyt4YXFZ?=
 =?utf-8?B?SkFnTFJkYTlIbU5VYjVCY0srRXRJVzYyeHhvOVRDV1Z1QmxsTWttNGF2clcx?=
 =?utf-8?B?MFNlZG5kbHRGUUlQalVmNDYzWDlpS1ZtTHhWaHA4VWF3Q01CVlhCU1BzdEls?=
 =?utf-8?B?eVdIaEsvY0RhQ29USHdOeHRqN3AxdVMvV1FlaWlqWHRLUDgzMmJSVnJpYUVB?=
 =?utf-8?B?YkVyWUs0Q0xIK21VbzN6V2lQR3c5M09DejVCSE9JczF2dE84Y0RGaWJGK3Js?=
 =?utf-8?B?dS9pWE1qUDBQcURIOHZJQWhQU0d3V3Z3d3Zsc24zbGpFYitXSTN6NC90QWlZ?=
 =?utf-8?B?WnJoQmFncDZzeVdxOXBGNEx0M3dFQTBvUWJxNC8vZGUyZkNTejZhcUtDWTdD?=
 =?utf-8?B?ZENzS3ZPWVRwK2Mvc0J5aC9zb0tFa0ZzVDNpdElsZCtydUtRMU82SDlMdnNY?=
 =?utf-8?B?TXdRSUoxSE5qb3ZhMmZzcW40K1FEczhvRnZlUWdPbDhTOVozelNrTTduWTQy?=
 =?utf-8?B?Q1NyRlNHNUlCNlJrZ0d4bU56VlBGOG5BeEl5dGtDT0pUcmhkQU90dEhzREFG?=
 =?utf-8?B?WmpHUXpzL0xuMzhaOXcvSkRaUllPMTZ5MVpZUERTcXNkLzBCb3N1ZFRXd3p2?=
 =?utf-8?B?elo2eVRPZDZuRnRUMUtSdHVXcitBSzMyVlV4Uks0cXFHWmdUVy8zb2R6N3BF?=
 =?utf-8?B?c1V4SHZ2RWc1S2grTXVMRnpvNlBqdzFaa2FaMW1MZmMvanI4M0hwT05ZRmNl?=
 =?utf-8?B?bnhib1RISDZ0M09EaHV1MmZaTW9UdzV0UGFSRk1xdE9SQVBOTThmYUFuc05J?=
 =?utf-8?B?czdQa3Z1NnM5TTBPeEFuVlhtOFBxMVZaSTNDLzdBQjBGWE9FN2RJZ2MwKzd5?=
 =?utf-8?B?OHJRT1V4Q2RqQWNGY1dDK05MRmhiYlJ3OENEVE15UTlhTll2SHVFVGdscDYr?=
 =?utf-8?B?OElTb3dMK2xPL2pxb2RiRC9hMlBmSTAyekl1di9ZSXhKU3pxOE0xUEo3UWZi?=
 =?utf-8?B?N1Nkd29RSkUrQjhOOTRTRnl2cHlpOFNERWRsclFMUmErNysya0lXR1ZVZlhw?=
 =?utf-8?B?eWhUZytIVHUvZjNEbFNRM056SnVDLzJWMmJzbi8vU1RpdVhvb3lDNnlpQS9n?=
 =?utf-8?B?MTdUK0h0ZG11VVE2empPRWs2Mk1xZVdIa2ZQYnZ2T0U2dUtNY0lxSWtLeW1n?=
 =?utf-8?B?NElTbVVWM1JMS2NjSmkwZTlSdUg3KzZibGIxZXl0ajFtSHVPQzZqeXh1VFJa?=
 =?utf-8?B?NDd6S3lIOHRxSXltRnBJMjdxdXd3K3JuM09HSHFhZCs0cjFOakx5UVJMeDgy?=
 =?utf-8?B?MlVXVXNNSlJYS0wvaXU5ZjFaTUszYWhKOTRkcTZSQStHamFTWkFsbUhxcXpP?=
 =?utf-8?Q?4CQ32mr7cMMZ0lu/wvXQg5QNZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dd21813-8d9c-4cdf-ffe7-08dafd2f2a79
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 10:47:04.7712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l4mlMF4eIcIOlI4zP8B1/p8KTkc7dXQ7JgbyhYJ1g0n0f2/OAh7qE975x3m4ruN4ZYxkcltYkU8SlUDLkHTfTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8574

On 23.01.2023 11:43, Andrew Cooper wrote:
> On 23/01/2023 8:12 am, Jan Beulich wrote:
>> While the table is used only when HVM=y, the table entry of course needs
>> to be properly populated when also PV32=y. Fully removing the table
>> entry we therefore wrong.
>>
>> Fixes: 1894049fa283 ("x86/shadow: L2H shadow type is PV32-only")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Erm, why?
> 
> The safety justification for the original patch was that this is HVM
> only code.  And it really is HVM only code - it's genuinely compiled out
> for !HVM builds.

Right, and we have logic taking care of the !HVM case. But that same
logic uses this "HVM-only" table when HVM=y also for all PV types. Hence
the PV32-special type needs to have a non-zero entry when, besides HVM=y,
PV32=y as well.

> So if putting this entry back in fixes the regression OSSTest
> identified, then either SH_type_l2h_64_shadow isn't PV32-only, or we
> have PV guests entering HVM-only logic.  Either way, the precondition
> for correctness of the original patch is violated, and it needs
> reverting on those grounds alone.

I disagree - the table isn't needed when !HVM, and as such can be
considered HVM-only. It merely needs to deal with all cases correctly
when HVM=y.

Jan

