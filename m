Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CFFC95AAD
	for <lists+xen-devel@lfdr.de>; Mon, 01 Dec 2025 04:48:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175482.1500128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vPusT-0000zf-9O; Mon, 01 Dec 2025 03:47:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175482.1500128; Mon, 01 Dec 2025 03:47:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vPusT-0000x7-2b; Mon, 01 Dec 2025 03:47:05 +0000
Received: by outflank-mailman (input) for mailman id 1175482;
 Mon, 01 Dec 2025 03:47:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=isLO=6H=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vPusR-0000x1-UI
 for xen-devel@lists.xenproject.org; Mon, 01 Dec 2025 03:47:04 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5fa19831-ce68-11f0-980a-7dc792cee155;
 Mon, 01 Dec 2025 04:46:57 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 PH7PR12MB7890.namprd12.prod.outlook.com (2603:10b6:510:268::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 03:46:49 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2%2]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 03:46:48 +0000
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
X-Inumbo-ID: 5fa19831-ce68-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yCCq3NQbCp1lBuhnzczyzWF6CLsbNvhIFbMGzSxfqxNqnxO6AE3zm63SAmjkJpic2ue7z/u61FEbvRu9bp8IcAMwbKh+N16L0d92LlqgHnQ66KbgZgkX+631tUtaYuE85D3D8Vz2mm+B6VdeFJD003fl57ufLE65ZbwrFzWERHN6CaQ+AwGOUORgi5zkhBoW6B7mRDCpNDJbsUqcYg83zWOuoHBqWF4CFrLVYZpWrP6IO2rUj/sqGrp+xiKFBupNVAEwrbz+fYrBSTiyjPjR5pLluc9spNhTy62AqgXrTItTZ7ywy/3HZlOoQxePLdbUkuv5wv4xQz8WwHvABtQkMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eJJ92duJHZRAHvmDUvVqO816Fjj51lbIVpkTPrDRKIs=;
 b=Dx2sw1vtOyTO1NNH9f9ru3hDOcY3LGLyLEO7bPPR5jTh6mYSxzk+66BhDGvoY/3u6T21vdUV5dFnnv/PKIGz6xzq1Ks9LFxHKkXmiIXXsS3MU3w+kEGvLPfpSuoTDIQe+FBx2E0naZMwzROMn9sd5Cs1ZU4lbqUtMNj+GLmE8+aoSK1E8/FC6qX8P2Z+Sbi8SQRd4EFQosj+wXQzhAviCVI55dPujhCg/PyZYuxGZ2Jw0bSFttVrE13YMlADz1+VCRFQdq5XRIi+Jayk1QJNel2e7a7m8TR0XDtf/4UoIkz6QaPuDNefFnJ37RkliLaqvy2qGFTbRpH+2FbpMzq2cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJJ92duJHZRAHvmDUvVqO816Fjj51lbIVpkTPrDRKIs=;
 b=f0oa25gJodkWJ0Er0Hibsl5J1YFeIFeUG7oQndEwpPhuejHcjqRwnCUGlLRZBkQe1NNYRwCItXH309FR90ohxt624TjUJ6h4PIb6mC5dyN3gwqgR/ibWyiHCcdqHGrSF65lJWsrzHNgjl48cgwLhGBwjYJMBPxXCSd2egHzok+A=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "grygorii_strashko@epam.com"
	<grygorii_strashko@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Tamas K Lengyel
	<tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, Petre
 Pircalabu <ppircalabu@bitdefender.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 6/7] xen/mem_access: wrap memory access when VM_EVENT=n
Thread-Topic: [PATCH v3 6/7] xen/mem_access: wrap memory access when
 VM_EVENT=n
Thread-Index: AQHcWseQ6uI32DuOSE+vYe1IrUdoVbUB4liAgApSOvA=
Date: Mon, 1 Dec 2025 03:46:48 +0000
Message-ID:
 <DM4PR12MB8451F30DFF25A0EA7BF3327CE1DBA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20251121091554.1003315-1-Penny.Zheng@amd.com>
 <20251121091554.1003315-7-Penny.Zheng@amd.com>
 <e9a85592-9df1-4f32-82df-20c7f069d1e2@suse.com>
