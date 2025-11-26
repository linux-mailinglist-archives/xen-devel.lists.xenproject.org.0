Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06799C88998
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 09:17:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172350.1497428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOAhq-0005Jo-Hp; Wed, 26 Nov 2025 08:16:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172350.1497428; Wed, 26 Nov 2025 08:16:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOAhq-0005I1-F9; Wed, 26 Nov 2025 08:16:54 +0000
Received: by outflank-mailman (input) for mailman id 1172350;
 Wed, 26 Nov 2025 08:16:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wUbM=6C=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vOAhp-0005Hv-6h
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 08:16:53 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fde831b-caa0-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 09:16:47 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ0PR03MB5838.namprd03.prod.outlook.com (2603:10b6:a03:2de::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 08:16:44 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%5]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 08:16:44 +0000
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
X-Inumbo-ID: 3fde831b-caa0-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=px1jTPRgQxohkjDYTbc3bYyK5hVoFC662fBth/zyhmHF8t1WbvSlBM48NDcP3WwAWoYkso2hsQTJfJKZ30FiSu9AAkWwA5mStKvI6+50VtlvKZMVgdONZnLbUDcYbUHdNxaIxS5IngAQb54T9LhtAi9M8zGZaqL6IBUPt+tExOOeDD88GHO6kESAB1G4Az+c6dprS3Js42NryLClalJh4QdRkpm67Fr+JI2E0QxKCQrL7RiuSvsO0TuKz4UOuIIfurSIlrUYpUVpHIEh1XfVGAXK/uSFUxGigVJLK7jp2pEQz3N/b0+psJN6pWpsXVfirHn8XzXusAOtAdpWiUhQTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nN9FU3YhwW41N/ZD5R9CGRBkchKUcXTc79nVWn3IZwQ=;
 b=rNkDzL7imVEZ02SvAnSdEz22qeoL493pA3ihy3CHxEVi8b98Nq5SBsniGkJL/oASm7RYWV28rCkmDhEDOlRYiNyKIKyZvvSrPGTaGvYRZMa/D/bdZ/ZeHhb1YBFqqMLXsEUhT8fyQuWzHraqrhLQaWpk45i2scv3slX1oYa5OLQfQzgeIq1NllJ9RGnfeZZn86cUviizpVKCrg5YfWodk03kgctb65VvE8RJoa5TNf6OM07f+aLuodvUBq0hWJ91SGTOVumcQ5MwOO7SIBTlgp5JOWuv2N5vPJL8euAWDM4qIMkjAeQOBZlic5I7c1XcoSJYz7RVarfmdsBfsHRHAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nN9FU3YhwW41N/ZD5R9CGRBkchKUcXTc79nVWn3IZwQ=;
 b=pGUax23u21zaiDE8Z3y74oBDlmXwlOvUqcitpMJxK4Y4hLv/bAiLwKvxcjt5F5G9FqdiC/w7o0OISSqHP453siH8yDokVkUdaYgRgFD+sqAgOfDs/h2019HooQNGkUiBpAwdW4hLeakzvBnJYSbrXwE/Ykb7ZTr+DchWGbDMVt8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Saman Dehghan <samaan.dehghan@gmail.com>
