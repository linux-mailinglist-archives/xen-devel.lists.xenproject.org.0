Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A607A21AD5
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 11:16:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878961.1289249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td57l-0005F9-7D; Wed, 29 Jan 2025 10:16:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878961.1289249; Wed, 29 Jan 2025 10:16:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td57k-00056Z-Uv; Wed, 29 Jan 2025 10:16:44 +0000
Received: by outflank-mailman (input) for mailman id 878961;
 Wed, 29 Jan 2025 08:44:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XMr0=UV=oracle.com=harshvardhan.j.jha@srs-se1.protection.inumbo.net>)
 id 1td3g0-0005T2-Tc
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2025 08:44:00 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2dbc6788-de1d-11ef-a0e6-8be0dac302b0;
 Wed, 29 Jan 2025 09:43:59 +0100 (CET)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50T8WmsL022053;
 Wed, 29 Jan 2025 08:43:48 GMT
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44fgw9g0pr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jan 2025 08:43:48 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 50T85Vnx011648; Wed, 29 Jan 2025 08:43:47 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2043.outbound.protection.outlook.com [104.47.74.43])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 44cpd969j1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jan 2025 08:43:47 +0000
Received: from PH7PR10MB6505.namprd10.prod.outlook.com (2603:10b6:510:200::11)
 by CH3PR10MB7931.namprd10.prod.outlook.com (2603:10b6:610:1cf::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Wed, 29 Jan
 2025 08:43:45 +0000
Received: from PH7PR10MB6505.namprd10.prod.outlook.com
 ([fe80::83d9:1bf1:52cf:df54]) by PH7PR10MB6505.namprd10.prod.outlook.com
 ([fe80::83d9:1bf1:52cf:df54%6]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 08:43:44 +0000
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
X-Inumbo-ID: 2dbc6788-de1d-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=1C9X2ThXQrZM3UQDIQxzqE/trsk815QmfEuZn0iiLCs=; b=
	H5ybkT+UgIXfxoP8vw7HVkpYxpiqYO+PdXkHPyOrUoFpv3uBkxIkYnQ5jlBuiusn
	SSfr5VAM0XqJuDW7EWJc6qhNgF5uswEClwJCXpqqTaw6ZgarAk1v5fpOi/9qJDdj
	+8KFwjHVnpjG2hZGHuNIw3ylHNh/RViUIwNIpOpa1SA2kr/+ALt2Yowc7mM+8ZwL
	c420RAMjltp3EGHmA4F/leagfZ5ljBQYHsgUw4BcNHsqBOsDpPzDyqYgPRdxmSVX
	euZoevCCnpInj9B0sO5zW7pAVOYfzW84SXX32pmacrqURSy/scQ2SkyZ1FqB1dIk
	xMb3FyP9kLS6hC5nzm4WeQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lyUErxRd7xuIoudjErBivqYdpm++r4zbKQmEPSfRmg7mWQgLlxOthGeqpXTASSxuLmThfr+X4qVYfR0ODtF5lpWvMHHNOOVhCQYDmai1lUpwLIqyNQj94s6SyqDcwU6TYFdI1h+7hbvWRUXn0CzSCu6kSSoETNB2OUDXvjGNa6nZOp0LzsUp0/qgPPJNMXyFns8ra6UGOYZiikgVT6WkEfqYbmTu0PkUgKVnjI3V/PJOUm1KAfYEGKduq5zx0flZUH+Zz7Asq+j3f6uEZPAMIEnmymX5RWQo5dQQ0OYnK1DSuihJwWhNHl3WtIYu6fxpG/wZaGFSOorh51dU04DAsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1C9X2ThXQrZM3UQDIQxzqE/trsk815QmfEuZn0iiLCs=;
 b=xlChpykt8c8zBdYyJk8c9TJeyXIDa9AvkDDU+c7GVKq1wzaXFag3zTijqUEhpc1BmDOjb5nnmBm2Mhe58ctHlP6rfjoMmVBSMCQe4/NA3KVK8i8gxOn6CT0YuRw085IPiiaRbxoS080sS8xmXct08RIP0qQHyzzW6IaEbGkLLXTjKd6TVLBNlZT1hgu1BaHCpXcrQl4A3EyebdI+pG5LK8INqYLrDQi5sXcZ1jO/37kZjS19cWf8VvpUQF2WqDQC/dhq8YcFAhcOxNk7lUiJnzhbA8d2dc8pmo9f8bNHqRGDIc6d4MrBqkM6JLCjPVLIZOGYbfwf4L0tXvlmS5s7jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1C9X2ThXQrZM3UQDIQxzqE/trsk815QmfEuZn0iiLCs=;
 b=zr0mH2heGUXElhKasELmEE2a2jh6BuOyvbjG5fx3Jg6S5POonax+32ILxQym4DNuG0iUHeQrkAWy8YZlES+mU8tR6oLTf2bPZjPW4EehUyIhiDEZW5gfWX2gm1dEVHAuv3lbV/HHocgoNXtGLTznNpGp3KGh7hjYy/G6drIaQjk=
Message-ID: <8eb33b38-23e1-4e43-8952-3f2b05660236@oracle.com>
Date: Wed, 29 Jan 2025 14:13:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: v5.4.289 failed to boot with error megasas_build_io_fusion 3219
 sge_count (-12) is out of range
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Konrad Wilk <konrad.wilk@oracle.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        "jgross@suse.com" <jgross@suse.com>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
        stable@vger.kernel.org
References: <7dc143fa-4a48-440b-b624-ac57a361ac74@oracle.com>
 <9dd91f6e-1c66-4961-994e-dbda87d69dad@oracle.com>
 <2025012919-series-chaps-856e@gregkh>
Content-Language: en-US
From: Harshvardhan Jha <harshvardhan.j.jha@oracle.com>
In-Reply-To: <2025012919-series-chaps-856e@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0136.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::16) To PH7PR10MB6505.namprd10.prod.outlook.com
 (2603:10b6:510:200::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR10MB6505:EE_|CH3PR10MB7931:EE_
X-MS-Office365-Filtering-Correlation-Id: 21a6212e-f625-4a92-6a44-08dd404109cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TnU3UC9uVlVmUmlKM1R3RWZPWjV2RGkwSmlJRlpoa20zUlNKcW1VQ0pTVWNs?=
 =?utf-8?B?Ump2MjNRUUhtRVRIWHpESXlQdjU2ZmQxUllmb2UxOVhLazUwZGpacU56STI0?=
 =?utf-8?B?UlVZSFh4ME1DN01sYVFEdkwveU9BcElXbDFDcHRMcHFMckdUUnBQRnJ5eUkz?=
 =?utf-8?B?dGQ5RFgzSjlWR1gyc0VHWTFqYVJPelZBV3pSQWZaRzR3UVlqSWpmOXkxZzN1?=
 =?utf-8?B?UFROSUN6Z2ptUFlFTkhMU0pJclhUeERFQ2FJalBDMHFEL3FYcG4xQzRPaVk4?=
 =?utf-8?B?L2lDTHVXMm9YRm00TTdZYWZ1STRpNXRzTnJLQ2k2Z2dOUkRYYkN1UCtRZGVH?=
 =?utf-8?B?VFZWS3RzQ2NCQ3ZlRlgyS3lWeXRxd2xEU0tPeFFvalphMm1ZQmtRN2Y5SXFt?=
 =?utf-8?B?OXdjTzZLaEdsS0J0emFRZjc0c0xJQkpsODRnZytDOUQ5aWFMQ2x0Q1BwN2xQ?=
 =?utf-8?B?dGFaNGZldDZYYUExR3Viekp6elg5d2NGVW8xT3dtc2EwbEJDeTc1VUlZMTMw?=
 =?utf-8?B?Rm1Za3dyZ3BzODBEM3NqR1JmUXozRVFLNkZhcEZKc0hJZFNRV08wMFgreGln?=
 =?utf-8?B?ZGtCd3VmTTBhRUdPb0NlUWpjWVNjR2dlQ29wZHJETVlsRVNDQ05mQkxka1ZN?=
 =?utf-8?B?Yk1xR0EyNi82ejYxcFRHb3FUOWRzWEtRbW9iMkg5YjkyWjRNSzdwL2NoLzZT?=
 =?utf-8?B?RFJlSGU0VWkwRXdPOTRBbXArS21vakRkR21iN1F3SVgrazFUSnJZbzJjZkdI?=
 =?utf-8?B?TzlXSzdFcnhqY0JldnVtUG0rTnJtRVl4eWpGOEY2UDNLSytGQ2ZJeHJ2N2pD?=
 =?utf-8?B?dUFEOHRib2k5K2Z2L0Q3UTZoMC9BaDI2RDcyT0JMY053YjVNcVdyUmQ5MjE4?=
 =?utf-8?B?ZmFvUlJ6K2J4Vy91QnN0ZGVDeXluN0tQUEF6ZG1URWl4Z2Fodkhud2FYZ05s?=
 =?utf-8?B?Z1F1MnU1Z1hUck5oWXZGNlVkQTdVTm9YYk90d21Fc015TEdsdVJnem53WFhO?=
 =?utf-8?B?Z0xXMTU3ODlDSW85RW5CaWxyR1NjVFN3ZmpiMlRodXFiWENTYlEzb2xSeEdh?=
 =?utf-8?B?WmtpdjNTbktmclhqTFo5V09KR2FJY3hqRXFzaUNBZ1A4aUI1TG1IenNLenEv?=
 =?utf-8?B?cmhZVEkzNGhUS2xlUCtZcGM3Nk1hak5qTEd4T1RGak1rMUR4Ky83ZVNJY0hY?=
 =?utf-8?B?cTEzN2NPWCtwQzh5ZGdJVy9UUXlkZ1hEcTM3eWpxOWJWcUk3Mml3UTlSbFdo?=
 =?utf-8?B?ek4zMTdXa1ZsSUNkTjg1U3pqVHJOR2p3Q0JUY0d4MGNTMnR6ZEhobUFKTE0y?=
 =?utf-8?B?aTNSUUVwTEpVWVZtQnZXWnhyaXVUNXZNeXdiWFJUVDV1Y3pIeDl0Z0c4a3hY?=
 =?utf-8?B?VlVOa2NZNkJ1RnlaVFRVMnJmT2xPaHRsdWFFS3kxVS9yY0VDTFYwZTVPaXNy?=
 =?utf-8?B?M0ZKOEVwZ1U3ejlUdUt2REw3V21ZUjl0TWZra2MwUCt3WW1ZVUNPMUJ5M0s0?=
 =?utf-8?B?dVFqNEFRL3BoVnFXRDVLeGxSZ1FWZlZFR1RkMllSUWFuakVLYkNna096VFMw?=
 =?utf-8?B?WG03alVySFU2czNQM1BtajJIUjJNY3o0eURPSnphbGpDZG5INTEzdmJZS21x?=
 =?utf-8?B?Ri8rWXRnaThIeDgvK0ZmOFVRMHZrN0xDbk1wWi9jNkxtaEsyTXVRSGhNd0o2?=
 =?utf-8?B?RDkxT3VtMlJBQ2YzODMxL0RVM1BLWkdzYk1lajROUDNhMEVZaGV6ckV2b20v?=
 =?utf-8?B?ZktWeUd5TVkvL204OWd3RCtvUVdldHBMMkFxVXhIZkd4NmdKODY5bGhCcTBZ?=
 =?utf-8?B?ZU5remFrN0loeXNualZSWjJ0UlFUbGFKaU5ZalFMamhrd1psSk9BS3lLV1Vv?=
 =?utf-8?Q?uyzsa6vHajCfe?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR10MB6505.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clJYT29WTGROWllrZUlKSnY2N2dmUXIwUnJKckFuR0NMeDFvdjhVL0ZOcnRX?=
 =?utf-8?B?YzR6THBHUk0zWmdYbDlMZmcwVHZUdHlJQ3ZKaDRYT2xxaHJhem56T1REaUtv?=
 =?utf-8?B?eXl4dy9wNUxVMHNyb1dlaDlHTEg2VWUzV3FFaVh0Y3pQQ2g1NVY4Q042RXpa?=
 =?utf-8?B?V25wYnpjTHU5MGt2bXJXNEo2L2RxUFc5R2xpRC9zNGdTNGFPYmhrcVlhNTd6?=
 =?utf-8?B?eHVoMHNBY1dsN01NaTBwN0tMWjNIN01SWnNqeFNDVWpveHJkaXNDeWNnUWgx?=
 =?utf-8?B?RUJqWi9FVGxodWNOak02Q2pIUWlUWEZMSWRYbjdxVzkwbnZheDJyQVJvUWVC?=
 =?utf-8?B?eUtibGcvTUZXWkhPbjN2b3lrNGlEc1dsbUF6Q20rWVJsVTg4Zngrb2JJU1hx?=
 =?utf-8?B?bkZIVDZpVVZPV1V6djJJckRwdFkzT0UvcU9Mc0xMZzFlejZ4T3NnVC9CMnVy?=
 =?utf-8?B?NW9JSlNHT0lVQUpndXhEdU8yYjc4a2dHK1BWa0NIQXg4NTdLdlBFT3c3NlJS?=
 =?utf-8?B?MGxuSkF3YVNFREJXSVZRaHlkdHQya0ttcytIcGlxQVpSVlhyb1hjV3NhdVov?=
 =?utf-8?B?MDlMY21xN2VGM21wMlErVUY3WnltUTJBQUVabFZIZ0hLVGwzMG1VNkFSaU9B?=
 =?utf-8?B?T3NVU1J5TEhqT3NmSEFzRjllU01Lb0JTWWV6bDk5aUd0Uzh2NURjZGtNTi9M?=
 =?utf-8?B?b1ZiOWVxRGpOckJIS1c2SFBYWVIwTzcrNkxNREtpM1JRYm9VMWpQNXFOaVRm?=
 =?utf-8?B?WGhLT0ZYOU0xSXJYQ3Jpa3MvMXVHRCtUMDltUXVXaUVBOS9SWUlpelBHRE14?=
 =?utf-8?B?ZituK1JLYzhFTDlLdDFPS2QyRVV1Y1loZFpYU1FqUG5xdlNGaytUdVNGeUI0?=
 =?utf-8?B?R1FpcjVscTJEcGtNaS9OTnhJNktTbWVoOWhKSDFPT2x6YWt4NFE3bW1wNlpu?=
 =?utf-8?B?dWppcDJISVc5T2ovL1gvVWR1b3YvVHFUeWhPZ01vSHd4V2lnU2E4NUZRU09V?=
 =?utf-8?B?VENBQVhoK3J4QldSWDEwWTVKdXQ3OWQ5UTFOSlZ5TVA1NjdKOGlqcFNOcGkz?=
 =?utf-8?B?N2NwaGNxb3gwYm1XMXVoVE0xVjFFV2pkZUN5MC8vMTlpUFRWWXZncTkwZHhr?=
 =?utf-8?B?L1RaQm1oMUJWZG9IQWRBUGhxajYrMXlPVTNsNzdIVi9ubTVHc2ZhckJUVjVV?=
 =?utf-8?B?WEl5YXFoZ0hwMDZZUzRSVmZvZDU2a3FrNjNMNVduY1lwZzJ1V0hicUhDKzVB?=
 =?utf-8?B?SmI0OC84ak1KTm1sTE55Q0dXMkRGNEdzcWtGQXBDSFVNU2xFVmNEQ3ozTTNU?=
 =?utf-8?B?SG43dEh4ZHZoSFo0YXhJS3ZuZ3hiVUVuUlhrbWZmZFJydFhsaDdQZnp4L1Nl?=
 =?utf-8?B?T2tQOVpKYThZOVgwR043WUkxcjYzYjNMY0ZZaGxFQzQrWVBZNmVsSHUxdnVL?=
 =?utf-8?B?RDloWndqeDRtOFpMTnRFU3BUNXdNUThaU29mU3phSFdIR0FtV0VqblNuU0Yy?=
 =?utf-8?B?T0QyTjlQVUtoTlBZcmtDbzdHUzAwa1lqcVQ4eTA1d0lVNitTa0RueGhneS9s?=
 =?utf-8?B?TVk0cC9WMG9scTVWRWVwVWV1NFJYYWMyVW5RMUhYTEhRZTM4V1FIVVlUZWZV?=
 =?utf-8?B?RG9wK2dtVVdqT3VTQ1RQTVdBNUlodXJwaXNhMzdrSnJDM2RPdHhFdjAyZDN1?=
 =?utf-8?B?SHVqUFZpZHI5Yk9zUVFlZWNwRm42SlRMTHlJenFCODZBL084MmYzRHBtd0Zs?=
 =?utf-8?B?WmpQdUpMUGdpeTZYREhXQUdQM2tUMUgwb0ZiTjZRQ20vdVZRN3hvZ3BCZnVC?=
 =?utf-8?B?U0RydGZlaWRoRStyUmZObkR0TFFoL3FrMW9kWnNXTFFkODQyUUgzeDJJdFAw?=
 =?utf-8?B?ZmU0cXNJcjlpdTA5Y3FGdzJXeEROZmRrZFBkdUwrZUFRdkFaQlhwQ3JhdnRt?=
 =?utf-8?B?RWF5M2Y1OWtRQzJlRXdsRkRGcGZ1cXIySWNmTmptb2hKYkg0dERmYXdIdnpy?=
 =?utf-8?B?VDd6aTNVWTJ0bHZ4ZTlXVHZMYmoyT2dXQ2lXbC92WVVwaTE1VG0wMHdsT2No?=
 =?utf-8?B?YmcrNko4Ty9ZMENlTEVkYkZ1Q0cwQ0JtYjl6am0wcFd3M1FHTWtGaXBlMGNZ?=
 =?utf-8?B?b0hJYUlMYUd6ZnljeUlRZFJJZ0JRQi95a2k4OGtKbjN3eUV4UDJPVWM5aW9t?=
 =?utf-8?B?aXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kSoHC9c63aoYQbKD8jfJFo8RfBun3IGn0N5adNa484R5FrD7a8eNvtd++yJZawgJuawg3LQF6OGrfN08Gc4CVLjsMAfvC0DgHlpQ4iPIdjLF+WyVq9GqAIQFCubCeqkSaPFVbzAb5TYrqKpXaHhTKIUx20BWRHsp/BrFQzE+tykuxY5quY5cUkPNrAUkSAcXkpqF4ufAnEOv60Ku5ilojhUyckFfjB2U/QXFYcwqR1UX1euFehMJW5k3/AQZ90aCdbSeLXvnB3+/1q5J6S1FK8VFG7xnoSVmTAySCfH0iwZrG8BgAAl9fOFuTXlgwmQdb5uw75kkQ6r1X/dc/VAqijqqS8h8A0Zo+IGdCFrc793GXVLdh5ohoFCnwrw3Y7gZ2Yk29ghs9cdW5SDNAENHnzkaAA0u8nGVuH5GqLI9nMvXhTLra8e0O3nHuUTeWr52TpTKcLxSun8UoxV7BZFRQSfiakcZxC2Z8zFI/ZR4OPmThCaqqsgHZpFpJKp9oq3lQMq7UnVZboGHrAcq5mVezPAfPLHZ1i3twX9Qig/4AhCHir11n/DU0vIsjyhDmdvqSkPZbIOEI4LrUcKHfSQQYDMShLEDH87oKmqYTM/Y3RQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21a6212e-f625-4a92-6a44-08dd404109cc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR10MB6505.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 08:43:44.0881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7f577pG5TU/fLI4WZX80gFBq8hrWDqKUgFQaB3zQTxI16kyc7AxHTKiu9PCP0lbMWgW7PM04F84XTsCy84UW/RS48AHsPqx0wJXAVc6/R8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7931
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501290070
X-Proofpoint-ORIG-GUID: fg1b5FolzACU0QYtbLXLghcN4iEzFhY9
X-Proofpoint-GUID: fg1b5FolzACU0QYtbLXLghcN4iEzFhY9

Hi there,

On 29/01/25 2:05 PM, Greg KH wrote:
> On Wed, Jan 29, 2025 at 02:03:51PM +0530, Harshvardhan Jha wrote:
>> Hi All,
>>
>> +stable
>>
>> There seems to be some formatting issues in my log output. I have
>> attached it as a file.
> Confused, what are you wanting us to do here in the stable tree?
>
> thanks,
>
> greg k-h

Since, this is reproducible on 5.4.y I have added stable. The culprit
commit which upon getting reverted fixes this issue is also present in
5.4.y stable.

Thanks & Regards,
Harshvardhan


