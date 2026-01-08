Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DCFD0540F
	for <lists+xen-devel@lfdr.de>; Thu, 08 Jan 2026 18:57:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197942.1515291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vduFX-0001Zl-MS; Thu, 08 Jan 2026 17:56:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197942.1515291; Thu, 08 Jan 2026 17:56:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vduFX-0001Wu-In; Thu, 08 Jan 2026 17:56:43 +0000
Received: by outflank-mailman (input) for mailman id 1197942;
 Thu, 08 Jan 2026 17:56:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AIqS=7N=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vduFW-00014Y-1x
 for xen-devel@lists.xenproject.org; Thu, 08 Jan 2026 17:56:42 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62324028-ecbb-11f0-9ccf-f158ae23cfc8;
 Thu, 08 Jan 2026 18:56:40 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS0PR03MB7280.namprd03.prod.outlook.com (2603:10b6:8:12c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 17:56:37 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 17:56:37 +0000
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
X-Inumbo-ID: 62324028-ecbb-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iHtcB3QTZON/mkBv8o7h/UnVzTSarJRYI/oqJvu9ZMllEUiy51gIhw2+I1HQlOPCta0hcVKr8GxY5gwDBAYksV3xj10Qx75q/kq9gP7l2eLwTPk7qCi6wjglCI9vhJDvrrsFJSjtDZT355WuglZB0pBXQIGD+9mJdmlgFsNE3abm4X57SJEUCoHe5JlMQkF+PThqrduIxaXMKGCKVn4KVjrF3apHqZqgP87sh9IrnT0K4yksxH5F6SVbA3HKHeIAI0OhUA5ly76lwRUdLfegJ7E7OWo+b4P5qnyL3X872TIOlQUfWfbabbCPRlWo2k0wm78OQICXJjx1DDVvToIesw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qLeYbeiYVBzspwgvGufcYntDd4XSAjSRXDth92loYbI=;
 b=eDTZJEMWuXuSgHsFxvHF5kl3OavfxE/nxOZqRTqKE97DKbWHPce+Cl75nmZ0fOpDO5x8M0Tuk37iT9yX3UsFm3WITISFoo+CfCElCmvJrF5MXi6EhURg9yrwYQKig0CryvVJjSS81ALlihDF8lyRvi0qv2VqxmmnwRlmqbrKDLW6t8nyGKfHhdl85k4MWHrTGoZi9pmtM05tbC7UVwccM1X+llY4aFk7ieNQBhi/Vqpv3z8iljVsqgQYrxAqwMKJOp9iNT5MVZDoCPYO+34VoRlCzvGO9FCUFNuoA1aF2DX7BP+6yVe78wNBp6VEEYXFDti0j26jf+/NWjIicM4k+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qLeYbeiYVBzspwgvGufcYntDd4XSAjSRXDth92loYbI=;
 b=SH/cIKFbRuLAS9+ZnwP+Vc+EvyoVG4MKisAjmb7921FQrF8oMolKrFa/dh77ZFYpcxyfcrOUQn4khM5AnBabeF548mrxjZai1/MdCmol3JEEHoGRC+zQ1KowUfUNfnNrKHiBcfN+BMBOsSaW96yIaeDx/7b7oik3phN6N+PRJMs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/2] xen/mm: limit non-scrubbed allocations to a specific order
