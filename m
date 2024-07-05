Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4478F928F5B
	for <lists+xen-devel@lfdr.de>; Sat,  6 Jul 2024 00:38:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.754537.1162994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPrXx-0005Mz-Rw; Fri, 05 Jul 2024 22:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 754537.1162994; Fri, 05 Jul 2024 22:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPrXx-0005L6-Oa; Fri, 05 Jul 2024 22:36:53 +0000
Received: by outflank-mailman (input) for mailman id 754537;
 Fri, 05 Jul 2024 22:36:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VuSb=OF=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1sPrXw-0005L0-7X
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2024 22:36:52 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 104c6af0-3b1f-11ef-8776-851b0ebba9a2;
 Sat, 06 Jul 2024 00:36:48 +0200 (CEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 465K7WKo010665;
 Fri, 5 Jul 2024 22:36:18 GMT
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4029234m1x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 05 Jul 2024 22:36:18 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 465JefqG010991; Fri, 5 Jul 2024 22:36:17 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 4028qbtep8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 05 Jul 2024 22:36:17 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by DS7PR10MB7132.namprd10.prod.outlook.com (2603:10b6:8:ef::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.29; Fri, 5 Jul
 2024 22:36:15 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::a088:b5e0:2c1:78a0]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::a088:b5e0:2c1:78a0%3]) with mapi id 15.20.7741.029; Fri, 5 Jul 2024
 22:36:15 +0000
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
X-Inumbo-ID: 104c6af0-3b1f-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=Nxuhf13ZdvDaAF6OU+/qOUCx4GRcDHeYjHjf0UpD+tU=; b=
	I9WNwaT02ALM8nFmXqraqlsdx18HxI7P4lpTiVTOFRiAvEbXx3Pj+ZsxVqGhcFCV
	XKN6gO/2PZ0/jTtuyCPSx/q/T25dJJkjI/84Ahd+qv3BuYXZHzlSf2V+bPcI3YLA
	fAggl89BBk0UtoJ0X6r2TyvkxkLaE+NLCVTU6aEW+wGp0jlhzbSdvAyDjni6QRTw
	LnVbcXKu6PBT+fVMENGiL/SNY+xddCEzN7gUuYhYgjTxgfT6R6u2RWxyG4KAKSLs
	P/iypxdj6SLzG4o6UH22KhVbE7lNpk4CrJ1Fx8i7lBjGoKfGaVEP9XB4gZ25wmOO
	x+7d8FmDhfrwfTb0T1X2Yg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EFRUjQFlq/9GyTlMCtItuANXxjBUUH5s9zZANdj71V8SBjlZKbNuwzXIEaaDrkBDeHqpJTbx0/TTaWrAu7K9faES0xcgDndee9udMHxFkKpWvZdxh5rwclsNaeYcTDV1AzWgn36JfmpUOMtRwrDE7bmdttfZAn8atrXUCMizKrCt98na2tVTUNRm/jaLHjpkbAchEO6qkLXwJ3i6pjsIJ+d4uOYEOjKp3Lr2PJG4AemM/xQexduVkZiLxFQBdBUMQrZT6TpD7//HdqLspEeFWU28LRkDRxkiHP1UMZ8xTymVhrLkr/k7WfqmWTDkrbPMzX2HrD6FSoVQnOo5fDkDEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nxuhf13ZdvDaAF6OU+/qOUCx4GRcDHeYjHjf0UpD+tU=;
 b=f1rSJsHnlvWuz1xs08nd6fi8o2H8/vTDAhyTMU1n+UELIX8sLbaUYEvz+br8LiDkwN+XOtc4Rc71plnxdkf67Z4dZZBzbkWOG9fr6Kb51h3/duoIotQmkFNIi7m2i5r4Hlj+C+tmUURYq4i/wQZaFOc6cfQEkZM0/TkkCvtCQRX+6bUyvJTmFCPD2FvjlurF9Lz3ZhmcwxeAUBD575fr6AnQqex0IPkXLFlfKngh3SmTUgvuij9dtlXz/h/XjhH+xFtczOOcA8VxoeykWeIkBFFhDfI0ne7cr/lz/irQQYWkGtjm6Pfv5q4mpFVZAypq1LUgNjW0f6gUitM0jUp43w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nxuhf13ZdvDaAF6OU+/qOUCx4GRcDHeYjHjf0UpD+tU=;
 b=sFnG5p2fLjTxKQ/D3DwuWM3L+rbz/3K0ela4iKD4k8FRQtUD0/9W2XiNOteRXSF38zCRZUAQVv0Q9Vm9ocPY+zuFXto0gn/wBbDVCMVvTdxHqDchkRkMxPN7a2RZJDAUqU1vB2pu4YL0xMZnh0y1yZhv9KgA9zCtg+kOfr/7M1s=
