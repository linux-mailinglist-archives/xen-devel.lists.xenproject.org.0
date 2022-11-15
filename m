Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F38C9629397
	for <lists+xen-devel@lfdr.de>; Tue, 15 Nov 2022 09:50:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443815.698583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ourdq-0004sV-Qa; Tue, 15 Nov 2022 08:50:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443815.698583; Tue, 15 Nov 2022 08:50:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ourdq-0004oK-Mv; Tue, 15 Nov 2022 08:50:02 +0000
Received: by outflank-mailman (input) for mailman id 443815;
 Tue, 15 Nov 2022 08:50:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iTa/=3P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ourdp-0004g2-3y
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 08:50:01 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20618.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c1f8626-64c2-11ed-91b6-6bf2151ebd3b;
 Tue, 15 Nov 2022 09:50:00 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB7070.eurprd04.prod.outlook.com (2603:10a6:800:123::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.16; Tue, 15 Nov
 2022 08:49:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5813.018; Tue, 15 Nov 2022
 08:49:57 +0000
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
X-Inumbo-ID: 7c1f8626-64c2-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WoVcMxjNW/oXnILZwtc9XdP6lDZw/D02GG8IVuglUQGsOPU97vJtEiT2vZagD5OvBfS6671DQWkvTezXRXKmNNizdEu59fMcOpNk4FSTF6o6819cpWXRvad4p6X+VxIAvtK3sTf1u/x0uGd+RGrsL65lqR2W7UntJggMRHyr8ITqTvmFHQnFAhUQ1v6XvBYDDsl2SN7rn8AaEqe1YozpZUUgNyABTCDJPgtdpApeAkqk3djGWhHAbCP2b9Mv56lTBAFxuukwFL6tDthDdAlePcuD6tuxBxMofVgTqv33Nzk3Oux1CqQUAAcDFTxTKozU+79Pro9//p/sac5xkcrNxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ajTJahRJMsJVN3QrzMO6iR+RSTtLDPqN6VZN2tp9k8g=;
 b=S7JcQ5BZMrAnDqTlhlKjPe+cENXnmPBoIJyGO5qNgCzuWqvgktsK4i/qpUOab2e4rBlWYtQtlHZjPvI+KwyPRg3wfKV1ZnhWVtA7tVzNG3Oun7lQ8ALzM/6gn7a16BctkDBz/VjavQloHHcus4meCme/kUDqHpy+dWVhMLI5ZL4SGNGk9ruL1tr49CtZS1YU7+G23qtKbSXsU+qquRHQhhIAVXen9OAE0UiHRVvitIHptLVcbQCz2lIrLE6GN2xrE+mViNcOB+5UQun73lvVhowjxxTV843PYbzMG0IbnQ22ieUYLpzp/Lb9KGPNoBES7LTdK6wUFimX1/k1CNdeUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ajTJahRJMsJVN3QrzMO6iR+RSTtLDPqN6VZN2tp9k8g=;
 b=QPX2PutkSgXEfLWBLUIbZqDepQRjNRzzyrv8LpbIsE0wX++CywHCDu8HzmN/6jeSr/tddJs6EVz7z6V63uL7UNJb6hfygoblo+FzFeZVpgTkgRjT33vTJpiPlgQj+hJ3f/M0pD5wq90WK5sVai56fzoK3RrKJNiZTgBmCg0kYSCJTNL1+ILLhqk79Pm223D+t9glaxK/h5jAxw8LCFPWU5AvBmHUbx7juLXysbLAhE7h9IUzgfwFSBOKq2gtx85nC0MaqEpivCvOIHUbngBawTmohOJEV1JXvIFdygA9HZ1soDi3Nyi3FEoffM8cXaVjKQ3ie4gM/pAKYRaw/CEzUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <29469c16-856c-bce7-c556-66622e349f1c@suse.com>
Date: Tue, 15 Nov 2022 09:49:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH for-4.17] x86/hvm: Revert per-domain APIC acceleration
 support
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20221115003539.19502-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221115003539.19502-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB7070:EE_
X-MS-Office365-Filtering-Correlation-Id: d73dc139-04fc-4d63-4174-08dac6e65f96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OnkbDMjXUniRXGF4LJjaHMSrDNo2R3taipSpvZZ3BG79sKdZoyqirMuSr72fto8Bm7Wdwj/W7p4+XesNqNIV45zuHVOKE0+1wMQzJAFwk028Pk8YOCs6o8HFx2Sn2tbUxVw6FfoyRKzMJZBPQIMwHK2an2+MCBry/xsKXLhMt72VHNQNkDAInQptNAjWQ/TtlTHB2lAIQaPnI2ZdOBqS38/K02h0eoBr1SW5//KklvxeDqhpVlQeG1+klPAOXm+1uedXkY9fmxRuBLIzhzOphG00IAjQYDXdi4XTjI9VmUHP2lOgbMWk0BnH5Zomepsckieix2hvUAQ7wN52EeDDKnmbk5BAxwBqKnvI4SLsmyKC3K0m1lIDMrMvoXApWIkvg2W9dIXYWQLYeiC+9cK3MGm4Oz4bKdDeLEmgtFJfuIDqD4EAENiXrv0Jy27BkcdXVwvx+18e2XHa6lZbBBa+SEo5F9hp20/CvV7NaRW7hWzdAu0BEgjUY9XYQkBIn1nshVzLAVFiT0/2Q4avhvJZ+y1ToUfAe17kgMWoaKY3XRTtpnhPiPZQ2W962pCHdOQkBF8vyd6zO5XV7g9xEhUb/7JwNuVNKtV3viZH9NYr9CA/9bMhIJ1MMqhIPisOv/4ARST7NiGapbZFN82Ml71a51SzbGaKVT5EO3OI0XrBXK+rkajBt+0xUyOiD/V87VS4rf15vTJq7bG76BJ+ih12jShqSuJTL4AdLaddGqTJg5+JptpS1IrTN4JY36mC4Dx0txupyAwxFPwObI68xcLwgBzMBGP9gq5kZUxMpw2fJaI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(39860400002)(376002)(136003)(366004)(451199015)(2906002)(31686004)(8936002)(41300700001)(5660300002)(478600001)(86362001)(66476007)(4326008)(316002)(66556008)(8676002)(66946007)(36756003)(31696002)(6916009)(54906003)(6486002)(38100700002)(2616005)(186003)(26005)(6506007)(53546011)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UU11Y1gzYlgvZjdOUDZYcGdsalZNTzRGOWNIYUtQcDg5Yko1ZmdraEljc2M2?=
 =?utf-8?B?cGFibm04aUZmU3lrQzlJeTBuL09GT1U0aE52NTUrMC9kNFVLY3IwbWU0YjR4?=
 =?utf-8?B?aTAzck4yM2IwVFlSSjRQRUc4NUJuMVZ4NXhUV0l2Q1h4Zzd4ak15TEpGa2sw?=
 =?utf-8?B?WmJkYlhaTDdVM0RmMUhicEwvYWhkVkZ0Y3d0RTBFWEpkeFZSd0VTMTdyazNJ?=
 =?utf-8?B?WVpYNVhzWklUYXg5eUlWeENxaGF5YUtadGJjTHJBU0ZDMVNrYzVCUHhDNXph?=
 =?utf-8?B?V2VXZ3BrU2JlVXIzaXZiN3FsQVlOUkw5VU0zWW9SdWoyQkNQMlBHeVk4NG9y?=
 =?utf-8?B?MktqK3RkVVNKRFI4S2hBb1FHM2pvd0Nsd0h0KzRtWmVlM0VZbXMrVGRVd2V1?=
 =?utf-8?B?Rlc4ZmVPaEFYeExESnI5QWNLYmcyMmtBUWg5a2NnYVdmWkhyUUVaSENWM0Vy?=
 =?utf-8?B?b0o1MExkRUtmZDdrUkZmUUpsbUZTenpKWldFOThUN3VBVHI0T2xFS1d5TzZ2?=
 =?utf-8?B?TmtnY3dVL2NMdEZvdWRubXJNYnhObGgwYTlEcWdIY3BaUW5zbVZSaGQyKytx?=
 =?utf-8?B?cVBJeTFyMXdkd05PS3BnMzZYeVRELzg3QkdYc3J2UTZqb2pZeTY4cVdCTENH?=
 =?utf-8?B?eVRWWkUycVBtKzAxbXFYUG5BZmlJTjI1RDRPZk13K2JHQnZ1ckIvQjFkY1NV?=
 =?utf-8?B?UlN6S2psVXZsbUtINTFBYUwyMVdGYWl5VnVnZ0N5ZGVyMDlFZGs2emthc0Zi?=
 =?utf-8?B?YUJ4S1JKK0NwV050RWJWU2orS1ZhVjZmY1ZUaHgvSC94VFRwUjBhb1IvREJ3?=
 =?utf-8?B?elM0S21EZXJwUG92Q3d5WmF6ZWptcWczTlVNSzVYNHA5cW9PdEJTeUlLQk5I?=
 =?utf-8?B?N2Q4aVhyZmt2a3JDaytJZi8zZ09TR1RuTWdWNzh0dk9ac1N3OVhOZS94b1p4?=
 =?utf-8?B?NHF6NnA2SmRwUmt6Njl3NHlzR0xiR3ozbm1nbm1kaENPT2VkbDM3TUs4ckhG?=
 =?utf-8?B?QnJlWVpkOGpSS0hMRHpkMi95U3Vvc2dmM1JZdmF0UzYyUjcwVUcrMVlEQ25F?=
 =?utf-8?B?T2hOQlAyT3RLMlpUUTk3MHg4STlyakQ0ZytxZHVzTmxub3FEWUZwdU1XQnlL?=
 =?utf-8?B?am5pQkZOdk9RRHpydGNnQlpHTUNsVDVyRXVRNHNBU2dTcE52OGFRZkpqbzlC?=
 =?utf-8?B?ZEVKMWZoVDZmZ2V0VW1BMmNRd1k0QWpaMVZIWm5iT2dXSU52em9UMTNnUmla?=
 =?utf-8?B?a0VncE4ybjZtc1h6WXJkUlViUC9PTmxsL0JrZlRTWWNkVUF0a2NWa0VyM0pQ?=
 =?utf-8?B?WUlUOXpjL2tqb1B4Y3FtcWhqb08yV2pnVWo2VHcvUFlLRjI3UTJVWStNR21s?=
 =?utf-8?B?cFdFbXEyc2dJK0FoOEFEOVFnclZEaUxnQ3FYRElHMHFhNTFiOGIwbjJXZDNn?=
 =?utf-8?B?M1ZTbVY5RkRpMmJjUElZUjFCN0VxYnZkU3AxRXM1bG42M203aStrdUNCMEtK?=
 =?utf-8?B?UXYxR3I1L1h0TGx1aDhnRVpGYW04Y1NVdGxJM09UbDV4N0lnQmI1L2VwOXZ5?=
 =?utf-8?B?ZldsVGZJVHMzS1lDSTFYUDdnR0RqYjRvbTdFMWl0d1hoa1FnL1p3OTRvZG5E?=
 =?utf-8?B?OHhpYTdCYksvbEw3QVNUcjB2bkxLOE5ncyt2Y0JzRnZEZGVTNWp6YlJxQ21G?=
 =?utf-8?B?MkhVTFBRd0ovTW1TMDJMQTVzRUtPRmlUK1VNdXY5YkhDWHZEU0NBSjdCYzNw?=
 =?utf-8?B?K2duQk5QSVV5SkU3eTFvK3ZtVFVGYjlDTjBxUkFCanZ6ek5DVzcwSWtTbjlU?=
 =?utf-8?B?Zk5PYnpKR3dPNVFDTTVkY1NzdXJxeG1ueWxCeW5iVWM4dHVwNHNXT2RaN0E2?=
 =?utf-8?B?T01hb1Z3NWxkamJ5a3p4TU1sK1h5OVN0c2p1RGNjV3IxK2JqQWtvUis5LzBa?=
 =?utf-8?B?ZDBRYjlaVmdkMkppOUNOQmdXMEh6ZjRKc2tZS1pZMFI2bzdzN2VGeE9HZFpW?=
 =?utf-8?B?anlVbEJOUVh2S0RaQXEzbS9GSkloMVB1d1c1SUY1Y3NNQ25tekZGbGxBbGZK?=
 =?utf-8?B?WExOUmREbjZsdjZwS1BLa1pGVTdRM3M2cDVwQW1acXp3RHFsZFJ6RitkSUJx?=
 =?utf-8?Q?J0BqLGCr8VydN8tyTk1rEezE4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d73dc139-04fc-4d63-4174-08dac6e65f96
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 08:49:57.5588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tPRAwPOCrQN7pLIU3eSfKPjXweHIn9hKE2QyOv9FxNM+r0aEb2Bp7eVtcTFvT/Mvt2BsZMTgJNNnxzINLngx6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7070

