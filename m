Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 5tBJCc9x+2k+bQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 18:52:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC104DE595
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 18:52:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301967.1576074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKfTv-0001jr-F8; Wed, 06 May 2026 16:52:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301967.1576074; Wed, 06 May 2026 16:52:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKfTv-0001iQ-CS; Wed, 06 May 2026 16:52:19 +0000
Received: by outflank-mailman (input) for mailman id 1301967;
 Wed, 06 May 2026 16:52:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wKfTt-0001iK-Lv
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 16:52:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKfTs-00AJfb-Vh
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 18:52:16 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69fb7193-bab6-0a2a0a5309dd-0a2a4502cb68-46
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 18:52:16 +0200
Received: from [52.101.43.50]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69fb71bf-af86-0a2a45020019-34652b3249fd-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 18:52:16 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ0PR03MB6568.namprd03.prod.outlook.com (2603:10b6:a03:389::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 16:52:09 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 16:52:09 +0000
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
 b=VxSM9TXGYRacBjOsRihuvJ5h/hw97Ul9Kf5vdr5N3dKrBzm6SMbvzaCYgvLTFDAAdqA3QLhk3cRsstlWBn1yJnaAmyBPizGnw4t80WfK6h54++0VvFEa848XmnGs2OzjkEMTyAzeMpswL3jvkCVk8twW1lV3Funz+BfIsqrcCV35C7Zze3E5vz5m/yvZ3XWn6tvvQEABOs2IY8sTicv0SYZO8KPA0fUlNRC20dKxUKVxBjjlV8dffgD6y9rsPeAwlp7tR3gP0cWYI3In6yHwL1/F/ulEookm3ivvaV33A7HPeyQvnj5mPcisngd19UsmD7R0oysycic50VaHr3A3aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qRsVMi3aCHHsSZGbjOWEhlRKqUKLp76UEvs/9bSBSOY=;
 b=M8Gf3gRsS45VfpxOBULRHLu97WAz+rwGd9cIvQ+jC2yKjGh1k9UydMRFSWe3+/1P7zplDuBU8aNBYK71FxWVO9ZfxbHoRZUA0zxNOt98QwiZg5OpEItsHe7CsDfQiCXTOAugsqEHVdRdewWGAc/rVV0I3K7mccVjV4I9EE3SAhzO+qV+zWE49bTrT0XruAfuCEDlY7gS5aQWcoYCCMhraBgo5m8PGkY5y44rIu1/0B4OF0L7FWRJl9wlIPegyhJBX3iiEhSzddZLJG0BJbeJAOdWJcBVgBKb08guMSZztxPIlm9/l7f7voeK1lm1Pn6DkFTICDM5JxDk+HVVl4jpfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qRsVMi3aCHHsSZGbjOWEhlRKqUKLp76UEvs/9bSBSOY=;
 b=v0wRmM8wBqCyi0XR6RozHxwZg6/5XrJmjG3VF3bJbdHXl2FcgWNpXLG2ycG7Me8ENe6OQff5cgarXm/d/FytD5eJ1kkoF2HYC9/YTgJ+yepboNZi/HHnx+tr9FSGBrRBGbTqqkoK91QAXtCKAdyPZNkJzDmwV1DwWNLoNkO9XLE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v3] iommu/amd-vi: do not zero IOMMU MMIO region
Date: Wed,  6 May 2026 18:51:57 +0200
Message-ID: <20260506165157.68567-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0087.namprd03.prod.outlook.com
 (2603:10b6:408:fc::32) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ0PR03MB6568:EE_
