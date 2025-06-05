Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFDCACF597
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 19:44:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007338.1386661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNEd9-0006eK-Vn; Thu, 05 Jun 2025 17:43:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007338.1386661; Thu, 05 Jun 2025 17:43:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNEd9-0006bt-Rq; Thu, 05 Jun 2025 17:43:55 +0000
Received: by outflank-mailman (input) for mailman id 1007338;
 Thu, 05 Jun 2025 17:43:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zQrX=YU=oracle.com=ross.philipson@srs-se1.protection.inumbo.net>)
 id 1uNEd7-0006bn-To
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 17:43:54 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1133c67-4234-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 19:43:47 +0200 (CEST)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555FtV2O003111;
 Thu, 5 Jun 2025 17:43:35 GMT
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8bpkbw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 Jun 2025 17:43:34 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 555HUOD0039260; Thu, 5 Jun 2025 17:43:33 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com
 (mail-centralusazon11011014.outbound.protection.outlook.com [52.101.62.14])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 46yr7cd6dj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 Jun 2025 17:43:33 +0000
Received: from DS0PR10MB7224.namprd10.prod.outlook.com (2603:10b6:8:f5::14) by
 IA3PR10MB8662.namprd10.prod.outlook.com (2603:10b6:208:570::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.19; Thu, 5 Jun
 2025 17:43:14 +0000
Received: from DS0PR10MB7224.namprd10.prod.outlook.com
 ([fe80::c57:383f:cfb2:47f8]) by DS0PR10MB7224.namprd10.prod.outlook.com
 ([fe80::c57:383f:cfb2:47f8%4]) with mapi id 15.20.8813.018; Thu, 5 Jun 2025
 17:43:14 +0000
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
X-Inumbo-ID: a1133c67-4234-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=DBIA2YeJBswscGO/aSzs+i6/Sq1MaUxJv3wNEDcBOgg=; b=
	QbyLFEB8Yzxutqgoouq1E2DjZbXTaSSCxwb4neNm/20NbEdc5aiM6rM6gLVYJpk9
	SjN12Y0Up9Cxqea9RdzGTkEm+OQ/b3VfISXHfSjHHxw40AfPyeWurhYLuvup6FPX
	YTiJj7EfGTZMR7Z3suYectAQ5d/4+Npm/P07ZaFszvuXF1lr3+j9NXZ3x8Wfbgx2
	C6Qpwaive/v4qFT8GDPhASLvp15STpwrAU3f+GTNb87fSVPAVy/OjRK6qSSzOQ6p
	2/EjnceywiL/u/4JebeeAFCUKtDbyMa9l9H0YnGPtwh2T6fDXtrda6wAog3WvS60
	MMUk4DxGsjL2L41xnZpaFA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a7QhyVzFTQjEDDDfT+vKo/670eGuaQmp44EpzjJ5FgJ0Xt6bQABesSoGcvnuiD47yMhRvRYx6TdbeAU72Y3QqrwGoAwOgEEghawSDRQs61R20dWJTwONNt0wqzMyJHHZjR87Zr+ut85GAF4ii4+FsLXjFWq81hiXIr9wyJyCnnJoBft+LZnQXl3FRIRljvpPcrH57RW7+WnxPotFeEXgzlTlBIO4ZP3RcjUD1NA5ASBOqBukGSGhEKu9sSbVpTpUTwbM1kfdTqGOyssGU1G9514T6/dTq/f+vqwfL20WNDEb0+d8o20DuhKVeg+lPXZPC/eEElw2OYiHOrXdbTb89Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DBIA2YeJBswscGO/aSzs+i6/Sq1MaUxJv3wNEDcBOgg=;
 b=clUHPJqUcVCt+QM7Ag+JABF+p46BDZsWI+X5UZEiWdKaHuKSDnCfWlnZYym3vhrUZDsm19X9kWVBkuItcePi9TErxA1KTb0SCVaSeg1AAGNNjGWXnJiwM8Ydb6tVqBuop24fW4858Qzc4Q+vgTfjgPWQSbqexEuycoIdVXajQIht1TmXOJobz74PP7rfdEaHtIJaCBI8J5pJAxTxsQnMOfWVEfowWsGIi1tk4z/NmuElWyxWNzoEEnW3KOp5yZozmAl3bJ5lP2vvRl1KHNXjclayCiyU8AdhrpB4nsM2/ITDxijLt5sVFi5D1JDpTCJZ8tRkqLFjPc04QziUyEId+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBIA2YeJBswscGO/aSzs+i6/Sq1MaUxJv3wNEDcBOgg=;
 b=Noo4KfwK1MxjEUgOwZQYdWY989UJgve6fu9aiflmYaWb0nnIK0sSHZsey8Plk8WJMcSaOs8rOxUO2xr/I4Ck2B83KI4Tdk2t+eIHpnbc7NEy7zyJjfD7i27Novtx3EX/rueymJ4vXsbrvFkGesdYoRaI7RBPEaVqqQZBbrOWhJY=
Message-ID: <e56617d6-a144-4191-8027-a173f4b07752@oracle.com>
Date: Thu, 5 Jun 2025 10:43:10 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/22] x86/tpm.c: code for early hashing and extending
 PCRs (for TPM1.2)
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
        Andrew Cooper
 <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
        "Daniel P. Smith" <dpsmith@apertussolutions.com>,
        trenchboot-devel@googlegroups.com, ross.philipson@oracle.com
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <0c249037eeda4809b565a55c6473bb21cdd0304e.1748611041.git.sergii.dmytruk@3mdeb.com>
Content-Language: en-US
From: ross.philipson@oracle.com
In-Reply-To: <0c249037eeda4809b565a55c6473bb21cdd0304e.1748611041.git.sergii.dmytruk@3mdeb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN8PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:408:94::19) To DS0PR10MB7224.namprd10.prod.outlook.com
 (2603:10b6:8:f5::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7224:EE_|IA3PR10MB8662:EE_
X-MS-Office365-Filtering-Correlation-Id: c465c1c9-370f-4c86-19bc-08dda4587236
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eldOVGdPSDZab0FKWlh3Y0ZGMkNVODNGOS9ZQ3JveFZLZjVNL2EwRjFuRHFy?=
 =?utf-8?B?Yk1Hb2Z3WWJZZHJ3ajg5WnlkdGVGSkpIcndZZmM1azlxU1BZaHFDTVdQOVJU?=
 =?utf-8?B?WkU5SG5iN3RuMExIeVJRYXhleXJ6OXV5bmVSdDhjc0dWNXIvMHhyWGxLMHdt?=
 =?utf-8?B?NlhuUDNseGdYU05XWGI5aE1vazhGVlN6TnIrekpnTCs1MmZPTjdlWnBEYi8v?=
 =?utf-8?B?ZDAzMHZLb0hjUWVBSElZZ2JaZllSNTR3OGM5RG5hM0VzdzFDUzdlaE9JQ2ZL?=
 =?utf-8?B?OU5oS1ZUYUF2b0FJYkhIYmJTcTNxUHE5bDJnWXlSV1diU2ZYbTBXWG8yWEJs?=
 =?utf-8?B?QzlNa2p4Tm11U1h3by9DTHIxcEdvdmtXaDhTODd3bU0xWnhLOTNzNlNJelZv?=
 =?utf-8?B?ZnIveHhtTDYwU3NLY09yQkpiMVRQZVJUVG1lUnZ2MjRZbE5leUhJSlFQVSts?=
 =?utf-8?B?cGVrdWVHRDFYZ0lWL0dZUTNmditxR3dSRWU4Tnd2TDR3TTNaVWdPNllUd0xP?=
 =?utf-8?B?YzZ6YnRHSWYvSVNrc0hBQ3BrdGV1M3FYV0R2dDhqQXRrOElpQWNNY0c1c3NI?=
 =?utf-8?B?em92QklrSmlmM2tnNFhWd3N0M1ZUTXFWbXpEUTV2Mm02QXVmNmZEVTJmZ0ZZ?=
 =?utf-8?B?RE1PMkduVEF4VDRQOHRSd1R2QXJqVHBvRnkySzB4YWNJTVZmWDJFQTAwWGNo?=
 =?utf-8?B?ZXdDdGFlelhScTNib0xvZGlkb1ZlWEJRVWRQQ2lFbGFwajlRRzA2M2I3djQx?=
 =?utf-8?B?a2x5WVd4TExqbHJPb001ZDJqNkNtWGU5bThFQ3BBdnR1OERBS3J5TU03aWl2?=
 =?utf-8?B?SEF0ZklRV0tKeXR4aE5wN2trMXl4S1FBMm00cCtkZzE1Zk5EVkxqQ1ZtdGNr?=
 =?utf-8?B?L3NVTlBQM0NXRThPeUtYbHJPV21Ub3EvVStjTnJoK1hmaEtyZWZHNkdGditG?=
 =?utf-8?B?bkpSTnB0VnJ5WkxXcXV0WTB0cDRxVVMzeGV6YllLS1lLVXBBSS84YW5zY1RF?=
 =?utf-8?B?dWFDeStxNTBhV0kyWWhHaWpxc1NpYmExdnU1RC9Md0JsdG9yM2MrTEt6aGVv?=
 =?utf-8?B?dkZHbVQxZzFlY2pndi84U0xnbXVEcnJCbzFscmVIMnIyZDFXTk96cER6ZmlU?=
 =?utf-8?B?R1FlUGVkWXliQlNpOVBKRWFsdStkZnl0T1BmNTRYaXhFVjZuRkNmVGN6bksy?=
 =?utf-8?B?NmtoVThRaGU3NEkxMFR0QXM1YVFzemRndjBidXlvZXU2QUlsaTZzZDFOYTQ4?=
 =?utf-8?B?bUtCd09OVkhEMzZaSGlsSkQyM2hjYWd3Zmxwa2xZdWRha0dmTktmNnZ2YlRn?=
 =?utf-8?B?L09OVXZkSWtNMFdvVzJGYlYwa0ZUN1kwem5RWkM2UUo0bkQ3SmVMckdUNFox?=
 =?utf-8?B?aWFKRXdUdGhkUEZVb3hFT2JZTXFTZ09WdmtWbGJocUZrMjdUUWg2Ry8wTVFN?=
 =?utf-8?B?VUErSTNDYVMxbEJLOGhMZDJqQ1RvdERRRGdpQThoOHNNa1d3MWRDTkJ6eVJN?=
 =?utf-8?B?eDJWMUVTamV5akFrMFBOWlR4aXFXUWQ4aUFwazBoNzRCUkJBbFpoSU95VWl4?=
 =?utf-8?B?NkhVdmptTUdsbVhGVWFGQnlFL1B5YitDNGk1dk0yT0ZTbGFhaitQRlo1QTBZ?=
 =?utf-8?B?aUJyNG1Jb2xiU1QrbVlORXRGbXdRRmx3Zzl5TURiRFgxNnptVWFyNVBnMzVG?=
 =?utf-8?B?RUYxajVCdDVWN0d6bGVnOW93ajNlRTNMM3h1aHNXMUxnSWRXNkFTVVQ5cEdo?=
 =?utf-8?B?bzlEWUNHZlh5WnZXYUFCZmlEN0ZyVmZyVnhIaEQ1cVFJVnJHWVkrSG5lZ28y?=
 =?utf-8?B?N2xxQnpETC9ST01EcFY4azhrK2ZDOVNqYml1R0ZjNUJtWXNqUi81V1gxV0N2?=
 =?utf-8?B?RkF5NnVzaDkvUDgvc3ltWGhMK2JNbUV1UzBwdVNKUlpEUjJhZEw2T21LRzZQ?=
 =?utf-8?Q?zbOJ2khq5n8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7224.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEFabjZZWFVsTzQ5QXJxLytiaFJJN3RrL2ErKzVCYktlbldNWHRNQWdMS05v?=
 =?utf-8?B?enVCRWVQVlpvSWxtczVYZWFLLy9EWVFsWFkvVU83OG1OVnF6VExrQ096MzBj?=
 =?utf-8?B?bVBXYmNjN2pxaU9hVFEwMkRJK3BlUWhNRnpFWHNzMjNFSCtMdkRCY052cTlK?=
 =?utf-8?B?aStwZ3NuV1ZxcjdyS09yamovWFVpR3FDd0NzUUJ2VHM5WWJseWZuNm1TeE9P?=
 =?utf-8?B?NFB2ek9iK3NKWVdTOEpBcjVaTE9QME0rc2RPcVBVWDcvc0luRVpDa2FVcEU5?=
 =?utf-8?B?RjUwR1UzMWNvb2xqaW9uMGppME5vM1NPYzJreFlGMDdzbmZ0S3Z2Rjh4TCtZ?=
 =?utf-8?B?Z3FtNk9OZXZqeUFhdkJQQXllNWhkWW9ic3RtSWg4SEQvV0lQWUhFSDdZTUZR?=
 =?utf-8?B?dmh5UHVmZXYxbUU4bWpyOGF0b0Fkc2FJK0gyNDBhamNWUnl2Y1lmY2ZONGpD?=
 =?utf-8?B?ZStXQUJHU096emI0L00rbnZ3YitteWtJdHo0ZXM1TExtTmEra2s2Y2VmcStW?=
 =?utf-8?B?K20xQlV0NmlGbDdwUjZIZW52NlJORXVxOWxSN0NxRUJmMkduUjZ4cC9CbWEx?=
 =?utf-8?B?TFZlNlh0U25EZlFFMEpKSlhoTXkwRGZ2TXdBTkFDWStuZGlaa2NFeEhLcnB1?=
 =?utf-8?B?bExpQW45V1NBK0lFWUQ4NUQwRHZUTUloMlNlY3JWcVh4aXFSeGRFN1NGcWhl?=
 =?utf-8?B?UDc0NUp0bFo4N1RXREZuakdaWW1ocGdYNWM3eERxU1QwaVh5WFFZRGVlWmVw?=
 =?utf-8?B?YXlmdFdtVkUxb0tkemJqbzZNODJNMklmWmtaa3ZwRTg3SUxYOEZycDF2MGVI?=
 =?utf-8?B?QzBuK2FHMWkySkVEbXVvMzJpbWJCMlNaUkhTY2pTc2VLTnZXVFJUYVo2d3lj?=
 =?utf-8?B?ZlR1TVhxUjBmYVVzbjg1VVFJNkVPZkVsdWhUb1EvazR5UzRmbzkxaWxQeTRV?=
 =?utf-8?B?T2pHRU5yMHIrU1BXTlF1ckJXVCs1dlN2OTlOT2VyTVZIUUR0L0FzQ01WSWV3?=
 =?utf-8?B?Z0NoNGtpMDFydk1BeitTK2RlN25xUVpsdVVXT2swOXViZVcrS2VjV0V1TE56?=
 =?utf-8?B?aE5LcVVsVjJ0OHBEVUVrTDhTdzlRekJKUndwbGlEajhvRlJJVjhvSXlVRGZ3?=
 =?utf-8?B?Mk5wKzNWUm0wTzlOMHZnSUdrc2FQZmRrUWhZeWlnVllIME1RSGdwdU9WSXRv?=
 =?utf-8?B?eFlwYW16OElJWVp1NkEzVXIxVldaakFVWDRaWnVNNGFkNjZIclBrM0t5ZTFo?=
 =?utf-8?B?cnhXbndmbTRIZ3lqbFBwYU1BVG1MMEt2elV6MHAxbnoxUm53T0JrWUU2a0dz?=
 =?utf-8?B?cmtwQkZtTnBXTU9vU2M2SmVkbDFwSERxY0tKZk5KVDhRRzVDUEZvS2hnK3pO?=
 =?utf-8?B?MUVrbFQ5cFhKSDRzdWlOeGRTZnJtekV1K0ZvY051TTA3QTNkb0FkMXRjT2wr?=
 =?utf-8?B?ZlptYUEyTmduMUhrTWp5U01OdWNDT0dMdEpMWnNRNDZBTmhhZjM0WDZiSlJH?=
 =?utf-8?B?S1lPMHdkYVVOQnBySDZ4KzJIaUl6Vk92TzFzOGhsUFlKQ0d0bkRNK0ZHa0VY?=
 =?utf-8?B?TklIZSthMHdxMDV6eEdvQ1ZnbzBMREJCMnduUTRRcldhb1luaEJ5cjFORTA4?=
 =?utf-8?B?Wmk0RnVDdDJFWnluWWgxd0RsMVFOczBRUHlJeG5IRWlSVkRJd29YR3Bwa0dS?=
 =?utf-8?B?c1hDMlFmT2dqSEJvL0oyejY2NytDajM0Ri9WWEM2NnFCREFLTGZJT1l1Tmsw?=
 =?utf-8?B?TnlnbVRmTktuVVFRU2N2cHhqZzl3Mk9PNWdJS0pvWUZVWnJ0WDV6MnFpMnpy?=
 =?utf-8?B?TkRIdkpxbGw0NXhqcEdFaUdYN1A2YXpWcnB4TWU2K0E5QVdRUmFsaWVqekh4?=
 =?utf-8?B?UEtDLzU2eWpxN2hiWkJUdVh4UnN5dTJIeXd0c2UwNWRhakZ5U3ljWFAzRktF?=
 =?utf-8?B?Rml6Mlg5TXJmVkdIbE5SYmJTT0FabDY1QUtRc3dxUHZGaThUelhBNGpsMkYw?=
 =?utf-8?B?U2VrOTFQWDBXemVmc0ZxbDNwa01ESmtUV0FqRkhEdkhzUk5nUEV3alNNa0hN?=
 =?utf-8?B?RExUd2JIWG9ybmJjUENDYXRQN3oyWG9rakhtd05MZ2g2blg2ZWJjcDRvbWxB?=
 =?utf-8?B?NFBxME1mY3Y5U1FaWFM5NkVobVFZZjZXNi92NER5SkNpRjZvekhVZHhod085?=
 =?utf-8?B?U3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	D2PiAkpdpI0DIPpryOcV9TaUUP1A+RoYc7EizMG/sDppiDnwHo4B1Un8uP/EvhHzMdHZjXwknvSiNfoA2T0yuhvw+lbGBR9Av7ojOQL9TEXoeHkG2+OhPblxXBdwQWi8QB70GIs5VzisUqe6O/sOhlEfTl7Vu8kRH5dXKWBPeg40WU0r89q9C3rWaHVUaghgLztTq/DhEKv6g1NkgslktsflcAnHVBVCSazqllDPIGJTqlLVB/j/duepW0MgtPA0aW/dBuzw67RR2LLpJOXUa3pwzgFSkU3slS23Xl2QbpTvNRveuEeafu2jRQ4YmLMlxh11q2ZVooAr3lDVONoBVYcZ1mx/hfhfIPi9/wGDRi/3WWUxL1JZ/M5VqMou+HshLgx/JQmNBB/H9V/O2udwptFgoZ0xbE1pAyUkXeMoaj6cydTLcQTmYAtLokbZ0Jll7WkRYFlwGGzV6RuYBRvU4t/C+FLL4u26aMDO/7oIOSHXqWKUzrHkJXIi0yfVCKM8IvcxhpM9sol86d/fieWGaROvexRIehKIV4o9nzLJTtczs/MoDxdaNcb9QRCFy+7K4xX1utqNdnDVIyNbW1OS3a/Qr6sxov3xCfgy0WJJjh8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c465c1c9-370f-4c86-19bc-08dda4587236
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7224.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 17:43:13.9428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fpelPo7Z8hC6J//eikjSv6VJOZn+A00bUYwWBNNvODLLYxZo/38m/nHJd0Tu1QmVWy0Aepk8wyoD6yHeoVKI2VOXHZREDaSebc8kFuNkUoI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8662
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506050157
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE1NyBTYWx0ZWRfX0ZEvprsXi4h2 VuG/msr2WYxnCKlydpd3I14txxacz8X8lcYbUC0jRr/OBryOL1lh25LrOSOoDVi203uaHTBqSPq 0iUeFkOBlC2CRygJTd82l3wf/Ar7SVTC74hUOAEaR91PxUV10fQRbbE1GAVBtAkuTBw5h5yKRJU
 k3udq7ah8wiJWH3vbfjW9BBNvRRUwveSw/D44y2oeKOHLD8gGTH4O4MOuvJnVJ+b6Z2IpzYQzDV p+GKTPM9HUt1wlCK0hDijWqbpjtQjBaHa3KPQiDa/OFSIXfb5SbkyQyp6U1ydw1SqKH5djtHk1/ p1jUJiTA1/djh718n8ge/t7aEkyRlCwfyNUkXYUsMNOzeCK22WPTAUJU9icNMW3rye2PtpYmyEW
 osUoe/UvPYcxathOW7KYZZPgmrZcEbG3B5Je5BZWu3slRwmCU6wE9R/mEI8Nc8B/n9ONB9vy
X-Proofpoint-GUID: k4W6lV0chOB61NAug6fxlevEMZD8vSAJ
X-Proofpoint-ORIG-GUID: k4W6lV0chOB61NAug6fxlevEMZD8vSAJ
X-Authority-Analysis: v=2.4 cv=H+Dbw/Yi c=1 sm=1 tr=0 ts=6841d746 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=C_d68mY_AAAA:8 a=0S3p-o084Hdno6JN4usA:9 a=QEXdDO2ut3YA:10 a=wASdygnoxNaGnvDdgHrj:22

On 5/30/25 6:17 AM, Sergii Dmytruk wrote:
> From: Krystian Hebel <krystian.hebel@3mdeb.com>
> 
> This file is built twice: for early 32b mode without paging to measure
> MBI and for 64b code to measure dom0 kernel and initramfs. Since MBI
> is small, the first case uses TPM to do the hashing. Kernel and
> initramfs on the other hand are too big, sending them to the TPM would
> take multiple minutes.
> 
> Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
> Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
> ---
>   xen/arch/x86/Makefile              |   1 +
>   xen/arch/x86/boot/Makefile         |   7 +-
>   xen/arch/x86/boot/head.S           |   3 +
>   xen/arch/x86/include/asm/slaunch.h |  14 +
>   xen/arch/x86/include/asm/tpm.h     |  19 ++
>   xen/arch/x86/slaunch.c             |   7 +-
>   xen/arch/x86/tpm.c                 | 437 +++++++++++++++++++++++++++++
>   7 files changed, 486 insertions(+), 2 deletions(-)
>   create mode 100644 xen/arch/x86/include/asm/tpm.h
>   create mode 100644 xen/arch/x86/tpm.c
> 
> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> index 5788898166..2d008a5f52 100644
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -66,6 +66,7 @@ obj-y += spec_ctrl.o
>   obj-y += srat.o
>   obj-y += string.o
>   obj-y += time.o
> +obj-y += tpm.o
>   obj-y += traps-setup.o
>   obj-y += traps.o
>   obj-$(CONFIG_INTEL) += tsx.o
> diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
> index 5471b966dd..55fbe155b6 100644
> --- a/xen/arch/x86/boot/Makefile
> +++ b/xen/arch/x86/boot/Makefile
> @@ -6,6 +6,7 @@ obj32 := cmdline.32.o
>   obj32 += reloc.32.o
>   obj32 += reloc-trampoline.32.o
>   obj32 += slaunch-early.32.o
> +obj32 += tpm-early.32.o
>   
>   obj64 := reloc-trampoline.o
>   
> @@ -31,6 +32,10 @@ $(obj)/%.32.o: $(src)/%.c FORCE
>   
>   $(obj)/slaunch-early.32.o: XEN_CFLAGS += -D__EARLY_SLAUNCH__
>   
> +$(obj)/tpm-early.32.o: XEN_CFLAGS += -D__EARLY_SLAUNCH__
> +$(obj)/tpm-early.32.o: $(src)/../tpm.c FORCE
> +	$(call if_changed_rule,cc_o_c)
> +
>   orphan-handling-$(call ld-option,--orphan-handling=error) := --orphan-handling=error
>   LDFLAGS_DIRECT-$(call ld-option,--warn-rwx-segments) := --no-warn-rwx-segments
>   LDFLAGS_DIRECT += $(LDFLAGS_DIRECT-y)
> @@ -84,7 +89,7 @@ cmd_combine = \
>                 --bin1      $(obj)/built-in-32.base.bin \
>                 --bin2      $(obj)/built-in-32.offset.bin \
>                 --map       $(obj)/built-in-32.base.map \
> -              --exports   cmdline_parse_early,reloc,reloc_trampoline32,slaunch_early_init \
> +              --exports   cmdline_parse_early,reloc,reloc_trampoline32,slaunch_early_init,tpm_extend_mbi \
>                 --output    $@
>   
>   targets += built-in-32.S
> diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
> index b4cf423c80..9a272155e9 100644
> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -527,6 +527,9 @@ __start:
>           /* Store MBI address in EBX where MB2 code expects it. */
>           mov     %eax, %ebx
>   
> +        /* tpm_extend_mbi(mbi/eax, slrt/edx) using fastcall. */
> +        call    tpm_extend_mbi
> +
>           /* Move magic number expected by Multiboot 2 to EAX and fall through. */
>           movl    $MULTIBOOT2_BOOTLOADER_MAGIC, %eax
>   
> diff --git a/xen/arch/x86/include/asm/slaunch.h b/xen/arch/x86/include/asm/slaunch.h
> index 7891d60035..3b38045864 100644
> --- a/xen/arch/x86/include/asm/slaunch.h
> +++ b/xen/arch/x86/include/asm/slaunch.h
> @@ -10,6 +10,20 @@
>   #include <xen/slr-table.h>
>   #include <xen/types.h>
>   
> +#define DRTM_LOC                   2
> +#define DRTM_CODE_PCR              17
> +#define DRTM_DATA_PCR              18
> +
> +/*
> + * Secure Launch event log entry types. The TXT specification defines the base
> + * event value as 0x400 for DRTM values, use it regardless of the DRTM for
> + * consistency.
> + */
> +#define DLE_EVTYPE_BASE            0x400
> +#define DLE_EVTYPE_SLAUNCH         (DLE_EVTYPE_BASE + 0x102)
> +#define DLE_EVTYPE_SLAUNCH_START   (DLE_EVTYPE_BASE + 0x103)
> +#define DLE_EVTYPE_SLAUNCH_END     (DLE_EVTYPE_BASE + 0x104)
> +
>   /* Indicates an active Secure Launch boot. */
>   extern bool slaunch_active;
>   
> diff --git a/xen/arch/x86/include/asm/tpm.h b/xen/arch/x86/include/asm/tpm.h
> new file mode 100644
> index 0000000000..d1e791fc69
> --- /dev/null
> +++ b/xen/arch/x86/include/asm/tpm.h
> @@ -0,0 +1,19 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * Copyright (c) 2022-2025 3mdeb Sp. z o.o. All rights reserved.
> + */
> +
> +#ifndef X86_TPM_H
> +#define X86_TPM_H
> +
> +#include <xen/types.h>
> +
> +#define TPM_TIS_BASE  0xfed40000U
> +#define TPM_TIS_SIZE  0x00010000U
> +
> +void tpm_hash_extend(unsigned loc, unsigned pcr, const uint8_t *buf,
> +                     unsigned size, uint32_t type, const uint8_t *log_data,
> +                     unsigned log_data_size);
> +
> +#endif /* X86_TPM_H */
> diff --git a/xen/arch/x86/slaunch.c b/xen/arch/x86/slaunch.c
> index ac3b43942b..5f91fe5ad0 100644
> --- a/xen/arch/x86/slaunch.c
> +++ b/xen/arch/x86/slaunch.c
> @@ -13,6 +13,7 @@
>   #include <asm/intel-txt.h>
>   #include <asm/page.h>
>   #include <asm/slaunch.h>
> +#include <asm/tpm.h>
>   
>   /*
>    * These variables are assigned to by the code near Xen's entry point.
> @@ -66,16 +67,20 @@ struct slr_table *__init slaunch_get_slrt(void)
>   
>   void __init slaunch_map_mem_regions(void)
>   {
> +    int rc;
>       void *evt_log_addr;
>       uint32_t evt_log_size;
>   
> +    rc = slaunch_map_l2(TPM_TIS_BASE, TPM_TIS_SIZE);
> +    BUG_ON(rc != 0);
> +
>       /* Vendor-specific part. */
>       txt_map_mem_regions();
>   
>       find_evt_log(slaunch_get_slrt(), &evt_log_addr, &evt_log_size);
>       if ( evt_log_addr != NULL )
>       {
> -        int rc = slaunch_map_l2((uintptr_t)evt_log_addr, evt_log_size);
> +        rc = slaunch_map_l2((uintptr_t)evt_log_addr, evt_log_size);
>           BUG_ON(rc != 0);
>       }
>   }
> diff --git a/xen/arch/x86/tpm.c b/xen/arch/x86/tpm.c
> new file mode 100644
> index 0000000000..7fb19ce4fa
> --- /dev/null
> +++ b/xen/arch/x86/tpm.c
> @@ -0,0 +1,437 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * Copyright (c) 2022-2025 3mdeb Sp. z o.o. All rights reserved.
> + */
> +
> +#include <xen/sha1.h>
> +#include <xen/string.h>
> +#include <xen/types.h>
> +#include <asm/intel-txt.h>
> +#include <asm/slaunch.h>
> +#include <asm/tpm.h>
> +
> +#ifdef __EARLY_SLAUNCH__
> +
> +#ifdef __va
> +#error "__va defined in non-paged mode!"
> +#endif
> +
> +#define __va(x)     _p(x)
> +
> +/* Implementation of slaunch_get_slrt() for early TPM code. */
> +static uint32_t slrt_location;
> +struct slr_table *slaunch_get_slrt(void)
> +{
> +    return __va(slrt_location);
> +}
> +
> +/*
> + * The code is being compiled as a standalone binary without linking to any
> + * other part of Xen.  Providing implementation of builtin functions in this
> + * case is necessary if compiler chooses to not use an inline builtin.
> + */
> +void *(memcpy)(void *dest, const void *src, size_t n)
> +{
> +    const uint8_t *s = src;
> +    uint8_t *d = dest;
> +
> +    while ( n-- )
> +        *d++ = *s++;
> +
> +    return dest;
> +}
> +
> +#else   /* __EARLY_SLAUNCH__ */
> +
> +#include <xen/mm.h>
> +#include <xen/pfn.h>
> +
> +#endif  /* __EARLY_SLAUNCH__ */
> +
> +#define TPM_LOC_REG(loc, reg)   (0x1000 * (loc) + (reg))
> +
> +#define TPM_ACCESS_(x)          TPM_LOC_REG(x, 0x00)
> +#define ACCESS_REQUEST_USE       (1 << 1)
> +#define ACCESS_ACTIVE_LOCALITY   (1 << 5)
> +#define TPM_INTF_CAPABILITY_(x) TPM_LOC_REG(x, 0x14)
> +#define INTF_VERSION_MASK        0x70000000
> +#define TPM_STS_(x)             TPM_LOC_REG(x, 0x18)
> +#define TPM_FAMILY_MASK          0x0C000000
> +#define STS_DATA_AVAIL           (1 << 4)
> +#define STS_TPM_GO               (1 << 5)
> +#define STS_COMMAND_READY        (1 << 6)
> +#define STS_VALID                (1 << 7)
> +#define TPM_DATA_FIFO_(x)       TPM_LOC_REG(x, 0x24)
> +
> +#define swap16(x)       __builtin_bswap16(x)
> +#define swap32(x)       __builtin_bswap32(x)
> +
> +static inline volatile uint32_t tis_read32(unsigned reg)
> +{
> +    return *(volatile uint32_t *)__va(TPM_TIS_BASE + reg);
> +}
> +
> +static inline volatile uint8_t tis_read8(unsigned reg)
> +{
> +    return *(volatile uint8_t *)__va(TPM_TIS_BASE + reg);
> +}
> +
> +static inline void tis_write8(unsigned reg, uint8_t val)
> +{
> +    *(volatile uint8_t *)__va(TPM_TIS_BASE + reg) = val;
> +}
> +
> +static inline void request_locality(unsigned loc)
> +{
> +    tis_write8(TPM_ACCESS_(loc), ACCESS_REQUEST_USE);
> +    /* Check that locality was actually activated. */
> +    while ( (tis_read8(TPM_ACCESS_(loc)) & ACCESS_ACTIVE_LOCALITY) == 0 );
> +}
> +
> +static inline void relinquish_locality(unsigned loc)
> +{
> +    tis_write8(TPM_ACCESS_(loc), ACCESS_ACTIVE_LOCALITY);
> +}
> +
> +static void send_cmd(unsigned loc, uint8_t *buf, unsigned i_size,
> +                     unsigned *o_size)
> +{
> +    /*
> +     * Value of "data available" bit counts only when "valid" field is set as
> +     * well.
> +     */
> +    const unsigned data_avail = STS_VALID | STS_DATA_AVAIL;
> +
> +    unsigned i;

Is this all that is needed to do the send? I would have thought you 
would at least also need that burst count logic to know when the TPM is 
ready for more data. There are also a number of timeouts that are 
supposed to be used. Maybe Daniel has some thoughts too.

> +
> +    /* Make sure TPM can accept a command. */
> +    if ( (tis_read8(TPM_STS_(loc)) & STS_COMMAND_READY) == 0 )
> +    {
> +        /* Abort current command. */
> +        tis_write8(TPM_STS_(loc), STS_COMMAND_READY);
> +        /* Wait until TPM is ready for a new one. */
> +        while ( (tis_read8(TPM_STS_(loc)) & STS_COMMAND_READY) == 0 );
> +    }
> +
> +    for ( i = 0; i < i_size; i++ )
> +        tis_write8(TPM_DATA_FIFO_(loc), buf[i]);
> +
> +    tis_write8(TPM_STS_(loc), STS_TPM_GO);
> +
> +    /* Wait for the first byte of response. */
> +    while ( (tis_read8(TPM_STS_(loc)) & data_avail) != data_avail);
> +
> +    for ( i = 0; i < *o_size && tis_read8(TPM_STS_(loc)) & data_avail; i++ )
> +        buf[i] = tis_read8(TPM_DATA_FIFO_(loc));
> +
> +    if ( i < *o_size )
> +        *o_size = i;
> +
> +    tis_write8(TPM_STS_(loc), STS_COMMAND_READY);
> +}
> +
> +static inline bool is_tpm12(void)
> +{
> +    /*
> +     * If one of these conditions is true:
> +     *  - INTF_CAPABILITY_x.interfaceVersion is 0 (TIS <= 1.21)
> +     *  - INTF_CAPABILITY_x.interfaceVersion is 2 (TIS == 1.3)
> +     *  - STS_x.tpmFamily is 0
> +     * we're dealing with TPM1.2.
> +     */
> +    uint32_t intf_version = tis_read32(TPM_INTF_CAPABILITY_(0))
> +                          & INTF_VERSION_MASK;
> +    return (intf_version == 0x00000000 || intf_version == 0x20000000 ||
> +            (tis_read32(TPM_STS_(0)) & TPM_FAMILY_MASK) == 0);
> +}
> +
> +/****************************** TPM1.2 specific *******************************/
> +#define TPM_ORD_Extend              0x00000014
> +#define TPM_ORD_SHA1Start           0x000000A0
> +#define TPM_ORD_SHA1Update          0x000000A1
> +#define TPM_ORD_SHA1CompleteExtend  0x000000A3
> +
> +#define TPM_TAG_RQU_COMMAND         0x00C1
> +#define TPM_TAG_RSP_COMMAND         0x00C4