On 15.11.2022 01:35, Andrew Cooper wrote:
> I was really hoping to avoid this, but its now too late in the 4.17 freeze and
> we still don't have working fixes.
> 
> The in-Xen calculations for assistance capabilities are buggy.  For the
> avoidance of doubt, the original intention was to be able to control every
> aspect of a APIC acceleration so we could comprehensively test Xen's support,
> as it has proved to be buggy time and time again.
> 
> Even after a protracted discussion on what the new API ought to mean, attempts
> to apply it to the existing logic have been unsuccessful, proving that the
> API/ABI is too complicated for most people to reason about.

Like Roger I'm still having trouble seeing what ABI you're talking
about here. Yes, there are internal handling issues, but that's hardly
"ABI". And as Roger indicated before, anything domctl/sysctl isn't
stable anyway.

> This reverts most of:
>   2ce11ce249a3981bac50914c6a90f681ad7a4222
>   6b2b9b3405092c3ad38d7342988a584b8efa674c

plus (as per Fixes: tags)

399bcbf281bd936d1eff7f7d1054ab49115c3a44
0823d57d71c7023bea94d483f69f7b5e62820102

which I think want mentioning here as well despite, like stated for the
main commits, parts are left in place.

> leaving in place the non-APIC specific changes (minimal as they are).
> 
> This takes us back to the behaviour of Xen 4.16 where APIC acceleration is
> configured on a per system basis.
> 
> This work will be revisited in due course.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Provisional upon Roger not objecting (i.e. him at least remaining
neutral), and preferably with the above remarks addressed:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

