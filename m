Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC02382D4E
	for <lists+xen-devel@lfdr.de>; Mon, 17 May 2021 15:21:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128222.240746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lidB3-0000wK-H8; Mon, 17 May 2021 13:20:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128222.240746; Mon, 17 May 2021 13:20:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lidB3-0000tI-DT; Mon, 17 May 2021 13:20:57 +0000
Received: by outflank-mailman (input) for mailman id 128222;
 Mon, 17 May 2021 13:20:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W5oJ=KM=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1lidB1-0000tC-VW
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 13:20:56 +0000
Received: from mx0a-00069f02.pphosted.com (unknown [205.220.165.32])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf202809-4199-4624-aa81-1e0949c339a0;
 Mon, 17 May 2021 13:20:54 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14HDCvfC003912; Mon, 17 May 2021 13:20:52 GMT
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 38j6usgqtv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 May 2021 13:20:52 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14HDA55Y067742;
 Mon, 17 May 2021 13:20:50 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2044.outbound.protection.outlook.com [104.47.51.44])
 by userp3030.oracle.com with ESMTP id 38j3dtb6w3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 May 2021 13:20:50 +0000
Received: from CY4PR1001MB2230.namprd10.prod.outlook.com
 (2603:10b6:910:46::36) by CY4PR10MB1477.namprd10.prod.outlook.com
 (2603:10b6:903:2b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Mon, 17 May
 2021 13:20:48 +0000
Received: from CY4PR1001MB2230.namprd10.prod.outlook.com
 ([fe80::71d1:56f1:d7fb:bb8f]) by CY4PR1001MB2230.namprd10.prod.outlook.com
 ([fe80::71d1:56f1:d7fb:bb8f%7]) with mapi id 15.20.4065.039; Mon, 17 May 2021
 13:20:48 +0000
Received: from tomti.i.net-space.pl (84.10.22.86) by
 AM6P194CA0054.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Mon, 17 May 2021 13:20:46 +0000
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
X-Inumbo-ID: bf202809-4199-4624-aa81-1e0949c339a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=v32yXVdAri+fD1f6xpe0cgv9FFzz9yQJUWmLf+6uHF8=;
 b=aZrz5JDEvLQHXRWDJHAHQ2wEgev4OXp7ADPQ95IwCruMyfVt2/o4xVLF/rZ8lesUHPCg
 yREh7m/0m6jUmIgxwnsHElahXKOsjNMsO+MrdWj1TzsTGO3/OzfecyagLxJnDOMevr50
 cv7TsJq9l/JUfKCDQ2gGudX/hva6HUXjg2Wed+hEOF9AGe2wlnRaYGwVhhwvW7/LRu1i
 cioXmLsh1le+MgvnUwgLrJuDMYIR1fcaJ9FRHlEyqxSUyEPDFenz/q3IkMlo2vSmZcN4
 HfZD1xz8HDwupzYjMJsfLMUYQVOmVp6ycB892eyCEGuWQkvhBcmfF/i4eE3E0C6ArYGj Sg== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bly/fNd/Ylcv+6kSZd+9eb9SAVU2j2AP+Kv8wzfi9OIFaofjITvnC6j2u+8CxuZewElWeRdaXw9VbHsfyDbJ5DZfOiDQMDAIGHJ4qVlloeY57t3LUwlNQ6Wcjt1fP1VnxZaCOO095X+oNMmIIpOXZcT3XFa2omhswrVsoUggrQuVxV0TVS/HyXh7ySgvdtggFTVh0DS6i3LTZdpqrSoMfvHrgZk5MmIWBew5tskbsw9Nt9nMnWnhFj/+EPhM5EqrwIALsSzr3aeFjN4rka7sGP2pfptQS3hUjorqUFWG01nhbBorJCqKT0aGfO/HVHVOiGVTyaRJArFHPbRDDX+UIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v32yXVdAri+fD1f6xpe0cgv9FFzz9yQJUWmLf+6uHF8=;
 b=cVnEWzb0kq8Nr14u8buq2Ko9D5BiolyGUk0yjpDZQN7KM7jhu8QtVwe8erdCO/VNs7P1a0K0cR/96UweAjZ1Ax6xz1ojtg99+I7VvNf6Jxu8yHyeNsmO5HZIFP9RcTDFmL0ArZ+95zlrKaEoSN90YrqAIlTAd5N2YtpQiLufJqDXvN8MteUt/BWEI3PyW1AxJwVBy1Y3Uuyc9j8ZmR8RWxQ/1/dUiG8TtdB38oygpuquRYxFrandpZr/nwoW+oE1TLl/RpiJGUro+bxn8hAODdTZcY7TfWgJKgN6gQkvdzr92ISPB8X4/nFjfivtzAPC8eT4FbyOJkoRWoNvlrORTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v32yXVdAri+fD1f6xpe0cgv9FFzz9yQJUWmLf+6uHF8=;
 b=tIFl5N40/FSQRPo7zTM0QETpOexRii0unzHfTcAt+X62Ak4ybHjLNHo6w08rgo+oDaCGsKjS+oSTJ4Gm64bQ3KwAbNSkD+a/MjmgT65J+HReNTMojam/YiMa75iDM73oEtIAIZksPlVliWNDTO8AXITC0biUuTHgktE08dYxlQk=
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=oracle.com;
Date: Mon, 17 May 2021 15:20:39 +0200
From: Daniel Kiper <daniel.kiper@oracle.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Bob Eshleman <bobbyeshleman@gmail.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
        Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 2/5] xen/x86: manually build xen.mb.efi binary
