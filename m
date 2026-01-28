Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJ6dBonSeWlCzwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 10:10:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 745E19EA88
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 10:10:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215293.1525503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl1Z3-00016B-Vf; Wed, 28 Jan 2026 09:10:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215293.1525503; Wed, 28 Jan 2026 09:10:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl1Z3-00014I-Sj; Wed, 28 Jan 2026 09:10:17 +0000
Received: by outflank-mailman (input) for mailman id 1215293;
 Wed, 28 Jan 2026 09:10:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m4J3=AB=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vl1Z2-000146-9m
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 09:10:16 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27f3e346-fc29-11f0-b160-2bf370ae4941;
 Wed, 28 Jan 2026 10:10:15 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS0PR03MB7558.namprd03.prod.outlook.com (2603:10b6:8:203::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 09:10:12 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 09:10:12 +0000
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
X-Inumbo-ID: 27f3e346-fc29-11f0-b160-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sx+bpLx5cOKDyvMJ6R067Tth54Y7hHhph2h2IbBXose66yflkB8ePVXjqv33r53d1H5oUKMdjLAA9bZUHNPg3F/34/SckwgwiAKiXatA8YxxSYj0IZv0X8b6jeKBuZpEGWItHRmXvT9AB/J25YgARF7GK+NCFTANe6LUsgtvO8eb5tJ/cVi+wF+v+LK3LA783LwdaeOL+NdtxtuwDKFEv9uaffTR4OKcaV49q4hc8JDtujUwDx6pqX4u8wIgTSUjoFuaRgvUydGRYrR9XdOUx+UfpSmMpGmUV7eHql2wyFCKgIwWoJYnJz3/MvU5De5SAkfcTOAGPPmk4FAVktHxQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=54vf6Bq93w0LFu6OqkxOXei4nsBbddB8cIhtbTU/yF8=;
 b=TcXm0zz68xG0JH/oqT7OQ8N5ozVTJSQjmDa3X9V/DqAZ7xRN0EwpCVfMMEOBIMpggLkb7TkNMtPOL8AQsqR5CXP6IT38R1Glg/v01gQttsm8OPlGV8q/m+MLGRvsEtwal+mDJ6GgEVdUo9Anfbk0zeMej2lA4ZYPbY978XutEy4UtgYF1XxdlZutmStve7Hh0aL1d/qPFNF5u0wePInmeMO0oSxqKcr1DSkSbUex1ga/KTH6pLB454FCFkZlwF243Osb/NB9ks6PKXypY8MG+Zx2wHLY7BqT753q7gT1GrA0QkewlNOlOM8pj/HpostBW9O3is9zNxO215femLq99g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=54vf6Bq93w0LFu6OqkxOXei4nsBbddB8cIhtbTU/yF8=;
 b=ZDulOWa47JyNp6lX/BLBW0wniS2JD/E3uRakX7XAIw4Y5GjkD5vkKwghZLuJHBGDiiJxCFXmZDZ8Oosr8Xc8nWnVMafve/JMr9TA+08wsSPHbBHWKqhqsqRhv6LHPPCONmMNlS+jc6DrYfpsWyhAgWvOq+L7S0bsDDD2j94KPhI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 28 Jan 2026 10:10:08 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Christoph Hellwig <hch@lst.de>
Cc: xen-devel@lists.xenproject.org, Jens Axboe <axboe@kernel.dk>,
	Keith Busch <kbusch@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sagi Grimberg <sagi@grimberg.me>
Subject: Re: [PATCH] nvme-pci: fix parameter order in nvme_free_sgls() call
Message-ID: <aXnScGiFkX7ZFFdE@Mac.lan>
References: <20260127195907.34563-1-roger.pau@citrix.com>
 <20260128084958.GB9373@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260128084958.GB9373@lst.de>
X-ClientProxiedBy: MA3P292CA0035.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:46::14) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS0PR03MB7558:EE_
X-MS-Office365-Filtering-Correlation-Id: b9ee5224-fd74-4439-9f8f-08de5e4d0abe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q29kZ2x1SW0yb2FKSHduZVJxZEtLMkNWY2hNOGttTkFUSzR3dXlsNEZCSWZ0?=
 =?utf-8?B?MzZwVUFrMVlhR0p2NWR6MENxZW5hdEtuWW9iNncxK0JUaTRrY2diSFM3ZGhi?=
 =?utf-8?B?UkNwSDRYa2xJeStyTGtzb2d5bG9KOXZqSzVRbGZ0RjdhbkhEVStXbW90MFRj?=
 =?utf-8?B?SXRaT2o4b0Nka3VobFlmUit0cG16RTFmaklkekQ2bERyNnFiUXhYeFNzWlZV?=
 =?utf-8?B?Tit4eUV6amUvdzk3NHZuVTB3Q3NkZWlKcFNkVVFtVFg2ZDNnbVJ5eVR4SW9J?=
 =?utf-8?B?OU4xcFJhQVV4YlhESWtJdWhJekxtU2kvaVJkOVJHcjVkbUNVS0E3QVV0dWtE?=
 =?utf-8?B?UzFWTzNjRngwWWhEZlNodHZGTjFSYXB2SUNSbjlVeE4xZnNvM0E3M2x1SlVl?=
 =?utf-8?B?cEJoTXNGUzBvMmg0d0dPWU5NWkpJOE9SeVRuYnpEak40bm5vVUoyZnlHTzBG?=
 =?utf-8?B?akFEbVNGYkc2WXVPUldZUlpDa2swRUZLYlRvVlNWVUh5YjVSOUdhMkRVaE9s?=
 =?utf-8?B?eGVaWHNrS1h0TTBOR3RSYzJDdVBIdStLQldZUjUxbzgzNy9zTGp6OFR4ZThh?=
 =?utf-8?B?b0Mrc1ZOU2c2My9ya0RacDdIa0lkSW5NcWtmeTlLM0FIYUhMSHVsSFgzYjM1?=
 =?utf-8?B?QW1leXFqNk1mTTdtOWdHUWlFcGpqTE5DQURlaFlPaEZyd0lQNUh5a05jbjZy?=
 =?utf-8?B?TFYvTlRhWjJoWHl6eDRmTC8zOE1vOC9LSzJPdkdxWVRGYnBhZHJXaTcxVk9I?=
 =?utf-8?B?b245VE5kbmJIc3ZPWFUxWVVqdy9tQWZLM3JEVXFoWmR6MXVpUThMVVpRVlV5?=
 =?utf-8?B?eEp0WkFoNzdrK2NnNTVrOUVnUWFxYmlpZVUxR1R3VmRqa3hmMXAzNHRrS1BW?=
 =?utf-8?B?ZE9PRko3Rml6WjRsM2x5cFNqREl0aWJNbjJzMTZzMHJ0Y25NUCtNSWlCS2hH?=
 =?utf-8?B?aUhUd0QwNnRFL2diSjRnTmFzaldPQVMwVFNSSmhiUWgrYXR1dUIxNG1icThG?=
 =?utf-8?B?c0ZCWDhDVFlTYzIxYThBZDc0ZGZLbThJdWU3QWw0RUZXbjErMTBBYW50R0VP?=
 =?utf-8?B?cnNycXlwZkN4UFJCcjlnRHFVL1ZsQ2ltTFZUNEx5QnN6R21PSi9DRjA5dTBG?=
 =?utf-8?B?c1prOFVrbFFmelkrOVdFYXVNMWUxQWVuK1FkYXhrNExGOG1jSmRKR0svVzly?=
 =?utf-8?B?K1BOc1VDTVZ4Y3lpWVRPRkZ0VTY2S2dmNTFBUnZ4VGlSVUFLYzYxT2NNdisy?=
 =?utf-8?B?b3pKRnV6eFUwdWh4THZ4L2pFSHdubWhjL09ldzQ3RTdMY2I0YVZYVVpLQ3ZB?=
 =?utf-8?B?TGJSL1k4WitKdE5laGFCVENFZUdITnBBNDYzRmlWNmtEY2h6bHNzcFlHa3ZV?=
 =?utf-8?B?UzZwYmlNQ21DTUZnNDk2Y1hEUmZXeXpmd25Za2pNNHh1RnRqNlYxRGl3SGdp?=
 =?utf-8?B?c1RDWjdVaHZrZnR1ME5pWE05UVNyWHlMUGZGcDlkWXJuY3N5QXRFR2E4QzF3?=
 =?utf-8?B?eXZBN2hqait6WUFkWEZ3YjJWRUh4dE5veG45aGIwV0x4WThuVnhoMWovNWJY?=
 =?utf-8?B?NWdSbkJtb3dPWUJ6NFlYNXh2MlREZVYyK1JtZWVjVG00NXFmL1pSNUpjMVhQ?=
 =?utf-8?B?MzA2UVFURlMveXN4cDI0Rlh0QjlGMmV5Y1hBbXYvYnVZRlh2RnNESDg3d1hu?=
 =?utf-8?B?MmpsZDdVWkEvOVo3aVh5QkVYWVlUYVhiKzkvNWFsVit2QVhjemZvRTBVV1Z0?=
 =?utf-8?B?Zk51aHlEMUxmQ3NDNVBxd3BmQnZ2TWNDQzNIWFdZTTRZNFltRWJJNldxY3hI?=
 =?utf-8?B?WE82MGRMTS9lVDYwYnoyL1cxbG01ZytwN1p3UGx2M25ZWUVhS2N5NWpQMFZT?=
 =?utf-8?B?K2I3c3ZkL21LNk9nYzhNd09aSHVjUkdDemhtM0lFZUpVdEI4cVIwVElWKzM0?=
 =?utf-8?B?Nmw1TnFQaGZzc2Q5Q3JvZGxRTWdWYVQzV0E2c1JhTEdnQy9Gc2lIRllLaEJn?=
 =?utf-8?B?REZ2dTFsaWpPTGpITVFycU5ib1VlUnIvN09hczArTkJlUVJ4bkIrMGJ3OHAz?=
 =?utf-8?B?djRCc1F5SzR6djEwcXRURVZqNGExSU40UTdOSEFTVnJiTzB2Q2I1cG5ka3VE?=
 =?utf-8?Q?RZNc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGFYaFFzblEwcnk1cHpmWUU1Ymo4Vnh6ZzZuQVQ0VGRxellGUEJIZXovcU9q?=
 =?utf-8?B?OGd4MjJVY1hIam5TMWR6eWUrQllOUS9obmxMRmRSYlNtdGRmZGNLQ0NuZG9L?=
 =?utf-8?B?MG5hV3Bwc3QxRFU2aVJvN2VKZWVtN2EwR1VFaVV0S1lPUmdscHN5b0IwUlJX?=
 =?utf-8?B?WEJ5TkM5eVB1UmxZZ3AxbUdpeXJ5K2tOQ1Z5S2JtVHBYNVR4Ly9BcXQ0TVc3?=
 =?utf-8?B?OUNTbnZsU1BWYXZPL1BoWVhqZ3Z4NmtMZUJ2OCtKL0JydTBiSkNSdEtLUXNM?=
 =?utf-8?B?UkdLQWRlRXhGWEpXeFJrMzBWRDlqTm40SkR6UmdFSmpNdXVxWnBoMjhEMS9K?=
 =?utf-8?B?U2VuSkZqdzVXcXloMVhoREIwRVFySmd4REY5Sm1ZbDlYWWYwemx5bzlsOXgx?=
 =?utf-8?B?M1hSbnR2TzVMRzNmZVFVdFJxZXNWZTY0RmpkOFdRdVYyMWxrNHBjOElBOUJx?=
 =?utf-8?B?b2M3aUQ0eHlzNytuazhoVWdKYTBVTkt5eC9wRmNzNHA3QU5MUEhwR1NSWklF?=
 =?utf-8?B?OEtsZkZhem9PNVc1Q1lhaFpvbGV4VnRUYTFXeUpXbjR3TWhhV0wwVlVNS0Jy?=
 =?utf-8?B?UGw2eVEvYjkrbGtQN0FjVTdyRDFpZHRMUXVOS05aRDRxSnB5L2orcjZaTUQw?=
 =?utf-8?B?cTVWejJ3d2Q5S3lRVXlzSVNyZmhBVzcwTzVMODZZMXVMVnFhQzgxQlNWekRP?=
 =?utf-8?B?ZmlaY3U2UGxpV1o3S2kwM2RNWnk0ZStlOEFVRWdJK3c1czhDOUJMaldaVGJh?=
 =?utf-8?B?ME8rWnl4MUlON2IxcWpSWlFPZlQzRnBUbW43TnhUSTZIc0YzdDNTWjFLNHNW?=
 =?utf-8?B?ck1oTnd4YmJ0eThiZDF5a0hSUS9BWEJQaUxqVjJWb2ErSGZ5U1pNU0dRS2Zh?=
 =?utf-8?B?OXBVclU5dElJQXVpc0puT2NpM3B3a0hPRUl2RjFXZlFxd25TNUxPRUJrUTJD?=
 =?utf-8?B?ODBta09aQk1sWFZDKzQrT3ZzcWQwSzVSY3c3ZnI1UzFSdG9JdDJaZGVadU5p?=
 =?utf-8?B?M1RRSitLaTFJK2NsaDJuTlh1MFdETW84S3ZWbSt6SlhHQUI0UTZITVNobkJR?=
 =?utf-8?B?ZkVrblN6aEZNUk05aWtTUFVlZ3RxNDZIa2VyS3EraWpFUGJmWlI2QUVLSlJr?=
 =?utf-8?B?ekZTOVZOaVFReHdMVWxKYzV5R1FRcjFUSVkraDN4akVNTVNoM2YvYkhCbWFi?=
 =?utf-8?B?SWpJcDlLZ05IVGZ3RXcrS3JHaTFQU3lUVkVUelVEWGRhWkJBcmpBNVljWXRt?=
 =?utf-8?B?REgzT2tEYmxENmw4NFFSb0lmbVB4aEI3ZXpYWGtJM1VTN2JuU1ZpYmQxL0h4?=
 =?utf-8?B?Z1NXcGVJNlg3T1pUSWpWVGtQYlhRZUJOY2lheTFMbkRhTU1UK1hLZGZPSCtk?=
 =?utf-8?B?anFJOWFSNEFlQVNYQmdrM0dVVTNjMFhWQVpySG40Qk1ZUGRjVzV1UHRWbEFR?=
 =?utf-8?B?aGxEdU0xZldnd2xwTU9WbG1aRCsyNlJudVdwWDZ3SXF2OFF2bUdyNC9yL015?=
 =?utf-8?B?SDBKS0hkWU9mYVRsalFQN1RoamdzQVQrVGF6cURvbnBsWUY2R1ZPZHc2TUF2?=
 =?utf-8?B?OEFZb0ZjSEt1WWJaTVpDVDNvN3FPbjN3d1psOXpndFR3My9pOEEyY2FIb1BK?=
 =?utf-8?B?TU1DUXo0eW9UcE5CZDU2SWh4VDdkNTgrcUthSWdpNkVhVzFVZnEwdFo0SS9l?=
 =?utf-8?B?OEpVSDlRRlhaL1JFRi9yQ0IvSGZDSUFVK0lBcmdRLy80c29EYTJXZWpkWFFY?=
 =?utf-8?B?clhVWjBmSWFEYzRIamo1UnVaSDcrQkJYV2FLaHVmaXJDY3dXYU9oeUJSeG42?=
 =?utf-8?B?V0VwMHFwK0k1RWpuNFpIWXIrUzgxb3VOb3BLMjYybXFPY3d2bDArd3dwYkVX?=
 =?utf-8?B?SUdncWJWMEkvSXVQM2owTm9xa2U5d1dveVNWMTBJejhOeUVoWWM3eUlzMFgz?=
 =?utf-8?B?U0tkTXNqUVl5emJ2RGdQTEdIZWxtbFNKOVFEQUJpUFFrajZHRFNpR0I0VFB4?=
 =?utf-8?B?R3pHSmEvWFFieXBlQXNFNTN2NWl4cW8yWTN6SjFzTW5Hbk0rSGpWSnREallX?=
 =?utf-8?B?Tmh4RzFNemRRWXpYOXpkZ0NEb2EzbTNVUDR3VE51S2UrMXJaZStTdDhwTUcv?=
 =?utf-8?B?NE1GNHA3QVQyMFdDelJHTHVmNGFTVkVvRkNCVGFzTkxVNUx4OHY3eHdNekVQ?=
 =?utf-8?B?UEdYSnBLbk1hUVZ0ZjdORGV0UHlhWEtaZDdvRWYvTDdYN0cyWVVQbUxVdXBJ?=
 =?utf-8?B?RjJ0d05yamcrTEpHWE5FS3JvbXR3U3ZUWEtVV1pBV25PdXZtSlR6NmJJK04w?=
 =?utf-8?B?RzFFRVgxSkFwS2xsZkZOc0tpM2ZIWW0ydmJzUFVaemZUUTNDM0dmUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9ee5224-fd74-4439-9f8f-08de5e4d0abe
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 09:10:12.1095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JVgh4dCfdkMoNHc53BfK6np+aaoScEL6cElEF/M8cp2IUHVbmfr1HSaQAvD59JgRMtWYH72VMPdi37KSqIs40A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7558
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Mac.lan:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:xen-devel@lists.xenproject.org,m:axboe@kernel.dk,m:kbusch@kernel.org,m:martin.petersen@oracle.com,m:linux-nvme@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:sagi@grimberg.me,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 745E19EA88
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 09:49:58AM +0100, Christoph Hellwig wrote:
> On Tue, Jan 27, 2026 at 08:59:06PM +0100, Roger Pau Monne wrote:
> > The call to nvme_free_sgls() in nvme_unmap_data() has the sg_list and sge
> > parameters swapped.  This wasn't noticed by the compiler because both share
> > the same type.  On a Xen PV hardware domain, and possibly any other
> > architectures that takes that path, this leads to corruption of the NVMe
> > contents.
> > 
> > Fixes: f0887e2a52d4 ("nvme-pci: create common sgl unmapping helper")
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > If possible it would be good for this to go in 6.19.0-rc8, as corruption of
> > the root device as part of a kernel update is unexpected. Sadly 6.18
> > already contained this issue, and no-one noticed, so its impact is limited?
> 
> This only affects non-IOMMU paths with a non-noop dma_unmap_phys.
> So it is a very common setup, but very severe for those.  Because of

Do you mean a "not very common setup"?  Otherwise I can't parse the
sentence.

> that we should get into 6.19-rc and -stable ASAP.
> 
> The fix looks good:
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Thanks.

> but maybe we can reword the subject to sound less harmless, e.g.:
> 
> nvme-pci: DMA unmap the correct regions in nvme_free_sgls

Fine with me.  I think I was more focused on describing the logical
change rather that the actual effect of it.  Can you adjust it when
picking up?

Regards, Roger.

