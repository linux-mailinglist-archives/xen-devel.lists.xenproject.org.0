Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1E5C6AE95
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 18:21:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165233.1492018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLPNT-0003wP-CR; Tue, 18 Nov 2025 17:20:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165233.1492018; Tue, 18 Nov 2025 17:20:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLPNT-0003ut-9Q; Tue, 18 Nov 2025 17:20:27 +0000
Received: by outflank-mailman (input) for mailman id 1165233;
 Tue, 18 Nov 2025 17:20:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YPWA=52=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vLPNR-0003uf-Vp
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 17:20:25 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc8982f2-c4a2-11f0-980a-7dc792cee155;
 Tue, 18 Nov 2025 18:20:22 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH7PR03MB7390.namprd03.prod.outlook.com (2603:10b6:510:2ed::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.19; Tue, 18 Nov
 2025 17:20:19 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 17:20:18 +0000
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
X-Inumbo-ID: dc8982f2-c4a2-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T0fCLkcrmh597Bm25LP9zU5WokapQbHGKDxR6T2TUuH6EqdCLktizWl5EYZS5vWFhP3ENOhAjQrflWmCw3Hxr5rUvqafhM1ILQpMPONQ7AQYwHbiYqAoSgcEaD8CshF50Iy0reSC1MawX0cSBFKpBs9cy9m+lJUAh8fBjpKlbGi8laTKpMAK3I/195wj8B4wsOpJ1xOuTfmzVdK6nw+mHgnzBzhY/HasiT16nXV90NUUmpPKJpBEATUeIyb3RfEcGrwqbk9dPlDMwDoKv3duNhn2gAebMQ+QgXe27h1V6EY8/br8TpWQm2gXK+siDL9j2cDPKGcGjfZtGVmWs5R3ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICG434jSTGql+x6mA5EDDwlqGY7mqeef/la8+CiwL8M=;
 b=IGbaG0NlPOhnSRGlYjjy6NHSZSvCb6kJZGIto2L+RHj984M7ZKgufE04JITbUEVZK97233UR5LnAOR8oRfu1s9MdP3OnRx4VtQuxzbBAtRH+zYm2mlQHbQAVVvM8Hp6oyb+t2D52fKyXpuG7xCXbzMsBMIlrpFHcN6NVF8s1hR+q0kVhE8A9Ncy5eIuDpRHKS0plI/2x0VGnkmr+4q10F8FzS5vqLqQHmCRcSp8ccD84885vbf69PNEp+fVh7eRIG1bw278/F8XgOInkNoemff3Got/1ncquo871d4r8NjONNOCiva6/DgvXflffsHwK9I52PDBt1l1WEoTMK7O2bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICG434jSTGql+x6mA5EDDwlqGY7mqeef/la8+CiwL8M=;
 b=ltOKIT7dZACL7U2lNCTTBv+VvbLEQTQAL2tTK8TApZHPGMBF3buAEa+aGRQxvJRwjsCEdJJ2gL0PsYjGN4t64noBb5vlrXXR96MywBaBNd4nluyiyU5717hwbIubz+T7+8kqttlxakZAqW53S97jSgPavuq+goUlp3momEjiIrA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a35d9c4c-e76a-40db-9e27-3fd329ece089@citrix.com>
Date: Tue, 18 Nov 2025 17:20:15 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] x86/cpu-policy: define bits of leaf 6
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <53ef6c9a-1115-4bb4-bb7f-e2595ab9d0b6@suse.com>
 <b59c0994-6bb2-4506-88ec-4ea0f3b6c311@suse.com>
 <ab1dc276-2753-4a9b-932b-6cce3ee2b58a@citrix.com>
 <b3e43204-6555-49ec-8ae1-8c54e91b432c@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <b3e43204-6555-49ec-8ae1-8c54e91b432c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0338.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH7PR03MB7390:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cae7fde-f0dd-4327-2716-08de26c6bf45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y1l6NnlXc01pNitxT21yZE51N0paZ0FVbWU3aGcwTm9sYVNJUmllTHR3M1dx?=
 =?utf-8?B?SEVIYjRDYmtIbWpLckI2czFSbEp6N3dkNnBydmQzNm9WWUF5M1hHeGE5K1BJ?=
 =?utf-8?B?UFV6YlFUQmIwL2NxRlpiZUJzRC80Ump3dWZmMWRWa29rbDE0eG1lN0JiSVE5?=
 =?utf-8?B?Rml2Z1ozMG03VGxKanREczBmOTZLQU5ZSXNEL1VKTjJXdWF4N2FHNmdzay9l?=
 =?utf-8?B?VzFDSVdYNUduZlZuVDNBSVowS0Mzb05VanVwTmp1YUxUMFQ5cS9lbmRjZWJk?=
 =?utf-8?B?aitDaXJTSmZ0K3NWRG9meVJqMlo5SzdSa05xcVlVbDFiZ3lrZHJoR21QQ3FO?=
 =?utf-8?B?MkNydDU4SjlGYzkvQnZ6czQyUGthQm9pTklZZExxZ1EzOFYzQytEbnhNVnpJ?=
 =?utf-8?B?b2wvNUNOQUZIS0NBSVk4Q21NMkRPbmFHUjBPaUFJSm1mOU5IVDNTbE1jenRu?=
 =?utf-8?B?V0l3cUpmMGc0ejdBMi9VOGZDWWNFalpBd0E1dThFeWdZeHJzZGJCM3E5ZVBG?=
 =?utf-8?B?M0VJbDQzSWVhZWw4M0hWU0VFeGJGRzNaL2VOa1I1dXRrOGFNRDNnSlJPQTJs?=
 =?utf-8?B?SXVDUTJvL0lhNVlodTJ4UlhUMmk4NGhOYy80Q0VNME5NMEJlYllXY2VwWnlq?=
 =?utf-8?B?clBGL1pONlR1enlJWGdTUHRQMTR5eGxwMENjUHltemxwdzdtanJGd1YvU3Uz?=
 =?utf-8?B?SEdKL3haQTc0ZjErTnRvaURrOEdxS09ZaXIxb2tjT2FFc1VWbTlZeEZLR0dZ?=
 =?utf-8?B?cE9obEtiVHN3bENBQm0rZjZJc3NvR0xFb0w4czdMM0JiT1N0dEdaYUFEQ2pF?=
 =?utf-8?B?RDBCWlZhYXc5eFpDOVEvYmIremhmWEpGTy84YlNGSCs2RkthZGVwdy92M25P?=
 =?utf-8?B?aWtpR1hqaktRVXhHNWZzOXpKdyswT0d3ZEk2VWJCSnpueGNlZCtKa2dXbWI3?=
 =?utf-8?B?WlZCNlptQzFRTS80YU1aWURad3EvY2Zya2o5dW1JcUpGMldLZDNkWTNrNUp1?=
 =?utf-8?B?eno3RUNtd1VsMGFLVXRXV3BLS2d0QU1iM3BVUEVXNzlCSzNoVkkvQWQvQU04?=
 =?utf-8?B?Rnp1bjVoUDNRUGxPOGR2RHNnNGdWc1dsaXVMdjZJMDh1aThQSmRrU3F4TFZX?=
 =?utf-8?B?bVQrMTBWVVFKNnhBRER5N21ZTHRKWUtGTTQzTFZLbzlnVmJaL21xMkFkT2F6?=
 =?utf-8?B?UVJubHRtUG9LM3NmaVBaV0V6S3c2WVZNMEhKWklMT0JxNkw1alA0Yms5VlAz?=
 =?utf-8?B?aUFVMk1RbllRTUZNSVZDWEp4ZXVrbHhBY2dJOWJOcUhPRXlFNSs3RUNKRE9K?=
 =?utf-8?B?YUQ5SG9kN3NVQlhWYWlpZjFRK3diUi9SRHd1NFdyd1cvV3ByQlFLNk0wSldq?=
 =?utf-8?B?VGZpaDM3SllzaEpnSEg4RzlXUU1Oc3duY0g2cnM0NnFFNW9kN1hqK21Kb0Fa?=
 =?utf-8?B?Vmg2ZTZXUHllZVQwemhzMUd4ajh1VzFYYTVneFJVWjNxYVhKMzIzSFlhOUQy?=
 =?utf-8?B?WVp5dVo4ZlFZdktNc09TTk9mSVJCWVUvTjQ4eFhhTEdSOE1qckp6d1RRQ01U?=
 =?utf-8?B?VmlxaHlSMksyMGNiSVZzVjR4K1lKV2ZFSlB3WE5BM3U5QWJoYStJNnFZVTVY?=
 =?utf-8?B?ZXI1RU9GaXhXNFpLdm9GT0N2S2R1cWJWdWU3SUt0ZzNPbDk4T3N6alRsb0xK?=
 =?utf-8?B?T2RaSkZZOVZQWTJnbVlaaGhJSmZqNTBNeG96NG9wMjlZWnZOMXhiOWozSUFm?=
 =?utf-8?B?djFwWDc1Uk1xREdOeUxzditYVFF0c21SRW9KVXZkQ3JXU3g0cEQ3aVFnSGdO?=
 =?utf-8?B?b3lWRWRWUDA5Tll5a1FUaWJNUmJ5N1IrSWhzQWErY0pzMEVaWlIwODNIREVN?=
 =?utf-8?B?TFY0WURyM0hCUHJnRjNRNDhkbFRIVzJQeVhXT0tkZEh3SnhJUUJ6L3dZS2pK?=
 =?utf-8?Q?GC8HL80N8NSPClqysu3LojMcmobSD+dD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlhFY0NLMnA4UjRLbTJiTkJUUGQxZlZnQ0pwY1BtOFlDZXlRbERSai9kL296?=
 =?utf-8?B?cXQxK01QQnRUaUlIWkFmcXp6ei9ObTY2Tndkb01JUGtLY2NvYUhxS0RiSjk5?=
 =?utf-8?B?N2J0Qm5oRDJpTXcwQytNdDJMTXVxcjJxVUpJYUZsNUZXcHpLMFlkQkpRa3Y5?=
 =?utf-8?B?R0VDZzl5b080alJXSW1oNlE3dk1PTGFxb0l4STRtN2M2ak40MERBTSt2S1E2?=
 =?utf-8?B?K2xySHUwZ3VBNi9FY3VHWnMrMWsyT3pNa3RFTnJ2N3ROQ2JNMkxqN2NXallm?=
 =?utf-8?B?Z2wyVXNyMGhCRXJtSmkzUTlnNjVnQk13Y204REdPa1JFWmVkbmRIbGZLb2lz?=
 =?utf-8?B?eDRRNVFTN0VsUWYwZG5BMDl2Wi85akVLa0YyR04xaXBWZitxMG1NR1hXTUxr?=
 =?utf-8?B?M09WSlFrRXhlQjZTQ1RhNzZrZFNVNDFuZnNtdmJ2RkRTR2JsVHdDWlZJSExK?=
 =?utf-8?B?VjVwbnorcENhUnFPUXVLSzl6U3Q0QjlNM3huRWhQd2dNK1ZNQmRVeWE1OGJu?=
 =?utf-8?B?YVBQcE5EejJZWTFzUTJsMDFGdE02VjJ1eWF3TW83SThNMExBWGJNNzZ1NjV0?=
 =?utf-8?B?cW0vWVNVd3ZpQzRQMmhVRGM2amF3WENBUzIxcmdoWG02UVlneFhsaW9QSUpT?=
 =?utf-8?B?KzczbEpxY0VMVkdUVUpPdzR5Nkw5Y2JFM0lia3VKMC9sRGc1dE0vSHRoK0o4?=
 =?utf-8?B?dzdVTVV3Z3JzcXRrd2FxVXJtMVNreVhhSk10dGJmTzFmWGoyOW9QbTNpdEJZ?=
 =?utf-8?B?ZzR4d2FuUUN0ZHRlWFUyeVVUb2lwUVg1RzUrQ1lpVEVQWUFTZnpvQXdPWEVk?=
 =?utf-8?B?dEQ3akVCZ3kzMERvaWpiMEUvSy9UZG55OFZwT0lkaFk5YmFqeENqR3R4WDRp?=
 =?utf-8?B?THREOTJGTjNtZTdqejg3d0lNMnEwcVg4Y0s0Nm1wY0k2ajFyQjlhRXgxWVdI?=
 =?utf-8?B?YnlWL2xBY2JtUHIrNFpJZlJxYlQvRFcvK2ozSzl1M1dWY3UrUndRRitvYjdm?=
 =?utf-8?B?dk5TWE1iSTFkdUlsVnFyK2RTVnI5K3BmUVdxQWhLR2hIYnNMUk1nSm5iQ2Zh?=
 =?utf-8?B?bm13QzVnWUVYQjM1U2JTaHdQamtBQ3c2eVcrb3VoVVkvcW9sNEtEbXgyZWQ1?=
 =?utf-8?B?Qk81ZDc3enBOYUVQT29FQ2JXaXBKWENTT29Ed0NrYzl6NWZldnZwNDQvaXFD?=
 =?utf-8?B?c2wxbXBWS21HUDdQb1pTOGtEeCtMVXhuWTFwVzloN3UwQkpGdkplOTRJRy9p?=
 =?utf-8?B?VWlNb2wzY1UxbXl2cnhqV0hxWXJKWjkwcFVaaHdmOVh2UGFkVGZSd0d6NmZr?=
 =?utf-8?B?Tm5acVQyQ0xHV3orc2ViM1ZveFYrdHBndXZEb1hkYzZzTnN2T3RPK3E2R09a?=
 =?utf-8?B?ZS9iR0NySzBaT3VLR05DZmpPWWhpLy94OTY1MGcvRDJueFJPZkpqT3FSVzlM?=
 =?utf-8?B?NUlTeUdCZkwwTjZsZWlYSEpKcW5MNVBYTWljOElwZVNPZ1ZNUklwS0xxMEtn?=
 =?utf-8?B?RGpFYWs0MTg4VWlTYlJmSHdVTGptcE9IMHo0L3BiNmtlTGpWQnJrL2NIbHdi?=
 =?utf-8?B?MWlLNkV2S2tmZlZwUjlVNjhGUDR3WllieUZyTTlqbUNjdWVrUWV5WFN6M3hP?=
 =?utf-8?B?N1N6ODZLaXhRMTd6cWp6aFA1MjlKTXdDYWJUYnc4ZkZJS3hibWJrMG54VFhW?=
 =?utf-8?B?Q2luK2s4VUlnOVpLdklxYm5Hd3J4S05jYjFJYno1RjhvVDRWNDl6TWs4aVBD?=
 =?utf-8?B?eU5aZkg4L0I5VjAwNjgxenZNakFVeFZMY3pxaXNFQnVlWUxxZ1U3ZFhLa3Nu?=
 =?utf-8?B?U1gwUUh4dXRaTENCTnVFZEszbVJQRHNQUjMwUVJhZUEyQ2o3R3BLeEMwQ2F6?=
 =?utf-8?B?Z0JRNGZPV29HRk1RdXJING9GTWV3cGZKcWZqdWhLKzhhMUpvWG1SRzZzWURP?=
 =?utf-8?B?QWRVOTNvWGV2VUxpdmFaTExQZlpRTUQ2Q1hxWnAyL0J2SlFXYUhPZVQwVFBQ?=
 =?utf-8?B?TmFRdVhpZW9sM1d2SnpaZTdsNkJLV3FpRjk4RXNzdTVzakkvU2h3RFI0YmxO?=
 =?utf-8?B?WTYzTDN3WktlRzdXNUdENGRNMC9WMHlIdUNRSitsUzVxN3ZCLzBpL04yejdq?=
 =?utf-8?B?a0Zza0FObXdhbitINHIyQmVHSVZRS21vSTJndmlBZUs5S2U2QlBXY2pQSjc3?=
 =?utf-8?B?SHc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cae7fde-f0dd-4327-2716-08de26c6bf45
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 17:20:18.8292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /CPM2Jy0Tq3uKJteV+85jiWjxpTFp8Q8bYID1cJq+CVKhoZVJDq1qYFjgj+erZl5I99kLs9Se/1wySDnaO19ikpZ3D/F1uR3rk+adm7ehNg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7390

On 18/11/2025 4:53 pm, Jan Beulich wrote:
> On 18.11.2025 16:30, Andrew Cooper wrote:
>> On 18/11/2025 3:06 pm, Jan Beulich wrote:
>>> --- a/xen/include/xen/lib/x86/cpu-policy.h
>>> +++ b/xen/include/xen/lib/x86/cpu-policy.h
>>> @@ -121,7 +121,31 @@ struct cpu_policy
>>>              uint64_t :64, :64; /* Leaf 0x3 - PSN. */
>>>              uint64_t :64, :64; /* Leaf 0x4 - Structured Cache. */
>>>              uint64_t :64, :64; /* Leaf 0x5 - MONITOR. */
>>> -            uint64_t :64, :64; /* Leaf 0x6 - Therm/Perf. */
>>> +
>>> +            /* Leaf 0x6 - Therm/Perf. */
>>> +            struct {
>>> +                uint32_t /* a */:1,
>>> +                    turbo:1,
>>> +                    arat:1,
>>> +                    :4,
>>> +                    hwp:1,
>>> +                    hwp_notification:1,
>>> +                    hwp_activity_window:1,
>>> +                    hwp_epp:1,
>>> +                    hwp_plr:1,
>>> +                    :1,
>>> +                    hdc:1,
>>> +                    :2,
>>> +                    hwp_peci:1,
>>> +                    :2,
>>> +                    hw_feedback:1,
>>> +                    :12;
>>> +                uint32_t /* b */:32;
>>> +                uint32_t /* c */ aperfmperf:1,
>>> +                    :31;
>>> +                uint32_t /* d */:32;
>> Elsewhere, single bit fields are bool foo:1, and these want to match for
>> consistency.
> Oh, yes, will change.
>
>>   In particular using uint32_t:1 creates a latent bug in
>> patch 8.
> I don't see where that would be.

In the printf.  %d vs %u.  Latent because it's ok until bit 31 gets
used, and then it's not ok.

>
>> One problem with bool bitfields is that your :4 needs to become 4x :1. 
>> Right now his hidden in the macros that gen-cpuid.py makes.
>>
>> Given that b is of type uint32_t, you can omit the :12 from the end of a
>> and leave a comment.  Similarly, the trailing :31 on c can be dropped.
> We have these in many other places, and omitting in particular the :31
> would also feel somewhat fragile / misleading. It'll need to be
>
>                 bool     /* c */ aperfmperf:1;
>                 uint32_t :31;
>
> or something along these lines.

This doesn't work.  A gap of 31 bits gets inserted because of uint32_t's
alignment, which is why the suggestion to ignore it does work (even if
fragile).

I suggest a /* 31 spare bits */ comment, because the only other option
is 31x :1's.

>
>>> +            } pm;
>> Nothing else is sub-scoped.  I'd prefer that you drop the 'pm'.
> Wouldn't that require the use of the very extension you just talked about
> at the committer's call?

No. It would just be a plain anonymous struct in this case, but it
doesn't even need to be a struct.

leaf 0,2,10 are all "top level" insofar as they're all inside .basic. 
leaf 1 only has anonymous unions to join the the bitfield names and the
field-wide name.

~Andrew

