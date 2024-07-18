Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C04693705A
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 23:58:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760729.1170630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUZ7s-0002kX-Jm; Thu, 18 Jul 2024 21:57:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760729.1170630; Thu, 18 Jul 2024 21:57:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUZ7s-0002hg-Fk; Thu, 18 Jul 2024 21:57:24 +0000
Received: by outflank-mailman (input) for mailman id 760729;
 Thu, 18 Jul 2024 21:57:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JMNW=OS=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1sUZ7q-0002ha-MD
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2024 21:57:22 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3392146-4550-11ef-8776-851b0ebba9a2;
 Thu, 18 Jul 2024 23:57:19 +0200 (CEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46ILtj7V032540;
 Thu, 18 Jul 2024 21:56:54 GMT
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40fbcvg01k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Jul 2024 21:56:54 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 46ILpjxk021805; Thu, 18 Jul 2024 21:56:53 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 40dwev6f95-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Jul 2024 21:56:53 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by CO6PR10MB5651.namprd10.prod.outlook.com (2603:10b6:303:14e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Thu, 18 Jul
 2024 21:56:51 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::a088:b5e0:2c1:78a0]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::a088:b5e0:2c1:78a0%3]) with mapi id 15.20.7784.017; Thu, 18 Jul 2024
 21:56:51 +0000
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
X-Inumbo-ID: b3392146-4550-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=LvzFpjyPQojRy9/1p4YWOEooEssTFuA5K+Jz3OaLzNE=; b=
	IfXLaLQMRlLUQr0sP0mekfzLrtlDVCbAFUbokW1xJAGJdvuZk0bVjYxL+opMvq/C
	1L9MnuavbEfjTBRb+vtQwl6kIstGlqdIG97FUCSDfQYjX9JDwiPYNJgo9UYE2WPI
	qr5JfGlNZIJm+tNl8ycVZXsV1075rg7zB3w3mUEdGwmU7Hq0NXEN9Q9gWS7Gp0zQ
	Exp/GtFwp3EWPeRJagCeoJjSrl8OvFOCdX3Lw6ZyqFxmDlk6EeMguAonWTcjpkKp
	em+h9onc5IkTMlmS5jWO2OE97ShFtxi1n/eHpbKYwzDOqrzxskB6Uuhku7DgHZOi
	/aWrhTPXvbqY51h/gnLeag==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vkvmHJ/05RYO76nt5B4kMnuahJ2fgM0VGKF9k3QAwk8Rmw6TrWko1FAdl/WqXY1yUIBw1nRipZjIAlwpKxELpd0U6OLPvwGQ7gkwX+2Fa1HiygnO0wIfrAyi9RjnmIF1a47xpU6XAoQn5iKn54ulvaT0PfCc3cCjN8JpCV9MMqrUFzqXYTfikQefDGBrCst9h+pq97eyE7i/i4MqJC1YzV6Oj/YaTGrJ3Z0gb6q+F4/cmPACvLeJr67JB8S0Oo+vCKFfOtni/8Uk9aqPpibb7B8ovI58RY8JxrgZHRwqD0y6dCr/APBhbHIdUJGNTvj7z7hriftCmTwcm3xITohnkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LvzFpjyPQojRy9/1p4YWOEooEssTFuA5K+Jz3OaLzNE=;
 b=D5sJf8kRpTozMOAUOKeQKSf1v6KNN5INHfaCPJAn5VHLU/eUU2fQ4u5wevDP3M6WMOIGHG1vxhG7WfSbvMfjp6gFuPHNAaDphHZrrM1Qy6CFjN2fBluFDAe1L7B6je//DsBtemb1QuvNjAxzfN0iSsyn83qzMADxGy78YPKSO4T7OOV9q57nZTUUT+KEyuM3Npe6JUqLNuwVQ+CWW2NFqB9fHS0zyJO/qSDjQ/6KZ6+uBikjQdwlVWO2os10FVldJLi4791RaeY/0uf8ZXZqUUSOOwjAF7sAvcMKXvphTfj1+Dwij01qLIwsaSfaAE6AxFcKvWBf/f7lKT2jt9H8tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LvzFpjyPQojRy9/1p4YWOEooEssTFuA5K+Jz3OaLzNE=;
 b=myYAjk826TfuGgTUHIjfnF619IViud4XFubcsNVkDGJM/3GIa4TAd6MQE2IMNY+0ftBN6G9i46BcvNzd3jm3s3IZ7ulfrv82lxJOOJVNPIkF2kxdKnbNpUVPPje+LJnIvPYPIn1bEGLLo5QldOQ5DsjGAVh7lfbm1jT5qlc36bk=
