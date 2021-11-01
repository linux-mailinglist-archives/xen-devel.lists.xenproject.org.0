Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 038834420A6
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 20:17:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219386.380162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhcnC-00070S-0w; Mon, 01 Nov 2021 19:16:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219386.380162; Mon, 01 Nov 2021 19:16:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhcnB-0006yg-TL; Mon, 01 Nov 2021 19:16:25 +0000
Received: by outflank-mailman (input) for mailman id 219386;
 Mon, 01 Nov 2021 19:16:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eYDq=PU=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1mhcnA-0006ya-8V
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 19:16:24 +0000
Received: from mx0b-00069f02.pphosted.com (unknown [205.220.177.32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e45e8a9-06ae-4545-8be1-d1b7d8db4fbd;
 Mon, 01 Nov 2021 19:16:22 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A1Irc84004932; 
 Mon, 1 Nov 2021 19:16:00 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c28gn3qqt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 01 Nov 2021 19:15:59 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A1J6DaT020852;
 Mon, 1 Nov 2021 19:15:58 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
 by userp3020.oracle.com with ESMTP id 3c1khscrf4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 01 Nov 2021 19:15:58 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by MN2PR10MB4174.namprd10.prod.outlook.com (2603:10b6:208:1dd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Mon, 1 Nov
 2021 19:15:55 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329%6]) with mapi id 15.20.4649.019; Mon, 1 Nov 2021
 19:15:55 +0000
Received: from [10.74.105.65] (138.3.200.1) by
 SA0PR11CA0099.namprd11.prod.outlook.com (2603:10b6:806:d1::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Mon, 1 Nov 2021 19:15:52 +0000
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
X-Inumbo-ID: 8e45e8a9-06ae-4545-8be1-d1b7d8db4fbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=b+p51p18uC8N75Q4P4UR48tjCRk+yQ6uaH1p3jPenJs=;
 b=VV5AVsVbemDri6afqfB0N5NQLIb0S4PsRpTe5ib7mA918TbSc45oMnisXiP21jgqhsxE
 KusUfLVVPeNK0+Z1vbpNOt2HQ/zhEEnnTcMhGaZ74Npf/fL+ukUsGkkA6Lwn/es5sEzM
 Zt57UqDn2tFDzkm7bS7wqAa8/Wdw9EqGnnSNX0WLEI0uXlGib1/L3HdbKb2DNaGnyy29
 krczDusi1u9GwYpzd/QP66N3Plvuc5xiJPzfyVOm4iYjPX/LkZ3Jey6SIqXyFBTx2fle
 TyqGXYkyh6xCo5kLPgGNCn7Q5M9R6XwmjyqUvLKwNDzDAqyfSWW/2ik8mGCMkexVpwCv Zg== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z7/jQZQzTwqm28cTmDxhOL6H1fFYG76xHHGYH8kvbDYjqmK61oUdYuqZzbK/KkoDe0dQqb0LJPIHxjLwPk1MrmJ+1NN0R6eIoHhzSblCvQD6LmtqyYjbbG2aiqpv3/uu9quzieefes6ulViKBAbsMyXFLhi2L1kXZXc3fg67NqPjR4u1pwAsN4t/L2kAEZ8uosPPiLxVrYOG5KLVUY8FESL8+sS6vJSijVcCC1PKVyFE4uj8orHx0thmSPt+Ri6ZqOLb/LSf/mV6mYsEvhPqdDmpc93bgrne9rYZUASwN0d4+y4YwTQC8yu/7yGcJMdOdlZ/4dHn2qvwUEmBtEuEBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+p51p18uC8N75Q4P4UR48tjCRk+yQ6uaH1p3jPenJs=;
 b=jtzS15uwca2jDDHeKcHKv1wztChbnY2LB3zcDvpt3q1HUkjq6mDT4LLL2iebERKCe4RJ1EGmuNW0Tc2bm4SQ/TUDJ2FPPfoe52RDy+a/X5aG1DYYHTF4rUd+y5LMwbzjuYmjlqIOZiS/lkUWP3VgBRjr3rfOziQ7tassnZleHBHfvZdsuAuN/1sXdKTjSs53oC4uDlBDYWKzfk+HyHXRqqfs7oo61fWwU6tCr5KdUiQfusBe+8OIVdLYufcf1S7isJvR34jUYWrRJhf9IGk44YWePTJTdOxVhyp4vv6whNYTu9MJ3Ls3+PJTVMgR+XCAiFUXKIftpSwUUDbQUaMJIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+p51p18uC8N75Q4P4UR48tjCRk+yQ6uaH1p3jPenJs=;
 b=YB5TX6MT80raWLRMMVraaQdFyWj02nP6AQcKrDQQkFU1a6cyDs1eXEdmuB+7ZhybEuvI+XKQS7U2TQ7JCRw/fAhCmpc7Y/g4HD+OaPQSRRjJc2+GxXESzC9RR8HLpY6m+M5y4RjzDopJo4WSqm7Pvj/DoHfXrWzbQNhgJAJmziE=
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=oracle.com;
Message-ID: <d672d22e-770d-d37e-b094-29563106511e@oracle.com>
Date: Mon, 1 Nov 2021 15:15:42 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH 0/4] xen: do some cleanup
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
References: <20211028081221.2475-1-jgross@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <20211028081221.2475-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0099.namprd11.prod.outlook.com
 (2603:10b6:806:d1::14) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cefe525-2d6c-4f77-ace9-08d99d6c071b
X-MS-TrafficTypeDiagnostic: MN2PR10MB4174:
X-Microsoft-Antispam-PRVS: 
	<MN2PR10MB4174ED6EE7D4D6DCD3386DA48A8A9@MN2PR10MB4174.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:403;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	o2KK9R5+g8fO34KNpP2lJYK+kEg0ev5PxD7fRTqQsCPM9sjYg6S2Lw1+5v7utljJmrSGiBzaeaTgAWsGPgx4xby7o3JrVxA/ckkBqx4xiLieoNejt9IRntZTp/cIVmMUVp5QqdRRY3/A0iUdeS2kxV4RfVaSEA1TC9+SD2Cp/XE+iqcVNZfpfKN7rfuBhG9KvuoQsPLRBkh0jrEz26vQG1CDzLNmdlt/nN/3yrmEbLsQMqLfEzD1TdZzmabH4hVZaIDY8HStROUM3Q0jyJiRiGR8CLoL3PcUfsnZLei11f2Ci+uTe/Jd6Bwol0acgDvapxsiCtjfbwL9hWX67+6kk24kghMQA7fhiVIMEzZSZqvHyJfEKoSHPrILr3ykZuVFG0cpENglwratQ4/3+lGyD0OXbkY0rP0JbDovBwtSAMa5LLWy304CsVxxHmM/3YZ9lEbc9v5US+o1+hIJsvUaYU6qP75xWYIcPcMTK3MYFShNYXnQjYGP8On7p2pEB6JIIW1FQiRqRrnNhm7eu3QW/pnUnuTIMZ25yPCs+3BIr4A7apnuwqN8ZnYfmoG3oy6ddO3gT8h6XaXmtsmUU5RjNqs0gp8s9YBysNEbymxIJ40H1ASp2K6hxgP+/MmFza9P+GSY7t3vc/bnvWZrAFHIXqKDRpRhy34Y8U2ZqiJd/kJBS8U2z/eNQlCsCOSqLj2ISl48kToVco/OAOB81SKcQ5wyRnesQYnT6kwE99ya6819RLa84+3hQssXv+aVFiVL
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4744005)(31686004)(7416002)(186003)(26005)(6486002)(54906003)(316002)(38100700002)(16576012)(2616005)(44832011)(53546011)(956004)(5660300002)(6666004)(2906002)(86362001)(508600001)(8936002)(31696002)(8676002)(4326008)(66946007)(83380400001)(36756003)(66476007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MHh2SS9raytxdW5XL3RhOGtldWRubW9PMTZJYUdJTUZwOUpyOU40d25oa0h1?=
 =?utf-8?B?V2d6QndyZUZqczNXWk5GVFkzUERBQUE5R0Qzc21VK1QwUzNnUWtHL252YnpN?=
 =?utf-8?B?Ky9Lby9iRm1SVUF5a2VtOXdrOXlQSjV5THppSEEwbG9jS1RmTkRPYklQbzRR?=
 =?utf-8?B?dWlod21lUnNUQzZIZWpwaWowcE85SmRCQ01YTGNTaWhDazNPdTQreGd1TjZn?=
 =?utf-8?B?QTh1VkVBOHVDWkJ0bGVYRWg0ZFV5dzMrZnBPKzFrRStTdVAxZHVMc3RINWJQ?=
 =?utf-8?B?bzFBb2NCR2NRRFNWM3BCYWJEUFZoRVVHZ0xnREcwWUFQOVpUTzE3a2k0Kzhz?=
 =?utf-8?B?YVQzY3hjOThZQmpiNGE1dXplV3ZRSXJYcHF6dGFoRnZyK1ZES0pjNTFCaUVO?=
 =?utf-8?B?UWhEZU1TNHBsenBPVzRPdWx6VmV5ekRhOCs2dXE3d2JvSEF1ejVWdkxrTHNq?=
 =?utf-8?B?NUlRSWU3OVh2TDl4VUMzTytabmFQTThmek5ENlYvamZreHB6K2lidjJYcHlC?=
 =?utf-8?B?TExkUTluRmhidnFZeFcrSzRMQmhUNTZTeVpoVmxtVTgwK0xWbkg0cmhCbkNx?=
 =?utf-8?B?MGQ2ODlEZ2xzWm1rMkh1ZFd6WS9CMzF6NGlGSDFSZnJlSE1xb3pBbEpteHl2?=
 =?utf-8?B?QkxVdnVDblUwK3NlWHVDUmc4NTNsS2l4Q0FWdENEZEFxQ1FBbEVuMjNoSFo1?=
 =?utf-8?B?dVBpb3d1bXVmbUdzblh0WHpJZDRQc1Q3dHNHb1MwS1VXUnpzaEt5ZWgvUWxh?=
 =?utf-8?B?UzQ5YkZKZ05ScU1TaGtNRFhxQXRnd1VaNktuYW5EOVBTOHgvRzVPU0VFN0pP?=
 =?utf-8?B?S0JGMnh1dnZua2tCQmh0ZFJBS25hT05pcnFpRmRyNXAwYnpQOS93SjB6aklw?=
 =?utf-8?B?a2w1MWZ6aEUyckhSYndGQmVnNEp0WDBWTGM0NmRzRnJFRFdHSEs4TWw0MjdS?=
 =?utf-8?B?eXNMRWwzZWdDbUlsVHB6UCtwbTN2SjVXSzNlemxqbVN3d3BvT01paE5nNmsr?=
 =?utf-8?B?TnlRZUZ6MmdoUzhzUXovQ1Q5MTlOUWR3clZnTENnSW5nQ0ZiTFQxVnRFbFM2?=
 =?utf-8?B?cVk2LzdteFg3RUxqRVBsR3J3MmdJUUo5ZHZ1K0Nzd0JZL244cTUySW8vZlBQ?=
 =?utf-8?B?VHlNRUtKVHhJbVdVeEVzU3pBVW4zNC9uVCtiREhoemVJaVJEdEFLaTlUQ0ZL?=
 =?utf-8?B?Si82VEYyc2FQajlMd2h3WmdOS3ROcUNKZm5zU3dJYVY0c3Y4UHhFSjFiNGlQ?=
 =?utf-8?B?bnljM3BpNk01SWlSNTBZdjA3WmRNaUlnRi9EV0EzSWtvOWFzYTlpTTFHeGtn?=
 =?utf-8?B?ZnhsbDhYZ3hLMDdPa3ZSbC9yZ2tTK1hZQWFGOEY4cnlSd0lKbHRaVWp0NGRZ?=
 =?utf-8?B?ekJXREtxQ29WSWUwTkdFYlVNTTk4elZxSU9maE1nOXRRZXE2U2ZRRmZ2eUZo?=
 =?utf-8?B?WWVPVDBFU285OGxscXdFN1BsTkw4NW1SWHlid05JMzJLb1JBakwyTkdFaWdN?=
 =?utf-8?B?NEUrOXJaL0xyalJVZ3Q2Zk1SZktGTTZZZmF6RWNqcHN4citWNFBkejhhVFhO?=
 =?utf-8?B?T09GalhUNWMxQUQ5ZzVYdytrbzdUc3JnZm1yc05UcTZjZTZpT0VPS2VJL3NS?=
 =?utf-8?B?cHpYSjdEUThjY0Q0cGFtczZ4aUZ2Nk9YZ2lCSXNKZGtGR2RnQkNMN2F1bmx5?=
 =?utf-8?B?cWxieHhvaWNzS1VTUW5FQlZpakt5Q2ZFbC85aHg2SFluWHhlbUdzeW1GSWpF?=
 =?utf-8?B?MlozL2hEdE9wV0pORnpSSkV4U0pFUkJYNDdzMTZmSEpLTXdQeVREUGt5R0pL?=
 =?utf-8?B?REtxM1FwV0JDNXBzV3dPMWZxcHpPbjlrcTJ1SHgzTUxHK1psNHptRVFnQ2JB?=
 =?utf-8?B?TUU3bGxVZmlJRWJjMFVicWxldUtxU2YrbXVoZXFOc1N4eTZNVUdRYmVrQlZE?=
 =?utf-8?B?S0NHVkc2ZG5FcGxXd1BxWkUrYUpHRDFhVGVkcmxqUUdaTmQ1WmY4QlcwUXM1?=
 =?utf-8?B?aW12cVQySUliOFZ6T2RvZncrc0FYRnNCdjZYVE1mQ0k0T3RqQjZFbXlLKzdH?=
 =?utf-8?B?MHE3ZVNmWFIwakhLbXNHTVdRZm9IZlZ4UmhadmJBZU9ScGROOVM0ZHF6aDR4?=
 =?utf-8?B?Vk8xMzJwSjd2TkRPbnRFOWR5ZW1nUnpmbEd0WHl3bFN5NXU1aHhCQ0ZnaGRs?=
 =?utf-8?B?alg5VmVlMzBOU203cjdkZm8rZmo5SWdUbmEvRnZjMHA5RmZNclN4VkNIRjVW?=
 =?utf-8?B?M2RlNnJ3VkpQclBiRXJwQllWeWh3PT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cefe525-2d6c-4f77-ace9-08d99d6c071b
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2021 19:15:55.2910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1hTqS8bpimP5XaR2AFNfkyhtKcHlpu+8NRFC7xwOe4bMMy7XIsXsmHsn65CqP3QHyLWoF8gmUZZffC5I4c/mNGCcEudylyRkQbmm01nALcc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4174
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10155 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111010103
X-Proofpoint-ORIG-GUID: Kus93CEMdtRgZUrII15VcrwPtMx12G33
X-Proofpoint-GUID: Kus93CEMdtRgZUrII15VcrwPtMx12G33


On 10/28/21 4:12 AM, Juergen Gross wrote:
> Some cleanups, mostly related to no longer supporting 32-bit PV mode.
>
> Juergen Gross (4):
>    x86/xen: remove 32-bit pv leftovers
>    xen: allow pv-only hypercalls only with CONFIG_XEN_PV
>    xen: remove highmem remnants
>    x86/xen: remove 32-bit awareness from startup_xen
>
>   arch/arm/xen/enlighten.c             |   1 -
>   arch/arm/xen/hypercall.S             |   1 -
>   arch/arm64/xen/hypercall.S           |   1 -
>   arch/x86/include/asm/xen/hypercall.h | 233 ++++++++++++---------------
>   arch/x86/xen/enlighten_pv.c          |   7 -
>   arch/x86/xen/mmu_pv.c                |   1 -
>   arch/x86/xen/xen-head.S              |  12 +-
>   drivers/xen/mem-reservation.c        |  27 ++--
>   include/xen/arm/hypercall.h          |  15 --
>   9 files changed, 118 insertions(+), 180 deletions(-)



Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>


