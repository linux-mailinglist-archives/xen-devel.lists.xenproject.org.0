Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9EEC77E76
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 09:29:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168415.1494429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMMW1-0007fC-LS; Fri, 21 Nov 2025 08:29:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168415.1494429; Fri, 21 Nov 2025 08:29:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMMW1-0007ce-Ip; Fri, 21 Nov 2025 08:29:13 +0000
Received: by outflank-mailman (input) for mailman id 1168415;
 Fri, 21 Nov 2025 08:29:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QF7N=55=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vMMW0-0007cY-25
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 08:29:12 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2729e5d3-c6b4-11f0-9d18-b5c5bf9af7f9;
 Fri, 21 Nov 2025 09:29:11 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH0PR03MB6068.namprd03.prod.outlook.com (2603:10b6:610:bf::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 21 Nov
 2025 08:29:08 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 08:29:08 +0000
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
X-Inumbo-ID: 2729e5d3-c6b4-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w3aoGCuUw2QBkgZib9EGPV6JhwoUWpn+Xu9qkoaH90pu3+4CRVq2pahK++Rgebe11BgCd/u0Tpd+pOueJH4BQWMrzsleDqGwg0/EYeTtpu1Z970t6UfUERR54ZUhWVyEKu3OZC/PrtN7IAd5ByHKukFF66t+x08XGizH1TVmRz7cv6/1gOvWWSLtdVzU1ZmkGRYYpFXT5ITF7wtIiiaTXk9U1GB0mE2OUFvUjBjQZ7mOi0T4xCKvsCwsxpzMAcV7AY/fQnnWK37OHiEMywaq2Ym8QHNbJ/4cNKbEIM3x3qaFUPRxTo+2O7zuezrxbw9BLR2wf246lxk/RLGt6LqI5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m3+FLy3ZaFZ+1WFf3VTb4XnajdGp2/5/++y2cxypV9Q=;
 b=N52VDWI9lLgaGB5kBvtpSz14nJBBZ28owM9Pyf8K5RYAI5inK0x3zbbI6LJfVeHL6NlkCl+LYZ8oGsxN1VSOQifUx+avLUB0B6uhHMuf7TlqNy9HecXSyc7LW3m8rSr7KYP6Ro9mRGexLu3PzkZVwQLSm8wurBWMPdBVpz7mL7dl3h5izZICjbzc+Vi+y6O6l5rIzp5MnFQcn1vvWGnqTPNKyA9AW1XkIsOQrkrEdIhcMuA4XHfy6T4aygUqypZD2UuNb1jdsLRcMbfqN9cVi2zXm8bURqCkaKsow6fK+gNZNdnTue1HZoPZnOuF3e/dyXxcrI9odD66t6glxVKkpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m3+FLy3ZaFZ+1WFf3VTb4XnajdGp2/5/++y2cxypV9Q=;
 b=THgLxGhMzMTIDkIYN6qeOhWU/1Ekih7NxwEFliOragjDRJY3Lyd6rLtHRdCOVsgjdp4wMbO/aQJtWKvk93K5IzbwZl1LuMrpogeSQBYm9z0IdPgf8OR9av11ZCM4XF6OUuzshEqkZxNKKArO36FEMwzoY9fGHX8fLiSz3pLVN1w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 21 Nov 2025 09:29:04 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 04/12] x86/irq: set accurate cpu_mask for high priority
 vectors used by external interrupts
Message-ID: <aSAi0IyDBKhqND3W@Mac.lan>
References: <20251120090637.25087-1-roger.pau@citrix.com>
 <20251120090637.25087-5-roger.pau@citrix.com>
 <3491d3ee-08b8-4678-9f18-5a4daa972e02@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3491d3ee-08b8-4678-9f18-5a4daa972e02@suse.com>