Date: Thu,  8 Jan 2026 18:55:36 +0100
Message-ID: <20260108175536.82153-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260108175536.82153-1-roger.pau@citrix.com>
References: <20260108175536.82153-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA2P292CA0023.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::18)
 To CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS0PR03MB7280:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cfc125a-9c3b-4dc4-f0d2-08de4edf4493
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NWtlUHZnNEpnYzJxYXlPQVQ2b1RhK0hEdUY0ZlhzM0xCTmZwcmIxaHFySm90?=
 =?utf-8?B?Wm5yNVdXd3g4N0drTmZXekJ4d0d4VzQwSlA4cmlQNE5YWDI2eGc5MnlaOGxR?=
 =?utf-8?B?TU5uYkZmaklUaWpnbTRpNERUbnRZUFdnVDRYVUdDc0JxZHV4ZmpzUXVZT0Q1?=
 =?utf-8?B?ME1vaFRtQ2M5TUtPd0wrQktTSWdPd0RhRG54MGxPVjV3RVVnUzRwN2hqNHVy?=
 =?utf-8?B?UXpPUUNkNDM3MTh2dENGN0IvZ3UrZ2NMcHRyR3NWenFkRmg4c1Via2lFZjF1?=
 =?utf-8?B?MTNaQ2FWRkFpMzBwYy9ibVNiRWFiYkpnL2x3OXRtMXBUaTVpYTBpbTJjUUZp?=
 =?utf-8?B?UXBCUVhqU0hxYkZqdUZWdGlJdkJvSG43SjlYNHBwSkU3ZXJwRWMzdi82bG5l?=
 =?utf-8?B?Z1NUUW1QMWcrVVgyYzZWWWRDZXFQejFYc25FUmkxZytNbkxpdWovaXFXcEls?=
 =?utf-8?B?bkd0OWI5WkZvRExHOXFEdGRQMVByOW9pa0xvUEVSNUhkRGgzM1czNE56dGlG?=
 =?utf-8?B?clNsK2Ira1c0NE0zeWJRR2EwV3J4ZDBvMHl4K2NjVktoUktGZS9JVmI2K0Q3?=
 =?utf-8?B?SWdiOURQaExJYlN2N1l1VkFIRkRtcTFDVnAwV1NKMWV6WDNzR05wRVNIK0Zs?=
 =?utf-8?B?cEQxSFNZeVVoaDhJUitxd3I2YWxiWjNBUVdFRU1Kd0FGU3FNczJyZ2lxWTgv?=
 =?utf-8?B?VEJTdFFOOUsrajdTb1NpT3pNSWJYUHl3Q2kyZEp3TGlrZDhUQUhNZlAzSjFt?=
 =?utf-8?B?anBlVVVyMCtUZlY1NnRQRkl5Q0thRlIxTzRYZnluempGdmlmM3JpT3hnWHJ3?=
 =?utf-8?B?dk1TZUtpbWMvdGVPcGh5dGk5RWMxd2xGRTlzTU9zVzk5OVowdUpRMkJTcEhH?=
 =?utf-8?B?NXdxUVRtZnlJZThzaDNIRm44MUlWUEgwallvNldZbUZZYTUxazJwcXBUR2s0?=
 =?utf-8?B?QTdHdldsbGtBZjVNS3o3blg0WXNnMGNONmwzMzFadGt6VHlpZWJqZjNYMXIv?=
 =?utf-8?B?bkM3bEw3dWRTa2FCQkw0Uk83VkxFb2tORlBCWHJyU0Vtdk5CZ2k2SytFazA3?=
 =?utf-8?B?M0FWVUZya0FVbFVGMDJncGF4Z3hTVnFmT0hQNGtLcFdQMVF0N3NBcmlJZitP?=
 =?utf-8?B?cGE3ZjAwbE9zYmJ4b3NDSHJwdE0rdWhETks2eERBQ1lNVHkxcit3L0xNa0xI?=
 =?utf-8?B?UHFPdExncktWQThNMXhmcGd2dzJONnFGYmNGYnV3T0swUHgvb3pOMFQ4Slpq?=
 =?utf-8?B?ZkRneDF2dXh1T28zS3pYb2RFdE9xamloMjN4Q01zbVRONjIzcGdGOEE1WVZG?=
 =?utf-8?B?UkpoQ0RqcmM2QThncDFOVUVldk8zRWtFeWFkT1RRbGVJREdvTnFiMnMrQlpG?=
 =?utf-8?B?YmNTRGZKOXd3QmRaa1MwOVJXbTdnL0dERUpCYnpWWXdVOW9QQmtWaWhXOTNm?=
 =?utf-8?B?ZnVqTFV5YjE3NU9xQUFRa1Q1RzRBUmh2bCtHdjhmYmQvZ1FWcFMxbHZ0ZEpJ?=
 =?utf-8?B?L1dQa0gzOU1kNlpuaTZnK1lYUjFVcElmejhGU0U1UG1rS0d5Q3lhVnFjWmFW?=
 =?utf-8?B?RDJtSHVYUlF2bkdReGlCU1hJdEFNZnJPdEQzRWI0V1A2ZFl1a2luczR2Y0RL?=
 =?utf-8?B?NzdkRmZSTWlrb3M3dHBkVkZDUjl1Q3d3d1V3R0RKck9tUXVQdDA0NHd0OG1J?=
 =?utf-8?B?WXpZMnJCUkdKNnhYWTBuZTEvVnJkVjVYM0RHa3pYSnI2eGJXekJvR0RWWUJC?=
 =?utf-8?B?VTdjcGtmZTQ5dVExb0s1OEhDT0dxYUxOMkJ5eE9MY3dYRmRoN1BTeXJldVQr?=
 =?utf-8?B?RC9FSUtCc3p6NFBDeUVYdTBaMnNOenBvQWVMZmdLbWdVYnhtdFZTQUFNVTZF?=
 =?utf-8?B?QWtURnRnT0tCS2NkZEhyWDNDQytESHpjK3hJLzMzV3gwNEI1S05SUnlxZG5U?=
 =?utf-8?Q?hqkjVEtXzhPQkjxQL8MQkebxti3awq9L?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEFMTDJlVU0rSWkvWXVBYzhxNUtPNWN1cDc0MWYwUFpUVjlsTytsd1dQYWNJ?=
 =?utf-8?B?ZDhtT25XTUxTSFNmVkJjVXUwWTdPV1QwTW04Y28zSWtiYXJHY3R5d1dTdTJn?=
 =?utf-8?B?UFl6ZGJjM0dCL2pKSkNtT0xlVDV5TmVZaXBZejluTG9hclNvTUVTVmNuWXVG?=
 =?utf-8?B?QjFNc3BCQlQvTnNkOFFXU1ZGYTVHYXV4c2JCTEY4b1BXYktZWmEyV3l1Vngx?=
 =?utf-8?B?SDNyM251YzVkV2d4SnpIK0RZQWQvTnJVaFp5Uk5yaDJlR1hkb29leXpQZzEy?=
 =?utf-8?B?ZTQyWmxrWnBFV2pQRU9RUnNVREZPZmVTaTMzMFlVY2xDYzVXd05GOFlzZFgv?=
 =?utf-8?B?dmtpRE9IWGZRRW42Um13cjRUYktRNFdlRi9QdnN6YVNQY3plNnRUckVUQ1J6?=
 =?utf-8?B?dExUTmpMQ1FnM2ZtN3dZS2o4b2NiQkltZ1JMRGxJTEtZdXVBUitZMm56ZXNh?=
 =?utf-8?B?Y3luTmYxUmc1cjUzYm9CUTR3TGttTjNnR1BqMzJuV2NlaTFTWkdneWlERHFr?=
 =?utf-8?B?REZtdWZFZlMxN2hPMnc5RU4yQWpGT3N6MCtVVGJ3NUNzbmRSaE9CaXZkaFcy?=
 =?utf-8?B?bnlQZThGMEhzNE15TExOUFJDTzErUy9BZWw5elA4eU1uQ2g5djFoLzRXRFFU?=
 =?utf-8?B?dmJHYWxVN2szZFgwZHBGcWh4dk5JTzFsck0wQzVaUzltSmcxdW5YL2ZhaTNT?=
 =?utf-8?B?OXBLcjBPamdqaUdieElKVXlIRFppTUlxSWhOOFYycGpqZmpaSUNlVDczUkxP?=
 =?utf-8?B?b1U0a3ArNFhXeFF0Q1ZEYjdFZHR4N3RDZFhEVy9hMDBhMk82Ylc4MytVcTBL?=
 =?utf-8?B?b0JWWVV0bHVOQnlHaG1Lcjd5UmZLdm5KVjhGSVFqTk9Md1VCaFRLU21Xb3VJ?=
 =?utf-8?B?cER3R3pSRm9LZlp2cDRONjBrM1A3UEQ2S2JONzZkVVZYRC9wYWl5MHFSL3Fq?=
 =?utf-8?B?UXJuL0wzYTZYbFFuc1AzQVFlVHFpUld1bmFlQUFJTGJMSjdWZEZZaWVEUDh3?=
 =?utf-8?B?cTVHQ1ZzRVg0RENheFd6dExGdkRPclFWQmhoc1ZsclJWZGkxZVdGZU8xM3Nm?=
 =?utf-8?B?ZUlWRFA5V1JUS0lKY0tYM0NVdTVDRUxjSzlaQzJ2QmFsR2pSRHNNNnIrNTAr?=
 =?utf-8?B?ck9YQjZReGFjUWlJbWdaU0U5MktYNGFqNXpZSmx5SjBrV3dtZ3ZpVUh5djN4?=
 =?utf-8?B?eFpjY0p4VEZXNFFkcVIzNENJWVpNL2pFcnBkZ3JFZDJJaTZKK2VLbXJjS1Qy?=
 =?utf-8?B?UDVDR3NnSDAzZWRuOFpLc0RibDY1TkVWZGtQb3p4dTc0OEFUbXVnd3BGQ1B2?=
 =?utf-8?B?NE1mKzQzNHdBOHBCeXcrdkQ5S0MxNTNMVXhrdkY5d3JQdUswdjlQaGRYbTNr?=
 =?utf-8?B?a3pTVFdmZ0orRnZNOFQ0M3ZqK0VxcC9mWVRFZXRZMUc0UXdvYVdHK0JnSkhw?=
 =?utf-8?B?cVltcDlpZU8rdDBCeUJlb0NOTHAxS2p6YVhlWFNOMS9KVkVSYVlEQXZtcFhL?=
 =?utf-8?B?UmMwSTNnMDduTXYzbmdjV1NMTlh2aDNCOGRPZ3MxMUpaUVN5Mjc1WHFEb1dj?=
 =?utf-8?B?VEZMWHZ4NHFHcnVQQnhHMndQYS9Za3JYcEdUNnNPQTJ6QTFCMVEvVXVTVWMv?=
 =?utf-8?B?ZlpzUmVtYTRuSUhYZ0F6RXdoTFdiek1mNjZpOURrWXVNZlRqdG5qTnVXS3Qw?=
 =?utf-8?B?dVBXVExvZGxiUmtib095MitTVysxaXFoZDZwYTc2QVB3N0Zza2ljZU5zUEY3?=
 =?utf-8?B?eFU2ZUd6VmtnYVVtRkJpdFE0eVVBNUI4ZHdpd0xmNjBLeDRQYnpYRGRpTW14?=
 =?utf-8?B?LzFMVWJRd0pqNzlyUU1remhrV3BtUG15a3Z0NzA4akVoOXJPMmtqY09YVThH?=
 =?utf-8?B?RGVBaTNkbkxzZ3RsOUo5cjBLa3ZDUWJEdW9aZGhqV25SRUg0bFYzTWJ5UmZ3?=
 =?utf-8?B?QmhpUDd6Wm5WNjBYTWdhY2JKRC9OMFpUUXB6ZUJwa2lIdkJpQmVBQzVJMHdB?=
 =?utf-8?B?NGFnMVZIT3dsaUxIbXBSQzBkbWdYZU4vdmdqTDlhalMvMG9jcGRQQjZ4M2Rs?=
 =?utf-8?B?dTNVSkRWZFEyOG5ZSm1ZbGZsVDBHbEtmdGl3cnRRT1grUlo4VFJzOHNCL3NW?=
 =?utf-8?B?bHpaWklwQXE0SGtNeVk5SFN1UWJIMkVTSXcwblhmUkowMGpmMUFYWk01OEda?=
 =?utf-8?B?YzUrRTBCQ29YM0J3cklJdnpBc3lNV2h4OU93YlVyWjhQTnlEUzNZcWpuR3BN?=
 =?utf-8?B?b1FmVTRHbEUrR01LVnlkbmFRb2gvN2dkb0hjMlNCS3pwRVFsNHMrTWlQb1Ba?=
 =?utf-8?B?eGpSZjFWVXdpajVFSFltLzZCYmxLQ1k1c1NFaVJlUFp5a3RZblJHQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cfc125a-9c3b-4dc4-f0d2-08de4edf4493
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 17:56:37.0161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dXAe6/IDjdZk8OyIfsmv/OIvadcIOXyJHAEYVzMUHWqI9+rqyA2lkP0gImtgtGwC8EytlHNrb81ugT5KQJHWyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7280

The current model of falling back to allocate unscrubbed pages and scrub
them in place at allocation time risks triggering the watchdog:

Watchdog timer detects that CPU55 is stuck!
----[ Xen-4.17.5-21  x86_64  debug=n  Not tainted ]----
CPU:    55
RIP:    e008:[<ffff82d040204c4a>] clear_page_sse2+0x1a/0x30
RFLAGS: 0000000000000202   CONTEXT: hypervisor (d0v12)
[...]
Xen call trace:
   [<ffff82d040204c4a>] R clear_page_sse2+0x1a/0x30
   [<ffff82d04022a121>] S clear_domain_page+0x11/0x20
   [<ffff82d04022c170>] S common/page_alloc.c#alloc_heap_pages+0x400/0x5a0
   [<ffff82d04022d4a7>] S alloc_domheap_pages+0x67/0x180
   [<ffff82d040226f9f>] S common/memory.c#populate_physmap+0x22f/0x3b0
   [<ffff82d040228ec8>] S do_memory_op+0x728/0x1970

The maximum allocation order on x86 is limited to 18, that means allocating
and scrubbing possibly 1G worth of memory in 4K chunks.

Start by limiting dirty allocations to CONFIG_DOMU_MAX_ORDER, which is
currently set to 2M chunks.  However such limitation might cause
fragmentation in HVM p2m population during domain creation.  To prevent
that introduce some extra logic in populate_physmap() that fallback to
preemptive page-scrubbing if the requested allocation cannot be fulfilled
and there's scrubbing work to do.  This approach is less fair than the
current one, but allows preemptive page scrubbing in the context of
populate_physmap() to attempt to ensure unnecessary page-shattering.

