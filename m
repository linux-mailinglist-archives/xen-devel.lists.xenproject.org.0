Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id g6ZON8Z8MmrX0gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 12:53:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46596698B07
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 12:53:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b="D4W/zgT4";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1340047.1601053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZntk-0004UC-Qj; Wed, 17 Jun 2026 10:53:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340047.1601053; Wed, 17 Jun 2026 10:53:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZntk-0004RQ-Np; Wed, 17 Jun 2026 10:53:32 +0000
Received: by outflank-mailman (input) for mailman id 1340047;
 Wed, 17 Jun 2026 10:53:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wZntj-0004RK-Ts
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 10:53:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZntj-009Yrq-AD
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 12:53:31 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a327ca2-5cb7-0a2a0a5109dd-0a2a4503bb22-12
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 12:53:31 +0200
Received: from [52.101.56.15]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a327ca9-672d-0a2a45030019-3465380f581a-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 12:53:30 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA1PR03MB6580.namprd03.prod.outlook.com (2603:10b6:806:1cb::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 10:53:28 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 10:53:27 +0000
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
 b=kgbdXcoDOts57phcD+Kz2zRDnu/LBeU9WwIA0AnY21Wa7xRf3HIlHPcWtA+5nZvJdlSmmFZpGO15EG6GDfln2clHzviiLjcJizZ2PSQc42boz8B19C/qndenA7Tvz3Zf3sw1f9Ug4EfuuD70y6kDrS28lJLgO3MKJEwFg0YPywxlFlyyXIhkDA6/wjTRd6vCFKgenkjpb3wg8EjmtNi8iscvzdPVksIhx6N6FiaAZ/S7HB/SDxEA0uHmn5X7S7ZmHK2KCCY8i3PTCszlPuGYrXcZLt1oA7u4R2yCPYkPZF3hqFLxKQQSo4WZpIB3N2fj7cpLQUwMxg8fXB+ISlXqAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jthMzj7OmyhgY2i+pIhL/u2rZtxKj1FxIx8XZffGD2k=;
 b=tgn3eoH407+sAlFVdkcz9kWpg8KRXMTjYrgH52rV6ZPdO2j81y4iaDcWUScqW2Mi+jmwZXT8k6lmPDCTp+ucjFoyzXkK8NTs1ciwtbTL/JDuSKhdlLTT8bDyRaI1B4pNS40SqU7miDu1tEi9hyhZTJo++8NgFn8SLNoA2oGAZYy2ZwQlKJt88qRVciwE7QkOEQOaK1B7RXEjjpsmtDiYbCnNWDPLib7WzwlxvwSUcjgmW4fiZuXJXtdXEc1qiJf8IZwFkuox0fuCJkVV6ROvdHNBY1ThBwZLWYEWh0um5tk2R8VswzzXD7w/LTsgeLnkLVVkjGEjatCRltMr3tGa8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jthMzj7OmyhgY2i+pIhL/u2rZtxKj1FxIx8XZffGD2k=;
 b=D4W/zgT4FEQdRw3/VGLBJGgJMOw+eKQQNcFBPQQ7xji+2FDXqg3WX8HsyC8KzyZaAYwNolhtnWQukKUvI/JZi70pzpUrzRxlZYHcODFG8NiVNNLlBx+Yb7dSsD0qNIlGw8cf+5jiK/t4WW6nkcRAw35uNSnObc9ElyVPRmddmIk=
Date: Wed, 17 Jun 2026 12:53:23 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Marek Marczykowski <marmarek@invisiblethingslab.com>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.22?] x86/EFI: arrange for non-discardable .reloc in
 xen.efi
Message-ID: <ajJ8o2U3Gn3zwjqt@macbook.local>
References: <652b57e0-42f8-47c8-b94d-df862874aba3@suse.com>
 <ajJ3C40FLsyBZn-U@macbook.local>
 <a307207f-7cf2-40fb-927f-bbaa841b94ba@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a307207f-7cf2-40fb-927f-bbaa841b94ba@suse.com>