X-ClientProxiedBy: PAZP264CA0011.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:21::16) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH0PR03MB6068:EE_
X-MS-Office365-Filtering-Correlation-Id: bb387e35-1dcc-4d15-5de4-08de28d80a25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UmVDUnVJekJGL2N6eWdTd2ZiWExjS0FLUzc1bGFkeEJYMFozWHJZT1cwUzNN?=
 =?utf-8?B?RU94bW02YjFOVG91L1p0SzBVL3pxSlNKMXRVZk1XZHkzcURqL0JXSUE3YjE2?=
 =?utf-8?B?Rk9JbUpBTGNjdllWU2JMTGsrbWZzSnJVRTlRc29RMEJ2SU1SWXo4MmF0WTNX?=
 =?utf-8?B?alJjNkg1Y3lINE9NN25CQ3I2T2lSNFFlUWh3a254V1Boc0tVZWF4bkthV1VV?=
 =?utf-8?B?OGpQWDBCeDRuY1Q4dFRVWTJoWWoxR2dhSnAySUxKblVEdk5xbXpCdGMxM0dG?=
 =?utf-8?B?ZmhheGZxY1N6cjNETksrbUwrV2o3OG5xUjdxSTEwTWNBYmFNN0RTSnYvekdG?=
 =?utf-8?B?dnU2OGxvTkJpc2d0dTU2ZDNFSkg2b2ZkV2ZzUjNnY1JiWEVtMm1HYXl0NnJH?=
 =?utf-8?B?NFV4YjVqKzhmbGs3YXdqTU50aE85V0ZpbXppNHhhYUFvYitaSy81aFN1TUpG?=
 =?utf-8?B?NktTNXRFWVE5MlBWNSt5UGFHQkdxTnlpTDFOeWswTUgxcitjWmRqWUkwTk1n?=
 =?utf-8?B?ZTU3eERpOUl1VURDUXZwTWVXMmNpbDVROUdocldZVXlZTFlWbEh6cUVjUWNy?=
 =?utf-8?B?Y0tyMHFSSm9XNFRtem1pRTRkN1VtYXR4dDltWTZyMUdqSThLM2pVZTQwSzFP?=
 =?utf-8?B?SFhVM0Y5NmcvRTNTakFnL0s0ZitDVDN5YW01UkFrdU1MS1JkL2RhcC9FN08w?=
 =?utf-8?B?cUNNQnUrQWl3VU1NWjdFSTdPYmluWGpTRWNlS3ZieGhneVZuMzJJTmk0QXIv?=
 =?utf-8?B?NFZhUGk0U0RROUVsSUY4ZGpyYmFueXV0eDV2TjI5VDZaN1dqelFTb0M0YXJ0?=
 =?utf-8?B?QUZKdmZsZjRKaVRjWG9rd2lScjVUZ29vZVFVcG1XT1RrdnVoeDBKejRacjlw?=
 =?utf-8?B?VUlTKzRWdjRsSlliYjlIek9kT0FVYmhNN1Jaa0ljSjdVdTlrdnhmU2JOTmFq?=
 =?utf-8?B?OWhoZTA5VysrOXU3VkJVSHhtcENCWmUyNjA5SDFTTmU0WkpzaldUZXcxeTZC?=
 =?utf-8?B?Y1ZjSXpEQ1MzQzFCVkJPU2RVdmVqVGk2RCs3VHhhdXIzaFBvVDBETkpLT0NN?=
 =?utf-8?B?UzYzYzhiQmQzSjA1SnpkT3hka1lIL1dldkJ2RUo5Z1A2Um56YUN4QlFheHNH?=
 =?utf-8?B?SEp3TEhnWmZiMy9RajFUUkE3Wnl4RFdDZ0ltY2w2SFVMZzROUnVySlk3bis5?=
 =?utf-8?B?RC9OdlZSNGs3Z2JnNjZLVmpQT0hKTjJHSW0wSjRZMTVRVzlISUphdVJheWVu?=
 =?utf-8?B?N3BVN0VHdjlMT3JNRkJhUitpeUU2Si9ySm9rUlRiSm1ZNm9vVHMyS0ZmQ1FX?=
 =?utf-8?B?bVI0MUFnQWp5dVdDQjhTTEpkb3VDTVZlbDJhM0RpWktZZXpSSkEzNzFxcjBW?=
 =?utf-8?B?M3Jsa1hHT2dObWtEeHJGL3ZMcFNxK1htaDNSS09oRTE0QVUwWDFOczkzUFVL?=
 =?utf-8?B?c1BSZUVhNUZKRnZMQXRXanpCRXl1V2hNM00yUHNwUlgrSFEveVlYT0tYMXhU?=
 =?utf-8?B?d1Fmd1FMS1hoWENDL0ZQTlFiMlhlNDFjSVRkYjJpNXNuK3d0ZXJPQytmMHhs?=
 =?utf-8?B?cVFYUVZlTjRXMmNBU25aelJkRW1HRGU4SVdXMHVIdG9uZlNTTy9UdlJ6cllj?=
 =?utf-8?B?SWlucXBQZ0kreHR4YkJTZ01ZK0xNN3JVWlQrRjRDbnhGTVM4NjRxK0xrdDF2?=
 =?utf-8?B?MXZzaXkwbERCMnVhOUlYdkd3cjhUWW9ZOWc4eWhpN3g1RGZQNHJjYVBkYWFG?=
 =?utf-8?B?T25sQlBrckpqa1R2RXp4bW5DcXhmS09NUHI4dGlhcWFNZENCUkRHTmZibDJH?=
 =?utf-8?B?bXFqQlEyRCtvZENqK0VFYWZ4WlVSQ2cvZXg0bGwrSTdvOG1qTVI1T3RDTGw0?=
 =?utf-8?B?RmJRWU5SVzVqWHN2Zkl6c0ZoM09pL1d4K2ZUblBreGRNQlhnbVUrMHVuaXQx?=
 =?utf-8?Q?IewRBDu7fePR+nMWVfJfkIA5+zVxSMv2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXhncDdXVzFQSzFSZmZqdGxxMDhFbk8rcHo2Zko1QW42eCtvMWJLNENsOVBR?=
 =?utf-8?B?cWtLbEQyZ3BQM3BBdExMTktZZUFBRVIyTVR2Rytkcll5aG1QNngyZjZsQkYw?=
 =?utf-8?B?OXc4enRlaTZOUDhhOU5OY0o3eVlqUzd1NEYzMVdPeEZ4WHliSGFDMHpKNlZT?=
 =?utf-8?B?OU9LVkt4dlNHREtpZVVwL1Nwcjh4U0xLZE12anliUmM5VUZ4aDdGMlFIMjE2?=
 =?utf-8?B?TEFRdHArSThhQmtodVVxQlhyYkFYdnBKOGVYZXpMZ0xWd3plMndSazB5cG1I?=
 =?utf-8?B?M0VBRU9iUFUvWHJkcXVVdnVSMWxLaTNwaXlIYjc0TmtNZk9rRDVaU25hU2xM?=
 =?utf-8?B?dGRQWVU1Ukd6Z2EvL2ZNbXVNSGtGOG1IVjVoOEhnSEtVc1REMzVscHM3aThR?=
 =?utf-8?B?Z01XOTdwWW1vTjRlYkZyb3MxSUphRVRzdkZBdkQ2TE96Uk11YU9hTktRaTFL?=
 =?utf-8?B?UU9xRHIrTG9hWFg5TDYyclFTTHY4S1p4VzV1cExaYllPaXpWWHlHMzVWbzJi?=
 =?utf-8?B?aVNtbTl0SGx3MFVwYTFLVm1QbTFvcFJtUFRacGlOU3BUNlRmc2xxams1TXhs?=
 =?utf-8?B?V2NVQnBRdlFsSmdNK1ZlWWNrQ1craW4rWXlDc1d5NUw0OWFSNDNFY1hyUlpX?=
 =?utf-8?B?TVZicTZIaVJHWnlrUDM4bmxpcXc1aDVFMzZWbC81TURWNXgrSlpSNEJqbE03?=
 =?utf-8?B?Qmk4T0lVQ1AyRFkySk00MGhiZDRqL2xIUHhGZ05ucUtpZ0JZbXBEUEJlNCt0?=
 =?utf-8?B?cmZ3RHJDa1QwUU1BbVM4ZFRBUlQ5OFNuZzY5a0hkMFNTVldBaHhGWjM1Qk5y?=
 =?utf-8?B?OXdZTHN3bGdPUU9kWHpxSFZwSDRoeTFZQWZ4enhxRnpPTmgwdTVONjlFVkRJ?=
 =?utf-8?B?dkVMQk5kWTJvamg3Ty92eUE5OU44NE1oL0ExTjZvK3JBRWhQZUdLY00yK3pw?=
 =?utf-8?B?VXJ2VkFRL1kvWHVFbXNmZzFZYVNJSmFkMzdiTERsMVozckptME42cXhPRlhq?=
 =?utf-8?B?SUptNlhCd3d3Q2NMM3dvUGFYaFV3R1J0M1BPbGxSRENxYlJYZHdCU01wK3Zu?=
 =?utf-8?B?STltd3l6TDlFOXZyQlpka1QxN29xdHVqdlc5akVWVzIxbllBRkJHTnUvb0pz?=
 =?utf-8?B?SGIwY2dhUHBNanNZdlQwWk5CVk5IZzBvQmJwWjB5WU1xRmFQOWhLUm1oVk5a?=
 =?utf-8?B?RjRiUmc0VVBWcEZBcnY0NEdUYXlqVHlkaTU4RW8xU2trZXd0aFdwSWtRREc0?=
 =?utf-8?B?bVZ1eGt2QUFscDJXTHN0ZC96VEtJN2tkZDljVDBWRmVLR0F6eEREMTJ2K240?=
 =?utf-8?B?aENPWmZ1R3pOZ1hpalRlWDhROTZlVE9wZWxvREphL3VGQlRlaGJiQUI0amxt?=
 =?utf-8?B?QUdpQ3ZRVG9zZHMxSnAyYXVGY0s5NGdBRVBPMTFCZ1lQejlpSFFzU2xEditX?=
 =?utf-8?B?M1FPQnB1Nk1WZFU3bzhpZlFpTE1jNHcyb3p6U1o3eEdTTkFmOWwxeTM0QVQ1?=
 =?utf-8?B?Yjg5TSs1dU1ScU14THJKOU5qSnNJVHdpbWdkcVFHRFdvU2NnT1p5N1BsQkp1?=
 =?utf-8?B?Q0gzOVh6WXRseVp5c2l1Y0R0TlVYa3VBdGhyaTd2QU8xSHcza2xsVE1uUTVw?=
 =?utf-8?B?YXBKMEpKL3pDWjlpaXQ1UlJnNllhbkdJaHRLejRpODlmbGFjVWVoZUZYZEV5?=
 =?utf-8?B?dVh3MDdhSzI4V2RxWkp5Zk5vdThHOTdMUlQzYmdINlNDeHFXaFV3RXJhdHJL?=
 =?utf-8?B?NGErWnVsTkRjdTRIald3YVFzeGFlQ1pWSi9mTWNIM2htZkZGdE5IdFcxUEx2?=
 =?utf-8?B?c3QrSDRhVnhqQlRpcDQwek5TaVY1a1pyTGhJMzdwNWMrMjNGbjNmb1BLbVNM?=
 =?utf-8?B?dGZqSUxIbk84WlpiWXBUODh0UnBMVWFYUDB2a1d0NHlpa2JJMGs2Ui90ajVK?=
 =?utf-8?B?M21TODZXU2lSSVFVMkhGLzdRVzFwekJieGV5ZStITGtVc2Y2Mjc3ZlBaRE83?=
 =?utf-8?B?cFl0Y3E4Zkc1ZmRSblNkQTMwR2VSTlhXc2hZK2N0Qk9EMWxXL1ZKK243R0FK?=
 =?utf-8?B?TWgwWDdXTmdzeE1Bc0tJbksyRjlZd3BHMVM2VWhWbHNSNWx2WXpMQ3JyRFA2?=
 =?utf-8?Q?fHQNkDtK9BlvLeQkwSPf6Sv4V?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb387e35-1dcc-4d15-5de4-08de28d80a25
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 08:29:08.3609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qTX6Va5w+cxipvK4CA8n6W2KosRVanGdmSeaz4LsrQ8+qAPoW8LPIREpbyD3SIm0v/MH/zkvf2AKvZnCoJwcbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6068

