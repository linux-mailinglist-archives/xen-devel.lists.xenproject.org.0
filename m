Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 402D157B6ED
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 15:00:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.371682.603571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE9Il-0007om-Tm; Wed, 20 Jul 2022 12:59:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 371682.603571; Wed, 20 Jul 2022 12:59:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE9Il-0007lc-Pl; Wed, 20 Jul 2022 12:59:43 +0000
Received: by outflank-mailman (input) for mailman id 371682;
 Wed, 20 Jul 2022 12:59:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H1QO=XZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oE9Ij-0007lW-SW
 for xen-devel@lists.xenproject.org; Wed, 20 Jul 2022 12:59:42 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2077.outbound.protection.outlook.com [40.107.21.77])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d10f81fa-082b-11ed-924f-1f966e50362f;
 Wed, 20 Jul 2022 14:59:40 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR04MB3129.eurprd04.prod.outlook.com (2603:10a6:7:19::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Wed, 20 Jul
 2022 12:59:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.023; Wed, 20 Jul 2022
 12:59:37 +0000
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
X-Inumbo-ID: d10f81fa-082b-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fpTehVZRMxJAeaY8d9/KUQ9WDYnflfD66BlzV+xlLrLrhjlC9FvLhRb5h2lX0gWoUIz+aa84V+C5iGST2lesRLtS6T1GEFLwbz/lceXKXdM75SGU92aBQgKwhD/Hq3BpKODpqPBNQ+qEWJUjA2O5ycaKS0MBe0YAB+S6MGDEKu47JCrU0ZBC1LrnjdovhIh8rdlmD41tYy8YEa2ly7BabbOR3awccFUcWTdrv231587I/YPS6OLzBYV3iKl3f1kGMca3S212G41QbwNRL01REasN4FKyqo/2Gdqr0fwPgmPRd1jf11h6T1Hn9O+i9n5lHqPYeda+y1x2lnFRQyPvjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/hnnNYAAcECQlEoVrAmax3zp/3OszhvmF6k3LHBTMg=;
 b=E+CycUuJXlWgOUPPPF5QyJvrTwQgA6L/ryucFG4/EAySUAoheb63TZZQrqlUP8juh4ISGvhbV91FdXEVeaZOo0dJ+BMgWQsepIIV7n7YEl6ROk5u86m91RTF2Bt6Faa/R+6weZpDUNKAddfDnLSREBCfiYYUg8+nzWnS6G9D+cArIPrRwg9zqr0T6mw5kHqiqBKhxes9/de9JgWQ2uZJjGA+WVDAennBNanl6PeJBm308onWVoNhNzoI4xH5BCvJ9beAnE0ELvlQZB8WCzsJJlqZoSo5/i1ZyWuC06tRWD73bSEk8XQiWxBbjAdmAiHPObC1tFfFjf67BSmTU+EazQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9/hnnNYAAcECQlEoVrAmax3zp/3OszhvmF6k3LHBTMg=;
 b=Qrs/BNgZp3rOnCxSVfwLIFAYBh4TmJGb10POH7scuAkk/fgOvULX4S3eomSSKYUSKAy/Zj81NPYoYTV8DHqCvKANtF1X6wQC6hyYRXEOQNXRIeNCPNQvwelYhBXfRhx5wzeJXI4n3eyDgtOLrWhH9rMkn99Lt9DrszTTFzlwfsXVIIXrNgeDyN9c8jh4/1ikKcVKDrNU+iZzjP+s0QanicSV+AERw/PN9DVjU4lsb44Ni9PTuGO/OPQVIz+wesVTLiFvyj6T4NS7S4ZCK0Pc/ZRpAW7kLoGhosaGH8plAtMA5RdfyKXBdjJuzhYk6qT4RB0bwHpS/lkw5MA3XY4HUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <59fd14e8-3fe3-4e57-4c77-da380f06108c@suse.com>
Date: Wed, 20 Jul 2022 14:59:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Panic on CPU 0: FATAL TRAP: vec 7, #NM[0000]
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Michael Young <m.a.young@durham.ac.uk>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 ChrisD <chris@dalessio.org>
References: <202207200448.26K4muXc067471@mail116c40.carrierzone.com>
 <49352a0e-89ef-4f73-1c4b-ecfe6e0e49f0@suse.com>
 <d0eeabd2-2158-bfdb-c0fa-634d585c48ac@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d0eeabd2-2158-bfdb-c0fa-634d585c48ac@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c37d5f10-a261-4e88-54ab-08da6a4fb3a1
X-MS-TrafficTypeDiagnostic: HE1PR04MB3129:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7BSxLSjt+BJsi66OwOlKOL03CQo+90m1fmBs1fWb+WaMhDhzQl2K7+rBe2OPll5okAGD3xNqGjVhls2CKcuf4B7YNOfEyEc5wzALNZrDXjTQFSaLR4zIJ4j85wQ2eyJd62esuy+iw6tYhRqBC7g7AVYP1RoUEKfOzJV/ELRg9oO3Rpiw8fI8Fetx/IeiXDNV9VcSj1PSlU0CtyTe551EaPApzGOC1BWiWEwrrNOv0QWfUS5ju55AMRhu3eb37FVHAAzyrrtGUUOdPgnZHSWkrSrSOSmrWNRFEp1mDpVMs+lSqzRDX0Ynb7G40rBbNyalw31+Ad4oBtzv8ndmtqodqMoMVS5rQQjCmczeWdGa3pN1jURQXI9gqcXSuLoUuD2kcp74ERWF+BSFAN8MtNlMD8ds5eYIOo5CCOpzgMLnKarX456ulD/+Rx7Kp4DdtC9n7/EweEkeaQpotCMX7gFZ7UjiuTDqlnx+KZ3AYx2Z9lbqZBVlbzIIm9s/S6WZsGGPsaM7YN8xnKTp0u7ejxsycsbyllKFMYKtoNRZjrisWrHU9HUoIfmiHZynW6TPfg7Xz9YzUQRC4/HnhqaGSsjsJvNOoJq58lW9uCEpcljGCz1jqbmtDNwS/uf7s5/QTgC3auBVtg30BfA64adwGEPYK+TAeP0xacPgecSlN5a2L9VQ/vAwleHtbdlLmI60Q/iDBROTLyuiYaMwUDXhyEV5/DCJZglQ0U7KmerOIwLKUcJ+kAvEHCOX646OqAOmefiN66Qi3Al80X/F6W3kUt7PpLR7LXNN3MddEjdPwuwjMifMNa4okfXwiqdnFixqgpZe/w8kqlGRl79QUBlO042uZw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(376002)(39860400002)(396003)(366004)(346002)(66476007)(86362001)(8676002)(31686004)(4326008)(478600001)(66946007)(54906003)(6916009)(36756003)(8936002)(316002)(6486002)(5660300002)(6506007)(66556008)(31696002)(2906002)(4744005)(53546011)(26005)(41300700001)(6512007)(186003)(2616005)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3laT1BNbk9Obk9qVHQ3NkFIUWxybVFNSTkwZEJNN3hCcWdoU2cvY2M0NmpO?=
 =?utf-8?B?cExERWR2TmdLWVZ5cDV0Q29ZMFhJb0R0T1FQclZEYkladnYrRXhkc21aOXEz?=
 =?utf-8?B?cW4zelovKzVDMWVnY2c5dTU5NjFKNnRuM05YYnZRckNqRGQ1dmhnR0RXMCtt?=
 =?utf-8?B?bTIyeUlPM3ZwazZqaDQwYUpUdFAzYVhVN2Q5eUtBYzFIaHJOV3FhUXFZYzZD?=
 =?utf-8?B?eFFYZTY5cTNhaFpqK3d5SytQWklsVUNiVXo3L0VIaVhmRTRzUkpTQzN2OXNL?=
 =?utf-8?B?WHVhSGMrRmg4QW5ZU1l6cFB5Q2ZxV1BIRFpxaVgwNTNYMnh2bnpqRWNUZU14?=
 =?utf-8?B?MFYvNzJUbDB4Rk95MHVvK01pWGNTcGgrNU9EM05xM0dNTHE5aExUZGNsQ0JQ?=
 =?utf-8?B?NS9ldjdPaXMyckNhYUhZZTZmekxIT05lWXFwU0lYMFI3TFVBWkpMazdzcENH?=
 =?utf-8?B?NmJpeEFOdEtXRFNaWXhsSWxWSzJOU1lkMWZHbjZDZis2NlNOTDMzU25oRkw3?=
 =?utf-8?B?L3l1ejJXMTUxbFlRQmZKMjVMY3RNaG5Hd3JvMGVPcm9IeGdSQkhnUGNDZk5G?=
 =?utf-8?B?aWpaem5LK2E5VldyK1JGeTFKeDBBbEZRMlJHZnhPN29nVG5NdEt1S3JObmZw?=
 =?utf-8?B?U3lNcWxLYXVxN0wrVGNNalNZOXdwVGZZekhkYnhlOTFaRjFvMGhNQk5rYlMy?=
 =?utf-8?B?TkY5Vkd6TkpNejVjS1MvbUNrb3Rva0d5NU1lSndPZ2JFZDIxK09IdmdTb0ti?=
 =?utf-8?B?eitKVTM1WExlRzJmZE01c0wzU2RDOWJMc3drb0lFSlJZNVZiZ2dzc0MzNEV6?=
 =?utf-8?B?bDBYcXRSeUYvc3pwOFZrTkpOdmRnRStDZmZ5Q052RzF1aTJzblEwdWxycVBG?=
 =?utf-8?B?cVAxK3NSWHJXV21kRjJQczkyRk01TTBYUzZ3a2l5UFgzbW5adzRKQUFoc20z?=
 =?utf-8?B?UXlGaWk5TURxL1JDTUNpRlNLNjhGaWlKa2MvZ2JVWUgzeEk3VTdneGFEWEVL?=
 =?utf-8?B?NzNMQklZeG1ERGlVOVdJa2x5TU1nc2RnUGhOSHh0eW0xZUR1UEtUZDY2dnNB?=
 =?utf-8?B?d3ZLU0dTdzl3Y2JDNVBSME50aTZ5Ri9GbE9rdXZFcUN4Y3lDc3pQMEFROS92?=
 =?utf-8?B?Q3VxbEUwRHFUcXNtT0xvTDFkK0EySGN0bWNLNXRMaVVJOW94YUZEa1BhZ3ZF?=
 =?utf-8?B?N3hTNVpPV0o3c0Z2amZXR3NsdlpxYWJKOUFYTHFEVXRRbkdCSG9nM0h2WWdN?=
 =?utf-8?B?MzNLNm5jSDFiaVVVSTQ0am9IRUpxZkJzeWFSekNxVU1OenVGNmI0QW8xQy9Y?=
 =?utf-8?B?cFhHRk0wRURnRmUrYndLa3dWc2hQN2FOdFp1bi9Zd2xzWFlsa0dydXBQdHlP?=
 =?utf-8?B?MjN1ajNaZU96KzB3R3oxTFdEeEdzajVpSlV4b0xlUTYzM01GL1J6WTZaUEQx?=
 =?utf-8?B?cGtwVmwrZDNXNm04TE1oOUgreEcrUmFxYng4YjR2RjNRMEQyeGsvalNGVHgx?=
 =?utf-8?B?cFJVaStXdG5LMG53T3FQQTdhanZDME5DbDV5Q0RoKzlKVzRFMWsvV1Z2TStP?=
 =?utf-8?B?WHRPQlUzZEgxQ1kxUDlBUGhxa1pmSElSQ0o2ejV3WkFEcDhZRllTRmZEUyts?=
 =?utf-8?B?djJMaDhST2FjMFlvMFBQWlZMZTI2OHpsaVpBTW9PZXgvNDRYTVFYL3pyQUUx?=
 =?utf-8?B?WUtWVkdtL2xUckpvU0VoMzRlMG9FRlpGMlJyek96Wnp4V0YvMXcxekhWMzN5?=
 =?utf-8?B?andFNmw0elg4UHNPQktBdzdHcXFtcEpGNWd6U2MyZk9KalNlU2Y4Y0kyMXoy?=
 =?utf-8?B?c20yaUJwVFBhRDNtUzU2WW9zOC85QjlBN3YxNnJYSUgvM3Jmam4xSkNKSUh0?=
 =?utf-8?B?WWplSTB4aGIzZG55QUFBYkVXbHF4QlMzczFETWZ2T2NTSG1MSldhbFVsUGVk?=
 =?utf-8?B?cXQwSXBOWnJqVEREdDF0MVRkR0RNOGRZWVpnRjBWMVk2MTRVbVU5WU1NeEty?=
 =?utf-8?B?MzRQMk90UnN5QnNXcHhwZEZKT1pLZ3NEbk5BZ2JzbmE2RjFsMnp6ZFU0Umoz?=
 =?utf-8?B?R1l0MmtZL29sVkxYakVNWFJiSU5LYzIzL0tTOGFPOUVYVkpFV1ltcXFHT09m?=
 =?utf-8?Q?F39zWCWoKuGvO516wXTH+JtZ/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c37d5f10-a261-4e88-54ab-08da6a4fb3a1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 12:59:37.6251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bruzbGNyj31Clwv+7WOTSdztu4iiuaV3FDgf5jswo2hA4n0T7Xbs3MmQe7egnj2EgwTFvKAe7fs8ufVOoNFcHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3129

On 20.07.2022 12:02, Andrew Cooper wrote:
> One observation though.  We do pass -mno-sse but not -mno-mmx.  I still
> can't figure out what makes the compiler think there's any SIMD to be
> done in this function.

So this looks to be "optimization", done in a few more places. The pattern
is always the same: A 32-bit GPR is known to be zero, and there's nearby
code which wants to store two adjacent zeros. Hence they take those 32
bits of zero in the GPR, move to %mm0 (which already zeros the upper half),
unpack it to have the 32 bits of zero duplicated into the upper half, and
then use %mm0 to do the store of the pair of zeros. IOW they "auto-
vectorize" these two stores into a single V2SI (using the common notation)
one.

Besides this being quite the opposite of optimization, of course we didn't
tell the compiler anywhere that it might use any of the %mm<N> registers.

Jan


