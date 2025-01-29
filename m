Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA590A21AD6
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 11:16:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878937.1289234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td57k-0004yL-CE; Wed, 29 Jan 2025 10:16:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878937.1289234; Wed, 29 Jan 2025 10:16:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td57k-0004wp-8p; Wed, 29 Jan 2025 10:16:44 +0000
Received: by outflank-mailman (input) for mailman id 878937;
 Wed, 29 Jan 2025 08:28:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XMr0=UV=oracle.com=harshvardhan.j.jha@srs-se1.protection.inumbo.net>)
 id 1td3RD-0001v1-Ef
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2025 08:28:43 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a6bc5bd-de1b-11ef-99a4-01e77a169b0f;
 Wed, 29 Jan 2025 09:28:40 +0100 (CET)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50T7txCG015486;
 Wed, 29 Jan 2025 08:28:34 GMT
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44ffve0445-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jan 2025 08:28:34 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 50T7WdEP005314; Wed, 29 Jan 2025 08:28:34 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 44cpd9gvy3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jan 2025 08:28:09 +0000
Received: from PH7PR10MB6505.namprd10.prod.outlook.com (2603:10b6:510:200::11)
 by MN6PR10MB8045.namprd10.prod.outlook.com (2603:10b6:208:4fb::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Wed, 29 Jan
 2025 08:28:06 +0000
Received: from PH7PR10MB6505.namprd10.prod.outlook.com
 ([fe80::83d9:1bf1:52cf:df54]) by PH7PR10MB6505.namprd10.prod.outlook.com
 ([fe80::83d9:1bf1:52cf:df54%6]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 08:28:06 +0000
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
X-Inumbo-ID: 0a6bc5bd-de1b-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=sx6WvSTDPY0O6Hbb
	hwfY5GBuY2MohoBL1aomhDbhz0Y=; b=O2l65cSmzku9RUYy8WTJbrPWvYntnhJ7
	CBAex5JnbuXBKpiY7/Xrz0IC7cjJcCtHqj3uygIij3haiWXheV0LCGXOf8OQo+Te
	sCUIkFwVkF62DhLFsL9Oay+HzCZRWonI8dygJNYI/y8ivmezGU5Ctu1iWGHsvQN7
	5XTk9mJ/YgExwymZ2ev0EWsWlZQz2fn03ua0XXamHm439FHozah6h4rYRppGxS/I
	5UG6fjwOPefEQ9ixGr64jhdu7+hNTx0OnefOeR8q/ltdXGAkz2EE8V103QJuRzvF
	s3kJJ9Yw9PMdIP4OywjyHmKu6RQyO2eKUFGLWZefGeMY2KqSAq73Cg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EWFbJ7E1kgJ66gJ+n1QCeIhiHtWNLMLChWq0Gx2iH7wP6d+kNDRYn6AGDeZ8vv1DOFVy/cH36bENzPeWfi5m3AY4HAaNlrGWNDOplGaP+52igfsqDLcWUJ6YQFsBK8fdRkBjQc6PhueMG6Xh8wlYVCSwSQluei9SfYlZ+QWEyXBV2VPyGiZNRogWXTLlbd4Tl6boU23jwGo7V2cljJbOIT5HbVNeAIoCZwvVXw/nEULc5hr5iVrmQPMtNQr3A/CcUfrxvQsYKRTD/+JjwslBowyVQ6xGOHThawgwV1bqoeNx8tI/EqabNM3k+ntkCDqES4vuUSv2qE4/LkShv6Ci3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sx6WvSTDPY0O6HbbhwfY5GBuY2MohoBL1aomhDbhz0Y=;
 b=Vy1OXAu3LvzkM1ecMLsQTfdxERcvysaLWr7hEtrw2Giq8XgXI7sEN82c/USgui2EPH3T6FnQlb0IcvMZDq5VptMDRblYC9d/AMkYrzFBRVxB7uLHV4BZj65Y7JCEQp/smb71D1mY0xNK/N1lf/uBFBuNSlcLrn/QPBmq8/Z3AHM3emFtl7ui2roMXp52fjplrog3l1yDk7GaUYC3xkQduyZtTfBNYsrfXXrJifJ+F4HRMQ3xlHrdCCPUX+Z5DUj6wtoXcDNFuWTPuDcFL4HFHXGcGHOu6Jfraq1oCQvEfsX3I8sEoLGuRESp2zsvITZ8llwEOyxcmuER5dksfPHPuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sx6WvSTDPY0O6HbbhwfY5GBuY2MohoBL1aomhDbhz0Y=;
 b=orW1JV9cBuHsj9GrYuFaINcgGVh7ysQyg4F8jxwo+ZAnLctthMqXauBHQvZF8b4VWJ4LwUALLJytJTL/AQhWt9ekgXiyucvDE7aSbCRiQPFyptnKdSjx1EdEMivhaDZ06KHmY/gyYHk8X/5mHcsHCLucqSo2zB9jVNeGiR+/23o=
Message-ID: <7dc143fa-4a48-440b-b624-ac57a361ac74@oracle.com>
Date: Wed, 29 Jan 2025 13:57:59 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Konrad Wilk <konrad.wilk@oracle.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        "jgross@suse.com" <jgross@suse.com>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
From: Harshvardhan Jha <harshvardhan.j.jha@oracle.com>
Subject: v5.4.289 failed to boot with error megasas_build_io_fusion 3219
 sge_count (-12) is out of range
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0200.apcprd04.prod.outlook.com
 (2603:1096:4:187::15) To PH7PR10MB6505.namprd10.prod.outlook.com
 (2603:10b6:510:200::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR10MB6505:EE_|MN6PR10MB8045:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b50e43a-06d6-48ee-7b8a-08dd403edaf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RFJERTJoSWRsc253dnNnMmUzMTE1MFk5WEV5cTZUdUo5UmV4KzJtMzFrUDhD?=
 =?utf-8?B?TTlRY3BBeG1LK29QZWNSNmlvRDhnTVhlc0NiclFwOHJhU1dlVytpYWcvU3lX?=
 =?utf-8?B?NHNJdWkxMmh1eUM1QnhuYURpWUR1U3RxRDNCYyszOGlLK1JyWjN2TTlUU1di?=
 =?utf-8?B?UkVxME04bU11NllEUkJaMndldDAxbUR6QXdSY08vVkhpNnZiTEZoZWRWOUgy?=
 =?utf-8?B?NnFTL2J3QTZWU0dlSDZwYjUvY3JUTDlnL1RqWXRpcUliMFVyeS9SOVF3TDFG?=
 =?utf-8?B?MWxUdXJBcXcvZ0FHVzJCdkhOZzZTUCtTVWFSemxQWmVwTENTUUMycStVVEUz?=
 =?utf-8?B?dlNJNWFlVU1sQ3VPcyt4c0hHT3gzYWlsdnVNRWtZWDB5WDBSNlpoR0pjNVVY?=
 =?utf-8?B?YXR3dUFySWRqNHhGMTlWSWkrM1FoU3kvbVlidlhFenhKWjJBd21VTm82ajd3?=
 =?utf-8?B?QUxsY0JDelQ4NlRRa1QzL1ZRbERRWk5yRHhHeDZXWWNQY05LQ05qcUd4aXdM?=
 =?utf-8?B?OHRKYWVOaElsV1BJR1FKVElXQmIvbjJOYmd3U2hTTTZJbkF6YktXdloxTlJo?=
 =?utf-8?B?RW5rcE43NGVxSE1leWVQSjFIS1F3K2Ruam5XM2ZBWXppYVBPS0Jwazk2MENa?=
 =?utf-8?B?aGhnUEFTTzR2ZEhxbmlrNDUybVhMU1F5VldiYUpMOE9VV1lVcHFkdDh5K2xU?=
 =?utf-8?B?RS9VdWtWcDlsWUxzYXdoQmMzTkR6dFpVM1M0cXVDQXphMkxLVUxoSWhBTVpn?=
 =?utf-8?B?UzlaVUtINjhKR3J4WXQrZEppYkN2dkw1Q3E5NzBIeXJ2bjlJL2tBUmZCMkUw?=
 =?utf-8?B?SmhMV0wxR3lPaVRyTEFXTjF1YkgwVFNRUytUdlZ2YTFXaGpLQnlmMm81eFJs?=
 =?utf-8?B?RXVBQldreTJYdE5CdTJJOW1jV2h6S0xhVWJSSStXNlVlNHhkRGpzWSthdmpK?=
 =?utf-8?B?VjdYaklGV29jMWZLU2hXY0JvUzVFWkp1cE9xQ2JTUVZoUTJOSGZCNWUrUVNG?=
 =?utf-8?B?dWF4aHU3YkRvQ0VUQjMrcytWMmlZVjJkejFuV2FTd3BEbzJ4ZVJUeElIUWRp?=
 =?utf-8?B?N0x2ZGh3Ly8wVUM0Mys2dnhLQzViSkpqVzFmWHgwbTU1U3pkNkIrR3R2SEpx?=
 =?utf-8?B?cTBvcDAvRHZlbVltNzJES3hxN1Yzc1RTUmZqajMzMlRqS3U4Mm5jRUJQR2VU?=
 =?utf-8?B?MEM3UzgrS3o0TW4vemd2M1BNeDQ0VFYreVU5Z0lWSkFpSjY5V1RuUEU1ZERB?=
 =?utf-8?B?TmZGZ0xwQ2ZTbk1zVFg4OXVBUXphMFVTL1liNHBBK3pSRFVmS0RJV0RaK0hX?=
 =?utf-8?B?OXBld2FSSHlITk1NendXWm5jNG5TRVBjYVYvRjZ4T3pYaWE3czkybjZUNXhl?=
 =?utf-8?B?RkJma3pnNnhDUnpyeTI3RlA5S1pPVnQzMm00VG4xL2crSTVGSGEyNDRlYXdi?=
 =?utf-8?B?MXl0Z2x3eHVYRmQwTGtXM3NoWFgxeGxKR3NQQ0VleHF5NHJXOG9mWEtPUlZz?=
 =?utf-8?B?QXprL3RJd1oxcktWMUdBak9UUVVJcE0za0d1U0JEdGR2dVBDck1FVUxCOUZV?=
 =?utf-8?B?RURSS2QzUHB3Yy92elhYbklkQzAzblZEZzRFL2ZkYkZ3cDN1eUpXQ2U2cmZa?=
 =?utf-8?B?Mkt4WWdWYUozNWN5UzFxVkFVc2pvY0RqRVBEaFVNMjE4MnR5YlJkNnI3T3NO?=
 =?utf-8?B?RjZwREZWMUt2aEJLTkVUMHg2NTJEUW50SWk0ZG9HYUpNT0xrbEdyb2gzbnVB?=
 =?utf-8?B?MHFuQkk5eFV5TC9GSlRxTEl6QUNDSG5kbENlOTlQU0VVWnFXaUJ3OUtLTFRU?=
 =?utf-8?B?ZXltd3Z0cFcyQVpOalhRN0V5VnBoQklvbG5vWC9LZ3FuRGtYclJsUU1ZRDBY?=
 =?utf-8?Q?sy1g0kzi8v1PT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR10MB6505.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rmx4RVBRVzFIZzBsU0w1MCtEakIxenlHT0k4aWhHUExMcm5uMjZjbUhPbXNG?=
 =?utf-8?B?NnpLRHlSTS9lZ3lLSHRQZ2w2VkJGL0w3K0ZCWnhCcjdSc3p3YnRqNkdRejhB?=
 =?utf-8?B?Vk92S25mb0ozNnJHc2UxbGUwOGQzSWQyTmNEYW5MQTk5eGlVWWNVSHdtODFq?=
 =?utf-8?B?cnlQT0NVUUllci8yaS8rQUhjVys3NHhSb0luc29qaWpMWkV6a0c1eDE4ZVRT?=
 =?utf-8?B?K0IwcjRpTmdENUNyemp3cjk5azVoUGZkOUMxYVlIem9TSGQ4M2lPSEFqV2pt?=
 =?utf-8?B?bnMzSThBTWMwSmtxK25HVTV0Mmswdk4yeXFrc0wyK201Qi8yN1gwWGlYOVI1?=
 =?utf-8?B?OHVaeWZQRUJOU2pBZmpzNXdyMERtcjFGRWxTdGIwL2JEaGV6N3YySUhUMEl4?=
 =?utf-8?B?eUplR0F6RkFGRWZ3clNsSWprdmFTVlZOMjNzUFdKem5XUGpDZ1U4cnZFcHpD?=
 =?utf-8?B?eGdhRVlUQ2Q4S0p6SDJobW5IQTRNWUpHZUdxdVNLejdkN2wzKzcxTE1kQzFn?=
 =?utf-8?B?QWFxcFkxU1dNdmRBbk9FRnBDblZDREhJenEveW9mc2pENS9SRUhWdUs4UWpS?=
 =?utf-8?B?aEFMZklyaWd6VUtrbzFPZEFsUk8wRmtMWFU4ZTdmTndNVkZIUDErZjhpaGMr?=
 =?utf-8?B?UmtqT0tlTEIvN3lUbzVtRldNTzY0TUcxQ1hET1VUcVBwTldKL3l6ZTNIdm12?=
 =?utf-8?B?Ny95UXY4eS9TU09LbmdyaThrbnFDeEY2bGtLcUhNRW1ibjNqL085UHR0Sksv?=
 =?utf-8?B?RmNMZzB6dTJHNHAwaCtLdkRiSmsyNDhPUDBSNEdvc3ZhWU13MzRtRWpiVjRq?=
 =?utf-8?B?TTdPNmxVRUI3bVlSbldNNGhrRzJBRE9BSEI1VktYc2VaVVBwck5MWWNITVMv?=
 =?utf-8?B?RFQvWS9XL1dwRlVvQnhaWXRaYmIzLzl3NkNNVmRPZ25kZjIvK3dtcmt6bVZn?=
 =?utf-8?B?bDR1RHdjdmhhRGVTbTdDZTUwR0pRQkVpMVhOREJFeHU0Nk9Gc3Z5bUlDMlRr?=
 =?utf-8?B?ZDZiaVZQSlArYm9vU2RFS3l1bldXdWlUUkl6OE5LQzZKK3VCVXdIMkdJNkVo?=
 =?utf-8?B?c21WWHdHZFBEaFo4WVFaWTVoN0lTUnRERkVpN28vb1NiV0xrS2tEam1ZV08r?=
 =?utf-8?B?SUdhZm05T29LUnRkQzh2eWQzSVlvL1QyRGR3QjNVZW1MSmEyaDN0S3h6K3d4?=
 =?utf-8?B?Vm9LajFFSEpkdEQwWTY0WEhrbkd4ZHd3R0JhMEx1VVU3RmZ0TDNZdE8zT2Y0?=
 =?utf-8?B?QVpEdlNZbjhvT01wcFh4VEkvR2VtUE9TbW45OTNNUmdBeE0yUWc3czFNVXZv?=
 =?utf-8?B?NTgvYTlTMkk4UFJNNXpkemZ3R2gvdEl4bm5XQXRsMkY0VWlCNCtzN2M5V3kv?=
 =?utf-8?B?Y3UvSGo5dUI2OWFkc0VsdUJ4eWZtSGtFMDU1VzVVeUh6dXJJSXBlcE5SRDQ1?=
 =?utf-8?B?bUdkR3RWSEpLb2FTcG1TZnVHQzZmNEtaQnJjcXRXNU1NMUlGVDN5dE1hOHdC?=
 =?utf-8?B?MDhNQlBUeWtsUU5jNjRTTHdiSGVNdUQ2YXoyK2NXbUwrR3pRQ3llWGNKQ3Zh?=
 =?utf-8?B?MUtPSXlPb0QrNTBzRjgra1ltZzNNYnpUQ0dPREd5cWpSM0dNV3dEZDZmYlBL?=
 =?utf-8?B?dVJpK3MySjRMbkxhZUU4SWxuWm1DejZ0SlBCdWFuYzQ1L2s1MzNkK1hVazhj?=
 =?utf-8?B?M09YZ3NsdnZ0NGdSbnpQcmdCQ25rUGtFR2RqTnNIMndocUJyQ1lSbTV2bmxz?=
 =?utf-8?B?djA3Wnc1Y2xROWhyTTlPTGRoNTBjQkRQOURUSmdYYXdQOVZjYVl1SXlGL3pC?=
 =?utf-8?B?SmZwcXlzL1BhVHF4S093cUFaOFJVRjlHek53dTBOSG8rZk1WUWpYV3NLOVVl?=
 =?utf-8?B?WkVWNUp4MmhwVkI2L2hsOHViUnJ2b2thV2lHL2JMbXVHc3crUXJraHpoSndY?=
 =?utf-8?B?d0xuTGlRdzQyUEhjOVBtTEZGRGZpaFh4SzFob1RYY0Y2VXhFdjN1R1dmK2ho?=
 =?utf-8?B?Wm1pNEV2ekFqb1FOM2trN0ZTaWlqQzUzQlFlVXRPcW5uSlJ2SjAwaE9wamdZ?=
 =?utf-8?B?MWdPMnN5TnArbkFjS2ZPc3Qza2xFdDkxOFhFSDIxOGF5bDhoSVdwRjJFSURI?=
 =?utf-8?B?VlluTldYQ3pDdU90N3JsM3BybXU2V0E1RUoxYkNWOUZBYnRkOFBFVFZLNmJt?=
 =?utf-8?B?MWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1UqMbLA4s8V349nfO41WhUtdjHuALEnmPhAxj0NZnW0o91PgaDvK6krL0Rtm8F55w6l5RRauKzyhYPSCVn4+YRiNzLtu/N+8EDN/zZr8ziZ1yZctwvWVG4gelZVZwTVPDIIHm2Y6JWqCvo2OhxfUQMX+JOY2oo2Jf1rLlU1oyknG5nM+Zr0dKafseifGtLeWyqlEkRKfql5P9/Psx69lDj86Td9CY5O+udTvukH2wCRTJxPOvoxTebFU2s6yXWKjmndFgvh3cTUMxAv133hgzf9FqRUVJJSyMJqEJcmsadktl+y/h0RxiA+RoW6doW2IQ9NYVTZdabeR3CBNtpWtjbjqKgoe0BZTAhIPAWZ5srRGBHOamLrgYG5VVtlzSWgEW0EPmbGoWCBPQHPzvuBPX5hrIxwHAaxGgrvUPsqqJPfyVbtGINCTri5ZOzxjzeHCtpneDWmjHkhyVAr+fQED/iWv5DwX0ZJomes8apnsZkKIREhfEnRuwsdiW6H95JnCF46hHHCctKUk9tM62XNC+ym5qVgXXUhitUb7JZIcrLnfdFACTzB78v3KIXBbaZ1f4VXvCz84iHgYG17MWqBZd6MogJdDgABuKILYlx+igjI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b50e43a-06d6-48ee-7b8a-08dd403edaf3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR10MB6505.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 08:28:06.5091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bktS6O5bsKk52fUyg6288Rl9lPUwf8vTMXyre7sOKEhHkRxl5F+2SEZHrhbnK6hqwAeJkfpVZWLG8JLZyNLPg5sGl74+A/EyP5mz2VPRWnI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8045
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 adultscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501290068
X-Proofpoint-GUID: ALR5CpneA_GqVTdXeCkkRQhvyeLiSY-h
X-Proofpoint-ORIG-GUID: ALR5CpneA_GqVTdXeCkkRQhvyeLiSY-h

Hello there,

The stable tag v5.4.289 seems to fail to boot with following trace:

[ OK ] Created slice system-serial\x2dgetty.slice. [ OK ] Listening on
udev Control Socket. [ OK ] Reached target Local Encrypted Volumes. [ OK
] Listening on /dev/initctl Compatibility Named Pipe. [ OK ] Listening
on Delayed Shutdown Socket. [ OK ] Created slice
system-selinux\x2dpol...grate\x2dlocal\x2dchanges.slice. [ OK ] Stopped
target Initrd File Systems. [ OK ] Listening on LVM2 metadata daemon
socket. Mounting Debug File System... [ OK ] Listening on networkd
rtnetlink socket. [ OK ] Listening on Device-mapper event daemon FIFOs.
Starting Monitoring of LVM2 mirrors... dmeventd or progress polling... [
OK ] Created slice User and Session Slice. Starting Read and set NIS
domainname from /etc/sysconfig/network... Starting Load legacy module
configuration... [ OK ] Set up automount Arbitrary Executab...ats File
System Automount Point. [ OK ] Created slice
system-rdma\x2dload\x2dmodules.slice. [ OK ] Started Forward Password
Requests to Wall Directory Watch. [ OK ] Reached target Paths. Starting
Remount Root and Kernel File Systems... [ OK ] Created slice
system-getty.slice. Starting Create list of required st... nodes for the
current kernel... Starting Set Up Additional Binary Formats... [ OK ]
Stopped target Initrd Root File System. [ OK ] Reached target Slices. [
OK ] Created slice system-systemd\x2dfsck.slice. [ OK ] Mounted POSIX
Message Queue File System. [ OK ] Mounted Debug File System. [ OK ]
Started Read and set NIS domainname from /etc/sysconfig/network.
Mounting Arbitrary Executable File Formats File System... [ OK ] Started
Journal Service. [ OK ] Started Create list of required sta...ce nodes
for the current kernel. Starting Create Static Device Nodes in /dev... [
OK ] Started LVM2 metadata daemon. [ OK ] Started Remount Root and
Kernel File Systems. Starting Load/Save Random Seed... Starting udev
Coldplug all Devices... Starting Flush Journal to Persistent Storage...
[FAILED] Failed to start Load Kernel Modules. See 'systemctl status
systemd-modules-load.service' for details. Starting Apply Kernel
Variables... [ OK ] Started Load/Save Random Seed. [ OK ] Mounted
Arbitrary Executable File Formats File System. [ OK ] Started Set Up
Additional Binary Formats. [ OK ] Started Create Static Device Nodes in
/dev. Starting udev Kernel Device Manager... [ OK ] Started Apply Kernel
Variables. [ OK ] Started Load legacy module configuration. [ OK ]
Started udev Coldplug all Devices. Starting udev Wait for Complete
Device Initialization... [ 24.427217] megaraid_sas 0000:65:00.0:
megasas_build_io_fusion 3273 sge_count (-12) is out of range. Range is:
0-256

[   24.427217] megaraid_sas 0000:65:00.0: megasas_build_io_fusion 3273
sge_count (-12) is out of range. Range is:  0-256 kept showing
infinitely. It kept popping until I reset the system.

Reverting the following patch seems to fix the issue:

commit 07c9cccc4c3fecba175a7e5aafba6370758f5ce2
Author: Juergen Gross <jgross@suse.com>
Date:   Fri Sep 13 12:05:02 2024 +0200

    xen/swiotlb: add alignment check for dma buffers

    [ Upstream commit 9f40ec84a7976d95c34e7cc070939deb103652b0 ]

    When checking a memory buffer to be consecutive in machine memory,
    the alignment needs to be checked, too. Failing to do so might result
    in DMA memory not being aligned according to its requested size,
    leading to error messages like:

      4xxx 0000:2b:00.0: enabling device (0140 -> 0142)
      4xxx 0000:2b:00.0: Ring address not aligned
      4xxx 0000:2b:00.0: Failed to initialise service qat_crypto
      4xxx 0000:2b:00.0: Resetting device qat_dev0
      4xxx: probe of 0000:2b:00.0 failed with error -14

    Fixes: 9435cce87950 ("xen/swiotlb: Add support for 64KB page
granularity")
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Signed-off-by: Sasha Levin <sashal@kernel.org>

I tried changing swiotlb grub command line arguments but that didn't
seem to help much unfortunately and the error was seen again.

Thanks & Regards,
Harshvardhan