X-ClientProxiedBy: MR1P264CA0117.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::10) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA1PR03MB6580:EE_
X-MS-Office365-Filtering-Correlation-Id: 04d3b653-8de1-4053-1339-08decc5ea98f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|6133799003|56012099006|3023799007|11063799006|4143699003|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZH4J+mIiFl1TJ+OOGkNNa8nCc6rhm914JfrpKlczpQz60E8dlYJ/ZcyiHRuhupzMq234dwhHphAlzxe03MZMEI5MKITyJEJ/EJvFbWSraxTQYPV2PGrB/TWjo7JGFXXFbIBf5oAmm+pLqL/ZqvcQ69JRLaFOxuLd2Dvdt0vwifH5KepI8f+BBwJkFo46/lOGlqM2k5aNYpboOrsgw8iv4WSlfIG7ccYizYkgFffIh7EX4qSmEO6HPCLacgX3UhN80Zn1UQlXm0+Z7If1JmkycDbBYaxg93SA/msGLQ2wRvqkL5v3ridsGoPiM6P4BIEzmx0IqZkV78cPvUE/+dj9M71hU+0hMC2pqOqoGfhWoeLiYUtTFgwB1Jvbs4AAUiWeih1LgCLSPfb8OHivXEK9aVzJCZyc5DvaP4OcWCipMCAVJuJR7/p16jroSs3HzM+bUJJ51ETkjNbXLitZOiVUmrIa/MguJPZ2nax7RiaqwrmLs40/qvvRErxlxX8x8s9DPXDjGIAf2lrKr01TN5w88rHKHzKdHNznX8LSqJDr/PLooWEGf199r5UxCZtVPAtr1/rvnZulu6xWtjxnxtpmRkAmq7NiTpUjE5LJBnHnBO/4re10nmjDSJMkZZhfNuIIebvjH+mM4aJYb0w6N2JYJjG7nYvoRdcQ9fm/KYo1NtgDCf5AKF6AB4G8ZlBg6aNG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(56012099006)(3023799007)(11063799006)(4143699003)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmNyZitkNURYSVFBbjA1Ti9oK21jUXB5Z3Q2Y2V5UmkrbkptY2k2Z3dvYm9U?=
 =?utf-8?B?dDN4MW82akJMUWs0VHZBMUo5TlJabHlwZk04ZzMvb21wVmRIemNUMzhzSFF0?=
 =?utf-8?B?NkhZaUFQS2Y5b3djSHhNVmRaRWM3aTZkVlZaT2t2SVdZbmUwc1ZpcUlrK3R3?=
 =?utf-8?B?aEVlZnkvVWxMZ0l6dkpKRGM5R0JWUkVWMVZwa0tLM2xSd0lnZ2NTYkp2bnVG?=
 =?utf-8?B?TEZIbU4vVHErVklKcWxSczFKdDFOVFJicTEwYWF2cmxYWXRWaHkxVjFiU0dr?=
 =?utf-8?B?M0RxT3owOGtTODBYVVVicHNJQ3RzTnNPU2dWbkZWTzlpRDVQS3FGbDJpUHBC?=
 =?utf-8?B?NStZMkNWdW9HZzFvU1kxV2U1NjFSRFZualpLNzBnei8rTVlDZDRoVFkxelRp?=
 =?utf-8?B?SUhZMDhISFRPZXpJbm5wOWt2UG9CSFFOVzBCRm9RUTdkR20zSC9UZ2VwWlJY?=
 =?utf-8?B?bFVUN3lVVWpXbm9yMHFhT3prL2RlQzU3Ly9KeTRMMGo1N3JiRTduUXF3UXly?=
 =?utf-8?B?TE1wWnRzb0pmeStSbnhoSGNnQWc2VHo3bjR0Ykx6SzY0NTJSbWlLRElaY3VH?=
 =?utf-8?B?dWl4MkhxckZ2TGtnUWxqUlhEUnNvS3VnRUVlV3ozMnBMdUpDTGo0cm5RRUQ3?=
 =?utf-8?B?M2FzY1ZLWTN1MkxYb1h6RnY3d2tGQ25iSkRKLzNWM0hZK1djY2VlZ1puYWow?=
 =?utf-8?B?V3VYRjJ2MVI4aHNUZUc2bmE3ekJPM0VFOGhQcVNPeWlFdWRPRjVZQjhEa3E2?=
 =?utf-8?B?VXVJSVBGdEM0MEJVSVd3bUsvWkNZa1NuUFVYODV0bDNFNUlNa3NHTG80THZt?=
 =?utf-8?B?VWtRRk9GRWw0UWx4SHE4VUhJdkdZNTVJM2VuaS9FajVoRGYrbFo3MklhRGQ0?=
 =?utf-8?B?NW91OFJEbW1XdiszN0hrU2VDaU1kcXh2VG93TFU0VSt2aDQyLy9pNkdwc3Bz?=
 =?utf-8?B?VkJSUmMrTVVCODQxMjJ0TEtpOEM4dDMxZ3V3WWJ1cjdvbWN0Ry9oak9ha1FK?=
 =?utf-8?B?dysvTGdON2FwSEVSVFR3SDBzZWY2RWVneURoblZEbWxZREFpaWVYOGtZN2du?=
 =?utf-8?B?cmZrNTNKYjRyL2lTV2RhNGVKYk5SN1o3RW5qUDVmWXRVbnBSMGtpb01ZZDNT?=
 =?utf-8?B?d1ozMUhBcW9LZ3V1RmhmV0s2VlVXZnN3dXo3a01qaVloRU5rbkRuY01Qb2Zw?=
 =?utf-8?B?eVFiSDJDWG5YaWhRc0tjcWRic0hKVEtWSlFkQysyQW4zK004bDJ4Q25zeVVN?=
 =?utf-8?B?Tmo5aU82emt2ZXM3Nmx2VDE3Y2szS1FGY0d3VGRTWUpVazRkVFo5WnIxM0ZN?=
 =?utf-8?B?VEdBT25FTDFFdGR5Nk1VUXZWL2svUEZiRitBMGZmajczRURlNjl2R3BYVWlK?=
 =?utf-8?B?NHB3VTR1ODhwSWxNWFBkMEhCMlRVVkpycWdzb0gyWXlLSCt6ZFJTYmpPTmZV?=
 =?utf-8?B?cnVkYndja0l5dTJENlV2anRYMlo1MC8rRVBLSm0zV2k5eFBzSDM2RCtzSHhR?=
 =?utf-8?B?cGd3aTcxS2c0akZNanZkNmFBQm5pSEJmT1paTWIyUU0rOEkvU1FyM0oyelNV?=
 =?utf-8?B?Z1VKZCt5Y1NWLzRpSlpiV090bnJLQVBFNXQ0aDVicVBZNExvbllXTHlnL0xP?=
 =?utf-8?B?eTB6dkN1WnhoZUJVNk1JakVuUlpkOGdXZGY3ZVc3aXFxbnVadGJ4cjdmek94?=
 =?utf-8?B?VEh2Tnl6eTU0L3lXdUtqSmlLcU1EaWdmbk5ocHR6cHIrSkcrQ3dKUzNKS2h6?=
 =?utf-8?B?bU50TjdRRm5GQkZPamdHbkJhYWtXK3FpQmRCaVZkTnVTMHRqTW9vUkJiWnI5?=
 =?utf-8?B?S2thU21sRlN5WkVHSWs4WmY4dTIwbTZERUo4OGdBN210cHhUU2FWNjhSS25q?=
 =?utf-8?B?cEd0S2VMY1VEcmVtYmJXdG81cUo1SUFIT0RxbEhMQldCMW9qbHB1aW53aDlH?=
 =?utf-8?B?eTlFZnU2NnJKVThMNUgrMDVIR0FCOS9BNVZLS2xKVVEvVWd0QjZKQVc1VVA1?=
 =?utf-8?B?eVRFTm1mNGFSdExtOUlFWHBIZlowWUpHSi9pVE4vMHZSSEN3VGZYYjdvYVVG?=
 =?utf-8?B?dkNZK2V5MmtNdDMvSHVkM2szZmtGTWdwak82bXR6NVg3ekdNTk53VVhEOWRH?=
 =?utf-8?B?RThMRUpLZEthZjM0QUU5all5c01zUlBVd3FwVUxtK3lUYlJ3SGVCVndqeWwy?=
 =?utf-8?B?YTBUeXdqZUV0UFNZK2srNzdac1hXcytoTTZGa09kRkNKdHAyRG5pVVQ1Szhs?=
 =?utf-8?B?cHVlN29YY2JFRFlnTE9URGdsZm9rR2wveXFoNXBNeEdLZ1doUENITDlteGhN?=
 =?utf-8?B?TGFxNkdFcThDcXZwd1FXd2FIM3U1OWNLRmcySlVvL3pnZEZRb2o2QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d3b653-8de1-4053-1339-08decc5ea98f
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 10:53:27.8773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uSpf/ZAjais7cV4rcO7ifiEa3CIgsb2qPOj14FyVCXI0d4ldxDEt2yttlupxt2bZySSXYlgCes0N7uqx7MyKbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6580
X-purgate-ID: tlsNG-33051d/1781693611-4086B938-6C71C661/0/0
X-purgate-type: clean
X-purgate-size: 1388
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,vates.tech,invisiblethingslab.com,apertussolutions.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:dpsmith@apertussolutions.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid,citrix.com:dkim,citrix.com:email,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 46596698B07

