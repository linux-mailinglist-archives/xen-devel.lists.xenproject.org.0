Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F93AFE2D0
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 10:37:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037894.1410397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZQJM-0002RG-K0; Wed, 09 Jul 2025 08:37:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037894.1410397; Wed, 09 Jul 2025 08:37:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZQJM-0002Ph-Gk; Wed, 09 Jul 2025 08:37:52 +0000
Received: by outflank-mailman (input) for mailman id 1037894;
 Wed, 09 Jul 2025 08:37:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=42hY=ZW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uZQJK-0002PZ-KS
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 08:37:50 +0000
Received: from outbound.mail.protection.outlook.com
 (mail-sn1nam02on20630.outbound.protection.outlook.com
 [2a01:111:f403:2406::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc101e49-5c9f-11f0-a317-13f23c93f187;
 Wed, 09 Jul 2025 10:37:46 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DM4PR12MB7765.namprd12.prod.outlook.com (2603:10b6:8:113::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Wed, 9 Jul
 2025 08:37:41 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 08:37:41 +0000
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
X-Inumbo-ID: fc101e49-5c9f-11f0-a317-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bq68NcJCL0csx7MANB13+5TRSoNbHddpsGvT8hXr+lis+NOLR14/erVe4dRWW2Sk1n3RV+vsnoeUc65c+IMHv6enxLtNR4b8SjpRY4c7TmcYrKioAvOX+YycODN+0ojmi/jenmK9GXqqZb9IJLZMGGR/hdlU7DXJTii4btJEiA7YMU34U/FpshDZHiJyOUwSP3VhfdGmmI6KQAUHtoRVzmuc47PmRI+DULKEWyfrbk3V5WtBypi1WMAGAFI5Fs4cKdhqw+/5oBWCGNt8ig3HIBi0zaF/3YVYnU2gaCisri7XUD009zhs1HbUaqmxPyX6gFCTkgqk7uEs28/qM8j70Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=puUVD09YFPTxmCbI0jYZ0EqnQO/T3V3D9xwYQiiOJF4=;
 b=F0VM4wfAshFRXV2ADDTGMq9eYnd3fGwRXx0jnSbjIaJOWz7xwimJFIZagBsmDpqY+3bfnlM6zUi5iKjikCsFWTKmnY4hRVmtCgIn5Xml9joz/HlRgCM1v/faxrUXTcUdFfIVVydLh5IViFDDOYjtb474Xp16a+ivY3fpXb9zMYCo/fEVKzFlISq09ikrNi1dnqBiD+dcxcRgS5VFVz3BcN4cTghuCIfqJ2Uo9b4rbEeAZgtBncH9uHMjpTDO1SkGaY75GmjdHFmb8dtrtr+NddNd96laLcArth8AAHFObCMkJyPbR3O+LxX5UN08xNTJxHOd6yJFDjsW9M/ICbeFRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=puUVD09YFPTxmCbI0jYZ0EqnQO/T3V3D9xwYQiiOJF4=;
 b=mqRikZQ1Bf/rdamvXLvjgPLrTOpxQ7LwdgTppvexaJOEOQTZVE0+NPy0a6httHzslMhjYZ+n6d9ufG+n0NDXRDebWeUmPElpOCd6FqGD8rREO62dK8GfAhyr4WaYaZ7BFhOROn/dZpmVYOj0VpalODEAaMRReJQ/cgfNivlvrOg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <05651a9b-de9e-4062-bb60-08d6153f20a4@amd.com>
Date: Wed, 9 Jul 2025 10:37:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm/mpu: Implement remove_early_mappings for MPU
 systems
To: Hari Limaye <hari.limaye@arm.com>, xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <cover.1751464757.git.hari.limaye@arm.com>
 <540b3b9ea598a63b31ffe4165bd791d4b8151863.1751464757.git.hari.limaye@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <540b3b9ea598a63b31ffe4165bd791d4b8151863.1751464757.git.hari.limaye@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0017.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::27)
 To BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DM4PR12MB7765:EE_
X-MS-Office365-Filtering-Correlation-Id: b9b4fa28-c7fe-483e-2bae-08ddbec3de29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aEZYVXRRajUvRTd2YU4rSDhwUEJBV1RERFhjeUZiS1lTd3I1WlQ0c2FRVUU4?=
 =?utf-8?B?R3k2dUVLaW9rNGs5dUdDSlltajU4SkpvYnNBeFFDcExBdmVOSnVjL3ZVekEr?=
 =?utf-8?B?ZERJMGtVRGNaajBKTEpubEEvUHQ1d09WcldEVmhXV1M2SFp3SnFXS2tuL2Ju?=
 =?utf-8?B?SE1mRitFR1hrcTIxRjhJTHZOeU1mUHREelRtNkI1NW5tU0hVMXF5akVUcysz?=
 =?utf-8?B?SjZEbmQrakZwRXNvcklzOGJpdHFtQ2p0eFkxSUZRRk9mMHFjUEdZZTNYcWtX?=
 =?utf-8?B?REgwNXdoZ0NKaVpTemI0SmhCdk5nZDBtTEc1REdpaWhSTHBZQ1ZXbW56ODE0?=
 =?utf-8?B?SXVGS2hpcDVMdVQyTTlRL2hQNEtRa09hZmFqc09jWVZNWVpiNW9OSnVSc3BP?=
 =?utf-8?B?ZEt2ZjJrcVR2NmtSWktieDlxOWdhaGZLa29iY0F5OFFweDJ6TTJVYlBsbjRJ?=
 =?utf-8?B?aUlldGduK0dxVWhiSTNKd0l2WXlVb0N2RCtxWlE4c09Db29rNHh4bVA0S1Np?=
 =?utf-8?B?NUdjbzZrSFd6bHVkNGg0NnE4MmpkOGlQdlhtRmpRaTJIMmtpQ3VIMVpYWXJ0?=
 =?utf-8?B?ZCtMdGhYYk10Q1RockppTmhXcVFEY0Z0eDZhTlE5NTh3eU5obHBvZ2RaUHhx?=
 =?utf-8?B?RndSSTUrWTBuM3kycUtKeTJvMUNVWFJuUkhOd1pUY2RQYm1QcklySXREeWd5?=
 =?utf-8?B?aWg4MzVDR0EyREwvSFFvYzRyWlRUTWNqTVBhdktCVEZtQ0VHMVdpRHlxV2t4?=
 =?utf-8?B?TVpzdkxiMmRhVndwTEt2T09nRHMvbnN0WTBmVkMxQmZUVnErUUY1aXhwMXV6?=
 =?utf-8?B?eWtOTFlocUNMK0oxZHZ3YjRETlRONDUrUUV3QlBFSS9mT1ZWUll4V3E1T2l6?=
 =?utf-8?B?bWtCRS9zNys1M2tnK3pPbloxWU5saklYTmJRK3NWR1Q4dTVVREt5bnBEMGo0?=
 =?utf-8?B?TW9nOFdicEJQNThzaTFvUFVrckhSQXl6bWhIVEszT0g2SEpUVHNuak83bUVO?=
 =?utf-8?B?TlJYbnZVTElnTUJMdEY1ZFdNZjlNRDFoaGNvTDBrcDNEUUtSeldldzFyUXVK?=
 =?utf-8?B?SG1wMEowTUZGNmxFQmpLZlQzOEJaTVNPMWkraE9MQlhIRHNQNDJ5VzkyOVVX?=
 =?utf-8?B?NmNHTkJlbWU1WkZneng3dkcrRUxOelVqZDlLRGdvblNUTVBrQ1VXVDFDWnVJ?=
 =?utf-8?B?MHphbkZmVGlBSjJJUDdMZ3FvYTJ6NEI0YUxJOUNCYzdqcXhTRFYxa3JvWUQ1?=
 =?utf-8?B?NWozQmZTS1JuYXpaRDhlN0hUalZOZmFyRWNyR0NtM3NTNitvOUlHWVc2c3lo?=
 =?utf-8?B?ektmNDNRVXdQZS9jaGRLck5acjUrWVlCdVJrQStTMGJSMVkvUjRMajFpb3Z2?=
 =?utf-8?B?R3l1OExkY1JNN05PWW9kQzl2aTR6S0VyTEZEYi9VQThGVE9JWFc3aGk1Ly9U?=
 =?utf-8?B?eGk4ME5ZT1gya2FCMXFvcTdZbUgzQTh3NHlmbFRHZ0RwVk8xVnVWVG1Ud3RC?=
 =?utf-8?B?UWxEb25FbUNCWCtxYnBNdUd5N3I0RTZES2ZrZExxQ1plUElzTnl1Y3JaUjVO?=
 =?utf-8?B?Y3I5Y3lHQ1psa1A1RnpoUDQ1c3JuQ0hyT09DNFJvVEZ2cExGcmRBZ3hqd0c3?=
 =?utf-8?B?WUJYOXp6U2FqaWVoTFBpTk1tTHRIczgvcWZPaTlZRHhuS1c5RWhSdEVzWHMy?=
 =?utf-8?B?VERZTnZybzBJU2VVcVBsOXIxeVJISTYydUlYK3FHN2JwNzNGSzlsRndmRlAx?=
 =?utf-8?B?UmpjRnY0YkptNmZVS0Q2NWNUNjZWS0VBdGd4U1gzSXE1VzZJWW1nMWkwTzds?=
 =?utf-8?B?RlZvOVBOMzRGUG5JdDRNMjRhcjFCanVqSFRNVThiZTRlTVFxRndOeFlMOFNj?=
 =?utf-8?B?MWhtQXRmczFZWnZLck5qTytRSFh1aDZaSmEyZ3AxNWQzZjByTW9VMUY0Q2FG?=
 =?utf-8?Q?iGcCDI+jZJY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1Q5M09FTDFyTU54bTM5NzZEUDFtYkl1ZElTZThReVZsc3RBdjd6ZkU3MDBP?=
 =?utf-8?B?Q1lnbWZMcmY0Q2NJeHQ3U25vUDI3YXVseE5CbGpGOVJsQnZiMVI0YXA4NzJi?=
 =?utf-8?B?MWJWVUJwaDBZU1BPMzg0eHdFUFRsMnRsY2pSdXBrbk1YOGR2MDNFWXRodzdP?=
 =?utf-8?B?OHFwdXJySkV6aExmTExXcXlrb0ZHeStOT3RrMDVoMFg5MXBXNXR6WEl5dEZK?=
 =?utf-8?B?VCs4WGFGcldaUmNVMmliY0xlY21tS0NoL3dOWjJ0NVZMd2hMZlBZVjF1ZVZK?=
 =?utf-8?B?TjJiU3B5VjdkdW5LNzAwRnhjcGltbDhqU2p2NjRxN3FxV2x5cTMrVWwrdERa?=
 =?utf-8?B?NUQ0cG5pTzZPMjh5ZHo4STJaeVJzbFlJNnRENDNMRS9YNlVFUjUxbTl1RFdR?=
 =?utf-8?B?UDdwQTF4WDdVRUlUa2ovZFcwOG9HR1Q2Zmw2MWFuWnhFK1VOeWhmV2VJNFdX?=
 =?utf-8?B?RmQ2V2g2em1vYzJmQm9iUU5rV1hseXZrNW95eWFXVEFma3JHaXJ5cXIwSVE2?=
 =?utf-8?B?eWhzQTJ4cmhKQ0xla1N1cGkzNFpNQlUrbllIUXYzeXlUeUM2bWx0NkRrZ0Jn?=
 =?utf-8?B?UUVRN1ZaY2UvZG1mZFg0ZjBFQ3QxU2ZvTlZJRTlRVHV6RlM0TUE4aEtXQXZN?=
 =?utf-8?B?UFFuS3VrZjJEQmt5N2VjL0tuM0xjaVVBQnM4MEFscGh4QlhpV1FYY0c5MTM1?=
 =?utf-8?B?TGdFNWFjdG8wRVFTSCtyc0s1cUZ4aXRqemxobm1rNnFmOUVXa1JWZlFLWC9H?=
 =?utf-8?B?NUNWUGc3aXYxck1YNngyTGJ5Q1Jxc0xvMjJwME5OVHUvaDltTHhZS3JtY1E2?=
 =?utf-8?B?TXBISkJGREJSSzErV2l3elpOakFGdFYvbnRtOEdESFBIa2tsT0ZQdDBxZHVV?=
 =?utf-8?B?SU54Qkg2Rzlwc0hRZXRWeHhJd1h1VXN3YnovYVVNbWwvL1QvRWZjajEvVlBK?=
 =?utf-8?B?TXdSTEowYVp2NGxaTDB3UEcwK05jWnBhcWJkSnBoQ2svS2wyQi81U1FVL0x4?=
 =?utf-8?B?dWh0aU1iV0lpZTQ1aTYyZmlPUU96allTdWtRcm9pZm9kUXFBT2ZOazk5d2RL?=
 =?utf-8?B?NnNORGtWWXd4SDl1ZXIrYnk4TWZMWDdHVzZBN0xwNUZUeFIrbjBRNlpHb25S?=
 =?utf-8?B?aU9KVzFmc2tZMlYwSUJSek9keElFS3laVWx2eUtoSEl0NEtFTUpLSk1PU0RC?=
 =?utf-8?B?YkVhOFVyVVcxV3lUajE1QlBDZ0QrbU9qNURNZm16MW0wYmlCU1NWYVB1eTJH?=
 =?utf-8?B?akg5T1E3ZEtQZERKNVBrSUhKWHo1d3luUkdpSXEzVUZpMUM1RVl6bXRDZWNn?=
 =?utf-8?B?a0RhRnpCMVRYYkU2aTZqaTBJeWpnSlRzcHRSZzF3cG5DQkFhQjMrNi90bXdi?=
 =?utf-8?B?aUZIRGlDZ0daTmRCeDRHODh2U0xrSGQzUldUZ3k0N3U3Y0IrM3BFMjdTUzlm?=
 =?utf-8?B?TmJ0Z2lyL0JtS0FKOFd5VU96bG52YUlaeWxVV3dPTDZTNDlZVmRQemNlT0lB?=
 =?utf-8?B?aExjZVY1eVIzRm5DdURKR291Y3RudDJXcWVZT2Z0U0FZSE1sU0lHcTd6VGxB?=
 =?utf-8?B?eXNhQlJScFVMZ1hPYnRieDY4Uk5GSzJJQzc3WW9UU092ck9XN0o4SW9FYmNO?=
 =?utf-8?B?VEltN0tkTWlRUnJQUzFpaDhsaWZYOEFXcmp3cE5Qb25EbmxlMm9heGwyWi9Z?=
 =?utf-8?B?c0dYaURhL1JMeDVmd0Q1dGJQb3M5Y1REZ2hZQTdNN1pjODA0WDJWY082ampZ?=
 =?utf-8?B?dGxUejM5VUZwbTRZTzlQUklWWXp1eVBhWEgyTE9EMElBcEt1a0tHZlpXZHlm?=
 =?utf-8?B?OHhJTmpPQjZSbmRIbVlPaG4wLzR4NHRpM1VDZEVpVW94eC9wQS90N3RjYVlY?=
 =?utf-8?B?OVpXdlhrT1FHVlZzNmdrelAxZDd6RmtJNjhjMXJLYXc1TmVEM3cwWDlFRVhW?=
 =?utf-8?B?eE0wdGpZVXB5d1JCaGNkRDQ4UmhYM1g0S3dzNy9hNkVDT2NlbHNHTENwYUcx?=
 =?utf-8?B?c3J4aXVFRmRwL1NzbDE0MHRWTjNLKy81aWROTmVDNUttcmFCU29RSXpOcXFQ?=
 =?utf-8?B?bUhYeHlQMUI3d01nb3Q4U2JuRG9CRFNMZkRET1F3Q0ZhcTNGVEJhY1IvSFVC?=
 =?utf-8?Q?yw8Ru6YK82mBULBmsX1dvH1gF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b4fa28-c7fe-483e-2bae-08ddbec3de29
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 08:37:41.2649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: peqdfMs9Ph/sufXPSHXwJrsZmtbB7FpvsUeyhr1VBynmvFXxvQhRQ1w66p4gahFG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7765



On 02/07/2025 16:14, Hari Limaye wrote:
> From: Luca Fancellu <luca.fancellu@arm.com>
> 
> Implement remove_early_mappings for MPU systems.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
> Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from v1:
> - Add Ayan's R-b
> ---
>  xen/arch/arm/mpu/setup.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/mpu/setup.c b/xen/arch/arm/mpu/setup.c
> index ab00cb944b..5928b534d5 100644
> --- a/xen/arch/arm/mpu/setup.c
> +++ b/xen/arch/arm/mpu/setup.c
> @@ -97,7 +97,14 @@ void __init copy_from_paddr(void *dst, paddr_t paddr, unsigned long len)
>  
>  void __init remove_early_mappings(void)
>  {
> -    BUG_ON("unimplemented");
> +    int rc;
> +
> +    if ( mapped_fdt_paddr == INVALID_PADDR )
Hmm, I cannot think of a scenario where this is true. What am I missing?

> +        return;
> +
> +    rc = destroy_xen_mappings(round_pgdown(mapped_fdt_paddr), mapped_fdt_limit);
> +    if ( rc )
> +        panic("Unable to unmap the device-tree.\n");
NIT: please, no dots at the end

>  }
>  
>  /*

~Michal