X-MS-Office365-Filtering-Correlation-Id: 69bcbedd-eb39-4e3d-cc33-08deab8fd02b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	9tB9kNlIkVlOuJA+CFKf/O5pHrblWyqEpS2vOiZfb8XbBaLWDgC7Tr5G23lQjNrc8BYQGBfp3VC2MWl8YDEHbxfW/PoX2EwW38qdPjyBK3LBskFHSOiJKXJM9TTBF5yHf4GJEVmUTTNhVKZRsCHKaZQ1KaFYfYNIwdu632YTj1eda3/W/TvRMdPQQLT7GpsAoLE4S/D+JjHdzRTI1t7Uu6e7YKC9l4yk1vYzFrU5MxH4+k2J8a4ap8biwTkZuRjeN5JeQKqEoMC65/t0ihYQ6pWkM58jEQTLID5z76vm74nvGrFq3GdE8va2gZdTXj+wPzDfHgMtpL5qojCUk2ZpmTDpEGmCzHUrOBGwLhYQ+9QrcySpkRz8FHzQa7UXhZZ/+B5ge6a1DDAzSNuF8fFEiaQ1NdrYqTNkwkKnfVjFzdBovdHYICkr37cwRM82QSsM9XpvRXu3opq3o9IwILEi1QlcY+HSCoBYDFwRz0beWZqCNcaVbiz+be/S3sw+xs6/rJnDeei8rNtv20Fme8lGp0cnV9lDmSuiLxiAM4rZoTFOET5GmpY+BN4xXqfzrwUX5Aagu2ok21irqEHLoz1vzVkRORa3ZMmsYFDGmugn9RLQqUkrWryfGRrMz6dxAT/BYSI8jQy1r+MEqemRH4oXWVpnwFE7z/jXl8KIrTQQkMxrq7bfYwSNY8hAQGL5++oy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bEM1NnRhdGhCeWdENnJwU0RUeVZ4MHUrczIvcWREU25SenpUVm5XYkpsNlVw?=
 =?utf-8?B?NXlMelFqMWRNWk9TQ2JrT2x0UVE4OFl1WE5memh4KzY4S09JejZodld0QW1X?=
 =?utf-8?B?TWFyZ1Z6bTBZVTRCNyttbmROdjNEckVPcVRyanFTNjlsSXphOWY2TnhTRE5k?=
 =?utf-8?B?UGc0L2FWRU1VeG04TDg4dndjMmtaSmcwQzV0NXNGNXI4RHNnT3ZLSEZ5WklY?=
 =?utf-8?B?eUFVRTQ1TmVPRTNBWVZEbk5aazg1ZVp0a0t1UENDcVhiTHBUcU8rUitjVkpi?=
 =?utf-8?B?YWJlbnpHTWx5Wmo5SXVSMm1ISmwyUmlDem83WGgxcUtwOUxmYXZSdk9jTGJm?=
 =?utf-8?B?ZjZJNi9qM2NRamFHQUU3SkRmTUQrVkxHb3hlVWVUVVcrUWVTL1NTaEErcURi?=
 =?utf-8?B?a3FPMVcwUW0vL0VxUWF2QmJlZHN6R3B1V0hzR0NGRTFSVUNoRXp1MzhteDdq?=
 =?utf-8?B?MlJaVnFEV2lNNHhUa0ZnVFVPV2ZQQ0VBVk0vWXpWOXg0WDFaZkpQQjA4anFV?=
 =?utf-8?B?OU9KZGlxKzZBandRVGYxV1Fyd25STzBRaGRsZ05lbFBKM0NhRHRJTzBxZWtR?=
 =?utf-8?B?dkhmQ0pMSzIyenlDNVZWaVh2TjIrdzB5Zm04dUNGcGY3NkhOR3pId3Q3SDM2?=
 =?utf-8?B?TjJ5U2l4aTJpcHdnUGtTZU1VYTh4L1NNZVB5Vkc1aWZIMXlEWmpWNk9HMTIw?=
 =?utf-8?B?bktaQkpRTFJFVFNPVkVCLzRDQUExT05oYlU4K2dnQjVvQk8yY2Q1VTBWWGI1?=
 =?utf-8?B?TEsrNGIrM0paQ0VkaWthcVZPRXhoaWRrNWNlMUVHK25tcWN0VVJOb2swWGtU?=
 =?utf-8?B?ZFNKYlk5bzdCS0kxWFRpUzFWdENnUStpVW5UVWxvU21sN0owSzdOTlhqbHhy?=
 =?utf-8?B?NkhtNk83aCs4SmlRcjUyMEVUV2F1dlRrQ1k0RWV3am1QKzJtZ04vUVNqNWl0?=
 =?utf-8?B?ZlpDQ2swaWdRY1djSDUzNnZQZzZOMVkwQ0ExNjZ1SnpFVXhaZ3RoYTJ0amlk?=
 =?utf-8?B?ZFZxeE51SkxySkRSbmJUNEs1TEtZUlB4YlgvV0FMS3Nla21nNm1idWhVNWYz?=
 =?utf-8?B?dmZtVkw4bDJBWTIzREhPNzk0d3dUV1YrV1dmcG5haFl4djBFM1MxcC9qaXBr?=
 =?utf-8?B?LzFEa2dPTE4ydXNtV1M2elZzb1BMakh3ZnVsdXd0NlJmckl1dE0yR3h0dmJi?=
 =?utf-8?B?N3JnSVR0OFRZNVE1TnhvaWxLeDJzZTloOVBtaEp3RktTa1NZUDlwWXREREIy?=
 =?utf-8?B?aTI2a1JaWlUza2NzalhEcGVYZk9aVUFDQ1FEZUVwaGEzbHlBTDdpVThtU2Z0?=
 =?utf-8?B?b3NGYWJkUHVXeExGbU1YeTRjZkl0MitIN1NrS0dPOTZjQkVtbWNtbjdrTTQ2?=
 =?utf-8?B?SkVaeVU0UFFGS0dySEk1cEtXY1RXMVpjOHhtaVJxQ1IzWDJSbTV4dUJUMERn?=
 =?utf-8?B?L1VjZGlqN3FTWCs1eDVrQWgvcVJKYVJmS1lBNkVBMjdEMUVBZHhtQ2dqOE96?=
 =?utf-8?B?SDFxS2tSZUhGRFp1SjlNYldvZnhVWWNXaEpzdWY1Z1Azbk5LS2RVamQwRXNm?=
 =?utf-8?B?NDcyRGV2SjhBeTRpMmtRcDZvNUpBMWVWUTZxdldtTFk0UVp4cEh0bFV2R2tr?=
 =?utf-8?B?WUhvWnpsODdTeFNWSzlrWnI1RzladVJmNGV3RVduZFZmZk5QQkw3Wk1uZXRJ?=
 =?utf-8?B?RXVITGV0VkRBdTNJU08xMk1WT0RwanRLajlPMmtTdzVqL2c5Rmt3T1Flcjdo?=
 =?utf-8?B?ZFRJQTR5UDg5cU1yYUpCSnFDN2p5RTJFamhvM3NnNDdSVG5lTkZRK3RCUlkw?=
 =?utf-8?B?VDJ1UE5sekViWEhnSDdPbUdnNU9wcEpYTzRsVkw2bS9VTW9KQS81UGN6M042?=
 =?utf-8?B?aHEyQXErNGluMTk3UG1CZjRXaGorZ3BDeU9TNXN1eHNrVEQ1R2w0SWo1eWox?=
 =?utf-8?B?U0ozS2hsZkdBVFhieFRSZUk1S2JzalJhc1ZwWGE4NmYvaUd3V0hjeDhJTnRJ?=
 =?utf-8?B?RTUzUWZUTUdYVGVwSnYxaldMOGpDeEFnaXErRElTa0haODlWU2N0c1c1VGlp?=
 =?utf-8?B?WkJ5VjRMWlY5ZXlUT1M3aWFwclBjc3F4NUkzQ29TUGV3VC9OKyt3UG95QTEw?=
 =?utf-8?B?QzZOOXFQWG9DbzNzeDBVWmZNdm9BZTY0dDFkYnpnK3VzUWQ0VENEKy9lVlBi?=
 =?utf-8?B?b2dQU1N3UlJjUFBkY2ZNZmJodWtpVmpkemVWQzJWZ29OVldRTGp3b1FCLzhC?=
 =?utf-8?B?cncxNjlKdVNsTHhiV3VIa1hiclVhUytiZDlqVWVidi9ta0RWaEkwZ2dBT3JI?=
 =?utf-8?B?R1M5SFY5dG0xN1l0Qlo2b2Z4OU9PMG12WG9VZXJoSzFsOGxNdWFMZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69bcbedd-eb39-4e3d-cc33-08deab8fd02b
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 16:52:09.6972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ySwTQ+lsUmUtaLUE2qFuLpX6EoxmjIDwWz2zquqtXdRQ+PmsNXJo7eFsno9n1m8jtvLfwhjZKLAgd28Pj4Z7lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6568
X-purgate-ID: tlsNG-720697/1778086336-80B78161-13417BB8/0/0
X-purgate-type: clean
X-purgate-size: 3407
X-Rspamd-Queue-Id: 5AC104DE595
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:dkim,citrix.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

