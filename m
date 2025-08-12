Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6DFB22457
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 12:15:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078562.1439592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulm2U-0002CI-GR; Tue, 12 Aug 2025 10:15:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078562.1439592; Tue, 12 Aug 2025 10:15:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulm2U-00029o-DC; Tue, 12 Aug 2025 10:15:30 +0000
Received: by outflank-mailman (input) for mailman id 1078562;
 Tue, 12 Aug 2025 10:15:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=54Z7=2Y=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ulm2T-00029i-6c
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 10:15:29 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20605.outbound.protection.outlook.com
 [2a01:111:f403:2417::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43b02076-7765-11f0-b898-0df219b8e170;
 Tue, 12 Aug 2025 12:15:26 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 CH1PR12MB9599.namprd12.prod.outlook.com (2603:10b6:610:2ae::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Tue, 12 Aug
 2025 10:15:22 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%7]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 10:15:22 +0000
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
X-Inumbo-ID: 43b02076-7765-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D6daDqX+AIr3HD4LW/lpkaOnl46X/ZOhTSKC96nhosuJRazhc0q9ua8EtVkiMx5/V+JNw/nxeDdU3KtDma29a3YmV5cTRITAx2PFX69+HnCZIDbCOYiTk3iusX0h5ce5m3y+YzoMYfqQHypMe5HAKcdd8vDF0b6ADcz/2DYpy79pmGT9pYDqWKPS3sc1DxtK8+pxRy59TY/7HZmTnv6kiMG8NZVBpq1QypqNQY4JisezN7koVNpCW0Drwhx4Ijno2BYWoQETsV3hUjToqAxllgrwP6gygTj+Sz9TpIXap/JUsXcCAyi3iK144zJCMhjxJzgJfRPdYbT8EoNBk4YhMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=186OmuKM0dwmAnPTdF+GVnnmSmDfln3vUvJCoDjFXHw=;
 b=wbkXGAUZez0IqMl2X3xOZ/6nRJoOH/q8AMwDpYP1u58fjyqsrntmRnHZF/c805pE6iwdNrvHL+1IIdefJ6Yrt0kzZdtlMULqxIwRBEjtjiqtaRPR23Yb34B7PO/FAXN9glbskQno2uIikiLWr2CZiKky4FsFr8/A/X+YiAA106fAWUoBZzBFUr+R0OMEvErK9TBHd9c65q0OKCsT77197X9lxrBVOD+7y4IygJei5vQ8UZEtHJU6/lWSL9s1wXQ4BHCsIgmAq4YxzXTpmzNX8HmkuECVdKNXKzE7NUEB3HI4THOnoiyWhAqzEPTpx25SKNADZRazqB5TKnBFMLXMjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=186OmuKM0dwmAnPTdF+GVnnmSmDfln3vUvJCoDjFXHw=;
 b=iXM+TCBsOX5Wma7msI++k4iF+JPAUUWN4g9Y4yLQyCyzqbUE+eQmZNV0RDK63sd7+m6Qej+4BbAxbZp73pR3Uz5XAWcdCtM0L7HSeDliSTp2dxRO1KJ8IYBiVxSKJn+Li/XYwnluR9VJU3Q2tqaZzIlI33MYxTK/oHjnwSoK6b0=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: "Andryuk, Jason" <Jason.Andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, "Orzel, Michal" <Michal.Orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v6 16/19] xen/cpufreq: introduce GET_CPUFREQ_CPPC sub-op
Thread-Topic: [PATCH v6 16/19] xen/cpufreq: introduce GET_CPUFREQ_CPPC sub-op
Thread-Index: AQHb8hcsas/z4nFla0Oi87EUBsxHHbRBWmQAgAAMwYCAHZXsIA==
Date: Tue, 12 Aug 2025 10:15:22 +0000
Message-ID:
 <DM4PR12MB84513CB84750FB22F6F0E9B0E12BA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
 <20250711035106.2540522-17-Penny.Zheng@amd.com>
 <87d9d5a1-39aa-46ca-9f2a-9169a2ef7a6c@suse.com>
 <0642628b-0cbb-4f7d-bc04-9f32c67b5965@amd.com>
