Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2OseIlobRWpv7AoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 15:51:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9E36EE5B3
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 15:51:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=AF+eaWzJ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1349980.1607566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wevLJ-0006nc-UT; Wed, 01 Jul 2026 13:51:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349980.1607566; Wed, 01 Jul 2026 13:51:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wevLJ-0006mE-Ri; Wed, 01 Jul 2026 13:51:09 +0000
Received: by outflank-mailman (input) for mailman id 1349980;
 Wed, 01 Jul 2026 13:51:08 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wevLI-0006m8-F1
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 13:51:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wevLH-008vKN-K2
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 15:51:07 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a451b47-5cb7-0a2a0a5109dd-0a2a450ba0ae-24
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 15:51:07 +0200
Received: from [52.101.57.61]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a451b49-ac48-0a2a450b0019-3465393d69cf-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 15:51:07 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA1PR03MB8120.namprd03.prod.outlook.com (2603:10b6:806:45a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 13:51:03 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 13:51:03 +0000
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
 b=oR7vbjoLDE55bkscEN2SWhuDBR6tLMevZYgh2NVYlPh/e05AG+OcR+HCjEPc22IS9cDgpVxAOGTrlJwGSi6g9kDPWYoNKDpMVwX1PB0KQzV/e0Dk/xrRZtnhLsAiJauf1wXh3VdFxx9gQ+CfQ5PYOkOkMaadPaN49WRXeMRVLIT741NPCiE/kxME9JpXZiyf+MnzxlRm2xEeX7qDdqz50/8PHYksHQ+dhiCZncroasyugzjY60azbaJGvlMWB0gC/ctvyjqe0iWRPjEaxPbMNaeglaB2bwRL2JYeBmIGj8TKixFmoriGjaZqDn+wWyWq/Bjlg2IMuHn1TCp3DV1okw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DeFYD1itcvvrOkUoVVS10szFH4+dabBDBCG+OcqW+/I=;
 b=SqRBDmh5mr2NQ/KITe0aDb5ufrFkh7qEPWOOIMJlF69jp8E+/Olvd73ZvNeWHYM3Mg1F/aH1Obc0S3oxgpiuQW85OiJb7MjyNHk1XiJCUT/AdjLqjbuG3uZvowQJAOEq3KH2mlCWPGv9AXUFp4lp5K0hdQJOW86F+hpZH+GSZrJz3gvmekcHHFr9/I/0QK2g9Cx5TUpa5wOJ59WzraJT4KnQMiwvWx2mD6aAakypk4NSLn5EYxyG9AaRTw3F8S2ENj5MoWJTjLn8Sn/0wyrzkSEwGbJHH4d09PbjTr65q/Ca2yL3axs3LxNk41RGA7yom96kzhds/an4VmjScGczBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DeFYD1itcvvrOkUoVVS10szFH4+dabBDBCG+OcqW+/I=;
 b=AF+eaWzJQ6aXozJd6G21R0z7I0O3JfO6FZJKV8EolNlvF1OE5mWlFSsfgks0UU0wW5Unat3iaQ0VKoUmvoAxku4b/56if15kEfwa7DXc/cA5EPWxBFy1HBnHCdXcLmyLVNSEx33Z+P/z1pSzoN3En1f8aig9GrtpohMiGOKneZA=
Date: Wed, 1 Jul 2026 15:50:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ryo Takakura <takakura@valinux.co.jp>
Cc: andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org,
	ross.lagerwall@citrix.com, sstabellini@kernel.org, julien@xen.org,
	bertrand.marquis@arm.com, michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com, anthony.perard@vates.tech,
	jbeulich@suse.com, taka@valinux.co.jp, den@valinux.co.jp
Subject: Re: [RFC] xen/arm64: livepatch: enable attaching callbacks
Message-ID: <akUbQyNy-Rj1oOkJ@macbook.local>
References: <akOCgoqbGhZbjcQx@macbook.local>
 <20260701090908.15204-1-takakura@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260701090908.15204-1-takakura@valinux.co.jp>
X-ClientProxiedBy: MR1P264CA0144.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::8) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA1PR03MB8120:EE_
X-MS-Office365-Filtering-Correlation-Id: 34c2f12c-37fa-4587-9dc6-08ded777ca77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|22082099003|18002099003|6133799003|3023799007|5023799004|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	w+tTTEZZHxxx6RNU7TZCCWefMOlamR2//8fFurf7bKsgq976e064Gd9QHzpDv0bddFp0yJztDNfRDmGGf0G7qzTDbnD0BxJB3NZy9A7KW76fNwtSRLVqydZXhemDyDOxppFXSeL7D3itUHWfa9xd+cLMxgtHCl6r1EHJlM05XynAN4v6mL+hPLryx7z1xbPyyEj0dTFwCQ2SR5Q8LYU9/ReWvC1sNxdixCeIG+zW4Z8zvmKQbxXqGQxFqTK0ki6ycEqyRfIKLLgtKUwd1oX/sZvkfrhrlCCPf6ZmdgOilMNUkGTZjJbabu/DCNuFKcDVzYsjIJ9Vtm74tODKTb5Dmdt5QOjAh3OeMszNxOAjh7vXByFuVNzC8rZIUMVKKLQrrm3wHDncKb6aPlfBv2siWVs97DTUW8i1BHNoa4J55tbIyy4cuQ78FzV7LLC+PEH246KOjDn9TSHzRjNFlbnNOYLc0BiCE1kDZ+gyPr0GpXyoe2NaACUIzBSqNfasRK8CqWYM1A/hrYxyyR+XQSdpnfcPaVAqIfgDrhh81C4oM7jbZPFgefGpbm1ZhJX13TgeuQnuBWqf0fYT2pjbAHDMiMF/nRDYiAoXBhPbWAKgHeE/gJcgRy5uTDrVrLPd/t9PG7tI9F754dfE3cRxvIw/M3fejS4aCiQAvixzF4S5Qjk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(22082099003)(18002099003)(6133799003)(3023799007)(5023799004)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dG8vMEpweHpVQXd3UVNoaXVFZ3Btbjh2SURWSWMrSjRaekU2Y2diOWhTWDVU?=
 =?utf-8?B?dDM0T2JsZm1yUmNOV0E2eUhlaWNjSThNaGYyeFJCb2lINTFHTVRuQnZmcEVO?=
 =?utf-8?B?N3RQMkpFYnNNRG1hejJVNWdGeS9pWEZvSjF1Y0l1K3ZvNWdhY0VGb3hGWTdL?=
 =?utf-8?B?RzRLaU9BNDhYV0hrclhVamtsellBTURzREd1bDUxODkydEtydEc1T0VHRjZ1?=
 =?utf-8?B?V0lzbXpNS3lYb3UvQnh4cFp3aUswZTBMSFlhRFhSWitYOGlGWGd5Um1obUdK?=
 =?utf-8?B?VzJLdDkrejZ4bmlybVkvTitBWXY5dFR4SEZOdmV6WHNCd0NtNjMwTk9weElD?=
 =?utf-8?B?UFYxSExpUUU3Y0twUVpZSFJiMGNHd2dnREROMG4raStEUWxsMGdZVmEybzVH?=
 =?utf-8?B?T2Q0VTRzVHpiWlQ3UTRIV0FSYk4rMGpIbmtPdEYvemtubkRLREwvaktIL2VB?=
 =?utf-8?B?cUQ0bUdFdjhiZ0Z4bWt1TmpFbzA5d1FLZ1c5VzByZktaQXJlSUgrMUM5UFg2?=
 =?utf-8?B?K1lhdjdYRVFKUCs3Z2JkSkRRYjVEVGM0bUZaQnREV0oydXprb3VRT1Fleitx?=
 =?utf-8?B?UWw2RldneUtOVmJwWmpQTVljbnZIdmJVUFN6VzROWjJ5MDRRVWtsb0VWaW1G?=
 =?utf-8?B?N05zU0VOK0JCQ0g2angwaVpyVXd1UG1HaSt6ZVdNd250TkUxR3JrVmRWcE5v?=
 =?utf-8?B?SFl2SXdrc3MwdzFiMDBkeG9kU1F1WXBCWWZ3aDc5LzJ6dXFPWTYyYjhvTDRC?=
 =?utf-8?B?R0ZSek84MzQyeHV3WGc0S3hsYzNQY0hTeEtrc2JibjFhc3c1dzVDUWk2cVNo?=
 =?utf-8?B?YytuL1pKV3pRdjBPc0pTeExPdU5OUnRmakZFRnlPdmI3V0lVNFZSRzZCVDFh?=
 =?utf-8?B?V3phTTYyOGNMWHhJMjFFK09KdEgwdFRjUEJhbjBZSXlXQUhKMkp4SXZHNXhn?=
 =?utf-8?B?bnkyVGlwSkh5WXI2MVU3YlBIbmVURFhLakp1d2JNK1c1b1ZSQmp2N01LN0RO?=
 =?utf-8?B?aHFKcUxpc01hTmUxNjlpdGl1VWdQMmFZZVc4TElqUzdSTmJkcFE2WTRqQys2?=
 =?utf-8?B?UnFRc1ZmRzdCeEVZSjFBWDczVTNHUDVROWpDWFNTdDdnVWNpWlNOUzQxOGM1?=
 =?utf-8?B?czcvbXlGcklTbjN2YXZWaTlza2lndDM0NDJjeWd1d2IyeG95Tkc1Z3o0SytR?=
 =?utf-8?B?Q2VoUUw2NEpaWm52cWc4NlV4bEsrOUNQNjkybkNRZVovalFBS2VDQ1JESXE5?=
 =?utf-8?B?TC9BZGs4enUwaWhpdW1lS24zM0RiNzhjRjF3c3FnUFU1VkEzZk5vbnQwa2cw?=
 =?utf-8?B?bVNCNFcvZzRNaXdFa0E5NW1XQ0krVTlaVXNKRlQwOUVHWFJMVmlWaU9wSHJm?=
 =?utf-8?B?VHhPdzJ2Rm9NdHZYTjA0U1hBd1Y4U2tSS0lDUVJyTHgvMW1vZFZGQ1h5Rjl3?=
 =?utf-8?B?a1J2N2RBWjJ3V3VCVEo0OVE5U0dZa0hqb0JycldwV21UTHlKS3B1V1RVcXJo?=
 =?utf-8?B?U1FEZzFiWDc4WWQxaGdBUWxmUmE3ZHNLeGd3MXJlL2hNZSswU1pOM1pNdk1J?=
 =?utf-8?B?L2I0VDhRZExLeTFSTXU3NmNUMXJYQ1puTWQyd0FmVExDbmIweTJra1lORC9a?=
 =?utf-8?B?QjVKMnRIWHhLK2NKdEVIbkZCZVM4bllYeEd4QzJ2emNGU0pxcXBnSUMxcUxz?=
 =?utf-8?B?cTRUK0E5ZGdlMS9hWlpKbU9ZY3lqKy93WTVaSDRwN2w0WndxNU1JRTFwNkVr?=
 =?utf-8?B?dVREZ0VHZ0YwVnM3eUhaeGJTRTl2RjQ4SmVXQXhmamgvMnVnek9Sb1VBdGdZ?=
 =?utf-8?B?ellzNDk4TlFvcllOS1Jma0g5YSsvcU9ZMmNTSWRYOGYyNzhpdTkzR0NXNmg5?=
 =?utf-8?B?SlZFdDVCeGdUdUZ2SUw5NitzYTZPa0pwVWFFcmp4TWxGcW14cXdZUjQ2UDB2?=
 =?utf-8?B?QStvbzYxSVhrZ1pOcHoxeElqRjFVTjBmdnBpc1JMSFpzMlVnSVpXTFRkRGRm?=
 =?utf-8?B?dTB6d3V0K1RPQ1NMZC9xSWZmVldxbzBJWk4wc1NIOTUxRDhyL290WjdLelpX?=
 =?utf-8?B?bmpiTEZaZ1p3d084OHNsZFVWdU5ySWhIZWhjUWVIdHVRamlJVTlYK21UNUNi?=
 =?utf-8?B?aW1paWtBR2RkaldLZjQ5elo0VWVCWkx0ZzhmZDBUSFlxTHFLalB2ZTlGdCtQ?=
 =?utf-8?B?L2xmREttK3JSWk9HWTVibjcxOWdENzdBSDRBdkFuZU02eHBKMytSU29UczN6?=
 =?utf-8?B?bUd2ZVVnRDZkVFlQZkNNaktqRXlPaS8yeEJ1L24rT1RLSFhpeHNXQ21tSjFo?=
 =?utf-8?B?UmI2ZG9uV09yYzR2TXM4VUFDZFZlNmdCTzRJMGltaWJuQ2FyOTlSZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34c2f12c-37fa-4587-9dc6-08ded777ca77
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 13:51:03.2481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ddo1rZeHbuFoxkclOtiRDvj6jo3JPk6CCHWgifMc7dnzZUSuE3FpsuCQkl12F/iFB5BH9mhEMMIxBfLZHzaysA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB8120
X-purgate-ID: tlsNG-42698a/1782913867-A7F36220-668E85D5/0/0
X-purgate-type: clean
X-purgate-size: 3118
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:takakura@valinux.co.jp,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:taka@valinux.co.jp,m:den@valinux.co.jp,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DE9E36EE5B3

