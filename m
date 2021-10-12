Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9365342A8BA
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 17:44:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207466.363316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maJwx-0004jl-6H; Tue, 12 Oct 2021 15:44:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207466.363316; Tue, 12 Oct 2021 15:44:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maJwx-0004gw-33; Tue, 12 Oct 2021 15:44:19 +0000
Received: by outflank-mailman (input) for mailman id 207466;
 Tue, 12 Oct 2021 15:44:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kpIn=PA=oracle.com=dongli.zhang@srs-us1.protection.inumbo.net>)
 id 1maJwv-0004gk-6D
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 15:44:17 +0000
Received: from mx0b-00069f02.pphosted.com (unknown [205.220.177.32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2679334d-1065-4d87-b338-34641e2aaef2;
 Tue, 12 Oct 2021 15:44:14 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19CFW4QX032370; 
 Tue, 12 Oct 2021 15:44:12 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bmtmk77jk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Oct 2021 15:44:11 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19CFf569128538;
 Tue, 12 Oct 2021 15:43:12 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
 by userp3030.oracle.com with ESMTP id 3bkyv93my4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Oct 2021 15:43:12 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BY5PR10MB4067.namprd10.prod.outlook.com (2603:10b6:a03:1b4::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Tue, 12 Oct
 2021 15:43:08 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::2848:63dc:b87:8021]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::2848:63dc:b87:8021%7]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 15:43:08 +0000
Received: from [IPv6:2606:b400:400:7446:8000::222] (2606:b400:8301:1010::16aa)
 by SN6PR01CA0015.prod.exchangelabs.com (2603:10b6:805:b6::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.19 via Frontend Transport; Tue, 12 Oct 2021 15:43:07 +0000
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
X-Inumbo-ID: 2679334d-1065-4d87-b338-34641e2aaef2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=m/j0VXFfTgww0jA+0/BLqc1t2J21ixLL93BdHs9cfMQ=;
 b=CHHYkxVWr/oXjgxdxVSTETffZvhynU2uZzjHOt6WnnAwCG6cjsplxP160SX+sP5hpJWS
 ysXjUvxOJ1OOG0XdEmT15ocbBydqUzhJ8pSXkJc7GEL8st8GvfIZtnxQ876WnhPs0yfX
 7ki0Bl18IK94KDszklBlpSPGvitB8tYknST4MAleWcq/ZUmytGRc5Y+/ZJK5933LcAzv
 cqgCV48oC7uIYZHjDfMrQ6BIzH3alzfdqpl5obFa7JyFkUU3UJFgCLmJdcTyMHCA0Tpc
 lwOz0v5CrH1ffweieFozfQqp06NniYaffBUoI0c0/vaayjh7sVfjhIDSfvAOvZf7uKNy zA== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ewBsFxHGrnsuqZEMCGnn/FsgYpCdCMpkiqu2VvW0mrHlyv/rIQEbfXvI2IgqEYvnvmUej7Ki9dzvx7mDflKfeRWwDLoC7Fu+F/js2royQKdA6awtM3Qj6/aO8tTBxHfwFCB1Oq+PDLooD7EdwkFfi9uXzra2b65kZSrecx+F0ip9LZgCAcRzw+PUvCi2Jvi3fEjpkZYswedfxIJXS/U5j541CliqFbfzIRrJphzAj1RboOo7AZ9w48ONfKUprI2ITxwqoYSWsHSfMVmNjX85I+bno3g7ede6MeVQFdrjSvEy5H+UyPag/mfrh/f0BAi9nY0Ac5YktvDUh0+4VM33nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/j0VXFfTgww0jA+0/BLqc1t2J21ixLL93BdHs9cfMQ=;
 b=HKngeEmtIzGcda+mWkQSGzumFmSZfie+ok8iJAXDZkL5VfC1VUgOmsnPQBwptwgpqbsU02pBJVDnPNx+UDEEWdHTqA8w5kIWN24SEuMQ6Lugwf+m0AjzCvLD4E4bZ/V+ZT5UAh1eDBZuLlTJphff5IwvJ2WzW5rFVMDwiodv+hZxuYM3vEacDJ9DMpABWKKEsxkKsvbHEjIpnefNXnHt79xiphCJ6Wc+BjkO2i5VUFy1sAvgKKWN7mQZx7TE3IOM18jSRCfONEnctS6b2wVh3G19wLWfoT/RW9Je5TuActY1rrHMxn3yiKt10j9UBTb/a8EyWzWB6GlA19QpTzAGUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/j0VXFfTgww0jA+0/BLqc1t2J21ixLL93BdHs9cfMQ=;
 b=jsIWyTR7vj2cG4ibygMXgdhAdz83fTeYa455pU8axftkJnb3FBBALOdT54c5oNNIAGX47SocsoPAJeVAiJM9M9b5pb9q0wRqnA88NmfAIZhs8Al33QhM7r3Y31iEVgRtsfHgWc0buMy5WAadvjlRg8MdhdYDUJUgxsnrLQQwtCY=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=oracle.com;
Subject: Re: [PATCH xen 2/2] xen: update system time immediately when
 VCPUOP_register_vcpu_info
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, andrew.cooper3@citrix.com,
        george.dunlap@citrix.com, iwj@xenproject.org, julien@xen.org,
        wl@xen.org, joe.jin@oracle.com, xen-devel@lists.xenproject.org
References: <20211012072428.2569-1-dongli.zhang@oracle.com>
 <20211012072428.2569-3-dongli.zhang@oracle.com>
 <317163fa-f736-ccfe-40d4-b918ce2834f9@suse.com>
From: Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <3e16648f-088d-5f62-03d7-ca744e913cbb@oracle.com>
Date: Tue, 12 Oct 2021 08:43:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <317163fa-f736-ccfe-40d4-b918ce2834f9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR01CA0015.prod.exchangelabs.com (2603:10b6:805:b6::28)
 To BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bde8fd7b-ebcb-4fc4-f855-08d98d96fd42
X-MS-TrafficTypeDiagnostic: BY5PR10MB4067:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BY5PR10MB40676BA466484BC620E6C091F0B69@BY5PR10MB4067.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zMHKwmYjZ53Q1TBZjB7XS8zN9bkyvKJoliqg5T3Z6u6qC31T9oZ6j6ZDOUkIVYIbv3ZkUg3m7jExa43Q0JkrCxXdNhvY6ZxV+1p+7y4L2Kag5JAEZrilahPFa2A89x/ojDZUbR0WOkh/kXoSM1RAJk5csyOj9n58+oNw5fPopbGU7mZ8z3YQK8tZT12+b7fkA9J3JDEv1LnvSXDZuwnETqQVH5x3gAR5VewGM4KxcJEbAv0OkXBXK8ItKdVtGqIwWZncifJT/PLyktQO6NMvrOHK4w7Ze2Mbejy2g2aivHjZzXu3YJPOUIRPKWSlzdrLU62jTEy9KCk8ZX20pgjyiXDLZo3JE0XvW+Z86p6RRICSChV06pC7XLxmfOY/Fu1MxGnfwnyKd93DK7DvmIYHpCuz69KXXxp/DG3AhKSbrWC2OMTJHkaKnUsEUDpI/ovwtQdsK6aTuBqJK5YptnQRbIm/VqXx4fh2OINxwgfwqBeeD5ozXLcuHCG1JaAGJdlEMycq+i3JGdkpQvcQSHdKgpkuyf1R1+TWdFDPsX/EQ7iLvMsuIkINt+QyoJbf4kURse7sh/OiLNH7WDUK3bQALstqpqrEMaB1Yxe+c92cYksK0gnSzZhZYG+Pa6raIItjCYI2o+OuyQRirOdz0Wkzy8NzQm/PdwWG9uVo6+S9OWfoeP+/F78WOMsTZntaohrk5mM6Q5U+0EjrvdsecUOnEC1Hjk4CCdawTg48++cC77I=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB2663.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(4326008)(8676002)(6486002)(2906002)(31696002)(6916009)(66476007)(36756003)(38100700002)(508600001)(31686004)(66946007)(66556008)(53546011)(44832011)(83380400001)(15650500001)(5660300002)(316002)(8936002)(2616005)(86362001)(14773001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VG45KzJqWW9JRldZbG85Skw5YmVSeExMWmRNeS9LNmNtemEzdmlKTXdaN1p5?=
 =?utf-8?B?OUxmNTBQZ2FOTW9DSmpLM0VpbWtLMkxza09nd1Rsc2NhKzhPR3lwdnc0MFcv?=
 =?utf-8?B?YjJjNjB3cnkzQjdHK0o4ODN2YW01YWtDU2hBUE1mL29YdDcxcy9KdWt3Z29M?=
 =?utf-8?B?NHEwQWpaZ0hiUGtVUTdLOFVLaGRJZjlsOWdjZnc4OHlvNVV0dThxUFd5aGw4?=
 =?utf-8?B?Zi9XMlRLTDRNbjFMUHJndnU0OXdHQ2JMRjVtT2xrMlBMQ1VpbStNRkwvaGtz?=
 =?utf-8?B?VHNBVjNsSEtoalEwUHRlTVJjbHczVHY5bXdaR25TN3dhSzE5UEIrMmRLTFkr?=
 =?utf-8?B?a1BjQmcxN0NoazNxS3ZMNlh0WlV5bElDTUpwQ29OMCt5RGtnNHpac1J1N2tQ?=
 =?utf-8?B?Mzh5RjU4ZFlDTStLM3N0UUhoZHFYcEo0VCtzMlhRYUpCNTRnRHREclBBbHhn?=
 =?utf-8?B?UDVGdjgrcnJvWVZpTGIyd0tCMEx2RUpyRWtlcUtlSWoxQjhjNkd3S21oU1FU?=
 =?utf-8?B?clV1NVhXTndkWHFyam9ib2ZyTmhRS0ZmcHl5WVExOVpoZStLWUJpcEwraTNW?=
 =?utf-8?B?R0JkOXRXSVJZZVVSZ3VHbkxoTFlDM1N1Y3IxK1kxTGJydHBMZVZsdGZFT2JW?=
 =?utf-8?B?TGFleFI4TysyZVhxKzNpRzFSSExTcHFMMWRrTVZlUTk1WkdBemQvNVBOMU85?=
 =?utf-8?B?Sk1sNkF5NlZjaDdCTStUaWRod2JKa2dXQjA1RDZtRFF3SEN5NHF1SUNRaTRs?=
 =?utf-8?B?Umh5RENPOUVHUnk0Ri9WaTdTQlU1TTB5SEJPajBmZXZHRFdocVVxV09TdlBC?=
 =?utf-8?B?d25pKzF3WFYrME5zbG9IRy9uNDZpMytuOGJWWXl1UWllV1F1NmgraVd1RUFI?=
 =?utf-8?B?Q2hlbTdzbWpSdWJhVFdxU2hxUU9sQzRSY3hFZ0d4ZDNpa1h0YXg4U21BODBB?=
 =?utf-8?B?YUtKTVFpRjNFRC9DZ1NUSFV1aTVGWkVkeU1PYjRTbjQrWTkrUXhUNmlTWDBV?=
 =?utf-8?B?RTR5MFV2bGpZOFpoTDFjL3N4ZmlCU25ibWd0SXA0ZEZ6ZVcxdk5aamg5YTds?=
 =?utf-8?B?SW9rak1PaXNDdmdPZ2xoelpFVzZCcnIxaVhUQmkrMGxzU3FZL1J4R3cvREZC?=
 =?utf-8?B?NkpVanUwS2JEeWcvaGVqQ29CR0E0SUJNTFg0YlBIQ2k2MWx3TnRGNkZUeDhv?=
 =?utf-8?B?UjQyYkdza1llOVNrTFBSRTVqMW1KUTRPQWhLa2ZyaWFxN09ublZDaFY3Wkdx?=
 =?utf-8?B?R3FYVHpSd01HbERsMnFlNTJrZW83NjhSa3RudE5aRGtTbE9PTW5BMUJWZFYv?=
 =?utf-8?B?S1VWa0NsdVhHVHR2TnIyRkx0bWpTbytOM2ZFcklERVNSSFFaOGVyeWM1bkhC?=
 =?utf-8?B?eDVLWHdrSUQwKzF1VzNiaDVpUm5Rb2ZTbzFHUTBrdDBvQnNGU3lVckgxbUw5?=
 =?utf-8?B?aHAyN1JqSEZJM0theG5vVGh2NitYblY4SE5wVmtVUFdFT3lreXRrbk55dlkz?=
 =?utf-8?B?R0xjVVR4VjhXRXUzRHlLZG1LVVoxZnUwV2JLRWdwYmc1N3VaYUVOZ1NQektQ?=
 =?utf-8?B?ckRiVlprc2tiZjZKeW9PWFVQYjlRbC9NVmxOQkdqczlUWlNNUit2a21KQjB6?=
 =?utf-8?B?Qk1kTS93bW4vOFBkRFFscnZMeDJEWFBiMDdERE50b1JocXJpSGpwYmVDR2NR?=
 =?utf-8?B?VE9pQ1h0Sy9YcHJqVDlLem5KR2N6cUJVTGlLczBERGQ0QjJuWW1IaEMvYVpM?=
 =?utf-8?B?NVJkNHJDZUlibytXSzZ5L09JaEx1MjR6YTRrc2JrTUt6V04vYnp1RmNhbDhG?=
 =?utf-8?B?NXVVMkRMUmd1ZGRsazVBUT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bde8fd7b-ebcb-4fc4-f855-08d98d96fd42
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 15:43:08.5190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nwtbgyQipsgJNZhqGf1INSSqAgNlIRIq5q6r14s2qvZILRKEgwwMOiqpOI/qvkmkQAXp7AL0/tC2TLbeiHMDEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4067
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10135 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110120087
X-Proofpoint-GUID: 8-uJoARvX78ZNFCCfUbzOzbW7DU5EJoa
X-Proofpoint-ORIG-GUID: 8-uJoARvX78ZNFCCfUbzOzbW7DU5EJoa

Hi Jan,

On 10/12/21 1:40 AM, Jan Beulich wrote:
> On 12.10.2021 09:24, Dongli Zhang wrote:
>> The guest may access the pv vcpu_time_info immediately after
>> VCPUOP_register_vcpu_info. This is to borrow the idea of
>> VCPUOP_register_vcpu_time_memory_area, where the
>> force_update_vcpu_system_time() is called immediately when the new memory
>> area is registered.
>>
>> Otherwise, we may observe clock drift at the VM side if the VM accesses
>> the clocksource immediately after VCPUOP_register_vcpu_info().
>>
>> Cc: Joe Jin <joe.jin@oracle.com>
>> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
> 
> While I agree with the change in principle, ...
> 
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -1695,6 +1695,8 @@ long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
>>          rc = map_vcpu_info(v, info.mfn, info.offset);
>>          domain_unlock(d);
>>  
>> +        force_update_vcpu_system_time(v);
> 
> ... I'm afraid you're breaking the Arm build here. Arm will first need
> to gain this function.
> 

Since I am not familiar with the Xen ARM, would you please let me your
suggestion if I just leave ARM as TODO to the ARM developers to verify
and implement force_update_vcpu_system_time()?

I have tested that the below can build with arm64/aarch64.

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 40d67ec342..644c65ecd3 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1695,6 +1695,13 @@ long do_vcpu_op(int cmd, unsigned int vcpuid,
XEN_GUEST_HANDLE_PARAM(void) arg)
         rc = map_vcpu_info(v, info.mfn, info.offset);
         domain_unlock(d);

+#ifdef CONFIG_X86
+        /*
+         * TODO: ARM does not have force_update_vcpu_system_time().
+         */
+        force_update_vcpu_system_time(v);
+#endif
+
         break;
     }



Thank you very much!

Dongli Zhang

