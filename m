Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BCBB0F197
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 13:49:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053822.1422608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueXxr-0003jj-KW; Wed, 23 Jul 2025 11:48:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053822.1422608; Wed, 23 Jul 2025 11:48:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueXxr-0003iG-GR; Wed, 23 Jul 2025 11:48:51 +0000
Received: by outflank-mailman (input) for mailman id 1053822;
 Wed, 23 Jul 2025 11:48:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3SBI=2E=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1ueXxq-0003i9-1B
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 11:48:50 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe9318ab-67ba-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 13:48:48 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by GVXPR03MB10248.eurprd03.prod.outlook.com (2603:10a6:150:14f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 11:48:46 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8922.037; Wed, 23 Jul 2025
 11:48:45 +0000
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
X-Inumbo-ID: fe9318ab-67ba-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tW/qSQueXbUp9xx0B6DalRQtyIVUBUt5JsYptx3khWTKDUssdfUWSvTN1ADlIUdcO5pYLIhthwUn49j+IR6RJ5+a3B/I/Ur6kAw18Pc18KimDXf5dxFDbVJDPsM9sZuV9AexM/NIvGyJ1wGbgC2efuv8jdwje06nuqHIqTCFXoDh+7l0SYHEZM0h2xrvYHToGCcXcjUdnBqD52lKyYw5Jli1pdFmbUIlHl2f9aiNqN5MgoBVSFQ7aYTih+mxN27AJw+Rupb0UU41iSRe34oA53o08reD/evTXBTZYXFwPDpCxWmev62EYInH+018ni+DpFNckDnHWP2U6xjKOO1OVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cpuQVp/0GWYtsop6GCJd4tyjv2frhPIgnU1Nk10seqo=;
 b=Zw9XJ3rBW6HZnfugH69X+QB8A78/zXoNiQ+Y5QFrlgEP6kcBTym6VCbA5iXKK+SeFiXrFmPqed+l0e7g2Ud10aEtzSkLSh02p3UxVqYGttfizlZiiJXjwP57t7ozfk5Nrvu18epWevtO73UwJE9UeaLwsWhCTyhwEX70ExhGqIzKSvOmNWc3RgRpPwHYPtR8Qs98NLOZ1W+YFZ4ZGhXOBU2z5xN3GV527UXtj3lh05I/U+96Z+7D/QJoo7IGIZ4TLMMHrQg2oz8q8epHj/PLGw9sbm6xZ+6+C8mTGqLRfXNS1QmBfgSEGBYcE/129MGShbqpGk81DLcO3r0ROPZcHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cpuQVp/0GWYtsop6GCJd4tyjv2frhPIgnU1Nk10seqo=;
 b=Y7DRpVmqo85KaxaREvMgUpPLsv32/c8yrV9Ka4Xu8qwNLbNIQci++ICoMrmsF7HF9QBuBGuwR70kbWaNF/KLSB53THHTb2NmwtfHbluJHA+YfNe1Wn91EI9xnvYxh/csf3QYcc7VP9b9SryURzvG7mrUrgbDGxnt+xwb2kAQ0UHs3uzcx9sICvg8vysZhrnCY0nYuLDOvk3EiODkQKQjywxKKHKYok5s8Y4JfUT9TZNpx/tu7ZWj6TyutWm7BZZhp0Bb8QxiWwddP2/I94i00snHuixdOwKirambs6d3HIJuUSrMxaWAo/9ELbsSc5+G4CW9FQiI7yIPoaJ4u7Trww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <add27fd8-aaa2-453a-b502-fd505ec77f94@epam.com>
Date: Wed, 23 Jul 2025 14:48:43 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 0/8] xen/arm64: make aarch32 support optional
To: "Orzel, Michal" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20250723075835.3993182-1-grygorii_strashko@epam.com>
 <b968715b-20e5-4a63-8ad3-d4250e796c5d@xen.org>
 <e35822cc-d8a0-49c1-a4b1-2765e0e6cb6c@amd.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <e35822cc-d8a0-49c1-a4b1-2765e0e6cb6c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0298.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::7) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|GVXPR03MB10248:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cb71454-e20e-4ad0-d628-08ddc9dee14a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TEcwSXQ0MUhiTEZ6a1ZzZzhuNERRb1Rka0pHUzdhRHJObjdEUXlSaVhBWkIr?=
 =?utf-8?B?WDBGLzNhVGtKbDMzVFJrUVBNNHVBZEswWmYyZ3Q5NHUyRExsdHlrUitzbnBH?=
 =?utf-8?B?S0Z5akNTaTdCU1FBWDhMZ3ZyOElOdjVUenJpSm80UmRIbE1IUGlkVTdpc2p4?=
 =?utf-8?B?NDg5S3I0bHA3VEFmNDVPV2h0WEdKa3FhOXpaeUxkejhPM0s1SHJxK2NmY1RJ?=
 =?utf-8?B?UUwvc01mSWp4dFJDZllULzM0ZjRtM2F5R2djUGJBUXZrQzRBbm5XenNRdkxS?=
 =?utf-8?B?aXZsaWpRTFFIQVR3QTJhWDJiVUlDRFBXYVNqbEFxbUdSUjZBeGlmeCtZVTVu?=
 =?utf-8?B?d3k3dSsvSzlLcFI2ZVF0ZjZyNEVTNVBpcEtFTlRmbXJDc2UrWEtmWkxaM0da?=
 =?utf-8?B?UDFLcklvR25nL3RZSE9sM202VEF1S1EwditmTFY1NXo3dUtLS0w1YThNZG0y?=
 =?utf-8?B?WG5Qand2cmN0d0ZoM240TWhzeThFRWovRVNZSy9md3JBdXNWa0s1OE00bUN0?=
 =?utf-8?B?VXZTNnJRc3hUV0plSE1URlQ1a1NBN2E4RC9iMHJvNWxnUzFZYlVxYnJVWm42?=
 =?utf-8?B?c1JFamNjL3NReWd5eXYvUWRpc1k5aU0wQVlZenlFRzl1UFpzU1JmTktFQmNI?=
 =?utf-8?B?RWxZRGovaGZaRkw5eVhDR1l4Y0M2SW1FdU1xS1orcjRwUlFkb1U2b2FacHFk?=
 =?utf-8?B?Q0hYdzdvaUZ0KytRUFA3UVBkWlhMSDRPbFpadkFCZkxNZmVnK203L014a1lQ?=
 =?utf-8?B?VHdaV2d0TlhLWllmbENPYThQczBHNDFOdW5EYVNNWFRNYldqcXVEc0RsWWQv?=
 =?utf-8?B?Q291cU9lQkVnV3d3M3BIaldHUmR2UVl1SUp0dTdZU2p0blNiYnJrVVZ6d3lu?=
 =?utf-8?B?a29BaDE1bXZHKzJObmZ0aEJYWmFUWHlCTWlQV09nQ0Yya1pHdHlWSG55clB1?=
 =?utf-8?B?NThiMjJjWGxpVWVuVTgvZytLZjFFM3ZETzFpc3Iyb2ZPL3pNRm5oVnBRL0tq?=
 =?utf-8?B?eXpwZWxQLzg1RExhQ1hHNnU0NkQrQlk5cHdqQlpMc2M3YXB3U0VaK3pQendr?=
 =?utf-8?B?M2twMzBzaVFsZGVIVitSSDlhMC9lMG9sQmU5SGE2WXFRS0svY1N5THVBUGRM?=
 =?utf-8?B?M3V3YnJMUHMrVnV3aFVud0lZSW54UHpQdFpuQTJtMkdHeWo3a01WLzVzRk9L?=
 =?utf-8?B?MmpWbVdmcnJIREx2cng3MzZibXZ3NmFNWHY2dVBaRW1McHBucVBsK2hlZXZJ?=
 =?utf-8?B?Z281eVB6TVRLTzlPUUcvR3ZuMC9rZmJDc1ZsQUpKaGNQUnF6akt6WEZLbTVI?=
 =?utf-8?B?MmdTQ0lJU3VrdmlvYStDWGhKYUpPRldNelVwVzROQVdZV2tnQ1pFVXFCMkxB?=
 =?utf-8?B?WnFyQzJwY3ZaWFVtT2p0ZE5RNC9sT3NlNXVwb3dnZURYZ1pmaXloMDFwanhN?=
 =?utf-8?B?NVMybzJ4U0xiT1VEODVERVUzSzFpcnZ1VG1UVU8wL2gzMUxZMXZ0eGNvSld5?=
 =?utf-8?B?aThXME9YNjdjaUtWTkhld0psRXgzQlF6dW81R1AzalpPTTJDeUwvdmZVcmd5?=
 =?utf-8?B?bmR5UzNHMFhLYXFBeXF2MExoZTlZdE5vcDBid3dTdldQTTVBclVlSFplUUtQ?=
 =?utf-8?B?YmdiMkhJK3ZIblBGZUMwdjVZS1hPdUNSY3RkRmtrZEZHVXM3Nk96R2EreTN3?=
 =?utf-8?B?bThpb1FKOE5SN05BVURTVDhMYWpHUjFkSENLQkVFaFVhOEdLSE03WWU4NzJ3?=
 =?utf-8?B?NjQrRzh0SS9uTEl2RDRTOFN1dldmdDgyWjI0TDc4VFdMWGN1NTUwUUtKZ3cy?=
 =?utf-8?B?cHY2c2xCMkF6M0IzNFVrVzhOU0RTQlZCNkpWanVMeS9VbS8rUVFvSEs2RlI0?=
 =?utf-8?B?aVl4T1pWczByV00yRHpTeDNWR2hZY2N1ZTMyM3prb3p3YjZPSUhsTkpWOGI0?=
 =?utf-8?Q?yy6CLhaVyvw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0poQURMRFVhQTBQWDVVS3d5S1BDQ0hEYWNKTTRGbWxDclc0NUNvamNzSXFh?=
 =?utf-8?B?NTAwVGwvdWNFWllNRDlRYzc0VW1ZVngzQXIxN3NlMFJjZWNHaENVRnlQcFNJ?=
 =?utf-8?B?NWszL3ZsQy95TUF2QjBncVpWeTVIT0NCSVBZVnJ0QzZVQmVBZGY5bVkyS3BV?=
 =?utf-8?B?VFMyeSs4Z3F3K3hYbDVJeFpYZ1BqdGJuOG9wc0R3Tks0b2ZsNkRGUlVJblJ1?=
 =?utf-8?B?Q0d0eGU2UU5LQzFkWU1LeTNROHg2OXIyamhuWW1kTlkrQlhYbC8wV1Z4R2hh?=
 =?utf-8?B?cis1OXlCeUNGSVNFdkFNNVhXS1lCN2VMU243dFZwV056YktLOXJTQm1oQkgy?=
 =?utf-8?B?bmk4bnM1eGhLQTIvV1JkRSt3ZFljY3A2UGdhMmY5cTA1RDlxa0IyWVdsck9t?=
 =?utf-8?B?TlUwdEhGaU9UbjVEVklLeEQ1Z1cvdHQ0M1VUdEFQaEJvMDY5TmhtZWFTK0hU?=
 =?utf-8?B?YUFhOERSNEJFZ1pUYjhSa0NVRGRXQkQ3YlFycFgwRjhiYSt2S25va1lMQnd0?=
 =?utf-8?B?VGxQM2t1K2dRcUNOZG5uWW1kM1hrRERhT2M5ZTdaN3ZiR0pwYW56eTFjRWZO?=
 =?utf-8?B?MEozcElkK1hLWjBwcW82TFAzSkNPK0dYbXRIVUpFTVBDY3RXbjN6YmI3S1lD?=
 =?utf-8?B?aU90a1dHeVJiSWlmOXZvWVR5YTdrd3NPQis3MFhaM3JGY3djYlJNeXdyQjV2?=
 =?utf-8?B?YTRTRzgxaUx6WjlMM01KVkFoeFQ1Nk1jTWZVRTdjcEpkbnQxb2c0TU5GeHVy?=
 =?utf-8?B?VFN6dUxaVTYyWFArREluRzNmZzh5cXMxalk1WDgwNE4vWjFpUWswSE94ZDlF?=
 =?utf-8?B?b2RtQkpsaDdRaGIzcnlQeDI2VmNjNVlIdS9oNlVFT1loN2FuTVduZmJGRzBu?=
 =?utf-8?B?MzF5OFhzL2NWVUxEVFNQU0gwc0RYNFZtcEVBSkQrbkN3RWYvK04zWm9NV3Vx?=
 =?utf-8?B?MUx4aVpkd1JJYmdhRW05S1NVZW04V0IzQ3hrbzUrR3Jwam00VUFmdFJIdWYz?=
 =?utf-8?B?aVh3TWdLRnhCVHFaalI2RFJ3cmIrV2FkRGVBOElxWGF3bWNOSWQ3M0J6ckVO?=
 =?utf-8?B?NmdWNFoxOEpGZ3EzamhEV3V4ODRLRXR5cWVjQ1doN2NrZjZBQnFOZWsrSkd5?=
 =?utf-8?B?R3E5cElqc2NrOWJFSjJwQ0QyWHZic3pVVnJ1cW1MU3BoZlJ3aTFQdDJ2UTdM?=
 =?utf-8?B?bXh0UFFiK3ZRYVcrM0t4QlhVYW8vdHV6REJiTVNXaEd2R09jU3VLNkhIOXF3?=
 =?utf-8?B?bS94K3IvN2xna0cyeW5ub3pvcEc1cUNSZU1XSHdUUm1sWHpVUXZsRTA2aCt2?=
 =?utf-8?B?OGZlWHF1TWZBSkpobkd3WnVFMEdJUmlLdXNaVWN2T3UxeTdXZVZ4L1kxY1hv?=
 =?utf-8?B?c2NJdUJGTWJJc1BldlBGay9MeENPd05tbnh0alpNQTVxTlQ3MUJrV0tndTFH?=
 =?utf-8?B?YkZ0aWQ4RmFyUVZvK043R1dlZE8waG03NmxsckhUNUY2VG02dE54SDFIWmxl?=
 =?utf-8?B?Q1gycEUwVVBUMVFaT2U1OStIZUE4Vm9zcGgzSGpBU2RRUjRwdlJIcklqNFpr?=
 =?utf-8?B?WHgyTGhaMTE5ZkhSSUFvL0QvMCsxbEJnYkRRMmZEMU41dEdkZGxabFFSVWln?=
 =?utf-8?B?YktHN2wxZDhqVDdabWJhdVU0Nm9oSHVLdmVQWTIvMExDUFdXOFB2TExvUytB?=
 =?utf-8?B?VU5wRjltWWdGMHAzQVduMVR3ZUpMVHMvZWM3WkRENFFWUklpSzVVU2N6Nm51?=
 =?utf-8?B?L3lvWEZHczFyd1FpWUpTclgzaE12eEZWSmY1OGN3c1FPeHJPZFdKNlJRcFZU?=
 =?utf-8?B?eGl1SWRydHdUT2pxUmtCYll4eU1IZkMwQ3IyUnFMN3A4QWl1L0lIRisxbjlT?=
 =?utf-8?B?NHdNUmw0M2RrQnlIV3A4ejR0NWkrRDhOaTF0aDJ5L25WVDJ6VW51bkZ5cXBS?=
 =?utf-8?B?LzJjVzUyYTdDdi9LT3g4VVpCVkFyNUM4d2lWL3g5V1I1aDZUSW5NQUNYODdi?=
 =?utf-8?B?dDlDQ01zb0dvQzNFUDdhZW9uQVcxZko3K3l2VzA2TkF2ek5ndlRkOEliNmdG?=
 =?utf-8?B?d2JVUmNwazBQQnREUGRZMmlnS1FYcTN0NTYwWlZpdVArMkxZN2VoNUQzVnlX?=
 =?utf-8?B?dzJIT2YzR3JNamMyNmM5eXZ2Z2o3RHR6TW8wWmpCOE1KZWYyblZvNlZqaEIr?=
 =?utf-8?B?TlE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb71454-e20e-4ad0-d628-08ddc9dee14a
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 11:48:45.7562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rucz9bMwONKK1pOHYPvFHV82ntg80Bh2NdIkf7qrYJSLeaLQuwTwVqvnVHVx8vHv6lxYktskyUZJul2xdawnFuml/WARxAaj8PwvCbsIWDc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10248



