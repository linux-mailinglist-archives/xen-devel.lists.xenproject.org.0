Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLokEjTDjGkmswAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 18:58:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3E5126C0C
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 18:58:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228181.1534519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqETM-0002Cw-E4; Wed, 11 Feb 2026 17:57:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228181.1534519; Wed, 11 Feb 2026 17:57:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqETM-00029s-Az; Wed, 11 Feb 2026 17:57:56 +0000
Received: by outflank-mailman (input) for mailman id 1228181;
 Wed, 11 Feb 2026 17:57:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gWxp=AP=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vqETK-00026u-Kn
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 17:57:54 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d713005-0773-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Feb 2026 18:57:50 +0100 (CET)
Received: from CH5P223CA0022.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::12)
 by LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Wed, 11 Feb
 2026 17:57:43 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:610:1f3:cafe::3c) by CH5P223CA0022.outlook.office365.com
 (2603:10b6:610:1f3::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Wed,
 11 Feb 2026 17:57:40 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Wed, 11 Feb 2026 17:57:43 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 11 Feb
 2026 11:57:41 -0600
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
X-Inumbo-ID: 2d713005-0773-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h291TU6/vOtrQC/eoLHSFaSpY7CLIxhx8IkG+ot7f4nZyrLgs62N0h56zMjvLDiwEVGleSI8NSNXu/xhNMtO4/hGM8zVujEnajCmwjM0DLadUTBbW9uYTOo7KYUmIuBOElX7y5LDbWHsgNPIfC8+q8gmqGFcqupPqvDOzk4aOyRsiGV6CwZ6B47OxpnE4LRLPycbJEBx2XsAqVHvpzv5IDChYFIqjKZhz/X0ogL69XAyNstZSgzVrxdA+Sz4RA656g720cVYpRJfuxuKh7V0tVqoxSUOuIP1EiqOAQdyIrU2ovG84vn5g0FlUZ3yEOofoTT80rIPliklCVawZ1C2Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nWihIsOMir/QyGHelVxwovWm2/FXSR3+lVaRuDFLVjY=;
 b=jp+jujHeLRa4Yvrc3oNNotGNacWdVI3cBe6BiYS58NoaqRS+YvzuiYOTfmjcHqQ+NEJm94fNx7pXBsIOBSHhvbazdRQrffYky6xAc/9+kFsrWBbXczL+06Nvoev1dEjAIzUaY7jWiKySPDSSETH4H0ZAVOFzGYheNngLdU60LlbM5TAbkpNPPUh3Qykf+L8ZjbdzIHjgaG5Us+b8HK89fhzdhyM3+uZHDqK1SMRRmxjBL3vMqzWA6v0pNaRCUx4IpEgM5WlW9955HMp8wfwiZe3SYQFYVym5qoiutpm9M2ry2Xclz8YBWwqfyh6FuVJIL4M6uA7mM+asF/QTaKgmKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nWihIsOMir/QyGHelVxwovWm2/FXSR3+lVaRuDFLVjY=;
 b=CKs4AzOwKObOuKWNSb3BDOBWRlW1cIs8DjaN1XFC/gSMadyZYwUdIJKpo7x473nQLe5QI9OMu9W/eJpiwLLpxC9+QLDDd+VmSfc6Mk2R2b4XoO4t8485/A06eNZZM7IEQA0jkv6pxTBLmZtIGHj4ZgQXkEgIlCqjd2wmXDlx33Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 11 Feb 2026 18:57:40 +0100
Message-ID: <DGCBSDMNRRR6.79ZDO4FVP8D0@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, <xen-devel@lists.xenproject.org>, Xen-devel
	<xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH 03/12] x86: Add cpu_vendor() as a wrapper for the host's
 CPU vendor
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
 <20260206161539.209922-4-alejandro.garciavallejo@amd.com>
 <7eeb369d-04a9-4c17-983c-078e45b4679d@suse.com>
 <DGCBB98OUVTU.1771D50B4INHI@amd.com>
