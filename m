Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFC7A22407
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 19:36:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879253.1289469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdCuu-000564-Hu; Wed, 29 Jan 2025 18:36:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879253.1289469; Wed, 29 Jan 2025 18:36:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdCuu-00053J-EW; Wed, 29 Jan 2025 18:36:00 +0000
Received: by outflank-mailman (input) for mailman id 879253;
 Wed, 29 Jan 2025 18:35:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XMr0=UV=oracle.com=harshvardhan.j.jha@srs-se1.protection.inumbo.net>)
 id 1tdCus-000539-NB
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2025 18:35:58 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dfec467b-de6f-11ef-a0e6-8be0dac302b0;
 Wed, 29 Jan 2025 19:35:56 +0100 (CET)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50THYxGV016136;
 Wed, 29 Jan 2025 18:35:52 GMT
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44frus05n3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jan 2025 18:35:51 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 50THUDKk034375; Wed, 29 Jan 2025 18:35:51 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2172.outbound.protection.outlook.com [104.47.73.172])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 44cpda337y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jan 2025 18:35:50 +0000
Received: from PH7PR10MB6505.namprd10.prod.outlook.com (2603:10b6:510:200::11)
 by SA1PR10MB6494.namprd10.prod.outlook.com (2603:10b6:806:2b4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Wed, 29 Jan
 2025 18:35:48 +0000
Received: from PH7PR10MB6505.namprd10.prod.outlook.com
 ([fe80::83d9:1bf1:52cf:df54]) by PH7PR10MB6505.namprd10.prod.outlook.com
 ([fe80::83d9:1bf1:52cf:df54%6]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 18:35:48 +0000
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
X-Inumbo-ID: dfec467b-de6f-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=/L0xt7Uxd0hRTo4eK6IeIZXmUxkd0w7/SWH6iBlniYA=; b=
	a+HnJi2YlJasbG40P49ochtObrCVjPw3Vs51OVqIYvDAQAKr5opDzoX6ruFVCKFi
	tsOzipkVRj4AgHv19Ek1+RLaOmwbfqCHBnf+xJtXKTZkHWDGCW4ShXRVaR/UARZ8
	9XqKNKf8GA9vgGxH6TIkfWitgqxFos7M9ZuAywgk2tZUVZvOmsND1wFeejrP/akj
	aTukxwJkUTzS0D6QpEH92t1OMzgdGggatLUwcDrV62aYTZWWs6X248wbxmCUZqC/
	Q0OXCRIjTBrzgHT05Bjlfr49y8oRJFDv1lby1bGtxo5//7Xj2ERss3cEkaPF1CvE
	bEFqHtb8vYsmBTRE+Mu6VQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kc8JeK8V0hW6+C/0VS7fc/RsK8YsQ56O7ubIisE+MU3TyHYY9P56jqc7Gcwlt4pfXiHLqvAnk9ZRG2kePcth/4QpxTO05yWhSZIVwIU4yW3lSuhgtt+q9U8KsvWuApSf02UPdaS3lCQTRr7z9d90n2DwjLPvOEMY0rZrqjmgc1CULKjlUJR/1rm9NdVrXzfExmlf1sOUVcGgNBeHDWTAiGK4IFAFYv/s60G7xowsShtzwIxTIDKmHTceBzfVuPcGxEnnsajV5ECMfF0HhlimyeaIN4nrlr26n9259M/nOa/zKR4CGFRXx2KlaIElOwoBjUnymQGP5boJzDL/DnYvGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/L0xt7Uxd0hRTo4eK6IeIZXmUxkd0w7/SWH6iBlniYA=;
 b=RRLoC4xZrZsjI/wlsU0KNTnSx7WPicVZkQXsU3UXkdT3+cKt2RQDvAP1FzUO2FmpZup7w/3ABJyBHnWWo1L5R6RomXV6e9oK0qr6QBOSTsqb+msn6z+iyel8jqo+l11ap0KnU02b7zBuw/V9jWcuteIXSCeBawppsMjFfwyzoXxWgm/XQcd8GYwxJBLbujEGbnJMoWVLMHRdmdCR8TwgjjYeN1D8Gv4n6Xid98TjfmmCOyJF7AwPeTVkN+WZCVbacf3AzThyKYxxr4q328RbrPsO7v3xaRUWBBssuO/a17CL6SuKjBZuhCWbP5l/vBiV8f+sFed/35oBRG6qoxAdJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/L0xt7Uxd0hRTo4eK6IeIZXmUxkd0w7/SWH6iBlniYA=;
 b=y1K1HokE09iKWc3EHAuZPigZdbCTVbwFPT6ZLyLKA64XruGLsTrVB5QdDxSJMzoJ9rdTWT2rownCssAzP28qnngVD7T6AAXpS1ctiby49eLZ4mX+nOmsueH1kKvZCkg76K+qICacWO2HqUPZEI/y9M8n7l7+IiYDjxUToUuuBeQ=
Message-ID: <b4ab0246-3846-41d1-8e84-64bd7fefc089@oracle.com>
Date: Thu, 30 Jan 2025 00:05:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: v5.4.289 failed to boot with error megasas_build_io_fusion 3219
 sge_count (-12) is out of range
To: Juergen Gross <jgross@suse.com>, Greg KH <gregkh@linuxfoundation.org>
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
Content-Language: en-US
From: Harshvardhan Jha <harshvardhan.j.jha@oracle.com>
In-Reply-To: <83bd90c7-8879-4462-9548-bb5b69cac39e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR06CA0001.apcprd06.prod.outlook.com
 (2603:1096:4:186::21) To PH7PR10MB6505.namprd10.prod.outlook.com
 (2603:10b6:510:200::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR10MB6505:EE_|SA1PR10MB6494:EE_
X-MS-Office365-Filtering-Correlation-Id: 364ca0e1-e8ba-47f3-0687-08dd4093bfc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aWdvYnFXTm9RZ3NOc3NSalloSndxK09qS0x0WFNRL09MYUZpK2g4SjdhK3Rz?=
 =?utf-8?B?SkY1T0RhOXAvYTV2V291WXRyMWtnSkk1SnR1VFRWVGtkaC8ySWRKYStMQzNZ?=
 =?utf-8?B?c1ZPbDZLbk5heHRra3Z3MkM0MUY0c2dTVkRadW8rNWlUVzBYbXE4ZnMyZ3I4?=
 =?utf-8?B?bnVoZ25ya3RCMjUrejY4WjE3UW9PemlNYVRDRWp6Zm9oUzRnR3haV1l5cnlk?=
 =?utf-8?B?bDBkdldISVYrZnpTL2x0NEVwNUJkL3FWTlhEMWVZR3dWSW9iZTNHWjRTZkFw?=
 =?utf-8?B?TE90N1pPUDMxWXFaSzZUbFN2bUhSaHNUWFNoa2RqbGNKYmY2MkNpQy8yZ2Ns?=
 =?utf-8?B?SGN4Mkk4R0o3ME9TSDMwWFdjRnI2bk9Jc0ZkY3lEL3cwZnBMUHlNOUh2SHIy?=
 =?utf-8?B?aWJOWXU5SzlHbURwV2oxUHNHV3o2WXUzZjhJR0tGdEpHVHgybitLa2tLT3hT?=
 =?utf-8?B?ZS9wZDNpOTVHdjBIZUc5b01jTDNDSXBZQkJ0MEdWUFpUdDVRdFpnKzByWVZX?=
 =?utf-8?B?SVJZTzRhckJHcmdFRzcySWJFWjByWkhIMjRuOXJERGZFSkxDb1FkNjFRWnJ6?=
 =?utf-8?B?bEs0NENvM2tGY0RWZncycXlWazhsSFk3eks3bWU5aHV0bnRYK1ZPbnViWHIy?=
 =?utf-8?B?bUZmUm1OVG5aTjl5eWlUV25LMXZVSzhoRm5wUnFmbU4raGdsd2JkZ1UxclpN?=
 =?utf-8?B?dm9MUkROK3l5eEM2M2xSeXBmUlZ1UTMzN2Y2akxoY1kyMXkzMENQbCttMGpT?=
 =?utf-8?B?NE0vRkljeFJoUlV0U1VMbEpucWppL2J0MWtJZG5WUXk4aGdnYTFYQzBra05u?=
 =?utf-8?B?UGpmdVVHdks0cHowdHFDSk1RRUlTTkplUGxCay9ieUpEeHllS1J1YTQwWjBq?=
 =?utf-8?B?NmE5cjROVUhJYkZzUG1YMk5QS0JmWmYvMUR4SlhJTGZua0JGMGt4SXg3aXZG?=
 =?utf-8?B?RkppSnErYjNSY0EvbmFhd21pRkllK09qSkZuWDNHMUlJQ3F6YWYvdjlWQlM0?=
 =?utf-8?B?SnNMajhlVzlKbzJQTmQyazZGa0tiOXE4d0g5OHRkVU9Oa1dVeXM0bjJkMkVh?=
 =?utf-8?B?cTlNOWZ0VTQ0RVZsNk5WdGYzclVrQlhRTkYwM3g3dzNyRUhlb2F3U3BUZGNJ?=
 =?utf-8?B?aENZajUrZWN2ZmlFWDJSeHVmWVFTVEphOTFaODBtcjFmRTJIZDhiY2NhTjk4?=
 =?utf-8?B?MThGS3E3Q3BGck1WRlBicjJDU0YwTStRR3BQZlJYbjhGeW4vdHZTQnpMdi9w?=
 =?utf-8?B?eS9YNmJ2ZHRqMG1hUUlZUTVndEpsWFBwbnZzSHhITWpkZ2hCTm9TUFRtdmFX?=
 =?utf-8?B?eEtMVmpLSDFocytDYU45YTVrTmM0Y2tBMmRVeTFZc1F0NzlHdXc4WUwyWDJt?=
 =?utf-8?B?ZUg4RWVJUFdSOUpsWDllMHd5eGdBaUViajVyTjNRL0t1ZWh6SEhOd3ZZcnZu?=
 =?utf-8?B?M290aWFJbkpUdTM0djNsYkMyQUY1aElMOTNMZXFmRUttYmtEN3ZqYXkzZWRk?=
 =?utf-8?B?OU00Q29OeEVzOTVDbE13NE84ZFcvODFVRm9zM09nM2NSanZVV0NMR2ZUNk0x?=
 =?utf-8?B?TUJwRGpvNzZ5NzRCYnJuL2lzdy92MGRPb2hHOXltYm45eWJXZVZzTWY2eEtw?=
 =?utf-8?B?Qkk5dDNzZHI0c0tOMkJOK1JnUzMxZHo5dFJWdDJ2Nm8ySmFscWFyRXIyYlVL?=
 =?utf-8?B?QUcwc2Uwams2RlVDS3gvVE5TMEJqZVVYSTN3MzJOTStQdk9WU0ZHdTcyQ2lL?=
 =?utf-8?B?SlRxOHJJSnNwUldpc2RwRGMvUW15ajlqSWowNEhLd3ExTmZwSWNkZFFpLzhw?=
 =?utf-8?B?MkZRdkptTjNMWnRVdFZRdE83Mi93NG9KZGJLcmJYMk1xWGo3MGVqc0l4R0VQ?=
 =?utf-8?Q?nCylZYKdI/YV2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR10MB6505.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tk4weXpwVWU5eWp3OTRBTG9raHQrSmpMdU9yZmh0aVdhYjdEeGN5SUd1RVlZ?=
 =?utf-8?B?TDMzc1RCNEk0K2VLZnFZMjdKNjdDZGd2MHF0VHNQRGI3UUFINDhuZzg0d3lj?=
 =?utf-8?B?dDVqUGhZMVpjV3poTHJBbXd5UitLSVhTRFk4RUxxbCtSUW90Sk9nbndDdFI3?=
 =?utf-8?B?QmRvWVpaeHVJNWx3R0lsOGZPU2Q2OVZjUTE2TGJmM0lJOVZ4YXdzcVpWSGNW?=
 =?utf-8?B?K3RQVEFLVFpnamlrbk93LzlzZHZvZng5bXRzUDQ3dlgxT2ozZmFUcnFteGtL?=
 =?utf-8?B?b0RONlhXc3BwS1duSEhwajZBUzBvOE9qWVFLWWFmMTVKRVg0QjVqYnp5SHkx?=
 =?utf-8?B?TmdsaVdLa2JFQnlzVzNtamo1RWcxOGphVlN3amkwS1FOYVlHZjhjWnlCcjVY?=
 =?utf-8?B?VVhtUFR6anR1dWlzVy9Ba0tjQkc3eXBqNDVaK3VYWXhhd0FIb0ROWnhRdCs5?=
 =?utf-8?B?TzJoWEl2V3FmaWtrb2lndFJDSW1DdUw4SFdWa3A4d2Q5WG1GaG51L3k5dzZK?=
 =?utf-8?B?WDJaM0Y3ZjA0TUFJVDNnVGhwd3p5TXpZZ09zcUtrakl1aXAwcTR5dyt2S3hF?=
 =?utf-8?B?MHhNclRSeExJb2x5Uk91djk3aGhvMkl0SG80OXdQZW94cXhFYnczNmV0V3pV?=
 =?utf-8?B?eVYxUi93L2p2Vit3eUxlK0dpSTFsNTJZdDdOa01MV2ZzNXRCK1BJWDZjTUZm?=
 =?utf-8?B?Wk5xVjN6Q09kSW51dW1IQXJHeWRZMXc3Z2w5UTFXZnRiN09EV0QxU1VXSFpU?=
 =?utf-8?B?K2sxUlpZYytnUTNxQTZqelNmM2N0b3VYMXlVY1pDUlJJRG53VmhGMVYzbFVm?=
 =?utf-8?B?YUQ2d3pqLzFlTXhqYm9OT2JiazMvRDA2ODErYUkzemVkMWtET0piV1Jlb2pQ?=
 =?utf-8?B?LzJrMjdCQVpwOVg2eEVOS0t3WDBKMzg1UWY2cFRIRFpGdVNqb3ZlU2ZER25V?=
 =?utf-8?B?N1QwSVdSSFFpTGNTNG05TWxxNnJOZFhZQnkvRGx4N0FML3VRbFhLMDBzekp6?=
 =?utf-8?B?eWdWd2JzcnFjU2NONCswSFNmL3ZLUzZrWDJTeGVaMEFLdHF1YVh2UzBySGpH?=
 =?utf-8?B?Rk5wcUxzbHAvdzQwK1NvdHVqd3hSZjg3aUd2OUxvZzFUd1k3YWorOHNSS2c4?=
 =?utf-8?B?YUR2Rlc3L1UrVGQxMXV2WE9TZlpnRUZVVkJzK1NyS2ZXaG95QVJTOE4xYXJZ?=
 =?utf-8?B?Vkp3TFM0dm5hdzkzMGhZemV4cm9vYjFmbFdNUkhxSzUvN0dnL3k0c3hKVUVG?=
 =?utf-8?B?QWpmcWxsOFFxNkhUbk9zd2I0aEwvNkhpRUhLc0NGSWk3bko5QkY3bVV3SkYx?=
 =?utf-8?B?ZHZwWjJWejBwQlBpd2pNNHlrWkxBWVptalU4VTdwQmNxQ3BBWER3Mk40cHky?=
 =?utf-8?B?cGtPUFNDanJvVFBTTXdKdHl5a2NiN0xSby93aUdZMHlIU1RWdWE4aStGRGs0?=
 =?utf-8?B?ZjVqZDNOd2tOR1hEaVZCOUM1ZnNjcHllMTk2NWFDVmpSY2daSWdRVlgyNVlN?=
 =?utf-8?B?RUJaRTJPeHE4Z1hhY1krclJDczk2dWltNmZZRG44REtFQkM1bTZUbUhuc1dD?=
 =?utf-8?B?b0FxclNyM0RKNHZseHlpTlVPMGFRQ0VkWWdLVGhtclZxSjNLdTRBbDlRc0ti?=
 =?utf-8?B?NnlJUktkZGtPL0tiYmdJbXpCQU5sZUJEalIwdnBEWm1ZakVMb0J3Vkd2TnZD?=
 =?utf-8?B?M3Q4OXU0OFl2UzQxemJSWUNMVmt1aHZrYmIxeWRFaHhWWkwySUx6OEFQNWh5?=
 =?utf-8?B?aHg5eUFWbU81NnJjRjZtL1EwdDh1MDlPN01hNXZORHBWU2pNUTJObWRRY2hN?=
 =?utf-8?B?NDBrZ1dFb0RhbFlVWGhIYStDU2VyNkdDeGRZaHk0WDlWR3hSTnRVNEZVKzJm?=
 =?utf-8?B?elV3Q1RuZ3lNdTF3SG1CWkYyMWNiYklNNFJSK3cwMXhMRHpiREU1YXc1YXk1?=
 =?utf-8?B?QXRaN3MzMGJrZTFFNEp1ZmVRNTZDcXJqK05mSEpWQVVraEovNkhIM2k2WlJn?=
 =?utf-8?B?NmhQcVpRVDMwbnJpaTRJajJseVFWOGd1NCtwaklDcHNTVlpuQSt4M2NESGdG?=
 =?utf-8?B?aG1DUFZLcVNWWlE1MDV4cVZ2UmxUWTNLeExDdmY0cnZ5ZzVaQzRLejNDWlhl?=
 =?utf-8?B?eG5zalBjd1lkbTBBM2lMeUVISnFpeGUvd1lMSkgrTW8rT1pMdFpBQ290OU9R?=
 =?utf-8?B?Z1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	he5S/1ykgtEJicMhQ1Ei4sBYTp3PBFpmfiHf0A36TGj8ZxB8D2g5wCTW+BFZtBkVx4lxFK/uvc71PjH2n406WK2+cn3LcCPHfAjHkJuvRAznTMd7GQNevMie//I86O4JDegT6ui+LaHi7cJqsLCW5BJkbXrHtDtKml+z6vJtuy9CrPm38bye/wDuM+A1++rrw8z0q44ZKQkfMRq+JHzBuJRBZbpjlasxaun/jGB49Z02eZrgh+Z2p8AwcQNm8Mr/lNpA28vVpFJkOcGHDEe7qDxCBbHdYps7SuaJaBaz/wt+FYlB0fujio90eWU7DV0x6pIxJEwp7NfCYe+sydd85AmMbGmc8QxCRm6YaavpecN782Qmy27I8bsWoYOpkJiRLoo1KwQP4GbT6OivwTowPEjTsBkE4scxFnsq3GF2T1Th+c0zg0BiyFp3SkBHCnNU3dnxMeupsc+mkdzRv4pkKq3i//LzjrcmW/6r68tRYQGMzqWqoYutRuceKt25bEfQoQTOBFoxXXnLjyGyXwunyX71YdeKZf+qfE4Zf++MqIhiEi0P2t4oayQI97HVxsrqTywJ9citcBYERqi4oVqQiC0OOTyYYA5MrtP6EenXow8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 364ca0e1-e8ba-47f3-0687-08dd4093bfc7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR10MB6505.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 18:35:48.2055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ivTVu1P2zFUW66tXQhOb9+wFMZSOYMfpC/40+bmgf17g+bbq102B3dndqmQVhYyI7n3zLuR425QEPqb8+8qD5D9TJeEqeLQvdSO60Z447hY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6494
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-29_04,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501290146
X-Proofpoint-GUID: 8IBpkIuwoRALM08gG3r7TzxiouYY4wnl
X-Proofpoint-ORIG-GUID: 8IBpkIuwoRALM08gG3r7TzxiouYY4wnl


On 29/01/25 4:52 PM, Juergen Gross wrote:
> On 29.01.25 10:15, Harshvardhan Jha wrote:
>>
>> On 29/01/25 2:34 PM, Greg KH wrote:
>>> On Wed, Jan 29, 2025 at 02:29:48PM +0530, Harshvardhan Jha wrote:
>>>> Hi Greg,
>>>>
>>>> On 29/01/25 2:18 PM, Greg KH wrote:
>>>>> On Wed, Jan 29, 2025 at 02:13:34PM +0530, Harshvardhan Jha wrote:
>>>>>> Hi there,
>>>>>>
>>>>>> On 29/01/25 2:05 PM, Greg KH wrote:
>>>>>>> On Wed, Jan 29, 2025 at 02:03:51PM +0530, Harshvardhan Jha wrote:
>>>>>>>> Hi All,
>>>>>>>>
>>>>>>>> +stable
>>>>>>>>
>>>>>>>> There seems to be some formatting issues in my log output. I have
>>>>>>>> attached it as a file.
>>>>>>> Confused, what are you wanting us to do here in the stable tree?
>>>>>>>
>>>>>>> thanks,
>>>>>>>
>>>>>>> greg k-h
>>>>>> Since, this is reproducible on 5.4.y I have added stable. The
>>>>>> culprit
>>>>>> commit which upon getting reverted fixes this issue is also
>>>>>> present in
>>>>>> 5.4.y stable.
>>>>> What culprit commit?  I see no information here :(
>>>>>
>>>>> Remember, top-posting is evil...
>>>> My apologies,
>>>>
>>>> The stable tag v5.4.289 seems to fail to boot with the following
>>>> prompt in an infinite loop:
>>>> [   24.427217] megaraid_sas 0000:65:00.0: megasas_build_io_fusion
>>>> 3273 sge_count (-12) is out of range. Range is:  0-256
>>>>
>>>> Reverting the following patch seems to fix the issue:
>>>>
>>>> stable-5.4      : v5.4.285             - 5df29a445f3a xen/swiotlb: add
>>>> alignment check for dma buffers
>>>>
>>>> I tried changing swiotlb grub command line arguments but that didn't
>>>> seem to help much unfortunately and the error was seen again.
>>>>
>>> Ok, can you submit this revert with the information about why it should
>>> not be included in the 5.4.y tree and cc: everyone involved and then we
>>> will be glad to queue it up.
>>>
>>> thanks,
>>>
>>> greg k-h
>>
>> This might be reproducible on other stable trees and mainline as well so
>> we will get it fixed there and I will submit the necessary fix to stable
>> when everything is sorted out on mainline.
>
> Right. Just reverting my patch will trade one error with another one (the
> one which triggered me to write the patch).
>
> There are two possible ways to fix the issue:
>
> - allow larger DMA buffers in xen/swiotlb (today 2MB are the max.
> supported
>   size, the megaraid_sas driver seems to effectively request 4MB)

This seems relatively simpler to implement but I'm not sure whether it's
the most optimal approach

>
> - fix the megaraid_sas driver by splitting up the allocated DMA buffer
> (it is
>   requesting 2.3MB, which will be rounded up to 4MB - it is probably
> not needed
>   to be in one chunk, so a split would result in max. 2MB chunk size)
>
> Both variants have their pros and cons, though.
>
>
> Juergen
Harshvardhan

