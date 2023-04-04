Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BBD6D65B7
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 16:48:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517900.803873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjhxK-0006Mw-NT; Tue, 04 Apr 2023 14:48:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517900.803873; Tue, 04 Apr 2023 14:48:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjhxK-0006Ji-Ki; Tue, 04 Apr 2023 14:48:18 +0000
Received: by outflank-mailman (input) for mailman id 517900;
 Tue, 04 Apr 2023 14:48:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjhxJ-0006Jc-1N
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 14:48:17 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb17d4b9-d2f7-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 16:48:15 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB8059.eurprd04.prod.outlook.com (2603:10a6:10:1e9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 14:48:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 14:48:14 +0000
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
X-Inumbo-ID: bb17d4b9-d2f7-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bEx35mZh57eCns829b3WkMAk1YGOrap6lKU3x/Nb7alj3JPFiBKghdZv6v7Duj5arsEYtDlmDWjV+r1KE5HjeSa1uxseOu7Cf0w2LML+8vBXRw0INRCMx3DazKd5b37nky1SH+l5o/9ozf+L6PLOhloRnnOEGpcybHjxU1odamDCw67CKbJ4mrN2KY6mVY9vl9AwlNRjz42/j0USv4fXAArBWgWxzy6DDPUeZ/9mK45AI6c/3l7ZtTnmwqeucJmujl8JUMh1AUKx+wE8Mn2tqAYQe3OFSLH/ZsxxsVF94qcikOfdf5TXJVasvMhElmT0rWVSQsAS5COUTdOG0SyxHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3CGLe7T2yLSk6DDDg8vDLU1RI5JXzolsx2xLHPjcZd4=;
 b=hYa0A9uQNpT4C95PaHjmeOnQG+9ZAxMDLoprR/SMJA8cqg/W+WUf+XFGZ8OsVjfSI/PweMBBbayB2Jsg6dR52+3fdIiRGsUXl8q512ja7gnsW5lZceUkwWMMKDmyKqTsVdSycNFVl7cl0Ghc9NgrbIPg/KMriyPgElzKr/qqPFNtanP3qO/g8dm7Epz8xkjRQ2H/w+Smm+MfUcHbQUoW04jJziKLIWhF/eg31Ndx6TU8uhSPuJbWmfJocIYmhioYlSbAi6ZGJp9qmOG6qOsjmPjLUld0xeBY5b9bX/5rWqssOG0gHVzjyOxOZqyw7ZUHZnKUncb1Gip+u2tot6AYkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3CGLe7T2yLSk6DDDg8vDLU1RI5JXzolsx2xLHPjcZd4=;
 b=WkXVOlx5SAhYHTg1/0ib7ySM69twvBxCsj1D5ghDNLd94Z2GjfH+jHDKJsLq1GW7NIxjxBbZBsTSa5BffSAB8CSZY5IAB4BtSfsuzo8z3dW0kuZ30dI2WWFr19TTUu5LO25s0jsAkd3MPLfesunQZFqeQL8ubUYCvI1YKXAsdGwaqQNAhurNpedeiLL1hYIvEiOrTndyjXA7NCm39Wcu99DDPj7WG5mcQiZf7ML2lSQviJg67Ea3yqSi3HpxkTwC64Ho9kHkxafm363wtbbJo7ik7NMYBNPPlZKsvahJHUH28iEh/pCTrNAHBLLjpQAqD2b2tPn3U4oomUmXVT+Uiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c7f748fe-f062-c2fc-4cc4-b2f888633abe@suse.com>
Date: Tue, 4 Apr 2023 16:48:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/9] x86emul: misc additions
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB8059:EE_
X-MS-Office365-Filtering-Correlation-Id: a5821fa2-48e4-42cb-331e-08db351b9e69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Va39pFWYcD06j+tLXhp+5REl9euqrD1q+s1t97QN5EWXQNfbvZNqhEovTDI4J66PUobSDGkgG+8WmjbtHayJyGJOyGLbDLvpmwbm4lhotSKGtWRrv+isBw6PnwLKJyrJTC8H8QR4/uqVhrQJviH/elDG6VYdxrFMxAWHQ40zS3068PDDxgBVxdsJtyCNwdbhkQ8SYyG2U7QfnwjDKuCBZFunnoand5QngDWN2Aoli10LL4t4P85IyNBvsutu7dlq4w0rz2C6swA9bMtOzvdXcYT9K6khNRqKvMw4NqY0ErOoR4uNtuRx2uAUnJla8ll1Rl+SLjvqZxbRbzORQeCm4R/eDwLmW8JFHp7Gn8Bd1Dru4HYSme7uMef2uldC1BNlT9/kLERTdqW/H7+GHCoWv8JDVydpAdHQ+GPok3GQK4Z3sHUU1x8qzyLT2AV9qIMwIygviLoK4fruA/l+5Z5ooQas5IjbwQXCdkM3UTnwGBKGa2J3NlwtngbqTE2tFjkOHL5m+jAKKtX73y+gWXNz4S7ofAaZHd2yVKJvRqb5Te5E0R51MHnCXxG/LSmswf2+qn4mAW6Mo1YWNtxqaXzoCw619dW2IXt67TV5sBsFudAO6Mc4izA7Kst5T+InzkPKwDMj3S2D7F33vF7WUCV6mw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(136003)(396003)(366004)(346002)(451199021)(478600001)(316002)(54906003)(5660300002)(8936002)(36756003)(86362001)(31696002)(4326008)(4744005)(2906002)(8676002)(6916009)(66556008)(66476007)(38100700002)(41300700001)(6512007)(6506007)(26005)(6666004)(66946007)(6486002)(83380400001)(2616005)(31686004)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d25HUGVKRm9ES2t0aThEM0hBWVc1WkMzcWtxMTNtQ2wyRk1DbDdUSXZHbXZK?=
 =?utf-8?B?TnlNQXhZUFhsSXVBWjEyQTJMTm01VFZMZTI0RzJkN1hacjdhUEpLby81Q21q?=
 =?utf-8?B?QWhSOHVuc1VjL0hYMnp2cWxjZ3NERGlUOXkxRHJZZ2pNSWNvY1A2VmtkNXkx?=
 =?utf-8?B?WTZrckdiT0hxU1NyejEwUmQvbXVsVnhldUQ0T0FoN2FrNUtaUk5NZ0lUcVBT?=
 =?utf-8?B?S294NkZKUElqSml2UEpTY0R3ZVR5djlCZ1FHRXBIY3d0WTNFSzduQzhrbC9W?=
 =?utf-8?B?aTlTaExXQzB1a2Z2WjcwY3BZZVJsOUNOTWZkL2ZRdTByQ0hlRy8rMHA0cTBu?=
 =?utf-8?B?aDVySFN0VEtrY1NmZG5qOHNneXNqWCtHeTJ3bGFNUDZ4ZTNMeWZuUTd6WEVt?=
 =?utf-8?B?YmJMRTd2SkpqZzljSlBLZFJvb1pyRW92VHlvL0ZDYkx6Z2FzWmNUSVd4cVFM?=
 =?utf-8?B?ektmbFg0RG5oaDZrazdBeXIwNWpkb0Z3OXE1MGRibno4Nmdlb2p3RHhmN29t?=
 =?utf-8?B?UjhNa0RDSk9zQllpNnpyWjRHcEZlVk5xSGw5WEdWSHA3dEZyenY1OUlIU281?=
 =?utf-8?B?bkp5UXhOSFl2TFpOSS84UjI3ZlViOHNMMWYyV1JzUi9zOWY3TlhMTjIvTXRV?=
 =?utf-8?B?blFkK2FxdzZyLzRod1BPT0wwMEppVlZrbmVoV2JBaE5FNCswY0pkbU8zczYy?=
 =?utf-8?B?QnNiLzYzeEI0dzlHeTA1Tk5meFQ1UE9xNW04MmpnczF4c1p0SCt0TVd5VEdp?=
 =?utf-8?B?ZkFVSXRXOU5iVXdUejJMV3RVZ3ZZRW1CSXdJNC9MNXBuKzNXYlBYVktBUVp2?=
 =?utf-8?B?MlRxb0N3K0Iwem1QSlpDT2JWdzJJcTF0bDdIZ0V0YVMxSTR5MEJ5RmNEZHV4?=
 =?utf-8?B?MDBEa1dhTTBIVGxDaUdSVmZKYUd4WFdZdzdBbEFuV0Noa2FNR2lXLy9rZ01P?=
 =?utf-8?B?MVhqZ2pMcEpVU1VPTjdBdkFTNWNyMkZKS0ZJeHowUnJ4cWpxUldETXI3K204?=
 =?utf-8?B?M3lvQ05uVHRQakxZR3Nnc2hUUUViV0tJL0VibzRIUVVtZGpmSkliVG5RSVJQ?=
 =?utf-8?B?akFRYlBSNklJZVF4czVGQWFnMTZzOTFDa3I0TmVDT0pCUlNOdlRmZGtpTTFY?=
 =?utf-8?B?T2VFVmkrMHdlSE5SRkdmTW5oNWpTejJxRHFaMFNzQlNEa3JKOURyQklLdDBh?=
 =?utf-8?B?VU0rVG14NXorWlp4SUt0UWQ0RC9BUnRlWUJsYXpzYlVuM3h6alRWd0s0SFRa?=
 =?utf-8?B?ZVd1QXY3WE5xcUN3MWlDU21rMUx5TDByVlRuYi9ONWM5ckQ4R05td2dEZUk3?=
 =?utf-8?B?MjNGM2greU1nWTRhSmlWZnpTalozSFM3bVhleHFEdVgzZXJjNmR5R2F1eUFi?=
 =?utf-8?B?NGN6VVNNZTU5OEpvTlFRNHozRnU5a3RkVnFmQnM2WDVWQ3Q3YzJ0Z2NGM0RJ?=
 =?utf-8?B?NTd6cVNXYi9BV2RMcHE1V0xjOFZtY0E1Q1BNMkltd1VlcXVBNWxyZm1qWkov?=
 =?utf-8?B?eUJMNlpPZ2daVnJwUlBJc09zdzN0NGtvR2NrY2RGTlA0M0lXZHVHK2NhVmly?=
 =?utf-8?B?dEFWYnRmQmo5VHRvK1FidmtXQ0pNY2RCR1E3cGZBRlkrM244UjZDdm5aOHJ6?=
 =?utf-8?B?RXVDV3ZXSm40U0VuYjF6RVowVE1lb3BGbCt1THZLK1o3Uk5qMHpvWkNSZFkw?=
 =?utf-8?B?NmdET0ZsNm1uaUt2V0w0M0E3dmJCNWl5KzNLb21tU1pVWmpkRS9iU0NCTlkz?=
 =?utf-8?B?czFCemQ4TVkzODJmWjA0SHcrazBNNnIyaS9Jem80bmliQkFoL0pDS2ZOODE1?=
 =?utf-8?B?NWhDUlJVQ2wzRUZTOExPUi8wbDdST0hRYWtsNlRRQWUrdWswS3oyYkY0eXRF?=
 =?utf-8?B?MUFDcWJKMUxXamJCU2xGclhzcERsVllBZkNlbWRvcVVaSGZ2OVVYTXVCU0dS?=
 =?utf-8?B?c1ZpaTNZdnJDUFZ2bndLN0s2dTJIdTZxM1FhV1UyVmxuQll0elpYeGlCRE1P?=
 =?utf-8?B?a3N1SWNnT1IxdVRhb2ZKR3V2QzduT3JlbW5IMHFPeFdhdUlWVDd2MWllTnRM?=
 =?utf-8?B?ZmplRDVqWmNZVjcvRXcyajdlbmpVaFFLc1RZUGlXMEtWZ21IaWRRanFLeHFR?=
 =?utf-8?Q?UDfQ36fK8VFBhattmX7nnd/7B?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5821fa2-48e4-42cb-331e-08db351b9e69
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 14:48:14.2488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U4YN9jr9R2pFriNrbrm1T5wfy9xng6XtyAE3yaFONvkNVtBxHjScuVwCroJVxbNklaeeJ+xFMUkXeD1TMh117w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8059

This series adds support for a number of more or less recently announced
ISA extensions. Plus a little bit of (more or less related) cleanup. The
series interacts mildly (and only contextually) with the AVX512-FP16 one.
Note that patch 1 was previously posted standalone; the posting here is
unchanged, so isn't called "v2". Note further that while the last patch
is kind of incomplete (it doesn't enable the feature for guest use), it
could still be applied ahead of further VMX-specific work that's needed
there (and that's dependent upon documentation becoming more complete).

Apart from contextual interaction the patches should be largely
independent of one another; only 5 strictly depends on 4.

1: support LKGS
2: support WRMSRNS
3: drop regs field from emulator state structure
4: support CMPccXADD
5: re-use new stub_exn field in state structure
6: support AVX-IFMA insns
7: support AVX-VNNI-INT8
8: support AVX-NE-CONVERT insns
9: support {RD,WR}MSRLIST

Jan

