Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4229438EBD
	for <lists+xen-devel@lfdr.de>; Mon, 25 Oct 2021 07:21:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215641.374966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mesQ0-0000FX-N9; Mon, 25 Oct 2021 05:21:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215641.374966; Mon, 25 Oct 2021 05:21:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mesQ0-0000D6-Ic; Mon, 25 Oct 2021 05:21:08 +0000
Received: by outflank-mailman (input) for mailman id 215641;
 Mon, 25 Oct 2021 05:21:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IWrL=PN=oracle.com=dongli.zhang@srs-us1.protection.inumbo.net>)
 id 1mesPz-0000D0-9E
 for xen-devel@lists.xenproject.org; Mon, 25 Oct 2021 05:21:07 +0000
Received: from mx0a-00069f02.pphosted.com (unknown [205.220.165.32])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 582684d6-3553-11ec-840b-12813bfff9fa;
 Mon, 25 Oct 2021 05:21:02 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19P3adJF012322; 
 Mon, 25 Oct 2021 05:20:43 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bw7r0979n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Oct 2021 05:20:43 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19P5FqmF023998;
 Mon, 25 Oct 2021 05:20:41 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
 by userp3030.oracle.com with ESMTP id 3bv7gtv65u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Oct 2021 05:20:41 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BY5PR10MB4354.namprd10.prod.outlook.com (2603:10b6:a03:20c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Mon, 25 Oct
 2021 05:20:39 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::2848:63dc:b87:8021]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::2848:63dc:b87:8021%7]) with mapi id 15.20.4628.020; Mon, 25 Oct 2021
 05:20:39 +0000
Received: from [IPv6:2606:b400:400:7446:8000::4e] (2606:b400:8301:1010::16aa)
 by SA0PR12CA0004.namprd12.prod.outlook.com (2603:10b6:806:6f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Mon, 25 Oct 2021 05:20:37 +0000
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
X-Inumbo-ID: 582684d6-3553-11ec-840b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=zRw+C1ltqjv8mAnE2AA7Jc4EUdGxJvW5/xO0T7uXZ2c=;
 b=Swk8k+8g5kmWmcY6ZEXb/AbOelzc8bVEVuyq3JVYVP13cJkYLrxb9fAgp0q9aPDlhBOJ
 7UhPFWn94fLxbW73J3YgTAWPPpEEDBsnFvbHZwkNV1QpC5JgeNckBQ5Cqqbaj64zZpwr
 8NMu8E3lF/t8tYhOZVZ0EAuk97Szhj+9mlL1wJjfptXsetTh+l08muETco2w56QMK6j1
 SMGKfLA/f47tGL4C3weXsS8QRRQpOwpCLXCAI6wGCLc8jLTWyF2G5InInmqrJO7tuJ07
 4VeLappE+VCY6W2rGBobekDpPvVo96OGH67YashA1s3TkmThvMVLLDWzB6Q57EmlFjfU Aw== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FkLXV7leeT9UAFGgz4CSqc8e/oxSRsrel8Xb3+rKcABtckT67sHm2mXF27jnxm3/SBKqvFwvWFXSpMyoFVTj088zP284vOcBAabZbqdfg/H2pe4NRLb/lwMq+xwvlT1iD13T2aSC4CBsurF4/Yi7hOEE1y1S1Ftwy9eVTVZudPojcyMne3ypeBy+/0rmeC7Nc7+N4dM8/qqEuyB2RBkStd/+YLNxmFkPbxeATMbcoL+gYJYQbcMlkzE/5nwTSWdF750e35jsELo4i6GJxMdkmpEzAEpxIcU02BWOVfO8Xq0bF79PsgvrPubOZwzv50+UssL3hrW2qXZDb3MiX5fqxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zRw+C1ltqjv8mAnE2AA7Jc4EUdGxJvW5/xO0T7uXZ2c=;
 b=fXcesXo0NxgQMTJsNAD08/YG9AjPi6CXUoRWUOdIM0oQOCHYwrwu7d5+l2sHUV8OEBsKsV8FCDmoSTo7LoNIAwDXBWFZHrssOTAzxO47pq3+h5QwnxLaaczhiBZ30I6DEWI+Au2MIoI88oLmy/Ptnhx5G3S5Uu0u3eE6bSvGOWZ6ypp94X/DCdbDEkYoERTEfypbjikjS9g1km155I4Cy7nsoIoPESbkThAL11CBX0nyabZFMo2ViYQlcFU1OeF2xCaPxXzoBqOZHPSiiyHyYbwJgm3gnVWoyiEJyRsgHUqp3mxwlRAPiy+u137XIftLt9YSdnljbmZIBi1jnebH5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zRw+C1ltqjv8mAnE2AA7Jc4EUdGxJvW5/xO0T7uXZ2c=;
 b=jV/IsQXnHeVxrt4KSN5oki42QGNJHZGK1+EixBP0dP6EtYAHUDFJ/8nnXGFCnzDgyRH7oNzaHDyC0x67c+NDUb25GhkQtGysdM/sxBmO0qU4QZnBLRz/MIWJ9DGTsEAOShEQSydJ91UeoQbjXvysZi+iwN88JUog3e3ltda9X+0=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH linux 1/2] xen: delay xen_hvm_init_time_ops() if kdump is
 boot on vcpu>=32
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        xen-devel@lists.xenproject.org
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, jgross@suse.com,
        sstabellini@kernel.org, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, hpa@zytor.com, andrew.cooper3@citrix.com,
        george.dunlap@citrix.com, iwj@xenproject.org, jbeulich@suse.com,
        julien@xen.org, wl@xen.org, joe.jin@oracle.com