In-Reply-To: <DGCBB98OUVTU.1771D50B4INHI@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|LV2PR12MB5966:EE_
X-MS-Office365-Filtering-Correlation-Id: 19519af5-ec61-46f8-25bf-08de69970e27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T1Aybk82bGxOeEZJZlBaSitNeWhJTUdYOFFMWjBHTDFYUno3SnJZMXl5ZFVR?=
 =?utf-8?B?bWwzcnQyUFNDVCtKdGNsOVEzT25wWWRtUmVxVmNSZTdqVnJQVm84WXR3T2lt?=
 =?utf-8?B?ZW9hWEROanpaVFlLV2VBNEFRTnFLWFM1Y1c4aGFtdVhnYUFTYVVud1FEUEFn?=
 =?utf-8?B?TnNYNWxoeWxTeXorK2dSODYwaXBWdndoeHNoYmtZUlZqbWZTdlBGOGlITkEy?=
 =?utf-8?B?eTd6ZGtSbkM4QVFRd1BHN0Q3Wm03ckZBMUw4b1k3alV2bUNYS0R5Zlc2ZDZK?=
 =?utf-8?B?NW90UEVFdmFuWEFNRFIzMGs1WCtPcDlKeVRzdDdiSFdkMkhZaERDelVNUTF6?=
 =?utf-8?B?U1d1TGNmcVRXN1psSmVYV3pHTkljSW1oUHVNRmRmUkgrai84ZGh4MGpMWGc1?=
 =?utf-8?B?QW95cDMxWi9Nck1PTlZVNXREZ2trYUtHYjlnaDVURW43Y3o3WFV3eWw4a0dR?=
 =?utf-8?B?aVArejZrTENzUlpkQkpDckgzZmxMS09PZkRYbHNNZXo4cVZBdFZvU0RDdzRl?=
 =?utf-8?B?elVseEhuK1VCb0tpUkc2UitDMjRMcURGOCt4dG5CeXQ4TFlCbUpkRm5DZWhr?=
 =?utf-8?B?STZVWnZ6STZ4dkdXN0FSR1ArczZiRjQ0cUpkM04wUFNrc1lsQURtOXpZdUhG?=
 =?utf-8?B?K1dtclMvQktEeERQK2Q5NTNObGtRbVl6S2tJY214R2djVmVZVlpWUE5zV0NT?=
 =?utf-8?B?TE84ZVJSUFNaL0FoZlVzWjJGb05yaFgyMWpnR2IyMFEvMG9HMkRzRnRDeDMw?=
 =?utf-8?B?MVR4a3BGS2h3Z0Q2SGlyV1dCeGVkRnZXUjlYT2xSc3pjT2JWZG1hVnMwcnV6?=
 =?utf-8?B?eDNjdktsbjdtWWczd05OamdiZGhrTkNPUGwzR2pYazRXOVJZeEIxOFZkeG5i?=
 =?utf-8?B?dGFLcDlkQ3FTdXg5aDFyT1BqcVVBc3ZIZFliYTVvMzROMEgvRzBhbEJmQWdu?=
 =?utf-8?B?T0tUSGdhQWprMXJzUEpxajlPSlNQU2k1L0VNWGN0RVQ0YituVEhIRzJjWkRi?=
 =?utf-8?B?eWpwaEZKa21JMHJuZnAwWm9MeTVpSUcvVmdUUHdkcEsvUDFSK2NKSVJySHJD?=
 =?utf-8?B?UjJFcDBpek9uM3NzbnhLc2VrclpiR2QrVEdvS3VwVUs3NXJWT21RUEhqTitX?=
 =?utf-8?B?WTlwVUNFcnY0bDJ3RExKSXNldDZ3U1JpM09HUUdCSGxnN2pkYUlpOWI5TTd1?=
 =?utf-8?B?c25XK1RIcEhBa1JOQW0ramhBcTB3M0JkbVA3RjVoR29hZVAwVGZSaW0zcGFa?=
 =?utf-8?B?NHdrTVhPQkR6UmhQOW1KNzV1OURtbURWZ29mN1JyWEZGNnZlSWRPTzFNaUNW?=
 =?utf-8?B?WjF4eHRhM1Ftd3Qzc1dQQkdPcDZocTlCOXBVZEpXM3o5VVZvZGZVQWJQd1pN?=
 =?utf-8?B?c0ZvdXJaUW1Bam5yWk5iN0R6ZmJVZmd0S0NGNG5ucGY4MXJlcTk1cm9Sd21D?=
 =?utf-8?B?VU41WVhJVytWd00yNWpWdHBJa25mVXlpWmxOeEQ3M1cvLzBrL09KWlI5aWY2?=
 =?utf-8?B?OTNVQVZ5Y01YQjNUMHhTZEhDczdWNTRhNGZiMXBCMEF1ZkU2M1BMNGVadnV3?=
 =?utf-8?B?cllMSkZSc0I2U0drQnFabDhQaDEyd0tWZmpuTkdlNTlCMkZHaHZFRlM5cXJW?=
 =?utf-8?B?QmdGdVJoZkUvNitYTjhrWDk2T0hMdWtqRkhLdlNDNnhGNmVnVU4rcmlPQkx2?=
 =?utf-8?B?c1JDV000TlUvTmdqb0pyYU1YdEI4NzNSMzJDQlpaSVZmb1RkaHZQeFlnWWZT?=
 =?utf-8?B?ekRQcVErOFgrd2pnY1E2VjBJY1J4ZDJMdng3TmhwMU9jeWRqWEYxb1ppVUtS?=
 =?utf-8?B?eTkzTlVGN1hOWXZRVWtRNTVrZ1VQeWlwQXNjZnd3K2M4WGFyUmhzWFlZcGlE?=
 =?utf-8?B?OWZVTmtlQUNQYXYwQU13YlhHMGMrR0RJTVFaZ05PQm9SSlFHS041dktkZWJr?=
 =?utf-8?B?emtVY2pzc2NYclVYVXlSTXJtam1haDlBTERBUW9NNWVCZzZlQU1IMnZYQjR4?=
 =?utf-8?B?bDkzMU02dGJ2NHZQTDJ5MCtYaUk1elcyMlB2OVpLZmNhY1p4cWlBZkprWWZX?=
 =?utf-8?B?MS9vdysrb0QwMlRtYUVSMkxpK0V0YlovRy95Nlo5UnZwYmRua1A0a0J1cS9T?=
 =?utf-8?B?bE9lRTNzbFN4QTY0aWNBZnZGamhsVm5sL1dXSkQ3SG5PWmtEZUFva2N0cmdO?=
 =?utf-8?B?UDJBMkpqTURJVG1rcDNNWHF2T3VvWFZUK3JGcTBjcU44MWc5QnBZNmNTUmxp?=
 =?utf-8?B?WnlBZ0MreE5tN0twZEhuTkNRMEV3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KLarjczLkguzCnaiDdfEDmKN8/QGHfvaetbVfNzTkA8iMrx8McgubH7T1z3H48TsikDPqPumdZWwaxUJ3zfsfvUcjtjWCq/T4ZWOCJaykWULECvd7Yx6DCzHbjRxHVKMGSeC/PkqvtpTZJIdso3T3N/uXqb7dqCV5Iwb5zDymrdSGFY7tht9woWf6cbofZZyQqqTGssYiMIzK+mk90H/Nzu6bVccqV0BaSry0Ph675cnFyzlnhWd31bK9rGv81wtp8FO4XXHOe19pp/N87DPqCz3fwySWmj6AwhPGjPRQuO8cJ5URr4BWzknCWGDkpbq2BmpYvF2kRzI70APjDnuarLvskT3JO0k7WSidMoKAoRT0Q9mCmlbdCZgOrDPYP8X8QKd4VwQkxVduz+KZsyoUEtAQO0lSPWqLSXU3nVGfjH3chDHdsuG5A6Fmd0wLyQl
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 17:57:43.1165
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19519af5-ec61-46f8-25bf-08de69970e27
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5966
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:xen-devel-bounces@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: AC3E5126C0C
X-Rspamd-Action: no action

