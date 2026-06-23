Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eg+TG/GVOmpIAwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 16:19:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B5B6B7CED
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 16:19:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=QiAVpnP8;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1344320.1603416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc1yC-0008PE-CL; Tue, 23 Jun 2026 14:19:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344320.1603416; Tue, 23 Jun 2026 14:19:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc1yC-0008MR-9V; Tue, 23 Jun 2026 14:19:20 +0000
Received: by outflank-mailman (input) for mailman id 1344320;
 Tue, 23 Jun 2026 14:19:19 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wc1yA-0008ML-RU
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 14:19:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wc1y9-00HFIV-5r
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 16:19:17 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a3a95ce-2eae-0a2a0a5409dd-0a2a4501eada-30
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 16:19:17 +0200
Received: from [40.93.201.7]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <roger.pau@citrix.com>)
 id 6a3a95e3-e031-0a2a45010019-285dc9072db2-3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 16:19:16 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BY1PR03MB7852.namprd03.prod.outlook.com (2603:10b6:a03:5b6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Tue, 23 Jun
 2026 14:19:13 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 14:19:12 +0000
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
 b=Wkk18n1SGY1ZqLBckxo7WXMe02Juek/l5r8VJD6laDLpnVrqazMPxoJbxCW3Vwqb9r4Jl+it/NUCPVmpM2mYXzXtnxATbbYeAJFqrbjqlv1YElmeErePZL+D5cgXT1EO25AFJZbBVnnhvlrVeaAUMzqclCO2NFaVgmijfT0V/aGmKqB0IMTxgC57LO0ZsGxcH4xI6VHmyKlBbXnGIKDi99BSNBUUAQR83wTtGnS+cAX5URcd1PCHlj2UFvPfSxU+EcQW1mu7wOPGG4xouIsEDjFOug2TRx5u6AgeJAtMv6dKZSqSewjY3GZxE0JQsrLOfi2ertT4oLcY3N9SXtPhzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uRS58iMhLNg5y/4kLEAE7WHi2dVvTtk56WbX55L+UmM=;
 b=vJYF9J8L/gtHCGqbRhzHzG6LD3Pdd1+wD5uGMITtrVMHaOYLRR1BeNZl7NIfN4+N3dOdlt3csrPM9jmyyUIJW6qcc/nAMsaWru6Htw9TgFEo8MJUVSVzTzYcNsH3nLAfjuf6K0FwzuJJPj2RMRNeDQccIFteJxX+IGe415x/V72/0sE59qnoyHBEY4X4lDy/l1Ln9ScL1hO2C91CGgXsNR6YpjadC7IBix+XWB2RwtTuItTyjUkSk0/pWSICi1XUff9kpjA03KXknRiDYENeIARley7OvEJYYHvNjMz3cOraTQis2ovmn9M4qZ+e1TxideMJI3ZSf37tQqtT1Z9efg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRS58iMhLNg5y/4kLEAE7WHi2dVvTtk56WbX55L+UmM=;
 b=QiAVpnP86STz3VbF9o8xKFLxEaR3tsfdpc7v3QwriaS2kFZ3/cgYckOMnc1YU4OkujSNmMCGyna4vMM2YSxeldHtrmX+6+Xc0gM9oPeDmIb94hsJhd5Pk7OkejMODsnV/v/ttxcfIjkgpofC3yZu+1u2wzo19q/VmbrIpCVqqFM=
Date: Tue, 23 Jun 2026 16:19:08 +0200
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
Message-ID: <ajqV3OLhVwkmxGMV@macbook.local>
References: <20260623103145.76383-1-roger.pau@citrix.com>
 <20161bd5-a081-4562-a1d9-14dbdba109f3@gmail.com>
 <c3d0c6cd-cc4e-48cc-a0fd-a455a6d4917d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c3d0c6cd-cc4e-48cc-a0fd-a455a6d4917d@suse.com>
X-ClientProxiedBy: MR1P264CA0207.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:56::7) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BY1PR03MB7852:EE_
X-MS-Office365-Filtering-Correlation-Id: 40842e8f-4835-426c-575b-08ded132661e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|22082099003|18002099003|11063799006|4143699003|56012099006|5023799004|6133799003;
X-Microsoft-Antispam-Message-Info:
	9iOiQP8222GMflEm91IS5YBaLtJlE2cB8xOrUfYTOuluGpBnAz2jT8tcAtl3KYojq35BRPH6xE4RzCkNg9Q14wMQwKRHO+U4W6RZ7g5MsWJRWnh4OV7Po9rsEe4g81WljUunixuqn4Ih6ednTIR0IUc+7HBxJd4P/O7Qh7muc9yIHWWbiBg8AQ1OoAMAprfeWp4VKvuQnDf/QTFoySrwYCe6jNS4UutNDnQxTCnLvGQulUQ7ixFpaPDzjkkgPgUTB+aO7h2A7rfvJuPXJ5dnn+Q1017eM0q/rqOdGl0TKw8RgnmSfd/WZh9litlIHBh9RV2xjwF7Z/GJdhGd0S2b2EqAdozlOl/MELPpvx+zdTzkgu/bPyxfh+sOqv4EAM74NJYT/LlTe0BJutUrnUaLwoWe/cAZlr2y5zpCArWV10r8gSs7D9DkPHclnj17F0Am03aT4N3IcEnqlFBI6h6wgwYQ3X9lPGlN83rqepxc9wZs74cRG4onEM+gfRARVXCbr91FpeP7iha3S2lRPQ0I7yy3WX9/V0PsuFqQ6qLL2jOit5+lyicaJtricNDetxSzPPi890Fc0tOmJ3Ax5lWYxLyezWHFbYqGOh/POk57aiKgaIBK40/Jd4G5mPjJLrFTeWSiOpH9vk3fjvNMKPUeUnRKl2/UH5jdigUgkxYBL2A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(5023799004)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEhSdkI3ZzUySUxsOWNhNGVab29vT0FXTk1odXFiUWE0cFBNalcwRWMraGMy?=
 =?utf-8?B?R0k4Q2Y1L2pOcWh5a21zbzBYaE9iNXBURnplaThFMVBOQkw5NmN2dTQyWUsz?=
 =?utf-8?B?TUpLRUMyN0YrZjhHSkdlVzlHVHFJZFZSSDhqNWJCRXBhSERHT3Y3dTJNTGFX?=
 =?utf-8?B?cERacHNqTVdEYlVTUldxSU8vbnlEZnBCa0g0dC9ETkltMUVjRkNnRmRrSDlS?=
 =?utf-8?B?dGJ4TldIL2RtM3RYcmlmQ2o4eDVHbHJVV2UxMFpKMEVQSVBXZHlYRUdwMjdU?=
 =?utf-8?B?aVFxdjN0KzVDRTRuNk9FOWFIUG9oN3dFUk1IVHo2MU5kRHA1eldZQ2tpLzlS?=
 =?utf-8?B?REJjOFAya2tQYXlUVmxEUFBVQWlVL3ZqZWRNazVEV2JGTkxJc2Irend4czdw?=
 =?utf-8?B?VnpEQU9IV094WGVUK3AzZ05SS04zb0pwSEhCRHMzTFg1TE9nUm5Ga1lzdjBB?=
 =?utf-8?B?eDdGVm83Q3RZVGtLdzN6K1ZkVU9id1A4cDJKcHNycjEydW5vSDBGcFhkRlZ5?=
 =?utf-8?B?cE1qUUJhYWFuNUhGSDRNYmtUS0xiNTMvT3NTQ2Q0UWFLUWl3bksyUlRFemxz?=
 =?utf-8?B?ZmNjYitHWVhJcHlOT0pxQTAxb2JES3JPZlQrUEs1WG1rTnlwZEVDZnpPREZT?=
 =?utf-8?B?aWg0VjlxSUxaRGVVYWZzQVZRZW55Zjh2Smx0T1ZFZUlYdkF3KzAwRmZUZlZp?=
 =?utf-8?B?RUZ6Z2VwdVo3RXFxU1cwbGhZNUMwZ1JCWk9OQU9ObVZCcmJSb29VQ1VaSWdW?=
 =?utf-8?B?Q1RUbHQ3MS9FdDNVelZUaGorenJ5T0s0dWZLZHBheitZUXA4N3htc0Y4dnlS?=
 =?utf-8?B?ZUNVWTVhMGhXRTc3ZThNb3ZiQnY5eUNaS1pMTWtlMzdjRlNKNXVtR1laWWxW?=
 =?utf-8?B?RzNYdGZQU3pFUXlSeWgzRGFMSm1pdG55NHNYbjArdmExRm5KbnNYMVlldFdt?=
 =?utf-8?B?MVYrVWJ4ai9qTithanVjbnhtdXZzTklBUFBDb0VDdi8zTEZmSCtSdUVqVHNI?=
 =?utf-8?B?TVBQc2drUXFRV1lFZC9ZMERLL09jT28zWTFvVVZUTnNYRXJKQmFsaTlCVHBH?=
 =?utf-8?B?VDlRN2s3cVUxLzFaMTNEN0JDYWlyQXR6VjluMHFjL2E5MTNRS1hSb2JEclNw?=
 =?utf-8?B?QWd1bXJIdEZKWFhGQ3ZrOTMyKzZSaFZsRGRhMjJpajVDMW9ZVTFoS2V4NVln?=
 =?utf-8?B?MXIxeXJ0QlJhc3NvZit3OWc5emhSR04rbERyQ0I3REtKcmFJSXJzQ2JBUlBG?=
 =?utf-8?B?NHNHNUsvR25DNXFFTDBhVFNhWFg0eHZvSVBuanh1RktEdG9XVUhGTTk2YkRD?=
 =?utf-8?B?S1RqeG1ia2YyZ2VlNzdPMUpqYXV5dGN6K0dxVmxCSTNZeXV0UFI1OVpCc1NZ?=
 =?utf-8?B?Qnh0UFV4QitJVlZ2OHV3TlI4OW5vblo1NWlXZkJEVTFJM1Yrcng2TWJxU3M3?=
 =?utf-8?B?c1pxMnh2anpwSElYZERVK0o0ZUdUQkJIbHBMUk1JUnVnakllRHpTZlIxbXlX?=
 =?utf-8?B?MC9lOHdsbGlsdGFRdldRRW9DRmVtZGExWUJPZWwxOHJLLzlETTBpa1U3TVNU?=
 =?utf-8?B?OUZyeUovMWYzNnJCTk9vNDRVNGREY2FpbHVJSndydmZQNVFlQnAzSHB4SkMx?=
 =?utf-8?B?aURjTGRmdm55elNwNUxQaU1JK0orRmZyQy9oWHc1TDY3UnBWMDhDWnJ4V2tF?=
 =?utf-8?B?eTdXeXloRmJXWis0RVNxSWxoanRGazZuN01uSHVqMEFYSjl2bDY0VWxYcHoy?=
 =?utf-8?B?akFiL20vYkRmN0Z1aEZ0dVA4M0kwN21OZ0s4RkJQaytiUW9DQmtqL2FYVHdH?=
 =?utf-8?B?TloydWNISS8rUHZHTk9Ic3FZZ0FRZzlYdFA3SXpKZFUzaXlZSlZJWGQ2Vllt?=
 =?utf-8?B?T3ZWME13Sm4xVVloMjc2OHlXSHFJbm1MUzBiM3dwZFl2cmh1Y2xRODBXSWlQ?=
 =?utf-8?B?TDM2VTNEdm5lUVdvams1Ri81RkJqck5Xa09ES25TYXZvdVlieERERnZBL0N3?=
 =?utf-8?B?amsvdkNyMDV5YXlkWU04SEpDSklKWm5sbXpXVjgvaDdZK2RKYkd1SHdySUZ4?=
 =?utf-8?B?RytOR2I1NzIxWGNVL2l5V2F6NmxiTStNMERZeUMrU0pnNWwrNndzQ1A3d1lr?=
 =?utf-8?B?QURmUGxRTldxQjJwaEtCL1RQamNvZFE0NEZLb0FSa2hzbjZxSVV3NXpwMzZD?=
 =?utf-8?B?WE1vQm5TUW9oRWpVeUswdThreTFBbnVTZmdsM2pNd2ZYdzdYNi9rL3NZbCtH?=
 =?utf-8?B?SmtMNGwwUDIrUUViSEJTSkorQkZHWmJkTWhNT05jV1hsNStTMm1mSFliYU9t?=
 =?utf-8?B?ZXdrSDVqNGxWLzFKU0RTRE1GRlNJd1c3dTljVk5JalZTUVMzR0M1QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40842e8f-4835-426c-575b-08ded132661e
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 14:19:12.7297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KPkfk/CvmeeB/Ne+518tP32wpb1JNOo8X2jUsuNTaVE/7fiuLxzHPAkmi4Vfi7LgMo71TTUp/1w5Y2dzqTUgVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7852
X-purgate-ID: tlsNG-d62444/1782224357-4B3A8E30-C9214D90/0/0
X-purgate-type: clean
X-purgate-size: 1738
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:from_mime,macbook.local:mid];
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
X-Rspamd-Queue-Id: B3B5B6B7CED