On 23.07.25 13:54, Orzel, Michal wrote:
> 
> 
> On 23/07/2025 10:06, Julien Grall wrote:
>>
>>
>> On 23/07/2025 08:58, Grygorii Strashko wrote:
>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>
>>> Hi,
>>
>> Hi Grygorii,
>>
>>> Now Arm64 AArch32 guest support is always enabled and built-in while not
>>> all Arm64 platforms supports AArch32 or this support might not be needed.
>>
>> I am not entirely sure I like the proliferation of using CONFIG_* for
>> every single feature. This makes the testing a bit more complicated.
>>
>> Can you clarify what the goal with this patch?
> AArch32 is used quite rarely in embedded systems. Also, in Armv9A it might only
> be implemented at EL0 if at all. When focusing on safety certification, AArch32
> related code in Xen leaves a gap in terms of coverage that cannot really be
> justified in words. This leaves us with two options: either support it (lots of
> additional testing, requirements and documents would be needed) or compile it out.

FYI. bloat-o-meter report for this series with CONFIG_ARM64_AARCH32=n, CONFIG_EXPERT=y

add/remove: 0/6 grow/shrink: 2/32 up/down: 276/-5672 (-5396)
Function                                     old     new   delta
do_trap_guest_sync                          1588    1856    +268
start_xen                                   2456    2464      +8
make_cpus_node                               832     820     -12
arch_vcpu_create                             328     312     -16
vfp_save_state                               132     112     -20
vfp_restore_state                            132     112     -20
is_guest_pv32_psr                             20       -     -20
construct_hwdom                             1208    1188     -20
construct_domU                              2544    2524     -20
make_hypervisor_node                        2048    2016     -32
inject_undef64_exception                     112      80     -32
inject_abt64_exception                       164     132     -32
show_registers                               260     224     -36
arm64_set_domain_type                        128      88     -40
do_deprecated_hypercall                      124      80     -44
construct_domain                             316     272     -44
init_xen_cap_info                             96      44     -52
continue_new_vcpu                            188     136     -52
check_conditional_instr                      192     140     -52
vsmccc_handle_call                          1328    1272     -56
make_timer_node                              492     436     -56
vcpu_regs_user_to_hyp                        512     448     -64
vcpu_regs_hyp_to_user                        512     448     -64
do_common_cpu_on                             440     372     -68
cpsr_switch_mode                              80       -     -80
advance_pc                                   140      32    -108
do_trap_stage2_abort_guest                   836     724    -112
arch_set_info_guest                          336     184    -152
inject_undef_exception                       180      20    -160
arch_do_multicall_call                       632     468    -164
schedule_tail                                752     576    -176
decode_thumb2                                200       -    -200
subarch_do_domctl                            276      40    -236
inject_abt32_exception                       236       -    -236
do_debug_trap                                256       -    -256
hypercall_create_continuation               1228     848    -380
_show_registers                              832     380    -452
decode_instruction                          1032     476    -556
do_trap_hypercall                            640       -    -640
guest_walk_tables                           1896     984    -912
Total: Before=670920, After=665524, chg -0.80%
add/remove: 0/0 grow/shrink: 0/0 up/down: 0/0 (0)
Data                                         old     new   delta
Total: Before=448625, After=448625, chg +0.00%
add/remove: 0/0 grow/shrink: 1/0 up/down: 191/0 (191)
RO Data                                      old     new   delta
xen_config_data                             1345    1536    +191
Total: Before=18498, After=18689, chg +1.03%

-- 
Best regards,
-grygorii

