Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A336EC3B712
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 14:50:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156976.1485915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vH0Nm-0006jm-5p; Thu, 06 Nov 2025 13:50:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156976.1485915; Thu, 06 Nov 2025 13:50:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vH0Nm-0006h5-2o; Thu, 06 Nov 2025 13:50:34 +0000
Received: by outflank-mailman (input) for mailman id 1156976;
 Thu, 06 Nov 2025 13:50:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0oVY=5O=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vH0Nk-0006gz-UL
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 13:50:33 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f0ab23a-bb17-11f0-980a-7dc792cee155;
 Thu, 06 Nov 2025 14:50:31 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by PA1PR03MB10865.eurprd03.prod.outlook.com (2603:10a6:102:484::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 13:50:28 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9298.006; Thu, 6 Nov 2025
 13:50:26 +0000
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
X-Inumbo-ID: 8f0ab23a-bb17-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AU8HdnHpIy+lO1UBErt4fN30nL7eyegpBUVxhBt39gpT7YyK+1iaSZ7AxqgYFePRPDgBDin1KjpOlNUFfMsstK1+AcZ0B8Q30ODJvq0cX+rv1hagg1p2KndOzIF0VzH8mgX00jbR5aIlQyr6Ds9JY2GUxCGbYKvek9T8J4zx6RVAua1w6KKL1idPadVcArRj1h60TRoB4tJFW1IgPGWEi5CZ7R08n6NFiTCxiOAlzRR7DPk8YMw9gzCepMnjomAsRAydes94sm3MUS56IbgOagCxqfxsypO/aQBxriA1NRUK7AwmLNd1ul0/P9oBrMzHDvxVU09/leDwkUJGNXogBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wkt0Ew14jTcRGur1+FZs8HbHI4jeMS064zlVi81tFMs=;
 b=IxKLrt3RM4jqRmmOo59Yd2A7OWJt5KzwG/QzldCGHVGB1Pcihy2ie4Zxd2lMxYxF8dmZhVqmjuU3ELDzQPymgYYMzfHrA7ngL5IFYMDFgfRKeZXyaT3H5TwNNpWZ+Ijc1ZHUYPV5JyrvZa7f3xqjCRL1MM5Zsje5tynIyqbxACOb3cF3FcGyeHWJmtbKJ7hJR02sZIfrS+Yo3DCU7J3PHSSGA7fWxDriQbHlIJlhVGc60r0QzsMQ7lqVFhkAzQ3MmxFQiKbux12IkAd5yAk7/VTY3bdWAt+aeRR5HIbqLhLdKUZti0GJQj7JQmLhhYbhhPP5R/Ha5QnBgQU3CJn0RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wkt0Ew14jTcRGur1+FZs8HbHI4jeMS064zlVi81tFMs=;
 b=JrEuo2ppQlIqQasUp1acwzGFB/lqn8Zt9XdeJWLS7Z+feKIBnj+Vqb9FQ113gBmVSDWnx7tkieq3OODP7PGrQrTn/xilokQy4Rt7LK46Nvc5acxuRhMpxo+G2GEe1McsuxzuDVCcW48RfHDDvleza+W5jIUfxnnuCsLLNFNHLoMlYrko2wSr34TJguGN7K7dWEHEwA8miICa0oinSlg8tYcxDDy3vtQ58GpWka0WYT1E1fv+pNIUDzCYCFHfsG86Vhwr7V99cAk4CTTHKTovxbB+wEeD6GvKfkzyx2PGMrgUbYXK24MTxCYqqHdv8JhWCzaoBiL05AmTVZ5F72Zthw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <e55f990a-1781-4651-a899-9d78bbbbdfd0@epam.com>
Date: Thu, 6 Nov 2025 15:50:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] xen: make VMTRACE support optional
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Penny Zheng <Penny.Zheng@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251031212005.1338212-1-grygorii_strashko@epam.com>
 <b6337cb5-da85-492d-bba9-688e35695c46@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <b6337cb5-da85-492d-bba9-688e35695c46@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P192CA0007.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::12) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|PA1PR03MB10865:EE_
