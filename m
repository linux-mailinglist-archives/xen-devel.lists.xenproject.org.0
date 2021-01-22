Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC753300BE4
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 19:59:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.73066.131743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l31de-0000RQ-4m; Fri, 22 Jan 2021 18:58:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73066.131743; Fri, 22 Jan 2021 18:58:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l31de-0000R5-11; Fri, 22 Jan 2021 18:58:30 +0000
Received: by outflank-mailman (input) for mailman id 73066;
 Fri, 22 Jan 2021 18:58:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1HJv=GZ=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1l31dc-0000R0-3H
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 18:58:28 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 79481714-6300-47b6-b0c4-a3cf81c27fe0;
 Fri, 22 Jan 2021 18:58:27 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10MIt4U9049664;
 Fri, 22 Jan 2021 18:58:24 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 3668qrnmmq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Jan 2021 18:58:23 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10MIu7MS136654;
 Fri, 22 Jan 2021 18:56:23 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
 by aserp3020.oracle.com with ESMTP id 3668rj103g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Jan 2021 18:56:23 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by BY5PR10MB4307.namprd10.prod.outlook.com (2603:10b6:a03:212::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Fri, 22 Jan
 2021 18:56:21 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::fcc2:62e8:e4e1:b4cb]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::fcc2:62e8:e4e1:b4cb%5]) with mapi id 15.20.3784.015; Fri, 22 Jan 2021
 18:56:21 +0000
