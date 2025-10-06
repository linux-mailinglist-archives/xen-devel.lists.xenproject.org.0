Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CCCBBD536
	for <lists+xen-devel@lfdr.de>; Mon, 06 Oct 2025 10:22:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1137990.1473793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5gTD-00031F-42; Mon, 06 Oct 2025 08:21:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1137990.1473793; Mon, 06 Oct 2025 08:21:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5gTD-0002zW-1L; Mon, 06 Oct 2025 08:21:23 +0000
Received: by outflank-mailman (input) for mailman id 1137990;
 Mon, 06 Oct 2025 08:21:21 +0000
Received: from [94.247.172.50] (helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3dSL=4P=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v5gTB-0002z7-12
 for xen-devel@lists.xenproject.org; Mon, 06 Oct 2025 08:21:21 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61d4de61-a28d-11f0-9809-7dc792cee155;
 Mon, 06 Oct 2025 10:20:57 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by PH0PR03MB5829.namprd03.prod.outlook.com (2603:10b6:510:35::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 08:20:50 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 08:20:50 +0000
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
X-Inumbo-ID: 61d4de61-a28d-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QHPjvY/jpTdajeGPGPbjzE69PZkwhaLDsIrxH/3MjMW865pXs50rNlADUVwwXQWUAVN7lITazu9tblgKHGXNjLqR9oY4K5PcQJRvqaiEL+yUTwASP1UC6GUSpF2W6yG9sF/i9rzhmrenApJeIET9XQLmC+nOBqItdYkgx9IuqG2Kx/u65MgxzKyh907rBxiM0sltgfuc+olyk8jO0O5Nch7mZJ5fYypSEhj1XzLIgBq9o7nDCteQrZTFAvQfcefxIUsMm9rIA0nT6cMomvy7dZhIPe0cj0SfnOaTXJYVxCpSKK8zCA+5o/aT8b9Xn7SO7A++iYk4UE26AcTXtuWjCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HfrRewX2ZDUGv1nUjrpUqpxE8LQwco3eS0bA6FGwP8M=;
 b=wzrHfEDZe1aJmV5/AkQlLfUiQru3/DOh+7iwq31tVcv50UZ4oLixQzmZK/twVnPdAU3f/dqPWiGV6Ik8EYbbCIIk0S9McNBet04k73y/s7H01g11eUtgo12oYKSWDtb0h9IgHvHJ1vZfYXOSRAVWl/7jFa/iwEHLvFLm46ym8NXdOXfCNC1BTpR5Hd4AgW7F15X5eTrhpVSh9u9tN8S1OY0nR/Y3xkWaZqm/t89htrYMKnY8XFVZe1ENEbwe+UOG4bTW67FoEmdvakPU2rwGNxbkWuod1E32RZb628jGPMPWNL7piUiNWGNk9mQ3mKte3YktvogGH3Gh37NYzuttYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfrRewX2ZDUGv1nUjrpUqpxE8LQwco3eS0bA6FGwP8M=;
 b=onlj88HB6yLPfJNj/7qB/cno6ZOyOaYNOgXysCOnqopQTqJz1AzEgz3936gGwcaJ/vtfVJnx/K/uR+ZWeMlp1f8cZaibIJmUdqCRL2pvCmISudujglZurOtnZpXyrHE+SJjMelMeFbVFRb5Nz11oZ8FrL7fpU8Y1z+xPjcS15dE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 6 Oct 2025 10:20:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.21] vpci/msix: improve handling of bogus MSI-X
 capabilities
Message-ID: <aON72Sq6ZJ6y95DI@Mac.lan>
References: <20250929084149.70560-1-roger.pau@citrix.com>
 <2d1737a7-58e3-48e3-ac16-1bda3947c929@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2d1737a7-58e3-48e3-ac16-1bda3947c929@amd.com>
X-ClientProxiedBy: MA2P292CA0018.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::8)
 To DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|PH0PR03MB5829:EE_
