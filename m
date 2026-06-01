Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGYxENCoHWp+cwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 17:44:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC862621F60
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 17:44:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323938.1589611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU4oB-0006Cs-R1; Mon, 01 Jun 2026 15:44:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323938.1589611; Mon, 01 Jun 2026 15:44:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU4oB-00069g-O7; Mon, 01 Jun 2026 15:44:07 +0000
Received: by outflank-mailman (input) for mailman id 1323938;
 Mon, 01 Jun 2026 15:44:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wU4oA-0005wG-D4
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 15:44:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wU4o9-00BHZZ-Pw
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 17:44:05 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a1da8b4-e002-0a2a0a5209dd-0a2a45039e8a-26
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 17:44:05 +0200
Received: from [52.101.48.33]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a1da8c2-672d-0a2a45030019-34653021f83b-4
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 17:44:05 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BN8PR03MB5027.namprd03.prod.outlook.com (2603:10b6:408:db::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 15:44:02 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0071.014; Mon, 1 Jun 2026
 15:44:02 +0000
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
 b=UJRxiocj+TlC4CWOBdW165TItmQQJW8tEtYXelCOkdmayfubfXIR9pjw6srSfYhXZY+Ucpa0mAFblVkn1/gWR7z9odXEZX6MxSoEi1KBMVFAVSvpZABlgaXmmBz2y/Ty5EYSPAutmuE39514T4/qiIuhukAVUe0M0c55wKpcLkpYooOcmvwpK9uJA/BEOgS9NVYvgPPtqmXYPOxZwxlvEMJgez4Gp0FAdsiCveqUlVOGXyuhE3eQgcwgsjwFyL7K75xswzr5PMokQZAZ2yjlYtcYpMRXoor5oTaraKRdModAM1YO09yDcikLOcMixQd+0nhwWaX8MNQjiK9KpGMIWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJiuXMMscL2qAt2KmefTcdcHnstFqJ03M2qXGArT7Uk=;
 b=xz91eQa7gOiTJYzOGJFijv/ql9dpNwbx8x/m3+yjvqCgodiR7RXSdCucr5VvRFjYgfsPlbyIxavsJg5iqFC+XYOWMPPjIhtykL9FBIt5N8ODXF4KJCvlkcGma9MWcGTp9kP1W+iCMnuhMbGnnnCJ/ZRTxv/TgZsvZG2MxqMJjJIBfUodQtixN5WQHhEYhrCvT2n5bCC62O0/QVTfBNdYMKRyuLonuoIO1xcgVLpIwUrj0cnzWGo4jZMUW0j7CTDzy8KmelVqhxtBq3YVAUsGvYTjwGqH8789Ro+pJePlkkfXguimn9y4Ugb1GqsIbjgN6uA5asN22c9ytmIvVbcpyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJiuXMMscL2qAt2KmefTcdcHnstFqJ03M2qXGArT7Uk=;
 b=cCu47ZrGQUzGxAG1/3IGWffmwyezpA2oeyN0z8NH8fuXRjs1FGDY6AvfilOUrSAhk883fPU3yq4n/AhVG1rPo+RLj0aO2Pt3HUTorFtCx4OEMevyaQm4r0l1q6pH8QVjBk6J8rlF6pm5h2lJygLpdZYJ8K72X4S+rdVeqOmXVP4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH for-4.22 1/5] tools/bitops: adjust bitmap_or() interface to match hypervisor