On Thu, Nov 20, 2025 at 02:06:39PM +0100, Jan Beulich wrote:
> On 20.11.2025 10:06, Roger Pau Monne wrote:
> > Setting the irq descriptor target CPU mask of high priority interrupts to
> > contain all online CPUs is not accurate.  External interrupts are
> > exclusively delivered using physical destination mode, and hence can only
> > target a single CPU.  Setting the descriptor CPU mask to contain all online
> > CPUs makes it impossible for Xen to figure out which CPU the interrupt is
> > really targeting.
> > 
> > Instead handle high priority vectors used by external interrupts similarly
> > to normal vectors, keeping the target CPU mask accurate.  Introduce
> > specific code in _assign_irq_vector() to deal with moving high priority
> > vectors across CPUs, this is needed at least for fixup_irqs() to be able to
> > evacuate those if the target CPU goes offline.
> > 
> > Fixes: fc0c3fa2ad5c ("x86/IO-APIC: fix setup of Xen internally used IRQs (take 2)")
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with one further request:
> 
> > @@ -756,12 +770,10 @@ void setup_vector_irq(unsigned int cpu)
> >          if ( !irq_desc_initialized(desc) )
> >              continue;
> >          vector = irq_to_vector(irq);
> > -        if ( vector >= FIRST_HIPRIORITY_VECTOR &&
> > -             vector <= LAST_HIPRIORITY_VECTOR )
> > -            cpumask_set_cpu(cpu, desc->arch.cpu_mask);
> > -        else if ( !cpumask_test_cpu(cpu, desc->arch.cpu_mask) )
> > -            continue;
> > -        per_cpu(vector_irq, cpu)[vector] = irq;
> > +        if ( (vector >= FIRST_HIPRIORITY_VECTOR &&
> > +              vector <= LAST_HIPRIORITY_VECTOR) ||
> > +             cpumask_test_cpu(cpu, desc->arch.cpu_mask) )
> > +            per_cpu(vector_irq, cpu)[vector] = irq;
> 
> Going beyond desc->arch.cpu_mask for hiprio vectors may deserve a comment here. When
> the vector is global, this is necessary. But for e.g. the serial IRQ (which still
> moves, but isn't bound to multiple CPUs, the more normal way of respecting
> desc->arch.cpu_mask would be sufficient.

Note that hiprio vectors are handled specially in _assign_irq_vector()
and the logic to set per_cpu(vector_irq, cpu)[vector] is
short-circuited assuming that hiprio vectors are already setup on all
CPUs.

> It is merely (largely) benign if we set
> vector_irq[] also for other CPUs. "Largely" because strictly speaking if that vector
> triggered on the wrong CPU for whatever reason, we rather shouldn't treat it as a
> legitimate interrupt.

I see, yes, we could handle hiprio vectors more like normal ones and
do a bit more work in _assign_irq_vector() to also set the
vector_irq[] array at bind time, but then we would need the cleanup
logic as the interrupt migrates, which is a bit of overhead when we
know the vector won't be re-used for anything else.

What about I add the following comment:

        if ( cpumask_test_cpu(cpu, desc->arch.cpu_mask) ||
             /*
              * High-priority vectors are reserved on all CPUs.  Set
              * the vector to IRQ assignment on all CPUs, even if the
              * interrupt is not targeting this CPU.  That makes
              * shuffling those interrupts around CPUs easier.
              */
             (vector >= FIRST_HIPRIORITY_VECTOR &&
              vector <= LAST_HIPRIORITY_VECTOR) )
            per_cpu(vector_irq, cpu)[vector] = irq;

Thanks, Roger.

