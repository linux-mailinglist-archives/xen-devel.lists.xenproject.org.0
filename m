Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4901430412
	for <lists+xen-devel@lfdr.de>; Sat, 16 Oct 2021 20:10:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211346.368608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbo7T-0002sl-8n; Sat, 16 Oct 2021 18:09:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211346.368608; Sat, 16 Oct 2021 18:09:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbo7T-0002qt-5i; Sat, 16 Oct 2021 18:09:19 +0000
Received: by outflank-mailman (input) for mailman id 211346;
 Sat, 16 Oct 2021 18:09:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k6GW=PE=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1mbo7S-0002qn-DB
 for xen-devel@lists.xenproject.org; Sat, 16 Oct 2021 18:09:18 +0000
Received: from mx0b-00069f02.pphosted.com (unknown [205.220.177.32])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ced89f2-2eac-11ec-8295-12813bfff9fa;
 Sat, 16 Oct 2021 18:09:16 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19GGlpSu013536; 
 Sat, 16 Oct 2021 18:09:05 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bqqj5s4qp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 16 Oct 2021 18:09:05 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19GI5OnT168058;
 Sat, 16 Oct 2021 18:09:04 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by userp3020.oracle.com with ESMTP id 3bqp2k3112-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 16 Oct 2021 18:09:04 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by MN2PR10MB4029.namprd10.prod.outlook.com (2603:10b6:208:186::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Sat, 16 Oct
 2021 18:09:02 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329%5]) with mapi id 15.20.4608.018; Sat, 16 Oct 2021
 18:09:02 +0000
Received: from [10.74.110.15] (138.3.200.15) by
 SJ0PR03CA0190.namprd03.prod.outlook.com (2603:10b6:a03:2ef::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Sat, 16 Oct 2021 18:08:59 +0000
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
X-Inumbo-ID: 2ced89f2-2eac-11ec-8295-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=aOlWC3Cw595G8TJ54yVSc2BzRIgENLvlwz77HvIGxqo=;
 b=SdsclP8oeCRw0ilqjOtBi1u8hYTlmjovk2K8rWDQa3gHJX/LseJf/m3KXNLxlvQakJUk
 4R9z6jDJVjrnp/dQChT5qzTlPke6NIjwhoY1LaLlG91+e/LmGrE2I/QVyQ1tEqqPvAfG
 JTLKn4CcFMPNVuuK+8/Fa3UAbI4r9/+btdqUuyjKPQSDbh4Qwm1z8SSdhzvg4PXNMirt
 tdvOft2wapmHiYjikWu2Jow2Sso3e4X+n675SfJTGQcAiwL9DIU7wWT2SfhbC3qyqaW3
 KYFCXoNIPP5pZ/lbWGxDWIUGukG6lh9VtmMkQ5peoJEs2nia0usl/pZdFTEN2VHa27Zx WQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wa9G4ZY4VdEs1AyOc9SLUzoQrB0ZniP03YKB6pGkgSpD/yQC9YU3R1QdlMWt2qe4FCQNGsfWa7tBmevfT6YZseEjbBTyPSJ30yobReM+WzxqxspOVWIH4C4e3W0hug9Dl2fKLozDX1l8pteR6cA07XhYFhintoHbqfRO+942OYemlqT3Mq1GJSVb1w+MNl/vUEUMlNCYThriafmKV9dm+KBOY4CUoxWymRG9hPlYDO9dKnkgLPzKSD+E6xoAmR2p1QzE3wayFW615I+uG+6IkpwlRncyK3apitGl/Vk/CJSOIpS/MsaI9uoV8+ypiTwb0dQvv2Jyzjb5h8LAtW8Saw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOlWC3Cw595G8TJ54yVSc2BzRIgENLvlwz77HvIGxqo=;
 b=Oku/rzWnHAwxVc9kqfFxYwy53k92yeeB2PaEjIGSlEHt9agUS3uv8fRygkpXtuBgzr5ISRHIWjtMASk+sTn4nhl1RgpWPSgeJbkUqqCuK39vyFoLTONNAgWcXgbyXmiUEXntkg94Gva7TisPNrVxKSl6E/Rzrd/ukHCWpn21WTumzOOVfCxu2j8ZyANewTd5ABHmLjrSJrup+hW8pFNztTyq7DXLqi1741cvqJ1ZjKmoGzC+4PpsZHgWqmtAOgcnFlbzaMgBl7nnYKvcyXDilEnJbq/1AM35aRiPpfZIaEsBKwyAEpX/+LUs+0PzW4OB/TEiDJiGZ2fv4SXve7eTDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOlWC3Cw595G8TJ54yVSc2BzRIgENLvlwz77HvIGxqo=;
 b=Bb16enKOYBfpieuRixqNPuiMbMjKHWjYcS1RIXS/6oaQpi04EDhGRfzCwGv8NgyPa3X0I7tCITVhkc9RNZ0yxcxamQhaJ1iYXJ04B0ImEgukI3OrJnikBiS2S0/okny8nCWMoYpSeE9b3E2ALH+RI2pui4uZ6thEjtt7XSZwL+4=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Message-ID: <b8793bbb-a148-6b31-0c92-a0d71e50380d@oracle.com>
Date: Sat, 16 Oct 2021 14:08:55 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH V3 04/49] x86/xen: Add
 xenpv_restore_regs_and_return_to_usermode()
