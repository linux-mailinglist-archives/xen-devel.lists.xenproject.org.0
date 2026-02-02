Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PRqB9PIgGl3AgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 16:54:59 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F18CE798
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 16:54:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218732.1527578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwGD-0002OJ-Te; Mon, 02 Feb 2026 15:54:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218732.1527578; Mon, 02 Feb 2026 15:54:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwGD-0002ML-Qm; Mon, 02 Feb 2026 15:54:45 +0000
Received: by outflank-mailman (input) for mailman id 1218732;
 Mon, 02 Feb 2026 15:54:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uTrP=AG=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vmwGC-0002MF-Vn
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 15:54:44 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d19ea7f-004f-11f1-b161-2bf370ae4941;
 Mon, 02 Feb 2026 16:54:43 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by LV8PR03MB8140.namprd03.prod.outlook.com (2603:10b6:408:297::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 15:54:38 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 15:54:38 +0000
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
X-Inumbo-ID: 7d19ea7f-004f-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nCV4cyEQe/jq0e0jyAMvGOwNbs9OFJnsoK+YErtmxR5yJQ7y5Y9DN5/2IhXZRviI5oNNwzpfQQJ0zpMw69IYxiWR3fhH+6wL+HzDzPp9CCtvPdFUiY9alEP9mROfclJhi8+mP1eo1mphDLbNmCJM6R+0azNcWyP+3K0KSPpmL/4g6oRJrdVsfCTdjqjVu1iQqMTmPzEY90KUt5ICojetr7B/11vplSYrKZuThfm9zboJEfWFL2/Iobz9Y/4MPDUEIXbPab9mjPhCy7q9TwsP0Sd9awti3xrO7bJlGJ49OCc9d9AyYAK3pUk0aW2B1XkuN2ZpJ0M9njlOM4Qrd3VNQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pxKF+nXhb81kRca0jah7A9axpTFmCqfPSnAmvOVeh6g=;
 b=Wj0zAwMUPLgf/4iUspRm6i5vw9zytbCl+6O74Tf4r1yU7Upa7+uUMM+gEebgMm3dtnX9c6hOzS5+jqwmPwm2T7/J/nGN4nq/323z4HuyNEgftflbOt4TKysj+loh6Sh4BKtayJVeflbTI5F71x5Db3NnaE+sCw8JwsOTyrMSIWTia7MngJSWWCI4xSe3fjaE+K7bYfJysPwm6rH44DSUcCxRPdbMJ+Ow9WWik7RGVbu4VDOi7GhGKe3VZKZQYH3iylMJpgQHEMG/yMm7QAbAv3ZInm0ya2JKzwjp1XYf9yMMcBUbMJhufJlEcmhSC/nnRCpQT5YjJMOHLsUalssITg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pxKF+nXhb81kRca0jah7A9axpTFmCqfPSnAmvOVeh6g=;
 b=gtzR1a6yBaZiGhXVexRjLIAriESIHFQ02o4FzsdjyqgqYt9XIkXt0ZjaYzflAuLh/kJEcE/54uolY4GRC/v+XosCMLmfh1iRXKhRBk1PBc3G0EOooa/tKxISzeSN2KunwgulFmqTAbuNy+uUP3b28mhDIJaKjNLx4gO+1oOE2l4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 2 Feb 2026 16:54:34 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/MSI: adjust permitted vector range
Message-ID: <aYDIusUCsFZaSaQH@Mac.lan>
References: <52227196-dbc9-4f6d-9c64-a5da5037b1ec@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <52227196-dbc9-4f6d-9c64-a5da5037b1ec@suse.com>
X-ClientProxiedBy: MA3P292CA0057.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:48::11) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|LV8PR03MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: 59b67e79-094b-4ad2-c567-08de62735e90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?amkzYm1WUWRiMnhVemdFVUZMcFd4MHNpZjNaY0tKNmVvdmZ4VU4vaUJKV2Z1?=
 =?utf-8?B?M3R1OU5xY2tQeUduT21GaFdEZzRWaW50MEErbmdGWTV4UUxzbjdlVXRHdTlM?=
 =?utf-8?B?WlNlblhhRUpqMVZSZnhoeEJUNGZ3U3V6MkExUFh6QlhxcGhJVitBUFB0R0gv?=
 =?utf-8?B?R01TNUdHVnVDUjlIbmJteTJhZXR1UzdSOHlydWFoZk5OaFBkeDdOTjN1L293?=
 =?utf-8?B?SHdTbkZIYUtzMUhDd1VLU3l4bmx1bXU4SmRnejUrb05kSXpCZTB6dDUxVkJj?=
 =?utf-8?B?bDEwUmJtY21NVWtxM3NzYk4rbTVRQkZkWXJBVm9Ca25kK0Iybk5ReEo3T2VT?=
 =?utf-8?B?MG9PRjE1NFhyN1dRVDJXbEI2T3ROSlp5Ryt2ZDFjR0p6bG51ODBXU3VYMitQ?=
 =?utf-8?B?WldRSkM2Znk0MFZOc3lyQ2NpVG1ITzlyb1NXZENjVTdKanN2VzNqOHdOZ2RD?=
 =?utf-8?B?dkhIUkxVTFdDL3ZXR3RPMnpPOXRsaWRGUWtzSEd6bGFPNTZ4SFdhZWVLVXJ5?=
 =?utf-8?B?QlNOVkFQa1JwNDFTaUNYTlZMVWNsNW45R29pMU10NHVzSVhOVVNYUFQycTNP?=
 =?utf-8?B?eEp4VVB0ZGpKZCsrWDNOZWJEeXNVQzNpV0V3L3lhSW5NMlVQS25QcjNPSEpY?=
 =?utf-8?B?K05SNzhTZTVKYXRlZStta0QwcnZFaXp3QThqUURFV0ltMDBSOFp0b1N1V3I2?=
 =?utf-8?B?YU1ncUhlMGNXTXh5bmpmMEg2YWJvbGNCUmo2eVpnbURCWHFabEJxTFIrK3FJ?=
 =?utf-8?B?TlBxeWJMMFNJUFYvS0xhUmYzSFo4MmJGb2lMaHNBQ1dvNDJ2K3h3b2VqTEZW?=
 =?utf-8?B?Mk9nbGEzOGRFQmpnMXI3dkNwbEtCdjNscFc2aTNuZkY3bDdvNkU2ZUgwK1BD?=
 =?utf-8?B?d3Z4V0ZyWkhSNUhzbE5PbldKK2IrNG1XcFdNVG9EVDFRMVV5SjZHYS9Bd0NE?=
 =?utf-8?B?ckFWc3krcnRTWkIxU1ZkR0k2dHVPUGF2aGFubnUrTmIzVWdhWHoxWEk1Qy9j?=
 =?utf-8?B?akw4NUF4QTZ6RjRvSnErL0FuNEF4ZGZTbk9jTjZaVFRZNjNXdWErcURpTE5z?=
 =?utf-8?B?d0F6d3pMcEhPVEZkK2NvQk8vWm1zeWRsU01IT0QxY1I3MTBRNHh1SFhFZWt0?=
 =?utf-8?B?a2dtcEEvNHlQNzZEdERKc2RJQ2JndkxJUEhIbWhtbDhNMmZZR1BoS2Z3TEpU?=
 =?utf-8?B?L3orWm96M3I5TW1Xek5VZ3hKM0k0aHpzMWwwUUlOc1djWi8wWXBMRENlUjlQ?=
 =?utf-8?B?QXcrOGEvMnVDRU5XQk1JdXdzYlY1YlNhUUpjVDVFZ1VHbUpBUXZ2Y2hyQkNz?=
 =?utf-8?B?ZlpjWHdlVUpIb29jT0xFUWh3R2NuZ3picHRNTDlORnZ4cnViaG8wTllLbkZS?=
 =?utf-8?B?SnRFem5BbGk3ZG0zc1RCVUlDNytZOTIxS0NEeUNKaVJwVXVaWmNtQ2FVUXZh?=
 =?utf-8?B?ai8zM29Od1R4blNUTTVEMWdRZitZK2dKaTNuWmZjVk5kRGFwVVFtQ2NwZGNX?=
 =?utf-8?B?cGluc0NjSHFCb3E3cGliUTgyS0lXbXdJdzJ0WHd0dzZ3OGpBT3BVNXJVZDJt?=
 =?utf-8?B?REtpcEZBclNlNDdBVDQzWEY0eVB5cFE3ZFNnSXFSdUNQUXRXVkJVV0ZhQW00?=
 =?utf-8?B?WWY0NUN6enRJcENLbHVkSnYrZTE2dGdWWDNKY2YvQ1hHRVhjdE9yU083c01K?=
 =?utf-8?B?eGFIRStteFVCcW90Z3BHUFFDamdlR3N2RGQ0b1R6Z242MkZDQXlUWm1EYlpS?=
 =?utf-8?B?bjhkL3MrSDNaN3JJcStzZ0dCRTA4L0gvTFdRaWt4Q2Rac0dZMzFaWE03QWQ4?=
 =?utf-8?B?ZGRlTDVVQjN1Ukh3RmQ4SmQxRHBWdHJYc0RnR0JUM2N1eU1keWFkbDVab2tO?=
 =?utf-8?B?TkxWSk9BZ0lnc253T3NlY1BCSWt2UTdrL0tHbVUxRFlobFpHdmRBd2RaNmJR?=
 =?utf-8?B?QjFEQXNaaUlnT0tQZmJaKzZCdG9URjljVWdvQnZWYWJ4Q2w3YkxOTnM3Q0pZ?=
 =?utf-8?B?RVhSMEcyWlhvaTFDZFU2N2dqNEZ4SmJ1TmhQM1lmWmwxN0xndFlUSExOWDFj?=
 =?utf-8?B?MkpOVU5HSWNuSk5CL0ZFQURNYlNCVWJaeFI0RktYMEdHcm55OVF2SEhsNUdW?=
 =?utf-8?Q?v7Q4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aTBqZFk4MlRxWkFzQ29JTU1lbGkyYW5vRTVOSzRSTG1BbDFPTWdqbVlUM0Fz?=
 =?utf-8?B?RXJLN09TQkNCMlJydGlGTTIzV1E4b0xWUC9sdjRkeHpSci9RMGZ5SW5zUDJ5?=
 =?utf-8?B?UUVJSGM2OTN6YmJxMGRnM2ZScGlaZmZ4by8yRGczZ0R3V2dmdVlZOXNtMTg0?=
 =?utf-8?B?Qm5JL1hoZE9zcjk2UDY5c0RUNGhRUnZxd0ZGR09SWlFzaUZTRHVFSE83eXBD?=
 =?utf-8?B?ZjB6RWlnaGhVbW40ZWxiTlpyRHpVZzJvV21Mbko1ckJaU0F6M05QZ3hyamRs?=
 =?utf-8?B?Zk5MUmxDUEFEUW8zb25YRzNycEF3d2x5ZzBONlFpUVEvNWxyUFVGNU1HSlNq?=
 =?utf-8?B?VlRFYUFtT0c4ZVVneUZXK0NpSmhOMzZpcTdWUXNMRHZzVkhqalJLLzVkdVd6?=
 =?utf-8?B?eVh6eHNKQ0RiS0RuYkhsa3V1UlBFYk9obE4xdXAyNlk4REFyNmpVTmdjTXJP?=
 =?utf-8?B?SnlVWml0WDNSM05rdkEvMHJDUjNnWithenhaTjNzazFteGdUaURZL3JBNXlG?=
 =?utf-8?B?RWt2RkxUQVN5NHhHSjJqRWlRbTVvL2IyeEJLcTMzV1c4Ujh1ZFBlNExEQVVM?=
 =?utf-8?B?RGtOUncyTUhzVFQvNFZxT3ovNVdjVkg3eFlLRjVCODFtaVdhQzgxa0NZTjho?=
 =?utf-8?B?YktGSE10N3krUE45aFVDZ1l2eUliemI0ODlkYlFwUDVmYUJrWTZ2TTFlOGgz?=
 =?utf-8?B?WVFGSER4a2xDUkhlaEphdXo3L1lPVm95ZmsvUXNZZ3MwQmpWdjhWelBQbkpo?=
 =?utf-8?B?NnpaNHAzbGduTi9XendzK2tpZnJieGlDREtTVmNST0xuRXJGaTR3UURXSUpl?=
 =?utf-8?B?eDRuMGljQU1OYm4xVnpoWVVXa00yRTgwS3EycmxaYStTTlNNbkRuRFAzaUxN?=
 =?utf-8?B?dDJKRGRlODFmZXZrb0NuM2lVY0JFajhZWm1QTTRGR3d6SjdGamxrUTNvMS9q?=
 =?utf-8?B?OHZyeUt6SjY2T0FyZlFWVTc1dUZWRUJxUXZDdlB6amVQejVPc3c1Q3IzTWVG?=
 =?utf-8?B?b1QzYm1Ua0FxSSsycy8xaFN1TzAvdjR0SHBNdmQ3V3l5clNrK0FBenJmMFVi?=
 =?utf-8?B?R3lURFdUMWZGQ0NHZGNqRk96eU1NVElkQjR5NmRPNmRvK2YvOHBrK05ueFh3?=
 =?utf-8?B?cTVKbjhYOHVZM1I2ekNEWTArOXpodzRhWXE2dHhXOHlsT0tERWw0bncyWElW?=
 =?utf-8?B?ckJxc003dGJiUHRaSFFEamV4SzNIeklhSTcwTWgwdnArS1RORlhXNFZuc1Ns?=
 =?utf-8?B?MjlaYk0yeDdBaFBPUXVOb1E3NzZnRm5jZ2FiclZpOE0rdkZ3cHlCK1oyanFS?=
 =?utf-8?B?RHVLelIrQldoYmNpbWwxeGNGZGNEYVJQaWViby9xV2hzdnYyU0hPcUJXRlMx?=
 =?utf-8?B?VDJEQzJZM0dBWk80OWtCcDcwcFBld2JkQ3kwbzdLMXpkc2g3Zi92d0VXZmhn?=
 =?utf-8?B?UWpRbmdjMm9lRkF4OEtYVVZ1V3ZyL1lLYVdFYlZRRk5TZWJmTURJdUN0ZGZY?=
 =?utf-8?B?WVQ5WkZUMUlxcmdZSFljSHhJL09ZK010Z05Pdk91RE5SRlFBUlVrb0E0OVJx?=
 =?utf-8?B?V0c2Q29OS3dkQVNGc2x4elQyelpBUDExYWh5QkhYeTRNVkMzUnpySHZmb1dz?=
 =?utf-8?B?d2l6NU1RWDI1WUp2cVYzV2tmdVdiQXJCWURKSEtpQ1hWd01Bd2ZDS3M2SFRF?=
 =?utf-8?B?ZlhFTkQwWGRYSVZPRGRLSTN3cDVsMEM1d0xxQzZqOGVlUlRBM1RiSDdZRnky?=
 =?utf-8?B?N280dmN6cDBKT2FhdFlMRGJMQWtDODgvdnMxRVMxeDlVN0xkNnV2UmJSVnJB?=
 =?utf-8?B?UXhDcXI1bHRhcXZENkdxSE1nQkYvTVlhTzFnV25HWnRhbmtvekI4K202bElm?=
 =?utf-8?B?T3R6T280RXRnMGlIY0ZWWkZmWkRnTGtHeFRxY3RReVREaVFRKzNMUW5aNUxR?=
 =?utf-8?B?QlNGcVVRYitEVHZwVjRBSzJ0YlRaTGlBVU54NHR6WmQydWp1MThNeUloYzEz?=
 =?utf-8?B?UytqZGR4dFpGYnpDbHFua1dueWRLQjZQZDgwSUt6R0NHYkNIbHp4ZEVocTF4?=
 =?utf-8?B?d0lIM1RBZldmOHI0Rjc3aDE0elZhc3lneDZkamxLSWg5ZU5HQ3J2ZGpHUm9k?=
 =?utf-8?B?OUlBTnpTZmNTU00xTEQ2WHk3dmoyNDFYaCttc0syZVU5c3ZKM3puZXNmMGw0?=
 =?utf-8?B?OHJJdC9MTCtLaXc1NDFWZlJpWnY4V1dyOVF6YVhhMFZCaytqaGlRQmxSemZV?=
 =?utf-8?B?RFVpaTRsbWRLUkhUN2U4ZFFDN3MzcGhPbFdsNU91VVNrdncwTzdVNHc0WEJY?=
 =?utf-8?B?QUxIREZUblFDS3Y5YjVzM2wzV3JmbzVuVjAxMC9mb29PVFZUVFNxdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59b67e79-094b-4ad2-c567-08de62735e90
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 15:54:38.1897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OGb9/jWD1p5MKKnfEXSD0i40A93ZczPJDwpUY9MBQAF/R3VrMWlM9Uy2rPI7P0VXbjfXbH05hgV9XSw1rscmfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB8140
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,Mac.lan:mid,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 79F18CE798
X-Rspamd-Action: no action

On Wed, Nov 12, 2025 at 04:45:05PM +0100, Jan Beulich wrote:
> It's really FIRST_IRQ_VECTOR vector which is meant here, i.e. effectively
> there is a form of open-coding in use right now.
> 
> No change in practice, due to the present aliasing.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> While doing the HPET work I had to fiddle with this, even if in the end
> no vector below FIRST_DYNAMIC_VECTOR is being used there (for now at
> least).
> 
> --- a/xen/arch/x86/msi.c
> +++ b/xen/arch/x86/msi.c
> @@ -158,7 +158,7 @@ void msi_compose_msg(unsigned vector, co
>  {
>      memset(msg, 0, sizeof(*msg));
>  
> -    if ( vector < FIRST_DYNAMIC_VECTOR )
> +    if ( vector < FIRST_IRQ_VECTOR )

Should vector also be rejected if it's > LAST_IRQ_VECTOR?

Thanks, Roger.

