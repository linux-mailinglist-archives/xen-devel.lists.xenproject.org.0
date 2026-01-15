Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7F9D257A7
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 16:48:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1205427.1519703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgPZu-0001Pz-Py; Thu, 15 Jan 2026 15:48:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1205427.1519703; Thu, 15 Jan 2026 15:48:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgPZu-0001OB-NN; Thu, 15 Jan 2026 15:48:06 +0000
Received: by outflank-mailman (input) for mailman id 1205427;
 Thu, 15 Jan 2026 15:48:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xZ5x=7U=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vgPZt-0001O5-4W
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 15:48:05 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 909b5cda-f229-11f0-9ccf-f158ae23cfc8;
 Thu, 15 Jan 2026 16:47:59 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BN9PR03MB6042.namprd03.prod.outlook.com (2603:10b6:408:137::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 15:47:56 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9499.005; Thu, 15 Jan 2026
 15:47:56 +0000
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
X-Inumbo-ID: 909b5cda-f229-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AStzdjVhvaYJZpcF072LnMeq6tsUPtW/vpTVsvMr13lKpZpWFEEUVoQOM7c7ia3/yzOnWusaQFUeZGTbJc03ROFdnpP9acKkV3k6D3Ea6usKJSkfWbBhZ4/jpzcFscPNEByRyef8uQLJty4z8AeHDZbgy5G4KbyeaxZvZjwgtTFUkSsKaK4rykH1oeqBf26Hj8ZL3XKZwUCH4OMhASp9dRd4C+unwug2BjQzdeTNPejiddARaWgTyuRKY0rwbuY6L6ImHuCAFCG3YnKS0+iRLBxSvS/WaQxTOxbT0Rpy98Q/EoR0/LssuW8va+QNmSvDtvHVLSkoBNExxFjSPt9jRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3TOq1LgknB8r94vHCHUTJ8lcwAaUsfulbrztKnI2+Ys=;
 b=WSzC7um6q5M6l7ClsQKtzUK8mtT09IO0GWMamoI3R+6CPgrOBAi+9eUh9LpFrszhAjQSisNe3ZYFUoJNmmNUhYOlsfzUW3J5AFR+KkmHYTc8oe7QWacqONwGdFYyHNnS8W/1gdKHkd8KOMpaSLp/hZlpbAlH2eOn+9b0N/0307Q806VBDPv1JNctNajm/9JTI6Kf5F9ceF1HKQyiWRtqOYqCrmE1A/ZIh4Jnm3Ci3sPG8QsXjZCpEYi9id/i1vLTTf8sYCC4Qcipr2QfKcaQI+7azWmeN3cfYEq9hp5IH1qES/N7f/kA/z241eho6d4XcCaDxfcWakGiGLoQOEf9hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3TOq1LgknB8r94vHCHUTJ8lcwAaUsfulbrztKnI2+Ys=;
 b=axeLSSfpSf5vWl8uqvkQUdJMv/cgHIOL7G667Uwe/9lVSlADnFZeldzVq4qgE1Q9qVRkMC3cwD95NMDfiaFDzUV227M+Lv1ealL+jIt54qVBEGc77lJSkK0lCI5gmlvY6HsDogFgjNGtxmnQIGpOVnSNfcdLnLOmitKOonuP78g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <69b511db-654d-46b3-aca3-3f37f30d3473@citrix.com>
Date: Thu, 15 Jan 2026 15:47:52 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] xen: Move NX handling to a dedicated place
To: Julian Vetter <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
References: <20260115151658.3725784-1-julian.vetter@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260115151658.3725784-1-julian.vetter@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0189.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BN9PR03MB6042:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a605ab9-70c2-4f7e-bc31-08de544d7368
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aTV2UzIzK2FNZmtuWlNnTkUvbC9PUFpOWVZ2bHZqL2Y5Vm8xU09ERnBBTFZV?=
 =?utf-8?B?UmhYM1A3bnNPM2M3bGdnQnk3UUdzQ0V5UE5RaWl1T3UxMHVHN0MrY3J2bnBn?=
 =?utf-8?B?M0E2UTd1WnZnd3pCKzVnb1lJeEN4MENqUXYrNHduRkhHcmRMUWZUZHl2bGZY?=
 =?utf-8?B?QU1uS2dmRHphTWFrbGhIaXBoZjhGa1N4UUMzUFVubHZUSUFWZEZXUHJBQUdQ?=
 =?utf-8?B?eFpVRWZTNWhncDRWc3BCZnJ0Skg5bUJiMXFiYmxDLzFld08wV3o4S3I3eHd0?=
 =?utf-8?B?bytFNXRYRjh3M0kzb2Yvd2xjZVFCdUY0Z2xEY3V4TjZGalZIazUxdlcreXdJ?=
 =?utf-8?B?V3FLUERSeVlZMG5ncG1ubUVESHVqMVJzSSttNWU4RmU1U0MxbWRNb3hvZzhN?=
 =?utf-8?B?a3U1ZHpqbDdSQzZXOUhaekc1YW04bk9QNGJCYW43RVNaN1NwOXBVTzcyQkJU?=
 =?utf-8?B?LzA0T1Z2NjNIdHZPZzFXbXpsVnRYcjROb3ViZW9weXpIR0NuZkpRZHdjdnJ4?=
 =?utf-8?B?TWRnRzBlbnkySlFqWng3eUpkQlJHRU4wVmlMZ3hHUUVuS2hVSWU0R1A3ZlJ5?=
 =?utf-8?B?UXdaNjJsVnNYeWtzT0hqUUk4OFVPK1VMK2RQb3dRMmRpOGlldjZQSmxPNFBX?=
 =?utf-8?B?eUZ1TGZCQ1phdVBvNThESnBaa2h2SjlNT25IQ0Q5UHR4ZXJOVDFIakZlWC96?=
 =?utf-8?B?RXArTVcrSHoybWNjc0l5cUtFVEJCTy81Ykp6aG9uOXlQdzJwNkpVS0d4RGVo?=
 =?utf-8?B?Y085YU14aFE4Z2x2TnhVdVl1QTJGN281VkUxMUdoRDljNU9CUkg1WnpSRUVx?=
 =?utf-8?B?RHRCem5PZncwa2dER3A0aUtuREpmbHZoWWtvZGJRclE3ZWgxUkYyRUxUR2M5?=
 =?utf-8?B?WW4xOWRWOVhjT245dlcxL1VBWUx4RVhVM04zQ0hza0I4RHFlZnBUNEwwSWpF?=
 =?utf-8?B?bHlvdTlSL0MxVFlFNnVCZlU2ZjdRWWZuc0Z3cC9TVklsVjlDSXMyMnVOOThV?=
 =?utf-8?B?bmw5UElZN3cxMnFET0wrQUdKM2E3UjY3MndRRDh1U3RWY3VTYU5vdkNMVW1Q?=
 =?utf-8?B?YUhsN2xBVzBUV3l0anl6QnBaVUdFa2Q1a3Myd2JNNHU2RW1FSWhuTmExMEN6?=
 =?utf-8?B?WEhpaktoeFhyc3puUzJySjVCVlpjazMvQU9XTmtCWUE5OU94ZFIvbnY0azg0?=
 =?utf-8?B?RkdqYzNWZGtqNFlzREdwbUZyZ0lIUnJoYllIN0FkNWlaMzZ4bmdRcXJlWTZ5?=
 =?utf-8?B?RStUS3FZSWhPMXBkNWN4STVzQWc2bW9EM2YrbkpEQ0w3NXhxblEwdkc0UmdC?=
 =?utf-8?B?NmJHUHFpbnVaZDUzVzZLbWZ0Rm1lLzZIaVlEREdGWmNOS1NxRy81SHFqam9w?=
 =?utf-8?B?UWdsckw5dnhiTVhYSGpOZ2VHVFcvdndZWEROWDZ6cUhnVEdOSFZOeERJQUJW?=
 =?utf-8?B?UXFJTWoybTBodnpRNnpBenZENmkzbTJPazc3emJ6ajVnQWp4Tkk5d3FHTm8v?=
 =?utf-8?B?MTdEUmFUMVk5SEgzZGpxVzd2bVhic0xXdzVXUktPSlFBRjB4bnVRWGYxK1dn?=
 =?utf-8?B?VU5FY05DRUJ4MnBLM0xaZlh3MEtuR0t3dWFLT09leGMzK3dCVTlyQ2VhRU45?=
 =?utf-8?B?MUNhS2lWNUszTndnMVVZVkJHdVVVOE80Tm9IbTZFdDlqVU9seGdXNEQ1aUFX?=
 =?utf-8?B?ekk5V25ZclZtNFQ4eTZVNFI3SGRLQnFMcFlhVXllaWIrcVFON3BzcHRqcVp1?=
 =?utf-8?B?VUh6ZDh1SnhTbVlKS25XL0x1bFFkNERLaWEzMzhRYVdCbnhPR2JISTVCM3R5?=
 =?utf-8?B?aXUvSFQvRjJ1dTBUTnRLV2VhWmRFNnNVOTZyYTV2RXVlS1V6N2ZXMzFLc0x1?=
 =?utf-8?B?VHZXMG5Ud1FzZ21jQUpvZXAvV1cwSUJYM25ZSmN4aG1UOTg0bHJnbGNsQnZU?=
 =?utf-8?B?R3h4UFdLZzEydjNnMTNBQmtnQ0V5dkdtYUludzdlTTRuNWZkT016UEpsNml0?=
 =?utf-8?B?aC9oa2ppdlJpRms1NW01Q0RJelJLaDZqTzBUSUpGTGExVDJvVFR4QlN4UDN1?=
 =?utf-8?B?OGZqUDIxWk5uM0IzTU4zbTJGQTJRcy9kazR4WTQ4SmJ5NHZqT1cwYnpSN1V2?=
 =?utf-8?Q?Vzcg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1plck9wZGlwYkNUWld5c3ljd3d5bFc2disrS1RiYjF1Q1VDZDNEdTlnYzVX?=
 =?utf-8?B?ZTBOaFdmeHhCVTQxeFRUZFVOeTV4QVV4Sm1pdXg4UjBjd0psOGxkREIxN0M2?=
 =?utf-8?B?T3hpMG1CemlpSHg0MTc5WElPNm12aDlHdDE0UEp2bkJGZHZJN2V0OVZ2NUJQ?=
 =?utf-8?B?VEwwdjg3NFRqU3diekpCYXhJaEpiNUNzbDRwalkrais4V2pXWFZsNmlNM05w?=
 =?utf-8?B?dnlZSmZScTBYQVFPMXBRWmtzOThYVXQ2Z0txMWtDRnV0NEpzSzIwVVoyZURZ?=
 =?utf-8?B?ZTZwb1NWNGR3d01Vb2t4eVgzVkhLSGRzbEM5UVgzZXJ3ZE9FRFV2U2E2MTIz?=
 =?utf-8?B?WlV0Rm80YjViSlo3TmJkTTNuY1RzQTJyMVRUanlQQXhyTVIrTXFKOXBmakF1?=
 =?utf-8?B?WDM3dmxXOFRWR0MyQkVEL3pYdWc5KzBRaVFncFNRVmdwVjA4MFB1bUxkcytQ?=
 =?utf-8?B?dEtHdTNwZE55bUY0Sm1zckNLbzZMV1FwRTBxK29wNEdQNlhGbndrQ0ZjQUZa?=
 =?utf-8?B?bEozeC84a1VaSXdyODdVMnMrQWF5NHRLamFEQW5ZTEZKWHEvcUhEQytVNFJU?=
 =?utf-8?B?c2NDVTlYc0E3S3lBN3JsUW9zYjA0bDRNNU1keGxLMDNBNTRKTTZNRmxxOXg2?=
 =?utf-8?B?cEtWbCtvRU9PUXJJb2czbzU3N0tLa1paM1pvRjlXeWkrTk1SbzM3NkZ0TmZz?=
 =?utf-8?B?K3ZVK21wMjFFSi9rMm1IZnliaWFuV1VBVVdGOE9Fb0hGZDh2MkFRMjZ0MThV?=
 =?utf-8?B?V3ladmc2bkJLczJueDNQREJCaCszVzlqYlh0NlpDTVRVaEVvbTI4b0N0MVhP?=
 =?utf-8?B?ZW8wSnB1Q1h4QkJ1THh0bnJGUFcwSTEzVUN3anNTOWVYRW5PbEtOajFTbkJH?=
 =?utf-8?B?MHg5anJTT1U4czhLY093Q2UrVllkOW5LSWM5S3RMVVJVNWFDb1FkQjhqaXlw?=
 =?utf-8?B?VWp0TFRhaTRIRkRMWEdwb0hhZ0xCRnR2SHFsbUcrR1dwVFBlYXhTZUFEd2Jq?=
 =?utf-8?B?bldQeEVXbzBkR3V2MDhMcmRmMjhvUTdjbDFFOWQrNEJteW5wUk1RZm5pbXVu?=
 =?utf-8?B?VEg0NnB3WCtqYU9KV0ZxVFNiQkNHMlpzZDBoa0lrUUpKUDZ5UC8zUGVYZmll?=
 =?utf-8?B?OG9IcGNmN0pJRXc0T09vVFhVWWY0b0I5Q3hEdXFGZXo3Q3o1UllGKzVMREFn?=
 =?utf-8?B?VFRKK3VZeURObEExVy9qQ3R6eWtWM0l5VHlkZEhoYU8xSTZYRTAvSkN1dG9t?=
 =?utf-8?B?Ni9LajJjUkVGREhkYjZDVVB2cW5ST21DbHJ1bndZdmNBL3dVM2greEtIbm41?=
 =?utf-8?B?aEl2L3FyeStTT3pMZVdPTW55TkZjRzVjbHlFaWFXT1VmSDQzazl2YWZkc1VV?=
 =?utf-8?B?K01Tb1JCeHZJV1JGajY5aGNyL1IxWTJzNHJJQkZXV0trUXVOR1o2THNXY2c1?=
 =?utf-8?B?K3dFR1NCSmlpR0VEVEU2ajNFY00rbW0xVy9oTUd0RHFkT0FzZVlJWVduNnN5?=
 =?utf-8?B?OC9hSldnQkk5aG9sZlRPWWsyM3FLd0VTZm1oVmgwSUZPM0xPcVpwV1p4QkRW?=
 =?utf-8?B?VG9LK05BRUdDUmpOZ0pQVVo3VXcyQ0RyVklkSGRUS3h5NVJENFB4TDNPQ2Jw?=
 =?utf-8?B?K2RXclVISVZqWndsZ2FNOEFHSVRPRHFQS2dIVUhTcm5EZy9FZXRDRDBzRktw?=
 =?utf-8?B?R3g2TmoyWTNBRzlXeUFLSVFrMGVDR2phZnRTaG1qeEhHM2tULzR3MGphUWxT?=
 =?utf-8?B?S3Z3dUcyaU1MNWFCWlBDZXNraGEwWG5KZTFwcjM0bXIzeURLQ3JCbG9YM2I2?=
 =?utf-8?B?MC9uaDY3UkR2Nm4wZElSS09pdDVZSXVMLzZaYi82eXh6NiswZWlkZG0vQk1M?=
 =?utf-8?B?L2RkbVBSUVFZbjhlNmhQTlJLRStaSXJ2czYvMHQyZkp6WVZ5Q1hrRGJaOEIv?=
 =?utf-8?B?UkF2WFgvenVZOFE5SnU5V2ZBWHBiWUxjK1BkNG42RHlUT1dvNWFYM2tvRFJl?=
 =?utf-8?B?VlEzeU1WSGdGaGpDNzFQWHhHeEVraFUxckhRTllEUFFWTllBS2tXUlpCNWdN?=
 =?utf-8?B?aXphRksrTzRsbENiWVFDdHRUamErcG9GWmtjM0NJdWFpOW9hSERKTm92aG5h?=
 =?utf-8?B?KzA3bGpOVGhuQlo5M1g2Mm9JNmRNbkpIVG9BLzFMVUhBNjRqczk3MWpPTlFL?=
 =?utf-8?B?Sm8yQ1lXRlFqMlhBUkhMZFB1NW5tMDR1ZmlBWGdNM0trTjU2WUFxRVp1Z0hw?=
 =?utf-8?B?bm1qZ3EzZHhpMG1IQ29DVnprd3JNUmVaSkFnb2UvRXZFT2w3NThsY242dEUv?=
 =?utf-8?B?WlBHem1SSTZMK21oY2ZOOXpLVlhCcllTY0xFNFJvWGdCOUtwQVN6QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a605ab9-70c2-4f7e-bc31-08de544d7368
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 15:47:56.0404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 47fsRJ6q2AY7hPpSbtKzuM4ofN/5EYso/JpcUV0P15EGhPggT/LBftO8lrbZ7pacGeve//H+nIfgvQxXkYNZA33wa9EJSF7e6UtETWzuChQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6042

