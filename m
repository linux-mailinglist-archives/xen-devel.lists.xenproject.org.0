Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 907D8C7357A
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 10:59:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166705.1493187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM1RN-0003Fd-R0; Thu, 20 Nov 2025 09:59:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166705.1493187; Thu, 20 Nov 2025 09:59:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM1RN-0003Di-NX; Thu, 20 Nov 2025 09:59:01 +0000
Received: by outflank-mailman (input) for mailman id 1166705;
 Thu, 20 Nov 2025 09:59:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vEGo=54=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vM1RM-0002vx-A9
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 09:59:00 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88507b74-c5f7-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 10:58:58 +0100 (CET)
Received: from BY1PR03MB7875.namprd03.prod.outlook.com (2603:10b6:a03:5b1::10)
 by BY5PR03MB5125.namprd03.prod.outlook.com (2603:10b6:a03:1ea::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 09:58:52 +0000
Received: from BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19]) by BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19%7]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 09:58:52 +0000
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
X-Inumbo-ID: 88507b74-c5f7-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lj4Uhx1xivNmQbsGPfN+PgcWEJPX5EUnoWEovCiM/x3G63KPOFYy/LRP7b9HFcQmTIPnfPVxKJtzuWIMs8oM3tDW2xNb+4MikSPnc+t6MaNiQWuzonob+zCZLu0NTfauen0GPy61DyHLG7S5bKSZgFCJs2+NUN7s8Hc1lRaHA1M80aZM0YQn51ZyQV7MlJXmOBynzECtuAWUrsPVkt+QjeAhildH0spNIDByc/xnUx9pJ+ADdSRCSZJ3SFEKk2D3iy+QzqQIlTivKmKq6dm4+s50AAWGH/F2QQPRkdBedSXmQetaL4c/SxAJuR9S0C6TDVLjbfIYn31DQtgKcwOqrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7sT9dG4bTppFe0E9dtJP58jC+wxTYyALuG2pVgbrgjQ=;
 b=thZEft+iQSnjwtujR28j3/Qox0Pbfc33xgnq1+HeLDPw/DQfkCG2xMsqnjUu3KMb79Ph9u1afD3Nd22x9AKq7ORrZEnUn56zpPjbHnqrR57N+n1mKd3upiBZo/+DnnRYq6nEL1gAsEN/VRbm3G/r7/LCUTcbYUO08ZnWEGM5jV+0EsjAEwSFzfm/J/Mw5pSCgMA4v4LWJKbcb0Hpkq04sdpm63yj4HWYwzB5bugpuyr78IUSV7sJHVDrXguNAX+czrdkpmLYUf1ZhSvhvAm/M4FEGeJppuMdDTXMtkxUd8WNZYIYMLg7PRWOfHLO6ITQWA/bzEyfPxvjs83pIYVYYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7sT9dG4bTppFe0E9dtJP58jC+wxTYyALuG2pVgbrgjQ=;
 b=upyxDzvy5YyZ3SzoSMRvCeCvSUr2AE2S+5Bm9SPAdL8z0sPlGoo7TSOLU7A2y9aJ3xCT7vDZQ5mApjEMl1uhmMfUvNn0mI9SH2p2A7NU8AUmmsEBH3t9c5doJMXyg86kKnMRTKAqYqJtEWsaLb5WCrLdmBN/aXhASyw7NxJzUgA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 09/12] x86/irq: convert cpumask parameter to integer in {,p}irq_set_affinity()
