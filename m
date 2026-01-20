Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DIUND+0b2nHMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:39 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A60482B6
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209068.1521188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viChH-0004ux-AV; Tue, 20 Jan 2026 14:27:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209068.1521188; Tue, 20 Jan 2026 14:27:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viChH-0004tS-7f; Tue, 20 Jan 2026 14:27:07 +0000
Received: by outflank-mailman (input) for mailman id 1209068;
 Tue, 20 Jan 2026 14:27:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h83G=7Z=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1viChF-0004tM-No
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 14:27:05 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17496ade-f60c-11f0-b15e-2bf370ae4941;
 Tue, 20 Jan 2026 15:27:04 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS7PR03MB5590.namprd03.prod.outlook.com (2603:10b6:5:2c8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 14:26:58 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 14:26:58 +0000
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
X-Inumbo-ID: 17496ade-f60c-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=chkx7TLfKkiIPkcNOeNp/sqL8cfiD20m6Z6wh0mlujq7sZuujIcXnJ3U/FB2CO9TiPvU/DBsUwrVyDvGlhKBjoTb9EVrendgojXI4G5H2msiYqxeNzB7CsUNww3zRFPwbbFTlFHW46CxqdbLDuirKY9rlUaulo+HqOoSqLPTGK3xsVt3OOuNEzdUc0/MppbQQvuoSDVVqM0AbVS290vnB2KtLFIefHj3DRaPcz2TKuuJBl+cKS94KIrQL65xd3BOa0RJ3fh0TUKxDIHVoqteP8pPrR+g3qaPm721+krAjo/SAEbxTOo0cVSkw5g7Z02NCwYYq+HWksyiAE2jQKnUHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4jgcWLKYtKi4sNyZTzLKVqtZU5hpw87Qe1wOTMcopT8=;
 b=fatR519X94YLZNXS8JmOUqsQMsGyr6RVyptUEwStQY8bGm3wj0GyC5UexjRWQcjOFOBpTTyQHvr5YjXf0Pz0hzYwbSOydUHio2MyqVFpugYAguADukEQilBpyFjAVmUwM1OjTsy7KdRhNaMJq+3wUiFFr/lkW1v96D/3NlR2eLoRWIFBZTNJ4n3s5lW92zb3Ca+QDZpydxBSh4IEe5QFdVpCaYTMtIVQSo9XP2vpnM8wJaviqtkEWbLh0SmdJ9BTjsGlJphkVWrpxsFWpz3g5KQlfFE+t1wtxH9bG5OMEG3s5fmrMfkX0pVUL4iA0hKoce/eXdvKUPCVV9mYZ5+7NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4jgcWLKYtKi4sNyZTzLKVqtZU5hpw87Qe1wOTMcopT8=;
 b=Sqhzv804WolwtNahnE9/t/agCHiRHaJgTeIOqFuA8t+01bVybCknQBWF3jNqwbDD1rA6qA8SKe/wIr6aJrUDwEFXGQPOl7fJJIF068ioEkg0A6NXLvVMGfHdiCVn1YgLr9mXihfs+ztNxNzkeXXZrteHX8CLH8jFJ4Rd2nu63Wg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <4ec779cb-3cbf-42cf-b744-80145d3cd54c@citrix.com>
Date: Tue, 20 Jan 2026 14:26:54 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/2] x86/svm: Intercept Bus Locks for HVM guests
To: Jan Beulich <jbeulich@suse.com>
References: <20260120095353.2778-1-alejandro.garciavallejo@amd.com>
 <20260120095353.2778-3-alejandro.garciavallejo@amd.com>
 <5a4aa1d9-dafb-453c-bd4c-8da860519f01@citrix.com>
 <00f36b33-65d5-4681-84d5-e1b2cbd8830d@suse.com>
 <b8df289c-a770-4186-b922-dbfba1bbbfc6@citrix.com>
 <b92c9a26-dd84-4298-adcb-5b1066e2174f@suse.com>
 <ced1c404-6170-4275-b0e3-be851bf03c3d@citrix.com>
 <da99461f-aa69-4a15-b8ec-e49728fc3db5@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <da99461f-aa69-4a15-b8ec-e49728fc3db5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0640.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::21) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS7PR03MB5590:EE_