Subject: [PATCH] xen/linker: be more selective about defining LLVM_COV_*
Date: Wed, 26 Nov 2025 09:16:17 +0100
Message-ID: <20251126081617.45401-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PAZP264CA0209.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:237::14) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ0PR03MB5838:EE_
X-MS-Office365-Filtering-Correlation-Id: fc2ef1d9-77c7-4b30-0622-08de2cc42289
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OTUvbDRUWWlVeWJYTU4rbzlkRG5KT0d5T0lFbk1GOGlaeS9DZlB3Vm1WeVVh?=
 =?utf-8?B?VjRWbkRBQnR5djhiMWIrKzlFa2Y3RmQ1ZWJ0bVdxV0hSdUpJd0dLRzZGdk52?=
 =?utf-8?B?YWdUb0ZWbHpJV1htdkhEdzlVdmx2MGRxTk5zZWQvU3lwcXM5VVY5ZDlCRk4w?=
 =?utf-8?B?NHZVTU03MTV4ODB5Ym01K081VUdyV21Nc0g1Q20zajcvdzVjRWJaS1RYL0Fw?=
 =?utf-8?B?ZEw5M1VzekxQWElZTllVWmEzdXhzYVNIQU4xWmxqREpWSDErcDFSVU0wV0Vh?=
 =?utf-8?B?d0p6MnFwTXhRMlNlbEJjbVdjdWQ1ZmNGcDJsNDRPRFVZdVRDVmF5aWUxaHFv?=
 =?utf-8?B?TXIxVlBLT29PdEQ0UGp2anVlZFRnWTIweXQxb1RvUzdmSnovSlBnNXJPSUY1?=
 =?utf-8?B?T3ZHQU5lcTNLS3B6SHVqSjc3S2N6NU1NR2tnL2hqTzRhSkRHdVRhd2hBWGpE?=
 =?utf-8?B?bnNCK081REtMenFnU2JTWHJmbzVxWlMrTS91Y0NEd2t1UmxZL3RSK1FhQnd0?=
 =?utf-8?B?WWVXVjJzUEJ2TTVFUUVDLzlkNkw5K0d3NDJ6YWJ6TlN5dnFQdU5IdkZKNTNO?=
 =?utf-8?B?eDlhSWRQNkV1RmdNVWZRT2NPalJhakVZS1FzOVI3MldsODc1SVg1anJVUGNL?=
 =?utf-8?B?d1N5eU5kbUJ1a3FNWnp0djFuMVpjaG1TaVZaRHdJMkZBV09qME82UTQ4Nkpt?=
 =?utf-8?B?MVArSXpjNXRtM0l6dUNJUGxDZXY3Y1d5bFR2R1gzVURad29OMy9OYzZtMFZ3?=
 =?utf-8?B?WENuckxPZTRIdVl4TXFBNVdiU2VqamliMmZjSk9LVVpaZ2dpd2lUMVNmczdm?=
 =?utf-8?B?QU5acncrTHh4U3F2bUt4ZGtLZHZXL3lWUnB1Y1FrdzhZd09ML1dkZ2xFQ0th?=
 =?utf-8?B?TXdkcUIyU2V0dExkdUl3TTNzK3FjM0NDWTRncWowQzZlbDZjSzFCMEJucUZC?=
 =?utf-8?B?MEJReHZFZ3hFMzQrSGUzeVJwUTZGTWQvUXQzOFVwZiswNE9DenkvQzllbWlF?=
 =?utf-8?B?bTNEN3VWQUpUVS8wOVM0MFpkQ2tzeUZDK3lwQWpBNmxqNzBVQjQ2OEpDL2J6?=
 =?utf-8?B?cmg2eUJtVE90aHVUUWQ5dFhqQTBsL0FkWTlHRkljYnd6ZXRTRi83bzdUeFZi?=
 =?utf-8?B?Z1I0ODFwYXNsRDR4RDFhTHlFVnpQc1daOUlINFVpcEdtekU4VXlidXB3eS9G?=
 =?utf-8?B?d2JTaG1YeU8yeEhCRkpJS0J0bGhuS05XS2JVb1EzMzhkWjFjSDRXRTRhSmkz?=
 =?utf-8?B?WU1EZ2NXVTQxQ2JRMmNoTnJNeDlDeDFISzZucUdiMWFqREdtaDE3WGlxdUhU?=
 =?utf-8?B?U01qQyt0MTc5UmEyQURhVXpkckMyMnkxNGpvSWRlVXFRMTNIcjJsR242RlpS?=
 =?utf-8?B?WWx3WkNqZGRpUmo2QzBXSnBVaUZ6Q1ZLU1NMT081cXd6T3o3SXBrMjI3bUFm?=
 =?utf-8?B?cEhXajJZWkNOemFNdisyTk4yOFJWdytBVklqWFpJMG9MRXhMZWMrUmVieE0x?=
 =?utf-8?B?a1BEK0dSeWk2QVZOdTlnZll3d3pyL01rbm0va3FzcDc5NTA2dGJNZlZmem9q?=
 =?utf-8?B?UERHQXRQdVdVNlZZSzRxNmVkU3FCSEI2VlRqTDNKVWdXUGErRWNPK1ErOGlv?=
 =?utf-8?B?aFBzNGtPcTZsMU92WUNsSXhOT0RuVnBZa2NlZjZPekJaZWxlNFh4QkFQUlRy?=
 =?utf-8?B?c1hrcTlUQm9Bb3djVkE2cVd3M2tVaVlUODR4bTc1eHBJZ0J4M1k4K1ViMUxH?=
 =?utf-8?B?N2tOVTQwRyttT3hiVk12Q0hCWmxMaEg3OE5kMU4zNmpmTC85R3FRM09RL0c4?=
 =?utf-8?B?QytqeTlybkR0bXVRNkZ6aWhPQzlWbFM3WHpMQkxYaWltM0VicmUyWVdrMzZY?=
 =?utf-8?B?d3Fqa2ppdktQcE1rU1Z2dFNnL2hFV2RFU0JBY01XaGFHZE9KMDBGQXVodyt6?=
 =?utf-8?Q?ML+lgxiSlxZIYW8ck3ffsgHa7lK3JAQ/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVZCWGFWbzFnOTVscDg1dGxiWHJVOVJUQm5OOSs5T1BsaENWUmVSNmRLY1ZK?=
 =?utf-8?B?M3RocGJwREVPQWJWNEh1R1dUbnBOckRSQURHT1NsbkszMUtOcEhvUVBhQlFG?=
 =?utf-8?B?MUdFeXA1Qm5FSkM3SWtQTHplejJxT2hQczFqSHF1NlVFNXdnM2NxUnV4TCt0?=
 =?utf-8?B?QysvWHdTMkU1ZGRCZS9iZ3hJMUIwbXIrWG5yRWducjNGcWhBQmpKbXZBY0kx?=
 =?utf-8?B?VUhKTnNtTzRwZWg0ajRZaFdZcFBxa1Y2S3hBM1VWYjZ1ZFU5dFRYZGtqTktr?=
 =?utf-8?B?QVNVMmxQbVRNOW5FYm8zamMwQVg3NHBlMWFzem9SR2J4VSsyMnRPbXBXVDhR?=
 =?utf-8?B?TUpBWVh2alFROEV0MVkrNjJEZUFyaVlBcTAweWNtT2dLczlmdGF3eFBCRXZK?=
 =?utf-8?B?Sjl4ZDJzc3hlNzFLNFp1L1JEeW1uWFFTb3E4M2ovc0crSDBIRnlCMVpveFdh?=
 =?utf-8?B?QjY1QlpOZGJqT1o1NU9zMytXYWpTU2ljWG1DZC8rRmwvdmpHdlNjS3hGQXNy?=
 =?utf-8?B?aDN2Mm0rVmdmVUtiOElEU0RXYkNpakczUElxMG5tbG0xb0s4ZG12WVJhTWJI?=
 =?utf-8?B?bHgzdytyK3ZqR3AvVWZFWXZvNVh1YU1XSURnRzVFVFhGb3hjWVlBNkl6UWtu?=
 =?utf-8?B?algwZkN4TGJYVjFwSi9JT1FTMytCeXJldUxjRnZOVXpmSmZPVFQ2WDc3OUpY?=
 =?utf-8?B?NkorTy9FR25jVUw5Yk53R1FTY1BTTkRZZkE1WkFRUGNUcUNBUjVGajIrQnFM?=
 =?utf-8?B?dVhFQmEwSSsxb3hCRWxDbEVoY3A0Nmk1RTJLbjFERFF3RjBJdnk1K2RKWlor?=
 =?utf-8?B?R3VUYWdNMVo4SmkveXlxclhKV015bXdwbEtFb1hzb3pBNXBOemV1eUVRRXZz?=
 =?utf-8?B?QU5ldmtuc2FJdC9yanpoOFV6dU5GajlBbTRqdGsvbGFvamZwTThseXRBQ2h2?=
 =?utf-8?B?Q3UwRFJlN0JWMWhDVzlSWnlXdDhzVVZ2Rk5hd1VlTE54V2VsRXZBd3ArTFRX?=
 =?utf-8?B?QXVXeER3My9sRFgyLyt3Yi8wWU9WWWhmWVlIM2RGL1VYOGZ4VTFiRGtEMUtt?=
 =?utf-8?B?RjZyUGJ6aGJRWkFJUDBSZmtac0xvRmFuYmpPWlBLbjlYYjRhai82Rzl3NVds?=
 =?utf-8?B?dEt2RXhlYXY3UTVUVW9ETFk2QmVsb0pZU25vbkdlQzRJRlp6YUE1NzI0c2lE?=
 =?utf-8?B?UGJYZkNiR3doWHVjczJLdkpOTGJraHkva2lhckUxM1d2Ly8wSy9IUktEZ0xw?=
 =?utf-8?B?NmVWb2hGTjlwN3J6U0Rvc2w1VE5mM3VmOU4xQVVyUlE4dU16ZG9LUm40cVZU?=
 =?utf-8?B?UzBzUlY3dE1CVVFQNEE1NHJWOC91VlNBUjQ1N3lQYk5INUM4NFU5YkNtQ3Q5?=
 =?utf-8?B?ZlZlVXZSMEMxRUVwcW5GbnRmc0llVHk2MUF3blpuaHFlTWFRMmY2c0JFS0lT?=
 =?utf-8?B?eC9qNUN0WDBsS0E2dXFoZU0rTFRWTm5VQ0hJSHBpaG54d05rdjdyeThjbXhU?=
 =?utf-8?B?K1ZpMUxYZEdiZVJhSmdvb2l1VldCaTdnQnpHZzZ5TC82OWJCL25OeG5GV3R2?=
 =?utf-8?B?dDhENHFiYmNKZTZIRWJoZFZ2bWNpRTJBdE4wa3lUTnR3QTFHRGRTaEpteVda?=
 =?utf-8?B?RDFaYmFrVDB6Yk9KVktnMUdoWFNOYjl1UWIwYVVwSkZCMUk5ZklPRDErU0VB?=
 =?utf-8?B?TU5Hd2x3Yk9walFteU1WMzhrUnI4RmhhMFpkZ0R2TTZCUUtSSURsSjBzSTJi?=
 =?utf-8?B?UjFvUWkvUmVIaEdBbVMzL2xqZ3hWLzhpb0YrV2dRMDlZOS9sWFF6NDM1YTRa?=
 =?utf-8?B?QUZMN3R2UldhNUJMdFdVR0o5OWxjZThuQmhoSjVab1AwT1ZDT2Vqd1AyU2Yx?=
 =?utf-8?B?Ukdlc092bVZ4aGRBV3g4NThsNjdpb09SUUZUY3lydnlzUGJncG55QlZ5VGtl?=
 =?utf-8?B?VFVDTnl2eFZhT29wVUY5em1zUmFQazBPRUVNVUdWdW9xUDhDS0JZVjBYWDNn?=
 =?utf-8?B?TUhFTWRBc2Z4VVd6eEloN2tUTU9XVXFSWFhadnd2VFdrS1FsdFhGV0M3R3Bx?=
 =?utf-8?B?b29HcDZlRVNPc2cyQXY5L3RLcUt2bWJNRWJ0Qmw0UHFFSU8vV2hOWThuQWFp?=
 =?utf-8?Q?mGXb8aJ9bjTOwm8OgGifkZhXq?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc2ef1d9-77c7-4b30-0622-08de2cc42289
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 08:16:43.9748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: liJpVIPKWoDXj0EJ7fjrt1th+FAJAj2zS56QD5R3/WjstkDgXYRNV9ZhgBOheY3Z/bqxdZR+G4N7I3rUr4KDag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5838

There's no need to place the LLVM coverage sections in the linker script if
not building with clang, or if code coverage is not enabled.

No functional change intended.

Fixes: 186c02e85961 ('xen: Support LLVM raw profile versions 5, 6, 7, 8, 9, and 10')
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/include/xen/xen.lds.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
index d80c89595979..f54fb2d15290 100644
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -81,6 +81,7 @@
   .stab.index 0 : { *(.stab.index) }         \
   .stab.indexstr 0 : { *(.stab.indexstr) }
 
+#if defined(CONFIG_CC_IS_CLANG) && defined(CONFIG_COVERAGE)
 /* Clang coverage sections. */
 #define LLVM_COV_RW_DATA                                   \
     DECL_SECTION(__llvm_prf_cnts) { *(__llvm_prf_cnts) }   \
@@ -93,6 +94,11 @@
 #define LLVM_COV_DEBUG                                     \
     DECL_DEBUG(__llvm_covfun, 8)                           \
     DECL_DEBUG(__llvm_covmap, 8)
+#else
+#define LLVM_COV_RW_DATA
+#define LLVM_COV_RO_DATA
+#define LLVM_COV_DEBUG
+#endif
 
 /*
  * ELF sections.
-- 
2.51.0