Content-Language: en-US
To: Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org
Cc: x86@kernel.org, Lai Jiangshan <laijs@linux.alibaba.com>,
        Jan Beulich <jbeulich@suse.com>, Thomas Gleixner <tglx@linutronix.de>,
        Juergen Gross <jgross@suse.com>, Peter Anvin <hpa@zytor.com>,
        xen-devel@lists.xenproject.org, Andy Lutomirski <luto@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Stefano Stabellini <sstabellini@kernel.org>
References: <20211014031413.14471-1-jiangshanlai@gmail.com>
 <20211014031413.14471-5-jiangshanlai@gmail.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <20211014031413.14471-5-jiangshanlai@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0190.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::15) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd83abbc-a7c3-4b59-587b-08d990d00880
X-MS-TrafficTypeDiagnostic: MN2PR10MB4029:
X-Microsoft-Antispam-PRVS: 
	<MN2PR10MB4029D536FBB182C0E57145AC8ABA9@MN2PR10MB4029.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7//iOluov1mWVUtMBbm2zF5xT7HkojfPRv8hOI7wKn9yjoOLdtPxizfO5rSmDM+CoGgi0UZ41ABKzctXOhF3wb9O6IMhgymZXpUI3ACdeh4wC5DHXek5tuM6VQbPHLRnbety0FTjQZFJXuvVTR+0O7KSgC1k/le2Nie7IMA3Q7p9uUwgxvYKbLYh6TxWkRS6DfCI27ntnNKgx8O6FDDJ3TlDwRSukFXweXqJBDSZSKbUeeAazKkpKQdq13QwPPMbHH1C17u5DXzP3ADkxvT3LTM/OAv1l2iCzBV72GvfHBsFc+gV7IyYgBjuAHsAkpURrNDtMwIhkHse7rh6SPHSl/porgk2sQU7LVC504W0o9Vj3yxzclJ4lMB5fFFvgpAYr4UvDISTz2AGymqUwmetDjkrrZGAweVexnyK61fg8q/HO6f9KKI8+bb0LFtFQhKFbXYwHTvTHb2nkl0egEL2jUyg517Gy5//H3GAl02oQFBKFuaQbvwvLRGe5v2Ts50bvW+98ogAmdDcw67S4wc9B3DCrJjN+YEl7+QiM8EIJpvXD/AyWxlaFJJsKFAWiDO5qt6IRN+8ra+ABwsniFe+TCSwnabS3Km+FAz1Ot6HlPFPdj/RMMwL2NnEiaT7+87oSHGuuGVqsn3bY4HM70HY7e4vxs+o/br1qAaPceMoEqtXC+gPUJDp9jdREl7V2u+ybV1UgpcndiiIfwp7vI2bL4edvNYHzmdu/y93Rx+0huKv0Vo8j+mRkNAhKSLYbNwD
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(53546011)(36756003)(83380400001)(66476007)(26005)(38100700002)(4326008)(508600001)(31696002)(2906002)(6486002)(8936002)(186003)(66946007)(31686004)(956004)(2616005)(44832011)(6666004)(86362001)(316002)(66556008)(16576012)(8676002)(5660300002)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bks2QzAwdEVndXJaOFR1bmt1M21wM0hISWFvRWd3NEhqcnUzNDhNdTk5WkVn?=
 =?utf-8?B?WmFsSjB0KzBGeEJBRUJpZy9wdUI1NFQ2LzRZN1JoZXV1R1FPMWVJd1VPUytW?=
 =?utf-8?B?UDlvVURpck4waUZQSG5DTlZzK3JWdlZxNkM0REFvQ0dtS1hoNnAxZTJhZXRP?=
 =?utf-8?B?L3Y3aE5Zc2xDQ05mUHpKN2FiT0ROd05FTzhNRWxOMS9hdHVMczZmbzJxSy9J?=
 =?utf-8?B?RkxKU1V6V1J0c21yRUQrUFJ5Y0MwWDdxdHZjY3VQS29MR1VtSGMwQjMwaWdU?=
 =?utf-8?B?VTAxOEhSS0FkKzBiNXYyc0luWnQ5cFlZalpiazFEWGlMbFVPNU1MejlSR0Mz?=
 =?utf-8?B?RzN5UEtmQUtWekUvRmI1SDgwbWtLZFJUdWNVL3VpeDFQYklUN0I4OG9SSVJV?=
 =?utf-8?B?SmMweHZoV0IxZUxhNzNPajJhTGJPL0F5dFYwdWF5TXNlV2c2bzFoL1QrMlBQ?=
 =?utf-8?B?cFZ6Wmh3RThyajQrTnJnRmZ6ZDBaQm1icURXTVBIUWVwWUpDd0NIakFHbHBL?=
 =?utf-8?B?M0tsUzdEa0VOWFR4ZXRUcm5yUExRZ3RDdng2VU9zd2IrWUhWUW9SWFN0Qjh6?=
 =?utf-8?B?M1JlWVlQT1VlMkdkUFRSTVJxN2ZhcEZPSnB1SjJpUm5jV3dwQ3Jqd3BVSWw1?=
 =?utf-8?B?OU1CWHNFMlhrbVk5NVROMkhKdXlyTmg2TTY2YkdGdy9rQzdlcFYybGtucExN?=
 =?utf-8?B?cUFJOGZ1TktDK3pSUkpseVM4ZUc2bVQ3V1FnNmt3MUdpdjhZeEVaUGJHdWF6?=
 =?utf-8?B?MVZFOU53VkRpTFM1Q2xVWGl4SnN5aUFzUGZkY3lxTDJHMnVYblFGaHY0bXRj?=
 =?utf-8?B?Y2lWTEpCbXFNZldtaFF0cXkyTVlwd1VKQVJwWlNBMjRwY0V1TklhNHFwNXQx?=
 =?utf-8?B?T2hlQk9aekVpbTlpVnpZOFVVbEVXcUlMS0Vtc2R1bTlvV1NPalpnYkJJaGh2?=
 =?utf-8?B?bVA0aEVDeU5BUHEwb1B6dkRwT2FMdlZseVQ1c2F1ZnYxZko5U05FeUxmL2Z1?=
 =?utf-8?B?Q0NrczV3andDdW5tT0FuOEJJL3o0Qnl0VnJUOHczd0xXVHhIOWVZYnUwK28x?=
 =?utf-8?B?bFVKU29FUTNaK0ZNRUlCZS83NmtISWQ0K2t2U3dJV2doL1NuUHFCQmVrQU5O?=
 =?utf-8?B?b3RkcVFmQ2o1ZzVpbThrdHFjeld1cDk3NTdTRTdGTVNhS1gvVUFYa3Y3Rmxy?=
 =?utf-8?B?UVN6VzZtV1ZBU1o3L21MZnhKTDhEMjg0dHRiR1VKOUpjOTRDTG5wMk14V1Bw?=
 =?utf-8?B?UlVUTzlsUTNkOXFsQ1dVOEdYM09Ecm1pYlZGWHVaQ1BUVkI3ZjdYcGdRR1Ru?=
 =?utf-8?B?b2JlNWxkRGhXTDJkeSttTldmMjh6R1NpenhwcktFS1hyNlJuL204b2ZBREZG?=
 =?utf-8?B?V3RRNmFKS2sxdzAzM01xZWI1Q3ZFUzkvUXpzdHNPeVdxUVFTWkF5eVN0MU83?=
 =?utf-8?B?d0ExbUlRQ2pyR2RWYzBKZlhCWkZOWTRqS0RSTW9PQ1JuQ3ZPUHdyanN1aElj?=
 =?utf-8?B?M1dwRW9VRGlsY2JuN0xGQXZzNXIxMjNRY1I4bDVMUzJDQUd5STREeU82Y3Vw?=
 =?utf-8?B?bHhBOUc5aFpHSzN4b0V2b3htckZuN0htL1BvTlpSVEVHcnhlODZydVBqbFls?=
 =?utf-8?B?d3dlUmwzaVZmNmZWcWFsOHpob2tKa2NyUlRhN3VQY241RHdIczM0TUNjOGo2?=
 =?utf-8?B?MkxLc3Jwa2VCS25DM1BvU1AzVG1GR21wNk93MnBWcmtaNEhiUHNkcFRhZnJM?=
 =?utf-8?Q?BkAh4p4abaTbwqh6rWbHTYrmZ+8oMHOlSNxS8fm?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd83abbc-a7c3-4b59-587b-08d990d00880
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2021 18:09:02.1226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RjeW05seVUw3TzaYWD/Tx1zSWrS24ynuxebjdmlG8bjVbW36XmDuI+0Gkz1wneQwjpiA3TDxKEG9wuMApW09w6iKhdEQZNwIecqVNoDHMwg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4029
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10139 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110160123
X-Proofpoint-GUID: gLbTOyA-ea95nxqJhTfIAROB3hJqHxAy
X-Proofpoint-ORIG-GUID: gLbTOyA-ea95nxqJhTfIAROB3hJqHxAy


