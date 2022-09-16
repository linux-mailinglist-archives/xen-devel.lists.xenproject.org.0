Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 271DE5BB3F7
	for <lists+xen-devel@lfdr.de>; Fri, 16 Sep 2022 23:36:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408154.650869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZIzc-0004xF-SN; Fri, 16 Sep 2022 21:35:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408154.650869; Fri, 16 Sep 2022 21:35:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZIzc-0004v2-OU; Fri, 16 Sep 2022 21:35:24 +0000
Received: by outflank-mailman (input) for mailman id 408154;
 Fri, 16 Sep 2022 21:35:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u1X1=ZT=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1oZIza-0004uw-SH
 for xen-devel@lists.xenproject.org; Fri, 16 Sep 2022 21:35:23 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7635e80b-3607-11ed-9761-273f2230c3a0;
 Fri, 16 Sep 2022 23:35:20 +0200 (CEST)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28GLDsai029988;
 Fri, 16 Sep 2022 21:35:18 GMT
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jm8xcbn2e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Sep 2022 21:35:18 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 28GJmR69016348; Fri, 16 Sep 2022 21:35:16 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3jm8xewcyt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Sep 2022 21:35:16 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by DS0PR10MB6150.namprd10.prod.outlook.com (2603:10b6:8:c6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Fri, 16 Sep
 2022 21:35:15 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::70bc:4817:75d6:48d3]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::70bc:4817:75d6:48d3%6]) with mapi id 15.20.5632.017; Fri, 16 Sep 2022
 21:35:15 +0000
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
X-Inumbo-ID: 7635e80b-3607-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 to : cc : references : from : subject : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=emhWqIyC7PTSoMg/ElSrz0uYX6lmAr6CSIuPDXtAY+0=;
 b=PnEgi2YVhJnC1oB7K+I5esOX1ri7eqEI3XOb+wMZdKrf+BdzE9GfwaOIrTjUGAxM++lT
 9xzvRppP+cC2TyOe4kgPmtoUIEu2+XnAoTsM1PVr8Blnd00qhuvKVZPxm9xIvfQ5du50
 MKDNwaeC+iaygVw2GwvS5xZAnVqHBdlWRYA7ALezdNowjotSXEGYLg8LHSOaOq7yslR4
 uKf5Tz9NNKVGrsovbUouz9xJc4C9AXs/KLaO9mHmEPimVtN49EoXTVKX5oTe6vm9DDiP
 yrZ0Mgg8pQMWPfENhdAamXkAvVnqPYaOpsIKAaJ6kPMu3uzN/NxmZ2FZuxfuFr7G9T11 Bw== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cNry4+EKkKSOKiDLSUOje3tphoMzaMCdRTo1M7NSCD5Okk0rawcqBYzmD61IJO37wJyQTcjWmD/XUpUOtVOS2kktDO+d6VvVbeQNs08E2QHBsKZJ4RNHOoBMJiUFSIn1i80UNWWG6FrNarF997UbA0P6UxM37gzpSYnwt90ixbuJxIpdWi3fZVPL2XHT/TqdF02TZXOKYIVHE/vgCX0LHyf32ZdSuzBBClKlsiu3kFbXd0P6g25OXX+ixsEMY+iwSTp7xZk8zgTmCQj7u3tkyCnPc73t/3qN94fZvmCXuy/CPjAPyLuiKZ4ItgG1XMyuYPu/KSPp+WP1+8DrhFk4dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=emhWqIyC7PTSoMg/ElSrz0uYX6lmAr6CSIuPDXtAY+0=;
 b=UIVHpgfFra5d85bbZ35P10sHgxVYusGy7XriQjd9L05Fi9uuCJ+2dPxoPbDbORByYkORzYSRguqwNJN/WI8GCsql07mxUwdngEFmq7uw+wJgELBbkc6vd2Qt9DNizkLAiO5u2uJ3l+fC04+C4/YsqEyWHWwqdjq1QlMCBtnpsvdEyEDL1/gwAkDQA3D+am1CDRdnKj3OAI0Xysb0LDYq9al2AAZeFupCGtenjCF7gsb4vdHgnUt07IQYoV2Lw3Dn9cKKHZUd7H9vzLGU/vbWhxFS5SxSvdykka+z+xfon6joWGU6fmSe/ngo0LQ6q1t4ZD6iMJa0cUzvh1SmTju+Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=emhWqIyC7PTSoMg/ElSrz0uYX6lmAr6CSIuPDXtAY+0=;
 b=jnnPI22lgV89A2VWV4VuKxtFcwSs184uEElE1PepY6Ik5ad4Lb9FlTNU7QCiI40r1QHQGp5TBvsg72XPIWHs2MvMPgc0BZxBDLELyTmSxCzWDkA3AmU1b2Ld2JzLWC4kpmpmtVXbRaLN8AjRYCenxH7Yl9orl0HXcMbOGGHpiYc=
