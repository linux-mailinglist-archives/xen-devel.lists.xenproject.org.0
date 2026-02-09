Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oChkAIDyiWnGEgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 15:43:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64621110C4B
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 15:43:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225507.1532029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpSTU-00058d-OH; Mon, 09 Feb 2026 14:42:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225507.1532029; Mon, 09 Feb 2026 14:42:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpSTU-00057O-KA; Mon, 09 Feb 2026 14:42:52 +0000
Received: by outflank-mailman (input) for mailman id 1225507;
 Mon, 09 Feb 2026 14:42:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gJZC=AN=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vpSTT-00057G-BP
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 14:42:51 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9aebdf59-05c5-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 15:42:50 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA1PR03MB6641.namprd03.prod.outlook.com (2603:10b6:806:1cc::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Mon, 9 Feb
 2026 14:42:46 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 14:42:46 +0000
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
X-Inumbo-ID: 9aebdf59-05c5-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WX/S8kGfcY2w7KPCDH0qE9JfuqKQWaYcAC2y90aIm95DBlAQQxRrejeYELyILLAOXwDlQmxnloTmDwi5Kb6eGYuCrBFbT2HJCoaZl8HHIdGeC9gvLou3QUyY3wwJ/UrRCgrjPS9JwI4B/dXxWMWJhWOxsk6LOnGYzn2xbIe4Bvbl4Yc9vkh/fcO2HvssRrRapqIhBxhiH5GEdMnH3y5XURfiGWTOXLpwUYsVDBbx7qN79g8BF2f+8XXu+cC79CH2TT6Dbn5rAfD6W7JEIY3icdblNzrAilG05b3BtI1v9tK+4ZpunLtN6FpdS4CwAUIobkhLBtgXN0jdQqWTFogQ+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/O6ZHyTlRS+Z6itupY7eGYrVktQGBX8QqkBHQyVLAYQ=;
 b=eZH1GufyL5ccauQE5oxK/HyhZeW0oQeKvfD5w5Cl247A5v8ft31SX1VXeb/7xTn03Y94eIfpeyZAziV69LuXnlRwd29cf+3uAeNjAOkLgvigVc7MHojoVzXZ6cQED/pAPCkCI5M5TDjFndMsoZF2PpVApRM1ma761p1LpfWC2WUFI3JXcjDtXeX304aqd7SZJ+aUS4TL4/jJs61gxO1RtPLX2qKHM/RLHR09WYjcUUz8CnhvMg9XJl9d4johQyIUU9ERsQyirw9X2+g01VelorJ4pGndMKE0YEhusiI008di46QPgE56QKI7DGw3l8xTPA1hWVoKgmlifvv5yKRO8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/O6ZHyTlRS+Z6itupY7eGYrVktQGBX8QqkBHQyVLAYQ=;
 b=Ba9XlZdtUQimMzHCn+qtWBaiZcGPKtumEy/seDtNOF5eGhh8+GmRjFMe+dsUR3sDBTG3VtYbBtintQijJBOUJpNaNYIyGtOtHpRMEU8EhI+VnBH+qB48D6jorWub32jercjTePQ7rEK2qP7xtWi3av072nJhTkRWqpR/HZ6enik=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 9 Feb 2026 15:42:43 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>
Subject: Re: [PATCH] x86/shadow: Delete the none.c dummy file
Message-ID: <aYnyY2MArv4vTXsY@Mac.lan>
References: <20260209104104.7840-1-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260209104104.7840-1-alejandro.garciavallejo@amd.com>
X-ClientProxiedBy: MA2P292CA0018.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::8)
 To CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA1PR03MB6641:EE_
