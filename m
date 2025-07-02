Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA07AF5DCC
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 17:58:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031396.1405217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWzqA-0002oE-HR; Wed, 02 Jul 2025 15:57:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031396.1405217; Wed, 02 Jul 2025 15:57:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWzqA-0002mX-En; Wed, 02 Jul 2025 15:57:42 +0000
Received: by outflank-mailman (input) for mailman id 1031396;
 Wed, 02 Jul 2025 15:57:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HxCC=ZP=oracle.com=ross.philipson@srs-se1.protection.inumbo.net>)
 id 1uWzq8-0002mM-JT
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 15:57:40 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45d30b42-575d-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 17:57:38 +0200 (CEST)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562Bj2uS003915;
 Wed, 2 Jul 2025 15:57:27 GMT
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j7af786m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 02 Jul 2025 15:57:27 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 562FWqb4019358; Wed, 2 Jul 2025 15:57:26 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2059.outbound.protection.outlook.com [40.107.236.59])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 47jy1g5xpw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 02 Jul 2025 15:57:25 +0000
Received: from DS0PR10MB7224.namprd10.prod.outlook.com (2603:10b6:8:f5::14) by
 DM3PPFC7C228AEC.namprd10.prod.outlook.com (2603:10b6:f:fc00::c4a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Wed, 2 Jul
 2025 15:57:24 +0000
Received: from DS0PR10MB7224.namprd10.prod.outlook.com
 ([fe80::c57:383f:cfb2:47f8]) by DS0PR10MB7224.namprd10.prod.outlook.com
 ([fe80::c57:383f:cfb2:47f8%5]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 15:57:23 +0000
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
X-Inumbo-ID: 45d30b42-575d-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=ZvPK75o3bYTptddyqNfnRR3CKhdno4I1MBhXfSjF2ds=; b=
	ExEXbZuoYRRNzuVPf32E+CIa8mGhZqtS5wk4wklNYqx8AIZ8e8WbB4fJBdhpEzoF
	vLnrL0c3QR7JMLgMYLmYFddg21sBlIqryD+uMQ6cZmb1s4yMEVoKRBj/rkBDJZLe
	flARATf1oOq4vgkvU9legNUNKPt1LZ39/1eXS8ZgkDBMyjXBaFcNmIEgmnyhO01l
	6OlgLp7VrYwLAqbtjr4gB54oeccI7mPKcAsJq+DDWwk60vgvBcP9zmuUw7GYCtuk
	Ig7jcZfOKA2a5ce3l+Uab5bpJqae4QUgIDPttD7h9Us7pmBdTwG0yDxYOfoRWBwx
	BoDNPf0USvwDGLPtz88Oag==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rCiuktVkyveFlwCKOGP5wgqC3YJCDWg035XiiwUpI0nJ2kcyLS8LOyMBR1qGp7kUvvXSqMl8TvtYN7Cp+0emDIGdgU8yPMY2AGnmIkTr2U1SPGAfZk4Ly8CKHEzXQ4DgriBeJuG9jLxTcm2QJNC48Lq4dzwC5VUMdqfxEVVRjoTRSGNy6ErdQqpYpYIamQheRg3UEbvx64LyK394waUlNERiLIVVbNqz/GbVUVBXwAeFxZc7orugF8EQig24zEz9dobRwwXUi9nK0V0ba+0SzV8AsIHFgKPRkcL93uLqrtnSjIXOfOWKP5LK3+OynXX00nhg4BpITDmBROan0qAgOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZvPK75o3bYTptddyqNfnRR3CKhdno4I1MBhXfSjF2ds=;
 b=vyo0VQOBOJO2Fu+iVfqKVlmzNaf7IDcsMPCEtLlp6dq97dogQ6GbJqAkVgm7HeiWHrOEr1xw8I5payUSdXTYHEbemp9Vk6WARA+Dr5PUf2Sy0J7n09jJgMl+5SYddWG3cP6Nb7sIUJPfUdgkBwIyK52/QOn++377wpHhOCwyM0uMn3IxokozJcIQ8a4sp11QhNDFmCRWwmcpQAUrLDdPJBlAm2/WA/lGAvwGS+4gmAyP4MmcSiNZi6W1TvTOi4nVTOF20ave5h03X/QSHSnOPU8kF8/9VH1sn+zHwNZT/uaV2dQg/uStxJcz535fszttwdv5f518iAztfukLpo+g/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZvPK75o3bYTptddyqNfnRR3CKhdno4I1MBhXfSjF2ds=;
 b=dEsvb85zAv8eAsLVe8FbKcVA6/xeQigmmFYKRevZV9O3xydcFC1huTAsIRa4gyXc4C6KbyH77dBwgCsonyoJofutrmvBMxsZsFprP57yiZI1uQGgk4OqPgPI4n4koyLb9k8pnD1R7z7xelDEUOqwoe2B+RO0c9PMrQz1FBOq/+k=
Message-ID: <db5c4f5f-6ff5-4c9a-b8d3-566c1998c41f@oracle.com>
Date: Wed, 2 Jul 2025 08:57:21 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/22] x86/include/asm/intel-txt.h: constants and
 accessors for TXT registers and heap
To: Jan Beulich <jbeulich@suse.com>, Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Lukasz Hawrylko <lukasz@hawrylko.pl>,
        =?UTF-8?Q?Mateusz_M=C3=B3wka?=
 <mateusz.mowka@intel.com>,
        trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <5da8e6c9fd2d986cd99be35774b850584e4a43ee.1748611041.git.sergii.dmytruk@3mdeb.com>
 <ce7ff2f4-4657-45a6-98ea-7f6d3a448447@suse.com>
Content-Language: en-US
From: ross.philipson@oracle.com
In-Reply-To: <ce7ff2f4-4657-45a6-98ea-7f6d3a448447@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH1PEPF00013312.namprd07.prod.outlook.com
 (2603:10b6:518:1::d) To DS0PR10MB7224.namprd10.prod.outlook.com
 (2603:10b6:8:f5::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7224:EE_|DM3PPFC7C228AEC:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f1604f8-1a22-4c2e-80ab-08ddb981224c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S0FWOG5wbHlNbVEwL1dWNlJNQmhWMkRBdlBGQmhlL2tiM1ZZcDhGYmQ2VG90?=
 =?utf-8?B?S2tDcTN3NmNQUHpYUW0yUEVkZHBpOVpSOXJaa3ZmVERidE5WNDBaWFcyWWJj?=
 =?utf-8?B?ZGY4MzZ2dWRnRnJlRHZBbGczS2diRHprWjgvOFNGZ3M0UlVya2J2aUdTVUI0?=
 =?utf-8?B?MXh5T1NObnNuZXRYMlhYNi83cThMVWUrMGhvcjFiSmhHMlgyR0NtLy9UOTE5?=
 =?utf-8?B?ZmRZVWZOMUV3RVF6cU5xZ0R4MVFUeHZ5Q3pMSytKTUhXMlZXd1RIYTcyUXUy?=
 =?utf-8?B?Vms1b1pmdUVoMm45ZS9ydVFRZ2JydDkyczN2a2R0YlBvOE5ibUE3bnpjZUZ1?=
 =?utf-8?B?UHdTanJHT1MzZjJGRXdUZWxNR2NCWGNtZzhtTVhIR2FON3dQdndFRC82bTJ4?=
 =?utf-8?B?Q2ZrSTFSMmZ6RnpIWXF5ZndhSVM1VjZFMS9lSFhsOVU0YVlLSXhaSGhLcisw?=
 =?utf-8?B?N1d1cUxtODZCS2RmWVE0dXdDRmNmSlVCekJvdmVpQ1BmMm5zQUZvR09rYnox?=
 =?utf-8?B?T1JHdDJxZW9LOXRxYkhiMThTS0ZPZnJrcEExWU1COGhtN0pOR1lGSWthUWl3?=
 =?utf-8?B?ZTIrQ014RnZLcVJHSFpQdlFoUTJYS3JueVlxNHRaZlJQZ0liYjJDUkYrMlI1?=
 =?utf-8?B?eGRYbEpKUXYwSnVKR0d3cjluandwUVQ4TDk3ZXFoUmV6U2FtVEFPZ2RqaVMr?=
 =?utf-8?B?d1FZSHl3VXF5UjFoaEZjaEIzQXZqT2N2MkN1V2IvbUJoUWd6RFJ5R2lVTUd3?=
 =?utf-8?B?ZGk5cG91bnBMdTZjSXF3N0NkNHhabWtrZWw1ZGVyT2NpdVZZcllUa0ZrY2o1?=
 =?utf-8?B?dStQc2UvSXNBWUtRbWJjUyszMkhCdDNNUS9kVEVYa2JjQld4R2tQMmZWNlBX?=
 =?utf-8?B?bjdwdzZxd2Zjd201c2JTZS9TKytwd1pnZzhUUTl1Y2Q5TzFvc3VHYmtxS1dz?=
 =?utf-8?B?NUhpNXErR0ZTNHFMWmhxaTE4elRibFVNMXdFbnQyKzdsakJkejhTVTUrTnB6?=
 =?utf-8?B?WXpodlBndDBLcmlUZWxRV2lIak03azloYUgzZ29RL2ZHTXZvcmZvcHl3OW5m?=
 =?utf-8?B?Q09PUDdvRlMxNzNtVGF6c3A2REsxQkZlaW9ZTVBXYkMwbTcxWWJwMjJMMHpH?=
 =?utf-8?B?YlZUZlNNQ3NEWlBCSXNEM3dyWXBEM3RJcE9LTjlKR0JTaTNQdXZMeUtJMFpo?=
 =?utf-8?B?bXZuSUFyeW9oVDZGQzcyM09nb3BpUmZmQjVJTG5oOWV4bTRCNmE2aTNHNnpu?=
 =?utf-8?B?VUhkSTFNdWlnOTZRWXpIZ2J3T3gxVXVmQVZVUzYvVDNyNFB6UmZIMzlyMGVE?=
 =?utf-8?B?L3ByTjJ3am4zd25pZDRnQnhyNVhSMnE4R3FXMlo2NTdVWVdjaG1BTzdVR1Rn?=
 =?utf-8?B?NXlRVjR3OERLcGQ2R2QzcUZYTzNGZ3RBQWFoTHFIcVlodVl0amx6WVdVVlln?=
 =?utf-8?B?MGRrbTRIam4zdXc2alJZV1RKMk5hMzNJK1h0RHI0enc2RmRwVlhvdWhCV28r?=
 =?utf-8?B?TXkveGlHNUdRaVRSdmFibHdkL2NoNUJRVUlGbG82WGQ3TkV4NndmZ2VaUDhZ?=
 =?utf-8?B?Q1lkSXBVZkRtbCtnTGlFRnJTMnRkbTEzOEtOdFlZRGlRK0pad2hhemhnMkkw?=
 =?utf-8?B?VE9xYmFYOThKb1BkUDBHMEIxb3pkKzF3YjFBWGkyYlczYjJhYkp0djhNZ0RI?=
 =?utf-8?B?ZjhNNVMvYWg1T1BxcmxtcTJlaXFETWRBRHE3dWZncXVmUER4MXhSTndmbEF0?=
 =?utf-8?B?b3NxV21wR0VNQWJsaW8wRFpmOFJYWW1OVXh5U3BZUTN4UVJ0bWw2RStPYy93?=
 =?utf-8?B?dlRjdDJkSFk3TFk4SE1ITmRWb2FHa2ZOVlc5YWYwT25SSE9QQUVKbzJoZGFl?=
 =?utf-8?B?ZkJSY1VKeGN1cC93SEx1ait6RVd3VVk3Mm1zekdRK1o3NjlKaGNCQ3BoV1M4?=
 =?utf-8?Q?UtiupwHl1uo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7224.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1hpYkdYS1FyK2NMWTYxVWdSYzc3TStyUVF2c01UOGtKNm1mZGJlbmd5b1Zu?=
 =?utf-8?B?MjhlUlFtRFFmUUpyZi9tME9rNDh1Z2xONTV0amlGRXpDRUtkaWtqenRDQjZW?=
 =?utf-8?B?bVgwM2JrT3FxdjUwWnE2WERRU3lYU0hLVk5IRFphVklwNzFLVlE0dGE3TVBT?=
 =?utf-8?B?NEUxRVIxRUVDU2dNMlFrNkh0VENrOG04cE13eTVGNS9kR043aVVlNE8zblZJ?=
 =?utf-8?B?QVF2alRlRE5paDVyQlBtVVJSbzFkRTVhN1dnUS9nd2hGR0JabUxIVEY0YlNU?=
 =?utf-8?B?ekNuTWZ3Q2thb2Y3N2hGY0VNRE1aWk0rRHlpcXpqMEV1R0xUeUVMREdrTW9z?=
 =?utf-8?B?NGNwSUJYa0JqcEpBMlN5WmZzN1BMc2xTeVBJM1R4NWlSaEl2NDBIYVB0aUZ6?=
 =?utf-8?B?ZHhoL01DQS9GZDlWdDZqSXdPSXlJY3pEb0xtcWJmN053eU5xTFRWYVVDWTdT?=
 =?utf-8?B?YnJqaEpJVHhCaW94SSsvTXcrbyszMXZtMGsyL3JPZkNkMDZKQjluQWIxRkJh?=
 =?utf-8?B?alRORVlIdTlMRWtHOUlsT3hCbWc2QVNTKytKakFxbGZOU28yeU91TzZvR2I2?=
 =?utf-8?B?aU1VODRxc3hSWGdjQWFVcHIwdVVFN3ZUU1BFZ0NobHBoajJiODBZb09qNktW?=
 =?utf-8?B?a294SnhuN1hmdkxtYlFuYVQ0Y0dYS3dGVitqRXJzU3VCbTVqNkVtNnRUUTJw?=
 =?utf-8?B?dFhNUVRsejhhbW84WTNzbmhTTlpDVzNrZWQvMkMwaEZ1Z0FzdHU5clFRRUh0?=
 =?utf-8?B?NmduMGxCdCtEclk5WnBacWYweU9VN2tpemVKSHRZQnV6QVpCeVpJelpOZzFM?=
 =?utf-8?B?V0hHMzhyYTcya2NJL1VJMkV0ZE9mUlpUMXo5MlV1NWk2TC9TSGpSdnZHbUZM?=
 =?utf-8?B?Yk4yTnhIVjM4eXJ5VGkyNWZ5RWMxbG80N1Zld2sxV0xOZlJJS2JTZTByN2ZW?=
 =?utf-8?B?Nkc5VWJZR1VTNjVMc2h5aldTRDVQQ2pWVVdrUVhoUFU1UkZFMUVoR0R6NG81?=
 =?utf-8?B?dkZFOE4xQm1RZDhlb0ZSUVc5RlhtZ3ViS0NLakhaZTVTekNmdUt6SGs0QmJB?=
 =?utf-8?B?eHFOZG1YUWd0SVBicCtsQ09CVjFUd1ZQUE1SRnZDWnEzRW5GNkRSL25ydkh4?=
 =?utf-8?B?M0pBYnpCQnVMZW9YUENudU4rbHE0Z2U0djFKNGd6dUpYRDJ2aUlVNDZ1MC84?=
 =?utf-8?B?ZWZKNHJYcjhVQjVPZGFpTzQ2R3hCQW1USU1SYjFUQmZpcmhBSlpNQWtzQXVU?=
 =?utf-8?B?ckhTbURQVFJEUUZEcVZWZkJYNmRjQWlabjdDTEwzNGN1OGRPaitwMnFNd2hD?=
 =?utf-8?B?SzNxRkl6WVdlWldMeUJBbys5Mnh4a1RpSDZjcisyRngyNnIyUk1wbDBMOE5U?=
 =?utf-8?B?eXByQVc3Z1IyTnBQVWJqVGdaTGpId2FFamVCanMyVHpoUlpwVmFBZlkvUXZw?=
 =?utf-8?B?RHlURlJkYkt1SnBGMlRsTnVBcjBLV0M1RkJQeDFWUU1wdk9jOHFaWU4yMEZ0?=
 =?utf-8?B?QUhhMEp1UFhmV09rdHIvamNEa0FZMkpHZGNaWGJ1R1k0VDc5ZlpXNEJKQnoz?=
 =?utf-8?B?MndGSEdvd3l6UFdGeXJPTm5ZOUJ4U251Ymc5aE9qUUtjeEJZMUNCRjVzRWJh?=
 =?utf-8?B?cnU0R0ZCNnhleDdIWTQrNVYrcExIbWE1bnFjTndCQW5WV0dJbkdXOUJLMU1u?=
 =?utf-8?B?RUxVUTVQeE5UenoxWGxLTzVmMERwdFZXMDdxL1hMYTZlaWpzajY0VFFyRyt0?=
 =?utf-8?B?VE1JOUhTc3hpN3BCUjBPdzdVeUhGbXZHWnNSZlFIWG1xaEtiUUhYUThLaGlO?=
 =?utf-8?B?N0FsYnpaWDV3SmRoNE56S0JGMUY4VXBON1dydGVTa1R6am9HQmJhUVBaV1li?=
 =?utf-8?B?Z01kbUVSdzVaU2U3QnhUbC8xVXFUelNkQmNsOFFleW1ESnJuQWdweUFWclk1?=
 =?utf-8?B?TWh0SWgwUXlSdC9PNEtMVVhLYWhNRW5mYW1TeVE1WGFIaXJUWkRqbEFQbG9z?=
 =?utf-8?B?VEdEMGUxQSs5NDBSbDhtTFFIeTZFN3d1eFpGMGtYcnROS1ZYd2s2STdSbUUr?=
 =?utf-8?B?NXh0MXBtT2xRenpSU29CNnhpZE92bDlpczRmcDRtUVNCelVKcFdIN1ByR3Zj?=
 =?utf-8?B?N092VFBCQUIvTGJuVXZ6YXUvRzlWZ1FTNERvTm1idnpUNmxWVllIV2J6dUVn?=
 =?utf-8?B?Y2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	f2bYF27l7QZ2tAb06zGavroOK5v9VtjTZp8SvVyiIO/19SSX8Ywy99cgtiO4OTyDBtSQXAA4H9U1qKTZ/kFZw1ONjeWe5tkY8Pje+fHpFKVaeRo+aFUctziz9OXUg/WExRp7xDStYUdnwwP+ZtOmrZmunyPNTv6zD8vcVmshbt3t86lippgu1l0udzsJEPhO0I3+qEyiR2KwGeFDD/oz71UhwKQwP9kE6luYsiYthPWBNY9S7zthxuBoDkDr/RVpesJ5s1pdaRuFeTNgz0XmOn3l5PvzvK5GCr+2e6ulGSOwXO5DhBCrRb4YtGNVxkyRtfmbmexXcYOhC81dOUl7rH6oZyZEU0DpeyCO8sFVuHDG7oWLkZJDGORlV4BQfp4VEpRR1kptuNW85Mdv6slNBNy37Dha+3WiSap2jBZiU6F9CBEg5UdRDM532q1VJJ5TQFXGF5NTor4dr5kuzL5oZt+jbiU2vB868CPvwIvlAPb2oSk2U8qumm8SH5ZC0LMArGxJQrIRoqcFT/7XkRggm/fUDi3JU3fQnR5vlpcINmg2aqUZlm6geAlVaveru9YJhO5KrqFCDOgvqaO+bkdilVULuT6prNTbFiJEde95syk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f1604f8-1a22-4c2e-80ab-08ddb981224c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7224.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 15:57:23.8587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JhyyKOK+f+wkyw6JcC7mC7AkdDjVX73uQs5xhkGFqwDVefY6zUYYEM8pL9zYvvMRT2sqGD0Prl6Lp0zn9sXM+z+T5dUjSbPkVnH2h8RE0zI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFC7C228AEC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_02,2025-07-02_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507020131
X-Proofpoint-ORIG-GUID: pbAr7Cdq0mEaDawp9bvGSdoV7O4u-824
X-Proofpoint-GUID: pbAr7Cdq0mEaDawp9bvGSdoV7O4u-824
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDEzMSBTYWx0ZWRfXzxmP1Z7GT4RP YKUKWpgiRv0B2xjC7Fs/swOHBYblaTPT9Z4RyMxpPlDtsul2sCbqZI4InHHBAq8CBlg3ym/9ANe 562K5V9zRqetIIdnz1Kl3oeNDDns0B08zqj5D/jnkwMxnvCQrlY3o86Al66dFbdje3NGoR06J7c
 fpatEGKkQR5wRm3/ST8IDUxtu7ac0jb264aONnW1Jw6jP4E2/SIJjbrRnexUkgnLD6xo4boyr8G YOi8ARHIRZT3iBLs3CrYRPvH9dd3aldGA1msZAzeiNrsvd+6PRVs8mgr5uKwk/DQN6c+uIFNhMn vep3OmRhWMJ88KTuni15d/2AW32rsHgQI+9kW7xTWmn0fFQtiShCa6EkGgmt/KnOnzyOnHWXN5k
 KtJGmgO7VfCiK1XOKHp0SEWJlihT4CnxJrdQlLwB8gHc74sEwi1KkZiChB6M0hO+mtCePUCg
X-Authority-Analysis: v=2.4 cv=b5Cy4sGx c=1 sm=1 tr=0 ts=686556e7 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=QyXUC8HyAAAA:8 a=C_d68mY_AAAA:8 a=jjV5w_utwguzm29xdYAA:9 a=QEXdDO2ut3YA:10 a=k2rM_WiC2-wA:10 a=3O5Heb3VRTsA:10 a=wASdygnoxNaGnvDdgHrj:22 cc=ntf
 awl=host:13216

On 7/2/25 7:29 AM, 'Jan Beulich' via trenchboot-devel wrote:
> On 30.05.2025 15:17, Sergii Dmytruk wrote:
>> From: Krystian Hebel <krystian.hebel@3mdeb.com>
>>
>> The file contains base address of TXT register spaces, offsets of
>> registers within them, error codes and inline functions for accessing
>> structures stored on TXT heap.
>>
>> xen/arch/x86/tboot.c is updated to use definitions from this new header
>> instead of duplicating them.  The change in tboot_protect_mem_regions()
>> there is caused by going from NR_TXT_CONFIG_PAGES to
>> TXT_CONFIG_SPACE_SIZE which avoids multiplying number of pages by page
>> size on every use.
>>
>> Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
>> Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
>> ---
>>   xen/arch/x86/include/asm/intel-txt.h | 297 +++++++++++++++++++++++++++
>>   xen/arch/x86/tboot.c                 |  20 +-
>>   2 files changed, 299 insertions(+), 18 deletions(-)
>>   create mode 100644 xen/arch/x86/include/asm/intel-txt.h
>>
> 
> Btw, a brief rev log would be nice here. I saw you have something in the
> cover letter, but having to look in two places isn't very helpful.
> 
>> --- /dev/null
>> +++ b/xen/arch/x86/include/asm/intel-txt.h
>> @@ -0,0 +1,297 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * Intel TXT is an implementation of DRTM in CPUs made by Intel (although CPU
>> + * alone isn't enough, chipset must support TXT as well).
>> + *
>> + * Overview:
>> + *   https://urldefense.com/v3/__https://www.intel.com/content/www/us/en/support/articles/000025873/processors.html__;!!ACWV5N9M2RV99hQ!OUH3eJp-ibnVcREG1NP431nerbq06yFOw8iSqY_0pRJ_W6p-NKiEx8pNmWP_4UZ5QO0C0SvMZPlD3gfIzoght5uZPuJdxLmWp-8$
>> + * Software Development Guide (SDG):
>> + *   https://urldefense.com/v3/__https://www.intel.com/content/www/us/en/content-details/315168/__;!!ACWV5N9M2RV99hQ!OUH3eJp-ibnVcREG1NP431nerbq06yFOw8iSqY_0pRJ_W6p-NKiEx8pNmWP_4UZ5QO0C0SvMZPlD3gfIzoght5uZPuJdhnQ6RKc$
>> + */
>> +
>> +#ifndef X86_INTEL_TXT_H
>> +#define X86_INTEL_TXT_H
>> +
>> +/*
>> + * TXT configuration registers (offsets from TXT_{PUB, PRIV}_CONFIG_REGS_BASE)
>> + */
>> +#define TXT_PUB_CONFIG_REGS_BASE        0xfed30000U
>> +#define TXT_PRIV_CONFIG_REGS_BASE       0xfed20000U
>> +
>> +/*
>> + * The same set of registers is exposed twice (with different permissions) and
>> + * they are allocated continuously with page alignment.
>> + */
>> +#define TXT_CONFIG_SPACE_SIZE \
>> +    (TXT_PUB_CONFIG_REGS_BASE - TXT_PRIV_CONFIG_REGS_BASE)
>> +
>> +/* Offsets from pub/priv config space. */
>> +#define TXTCR_STS                       0x0000
>> +#define TXTCR_ESTS                      0x0008
>> +#define TXTCR_ERRORCODE                 0x0030
>> +#define TXTCR_CMD_RESET                 0x0038
>> +#define TXTCR_CMD_CLOSE_PRIVATE         0x0048
>> +#define TXTCR_DIDVID                    0x0110
>> +#define TXTCR_VER_EMIF                  0x0200
>> +#define TXTCR_CMD_UNLOCK_MEM_CONFIG     0x0218
>> +#define TXTCR_SINIT_BASE                0x0270
>> +#define TXTCR_SINIT_SIZE                0x0278
>> +#define TXTCR_MLE_JOIN                  0x0290
>> +#define TXTCR_HEAP_BASE                 0x0300
>> +#define TXTCR_HEAP_SIZE                 0x0308
>> +#define TXTCR_SCRATCHPAD                0x0378
>> +#define TXTCR_CMD_OPEN_LOCALITY1        0x0380
>> +#define TXTCR_CMD_CLOSE_LOCALITY1       0x0388
>> +#define TXTCR_CMD_OPEN_LOCALITY2        0x0390
>> +#define TXTCR_CMD_CLOSE_LOCALITY2       0x0398
>> +#define TXTCR_CMD_SECRETS               0x08e0
>> +#define TXTCR_CMD_NO_SECRETS            0x08e8
>> +#define TXTCR_E2STS                     0x08f0
>> +
>> +/*
>> + * Secure Launch Defined Error Codes used in MLE-initiated TXT resets.
>> + *
>> + * TXT Specification
>> + * Appendix I ACM Error Codes
>> + */
>> +#define SLAUNCH_ERROR_GENERIC                0xc0008001U
>> +#define SLAUNCH_ERROR_TPM_INIT               0xc0008002U
>> +#define SLAUNCH_ERROR_TPM_INVALID_LOG20      0xc0008003U
>> +#define SLAUNCH_ERROR_TPM_LOGGING_FAILED     0xc0008004U
>> +#define SLAUNCH_ERROR_REGION_STRADDLE_4GB    0xc0008005U
>> +#define SLAUNCH_ERROR_TPM_EXTEND             0xc0008006U
>> +#define SLAUNCH_ERROR_MTRR_INV_VCNT          0xc0008007U
>> +#define SLAUNCH_ERROR_MTRR_INV_DEF_TYPE      0xc0008008U
>> +#define SLAUNCH_ERROR_MTRR_INV_BASE          0xc0008009U
>> +#define SLAUNCH_ERROR_MTRR_INV_MASK          0xc000800aU
>> +#define SLAUNCH_ERROR_MSR_INV_MISC_EN        0xc000800bU
>> +#define SLAUNCH_ERROR_INV_AP_INTERRUPT       0xc000800cU
>> +#define SLAUNCH_ERROR_INTEGER_OVERFLOW       0xc000800dU
>> +#define SLAUNCH_ERROR_HEAP_WALK              0xc000800eU
>> +#define SLAUNCH_ERROR_HEAP_MAP               0xc000800fU
>> +#define SLAUNCH_ERROR_REGION_ABOVE_4GB       0xc0008010U
>> +#define SLAUNCH_ERROR_HEAP_INVALID_DMAR      0xc0008011U
>> +#define SLAUNCH_ERROR_HEAP_DMAR_SIZE         0xc0008012U
>> +#define SLAUNCH_ERROR_HEAP_DMAR_MAP          0xc0008013U
>> +#define SLAUNCH_ERROR_HI_PMR_BASE            0xc0008014U
>> +#define SLAUNCH_ERROR_HI_PMR_SIZE            0xc0008015U
>> +#define SLAUNCH_ERROR_LO_PMR_BASE            0xc0008016U
>> +#define SLAUNCH_ERROR_LO_PMR_SIZE            0xc0008017U
>> +#define SLAUNCH_ERROR_LO_PMR_MLE             0xc0008018U
>> +#define SLAUNCH_ERROR_INITRD_TOO_BIG         0xc0008019U
>> +#define SLAUNCH_ERROR_HEAP_ZERO_OFFSET       0xc000801aU
>> +#define SLAUNCH_ERROR_WAKE_BLOCK_TOO_SMALL   0xc000801bU
>> +#define SLAUNCH_ERROR_MLE_BUFFER_OVERLAP     0xc000801cU
>> +#define SLAUNCH_ERROR_BUFFER_BEYOND_PMR      0xc000801dU
>> +#define SLAUNCH_ERROR_OS_SINIT_BAD_VERSION   0xc000801eU
>> +#define SLAUNCH_ERROR_EVENTLOG_MAP           0xc000801fU
>> +#define SLAUNCH_ERROR_TPM_NUMBER_ALGS        0xc0008020U
>> +#define SLAUNCH_ERROR_TPM_UNKNOWN_DIGEST     0xc0008021U
>> +#define SLAUNCH_ERROR_TPM_INVALID_EVENT      0xc0008022U
>> +
>> +#define SLAUNCH_BOOTLOADER_MAGIC             0x4c534254
>> +
>> +#ifndef __ASSEMBLY__
>> +
>> +/* Need to differentiate between pre- and post paging enabled. */
>> +#ifdef __EARLY_SLAUNCH__
>> +#include <xen/macros.h>
>> +#define _txt(x) _p(x)
>> +#else
>> +#include <xen/types.h>
>> +#include <asm/page.h>   // __va()
> 
> Nit: No C++ style comments, please.
> 
>> +#define _txt(x) __va(x)
>> +#endif
> 
> Without any uses the correctness of the above is hard to judge.
> 
>> +/*
>> + * Always use private space as some of registers are either read-only or not
>> + * present in public space.
>> + */
>> +static inline uint64_t txt_read(unsigned int reg_no)
>> +{
>> +    volatile uint64_t *reg = _txt(TXT_PRIV_CONFIG_REGS_BASE + reg_no);
>> +    return *reg;
>> +}
>> +
>> +static inline void txt_write(unsigned int reg_no, uint64_t val)
>> +{
>> +    volatile uint64_t *reg = _txt(TXT_PRIV_CONFIG_REGS_BASE + reg_no);
>> +    *reg = val;
>> +}
>> +
>> +static inline void noreturn txt_reset(uint32_t error)
>> +{
>> +    txt_write(TXTCR_ERRORCODE, error);
>> +    txt_write(TXTCR_CMD_NO_SECRETS, 1);
>> +    txt_write(TXTCR_CMD_UNLOCK_MEM_CONFIG, 1);
>> +    /*
>> +     * This serves as TXT register barrier after writing to
>> +     * TXTCR_CMD_UNLOCK_MEM_CONFIG. Must be done to ensure that any future
>> +     * chipset operations see the write.
>> +     */
>> +    (void)txt_read(TXTCR_ESTS);
> 
> I don't think the cast is needed.
> 
>> +    txt_write(TXTCR_CMD_RESET, 1);
>> +    unreachable();
> 
> What guarantees the write to take immediate effect? That is, shouldn't there
> be e.g. an infinite loop here, just in case?

This is a very good point. My experience with TXT reset command it that 
the command completes but the reset may take a short while to occur 
asynchronously. In that time, the BSP will keep running. I noticed this 
because the code would keep running and crash elsewhere.

In the Linux version, this function does a hlt loop right after the 
reset before the unreachable() statement. We also use reads of 
TXT_CR_E2STS as r/w barriers per the spec.

Thanks
Ross

> 
>> +static inline uint64_t txt_bios_data_size(const void *heap)
>> +{
>> +    return *(const uint64_t *)heap - sizeof(uint64_t);
> 
> Like you already do here, ...
> 
>> +}
>> +
>> +static inline void *txt_bios_data_start(const void *heap)
>> +{
>> +    return (void *)heap + sizeof(uint64_t);
> 
> ... please don't cast away const-ness. I'm pretty sure I said before that
> Misra objects to us doing so.
> 
>> @@ -409,7 +393,7 @@ int __init tboot_protect_mem_regions(void)
>>   
>>       /* TXT Private Space */
>>       rc = e820_change_range_type(&e820, TXT_PRIV_CONFIG_REGS_BASE,
>> -                 TXT_PRIV_CONFIG_REGS_BASE + NR_TXT_CONFIG_PAGES * PAGE_SIZE,
>> +                 TXT_PRIV_CONFIG_REGS_BASE + NR_TXT_CONFIG_SIZE,
> 
> Was this perhaps meant to be TXT_CONFIG_SPACE_SIZE?
> 
> Jan
> 


