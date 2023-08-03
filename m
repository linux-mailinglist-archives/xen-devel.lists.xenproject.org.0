Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4862476ED3A
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 16:55:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576454.902604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRZjA-0004fs-3v; Thu, 03 Aug 2023 14:55:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576454.902604; Thu, 03 Aug 2023 14:55:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRZjA-0004eB-0y; Thu, 03 Aug 2023 14:55:00 +0000
Received: by outflank-mailman (input) for mailman id 576454;
 Thu, 03 Aug 2023 14:54:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRZj8-0004ca-35
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 14:54:58 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0623.outbound.protection.outlook.com
 [2a01:111:f400:fe02::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b35c4832-320d-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 16:54:52 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8533.eurprd04.prod.outlook.com (2603:10a6:10:2d4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Thu, 3 Aug
 2023 14:54:50 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 14:54:50 +0000
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
X-Inumbo-ID: b35c4832-320d-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LBE6Ojih0w7RL0+3LZ3AXb1RnbSz5/tVm3LTSZ6/axMXXw6nVe3YDlEsFrNrqyOdpJje/fUolfaY7csnJ3zUGkVhwN2BCA22GSNFxkMscKPPGSQ6967FhD59gYxfoJ+A0lYnPr9rd3BNsl3cCZM2pttDj8w8HofiWOqHZnNfNQXpprR8QXtl9kOyamx6PtcsBSY9ojJxe9YwI3PlafOlB+ExJKrmSQZGsuTsV6LAjTIhb6yuON0W7u6tCSgqyZswXwJ9gOk8VpDsvMcZ1vE4+TYHDRhA50euv6C/7ROaFotnZEvXAHyGLJL5Vt4MtrYxqehpz2KicZr42qlcAM/AhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L7bkNJqp3St7fRuY7Bj4G78GKIHC1TqIMBw5kretX/U=;
 b=BeOwfBRfXGSW0R0klIwMNBg8LJBnr6ddjq7ugjsbh2LCXe3VE8oYEX9cBAVUIvQAkPzK+dyWIaGxA86Rmr7xmrAeVWRgMUQxwveo2Fv6FwoRULLS09PD/8E0EetdJb7zwB/SGQWUX6iA7MO9MF7/Ec6lp2UBfZhBqT8Y6txvuW0QDP7g4SQCdAh0tSEEFt/7WnOFaRmx4RF1C10clL+cJqkmEPiAo2+OmNEiMpehopdxo9ItnZ8+Ct57wEx9TW/qiufrfYeTaR6sPmHhn+rvulXEePRBwbdV2w4cfFQOOtdgxQ8uipHvHk+TV5XM1Kjgg6iEcFq2QJ0ERG7ABk/0Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L7bkNJqp3St7fRuY7Bj4G78GKIHC1TqIMBw5kretX/U=;
 b=OBLoa30Y+GUcvC8zfqs8A+PG58GEbILFdpoIjoPfmrwH2NVehedOEMRJ50OlsO8RHhdEGDwLX7fPoYV0+MPdahW0x3TvQhjhG4Rqw0s7zTP+yJLsMFVQGi54ZWr5jMgL6ITzzGZ9D/j/AshnlG0sXSdnOmbcg8APpDaE2QnLGhomsj9Bqyj4Msgbl187CmidHId1E80TPecrqG5uk8EloVMVgkDmL0yb8BFOeqIrnzH2KrvixlXWQi38FBn4sIe0l/bJoyyYUBEjq1IjSVuFbQBlxs78NmlsugPFOYUKXe8jeDnBLTGVok7glSoHdF0xEvHrUtQcVpQUTCIwYCUCFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7bbe2f11-981b-5e0f-8bf4-b8d0b4a2ccc9@suse.com>
Date: Thu, 3 Aug 2023 16:54:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: Call for agenda items for 03/08/23 Community Call @ 1500 UTC
Content-Language: en-US
To: Kelly Choi <kelly.choi@cloud.com>
References: <CAO-mL=yUogtHyY6jgBo_6W4WfhypmoF8wsJDA3TOzPV74+j8Eg@mail.gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAO-mL=yUogtHyY6jgBo_6W4WfhypmoF8wsJDA3TOzPV74+j8Eg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8533:EE_
X-MS-Office365-Filtering-Correlation-Id: 56e49c69-8539-40b8-ba50-08db94319698
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XCeBqCfZGO1sZxo6utfnBdEMi1jqov6z6I4X0kOwn7WgjNNH0LCw1T4DD/hnmOuq7tD2MMXwW6Qppdtitce7HhBg0Ya+QWkxN43ZfZocQBjBLzWyd+coquiKnGYssX7R50g3OWVExyv2CQc9E+xHg+delXB7KkG6DmI3Oyr58hAJ8cP8a8R9a7aU7bpUkmaZMnVT1/fwlicL0pKx/7gNZyJ3VFtxsGIrJyA60PiJNezZkfOQkxQHXM8Y0re+ILUxoXWRfsQfMM+6QBPwv+kjtkLzyM1jlxvnAknnntCkpoQ3yvP7gGvz70pBC1NbOE+vUy32FtUnDyeVYIAPlrzaVG6WQxmu6Uwj+r72sAkhoB3ja2Cf0psKTJ0uzMLi6xiGZrkLGZWK+BJWhzzx8U3QLTVMDgK1SpaicClO3+CtX4cmnw5yiWRXKN2odfCRCfA0bLzZ54n0f4uNzZFa/+lVM0iqFphNRNjtgXqH2B2vSgZAxLx4zX5QDgWFPrD+Y1NshCN/SFmHqEdsv7uIR2zZT8PJSnyTclA7ud8wGvDf7ZdY8AC2e0CpjSpSBCz7wthDLtGRN6f7rF58W5czlEObDgfRr4NF+1jkshOqQ5hbZec4ObJUJgu4hncwlI2UX/StcvR05pM7sGJLCbtQbD+qpXZpf/QFEYbqDeZ9dYZr8yg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(136003)(346002)(376002)(366004)(451199021)(2906002)(4744005)(2616005)(86362001)(31696002)(38100700002)(36756003)(41300700001)(31686004)(6486002)(6512007)(966005)(66476007)(316002)(6916009)(4326008)(66946007)(66556008)(26005)(6506007)(53546011)(5660300002)(478600001)(186003)(8936002)(8676002)(221023011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTVmc2Y5Vmo5RFA3MkRHdFlFS3o2Tm9weHNSMFZ1cUVYeTRNZ1hPZmFYWmFW?=
 =?utf-8?B?emtjODFiOUwrY2JkK1c3ZnJxcVdFNnFzSUFaV1BUaFlCdzZCUlFUTkdVVzFk?=
 =?utf-8?B?MnJhUUkwOVUxelg4WmdEVkpvdXAxcDFKeXlmTjlXRlpjV1VkcGxaLzg0eWFy?=
 =?utf-8?B?WHZrdzhMUFZxM295ZUsrOGpaUUZCajQ4QlJET29wakx2UXJ4bzhjYllqdEUy?=
 =?utf-8?B?Zk5UR3FmNGJrdTE4RzdGZHQzNUlsUjhmN3AxeWE4WjM5QTFHbkczNWE2QTc4?=
 =?utf-8?B?T3pRRFV3R21TWHBqQVovczN0d3hPRDJWYzJVUUlaQlZkVVFWam5tUS9wYk1U?=
 =?utf-8?B?NTBGNHlWcGxrQm9jMjV2T0R6WmZSd3ZsSW41cFFhUGR2dmdON3ZpZUlnbi84?=
 =?utf-8?B?OHBndGFZaEhSc2V1ZVNuS3c5elBMMHFIZllKY0JxZCt1R2R2QWVzaHBDOTgr?=
 =?utf-8?B?U0pIbWpac1J5bWdZQ2dHMWhoZllXeEdvbzFQRG04ZTlyR3RxVFRnTDdPaGRP?=
 =?utf-8?B?Mnhyb1QzN3FubXhrc21haGtma3k0czFzS0Q1MFNEcEpuT2NUSlozN1lpTzMv?=
 =?utf-8?B?M0RRSytPL3hQUmNFelJZRGltaHVVclFPaU02VEJXQkZySWsxb084SGU4bytp?=
 =?utf-8?B?QVhkZmxvRjNLTVpHUjI0WnJwTU1kLzlzdUszWFR1cHJWczNHZm9xb1pEZENx?=
 =?utf-8?B?Uk9ZOUkyNmhyT1Ewcjl5N0JncnBhU29hRXdybGtXTGg5RXZCVkxOQkVxTWZ0?=
 =?utf-8?B?Sm1ZQjc3WEh1UnI4SjZ6bFBuU1VZK01DU0hiOHp2bHZxK3Z0ZHlCVVM3UWFV?=
 =?utf-8?B?bEtLTDN5bDFoNWM5aWhxMmhtYnBmN3c5QXNENmdiTDNkUXFkYlZCbDg2UlRh?=
 =?utf-8?B?WnVTSzRJbHY2V2NCTVEvSHdiQ3NiSTNRZ3Z2enRQcmxSeFBKSERvd3hIVzRC?=
 =?utf-8?B?RFhxdVF0enoydThpNE1OK1ZDVTRwNTV2N2VpT1Bxd2VXWHdCQkhKYjRpY0pa?=
 =?utf-8?B?dmZ2cUxVUW1IRHE1UjBxSzhWUzBRTThtRUxHc2tUa3ZTK1g2K21vUTlXLzYy?=
 =?utf-8?B?bGNEU01GUDU1Tm1XVTF6WFJGVE5xcG9UVWtScTIzVkRBNW9PRXovL1J4Rzdj?=
 =?utf-8?B?YVg3Q0kwWHpKV3hwQ01oOU1tdVp6S0lQNmwyODg3S3hUM01PMVZva09WeFBH?=
 =?utf-8?B?UmF4b3VKckt5bHh1cFk0emdvd3JOVzhHL3FIakYyS1kxV1Z6YVg0ditQbW1H?=
 =?utf-8?B?amRyd09paTNxSnZOaHMwYVh0dkpUOWZrdmRiSXhPTU9KdE95YkpkSm5ZbGdn?=
 =?utf-8?B?VHo5TVRDeWppWEI0NjVZY2EwYWlsclJHTjdDeENabEFVY1pWamZaalpoWkk4?=
 =?utf-8?B?Snc5NTFjMXFlTWU5U2J2aUhsaGJERzZwb1VibGYxMG12S0Vtcks5YzEveERQ?=
 =?utf-8?B?QWxLa0sxc3o5UHlkOEVGOWhtR2EzRG9Ud3poRFd4M0p0M2dEMllYR1BIWmNB?=
 =?utf-8?B?Y3dyZGRIWXRHWlU4T3B4RGNNTUkwM0pvZUhpZ0pPUU05YnVZdWloUGk1NU1Z?=
 =?utf-8?B?NjVqbTJrcEkyNTBZS2lHOCtJSHBIQTJ3dFlIMWtQYjQyMWpzYjdURCtIM0h0?=
 =?utf-8?B?NldsTWRSbC9oSDFmYmJjZllWTm1mZFArbUlsYng4RnBsRXBLNmJqaTFIYThG?=
 =?utf-8?B?QkoyRDdNNytNSTljNmhramtkUEEyemZ3M3NGdzdWY2J1MWc5b0VvaURZZ05o?=
 =?utf-8?B?bDJsWlFoM1ZCTExyU0xCVkd6V1F2YmhHbVRjdWxldHRSYWFNUnpUSmRoYmFF?=
 =?utf-8?B?V3VwMVZTS3c1MDVvN0Y4aUFqOUlDdjh2VkxtclBNKzA2eHJzYTJrbUhSU3By?=
 =?utf-8?B?VWltRm0xTDhBc1lvYmRQbFJ0VVVldTlKVElKbmxjeHpuMmY1dDBVZmh3Sk1X?=
 =?utf-8?B?S0R2L2hqTTVPTmozN0srRGVyN2puMGdSbGJ4OWJ1R0JQZ1hDdEFCV1cweU9S?=
 =?utf-8?B?bHNMNmRrcVR1a1JXWHlLLzBJV0svYysvdWdydUdkUTlaelIrTENFd0oxSG9F?=
 =?utf-8?B?T2pFSVBoSHVnLzBYdjdXeTdQdXcwYVZoQW5jZG5KRzIrU3l2M0czVEpFNmpr?=
 =?utf-8?Q?h5byGTSqMZPykQuNxIDm4mXU/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56e49c69-8539-40b8-ba50-08db94319698
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 14:54:50.6199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YI/jCWtN3bdeU2iG/kUjVo6s6/Z4PnLNvUUtjDnpEX/cB9LGZqXPAyZ2D/Fs5yn8KcB9jWlAd+3cnGtKPy0aOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8533

On 03.08.2023 16:48, Kelly Choi wrote:
> The proposed agenda is in this link
> <https://cryptpad.fr/pad/#/2/pad/edit/vQgbgUdA3hhXYK2XS79CAgEs/>and you can
> edit to add items.  Alternatively, you can reply to this mail directly.

Just to mention it: George has previously pointed at

https://cryptpad.fr/pad/#/2/pad/edit/Rk5kDLwcc7CrqFm6O7xq2Jci/ 

Jan