On Wed, Jun 17, 2026 at 12:37:38PM +0200, Jan Beulich wrote:
> On 17.06.2026 12:29, Roger Pau Monné wrote:
> > On Tue, Jun 16, 2026 at 06:17:54PM +0200, Jan Beulich wrote:
> >> Loaders respecting IMAGE_SCN_MEM_DISCARDABLE would not load such sections,
> >> yet we need to access it ourselves when switching out of "physical mode".
> >> Leverage behavior new to GNU ld 2.46: Any contribution to .reloc which
> >> doesn't have the discardable flag set (which cannot even be expressed in
> >> ELF) will yield the output section also non-discardable.
> >>
> >> Since for intermediate binaries we don't care about section attributes,
> >> link in the new object only on the final linking pass.
> > 
> > I'm not sure I follow.  Xen already does generate a custom .reloc
> > section without the IMAGE_SCN_MEM_DISCARDABLE attribute when using
> > the mkreloc utility, and hence the .reloc section should never be
> > marked as discardable?
> 
> mkreloc is used only when we recognize the linker to be incapable of
> producing (correct) base relocations. As a modern linker is required for
> the desired IMAGE_SCN_MEM_DISCARDABLE handling for .reloc, mkreloc
> wouldn't normally be used there. Hence no .reloc section with the wanted
> property.

I see, MKRELOC becomes ":" then, I didn't catch that.

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

