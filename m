Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B705E513DA4
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 23:30:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316778.535824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkBiS-0003ki-TB; Thu, 28 Apr 2022 21:30:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316778.535824; Thu, 28 Apr 2022 21:30:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkBiS-0003hv-Q4; Thu, 28 Apr 2022 21:30:24 +0000
Received: by outflank-mailman (input) for mailman id 316778;
 Thu, 28 Apr 2022 21:30:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=noDR=VG=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1nkBiQ-0003hU-N0
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 21:30:23 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67395c57-c73a-11ec-8fc3-03012f2f19d4;
 Thu, 28 Apr 2022 23:30:20 +0200 (CEST)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23SJjjNs015405;
 Thu, 28 Apr 2022 21:30:16 GMT
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fmb9aw6yv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Apr 2022 21:30:15 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23SLFCpP012117; Thu, 28 Apr 2022 21:30:14 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fm7w7a5su-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Apr 2022 21:30:14 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by DS7PR10MB5182.namprd10.prod.outlook.com (2603:10b6:5:38f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Thu, 28 Apr
 2022 21:30:12 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::4455:2c02:503:a182]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::4455:2c02:503:a182%8]) with mapi id 15.20.5186.023; Thu, 28 Apr 2022
 21:30:12 +0000
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
X-Inumbo-ID: 67395c57-c73a-11ec-8fc3-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=wR1muW8sQEWzfVvqyniF2laqh35oLxdZteeYDYHZRW4=;
 b=LNMzmDwNivdInQtq5bzJKyQLGC/mgYnOoFOXoOJ51rqxqhMUFUHGirgP9RYO3KGEUuC6
 fM4lpnxuLGjgB5UIp+DQoe/xuBNJ77cOOAzsp0nrrFL6PtuwZh4nQIuMPzQC5Pmz1QRk
 YbnZUYRTlkxoBu8gRqFvAu+B+OCKssvKby6TlWcLAvtSi2OIrtZ8mhP2sa9g0MnHMPk9
 IHwfjOi9XR6jcGuHiOv2cDVoV8g8yokvdhUnUQXJbKbQzdnWjy4QNWbi9ZwDor0f7RA1
 rC3L8NDZeIkQ0wRAAkLxJx7ExCcb0kuZxipC14eaJh+UZN6i1TG+umHPFF98edqBThn3 2w== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K0vTOd7meOALC6F9TUO1WChJSUs0R2RyMVHNtZA1bY0ySTgjODzeS7MYKuoVRy+SeZ+fuQfds/m+baLoPt3koXHJf6+fW2HH/vBaTyJrlft5qyJld237LCAxI7krsjflovUlD9QQxl1Aavwq4LCKN+iV0vrn1/1SWhdS0EBI5vi5OfTLJznqJTdBNxcJyf24/ROLMQbj8TUmtRv6KrRWybU4XxxnV1IsheXuhHdjQLYQbVU7ihF3sXSbd1S4unfINC0wk8dmcvMx7f7i5/FrxR+qAPBe2AmrTLY6cARIxE1RUztvqYgV9QtHS5FTZe41xvdM6VUJkZH7OxXK7yZiXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wR1muW8sQEWzfVvqyniF2laqh35oLxdZteeYDYHZRW4=;
 b=SrsvsQCMNHdrK0S1qoYhhmH/KlmFYzbkT4BUplZk6p9J2g9VznKFm1VLfe95I7BPZR/hqH3hT39ngtp2oIxvprtVZIzD+h/6FEk1UX8/nnBOqpczpxQ9O3pS/hw32vfA7RNsApScXMaWch+YFFWiHQysL8bmQ2FZohnKdP3wFucjAUblio1bej9qSdPXW1sasQ3YR54Xj0kXrV/tvLa8EIczq5zDFSrQilvCjUaW34NTUyjv36XOBfF4GFSFYDTSnxWOiUGn793n/OlVidI62NnlU9rXKwBABcr0T3GsilOdKUClmkbrz81heYwD/K0WzDAgLVWf9+zXno2nCsb/LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wR1muW8sQEWzfVvqyniF2laqh35oLxdZteeYDYHZRW4=;
 b=lsOowuyuDxmLSVI3mW0tSm5QoY7yQ5b4vTQn6T03HdSO6PNJbfs/bH5jklCsFr5hI9od0epraGNZ8gWYyVr9bw/6nVjfJtzbQz8OICB1MVOEF5PEWuTXvP/HMoy/lJwpmXEj/PMF2qVH2C5VgwimXg8ZPQn3XHg2dYS83pFFIHE=
