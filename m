Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D36943CA71
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 15:18:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216930.376723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfip6-0003Ji-Jn; Wed, 27 Oct 2021 13:18:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216930.376723; Wed, 27 Oct 2021 13:18:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfip6-0003HN-Gd; Wed, 27 Oct 2021 13:18:32 +0000
Received: by outflank-mailman (input) for mailman id 216930;
 Wed, 27 Oct 2021 13:18:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7jCJ=PP=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1mfip5-0003HD-4F
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 13:18:31 +0000
Received: from mx0a-00069f02.pphosted.com (unknown [205.220.165.32])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6017e992-3728-11ec-845e-12813bfff9fa;
 Wed, 27 Oct 2021 13:18:29 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19RCTXeA023707; 
 Wed, 27 Oct 2021 13:18:22 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bx4fj3h46-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 13:18:21 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19RDC0Qd051761;
 Wed, 27 Oct 2021 13:18:20 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
 by userp3030.oracle.com with ESMTP id 3bx4h2c032-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 13:18:20 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BLAPR10MB5251.namprd10.prod.outlook.com (2603:10b6:208:332::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Wed, 27 Oct
 2021 13:18:18 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329%6]) with mapi id 15.20.4649.014; Wed, 27 Oct 2021
 13:18:18 +0000
Received: from [10.74.107.92] (138.3.200.28) by
 SA9PR13CA0094.namprd13.prod.outlook.com (2603:10b6:806:24::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.4 via Frontend Transport; Wed, 27 Oct 2021 13:18:16 +0000
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
X-Inumbo-ID: 6017e992-3728-11ec-845e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=W87fTEnY3iPNmG6BeDf1aco/7GScB8QEqVfl/m52wVs=;
 b=QZN4iz25AXSmS1xq+uKoSYZvbYAwl0kDa0K+m8sZf1/vw3YRQy1qDWVPBHco7EHoQfgK
 tYiocARJKGd0XzUABlye7WOh4wv6YFwj8xFAFQFbrzCZfa6buH/7/VdJMzum4jzjvy0Y
 kbsS/tXV54yakHGs4bpl1zzgdIa8mjWxjN+VYA/p/gi/Eyz1kKBlutrj6Qd7hgRZmdyD
 r5ttSi7KZLv3yOm/dzSjRxkSVDvXr2a0GnOxXnSCcGL9++5iVOAsA11zyJ0rqFYm0Zem
 BECv8THJa9uR+semMBSdY279GAG188Pgl1eT+ItipXKAYgJy9N+NvgS0dpiH5kpA8J/8 RQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YBcmK97aZALqRgwJxY/qFXsHrmDew1oW+Wc/GklnnLKa7td06i4oF9nQ8Jg6T9te1vu6c/E3HUiuJdxpTHEiFJk3r9FUC1FX0e741wDdCtiAlv/DI21z97Ruh2+t3WAa40htNAAKHgIKdD3nUiMFWdTfvolA3fFvspsSUecxnbGZ+rOHSwlOKjpKwWXG+dCPAQ5vYfZOOFBar5EGIKkXjvIDeD6Af2ekDdtJmz7CO0K5g3t0i7df3iPhwI8yHj9fh8gqOlBiDqph7L+xC4BXzYgAvU2XcO/ykd9HRonO04UnbdnfcQpS3FdHp3XSgh0dFig9q8ooNfPHkW/kTQ7tFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W87fTEnY3iPNmG6BeDf1aco/7GScB8QEqVfl/m52wVs=;
 b=aYMGoiZ0vi78gbBAKYY0TX9jfGkfHx3cTiEdVK0IORkbxD+Ygh2k07h5E3Jy5IjZZpKwO4vgx4ftFe0ya75MldNsLRW+xAy+oOcdFqJxZoeuPgas8vSdVJfR0qxTDLWqeG+6w+hTYcz8RKndpviF7/kWnLFTVeMDX8jdQufvwmJK2PqS/1AamrCiaRe8VhIj3ZGrakqrAGNYLMlsgwaARps7lVBjUkbC+OM9Et67YTcI47ccZj9xQwF4/LfprUWD2h8j/axHagVl5VxX3aHOliRlWnrObL6FmupLyWgO5z+DJLP4Vb1dKLBe14+GbctEpGKrsOHGmZl8+dxoTL3TcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W87fTEnY3iPNmG6BeDf1aco/7GScB8QEqVfl/m52wVs=;
 b=LK3JknIfU7vUSeOLMUpNHM/rqhcCwRIximOCs5zYdp20ZaTUUfopZF37ABYjcb6ldazZPDa8xGiwT+oXLSlFkNMPZ7fxzYvCJOliU6Qn3AA1wGTX4kjBmEQ8C5+f3zNenyvtDsmGr54n8MI1I/fEyndTaGUYWXdWZMj5IUxShIs=
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=oracle.com;
Message-ID: <f9db2b8f-c4b7-95b3-856c-ebf5231d6bf8@oracle.com>
Date: Wed, 27 Oct 2021 09:18:13 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH -next] xen-pciback: Fix return in pm_ctrl_init()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, YueHaibing <yuehaibing@huawei.com>,
        sstabellini@kernel.org
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20211008074417.8260-1-yuehaibing@huawei.com>
 <6644d095-92da-261e-87aa-284dcfcde19a@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <6644d095-92da-261e-87aa-284dcfcde19a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR13CA0094.namprd13.prod.outlook.com
 (2603:10b6:806:24::9) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26eecf02-b001-491a-1dfb-08d9994c3dcd
