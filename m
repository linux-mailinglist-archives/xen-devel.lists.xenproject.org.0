Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92817D1954B
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 15:13:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201761.1517340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vff8s-0007sW-Tt; Tue, 13 Jan 2026 14:13:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201761.1517340; Tue, 13 Jan 2026 14:13:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vff8s-0007pu-R7; Tue, 13 Jan 2026 14:13:06 +0000
Received: by outflank-mailman (input) for mailman id 1201761;
 Tue, 13 Jan 2026 14:13:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lb65=7S=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vff8r-0007po-FR
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 14:13:05 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8489090-f089-11f0-b15e-2bf370ae4941;
 Tue, 13 Jan 2026 15:13:04 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH8PR03MB7198.namprd03.prod.outlook.com (2603:10b6:510:25e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 14:12:58 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 14:12:58 +0000
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
X-Inumbo-ID: f8489090-f089-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vbmYkImxet441lVOcXZPciKKEYzkysjiet3zah3qMPOFOtwBeVe3yUofbdvq7e4r1ea3P1MGjaWp9dyMU6yfb2Y7R/oBBLmy212VBK4n6RynUgB6cUCBzydk+hEUcf8iFIxgoBIlB3p9SPRZ26cQVW7G0/uEfb72I0ktXYQ9+IXtbDIoCeMv4W9insPZuwP7D2flpxGTysSlWYxuB+wz0kdvDfyfifTKCpLWzfe7YU1ig/7IBV+wHPdQUYtNCH9JpAyBZlma+vR4acmtVTo0JRKjrJOmePABtCRtQtZKvualSrAWaGRz8P9x+bxst3dz1/zqS3oRHTj78XjaXwXEAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yu8I3qWsT+y72B0Q+OIT3HO85vcIczPXvDL3gMdtiFI=;
 b=AuUKbf6wJIass4AQy65eZKJPmvDCA4TPbs70QiAcM9CNUd/utj/JRKiTjGeiIVXxbGlX//d3K4fZw1QKgKrZ45Em0Jf+G9HZn6DfxrPo74nQwQd9gqwCUVlEycuHb0j2FvJixgaErrZ/dTskeiEIeOPijwx8vRnORRR9xmkDvxdRNZHjntPCp3eezTB7dbTHFdgEId6/MtvZxIb5hWSMUdS2be6ktZ0b5ZLpcW0+kBggnvXGFvRin/4od5NhLd/4zi+18b0Pn8JE++AzgjMQfeEoMfwR3nwyjnQ8xhJ8ZIYbl9odq87/VU6C3pCTH9f9yK4dW66JBcIkGAKuRUNebw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yu8I3qWsT+y72B0Q+OIT3HO85vcIczPXvDL3gMdtiFI=;
 b=ZhYy+GhGpDoaFoJiX1tUOakoXK7gUrSL5zystqLN9BSlQd3jVNPxX+CjqTQAk6kAmBoHZIbnOzSAaQY5sS3NY9DOo0WLOP0ENyKFSKG90yZ+Jcj9EGD0qOkp9lMqsEJbptNHX8YEimcSFxAkd1qVpiR7HCn5thx/9hraoxcf5Vs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 13 Jan 2026 15:12:55 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH] x86/cpu-policy: Filter out OS{XSAVE,PKE} in
 calculate_raw_cpu_policy()
