Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAAAC40A8C
	for <lists+xen-devel@lfdr.de>; Fri, 07 Nov 2025 16:47:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1157777.1486450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHOgl-0000jp-WB; Fri, 07 Nov 2025 15:47:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1157777.1486450; Fri, 07 Nov 2025 15:47:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHOgl-0000h8-TH; Fri, 07 Nov 2025 15:47:47 +0000
Received: by outflank-mailman (input) for mailman id 1157777;
 Fri, 07 Nov 2025 15:47:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qRNH=5P=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vHOgk-0000h2-SK
 for xen-devel@lists.xenproject.org; Fri, 07 Nov 2025 15:47:46 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a067bd3-bbf1-11f0-980a-7dc792cee155;
 Fri, 07 Nov 2025 16:47:44 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DB9PR03MB11025.eurprd03.prod.outlook.com (2603:10a6:10:5e0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 15:47:42 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 15:47:42 +0000
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
X-Inumbo-ID: 1a067bd3-bbf1-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aPm0BwzFmqeLjFd0+QQxaCYD8IGtuQ5thNXGzLJxy7c3J5M01HrHdV/3cIlPHIpdnf2EbzJcCdZGEvqYqPPf6bKc112TQ7UkSIdaDOyhNHg9uvSEP5PLVlk8LwJbBrDRRA8iEUFOJwSaz0w/qRzDUzOk/mQRYMRjyUr8gY06fQRFTe/+YkFkUcOEmVYriLH1xEhJkLCIJF98E30SnOt0ty3sj7lttBSqBsuMQDDzchYzVDpygpLR5WvyET6RbND/C88zXtVdeWQmgMd8xN5DneVkbVO7FmasI1jx2goO109LF5wR3bUm29qD8ZLOvp9fDxVC+bg8nLggGqltwPtNPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/wYgZ5ceYs3bI4jfU+7Qhn95e1/3T87DUOQUeA9mjhw=;
 b=Uke7G+gPib11Ayn3adzeXyIyRIwZNafm2neM4OAtUFbka6BrjUopwgII+N152JSg3n6Le4m+iNA2akcb4P+VUNl+1gE6cgT/A+EEYH/Eao3gJrtZJLqxPyzqEj4KcaZMqrvL7XZj0o0V6U/nArZ9qGqfiyCjbWL7WPpweHbyMatJ+qJ2zRdpcZ2tNthXY5UlDwJ4GXrlGTM+NCiWovoK9XVQQYuRzZ6NQAvU49Z3sluXic0zLer4ZIEglWUxr/UnjDu7CfbuKcA93JS00XGCM3dfTfQuyktfieQvHuUWvVoIvpuxAPIzUY7+HIo9o8dVx/iwk4XYYRyuvWTk0+n2rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/wYgZ5ceYs3bI4jfU+7Qhn95e1/3T87DUOQUeA9mjhw=;
 b=u6ugHFJI7pWyqGMmogZ3N/D5hNHRZRj3NrvKWFPMHHi5ybpxIhWJUC5STfwUOtCGbPCxJYyKQga50MLgFHsmW1J51fLwxFndq1dibeKNeyij2+ygVea5yh4zuCwCp1sk4U64kNpqes4bABN9GsW9pSWek7RvtBk1td/TrR7pBgH3OVAdfDYoFe6TvfelPORUjDUtJxCW4oMw4uwoZvhXYBjiMGqGrjPZyWLREl6488QdLWJ+p5MO7GTlY4bZLxn/ghrfl0oic8iNcZLIisrNUSkwzNHFRRaZBEhPaU7g2Et9M+tViOnFb+U3OC/TbIj/CJDxm2iGudjtcZlGkSO3Cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <acac87ba-5a5a-49d1-925a-8754f4a3179f@epam.com>
Date: Fri, 7 Nov 2025 17:47:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] xen: make VMTRACE support optional
To: Jan Beulich <jbeulich@suse.com>, Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Penny Zheng <Penny.Zheng@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251031212005.1338212-1-grygorii_strashko@epam.com>
 <b6337cb5-da85-492d-bba9-688e35695c46@suse.com>
 <e55f990a-1781-4651-a899-9d78bbbbdfd0@epam.com>
 <63525e6f-4e17-4155-87b2-47b9ac9ea474@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <63525e6f-4e17-4155-87b2-47b9ac9ea474@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0341.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::16) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|DB9PR03MB11025:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ffd12e0-2544-4d7e-ec16-08de1e14fcb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VWlpemYrcTFxWWR5dVF0NUZIb3Q1bjNsRmNJMWE3d0ttQ0tyTUk0aFhhcTgv?=
 =?utf-8?B?Zm5yK3AyK3phWTdzOWxuTW04WnVhYWJqUjJzVVFyOHAxSU1YL2pwL1ZUVENE?=
 =?utf-8?B?QXBtZC9MU3o2b1BqN1RSVG90VE45dkwwcldNU3QxcmRUK2pJTFE3TnU1RkhG?=
 =?utf-8?B?NXkzN0Y4dS85MGdWTE9vbDZJaEIrWE4wTGROOHkxNHV0TUZmVVJnZ0F5NE1s?=
 =?utf-8?B?WE11RTR3S0Z2NWNyaWljQlJZa2lZUjg1UXFXOFpLaWxiU0dXRENlbUpWY1d5?=
 =?utf-8?B?eVp4SUJQT1NmcWxWRjVRU0djb1VxWkowOVpKZmFVenVKVk45anF6cnJwNnI4?=
 =?utf-8?B?U3Z0QTRkK1hWT1dFZGMvd0RPMGxoYUZqelFZOThyN3o2UUkvMUkrVXVraVMx?=
 =?utf-8?B?bUEwcDcyRUs5OXE2UmxQeFhDdTBYRGwxSXFPTy9jamlRRHRzN3Vzb3NoY0d0?=
 =?utf-8?B?ZUovQmcyM0lQOGdRWndTb05URlVETmozOVJRbDI1d3Jqbmp1amR2Wm1neTQ2?=
 =?utf-8?B?ZU1PbXVKcmMrd2ZhQTQ4SmdNRGVIZ2drL1B4S1hNaG0zVEN5SEtnbGxxY0FP?=
 =?utf-8?B?WnQvOXlEOUdPaWRvYWVZYUN2d3ZhNGxVdUFBQ1NLMzZoQTFlcnpCMDR1SnRy?=
 =?utf-8?B?UzNXSU4rZjhUZnlDY2hGQlUvSk1FVml3aWxMT3RlVjBRQktBSlUyRm5GcWlZ?=
 =?utf-8?B?d1c3ZmdkQlhXaytJZ2g4LzB3OWVxc0FONXNGK3JrUnpQcVYwQlJ1cFBIbVkv?=
 =?utf-8?B?clpGa1FCS2ZyLy91ZmlVVmpDTmIvTVEyK01rY2RRVU81YmhLY2xmWENqai8v?=
 =?utf-8?B?TXNHbDFBeVhid3Fjd3prMXFBeWdGcmxldUowNVBPcTQyM0NFSDR6aUMrRXFB?=
 =?utf-8?B?TmNGc3NqMGUxUnVWd1BQQVBWL28wSWZIaWlVSENhSjdkUDVvVGhlUmtUL21l?=
 =?utf-8?B?a0puZDJFcytXNjVFTlJsNXlPQTRIVFNxTmJ4YzlyNlFWdkcwVkxRbGY2S2RC?=
 =?utf-8?B?RlJUVmZXY0w2M1EzMkZvektmeDFSM1BTOEU1Y2VlcGhZNXkrTFhwKzkzZW1Y?=
 =?utf-8?B?ZFYwR2F4dFlZN1lYRGcyYjZ1QVB2clBTL1VjcU96M083MHVZcnpGTG5EbmNO?=
 =?utf-8?B?VjJhN3ZFWW9MbDhiN3ozQTkvY3ZZM1pPZmljZVVhb2psY1ExL2taL1lDMGI4?=
 =?utf-8?B?QzYxTDg0c0JjTFAxVUhUYUhnVk1aMmVRSis0WXJ1RVN0WnFXVWxsdUtSanI1?=
 =?utf-8?B?cnA0Ym1aeCtmQlVUaU5EL2FOWTg3Und1YXBaVVFYVzN1RURGdjhDRnB6WlNt?=
 =?utf-8?B?aXFMNlpOM01nekc2bCtCalJxRndrNG9xNmlmckRIOGNTTlY1cVZUMHQwaGIv?=
 =?utf-8?B?eWhrVzF6U25BOENLaUZpdUVpMGZNdmZFV2dBUGc5dVVRNU9ZdHk4eFI4eVBH?=
 =?utf-8?B?bDV4S1BPVkdIQ3ZzNmtWVkNqMVVDWUxaZldiL1BqbVN1aThaN04vc2lyT1NU?=
 =?utf-8?B?WExHZWk5ZXdYTGVkaEgzTXZiS0NQOS9VcUhpN0dReW1JSnhTSDF3U0FpMkNM?=
 =?utf-8?B?WDRyWjA1ZDkwR3A3VDJKRG5PR0N3VWFaTEwxRVZZYW5BZnhRZzR0VzJYQXkw?=
 =?utf-8?B?YXhTVG5neFdUUkFCc3RSWVFEUnk5dDBBNEdZWUJ2MnQrQitLRnlTbUFQQXR5?=
 =?utf-8?B?bTNGWWlVY3VyR3hkUVVjM3AxWk9BSmxvdHlvL2RkTXU3bFpNZDJBWkVSL0k4?=
 =?utf-8?B?czdWdUh1NnJUNHV6YWw0d1dKSFY2V25oMERuaEtHdExySmU2WEpmczRBNlRV?=
 =?utf-8?B?bmJLWnJwZUE3LzlQQVNjeS9WNGFjY0FNUFA2OXNhVHp3MzBHa3ZSOGxHZDl1?=
 =?utf-8?B?c2tXdmEzK24wTWZYWE85M05TTVI5cHZqUFRnVjB3MVZuOFNPeVVSNEQ0K0Yy?=
 =?utf-8?B?U2JJQzdjcXB6ODN0Q3RiQjAzQjk5VlU0clpnWkNYUlV3K25peFRkSS9Hd05h?=
 =?utf-8?B?MzBBT0NIMGt3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUEvV01JbWlsSU8vVHJaNmVXaDVPZDlrVnloOEdvOGdWZWZ0VDQ5TS9xUkJM?=
 =?utf-8?B?M3ZraU1zVEhZc3VMa01DdlpCUitWTmlRVzkrK1BHWWNyOVd1Z3pOVGtqai9y?=
 =?utf-8?B?T0M0Q0IwR3BXTkZiUS9zSFFlSWcyVm5RNGFhVFRPWGpNa214ZlhGcnlZdkJL?=
 =?utf-8?B?ZFFXdVpzUWRKaTdJb2crdEhWanlKSERVKzlpNUlTNWZaWmZIbjY3THlCcG1K?=
 =?utf-8?B?VmRoeTdQaFFseEpOZHplUTZqaVM1Uyt1MFVwSFhZL1JjcW14Q2ZxRmtZUC95?=
 =?utf-8?B?OGVQdTllWlh3QTBXblo1T05TOWJPd2NxZ3VNTytMU1dYRTZYNVNNQ2k0TU5Q?=
 =?utf-8?B?OWxpTFdvTE1KNkttOW14R3pvQ0dJcHZWMnNLdHduK0pwdE9SUEJCbWFaQ1Rz?=
 =?utf-8?B?MmpScmNjNkRVSjk5ZnEwY0Q3TEpxU1RWcytmam5Mdkw2eGRXdll2ZGV6NU1L?=
 =?utf-8?B?ejJISVBjaGF0MW05WGxYeDY4cmtjM1Q1anZ2akhWV0lmd2RSdkkrTWpjVVBK?=
 =?utf-8?B?ZlpTQWNodDFlRjZWWTVBd1VtcFgxMVNHVng1L0xFQVFCTURwRFlWYVhWdVdh?=
 =?utf-8?B?ckRSM1dHZWhlM1RCTVNXa3N6VzdnWFhKYk1oNi9IUlI4QnRMR0RaYk1FUGRu?=
 =?utf-8?B?M1dFVlJHVTU2Vkg2Z3ZycEJ6WWtlQVNHcG9odW1pQitXalRUT3NNeEZzdzFX?=
 =?utf-8?B?MklOWWxZdWs1K090YnZ6VXA0b0QrMjJVaHdxYTBrUnd4K0t6a29LS0FVVEYy?=
 =?utf-8?B?K1EwQ01BN2hRRlNIMVJpTDNpalFkS1JLUDd6MHVSRCtsY2lQdGwzSCtIcWh5?=
 =?utf-8?B?dzVFbTMxUU1nWTdPWFJneFAzQkxWaXc5c0VzYzZIcGMzUC9nUEtMZlNweE83?=
 =?utf-8?B?bjRyUlE2amdrcTRhdkM2TGdkbzFQV3V5TnZVYUFYdEhZOG0zQm1SVW92QW9V?=
 =?utf-8?B?WTdpM1VhLzFac3BNbzdhTkI0K2EyU1hGZHdrZmk2QjRRVzMvQ0c2NHBFWGhD?=
 =?utf-8?B?S3diSCsyQTlGbWIwZ3pBb0x6d3NER0JpdVh2ZkhrSmwrYW11UXJXRDZ0Vld5?=
 =?utf-8?B?WDdMemh6MGl1LzlFS29mWWtwazJ3UXB6Q2lFU0hSUERneGs5SlBqdXNkZm55?=
 =?utf-8?B?UXdrYVNZRXRLenJnL3dqV3EzcmpNRHNBSENUTk5YNUJ4cHpsOGE3aTRDQU03?=
 =?utf-8?B?Yk16OTNjL2VhTmZDb01pTENLVHp4Wittc3llTDZaakxwemlqb2VpNWJ3YUhl?=
 =?utf-8?B?bzJ5WlQvK1g1a0VZUjdSWTF4djdXTWFZMjJFV01GbXV0R3JHaFVESjIvY0wz?=
 =?utf-8?B?M05sVnltSW5MTWVuQ2w2TDBJVkJ4U2ttc2RjWkZqa0g5blBieGxETWdPV0dT?=
 =?utf-8?B?RG1QZjNhQm1Lcm5yY2NyS1p2TGRMcUdxejFkY0dhald0aURtT3l0WG93TnRr?=
 =?utf-8?B?Rng5T0lwVG92T3FUSlNCTklXcmpZWWltM0MzLzNLSExLaE9naTFLZzdRS1VW?=
 =?utf-8?B?aEQ4R2g1bWZxTFdmVEUrM01HUnBYOUY5dzUvclRjc1VEQWgxRjdvNnVlVGxX?=
 =?utf-8?B?dkJINnM3ZWtnUFMvUnlTeW5rWW9PWjJNdU1VeklnVzZ1NXduTHpuSEhDYXhn?=
 =?utf-8?B?eEl1QU5BVHY1Rk5lYmdBbHN6NEcwNk9hMld6QnE1djYvQ3dadG5XaFJJNVRn?=
 =?utf-8?B?Rk1OQjNrMDBOSHM3UUlIV3NCaXViL0tlTGErOEdIclQyS21GZUJqMGdjOHBQ?=
 =?utf-8?B?M0JNM0pWMVJHbEhPenNFUVdObktYbHRHa2FUTU91eWN3QytITXdkL1JUSzRa?=
 =?utf-8?B?T0JZMDdLUW1KZ3ZVNWZHQzFuWXlPOEZMRkU5UnpnL29VT1RvRVhPOEtLVnhi?=
 =?utf-8?B?Qyt4anRSTTJQd3hWSVptSG0yanVjQ3FNT1h3OVJ5VWxybmFZcG5abThrallx?=
 =?utf-8?B?YXN1ODlodWVDTVdtRmljVEJBMzIrYmZqS210RWtsSm9BVnAzaEF2a3lseGo1?=
 =?utf-8?B?aEhMYlpJaTdWdDVuK1NZaFovQSs3RWg5QjkzdEFLYUxiVWp4WTIzK0xkaHZp?=
 =?utf-8?B?dUJsdm5qWW81U2x3VDVHRTNZeFpQaVRWZ1Z3ZnE0RTY1Rzd5b01uYnQyeFdS?=
 =?utf-8?B?bElTa3lnZHBzc0J2TFpTR2Fnbm4vMFMzUEFZSFBUcFh5WHlEb2wwSHRuNXVC?=
 =?utf-8?B?N1E9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ffd12e0-2544-4d7e-ec16-08de1e14fcb2
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 15:47:42.2304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pU6//0PzLW1VH0dXG1eRSPZYERL9Mp1mBBnQNsuuCmhFybhR2A+hmCxZOljihNRC0L+m/wtR8F/bdxWANlgpZGbwWC/MltrgGXhAYuDckRA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB11025

