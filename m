Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E7345F07E
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 16:18:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233176.404458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqcyz-000631-HH; Fri, 26 Nov 2021 15:17:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233176.404458; Fri, 26 Nov 2021 15:17:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqcyz-000617-Da; Fri, 26 Nov 2021 15:17:49 +0000
Received: by outflank-mailman (input) for mailman id 233176;
 Fri, 26 Nov 2021 15:17:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=maq7=QN=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1mqcyx-000611-Di
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 15:17:47 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0174a816-4ecc-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 16:17:45 +0100 (CET)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AQF2jmZ017915; 
 Fri, 26 Nov 2021 15:16:29 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ck1vmr2hh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Nov 2021 15:16:28 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AQFBQK1027148;
 Fri, 26 Nov 2021 15:16:27 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2042.outbound.protection.outlook.com [104.47.57.42])
 by aserp3030.oracle.com with ESMTP id 3ceq2k28cs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Nov 2021 15:16:27 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BL0PR10MB3010.namprd10.prod.outlook.com (2603:10b6:208:78::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Fri, 26 Nov
 2021 15:16:26 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::8d84:1f40:881:7b12]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::8d84:1f40:881:7b12%4]) with mapi id 15.20.4734.023; Fri, 26 Nov 2021
 15:16:26 +0000
Received: from [10.74.104.211] (138.3.200.19) by
 BY5PR20CA0029.namprd20.prod.outlook.com (2603:10b6:a03:1f4::42) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend
 Transport; Fri, 26 Nov 2021 15:16:23 +0000
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
X-Inumbo-ID: 0174a816-4ecc-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=V/gadEoNS7p0mffZIqwyneDcsSaxclv6pID1M46Kh8g=;
 b=p0cKybGific1YIKz0hQFY1EdDAciNvUjY96KAnhlt3RLzWjfuugMYhuDSWcMMGOQucQG
 mSU9s1c7RBEdF/ucJ5pspIW22MZ41+EoR5VIAysOsFfmAHsl+FyPjfz1l/UMOrDg2k+H
 55pjel6yz+g0XfD5K6ttexFtKNOyfF3jyyGjusp/dfmhY8aRJzwfYnm6fXfKmvg3HGd5
 pnPrjsKpguCD2WMJTzprZBBgtuMteiPxGpaxTm9BLYmk4xd/UQHXTb91aOWAjtzZMSIg
 YiRXPsGYuPaL/zelKeURdknNhpZkx/zfnLx+qxqFwc7qYxFMZ7XVFEG7YPxhmA50hbNH Bw== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZL/jQFMsd5m0gP+BfUrRlHX3myiEg1W3d+fXVJfOT0eG0qjpokHO+Knac7iHpFHVMAZ03tB2IbjPvyJQOtqMwwS48cFlUD6ohWKSvlTbOvdW7jsl5zSYyY0b0z0svDOR3lkbiVYBHlvmkx7u3SWGJNcdkC2crYfKEPgtJUoYYPTyugTi9TK5iPKgR2QLPloC1yhZwG8rnxqzUEgJO3yn3vHL+7Pwe6d64ILFzfpb1Z6QYpBH8s2pXRdlmxcZIlIrOtztlqohFxWjHW0ATCNDgP4LoQzWgQDCXR57hU/bBRbw1n9THZmACiv2euasXGCXugmdokQ7QYAV0Tqyo8Ivxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V/gadEoNS7p0mffZIqwyneDcsSaxclv6pID1M46Kh8g=;
 b=T7sXEuP3CwxYt0bCiJjxDV/OaQx0HOJm5kgZ2xZXht+yZZ65XvQ9lFcv6KPwRfPQwlyAB9fv8iHyAa/uEFq+sTX7HaWvKUjY7PnCVUyrIQg7cfBWQ8TqnmZCN4DzMDD1PEfYVJEgTLGwJVX/Sk5Hp2aYinJgjxlT2sJxiTOLVnvwjQUyVCjsFgqYp6toa0o+DUvY3inzexpZtcwPK2SALCYE9x3/my867forXxHuCDyMbgUZEqTIiqSPE3K91rr+2E+Nx2mysLtzWvRcydyezpEpzywkVieGDJx+TCBkXf4JJgjQxQgeCfPezNWRz6f7/+a2uoZkcFKO6SfkJ9s7Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/gadEoNS7p0mffZIqwyneDcsSaxclv6pID1M46Kh8g=;
 b=lGjLM09us2U6ko3GVMbpDpfEtDlNV8PNIWqXDsUAhKoGFCqT+kZnLN9LfkYtRQQyUAvnWCqOscaywXudrdAdnMfZqQ1MnwUZnKR00vKHq4xAtDxDn5lJLjil0Ub0wa/KaNbDK8iEiLDuwCzz5Xr/6UeqaQBAKxa7WufmAfokwjE=
