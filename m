Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8A34469E8
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 21:42:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222627.384922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj620-0005V2-B6; Fri, 05 Nov 2021 20:41:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222627.384922; Fri, 05 Nov 2021 20:41:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj620-0005TF-7N; Fri, 05 Nov 2021 20:41:48 +0000
Received: by outflank-mailman (input) for mailman id 222627;
 Fri, 05 Nov 2021 20:41:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HFAl=PY=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1mj61y-0005T9-Kx
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 20:41:46 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c914460e-3e78-11ec-9787-a32c541c8605;
 Fri, 05 Nov 2021 21:41:44 +0100 (CET)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A5Jxt2x018600; 
 Fri, 5 Nov 2021 20:41:27 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c4t7e4f93-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 05 Nov 2021 20:41:27 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A5KaSNu168214;
 Fri, 5 Nov 2021 20:41:26 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
 by userp3020.oracle.com with ESMTP id 3c4t61s4up-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 05 Nov 2021 20:41:25 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BL0PR10MB3041.namprd10.prod.outlook.com (2603:10b6:208:7c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Fri, 5 Nov
 2021 20:41:23 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329%5]) with mapi id 15.20.4669.011; Fri, 5 Nov 2021
 20:41:23 +0000
Received: from [10.74.104.120] (138.3.200.56) by
 SA0PR11CA0128.namprd11.prod.outlook.com (2603:10b6:806:131::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Fri, 5 Nov 2021 20:41:20 +0000
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
X-Inumbo-ID: c914460e-3e78-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=9COEaYkMTdgVd5EKihn+6DfG0s4LaKi3jYGoq4hjSSU=;
 b=A5qPU8+eGpqjoT6OlocWb3JAeVt/9fs3+1iJkoSRuKxHzx+NLbi1XWQuKXb6vl7mxwvo
 cFphGjtkPwUWItzzfj3Ufa/UfGxxatzQyq1i0NiISKKKAHC+QutiWuMVnA7rqE+tUEwh
 hxlLZnclySl9ebj86xY4ebmZaglsX7zecwS0WqIPrRkrgmy6k28prOvKZ7WzsxDorvvb
 8ho0RzYOdgqaeB2676nu8AgRcaKnAyliMCaEqGx/RTnTAJmkh77wwHxwiVf0jWUQYKua
 hANmSyqo/CpXw4C3IZJGtkGUYkYHlqX9iNCsBRuSP9qgPDRqrOSXOHpLfz+xFLBfaqlb dw== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eq+YL1KnvQSEjKy3aeFoC3sGmXmpOoTGz1OrodXQUqdlZ6TmD85JP5KeFOrpbcFJAERTOSo6VkKj0x14BVU6Gh5o8MXbDtdvtnTmxTabBcfvSahUqau7IcusCZmznBfYWp3oSuD8vDZOPYl8jATb4C/59EYLmCi5GZPoUinYHFvAJb52wKtukOlHHIrDnYt6Giwuzh/trb+O5VggyiMggfK2BfmBAlv5ZLWR8iC9xfF8yW7ddF4q/2yUgScYY6QPjHziHCzN6bwYMQ3e1x2V5xq42sxtraxvPN8GiR8jJRLuYkUslwVxHu/bqdW/+Q5jHEr5tvl2JtOUoSgKUSSXcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9COEaYkMTdgVd5EKihn+6DfG0s4LaKi3jYGoq4hjSSU=;
 b=aV/xLgAhYr+xO53iFO366uKKrzFcejFg6C3P/bDVo2rh93uqiwkm5cCPG3XRUYPjRBjey85MYdazCKE9tnZwyEPofqsGUha9ALL2uYluWSPQuDB74lMPotuEbaOUARqB6XoCGP3T86E0MYz8jJNITHgCpjZi7syHrVVVETP22EqPW2o11CY0yybOClUoaECLktifvKHQGj68TRRT3OqLyfncrR46d2QHZSBnhHztSWGkaDLBv2BsznkbtsYMalD4JLYe1fKuOCGM/fLN6l9QfwpwNxmC6banjwBDPBwRzYFUMrc/nS3qiKhU0FTR33EKAlaLTCnQ6gpTCi00TPLTuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9COEaYkMTdgVd5EKihn+6DfG0s4LaKi3jYGoq4hjSSU=;
 b=zzUGHVXR8M1XoYUSr6NUN39AgblKNJ6fxgj+BQ8ZU1ToJebEbTeifpYtvAbkgySiad0QQ4fLHdZcmuo/OhRLEwR0EOP6fAFp5b1xugx+Zp1lWtKhxSVKHZUE0fTU3670FDDKyqPN0ohIMyKbSBHMdw22bqd3xEUkuFiUKs085Wk=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Message-ID: <a891e4f6-9832-8335-2cf8-e494f8703fb7@oracle.com>
Date: Fri, 5 Nov 2021 16:41:16 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH v2 1/1] xen: delay xen_hvm_init_time_ops() if kdump is
 boot on vcpu>=32
