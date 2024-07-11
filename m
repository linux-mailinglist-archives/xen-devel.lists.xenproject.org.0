Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B486A92E9A1
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 15:34:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757495.1166472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRtwA-0000cq-9c; Thu, 11 Jul 2024 13:34:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757495.1166472; Thu, 11 Jul 2024 13:34:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRtwA-0000b9-6h; Thu, 11 Jul 2024 13:34:18 +0000
Received: by outflank-mailman (input) for mailman id 757495;
 Thu, 11 Jul 2024 13:34:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xjjf=OL=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1sRtw8-000067-3s
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 13:34:16 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43381216-3f8a-11ef-bbfb-fd08da9f4363;
 Thu, 11 Jul 2024 15:34:14 +0200 (CEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46B7taYJ025427;
 Thu, 11 Jul 2024 13:33:43 GMT
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 407emt0x8y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Jul 2024 13:33:43 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 46BDHU1Q022757; Thu, 11 Jul 2024 13:33:42 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 409vv2fqtg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Jul 2024 13:33:42 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by SA1PR10MB6518.namprd10.prod.outlook.com (2603:10b6:806:2b4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Thu, 11 Jul
 2024 13:33:40 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::a088:b5e0:2c1:78a0]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::a088:b5e0:2c1:78a0%3]) with mapi id 15.20.7762.020; Thu, 11 Jul 2024
 13:33:40 +0000
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
X-Inumbo-ID: 43381216-3f8a-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=YFIBWSC/+XeE0o8zI6KjL9V0QgxXYQuW4Cayf+HBLTI=; b=
	blAoZYoKvscUMtvqsLyeh7C6LDMKv/B+pINvkdqTPgyv3h2379JEgT6ygxEQoA4b
	0K5YwSUOJsr2JSwQX7leKMOHwq40g0g0AeIfusS/yNIKm78/SRE5wSNk8ZKCvjAR
	oiTwz8J8ehk+LFt3IlzzcxfDvz0R0MgGOID/VHFa5JRZuEi55oTcM0hYoS/V7FwY
	667A6GbDUR407veUkaCWYDGhQu3tdookfFV8foipeAwctHm8W+/6kPHCbdKevwyA
	ye9kwBw3jdAanervUcaAbLuszlygzJfyNy0vuEi1E3NIb6NjKSPH/MCOFXBooCGI
	N9vkjwt7n5OljHhoP1/Cbg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KJowaDboYz8zT90/QrC/hNNWGLZddxDnzYidydGLdc3Uiw2HVc7slzaRTGUTgz7AKAtcrOpwfmpcWIptLpQAVOds0WNLixxYWCWfAXtXAM6Dm6hqJhd6hcZMtLs3ctnFEaCS5icNIMkvRT2V6PjmmUcYCsgWaf7IwD2PRWTiwEMHoVdhnfhGJc2tKZftPbQSOSW31YSI5e/jymKzK1A2hvzmCFedXF1/Vq9nKG86Ivw1OUpfUaIvcVP5NBJvu5FClaEFWCA1V3HfDOX71+TA95Jb5nVjcR4E8P0Cm/Y+F86L6/pyjD3dUX3u7lH4gSrI4pwTwZjwsuumoVhppN95pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFIBWSC/+XeE0o8zI6KjL9V0QgxXYQuW4Cayf+HBLTI=;
 b=bx3wTM1osocDfp5UKwgQLhYMxGKYwCWLca+vHPkHv/RwMEUydMuyiVTIoqw4UeIkxVwqNqMks4A4WJk2KF5X3X5lNpbOWZi18K+mOJjD/bTzvP7DdOy9vqYWdyCkL5JNFNmV4lyOsV4cCsWiTyv3lg727FNBIOfNmRSxguD0hLMQUH2z1xyXZfugiQI/sE7iAKhTAFW7+ZQ3BTpi6VQcbFQBb+5pxcZwY6DEEohVPJYWTpJcioHTGhCfMBm9qRqc48n+77t401aXdgq95sYAp+D6uKXaH6QylIOShBLIO30f0tEwRJPao99PoixGmcj7Z7QpRfPP62hpwrxL1raacg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YFIBWSC/+XeE0o8zI6KjL9V0QgxXYQuW4Cayf+HBLTI=;
 b=h26fnrKKeymV0EpozfFcA1fU+PhjN44C951hdeZmRoWLFtMCtystn1+IOGuYhS+HdDERRfke6gS6x3Qz+JrWMdF8WpgukOF63TeBeZ9JcGUyvKp2GE4Id+nHbY3+RLzZUhBBtjDp5B6bB0KmQON1Vjsr51ICLOGWLQ3Ml17XEXY=
