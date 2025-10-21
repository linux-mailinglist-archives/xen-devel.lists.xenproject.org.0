Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 289B7BF6C85
	for <lists+xen-devel@lfdr.de>; Tue, 21 Oct 2025 15:31:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147185.1479462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBCSM-0004FG-OA; Tue, 21 Oct 2025 13:31:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147185.1479462; Tue, 21 Oct 2025 13:31:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBCSM-0004Dh-Kv; Tue, 21 Oct 2025 13:31:18 +0000
Received: by outflank-mailman (input) for mailman id 1147185;
 Tue, 21 Oct 2025 13:31:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TpUL=46=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vBCSK-0003l8-SS
 for xen-devel@lists.xenproject.org; Tue, 21 Oct 2025 13:31:17 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3778c55b-ae82-11f0-9d15-b5c5bf9af7f9;
 Tue, 21 Oct 2025 15:31:15 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by PA4PR03MB8271.eurprd03.prod.outlook.com (2603:10a6:102:271::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Tue, 21 Oct
 2025 13:24:34 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 13:24:34 +0000
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
X-Inumbo-ID: 3778c55b-ae82-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TuvngszkDyElHzYXOk2ySwixI+dx3TR3f5B/mjVNNOZL1qRvTN+u12OYow6dWiphnqHS4eWcNJDbZbgFPMWYzE+h4sGxxsCXtIZlV9m/RTXb8oyZ0Ua54MQVbS0KwFZojqbHslZISwnUTF5XA64GlnT+/ZkUxPoaDZazIaolS6pdlcTzqDvQXz0sqDA7iTNbfea0RaTxtDos2EAtRQ52LPovF2MvRIGCem3wVyH1Tvf8scCST6zLUvye92qBjWPGwhnjzDtDuzRaHRsnzkzSbJR/8xGY8a6wMUCgQBt+iO8M9UlYWtdVst0pB/gxYnExnfkLCa2zQsIwbXU/wt1RaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7MCQ6yF7y2Sz8aPUUQ+8LMfjwgj5AzYkrB9mgTF8An4=;
 b=L7QH7VgiSkjxsLJWZKDVn4ZZU63lpJ/3QanXvWm+0XnAT8LFc05Z6LNaIWbQBiAt2ShGIaChezsFdB8BYRm1Lb0l54un9I9oHlh7danddRi9gbPNxHW+CJCfjjN9/L4gefl3bouPSpaEjXlv9comGiaRi43YkhwPfYborXA2gIoIUgRLoI+oLRXtjGaQ7XMXkZKL1Nr7IDDOtN6KJ13blCoYk2krnubcZtrkmx/+0OgtLUg0zhcawSu75rsjuvzqpaYvoxxY0mD2W1HJmG81/R6U9vLOp+tRN80KFynilHoxkd70Sj7WDK2qCEdCYfnQLZyhvTz1ttAIYfRUGvf1oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7MCQ6yF7y2Sz8aPUUQ+8LMfjwgj5AzYkrB9mgTF8An4=;
 b=kpyDPR90psDfW6T8mh1yq5hnMtJm//w9m6SK8GG2SV/PDIZ02bJqHff9SY0wW5nQIfKCvgI7KcmfP0dOjNBa1YcFdA+B+mOBaEBymxmPlpzOTDerMnkR7ppwmNWHpsBVGwSOn9F7pcG/ERbRHpi9YeXF5ccXkQSVlRX9S96tJsQuKAUMrceGOGQaNPMM/zORCrX71iq2SVUBqUybTt9dOfujyYe+ryaI5w9sbEKykXPBMC+uBZENKJ2Nzd+fmNAdLl345OlgA1w1qfKxe6iOETmXq5G1R86RGZjGNJ2FJUvwZCmfg4HnaJgA9XTZNWXwq6ttagCwjTiiRQtb/cdGPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <e7f54b7c-e285-400d-bebf-699ae211ee83@epam.com>
Date: Tue, 21 Oct 2025 16:24:32 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/28] xen/vm_event: consolidate CONFIG_VM_EVENT
To: Penny Zheng <Penny.Zheng@amd.com>, xen-devel@lists.xenproject.org
Cc: ray.huang@amd.com, oleksii.kurochko@gmail.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
 <20251013101540.3502842-10-Penny.Zheng@amd.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <20251013101540.3502842-10-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::17) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|PA4PR03MB8271:EE_