Received: from [10.74.97.144] (138.3.200.16) by
 DM6PR06CA0045.namprd06.prod.outlook.com (2603:10b6:5:54::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Fri, 22 Jan 2021 18:56:19 +0000
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
X-Inumbo-ID: 79481714-6300-47b6-b0c4-a3cf81c27fe0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=3NFD80d7V8OSamYp2NqMvW7r9mgSNNKXjACE6woBRPk=;
 b=AWsunrHY2Ely5kOH2OdrdfloTRqhgn5S6yVGu2yvUlN/usPP75qRBWLOZTBAT8B7FsGC
 XI7e+v+N/c95Ppj33KyVskXWCq2jy5zQjE3dbqsYRkIbhA20jo/Rx37SoNkjchDUFizc
 M9SJxfHmwGgz/09KQKD1asuIHh5065RxHsXt2rtigg2BeVOE5/K9wCdG90A/xWTbBllU
 RDe3sOk3/z/j8wfzsg2eJYEwKL63SYymInjtmfGGrojMCQMUAb8h85UIxu+Xc6o2FI79
 8jzFBcjqtHs6rJgaZmCfZY/KwSMiyD4ekvLzfYzoZsdw1wTEpr4nZDr2AafYaUh+p4QD kg== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y5F+uhfrNCzT39lageLsOZLJJp7kPI2VDjhUda4HQpRTmJEd3/i+z3TERKUrfBnMERwckV8eDZG61TkUrrTX2Bl0q/coQoddT3A3on80XZ9JHc/4e5bi3YAc7xIIF3AAozD8OdFTOEUsjSp8ViSLgU5Zc+oPZIPpaJ1qO4GHkWaQ5qedSSrp+QfyB5XOreyBYPMXe+eqJSfk/0iGwLf7Asrp/VFWDGvtgLOdhcLLqAWi2FkrGTv9L0OdQDE4VBARRBYDrr+velxUpL6xtAvlnmpQCZD9AngH1laq7kObKgs1Ch0KW9MARlQPEExGtZWFpSOU7vUoEbm/lWTGonrh+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3NFD80d7V8OSamYp2NqMvW7r9mgSNNKXjACE6woBRPk=;
 b=FuBdhdGIm3mRna5hKvVF/6SQKuML1ybueVp/G9TxCGQJSsbP49FE6+52NlqXhvKclA1rPBokQ344cQx1owpdQgIkDGqHtmpwsLHiP+wPW28rIExDBO8nrpXOPGYYlKYu5kCdhlKksBiAYyQCWO3ArJUBGGaqDpSRiI1A27sTu1o6sf4Q7rsizD+rtBrRvbxF5tSdkTxiClILnztiRkskoyhTTWglS5zAGc0bS5NG+WzBfCgH8ARkKlFncinzvTjSrLUmuFo/OM+J+bkQLt1b15FIhFDgXYnrf4EFBzcxXc2dBiW7Oosf/ejh5XUn8rC0FmbYqRQh2g+zbrFdmq9g8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3NFD80d7V8OSamYp2NqMvW7r9mgSNNKXjACE6woBRPk=;
 b=Nlk49JVbBVCRjvpazeqW5+VtNftzg8C6BTv8oaQCRyxfYcaXqV46XQzr24vkeQVtl62ZGT/qX4gpgEBTSt3uc/f0g1TRtGtpMycsFpSeTO8J3qwMsRobAb+nUXzuuuHX4GdIwJJV87U4Dbd6zFBEqmRX9M9HvXY2UPFiUIA0o2o=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=oracle.com;
Subject: Re: [PATCH v2 2/4] x86: Introduce MSR_UNHANDLED
To: Jan Beulich <jbeulich@suse.com>, andrew.cooper3@citrix.com
Cc: iwj@xenproject.org, wl@xen.org, anthony.perard@citrix.com,
        roger.pau@citrix.com, jun.nakajima@intel.com, kevin.tian@intel.com,
        xen-devel@lists.xenproject.org
References: <1611182952-9941-1-git-send-email-boris.ostrovsky@oracle.com>
 <1611182952-9941-3-git-send-email-boris.ostrovsky@oracle.com>
 <ba472bc6-a4e4-2e94-6388-0f9bf8eef3b3@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <f32499e1-ae38-758f-6ca3-f58a3f7d3418@oracle.com>
Date: Fri, 22 Jan 2021 13:56:15 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
In-Reply-To: <ba472bc6-a4e4-2e94-6388-0f9bf8eef3b3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [138.3.200.16]
X-ClientProxiedBy: DM6PR06CA0045.namprd06.prod.outlook.com
 (2603:10b6:5:54::22) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7552a161-7475-4892-f483-08d8bf076897
X-MS-TrafficTypeDiagnostic: BY5PR10MB4307:
X-Microsoft-Antispam-PRVS: 
	<BY5PR10MB43077BB86290F00EE43F7B8D8AA09@BY5PR10MB4307.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/zDtfq35tFh/ah/3ujEyInU5KJ2fzOMMLoqBJ9Epr4XzAchoQegDSpQ4zhApqsqFoQmOm937CukIrYxgqEJCqnEuUVBsGkJTuBAyDtLm+N2bWivIW2JGb9WyaiGkUKt5Sa50yBzwoHuFjN7xUqW/B8WLDjJ9KZ+KZVGRDnyIoWXYtiEeMIJg+pSFeOI3/mnx6AfTU+H8zW89E9l2nO9teta/Rq8Hc/OmrsdtJszOg/tgiq2mo9k0Zg9N2LUxQeTiZES1HRmPxe6kOaHsETrtfur06GTrb8OvmLInK68UcXrx/LF/4CzsACJosFYOaj80PHuBAxVyS9qGHQL2k4/R2DTloQHGgv5upF77h5nDEkV9oOwgEQG9sL7SXOAuMSmpiHSEYCs8vZBUmRkTS0NhbUz2l5VlZeP7bGM33OQRg/KMnjhQkywWxyd07f7YDv1VUewJNzX7jgBlK1+JToVIAiR1rtyd1Jo+VqTFiZwjVEc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(346002)(39860400002)(136003)(366004)(31686004)(2906002)(86362001)(66556008)(31696002)(6486002)(66946007)(5660300002)(66476007)(16526019)(2616005)(83380400001)(316002)(956004)(8936002)(44832011)(4326008)(6666004)(478600001)(8676002)(53546011)(36756003)(16576012)(186003)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?QlV1M25sQjI2NnJQRnFuK1hhSGRIRXhNeVZqenhtaU82UlM4aEpaQnJRTTVr?=
 =?utf-8?B?ZHVKWTNYYUs4ZTUwQVNRamNXNnJtVkJzTkZhSWxhWTlKcGRiV1Z1WVdjVzBo?=
 =?utf-8?B?MlRuWjg3WWZORTFjZW45QW9SYld4TWlodWFUcnJLN0x2dmpxdGlQekVnSDRQ?=
 =?utf-8?B?bFFFdjdlTk8vbmZJeEVGT01OWUk1TGJuUE1OVVRvTVN0RjduYXRHUDR0ME96?=
 =?utf-8?B?R1pyNmxGUWljKytUSzRrdytUd3VtYTBaMDlNMitPNmdWWnJOaDZCSXhUNlFn?=
 =?utf-8?B?ay8zWnNtU1NxU0Y2SGI3VnF5VzA2b3NETGp5dVdzYXB2UW1mTitXclpEUVZm?=
 =?utf-8?B?bFZlYjdaUFgzVHhHNklRU0dGNFVUZ1hNZkwxVUYrYldwRzF2eGVZV0l6QWtn?=
 =?utf-8?B?bzA2cFlXZWRZL0ZuTnpFbURtQ3VsejRTd1REbnFSaU04OVpqMHlhTTg4cUZO?=
 =?utf-8?B?TGhRVDZOYk1YYTJYWGhXVHMyS2RjNnl2L0pMWU50bEQ0Y0N3QmNmVDk3RVEr?=
 =?utf-8?B?TmlJcFZFZW1kU3d0dnhCd1BUUVh5ZWhONDVjejlhdFhuZ2w2Qm1CM21IR0do?=
 =?utf-8?B?bzFqUm1GdWJJS0s2MXYrMDd2MFVQbUVMVUJOWWlVVm9zMnVUMnJKMVVCOGhh?=
 =?utf-8?B?TlUyd0Vrd2t1dEhYRUluVmJEYWZJbjI3YkxmdmQrQ1hoMW1SRzN1U0xIUnI3?=
 =?utf-8?B?dDYwdGpzMWVqYTJLN2FVcnBlYkZnaWpLN1JsNDFiK1pOUGxmSEx2ZlgxNUtV?=
 =?utf-8?B?WW4rNHV5d0c0Z3dMdDFBMjZjV1VRVnpSYTk1eVhpMVZjWnU5QWJ2MXY4ZUMz?=
 =?utf-8?B?dUVyLzlhaGZWZ21jTitibEV6dkkxVmh6MTlKUmp3NmkzVzN2eTMwdEdHS2l4?=
 =?utf-8?B?SXpPV3NMUGxReFphYm05TWNvVTBMblJqRGJlNXo0SE0rRnJPWXladHRGSVBP?=
 =?utf-8?B?ajlEZHpIdnJxMi9zZ01JNjdBaUpTM2pCa2pVZUx1WWlqK2s3UGtURTkyMHc3?=
 =?utf-8?B?YUkxeUZaZEEzamp6MVFZbDZ5Y21lOGRMOTdPV0tNSWczbThXdU9TcmVsK0FF?=
 =?utf-8?B?dERLYm4rM1M0ZkNHOUdPcFd3TzJJOHcwOTBVdVNETSsrdGxhc0g4dGxrUTBN?=
 =?utf-8?B?bTBZUUlaMlNuM0FXeE9pa0w3N1hJMTZKMElNTWdraDZMdklqYldWRXVUdG9M?=
 =?utf-8?B?UXF6U0l5WEJOdDltY3FMdWx2ekZNRGtCSXZiejhHcEFsN0xvSzhmOXhXQldh?=
 =?utf-8?B?SnErUTRrUFEwU09jWm4raVhHeGlzMWt6aWpPVWIxMDMrdVh0WFdxbUdYL0hT?=
 =?utf-8?Q?ZhPNxdTPUx06i8DOUslxEHqdMVHOve/GCf?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7552a161-7475-4892-f483-08d8bf076897
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 18:56:21.6068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z3IkeFdhgny8sTfmoqf2/s7Urn5Ym8FctWrlvqCIaKYXDc0qM+oS6kbPLZ0+Lg707YhQbRJ1bd1bTuo9yEvVDE3zfiXspR4xoYmTjkomT0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4307
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9872 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101220097
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9872 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101220097



On 1/22/21 6:51 AM, Jan Beulich wrote:
> On 20.01.2021 23:49, Boris Ostrovsky wrote:
>> --- a/xen/arch/x86/msr.c
>> +++ b/xen/arch/x86/msr.c
>> @@ -295,7 +295,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>>          }
>>  
>>          /* Fallthrough. */
>> -    case 0x40000200 ... 0x400002ff:
>> +    case 0x40000200 ... 0x400002fe:
>>          ret = guest_rdmsr_xen(v, msr, val);
>>          break;
>>  
>> @@ -514,7 +514,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
>>          }
>>  
>>          /* Fallthrough. */
>> -    case 0x40000200 ... 0x400002ff:
>> +    case 0x40000200 ... 0x400002fe:
>>          ret = guest_wrmsr_xen(v, msr, val);
>>          break;
> 
> For both of these, we need some kind of connection to
> MSR_UNHANDLED. Could be a BUILD_BUG_ON() or an explicit
> "case MSR_UNHANDLED:" (preventing someone "correcting" the
> apparent mistake) or yet something else.


I actually meant to add a comment there but forgot.

I'll add an explicit 'case'.


> 
>> --- a/xen/include/xen/lib/x86/msr.h
>> +++ b/xen/include/xen/lib/x86/msr.h
>> @@ -2,8 +2,21 @@
>>  #ifndef XEN_LIB_X86_MSR_H
>>  #define XEN_LIB_X86_MSR_H
>>  
>> +/*
>> + * Behavior on accesses to MSRs that are not handled by emulation:
>> + *  0 = return #GP, warning emitted
>> + *  1 = read as 0, writes are dropped, no warning
>> + *  2 = read as 0, writes are dropped, warning emitted
>> + */
>> +#define MSR_UNHANDLED_NEVER     0
>> +#define MSR_UNHANDLED_SILENT    1
>> +#define MSR_UNHANDLED_VERBOSE   2
>> +
>> +/* MSR that is not explicitly processed by emulation */
>> +#define MSR_UNHANDLED           0x400002ff
> 
> MSR indexes as well as definitions for MSR contents generally
> live in asm-x86/msr-index.h. I think it would be better for
> the above to also go there.
> 


I didn't put it there because I felt that file is for "real" (including hypervisor range) MSRs. But I can move it to msr-index.h


-boris

