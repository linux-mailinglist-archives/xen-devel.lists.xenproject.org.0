Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C12D7C5D544
	for <lists+xen-devel@lfdr.de>; Fri, 14 Nov 2025 14:25:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162668.1490227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJtnA-0000Z0-CR; Fri, 14 Nov 2025 13:24:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162668.1490227; Fri, 14 Nov 2025 13:24:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJtnA-0000XC-9g; Fri, 14 Nov 2025 13:24:44 +0000
Received: by outflank-mailman (input) for mailman id 1162668;
 Fri, 14 Nov 2025 13:24:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Irg0=5W=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vJtn8-0000X6-Kk
 for xen-devel@lists.xenproject.org; Fri, 14 Nov 2025 13:24:42 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 459e38b3-c15d-11f0-980a-7dc792cee155;
 Fri, 14 Nov 2025 14:24:40 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS4PR03MB8132.namprd03.prod.outlook.com (2603:10b6:8:281::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Fri, 14 Nov
 2025 13:24:36 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9320.018; Fri, 14 Nov 2025
 13:24:36 +0000
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
X-Inumbo-ID: 459e38b3-c15d-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=emVDBphZwUNe60tTFFON+CSaNf053/WtU/BilcZlIGeXRXecDQwD76/RwMtdLeBxQCEeBMgXxjjlkttl45m1pGhbK/VRj87C7D0IWc+TtVhJGe5DX4Q8JB/zgj0kq2b5EIG8Ar67rgwc24/MeLX/XbC37m2aa0htQQ7meX9ihFd6Z6RnML+umTLLkET3hQLWUTkMYD2CWdFeSpIcADvFMYl5YHirrC7AZp1K+5ePP9aoAv6jhfWug7ClXmkOY8NOgY+OowuFT4UPg4U6szAr27VyseZp+yoka1vqDDvoAQNfMLsBS18gywLGG3Do/+4Ro0p94LAECi2KDfAqCHNHKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PYNCRcJ5PwEaNgW0xdKz4FQJJfGCSSWx3K+lYxabLts=;
 b=AT+6+FxxQSD6kaChjFpD0ssbegiW/sJHLllD9tLx1WPCW2GX1qaOsAUap575m4ozxF/DH5hnVnj3Nq7CtPQTwAfimBdLSuMXIN1k7MgPdY1QeAHUSDM/vrP3848F4RwLaGWJMI8/SScYmNECMGmg+ojNop2X9Yq0bN9ZMIfyGx2YUJGa2HiBDIVtbNIuNPvCZyV4TVobXnGSdYZZu/YVBP0zGtNkG5xj7e+nuCQyqkKGxBmP15a9/eeCHkn0sF1X/WVhPJKAKcgk1MG2wf55YUrQ00UH4r1LqCNaLCG1owc+7C2W3djhl/wBnAx2AwccWlR6XxaQhFd8YT98A0YFfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PYNCRcJ5PwEaNgW0xdKz4FQJJfGCSSWx3K+lYxabLts=;
 b=YtkLjiEHlgi73cWeGdJt/Ay1ki7ZLttengatV+/aUFjXLw3HMYtiFw0YPr6sgjbbZOO6C4XDs69HyKpXmNqzP7FxYmPrPOg0+cesQ4YN/TZD09XJiNXb/bpRV7/jnvMKUHPYTXPMhni8DBFQmY9OiZBfaATeP7rziiuXOa/SFcc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c8070338-8522-41bf-9402-229e2369857c@citrix.com>
Date: Fri, 14 Nov 2025 13:24:32 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ioreq: Assert with out of bounds vCPU ID
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julian Vetter <julian.vetter@vates.tech>
References: <f4146ec2fa354ab6a64d96eca831fe0be97f281b.1763124998.git.teddy.astie@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <f4146ec2fa354ab6a64d96eca831fe0be97f281b.1763124998.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0352.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::28) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS4PR03MB8132:EE_
X-MS-Office365-Filtering-Correlation-Id: 1acf7679-e613-4f50-375a-08de238127ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OUxRRitYcUZsZnJsa0U0Qk85QW54aVBJZGZZckE4WGN4MkJyY1hHVTdWeDEz?=
 =?utf-8?B?OVFCa0FVMnBndGVVZ3R3NUN6ZW9qZlhUTEw2cFo1OWVkek45R041azF2SzFW?=
 =?utf-8?B?blVwajlVSlhWbUVpNEpOZklXbWthMlh0dW1UQjh3OGlRTWFCWmNtYnZzMXdn?=
 =?utf-8?B?UDF0YS9yQWMzZkRndFJ4QlBaeGtyeVNpWUpHeVlNeTNXVmk1MEZqbUxxUllp?=
 =?utf-8?B?aTd6U2V1R1k2ZW5pWVdGR3EyOVdGc1o0Tmo1VHBqUHZxVENwT3Z2VTJsVE5D?=
 =?utf-8?B?di9zZXFYWG0rVk5QWlNBbDNoVklEVVhmSXg0dy9OcTJ3czRvdGU4eHVsT3VG?=
 =?utf-8?B?YlBrKzM5dGNJdk9wU3B3RXFsT0hZQXovSzBzQmIyNE13dWN0M05RMHlqWlB1?=
 =?utf-8?B?czd3T3pGcjN1aEovZ0RFTWQ4Z1VLYllqVGptbXg5NldqVko5N1BxS2UxQTFa?=
 =?utf-8?B?a01XOWNrbWZha2hqTmo2S2hTdmVXNE9GekpZM1N4by9lTDkvd1pFWXR0R1FZ?=
 =?utf-8?B?bXhRdzRTdTRKMFI4OW52c0F4bGNUYU8vTTQ5Zng4Y1JiTmZZVHZMSEtUNTVj?=
 =?utf-8?B?YXRCNU96T294OUtvTlNxU3B5aTZRKyt2TkdDTk9LeGpjdEgwVm84UWROUXBC?=
 =?utf-8?B?MEM2bzZqVk80QjRiUnBpQmlzRG5GNU5LSU9YTHNtOFUwMUIzOTJGRUlaSXIz?=
 =?utf-8?B?ZWU1VGo4NkFCUUprNWF2WmNTRjQrcjlKVFVyNk54TGVNYkpQYjRIM3BOcjIv?=
 =?utf-8?B?d1BlcWZJTXJVQVA5bCt2QnFSNkNiZGRZVGczM3JpMzNEWVV3NHdIUUM0cGk1?=
 =?utf-8?B?S2g0UjNOeFI2WHl2L0F2THJlQkIxZnVlWnluN05mK1pzZEdPeXJjL2lDTFE4?=
 =?utf-8?B?Q2h6REI2bStNOTExMFVCSVpZMnNZVFR6SytJbVlLZCtOWExzTm9sVk1jNFIv?=
 =?utf-8?B?Sm45SCtvZy9vYythcldiR2FmYmYxRHZMSi9aVW1TcWM0eWFYTDlDeFp2L3Vh?=
 =?utf-8?B?K2wwUDlqaFAyL04veU52UmZLcksxeC9qbElRQU5CdE9kTndzTWwvSUVWVDZ5?=
 =?utf-8?B?ZDdCY0dnVlp2Q3ZONG9wMVBtSEhhK1hHT1BGbTJaVDFwaHJqMkp2dEpMNVcy?=
 =?utf-8?B?MHdQdzNEVkN6TXVjWFp4cVM0WC9OWnNhR3NlSVpUMXFFS1N1Y05KNWN5a2FQ?=
 =?utf-8?B?dklQM1IvS1Q0SDg0eXZsN0VvYTV1RGhQQTJmbHVkcGhhbXhBeDBFaUp4RHp4?=
 =?utf-8?B?cUkxTkU5VnJtRHhpVmtEcS9MM25JeVlqUVQ0TGw5cGRxOFBFU1YzL0g5QVI3?=
 =?utf-8?B?elJQOHZHY1JFRFByb1BYd2VhaEV4b2g2UW80NlNDTThJQmxrNFZuOUIzR1h0?=
 =?utf-8?B?Zi9wT3NQWG94VEd5QXdSY1BhQnUrRWtxVHdSbmxxNThZME1OTElRL2l4Wlcz?=
 =?utf-8?B?OGMrN0p6U2JaSTczZ0cyUkxlL0FvZEY3S25CV2VhdTFYYjFXT1hPaUQrUTdu?=
 =?utf-8?B?eDExNW5xZ0J0aUZETTR1SGhFNzdWSU9mNHdsQ1RubktpUEN0R2JBLzdiTVhm?=
 =?utf-8?B?bkc1NWdEYkVQbDNKd29rQ0FsWWt5R1hNUm1MMmV0VG4yOTlFREpxVnd0d3Zl?=
 =?utf-8?B?cmVtT3JxbFVCSGJSY3ZjYmczQ3d2c2RtbXk1TUhUaFJxUk9FSUhNbEd2VmMz?=
 =?utf-8?B?a3A0aWw5ZWhoamRQL24wMVBDMnVHOW0zc2Rwdy96UEhUSW5kYlJPQkpURHFL?=
 =?utf-8?B?dDdSeTBUdXdlSGxrVXRCRE4wZ2JOS2R3eElnWUVWejV5QzRrTXBQZktMY3Zu?=
 =?utf-8?B?ZURyUW5SR2hqRWh6L2RlYmJmM3AxbUx6dm83cEs2SStPdGowR3pCSjAxQXNV?=
 =?utf-8?B?YzZwb1ROekFrekYwM1pwc200L3hjTnJWRDdJN2d4cWFCSm0vZ2NDTmo4blNJ?=
 =?utf-8?Q?8ufybbg4WgQeNTW0OGOShIsOA2zeK0B7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUFqZnp0VWR0NnJaZm96blZMYXh2VVJoSXhwbG91amRJdElpY3ljSUtpWTR1?=
 =?utf-8?B?bFhDNjhWWCsxOW9JbytoOEsvRDc1SzdnS3gyM0ZSaHJpaElxN1VsZndrM3Z4?=
 =?utf-8?B?UnF0TGNOTitySWZjNkhvOWtWcm9vYWpxTmp6YmFHc3pEZjVDZEMwMHZERTMr?=
 =?utf-8?B?bWluWUJNSS94UTlUYnBQZzlJdnY2Mm1YUFNzN1FsSTJmOVdjODNVSEhBMHFM?=
 =?utf-8?B?N3BaT0NmbzBaNFMvUmltTDNHWWJDMWwzNXduWGtOV3M2WkZyUEFJdGVPUDRS?=
 =?utf-8?B?U24vZTB6RmpYK3hvTzJ3b1VQSmw1UUtReHVQZXd1OU9UUHYrZ2hrWmsySXds?=
 =?utf-8?B?Z3pIWDA1RnVTWkFHL2xaQXBPcWNhVHZxSHBqRXZQQ09ZR1g2T3pva3NrQ0Qx?=
 =?utf-8?B?akpsWURRWC9Gc3BiY2xOT1JLdkk4SGZXTUl2QS9DMkNnTFZlVjRyb2EzUUtk?=
 =?utf-8?B?eEZYVUcxL1lnbDhXU0NOdWpud1VrazBRNCtRMzlaYkpCV1BTTTd2Z3lvV3hI?=
 =?utf-8?B?Y1pKemttT0lYcE5JNjR2T1gxK1hxeTZkSFQ1SDloOW9xSzE0QzNxbmhvZWVJ?=
 =?utf-8?B?c0M0T1hsMWJNekMrLytUaEdGWnVZOU9tdFJkVnY0RkVXcmFwS2I0WW12U05M?=
 =?utf-8?B?ZytKalpVU0IrNENQZUJvUzNRc2g2OTRxdmV3dE55Rnp6bTRrMWdmZTYxTkJu?=
 =?utf-8?B?TmxyN1V6cEZIdzFlSUtMdnkzbW1hYkx4Z0VFL1RzVFBrdThiaTVwU21DSHBj?=
 =?utf-8?B?UEhxRjNxTTRwNFExQWMrTU5QUGREVEpISEwyMGQrZGs0bkswWTZVcGI1QUdP?=
 =?utf-8?B?b1doT001YXJzSDFaYnk3cTB0VXpRd3VORFJ5c25Ta1dOTkpOVmJCTWJLL0lr?=
 =?utf-8?B?WmtwNlh3NVkrTnBXUTg3ZTQ5QVZHWVFFdWFseUU1WVZjOTNmcW43OHkwRnl2?=
 =?utf-8?B?dWRSUTFPdEk5VnpxaGtXbVhicFVlMXNGZ3ZNc3VpcVNTeUgxblhoejd1SGR3?=
 =?utf-8?B?MU9mSkFQOHpkSEs0aHNwSmNHRkJXVktoUXFhOXRISGxVd0JvOGN3THNubU9q?=
 =?utf-8?B?K09XNlNpSTd1Uk1lZTZMK0VIcDZ3Zmk4eEkrY1NoOFB6T1hZc3JLclFiMHFC?=
 =?utf-8?B?aGxLQXVCK0hNYVlmTkl6S21uNEJHQTVzOUxjaVQ4U292MXhJYjJ1Zk9ibkVM?=
 =?utf-8?B?SVRnUjZRa0Z5cWZtR1kzc29LT1R5UzhIWVhqdVQzaUJaaUZwSkV6QXJZUzNp?=
 =?utf-8?B?eDNUOTM1ak12OWpSZlBZSFNiYXRBT0o3MEYwM293dlMwL3loOGdLTDhTRG1D?=
 =?utf-8?B?RnhTNkhha0ZrVTVaTmc3OUdPRGdXQWdIR3g3ak5FcnNTU1lYRGgvRnlielhO?=
 =?utf-8?B?RkR3dXJwYldKVUFNN283cEhUY21sbzErN24rK3hEQ1AxTEZRTmtEcDBJTCth?=
 =?utf-8?B?amdqam5UdDlNOGVIaGtxbEFnNkd2S3doMm91Q3BTVFNVWUxWOUNyTytJV2NF?=
 =?utf-8?B?eityR0pnTjdERlN3c3FldGpNd3h0QkErdXlEK0hkb3RWUC9aTDRuaE5rY0Jt?=
 =?utf-8?B?aTgyNEdadlhhdXVmcGpxQVFtYnNLWHNId1Btb3JMNWo4NFcwa01VdVZhKzlv?=
 =?utf-8?B?OUdPdlBxTFJQTmp6UVkrR1BLUXh1QzBMYjBRb3pwU0RsWG5lZEw4Unlod0F3?=
 =?utf-8?B?N283WGdXWm9yTG1wYU1ZS2lzY0N1czUyWlhPR2pjcVBRZGdaUVg4aG5sWDBJ?=
 =?utf-8?B?azVGZXdLL2lxaG93OE9BaFA1c3BiSy9DSFdLS1hxdTJUamhPcE5RY1dmL3RR?=
 =?utf-8?B?akNpNng5Q1UxQWhzMUhXSno3QzRtY0tjRjhBVVZ4R2lWSE5rVGdYSmJ3N3dp?=
 =?utf-8?B?b0xSdG9ucyswTnd2RDJpTnQ4clc4QU1pSlp1TzJZNnJNR0dISTdPMjFDbGp6?=
 =?utf-8?B?dWhkeGE4YW1BbVFiSnN2dHRpLzZKYnJ6VUFYZlp1andkUUVwRVF2N0txZXFB?=
 =?utf-8?B?eW5xVTB6UVZNdWdzR2d0MDdGK3RVRkNkVzhZRHRXMHJib2haSlFVNGVsc0d6?=
 =?utf-8?B?Z3NxdlBVQTRWM0o4Zlg5ZVJUa3htQ3hDZVo2dXp5WE1FNGtWRlo2aWtqdTZk?=
 =?utf-8?B?UGhYb0k3YkFaQ1NnWFp1N1UyMlRHRjBkeTVtSDZxSXliaVlXVmhRT2NyckxW?=
 =?utf-8?B?S1E9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1acf7679-e613-4f50-375a-08de238127ee
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 13:24:36.2596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vrRmyIuPqeJX6R2k8CCsWGpkDey1ut+Fv6v8NdLPbk5kut55EUtCCl412W+pOhnrmUOdPswqP1giunNBaxwg+kv1rjn2++WyZEtQIkKgukY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR03MB8132

