Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C31DCCCF017
	for <lists+xen-devel@lfdr.de>; Fri, 19 Dec 2025 09:40:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190517.1510948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWW1Q-0003Kf-OC; Fri, 19 Dec 2025 08:39:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190517.1510948; Fri, 19 Dec 2025 08:39:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWW1Q-0003Hq-LK; Fri, 19 Dec 2025 08:39:36 +0000
Received: by outflank-mailman (input) for mailman id 1190517;
 Fri, 19 Dec 2025 08:39:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AmMB=6Z=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vWW1P-0003Hk-6c
 for xen-devel@lists.xenproject.org; Fri, 19 Dec 2025 08:39:35 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b7aa3a1-dcb6-11f0-9cce-f158ae23cfc8;
 Fri, 19 Dec 2025 09:39:30 +0100 (CET)
Received: from DS1PR03MB7871.namprd03.prod.outlook.com (2603:10b6:8:21f::17)
 by DS0PR03MB7558.namprd03.prod.outlook.com (2603:10b6:8:203::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 08:39:27 +0000
Received: from DS1PR03MB7871.namprd03.prod.outlook.com
 ([fe80::3a7e:e6ed:f8e9:9fb3]) by DS1PR03MB7871.namprd03.prod.outlook.com
 ([fe80::3a7e:e6ed:f8e9:9fb3%7]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 08:39:27 +0000
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
X-Inumbo-ID: 3b7aa3a1-dcb6-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UY6fd6HKLvPbA2IEMP2rac2NimvePbrh339mRXaG8jWiQ8HkTSvGoTK6lz5cVaUw7kbtqzhgtEfSQjXAMAkTqbxEhh5iSeB9MAFOiwVvO0PluHPiJ5s//vFZJwxMWS0C32Y04jYfBvngAFKKd8LmnqNri5dVoL0UfUL8pJdn7koH5x8+fVZDxxfL50yR1CBZpyuJsEJiqGVvhJO3JvxHk3SqzklenwdasWRBlqHClt5yyqMrbzwz1f2GhJX0qj35SxxQzwm/4ta6KG6It0+1p/kzCdu7S5pNDCaXTeBRyQGrmYfj4soyUjMT/RV0szIfTpZVKsTJz69xzotRWzgyDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nttFXQbSlQ1Iff1JrG+NhVueOixxo87lvR7g0e53h9g=;
 b=ShkhvgAJBxwac7pjerrk2j1oAjqgpTji56uejA3mjlggze6J3yy4zifzn0UNJeVqu/MWQXe7XIp+YTDXqLYx5hP/AWoyIeACcdJDrlgA7noZqDvJIvEpz1rDfB9j1kKtr0FytqkOgcwgLKYkdIakCUJZZTd700UudOJIgrMd79nGrTesn9B304jBB+rxRZebfPUW+6eHiLuhVPSIq3mTBgEtK7PW3O/e0qk21hV8wfOGoMPnuut8CNVQz3lLXs8z0bVETQDLbx/vYeo1oRMkAwm8prwLD55rr5tlxnVlfQML32kwoNQxOUWziaGEOFLig7QKgEzcnOSWaBbjKAXEvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nttFXQbSlQ1Iff1JrG+NhVueOixxo87lvR7g0e53h9g=;
 b=wqt2ViEa6uMfJZ+bzd/n7g7NQhUGrBAAdi1GB+ylzCCgzpsjIlLdTqs9BeYdgWvVVgcWX1bpYlbr/T6g0VEFZ2YtGeDpmAydW/XKZkTOiw0x2OVVDW4hzAtrTXEf1517+KD1up+YMoz8VkHk9i9adJK/X/qxrPq6o0X02OYO+EE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 19 Dec 2025 09:39:24 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Chen Jiqian <Jiqian.Chen@amd.com>
Subject: Re: [PATCH] vPCI: avoid bogus "overlap in extended cap list" warnings
Message-ID: <aUUPPPYyuLUdj3XJ@Mac.lan>
References: <26294a6d-e99b-4290-988a-da7b7b838651@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <26294a6d-e99b-4290-988a-da7b7b838651@suse.com>
X-ClientProxiedBy: BL1PR13CA0429.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::14) To DS1PR03MB7871.namprd03.prod.outlook.com
 (2603:10b6:8:21f::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PR03MB7871:EE_|DS0PR03MB7558:EE_
X-MS-Office365-Filtering-Correlation-Id: 2658ff60-b04b-461b-105b-08de3eda1ea0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QksyTE5sVzZTOFZtREt4endIQUZoZnZGbDhLUjBsZ2lkc2hKMG5tYW9SNExK?=
 =?utf-8?B?dnVIa2ZBSlhtY08wN2NVYTdiMkZSTEhsMkVKd05GQWhvMGVrTjNpazhjUGZC?=
 =?utf-8?B?b2pLZjR0Z3JxZThjUTJmUkRYVDZMQU40ZG9oelFyem5EVTlUMzRhMFlKRG1N?=
 =?utf-8?B?V1pNeTJqZDJGdDFxZUp6WUxtdXJkVUVVZ3JzYVRzcThCbFZWdk04T1lmaU8r?=
 =?utf-8?B?VCtBUUQwU2dqNHJyT0djeHgxSG5RNTdkcEltS2t5aCtObnVxZUdLTkVIaENh?=
 =?utf-8?B?d0sxZFMwRW13MWhTeVBtakNRZVlpeUZIMy91aitrOWZVS1E4WXUvZnJpOEs2?=
 =?utf-8?B?TGg3TWVLZzZsWm5hNEhhTk9MZkd3SVJrY3lnd09kQ1RKUVVEMk1Cd251VGhu?=
 =?utf-8?B?bTVCN29CZnFQbjk1aG8rUkRMS3F1SThMQ3ZuRGZLZ3lEc1VIT2d4aSs3TlR5?=
 =?utf-8?B?YUVrS1poanRXZEpycHJ5azZEUXVrZWhBTU5rZTJxUXhlR0F1czIxb2x6elow?=
 =?utf-8?B?RE9NQ2lRdFVSUFNOZmdHUUVsSkZsUlkzY0xqMlp3ZTdYU01tdzBCUm56dFdU?=
 =?utf-8?B?STR6UVlLVTc4U3pwb0JlSUU2d1pUbW1sQWIzbXhDcHpXa2VkN1hhTENGRWVx?=
 =?utf-8?B?ZG9nd0VLOFpyaW5FYnE0cEZQdWhnRU9EQmFZbUxwdWFFeWY1Y2FndFVLdHNE?=
 =?utf-8?B?aGZiNTl4N3drenV3OTVXRHhTVHJPV2RzdjBrcEo0TTVSOW8rRFZBbnlKUlFZ?=
 =?utf-8?B?cjljSmpDZTBERGlhME1JNEFHTDVlQnFaeHlaZ2NSTU0vNnpqME1telBjVTZq?=
 =?utf-8?B?VHB6NGZUUmhvSk1kb3lLNmlWTTltYzRBNWM3T3RncEk4Y3JyZFZTSVJoMEJN?=
 =?utf-8?B?RHQwOHA3NUNhcXByMGp3aklxVWVlU0pwYWtCNGsvYmhrRXE5dXlQWFpIOUVE?=
 =?utf-8?B?ZVlYZzdYZVNRNEYwQUp1a0NseHlGL2xHS0owSytDWUhHMEwvejF4YjBUR2xR?=
 =?utf-8?B?WHBQVDA5MktRYlRZZFJsSWxjb1dZSzhpUExtM2lHSFVXQlF2WVlidnl1RHhV?=
 =?utf-8?B?aXUybU5Tbml2YU5nVURwVUgyeEV1ZmhiVHF0SGFxVUxmbE00R2h0WloxOGYx?=
 =?utf-8?B?b2cvT3Z5V0kvbEZ6VVdrMGRaVzZ2Slp4T1VuOU4rRGltTEdVbXIxWGZHT0F5?=
 =?utf-8?B?SGVCSllncCtsVEt2Y0dIOXQ3amVhd0k1Q0o5SWNxR241R3ZxV09Obm5FUGR3?=
 =?utf-8?B?MSs3TkhZLzBSaVRSNk9pem8ybUd1MEM4dS9Va2lJYi9XcnpLa3AydFJxZXho?=
 =?utf-8?B?OFg5RHpZa2IxYm53QTNocFI5L0wyM0NxMWQ1VXQwQmVkblFlVzcxeXNQUHpP?=
 =?utf-8?B?eCtMV3g4dk1hUjhWVkh6S1FES3NMcFFkdzJDcGtNQldPT0U4b0FtdWM0eEph?=
 =?utf-8?B?V21VaXVPMk1BRzU3a1BGa2NxL3YzSi9qV2NYdWZ0eGFCZEZXRTkxSzljQzJn?=
 =?utf-8?B?NXRmSTRGZjZkQUMwM1JlSnc2Y2VkUWtadUZxdDNoQmxoTkFRckhwbU9YTTJm?=
 =?utf-8?B?QVpVV00vMVhYbHBhd1c5R3pDQWNqeDFoelNJdHE2T3JXaktIKzNMV09jUlha?=
 =?utf-8?B?WU50M29rQmtKRDQ3dG9kck9kKzJQeDNYbG40bEN2NUI2YWlZMzI5SXJtenVa?=
 =?utf-8?B?TGh0WEw4TytLQWlGZk00RFdLc0todkFnemM2L3Bta0lQaVBQb1dDdWFYallJ?=
 =?utf-8?B?Q2xCMUJtSkpRa3I5YW9FclF6VURqNmtzSVlUUFVUUndiYTk1ZHVyTEJrK3Fx?=
 =?utf-8?B?a1ZuYW5Dc0dNSFBYVUhhUjh4T3d0V2x2VTUxc2VTQTB0MWwrL0IxQmdQSGdk?=
 =?utf-8?B?N3FOV25ELzBidkQvNDZSNnFmbmxNSXVuKzJKTGJRWXlHTVlnRkxCNXlkMVo4?=
 =?utf-8?Q?KJnAE7U1Y1Kh8wf3lwVLSOfMMvcYMtbb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS1PR03MB7871.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1JsdHEvSkoxNWJoN0RUN0dzaGFzUWZSZGlIVnJaVFdWSW5PNFJkUTZQKzNz?=
 =?utf-8?B?ckZLU01yV2FuaXIzaXArMVRyazFiQ3BUdlJZRW01TWJ3UGVrSHo5eGNqQTVK?=
 =?utf-8?B?VWlVdVRZeVM1YlJCb2JSYVQ0UXMzdyt3RjJYWUp5ZlBLTGQ1aHAvTENDSkhi?=
 =?utf-8?B?TitqWXdaMk13Rk41U0NWTDdsb3p4TjQ2bGdvWUdIa0xKMDhwZmR3V3lMSWRn?=
 =?utf-8?B?aHlwUU8zVWQ1b3d6Q0dNNktBYzNlZ3l1ZXJxQUZEUGEwMUxuVm1CRHIzUUpv?=
 =?utf-8?B?MHFDUnk0YmdLdVZrbVFkR04welI0TnZGTGM4M0JZN0UvQ0IzZjZmSmd5ZTBp?=
 =?utf-8?B?VXZpTCtLRkMvU3RnOEltTFVEUm5kUkxFNmpoTUFvUTVkTjFadXlac1IvdDB1?=
 =?utf-8?B?UFRCRkxhclowNWs3QkJheXJxeWpqMlZyU1lSVDRpS0lwSnk3VlBXWU9TTlhs?=
 =?utf-8?B?TTJaN0tPMkNVd0J3TVFvUHVWK0QvYmhHcGJQTnJmNk9INUYvVkhnQjhGb0xG?=
 =?utf-8?B?OWt4amxVaGtjV09YYlZwb1NEY2t4U1VQQjVhd2VzLzgxMS9hWEVUUlQrMUli?=
 =?utf-8?B?ZHpCTlJiQWUydlVVY3FmRktKYTQ3MnB4YlAyeENWZ0J2RzhVaCsvOEZIU1cy?=
 =?utf-8?B?MmNXV0tadkxqM3dxbklnY1ltQzBWY2RWZlQ5b0hjc0lNYUN4SytJYUxHZ1k4?=
 =?utf-8?B?OGwyZ0ZSRHlTZ2s5MGV3RkZNd2pOak95OGZVbmt2M2gzNWowaW4ySkRXa1Bh?=
 =?utf-8?B?WTNydnVhY2Z0VlVHNEs2Q2YxeUhndk9iMnE1OVNYRVYxbldPNWc5akFCckow?=
 =?utf-8?B?QWFzd25TOXRBbTAvUDBubzlqVnBjQVMwSEh4VWFrVXBNNWp1OUZKaW0vanZm?=
 =?utf-8?B?KzJkNGdzYkloU3d0d1dzNjlHWS94Rzcybmc3QnpJb2FhbkFFSnJkRmRZQlVI?=
 =?utf-8?B?eTMxWm0rNjZ5cndJeXZ4aXU5OWl6NHN5dGZDQ0diSkpDZ1dFMzZiaEMrS0Fn?=
 =?utf-8?B?a3hvR1ZuR2FOYXhGZTdkdnR0YXlWczJlQmd4UWdvNC95a04vUitpM0lnUGNQ?=
 =?utf-8?B?b0ZFeTBkT3BaSHZwUnVFWU1tamFrb01WWjFBRmdnemNpU1BFTGpVRWM5UWNx?=
 =?utf-8?B?UFNDdFpCM1BXMThhRHJoMm5LR2lBWTNJTDZHa3RGVmZtR1ZJUWJabWFHN0xs?=
 =?utf-8?B?VXQzRndoOUVOUzhjZ1ZzWmN0TCtaVys2NnNleEplZ0tNNHgvY1lOWEJoL3By?=
 =?utf-8?B?anQyM0VBbE9ycFl5ZDVTOXhBOFVLZUdMQ2QvbXd5K1E5VEc2dWl0azRmZEVC?=
 =?utf-8?B?NDdqMWZSY1dDN2FMRmI0cTNrWmY2Wk9mVVllT2VHWENDdnAwNThDODRDQUQ5?=
 =?utf-8?B?RGtGK1ZsVUxLVGNob0pqNHJhdjJ5Zm1GdHdycldyamtWODRQRTkvcm11cGdI?=
 =?utf-8?B?dUtKUndKdFpKUHdLOXhtOXJCVGNFVnZCdnZSUGJ4dVZTUy9SZDFVNml1WGFr?=
 =?utf-8?B?cFJxYzFEU3RKM2EzYkVyQ0dNdC9DdFovd3J3SjBVRUxmTERWbCtNQVU5ZWdJ?=
 =?utf-8?B?R1JWSmh2NTJGcUcvajBEc0RLR2hjNmE5QTlYRzlDWVkrb1JSUTBEenhjYnFn?=
 =?utf-8?B?Z0VTWm1rcVNsL0ZZdDI2akY0T1pMcjk5WlQvcE5yYkQ4aVY2SnErODhWYmw5?=
 =?utf-8?B?bDB5cDc0WmpVTmkvUXQ2YnViQzBsRDhHS1JjREhkZDZ0cWs1cE9rMzRwK1Jp?=
 =?utf-8?B?ZGZycG9GRm56UWR2YnBtVUcvWXk1c3JqQWdCd3JpSElZZkkxMzVQVzI1QTV0?=
 =?utf-8?B?L3hpd1E3amVsa2UvbXdqdG1jWlU5OEpXTXJPWDFqYWg0Z0R4TkVFb1VFVGRv?=
 =?utf-8?B?TDA2QnZkb0krV3lMci8wTitIMTVwdGZ6ZmdWanlDeHhwWG9vMG9IZjhBK2NX?=
 =?utf-8?B?bEhVZFlCSkVjVDdJMHZ5V0J1NGZoc1hjVHBlRGlRcFk4ZHdGSktYemtmWVpW?=
 =?utf-8?B?Q0lIOVJPRWpPeHczdDJ1SFI0MStNaStPUVpiSk50KzB1N0dHSit4TXhFekx2?=
 =?utf-8?B?MzRtWXI4OVg2QzQwaGY1aWxpZzQ1aUdFdlRlVEIxWFJ3TkhTNEhuRVJsckNs?=
 =?utf-8?B?MnhGWDd3SkI1UmlkWVl0dTEyUk5rVnJENlc0UG5SU1hSNDBNOUp6T3BvQ3RS?=
 =?utf-8?B?RVpaRkZGTCt1NW5GN09YOHhXMWthemNKelZXVm5HODZUVU9zc2gzRENpblFv?=
 =?utf-8?B?cW4yU0trcFRCYTBUZHNiRm5FZU5zaHQwZC9jejRPMVJsalBSYWtWS2w0dTl5?=
 =?utf-8?B?QkxOaUR5WS9Vb1ZXSE9ZODNOUmFsRjlKYUFDV3BTV0Z5WkJaOUJyQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2658ff60-b04b-461b-105b-08de3eda1ea0
X-MS-Exchange-CrossTenant-AuthSource: DS1PR03MB7871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 08:39:27.1866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7/xqRChLz1M7fqRMYU62ePDNsYPjC06FgCN5k/kLab/DZGlsiREcPQyIbCPG0IMsazOOMKw51u6Uyf32QCMh8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7558

On Thu, Dec 18, 2025 at 08:56:24AM +0100, Jan Beulich wrote:
> Legacy PCI devices don't have any extended config space. Reading any part
> thereof may very well return all ones. That then necessarily means we
> would think we found a "loop", when there simply is nothing.
> 
> Fixes: a845b50c12f3 ("vpci/header: Emulate extended capability list for dom0")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

With the U suffix added to the constant, as noted by Stewart.

> ---
> This is the minimalistic change to get rid of "overlap in extended cap
> list" warnings I'm observing. We may want to avoid any attempt to access
> extended config space when there is none - see Linux'es
> pci_cfg_space_size() and it helper pci_cfg_space_size_ext(). This would
> then also avoid us interpreting as an extended cap list what isn't one at
> all (some legacy PCI devices don't decode register address bits 9-11, some
> return other non-0, non-all-ones data). Including the risk of reading a
> register with read side effects. Thoughts?

I think that's likely too much - for the hardware domain we want to
allow the domain to access all the PCI config space, regardless of
Xen's thinking there's nothing there.

> The DomU part of the function worries me as well. Rather than making it
> "read 0, write ignore" for just the first 32 bits, shouldn't we make it so
> for the entire extended config space, and shouldn't we also make it "read
> all ones, write ignore" when there is no extended config space in the
> first place (then in particular also for the first 32 bits)?

If there's no explicitly handler added, the behavior for domU will
already be to drop writes, and return reads as all 1s, which is fine
for the rest of the extended config space?  We just need to return 0
for the first 32bits to avoid seeming to have extended capability
support.

Maybe we want to keep the same behavior as expected from native for
legacy devices and just return all 1s consistency for the extended
space?

Hence we don't need to special case this region, as it's already
covered by how unhandled accesses are resolved for domUs.

Or is there something else I'm missing?

> Should we perhaps also log a warning if we exit the loop with non-zero
> "pos"?

Possibly?  The spec says no next capability must be signaled by 00,
returning any other value below the extended space is a bug in the
device, but I have no idea whether that would be a common bug, and
whether things would get too noisy.

Thanks, Roger.

