Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOBhHheg4GlukQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 10:38:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD5940BABD
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 10:38:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283128.1565417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDIF8-0003dr-18; Thu, 16 Apr 2026 08:38:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283128.1565417; Thu, 16 Apr 2026 08:38:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDIF7-0003b6-TL; Thu, 16 Apr 2026 08:38:33 +0000
Received: by outflank-mailman (input) for mailman id 1283128;
 Thu, 16 Apr 2026 08:38:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wDIF6-0003ay-PP
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 08:38:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDIF6-0055Zn-68
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 10:38:32 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69e0a002-bab6-0a2a0a5309dd-0a2a4508c5c2-40
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 10:38:32 +0200
Received: from [52.101.61.57]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69e0a006-63b5-0a2a45080019-34653d39071a-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 10:38:31 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by LV9PR03MB8414.namprd03.prod.outlook.com (2603:10b6:408:367::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Thu, 16 Apr
 2026 08:38:28 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9818.017; Thu, 16 Apr 2026
 08:38:28 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DfFeeNEQmvwIGJmeel1755e+pvqdqs4zLgkkvuVCYrIVqQfQxFfvrqHIMLfzVpKePEyKTnl5MXKOij8Hx9uJbEImMHI225lLuUm45HYOAnRdRzMGWzvlQd/mZYNgAMWee1hBRk3AG+GAUdKuIQWAXD9fpKRs4KmthToly7xpTLKnb+q09wKAfb7moEViojcVdVivpzJASZSW0jUot18nmv0azZUtwWu1O4/XIyRGPYR2HNsGET1DOXTTgdnxcb093+d/+8lF/gPce2Dg53G7x4snM3VZ3P99PJgCucXfeAXJWcxejs5M8ZaqxL+4Q1tWWJBbEU3/3wrxtKjncgWmnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQS/bSQTrEiMEaBqkwPnFERmOVSRIH2DGttx4rqn7I8=;
 b=fQ1Ue5vNgi/bRVSvM+d5rRj0ygy1Ese87lD1RguOzgqNV2h1UaT5tPNMD6stg9gwEmHqybOoeOK5LIzjJnvdpiTfN5pL9YY5/2EgSiNnD2Lb7mB+JLyiE+s6gTHXt/ppx1m5nxdLcV/ceXXuhzGZP4iGysisULIgNuMQpDnHSNCQ+2sTixLebKXcjhxZOXgCtQORwMHe++3hcKCOWJOXq5kF1+GZ5gE+x6UgJA57AKcRhPRVVIgcTztiFNbiCmoWWvrw5pWV1TzmXdgCCe1vO20N4JgmEHkM2rIBfgzINFvFeHBu0d2bItXaxS9tG/MohY3uLZ8FoBuN6K2XWKDDcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQS/bSQTrEiMEaBqkwPnFERmOVSRIH2DGttx4rqn7I8=;
 b=SC6FkeCaC7W2IW//38mqrDbiMwwtI66dfKJO7t6EOYBaE1+fM3uD89TicmCRCdEbV28bLjEysFjmVI/W7m0gDhHIa/y3IpfT7ahTnrVpUmtup8caUZl3N4dCpHH+wIR9ebQ+HI9ExgJ4H8QX5MvhsP/gV6dMhNygTS8WeZBfpyE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 16 Apr 2026 10:38:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] x86/HPET: channel handling in hpet_broadcast_resume()
Message-ID: <aeCgABa95gZPw___@macbook.local>
References: <a77822d8-08f4-4c4f-b291-cc44a213cf9f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a77822d8-08f4-4c4f-b291-cc44a213cf9f@suse.com>
X-ClientProxiedBy: MR1P264CA0056.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::20) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|LV9PR03MB8414:EE_
X-MS-Office365-Filtering-Correlation-Id: d9899a34-24e0-4aa7-4e91-08de9b938873
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	cqQUZXIy8oLVmjdAq/zp1T/u73aAhISHtYcpOkGxC1W+BuCVWyP07g6Tc2EnUKkAByeMG/thHNSWaqZPMqLKlXMsAmxofxvnywebiPsl0sA/fNg169E//OdiCAaam5rn60FiZ4KLmNg1WrdSLYU9gm2C79Xu1cgrrKtu00sDhbkG9978jL77LMe+lHOYK0byKFuN2AG2ObNxk1tu4v1uLavG8DOb14Srqys8GM2OW+1QGGrlQYZBeRUEu+g5x6pV3AKaIhahtBD8b9EJ33hU6MncWCaIRNCuSNMCG+MnfffN2DQ3JapCtMpV1YxRBYfrK9zyOJWUpvLd7IChaPLT1c2nQRA2nEJ9uJ+7IG2sBL50TN7ojVR207xZi7EicGxMXuPGQpZTHV1opbtZkHmKAGgivZiuwm7Y6gOvxxhnobOx+D671qxUrjQOqZ7Jrt9T6XePtPZk8sgNx0ZbPq2AbLwL/uRadotEYdjzVlRoOhr8fQt9vUZe+60nDhPp5gT654RoDWJFSTnu1fbuhL5WTsCFc+6+HZYUoTxHBFu9lvtanWCUMfUFj/P210bJmeVJSUtWkpyR7uiXxl3AmSwPpKA0BR2nw4uN9J1HSbNnDESAhbW8Zp37A7LR7I6v/wf7DjZNF7ps7QgG4PADTXPkenZeSJoUJkVtqyU1UdGAazC8LyBzovAwpL0ytG3pSu+9tXEsqfkOsG8zsO9/fq++p4G7PmbH4rOnerr125cnxts=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnVMZ3M2KzkwT25CMjg3bWZPcFFnOUxKRUtxYzNONitxNTc5YVJvbGY5UWZW?=
 =?utf-8?B?aG5uK2FRNGQ4RVNhaFpXYjBXYlNnRENEcGxUT1JrcjMrRENqcWR2NDNRTEc0?=
 =?utf-8?B?bFpBMGNIOERaaXBYZWt1WGJzdkZxSGtnT3dsSTR2OTFVdzArSUl0ZEkzUDA1?=
 =?utf-8?B?TTRyVW1ycW1xLzNGUVFoYmRDNzdMcFE3NUxkWjgwNTcyOGtRVXArYXBDcTVE?=
 =?utf-8?B?OStSTUJCVzBYRnR5MG1oVHIwZmZVZXZmcXdwdS9YOGZWbmNmZkNXb1k0UXpH?=
 =?utf-8?B?c1BpdWdPUmJTZWxxMVk2LzkzSmpJNEplaUZianRhVWM0elRNUGUyMkJJVnVq?=
 =?utf-8?B?YnFBYWNuQXE5eTlpaVlNWUE4N2xiTUt0YVZXYUJiY05vZFh0M1A0ancvZkE1?=
 =?utf-8?B?NUN0WnhaaklIUTRSb2hUTlBYRXFGenJVOTRJNTBZRjNlT0RPbW50TlpEeGky?=
 =?utf-8?B?Rno1WTdiYjUxc3kxbXB2b05YM0ZGUXFoazY1blE3U3QyOFJkWkpMWC9NQ1pE?=
 =?utf-8?B?T3VPcy9Hbkg2RVY3c2FzY3pTTVJEV1NqclM0RGhlaUFHWkVTM0dZb1VubXlq?=
 =?utf-8?B?TWZpaWt6MnUzVWtNR2lZZTZuY2JhYitURW4rcTIvUUhkUkN6S085VStDbFVz?=
 =?utf-8?B?MHpSNTB1dnBCZllRSThONWcvK1VYMTdjbDVmdSs1ZzVBSVNvSjA2LzdJY0Jv?=
 =?utf-8?B?a1VZemJ6d08vZHN4NGErSkpPek11TU5rZHc4dU5Rb3RGemlPdmE3a014UHF0?=
 =?utf-8?B?U3hNL1FXdU5nSkYvUC9LUVV6Unk4NjZIQzFwWmt4MUY0V0hHVDJiT2NCaGdX?=
 =?utf-8?B?enNYVVNnRXlzZ1FobkxVTy9uL2VETXBKTGlvK2ZDeUFjVFZtd1VpUjBsSFd4?=
 =?utf-8?B?QU5XRXJYR251bHpOS1VWbTUwQUJwL0JyVk1sWXgvNTNENDFxRlArVEQvajBI?=
 =?utf-8?B?dHE5TzcxYzkraEhvQWNoS1ZzZUNJTVFCYkcxcGVKWXo4MW9wdmFEOG1CcTdX?=
 =?utf-8?B?UHVBZXhkbko1L2FNZUNBTUNzcmtnM0RzcXl5U2hmMUNQcGpyM0JCeVYwZzdC?=
 =?utf-8?B?Sk5meVptMUtkV3FJUDVOSFJtMjNIVnpJUGlxbnR0aklwL2gzR0FMT2Fpdmdn?=
 =?utf-8?B?MVRtQnBXSVQ2elNmcGhVbVRzb25DNjROSXkvRDF6azFRK2FNWkptczYxdUtU?=
 =?utf-8?B?U3BWU0VZOTJyQmRHKzdVamhTVUhzbnZ5blVpd3NMZFliTWpUNHJmSXVhTFo3?=
 =?utf-8?B?cytEUys1YmVBS09TM3dkb0h3VWpCaVVDMFljTHBJNVVNbUVwNWpwTlk4VE81?=
 =?utf-8?B?MlNnbThGV3d2NkNpaVhBYVU0WURDNU81dUl4MnFVUWI1UW43dEcxVHo2bjJh?=
 =?utf-8?B?S2NIc2VaVjdZeUhidjRuNDlGamdRS01BMnUvSitReGx5ZHBkMEZ1ekxtZTRs?=
 =?utf-8?B?clV4cDBkd25NeWJuSUVpZ3kxZUZ5K1dKamZ4eTZPYUZ3VlRWelY2TFN5amgw?=
 =?utf-8?B?d0RneVZ0Wm5lcFhCQXArRWc5NUliUGVRR0RKSjQ1NTNZZFk3MkhUeUs4djJR?=
 =?utf-8?B?NVZ1WEg1aitZdHdlLytsSlcrcHJ1aUVIRGEva2NOUjdYL3duYnhyRE93OFly?=
 =?utf-8?B?aHpNeDdGdGNUVGxsdHFEYWtWR3Fkcm1LTUFJbEFXQ2lSR3J3cDlQbWFlSXlQ?=
 =?utf-8?B?eUNuTnFiV2VLWGExSEN1dTh3Wm9qSFh2TkFmc0QvejYybS9DOHQ5dVFocnVq?=
 =?utf-8?B?VWttQXRWelY3S2FzQjVFQ0Q1L3h2dHhjMExiYVlMN1d6QzlTMmJhYWQ2SC9D?=
 =?utf-8?B?UFJXSmxyV2tEMzZVQTZVOE9YK1VjTzNnaVBybFFNOWQ5ZVVRU2RMK3VsWlBO?=
 =?utf-8?B?YjgrVk9SLzRYZ0srR2RJaDV6UjhkVWl2WFlzaWxrZ2lXb0JZYyt6amE5ZGtE?=
 =?utf-8?B?d052RC9iWjcwSUp2NkttWE9QRGFmQjhXcEF1SEFRblgwV3ZISlR3SzB2MVVw?=
 =?utf-8?B?cHN3YTRuM2NGOHVySUtaY2VHSWlNMzZmdVZkd1FMSHRaL1pyR3NuaU5OSWhy?=
 =?utf-8?B?WjlDVjBYUkd0M1ptT0xYcUY3WDBkL0czSWlvb2R2YXowZklWRHNmcE1yMEwr?=
 =?utf-8?B?WGpGLzJFUmxSNzZRUXVad29IdDAzV08yejRVMVZoYTN4T3NqU1ptWDlVQ0Fh?=
 =?utf-8?B?S2k1dmlsYXJpUTZMSXJCaWZVa3liTUNNeVFPdkp4OUpsbVJvSUdFaWhmUmE5?=
 =?utf-8?B?K25WUDh5VmVyRG12ZlZ2R2RTdWRJTU1CV3Y4dFY4N084VHIra0ljMUtzd0Qz?=
 =?utf-8?B?WUd0aURVeVhzWWhBR1l2cHU2WkpGcTBueHZ1ekZaZ056R2lJRjNPdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9899a34-24e0-4aa7-4e91-08de9b938873
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 08:38:28.6330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PbrDpLBRdIbbvZJeUVH1W+dMTWkVpIrFlBPIp2FtEOkz+fP0AtJHOvf8+TeGme2yW9vsTRVcqFpCZEAY6fQQ+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR03MB8414
X-purgate-ID: tlsNG-c1860d/1776328712-C0159DB1-5E2B8CBA/0/0
X-purgate-type: clean
X-purgate-size: 1055
X-Spamd-Result: default: False [-2.18 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:server fail];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,invisiblethingslab.com:email]
X-Rspamd-Queue-Id: 0FD5940BABD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 03:33:12PM +0200, Jan Beulich wrote:
> The per-channel ENABLE bit is to solely be driven by hpet_enable_channel()
> and hpet_msi_{,un}mask(). It doesn't need setting immediately. Except for
> the (possible) channel put in legacy mode we don't do so during boot
> either.
> 
> Instead reset ->arch.cpu_mask, to avoid msi_compose_msg() yielding an
> all-zero message (when the passed in CPU mask has no online CPUs). Nothing
> would later call msi_compose_msg() / hpet_msi_write(), and hence nothing
> would later produce a well-formed message template in
> hpet_events[].msi.msg.
> 
> Fixes: 15aa6c67486c ("amd iommu: use base platform MSI implementation")
> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

I think you can adjust the now redundant irq_to_desc() to use dist as
Teddy noted?

Thanks, Roger.