In-Reply-To: <e9a85592-9df1-4f32-82df-20c7f069d1e2@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-12-01T03:46:40.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|PH7PR12MB7890:EE_
x-ms-office365-filtering-correlation-id: 4f8e6752-cc72-4d0a-dee8-08de308c4193
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?dWVFU0ZUWTNTbENTQzYwZmdlRGNQMzBUS3BYSzdHSFhpbmZ2b1pMb09Xa21S?=
 =?utf-8?B?cTVSNzdEV0lPRmlmSlhlWVFLQkEzaWNVdHc1V05DVFoxWVdKUjMrcDl5WFdN?=
 =?utf-8?B?dUR2cmhYZGhMVjQxMndiY3JaS1FYVWg4L04vRXNTZkc0TmFQcVZzWWJkMHJ5?=
 =?utf-8?B?NDRNd00vUWdRbnM0MmJVenhBK0xXSWRlQmJIdmdBOFE1N0dER1ZnOHAwWWpt?=
 =?utf-8?B?NjlHSHZ2dE5wTTRSVHIyY0JtUlFvMGViM0UrWmpmcmYwYXU1M1VYdVZsY1A2?=
 =?utf-8?B?dUR1N0RMeXYxbHdkSFAxUENHbC83NEh5RWNZdlVqSm9jbUt6TzlZU0pGOEE4?=
 =?utf-8?B?ZHZVSFNLUHk2TldzYXdiZ0x5eUdNT1NQMVpIdlNiajVnb3BRT2w4YmFPN0hH?=
 =?utf-8?B?NlJpbUt6L3JBb0czNEdhWWZwOTBSd0VCdzhWdWpBZm5jUGFxNGo4U3QvQmYx?=
 =?utf-8?B?Qk1UWHZWRUR5aDNReUpKM3F2MzRIaUZaSlFlcjROQkJxNXBhL1d4NTdXcGxn?=
 =?utf-8?B?UDF0Wm1CdU5pUlQ3aXd4UlIyNU9hQkZCdEZOZE5aU3A1VUpTSzVTYUV5Nk5K?=
 =?utf-8?B?bmkrbUlrRXE5bVNOZFZrdmtLT0J3TXlOaENSRmQ0b3ZYV1R2ZHlHNTkzL2Ny?=
 =?utf-8?B?NVVOUm5BTnlTaExTRHhtekFldFA4a1FjdUpvYklwb0MzYk16bmVyV3hFMlJI?=
 =?utf-8?B?bTd6WFBFNlp2MWlrU2p3VG9PdWV2N3I4eGxpVGFuUTlTRENRWktmMGI2SHVR?=
 =?utf-8?B?dUdTZWI5dHJlcVNnZmsxQ0VET1J4ZnR6dWI2cm1YUkRFNStxYzJuOE40RGh0?=
 =?utf-8?B?dDMvMTYzSEtSaEV4VXVnYXhqdGY5dk4yMkNVMjFZZnRRWjJpUllEWUNwelkx?=
 =?utf-8?B?QXhzQlBkem1ETnlueFhHdDVveTMxNER0c3NQUVlkaWxKNHJCTVhYUGl4dDhE?=
 =?utf-8?B?Y0s2K2JmZ1pOUTczRmJXUGFmK3JUZUk3Q1d4ZmNvSklGV2tRL2VKbVg5UVZk?=
 =?utf-8?B?cm1kNWRwOUlyN0RReDJzN3dmMnh0VTd6ZXo1WW9rTmxhOEtHeEpBa3EzNFV5?=
 =?utf-8?B?Mi9HN25sL0lzZTU4dWJwbS9hMUE3SXJoOHZ2aWdpaGZMcUxsK0o4d0tIMFlt?=
 =?utf-8?B?ckFlTUxBd2pUb0FmSVVBbThDUXA5NTcxd0Z1QkhXYkR3bEJSdkNWbFpwbThR?=
 =?utf-8?B?dW9ESUhoZDJ6a1NzWFJzK2VOdGIrWkpZWE85SXhOTkJSSEROeDVOQmh2TVRZ?=
 =?utf-8?B?QXFQVUxBTms3RTBydEFJZVFsQWVxMWNTYUdTUGNBRXJSSEgzMHdQN2xONStP?=
 =?utf-8?B?TFVvSndYWkNqU2xDem5zRFUxYnBmTDNUYzZZdnVFdWU4dElweDhLQzNwZmtn?=
 =?utf-8?B?RzB5blVPTUM0K0F0TkpHL0RRNEdabnUzcUxjdEJtR2RkUm1udzFQWnRLTDRE?=
 =?utf-8?B?YU50N3lHdjJjK01nL0tQYUlvcGZnanptd2tkSUs2cklRaXI0YVFyVDJwTTZE?=
 =?utf-8?B?V1FreW0rVzZ2bDRISTlhOHJPalRRU2VhYmN0OTFWVEhUaFpOdE16SzZNaER6?=
 =?utf-8?B?bks5bWV2ak1QenVOTDkvTVlseWtvTGJIYjhKeTNMUndqRStSeFdZcHdxWG1u?=
 =?utf-8?B?WHJPNUV1VTFPKzRmeTNoVW84c3ZNUGRMb2xpWHhHMWN4TStBaWxweGZjVWtG?=
 =?utf-8?B?cStIaWs5eEpQQ0VjVzdHSXVlQXdjL1JhZ1k3UFk2djhHVDlQUmwwc1pkMDRT?=
 =?utf-8?B?eUtyR3NObUpxUWZzY0ZWdFQ3OHJFTXVXcGpsaThwRHluWXZtd3lNb24yOGdD?=
 =?utf-8?B?b3ZmeXg3UUZCT2tOQ2E3b3dmRzlIWFY5dG9CTkFMOVlNaHFQeDlZMWZ3ZTU5?=
 =?utf-8?B?SlRrWkh4aG1tZlFsWTFEMSs2eXlRRzBoOFowMG9FVTVrTnNxWjEwNEpRUDhR?=
 =?utf-8?B?ZW8zZ29UY3M4QzJLWFlSTXkwakpMS1NiN0luR3FDRHVsdDdOOGgrNDQxMFdv?=
 =?utf-8?B?UERDamNLTTJ3dVRXNWJRNWNrNjU4YjRieUdTRlhzenRsRnlYbnRhVVBVdHAx?=
 =?utf-8?Q?Ra3Ax4?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RW55OFdJd3NDMHBiejNNTDhhNjVwQndRSWpvMHM1WG01aS9QVlRMTFZ0MTdk?=
 =?utf-8?B?U29sbnJjUnZINkhVSUhSaEpTZm15VndzNmwrVzBhTWloVExnQ1FpUEppTTFa?=
 =?utf-8?B?d0t4NndDRzF4YTRBZldFZGRqT0NQWVpzN0lZbWlFK0E4NE5FbTViU2VJN3Br?=
 =?utf-8?B?NEk3Y0pQS05EeXhZRWsza2VBL2dFZFRCcm1QamlNbmpyQzlyTXcwcXV6ZkVM?=
 =?utf-8?B?azIrZjloSURrNlk5R0x0cDM2UkNvSi9uc3l1QjFpZndWdGllVXVtYiszOHBO?=
 =?utf-8?B?UDFmTHgxUXVzTjloQnZiSGlyOEJKWFFZT3YzeS9jc3EvWDdtWU1vNVJTQWtp?=
 =?utf-8?B?WVFhd01xRDdtN1lBaUJ3N2kydGVFSVlYS2RVQm1KVUF6aG16SWdCNy9xWE1s?=
 =?utf-8?B?bUNrbmRocjlvRE9CVTBVWktjeUd5bUl1K1puK1ZZUGRGUUhrU05EZmV3MG01?=
 =?utf-8?B?a21KSUxuTG9GZzc1bld3bTJzUXF2ZmtEWHJweSsrRzN4WkpoN0RNOERsWGxI?=
 =?utf-8?B?VFFiNEp2eDQzTUsxL2VkWUg0dnp0S052TGlUNGp0azJXMXE3TkNnSkVxeGhT?=
 =?utf-8?B?RlZjNldkbDhHZXZCeUFROVlrM3FtdVc5TmNtMDNrSTIvdm9xQXBaQWdKQm5D?=
 =?utf-8?B?UGdRaEtjaHhJTm50QUx1a2tiNlh2VkNwZWk1bzVpd3pKSjhiYlBJaTkyU0hZ?=
 =?utf-8?B?SUFaSFNXNXpBQ2xsUTlVZG9WQlRlcTFzV3RuSnhMeXVoRFhDaFZKdTZxTkhH?=
 =?utf-8?B?UjJJLytXQ0xNWWlZbWpmanU3d3VmcjhSMTgvZEdiWkpTMWhabGhncXJ3VHo3?=
 =?utf-8?B?UUtxeGR2WGxmazdFYzFrZko5Mm5vQlQyeWZnY3ZtWnVTWmNsdm13cTVobUw5?=
 =?utf-8?B?SURFUGxzRGd1V1RNck01SkcrU214U0FBQW1PVVk1Ujg3NW9VTjlKdmZLWGI5?=
 =?utf-8?B?cmFDNmVyb1Zmc3g3OHVOUXpFbmUrSEVRVjl1cUFzUWZxaThRVHorcEdpUVU3?=
 =?utf-8?B?SUN2TW0vUGlJazFvK3FYVjAyWW5saUY2SktmR2s4THNsSkRjZHE0OHhVZVhN?=
 =?utf-8?B?RUY4NFFGTUZNTTBRU0U3WmUwQVV3N3pvWlJVRCtYaEdkS0ZZcVAzL1cwcUhv?=
 =?utf-8?B?cXF0a2JwcnYwNnVEbDIrZlRXcmV2M1oxWmZGNk9uRlhUWnpKSGxpL0p2aE1J?=
 =?utf-8?B?QVBjL24rRTlMYTdIeUYzcktseVVFbzMvN1BoRit6TW9NR0tFVjhmNUs2S2lZ?=
 =?utf-8?B?YzIrdGU0R1pENk1TR1RaYzZPQzRFT3pMZnNDN1J1ZndDNDdGMWZJck1HNWNv?=
 =?utf-8?B?VFhQN29WYWduNHVEazhJMUxVSnhqbTF2YzVSeTJXVHlFU1FWNHpCcm0zNjBq?=
 =?utf-8?B?aXZOc2MyQmtqNWpLZzF2N3NqaTdOKzNrK2o3c2dITXlsTUdFS25Zbk9PY0tw?=
 =?utf-8?B?QksrQ0p4d2FUTkpEakZYeUtXZnkyRER3VE4yd2tWSUt1NHFpMExwV21rU1Fp?=
 =?utf-8?B?anB3WWJhSUlpUUpPd29SU0t5NzhOWks1MElWeVdJSFRLMmJxMFpPY2ZVcCta?=
 =?utf-8?B?RnBRRmtQZTBIKzJ1UjFHWjdjRUJJYzVGaFBPNndyVWY3R2R5cUZjNDZOTGlY?=
 =?utf-8?B?b3hiQ3ZFVW93dXVhd0lhRDlQVUZDaEFwMGZpRFF2bGdPL0E4Rm9acnk1M21h?=
 =?utf-8?B?RVMvL04xS296NFdiaE9jcFhSdHNyYUxDZzhsd1FyQnU2N0l6b0tiSzNPMG0x?=
 =?utf-8?B?UDVQb1RCV1Q1VWlCZFYzVTVsbzU3U3c5N1ZEWHZDSnJaSDVDT1hCWjJxemdq?=
 =?utf-8?B?OXBMbXlOTmZ2bzZFQytNdEwrZksrOVNvUU9DaXcvMENtVVN1Qm5vUEdXOG55?=
 =?utf-8?B?c1NnQUJuRXRFMzB3NU9Fdk1NbTRGdVNySWdnTkVYWXhwMmNpSEtCRzZTalZV?=
 =?utf-8?B?ZVpZY2ZWY09FcUNjaWswdnYxRkRjT1RMdVdPNGtRaXNkTk5MMHZjTTE5K1VE?=
 =?utf-8?B?RjVDdmFzZDYrRVMrSHJyaWtJKy9nRFk2aXFMV2MrZzdZeVBOOXQ1Z3ZWVk5h?=
 =?utf-8?B?UGFET3liWUJpbmtiVTZ2REVqZC9LbkJqMG92NmpnOFhDYkdPaXlVLzdUT1Y3?=
 =?utf-8?Q?ZuKA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f8e6752-cc72-4d0a-dee8-08de308c4193
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 03:46:48.6932
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G6GU1b6+TAxP8Jz5ic6VSXjoJmH3HV1s73NAEhahB1U5nkFRz9wmuV8/AfjAiejE0/+MNTxTmUOOYVni5W3rpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7890

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwgTm92ZW1iZXIgMjQsIDIw
MjUgMTA6MTAgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4NCj4g
Q2M6IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgZ3J5Z29yaWlfc3RyYXNoa29AZXBh
bS5jb207IEFuZHJldw0KPiBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47DQo+IFRhbWFzIEsgTGVuZ3llbCA8
dGFtYXNAdGtsZW5neWVsLmNvbT47IEFsZXhhbmRydSBJc2FpbGENCj4gPGFpc2FpbGFAYml0ZGVm
ZW5kZXIuY29tPjsgUGV0cmUgUGlyY2FsYWJ1IDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNvbT47
IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MyA2LzddIHhlbi9tZW1fYWNjZXNzOiB3cmFwIG1lbW9yeSBhY2Nlc3Mgd2hlbg0KPiBWTV9F
VkVOVD1uDQo+DQo+IE9uIDIxLjExLjIwMjUgMTA6MTUsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+
IEBAIC0yMDgwLDcgKzIwODEsMTEgQEAgaW50IGh2bV9oYXBfbmVzdGVkX3BhZ2VfZmF1bHQocGFk
ZHJfdCBncGEsDQo+ID4gdW5zaWduZWQgbG9uZyBnbGEsICAjZW5kaWYNCj4gPiAgICAgIH0NCj4g
Pg0KPiA+IC0gICAgaWYgKCByZXFfcHRyICkNCj4gPiArICAgIC8qDQo+ID4gKyAgICAgKiBFeGNl
c3NpdmUgY29uZGl0aW9uIGlzIHRvIGF2b2lkIHJ1bnRpbWUgdW5kZWZpbmVkIGVycm9yIG9ubHkN
Cj4gPiArICAgICAqIHdoZW4gQ09ORklHX1VTQkFOPXkNCj4gPiArICAgICAqLw0KPiA+ICsgICAg
aWYgKCByZXFfcHRyICYmIHZtX2V2ZW50X2lzX2VuYWJsZWQoY3VycikgKQ0KPiA+ICAgICAgew0K
Pg0KPiBJIGZlYXIgdGhlIGNvbW1lbnQgaXNuJ3QgcmVhbGx5IGhlbHBmdWwgdGhpcyB3YXkuIFdo
YXQncyAiZXhjZXNzaXZlIiBoZXJlIG1heSBiZQ0KPiBjbGVhciBmcm9tIHBhdGNoIGNvbnRleHQs
IGJ1dCBpdCB3b24ndCBiZSBjbGVhciB3aGVuIGxvb2tpbmcgYXQgdGhlIGNvZGUgbGF0ZXIuIE5v
cg0KPiB3b3VsZCBpdCB0aGVuIGJlIGltbWVkaWF0ZWx5IGNsZWFyIHdoeSB0aGUgdm1fZXZlbnRf
aXNfZW5hYmxlZCgpIGNoZWNrIGlzDQo+IChzZWVtaW5nbHkpIHVubmVjZXNzYXJ5LiBIb3cgYWJv
dXQgdGhpczoNCj4NCj4gInJlcV9wdHIgYmVpbmcgY29uc3RhbnQgTlVMTCB3aGVuICFDT05GSUdf
Vk1fRVZFTlQsIENPTkZJR19VQlNBTj15DQo+IGJ1aWxkcyAgaGF2ZSBiZWVuIG9ic2VydmVkIHRv
IHN0aWxsIGhpdCB1bmRlZmluZWQtbmVzcyBhdCBydW50aW1lLiBIZW5jZSBkbyBhDQo+IHNlZW1p
bmdseSByZWR1bmRhbnQgdm1fZXZlbnRfaXNfZW5hYmxlZCgpIGNoZWNrIGhlcmUuIg0KPg0KPiBX
aXRoIHRoaXMgb3IgYW55IG90aGVyIHN1aXRhYmxlIGltcHJvdmVtZW50IHRvIHRoZSBjb21tZW50
Og0KPiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiBJZiB3ZSB3YW50
IHRvIGdvIHdpdGggdGhlIHN1Z2dlc3Rpb24NCj4gYWJvdmUsIEknZCBiZSBoYXBweSB0byBkbyB0
aGUgcmVwbGFjZW1lbnQgd2hpbGUgY29tbWl0dGluZy4gQnV0IG9mIGNvdXJzZSBmaXJzdCB0aGUN
Cj4gbmVjZXNzYXJ5IDJuZCBhY2sgd2lsbCB3YW50IGNvbGxlY3RpbmcuDQoNClRoeCENCg0KPg0K
PiBKYW4NCg==

