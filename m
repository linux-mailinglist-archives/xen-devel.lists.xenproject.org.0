Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A79B45638
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 13:22:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1111812.1460388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuUWi-0001wr-Gn; Fri, 05 Sep 2025 11:22:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1111812.1460388; Fri, 05 Sep 2025 11:22:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuUWi-0001vB-DG; Fri, 05 Sep 2025 11:22:44 +0000
Received: by outflank-mailman (input) for mailman id 1111812;
 Fri, 05 Sep 2025 11:22:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9kAg=3Q=oracle.com=lorenzo.stoakes@srs-se1.protection.inumbo.net>)
 id 1uuUWg-0001v5-VS
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 11:22:43 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1ca5121-8a4a-11f0-9d12-b5c5bf9af7f9;
 Fri, 05 Sep 2025 13:22:40 +0200 (CEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585Atpui006187;
 Fri, 5 Sep 2025 11:21:49 GMT
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48yxa5820x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 05 Sep 2025 11:21:49 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 5859Jbcn031751; Fri, 5 Sep 2025 11:21:48 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2063.outbound.protection.outlook.com [40.107.95.63])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 48uqrk43ru-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 05 Sep 2025 11:21:48 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CY8PR10MB6490.namprd10.prod.outlook.com (2603:10b6:930:5e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Fri, 5 Sep
 2025 11:21:42 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.9094.016; Fri, 5 Sep 2025
 11:21:42 +0000
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
X-Inumbo-ID: a1ca5121-8a4a-11f0-9d12-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=VfYT8qiL6P9H+Gdmwok375ndqrcm78qnzXxVUER5Pls=; b=
	X9KIvjGB6s3m/8eVELV2Y0Uj9AK0GfftfUPQbvTzs0d3wiTD04T8mlmhl2Dhu53N
	0hE8a5pAb+I9QH1SrekSuOJ4oVL5yq6QlVXrkxRAb7YwelRalqrUmlgSFtz/BZZU
	GwOw4fdZl5xqOPKoeLOLuXRvG+vk8n8brX1Qk/x6WXwSRfziKYQhrWVjZ+MmXowR
	yW//TrwwEgB3arH8YUqFOhscUpH7M9wesuAaUz7O+qrS32tDAprClh71WngM4qjz
	iAqLX//9kjK70BUBlRsrO0D4DIJBee3PdjplCIAQnqZene+T70o8htVYMNi5zKC1
	lUjP5LyDuGdPWQI9rVgrWA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wfq+mklH47m3TYK891DkNf79pJW9c7Oafj8VO2mAWylGKFpmWRF8q1R3asX26nToEwQNFfBvTUr4xC/2oodA5YXAzZ/K/qmOgoJigJQYzkVxeTXcYul8fXQqXBIlFN+xjvWtsJ6MP6rQ5+CrL9FZlGIuw/rg3xqjyhGB5SiraDxmKYIr/xUH8Uc6E6UhFF5gzQvfKKd2BYKxpwGljGfm4Fcp7oRkLWu8KrPSxYub2nL6oYyTAfFybPU34KxvZNlgRVymlOMsrmFa1n/JgfYu1D1Ob4ScCP94s7WOvA2XplCTDHQRNS19zHiqIm2myX26pk/Ihq8bvh/3jsfU9oYIHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VfYT8qiL6P9H+Gdmwok375ndqrcm78qnzXxVUER5Pls=;
 b=kGcaepnnvNKiuZ+n/lrC4qmvEMmH5qxCp/ELcFBoySlSoMMlBR9vGUz5JYhBk6Fzqo6HHCvzpiw1YRJT6Yc0xeto9ruF1YJ+HpbgQWuTBzYPM2kUS8IpbidP+5XbUsct3KXMgij1QZWlI/wmF38EPgzH5ZTjZusH6VY0vCZNeoQP0xyhzSovQ/kDaq76QxfLa8hlScd43GfacRBeE/xqkAV4WgMn77pGZwYp3nwK9WY5aggcwWrJPpI4YjgyIhTU11K4TOXnHIhFuF0iR3hGEgT04UVJZejr24r8+9MzP+F7vaEr0lPUARpoweKlYzPcdnoRvg7oS31RXkVC1ozEUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VfYT8qiL6P9H+Gdmwok375ndqrcm78qnzXxVUER5Pls=;
 b=JfCWt8ToCMUCik3uBuDD1c/0K2xZCJQfuRataG1hRAJrvKFmw1WhED4wY/PqOX3EpHZlG/h8WS9fJ41OvyHv5NcIABYpbY3ZT2Vd+FfxD8uiPqftWispmcUOK9jNpRUlB8UYEs1SRwOtbGxV+l1RIQV8yMkfUYhaXo7qZHrYawQ=
Date: Fri, 5 Sep 2025 12:21:40 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Andreas Larsson <andreas@gaisler.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Hildenbrand <david@redhat.com>,
        "David S. Miller" <davem@davemloft.net>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
        Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ryan Roberts <ryan.roberts@arm.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/7] mm: introduce local state for lazy_mmu sections
