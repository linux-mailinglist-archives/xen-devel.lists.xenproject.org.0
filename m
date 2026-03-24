Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEALKJq7wmlilAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 17:28:10 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB8031903C
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 17:28:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261071.1554202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w54bk-0007Id-05; Tue, 24 Mar 2026 16:27:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261071.1554202; Tue, 24 Mar 2026 16:27:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w54bj-0007G6-TN; Tue, 24 Mar 2026 16:27:55 +0000
Received: by outflank-mailman (input) for mailman id 1261071;
 Tue, 24 Mar 2026 16:27:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1w54bi-0007G0-VH
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 16:27:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w54bi-0077bV-5l
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 17:27:54 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69c2bb76-5cb7-0a2a0a5109dd-0a2a4502a322-30
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 17:27:54 +0100
Received: from [52.101.57.0]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69c2bb88-63bb-0a2a45020019-346539003934-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 17:27:53 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH4PR03MB7772.namprd03.prod.outlook.com (2603:10b6:610:236::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 16:27:28 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 16:27:36 +0000
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
 b=VQwXJBmc5gM+bmh5JKfJ62Vo6rmKsus3ajqacn0YwJAB7RowLvXM3E9rZC7RjWi9XLfunTD8sTUEwtTTr8NfDW7Wow+kms3iSHxCd1GJQX+owDSUhIGbkKT9dbdkDlb0//h+xLch/PaPClrGUoLi3oP1mJ1WvCR6f7afqLaFGIf5OuK9i6v9mAfMJ6IusDvoU1t26nIi6+l8B12UUwLDI78vDVPLAd17U5pU2YXZaBat8UZGItjPCHXzuxsbLYiNVBNJa0DRs3iZ45nPwZ/bOAG/vo+G32CYRCRbaiW1ax99IW4GhfAX/XI69IlyN7KYBUHG3kRXCldMXME1vjVPIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TSuwt0CTbJVc24s/SyqRyF8liXaK5pmaSoDM9xtw38w=;
 b=uKbHE6QxsYKOcBfgqGgxIZdejmXc16P/56LCKn1+JocBDu44s/J6KDiTNRn+WD0obYiWSuoksLAdo+e35hzMpt1xbvQUHvPt3Zz4/graTIGfZ5OvsjmxkAmzf0ltdD4FBrJjQpjNPAcWpIdZGy/HSNwnXKqjsVqFu4aSxJSJnjFzBESLx6r1M9zkRv7AWLVqgTb58L2YKhHgVv3u80TTtfGo7IwRKONWTvGE3Jj5IDHzLj1rYnFPluoXNS6811fLlWWijX8igJ3dt7CzoBkMifkeqEuxmVtW0NB4NLI5fdAo8UkxfOwwGExaDBeO0FD6k0B5AIIfyU/MR6OAQJNo1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TSuwt0CTbJVc24s/SyqRyF8liXaK5pmaSoDM9xtw38w=;
 b=MD3KMrChc/slvu4xaI2u1hARdSfS0cDXfyI9c6bgciNHsyFwyx7VjV4bhL1k6htT0JizUB/kr9yI/ze1cPBuwnTD389jGe1jg1pRJMu1eAhT15HOURFYsJGCWdEeu3oeQSTNxv2QPYylnNYcsgdrHyVnM1dKLvKjQsoteKdD6G4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a70785ad-0759-417f-a9bb-363b7919ed4e@citrix.com>
Date: Tue, 24 Mar 2026 16:27:42 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Kamil Frankowicz <kamil.frankowicz@cert.pl>
Subject: Re: [PATCH] unlzma: avoid UB shift
To: Mykola Kvach <xakep.amatop@gmail.com>, Jan Beulich <jbeulich@suse.com>
References: <cb5ad24b-03a5-4c1b-9d98-8df534854b2f@suse.com>
 <CAGeoDV-zq+=HWg1v53KXyPR+kxBPpE2jUruc=JFVSjXTKv662w@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <CAGeoDV-zq+=HWg1v53KXyPR+kxBPpE2jUruc=JFVSjXTKv662w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0038.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34b::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH4PR03MB7772:EE_
X-MS-Office365-Filtering-Correlation-Id: e2be2a60-a810-4d58-82d7-08de89c24269
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Pb6aLakmzMzykOSnfiTiTzy7kduti8scBCgfVc0TPwhfmyw/kEg8DbZl+qSsdFTAK12akyWjypMqjGvgWCZBJa/Eb1gqFSAGhEBpX+yLUybQswafTkYHhGd24uWq6V58D0l1wo6XQPGyq8uEQL/XHZdU2GS4doo4ExCZkLMDHybeMS9jtcG23jtr6pEhDf2MZixS9RqegUjaM1lrJp6WsfxSNyLR6SMj/nKcvN/L3R9OlvixvY+McogSigGUJfW+OuRdEHzq1DVGjvPOBLiGR3ceibSLJKSItO7FP8QB6q5KEiuIJo6HNmrppQgsZjLo6sT1lnlnMaWxleqYuT1hElo7Sxa9dMF+6X4Tfz9i+SFc6ScyMCuXfFTdPw0Plz8HwSL8O6gEPR0Pi/F/E1fAwDLAj8vvOxSypEJoYSwl1RZAcBswhz1zZ8R/3JFljuetNWb4J1B6vdb8eW36kBkOcN23kNyP381bz8ZEe3+wdnCW7MslPGyQnJiGpgqv4WvIuh+0eZjfVBja04S1PQtLkWcreMjZJds519XCQoAGXhwQvsq/N2cDunr+hj6ERiE8EXDZRIFskFsFcNncBQTzRoqlPFaRCuyXPO//k9wfdaiSETaSfEuxIWdeC4TCr+ExsvEqazBh7SXu33ZP4hHuK5NY1eLozq04xnTnL4gPui+eB65HUvYTnH9MSe+Qf24BpcLDwElThYI+STvCI9HWBHKUb7qII+1yf2wFWA/N/pA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGZlbDFIb2pFRXN2cnFJWm0vMG5WVGlhR1NWUjlWTXJOclVqQ3JTamNMMFNX?=
 =?utf-8?B?SEpia1JnNVZTV1pGbGFBS050dlh5YVdmL2xMTm1VcEJ5bEMyWXNnTVZjeWU4?=
 =?utf-8?B?Nm9wQzZqc3dLU0RhMjZkNU9sa2s3NWxxOTY3L0plSW1QeHhZTUlKTk9JRUtL?=
 =?utf-8?B?TGcrazE1V2NQRGJvOUhPRmFjRGpyU2hSUERRTjNJcmYrS3F3ODVlVkw1K2wz?=
 =?utf-8?B?UXAwQ2NsZjErajRiMy82WXROQUs4U1JkZ1pndmVyY0FBQmVqSHQzY25iUjBU?=
 =?utf-8?B?MkU3Mi9vTkFXcXFBZTh1NGdZc1crdG13UEx2ZldNY3N2T2xNWHdSWmhQTi9i?=
 =?utf-8?B?YUZFS0RRSkxFeUFyei9odGpBQTBJc3lyWTU4dWRaWVpJTy9mS0RiR0ZvY3Zq?=
 =?utf-8?B?ZTIxMStnMGQzZ3FEWnRFc0dvZ2UyUEpEczVON3M0M3NvelhMVXczSlpqeWZF?=
 =?utf-8?B?SzBWWHFkVGFaSEUyUGVMbFFWU3B6cWV4ODNEcU9ZRE9hV3gyUktZVzMybjJO?=
 =?utf-8?B?aWJxNWRUU3BVQXZkVSt1akJrN1Y2QXR5a3dmVDl1c2t1eC9mQ0ZqMER0Nnp2?=
 =?utf-8?B?dVZRcXpvTEVzTzdvK3V3UStDQWRGcWNoTjZnN2g2aXZ0cUFYR05kM2ZCTEp4?=
 =?utf-8?B?a09pT3c4ek1GNCtpR25WMzV6d2VmVXJYRzVRcnpxMitPZGxVN1NDMUVJUEhH?=
 =?utf-8?B?MHBUSnNKZGRuTVNRMitOTXVxNHdiQWFESEdxV1g3RTlYR3Y3NjlIOGdYckxu?=
 =?utf-8?B?cGpGZ1lEQURVY3R0OGlVYVhURzdKUGwrQVVwekJ6ajJFbVVHcnNDVyt6MzNw?=
 =?utf-8?B?cXhnaDBqUjNMWEVxQm12YjBHVnhEd3N5ZDNLWFVxeWxPYUNDaHBMKzgwSW9u?=
 =?utf-8?B?WGZVZ0p1V012NVBLc0RUVTNpU3lWYzErRVd3UHJmZXRvdTl5S21BSUxJemFV?=
 =?utf-8?B?S2xGN1V2UVBEYm9RZEJ4MmMvd2pSUXl2SEZPRGZ5MmYwbEJhSFVSSzRnV0ow?=
 =?utf-8?B?cWlLQktuOVhhVE9uWlBGTkZybmt5di9aQ08yY21qY3M2UzJQa0t2Q3ljbjhj?=
 =?utf-8?B?aDU2aEhmM1ZVSzV1L2tOZnltTmZVVEpMaklHNUNDQ1ZWalJWV0RPaHdYTEM5?=
 =?utf-8?B?U3ROZXZ6azY3SENpRzBPazJ6d21vTDZVdnk3YkRWWkVBSEFZUWVTRkkzbldt?=
 =?utf-8?B?VzQwMnJaNVZFWFVMRHNYSFMyRUpsbWJxYUZCN0lOU1lqdEJDK1AxWEpyNGE3?=
 =?utf-8?B?aW9ZRG9GanFSN3JiWUx3U0loQy9ZM0FmdUVsOFVwdTNBU2d4VUFhaUJnRG1C?=
 =?utf-8?B?Z3VRZk92a1VDaFhmUjFsRzR2RzNvQlRNWmd0Q2toWkRpUllKVmY5UTR0U0J3?=
 =?utf-8?B?QkF6WDZTNVluZkZOY0lVSGlkREZ1ZVlTRHZ4a2FobmwxUXYwNFNtL1NIQmVj?=
 =?utf-8?B?anRtbC8vcDA5bFNwMXM1d3YwUGJ3U09CZkxzVVIxbWwrRk5pWXc3UGVaczBr?=
 =?utf-8?B?b21sZTRjLzVvNnVkNmRvaWp0elIxZndMSUZuWVl0MGgreVZkVmtMT0NVdE16?=
 =?utf-8?B?dG1BZlJoSWtaR1BlNTR2WHVjMVN5ZVdNR0VIamw3bHBSS0NCUzRrYkJ4TUNW?=
 =?utf-8?B?NWtTY29QN1VFU2JmaXF0SXlxTkowc2FFbEhzd1VCdWs1UWdraUgvYWFjbHlr?=
 =?utf-8?B?bXRkS1VSYmlrajVzR2xCL21lV0Rpb1FqRnNpekVndUVGT1BObUVGTnQxY0pE?=
 =?utf-8?B?VWFKWVJtRFNIOVl1cmVRUnJRQmlqWDc1eENOS3g5aTRNK0hKdkY0L2JxV0k3?=
 =?utf-8?B?b3pZNGpSMDdGSnc5TUNEL1k0ZllVOUUybS9VcTQvYXY1VnZxNUlQSmRRclh3?=
 =?utf-8?B?K3VoQVZmcXJFSnRvNExwSGpISGluNEovRkI1Nk1HZUVGcEc0SUdiOWNNVzli?=
 =?utf-8?B?NkhHZkVQNkYraFdEMTVCZVJiYTBxTE9zd3U5RDYvTnlvbTB3V2tPcGFzUnFE?=
 =?utf-8?B?OENrelpRSlB3Y1ByUlZmQWVzOGRNQkcwN3VxaTllWm5hVVZNaGhsSkd2Z1RB?=
 =?utf-8?B?M2QwTVlUODlaNUVjYWNCWm9CbmV0Y1EwYXJMWkMwaytpL1JCbEZpaW1vU2hm?=
 =?utf-8?B?djR0ck9LaUh6a2hYeG1XVGxnRC9xL2VCYXVBZXBYZjRnODJHWHMyRTl4TlNP?=
 =?utf-8?B?UGpYNlNJY2dPZlovSGl0S0MxZmF5djNYajFFTTB3SnNNdkx3SHlJV2YrNDhQ?=
 =?utf-8?B?aVlRdks3L0dQVWlzSXpYKzFTcWpHcldiWmtnYk96WVJ2WUZjMnFoWjhkUkFI?=
 =?utf-8?B?Z2MyMFpxVTFDYWlDWlkzbW5IQy92Z3pqM3FsVUg1eHdXV0NuRkpIMGFOcUFU?=
 =?utf-8?Q?A9uf0iCWn3tdtvRY=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2be2a60-a810-4d58-82d7-08de89c24269
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 16:27:36.6150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5aM+i4ey73pD0SuO6iwLCoHbUjexPi5p1nWgjJbJ13baUysdIXYdFlhMpZZZR2MlG51fot+6S2TMnHLi2Liv+a0qQBJZ872kXlCfhhlLssw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7772
X-purgate-ID: tlsNG-720697/1774369674-42C83DB8-C4B9A84F/0/0
X-purgate-type: clean
X-purgate-size: 1345
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:kamil.frankowicz@cert.pl,m:xakep.amatop@gmail.com,m:jbeulich@suse.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:dkim,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: EDB8031903C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 24/03/2026 4:24 pm, Mykola Kvach wrote:
> On Tue, Mar 24, 2026 at 5:27 PM Jan Beulich <jbeulich@suse.com> wrote:
>> Shifting signed quantities has restrictions. Since the wrapping macro of
>> read_int() type-casts the result anyway, switch function return type as
>> well as the local variable to the corresponding unsigned type.
>>
>> Reported-by: Kamil Frankowicz <kamil.frankowicz@cert.pl>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> We've inherited that code from Linux, and the same code still exists
>> there. As I'm entirely uncertain whether they would even care, I'd prefer
>> to not take the route of posting a patch against Linux first.
>>
>> --- a/xen/common/unlzma.c
>> +++ b/xen/common/unlzma.c
>> @@ -30,10 +30,10 @@
>>
>>  #include "decompress.h"
>>
>> -static long long __init read_int(unsigned char *ptr, int size)
>> +static unsigned long long __init read_int(unsigned char *ptr, int size)
> nit: Since we're touching read_int() anyway, would it make sense to also
> tighten the helper's interface, i.e. make ptr const and use size_t for
> size?

No, not mixed into a patch which is fixing a real bug.  Cleanup can come
later.

This code is vendored from Linux.  For better or worse we try not to
deviate, although that is going to have to change at some point.

~Andrew

