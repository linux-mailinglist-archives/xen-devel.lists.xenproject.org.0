Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C9E300B45
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 19:31:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.73030.131652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l31Cw-0006CO-IV; Fri, 22 Jan 2021 18:30:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73030.131652; Fri, 22 Jan 2021 18:30:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l31Cw-0006Bz-Eo; Fri, 22 Jan 2021 18:30:54 +0000
Received: by outflank-mailman (input) for mailman id 73030;
 Fri, 22 Jan 2021 18:30:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1HJv=GZ=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1l31Cv-0006Bu-9L
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 18:30:53 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 38267071-8db4-4640-af63-c0dcee407a48;
 Fri, 22 Jan 2021 18:30:52 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10MIP2TD183535;
 Fri, 22 Jan 2021 18:30:46 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 3668qrnh3n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Jan 2021 18:30:46 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10MIQ6X3036139;
 Fri, 22 Jan 2021 18:28:46 GMT
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2059.outbound.protection.outlook.com [104.47.37.59])
 by aserp3020.oracle.com with ESMTP id 3668rj02a2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Jan 2021 18:28:46 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by BYAPR10MB3573.namprd10.prod.outlook.com (2603:10b6:a03:11e::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Fri, 22 Jan
 2021 18:28:44 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::fcc2:62e8:e4e1:b4cb]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::fcc2:62e8:e4e1:b4cb%5]) with mapi id 15.20.3784.015; Fri, 22 Jan 2021
 18:28:44 +0000
Received: from [10.74.97.144] (138.3.200.16) by
 DM5PR07CA0070.namprd07.prod.outlook.com (2603:10b6:4:ad::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.12 via Frontend Transport; Fri, 22 Jan 2021 18:28:41 +0000
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
X-Inumbo-ID: 38267071-8db4-4640-af63-c0dcee407a48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=8p6jx3tEiOYxXxj0F+2LPY38wrFx35eLXL6ZT/xY0TE=;
 b=GW6VhpoxsRevIZwGL/ZNGyWiJM9NSJYDd2VuECFAVObxNUmEzOhszCoTLtGR2Jc5zCV6
 euZDKdLGCQa+C95OfCnScyaLxns16ZjcjlpKOmLH18jOa2JqHR7ccybtOGtjxhxLNk+Z
 W+fwlJYZlvLbMX+4LG4Z61w1eHb2h3Q7zj7ZHRy7hyYT4Omg18mls6lqNej7IhJVvkpw
 yCr/YjUrDlOQubaEGg9cunF+HBL6X4KKHyBslH3Pe2nhfET/TRUdQ+jhCIby6fLLQ6hg
 5Qk+u+beJ8Beg4AN7IijizxTrhDm2RNWYY4kjKJmdZBqpElBfF319T7NEFqP1jdwcVks Uw== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AGkwXs6bpleyITky9cQ2aNTac/y+t6FAek9NBVVYcLF+1ixoAOihZr0+8fwboW+kn2DPlNNxBplYQUCs+9BAbTTO9iqnfYg/YtZcmnR9T1w9fihT44Am5ej48DrrfA1+W3BO9BJ3IiOc1AhBJa7UDmE9Eyk1JjL9LbwhNQwxRCn8tksSWD1y32sEnjRG8obotszXxlx37UCzbPehFGwcwUtGP72IrJtzIp4bYNAi2UFn2CVqadN6EFYoTNckMP6yNwLiCiRm5WDArokj8jI3cNsUnGfCTgqPJNvYmUST2/hCn62YtJYW6t/snpJDkBi6tUKJOasLBmgOcLsmDaqzEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8p6jx3tEiOYxXxj0F+2LPY38wrFx35eLXL6ZT/xY0TE=;
 b=hRsZeM9UR6TquLGLvXM4pbklIK9H8Yau6dw+8FrVJEKL+xjrATwm1eNNDY0MAcWWk/Cjh9QgatvUsjsLg/k1kF1TQdrqDGB+Ua3bkol8piLvR12Pl7iffvd1W27zQRb7HzTC5SZ+mV/QK1c/M4Vho2B0wC+b9OzFIjovP7+2UCfqmwA2CeSIam5GOh5Eez9N1anAJHj9bm7ZWduOL6V5mzos96wXp6MzGGgkuE2oy21coTSrw7oWE8pngoppR+yd8VwF4K/OuyK1kyFDiaySVgQfyvo8MVJR7Fyl5POXbQNxrEI3PWM+Uuga04iGh8Q5L0v1OzrjEKKenVqUXprqPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8p6jx3tEiOYxXxj0F+2LPY38wrFx35eLXL6ZT/xY0TE=;
 b=tzuRnKkc0Vd00eOwV+aXQusaNzswiBijbiINBCu0eFTLWFptvf6EprdQ78GRo71AlvlAKqlfQBa3Borwzi3HSVej+Wik0Ys4MvJMD0BL5hYbroolR9+KW3CRQKG+1Nt1t+xmTjPGVHJiOIZ4g9zL84PagA2uqK0ETh5U/1W7/Vs=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH v2 1/4] xl: Add support for ignore_msrs option
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org, wl@xen.org, anthony.perard@citrix.com,
        jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
        jun.nakajima@intel.com, kevin.tian@intel.com
