Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 369F47046A9
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 09:40:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534992.832547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pypIK-00087f-E6; Tue, 16 May 2023 07:40:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534992.832547; Tue, 16 May 2023 07:40:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pypIK-00084I-B3; Tue, 16 May 2023 07:40:28 +0000
Received: by outflank-mailman (input) for mailman id 534992;
 Tue, 16 May 2023 07:40:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pypIJ-0006iO-Eu
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 07:40:27 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7d00::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ebc29790-f3bc-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 09:40:25 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8988.eurprd04.prod.outlook.com (2603:10a6:20b:40b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 07:40:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.032; Tue, 16 May 2023
 07:40:24 +0000
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
X-Inumbo-ID: ebc29790-f3bc-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lgva9R4Kz9hWh79Su6qQs4tm+oMIrB7+fNZAwXUFkwUc8JO0+Nfhfe7QF+W+/hIeL9iffCAd4QaAcAHQlMtUSw7AYU+Ai3J0KoobWwGVA6Yk0tMTidIhbwOkCws/8syagcpOl6Cj1rVJynZoD8xOszHtaeqropTf6fJJyj4oSzJJnXOJpuqhiO0Rs9nR8dkSbLL6XPhDciysEiI2ZEBj0fhVEmjU70IfKWvWGlRPyftPVhkRBMCybSbo7Iw4jEfma8PMwsl7Hbw3yH/BXhTlH3vpT9expLBRhief6SMW2+oU0n0j1PCysTq4piUKTPRmXJ0iGkWrXlVThUkBlLG0Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fk5gtEXHOHX/0G/rLup+XQBTQcNEBbA/Wd3XareT6hc=;
 b=SOCMbqAis+NeL4/G9oAnkN3D9DEUdQjk3j3lwDdZaLpLWc2CkoulIJxtCtFXDRnGGHohnCNAMWtbFJkRYxSxeajjdWyyd3ujMYOpcjF7XYXAAustGDvOXBWPBsZbqent6TKM4DyQBvw1mP3/4lGFJtP6+VbQIEX71LoqsgEryP8UglTCehYYIjKB4lj3nPnuzrRjnVODZ0h1v9ODobNDGG+kmu7Goi3bCQex2PyjfbbZWLSmNReTbg0hjqkqZm+tfx+j2sgjM/yOPlAdmYng4YqKmfA6vVwByb8g/1StUjClcJTzlLpQUfiY9H+LY6TVc1deftOXXeowPsORHfRusg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fk5gtEXHOHX/0G/rLup+XQBTQcNEBbA/Wd3XareT6hc=;
 b=C/OFq4a8l6NcyKQs5YiP+g7pfJuBJiiFPy259RZUSTXySfqNmnDHl+FGTQeh/YT8s0OuEQ1zMU+WvVr9Gwo0qBffFPbChzZgBZ8+hI/qP8UPyeQDUmDIkVF53FNEWux6OD7MGy036BMJUcL13d01bCSHe8kKNdjkS4k2QzwFdyd7uQAixsox6lG/ZKlRWC83Hh0KN24DOZxjDI3/m8/ls5+w7+fgN0GlhC6VX/5BPy45yLUz+yL18kn2c3bt3DG1R/dfMG6l49KAPg+PCAh8YTd54jt7i7st1A8ZBdP0Wq2zmHZnzrMb/2wuNyHcbGgo/CFC0g204zigCGS05gp27A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3c05fb6c-f71e-1b86-6146-96f2b3f3c9ae@suse.com>
Date: Tue, 16 May 2023 09:40:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: [PATCH v3 06/12] x86/shadow: restrict OOS allocation to when it's
 really needed
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <184df995-e668-1cea-6f9f-8e79a1ffcbbd@suse.com>
In-Reply-To: <184df995-e668-1cea-6f9f-8e79a1ffcbbd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8988:EE_
X-MS-Office365-Filtering-Correlation-Id: 79688538-1ef5-4160-2166-08db55e0cf19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BIlFoF3U5vvIPQ1zMoBElYhKga5zqxP4ZsOC/fKG+NTuxJRvmDpmA5AWamLJN53NujMz/Q+d+8lIeyujDsicTQ1+SlE7Dgcje0MEu0Ui1WgEUIyQPzWepDr3DVASuiSUY/aIPemU5u0BtpDhEv2BhcSD64A84Lr67FEIz1jCjKsBpEIvRyUGxbBHTW3O8FavpD3+Rk7C+quiZlcH8VEf6AKLOaiYGHZ0O1sULAp+yADw0oSELdReFQjdZs+84dNEGaEotaBFF6hw/4RFAva+XyC3gZHNcNuaatmwZbW/pjLZEBfEoJaVqMYQ+HYY2usNZs46slL+B1piBHIprp3u/h7uWzwQuQRg3B2CprBNoBBuO43MM7bGKM7MrcVwRguUL7lr2O2FMauLyBCCFmGiCM93B+Zxl0DDUcZxwiP0O0R68PmUAu83Xctu/F4a+QbLd8yjuiJagmKD+61Tdxs6K4at8z9ZmWFAcVnUGeD2WAK0lNGkVLVpiAAIE71Of0RjawKFxu13rKck1pvgONzxnHag68H9oykwEd0SvNKtjVfEbAOL2xLmodIJzE3A/qkcqChTG0mJXqj2BqHiS37ct8U/nYdy1OfO3aRDnoFnmwZD6HqxMJI94XAqFXmMaymYSex5AM0/4satCWqEsi5wxQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(366004)(136003)(39860400002)(396003)(451199021)(2906002)(316002)(6916009)(31686004)(66946007)(4326008)(8676002)(5660300002)(8936002)(4744005)(66556008)(66476007)(41300700001)(86362001)(2616005)(478600001)(54906003)(6486002)(36756003)(6506007)(186003)(31696002)(83380400001)(6512007)(26005)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXZkclYxZVJYa2hNTXEyZFJCWXlvZWx3TmUxS3E2bHhvU3BnVk9MWEVyUlRq?=
 =?utf-8?B?NzNieHRkTy9DTkMyTUlId0Q1OEZLZ2Vlc0FLYzVtcWpKWTUwSzR5Q0FqTVhQ?=
 =?utf-8?B?OWpEQ1IvejhlZmFERW5CSWNEN0lEaU15bGtVSWE5MHVRVXdKRUxQVDRnL1Jy?=
 =?utf-8?B?SXMvU1lobUlSeGd4ZTV0YUR1b1Z3VCtTVGIwbDNvWVlTaXNVK0VYOHZoNFEr?=
 =?utf-8?B?S2RlYVI3NkJQWjlqMjgrd2pkN1lRcEVIYjE1NWcvK2VBTk5mdHN2b25MaFoy?=
 =?utf-8?B?YVdkL3AyUk80MlkyUnZsOW1JdEs3b3JyYXJNanZ5clJweE03Ky9hdmRGZ2pN?=
 =?utf-8?B?RTBUazlOdEFoZWd1TmFTYW9QVUwwbFRsNk51aEx5NG9GeVFPVFl5U0UyalR4?=
 =?utf-8?B?T09JTFpPY1RzdFlxTC9ObXFzS0hEWTZWeWdpeGxHM2NuUHdIRjNLWFUxZHdC?=
 =?utf-8?B?L3Y5NXB0NXJyTDNaRDhMYVZadHRMd3VDdmNmaHQrTVl2RTN6MmtSQ1RuUU9s?=
 =?utf-8?B?REU4bXBJM0tjc3BFeHY1Z2FIVFVnNlNPMzNsQTYrNDlMeW1KV0Jld1k1Ympk?=
 =?utf-8?B?alpXR3A3OFdZakRlVjZxTUJUWUFXemxNM2JaMkhvVzhCSVdPenF3dTJUNTNU?=
 =?utf-8?B?SngyTENoamJFZGVYdGVIMHhmcWt4UVVUR2R1d2xCejVub2RlS0ZIOTlrcS9W?=
 =?utf-8?B?UkJFaExzV2hrMEVrK3BZeHlOS215b3FscDhTdnVlRlZrZ2txRzYwcHM1NFRa?=
 =?utf-8?B?QldmVEpBczhlY3pEaG9pRkdYdGpPcUxkQVd0QWR2VUNsV0FLU2F4MDZCZnlU?=
 =?utf-8?B?aTNUUGhVSnBkZW1pWlIzcHV1dFhwUDhiamI2WDIzNU5FYnlheFBhb2JQRW5J?=
 =?utf-8?B?NDJCSVNON25XdmxEUWhIdkNLT0VTUW9TVHd0blZhLzJGSDg1M0ltcHJ1VDMx?=
 =?utf-8?B?bnExVHM0M1Bsd05ZWVlFM254OUx0VjFScWhSMjBqTWxnbDFJVFJ3dG9HK3oy?=
 =?utf-8?B?WjZUMDJiUWowWEZUTUpuWWZOR2cwNXQ5bU1adkdOemF6ZFh2Y1VSa2pUUitK?=
 =?utf-8?B?ajNLalBwdkJUY1FVQ2UwSDlVMXRvc3VtU2VKNW80SEhKQkZsa0pEbjA4NFoz?=
 =?utf-8?B?SWZYS04za3llM3haNFJ5NmltaEZTV2NQOGd6YWd2NW80YkFBRldiVXJSa25O?=
 =?utf-8?B?RkQvS2tUMkZBN1JBMFM2RHhJTEgveDlUQkFmZ3k0TTkxSXd5VDBhL2lvUHha?=
 =?utf-8?B?dW5YTVJlV1FNU0dGRWxVVnBjNVRQTmppSUdmb21YWnR0bFo1VmFGSUlCNllS?=
 =?utf-8?B?b2d2eE5BeHgwQUovN1c1MitTN20zZk9tZDFwU2NVaFcyQjd1WTBQS1dVQThY?=
 =?utf-8?B?TUk5Wm5mWkNSekkxam1JTXhrQ2x6MjF2VU81c0RzaC9zclhZQU9YbE9qS2d2?=
 =?utf-8?B?UEVRTDRoQmk4QkNLRXExdVhNZUtUOVZNQXN6R0N1WG5pWHlER0E0SFN3Zjli?=
 =?utf-8?B?VUFhMWs4U3hDd1JEMzYxSVFLak5YbUNFQi81VjIrc1FlRnRuQ3hwOTV4WDBo?=
 =?utf-8?B?RVhqWm0vd3k2SjMzRWpkYTBQSWRrRVhJWkhCdGl2Y3l5cmo4TDFEWlR0TWls?=
 =?utf-8?B?SnhmOCt6N2ZEenpYQ21zZTFrd3RxRkxFNzJYWmI4RTJLeHcvSVFrMjhRd0o4?=
 =?utf-8?B?Q2ZhTnllbjRqdUJ0TzNVdzhZaTR5YzQ3ZjZNaTJOTEpqMnUvWmMzSHF5R3Zj?=
 =?utf-8?B?dHZyQjFBN2dGUEc4emsyOG5ySWVkcTBQY3cvNFVwZkhrV281QXYxU0wrV1BK?=
 =?utf-8?B?d28zaHhIYngwWWFoY3k1MlV0SWpwUWRSYWIrZnBqNFBmM2dMQ1RvT2JVQWEy?=
 =?utf-8?B?V2ZpcVBLcUhScE9MVDdaNC9xWUttMDdqaGlpSGZWd1k2UzRvbERLTmFoanN3?=
 =?utf-8?B?ZVFQK3cvN2M0NC9veXY1UnNmb3ZqQjJEUEZ4NHdzb1l5T2RFRXk2ekxOeFhl?=
 =?utf-8?B?N0d0TnQ1ano1cy9JQlcwZ2ZRVWNZSmZmV3BReW5FWHFkN3VpdjhvaWdab0ps?=
 =?utf-8?B?ejVzb3E2UEFlUVVLRU00SUJzaEVvUk81elJiSVJacUhWeTJIQUlSUzBDMGFQ?=
 =?utf-8?Q?pBPqQY6RSP0t9a43P7BpmzuQN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79688538-1ef5-4160-2166-08db55e0cf19
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 07:40:23.9683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EWFBATjjxIMaX0RjuwXKakxAVcoHyhwHDSQmItUAl6PEISR8JkNwMl+vlZyCj7MeLKmNGn9dhLwdV+sajJ1Qzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8988

PV domains won't use it, and even HVM ones won't when OOS is turned off
for them. There's therefore no point in putting extra pressure on the
(limited) pool of memory.

While there also zap the sh_type_to_size[] entry when OOS is disabled
altogether.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: New.

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -61,7 +61,9 @@ const uint8_t sh_type_to_size[] = {
     [SH_type_l4_64_shadow]   = 1,
     [SH_type_p2m_table]      = 1,
     [SH_type_monitor_table]  = 1,
+#if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
     [SH_type_oos_snapshot]   = 1,
+#endif
 };
 #endif /* CONFIG_HVM */
 
@@ -1771,7 +1773,8 @@ static void sh_update_paging_modes(struc
 #endif /* (SHADOW_OPTIMIZATIONS & SHOPT_VIRTUAL_TLB) */
 
 #if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
-    if ( mfn_eq(v->arch.paging.shadow.oos_snapshot[0], INVALID_MFN) )
+    if ( !(d->options & XEN_DOMCTL_CDF_oos_off) &&
+         mfn_eq(v->arch.paging.shadow.oos_snapshot[0], INVALID_MFN) )
     {
         int i;
 