Message-ID: <ea005c78-20f9-4792-b59a-844fe6f7ca4e@oracle.com>
Date: Thu, 11 Jul 2024 09:33:32 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] x86/xen: cleanup of xen private headers
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
        x86@kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20240710093718.14552-1-jgross@suse.com>
Content-Language: en-US
From: boris.ostrovsky@oracle.com
In-Reply-To: <20240710093718.14552-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0658.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::7) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5009:EE_|SA1PR10MB6518:EE_
X-MS-Office365-Filtering-Correlation-Id: b285d562-be77-4120-161a-08dca1ae132a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cTVYK0NTcFV6NWlMMFltTXpRQnk3bC9Fd3hmUldvNnFhYjFWNldxZVFpdzhj?=
 =?utf-8?B?NWMyOTlQSFFhOVB0OUF2UlZJQ0JRdEVkQnpZYmVKZUVsQXVpb1lHSkJ0OTMz?=
 =?utf-8?B?V1dzZUk0UDF3TXBESFY3blhHNlMySHlJeUh2YU9IQXhEMkpoT3E5ZkdtS2tI?=
 =?utf-8?B?cVorMjI3aXlqdUNZWlZsYWF6dnRaNE8xTDRTaVEyWlo5S2Z6UVQ0aG5xWkxi?=
 =?utf-8?B?R3RSMG1SNDRwbzF5WDhpUm9kTWQreHBHd1R5KythRjcvTkQvOXFNMThHZTZv?=
 =?utf-8?B?cjJVVzJkWkJkVE80WERpeEZzbHJGcjJyVjdoVXZHeU8rZ2lJMWVqNUpldUZO?=
 =?utf-8?B?RDFId09FOVFwT0JUcGVWMitRd0pDQWdVZjJUblpDcWU1YjEvQkZKZlNTWStI?=
 =?utf-8?B?TE80S2Z2aEdrSU1NRXBDOHFnR3NIc0hCYWJEWThaNHFwd20zVjkwa1JDcW5E?=
 =?utf-8?B?V0t2Q0pSeWI1bVlTMTFvUDVXMy9ZUVBZbXY1YW91bS9ETDhGMmNNbkFUbDAy?=
 =?utf-8?B?UGsrdzF2LzZzUFYrSnJScm03OU9RNlVDdnpUc010UWtibGk5YmpnSG1XNGpH?=
 =?utf-8?B?RmhjNHU4cS9kYWE1czUwTVMvd1JDNENRTGc1clF6TTN4MHRzK1RlZzFyZUI4?=
 =?utf-8?B?WFVsWVhaeW9IK1pOeTFnR0h4QTZCN2dWbHhpWXZyOFpVQXBHdjRTdy85WDBI?=
 =?utf-8?B?RDluNDlUVkdrdFViTkszT2ZmbFRJU1A0YnJ0M3dKTUhDSE5Vdnl1eGpVWWxI?=
 =?utf-8?B?M3JTN0JLRzhBTitIQm9EZUtwSSt6Z2pCODkyR3BYdzFwVWNEK2NvUXdlN3VQ?=
 =?utf-8?B?bmxpODQwN1NWbFVXREVEdDhWUXJwN3l6VTAzalVWMm5acXNmWXFJUWtCSC9Q?=
 =?utf-8?B?Q0hLSmtjaTBCZHllSS93aVRhVDNZMERPL2RuS2gwL0pxVWx4S1dCVGYrNWZx?=
 =?utf-8?B?V0l4aHhhV3pJQ0lIcFdoRTdLSFBBRzdUQjVPM2JQMFFXajNWcGtHM0VDemY2?=
 =?utf-8?B?cytWdVA2UWtvOXNoN0RWZ3hYeS9jNW5WSTA5RjNhalhEZ0N6QXhIN0t6eTd1?=
 =?utf-8?B?VkVVeEpOYlpDWE8yelk3M0RDaWFMdHZiTHZxclI4azRUeWtleHkvQ09GWEdR?=
 =?utf-8?B?cDFTMFFkckRHUmlxMmVwTVd2T3Y5WDRIMU9MU3laakRpRVlDK1Boc1JpN1BD?=
 =?utf-8?B?MDJKU3ZDb1J1NTdvcm5Mc0FoZ01wTCtYTWIrWUpsaXQ4TUc1ajZtNnNMbnIz?=
 =?utf-8?B?QTFtSzdaS2pxam9USzg0TGFQMFB2bklJQjJvQ200Q0E4a3lqdndxY2FCT1BY?=
 =?utf-8?B?TnNYSFc5MUd6ZTR5QnRPU1BhWTFFbWJWa3BJRmpJWGVOS202RlRmcko2QzRp?=
 =?utf-8?B?LzY3NnFmN09VQ3JyQ0dGaUp3UTFIZXRWbWVLU3JBaHBYbzZUUElxWXVmUENX?=
 =?utf-8?B?MFN6a0RqUWtIaGFGamtaeHRZcEFDaGFydW0vZkRMMGRXYUVHaTlXWnI0Wnlz?=
 =?utf-8?B?NTRIV3A1b0lpUXpPQXNpdWoxU1gwUVBVb1g0MXlVa1dXSWI5b1BOSllpQUdu?=
 =?utf-8?B?RjhaYUtmb2NJeHNBME9NVWNlclZzdTR5NVRrZDZVQXdSUXlxeW90V3JHREZh?=
 =?utf-8?B?RmZlbDFUWThteFpLcTRScC85bjd6dEZRYWFRcEZoRFg1ZFhQS0RXWHB4UTJu?=
 =?utf-8?B?VmVzREZGTjZjellDUHEvd3FsS1FETHAyeXpaTkxweXQzcWJGTTczOWVRbnVy?=
 =?utf-8?B?UHVwbzM0ZFg0MFdlbStqcHpZSVlTUFNxRGY1aXZaSVpQSHgwZ09TbUYwVGJE?=
 =?utf-8?B?azY0bFdNU21ndlJvN1BlUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a01rYktUdDhSWGFTdWZROTJ1azhETkh1WFhHVWpwSG5qVDdQWUp6Mk1ZMCty?=
 =?utf-8?B?dDNxeFA1OFlDelc4Smw4d0NJY2NYRlNlZTZJUDl1c013YkprdHRxVWpvbkVD?=
 =?utf-8?B?WXRyaHZHb08rR2VKNi9JRi9VMHR1d01yczNLSUhCNVVTTVRyWExlZGtrK2k2?=
 =?utf-8?B?dHRxa3l4bkhWTzQ4YU95eGdybFgybU52NDhOVVdXekJpT3lYNXptUU5oU2Rn?=
 =?utf-8?B?cnBuTUpsTk5WRVBaZk4rcnRNdm5sdUZtZ2t3ZVZvMG9yL2xBdStFdW9vN010?=
 =?utf-8?B?REMvd05MQWtaMEJuM0dSVWlFalI4OHY4WkhSQ2xDMG1ONndncFp2QmlpdFU3?=
 =?utf-8?B?Z3ZMVlpodWlEOGdqTWxFdCt0RzV5cWc1VkVTVENKUDlRU0NpSmsyTmRzNE5M?=
 =?utf-8?B?cHRZNXM0VXFHYXpQV29yMzRjd3ZBRlU0VVVPUDhyQVBvbVp2ZTUydUNrM1Vj?=
 =?utf-8?B?aGM5VEZHZ0V5cEZkclhrbm9DV0dWQ1lXTVBZNEl5eEIwd2JsejVYRmNpaTZT?=
 =?utf-8?B?SnUvYmlpem1Vb1JDaFdGNmxDSkIwWnQ2SnJqZUVjUjNZc1BFeWZ4MFU2NHVr?=
 =?utf-8?B?QVB6OTZ1VnFyakVTeW9WWk1rTnBLRU1mekFrMHBWMG55RFg5WW56K3R2YSt1?=
 =?utf-8?B?ZFVXQld1RWJmZmw0bXVBZFNTTnVnQm14bFRvZXFjMEFnc29idmY1WUhuYnJE?=
 =?utf-8?B?Ym04NERmTzlPNkJRR3RGTkc5MjJLeDdDSllTSkorenRSNFJRUzdFSEpnczE0?=
 =?utf-8?B?NTkxajlRWEVSRm8zNnJZbVI2U2w2ZlBhQ2VGNGc4L2d4U3o0b1NUTDZoRW1X?=
 =?utf-8?B?UjFkTmpFUlNHRks0ZmE1MHNtRU9rcy9oNGwxQjdIa0RtVnpBdHB0cFVnSFls?=
 =?utf-8?B?TmtFSGR0MlNXZTlMZm8xbElhWGZPNE5iM0Q1SXNtUDF1MXpJNkNMS0NPZWRV?=
 =?utf-8?B?MitWOHcyV1dZUjl1Nmk1aWtKR3k3ZlRLYURaQUh4WmxGL3kwOWxmY0xOb0tW?=
 =?utf-8?B?b0FCcTRrM001NDNrT0FGZ0RHZW52emVlM1dJWTZFTnozcDJ0SVdMZHNpUVl0?=
 =?utf-8?B?RVNTOHcxN3RycUpJODNLbTdLQ0t5aWZ5QjU0QjFXSEE2d1RxblZEbnVkTm1J?=
 =?utf-8?B?cTE1aGNTMjZRb3phNG16cEc2K0NzRkNtT1dSMk52Z3ZzcDJnclV3K0QyeDNC?=
 =?utf-8?B?S2hpdXZWU0k5R0oycmdWbUJHNndHZ0EwVEN1TTE0T0NTdXdOWHFWWE96Kzkw?=
 =?utf-8?B?R2NFM2xIbHFCN2pyYVpGS1RaUnVXOXQxUTN6TFNIUVdJWm9VVC92dmFvV3VT?=
 =?utf-8?B?MzBkK1pMQjMyM2lTU2VuNFY0Q0swNDVQN2N3VHhWYVAzWTdDc1ZGb3NWajFj?=
 =?utf-8?B?cTd4QTM5TTR6SHFCQW9IemtnNHlCaTBmd252TnVGRUFaeVpodHVtd3hTaGkr?=
 =?utf-8?B?OXVudWFOM3E0Q291djdiejNDc1NBMzJISFY4MVRDQTdwOG9ST1Zpb1hmODgv?=
 =?utf-8?B?QUV5TTBjeGJSbmhrSFd1dWo0UVRZNjE4UjFkSGd6ZE9ieUhJUmFiRE92TG9n?=
 =?utf-8?B?OERpNDBSb1RsYUJIQlY5WHcweDg0Y2V5UVA3MXZsRG1keTVobHhYMS9DamdC?=
 =?utf-8?B?U2owdVU4Q3A0V3o1ZkM5RFF3R2dLNnU3L2tYdW9tT2ptRUV6ODRDaW1Xc1pO?=
 =?utf-8?B?TFZXSzJHUmdmRC9jTFlsV0s2M3NWN1k0bkpmRkFvVmxjS1hFSktVb3puZGk0?=
 =?utf-8?B?ZWlwSGxkOTJncTQ1Vjg5MHF1a1NnQzQ3a0E5OHV4OGdxZnIwU1F2RHV1U05y?=
 =?utf-8?B?enZESkFuZ2JaTGNRTDNQNVZnbEo4L2FubnNTNGhsUUpqNUp4ZUVud0xtOUVD?=
 =?utf-8?B?d1gzVUVKVjk4QS9leWVrS1AwM0NPZUxsQ2JucnYvZS95Ky9Lalh3dTFiOXNy?=
 =?utf-8?B?U2I1YWVHU2x2VHVPWnlHTHlLbmdXdXE1RnU1T3FKYXJFOVdPYnR6bzNIbEhu?=
 =?utf-8?B?YWI4eGgraWszN3N1clBNTUVidWRiTjJzdXB2bDZiZGxDcFcweFBRU054QzhI?=
 =?utf-8?B?ZWhkUEMyb21haGduRG5QdDdkZjJhVVBIcFB1MXlEL2NsVWJZNmNyZm5lWnFy?=
 =?utf-8?B?NUFuRlJ4N2ZxeE0xN3BnQU1SU0taT1BveTk2RTJuZTdudFgraEJMNlV4dW1P?=
 =?utf-8?B?V3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	+3wwcWa7sDno0som8UGF+F+RH6iJ4BumGbqV/o0gNlWOKARVuFfxSjUWMduXIUc6gjn85hZVogfdkFj3E7i0WQQXT7H4n/nTJsZyRjuynWYwhJ+x4CwoyKLlmjoe9UPdPXHg62Lgk8jqf2+/RYA27opx8a8P6kXeQjSjgAnp+ZDXCvpYuq2PywPQOD5naRMaMPJSBkFJNWsZo1zjanDmwcjifdYYvLbXw9Ou+/ZKQcCn/G4aIywbeHXZfZDJNqy+ln0yoK51VYmJhjAPEbWY1qfWq6vazBoVQbdzcCdjkCM5dZAX+cq0R9WoGNVEVJWFbwBQx2i5yI4QmUvJjh0v/vS6RlIKzudTV6WB2VXmNDO1yl6gIdv+lBLERgo+3FaV+C1zOXuwzPh6ZYh6q7E8H5D53FAILZIBnh4KEW0u+J9+BIhkTHY1nTaKsU2tCrjcoGMm/BhLSKxik8RRp/1b0Xhpc3fGahPwKd6qAqgHN/58xEC60vkTZ7j3EOnNRNJ4pMGwhs3qyr69MV2PtSqYzOpN8tiQT1QqeTcqHDZpDC+kw/NKQEb86nFt8gyvGlrKiFLaJuKzdG8CeQ/iFC9gQWw4QROhEZXT8wxeJIORcNs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b285d562-be77-4120-161a-08dca1ae132a
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 13:33:39.9665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TFzLxDFCwgxPuLtptxC++hUEhwVgcQTRqc3rylXevXwfiiZsoUpbL51wtn4c70BQHGEU2cQinX5oUlSj95Wy9DYI0Hb9+EudEV3NjZWL2+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6518
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-11_09,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407110097
X-Proofpoint-GUID: oHVkABkuA6TpCW0DVywLjpjsVLACrZce
X-Proofpoint-ORIG-GUID: oHVkABkuA6TpCW0DVywLjpjsVLACrZce