Message-ID: <2aed0b3b-1a70-4c89-9177-8de4fabb2237@lucifer.local>
References: <20250904125736.3918646-1-kevin.brodsky@arm.com>
 <20250904125736.3918646-3-kevin.brodsky@arm.com>
 <22131943-3f92-4f5a-be28-7b668c07a25c@lucifer.local>
 <75db1f58-98b3-463c-af4f-2ce9878cba9f@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <75db1f58-98b3-463c-af4f-2ce9878cba9f@arm.com>
X-ClientProxiedBy: LO4P123CA0035.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::22) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CY8PR10MB6490:EE_
X-MS-Office365-Filtering-Correlation-Id: 9188d4c6-3a6f-4c1d-293a-08ddec6e63f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K1FTQnRwZHZJb0RJdy91SkdJR0Vlc1pIQnpHM0tJc0RDNHJoTVMwemlSZElw?=
 =?utf-8?B?NWZBWHpBZEdic2Nsa0Zkbk94a1ExU1FNZXdJVDhkNzRZRFFOTkszOUR4dGVJ?=
 =?utf-8?B?NGpKN0VCVElpbHA2aWNJd3RsclRBYTMvdk9lem9HK3lHWVZicnEwTHN5UnRW?=
 =?utf-8?B?RW0xaXJBb09vREk3cnBQNUo4M2Faemp6MEJ0aTVFaUJRekVSVEdHa05zc3JQ?=
 =?utf-8?B?UWRBMzJtOFhyMzQvWkNaaitucEtUWWh2MFJiZGYwUFRhN01Edm4vLzJydGZG?=
 =?utf-8?B?b1AwWUoxTTRGMmVuQWYrUFN5aExkM1R2NHUraUY2cHpvS3dudSt0anFCbHFY?=
 =?utf-8?B?K0J1WWpDcXJKTGtYd2p3VlZMMEFURWVuZkF0ci9hT3NCODdtMkVLOTU4dlMw?=
 =?utf-8?B?R0VZajlLWmNNWk0wMjhNbjBEb21xZlVIc3QwL2Q1akpTc2RZTVpjTUhvV1I2?=
 =?utf-8?B?dDF4bytyKzFHOVQyU2VwNFZKYzZ1blFUYXlYd3J0VW9pbnhGMmY1TjlGWjhJ?=
 =?utf-8?B?QXhSeXFXVjBKMnhFRFIzZHYvVE1TcERwRS9NZzhRcmVEUWMzZWgzVnEzeWRU?=
 =?utf-8?B?QUVBVWJrdWlabHVOMjNqRGV0UDBPWVFTN005ajgyUUlwbVVJdWtLYlE2RTB4?=
 =?utf-8?B?NUJ4c1R3UjR0WmhWb1E5VzhuWWtZV0h5QjBJK2Izek5CWDFDb1NHSVlRbnB4?=
 =?utf-8?B?WEV6UmVlYWErdjYwSVRZWit2M1JDZWpmUWVrYlFLTGZyOGNCWjdsbHlhcjhy?=
 =?utf-8?B?TGJWUDNSeExnMWMyR3RvZmcrY01QN2JuYllNRVBVUUMrL0pPRzZTVGdJc0pJ?=
 =?utf-8?B?S0dxbkN4NXBCMGFsU2hpL0x5ajBtSUphM2V5Z3AzcmcvbWZJNWtSS1ZGN0VO?=
 =?utf-8?B?Snp3Q245QlduZ1E4RHhpNmszemIveEVUMlE4UU1aV08zN0RCdHdWMTBWYUor?=
 =?utf-8?B?S1BWM2JaWlRjUlIzUXlmS3JqdkZTMEhGVFM5WCtjL3dvbWpxdFlMRElqZmsw?=
 =?utf-8?B?QTh5UFBXYU1udU0vbWJidmg5NTkvYkpsY213Q0ZwRlhDSndYYXN3dUk0YTJp?=
 =?utf-8?B?ODRKVW0yQUxuam5GUGVlZjVXY1YxNFlUSUxwTkU3V0pzUTRiZjcvaW1YQ1JV?=
 =?utf-8?B?a2hEbXk3QWhsTEJSeXVxOXZnejdmOXFjQ0hzdjY1OS9sY2d3ZlVWTytnSDN6?=
 =?utf-8?B?Z2Q2bjc0SkxjOFdQME9KYk1GTEdoUXdVaWF2WDYwSTF5S1g0MUlMQlBzbEk5?=
 =?utf-8?B?cW1WY2FOekR5Y2svUTd4dDZselM5eUVHR2FIN0Jqa0ZwQ1VVdzNUSWpzQzNo?=
 =?utf-8?B?R1hqNWxFRUh3cEZ5V054TGlXdmxqaVJTUmxLY2VBemRhOE01N3RML0dCcnRp?=
 =?utf-8?B?b1JkUzZOejFyT3A0cmkxV0tYWURlNTRNNWVjOTlKMzZlVENEM1Bka3lGWkkr?=
 =?utf-8?B?c0JPL2gzK3gwRkw5cWUwbHJNRWxvZlRpSUNtRUVHRXcrU3QwVDBQV0c2cHpa?=
 =?utf-8?B?RzhvVDdUZnhQaC81R2pPeHUxdHlsclNKSnBNTldTSlBpWGFjLzM5K0ZKZEY4?=
 =?utf-8?B?U2lNY2lEc2l0Qm5YOEZ3VS9tdHlnaHhTaHZpT3FNSVhoRWhzeEsza3k1LzJE?=
 =?utf-8?B?Wnp4L1p2dmxhZC9idFhxeElETTRPcXVXdFZpMWNIUk91c1MxcVhCY2N2c0E1?=
 =?utf-8?B?OEU3L3ZUVnRJRVdGMkNQMXY5dmdVTnZjNjhlZnlOSkJJVEJINlloM05oR3RT?=
 =?utf-8?B?QThZcDJ3SnpSajBid3FnV3RxNEQ4R3hpNHBhL1NXWTdIdGoxMGlZNi9DQ3NP?=
 =?utf-8?B?eWZLMkZzUUxqMGtVbXpWbFhzM0t4YTA4bzFORkROemFsT2RKS1h2U0taMS95?=
 =?utf-8?B?aW56ZzZxdzdHb3NNdGZyblpYaVV5WTJXeithbW1nWDQ1K0xTaU9tRjdTVk42?=
 =?utf-8?Q?si905wpf4iw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTdpekJCR0tTRkdMRmlQNnhjMTRkaDZqZnNWc3JQRVA5ZHRDNGNhZS9vYkQ1?=
 =?utf-8?B?TzhwaFRzOEFCWWJYaDV2alk2bklhU0V1eWxtS2VYZ0JGelFDK1JCai8rT29I?=
 =?utf-8?B?OXl5bVhFVThhcFpPSHJuWmluVHBOYVJYVXNReUk3bGpLK1Qvd2hCYmhaOWxz?=
 =?utf-8?B?U0FVa3Y1TDcyRnJpc1QxRTdEU3BIMEJQWlB2TmxncG14MFpTNzhXSThHUHVC?=
 =?utf-8?B?YmJsOWhXaE9jSUkrdjdGSnFscHQvZjZNWG1xVmNReVk2aXQ3N3E3ODV5Zi9I?=
 =?utf-8?B?REpXNURxU3pLU2lJUkcvWVgxNGYvMDNFb09kNVgxWEtESlE3a2JKZkNleXlp?=
 =?utf-8?B?WEhGdldMR3lsSVB5M2IwellxcHkwYlFNOVNYam5UcnNUZEcrZm5heFNNMkg0?=
 =?utf-8?B?Rnh6aEtiaGpWc3Q2SVBSMlpXRkVIYWxCNVpNMVIvSk4yL1ZrelFCQ21mdmxn?=
 =?utf-8?B?UHRaMU5QTUMzZU9HWUZBSnprQ0MrTTVReVdzQU9NN2JPY1R1dEM5YlJkZEpz?=
 =?utf-8?B?TldUdUxUNFN3MnB1VmZic2p0aVdJck1kMk9rTGNNaTRtMlBkaHlGWHJEL0Z1?=
 =?utf-8?B?SlNPaVRJcVZiYkVjMGREZzQ1TlloOFlialBxQmhsWWp6dWVrUDVTVlh4Nmgz?=
 =?utf-8?B?ZmtXNngrT1dTNWsvRXNuUExST24vbWg2eVYxTndHZmVMaUN2dGJ2MmVpRWsr?=
 =?utf-8?B?N0tScGF4VG1xVHdMRGZ2cW93WkRtd3kzTEN2cFZsYnJxRUpHWXhObzMyM3BH?=
 =?utf-8?B?WFd3dmZJME1pM2FLS2FHSE1jdXNEUzBCd0ZEUlF0b3pLc09ITE9ZNmhvTHpD?=
 =?utf-8?B?MmhoZDMzejl6SVZtU0YxSFU3OElBQjlDWjZIMzNETzRPS2VHK2d2UVRScHQ5?=
 =?utf-8?B?TnM1YjJKSS9DdjEyTnlmS1BDWUJHM2xRWlFrMmQzZTV1bStRakNWQ1h2dTlv?=
 =?utf-8?B?NkNDeGFwVEFDTU9mckh3VGNkZ0FDVWQrY2lWUlZxMVVuTWxHeXlmaE8yKzhk?=
 =?utf-8?B?OHVoUFkwMVZpd25COWlnK0t0SjVBRjFidVVRVldtSEZ2ZEtUVnlRQVR2NDZH?=
 =?utf-8?B?OTVnSlNtU2NJa1daUndoa05MRFFSV3BoQkxNTHVhTDdIajd5UnhRRUc4OXIw?=
 =?utf-8?B?SGM0VWRvbm1PbFdKSlNGcHBwRkJSRjhRcTBjUkZXb2tBNXFMdkhodjgwZmVC?=
 =?utf-8?B?dlpVUTBhVDlDSFJQZFZzNU1mK2k3UXFnOXJIekRzWHJmMThKanpmN0VWRG9X?=
 =?utf-8?B?bnVaQ3dhS1Q5OWNVb05QLzdKbG4ydW03MDErWC83S1ZzbkhmeWlHWUF3d1hv?=
 =?utf-8?B?WER3bXQxRnVpdFBKUHZqcVYxMmZHd3ZvM1VXYnorMzNGVTFhTmtpQ2xrdGlr?=
 =?utf-8?B?eS9tTHRtZEpZTHlnMHA1QnRTVWpjeExRRHB5RmEwMjBkalBhaW9iRjJCL2M0?=
 =?utf-8?B?Njg3TkhIWTFUdnVXVGlMaTdHY0Nuc2NsN2Z6NkRZMEhFbDNuTWZsWElWSm1I?=
 =?utf-8?B?UHRYYklZTGhqaFBMdEMvemtRMkNISVV3RFVkS3lCenFaVTJSb0VpSENLV0Jy?=
 =?utf-8?B?cFZJd2NpV0lKQ3owUy9XT3RGRUYvMEx4Q2tVaTBEakZQalZKK3FLeVV5c01Z?=
 =?utf-8?B?NVBBb21NbnZKdCtjMmJYUWVDNEVaVTRNblFMOU1rbThFbUtvY3gwWW91aU92?=
 =?utf-8?B?aXRFNTBMVCtqaVFKK2JSajlWQytwWjRQWTZSRDMvbWc3dE1Wa3VNaUlUOW5U?=
 =?utf-8?B?QzJRWFA3VFNobkl6ZytIZGxMK3krSnB2TnhoOUxaMzJpTmlDTVFVUGZ1Y3Rk?=
 =?utf-8?B?SnBVNUhhYnY1enV4dGhISzNNWnlOdzkybkZIeHVjTEh4VmovamdMb240SHc0?=
 =?utf-8?B?RFBtSG9KeVhoOGkvUUUzNThibmJIbnJPbVczaTFNckRhUkpnUnBsbkZwVGtV?=
 =?utf-8?B?WWR5TDhzdE9uSTh4UXEzZjdrV3h4YTdOVFRnR3VjbWVFVVVuaW96ZkNLNlFG?=
 =?utf-8?B?UTJNMG5EMzFSc0hRUGNxWjVWZHh5aktoWHE4bWNPZnNoRlEyVmJpN3JlMUZ5?=
 =?utf-8?B?OWx5bXRXRGZpU3V0bmNZR1piYWRvSXJuZnkwb294MXc5TFhQM0g3VXVhZ0lO?=
 =?utf-8?B?YnVRcUhlUFBVcFFYaFhhUUd6Wk1xWThOdm1ISzZmODhUd2dGN0VHUExkc2Ni?=
 =?utf-8?B?ZEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+H+MnG0MzlV28CfTZwtVBqeniqmbeAuuQEV1j/bIYC0VUrW0o1rUIyiOAAGrKt3wQWgnX7aAjAzRUmX8bMfyzpREmTJw04Y/FDrUlS0Ktu6E9cck8DMK/isG+pkVlQ4Vd9mHmOw1c8L6h2n8D+gIWqU7Ixlcv9EJcY68mNheTyCWJNl872+GHkvPkyaj/xs9anojfdvsggaW0p9UzfUwrUe712xRnf+lyomW3S0YtsgHnOVaZ1Ytb9CpX3YRrBNqB8LUbGQqd2Bq7ytwZCcvmKg6PiCnRoq6ProIZ79Tb16OsgtZ8ldEoihXHi1sujLmuUTaCgK9jo1HxN1uMv95HyAsMyuaK1Qw1ESVwJUTk8vrH/CamOrmqE0aCV9ADxXdVdTeuSg0GQQZCoZlNylz+50qp0G3qwfK0x828nwfEqH8CbMlGDtezgAKr6sjg5J8VQWcQPp64qA1pM9E/veiwztUtWGx3De0hM7W6XBQBhpiEEhKMl8ZnqbUL/58CxNwC/Rki9czIx97CRFe3JYjLR1v5uFzP55eyjcpQK6tcbi+R4ox+Zri/UjEPtAZMlYxpMkteDXom+OWbySTUNBKUaHwRSHceyJ0PA9YC3gwnnE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9188d4c6-3a6f-4c1d-293a-08ddec6e63f9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 11:21:42.4944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uNNJqs671MYZAjuv5Zr5Mjp5pVCBe6WUyMnyVG1/S8HHjeVw93AB9eBlmZF2VI7pDRRkxRQamugpxbfg/Q3mKk/PXXKCFDMfuSj8o5pM3Xg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6490
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=329 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2509050110
X-Authority-Analysis: v=2.4 cv=eJgTjGp1 c=1 sm=1 tr=0 ts=68bac7cd b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=k1SCJAmto4eHJbuJHFYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12069
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDEwNCBTYWx0ZWRfX5qv89sWPDMV1
 F57kCpQE+MwIistTZZ+4byOmmuI3AGNmtiZpQoLQW3ViSWY8KNxB93lIrEYu2C/dBuY85hpdA4P
 fTtZSdaCNqB2xE111Rc96P+xShPASgwjR3B6WTtvIm4FI15yrTJvb1dpzgNmPXo331PcS+R1UYK
 l4B+1iBYEpX4wUVJn3v2xPYagd75TkQsjm1SMj9vzpp3gqT9f1H7lFtvBFHiS4vR+xhBCByXJqn
 KSPEn0Q5urrdJ/9E1rf6bzuX3HuEx3fFS7JEoboCxwqsIfER4/XJtDsXEN3/AH/JsZG2QtB3noa
 Jsuhvrnd4MRGDHThKViSA57AKFTo4xHIXkqvSx7oRKHSySMnXS16a/X3KYlOhq1HjQJltzn8AAs
 0NkYTToq/U1ZWYMiHXPGRigZ5f3bsg==
