Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E5E6C4AE8
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 13:43:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513420.794371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pexnh-00042J-QI; Wed, 22 Mar 2023 12:42:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513420.794371; Wed, 22 Mar 2023 12:42:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pexnh-00040X-Mh; Wed, 22 Mar 2023 12:42:45 +0000
Received: by outflank-mailman (input) for mailman id 513420;
 Wed, 22 Mar 2023 12:42:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pexnf-00040R-QF
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 12:42:43 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on062b.outbound.protection.outlook.com
 [2a01:111:f400:fe02::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09a2cf41-c8af-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 13:42:43 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8120.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 12:42:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 12:42:40 +0000
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
X-Inumbo-ID: 09a2cf41-c8af-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DsS58HE+F1g6jHCmgvyNR/ZSkNGvamGOTar/nqD7gPEuxI5G6KmGyqWUkYnRSKA3PYMk4HJZyG1qIAt5WkAkanc30Mp57DelRZHYPMUbDS29VVzxGCx9MwWC9Ynd6rZEq94BezjayZizs4fxVecTATbL9XWYGoA8fd0ceX3UggKVY794GaD3leDadZ3dlBKhv4nh2q8JOWkBHRxQhx/LJNwtIIVoXYzVrQnufNkomE+ufrH9kCknlYsbvPeywFJN2ohdKXhNqm20oMgo9fe0nHywHRkhxxf/KGWv87SREMAdgJSujiWCQU6atYmfMJqLPP/u9GGyljT9TmVmEkSixw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eEOU7cXu/LPxXOjMLbHBitPpfPY/EMUhyfJHlL2VeKc=;
 b=CavJSP23s0vcsY47NQN4gu40Txqv+273pCidOZvVD+McJycmRv1o5VYyKWVDNu6IMNwIPMgz+ZQzf0uBZyr0DBPPO+38G5pYSyA9tZK3xb7+HIUVAxmsH9B9CC/fQ/h8GS5m/p2P5M+djfhCOGvmIpnaRscc69EPestPgHTz0UCYtTVOnStkf6MnCkrgynbGaSjtuBcEbxDtvy2iP+u4pK7FPP6EUmj9Dy6H3ks6HefWAxi3kKjSS0WCN0ioV4Cf+oEsCSesTAs98nq+6w8wqqYaBag02ytKiL+g3DVWv2KOBp3RL0jwZNqwoVcGfFdYO3CSJJyGtYa7z+wmzZhNgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eEOU7cXu/LPxXOjMLbHBitPpfPY/EMUhyfJHlL2VeKc=;
 b=3kChOPZE6HVtfco2Irh/eSyf3g5e3JKPw/aaXoCCMSG9LU7+UMuWSQmkl8E7/d7onel8nxmSoRlR32Ew1cb1lF9qczILTzNviIywfyasWsG10P/DJqqUeCatRVaKQp6hDW5XzUFgzLgRQH8OuEMmFDAKP2ErWo/dr0OLbNFzBVpU9K9PsqFZT0WE3A8H9pPalprGKD8+I4TkyQUv97MxC2l1WDzGahp4SB51hFeyYB1nsKNcbTeyAqV0LkqdmVMZdipvTXgzjXdCwC4UEDMCBECBkolNgJBYQM5kAFBHUysBbBVxDGezi0V0C/pwyL+auE1+v4rf+/mFpQIUJXia4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2342adc4-0011-8441-86b6-48cc21e999eb@suse.com>
Date: Wed, 22 Mar 2023 13:42:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 3/5] tools/hvmloader: remove private offsetof()
 definition
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230322120844.19657-1-jgross@suse.com>
 <20230322120844.19657-4-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230322120844.19657-4-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8120:EE_
