Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB1FC73578
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 10:59:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166700.1493157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM1RA-0002Sw-0p; Thu, 20 Nov 2025 09:58:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166700.1493157; Thu, 20 Nov 2025 09:58:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM1R9-0002RN-UI; Thu, 20 Nov 2025 09:58:47 +0000
Received: by outflank-mailman (input) for mailman id 1166700;
 Thu, 20 Nov 2025 09:58:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vEGo=54=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vM1R8-0002R9-J2
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 09:58:46 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f5e6774-c5f7-11f0-9d18-b5c5bf9af7f9;
 Thu, 20 Nov 2025 10:58:44 +0100 (CET)
Received: from BY1PR03MB7875.namprd03.prod.outlook.com (2603:10b6:a03:5b1::10)
 by BY5PR03MB5125.namprd03.prod.outlook.com (2603:10b6:a03:1ea::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 09:58:40 +0000
Received: from BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19]) by BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19%7]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 09:58:40 +0000
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
X-Inumbo-ID: 7f5e6774-c5f7-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ADpMoeAcTgDM8rPgw2x75ewDyV5byGFNXkd1QaFg1g+CZFyJGtZR0wvkdb1fM23YI4OhLKUbzzlkK/0mDGPG7EDwgjsT2UZiWPhN1P2qQPPZAouMWs5TnNdjxZPFkh+UZvRz6OG/E0DxSI/6ftQiGddlIu3fqjeHZ70NQuallmvx/2lWa1UienyoN8GUcfLciOulKQky9WME3MyI6N0zjNckqnjHWzvka92Tmj+NH/rFnVqkk+7d17cQ1CVFleWEvHQ9eh28k1UHJyhFmMTdf+UKR97JtAJT5cYVWX7/0Y0CweWQ+JKcmeEwBqgufL2+B443IDGyRyiQ2wOTbNNdVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2DM/Ls3+WQjhJwVSqMkgHe3aqCBOgWK7VQBwBqIPy7I=;
 b=waJv55VpcY78DIx1jYeb87oBY4j4XCYc/Cjt6hGlBWGKdUC+vvc+1GshqmCngL0j58uU+qFX8bMQ3k0dKRjVipBv8pHS2fIEGCWORF4TVpMf6lJ20KalruS+xCOB8U7YiXKiAW6pIESvkMpbeHJbjaUstNVp3rGc3kybgMVKhYciicNNFU9YXckVamD+C0IvrfCvLEl0siMnbP+Y6JgIrJuWNm/dT5j0E8heBBu2iWdSxErk7CpZ0AF61KpLzKNgSc8RTUzj4KR/DkpQiCqBeOlZWqsRIShhYuZFT0PislQiOCyBArgw7+kGWDAaktgRn6/Nq06PXTw3dFdvnUM/hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2DM/Ls3+WQjhJwVSqMkgHe3aqCBOgWK7VQBwBqIPy7I=;
 b=a8QfX7vi4BiFAWAo5XS+vKp48b1HpuXTcuvJMwOYLzg3/0ehKftTJ2MkbMmVU/9KQvPH8nxx2UMGos/839qRfzfGaHu6d7NEQDNxBilPhuIudRMxm2+u8De11cNrjbLQB6leR3JwE9zgCio9UwECqFOgLkZzyySDHssvUcBnssg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 06/12] x86/i8259: redo workaround for AMD spurious PIC interrupts
