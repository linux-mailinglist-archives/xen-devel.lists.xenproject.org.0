Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59539BB6360
	for <lists+xen-devel@lfdr.de>; Fri, 03 Oct 2025 10:08:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1136359.1472950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4aom-0004Ks-KJ; Fri, 03 Oct 2025 08:07:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1136359.1472950; Fri, 03 Oct 2025 08:07:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4aom-0004Ii-H0; Fri, 03 Oct 2025 08:07:08 +0000
Received: by outflank-mailman (input) for mailman id 1136359;
 Fri, 03 Oct 2025 08:07:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=04fq=4M=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v4aol-0004Ic-7s
 for xen-devel@lists.xenproject.org; Fri, 03 Oct 2025 08:07:07 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1474712-a02f-11f0-9809-7dc792cee155;
 Fri, 03 Oct 2025 10:07:03 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by PH7PR03MB7195.namprd03.prod.outlook.com (2603:10b6:510:244::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Fri, 3 Oct
 2025 08:06:54 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 08:06:54 +0000
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
X-Inumbo-ID: f1474712-a02f-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jhukkVb0wS4WKPxNdhJ1zAbZkmow5nc7Tey9x1j2WOOKXQkcFqfzb96w9pSn35AZnGRfE0H9E/wfk/1OQxwFRz6THX/aGjn71HM9yz0GAHh+gt4bcaJXUHPIAm9Pn5iRrOA47tSrN4+GLUgS4hGzOgQNuYPPk5FrLUfYOFXwV4L7Fc1nrriTGmn95t+xM/vER9lV4P7SOtXa88QCXwmYTEA5HiGB6SpzBH8baD4sdz+GO205IYt6FkYmF/vseMi12eKjcbPfmLjAqKIWOPxu6LmQsLCiGXJE94Xl0XC+CFgC4oyzQe8qbBTlUmV2H7NSjP1vQn1d2jMnPyq00HKMwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2tHetBWDsfgdXeepbRWmC/2wDhCZ8hN30WUMuoeFM1Q=;
 b=wSnrm82KdDQyYK7+YkkL9TXI+ETTQDrZwsC+tjp0PICkE+QqT2z2oib4yoOhbcV75TO2heVyxj+UlPQlK77n0pp+UUJOrQxadyuMq/s9zf+2sOPQuTR0HynNAEEssU+xY/AD+EdRxCFdcZ9xKCVDpwBB1KHaEVlct8tu1FzQ18Xd7Ccx0wbDZ6S9ZiNYNH25D4cB4Gfhrlh7/wbVa22R26w2Bc0iwYh0AjWW/hQ38Q0aLxD/LUJ5BLVLpXI6q38BjlNmBhjz0aTNvmv0KIJIt+0CtITNKPQCOUe4mFmoXZDQIOWwQuJ3gPXBXGaVTAHDEysYxd2DV8tfuooiUQsc4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2tHetBWDsfgdXeepbRWmC/2wDhCZ8hN30WUMuoeFM1Q=;
 b=Ha2d20RBa9u1U/3z/VLyU0Ja/CXwyOF4C3BOi8J5UZZYF9IOVMhvbzyfcve2QwXut/Uke+7tJe3AQP6hqs5R3T+sup2zeg9ahW3mFpkcRtQSoZ5y0gfKH4C8dJylgf5foLqo/J3991wLgjYVcC0goHJqQj1rpk8sk/RjemmeK50=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 3 Oct 2025 10:06:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XTF PATCH v2 2/2] x86: Allow exiting QEMU in TCG/QEMU
Message-ID: <aN-EGpxVJ7roK2gM@Mac.lan>
References: <20251002135542.28076-1-alejandro.garciavallejo@amd.com>
 <20251002135542.28076-3-alejandro.garciavallejo@amd.com>
 <aN6KrO6LPPJFK17M@Mac.lan>
 <DD7X3QFGUK6Y.DTARYWAB2DF@amd.com>
 <aN6cQBwiM36q_75E@Mac.lan>
 <DD80XF7EVPJ9.1WTMKC34DSW65@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DD80XF7EVPJ9.1WTMKC34DSW65@amd.com>
