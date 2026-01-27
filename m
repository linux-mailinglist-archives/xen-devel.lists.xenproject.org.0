Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIYfJf/XeGmUtgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 16:21:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB10F9693F
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 16:21:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214941.1525184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkksZ-0004v3-L5; Tue, 27 Jan 2026 15:21:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214941.1525184; Tue, 27 Jan 2026 15:21:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkksZ-0004t2-Hd; Tue, 27 Jan 2026 15:21:19 +0000
Received: by outflank-mailman (input) for mailman id 1214941;
 Tue, 27 Jan 2026 15:21:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nvRA=AA=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vkksY-0004sw-Uy
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 15:21:18 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2d30deb-fb93-11f0-b15f-2bf370ae4941;
 Tue, 27 Jan 2026 16:21:17 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BY5PR03MB5155.namprd03.prod.outlook.com (2603:10b6:a03:218::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 15:21:14 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 15:21:14 +0000
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
X-Inumbo-ID: d2d30deb-fb93-11f0-b15f-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rWDvmlk2nhCd49yUH4QnlaEIyNDtWXYJqrhawT5zb82Hejq70sAYGbz/UskoWHfVX0aQhG8rFe2VQHUNo7fPSYRm7vWm0E1gz3BCVnb+gGc5buW5NgsIeWNiZo4gizH8Kp7bxFKwqIIc9KeUJ2wSDYhS09eWIKkJ5RIkeH6JlXDDtkDTUQUIxW6O8MMBMqPTKdrM56pahk/dt9SFCE1mn5GLOUrIhaOnabzKzKrgQiUn/1HQBjFRtSrgW3Ue95w4/RkKSWUYrJmj8FiedWbrOFfIRJo6N390Db9HVWF4o3m8S4dE7ip7aCjCfLPvY0rdBzNpkpNeDFpV6yBlVMgloA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KA25xpM37iGByW9ODy+xmsSdDAuqUKFkBJE4w3MW0Ns=;
 b=CFRiFg3kl5/mGWfb/yXNxgf078RnfO/2Q8PUYKYBA1hSlfvM2KlcvdLYeVRmiKDJozMs4QgTJc+hgJrGylQNVmjBWPvno2qhXx2J2kFeye8PmDX2PPK4tRk6uFAfhrGHxDqSErCHfEVCds1Dx8LiTHKokhqE2dERYttG2+gJK+TCksxePV1Ty0pOD+RlMmN7VoTZJkKPtHA5Ht3D/cakerh/4eRkAMg3EDnEzGQWhpEqsaKdNuSDQ3xyMg6or7wQU+aa7ZD2ryeO8eIx/jpk2rzXYbTTYQ+XaybAAEjtA35kh0s3RNqqBTvJ40agvAFIi+7Nr22ELO8yS6kuxkRlTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KA25xpM37iGByW9ODy+xmsSdDAuqUKFkBJE4w3MW0Ns=;
 b=DII6PjFAmKzSdNKtJ8InbY4ED3rIR+iMvHOwxyfUK+0+uV0y6FcBl190oPbnUWLp1Q/W9m3WFiPlhsplMqcyJhW1dGmX4t80cI+BYNoAfV7/94zudaC6zffwWRxayVY6Y0eKP86PIxrBnEk1W7zJn0wrSa/TpMYGPA7Fi2NEP74=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f6896a1e-4b25-4197-98f2-889a62c3038c@citrix.com>
Date: Tue, 27 Jan 2026 15:21:10 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julian Vetter <julian.vetter@vates.tech>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 09/16] x86/intel: Always check MSR_MISC_ENABLE on all CPUs
To: Jan Beulich <jbeulich@suse.com>
References: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
 <20260126175345.2078371-10-andrew.cooper3@citrix.com>
 <e7036c68-6009-4c44-bbc8-1cf92dab718b@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <e7036c68-6009-4c44-bbc8-1cf92dab718b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0265.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BY5PR03MB5155:EE_
