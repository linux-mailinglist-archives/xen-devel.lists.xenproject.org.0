Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF618C323C0
	for <lists+xen-devel@lfdr.de>; Tue, 04 Nov 2025 18:08:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155857.1485238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGKVr-0000Ws-Vn; Tue, 04 Nov 2025 17:08:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155857.1485238; Tue, 04 Nov 2025 17:08:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGKVr-0000VR-Ru; Tue, 04 Nov 2025 17:08:07 +0000
Received: by outflank-mailman (input) for mailman id 1155857;
 Tue, 04 Nov 2025 17:08:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zez4=5M=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vGKVq-0000VL-5p
 for xen-devel@lists.xenproject.org; Tue, 04 Nov 2025 17:08:06 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2541977-b9a0-11f0-980a-7dc792cee155;
 Tue, 04 Nov 2025 18:08:03 +0100 (CET)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 MW4PR03MB6620.namprd03.prod.outlook.com (2603:10b6:303:12b::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.16; Tue, 4 Nov 2025 17:07:58 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 17:07:58 +0000
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
X-Inumbo-ID: d2541977-b9a0-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S9y7Xq+k5/PA0OuWdqauTO76Bts3L+8aCwz+xCOaqFKJ75IsYRC/8seXqz+xvHBHNV/RIzq9NAuZzj41JWCthUj9lTlHT89OIDhvDM/cc6s5BPnrL+7WLxJC0WJ/CrI7NMEbWRrjl7juyK73Ak65ql/fCp3T12ivnYU1/tV1bSufk9W1HsT0DaEoBMccl4pD11oIHMKfl94v8oc9+D8HMNlECIDCiysHZ5KVOoPhcl3NKeoI8c4fSReuQ3So1p1Xc2P75CFD6T1Fr0hxIquE+1dNbRmiOP3bhuED7iVkcvuDgSHSt9Myr0oLTkOHol3CGNOTj84nqE/EGi4VlNsIHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LfVdt6loshCTO2dVGLlMJQ477HgRFTE0fo6Gv6XKKFM=;
 b=mcpM6AxKO8GNhwJGSmmsOTjOmcfHEgWQvEOcuLp7iXOToXLmYPqX6CsMD+QVOPGafQZzAGIjTRShzTeDDRr++2rEWMO332LSdFJuUkc0iKOd1DtGOt9HUf4bvAN5T1a1GLv4rRB7+p/1YG2BkEWNdjuKgnrbFFrW5Ih1kPvXoxnVbvPNdTCzrYANYD462taBg7tR+2QYXAGmOrMbbotdOfUOOF3SB4ZTCiO0jJgXy9qdNLJhZkM1mM4B2ykSeWn9R1QajIzAnAekGTyT+kSgZUalr9VzrfQ5X67eb9Q7vIF2g6mlf5pwE9ePZoc92T1W8pER6azrTvwMPskr7HUdCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LfVdt6loshCTO2dVGLlMJQ477HgRFTE0fo6Gv6XKKFM=;
 b=A6m5fgoxfDOT6cTbq+NCZZWn+vHaZO7s5XlFt80zSVuvtYv0Kl1OHe5tcj7t/hR2f6fIvNpF2f95I0SFlNw+ayhvSkCSZIK+OkmtwnY+BPmqxu+99l+XXhO6SAkwA2zg9l4YLr9FAAez7dEyfVstyJhu81rr/QeQ48FTcFjBtk4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <fa368639-41f4-4e6d-8f43-0e5d774b9add@citrix.com>
Date: Tue, 4 Nov 2025 17:07:55 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] acpi: Set TPM2 LAML to actual log area size
To: Tu Dinh <ngoc-tu.dinh@vates.tech>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Daniel Smith <dpsmith@apertussolutions.com>
References: <20251104161230.22789-1-ngoc-tu.dinh@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251104161230.22789-1-ngoc-tu.dinh@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0221.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::10) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|MW4PR03MB6620:EE_
X-MS-Office365-Filtering-Correlation-Id: 94060008-5556-4e37-08b3-08de1bc4b427
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NWVVS0lBM2RXakZUWEZydEsyZnpoSzBHM2kzSDRJWW9JeEpkVURGcXFNbU16?=
 =?utf-8?B?bEJ3MXExYkJPaysrWkp0Q01JSUJnbVNnN2Z6UEJvcGVNNi9YTktaaGxLSFVD?=
 =?utf-8?B?bERIKzRpOSs2RUplRUZVZUdHN283aGJEb0w4YytVZmdvMkdjVjJ2dnUrRCtI?=
 =?utf-8?B?eEsveGUxVjQrZTJzZjJ4TjhzdWxCOURrRk15V1lkbWpsUWR5S1luV1F2YWU3?=
 =?utf-8?B?WVRTZEc1bjZ2N3VISld3amRLcStKeTFDV2NyTU9Fa0hjYWNySG9oUEx4eTlJ?=
 =?utf-8?B?Nys2Szk3RWorRzlkcmkrM3RBVVFOdU9ocURVdlNLenJvUWZpUktuODdRN3NH?=
 =?utf-8?B?WTBqRFRqRG9nUmRSZXFzMzZKUUF0dG5xSnpwRjVSV1p5OTYwYWRWVHhYL3U0?=
 =?utf-8?B?Mm54bHRBMmRMOVJXRHFPeXdQSTBaN2xEb2xDNWlJSVlYL1BkOGQ2MDlRVFVW?=
 =?utf-8?B?eGFtek5jRE1XODArMWUyL2pFNkpmZm1pWmJIVnFLUWdkUHNSTGZkdytOTHQ3?=
 =?utf-8?B?RTY2SW15ViswdFpueENML3Y0UXMvYXQ5VUdhLzBlNG5zWFhLaW1iZ2ZNOUJU?=
 =?utf-8?B?dW15bzFNZmdOaFk2bjNvRGdYWXoyUkZidmN4cjBITUV6WVRxck1kKzVxdHA4?=
 =?utf-8?B?OVVVUjByQlpkYjlZL0xBMVgyUG9kNWd3VVFTQ1p6SUlTSlNPMGt1YW9UTEg5?=
 =?utf-8?B?cmpRWEFUR25pYmJVVFZJYVpMQlNTZml0L04wTVlZaUpJV2U0WVFFc212NVFR?=
 =?utf-8?B?VDlTTEpEUS92YnNpbk10UWRFRFFTVm13WU9vOEUveGVHSkNCRGRvL2F0VUVJ?=
 =?utf-8?B?emlJb0dNa0o2OFY3eDlhY1E0WEd2UU1mcHhhUUZVeExBam9Uc1JxdXc2aVhO?=
 =?utf-8?B?Sm5TZSt3VnMxbFZUUjM1WENlL2tUeXk3WHpDOUtBOEw4WXgvL29iOVJzOUpW?=
 =?utf-8?B?SXhHeXhEdUxhVkVqQjZmbWRrWURsUGhrTWw1V2ZYZGN3NmlHUjVEQXBNVThG?=
 =?utf-8?B?TGJpODZpK1lQcU1yUStjOXhmb0xFb1Q0TjlCdnBiencxL1dqcEQrYlBOT2Q5?=
 =?utf-8?B?QlJhcHVlZFdHWk04a2tDTStyRGlldTM1cFBYSHVaaUtBcE1NWkV6TXA5VXFM?=
 =?utf-8?B?d3NkODNmUUhCVXR0N25pLzZvSG90WjB5MlBVNGtvN3NxQnNZZ1ozSXpNS2R6?=
 =?utf-8?B?Y3ZFdHFCZ1dKbml6ZjRpc2lNVXpQNXJaeitpa3JPenpGZC9BTzRSWWZud0gz?=
 =?utf-8?B?V1BwcjRhK0NKdmpMd2M1dzhqUTlsbitYU3VSVmt1Q1YzbldpTmsxL2RLQlhh?=
 =?utf-8?B?ZmYvM3FTNi9IMkhNU2FYSmY3R2dGWTV3VkNFWEVkaVRoZHdIR3FXVlMzY3RO?=
 =?utf-8?B?dExrRm4wY3ZCd2lYSno1bVk1RVpDNkNTZWI0Q2hOTE0xNk85dHFLZkZtRjR6?=
 =?utf-8?B?R2l4dEpnQzZ4ZHROa0M5YkRpSUJPM3BtV1M3ckdiaWNnUHplZzJPb2NOeUgy?=
 =?utf-8?B?VFlKTlk2UWovbXA4U3g0bWx3cXkrWlhNTndKZnI2bTdWUXduMXhRRnN0cWNW?=
 =?utf-8?B?Q0ZNclpJTlFWdG9NblFWYzYxNUdRMmxpRVk4ZmdVWUU4YTZyaXNFZElDMFRS?=
 =?utf-8?B?RytkcXBqdmxJV0NLUkh1clFQeDZud3ZoZGlVaTNYZWFVcWM0SVNKcDNMbXVH?=
 =?utf-8?B?akpMb0psREFPaDFMVGEzZkxTc0d1MEJTWVUzWk5DSldDRXpJaW8ycUppWi9R?=
 =?utf-8?B?cVZFbTY1Rng3WWVnL0k3dlNNZ3AzUW9pT2M4QU9QRjVQbTJJNXJmcGFmSkh3?=
 =?utf-8?B?T3ozVFZSZ3FXM0FjaHd0SEV4SmhuMjd1bGlGcVZ0RCs2TEpITFlQOWh1NlJq?=
 =?utf-8?B?YThEeTBKUHROZ3hndnJJeWNxSUxqbmQ0OWFLYXViRi9uSFlLWnltZVNkNEVR?=
 =?utf-8?Q?LrPDj6a17QjosfMCnXpKgd8mKIa+xR1i?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2ZXTzRYZTUvK25uQTRCOGo0OVJqekgrT1lQaS9XZTRPL0dob1hYcnd1TnE5?=
 =?utf-8?B?L3VFaDVINTZKQzJzQnZkK0R0N1Blb2dMTHNNU3lIU242dWt2NXNXTnZXTDJU?=
 =?utf-8?B?K0RYUjU4MmlSakllVWlHZkVxMjNVZCt5UlVham5Id3htT2daRncxdXVFZGZv?=
 =?utf-8?B?Z3FtQXhXRSsyWW1qQVZwQmZFeEZBWTgzSnFoQ0FBM3dONnlITmZpYndiZ3g3?=
 =?utf-8?B?R0pkVWwwSWlKQjZETGVjajVxTEtZVnJtZlZFcHpPYi9oOTlCeE1tWk5BL3RX?=
 =?utf-8?B?ZlVCMjJTWEJvenpCRndEQURobENTSGtNdVE2aVRmc2Qzc2ltbFQwMSt0ZVVl?=
 =?utf-8?B?NTU3YTRoQnEyN1ZjdmpXTHRUSDFJZmM2TDlBRHFVU25hUDNRSlJqWnNFQlVY?=
 =?utf-8?B?OVhWSnlpY1VtU2hrbnpRQi9Zazk3eENkNS9zbkRkejloc2RwQitnOXJvM25J?=
 =?utf-8?B?K1daL2RCQ1luUnNJK2hWZ3JHcmkrU0xEcC95TE92dHRDQmY0UUhDK052UCts?=
 =?utf-8?B?TSt2bEtkMXhLMGt5cWFEQkV3bURUN0h3aFBucHpUbncwazlzemJUSkgwSzdr?=
 =?utf-8?B?VWtnQmtmQi84NWRhU0x2dEpSUEo3M204RW9qZmJjd295dE1kaEl2WTFXWUhi?=
 =?utf-8?B?K1dXSDBYNzNoWFZ6TTJhQVZjbjRvbTRpSWR5TysyUllPWTA4RWJFTzU0cWdx?=
 =?utf-8?B?eW01VWVpclZWSXhuc1Yvdno2eC85V0IwWEdRSkNHQmxGMnBIUVV2QitqOWN4?=
 =?utf-8?B?L1Y5RTNDZGxTcWpHYmlnUXJFaHUyNEpkSjhSY1AvMHdVaUptWERUTDF6VjVS?=
 =?utf-8?B?K1FIK2FwdDc5T0lhdzBidGVqZ1pFUERERFlOWVk2WWNPZldjNjEwUEhLdS9T?=
 =?utf-8?B?TGhGamw1c2k2VXo2V3czK0QrdE94enorSE1ZYkRpZld5NFIrcVMxSmFJaGpl?=
 =?utf-8?B?cUJXeTh3ZHpxeUdkUzAxSHY3UWlUR1ZLT0hqdTlhY3BGMDl3QW8va0t4bTVa?=
 =?utf-8?B?YVh0Mkt2Zk55OXhBeGlXMytGLzlBbndoTnQ0NU1BQms2WklZU0x2bU9NeDdS?=
 =?utf-8?B?WXF2cGlBRVVURXlHU25BY0RwVHJTSDRFNndjS3BFM0F5bmwzRkp3Y0RvdU9Y?=
 =?utf-8?B?TllkQVlHcGpSdmVmZlhpaVF0TkM2bWpwNlVHaEpVZU5HRGl2Y3JXcnc0NEMy?=
 =?utf-8?B?TTJRTEJkQmF0UU5lbXVWaU1UWFRxQmpUa05ERE1zMFE2aTg2MlhidFU4Tlhm?=
 =?utf-8?B?VEdXTC84c2p1NW1abmlnb1pCQTJKbTV0T3hRdElnZkN2S0dzM2NNMGZsVW51?=
 =?utf-8?B?WUZOMUEwbTRHNUNKQzdKdDRyZ3AyMGF2RnhFUGIvV3d3NVIySTRpdmZEOUpt?=
 =?utf-8?B?aUxkdHdUR3d0UStWWHlyQldSVnJLenN3Y01sQzhiZ0xkcEQyMjR4ZHp4ZWNt?=
 =?utf-8?B?ZXZaWkQ0R1J6UWVJWEZLa1p2YnZhdE5kaktreUZOZExhZ2Y1SnpublJnRERz?=
 =?utf-8?B?NU5lZUhpT0VOdG1tTm9QVVNwMDVDWU45czU2bHM3bm5GcG1Edk1sSTNOc1ky?=
 =?utf-8?B?b3l0dEt1U1JQTWk1QWNLQWN6N0NSUStSNHNyUmlPazBYSStiZ2s5eXFTUktw?=
 =?utf-8?B?bmQ0RkVJaUNHT2R6MVh1N0VMZlZFdmdaQzFyYVMzb0FIYUY5QnI0UUpRZHpR?=
 =?utf-8?B?SlpGRUJaWnc1SlJqU1oreS90MFNDV2RYWTE1Wjg3OHFER1FZZUJIMnU3TW5G?=
 =?utf-8?B?NWFCb3ZKb1g2ajk3Y3VOVFFjQnZuYWNpcXNIOG8yNmU4a0tDNzhZVzE0K2tD?=
 =?utf-8?B?ZzFrRFp0cmwrSzRQKzBJajQ3QlMvVGU3TE5FTHc1T0ZrL01nYUZTRlRONjJ5?=
 =?utf-8?B?L3kwMk9QTlJhcm5hK0x1YlpzMFB0dVlNbnh3RUl1U1lWaHNBbjYyNURmOGRi?=
 =?utf-8?B?TnFhRFlQeDRDWkNLZmJ2VjhHT0JFN2RsNWtLUExWK1kvYXp3L2xCV0MvUEZh?=
 =?utf-8?B?cUZDa3pUWTBDb1JmUDRQTDhScnJtckc4VExGc21zbjkrREZHdkJrT0txYUtr?=
 =?utf-8?B?YXRjbGp6WHpWRnZQUEp0Ni9CeTFlSHI4RTN1RG5KNEZYTDBBSXBKbU92c04v?=
 =?utf-8?B?UkFOQXBGVFplTFoycTYzQzJqSWl1Q2M1eTRyMzdyVUFVOXhvSllhUmhndlk1?=
 =?utf-8?B?RUE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94060008-5556-4e37-08b3-08de1bc4b427
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 17:07:58.5668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JIREe2PKHn5yooPbw6S7e0dKmycgZv6Js3uy7N4XEXvmRkc7BpfZNaj508tRx7LpImmUPWZchoYZZYH6DRnB6n2vou7sFPzvlDd5UUL50Gk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6620