X-MS-Office365-Filtering-Correlation-Id: 273d5344-b777-4538-fe17-08de1d3b7029
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q093VHN1am84d0dXYVdxZHJTVzlPS1M3U01jeEJNV0ZnaUJxUDhOTHo2NmVE?=
 =?utf-8?B?RDF5VVl1T2FKUXdPSDJqbDM3Y0E0QnFVbFhxb3RkMU9BYVFPbEtvZ1RMTFFq?=
 =?utf-8?B?NC9OYXdnT2pqc3kwa3AxaEFJT3J6T2xqcjFNcFJKcy93SGI5ckZwdllHSXRQ?=
 =?utf-8?B?NHlSR1NqMFB1QXdlbjFmL3h1VmpnRUFIRjE3clFLMEZqVk5DU3N0VkYvK2pG?=
 =?utf-8?B?Znc0TGxjMjcrSW8vM2hKU252WFh2UmRQbWlMdXMydFNEMitOZ3RKNTloa2Nk?=
 =?utf-8?B?eVRxS1pwUFFHOXVLSmZaZlVZWWY2bWx3WGRvMktJaTBwb2VyRE1QZ3ZJUEsy?=
 =?utf-8?B?TjVxeXF0VnIwa0s0c1pocStDRDZFVTlBWi9ScmJ5VGpQT2Z5Qzd4NEpuL08x?=
 =?utf-8?B?OUJNOHN2L0s2ZlJrWFc4dUNNT3pzdXM3VHUxMmNnelB6ZWFIbVViZkJpcW5k?=
 =?utf-8?B?eG54TVpyZWFjdFJ6Tk5kU0NjTWEzVDZXRUdQT1pKZlRiMHdtTzVSOGJFQXNY?=
 =?utf-8?B?a1JtTUdZY3d0K2VqdVcwOHRqejJHMmtQclpmVGN6MHdhMUZ6eTFTQnNBZVdn?=
 =?utf-8?B?bjNnMUcrSVk1WWRvTzVqbVd1OTg1NG94Uy9SNGgrQ0lsNDJTZGZhbjhKcTBS?=
 =?utf-8?B?eUIrOTJJczVaQVFYdFY5Y1FNYzJrUFh1YXdUTHZXTDR1MVByeXNoNXNWU1Vi?=
 =?utf-8?B?dytzNU9TYjgzYnhCVWlRSndlTXJ3OGRWdXJYc2VBTEVVR1dHQ3FlZHdVdWZL?=
 =?utf-8?B?N0wyVWF5aloxTTY3MEV6RG9lUjZnV1o5emI2M3YxcmJVMmlGTmx3WFV2L0tG?=
 =?utf-8?B?aThLeFI2d0lPS2tlU1JBeitOZUIyMzBiSFh0aE4xOXVnWitJaUxEVEY2ZzhQ?=
 =?utf-8?B?QkkzK3VvQzZxOExSMjM4N2l4a0RrbGoxV2x6bG1xeUFjTU4wbzRFbUZTSWhh?=
 =?utf-8?B?QkxHWUhHYlUyYVJIUFNOaHM3d3VJckl5UGJsWlNKUmxPVHNOVytKNDFrNk85?=
 =?utf-8?B?cGdsdzV5aUpuT281d1NqK3lldC93V1NNVytNeldwdzB1WGIzUmVoaUx2U0pp?=
 =?utf-8?B?K25jdGljdG5TK0lOcG5EanJYb3FiUXN3RHkzQTJtT0srb3hMMmVaMXpocjlB?=
 =?utf-8?B?Vm14OHBNdlV6alcvMy9Qa3VDbFRWakx5TmJIclZJN1ZXR2RDZXFoa0hNY1lY?=
 =?utf-8?B?M2xzdHk1OExhQ1VaVDdXMEovMjRBQ01HZTRmbzhhb2tpbFk3bjNWeWhGbjAy?=
 =?utf-8?B?MGxwTHp6dmo5bVlMYm94dGJqRS85R2JBUmFmbmxST0NQK3RuNDJzbjVpblJt?=
 =?utf-8?B?eVRXNG5BT1A1WFpFMVZvWkJWbXR6ajBFRG1Fa0pZQ09CSmNEd1lFV3o2Vnh5?=
 =?utf-8?B?c1lFV1ZnTEpRaUh1UmlxSGJmMDNVcTVnRnJ2RmhDMGp0ZTNCSnl4cjhYSVRK?=
 =?utf-8?B?RVVlOGVJcy83dkdUeUZMaGZydVI2WDJJS1BYN01Wc0RYQUZWS2xyaXF4S1k1?=
 =?utf-8?B?U1lOL1ZpYnlRLzg0Q0tzNkFhNDJoaG01cHlDdDdPVlRUSE4vdm9ZL1E2VTBu?=
 =?utf-8?B?VmJGNUtrVmM4UU1lQ0dKS0o4Z0YyWllxT25BY3Z4UWs0RTVvZU5CWmN2Z29O?=
 =?utf-8?B?eHgzL0xvZzVSc0hHNjlmWjduV2ZxS0lnVDYvVy9KZlkzbHNZTFNwbm8rYUJ6?=
 =?utf-8?B?VFNoanhDWnFMVmlJeUx6WGJnYk5JTHhnVlJJZVpDSDU3eC9ZK3B4b1Vud0sw?=
 =?utf-8?B?enVWbG1xdmpYOWtIaStRQVVFRS9PN2RzMHlQVjI4dTVaRnphTU9Rc0ZFbWV0?=
 =?utf-8?B?TzdEek93WW5KVElndVc0TGpETFFoQit0bEZ3TW9sNmpEYTg3b05ZZlh4a1ZS?=
 =?utf-8?B?WTN2RzdhUXQvemFpY1dhZTFDSUFnOWZHWXJjVkExT0hGTHk3RC9DV0RPd1pS?=
 =?utf-8?Q?le3Izc+Ny9Ilbj/a1+FpXLkiUtSyuzIi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnpyamlHSGlqWDNwVVJmUDhpd3kxSXVUREE1TnlFNUVYeTNYejJXY3ZYaEVK?=
 =?utf-8?B?MGpRQkx2Mmp4cWt5UW5uSEFnUGxhNndHQytLUUZCMVpMTU5pYjlCY2xCRnVn?=
 =?utf-8?B?eEFDSDZTTTlQSDk5dEFsR3dCeGlMNWpuODUySERZUHNKaHYremlMSENGS2kr?=
 =?utf-8?B?aVRqUEhUYllHZkw2TkdNZmhVMFZhOC9IWXVGbUxUQXVvWmlaekFsSGdCMlRN?=
 =?utf-8?B?b1ZaemNFeEZZYU5SZUpGeWtFR3hNSEZtaWhpbitTV0ZaQmRhU3hoS3JjTHlK?=
 =?utf-8?B?M3dvQ2FBYnp1Q3pQbXlHWk9wa2xlNk5tNitvM2VRVWJXQzQ5MkMreXV4bU1E?=
 =?utf-8?B?ZWJjYnhMSElUWU5YMnRFN2h0b0hBSHRYSi9USy9BNitHMGtrMldSV1Q3eHVQ?=
 =?utf-8?B?R21rS1pGcHFZaHl3eCttczk0T2Y2K3BrWStJUENRSFpHM0NkUDJqUDJoVTY4?=
 =?utf-8?B?ZFFJdG42U2l4d3djbjBuU0U1WFZDWlZlY3NINXBIWW8zVTlkZ0dxUk9MN096?=
 =?utf-8?B?NmlmbWh2Kzc0cEZmNS80RVYvbDZ2eC92Ukp3TWdSSERRVWJ3aEgyNWVFVklL?=
 =?utf-8?B?aU1YQ3g1U1lBMWJQenJZeWJMUkhYcUJ5dVY5MWt6bGcyNzlKdDllbStOU3JE?=
 =?utf-8?B?WmpTeXNSclU4WWJubEtxbTE2MnA3YnUvVU9yVXB0Nm8xd0hrVW5pNW1hTjY1?=
 =?utf-8?B?cWYwVUVBQmFqTk04NU1DaTR0c284WlUxVjhnMCs2aE1VVHFNSktMaHBxK0VF?=
 =?utf-8?B?WkZXRFpxSEp2WXBRTE1ENGJoVU51VDFGQ1owVkhCaEQzck12cnYyaGJwTWZG?=
 =?utf-8?B?L3hidGZSQ0tDaXBiMGpVNjJCU2lBNk5raUNwWlIxZ2drdlNGZy91VDR5VXc1?=
 =?utf-8?B?N2I5d3VIMHo2azNGbEhQK3dVVFhBaG56QlNHVzA5UENzSFhVQW85bFkzYmtV?=
 =?utf-8?B?R3pSVGloaHIzdTFvMW1xa3Fsc3o1YUkzRVJOOWNzaElsZFlCZUVzZW1TLzUr?=
 =?utf-8?B?Ly9FUlZaVERGVGhhcmVIamxsN0NLOVZod1hRaFhZMWtGcnBzMXM2TmNNSUZv?=
 =?utf-8?B?THBSaUtxdHMzdkdSdUNkNnVIS21mby9sd0VBVlMycVBYR3J2NnlFZm9MUUhX?=
 =?utf-8?B?SHBRK2N6cURvVjVSN1Z6S2czcmhiVSswUGpHRFpwNVRCZ2piM3E2VFVpVkl4?=
 =?utf-8?B?N2F3eGd3OG9Rd2FyZUNmN1oxU29XK2V1dCt2cU9RT0h5ZWI0OVZYeDI1TmF5?=
 =?utf-8?B?VUFVZ3hUYnBmVk1ScVdtN2pmcXFYUmdhUkRJS09Ia2FrSVdFSjFvVzVzeGR0?=
 =?utf-8?B?ODdpOHVFTWRSa3RlSXg4WWkzaGxac01kb1BLZmZabmRaaGd6M0I0TW9iZWph?=
 =?utf-8?B?djFsd3NZaUhRQ3RBNnFCQ3FjRldEM0JsRlFETHFORCt2WnpsMWx1T3FIWnA4?=
 =?utf-8?B?UjF4YWhLVUQ0bHFoTmdMNUIvanhJbHpDK2pMRDVwYjFwUGQvTDBSNFVLY25G?=
 =?utf-8?B?MytHK3NOQ0RTcnV5LzRLWFR4OUMyb01wK2k0dVk5L0ZPMkY5VG9ZVVE0ZGxF?=
 =?utf-8?B?Y1hkUGpjQksvMDlSVy9VeVZtNzIveDlacTV1MEJlVi8vczRDR3RxRkw2a3Z2?=
 =?utf-8?B?L3E5dkFWdVdGdkhwTFhYUmdmMFVSZGgrejNIa0EvRHcvSk9ySDMrWHphSzlR?=
 =?utf-8?B?c0dJL1BnZmpqTVNjQUxnU2hUd3ZVYU1sMTdUbFNtTERhVFRWb2M5QU56WHA5?=
 =?utf-8?B?a1k2amtDeHFoMVo2QXl3Yzd2YTlvVWJkWVM0cW5tT09JNFlJZFBZcmdVZXIy?=
 =?utf-8?B?QzB5QW9XeVkzYkprQVBvcmRJNWpTeHJDZVFEQzZlVjRpb3lvdE8zQzlZdFVT?=
 =?utf-8?B?cDYzKzV6ak94bDU4OHFVR09zVHRZNWZJTjNIaVIwYkd5ek1HTjdGWHo0dW9j?=
 =?utf-8?B?clVtcWt0NEFjWmRzZEtSc2RhUDRSOFlnd1hzN1g1b3FXNDBwM08wdktGSHdB?=
 =?utf-8?B?dFVjdEJSemdmSWFSK1I4ajFUUkd4by9DUHNFelZrRDN1L1JhRStJcnNualYx?=
 =?utf-8?B?SlZtdXBxcUszVzlWZVZsQ21vcDArUnRwNkc0QzNIazkrNzlPTjRBYUpDc1VF?=
 =?utf-8?B?OTdmUThtQUtwelVVeVlTRWhWaTBUVWpTUzdGQktRdGY0ZVYrRi9ZUDYwRHcy?=
 =?utf-8?B?UEE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 273d5344-b777-4538-fe17-08de1d3b7029
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 13:50:25.9224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MTVW3IIEFnlERHWIuEcEo+doAQ3KUimiDFw2XTY1t1swlU/9W+0c0wkf7QPXFoprbqC/JWKtZxzKAT7TWtFgMSc6Ug8x/rwR24FJbgjNBzU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR03MB10865

