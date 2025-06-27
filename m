Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C387AEB63A
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jun 2025 13:24:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1027539.1402165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV7BQ-0000jQ-KX; Fri, 27 Jun 2025 11:23:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1027539.1402165; Fri, 27 Jun 2025 11:23:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV7BQ-0000gd-G7; Fri, 27 Jun 2025 11:23:52 +0000
Received: by outflank-mailman (input) for mailman id 1027539;
 Fri, 27 Jun 2025 11:23:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tiom=ZK=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uV7BN-0000gX-TR
 for xen-devel@lists.xenproject.org; Fri, 27 Jun 2025 11:23:50 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2405::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e25e031-5349-11f0-b894-0df219b8e170;
 Fri, 27 Jun 2025 13:23:43 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DS2PR12MB9687.namprd12.prod.outlook.com (2603:10b6:8:27b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Fri, 27 Jun
 2025 11:23:40 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8857.026; Fri, 27 Jun 2025
 11:23:39 +0000
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
X-Inumbo-ID: 2e25e031-5349-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RKGNHJAuXKX0NI/yq/Gah7/WINvTaYQ/R0nAqdzilBSigibbCJT9gu1KPw89V4+8+QWsHG6XK/l+rfcKKccpQhnoHWeK704PCGOOi0B4eCpxAa9JNfVr9mDVa6y07m3ekq8mJZ38wI/VBGP1cuacIoFxlktkiozG/4NZfM2vAZ6AT5EW8Sn0xxhVSMF/pUADNI4sfcT8cu80//RneA92gGQT2hkvhlV5EXkcqer/pbKg+gyVE4Xkt4Qxx5hYIPxwDAo3snC08FtqyC4QqT5kbVxtskRLn5tqiVLlS54Am4fFkjwabiZ/zLiCh7Hoi0zm6EnitlAcZLimh6EeDKsyPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IWolXwCXDNgqHv5el06xfZsvUUmU6+9JZ7OoOgw+zyc=;
 b=wJ+qg0fe4K8tyz1qswAJzLgkXnRm1hOufZDGhUgb28qvzBF+d5tk//A17Mf6D4hgCIMvvCEH4NPYtXmLr7ViV3EBB37PKVBPa+w76uyXpKJxTP5b3gOWms4C3tIbrKGh/h8kNkI9Nz+eA1lRStsgKD6MypNeaWpsN5TNrvO6diBXaj/NCrbB4W1LbX92TJ1x878X4dMnSsbKFRU8VTdeB0cOXLV7DzAOnJtahMzDaCiannAPSLL6upY70zk9knIXedTPwYwOnAiYDZiuSP6ggSgO6NvYxpnW/MPYa9fosLLxyPFqvwSMru4bL6IjfA4DniHqocQcebwu6Duj8qy8KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IWolXwCXDNgqHv5el06xfZsvUUmU6+9JZ7OoOgw+zyc=;
 b=ajkBjV7thEeLJv4wNF5bhjpyhURkXTAIWdBOL1Cp48pg5WGePlg2fKebTcT8KTdMmfzNKuhLUUh3ksbjWRQxxhi3dhM4INFQjMeP+aK2WUe9uhFJ+Pu9TFvif41NVbEhihPY3ZGFSjhEeQnKsgT1T8/m0NgtgrXu+nF+whzfmGM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <bdbf558e-c574-47b9-86fa-b9e54a759f9d@amd.com>
Date: Fri, 27 Jun 2025 13:23:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] arm/mpu: Find MPU region by range
To: Hari Limaye <hari.limaye@arm.com>, xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1750411205.git.hari.limaye@arm.com>
 <e4d628ea02af087c4a299de0b16c75a9e0c6c17f.1750411205.git.hari.limaye@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <e4d628ea02af087c4a299de0b16c75a9e0c6c17f.1750411205.git.hari.limaye@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0097.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::12) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DS2PR12MB9687:EE_
