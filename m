Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A46133F737
	for <lists+xen-devel@lfdr.de>; Wed, 17 Mar 2021 18:38:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98768.187561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMa7G-00058x-Rx; Wed, 17 Mar 2021 17:37:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98768.187561; Wed, 17 Mar 2021 17:37:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMa7G-00058Y-Or; Wed, 17 Mar 2021 17:37:54 +0000
Received: by outflank-mailman (input) for mailman id 98768;
 Wed, 17 Mar 2021 17:37:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F+Cc=IP=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lMa7E-00058T-UM
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 17:37:53 +0000
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7160e7e4-651d-443d-a417-cc92f157085f;
 Wed, 17 Mar 2021 17:37:52 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12HHXdOC165915;
 Wed, 17 Mar 2021 17:37:49 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 378p1nvwg6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Mar 2021 17:37:49 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12HHZRfP084443;
 Wed, 17 Mar 2021 17:37:49 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 by userp3020.oracle.com with ESMTP id 37a4eupf7c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Mar 2021 17:37:49 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by BYAPR10MB2679.namprd10.prod.outlook.com (2603:10b6:a02:b2::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 17 Mar
 2021 17:37:47 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721%7]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 17:37:47 +0000
Received: from [10.74.97.52] (138.3.200.52) by
 SJ0PR03CA0345.namprd03.prod.outlook.com (2603:10b6:a03:39c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Wed, 17 Mar 2021 17:37:46 +0000
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
X-Inumbo-ID: 7160e7e4-651d-443d-a417-cc92f157085f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=rhcXYAjuXe0KIPC1Ig00JEBH7t0HNM2no7c088fpuPo=;
 b=0aF0Q+BhGNeMsXoYE8ePu6hNcrBvNsOhbWV6DoQvj4ObuLRanVK50mRORDs8hgMnzckZ
 hdt8nYL8Tuwe649Bl38CA5Qj9bMVGycUj/c3wA30mxIWFbeavrZJLfAHq9IZRAk35Vao
 1hs9bOmaAUdHTQ156SrpVTeydcnsBZwvI3ofwaBLXpeKRFwfW+sJe5XF3tMXf4vdDoyw
 V6K7QD7Pyg5ksosHy5++I5vncFQGt1YWhGK1oztfoMH/Qn1fAdFEFuL2EveWh1aHODwQ
 tFihM5dFVYjaCHJ7s6nXX0Oh6F3gQV7qsgA+Dm0cPrDhb2RVHwnCzzH8F/2ho3B5FEme ag== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fBkCfU2NdBjhR1ScCTYnU+7fZelIvB6NnCwBytFVaEuqsT4mz7ZspePv00ZYt+FwJ5IxizPM8XyfAUtU7noQiDAsaDgJUDeVTLOe2RD+uwUc3EmvP5Onk2rvmyywfeAOXnkDgt76UHQ64PEooNfeo7KhvKp+CLdHUKwGWSgxIVQtR/NA+nYcxd91r/COEoZOEUpw3dKJLJIJdScRMc9xJx1QsU1diTdgnfk7NuMoE5We5u7bewJpOmFA7eWNJJpYtMcD+KPuOrpRtGzkXf9GZ1Ml4kluLPn6QWyxbE1Z0U3K4ZyaZEZhD7aB6FIgzBeNaJAPTWAprOUt1Z052iB1wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rhcXYAjuXe0KIPC1Ig00JEBH7t0HNM2no7c088fpuPo=;
 b=aJLUS4w2T194uFRggzEukmxSApRsY4zObLGzm0S1n0t/3IpF6EAK1Sviz3r/2V4LDm616nfEqtkZ5gQdzqTbbJPfOrBKLievfS6wj3uVhTvYUZ+hc8ANklSm3MxfW+UXbFkrjlBXaihZTzccyagfX4eu8lxP/0uVpD7Y8/Vf94+d0QvVjR6TJC8JDSJjgS1s39+4WsskEn37rN8y6bx6Asf/EWhBpFir0e5rDIqHHP5mMTNNS3y7ZQW5CigRwccwwY1gQmMzohaycydVoWYaVh43TP8LBaDowd8JoqVggV1KTP1fUJVKV4FWoYneb07ejLbdQGAORrEnuGLku/hP8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rhcXYAjuXe0KIPC1Ig00JEBH7t0HNM2no7c088fpuPo=;
 b=L8Im1oUDfH04cFu0FlT+cUKmPBkVFR845DcokdWbeqE/oZclzKen4dCpTuo+p/cDUd6cfoLwVGdslYy+daEiZ7UURahtMkt7GJNJtIT4Ihfxlxv+Qa9IIvV/38FexzUvzpv5c8VkHjmblddzg7aKv8HfwlVZ98vxn5d3yPgwT0s=
Authentication-Results: xilinx.com; dkim=none (message not signed)
 header.d=none;xilinx.com; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH] xen/arm: introduce XENFEAT_direct_mapped and
 XENFEAT_not_direct_mapped
To: Stefano Stabellini <sstabellini@kernel.org>, jgross@suse.com
Cc: xen-devel@lists.xenproject.org,
        Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20210225235158.24001-1-sstabellini@kernel.org>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <4707b219-eee1-22e8-8dd3-6b7d821de333@oracle.com>
Date: Wed, 17 Mar 2021 13:37:43 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
In-Reply-To: <20210225235158.24001-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [138.3.200.52]
X-ClientProxiedBy: SJ0PR03CA0345.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::20) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 072615ae-703a-4f11-25eb-08d8e96b60da
X-MS-TrafficTypeDiagnostic: BYAPR10MB2679:
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB26796D0792C4CA9DE407D1CC8A6A9@BYAPR10MB2679.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wW1VL+4uwdC5wZN3oIssoSSRL9Ix+ATBUAIfqudKK0MZ70+nkHg4rngmeYqzooqvdUo60VmVN6dCU/x0AUSHlxZPDjkvhUUJ1I/PiWSboOVjX2r5NctzgCHom+mFXcPwh+0l/eOyjkk4lqotm/9dWdSiP9e5nqcYXd2gxi1pXsgKvmTgrhMfAWFjFJ4qdinE/zcX/tnxBaaBly3uYZHGHq/IXwvwUK6yyTXm/GnKZrfiT8cLCUEUbxwsELpN23o9w50gOyQ13V02RZ/cYGVBcdd81tTBar59d+J+eNmDbeFmDdS5Tt7+lHTcZ+ehy02GLKttcaFGv+OHxZKfvvKiHK2slcsnoPMg73JlKApOvvFzodH2JpjehhrTFC+Sjdpux6yZFtQszdeMmiv9GYRaPdnffLSw/QRlrPdU1IzXtOIMXk07GfvguxiCYfUTEKaB2y/anSYlXc37Na9TzfkH8KQAvoL2gpQZOOvQzKJw/3iR7GFWvSPWt6kEbj2c/9gfhFgkkJKbrHSs0Z2fxbnspLhlT7syr93gLmbEW0EEmk4OSUyUerX7LKpUmE8R78+PH9h9b2TbNhTXPeBucgV3bJFr1vhPkJEGurkSSSANH3aKbUThP9rTHURM1JW9JSuWGexeDdeze7FPjlaTgcPRsye9fnZUwX9jc1zYS0Tj1N8gTULYjVfeWcC8/MuMifs50jDHX4KEb68sVkmJQg/wQ+8znNcyjucMWXxJdiEX4wYxSgRm6qqMeRQGD3GlxV3j
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(346002)(376002)(136003)(39860400002)(316002)(44832011)(31686004)(36756003)(5660300002)(6486002)(16576012)(478600001)(31696002)(66946007)(66556008)(66476007)(6666004)(2906002)(53546011)(8676002)(956004)(2616005)(8936002)(26005)(86362001)(16526019)(186003)(4326008)(966005)(83380400001)(43740500002)(45980500001)(6606295002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?WVdEU3FVY05Hd3NpcGc1Umk1T3hseFN0azBTUWtOWHFKb1dmeG00WFZaVzRX?=
 =?utf-8?B?eGk0UzFtVy80enB4ZXJBak9iLytFWFdEVlFZWUh4WnFQWFRMZ2pJdk1BSUdF?=
 =?utf-8?B?WCtpT0tLMklIelNvb200NVN5MWFXcitOWFlFWnh4QlFNL3lDZUdLdXRCa1cz?=
 =?utf-8?B?NHAwOW1FckJYSHR2R2poZU1rQ09HdzFOemFkVXR1cHpnbUNaYkE3dk13YUhy?=
 =?utf-8?B?QXc5M0VBc2Exb0cwTnBzaWhmejJVYVFBY3lxRnFRZ01EeTAxZkpMYU9zMTBi?=
 =?utf-8?B?aVloT20yYnRyMWRpdkNZaHdud3VXL1RoRHRMdSs3WnVNMVVmWkJjUUFhbys1?=
 =?utf-8?B?ZXM0SGJiT1doV0drTk1WTVcxaUt0Z2ExaUdiMldHeWRtdlJkV2lXRmJjNW1I?=
 =?utf-8?B?UGFCeXk3ZHRuOUpZbVlialNnUXhMSWdGZHZSTUdJUGdJcC9JVjJHL2Y0V3F2?=
 =?utf-8?B?alk5SzZaNlVEeFBDaThOUTZGcU9XMGNQbUo0UGdpR2U5eFZIZGU4ZkZMYXow?=
 =?utf-8?B?N2xWSWloVDQ3THR3Q25nNGc5ZEE0eEYvYk42enMreHRJMGZWUWszTjNhUXpM?=
 =?utf-8?B?Zy8wNnkzSXZ3TGhSdFhxdk5OU2loTmVuMy90R0U1V1I4eWY2V0k3N1lHZEVa?=
 =?utf-8?B?Q1kyeHppTGl5bTNtSlRvaXRuM3d4bWhoNFlINUZnWkNlUjhZRTg5VGRIQTZN?=
 =?utf-8?B?cHZob2s4UE42WldERGZqNkJpR2hZUmZmUjRGajArdUl5MmlrMjBFQTRacWtv?=
 =?utf-8?B?cmNkYVUzY3ViaFhFYTNlMm1PNG5UQ3lHYjhFTnF0VzhsQkt2d0xmUm14bElj?=
 =?utf-8?B?dHhwTXFCOVBIVG9PMjJ2R21udmt0ZHBCazZDQW55bFhCMDZqUW9KcGtCZE53?=
 =?utf-8?B?RmxoOThyRzAxRGU1ZE5kR0F4eXVrSmIyc004NUtqbXg2dDZCYmxDYlpKMVRv?=
 =?utf-8?B?OU1xcHZhSmNVRHlySWpXcmFMQ3NuK093S1orTnVDK3NnMFUxRFZEbUQrQ094?=
 =?utf-8?B?MGJyT0RSWlNWcXRYM2t5eHhkWFN6alBmZUdycGpWcWV6aHpFc3F1QXpvWTFp?=
 =?utf-8?B?cWlVcnREdTJabzRtU2d1R0F3K2czNWphSVJGdUZOL21rem5KNU9BZG5xT1d4?=
 =?utf-8?B?bDk1UFV2eHlUdEhVTjlyUkFVM2RLOXo0RjlsM1FMMllaOWlFMFBXd1FWYTFW?=
 =?utf-8?B?WTZOSzdyMFhiUWc3YzVBNHFRVlFTcUp0c0tGaU0zL2Q5clIwM2hNYUJkWVBu?=
 =?utf-8?B?b3VlTTFDRDB5ZDRLQS9NUE85L0h3Q2pWa3AvRWFJRzVFRk9oc1FGZlpkVlJL?=
 =?utf-8?B?TkVvdW8wUHBucHpuU05hbnVDZ2hMdW5kNFp0T2pNdGpMZzNaa2RBVjMxQnhy?=
 =?utf-8?B?TFdJbEdYWVJWUTVlTTMxTFFnNEhjRXJ1ZDRwOVJTNGFPUHdGNFVqOHFnS1B1?=
 =?utf-8?B?V3UwWW93MWNpY3UyWUhRYm5LTEw1RUZQZXFSRDFJQnBjSXlDOXJHT0FUeGV1?=
 =?utf-8?B?S3ZmWTNBRHdRRlZ0eDgyMmR3TWpjUytsblBrWkFNeHQxVG0yN0xnTkhvTjhY?=
 =?utf-8?B?MTZzUEo0WXFBRmR2ZlZKZ3RZNG9ST2duT2NQVDhHbHJNaTl0U2U3eFBOOWFr?=
 =?utf-8?B?MU1vTzVzTFFZc0NhKzcwSW9jL3crYVR4NWNNVS9zaDhhSFhGT01ET0RNODZR?=
 =?utf-8?B?UURGT0NYZGZ6Z1lES1JCbEgzcFBmZ2Jlb1F0ck05dmhhUDJkQ1AzbFU0Nm40?=
 =?utf-8?Q?vecOxUhXP0yU63PUWPQiyFgZT130f0VYNKkVMui?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 072615ae-703a-4f11-25eb-08d8e96b60da
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 17:37:47.0036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G86NFKKKF2M4CDd/jjkt9q8mmbb0p3/mINkIWTtq2jbDCMH/2aCebolsjH7YoUTpRxSKYBsT/1lT9w/DNLVQOjGIkxp5hMJR7zYIq23tjPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2679
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9926 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 mlxscore=0 mlxlogscore=991
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103170120
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9926 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0 adultscore=0
 spamscore=0 clxscore=1011 phishscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103170120


On 2/25/21 6:51 PM, Stefano Stabellini wrote:
> Newer Xen versions expose two Xen feature flags to tell us if the domain
> is directly mapped or not. Only when a domain is directly mapped it
> makes sense to enable swiotlb-xen on ARM.
>
> Introduce a function on ARM to check the new Xen feature flags and also
> to deal with the legacy case. Call the function xen_swiotlb_detect.
>
> Also rename the existing pci_xen_swiotlb_detect on x86 to
> xen_swiotlb_detect so that we can share a common function declaration.
>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---
>
> This is the corresponding Xen patch under review:
> https://marc.info/?l=xen-devel&m=161421618217686
>
> We don't *have to* make the x86 function and the ARM function exactly
> the same, but I thought it would be much nicer if we did. However, we
> can't really call it pci_* on ARM as there is no PCI necessarily.


I would prefer to keep existing names for consistency on x86 side (but making that inconsistent with ARM, as you point out).  But if you feel strongly about making the change you would have to have x86 maintainers agree to this (arch/x86/kernel/pci-swiotlb.c).


-boris