Hi Jan,

On 06.11.25 14:00, Jan Beulich wrote:
> On 31.10.2025 22:20, Grygorii Strashko wrote:
>> --- a/xen/Kconfig.debug
>> +++ b/xen/Kconfig.debug
>> @@ -155,4 +155,19 @@ config DEBUG_INFO
>>   	  "make install-xen" for installing xen.efi, stripping needs to be
>>   	  done outside the Xen build environment).
>>   
>> +config HAS_VMTRACE
>> +    bool
>> +
>> +config VMTRACE
>> +    bool "HW VM tracing support"
>> +    depends on HAS_VMTRACE
>> +    default y
>> +    help
>> +      Enables HW VM tracing support which allows to configure HW processor
>> +      features (vmtrace_op) to enable capturing information about software
>> +      execution using dedicated hardware facilities with minimal interference
>> +      to the software being traced. The trace date can be retrieved using buffer
> 
> Nit: s/date/data/
> 
>> +      shared between Xen and domain
>> +      (see XENMEM_acquire_resource(XENMEM_resource_vmtrace_buf)).
>> +
> 
> I was actually meaning to ask that "VMX only" should somehow be mentioned here,
> but then I noticed this is an arch-independent location. 

Right, Arch code advertise VMTRACE support with HAS_VMTRACE.
In this particular case:
config INTEL_VMX
...
	select HAS_VMTRACE


