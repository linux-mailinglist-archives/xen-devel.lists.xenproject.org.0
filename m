Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9CB412254
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 20:13:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191132.341043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSNme-0008D6-7y; Mon, 20 Sep 2021 18:12:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191132.341043; Mon, 20 Sep 2021 18:12:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSNme-0008A8-4H; Mon, 20 Sep 2021 18:12:52 +0000
Received: by outflank-mailman (input) for mailman id 191132;
 Mon, 20 Sep 2021 18:12:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AtBo=OK=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1mSNmc-0008A2-50
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 18:12:50 +0000
Received: from mx0b-00069f02.pphosted.com (unknown [205.220.177.32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 434a2773-1b39-400d-a801-82b7f1f201a5;
 Mon, 20 Sep 2021 18:12:47 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18KGUZaW023314; 
 Mon, 20 Sep 2021 18:12:46 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3b66gn3rvv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Sep 2021 18:12:46 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18KI1mSX089210;
 Mon, 20 Sep 2021 18:12:45 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2041.outbound.protection.outlook.com [104.47.51.41])
 by userp3030.oracle.com with ESMTP id 3b557vwxqg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Sep 2021 18:12:44 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BL0PR10MB2835.namprd10.prod.outlook.com (2603:10b6:208:31::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Mon, 20 Sep
 2021 18:12:43 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::f520:b987:b36e:618f]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::f520:b987:b36e:618f%7]) with mapi id 15.20.4523.018; Mon, 20 Sep 2021
 18:12:43 +0000