Attempting to memset the whole IOMMU MMIO region to zero is dangerous to
say the least.  We don't know what registers might be there, nor which
values might be safe for those registers.  On a forthcoming platform doing
the zeroing of the MMIO region does put the IOMMU in a broken state, which
is not recoverable by the IOMMU initialization procedure in Xen.

Instead just zero the control register, which mimics the current behavior
with regards to how the control register is handled, and ensures the IOMU
setup is done with the unit disabled.  This approach will need revisiting
in order to support Preboot DMA Protection.

Fold map_iommu_mmio_region() into its only caller, as the function body is
just an ioremap() call after the removal of the memset().

Fixes: 0700c962ac2d ("Add AMD IOMMU support into hypervisor")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Avoid the disable_iommu() dance.
 - Expand commit message a bit.

Changes since v1:
 - Zero the control register after calling disable_iommu().
 - Print a warning message if the IOMMU is handed enabled to Xen from
   firmware.
 - Fix commit log grammar issues.
---
 xen/drivers/passthrough/amd/iommu_init.c | 33 ++++++++++++++----------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
index d77dd8511288..e0c8925c33f7 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -42,18 +42,6 @@ static bool iommu_has_ht_flag(struct amd_iommu *iommu, u8 mask)
     return iommu->ht_flags & mask;
 }
 
