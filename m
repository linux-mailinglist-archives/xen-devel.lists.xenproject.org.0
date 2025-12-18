Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DCECCC702
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 16:19:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1189785.1510493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWFmT-0001z9-W6; Thu, 18 Dec 2025 15:19:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189785.1510493; Thu, 18 Dec 2025 15:19:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWFmT-0001wz-TW; Thu, 18 Dec 2025 15:19:05 +0000
Received: by outflank-mailman (input) for mailman id 1189785;
 Thu, 18 Dec 2025 15:19:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kszt=6Y=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vWFmS-0001wt-Ar
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 15:19:04 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e23334da-dc24-11f0-b15b-2bf370ae4941;
 Thu, 18 Dec 2025 16:19:03 +0100 (CET)
Received: from DS1PR03MB7871.namprd03.prod.outlook.com (2603:10b6:8:21f::17)
 by SJ0PR03MB6456.namprd03.prod.outlook.com (2603:10b6:a03:397::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 15:18:56 +0000
Received: from DS1PR03MB7871.namprd03.prod.outlook.com
 ([fe80::3a7e:e6ed:f8e9:9fb3]) by DS1PR03MB7871.namprd03.prod.outlook.com
 ([fe80::3a7e:e6ed:f8e9:9fb3%7]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 15:18:56 +0000
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
X-Inumbo-ID: e23334da-dc24-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ArHfal4Mea3gGc6qOydg73A2DMXHtgyoUfRuyZvaABxfzjf92A00MpFGEPBAKTUoyrsmhqPpQCGU3Jjo90gvQE0X9lHFWY91rj9Vp+xCVN/DhzL6GbsmJ4uxeS/kGt2o9lTVjyW7DJQzwekLtytNtZ7rawAJ4x8RJ5Mgc3ZGV6LeW1pzx1Cwh1IaEZMYyPoeNrB4NAS26he6eIsFSYJHa0scsi+COAWeF21Kje52jB+dcK/GVK92W7EOgcNls3a3lGPajLSBPK35WaOqEVAqHeUdmm6bRTzYZusGVkqEX3WTYAjCfG4UJwkItLZKWkSeISTMLSHN9noUCzmkkHGFUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R++uV1yAR9k1ljueZvT2JgoT5w32aYSiPMmriZgXdoc=;
 b=JrHKbfzoyF/uwtQM1+Z8Hb8wbZDie38Br3kMZDoxf7U92nAKbj4ctHKapWi8nbqh0Jyag8A4bQTMwExvz87wg/5fYFox02JhGOgxSmEhEW066ZW1qPZnXP1RkXpyxRc1NtaLaLMMMrzJyF1Dd6Uchf6SkEcTIpr8t9M6CMOuMU7BVWG1BXAm5MlidCWjV37m7cxrf/wes/24tDTtIddP7NM5mFSYUmbLqPjUpeuMDO59aJm6bSzSIl7Rl4/Auvm4vXJnW+2siHeZAj23hoES7aE5xk7axWDGu8Yrode8tP5eA+z88YRZt8L5kCqAN7sOICnl2u3RTkxQetpz40cA+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R++uV1yAR9k1ljueZvT2JgoT5w32aYSiPMmriZgXdoc=;
 b=sf+AJZXCuoRDwqNQ5mtegMBIfoiX9oZVHGtsGd+XEUnwSaG9IU2RXRYC5k8+fA4dU8/YzRRrXffe14/iDDF97O5bKGpHwMyevJHjYRRoO4/eT3dGgSmMg7PxYqBFIzEMgTozdpTFjfBxVl1/TAp04HKl3foAYAwFCjn4WTZomyg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] libs/xg: allow caller to provide extra memflags for populate physmap
Date: Thu, 18 Dec 2025 16:17:28 +0100
Message-ID: <20251218151728.28339-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR1P264CA0081.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cc::19) To DS1PR03MB7871.namprd03.prod.outlook.com
 (2603:10b6:8:21f::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PR03MB7871:EE_|SJ0PR03MB6456:EE_
X-MS-Office365-Filtering-Correlation-Id: fc7c65d8-301f-4fd4-544a-08de3e48c2ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dS9ZdU5KSGt5MDJJVzUwZzZBeC9CODRRQjFZaG55TVI1akpIZUlhSjBEWEVY?=
 =?utf-8?B?Z2VPWFNsRGpKSHpicDVtR0VWRXc1NGxMczA3b1Q3ejNmeUhSZUVKMXVHVVNk?=
 =?utf-8?B?V3dVNFUxbm9PUHU2MDArc0szeExFTkhkMVRkYnlIeWMxUDlFSXV4SzMxYk5J?=
 =?utf-8?B?VTZmbjVBdVlaODZ0Nnl4SWZPOFExaUxuTkFoVGlaTjg3clRpZnpNTWN0RElx?=
 =?utf-8?B?TWtmUHB4aG52S0J1NzdSUzZOWkZKR3Y3dGxlWkdzNkZZWi9Xekg2NDZvcUlP?=
 =?utf-8?B?dit2RXdEanBVa3Mvb2xQVFkwNmRTc09NeCtMdm9zZ2UyWEFPOFh0UVlrWnJj?=
 =?utf-8?B?SWFJaVp0SXV4UzlqUVh4dk00WXJoTy9GVW0yWmNhdUk2OElXRW55eWxmbEU2?=
 =?utf-8?B?Vmp1ZEJ0MVNQUnlJUDVKOURiWXFKNFpWYlA0VnY0MmwrQktXdHU0SS8xVHJr?=
 =?utf-8?B?b0hMQTJhN2pBeDRzbm8xNG1xSGJDVE54TUMvcmgyOGRybXNreHMvRFBUdHcx?=
 =?utf-8?B?Y0pVUVdwRVdibVFPTEhMVkxGTVl4bHJ0U01pbUFjRWhlNGhLbVRhWVU0RXBU?=
 =?utf-8?B?a1Z3ZFhkQW1xd2lMcVhMMmtxMzJCODA3bXU0Y2tuTnhvUnZGY0NRYzh3SDVL?=
 =?utf-8?B?UVB5VTJXaUQva212YWRUeVJIeFhWd0VONnhRU3kwMkF0c3RMRjBuQXhEeENa?=
 =?utf-8?B?Z2liQnhSTXR5bkFkejJXVzNHMWhKbDNSdWt6NGRGYnlCYlFiTUQ5OTRPNHFR?=
 =?utf-8?B?WWRNTEpHc3FBZUhNM2k5WGExZXMyQ0ROSS8rYjZuOW1LK21GcWhqaXd4eGdJ?=
 =?utf-8?B?MzdadHQ0T1piQ3NvY2R1K29URmtBVHRpTW04RXZMd0xzVVNHUGFCTU9hV1pn?=
 =?utf-8?B?a2E4VW1GbTJUbGN3ZHpTN0U4YlZVdWE0U2t2VDA4NGhZdDl3K25FMFZwWUdm?=
 =?utf-8?B?bjN2SVk2aURzUC8xc2llYVR0TFlQZFEzd2w5ekM0U1kvWFdvaGkvcndSQlM2?=
 =?utf-8?B?NlRvMWgzSEJpK0NtSzJLMjRkb3EvU2tPM1pMY3BwV0JJY2JxUnpieFY5Vm11?=
 =?utf-8?B?R3BGcFVtcEw2QlZRRGY4cHBSdFlmdVVmR0lGNXhUNXFGSTY1WEF0RStaVlUv?=
 =?utf-8?B?UTgwVWYvZW5VaWpaS2xhNFVlenExajRMeHhKc1RUU1hraW52SlgzV1ZNdk80?=
 =?utf-8?B?SmpDT1dqUXJuUVRycGlXZ3VLd3Yzd3dXcVJpOCtFaWJscFZPdnhPVDgwWkhG?=
 =?utf-8?B?TmtjS2hXREdHTXdWZDRHZ1A3WXBDOG9TSldJSVdJdS94K1ZsMVN4N3JQOEVv?=
 =?utf-8?B?ZkdwVjVKTHI0R1BwNm5aaUJIWmpPWXVFOGFGbXlNaUw0eFQxa0MxSGJJZ3BD?=
 =?utf-8?B?N0hYZnY2ZVNrdkQ5QytlK00rUFFsaDJndmFUUlpJQllKVEQva3ptdXhKK0x3?=
 =?utf-8?B?WXBGUmJ6c2oySHNpMDl2UzZ4YWQ5NUM2T2JmdjZPYzE5d2hKRGg4SFlmMTRS?=
 =?utf-8?B?elZEY00wdXplS3VVYWdBaWk3cTFNb0w3bFF1TlpHZE85L3NKSDkvR1Zub2wx?=
 =?utf-8?B?aW55Y3lGUW5jMUd2NWk3K0RDMmJBQ2MrVVVYZ0JhcHNQTm8vT25WSXlVaUNy?=
 =?utf-8?B?N0pkRUJxSGh4ekpjVDRIUXhWUHdBT3VkMTZzUUlacFBqOXBZK3hKTlFuN245?=
 =?utf-8?B?dS9iWHc1cStQYmpNNDFLUWwvSzl6dWUrTlRDTEtMcjRPNGRyNytXZGV3TzhP?=
 =?utf-8?B?Y3B0VkVoOGtHaHpKc0xaOFkwNHJ5TlFCQ3F4cjBIU0tUcURBSlZPam1HY2pR?=
 =?utf-8?B?SnJwS3pXZ21HOU1TY0NUWkQrQkNiOThkbjFpbWNhVVRQOW51L2dMUHpnOTZR?=
 =?utf-8?B?aWw3M3JpaWFMdE1NNW1IM3pUU1d4L1J0NllBaXl3SDhmVTAzVzA2Y3Q0dEdy?=
 =?utf-8?Q?iVg1br5HCbSfjb2bklCCbeYrnucNucTR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS1PR03MB7871.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUR0THQxaVE5ZldPaVljQWdnL1NIWjBkMndBUkFHMXpwYWdyOUMvTStkSVVD?=
 =?utf-8?B?bjlqaEZnZmEvTEZYcUNvVmp5V3FQSkRHeDFMOXMyRnc3UUlGTDVyRGt2czdU?=
 =?utf-8?B?SkhHeS9NeTZlTWNmMnJnQm9mMmp0eExnOFE5eUV2RnEwazQxOVN4d0dXNmFO?=
 =?utf-8?B?Y2YzZWFyWFB2dk9OYWc2Y240U2hYd3Jia2dxWVovMW00WTJlMk45QU1WWWln?=
 =?utf-8?B?TXB6WTJPQ2tLNUtmSHN5T2ZCTEtVeEpmNEtxVDJQWGM4Z2FlQ2QveU10TGxo?=
 =?utf-8?B?QVVYTkxlb01oS0w0bW9OeGJMU1FwcFc5WXRlU01YWGN5WUJSZ0VCbExLV2VW?=
 =?utf-8?B?Wmg0dTBLT0xLOUxTZEVRVWI4MlN3cTI2WExQbTJrSk1odGx1QmdoNFJ3dFNr?=
 =?utf-8?B?ejdjOWlBLytRVEpyWnZtMnJzNmhFM0JlOVIrWnUzK1kzV1A4Z01qTlI1aXBI?=
 =?utf-8?B?dFlOS3h1dnU5a0VQVXFSR3hSNzErMTg4K2xMUk8vcEUxcU5USkdabjBLTzdm?=
 =?utf-8?B?SHhPVTNtWSt6WXE3UDBFMjgxMXVvZDJTVVZHYndnZlVhcnVBUHFUM3RPMm04?=
 =?utf-8?B?NTVxT3FXalE4SmIxems4UWZvVyt0NFRma2trL3NNL2NtTXgrb0N6cFdPZTNh?=
 =?utf-8?B?L3ZpRXZQVFloVGFtMFArYlZJa0RWUFVrM1VGdTFFRk93elp1UXBQQmJmRHJn?=
 =?utf-8?B?WGNkQjRITXQ4KzdNdGlyYUtwS1FnTXBKeE9YOEg2NGJSckw1ZlNpcEs1NWd1?=
 =?utf-8?B?M1Urc0tjSjNMZzh5cWd6aDZKMVBGYVcvblJFVGRSTFE5dmtaRk1Xai9aZ3ls?=
 =?utf-8?B?ZDVWS2ZZMFhQU2lzTFVKYTVZSU5wU2lsQkJHa3ZnRzAwZGMyS3IzV0FRUm9q?=
 =?utf-8?B?eENYZUNTWXlJSVd1WlVHVndoaUJvb1NUWVk5ajJmcDlJd2lKeEhBenhEZlA4?=
 =?utf-8?B?MnR2OXhOOEd1MGdBeG1ZYmRXS0hIdG4zY0tJeTdqNmFPdW9OSjFldDQrbTRp?=
 =?utf-8?B?TXVRdW0wSzdtYXdpcVdDWENwNnR5bXhtVUNRTVlKRXVOTFM1M2t4U1pod1FS?=
 =?utf-8?B?WTJUYlljYXJUb2grWTNXUmVRL0VRN1d6T2oyaFczem5pZGRQNjlaQ3Mwenhq?=
 =?utf-8?B?ZFl5eEM0ZFBpeWZpN3R3OC9FOUVFT1RTdDN3enZPeDJqVkZscmF1R2pGdUF3?=
 =?utf-8?B?Ni9Gd3c4S0hKdmpOeUFIenFrYk90MWVaaUlpQ0FRTW0vSkJIU1pJVnkrdDBy?=
 =?utf-8?B?djJpYVNrL2RESWpsdW1iakU0ODFSbDRwdWVYak9TVU5aZjhzRFNaRmpCaVMx?=
 =?utf-8?B?ZThjekhSaGVlcC8rdXp5WHVDYlkzclRNTFdiNHJzdXhwODB3dkpQQ2x1WWlx?=
 =?utf-8?B?VUtQeUFRQUp1SG9YMFBjbE5LQ1k0Y2ZndkhpRDJTendsK0UydGwzUGEyVGNH?=
 =?utf-8?B?ZW1YWHVZZFA3Z3hhUlRNZ2FkSHdRRWtjTlM2WDZjLytyaHFObUJ4QXc4bE92?=
 =?utf-8?B?MW1WTnp4ODhkaGxYTmt4T3BrM1dvUTZwV3ZUQkNkQ1JDcU8xZGNsUE5IUm10?=
 =?utf-8?B?UnFiM0VtZkkvNkdQYjFEOHFPWUV3MDlpS252ODM0VXVxZm9zYis4SERLeEtu?=
 =?utf-8?B?ZVV1QzYzbjdwNkY0OTEyVGUyMTZCT29ZNS9QN09PNlkrSWhSZE82M0NMdGRh?=
 =?utf-8?B?QkRicGdaSlMyK2U1Q3FxeDd6WlUwT09FT2pDaFFrWGQ5NWw3bTkycThiS3No?=
 =?utf-8?B?MUVtNHU3VDE5S3JTSjc3R0xvZUZ1ZzdrdnBJNy9FWFg0TzIzMUxldzhqemRF?=
 =?utf-8?B?Rk5Ccm5uc0orTHN0Vi96NzFRaHBFM2J2WTdJU1kyYjQrUmM3amFOMHYrZnpK?=
 =?utf-8?B?UGM0dW5nSnR3MzVvTk5jSGpheW55dEQ5eTk5cWExb1NnNnRVUTBLRjU4Ly93?=
 =?utf-8?B?anFBWHBTcDU2UmJLWHR6bzA5N1NkZm1DWlRkZDhrNUx3aHNQZnNOVGxoUkpw?=
 =?utf-8?B?OGFIN2FMREttSFJHQ2V3Qk0xbTFyQkRSdDhmR2FQSnI0UlN1V3FIOW53cWhq?=
 =?utf-8?B?Nk9VaGJVREgzQTlyL0NyMFk4dVQ5cnFOZDlYSHJNdUNMN2pNaEFHZHBoZlhP?=
 =?utf-8?B?SitiZ1VUai9qNjNGa2wyVGtyOFpzSFI5NmlzN1NTeFJKNWFhczRIM3FGa3ZH?=
 =?utf-8?B?ZEZYS1cwdlQ4WWN4OEpXeXRMRXNkZzFHd08xalNtS1RwSnc2V0YzRzExSVVN?=
 =?utf-8?B?YnlyZmtSZjl0NHdzNnhFUklaZ0NHRlZ3NUdKa092bzZzSGJub2thRExMOElh?=
 =?utf-8?B?SERZSlRLam5QZEJlaWVpeUpnVUZDS3ltYVp2LzA5N21BNnJCcU9TUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc7c65d8-301f-4fd4-544a-08de3e48c2ed
X-MS-Exchange-CrossTenant-AuthSource: DS1PR03MB7871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 15:18:56.4107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CSGXzcBz0OyS/r/PpaQt9Uf3lBxBQukXIPHT8nSGOhXrrTZzK2H7w7B77JDScDB18R50XedERTTd/D0Bbzwf/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6456

Introduce an additional memflags field to the xc_dom_image and
xc_sr_context structures and use it to pass additional memflags to use when
populating the domain physmap.

No meaningful usages of this new field are added as part of the patch.  The
only know usage will be from the XAPI domain builder, which lives in a
different repository.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/include/xenguest.h             |  8 +++++++-
 tools/libs/guest/xg_dom_x86.c        | 13 ++++++++-----
 tools/libs/guest/xg_nomigrate.c      |  3 ++-
 tools/libs/guest/xg_sr_common.h      |  3 +++
 tools/libs/guest/xg_sr_restore.c     |  9 ++++++---
 tools/libs/light/libxl_save_helper.c |  2 +-
 6 files changed, 27 insertions(+), 11 deletions(-)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index c88958faa9a3..7c3b8b098352 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -242,6 +242,9 @@ struct xc_dom_image {
 
     /* Number of vCPUs */
     unsigned int max_vcpus;
+
+    /* Caller provided memflags to use when populating physmap. */
+    unsigned int memflags;
 };
 
 /* --- arch specific hooks ----------------------------------------- */
@@ -611,6 +614,8 @@ struct restore_callbacks {
  *        specific data
  * @param send_back_fd Only used for XC_STREAM_COLO.  Contains backchannel to
  *        the source side.
+ * @param memflags Optional memflags to pass in
+ *        xc_domain_populate_physmap{_exact}() calls.
  * @return 0 on success, -1 on failure
  */
 int xc_domain_restore(xc_interface *xch, int io_fd, uint32_t dom,
@@ -618,7 +623,8 @@ int xc_domain_restore(xc_interface *xch, int io_fd, uint32_t dom,
                       uint32_t store_domid, unsigned int console_evtchn,
                       unsigned long *console_mfn, uint32_t console_domid,
                       xc_stream_type_t stream_type,
-                      struct restore_callbacks *callbacks, int send_back_fd);
+                      struct restore_callbacks *callbacks, int send_back_fd,
+                      unsigned int memflags);
 
 /**
  * This function will create a domain for a paravirtualized Linux
diff --git a/tools/libs/guest/xg_dom_x86.c b/tools/libs/guest/xg_dom_x86.c
index a82b481a123f..a141a5861b25 100644
--- a/tools/libs/guest/xg_dom_x86.c
+++ b/tools/libs/guest/xg_dom_x86.c
@@ -1260,14 +1260,15 @@ static int meminit_pv(struct xc_dom_image *dom)
     /* allocate guest memory */
     for ( i = 0; i < nr_vmemranges; i++ )
     {
-        unsigned int memflags;
+        unsigned int memflags = dom->memflags;
         uint64_t pages, super_pages;
         unsigned int pnode = vnode_to_pnode[vmemranges[i].nid];
         xen_pfn_t extents[SUPERPAGE_BATCH_SIZE];
         xen_pfn_t pfn_base_idx;
 
-        memflags = 0;
-        if ( pnode != XC_NUMA_NO_NODE )
+        if ( pnode != XC_NUMA_NO_NODE &&
+             /* Only set the node if the caller hasn't done so. */
+             XENMEMF_get_node(memflags) == 0xFFU )
             memflags |= XENMEMF_exact_node(pnode);
 
         pages = (vmemranges[i].end - vmemranges[i].start) >> PAGE_SHIFT;
@@ -1354,7 +1355,7 @@ static int meminit_hvm(struct xc_dom_image *dom)
     int rc;
     unsigned long stat_normal_pages = 0, stat_2mb_pages = 0,
         stat_1gb_pages = 0;
-    unsigned int memflags = 0;
+    unsigned int memflags = dom->memflags;
     int claim_enabled = dom->claim_enabled;
     uint64_t total_pages;
     xen_vmemrange_t dummy_vmemrange[2];
@@ -1500,7 +1501,9 @@ static int meminit_hvm(struct xc_dom_image *dom)
         unsigned int vnode = vmemranges[vmemid].nid;
         unsigned int pnode = vnode_to_pnode[vnode];
 
-        if ( pnode != XC_NUMA_NO_NODE )
+        if ( pnode != XC_NUMA_NO_NODE &&
+             /* Only set the node if the caller hasn't done so. */
+             XENMEMF_get_node(new_memflags) == 0xFFU )
             new_memflags |= XENMEMF_exact_node(pnode);
 
         end_pages = vmemranges[vmemid].end >> PAGE_SHIFT;
diff --git a/tools/libs/guest/xg_nomigrate.c b/tools/libs/guest/xg_nomigrate.c
index 6795c62ddc28..9790d2b4a844 100644
--- a/tools/libs/guest/xg_nomigrate.c
+++ b/tools/libs/guest/xg_nomigrate.c
@@ -33,7 +33,8 @@ int xc_domain_restore(xc_interface *xch, int io_fd, uint32_t dom,
                       uint32_t store_domid, unsigned int console_evtchn,
                       unsigned long *console_mfn, uint32_t console_domid,
                       xc_stream_type_t stream_type,
-                      struct restore_callbacks *callbacks, int send_back_fd)
+                      struct restore_callbacks *callbacks, int send_back_fd,
+                      unsigned int memflags)
 {
     errno = ENOSYS;
     return -1;
diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index 0e419c3a96a0..f1573aefcbff 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -295,6 +295,9 @@ struct xc_sr_context
 
             /* Sender has invoked verify mode on the stream. */
             bool verify;
+
+            /* memflags to pass to xc_domain_populate_physmap{_exact}(). */
+            unsigned int memflags;
         } restore;
     };
 
diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index 4aed5cf4acb1..e148fc594a73 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -141,7 +141,8 @@ static bool populate_small_superpage(struct xc_sr_context *ctx, xen_pfn_t gfn)
     xen_pfn_t mfn = gfn;
 
     if ( xc_domain_populate_physmap_exact(
-         ctx->xch, ctx->domid, 1, SMALL_SUPERPAGE_ORDER, 0, &mfn) )
+         ctx->xch, ctx->domid, 1, SMALL_SUPERPAGE_ORDER, ctx->restore.memflags,
+         &mfn) )
         return false;
 
     /*
@@ -217,7 +218,7 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
     if ( nr_pfns )
     {
         rc = xc_domain_populate_physmap_exact(
-            xch, ctx->domid, nr_pfns, 0, 0, mfns);
+            xch, ctx->domid, nr_pfns, 0, ctx->restore.memflags, mfns);
         if ( rc )
         {
             PERROR("Failed to populate physmap");
@@ -901,7 +902,8 @@ int xc_domain_restore(xc_interface *xch, int io_fd, uint32_t dom,
                       uint32_t store_domid, unsigned int console_evtchn,
                       unsigned long *console_gfn, uint32_t console_domid,
                       xc_stream_type_t stream_type,
-                      struct restore_callbacks *callbacks, int send_back_fd)
+                      struct restore_callbacks *callbacks, int send_back_fd,
+                      unsigned int memflags)
 {
     bool hvm;
     xen_pfn_t nr_pfns;
@@ -918,6 +920,7 @@ int xc_domain_restore(xc_interface *xch, int io_fd, uint32_t dom,
     ctx.restore.xenstore_domid = store_domid;
     ctx.restore.callbacks = callbacks;
     ctx.restore.send_back_fd = send_back_fd;
+    ctx.restore.memflags = memflags;
 
     /* Sanity check stream_type-related parameters */
     switch ( stream_type )
diff --git a/tools/libs/light/libxl_save_helper.c b/tools/libs/light/libxl_save_helper.c
index 65dff389bf8f..64bdeb3b32fd 100644
--- a/tools/libs/light/libxl_save_helper.c
+++ b/tools/libs/light/libxl_save_helper.c
@@ -285,7 +285,7 @@ int main(int argc, char **argv)
 
         r = xc_domain_restore(xch, io_fd, dom, store_evtchn, &store_mfn,
                               store_domid, console_evtchn, &console_mfn,
-                              console_domid, stream_type, &cb, send_back_fd);
+                              console_domid, stream_type, &cb, send_back_fd, 0);
         helper_stub_restore_results(store_mfn,console_mfn,0);
         complete(r);
 
-- 
2.51.0