Date: Thu, 20 Nov 2025 10:58:23 +0100
Message-ID: <20251120095826.25782-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251120095826.25782-1-roger.pau@citrix.com>
References: <20251120090637.25087-1-roger.pau@citrix.com>
 <20251120095826.25782-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA2P292CA0019.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::17)
 To BY1PR03MB7875.namprd03.prod.outlook.com (2603:10b6:a03:5b1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7875:EE_|BY5PR03MB5125:EE_
X-MS-Office365-Filtering-Correlation-Id: 04bf01c3-2885-4cc7-32f9-08de281b68ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TVU3YW9tcUlaU004S2c3dXllVWQxYnB4MW5haUJ6QXIrVExzdUFXalg3dVJJ?=
 =?utf-8?B?VUZZVFl3MHlQT2I1RUoyamIxK3dNbUhFdnMwTnNvcERGQzdYVlVNcTd3MU5N?=
 =?utf-8?B?S1cyUEhBbXBlNlJncGVWMWgyRnNGb0ZPb1JyMGhJb0FtdUJsUHY0NDB1SjMr?=
 =?utf-8?B?aVQ2d0FYOWlzejhEVlZXVzBabnlvc3lsOE5YYzlHWGdObzl1Um5FRE9UaEov?=
 =?utf-8?B?WGdPcHhBSU0zZk5DdmlEbU84VHB0WmhtZUdtYjNtVnJDMjAxaU12QVBwQ1VC?=
 =?utf-8?B?YU55WDE0WU1nQXM5a2VlTXRZakltc3VNRXZzQTZ4OHRWb3NWejNoZGUxOHlh?=
 =?utf-8?B?aUV5RmF5WGtLamoyU29XaUJhYm0zc2xZcjJ4SnNuYldMK1JnM1RaNEppTTBF?=
 =?utf-8?B?V2Z2REIyY0ZrWjJBdWtQWXNUS0pVYlBSZUwrWTNlQ0x6UmY0SW80amsvY0d6?=
 =?utf-8?B?dy8venhlYUFxWkFqLy9qVEZZN1pIWnVFdDJXWmNrVXQ4cUZHZGNLTTcvUGZM?=
 =?utf-8?B?K21EZkQzZ0NDc1YyWXZGVVRWVXA4V2ozZitNV2tYTENrZHNVc0RkaVlvSkwy?=
 =?utf-8?B?NlBEclcwQ0pPNUt1elRBTUdocWtqZXRaUlJJbFZXWG9xY2xRRW5aNW1EelJ5?=
 =?utf-8?B?eWpwTFJWa2syWVJ3VmhIUExVbnVoMjljS25MMDNyTHZ6U1ptcXpYcUxGMjNr?=
 =?utf-8?B?TGFpL2oySCtyb1JlM3BoOGc0a3UrL0g2bWZXYk44dDI1aUJCb0NnbkpHaXBj?=
 =?utf-8?B?WXJZTnZuZ0srczNEZEVGZm52V1QyUVdmT29wWXZJV2V3Q1BHaEdNbGxRSTZs?=
 =?utf-8?B?ZnNJWnM3U1ZMQjhkYVJBdm84NU1uem4renYxUHkybVFVK012MC9uUDd6THdz?=
 =?utf-8?B?TDI0OCtpVWdIaEhoUWFDV2MxeUdLRXVmMFBWTG0vYmd4bEZ4SjJWdmNid3B0?=
 =?utf-8?B?RFdYa2R5bG8vSjhBWTcydytPRms5L0ZTUlJzR3poVnRybXhXblNmN3JXK3JX?=
 =?utf-8?B?WS80bXA1NmdDWnhoV2dsSlVFR0dqb3gyeENscmhrRjhpUXNpQnVLV3N5Y0h3?=
 =?utf-8?B?Y1JFYlhPd015WGlBQitiYk1LaUc3UHBiZ1c5eU81a3hERGp1dEYycDNZZFFm?=
 =?utf-8?B?MW13dUxpZE1QK3ZWS0h0bEtuWVZObDdGWWRmVlhyaTZLK012Q3VPUDlvOTVq?=
 =?utf-8?B?MXorNUloVWlBaEhpS09aRlkvblVPLyttMG5LRjJ0MzdtdExSamNyKzR2ZFMv?=
 =?utf-8?B?ZGpBZHg1T1BISThUT1FWZHYxZWJTOVBOYzFMMzdONS9HZ0FGcml6aHE0MzJw?=
 =?utf-8?B?WXNJMlFnTXpJYU40VktJS0Urd0VwL294UGJ4eWFxdHUrdXl0eEZMMFRUbGxT?=
 =?utf-8?B?RFhMSjcvNTV1dThKM1c4ZFlDK05McmlSVlpXamJPaTZkTXhaSmFnbFYyajJv?=
 =?utf-8?B?ZDJsM3JBMVZwNElsaGUxV2k1dE5UYW5ucndxYkV5ZVFwd3REYmI1TURJM0FX?=
 =?utf-8?B?c0VDYUlhdzFBQjRCQVZXOWtFbEh5TFZWWUpNcXU5Q1Y4MmVaQmkzbzQwNmdU?=
 =?utf-8?B?Nm9YN2NNVmpGb2dyNVN0Ym8xSVpMMmNxK281ZzdoTUVYRFBvcGRYendMOERz?=
 =?utf-8?B?eENmd21XSXZQeENSOTNsem1XVWlQeFZKUHZma3FTNDlpMkIyTDRQeXE2bllO?=
 =?utf-8?B?bDVuUFczN1NyTlNxMEhGSGdXaXRMRWJOTmFMRVh2di8ycnZ1NzB3WFdBUjl6?=
 =?utf-8?B?R2dxMUw2S1RQTU1mUVNCb01XNDdOakFhZ1lCMFdNRFNGWjBoUTN6dEZWa1VZ?=
 =?utf-8?B?K2R3WEN4SnRpY01ISWw4UUYwWDU0T3psaERhUzRlOFRtTll3UUxWMjJkbWV5?=
 =?utf-8?B?QVFBT0VkQzZzM3RmYjJ4VFVhUmErRmwrZEZ0ZjRnTFRndlJvOS9ZMUlXNzNr?=
 =?utf-8?Q?aezRHQaDCZy4hc+7LdfWjM7ag6ak6eg3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7875.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVpFVjNWUml3M3pLS2cvTEE0ckNKamRwNlpOaWJFOGJRekJibkQxS3hiVENw?=
 =?utf-8?B?SEk4ZHg5Nk53bDIrTnFZMlRhWTNzdDZYbTRWYkxqSkhPb1RvdTZOZnVQWWdY?=
 =?utf-8?B?eHBqWThTSjJJZE1PelBGUVJPRy9YTzF4WEM2RmFnTlMxdFpGVTRZUURkSmwz?=
 =?utf-8?B?Zk53RTZYMGJNRGpGMkhWQzdZcXc2eXJXdmdLV1JSdHd0MElTUUpKOHo3bHUz?=
 =?utf-8?B?dzhiUHp6OEcvR1BGMjFzU1I3VHVCS25iRENuUVg2djFrWXNGOUJEQUgvMTN5?=
 =?utf-8?B?SnFTdDY5aEZjMFhuNjE1RTZIako0N0hxd1U3cU9uNzJVclduNEdvMnd1Qnpv?=
 =?utf-8?B?eFZQbmVZN2dnS0tsMnFpTHRXc29aVDY2VHQ2c1NQbnMvMmZCNWJlOTNPaFdY?=
 =?utf-8?B?QjZpZ2xiYis2dnlIeE4xaWEvUXhPNmhwVmo0NHRPSEFPVjVESjBhcEp4R1E2?=
 =?utf-8?B?bUx0VWFiQU1qdGNFcm14dXdRbzM5L0huSmNvc0lRZEpaVjdtQnFYK2lmaDln?=
 =?utf-8?B?em4wK1drSDU0aElwckNoMFFib3ZVSW5tSjNNWnJwV3pyRk91V1VQaGRqTnEv?=
 =?utf-8?B?dFlxbjUycDVmS1preWgrTzFlWTV0ajdrdmpyUnEwUTlPclpnQ0p4LzVPZjJF?=
 =?utf-8?B?eHg0bUJRMnZndElLZWV3QzlGYTdRbDJiZldDNVRWb29HUk5WQVNVZ2dKNDhL?=
 =?utf-8?B?TGJOcXpnRWI5MjJadGJ1enB5aHRUSHRGYktMWTRDejRyZjQyKzRhRGlvcTU3?=
 =?utf-8?B?SWdYcjZNN0NGYjlnMk5kQWxCSjRJalBIdUhmblBVMjVjVGxPM3lGS2JCQjVW?=
 =?utf-8?B?YWpVbE9nVUdyaDIxQytWQjQ3Z3RqR0dPZ0FnQmJDVzkvMGoxN2xsQlE4K1I3?=
 =?utf-8?B?eEd0c2RSWm81UTBRYy9BcUUxSWdtam52OG5ON0FGVllHdVc4S01SSUZ6MEcw?=
 =?utf-8?B?NkZQL2FlYzk1VEVmV0hqMnhrWDFMTGo5NFhVKytCZmtlYldpTnpsbVMwdCtD?=
 =?utf-8?B?Y1BWcFpOZzJXbzFjNUp4ZlFLV2g0NFA5dWN4YzVkR3ZuMHFmWGR6ZjR1ODhJ?=
 =?utf-8?B?am0zR2pweHo1a2FpazFGWk9BQTdVMk9BWkJsTnU2QVNqYjVKaTBZV3VzaG13?=
 =?utf-8?B?VTgzZ25yQWEzMjdTV21nVGx6elgwNVQ0VTRRS3F0b2RncERoZFRYVjJxUGhF?=
 =?utf-8?B?VGtjVVZ3VGZQWFZRRlBNK3JtcGVVV3ltMGdVaHE1aDRXQnRKMmpEcllXZDY0?=
 =?utf-8?B?WFpnR0t0WlBmQjRJTWpraFl6MWVETC9tbkp4SHpvNCt0SmxuR3JyQXdzMENN?=
 =?utf-8?B?bU9yOEtVb25kbUMza0Y0KzdDV0NmcEkwRmVVTnJUcjE1VzBtL1cwRDBLMWc3?=
 =?utf-8?B?ZDZMNTJjanZSWUpnckZoSkpFSHl4R29rS2pOYlJBcHpjUzU2c0NPbnFwdmQ4?=
 =?utf-8?B?eDNTdWtGZzJTeG0zNFQxcm5UakxyRzAvSzI5YTlRSEVBcHg2eGljbXA3MFZP?=
 =?utf-8?B?SmQ4UjJ0WTJFa2F2Y2gwY0Y4czFFVVZVdG95S0pKRmxEV2V2M0t6Y3F6eURL?=
 =?utf-8?B?Y2hBRjVBZzZES2xNeEM1S0w5NERCeVFIelF4Z3NVVjBLRFlneUlrTngwbmNJ?=
 =?utf-8?B?Z1F4RXRZNzFCKzRlcVlEUGRBTkVpQVB1WTBQS0xrUDFjTituWWtUUk5scXJl?=
 =?utf-8?B?My9sa2loWis5MFFoVlltY0xZc0lORGppOTlOT3Z6aUVTbTZMQTdzU3Y0NTQ5?=
 =?utf-8?B?UGRpQkI0Qm9HQ2NzWkxGV216cndkSUVxUng2emIzSS91Q29jSU0rcE1hLzc1?=
 =?utf-8?B?YkRycTRYd3dtalVheEZjMDl1WHdNOWhhRmZvZ3BBSXJUNzAzckdLR0xRbkU1?=
 =?utf-8?B?YWJaQVNUQ0ErbDhkcG5HamVJVkRsN3dDcUJZWUlDSG40UWRiL0tKMGI0UmhB?=
 =?utf-8?B?anRqc2pJMmw3UmF1N3ZybnViNTk4VUdwNVpUcG91RjlBVitpeWxtUWFVbUNW?=
 =?utf-8?B?MVZobjQrckZHb0d3WTNLVjIvVnRVaC9qR0k1VmhIejFBVDV1cmt2bHZ0ZHh0?=
 =?utf-8?B?ZkRUNVhrZUdkUm5sQkFTTDNIL1VUb215Z2kwTGtqQm1BS3ZmQ3FMZTk5Sk1H?=
 =?utf-8?Q?hAYQgqvRJG9NnVKhQ5mSUwvpg?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04bf01c3-2885-4cc7-32f9-08de281b68ef
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7875.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 09:58:52.5026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R0+XDPdeoleE49fMrYptP+dt1qUVB1tCYTVhzzJWitA4a5watpW3JIJ5r4Dilw0LD5HsX4dQ83lWq6z+4oASqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5125

Existing callers where already generating the passed cpumask using
cpumask_of() to contain a single target CPU.  Reduce complexity by passing
the single target CPU as an integer parameter.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
The function names are misleading, as {,p}irq_set_affinity() doesn't adjust
the affinity of the interrupt (desc->affinity) but the interrupt target
itself.  Further cleanup might be helpful to correctly differentiate
between setting interrupt affinity vs setting interrupt target.
---
 xen/arch/x86/hvm/hvm.c         | 2 +-
 xen/arch/x86/include/asm/irq.h | 2 +-
 xen/arch/x86/irq.c             | 8 ++++----
 xen/common/event_channel.c     | 6 ++----
 xen/include/xen/irq.h          | 3 +--
 5 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 0ff242d4a0d6..33521599a844 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -485,7 +485,7 @@ void hvm_migrate_pirq(struct hvm_pirq_dpci *pirq_dpci, const struct vcpu *v)
         if ( !desc )
             return;
         ASSERT(MSI_IRQ(desc - irq_desc));
-        irq_set_affinity(desc, cpumask_of(v->processor));
+        irq_set_affinity(desc, v->processor);
         spin_unlock_irq(&desc->lock);
     }
 }
diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/irq.h
index 355332188932..73abc8323a8d 100644
--- a/xen/arch/x86/include/asm/irq.h
+++ b/xen/arch/x86/include/asm/irq.h
@@ -202,7 +202,7 @@ void move_masked_irq(struct irq_desc *desc);
 int bind_irq_vector(int irq, int vector, unsigned int cpu);
 
 void cf_check end_nonmaskable_irq(struct irq_desc *desc, uint8_t vector);
-void irq_set_affinity(struct irq_desc *desc, const cpumask_t *mask);
+void irq_set_affinity(struct irq_desc *desc, unsigned int cpu);
 
 int init_domain_irq_mapping(struct domain *d);
 void cleanup_domain_irq_mapping(struct domain *d);
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index e09559fce856..bfb94852a6dc 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -947,7 +947,7 @@ unsigned int set_desc_affinity(struct irq_desc *desc, const cpumask_t *mask)
 }
 
 /* For re-setting irq interrupt affinity for specific irq */
-void irq_set_affinity(struct irq_desc *desc, const cpumask_t *mask)
+void irq_set_affinity(struct irq_desc *desc, unsigned int cpu)
 {
     if (!desc->handler->set_affinity)
         return;
@@ -955,19 +955,19 @@ void irq_set_affinity(struct irq_desc *desc, const cpumask_t *mask)
     ASSERT(spin_is_locked(&desc->lock));
     desc->status &= ~IRQ_MOVE_PENDING;
     smp_wmb();
-    cpumask_copy(desc->arch.pending_mask, mask);
+    cpumask_copy(desc->arch.pending_mask, cpumask_of(cpu));
     smp_wmb();
     desc->status |= IRQ_MOVE_PENDING;
 }
 