References: <1611182952-9941-1-git-send-email-boris.ostrovsky@oracle.com>
 <1611182952-9941-2-git-send-email-boris.ostrovsky@oracle.com>
 <edc67950-7d8f-5551-23c6-7b4a398ec9cf@xen.org>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <189bbbab-e3c6-c7d4-84af-63e568f23dd3@oracle.com>
Date: Fri, 22 Jan 2021 13:28:38 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
In-Reply-To: <edc67950-7d8f-5551-23c6-7b4a398ec9cf@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [138.3.200.16]
X-ClientProxiedBy: DM5PR07CA0070.namprd07.prod.outlook.com
 (2603:10b6:4:ad::35) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6213774c-c59f-438b-dd78-08d8bf038cbd
X-MS-TrafficTypeDiagnostic: BYAPR10MB3573:
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB35737EE0C901FCF2F71DD5DD8AA09@BYAPR10MB3573.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3WPRDR7S/6vLKsaBmBguZHXoUZUqrWUphJc7XwyPGCEO3nxETTjdQqGc/I2qy0rvySh2qIMX8kLsWSwyqFrzbR1nJUHGcbcQ1YdyCJ0b9l7iF/3EL3q7mHwoUrwwini2HglG6kY7/ToizyxZbgB8CXaLVF2MU918isJGPIvYG3nVHyXRu8C2/e7MTcZxDTRBOsPFyQzi0SrYp/MorK+tVFcGT99RcrfynudcEdwIa5R5Sxg3scmMgIiL21sqX9Mh4BjdKcAiQfRS3e3IVa5BMRPtH2od0v8cjvnFfUVIOlTxZu0+WTM/mVWq9ASLDLu163q5zlkYrs1OazJZn0zdmwxal5QIdqxxXMeSaQUlg95kcmrcWygWUHAOMKGP8C8/ybX86xk09cJVte769F8CcWgM3Uf3TECTz210skWKLbSrdAFbPRpavp+YAEgyC+1rLSpmggfnpUpmR5UH24IOeY0rHIHX4BTDN2xEXeDBUNn+uhFwwy/6O4zt6Mq0lHDwjrYeet3iuxjB/4zVQD1aYqJ4tFU3XdvmJuLnvFJ5oXF1UQD3sT0X0YaOHO5oxa9w
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(66556008)(31686004)(186003)(66476007)(66946007)(6486002)(7416002)(36756003)(16576012)(26005)(83380400001)(86362001)(6666004)(498600001)(2616005)(44832011)(31696002)(8676002)(956004)(8936002)(5660300002)(53546011)(45080400002)(4326008)(16526019)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?MGM4ejRNZ0N4U1Z1MUkwUkdVeU9kZElkVTQ2WHFjc1NrQkR3Mk02eFpuN0Z4?=
 =?utf-8?B?bUNJTUFVU1R4emFuTDhwVm9uMXdLem13NUpEMmt3enNEOWRzZG9yUHdsWXVC?=
 =?utf-8?B?QkRLYTd6RzUrUGhZTlBDVnNrc2IyQmxIbExMR1VjM3lldXFqOHZRM1Y1ajFi?=
 =?utf-8?B?a3FtMkU1eXJaOHU4aXpZM1RnNnlHQlAwQnFtTUgrNzVrQ0lQUnJzMmphaHZr?=
 =?utf-8?B?QzlhMTlXSGtDOU0ySFM2UCtrT2h5OEtvRmRCVzJWUGlqNTlhbm5iMnY3K1pn?=
 =?utf-8?B?c2lYSTVrWVdzNzZEdVVsQmI3dzQzaUlFQVhMVmZrL2hLUll5ek8yYlJ5M2dC?=
 =?utf-8?B?elh2WGdycXFMNTcvZUtFWGZEMXJPcTk0S2xWNDJCdGZ3Y0dydHJGeUZCZkk1?=
 =?utf-8?B?TStQTG1mVnhXS0w2aDdIaCt3QWhpeVpOWHZHRG9Dd0JCc1VUME5saFdyVmVP?=
 =?utf-8?B?TE9XRC8vZEpwbVdtMDFaSEUyeVFTL081bElCR0RHQWxjNFYvRWNqMGZpeGtn?=
 =?utf-8?B?b2ovRmlwckR5RUVvY3NYd2pISVRKUisycGlja1JmcnBIZlNtRUN1dzNNb0k0?=
 =?utf-8?B?bUdBTzdqV0JVc1Ywdkppekl1cXB0UGc1cEpjYUNNSm15Z2ZnV1puaEtrWmdu?=
 =?utf-8?B?cWFrNEtqMUttdVovNUdvRWtGaE0xMlFlaG4vU051VTNzVmNsV1o0L054dkJt?=
 =?utf-8?B?VDBqbU9ZdnAxck5FcGZWa2t5Qk52emJHc3hPaWpTRmhWaWZQVEgreGFsbTV2?=
 =?utf-8?B?SFNxZWNRbkhwdFl6amZBeFhFb0NROWFRenMzaFZvY3hCYVc0djZMTGU0OWto?=
 =?utf-8?B?ejJoK1FvcVRNL2ZyN0pUeDZIUWdLYzlDU3hkL1dVSEd3VmVkR3ZIYnVLQWJk?=
 =?utf-8?B?cHRQZy9mVitpSmM5ZE1hZzhuRlNWVjdQeTNPMElBT1ovY0s3bXhQNWNxdlpr?=
 =?utf-8?B?NDIxRWwvSFRlY3Q1SmhzQkRudEdBdU5XVnRjamxOZzBJYkROZWk3WlJKeEtF?=
 =?utf-8?B?ZTlNUVlDSWdXN2t5SGFvVWFXZko4V3puemEzRDc0aU0vUlBHZDQrWE5LSjJ4?=
 =?utf-8?B?QnduUXI4eUh3THBqQjRLZndGMldmSmdRbG91MkVOQ2RXNU42RXNkaTk0RVk0?=
 =?utf-8?B?SzJEUDhRYkkwMDlwMFRPQ0crUEJIMkVEa2xRYmMzRnd3eEhad3N2S3NEQ1pS?=
 =?utf-8?B?R3dZdWxVbU55SXR5eHh3czZjYUo2OGcyQmp5MlJjRDlLQlNpVlpPdXRtSHBW?=
 =?utf-8?B?cmxSdFJFVmV1YW10dlhNSVhhK2tXeFFsMzZCaCt0VSs1RUlmOC8raGJHQ0da?=
 =?utf-8?Q?Xei4kBEhjZ2KDjmg2MpF4emM4jcCnPw8Pe?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6213774c-c59f-438b-dd78-08d8bf038cbd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 18:28:44.4143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AQVA9mW4b6hSde7a0CinkUNNq329oi2XyiKrMJZrwjZbdn1VDkNitG9GBo8l0oDp+/lT45F4Kpgyw4kj45FgFN1PntHRGi76JZn4M3lUolM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3573
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9872 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101220095
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9872 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101220095