Message-ID: <d28f8da5-7903-41c8-9213-4e24e376c837@oracle.com>
Date: Fri, 5 Jul 2024 18:36:10 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: make multicall debug boot time selectable
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
        x86@kernel.org, linux-doc@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org
References: <20240703115620.25772-1-jgross@suse.com>
Content-Language: en-US
From: boris.ostrovsky@oracle.com
In-Reply-To: <20240703115620.25772-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0003.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::16) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5009:EE_|DS7PR10MB7132:EE_
X-MS-Office365-Filtering-Correlation-Id: f7efc234-4254-4f0e-3fa4-08dc9d42e11d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?amJsUkhnRGR0Szg5N2R6Y2dQanFSTGJ6eFZQbG5PSHRiQWloSmZNSlNRdW0r?=
 =?utf-8?B?WHpDNzhEUzNyRFdTUFJxQVlxTFhZTGt6QlRLd0xzYlU1NUlqNmczKzhQbnhi?=
 =?utf-8?B?bys5ZGxwSEM0VUZuTXpNbHB6c05hN0NKOE52NTQ3dVJEaWV6UnpqUHZ4V0pM?=
 =?utf-8?B?TXVvYWwyNStON2JFTzc0aGEwSXh0cHNKeEp6K2l4N0RGQ2ZOejAyY09TR2JF?=
 =?utf-8?B?a2h3bkVDOWRxSEsvd3JtSGpFckd5RnZuSGlsK2FmaGp3aFBRKy9SbjJVUVBv?=
 =?utf-8?B?MmtMRjAwSzJKc01aVXhydXlReXZFODVaTWdpZS9hYmhxSVpmbmxyYTJNcTk5?=
 =?utf-8?B?dlBlRGpJaHVRQWtncmM0WHpuMHFlZUhvSE1sVWNkQWxTbTltcURuc0N2SWdV?=
 =?utf-8?B?dEx6RDAyZFUzOHQ3bmwybnNndGd3UXAyVkJ6Yko2OVJ5UzRaTkN4U2NRQ3k4?=
 =?utf-8?B?VHZKUkR0SnZGZ2s5VDdpVFlQeGdhOGJSdXQ3anVtU016MXY0MkpNRXBJbU1U?=
 =?utf-8?B?RUR2bHpRbXdyeFFTT28vOXRuMGwveEJsTitBTXAwQzlLdUtnTGVVdlV4T3Y2?=
 =?utf-8?B?d2RsSkw1Vnd5ZTBPWGZCRzNnSjc0TFBtNC96QmxMdnlGRVp3d3lWd05VNVdv?=
 =?utf-8?B?QXVTbEJJZHg4SzJyQ0JubzZhMERYQ2E4cG1NVXdoS2VhQVlJZEF2eU0rR3A5?=
 =?utf-8?B?aXFYRzJxblUvTUVqTko5OE80TUtid2w5cTZCZ1g4MHA5MURLZSt4am55a2hF?=
 =?utf-8?B?YnA4QmhCaVFZdUVFOGkzeWdOVm50UWhrRTVselBLSDZrbCtENVpVWFR2TFV0?=
 =?utf-8?B?aVVrdW1qb1AxZG05L2VVQXR1UDVzU0hNRTJHOWZWWlBLQ3U0RnBzVEtGS3BO?=
 =?utf-8?B?VVVucHpUNWdndDhtMW9nTEhmN2RkSlYrQXJUamtyUUZmZ0s1ME1Hc0doTGhY?=
 =?utf-8?B?NENwdFpOa0VHdGV0SkpsMTZ6UFoyTnZENk04dm5XbjEvcTdpWmducmxUR3BF?=
 =?utf-8?B?clRjV1NMbEl3SnFoRjJaSUh6QndkdTBraFNEYkJIMmIxZ2FIOElQWmJpSU9G?=
 =?utf-8?B?ZzEvOVN0M2EwVjdSRTEvZlhFZ0VaVHVvVzliMEFOVEpmMlBvTGY0NkdNcmJp?=
 =?utf-8?B?VE5YaG5jenNKVzYvOGhJL3BnNUJNVHIxZW1tajVWZW1WbndWTkRCTmZGWmxY?=
 =?utf-8?B?b0s0NGc4cXJpNEtqd3pBaFlEM1hJeTM4Q1VPU2o4ZllxYUowTTVtZ0RVMS9t?=
 =?utf-8?B?NjBpVkRGWXlXNkRNYS9ZS2diK3dJRnJRUEpHVE1GaGM3TDFmNFVybGFqdjlo?=
 =?utf-8?B?aEVMNjlPRkl0WUIzYzJ5WUcxYTZCTWZRM2c4ZDJ4M1B1RkYrMVg2Zys5ZDMy?=
 =?utf-8?B?RjMrZzU3Wjd4dzl1NzBGcmhiZTR2QVFaMTNKQjRxY3hVMmdvYUljRkZZcDNE?=
 =?utf-8?B?RmdHOTRsd0VUQS93NDFUMXNCN2Vyc2x4UEtxWDhHeEpGS0NIOVU1SlMzZVcv?=
 =?utf-8?B?YTI2M0J6M3ZQRnQrbS9vcHl6TytOMFAweEhxT1IrZ3pqaktTT1dOZHN1V1RC?=
 =?utf-8?B?U2ZaVStnTld5cU1Nd2s0M3QralJtV1R6SEw1ejJqV2JidHBVV29adWJaUDRw?=
 =?utf-8?B?eGsvQnFvcGQzUUVRaHZKdFpFeVpjZFprUldTQ0ZiRXRpenY2cHViWnBSQkxC?=
 =?utf-8?B?ckxoUUZ0SXB4WW9WKzZFajJIL0tBTXRXbFQ2eGFnbnpPdkNiak5LNHNoeWtV?=
 =?utf-8?B?VE5UQzZPaDlEZWNLcklmaTZDZDZZSGVsRWRZbXU1c1VMOHRxL0VVMEdvNDNt?=
 =?utf-8?B?b2lQZXJ0Nm4wVGY2TlFVdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?emluUmdZZXZRR2J4bWZKb0l5bzlzZHNpSkV6eXI2S0IrUlRvMDc3OHdjZzR0?=
 =?utf-8?B?eU5JellPaSt0TU9TSU5uQWRhdGZyM25VK0dZVkZTZGdPTVJEbGgwdGJjSFdj?=
 =?utf-8?B?dno3VmRkMjFTbzAyOTdveGozcnhrbjdlMmx1SDZWeWM1eEU5NVlRWkNMaEl4?=
 =?utf-8?B?UTM3aWQzdXJLZVNWUHpsSitjUEFIVTduQnI3TjZHbXFKOWVkVmZldGFyeXMy?=
 =?utf-8?B?aVluWmlSaFA3WnhCcDRTaU5WRnZ6UXFaZGd2cU5kNXhkTTZsQ2M0Z3MwbnU1?=
 =?utf-8?B?RmlFV1d3bHdSZ1RiZVI2aUltZVVWL095b1hDbVJGZ1IvRFFZQ2FSNytHREts?=
 =?utf-8?B?Y2xjaEhMeDVZOVZjMERBZk5zamNNUjVDa0U2ZnBiMS9LUzdkdW5ibGt5dG1P?=
 =?utf-8?B?dnZWS0daVG15NlE0RUJYelMwZXlTRm4ydDZCZ1ZHdW5meno1aGxDUXNCY1pV?=
 =?utf-8?B?c1IyUnFSUGlmQWZ5K0Vucnkxc0FsQitEcnQ1TUc1RFFHTmtwWmxpdTlHNHBE?=
 =?utf-8?B?emxyZnQrSG9KM3kvVWU4RzlPSTMvUldIMy9GTlRQT2M0bHFyT25Gd3FEYnla?=
 =?utf-8?B?RnJKclFwMHVaeHR0M1FTSk1NTWZoaW56d0ZjSkdqV2o1NkhKcUp4M0F1UGlQ?=
 =?utf-8?B?YlR2MnhiQU5wVHJYbDVSTFo3UUtZczRhSlVBQUdMTzFNcHI5NUF5a2VWa2Ir?=
 =?utf-8?B?ekV0ZitQckRSL3BrK2tESFh4S0RLRU4xK3pQbndQNlV3QmtqM2hubkg5UnNB?=
 =?utf-8?B?S2xIUHRQUHpobHVxR0tGYkxuZWJzcEJLOXA4dnBiL2NxK1pzcnZCM3JTVG1D?=
 =?utf-8?B?WGMvWHIwamtsZGxtSFJHOWtVMXdDUGJJRE9ZYWJHYWZ1ZEd3V1prY0ZvaVlx?=
 =?utf-8?B?Rlg0MXFNQmxURVI4ZmZrWS9rZ1VzdjNMWVVRUGhQWURidGhtS2dVaUpZUHFH?=
 =?utf-8?B?VUJhZUluZzhOc1hXQzE2SUF3MVBLRFh0MU9JNE1VM3NYQjErVE02d3BsVEJF?=
 =?utf-8?B?SUZJdHJSV0k0c1ExZjJ3UnFFVEgyWHBVNkhsR284ckdQTXF4ZnFKK2l6OXlz?=
 =?utf-8?B?c29RbEZxMGVrbHNDaitDdHhmb2J2NHdLcG0xSTdXV2F1eVE2RjFMMisvR21F?=
 =?utf-8?B?Q0hsVG9jdWg3SmkwdmdJcndpNngrUWdHZmI1ZGN1OHhuVlp1NEtjWDRza0lz?=
 =?utf-8?B?cjlabWR6SlVaY2V0OU0vdVcyZ1Y1dGZaYlI5aXoybVVYZHNsaHJHUUVTUjBN?=
 =?utf-8?B?QkR6dE5qWXB1d3hEU2pVbCt4RW9GREQwSkxWZTFSMmQ1VUkxMmxFckZrOUFC?=
 =?utf-8?B?RXMySUp4QWlZYmRDMXRoTG5KbjRVWEFiSkRRdSt0ZzBJYmR1cmpHZWtuSElS?=
 =?utf-8?B?UDJNaDlncDFWWmRjVEFCTEVoalJUK1JGWmNRcjVldGpsM2E2UWYzbzRMdW1N?=
 =?utf-8?B?VGlGZktuc0FOS2JlalQ4YStoejZVYVQwdnVvbWpGZjBOTUNPczdUc1ZTY1VB?=
 =?utf-8?B?ejJCTGdMQ1JiNFNpa1RUN0RYRUsvaU9rRGo3cEFTQU5RZUpVemU2Y0ZRamxm?=
 =?utf-8?B?NWp6dFd1WkRGbHFzYUFsRFJOa3Y5SkZYRHFIaDlGWHZlcHlqNUVna2hNaE5D?=
 =?utf-8?B?aXN1L2JjaU9IWmhhMUN2RFpHdENrZ0VZeHQrWXR3TmZyOU1jV2RDMDFzK2lG?=
 =?utf-8?B?R3FYZXlZc3JrYnlDc0tyMGFLbXlnVGtFRlpmVFRPek1SanRFN2JqMkhhMGxW?=
 =?utf-8?B?LzZpdlhZWkwrd0JEU0tJeFFzRWhFenp1UU5XamxBRnpIa2hTWFJJcHJUV3RF?=
 =?utf-8?B?VlY1VkYzZDBwSVV4Y25OeW1mazNVSDdMR0NFUnQxRVpKbUJRSXVIcmowbWxn?=
 =?utf-8?B?MXpxOExOcTVhVmNXbko5WW1GTjNQcXZsblhiTHJ4bDV1WmFRVE15S0dBTHBX?=
 =?utf-8?B?VGFKN0tVeFBpbGpySTZKdDJDeURtRVZCQWJ6MVBNTEpQOXdDa1lIb0pXcUJB?=
 =?utf-8?B?UEdxNEw2VUZKUUZFSWwvdngydWZoS01oRWlPL3Vtb3JodVhESTNLbWN5QVNj?=
 =?utf-8?B?dUx3eE8xWlBCUjlsZlQ1US9CU2UyRlZMbk0zTG1razQzRVFYZ25qbzIrMmtz?=
 =?utf-8?B?ZC9DS2djNnlHZGFndENlMERqRFBnVk96M1E2K0Ntc1lFVEE4NzB4azZCZjZp?=
 =?utf-8?B?VXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	ePQ4aI623gcCzmjYesDZqjWPZkrpK2RWopHLuL93Ov2HT1llYDDFV/UmztRIwRAU079Uiv4FAzU1fGYfDtp13waX1h1XFkt8sso9Ugmuwue3gGIQ6rlECRgheTrteA/kp2kKWRHuWj6ftYuwsJ4rL/p8C0UJwg66Mv1f5PJ3wdpmgIcQhQo8607u7QZgjqKCV0fg+kMrJtKXjuEf83bZbNc1FzcdFIInAit+veNta5s0R/WBKcOCfYUTZGAB+vy0YR986Mmwc0U4xoynbUIP1xFS+t5ck4RXKnLdxffdrR49cXVe4pmudkD2RtatydEOGV1KH26runIPjtkE9PrXI+ALydTZZwd+rCriMyW/KkechU4NQN6E+CpjCVps7+u9bnCNP88OIBFDLf9xFVJq6ZdsBHCnpHg89WddelqEHp9DIdV73tb2cVW1ILh8y6hdBLJXqE4oKNsmes9Jr1Sv1isy/k7ibqbu/Y+hz1r85mFe55oCQv7t0rvfXnz/BBAOxzxJ5mFe4304p85x/q3dAgFXnPkEJaY4Bxdm0qQUpcPWrGlNDHQHvsR0rw+AuszurQeOIHBSoXFQsLgjXcW1W0pJUxaCJ5PWKpT6Xh7uUhc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7efc234-4254-4f0e-3fa4-08dc9d42e11d
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2024 22:36:15.1523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IjAFWH9DUt5Ub5bbRrx7WXkcs0Tv4sAmVWcrzUk9aCPZMvdryvF1kA9/39vQLZ1U6O/KTrdRTwCdIfZIsYj1vRqwrYlTqY1DZEuja0ZBm48=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7132
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-05_16,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2407050167
X-Proofpoint-GUID: tJgA4AdcYAu4c3RWH1C_TnNhxtBLWwHg
X-Proofpoint-ORIG-GUID: tJgA4AdcYAu4c3RWH1C_TnNhxtBLWwHg