On 10/13/21 11:13 PM, Lai Jiangshan wrote:
> From: Lai Jiangshan <laijs@linux.alibaba.com>
>
> While in the native case, PER_CPU_VAR(cpu_tss_rw + TSS_sp0) is the
> trampoline stack.  But XEN pv doesn't use trampoline stack, so
> PER_CPU_VAR(cpu_tss_rw + TSS_sp0) is also the kernel stack.  Hence source
> and destination stacks are identical in that case, which means reusing
> swapgs_restore_regs_and_return_to_usermode() in XEN pv would cause %rsp
> to move up to the top of the kernel stack and leave the IRET frame below
> %rsp, which is dangerous to be corrupted if #NMI / #MC hit as either of
> these events occurring in the middle of the stack pushing would clobber
> data on the (original) stack.
>
> And swapgs_restore_regs_and_return_to_usermode() pushing the IRET frame
> on to the original address is useless and error-prone when there is any
> future attempt to modify the code.
>
> Fixes: 7f2590a110b8 ("x86/entry/64: Use a per-CPU trampoline stack for IDT entries")
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Peter Anvin <hpa@zytor.com>
> Cc: xen-devel@lists.xenproject.org>
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Signed-off-by: Lai Jiangshan <laijs@linux.alibaba.com>


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>



