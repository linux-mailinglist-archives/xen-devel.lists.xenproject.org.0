Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA70D1DAEA
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 10:46:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202802.1518233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfxSY-0005vp-Fn; Wed, 14 Jan 2026 09:46:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202802.1518233; Wed, 14 Jan 2026 09:46:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfxSY-0005tO-Cy; Wed, 14 Jan 2026 09:46:38 +0000
Received: by outflank-mailman (input) for mailman id 1202802;
 Wed, 14 Jan 2026 09:46:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=47rf=7T=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vfxSW-0005tI-Tx
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 09:46:36 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8dbfdaa-f12d-11f0-9ccf-f158ae23cfc8;
 Wed, 14 Jan 2026 10:46:34 +0100 (CET)
Received: from BY1PR03MB7875.namprd03.prod.outlook.com (2603:10b6:a03:5b1::10)
 by DS7PR03MB5653.namprd03.prod.outlook.com (2603:10b6:5:2c9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 09:46:30 +0000
Received: from BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19]) by BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19%7]) with mapi id 15.20.9520.003; Wed, 14 Jan 2026
 09:46:30 +0000
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
X-Inumbo-ID: e8dbfdaa-f12d-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dypwA0ggMIL9lOSa7HRQW2aXNLWq8m0abVbmpwR07CL3EpwZ8toBtkRl+nHv+TxqZN6XMeFI7bXk3TAYNjsc89vHi+BaXutTlHz8vcbJwW0VhNpZgwA9AWl4e2d5H4Ti2nhp2YLjSU5miHbRxD/uInQHeLzlmTnxxKiOPOTgyYGPaDxoEs52DTmUDM2l9Ou3Q0S1cRUQXDtXuIQA6inIKUBEdSb8HIQ8DtgVacr5g71Nen+cp9qYQt2p2A/sKqd69yoyUk4dB+ykJs8QKFEjzq745OhjRn4ky5z6KB6raKR+opAsLNzPYwQ5JYOCm9gzQyaRGMQVJpe9Tbajby3Y8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A2IM302llfb4oEErpfodosiaxgX7R77kHT2yj6APyKM=;
 b=iTeAkN8wCRix4HJDp00CqXEUoVkhaxMNmZhPA3uL0nPVrS1GImcuYdsaxgPCKSN0JwzgFa/eKl3INGkT5P3EF93fH0V4TcLSDHWjPNQQSJGaXZJAlSZpufH1TiotyNgTwFlKgGRs0dyqENVQDX3FWXnKSoT6A5Ju2KvWaV6qJ1ZNtFtcUmJRIiE8wKyZd5NArO3cWJC1VYghuyrSqO4bV7iv4FwpyU4nH2Kt1/GUr8n3D/Uzg0jg5MIAB32BbE13rRoJcbf4AdWiBy3aKAbrnS3yA6FquJburth5YLP/+Jm+M+WuxvHxhYAo7GpoPkFvxcy3FhHlpsbCKZLjR/peyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A2IM302llfb4oEErpfodosiaxgX7R77kHT2yj6APyKM=;
 b=y3z/2NK4g1zpME7cj5GFHrGY5W4AEQfDuyQMkz2Xd2n5Z1ViPedAMhLOS6H4Mo6wOPlFkdPZtG1NhtxshKmvkOcklyaiickUDa9L1RcqSEamGLCY0N09tZttvXKgrjFgB56D/M4wPrVmgNbPcH3rZqtZV/wkwf+BEexO1Yl3jeA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 14 Jan 2026 10:46:26 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 5/5] x86/time: pv_soft_rdtsc() is PV-only
Message-ID: <aWdl8t75tdlvEwvr@Mac.lan>
References: <66a53368-9c33-436c-858e-2b2d25ae84b7@suse.com>
 <5467f5c4-e752-4d44-bbb7-05e6fa1a672c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5467f5c4-e752-4d44-bbb7-05e6fa1a672c@suse.com>
