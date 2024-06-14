Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A57099080C0
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 03:37:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740246.1147252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHvrq-0003iq-2R; Fri, 14 Jun 2024 01:36:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740246.1147252; Fri, 14 Jun 2024 01:36:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHvrp-0003g0-VB; Fri, 14 Jun 2024 01:36:37 +0000
Received: by outflank-mailman (input) for mailman id 740246;
 Fri, 14 Jun 2024 01:36:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OutG=NQ=oracle.com=martin.petersen@srs-se1.protection.inumbo.net>)
 id 1sHvro-0003fb-UV
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 01:36:36 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88cddaa3-29ee-11ef-90a3-e314d9c70b13;
 Fri, 14 Jun 2024 03:36:35 +0200 (CEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45E136Ge028967;
 Fri, 14 Jun 2024 01:36:09 GMT
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ymh1mjrwn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jun 2024 01:36:09 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 45DNGV0h027090; Fri, 14 Jun 2024 01:36:08 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3yncdx2j3a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jun 2024 01:36:08 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB4709.namprd10.prod.outlook.com (2603:10b6:510:3d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Fri, 14 Jun
 2024 01:36:06 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::5c74:6a24:843e:e8f7]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::5c74:6a24:843e:e8f7%4]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 01:36:06 +0000
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
X-Inumbo-ID: 88cddaa3-29ee-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to
	:cc:subject:from:in-reply-to:message-id:references:date
	:content-type:mime-version; s=corp-2023-11-20; bh=uZsVr147xntuGs
	grnROEfKl8s+FW44yp7i6KnMASNy4=; b=WfmA9pBmxuV8UuV5NBhgRLL7SbMsaQ
	yrbXIvWz0x2upt9QtQI5RZftX/tvHhdCZSBlE8TCDNaNrqQXn/DNpTNMTDNMQmXb
	vJsbWq8tld7NLuMeKfgY/Co+ivYAHa8+ccb9g942ObVqV+ajQCMiJh/kitPMY2/0
	M/OpNdoccjjaCVEDsjql+Uth87+/ciToMkRbOMUqhqwZxd4BTeY6NV/VwzOdOEu8
	jdi5fnb8vDiMvV7vM4Px83kYvPZnJYgj0LYpy/Vge0xKAnKUT7Ztz9r7TKNl00yq
	iG2dYzAvEMrx6u3FwF3Kz5hMR20dkQ/tPqbDrplBONeDoc4b0TyiX4Jg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AxiSpXAJVVUvv9trv6Z7EX66y5T/m1oaoeaRFdGwxWpX/ZKF6uacCbVh/a/erlIpbrTvNgyAZ7m47MFbywnmPhc2lwGpOzMtkWPKj/19Ur+qEPDaIayB6J88KAuHCrGft/ZryUTXHz+Giu/o2cjrLP5+S0UYGTjjt82DgVgwohN28gFGWJMEFD0UWOlhw2WdedAZk3rzx29cAoeBV8LNj24/5m9zzS3eDslDARC3MVaEs8gLHNMz41SkX+lhRD3qm7KzsDwynzsg1u4Aly8iWT2d0OO4gp4U2hskHgBy1rrj0FMGg38gRDne+J17WddiSSk3VXGt/R1K0CjHHflqiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZsVr147xntuGsgrnROEfKl8s+FW44yp7i6KnMASNy4=;
 b=ZZDc+189uMvpUvBV4Da6TXpmhwR3f/n1JkQsf/+N3JsBlQG/vHcSX5sYdCLn7Mpeo1HGCYB4f/Ng6BbtlMXW6GYRA3nnkmUifd1rNgsRy2TY/Qt9laKf6YqEyZMP3q9T4b+36L38EoAIHTQgduGs3w4/Cf009O+MBWHOAwuCRqGoczj9PL1YM2J6e4B31vYRS/cHfuYC3w2HhdsHupD3qljq1GzrgUAdM/F1C59ZENMJZuGCgWVKN0OE1LoBZmnRL0lw/DdkJpAMbNNUKmqBA4/OMjv1iQqJeyhY0i6onAv09N6R9+cqtL3SrL8kfZRwychHs2hVE1XNl5+s/Xhqew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uZsVr147xntuGsgrnROEfKl8s+FW44yp7i6KnMASNy4=;
 b=Skjv7X8BX4FmQG6qIRFStOjnBNZLCr+/4eWfUnA7N2vkbM/gPy7c7nLDLkfWLtQgKZ6PzwkfCM+fmLrTmpf87S7LxJ6F1Urp/9LIaMcAuu3FVaUsZgpaitsNbmfgHr8Yj8UDhAJGF8kFjBSLpI2yT3cngTdf93NAUOlU641r8Uk=
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>,
        "Martin K. Petersen"
 <martin.petersen@oracle.com>,
        Richard Weinberger <richard@nod.at>,
        Anton
 Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg
 <johannes@sipsolutions.net>,
        Josef Bacik <josef@toxicpanda.com>, Ilya
 Dryomov <idryomov@gmail.com>,
        Dongsheng Yang
 <dongsheng.yang@easystack.cn>,
        Roger Pau =?utf-8?Q?Monn=C3=A9?=
 <roger.pau@citrix.com>,
        linux-um@lists.infradead.org, linux-block@vger.kernel.org,
        nbd@other.debian.org, ceph-devel@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org,
        Bart Van
 Assche <bvanassche@acm.org>,
        Damien Le Moal <dlemoal@kernel.org>
