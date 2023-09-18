Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A5D7A48FE
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 13:59:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603978.941162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiCta-0004jg-0J; Mon, 18 Sep 2023 11:58:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603978.941162; Mon, 18 Sep 2023 11:58:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiCtZ-0004gQ-TC; Mon, 18 Sep 2023 11:58:29 +0000
Received: by outflank-mailman (input) for mailman id 603978;
 Mon, 18 Sep 2023 11:58:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q4jH=FC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qiCtX-0004ew-WB
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 11:58:27 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2061e.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id acd86f28-561a-11ee-8788-cb3800f73035;
 Mon, 18 Sep 2023 13:58:26 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8849.eurprd04.prod.outlook.com (2603:10a6:20b:42c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Mon, 18 Sep
 2023 11:58:24 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 11:58:24 +0000
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
X-Inumbo-ID: acd86f28-561a-11ee-8788-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gDiD1kLvJ2wW3pa6BVE8mdwud4vPafRG4aGe4COz92MxXMIWLX9uCH/tT3EhkYOW0mVX8GLUMJ1YuJ0WwLkVnSfG/JoJvWxHUKTMKB8Wxntq33UP8trRFkY6IGa/W+q8V4xR6PIuvR9LOnVw5wy5BColZ7e/BdDDRFZHn1DNfFMM3Buulrf0PvlAX8+K3G3dCMoTxj0o1gDTY4N7T2laeAbL1QHAOJMXXZ7UzTZgsR3LI1wkCdOAcSrwB6dDWaxrseotP4oIo1gX5rgmyfO2YJb5oVSuDcTtDgKlKq5oL3XXPfnD6ERgMZ2SuLHRJvrm3CcrpIUXmGVSSDrTtX42hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a4Qr5DCr8WQmHdj2bDKGyVyFLjkgIlPgXF08NC3NmhA=;
 b=OIHyF9yOiZdy45MbxXQoznE4STV+3VrgbhDZnbp8ldKznZXmOCqbdXL3Ilys3EG5vpKKPV1qudQSdS7N96LqMiZ9OBYWf3SgP2D4wRjoxwIYF8jQtGTbflOcocnTgzcv81D7Bkk8nPYKQvSPr+mGGkcYD5GBNksqCIOn2GgsuMILDzM2F9R5z/vbPJbnk4QYffVnTDt/hEsiq9zmFEmcWlFc2qQRY6hiKCzTJrVZ7kRb5JPk4brOpBAH8ekjUcJKeiMmC07tFqd5AM/sGi8qT74bJIdkBkROZdgy4yyCTZjCIOKE/p0vC4cbVfD1t8KmkIeTs6Hypty9jKV0nkDYkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4Qr5DCr8WQmHdj2bDKGyVyFLjkgIlPgXF08NC3NmhA=;
 b=srhtUnvv/c8nbASJt+jt7Kfe1+VfHT/cLDrgl/b5e1iBWK+N0lupxCId9AWQmQeJBzEY6iG/LGNyOwqkFA4z770o6PixbmKfFIKUQyIpyE3cA2K/qy+hvr1k4gxdz60GQOrdFMt4BzUkI+7nnaD/I9Q4FYZ0JA3e01GBBWseBVuOKi6qsjsdKWRU5ndYw8kVkpbT6gfMnSmyG5XZbdPpHVD6ouPqmwSs1IMi1WUOTuTY402pujenJweEz1gUOUW27On/LIpkrGmn+RhWGvk5y9jDd6/wos0tIwtyiDMFXwTJK6t5lJ0mYhf1pZ0YvznamRSKFDaWuIOWpiveEsz9ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2458f095-85db-f429-eb0c-20304b403f8c@suse.com>
Date: Mon, 18 Sep 2023 13:58:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] x86/shutdown: change default reboot method preference
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230914152120.92696-1-roger.pau@citrix.com>
 <2d767f96-9f20-e786-9148-cae5c30a41fd@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2d767f96-9f20-e786-9148-cae5c30a41fd@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8849:EE_
