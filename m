Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CBC77746A
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 11:26:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582014.911520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU1ut-0008Mz-Pg; Thu, 10 Aug 2023 09:25:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582014.911520; Thu, 10 Aug 2023 09:25:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU1ut-0008KP-N3; Thu, 10 Aug 2023 09:25:15 +0000
Received: by outflank-mailman (input) for mailman id 582014;
 Thu, 10 Aug 2023 09:25:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oMcx=D3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qU1ur-0008KJ-HC
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 09:25:13 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cdb9703e-375f-11ee-8613-37d641c3527e;
 Thu, 10 Aug 2023 11:25:11 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS4PR04MB9649.eurprd04.prod.outlook.com (2603:10a6:20b:4cc::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 09:25:08 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Thu, 10 Aug 2023
 09:25:08 +0000
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
X-Inumbo-ID: cdb9703e-375f-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=icnt9KSl8Od1ggSs4QerhHUn5Ye76Z0Sj5qsTm8HY1XuGf0exvAq8e76h5LpwGFAWtIN6G2ld34M4InpK4wzl22BWAIC29Z7zPY5Wlfpm75cuyUcHn1Wf+t2J/NEirKc5Y7MG/05sFaYmUdNG4upm9/+sua4rpP18b+2B4n/fiPBzXHSEbrrStFKGg9YW8vhXm2ND3PKKnQbkT42vt76MCxO1/dSZjDIFe9w9uyvKY3JKzacY11MMEAqubREiSHlZ7fSXO9tQmghogdpRGWLmhjjSi3yfIUGTBToP0P5gA8GjLbwV65yPtD+Ewcq+Qhr2kRKFLUPHhs9I5WTkBWacA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFh5j+/Ea8FtWyGUl8QN8SBTkjmEGr3KdohpylwSnao=;
 b=BkiI2hbYQPw/+MhjMCh1uPBf3QGMqthmFiL30k/dLTCBMxH9ZkjIs6pRm4dt3lYOyrQmMOoZf4G+Jy4Q/aiEExa496tmFZ8HKmKrhBqKdLBhH81driaYGc5r+1j8BKXLWXxSKsnrU+UWfvTkxLzytvxGXU8CC3o9PmxrK1ujz8APtft5PgLw41mgg8JhJrpLrVEAX9gO6yIb+0XznMO3H8JSVjysHK3eOMdEiSZvRaoV85fKYR6ZJSRrWd3tS/rhMK/ECa8ib4E4X8Yvnq+JwcobuzpEwzgRp3zaxqzQxT9HbUlDWShKXg3k8hYz7sNt1A8bfh9XjH2ujCHMdre3rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFh5j+/Ea8FtWyGUl8QN8SBTkjmEGr3KdohpylwSnao=;
 b=egBz+q7N76Odoa3tSBAZGxX1yzEfrxi7p8VssA6EXux8SahGyvAesdqjMi0Julex7SdLoeSO5iPVgTauUNvLTtyzS4Q7TD651zkfZMHxP0Kzb34vKyh1JALmkHSasvfQNQYTg3m2qQLiGUOMTyx2ZcIj/sq6S9CaiTIqhxWLOx99tstSEQY7arotQQb3k4bI3tkIAHv1ctgAXxN3vNcG36klufRhXOXAo2Lfnrz/G30A6cQigdh/aE+1cWn4k9NCXsv0dniSqVCO/Zfxycxnup/S2O57vlhuSKLpn8B8stUMYy3ECNXjK64IeRjl+qJn5IvLXPtAO+GhhuQJKgMchw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7c707388-bfb1-1a06-edb1-8046e8c1611d@suse.com>
Date: Thu, 10 Aug 2023 11:25:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: x86: AMD Zen1 Div leakage
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
References: <9072ddad-3f79-42fa-1e6f-352c9796ea52@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9072ddad-3f79-42fa-1e6f-352c9796ea52@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS4PR04MB9649:EE_
X-MS-Office365-Filtering-Correlation-Id: d6906607-fe74-4559-0b10-08db9983b08c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uE8ee6vwAKYJdTV8MkV4yy53boHlPGlVruj0k3SXXRk/0yL/VUbJ6vv8e3SMZMjjTwbWhgI8cn3PnxWkPbVNqJnNrRIbQdxzxVXVipHSoRx6UWSkPdKdnWetargFDnuXtlh7g2vDI5C+MskvE/Fblc1paBSnPiXPA8vHZ6ENy3OrFR5oOblSOXPa0BAhxxjTXtMjTf1P2ZQQ7g2v0IMg5cco6zq/E0b5ex/dzBiUHU7lUM3NYnoUYge6dAD20Q3OVVlYYkb3oAJpl32UEFu7KqefPdi4IHLyJ3LsBoDeeNK6HxggC1Iwqih9SRhBQvc2Znuf2G2CTSXte5KQP9w+wVn6B/fYy2jnFKytUrtYH8Yax7CrbjLG7W1aBiRB0vXS6SCCZgoo32aj8sUCowfthVemQPh+4MyW+NDD802zClH+ftsSZAhSpYjzOPeXJ6aKyfPndMXB8+mpWAgrkA8d4dMw7T8y9OOOnkwmT0EfxLcr6xrrr9DNUR/+sNDPHBREzPKby11YszDYJLPln6iPBIz3y0peEpi9BgLkA7y9c9D0hz2V6zCdn2scJkewUjSnom5ygW77qyltlF65ZQJTklFJSsxEoNWnGk+yiEBz0RPkOmumOXtkXDmGa+EWky0bm5/fYZwXKlPPpXpdSj9/gA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(366004)(136003)(346002)(396003)(1800799006)(186006)(451199021)(83380400001)(38100700002)(54906003)(478600001)(26005)(6506007)(6512007)(966005)(6486002)(4326008)(6916009)(66946007)(66476007)(66556008)(53546011)(8936002)(8676002)(5660300002)(41300700001)(316002)(2616005)(31686004)(2906002)(86362001)(31696002)(36756003)(66899021)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGFUTnNtT2RrSHZKN3pPYTRHd0FrZ2VDbW8zeHBoTXZ3RE8zUWFKYkZaTHA2?=
 =?utf-8?B?MVpNdkU0Nk5EcXBRNnMydEFYcFNoYllOMTU1MXdUNFRLc3JPaGVDazNueXdF?=
 =?utf-8?B?cUhNaUlSbSsyVkdBK2dvalNGOFYrYUc2akRERXJDVkFMMDVCbE9sOFZtemNw?=
 =?utf-8?B?RmNnNVlGQVFleXE2cS9ycmE1MXlJaUM0cjNlenZPOEdldlJ3aWladjB1SjdE?=
 =?utf-8?B?M1NydW42MEh1dmdRZzV0cmFKMlVENHo4dlB6Q2RZanlvbHdiR0xlN1IrYzRs?=
 =?utf-8?B?U0JTR0piSSt3OWhZVk9LNWZGb281VE9zUkVxcVZwSDVWeWJUMENNekZRd0Z2?=
 =?utf-8?B?amkrNHBMYXEyR1VxUGwwUm1rT0RhczVhbldWZjlwc3l4VFlTZmRmdmd1dGtS?=
 =?utf-8?B?VlRTZjlRYmpOQW1IUHFmQzZOelJXK3RpR1VROXVXR1o1dDE5dHd1OHVjbm1I?=
 =?utf-8?B?dWp3TUljTUNnd0R0WlR5MFA1YkEvSDNOQWpMUVdsQU84VXloVkpNaVlGVDdF?=
 =?utf-8?B?U0RwcFBWdEJiMXJFMDlLbGIzbWxDMmxYRFBxbUorNVMzTi90UUw0Y2pDbTNX?=
 =?utf-8?B?UFJlb1RHQ2lhaW1KbDhXV1lhMytET1FUY01oYkIvdlhWOFV4Nk0zZm5BZDJm?=
 =?utf-8?B?MlV1N1R6Y3V4WWkyYVRobHFSSS9DL3VCTS9tcm5lbytRcWxuMjhXRTZyaHNm?=
 =?utf-8?B?T2JmL3Yxb2lSdml4U0FqOGhwbEFTa1VkNGNlNGVMYXdoQXBsM29vWHVrUGw4?=
 =?utf-8?B?V3VWSTJxQlBFZkxldDhXUm5EanBMRlV4cVpDbTJCTUdnb0NlMmwvY0pJS2oz?=
 =?utf-8?B?bVo2aDBlcTZjSlBuMTBweklyeEpUcTlXSURwUU1IWmYxVWlNQ3BzN2dKRisr?=
 =?utf-8?B?WExadUY1L1RSN0I1WkJLNXZYS25DWnJlK1NMZi9FU0JRRGRadkxFNC96T0F5?=
 =?utf-8?B?SHB4alZXM3dvTHlwcXQ3ZzVXdXVYUUdMTWlqZVpnSXRpYURvOTZpdmh1clpl?=
 =?utf-8?B?Z2dSYTBKV29SaGdMeWs3TWp6ei9ndVQzc3A5WloybmEvaGp2WHJHb2twZGNk?=
 =?utf-8?B?aGRqTjRacURZaFc4dlk2YzZOZWpnemZYNHNFcFk2TmRXd2ZqZHc2RkdJeXFM?=
 =?utf-8?B?cFJUcllPSHMvMmkyeG5xc1EzdDhWZlRNY2VqdWxOK1hVVko2R2FNTk5OVnpu?=
 =?utf-8?B?NlJrMks1Y0xsZVNNd1pFR1hGSWVOYmlWS01BT1lPcVlWZVpQdXRGeHBGdHdE?=
 =?utf-8?B?ZStrdWxvcFNhOVVxVEpzSHl3V252ekJaV0FrbzE4VXlmK0E5NFk2eXhOWkhD?=
 =?utf-8?B?cmRKcEFsWnJOSXB0U1hnUmlZUFdncE5oSmo4WTc2ekh2Zzh4SEx0N0pNT0hx?=
 =?utf-8?B?MUxJalp2Z1BGUGJzdTU1bGJSNDZKM243b0ZqUWEyNmNtbGI4a21uUW9lczhl?=
 =?utf-8?B?QzlCVTh2UC9yTE0zZUsvYW1vaE5IaG5zaDZRVHhVSGJ1bkE0dVZXMmxBcHQ3?=
 =?utf-8?B?SGYrcVEwY0ltOXNZbmtkY1hMYXN5ditYRGwzc0txT0pyTFNJaC9IUDJDU3B0?=
 =?utf-8?B?VkNnUitneEFORm5USWFERXpPNVBRcmtWVFFiSGpKbnJGUWo1ZGgyaU54V3Jh?=
 =?utf-8?B?UTM2QnptNnluaXREclROWHlCL2kwQ0VIZUNCSDhIUThqUlJpYytmRGRXUnFp?=
 =?utf-8?B?WmR6VVhFaWdRVFNTaWhFb01TS1ZuWUc4QThoZ2pNbXJpcGtMZGhwWGx0TFZZ?=
 =?utf-8?B?QTBQbzZwdC9IRjFvMkt4d2hVdDE3bHdTVjZqQUd5RGsvOHcxVDV5TnZRbUxY?=
 =?utf-8?B?QkxYRXZKNU84UkJiTDF2bnRkWlY0Mm14N0NwRWx3Ny9KUWZpc2lvVFMzM3A0?=
 =?utf-8?B?eHllaGVaOWF0eFhFUnZobEV6UFVnejNIcmRLbjRFSHpTbHF6ZXZQeGM5U3Fi?=
 =?utf-8?B?ZU92UldxbVVZam5DT1FaajRUY0YzYjQ4WEladTFYblJjTWg2eTg1WmFRK3g5?=
 =?utf-8?B?eEd6M2Jnd3BQVktKRWpYeExPUDVxOTVENndlMUVORFYvcFA4M3ZnYmpaNEhq?=
 =?utf-8?B?azdWdDgwMlh4ZEs1dHN2UE9nc29GUTdoUFVSd0lXMkNIc2pRNFFVWnNzNnda?=
 =?utf-8?Q?jzkmhHPOSTqoDP/GLvwLqcp6B?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6906607-fe74-4559-0b10-08db9983b08c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 09:25:08.6386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9C9vKJ1u5L4NGBLjekkDignfd1ijYJ2QUWY+poDstBLjbCav4cCAnLTF6J/YSkK+7HdGgkjkSVLArc29U0jfRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9649

On 09.08.2023 22:29, Andrew Cooper wrote:
> This popped up with insufficient time to organise a response before the
> pile of fixes yesterday.
> 
> https://www.amd.com/en/resources/product-security/bulletin/amd-sb-7007.html
> 
> Per my current understanding:
> 
> * There is a single integer divider in a Zen1 pipeline.  When SMT is
> active, it services uops from both threads.
> 
> * It latches the result of the last calculation performed, but forwards
> said result transiently in the case of #DE (i.e. meltdown-like).
> 
> If this is accurate, then there's a nice covert channel between the two
> threads, where they can communicate by issuing specific divides, without
> ever leaving userspace.  (It's easy to hide a #DE in the shadow of some
> other misprediction, and not suffer a real divide exception.)
> 
> But, div isn't a serialising uop, so the advice of "don't divide
> secrets" is tantamount to useless.  Transient execution can pick up a
> div uop from any misaligned instruction, and end up caculating on
> arbitrary operands.
> 
> 
> In SMT=0 cases, we can scrub in Xen by executing 0 / 1, and would need
> to go in the same place as VERW on Intel (i.e. very late in the
> return-to-guest path).

Executing 1 / 1 may be yet slightly cheaper, unless there's special
casing of 0 as the dividend in hardware (in which case I would wonder
whether then the result would actually be latched).

Is putting this on the exit path going to be enough? Without also
scrubbing on entry what was latched, speculation inside Xen could be
"driven" (to a limited degree) from the outside (i.e. spectre-like).

> In SMT=1 cases, I can't see any fix.  It's very much like L1TF/MDS, and
> cooperating threads can snatch data a cycle or two after it was placed
> in the channel.

I agree, ...

> As yet, I haven't started any patches to this effect, but it would be
> nice to have more clarity from AMD first.

... provided nothing new turns up in what exactly the issue is. The Linux
commit that attempts to address this deals with this inside the #DE
handler, apparently assuming the issue can only occur when #DE is
actually raised. Your (and my limited) understanding go in a different
direction, though.

Jan