X-MS-Office365-Filtering-Correlation-Id: d6569e7f-25f5-4820-b8b8-08de5db7b574
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V0tlVk85bTMzNVpDSnd0a1JGRzJKWkkxMDN0V2lKWUhEZVQ1Q0FmQkoxR2tp?=
 =?utf-8?B?SmJ6UW1heG44TmtPQmxZM2JuS2ducEtqclUwQkZQUWp2TXlhQjVUNndFNStU?=
 =?utf-8?B?dHg2WVZPTEtHZ0hzYngvMmM2a0JRWUIvSTB3bXpJbEhTVTZ1NDl4cHRLcE5S?=
 =?utf-8?B?MFEyS3U4aFhxMVgrbmF0N2wyMWJ2RllzYnZlRWNaL1hTWmlLWHBtQjQzV0s2?=
 =?utf-8?B?WGZmbUcxNCsrbmo2RkZ5SEk1cVM5Tk5wM1pjdzV5UzhBc3ZKNDA4cVN6cUZP?=
 =?utf-8?B?R29PbHpBa0svZkJUa2RwcGVlU2VaR0QrcTQ5c3N0Z2o1TEdrNTE2ZVFPUHh4?=
 =?utf-8?B?bmREZlRkOXhWUmdrQVJMS0FkSXhDUlhUV0pRem8rYndQeG1oZUtqL2JlZ3c2?=
 =?utf-8?B?aUQvM1BlVWpSM2VNZ2RTc0RxUm5rT2NPS2hpSHNNRS80clJUNkMzQnNuRzRv?=
 =?utf-8?B?MnRHV1F5TzRHZHgxVDNGQ0xBOUFtOW9pVldMc2srYnBGRzU3NTUxNXUzbVQx?=
 =?utf-8?B?OUxMcFVKeVh5SVo3WFJpQTloYWNEd2s3STUwSmt2Tmcxa3pqU3N1MVhOY0xB?=
 =?utf-8?B?dXY0ZG5vMVVtMTFYdjErMjJYdFlZZUhRRHdXMm8vY3VyMTZNa1FGK2lpSW1C?=
 =?utf-8?B?WHJVTzlRREtMdXNEMW5FMnlNaHlxMm91ZFpEdUFoSWNPTFZxcTcwTmpIaS9m?=
 =?utf-8?B?UUJ6dUhiSHU3MFNneEVsVTMraFQrL3l0Tkc2dzRiVHZCVVVlSk51cEpFdHRw?=
 =?utf-8?B?UUtMbmZ0aFJYcFJrVEJaWEdOTVZSanVuL0M1ZzFMOWQxN1drS2twRzc5dnNY?=
 =?utf-8?B?ZnpDS0ZlWDdJQjBUZHJGSE0yUjNKaG5FVGpUOVg5ZmQ2ckRGMWdoN3JNL2tq?=
 =?utf-8?B?UXBuYlF3TEZKTzZCSzVMcFc5dVVXWk9PNkxOSU45eEovSG9PenVLYUpLc1Nh?=
 =?utf-8?B?eTAxQklqQTRzMHVhaSs2UE9UMjNkazZhbkxOV3NQWGs3OUI3Um9Dd3QvTits?=
 =?utf-8?B?WTFITExkbHZ6WndMaGg0dEdhUHA5eWxvb2ZHaW43RXVFdkVzMHJITjdQOTNX?=
 =?utf-8?B?anlxcGlramxkUk5EZkFpNUkvbTF1bmQrOS9XT3VmYXlJVjhWS2N2Tndvc3RM?=
 =?utf-8?B?b292SkR1dXFUZUJaeWJvakVtemJieFVyN3VQdll2UHhWNGF6SWQxSGpObGJL?=
 =?utf-8?B?SnBESTNhL1RnRExVN0k4ak1NbFFQMU1WSnlTQ1lLeHhFYlBYQXhlbmJrTklj?=
 =?utf-8?B?aWhJMFd0Q2s5bFR2SzBhS1lFL21WK0RIYmg3TVpBcHVyREtnbFMxM1Q3djVQ?=
 =?utf-8?B?U2JablRPYnUweThFYmdzQ1FtSHptN1FHbjJIWnFicHhNTVZJUGZlZ2tqUkE3?=
 =?utf-8?B?Qm9YL0tsR25OeENINnN1SlRXY2tBcGtDQVZaaG1WUThqVEVlZjNGNjI2NDkz?=
 =?utf-8?B?L2VxNHFld1gxNDQvMlA1RU9GMWZIUUVLVWdkUmNIT1o0N3VKK1Z5KzFOQjUy?=
 =?utf-8?B?dm42L2pHTUNUeGtqOU5RQWdjb0RMZkpQbFVtdjNFSEFRVkNRZkJobll2YnIy?=
 =?utf-8?B?clRsN2dFZ1J6dXZwWDlMcnlEWHVvOFdHVFA5TUdZQ2JvUE1UQVo4K0FjSkN0?=
 =?utf-8?B?RDRmVlJYS2kyQWFRQlEvZDc1dEhzNjE0YUVBQ0Fsa0lJWmkxT2JmVzY0U0hK?=
 =?utf-8?B?MEZ1Y0dvZDMva0RiWlJIODdIUUZwbHluNlVqaHVxdmdGQm1COHNQSmVZN1B1?=
 =?utf-8?B?a3hib1phRGl2UyszMHZxMVhUalIzbjFBQnNaOUFaOVJEZ09Qdy9Udzg4TVpT?=
 =?utf-8?B?QWJjRVVNZHkzZkIySGFseDNhNExkZFJKelZXaExldG5LbjhaYU1tRm15Um41?=
 =?utf-8?B?b3Y4eWRobTJSNzFNb0tpYmJVY2JCMTRQOEVUZWVtVTg5ZGJPcTlqS0pMSDlO?=
 =?utf-8?B?T1FTVENrRXJicERsZWpSY1JFazNuTWRLZnVhWTVXL2gyUTBLcjRGZ1NrdXdu?=
 =?utf-8?B?RDVBS2V1dWxaN0VDN3VQTnlsRG1NZXhkeFBSMEFta3F3UHAyellIeVBCYUc4?=
 =?utf-8?B?WVRqd0d0TU90SmcrZHF6T1BRRVpCajBvN0RrNStiU0pIdVIvYzhJS2R4NVpU?=
 =?utf-8?Q?lwfA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1UvTk5kdFo3Y1FyUnR0Q096Yi92NVprZ3o4aXVCU3NoaTVENXduYUpkZitC?=
 =?utf-8?B?cFdRN0t2WWFsSG1nOThUeUdTZVJDRFhmVGJEMVFXaDJyaUpaWFZpcnV1Tlow?=
 =?utf-8?B?NlBwTTQzcEQrYm9QRFRvN2x0dzIyMVJGRHdjU2ZLTlJmTE5XZkJiMGRxdi91?=
 =?utf-8?B?VU9UUFJpNEY3RHNPbFpUY1JVUHc0MUxERjFUQnd1S3RXNVByRHBSb0thTWZ0?=
 =?utf-8?B?Y0ltVG1yNmY3alk2MDcwaG9iem1nSjdTUHBkai9IUEdWUjlLdzhFbUYySVVm?=
 =?utf-8?B?NzVaNVlEZDV1aWRmYWRNRXk2RGpka1BuMjVaTE1JZGUzMkMzc0IwM1g3QUp3?=
 =?utf-8?B?cWVVUHNtdXRkUUZUZWhBamthYVNqZzFlRktsa0lveTBYZllDQWJqSGlKRWFJ?=
 =?utf-8?B?U3hJV1Z1VVpycjBXRk5VUkx2ZGVZdG9MRkxTRlF2WWtIMDZ1M29XNmFKdVFZ?=
 =?utf-8?B?V2g0UnBvU0xtUkM3SzZzTndNN2E5YW9NRFE2M2xyT0hmRWVZQzFvMGI1c2Ra?=
 =?utf-8?B?RHNVRjRHU1VEZ2RtdnJPbVdTZnFBTFgrLzUvRlJoUDMvRmNpeXYweHFHUDh3?=
 =?utf-8?B?dU9DRmh1SDQ4aVJkZDE0dWtsVmkrb2dqR1UrcTdvZGNoWVN0SElQTitCa3lS?=
 =?utf-8?B?RzhQZUpzMy84VXo3bk1jYkpJRW5xanhDQVl5dndqbCt5NFBqNGxXYmRnUWl1?=
 =?utf-8?B?MExlMnRUODFqV0piU1ZYQ044ZjBKSDc4djVzNlVpNDVnSjdPOVpLY2hPcXhL?=
 =?utf-8?B?K3AxQTJWQjZua0k4SkRNNVJwQWtYOVpKa1NpeEc3aGplTWVHUG00WXd4TlFu?=
 =?utf-8?B?UzZrMGdMQUd5Y3BYOHMrTUVNYktKOFJGRHJDdXpjdEpZZjBJemprOXE2czlB?=
 =?utf-8?B?N3hxcE1KdEtQT1hENjZxdisyMHFWeTkwMEVPVzNvZ0N2S2VGc1RIb1B4T3Vj?=
 =?utf-8?B?b2lDZUp0YTdMVHIvNDUzMVYvZDQxbHJnUVp4Y3g1RllsbnFsQW01VVFjN21R?=
 =?utf-8?B?R28xcU1pTVhwMXZzMTJUNnA2WEdrK3hZZ1ZaZHlXQythdE42Myt5M1dBVE9H?=
 =?utf-8?B?TmhKU3NvaE1qMEpaWTRXYWlwZFlBdW5OMzgzNkpMSnNjaE1ObmV5MWRYNFRY?=
 =?utf-8?B?dU0rZER4UlRoY2FDbjFBbWlDTk5CYjVNQ3VvRXdqekFURHJLZllQeXd4Ymx5?=
 =?utf-8?B?bUIrMFdUN2RVWmt1RzhJN3hGRmdad0swY3p1cTBmL1RGKzlmOGNJcVp0ZWRC?=
 =?utf-8?B?NnNZbHo4MjhmNVJEWTR4bUNnMkkrbk5KZmNJY2FZZGN2TExRaTBMdWFSREY0?=
 =?utf-8?B?Y2xnV25WNGdXaEsvN1JCTlFXQU5qNTEydmxFQVp1Z0hOQUV0K21sb29scEVH?=
 =?utf-8?B?dFM1ODhHVjJWWUNCN01WYURDWmt0bUovSk00bHNreVMzOTJHVWNKUzFLaS9H?=
 =?utf-8?B?YmJ0R3JzOFBJL0FMN2R3VVNwRGpXamJySWxCSW5ENjBKOEhRUkRSVi90OXZV?=
 =?utf-8?B?Rk42SElnalpBeThQMW4xMGtEM2pzalNnVEJQTFRIajcvT203ak9YaDFKNFpp?=
 =?utf-8?B?SDdqZGpUemJPY0VTOFhxQis4ZG53MHhrSU1zUWJZRUhNMk84bnowVEx6OTg2?=
 =?utf-8?B?ZXpxTk5zbGFVV09acGMrYnNSQ2I1UDFlUDJEVUVyYW8rNmxZQzFweWZSYlFp?=
 =?utf-8?B?cG10cjdLN05ZRjdOSExrTEFzdm9JWmhlQUNWT1lPSHZiNUVGK1plN1JlQWUr?=
 =?utf-8?B?a21XM1dUQ2tKSlBtcGhmZzJnMXBMMmxYVDVYd25VajlOSURublkwSU5jOWEr?=
 =?utf-8?B?QUNIai9MVU9MNVlxajlhcE5pQURHR2NBRW9vSjhUM0tHVVREei9LRE9PRjIy?=
 =?utf-8?B?U3J1N2xadDk5UE9WSy9ybng5WUlsWkFmQzFxUjFlMEdabTQrek1veWNqendK?=
 =?utf-8?B?dHZJbXJpTWt6b2xodW80UGUvQXU5a3Y1TngyQS9Vd0Q2RVBiSDFPQ2pkbFlP?=
 =?utf-8?B?YXpubSt5bGNNZ21JZWJhSHMveXoxK1lMLzhPK25MeVJ2QjNBMXlSVTFtZFEv?=
 =?utf-8?B?MWJvMzZ6VndTSFQvemNwNGplMU1rSW5qNGRYa20ydjVWQTFEVzJ5SUJPZnhX?=
 =?utf-8?B?UjEwYjhDcllwYlNqbWNUcVI4MENqY2VBQ1c0Uk96aS8vUTNaUWpsMytac2ti?=
 =?utf-8?B?OEVDdmJIOHRod0ZHeEV0V3pSWmZCVisvZk5kNFRVTGtNU0xRZi9UTjdISlFQ?=
 =?utf-8?B?ODc2M0Y1Mkh5dFQrM3Zoc1gxU2NNZ2U0ZnpVZElqNk1scjNGcm1iK2hVbmVr?=
 =?utf-8?B?WEJkNUsyT21OWGxTc0cveXBpUmRhSDI5RTVVdlh6VDdxRklYL2M3dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6569e7f-25f5-4820-b8b8-08de5db7b574
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 15:21:13.9408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HqSebTRHa/O9qepqd6a4zLkPHBJlP1e8kAnK6Qh5ZpzDtFBXfkn1s9pG/q97tx/EPpfFwopAcEwbtQRdEKA5AI9Znndx4d+0x1pQ/25DHlI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5155
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:julian.vetter@vates.tech,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: EB10F9693F
X-Rspamd-Action: no action

On 27/01/2026 3:18 pm, Jan Beulich wrote:
> On 26.01.2026 18:53, Andrew Cooper wrote:
>> Currently, the BSP only leaves instructions for the APs to adjust
>> MSR_MISC_ENABLE if the BSP is found to need adjustments.  Particularly if
>> XD_DISABLE is needed on an AP but not the BSP, the system will triple fault
>> with no information provided to the user.
>>
>> Rework the BSP and trampoline logic to always read MISC_ENABLE, and clear
>> CPUID_LIMIT and XD_DISABLE if either are set.
>>
>> Repurpose intel_unlock_cpuid_leaves() to be intel_check_misc_enable() and make
>> it static in common.c.
> Being able to make it static is of course nice. But moving Intel-only code
> out of intel.c isn't. Personally I'd favor it staying in intel.c.

Alejandro's DCE work will cause this to be eliminated in !INTEL builds.

It's slightly ugly, but it's less ugly than having 3 separate hooks.

~Andrew

