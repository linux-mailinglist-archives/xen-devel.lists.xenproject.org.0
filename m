Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5497A901FD1
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 12:49:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737172.1143348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGcaE-0006d6-Bh; Mon, 10 Jun 2024 10:49:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737172.1143348; Mon, 10 Jun 2024 10:49:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGcaE-0006az-8u; Mon, 10 Jun 2024 10:49:02 +0000
Received: by outflank-mailman (input) for mailman id 737172;
 Mon, 10 Jun 2024 10:49:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GtSS=NM=epam.com=prvs=289119432d=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1sGcaC-0006ZZ-QU
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 10:49:00 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a2575dc-2717-11ef-b4bb-af5377834399;
 Mon, 10 Jun 2024 12:48:58 +0200 (CEST)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45A97JP8028931;
 Mon, 10 Jun 2024 10:48:54 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3ynxk10eec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jun 2024 10:48:54 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by VI1PR03MB9965.eurprd03.prod.outlook.com (2603:10a6:800:1cb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.16; Mon, 10 Jun
 2024 10:48:51 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%6]) with mapi id 15.20.7656.012; Mon, 10 Jun 2024
 10:48:51 +0000
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
X-Inumbo-ID: 0a2575dc-2717-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lCPIXS/11gaFq4AMvFuX69wkD6YU9aYTnkOMzf5Uvd2eNED0C9U7VWBiAsW9xJcrLwHj0MCvIlbnNh9kTVlEtPChinuk0U0uTldZ4MG1TxWMWhvg+wArA0cnNGQO7wtCyusgCysbdtGAcAGLuo2LPJT2d09I12lJh52SwL82dquXkS2qjxV6vd3TX5Mo5foEbvH0bgFwf22e+7b9eJo4QKwOjkvVKOr9guokuZYwkTmnxxCuxmVN67j+zzHR4VBz7+r1lqGXBjupgJtq/QhEW1HhiZ1qYAMp5uhHO8idUG2CDmUYMvCPbPUXETAWrTuerDOCBnrOp5uOV0x3hX+xUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o7ch+KUupsGWBalC7hP5erJUYI2POY1MW1Bg21YSMJU=;
 b=nKJ8lphR5YuRB0utbeQTrmklpdp8tBw1vMPKKz5rJmRs/fx1gAGPwqZ9b+8BAr+7Q1VucEHkLhYyF1A0CCjdbjUedLx7EKpo1d8xCoh4L0nqr8b0OSF/soBiGvv8Dn8z2Z/zaSFqkQ/ZOYG4VvkQkvRWzKNCPXSL3GfmHZSmscKVhdJfD8ThAW9NaOUVGtXZMeitCNeAPqAx2oAIzox33cCde97h/h7tgfhiOrgWWp1Hkw40pK1fH2NCEfJV/G89yITW3mkrzcOg2li6PpzW4vn221dxXbjuresjp72HEiF390uHGWzAftP4qblSWByYdx03R+xioJ5ABI+Dt1oULQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o7ch+KUupsGWBalC7hP5erJUYI2POY1MW1Bg21YSMJU=;
 b=dDsKgvdeZzN2ZDb6zNkfQUmxEDBMX5PtHmSQhqJTRBE+kxWko0uabUQ0tPDfTy693SrkKPP0vJJzf+DKMEPYgH5ki3hm21mpF08P/3/UAuIElzi4VL9+HnjemHSKb2qNQZsr1uiIxxLeedNH1oUlbzWLxIR1p9LfdN+r0PwgNcqhAAeqHEboSNvWusMxbCeul3YS9cevxezm2W3xytZtwmdb+3qo19OOjPm0p2SwISEGJMnWSsnjbrbVogvXUJm4pYqDHiWUHQyw4b+4Cy+mSJQ8C/1Wmd9BfEBje4gmgYwn90A8DlLjFyZ/yfkyVj5MazR9kiWJxuAeWcMctceSsg==