Message-ID: <1b3e9102-7d1f-43df-b6a0-9da84bc9ec12@oracle.com>
Date: Thu, 18 Jul 2024 17:56:49 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: fix multicall debug data referencing
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
        x86@kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
        kernel test robot <lkp@intel.com>
References: <20240718062100.5357-1-jgross@suse.com>
Content-Language: en-US
From: boris.ostrovsky@oracle.com
In-Reply-To: <20240718062100.5357-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:208:23a::18) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5009:EE_|CO6PR10MB5651:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c6cb470-93fb-4682-c17c-08dca77487b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Zlh2L3dRQjB4NEtyZXVsVjlPSXVnQzAxaW5KRzVQVW9KMmluUTRSWkE1UXFO?=
 =?utf-8?B?dWUzNDNsNGRYVnRFa1BobXB5enhiY0lNRFBydEZJWXdhOWNoZTIramRrcUhY?=
 =?utf-8?B?REZuZzZJOGhXZU9hNUZRZ2R1S1h5Si90V3JXZDhLRml1ZktXTEhKK3l5b1Nk?=
 =?utf-8?B?VjBBc2JEWXdVZGpRRkpQdW0weHZmNEFEWGRWeSsxMmVCZllCQWNwYWw0V0Iz?=
 =?utf-8?B?akpLTzRwSnN5VlQ5TU9lUTVKcWowbDFPTUdadElTMEY4WDRVRkVuKy9pcDkz?=
 =?utf-8?B?NGFMakczZU9iMVY1T3NWRSt0a3hQcWRudkVHaGtKVlhieVNxYmhrL3lqcUFN?=
 =?utf-8?B?SEFmcGNsU2RBdFp6UXRuQm82d1MyWkM3K0FKeWdBbnlFc1VjblJoc2NCb1Qz?=
 =?utf-8?B?VUZHbEhlcTJOdmFVNlY4elFkSEQ1NVF2MXpyR1I2c1VqRFJSYWVHQ0t5ME9j?=
 =?utf-8?B?VkZVV2dyYXBFc3NHUUpkR1VlOGNoM1J1SGxPdUtMd1lDY3QwZ2kyRGtTOWhO?=
 =?utf-8?B?dGJuZjB3Q0o4bTVnTHpkNzBYMVROVVJIRU5JNFNqRVRsQVdDSk1DWEQ1c0to?=
 =?utf-8?B?dm5FZ1I2RzRnSmFGQVdFQTZqOFVEZzFncCt1SjgwaG52UWo3dk0ydStQWlFp?=
 =?utf-8?B?QWVDUko3WUZRa3libjlFVCszMjd1Ulk0Q29yUE1WeUdyckovRnJNSENtc0Rx?=
 =?utf-8?B?OW1lcnU5R2ZyUFhSb1dxUW1vYmRETDQ1cEVGSFl6RlVwZ09Eb3NpR1VwbXVI?=
 =?utf-8?B?djh1K2RubDFreEZyTUtSb1EybjNwcnY2eXJERVFYVzJrT3NBSVc2WHFZRGh1?=
 =?utf-8?B?V2wyK25GeVBMTFBvWStSN1luZlJFYUJ6VHRsaXJwMFp3VVE1WnY5aG5IRXQ2?=
 =?utf-8?B?em8yWXE1Ums1YzJRQnpGU3U1K0hYNGU3czV1VUpLVkdPcnByY21jSnhCTVRX?=
 =?utf-8?B?M3lwN1V6VGd5UFhPVTFSK25WVXkzSjlNL0c3KzV4TDhCbHRhRWs1RzFCMkZT?=
 =?utf-8?B?Y2Y1QW1vUmIxRlBsemFWWXhQUFpmL0tqaktuR1FxVnZmYkphSTRnbExWSDEr?=
 =?utf-8?B?Y1Rjd1lDdUgydnZKTnhsb1ViQlJaaFd5dGhvQ1c4Vyt6YnZhTUVyRjZ3alZ0?=
 =?utf-8?B?TmdyeVFOMlJFZmxnREx6ZU0wUHUwWjdIVEMzRnRVbWo5SWZzREFDblpLRnJa?=
 =?utf-8?B?elFCdWZoZ0pQQWNsM2VmWUdjc0M3VDE2b1VRS2JKQitvOEdnUVlUUGIrVGtY?=
 =?utf-8?B?NktTSUhZck9wK1FteGR1cEJwSmZQNm9CaFhwemJhNThvUXhuYTEvWGdwOUc3?=
 =?utf-8?B?a1k3bUZnVGd1bkFwTzJZRms4d3dDWEM1cDdxZWlvekxxbTF5WnFKNENJRXFw?=
 =?utf-8?B?VVUyREtnWXBNaUhkRzRiWHlueHl0RjNTSEtScUZSbkJ1N3gxdkRTTzdQNkxk?=
 =?utf-8?B?Q3BFZG5BNzF1cEVKRnkyWmxvdm1PMWhsQm1kN3RVV1lrQ2NuK2FIODg3ajBM?=
 =?utf-8?B?MTZkZzVWRk5na2JKTWhkNUlaRlE0Ym1aODZiZlowKzU1UVN6bnQ0TVRTTTBw?=
 =?utf-8?B?YkVLNmtmeTA0ZW5McUQwRFJPVjN0STM5QU5ycUg5cyt2ejNGNWt0L1o5dXE1?=
 =?utf-8?B?NkxFRHFnV1lSVUt3OHRUWWZSOHRTaEw5Q0xST29DZnJBNFdvZnB5Y2Y3WStw?=
 =?utf-8?B?RzRLTVFzdUxCZmJLTjVTbWdZL2U0NUlFdEQybis2TmNwYlA5QlZPdDBkWFA2?=
 =?utf-8?Q?0vZK7OoK4nfWvsv3GE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NXl2WityTmpyRTFwaGswSEhCcEdsOWxqRzcyVlpzZ2Rha0x3MzV1V0dqTGdw?=
 =?utf-8?B?Q09mczE3dFN1ZFNVTXljYys3ZFdwdURNV2pEYTJsTXdaeHp2ejZZaUVEeEJZ?=
 =?utf-8?B?dDloaS9odzBZSEhqdTBZM0hvTTFkaU5vUWJmeTFjNVFpS2dGR25SS2tCWjlz?=
 =?utf-8?B?dm1hcjlvTTl1anpqOXE3TlVSR1JMWE8rM283MVJ0K3M4b0hlL1lUZjJHT2ZS?=
 =?utf-8?B?TGgzSENUM0xxUUg0V1Uycmk4L1dkTlU1YnZsS2lnTURrbmJUSWZHR3V2UXQ1?=
 =?utf-8?B?TmYwUlBYaWdUdGhHMXRCVWFqbkRnYmw0L1BCY1UxaXNLSzVySUhFMU9MdGVB?=
 =?utf-8?B?RlZjT2lCcDN0b0xpcVZ3anR4NlVDZTNPR3NYbm5YV2sxbDFySlFtZXE2V2Fw?=
 =?utf-8?B?WVVycGdWQnBjL2hHb0tBWGxPdHIvaUgwVkZFUFM5QlVmd0dyUGlqZXB3enJT?=
 =?utf-8?B?ekVRdEdEN2diN0ZBMFVtRVJhTnJ6WUgwM2FJaDNJUkNML0JPNDJWTXYvek9V?=
 =?utf-8?B?V01QRkhrUkVmU05Va0k3VzlUclpDWFpJd2lsRXJPYTBMYVFiWTR5Um04WVg1?=
 =?utf-8?B?K0Fac1JPTkNjK2xtOFEvMkkxSllHNU0wSEM1bGRGVHNBeVJnTUg2SWJDS2cv?=
 =?utf-8?B?Q3kzeWR1S3ZtenBoWEhnSU8zTnpCUStlemlBODA5aS9nbXY3bU4zdkFvbDBl?=
 =?utf-8?B?WVIxSGpqekZrczNhT0V4MzFqS0hiSE9kbVl2TXo4TDhBbXBxYnV2V3hFNUpO?=
 =?utf-8?B?dmV3MkoxRmdYN0FEeGxhL0VNQms0ZkpUSUxPTnM3RG5qV2lRN3ZSMHFEZDNu?=
 =?utf-8?B?dEJndGtvWWhYVjFHc1cyZGdRclQ0VDhPcjBFWkNNbkF5cXc4ZmhaTWs2Wi8r?=
 =?utf-8?B?cTI4UG9JdXUrNDF1NnZBbEw2WnV2KzhTbXpCT2JlR0Q2alB6RkllU2hCdW9M?=
 =?utf-8?B?NmpkcXYvbGplOHJ4QUR0N3RuSGxPeUNGQUtmMmMyWU45L2llYXBXSncydzNj?=
 =?utf-8?B?UVRydDJTdGxLei9FUWwxaSt6ZlBoUkZIak5HZDZWelhoUC94cDU3U2xLaXBp?=
 =?utf-8?B?Q3NDUldjaFVtQTJxcWxyakhsM28xcWVzTTcraVRCTER4c3NaWTYvTk84eElF?=
 =?utf-8?B?WW5CL0pEeE0xNHY5eG1OaTZHNDFQZU9nem5wZG9oUlRmdXhQSmR4c0lTUEJx?=
 =?utf-8?B?VVg5WE1XUVUzejhpd2dpM25hejJiVHl5UmhiSExrdmxpNTExbzA4OU5HRUpK?=
 =?utf-8?B?OG4rT1RHUS8vWDYyaEFEeHY2bldYL2NKNEgwOEdTWnk3ZXNLOXowMnY5ZS9Q?=
 =?utf-8?B?dHFOSUpkUHBOSXVnUjhSd09sejdiUk9EcDZMbGJocHRhZmlDUlNOeEorUHdj?=
 =?utf-8?B?d1dndWRHRVpHanpERWp0RjJ0ZDkrdmZOZUY0MldwSlRHL1d1aEN4MUNORG1o?=
 =?utf-8?B?WVB1bGN3ZG5OQTZwR3hFTUE3UVNTeXBCWjlvbkZYV282L2ErZkMvclhSamdm?=
 =?utf-8?B?MlNTZktBVE0vdklMRlVsejliSi95bUpBRkxJZWszOWF2clphS1lhTGN3SVhs?=
 =?utf-8?B?aWMyVTUyOHdVa0crclhxTS9RZk55Y0sxRmNJSUpDRkEyQ1Rab0s1TGUwc3lI?=
 =?utf-8?B?ZytZbzBiUHRLTTBVeG9TbkxMYmQ4R2MrVWxPYjgzekszdUgyT2MwdjVlaXdV?=
 =?utf-8?B?L2Z6bExuVUlzTnMrTnJJTkozTGhoWnZUcWZCT0NuT0pqS0tFOW5OOTdTTHRO?=
 =?utf-8?B?V096RDQzZG5YNm9EcDB0LzROUXJuSDd0cjJZcVhGUWozVyt0ZjJWdlpId0pV?=
 =?utf-8?B?eUVVTWJZcWN3MlVrYXNNdVRjc2N3cXp4Qld0S2NTd2lFMXF6TXU5UkNQOWZL?=
 =?utf-8?B?K2NWK3ZRYWovSGFFNTRia2V2WXVzc1ZJTk1vNnlQNkpNU0hzK0Y0VjVGb3pr?=
 =?utf-8?B?Y3FGVmZ6SGpFRFZqRU80SmgrWm5NTUdKZHJYeEdOM0RnQnVWVXVQbzhyOVFB?=
 =?utf-8?B?Qnp5QVRwZFI4RzByVExUcm9zVEd4cEFNczdodGFWTUoxZVNEQU9hR0ZQZVdU?=
 =?utf-8?B?bWFVNzg5VGFtOWxhUVhMSTV0ZHRrb0dCd0oxSDEvcmZoaE5jdkFzdGlkTURX?=
 =?utf-8?B?a05VaUdIN2NjT0tZMWRYckxTTk5EUzk5dmVFb01ydmo5VlNkUkhoVmVxZTdt?=
 =?utf-8?B?MlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	BIqN5uHiQWWA78a+YPOti0aWJnphvNhSEv0uEfk8h5pDCxALCMp6Mp1yxcFLDX5LAeTQsL/rLmi19YOkCI9jFsepDTDQYWIuh5b7YVbkYHUZTUVMyhB5T2jxE5rrAzeBnUlufGzfhtAAEQRGJnt1TxneENrSfC1V2bA2lLTidspVILN0dN0qYoloTiDIq+41pG2GN9+QwEZzV0fU1XhGTXxknJo7BsmhM2WPyjjIVhg7b1Tre2BzAJzs1P3w94Ab6xoYK0OvZpk6pPUS3Y+/A5RKDMF7rgzXhIfmjbkabiokMsYGLEWDhVzAtbsqDGBcFeestdd3nJufk6x99+NfCRzv0IGsIhVgew8YxuPl9chtpgQOe44FRWzNpuKjiU7OUez2T0OyICzvDo5BFXv0W8SdJ6qI+C28syG/3aHvNClpPkxelA/ohF3sVprEYz9dO460Qz+j7ye0mrJfvLlGNGnJD6W6qTJplptHTAS8ahnbrO9CiAL3wm6SiuRpxmr/eu8LJMPKgIwvXCGuoT/js7/oRdpFpzca/Zdym5kkUp65OMnQd/F2wE6H6wmUgiLv1v03G2D3AhAGBYnoBC5ctnelxdEb3BdpDgLbLu9cvGk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c6cb470-93fb-4682-c17c-08dca77487b0
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 21:56:51.5189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oYue77NpG1SSxYaok/Z+q/w4Ro5m5IBdzCpo3SVeUlUxVyo0n7dETE/5oD9Wa6v0cjGEUz1zZiJW8WwzXWGwteakDLAJXF1V/vgFD+po6lk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5651
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_15,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0 bulkscore=0
 mlxscore=0 spamscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407180147
X-Proofpoint-ORIG-GUID: IEKc1_mTnskhuzF_AUI6rKZnh8_Z-AOF
X-Proofpoint-GUID: IEKc1_mTnskhuzF_AUI6rKZnh8_Z-AOF


On 7/18/24 2:21 AM, Juergen Gross wrote:
> The recent adding of multicall debug mixed up the referencing of
> the debug data. A __percpu tagged pointer can't be initialized with a
> plain pointer, so use another percpu variable for the pointer and set
> it on each new cpu via a function.
>
> Fixes: 942d917cb92a ("xen: make multicall debug boot time selectable")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202407151106.5s7Mnfpz-lkp@intel.com/
> Signed-off-by: Juergen Gross <jgross@suse.com>


IIUIC we only need data until SMP is initialized, so setting per-cpu 
pointer just on cpu0 may be sufficient. Not sure where to do this though.

But this works as well.

Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>