On 7/3/24 7:56 AM, Juergen Gross wrote:

>   
>   #define MC_BATCH	32
>   
> -#define MC_DEBUG	0
> -
>   #define MC_ARGS		(MC_BATCH * 16)
>   
>   
>   struct mc_buffer {
>   	unsigned mcidx, argidx, cbidx;
>   	struct multicall_entry entries[MC_BATCH];
> -#if MC_DEBUG
> -	struct multicall_entry debug[MC_BATCH];
> -	void *caller[MC_BATCH];
> -#endif
>   	unsigned char args[MC_ARGS];
>   	struct callback {
>   		void (*fn)(void *);
> @@ -50,13 +46,84 @@ struct mc_buffer {
>   	} callbacks[MC_BATCH];
>   };
>   
> +struct mc_debug_data {
> +	struct multicall_entry debug[MC_BATCH];

'entries'? It's a mc_debug_data's copy of mc_buffer's entries.

Also, would it be better to keep these fields as a struct of scalars and 
instead have the percpu array of this struct? Otherwise there is a whole 
bunch of [MC_BATCH] arrays, all of them really indexed by the same 
value. (And while at it, there is no reason to have callbacks[MC_BATCH] 
sized like that -- it has nothing to do with batch size and can probably 
be made smaller)


> +	void *caller[MC_BATCH];
> +	size_t argsz[MC_BATCH];
> +};
> +
>   static DEFINE_PER_CPU(struct mc_buffer, mc_buffer);
> +static struct mc_debug_data __percpu *mc_debug_data;
> +static struct mc_debug_data mc_debug_data_early __initdata;

How about (I think this should work):

static struct mc_debug_data __percpu *mc_debug_data __refdata = 
&mc_debug_data_early;

Then you won't need get_mc_debug_ptr().


-boris

