Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AC53428FD
	for <lists+xen-devel@lfdr.de>; Sat, 20 Mar 2021 00:01:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99419.189108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNO6P-0006Ox-Sl; Fri, 19 Mar 2021 23:00:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99419.189108; Fri, 19 Mar 2021 23:00:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNO6P-0006OY-PM; Fri, 19 Mar 2021 23:00:21 +0000
Received: by outflank-mailman (input) for mailman id 99419;
 Fri, 19 Mar 2021 23:00:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z2B3=IR=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lNO6N-0006OT-BC
 for xen-devel@lists.xenproject.org; Fri, 19 Mar 2021 23:00:19 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 48df2e68-4d2a-4620-9c73-fe644e4389c1;
 Fri, 19 Mar 2021 23:00:18 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12JN0GpG068496;
 Fri, 19 Mar 2021 23:00:16 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 378jwbvj5q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Mar 2021 23:00:16 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12JMxkif097195;
 Fri, 19 Mar 2021 23:00:15 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
 by userp3020.oracle.com with ESMTP id 37cf2caf3k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Mar 2021 23:00:15 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by BYAPR10MB2631.namprd10.prod.outlook.com (2603:10b6:a02:ac::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.23; Fri, 19 Mar
 2021 23:00:12 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721%7]) with mapi id 15.20.3955.023; Fri, 19 Mar 2021
 23:00:12 +0000
Received: from [10.74.102.27] (138.3.201.27) by
 BYAPR07CA0038.namprd07.prod.outlook.com (2603:10b6:a03:60::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Fri, 19 Mar 2021 23:00:11 +0000
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
X-Inumbo-ID: 48df2e68-4d2a-4620-9c73-fe644e4389c1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=oEXYc3RG3bs8i4IIp7BuuahetRs8esN7ZssVDIZ35Ns=;
 b=Ta5THl58Ud1NPKvRLG5aZrNZfrNdhu25fFHU8b4GUbXhZFKHolk6difTqXpu7qPIj9My
 UhAEnSap7lHzjdGvIRZEx79h02HA9rCzUvJAHGyus7KuJH46U96tpTZzOMhbB53dltdV
 JVaVor9scSCgGYaJHz3YPVgIteLECKlhRanzTrrUTmbrzNyU1q/DBXHapmi2HEoQWVrA
 usaFob7WhgQwJtXP8LgCznn6CqEwyJaKl7oCLUvJ6ounOcLnu7Od9h0JyimZfh3GpW+Z
 TI/laDRaDnTVpbIPf0FFYgVgQMXBfoCPf0c7hjGUJkUNcdZ4icjbcha7GuF0rjO5D568 KQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=avZCpA5/Ng1RWExGr+750ev24BxNZXrIJ5zHKFqpi37wrVSykzWg4GcN1w1Hp59O+OZv18tW1SijBrsG+CcBb/HsY5AqT0/7IDXt4XUz69rFNy0DJkXLFQ3JmCi4t5H0OK7Uj/cVyOli1c9Rm5tmbZ2gIpzCAXM1Khkbm1VZg+PaQwThW0myh+DNfEJCznjLa2chfWdL6OawbjsunNGzSU/JqOAP2yLtZ/1JY8ffTseEc9DXZ/U50E9bCSQFa5L9TVqe8VWpf6grPxMN9ZxwSEkbJqLA2B8mNUY87d0CWDWn7eThZj0MMfIx6H7X9lOQi906EgIsycXSeilxiyfnkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oEXYc3RG3bs8i4IIp7BuuahetRs8esN7ZssVDIZ35Ns=;
 b=FeNyMeVqLnaGdjZ3XhTRUKUSgZ1AA2IkLs4lgQKiEH0yV7+iDg+rVVNNFqKDTu9qjN3xyVhMgUBB/iW9yi7DAFDPglHMpdqoK8vDPiWjHUqOq+so3vc51MXDb7fkaiRxFkLO9wBqv+oca2/Do0aNZCRQ6w5ZuWTna1k4Q0kZ9LyaiAzO8J9As9diw7hwGcH2miTbTn+shlp4RaJZb0sP9aZzMbQUYhYtBGuOroGB2DUn/zPriNXXmwKb3RLoSge2n9JnUC2mVE6Nt1yCyDAV0PUoZalC1OjyFTWgOuM3V7R2SQ87A+Qh+g5vtRHYTh4dTh8ttpWyJtjMbVyxWy9LRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oEXYc3RG3bs8i4IIp7BuuahetRs8esN7ZssVDIZ35Ns=;
 b=rTHnMblV+CsL7q/f58K3uAa29qvQNlsfCYo0+ZIJxLYedNK2rh1VGeBLYJ49IyhidVhOWLhEYAfpWvN5VrNtIPVW3fSExUqt1uVO5FJCn2Ff6BeyhIY3ii/ytZI0DJc3SCVxPrulnwN5UhPWTpwtz93di/NJ8cH7J6F6dKD0Mx0=
Authentication-Results: xilinx.com; dkim=none (message not signed)
 header.d=none;xilinx.com; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH v3] xen/arm: introduce XENFEAT_direct_mapped and
 XENFEAT_not_direct_mapped
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: jgross@suse.com, xen-devel@lists.xenproject.org,
        Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20210319200140.12512-1-sstabellini@kernel.org>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <bbee061a-065c-ea5b-9792-977e3ad6c660@oracle.com>