X-ClientProxiedBy: MA2P292CA0016.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::14)
 To BY1PR03MB7875.namprd03.prod.outlook.com (2603:10b6:a03:5b1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7875:EE_|DS7PR03MB5653:EE_
X-MS-Office365-Filtering-Correlation-Id: 10fc46b5-099a-43b1-d761-08de5351cb6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?akV2Z2JGb3FweEF2VG83dmgreGtIc1ZSTHJ2a1p4M3VYSmdBR0IvM1ZEQkt1?=
 =?utf-8?B?NlcwMmROUzV3ZHZoTS8vY0ZaZVRhVTJjZmw3SStweWxJT1YvNEcyQ0pGMzFr?=
 =?utf-8?B?ZGc3aTZJYnpYMUptS25vSVdYUTZBbTIyTjJWeDhxMytUbi9KWVpoYnBvcDIr?=
 =?utf-8?B?YmxxTGZtZWpsNzdlek0yV2NXL1hzR1NIMWRLLzhqZmQ4OUhqNU5wTzNsallJ?=
 =?utf-8?B?aVNrRGJmbitkMzIwRGl5c0NiaFo1Rk1rWHpkbkJVdkMvU3hrZ0ZZbUVtVUNS?=
 =?utf-8?B?N0xzeWNXTCt5SVpZdStZbnlJbW1wZU85a2JlM2NJSWluc29Ya0RZNDMxbklu?=
 =?utf-8?B?UFJUQ0VpMVQ0M2dPWHRTRTVicm1Gb1ROaTdWTW0vTEZaeDR1cWdvdFNWRDVp?=
 =?utf-8?B?a2lYbm5LU21VOFF4L2hCM1lwc2RxRnlvU2hTR29CdlN1Y1Y4TENJb1VqWnZw?=
 =?utf-8?B?NjJLWXA0SjE0a2h1TEtYVDROUDJxMUlURlZabmlLeVBIZm8zUy8zNmMyZzBm?=
 =?utf-8?B?QXVmb1FUemJPNExQWWUwenRJSG5hdUlIZ2NiNUhrcnBhYmhoZ1ZITURRN29U?=
 =?utf-8?B?dFNBZmdiZHF2OGRrTkd3eU1vMUwzdWhUSDc3QmsrYkRtYmtnWVFzTEtYM1I5?=
 =?utf-8?B?RnNicktmdTJxT1dkOWlJV215QVoySmhzUlVvRm1keWpmRGR1bTNmWTd0QVlX?=
 =?utf-8?B?NjhHRWRMUnV0Mko5UXk2MGx5QXRrU2oyS01VMGZ5eHhQaHVaQkd0TWErMWkv?=
 =?utf-8?B?ZEgwY1pnUlZDMDJzUlVkK3V1RHYxaUl3TkpycnNBUEJMUnhuaXJPK2ZLd0xa?=
 =?utf-8?B?M3hpV0IxUCtma2tuY2lqeVFURlVCTVpHQUJiTWVZbUd4RzdPcWxQakZsTk5a?=
 =?utf-8?B?VjJKMFkrR21kbzNoVHd2bTBRSWpXMW4yaTFYYkpJeXp4cUxEU0hGRlBjMkZv?=
 =?utf-8?B?dFNYMjBhMExPa3V0cHNlaUY1NXdMOWpvcjYxaTdPbDRrY29DNGFzaDlkV1Bo?=
 =?utf-8?B?WElXOHU2VjJTYmdZZnBoUVQyaUpOQ1J2cjZOdlJhTDM3ZVc0RnpxRmhmV3gz?=
 =?utf-8?B?RFEvOW5sckpHTjBRNW1zeHFwenE0U0xOeDdhSUM5QUZWZWdHR1dnSzhHREcy?=
 =?utf-8?B?ZW5OQmJjVU1qTmY0RXRYditwRUlzUmFKbUZmaDg4SUM2VjhNSVQ4QmJzS2dX?=
 =?utf-8?B?UjVhdUwyTU81NHdHVmh5NmhhUThyakNCYlBtQ2NReXlvWnFUYWJ0M2lpejZQ?=
 =?utf-8?B?bEZxSHRSekVQRW90RFJ4WWs5c2VRVDZOZHAvUG9oU2dwU2Iycm03c3U1cHVr?=
 =?utf-8?B?V1ZyVCs1enRXSmttVlRWSG5PWHlxSVkvWmpnaUU5MUFMTFlFcWk1SmxtYmpE?=
 =?utf-8?B?OC9Hejd4L3Y3Z3lhSW84T0RqZHIzMVJweGM4V0VmejdObUxBZWtKN1BqZGtj?=
 =?utf-8?B?aWNCQTZZRjNoTVFZRHJGMmpiWVJiVmNONXMva2U4V2xZcXhDM1VkcWx3dHAx?=
 =?utf-8?B?ek9QbVNadkgySE43ZHd5cmx5NGR5eUZqSGlQQ0VqbEtuTTRTK3hiWW1zVEhK?=
 =?utf-8?B?ZzI0aXpyT1JrNVZ2RDI5bFRsSUpnR1M0QUtTZ2NKTDQyUXVnbUV0alZqRGdD?=
 =?utf-8?B?TFVPMGVvYTVsM3RQakhSNnZDQi9CcWZIQ2tiUkdjNFlzUzNrYTFKcklrTDJm?=
 =?utf-8?B?N1pseFJYTmZYNSsycmJXNHhKeGZFeWV5SFhnWmI5My9ZZzcxWVVha2E5Tkww?=
 =?utf-8?B?blUrbzdZbGFiWHlLYzlvRGpOQmFhVTRqVkdMNDlqVEhMQW5UVUJYcFBmQk42?=
 =?utf-8?B?Q0x1N0VuV0hTRjk0aGhPK2dVL2MyemNnNnZ0L25FYkNxSk9oRGVDaERPUHY3?=
 =?utf-8?B?OGppM3MvK0xyaXBWdmVQU0VFRG9jSTIwanREeW0xeGNTNXJsai9Qby8wYUQx?=
 =?utf-8?Q?egNZP7e5nHrqssdleKNv+eWNrNnsHnwY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7875.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L00wYlU0NnoxMTQ5dk9FMFU2WkFqZE11Nmc4djYwMGErL3d6WlRjcUZZUmYr?=
 =?utf-8?B?YzhycllNT0FDTUFBaURIOTJXZjY3bjJYaGx1N3NXendyZnFXeUpRcnF4QmtJ?=
 =?utf-8?B?clg5QVQwN1RWSW13RUpmL3Blbjd1RW00dkthcS9JWk05MHJXZGQzcFJGdzV3?=
 =?utf-8?B?S0F0N0ovMm40MURuV1VITGhicGUwMlNkck1YRWo3STNSbzlsV21DZytQV3pT?=
 =?utf-8?B?OEorUVBDRGFuSkNQNjMrNk1LK0NuK2YydGc1Zmd3RE1YckhLZUJmay90WVk3?=
 =?utf-8?B?dVJVaHcvc2ZMdzNtekVNOGNVVGtWYW1pWnR6WElDV1NQbXdlUjMyVERKV1lX?=
 =?utf-8?B?M1VyKzhFQnhHVjQxbE9tbmY3bkFyeit5YldHdkt0aE9JOWQrK0NidFA0QzZN?=
 =?utf-8?B?dVZHTzA5cEJoSmEvYmVKUXNnbFdpd2t3YU5QMDRCZ3Y3YVYrNDI0TFcxcUlk?=
 =?utf-8?B?ZFVHZW55VkRZdlVXWFU0MXplOVcvTCtJL0VTRkRQTUJZUEtSNFBSVnQySWpP?=
 =?utf-8?B?cmZzc0dxdElLY2p3TzF0cjBiWFc2RXZvckxRMUdQbERhLzkrQ1FRYm5xNVhn?=
 =?utf-8?B?cXBpTEl4MWEwZ2w1MTNIL2F0MXFIdjRESmcveUlBbS9QdG5rVVRkd0NEVnA3?=
 =?utf-8?B?M3FPdU5VYUlKb2J0d3YyZmpOMndNTENvNzhxdllkQjRwMDFKOXdDTWpVZ3k1?=
 =?utf-8?B?OG5aTnlyRmtoRGZKUlNNVTk3UnB2dlBvb2M2eWZFTDI2VkFVTEo3aFB6OWxC?=
 =?utf-8?B?YlZuUEMyL2VTZ2IxZ2hibE9wcWZCakI1UERnZlFqNlkyKzdFNmVua0hySHVt?=
 =?utf-8?B?NHJOWDAxWHNFTUZ5VzNrVVpMd3JwbER5L0VBTm1idy96Z1c2Uy9tNEkwN2tm?=
 =?utf-8?B?aVNpK3J2RkRpVDM5Mm1rQ0JibnVDUm91cytObmpBVWs2azMxQXlMWkJSaGMx?=
 =?utf-8?B?OHhJaXBLWE1CWWw4TksvaUNhVHBiOHVwaWpTUmpTWGkxVHVLNjFUbkpIK0pr?=
 =?utf-8?B?NTF2N2taaXRTNkV0ZlA0ajUzRFNHb1BhV3RtYWFsTVRwcVRFN0hacHAzdkt5?=
 =?utf-8?B?L1RGaHFBYzIxWCtmQUlYSmttKzBTdHp2Y3BheENjM3N5cjZxQ1l1V05UZWJC?=
 =?utf-8?B?MU5BeHZDTEVxY1o0LytBbzJRcnJFUVlwNk1DamZFSkR5SlJPbWFwKytxUDlT?=
 =?utf-8?B?bU1IOUFna3JwUWlBNnIzYSs1RHZ2UXUva0g3dkJCbTRjeUc3bmNTNjR0Unlv?=
 =?utf-8?B?UjYyaTArUzM4RUhiWTI3aisxRHJKTFdjdWc2eTBlRlBkWEtic2I5ZXdVR2dP?=
 =?utf-8?B?OHZKSGhpVTE0Y0JwZllTWGdDYUhDRWhKUVRHc3AxeXF6MTdXeTBCNDhVQlFT?=
 =?utf-8?B?RkNsTE9ZaFE3M0I0U0hmUDlzVVNnM1R1eDB1akVoYVJUZ1lLNHE1ZXQrL0Er?=
 =?utf-8?B?VXB0OXlUVW9IUndKU2tGai9LcGJvbURhb2N4VDhrSG1oQVlYQ0pLYlVmT3Fp?=
 =?utf-8?B?VWVBbUxtN0UvNGF2QkxKZzZySVFhWXVvTzhpbjZUcFlmZldrSTNhdEU2R05W?=
 =?utf-8?B?UFFQWFRoNkZXU1FjVDY2d3M5V2xpeEdkbFJTNzJZQXptQmJnbVp1d3F4azA1?=
 =?utf-8?B?YzBzMGwwZ2JSb25SS2hUYTVoWWhRZis4dXFRZHh2eWhTN2pMT0FHdm9yc2pu?=
 =?utf-8?B?RGtVaWNaTXZnUFkwTVRRWHJXelpaTm9Yb2VqSnpycHo4UkVoaVZqaWRwQzhh?=
 =?utf-8?B?a0dEWFcxOFlOdHZOd1ZKdDlZRUJTWWdxbXY0ZTh3ZVFDTkh4WkRvbUVwZERa?=
 =?utf-8?B?UElZWFNyVXM1V0xUK2hQRjdZK2VrUE9RYXRISUhGS0dHblZDaVpQOXVmYlpU?=
 =?utf-8?B?ZVAzSC90MUdKTzVTUjltTS9LcVgvVFY0T01wSHNNN1NJeUgyWVg1cGtZam80?=
 =?utf-8?B?bVBMTE9ORktFWGR4L3M2U2tWRXZYS2FhZFVkdm1KS1piWFJuK1dSR1JiZzVu?=
 =?utf-8?B?dm1EUnkvWTlKdCtiVWM3eitrbEUyWlNUYUg2c3pWOWNtcStWbytJbkd2RlZ6?=
 =?utf-8?B?MlJ4WjhXVXZsazVFTmVuN0JiYUhOTThBM2w4YzhyK3FXamRTc29odi9VaitR?=
 =?utf-8?B?R0FJTXF5RE1uUEVGRDNEcjJMZW1rdGkxaXpmMG9XYVlBMDdBdmgxVC9VT1BF?=
 =?utf-8?B?SVFVVFRRK1lkdUxyaUNMNG83b1A2a3lMN1Q0ZkI2dnE4a1QwdWtXUUZndTFZ?=
 =?utf-8?B?ZTlEbU1mNWxzK0xGbXlPbEh5OTUxVzlKR1k5WEFKdjhwakZVMkRpR2xCREFM?=
 =?utf-8?B?Um5yUzNyUDdNMk16Rms5MTJ3UWU0elRLR05nUWJQNFlVMXBNWUZkQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10fc46b5-099a-43b1-d761-08de5351cb6e
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7875.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 09:46:30.4396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qFxpVjfgvovvDC2tbLgMUuXXTuFZiV+/x+ii4AcsHjx/fO8XtzRj+Bdt7yITmJHPjyYoYHQQKJ3logiXrGnxnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5653

On Tue, Jan 06, 2026 at 03:00:21PM +0100, Jan Beulich wrote:
> Omit the function when PV=n, by moving it to the sole file using it, thus
> allowing it to become static as well.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