I am not sure what the long term goal for a TPM driver in Xen might be 
but my suggestion is to lay out the driver more cleanly up front. Split 
the specification defined things (e.g. these things and other from TCG 
etc) from the driver implementation specific definitions and put them in 
separate headers. There is little enough core code now that just putting 
it all in tpm.c seems fine. Just my $0.02...

Thanks,
Ross

> +
> +/* All fields of following structs are big endian. */
> +struct tpm_cmd_hdr {
> +    uint16_t    tag;
> +    uint32_t    paramSize;
> +    uint32_t    ordinal;
> +} __packed;
> +
> +struct tpm_rsp_hdr {
> +    uint16_t    tag;
> +    uint32_t    paramSize;
> +    uint32_t    returnCode;
> +} __packed;
> +
> +struct extend_cmd {
> +    struct tpm_cmd_hdr h;
> +    uint32_t pcrNum;
> +    uint8_t inDigest[SHA1_DIGEST_SIZE];
> +} __packed;
> +
> +struct extend_rsp {
> +    struct tpm_rsp_hdr h;
> +    uint8_t outDigest[SHA1_DIGEST_SIZE];
> +} __packed;
> +
> +struct sha1_start_cmd {
> +    struct tpm_cmd_hdr h;
> +} __packed;
> +
> +struct sha1_start_rsp {
> +    struct tpm_rsp_hdr h;
> +    uint32_t maxNumBytes;
> +} __packed;
> +
> +struct sha1_update_cmd {
> +    struct tpm_cmd_hdr h;
> +    uint32_t numBytes;          /* Must be a multiple of 64 */
> +    uint8_t hashData[];
> +} __packed;
> +
> +struct sha1_update_rsp {
> +    struct tpm_rsp_hdr h;
> +} __packed;
> +
> +struct sha1_complete_extend_cmd {
> +    struct tpm_cmd_hdr h;
> +    uint32_t pcrNum;
> +    uint32_t hashDataSize;      /* 0-64, inclusive */
> +    uint8_t hashData[];
> +} __packed;
> +
> +struct sha1_complete_extend_rsp {
> +    struct tpm_rsp_hdr h;
> +    uint8_t hashValue[SHA1_DIGEST_SIZE];
> +    uint8_t outDigest[SHA1_DIGEST_SIZE];
> +} __packed;
> +
> +struct TPM12_PCREvent {
> +    uint32_t PCRIndex;
> +    uint32_t Type;
> +    uint8_t Digest[SHA1_DIGEST_SIZE];
> +    uint32_t Size;
> +    uint8_t Data[];
> +};
> +
> +struct txt_ev_log_container_12 {
> +    char        Signature[20];      /* "TXT Event Container", null-terminated */
> +    uint8_t     Reserved[12];
> +    uint8_t     ContainerVerMajor;
> +    uint8_t     ContainerVerMinor;
> +    uint8_t     PCREventVerMajor;
> +    uint8_t     PCREventVerMinor;
> +    uint32_t    ContainerSize;      /* Allocated size */
> +    uint32_t    PCREventsOffset;
> +    uint32_t    NextEventOffset;
> +    struct TPM12_PCREvent   PCREvents[];
> +};
> +
> +#ifdef __EARLY_SLAUNCH__
> +/*
> + * TPM1.2 is required to support commands of up to 1101 bytes, vendors rarely
> + * go above that. Limit maximum size of block of data to be hashed to 1024.
> + */
> +#define MAX_HASH_BLOCK      1024
> +#define CMD_RSP_BUF_SIZE    (sizeof(struct sha1_update_cmd) + MAX_HASH_BLOCK)
> +
> +union cmd_rsp {
> +    struct sha1_start_cmd start_c;
> +    struct sha1_start_rsp start_r;
> +    struct sha1_update_cmd update_c;
> +    struct sha1_update_rsp update_r;
> +    struct sha1_complete_extend_cmd finish_c;
> +    struct sha1_complete_extend_rsp finish_r;
> +    uint8_t buf[CMD_RSP_BUF_SIZE];
> +};
> +
> +/* Returns true on success. */
> +static bool tpm12_hash_extend(unsigned loc, const uint8_t *buf, unsigned size,
> +                              unsigned pcr, uint8_t *out_digest)
> +{
> +    union cmd_rsp cmd_rsp;
> +    unsigned max_bytes = MAX_HASH_BLOCK;
> +    unsigned o_size = sizeof(cmd_rsp);
> +    bool success = false;
> +
> +    request_locality(loc);
> +
> +    cmd_rsp.start_c = (struct sha1_start_cmd) {
> +        .h.tag = swap16(TPM_TAG_RQU_COMMAND),
> +        .h.paramSize = swap32(sizeof(struct sha1_start_cmd)),
> +        .h.ordinal = swap32(TPM_ORD_SHA1Start),
> +    };
> +
> +    send_cmd(loc, cmd_rsp.buf, sizeof(struct sha1_start_cmd), &o_size);
> +    if ( o_size < sizeof(struct sha1_start_rsp) )
> +        goto error;
> +
> +    if ( max_bytes > swap32(cmd_rsp.start_r.maxNumBytes) )
> +        max_bytes = swap32(cmd_rsp.start_r.maxNumBytes);
> +
> +    while ( size > 64 )
> +    {
> +        if ( size < max_bytes )
> +            max_bytes = size & ~(64 - 1);
> +
> +        o_size = sizeof(cmd_rsp);
> +
> +        cmd_rsp.update_c = (struct sha1_update_cmd){
> +            .h.tag = swap16(TPM_TAG_RQU_COMMAND),
> +            .h.paramSize = swap32(sizeof(struct sha1_update_cmd) + max_bytes),
> +            .h.ordinal = swap32(TPM_ORD_SHA1Update),
> +            .numBytes = swap32(max_bytes),
> +        };
> +        memcpy(cmd_rsp.update_c.hashData, buf, max_bytes);
> +
> +        send_cmd(loc, cmd_rsp.buf, sizeof(struct sha1_update_cmd) + max_bytes,
> +                 &o_size);
> +        if ( o_size < sizeof(struct sha1_update_rsp) )
> +            goto error;
> +
> +        size -= max_bytes;
> +        buf += max_bytes;
> +    }
> +
> +    o_size = sizeof(cmd_rsp);
> +
> +    cmd_rsp.finish_c = (struct sha1_complete_extend_cmd) {
> +        .h.tag = swap16(TPM_TAG_RQU_COMMAND),
> +        .h.paramSize = swap32(sizeof(struct sha1_complete_extend_cmd) + size),
> +        .h.ordinal = swap32(TPM_ORD_SHA1CompleteExtend),
> +        .pcrNum = swap32(pcr),
> +        .hashDataSize = swap32(size),
> +    };
> +    memcpy(cmd_rsp.finish_c.hashData, buf, size);
> +
> +    send_cmd(loc, cmd_rsp.buf, sizeof(struct sha1_complete_extend_cmd) + size,
> +             &o_size);
> +    if ( o_size < sizeof(struct sha1_complete_extend_rsp) )
> +        goto error;
> +
> +    if ( out_digest != NULL )
> +        memcpy(out_digest, cmd_rsp.finish_r.hashValue, SHA1_DIGEST_SIZE);
> +
> +    success = true;
> +
> +error:
> +    relinquish_locality(loc);
> +    return success;
> +}
> +
> +#else
> +
> +union cmd_rsp {
> +    struct extend_cmd extend_c;
> +    struct extend_rsp extend_r;
> +};
> +
> +/* Returns true on success. */
> +static bool tpm12_hash_extend(unsigned loc, const uint8_t *buf, unsigned size,
> +                              unsigned pcr, uint8_t *out_digest)
> +{
> +    union cmd_rsp cmd_rsp;
> +    unsigned o_size = sizeof(cmd_rsp);
> +
> +    sha1_hash(out_digest, buf, size);
> +
> +    request_locality(loc);
> +
> +    cmd_rsp.extend_c = (struct extend_cmd) {
> +        .h.tag = swap16(TPM_TAG_RQU_COMMAND),
> +        .h.paramSize = swap32(sizeof(struct extend_cmd)),
> +        .h.ordinal = swap32(TPM_ORD_Extend),
> +        .pcrNum = swap32(pcr),
> +    };
> +
> +    memcpy(cmd_rsp.extend_c.inDigest, out_digest, SHA1_DIGEST_SIZE);
> +
> +    send_cmd(loc, (uint8_t *)&cmd_rsp, sizeof(struct extend_cmd), &o_size);
> +
> +    relinquish_locality(loc);
> +
> +    return (o_size >= sizeof(struct extend_rsp));
> +}
> +
> +#endif /* __EARLY_SLAUNCH__ */
> +
> +static void *create_log_event12(struct txt_ev_log_container_12 *evt_log,
> +                                uint32_t evt_log_size, uint32_t pcr,
> +                                uint32_t type, const uint8_t *data,
> +                                unsigned data_size)
> +{
> +    struct TPM12_PCREvent *new_entry;
> +
> +    new_entry = (void *)(((uint8_t *)evt_log) + evt_log->NextEventOffset);
> +
> +    /*
> +     * Check if there is enough space left for new entry.
> +     * Note: it is possible to introduce a gap in event log if entry with big
> +     * data_size is followed by another entry with smaller data. Maybe we should
> +     * cap the event log size in such case?
> +     */
> +    if ( evt_log->NextEventOffset + sizeof(struct TPM12_PCREvent) + data_size
> +         > evt_log_size )
> +        return NULL;
> +
> +    evt_log->NextEventOffset += sizeof(struct TPM12_PCREvent) + data_size;
> +
> +    new_entry->PCRIndex = pcr;
> +    new_entry->Type = type;
> +    new_entry->Size = data_size;
> +
> +    if ( data && data_size > 0 )
> +        memcpy(new_entry->Data, data, data_size);
> +
> +    return new_entry->Digest;
> +}
> +
> +/************************** end of TPM1.2 specific ****************************/
> +
> +void tpm_hash_extend(unsigned loc, unsigned pcr, const uint8_t *buf,
> +                     unsigned size, uint32_t type, const uint8_t *log_data,
> +                     unsigned log_data_size)
> +{
> +    void *evt_log_addr;
> +    uint32_t evt_log_size;
> +
> +    find_evt_log(slaunch_get_slrt(), &evt_log_addr, &evt_log_size);
> +    evt_log_addr = __va((uintptr_t)evt_log_addr);
> +
> +    if ( is_tpm12() )
> +    {
> +        uint8_t sha1_digest[SHA1_DIGEST_SIZE];
> +
> +        struct txt_ev_log_container_12 *evt_log = evt_log_addr;
> +        void *entry_digest = create_log_event12(evt_log, evt_log_size, pcr,
> +                                                type, log_data, log_data_size);
> +
> +        /* We still need to write computed hash somewhere. */
> +        if ( entry_digest == NULL )
> +            entry_digest = sha1_digest;
> +
> +        if ( !tpm12_hash_extend(loc, buf, size, pcr, entry_digest) )
> +        {
> +#ifndef __EARLY_SLAUNCH__
> +            printk(XENLOG_ERR "Extending PCR%u failed\n", pcr);
> +#endif
> +        }
> +    }
> +}
> +
> +#ifdef __EARLY_SLAUNCH__
> +void asmlinkage tpm_extend_mbi(uint32_t *mbi, uint32_t slrt_pa)
> +{
> +    /* Need this to implement slaunch_get_slrt() for early TPM code. */
> +    slrt_location = slrt_pa;
> +
> +    /* MBI starts with uint32_t total_size. */
> +    tpm_hash_extend(DRTM_LOC, DRTM_DATA_PCR, (uint8_t *)mbi, *mbi,
> +                    DLE_EVTYPE_SLAUNCH, NULL, 0);
> +}
> +#endif