X-ClientProxiedBy: MA2P292CA0029.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::19)
 To DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|PH7PR03MB7195:EE_
X-MS-Office365-Filtering-Correlation-Id: a312d4dd-2f69-4500-e6f2-08de0253d0d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eGdteGk4RTFuUHd6ODZtKzFuVnU1WmJmcEhSUVF0UENxbWxYV1JXTnZiRUJx?=
 =?utf-8?B?TEV3UGNwTUUxd3cvS093VEtWbzZ4QldwVTM4aUk2WWhqVW8vM1p2aUsyQmJB?=
 =?utf-8?B?TzNxN1ZQaEpDRFFHcGx2OVRWb1NLTGRlZTRTREh0Ym92VGJxTHMyN3hDaHRp?=
 =?utf-8?B?amFROVRVQ0dQK3pNUWVndmh1eVp6RjUyQ1lkZG13MUlaNGVmd1RLY1RCZU5i?=
 =?utf-8?B?dEUxMnVLcGZjM2FTa3NWNStSNVBCOEsvaXlBRUVwazV5ZWJOUHdHNTNXZ0Ny?=
 =?utf-8?B?MWFOUi9rQ2k0SFROR1VIeTJMM2d0cE9Ycy9RSGMzR1NiM2F1bHFyVUR1cEhU?=
 =?utf-8?B?d3ErRzh5bGFxRFdEelBHL29xMXZZR1JDUEI0cU5vN0lHRVlaOCtjOWRQNVk4?=
 =?utf-8?B?VWN6dEpocW1mUGtRaHlCOS9DdXk2TUFRb2VNUWtEdFA5bldGZkpoRXFQenh2?=
 =?utf-8?B?ZFA5bzhqMDg3dEpuYmp6cHdUN1lTd045Ry9BU1U4NVBJOHBSRzljYVZBUDBa?=
 =?utf-8?B?M2JLajlsbndvQ3BqNVFJUkNTL2VZOW5XeGdWdzlkUUtaUXVrUy9FSVFCOXBE?=
 =?utf-8?B?TERCRjhFWTFmOVhaSUUxVnV6WVhxeWthVXhaamZLUm40cnNmbTF6UmptNEZN?=
 =?utf-8?B?anhLWHhQZmljckZqRW9WUmZidE9BaWZZY21oMnN4L1NPUFRDeWY4TDZObTVF?=
 =?utf-8?B?UGZ5ZEVkK1JqaHEvT3dsNFJmRCs0SWJ5b041bTI1cXQxdHlVcTd1RzExeGRr?=
 =?utf-8?B?cER0L1BlWU0vV1R1N21JT21KK0JoZjFSUi9jdWU5UjQ2YWFTNXBaRkJ2Vlov?=
 =?utf-8?B?OGdpdjJTTW9Ud25HdzZYL1dLbjhDRGZjQzhQZFhsWXREbXkzRUtGWkxZcDJB?=
 =?utf-8?B?T0hMM2dRYXVnZFRuTUQxZHRNZXRPMHM0MDI4SHF3aEVGRjZ4RTFlU1dPVkxz?=
 =?utf-8?B?RVkrVllyRCtCLzF1QlYwbDJjU2hDNHRUeThLZEh5RTJ3L1cybWtNVHVXbHRH?=
 =?utf-8?B?YUMrWktaRXh3dXJIaUlJaEJmTmdaTmdmVG8vNEtSaGt4ZzdlZEVPTnhBa0dF?=
 =?utf-8?B?ZmtodHdIVW40K1NIRmM1T2VNRGpKRmNRdmFXQnNFRVhZU2tjN0x1S05jbDIw?=
 =?utf-8?B?Y3o0Q3ZZemxQNlFxbmp0NytCOGVMUU1TVnowZWorMWNJQklIaGIraVc5Y3F2?=
 =?utf-8?B?OEs0WExsNjJ1cnBFWUFZNWVJQUcwZlo2UmtCemdxZjhhRnhDVmlScGJvQzhZ?=
 =?utf-8?B?NFZSakFHRnFJYmlvVGFvMEIvSmltZFZNaEltUGxHTkxmU1lTQklxeVpyVnY5?=
 =?utf-8?B?bks2WjNYWlJWc2dxb21nS2RNV3o4RnRPTDBrSXFCNXRuVGdKelRoVWdUYXBM?=
 =?utf-8?B?ZndHVmdBakF0cEpYbVRwdlVGdXZYVVpaTDQvaGN1YmZKTnRmM0tnNkVFU0pI?=
 =?utf-8?B?SVVpZU1STzhyVHVia0N6aUttNElFYVgyUnZOSURlRS9DSHJBUm9NZWpYRjQw?=
 =?utf-8?B?RElHS1lOb2pJQnlHbUNqZkdyUWtsUHkzVWRtWmtWNjRDeDgwOXZneG53WTdD?=
 =?utf-8?B?TExSUmpLV1B1alNOSmNwQlAxTWJiTXhzbGlHTzB2NEFzY283WU82WGVGS08x?=
 =?utf-8?B?cjVuNXFBeHozb3Z0R2ZZOU5VS01DenMzb01aQjFpSzJLS256VzVzNTc1bjhh?=
 =?utf-8?B?dVVmOUdxVDlxNkJUNi9ldXdVcUFvMVcza0o1VHFUOWM2d2NUVnVwMXN6M1c1?=
 =?utf-8?B?MDZLM2tta2oveTdYM1BLNjV5ME9YT0RIY09VdTRjZ0VoeU41REd5S0IvZmNM?=
 =?utf-8?B?SDIxcDRtZFFuUWgvSW5PSFZlL00vQXJ4SUc4ZDNmUzl6YUR6ZEIwalVnZzhY?=
 =?utf-8?B?YW5oMWlORTlnNUdxeFhudW5FemtiRFJkd1NMdzBOaDhNU0xzRU5aT1MwZ2Nk?=
 =?utf-8?Q?W9N7I2u6y345fKx5dWhvblt4ngY0dKwQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1g2MWI5TDlaTFBVUDhKd255Z2FMU2ZvOXR6NSt4djR5LytMWG5OMER6WEo1?=
 =?utf-8?B?c3BRL1RSV1JicFVWR05UNDdaNWY0NkFjQi9ILzE5NUhIVDdnT2VTb1RiekZ1?=
 =?utf-8?B?N0RoT1I1Z2duVzdBUWwxeTV0S052THpMakRFanJXdisrWmJEYlB2OWNzRGQ3?=
 =?utf-8?B?enJHSDZMWHNpT2RtSTVIeVBPZnM5eVA4MjZUaFNXWjB1cTNraFVha0E3dTlJ?=
 =?utf-8?B?NERTb1VWRk9WQ0ZYS3pHM0VVcElxbUpwS0ZDR0NlWW4xL3NqOTQ0N0d5eFF5?=
 =?utf-8?B?M3NYTnRRUnFXdG1hSGZ1MExQRGp6TEE0dm1uQlZhTkNQeHl0QWpYb2JBSUlt?=
 =?utf-8?B?T1J2UTMzV1kraHZBZTB2bWc4bVo3SFVkcGZPL1VhZSs4TDczLzNnNDIrdTFa?=
 =?utf-8?B?ZWF5N2xkT0xyMmhmUTd5aGFocFJQc1pWRlZEcXhNTHhIelo1Z2RNd2JmRG9s?=
 =?utf-8?B?bEZ6U2dPMDdLUkh6VUx1b3plZHR1S2NMaDY4cXp0akdOWVZHUkJjYkhYM2pO?=
 =?utf-8?B?b0s5bGlXTFU3WmpxdDZtZ3FlUHIxV2xYdW1JZThzRm5sd0tUblRHTzZSYXVK?=
 =?utf-8?B?bU9xdW1sUEE1SjBTcUdPVEd0NjFFZ2xKZGxITlBqbnZhSnM5eVFCNVowTW5s?=
 =?utf-8?B?d3ZHS0poRHFBTkoxMnAwSDRpWHJTS3pOUGdFMkpTZytnRVJZdklFa2VraWZR?=
 =?utf-8?B?WDg0ajRSc25sS2V4cFhIY05JVTZ5aTJkVUtiRVR3WmdIaEhhZVRLaWczeWRs?=
 =?utf-8?B?ZjViaURnUnBlNkpjMUNmdGxlaTJVSHRiUm9VcWk2LzV1U3lZNDVvN0hHbE5t?=
 =?utf-8?B?K3k5VHFtNEEwUHowc3NMcG9YUEx2U0lXYWlNdWVmR09JZDZuSHpHYUNuaEQ4?=
 =?utf-8?B?bWI0L2ZvQm4vVXlReHpwVEZ6STdQQWE3eXBZVnJHYklsd3hCR1BjYmJLb2oy?=
 =?utf-8?B?b0hRMjcwVndCWkxzSXRjMFh6eUx5K1dtdjhYenBPd09zcW1leVBORTlKMlNq?=
 =?utf-8?B?WW9Ka0pKbFkzRjgvVHRQdXRGSDlBU25CajdMeGRsZUpHWmlMcHBHY25SK1JL?=
 =?utf-8?B?Q3cyZzFOcjFacWpRYmVsUFBaUWgralJSMER1dHluQlhaTDd1TzNwaGw0c0Fy?=
 =?utf-8?B?UzlNam0vbVRCNEd1NVg1ek9XRE9TME1SN0x6Sm51KzNUSEtaQ3lBL2tMSGpX?=
 =?utf-8?B?dEp3NTRFTXVGRGZsdUQ2WkpPWmlEUzBQNlBSRlkvWHNHVVNJUSt0Ym1RWXAx?=
 =?utf-8?B?OWlQbUVLN29FaTJCUG82VXEwZnFhckhGQkxqZUxlWTEzRXRLOVAycGVoQ2wz?=
 =?utf-8?B?Q3V6bFB3OGc1YTFWVTlyaHgwSnI1Z2N4QTFZaU5tZWljL3JqVVErYXpaYW5x?=
 =?utf-8?B?OGh4TE5oVm1ueS9CcFVtVHBzTTUxYkhzZmtEQ2pnamRBbWExMEQvUGc0U2ls?=
 =?utf-8?B?UXVsUjkyVTlqZ2ZwVGFBUnBrUGVOSEZsSTBIZURjYVZGa1Y2OThUa2EvUXdC?=
 =?utf-8?B?THBFazdXWnZoaDVnUjl0N3orRWNHZzdNVC9ENVpTYmJIaURaQUYzdlg1Tjd2?=
 =?utf-8?B?TEM4Y2NBUUpKTlBSQ3k2NWhQZzZQeUdrd28vTGhMcWpJSkYzcUp1TTYzb2hm?=
 =?utf-8?B?cmtEY3F4V09HaTRpTHJYZGZvb3dnRTYvWFpCaWFncXZVaVAwKzRBcHFYR21a?=
 =?utf-8?B?czhxTG16NFJ5REhyQW9qeis0VXQ2UjR6TDRIa0w0dEJFNERuZ0tOQldWdVNE?=
 =?utf-8?B?TjhNOHRMOEh2T2x0Vmt5RU1jSGJZRkZpV1VIME5WaFcyZHVZeVhaUUlaaVlJ?=
 =?utf-8?B?UTZEUmd0RnhSYU9wVlJDc2orNzRrQlB3WFBxKyt3YzNQZURYMnRSRmtybkti?=
 =?utf-8?B?QWxXMzdQOVJ5Z0lpRndpd2g0TmhoUUpzL0tUWDlQaDlvVG43YmVaOFZwbmlS?=
 =?utf-8?B?THplczY4cTNVOUxZVFpYWVZ2Y3JTU3pKY1A0UmI2MGF1YmdVUmdJd0JmNjZS?=
 =?utf-8?B?QU5OUStKemJ2TVBhYWMva3dZbWtSVE03dFcwem03Zi9iUXZoUHk2aXZ0SWdD?=
 =?utf-8?B?SmVQSTk3T0g4UG96blVyTXkwYVltNTRQSTBiYmJ6OGt6S3Uvb2xJZjdZdGxx?=
 =?utf-8?Q?4J6NJmvJmldI3VF4vYtBwS10L?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a312d4dd-2f69-4500-e6f2-08de0253d0d2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 08:06:54.6923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /7aqEOGNBSqzkLgb0RHBDoGUxBVpN95x1mT1clV8oNpKhOfpPjBAqHmiAqbXUy9QecQ/Ex7OCtiylAyNcVwlfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7195