-void pirq_set_affinity(struct domain *d, int pirq, const cpumask_t *mask)
+void pirq_set_affinity(struct domain *d, int pirq, unsigned int cpu)
 {
     unsigned long flags;
     struct irq_desc *desc = domain_spin_lock_irq_desc(d, pirq, &flags);
 
     if ( !desc )
         return;
-    irq_set_affinity(desc, mask);
+    irq_set_affinity(desc, cpu);
     spin_unlock_irqrestore(&desc->lock, flags);
 }
 
diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index 67700b050ad1..8e155649b171 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -1226,8 +1226,7 @@ int evtchn_bind_vcpu(evtchn_port_t port, unsigned int vcpu_id)
             break;
         unlink_pirq_port(chn, d->vcpu[chn->notify_vcpu_id]);
         chn->notify_vcpu_id = v->vcpu_id;
-        pirq_set_affinity(d, chn->u.pirq.irq,
-                          cpumask_of(v->processor));
+        pirq_set_affinity(d, chn->u.pirq.irq, v->processor);
         link_pirq_port(port, chn, v);
         break;
 #endif
@@ -1712,7 +1711,6 @@ void evtchn_destroy_final(struct domain *d)
 void evtchn_move_pirqs(struct vcpu *v)
 {
     struct domain *d = v->domain;
-    const cpumask_t *mask = cpumask_of(v->processor);
     unsigned int port;
     struct evtchn *chn;
 
@@ -1720,7 +1718,7 @@ void evtchn_move_pirqs(struct vcpu *v)
     for ( port = v->pirq_evtchn_head; port; port = chn->u.pirq.next_port )
     {
         chn = evtchn_from_port(d, port);
-        pirq_set_affinity(d, chn->u.pirq.irq, mask);
+        pirq_set_affinity(d, chn->u.pirq.irq, v->processor);
     }
     read_unlock(&d->event_lock);
 }
diff --git a/xen/include/xen/irq.h b/xen/include/xen/irq.h
index 95034c0d6bb5..f0b119d23521 100644
--- a/xen/include/xen/irq.h
+++ b/xen/include/xen/irq.h
@@ -193,8 +193,7 @@ extern void desc_guest_eoi(struct irq_desc *desc, struct pirq *pirq);
 extern int pirq_guest_unmask(struct domain *d);
 extern int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share);
 extern void pirq_guest_unbind(struct domain *d, struct pirq *pirq);
-extern void pirq_set_affinity(struct domain *d, int pirq,
-                              const cpumask_t *mask);
+extern void pirq_set_affinity(struct domain *d, int pirq, unsigned int cpu);
 extern struct irq_desc *domain_spin_lock_irq_desc(
     struct domain *d, int pirq, unsigned long *pflags);
 extern struct irq_desc *pirq_spin_lock_irq_desc(
-- 
2.51.0