-static int __init map_iommu_mmio_region(struct amd_iommu *iommu)
-{
-    iommu->mmio_base = ioremap(iommu->mmio_base_phys,
-                               IOMMU_MMIO_REGION_LENGTH);
-    if ( !iommu->mmio_base )
-        return -ENOMEM;
-
-    memset(iommu->mmio_base, 0, IOMMU_MMIO_REGION_LENGTH);
-
-    return 0;
-}
-
 static void __init unmap_iommu_mmio_region(struct amd_iommu *iommu)
 {
     if ( iommu->mmio_base )
@@ -1367,11 +1355,14 @@ static int __init amd_iommu_prepare_one(struct amd_iommu *iommu)
 {
     int rc = alloc_ivrs_mappings(iommu->sbdf.seg);
 
-    if ( !rc )
-        rc = map_iommu_mmio_region(iommu);
     if ( rc )
         return rc;
 
+    iommu->mmio_base = ioremap(iommu->mmio_base_phys,
+                               IOMMU_MMIO_REGION_LENGTH);
+    if ( !iommu->mmio_base )
+        return -ENOMEM;
+
     get_iommu_features(iommu);
 
     /*
@@ -1381,6 +1372,20 @@ static int __init amd_iommu_prepare_one(struct amd_iommu *iommu)
     if ( amd_iommu_max_paging_mode < amd_iommu_min_paging_mode )
         return -ERANGE;
 
+    /*
+     * Check whether the IOMMU is already enabled and unconditionally disable
+     * it (zero the control register) ahead of Xen setup.  Needs to be
+     * revisited to support Preboot DMA Protection.
+     */
+    iommu->ctrl.raw = readq(iommu->mmio_base + IOMMU_CONTROL_MMIO_OFFSET);
+    if ( iommu->ctrl.iommu_en )
+        printk(XENLOG_WARNING
+               "AMD-Vi: IOMMU %pp enabled by firmware (ctrl %016lx)\n",
+               &iommu->sbdf, iommu->ctrl.raw);
+
+    iommu->ctrl.raw = 0;
+    writeq(0, iommu->mmio_base + IOMMU_CONTROL_MMIO_OFFSET);
+
     return 0;
 }
 
-- 
2.53.0