Date: Thu, 20 Nov 2025 10:58:20 +0100
Message-ID: <20251120095826.25782-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251120090637.25087-1-roger.pau@citrix.com>
References: <20251120090637.25087-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA2P292CA0019.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::17)
 To BY1PR03MB7875.namprd03.prod.outlook.com (2603:10b6:a03:5b1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7875:EE_|BY5PR03MB5125:EE_
X-MS-Office365-Filtering-Correlation-Id: bea9827c-637f-46b9-d44f-08de281b61e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y3Y2Um5zVGw0ZG00dnB0cDlLWk5TSDA5OWRFa3l5TStDb2N1RVRkK0JmUUVV?=
 =?utf-8?B?KzR1R0h1UzY2NEpnKyt4ZnFaZjZHUXV6dTJRUkZwa3AveGFWQ0ZKYXFxR0FT?=
 =?utf-8?B?QUFKUEZCWHFZRVB3dDh4MTc3ODVQdGJpSllqV2F4MHpEa285ckZUWUlrOGt2?=
 =?utf-8?B?V3FBTFlxazd0dkhXdzFPck01VnludHBKUkpveTU1K3hJcitEMUdrblpVbzRE?=
 =?utf-8?B?eDh6K2wzcDZydFdIc1Jtd0dUNWNEbUpqcDVEdEVya29vWVgvZ0x1UjlHcjZG?=
 =?utf-8?B?aUJZcTNmVVZqWktjTmdjdFo1NHZsZUU1dFJlUWE0b0hjTDU4bU9SamhXeDR1?=
 =?utf-8?B?Z2NPNE1sUGZkc1JPb1lMcUtFQmMxMXFCbWZZbzFtWUJoZXlGM1FUb0h5eTMw?=
 =?utf-8?B?cVVRa1I2bFlqKzhZY3BLakZic1VmMHZaWUo3YWxBYjZwLy9tc3VNMUpmamF6?=
 =?utf-8?B?RGRpRVNYaHVicUtOY0JxQ2dZVmpFZ0w1Rld0NHNPNFlzQmQ2dHd2K3d0VUE3?=
 =?utf-8?B?dkd3U1dYc09YQXFpZ01vUU9OQ2JNTVdUL293UWNlODByTURaL1l5aVJwdFI2?=
 =?utf-8?B?dEVoNXpOTUpxTmtPb0ZvWDJnUksvdHBHeVFrL1dSWFpsdWdmdUlLQ2R0Tnh3?=
 =?utf-8?B?ZFVudTZTNVZTSnEzRW9NMWgxNnBEZmRmNFJ2NEVaRnNyaXZ1WUVkeEw1dzBI?=
 =?utf-8?B?VnFqa2tNOGNrYmdXcDUxM21LcmlHSVVTblRTcWdZeXpqN01peHoza2NsODlF?=
 =?utf-8?B?T2Z4WjVNZGlDSXlFTkhpNXgrOE40VmlYbmhDRWJXS201R24rSzcrT294eTE2?=
 =?utf-8?B?aVhUWDRJcXJYb3VZeGJCWllwTG9YYlUybUpPa0FXZFV6VU51Mm5LWGMxV3JV?=
 =?utf-8?B?b0YwMkxLeUUzZ0JHejN2WEd4OXp6ZmY3VlFrcnJmWG5PTEdrT3FIK0NJU0M3?=
 =?utf-8?B?V3puZ0tXMkJsSTV1Q1FOUGVmcFA4YmpaTjlsaVpmVGg2VWdhbFFJamlOdExL?=
 =?utf-8?B?aTlnSFRoVjM1aFNIVVVKNExuMWhoRHZtdW1VbEdrd1h4aUFySERFeHpvZnJK?=
 =?utf-8?B?VzV5Z0xqMm9tVWxaQllJaGQ1NXJzb0RHdGFIWGw4WEx3VXVWTk14dXFtYzhq?=
 =?utf-8?B?MTdHWTl3SkNuaFJxUlpkeFJpNDUvdStaZkNTQVNCVEZGd3daNFp3RjVBcW9a?=
 =?utf-8?B?b0d0NWtTcVBUWDdVdmtIU0kwUXJwaHlqV29zWSs3UUhWam1sZk9qYmZRN0Zp?=
 =?utf-8?B?cUdmTnl6S0p2WG4xenczL2dnSElGZGZudGYxM1J6Z1ZRdFpoTTdIN1YvWHVG?=
 =?utf-8?B?QjlmanhyUDQyMklLNzcyeGJ5VFQ1bytvYWlkTXJ5R2xQZXc1R1RyQVRwdUtH?=
 =?utf-8?B?ZVdtSm1leVhMWWF3a2tudFMwbHAwcklzcm13RklYdmlhZGxEVE83czlTQVFB?=
 =?utf-8?B?WXFIYlVVck1Nbngrd2tweUxCUDNvc0FlSEt0cWllSGpuaytwR1cxZHdQM2xu?=
 =?utf-8?B?eE9VeTdUcm53YmhSQWJMeGVGN3plWUVndmR0eU1QMnlFWGN3RlJnNWxKckxr?=
 =?utf-8?B?L1NjQWgvdkkwbUsrMFZTQWhobUJnQVVBQytKSWo4dlN0TE1tOTk5cEozSmVr?=
 =?utf-8?B?TzIzRVl0QmVlckJ0dlNJNFhJVjlDOXV6OUxTeVRPbzA5akdiaE5kMTNiUnBM?=
 =?utf-8?B?MVhNdklQekVsV25oQXNZSk5TR0c4RW93bjMyQVcyR2pMNUE5T1pFT0MwSjhX?=
 =?utf-8?B?MTVqMHJRbUUwa0cyNWFXUnhMaHgwZFdQNFpPRmNsUEFtcC9GeU0vSmQvdDFC?=
 =?utf-8?B?eThpc1g5amR1eHNEZFZGbkRvdjZoV1Z0cTNGUVcwYXlidUpRVUR5TzdGaEl2?=
 =?utf-8?B?VC9ITkd1UFBMcmxpVEpsMjZCVkEzYzUxcFdESUkySFcrZE9BRG84YUl4cnd1?=
 =?utf-8?Q?7Sk2QwgTOdFU32y+d9M0UUfSRRsqXNrP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7875.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WllTMHpHbitLbzlwdE9Za29NT0FVU1E1MDdZdzBUMy9KMFdDQ1JLcmErVWlH?=
 =?utf-8?B?U1pEUzdKNFNsMVhGSWJTNTllQUlKaVFDY2hncWpUSWRKcUgrRUltak9tWlU2?=
 =?utf-8?B?RG5HaTVMMmxUS3o3RUcveHMyYVV2OFZHRW1GN0MyVTRIWFFoVmErb0laakRi?=
 =?utf-8?B?VFRwd3JIQjJnR1REdWNkVGFhdDF4UVFEb2JDNFVDZG8rM0NCYktWMXZQUngr?=
 =?utf-8?B?cmFNekp6YkZNdFhuUmY3T21ESzlYRWgwdURUckpqbmlPWVFZYVFaLzk3TDBC?=
 =?utf-8?B?SEVJUVNqVFllMWZsRUJxYzlFUzBzTG11M1JpaVFjME8zOXpMVVBvOEg3RkxF?=
 =?utf-8?B?ajJDSEc4MGtJZGZXMUlUNS94RkUreFFtRjVqdGMzOEFpV2R6dy9wdDlIK0h4?=
 =?utf-8?B?RVRGVk80Y3FHR2dzV2loR0UvQXE5eXBBZXNqRllZdlRBOEdFenhRVDF5OVZn?=
 =?utf-8?B?TW9EbWdhK2FaRW9haHlHcGRSSGE3ZWZSNU9aZ2ppR3pXditRaDhHbXdnQU1Z?=
 =?utf-8?B?U1lFc2RVTEVtOGJxOXM2emx0VVk3Rnhmei9UV1I0bm1IMy9ZOHd4V1c0eWly?=
 =?utf-8?B?ZHRZdzBkb3h2VmVjUjQvZGVtU0xveGdwK1J3ckJCbGtldjhHaUxsRjlaU29T?=
 =?utf-8?B?OFpRNytwbjQyc3huMnNybEppQWRPd0t3NHJ6SnhyWmgreHJDalVTbTlYSEho?=
 =?utf-8?B?N0Z3aVlCQkhOTXhBZmpBWWhGTHdRRFJCcmxZczFPVkt4NUkvRjJkWHE0aWlr?=
 =?utf-8?B?UHFEK3p2V09Xd1hIeGdVL1pqK1ErOFhxTXhtOFVJV2lPV3JuTStkTWk0dCtD?=
 =?utf-8?B?bWYzTVlLL29IZDdZbzkwLzNiR3QvdmNlWEhnWVJXRlU1ZElRZElBcnlVenh0?=
 =?utf-8?B?Z2JsV2YyUVlhQ1dXU0QyM05uQ05NMlFyZTFILzk5YUZaeVZhQjdLYlZPRkhU?=
 =?utf-8?B?S1pTZ2FlYmRKeWNmbmZ0alVydmhicHJ3WjRHVHRPc0xVL09GYVAzMjVzRDJn?=
 =?utf-8?B?VzM5dWxHQllDWkJSbkJUZUNxakNrREphQTdudGtaUDR1Y3RnRHFCdGMrK2JS?=
 =?utf-8?B?blNseHBGUU5EZkoxRStYU1BOMncwNHFjNG1kc0JxTmF2OEZ2d1d4TlpaNHQ5?=
 =?utf-8?B?THF4bG5SdTdlalNHSWZEK1Q5RU1hd2tTSWlONnJjdUhYNTNibmtyK29oTFVD?=
 =?utf-8?B?MVRvckVNOEJyNWJUSjdTYlhseGthWndtajdtaGtXK28zWEFpRERFdFJQRU90?=
 =?utf-8?B?VTFPdUZGMHRwem9NUkNMTVV3TmM0MUpoN1ZXRU14N2NrdWpMT0oxSVhkQmIr?=
 =?utf-8?B?SXNXeVR1N2tNVTl5eEcyL21mSzVRaytjYVc0UWt6T091QUo0QXFDNWNucjZr?=
 =?utf-8?B?Y1hNdXZQQkFyak9PZFZhRVJ5YU8xd202RVBJaEIvUmZHbjF0dzJ4bElncm4v?=
 =?utf-8?B?aGJieDVPbWFXMlhLdVk1U1ltWUJ4UExMZDJXL2ljN0ZtUGlxb2sydDcyUjhI?=
 =?utf-8?B?MlhqbkF2RXdnZS81UzBCNW9wVWtJU3pZeHFObnNHakpRVFlzeWtOVGF1SXo1?=
 =?utf-8?B?d1FjSTYzdExRTE00cWdnYURDRGJaQzV0VVo4TDBQUGRjQ012RUJUR3l0YmFD?=
 =?utf-8?B?YXFuOGdCZjhsdHh4UFBDMjBmTnRia28zL09SK3FEbFVId3NjNGU5MUs2TUpS?=
 =?utf-8?B?eGhYOHlEOFEzR3h2UktqMDdidHlVOHpjaWRKd2hqZG1INVJtbmRBVVpLTnhr?=
 =?utf-8?B?REhsN0xQb1JrcnNYcFc5SHgvRlNNMzZaYjMxYzh2NjZHWUJaMjNnT3FwVkpi?=
 =?utf-8?B?T29WRXZkRldlVy8wK0JKR2JoNWdWNkZnbURTbCtqc0F3Q3orT2JuQjVEVnFY?=
 =?utf-8?B?eWU4RFRLR0VGSWp1dHdTZnF0WTZFNnVkS1duTENVK3I0U05ZWWszQzNCS05N?=
 =?utf-8?B?QkFvSnBzTlo2Rnp4aTFYUjFydGh1TTY5Mnl6cTNMTzBLTGNJN1lxUE03aHZJ?=
 =?utf-8?B?K1BoVEthNjczb2VoN0wzTXVveElDYTRGYSt1NHRQWHdseXo1WUE5c3lERzZa?=
 =?utf-8?B?TS9ZeDBPNW44Q1BPc0d0Yitlc1pyTk9lanFvQldnVjllTkE4dUhvbHJtbk5B?=
 =?utf-8?Q?mmXGjBMVBJ/8nnbC2auZ7Rhs+?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bea9827c-637f-46b9-d44f-08de281b61e7
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7875.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 09:58:40.7537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jxdX5UgZLIYdTA+FVFG0GoYvrL3N3GY/MCb3Vw6PYnCERUug37Dvgd19bDWOqN4LRfkGBru+fqHLogUFAfTSaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5125

Do not set legacy IRQs target CPU mask to all CPUs, as the interrupt is
strictly targeting a single CPU, even if a spurious interrupt can be
delivered to other CPUs.

Instead set the target CPU mask correctly, as do_IRQ() will always deal
with spurious interrupts generated on AMD hardware.  Otherwise fixup_irqs()
would assume the IRQ is targeting all CPUs, and would simply not perform
the required affinity move if the target CPU goes offline.

Most of this is unlikely to make any difference in practice, the IO-APIC
setup will take over those entries and set the proper destination as part
of startup setup.

Fixes: 87f37449d586 ("x86/i8259: do not assume interrupts always target CPU0")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/i8259.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/i8259.c b/xen/arch/x86/i8259.c
index 5c7e21a7515c..41f949a36531 100644
--- a/xen/arch/x86/i8259.c
+++ b/xen/arch/x86/i8259.c
@@ -407,21 +407,14 @@ void __init init_IRQ(void)
         per_cpu(vector_irq, cpu)[LEGACY_VECTOR(irq)] = irq;
 
         /*
-         * The interrupt affinity logic never targets interrupts to offline
-         * CPUs, hence it's safe to use cpumask_all here.
-         *
          * Legacy PIC interrupts are only targeted to CPU0, but depending on
          * the platform they can be distributed to any online CPU in hardware.
-         * Note this behavior has only been observed on AMD hardware. In order
-         * to cope install all active legacy vectors on all CPUs.
-         *
-         * IO-APIC will change the destination mask if/when taking ownership of
-         * the interrupt.
+         * Note this behavior has only been observed on AMD hardware. Set the
+         * target CPU as expected here, and cope with the possibly spurious
+         * interrupts in do_IRQ().  This behavior has only been observed
+         * during AP bringup.
          */
-        cpumask_copy(desc->arch.cpu_mask,
-                     (boot_cpu_data.x86_vendor &
-                      (X86_VENDOR_AMD | X86_VENDOR_HYGON) ? &cpumask_all
-                                                          : cpumask_of(cpu)));
+        cpumask_copy(desc->arch.cpu_mask, cpumask_of(cpu));
         desc->arch.vector = LEGACY_VECTOR(irq);
     }
     
-- 
2.51.0