X-MS-TrafficTypeDiagnostic: BLAPR10MB5251:
X-Microsoft-Antispam-PRVS: 
	<BLAPR10MB525158F6DE5B734DAFA96AED8A859@BLAPR10MB5251.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:935;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mS8DLiWZuWCC4dYSiSn7DlJpMFkyVNR/G8Gbd64ZsIShCQTccBG/wIKvSNv2DdIHXfTNSfEs3QmYShtzWuQhNZDMWMCBF2hsUpcDsDUtJyHC2CXhKcIMQ3kavSvIPDMjI8nhBkTI2bAJ5MaF5l97UwQu1/HzInn383rlvWDx6GcR0wUiPnVFjThipAJrecLEKPpxFhsIMGgQQR0MONNSHKyskitcWpuulXlOMlzC8BJA4qZcpkcaMj6lmQSDzOLp+SR9wk2HOQMe/n3b12sCsxzhKg2wQc3DN6h0N7jZY2AKLGpZrPOqQGSeI6qgO5kElcEcPHMbRXxdPRspjA0FeaBt5Bl8gYna1dApS1/RNDctugVN6b3OF3XWb3QnG4V2V5t75ihLls5rpV0Vh8wM0YX8cahhsxYnGPG4CJzi8gKEHO5IUz0MiRGlZwlQJYj8oTejmsPBrPgTEBxLv00LEsIbQa7zcYV3WZcc3srvcEuKFu+jMbrRwMMPifdlz2+TZSVvPNPywtQ/XGWukf5On36V1IMml9m45QcAOuYLD7xqNEWQUKiAhD/DrmHgw4kBp6BaaatILVdItOFjCT8pAmcFkkZkzIpLIrIv8wLUBsUNV9fIW5U6Ke8jAmTOy8UM8YreQj4yFLkDsjoZIx8YlQX9ip9axivSoZ9rqz8ATrc5QzLy9kpBQyyzsgqTqvTcaFOBX3yMG0L95a70CJOxsVNyWG3Lm9ZKre1k8WqzR8psZf0/cwUIDeEENm/vg2nz
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6666004)(110136005)(508600001)(36756003)(956004)(53546011)(8936002)(31686004)(2616005)(2906002)(4326008)(86362001)(6486002)(8676002)(26005)(186003)(66946007)(66476007)(66556008)(44832011)(38100700002)(5660300002)(83380400001)(16576012)(31696002)(4744005)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cnQ1NGdIQ09uOGlMMzVDeGF2a2tMd3F6ZWlERmtNdEVGZTJ6Z2lvY2lxaERP?=
 =?utf-8?B?MktVaXJDRks5WWYzRGtjNUF1Z3d6djY5eHMzcnZ6cVZ4VVp6b21qbmpwYW94?=
 =?utf-8?B?eUFMRE0wbkVQYnY5dThreWlybEZtVktQQm0ra3FnWFVGdCtXd3RYejBETGJ2?=
 =?utf-8?B?N0FGODJGQ2QyMmlDb3FuSXoyR3EydW0zeC84MFAwbnVYYjlReHAyYTBXVnBy?=
 =?utf-8?B?U2lqNTdjTVlXRm80bmMydDBOeWZUZkVjQ3ZZV2ZnNFNpMW5uRFNZY1R1TzNH?=
 =?utf-8?B?aGVGWDBPa3piNW1ZNUxxRzNjZXhsYktCZDByVTd2ZGh0ZUR0TUE1VkZtZUgz?=
 =?utf-8?B?cWVBdTVLbHkrVURob2k2MEtvamNkcUEvcXhsZVgxRHF5SGdOSGI5NVZGeXdP?=
 =?utf-8?B?YWZoTE9HUjVqdGdhcTc5TExiUFRHcG5nVXFYTVErWXp2UG1oK04zeGYyTVE0?=
 =?utf-8?B?T1pMcU9vcEhJYzdSYksyTE1FYlE4elFXQzRrWUkwUDA3a0hFUHhXTDdMV3Vv?=
 =?utf-8?B?WUdoRThkdFZRcXczemYxMkpZYlpOSXJyTmtwMDRqbE5WczF5eFBZUFAyd1VW?=
 =?utf-8?B?MHdjdnZuakhjc2FNcGtPNGpyQkVtNGs5dG0vZVZoV0JJWHhUUk5IejFKN25K?=
 =?utf-8?B?ZEFxVi9YSzgxYi9iMnZxUmhMWDNFbEJBRFlnMzkxNzNId29WcmZIQlMzS0V0?=
 =?utf-8?B?Rk1lYjlxYTlpOUt3MDgzY0IvR3o3Q1FDcUNhN0hTaFpaZTFEZmlzUndxNkI4?=
 =?utf-8?B?L051RUk0dWVyTEgyWUt6WXNlMk0rNm5lWk50UHpseFJuLzBQUlpHK1JhOXo1?=
 =?utf-8?B?RGpYdDgra1g1akFvU0s2WUUvYVpEY3M5NG9RdXdWRDZFR2FwREZLaG1DVmtn?=
 =?utf-8?B?S0tNMUNGYkRBeVlsZlQvTXpQYjhJRGE1M1FVMUozN2p5Ly80QmppRy8xb1BO?=
 =?utf-8?B?UmJxY2R5cTFHUlFGbm5NRERPd1lqTlhzS2JHKzRZOHZRKzBacWFCRWFJSUpW?=
 =?utf-8?B?QVdBVDZkbGI4cjBpSmFxbEZhaUlLeHc3Rm5uamoxL3RLSWkydXVQUFRSSncv?=
 =?utf-8?B?d2E0ZjNUVTlZZkJWMFpEeDROcXk5RVZHV1N6SWtUSUIyQjlNamRFR21lZUcx?=
 =?utf-8?B?WlMwSTZoSFJhN2tPOSsxWFpycWpOOWJGZU5MV0ppVnM3a2JtZnZ3UmhqQlZZ?=
 =?utf-8?B?NGZvcCs5aGROc2VwMENhZUxFZFUzTEhyNFlqd3dlMGRMdllISkMxTWcyOXdi?=
 =?utf-8?B?K2M4T0s2VDNQa21KV2RRM2owUGlFTyt2ZUVXRGdJSEM1cWVsTUljZ0hZTzdX?=
 =?utf-8?B?WHV6Zy9mL3NGdExZR2xKeW02RndZa1RaMTJpeStpU1NaVTNpWHlIRWsxQXhL?=
 =?utf-8?B?R24wUGgybys1MTNLVHRNckZGNW5MN3puWFMyMFhZWk81c0JMaEMrM3VaNUZ0?=
 =?utf-8?B?NFBGdmY5SWIweWNlRDZIOVZhYW5tZ3lGb1lFQ2kycVpEQms2MFBiK0Y0U2Jt?=
 =?utf-8?B?REdEUHlhSzVnenU3Z2xHeXQ3V0h1d1NzWk5IZW05RXlOMFdpWkdNdDJCUlRk?=
 =?utf-8?B?S05uenlWb3d6aURySzlBYjJ1UnZIb2t2L3dBY1gyK3RiMi9ucXFFYUVZSVM3?=
 =?utf-8?B?MzNNRjF2Sk04NU1MVjcvMDdNWlhtanFEV2phZXFLRHFibWdLc2dCaUFFVEh2?=
 =?utf-8?B?WHYrS24xaUYrYlE3VGo0VXRkSG04eEZXZ0tTUmVrZXErSDJPR29XSzJrYitH?=
 =?utf-8?B?ODV4U3RDeTZVUEhsQzh6Zy9KTmNhWlFrVFFYekYxaFpGdDlzR3FjaHQzQmdC?=
 =?utf-8?B?d0RWend0VGRTblBoMVMyQThwQ2sxekppdTkxN29qcUI5YU1TMnQxOWhSaFZa?=
 =?utf-8?B?ZkZlcTBsdlhMVkt6UUdiR040K2tuUHJRdTY0SmlCNEpWOU9xNjJ5MkFRQVVq?=
 =?utf-8?B?Rm43TUJpYm9EYkV1bjlIcHo1dk9JTjBKMGwvK2Q2b0QwNEY2azJ1cFBJdWxj?=
 =?utf-8?B?ajlxcVdUVU41WkY3WjJ3ZExuakhYcTlOc2JKbmdnQWZHU0RjMHYwQjEzVXpt?=
 =?utf-8?B?eFFZVko1dllSVmN3Mm45QzUvbHM4WFdMWWFQZnQ5YUZVNjVnTGU4bmtoaEdJ?=
 =?utf-8?B?UkMrTERucW5EcmdRY3NhYndGTmk5OUlMNHpvUzdselI5MjZIaTE3eEYwbjJl?=
 =?utf-8?B?d2ZFNHd0QnlhanplWEdYZ3ovNlluWHRmeEM1elB5enR4cG85NVY2NEJmNmFW?=
 =?utf-8?Q?NUTx52dO7ykUJFbG8AkDzHTYH+MyW7Twd3q7unW0iM=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26eecf02-b001-491a-1dfb-08d9994c3dcd
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 13:18:18.5243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mkPP8sTdc5T5cZP6MRdBnqn/oda+wV8GfmBW0aI6aLjSLPK1akCauD8MYp++DkdOsG6wCRi6gdAFlLZzCwKXDeR58beZtcL+ZsE1Uo/s2F8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5251
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10149 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 adultscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2110270081
X-Proofpoint-ORIG-GUID: PHVel80CkDtcDBJSeEFu0PT_UpwjL2ir
X-Proofpoint-GUID: PHVel80CkDtcDBJSeEFu0PT_UpwjL2ir


On 10/8/21 11:01 AM, Juergen Gross wrote:
> On 08.10.21 09:44, YueHaibing wrote:
>> Return NULL instead of passing to ERR_PTR while err is zero,
>> this fix smatch warnings:
>> drivers/xen/xen-pciback/conf_space_capability.c:163
>>   pm_ctrl_init() warn: passing zero to 'ERR_PTR'
>>
>> Fixes: a92336a1176b ("xen/pciback: Drop two backends, squash and cleanup some code.")
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>
> Reviewed-by: Juergen Gross <jgross@suse.com>
>


Applied to for-linux-5.16.


-boris