On Wed Feb 11, 2026 at 6:35 PM CET, Alejandro Vallejo wrote:
> On Wed Feb 11, 2026 at 5:04 PM CET, Jan Beulich wrote:
>> On 06.02.2026 17:15, Alejandro Vallejo wrote:
>>> --- a/xen/arch/x86/cpu/common.c
>>> +++ b/xen/arch/x86/cpu/common.c
>>> @@ -328,7 +328,11 @@ void __init early_cpu_init(bool verbose)
>>>  	*(u32 *)&c->x86_vendor_id[4] =3D edx;
>>> =20
>>>  	c->x86_vendor =3D x86_cpuid_lookup_vendor(ebx, ecx, edx);
>>> -	switch (c->x86_vendor) {
>>> +	if ( c->x86_vendor !=3D cpu_vendor() )
>>
>> When we introduce new functions to Linux-style files, nowadays we take
>> the liberty and make them Xen-style right away. In entirely Linux-
>> style functions the style should remain consistently Linux'es, though.
>>
>
> Seeing how I added the tabs I did intend to do that.
>
> Muscle memory and all. Will correct on the next one.
>
>>> +		panic("CPU vendor not compiled-in: %s",
>>> +		      x86_cpuid_vendor_to_str(c->x86_vendor));
>>
>> This will be somewhat awkward when c->x86_vendor is UNKNOWN.
>
> Which only happens on virtualised or imaginary CPUs. In either case you k=
now
> what you're running on and the information is not particularly useful. Th=
e
> important part is the "this hypervisor cannot run on your vendor. Enable =
it
> there".

Oh, wait. You meant when we run on an unknown CPU and the unknown path was
disabled? Yes, that's missing in the condition.

  if ((c->x86_vendor !=3D cpu_vendor()) ||
      (!IS_ENABLED(CONFIG_UNKNOWN_CPU_VENDORS) && !c->x86_vendor))

A hunk got missed in refactors in the default case so that default_cpu got
dropped when the unknown vendor was missing. That was present originally in=
 the
RFC.

Alejandro