On 15/01/2026 3:17 pm, Julian Vetter wrote:
> Currently the CONFIG_REQUIRE_NX prevents booting XEN, if NX is disabled
> in the BIOS. AMD doesn't have a software-accessible MSR to re-enable it,
> so there is nothing we can do. The system is going to die anyway. But on
> Intel NX might just be hidden via IA32_MISC_ENABLE.XD_DISABLE. But the
> function to re-enable it is called after the check + panic in
> efi_arch_cpu. So, this patch removes the early check and moves the
> entire NX handling into a dedicated place.
>
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>

Sorry I didn't get around to doing the prep work I promised.

This is going along the right lines, but there are a few complexities still.

Also you'll want to split the patch into a series.  More on that when
we've sorted out a few other details.

> diff --git a/xen/arch/x86/boot/trampoline.S b/xen/arch/x86/boot/trampoline.S
> index a92e399fbe..8e8d50cbdf 100644
> --- a/xen/arch/x86/boot/trampoline.S
> +++ b/xen/arch/x86/boot/trampoline.S
> @@ -144,10 +144,9 @@ gdt_48:
>  GLOBAL(trampoline_misc_enable_off)
>          .quad   0
>  
> -/* EFER OR-mask for boot paths.  SCE conditional on PV support, NX added when available. */
> +/* EFER OR-mask for boot paths.  SCE conditional on PV support. */