Message-ID: <309bea05-2247-d451-3548-c824333a83f9@oracle.com>
Date: Thu, 28 Apr 2022 17:30:09 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: x86/PV: (lack of) MTRR exposure
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>
References: <b3f07165-67f0-3d50-e249-2618a2dc862c@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <b3f07165-67f0-3d50-e249-2618a2dc862c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR08CA0028.namprd08.prod.outlook.com
 (2603:10b6:208:239::33) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e3fe2c9-db6d-4356-ec75-08da295e46e1
X-MS-TrafficTypeDiagnostic: DS7PR10MB5182:EE_
X-Microsoft-Antispam-PRVS: 
	<DS7PR10MB5182634CFC25F64E126F9F4E8AFD9@DS7PR10MB5182.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jvxYozBL6OawxmFqY5HIN+rbVz3Ip2omv8rlDSSDFnAoan8k04eehxr1aFiDK/08jD0OSgY1opcpuQRnWAhWXWDtQNkCJITERwlcaxlscNLEzquinqbq3YJ7Ueb5u4wTB2hv6FykhkU54mmycX3H2s7l//J1K5QuESZd2BhY9STVx7mpHcUib5QKX0Qa+8FdjJZxub4vPJzCLHnJgs9/2T5TGOXXJVFZRTojRID7xnurLRt9M2E5odaDIAmjs6HWdmgjHFFA6wfnCHiWfF8zA6WPVnZ6WrpTh/eYPsKTabK5HVC5RSR5ZlXDCbgaMv1JWNP27u3RSQ/HFN0GXY5CtpqlS+QchNZlV/mp1bGKX9679TC7viQhd/tctnqQrCJ97LkKfIW0pHXpZkByog0VtNZ9xJZw84fs044DEtj2fJpN30MyP5nJh11RUlfRaPxwlT0GYpemZY8VNW3+EaNwye2Vw5I0dJtLcp21qsz9dIU9/AKC+7JIbOapFPONw7koipRnudHfRh5E0Li8234L5Hr1kgVpV924Ksxv22HS24c8JTrk83yN9FEb3y43xSTts4uis6vtTxBsGLLsk9ZrJ+go5ktXU54Z7bYnPVOIvRQJ3H4onAj5iuwN21CBbvsAKYcIo/i3FX5UG+vru7ngMCykQTzrVx1R+v2W3I/3j8Txtby8HTO2LdF2RzxkuZ/KsC++SXjaeDygVN5U2H2yaFY5T/y9hE1Feh34z3NCBkJk+VyRwZdkOAI0hYafyJvzbysQzyAfTvorr3iPV3BD/MDsDzvqU/1r6rdQeh8jI1Zp5lx873zf7RDxK70N+r8ebMBJt2S1lxAOGfVApdq79w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(6486002)(6506007)(2616005)(44832011)(8936002)(5660300002)(36756003)(31686004)(83380400001)(186003)(86362001)(26005)(31696002)(38100700002)(6512007)(6666004)(966005)(8676002)(508600001)(66556008)(66946007)(66476007)(2906002)(4326008)(316002)(110136005)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Zk5EZ1JhN2JjbzRVUGJIKzF3TGNOblYrUVRsSklKR2UzNGpkNHlETENLSDJV?=
 =?utf-8?B?azNQejZiNnZFekRIOXFnQzdWbFg1L3loSjljVllZQ256bW0walJpcWFnNkFk?=
 =?utf-8?B?UnBPNG1OajNTcHVTVGtXY3BMTUpacy9XOUF2Y2I3YVZEbXVkY2I3eXk5bkZV?=
 =?utf-8?B?NVlib01RQXZsWnpyanF1czBVRFdCNjU3NVVDS0hjem1CZzB6Nk9oUG9JQ05i?=
 =?utf-8?B?NjJJREs2eDZUcng1SUUvMktzVDNLdXo1cTZYcTB0Z0pOVUZMSDYrVmRkZ3py?=
 =?utf-8?B?L2FRQ2F0VG4yZHV5aHdFM2pENW9zYk1HbVVUM3d3UzFFWFdXZWN6cGx5eER3?=
 =?utf-8?B?OThWL3ZoT1RZbU43RTFwTnpZdkVTSTh5UEtUWW1OcjJEZUx5WE1SSFJ1bHFI?=
 =?utf-8?B?M0NvM3ZBZ3ZYc1J3U1FGSVZiN1E3c3dpbnROSmFub0x3Y2ZaT2wzamY3U044?=
 =?utf-8?B?NUliZDdMZ3JVNWNIR09uUktrRDM1SHk4VGV0Y0J0eGdNNCtkZ2xhU1EyWE5y?=
 =?utf-8?B?VFIrMy9hZCs4LzFnRGQwcVpJUGlqdUk4WmQwNGFlZ1huNmpzbml6b3BudWdy?=
 =?utf-8?B?M1h5U3NpTFBQQk5xTElkMThaRVYwK1pqWjl4Y2JyM0ZFaDB1V2FBNzZEUjlY?=
 =?utf-8?B?MUZmRTlQS29aVHV2VWpVeTFxeGVBMXBqS1FPMUk3SnlBMW1YV1pTTkU2bnU1?=
 =?utf-8?B?SnBvamx4TXRJY1JRcnNQOFZJQzdZVUNmUTErZ1p0dm1UVnZHU3pPS2hscEls?=
 =?utf-8?B?U3NtdHFwUlhsd2o5SnZKdEZsRFV3KzRFdzNlMm5SYm1PTGZHczVsQWJ0cVAv?=
 =?utf-8?B?dDlKUE9vN2Q4VzdybnJuSDgxcVdVU2I2QkpvZ1ZYaE5KZVo2ZDVkOFp0akg4?=
 =?utf-8?B?akwrTm81cFNIL0hNVGdHMEJsZE5kclNxMFRiTmxlQVYydzFrSHZZRFRPaEY2?=
 =?utf-8?B?N0ZJUmxsUG4waDJIekxuWi9leG82RGl0K0J0TEd6dHlvZ3JBMHlqbU5SNnR1?=
 =?utf-8?B?cHExQ0JwSUtqUGdUcmhlZE5DNllWckRXemdJQkhISmRnTW9iUUt3WkhxM2Na?=
 =?utf-8?B?aGlDYVFkdmpyY2lUclJwNkpqN2lKbW5yS3I4VmF5RkszcjFGYmMyTXFhNDR5?=
 =?utf-8?B?VXFEdDFuQ2h4Q01tNjBFajkrUlVVWXhSelowOWEzY2ZqOHZRRklpanh5alNX?=
 =?utf-8?B?N2xwZ2t3MkFHdmNzN3phbzNKcTVGRnB2UEVrTnphMHR4ZzljRUc5WTJpN2J3?=
 =?utf-8?B?ZGN4TXhDQ3VKa3VPQnBzZmt4MEQ4R3ZrYWc2WlpFdC9GSG5WdlgyTHN0SG9s?=
 =?utf-8?B?bHlQSTVtV2RpdC83YTgvV25sRWFnZ2dGU202QS9jMzZLZS90bUR6bzR3VXdT?=
 =?utf-8?B?Wno4eFFaTnBZNTdCOExYcnNsMnhJUzMrbm1McVlOMk95SU9kZ2w2T0NoTkJh?=
 =?utf-8?B?aEt5amNDaEVDMmk5SElGcDVJL0hBYWlSWVQxajgxYXJaYytQWkJsanpnVisx?=
 =?utf-8?B?OHFnWXRzdGtXM3ZsY1hrY0RDTDlQRzUvV1JOZ2RjankzQkFoTnJ5aktLNXlY?=
 =?utf-8?B?cy9tVmV6enpRMGdOeU5lWW5kcTE5ZXVTSDV2RE51TTBSRHJFWUpxYk8wWWdR?=
 =?utf-8?B?U0JXUHNFLzFwMnE1cTFadVkyZTVMTytxNzM1RCtCUS9rT0VmTG5YQ0FHN0Q3?=
 =?utf-8?B?WEpVczJ2RGJucDJzSUxqZFBKeGJwdGU3bFRqczlDTU84OGtGKy9JakpWdjNQ?=
 =?utf-8?B?c1ZwbDZQV0M4dEQ1QzhiQlNjenpOSVUxUWhKQjliT0hhOVQxRTZuR0FsMjVq?=
 =?utf-8?B?TEN1RFdNQ1prR0REQnV4RGxmWitLaVNSWlZaM2dhbXpMNzJDTi9oR0dHbUpS?=
 =?utf-8?B?UFE4aktOTUwvaXJnMFhUTTFXTkhRRTVZazdBekJEN01zRU5MKzMzQi81TFFq?=
 =?utf-8?B?ME1Kb3AvSDVYcVlMbjJDWnFiLzBOWnFBRzBvU21HaDZNYkVYNWExdFo4TytK?=
 =?utf-8?B?eXNGYkU0NG40QkFLQ3ZUN01kM09LUGE2VlpzUTVSZnAwY2JMcHEzdm9TWWhR?=
 =?utf-8?B?Ujh1MHY1ZG9vd3AvbEgxV2lzbzNmMHNJUFVFaTJhWE9HS0hFUGdIN2FGVXZB?=
 =?utf-8?B?Q280RDJZTFdrdU5LNjdaUkJCSEJjbzJEVnE2bytBWktIZnZGeHdEbmVjcWxo?=
 =?utf-8?B?b3pub0lvbjBFRWlRMVJFSlpSbHVUajlTQVd6TERoZGNkd0RNNC9YWGloN21Q?=
 =?utf-8?B?NFdQdElCWE0zdEY2VjhqZWNTQ3RrQVpsUlRJYXpHUkliNjJhNXlqdzJEU1o1?=
 =?utf-8?B?R2t6MFppVk1iZ1N1WnFhZGJXRzdPMVNHTXZGbmFUSWVVNnBCd01MZ21WdE5o?=
 =?utf-8?Q?A/ujgNWXVNCvw4Dk=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e3fe2c9-db6d-4356-ec75-08da295e46e1
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 21:30:12.0315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: csqvwkSIVawYjmlXEfaSe7e7jYvqTtgTjrLhsuSOBdO5bv5HE4LTKUDW6J66TBLLtbWBlhnXwG4+C3hYpyo9AY+sM8UHAE+MxZJj0x6n5/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5182
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.858
 definitions=2022-04-28_04:2022-04-28,2022-04-28 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 adultscore=0
 mlxscore=0 bulkscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204280126
