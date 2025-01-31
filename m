Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CE6A23D8E
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2025 13:07:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879931.1290129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdpmo-0007mm-Q3; Fri, 31 Jan 2025 12:06:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879931.1290129; Fri, 31 Jan 2025 12:06:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdpmo-0007js-N6; Fri, 31 Jan 2025 12:06:14 +0000
Received: by outflank-mailman (input) for mailman id 879931;
 Fri, 31 Jan 2025 12:06:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sR5g=UX=oracle.com=harshvardhan.j.jha@srs-se1.protection.inumbo.net>)
 id 1tdpmn-0007jm-0G
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2025 12:06:13 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c191a0df-dfcb-11ef-99a4-01e77a169b0f;
 Fri, 31 Jan 2025 13:06:10 +0100 (CET)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VAps0j030380;
 Fri, 31 Jan 2025 12:06:03 GMT
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44gw4w03d0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 Jan 2025 12:06:03 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 50V9p1BL004348; Fri, 31 Jan 2025 12:06:02 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 44gfe4v1g8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 Jan 2025 12:06:02 +0000
Received: from PH7PR10MB6505.namprd10.prod.outlook.com (2603:10b6:510:200::11)
 by DS0PR10MB6126.namprd10.prod.outlook.com (2603:10b6:8:c6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Fri, 31 Jan
 2025 12:06:00 +0000
Received: from PH7PR10MB6505.namprd10.prod.outlook.com
 ([fe80::83d9:1bf1:52cf:df54]) by PH7PR10MB6505.namprd10.prod.outlook.com
 ([fe80::83d9:1bf1:52cf:df54%6]) with mapi id 15.20.8398.017; Fri, 31 Jan 2025
 12:06:00 +0000
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
X-Inumbo-ID: c191a0df-dfcb-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=zOWS532+MAEoMToqzEcaiGv9smLFDsXnuZHrC0ch6pY=; b=
	aLLAu21Egk+FMmDalcyCoyoBaXy73VHn7H5O/uvWUw78sWInNbV8BHntny2efnid
	ca9fyIw7oErhWVcg+TESkCSbCXrptfUqYB310mzKcPf6ksv3Mse961BC2kEnNr51
	V+L03MhfAsiWgWtGRug8SwRudHc4uiC0W/Ek+QkBUxbCBmR5KFUiSVE5hl072UmG
	QrgTRldEBIkTlUMGcpKLCwJRUtXVIrWRMcjFSaSKusYO8qmH8qzJ+nN8+QJnHb2c
	kR7W7bG7A1oU1yZfhLH800uOrHrnzdWhozVePOlxnynEmXCkBtsqVFe8PNDAobIh
	n+Dre+YvIlixnttPBQknXw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yKDvyEYOSf0Ur7fucuvvqqu8i3JZnqdxY8En7voL1f6qyhOQCL+uBb56alZAbOcsmuzl4zkMWJMHm1SMHD2CuVptdxoB61HuKloH/T2dt92e4lhXSj7yFaeJ0+Zst5FPrGNjsQJ+HLENZXH8/ZaRoGjUgBt46wJ/LE0v9bijkMpj/pDFOdod++ZH4lwYQnZEYoluq1dszw3n8TA06wQtUxWMFMnM7xjNCZxVgRqS0DBvn9DPrJXJlC2Cy5tNWbj0SuYeoaKZ6oRTKsQ+W7d+zWDCqAKES7rbVbeXUmI0k4feWZFf45dM6mCHuRy3z6lfI8hGNL3znMXHGM+taXD9xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zOWS532+MAEoMToqzEcaiGv9smLFDsXnuZHrC0ch6pY=;
 b=WVAQP8QRZ1SVuqDZJdbEDqmbSHyCTZfDzc6kEuBtNk5Qv36vS9pZcznv9y00XzszoqxpwVRTn5Jjr8YGyhIv4yCUsRXCzvBt7AKy7WwLDDKU9Rpn+5/u5t8bi1iOJtye3+M2VQHgP2hvl9KM3uACIjPJ2OohlCzA78PPGEXsbA8KAtu8EtSrOOIb/bWQbSia1ZqPxFq82pRXoAUWLpmgOuS1J2bvhaeunxo3c5xmXFHemID7vxy1OTrbSAemmszy1z7V3WUCwh2JwVzoQhOECBFZ/UuE62jRvLF2ywDC6vY3b4Hum3ttAD0xhSkhHwB19BhEOSocW97DhepaaAV7Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOWS532+MAEoMToqzEcaiGv9smLFDsXnuZHrC0ch6pY=;
 b=WQEwSZeCOiqCNHQl+RL69Y3p3XOBCqmWEIEWNMVAdJwBdaCmkEDV5+V65+VECW2JmLtl1xS6gYjdaGHQdG5E2ZbuCfzFbvU6RrwZAb+/TJvT1yqFBQLVSZ10/bQS7u6nX3tIxFQPsBf8uuipSwtld2sftjKmxMzoIYKB44v4vgs=
Message-ID: <17ed9a71-227c-4e7f-8fcf-402dd00f3837@oracle.com>
Date: Fri, 31 Jan 2025 17:35:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: v5.4.289 failed to boot with error megasas_build_io_fusion 3219
 sge_count (-12) is out of range
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
        Greg KH <gregkh@linuxfoundation.org>
Cc: Konrad Wilk <konrad.wilk@oracle.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
        stable@vger.kernel.org
References: <7dc143fa-4a48-440b-b624-ac57a361ac74@oracle.com>
 <9dd91f6e-1c66-4961-994e-dbda87d69dad@oracle.com>
 <2025012919-series-chaps-856e@gregkh>
 <8eb33b38-23e1-4e43-8952-3f2b05660236@oracle.com>
 <2025012936-finalize-ducktail-c524@gregkh>
 <1f017284-1a29-49d8-b0d9-92409561990e@oracle.com>
 <2025012956-jiffy-condone-3137@gregkh>
 <1f225b8d-d958-4304-829e-8798884d9b6b@oracle.com>
 <83bd90c7-8879-4462-9548-bb5b69cac39e@suse.com>
 <b4ab0246-3846-41d1-8e84-64bd7fefc089@oracle.com>
 <de6912ad-3dba-4d66-8ca2-71a0aa09172c@suse.com>
 <686986a0-c981-4aa3-ae88-92a34368129e@oracle.com>
 <5a7d969b-b2ab-4fac-b95e-4a536e2c8d5c@suse.com>
Content-Language: en-US
From: Harshvardhan Jha <harshvardhan.j.jha@oracle.com>
In-Reply-To: <5a7d969b-b2ab-4fac-b95e-4a536e2c8d5c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KL1P15301CA0047.APCP153.PROD.OUTLOOK.COM
 (2603:1096:820:6::35) To PH7PR10MB6505.namprd10.prod.outlook.com
 (2603:10b6:510:200::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR10MB6505:EE_|DS0PR10MB6126:EE_
X-MS-Office365-Filtering-Correlation-Id: af34f866-1afd-450b-b360-08dd41efa05a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eEFDNW5vcnJHY3lBcHI1T2xXTTlSWi9jNTNlb2VPcDlGeUg2YXAwaDlUQlA1?=
 =?utf-8?B?YklLODNNczRnMTNrZGNFMjI3N011RmtBRGtuLzFoWEErTDJuSS91ZnNNT1RB?=
 =?utf-8?B?L0tKb2lCd1RubjdHeXZNUlAvdkZscXlUank3WHB3RTlMY2RFRnB3UlJadk96?=
 =?utf-8?B?Ujllbkt5bElHdTF2SFZ5Rk5lSEEvVFIyYVlRZ2h5SWtPZy9LZDBHaGFwcDJT?=
 =?utf-8?B?QTBqT3hsNHF5WktZZzlweGpMMmowVHhUeVZrMHVrZklucHBIM2xSanRHUnZR?=
 =?utf-8?B?MHRZSUwybFlZMm5VNTRVbVFkZXdES3VyaEhiMTk4aEl0R3ZQZHJuWm1RamZX?=
 =?utf-8?B?b3VqeW5NVEhzMTF0YkNxTlBEcmVYWUVLWlBGN2hmNzJ3TFJieThyWXdhRnh0?=
 =?utf-8?B?SSt5UkZ0OStCSnNVdE5CUFZvMktrSnkreWQrT1c3ME1HSm1oT3ZuSjY1OVdT?=
 =?utf-8?B?NjhCWnN1QVRIN0YxSmNvSVFSamV1RjQyTjQwM293c0c5cEhHNktiV1dFRXFV?=
 =?utf-8?B?eWdLVGtzYzAzZ0VxQzlTS21KbkZtNGdGcXFnMU1taDVyUi9KV0lNUU5LQ1NI?=
 =?utf-8?B?WTQ3RVZocXQzeGladWRnUHdiK3Mvc0hldWxUdDhxS1hZaXVkL21JQ2tvZERt?=
 =?utf-8?B?MVZFZHJkYWFiSis3TUNTWXNZd1Y2c2o0RXU1SytoSFJQVzBSczFSWUpyQXQ2?=
 =?utf-8?B?N3Q4cGs2K2liUHo5MnJrM244TWRGNGlTdURFY0FtMnhtalFQQllwZSs5RTdY?=
 =?utf-8?B?MUZPaDBHQUVqN1RVUkpJaHQ2OWVPc0IvTzNXNjh3c2pvenNyYjI5WjRtWGg0?=
 =?utf-8?B?V1Z3QjBPanVndDZvbTlQRVNpcU9LM0FJdlY1dEFzNjQ2U0lFa3B5ZjUyZm5Z?=
 =?utf-8?B?SnlLSHU3NGw2MktvTmthcVNLeFMzVmhJQzFqRklydjhWRVNYUW9mKzJoVVg3?=
 =?utf-8?B?b0ZpY2RQWDh2UmVFRUIwUkJNaUZKVGRpZHVxWDRuWUFGeVNlUmhpM2lSQURw?=
 =?utf-8?B?NEt4Z2ZtR2d6REQrbURMcVVobEZTalJWaUQvVUppdHUyMzRzZklZVWlYVDl2?=
 =?utf-8?B?MjN5Mk96VFpKYlU0M0dkdXRRMUFKU0o1c0VvSjVGdnNWTHVtTXp1eExKZlFI?=
 =?utf-8?B?alJOYWcvZ2ZzYnFic3d0c1FBU1ZUMjY4N3p5U3hRMFJZS3NpTVZZT3VNaS94?=
 =?utf-8?B?TVVYSVlqQXpuZHJFaVJGVW9oa1dhdFo0UTlWM0tsc2NHaStOOE5KVkFEL2Y4?=
 =?utf-8?B?SE9WZFBVK2paZmV2ODZ5Q2NEcFA4Y0VvSXB5ZmRCTTE4aStXL0s4R0Z3NjRn?=
 =?utf-8?B?YXVwbStPaXJSTkNJazNKSWVGaFd2Qndxc0c1OVMybUdFTllKRkk5K1BERXcw?=
 =?utf-8?B?Qy9aa0Z0aE95N3BmcUpCZHhpNzc0WWJiZXZiNFdXclcxd0RZZXJlZ2xVa1VS?=
 =?utf-8?B?RnJXa2dqK2ZCejJBemllQ2lMMHFuZXQxRU1WSDZRcWx6UW93S2Z4c3l0Tncr?=
 =?utf-8?B?QjFoNVR1UGlqT0c2N2dtbS9MdzhoOTRuRzBWUWtoc0xBS1hnQ0RVNENLMGZs?=
 =?utf-8?B?enNVSi8zNjl5elA4ckNjNXJXQUZUODl1QlU4c0EyMU41YVAvOGxPMDBSblpG?=
 =?utf-8?B?VXVsR2dMRXlqeHFncUhNc2ZLZ0dpS3ROQU0zWUt5TlJjRlRuc2FhY2tQZnhz?=
 =?utf-8?B?MXRmeXVFbnRnTjhxOS9TZkp1UzhtbW8zTC9UcGtwLzdOblIxL1Aya2NWN2oy?=
 =?utf-8?B?ai9YeUFHVmVIb091SVF5a2lZVVA5cEFwKy9Ra0tSQjdvSk4ybFRkSmFpY0F0?=
 =?utf-8?B?WS95MDd5NHJXMVJRSGdLR0ZNb2tNazJrQTZmWDJWa1NLajRUSnI0NmE3Tjgx?=
 =?utf-8?Q?Cp5Rz95Hocrpn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR10MB6505.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzgzNnFIOUFUWG41UjJJOW1CQTRFMi9taFB1TmFQQlEvVWJhT1d0VVhFMjF6?=
 =?utf-8?B?cWdTRUNxYUplR1BjbkUyRjU4c25WbTJobjZvYzlHaWZMeDcwQ3VkNXhna0tC?=
 =?utf-8?B?RnBWbUVheExHNjIxYXVwejVrK0R4QVErcCtoWndZaGVoMHFvTUFGanlESWYv?=
 =?utf-8?B?UXVmR1hHVFVOSFNWSzk5OFFLdzNYcTA1amRMeDdXbDBRZ2JHaW5CY0xhNzdF?=
 =?utf-8?B?RDh4bW9ZdlN5RjhZNDBta0t2dUpKZ05Iakl0dW5nWEprNFlBZXh5MUw1Yk9D?=
 =?utf-8?B?cDIvSUJVd0FNVWNiNnJBM200c0VhckdSUzE0ZklkRTYzd1pkOGlhckJwZDhx?=
 =?utf-8?B?Q1ViMFlRS1JMSUk5WEVTRUZmVi92eWhrR3lMUnltcjlhbUc1QVhmOGs0b3lT?=
 =?utf-8?B?YmQ5VityZ1R3cmRyVnUwZzJsQUtlV2dEY0gvM3lZR2NrdC9QQ2ZzbzVTYTlF?=
 =?utf-8?B?TDBuK1FDcmpBZlZQUjI2clZMcWpvNkZ2Mk5ZcVdRbzVXMVNxSHRhRCttajkv?=
 =?utf-8?B?UGxRb05aYk1oZDZYWlBqcTZnRkFTNXdwT3hjQnk0VU03ZVZaSHlmNEhmT2hN?=
 =?utf-8?B?YVEvYTNjZitYQW5GNUNJdTYwSnhPMmlDbEx4bDE3ejhjTnROYTdzeGt4eEZG?=
 =?utf-8?B?M2xjenQ5Z3FlUURjenhzT3phblcvZnFJU0N1TmZDc3FjSDYyWVovM3ZGQnJQ?=
 =?utf-8?B?WmFTT2JJV3FmTUNlVThvb2dmSUR0SVNjWWdBNkowMTMwUUpyam1JclJNQ2tO?=
 =?utf-8?B?N3c2ZjMzQ0lwMjFMZ28zOGc2RkxiN2gvaTNwNG5wWTRZTmtGVFZINnprRjJ1?=
 =?utf-8?B?YkM4SHIwd2JzZ0tySGxKRVFzenRNTjZyN2VVaTR6eTJhVFpqalpheDJLbHoy?=
 =?utf-8?B?cXgxbEcyTld2c0JVSnFMK0VMNFlwN1Rmb05GaHlxL3ZPRlF2L2JndmtYNThQ?=
 =?utf-8?B?MTZxcTBwekI3a0dxcDhzRGVya2VQeFZvdGVpTC9FSThvQUZ0Z3dWcG4wSDFa?=
 =?utf-8?B?MWQyeEo2eGZxNWVSbFlzQUpLTjVmMlgwM3RCd25LNU4xemRlUUlpKzdubkoy?=
 =?utf-8?B?Z0NLeHRqQ1J6b280Q1pVWDkrbmcvcjJGd05Xd3dsWldnSThiZ1FOdjQwNTAx?=
 =?utf-8?B?aElZR0tlN3kzSisyNFNjcnBqTUx1UlNsSktpa0RmZ2JIVVlsVll2UnRBc2ky?=
 =?utf-8?B?MFRYbXRYTG5DYllRRFM0RGxUSnU2N01YNDRxdHA3SUlKTkRYQ3FrQ3JEa2c5?=
 =?utf-8?B?RnRicCs2eHdLdzlRM2RMVEZ4aVZuZXpBVEdhK0NXWCtrZEpVc29EVXFNMlVw?=
 =?utf-8?B?VXYxWWZuUFZvOFRXSThTeGRXemRXMzRaQVZENUN1NTZtUnhtTUFuelIrTGJC?=
 =?utf-8?B?c2hKdStUdk5IN0ZURXVtbGE0eTdnNndrdU5mM0RKUXZuRGk3cGgyVDhxUDF5?=
 =?utf-8?B?SmlybGN0MVFsZDIrTUNhY0p3REh1Y2xRUlJCNGNrTmpkdjlkcXVNLzRVa1A5?=
 =?utf-8?B?bzd5c3VZd09ISUFxRitrMHcwc3FyV0pLSUNaZmFvQ0ViM29xaW03aTRKZkYy?=
 =?utf-8?B?cWhmeSswQWRrVnVTSitMRXJTQVhSMzNVWk9EUklXK3JuVHpseEJRclI1aG5V?=
 =?utf-8?B?RW1FZm1YaG9Ia2d2RjRYcHZPRS84WU4vTTdSbmxHbTZzbTBsZTNiZVg0cFpL?=
 =?utf-8?B?c1NZdU5YaE4xdkdVcFczQTgycUlkZlRQMnhtMmZIL1dFTWFWUHRPNGNmT3Nv?=
 =?utf-8?B?allabTJneWREVEQ3SjBQMm1kV3JWKzVFRkpHc3F3T1lRRVhCWGk4aHNjekZD?=
 =?utf-8?B?QW5CK2dyTzRFTjhFM3BDbDNqYWVkQ0d6bk4yYXExSmZvcGh2YjEzdDF4Qlhw?=
 =?utf-8?B?ek1INWRLdFpzb0xtRHNjRTVUNlhZQ20xalNtR2hKMEgrbjFQS3hUd2ozajRX?=
 =?utf-8?B?VklVblRIUFo1dzRxT3BrTXpzZ0NZeUg1ejZMdzFUWDFTcnpyUHdOOU1XNDFC?=
 =?utf-8?B?SnVpU0lCb3R5VHVobzBSK0xua2NDdjhaWUxqTjdOZ3hqVU9jRlZYSU00WTZ5?=
 =?utf-8?B?L1ZJOWtzeFRzc2huRWdFaUJGSUNveW4zV1VzRHM3WU9iLzZobDRhVW9DdFdu?=
 =?utf-8?B?WnFkYkNqbk93QWs1ODA4RFVzeDBwQi85YU5ZQW9jQ1BtQVlDWUc2R09qZGZi?=
 =?utf-8?B?QkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NsUtxYOgkC4Zif7ikn/qggygC7PBunaF1vRgI4YqmTzJ6hk5GH9tsmzF5/7LZ49YrpEflp2vZDklOJZdtm2l2wBeIsi3aNXDkVskF25s3Wpv4rieaAlO17fs6IJMHpJptQekWlLcIsb4+ppZMvq9oohmCIRSkecnQfSEId+xrUGYAzRI8K76LqOoX8y09kxGAd6lKt+LSVderAGG1ZlRmbdgUFmCnPsvFVx4s4h0jjQ1WJnZ6tgYSw8UzC0R36FFb8pTHrB/nwt/QyBDTMYK6YDyakTi67YW4vzXfa96ej8uR7296edZinimRd/f++CE1i3dpibmOOYo4YVAcG6kRAgYoJepRj+ZqGoCaoh88acx/rjJT62m0GEpNcqA5mOVVsSd/0ffnjqJNpz5H85YJkgyUH7LwMwrSeTg7ZXVMAY3Q5Z/r2t7lBijB5jU+bW3oUujTlanIUtKOTzh/XbiiU0tZKex3BFhtwmiCuNRb1tz8C5hNc2sJNimAilbCm2mFk8TuAZyW3xdfirSSV2SGzjCBvvunkCClcrcZea64nlCBqTZeHmuj8uCLgNqHgnxsWtFdBNtNIDgqGelesi2AAhJBjVlpYJBancp3WWGfB4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af34f866-1afd-450b-b360-08dd41efa05a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR10MB6505.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 12:06:00.3708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fbvI8minBtQx8nN39u+M48dFXl5Qjp2S/MfvaFo3Dp+JfNn5rrNqp/AQsuAWAKermlMTycWMp82vRbsUBh6xLUEwNCGH1i4Bm1R1NPqX2qg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6126
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_04,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2501310092
X-Proofpoint-ORIG-GUID: fJRy3y3cRbMWy6Gud5vx7Cj_ipm5wUk_
X-Proofpoint-GUID: fJRy3y3cRbMWy6Gud5vx7Cj_ipm5wUk_


On 30/01/25 6:05 PM, Jürgen Groß wrote:
> On 29.01.25 19:46, Harshvardhan Jha wrote:
>>
>> On 30/01/25 12:13 AM, Jürgen Groß wrote:
>>> On 29.01.25 19:35, Harshvardhan Jha wrote:
>>>>
>>>> On 29/01/25 4:52 PM, Juergen Gross wrote:
>>>>> On 29.01.25 10:15, Harshvardhan Jha wrote:
>>>>>>
>>>>>> On 29/01/25 2:34 PM, Greg KH wrote:
>>>>>>> On Wed, Jan 29, 2025 at 02:29:48PM +0530, Harshvardhan Jha wrote:
>>>>>>>> Hi Greg,
>>>>>>>>
>>>>>>>> On 29/01/25 2:18 PM, Greg KH wrote:
>>>>>>>>> On Wed, Jan 29, 2025 at 02:13:34PM +0530, Harshvardhan Jha wrote:
>>>>>>>>>> Hi there,
>>>>>>>>>>
>>>>>>>>>> On 29/01/25 2:05 PM, Greg KH wrote:
>>>>>>>>>>> On Wed, Jan 29, 2025 at 02:03:51PM +0530, Harshvardhan Jha
>>>>>>>>>>> wrote:
>>>>>>>>>>>> Hi All,
>>>>>>>>>>>>
>>>>>>>>>>>> +stable
>>>>>>>>>>>>
>>>>>>>>>>>> There seems to be some formatting issues in my log output. I
>>>>>>>>>>>> have
>>>>>>>>>>>> attached it as a file.
>>>>>>>>>>> Confused, what are you wanting us to do here in the stable
>>>>>>>>>>> tree?
>>>>>>>>>>>
>>>>>>>>>>> thanks,
>>>>>>>>>>>
>>>>>>>>>>> greg k-h
>>>>>>>>>> Since, this is reproducible on 5.4.y I have added stable. The
>>>>>>>>>> culprit
>>>>>>>>>> commit which upon getting reverted fixes this issue is also
>>>>>>>>>> present in
>>>>>>>>>> 5.4.y stable.
>>>>>>>>> What culprit commit?  I see no information here :(
>>>>>>>>>
>>>>>>>>> Remember, top-posting is evil...
>>>>>>>> My apologies,
>>>>>>>>
>>>>>>>> The stable tag v5.4.289 seems to fail to boot with the following
>>>>>>>> prompt in an infinite loop:
>>>>>>>> [   24.427217] megaraid_sas 0000:65:00.0: megasas_build_io_fusion
>>>>>>>> 3273 sge_count (-12) is out of range. Range is:  0-256
>>>>>>>>
>>>>>>>> Reverting the following patch seems to fix the issue:
>>>>>>>>
>>>>>>>> stable-5.4      : v5.4.285             - 5df29a445f3a
>>>>>>>> xen/swiotlb: add
>>>>>>>> alignment check for dma buffers
>>>>>>>>
>>>>>>>> I tried changing swiotlb grub command line arguments but that
>>>>>>>> didn't
>>>>>>>> seem to help much unfortunately and the error was seen again.
>>>>>>>>
>>>>>>> Ok, can you submit this revert with the information about why it
>>>>>>> should
>>>>>>> not be included in the 5.4.y tree and cc: everyone involved and
>>>>>>> then we
>>>>>>> will be glad to queue it up.
>>>>>>>
>>>>>>> thanks,
>>>>>>>
>>>>>>> greg k-h
>>>>>>
>>>>>> This might be reproducible on other stable trees and mainline as
>>>>>> well so
>>>>>> we will get it fixed there and I will submit the necessary fix to
>>>>>> stable
>>>>>> when everything is sorted out on mainline.
>>>>>
>>>>> Right. Just reverting my patch will trade one error with another one
>>>>> (the
>>>>> one which triggered me to write the patch).
>>>>>
>>>>> There are two possible ways to fix the issue:
>>>>>
>>>>> - allow larger DMA buffers in xen/swiotlb (today 2MB are the max.
>>>>> supported
>>>>>     size, the megaraid_sas driver seems to effectively request 4MB)
>>>>
>>>> This seems relatively simpler to implement but I'm not sure whether
>>>> it's
>>>> the most optimal approach
>>>
>>> Just making the static array larger used to hold the frame numbers for
>>> the
>>> buffer seems to be a waste of memory for most configurations.
>> Yep definitely not required in most cases.
>>>
>>> I'm thinking of an allocated array using the max needed size (replace a
>>> former buffer with a larger one if needed).
>>
>> This seems like the right way to go.
>
> Can you try the attached patch, please? I don't have a system at hand
> showing the problem.
I tried this and got this error in an infinite loop again:
[   25.827922] megaraid_sas 0000:65:00.0: megasas_build_io_fusion 3273
sge_count (-12) is out of range. Range is:  0-256
[   25.828447] megaraid_sas 0000:65:00.0: Error building command
>
>
> Juergen