On Thu, Oct 02, 2025 at 07:48:28PM +0200, Alejandro Vallejo wrote:
> On Thu Oct 2, 2025 at 5:37 PM CEST, Roger Pau Monné wrote:
> > On Thu, Oct 02, 2025 at 04:48:38PM +0200, Alejandro Vallejo wrote:
> >> On Thu Oct 2, 2025 at 4:22 PM CEST, Roger Pau Monné wrote:
> >> > On Thu, Oct 02, 2025 at 03:55:34PM +0200, Alejandro Vallejo wrote:
> >> >> If QEMU has a debug isa-debug-exit device, we can simply write to it
> >> >> to exit rather than spinning after a failed hypercall.
> >> >> 
> >> >> While at it, reorder an out-of-order include.
> >> >> 
> >> >> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> >> >> ---
> >> >>  arch/x86/hvm/traps.c    | 16 +++++++++++++++-
> >> >>  arch/x86/pv/traps.c     |  5 +++++
> >> >>  common/lib.c            |  2 +-
> >> >>  common/report.c         |  8 +++++---
> >> >>  include/xtf/framework.h |  3 +++
> >> >>  5 files changed, 29 insertions(+), 5 deletions(-)
> >> >> 
> >> >> diff --git a/arch/x86/hvm/traps.c b/arch/x86/hvm/traps.c
> >> >> index ad7b8cb..b8c4d0c 100644
> >> >> --- a/arch/x86/hvm/traps.c
> >> >> +++ b/arch/x86/hvm/traps.c
> >> >> @@ -1,5 +1,6 @@
> >> >> -#include <xtf/traps.h>
> >> >> +#include <xtf/hypercall.h>
> >> >>  #include <xtf/lib.h>
> >> >> +#include <xtf/traps.h>
> >> >>  
> >> >>  #include <arch/idt.h>
> >> >>  #include <arch/lib.h>
> >> >> @@ -139,6 +140,19 @@ void arch_init_traps(void)
> >> >>                 virt_to_gfn(__end_user_bss));
> >> >>  }
> >> >>  
> >> >> +void arch_shutdown(unsigned int reason)
> >> >> +{
> >> >> +    hypercall_shutdown(reason);
> >> >
> >> > This relies on the hypercall page being poised with `ret`, which is
> >> > IMO fragile.  I would rather have it poisoned with `int3` and prevent
> >> > such stray accesses in the first place.
> >> 
> >> I dont' mind caching Xen presence somewhere, but that involves some code motion
> >> from setup.c, which I wanted to avoid.
> >
> > I think it's very likely that at some point we will need to cache this?
> >
> > enum {
> >     NATIVE,
> >     XEN,
> >     QEMU,
> >     ...
> > } hypervisor_env;
> >
> > Or similar.
> 
> Maybe NATIVE, XEN_VIRT and NON_XEN_VIRT? I see no reason to distinguish between
> TCG, KVM and any other accelerator; and QEMU is imprecise because we use for
> HVM. You could imagine chainloading XTF from GRUB to test the HVM env.

Maybe not for XTF.  IIRC KVM also offers some PV interfaces (like the
PV timer) that native QEMU doesn't.

Rather than having an exclusive hypervisor mode, we could signal what
interfaces are available.  For example Xen (and I bet KVM too) can
expose native interfaces plus viridian extensions, in which case we
might want to detect both if present.  That would require using a
separate boolean for each extra interface.  IOW:

bool xen_hypercall;
bool viridian_foo;
bool qemu_debug;
...

(Possibly not the best naming)

BTW, is it possible for a guest to discover whether the
"isa-debug-exit" functionality is present?

Sorry, I'm possibly derailing this patch series.

Regards, Roger.

