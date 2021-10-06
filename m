Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5344B423DEF
	for <lists+xen-devel@lfdr.de>; Wed,  6 Oct 2021 14:44:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202907.357923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY6H2-0005qt-9s; Wed, 06 Oct 2021 12:43:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202907.357923; Wed, 06 Oct 2021 12:43:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY6H2-0005oY-6g; Wed, 06 Oct 2021 12:43:52 +0000
Received: by outflank-mailman (input) for mailman id 202907;
 Wed, 06 Oct 2021 12:43:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h5pW=O2=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1mY6H0-0005oS-9k
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 12:43:50 +0000
Received: from mx0a-00069f02.pphosted.com (unknown [205.220.165.32])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0d3d7c4a-26a3-11ec-bf63-12813bfff9fa;
 Wed, 06 Oct 2021 12:43:49 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 196Cb86r024850; 
 Wed, 6 Oct 2021 12:43:42 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bh10gc244-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Oct 2021 12:43:42 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 196Ceh3o129747;
 Wed, 6 Oct 2021 12:43:40 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
 by userp3030.oracle.com with ESMTP id 3bf0s8djae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Oct 2021 12:43:40 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BL0PR10MB2818.namprd10.prod.outlook.com (2603:10b6:208:72::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Wed, 6 Oct
 2021 12:43:38 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329%5]) with mapi id 15.20.4587.019; Wed, 6 Oct 2021
 12:43:37 +0000
Received: from [10.74.97.159] (160.34.89.159) by
 BY3PR05CA0017.namprd05.prod.outlook.com (2603:10b6:a03:254::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.16 via Frontend
 Transport; Wed, 6 Oct 2021 12:43:35 +0000
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
X-Inumbo-ID: 0d3d7c4a-26a3-11ec-bf63-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=TvBLmxsIAS/sKjJCbLdTJW8Coo6jE/9ghCpgAZ2RtQc=;
 b=kXsr2A3ljdbURVmORafnZoWLJPe1prBPtwekQK/T/PF17YZQxfYG2O3V9O080Paua0Cr
 Tyui8uLe8f0n02KshBLNmP4VcN1yM3fo4Adn5nWOVsgwtN+tGloFOBNO170eNsT7Vme3
 yPT2exdOoSZ143S32E0r7duR6Bfb55ot8UnAzw6gR5TS6t1gROcGacU7Ot2Ez9BsjhG1
 E49Crm3dCKAOdAq2LcGmV89ReizWCupfDdrjF0NQNSl8rBS3RKW0egm+peBBpuYWOajv
 bDgfrLROPfqfyfH8qe1ajHs/bYwQNtN9FG5TDIiGuhyfg4uarTL5b9P8oiHlS0B1dczd JA== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/U+DPe2hyblPI/x9Pcup5QAvTYKwLKYFwRAUX1kIoi/m8LhfXaiP+yFebdVcUVq2wo76otDtEmFVYOHA6NVuBvycvC8im40sHTRStIOChBpo1wOxM8gSQQvocCRnlL+i3/kzSIS7nxBBW54dGK3dz9KVth0tOWHXlHSPRnVfbKuzTk0XNEut7Qfr+LB8KALHvDFGwXUudWFjrKxZcGyK2mBtbYkTBbtpwOGjTbVYc8MF6ituCqTF/2NrWPZ5jxTOzHTTvjxhXjMP1cb3FgGI9QSEYeZ+qaJnz2RjA48HZn1WgibplQ+AdYgu9T9epiVq6A5SBhe3SfEwnFZfpIrMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TvBLmxsIAS/sKjJCbLdTJW8Coo6jE/9ghCpgAZ2RtQc=;
 b=FC9m7x+a4mst9gc+PTalAPWGg3iQ7dAbbXTtSeJxT+6yBzOKojtO5u+uCOOkYGOid/t643L7oi6Or7PMEJB50uDwrdyrW7MQo7G0lBtQI9oeNkIqR6SWP63ZqNqyi6DsU6acjgQeX9KtK196Q8C8Ck8cnSNz1c1GffGhCqnyu8yZFsL7FPK/IMo9Fco3YjNl7qm6N4zpqm3wDDgXAFvFbXm8PH+xetY+wuCH8wgnGfsrHiQXChpLE0eRb9z7V1c+5Exuw+SZEYOnBtT2kEJqcCJpXuhUdLrVSj9+MIZFJiMrzYU8Xl/Ahzy5FuROFfPTCzzOXuzZY6WeAr0rTENBkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TvBLmxsIAS/sKjJCbLdTJW8Coo6jE/9ghCpgAZ2RtQc=;
 b=LXd4N5zCOfKU4tLGZ63SP+zqHnLmq24QCtm5lzb2CrYS/QNDpkKrM35kSzt2zNPBytpnXow6oaY8HEGQ7+RxlO9BAyuzX19XR0gMIakkIxct8fTlzOHB01McOBzo2OxSsg5xH0mWhRWiB7Pc2w9qDwt1apLIqst9Whe9M1GRcfU=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH] x86/pvh: add prototype for xen_pvh_init()
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
        kernel test robot <lkp@intel.com>
