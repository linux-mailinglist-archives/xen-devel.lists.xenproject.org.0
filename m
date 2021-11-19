Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5572E4578C7
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 23:26:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228271.394953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1moCKf-000768-Nf; Fri, 19 Nov 2021 22:26:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228271.394953; Fri, 19 Nov 2021 22:26:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1moCKf-00073b-Ka; Fri, 19 Nov 2021 22:26:09 +0000
Received: by outflank-mailman (input) for mailman id 228271;
 Fri, 19 Nov 2021 22:26:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/ti+=QG=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1moCKe-00073V-8O
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 22:26:08 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac4b906c-4987-11ec-a9d2-d9f7a1cc8784;
 Fri, 19 Nov 2021 23:26:01 +0100 (CET)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AJLJ25N007606; 
 Fri, 19 Nov 2021 22:25:42 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cefpjhxcv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Nov 2021 22:25:42 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AJMGrTj114244;
 Fri, 19 Nov 2021 22:25:41 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
 by aserp3020.oracle.com with ESMTP id 3ca56awx0y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Nov 2021 22:25:41 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by MN2PR10MB3759.namprd10.prod.outlook.com (2603:10b6:208:185::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Fri, 19 Nov
 2021 22:25:39 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::8d84:1f40:881:7b12]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::8d84:1f40:881:7b12%4]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 22:25:39 +0000
Received: from [10.74.108.53] (138.3.200.53) by
 SA9PR13CA0081.namprd13.prod.outlook.com (2603:10b6:806:23::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.7 via Frontend Transport; Fri, 19 Nov 2021 22:25:37 +0000
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
X-Inumbo-ID: ac4b906c-4987-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=XM2O/IPjWkQRwFoxAoLfyxSNWGPepbAgIb7R59dR8Yk=;
 b=cD4ypq/bvjPjrJ6ZC7CcEnn+UZAifmDYx22hbOcV1j4BBi+Z7/GL1hRJrKDOUYF3DNaV
 zWoDBDNYa1VjWzoEDq3SOKUYW81+rhrJTDyFTCUIs6oXiL52uHnkP5bbABW6So232aF0
 4Tf1hIqnfwj1mZ+YrunsUGKKr2SlRWrgjY+nTjYK6PrEUE83MhG9AyElflPRbxyhnzBB
 DbWY7FpNSXfuckY0RjCPyHm/osRf5w0g9XCPggU8K1xGFe1bPz4ymB3Letk1mEi94NVH
 V32zs94nrQyWfMLqdqdJ4LtfVadKD400fK+LfbzNrsr6kgSZd7W2NbqhqKzSmvqn2jo0 dA== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d60Zl+45ezrkfUNJOj4CoWP8zE6DphMsNBsJz3dj63eld2SAGtxqgpQTBBXRT3DP67/onyXIGAdyUxPYpiUaqLMp/rT6NPls31/PjtLAwDnSmeZEGqvjquuDkb5vTvL27GhvIv3wxe92Qg27+qeoXSdVKKBO5LWTCN/koEvybqmKrRuSHdbxxWzSNPWWEUWDNtjpV13n3ZFjV4NAWcbnJ6iFEndd7e/AZZoi80o1EG0PUQo/39zm2JLb6wixrYlodPRBdPGTJXT6NZ1uS8FG8epkVdiCca4rxeou4wlZPUPc2xjbJ++ikLRNQkvUMKZPYWmxgX0PhPBYOkmg4hn0pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XM2O/IPjWkQRwFoxAoLfyxSNWGPepbAgIb7R59dR8Yk=;
 b=JzkeoE+5JrIhIzWjuCo9RRKRd6S8SeSIOUoT0MikYN3D4a+B/Qj9udSUSKCWFfkt3WHpptJFRomujEbfZjy/OyASOy3junny6al1iVUw3eRAWGCn3HhYumdCy6J7tTQ5797ml5Dv7G4JGrMh/7VtSVjSUqIGLTQuvlKWSdlPBPyCqoAHxY+WWXmlf3UumSfM1IEQ8+WvdyLFKNssblMr+HCTqqTk83+lD0r4rSLn2zFpL4Nbd9vYkTmiWzBuAnuFiHjIHhNUF60gRvd6+pjIL5/v2NtLejYvY4aHQgTIn27NV+ViHWWIADgFj69KZ6U3m/Yot7TGPOiUd53ZVYlC8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XM2O/IPjWkQRwFoxAoLfyxSNWGPepbAgIb7R59dR8Yk=;
 b=t8Pz0uU62hcZewMHtvk3TMMTc7ziyMaZW1YvhwLqH08kRr2LPQkg1LH+Nj1Q/Mtt0ZmRZtkaTv1QBrX7KYrD7LUL9khDoijjJclM7Ijp8C1kTT1Wx92bkss7eHH+wPUIEH2V6saF4dnRPiGTu4SAZwOPLY/07s0XgQYiSGIL11Q=
Message-ID: <43d1cf7a-73ff-22ac-95f2-b92017357a29@oracle.com>
Date: Fri, 19 Nov 2021 17:25:33 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PATCH] xen/pvh: add missing prototype to header
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, kernel test robot <lkp@intel.com>
References: <20211119153913.21678-1-jgross@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <20211119153913.21678-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0081.namprd13.prod.outlook.com
 (2603:10b6:806:23::26) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9fe6eadf-bbe4-4e4d-7566-08d9abab841e