Fixes: 74d2e11ccfd2 ("mm: Scrub pages in alloc_heap_pages() if needed")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I'm not particularly happy with this approach, as it doesn't guarantee
progress for the callers.  IOW: a caller might do a lot of scrubbing, just
to get it's pages stolen by a different concurrent thread doing
allocations.  However I'm not sure there's a better solution than resorting
to 2M allocations if there's not enough free memory that is scrubbed.

I'm having trouble seeing where we could temporary store page(s) allocated
that need to be scrubbed before being assigned to the domain, in a way that
can be used by continuations, and that would allow Xen to keep track of
them in case the operation is never finished.  IOW: we would need to
account for cleanup of such temporary stash of pages in case the domain
never completes the hypercall, or is destroyed midway.

Otherwise we could add the option to switch back to scrubbing before
returning the pages to the free pool, but that's also problematic: the
current approach aim to scrub pages in the same NUMA node as the CPU that's
doing the scrubbing.  If we scrub in the context of the domain destruction
hypercall there's no attempt to scrub pages in the local NUMA node.
---
 xen/common/memory.c     | 12 ++++++++++++
 xen/common/page_alloc.c | 37 +++++++++++++++++++++++++++++++++++--
 xen/include/xen/mm.h    |  9 +++++++++
 3 files changed, 56 insertions(+), 2 deletions(-)