References: <20211012072428.2569-1-dongli.zhang@oracle.com>
 <20211012072428.2569-2-dongli.zhang@oracle.com>
 <4faf461f-49ca-5f2b-a7dc-e2b47b904527@oracle.com>
From: Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <e4727868-cce2-d705-c84f-1d66204c7814@oracle.com>
Date: Sun, 24 Oct 2021 22:20:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <4faf461f-49ca-5f2b-a7dc-e2b47b904527@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR12CA0004.namprd12.prod.outlook.com
 (2603:10b6:806:6f::9) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69ec7a55-bff4-48c1-7bf2-08d997772ea5
X-MS-TrafficTypeDiagnostic: BY5PR10MB4354:
X-Microsoft-Antispam-PRVS: 
	<BY5PR10MB43549C5611F2E4BD69EF81E7F0839@BY5PR10MB4354.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	abZRiZ2PzzkT5CHiyzB+ROlaVtflBZIedj3crPzL6tY3v/vWTOqpZ5X+vMA34Cn8mXXKjC2JJZM6xT+SwI/dxbVImL2pW0opqfjRMBHoQ7d7Q1emxTplMlzZN9JsLD779dJnUdg4O60k69vLwwZvzpQ91lHhGs+vv9akpJpBju29dPM5myM+hPrmjZMsvFMG9HqUn5DVP9A7JVJjYcq2X3x69McQ5rLIZtaqKMANadXuFKcI020oBfBsUJ9YmxOBzrM3YdxpiXmPbzH0KRQE3YQUpFoFU5RvNGJsAF31jYgRppMZ86YO1zcGEEgcRM9hunRDHf0QO1CFYSI5Trfi7qYTdXdNu8PDjgZ6xsWQKTVCoCEmm4Y7wK12+GgvBzX+IRH2L51vhcDWsPzmupd5aMedJlkvLt64sTKy8Mnjyb6bXC052hUo52Q2vEi8RSLUjK8FfUgliFkhaYK/XtA7c5Yrck3/cE9zByhy+Qvb53LfUyDNc4jQ/Ix+/Wr+L2IhXMMmivmnEsjTudCulaiXXMuJ7gQ+bHpARSZIuwmWzpUkKFE113b8bqBadyVxUyIbjSBmkPyOOMrK0DXPmFDlVpdmVUhUcIdLJCcbf0pFBdJck2omeP0ZDc1lZVTc1xCI3QZqQPN9oY/XUHvHckLEwFqZCc8K2+W5+Mg9XeZynCkTPGd6RPiI0JQmdSjI9A0w1bGCS9OTTHiA2dkfMSrrqj6jh3eHwKKI/tQcJ3BzqrE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB2663.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(7416002)(508600001)(186003)(36756003)(44832011)(2616005)(107886003)(31686004)(6486002)(38100700002)(83380400001)(2906002)(66476007)(4326008)(5660300002)(86362001)(316002)(6666004)(31696002)(53546011)(66946007)(8936002)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dnNZaDQzV0J0Y0Mvc1Awc1JxVXl2YXgxWSs2RzVDQXVOdkVXaUgzQkNZaFNr?=
 =?utf-8?B?aWNLMWsrc2hMWHg5T2o1RFlIdlJkYU9tWUducUNITkdFMzZkdlNBQ1RVUDE1?=
 =?utf-8?B?R0E1VmwxRGxiS1RJYzVRb0NvQzdjb2R2MGc0QXpXV29NRWY2R1pJSTl4SExE?=
 =?utf-8?B?MDE4b2R1MnhIQ3BPS29ydXJuV1RUTUNUSXFuYXZScTdDM1dWOCtvY1Q2NlNl?=
 =?utf-8?B?QTRYUkRNSW85TU1tclNCeTB5cElkYXloOFlIa0p1TVlUUEJUektYNVBnalMz?=
 =?utf-8?B?RWl4cXNOQ1Z6ZmFnM3hSeVF3c0dpRUlnMHVRcjk2U0lqUzBkWTBJM2JrRjJl?=
 =?utf-8?B?MnUzU0NBQUxhb3JCQVJEWnlRSEw1TkdsL05tQWxFSXJXUmVpR1RIK1pOWFNR?=
 =?utf-8?B?WmpZNithM2xwYUZoOWpucUhBRGVUK1NsQWRNM1JlTFM3M0JIU2JPOC9BVk9l?=
 =?utf-8?B?Rk8zNzk2NExqdHlSSVhkemM0b0pxSDNhVzF1T0RrZkpFamozQi8zYlZqcWo2?=
 =?utf-8?B?Ym1hR0xtQWFDUUNtbUJ5S3dtT1h1RzNqR05rNHhraU1BRGU1eGRubGN6MTQv?=
 =?utf-8?B?T1F4aWhQakhjd1BJQ1ZISVJyM2lkRzdvM25VSTJjMGZIL3d5UHJDemovbk1u?=
 =?utf-8?B?dHY4TDBOc21TWlVuUnJ4eWNqV2o1bzVFWWRMOHlibmlWYkx2K1RudUlxRnVt?=
 =?utf-8?B?dlFjQStLK0dRZnRmY0lESXJYamJUUTBCUGx5aU9tbGFPR1J5cHdmUzZvUTJl?=
 =?utf-8?B?STJkU0JUSTJTOWRXbTRLZHFSS2p1NFBReWY2VVFMZVpoTkN5czNJazNyQnZD?=
 =?utf-8?B?cXlybUpaaHJzcDNieURaWEsxTkc0R1YzdWEzVTdqZ0dSeXErd083OFdpZHFa?=
 =?utf-8?B?SDl3ZHViSU11eE1YTno4enp2Yy9TOGlhYlRLY0xUL3VZQjVEeVJpTkpMYTJj?=
 =?utf-8?B?TjBXRXZUOVJDTjFFK0JxQTJjYWtYVHMvb2dsaVhaWkhlSWZVSnh3NStBMGlQ?=
 =?utf-8?B?bXl6dTlRVzB3K3dxamh0T3M3N084N01WMGJJSjhrZ3RKdkJ6VmI2WVIxQy9K?=
 =?utf-8?B?Q0liaWlHU3NmT044NmtHdW0zc1pwRTZjU2p0aGt5SHk2YmVzU1FERDVtVVdE?=
 =?utf-8?B?bUtndStybDNpUnoxREtJL1dPaXVxZi9ob1B4VWUxa0c2Vnk2bm9ZRGxYS3Rt?=
 =?utf-8?B?djlwYVpDNGJBeDdSK1VWckdsMnlOQWpnejJpaWtCUUFjQWNrT2p0Y2ZqWGZF?=
 =?utf-8?B?ekRjQkZZNFMxcGpoOWV4akh4Yk5rOUN4cXY0MDNvMDRxRjNkWldSQjdObTBa?=
 =?utf-8?B?bXpscGpKSUxSakw2ekpEYktYeGpRc2RTcHByMTdiSHVJZ1FEL2RqQW16ZDZ5?=
 =?utf-8?B?L0dENmwyOUxIQ0ZYUTJ4RWtRVVhLWHBnZmk1cXZuSGpRRHpFZ1AyTy9LRWp6?=
 =?utf-8?B?S1pZc3VKWHFZUktYbUNlcytIU3hzemd6SStrZnpnOXBORkNBc3grU0dZbXRQ?=
 =?utf-8?B?WHF5N3VBNStwTHZxY00vNDRPdjZQYW9BVnRoQW5TVGh3OGppanV3ZWN3WDMv?=
 =?utf-8?B?bFlXaXpNWU9pbnNRS3U1Y1ZhZEZmS0R3TENmdjRpRDh5bUQ1elBHdmNidnZ2?=
 =?utf-8?B?eFNyTlhNQ0tjTXF6d3lWbnQ3dkNIQ0E4YjE3UWdpdmRNTVVjbFNPS3N4bG5S?=
 =?utf-8?B?TUJxTUFubEpiQVpucEtNeWVXMkZyaW11aUVpeVF5TFd3aTJrY01wNmJBRWti?=
 =?utf-8?B?blpqajlhdlhtb3Y0d3lQTzY4cGMvZ29RcFNhTkMrejJtNzNwQkJ1YmxVSFlO?=
 =?utf-8?B?ekpsK0hDQlM0bUhQOFZrVG1IS2todnZxSmptQWQ0dlpMdXFVWWhqK3IwanNC?=
 =?utf-8?B?ZnRncjBWTGtKU2RRR0RiM0hMc3pEbVRRMkFKNS9KN0I1SStxNE9VUWRlcVpY?=
 =?utf-8?B?YzlKK3FoWkN1dEVwZVF5Yi9wWmlHaGl4SUp0WGllaXc4aFhqNnJNZmY0MXRX?=
 =?utf-8?B?WVdnVHFBdzZZblJPVGowWTRZR3VPQ3c1L0gvWlg5U2JMMDlIbEFiQjFhK2d4?=
 =?utf-8?B?TDZEeDU2ZGF4cUw3dURQa0ZXS0RybEcxUTZrczdvSDRrTnQ5aTRVZ1F6NnE0?=
 =?utf-8?B?bFZKVlFsQk8yVVNCVUVoc0JZRFBhNGx5U1l5YlY1VTJDdEVoVytyWkFLbStE?=
 =?utf-8?Q?lqEdKop19Mv4Qh6JdFf4OuwK5WvuftMu8cLELKOuG1Ho?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69ec7a55-bff4-48c1-7bf2-08d997772ea5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 05:20:39.1843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fSaXwrkX8hKQIT78nVwVzB+QS/NwOi3p8XBovCFR3Ryq0AxrTGc2d14KyrwFqfmXgSG05Ql04LsEtt7q7TQ+xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4354
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10147 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110250029
X-Proofpoint-ORIG-GUID: Jv6xc1rSMIM71tnBkZvx1F4rNsixY7bV
X-Proofpoint-GUID: Jv6xc1rSMIM71tnBkZvx1F4rNsixY7bV

Hi Boris,

On 10/12/21 10:17 AM, Boris Ostrovsky wrote:
> 
> On 10/12/21 3:24 AM, Dongli Zhang wrote:
>> The sched_clock() can be used very early since upstream
>> commit 857baa87b642 ("sched/clock: Enable sched clock early"). In addition,
>> with upstream commit 38669ba205d1 ("x86/xen/time: Output xen sched_clock
>> time from 0"), kdump kernel in Xen HVM guest may panic at very early stage
>> when accessing &__this_cpu_read(xen_vcpu)->time as in below:
> 
> 
> Please drop "upstream". It's always upstream here.
> 
> 
>> +
>> +    /*
>> +     * Only MAX_VIRT_CPUS 'vcpu_info' are embedded inside 'shared_info'
>> +     * and the VM would use them until xen_vcpu_setup() is used to
>> +     * allocate/relocate them at arbitrary address.
>> +     *
>> +     * However, when Xen HVM guest panic on vcpu >= MAX_VIRT_CPUS,
>> +     * per_cpu(xen_vcpu, cpu) is still NULL at this stage. To access
>> +     * per_cpu(xen_vcpu, cpu) via xen_clocksource_read() would panic.
>> +     *
>> +     * Therefore we delay xen_hvm_init_time_ops() to
>> +     * xen_hvm_smp_prepare_boot_cpu() when boot vcpu is >= MAX_VIRT_CPUS.
>> +     */
>> +    if (xen_vcpu_nr(0) >= MAX_VIRT_CPUS)
> 
> 
> What about always deferring this when panicing? Would that work?
> 
> 
> Deciding whether to defer based on cpu number feels a bit awkward.
> 
> 
> -boris
> 

I did some tests and I do not think this works well. I prefer to delay the
initialization only for VCPU >= 32.

This is the syslog if we always delay xen_hvm_init_time_ops(), regardless
whether VCPU >= 32.

[    0.032372] Booting paravirtualized kernel on Xen HVM
[    0.032376] clocksource: refined-jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 1910969940391419 ns
[    0.037683] setup_percpu: NR_CPUS:64 nr_cpumask_bits:64 nr_cpu_ids:64
nr_node_ids:2
[    0.041876] percpu: Embedded 49 pages/cpu s162968 r8192 d29544 u262144

--> There is a clock backwards from 0.041876 to 0.000010.

[    0.000010] Built 2 zonelists, mobility grouping on.  Total pages: 2015744
[    0.000012] Policy zone: Normal
[    0.000014] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-5.15.0-rc6xen+
root=UUID=2a5975ab-a059-4697-9aee-7a53ddfeea21 ro text console=ttyS0,115200n8
console=tty1 crashkernel=512M-:192M


This is because the initial pv_sched_clock is native_sched_clock(), and it
switches to xen_sched_clock() in xen_hvm_init_time_ops(). Is it fine to always
have a clock backward for non-kdump kernel?

To avoid the clock backward, we may register a dummy clocksource which always
returns 0, before xen_hvm_init_time_ops(). I do not think this is reasonable.

Thank you very much!

Dongli Zhang