Message-ID: <aWZS59rOXvMVT0tI@Mac.lan>
References: <20260113134719.1047476-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260113134719.1047476-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: BL1PR13CA0331.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::6) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH8PR03MB7198:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d747693-e2c6-4855-d453-08de52adda4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ykh0dHJWeDJha1FPYnJiTDVRaS9CQ3EvR3lWemJLZWRjcTlpb3RRbG1mUXQ4?=
 =?utf-8?B?dGRWQ0dQOGNEdVF4cmt4RURtbHNGSjRtbitqRmtrR1ptcUFZcWtrN01UV3ZD?=
 =?utf-8?B?SmQvNmJQUUxkbjZ1dnhmZjlWT0dyZWVmYkVhYjEzMlJEbUpPd0hhMDRaVFlm?=
 =?utf-8?B?OFBWNnpkVEp5cTlBSXJaMlJLQ2dpVDl4SVdSeVJaYnV2bU9oajFyT2pKZGJa?=
 =?utf-8?B?eUNNUzFZQWVMc0U1b2k5bHQ4MlVZSXdRMk14bUlhV2VuOU9FcG45NjN2c1ds?=
 =?utf-8?B?NHN5blhDUVFtc2cvL1VpV29OL1NFTkJQcUcvRzFiNW5wb0dIVUMrbFBLL1JL?=
 =?utf-8?B?SmxVa01UMFlPRWQ5eVQ4b0JQMmJ0Vml5MHprbmNONll3Si9HN1paLzErN01u?=
 =?utf-8?B?SEd3c09DZi90cFArUy9DRnNOTGRlSUgvb1RMMmtDYXVieG9wVnBxMmh0RWlo?=
 =?utf-8?B?bXpiU0NrS2p6cWxlNXJxV2hSd1FENkR0T1l3K2xmZUhkdEVrcDR4Vzl5Y2hN?=
 =?utf-8?B?RGJkcVFvUWpXQ0xuNkV5Q253cEhiVDc5T0JZQ3cwMVpDYnJxS0puRUtDWE1h?=
 =?utf-8?B?eHNRNTdDUXgvQjVrYk9WVWc2ZWNRdlNGZHUrd3A1SXA1eldYUDZQalFaRUFQ?=
 =?utf-8?B?V0JraEh5MFZ1L0JIT3lGWDh5Z2IvWjRHaXQzZUdpcnFmbEF1M3hIZTZpL3Zr?=
 =?utf-8?B?UktIMVM3cUVGRng1SXdJdWZIMGVnQ01wSXh0VTQxZ1hyTnFoWnZ0OXl5SXRT?=
 =?utf-8?B?OENJNFpVZU1acXhrdG41dmwrZTBpa2RtMnAybmsxS2xCUjFFS0gra3hyQVdu?=
 =?utf-8?B?RVBmUGtzMGtFTm4wUjdrbUZmMk5mWTNtUkFQN0M3SmJ5ZElvWW04UTVTKy96?=
 =?utf-8?B?NFNpUlRoUEc0OUh6YnRtdnQ4bDRjeDdEZjcwcnF6ekpSY0RXUUNiTjNlNHNW?=
 =?utf-8?B?eDdPRHQwTTM4SDFBaWowcm9xaW9vZmNyc3BNRTE2RzNSeXdBS1lHa2tDZTZM?=
 =?utf-8?B?WlUxc05rMzlsa1JtV0hPbmZjVWo5SEtNV29qeTB3WmRnbmM5U1lSdHpNUGZY?=
 =?utf-8?B?c1NQU01sTmw4T3dTZE1IRXR4a1U2aEVzdStpZkN3M3JnRjNCNlRtUzZMZXFE?=
 =?utf-8?B?WnArQzZjWGhobHp2WHNvZit2ZUNKVTl6NDRnd2NoY0MwM29Vc25NdFF0U0VQ?=
 =?utf-8?B?Nmt2WFEzRHVZL2lOd0hQLzZkd1dkQWZjTzVOYnEwSlVMV0taTW5iRHQwYUdC?=
 =?utf-8?B?Nm0vLy85ekpuM2E0c2Y1UGxUQXM0RTFDdEtLYU5NWnF5THNnR0dtbWNnU2Uv?=
 =?utf-8?B?bTNjb2NBYTAxTGpvcmVQTjZXY0Z2ZnFJbEt4SEZVdWNIZGxFYWNIaW1Sd3dM?=
 =?utf-8?B?S2JFWWFYTnpqaHJ6aEloVmgxNm1nVVNRR2xLWklsUkpiTmtrOGFvVFc4bjFI?=
 =?utf-8?B?a1pRSjFlb2FhS3BOSmpRZXk1bncwcFg5azVsMnhsa3F6OWl3b2F4U1ZTWFlz?=
 =?utf-8?B?R0FudUJmN3pwSGNnV2l6MEFZUEEzdEcrL0ZlVlpwNjhlVWVDOFBpSUx6bDBo?=
 =?utf-8?B?VU0vUUJKSjRoZnFROHpxeUlQSlN4azR3RnROdnpYdmtQdmRIaXM5eFJ1d0dr?=
 =?utf-8?B?cWp6SDZZaGo1V3h1dWp6S2VKd0YzMjFaK1JnK2FtMUw1b1cyNXQzWXo1a3hP?=
 =?utf-8?B?WXZvRCtpUDFLZEtsODcyZEFrVndHYzRYb2dVeDJxdENtUSt0dkx1bHBsNklX?=
 =?utf-8?B?MnBmcXcyUzBzN1h3UG9URFBUa1RDUWxyTEJzYk16aXVxQW52Wml0cklSMVIx?=
 =?utf-8?B?aWEvNWMxODEySnFRdWZpdThySUNaREhmeTBZS2pvTE5ybURKS2ZXWXRIZ3Zw?=
 =?utf-8?B?M04veDYxOU1YbHg5ajlPY3lZN0NFczBTc1RET2k4SFlsWVE1SVVZc2FURzJL?=
 =?utf-8?Q?XXVMkNWfqqp/qxlVWjpdTRH7zMRJHN5h?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFlMN1l4WklweGUzRm5VRHg1b0J3YnpUVXNjODJDM3VWNXV1bURLM2VjQkpx?=
 =?utf-8?B?MHJ1ZEhsVWhuUXdPOFFEdUtIbWlNWDE0SkxqZnBZNGt3dXNBMlBhWit0aTJI?=
 =?utf-8?B?c0RhbXp4SExISVA2d0VoRVdZQW9JUjdDbjg1TXhSeXZRSXl4em8wNy96SCtK?=
 =?utf-8?B?RkFPVmdxMlFZVFVXZXVUdTJQWkdOcnRBRWRNQThzK2ZURkdtVHlLaGdWUDhW?=
 =?utf-8?B?c1NIRWJub3BlQVJ3QlVDVWJpNVlZL3NRZEcxR3FhcFJETEhuYUZKc0x5bGZ1?=
 =?utf-8?B?ZjV1RklsdjZIbHFsYWMveDNEamVpSTlQT3B4Wjlxd21pbmwrMEx6YnhpaldO?=
 =?utf-8?B?cUhSZ2dGWmUzVUxxME0yVktIYnU4SHhFYi9rdHN4QWluZDdjcGZ1ejdHK1ow?=
 =?utf-8?B?dEhHUFA1VTFuRFJyVC91Q1BoRkxia2FnOXFTWFlDVGI0cTROaE5TT1FjWWFZ?=
 =?utf-8?B?QnRmSUd6VlJ6UC9XTFRCNVlucG5mVDFRdCtqc3p4MWpWS0R1R05qOUhpcXlh?=
 =?utf-8?B?UlJ4ci9LZCtRVlZuMUJOZHJIaGNoWnlId0hBdVU0b2R2alpYTVVkMzB2eHFT?=
 =?utf-8?B?bnJLRnZEbFNIVWRpMXpVWDAvM2phUlpmVVhSbC9pSFhVL291NUtaYi9NajdH?=
 =?utf-8?B?M0htb0dEcUxYVXlZaUVoYk1XSWs3Q0FjOW55c2ltdDVsOFk1cnJ5R1E4QTZs?=
 =?utf-8?B?VTR1Mngra0FaNVoxUzNZQ0pyTmw1VW1nU0lQZS9TcFpYZGtkRktjRnh0RVpG?=
 =?utf-8?B?RGE2dUF0OWt2NnVHUTAva1lNbHRYZVZibWR0bnE4U3g3T09ndDAvelB1dmhC?=
 =?utf-8?B?dXUwb1pEWEhEMzJ6UHcwWlgxdHlNMEFqbXFEREJVa0lTNjF5ZmhSTW9SUy9p?=
 =?utf-8?B?SkRRbk40VWd0VGxLUStjaUliUmROVCtLVzExNzMxSng5Y0YwMGgwamhEbnpn?=
 =?utf-8?B?NWFvajlWeXpydHpyaEk2ckRBV3RqZnhCdWNmalFhYVJUdXpQT05QOU4yb0dZ?=
 =?utf-8?B?MHZTeTR2TnVWQUYxbjVTMVBKYXhxZFBFVlczL0k3dXhNbEdqRmVNYWg4VGFF?=
 =?utf-8?B?Y3p1ZStnTTV2aHVxcEhIN2ZUemF1czNqWjI4eU03ZGw2c0ttTUFhZWNRY2VL?=
 =?utf-8?B?QytlaUtyUkZyYThIVWJPU1VaMG1MOSsxRm9lSGFKV05LZVcrSWVKMzlrWGNE?=
 =?utf-8?B?Tk5hOHYza3NRYzBvcnp0TFRVMTdoSjNuRzJldC9UVjNPWUdWZzlIRCtYUlFT?=
 =?utf-8?B?VFN3RVhMeXpQTklGazdJcFVyOUxNeTdXUVpURTg1eG1ScE5qbW9oa3BWTm5B?=
 =?utf-8?B?VUgxaDlYM1I2bC9lc0c3cUxvU3B1TUdaR2lsVnZWQU5QdVpFczloODIzYWpt?=
 =?utf-8?B?Q3pVeCsrQmVNdDd5a2gzdTVyWFZhekEvQ3BnL1pocTd3c294YWVJZ3NFKzkw?=
 =?utf-8?B?bVhUNFI1eGdiZTQyeGRXd3o0VGdITXZMTWZ5aEo5cHhDQjhEcHhQSkE1blFr?=
 =?utf-8?B?SXNSM3RYcnBFS2tsNTVLWk1UaHJpN2d1aWxKUjVnbFlOTlBFbXN0bHVKYUdT?=
 =?utf-8?B?RFhmSjBZYUo1ZjhIaE1RMHJ5RlpDOGY4OVF2YS84WlQ4Yk5oQlowWC9DRjg0?=
 =?utf-8?B?R2dnaGFlNHZJMHFwL1BBcU14alNUZThGVGhwYVRDOUVLYlJsK1hIRWxQSW1Q?=
 =?utf-8?B?bkJtWk02ZzNNVHVaM1FTNCtURkpTc3lKd1lSdnBYOWVTRTRuUVFlc2FIcGZs?=
 =?utf-8?B?YVJQMmREbWU3MU9UM1lzZ2ljNzE1bUJURHJsWnZrT1ljVDAxWk9yY1F3OFJH?=
 =?utf-8?B?eW9xSDFDQldxUW5zb1pvNGFyLzRtd0lNM3hxTk5XdUMrOGpRTmFQOHArUWph?=
 =?utf-8?B?bEVIZXpMR0tFSzljbmluMytiOFM2QUJEZEhEaDBrMCs4Zjg0QytQYUVweDFG?=
 =?utf-8?B?dTRvWWhkSjBZdkZya3NXU2tXNHVhcjJxUTlva0FGMGM2SnVQejRYdHd5ZHlY?=
 =?utf-8?B?RlhIYk9TTjJxOVVnL08xMnVTam1HdHoyNFkvTWpwbzdoZG0ybm1aOUNOdjFV?=
 =?utf-8?B?cW5ENGJTeHJlMlcveU51Sm5TS0xPK1hOdGxlYnoyUE1HalFOTDVNYTROdURi?=
 =?utf-8?B?c29Kelk2Uy85aWJZbDA0eE96THRMb3FseURGRmV5Z3owc0U5bDFvVXl1YWI1?=
 =?utf-8?B?dzMvSzNJcFg0Y09ubS9nSTBZTlo2WGxJWlp0cURiR3RRUjZ0WUllOEhaNnhm?=
 =?utf-8?B?bDErUWhEYStrK3lxemhyWjZvZVkxTXY0M2FUSFRuRFA2OE1tUkdXMkFWQUhX?=
 =?utf-8?B?MHNmTzNEL0pRbDExTTV2d1o5NmtRL2ZJdGcvTk1uRDR2WmVWMFo1Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d747693-e2c6-4855-d453-08de52adda4d
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 14:12:58.0445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PLc67SiuUp5KZ7uXvCW32aXc/gV4FX7s5ixfx22I7v3VOUS3OP9qeQEp/R1ZN5mKCwWr0BERojOjt8yacj/9xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR03MB7198

On Tue, Jan 13, 2026 at 01:47:19PM +0000, Andrew Cooper wrote:
> They're dynamic too, and don't have named fields because no (other) logic in
> Xen ought to operate on them.  In particular, OSPKE being visible depending on
> whether we're in HVM or PV vCPU context when scanning.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