Hi

On 06.11.25 16:09, Jan Beulich wrote:
> On 06.11.2025 14:50, Grygorii Strashko wrote:
>> On 06.11.25 14:00, Jan Beulich wrote:
>>> On 31.10.2025 22:20, Grygorii Strashko wrote:
>>>> --- a/xen/Kconfig.debug
>>>> +++ b/xen/Kconfig.debug
>>>> @@ -155,4 +155,19 @@ config DEBUG_INFO
>>>>    	  "make install-xen" for installing xen.efi, stripping needs to be
>>>>    	  done outside the Xen build environment).
>>>>    
>>>> +config HAS_VMTRACE
>>>> +    bool
>>>> +
>>>> +config VMTRACE
>>>> +    bool "HW VM tracing support"
>>>> +    depends on HAS_VMTRACE
>>>> +    default y
>>>> +    help
>>>> +      Enables HW VM tracing support which allows to configure HW processor
>>>> +      features (vmtrace_op) to enable capturing information about software
>>>> +      execution using dedicated hardware facilities with minimal interference
>>>> +      to the software being traced. The trace date can be retrieved using buffer
>>>
>>> Nit: s/date/data/
>>>
>>>> +      shared between Xen and domain
>>>> +      (see XENMEM_acquire_resource(XENMEM_resource_vmtrace_buf)).
>>>> +
>>>
>>> I was actually meaning to ask that "VMX only" should somehow be mentioned here,
>>> but then I noticed this is an arch-independent location.
>>
>> Right, Arch code advertise VMTRACE support with HAS_VMTRACE.
>> In this particular case:
>> config INTEL_VMX
>> ...
>> 	select HAS_VMTRACE
>>
>>
>>> I'm not quite sure we want it like this (just yet).
>>
>> ?
> 
> To rephrase the question: Are we expecting anything other than VMX to support
> VMTRACE any time soon?
> 

That's I do not know.

I assume your point is similar to what Teddy noted [1].

I think vmtrace code can be consolidate, but question is on what level(s):

only:
  xen/arch/x86/hvm/vmx/
  |- vmtrace.c

or:
  xen/arch/x86/hvm
  |- vmtrace.c
     <- vmtrace_alloc/free_buffer(), acquire_vmtrace_buf(), do_vmtrace_op()
  xen/arch/x86/hvm/vmx/
  |- vmtrace.c

it will require more work comparing to the current change.

[1] https://patchwork.kernel.org/comment/26637627/

-- 
Best regards,
-grygorii


