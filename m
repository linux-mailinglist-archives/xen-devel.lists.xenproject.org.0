Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 535E599CA33
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2024 14:32:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.818678.1231987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0KET-0004m6-Kq; Mon, 14 Oct 2024 12:31:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 818678.1231987; Mon, 14 Oct 2024 12:31:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0KET-0004kM-I9; Mon, 14 Oct 2024 12:31:29 +0000
Received: by outflank-mailman (input) for mailman id 818678;
 Mon, 14 Oct 2024 12:31:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dly0=RK=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1t0KER-0004jx-PT
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2024 12:31:27 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20615.outbound.protection.outlook.com
 [2a01:111:f403:200a::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39fbdf08-8a28-11ef-a0be-8be0dac302b0;
 Mon, 14 Oct 2024 14:31:26 +0200 (CEST)
Received: from MW4PR12MB7334.namprd12.prod.outlook.com (2603:10b6:303:219::21)
 by CY5PR12MB9054.namprd12.prod.outlook.com (2603:10b6:930:36::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 12:31:21 +0000
Received: from MW4PR12MB7334.namprd12.prod.outlook.com
 ([fe80::2e77:557:17d5:86f8]) by MW4PR12MB7334.namprd12.prod.outlook.com
 ([fe80::2e77:557:17d5:86f8%5]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 12:31:21 +0000
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
X-Inumbo-ID: 39fbdf08-8a28-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cq6PuGQkaW6ZkfcFuX/kRNjqq6u9JQKmANszUxP+p+srzg4sA0npwjD4rNB14KGnCYHVKw19+7oa60cR4L72mrJFRArTH/RzY+4weIMwnqauQNtewVnT4mJar17k1SaAISYkDSftRl2C+Lce84LbNcSwrf2ffmUPPhPteJ+aotIxh1AZ8k0TeZYQwtR/cp+q9KUY5Ls84vRKXGsdEeRdZMuiAItLGM4XweNLqSMb4enZkqxXjB7gv1wZMKRLQUMdH1vVXKmpZN1WRdPdH0pIgDDi3QOCdbQLF5mxLUw9j5uHK0tGlGQumSDNBdKDpDHwNC84bFRqGPmOYL4I9rQuGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RrlPg+Ibf5s4mzBqi2G3YSQbRO201tuZBiLlK53qdJY=;
 b=u1x53jkz8CwrVBf91CO8ceoMIrWr2CVGTr+1ZpBr5HKU7G+f9PLGuY1/4wvsxNheqGN+619L4HLdY/uLyVnXTkzkR8j8NgqOuE7mQPtsFWirHEqlLhN6MRNRm+M4QsslNvOg+oLR+Is7480qWkeF17vwNFp78hCj2/mjGmBfodK4w/ZS40aNNIQ0+5ggmNBtnssb39o0bU6nbowvedpncEUUIouVBEKiXMLuGDs7YiQSRsxU41/JK1NIT6VM+pRomNNnhe8Gg/sPcmIKVz1Uvvi6Nxnmli9C5Gn9+xGdWawCFCa43eC8YQZgSplFuja40Eh+cPen5vghljIEO67qgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RrlPg+Ibf5s4mzBqi2G3YSQbRO201tuZBiLlK53qdJY=;
 b=uxm+jyXTQdTudH4IycKNNBR2FvoYAeriBl2Fd7a2lDbpYoqh7AIizUBHTJ0yxAQeL32qIy0GJ4nHBrvP0rKkz0q8eMmho976ocZPLFOq2ITawYyVR70pcApr12QLgAi8pNw1PwlNsDPr0P7RLTxw2gvM7kYdoPTAzKcaOEkaFJc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <6ea82706-49c8-48e6-9e17-bba0e96909d7@amd.com>
Date: Mon, 14 Oct 2024 13:31:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] xen/arm: mpu: Create boot-time MPU protection
 regions
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-5-ayan.kumar.halder@amd.com>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20241010140351.309922-5-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0450.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::23) To MW4PR12MB7334.namprd12.prod.outlook.com
 (2603:10b6:303:219::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB7334:EE_|CY5PR12MB9054:EE_
X-MS-Office365-Filtering-Correlation-Id: 2306ea34-1c9c-472a-a294-08dcec4c1c3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WWR5UHMyUXlvbkZ0Q2lkN29CbFlla2h0eTRDVWVmMUZwOVg1TGliclkvQUtk?=
 =?utf-8?B?T1hId2ZtTndqdnA3VGsxRnZQRlNDdEhyTDNhT25aTWpqWU40U2RLRWtENGlC?=
 =?utf-8?B?K2ZpejQ4eUFYYjZXZ3FYMTZqOElkUDhqMDZUMWVielIrOFZUT3ZRekdUYVFa?=
 =?utf-8?B?UTkyWm1FcUNzaTNueURtNm5mVE0yTTlwbzNSTFgvZnhPdE56bWh3VVBzcVJx?=
 =?utf-8?B?NUhOdkdzdk02TFBDdGhKN2NIWUtQSkU2R0ZHR2hrd1hRWmEzOXVoU3NJRCtU?=
 =?utf-8?B?WU9FOHhHR3Ztb01rWWc0S0JRaWg3Z1dpWDhyZ0tSc1dMa0RpQTEvYWw2eFFo?=
 =?utf-8?B?TDRVVkxON3kzZnJ4NlZFSGdDVmtRWXRzR1gxNXB1eFQ3OU5xd1UxcVRnc0dV?=
 =?utf-8?B?MnkyeUJQbndnVTZ4VWxQaGN0K3YrU0l2UStQU1ZGa0FMRXFweG15MzJxdWFh?=
 =?utf-8?B?M3NVMXlmbjd0ZGhqKytueURnL0REVlVOQm1mZzVuYjFDVmJ5NkhKdDFJZ2pD?=
 =?utf-8?B?TTlubWJjVzY5SEdGSUEyV0JTMGdrTUhXbVl3ZzhTbFVLQWlBZFJCNWU5MFpi?=
 =?utf-8?B?bS9ad1U4QkVRZ3E0YS9YNW9XWENQa3pKdVViQlNKay9tL29sZFV2RzZvSzd2?=
 =?utf-8?B?WGlkbkticGdpNlpPVTd2S2FGRFZsZlBiWDI4SUJqTFNCaGJTWUhPNlNjSlBl?=
 =?utf-8?B?SHUybnhJb0pmTDVRNTFJaDIrSVRvVGMvaFVSL1RxaXB5T3FrZFFMb005NXRv?=
 =?utf-8?B?VERCM3ZyTGdJNVEzWlcwQ0tRRjl1RVlWc21VRTczRWZwT2RtMjR2bGJ5RUZN?=
 =?utf-8?B?dVVtdWFKeU5STHp5SE9zUVE2cS9GNDk5K1dQbTBIMUFuR3JyQzVzZ0RiS2F5?=
 =?utf-8?B?SGNZQXIzTk1VMzRyampWYjRxQVBuK1VoKzlQYkRkSnM4M3NWaUxueFZSOER1?=
 =?utf-8?B?c2pLeE45TUdKY25OaHFhS0ZMdjJzQmtxTytsZStjV042eWtMZUFGVWV0MkFo?=
 =?utf-8?B?bmc1ck1za0VvdkcveGhjUjd5TVdscU1wSE1Ed0Q1WkU5eTg2L1FyMWhtTWFo?=
 =?utf-8?B?RzdrTDY2WUhiS3I3N2RLVVVGbWRLbnQ1T1FxNjFFMkUwemNqTlJMY0w1Rjln?=
 =?utf-8?B?YkNZL0xxUFE5TCtGWkl5cVNPaStmS1AzUEhyOXlHRyt2VFB1d0dleTRHU0M5?=
 =?utf-8?B?NzhSTzdFTS84VmV4MU5jZS80YW42bXIyYVlPSnNuOVR3elNLT3NjOHVuOXNm?=
 =?utf-8?B?ZEhqVGR2OGc0aUdpRkx4Q2p2ZzN0NUVaVUFpcHUrL3JhMHZFWlIzSnkwVFFK?=
 =?utf-8?B?NndFMUQ4US9aYkFnenJuZ3kxUFhCNFRnbGVNTlozU1RKRkh4MXZDbnNSSEFH?=
 =?utf-8?B?bmhjL1FaTXZlalJVcklxTnlxR21EVHcvdkJOQ3F4OC9wS1haeEtUVHhiazc2?=
 =?utf-8?B?a0pPNWQva2Z2TFpndGZrRnZENHBiT2FSS2tQbjFMblFtVTR4QmtOV3RoNGNw?=
 =?utf-8?B?WWZLT2RwTFVqcUJSWG5vM3g3UkVFMnoydmNzSElsandXcm5EeGdvWWlGYXQy?=
 =?utf-8?B?S1UvY3Z4M1JVcVBwUCtMSWoyNCs2Z1BLZXUrTEJqb09LYzdvQUc1N0k5ZVhS?=
 =?utf-8?B?VlpSWnllVnk3SHMxbWZ3M0hzY0h0M1RvUTBWQjVwcXh4SEF5SktCM2xDYVJp?=
 =?utf-8?B?SVptN1FBenNRS081UHhmVEJZTjR5WFhmc0V0OWV2UFNTTmM2L0VWdFBRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB7334.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1pFRS9KQXdXRXROR0MzcllWdjZZMzN2bm04K0N1QkVHSFJ1ZnBIbkZCdFp0?=
 =?utf-8?B?Tm1ha3RId3dmMk45Zm9uSVBtUmVLdlR0Z1EvZGlIMmpIYmJEU3MwaDdiaVlP?=
 =?utf-8?B?NlV1U3hkK1ZLZXUyQ012NGk4T2xOeDlIUlpLRlZVWlU4Q3B1WFJtVUpRUUVo?=
 =?utf-8?B?aGVCM3lIMU1VTDE3bitkcEE0d3FtM3FUTjh5VmZqYTl5aHdSak5ZaUxtSk91?=
 =?utf-8?B?c0lOVzAvWnRIckpldDcxV3c5anNZSnhNeVRrQTJvMFRVcW1TTFZmTWNXTEFa?=
 =?utf-8?B?blNFSTZtSlp2blpKc0lzZ3Q3UkVhQjlPK3Y2KytLOFU4ajZib3ppeHBKVXJ6?=
 =?utf-8?B?U3FOUGRlcjZ5VS9ORTMzcVU5SUVEQ0Vqb1FTeng0ak5pVXB3UFd0QlpwL2s3?=
 =?utf-8?B?T1NIVktNOUFIMm5WamxRaHU1OWxnSG14azJ5T1UxRkwzTTVCVGJpaVhrbzFa?=
 =?utf-8?B?enEyem1lWmdxbDNCN2JLM21pZ21vejJlRWRmMWZpNVptUk1ZOGRUZnpVSFBH?=
 =?utf-8?B?ekpLRnROaWdGOGoyV0FwN2FGbXVQVDFqdHYzcFpDTTkreG5rcDMybE5NZFJH?=
 =?utf-8?B?cUw2dFVxK21nTjhvRFk3b3MwbU4vY0hiZHNqSitJOHkzT1pwTXE1cEgrRnVS?=
 =?utf-8?B?WDdKV3FUYU9GYThGU0JrMUJwT3lNbWh5Tis2QkNpblpZZTlYaEFnQ0JJNm1W?=
 =?utf-8?B?N2tNSVhJQkR0OHR2dGNrNHpDNmtOa1lKSzZqTVJCMFA2SDBiTWZvKzBTVjR2?=
 =?utf-8?B?OE0wL2lvY3NRZDZJRm9HQlo1VnBJZ09waVNQR294RTZGSms1QWVwR09qYnNp?=
 =?utf-8?B?ZWlRbFZXcVZXRE5USTUwVWx3NUtJbzA4b3FURjFLcXdtNDJpU3VzZXZFYzla?=
 =?utf-8?B?bkNkdlhielJYZHB1NjRNMG5sdjZWVHhLRmJWeW5OWVpzWWxOTjYwVnNjWjcw?=
 =?utf-8?B?dmY5eXplSjdtV3hkdERWQTdiZjZPL0UwaXc5eGhFZE5OMVhiOXJBdER1VVdZ?=
 =?utf-8?B?aVdSUjg3YklFVlpmQy9qTFIrZ1RPUVIvNWZSWXpjR2liNi9pMWlnazUrMXJF?=
 =?utf-8?B?bDZDUWF1TUJBSlZKVVR2SndqdDBHS25aMHRoQTJYK2VwNW9sNTZzcjVhYkJG?=
 =?utf-8?B?Ky9DMERqcnhIT1FqWWRKMC84aFRSVHpyRnVKTFJPNDFCZGJvT2p2K0N0ZlNm?=
 =?utf-8?B?NTNEN0hVMXNtcUM4R0JBOGE5WWsxTWdDK3BSSzF0MW1FdkRjZkh1OGlhcWVz?=
 =?utf-8?B?dDczZE5VcXY4dFNDc1JYTFNGazhpYW43SUNTYVhYSWFQZUtSZ0RwcnVvaDgz?=
 =?utf-8?B?bWJyNGJMSk1sV3B6S1h0NC9yRFRDdDVqaTFicnhoZElRMVFUZEVUdDd6eFNL?=
 =?utf-8?B?UkhiaVo2L25PQnA1MjAxUlNGTVltdHJjckdyRGtrSG91TllIK1JVaFFCN1dW?=
 =?utf-8?B?aEhrRWM5WHFmYkN2MzNJM2RvWVRmdUM3UWw5bUJQMm1taW1kUXgzb0lsak1X?=
 =?utf-8?B?cWFSOTlOTTBESUt6RllPWUpISzlnOHRUeHZCclJwdkx6Zm5vbXZTWTFjZEF0?=
 =?utf-8?B?MEhtOUU4YnR6Zm9nOUJVMUpGQ2c1UW5EeDVhb21OVm9iRzZjRXFubVZvc2x2?=
 =?utf-8?B?ZTJDWVRJcDFDOVY4ZG5URFYyaUh4YjNsQjgvQm9yYm5ibUs4NTVVRytnRFlj?=
 =?utf-8?B?d1kxTVZtUlZTb1F2TUVWRXFYSVYwZFdEUEUwWG4zSEM1d3BqWTRqZXdMeklv?=
 =?utf-8?B?OHVIdWJlV1FFYUlXdTErMHd0SXoxTWhudFo5QTJ3WkkzbzNiZU5RS0U2YWZL?=
 =?utf-8?B?cFA3UzMzdEoxQ3JzRUluQnZWaUNvM3Z0VGZZVWRZQTZoRjEyS1FhenR0MlZX?=
 =?utf-8?B?RzY4MkpSWmRVbnNJbW1zU1J0Z1V0ejhHajh3L3YrNDBXRCt6bkkxbmVyaEhF?=
 =?utf-8?B?WXgxTHJwdWZmMWlJaU1DbWd5MzRRM0FYQ2dsN3UwTFpnenRhQjBCblMyWDVa?=
 =?utf-8?B?L0RoRG51S3I1Q08zWmVRV0o4ZWcxSU92Q0pId0NvcFJYUFJVWEUyTWdRdDFs?=
 =?utf-8?B?cDlIdW5xZERVNDRJZE1LUEtBNFY5dHQ0SWtwclc4elhESDQvZkV5N0JLcUlS?=
 =?utf-8?Q?GxwPccT6WqVWLxXlPd3Lzhqkb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2306ea34-1c9c-472a-a294-08dcec4c1c3b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB7334.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 12:31:21.7672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eLW+AuSiA0T3EVIj9L3O6zdfHk318OGothRG08p/wnSe4/5T2dy0KlZp0r9KrX7Zu11hhzhrihqiQJV4X1yr5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB9054


On 10/10/2024 15:03, Ayan Kumar Halder wrote:
> Define enable_boot_cpu_mm() for the AArch64-V8R system.
>
> Like boot-time page table in MMU system, we need a boot-time MPU protection
> region configuration in MPU system so Xen can fetch code and data from normal
> memory.
>
> To do this, Xen maps the following sections of the binary as separate regions
> (with permissions) :-
> 1. Text (Read only at EL2, execution is permitted)
> 2. RO data (Read only at EL2)
> 3. RO after init data and RW data (Read/Write at EL2)
> 4. Init Text (Read only at EL2, execution is permitted)
> 5. Init data and BSS (Read/Write at EL2)
>
> Before creating a region, we check if the count exceeds the number defined in
> MPUIR_EL2. If so, then the boot fails.
>
> Also we check if the region is empty or not. IOW, if the start and end address
> of a section is the same, we skip mapping the region.
>
> To map a region, Xen uses the PRBAR_EL2, PRLAR_EL2 and PRSELR_EL2 registers.
> One can refer to ARM DDI 0600B.a ID062922 G1.3  "General System Control
> Registers", to get the definitions of these registers. Also, refer to G1.2
> "Accessing MPU memory region registers", the following
>
> ```
> The MPU provides two register interfaces to program the MPU regions:
> - Access to any of the MPU regions via PRSELR_ELx, PRBAR<n>_ELx, and
> PRLAR<n>_ELx.
> ```
>
> We use the above mechanism for mapping sections to MPU memory regions.
>
> MPU specific registers are defined in
> xen/arch/arm/include/asm/arm64/mpu/sysregs.h.
>
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from :-
>
> v1 - 1. Instead of mapping a (XEN_START_ADDRESS + 2MB) as a single MPU region,
> we have separate MPU regions for different parts of the Xen binary. The reason
> being different regions will nned different permissions (as mentioned in the
> linker script).
>
> 2. Introduced a label (__init_data_begin) to mark the beginning of the init data
> section.
>
> 3. Moved MPU specific register definitions to mpu/sysregs.h.
>
> 4. Fixed coding style issues.
>
> 5. Included page.h in mpu/head.S as page.h includes sysregs.h.
> I haven't seen sysregs.h included directly from head.S or mmu/head.S.
> (Outstanding comment not addressed).
>
> v2 - 1. Extracted "enable_mpu()" in a separate patch.
>
> 2. Removed alignment for limit address.
>
> 3. Merged some of the sections for preparing the early boot regions.
>
> 4. Checked for the max limit of MPU regions before creating a new region.
>
> 5. Checked for empty regions.
>
>   xen/arch/arm/Makefile                        |   1 +
>   xen/arch/arm/arm64/mpu/Makefile              |   1 +
>   xen/arch/arm/arm64/mpu/head.S                | 130 +++++++++++++++++++
>   xen/arch/arm/include/asm/arm64/mpu/sysregs.h |  27 ++++
>   xen/arch/arm/include/asm/mm.h                |   2 +
>   xen/arch/arm/include/asm/mpu/arm64/mm.h      |  22 ++++
>   xen/arch/arm/include/asm/mpu/mm.h            |  20 +++
>   xen/arch/arm/xen.lds.S                       |   1 +
>   8 files changed, 204 insertions(+)
>   create mode 100644 xen/arch/arm/arm64/mpu/Makefile
>   create mode 100644 xen/arch/arm/arm64/mpu/head.S
>   create mode 100644 xen/arch/arm/include/asm/arm64/mpu/sysregs.h
>   create mode 100644 xen/arch/arm/include/asm/mpu/arm64/mm.h
>   create mode 100644 xen/arch/arm/include/asm/mpu/mm.h
>
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 7792bff597..aebccec63a 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -1,6 +1,7 @@
>   obj-$(CONFIG_ARM_32) += arm32/
>   obj-$(CONFIG_ARM_64) += arm64/
>   obj-$(CONFIG_MMU) += mmu/
> +obj-$(CONFIG_MPU) += mpu/

This change is incorrect. The correct change should have been in :-

--- a/xen/arch/arm/arm64/Makefile
+++ b/xen/arch/arm/arm64/Makefile
@@ -1,5 +1,6 @@
  obj-y += lib/
  obj-$(CONFIG_MMU) += mmu/
+obj-$(CONFIG_MPU) += mpu/

  obj-y += cache.o

I will wait for comments from reviewers before re-spinning the patch.

- Ayan


