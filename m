Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86489A21AD8
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 11:16:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878948.1289240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td57k-000562-Mj; Wed, 29 Jan 2025 10:16:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878948.1289240; Wed, 29 Jan 2025 10:16:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td57k-0004yh-JC; Wed, 29 Jan 2025 10:16:44 +0000
Received: by outflank-mailman (input) for mailman id 878948;
 Wed, 29 Jan 2025 08:34:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XMr0=UV=oracle.com=harshvardhan.j.jha@srs-se1.protection.inumbo.net>)
 id 1td3WT-0003Q4-Ia
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2025 08:34:09 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd81b93a-de1b-11ef-a0e6-8be0dac302b0;
 Wed, 29 Jan 2025 09:34:07 +0100 (CET)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50T7thEW015196;
 Wed, 29 Jan 2025 08:34:02 GMT
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44ff7c87dc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jan 2025 08:34:01 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 50T7ABRm034289; Wed, 29 Jan 2025 08:34:00 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2046.outbound.protection.outlook.com [104.47.55.46])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 44cpd9ddcr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jan 2025 08:34:00 +0000
Received: from PH7PR10MB6505.namprd10.prod.outlook.com (2603:10b6:510:200::11)
 by DS0PR10MB7344.namprd10.prod.outlook.com (2603:10b6:8:fe::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Wed, 29 Jan
 2025 08:33:58 +0000
Received: from PH7PR10MB6505.namprd10.prod.outlook.com
 ([fe80::83d9:1bf1:52cf:df54]) by PH7PR10MB6505.namprd10.prod.outlook.com
 ([fe80::83d9:1bf1:52cf:df54%6]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 08:33:58 +0000
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
X-Inumbo-ID: cd81b93a-de1b-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=hskzXJhH+9QsGBaXJ+
	qwrpYPYCD/JMlDNEtD4vgt/ZU=; b=AzOudf6rLU13ZMVOueKoVyLB8K6BIQulNB
	sTgbUXhxQLhyiX/50/WJOna0bWBOeXDpm8Wp4eJW4T2XC7ShY67SCUhSsujxn7P2
	I+c+xeLYQZgZNigXs4k/uEcePTG7HIoyhO/DA0yatcViLaE8v4Iuzy3STGeiAbAH
	6v3eI7qP8Uns8N/3rNjuxC/aGgJ3plFoOtWOXzoclTOleMBOZ4KUJqmd7Cn6RYQ1
	4+x9VLKMiWiIK5TfmG5p+TKvcQdjP0VDjoXtND1HpxjBCIS7MZycRLZ7nX0SGezk
	EsdtbNIxJgm3FIjJlBseDkINihlnFKu46+ogUSEseY3FrVel2n5w==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HLVoadxzTE5Crub5H3AINfTZD/t6sy53wnNYsQVNtCWiPZyObbhIBn3W57NRWfNPvPg9zW/2DhqTC1Y/d7Yv1SSo7fpsW7u/Ncn9EiCt89JaprHsdnr9DKxYV4E4BwMErTbt9XVJma59wB21K9oo5rgQRrCRFXKmvmUVitIt+6ydF8k6qblyWsmOYI3O16GfSaDmyq2nCaL+rpNSIsXm0WxgywGpELhxyjA1Z43FdXHwhYvj2TeZ2ax87npyExYR7vd7EYeOVrlOn44qzDUheAgoJQNaIz3TI/qZRhkNl8x0+VnuYKz56EdPrPP60lErWoH2VznsEHcYty8m40cqaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hskzXJhH+9QsGBaXJ+qwrpYPYCD/JMlDNEtD4vgt/ZU=;
 b=VVZ4j64HR55hoPhVMeT8yHPuq7PysYi8Yp0TgiOpPzFbwsnQlyJItUh12WMeDE7hL2cBfSAsoYHyyR7PCK258PLvTJrj3YbnjTw2Yo50hRK9pVKXpYZoM7ZgcvFwm5bomuEvCSfjIrzYN9Hh0cSv64iS/eT8kATDuJ85VkcZ7hZ/V3UzdnQ+VG4iCWEQ5GCiIXRmQv2EfY+P1Lvs9yp5IPQicA9yZe6mDjwOVhfF6OxnhDzllt56hn2C0taJUkp2CaCw6cvZv1X/0g1z/N2skMcNu2wvnW3YD13ItfivRcEqIi78ogLDJUqK98Dh+3zVceTMeQqXry1e7yoXY5frww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hskzXJhH+9QsGBaXJ+qwrpYPYCD/JMlDNEtD4vgt/ZU=;
 b=SuoH/5f2/H0vDg+Nc5lYKt5OUTARZEXWTdw1tUsFhTQxmnv3PU/iO0QFu3kVuCqHbxDw+ZHsqfPZMQHXxzp3+9k3ks+W6kroHUPWU0Ju5Pi0pW9gdVRg2a0jUGwZAjMni4CBLBx5Q7R9/+voX8PfFSo6RAdBZ8mbz96QL8o4A+4=
Content-Type: multipart/mixed; boundary="------------wonoJ16T7QXkai8nxcHszemM"
Message-ID: <9dd91f6e-1c66-4961-994e-dbda87d69dad@oracle.com>
Date: Wed, 29 Jan 2025 14:03:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: v5.4.289 failed to boot with error megasas_build_io_fusion 3219
 sge_count (-12) is out of range
From: Harshvardhan Jha <harshvardhan.j.jha@oracle.com>
To: Konrad Wilk <konrad.wilk@oracle.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        "jgross@suse.com" <jgross@suse.com>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
        stable@vger.kernel.org
References: <7dc143fa-4a48-440b-b624-ac57a361ac74@oracle.com>
Content-Language: en-US
In-Reply-To: <7dc143fa-4a48-440b-b624-ac57a361ac74@oracle.com>
X-ClientProxiedBy: SI2PR01CA0037.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::9) To PH7PR10MB6505.namprd10.prod.outlook.com
 (2603:10b6:510:200::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR10MB6505:EE_|DS0PR10MB7344:EE_
X-MS-Office365-Filtering-Correlation-Id: 590728d1-68bb-408a-5f62-08dd403facc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZHcvS3ByR1FrT0ZXb3Zob2l1dzg1REg2a2lQeDB6WU41dXk1L3JiOHNBdWN1?=
 =?utf-8?B?YmJZaG9lc2hMb3VxQkVsZ2xwOEJCQzRncVk3RFJjN3UyRnRkbzFRNkpyRHov?=
 =?utf-8?B?cG9LY3d1MFl6MzZESnE0TUcrQ3N2Q3dWaVdqQklTcTZvbU9aLzZQQUFEdzdZ?=
 =?utf-8?B?TDREUnZSL2FOSUk4aXVQQnE1Ymh5OFR6WUJKODVNQXFRa0xubVVvaGpxK09w?=
 =?utf-8?B?QkQrS3JuYmNXZGwxYklhQ1V2VGpTcS9jMGo0MEh3bCs2bUk1Y2pEMHViSkhh?=
 =?utf-8?B?b1pIK0ptOTA4WXNadG1HV1RiaTBReWEzV2hLMzFVdWh5bHhrYnQwM3pwNXp5?=
 =?utf-8?B?ZTFPa2svT2gxQmFoQlRiNDU2SWdCeW9GUXJlbmFId1JwbnZUQS9sZ25CMXI1?=
 =?utf-8?B?QTI2d3hlWDBESlVrWlkwUE50bktrN3I4ZUFTWHNIMWZNYjV0M3ZCYkRGRjI1?=
 =?utf-8?B?TzJjdGVGWFlUeE5hODQyRDJlMzZaVWlLRlJob0NMMjFKVVFVa3ZmZmdnMEVi?=
 =?utf-8?B?ejkvUzRYWnJFbGJlU3RSN3JSYVJUcGJ0cTc2U0dpYlZSUmZNaW8rMUp4VkxD?=
 =?utf-8?B?b0xpSStSdU9DVDV2RzE3dmNzc1ZiampGcEx3Y3d4SEJvbEM5TStUdnFUb2FQ?=
 =?utf-8?B?c25xS1h1N1VaUC84VGJEblZRWURHaFBpVjV1VU9pa0RiOU9aRmxHcURZL21t?=
 =?utf-8?B?MVYzNGF3OGM5bXN1RXRGUnF5ayt6bWFrVUtFcit0K3g5UWhGaVZZVmoveUV1?=
 =?utf-8?B?eTl1VHZvdFZnNjdpM0RkcDFsYlZ4dlZsanFobVJkUENtZ2hKSDBYV29CdWRk?=
 =?utf-8?B?VFRPQURTME9HOVhlNkIrbmJ3SldUVSthNllndDJVbmdVVHkrNU1lZTRxQWVh?=
 =?utf-8?B?M2RLVVNIQngwckRpUEdvN1FrWHUxbzIyZ1lTZDI1NVRMaXJHVTVTa3R3ZCtu?=
 =?utf-8?B?bGpMUGdzNUp2NkMrNmZvTHZxQzQ4bkxCa3lUYjJSektWTlhXQlBCLzFtVENl?=
 =?utf-8?B?SXpsV0s0NFgzUnYzQUowT2xzZ0paTWxTNGhuZkJaNW9yek9JbG05V1F3VzJF?=
 =?utf-8?B?d2R6ZmtQTmNSZTgxUGc3b1VnbEh4OHArYks4dnFid0xnTVNlOEw3SU0zOXlW?=
 =?utf-8?B?WjVOdFYvd01aTDVaMXlPb0w4QkpwdDdPL25zK1RwUG0xcnRpandqUWJUeWRS?=
 =?utf-8?B?MGt1NDRvZmttSnViK3dyWURQVWovaEtJNTErSTVxQUhvS2RhTzZoUFhvS0dR?=
 =?utf-8?B?VTNsQXJVRzVxbm1QWG1WamRPbzg2TVVSa24zYktMa3paajMvb3o3aUJXL25O?=
 =?utf-8?B?YkhNZ003aS8rTFVjRGRKMTJNa29Nb1NZMHl6SHVoSzBra3VBdWdOYVlneit6?=
 =?utf-8?B?OVR3QU1CWlhWT3pnSktsNG02V3pscGVtWXR1cWlNS0NkM2lIWWJ5bWthZzI4?=
 =?utf-8?B?cXRJNXphSGFzSzJ5dFNhTjhrZWxkR1pSdlJ3TXNxNGlwaWU2ZXNBUVQxRnZ6?=
 =?utf-8?B?TzBnQnROVU9aV2paNmkzTnhMbE11RWtvVzVjUnhkdTRndmx3aEFyRTBWZHBi?=
 =?utf-8?B?M1RNS0xwUkFMQUJkNVVDSk9kS0lPclEyMUhncGZnTnpVOHBkNUdmVkVPMDQy?=
 =?utf-8?B?RnAxb29SUzdKWm55b09qV2czaDd3cUkra3JRamg1Z3NISzBJZldjNDU1Smhy?=
 =?utf-8?B?V3FWeUErRmYzTkt5b3crcm9ETDBCT29aSXRCZ1oxTU5sSEdLTENTdURnWFhk?=
 =?utf-8?B?STlVWGFtMWZPcUFFUEZuNHRmdHZCaGJQd29VYldZbVplNzV6bWFxMVZobkhH?=
 =?utf-8?B?NVcweXh6NXRFRlJlU2tqZTFRbGlINWZiMUVFZTFCZlcyMnlJODBKU0R0bVJy?=
 =?utf-8?Q?XPM3UMn+3Jwma?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR10MB6505.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzBRSGMrQ0JJY0tJWE9la3dmTE5ScVd6WUJjaTB3SXhPWC9iYlhvVXhkaUMz?=
 =?utf-8?B?THNxTW5GNnp6akNuTFhNWFBFR2VvWE5LeW9hNkh1c3A1MnJSd082UTN6VmF4?=
 =?utf-8?B?QnhwREw1ZnI3N3VwUmlsWE5YNE9XOWdBSXQvNnFaRVpBcmRSdU4wakdVVnUv?=
 =?utf-8?B?OEZZSEIzM3QvRWs1RnlHcDdRTEZiamhhK3A1NTlERTZKT1pPRWZNcGtsa0FK?=
 =?utf-8?B?ejJGbzQzSkQraHFzcWpWclUxbGtlanYySVJMUXNYZGhnRVZXbE10WGFNS2lR?=
 =?utf-8?B?QVlsVEdCZ1IyditrbnFuMXUrT29RL3VVRTlsUWM3eExNS05pV1Rxb3pwTzNw?=
 =?utf-8?B?TXFJaXA5SzZ5a3g3Wm1iOHJTZ3MzUkNiSzBsQVZpekVQZmtWT2xuVmxuNEE3?=
 =?utf-8?B?YVhnZWNVWXNmUXFoZDMwczJYbWRvdWxlL2ZSeFZZSytDR0txYzhwYTVvYklh?=
 =?utf-8?B?bnByWit0YVVzNkt5VHpuN2JpWDN3V3Z6L25VSVJqdjg2TlJQRGRsSHZyNWFE?=
 =?utf-8?B?b3NjRlVxNVJPRFYzYkVmK09UeFBieTJ4YXBNblJkOFppYmlSL29IOUh3UHJ6?=
 =?utf-8?B?bEVKUmRDZURZOUU5UHpTYmRLMFJrekVWYlRDckpzaVZrNTUrV2RjZ3lsekZs?=
 =?utf-8?B?aFEvVVUyTG9YeWpBQ01QcXlpRUZlSW1qcUVqb2VpaUpidURBME8raGJZdkZQ?=
 =?utf-8?B?UGtnOTV6UUJFdUVxSDRvOVl4b3hiL3FQRUExc3VpdVVkRG9LZzdacGJQUXd4?=
 =?utf-8?B?aE5wU0VpaTFKd1RkSjNmeVBNb1ZxUlVFRTh5cE00dVdlcW93RGNhTGVXd3V2?=
 =?utf-8?B?K0RlMm5MRVhGV0k3MDV3RnA0SVhoVHZoOGk4ZTc0ZHNNdFhFM1ZCWXZUcFdB?=
 =?utf-8?B?R3VpK2JYMVMwb002c3k3NzdFMjRVZ2tTdjRTakFXdnJ4RmRnNklFRlVzamtE?=
 =?utf-8?B?QTVaeHdBU25hbkRybkhiemVHS2NJeWE4UFhtKzhZZ2ZMTzIzNW5pdVJkUm9R?=
 =?utf-8?B?eDBRUnVDeTF4WXAwbU5HZW00V1NjM3hZaHhCcXY0SkxmclVKdkl1RXA4TmJm?=
 =?utf-8?B?UUc3SEhpN3V6T0xMdDQ1SU1EQ0NHNUxHa042WEtkY3ljM25MNTJLTUJTMDEx?=
 =?utf-8?B?NElkVFRCOXVzUEpEMzh0cGZVYkI4WEdXL1E1ckVUNndTNUpnZ25Kcm10VTBB?=
 =?utf-8?B?TDNELzdnUkVtRUhmaHZJSGFsanFPaVhPaHVVMDBUUUZBY3VWem1BRDNwVHVV?=
 =?utf-8?B?bDg2VXNGZHJyYlNndGhONzlJVFkzUmRFdDFUTUdUZDQ5dTRWTDd6R2lwV0hO?=
 =?utf-8?B?ZU9KRnQ4dks0ai9VODRPekhaSGNENTJ4dmxzYlFJQjZLYTNTSFYrWlMrYUFj?=
 =?utf-8?B?R09xVUlsVzIraU84dmxkTWx0V3hURUtpenVKbzFjeGpzRHluV2NPOVpHaGJM?=
 =?utf-8?B?M0ZnM0hqb1FvSGcrT0xxUHVGNjBnbmg5anZEZXZXWGt2WTBOYW5tdkVGTi9B?=
 =?utf-8?B?N0t2RkpWdFpBQ2ZTcmpJSlgxNUQ5eWs2WGpDS09JbXBySCs5Z0NJR2hlZmJP?=
 =?utf-8?B?OHEvWHdwSldsTExjSHc3M2lNZy9uRy9rVE9WdFVuOUl6cE5rN0lyVUlBbXNp?=
 =?utf-8?B?WU5IeDBEZU5FQ0lyYktZbklvMUVLOVBTVnNaSFBxM3JnVmpXbFUrWDBPbzRq?=
 =?utf-8?B?NER0YnYzNzlZNVRJQWZMV0R5SllSYWlJbG1uOFV1bW1jRk12Qk5tdXcyejR5?=
 =?utf-8?B?SlRtZjhzc2xPN012dkNGbExzRU9KNTV3V0NRMzcxSlptRG1hTzNWMFBmS0RJ?=
 =?utf-8?B?SXVXR1dsb1o3d3U5TlVJQzcvK1REOWtDQWRablBCNzZFVmZjcEJHUytJL1Ex?=
 =?utf-8?B?K1NQVFh6N2dXaVVGRG1aekgwYkNOb3d2UElaTld6ZXgzZHh2V3pHZ1Y0c25v?=
 =?utf-8?B?WHBLTmFoS2c1RlFMd1cwUlZrNWpCZUJJQ2sxMjl4SFFROWEvc1RnMXk5eWNJ?=
 =?utf-8?B?bWtsOUQxR3JKVk00dUYrQzJ0U1BIUFNma1I5U1EvcHFpWnRsVDZxSG1Nd0lk?=
 =?utf-8?B?OWI2VW4rZmtIaEdVd0s0VkI0SVZ2d29XZklaOWpFMXF2blk3KzRWdm1lMm5F?=
 =?utf-8?B?UitjSGYwbWR5VWJvTXhmb1BraTF0YWVlSEM4SnUvUzIzdklpUDAzMXNyVnhx?=
 =?utf-8?B?Wnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5tsyDWgUzNDRn9eiqSmv0hKjOim8ZxSED+B1hJrI5slkRXFniqjJnlQA+N2jtPh0fli83wMZSkDgkNiB4bNJR2BHD+3yimcZ8hhTU6M4Ibr8p292w6gSzR4m7DdLMMV546GQ2/irZZjut0rSEMzDIDZmNea477Cm04O55J43R9yvKeFLznPI5I61P32ZableLrkPgdyrfQx2og26/pMxPQZK6FGwjD4xLR9iDWW3AP5y8WEtmTM1Ax1HC5HE6uTQj0RbISEy64ocMM2KytKJAs4tfd0jSbukzRoqgm19Mw8RPGwMIRMQijVVshGYUjv8rYte4uhQijwo3K0h2THz3HzXy+AqwPDaOp/ufC4M0CDVa8EioCaQKPVNJL7159GV5wJVcd5dJhBmzmUensDq7qmAPtEGUzDx+Dq528yFsyLNvNL4x6pfVSuxUttVTluhu3+xI4OCnj0+FHjco2q7xUI1y7FSnd/pl/IIy4kCCIx+4PnCZ4VUvXYgL2r0DCrLLcygI1e7b4YRlIDQh9uNH+6tgj7fG5//Eyl2RycAyumKeyXE432eZh4CBwLO2AFHr43f/RYpJlthnWVENdiFLM6SBbtJvmsdTEZ1zv7JdzU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 590728d1-68bb-408a-5f62-08dd403facc3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR10MB6505.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 08:33:58.5003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RhaPP6BWSCzcMQ4St3U5Sve14BHzsyGPBZqwSp/UGZzGRsDK1x1NkDBEuld5KKV24gBx3+kyGtEk6KfEFUV+nXSwwiZqsMnTFQ8w4eoIetE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7344
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501290069
X-Proofpoint-GUID: jOSxukBeqx8pGhOhHuoK3ssz4HyOcPSo
X-Proofpoint-ORIG-GUID: jOSxukBeqx8pGhOhHuoK3ssz4HyOcPSo

--------------wonoJ16T7QXkai8nxcHszemM
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi All,

+stable

There seems to be some formatting issues in my log output. I have
attached it as a file.

Thanks & Regards,
Harshvardhan

On 29/01/25 1:57 PM, Harshvardhan Jha wrote:
> Hello there,
>
> The stable tag v5.4.289 seems to fail to boot with following trace:
>
> [ OK ] Created slice system-serial\x2dgetty.slice. [ OK ] Listening on
> udev Control Socket. [ OK ] Reached target Local Encrypted Volumes. [ OK
> ] Listening on /dev/initctl Compatibility Named Pipe. [ OK ] Listening
> on Delayed Shutdown Socket. [ OK ] Created slice
> system-selinux\x2dpol...grate\x2dlocal\x2dchanges.slice. [ OK ] Stopped
> target Initrd File Systems. [ OK ] Listening on LVM2 metadata daemon
> socket. Mounting Debug File System... [ OK ] Listening on networkd
> rtnetlink socket. [ OK ] Listening on Device-mapper event daemon FIFOs.
> Starting Monitoring of LVM2 mirrors... dmeventd or progress polling... [
> OK ] Created slice User and Session Slice. Starting Read and set NIS
> domainname from /etc/sysconfig/network... Starting Load legacy module
> configuration... [ OK ] Set up automount Arbitrary Executab...ats File
> System Automount Point. [ OK ] Created slice
> system-rdma\x2dload\x2dmodules.slice. [ OK ] Started Forward Password
> Requests to Wall Directory Watch. [ OK ] Reached target Paths. Starting
> Remount Root and Kernel File Systems... [ OK ] Created slice
> system-getty.slice. Starting Create list of required st... nodes for the
> current kernel... Starting Set Up Additional Binary Formats... [ OK ]
> Stopped target Initrd Root File System. [ OK ] Reached target Slices. [
> OK ] Created slice system-systemd\x2dfsck.slice. [ OK ] Mounted POSIX
> Message Queue File System. [ OK ] Mounted Debug File System. [ OK ]
> Started Read and set NIS domainname from /etc/sysconfig/network.
> Mounting Arbitrary Executable File Formats File System... [ OK ] Started
> Journal Service. [ OK ] Started Create list of required sta...ce nodes
> for the current kernel. Starting Create Static Device Nodes in /dev... [
> OK ] Started LVM2 metadata daemon. [ OK ] Started Remount Root and
> Kernel File Systems. Starting Load/Save Random Seed... Starting udev
> Coldplug all Devices... Starting Flush Journal to Persistent Storage...
> [FAILED] Failed to start Load Kernel Modules. See 'systemctl status
> systemd-modules-load.service' for details. Starting Apply Kernel
> Variables... [ OK ] Started Load/Save Random Seed. [ OK ] Mounted
> Arbitrary Executable File Formats File System. [ OK ] Started Set Up
> Additional Binary Formats. [ OK ] Started Create Static Device Nodes in
> /dev. Starting udev Kernel Device Manager... [ OK ] Started Apply Kernel
> Variables. [ OK ] Started Load legacy module configuration. [ OK ]
> Started udev Coldplug all Devices. Starting udev Wait for Complete
> Device Initialization... [ 24.427217] megaraid_sas 0000:65:00.0:
> megasas_build_io_fusion 3273 sge_count (-12) is out of range. Range is:
> 0-256
>
> [   24.427217] megaraid_sas 0000:65:00.0: megasas_build_io_fusion 3273
> sge_count (-12) is out of range. Range is:  0-256 kept showing
> infinitely. It kept popping until I reset the system.
>
> Reverting the following patch seems to fix the issue:
>
> commit 07c9cccc4c3fecba175a7e5aafba6370758f5ce2
> Author: Juergen Gross <jgross@suse.com>
> Date:   Fri Sep 13 12:05:02 2024 +0200
>
>     xen/swiotlb: add alignment check for dma buffers
>
>     [ Upstream commit 9f40ec84a7976d95c34e7cc070939deb103652b0 ]
>
>     When checking a memory buffer to be consecutive in machine memory,
>     the alignment needs to be checked, too. Failing to do so might result
>     in DMA memory not being aligned according to its requested size,
>     leading to error messages like:
>
>       4xxx 0000:2b:00.0: enabling device (0140 -> 0142)
>       4xxx 0000:2b:00.0: Ring address not aligned
>       4xxx 0000:2b:00.0: Failed to initialise service qat_crypto
>       4xxx 0000:2b:00.0: Resetting device qat_dev0
>       4xxx: probe of 0000:2b:00.0 failed with error -14
>
>     Fixes: 9435cce87950 ("xen/swiotlb: Add support for 64KB page
> granularity")
>     Signed-off-by: Juergen Gross <jgross@suse.com>
>     Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>     Signed-off-by: Juergen Gross <jgross@suse.com>
>     Signed-off-by: Sasha Levin <sashal@kernel.org>
>
> I tried changing swiotlb grub command line arguments but that didn't
> seem to help much unfortunately and the error was seen again.
>
> Thanks & Regards,
> Harshvardhan
>
--------------wonoJ16T7QXkai8nxcHszemM
Content-Type: text/plain; charset=UTF-8; name="history.txt"
Content-Disposition: attachment; filename="history.txt"
Content-Transfer-Encoding: base64

WyAgT0sgIF0gQ3JlYXRlZCBzbGljZSBzeXN0ZW0tc2VyaWFsXHgyZGdldHR5LnNsaWNlLgpbICBP
SyAgXSBMaXN0ZW5pbmcgb24gdWRldiBDb250cm9sIFNvY2tldC4KWyAgT0sgIF0gUmVhY2hlZCB0
YXJnZXQgTG9jYWwgRW5jcnlwdGVkIFZvbHVtZXMuClsgIE9LICBdIExpc3RlbmluZyBvbiAvZGV2
L2luaXRjdGwgQ29tcGF0aWJpbGl0eSBOYW1lZCBQaXBlLgpbICBPSyAgXSBMaXN0ZW5pbmcgb24g
RGVsYXllZCBTaHV0ZG93biBTb2NrZXQuClsgIE9LICBdIENyZWF0ZWQgc2xpY2Ugc3lzdGVtLXNl
bGludXhceDJkcG9sLi4uZ3JhdGVceDJkbG9jYWxceDJkY2hhbmdlcy5zbGljZS4KWyAgT0sgIF0g
U3RvcHBlZCB0YXJnZXQgSW5pdHJkIEZpbGUgU3lzdGVtcy4KWyAgT0sgIF0gTGlzdGVuaW5nIG9u
IExWTTIgbWV0YWRhdGEgZGFlbW9uIHNvY2tldC4KICAgICAgICAgTW91bnRpbmcgRGVidWcgRmls
ZSBTeXN0ZW0uLi4KWyAgT0sgIF0gTGlzdGVuaW5nIG9uIG5ldHdvcmtkIHJ0bmV0bGluayBzb2Nr
ZXQuClsgIE9LICBdIExpc3RlbmluZyBvbiBEZXZpY2UtbWFwcGVyIGV2ZW50IGRhZW1vbiBGSUZP
cy4KICAgICAgICAgU3RhcnRpbmcgTW9uaXRvcmluZyBvZiBMVk0yIG1pcnJvcnMuLi4gZG1ldmVu
dGQgb3IgcHJvZ3Jlc3MgcG9sbGluZy4uLgpbICBPSyAgXSBDcmVhdGVkIHNsaWNlIFVzZXIgYW5k
IFNlc3Npb24gU2xpY2UuCiAgICAgICAgIFN0YXJ0aW5nIFJlYWQgYW5kIHNldCBOSVMgZG9tYWlu
bmFtZSBmcm9tIC9ldGMvc3lzY29uZmlnL25ldHdvcmsuLi4KICAgICAgICAgU3RhcnRpbmcgTG9h
ZCBsZWdhY3kgbW9kdWxlIGNvbmZpZ3VyYXRpb24uLi4KWyAgT0sgIF0gU2V0IHVwIGF1dG9tb3Vu
dCBBcmJpdHJhcnkgRXhlY3V0YWIuLi5hdHMgRmlsZSBTeXN0ZW0gQXV0b21vdW50IFBvaW50Lgpb
ICBPSyAgXSBDcmVhdGVkIHNsaWNlIHN5c3RlbS1yZG1hXHgyZGxvYWRceDJkbW9kdWxlcy5zbGlj
ZS4KWyAgT0sgIF0gU3RhcnRlZCBGb3J3YXJkIFBhc3N3b3JkIFJlcXVlc3RzIHRvIFdhbGwgRGly
ZWN0b3J5IFdhdGNoLgpbICBPSyAgXSBSZWFjaGVkIHRhcmdldCBQYXRocy4KICAgICAgICAgU3Rh
cnRpbmcgUmVtb3VudCBSb290IGFuZCBLZXJuZWwgRmlsZSBTeXN0ZW1zLi4uClsgIE9LICBdIENy
ZWF0ZWQgc2xpY2Ugc3lzdGVtLWdldHR5LnNsaWNlLgogICAgICAgICBTdGFydGluZyBDcmVhdGUg
bGlzdCBvZiByZXF1aXJlZCBzdC4uLiBub2RlcyBmb3IgdGhlIGN1cnJlbnQga2VybmVsLi4uCiAg
ICAgICAgIFN0YXJ0aW5nIFNldCBVcCBBZGRpdGlvbmFsIEJpbmFyeSBGb3JtYXRzLi4uClsgIE9L
ICBdIFN0b3BwZWQgdGFyZ2V0IEluaXRyZCBSb290IEZpbGUgU3lzdGVtLgpbICBPSyAgXSBSZWFj
aGVkIHRhcmdldCBTbGljZXMuClsgIE9LICBdIENyZWF0ZWQgc2xpY2Ugc3lzdGVtLXN5c3RlbWRc
eDJkZnNjay5zbGljZS4KWyAgT0sgIF0gTW91bnRlZCBQT1NJWCBNZXNzYWdlIFF1ZXVlIEZpbGUg
U3lzdGVtLgpbICBPSyAgXSBNb3VudGVkIERlYnVnIEZpbGUgU3lzdGVtLgpbICBPSyAgXSBTdGFy
dGVkIFJlYWQgYW5kIHNldCBOSVMgZG9tYWlubmFtZSBmcm9tIC9ldGMvc3lzY29uZmlnL25ldHdv
cmsuCiAgICAgICAgIE1vdW50aW5nIEFyYml0cmFyeSBFeGVjdXRhYmxlIEZpbGUgRm9ybWF0cyBG
aWxlIFN5c3RlbS4uLgpbICBPSyAgXSBTdGFydGVkIEpvdXJuYWwgU2VydmljZS4KWyAgT0sgIF0g
U3RhcnRlZCBDcmVhdGUgbGlzdCBvZiByZXF1aXJlZCBzdGEuLi5jZSBub2RlcyBmb3IgdGhlIGN1
cnJlbnQga2VybmVsLgogICAgICAgICBTdGFydGluZyBDcmVhdGUgU3RhdGljIERldmljZSBOb2Rl
cyBpbiAvZGV2Li4uClsgIE9LICBdIFN0YXJ0ZWQgTFZNMiBtZXRhZGF0YSBkYWVtb24uClsgIE9L
ICBdIFN0YXJ0ZWQgUmVtb3VudCBSb290IGFuZCBLZXJuZWwgRmlsZSBTeXN0ZW1zLgogICAgICAg
ICBTdGFydGluZyBMb2FkL1NhdmUgUmFuZG9tIFNlZWQuLi4KICAgICAgICAgU3RhcnRpbmcgdWRl
diBDb2xkcGx1ZyBhbGwgRGV2aWNlcy4uLgogICAgICAgICBTdGFydGluZyBGbHVzaCBKb3VybmFs
IHRvIFBlcnNpc3RlbnQgU3RvcmFnZS4uLgpbRkFJTEVEXSBGYWlsZWQgdG8gc3RhcnQgTG9hZCBL
ZXJuZWwgTW9kdWxlcy4KU2VlICdzeXN0ZW1jdGwgc3RhdHVzIHN5c3RlbWQtbW9kdWxlcy1sb2Fk
LnNlcnZpY2UnIGZvciBkZXRhaWxzLgogICAgICAgICBTdGFydGluZyBBcHBseSBLZXJuZWwgVmFy
aWFibGVzLi4uClsgIE9LICBdIFN0YXJ0ZWQgTG9hZC9TYXZlIFJhbmRvbSBTZWVkLgpbICBPSyAg
XSBNb3VudGVkIEFyYml0cmFyeSBFeGVjdXRhYmxlIEZpbGUgRm9ybWF0cyBGaWxlIFN5c3RlbS4K
WyAgT0sgIF0gU3RhcnRlZCBTZXQgVXAgQWRkaXRpb25hbCBCaW5hcnkgRm9ybWF0cy4KWyAgT0sg
IF0gU3RhcnRlZCBDcmVhdGUgU3RhdGljIERldmljZSBOb2RlcyBpbiAvZGV2LgogICAgICAgICBT
dGFydGluZyB1ZGV2IEtlcm5lbCBEZXZpY2UgTWFuYWdlci4uLgpbICBPSyAgXSBTdGFydGVkIEFw
cGx5IEtlcm5lbCBWYXJpYWJsZXMuClsgIE9LICBdIFN0YXJ0ZWQgTG9hZCBsZWdhY3kgbW9kdWxl
IGNvbmZpZ3VyYXRpb24uClsgIE9LICBdIFN0YXJ0ZWQgdWRldiBDb2xkcGx1ZyBhbGwgRGV2aWNl
cy4KICAgICAgICAgU3RhcnRpbmcgdWRldiBXYWl0IGZvciBDb21wbGV0ZSBEZXZpY2UgSW5pdGlh
bGl6YXRpb24uLi4KWyAgIDI0LjQyNzIxN10gbWVnYXJhaWRfc2FzIDAwMDA6NjU6MDAuMDogbWVn
YXNhc19idWlsZF9pb19mdXNpb24gMzI3MyBzZ2VfY291bnQgKC0xMikgaXMgb3V0IG9mIHJhbmdl
LiBSYW5nZSBpczogIDAtMjU2Cg==

--------------wonoJ16T7QXkai8nxcHszemM--

