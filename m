Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nL/9FUH+PGrlvQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 12:09:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AED416C4805
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 12:09:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=NcJCdA2F;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1345420.1604286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wch0d-0002To-98; Thu, 25 Jun 2026 10:08:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345420.1604286; Thu, 25 Jun 2026 10:08:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wch0d-0002SD-6A; Thu, 25 Jun 2026 10:08:35 +0000
Received: by outflank-mailman (input) for mailman id 1345420;
 Thu, 25 Jun 2026 10:08:33 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wch0b-0002S7-R7
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 10:08:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wch0b-00D4yZ-7d
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 12:08:33 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a3cfe18-e002-0a2a0a5209dd-0a2a4501adb8-38
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 12:08:33 +0200
Received: from [52.101.85.39]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a3cfe1f-400f-0a2a45010019-34655527ecd7-3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 12:08:32 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH0PR03MB6335.namprd03.prod.outlook.com (2603:10b6:510:aa::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 10:08:29 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0159.015; Thu, 25 Jun 2026
 10:08:29 +0000
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
 b=QZXJ8o7HtCWJCt6jI5FpGHo+m6+b1PbFN125hMtDl40drZdDsQC5khRp51N1Y5leFi03NDZ2WtpsQ9JpffYJI6VFTlxK1ObgZTcUXQert4rIVBYs4HBd+iBgT1zRDY8Xv8QdVWV/0O8BAzXm9al1bzH7/Qjbt1Nii8yv12wN5S1sMqeAsIWGW1k9q7GdBTxa/WT+NjMhy6HoDszdwa7xhop7LIovmBifuZTg1z81jvaoz8CH8YblL9tlNXUmsYy072e5skOVotQVep+weo9Ce7OxQJ2bmB+d4xMvezswZQ1BmeOV3ZKleHXoDMtikdF/iay3bAGB1wSVDnLx3HVxQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4LiqmLRnTzxqyK4VsYEs4YJ+niQ6u4TWLFbYGpPfmC4=;
 b=iXoPPKiWOvqMb4xeeCNy68Ti7xQL79ZTfJw2W5GgzZnxzz2dSTk5IU297Lu2+oRM487O13FHdbScGifGAoCf0/2GKDcRtgQsuM2k4ze1fGG2H4IUHrcfgSY1WLn5i5p46d0P6slyitClqzSnlLsJ6igOOYkmcLtqgrp49K3UrK8JEe+GX6fkvMgapH7VA/x+HHQ5CV9S2oiVD0WsYtigTbYkd0XDXBAr9l2pDUvFpJL2kxp6RSwPXL8AccAvS7Iu8ACAuV/pT26E32XC7wJ8845n7HhK5Mw/5lf1kgH05PJFvbN3Qkz77CPlJb+cyoJI13F0zHDEA7VyCStH7jtLVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4LiqmLRnTzxqyK4VsYEs4YJ+niQ6u4TWLFbYGpPfmC4=;
 b=NcJCdA2FWiaanzpMa1darIFDYQ/+JxTSCrzpNC2hw2m4A+7auY+3v9KCRZTOifc67kEXSMQTpCAF4uSyEuGaBqgcm+dbdB/W1Dh0/yLB6cqRp2HbcA3nWRRp0ilSFT3QWh/m3CNmxo5LsUMoGfm7aoGsKcbcGFrtgLmP3/0S2dc=
Date: Thu, 25 Jun 2026 12:08:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.22] char/ns16550: bound execution time of
 ns16550_interrupt()
Message-ID: <ajz-GVoEG4toMs3P@macbook.local>
References: <20260623103145.76383-1-roger.pau@citrix.com>
 <06c8caab-4722-4b02-991f-bdc4a4ac0ea6@suse.com>
 <ajqVNtt02XMUGk-X@macbook.local>
 <cdf9f154-896d-4faa-8c76-ca15cf5e706e@suse.com>
 <ajqsQr-bhf4SGf8Q@macbook.local>
 <d7920786-7424-4634-80f0-994ea2857d1c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d7920786-7424-4634-80f0-994ea2857d1c@suse.com>
