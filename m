Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E837046AB
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 09:41:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535000.832557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pypIm-0000Mh-MN; Tue, 16 May 2023 07:40:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535000.832557; Tue, 16 May 2023 07:40:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pypIm-0000KN-Io; Tue, 16 May 2023 07:40:56 +0000
Received: by outflank-mailman (input) for mailman id 535000;
 Tue, 16 May 2023 07:40:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pypIl-0006iO-GK
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 07:40:55 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fca8eebd-f3bc-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 09:40:54 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8988.eurprd04.prod.outlook.com (2603:10a6:20b:40b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 07:40:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.032; Tue, 16 May 2023
 07:40:52 +0000
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
X-Inumbo-ID: fca8eebd-f3bc-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LESN9Lz+A77zqz/xxXRoqlGtXA+cx+68kKUgkcioU7YfAEVQ3KzAyAw4InYh4Xt9wPIPn2BcLhyx1p4ghOoH40DEXYtJjM2OkJcQmdYiECF1yrzC1YFaS99SlUDnYiM32D+KAPKLIfS/pYCUPgcn+D0zGUzJtbH6YV1SCYu8mPoOETYdaPZHn0hWGvDnAJKDBLDBer7w2YCdtjbwEyUqBDEh8OvsqoWCpl180rVrpoQT8MJqimIteTzKnMdQicb+dhkIcw2KqXF5ESq0rPxLR28wMf4Etx1xojmLk88P0rUuGNOmMHTB7/+mtte9o3KEB4welbvD3UCBlHRrZL1JiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H9Nh4XX47pvzSkaQ+Ro93eqswTOe4k38U8vTCnXpMhA=;
 b=NdiUpbXW9NKtSDqhLs32Z2wHbUDmcJC7x9Kf3O4Q5mRuH04o633QBggfD6i3T76FvLyo99jNlV8NhW696Ft5izNKDwjCpFVbbHwnwbxJ5xWvjRjuDn8R9eC4NiNB9MT7cSPI8+aoFUF/pL3CZRp1UVFYkMCB+yTc4v7kWVryvneLGnnsTXKutDFT1XkxVCrNcaTEz6fW2/3EB+dNxSzG5TNYUTEJfzKWxeeod9JZOPxgaCDj51oEzbiMB1gDKnANVcTY/iFmP9PRv/nbDYggLtpS8F/UEccOWw4K5M+kJG2Yc+9HF9Ll4SE4RYnizc97jC4img3w6wGW0mSJwCGysw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H9Nh4XX47pvzSkaQ+Ro93eqswTOe4k38U8vTCnXpMhA=;
 b=dqmBO3YSjhye44QfYOimkqdmnBFyj7sPSTYje0JJ/uwg6LCueoPrZD/N5gMsgEeUuDOWttOTltJmPH/MOByGUnvmxqMg6hbpVpk1Av6zZDQpaPMzNPBcqSh2rBGNRx4tB5CpZ3kyDW3TpaFQAv3zfcBgNy0wNiqRGTvq80vzlgRqpTRO46hiHA2VSbynsg0VqdPfAmCzMBBCYuzaabgxeyq2kPUhwzkpYFGwpmPikJPQFQlDYkN2flOkwShlpXniLQuSerjDbjmSBRjxjewf8mzM4GBNbZAcKCv3jZdovnYgiMtpn0X2D7DRTYaB0owPg0WEPr39MLurdypOJ8F5Vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <834a38d1-6917-7aa8-c560-0c943abb44c5@suse.com>
Date: Tue, 16 May 2023 09:40:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: [PATCH v3 07/12] x86/shadow: OOS doesn't track VAs anymore
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
X-ClientProxiedBy: FR0P281CA0192.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8988:EE_
X-MS-Office365-Filtering-Correlation-Id: e3692e86-6cdd-47fb-13c5-08db55e0e00c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kBRLAhLVuxWiGPamyyPsvLdrFJIEKwG9T+zZAXL7UHq5rw91mxS7STYEKzV0hZVq4WIowZPmr8GgwPvpI0nkG1morDCkVzPA4WT9q6NZSlYwaLd2DTcCdNn76uxqW6gXiJvU03VdCXtqiIk5UOQl+wBvoi45WjOZZ5n/Ikbs4MKTww9mH28Gxt+9RcC7io2nIEkem7ZhvgQHwROLRlgJsTiVFikxjLLVIliZ0/IHQNltEkjSsdoWDvmhI9EzssYWcOUoUCl87ftaI2HC8mYUjgc7HMFy8BMZO2ugui+LB1ktPnsF/yN4ubtOyRtOMiqDkIiuE6Kb1NzdfRCHfXwvcoJJmlTMt9d5ncjZ97G6FM7/YsTKwdi9H6xLk+SRURc8FBgjak7PmXtrvPt2D+3mbazdIYz8ipJYosKMu2apgv5FMEMKr8Qtf1YU+TGh1GoLOpnfb3OBTbCSH33BMYdYIMqUIKRXyDxv+F2ynUYM4wJ/6bzXbZ6eJrElKeTIPisznT6ilCgaonqZUHu7oJr+gg42noJOEAy9yNQS/gQoxr9qTt+oRU4DiSYbo5D4zqI7bqmMJxui2+ej/xJh2l40b2ERC/aTPDBY0JBNQwGPvMCshAKrjWUOKPm7W3paQdzmTdeVQY574jg2Tp5xCgq1qw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(366004)(136003)(39860400002)(396003)(451199021)(2906002)(316002)(6916009)(31686004)(66946007)(4326008)(8676002)(5660300002)(8936002)(66556008)(66476007)(41300700001)(86362001)(2616005)(478600001)(54906003)(6486002)(36756003)(6506007)(186003)(31696002)(83380400001)(6512007)(26005)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVFnUXJQZG1Zb0JPM1JXYnJ6a0lhdlVjZ2pwSXlKWXVDcXppK2ZKK2FucVVZ?=
 =?utf-8?B?Si83V01WV0M2VTFqRFkzTzN6UXpYV2Zab090UUt1VmFIK3hxYWRqSHAzRUJO?=
 =?utf-8?B?aW4zeE5OR29UeEtpcFJEK1E2OWpiaHQ4Y2NXQUY2VXUyQ0JwR1B0NjBJcDd4?=
 =?utf-8?B?TGN1cno3U0c0T0F6NVgyUnl1YzJ6b0Y3emUyZEJlcDZPK0lZZkRCZWJlbVNK?=
 =?utf-8?B?aE1KY0xkMmVLNS9Xc0VJUXVYUG1FSUJRNmZSa3JLamQ0MW4wRC9RNmttN1Zh?=
 =?utf-8?B?c1RtVE45UkxqbGNTZkhIVFJ3WG5tVUVtMmgzN2t6RThlczB0QUlyQnR6UEU4?=
 =?utf-8?B?Ym5NTjJnbVZYaVUrKy9jNTNvcVQ4MkcrM2pndjA1QWM5MWJ5WHFmWWVNYVN2?=
 =?utf-8?B?M0pDV3E1UE5NODhWWDk4Q25kRDY4TC8rTWI1L052b292VEpRa09nR1B4c0F3?=
 =?utf-8?B?dUpLeTZWdGhwTWp3NC80WTRucGlSNUxkNEt1MlBidHM1MHNtUnFudXlIUkds?=
 =?utf-8?B?ZDN4ZTZNbzYxeW9KSjR3cGlick1rS2VSNVoydXk2V08wTkRqNkI0a2NZODBt?=
 =?utf-8?B?QS9HNFNyZDJVZnBFT1BLa2xpTG4zaVY0bGdOZW9ZQk10eWVPVmpEcFpGRlVG?=
 =?utf-8?B?Q2FDc2xrbG1GVThEeGVkaU9RcER3Rk9mVTNuSWFYVU9vbDNtdkJYQmZRcXNQ?=
 =?utf-8?B?WHZMNEsrWVRWeHk5UWNUS1UyZEJ5enFpT2FRcm9FSG9rODlZMjd2elBJeThx?=
 =?utf-8?B?ODhrQjE2Nm5UNFBDMFBjNy9UQ2JBWmE3UWF4YzBFbmFWa1ZFTExOTUN3R3hK?=
 =?utf-8?B?QjFNdllWR1hERWc5N2JtcVl4NXc0Mkc2MTNLYWRENjgvK3YyZXpRenMrS1Zy?=
 =?utf-8?B?bDhlc0FZa3pVQi9neWQ4VzRjWVNWZkJJcVRnUE5YYnRDTEc1aTFXajd0OHRh?=
 =?utf-8?B?eGNJTUI4WEdBbEFmNnVNUGRCeGpSZEd2L3dZSkQ2eDRpVEdrTk1tSFRUajk1?=
 =?utf-8?B?Yllqa1hGY0NnSXlTSmd6ZHJTcWdyaTY0ZzJybFd4YlgwUkltb0JPQllYSmRs?=
 =?utf-8?B?RWRDNHpKQkxkY1RJR21TQmhVbkJDdDFrOWU5d1F1MnFLNnp1dlRSS1RKYUlm?=
 =?utf-8?B?NVc0Tk1pdkZ5VHNSREdlQnN1SXJFM2JnTTd0cm5qb3VFenk3VEpMTGk5TnJJ?=
 =?utf-8?B?NVF5M1lNNGxoZmZIRVRQTGl3RWxZamdiekNHVCsyWnpocWJkOEZXdjB1cUNC?=
 =?utf-8?B?WWwxMGdrcFVBWFN5R1ZYcUJqY2crMEdlZVA5ZnVzd01TYVF3NmlFby8vS09U?=
 =?utf-8?B?T0gvZng3UzhPOEtBN1Q3alV3R0Z4cTR1U0Q2TDVaM3IvUDYrNlZpRnRoR3VN?=
 =?utf-8?B?QXFiNTNIQUFhTHVLYXA3ME5Hbm9TazFzNGxJNWF6cDREL3NJTGp4Q1RZd0ly?=
 =?utf-8?B?ZWFSeXlKQlBCMjBaS2JlcTJoMS9Zb3ErLzhzdzBnM2U5ejRmRWRsVWxpRGhu?=
 =?utf-8?B?NUtlZnhOek9xeVM0VUNwNFhMVGp5a2dncWJXeCtsNGs1dGI2dW52NWhYd1VI?=
 =?utf-8?B?WlVxbzFJWStrTUlyY3d3ZzJBSHFMT293Q2M1T2FXQXpwMHFwZHRCLzJ0WDBD?=
 =?utf-8?B?bE9CTVRsclFQd0QxWnhPMllpMUlYZzJ6Smp6Kzl6VjZKNzc3TFE3YTl3UTBr?=
 =?utf-8?B?K3RjbEhHYnp5S3Ivb0NwaURLUjBmMjFJTndMVHc4cCsyditYaHB5NkZJa0Jm?=
 =?utf-8?B?WlRhUFRYOWNOWEswZmxuU2xvUENoK3ZYMEFVb2krajVPaWhVWE4zREplNkNo?=
 =?utf-8?B?NWRBb25wQUFWQ28rN3hSTXZ5VmFXNGRkcHlRWWVCTHNPSENRUW1DbWozOTBI?=
 =?utf-8?B?TUp0MDhlNHlZTFd4OTlBMkhDNnZESlZrZDg3VTlYNGthWlppVUJrR2wvWXdl?=
 =?utf-8?B?T3duS3FoUVB1QmxRVWlHV1loMmNKYTRuN2JiUThJbEcrUnJyOWk0bDR4a1Bl?=
 =?utf-8?B?UVB4eE5RQ2dpem1SNVo0WS9PZDFTajhxSXlOWHdXTHFhOGh5QmhVcEZyOGtZ?=
 =?utf-8?B?TVdNT3ZnVjhGQ3JmZGlmYlhtbVMrZHFuckRRT0g2VTZ1TzZ0eU91ck9wQklJ?=
 =?utf-8?Q?1m/GhupuflVZfa9JilZ7Jg4ll?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3692e86-6cdd-47fb-13c5-08db55e0e00c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 07:40:52.4220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 52kfRysJJE1vGN75oFRRPRh8C/BKcH4z095LQAhTmzEP5xSacf89pqj09bj87rmm5XMgt88atD9lIbYDwH8LeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8988

The tracking lasted only for about two weeks, but the related comment
parts were never purged.

Fixes: 50b74f55e0c0 ("OOS cleanup: Fixup arrays instead of fixup tables")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I'm heavily inclined to fold this into "x86/shadow: move OOS functions
to their own file".

This largely removes the justification for the per-vCPU hash. Is there
any other reason to name there in exchange?
---
v3: New.

--- a/xen/arch/x86/mm/shadow/oos.c
+++ b/xen/arch/x86/mm/shadow/oos.c
@@ -51,13 +51,10 @@
  *
  * Currently out-of-sync pages are listed in a simple open-addressed
  * hash table with a second chance (must resist temptation to radically
- * over-engineer hash tables...)  The virtual address of the access
- * which caused us to unsync the page is also kept in the hash table, as
- * a hint for finding the writable mappings later.
+ * over-engineer hash tables...).
  *
  * We keep a hash per vcpu, because we want as much as possible to do
- * the re-sync on the save vcpu we did the unsync on, so the VA hint
- * will be valid.
+ * the re-sync on the same vcpu we did the unsync on.
  */
 
 #if SHADOW_AUDIT & SHADOW_AUDIT_ENTRIES_FULL