X-MS-Office365-Filtering-Correlation-Id: 21e38d0d-d965-43af-2694-08db2ad2ec63
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FKmYsey2EOLsQwAXBuqrZnrRPDCtp5dRxpnrIOKCZ1VscJF3ZAN/rsQry7bl9GN2HPQApe2WhGCKpPrL4NUX0Y+7wd9IG8gLOsWWkUEwl9CqkKa2mRzPSo4H1eBNca23tKV9Tc5NIOseJSgW/4v85UhcVs/0yUVgOnpzwda9yUCx8ONMjITjZS+5/kpILQ+y1ZXdeyRTEsJ44DJtlacE/wRQdrIrO0jrVSnDqvQcPlbgAm6F5gcxdzKvP3Y4YxzvEqpIi7HsKBpqSyp2KhBHiiwG9NgMj4lEAF/ECeEBMp1yUlMHZQ/0momuVuSA0k/e/0a7ZTjN8rhlSnrHRIQm7ukhDF2mRif/GeAZeRBNjXb82uPmpwER9KiGdIEVhlfHUpJApuajkm4jlAXegaBFYa2S5f1ALLapobtzE40IGYo8NsaH946cgKozyRGLnRRpJtsapJvhGkYOh3lZYea6o1VvV7NqVJbsSlssPQsey1P12S6pzbKIXIWT1PlABJU2NBAR90lHNhDk8zx++eXkRFvChLYNV462GHWFqjmy0wjQQvWkNLsSwCFBGyhGAdbNllFf9amh6B/lK6CDOaYDE8GJrT6SLL5foNzasVZtyjw6Y62NzQI7+lsLbndZ7tQkpHVmCvjvcnY0zjTIhItHbpTeCPuIaLQOe0lUGjt+qpURP9csaglHo8T32AQgeMoQr4J8AML4LBsZSdvEWI1lHpeiRyfGW2tlR2HpsVeu3ts=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(366004)(346002)(39860400002)(136003)(396003)(451199018)(8936002)(4744005)(5660300002)(41300700001)(6862004)(36756003)(86362001)(31696002)(38100700002)(2906002)(4326008)(6506007)(31686004)(53546011)(6512007)(8676002)(186003)(26005)(6486002)(478600001)(66476007)(66556008)(54906003)(66946007)(2616005)(6636002)(316002)(37006003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEFTckJlbEU3QUdGSTBrOFBDQk1hUnkvKy8zZG5EYTJLdDdaZGJaUVpVQ3lw?=
 =?utf-8?B?aEZSR29YRjc2WFhCQ2ZPSThCZGZiUUViTzYrbGZvbGwrNUhrOVNNd0M3UjFi?=
 =?utf-8?B?bS9OZGg3SithSklJWUs0RTVMc1FMZW5oMkVPS2tMQ09iMjNaS1N0TXdsdEg2?=
 =?utf-8?B?NUNITlhwU3BCdkhoS0VKSXZrUHZ0dDI1RmkxaGVzUFQ1Q0VoZmVRcDFlOEY0?=
 =?utf-8?B?cGdTMUQ4ek5KejhnSWpHMk5MLzJrS000Z3EwLzN0aWJoNHlzUlhDZ0xVQVNl?=
 =?utf-8?B?emx1REVuT05WMHVicFlKQzNZR3diN0JCN1ZmclRtS1JSU3hQaGNzalAxVUJZ?=
 =?utf-8?B?eTQrUWNsWW93VXhrNEpMb2FHcXFMcmZIK3BhOHRxL3Zxa0Iva2YzbGFBeWt6?=
 =?utf-8?B?NEtPRElmcUtmM1U4U0Jvc2hKYTVsRGN5MTE4TmV2NUtjNC8yWjNQcjBIRGtt?=
 =?utf-8?B?S0hvZlpYQklSRFByMmZJMzBOdlpkV1hZOHlaS3RlYStYdGxEL2lxUVZybUpv?=
 =?utf-8?B?RzdCQTBiNmEvSXZ4NkFrVXVHbUFjUCtIb01uRllnMkQ3MXhnYXRUY1ZlV3Bs?=
 =?utf-8?B?S3VRUEw2dEZDVEZWNmY2bGlyazM3UXZJRUhMckpDYUhWREdvUHd3SXo2UFlx?=
 =?utf-8?B?Q1FPL2ZKOXNRUG85VVdTRDM4WUcxbk1vVEZOTDlJYW5QTUc5S21ySXRNek9n?=
 =?utf-8?B?Y1B2ckkwU1djNk1HcWFEd0RxVGVjTUxwYW1WNnpqSjJjVXpqVjZUT0dNTDRB?=
 =?utf-8?B?TkJZaUtFVDFSdndTWHZDYlV4UmFVNUhCVDJlNTdHd1FmTDZ3d2oyVFE2ZzlY?=
 =?utf-8?B?VEVuNmJNOEpoRUtCY0hBQVAyUHpJazJSTGc0YVFxOW44dlkzRlY3WGFFT244?=
 =?utf-8?B?TDdFQkFLNDYyNjBvZUVPOFNsV3k3cnpqOTFpUlo2dnNtZGdVRGU0MCt6eUZJ?=
 =?utf-8?B?Sk1vRWxGOWcvUjFSOGRUa2FRd052RzhTMFJ1VGl3VzZjS1kzMEE5V200UlRt?=
 =?utf-8?B?MVJ6SFowOGlCZGVYS2MrMkNJREdmaWtyK2owRHlyaURyVEJtVkV1TE4wbjkx?=
 =?utf-8?B?eXNFTjNVclNuekVyUkF0TjFnUFYrbWlVUEI0Tmw5VUZSYXEwZkZYb1MyR2p5?=
 =?utf-8?B?NWE2d0Qwc0VFSEZsZTB0SXVRcjZCRUoxQ3A1ZDZqMWI2eTJWbkNSa0UwNXZO?=
 =?utf-8?B?YUJIOStmaCt2RmZDbUdobTVVVHJGRHlzM0pEZkFpZElNRjhpZVV3dktBbHlV?=
 =?utf-8?B?d2lvdUtlcnhPcnAwY2JqOVdQKzVsQ09UTXlUb0ZZV01HcEl3VEdsUFp1czBM?=
 =?utf-8?B?cWlYUGpyUCtrT3dONnlCODdLTDBEMVpFbWptS24xZHRweXlqWitOcXlPOFFt?=
 =?utf-8?B?b25ZVHdhejdPRDJtYThyL2FBcm9vQnY4Qmg1UnBjNXJ6TElDcTRLSkFuNG1S?=
 =?utf-8?B?aVIyS0F6VzFmeSs3MWhaRnM5RW01bUMxbUZSWUJveUd3TDdERzdMd2R6WlJH?=
 =?utf-8?B?WFNIZkczMGNoYzhKS1hQQWZoZTN6cEpDcmJUaENYNDNUWldlNEt3SzlaQ1Vj?=
 =?utf-8?B?VVY4SzFJay9Td25qYlE3d0dVejR6SXpmbHB2SmE5SXZ4cytJZ21acURPZlNs?=
 =?utf-8?B?THlPSkJsWUVOeUFrcFcvUUpoUFRWY2hudk41bllJc0tLQ0M0SUhuTVp4NUl3?=
 =?utf-8?B?RkdXQ0xwZ1ZxVFdLZXZKM1BqMEd2ZVhkR3hOb0RKWWZMdGFpaXpzYXZxZTVM?=
 =?utf-8?B?SzRyU24xbUFGN25XWXB2cURtRkliU3lkQ0xvZW1CclY5OWRjN1Z6dk9oaFIy?=
 =?utf-8?B?bEd3cGVKV3AxeEZ0akk4WUlHNUtBMmcyaVUyeWN6Zmo5dFR1VlU4T1V2N2ND?=
 =?utf-8?B?dEZTb3I5NzFRZnlmaXdZcTVlWlJYMkJ0azF4TEduU1gzR05vT1F0TmlzeEEz?=
 =?utf-8?B?QVp2dVBIdFgwMUxLQmNYQ2tobVgyN1QrSXA3ZG8xQUxZS2JRenJjUEkxVFJM?=
 =?utf-8?B?b3JvZ1ptR0hPdmtha1JVbnltaXV5eFhUUXh0bmZWY0FObjVleC9BZ0l6alZ0?=
 =?utf-8?B?aEhFWlMreitmQjVJaThtOWs2MWlMeHYvQ1h3VCtnU3loeC8waTNicW9NZ2JN?=
 =?utf-8?Q?MA81LzX2TUBl4uQULxWO5B5bS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21e38d0d-d965-43af-2694-08db2ad2ec63
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 12:42:40.2507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b+wvLZktFZHgcshYWzEu0+VmEXMxp5oCujDoQbVkplQx3q1ATNPJ4Piu3mGjRkRVCIOqiFtnEmZpQf314n9u/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8120

On 22.03.2023 13:08, Juergen Gross wrote:
> util.h contains a definition of offsetof(), which isn't needed.

While true, this is also ambiguous in the context of this series: It isn't
"not needed" because common-macros.h has another definition, but it is
actually unused in hvmloader code. So perhaps s/needed/used/?

> Remove it.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