X-ClientProxiedBy: MA2P292CA0015.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:1::12) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH0PR03MB6335:EE_
X-MS-Office365-Filtering-Correlation-Id: 06e96d17-c63f-4cc2-c5c8-08ded2a1b448
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|6133799003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LIusd/xdnVgDocdW49Lf/rg44HZ6hiCfsR912EQ44KWvTFmaWAV7hcaV5/EBiyM9ouIlU5zDN16MebwLYfo6/WhNwCcHxCSxuRGTltgyZyDvai3AzFzVgkEBMVEx5fJDRtVJQg2R5cHtQrclF1Z0L3UWEuu6jmtIjWGXnHi0nom+ScGo65MgkzIoEdH+OnsQ886Vg2p295juKy6tANgEa62ch5SmOGYNDCgfZy5I/HvLVMX3weoNhl0tDk8n0CiYbwCydGSPSVjAz77wzJLATfCRYZHBQ3BbocJefk+pBOTqbEB6tAR/Z4UDo4cZz8/ed4iGXZl7T4gzlAMo2MHfhhhk+O6K/i3F6MEm3HBRZsw0TmRmv1cVvp3HcOLD+VD3p+JyZK9EGrBZ2kR8o5JtXWr3/sU1XNMisQtIzoTGxC9YaqdM21fQbjNdlXZPCclNx6MHP1cv5c3AoW6qL4vKhiUox11ikX96tcNHHWZr9nBB1KutGDOE5LwdugGGUniO/pc/5+H9vaF/ReHrvk+WGT92ESJkO9i1djqnPFCoB49d6OaLi8IegaYzamuvLWvgdw1lfd5c+rty3wwhDUCHJhboeaGtMun1AejSI9SuXeNsV2WCMHe1OhWF5Q/U+n8Eu/MC+bIBb94euqVIg2p22HnlNhuwD27yCQuHBGPKW5Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1I2Sy9SdFVib0lra0pvTVRHeFJkMi9qaXVFRmZFWkFST05kSGtXejhNQU1K?=
 =?utf-8?B?T3hOR29kMUVqcFlNYmtOUThWcXlOMzFxK3ZYUnFKOFpFMVBLWDNiNDJXMTVn?=
 =?utf-8?B?RXA4aHJPck1OUGxpNk1OSnBhVlhmYjR2Znc1dFluR2tDOHNhU1d2QURnMW40?=
 =?utf-8?B?dktvbmFpeHlsMXg5T0hhd1hTbHpsTFh3NGh2ZnpKcjZ1TUljM2RxOVNlWlE1?=
 =?utf-8?B?dDZSRkZGYnBwWHYzTWZ0MlQ4dlVOUnRtbjMzaGFEdDR5a3c0STVQbnVMVWhG?=
 =?utf-8?B?QmVyWDJRd0dvMk80ZjJpZ0dIN3RBallJU3F2MWtxSCs3UkNsWTFiUUhlQmZ5?=
 =?utf-8?B?OW1PcS9tUndVSEFnSitTb1QrTjhtQkc5VU8vc0pVYmFhT0tOeXhZVGV4ZkJX?=
 =?utf-8?B?K0s4RnF6ZXltRFZtQ09DVGovVU5MSkh6bWdxcEViRVUyOGpsUUlJZFB2NkxX?=
 =?utf-8?B?VjBXN2M0WVh6dXJOMndwZCtUWE9QUGMwUFhVS2JnYU1CS1pOVmkxbHY3Y1dK?=
 =?utf-8?B?QWtoSnpJakNHZWZZUk9meXhxQTBzT1JFdUZGWStIWDlkTWZJNXJMZWdSYWlP?=
 =?utf-8?B?WnFKRnlpVlNYbjVrQ2RFS0xaOVJ4WXBTZ09BdllVMHlySG1TVnlaVmYvUnlI?=
 =?utf-8?B?VHZmWmtBSW1WSTFRNmFYY2pLeEJtSXM1SUozaTNiaDF4RGNTelMydWZXM3NH?=
 =?utf-8?B?ZmpabDJKTktTQnpodWdnYUxyaFYzVGVIUjJiUzR2djI1Y21OZS9aT3J4VVBP?=
 =?utf-8?B?LzFuRjUxVGgvSXhMOTZrcmY3bXhZVkYranc3cklNR2l4OExKMHM0MkdoRDhB?=
 =?utf-8?B?bzdQY0I2azBTRngwS3BoemdoRDZBalEyQWZzQnFHdEZjVlVEQkdJYUpNeW9Y?=
 =?utf-8?B?VUgvWEV0MlVZeUpGUlZ2YWFURE1oMWJVK21mK3oyWGorb0pJem9BQzVteDJt?=
 =?utf-8?B?czJFSjNmeHM2bW5qY0pHdEZnTHErencvdDRtRk0vZTNITjZMWlZvZFlMQTlM?=
 =?utf-8?B?RTdKSDhRZmp0YTdLZjBTQ2l0UXlqK1A5OGhmOUlXL1IwRjdVWXEzRmZ2Zlpk?=
 =?utf-8?B?QmFRVWhHWGpvZmdkZ0JmN2dnbXpzcXlHR3NBQVNmZ2tUSDAzWk5sMnBEZk9N?=
 =?utf-8?B?emRJRjdiNjR0NU9DWWVkdEl4WnlvZUg2N3pvN1NMUncvNmxuMmo5S1QwMGd6?=
 =?utf-8?B?SjFLaWlxZ3UwekN6cEZ1Z2owb1RlR3dCc3VPYXZnOGI1N1Jra2EvVDV6S21M?=
 =?utf-8?B?VjVxTEFDV0V2R256Y1NQNVMwWkJVaVN1RitFQ3BRUHJqTkNwSzZZaHg3UXI2?=
 =?utf-8?B?ejdZbjNoQ0UwdVlSRWo0Vk9vTlpZSFVneVlZUFBYTFdBZWNHRkJmbnY3YTRU?=
 =?utf-8?B?Qm1yVENmZFRKdEhDNlFIc0FQaWJHVUFjQ3FoTUxzZnQyOE1kcDd1Y1cyU2V2?=
 =?utf-8?B?cnhGQmZXTmZkOXQ1c2NFN3c3RkFIWTRxZFdLTFpyMnZRVE9zaTEvSSs0K0Rm?=
 =?utf-8?B?eHEwRzFSaFllM3NXamF3eWdnYnkvS1FFREdXcXp5WU9qUjJYU1RyUVN0ejFv?=
 =?utf-8?B?d3pRQ2x3bkkvcDBuM1M3MEhycFpHcEZBQmFnRzdpK3R1MlMyV1VXQkJnV1RC?=
 =?utf-8?B?WVM4NXNLazlnY3BXM29PbkU2VDUzRUxjYnpySUtuY1JvYXFRejlsRm9MT2pF?=
 =?utf-8?B?S2FzUDVhR3BLUUdITUk1Tkpac3JJalBMY1crQURUQjE2blhKOUQyY2hIaGg5?=
 =?utf-8?B?S3NnRzNkQlVVWjZPaFNnbjZmMDlGL0hVWUpCRlJ6Rk9LaEd2REIzS2pSbFVo?=
 =?utf-8?B?Q2R6Z3kvTkFtQ0RTbktGTkJDd2tCTjVqem82aDcvTVA2S21rQ0pSRk5ZQXUv?=
 =?utf-8?B?M2E4NXFxVUlVajhMRDlrN1RFOHhYM3FLcWUxZ0NMUVZxM2VDMzdRU3Z4ZmZw?=
 =?utf-8?B?cit4K0VvTWhXZWZIMlV1YXB2TjllWmtiWmtGQUNwcTlldm50TE92cEFwK3I2?=
 =?utf-8?B?ZkRBb1c4NEV4L0JGSWtLNXlBelZFa29CMTJwamsrSEJ4dGYxdlRhZE1YTStW?=
 =?utf-8?B?R3BDT1V5bjVFY0xYV2toOVRCcEhYMTBQQnJCRVM5UEVmZTRKcllWaUI2QUl6?=
 =?utf-8?B?dDRCQ0J1aDU2RmR1aVFDaklxL2FQalJTVFRCRGdYV1RHNkVYZHFEYUo4WnI4?=
 =?utf-8?B?bHorQ1hUOXcrTkVMYzMzYU9HakhKMmo4c21vZkZRaVNmQW92UmE3akp6aGtR?=
 =?utf-8?B?RGJCakFWNGJZbFUvQ1BpWk5GWnZBMW5ScnpOU044MTU2NWVTbE1BWVlzSTlN?=
 =?utf-8?B?dWgwTGs2bUE0MENZQlpVZ0JrWGlmbmwrZFF3L3NpWjNmcDYxS0tXQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06e96d17-c63f-4cc2-c5c8-08ded2a1b448
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 10:08:29.1368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YwFcOoOFE35XwoUTjuVkP2xIDAKhLT7P71//GWkHrT2C5ryiIirkljMTpe/UiVv+gtScIGrCnqAGl3e5oJcMmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6335
X-purgate-ID: tlsNG-d62444/1782382113-820DC1E0-469107C9/0/0
X-purgate-type: clean
X-purgate-size: 3096
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,macbook.local:mid];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AED416C4805