The comment wants to stay as-was.  NX does get added when available.

>  GLOBAL(trampoline_efer)
> -        .long   EFER_LME | (EFER_SCE * IS_ENABLED(CONFIG_PV)) | \
> -                (EFER_NXE * IS_ENABLED(CONFIG_REQUIRE_NX))
> +        .long   EFER_LME | (EFER_SCE * IS_ENABLED(CONFIG_PV))
>  
>  GLOBAL(trampoline_xen_phys_start)
>          .long   0
> diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
> index b01e83a8ed..16f53725ca 100644
> --- a/xen/arch/x86/include/asm/setup.h
> +++ b/xen/arch/x86/include/asm/setup.h
> @@ -70,4 +70,6 @@ extern bool opt_dom0_msr_relaxed;
>  
>  #define max_init_domid (0)
>  
> +void nx_init(void);
> +
>  #endif
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 27c63d1d97..608720b717 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1119,6 +1119,50 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>      return d;
>  }
>  
> +void __init nx_init(void)

This should be static if it's only used in a single file.  However, see
later for doing it a bit differently.

> +{
> +    uint64_t misc_enable;
> +    uint32_t eax, ebx, ecx, edx;
> +
> +    if ( !boot_cpu_has(X86_FEATURE_NX) )
> +    {
> +        /* Intel: try to unhide NX by clearing XD_DISABLE */
> +        cpuid(0, &eax, &ebx, &ecx, &edx);
> +        if ( ebx == X86_VENDOR_INTEL_EBX &&
> +             ecx == X86_VENDOR_INTEL_ECX &&
> +             edx == X86_VENDOR_INTEL_EDX )
> +        {
> +            rdmsrl(MSR_IA32_MISC_ENABLE, misc_enable);
> +            if ( misc_enable & MSR_IA32_MISC_ENABLE_XD_DISABLE )
> +            {
> +                misc_enable &= ~MSR_IA32_MISC_ENABLE_XD_DISABLE;
> +                wrmsrl(MSR_IA32_MISC_ENABLE, misc_enable);
> +
> +                /* Re-read CPUID after having cleared XD_DISABLE */
> +                boot_cpu_data.x86_capability[FEATURESET_e1d] = cpuid_edx(0x80000001U);
> +
> +                /* Adjust misc_enable_off for secondary startup and wakeup code */
> +                bootsym(trampoline_misc_enable_off) |= MSR_IA32_MISC_ENABLE_XD_DISABLE;
> +                printk(KERN_INFO "re-enabled NX (Execute Disable) protection\n");
> +            }
> +        }
> +        /* AMD: nothing we can do - NX must be enabled in BIOS */

The BIOS is only hiding the CPUID bit.  It's not blocking the use of NX.

You want to do a wrmsr_safe() trying to set EFER.NXE, and if it
succeeds, set the NX bit in MSR_K8_EXT_FEATURE_MASK to "unhide" it in
regular CPUID.  This is a little more tricky to arrange because it needs
doing on each CPU, not just the BSP.

> +    }
> +
> +    /* Enable EFER.NXE only if NX is available */
> +    if ( boot_cpu_has(X86_FEATURE_NX) )
> +    {
> +        if ( !(read_efer() & EFER_NXE) )
> +            write_efer(read_efer() | EFER_NXE);
> +
> +        /* Adjust trampoline_efer for secondary startup and wakeup code */
> +        bootsym(trampoline_efer) |= EFER_NXE;
> +    }
> +
> +    if ( IS_ENABLED(CONFIG_REQUIRE_NX) && !boot_cpu_has(X86_FEATURE_NX) )
> +        panic("This build of Xen requires NX support\n");
> +}
> +
>  /* How much of the directmap is prebuilt at compile time. */
>  #define PREBUILT_MAP_LIMIT (1 << L2_PAGETABLE_SHIFT)
>  
> @@ -1159,6 +1203,8 @@ void asmlinkage __init noreturn __start_xen(void)
>      rdmsrl(MSR_EFER, this_cpu(efer));
>      asm volatile ( "mov %%cr4,%0" : "=r" (info->cr4) );
>  
> +    nx_init();
> +
>      /* Enable NMIs.  Our loader (e.g. Tboot) may have left them disabled. */
>      enable_nmis();
>  

This is too early, as can be seen by the need to make a cpuid() call
rather than using boot_cpu_data.

The cleanup I wanted to do was to create/rework early_cpu_init() to get
things in a better order, so the panic() could go at the end here.  The
current split we've got of early/regular CPU init was inherited from
Linux and can be collapsed substantially.

The intel "unlocking" wants to move back into early_init_intel(), along
with intel_unlock_cpuid_leaves().  (This is where it used to live before
REQUIRE_NX was added).

The AMD side probe wants to live in early_amd_init()  (not that there is
one right now), but the re-enabling of the NX bit in CPUID needs to also
be in amd_init() so it gets applied to APs too.

Does this make sense?

~Andrew