Message-ID: <6b55015a-4cea-4064-a50e-38ab2b2e665c@epam.com>
Date: Mon, 10 Jun 2024 13:48:49 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 04/16] x86: introduce CONFIG_ALTP2M Kconfig option
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
        Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
References: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
 <035f63f2b92b963f2585064fa21e09e73157f9d3.1717410850.git.Sergiy_Kibrik@epam.com>
 <856e3517-4aef-4e18-85b1-174ebf5c358f@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <856e3517-4aef-4e18-85b1-174ebf5c358f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::29) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|VI1PR03MB9965:EE_
X-MS-Office365-Filtering-Correlation-Id: df8297be-b35b-458b-344e-08dc893aea4e
X-LD-Processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OXZvR0lqSUhIOWV6ZHcxYkNXSGhDNHBMTmpBNjlUTW5hUm9TRkE0NVVaMFMv?=
 =?utf-8?B?cHQ2MmpnbUZzeUZNYWEya09ISUsvN1RXUW5ZSEFQR1p6Z2hPN040ays1alNY?=
 =?utf-8?B?cG0vVWh0TE8vbmw3NEMwbDFrdXZKeHZUbW0vQk5OQ1BiL05idnpMUFBHWGlr?=
 =?utf-8?B?ZXZTbko0ZlVmbVJ0MG5jQkV2RnpmVm02V0xoZU9HR2tHZnIrYm9BckNIQVpi?=
 =?utf-8?B?aXRyM1ZiL0V2ZWVZVVVJOWFaSDJ4Mk5lcDZGSzAvTGxsd05ENW1aSmlTRzJs?=
 =?utf-8?B?NjVTbXJsbGQ3Y1ZzbzY5T0JIeUttMWlRWnltUFNtenU0UDloejJPYWp5c3BQ?=
 =?utf-8?B?NnFDS0ZsNUtOUlRPeXFCdWhLTjRNZXF2b0lDdWZPRjZiaWhmZ0lGcEM5ejhG?=
 =?utf-8?B?Z1dpWHJkZXBpVVpodEZuUUhxMm5GTjY1ajByL0NrMFBQVmx6S2UxeGhhcE9O?=
 =?utf-8?B?RnoyYkRyMWNWVzM3TGEzZGVWcGZBNjlJVkhMTW9tRUVDckYxQnpub3JaYW9K?=
 =?utf-8?B?cWlYRTdFYW5hVW9lbHFONVBpSXdyZlEzWXJlZGhDZVpNQ2FFeXFSNFBhd01s?=
 =?utf-8?B?YWJGeHF4TFJ3eHlqZ2owYzBHMzU0d1cyWHdiV0gvWTJGeG9pRDJkUGJMQklU?=
 =?utf-8?B?b2p5ZEc3VGlYd1hVYVFKVFVtcU10dEx0S2hsS3hhQjlsVG91NXdQZUZ5K0RS?=
 =?utf-8?B?MWhDbDRpR1AzbE5ySllnc1pwK3h2bVFNQW9YUlJwUFNJL3kzL0JqOHpYaktM?=
 =?utf-8?B?aVRxdlYvdzJkK2djajlBRnk4aW01cWFMaFIvVXpINTNQcXNVcEl5Y0U2akw1?=
 =?utf-8?B?bjZMUzNOZDg5WWpRblByeUVuNFdST0k3QlBQeWZXekY5cVFOaWhtaE42SEpM?=
 =?utf-8?B?N0tJY0pLUzQwbVptbVZmcWxKS2ZVNUJWYWk2RU1nb3hySnN6Q0RjRVZha2lR?=
 =?utf-8?B?SVhhQmdjK01Rb3RsTUhuVVhaSTNkbGM5ZEJubTlKNldCd1ZnbnhjZS9NUHlH?=
 =?utf-8?B?WklDMVcvdjgwMFVON0R3RmJHSElQK0h2ZHVXN3c1dTJnMDR3dW8zYlBIWE9L?=
 =?utf-8?B?QlBWazY0bjkzbzZxQ3BDeUdaTU5YL0xlY2FVYXlocGxDMmdCZkVRc2VHdFhY?=
 =?utf-8?B?NzU5ZTNwWkM1YktmeFRTdVJDdDZRZzlPOVNUanVLSG91S3hWeTBYM1lwbWtR?=
 =?utf-8?B?U3JJbS90eEY5aE1wbklxNkFuU2ZMMEU4THJ0OXZtcDdaN3pEaWt5aytRWEp6?=
 =?utf-8?B?MTRpUmpxOGtoZm9OWkdLK0lqalJ2ckRJOVVibndWVXZUeGZaWmFoR3NTK1JG?=
 =?utf-8?B?aGxqMVBDdmpXZkJUV0xCMkRqdFpueXY5UzBHZk5Makg5UCtaQnZ1Nlo5VDVx?=
 =?utf-8?B?dFdmZVREcm53bXN6c2NZS1lFUi9ZMndkcnZDYTdSbVV5dExPV0syYUI4cFRx?=
 =?utf-8?B?dFpqMHloQ1JxU3k3YW9qVnpPUUVJcVlPQVl1MFY4MjNrUjFLNGR1VXVCaG5S?=
 =?utf-8?B?dWU3YWRFZWdCU1RuVWlZcHhaTys4VXovMVRLRWlhUk50SnZsOXJYZWRVd3NR?=
 =?utf-8?B?NU9jNTExbFZGR3h1Ly9OdW5jVDVoOSs5OGsyeWFBanhIWlQ5cXdONFFCL045?=
 =?utf-8?B?SGxqUVN1UmxCTCtSQXFYbWVMaG1pUmFVQStzam4wRC8xSTEvRTRvd2g0eXRu?=
 =?utf-8?B?TWtPVWxmS2FoczJ2OUFMendPZDFycjBZU0FackkxYXRlb0Z3OFRqdXlBYU8z?=
 =?utf-8?Q?uuoDvJ5x+aCuvJtY2/QTrurIqJViqzUPPA7Qrog?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bWtxaUJBMTd6OXdMc3pCUm5kZm5TZTFUVk1Pa05pNHYrOUEwNkFCbTJKT3J0?=
 =?utf-8?B?KzJJRHpidmRhdU9MRjFsdVNRaHBwZEk4TGR6WW9jbWRDYk4rdElodmE5MjFh?=
 =?utf-8?B?dWJjcnRBQU84d2FDemdONEVHRk5URDBzbGNPZmM2cm84Z1gvTVplSFphR25V?=
 =?utf-8?B?NUw5QjZabkJTRmlPKzdtYzI3Y3NNc0VkeXJaeFRJN0ZWQ01GZXBITHZzdU9M?=
 =?utf-8?B?SFBqZjdmTWNPaVFzb0FYVE1LYWVnaUIzRk1MQlZ6SUIrVTNYQnFKb1JPMG52?=
 =?utf-8?B?WVZzWmxiZFlqdEFhd3RGNjRNRjl3bmxQdmhCeHkrc1ZoM0RHRzFVdGV0YVFO?=
 =?utf-8?B?STlzREJCNzM2WmVFNUczc1U0dVBGUlhNZkpOZEg4blpoRmZkdTNtd2Rqa1I3?=
 =?utf-8?B?UmEvSmFickRYajBWOXBRQVliNzNFRTR4cUpiL2MrR3lXb0FMN29OdGtNTXhW?=
 =?utf-8?B?U1FoNWxPeVNNOXdmOHRydjZVMEFnNm1zUC94MEZDYyt6TTBLVjBhZG1mdlBJ?=
 =?utf-8?B?Z1BtYm5lOUdKUTc0UUlFL1hsakJKVjB3a0VwcjVwUGZiZ283VjJnQWE4VmJu?=
 =?utf-8?B?SmFvd1FzR0NSZWJmeExtdmw0M0RoRzExL05sem1JRU5WZ29aSGdsakY2ZXND?=
 =?utf-8?B?L1NWMTd2c2VNQ3pFZ1owQVFMVjcvdXgzRzhHM3ZFTVFUVUsvNlhuM0c3ZWRy?=
 =?utf-8?B?K2tza3dkelZod3EvYnF5Zjk2R3E2UWUvSlh3QW5POGVNM3dxcTJ1Y0pUaWkx?=
 =?utf-8?B?bG9PVzVzL3NMZFlvQU82aSttbG5wb3QvblhkYTFBTzhwTmRnTkY0aGJsK0Rn?=
 =?utf-8?B?RWFjSWJBZDl5U2VTd092YUMwQmp4SVJJbmRLZnpNK1FZa0FUNFdEeFhjTTBr?=
 =?utf-8?B?bW1sK0o3aUp3UmlzRVc4Y1FyeEFITWpaT2RienY3VkYxcVMyYjN5aHR1NW5z?=
 =?utf-8?B?cS9Xb1VZM24wWmtoNHQ5SlNSbEJ1QlZLNlVjZ3llU0JMdGFUZ251NHlrYm5B?=
 =?utf-8?B?ZGRMWEtNa0xaT0czaWIwOGVhUVBMQzB1RzFENDBBaUFPMVd2WEJUUC83VGdn?=
 =?utf-8?B?eEFjMTFoOTZrcU01QVgrd05KSldaL3ZQbXhyWDN1UTY4RTdhL0ExTVRsSzB0?=
 =?utf-8?B?Nk9NV1RYNGsrTmtSYklCUHlkRVNkUXJOMXJ1VHNsRGRqczhsOHVPc0tvT2Zl?=
 =?utf-8?B?ZVhrU1lIb01MY1RaWGloTXJ2VExmcUxOOFQ2aGFHNlYyRlNSUE5IVTEyR3lq?=
 =?utf-8?B?SUdSRFVHekVTWWtvME1nNFpWWlNJSWtsb09paEVCMUxQTnpSTEczWWQ4S0pG?=
 =?utf-8?B?OHhoRnAzZHR2dEw2VG91Wjc5ZFdBOU81VmpTeVNoMHNhemtvQ0hHeEtjcWVx?=
 =?utf-8?B?ekYxU0gwaFFQWS9FNURrZDZwZ1RBUElSTy85MUdEL2xIMmd4MW44cHU0QXFE?=
 =?utf-8?B?QkZOOE9SZ1ZLREE1aTNBWUxmTDR0V0Z0OEhZSkV5cDNOMDg2QjFIWXRuK3ZZ?=
 =?utf-8?B?clRkZjduNzI0cVJxVmJNOEJZK0VVVGhsL3VDeXorVVg2MFhRSy9Ydm56cEd0?=
 =?utf-8?B?bFMxYkdEWEdTbUJydmQ0RXFxUmRCak04alM2OUd0Z1ZaYzM3T1d0RVBLWHFo?=
 =?utf-8?B?ZFV3V3F1MWsvb2Z5dVZXdGV4YURFQWgxcUFMR29ySGtFdm5iYTZwRXpxZml2?=
 =?utf-8?B?bnJ2NjBLcjZBelc4ZGd3K0EzMW45WGNtWmpLUloxRFROWmJnSlhKcXo5b09p?=
 =?utf-8?B?RnZKdWh5RGR3azZCWDQzYWhSdFFzWkN4UHRHU1VIR3g4VVFoVjMrNS8zRVJo?=
 =?utf-8?B?OW84L2ZQMHFwQk1TSW05eHZ6K0xkZ0YrSXNhbnllSlY5czcxKzROZCsvUXRT?=
 =?utf-8?B?UGdiZDROd3JUcmY1N05MVXhRem1tblMxenNhRTBPVk5WVnkrenhCOVppbk80?=
 =?utf-8?B?U3prZE9oNk5CKzBFMDJ0OERSdC95TFRON0FvVGUzUW8yK1ZlVW5GTXM0am14?=
 =?utf-8?B?TnVuSW9xUHRFSE85bWdYbHhJanRKd0FzRm9HRVdmYWFSK2VRMzR0S0hXUHlu?=
 =?utf-8?B?Q05SOW50dGt1WXo5NjVya3NKK1ZRRUNBdGJiSkxrbjB2OTAwTDNUV3kwMUVh?=
 =?utf-8?Q?Wrhn9BOgQPlOGEDB0LGyLJGbt?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df8297be-b35b-458b-344e-08dc893aea4e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2024 10:48:51.2854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 07U6A/9Lnyidh+oLZGrCqshTlLNry4o2FBqD+4819rgyusoe9Pc/c+EsC6e3JtMjXH37w2Sq4kZvawdEbYzMFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB9965