Message-ID: <2893fd9b-c4d4-e601-e9e1-19a21297bb5e@oracle.com>
Date: Fri, 26 Nov 2021 10:16:20 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH 0/2] xen: make debugreg accessors always_inline
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, Stefano Stabellini <sstabellini@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>
References: <20211125092056.24758-1-jgross@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <20211125092056.24758-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR20CA0029.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::42) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43e87a88-f3f6-43e1-b613-08d9b0efb688
X-MS-TrafficTypeDiagnostic: BL0PR10MB3010:
X-Microsoft-Antispam-PRVS: 
	<BL0PR10MB3010C9C1209193C686E757AA8A639@BL0PR10MB3010.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	R8aQOFpFMvf8CZX3VQuaYuqhTNltMX3p9mHSFQSFTgQxUI/WgN11uW9tbLz+bUBFfJ3WxcD11EHjNsm0bzh6myG8hEHPN+9AeLpwYGtNE3FSshNwbLLlnF43Vnln5+tdNoEaWBVDAYdlvusIE+Pl6AZMiSJF6yhmyNtK9zV1S7CEn94cunNllqSDYiJjgW9oWJ5ZI2FDPaXm2QkQY7s5xOFoswxleZcZEvcQPAYyIzTkggHs2Or4OtRgxwfB9+mt8MYh2RjNaRcd4B6lQHODE336vjucYv0BPrP7tscMSwXWH8qa+exPKCSMF/Xh4WD2qs+CgNcuoH7HocUD9yfMw+fwXf3m1/d5BuwXskiXKYRy29k8mFEyrl4tc3XeU2bXtXYjvLW2rzQmKj9dB4xgHnWccwHQ6pNUNrX7kPjwkqy9iFhUZ8E0wGiFDoZuxN1bqvuWfZ25dsYUgQEfPlSgyHnrmJ0f5dfUp33ZpezRfbE1PDSsHOcOeqZU4s92dDCvAtrUDGn9nnW2jUY6TxftU5DJuNUSj+rbZ2CW7CUe43A84B2k30lZOnHGJ9DzKXneMVsj63zsJmeDOP7bnKzYGV4mnpOKJWKs19xozrM5+AJQlW1CjC8/cSwdqZ8amd7TNEFKzlIJ0NmyWk6abq9LnIwqe3IK9FE8JCHnwn0vGu8AWQD8Ut0X31sXxFXeuphAbYqWCspfjrFD6QztnHLmsPsFUfrld2xFfKkKUwrVEEVjsBsepoewtiX1nyhLiyxm
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(2906002)(2616005)(44832011)(26005)(186003)(31686004)(83380400001)(4326008)(956004)(36756003)(558084003)(66946007)(53546011)(5660300002)(8936002)(8676002)(66476007)(16576012)(54906003)(66556008)(6486002)(508600001)(31696002)(7416002)(86362001)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NkRjdFlkK3VXOHBJdHJxcHJXdy9IY3RRWHdheXp1dmJ5ek5zL0QvWi83MHNN?=
 =?utf-8?B?Rm41azBsSE5relhNUGljZ2NKOG5yVWRZZ1dhNFY0YjNrUjdpdy8zSWQwQ3dl?=
 =?utf-8?B?OG5hdlJhaEVxSkZXVDdOT1p6VHVSbk5VQjJNM0dwZ3ZVNk1jUFVkVXVzdFJz?=
 =?utf-8?B?N2FQT1pRdnU2THM3UC9QakZ0cXduVWVFTzhLSFVMd1ZtQTdMNmlqUTFvd0J5?=
 =?utf-8?B?RTc5VWRWU1NIZ3owdzBOYlFrT2FxUGhudVJSNDhhU1RYUEZiTExydGJTY2Ra?=
 =?utf-8?B?QVNnOXNPUkRDNnFmZmNuWXdtemJaanQxalBWVFgyR0xqNFhxTWN2QVZzNmFC?=
 =?utf-8?B?bVVLZ21WR1gzK28ySElMdVZVWERkbU40bmt2YWR6R2V1OVVxTVFWUGFtNFF4?=
 =?utf-8?B?S1FLNko2ZXRGTDVSc3U4SUpranM5QWJyUUZyTm9WbDIwNkJDWHp2cHVmRm5W?=
 =?utf-8?B?N3pGcU9NUThzVlpXMHVlMWtIcFZaNnhOeTNZeWJONDRGVDRqY0h4UVF3Yjdt?=
 =?utf-8?B?dEh6TmJRdzdNb1RIUk9ZRWl6WGZGNSsrUm9pNENTR3VYTUdsaFlwdHVjTG9T?=
 =?utf-8?B?bzd5Y0QzWjJrZHZ4bmt0aFFSbElXNm1JdERXMTFxQ1E3bzhDVndTcCt2SmRi?=
 =?utf-8?B?Ym1zYmxXbnFHckZsSWpUd2NKTGEwOXBOU1ZQOEdKcFhSellUWWlEN1VMTGQr?=
 =?utf-8?B?bmZ6Q2JOQzBOcDk2VlQ1MEx2MCtCelhHRUF6SlR2U1JNVVJnNjZyQ0ZVazB6?=
 =?utf-8?B?N1kxWW44RkxZQSs0dnFPNmVNaFhJSDkyc2g4bC9YaXlBaUdjbmZzbVNIYkhj?=
 =?utf-8?B?cnh0eElnMWppZENHM1lzYWN4Nit4cDhGSFlaSDhSRnNhRkNFMng1RUZMNEMv?=
 =?utf-8?B?enhSTkpFVm1hTXBxUWVja2FVOXNTMmhyalF5OXJoODB3T0dpZXduV005RU80?=
 =?utf-8?B?eFRYOUREMk9pTU9vQWxyYWtaK0dXbnN2d3lCRlR0RHBpWUliVDU1eDdDNkNZ?=
 =?utf-8?B?WE0zR2NqVGtBLzROR0lCMFdGOHFBUGNYbWExN0pxTkhQMExIL1BPMGE0M2dn?=
 =?utf-8?B?SFJIT3EyQy9lNW9rNGppM1FwZFQ2TU5JNTBNTDN0bFRYbFFlc0l4VFlONE1j?=
 =?utf-8?B?T0xidjkzVTFobW95V3dEMEVGcVByVEJnTnd3ck1NUUtuUHQxb3ZEWFpDKzBw?=
 =?utf-8?B?Rm40b1V1NFBDSDFmRHFMNWlhOXVMWEo0VnExazJwUk00MndxTUVNcldoNTQz?=
 =?utf-8?B?V1VkcUdrdkE4Zlo5b1JsTzRnRVVpU2lKaWVkMWk0UEpzVzdKdGFmVkxiVURS?=
 =?utf-8?B?L2t2M2VLQmFqSmRhMXo1UVlEbDdKdCsza0hwT3JCN20zRnQ5SU1XYUlvdmln?=
 =?utf-8?B?R3dUWm1zb2JmNUdod0V5Y2REbU0xOTlHNVhTcSt1dFdEOCtpaGIvNlF3SVdP?=
 =?utf-8?B?UkFkYWkwcldMbzg2Z2dZVW8xbnpZUGdpeXlmT2N5ZWJRZEk3TGkzMEJBZkls?=
 =?utf-8?B?M3VZSk1Vb0VXbWVldjl6eEpCbmtybk1nc3Zpa2l2b2xCTGRnZnY2UFJhZXhF?=
 =?utf-8?B?MFJLSVhYdXVlM2hGMFM1VDNtQVNzMnRLNXM3OTd2cXJOdysvazRJRTIrbC9B?=
 =?utf-8?B?VXhBYWdleGQ0ajhWdlNWZ2NwbG11S0h0WnVWNVAzL0NqK3hHUE8yNEtiYVc1?=
 =?utf-8?B?QW5JaFcrd0V6M21qQWZUbkR4VlNEaXJVeGdLMWd0Zmo0dlROb2kvbmNLd2tK?=
 =?utf-8?B?QmxpK1RFOENMQVBsaXVtSzFzbnNHbEJnMGFmVmQ4bGc1ekNLMU4zaU8wbGxa?=
 =?utf-8?B?dVAvakF3VU1UVzl0VEZSN1hoRERrTzh4Q2RjYnFlMjVvbWdTNUx0Y0MzajF0?=
 =?utf-8?B?aDc4RnRKSFZ2dVBEdnJrbzZWS1ZZL3RVOUd2V1lYY0wyMFhnMm9IY3Z6RVFX?=
 =?utf-8?B?MC96SEVVbklOTGRMUHQ2OEJDbUlxajhTUXdLV3J6Y1BPZW85Umh5cHhqSGIz?=
 =?utf-8?B?UndQc0doQ1dnY244aGxwSTVoUG5TMUIvdnZMNncyOVMxMlNaTEhITWpZcnRS?=
 =?utf-8?B?b1Q5cE1ucXlGeFhxYkx4eUxLc0hqaEQyZVd4TzFPc1Bsais1NksrbUVUNU1E?=
 =?utf-8?B?OFlxdFJwalFQT3NROHd4M1d4ekp0UGh3SFBQOTZLMmFhT3g0U0Z3SWQ5STIz?=
 =?utf-8?B?bUhGUk5rWmE3blA2NDJrdWQ4WnhVMUFlSXRtejRWOWNKbDlGa0hIUFZYaElY?=
 =?utf-8?B?bk9uUW10dGZxcU1CUG5LRGx1Uy9RPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43e87a88-f3f6-43e1-b613-08d9b0efb688
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 15:16:26.1117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QfhjBRlBYOEn+8AQ8PayrEb8KBYJ3TSRa5pBgMR2t/hx5iWrtXdcC0v9FPA6xROghAwlC0ujQxEwtf54Vk4rulm39/CXi00Cyk3uToIQeg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR10MB3010
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10180 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111260089
X-Proofpoint-ORIG-GUID: tU2Gqcv6ZmgIdQKpnP33z9_y8dQAAMja
X-Proofpoint-GUID: tU2Gqcv6ZmgIdQKpnP33z9_y8dQAAMja


On 11/25/21 4:20 AM, Juergen Gross wrote:
> Juergen Gross (2):
>    xen: make HYPERVISOR_get_debugreg() always_inline
>    xen: make HYPERVISOR_set_debugreg() always_inline
>
>   arch/x86/include/asm/xen/hypercall.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)



Applied to for-linus-5.16c


-boris