> I'm not quite sure we want it like this (just yet).

?

> 
>> @@ -2940,11 +2948,13 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
>>       .altp2m_vcpu_emulate_ve = vmx_vcpu_emulate_ve,
>>       .altp2m_vcpu_emulate_vmfunc = vmx_vcpu_emulate_vmfunc,
>>   #endif
>> +#ifdef CONFIG_VMTRACE
>>       .vmtrace_control = vmtrace_control,
>>       .vmtrace_output_position = vmtrace_output_position,
>>       .vmtrace_set_option = vmtrace_set_option,
>>       .vmtrace_get_option = vmtrace_get_option,
>>       .vmtrace_reset = vmtrace_reset,
>> +#endif
>>   
>>       .get_reg = vmx_get_reg,
>>       .set_reg = vmx_set_reg,
> 
> Blank line ahead of the new #ifdef?
> 
>> @@ -738,6 +740,7 @@ static inline bool altp2m_vcpu_emulate_ve(struct vcpu *v)
>>   bool altp2m_vcpu_emulate_ve(struct vcpu *v);
>>   #endif /* CONFIG_ALTP2M */
>>   
>> +#ifdef CONFIG_VMTRACE
>>   static inline int hvm_vmtrace_control(struct vcpu *v, bool enable, bool reset)
>>   {
>>       if ( hvm_funcs.vmtrace_control )
>> @@ -780,6 +783,12 @@ static inline int hvm_vmtrace_reset(struct vcpu *v)
>>   
>>       return -EOPNOTSUPP;
>>   }
>> +#else
>> +static inline int hvm_vmtrace_reset(struct vcpu *v)
>> +{
>> +    return 0;
>> +}
>> +#endif
> 
> #ifdef inside the function body please, to reduce redundancy and to reduce the
> risk of overlooking multiple places which need editing (when e.g. function
> parameters change).