X-Proofpoint-ORIG-GUID: vcPi40YZTQFp2_4FffQjvFCbarquqMSj
X-Proofpoint-GUID: vcPi40YZTQFp2_4FffQjvFCbarquqMSj


On 4/28/22 11:53 AM, Jan Beulich wrote:
> Hello,
>
> in the course of analyzing the i915 driver causing boot to fail in
> Linux 5.18 I found that Linux, for all the years, has been running
> in PV mode as if PAT was (mostly) disabled. This is a result of
> them tying PAT initialization to MTRR initialization, while we
> offer PAT but not MTRR in CPUID output. This was different before
> our moving to CPU featuresets, and as such one could view this
> behavior as a regression from that change.
>
> The first question here is whether not exposing MTRR as a feature
> was really intended, in particular also for PV Dom0. The XenoLinux
> kernel and its forward ports did make use of XENPF_*_memtype to
> deal with MTRRs. That's functionality which (maybe for a good
> reason) never made it into the pvops kernel. Note that PVH Dom0
> does have access to the original settings, as the host values are
> used as initial state there.


Initially MTRR was supposed to be supported but it was shot down by x86 maintainers who strongly suggested to use PAT.


https://lists.xen.org/archives/html/xen-devel/2010-09/msg01634.html


-boris


>
> The next question would be how we could go about improving the
> situation. For the particular issue in 5.18 I've found a relatively
> simple solution [1] (which also looks to help graphics performance
> on other systems, according to my initial observations with using
> the change), albeit its simplicity likely means it either is wrong
> in some way, or might not be liked for looking hacky and/or abusive.
> We can't, for example, simply turn on the MTRR bit in CPUID, as that
> would implicitly lead to the kernel trying to write the PAT MSR (if,
> see below, it didn't itself zap the bit). We also can't simply
> ignore PAT MSR writes, as the kernel won't check whether writes
> actually took effect. (All of that did work on top of old Xen
> apparently only because xen_init_capabilities() itself also forces
> the MTRR feature to off.)
>
> Jan
>
> [1] https://lists.xen.org/archives/html/xen-devel/2022-04/msg02392.html
>