Date: Fri, 19 Mar 2021 19:00:07 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
In-Reply-To: <20210319200140.12512-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [138.3.201.27]
X-ClientProxiedBy: BYAPR07CA0038.namprd07.prod.outlook.com
 (2603:10b6:a03:60::15) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19e62573-fa8a-4da1-8688-08d8eb2ac043
X-MS-TrafficTypeDiagnostic: BYAPR10MB2631:
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB2631C3CDCBBA926E6DA33D218A689@BYAPR10MB2631.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Bg+FA5UaHIoWMwUYv3Mc8suMf7sF+p0zMSbQ3u4cIHbt9ma7mSsUeZq5GlrE8s+L+IEDhhUKDiV+cE+VBBJ+IzKpsgqIp1n+ISPWsN/k5FFhS/Uhg8AjnJplQzIG61AhoIHawC0TwDl1ZATAREfbFSKnpsiPHbNuR666DWjQAjJR+71s0s2zo+V1hfnap9FZCp5Ihspzm6CtbDzdJlPO1EqI4MTSIid9F476h7+edzb4j1j24mJygLIsEFloaql3V+XZMm5sYWP/0fDDA97gpqfDahOamUawrSsceOfsDcJ/dyyJvOUakBTKEOqyYSyB01kE5Y06VHD7uLHW8QSS5JocUuZSU4OQxFoi4EI1B2u7tty+Qjt+mBlA1L/u/i/hqAwr9V6OeuLJ9DUS7vXMQyTTdz7WcI++CLWKmjAE3fTgsMdUsjahTxuobLL7b0i/G+HxQyIIbLJrnHprRpTtobw/WvXcH2DfyIGcdNhDTStMoW4/qcbZ6q0/91W9jzBH8p/oAKL1PyrqyDGE5hVnxDDHxwY5WZJu//wRX3utAt6Dn9EkHBrvQtrdcPHyzrluiK1Drc2AUfqrrFxh/TH1o8Gl/uIwiM5DgFzil0yL05a/F4ZOxdZmrUuOkjjjtj2BwsZbcAL84zHAHGZqlroJ2GDKTrnVeWylXtJZpGVt5FhExYZEM8GbBMpjGHbAyhds377CwpicZAuQqR7xa/tdlHXJ1XladNLgkj4sclA+hDo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(39860400002)(346002)(366004)(376002)(53546011)(83380400001)(4744005)(5660300002)(31686004)(26005)(38100700001)(186003)(2906002)(16526019)(66946007)(956004)(2616005)(4326008)(66476007)(16576012)(86362001)(44832011)(6916009)(36756003)(8936002)(6486002)(31696002)(6666004)(316002)(8676002)(66556008)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?Z1l2cFVWc0d2VzY4VlBBK0JXSFkvMERyYldvNVlGR2RzMUZvYzEvY0pUTjVz?=
 =?utf-8?B?RVNLbE9EOVM0em9sMDBrZFJ6QkFZd1lFSDBwMTVSUFNYVFNoMThsWVBZUmgw?=
 =?utf-8?B?MEVDSmt2TGl2OFpkWE5WMitUTUI3Vk9Ga2dDeVd2QnJCVlF3aHVCRy9XS1Aw?=
 =?utf-8?B?SHd6dHlTZ1p2ckRvcUdaSFF5d3NqeXVUYkIrZnJpMWNka2hUV0tkWjQ5eFBj?=
 =?utf-8?B?K2xUbVMwWXBERlduYkcrbG9jMmRDRnkzV1BxT2FqRXAzWW5GdGtmR0p5enFZ?=
 =?utf-8?B?dEpZYWc4bkNNRGZXYVd4cUloSXpHMW9yOUw4S3VGYnYwNDFjOXIwUWx3UEtv?=
 =?utf-8?B?VXh5dURjbUIzMVlNVkFDeE50SlBwbE1hamwyNjJYTHVhcmJWZE0zWXNqYmg2?=
 =?utf-8?B?T3VsNHhXM2l1ejRXRnZqVHlXMjNFRnBNdnlPYXgrakNGQldFWE5teFR1Z2tY?=
 =?utf-8?B?QkFUNXRPRi9hOHpvL1dZSUMrYmNPc0ZUbGw1SUN4QWxweDlXY3puWGozWE16?=
 =?utf-8?B?TXhkdWFTQVhiakdKc09FYVVYdy9RL2ZsZkFQQUJ5UHpoZnl0cXVDTHR6Yity?=
 =?utf-8?B?bUh2RExaa0ZYU1ZxVTByWVIxemlBTzBUMEp6WXR5dmhLb3FJOVovY212bTZD?=
 =?utf-8?B?SHFMQUZCaFlrMHdCU2dWc3hHM01kTUFoWGFENUg2Y1R3YitEbDJrUmpZMXhi?=
 =?utf-8?B?TzlZZHBkTFJrdHJvYk9sY2hENVJuL05tSnhqSU1mRFk1RithSVZ0aGp1STZL?=
 =?utf-8?B?cEp5bGltcHhzcHFYZDRZRkhzYTdWMmE2d2s2d0MwYWNYekVyZWdETnJEZ0lj?=
 =?utf-8?B?c2FON0dlZkovYWlTdE1INk5CWHlqVHovOUhYWTFXeVlYQTZDNDZVQVNYOWZ3?=
 =?utf-8?B?d1dmZC9yamxMc2ozWDdDR1NUVnRMU0ltWm5FY2JKcU5MSDVmVzlLOVFYWkd1?=
 =?utf-8?B?THBGTkZDb3ZVSGU0SnRGRmp1Sk1ZMEVXWlY1YmhNajM5UXNzN0FwV0sxblZN?=
 =?utf-8?B?OVpYSHMxQWpGRkpBS3NwbEwrcDZCaE5Fd0lLMStSR0VRUCtOQVNtVjZsbGVJ?=
 =?utf-8?B?eDZBYjJTZlFQYnBzV3JxU3k2YnpMN0FzQkhTQ3dKNkJCeTMweUd4WGRVV3NW?=
 =?utf-8?B?YnllVVVDWXdKR3dLWFN4Z2k0NVlDSm4zYWdNTUFScjZrVy9KRWN1ZE5PbnZ6?=
 =?utf-8?B?b3g3c2JwbENXVlE4S0l2MkxqRkh0cFhrWmY4bWhRUlRRTkJBNnJaVmp1WGhF?=
 =?utf-8?B?V3ljWDVXVmtiSGpETHRiWld6U1IrcmRCSXlQSzNGZTFGNjFhaFltZEpoc2hR?=
 =?utf-8?B?dEtqRjFlY0tKWGhTZmREVnRzaVBQcGsveFpJUlRQbS84VjZpVW1hQlBaeG55?=
 =?utf-8?B?OVlMWmVXdC9ub3lMNXhGUlA0MHM4RURFWkpSK1piUnFOa3Qrb3hOVHEyZjF3?=
 =?utf-8?B?UUZ1ZW11bEVNbW00RGk4UTNqVG8ycVJoamEvZ3JnY2pDdi9PSmpEaVluek5O?=
 =?utf-8?B?cmQvRHZZVEo0Unl0UUFaSG9rd1VBUml3bmN3QnlPcC9MU3pkZlU2S2E5aXph?=
 =?utf-8?B?UkxBa1BRbzZGeTByVjhSSFpPWHJuS2QvbTRNN3dvV3M4RDl0ODUzRGIrMGFH?=
 =?utf-8?B?aDVxdFl6VXUzaElGcEVob0JncHB4Qzd4NWhiL0ljT0VNWFR0MndUYzhBSGww?=
 =?utf-8?B?dHN1YVhKcXk4QWNLSkJ2ekdybVFXaW9mU0hNd2UzOEhVNnhKRkFyVjdCajcv?=
 =?utf-8?Q?s7vYDfiFXWBo4qH0bnlTsi2w4mm5RLrxmdaE8bk?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19e62573-fa8a-4da1-8688-08d8eb2ac043
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 23:00:12.2018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hM8YTuRyfk6bdDqFyr4suOscSJp/PN7bMsqqDOxHB5zE876QLCiuXxn1sj3j1Fs0eupqxIdHfcvTt+hJ+HYiFRepw9tphWHY+nN2jacMhzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2631
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9928 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103190159
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9928 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103190159


On 3/19/21 4:01 PM, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
>
> Newer Xen versions expose two Xen feature flags to tell us if the domain
> is directly mapped or not. Only when a domain is directly mapped it
> makes sense to enable swiotlb-xen on ARM.
>
> Introduce a function on ARM to check the new Xen feature flags and also
> to deal with the legacy case. Call the function xen_swiotlb_detect.
>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>