On Wed, Jun 24, 2026 at 10:01:36AM +0200, Jan Beulich wrote:
> On 23.06.2026 17:54, Roger Pau Monné wrote:
> > On Tue, Jun 23, 2026 at 04:27:12PM +0200, Jan Beulich wrote:
> >> On 23.06.2026 16:16, Roger Pau Monné wrote:
> >>> On Tue, Jun 23, 2026 at 03:44:06PM +0200, Jan Beulich wrote:
> >>>> On 23.06.2026 12:31, Roger Pau Monne wrote:
> >>>>> +    if ( uart->force_polling )
> >>>>> +        return;
> >>>>
> >>>> As the IRQ was disabled, is this even possible? I.e. should this be some
> >>>> kind of assertion or alike?
> >>>
> >>> Hm, I wasn't setting IRQ_DISABLED before, and hence needed this guard.
> >>> But now with IRQ_DISABLED being set in ->status do_IRQ() should filter
> >>> any stray interrupts.  I will attempt to add an ASSERT_UNREACHABLE()
> >>> here.
> >>
> >> Simply ASSERT(!uart->force_polling) should do here? It is not wrong to
> >> run the code below in release builds in such an event. If we kept getting
> >> interrupts (perhaps at a high frequency) we'd be in trouble anyway.
> > 
> > No, I'm afraid I can't do it like that, I can't put an ASSERT there,
> > because we can still get into ns16550_interrupt() after the interrupt
> > has been disabled.  In do_IRQ() we have the following loop:
> > 
> >     while ( desc->status & IRQ_PENDING )
> >     {
> >         desc->status &= ~IRQ_PENDING;
> >         spin_unlock_irq(&desc->lock);
> > 
> >         tsc_in = tb_init_done ? get_cycles() : 0;
> >         action->handler(irq, action->dev_id);
> >         TRACE_TIME(TRC_HW_IRQ_HANDLED, irq, tsc_in, get_cycles());
> > 
> >         spin_lock_irq(&desc->lock);
> >     }
> > 
> > So if the device is generating further interrupts in the window with
> > IRQs enabled (while we execute the handler), we will keep looping
> > around this, without taking into account the setting of IRQ_DISABLED.
> 
> Ah yes.
> 
> > This is something that we might want to fix, so that the loop is bound
> > by IRQ_PENDING being set, and IRQ_DISABLED not, ie:
> > 
> >     while ( (desc->status & (IRQ_PENDING | IRQ_DISABLED)) == IRQ_PENDING )
> 
> Or perhaps ahead of the loop
> 
>     desc->status &= ~IRQ_REPLAY;
> 
>     if ( desc->status & IRQ_DISABLED )
>         goto out;
> 
>     desc->status |= IRQ_PENDING;
> 
>     /*
>      * Since we set PENDING, if another processor is handling a different
>      * instance of this same irq, the other processor will take care of it.
>      */
>     if ( desc->status & IRQ_INPROGRESS )
>         goto out;
> 
>     desc->status |= IRQ_INPROGRESS;
> 
> thus also having the comment no longer describe only part of the conditional.

I think this is racy.  An interrupt hitting in the window with
interrupts enabled ahead of the handler having set IRQ_DISABLED will
still set IRQ_PENDING, and thus the loop would get executed a further
time, and the handler called after IRQ_DISABLED having been set.

I think we need an extra condition in the loop, I see no way this can
be solved only by dealing with the concurrent setting of IRQ_PENDING.

Thanks, Roger.