X-MS-TrafficTypeDiagnostic: MN2PR10MB3759:
X-Microsoft-Antispam-PRVS: 
	<MN2PR10MB3759D11E79A661713C6076A68A9C9@MN2PR10MB3759.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:972;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fWHCBDchvhRUA3wXmzQZslo73UGYqt24X0V8gel7PgA6MwjboyQXSEVR9g0ZFs2qSeUDz15vw7Cg+IqMDG9tzg6evKWG74gXY+RLPMhfrFrAYHV7XTEZV7+5PLccLAqV4lHKLKJfGGt1xoueGj6352fbprqIhFHAr0oQ84r0h3XgwKscE1rH6G/XdllmtDdefL8UPuHeKNKfQSvmO4lOkBWfC8KwqQ5Xpl/xDg715mNieZofkaSojkZK9VwgUg9lkybz9bEBMnGZ9A8oSDNT3jIcrN8FJNrEFZaNHp0iKai6ZT7M5pCPukJHhnFt4Mtz0xMwG5YVaoRJOH5u7gdWaj+nRUnu7iWH8zQM9fa60OCp9MuoOq2UPyYveIEhQ7SEMaAV0kHXJ4LKFgwOavSjQpK4NFy2vviT6hRQztXsDHyQVhiwiW7Hy9veAzOL2yZe3G/7f/P3ej9I6bD2S9H5JpVMsB09fN6SxHqUZV649JcwYkGAJkjTOymMrcCgR1pUJWqEJlZpTTicTxC+zOn9plbuRsG2nnba66z7+IZdrrPGsUgoIhQtWLWkBzqN2d3/410WYp02jEAJhIIhXzDLp7m0Ji+V/mBWwnLWHe0DfDK1dYU73HzlYXarWR2XLAwPvujX5eG4YIqLIZl1Yq2zuZTgs79BbHCvbHy/qmntGqaOKtNUCEyK7A7bz4aOmW3oNphFU959g2VQUYtuuN5LLcU9Tk8nzW5qwHER8IpXtDhG0F//rfYhuKrKnjz5zQ1i
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(66946007)(956004)(8676002)(4744005)(7416002)(2616005)(31696002)(4326008)(508600001)(186003)(66476007)(31686004)(6486002)(66556008)(86362001)(38100700002)(53546011)(44832011)(8936002)(2906002)(16576012)(54906003)(316002)(36756003)(6666004)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OHZWMUNGQWs3M0RkZ1ZFcnFtdnBHd1llVmtqNFNmQ3gxQ1hKN3dlZmZ0b2VQ?=
 =?utf-8?B?SWpMeE9IZjkrWTVJYnBhL0Y5MHlHYTUrNVk5Y1g4QjFROVNhQysxWndEbGV4?=
 =?utf-8?B?M2pkUlpSTWRBdWJjOXc5akRIRVoyZDRWdjU5bVN2aWFOZUpaQWNGaEFFODlV?=
 =?utf-8?B?RDdDMlRmNkJ5TFFWaEdJL2tRVnZ1N1lQSmUrMmVmazFVeXdQRGE1eGQrTzlx?=
 =?utf-8?B?L3ZrWi93Y29CWW1EK0tDdUdwd0ZQWTJBczdDRU94OFo5aklrMjVXVE5FZVZV?=
 =?utf-8?B?MFJkM1BEQkJoejJqM2c1M1RYWGxDMm1hbnFvRTFNWjlRT1hMb2wzTDlvOUVm?=
 =?utf-8?B?OUZRMnV1Z25pRmtOWXlSVjN1WHV6SjZMRW9rU3JoWHB2eE1ESVlrSmlnTHZU?=
 =?utf-8?B?NkR5c2lac0xkdkUxcm1wZzdwZ3pKWktIT2tHT0JnMVZDOGw5aURSczZ2eFNL?=
 =?utf-8?B?WkNwRlVPYk1FRjh5SGowV201RTRmOUNqNnFhRWticURxTkZsZldoWjR6VUdh?=
 =?utf-8?B?c1hIdnIxUytYK0gwZTFBUE00VTNqYy9uWmVkWVMxTHE0MTdoV3hITjM5NWNx?=
 =?utf-8?B?bmxNVjBLUENXZkhMUWtWMkdXSzBTeDlVT1lOd3F4WGNITWFQWm41bmVEaENW?=
 =?utf-8?B?VjJKdTk3V081Z3lQSEt0ZnorYjgxbUQrQ3k0bExzQ0czMnV3a052K1VKSjZy?=
 =?utf-8?B?Tk1jdkQ5YTAyeWRzQngzN0RtQThkczJQTUJVMFFxbnRXQzRFTUozRmNEaE1N?=
 =?utf-8?B?LzY0VXZHZGg5SVRCWStxT05SSXYrVGxXSUkwOEt3c09acW9yUWk2eFVNNGNw?=
 =?utf-8?B?aTlySzh3bWhMWWhLL243N2hGRFNTVVJvTEVkL3dBQUtBODFZNElZWGdrb1B1?=
 =?utf-8?B?d1pwQlBNaTI1Sk9mb3k4UElIc29XbSsvQVlCTWV3RktMbUVYT1ovajZ1ZHRC?=
 =?utf-8?B?Q2lIelkvK3hMZFl5ODYvU0FCQy91TG9HUDBZaGh2SHlEYkZodUV5OTIwUnhm?=
 =?utf-8?B?aUEySjRidVY1dG5aVVM5ODM1ZTdJRm82R2pxeHloZ1lwMVdCQVJCM21selB5?=
 =?utf-8?B?N0xhYnd6VW1OclovR0IwOG5mNU1GcXczeHFyMmk2aGxOQmFXb2dselpZVyt2?=
 =?utf-8?B?TmxMVlY0SjNqVEZ6eGc3V2JMVW1YS1RSU1p1dlRyYzAvaWNnUTY1b3NwbnlY?=
 =?utf-8?B?UTE2TUowWkFoU2p0dDJ3SGswM0NycFo0UjZCRmlFVHB2bFZaWGVaWUtLYXN2?=
 =?utf-8?B?MlVVdjBYODhVRkFjK3VqTnBFR1RnWjRTR05PYTg5VVNyWXdZTTlwalNyWmVa?=
 =?utf-8?B?S3duWVlzdVNmUmhiQ3NucnVPUGZKbFg3elcrWGFMY0lGUGwwWlpVa1NqdlFi?=
 =?utf-8?B?S2Vzd2pRa1BNMEw1c0RuV05SNlFLTTNiUFYyU1lDZ2RXdHRhelpLcm5HYWI2?=
 =?utf-8?B?dExEdGpyRWczSDdzNVdZYktzZS85VjFXb3RtcHdqQTR1c3IzbkxXQnhCcDJB?=
 =?utf-8?B?RTdJc1JsZFlTdnlFaXpPWXh3UkVIdWtEY2dtWXNuNUlGZENheUJmeUI0UGJW?=
 =?utf-8?B?ZFdEblRJZXdsc3RDdDVUYWp6dE1WeVQ0RHRsMmtwQ3FkTmhZVEU0TFRSVHI4?=
 =?utf-8?B?bDZWSkEwUWQxSTNhNlhEL2ZNKzByLytKK0theC9CdUZEMG1EWGhZTHVFZHFI?=
 =?utf-8?B?eWNWbWJwcUJCUXpaRzlHaVdPRlJyeUJVeFArbW8xVVkrc1F6OVREQnYvamhC?=
 =?utf-8?B?bGZhUzRKclZ5TFlsbVBrS1hEVkVDeDhZd0FadDBVamVwUU5CYmhENEVFQi80?=
 =?utf-8?B?NW16QzRaODFudXBaRTlLVjZZQXlFeW5MLzliVmdHc1kvN1p5L3I4SzFBNXJ0?=
 =?utf-8?B?ckd2M3QzTzZXU3V6RisyMEZtdWpYcmFpZXNJcnhrd2N5T1M3RHVWT0lCSUhD?=
 =?utf-8?B?OFNha205ZFpYYlhoa3V1cktHc0sxQ2ZKekdSUHgzYVVsSjh3dXRISXpvY21C?=
 =?utf-8?B?aE9ETjNsOGwxVFp5bHFDdXd1czlTM0JpaDQ2QUFsaHVhMzZ2TkFoUzRZL2pX?=
 =?utf-8?B?a0o3QUNySGtDUVZhMzEwYzVjZUN4RXc5NHlKY2RuVGtuOUxBZUo5bTlrQzE0?=
 =?utf-8?B?a2QwZzlhRTFLWXRmSjN2ZFN4clZ6MmRYVW5LZW1PLzBCZm1DYkJsV1VPNEFL?=
 =?utf-8?B?ek05TWpiWEQ3eFhvRGdLVnZ3ZEQ2ZjhxM1V1ZFJQbk9nMVdQZzJsaVdhRlU1?=
 =?utf-8?B?b2cvWHRhZ25iZWtYNFFQQVcrRTl3PT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fe6eadf-bbe4-4e4d-7566-08d9abab841e
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 22:25:39.5803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gi8GBopsTtAnHkJ2vi/NQPe1xzm6gsLB9JDhCzciNvPmYggCX+/YKUqU5MZwEHVe/xk1aaZm04HuxB6LTEcfX10IIg9tpK3uy8NkTU1L+1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3759
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10173 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111190119
X-Proofpoint-ORIG-GUID: 88ov-w8zqo4X55JjxLUlOWwduQyjQbg7
X-Proofpoint-GUID: 88ov-w8zqo4X55JjxLUlOWwduQyjQbg7


On 11/19/21 10:39 AM, Juergen Gross wrote:
> The prototype of mem_map_via_hcall() is missing in its header, so add
> it.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: a43fb7da53007e67ad ("xen/pvh: Move Xen code for getting mem map via hcall out of common file")
> Signed-off-by: Juergen Gross <jgross@suse.com>


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>