Content-Language: en-US
To: Dongli Zhang <dongli.zhang@oracle.com>, xen-devel@lists.xenproject.org,
        x86@kernel.org
Cc: jgross@suse.com, sstabellini@kernel.org, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
        hpa@zytor.com, joe.jin@oracle.com, linux-kernel@vger.kernel.org
References: <20211028012543.8776-1-dongli.zhang@oracle.com>
 <1f19674f-e608-1faa-5656-fec853297198@oracle.com>
 <fe6d7aaf-97b5-dfa2-75e5-1a072f4aac92@oracle.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <fe6d7aaf-97b5-dfa2-75e5-1a072f4aac92@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0128.namprd11.prod.outlook.com
 (2603:10b6:806:131::13) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a97e24ab-9a90-4bf5-7e8c-08d9a09ca142
X-MS-TrafficTypeDiagnostic: BL0PR10MB3041:
X-Microsoft-Antispam-PRVS: 
	<BL0PR10MB3041D639B061FFB0674955068A8E9@BL0PR10MB3041.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DuZWJ53XUcuyXPohLNCpd8V8ynvHnmsyhWT1Gm2Uz5r5R1vzwKkmPD17HQuDUFzP19LpVjSVLBKqH8EPq2yEagAu6VeCJtJhHSZHnF0Yf1GXPcgWBGbwGl8DL6aMVzMNZVcDgSIrM6PxRiZR1qOatul0uY3dYkX4J9g2SU99wRSAD8/nO/bN6ibsDn7s1MeuU0RwcHOnmbXCs5tqwSBL5beRhC5RQyqRCJbO+bMJlXtb5HWXQJQonrfAhSeKUpGC+StnP55VSJtjKS630gbMOes1Z4t/QyzI4e2YOvLpY4kL7ht5WTuw/OTqn66i+5cBNj/9WEoIw6myezEfUErHCCThO+n5cMG/1M/KCrLYdcal8T4FBsiPp4Qjs6CD4cClCGtSnrZqxJgcm7yhsx57jRWm9y8LdmN5YgRzeu1itHSqQaVKa5TeoxFceq+MZIIDfs2dmCOuoHOn5BRikjjt0rTvcJbvsnXNOaEgSK89vMorhAVr2XJAlV7VnKllsUZRN/0l53oVcdldyY3/Dg9JpnQ+I0nrM5RiLrGH/5p056/YxcbfmNor8O6502C+r/2SVTlwMJkO/FKMmUKBlLUCZL57ANlts36D3SbwUH8S24PZ5YXzVUeFSnoismoDiaijyEfGj5farHeCqMnWw8Wr8t0Z9rmnE5+X2CfnvkjIkfeRerSsnZjG4hJU+bwTlTcYTJLxruRyvA9tEmbdcrHxOua5fvWnT5DSBJQAIgo/Ha1s8uHE1Ni00JqeWdrcenjlZAc9n9GhOjnNGzBXqxLU6Ufw98nnLwQyeLbjkQsopmhz9kyEj1Mn15enmwlKylMLxPeiKs/Y0sY4G30t+xLPZQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(186003)(38100700002)(956004)(66476007)(86362001)(53546011)(6666004)(36756003)(26005)(31696002)(7416002)(83380400001)(31686004)(5660300002)(6486002)(8936002)(4326008)(44832011)(966005)(508600001)(16576012)(66556008)(66946007)(2906002)(2616005)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bnB5MWRWNy9yVVBZQnVjdThKdkpRb3A2VlBvMDJRZm9WdTlIeXRhSjVIL0li?=
 =?utf-8?B?b05lQTdRWGFVWjdwNEJBRmpYVEl6R1RqcTNUSXRST1N2SDQ2MlJJbEtrOVRv?=
 =?utf-8?B?cmxKMGg3Qm52RWZVVWI4UERvVy8xMG8rV09lYThoTFFNRXJrcG1oT3Z0SkRj?=
 =?utf-8?B?QWxSb085QkdaZk8xeWdqb3p4ZzNQMFhmOWhvR21tbGg5dDR3RkJZYXBIcjRs?=
 =?utf-8?B?UkdqV2taS1FtV0V4V0tGMDBBd2QyRS9xcHNlU3ZJbGlTTXJHZTN1TnZ3NkFi?=
 =?utf-8?B?aDhES1ZGc3dINVNNMzB5VFZmQ3I5OC9jbTQzTVZpV3VXeWRVNkFRQ1RjT2g5?=
 =?utf-8?B?dFhkQW1aT2tobjREdi9rYzNtd3h2TEhXNC83R0s0QWNDYnFYWm1zMlJhTUtG?=
 =?utf-8?B?bVZXVFBVSWMrU0NlV3ZZMTdYMThoa1VoT1dlYVVNeGpBQmkvMnhJM3VZUllj?=
 =?utf-8?B?bmU3ZHRzUGhRQmJycGtqaDEveHFydU9HLzkwWVRxMndxb2FvdllQKzEyUGNx?=
 =?utf-8?B?RHdOZG5XQlJhaEtJL0RZTGk2aU5DQUh0Tk5mQWpTN3hQVnlaL1hVWThjQi9m?=
 =?utf-8?B?OFJBM2RTVXNZc2c2YUdMUzdLbDJPQUgxM1RRU0dGM2ZHTDI0WDlETmVhQWth?=
 =?utf-8?B?d0dCcS9CR054VG5KQ3NSNjNUNXRieTR4ZTYrb2lodGdHenlWWTZYVmlSSnA3?=
 =?utf-8?B?bjN4aWZEZEpqYm13R1BGSFlFdStQSW10UWgrSm1BTlVYcDlWNGJFckdnRW51?=
 =?utf-8?B?UVd4bFZxOE12VVNIcm5PTmxVbkorY0hJdkt4YlRHaUN0bnhHVmRiZmpNZ251?=
 =?utf-8?B?MDczL2ZSb2ROUzdNM2ozbTFHZ1VkaFpQT3FwVC9iTktvTXJoUUsxK1E1Zk1C?=
 =?utf-8?B?Tis0NGFmakpiUjY0d3ZVUnd1UWQrOFg4OWNlLzhMdCtuV015UzduclcxQXBz?=
 =?utf-8?B?OHp4b3Nsalc1dnlwMXpEZFl3THU5ZnhRTlBmVWZBRjRFNkw1RE1MQWRxSGpy?=
 =?utf-8?B?ZzcyOFlhRHJQbFpiNTNWNTduWU5RRllXOGY2aTRZNzNlQ1dRZzZTUEYxYnNQ?=
 =?utf-8?B?SE9LZDNpMDFpK0JQSXBib3ZUZkcxLzZvUUVoWEpEUWpmYXhEK0ZXdXVLZlc0?=
 =?utf-8?B?b09RNUJBbmc5SkRoSHJJWjhNZEtadzdtbjFnNnVmZ3Z3b04yOUhpWW9GQXEy?=
 =?utf-8?B?cnI4NmE1WGR3SHZCNDVWTVZLcHY0amxjTmpvR3l2RjVEbUZtU0Z5cGlNbUxj?=
 =?utf-8?B?WiswQkZDT0Ixbm5TdnJHajdibnJQNFA3NCtoY25Sa1NFRE1wZUZtOWdFNlFV?=
 =?utf-8?B?NWgrVGZTTTl3WW0rUVYwRVBOVUpOSENBaTZNUlhZQXVpOUZTTFNLYm1UamUw?=
 =?utf-8?B?ZTQvNEVPVHIxZVN5M3U0VzNhK05WV3NwWmk3OEhmaGlDWmw4SERieHFGVUpq?=
 =?utf-8?B?NDBDZHBTeUNzcjI0Z3pXSGYrSWIwQkZtU2kxTUIwUURuSmFKY3lyZjNNYURZ?=
 =?utf-8?B?Wit6eVpYa0k1a24vWnVha1c4Vi9GcllpclZZNm54endxcGROL3JmNFU0V0VD?=
 =?utf-8?B?cEt2clQxWjg0RThvRnB5UmZWSE1NcWxUM3lHdDlCcENCRUREeEZ5c0VBbnYx?=
 =?utf-8?B?YmdHUi9qRmRNeXBibHhXRmtiMm5CelNVUy9pYlM1Q0FyZWltbkJCOW5IY3FD?=
 =?utf-8?B?M0JFSTZ2VlR1d0ZFbEVzZFBWK0tMWW9LU0I3djJqR0VtTjNVbGRtUllnOHlD?=
 =?utf-8?B?R3lma0lYdmE5b1JpN0wrRHQ4a1FwRGdNc2pwVnF4cGgreG1taDRPeEtieDBS?=
 =?utf-8?B?b2ZEbi9pc3hkNU9zekt3SVBRdkU4bG1EdStsOGg3ekFKL1UrUFZzZHJxQm9N?=
 =?utf-8?B?c0FUTm5TR0hiMklzSlU5b2hZWFBZR2RpeWVmV3Y2aHkvVXpYVnBNaVpvcXE5?=
 =?utf-8?B?QUd5S0xqVzh2TGNsWExpa3E1L1pTZnhqdkpwTmhCeEhzL0tGK0JzcmxRcEdL?=
 =?utf-8?B?M1AvN2VYaTR3VTlNQ215eFBnWUNiRXlPZDlwVXZEZ081VHNWd1J0UGRROFVl?=
 =?utf-8?B?MkF2ZzVSTXY0dTE3LzFoTDhjS1VTbExheUZaZlY5K0V6bkkwS0ZZbi9ZR1Bi?=
 =?utf-8?B?RmhXR0dnNFgwRUNTM1Z4SlRIbVpMWldoUnVMVlNQenh0aHJvQm15eTk3Q2ZJ?=
 =?utf-8?B?S1N1RmN2YVZBKzR4Yk45TlVsa0YwajAxaWdjNmkveWlGMzFJNVdSMjYyOUNN?=
 =?utf-8?B?N3dJSHc2cVNKUllpOEVYWG1nQkd3PT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a97e24ab-9a90-4bf5-7e8c-08d9a09ca142
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 20:41:23.4758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lyilXXxYjqE/ENqVw3ypw+FyNW3Vy5rwtj+3RojKoFvYQtOXAIYOAcF3Svk0bw7UB8Jjb6f4kVFlYN2dOWBUGcx22yfA/J2AatTzyqLk9ZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR10MB3041
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10159 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111050112
X-Proofpoint-GUID: l31QL-0wViEusr8b3_RGBrjE3WPNWJZO
X-Proofpoint-ORIG-GUID: l31QL-0wViEusr8b3_RGBrjE3WPNWJZO