In-Reply-To: <0642628b-0cbb-4f7d-bc04-9f32c67b5965@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-08-12T10:15:07.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|CH1PR12MB9599:EE_
x-ms-office365-filtering-correlation-id: 02b5f94a-625b-4d39-c261-08ddd9892608
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WmJVNDVVUkpqRk5YU2xsbWxTZzBzK09FWk1oblc1azBndit0TDZaK3daaEZr?=
 =?utf-8?B?TEkra0ZSNEM5SUl3cFZvcGRWWkRiWHZudUVZbTZmeUZxZ1dqM0VWRGZndTBl?=
 =?utf-8?B?bW5POWFyUHJrcWFuT1VEVkIxc0R6Slo3NkZ6UEt5NlV2d1NFQkM1VUlOaFh4?=
 =?utf-8?B?SEdxU2ZPS25MSWVnb2d6Q3FvaXlkWjdHNm9pcVNWeU1pMzE5bTE3K3hSWGhR?=
 =?utf-8?B?ZjYySlFrTlJpbGNubVZQeFFZN3lOYVJHTTA2YnZSN1g0RUN2TzBhb2oyR0Uw?=
 =?utf-8?B?QlpHRG1WNGlVQXlpTFk1b056WkFwNkFZWnFIMjl1MkFjRGR5R2d4cUd6Vkl0?=
 =?utf-8?B?RnRkanVRWlluK3BVWVhsVkdyNXYwRGxURHYxMmM4c1RQRWdPd2JzM3d5NUpH?=
 =?utf-8?B?a205eFlVV2VuUnFVQTA3eG1xdVZkckQzN2grMlBhSUtUY011Z21zeXRZUzJM?=
 =?utf-8?B?eGxwWGFDNGo4ajdpcDIyVXZrU0t4aXhVTSs4MndIOVlmaEhwRGE3bHlSUmd2?=
 =?utf-8?B?Ulp5bCt6OXprbVVLdG5qQnRHVUp0RGlWQVJkbTBkZzB3bjQ3WmZHRlZSQkVO?=
 =?utf-8?B?clY3VFZpUytKTHJoSFF3NzdrRmNkbllVZlhHbS9OY0ptemVpQVdvN0pWcG9T?=
 =?utf-8?B?MXF3dHRid2xXemlrMWdvek5jMWRXalN4Q08xNy9FN0RGMytMb3ZYUGtsZFBk?=
 =?utf-8?B?a1QxbXN3dndMZnhLN0VLYnI3cUMwYjdYSzg2RWpFWnNTblRKMlMvSDFEdXVu?=
 =?utf-8?B?K280YjQrdjhVMC9QWXB4d1ZGUER1QWRZck9vRDMwUzlaLzZWdVVJTDN2bTY4?=
 =?utf-8?B?dEtielhETWd6Q3FkS3RuazdTRXBDelpDM3NUNm4zTDF6bzAxQlhQbWtZdXpv?=
 =?utf-8?B?YzRyNjlHc0NwSTN6OWhRSGxZU2xCbWw2emhnQzh4RDlieTZjRmVaNWh5a1E3?=
 =?utf-8?B?N0c0Z0U2VTdBK1AyeFhwSjlpd0dYWC9EcmdlQ0Fmc21JQUc5Mm44WVNGazE5?=
 =?utf-8?B?c1NCYmRkUm5TUzR6TWhOTUFPdGw0TWx5V21hOXFqYzBkV3ZCR2lIb3ZaWUdM?=
 =?utf-8?B?TFg0cG8yUC9qY1cyOGxsTVZibGc3RWpId2tHdnBDeU0rWjY5ZEE5bjVheGxI?=
 =?utf-8?B?VHRVMjd4ZE9ISlhkVHcwRW0yamVITi90SmM2bVB4QkFudVpJUWhSVjVyaTRQ?=
 =?utf-8?B?SkVzcHZaRjRsRFhsSkVFMlhqYlQ0VG9KSDk5bGh2R3hCMkhUcnVNcjdnODEv?=
 =?utf-8?B?MHlpRjFXRTl5Yk1PdndKdzA2TVB4blljbFdoZitaZHA4L1RJaHE0dTM4R3hq?=
 =?utf-8?B?Z1BxZFZwUnE0alU3SkphbEsrVEwydXlWRi9uNWVkMUlYRXpHdjdMVHRPNjhW?=
 =?utf-8?B?am5KTjhjdFlBbUhXUDBMOXZETGYybmxYS25wRnJqT1ZEUlN1Zkg2UGxHdVJy?=
 =?utf-8?B?MndGK2piZk91R1hZSWxTOTI3NmpnUzkyN294bk9NVTBPV1ZYdGcvZWxzczVX?=
 =?utf-8?B?R0dnZ0NZdXNzUWRyWEpnMGJ1c2xIZlJzaSt0c1VEbngweDNvNk5jZGxyKzJ3?=
 =?utf-8?B?c1J0TlVEQUlPVGw3cGVZc0Y1K3hjQnlpR2xlT2RlQzVOOUJ3bXpmbGsybklm?=
 =?utf-8?B?b0NvRzlqUllnRHROUytsNjQvWFFFWWtZN3VlQnVDOW9NYzdlU0xKRkdNZlZx?=
 =?utf-8?B?cjZJVERlOGdDUndsRXRKTGhlRzBTN1RmdHZjQndFM0E1VkY3Wmh3VjBQOEdO?=
 =?utf-8?B?SHcrSUZBVUxRVU1wVXFkY2hMNEdPa0x3TENnOVJtSWhJNldwa1cvT2NPcTNJ?=
 =?utf-8?B?OVZvQ2EyNkNTQUFJTUV3QkRrRGlGOUJEN2NPc2NneTBxMzJrZCtzY2RXMWc2?=
 =?utf-8?B?ckYzZElrZW82RDFrRXFxK05yMzdVSzZOei9weS9DQlVNRkd1SWphWHhPR056?=
 =?utf-8?B?KzlIOHBRL2JLM1U2TkVzK2xrNmJYZXZXNTJEbDBiWXY3c210NXVwMDgzTzE4?=
 =?utf-8?Q?+SEmxcDOJAhvZ3c69//eGK/v88ldDs=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RG9ENTFQcVBBcTVsTi9iOVU1eEpVNC9Hb0h1RGZBRGFuSGxLSE1BYlBxZXN1?=
 =?utf-8?B?TUdDTEZGTlB3TjdrTjRuWXpycTEzY1l4V0gxVFVhVkZkbDRUNGVPYy80K0tl?=
 =?utf-8?B?NE44eXUzaktQTTZ5UTZCaUxCQ0htaHR1d3ZUUEpSY0JYNDlNV0ZRalpXcHNU?=
 =?utf-8?B?Vmx2dGVmaHRkd1d2c3cySWl5N3hJekkvS2RDc0NJb0pBWkdpNDAwUTEveDV1?=
 =?utf-8?B?SzJGZ0h6cHdYOVJsb3FYVUE1aS8xUHFRSVRWQzZHelhlVkZrRUNBRDg5SlBG?=
 =?utf-8?B?b21ub1ZqOWZvMWZVejhBRWFOSlZiK0pxZ2RaUGxLcWlORVYzZ3UxRjhrVVRH?=
 =?utf-8?B?eEpZRXVGNXpseHFkVldXK3RTaTE2M0dMZGluNS9ldjlLb2RJQVBuRThxL1ph?=
 =?utf-8?B?ZDMrSnhEekZuRTQ2YW51TjJUbkN3V2xkNmlMbnNtWmJoTDhTclNFb0dhM2RT?=
 =?utf-8?B?aEZoK1JlcmRaNFk1SE9wR3FoWStvdHBtUkdBT0JQUkxPcDBKT1U0WlhzMWVG?=
 =?utf-8?B?QUVUZjkySVVmRUFWUS95SEd5Um4xMmpSUmZRSnB0QXFLNlJLU2NTSGl0VTRl?=
 =?utf-8?B?OE5LRzE5UnVtc2IrR0FVRENpVlRFd2t3QVFpNTZsNHJ1cWtQaEV2T0cyOXBV?=
 =?utf-8?B?M1M4Rm10RzNFS0ZmVldSbTR0eEVjZXFZYnhoTnVqVmNQWFBhVEt4UE96L0VK?=
 =?utf-8?B?K3VJN0xXWThTdzg3L0g1ZnAwMW4xcUgzNVg4d3pBY250WTdJQ0oxRHVtOWJJ?=
 =?utf-8?B?ZXlqWm9VWU5HZDRhdDU1alVleUlmTkcvMGplTVc4a2ExcVprTHRBRk12ZnEz?=
 =?utf-8?B?V3FVL2tYakRkUlpJN0dwa0t5d0p1b055VVVyUm9kMXYvOHcxWjhUalVVSFRu?=
 =?utf-8?B?NWlwOFZiMU85Q0V5eUdLUkFDczhDdEx4eDVYdEx3b3BiVWVmeVpHNXlRcFhK?=
 =?utf-8?B?NXhmQmNIbG1SdGhyWThEcmxyQ1VQUm5kWWRybkFPTGx3VE5VSUoyTU5GeFhJ?=
 =?utf-8?B?MFQzRWJZQmN5VUdlOE5ORWVRYitla1BoNU1XVFl0Zkp5MVBZak0wMjV3Z1Uz?=
 =?utf-8?B?Z3daUTRnZ3NzQmpMSGZlaU9nc1N5QTFIRDBlOEdaakpEVmpZUjFsZUE3UGw1?=
 =?utf-8?B?VlcxMldOZG9SbHd2dGJNQS9YSlJxa3YvSWE5VnZmSnJRNEZscTNpSXlOSWlh?=
 =?utf-8?B?QjdhNFRkZnpZdFVaSW9PcHhKdTNFRzd0alYxR2hYRWlFa3B2c09CcmZLeEhO?=
 =?utf-8?B?TEoydzBNTVpqMjBQOUNYUkVMcGJ4dVAyK1lZQkdhWFYzM3pHODFDeWZ4UzZN?=
 =?utf-8?B?V21KbmVRVDA5dTF6cW9kaTZTckhNMEN0NEVaSHpxejlrT2xtVEFVRTV6MC83?=
 =?utf-8?B?WVRaYWRGQ1lMUWJUZ1I3UE1sRFpnL05NMVNqd24yQkE3NytQZHROek96b09l?=
 =?utf-8?B?MjBWYmJmMnZSQ0trbkdBMnFiS0lLMWMrMXhKZkxxZGgxM0IwRVE1RS9iUHlI?=
 =?utf-8?B?YzZBcHhiMnQyRnBSQWE2aDJMaG5SZ1NVUUQvTXZjTWlhbTZab3RxNmJZR3BK?=
 =?utf-8?B?cVQ2S2k1TzcyNVlRVU45TjhJK1FWMWF6Vm5FdVo2SGpyRXRicXpCVXlFSFNW?=
 =?utf-8?B?ZURETjNsTFk4Y2kycXdRbzh5WVQxcGRia0l1QU9ra0I4N1p1NFB0VmlUd0Vj?=
 =?utf-8?B?NWU2bFBMZlRaYWtnTTFicFpjdVNjei9rbkkvT0hTZVBnZzhTMkJMZWY5L1BI?=
 =?utf-8?B?bng2QnlIT3dNNFd5TWZpL0JlcWhWTnBVMVNjTm1OeW5IWkxyU2liaDJtcGFU?=
 =?utf-8?B?SzlPSmhEZTFOcGY5VHlNc1piV1BUZCttdVpVcW9NZ2Q4c1lQdTdZeHVDSDdY?=
 =?utf-8?B?c28xNGZoQkgxaTQ3Zjl6bm1WR25BWFJlNDF2Yzlaei9NNnB6elVJWVQ0TnNI?=
 =?utf-8?B?aHBJa3BIY21JVHp4RUhUZjlyUkJVMFF1ZW1OSm1xYnNTREcvMk9rcmJVMU1T?=
 =?utf-8?B?emdXZ1pWNGIrY0ZGSzl4VVlFMnN2N1VveWFFdDRTU20yQVN2NnFXOEd3MDIz?=
 =?utf-8?B?c3lPOUFpRTVyNmJPWFdKQ0Nzd0NhVUJ0TEV3aFRhdTlyOStxbkFoNlZMM2sr?=
 =?utf-8?Q?gnhs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02b5f94a-625b-4d39-c261-08ddd9892608
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2025 10:15:22.8265
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FUS14Rt9XhJ1GV/S8SaTJjUbT8yjHYoRfkE+l70is6cYBrCfDvmjYkk/kXVfz/Svi82QCxj42dl+wXWrQYFUWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9599

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYXNvbiBB
bmRyeXVrIDxqYXNvbi5hbmRyeXVrQGFtZC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBKdWx5IDI0
LCAyMDI1IDEwOjE3IFBNDQo+IFRvOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBQ
ZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+DQo+IENjOiBIdWFuZywgUmF5IDxSYXku
SHVhbmdAYW1kLmNvbT47IEFudGhvbnkgUEVSQVJEDQo+IDxhbnRob255LnBlcmFyZEB2YXRlcy50
ZWNoPjsgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPjsgQW5kcmV3DQo+IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IE9yemVsLCBNaWNoYWwgPE1pY2hhbC5PcnplbEBh
bWQuY29tPjsNCj4gSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IFJvZ2VyIFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsNCj4gU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVs
bGluaUBrZXJuZWwub3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjYgMTYvMTldIHhlbi9jcHVmcmVxOiBpbnRyb2R1Y2UgR0VUX0NQVUZS
RVFfQ1BQQw0KPiBzdWItb3ANCj4NCj4gT24gMjAyNS0wNy0yNCAwOTozMSwgSmFuIEJldWxpY2gg
d3JvdGU6DQo+ID4gT24gMTEuMDcuMjAyNSAwNTo1MSwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4+
IEluIGFtZC1jcHBjIHBhc3NpdmUgbW9kZSwgaXQncyBYZW4gZ292ZXJub3Igd2hpY2ggaXMgcmVz
cG9uc2libGUgZm9yDQo+ID4+IHBlcmZvcm1hbmNlIHR1bmluZywgc28gZ292ZXJub3IgYW5kIENQ
UEMgY291bGQgY28tZXhpc3QuIFRoYXQgaXMsDQo+ID4+IGJvdGggZ292ZXJub3ItaW5mbyBhbmQg
Q1BQQy1pbmZvIG5lZWQgdG8gYmUgcHJpbnRlZCB0b2dldGhlciB2aWEgeGVucG0gdG9vbC4NCj4g
Pj4NCj4gPj4gSWYgd2UgdHJpZWQgdG8gc3RpbGwgcHV0IGl0IGluICJzdHJ1Y3QgeGVuX2dldF9j
cHVmcmVxX3BhcmEiIChlLmcuDQo+ID4+IGp1c3QgbW92ZSBvdXQgb2YgdW5pb24pLCAic3RydWN0
IHhlbl9nZXRfY3B1ZnJlcV9wYXJhIiB3aWxsIGVubGFyZ2UNCj4gPj4gdG9vIG11Y2ggdG8gZnVy
dGhlciBtYWtlIHhlbl9zeXNjdGwudSBleGNlZWQgMTI4IGJ5dGVzLg0KPiA+PiBTbyB3ZSBpbnRy
b2R1Y2UgYSBuZXcgc3ViLW9wIEdFVF9DUFVGUkVRX0NQUEMgdG8gc3BlY2lmaWNhbGx5IHByaW50
DQo+ID4+IENQUEMtcmVsYXRlZCBwYXJhLg0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBQZW5u
eSBaaGVuZyA8UGVubnkuWmhlbmdAYW1kLmNvbT4NCj4NCj4gPj4gICB2b2lkIHNjYWxpbmdfbWF4
X2ZyZXFfZnVuYyhpbnQgYXJnYywgY2hhciAqYXJndltdKQ0KPiA+PiAgIHsNCj4gPj4gICAgICAg
aW50IGNwdWlkID0gLTEsIGZyZXEgPSAtMTsNCj4gPj4gQEAgLTE1NzYsNiArMTYyMiw3IEBAIHN0
cnVjdCB7DQo+ID4+ICAgICAgIHsgImdldC1jcHVmcmVxLWF2ZXJhZ2UiLCBjcHVmcmVxX2Z1bmMg
fSwNCj4gPj4gICAgICAgeyAic3RhcnQiLCBzdGFydF9nYXRoZXJfZnVuYyB9LA0KPiA+PiAgICAg
ICB7ICJnZXQtY3B1ZnJlcS1wYXJhIiwgY3B1ZnJlcV9wYXJhX2Z1bmMgfSwNCj4gPj4gKyAgICB7
ICJnZXQtY3B1ZnJlcS1jcHBjIiwgY3BwY19wYXJhX2Z1bmMgfSwNCj4gPg0KPiA+IERpZG4ndCBK
YXNvbiBhbHNvIHN1Z2dlc3QgdGhhdCB3ZSB3b3VsZCBiZXR0ZXIgbm90IGludHJvZHVjZSBhIG5l
dw0KPiA+IGNvbW1hbmQsIGJ1dCByYXRoZXIgbWFrZSBnZXQtY3B1ZnJlcS1wYXJhIGludm9rZSBH
RVRfQ1BVRlJFUV9DUFBDIGFzDQo+ID4gbmVlZGVkPyBDb25zaWRlcmluZyB0aGF0IGFzIHBlciBw
YXRjaCAxNSB0aGUgc2FtZSBpbmZvcm1hdGlvbiBpcw0KPiA+IGFscmVhZHkgcHJpbnRlZCwgSSB0
aGluayBJJ20gYSBsaXR0bGUgbG9zdCB3aXRoIHRoZSBuZWVkIGZvciB0aGlzDQo+ID4gc2VwYXJh
dGUgb3BlcmF0aW9uIChhbmQgY29tbWFuZCksIGFuZCB0aGVuIGFsc28gd2l0aCB0aGUgbmVlZCBm
b3IgcGF0Y2ggMTUuDQo+DQo+IFllcywgYnV0IEkgdGhvdWdodCBJIHdhcyByZXBlYXRpbmcgeW91
ciBzdWdnZXN0aW9uLCBKYW4gOikNCj4NCj4geGVucG0ncyBzaG93X2NwdWZyZXFfcGFyYV9ieV9j
cHVpZCgpIHdvdWxkIGRvIHNvbWV0aGluZyBsaWtlOg0KPg0KPiBzaG93X2NwdWZyZXFfcGFyYV9i
eV9jcHVpZCgpIHsNCj4gICAgICB4Y19nZXRfY3B1ZnJlcV9wYXJhKCkNCj4gICAgICBod19hdXRv
ID0gSFdQIHx8IENQUEMNCj4gICAgICBpZiAoIGh3X2F1dG8gKSB7DQo+ICAgICAgICAgIHhjX2dl
dF9jcHBjX3BhcmEoKQ0KPiAgICAgICAgICBwcmludF9jcHBjX3BhcmEoKQ0KPiAgICAgIH0gZWxz
ZQ0KPiAgICAgICAgICBwcmludF9jcHVmcmVxX3BhcmEoKQ0KPiB9DQo+DQo+IFdvdWxkIHRoYXQg
d29yaz8NCj4NCg0KVW5kZXJzdG9vZCwgSSB3aWxsIHJlLXdyaXRlIGFzIHlvdSBzdWdnZXN0cywg
dGh4DQoNCj4gVGhhdCB3YXkgdGhlIHNpbmdsZSBgeGVucG0gZ2V0LWNwdWZyZXEtcGFyYWAgd291
bGQgcmV0dXJuIHRoZSBjdXJyZW50IGNwdWZyZXENCj4gZGF0YSB3aXRob3V0IHRoZSB1c2VyIG5l
ZWRlZCB0byBrbm93IHdoYXQgaXMgcnVubmluZy4NCj4NCj4gUmVnYXJkcywNCj4gSmFzb24NCg==