X-MS-Office365-Filtering-Correlation-Id: e9cfec42-f631-479b-2e9d-08de04b13f27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dlBLWC9RdFhPUnFCT0loTE9XSmF3aXdwZkwwalBkUVhhWnpHam1WME0zdGZD?=
 =?utf-8?B?VFFwTGpCYTdGMHNsKzR3WlhBZ2U1azRMYkNVMjI1NHp2bDBOMDduejhPc01P?=
 =?utf-8?B?TGozaFl5M1hGYTFiM3BhL2RhRjhDKzZPNWczY1lIeGp6N25zQmhiMDJ5WUJM?=
 =?utf-8?B?cHNRUS9EVGRWKzY4UG5neWZFQnEvOXB1S1ZlUVAyV05WU2l0c1VKK3p5c3BD?=
 =?utf-8?B?bEFoVlFGZXd2MzlyUGFMRVJ3RDQwNU5FdjZjMUdlRlpsREJ3a3hBMGw4TVdw?=
 =?utf-8?B?ZnN5VFBVTWdsbmF2cGU1MWJZVWEvTmFKY2NZYzlqbFdHaE1hNGZFa25RVWxt?=
 =?utf-8?B?ME9XTFJ6MlFlZGcxM3RseHlwVno4dGR1M2tLNjBmUnprMVljaFVFNnovUmlI?=
 =?utf-8?B?T1o3cWJxY0szQmlaaGppRzBpdmlOeWhmUE95K1U0ZHdlMk5HMGJpajBVVytX?=
 =?utf-8?B?SVNPM1NESTBHS2twZWo2dlVWN2NXRnIwQVJsK3dvTXRVcnptNUQybVp0elp2?=
 =?utf-8?B?d3Rac3czLzVPUXI3akRyYmZmc1hKbXp0NnNhRC9Vcmh5MFpmVGpFS3NWME1l?=
 =?utf-8?B?b0ZzdlNkTTlFbkdOVTFHMXV5Mi9oSHgvVXpYZGFJamIwSm5pZ0tsVGxhbjBz?=
 =?utf-8?B?ejFPdHhOeHdEOVlhSlhHL0RsNEFNTCtyb084b2FmcVU4MlJDY3RGYVlPUUlK?=
 =?utf-8?B?eHRHcUFMdW43MWlLNkJRMFBCOWhZd1dUZ2E4RFd5alpFU2tJdGp2d01uY1hJ?=
 =?utf-8?B?Y3dkRjFBNEwvRGhiVVM2dEtSanN0aWpZNU00cXJBODNLbmxwYTcvbVNPa0to?=
 =?utf-8?B?eWR1Y1E0bTJjUUJQOEhmMlJRK1JaM2lJc3VTcDBsekdIQmJYSFduWlZpeXJs?=
 =?utf-8?B?ZTVFTkxNVWlRbWFvd0FmUnpHaUJZWHJKeEdyYzBVQ2g5OXo1Njd1KzRJbDBM?=
 =?utf-8?B?b0FvWTFkTmFpL0VYaXZJdkdxQlpjYmRVTHd2VkJjQWhWZm13YXlnd2tGcUw3?=
 =?utf-8?B?VkpkdDd3QlBoK3l2MGFWcmc0cnQyTHRiWE4rQVYra2tnc2FwLzhaMVIxc1ZX?=
 =?utf-8?B?M1hKT1h5Rll6QUsxZk1KVGw1em5JeDVXK0RHaGpUUUdudDBzKzF0REpLY0x1?=
 =?utf-8?B?QUIwa0pFbVFBNlBBMHJqTnZoWXlUV0RtZEFzLzVSc3UxeTg5TVBNYld5Y2VT?=
 =?utf-8?B?WndLckt0Z1FCbG9BZjRWMTlFQm1VREN4SzcrL25vSTBvRmxrenRHNWRWRDdN?=
 =?utf-8?B?MHc1SExjZTBxUWE5UjZsSnhHUlBhRW83b3Eza1F0bi80d2o3YkhpTHRkaW9i?=
 =?utf-8?B?dzQwdks2cnhNMEk2R3pQeU43Tlp5UDJwVkU5T2d5VEt5WUxyajVNKzQ2OWdH?=
 =?utf-8?B?ckVrLzc5NUJWN1p6ME9rSi8zYnlZSlVZOERHM0NpM2F6T2FacEcvV0FqVFdy?=
 =?utf-8?B?YkwyeEZ1UzhaN3V2dVoxOHZGMXN0dmFYTjVqUUJWMWppU1ZJTUd1aFFTSm1l?=
 =?utf-8?B?Q0pVM0RrUHZIR0FReE9QeVltYzhvWDNJc3h0angvK0RDWFFDWCtVQ29xRzZB?=
 =?utf-8?B?am9xZjRVNWlUcVdYQmdNSzRiN1RtT2JDK2xta1h2WCtkVlN2Y2x3cWZWQUtE?=
 =?utf-8?B?V2wvYStKSmlEMXVuQjgwbU5KUE4wVjZUM21GOGxLQWI5TWNsUlVIS3F1eTE3?=
 =?utf-8?B?YXd0bElST3Y1YnJrRExYTHdMNDhPK0owa2plcGNrUWF5RXZyUXdPK2ExS3Bj?=
 =?utf-8?B?cGE4ZnpyQytyQWtWcDJrcTFTc2l3NDBIWFpzNUtjUlc4Y1dQTWtuTWpJR2ZQ?=
 =?utf-8?B?TnQxY1c5M213MHVEQ2cvVlo5WW9WTTFxZlE4b1o4djMyRFpMM2Z2elZGVlhs?=
 =?utf-8?B?cXlEUTRiekNMdXY3ZG5aUFZNb2svWDU2aDBka1dRYkxnMSt3eVBNVVlONXc3?=
 =?utf-8?Q?SHypEr7rke2Gr8TTfK+EeFzYooUTHkfN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUN4aUpBczd2YmlZa2JkWjEreU0zSXYwV29xdXAwbzhacUh0WkgxTmlEL2ts?=
 =?utf-8?B?MWRFYjZadGxZdkNSM05qaWlCMzRGMTJqampRY0pDM1pjV1R0Q1QzbnAvZDE0?=
 =?utf-8?B?bWR5c0k3KzRkUUFpT3ZVRHU0WUdrOXFTRnBLU2oyNGtHOU1SaFNYV0lMRGYx?=
 =?utf-8?B?aDVNbStidXdFR3NIVEMyRlh3Kzd2S2hYM2t4SFVtcWZDWUdwanViRkcrSkZL?=
 =?utf-8?B?U1hyZ2k0SlgyNTN0UnpoclFBd3h4TFUxSERoOGFWbWg0blduNm9CSU1lK1Rm?=
 =?utf-8?B?NEtCaTZ4bEExRnNYdHpGbUd0anVZemdwdHl5MysvMEExYjRmelMrbWdKblo3?=
 =?utf-8?B?OFhid0Q3SEorQzBuVVhHWkN6WThnWTVZSGFUeWk4a243bGNaZysySnBUOHdE?=
 =?utf-8?B?aUVDU1FUUUlhQ01zL0VOb1hNNVIvWWJZQzlSNzJNN0JqY0N1djQ2REZiOGp2?=
 =?utf-8?B?Z2I5Zk5sR1kySkVrRkJ0dWNjT1VyaUlnRXc0QXIxMk5FS2MwdGVneHozZmpP?=
 =?utf-8?B?WXVjNkJIL29zcWYrNDdyMGhZMUpYUVRObkZVbUljL0FXU3BiY0d2anlXeFJo?=
 =?utf-8?B?R2N3Z093THIyWkNUS1M4emw2QTRkaDlwU1pLa2lDY3p2MGxEWHM4UHhtVk9j?=
 =?utf-8?B?Q1N5aTJWSGJTaFJ0d0x4YUxwYjdVQXRORXVlYStoQmRJOFpvdzE4ZWVHUGV3?=
 =?utf-8?B?K28raHgwQU0rL1BXZVRxcUE4eWhJWWF0KzZsNXNOclZ3U1g3Njhub1J5YjZu?=
 =?utf-8?B?QU02cXVmc2JmWkdTUkN6TmplUFJBT2hwazluR2hGK0FBVERTYm9WdzBFT1Ft?=
 =?utf-8?B?ZldTaDJjRlNBNG9aaUpLLzZISlJHZGs3ZC9mcGE1MytkNkkreThpSXZJQzRl?=
 =?utf-8?B?WFppSHV3NVhaWlZPaFlYclJTdjB3bkRCaURMUTFOY05pdDV0ZXV5dGlrUVF5?=
 =?utf-8?B?QVFYZTdWL0FPMFF3UXRrZUV4alJ6a0pCNThtaE1RN0tlcUM4czBVenEzNEt1?=
 =?utf-8?B?cTNVZzNyYTBxVFRRR0l0dUtLVTMzWTk1WGxROC9JQ2hUVkN2YzRuNUhTYlhQ?=
 =?utf-8?B?dlIyVkFZZVJ4bFRFa2kyZUN5YVU0WFdROUd6NzE2aldDakM0Ly9NRWRCbXZV?=
 =?utf-8?B?STRuWnJxWWVSRHFKTURQYWY2aUVUcnpDbkVSY1dCTG1nUGJySFZBdUJSUUFm?=
 =?utf-8?B?NkdHZ2VDdDNrUEo4TEpWSzFHSlN4SXQzZXhmU2tBUDg5SVRaMHpXb0N0T3U1?=
 =?utf-8?B?dHNlNnlGaytOTWFMWjl5MDlyU01RMnhPOFN6VHJpTSt0VU1jMGFxMDJRcUJT?=
 =?utf-8?B?OVFxUkpzSW93clRLTFZvalY0NHU3MW4vNHlCa3UzNVBRVnV1WU40bXVaNk1s?=
 =?utf-8?B?Z3BaNmZPTXRoWDlxOGVlcnNBUGFVV2hJTXdKVld0azNyYXQzc0s0L3BkYUxu?=
 =?utf-8?B?Q1NCS2lBekJ6S3hVTUJzajVhT2pNUVd0MURjVEIxbFZ6cXozYnhxbmRCUG9T?=
 =?utf-8?B?TzdyVFZjUk5nNWE2QlpuM0poL1dnbWlLWDZCQ09TaXdzZStrcWI2alZYVHVH?=
 =?utf-8?B?RlFJUVJJR2pPd21DZ0pLenA0RDNEclhYZjcrckFQZGhMbFlSVWVsNGxzVHZM?=
 =?utf-8?B?RDJmbkplaExEa0YyTnRGQmxVTGx5WWcweXBvV281clJBWEhVSzJKdE5kTXJF?=
 =?utf-8?B?b3h0UjB5NXo1SUVoSHN6TGRMMUUvRFlveDVTLytqbmlOV3dNRUJoOWJSYk9I?=
 =?utf-8?B?c0Jrc0lPeDBOSkJZMTQ5NDAyOTliY3plTC9VT0RHblc1WlJPVTVjT0JkYjlR?=
 =?utf-8?B?aDBHQUhFSG1Jb0EvbTFaaGkzT1FNUUp3OXMvV2Y0UmQwMWxHdjNldE1oa09C?=
 =?utf-8?B?WEhiT1p1ajl2MEtUSkQxS2R3ZUppRkFzVE5nZnVJb1lSOWRwcXNlUHEveWZQ?=
 =?utf-8?B?emdWby91WWJNTDQvbTQ2WFI1NzA0akpta0w2VUJPeGpXMWYyQm80ZXB6cVlV?=
 =?utf-8?B?MnZNSExsZVNoc1lBY0srOGVqWVpRZndoYzVTOElKSitCU04wa2JTbEdoYlBY?=
 =?utf-8?B?VDliS2tyZDBGMUlwcXgwcWtYL3o0Yis3NmNJWWdyS3RrLzczRE1RN0laMUtv?=
 =?utf-8?Q?TB9yQcND4ixRL31CFbWkAx6IB?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9cfec42-f631-479b-2e9d-08de04b13f27
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 08:20:50.3020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a3o/EzXLMcal5Hhfc8Djr8l37xRmvBdgg22OLGZA1Z9hGTxzO8IHUYsyG3UpQh2o5nLPK9WOI7TzNbGKrjM7/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5829