On 7/10/24 5:37 AM, Juergen Gross wrote:
> Cleanup the private header files in arch/x86/xen by merging them into
> one file and by removing unneeded stuff.
>
> Juergen Gross (2):
>    x86/xen: make some functions static
>    x86/xen: eliminate some private header files
>
>   arch/x86/xen/apic.c          |   2 -
>   arch/x86/xen/debugfs.c       |   2 +-
>   arch/x86/xen/debugfs.h       |   7 --
>   arch/x86/xen/enlighten.c     |   2 -
>   arch/x86/xen/enlighten_hvm.c |   2 -
>   arch/x86/xen/enlighten_pv.c  |   4 -
>   arch/x86/xen/mmu.c           |   3 +-
>   arch/x86/xen/mmu.h           |  28 -------
>   arch/x86/xen/mmu_hvm.c       |   2 +-
>   arch/x86/xen/mmu_pv.c        |  15 ++--
>   arch/x86/xen/multicalls.c    |   3 +-
>   arch/x86/xen/multicalls.h    |  69 ----------------
>   arch/x86/xen/p2m.c           |   2 -
>   arch/x86/xen/pmu.c           |   1 -
>   arch/x86/xen/pmu.h           |  22 ------
>   arch/x86/xen/setup.c         |   1 -
>   arch/x86/xen/smp.c           |   1 -
>   arch/x86/xen/smp.h           |  51 ------------
>   arch/x86/xen/smp_hvm.c       |   2 -
>   arch/x86/xen/smp_pv.c        |   3 -
>   arch/x86/xen/suspend.c       |   2 -
>   arch/x86/xen/xen-ops.h       | 148 ++++++++++++++++++++++++++++++++++-
>   include/xen/events.h         |   2 +
>   23 files changed, 158 insertions(+), 216 deletions(-)
>   delete mode 100644 arch/x86/xen/debugfs.h
>   delete mode 100644 arch/x86/xen/mmu.h
>   delete mode 100644 arch/x86/xen/multicalls.h
>   delete mode 100644 arch/x86/xen/pmu.h
>   delete mode 100644 arch/x86/xen/smp.h


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>