On Tue, Jun 23, 2026 at 03:46:11PM +0200, Jan Beulich wrote:
> On 23.06.2026 15:36, Oleksii Kurochko wrote:
> > On 6/23/26 12:31 PM, Roger Pau Monne wrote:
> >> The current logic in ns16550_interrupt() will loop until the device sets
> >> the NOINT in IIR.  At least on the Lenovo ThinkSystem SR630 V4 the flow
> >> control of the serial-over-lan emulated UART seems to be broken, as it
> >> doesn't set the NOINT bit consistently.  The Transmitter Holding Register
> >> Empty in LSR also seems to not be properly signaled, as even with it set
> >> writes to the transmit register take ~6ms.  This leads to the watchdog
> >> triggering very easily on such system.
> >>
> >> Introduce an upper bound on the execution time of ns16550_interrupt(), this
> >> is currently set as 4x the polling interval, which is calculated as the
> >> time to fill RX FIFO and/or empty TX FIFO.  The current maximum is 5ms.
> >> Once the timeout triggers the interrupt is disabled and the uart is
> >> switched to polling mode.
> > 
> > Don't you mmiss Fixes: tag?
> 
> Fixes: "SoL on Lenovo ThinkSystem SR630 V4"
> 
> you mean? I think there's nothing wrong with our pre-existing code, and
> the changes here instead are a workaround for some (apparently) badly
> implemented SoL.

It was on purpose that no Fixes tag was provided.

Xen code would be fine with well-behaved uarts, however most of the
serial-over-lan emulated ones are not well behaved it seems.

There's a possible issue with the unbounded loop in
ns16550_interrupt() as it's relying solely on hardware register values
to terminate, which again would be OK if hardware was correctly
implemented.  I don't think this warrants a Fixes tag.

Thanks, Roger.

