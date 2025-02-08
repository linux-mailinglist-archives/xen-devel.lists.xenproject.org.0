Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAA0A2D884
	for <lists+xen-devel@lfdr.de>; Sat,  8 Feb 2025 21:16:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884355.1294091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgrFV-0001LV-Ed; Sat, 08 Feb 2025 20:16:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884355.1294091; Sat, 08 Feb 2025 20:16:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgrFV-0001Jb-BM; Sat, 08 Feb 2025 20:16:21 +0000
Received: by outflank-mailman (input) for mailman id 884355;
 Sat, 08 Feb 2025 20:16:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tTAN=U7=oracle.com=harshit.m.mogalapalli@srs-se1.protection.inumbo.net>)
 id 1tgrFT-0001JV-QT
 for xen-devel@lists.xenproject.org; Sat, 08 Feb 2025 20:16:20 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c74d5de-e659-11ef-b3ef-695165c68f79;
 Sat, 08 Feb 2025 21:16:16 +0100 (CET)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 518AOwAk024054;
 Sat, 8 Feb 2025 20:15:53 GMT
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44p0qygfdh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 08 Feb 2025 20:15:52 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 518GA1Xj038637; Sat, 8 Feb 2025 20:15:51 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 44p62vfnv9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 08 Feb 2025 20:15:51 +0000
Received: from DM4PR10MB6886.namprd10.prod.outlook.com (2603:10b6:8:102::10)
 by CO1PR10MB4642.namprd10.prod.outlook.com (2603:10b6:303:6f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Sat, 8 Feb
 2025 20:15:49 +0000
Received: from DM4PR10MB6886.namprd10.prod.outlook.com
 ([fe80::bdcc:98f5:ebd5:cd38]) by DM4PR10MB6886.namprd10.prod.outlook.com
 ([fe80::bdcc:98f5:ebd5:cd38%5]) with mapi id 15.20.8422.009; Sat, 8 Feb 2025
 20:15:48 +0000
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
X-Inumbo-ID: 8c74d5de-e659-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=oE+9PwquN9B7Pq/uphxY5yyU0nI8ATR6xwOkdtQgt3s=; b=
	LN57C5ZxXd1yq0qcb5f3XZfkSeei0e4EysfUVn+ICMxxNBJmhH81EYbTyu3hpxYt
	hz12rgeJECc1OiQx/aNeehkLCuyuMRKtVHSd6tkifBhRVHAC7KjBkNY3ixEKTRNP
	gfQwkFEcbEcDzWOhXgRsfwAUhcSiDisLitv3GsV7lqYplOU2NnFuk6DJOkdSc+VM
	4nQwzqgVL0YRqIM6ASRfGEBqOD0aMIc9LEAq+K23ocx5ggSVD2frxYZHeRw2Nr87
	fa6UPAzCfqP1AzQT2XTl1IJMFFoKHJlE0VeMwutpuU8KYWtByus9LcT5PCzjgmgt
	jnKUU1oV8rixqRwS4li/FA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SG+CDtrgPMtZKkSxqO2Ecxg6WaNlyC1GqAWFqBkIZdsEL/tIKt1aDtbMufX9rFcj9kAB1LuzY6sLKcv/DwCjF94bybvNh8vPZYwg7oSj1K96c2w/D9U+yOg0NXq1wRJ2IP5KafyF6MDeJ5eulc4SxTvXs1EyqRXb4ifHyxDoajPfxkRUTKmi+KEFkC7OmohwxJ6NT70skPiF8UHJslTYWCsqp74LnTPNhZ8KW0Y1/fMZbqKPzj7keVlYK1gre/ldzCfuOMZZAxdDv9I70yRvCGATKMeLSnnNATtiXZLae/v0XzeuUp+KPN5CVsyIK0skWqBxAsm8vaSJKfk5Pe5Yqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oE+9PwquN9B7Pq/uphxY5yyU0nI8ATR6xwOkdtQgt3s=;
 b=pfv+7hC40rRX70nP0bX26+uCT30WUGDWKqZiA/GqVnsFFu6CjU5YF1QBs/jFobhI/1w3WcNqPONlwpJW5ofX3J19zCxYDHpr8mvWnC9GYxJ1sSigNIDxWeuDkNUcRnU0tnxwM2cSuRkmgNCr+5scK+pGSCTkKU+h39f2wyKj63NBuOTuwbOYKcY8+GwaVQzsOyV3YIjgmcbOSu8MQrK4zaAYPaKMWeN2RZ92cNl41taObEmHLdHdXgLca8mn/YroNX7j4mLwLYh2FWIhshQZt7y033LWX1zQNPvHfu1QAg2NrWnFpFdWbJG8aGfzQd/g2kuGgHVKFcIMsKwBRAD3bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oE+9PwquN9B7Pq/uphxY5yyU0nI8ATR6xwOkdtQgt3s=;
 b=JrkP1ybyqxH4OvrvCtSKUZ59fI0uRACuKWQNeCcnTFYD6gC2cPfNab3sua3t+pBuKik74Fqzlek83BkjbG6CMCkQJwrF3k++yoG79CEL3E87m8HwBxsflA2zZjzE46y0XYwpmihv6yqbJd8SyY7sfIT5DK+nacuTAB2AHU7vvn8=
Message-ID: <fd650c88-9888-46bc-a448-9c1ddcf2b066@oracle.com>
Date: Sun, 9 Feb 2025 01:45:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [6.1.y] Regression from b1e6e80a1b42 ("xen/swiotlb: add alignment
 check for dma buffers") when booting with Xen and mpt3sas_cm0 _scsih_probe
 failures
To: Salvatore Bonaccorso <carnil@debian.org>, Juergen Gross
 <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Sasha Levin <sashal@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        xen-devel@lists.xenproject.org, iommu@lists.linux.dev,
        =?UTF-8?Q?Radoslav_Bod=C3=B3?= <radoslav.bodo@igalileo.cz>
Cc: regressions@lists.linux.dev, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Harshvardhan Jha <harshvardhan.j.jha@oracle.com>
References: <Z6d-l2nCO1mB4_wx@eldamar.lan>
Content-Language: en-US
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
In-Reply-To: <Z6d-l2nCO1mB4_wx@eldamar.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0138.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::18) To DM4PR10MB6886.namprd10.prod.outlook.com
 (2603:10b6:8:102::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB6886:EE_|CO1PR10MB4642:EE_
X-MS-Office365-Filtering-Correlation-Id: 49285b00-cffa-4ada-c51b-08dd487d609b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UWlDWllJbGNld2lvVzRHVXpDM1VCTFJjcW9RMXd3aGhVclllcjlRSW5UL1J3?=
 =?utf-8?B?VDFZSTFXUFRHVk5GVGVKbEg5c0RDK2VjYndZNGZXN3hiYU1odC8wc2ZySExN?=
 =?utf-8?B?QUVjdS9yOGRMYkRTWjN6VjdHbm5xU01mNXkyZ0tvd0RST0ZFcWN3b3ZNNjZF?=
 =?utf-8?B?TTY0NDZOQ1VybTdvajZvd1E1OTZUbVVrRnJTcFBuYnRwSzZuOVVsdm13alRV?=
 =?utf-8?B?VElJa1JzV2dEdjU5cHpEdkQvRnd1a2NNL1BKbmRFOXMrU1hLeXdyZTlhVWk4?=
 =?utf-8?B?dzJlaDg4WHowYlFRV0hUcUtsMnhDdFpkRmdNZnJadFR3b1NmTFNKbXJLLzd1?=
 =?utf-8?B?M3J4L1RQZ2xMVFFVaGJrbHhUVS93Q2phOTJ2REFZM0tGaXBOVzQ5SDJVaVhD?=
 =?utf-8?B?WkxNRCtWNFRiL0VjMTJjRko3T3ZDdU1rWnRmYjVBUSs3NW1oYms5aTNtRThn?=
 =?utf-8?B?Y1NpcG9VQTVJT2VFODdkVTZrUm0yNlpGbkZESzBUVHhmS3VSVUJBZGtwUjdp?=
 =?utf-8?B?cUxEajFEOEpxVXY3ZGszNVR1UjVUQ2VPZFJraDF5Q2hvemM2RUhwOFJDNDRi?=
 =?utf-8?B?MGwrdUcvTXl4WkVGSjZ1RjRkMWR2WWtROHU3YzZVSlZKN1cxdVp6L2JNT2F2?=
 =?utf-8?B?TWdQbDcxN3JGOStSc1ovK2FZN1ZYUTNXd3lCWlNneGNZYVhmLzcxT1E1ejNj?=
 =?utf-8?B?L3JPSjlDVXVycVhZdk5iMkhQLzFXN1ppRk1COEs1MEZ2bzFPaWVKd2ZubHZs?=
 =?utf-8?B?V01SRlRBall6Rnl4UEJSdlE0a2k0YW92N2dTc0pTUjUxOExoTzYyL3FxWEJB?=
 =?utf-8?B?TDJNTVVUWDRzWEd4cDFrajNFMGR5c1BOOUxncWhrRTY1VjVMNUZvN0tPK1RU?=
 =?utf-8?B?bzIrL253YnNxK1VoQTdvVXkva0MxUFNvdU5Mc3AyRkhNMlkwYW1uOUFhQXhu?=
 =?utf-8?B?NTQxem5zOHd1cXBrWU4yb29rZlhVZEdBL05xQkp4OEtwWWtoTTlZN3RoQ0t2?=
 =?utf-8?B?Ynk5UlF1UXhydithT1hTVitLeC9keXZhZjVEcUwwRHZ4bUVHUjVXTitjUUg3?=
 =?utf-8?B?S1NxektlQ2VOQlRnKzBMaVUyQzBmMFRJYWxKVGpLVWhjTkh5NndCNG5xQkhY?=
 =?utf-8?B?UnZSUWVFblJBWFBzUmljdjFNaG5aRmx6SFZsa1k2K0VKbEtab2lZUkJnWWJE?=
 =?utf-8?B?UGcraHV5Qmc5MTlMeHcvM1BRUTNXL0RhRmd6NHdXODl4YTg5S1VkVGl0K0xD?=
 =?utf-8?B?aDZtd1RtTWdJWmYrMUlKQ0VoeXBIdFRsc0RMM3ZPZTVTNHVCc3g4N3F4MnNK?=
 =?utf-8?B?ay9GWjNBdnVEZFUyWUFqNnBKT2trY2l3NW1tWDIyM3BYYzBBTE1tTktlMVM4?=
 =?utf-8?B?MHp6bVMvaEl1OEg2YnFUUFh4WTFncFVJSkR2VmN5YSsxNytOQnEzMGQ5a0dU?=
 =?utf-8?B?aS8xNTFEZklxc28ySUVHTCtqSDNoNFdPandPL0VUejhsTnBBdFl1RTlzK3pQ?=
 =?utf-8?B?L2liOTJKQlpRT05OeVFTMjlWKy8yeDBwbE1jL244SlYvazdtNHpqd2tWTDdj?=
 =?utf-8?B?aVcvdXB2L2FlblR3emFFVTgrY3IzZDlSUC8wNklNZVRUWDB0SmNRZkhSckNa?=
 =?utf-8?B?TmM4bERCOXVtdXR4elREM0RPSHJBNXlsampyenk4eUlKeDFvZ0c4eVk1eDJy?=
 =?utf-8?B?MHlOcEVMOHVudzN3YjYxTVA4d05oUU5LWTlQYk85dFZFMHhXemozRkwwWW9U?=
 =?utf-8?B?QVBMeW5CVzF0SGloQ2JEc0VFOHdITGhzcGZVanRMUVBzNGJaMnBJZlFHRkRG?=
 =?utf-8?B?ckxMaFBUaHN2emlTVFJxZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB6886.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YllnRTdXUFl5Sk9Dclk5YzRCSVlZQmUrUitZR3NPU01YTDRoYXJ1ZWNlRGlV?=
 =?utf-8?B?S0kvejFGRVF1cEI5aEIyMzk5R042dnZJQ3N2L0YrSE5sQUp4WGdtWGNuT1BL?=
 =?utf-8?B?WUFJRHZaWmxYcDlZb0YxenJlSnk2cVpTT3J2TklXY1hYeEQzV1huVm5TRkla?=
 =?utf-8?B?THUzcG90Njk4VE8vNGh3OCtxYXMwOUFUQ1dnejhzMmF2c0FIY1ZhQ3EwUW05?=
 =?utf-8?B?ZldaVTVWTm1CV0tUMU4yK1hVQld6OVFQSDJ3dGRRV3dkTHNoU0JNVFlpMGNL?=
 =?utf-8?B?Wk54SkhRWXBNRlRCczFSOGN2Rm5wa3VZZ2F5TTQvYmovdXJXd3ljTDZtcWxO?=
 =?utf-8?B?Nk9hcmNOSk9MaGhYdEhyUEVXKzhGYi9BSlNmdnVuY0lqWnIzaDZNdlhuckds?=
 =?utf-8?B?Ylc4YlhBOXpNdGJ1YXJBV3NiVU9ySTMrM3pCcjQvNGVxWk9HSDB0TzU1eXhl?=
 =?utf-8?B?d01TZ0ZEZ21ZbHVGUFE5RnpJNWJMMWJFaVF2Z0ZwM3lCbElDVDh2SDhrQlVu?=
 =?utf-8?B?eWIwWmlFbDJKOTdxWk12TTdVL1VpNEZnYUMvZlhMR1cwS0hLZEZGMk9oNDhx?=
 =?utf-8?B?NU5RdEhJUDdZQXBQUTVNemtlSnJMN1JVWlhNdjFPem56aVZmaG1FQ1g4YWdy?=
 =?utf-8?B?QlBJa0gyRGo0bDZDeUpUUks0VFIydmZ2SnQvR3FkK3hSM0hQRW9HOVpXaWw2?=
 =?utf-8?B?Q2FzZnR6UWJzSlQwY0svbjkzUithS2I4UzFFQmV0RlBGK1ZrQ3ArdzJaSldl?=
 =?utf-8?B?Sno5L0UyVmxoL0QrUlhDYXNqMWphRHd4VDg2REVSSkVRZ2Z5d0l1ajRsUS91?=
 =?utf-8?B?cW5yNmlSUUpGWmNMcVZWN2pQMGY3N051UVFBc0NTc2Q5NDdQZDNaK1FyUksw?=
 =?utf-8?B?N0FrUnY2MnFld28rc21uVU02d3QvSUxSMzZjaVZLanZDMGpSU2FjbzJPR1VI?=
 =?utf-8?B?V28vNU95ZmxiVTRVL2VnQUVUSUpzVjRkMlJVMTlhLzNWNFJ3TVZDcWtmYkxs?=
 =?utf-8?B?VEhrc2pJYys5dXZDN0xSZWY5ZW1TbmJRMWoyYzV6aWF4eURsRXFETGMxQjZm?=
 =?utf-8?B?WUJENWl2endsL3FlRUtraC85Qzh6VkYvUmdUL005OEsxOU1aOWNIaDNqaXFw?=
 =?utf-8?B?NlplblMzQzc1OTFOUGdYVzVWODgvSHpkSnR1Y3pkWUxTcjVvMWhFWTBYNkNZ?=
 =?utf-8?B?dnk5QytOOXNNc2R2T3B5aGNRMXdJS0MyVmZRMVBUUDlEZnlxZUhOek1lTUxy?=
 =?utf-8?B?NE5CT3FmUm1ncE1QNmExejEzeklNWHU3TE9relp6VGw5VWtMOEpjSWdFREpH?=
 =?utf-8?B?b1JTVXR5Zm1KUE5vQmM5TDFKRkJ2K2xjdDRDYVJDVzkvQ2dibk9aSUMySTcz?=
 =?utf-8?B?Zi9sVmxvMVZrVTZCNDF2YkYyZVdldGtUKy9vejdVQ01ZYUc3czAxRHBhUGNr?=
 =?utf-8?B?YTFDbTZ1ZTJDemVKaHlvcWFyYXNNeTFoYkRldEdqeHRxaDFtdENyd3o1OEFq?=
 =?utf-8?B?eWNHY1BCSSs3bE5Gdkx0dUhrYnR1c0FETExua09uMnVUOTN2eGpPTzZ0WVdm?=
 =?utf-8?B?UGRqMFVxZTAvSlVpeVIxRGdsRmU2RnhSL1ppZ0JJVmhLZ3ZkTFpvbkhpSUYr?=
 =?utf-8?B?L0dja01Bc3l3RURLa09DemVFTU14WEc5Yjh3N0VXTnNPaFB2SGQrZFBsZTA4?=
 =?utf-8?B?aU5mNXIwQ2NQV1ZnWUk4V3FmcStOOGx0RGFnbFVNRE1ralZ4WGtTbEs4T2Ix?=
 =?utf-8?B?bEhjcDN5SjUzNnhuUGlFeVh4MlRmSlovelkra0tMMHduS1BYVXZ5aVM4ZEZZ?=
 =?utf-8?B?cnNmMWRMWlVSc05pMDNTbmh2dWZiWlRLbkxzWHF4N3JiTkFTbGdxaDdoOVor?=
 =?utf-8?B?QmI3WC9xb1FKRUh3aitRcjR6N3lnYk15THVLZ3F0UVBZR013RUVnOXVEZDd6?=
 =?utf-8?B?WE8vR1p2Q0pNd0FpU3k2OVh2cmsvZk5jejZjdy9CLzN5YnQ5VzRLUjhEZFpt?=
 =?utf-8?B?WC9TZFlzNTl3ZGdUY3g2Mk93RDZsRXhsMFdNdlk5ZWdaOU4wcVVsUElPbklv?=
 =?utf-8?B?Q09FcjlBWGErNXJkck4wQ3lRdlovdVBDQVhjYzZDSC9vR0hqTk1PbjFwOFFK?=
 =?utf-8?B?T1IvcG5pZ0tjQWxnZWdNTjZjUmRES2JUTnRvMVZuQytlcGNVeUpKYjA4SGdu?=
 =?utf-8?Q?9jdLxDuvyIUm58tyJSnCkB8=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+Vm5vNUJdLbUGaknPIzuVbD8UsuMblg4tPT8RtHvRVkiieukKbcf7Ua1pImXHYRg33cXjs4gH7H+rLg1vElrr0KihdVV43/4VNxN9Lnu2cXgmXi2j69fhRR4a+pCdMNDpKY2k6TV8m5SPjujg4hhroIlNKhPBi/hm0REI3cilyTySzkZxqBFm/fafhc3/5UM04ogayNMOxpL5gXpin74SfF52KMZrYkXE7ljLKzaG8KsGh6nj+a90AfOqMi/c52/vhlNOcYUZG5BudCAbB458WUOisJ85xWJ3m5hNHY0LBR5gQGmA/Xrlu4voHYX0E+rcgPoZ5vRnJUL/hPtM9L43ShlBjbyIT1LgHbM7BXELQQoayIJr4dyFdEv1dFCqn57HpeGKP3g3BxfggJSbtpDheEN0Dib0kYZmpTZrffxfe1cvDVRdu1s/TW8vDCSQYM7SiSWMQGWWyDCvrT2uVkggbdQpY/bBDAATrZDGMfgkfuD9790aWQl/Dy16Lw0qCfneD0oFNN3idqvJ512yx/C+yEkbG4itjsljkocFxnhikFeG/Gq5fMVPottANmix3qWai1CViA99XYr5rjVjLCBmra7NBPOLYG52SO5+rA3huk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49285b00-cffa-4ada-c51b-08dd487d609b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB6886.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2025 20:15:48.8399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A6rM4o7SZ6j17ka/iGEqTakJGIJPjT6YqHtQ6PfEGrOfI/eshT3HtP3aDb7K9xf36uUD8MRNXKJAWDmLJKdbZB1kQGX7BH64Srkun3ZjAY3t660jKwt6WVl3InfWGQhe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4642
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-08_09,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2502080172
X-Proofpoint-ORIG-GUID: O7gK3KPqOB6xhEJi_RaA_BP9hjMbMY0h
X-Proofpoint-GUID: O7gK3KPqOB6xhEJi_RaA_BP9hjMbMY0h

Hi Salvatore,

On 08/02/25 21:26, Salvatore Bonaccorso wrote:
> Hi Juergen, hi all,
> 
> Radoslav Bodó reported in Debian an issue after updating our kernel
> from 6.1.112 to 6.1.115. His report in full is at:
> 
> https://bugs.debian.org/1088159
> 

Note:
We have seen this on 5.4.y kernel: More details here:
https://lore.kernel.org/all/9dd91f6e-1c66-4961-994e-dbda87d69dad@oracle.com/


Thanks,
Harshit


> He reports that after switching to 6.1.115 (and present in any of the
> later 6.1.y series) booting under xen, the mptsas devices are not
> anymore accessible, the boot shows:
> 
> mpt3sas version 43.100.00.00 loaded
> mpt3sas_cm0: 63 BIT PCI BUS DMA ADDRESSING SUPPORTED, total mem (8086116 kB)
> mpt3sas_cm0: CurrentHostPageSize is 0: Setting default host page size to 4k
> mpt3sas_cm0: MSI-X vectors supported: 96
> mpt3sas_cm0:  0 40 40
> mpt3sas_cm0: High IOPs queues : disabled
> mpt3sas0-msix0: PCI-MSI-X enabled: IRQ 447
> mpt3sas0-msix1: PCI-MSI-X enabled: IRQ 448
> mpt3sas0-msix2: PCI-MSI-X enabled: IRQ 449
> mpt3sas0-msix3: PCI-MSI-X enabled: IRQ 450
> mpt3sas0-msix4: PCI-MSI-X enabled: IRQ 451
> mpt3sas0-msix5: PCI-MSI-X enabled: IRQ 452
> mpt3sas0-msix6: PCI-MSI-X enabled: IRQ 453
> mpt3sas0-msix7: PCI-MSI-X enabled: IRQ 454
> mpt3sas0-msix8: PCI-MSI-X enabled: IRQ 455
> mpt3sas0-msix9: PCI-MSI-X enabled: IRQ 456
> mpt3sas0-msix10: PCI-MSI-X enabled: IRQ 457
> mpt3sas0-msix11: PCI-MSI-X enabled: IRQ 458
> mpt3sas0-msix12: PCI-MSI-X enabled: IRQ 459
> mpt3sas0-msix13: PCI-MSI-X enabled: IRQ 460
> mpt3sas0-msix14: PCI-MSI-X enabled: IRQ 461
> mpt3sas0-msix15: PCI-MSI-X enabled: IRQ 462
> mpt3sas0-msix16: PCI-MSI-X enabled: IRQ 463
> mpt3sas0-msix17: PCI-MSI-X enabled: IRQ 464
> mpt3sas0-msix18: PCI-MSI-X enabled: IRQ 465
> mpt3sas0-msix19: PCI-MSI-X enabled: IRQ 466
> mpt3sas0-msix20: PCI-MSI-X enabled: IRQ 467
> mpt3sas0-msix21: PCI-MSI-X enabled: IRQ 468
> mpt3sas0-msix22: PCI-MSI-X enabled: IRQ 469
> mpt3sas0-msix23: PCI-MSI-X enabled: IRQ 470
> mpt3sas0-msix24: PCI-MSI-X enabled: IRQ 471
> mpt3sas0-msix25: PCI-MSI-X enabled: IRQ 472
> mpt3sas0-msix26: PCI-MSI-X enabled: IRQ 473
> mpt3sas0-msix27: PCI-MSI-X enabled: IRQ 474
> mpt3sas0-msix28: PCI-MSI-X enabled: IRQ 475
> mpt3sas0-msix29: PCI-MSI-X enabled: IRQ 476
> mpt3sas0-msix30: PCI-MSI-X enabled: IRQ 477
> mpt3sas0-msix31: PCI-MSI-X enabled: IRQ 478
> mpt3sas0-msix32: PCI-MSI-X enabled: IRQ 479
> mpt3sas0-msix33: PCI-MSI-X enabled: IRQ 480
> mpt3sas0-msix34: PCI-MSI-X enabled: IRQ 481
> mpt3sas0-msix35: PCI-MSI-X enabled: IRQ 482
> mpt3sas0-msix36: PCI-MSI-X enabled: IRQ 483
> mpt3sas0-msix37: PCI-MSI-X enabled: IRQ 484
> mpt3sas0-msix38: PCI-MSI-X enabled: IRQ 485
> mpt3sas0-msix39: PCI-MSI-X enabled: IRQ 486
> mpt3sas_cm0: iomem(0x00000000ac400000), mapped(0x00000000d9f45f61), size(65536)
> mpt3sas_cm0: ioport(0x0000000000006000), size(256)
> mpt3sas_cm0: CurrentHostPageSize is 0: Setting default host page size to 4k
> mpt3sas_cm0: scatter gather: sge_in_main_msg(1), sge_per_chain(7), sge_per_io(128), chains_per_io(19)
> mpt3sas_cm0: failure at drivers/scsi/mpt3sas/mpt3sas_scsih.c:12348/_scsih_probe()!
> 
> We were able to bissect the changes (see https://bugs.debian.org/1088159#64) down to
> 
> b1e6e80a1b42 ("xen/swiotlb: add alignment check for dma buffers")
> 
> #regzbot introduced: b1e6e80a1b42
> #regzbot link: https://bugs.debian.org/1088159
> 
> reverting the commit resolves the issue.
> 
> Does that ring some bells?
> 
> In fact we have two more bugs reported with similar symptoms but not
> yet confirmed they are the same, but I'm referencing them here as well
> in case we are able to cross-match to root cause:
> 
> https://bugs.debian.org/1093371 (megaraid_sas didn't work anymore with
> Xen)
> 
> and
> 
> https://bugs.debian.org/1087807 (Unable to boot: i40e swiotlb buffer
> is full)
> 
> (but again the these are yet not confirmed to have the same root
> cause).
> 
> Thanks in advance,
> 
> Regards,
> Salvatore
> 