X-MS-Office365-Filtering-Correlation-Id: 62935cc5-bab4-4894-d6c3-08de582ff7e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q0s4MFN5ajZLSmJHamo0OEhJczJtWVNGa3JnNmJxVUkzSFRXUkpQUDJMS0sz?=
 =?utf-8?B?QWU4WTl4MmN3NW9GS254SG9wc08ycXhIaHdnRkpEZkFielZDeHh2dWFRRHZt?=
 =?utf-8?B?V0hIY0tadDgyKzZiNGN2YmtyRW9pd1ptMGhZUGx3a3NNaytSbXgzanJYWFpt?=
 =?utf-8?B?SjM0NmFhbkRxWGZvQTBwcnl5UW9RRTA5RldRb2hTSW4xOTd3dE0zNGVDekYr?=
 =?utf-8?B?bFBaVHd2VzVGZE9vR3dNSVY4Q2JkSGR3L2JXcG9mS3lObEZXdkdsYzZWM0do?=
 =?utf-8?B?T3Z5MWVUMXBZYzUyRGp5VEhHWVVUQnAveGZHNFRlL1RDUDB2UFNJYUJCQ3lZ?=
 =?utf-8?B?c0pORThuZTVBUStEVHB4dU5VNDJrdDZHK3ErSE91YzlNU3dtUm83aUgwQ3BI?=
 =?utf-8?B?WHNQVEdlc2NKRi9MZ2c1WTdGcGU4cmJUbWE1QWNTazlJQjRHTEUvV0tVOWF3?=
 =?utf-8?B?L1o2dXFXT3BPcmdnMlBqRy9kN3BSUks3NGgzSHF2VDFNM0lUcjd1b09YSTBH?=
 =?utf-8?B?WFAzV3FrRWc4KzBzbG1RamRpa1pNV25YYWh6NmZhYm5TMDluT3JUeGNmU2c3?=
 =?utf-8?B?Q1VVL3lRMFBXNVo4VGJWUzR4ZjdYR3BDTURIN1BlcGZNRFk3eDRRZzZXa2JE?=
 =?utf-8?B?OWhOdmZJSmVFTzh1UW9scWtLR1ZxK3VDelhpNEtQL25SYVExVU1pWi8vNU5N?=
 =?utf-8?B?bFNwTXR6alc4aERkSFlZbndxTUhJZUQ0QUV5ek5Kd1dGTnl2M09TNGhlUjlO?=
 =?utf-8?B?aXBpeTZpYnVQZUJDVDNlY2ZDQk5RYXNsbE03RUp5QVdlMjRsS1ZyMkNtWEMx?=
 =?utf-8?B?RmY2cXh2aURuMW5mZTB6N3d6OWtxZ0RhelBDMzlwakFSbnhodEFaQnN1eGpJ?=
 =?utf-8?B?RC8xY3FoNnR1RmJTZlVUUWdNM1c0RlNpdTJrSm9ZMWFQRktuTG5JNjdYWUdw?=
 =?utf-8?B?eGE1V3AyMjVqcVBjUGpkdWJpU1R1bmVRTGgzQlNuVGZYczZRQkdHODBMOXlw?=
 =?utf-8?B?akFBNkphcm9YbzJRN3cweU83VU1JUjA4S2VFK3FhS3JDc2N0UmNzUHV4bDdB?=
 =?utf-8?B?bjNwOVBBb3hoT1doTEhtUHg1MzUxcUNNem4zdHNlUU9IQ3VQdzc3c3VRYUdJ?=
 =?utf-8?B?Z0M3K2lEWFgrNllwZHFscWh1dHZFMy9Ld3BpNE1MTHU2WXJqTTgra1I1dTBp?=
 =?utf-8?B?VEZtY2t2V1pJREZ2b09CNno5eGk2ZEcyQjYvVUhwTzJzbnR1SUlBZTBNS0s3?=
 =?utf-8?B?RjZhc3JYVGwvNUlmL2l5RzFCM1h3WGV0STAwWWYrRW1UN2xuMVFVSDRab1RY?=
 =?utf-8?B?bmNTaG9HQ0hPcEpEcmhWWVcrb0xHTWF2REl0QmpCUit0dnp1L1hONVIxcHJz?=
 =?utf-8?B?UklIUjdoaURQNnlXbXVrY1hPTFErdlp1YU44SUw3VTNlaDNaMGswUG1aOWVw?=
 =?utf-8?B?dnNzeWNCRG5xMldZNXJuMkVpSFFSVnBLMmgzVEVtcnR1My9uL09JeTZQU3ZP?=
 =?utf-8?B?T2R2WS9KMWhJemhoUEVCUGZ1YWVnTmpCL3NJcjZXQ054c3RUZmhLd3lGVzY3?=
 =?utf-8?B?OTZIby84M25uKys3Qk9DTktlZ1VvR2RHRDRoSXRCdEY1bkdzWDV6QXo5RUU3?=
 =?utf-8?B?d2N5NHlnWkxPbWxzSlNUbGRVWC9IOWRNUjl2RFlpSSt2bmsrUXBERTlDaWx5?=
 =?utf-8?B?THluakIray81eUlKeGJNYmg4dG84RTFxSkZHcUl6Nm1SSno5cVUzd0dPSGpQ?=
 =?utf-8?B?VmcyRUpoVjhjamtYTGZUTmZSREJpTkdKc0NiOXNOMXRHcUFncVhQMU1rQWg4?=
 =?utf-8?B?aHFlRFZhTE9WbmlrTEQ0L3FjS1VkdjNkanQ0alk0UWczV2w1dDV6RE1NbUNw?=
 =?utf-8?B?VVk5QmhvMEZVWG1BQVBRWW4yK2MxVW9yRVdiOVRBcTNwMG5tR2tFRUN5K0dh?=
 =?utf-8?B?QWVhNzQ2TDg1Q1F5K3FnR3l1ZWxrMElEcldlRFQwcjhLTVptY28xY2IyVVd0?=
 =?utf-8?B?Y2x6THdOUS91aWl1dUhSZGpLUGgxYzE3Uld1cmpmbjI5dzVwU2FGMzZKcmJD?=
 =?utf-8?B?a0NIT1lLNjA0OVE3cXJYcFByMzEzQlhub1VBeDBmTlBkcFhOVmJoWGVOelJq?=
 =?utf-8?Q?bC7c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUpuUTN4cVlWZmhSSnV1UHpybCtMRWEzcUJ2SjQ3TVNnMXR1UHlTMGJqdlA4?=
 =?utf-8?B?VUpqTDBLUlNUaVVMOFJicXBRZXM4U2ZZVkxSdTJKL3RjOGM5SHdCanZ1ZUlM?=
 =?utf-8?B?R0NoM1ZpOURNaTFkdktKU2YwdmlrVWdBSGZLZHRtRmVtdmVVeTd0RFBzMmdv?=
 =?utf-8?B?em1EZVFEcGxmamNUODU4OS9kZEdwaWp6cWhFTlVqdGt0T1U1bXlWbkJtSnM4?=
 =?utf-8?B?S2x5ckx4Wkw2YjhoSjdLbHRaeCtxV0tORFdyMnNoVHAxMytSNUJjOFo3VnBG?=
 =?utf-8?B?QWt5MVJ5bWFrRWdBaUVhWGZzc1dYbVN3WHhkZ0hTR2d6Nk5zcG5DalIreW5j?=
 =?utf-8?B?bFFBZzdtNmkzYmhPWTJxZTVIMW9rQm83V20xMW5aWEFKZ2xPenRJRmtzSDFD?=
 =?utf-8?B?dUVlM2hhWnNSbXhNd3oxSDR2bE9FZ3hjVDM3L0xBU2VvV2h0aWZ6dDdrdjho?=
 =?utf-8?B?OEozWi9iQ1NTRGRhWWo1QzZWRWpJYThLMWdmTC81Mlg2RHhDZ2RrZ3JhTWRo?=
 =?utf-8?B?VDFoYjlyekNCVVZFMm1NRk9aSEt6NjdtcC9MVXdSbU1RdzNrcUV1QVY1d3Zo?=
 =?utf-8?B?OHo3Ym9hQ3hsaXZqeDZtQjlGZ3lIOHRKdGlSOGJ1MXBOQms4cEdtUGZ1V0ds?=
 =?utf-8?B?UXpNRGxJbWlIcTB3Z1pFbGxQdkNIc285Ryt2eS9zQ3o1eXV0eWtydGVjV1RU?=
 =?utf-8?B?dEVCdTNUSS9yNFVUY2Y1U0V1R2JnV0x5a09lTE1FZWh4QXo0c3hqcW9pd2FB?=
 =?utf-8?B?dVRua1BlTGp6d1I4cWRxQkZSM3F6Vjg2VUduTkpPUzlZWFRQM2EycFkzVkYv?=
 =?utf-8?B?S3IvR1lMRzQ0NDZVeHFwOWdiWFB0STZRYS9RQWNQS0NzR0xoamFsc0ViMmJG?=
 =?utf-8?B?dXc1TEs3ZFJRV3drMHkreGg0aGUwRVdSY2EwK1BFT0pPNEsrTW9lZEtiQkdx?=
 =?utf-8?B?aG8vdFl1dVJ3Ry9KanZBNXV4TVZLZlFSUVRXbjBuSi84cUFmc0E4dTFTZXl3?=
 =?utf-8?B?SVBEbTNadGZUSGxPVHIvMTUyQjUrRWM0UWRYT2NOM1pyeDVSMUd4OEJwOUxt?=
 =?utf-8?B?UHdwTjhBU1ZDcjI4QWpUeGpkMzlnL0s3MmdSeUFGZkw0WHJoZ0RnT3BwenNn?=
 =?utf-8?B?S0VnVjRRaEROekVWaUV4a3VFN0MzQXhUcEh2RVJhMlJtY3Q0ZU5ud1FLVjZE?=
 =?utf-8?B?V2NRWk5JRWExcWhLWUgyN21XWVhOcG5nVEJMTUNQV1h6NnphZFJmY21lZm15?=
 =?utf-8?B?S3RqWkdzWGQyZngxNDRCTjBxRFJRNzQ5NlE2ZWw5WlhkL0k1Q2c5V3ZkcjFK?=
 =?utf-8?B?SXVyWjRjUG92YWFhaDhicUw1OTEyRXUzd2NvYnQ1VXBCaTVLQ2RoTEhqbFFa?=
 =?utf-8?B?SVdOak1MSzh3dS9NTUNVSGdkRytnWmRzSXc4dEZxZnZTQzVkQVEwRnhPUkhC?=
 =?utf-8?B?V1lSNlU4MytQQWMzc3J5MnBVRWpEQnNDVmd5MUVnRXdLUHMvcjVra3liRUc4?=
 =?utf-8?B?S1UzR2RJZGY4MXNFeFJKMFczSm1lNFczUC9xb0RlSDczYTBUTG5TZm5DSkhn?=
 =?utf-8?B?STh6ZWtqbVpsK2VQNzRFdmc0YStpUXhTTHRleTN5ekZkSnptSUJPaUdJSXd3?=
 =?utf-8?B?UitwTFRIdk0xb3BTcVBEc0FOWEdBd1FrWVFEMmxEMnVoV0NIR2U2MUJpU2pk?=
 =?utf-8?B?RDFXUGt4MFFCeXhvcG9GZE9qa0l3SVBMeGJyMStyblhSdDBUK0VPNWRrWTZO?=
 =?utf-8?B?ZHFqemNqSHFoV1l4TGM5K1NrYXZtWS9Zc2pjbG94THkzY3pHT05FMmkxQkpX?=
 =?utf-8?B?ajRMR1Vvakwvd0pwZWZVRyszbFhLSDkwNVZUdlFQcitrVE1LMXRVQi9xb3Nz?=
 =?utf-8?B?RXhzeXhtTCtEeE50TEhNa2cwVzRwMjdCbWkyS3gvcU0wL0drZVhhaHhpUkln?=
 =?utf-8?B?STllR29WL3lGRWpFWVhLVFpoRlVYT0hBdDlrbkY2OHZSRGsreGNjTjJKMnRB?=
 =?utf-8?B?WjJzaUQySm1WQ09zdlNTOWxRZ3BxZDNxdnExYUUrWHdOd3JoMmZ6NFNTWFVm?=
 =?utf-8?B?UEp4eDhOL001a0RVbnRFdHRaeEhtUzZja1VqR1RKaVFFU3RWekVsNStiWDBQ?=
 =?utf-8?B?UFp5TnNOUERnazEwRGpKeFkveUNpUFJ3ckU5SS9DS3Vnci9OWXhRZ0RBdzRJ?=
 =?utf-8?B?eVo1eTcrdklPRjBpV1pQTkZleURxeHZMUmJtTXRVYWY5VWhybTBpUzZIWng0?=
 =?utf-8?B?ZmFqRFpnbk9aYU1QRXk3UldrYUFPS0gwS0JnZzN4SFFoOFNGcFREcGU0aThW?=
 =?utf-8?B?eDEyaXR2OXNwL2p4aUVRYmhiUFZwNFdmV2hsd1h6dXh3N2x3cXFOYXkvaUZs?=
 =?utf-8?Q?ZMr4KQjHxOto1IC8=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62935cc5-bab4-4894-d6c3-08de582ff7e5
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 14:26:58.0560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UZZqzhr2rd5xocEbxueHBbCk7M0jz/zdxyw6OqUzdq40FM4hHL+6qTQSyrLreIsMK8VLgjdRag2AvrrPGKWrw52vGRhaQaCgmySzUzNe3r0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5590
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 73A60482B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20/01/2026 2:16 pm, Jan Beulich wrote:
> On 20.01.2026 15:11, Andrew Cooper wrote:
>> On 20/01/2026 1:34 pm, Jan Beulich wrote:
>>> On 20.01.2026 14:29, Andrew Cooper wrote:
>>>> On 20/01/2026 1:27 pm, Jan Beulich wrote:
>>>>> On 20.01.2026 14:18, Andrew Cooper wrote:
>>>>>> On 20/01/2026 9:53 am, Alejandro Vallejo wrote:
>>>>>>> --- a/xen/arch/x86/hvm/svm/vmcb.c
>>>>>>> +++ b/xen/arch/x86/hvm/svm/vmcb.c
>>>>>>> @@ -66,6 +66,12 @@ static int construct_vmcb(struct vcpu *v)
>>>>>>>          GENERAL2_INTERCEPT_XSETBV      | GENERAL2_INTERCEPT_ICEBP       |
>>>>>>>          GENERAL2_INTERCEPT_RDPRU;
>>>>>>>  
>>>>>>> +    if ( cpu_has_bus_lock_thresh )
>>>>>>> +    {
>>>>>>> +        vmcb->_general3_intercepts = GENERAL3_INTERCEPT_BUS_LOCK_THRESH;
>>>>>> |=
>>>>>>
>>>>>>> +        vmcb->bus_lock_thresh = 1; /* trigger immediately */
>>>>>> Really?  The APM states:
>>>>>>
>>>>>> On processors that support Bus Lock Threshold (indicated by CPUID
>>>>>> Fn8000_000A_EDX[29] BusLockThreshold=1), the VMCB provides a Bus Lock
>>>>>> Threshold enable bit and an unsigned 16-bit Bus Lock Threshold count. On
>>>>>> VMRUN, this value is loaded into an internal count register. Before the
>>>>>> processor executes a bus lock in the guest, it checks the value of this
>>>>>> register. If the value is greater than 0, the processor executes the bus
>>>>>> lock successfully and decrements the count. If the value is 0, the bus
>>>>>> lock is not executed and a #VMEXIT to the VMM is taken.
>>>>>>
>>>>>> So according to the APM, setting the count to 1 will permit one bus lock
>>>>>> then exit (fault style) immediately before the next.  This also says
>>>>>> that a count of 0 is a legal state.
>>>>> But then you'd livelock the guest as soon as it uses a bus lock. Are you
>>>>> suggesting to set to 1 in response to a bus lock exit, and keep at 0 at
>>>>> all other times?
>>>> I should have been clearer.  I'm complaining at the "trigger
>>>> immediately" comment, because I don't think that's a correct statement
>>>> of how hardware behaves.
>>> In turn I should have looked at the patch itself before commenting. The
>>> other setting to 1 is what makes sense, and what ought to prevent a
>>> livelock. The one here indeed raises questions.
>> Setting it to 1 here is fine.  This is the constructor for VMCBs, and
>> *something* needs to make the state consistent with the setting we chose
>> at runtime.
> But the setting at runtime is generally going to be 0

First, we need clarity on what "Initialising as zero is invalid and
causes an immediate exit." means.

> : When the guest exits
> for an intercepted bus lock, we'll set the threshold to 1, re-enter the
> guest, it'll retry the bus-locking insn, the counter will be decremented to
> 0, and the guest will continue to run with that value being zero. Until the
> next insn taking a bus lock. So starting with 0 would overall be more
> consistent.

Assuming we can set 0, then yes we could drive SVM like this.  However,
we cannot do the same for PV or VT-x guests, both of which are strictly
trap behaviour.

So for that reason alone, we probably wouldn't want to drive SVM
differently to other guest types.

~Andrew

