Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2F9C74075
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 13:45:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167313.1493659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM42a-00021I-Km; Thu, 20 Nov 2025 12:45:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167313.1493659; Thu, 20 Nov 2025 12:45:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM42a-0001zq-I5; Thu, 20 Nov 2025 12:45:36 +0000
Received: by outflank-mailman (input) for mailman id 1167313;
 Thu, 20 Nov 2025 12:45:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ChS/=54=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vM42Y-0001zk-EB
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 12:45:34 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ccfe0732-c60e-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 13:45:32 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MN2PR03MB5101.namprd03.prod.outlook.com (2603:10b6:208:1b0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 12:45:28 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9343.011; Thu, 20 Nov 2025
 12:45:28 +0000
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
X-Inumbo-ID: ccfe0732-c60e-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HlBf+Bja0wUWE1ZpgYBbU4cHDK0W0K5004vyDM+BXM4bJM/a26Ok4M3y/a77pwi3FkSsdhdNjupCsKv9612pHuD2Wo8PNnWg94vvTN9XRubattrAWXGvijbYS5WMXVNaQyvEpDAoJepkXGfGtx4FWS7vuGSQ/RnETJHURBZ914n+w6UgoSZjnYqZ+TL9/MKavndBM8qbxjFiKMfUd12ieZpDYii+R+i+GK1qoElqG4kB6lZpUhaJXdULmW7dku9lm1V3lsjn+AZw4VJ5fKlc4p78O+a8OgQrbWIC6FVBz1ldeNf+mtrNkrt09xAPJrEtVJQ6l7aVLf7flsLfdqXTvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=26v5mxZKMhTItQOGAvGMG23lGtkJEsyCd+MqOp77gpM=;
 b=Odm8uF9K1fYtYveOYXTkuiU06FEtQOKE4pv7HzaAYkCRaGneOxONVLidf6zYBZY6yIHean9z9ERgsavwZ5BZsLaGzxDsvZPMcMs8eszyIYCAing3JnWNKuKCs8eMC2sd4X7xV6mfkIYMwibuoaWhZSmPX7z1zuCeX1O1UPLd3IjNXwGphF2KnNYZbfIxKsakaX//yZnV9KI1PemVyX1kllFpqJu82B/0UKIZIgtyYUN7zuyn58mHBNUFUNRhQfYjO/Fs+zRyANwVr1jIDiSuH9LyIopOzlPLyjoksX6wUhjBscNK9wXGFp3sxFux8ZIXB3kepmCFTYDe51TFGepCIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26v5mxZKMhTItQOGAvGMG23lGtkJEsyCd+MqOp77gpM=;
 b=F4kvHZ/+CW47KJUA4D742o43hBNPJxSw639dVKpuUFMslHQEGPCtUVkJul27htyjywUZwCZLQbmxJD/xkGaVEY7AuxZMGCGA2QpefrbHimyZsUFt2Nb0B4Waie4BB6WpE4qXTZHtKCEzXiDfF9PSIHF2nDDVAu1Er2ADRXMg8lg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7ba08f24-1803-4fd8-95b5-1587045d50f4@citrix.com>
Date: Thu, 20 Nov 2025 12:45:25 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] x86/irq: set accurate cpu_mask for high priority
 vectors used by external interrupts
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20251120090637.25087-1-roger.pau@citrix.com>
 <20251120090637.25087-5-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251120090637.25087-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0039.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::27)
 To CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MN2PR03MB5101:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fd8b81f-a92d-4ef0-059c-08de2832af15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eGRGbGZyWnpFTFRRRWg0R0JBOHdwUkliNmZocUtSa0ZtT3RBdm5OMjlXZlJl?=
 =?utf-8?B?TlBKclBIUGkraWlCb016eGVWcDhMYUtxUWFUSHo0Z3lKUnhCKzFvNDVnaWNJ?=
 =?utf-8?B?NkJvZjYxTjdUTlp3MVNMWkFLK0ZTVUNpS0c0ckVFaVdzbHlkRGQxeDdnbEM2?=
 =?utf-8?B?aGdRKzFsZ283MTdiYTZjYXgyeGlxU29VcHJUeXFsLzdLbjMyY1doWFJ1STZU?=
 =?utf-8?B?Y282SEgrcFRsWGhveVJ4UGJxYTFnVjFBemhIbU9OUnFVMEQ3UUI3dVc1RmxN?=
 =?utf-8?B?MVMwNW1raHU0QjVML1p4bG0yUkw3Z0ozNjdpMXVHTHZQMEVxb05zd09wU001?=
 =?utf-8?B?SVZLc1pvWGkxc3UyNUlxTnRRRVpabmNmOW9EZTRyZHFrYU4yYis1bFBSUG5i?=
 =?utf-8?B?SlkrTDJWNEZPMXBXNXdEQ2dKaUNRMzlseC9pa2ovZHd1YnlRY3V4MlJoUW9v?=
 =?utf-8?B?aTlTdHR1YWpXYytqVnErd3ovU3RZOWtBU2luMUNtaFRaL1N3NnlabWdVcFZD?=
 =?utf-8?B?aUU3U29MNldIa2RsZVRrNmhteEVORzN1MzBETm5Va2pXNDlRa1hEUk10SmVN?=
 =?utf-8?B?QmJrZ09kS0JoUVhQVmhGZmlSWDB5QUVReW9heU1RVEw0amI4eE1sS3VHM2JY?=
 =?utf-8?B?WjhiUHZSWnlKRFhIWVN6K0Vic0FOYkNMY1hSdi9DajJhTC8rUnRVSjJrRHBY?=
 =?utf-8?B?UjRVcjRnUEtoK1lPVGdwQVVPenMyTGltNnQ3eitYdzhNWmVmdnZDY3hHTGNU?=
 =?utf-8?B?VFFubk1KbU8yUlQ2djZUdDhXYVZvOE1HTjRPNThOQzNMcEtEMnk5YVFRcStE?=
 =?utf-8?B?Z2RJeG8vZmRObW5Ma01SMmhnN0diTE1UTDcwMWFkeVdtTzliWjVXZTJlWjBN?=
 =?utf-8?B?MmwyVmtUSU0wT2dqcDduWFA5dEU5UjAxYjVScVFLckt5MXFUWHNmOUZnYjJz?=
 =?utf-8?B?MTBjQ1VBY2Fud1ErTlhPR3dYRHhybk56bGpXQzAxUFc5STJzWWtnRVdpZkxt?=
 =?utf-8?B?ZVZna1FRMUZCclZqTkt0b3JtUkFoOEdwaUhQY3I4SnFVYnBudGlNaUFOaHdE?=
 =?utf-8?B?S2xQMXdVdEtxNy9JWWxjR3BwQW1jSlF4djZBaTFnQjFSaDBrNjFZbzN4WkVI?=
 =?utf-8?B?MDlwcy9CYnM4Rm1vOWlsNUVDUTYzTkJkK2xNSmZaSjFsMVdrMXYwOFFvN2h5?=
 =?utf-8?B?T0V1NGxRVldHb0JRVkZoOENlUy9XcnFaQmJPb0lGMDdsamp5MEYrdFBDUW1I?=
 =?utf-8?B?UGdIYjVXMEJiU3piQWYrRXN2R3FnbHdoYVh1bGlDcjN1N3pqNENOdXFKaUx0?=
 =?utf-8?B?TXY4cnp3OW1rYllRY0FqZFZHVHNrS0J5am1VRmY3bnJwdERIbFBBaGJyMC9V?=
 =?utf-8?B?OHMremppeTJGRTR3UjdkdmZhTXhyOG1Db2pjci95d21kaUI4c2NRQUUvOElr?=
 =?utf-8?B?ZWlhblZIUHd6WmdlUDNpU2kzWnFucHIvNjhnMUtab1ZXNUp4TkZ1V3dwQktz?=
 =?utf-8?B?RXJrR1REZlZqdWg3RGxURmJkVUJWTWljdmFFUU8zMkVCWFQ1dFA4dkhiT3Fw?=
 =?utf-8?B?aW8yYXViVDV6VnlmcDVGMmRPRTBGVHFSeHlJOUo5NjdQOXBkT3NNK0Z1dlhr?=
 =?utf-8?B?c2xudElmYnJVVzdnTnQ2bWlxbFVxY1FwMUR3UDVZQXFRMUg4b1loM3VBMnBq?=
 =?utf-8?B?RHl6OWR2RDRIVXRuOXhnVnVMcFh6dUpMVjdBRWhqUlhLYjFTVzljaFluRVE4?=
 =?utf-8?B?QzUvK0JqdER3bHFvNnZQVTJyZnlQQ0dwNWxCSCt0NWxlMFRTa2tVbVZ2ZnBn?=
 =?utf-8?B?bmZhQ3RjNE5WRW53cnZRbWFUWEM5MWI3ZjIzdEQ2ZklVRFdMRGtvTkpseW1T?=
 =?utf-8?B?L05mQlRsVHY3alNjMzVCMDBFdVV2aTNlbW00OWlWRWxqQytWcjVVdFF0R09a?=
 =?utf-8?Q?J+SGk5wFMGs6AmK64bXdd8i9h+aCLCdd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmJBVWRwU3JkTDBlaUJGeTliaWhsOVdTR2g4dHV1TFJPTnAvR3lLdno3NnZQ?=
 =?utf-8?B?NmY0YWR1N05XNjNmNHNESUN5dnE0QU9sWHpiUDA5VnVwMXQxUmc4Q0VOZW0x?=
 =?utf-8?B?ZjNUdXNKbVB5bnJCZUZDTi9aU3d6N0c1ejBQWkRnUVdoSmRDY21vWlAva2Zx?=
 =?utf-8?B?TWZxS0FFT1pEQnJCZERsbENBRlplQkJDeDlOUEt4anl1WUdHS0lFYXJwMTZ6?=
 =?utf-8?B?YVRmUUN0SnoyK3cwc2JNOU9zK20wSFZXRURORi9kSmxqNDUxZGQvNkYwWExu?=
 =?utf-8?B?N3d2SnpKcVZ4UVBrMlgrSTJvMktBam5jbnBOY0dpeFZMYmNEdWxlanlOUzFo?=
 =?utf-8?B?SUtvdncxd2N0aXBqZFR4MEZiRVBvWWUxeUJvY1RyL0NVTjB4RXMzUjFhZ0l2?=
 =?utf-8?B?SnoyOWJLQmUwYVliVXQ1RTN0Zi9YNlhjMTlWQjJIcXZPQ0pkQzVOeFBOdW85?=
 =?utf-8?B?cHRLOVVQdXlmSDd6UCtVV2Mrem1tMkxLcndDMUNnSUZHOFlONkkzaVVuSVZQ?=
 =?utf-8?B?dWE4cnZtYk12OU5rbHd4UDlrKzNGU1h4ZUNpZm8wVXA3dnpBWFZQM1lxRXdH?=
 =?utf-8?B?N0dJNmVRMkR0UkRTaVo1M1drTVUyVTlxMEpKTGQ2V0xsV3A0VzJaV2tvQk1D?=
 =?utf-8?B?bndCWm5vVC9ONTNCaVAvbVRSdkowbmQ5bzh5U25ITFFnVlV3enpKbG1EbFNo?=
 =?utf-8?B?N2RmRXRRZlBSZlpuUDdCR0lFZ2tERklOUEJGMzhmVldoQjF2YTBGeFpScFFo?=
 =?utf-8?B?aVE1RnZ5YUhkRGZCVDl3Yk8vejl1a2s1SURJb0xSUFpUVCs5NTd6T1p6cnVP?=
 =?utf-8?B?TkRHdlFscmw1bEMxaitHanArYklsWHJPKzFnRkZlT1JvbDR0Q2dPZkp5TGoz?=
 =?utf-8?B?c0JlVXoyaG5lVEJNeVh5eklTZlpSSXBiSjNyaFM0OXFYMVVXbEVoVm9ZY0Er?=
 =?utf-8?B?WnEyNHlJa2dEVjFuSTd6NmEyQWJmVG51M04xczZudEtXWFNXSFNybDlvUW4y?=
 =?utf-8?B?dzdzUXVkaWh2MUtOc3dGaW9IVnN0V2cwWHhRNGZGWHRFRHE5MmoyZ09ObjR1?=
 =?utf-8?B?dTJ4Z2JYeXFjZ3F2c3JCcG5qRDFFYldDR0d1NnZtaWl4UHAvc2t0dmhMaE1p?=
 =?utf-8?B?bHpGRTBJY3U4bzlHOGxKM0dweUd0MDBnNDMrS2hQR21JNlB0N3FNTXl0N0Vw?=
 =?utf-8?B?bEJPbWVSeTZBaHIzdUUySDRpUE5najhIVE45NnhwaDFqMHlWTmh5eU54c0Ir?=
 =?utf-8?B?MmU2SmxwbmRLVGI4VkhoN2E3ck55c3RLbkhpaStraE5ycC9oUGpnYzM3WnJ0?=
 =?utf-8?B?OThaNFQ5bld3ZDlTNk5HeFAzRE1KejQ3ZStNQ1E4bFc2NHpKSFlZTmMrbUgv?=
 =?utf-8?B?NXNvSXpZM1gwMC9NQ3pyTEJTM3pNcUM1cm1XNFZQRjdvSGVRdTdUaW1VMmJ2?=
 =?utf-8?B?b3h2RnFmZ1hRalZCdkNaSlo5T0djWjV0QU51ajYyNFUrZW1xNTNhZHROeHZX?=
 =?utf-8?B?T0lmYlBHdWVWbzVTZ3NBMGFBUDdZc3o2eUJYSFh0ekthRXBqWWxrZVI1RC9a?=
 =?utf-8?B?aEt2NEZ2c2JSUFF1UkRkc1lBOUNTMWxPNzBOanV3dkRPSGtDZ20rOHVMdWly?=
 =?utf-8?B?Ly9sZENiMzJhU3JDQit0SWxHQ3ZQb3NZc1d0bU8zN2E1WVhPU3k3NlJVWDdE?=
 =?utf-8?B?Q0RvY0JIOWRCZkhqMUtrNitVc0pnVUI1T0x4YktzczRMWnM0cHpmbnJKR1dO?=
 =?utf-8?B?SDRJSDVsd3pKQ2QzU2c2TkE4R2o1WlNHM1Y5akpVTWFPZ0hmNUlSSEhFakpR?=
 =?utf-8?B?aGcrVXVHZ0wyaU52WXFtWjl5QkRBakJmTnl6bDJLUEZyRUVGOEU4aUc5YSti?=
 =?utf-8?B?dVNFTnl1YjlReUpvb0l3RVMzYWtWTnpqclFGa2NFT1BkWUZpTWRwMjJiM2h0?=
 =?utf-8?B?VVVUZldHU3ArRDNDOFp1NzhFV1VUTFFJTHZ1RC92UE1mckF1TDNablFub1BL?=
 =?utf-8?B?eC9EYjhGZUZwb1FRTjBwT2xJM3g3N3R2MmVRLzBZczRKVUkxNm1zS0llR29L?=
 =?utf-8?B?bDljOEpCOEc2L21wOURHSDY0MEMvQWpSUmdKS3MwbDRVRzNuZ1JVSWg4VmVO?=
 =?utf-8?B?SiszcHBTVjhzdDhqRjNGemNneWFUQnpFV0dwMzFFSHJiSzBQQjFNcVp4Vksz?=
 =?utf-8?B?TlE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fd8b81f-a92d-4ef0-059c-08de2832af15
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 12:45:28.5493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4bHiQC3KNkNwkzZBkixd8R1VAEPWm5Jw1qaMmrgbc6K0bk9iuP/egGxn13S4e7l2BZjx9yLFnT73Z+TpLOERXA7semUpR8k9Mf69i+a47D8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5101

On 20/11/2025 9:06 am, Roger Pau Monne wrote:
> Setting the irq descriptor target CPU mask of high priority interrupts to
> contain all online CPUs is not accurate.  External interrupts are
> exclusively delivered using physical destination mode, and hence can only
> target a single CPU.  Setting the descriptor CPU mask to contain all online
> CPUs makes it impossible for Xen to figure out which CPU the interrupt is
> really targeting.
>
> Instead handle high priority vectors used by external interrupts similarly
> to normal vectors, keeping the target CPU mask accurate.  Introduce
> specific code in _assign_irq_vector() to deal with moving high priority
> vectors across CPUs, this is needed at least for fixup_irqs() to be able to
> evacuate those if the target CPU goes offline.
>
> Fixes: fc0c3fa2ad5c ("x86/IO-APIC: fix setup of Xen internally used IRQs (take 2)")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Which external interrupts do we have like this?

Looking at Jan's series, the VMX Posted Interrupt vector is like this,
but I can't see a case of getting a high priority vector, and
fixup_irqs() being a legitimate thing to do.

~Andrew