X-MS-Office365-Filtering-Correlation-Id: 45c4f362-1933-4521-d71a-08de10a52cfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UkRhNktVSW15a01IMjFIWDVrR2k1ZDdPUHBHQ1JJTXV5MERvLzVlOWJFMkht?=
 =?utf-8?B?OWxQTy8zNzZvcUlFT05Weld4N0RYQ3VGTzFrWUdPL3IyVjM3QUZwdmlwMDFC?=
 =?utf-8?B?dFdPYW1VeFc0aDZqUExuUFptN2hzK2RpbXVOdGVZSzRiTXQycjAxd1B4OXU3?=
 =?utf-8?B?bUpFUldKazdOSFkrMDhiRzE1dXF3c05UV2tya3dLR1M2dFNuZlp5ZjZpYnBx?=
 =?utf-8?B?K1FTajkreFZBNTlVMzI4UGxqU1NERStBSCs1RmtmZ0NKSFJGSDF3d2pobnYr?=
 =?utf-8?B?alVvamNyRXJRZ08zSWpBcllFTzNGYTd3UlN1Wnl4QlhFZlpSR2MwNWhBc3JQ?=
 =?utf-8?B?bUdhNGswMnkvRmdNd09qcURUemZIWm9qajZzWklNcFVwRE02c0xCd3g5d1RZ?=
 =?utf-8?B?OWREMkJjMTNCd3VKeFBLQ0FGV05ZN2w0YXI3TnhvMUYrMGtjNGREekl1ektS?=
 =?utf-8?B?QUZyUWdLRnY4LytPd0ZhenlEZERZUFNmR3Mwb21rUE5Uc3E2eEZKZ1FmSm11?=
 =?utf-8?B?b1ZsdXlpeHJiQm1QMUJhUDh2VTNKaXlVM2xma3pYYzEwMmJFb3M3NGduRVl4?=
 =?utf-8?B?N0lTd3MvTG50SlNXMTJDbGZTMXdSRG9KSFVTZXkzOTRDeHdsR2lPMm15QzA5?=
 =?utf-8?B?emNWbFZkRWo3aWtUSmFvUFk1czFnQ21KOUdaQVFUeC9TZ0pvT1ZmTUZvazhq?=
 =?utf-8?B?c0liRmNvLzd5dlBuM2VzZkhmTFRlWWk3MElRYWhBNEVDQUtXSXgvajE4RmMr?=
 =?utf-8?B?SmxvVVJMRVNvZVFMNFM1UUxWRGV5MFNJZjdzTkxzeVNEamxNUW9Tc3BvdmFz?=
 =?utf-8?B?bmlzZzFyaCt3OSthWmFPZGc3TGhUOUNnL1ovblVaOVpDTzVqK3M1aFBhTGFP?=
 =?utf-8?B?bGJRZmZ5THR4VC9lelVSNG1UU2h2cnowZzRhaE8zQlhJYU5sa1lmU0VPQVBX?=
 =?utf-8?B?MTNkSmduU1YyUWxVQkg4dTVWL2RSQlFac3JwRjJ5N3hoWTV1Mnk4UVZOQ1By?=
 =?utf-8?B?ZFhvMkJZNTNxdWFJdlJYdmFDOHI3a0JIT210TDZxWFppYndpSElZSjZITWhn?=
 =?utf-8?B?Z2ZSTkJ3ZmhDZGdkMTA1OXZWb1lYbDhwNFhrS1F0NDh5NUJIOW4vc2ZqMllB?=
 =?utf-8?B?dzltdWNGcDF6NURuQnNZSDZQWXNVNVphWkpZTVBUd1Y5RGZ4VzZNdzJxSGlu?=
 =?utf-8?B?K2sxUHlWMEdUS2lyNVVKQVM0cisyK3VndGtuU2FTaldnakFUZVFNOVUrSkM1?=
 =?utf-8?B?d2JoMWVwZDYvb1RZbGZyV00xSE1qK1pmVkM3T2Zxa0FjNmRodVB6WXREYlps?=
 =?utf-8?B?Q0l4cTZpQVFmTkgwaTNaa21MR3hqN2lLNUZTRHpvWHY3KzFHb1pnMnNLYys0?=
 =?utf-8?B?Snh3OEwrQlhCNlpUeTNDd2hZWDFBdXptMVpjNkpyUW1FcEdERkNSZFFqbnVy?=
 =?utf-8?B?bTlsb2kvQzIrS0xDVTlNc2Q3OElqNW9KSUdpcHd0azB4dWkwam9VVXBJdExW?=
 =?utf-8?B?VDR5MFlISzJaTTdncXEwVUhDdUtBRWNUOFVuOU5WK3RsQWFmQ3RSWWJxVHlW?=
 =?utf-8?B?cU9MNXVWQVJ1Y2J0L1ZuWlpvWU14eWNqekl6cStSNjR6enAxRlFjOWlTL1Qy?=
 =?utf-8?B?UXM2Q2VGUXUvZVRmQUJBOWhYOVJyUDVPK3EyQ2YvdFhYTm95Sko2bFFXdHp0?=
 =?utf-8?B?bWpRZFR6Yy8vL2JKYmNoZjU1Q2szeWxWM2Q5ODBsWnNMbHVhdFFDR09oRUtY?=
 =?utf-8?B?VkJZbURoN1VlbDdWVGN6Skgwc2o4SjVhVGJ3WW1oekhVeUd6Q0ZBOVhUWHNm?=
 =?utf-8?B?Y1h6UEM2RjVVenphSzVSSW5nTjU5U1l0NVlMOVUvZE1VVDF2S21palJxTGlF?=
 =?utf-8?B?dGNBelF0cjJPTEp4SGszRlFkZkUyNEF4UE55eVRETGdhc0N6Z0wzQ3pJNUFV?=
 =?utf-8?Q?c4nfDstBY+Ivu5oqnH/J//VwIJl1Krv9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVhJUy80cTRvcllhUHBaOEU5eFV0Zkx5cXpmWlg1cXZQWkcvcFFwUVkzVktX?=
 =?utf-8?B?S0dUSElLbE9kMGQyak9SL042OHZMOVZPZno5bEVXUUlWK0NHbmZsWDNxd0Ro?=
 =?utf-8?B?Yy9sNzZHYmNqZ2FXS2VYbytJUUlUTEtkNWF4UkYwZWYydE9MdkNaeUtReDc1?=
 =?utf-8?B?dlF6ZVc1V2RmOUdlSzBSODBwemlTR0JpdlBtNjJrT1M2Q3h5ckhzMExDVmxl?=
 =?utf-8?B?YmcxeTE4aFh4UEdIc0t6Q2Q3cDVhcjl0SWR2b3NaSFBIOWorUEllaHViLytL?=
 =?utf-8?B?YXA1VENkQ3ppYXlpQUs3MGJiWTVHaVFVamFTT0owNTBiYmtwTjIvcEtlakI2?=
 =?utf-8?B?dVlFZmZyN2hrOWNPVzFlZ3JGQ1dHeFU0VG90cUdnZ0ZKWUdMNy9sVHBlbzlu?=
 =?utf-8?B?ZTlqUHZZaGdmZklZU20yVkFmYmVUY0ZWV0twK0o3Q05KUlhqL3dkRWdUeEUz?=
 =?utf-8?B?VHhKNmczM1d1QnYwakZrRDNLc0h5M3BnVmhSb25nZUZUVXZFVW83Ni9kaVkz?=
 =?utf-8?B?TktkRHZWbUJiUEFsVndHUHppLzBmZ0dQWUNrL3hZZmhockgwc2lSazZ6MUNq?=
 =?utf-8?B?ZEtBdnl4THpiMHdZR3VFQ0t3alNKVWF1anlYSGFBam8ydERhWVdaVHU1Q2R2?=
 =?utf-8?B?SnBnbjZxUmg2VjNKVkpKZTFsdGdzcURPazFtTjZML0ZxbklPRGZhRFd3bzZW?=
 =?utf-8?B?aThSamVWWklKbi9EVzNwNTFPZGcxbGRkdmYweWsvcjFtY3ZXWnBOb0JLWHFH?=
 =?utf-8?B?N2R4dG4rRTFjVHZqSkJDS0F4MGVQN3VuZHlsR1NwZ051THk3dUlibHp0UEZL?=
 =?utf-8?B?Z3Uwc3ViTnlrbG9DZktwNUxkSW5idU1xT2VLYTV4TDNEN1dmc2V2VHUwVWdP?=
 =?utf-8?B?dDQzWEhySitQV01OTXkybjhidVdXSDVCQklxTFZSK3NnT2RNR0NndWZEMWdo?=
 =?utf-8?B?cXRRc2p6Z3V2TXlFM0huaENZbTlQcGRTV1M5UExFUFZkSEY5QnF2ODZNWEM1?=
 =?utf-8?B?QXNoNjFic1FXQ2RWY3E0cmMrQm14d1BKbllWWGNtM1Mzc3BzMklqSVBnRXo4?=
 =?utf-8?B?MjJNdGh5YWdrQ0pkRUVXTGhMWjNhZXo0bW5ja2dwMWZrRDRGRWxPU3h6M3hi?=
 =?utf-8?B?ZW1VclhLeFlQcjh1SXVEd2RWTWdmeGpIKzR6TkFuOFJVNzhWazloQ3V0TW1s?=
 =?utf-8?B?TDIvbllSQXljRnlqVVVGNnB3RHAzR3VtOTdQSGVLYzAwZ1grTHJvNnpZQnkz?=
 =?utf-8?B?TTV3MHcraDYycjdhSmpDTjNMUmNnQW1zQ1NVc0JMelpvSDdRaTlvK3NLeFVK?=
 =?utf-8?B?eUNCbjJRbFU3eEwra1RyRHpxVkxXdXdZTWx0Qjc3QUZYUFIxVVM0Y1k1ZUpM?=
 =?utf-8?B?R2Iycm55RVkzZHRNTEJLb1ZaWnk5UlQ3bHdkT2RBc05obHczNXNkSWR2SHJs?=
 =?utf-8?B?anZ2cmFna0ZyVk9LNHJJVjZsT0paMXJOa01EK2JCWU4rUndFSFhwZjFsUjBP?=
 =?utf-8?B?aFZTYTdmdGlvWEt2b0twN0xVNHJVQ3ZjZmpXOU95OE1GKzZrRmtyUkJ5citU?=
 =?utf-8?B?Z3o2MWl1eC91VzBmMTcyYWFreUhJeUJtZnVhZ2lhcTZwRkdjeGlXMzZseXdj?=
 =?utf-8?B?Q1lCQjJtMjJVWENhcmhYOW9CYjNtRzFGUFZxQ0lOQU15OVlqNFVFSmszNE52?=
 =?utf-8?B?UmhJYTQvTXZrNnZBVGVRbWUxcDVwMWZpY3dpQTlUUXljV0U4K3NLeXdLdWV5?=
 =?utf-8?B?eG02Q0N6VFNKWTZ3RmdMeTd0S0p5T1Z0WFNNeHo0bHRjbUJBcnFLenBCV0tp?=
 =?utf-8?B?ekU1TW5va2RyamhmUUppdkQzWWQ0Z216SmNWSys3YUZ1WVJxUFQ2Y1QvTVk0?=
 =?utf-8?B?TGkrbERJQnBtaE03eDdmTGhtNEJiaDgrS2F3a1RwdU9INWJramZaVjNwNmg1?=
 =?utf-8?B?UzZKWDJQaEhTMlBDVU5xUnRnSlJRaWYza1RGdkdWTU1rc0pDM0h3QmRvTFB1?=
 =?utf-8?B?R3FuMHNIZGVHa3hEQUJwWkJLVVNpbkJRQ0l0Mytyek5YNzFwb3hSeUZ6cUtT?=
 =?utf-8?B?MVloRm5vaklvbmh5emV4YjRaZWo0ek4xSmRmQnFMeXlHWWxsZ3B0bEZXdnRr?=
 =?utf-8?B?dlc1TEhiVDlnZGZoVkYxTm5XSEJFQ1A0SVBOaHMvZ0p5YzdVMFNmQTNHVnov?=
 =?utf-8?B?RGc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45c4f362-1933-4521-d71a-08de10a52cfb
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 13:24:34.5753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OqFlK+IUDywFvtP9uuLZ+fWUGC6WDGEfoU7x5ngm4WLvF0UT8USXgqZvPbLpWSCVneLOyCdgOB+Z4jupcldZNTC0c5Nn6gNovtzV56QrhGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB8271