Subject: Re: [PATCH 02/14] ubd: untagle discard vs write zeroes not support
 handling
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20240531074837.1648501-3-hch@lst.de> (Christoph Hellwig's
	message of "Fri, 31 May 2024 09:47:57 +0200")
Organization: Oracle Corporation
Message-ID: <yq1r0d0tifi.fsf@ca-mkp.ca.oracle.com>
References: <20240531074837.1648501-1-hch@lst.de>
	<20240531074837.1648501-3-hch@lst.de>
Date: Thu, 13 Jun 2024 21:36:04 -0400
Content-Type: text/plain
X-ClientProxiedBy: BL0PR02CA0105.namprd02.prod.outlook.com
 (2603:10b6:208:51::46) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB4759:EE_|PH0PR10MB4709:EE_
X-MS-Office365-Filtering-Correlation-Id: 941f7191-4cea-479a-63e2-08dc8c125c42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|1800799019|366011|7416009|376009;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4i8sekYYye7/EKxM/vCTd+IZVd03ce9hb1OlQEavN8C2CblBU83DqAZ/se2I?=
 =?us-ascii?Q?GcLxt6fXD9V63U5jKxRIap/nw+FqYJJD5Y+RJNU5gJBAl6A/CMvs/CcYGSPz?=
 =?us-ascii?Q?ezxM0mwexpK6Rdqos41xprHS2kYO1q4Zsx1XMQBZTaOHZHiqC+deD+DV1Rw0?=
 =?us-ascii?Q?hLWolfbBG7OBRAZsHszkHmQeRtUpxc7nfO+PONWgsmq//IiXb1Qz8Maqul3C?=
 =?us-ascii?Q?Uam2X6Y1m5Wd3CZ8oKypHmuwl2IpATkccpWJmCJCzUgbuz1F50XaXoamWYEr?=
 =?us-ascii?Q?Wj1fj4H6gDby4Oav2t4kxkHXvQOrbGvqLyvsEUZqeMqVNdSymxWup3bIlmH4?=
 =?us-ascii?Q?Ye2UqOmbv5LVdMihrJ638CoGv8VdOcq6ueYSFRmJhFL4mjW4/kiTBm4hJSAq?=
 =?us-ascii?Q?PFXAoR3RWz9l8fUkW9KvF5M1e/bpQJhBI4nueON+zWYxU1yPCcHQUOdN3enI?=
 =?us-ascii?Q?iiT15QgSPVWyHIqzp+XXiygErwmqmeBiDC1TsfTLwUeWaGi0ghE3VI0RTcW4?=
 =?us-ascii?Q?+fAhio3i+OVnkjNiGBoGaoLyvZQratreTwkOxRmb/ioTV/7/HejBwsk1rp2G?=
 =?us-ascii?Q?al65dOQVomI9e3Y+UmLiHjd2HsnontwqyPMyQEpDTkRPP1C5szsKnl2tJFfA?=
 =?us-ascii?Q?WprUA1iZQh5Zrw6gOJGZXl9uXXI45cs7v+ePW9Ptk87V1hW2NJt3i8WeqeXC?=
 =?us-ascii?Q?btqTMH6tecUUB2nMzq64wMX8bMJu/da5zDrkOXmESclR2WFVM5gb53doi8Aa?=
 =?us-ascii?Q?mEaS5AcH6KpHjbR39piQELqbAO9BSPAjJ1Zh6EYamx2vMu6zaDTh/fIGlbtI?=
 =?us-ascii?Q?PNaS5OoFeePGIec4pP+G2KN64ls4qOz0CeHKjls7P4vN0FMyTBEf3vwIuKu9?=
 =?us-ascii?Q?3p5W++QpL1b8T/XXO+hOXtBXEOHfYEJhiMkZ2/YOcL/JXHalTOiYQWHkNUbj?=
 =?us-ascii?Q?ZDBJWKMyiL9ty22PP+ArivqbHmygiRJ1rybWN7fn5FPHDtSro0hiD3n4vxVH?=
 =?us-ascii?Q?eMhYagl3DphtB8eY1qPUprHg26HCpZMGRZHMzABfpWLO+JQvjzH+Bccn8zQh?=
 =?us-ascii?Q?bEf/SNqqkq0kvshynjKdarW2EvyG9k93GFxkOYUwZ7m5RXMLJKx6tcR6Bn52?=
 =?us-ascii?Q?W+3ApnceXsevImKEIFLRJPS6q5MBhTJuXPLr4YuDhPGy58bijX2QF6T0pgL7?=
 =?us-ascii?Q?SObIeApa29tlEnmmugF29xEfy3ps5bzBwrf9MQBKa6MqPSOxYAHlZ0MiAbTC?=
 =?us-ascii?Q?H3ndF+ka85C3sgjj0AS7gMlMXpRUJmXP6cU4yAaembVXyjArv9DNmumMRJ8i?=
 =?us-ascii?Q?r605JghDZZHNDwR6BhXGKfKU?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(1800799019)(366011)(7416009)(376009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TvgLwiG8WcHzDBND66jfp1Y9ut3hczcMwU46+lHk3mLvsgWPQTbMx7zVYA+A?=
 =?us-ascii?Q?vS9LF74NIo+y4XWSLjH6aoWKdm//qokMYXa/sJQI/tsw2Xb+E0pcwrhi7HyD?=
 =?us-ascii?Q?Ke19DCtavxYDXTrmoL73PD8IDGAVrFxFetJGd/4Ia95kX2kWC/6DZPpsNt+K?=
 =?us-ascii?Q?efoEFexMkZyyEg9IVwu5+davrBrkjWURT8rYdfPOBTglsGICGg8gVlz9xewl?=
 =?us-ascii?Q?zDZkfxEp+IvBYqRtz+4bTBzrZnTsft5qVSoysGPDn59KDLU7jurSRNpEnDaj?=
 =?us-ascii?Q?WDMmITkbL5gbRTutlvxAIFKcGGurnld4SYaR/SelNfMyFWl9N+0MH/L8VnoV?=
 =?us-ascii?Q?yEhEd18e/HCTvFS4qNmjqxGNM80+DF5F/fZQhc48asfzJQCiCejtu7M4iOux?=
 =?us-ascii?Q?RQBi9k+/akxEgysI7mXjd64oJfZ/66gCeXPFFqesPBJUZyF62PZmkrMuJYjm?=
 =?us-ascii?Q?7ctRPE+IjpB63b/OTDJhpBTpvx2KXTZktRY2yeXxgaE/hlhKaVafoide/zlD?=
 =?us-ascii?Q?HacDs8WQziZ4x8Gipm9CIc3gSuDQhxk54/bTvf3HM0wy3oXuFI3wPZhxkNKI?=
 =?us-ascii?Q?p0xuVnnVrfsM21o37uoMXVOapo2w4VHRtobALcSAUD6+w2py/t4GBjpK5i/d?=
 =?us-ascii?Q?DE9dFPyuutjglnzWemR0UHdnDTNLrMAq0VXGPYzMGh+U+sVkjGAoAmPLhsGV?=
 =?us-ascii?Q?g1ORwvA9ISegoIuQYYF0jiUCpx+1jd+axyrM8CbL1buRKFu8Wx5raLSCSECJ?=
 =?us-ascii?Q?BJeXOBxABgKQ4PSWQ5JQogmrof1AjWP6BqQHM3HNigiFyHgTsbOEIKwgmt5d?=
 =?us-ascii?Q?rwYmZXM7my3ZuMFReFDz2DZQwuLhKKT6QQSryFQ2TwRCGP4J+oxspcc+hx+x?=
 =?us-ascii?Q?tc3PNSCgmsQPaQMJktQ8Os0EVB9YwnR/RIa2YOHkvKp/sAQtvm84ukqH4dzo?=
 =?us-ascii?Q?32c2vILBxL0rb4PiMP47GJkceKXfZK0sRaqF9W0gmxi0A+t7tYTJ9I8zfE4y?=
 =?us-ascii?Q?C+SP0m82apGQAP8PzZSPTzENno5NJSy246jTUsCcca4ubu2QV5qUcfjWytNl?=
 =?us-ascii?Q?Oe/jQciHnggOZ8w12vm7LyCLS2j2nT70hRkEHHhEuxiYEsBKnx6byzR2B+nZ?=
 =?us-ascii?Q?mnhRyWGSZaPfEoJ9qJSHvOypQrs5iUx3xB7CnBsEvJFvFGTuZiFmQNamR77C?=
 =?us-ascii?Q?uIVJXezQyXUjF5G5YlkPqQinOx7JdvWPEQqufm0RERtKIC5JoplKa/KLmfM/?=
 =?us-ascii?Q?06PkmmSljtridvatDQrRhmPQaA+/yqxTj5kqd4fXfwnGIYp/1k3JHNQAPadM?=
 =?us-ascii?Q?BAku+hSGHwgWsrVP0RGbztBd2Ijq1+wzd14Bw1URtfepMrvegitnX+363YIc?=
 =?us-ascii?Q?IINSbMBjnNVUCm90gmND6lS/ItDBdORKr2VI2ArqNJZMCRKrI84yXYwyX5x/?=
 =?us-ascii?Q?zlFR6FLHhXSA5RNWsj/T8lkK5IsqRc54pucwov1TuEn6otfLqkzbE4JrL/JW?=
 =?us-ascii?Q?fNqvJUgTAUJLJkv+zfFNakOFFAFsckIF18u7t7IKew5+JcwOaisEqmXULR4T?=
 =?us-ascii?Q?6bblNsmY8WYZw0govdztym9adcLbJwsWzx5oPRnlUXjOdDU2CY9ZiEReTcnp?=
 =?us-ascii?Q?Eg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	jYLgP0/h3wyXNIL/9eam92dZS7rYXv7VqYLFFstBt1fPcfsGF6KXEduYhbfdgg1/D0sVdDiJsA14vcqsWRXehPjO83eh8clMRROeKWfmHYDAsM07PAkI2IwtMX5ihYqyHEx2OJKMWxNaoSfbslPBVo9SLRTz/q7YyLQGtWvr/HSfbrmBXD2hmvoSv6F0niwf1MrOaSmbui7fW2Ew+OOotSB/aJ4YH8OkQIoi6ylctRFojN63HNUNMVzZeU1Bfe0G06/5ybS6lZDTkZnz4TlzothizutcGWE/RcR1bPrcflqeB22clYlskyQIyBkUnZtxtUEuQwv0hXEc7Hh6juTPwMhuLAQyf6EW8UJmqg7vdQ5NnjWWESGAyDiPvyoMJfcFuLa4v5mts2OI3k+HXZbpIVvBQT/1NebLlx0mImCMPXd4a7pEdr6oKpFaQ5uv2qkToIRXrdfuJpq7yV5/dTtz91z2Xy/k14Xgi/xbxBVBepMD6T3FAB/LSz3dAJIz1N6BwaMjwja3/vdBSOvnn9ds9SJOw2Qq6AliIWyyZlfGmF3W6cfOHI2Ivel0T8fS3vvxW/S/AMxNH2PGraXid0O9pIDQK7hZqlTIamSP15kp7vo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 941f7191-4cea-479a-63e2-08dc8c125c42
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 01:36:06.6018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QaT7cRmCVXEHjf2Pr2bTLSIZoxWp2gZbIa9f/tFKySp3HjyAw/3y/tAg8yMkvuLUDw/ygddVdzUI5cPDCGLHIZOBR3Tr/9NghAFM7fnbef0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4709
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_15,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406140007
X-Proofpoint-ORIG-GUID: 4uuT5ypGdiPimmOi8FZ1BA-syB-HF66T
X-Proofpoint-GUID: 4uuT5ypGdiPimmOi8FZ1BA-syB-HF66T


Christoph,

> Discard and Write Zeroes are different operation and implemented
> by different fallocate opcodes for ubd.  If one fails the other one
> can work and vice versa.
>
> Split the code to disable the operations in ubd_handler to only
> disable the operation that actually failed.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering

