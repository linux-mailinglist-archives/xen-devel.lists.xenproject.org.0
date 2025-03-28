Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3937FA750C7
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 20:30:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.931186.1333623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyFPS-0000vm-Jg; Fri, 28 Mar 2025 19:30:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931186.1333623; Fri, 28 Mar 2025 19:30:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyFPS-0000se-Fk; Fri, 28 Mar 2025 19:30:30 +0000
Received: by outflank-mailman (input) for mailman id 931186;
 Fri, 28 Mar 2025 19:30:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qeg4=WP=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1tyFPQ-0000sT-8J
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 19:30:28 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16cf3dc2-0c0b-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 20:30:22 +0100 (CET)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52SJSl2l012358;
 Fri, 28 Mar 2025 19:30:03 GMT
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45hn877dgd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Mar 2025 19:30:03 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 52SIERhK029986; Fri, 28 Mar 2025 19:30:02 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2046.outbound.protection.outlook.com [104.47.70.46])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 45jjc5kp5r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Mar 2025 19:30:02 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by MN6PR10MB7443.namprd10.prod.outlook.com (2603:10b6:208:46f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 19:30:00 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::a088:b5e0:2c1:78a0]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::a088:b5e0:2c1:78a0%5]) with mapi id 15.20.8583.028; Fri, 28 Mar 2025
 19:30:00 +0000
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
X-Inumbo-ID: 16cf3dc2-0c0b-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=T+T7rFT0P2A0pGdngX
	ZFgh1nNRBEka4ENo8I6ZS6Sww=; b=GBSLPwmLitCvDkIwYeu5DnOVaxb7wfFNv1
	LthfXolDKKWOP/nl/cZ5V0+jjID2bwtPqkoU+OjaRp7ESO53cPiJxV5EYWH3LW/d
	kA8fWKGnsGyZ0K1IncQGfHbC7A+BMfuVCsWwww3DFb60LstIWb6SwMMq9YOHCdW9
	VHIw+oLcG+ntju1WlUd5AoZbdY3IJ1SgDygZrmfnlqeohlZlZwBk55KLU7yOZrMC
	9B/kgDBQtZdPufBBHo3t51aF5TW5OXHKEZhWlKGQgneecUpEupBBE6Pmoyq0bO5v
	LNe8dupfr6QswtXex+7Ur+f3g/2EMaQicnliSjrifXR/uTcnqK/g==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j0sarXL42yAzDqxmjnV1S2UzHEdom6bARNlixMN+jrXblDYTFnKYKYriWsUyd07IOW8Cm35tohfG090qZyd4HdRrchpvcahogyetsadzAOPyMjRSA78Ah7mzno6Kr0Jpi74nnpH5CMfkgupNwCNpqHcqNSfA+b/d1bfC+PVNeecoOHGWC20GabuK9+uFnc8SGnDai41zzb17N2MlPaYaObFhihxTS1m3+he5TXnAO8nj2cL1MjK6fhSTlW5XSYT116CxdOSugcWyV3g5ak9XGryXQzfByJiAQEmvPhNuw91ZCbB7DRPhxN5+ndjqxhdbYG1ft9vIlt1HINI/zwn0eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+T7rFT0P2A0pGdngXZFgh1nNRBEka4ENo8I6ZS6Sww=;
 b=s2vclAp8SnXnfj+kdWqZu2mz2BeO+fu/K24B5eDiMigSbX+jgdpKus5nXA1YKZoaG/hv0wtctVEdSce3Me/a+UnhHWtVgTxNj7XRcIiOgzIvzyuyzDquKxET18N5xrN5M5Dj0fG43/YZYqT14N/VPBIHfXUnWUK7vjMHHBNoi5Bk92Ww81/D9vJfqIab80hGU8J9vlbkV//24GQYqT8xeLkV9bo3N5Skoq4Pq2HQyTVO/IZeL8SbBZTVUMfI5m00nJ/U1qb4KqPFy7Ct1jC/GKkQt3uXeMtyCh8+YUHOC6skGPjImVWdJ5lRWsU/nTvE8QjOQ9tABJiK/mqJ8tAZjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+T7rFT0P2A0pGdngXZFgh1nNRBEka4ENo8I6ZS6Sww=;
 b=tXYReQpfe/Is/1cTS/qPk2A7NOf2X27p68FkfER8J3daOWhF1333tjFUn+EfYKZ8OKoiPmnDEmTFKAcbGglZ30PcLplk9MxCenBMqpRtBQu1Re9wiD6JuMAYtvNBJF4tOu8sNGv90f0KkE+ORg9HvCx1EyqdBH23tj38O31/gDM=