Hi

On 13.10.25 13:15, Penny Zheng wrote:
> File hvm/vm_event.c and x86/vm_event.c are the extend to vm_event handling
> routines, and its compilation shall be guarded by CONFIG_VM_EVENT too.
> Futhermore, features about monitor_op and memory access are both based on
> vm event subsystem, so monitor.o/mem_access.o shall be wrapped under
> CONFIG_VM_EVENT.
> 
> Although CONFIG_VM_EVENT is right now forcibly enabled on x86 via
> MEM_ACCESS_ALWAYS_ON, we could disable it through disabling
> CONFIG_MGMT_HYPERCALLS later. So we remove MEM_ACCESS_ALWAYS_ON and
> make VM_EVENT=y on default only on x86 to retain the same.
> 
> In consequence, a few switch-blocks need in-place stubs in do_altp2m_op()
> to pass compilation when ALTP2M=y and VM_EVENT=n(, hence MEM_ACCESS=n), like
> HVMOP_altp2m_set_mem_access, etc.
> And the following functions still require stubs to pass compilation:
> - vm_event_check_ring()
> - p2m_mem_access_check()
> - xenmem_access_to_p2m_access()
> 
> The following functions are developed on the basis of vm event framework, or
> only invoked by vm_event.c/monitor.c/mem_access.c, so they all shall be
> wrapped with CONFIG_VM_EVENT (otherwise they will become unreachable and
> violate Misra rule 2.1 when VM_EVENT=n):
> - hvm_toggle_singlestep
> - hvm_fast_singlestep
> - hvm_enable_msr_interception
>    - hvm_function_table.enable_msr_interception
> - hvm_has_set_descriptor_access_existing
>    - hvm_function_table.set_descriptor_access_existing
> - arch_monitor_domctl_op
> - arch_monitor_allow_userspace
> - arch_monitor_get_capabilities
> - hvm_emulate_one_vm_event
> - hvmemul_write{,cmpxchg,rep_ins,rep_outs,rep_movs,rep_stos,read_io,write_io}_discard
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
> v1 -> v2:
> - split out XSM changes
> - remove unnecessary stubs
> - move "struct p2m_domain" declaration ahead of the #ifdef
> ---
> v2 -> v3:
> - move .enable_msr_interception and .set_descriptor_access_exiting together
> - with the introduction of "vm_event_is_enabled()", all hvm_monitor_xxx()
> stubs are no longer needed
> - change to use in-place stubs in do_altp2m_op()
> - no need to add stub for monitor_traps(), __vm_event_claim_slot(),
> vm_event_put_request() and vm_event_vcpu_pause()
> - remove MEM_ACCESS_ALWAYS_ON
> - return default p2m_access_rwx for xenmem_access_to_p2m_access() when
> VM_EVENT=n
> - add wrapping for hvm_emulate_one_vm_event/
> hvmemul_write{,cmpxchg,rep_ins,rep_outs,rep_movs,rep_stos,read_io,write_io}_discard
> ---
>   xen/arch/x86/Makefile                 |  2 +-
>   xen/arch/x86/hvm/Kconfig              |  1 -
>   xen/arch/x86/hvm/Makefile             |  4 +-
>   xen/arch/x86/hvm/emulate.c            | 58 ++++++++++++++-------------
>   xen/arch/x86/hvm/hvm.c                | 21 ++++++++++
>   xen/arch/x86/hvm/svm/svm.c            |  8 +++-
>   xen/arch/x86/hvm/vmx/vmx.c            | 10 +++++
>   xen/arch/x86/include/asm/hvm/hvm.h    |  9 ++++-
>   xen/arch/x86/include/asm/mem_access.h |  9 +++++
>   xen/arch/x86/include/asm/monitor.h    |  9 +++++
>   xen/common/Kconfig                    |  7 +---
>   xen/include/xen/mem_access.h          | 10 +++++
>   xen/include/xen/vm_event.h            |  7 ++++
>   13 files changed, 116 insertions(+), 39 deletions(-)
> 
> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> index 0f91ffcb9d..615cd101b8 100644
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -76,7 +76,7 @@ obj-y += usercopy.o
>   obj-y += x86_emulate.o
>   obj-$(CONFIG_TBOOT) += tboot.o
>   obj-y += hpet.o
> -obj-y += vm_event.o
> +obj-$(CONFIG_VM_EVENT) += vm_event.o
>   obj-y += xstate.o
>   
>   ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
> diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
> index 5cb9f29042..e6b388dd0e 100644
> --- a/xen/arch/x86/hvm/Kconfig
> +++ b/xen/arch/x86/hvm/Kconfig
> @@ -3,7 +3,6 @@ menuconfig HVM
>   	default !PV_SHIM
>   	select COMPAT
>   	select IOREQ_SERVER
> -	select MEM_ACCESS_ALWAYS_ON
>   	help
>   	  Interfaces to support HVM domains.  HVM domains require hardware
>   	  virtualisation extensions (e.g. Intel VT-x, AMD SVM), but can boot
> diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
> index 6ec2c8f2db..952db00dd7 100644
> --- a/xen/arch/x86/hvm/Makefile
> +++ b/xen/arch/x86/hvm/Makefile
> @@ -16,7 +16,7 @@ obj-y += io.o
>   obj-y += ioreq.o
>   obj-y += irq.o
>   obj-y += mmio.o
> -obj-y += monitor.o
> +obj-$(CONFIG_VM_EVENT) += monitor.o
>   obj-y += mtrr.o
>   obj-y += nestedhvm.o
>   obj-y += pmtimer.o
> @@ -26,7 +26,7 @@ obj-y += save.o
>   obj-y += stdvga.o
>   obj-y += vioapic.o
>   obj-y += vlapic.o
> -obj-y += vm_event.o
> +obj-$(CONFIG_VM_EVENT) += vm_event.o
>   obj-y += vmsi.o
>   obj-y += vpic.o
>   obj-y += vpt.o
> diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
> index fe75b0516d..d56ef02baf 100644
> --- a/xen/arch/x86/hvm/emulate.c
> +++ b/xen/arch/x86/hvm/emulate.c
> @@ -1615,6 +1615,7 @@ static int cf_check hvmemul_blk(
>       return rc;
>   }
>   
> +#ifdef CONFIG_VM_EVENT
>   static int cf_check hvmemul_write_discard(
>       enum x86_segment seg,
>       unsigned long offset,
> @@ -1717,6 +1718,7 @@ static int cf_check hvmemul_cache_op_discard(
>   {
>       return X86EMUL_OKAY;
>   }
> +#endif /* CONFIG_VM_EVENT */
>   
>   static int cf_check hvmemul_cmpxchg(
>       enum x86_segment seg,
> @@ -2750,33 +2752,6 @@ static const struct x86_emulate_ops hvm_emulate_ops = {
>       .vmfunc        = hvmemul_vmfunc,
>   };
>   
> -static const struct x86_emulate_ops hvm_emulate_ops_no_write = {
> -    .read          = hvmemul_read,
> -    .insn_fetch    = hvmemul_insn_fetch,
> -    .write         = hvmemul_write_discard,
> -    .cmpxchg       = hvmemul_cmpxchg_discard,
> -    .rep_ins       = hvmemul_rep_ins_discard,
> -    .rep_outs      = hvmemul_rep_outs_discard,
> -    .rep_movs      = hvmemul_rep_movs_discard,
> -    .rep_stos      = hvmemul_rep_stos_discard,
> -    .read_segment  = hvmemul_read_segment,
> -    .write_segment = hvmemul_write_segment,
> -    .read_io       = hvmemul_read_io_discard,
> -    .write_io      = hvmemul_write_io_discard,
> -    .read_cr       = hvmemul_read_cr,
> -    .write_cr      = hvmemul_write_cr,
> -    .read_xcr      = hvmemul_read_xcr,
> -    .write_xcr     = hvmemul_write_xcr,
> -    .read_msr      = hvmemul_read_msr,
> -    .write_msr     = hvmemul_write_msr_discard,
> -    .cache_op      = hvmemul_cache_op_discard,
> -    .tlb_op        = hvmemul_tlb_op,
> -    .cpuid         = x86emul_cpuid,
> -    .get_fpu       = hvmemul_get_fpu,
> -    .put_fpu       = hvmemul_put_fpu,
> -    .vmfunc        = hvmemul_vmfunc,
> -};
> -
>   /*
>    * Note that passing VIO_no_completion into this function serves as kind
>    * of (but not fully) an "auto select completion" indicator.  When there's
> @@ -2887,6 +2862,34 @@ int hvm_emulate_one(
>       return _hvm_emulate_one(hvmemul_ctxt, &hvm_emulate_ops, completion);
>   }
>   
> +#ifdef CONFIG_VM_EVENT
> +static const struct x86_emulate_ops hvm_emulate_ops_no_write = {
> +    .read          = hvmemul_read,
> +    .insn_fetch    = hvmemul_insn_fetch,
> +    .write         = hvmemul_write_discard,
> +    .cmpxchg       = hvmemul_cmpxchg_discard,
> +    .rep_ins       = hvmemul_rep_ins_discard,
> +    .rep_outs      = hvmemul_rep_outs_discard,
> +    .rep_movs      = hvmemul_rep_movs_discard,
> +    .rep_stos      = hvmemul_rep_stos_discard,
> +    .read_segment  = hvmemul_read_segment,
> +    .write_segment = hvmemul_write_segment,
> +    .read_io       = hvmemul_read_io_discard,
> +    .write_io      = hvmemul_write_io_discard,
> +    .read_cr       = hvmemul_read_cr,
> +    .write_cr      = hvmemul_write_cr,
> +    .read_xcr      = hvmemul_read_xcr,
> +    .write_xcr     = hvmemul_write_xcr,
> +    .read_msr      = hvmemul_read_msr,
> +    .write_msr     = hvmemul_write_msr_discard,
> +    .cache_op      = hvmemul_cache_op_discard,
> +    .tlb_op        = hvmemul_tlb_op,
> +    .cpuid         = x86emul_cpuid,
> +    .get_fpu       = hvmemul_get_fpu,
> +    .put_fpu       = hvmemul_put_fpu,
> +    .vmfunc        = hvmemul_vmfunc,
> +};
> +
>   void hvm_emulate_one_vm_event(enum emul_kind kind, unsigned int trapnr,
>       unsigned int errcode)
>   {
> @@ -2949,6 +2952,7 @@ void hvm_emulate_one_vm_event(enum emul_kind kind, unsigned int trapnr,
>   
>       hvm_emulate_writeback(&ctx);
>   }
> +#endif /* CONFIG_VM_EVENT */
>   
>   void hvm_emulate_init_once(
>       struct hvm_emulate_ctxt *hvmemul_ctxt,
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 48a293069b..e3dacc909b 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -50,6 +50,7 @@
>   #include <asm/hvm/vm_event.h>
>   #include <asm/hvm/vpt.h>
>   #include <asm/i387.h>
> +#include <asm/mem_access.h>
>   #include <asm/mc146818rtc.h>
>   #include <asm/mce.h>
>   #include <asm/monitor.h>
> @@ -4861,15 +4862,20 @@ static int do_altp2m_op(
>           break;
>   
>       case HVMOP_altp2m_set_mem_access:
> +#ifdef CONFIG_VM_EVENT
>           if ( a.u.mem_access.pad )
>               rc = -EINVAL;
>           else
>               rc = p2m_set_mem_access(d, _gfn(a.u.mem_access.gfn), 1, 0, 0,
>                                       a.u.mem_access.access,
>                                       a.u.mem_access.view);
> +#else
> +        rc = -EOPNOTSUPP;
> +#endif
>           break;
>   
>       case HVMOP_altp2m_set_mem_access_multi:
> +#ifdef CONFIG_VM_EVENT
>           if ( a.u.set_mem_access_multi.pad ||
>                a.u.set_mem_access_multi.opaque > a.u.set_mem_access_multi.nr )
>           {
> @@ -4898,9 +4904,13 @@ static int do_altp2m_op(
>                                          &a, u.set_mem_access_multi.opaque) )
>                   rc = -EFAULT;
>           }
> +#else
> +        rc = -EOPNOTSUPP;
> +#endif
>           break;
>   
>       case HVMOP_altp2m_get_mem_access:
> +#ifdef CONFIG_VM_EVENT
>           if ( a.u.mem_access.pad )
>               rc = -EINVAL;
>           else
> @@ -4915,6 +4925,9 @@ static int do_altp2m_op(
>                   rc = __copy_to_guest(arg, &a, 1) ? -EFAULT : 0;
>               }
>           }
> +#else
> +        rc = -EOPNOTSUPP;
> +#endif
>           break;
>   
>       case HVMOP_altp2m_change_gfn:
> @@ -5030,6 +5043,7 @@ static int compat_altp2m_op(
>       switch ( a.cmd )
>       {
>       case HVMOP_altp2m_set_mem_access_multi:
> +#ifdef CONFIG_VM_EVENT
>   #define XLAT_hvm_altp2m_set_mem_access_multi_HNDL_pfn_list(_d_, _s_); \
>           guest_from_compat_handle((_d_)->pfn_list, (_s_)->pfn_list)
>   #define XLAT_hvm_altp2m_set_mem_access_multi_HNDL_access_list(_d_, _s_); \
> @@ -5038,6 +5052,7 @@ static int compat_altp2m_op(
>                                                &a.u.set_mem_access_multi);
>   #undef XLAT_hvm_altp2m_set_mem_access_multi_HNDL_pfn_list
>   #undef XLAT_hvm_altp2m_set_mem_access_multi_HNDL_access_list
> +#endif
>           break;
>   
>       default:
> @@ -5056,6 +5071,7 @@ static int compat_altp2m_op(
>       switch ( a.cmd )
>       {
>       case HVMOP_altp2m_set_mem_access_multi:
> +#ifdef CONFIG_VM_EVENT
>           if ( rc == -ERESTART )
>           {
>               a.u.set_mem_access_multi.opaque =
> @@ -5065,6 +5081,9 @@ static int compat_altp2m_op(
>                                          &a, u.set_mem_access_multi.opaque) )
>                   rc = -EFAULT;
>           }
> +#else
> +        rc = -EOPNOTSUPP;
> +#endif
>           break;
>   
>       default:
> @@ -5283,6 +5302,7 @@ int hvm_debug_op(struct vcpu *v, int32_t op)
>       return rc;
>   }
>   
> +#ifdef CONFIG_VM_EVENT
>   void hvm_toggle_singlestep(struct vcpu *v)
>   {
>       ASSERT(atomic_read(&v->pause_count));
> @@ -5292,6 +5312,7 @@ void hvm_toggle_singlestep(struct vcpu *v)
>   
>       v->arch.hvm.single_step = !v->arch.hvm.single_step;
>   }
> +#endif /* CONFIG_VM_EVENT */
>   
>   #ifdef CONFIG_ALTP2M
>   void hvm_fast_singlestep(struct vcpu *v, uint16_t p2midx)
> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index 679ca3dacd..c8506c25c4 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -299,6 +299,7 @@ void svm_intercept_msr(struct vcpu *v, uint32_t msr, int flags)
>           __clear_bit(msr * 2 + 1, msr_bit);
>   }
>   
> +#ifdef CONFIG_VM_EVENT
>   static void cf_check svm_enable_msr_interception(struct domain *d, uint32_t msr)
>   {
>       struct vcpu *v;
> @@ -306,6 +307,7 @@ static void cf_check svm_enable_msr_interception(struct domain *d, uint32_t msr)
>       for_each_vcpu ( d, v )
>           svm_intercept_msr(v, msr, MSR_INTERCEPT_WRITE);
>   }
> +#endif /* CONFIG_VM_EVENT */
>   
>   static void svm_save_dr(struct vcpu *v)
>   {
> @@ -826,6 +828,7 @@ static void cf_check svm_set_rdtsc_exiting(struct vcpu *v, bool enable)
>       vmcb_set_general2_intercepts(vmcb, general2_intercepts);
>   }
>   
> +#ifdef CONFIG_VM_EVENT
>   static void cf_check svm_set_descriptor_access_exiting(
>       struct vcpu *v, bool enable)
>   {
> @@ -843,6 +846,7 @@ static void cf_check svm_set_descriptor_access_exiting(
>   
>       vmcb_set_general1_intercepts(vmcb, general1_intercepts);
>   }
> +#endif /* CONFIG_VM_EVENT */
>   
>   static unsigned int cf_check svm_get_insn_bytes(struct vcpu *v, uint8_t *buf)
>   {
> @@ -2457,9 +2461,11 @@ static struct hvm_function_table __initdata_cf_clobber svm_function_table = {
>       .fpu_dirty_intercept  = svm_fpu_dirty_intercept,
>       .msr_read_intercept   = svm_msr_read_intercept,
>       .msr_write_intercept  = svm_msr_write_intercept,
> +#ifdef CONFIG_VM_EVENT
>       .enable_msr_interception = svm_enable_msr_interception,
> -    .set_rdtsc_exiting    = svm_set_rdtsc_exiting,
>       .set_descriptor_access_exiting = svm_set_descriptor_access_exiting,
> +#endif
> +    .set_rdtsc_exiting    = svm_set_rdtsc_exiting,
>       .get_insn_bytes       = svm_get_insn_bytes,
>   
>       .nhvm_vcpu_initialise = nsvm_vcpu_initialise,
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index a40af1db66..1996e139a0 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -1520,6 +1520,7 @@ static void cf_check vmx_set_rdtsc_exiting(struct vcpu *v, bool enable)
>       vmx_vmcs_exit(v);
>   }
>   
> +#ifdef CONFIG_VM_EVENT
>   static void cf_check vmx_set_descriptor_access_exiting(
>       struct vcpu *v, bool enable)
>   {
> @@ -1534,6 +1535,7 @@ static void cf_check vmx_set_descriptor_access_exiting(
>       vmx_update_secondary_exec_control(v);
>       vmx_vmcs_exit(v);
>   }
> +#endif /* CONFIG_VM_EVENT */
>   
>   static void cf_check vmx_init_hypercall_page(void *p)
>   {
> @@ -2413,6 +2415,7 @@ static void cf_check vmx_handle_eoi(uint8_t vector, int isr)
>           printk_once(XENLOG_WARNING "EOI for %02x but SVI=%02x\n", vector, old_svi);
>   }
>   
> +#ifdef CONFIG_VM_EVENT
>   static void cf_check vmx_enable_msr_interception(struct domain *d, uint32_t msr)
>   {
>       struct vcpu *v;
> @@ -2420,6 +2423,7 @@ static void cf_check vmx_enable_msr_interception(struct domain *d, uint32_t msr)
>       for_each_vcpu ( d, v )
>           vmx_set_msr_intercept(v, msr, VMX_MSR_W);
>   }
> +#endif /* CONFIG_VM_EVENT */
>   
>   #ifdef CONFIG_ALTP2M
>   
> @@ -2871,7 +2875,9 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
>       .nhvm_domain_relinquish_resources = nvmx_domain_relinquish_resources,
>       .update_vlapic_mode = vmx_vlapic_msr_changed,
>       .nhvm_hap_walk_L1_p2m = nvmx_hap_walk_L1_p2m,
> +#ifdef CONFIG_VM_EVENT
>       .enable_msr_interception = vmx_enable_msr_interception,
> +#endif
>   #ifdef CONFIG_ALTP2M
>       .altp2m_vcpu_update_p2m = vmx_vcpu_update_eptp,
>       .altp2m_vcpu_update_vmfunc_ve = vmx_vcpu_update_vmfunc_ve,
> @@ -3079,9 +3085,11 @@ const struct hvm_function_table * __init start_vmx(void)
>   
>       vmx_function_table.caps.singlestep = cpu_has_monitor_trap_flag;
>   
> +#ifdef CONFIG_VM_EVENT
>       if ( cpu_has_vmx_dt_exiting )
>           vmx_function_table.set_descriptor_access_exiting =
>               vmx_set_descriptor_access_exiting;
> +#endif
>   
>       /*
>        * Do not enable EPT when (!cpu_has_vmx_pat), to prevent security hole
> @@ -3152,8 +3160,10 @@ void __init vmx_fill_funcs(void)
>       if ( !cpu_has_xen_ibt )
>           return;
>   
> +#ifdef CONFIG_VM_EVENT
>       vmx_function_table.set_descriptor_access_exiting =
>           vmx_set_descriptor_access_exiting;
> +#endif
>   
>       vmx_function_table.update_eoi_exit_bitmap = vmx_update_eoi_exit_bitmap;
>       vmx_function_table.process_isr            = vmx_process_isr;
> diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
> index f02183691e..473cf24b83 100644
> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> @@ -192,7 +192,10 @@ struct hvm_function_table {
>       void (*handle_cd)(struct vcpu *v, unsigned long value);
>       void (*set_info_guest)(struct vcpu *v);
>       void (*set_rdtsc_exiting)(struct vcpu *v, bool enable);
> +#ifdef CONFIG_VM_EVENT
>       void (*set_descriptor_access_exiting)(struct vcpu *v, bool enable);
> +    void (*enable_msr_interception)(struct domain *d, uint32_t msr);
> +#endif
>   
>       /* Nested HVM */
>       int (*nhvm_vcpu_initialise)(struct vcpu *v);
> @@ -224,8 +227,6 @@ struct hvm_function_table {
>                                   paddr_t *L1_gpa, unsigned int *page_order,
>                                   uint8_t *p2m_acc, struct npfec npfec);
>   
> -    void (*enable_msr_interception)(struct domain *d, uint32_t msr);
> -
>   #ifdef CONFIG_ALTP2M
>       /* Alternate p2m */
>       void (*altp2m_vcpu_update_p2m)(struct vcpu *v);
> @@ -433,10 +434,12 @@ static inline bool using_svm(void)
>   
>   #define hvm_long_mode_active(v) (!!((v)->arch.hvm.guest_efer & EFER_LMA))
>   
> +#ifdef CONFIG_VM_EVENT
>   static inline bool hvm_has_set_descriptor_access_exiting(void)
>   {
>       return hvm_funcs.set_descriptor_access_exiting;
>   }
> +#endif
>   
>   static inline void hvm_domain_creation_finished(struct domain *d)
>   {
> @@ -679,10 +682,12 @@ static inline int nhvm_hap_walk_L1_p2m(
>           v, L2_gpa, L1_gpa, page_order, p2m_acc, npfec);
>   }
>   
> +#ifdef CONFIG_VM_EVENT
>   static inline void hvm_enable_msr_interception(struct domain *d, uint32_t msr)
>   {
>       alternative_vcall(hvm_funcs.enable_msr_interception, d, msr);
>   }
> +#endif
>   
>   static inline bool hvm_is_singlestep_supported(void)
>   {
> diff --git a/xen/arch/x86/include/asm/mem_access.h b/xen/arch/x86/include/asm/mem_access.h
> index 1a52a10322..c786116310 100644
> --- a/xen/arch/x86/include/asm/mem_access.h
> +++ b/xen/arch/x86/include/asm/mem_access.h
> @@ -14,6 +14,7 @@
>   #ifndef __ASM_X86_MEM_ACCESS_H__
>   #define __ASM_X86_MEM_ACCESS_H__
>   
> +#ifdef CONFIG_VM_EVENT
>   /*
>    * Setup vm_event request based on the access (gla is -1ull if not available).
>    * Handles the rw2rx conversion. Boolean return value indicates if event type
> @@ -25,6 +26,14 @@
>   bool p2m_mem_access_check(paddr_t gpa, unsigned long gla,
>                             struct npfec npfec,
>                             struct vm_event_st **req_ptr);
> +#else
> +static inline bool p2m_mem_access_check(paddr_t gpa, unsigned long gla,
> +                                        struct npfec npfec,
> +                                        struct vm_event_st **req_ptr)
> +{
> +    return false;
> +}
> +#endif /* CONFIG_VM_EVENT */
>   
>   /* Check for emulation and mark vcpu for skipping one instruction
>    * upon rescheduling if required. */
> diff --git a/xen/arch/x86/include/asm/monitor.h b/xen/arch/x86/include/asm/monitor.h
> index 3c64d8258f..1cd169f8f0 100644
> --- a/xen/arch/x86/include/asm/monitor.h
> +++ b/xen/arch/x86/include/asm/monitor.h
> @@ -32,6 +32,7 @@ struct monitor_msr_bitmap {
>       DECLARE_BITMAP(high, 8192);
>   };
>   
> +#ifdef COMFIG_VM_EVENT

Typo here causes build to fail.

With ^ fixed and patches 3 and 9 applied, and VM_EVENT=n there are still
build failures, like:

   xen/arch/x86/hvm/svm/svm.c:2757: undefined reference to `hvm_monitor_debug'

In my opinion, It might be reasonable to proceed with this patch (and related patches [3,?]) first,
as standalone series, to make VM_EVENT=n work and do MGMT_HYPERCALLS on top of it.

This patch, by itself, is big and included in even bigger series - which makes hard to
review and track changes.

[..]

-- 
Best regards,
-grygorii


