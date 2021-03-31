Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 844343501CD
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 16:01:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103971.198341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRbPU-0000Kb-WD; Wed, 31 Mar 2021 14:01:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103971.198341; Wed, 31 Mar 2021 14:01:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRbPU-0000KC-Sn; Wed, 31 Mar 2021 14:01:28 +0000
Received: by outflank-mailman (input) for mailman id 103971;
 Wed, 31 Mar 2021 14:01:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4c8Y=I5=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lRbPS-0000K7-UD
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 14:01:27 +0000
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0ff3aa7c-401e-4101-be35-1417a5e2d4c0;
 Wed, 31 Mar 2021 14:01:26 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12VDxmmm008905;
 Wed, 31 Mar 2021 14:01:24 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 37mabqtbe6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Mar 2021 14:01:23 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12VE0g1K085672;
 Wed, 31 Mar 2021 14:01:22 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
 by userp3020.oracle.com with ESMTP id 37mac5h7ep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Mar 2021 14:01:22 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by BY5PR10MB4195.namprd10.prod.outlook.com (2603:10b6:a03:201::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Wed, 31 Mar
 2021 14:01:20 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721%7]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 14:01:20 +0000
Received: from [10.74.103.42] (138.3.201.42) by
 BN9PR03CA0715.namprd03.prod.outlook.com (2603:10b6:408:ef::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.27 via Frontend Transport; Wed, 31 Mar 2021 14:01:18 +0000
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
X-Inumbo-ID: 0ff3aa7c-401e-4101-be35-1417a5e2d4c0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=3CjV/fvMPSbaHRFMTYdWoBAjEA0EC1AQkTSb4Lqo0vQ=;
 b=YuiRTtFlzOFIaJhaWKvdkB8A4SYkojo16tIcGJAPp8UQhNoW8/whNDy3cri49ktmeEK9
 pkiJnJx7xVouvdST5erbzJZkkAPSOtuTP4/ECjw2/00eeN/rNZMkfbdmLpxZIqT9o3AY
 nms85Mfnp/iGo6l+FEzrFg21Ti7DejP+2Htr5tLfzlJCuKIs9LOOE+SZcw/qkNmq3LsM
 Sibh9DLMp753TMOX/D2+qxklSTZc8BWNzcKK5c1DriJUdTg7B20IJm0SlHFD6vED738L
 +OFvMPGXt7rwYxdofOprIkXT0dKFgM1rtzl6t0jDLS8GvVQgBzVShkNPbg1utRAdwfhr Eg== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S004wky02kJsqyqJtTikQmaZ7gB/ccIk3wQ9mzTJEGZZjVJSUn53ippMkGa8/Bm3BKD6H/lP8IwhaOxT2z2Sb9OWtlSny9F6bnbkli8CoS5xmOg90b6ETeX+euCW++XNfhge8QGtEgwc8uhMjHK+scK54y04pswa6GsArglYZvSq2fTqldyGmijmvsi1GKaZK3cQtOgd59NG/7t/a8xAI96a9Ueg9a5GYOdkho+VecfmvmW9s6UtLU+z01/EAUgwKlIanoos3vDpKGdIEx5T8TvTj/VJoZqJod8kH6ndjtgkQGoFNcZOqRf44/aKUy9WF7YzOIvcsiyLNKprI/Y9Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3CjV/fvMPSbaHRFMTYdWoBAjEA0EC1AQkTSb4Lqo0vQ=;
 b=OlaprLfd42pMacwL5VoCgfqFtL2wPTwQ4glzKB9Epma/DgTS4jiaS2Km1uxb1HCn+0ozgUz20eTmgmRCXV84GwlnmfTP6TJQOnf59l+8XO5zAxVBMS6SX0UWk88aW77ODW2iVwCPuLTDkOzvD41+3Nr28e6LjEMv3Dbnoc0S9f76r+C68/p+NFdkKYJgGJL0absaLuA52MU4XESbmAbUbPTrtFkJ+mKO+M7COChmYRMFg9/CBIWN0Tk7GubmwQUyiLYKISPkHDFftnzOHLkkYEe30KASHAgrIFQvwB4fI5nGxLfeWnMwLvrqUbolvOdhUbodlO9TX8ju3b482eB0eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3CjV/fvMPSbaHRFMTYdWoBAjEA0EC1AQkTSb4Lqo0vQ=;
 b=zaRtMQUXBRCZwgtkPFQDgXG5zSfQkk62qlCQWZGnYvRumHO1NkUk2d8N2uIpiDq1DZEqX8LlD43UU2TTJw5bctkYmTCHBM13bZ7MLS2ysY/N87UCPekdFwDddUjf9pj8aSaB7kqNmBuX8THMqG7fJqwOOFY26p1tqWvDUqClgzk=
Subject: Re: [PATCH RESEND] Performance regression due to XSA-336
To: Hongyan Xia <hx242@xen.org>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
        wl@xen.org, stephen.s.brennan@oracle.com
References: <1616619905-640-1-git-send-email-boris.ostrovsky@oracle.com>
 <fc88e9ebb902d7d4315202ec25d00506f433641c.camel@xen.org>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <fb35ac5f-3b28-fe55-645b-d0fcd73ac940@oracle.com>
Date: Wed, 31 Mar 2021 10:01:15 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
In-Reply-To: <fc88e9ebb902d7d4315202ec25d00506f433641c.camel@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [138.3.201.42]
X-ClientProxiedBy: BN9PR03CA0715.namprd03.prod.outlook.com
 (2603:10b6:408:ef::30) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78c61389-232b-4f45-4a2e-08d8f44d75fa
X-MS-TrafficTypeDiagnostic: BY5PR10MB4195:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BY5PR10MB41951E4FF2A4A9BCA94FD2288A7C9@BY5PR10MB4195.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	91BVVTV5HykDyeHBgw/4drZvzu7uA95y5A5Z29aaWnvs0dL2ESuNhunxZzrI6UX3iW7rPtNpNcpRQhK9vVLFlWN8qRzK6p2vqTb6XeJJk4zeg7bOSqYZbaiMCMh9kiXKDzOpm+xn2KUyTCqAIYVrSZI1AGQ8SOKbMmpa1JhTYh+4zdKUTehDtV6NQFFsU0MhKM+7MN2GZtSMLijBuTCLNX+quxTFT2gVZAz70O545hVqXsWdFkDUWFITEwZGYx8/+BXYZCNu791tEqFC1IFAYEwwWiHAjA58vAfEh8M5Cghl85YDAbor5wNSd3GIJcZ0dDNKy0MGf965YglY0EYYr6fbgVktb1gMyhp48+ptZrUfXcE0AAzr+AJyoYlBNQ99mKutHhmDd2XM60uKgqmq81NOJbDeOvbq0WQhEbSs6sDpH746/HzcZ4XqYOHVWWCs4XE23ShSyaR2cSol8lGONOSwqw83/C0aWZ0TTG+2rrLRyDqxB43Qqh+OATBSwr/p8g1j9bKPINWB0XESIT/gOWDV/r8n9tEOJwxNrvDh0Q9hBILV5/lK//HVWkRoBu8HoN7cNmQlxIOIjaiy+PFKNFB4eELKkbIdZinsE3L7LUu0wEESeWpZGelWsWDLsc0VNHvWNDsNARWiqiloQqduIZ/sbsihPDrorrN0iC/vEExrEHl0mWzaK0sIkhoMQEaCuixfrphNuBmJHNoxvP7deN1eNfjS1LlmkZCFjW6ki34=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(366004)(39860400002)(396003)(136003)(478600001)(316002)(36756003)(2906002)(8676002)(186003)(31686004)(38100700001)(107886003)(53546011)(2616005)(8936002)(44832011)(66946007)(16526019)(66476007)(31696002)(956004)(6486002)(26005)(86362001)(6666004)(5660300002)(4326008)(66556008)(16576012)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?d2JocWtrRzVxSGFMbkovZTBBeDFmOTBpTkVCUmZjbVpZRGVtcjAybHM1akZv?=
 =?utf-8?B?ME5OYi96V2NEM2RsMit2Tk1pOVJSRWIrMjJqWG5BdW9GUjc1Sk10dC9iZ2Q3?=
 =?utf-8?B?cmRhSGIxdlpYb1d0TzVhNzhFdnh4Ni95TTR6RUliNFE4SDJOL3lQRTJSMFU0?=
 =?utf-8?B?Y2U0ZEk4RzN3WmdLRTlORDI3TDBHMGh5RGJqVjVBNHNGNDFNZEtLbmVTREpq?=
 =?utf-8?B?RjVrdVJWQVBTb1hzeFQzRXFUY1hKZUpJSW5Bc3ZqMG90TjJ3eXJXcGUxcHJX?=
 =?utf-8?B?d3FxQjlWMVl3Z2JQSE5IQ0xyL05LdjZnczZvb2J0WDIxbmZFeXlkUmNlQU0w?=
 =?utf-8?B?K0t6aGIrOGxlakl2dkYrYnMvZEFrczJCeFZaV054Q3dJVjlmbG5kbm9NQ3cy?=
 =?utf-8?B?OVhSV0xqNnZKeElJNnVPQXY3MStsT1JGZHBaQzl1cHZmU2M2QnJWbXFZTkxl?=
 =?utf-8?B?d1FIbEhGU0owNitwSUZlZHMwZFlEOVBpQVRLVGlLSkVlQXM3NVlXaWtDZWRI?=
 =?utf-8?B?VjlYY2tsbHM0citIK2taKy9mWWswWmdyOGNtRzJWRFJxakFkQ1ptWGVYaHcz?=
 =?utf-8?B?ZFg3dnBzYkV6eHkwT1c1R1hkTmljZjk3eS91R3dZZWMrQmpyRmZlMEcvSEhT?=
 =?utf-8?B?QzdJazY3OFZsVXFKZUJsdGt2TFp3T1lFZ0xpNGxlRmkwSHlpMDVGWFgvdDdv?=
 =?utf-8?B?bi9ncGpQK0dnN3dabFpEeE5SYnkva1l4dXJWNnpuY29XeUNLb25JcElSSmZx?=
 =?utf-8?B?ZHRHYjhOQmdYR0Jhb1h3L0NXVlJuQ0JTajh0UWtrdzZBdExaQ0NEQkRvcjNW?=
 =?utf-8?B?R3dKQ3B3L0ZkdVcrVjBoT1BKY250b1ZOdEUvc0VJL3lyM09zMHNkMXRWQjlI?=
 =?utf-8?B?cnlXdWVJU0lJcEY5RDVUYy9Hczk4eUFHd0R2amtpT1ZHT3RWVGtwOWtsN0p4?=
 =?utf-8?B?UFhYY1M4NkZKR2J3eUk0MlJmVEFzS3d1Vys3VktBVzF0V0RJRFhPYWNlazho?=
 =?utf-8?B?UTFZWGFvcEdlYWlmMEVLZFdCY1RBYWlsNHRWbnEwdUlHRjlOZ3lVdjZtbnVl?=
 =?utf-8?B?R2R5NzlobmozWGF2TlNOTFZ0VG1KNXEyWjRsZW5qOWI2cTgzM2VxQU5TdWdO?=
 =?utf-8?B?YXVncWNvVzQ5RExCcTNGdHU0cDJmdFcrTjNDNTFqWGtPbWNBckpucVZ2ZlVj?=
 =?utf-8?B?VS9wY2tPcENHU05oVWZWajNGUXJHVVZHK0hwbHNmOFdyWGgrU3B2MVhKcWZK?=
 =?utf-8?B?Y0gzaFp0V3ZkTGs0V2orMGNiamZPR0lPRmdSQmFwaFROQjI3K3NQLzlKWFYy?=
 =?utf-8?B?cWc2UUd0T2daWDdQS05BZ1pzRWNTN3ZjS3UwejhwQ2NLdDYwMmhRQ0FyUjVC?=
 =?utf-8?B?TlBSTFZtRlJ1YlNTSXVlRlhUd1RXTWdCTUlya0NDMlZlVTJUL2VoQkZUVFh3?=
 =?utf-8?B?b2xYelowRnpZSDR0U1UyY0lsNXArTHkvQnY5R21FY2R3NjByREp5K2tYaGtN?=
 =?utf-8?B?NnVNMFdPRW8xQzJyTzN3VnNob2dWSlZueWNMZDZXbGpCVjAzaUpsZXQrQ3ht?=
 =?utf-8?B?UlFtdXNMV0h4UUs1UThDYlh2emtaWmpjZEh0K016Z3NYMFRvekgzeVczanNi?=
 =?utf-8?B?UEErclNFbzBmUHMwQWRwNWV1TnpZWWRDTkVTdU8xSXMvcnlqNUNXUzNKT1Vv?=
 =?utf-8?B?Z0RpVkpLZ2VaUDcyYTNsSTQzc1JVWThuZ0krZW04bnlwbGNVYVpkcEZsaHpv?=
 =?utf-8?Q?6OxRwk8wgkEFHOC2FFnN/SJj5AOIBfJWjGIqOkv?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78c61389-232b-4f45-4a2e-08d8f44d75fa
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 14:01:20.2751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yk1cwaC40xYFTu/E/v5Dh5rhW8FHC+TZZCyo4s3QI4k1sEYmtOsint+8sn96oFhVUhJKI1KqapiRWMQL4W5lcCvCVbn5obctvWlLZTVjDX8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4195
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9940 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 mlxscore=0 suspectscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103300000 definitions=main-2103310103
X-Proofpoint-ORIG-GUID: bXlxe1fC8Px44dx9GvBCB1TGf3dkDZ-B
X-Proofpoint-GUID: bXlxe1fC8Px44dx9GvBCB1TGf3dkDZ-B
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9940 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 mlxscore=0
 bulkscore=0 spamscore=0 clxscore=1011 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103300000
 definitions=main-2103310103


On 3/31/21 5:53 AM, Hongyan Xia wrote:
> Thank you for the patch. We observed similar issues.
>
> However, would you mind sharing more details on the test setup? We
> tested the hypervisor after injecting XSA-336. There were regressions
> in some benchmarks but far from being enough to raise a serious alarm.
> In particular, we benchmarked CPU, disk I/O, network and timer
> performance on VMs with 64 and even 128 vCPUs and the noticeable
> regression was a 60% drop in the ACPI PM timer when all vCPUs are
> actively accessing the timer. We did not see concerns in real-world
> benchmarks so I am curious how the -40% was seen.


We tested two guest kernel versions and observed this regression only on one (older) kernel. The newer one showed almost no change so this appears to be quite sensitive to guest kernel.


Unfortunately it is not easy to get access to the test rig so I wasn't able to do a more thorough investigation of kernels' behavior. This was mostly done by staring at the code, making some changes and getting in line to have the test run.


>
> Is it possible that the guest itself was using ACPI timer as the
> clocksource? 


No, we never use it.


> That could explain a lot. It might also be useful to know
> what OS that was and other specs around the -40%.


Guest OS is Oracle Linux 6 (I think we also tried OL7 with same results), the kernel is a modified 4.1. Skylake processor, few hundred GB of memory. Benchmark is TPCC.


-boris



>
> Thank you,
> Hongyan
>
> On Wed, 2021-03-24 at 17:05 -0400, Boris Ostrovsky wrote:
>> (Re-sending with Stephen added)
>>
>>
>> While running performance tests with recent XSAs backports to our
>> product we've
>> discovered significant regression in TPCC performance. With a
>> particular guest
>> kernel the numbers dropped by as much as 40%.
>>
>> We've narrowed that down to XSA-336 patch, specifically to the
>> pt_migrate rwlock,
>> and even more specifically to this lock being taken in
>> pt_update_irq().
>>
>> We have quite a large guest (92 VCPUs) doing lots of VMEXITs and the
>> theory is
>> that lock's cnts atomic is starting to cause lots of coherence
>> traffic. As a
>> quick test of this replacing pt_vcpu_lock() in pt_update_irq() with
>> just
>> spin_lock(&v->arch.hvm_vcpu.tm_lock) gets us almost all performance
>> back.
>>
>> Stephen Brennan came up with new locking algorithm, I just coded it
>> up.
>>
>> A couple of notes:
>>
>> * We have only observed the problem and tested this patch for
>> performance on
>>   a fairly old Xen version. However, vpt code is almost identical and
>> I expect
>>   upstream to suffer from the same issue.
>>
>> * Stephen provided the following (slightly edited by me) writeup
>> explaining the
>>   locking algorithm. I would like to include it somewhere but not
>> sure what the
>>   right place would be. Commit message perhaps?
>>
>>
>> Currently, every periodic_time is protected by locking the vcpu it is
>> on. You
>> can think of the per-vCPU lock (tm_lock) as protecting the fields of
>> every
>> periodic_time which is attached to that vCPU, as well as the list
>> itself, and so
>> it must be held when read or written, or when an object is added or
>> removed
>> to/from the list.
>>
>> It seems that there are three types of access to the peridic_time
>> objects:
>>
>> 1. Functions which read (maybe write) all periodic_time instances
>> attached to a
>>    particular vCPU. These are functions which use pt_vcpu_lock()
>> after the
>>    commit, such as pt_restore_timer(), pt_save_timer(), etc.
>> 2. Functions which want to modify a particular periodic_time object.
>> These guys
>>    lock whichever vCPU the periodic_time is attached to, but since
>> the vCPU
>>    could be modified without holding any lock, they are vulnerable to
>> the bug.
>>    Functions in this group use pt_lock(), such as pt_timer_fn() or
>>    destroy_periodic_time().
>> 3. Functions which not only want to modify the periodic_time, but
>> also would
>>    like to modify the =vcpu= fields. These are create_periodic_time()
>> or
>>    pt_adjust_vcpu(). They create the locking imbalance bug for group
>> 2, but we
>>    can't simply hold 2 vcpu locks due to the deadlock risk.
>>
>> My proposed option is to add a per-periodic_time spinlock, which
>> protects only
>> the periodic_time.vcpu field. Whenever reading the vcpu field of a
>> periodic_time
>> struct, you must first take that lock. The critical sections of group
>> 1 (your
>> "fast path" functions) would look like this:
>>
>> 1. lock vcpu
>> 2. do whatever you want with pts currently on the vcpu. It is safe to
>> read or write
>>    fields of pt, because the vcpu lock protects those fields. You
>> simply cannot
>>    write pt->vcpu, because somebody holding the pt lock may already
>> be spinning
>>    waiting for your vcpu lock.
>> 3. unlock vcpu
>>
>>
>> Note that there is no additional locking in this fast path. For group
>> 2
>> functions (which are attempting to lock an individual periodic_time),
>> the
>> critical section would look like this:
>>
>> 1. lock pt lock (stabilizing the vcpu field)
>> 2. lock vcpu
>> 3. feel free to modify any field of the periodic_time
>> 4. unlock vcpu (due to the mutual exclusion of the pt lock, we know
>> that we are
>>    unlocking the correct vcpu -- we have not been migrated)
>> 5. unlock pt
>>
>> For functions in group 3, the critical section would be:
>>
>> 1. lock pt (stabilizing the vcpu field)
>> 2. lock current vcpu
>> 3. remove from vcpu list
>> 4. unlock vcpu. At this point, you're guaranteed that the vcpu
>> functions
>>    (callers of pt_vcpu_lock()) are not accessing your pt.
>> 5. assign pt->vcpu  (we still have mutual exclusion against group 2
>> functions)
>> 6. lock destination vcpu
>> 7. add to vcpu list
>> 8. unlock destination vcpu
>> 9. unlock pt
>>
>> If functions from group 2 and 3 are less frequent, then you won't see
>> too much
>> added lock overhead in this situation! Plus, even if group 2 and 3
>> are somewhat
>> common, the performance overhead of an uncontented fine-grained lock
>> is muuch
>> smaller than the overhead of a heavily contended coarse-grained lock,
>> like the
>> per-domain rw lock.
>>
>>
>> Boris Ostrovsky (1):
>>   x86/vpt: Replace per-guest pt_migrate lock with per pt lock
>>
>>  xen/arch/x86/emul-i8254.c     |   2 +
>>  xen/arch/x86/hvm/hpet.c       |   1 +
>>  xen/arch/x86/hvm/hvm.c        |   2 -
>>  xen/arch/x86/hvm/rtc.c        |   1 +
>>  xen/arch/x86/hvm/vlapic.c     |   1 +
>>  xen/arch/x86/hvm/vpt.c        | 122 +++++++++++++++++++++++---------
>> ----------
>>  xen/include/asm-x86/hvm/vpt.h |   9 +---
>>  7 files changed, 74 insertions(+), 64 deletions(-)
>>