On 1/22/21 4:52 AM, Julien Grall wrote:
> Hi Boris,
> 
> On 20/01/2021 22:49, Boris Ostrovsky wrote:
>> This option allows guest administrator specify what should happen when
>> guest accesses an MSR which is not explicitly emulated by the hypervisor.
>>
>> Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
>> ---
>>   docs/man/xl.cfg.5.pod.in         | 20 +++++++++++++++++++-
>>   tools/libs/light/libxl_types.idl |  7 +++++++
>>   tools/xl/xl_parse.c              |  7 +++++++
>>   3 files changed, 33 insertions(+), 1 deletion(-)
>>
>> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
>> index c8e017f950de..96ce97c42cab 100644
>> --- a/docs/man/xl.cfg.5.pod.in
>> +++ b/docs/man/xl.cfg.5.pod.in
>> @@ -2044,7 +2044,25 @@ Do not provide a VM generation ID.
>>   See also "Virtual Machine Generation ID" by Microsoft:
>>   L<https://docs.microsoft.com/en-us/windows/win32/hyperv_v2/virtual-machine-generation-identifier>
>>   -=back
>> +=over
>> +
>> +=item B<ignore_msrs="STRING">
>> +
>> +Determine hypervisor behavior on accesses to MSRs that are not emulated by the hypervisor.
> 
> The description of the feature looks very x86 focus. Yet, it seems to be defined as a generic one.
> 
> Could you clarify whether this is intended to be re-usable by other architectures?


x86 only. I'll add appropriate note.


-boris

