Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F03A996BD
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 19:33:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965060.1355710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7dyb-0006lV-48; Wed, 23 Apr 2025 17:33:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965060.1355710; Wed, 23 Apr 2025 17:33:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7dyb-0006iv-1O; Wed, 23 Apr 2025 17:33:37 +0000
Received: by outflank-mailman (input) for mailman id 965060;
 Wed, 23 Apr 2025 17:33:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QZsN=XJ=oracle.com=ross.philipson@srs-se1.protection.inumbo.net>)
 id 1u7dyZ-0006ip-DE
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 17:33:35 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 135d21eb-2069-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 19:33:32 +0200 (CEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NGtpsk020146;
 Wed, 23 Apr 2025 17:33:23 GMT
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 466jhdhtwf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Apr 2025 17:33:22 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 53NHMscu039329; Wed, 23 Apr 2025 17:33:22 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com
 (mail-northcentralusazlp17013063.outbound.protection.outlook.com
 [40.93.20.63])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 466jkfxs43-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Apr 2025 17:33:22 +0000
Received: from DS0PR10MB7224.namprd10.prod.outlook.com (2603:10b6:8:f5::14) by
 PH8PR10MB6670.namprd10.prod.outlook.com (2603:10b6:510:220::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 23 Apr
 2025 17:33:20 +0000
Received: from DS0PR10MB7224.namprd10.prod.outlook.com
 ([fe80::c57:383f:cfb2:47f8]) by DS0PR10MB7224.namprd10.prod.outlook.com
 ([fe80::c57:383f:cfb2:47f8%5]) with mapi id 15.20.8678.021; Wed, 23 Apr 2025
 17:33:19 +0000
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
X-Inumbo-ID: 135d21eb-2069-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=ZjdExZMFYANObZS1tEnGuwzYJmP7oufyiS0h3AflKgE=; b=
	e4JtP6m4RVfCb4HaYrI/Gn/bmWBmaTOTDjJSmoeJ/D7xIE4u67A1uqbVNb06wJiK
	10Mh0gdX498AfhW8mp+1VQej64DL45umHUgwmJgeFhLPDNc9yH0DbJpqvpNm5L7P
	CccbF6pgJr54Fc2A5z9Liy48rDVGEZTqNze8BUxy4q8/64aqb2r4AWxscrqzX6RM
	/yXkbAUXsgJnAJ5WQMF6Z888IVC1iTislBxW8WBsYTfE9xFhO3Z3meivgtI+T5oe
	wFeM2koRqQlnXvop6dSv/+SeBgkalpTeuzPMkYCCDTIkFZdndFi6id4iuW5ZQRej
	Nc0QpwYTaphvDYTmhNC+lQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uRzGFpAPLLb+s6MrJUyo3cxM0N9/sAHDdVrYP0Y8zy81kmF60yYjulJxfX0UCQ86BAiVgnlrDxReiOqmjgXpqw4TY7ETsrkmn9LizQ05rWLukfvhJcuOw+V0Ts7CiUr2SqqYW2JXZUsMXBA9le6l7+4DQxDyQSWOrsiMbZy59hyDXj5L+xZNWG4XJPwUMNtM3VlU3BQBKJ6NTjCb0aL0yDkQP2K1Up3+xNm/gglG1xD4ZQD+/Cgn1jxfsvuuuw33IAUYx+EqCEkLfIzWN6tS8ONS4qG8aHgfDfJJGIOv1+3gbEH/Wzcqxbt8VcpEbAEHewEasQG9qUezTvzZ+d/pIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZjdExZMFYANObZS1tEnGuwzYJmP7oufyiS0h3AflKgE=;
 b=wDjsVPA64s1mPmaLDOpML560sfNsa2znqE0ZAsGBFxRp1VKXhdZ8aAYLu0E2mKzqZDigHfQEvyjJ2VwhuQEfflj2+do3Ken5xKKCaOe26vg7+otuxFdPMLhktay+JJ9Ek0mnSoTipCVfwOlnXx5EcJ08vLl9sO8AyhHswZbg9rhbAHN3VHhkvCVEcu5P4gXuTmqLqfcTfRQkMvIwomGWe4/28w+ZWmBnJXaCVVWz4AFpE3iaxTxzrxXw42CVyN4gNQ92eoOiIG+ZhrDoen+USXGIUrOkO14+Y5N+C+ZP3kQp4FVtnDf+jfihzvVlzqiXgvCE8WpHTiSxgJFXzhCZdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZjdExZMFYANObZS1tEnGuwzYJmP7oufyiS0h3AflKgE=;
 b=CL+UHf4arMXXTOgshgHEF+VBe+wH2FKhHbzWcsCxli0PQTojr3c/JEpm339YB44+XP5g/zNhg6o2GXYGdC3MAtgJBcgG/VWF3PmDEk7lqRsv2OP88JdyjQ/16J96CPCeMf/7u90Hv5e++b7Iw0s5uQh27nOSkLbE4GqNNH5J+wM=
Message-ID: <7788b19c-7571-4afe-98d0-42c992c7a440@oracle.com>
Date: Wed, 23 Apr 2025 10:33:17 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/21] include/xen/slr_table.h: Secure Launch Resource
 Table definitions
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>,
        Anthony PERARD <anthony.perard@vates.tech>,
        Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
        Julien Grall <julien@xen.org>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        trenchboot-devel@googlegroups.com
References: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
 <1cf5d940e666b2b292fc84ed1fbb8a95cd57f027.1745172094.git.sergii.dmytruk@3mdeb.com>
 <87ad3627-088c-442b-bc2b-89586a082599@oracle.com> <aAj9mO3btAWZbOJp@MjU3Nj>
Content-Language: en-US
From: ross.philipson@oracle.com
In-Reply-To: <aAj9mO3btAWZbOJp@MjU3Nj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8PR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::15) To DS0PR10MB7224.namprd10.prod.outlook.com
 (2603:10b6:8:f5::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7224:EE_|PH8PR10MB6670:EE_
X-MS-Office365-Filtering-Correlation-Id: c8cb55e4-9514-4a69-41a7-08dd828cf05d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dzdXUC85UFloeDEyWk50QlhjbXgyZUdRR3QvYTBhWkY0QWFQcFp1bHdzS25U?=
 =?utf-8?B?OEZYRmgyK0NNL3dkSFd5V1FpNm9YNDdOQ0tVYkN1aXhQWnJSSVRmWVpDMGY1?=
 =?utf-8?B?SkdWMGlMQVRlb1RyY1laOTV3eGVLSGZHSlVYK0ZnUmVWY21JcjE2dTNOSGlq?=
 =?utf-8?B?cWltZEtMeWxlbWpISDBhMGRNK2tPT3VaeDFpTUM0Z29CelBDak9pZEdtM0Ni?=
 =?utf-8?B?NGlaS3RpVHc4b2cxSGFhSTFENm9Wb3J2bHU1c3ZwNk56cFg4a2hYcnZCSURN?=
 =?utf-8?B?YXdmOGVjcngwT3dvdVlhOVhOTFJxQ0pvbjEzd0RxN095VVVkbHFmVGxaVzhP?=
 =?utf-8?B?eGZ0VENYTU9meHh0L1lMeFhJMS9TMkR2Qk1zRkJteTNObE5mZVF6a3QxM2dB?=
 =?utf-8?B?WEJjVXFCQ2hJRFVPSDZ6Y1hDTUdIY3pJdHQzUWlqVXgxTUg1Y0dPRUc4UlpP?=
 =?utf-8?B?VlhldGppRU0xbmFIQXdGWXlCeEk3NEk3eEhUSFRGUExmSytRclNUaVNtR2VE?=
 =?utf-8?B?SWZ2eHNUYnVjaWdlSU1WUS9YU1kzNExOOXBMbXc3K0tuVXhYMHdXR0o3K25s?=
 =?utf-8?B?TjlrelhJclMrOTAvR1RScnVNd29HdnhnMk91RndhRjB1RndQWVNOT3BJTUd1?=
 =?utf-8?B?dmtkMWNVT0tCaS9iaHROcGEwODZGclcvSlYzMEpJQlBaT0dCWmU4T2plZXRR?=
 =?utf-8?B?Qk13ekQrMXBNTzhSdlR5aGJRZXB2aktPM29wSEI5bnpLV1ZrSXRTRWRHQXBx?=
 =?utf-8?B?TW9DcGc3UXhJWm9aUkZBYitVOVlROVBKYi9qQUJuTEx0MFNCYXQ5RW1iaHFJ?=
 =?utf-8?B?WnNYZ1Ywd0VNS0UxU1Q2ZXI3TDNSajdQOVd5TzhkZStDVWI5b0xwWldnc1Ju?=
 =?utf-8?B?Y0J3TTFCbXJsSVQrQVYwVHFEeS94Y24zSkM2V3U4M0FkY3ZOVExvc2NaUjhn?=
 =?utf-8?B?RC96V2Z6TjlBcFdmTWRZZndJTEhpc0dmVTRDQ01oU1FZWmxBczEzNWFldFg1?=
 =?utf-8?B?a3lRUVJIZUE1YVo0OTFXTGRyUWJ4T1MyV2xsUlVxNHByRENHTzJ5eFlDU2tE?=
 =?utf-8?B?amhzSzRSdktsZzRWOTNtTnZUV2FXcWF5VnM3d00zMmtPNldqeTBHUHhPS1NF?=
 =?utf-8?B?MW5NMzhyQ3lVUU5FTm1tMjNoZmZJWDZjSDBkK1NDRklKdTFJcmdIeFBxRFlQ?=
 =?utf-8?B?TDFhRTVRblJiUlFoSk0zYnJneTJHamNwaVR0eDExVHlqMU5WY3M5d3Nzb3BK?=
 =?utf-8?B?T3dtTHB1dVVqcUM3SkFLaHFRRXl2eTFZMzV2WWJiaXVtOTlkNXFScTFrY1B3?=
 =?utf-8?B?TFd5RjR4dWRIQVZGOHdacU9YbG8rMm9Td0kvY0JyZVBhS3ZUaXcrMnJQNXBY?=
 =?utf-8?B?YUxkSFNHRjQyRjdwYVJ5WEtnTTlXZ2p0OWZOc0VXdkJCdmJJS2ZwamFjU2s2?=
 =?utf-8?B?WXFuREtCcEMwZkRQT1VRQU9mOVlodzZZQkpYL1VtampJb3ZTWHY2bFdlWC9a?=
 =?utf-8?B?dWNmbEhxRFJxTXZZMFJCZzV5d0l2UUVKd1Z6K0FCcUxKVnBudHQ2ejdTend2?=
 =?utf-8?B?MSt3dUk1UlAvdktNNFF2bFBhLzVXNUdpR1ZsOStFNjUyNjFSVis0REx0d2ZB?=
 =?utf-8?B?WUdpd0VMUjluTU5rd3R5WnpzRHhaY25CSzgxRm1yamlvanN3NUFnMWJ5S0Jx?=
 =?utf-8?B?ZWpGMFc2bDIzUi9INTgvSnlVMHJLOVY5YndlZUtCZVcrVkRGNVNSUjh2K0hD?=
 =?utf-8?B?dU1xdm9vdU14OFI2RklwMWJEbEZkV0pGUnpkaUQ5SWJJWDlqNklYV1lhMTY1?=
 =?utf-8?B?ZEovRzdRSVB4ZGtTVnBtcU5CKzlwL0NIVkFmREtUK2NoR1duNVNvVnBkektz?=
 =?utf-8?B?ZDRpVGs5VDN2L2F3Q1R1QWc0T0ZERXpCc2ZTS2tseUVveVc3enREd1AyRFVG?=
 =?utf-8?Q?VCfQUyy9q+g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7224.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2FpeEtUaFF5TFpDMW9pNERLTWpSL3g1dHVSQ0FWSllVajcvelJ6Vk9tV0Rh?=
 =?utf-8?B?dnV0WHlVODVsczhORGhPOHVNQWh4dFAwSWJaS2hrNkpTOXZRLzI4b0xTNG05?=
 =?utf-8?B?am85NVp2bmRXYTdYS0ZYQU9oU3Q5bU1jZ3N3Vlg5SlYwZElLMTNFVHJpZFRv?=
 =?utf-8?B?NndHY0kybUt3Z2tSM1FQMkl2VXpzWi9wRTZIVHJWU2tKcGVPSVY3ajhtb2VM?=
 =?utf-8?B?czVvMVZRaXRqN0FKN0VMREl2YWpzTnVKelVHaDhuVGNaMVlCVnNNYTJiYkwv?=
 =?utf-8?B?Ry96aFdOUDd0NSt3YkE2ZXc5MExwbWVPdjBSMVNIL3I3dndacXFEU1JBSG9W?=
 =?utf-8?B?bkswcTR0REtnWk5UNGpUV3UzNmhpYTdJTU8za1NlejRFZGs5eEtEbkdnYkUz?=
 =?utf-8?B?Tyt1UitIaDQrSGNsWVRRZzdRK2VacG9zR2NaQnFrZ0srQnloeWdjS3V5MlQ0?=
 =?utf-8?B?NGgyNnZpZUhWSllCKythSFU3VkpGSnVDNVllRVlJUkxsd0cxNEl2V0hpUkpz?=
 =?utf-8?B?NjBlQW5PUDhSZC84OWpGcGJPKzJac0xYSjJ1YnJaTmNxeSt0L200M1FncFNU?=
 =?utf-8?B?QzFDUGMzeEpKTjVKL2tzYW5MTHM5T1lseDdhcC8vaHlaRE9zQkVYdytkQ0xG?=
 =?utf-8?B?RG80a3NvS0kyYUdJV1l5dDV4K0pBUHMwYllxdDhGZWlkMHRBZEJPTVlXVTJJ?=
 =?utf-8?B?SlJwdGU1MUtmVXU2c0p3WW1JeHRmaGdUcnMvZ1Q3Z1RiVEU1bnBWeDZhSllw?=
 =?utf-8?B?VzA4RS9TNkxYMUlyVU4vbDNtZjNWWWx3aSt6QUcyRzRNcGp0Qms1Z2NqSnhl?=
 =?utf-8?B?b2Z0NC9CQ2hkdnh1Smtra1V3TGFSZjA5dWNtL2xCZGIyQzg4enBhdFh6Ujhh?=
 =?utf-8?B?b2s1eEtwbTJiVjVvd3JlenpldFdScGlUejBjVlMyV000aWJINGVyTTNzZmUr?=
 =?utf-8?B?RXFPd29GUklYbzllZTdMd0xZQXgyaVBTYnRqUUpkcW05QjM4ak1DT2dCZHRU?=
 =?utf-8?B?WnJXRUZPazJjQ3kwYWxlMnVUY25JR0U1ZVIvQjFHakdIVE1WNUVkclRQQVZr?=
 =?utf-8?B?Wk1VME5UMnB5ZjdSRklnUklUbExNWVYrMnVQYm5mUHZBS3pZdmNLb3VjTzZu?=
 =?utf-8?B?SmVnendFRzFlZGwraGZuVDRvT3hYZkZpTUE2bEVpNWNmeTFyUXFIeDJ1Q2Z3?=
 =?utf-8?B?dnI3U0tjY0piTkxtZlVEWlk5eG9wZEplVWtSVlY4ZE5qZzhLNkNSNzNRK08w?=
 =?utf-8?B?Q1RuRlY0dkNkbnE4bWs1KzU3ZGhpdUFvVER6ZXFtZjUrODU1WDY5VWR0cDBO?=
 =?utf-8?B?ampVa0xkMDEydmVaM2pBbTFJaFdZQWZwTXFHR1VRbC9pVGZMUWJnaExJd2lq?=
 =?utf-8?B?Yi9kZ2dpN1JBSTkxSm5EWnZwNUt3RURVSjUxZG1CTjUvQk41bW84MGwxNmJK?=
 =?utf-8?B?aUtoamw5ZmoySDRKWW9Qb21Mb2hvTDdLU0N2N1g3dWdCeHZiKzlBSEY2UWNI?=
 =?utf-8?B?ZTlxdFhJbCtsUjhlNHlHMkdKQWlWVFRUVXRyWExzSllITWVXUUtTdCttd3FG?=
 =?utf-8?B?TGRoM1Y0MFU4UjBoVXloM3l3ZnFvM1VDWnBjLzdVTzhTeGJIS010RTFlRy9Q?=
 =?utf-8?B?aDhqbDZUbm5SMnhxTzllTy9wSjFKU2ZIVWVEZXNqUEk0R3l0MjZlTWJpMU5H?=
 =?utf-8?B?V0lqZis0cWVFTXZ6Z2RLdFpYeExGZ01obS9WYlN4RGlrc2pkQ2pUTHJDUVQ3?=
 =?utf-8?B?Wm1ZUURuQVdDeFA1S2ZXSlJ6SmNVOFFiZ1BNMDBMWjdzTk45ZndEbHlmODRW?=
 =?utf-8?B?dmFVUi9RUWg2Q3dZTUtjU3RvM3BrVmdXbVIwVEFnVmZTakViWlkyNlBVa3NG?=
 =?utf-8?B?cHA5c1hHZkJQN05FRldBbzRINkZLd3IxV0k2SjhPTlpHY0lxOUQxRG8zRWpq?=
 =?utf-8?B?dWNDQUk5STZROWl4QjVIWk91dE4vd1V6akl5ZEUyVUJwUDc4Z3A0d2VxQ3Qx?=
 =?utf-8?B?OUgzUkdhaU13Qmg5aFVsUE4zNjVsK3pRb1F0ODlkeHBUdUlNM2IxNUNnVitR?=
 =?utf-8?B?dmhGOWppRmVrcHR5SXRCeUF6dUtZdGFlR0wvcDlwbFdWZkFqUzRyWXQ2ZlQw?=
 =?utf-8?B?MjBWSGs3VWprK0IxQ3VHN0luYVJUbzJaYTNqcklVV29tSXNCSWtVSldnVFor?=
 =?utf-8?B?TkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qyZAuU6YpOeauzwCX9Nb6ATw5+VjhKUVLha/apYiBj5cj1G4Ft8hzenfp5QugFHjvyWN0GkJhXlF+q8SSbd+OI33t7KrjIWAdSYMTrbeAYHzT9c9Bq6KhV7TmUxvF6Xo/wDpCMN+HgG49rzYK1vXbmJRqP5NGG8i/AWUoiBdoP2W7FDekGZt6v10Ue3da6I0nkOQUjDcEmiVObHKPYnPNec7QEYcAjM4NWi0btV2ONFInq6iGBgT3jppIuiqgrUwaclgw3KCXBsPbrw4QNewMugsq4Vnwliw3VkKwxFcoY/tHpQQJ8X/QVYoFGtnajIKcCd9nBV/JR1PWpmXzBJ4NvDugvo+Y2P+57OJJJAVNCvgtYpn/1FtD5VMnLxP9ATPiLkHFOG0UKYvg7Jgip/Kxde0CAQdbG02H7ZMGiy0cVEGPV7MN73d5EKVtTW+qDucB9dc6vXbpsr2VQG6jlMdYbDo3aS3ZMB7Zu5OyosOBor/zxcLoHQku5au9yjopXUu6pv6zLx+XS4eRUdro326gktxVawf2B6HKNRpHA+d44sy+E7EKNW76pPKpQrKeckDFMO8kNgULBbTFydNfGJCA2rfkMoTD5Sbv5DXtOHd6LY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8cb55e4-9514-4a69-41a7-08dd828cf05d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7224.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 17:33:19.8215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JbwjuK7gK4eKJRUXK/VDhNg5IX4ulcrYl4+7C1w5UZtbQsOetV5EwtbSSZ2VwaWPfJx+lYwgo9aFHvmdnuZgvk3jx10rBGLJxclbyMNGLOI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6670
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_10,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2504230123
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDEyMiBTYWx0ZWRfX9H/tmYZg4+s5 fGBBAijtN8UOyYN6PNk9dxoG3u5nIL1s/d++j4CgAIFNJbkI6J7HeBhA+FL5icaE5UC9UJCtLhH BbHbjYiAixDGgCDDanDI5PYEygImBk3BYv4anui64JSieA0TnSHgmydK1i7UwkXFYvO+sANBXeR
 IqQg/T7LhojT5mq2REFwt9dormeoyXXg2ldNmHrZGqEMEHlK5z4h4gdNRbIxFuQsAhmVxt+sXXm nNIKGXg8647ez5MNcYHUvrMj0J6mCVe65c/QuAKiLdRa5T8QXdSpQbihtK7DREu+k4EgI+VUuiB aFmjNRqVbMQDNTHnm7sutL1ijI3aIPMWabGJdszIiNQgNMXHa6cxJqYSYL3rJXIJsgfIb0xnzKz v5Y7oOyf
X-Proofpoint-ORIG-GUID: bbVJ0sxFOydGhwKu8ZzXhbzXonKktMGZ
X-Proofpoint-GUID: bbVJ0sxFOydGhwKu8ZzXhbzXonKktMGZ

On 4/23/25 7:47 AM, Sergii Dmytruk wrote:
> On Tue, Apr 22, 2025 at 01:46:14PM -0700, ross.philipson@oracle.com wrote:
>>> +
>>> +/*
>>> + * ARM DRTM Info table
>>> + */
>>> +struct slr_entry_arm_info
>>> +{
>>> +    struct slr_entry_hdr hdr;
>>> +} __packed;
>>
>> You can probably ditch this for now.
> 
> Right, it has no value at this point.
> 
>> I am surprised you did not need the slr_add_entry() function. How do you add
>> entries to the SLRT?
> 
> Xen doesn't add any SLRT entries.  It's also the final consumer of the
> SLRT, at least at the moment, so no need to update something that won't
> be used again.

Ahh right. The Linux version allows the policy to be updated by the EFI 
stub but you are not doing that.

Thanks
Ross

> 
>> Thanks
>> Ross