Date: Mon,  1 Jun 2026 17:43:28 +0200
Message-ID: <20260601154332.30797-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260601154332.30797-1-roger.pau@citrix.com>
References: <20260601154332.30797-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:408:e6::15) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BN8PR03MB5027:EE_
X-MS-Office365-Filtering-Correlation-Id: c3bfa199-a53a-466c-2a32-08debff49a85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099006|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ToBt4iOHUwmb0ZgkGkSwD792SmSbfhjzVa93/4CeqOIJ60nJikebeC5QA5MBhT9ydM3ouNvn9HYY3h8h15VcSEUnqloPfCBq8bMg3iDZvXOr60lh1OOSQHXWnqUsaQb5ZY4vXDX2/eBvB5L1/lKF4r9b4rdr/4ulGjiY+L7WA9kYGQlODmwqF++sVE4waF/bRDP+zanPT2IcV4GAEhYKmpDqRZvuiMgjhVz0Fxid6g3W+kBEfQ6AZ4P6a4Pl9LNbTi5cK8h2wF7y0rR3X2kGP0AyIe1ew7/GjRIHQH2xVYxPb4CIpme21I0OFhCAy6bUROWN2M37iDMi1bwbdQYCTL992RNa8vOL/ETg2PTyWuntovtzTznnL+rj9BGWq4R2DIpXyRh8xJ99um6qX/HAfZodKjJjfy7gFIRi6U3tTj4oSP3lbNuAovmcvGNAOkbJUs5orchm67q3K30Ya5YxLq/QSHHJ53aLFdr4gS9g5rGa/2jHxFXQCFAdfAffbXOpq+lvQzrR7pX+10Pu8FBS3kYXXm40vg3udi698HF1ucx+Dm3mwEzHorWXbwm9X0CP9F95EP2Ivi63dkBiqpGffozA3I/2Wy6imIZslv8wqORAq7zdBYKbSP2B0cesRiQhSLorHqyFPUbp3/p+AsEGvA9NNvZyjXRn/WX/GCbx+yyfq/Z5zfe6Qbt/73QByPF0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmpTK3NkVkdVY3NxWG12ZG01Qlp4M0tIZFl3TXliOW00M3VaV20xUW10eE1a?=
 =?utf-8?B?ZUhqdGhsWWlYbU80aHM3Tk1rOWJBSWRZREtaVzhtZWpSd2hjYUN1RFNDN1R6?=
 =?utf-8?B?SFJoSXJVZTBpZEhIYlZ0WW9aSUxkdkhVcjJHOThDSXMwUnhWVU1HZUIvN1JU?=
 =?utf-8?B?UU1HTmhaS05McC9kTHFSOWN3YjIwK3RQcTNvR3dxWFJjYi8ydU9FWEptQ2xB?=
 =?utf-8?B?YmkrUWN0alduNW5ILzZ1aDJaMUVVU0NGZXlaYUx1eEIyTmVJTGJoZGlDaXNy?=
 =?utf-8?B?V3dMb3U0VzhDc1N6YXdYQlpUVVpjOXpGQUNGeFdFVnlpcDVoRm1vOHUrRWVY?=
 =?utf-8?B?WmRRZjB4RXFZTE4yNkJPcE82SUxuQ0tsWjBqSFZHOXM4QlNDVUxuZGlMb1ZV?=
 =?utf-8?B?RHZ4ZDVUcDAvRC9xL2gyTEFocDRKUTg3eGo1Y2VDQW52RUZEZmJGQlliWjVS?=
 =?utf-8?B?R2ZXdG4wcHRRZHJBeVhtUUErTTlISkdiK1RGaDRHRi9MYU9YT0N2L3YxWlNO?=
 =?utf-8?B?T2pwL1RBT2lTRC8vaHlSQnpZWlFuNWh4U1FPSHBpRG96RHhaVHluMWVVejNP?=
 =?utf-8?B?L3lUbU9PYXhRRU8weTRFUGR5L0xwUndrd2pHYVJXNWNRK0d2TzFOYU92elJ1?=
 =?utf-8?B?NmFibmkyajRvY05SeXBtQ01nems5OHdoT2VDR05HNDhINzhnRFU2eGU2dkow?=
 =?utf-8?B?NkhhNStaYUk3OEdJQXZEa20zVWJDR1RjNzJSdzdnWW1FcmdIL0Y4Q09odHVP?=
 =?utf-8?B?bzhaRlBVd2xsblU2bHVwYU53aVR0bHI1R2Q2ZGRhR0Fpc2g4aXU3eE5oeG01?=
 =?utf-8?B?ZkRacWRLYi9hRFI2UCt1RWxpLzh1RHAzRTlRZjBtbEhpcTFycEZzdy9LQnEv?=
 =?utf-8?B?MTZyQStRbE9RZ1VkQVRDbEJEUVp2WHYxS25qTzh0ejdqVXU2RDZWWHlRWTBM?=
 =?utf-8?B?aHBEcDFOSW5xODMvQ0ZyeSs1L0YxUjBQUXZYLzdXcmdUQXptTWhCZVBLNThn?=
 =?utf-8?B?WG9ZMHdDZjRLUXIwZWVJdncrNlU3VGVOdklNdDJ1WmJqcnQvYkdGNDN6TGZY?=
 =?utf-8?B?L1BpdWdMcTkyNzJ0QlVVUjBua2M4Y3lKbjB3QnFZbkZrbjhCRC8ra0ZkUlNF?=
 =?utf-8?B?L0EvcHc2N2xvUkRyLy90eDNQbDBsVEpRbk12YUM5MjF0S3p6VVdLN1ZlWnQv?=
 =?utf-8?B?WFRxRXBBbjYyZGtjMUdGTHpzbmREaHhHZ3ppRG5qL0dvRzJtNTVmc1FxVkNH?=
 =?utf-8?B?YWdaek1qUlhqdDM1Smh6WWkwMTJRbytBOGQ2TkdhdzlqSEY3SGswZkV2K016?=
 =?utf-8?B?RFoxb0hZb2JVL08ycWV6Nk5HQUdSQTM0QkZzV1lRNkg5NE0wcFVZelhhSDBm?=
 =?utf-8?B?cERudEE5bkU3c0RTb09ZaTdwbFVsWnZuQlhCQ0RWQ2xPR1R1RHZ3SjZJOEgy?=
 =?utf-8?B?Zll4cytiTnRybU5uT3l3bkFJSTJOZlpKaHFsVmhmMUFqdlNOSEF0bXlzNU5X?=
 =?utf-8?B?QTJMeFBpeVBDYW12bkFpZ3BMZE00b1JZUXRMUmRkbVVHSlJONEt1bHNYQUZq?=
 =?utf-8?B?YVZQcHJweGRtVVdOVzZEVkltaGdNdjJqUHJNMm1UWjdzOUZwVWtBbVhZcXVK?=
 =?utf-8?B?RW85a2NZdldyRzZKbVE2S1p6bDBHdFlhVXBVckc4Y1JxUENqYUpsMG5rOGRD?=
 =?utf-8?B?MUFRUzZOb2hCVXhaaFo4bGs3c1BDdGh5WnhDbCtlKzZTWUloeW12U2xUeWFj?=
 =?utf-8?B?amFXU1VKd0duanNEbjIrZk9VTDU2dUdoMGpHSUMrbE5VRUZnN0ppdndEdm1q?=
 =?utf-8?B?cUp1WTNVT2Q0M0Z2VHZWVXppNGxmRUhZdDBuV0FpMUV0UElsbGJPOWVVOU4r?=
 =?utf-8?B?MUxHN0dwKzJqUjVIZkpNQ2JiZVQ4Tkl2V2tLb2dtbDFRQ3B3Unh5ZWJwN0Zy?=
 =?utf-8?B?Q0pMYnpmSGttY2V6eXo5WS9MYXJ6SkFvMy9pRTRmRGY4QTlEQUEyb0pFRGpH?=
 =?utf-8?B?dGk2K1cxQ0RKR1JhTmhjZVppN0ZEeUNuWmdnbkdpb1ArSk9aN2RRVFQ2K3JZ?=
 =?utf-8?B?RUF5Q3ZqVzFiYnFEVWtQdmZkQlUvcEZKV09rS3U2aTF3SllWbzNoYm1sTGtQ?=
 =?utf-8?B?ZmM3bkV3L0dTSXo2SGt5dGdXNUI1N1RaVGNqVDFHUlRiYmpBbWlVM3daRWtN?=
 =?utf-8?B?OXEwZjNweUd5UTNvWUZuOU0xQUNZZW16TWV6US9LMXREWUFCNlJXd1p5REpr?=
 =?utf-8?B?MllCOHRFZTB1cXZZZENYaVB6Z2NqYTJ5WmxBQ1lWYk8zcXN6eGNySlpiNjlk?=
 =?utf-8?B?RHFnbWlqeWZ5SHoxZXNZeHZiYWhnWXUxcSt4VmZ1dWFWOFV4UWtFQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3bfa199-a53a-466c-2a32-08debff49a85
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 15:44:02.0329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mdyW8Ez4iA2WvKxjudPDZUFmhwyJ86JEJEnSevBbUhxfuYQwEjZq9T6XITaT3u0Kp5RImQjJh+oM0xhAeo5zGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5027
X-purgate-ID: tlsNG-33051d/1780328645-39171938-979D7DAF/0/0
X-purgate-type: clean
X-purgate-size: 1879
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,vates.tech,suse.com];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: EC862621F60
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Adjust the only toolstack caller to use the new interface.  No functional
change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I'm tempted to rewrite bitmap_or() to use unsigned long (just like the
hypervisor side), but that's outside the scope of this change.
---
 tools/include/xen-tools/bitops.h | 7 ++++---
 tools/libs/guest/xg_sr_save.c    | 3 ++-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/tools/include/xen-tools/bitops.h b/tools/include/xen-tools/bitops.h