On Fri, Oct 03, 2025 at 11:29:40PM -0400, Stewart Hildebrand wrote:
> On 9/29/25 04:41, Roger Pau Monne wrote:
> > I've had the luck to come across a PCI card that exposes a MSI-X capability
> > where the BIR of the vector and PBA tables points at a BAR that has 0 size.
> > 
> > This doesn't play nice with the code in vpci_make_msix_hole(), as it would
> > still use the address of such empty BAR (0) and attempt to crave a hole in
> 
> s/crave/carve/
> 
> > the p2m.  This leads to errors like the one below being reported by Xen:
> > 
> > d0v0 0000:22:00.0: existing mapping (mfn: 181c4300 type: 0) at 0 clobbers MSIX MMIO area
> > 
> > And the device left unable to enable memory decoding due to the failure
> > reported by vpci_make_msix_hole().
> > 
> > Introduce checking in init_msix() to ensure the BARs containing the MSI-X
> > tables are usable.  This requires checking that the BIR points to a
> > non-empty BAR, and the offset and size of the MSI-X tables can fit in the
> > target BAR.
> > 
> > This fixes booting PVH dom0 on Supermicro AS -2126HS-TN severs with AMD
> > EPYC 9965 processors.  The broken device is:
> > 
> > 22:00.0 SATA controller: Advanced Micro Devices, Inc. [AMD] FCH SATA Controller [AHCI mode] (rev 93)
> > 
> > There are multiple of those integrated controllers in the system, all
> > broken in the same way.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>
> > Cc: Jan Beulich <jbeulich@suse.com>
> > Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > 
> > While not strictly a bugfix, I consider this a worthy improvement so that
> > PVH dom0 has a chance to boot on hardware that exposes such broken MSI-X
> > capabilities.  Hence I think this change should be considered for inclusion
> > into 4.21.  There a risk of regressing on hardware that was already working
> > with PVH, but given enough testing that should be minimal.
> > ---
> >  xen/drivers/vpci/msix.c | 50 ++++++++++++++++++++++++++++++++++++-----
> >  1 file changed, 45 insertions(+), 5 deletions(-)
> > 
> > diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> > index 54a5070733aa..8458955d5bbb 100644
> > --- a/xen/drivers/vpci/msix.c
> > +++ b/xen/drivers/vpci/msix.c
> > @@ -675,6 +675,51 @@ static int cf_check init_msix(struct pci_dev *pdev)
> >      if ( !msix )
> >          return -ENOMEM;
> >  
> > +    msix->tables[VPCI_MSIX_TABLE] =
> > +        pci_conf_read32(pdev->sbdf, msix_table_offset_reg(msix_offset));
> > +    msix->tables[VPCI_MSIX_PBA] =
> > +        pci_conf_read32(pdev->sbdf, msix_pba_offset_reg(msix_offset));
> > +
> > +    /* Check that the provided BAR is valid. */
> > +    for ( i = 0; i < ARRAY_SIZE(msix->tables); i++ )
> > +    {
> > +        const char *name = (i == VPCI_MSIX_TABLE) ? "vector" : "PBA";
> > +        const struct vpci_bar *bars = pdev->vpci->header.bars;
> > +        unsigned int bir = msix->tables[i] & PCI_MSIX_BIRMASK;
> > +        unsigned int type;
> > +        unsigned int offset = msix->tables[i] & ~PCI_MSIX_BIRMASK;
> > +        unsigned int size =
> > +            (i == VPCI_MSIX_TABLE) ? max_entries * PCI_MSIX_ENTRY_SIZE
> > +                                   : ROUNDUP(DIV_ROUND_UP(max_entries, 8), 8);
> > +
> > +        if ( bir >= ARRAY_SIZE(pdev->vpci->header.bars) )
> 
> This assumes a type 0 header. For type 1 headers, bir values 2 and up are
> also reserved.

Right, but those BARs will be set as VPCI_BAR_EMPTY for type 1 headers.
The check here is to avoid doing an out of bounds array access, the
check for validity of the pointed BAR is done below.

> 
> > +        {
> > +            printk(XENLOG_ERR "%pp: MSI-X %s table with out of range BIR %u\n",
> > +                   &pdev->sbdf, name, bir);
> 
> Nit: placing the cleanup label at the end of the function and using 'rc' would
> make it more amenable to future uses.

The issue with that is that we then end up with a structure like:

    return vpci_make_msix_hole();

 error:
    xfree();
    return rc;

Which I don't like much because of the double usage of return (it's a
taste issue TBH).

My motivation for using a goto is that they are conceptually the same
error path, but we provide different log messages to aid in debugging
the issue.  Otherwise all checks will be done in a single condition.

Let me know how strong you feel about the usage of a label here vs one
at the tail of the function.

> 
> > + invalid:
> > +            xfree(msix);
> > +            return -ENODEV;
> > +
> 
> Extraneous newline.

Thanks, Roger.