References: <20211006061950.9227-1-jgross@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <5164486e-b6d5-035d-5eb6-ec03a04284d0@oracle.com>
Date: Wed, 6 Oct 2021 08:43:32 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
In-Reply-To: <20211006061950.9227-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: BY3PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:254::22) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e32ae396-5958-4f90-07ef-08d988c6eaf7
X-MS-TrafficTypeDiagnostic: BL0PR10MB2818:
X-Microsoft-Antispam-PRVS: 
	<BL0PR10MB2818CFE54F5614239B1889208AB09@BL0PR10MB2818.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:486;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	58uZ8QMEQAznHJGok8IXSkqa2byUVOSwiUK6LuhRn69Rb1QKzAc079coBY3AumgKrnNhojC075cJuuO5Zz/dvVijje70u/9lxZTr9SA9rWxmQNDiH3jNOwCviAUBN6EehR070LKku+O2LGp+W0KZF7mB7ZllGyCOkJN31nCRQjFcdp4boN2JT1F+U3L4vegjyOtIIZbRV77+kwz8WL1bBksfW0yDO+zkjpGe7m4RG8mj7rlHryBfO+OEwI7erg99rHhrzpNBTF6GX9QF4pUQDbztZulYy/0g0116+3CYnC7u8Xa/Gr5qRJ4uHyUDFO+eA39dnCM/TCNuHVEVboBDc6DDAmJ6pDQVfP4KoK5XcYO+SeXYlBzGJoFGs1hOuSB7wezBcc2uidSH4LOYpW0/GOJWdHohb4UoXPEVKq58yfFslPV7RRCR9KmGpXWvqifC+4xCfbgvpUXj9PxPQ8JeebG1r8ES7mNZ8g8l5Dw9ycrQu//qJh2zya2IjYwxVrLfYW9mNo8kNkR8cilwfS5cubVh1Kr7Fa5EKhVK9J2qLn20bq/aSY3PaEMc3z2VgMR2s+E7bETssRusMZ8JHIwgD8OPqW9zKhIA1z9/UcKMrdaORcMMr6MmlQm4TuiYBMhiL0cg2raEnAmMCu9YtR6t027lcipQVHAcXwjqn9XQ5LE+fxhMbQwALAWwfpqJ2VX9ORViZHbgL66QDKMbDMUdbZ+42/XaJ6YCi65xKoWwAW0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(558084003)(508600001)(31696002)(4326008)(5660300002)(8936002)(8676002)(54906003)(186003)(66946007)(66556008)(86362001)(956004)(31686004)(66476007)(2616005)(316002)(16576012)(26005)(7416002)(53546011)(44832011)(6486002)(2906002)(36756003)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b0kvL01RcVgvZnltNnUya1BUNGMrVEpsWjJ0REFLVnF1SGxBOXpaaVUvd3VZ?=
 =?utf-8?B?TzdZa3RzZXd3U1o0bkxNcTduS2NHbVI0UGVGeTRCcU5yUXVGanZrYXFHREw3?=
 =?utf-8?B?eEhQN3dWZVRvMVltUTl6YndsVjhVbzZyQVB5ZU1wMVU5VDJycytvSmhJMFRz?=
 =?utf-8?B?V0hXZHRlVkg0Mmp6RS8zZ05CL3ZxMFZlUkRObDlIQzhBcitGQVlaQ2NhU3Vl?=
 =?utf-8?B?YnB1bzg4T1lyT3JDRzZyTTd4M1J3bTdUVFB4ZHJkQll6UUdZMG1XcEEyYk5K?=
 =?utf-8?B?SUhFSU9GSTVmeVlFZitXcFMzRVZObXNTeTdxNXI2UVF5VlVVZWhDZWx5N21i?=
 =?utf-8?B?MW5oTGNRbzFRNjBzUHU1V0ovcnZTMDdOWnhlL3VGNUNXTjgyOGhseVFPRWNx?=
 =?utf-8?B?Wk03bnlJelN5UkFjdHJ2UGlNTElmclBDWU5KM1AxQWovUlBCSlE5NlkvVDB5?=
 =?utf-8?B?TzVrMWZ4TlpYN1lXZEkyWm4rV1lZV05kRG5KNFQzamV6NUU5bjNNNEdUN3NT?=
 =?utf-8?B?dWNNRU1TdkYxYUVLT2FTMTVBblpwZzlsQVlzTkhPbGNSYUtoYTIxZFExbEJ4?=
 =?utf-8?B?NmY2SUxOUXZocVB1eXJSbTg1eXJJQVIwWkJHci9jR3lYTWVEdll3cG01Z3Rj?=
 =?utf-8?B?cjViWGhsWmdocW9zN2xvNjJyQUowZW9SZXIzZFJJbjM4SnNxcU5odjNZQ05y?=
 =?utf-8?B?NTIrMXhLZU1FYUxJKzJWdk1nNkdUYjc5NDFaVWVnY29nSFg2aEl2RU9TNU9W?=
 =?utf-8?B?S1hNY01hdituZzJzT2lsc3p1YlRkRWFScnAvOFl3ZFVnamwxNUVOdThmeFFD?=
 =?utf-8?B?enZlSzB1Rk4rcFAwOHVJUnhRRlZoaTBRQWJrUktmdUpTM3dBVVFIRnVJc3Fl?=
 =?utf-8?B?UFhLT2s1NlByZXlPK0JBYWRuSWcwRlNkbVozNkVOUyt4bitvL25XY2JDOEdP?=
 =?utf-8?B?amptZ29ONzJmaUVVaitlQ3phMmkrMlNBeWRadW1ON3B0ejI1NEZ3YTRnenUw?=
 =?utf-8?B?bTF1Tkw1dXN2VkpDN0hZVkw5d3ljRVF5SmVzbFQvRDFSMFVCNXA3ai8xeXB3?=
 =?utf-8?B?bUdyK2ZXUUI5aXRLK0J3NW5qYk41cm00bDIzcnVPQ0ptV1J0KzBPc0U4ckN3?=
 =?utf-8?B?dE93UzJ0cFFnVGtvTTBJRTFCZXVabnkxZGlzZjRTcnJjYno2RWtuMVVwMkMr?=
 =?utf-8?B?cU1RU0N1ZExRRHhyb0lhWnpyYjVmYmZMVmxtM2s1UW44VFljYnVJVnNBVE5J?=
 =?utf-8?B?a09BV0p1Q0xoTGdqb2dmbEpBS2lDK29vUm5hTFViTm95K2xkamVrYzFuU2M0?=
 =?utf-8?B?SWpDWnI3dE5WUHBncjhJd2RFMFpEU2VaOHJkREM2Q3lhbXVTY0ZTR21mQ21O?=
 =?utf-8?B?bzFPTS9QNkVkRHlMQ2ZHVHFvYXRyMTZWcXNzYStFMWJqbVlSZ3dkazFFOXVB?=
 =?utf-8?B?czlvOGNPU0hnS2s0RXRURWl3U0FFRjA0bzVpSzQxTGRESHlnajVYbTdmdUM2?=
 =?utf-8?B?dzAxLytxWVpPWTRDN2lwaDhDWTJaU3ltdzVGYmF5MEFtUHBvWnAzWDZLUjFk?=
 =?utf-8?B?MW9rOXNaalhlOVJENGpDc2pSbFh1VldxM0t2ZXBPbVl6RCtUZHBKMFYweFZR?=
 =?utf-8?B?VlNzcWJMVDRxQ3dmV1pCbUY0cUVremlZNTJFSHJMV1BtdWo2RTdZR1BKZWkv?=
 =?utf-8?B?VFBLS2JpVm1ZVDE4R3pMSURFV0ZpT21YZXR0MmpJcXZaa3FDdW5kcjQ4Ly8z?=
 =?utf-8?Q?Q2wtLHICMlC3REG3rKsjCpxqWXwP0cbt3VmdW9Y?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e32ae396-5958-4f90-07ef-08d988c6eaf7
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 12:43:37.9413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WsJgIKxZhlAoZkkpjWRqsag4kIiiaSQRYjhIv2dU7QZZBxbtdQ8S9wdtDDfu9Xjzak7cVKdplDiQt0gJoFLQIAh+mSfK+Wu0XWPImUpg75c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR10MB2818
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10128 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 adultscore=0
 mlxscore=0 phishscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110060079
X-Proofpoint-GUID: Jvtsb_5WOjBe9zqUnxy3OilB0n7KhK2D
X-Proofpoint-ORIG-GUID: Jvtsb_5WOjBe9zqUnxy3OilB0n7KhK2D


On 10/6/21 2:19 AM, Juergen Gross wrote:
> xen_pvh_init() is lacking a prototype in a header, add it.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>



Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>