On 14/11/2025 1:05 pm, Teddy Astie wrote:
> A 4K page appears to be able to hold 128 ioreq entries, which luckly
> matches the current vCPU limit. However, if we decide to increase the
> domain vCPU limit, that doesn't hold anymore and this function would now
> silently create a out of bounds pointer leading to confusing problems.
>
> All architectures have no more than 128 as vCPU limit on HVM guests,
> and have pages that are at most 4 KB, so this case doesn't occurs in
> with the current limits.
>
> Assert if the vCPU ID will lead to a out of bounds pointer.
>
> No functional change.
>
> Reported-by: Julian Vetter <julian.vetter@vates.tech>
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> Not sure if this is the best approach, perhaps preventing compilation if the
> vCPU limit is higher than what the ioreq page can hold is preferable ?
>
>  xen/common/ioreq.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
> index f5fd30ce12..b2ef46ed7b 100644
> --- a/xen/common/ioreq.c
> +++ b/xen/common/ioreq.c
> @@ -99,6 +99,7 @@ static ioreq_t *get_ioreq(struct ioreq_server *s, struct vcpu *v)
>  
>      ASSERT((v == current) || !vcpu_runnable(v));
>      ASSERT(p != NULL);
> +    ASSERT(v->vcpu_id < (PAGE_SIZE / sizeof(struct ioreq)));
>  
>      return &p->vcpu_ioreq[v->vcpu_id];
>  }

The 128 vCPU problem was known and IOERQ servers intentionally had
multi-page capabilities from the outset to address this problem.

See the calculation in ioreq_server_max_frames().

It hasn't been exercised in anger because there's still the APIC ID
limit at 128 still, but IOREQ servers are expected to work correctly
above this limit.  That said, this function is clearly buggy and in need
of fixing.

To the assert specifically, that's really not appropriate.  If it were
to ever fire, we'd have an XSA.  Logic if this nature either needs to be
fail safe (if returning NULL is ok), or be a BUG() so it doesn't become
unsafe in release builds.

~Andrew