All hvm_vmtrace_x() functions are inline - do you mean like below for all of them?

  static inline int hvm_vmtrace_get_option(
      struct vcpu *v, uint64_t key, uint64_t *value)
  {
+#ifdef CONFIG_VMTRACE
      if ( hvm_funcs.vmtrace_get_option )
          return alternative_call(hvm_funcs.vmtrace_get_option, v, key, value);
+#endif
  
      return -EOPNOTSUPP;
  }


> 
>> --- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
>> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
>> @@ -155,7 +155,9 @@ struct vmx_vcpu {
>>       bool                 ept_spurious_misconfig;
>>   
>>       /* Processor Trace configured and enabled for the vcpu. */
>> +#ifdef CONFIG_VMTRACE
>>       bool                 ipt_active;
>> +#endif
> 
> Imo such an #ifdef would better enclose the comment as well.
> 
>> --- a/xen/arch/x86/vm_event.c
>> +++ b/xen/arch/x86/vm_event.c
>> @@ -253,7 +253,9 @@ void vm_event_fill_regs(vm_event_request_t *req)
>>       req->data.regs.x86.shadow_gs = ctxt.shadow_gs;
>>       req->data.regs.x86.dr6 = ctxt.dr6;
>>   
>> +#ifdef CONFIG_VMTRACE
>>       if ( hvm_vmtrace_output_position(curr, &req->data.regs.x86.vmtrace_pos) != 1 )
>> +#endif
>>           req->data.regs.x86.vmtrace_pos = ~0;
>>   #endif
>>   }
> 
> Use IS_ENABLED() together with a function declaration (but no definition) in the
> VMTRACE=n case?


-- 
Best regards,
-grygorii