On Wed, Jul 01, 2026 at 06:09:08PM +0900, Ryo Takakura wrote:
> Hi Roger and Andrew,
> 
> On Tue, 30 Jun 2026 08:47:14 +0000, Roger Pau Monné wrote:
> >On Mon, Jun 29, 2026 at 11:01:28AM +0900, Ryo Takakura wrote:
> >> Linux ftrace allows registering callbacks which is useful
> >> for debugging and tracing events. On Linux, it is done by
> >> reserving function entry points at compile time which can
> >> later be patched to branch to a trampoline.
> >> 
> >> This patch implements similar callback feature, but with
> >> different approach using existing livepatch infrastructure.
> >> Instead of reserving function entry points at compile time,
> >> the traced function will be livepatched so that it branches
> >> to the trampoline.
> >
> >While this is an interesting usage of the livepatch logic in new ways,
> >may I ask why not do as Linux and add an empty function preamble that
> >can be replaced at run-time with calls to hooks?
> >
> >You could still re-use most of the livepatch logic for handling the
> >addition of the hook calls, but it would be nicer in that we won't
> >need to move the original function.
> 
> I agree that we can reuse a lot of livepatch logic.
> 
> >> The role of the trampoline(illustrated below) is to preserve
> >> the context while jumping to the tracer function, and return
> >> back to the traced function with its context restored.
> >
> >Alternatively - why not use livepatch-build-tools against a build with
> >the added hooks to generate a proper livepatch?  This looks a bit
> >fragile to me (see the question from Andrew about fixing up
> >instruction pointer relative references).
> 
> Yes, I think proper livepatching would still be preferred
> given all the concerns Andrew and Roger raised.
> 
> >On x86 at least we would also need to adjust the bug frames and
> >exception table contents, and the contents of the symbol table to
> >account for the function being moved.
> >
> >IOW: it looks like overall this is a lot more work than possibly
> >reserving a function preamble to add hook calls?
> 
> Yes, I agree.
> (I wasn't aware of this additional work when I replied
> to Andrew yesterday, thanks!)
> 
> And if I were to summarize the discussion so far, assuming we
> still want to add a tracing-feature, I think we are in agreement
> adding an empty function preamble like Linux.
> (I personally would still like to see a framework on Xen
> that is more convenient and tracing-friendly which can be used
> reliably at the same time)
> 
> If this sounds reasonable, I will try preparing one based on
> the feedbacks I was given so far:
> - Use of Linux-like reserved function preamble
> - Use of __attribute__((no_caller_saved_registers))
> - Split replacement and preamble-hook handling in common code
> 
> Let me know your thoughts!

I think the above approach is easier to implement, and more reliable
than the current proposal.

Do you also have the intention to integrate this with existing tracing
tools used by Linux or other OSes?  That would be very useful IMO.

Thanks, Roger.