On 11/4/21 1:59 PM, Dongli Zhang wrote:
> Hi Boris,
>
> On 11/1/21 10:34 AM, Boris Ostrovsky wrote:
>> On 10/27/21 9:25 PM, Dongli Zhang wrote:
>>> The sched_clock() can be used very early since
>>> commit 857baa87b642 ("sched/clock: Enable sched clock early"). In addition,
>>> with commit 38669ba205d1 ("x86/xen/time: Output xen sched_clock time from
>>> 0"), kdump kernel in Xen HVM guest may panic at very early stage when
>>> accessing &__this_cpu_read(xen_vcpu)->time as in below:
>>>
>>> setup_arch()
>>>    -> init_hypervisor_platform()
>>>        -> x86_init.hyper.init_platform = xen_hvm_guest_init()
>>>            -> xen_hvm_init_time_ops()
>>>                -> xen_clocksource_read()
>>>                    -> src = &__this_cpu_read(xen_vcpu)->time;
>>>
>>> This is because Xen HVM supports at most MAX_VIRT_CPUS=32 'vcpu_info'
>>> embedded inside 'shared_info' during early stage until xen_vcpu_setup() is
>>> used to allocate/relocate 'vcpu_info' for boot cpu at arbitrary address.
>>>
>>> However, when Xen HVM guest panic on vcpu >= 32, since
>>> xen_vcpu_info_reset(0) would set per_cpu(xen_vcpu, cpu) = NULL when
>>> vcpu >= 32, xen_clocksource_read() on vcpu >= 32 would panic.
>>>
>>> This patch delays xen_hvm_init_time_ops() to later in
>>> xen_hvm_smp_prepare_boot_cpu() after the 'vcpu_info' for boot vcpu is
>>> registered when the boot vcpu is >= 32.
>>>
>>> Another option is to always delay xen_hvm_init_time_ops() for any vcpus
>>> (including vcpu=0). Since to delay xen_hvm_init_time_ops() may lead to
>>> clock backward issue,
>>
>> This is referring to
>> https://lists.xenproject.org/archives/html/xen-devel/2021-10/msg01516.html I
>> assume?
> No.
>
> So far there are clock forward (e.g., from 0 to 65345) issue and clock backward
> issue (e.g., from 2.432 to 0).
>
> The clock forward issue can be resolved by above link to enforce clock update
> during vcpu info registration. However, so far I am only able to reproduce clock
> forward when "taskset -c 33 echo c > /proc/sysrq-trigger".
>
> That is, I am not able to see any clock forward drift during regular boot (on
> CPU=0), without the fix at hypervisor side.
>
> The clock backward issue is because the native clock source is used if we delay
> the initialization of xen clock source. We will see a backward when the source
> is switched from native to xen.
>
>>
>>>    it is preferred to avoid that for regular boot (The
>>> pv_sched_clock=native_sched_clock() is used at the very beginning until
>>> xen_sched_clock() is registered). That requires to adjust
>>> xen_sched_clock_offset. That's why we only delay xen_hvm_init_time_ops()
>>> for vcpu>=32.
>>
>> We delay only on VCPU>=32 because we want to avoid the clock going backwards due
>> to hypervisor problem pointed to be the link above, not because we need to
>> adjust xen_sched_clock_offset (which we could if we wanted).
> I will add that.
>
> Just to clarify that so far I am not able to reproduce the clock backward issue
> during regular boot (on CPU=0), when the fix is not available at hypervisor side.


FTR, Dongli and I had a chat and he is going to provide another version of the patch where time initialization is deferred for all vcpus.



-boris



