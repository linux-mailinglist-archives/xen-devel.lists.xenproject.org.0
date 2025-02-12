Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E76B1A329A1
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 16:13:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886510.1296140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiEQ5-0007Vx-V4; Wed, 12 Feb 2025 15:12:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886510.1296140; Wed, 12 Feb 2025 15:12:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiEQ5-0007US-RU; Wed, 12 Feb 2025 15:12:57 +0000
Received: by outflank-mailman (input) for mailman id 886510;
 Wed, 12 Feb 2025 15:12:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iixs=VD=oracle.com=harshit.m.mogalapalli@srs-se1.protection.inumbo.net>)
 id 1tiEQ3-0007UM-Vn
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 15:12:56 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d253aefe-e953-11ef-b3ef-695165c68f79;
 Wed, 12 Feb 2025 16:12:50 +0100 (CET)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CEtXr9002906;
 Wed, 12 Feb 2025 15:12:15 GMT
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44p0q2fkk0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Feb 2025 15:12:15 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 51CDowhs002331; Wed, 12 Feb 2025 15:12:14 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 44nwqgwqrd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Feb 2025 15:12:14 +0000
Received: from DM4PR10MB6886.namprd10.prod.outlook.com (2603:10b6:8:102::10)
 by PH7PR10MB6604.namprd10.prod.outlook.com (2603:10b6:510:208::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Wed, 12 Feb
 2025 15:12:11 +0000
Received: from DM4PR10MB6886.namprd10.prod.outlook.com
 ([fe80::bdcc:98f5:ebd5:cd38]) by DM4PR10MB6886.namprd10.prod.outlook.com
 ([fe80::bdcc:98f5:ebd5:cd38%5]) with mapi id 15.20.8422.021; Wed, 12 Feb 2025
 15:12:11 +0000
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
X-Inumbo-ID: d253aefe-e953-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=D9UUUuHS+2yNjVERK7i0zf3kYCZSwVGTZtiRiJ9aJWw=; b=
	TH6sI0zexRxAT5YU4WQqc6Z10hgUj9rpkfammXQNA+YB/PBA3F9W5cGvyAg1Ukmo
	8vJqz5Uq4rVO3mas7+4eLF5o/uvvNPdwvEB6hbjJAgLcCkhvShTOC4DqjiTnnrqe
	mLwdqbYc3WPlw8Fc/KRHkednmZE+xiMBN2UuOIXKRVgXL3G6M4+EnZ3C5Q/Np00H
	FPKCwtH2hywxYIc05UevoZHE2BWkaRSiYxOOYj7LYncfL3FlO5+th43VPyVGbjBB
	JQwijJogNeE/rknWhVAkYjtRvrwFNFxLDUEB0Nm7bxFs0t+zKWuhPS5MZqHA5/xw
	SmGYSOBZjNiCqAizrEsXhw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j3UHg6r4UOnB1gvlN5cuQ45bzI2scl1RNw5rWSHUix7LUAQN/XsZB7TpxyyHQh9zDPH8Deo3zgrR1X4canEDli2J9VWtViHswRv6bcpJMTqdE9JfdEl+Nmt9yitgDDXEzFv2LAeZMShm2Uk/deHFI0YMpSPqEA7G9grVFGtZ440Qx7ZSN9xh90OTq49ycTnkva+1cJKA1F+8pmMJlCU2PtERKo0WmSW5zk0qq/ddhk/AN15V8rVs1PMT3QdLWtl5hVgjfCs4cVZoP9xhP2Kh76oSwT/TArFQhKSLBy+kN5I+tk09lqP4FKWKq42zXhjaI/TL/MbC3/QNGVTbCtbohg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9UUUuHS+2yNjVERK7i0zf3kYCZSwVGTZtiRiJ9aJWw=;
 b=nkWBqfwXhiWNy6o6p8kj3jG2bjo5L8C0n/3UFoBBZHM8IBU8ZtjEqMIGGrT5lFFgAkvedub3K8tijYSfU2Z6AAd3aPze2nHctW0UHyy2qdj8n8GLLsRmlcfrMbQGK/ZJ3XN44pbiP6MvIuM0h5zMoQqW7RoHvnO8U0A3saWaBHvVdbKvWCCpg5vlmYK/LCW1dWoggjQjiv87PG/FmBV2gTzcyfOXorZiWJUCDRtmc9dJKn91D861tR4U2Q3KNW3E4dw/luDGsbCLRIt4Q1oy1QtdAAdjrkp+YvV7rYLcdLfEP6kXq3AWV3zz3Zye9FjonMl3i0uFaXtRMa7yRPlyWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9UUUuHS+2yNjVERK7i0zf3kYCZSwVGTZtiRiJ9aJWw=;
 b=Fn0Un1gZ1t9aQu39cS0JapuX5yN1rOUu5mEAQrBr4iik1Q+1uK4zgx4mr5XbI9RIsLAKiX94WTrbXwBi9K/ogij2wEY/gY7qO4ZEXMidTcBDYMIyBNEBwV+W2i5iMsdTZ3Ehpdi3t6NliowQg9ptxvezy9IDFOZVAZrYYwtYqN8=
Message-ID: <716f186d-924a-4f2c-828a-2080729abfe9@oracle.com>
Date: Wed, 12 Feb 2025 20:42:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [6.1.y] Regression from b1e6e80a1b42 ("xen/swiotlb: add alignment
 check for dma buffers") when booting with Xen and mpt3sas_cm0 _scsih_probe
 failures
To: Salvatore Bonaccorso <carnil@debian.org>
Cc: Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Sasha Levin
 <sashal@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        xen-devel@lists.xenproject.org, iommu@lists.linux.dev,
        =?UTF-8?Q?Radoslav_Bod=C3=B3?= <radoslav.bodo@igalileo.cz>,
        regressions@lists.linux.dev, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Harshvardhan Jha <harshvardhan.j.jha@oracle.com>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
References: <Z6d-l2nCO1mB4_wx@eldamar.lan>
 <fd650c88-9888-46bc-a448-9c1ddcf2b066@oracle.com>
 <Z6ukbNnyQVdw4kh0@eldamar.lan>
Content-Language: en-US
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
In-Reply-To: <Z6ukbNnyQVdw4kh0@eldamar.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0181.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::13) To DM4PR10MB6886.namprd10.prod.outlook.com
 (2603:10b6:8:102::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB6886:EE_|PH7PR10MB6604:EE_
X-MS-Office365-Filtering-Correlation-Id: fbd2b20d-b014-424e-62a0-08dd4b779f90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d0pBNnN3YVczK2o0UmlBeWV3QUR2WjNHaXYyYWFtblE0YTBKYUVDSzlCR1NU?=
 =?utf-8?B?citmVCtSTnhZUG04MVo5NGlFclI1S3Q4Z1EyTERzSEp1MVF6L0lBWkFHdU15?=
 =?utf-8?B?TG42M0hCYzNFR2c4aVZpcHRqWFRCS1BJZ0VsMTdjTDM5dkRxYVVMcUg4S2hS?=
 =?utf-8?B?ZGZjdVFYQkUvRVh4Q0RlMzRkVEZ1QkZ4WUFpdUM0djV1Q3p2alEza25CR0ZQ?=
 =?utf-8?B?VjhORWFrWUlxeGw2aDJWZWY1MnJ6VTNOUWhFZW9WaUdjY2RLbExXWFp1QTcv?=
 =?utf-8?B?VWNrTWlZeFlCOVJtbVlIUUMyWUovaXp5aEN6eWxXUlRoNGc1YWZ3NHdpTUxP?=
 =?utf-8?B?TEJYQkl3NFMvRHozMU1oWVY2c2VXeXRrTmcybXMwZ3d3cUI1c09vekV5a3Ay?=
 =?utf-8?B?NCtZd3VlRzY4MW1QTU0zRm1PQkpOVS90TnU5a0t0YVN5cFYybUF5d0ppYUVV?=
 =?utf-8?B?dUxSM25aeTF5WjBReGtJT3FuQW5YSUdzZnpDVDU4N1llZWJDeFVKcjhyTE0x?=
 =?utf-8?B?Y0laN1NLZVFUSExHaldQSW5LaHV6WmtRNERjaVl0MXY3U3VmS1VMbHJGMUwx?=
 =?utf-8?B?R3FKa2prSEk5eWdhVDc1R3JWeTJQZjF2Z3ZIMVBBdUlLS2NQRE93SDQzeVV1?=
 =?utf-8?B?SmZVellvbHVWYmhHeVNQZVF2ek5BMVBjZmd0NE1LMGNmVTVXOWJ6WHJFc3NJ?=
 =?utf-8?B?Z2pnUURCRCsyVHI0VTZyMEVrQWVOQmZsL0h0VCtEWXJQYUJXUlpZOXVnbnZX?=
 =?utf-8?B?ZmJJemNFQkpKeTN5eXdVRUVySG1jSnBkZjFJTmFTQzM0ZTZSQjRIYnFTNS9F?=
 =?utf-8?B?QXo1ZHIzRGJuWkNmUUUweUlUV0U3Qjh1dmo5RDdwV0xJTlM3SU8xTGU4Q2tZ?=
 =?utf-8?B?ckVBZytqRTlTSWttU2o0Zk1KMnZBK2lJNWpSY2tLTkF6VE5oZmtyNm9paVNp?=
 =?utf-8?B?c2VxNDdqazQxNEFCZVJIVnk2ekpTaXErczBKV3RPTXlhUnY4T2JMcXc1UFU5?=
 =?utf-8?B?TjJlZGhES1M0dWVWNGdFNFZhNXpIQW9HVzJ0dVk1UlMrWUJHQjRPTi92aEVl?=
 =?utf-8?B?eUk5bHpzVjNEc3hNc2d0dEZrZ3BGNWl1a0ZsZmFucTZzYWhYQ3hvRWR4aTVt?=
 =?utf-8?B?UGFzY0ZZaHo0MDI5ZUU3SFZvR0xFaTlrM1ZLZUtZNzRvM24vQk5EcS9KbWNr?=
 =?utf-8?B?MlFodUF0dXBjSU1ZWXBTVVRRQWhMNzRuczA0RjlkT3luUnRDNVNOYjcwWm16?=
 =?utf-8?B?TjFFb1BFSzBLcUFxaFN6eFJpTW92dCtTY2FiZDVhakliUzkvUVRlQ1hvMEVX?=
 =?utf-8?B?OVVXV2h1UUFBbllSaU5weCtTZGt4ZzFiK2pkMm5HWnkranpmUEtiRzRVUktn?=
 =?utf-8?B?RWVZNWhoQnN0b1BReGR5TFhQVTdkWGZRL2llRzBLZG9CUXdSMzlJd0tEbUlD?=
 =?utf-8?B?ZnNIMTRWMU81RUlsMkdaMVF2NStGRW82ZUdVeDhaRE44NnFqUm5BSXNQZ2pY?=
 =?utf-8?B?TDVoZVcyQTUrVkhxaS9ZaFRXL0JQSkY1K1dYcmNuVGNNM1IzTHRqU05vUUE0?=
 =?utf-8?B?VmdIcldYM3JNbnhQeHV2RGc5TXc0bTRiYTBrN0ZCcm03STF0TVc0bmVJSTJa?=
 =?utf-8?B?V2tkSlp1NGZ3clFQc0l6S2tId0llbmtWZlB4b2xWZUpseTQ1cnc0MmVVUzAv?=
 =?utf-8?B?bUdwMzAyUVgvKzFnc0dhWWRvME5GYkR4ZjlneVRGOVJadEEwNVNodG1TQytV?=
 =?utf-8?B?bFdQQTY1WU9xQ1VtVkFQWFdBUjNsRnZoWEJhNVNUa0pwREhPaUNmS2lodTJR?=
 =?utf-8?B?QjZVVDA5MVAvMFZvWlpHQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB6886.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDRPQ2hlMUhUdlV0eEZRTzk2WnFoYU5oMzFtajBHL3kyU2xBOUpuNmM2UG1q?=
 =?utf-8?B?T2pjR3BuUVQ2NC9NWk9KTEc2MnFGVHhqWE1QUFRkYW40UXI3Z3BrOEVUNjNa?=
 =?utf-8?B?WHZ1TGYyTStWeTM3SG94YWtiNlFVVFZRbUltRmhoVXV1aitLc1BLZEVITzhI?=
 =?utf-8?B?TTFYOUE0VjBUdExYWnplL3p5ZTlNWk9YOXgzaFUvV2FtZFhjRFdqOVZUcEZ5?=
 =?utf-8?B?VTE2MDVDUmc2dnQrSnE5OHN6cEtucTdUZ1htc25qK1phUXZZQ05IUTdlcURt?=
 =?utf-8?B?OS9wWjB4RGZBL01ZZGVFRzc3bkU2clcydkhhYzRmdmhQaTgzVUhPNFNsNlYy?=
 =?utf-8?B?R200Y2daNUZINXZEMmR4LzdYS1E3NGtsS0pJSDgwL0NoM1NkNERVd1IvYU55?=
 =?utf-8?B?MmxLSkdWUVF0azIwVEtOejlnM2RqdlFPTlpHMkZBNUdJY0hKQ05XNlppWnY4?=
 =?utf-8?B?QzhpVmtKU2FlcE53U2V4c2NaSGNodHdKL3VGTUV3NzdEOUx4QnRFaVpPQ1FD?=
 =?utf-8?B?a3FSV1dWSForTFNrOWQwNFZHcWUvZTFDcURqR0pjbmlIQkdKNmNjVkhQQ2Rn?=
 =?utf-8?B?UHBnM2RFSVJqNzFxWjVjRnI4Yy9KV0hzdUtYNUY5eU42SG1Ua3BiYldwTklB?=
 =?utf-8?B?V3hrQXEvcm1qcXFaU1dZMzlHWitPTm90bU1sTXZtakVyV1ZRaUVkR0tCTU5l?=
 =?utf-8?B?Y0xDa3dsdytpbDRydDBIenNOQ2J0VzJFdnpYUEJjMFpxQjdhNW9TWS9KcHNr?=
 =?utf-8?B?OE91S2lCa0RpTU52NERBbFZGVElpaUgvYlVhemlNTmNJeEQ5U3VtUW5PY3RR?=
 =?utf-8?B?bUxuYXZCMVRPNW9aNFVtc2FSVDdTRm1IMG9RYXZqTU1SV2xIZ1VHOHRubGp4?=
 =?utf-8?B?cDFnMXlwcW1EODdwcmo3YWp6Wm1iWnl0RmRKT0pxVWxtTDFEd3I5VERtbCt4?=
 =?utf-8?B?dTBoSXlBMEtNQlIxUjdqTllBK1IrZXRTaEdSdyt1YXJRMFVGaFRRakhZQlRr?=
 =?utf-8?B?d2tRb2hWR1JRZm8wanMrUjZWZ0VoYmgrZWxiUnZEbWhtQ0UzN0Iwc2xzbk9I?=
 =?utf-8?B?L00wVldPOW5QNDhjMFVSWXB3VkhCUFB5cDNDNzRmT3RWNUpyeVBqSkZOS2hU?=
 =?utf-8?B?d25zWnVHSmRtU0dFUzluUy9xTFlQSmEwZG5BdXRSK3MydGhpMWZYOWpTNGUw?=
 =?utf-8?B?VlNlMVluQjVXTVFmcVY1czZjZ0NtWk5JMGZjbHJNU3FZRTlvZWc4aGh3Ykll?=
 =?utf-8?B?K2FjM1RnV2ppQTV6TW1CS1Q2c255bVgxb3B6bW1YRTVwNW9qL0NwelpoMnRN?=
 =?utf-8?B?WDJIZWZ1SEQ3OVNqT1ZDZnVuZ0doV3htRm0zSWRyL1RKZ1Exc0VnSjc2bUU3?=
 =?utf-8?B?WGJqVm85RFVqa0c2NXN3NFhkLzN5SGJqc291eEg3WUFEcjJJVkt3bkl6NjE4?=
 =?utf-8?B?MWovKzh6OXA0L0JGLzl4Mm5KNWtHZ1g5bDBhMUFDSUJSZkVhaHVvdC8vZXY1?=
 =?utf-8?B?Y0FlVEVvRUdyVk9vRDh4UStqcjdPS05qeHpNOHZlSUhFVEVCZ0RxNWVobGxP?=
 =?utf-8?B?M0NjV2RxNFpLZ1pldVZqaU9RQ2hGSElJUE0yTENLMmh6RDBtS2h2OEpZSFVz?=
 =?utf-8?B?MlNmRUhvR3FLRlhuMXZvQ0pVZkZ3RGJmUnBxdXhSV3ljRmI1YmE3ZWRhbUVO?=
 =?utf-8?B?LzZScHloUmZCM2JYNHd6SlovSGNWSG9nd1NMN2loWG81R2VyN3JhSHJCQUNK?=
 =?utf-8?B?QmVNN3djazlPYWVKakxZWWxrZUJnZ2VuM05lMnQ1YlVZa1BrV3ZCZ0VHLzNk?=
 =?utf-8?B?OGVDVmdXUktDSjM5OXlYZC9tRyt5ZzY4SFBZeHdya0NpWURBUFJ3d2FUMDVC?=
 =?utf-8?B?KzBGaXFWd0FMTDZVUkx5S09WVXVEVUF2K3pRQ0dhcUoxeDM1MDBlYXBHazZn?=
 =?utf-8?B?NkdFdDk1T2ErZ2lMcmRTMndkU2Rlc2xSdHZLdEVjTTFrcllZbE00ZzYwd2hz?=
 =?utf-8?B?Sjc0Mm5OL1Y4cEJGRVNWT25xTFBpYWgwa2V4ZlZTYWlmajNjWG15cXJWWUli?=
 =?utf-8?B?blhZUFRaMEJMYUVnNlNaTUovL3ArMWVRUGUvOXo3YWtZRXhoaEIyQWNzUGtq?=
 =?utf-8?B?YjdoUEJIWEd4OEhwbXNodmx0TEFGY1JjaFJVVW5pTUFRTVBkYm5wcEd6enBs?=
 =?utf-8?Q?BAFAceZ3dhtkhn4dT1oFhrM=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	scM0pTrFiPSGoA8L1QvsFLUNRwCbExGOP5QjFUIjPnS18WEy64tvjSTs/4Nza+uYD6Ljb06yZTjQg6pwC532x6vRvRPcH6gES6ZmBWeSU5m5oiv+sGZ9G1Z0pNUu0gF0993SdWAzBKmQmUFRwxC2OJ7XDxSqoMEX/WFhJEqb3vwvbnp6s0skDWMaY6tShlxJniAtGoeyEfimj6sY07/xr4JXp5X0jymm5Urjokf+fTvVLqG8+dzx9bFf0yGbcMEa3IPBMTEPFh9XAzB+mryB2IjTtPo6LpXfVw/W7gGaQnJLKVm0y0wa9w1Dk1c/XfLFbMWbHqnqKx3zJLypXcOaWwGGbz0uKeGRkWj+xawO2N5N0yXY1p1JEcaPJBTmzA1ocV0JXAjMfYO4ldWSi3ly0HHghVC3YEGByN7LyWkq04E6pCWO6zTOHPcnsFLj6k/3m/3QN+ultqJV87Wjl9Xz+jtrbYzlzAqcMz4zcLLqjVzVaCSrIcPlKnN3xGMjaRLyFDWQncr3IVghqf7CzXtPMKz0HfEXIy2K0eJfcVkULVNqmqNeregpA/5BQIRea8JQZXc3XtI5/n5GJCpoOW5MFaW5ZhsXkAGy5VaqhSMIDYU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbd2b20d-b014-424e-62a0-08dd4b779f90
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB6886.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 15:12:11.0616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kd29h0FmLzwX1OzRGlkqCh7BnewrsMDi+zIj28HCKVdq35tIX1UkMeEkLjHj5tiBqhF1FYVOQEBHsEThN2B/Y/lYf924SzH49/w5VEF5tsvto7PH17GYzzA8fUBP1j12
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6604
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_04,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 phishscore=0 malwarescore=0 mlxscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2502120115
X-Proofpoint-GUID: BRrKgAroNluYKY-CYSBagFBxBd3T33vM
X-Proofpoint-ORIG-GUID: BRrKgAroNluYKY-CYSBagFBxBd3T33vM

Hi Salvatore,

On 12/02/25 00:56, Salvatore Bonaccorso wrote:
> Hi Harshit,
> 
> On Sun, Feb 09, 2025 at 01:45:38AM +0530, Harshit Mogalapalli wrote:
>> Hi Salvatore,
>>
>> On 08/02/25 21:26, Salvatore Bonaccorso wrote:
>>> Hi Juergen, hi all,
>>>
>>> Radoslav Bodó reported in Debian an issue after updating our kernel
>>> from 6.1.112 to 6.1.115. His report in full is at:
>>>
>>> https://bugs.debian.org/1088159
>>>
>>
>> Note:
>> We have seen this on 5.4.y kernel: More details here:
>> https://lore.kernel.org/all/9dd91f6e-1c66-4961-994e-dbda87d69dad@oracle.com/
> 
> Thanks for the pointer, so looking at that thread I suspect the three
> referenced bugs in Debian are in the end all releated. We have one as
> well relating to the megasas_sas driver, this one for the mpt3sas
> driver and one for the i40e driver).
> 
> AFAICS, there is not yet a patch which has landed upstream which I can
> redirect to a affected user to test?
> 

Konrad pointed me at this thread: 
https://lore.kernel.org/all/20250211120432.29493-1-jgross@suse.com/

This has some fixes, but not landed upstream yet.

Thanks,
Harshit

> Regards,
> Salvatore