X-MS-Office365-Filtering-Correlation-Id: be3be1d3-1bd3-434d-2db4-08ddb56d10ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c3lkbEdtWXBuWWp2QnNHeFVMdTNzdXg0cHVjYiszTk1uN3JUdVdQNS95a0Iz?=
 =?utf-8?B?NkhBeExWMmRTZ1hGYy9LNDZhcmlVNXlUWWUxWWk4dEpmMHFqbHRPeXR1WGV6?=
 =?utf-8?B?TU16RHJ2UG9FMExSSkZmVGs4NkcyMXRIVW12TU1HMGM5RWFqd093b1FmamRJ?=
 =?utf-8?B?V0wrL25wVitEL21IZVZzaHIwRDhvWHBrUVZ5MDBVRzRzdlBLMkNNa0tqWkE4?=
 =?utf-8?B?RWlqamtZQUZ0Ni9xbVVGR3l6M0wwcXdieGVrZmYyMVpqeEF5cmJJZTRrdFlZ?=
 =?utf-8?B?SGdFVldyWG9HeEYzWmVCQzJFWFZIZi94TFpnZWdHRFFhR0p3eFpHTllFc3Z0?=
 =?utf-8?B?Ris3YldUdit1bWY3cXJ1YlA4NzBheVAzYXJoTXlZQjFpeG5zOFVoY3hHVDcv?=
 =?utf-8?B?b1RuK3laeU5aZithSnA1WlF6a0Z0SXZDa3VFaTRMcmdJbFk0Tlcza0NWaE5z?=
 =?utf-8?B?cjhSL25BMXVKQnFJUklWL045bmZUTFhiQ2NDZHBhYkxUR0wrZ0x4bkNiN21Y?=
 =?utf-8?B?OGdJMVAwczVaTWhxajZkemtrWVNSbjFYOGxvV0t5TDhBUHU1Tnk3OCtZaGV4?=
 =?utf-8?B?SXJQSGR5RzF5RDJlaWhQTlJHVnNQV2R5cURsVEVnYnhwN2tNRWpGL29nVnJP?=
 =?utf-8?B?N3VKKzcxUTVRbmM5REIyUGF1UFdqanY2Z3FsWEhoUEJpVSt2eVgrTFFjSTF5?=
 =?utf-8?B?MlZ0S0tRSmx1WHJnYTAxYVpYaUNIOVh3WGRYR1pmc0FsUElNVHA2WExGZmJ0?=
 =?utf-8?B?NkpNME52dTNDeWtydExzdEdJTFFTMUYrMzUrK0dOeXFjcGNSaWczUlBLSlVi?=
 =?utf-8?B?NVB6VDJQSHpWNHlxaUprUy9oOWlBQUFzS1ZiYUJ6VEFMZHY3bEg3THJLTlMw?=
 =?utf-8?B?NmM3ck1vRGZUeUo0M3RjK1l3a2lMdFpFYkllMEJFRzJCUHV1dVd4TjdBbXl0?=
 =?utf-8?B?aVhnbU5RZ2JEdEREclpvdDk2YnA3OTBnQnlHV1IzVVhuOWJVcWRZOUVOcWVy?=
 =?utf-8?B?TUZ0OUMrM2FGOWxxNXMwckxRSFdPTlZZZWhtQjhYQ0pSREZNR2oyeHozclZG?=
 =?utf-8?B?NDNMMnZmUlVxbW54VThyVTZ0OTlrc25tbFdpN0d4aUpqSWRaeEJVbDZNSzNh?=
 =?utf-8?B?UWd6SytGK1hpYTNvNWdveWdpdS9QOG45R25RSjNidm1mNGhmd3Bpa3dUWDRu?=
 =?utf-8?B?OHJpUmZkVG04T0pUZUU2TVZTbXRDOVg2L0Z0Q0I0dXRpYzI3OGovb1haUU1C?=
 =?utf-8?B?b3pJS3oxM0t5cFBqS3I3ci9Qc2QrNWNURmhod1R2blJsNU5DYVRJVE5YWDFE?=
 =?utf-8?B?d1RkKzhiNEhlUEdUYVlndWhsSWpxbCs0QmhPUkh1cXFjNWhESzE5cGczYWJU?=
 =?utf-8?B?SXNjdWR6RnpxSGtmQ1FhWXlnNzBCdk9xQUdNUVVwRDBoRFZWNmw1Q1ZwVThr?=
 =?utf-8?B?OUJxT3c4WWVMeWRKK0EydXdWYm9hMFFCQXFYZ2xnZUh5L3hYeWwwb284eUN4?=
 =?utf-8?B?T1ZJeU4vazNSU3QyMDlxNnM4Z0NqL3hxaVJsS2lOWndXSFNnWUpTd3pSSHVC?=
 =?utf-8?B?cG80NmlBOVkzOTl4ZTlnOG1CTXhNYU1QV0YyVnp4Zm0vUE1BTzM1ZGRzcExV?=
 =?utf-8?B?SmRERnZjaTExZlk3YkZVaXJBTmFXWmhtNndlamxVcnhKSldJY1lEOUllOGxP?=
 =?utf-8?B?aVdvakowQlRUMkpOblJ2OFRVZnJSVno2Um41SUJGdWdOQ2lGR3R4WmhkOTlM?=
 =?utf-8?B?TjhYOU51WjhtSi9IRHNpNndIK3dYaVIydzJzaU5wMHI2cFp4S3ErQnFQMWwv?=
 =?utf-8?B?VzRrbEJMMXJMVG5yazRFUE96M094WTRtMEIzZkNBSWJUS1Iyd2hZa285WHRz?=
 =?utf-8?B?NXl2bmtwcVBZdmdWQmZzSG5wUGNHMTkvamJIRzNUdDFPRkRQK0hIK2Uray81?=
 =?utf-8?Q?1a+X+AnbATo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWI5MEFjN1cvdXZ6c1Z1ZDA5TjIvWTZmQzF2ZjR0Y3JmZWNxV1RsTW1VTXdC?=
 =?utf-8?B?anB4WjFCTTNqZ3BxWWx2emQ4NkpVU2p1NTdUZ1N4YXdRSE8ra2k5SEdIdWJT?=
 =?utf-8?B?L2ErV1VJTXZMRktRbFFkZG5xMC84NENzdmpPeW5rYTU5ZWxIQ2dKL2dxRWRz?=
 =?utf-8?B?V3Q4cStyUWhwUWZNUnBJMVIyUzE4Wm0wYzVzME8veit6Ym5CQW9EVDFyazdZ?=
 =?utf-8?B?WEYvQ00rSk9ZejRjK2tGOHEzaU8ySEE0a2JtTjc1UlRJbFBMRnBvUFlrTGhq?=
 =?utf-8?B?bGpRUGc3TWYxMnRmVzE2cUl1V1pjMFRtdTNWMDRjSGdmL3VrRmFBS2F2SjMw?=
 =?utf-8?B?QVg0YVppRHdhU3JFbXRKTFdHNVh1ckUyMDF0RE5IRmZmVFVqYWxkcEJFK3g5?=
 =?utf-8?B?WWt5ckc0RXl3Mk5jcWJ6eVJ5cEdzWTBYNE9YaFl1Y3BBY0w0YnlDRks4M1kr?=
 =?utf-8?B?dTdXRE5DVWh4QzI3S2FSNUlBT0dDU3Yzdm94MlltRnBIV0dDMjdFQWpXZ3Nq?=
 =?utf-8?B?cHpyNGVRK3M2cnZuaHFZdzZlcmxjclBYVEpTWG1kUGhOdEVkSWRXamR1UjhB?=
 =?utf-8?B?dEczc1pKMnh3czhDQWpTQStvNmU2elJyNTd0MVRZcXdQWCtMTkQrNzRxaFNo?=
 =?utf-8?B?MUY4bytxSHU4TW5VeEg1VWt1Q3pFdy9teENUMGpBbzdrTkpWM2xEaVA3ZjFx?=
 =?utf-8?B?OW8wZ2dpSWttS3V1Qis1bFVqdzZkZGVReTJvK1pnb0dMSENtb3pGZ0NHK05o?=
 =?utf-8?B?anNJSkJxQ1dmNC91OUI0aGFkSHJpR0w0VzJjTlp2WHRpYXlrYkxhN0czUVJp?=
 =?utf-8?B?RVRBRkRDaGFNTjF5UmRXbnAvWldKRmkxUEpBMXBRRzFmVHJBbnhLcG5lWmxv?=
 =?utf-8?B?S3F1UHNTS2ErWWV3MDJyNkpsQlFuTVBlcHpBa0luRXZhNzBLSEJ1OTh6WjRR?=
 =?utf-8?B?RUlNamNYQzNEdWFRbU5ZRmREMUhJd3cvT3YwbXlPcWhwQjQ2Tlc5aHVXZk0v?=
 =?utf-8?B?TXcxWmVXNHkzMDVQRndnNGoxSHg3eWpob1o4VW1lN0ovZ0lUdkRnNUh1T0lU?=
 =?utf-8?B?aUVNWG00dWFXQ0FpWlNCNTE2a1UwNWsrcm5DOXRSSTRyeXFJNHptaG5xeVBQ?=
 =?utf-8?B?WTBvQldBRVcvWUFHRElNdWYyOWkzelEvaDVzUFE1L3BEV3hPTHFmYUJtSnBh?=
 =?utf-8?B?Z3FLN0N1QnF2bDJ4T25oYnBtMmdzTHNqN3JjRkMrMEZjdFhKKzA5Y2NDVkQ2?=
 =?utf-8?B?eVN1dFNnSDlIb2hnbkUwSWJrdFhjbkhQbE9NVWRnTm5ZNnU3aG9oak5CM3E2?=
 =?utf-8?B?T0JSc0NYVk1TR3F5aHJYbjk4YUVEZ3d0Q1YzWTZ6NGVqU3haWjBHSm5WZmxu?=
 =?utf-8?B?U3RVaUhLQU4wRW11c3BsSUVkK2grckx1cXRtSkxQaERKZHlNQk9UeGRaaVhn?=
 =?utf-8?B?cVlHL2NFSmlFdVVBWExtNlpGSUxWUHQzVTJmTjFHSTk4djJBNjNDdjZxZEJ3?=
 =?utf-8?B?K0dKYlFPZHcwQ0dzak5qUFlsVEE2SzZqemp3cGdtWWFTM29uZlU0QnZOdnVR?=
 =?utf-8?B?Q0hYSXdIZXNRWEErUFNHdjQ3amF5ZHB2aEVGamRhSi94aWllSkU0ZnpCWUZq?=
 =?utf-8?B?TTBoMUdjamk0blhrbGhkbEM1ZWtKM2M1WUdBdTBWaTJvUzlQSzYydFZkaFQw?=
 =?utf-8?B?aVpJMTY2YjcvU2s0eU1JWkg2bEhTbjlYVW1jTkdxU21yS0czUkgzaEw2ZWtm?=
 =?utf-8?B?eUd6aFpERkJwUW5hYU1RbXFyQXU3MWh4VjcvR25YSUwxSGxNR0hZMS9oMG5y?=
 =?utf-8?B?YVhSeVVnT09XL0lYSVYwOWZ4bzlSN2FvcWQ0MU1vNGJNOGN3bnY5V0lITko3?=
 =?utf-8?B?QldDQnlQbUMzMzg2em1Bb2J3eExPMlJ2R2o2RzdCVWlPZ0xYWVBhRFY1NGll?=
 =?utf-8?B?TzAvWVc2YTR2Zm9saVRpaGRGU3UxaGlSdUp4Y1BSL1ZDK2Zwa2dzL2Q0a1Uz?=
 =?utf-8?B?R2oyOENEM2tWSGNiNFJFeUJHcHh2KzZlK3FLZnUyS0xrS2U3cHBwSFdIMXk5?=
 =?utf-8?B?Ykwvb1dMdUF1Ynl0eFZsTVpzbTVac0VBbk4rM1dJUlk3V0RqM0FQY2NNY1l0?=
 =?utf-8?Q?U0pl7ACOfFr0/E6Ml0+spDw6o?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be3be1d3-1bd3-434d-2db4-08ddb56d10ac
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 11:23:39.4488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZwytfK1Qe1IML4rDCPgTWyLzI1n3mDEUhRPiD84+ZgP0lDQXnCX6NQF/SKDc7PMh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9687



