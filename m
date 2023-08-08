Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71277773A5F
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 15:15:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579850.908008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTMYg-0002GI-W9; Tue, 08 Aug 2023 13:15:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579850.908008; Tue, 08 Aug 2023 13:15:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTMYg-0002E5-Sv; Tue, 08 Aug 2023 13:15:34 +0000
Received: by outflank-mailman (input) for mailman id 579850;
 Tue, 08 Aug 2023 13:15:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GY6=DZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTMYf-0002Dz-30
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 13:15:33 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062c.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6dab170-35ed-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 15:15:32 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GVXPR04MB9952.eurprd04.prod.outlook.com (2603:10a6:150:117::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Tue, 8 Aug
 2023 13:15:29 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Tue, 8 Aug 2023
 13:15:29 +0000
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
X-Inumbo-ID: a6dab170-35ed-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f72ammhn/hSC7P8T7jXx2rQk+VxGafDNDTQtUzSAiKy5Yvk4jPalGu0Cb3r0tWm0YsqWgIP0Q0acPYDCktNHuCvMC8gk6ITys/E3Z2LcbzjrMBiHNo93qUmIo9kWqh+bAkJVta8ZQ9icIVlIX2ymXKGDnLhs2jrPxJaB4btv3aUEwg+l2YIQUUQv+d+srvrHEB9iuSpPJBGC6QrsYJPbJn15pNJxgbLYXFW6gWcKCQMnGAH1g2sckF7z5Kxe4psyg6kXoMOW18vP9J7Rwrfst/ZfjQQNBJMXEc0n8+o19QtjzN4J5HeNdInfx7KEHaG9FewC56ydk1HW6nB7EEXW2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lAOXKKo0TLRDPIkp9mwQunwjQIo9OyvBvSz1/TOsE2w=;
 b=QD0tJRFUwNnIXH5rbnuVPVu0RHbhCxkE+T4OCfu9RcPKPHPUeDqeS8X0FA+3sKya/D4XhW9p2usbVe5dRaidt8rCL1Ue60UPPpOOLPW022QRyMzn76nREEIGzp6tLn+zmbaUT02ppRn9itZmLRQG6Nf//2f3XQQsSTnKRMu24qwvpZBoranFgrtrDbmeVxsV96tG7MMQzqTeJPx7Ba2Wc71f1E9zpRaFXwcnGbMo8FPkM0KFZbUFatWA/HMTZH2ZEZwdt5tgH9GcUOISQbpRAXDA4KmBevb7/Zsh9S1ikkYO2vu9Hnxhh4wZ0a0qM3lcQloFAG5Pmv8eJ5DMrLchdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lAOXKKo0TLRDPIkp9mwQunwjQIo9OyvBvSz1/TOsE2w=;
 b=h4Rw/cUIz+NOqKNnwBFclaJYcf+lERE74TRMKDp1vc8RTD0IxhagkVnOm36p7QalWFxkP8xQYVyP6de/YJVF9nL6omYlUtzaHbZdWbNj7LrfVwsGqJKQ+PH4ZY6S3bmtqJim9OWpRRa49F//ZvxHs1CtyTPu2hv81Lk8droXOEVJZihLmeWTdyeF+xhN0P9wz2jlWFAHt6UeDbX4Q0zzOS4PwZUnzyHj5FKMjiPfmCQXwYfNf2pHwuQmPRMT0u4BECDCpd+C/s7gQ2ijDOUHlnk7j6Y2lzhC0C5sbdHVj1fLXHS08KjY7G3jlsUo/y4B/VCoAE5sMeEFz121JO/6iQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c82ed3eb-79b1-e7da-bc7d-1cbf9e12be9a@suse.com>
Date: Tue, 8 Aug 2023 15:15:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 9/9] xen/ppc: Enable full Xen build
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1691016993.git.sanastasio@raptorengineering.com>
 <44fe62a196e2621ac88d0f4b9e7ee97bf1874d59.1691016993.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <44fe62a196e2621ac88d0f4b9e7ee97bf1874d59.1691016993.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GVXPR04MB9952:EE_