X-MS-Office365-Filtering-Correlation-Id: e221efd0-eac8-41af-b135-08de67e97d7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VkZielJXT1lvUkYwQzJTSCtoOW5zaGZaSk9iTW1admxEcTE4dU1sZUljQTdE?=
 =?utf-8?B?MmdTazdOQUg0VEkzaEJVcjd0V1hxL2E0ZTlzVm04Yk5SN1JsU01EVzZDekx2?=
 =?utf-8?B?WWVRRW9oSDZWZ3g3dTE1U1Z2TkJZVERmanhabm5XUE9OdFZJZkhSSkxEdVVp?=
 =?utf-8?B?aDFQcjRBeXFUaEdRNHVsUUZRdGVIN1FtUFl3Ti9KOGNveExTUGw0WFBHMUk4?=
 =?utf-8?B?dnJ6b2ZEdUNGdmJMU3BoT3lVOFFJWHYrRFJuR1pPSUFibkJid1UwRFZVYzFE?=
 =?utf-8?B?VXFCVkViMWZ0WFZuVkdKaXlpTklqUkR5dW9DRjNybTdpMTU0L2Q1eUdETllj?=
 =?utf-8?B?MDdDOFhJc3NHS3R0RFZMOHpIcEEzRDJQZHBhKytheUtoZWtKbzAybVBPekpz?=
 =?utf-8?B?S2RlQU1ZcVVTRjRnZ2kzOEdZU2tCd1ZRblpyUTFickNxa3pHVGw3bDJuc3Ux?=
 =?utf-8?B?VXBIc2FobWIwNk12QVE1M2Npdy8zODlTbVZTVVpycGJoMms5bjdTL1IxTHIr?=
 =?utf-8?B?eXVadW5IbzBlcXVEUHhON08zNmZCV2hUanJsWE03dFBScEF3S0ZuYnlIQStE?=
 =?utf-8?B?VnhITTRNcy9CWkpsVGFrV1NFYVNDa0x6Zk5zMTFTdVRtUkhNSGZaMk9LZFBJ?=
 =?utf-8?B?allJTk85cnFra0Qxa0I4WjloZSt5eHRpTlRGNVYwNG12RUFzcW01OFN1eXN0?=
 =?utf-8?B?U3hHTlZyY2dIUEdmNlI4bzFoUDRDT2ZDdkkzbEFVZk1lMy9qRUNQSU51RUhh?=
 =?utf-8?B?NDhuVmxsMEZmRUJFVlRNaWk5aklmeU5kRE5ZeXFMa216alR2cTI2dFkzWlBZ?=
 =?utf-8?B?NVFkY3NBbzdBUHJZdjdYTjA0VjRnZ0VJZ0hNZVZ5R2RBU080ZmlUMmxOOEtr?=
 =?utf-8?B?VDh3YjR5KzRuYjFlSEFZNVJUNDBMZXJmTERuai9GOEZNa2VjOTlnV041aTNB?=
 =?utf-8?B?MVpGeGxlaXhnU0ZNc2ZIYXgwZXdLSnl2aEdycmFQTFlvbU0vRzZRNmNGWk5r?=
 =?utf-8?B?eE1EeGY2Rlh6S0lwVU9WaXd4cG9LQUR2Tit6WTcwSkpaRGkxVHNaUmoxZFFL?=
 =?utf-8?B?WjU5ak94MzlGZWJoaUdmOHM5THk1elBvV3BXRGRmbmJ4UVk0eDV6aU9hSmd5?=
 =?utf-8?B?bWlsUEs1QWtDcUhHaUZhN2xaTGthZzMwZjNYa2xWTmZCYmhLODRPUkVRcTR6?=
 =?utf-8?B?Vmttd2JSVmphK1BZSHIyT09IVkFrc2psMWl5ejd4dUtlTzRWWUNOcG1DNnV2?=
 =?utf-8?B?ZFRlUk5wdFlaM1lhK2Q2SjZMbitRNkQ5ZmZCRjdQcHFSYkttQ1Y3M2VsS295?=
 =?utf-8?B?MkZyZGVQeGF3M2QwbGdlUVk5bEpudUhFbjdOVndrMHZWL0RmZFQvRUFoRTdG?=
 =?utf-8?B?SDBIOTh0RWZhdm45TGtxckR5VzZPOFRQY1I1Z2dvY0IyWFVKWlVlS2w5dHdX?=
 =?utf-8?B?QXQ5UGxGcEV6VzczdjhDY3RRRUFrMzFvK0gxaUFONEs2Qlk1S0loZ2FHVVhV?=
 =?utf-8?B?QVpKZm0zYnF4YmV5KzVyMWU0SGYxUDdsYUtXN1RYYndQSTlxb3l1UFNvTzJq?=
 =?utf-8?B?d0gwdC8zSVA2blZmV3F1UjBXWFNKSGR6aEVzWmdyZ082NFEwaEc2amNJNWFl?=
 =?utf-8?B?cXExdFI2VXcvckRTYjZnUFUrQUdqdGV5bHJxclo3UkdmemYwcENjRlZHYjBv?=
 =?utf-8?B?TjBCQklZSXQ5eE1WanlLd1AyYXhNdktmTmI5QXNOQmdKRVk5Tjh6TjlkMjRh?=
 =?utf-8?B?WG1zVG1DWk1rSUd5L2gzUEo4UW83M1cyMEdLcFM4MFlzL2U1VjI3cjBGWEwv?=
 =?utf-8?B?aWYxRmMvaEZhWHZtQTUxMW5FRGkwVUtNbWNJaENkQkZBMHlpdDBCd0Uvb2Jj?=
 =?utf-8?B?WFdHNGEwRGFEbjVibWNiMUhZVlluTlk4YmduUkVuMXNxYXZkaUc2UnlXZHNQ?=
 =?utf-8?B?T2NseWU4SUIxNnY2Y1pJa3hqeElsU1VFUStBV00xeHNBWDJnMlYyMGdoL1h0?=
 =?utf-8?B?WDZZMnY0aHRiSTNlbmNmL1NMcVovNnR2STc3dU80amlNckx6SzRZb3FBY2JJ?=
 =?utf-8?B?QzhTS1QzYVJGZS9ZZmVNcWRCcFNvbXVxdTFwcEcwUmNCeTRySm9DNTdSaGRI?=
 =?utf-8?Q?3pis=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVhuYS9iSngvYUV6WFFWRDRnalZETnZseldEbWxwWXBOWExZckgySlZScVNy?=
 =?utf-8?B?SS9RaVk4SVhFUkpxZmI4U00yekdEdGowVkt4bjRtcjNPTlUyN25HZzNOcTlj?=
 =?utf-8?B?cThaRUNBS3QraEtqYXlkVEN5UURldk9adCtHTzlES1l1MVZHRlJBcUYwRzFn?=
 =?utf-8?B?RVUxN2FqQkdORFJ0WkhCL21Ed2Uxb1VjVDFmbmg2VDdPVW9PRnhMNzVNcFpP?=
 =?utf-8?B?QUVuT0xlZUQ2WGNudGJnZ1U1Q3BNN01BdFFJNWljN3FhT01FZXl5N0hIY1hC?=
 =?utf-8?B?dm8zaytibzMrTU9pQW1Jc0JMa0hxREIwd20xcXBmSmpaRGNScHZxaDRtZldM?=
 =?utf-8?B?bFRPdnhtV3pNRVgwbGl1QzkvaXphaWZGSW0zREJYN3B1NGk4Y1llUTFrT1dQ?=
 =?utf-8?B?MmtpTDE1VVVuaWFhdFJ3VmZtNWZUTXJXLzlVSWVrbDhuTEtaVUN5ZVkxRnFv?=
 =?utf-8?B?YlR1NFlBamI1ekN6N0cwaGIrUnJiTFo4Z21ZeDl0QlBUZnI5T0hZb0dVU0Na?=
 =?utf-8?B?bFNVbmtGVVZSYk5BTno0Mzh6N1k0NWNLcm51MjdYbW9kVGl2SjhPbWlaNCs3?=
 =?utf-8?B?RXFEajFMRm9PeTArQjFtZFRhSzVFUFdYbE91WmduUVUwbkQ1MEwweHVFQ1NZ?=
 =?utf-8?B?VVNtMHoxR2FxcDhzTy94Z2U1N3hYbHB0cFIzaVNYRDZmdkY0NW0zQXFkUzYy?=
 =?utf-8?B?cDM0czhTeU9EcjhaaGdDWXVPWTRsUkdCZ1lOa1ErelZOVTZuS2x6QU1FREdL?=
 =?utf-8?B?aE8vVi9vb2FVc1ZjVUhYYzVCNUE1SHM2MWR6VGN0Z05rdDA2TTFNOVNrZUdD?=
 =?utf-8?B?MjA0SVJ1SVk3dGw0SmFIRkZaS1luSWVvMFNBL3hhbDFVNVRwRTBYczlvMFlL?=
 =?utf-8?B?eFIxWnNzN29NeE8zb2gxWVk4ZWcwbmZSbm1HT2pEdjdaT09vOVU4RjUyN3Fh?=
 =?utf-8?B?bmk3dmg1c0E3a08zS1VVc3NsNTVEK213ZFlleTJ6UlNkeWhLOWNoaFRoMExk?=
 =?utf-8?B?eWpTcWZYb3VMZG05YzVMd2hIQ1AvcVR4bEJibnl2UC9uZ09YNHhTemVzYVM0?=
 =?utf-8?B?bnJ1TFNFMk5ORTNsb2JmUWoybFNweW10YTNFUUsvQnNIbThRSUwwSlhyRnl4?=
 =?utf-8?B?RXRuNkFNaDVPeHU5dkNXUnZVb1B4V0E5MEdieUsxVk8vZGlLOE10WVJ6d253?=
 =?utf-8?B?M0lIRmRDdEJCUlVjcnEwbXhRRUVJRDRTWGxPM25XTTFlUTlVVGNwMmVNcUVF?=
 =?utf-8?B?WGxlczlVYW54em84UlBmNi8yR3l4VDZ1ZFJzYWFScllXOUdDSjNBKzRqZis1?=
 =?utf-8?B?TmV0SU1WajYyekUvem52aEZIdnUwWXZqNWszNE00REtqaFhrM1NoU04zQVd1?=
 =?utf-8?B?MHZ1Z0VqcXVva3ZQSzE2ZEk4R21QVkhPUDhTU1BXUHBXQWdyUXR2Mk1kY1gw?=
 =?utf-8?B?VGNOejJld2dNUXBpbTJHNm1tZ2cwR3c4cFZrWWsySDh0R3cwZ25aQ1R4bGdk?=
 =?utf-8?B?NmhzZlBTWnNzYlFLTnpCbnhUUjRKdFZFU1FPZ1FQTndobkI1QmdYUWdka2lC?=
 =?utf-8?B?NUlYTFBudUJvNGdsQ3JmSmdUNXJqYVczL09XOU90TkJ1b2F3US9zZU9NVWZ4?=
 =?utf-8?B?OEJwbDd6ZEJEU01LbkJyS21iWllqdGRCT0x0REVMd3ZIVmttZm9rRVV5N1U5?=
 =?utf-8?B?alRwemcyOU9hdHFrUkpiQzFNTVM4RTNNdVJHL3IweVFzVGM2Vkd5RDBFeCtN?=
 =?utf-8?B?R2toaXp3YmVQbGRLVGt3WThRbkFYa3QxN002MnpRL2ZaSVNYQjBKZmExRXha?=
 =?utf-8?B?N0pEenpvbEk0QTNnSGt2WEZvRU9SRG45MWkzTVV6V1NVSkZpNFdoMGZ1TGhi?=
 =?utf-8?B?Z3RqSEw1eUxJN1NLY0VuWFV2KzJnbkFoYXJYd1Fub256bCthMzBRTzJQc1hW?=
 =?utf-8?B?SmpKQ0N1SnlVMHJnYVVHcDQyR0IzblRQYWFObmp1bUkya2F3c080VDZjdUFL?=
 =?utf-8?B?ckRXZ3k3Y1RwSkRBZDh1Z0pSalNjUVFRelBKNm1nK2tlKzkxdDRIN0p5R3lk?=
 =?utf-8?B?OFBsRTFKVVExN1oxZlppU1AwNUVHcFY0VVBOdXlOWDJ2MHNXTjE3cTVIMVRm?=
 =?utf-8?B?dG9yeEJQWUd6T0p1aVBWNEdiNmlJSXJNMXRlV1UvYlVqY3ZxdWVUOFZiVnNa?=
 =?utf-8?B?QlkvVWR6SVRCSmFHR1VUdGJ3dGxkRFZ6c2RDbkM0TmgrVm90RjZ0dXc2MlNJ?=
 =?utf-8?B?eUdueWIxbUQrdWIwMUQ3YTVFR1F3cGFhVm4rbG5ZUDdvc3VSZ29mU1Zkd1dp?=
 =?utf-8?B?NW1CZ0VJdlFuMy9nMGtPSm9DcFlEQUFLVlNscFFvRWhxYUN3WmdaZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e221efd0-eac8-41af-b135-08de67e97d7d
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 14:42:46.6393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UoEuyWqW6NUMoELmz6j4olf0arIM8gqyxP2bk/BJ+qQ6rk5+jzMdQewjegVfRApiIsKDJu1nEDlMe9hHDOZlOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6641
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:tim@xen.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,citrix.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 64621110C4B
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 11:41:02AM +0100, Alejandro Vallejo wrote:
> It only has 2 callers, both of which can be conditionally removed.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
> I'd be ok conditionalising the else branch on...
> 
>     IS_ENABLED(CONFIG_SHADOW_PAGING )|| IS_ENABLED(CONFIG_LOG_DIRTY)
> 
> logdirty patch: https://lore.kernel.org/xen-devel/20260209103118.5885-1-alejandro.garciavallejo@amd.com
> 
> ... to avoid the danger of stale pointers, with required changes elsewhere so
> none.c is only compiled out in that case.
> 
> I'm not sure how much it matters seeing how they are all unreachable.
> ---
>  xen/arch/x86/mm/Makefile        |  2 +-
>  xen/arch/x86/mm/paging.c        |  4 +-
>  xen/arch/x86/mm/shadow/Makefile |  4 --
>  xen/arch/x86/mm/shadow/none.c   | 77 ---------------------------------
>  4 files changed, 3 insertions(+), 84 deletions(-)
>  delete mode 100644 xen/arch/x86/mm/shadow/none.c
> 
> diff --git a/xen/arch/x86/mm/Makefile b/xen/arch/x86/mm/Makefile
> index 960f6e8409..066c4caff3 100644
> --- a/xen/arch/x86/mm/Makefile
> +++ b/xen/arch/x86/mm/Makefile
> @@ -1,4 +1,4 @@
> -obj-y += shadow/
> +obj-$(CONFIG_SHADOW_PAGING) += shadow/
>  obj-$(CONFIG_HVM) += hap/
>  
>  obj-$(CONFIG_ALTP2M) += altp2m.o
> diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
> index 2396f81ad5..5f70254cec 100644
> --- a/xen/arch/x86/mm/paging.c
> +++ b/xen/arch/x86/mm/paging.c
> @@ -634,7 +634,7 @@ int paging_domain_init(struct domain *d)
>       */
>      if ( hap_enabled(d) )
>          hap_domain_init(d);
> -    else
> +    else if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
>          rc = shadow_domain_init(d);

If you want to go this route you will need to set rc = -EOPNOTSUPP;
prior to the `if ... else if` on the HVM case.  Otherwise when shadow
is compiled out, and the toolstack has not specified the HAP flag at
domain creation you will end up with a domain that doesn't have the
paging operations initialized as paging_domain_init() would return 0
with neither HAP nor shadow having been setup.  That's likely to
trigger NULL pointer dereferences inside of Xen.

Also, seeing the code in arch_sanitise_domain_config() we possibly
want to return an error at that point if toolstack attempts to create
an HVM guest without HAP enabled, and shadow is build time disabled.
I've sent a patch to that end.

Thanks, Roger.