X-Proofpoint-GUID: 2P1f-gF-VyI8AcHHs2XUQISRxL4P_Adt
X-Proofpoint-ORIG-GUID: 2P1f-gF-VyI8AcHHs2XUQISRxL4P_Adt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=973
 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2406100082

07.06.24 10:47, Jan Beulich:
> On 03.06.2024 13:13, Sergiy Kibrik wrote:
>> --- a/xen/arch/x86/include/asm/p2m.h
>> +++ b/xen/arch/x86/include/asm/p2m.h
>> @@ -577,10 +577,10 @@ static inline gfn_t mfn_to_gfn(const struct domain *d, mfn_t mfn)
>>           return _gfn(mfn_x(mfn));
>>   }
>>   
>> -#ifdef CONFIG_HVM
>>   #define AP2MGET_prepopulate true
>>   #define AP2MGET_query false
>>   
>> +#ifdef CONFIG_ALTP2M
>>   /*
>>    * Looks up altp2m entry. If the entry is not found it looks up the entry in
>>    * hostp2m.
> 
> In principle this #ifdef shouldn't need moving. It's just that the
> three use sites need taking care of a little differently. E.g. ...
> 
>> @@ -589,6 +589,15 @@ static inline gfn_t mfn_to_gfn(const struct domain *d, mfn_t mfn)
>>   int altp2m_get_effective_entry(struct p2m_domain *ap2m, gfn_t gfn, mfn_t *mfn,
>>                                  p2m_type_t *t, p2m_access_t *a,
>>                                  bool prepopulate);
>> +#else
>> +static inline int altp2m_get_effective_entry(struct p2m_domain *ap2m,
>> +                                             gfn_t gfn, mfn_t *mfn,
>> +                                             p2m_type_t *t, p2m_access_t *a,
>> +                                             bool prepopulate)
>> +{
>> +    ASSERT_UNREACHABLE();
>> +    return -EOPNOTSUPP;
>> +}
> 
> static inline int altp2m_get_effective_entry(struct p2m_domain *ap2m,
>                                               gfn_t gfn, mfn_t *mfn,
>                                               p2m_type_t *t, p2m_access_t *a)
> {
>      ASSERT_UNREACHABLE();
>      return -EOPNOTSUPP;
> }
> #define altp2m_get_effective_entry(ap2m, gfn, mfn, t, a, prepopulate) \
>          altp2m_get_effective_entry(ap2m, gfn, mfn, t, a)
> 
> Misra doesn't like such shadowing, so the inline function may want
> naming slightly differently, e.g. _ap2m_get_effective_entry().


I can do that, sure.
Though here I'm curious what benefits we're getting from little 
complication of an indirect call to an empty stub -- is avoiding of 
AP2MGET_* defines worth it?

   -Sergiy