On 04/11/2025 4:12 pm, Tu Dinh wrote:
> The LAML field should follow the TCG PFP specification:
>
> The TCG ACPI specification uses the field name "Log Area Minimum
> Length", but the field value is the actual log area length reserved by
> Platform Firmware, not a lower bound.
>
> Signed-off-by: Tu Dinh <ngoc-tu.dinh@vates.tech>
> ---
>  tools/libacpi/build.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/libacpi/build.c b/tools/libacpi/build.c
> index 2f29863db1..95188e217e 100644
> --- a/tools/libacpi/build.c
> +++ b/tools/libacpi/build.c
> @@ -473,7 +473,7 @@ static int construct_secondary_tables(struct acpi_ctxt *ctxt,
>              tpm2->platform_class = TPM2_ACPI_CLASS_CLIENT;
>              tpm2->control_area_address = TPM_CRB_CTRL_REQ;
>              tpm2->start_method = TPM2_START_METHOD_CRB;
> -            tpm2->log_area_minimum_length = TPM_LOG_AREA_MINIMUM_SIZE;
> +            tpm2->log_area_minimum_length = TPM_LOG_SIZE;

These happen to be the same number, but in making this change
TPM_LOG_AREA_MINIMUM_SIZE becomes unused.

I suggest we delete the constant while at it.  I don't think anything
good can come from having two of them.

Also, as it's no functional change, this is content for 4.22 I presume?

~Andrew