index 3b98fba6d74c..29587e89fa6d 100644
--- a/tools/include/xen-tools/bitops.h
+++ b/tools/include/xen-tools/bitops.h
@@ -81,14 +81,15 @@ static inline int test_and_set_bit(unsigned long nr, void *addr)
     return oldbit;
 }
 
-static inline void bitmap_or(void *_dst, const void *_other,
+static inline void bitmap_or(void *_dst, const void *_src1, const void *_src2,
                              unsigned long nr_bits)
 {
     char *dst = _dst;
-    const char *other = _other;
+    const char *src1 = _src1, *src2 = _src2;
     unsigned long i;
+
     for ( i = 0; i < bitmap_size(nr_bits); ++i )
-        dst[i] |= other[i];
+        dst[i] = src1[i] | src2[i];
 }
 
 #endif  /* __XEN_TOOLS_BITOPS_H__ */
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 3b2c5222e429..fdbceab52e46 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -668,7 +668,8 @@ static int suspend_and_send_dirty(struct xc_sr_context *ctx)
     else
         xc_set_progress_prefix(xch, "Checkpointed save");
 
-    bitmap_or(dirty_bitmap, ctx->save.deferred_pages, ctx->save.p2m_size);
+    bitmap_or(dirty_bitmap, dirty_bitmap, ctx->save.deferred_pages,
+              ctx->save.p2m_size);
 
     if ( !ctx->save.live && ctx->stream_type == XC_STREAM_COLO )
     {
-- 
2.53.0


