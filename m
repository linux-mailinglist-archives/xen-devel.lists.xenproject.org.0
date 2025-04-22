Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 878BAA977FA
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 22:47:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963606.1354568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7KWA-0000DG-8d; Tue, 22 Apr 2025 20:46:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963606.1354568; Tue, 22 Apr 2025 20:46:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7KWA-0000AL-5R; Tue, 22 Apr 2025 20:46:58 +0000
Received: by outflank-mailman (input) for mailman id 963606;
 Tue, 22 Apr 2025 20:46:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G4yS=XI=oracle.com=ross.philipson@srs-se1.protection.inumbo.net>)
 id 1u7KW8-0000A9-7x
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 20:46:56 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea27f61f-1fba-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 22:46:51 +0200 (CEST)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MKg1Fo030814;
 Tue, 22 Apr 2025 20:46:38 GMT
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4644cswgan-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Apr 2025 20:46:35 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 53MKOAX7005171; Tue, 22 Apr 2025 20:46:18 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 46429a5qe1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Apr 2025 20:46:18 +0000
Received: from DS0PR10MB7224.namprd10.prod.outlook.com (2603:10b6:8:f5::14) by
 SA2PR10MB4524.namprd10.prod.outlook.com (2603:10b6:806:118::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.35; Tue, 22 Apr 2025 20:46:16 +0000
Received: from DS0PR10MB7224.namprd10.prod.outlook.com
 ([fe80::c57:383f:cfb2:47f8]) by DS0PR10MB7224.namprd10.prod.outlook.com
 ([fe80::c57:383f:cfb2:47f8%5]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 20:46:16 +0000
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
X-Inumbo-ID: ea27f61f-1fba-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=Vf5u8qy1ulQX9fTmNEmHZg7Co1btDNkIPrSJNM+6j1U=; b=
	PXbyO5qMr/s9FUDhrKo4169reGqeH2s5OvN4XAyaT7GpKUp8zJXYAH/MZUUk9gKj
	6wiHA3583JAcixKGcmOoSSLCv7Weh2PUXut/yajsu/wUhKrlSpEKGma/QstmxZQJ
	Daj0xKmIfExHlLwKppvaSjBjoFDd5rDn4xovCauptPe4MPXgv/fRqXgL8v1v8xO/
	l5qWxMFeA/SbSLsWJM5KLH2RAObkC1b0MzcrLp+i8MNnk8m1zXQM0jxFA43wCrQo
	DTf65qCV10moTFmBSf8BUJL2O+MYteWYrIRZZGGeAmWa9rKQkA+F1AJTPaGNFThJ
	Cceotsq67mpGbkOcmJE88A==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NCJNSjJaHoRAZUvoN2YIsqU0TsyuqCUZxJZTgcUEtXYZtfJezO4Fj8SYo7v0qU/WiYZFwh1hprejDSbcv7uTs6KRr41/bYGa6eMbjPdXHscbQ2Y4l9+EYROObtZ3d74A22wza7A4CbqYP0H8dQVJTa54VKfPU1uhasm+wTDkW2kqHKSYRscSDsZtWCbX33jIz7XUIyONGigQff7aFaXV4+mpKkJ/zH/ZmhdL2I9vrZLuQo4q6T6HsvXXMm+E2l7RmIDlQeAP6qieOQ32XN1EjrEVFXbXigRJ4ZDdTiGUZF8fQCByEiXVqx/q5iKu3loKdKmKpv2oFI9fXxhCIWsPYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vf5u8qy1ulQX9fTmNEmHZg7Co1btDNkIPrSJNM+6j1U=;
 b=I+J98LcF5fzBfemgQ/ZcvqzvOpYJCVYMlGu96b/bVbeFhig/frIRJqYrUgnSplEMD+4B/tVZfLqhOM6+GQ37gWWB2Db9U0AEr0VkKewItpMXbgffewLtRUKdR5eyxeLP+/BkpCRqRsyMKCb3Lcs5njTfFcixOg5Qh5rl6rmqNONA+UDzR+RGWdWx4Hk21HwbEx7pcotFk1VrJuiBSPcs4KCJ4ofC0wX8yjlLx8POy0UfTOtChTMAvHA7Lp34K9udRca9vT7IbPjzzNVi2XruvMjFe3Z0U5ViNgSRGQStzAfFcp27CWOpZc3K/pRb6fDPrVf89NIM3401Gt+CYWorbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vf5u8qy1ulQX9fTmNEmHZg7Co1btDNkIPrSJNM+6j1U=;
 b=LrGPUreBS2YyBZJKlwW74XxACZ1Uh6wusgA5rE/oRKJrBNioSfSB8Pb+qTSdP/Q9sLh4n30hi5eGJXIISVsSVxDk8+LicvmiQuecnbJSslB5BdR9ToYfa49k/j7dWwpFnzCtPtCvvBTDPFcJ4Q/3uG/hsd7W03zncBO8SrLhC4s=
Message-ID: <87ad3627-088c-442b-bc2b-89586a082599@oracle.com>
Date: Tue, 22 Apr 2025 13:46:14 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/21] include/xen/slr_table.h: Secure Launch Resource
 Table definitions
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        Anthony PERARD <anthony.perard@vates.tech>,
        Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
        Julien Grall <julien@xen.org>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        trenchboot-devel@googlegroups.com
References: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
 <1cf5d940e666b2b292fc84ed1fbb8a95cd57f027.1745172094.git.sergii.dmytruk@3mdeb.com>
Content-Language: en-US
From: ross.philipson@oracle.com
In-Reply-To: <1cf5d940e666b2b292fc84ed1fbb8a95cd57f027.1745172094.git.sergii.dmytruk@3mdeb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH0PR07CA0114.namprd07.prod.outlook.com
 (2603:10b6:510:4::29) To DS0PR10MB7224.namprd10.prod.outlook.com
 (2603:10b6:8:f5::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7224:EE_|SA2PR10MB4524:EE_
X-MS-Office365-Filtering-Correlation-Id: b700b0ed-04a0-46aa-1e81-08dd81deba54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eG1wbDYzTU95Mkt3OExQZ0YrbHNiSmFhZFROR205S3NLVHBWWFlKblJMU3d3?=
 =?utf-8?B?emZHVUV2YWdIM2pVMytVcFd4b2U1ZVR2NEJPbktnQkFYZFd6blpLU1AzZVll?=
 =?utf-8?B?citTbWwweVFZWkVoMEFyN0xzUWpDTlo0Vm1jNWF2WU1tZGVJMVp3QU13ZTM1?=
 =?utf-8?B?T3ZMd3ovbGFlK0ZRUDZIaThYT3ZxOUZsSGNNTjJ1a1ByanRLQTNsREZzMnNq?=
 =?utf-8?B?aWZ2UUdhaitYUy92Rk1sOVhoVjlBKzNPOFVJR1lOZTFldU05b1dQblFNNVRi?=
 =?utf-8?B?dUhuQWcyVXlWZUUvZ05GcDJDeFRVUVVXeFQ5NG0yY1N0SjJpYmhMbHJtM0RU?=
 =?utf-8?B?S1N0dnZYd1k4Mjc3VlNOOG5pR2dZbTczcWZucFl5QlpCeDV6MHUwcmVaOXFV?=
 =?utf-8?B?VVpqd2U5Z1ErYVRxNXdsT3c1YjhVNTJtNUFTNU83UEZUbUNocE9NUkN6QzV2?=
 =?utf-8?B?MGtLUE5EKzVRNFpCNmNZaVhkNklSWFdwWFdOMFA1VEtWcjI3MTdLZmNmS3N5?=
 =?utf-8?B?ZWN0ZXg1VGRxV3RHZDhXQk40SlVqQjBqcng0NFg1YXE5Q0ltTzc0WjBJdEsx?=
 =?utf-8?B?TjVncjBOYnJyczVkU0ViRnduMG05QnpmRlpqSkZKV0NoTTJNcE84MnRTM09w?=
 =?utf-8?B?Rzc2RHp1WDFhR0N6YkxmQ1E2SGdYSGZRYVpvbVpmK05OVWRyQ3JWTGU4UGp4?=
 =?utf-8?B?ZU1JcHpFYlJ1MUl1T1FRWWwvRGMrd2pnWDN0TVdiNWhIQk9vbU9haVkwcjNB?=
 =?utf-8?B?ZVpLR0dhYTNpRHl0Q0E2Y0E5MytvNC92VmNRRXZ2T0JPVkErbExJOU9oZWhE?=
 =?utf-8?B?d2hCSTZRd3VOT1hRZ2RvWmEzalR5R3duVC9VUXpPL3NydHdxQUJXbTFaY2w2?=
 =?utf-8?B?M28yZHBHbzlsZVM2YjVGdWNHdm5IUkF0aFc2eDhhc2wzcGYvb0t2elZkM212?=
 =?utf-8?B?clFkTXVFTW1FQmZGbWg1MnFoeHRPN3pmUHkvODRzOFB1MnFlaGpXNkplajh0?=
 =?utf-8?B?Y1NnTFVBZC9WeU51c1FnTzRHYmVKRGtwdzh6VmJkZHdGeUVLRFZSUGxjamdr?=
 =?utf-8?B?UW9yczJaOHJMcXZNK2lLRUZhN0ZKUmNKc3ZuTkFuNTE3TFowVllpVHdJclhy?=
 =?utf-8?B?YzVOZExTWitwVk1mVHpmUUlhUDRuSUN2RnAvNityNXIrWnBmRGpLcFJxa3Bj?=
 =?utf-8?B?TDlIWURZWmRFdUpkdHpmQ0NMT0pDVkluMkZRUjEzNG5xMklCMzgycVgzU2Q5?=
 =?utf-8?B?QkVncXlrWkNFSXM3ZXcwVXlqa01uOG1OdmJpNEd6SnAwUzJid1U5clZjcURX?=
 =?utf-8?B?MEJiNmZPQVNCVnE2NjdkVUJnUnpLQ1F1YldMcFEyL1FkUnpIRUgrODB6V1Qw?=
 =?utf-8?B?RTc5Vk1SZ01ScVBJOFd3VldreVlDbzIvRTRKWFZzdVdMZEN4bFVlZzdzUVpO?=
 =?utf-8?B?MDlWQU5BVXpNcXdpc1kvS3ppR01pOWZIYmVHUlphTWJFYjE0ZUNuUkFBcTZL?=
 =?utf-8?B?Ymh0ZmFMOUFKMFlpUnRWMkxSc3crdnhKd0pmbXRNVU9FdU9UZFFFSVh5QTRa?=
 =?utf-8?B?VlFDc2F4RWFFVjR2NE8yb1RZVlBLME5qaWluWkpGcTlSN2xpUmltMkQrN1Fh?=
 =?utf-8?B?ZGVxZHFMQmRTYzBaYmJ5djBvZG4zYTRQZGhQKy9NTG9JMi8yQU8xQUJNK2lw?=
 =?utf-8?B?ckYwYk1GOXkxSzljY3Y0SEJyOGtsbzF2M3c5dkJMd2RFem5hNjlvWllobHRD?=
 =?utf-8?B?ZmRQRFFpekRRZUI5WTRNaFZ6TytXTFI5cDEyK29vVUxDTnNHSkZlZzl3ZjhR?=
 =?utf-8?B?eCs2YVJ6Q1lzaHZOVzNGVVArYzN2NmIzWWtjbk5MUnZQQ1VUQjNrS1lnSkow?=
 =?utf-8?B?eDVGMjZnZUZDenZKQnM3NFpCUkJTUXNJellNcU5TU1cvdWIxU2JWeFJSS21T?=
 =?utf-8?Q?cWrUDdmSHxM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7224.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGRqUmljbW9JcDk4NzlEMlRPRmk2blJYOFFjTjk5RlU3TC9Eb1VVMGR1YjRj?=
 =?utf-8?B?RmxxQTFKNGU4bUpOOGtJRFJ1M09aL0EzUktXaU9NQkp0ckRieW1kekZSVE5l?=
 =?utf-8?B?a28wcmRwbmg1U0xTczNJYlYzTm5WOXZ2d0dwb00rSDZ4ZDZWRm5WMC9hcTQ5?=
 =?utf-8?B?cGN6WmpiOVZNMkZoMjc0MmduZjV5c0htUkJYb2orejNNWG13SUVDZ21BNXMv?=
 =?utf-8?B?NGVlRmhVMFR5aGxGc2VJNXlOcXFJZ2gyUElNYTJxUDZqOVBvV210M0pGbjFj?=
 =?utf-8?B?eFQwb1RKd1N1dk9NaEtUdFM4Q3JsZDdpVjE4YWdHaWt2VkdZMXdtUkdOMHA1?=
 =?utf-8?B?NnlBamxnV2k0aVZGOFdUNndyUW5aQkE3aVM3ZjEwUG50c0UzeXFmczRrVHFH?=
 =?utf-8?B?TDFvak5EeEdYYmExRzg4OWg3QnBvMnpYajgrcmdrL0hBYWdsOElKS0dXaSsr?=
 =?utf-8?B?QmExRmgwZU5MUkxRZ0RCTDdWYlJBL1RLbnpaUGNHNDdaS0tJUUxXSGtoK2ww?=
 =?utf-8?B?NnNUeGx5ZWNVV1ZKTVkvRzQxRVdaUlB0bmpGMUduM1hVM1ZJMGs3ckxpZ1Zr?=
 =?utf-8?B?MGkySEZPeWFSRmlQSm83MlhLUTVUSUNCdW1HUTE3TXlWQzB3eE1PSWl3NGRD?=
 =?utf-8?B?ajVVemlrZ3FmUjl2K2MxWjVNVEZTQng4WUFrUUVsVWxzRFo4b0RaQUhHeHRs?=
 =?utf-8?B?ckRxaWFRMnh6K2ZMRmZOb2FHRmtMa3IxS3A0T2w5bkhJWE5zdlZuUno3UkVw?=
 =?utf-8?B?YzNsTS9odlpHREwwd0tkbTZ3UERYcmZhdnZ4SGQxZ3BnKzhaQ1RTZzhKL2RQ?=
 =?utf-8?B?aWprNmpwbDRkNjNsZGdsOHIvaHBPQ1U3VnFaQ0puVmU1UG5jVWRNR0hrZHJU?=
 =?utf-8?B?N21WSTNRdFJUSmpTNFh0RTA0WGp6aWoySjJnalNQdXNCbHpxbVN1cTNpaXVo?=
 =?utf-8?B?WGF5SWN6SEpYclJPakRYVUZzKzBiRk5ML0dBWUdCcjBLbGdlRjdRWjJLSVk2?=
 =?utf-8?B?bG91Rm1CQ0JjUHpjNGtac05na2l1TGhXRXpTcTFOR0xPbE45L25Dc29sR0Np?=
 =?utf-8?B?NU9oTFQvMU4xeVVGL3ZOd2F3djF5ZUNhY0kwUU1BZ3NYV3kwUlRJdmdRNHhW?=
 =?utf-8?B?SVE0aUUreUR1TVkxQWFPdS9tZUhBRGpOdEJrWVZsVDRZcG9yYTF3a2RKRzhs?=
 =?utf-8?B?bCs4WHZ0WG5SOTNLODgzM1B5T0hsRTV2akt1em01bHdSZ3dDY056cG02M2Vq?=
 =?utf-8?B?Qi9KQUk4ZXBtQVUydDAvMFFqT1lGTExzRyttY0hIYlFwQUcyK3pSQWY0ZEFL?=
 =?utf-8?B?YlhaQWZsdXF2OWE2Q1ErRkwvMzM5UDNnVDI4Qm94bndsUkVSTGNkM3Fzb1ht?=
 =?utf-8?B?Zk9mQ2RGSURRK2ZlYmhZY1lhQUVEOTVxSnJBcU1nSmVtb1BTT2hobHpycHBz?=
 =?utf-8?B?Zi9keHhaTS9YbWVxV3BpTFNjcFFydXB3SUV3Rno2NmhwMkQ3YjM2WG1FR25X?=
 =?utf-8?B?d1lVNVk4a3RnSEM3TUpBYjFubG5zVEJTeFI1Y3pZUzBlaTNzdU5kc1RrQjVr?=
 =?utf-8?B?bW9jZ3o2SThwOXRsdG4yVnExeDhncGZFemtSZnQrd2xpaDByc04zcURMTWpY?=
 =?utf-8?B?L0ZTQkZMN2JPSkV1Qmo3dW1IVDQ4eWJ5U2dGTytpbGZiZTBIemk5aE1FMnl1?=
 =?utf-8?B?TmhMaWI1SmlmQTc2Nm5NcnpYaEd0b3U3RVd2cnZ4emRoSWx5TVRRUXhObllY?=
 =?utf-8?B?MlF2alpQcUlQb2FIVnZtTHB4ZnZxclZvNWJZdEtuSXA1Z2Q0RnhSZFBzYnBM?=
 =?utf-8?B?ajUrZVkzaGVKdUhiVnRuZzE3eFE0QkdGN3lGNm91VGJQLzFVa05OSmE5ejZv?=
 =?utf-8?B?N0s0ZnNXR0Q0R2w3clp0M3R0cks2bDdNSkg3TERWck43Z0tQcmdCcFM2Uzd6?=
 =?utf-8?B?dXdHVWZHNEtJOXllRi85dFJaQmxpcmZKOFF5bkFvNzlJTzZ2Z1pEYndId05v?=
 =?utf-8?B?QnR6TjBUUTZUcFovQkY0SHdEdVhnK3dwclNKVXJUeHFraTN1NHA3TnNwdWRx?=
 =?utf-8?B?bW40YnZIalpFdlpQakg3WXA4YkMra2VENWZDMFhlQ1FLS291ZHJZWDdEVmpO?=
 =?utf-8?B?SXVvWldBOUxlazBKSVIwYXFFdFIzdmJHRGkxZWNnTG5CWnRCUnRBckQ1UUtN?=
 =?utf-8?B?R0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hNCXVs4X0I0JS644UZXcDj+YVA3jBAOYtDY26wOVqv+ph/s1FvSpsaoXO+CUnCRR1Cc3YE2/gYFWg8kdJq2LIJ2lWc7FZk/Q/AN4EdBp4HLUK1hfzRnchnaP/uakaJoRMDbkBwvKBbGfZGpfmh9xWUYf0s/vozssLEwAVcLCJMIJDdueDW6mD6qbJrQZ5E5b2zKdUL1Bmi5OS+0x66VQaHcLtWWdNV/oGIf6CkLwCdqAXNIgMPP6+qLbtqT4AdMm8ZMCLge9t3A8OA1yb7O6EloQZ7j6rrZTX+9dU0HFFFb7GTHnEOZaY2KavkSemi1YM3wbHOBMUqG15VdwpRudiyeP5pRKVY/AvHMQRPOhWMkQiBmkjLSo7F9mFWpDGgS+2XpqXvxZNeXIfAKsASJDmNs5vfAHjKGrtwy6xwrBub3W595dJE2XxfDSDyCbiI+iImlNZt0PeTKQt7LBPvR5OSVXrctyKRKD7U4V4r34RleDNlZTquBTedShKX7lxTDsG93EV2hlho5DcdAPcy8wElw9FWHgxYj/9HMm767V880uA+Wmpxa8RghHa2eytrYIvV/Ik7f7SZsq54+ceD6ddSyKvOCg7VBK+neTKq8/Cbs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b700b0ed-04a0-46aa-1e81-08dd81deba54
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7224.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 20:46:16.7128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FqsR7t8xpLLRJSA00NP9zNr8+tt4KZy8j/HD5uvdjpUlNtXmCqtfqVGo2gsxIDdT4etLyNc/Uta14RInrBfIZzpYBJsibV80h7Qez382Xkw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4524
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_10,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504220156
X-Proofpoint-ORIG-GUID: G69b56GIzMtGgdThksJ7rbJdBmxvyuIw
X-Proofpoint-GUID: G69b56GIzMtGgdThksJ7rbJdBmxvyuIw

On 4/22/25 8:06 AM, Sergii Dmytruk wrote:
> The file provides constants, structures and several helper functions for
> parsing SLRT.
> 
> Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
> ---
>   xen/include/xen/slr_table.h | 274 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 274 insertions(+)
>   create mode 100644 xen/include/xen/slr_table.h
> 
> diff --git a/xen/include/xen/slr_table.h b/xen/include/xen/slr_table.h
> new file mode 100644
> index 0000000000..e9dbac5d0a
> --- /dev/null
> +++ b/xen/include/xen/slr_table.h
> @@ -0,0 +1,274 @@
> +/* SPDX-License-Identifier: GPL-3.0-or-later */
> +
> +/*
> + *  Copyright (C) 2023  Oracle and/or its affiliates.
> + *
> + *  Secure Launch Resource Table definitions
> + */
> +
> +#ifndef _SLR_TABLE_H
> +#define _SLR_TABLE_H
> +
> +#include <xen/types.h>
> +
> +#define UEFI_SLR_TABLE_GUID \
> +    { 0x877a9b2a, 0x0385, 0x45d1, { 0xa0, 0x34, 0x9d, 0xac, 0x9c, 0x9e, 0x56, 0x5f } }
> +
> +/* SLR table header values */
> +#define SLR_TABLE_MAGIC         0x4452544d
> +#define SLR_TABLE_REVISION      1
> +
> +/* Current revisions for the policy and UEFI config */
> +#define SLR_POLICY_REVISION         1
> +#define SLR_UEFI_CONFIG_REVISION    1
> +
> +/* SLR defined architectures */
> +#define SLR_INTEL_TXT   1
> +#define SLR_AMD_SKINIT  2
> +
> +/* SLR defined bootloaders */
> +#define SLR_BOOTLOADER_INVALID  0
> +#define SLR_BOOTLOADER_GRUB     1
> +
> +/* Log formats */
> +#define SLR_DRTM_TPM12_LOG      1
> +#define SLR_DRTM_TPM20_LOG      2
> +
> +/* DRTM Policy Entry Flags */
> +#define SLR_POLICY_FLAG_MEASURED    0x1
> +#define SLR_POLICY_IMPLICIT_SIZE    0x2
> +
> +/* Array Lengths */
> +#define TPM_EVENT_INFO_LENGTH       32
> +#define TXT_VARIABLE_MTRRS_LENGTH   32
> +
> +/* Tags */
> +#define SLR_ENTRY_INVALID       0x0000
> +#define SLR_ENTRY_DL_INFO       0x0001
> +#define SLR_ENTRY_LOG_INFO      0x0002
> +#define SLR_ENTRY_DRTM_POLICY   0x0003
> +#define SLR_ENTRY_INTEL_INFO    0x0004
> +#define SLR_ENTRY_AMD_INFO      0x0005
> +#define SLR_ENTRY_ARM_INFO      0x0006
> +#define SLR_ENTRY_UEFI_INFO     0x0007
> +#define SLR_ENTRY_UEFI_CONFIG   0x0008
> +#define SLR_ENTRY_END           0xffff
> +
> +/* Entity Types */
> +#define SLR_ET_UNSPECIFIED        0x0000
> +#define SLR_ET_SLRT               0x0001
> +#define SLR_ET_BOOT_PARAMS        0x0002
> +#define SLR_ET_SETUP_DATA         0x0003
> +#define SLR_ET_CMDLINE            0x0004
> +#define SLR_ET_UEFI_MEMMAP        0x0005
> +#define SLR_ET_RAMDISK            0x0006
> +#define SLR_ET_MULTIBOOT2_INFO    0x0007
> +#define SLR_ET_MULTIBOOT2_MODULE  0x0008
> +#define SLR_ET_TXT_OS2MLE         0x0010
> +#define SLR_ET_UNUSED             0xffff
> +
> +/*
> + * Primary SLR Table Header
> + */
> +struct slr_table
> +{
> +    uint32_t magic;
> +    uint16_t revision;
> +    uint16_t architecture;
> +    uint32_t size;
> +    uint32_t max_size;
> +    /* entries[] */
> +} __packed;
> +
> +/*
> + * Common SLRT Table Header
> + */
> +struct slr_entry_hdr
> +{
> +    uint32_t tag;
> +    uint32_t size;
> +} __packed;
> +
> +/*
> + * Boot loader context
> + */
> +struct slr_bl_context
> +{
> +    uint16_t bootloader;
> +    uint16_t reserved[3];
> +    uint64_t context;
> +} __packed;
> +
> +/*
> + * Prototype of a function pointed to by slr_entry_dl_info::dl_handler.
> + */
> +typedef void (*dl_handler_func)(struct slr_bl_context *bl_context);
> +
> +/*
> + * DRTM Dynamic Launch Configuration
> + */
> +struct slr_entry_dl_info
> +{
> +    struct slr_entry_hdr hdr;
> +    uint64_t dce_size;
> +    uint64_t dce_base;
> +    uint64_t dlme_size;
> +    uint64_t dlme_base;
> +    uint64_t dlme_entry;
> +    struct slr_bl_context bl_context;
> +    uint64_t dl_handler;
> +} __packed;
> +
> +/*
> + * TPM Log Information
> + */
> +struct slr_entry_log_info
> +{
> +    struct slr_entry_hdr hdr;
> +    uint16_t format;
> +    uint16_t reserved;
> +    uint32_t size;
> +    uint64_t addr;
> +} __packed;
> +
> +/*
> + * DRTM Measurement Entry
> + */
> +struct slr_policy_entry
> +{
> +    uint16_t pcr;
> +    uint16_t entity_type;
> +    uint16_t flags;
> +    uint16_t reserved;
> +    uint64_t size;
> +    uint64_t entity;
> +    char evt_info[TPM_EVENT_INFO_LENGTH];
> +} __packed;
> +
> +/*
> + * DRTM Measurement Policy
> + */
> +struct slr_entry_policy
> +{
> +    struct slr_entry_hdr hdr;
> +    uint16_t reserved[2];
> +    uint16_t revision;
> +    uint16_t nr_entries;
> +    struct slr_policy_entry policy_entries[];
> +} __packed;
> +
> +/*
> + * Secure Launch defined MTRR saving structures
> + */
> +struct slr_txt_mtrr_pair
> +{
> +    uint64_t mtrr_physbase;
> +    uint64_t mtrr_physmask;
> +} __packed;
> +
> +struct slr_txt_mtrr_state
> +{
> +    uint64_t default_mem_type;
> +    uint64_t mtrr_vcnt;
> +    struct slr_txt_mtrr_pair mtrr_pair[TXT_VARIABLE_MTRRS_LENGTH];
> +} __packed;
> +
> +/*
> + * Intel TXT Info table
> + */
> +struct slr_entry_intel_info
> +{
> +    struct slr_entry_hdr hdr;
> +    uint64_t boot_params_base;
> +    uint64_t txt_heap;
> +    uint64_t saved_misc_enable_msr;
> +    struct slr_txt_mtrr_state saved_bsp_mtrrs;
> +} __packed;
> +
> +/*
> + * AMD SKINIT Info table
> + */
> +struct slr_entry_amd_info
> +{
> +    struct slr_entry_hdr hdr;
> +    uint64_t next;
> +    uint32_t type;
> +    uint32_t len;
> +    uint64_t slrt_size;
> +    uint64_t slrt_base;
> +    uint64_t boot_params_base;
> +    uint16_t psp_version;
> +    uint16_t reserved[3];
> +} __packed;
> +
> +/*
> + * ARM DRTM Info table
> + */
> +struct slr_entry_arm_info
> +{
> +    struct slr_entry_hdr hdr;
> +} __packed;

You can probably ditch this for now.

> +
> +/*
> + * UEFI config measurement entry
> + */
> +struct slr_uefi_cfg_entry
> +{
> +    uint16_t pcr;
> +    uint16_t reserved;
> +    uint32_t size;
> +    uint64_t cfg; /* address or value */
> +    char evt_info[TPM_EVENT_INFO_LENGTH];
> +} __packed;
> +
> +struct slr_entry_uefi_config
> +{
> +    struct slr_entry_hdr hdr;
> +    uint16_t reserved[2];
> +    uint16_t revision;
> +    uint16_t nr_entries;
> +    struct slr_uefi_cfg_entry uefi_cfg_entries[];
> +} __packed;
> +
> +static inline void *
> +slr_end_of_entries(struct slr_table *table)
> +{
> +    return (uint8_t *)table + table->size;
> +}
> +
> +static inline struct slr_entry_hdr *
> +slr_next_entry(struct slr_table *table, struct slr_entry_hdr *curr)
> +{
> +    struct slr_entry_hdr *next = (struct slr_entry_hdr *)
> +                                 ((uint8_t *)curr + curr->size);
> +
> +    if ( (void *)next >= slr_end_of_entries(table) )
> +        return NULL;
> +    if ( next->tag == SLR_ENTRY_END )
> +        return NULL;
> +
> +    return next;
> +}
> +
> +static inline struct slr_entry_hdr *
> +slr_next_entry_by_tag (struct slr_table *table,
> +                       struct slr_entry_hdr *entry,
> +                       uint16_t tag)
> +{
> +    if ( !entry ) /* Start from the beginning */
> +        entry = (struct slr_entry_hdr *)((uint8_t *)table + sizeof(*table));
> +
> +    for ( ; ; )
> +    {
> +        if ( entry->tag == tag )
> +            return entry;
> +
> +        entry = slr_next_entry(table, entry);
> +        if ( !entry )
> +            return NULL;
> +    }
> +
> +    return NULL;
> +}

I am surprised you did not need the slr_add_entry() function. How do you 
add entries to the SLRT?

Thanks
Ross

> +
> +#endif /* _SLR_TABLE_H */