Content-Type: multipart/alternative;
 boundary="------------S2MpeCRIoJVuKYxJiiPN9bq1"
Message-ID: <38c48928-610a-4939-aca3-2b733e8a65a3@oracle.com>
Date: Fri, 28 Mar 2025 15:29:58 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: fix multicall debug feature
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
        x86@kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org
References: <20250327190602.26015-1-jgross@suse.com>
Content-Language: en-US
From: boris.ostrovsky@oracle.com
In-Reply-To: <20250327190602.26015-1-jgross@suse.com>
X-ClientProxiedBy: BN0PR04CA0074.namprd04.prod.outlook.com
 (2603:10b6:408:ea::19) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5009:EE_|MN6PR10MB7443:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d70a133-8b77-4381-fe04-08dd6e2eee1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|8096899003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZFFHdlU5WlljOXZHVW9YbkdaN3ZHaWVaVlAvRGpPWDBGUGlPRyt2ZzF5Q0Zi?=
 =?utf-8?B?d1hzaHVjRWd3VkpVN2JNZlh1MGVaa2JoZGhTMmwxVitMZVk3T1R4RCswZHZi?=
 =?utf-8?B?WjkyaDhrZjlpbTFkOUhKczVLdy83OVA1T2FTZDh5VUhvZVV6Y1daUjlwZ1VS?=
 =?utf-8?B?M2ZxSGNPNTk3OWpjVkRuV3p2ZWdMSmVzd2w4T1RBZmZXa0Z4M2JzTmRldzk5?=
 =?utf-8?B?Q1hwUDRpT0N1ZkNldm9BbDBrejVHMlhyaEhtejZ4NFMxM2ZremhRa1o0MmY4?=
 =?utf-8?B?a25wVXJ3THVJK0Jqbkh1VzB4NE5ETkpLbkhNR3Y5cElhMDJzbUlycTlaaEg0?=
 =?utf-8?B?anJ0ZnRUYk9DMHFsWVFyTnFjK0ozN1B0Tkh0T25lR29JRDZnTW1JZW5ORFFn?=
 =?utf-8?B?UUd4SVpYdXdEVXJpRzU4cWtkbGIvMnNPWWVJdlJDNm9hK2oxd2taKzdZM2cw?=
 =?utf-8?B?enJhUjdBZkp0V2dEZGpsTXgrVzcrT0dwU3I1Z1Y3Q3A1UDNGZGFqREJueXFJ?=
 =?utf-8?B?UkxqSHdBcEVLT3RTd0RkRFk1VXhqaVM4OEkvbUlacExZamFyK0dCRzFCQmNJ?=
 =?utf-8?B?WFFHSFpNTklLcHlOU1Zjbmt2ZEVDbVNrSXVvLzBSb3c0dkZDUGlmWlBIQ004?=
 =?utf-8?B?VyttSVo3MTU3TEl3QmlRenZ6Ty80QVJlSnh5R2hTK2hURTJqS1BGbDh5ckdO?=
 =?utf-8?B?SVpMUVBpbEdzRHBHYzAweW96ZVhVbXpEVjA0T3ZHUDA3eXEvYW9UdDZVa0l6?=
 =?utf-8?B?SXhmQ2pucHBwTUNwempHTFlqQndWMGJMdVl6YS9PaWRaRDJzbkR0NDNzWWdy?=
 =?utf-8?B?NjliOWlyS2FUTTRuSTcwK2Y5WHlvWjFjZE5zQnVwdEFRakNwcXh1ak5ML21r?=
 =?utf-8?B?em1MYnVxbTNPZjFQN3NlR3RIWlJvYkpJdGVmbVBmVVRzYVg5cDBXVEozWnQw?=
 =?utf-8?B?bzBKSG51OXlDbEdOZUZXSVp1YUFlVkQ3UWhRYjY1dXd6ckFvNk90aFZsRmZY?=
 =?utf-8?B?d0E2SU9XMXpQSENOSUgrRUh1V2s4enNhcFJOSURZRlZBdVYvZWxHaDREY1p5?=
 =?utf-8?B?dEsrVzJpdTJaK1hFVTlDaGFXSmR1aFBJSFVxOTZZa1diSCtCVWF4Z1l6MG94?=
 =?utf-8?B?SG95bjFiOS9oK0NYaFNPdDMvODBMaUdjUkF3WnZGL0oxWDVpZ01XNGp4d2lP?=
 =?utf-8?B?ZEpaZEtXYXo4WDdYUEtQUTJKbmVqRngyampTV2NZNG9MWndFcFFuNVVtU0ov?=
 =?utf-8?B?N1B5Yk9RZUZMU1NxNmRGcEtwd2ZESFZka013cnNNSW4rTGoxUUNiMUR5Smtw?=
 =?utf-8?B?K3FENUNYakZ5b1ZuWlB0eTcvU2dEaVhKcnptRk54T3VTTVhJMWlDS05nS2Uv?=
 =?utf-8?B?TUdub005ZkZiNzZ5dUlwRUdQZjlodzdUVm9JR2hCL3ZWajNkUnVaTFFrRnoz?=
 =?utf-8?B?Rkg4MkZaV2d0UjN3T0N1MGJ1QThIOTB2a21VbDBaQkNjN3Zjczd0LzNjVU5q?=
 =?utf-8?B?TDBpb21yWHJvZkM4bkt4b2dYb2VEWHlYYjNVOXNNYnNyTDljL2ZxNE1xY3U0?=
 =?utf-8?B?eStQK2FZckhITWk3c25SWFJSM0JBOXdiZmF4YzAvZDlMTjJHcmorcEtnN1Nt?=
 =?utf-8?B?MmZMSUNjTlNMZ2sxc3NVd1FMYmxmTVhhWHNDM1VQampvUDJvY1Q5NFVQWXhq?=
 =?utf-8?B?QUI0QTMwZGFpVjhLR1FMZm1vbGpnYWRESHRGSlJhVEVIbkJwYytJV1dtRkxZ?=
 =?utf-8?B?NmJZaVdkNUV2WU9ldXk0MVlvaDBiNll4cm4zdElvSTBQNjdiL2s5VTJldGtL?=
 =?utf-8?B?dlBnRE5uSjVKeThxMHJoMHAyQzlSbWF6K0F4bXVBK1ltM3lHVlB5ckZ0ZzRt?=
 =?utf-8?Q?K52GnJm/PafG+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(8096899003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHhRRlcyVGczWkpOdjhlN0FFbmRPL0RUenN6Zm9FVHE5dTV0S0hWYk9LODZW?=
 =?utf-8?B?SDdKN01iVkxodzVGRVFoaTRoSDdlbXBxdjluaVNnRS9zNTRreHNZQjFnUzJa?=
 =?utf-8?B?cUo1b3JVS0xBTmIwY0NHL0dzNkVmT2ViMkdDSXNsbzdGVjNKenlVVGt5NTQ2?=
 =?utf-8?B?MWNrSko3cE1Ibm9tRUpYSnkwdlg0YmtXcG5FWS9SenZEWTAzTk9Ga3hENFQ3?=
 =?utf-8?B?bVB4VFl0TXlMZVQrY3BMTFd6cTVTVkxqaXl5dW9mQzRlWE0xemh1TXg5SnJI?=
 =?utf-8?B?WjBhRFp2cmk2aXhXNTNkU1NzUVIyZEdvSWpsVjJVa1paaTdIbmk1b3UrMFNE?=
 =?utf-8?B?THhjWHpSVWFyYVJXU00wRlFUaksxOXNhMFdncm8xcWU2anVrZ2d2bkN6Wndi?=
 =?utf-8?B?dmNVOU5Sd29rYXBrVWZCekdjbStHZUlSQkNZTHVWclZNekp2Wi9lZ250V3ls?=
 =?utf-8?B?K0k3NzlkN0NGWVdoM0lFTnQwYm9heStkTDNBanl2UDhWekFtOVhxS0lnQWRn?=
 =?utf-8?B?U2pvRFN2dTcvdnhmcGxkR1lQMEJTK0JudCtPNEk3dThjTGNWMm9qM1puT0lF?=
 =?utf-8?B?aDMrVEwxekpiOWVZV01aSGxxRHZBY3RJUVp2ZkpQVWFuM2dIT2h0VldtTytt?=
 =?utf-8?B?eE90NE85d0R6K2k1cUxlMERnc3orODFuckdwZGpyWUtHanVpTHJ3QmFLYU9F?=
 =?utf-8?B?Q1ZIaXNERS9yYUdad2RkbVVxMXE3TzlYWkswVUJSeXI1b3AybDRVRGNCWUhl?=
 =?utf-8?B?QXhxdG1jM0gzSHlvekdsaE5RWVdnMEp5VnMwWVdjUFZWUUt2T1FkVXMrLzRp?=
 =?utf-8?B?ZTRuWnFWb2JFdTI5UEhJeVAyZGs0bUJjWkZQSW9ZKytoQTVINFRkdVlEd21z?=
 =?utf-8?B?NkxyT1EzMGtmQUQvdE1mMzVzWlQ3amZCVklxZ0RMN21vK2ErSEZKYTJEUTdt?=
 =?utf-8?B?czZOZEJFVWFBNmxneXJUM2hYNWMrL3pFeE5vajB1MGttc2s1eVBJQkI4eGxR?=
 =?utf-8?B?c09naXI4a2M5aThkQ1gwbGFxMkR6ZFh1VW1iSElmK3pmUzM3RFUvY1F6cUM2?=
 =?utf-8?B?RllTSVI2bzFEamFZSCtqKzJKbmY1eEI4SDVDMlBSWlNVRGNaRDZmQzduUmJZ?=
 =?utf-8?B?cmJGdDlwOE5JNUVhSzlrOUNMcE5sVS9EUmFNTTluOXdEL0JBTUFYREltYWJY?=
 =?utf-8?B?Wi81TW1pRFp6b1R2WkFwbU1MUDlBT1JydHlQSHo3bWZBaFJ3aU0rckU0K2k0?=
 =?utf-8?B?RlBQN2I0bUtyakR5dkpYVDRaUUFya3hkbW01SUFTYzhXMjBKbmdiUUk0L1U1?=
 =?utf-8?B?bjcyMjN1RGYzQzV3aFhLd0FPdU41Y3g1UXFldXQ3cDR6c2F4N0dmY2tjMnVx?=
 =?utf-8?B?TmovakRyaCsvRFRhbXhueTVEUDJMN2JMRGtMUHVrUTV3SVVNMVE5dVhJeFhY?=
 =?utf-8?B?eFlQeEV2MWs4S242VjR0ZDRucHFDY25XRGJCVDRxcjY4a2xhVmhJOEJ5b2ZG?=
 =?utf-8?B?WHgxQnNIdXRhS0k5QmpHRmtYQW9LNGl2MG44OEhpK1JVckJLc0RlZFpNNmxZ?=
 =?utf-8?B?b3lEemplbndSV2lnTlErcEkzcDBFQjRwSm9nZUZtamZQZVB6TVAraU01b2I5?=
 =?utf-8?B?NDZKNVYrYjluUENuWTJUbTRhaU9CZDJCSlMrRjJzMGFJSHVjZzZCSHRTdmdt?=
 =?utf-8?B?bXJqZjdqVmdKOFBBVUFuTER2Q25IV3FEZS9zNFdVTlV6RVBXOXRMTHFKTUVE?=
 =?utf-8?B?NUEzOFFPK3NTOFBoUUJlT21LVGgvditaSWRLTyt2eS9oWko2TGR6Q2NyWklt?=
 =?utf-8?B?eFZhbzhxeHNYWk13ekM0VzcySTFFSU9pMTRIZW5kTEpaSEVBa09rc1dnTno0?=
 =?utf-8?B?c2pPM2YvMUlPdzk3eTJoZTNHRlFsWmZLckpjMXd5VFZvcWlXNEZaOXlUV0hv?=
 =?utf-8?B?K1VSb0xQeUUzc21TWTJsb1JDdkF3bjI5WEJvY09mWllRdithTzNhc2MzOFhw?=
 =?utf-8?B?ME9menloS1k1YjBWaDFqbHRNWkkvdE1wUzZIUmlGVFc2SEw5Y21nNFBWUmxu?=
 =?utf-8?B?OVRrZEp3VVNXQVczYmRFcXJPSUpqbWR5Nzl4b0VPVUh4WXlsT0Q0REQzbGI1?=
 =?utf-8?B?UVU1WlFidzRUOXZTQVdkRnBlN3lpZk02RWNvdVpXK0RIZnhrMWIwTFFXbXZN?=
 =?utf-8?B?dUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LutmcWgc1xtBJafcwq/IW7FHHeCydm9UfEL9+EFTSWwh/St645hVDB51AEPqICVukeY58W/0y+QacGCyDvMcIpeer8BraATl2clhCZoq+cxQnBqk7aDi/XFtKk1IsfkNt/62MkNJ8GWIszbxrzENTpUmS15hjRClx5rrfbJvToXTKPksLo+vo5nyeAoJq4jxnsMj/U3NwU3jZS2C/MIGg95isLPMN9bpvutUDKfO1sY3Vgz6A6JLfh7cGdYsucLL6JpaOXc+QZ2iIxWd0U3ANp1aJEXGQ0UyjnOXpOgmWqNd95SKdQYMcd9Jc29c+xyPJeqyO5+EmzrClzE3nTr1l8fBSNrVvhLVjXITpZfVCZD008BoCfrQTCcFjenrfgXCrQHzmvY36vnpJpf+oyVbw1TeV0ZNHcz3+rO8ei3IqmCogKHA2CPxoz/bW70F9iACm/BCgQxBkxyg1a1aYrNeCFqWS49z30Em4XHfCmSquTrn+ocJdIlcprj6eKxkTph5onzkccj9Epe6GjPDNDBaUEq74HgE1tsgYvZkkuxzicDtKDb3gPYxuR1Hafo3sWX+2yfFd1ySohnxmTeSsGboyO13TU3RC26hA4sG2MlngeY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d70a133-8b77-4381-fe04-08dd6e2eee1c
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 19:30:00.0944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t+KQLuy970/amR/SoDp3HlZ+gV281wIBfrCZAc/1YDC3sdu/dAC0m3EzktVnmnkADZL/b7aMcCEf2lEXJ98pXGxjc2bOYT2hzHZcNdbbll0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7443
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_09,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503280132
X-Proofpoint-GUID: _2wXwAMteAJR8ZTXOUq-d8Orkmlw6lG2
X-Proofpoint-ORIG-GUID: _2wXwAMteAJR8ZTXOUq-d8Orkmlw6lG2

--------------S2MpeCRIoJVuKYxJiiPN9bq1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/27/25 3:06 PM, Juergen Gross wrote:
> Initializing a percpu variable with the address of a struct tagged as
> .initdata is breaking the build with CONFIG_SECTION_MISMATCH_WARN_ONLY
> not set to "y".
>
> Fix that by using an access function instead returning the .initdata
> struct address if the percpu space of the struct hasn't been
> allocated yet.
>
> Fixes: 368990a7fe30 ("xen: fix multicall debug data referencing")
> Reported-by: Borislav Petkov<bp@alien8.de>
> Signed-off-by: Juergen Gross<jgross@suse.com>


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>

--------------S2MpeCRIoJVuKYxJiiPN9bq1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/27/25 3:06 PM, Juergen Gross
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250327190602.26015-1-jgross@suse.com">
      <pre wrap="" class="moz-quote-pre">Initializing a percpu variable with the address of a struct tagged as
.initdata is breaking the build with CONFIG_SECTION_MISMATCH_WARN_ONLY
not set to &quot;y&quot;.

Fix that by using an access function instead returning the .initdata
struct address if the percpu space of the struct hasn't been
allocated yet.

Fixes: 368990a7fe30 (&quot;xen: fix multicall debug data referencing&quot;)
Reported-by: Borislav Petkov <a class="moz-txt-link-rfc2396E" href="mailto:bp@alien8.de">&lt;bp@alien8.de&gt;</a>
Signed-off-by: Juergen Gross <a class="moz-txt-link-rfc2396E" href="mailto:jgross@suse.com">&lt;jgross@suse.com&gt;</a></pre>
    </blockquote>
    <p><br>
    </p>
    <p>Reviewed-by: Boris Ostrovsky <a class="moz-txt-link-rfc2396E" href="mailto:boris.ostrovsky@oracle.com">&lt;boris.ostrovsky@oracle.com&gt;</a><span style="white-space: pre-wrap">
</span></p>
  </body>
</html>

--------------S2MpeCRIoJVuKYxJiiPN9bq1--

