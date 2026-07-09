Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id x9QINMZuT2p6ggIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 11:49:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7896D72F1F3
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 11:49:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=GJh3XSNs;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1357792.1612133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whlO1-0006xg-Ag; Thu, 09 Jul 2026 09:49:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357792.1612133; Thu, 09 Jul 2026 09:49:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whlO1-0006vH-7t; Thu, 09 Jul 2026 09:49:41 +0000
Received: by outflank-mailman (input) for mailman id 1357792;
 Thu, 09 Jul 2026 09:49:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <okamoto@valinux.co.jp>) id 1whlNz-0006vB-1t
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 09:49:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whlNy-00BATA-EQ
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 11:49:38 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <okamoto@valinux.co.jp>)
 id 6a4f6eae-e002-0a2a0a5209dd-0a2a4506ecda-4
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 11:49:37 +0200
Received: from [52.101.229.73]
 (helo=TY3P286CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <okamoto@valinux.co.jp>)
 id 6a4f6eae-08de-0a2a45060019-3465e549b3ee-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 11:49:37 +0200
Received: from TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:af::12)
 by TYRP286MB4764.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:13b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 09:49:32 +0000
Received: from TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2067:ff0e:4c3:ad0b]) by TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2067:ff0e:4c3:ad0b%4]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 09:49:32 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZoW+4mrDxQKh95o+Cch9PEpKAiSx1PIAJH2NsLJ7qe84aM7UKc/RzlDXjnL89xdk7jNvphuoYDg5UdltvW7oSDCP2+wGjKbczXi9YeDy6Ege0nuBcfe18AJFMdGvkKPuiAxtL0ZlaDnhyMLefbyiXWx0aKY1tACOBZRQ7aP+bvaL2AfN7TfzAco7ImJxy6mgjgNCh7XRo1AbJ4NDRqanhdYqaFOhlaT+Z0h2T4hev2VCtaN1W11oS7EMbmpBHGXEsDmoqsvJGOSYptYvSbx8UOJsf2hwjDC/Xh4ZIerWtzVVPwZhnPSiBemBIs/7YAb/G/2XnlgJ/sOuZKzUZmwB4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WfHpm/xMcKiRJ+XCrXUwOvBOFTyFO5wHl8rigNAPLEM=;
 b=w28zlcLNFOYOcSZ15w3/f+HzZQa0zOQeuwdJL2yuSAQa7AnAwVPiBqB+Fh9N3iJ1ijx42fMAecMWB38PEDBkKTkh9fznDYiFEJJt1ybqb/fyC6wkiuniLDlE1zGuSF1PKQHtIh/ViPHm+FxUAvipsRnNjPughj6M3E0GESPE10greIhoxozY/qxN3u270C0r584zCfaNe9u8yONTYFT/8mxLl1pjIpdI1uDU+ivRq2mQ6Q60cbARDGY1m9Ve5bEpUfFK/UMnfHR+OZbDsvbwKkABNSplhM7m97TmEpnrXOse2csqN1crH2b6KgbFTVTuI4aAYtRrzUeq5hfTxvyY8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WfHpm/xMcKiRJ+XCrXUwOvBOFTyFO5wHl8rigNAPLEM=;
 b=GJh3XSNsXDAcgnZpsEMQAoLUCFxNdZANgeEg3uN3/3oz79Bn2N1svbliq67vMEwlWE69pL9jCOZ1LWyP9XqyLzsqtpziBT23P0rGtlrSLEPCIrcAlT2bnh+wmZADSWZQTY2kjPh70kdem83N11lJ2BS5EAcCFd03wxJoO2FltTA=