Received: from [10.74.117.74] (138.3.201.10) by
 SA9PR13CA0084.namprd13.prod.outlook.com (2603:10b6:806:23::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.5 via Frontend Transport; Mon, 20 Sep 2021 18:12:42 +0000
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
X-Inumbo-ID: 434a2773-1b39-400d-a801-82b7f1f201a5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=zrmD74ywt/8la0rTIv+A0YDuPs5jmd98jJp1pDuLQbU=;
 b=QoqNLoywbXEhLVZ8DcWMBllhf0Iu4MAD8oN8FQJaRejoR4YKxNP6C+wE7FLARQAiIZu3
 eQ0gg3FGV+ui+Yf8o6yd2bPqQgvnAJSUHHtbZ2Rvv4XlS9VDt74YoH7SPUt/NFPpKnnC
 Lll1HYhPatydFcj90BBM2iAWq2FJOupAs2zXYAENjdTEVLPDMSoXdNsHTWIW8Y4SslS3
 U/whn6562P7uopnhZwkHAhbuEn22UDLFI7vF2acLF3cKekqZshPvMl4TweZ6YMLfKyX6
 YUbtuOlI4y6NWPbsRmcUrXrOGwDj72vTv+L4L/o+ggesPhj46JE4/zkoLa4coS+fJv2d GQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cVZSd3ggMoQJT1LPxO7NZGWGFVxU9bfxaPPu35vcvxzNXZAa2TUB611/gzF8aS3l0ipSAqDc0kYOlTy9jXRNg1J94VcHRuLqdK/XwYBr31yrRVSVEY12w6rp601UJ8cY8Q9l171SAWq5CMIo0pF7kSNCHjMRM3tX9PXvUBo79y++kkAbxfVkUErCjvE6HXHJnFqkrhjR3dHdiEHoeeyrWm78AE8ked4Ma2XnvUq7Q/6E+G41P5zbyZr3VnmDnnWAOxrcOty1ym7QKOBb0ZcDIvmhSgq0bnkZoDGeI3cCvQI48CQHaghh/F93FLfeLeoiHqYJmsklX6iqnfXk1GVgvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=zrmD74ywt/8la0rTIv+A0YDuPs5jmd98jJp1pDuLQbU=;
 b=ik0/uMarPCYMN2cJGiKgV0laSihccdiTO+ZtjlVMBC0Jse1zG6akv8Tkn8H8knuDAZYvKf5905IZdWLlBWQeS+2IQUQ+16QEeCnAfgUuFwKIJz2DCn7g2RFcBg3cG34eVSZ70k56GFOrb44p8hqfqIwKm0y61WvoFfa6a2H30UaaW+zvHmdN/2131XL+waNHFtTTc5YPHqi7XqKF/5+pQdXfZAlt+/P0WciLtV/8CWF61yT204RsJ4K2ueqF48ewceXdcQQV6m9pUPi/NSWzMo8c9/JMg1FDdT/k6c15G04/66CpwlhduYGQpy0NOhoI/hV5C2oz3Psrk/p+IZQyzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrmD74ywt/8la0rTIv+A0YDuPs5jmd98jJp1pDuLQbU=;
 b=hh0eRdF69eHKUgehG+6yy7uC2V090fo/L9QOq5KsXwd2lfzZj2s0LH/iv4onkFC+Q0Id/uV5wxN44UQU/YHM5VPFwCSObgs+527+CwylwRkupW53slXfUvWADaasAms7HrZkdReinxkheDTXwH2FhCc+wCidfnK/04MuoeNFWsw=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=oracle.com;
Subject: Re: [PATCH v2] xen/x86: fix PV trap handling on secondary processors
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7a266932-092e-b68f-f2bb-1473b61adc6e@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <bbd4188c-32d1-7a5c-110e-18cf2b3223d4@oracle.com>
Date: Mon, 20 Sep 2021 14:12:39 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
In-Reply-To: <7a266932-092e-b68f-f2bb-1473b61adc6e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SA9PR13CA0084.namprd13.prod.outlook.com
 (2603:10b6:806:23::29) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8945a0eb-a59a-418c-610b-08d97c623d81
X-MS-TrafficTypeDiagnostic: BL0PR10MB2835:
X-Microsoft-Antispam-PRVS: 
	<BL0PR10MB283552BE51C83FEBF40AC2838AA09@BL0PR10MB2835.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	a9zEjhCgsTB7jWJmLfoJjyxN113ts5WAHLZNt0bU7OuL0ey9DwXzKYE6D1oIivxODlhu0SpDmXJc10ZVI1nuSsmtgdIeA/4q4XlwSayTUIC0yxKXXC2OJSXGLWxjcNKn49m3rMdxWQSVBemh0fFIAL3R5pq6NMFOnju1FaubxdaEZN7fG/b0P45BIZM8RTELho4+GsOByWfwNHbB+jPAB6mczKYWElX3SW5DHy1dbr/0exQSXcCTPtsE50Ijy7xJ0h3EX6/LKnZLg1LNvpfyQfy8LyHMhWtrBvkWJVmSXpn0fC+1nnoaKQSCPZwiZ33+uUMHfPCdrGrmZFDrW7TeuwZqKlMdGXVVv/ehKhvN1WcZfSrE/80HvMkFQZ8PUjJzgvnNfzo2NfzcD7NitStzjxBjGIA9JPO0z8fK8A8c5XLIoLKvxv8RNkQmv8Sm5sD3EYjeQghJcID5atJP+g794nBee3waydPGqCHJQnkj/n9X8qA3GVHlQqWaTCtshvJ7RoDnshPMzfBguVropH8QYCe6s/h+ut5CacmKCumYClVii7DJTEvFL9ajH6b4HGl6BjRchd7+szB5NQHAL+J1pILDtBo2sQ6D0oRsemPCIkAXC89NURLuosSJJ19khDrEfhewlguyh/ugYQ9tAKUX66n53b4v6UDXPwcWmj/523hCTYVfM2UyfCebuxNoCTvi0+saGvB+IkUwF970mCFag6Mw/qQ6fT5Z8P6LkrWNaY+89haLUQlurlDTd4yySWal
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(38100700002)(31696002)(36756003)(66476007)(66946007)(6486002)(31686004)(8676002)(6666004)(5660300002)(316002)(26005)(44832011)(53546011)(110136005)(54906003)(8936002)(508600001)(956004)(4326008)(86362001)(2616005)(186003)(2906002)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SUVva3IzZXdIeXh4SDJ2MEdNQ281T1h4Mko0aHdlN0NXREN4YVU0c3JkMERF?=
 =?utf-8?B?T2wxQVJxRlJ5WDR4alhRQ2VuVk5YSzdkTzBoRkpsRmlyeU45L1NGQk12Tkt3?=
 =?utf-8?B?TFgxVU4wMkw4YkN2Z1RkcFJSbFdhdHovUkhPTVUxYkdnMXVndTh3UjR4Q0lq?=
 =?utf-8?B?c1pIcXZKYXNVVzV1bnF4TmhlQnlyMzNKRHdpNU1HeXZrL0JDaS9IRllYZGUy?=
 =?utf-8?B?V1JlekEzOVZCaklEUytKa3YrN2VkZHl4QlF2YWMzS1YzZzBlNXBTTmM2S0JD?=
 =?utf-8?B?enFNZXl5bGlZUjNxekNLTlZzanhtSFNuT05vM3ZnYWNHc0s0eHdsZmJBUUU1?=
 =?utf-8?B?WGJLNUdLSFZjaTF6R0ZwdnQweG1YZUFDOVNZSDdJN3dXZE1NWnI0QTVCamJ1?=
 =?utf-8?B?aytLVTl6S2hnWG1NanVGdVV6VnNxV2h3b0tDS2oxNGxIRTdVQUlUYzkrTTJz?=
 =?utf-8?B?WWovYmhWQkpVTlJ6STZzZk9wczkzV3EvSkJTRHFJQm0zSnFyb09obTB6NGpT?=
 =?utf-8?B?dWJHaTM1cFd6RCtQZHBjQk1PZFUrNWxyaS83b01kZ0hkSGFsSUtnOWNEUlBv?=
 =?utf-8?B?dEVFbjBCSGlSQlUrVVpvMVV4NFBieHNwSmp5MkZjTS9obnJ3QUp0dXBCZzhv?=
 =?utf-8?B?QU9xeWJxY0RBNHBKZkhUdjVBb2w0RVdGeGYzbUd2ZlV4TzUxK0xrNkZGQmFs?=
 =?utf-8?B?UkxsRURYVXNlVk9pVnR2NWMrNzRvU255YnpYMGpoOEtLMGJlMkV2L1V0bGlj?=
 =?utf-8?B?V2lid2NlV3dPZm5kVW1Xd01BaWtEbHo1VE9XWjRLVWdYVmxZcVU4L0IxUGRn?=
 =?utf-8?B?WUtyTDNIVnpjNkhpMmZtM0tSWDhrSDM4dEFGbVpyUlZWdEdXbVVQZ3F1Nmd3?=
 =?utf-8?B?L1NMRVJ1TWxpMUdtbkcvQzhKeGtsNmJFV3R0YUgrRXgzcmZhRUVXUnU4eGJ5?=
 =?utf-8?B?QjBjSjlIYnFsdFlLbXRNaVFIZkVuRG9Ebkx3eGlOdlgySHFMaGZpRmxGYndO?=
 =?utf-8?B?TTRocVVUdXNnTFlzdjQ0eFBPemRyVHJ2Rm05bVExWFNqaHdrbHhnNWJMY3Rn?=
 =?utf-8?B?VW1YMTR3U05xYUIrZkdRV0Uxb29nd0ZKWnd6V2ZWU3JWYVlxM216Z2VldzR2?=
 =?utf-8?B?N1BoWlQraUF3clBTWDE4RDZDMDFIRGZJNzY2MHFDTFhkUUV6ZCt0V3hBREFL?=
 =?utf-8?B?V1Z4SUpaS0RpeEtvVlN3TENzTnFIeWhnZnhPM0lQbXN5cHdOQVU5LzVYc3No?=
 =?utf-8?B?SUM3T1B4NGV2OGxKTENrRkNZL0pZZzdBRDBwOUJiMFMrLzZ6aEpsZW1BZHM5?=
 =?utf-8?B?cGpsU0QwT3ZCQnRPamNVSXl0ajlXemV3dEdiT0VvVVAyTVUrTjU2ODJNMnFN?=
 =?utf-8?B?TnQxYkdsZTVQLyt3a0t3cTZYM1AzR21TZ1lUb2tGMG93MHlHN2tlSWxic3E5?=
 =?utf-8?B?WmU0b1o2N3FEN2w3Qi9vR2NPVmJJaUk0L0cxaW9YTm5RN3Y5VTdZbVpQRUda?=
 =?utf-8?B?MnVOU1c5Y3R2WTBieVA1eC91TlErUmtiaFZDRmdQMHNhME8rbEFCeHh4VXdR?=
 =?utf-8?B?L0Vha09EUlNkQVBhZFp2T0pEZHIxem9OeE1kVGxmTWJCVGd4U2w4cEI2bmMy?=
 =?utf-8?B?dGZCVTR4amN4QVhGZXZ5QWp6ajZ1bm5pRy9xMERxRjVWUjVrUWxsVldnYkMr?=
 =?utf-8?B?aXFPa3I4aW5qdWE2d2lNZDlXd3dxMUJ1L1lJVlhSRFJLWDdiSWkzN3ZDVkxB?=
 =?utf-8?Q?5NsBnYEZwZNdaTyKDoeJFLWyx+LvtJWBxFPQfu9?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8945a0eb-a59a-418c-610b-08d97c623d81
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 18:12:43.1787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lma5l6P12UIm9ENV18O7DJH6xNS/YSFjh8dGwdilD5d63i8LxBZOCF3w1IrcjEdf36eUhWNqjvURaSFA/uvxHmS0Esmr0CHn3XPmS1hCGkA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR10MB2835
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10113 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0 spamscore=0
 bulkscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109200108
X-Proofpoint-GUID: ALKlUnr9OjrLwS62HuMtlXehF7Ooipoy
X-Proofpoint-ORIG-GUID: ALKlUnr9OjrLwS62HuMtlXehF7Ooipoy


On 9/20/21 12:15 PM, Jan Beulich wrote:
> The initial observation was that in PV mode under Xen 32-bit user space
> didn't work anymore. Attempts of system calls ended in #GP(0x402). All
> of the sudden the vector 0x80 handler was not in place anymore. As it
> turns out up to 5.13 redundant initialization did occur: Once from
> cpu_initialize_context() (through its VCPUOP_initialise hypercall) and a
> 2nd time while each CPU was brought fully up. This 2nd initialization is
> now gone, uncovering that the 1st one was flawed: Unlike for the
> set_trap_table hypercall, a full virtual IDT needs to be specified here;
> the "vector" fields of the individual entries are of no interest. With
> many (kernel) IDT entries still(?) (i.e. at that point at least) empty,
> the syscall vector 0x80 ended up in slot 0x20 of the virtual IDT, thus
> becoming the domain's handler for vector 0x20.
>
> Make xen_convert_trap_info() fit for either purpose, leveraging the fact
> that on the xen_copy_trap_info() path the table starts out zero-filled.
> This includes moving out the writing of the sentinel, which would also
> have lead to a buffer overrun in the xen_copy_trap_info() case if all
> (kernel) IDT entries were populated. Convert the writing of the sentinel
> to clearing of the entire table entry rather than just the address
> field.
>
> (I didn't bother trying to identify the commit which uncovered the issue
> in 5.14; the commit named below is the one which actually introduced the
> bad code.)
>
> Fixes: f87e4cac4f4e ("xen: SMP guest support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jan Beulich <jbeulich@suse.com>


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>


