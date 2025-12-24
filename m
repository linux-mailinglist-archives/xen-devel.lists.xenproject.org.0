Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B28BBCDBA65
	for <lists+xen-devel@lfdr.de>; Wed, 24 Dec 2025 09:18:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192843.1511908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYK3x-00080Q-Sl; Wed, 24 Dec 2025 08:17:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192843.1511908; Wed, 24 Dec 2025 08:17:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYK3x-0007yy-Pu; Wed, 24 Dec 2025 08:17:41 +0000
Received: by outflank-mailman (input) for mailman id 1192843;
 Wed, 24 Dec 2025 08:17:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wdbR=66=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vYK3w-0007ys-7t
 for xen-devel@lists.xenproject.org; Wed, 24 Dec 2025 08:17:40 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01011d1e-e0a1-11f0-9cce-f158ae23cfc8;
 Wed, 24 Dec 2025 09:17:37 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BLAPR03MB5634.namprd03.prod.outlook.com (2603:10b6:208:285::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Wed, 24 Dec
 2025 08:17:33 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9456.008; Wed, 24 Dec 2025
 08:17:33 +0000
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
X-Inumbo-ID: 01011d1e-e0a1-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o39aVvLPtRuIP1N9jdIEFn8ucrGrvti/UAuF+LtCAzaQYV6eo4xEc70ajyDw7nHzjLlkX9pY51cPKEG5lDvOKXwMjzGbd5oSIhp/qfoGxLswHb/b2stk6E7+fBMKLxQiR6oEUu9eHlcUIuvFJni4refZVoxbayjNeDeeTOEFv81LIHC5MhWiHzCqgZMTzmWBnpo4xNP2lhAP1VbekotHwuNe1zI7OlxoKI1XFZ8/5TRAH4pJtRzc4vhT53N+WhyNqtV1qW7DIEiKq0eeD19zk0cB1PlJjs54HW8b5KWhX5dcbROyBPlyTcgTRPu9evBwUkKtVGoS7wwwl4Z2EfXsfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CTahpwMeHwoRU7rCM0+wTlP3UJuNAFgkSFY/JcHmG0w=;
 b=A+Xa4V/K1OZ9lk2Pvelo/PR/iX4xSsaMXMeSRSvYP4wvb/yOlYR+ZiV18g3DDQ+/PFzArDQsagkxQVo/ZcRx4YO3MMOB1JxqCulZRVFhwu52+y2tq0e6Pux5TyHk8Cuym4V2kRLfCGaAa7lgXgdZ5PNFC+WY4VLfpkGVLQGBUU5t1J+opHZ4glfRmdpsih8bMrDscFjpOZJRHPMSR9b1aK+eHO835fnfXg1q58kc6+kUMbkADjzhCbWQ4eMq8HpGn1Bnh+gLO1sPtRNzLrZxYjWu254Fe/xP9bFDRDLNQtKEZV8kqijm970mnCpGGF5hJUODiRX6yuOvPbtNtIbEKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CTahpwMeHwoRU7rCM0+wTlP3UJuNAFgkSFY/JcHmG0w=;
 b=tSb0dFXtsyXMskGAEuxCl/PWwyxc8Arc+QZcAz47ZRg/f6pxXwSypJ3L9KIQHTI9f5SDQEncAsuOqRef2/1mMJiqgSbihzNr7tQGZRd7nUC9r8Jr1Uv//Vhewb6e9vm3zGB+4nRMvSjbojKEVdTdEaNlWS6HlR69YwfjeWLZJG4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 24 Dec 2025 09:17:29 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: xen-devel@lists.xenproject.org, Bobby Eshleman <bobbyeshleman@meta.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] MAINTAINERS: remove myself as RISCV reviewer
Message-ID: <aUuhmQt2BYrvWiDd@Mac.lan>
References: <20251223173614.2638823-1-bobbyeshleman@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251223173614.2638823-1-bobbyeshleman@gmail.com>
X-ClientProxiedBy: PA7P264CA0447.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:398::11) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BLAPR03MB5634:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a91ad17-3032-4df0-2678-08de42c4e384
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bzMzTklocE93RjJ2b0kvS3E3ZmZLVlhmZ2NQNkxobmkwZ25rbzVqZWtaaHNi?=
 =?utf-8?B?V3ZTTFFWZFFnZkJwRmZtdmRXcnZpYjBxdml6bWZZRHRkNFBEdWQ1SzhwUSs4?=
 =?utf-8?B?TUZnN3I2SEY5N1prckJZWHZMYzluNE0wc2l6RHY0VTVpdWFUOW9VY3hqaEdC?=
 =?utf-8?B?N1RqVExGSjVLOVpzc283TGtlbW1TMm8rUHlNY1h2dzRKRTJjMGxlanpUTE42?=
 =?utf-8?B?RDJ0ZVc4QkpZS0pkeFBQbGpRR0VZTWlRMEhtVWhuaVViaHEwYUV0MUxBWVBr?=
 =?utf-8?B?QUFwVGVNOWZnYVFWZlF3aVVodzV1OUsxNWY3VStrY0RoN290MUpzcHE5OEE1?=
 =?utf-8?B?aGFudGgyMkVud2RCU252Q2hNbGtGRDZDR2JIcm5QKzhvaEVVa2ROU3VTUDFK?=
 =?utf-8?B?WlVxVTFnandIL1h0LzNtWlpvajdPY0VEMHBpZy9nK3FjOEROeERkMmdTK0xh?=
 =?utf-8?B?SnQ1RE1UM3RjMmFlcUJRclZXVU1COEd6YXZmd050RndtOXFUNE9rZlhHNURi?=
 =?utf-8?B?MHhtUjdrMm5sUExIYnJzOVR4TElCbS9BdXNWM085QXZyVE9jeDRBT1ltaHUv?=
 =?utf-8?B?UnQ3N3dMelFxTXBHbkZYdWFJd0xscE5kNmVhUEdaVy9WUlJ4MHFIWVpucXYz?=
 =?utf-8?B?d3k5dk5HU2JSZlV2T3V0bFlackRrMWVNbWVwaU5hVFM3Zis4TTJweGMxbENL?=
 =?utf-8?B?QitRazlVdGRJaE9Gc3pKeUYxSGk1Z0pST2xCVGNmOWE5c0MwY09weS9SY1hw?=
 =?utf-8?B?Y2xGRitlS2RQcTc5S2FMdGdsWmI0bFF5Z3E3NEdRVHNNNXo0ZWtmWnNoT3Rj?=
 =?utf-8?B?SUtwS3ExejdBdmh6RGhyY2t1SjlVeWlQMnJaV0lWNnRqeU1EaysrUmdrUFJl?=
 =?utf-8?B?R2JqS0N2ZDlBVnZRZFJzSk45WFB2c3NXZTkxNXdocFJTbmFoVE56S3lsajBX?=
 =?utf-8?B?NVppYW4wa0ZEYi8yZUlGcHJJMTVYRVA1RU83dms0RE1QZFpRM0QxdXpyWkRH?=
 =?utf-8?B?eGpYSFUyaWlXaXNXTXpVcTJjOVJBM3ovK1J3ZkRaR0RSUXRtNkFVQlJwVU5r?=
 =?utf-8?B?eSsyL0lFU3JncFJNZXFIMStQR2VQeExpVzk1STI2VzRiaWpmbkZKY1F0Zi9p?=
 =?utf-8?B?czgwUnIxbEduWW02V3AzMDZZKzB2aVJGRDFlMnk0MGRkeUkwUEJQN1hPNkhh?=
 =?utf-8?B?VGxwZCszOWJ0bnU4SGlSbVhNNHFvS1J3T2JENzZHbVdaQUhPMUV2UCtFZVRq?=
 =?utf-8?B?SVRGVXhrd3VCdXNIODhWMVpZak9UbHVUNzcxQk04NlBwNXVKdFhvajh6Vnlt?=
 =?utf-8?B?NWVSdUxBOHl0K2FuZXA0YTNEMFlpbUlwNnpHUmF6ZG90SGppN0VIalN1Z21z?=
 =?utf-8?B?Z1RJTzRrWjZ2bTlBdUY0WFJkNGdjajAzQUpobFJPUzFQVkFpNmFKWk03aUt6?=
 =?utf-8?B?Y0k0UllPajlHK00yUDRGNmprUTZyRkp5Q2pVSnhjWWlHbVZTd1RKdko1bHNK?=
 =?utf-8?B?S2tPSWxpckd4alNTb2xqV1VnRW9sM2E3NldTeDlpOTZJOUNpWTR2eVQ4Wnp3?=
 =?utf-8?B?dnpBSjVaaDZ6dXBRMUNZTUFKSXZlNUlUM3VJVXJqMXlsZWp4WnF2Ulg4Y2JE?=
 =?utf-8?B?bEVGWmRuRVdkY0lPQXk5UkgvT3NWdkU4U1hlaHB0Ry9xUkRndUlLOGlUc21r?=
 =?utf-8?B?WSt5WHM0OHFrNURUOEZ2dExUSmR3VW5IejFaTjMyVjNMUUtvV1NDTWNDcGZt?=
 =?utf-8?B?MUYyODVDTHJTK1R4UWE5dVgzY2Y3WjFOMGhJR2pHRXdpYVRBVDRtV0pLL2s3?=
 =?utf-8?B?NFl3T3Z2eUxSRVVHdVpQZ2NENU9oU0g4cnJRanQyOGRlczUzWm9UbHFsM3gr?=
 =?utf-8?B?TWUrcFd4Qi9ZcENqbTFMeFBqVEZ4ZGhMN1pzcE01S1cvTGZ0TGV0VDByT24x?=
 =?utf-8?Q?xUB7NuO9qbwlRwKvwXVKIuvN24oZotEC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZjlKcWR3SHdQZ1kydXRrSFdmV25la1ZScDRpVGJ5OE1qcVNNZEE3MVVsdUxZ?=
 =?utf-8?B?YVNFckg4VDlBT0FvV25RMUJKZFNIYnlZbDRyaXkvek0xZGlLY2p5bFZyd05Q?=
 =?utf-8?B?MWdsY2lxL2RuZ0FrdmE5Vi9kbkxZdTltY0tLVkM5R0Z0WGV2R1ljTTFOcFU2?=
 =?utf-8?B?RDM1Zm1ld0ltTVRocFZQK0dBaDY3QUk3d0JYUHR3clM0RzBXRENhUzFZQWlT?=
 =?utf-8?B?ZFg2UkdwSkU3OWY3NUkwN3BaTlFOQ2o4Uy8vWkwrTUtTN29YT20rdE9UWjFU?=
 =?utf-8?B?MHRTQkFCZGZjSWtiWDk2SldDNG5tNzVnQ3RHMnIzUThGRzQzVGZacGs0UUlR?=
 =?utf-8?B?Q1diZXVBdlpNSkhGcU5pbVZXeXM3ZkNhWmt6encrbGZrdVl6cksxVEJMZFRu?=
 =?utf-8?B?UE5QbjhmMmlBTHZSdnlCNmxudEprbkJwaUJkQWY2UTQzK2lMaGlWckNGMzFs?=
 =?utf-8?B?d0RuOExzQ1EzTTQ5bmpjQmFqb0IzZnhQc3pIYWtMVXNTMjIwSjB2SzZFaHIx?=
 =?utf-8?B?QkN0SE01YUJvWGd0bHFFQTkzQUJybklBZ0FmQmphVGY3TCtxTWV4czdaQmJa?=
 =?utf-8?B?aDErQmxxNW04NVYyS2dpK0JCbGJJUC9CeVUvbXp1UEM2SVpGUkhuODdmMzBm?=
 =?utf-8?B?SlJZQTFVRTlBamRtRnNkVjBsbmVWTmV2K0lqa0FRWDVYQXgzbENUY2trb2E1?=
 =?utf-8?B?V0EzS2tJZXVFckhCMFNLV0tDKzQ0clhMSEtNTWNNbWNTZU9wbWhQc3ZQMW9V?=
 =?utf-8?B?SzRKMlc4eVdQN0wzV2NuaWxtUGdPSjBxRjdMbFdkSU5JM2ZGai9sc1VnN3Yy?=
 =?utf-8?B?MXVYWnhzdEFacEMreUQ3Uys0NmdsM3o4MjZsT0l3a2VEaHlHVDRPTWtjQzV0?=
 =?utf-8?B?R2FWdWVyWFFVSUhZTkVIdlZpaTNGRGRHcXlaMndFS1VrcFlMbnZqeWdVcGlB?=
 =?utf-8?B?QlY3Um1keUlhR0RZZ3JnT1BwNFNTZ3Yza2htWE1iNzd0SWx2RlRSaWdKMmRq?=
 =?utf-8?B?dVhNUzh1THo2OStiTmlFRDMrWlZrZTk0bmdDNjkrTG9kM3p0WUJUV0pLV1BB?=
 =?utf-8?B?Q3VsMXVQeUExaFVGa2hYVFlMd0M0dENVWHhjeklvbFVFVmNoanRZSlNmZmdS?=
 =?utf-8?B?dHcrUTFSU0ttNmtsb3NKaGJHeU90T0xEd3pUa0EvdE5RRisxWUdqYjRpcVdI?=
 =?utf-8?B?R1NSdWhycTJCRldObytPbDh2MHYzeXFvYXRIODBzcVIzZVJFQmEvL3h1Y3NH?=
 =?utf-8?B?WkFHMlVWTzUvMVY5SFpKbkZuRGxPWXhiRUthbGhnWDhDWFZsMHE2bEQxc2U4?=
 =?utf-8?B?OE8yVkdYUjlhdE9OUFJrNkhjODFMNm1Qb2d2VnhzZm0rallzdUlUeTFzbDd4?=
 =?utf-8?B?SGlNTFRLS0FUZit5NlBnUWtybXAxelJYWGpFY1ZQeGVGcVNjY3RJUHJrVmxs?=
 =?utf-8?B?NUM3SWVpbEZ3QlhvY3pETXcvWlc2eG5ybHAvNjFWRkNjeXdTQzBlUlJ4U2tW?=
 =?utf-8?B?U0F2K0pweUNjUmI3eDFTK2Y4eFRjVExoY2JZWEFDeEFLNFEzSkllTVVMQlhy?=
 =?utf-8?B?dWFWZnAzNVgvNDF0MklINHdqeXJmMzRSdWFTR3Y5bEJUOTRZRURBaDhoWVR4?=
 =?utf-8?B?OFRWOUt3WEZmSUdBblJlSCs5TU1IcU9FQjFvOEJYWHdhNzd4TnhCS2Y3N2RM?=
 =?utf-8?B?Y29UR010bTljUEU1c2JuNW5sS29QanA5RmdqaWltMFFVaGM2S2E5NEVBaUlI?=
 =?utf-8?B?Q01yN052dDdvSXhyV0JnWnNQclYrRnJPSk1QNXVwQUZacEt3eWswZ1NtU0p6?=
 =?utf-8?B?eks4L3dkc0NUUDVOUjZlUDNrbVI3Ris3RFJoczljZ2VSOTlKZ1Z1ZWRmZC9I?=
 =?utf-8?B?b21wUjQxRFQ1dmlMaEdzdDU1RU9OL3ZLbWhjZHByazFtV3JPT0tYSnlBNlQx?=
 =?utf-8?B?S1BMK1QvM1dSeDFBWGFBNDd1UENkWWlka3RDcjZoYkhTSHRCYytBMURLL3Qr?=
 =?utf-8?B?S256WkU0VFdXeEJqcE5wVVM3RUw0MEdDSkRKRVF4UzZ0YjlsTWhpOUVMWlhn?=
 =?utf-8?B?L3p2U05nOTMrdzF0RUNaQVV6VmRHV1QraTRuUWR2Q0VEOFdjRVBDaGtyeGxQ?=
 =?utf-8?B?L2M1M0lteEVsZjVCaDRmTytWclorc0Z4ZWZsUTJLR3dBbmlxU0hNMUZCdjIx?=
 =?utf-8?B?ZnpwMnc2RGtpVUgyUVI5UGh2QkJnUDJ0S2VIRXR3aHB6b0dLQy9jWVF3enlk?=
 =?utf-8?B?bXlyM3ZnL0ZVaWVLdnljLzlBQ0hpd3BnSjFVN2c1bEpFemp1U0FDcmpUZm9H?=
 =?utf-8?B?V1BkZ0NVYk5jdEJleDNnRDJZTWhjNG9NSm1kdkRXdmtxYmFOUFAzUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a91ad17-3032-4df0-2678-08de42c4e384
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2025 08:17:33.3983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w3zLL2ObF1tM4F3yEHGBDtP8MaaB9E50peIBc+j0UG5bOh5N+CJjvyOQ/9ZzDDDooGWgT0E9y4WSwjl8IR3u3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5634

On Tue, Dec 23, 2025 at 09:36:14AM -0800, Bobby Eshleman wrote:
> From: Bobby Eshleman <bobbyeshleman@meta.com>
> 
> I haven't been actively reviewing Xen RISC-V patches for several years,
> so remove myself from the reviewer list to better reflect the current
> reality. The RISC-V port has come a long way thanks to Oleksii, current
> contributors, and maintainers, and it has been exciting to see. Many
> thanks to everyone, I hope we cross paths again in the future!
> 
> Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

FWIW, it would be better if the SoB matches the email address in the
R: entry.

Thanks, Roger.