Message-ID: <9e79155f-0836-1b18-b648-b6e5422e89c8@oracle.com>
Date: Fri, 16 Sep 2022 17:35:12 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Tamas K Lengyel <tamas.lengyel@intel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
        Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <8294476a707d7f20799a40479cc0bf9a1cf07673.1663249988.git.tamas.lengyel@intel.com>
 <9fa4a72f-8b38-fbf0-40c7-8fcd6b34cf10@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] x86/vpmu: fix race-condition in vpmu_load
In-Reply-To: <9fa4a72f-8b38-fbf0-40c7-8fcd6b34cf10@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR07CA0014.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::24) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5009:EE_|DS0PR10MB6150:EE_
X-MS-Office365-Filtering-Correlation-Id: b94441ba-1aac-4454-b5c3-08da982b57d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DcifciAKfO7yvpmVmwaYYcruwy7guC632I1uSl4CqXSIts2dcaeGIddNhQishrz8sa/5bZfC4ctk/MBIChRbLjzI4lUNPEgTXNotCWoxDbh6e6SxMKUPKuiPjhzt8OHBe6t1X+wxeTU9flhpqL2o+SK552fanLtxBUt6xKz+Id0cHTPyTAhJP7/GgRmzyeMz/eUH03+HEAPTmaTShX8MZPWBW9fMi6V6cgFZXc2yDI0GcczEqIdwR8fIsEQ51MyMVXV/9QFDsaKUsCTgB9kUfywZEhWMLNAJypzKd7WBJrW1UVTd88Z6Zi4ewMXic+w0vBNKGtnENqRHohw+OIBcTY8FbLW5CdB8w9o9to2ot5/o4+YzrtXo08Hp23qePyYjnZya4LIbgDUFLwbh+MuUSLmJLCqkz+44aQNtFgnb5IT9DX7uXtrRlSZopy5R0/sKcuzkaJWWbvqZJAPum+Uvwj8KGmrhjH/rn+Db4AG9VVth/68JaG6gHe7UYXz5iP9Q0x+z+gzeBe4n3pUz1qlq0xAjPPgBnKnQY9C51P86R/8mBV0MWVxvbnA1x+hLVgXOzpgqSjnObhf7ur5H0tgmuFkW9MBjRGIu+vrEhmKtxCMrvqBTxTV+0nnmKFetGVrc/PlCeSv1OSVBVovP2IuMr7kjMv4nE+D6wydoIC9nmNC9FxRsQOKlxItBoxSeJ6RZCcemIzuQgrPqo6XQBeVcLPTNUvp88MT/BtD2zhNo/FsQqcDHfvUntt3EttOuUGCjNaliq+GiLzjin7QVjcb8/zVIiqUtged2WVjxdgNG+WA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(376002)(366004)(396003)(136003)(451199015)(31696002)(66946007)(186003)(8676002)(31686004)(66476007)(478600001)(5660300002)(54906003)(38100700002)(44832011)(66556008)(6666004)(8936002)(110136005)(2906002)(316002)(6512007)(86362001)(53546011)(2616005)(6506007)(41300700001)(26005)(83380400001)(36756003)(6486002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ak9wZXJrR2t6bTM2SEFkUzlLa3RSR0VRcE9jQU5PNHRva2QwWmsxT2V6U041?=
 =?utf-8?B?NFRMSnVVTzlCanNHWHhJTitRWU5IOHFSNkp4VmRLS3UydjhpS2ZHdnRFZDFx?=
 =?utf-8?B?M1BiYkJQRzcrRHhwZ0pBMS9LdGlMNktMUnlLSzU3T1VOcXNJTFRhSzZQRUNu?=
 =?utf-8?B?MUF2RVdFK2lSV3B2Z1ZKenNybVZXWnhlMkNhWFhwK2FUMk5yMEhNajVTU01r?=
 =?utf-8?B?US9JcU01SnVnTDZ0U3hNOUxnWUhiczhtUlZQY0NsQzF2NzNhYVAzSlQreVhQ?=
 =?utf-8?B?WWZ0S3hBOEl6V01YRXBvaWNCNUJYdVJ3RjYra0NrME5OSFlkdjdIT2N1NDBP?=
 =?utf-8?B?ZFRENWt5V2FpUWgwRThTVnIwOG9Uc2Vuazhjb0dORDJ4QVZkLytvZzlvWVFW?=
 =?utf-8?B?aGxGRkFCYWlzY3JDY3lSMHdYelF0d0hpRVd0eml4Q0piSW1PeXhBZllwaFpl?=
 =?utf-8?B?dWwwVkxKbVVTK3o2bmtGc3JQU0RaS3hSSkdZclFKZndzMzlxVVJmeE04cDdo?=
 =?utf-8?B?UmVPc0cySkg2cmdmTkxIc3ZWVVNLemhvRytqL29jTU9pV0E0ZEhzQ28yckpw?=
 =?utf-8?B?c2xwWEdQWVJkTTdOWnF6UExIelBoVHVnRW9rSjNXKzQyQ0VTblBhbXVOYUtH?=
 =?utf-8?B?R2NhcFpOWkNQaGRqSTNMNGpTcHdMKzA3WmMzR28xV21xeVNUMEJLRXVhUTQ0?=
 =?utf-8?B?SkIwL0pEaGsrTVBmZ0NMVUE3STRkS3lEQ1llYTdZbE9aa1VydGMrMW03eFh4?=
 =?utf-8?B?UkE2UDhGbUdTcEtGVmoyU0VxRTBBQTVlbGhQT1A0UTMwZXhPeHA3LzZwdUNB?=
 =?utf-8?B?S3lRcjZsUWVlY1N3bk5ESDh3eHRPancwQVhoWVptRC80ZzIvUG5qQkIrWjgy?=
 =?utf-8?B?RldqZ0lCS0J3aW5xMnlQbXZCRkpMbm5oZFNacm5PeVVBZE82QUJBV3hrMEtk?=
 =?utf-8?B?aXdrNDVtZ3BrcEd0c2s3eThaVngzL0hmaGV0WVp2Y1ZxM1AwTmpWK0VZb1FN?=
 =?utf-8?B?OVdQRjloME1UNXhTV0thVFB5Qk9XMEk4Nk9ZVFBVVEdLV1hSU01ib0srRFhM?=
 =?utf-8?B?SW1obFEwbEdYaFNiY3BNSG1DU1o1Y3ZldVpkditoY0xXYXkybHlCOUFFelN1?=
 =?utf-8?B?bEZZay9MYnRGZXh6U0gzSkdOWThlQ2xBVDlxOWVWT3JMVEZrMy9KY1FabmpY?=
 =?utf-8?B?NTM5TGhYRzQybThSZUhxdkJ0dlF6NmU0elI4b2E1M1BSdDJlM2l2cUVIVzlq?=
 =?utf-8?B?enppbzBmcDIxZUUyWGV6OHZHQk1RNkRkQWlMQS84Vng1WmVJa0hzNzFEUG5m?=
 =?utf-8?B?K0pneDIvM3pkQTg4SDJkK1h1d1ZZKzQ0VEtxekRza0QwOWtOaFFxWXBFUHZ5?=
 =?utf-8?B?bXBuNnZjZUFoMmxYa0NWNEtGRlI3UU50QzdsME5IZHZTdWo4R1lCbjRoUWs5?=
 =?utf-8?B?NXIwcWRTWVlvbUl3MDJNaXB2Vm1qYU01OGtiZXFlaFBlcHB4ODRVZHVkakJU?=
 =?utf-8?B?bjRBbkhMYVBzVmhLa3dkQmM3MGV0UkRBSjJ5T0haME9jZEEwNWhGanIxeWVs?=
 =?utf-8?B?WE9UWTlDMlBxVElvazdLd2RZWDkvWW5uUm00NWdyYXh0OS90bHExRnM1UDdW?=
 =?utf-8?B?QUlja3F5MHF6bXRiZkpUQkNPU3N2T2dXME96cEtQcG0rWjVuMFFOWXEwR201?=
 =?utf-8?B?aTBwUnRkQ2tWdWJkVXY1cTFaZWRraHh6U3pEOWE0RTBiSHBCNExKOHJXRGIy?=
 =?utf-8?B?ZjJJbEtpVGFFZUJDQk5kRWNwVE9pQk9Jb0U5QmZTVEV3bEhQL3hMRjVvYk9X?=
 =?utf-8?B?S2E5WDJmS0lVa1N4RVd6RnVndVhLbjBIMjVoZi82dGJSd0h1RmIzNzdKMXJm?=
 =?utf-8?B?aXB1NFhiQXdRNFBLSVVlcjRJTGs4K0tFc09qRlp5WS9rK3hCWmJIN09WbXdv?=
 =?utf-8?B?cnUvSUY3MWRmTVZ1ZU9ycVFhU2FRbXNqMVFCWVpqc3hoTkVsdklLd0YzUktY?=
 =?utf-8?B?QlZiUVNVODlIOWRkZWhzc29WSVNPbHE1M1BjUlpIc3BpMFdTdTB4SnFYUDZK?=
 =?utf-8?B?YmNZeDlSTEVKeEloUDU2cHArckVlK0JsQXdQeHNKTnZTZGFnS2E0Q2gvUTBG?=
 =?utf-8?B?aFdGcnRvc0MwNGM3QjV2VFhyckMvVVh4eklFRnhha0N3cFBtaUwxWUN1U0FY?=
 =?utf-8?B?V2c9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b94441ba-1aac-4454-b5c3-08da982b57d0
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 21:35:15.2220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jBUChakm2p+SWFUcy2lIhN3CPHVB5Tlph+vD5Am2Zz2GVX9Qq93ikvhSj1W9cSJM7IJ999Eg1qmc9ozUEZYy66kpETZyYyt7gPz6uEIOtnw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6150
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_14,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 mlxscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209160154
X-Proofpoint-ORIG-GUID: zSdLdsL5-uMBcyF5ArHcMeZl-3km1ZkB
X-Proofpoint-GUID: zSdLdsL5-uMBcyF5ArHcMeZl-3km1ZkB


On 9/16/22 8:52 AM, Jan Beulich wrote:
> On 15.09.2022 16:01, Tamas K Lengyel wrote:
>> While experimenting with the vPMU subsystem an ASSERT failure was
>> observed in vmx_find_msr because the vcpu_runnable state was true.
>>
>> The root cause of the bug appears to be the fact that the vPMU subsystem
>> doesn't save its state on context_switch. The vpmu_load function will attempt
>> to gather the PMU state if its still loaded two different ways:
>>      1. if the current pcpu is not where the vcpu ran before doing a remote save
>>      2. if the current pcpu had another vcpu active before doing a local save
>>
>> However, in case the prev vcpu is being rescheduled on another pcpu its state
>> has already changed and vcpu_runnable is returning true, thus #2 will trip the
>> ASSERT. The only way to avoid this race condition is to make sure the
>> prev vcpu is paused while being checked and its context saved. Once the prev
>> vcpu is resumed and does #1 it will find its state already saved.
> While I consider this explanation plausible, I'm worried:
>
>> --- a/xen/arch/x86/cpu/vpmu.c
>> +++ b/xen/arch/x86/cpu/vpmu.c
>> @@ -419,8 +419,10 @@ int vpmu_load(struct vcpu *v, bool_t from_guest)
>>           vpmu = vcpu_vpmu(prev);
>>   
>>           /* Someone ran here before us */
>> +        vcpu_pause(prev);
>>           vpmu_save_force(prev);
>>           vpmu_reset(vpmu, VPMU_CONTEXT_LOADED);
>> +        vcpu_unpause(prev);
>>   
>>           vpmu = vcpu_vpmu(v);
>>       }
> We're running with IRQs off here, yet vcpu_pause() waits for the vcpu
> to actually be de-scheduled. Even with IRQs on this is already a
> relatively heavy operation (also including its impact on the remote
> side). Additionally the function is called from context_switch(), and
> I'm unsure of the usability of vcpu_pause() on such a path. In
> particular: Is there a risk of two CPUs doing this mutually to one
> another? If so, is deadlocking excluded?
>
> Hence at the very least I think the description wants extending, to
> discuss the safety of the change.
>
> Boris - any chance you could comment here? Iirc that's code you did
> introduce.


Is the assertion in vmx_find_msr() really needs to be for runnable vcpu or can it be a check on whether vcpu is actually running (e.g. RUNSTATE_running)? I think call chain vpmu_load()->..->*_vpmu_save()->...->vmx_find_msr() is the only one where we are doing it for non-current vcpu. If we can guarantee that run state is set after vpmu_load() call (maybe it is already, I haven't checked) then testing the state may avoid the assertion.


-boris