X-MS-Office365-Filtering-Correlation-Id: 9214b949-334d-439f-ba13-08db98118972
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uwYl7XHiY9cvBaPHtPwpJhRCOZwxUN2gpDWFdfQRk3anwDmFV8BvGcAbqoEJeDh2VwiopCoHs1Dupse+mUAsuQvqr8oSSIjwX0deezfUGXe3V3Kg+qrxO3c8dcMvFjkOLxtWN5MfuZ1sw9cfIAPYgKRSu3s7lx4fvBJSARMjL8WUOnSaP8ZoImdRwyk92VHx46qpFdJaT4qhaHaaeDrPvKGApxYakpoJImWWPAgC0t4cdA3cEWMhbIn39FQBFfln8qtXAimG/0w3M3/4Yy9//cFXGPbMMyJVmkWmNnOFq4M2zW6WBlfS+5fBgIlg82AP5NHgqfPW0rso4s0ceoz4ANkKVqkSz8UzCziDczRRJroFWlwnPfFK/hH9x/i8OUvobvcXskBSsjj4gyy+6wgImAFlFoTgAlj95pKT/lK0jDEt3Ky5lWBuxn1G2vkUWANw09RMLOrK/zh/CWljh0bZHeW2jwiC9S98SzTwBh65/vbP368U8n83ybY78OQ/95Kt7lajOdflldo99c0N3GGYmNJ4PT/lIknk7p7u43l49ykbwMVjVldai4TCckav/vH1fbgWXoQxbxHjf3MRXCy2qTek9qDXMSb6C+OFZo/ppSvqTkBVdXpqnnwCaPjUabgJBeWM6v4RwJh2MspFue7/OA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(366004)(396003)(136003)(39860400002)(186006)(1800799003)(451199021)(26005)(41300700001)(2906002)(5660300002)(31686004)(8676002)(8936002)(2616005)(86362001)(53546011)(6916009)(6506007)(558084003)(316002)(478600001)(38100700002)(31696002)(54906003)(6486002)(66556008)(66476007)(66946007)(6512007)(4326008)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bStyUTY5UFhwbWN2UUdwa3FEaFh0T0E3UWlDRzFOMnJIVVc0WXhoZFF0UzRs?=
 =?utf-8?B?Vy9uTFppRUdNMTA2UTZTaFhJak0wYVVMaXN1UzB2bzlyZnA2Rk1QY3V1VWRK?=
 =?utf-8?B?MjZnOFVCaWU5Mm9JcHFZemNVM0VWbnZFUUtJdzBTTEpDZlZQSjZjcmVXbERZ?=
 =?utf-8?B?bjVtTGFsa3NXNXV6d2lUYVk5bC83UWZRRFloVk4zdFNEN0wydEcvMHZlK3Nr?=
 =?utf-8?B?bC93SzJVOEYvSmpqZHFBMWZ5dzBEeE9wdHJOY3dCZ0E1S1pONXBVY29HNDBi?=
 =?utf-8?B?NGxrMTNKYnF4SFZVQVo4NjFKc0lMQ0lzVHkvZERGamw1blNuWU83T1J2dW1y?=
 =?utf-8?B?UkZBaGZra2RGQlJPd3RDb3ZVbDlBYTdRd3Y3N1hSc2pvaW9yQ290aU5nRzFM?=
 =?utf-8?B?a1pna2lldjlvazhWYTc5bnE4YWFGaWhFUnV3M0dxRklkYldDamdrai8zQjJD?=
 =?utf-8?B?dTFBRVFWcWcza1pvQ2RPTHk1WHlIWUFmdTYrSjFHSDhTU1NMdElvdnI4bUFq?=
 =?utf-8?B?YmJGQ1V5SUNDWk1kZTU1czdCdmIxMS80eFdraTAvcGtQdHJqUTAxTVVuL3Rr?=
 =?utf-8?B?Q29CZVhRL2pxYlNmeW1EakxHZlpnVzhzcUZuV2lxblU2L0VVL0owL29lNG43?=
 =?utf-8?B?Qmh2OVFzcTVzT29pSE1NWG5MMFVpanBDWVE2b2lMYTdWWWM4bVJpYkZkV0Nt?=
 =?utf-8?B?SmlLRERPRFVFcWFTdStYV1VkblBDYTBrWUVSQ01KVWFURTVxMDhoL3NLdXU5?=
 =?utf-8?B?RUhtYTViR2hEQ1kzK1ROeWtpVWliOWo3UysvZEpOTnliWEp6SVdYNHNZeVpZ?=
 =?utf-8?B?ckJNcS9ndHJZdmZuRHMveS9PMVY1MkYvVXJINmlxRkVOZjZlQU5rN1E3OW9k?=
 =?utf-8?B?dEZKZU5BbGdkdzBTMFZOdENOSmxzbVk3dUFqdW9tbjhqVENqTXlKUlBHVXFN?=
 =?utf-8?B?OUFtWnJBYW94MFZhSElHWnZOMUFFYTRzcHR0VWRqSXZjcmU2bzJOY2dUMFor?=
 =?utf-8?B?aDAzMHRrMVNOb0oxUm9kMXZucjZ2K2xuZHBpNDB0VHA5RVRTUytBNFJaVFhH?=
 =?utf-8?B?R3pJSTNtOTRxTDZlWFJIdEFKZFYwUWdNQU5pSFBoaWJjWU5NVWIvWUlpdEEw?=
 =?utf-8?B?RU03Z0ZPQ29XUGFLdnp5SmlrTDJkN0JWTW1qTXhnRXhzUHY4R0tIWE1IYUU1?=
 =?utf-8?B?dklnWEVZT3gwTWRXTXhuTWx0TXFzYy9XZFhVYlFqOFZzWEtMdEpycUxlZnBL?=
 =?utf-8?B?Wld3dGF4SXN3MzZFdEh0WWVWWUJMekdtU254dDZ6eHRBVS9WRFg0TkdQdERM?=
 =?utf-8?B?ajdKZXhCaWdHSUlnRm4yenIxMnRSTHppYy9rR2dzS0xhKzc5ZktCdkdhSGJh?=
 =?utf-8?B?RzNONTNJdTIxQTNkT2lpemZsVUJiblZ5c0VrZTNudVp4ZTQ3K0J3L3JPRTdK?=
 =?utf-8?B?T2ozWXhPbFkvQkZscEhqbEhZYkZUNjFUcCtHaktaQWZ0a2phVVBHbVQvS092?=
 =?utf-8?B?QTlpdE85UVV1ekdVV0VoalBvWmdZU0xMcE5GWDFydlgyLzE5blNOdWNTeGRY?=
 =?utf-8?B?bU82SFpFZU9oL3lDVmY5MGtsV2FZZElVMHRtd21DUU1acjlwZVZFRElxcFJZ?=
 =?utf-8?B?NEFWQlM5RWw5U0pBOEZFY09PenliRDdhdkFPdjhORm96Q3FWRlMvNTFIYWtr?=
 =?utf-8?B?SXc4cHJHVE5MWXBBUDV2bzRUNjNRdlEzbml1Mk5CMFQ4bG83WTltckR4SXlq?=
 =?utf-8?B?bHBEaW03YUh1NWNqWnRFNzZ3eCtwMWRxekgxUm9udzRmcVVNbTRWTDJvNnJJ?=
 =?utf-8?B?S0YxSmZldnJqNm1nU0daZzkzaml4WS9UM0UvRWFibjZKakJJVDU4TjZzaElR?=
 =?utf-8?B?K3AyOFNkbEdKNkhHYlppa0t4SHdDZFZZa0EyUU4xQllvbDEyK1VhbHBTd0lL?=
 =?utf-8?B?NU1takxIVWV4ZkZGNzRoQ0NQaDNjY21ZWGdqc09zYjJERjd3RldNN0o2OWxt?=
 =?utf-8?B?WTBtZXE1c3pPbCtwOXRNTXkwMExTZjRzUlM1ZG8xNUQ2SFJuQmY5bFg5Z0s1?=
 =?utf-8?B?U2xOeHpjbllTYWRDazZ0U200Zjc5U0Z3VHFRS1pkNXMzK0xsNFkzTS9lSkRS?=
 =?utf-8?Q?Ql+FwJI7rQdl3ZB4bwx4UqHCY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9214b949-334d-439f-ba13-08db98118972
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 13:15:29.2754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AKIB+YlaSCcBNzAn36BUaRg2p5Nf6+9rOjayTTE11vkcMmrsUvTfdjVTC8X4VzRUUx6vgBJHNLdTK1fr29id2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9952

On 03.08.2023 01:03, Shawn Anastasio wrote:
> Bring ppc's Makefile and arch.mk in line with arm and x86 to disable the
> build overrides and enable the full Xen build.
> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