From: Ryoji Okamoto <okamoto@valinux.co.jp>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/1] update struct member
Date: Thu,  9 Jul 2026 18:49:31 +0900
Message-ID: <20260709094931.291156-1-okamoto@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <f3404b9c-df8b-4f97-a2cb-50e3402d781c@suse.com>
References: <f3404b9c-df8b-4f97-a2cb-50e3402d781c@suse.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0009.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::7) To TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:af::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB1053:EE_|TYRP286MB4764:EE_
X-MS-Office365-Filtering-Correlation-Id: e31a4dc8-4002-4427-8430-08dedd9f60a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|366016|376014|1800799024|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Fp9/yLyuUxCNay3vZjDTmb5p584s9AXVPRjVEcmtiVcdoqMaJ1rCffsxE0Pm2VNMg+Qa5BGxPBfC+NpEbUmONBx5L6GleG4nv/GYZCFcjV1wCrVhMQo+K+CpSCsFIH63Z1UDRtpjRkrp3BUD5XUoXfcxZhbeXOhMiNJqdWnahjyqP2JdqJ4CqDXDsqVRKyUMaBu0FkxZMTlO6WUSMRoxNgz8kby726aqpZgLESwah6VgGfC/G8S9rLgEAnGrQCBAvA2uE5OZxMnFvoR/WaA5iX4n66NDSJLaBuHMyemLYWvqxHEinkSo2lzHWNQhH+cpAVVP6YBKRqtqcTT1WilRwRF4eJAZdBY19kvy5K1IfVyiivVegTTteEEnvGy9TUyEs+VcKfWi2h55X/ig+pweXu5UWYPDAOLePFopK5JLAUPF/oBitfsy0n1Vr2WVHlzwfGoA1pf6uxaCBCGKXIqWW7K/l1wpoMtwHZYWARuTdhXS5T7rdcFUe+pIozR2Dqs3eKfno9OJTqXDJ33Z4JlvxKu4J/UZTWcSImQi3Zmn6I1U5vqPn5UUdi/qTJvm2MafrC4CO3SGMtz2kM+TUs/foHtRALn8OaP8W1bAoriIAOm2JpGW7W7Wtoh/eFjjV85s2sPCfAWvOBGVrSC18Oa9/HN1B3zTQ9gOUtyQtKg8vAw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t4P7j16sAoeEQYezuw5bFASeb8BspvUIWdf5wsaDfXp6nbFRuNsGatZMQA6U?=
 =?us-ascii?Q?0Sq4pNdkxdoIAXFZffjL6He289Htp1UTJZCbTLLOJFsmWb+bFhy3Px/MLChp?=
 =?us-ascii?Q?tmKXeutfHQbRrgl5cshImClDNyNu/fEfUkPTx2FTMa7Q1YZRnoRum+CKoYps?=
 =?us-ascii?Q?5V+NuVRoR4XgqryAfopdqfQNWTNYVjWLPsA2xEQ6WO3uTag6O3ZL8kZhjplS?=
 =?us-ascii?Q?MFCjAOf3+A0bxdc6gyHMRgJAcYcSaP+i3hMWbTBVGAdvcz1affd+fiQBPK24?=
 =?us-ascii?Q?keiquiACa/YUXkYhNRVyKv78eBqtqEU8w+GNPd0ZcYPXPKMMgRqeE6MMayGm?=
 =?us-ascii?Q?TFsD9wkp/w6lyzPpwAxtJAp79rtiYC3zA6PEDEAYMTFKvvbopG9UsWyd9p8o?=
 =?us-ascii?Q?m2v2/STHeSD3z3wIsq2bR6q132xTTl+CcvwDHDHxnsI6BnT1PTKc+IHtVNvw?=
 =?us-ascii?Q?ZYSrMn9NbOKX9y0pCvjZJANZOzAji5sSpQvi3PoaFC+tGsUUpqUaqxn8YWPV?=
 =?us-ascii?Q?yTywrotRRhuV47KpIu2wH6Ym+OxFc1WxQwg02GPQb1mgjnVE24rjDkDrwtVn?=
 =?us-ascii?Q?Wg0MKE+IUPXphqFwqlK62g7VuFk7cWAViDCYCCyDRX+M4FDekW6JPMxlxVKX?=
 =?us-ascii?Q?3OJdEzhsDN5wzCLxoDNTdgiKpAIumaBNGfEmAPjSDOA3Spf/r2t3jDUij85C?=
 =?us-ascii?Q?PxXLtBx3zaNklPVehQxupwz8wBNGkWp/mK5jzfg5Fv0zwzRB9twJMnEfmLmP?=
 =?us-ascii?Q?TPgSFKArj72Egxle7U90G2EoOzlwQGKDfhmfXWdz0SQAGNKV6aSV913QWqgi?=
 =?us-ascii?Q?uFBckZAJKVyYlNEnzDc5DonHrrcPgs0FokG3xhhuLwAtp0sSx//OEwgbntnf?=
 =?us-ascii?Q?AEJHCO4Ll7MESASJ6Aebl53fdaDavvsAxgg0iy1JK32M1tdNohnVxmENgjYr?=
 =?us-ascii?Q?a7WesaFk1pIQQ/E7tINbfyY5n4p3aGR9aWmO3e8ochbTnpAWvXBGtX2Qhu4F?=
 =?us-ascii?Q?Rzeajn1NqO+qOp7JlJIiETGF1NWvFBEfxGt2sGVe25kBFNGfdx7hozeQQLPH?=
 =?us-ascii?Q?9TMUa09LfTDRtbSP1T1lKPymhVTahi1nMaI7UwsL+g3iIZvwymbI4Hnn68pL?=
 =?us-ascii?Q?DXaWb3A10nIV2UEqBFohoY8RBHj9jZxRDTphaCi/BRI94kOhBgy/ov/7Ax67?=
 =?us-ascii?Q?v81LmWjt7D8ePFssgB1HlA8KRyLpiUp/LW79Lv3jO89muS1basVv+6vyYR3r?=
 =?us-ascii?Q?JKTgyRl27vtsZkYA2DzhL68QiaUmWdmIoj96wYLw+PwSCHHRO5/gYe38pPgF?=
 =?us-ascii?Q?m2We0WJEOCQ1kt7PEhHSCE8vnURyyW1vzZMJT00/xF+sazIJSjLhYuVf9Oaj?=
 =?us-ascii?Q?399kc9NkQnI0EYEnaG+ZKJuWhAbrq3Blwv6udscym/14/AIL3DHsvHAB1zey?=
 =?us-ascii?Q?mDwVVhXUyOmHw1tJPfZgMPPyyJs6o9AtozsUkeIvaqBfElasYD5ePTwUgeeO?=
 =?us-ascii?Q?1a38v+L+mflC+Dqnr8fOkzwD5wGfUw8mG8ozbgPmgzTNgZb1yBl30c3ullOY?=
 =?us-ascii?Q?O9sdLSXuzXxGS+poGqy2kYztVbeFoPMAj8213InsoAKe6g0zQcTWubNfTf27?=
 =?us-ascii?Q?HIHr1gzR0EZtHRxkdi+TXVcSxPtd+R7Q058c82w5EMg583FUACduP8oYcRhF?=
 =?us-ascii?Q?uM5hMZmxS9QJjcYF+WsvpQ8zYuhYvyTPgmqBRyY68iSx1S9SCwlKS1qfwagC?=
 =?us-ascii?Q?DGWRIZ9c4C+vfTmoR8x+ZCZZayTY6cGZ0GMDCROML4flQ9G7fFrpAB4Opu7x?=
X-MS-Exchange-AntiSpam-MessageData-1: 1FtJkN1MrpeT2Q==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: e31a4dc8-4002-4427-8430-08dedd9f60a3
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 09:49:32.5364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lO3YRiYUp1RGPPbFfCDP9qUa3j/ayWwDh/J7225K717NfyLTUV628GxXTeQdel/F2jo0FNUcDb4KXraaM08WDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB4764
X-purgate-ID: tlsNG-16d1c6/1783590577-F85E768D-7C21691D/0/0
X-purgate-type: clean
X-purgate-size: 292
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[okamoto@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[okamoto@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7896D72F1F3

Thank you for the review.

Actually, I accidentally sent this to the list while doing a local test sending to myself. I'm sorry for the confusion and noise.

I will resend it properly later after add printing the priority in xenalyze. Please ignore this thread for now.

Thanks again!