diff --git a/xen/common/memory.c b/xen/common/memory.c
index 10becf7c1f4c..28b254e9d280 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -279,6 +279,18 @@ static void populate_physmap(struct memop_args *a)
 
                 if ( unlikely(!page) )
                 {
+                    nodeid_t node = MEMF_get_node(a->memflags);
+
+                    if ( memory_scrub_pending(node) ||
+                         (node != NUMA_NO_NODE &&
+                          !(a->memflags & MEMF_exact_node) &&
+                          memory_scrub_pending(node = NUMA_NO_NODE)) )
+                    {
+                        scrub_free_pages(node);
+                        a->preempted = 1;
+                        goto out;
+                    }
+
                     gdprintk(XENLOG_INFO,
                              "Could not allocate order=%u extent: id=%d memflags=%#x (%u of %u)\n",
                              a->extent_order, d->domain_id, a->memflags,
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 248c44df32b3..d4dabc997c44 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -483,6 +483,20 @@ static heap_by_zone_and_order_t *_heap[MAX_NUMNODES];
 
 static unsigned long node_need_scrub[MAX_NUMNODES];
 
+bool memory_scrub_pending(nodeid_t node)
+{
+    nodeid_t i;
+
+    if ( node != NUMA_NO_NODE )
+        return node_need_scrub[node];
+
+    for_each_online_node ( i )
+        if ( node_need_scrub[i] )
+            return true;
+
+    return false;
+}
+
 static unsigned long *avail[MAX_NUMNODES];
 static long total_avail_pages;
 
@@ -1007,8 +1021,18 @@ static struct page_info *alloc_heap_pages(
     }
 
     pg = get_free_buddy(zone_lo, zone_hi, order, memflags, d);
-    /* Try getting a dirty buddy if we couldn't get a clean one. */
-    if ( !pg && !(memflags & MEMF_no_scrub) )
+    /*
+     * Try getting a dirty buddy if we couldn't get a clean one.  Limit the
+     * fallback to orders equal or below MAX_DIRTY_ORDER, as otherwise the
+     * non-preemptive scrubbing could trigger the watchdog.
+     */
+    if ( !pg && !(memflags & MEMF_no_scrub) &&
+         /*
+          * Allow any order unscrubbed allocations during boot time, we
+          * compensate by processing softirqs in the scrubbing loop below once
+          * irqs are enabled.
+          */
+         (order <= MAX_DIRTY_ORDER || system_state < SYS_STATE_active) )
         pg = get_free_buddy(zone_lo, zone_hi, order,
                             memflags | MEMF_no_scrub, d);
     if ( !pg )
@@ -1115,7 +1139,16 @@ static struct page_info *alloc_heap_pages(
             if ( test_and_clear_bit(_PGC_need_scrub, &pg[i].count_info) )
             {
                 if ( !(memflags & MEMF_no_scrub) )
+                {
                     scrub_one_page(&pg[i], cold);
+                    /*
+                     * Use SYS_STATE_smp_boot explicitly; ahead of that state
+                     * interrupts are disabled.
+                     */
+                    if ( system_state == SYS_STATE_smp_boot &&
+                         !(dirty_cnt & 0xff) )
+                        process_pending_softirqs();
+                }
 
                 dirty_cnt++;
             }
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 7067c9ec0405..a37476a99f1b 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -92,6 +92,7 @@ void xenheap_max_mfn(unsigned long mfn);
 void *alloc_xenheap_pages(unsigned int order, unsigned int memflags);
 void free_xenheap_pages(void *v, unsigned int order);
 bool scrub_free_pages(nodeid_t node);
+bool memory_scrub_pending(nodeid_t node);
 #define alloc_xenheap_page() (alloc_xenheap_pages(0,0))
 #define free_xenheap_page(v) (free_xenheap_pages(v,0))
 
@@ -223,6 +224,14 @@ struct npfec {
 #else
 #define MAX_ORDER 20 /* 2^20 contiguous pages */
 #endif
+
+/* Max order when scrubbing pages at allocation time.  */
+#ifdef CONFIG_DOMU_MAX_ORDER
+# define MAX_DIRTY_ORDER CONFIG_DOMU_MAX_ORDER
+#else
+# define MAX_DIRTY_ORDER 9
+#endif
+
 mfn_t acquire_reserved_page(struct domain *d, unsigned int memflags);
 
 /* Private domain structs for DOMID_XEN, DOMID_IO, etc. */
-- 
2.51.0