X-MS-Office365-Filtering-Correlation-Id: 394ebff2-812e-4aeb-7aec-08dbb83e8f98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OriOHic2xeECcJPJMZX5io3HKglBrti1tFw10lbrLEULOm9pfISc7yYSaWOzr3owM+sVRhjh0b0N+4BiIUtrw43cf1Dj6DFnePbbNj/NAfQoEqVwDaPAfbN52fkr5uUxW14YdjCygQ0tv0n/g8eD2+rrYHHSdf+JoZFUCn59gB4o7YjRwGG4HuB39ti2tPaWNoyxVUsD63D1DSLCW56/m0pEszqJoKUsAQHdQxe4f82rMJXkwY2VSHfb+iNC1fniyLOdFdHUM04ub+wVrQZLbQlme7YZyWYQbzZtxyF9TsnODzngWJNMFHZYnvD4K9DYIKqjJRUFv9dewxJLgM/n1D8pKeIG97DBL4Raqwc/P62s68zR6Bp2fK6tA1/Fpx/wKXqWvAid98/z2VOsVR9W6ZX4tDWXttw4zEYpmHbMUeTPyqndZkE0Awljy/Znr4u+BVpZSnMjxtusCm5D6AILrjTDZdVBys7g2TKxo6F1aQUCGTsGHWCRdI5UZvBXKZD7haBrev0fowihAN4FqXE0lNA0k1d1ga+fYd3bS/S9DPOYlpgYYpa5GlKuLUARxxT8NLTLA6TkNy3I5tTW8sW3o2mmUgwDIWR6PToLuW2T1wXLoKKpOQE62UreHQ/FAy72NwwauesAVVcrX9YTt2hkIQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(396003)(376002)(136003)(366004)(1800799009)(186009)(451199024)(6512007)(53546011)(6486002)(6506007)(6666004)(86362001)(31696002)(38100700002)(36756003)(2616005)(26005)(110136005)(66556008)(66946007)(4744005)(66476007)(41300700001)(316002)(2906002)(5660300002)(8676002)(4326008)(8936002)(31686004)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3RTYlo1UWRzT2lmbDNpMkh4Mi84ZTQrKzFvVXZIcFVRQ3BJZENDNFAzeGlj?=
 =?utf-8?B?bXJEVkJqeTlJU0lIYkY4V3lIdm5pRllSckVvK3EvUFl0YzEyUjZad0kxZlJ4?=
 =?utf-8?B?RW5hekJ3ODdaaDhBQ0NvUWw5ZXlnTEt0dTBlaERoVjVGRWVIMmF0RmRXcXc4?=
 =?utf-8?B?YmUvMkRFMlpXQTFIOERHYWtpbVRtMjdpbHpscGlkZVhNWU5rck9tNlR0MFpH?=
 =?utf-8?B?bnlSS2NtWTg4ZFJBTXZxNTlUSVE1b1drT3dZdnNrU1NUYldGbDk2U3d0ODlw?=
 =?utf-8?B?SjU5QXl4TUFrTEdmSW1ieWlOVzErTjJ4dHkzVWM2Qkt4YThJU0hsR3BSOWZv?=
 =?utf-8?B?QmhsNDhZRjRDZ3hyT3NZd1RBdUdWZUlmTEFCdWQxdHZsNkZ0VDZQdDhtbGpl?=
 =?utf-8?B?cXhiZzhqdzlvaVRjVUVyWjJzQ3BGSFJUOVNIVHo1dm5JZ21NVm5GWXZUNXgz?=
 =?utf-8?B?cWZ1aU92aXBZVlo0YW15bGgrYzJtQzRpRFNPaTdDNEc4aUowbE5CZ1FyRmo0?=
 =?utf-8?B?TDU3VXdGWndLTEtTTVRzVDZoaUJoR2g1N2JPelFYZWpZNXJMbzZKREhFSTIy?=
 =?utf-8?B?eG1RRFJLOTJvR2pJcmFMd0YyOVFERzVzanp0R1VnV1I2TVJSTE8zRytSTFU1?=
 =?utf-8?B?OWx5Z0lLaFVaa1pIUVhqVVFVRDdLakF5Z25QaUVuMS9MQ2tYZFUzQUVycEMy?=
 =?utf-8?B?aHF2Z09jd3BMTTBrNGVHNUwwaExXWUVwSDlybzdENytISlhpckZvTzFhM25O?=
 =?utf-8?B?UlBkTzhWL09uOHFqdU1NdXZXWnVUSmJ3ZzF3KzVsYlBWQkx6ano5Ym92Mk1V?=
 =?utf-8?B?QmIvUXRiLy82SDBlU3NZcDNDcjZsSjhGOGpEUEtmRm5ML1g4Z0ppN21LbHZp?=
 =?utf-8?B?OC9HQmtpSU1uVnVsUHdOTnNHcVFQc0ZydnFrZjEzVXlNRmhFUE1EOXI2TGhQ?=
 =?utf-8?B?Sk9ZSjZOdFFwY1RjciswWXNTVWRzcmlKL3dhOFBablgwTC9yNHNxeGlSNm5K?=
 =?utf-8?B?K2F2eFQ4dVdJTSt4SXg4NDlzUjl3VEoxL0YycEZYRi9rZXNXeFBsVUcvMDkr?=
 =?utf-8?B?cmlQSUpHeEp4b0ZDM3VOVE5ZZXVWcW83c2x4MHNLQ2N5SEpjdmZjZlFQTUdR?=
 =?utf-8?B?K1RobGxQUW1DanJQcEg0RmVPdUVUTlY4VDNMUlozd0Y3d25VaEh6bXFXQkJI?=
 =?utf-8?B?M0pJdk9RaHFCS0lrU1pnNGdiNmVUdnZyVjl1S1NxREY1V29SMi80UjZsVStS?=
 =?utf-8?B?UEVGdDdteSt5dG1rTzdJcE1IT0o1WXFtd1kyajBHMjVyaGpsUVBPYnl2VnBk?=
 =?utf-8?B?bmJlYVBNRDloVU1reHA3UVJMa2MxOGdHU1NoOTcvb0FMTkpDNGRiRzQ1WTNK?=
 =?utf-8?B?bWdUUzVHR0V0bkM3WjhyNjY2bjcyNjNOZWpQWW9vb3FLdU5TNlVjZnFNYklF?=
 =?utf-8?B?S2xpRjAzY2hJVVE2TmZ4RlpnTGpUS2lRcG1NVERRSSs0UEJObFpGRVErR2ha?=
 =?utf-8?B?UzYxM2JKMkJrRE56VmRwaXRnL0RMYTBOK0lUOCtnK2QrOSszMWh2YTFiTG5L?=
 =?utf-8?B?alNMSTdvMTlTYmlxblVPdnVwYlhXUURtZFVydmhnKzlPTnUxektsakRnZ0sz?=
 =?utf-8?B?WDlzNWdNRzJtKzlsVUxJSWVMQTdySjdzUk04QVlLVjlBNGNzWDRRNHNCNVVP?=
 =?utf-8?B?eUZ4M24vSk1oTmJMOG00TXE5WWNubGZLR2phSEp2SktFVS9ZYk1sS3VIS3Y0?=
 =?utf-8?B?Z2dQaGVoM2hLbk5lNVp1V1ZKSXNFMWx5K1hYdE16L3BpUXlOTE50NHI0Q1Z5?=
 =?utf-8?B?TjI2NnQ1ekVQNnd3WUtpenIwMzNtNnVaNlZRRmJPYjgrWU5YZHZXdVp3UVBr?=
 =?utf-8?B?TEVIYW9ZOHFscDVzQWlQeGlwNjZnaXN2NnBVbWhud3VHSjZHd1I3YVdiclBE?=
 =?utf-8?B?NTlKOXNyWWtmSWJnNGwyOFFVSzRlSitUREJtUlNyc3BlVEpLc0d4ZUtwUUZj?=
 =?utf-8?B?NGRXTDdQbzhGS1NjSENrNSs2anJ5aXB1azlpbDhjSEVqQlpyeTQ1b0JyRDE2?=
 =?utf-8?B?cFhTZWNYWkpudkR1dlAxQWx3ZTFPZ2wzQWo2Q0twSTZhNE5VSGNLK0NQd0la?=
 =?utf-8?Q?1Oqea/+2W1ZdulX7Cem3gPuxk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 394ebff2-812e-4aeb-7aec-08dbb83e8f98
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 11:58:24.1587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TCNjYI7ezxZ2otDZf+b5+9ejKM237deTh3ZuvlQkQz/3mAy9KD/+bEvzMu2uz8iUhvNdUHGkoUZg3d5CUjUS9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8849

On 14.09.2023 19:42, Andrew Cooper wrote:
> On 14/09/2023 4:21 pm, Roger Pau Monne wrote:
>> I've found a lot of boxes that don't reboot properly using ResetSystem(), and I
>> think our default should attempt to make sure Xen reliably reboots on as much
>> hardware as possible.
> 
> You're supposed to use ResetSystem() so all the value-add can be added
> behind your back, but it's a chocolate teapot when it's so broken that
> none of the OSes use it...

That's only one aspect. Recall that EFI originated from ia64 bringup, where
it wasn't even specified how to reboot a system without using the runtime
services function. Fundamentally under EFI shutdown/reboot shouldn't be an
arch-specific operation in the first place.

Jan