On 20/06/2025 11:49, Hari Limaye wrote:
> From: Luca Fancellu <luca.fancellu@arm.com>
> 
> Implement a function to find the index of a MPU region
> in the xen_mpumap MPU region array.
The commit msg should also mention why a change is needed.

> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
> ---
>  xen/arch/arm/include/asm/mpu/mm.h | 29 ++++++++++++++
>  xen/arch/arm/mpu/mm.c             | 66 +++++++++++++++++++++++++++++++
>  2 files changed, 95 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
> index a7f970b465..a0f0d86d4a 100644
> --- a/xen/arch/arm/include/asm/mpu/mm.h
> +++ b/xen/arch/arm/include/asm/mpu/mm.h
> @@ -10,6 +10,13 @@
>  #include <asm/mm.h>
>  #include <asm/mpu.h>
>  
> +#define MPUMAP_REGION_OVERLAP      -1
> +#define MPUMAP_REGION_NOTFOUND      0
> +#define MPUMAP_REGION_FOUND         1
> +#define MPUMAP_REGION_INCLUSIVE     2
> +
> +#define INVALID_REGION_IDX     0xFFU
> +
>  extern struct page_info *frame_table;
>  
>  extern uint8_t max_mpu_regions;
> @@ -75,6 +82,28 @@ void write_protection_region(const pr_t *pr_write, uint8_t sel);
>   */
>  pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags);
>  
> +/*
> + * Checks whether a given memory range is present in the provided table of
> + * MPU protection regions.
> + *
> + * @param table         Array of pr_t protection regions.
> + * @param r_regions     Number of elements in `table`.
NIT: in other places you refer to already mentioned parameters using #param and
not `param`.

> + * @param base          Start of the memory region to be checked (inclusive).
> + * @param limit         End of the memory region to be checked (exclusive).
> + * @param index         Set to the index of the region if an exact or inclusive
> + *                      match is found, and INVALID_REGION otherwise.
> + * @return: Return code indicating the result of the search:
> + *          MPUMAP_REGION_NOTFOUND: no part of the range is present in #table
> + *          MPUMAP_REGION_FOUND: found an exact match in #table
> + *          MPUMAP_REGION_INCLUSIVE: found an inclusive match in #table
> + *          MPUMAP_REGION_OVERLAP: found an overlap with a mapping in #table
> + *
> + * Note: make sure that the range [#base, #limit) refers to the half-open
> + * interval inclusive of #base and exclusive of #limit.
What does half-open interval mean?

> + */
> +int mpumap_contain_region(pr_t *table, uint8_t nr_regions, paddr_t base,
NIT: mpumap is a table (singular), so it should be s/contain/contains

> +                          paddr_t limit, uint8_t *index);
> +
>  #endif /* __ARM_MPU_MM_H__ */
>  
>  /*
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index ccfb37a67b..15197339b1 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -12,6 +12,18 @@
>  #include <asm/page.h>
>  #include <asm/sysregs.h>
>  
> +#ifdef NDEBUG
> +static inline void __attribute__ ((__format__ (__printf__, 1, 2)))
> +region_printk(const char *fmt, ...) {}
> +#else /* !NDEBUG */
> +#define region_printk(fmt, args...)         \
> +    do                                      \
> +    {                                       \
> +        dprintk(XENLOG_ERR, fmt, ## args);  \
> +        WARN();                             \
> +    } while (0)
> +#endif /* NDEBUG */
> +
>  struct page_info *frame_table;
>  
>  /* Maximum number of supported MPU memory regions by the EL2 MPU. */
> @@ -110,6 +122,60 @@ pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags)
>      return region;
>  }
>  
> +int mpumap_contain_region(pr_t *table, uint8_t nr_regions, paddr_t base,
> +                          paddr_t limit, uint8_t *index)
> +{
> +    uint8_t i = 0, _index;
Why underscore? I don't know what MISRA thinks of this but looks similar to
reserve identifiers and I don't think there is a need to use it here.

> +
> +    /* Allow index to be NULL */
> +    index = index ? index : &_index;
If index argument is NULL, why bother setting this internal variable _index?

> +
> +    /* Inside mpumap_contain_region check for inclusive range */
What does this comment supposed to mean (we are already in this function)

> +    limit = limit - 1;
> +
> +    *index = INVALID_REGION_IDX;
> +
> +    if ( limit < base )
> +    {
> +        region_printk("Base address 0x%"PRIpaddr" must be smaller than limit address 0x%"PRIpaddr"\n",
Why not normal printk? I think it's important to see such message.

Also %# is preferred over 0x%

> +                      base, limit);
> +        return -EINVAL;
> +    }
> +
> +    for ( ; i < nr_regions; i++ )
> +    {
> +        paddr_t iter_base = pr_get_base(&table[i]);
> +        paddr_t iter_limit = pr_get_limit(&table[i]);
> +
> +        /* Found an exact valid match */
> +        if ( (iter_base == base) && (iter_limit == limit) &&
> +             region_is_valid(&table[i]) )
I think the check for valid region should be first. No need for other two if
region is invalid. Also, shouldn't we check for region being valid right at the
start of the loop?

> +        {
> +            *index = i;
> +            return MPUMAP_REGION_FOUND;
> +        }
> +
> +        /* No overlapping */
> +        if ( (iter_limit < base) || (iter_base > limit) )
> +            continue;
> +
> +        /* Inclusive and valid */
> +        if ( (base >= iter_base) && (limit <= iter_limit) &&
> +             region_is_valid(&table[i]) )
> +        {
> +            *index = i;
> +            return MPUMAP_REGION_INCLUSIVE;
> +        }
> +
> +        /* Overlap */
> +        region_printk("Range 0x%"PRIpaddr" - 0x%"PRIpaddr" overlaps with the existing region 0x%"PRIpaddr" - 0x%"PRIpaddr"\n",
> +                      base, limit + 1, iter_base, iter_limit + 1);
> +        return MPUMAP_REGION_OVERLAP;
> +    }
> +
> +    return MPUMAP_REGION_NOTFOUND;
> +}
> +
>  void __init setup_mm(void)
>  {
>      BUG_ON("unimplemented");

~Michal