X-Proofpoint-ORIG-GUID: gt5OMWPnzOu2BeR76CxwORufPMzOUA98
X-Proofpoint-GUID: gt5OMWPnzOu2BeR76CxwORufPMzOUA98

On Fri, Sep 05, 2025 at 12:14:39AM +0200, Kevin Brodsky wrote:
> On 04/09/2025 19:28, Lorenzo Stoakes wrote:
> > Hi Kevin,
> >
> > This is causing a build failure:
> >
> > In file included from ./include/linux/mm.h:31,
> >                  from mm/userfaultfd.c:8:
> > mm/userfaultfd.c: In function ‘move_present_ptes’:
> > ./include/linux/pgtable.h:247:41: error: statement with no effect [-Werror=unused-value]
> >   247 | #define arch_enter_lazy_mmu_mode()      (LAZY_MMU_DEFAULT)
> >       |                                         ^
> > mm/userfaultfd.c:1103:9: note: in expansion of macro ‘arch_enter_lazy_mmu_mode’
> >  1103 |         arch_enter_lazy_mmu_mode();
> >       |         ^~~~~~~~~~~~~~~~~~~~~~~~
> > ./include/linux/pgtable.h:248:54: error: expected expression before ‘)’ token
> >   248 | #define arch_leave_lazy_mmu_mode(state) ((void)(state))
> >       |                                                      ^
> > mm/userfaultfd.c:1141:9: note: in expansion of macro ‘arch_leave_lazy_mmu_mode’
> >  1141 |         arch_leave_lazy_mmu_mode();
> >       |         ^~~~~~~~~~~~~~~~~~~~~~~~
> >
> > It seems you haven't carefully checked call sites here, please do very
> > carefully recheck these - I see Yeoreum reported a mising kasan case, so I
> > suggest you just aggressively grep this + make sure you've covered all
> > bases :)
>
> I did check all call sites pretty carefully and of course build-tested,
> but my series is based on v6.17-rc4 - just like the calls Yeoreum
> mentioned, the issue is that those calls are in mm-stable but not in
> mainline :/ I suppose I should post a v2 rebased on mm-stable ASAP then?

You should really base on mm-new.

You need to account for everything that is potentially going to go
upstream. mm-stable is generally not actually populated all too well until
shortly before merge window anyway.

>
> - Kevin

Thanks, Lorenzo