Message-ID: <20210517132039.6czppjfge27x4mwg@tomti.i.net-space.pl>
References: <cover.1611273359.git.bobbyeshleman@gmail.com>
 <28d5536a2f7691e8f79d55f1470fa89ce4fae93d.1611273359.git.bobbyeshleman@gmail.com>
 <3c621726-31c4-6a79-a020-88c59644111b@suse.com>
 <74ea104d-3826-d80d-3af5-f444d065c73f@gmail.com>
 <a183a5f9-0f36-187d-fd06-8d6db99cbe43@suse.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a183a5f9-0f36-187d-fd06-8d6db99cbe43@suse.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Originating-IP: [84.10.22.86]
X-ClientProxiedBy: AM6P194CA0054.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::31) To CY4PR1001MB2230.namprd10.prod.outlook.com
 (2603:10b6:910:46::36)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56606d4b-acf2-465e-0c1d-08d9193695c8
X-MS-TrafficTypeDiagnostic: CY4PR10MB1477:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CY4PR10MB1477AA755218ECB5FA121B7BE32D9@CY4PR10MB1477.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Jw/WxHGQ2bytqRlyZXzoos/0sC/7Z5V3/Yt623Y8y4gTQKK7Wg5xX5WwQzFAl7Lseo3b2nzDTqZvnhV0s5Rvj8eLhqmCT6uVUe93NazFWEcS/kmgE1pvesA+WJLJCW4nAcl0Inruil/xMhys+yENUl9miDzsGE1MKiaQSky4EhkD1qnTBAdrTn/uNN85sM/PX1Sqy7bxrFG9Zg96piPjcC7eQ9y33XxPDDUnOvJYjdv3TKcgE09tUTNBPYFeT6PvULHw4XFlCdYawtZEpzFHb7RWpxor0OG1gLLcwaBFZCF0MZ0E8t7Cdgj4Y0tsH1axTj3hfCjLSVW+1iq3RKpcnX7aCCqlBhh+1auIKpGWGXErwjJQ5gxH3Ivv5NyfCGMpK+GScFktV2DGTrIzPn/lpWgeOB+KGOrGX4/TaZXFcI7WZcn03ag7aoAjIEZyy6tcCgs9B95rMuW+WRUrcfxJ1eL22sFtrsmxQTiSHloUJhpTu5Pz9u2tJ/b9KOTd5E2mw1W0NPWQsOjyiyz4bXeltXFvAkqS3Xcn6bbAhoyHDzaEUjWv/wDmvudJ26IBs9ItknXxzSnuWg4IfPj0JS3bJAmEcj4M0rmBi7eXsAoubv7OwnKRTPSkxL0IJQtgOW2BJG3s2UjSLV1M+pwEFsQAx6AIgDajQpr3iMiUD3xRC9U=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR1001MB2230.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(376002)(346002)(39860400002)(396003)(38350700002)(38100700002)(2906002)(44832011)(6666004)(316002)(16526019)(186003)(478600001)(86362001)(52116002)(4744005)(55016002)(54906003)(1076003)(53546011)(7696005)(6916009)(8676002)(8936002)(9686003)(66556008)(66476007)(66946007)(4326008)(6506007)(956004)(26005)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?v+pIgzT1XQyvabs9nvJnYTYtRjabjEKnnneuZiJEeOPGt0b4RII/U0gzPqGL?=
 =?us-ascii?Q?8exlSXR2hsAXHtTrEXQqsb619i3WCrpc+USnL8j1POD71mDjM1Sje3Mcbdz7?=
 =?us-ascii?Q?hFGcwBaidrypaiZTlgZg10+06BdEo93XDxONYD8kiyf+KSK4yFUJbdn4I35v?=
 =?us-ascii?Q?YzIrtpBxpiip8G+WUNkUXqTe7vaWv7uDN2XRdm2NJELx290JWJOjmEN/w1bn?=
 =?us-ascii?Q?lT+habo86KkQL9bjhEZeX5XpOLoswPZVQJCXn2L1PGCwyQOLKMM0VZrP5W3M?=
 =?us-ascii?Q?sbzMx7J2dIXrqOqFqsOuMIs84hIt6GneJoa4EnvCNVWg6zclO36omczCRe5Y?=
 =?us-ascii?Q?Jrbgs7KaRKLaEQK8RdgLoiYiebnbC0/CwPzXZ0OdiuQLrCp6Py9DnDmBixk/?=
 =?us-ascii?Q?uOtmLU1RUfQbTWqG10oWUWowR5BApvlwo4lgofJxAXVCW1gVO7GOo9wCptF9?=
 =?us-ascii?Q?6oUq9LY5gV/Oyay0/GZYoCj9N2CIn3m7zdlrw5gGM8k/QAy8/W4MP1q2afFY?=
 =?us-ascii?Q?qYyyyoGnZQAv166fWGRdvzjKyQfxAAWM13uLaZTEU1C8c6AzXbLkq6exMsOg?=
 =?us-ascii?Q?gl6RY/YeA6i7t9jxuNLA2lZJAH69+s4c9ZoYUsyGyy3FbgGaOliO8cIzQTsw?=
 =?us-ascii?Q?Ms8zYX0cvX4Xsd/p6LobFrBAu2okOM+5FKWFxjyad+IOfxQthnqvCCU6A1OS?=
 =?us-ascii?Q?jY6enkGMMxMD5ulwX1jLOEUd4XNFRUYj/2VIbNy2tWYbD2Fel13cO0nFi8WW?=
 =?us-ascii?Q?G3ParUnq1uCLlfvuqv4rIuIXTUi9hBDOEkIzAOyKWBSl5qvmWmnKHnOLhCZG?=
 =?us-ascii?Q?1Mi6R7hTDm58gA755bbV/M0CgN0X9+Xy+jLXjHNq2FwSlSZl+UEpCE9OIqfq?=
 =?us-ascii?Q?l296UO1hjz2t60jGz+a/hIKw+QPwbePW1j8yGTYj7386wAJXaOMMAqOrnFu7?=
 =?us-ascii?Q?RhQyH6NdB/F2ETaBJtMm7gbU7XQnvjx3/gvs5rSUVoYtSoOU5/EGJBobJjVT?=
 =?us-ascii?Q?jJvTHTUE7eL9EwCqD1TeLuBfI879Mjh8sNQw4ARU/k+XvliPL+Cs1l7Alu2j?=
 =?us-ascii?Q?3YVRUpGEXg9Iab+/6tpH/7irz6bzzanUgRE9iKXNKb/vaUaYYTKdVqvgCUuu?=
 =?us-ascii?Q?+qPbEzJQGyF297Yx/bCbJREHw0UjGYFFetdTQ30UY2apVxggfDVwC41PRiKo?=
 =?us-ascii?Q?/dHE9zri30rBJrxtrcs5dMhzb5GcGnNS78/FuiD5MEmTtWllMrSShuQst6om?=
 =?us-ascii?Q?ZY8PzEiRRqiwjQK6uW29Cz79PBStGPPwBOwC3UyM4vfFuNBeR4Spodrb20+7?=
 =?us-ascii?Q?9Tn2Wv51GdKexKKax/HWi0fI?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56606d4b-acf2-465e-0c1d-08d9193695c8
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2230.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 13:20:48.5527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gACJNgfT8t69pp+LrLOOuOTG1vSuJlZCL0gGXZND+I1LoBdmUzoZyfX3zcLd2wT7frhgKXtwxcRHppHd1PytBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1477
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9986 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105170093
X-Proofpoint-GUID: LxySIoMWWrrU7mSM4N1qfgMbgj2EoPGY
X-Proofpoint-ORIG-GUID: LxySIoMWWrrU7mSM4N1qfgMbgj2EoPGY

On Mon, May 17, 2021 at 08:48:32AM +0200, Jan Beulich wrote:
> On 07.05.2021 22:26, Bob Eshleman wrote:
> > What is your intuition WRT the idea that instead of trying add a PE/COFF hdr
> > in front of Xen's mb2 bin, we instead go the route of introducing valid mb2
> > entry points into xen.efi?
>
> At the first glance I think this is going to be less intrusive, and hence
> to be preferred. But of course I haven't experimented in any way ...

When I worked on this a few years ago I tried that way. Sadly I failed
because I was not able to produce "linear" PE image using binutils
exiting that days. Though I think you should try once again. Maybe
newer binutils are more flexible and will be able to produce a PE image
with properties required by Multiboot2 protocol.

Daniel

