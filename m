Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6E89080E5
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 03:44:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740284.1147321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHvzP-0000VF-E3; Fri, 14 Jun 2024 01:44:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740284.1147321; Fri, 14 Jun 2024 01:44:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHvzP-0000Sw-B6; Fri, 14 Jun 2024 01:44:27 +0000
Received: by outflank-mailman (input) for mailman id 740284;
 Fri, 14 Jun 2024 01:44:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OutG=NQ=oracle.com=martin.petersen@srs-se1.protection.inumbo.net>)
 id 1sHvzN-0000Sk-OE
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 01:44:25 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0807081-29ef-11ef-90a3-e314d9c70b13;
 Fri, 14 Jun 2024 03:44:24 +0200 (CEST)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45E1fQfN010219;
 Fri, 14 Jun 2024 01:44:08 GMT
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ymh1gjvwb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jun 2024 01:44:07 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 45E0tj8m020118; Fri, 14 Jun 2024 01:44:06 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3ync91yqbv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jun 2024 01:44:06 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB5755.namprd10.prod.outlook.com (2603:10b6:510:149::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Fri, 14 Jun
 2024 01:44:04 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::5c74:6a24:843e:e8f7]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::5c74:6a24:843e:e8f7%4]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 01:44:04 +0000
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
X-Inumbo-ID: a0807081-29ef-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to
	:cc:subject:from:in-reply-to:message-id:references:date
	:content-type:mime-version; s=corp-2023-11-20; bh=+K/bRxHsws1KRz
	eBoVci8ut7cr6RRzSa4Eor49bSvHA=; b=LO5KKTzAux3HRgbSIeAAdNQJuoBFyS
	Qz7XF8QOxaw/DkoTGgqeWi4a9TsTE80/mPOmfWbXiEh+2LrNLJGyZrjrLYTI9afl
	qh9KYySX7q7sC9WFfdQqt4FsMGpIJnQexT+yx/TEUTQh5jJHZypZILFQKKFH2EZr
	bi4LFrjeEM3ZwbbKB1q0M8LB7RttfeS1tVPGdRwHRt55hacMVE3mBLH482+DYdWS
	KjJKvb0I61xkFXEx9YQa69tcdEyKCfCAh6W/3lNXKWXj8AmUqpnpkMSE6MDvBQxN
	dnrNu1vgMHB7X9X+qKAcCqbs+BebICrOpFH5r8m723YYg87mJYkKWSWg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QIeFpvqgbAHe0A6cQldeNgm+RfJHt4qhC0Bfc2zzh5nHZg5p9s1HxjxmtQ/ct2hi+bE6VapQ7i6kHWKAV2jnubswiX4n5LYnoTKsMdkHshSHkDvjQiTXL6y4+D8keU0HlC2o51uJ4YlzXW5vyvYo/XAFLgaUfSTTqOB8lgnSpMFkBQ6v7GIhlVpahnV3EqemALGwTB/1rWPPA+14BIu1FtMtd/OR9+RxoWz7/9iQKGN+fYgT7/EB8Xp2e5Bld2Ow0NTQg830+KnBIhLzngt74A8eLdM90B9ShrV0HqI4kJk2DeT9UzhPldv2TGKrkhWIbbneuz+vNhjN7g94CysvKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+K/bRxHsws1KRzeBoVci8ut7cr6RRzSa4Eor49bSvHA=;
 b=dMgb8KeX8P3fUUtoXVqaEKJy/dtCnetXlF+Ft+iarB0eytBt1ENkzqGNryN+xe54FRzx6Y9IiSiX/x3Xi5Q640P7jb3FskW5G68HhuWyAwLuhZfdPRwozFLj/BwP6JBXxghhnRc9TjUju9/qc1fNnPIEqKak0qnBa2YBAcx2fdua2nFZ/3QhTTqTVu2r/nLBZZAgg2KAogV0nskpnbX8RucLQa3d43oOlwm9YZ0mmhcUJV5TzCQxp7489zArl2dtTHG8g2IDYZ4xJyyE1h+duFZGCjKoKS1jTcK2EJQhMdcaUbbmq+3q5yq9AtJbXQlSfnZXEjqgmc4zVIp7OTkkbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+K/bRxHsws1KRzeBoVci8ut7cr6RRzSa4Eor49bSvHA=;
 b=qXXD7ZZDQpMHn+JcNYKaTrWFFYzy9aSKkQBeG3T7mYk8BQncw45ht1Z1l/c5ifcJCpgDbiOyUHliDWZd3u8Rz23m+WnSn3XCDG6NaC+rBMdFW1/azkAzyWZfBKDgpULAF6tul8X4d92UT591P9VFn1Homob3VzT7CO/RzWacky0=
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
Subject: Re: [PATCH 09/14] sd: factor out a sd_discard_mode helper
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20240531074837.1648501-10-hch@lst.de> (Christoph Hellwig's
	message of "Fri, 31 May 2024 09:48:04 +0200")
Organization: Oracle Corporation
Message-ID: <yq1msnos3hl.fsf@ca-mkp.ca.oracle.com>
References: <20240531074837.1648501-1-hch@lst.de>
	<20240531074837.1648501-10-hch@lst.de>
Date: Thu, 13 Jun 2024 21:43:58 -0400
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0020.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::8) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB4759:EE_|PH0PR10MB5755:EE_
X-MS-Office365-Filtering-Correlation-Id: f9decfb8-e41d-41b5-e5b6-08dc8c1378ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|1800799019|366011|7416009|376009;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rsMRxuPMhvLXDeDhgiUhfcX7YzJOWjvOnmcDZyAqj/Y7xSxxk9w4j2MuwGwE?=
 =?us-ascii?Q?AT+VyQSAiEY5YLer6xjrONL67JpuinVyauqt8sia5xnaFhAX954zje9zSqVn?=
 =?us-ascii?Q?z/cnoEOvqUobqA6HZ21/Iw/yC77K/mGQSVdfl0lqh6jBBtCGOwc//rGlsUbQ?=
 =?us-ascii?Q?10WXTpEbNQil/YeBQ66WGZQyW8bTX6JCEfBKsACOejESvIYS7C/vX0x4YOiH?=
 =?us-ascii?Q?K/ZPdcMxj8NcpgiwYu+9/KHuATYa9o3wCEdfMlOMMXjvaN6rjIMmuL/C77Hx?=
 =?us-ascii?Q?4fr3vmpA3AWwB6Nv7hilOXK3kKAFDpKlZxwcSfccNx5//TWs2McF4z7CiJI8?=
 =?us-ascii?Q?r4U9/yUriQaDPqjLjMuabYs7mbv1PZkUCXzbSa1kT9ukHsXHZRKK3c/vrTTx?=
 =?us-ascii?Q?cqFUam0EO/ZKpslzqzjSsCWfAKxsrln+FpwS7rWamZmtFKRuohRXy7gkMRjB?=
 =?us-ascii?Q?7ww6X+MZy4d7yERQoJyhlBLeha5z/TXnhwSXCwEAGnfydvfxGNuJI+qzgaVH?=
 =?us-ascii?Q?8lEz/LPhhaQj5a3rc8ktUcpw32unCs8AR4OZUIXb0CX+xAUM4JVECO4d5saL?=
 =?us-ascii?Q?87sPeO6/LNpwn4vVa5Sp/5OIo4pn4U3ifN/+BIgTuYgkqFvpRiICKHR16ZI8?=
 =?us-ascii?Q?GQ5rnMTQtJs3DBvvC9w+/3QdKjX8fAi6d5WDn8V77rQUU9N/JjGNMB0z3juf?=
 =?us-ascii?Q?pXzlOdAfH3+btfTKtdUW4cSxTIXEPuKaDL2ITw87ziUbtrRpcFD8Chx3GDiD?=
 =?us-ascii?Q?1b/AjQQLF1QWM1CajnuRGI0CI4kG+BWPc5kzhGi4UQqsMeYX6M9YYKK8cWxx?=
 =?us-ascii?Q?LnkDxSZ1Hj54+ahyAPUk4YBOgIfRTA+IFgvuCRKYuYM/A63/NLwmPwEFRyqn?=
 =?us-ascii?Q?rY8RFRRo5imriXDiclhIgO8mOrNnYtG1gmAop5Wbx42wjvCdl3RsZUGzsZU9?=
 =?us-ascii?Q?c3q7kMU3mPNVQCxEDpdDPC4B/wp6EmX2E1qxcOeVONZg3muX0f63BtSLrOB9?=
 =?us-ascii?Q?vGCynrNenVr49sQAFF4trLatBunlo+EvXQOSoYMzUX2cbcDac1cAlv35ORDh?=
 =?us-ascii?Q?Wb1ckvNk9uQd+YyWL51AYq2j5BhjX/h7Q35o/Fp0wjmJ7S6wDjtZ/CZvSi+R?=
 =?us-ascii?Q?SmCB9L2vkWqMvTPWrfWfCK2APJxwdreaYr96MBRwOlm27OWkTrnmeZjt1Vbo?=
 =?us-ascii?Q?ntOTITySgIn4TIGw0dKXmBK8gEkqWtLP3gfdGf9+AKjgxnNiINcp7Ixgjdec?=
 =?us-ascii?Q?EFvUQhEUzy63spP23MkX6YacxS5KY5pQXFcYU4jb4XU1f53nSZZTOnjuqOfI?=
 =?us-ascii?Q?rpXHAiLFN0YZ0lH8eHJ/lyF1?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(1800799019)(366011)(7416009)(376009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yE6Bkw+9G+b2exn2zejqkEILGVw4gzJRM71v+QjQlYg9KSRGBQl0S0MkZpW9?=
 =?us-ascii?Q?JX0JqSi6oer9+aFWYmxvavE0G9JxVLSOoTanbP46Z5hTtNKN8cnRyHsa3Tkw?=
 =?us-ascii?Q?3vVBm6aLHySm1sKW9N9XVWH/SVFzsTMr4fNvtCzS+aB7WUzLoBqA2A/EbzYW?=
 =?us-ascii?Q?h5tob1UT3AGkyVHxBejzvPM49cOoVi4uToOr0Ty0IIdp5GANaer2kcHl3vt+?=
 =?us-ascii?Q?JBslZuZProRjrtYRWYM2w0ZLtr9Zt+uEjTcvFE+Aq6dGHSXRHXoq0Xc0ziDj?=
 =?us-ascii?Q?pI2sS3T8SV8K5Cz992S4fEX+mL6lBKQpTRFnJzysL2e9WR8L4rk7uBMtHYNq?=
 =?us-ascii?Q?+XFn+k6eEqTQ6Mp/FaeACr0BWdkSWjPeq4wf3lFQ0zqOTMk0lxK805vAd3wb?=
 =?us-ascii?Q?TC1aKFP0OtzGTsLNZEry+t4ejGr4W9GH9PTbp60ROBYgN646Ch5uthzmpNe9?=
 =?us-ascii?Q?qxtqrFo3CPrCTvp/vE4FE6ACW4TawzsC4P0Sn432VONVi5SySa9wbxQ73UsK?=
 =?us-ascii?Q?FyVp7SCIuSLUhIDdKiJp5sO9XPHr+Gs04YAqfDYGrOTnauhR7oyMpmEWJ6yu?=
 =?us-ascii?Q?XYqU+ruk3wQKstRRnHoJ6i8xp3o0lO7mxl4ihh2cBeI8h0TlW2SbsHDz390H?=
 =?us-ascii?Q?i2+rKohdrdQtldkmts0t1D8IZVo5XXowyJ/Hodegzgfdxy+SFCPtuqjwvqFy?=
 =?us-ascii?Q?5n7kalztQLAWMLMTXuIjoecc07/eTO/8JLr0g00Yhfvzv4dI3+N/jjbNN4N9?=
 =?us-ascii?Q?0cdONZyfXbWb8UDGyjx8n7AsDNR0B62yQrILkn4yPtiVvMK9ZWDuX+z1P0eN?=
 =?us-ascii?Q?42TwgT4FaZdMGL3LNmppOcLncJPvwk0x2ttJLoHAsXyX6fxWUDb22egfyZqZ?=
 =?us-ascii?Q?al1LKKw5ocRmLrh/ywWA8/jtp6jdP0+T4hcpVX+94NP+PvluzvqO5t93bt5H?=
 =?us-ascii?Q?Fy58lVSoFm/lQBPTg2HtSz8Ypfn2i1m0kQI7PdQbMYRGEZysD8+AcUD3oSht?=
 =?us-ascii?Q?MPeFGWZb4gxFWFpvbvq8EOFdsNUcvbS89CEqzzb0ORrqpM/qksJETnXtViq0?=
 =?us-ascii?Q?2W0tXpCgVuRh0Pa5kDmK7i0OrSdxwuPEPx9En9QDybcRElMgJyfx8G2UF25x?=
 =?us-ascii?Q?ErNQ0lgGzI7OXi0x0ydv83+F/FEIintNf1OnW0NGBKvD2C7fy9cUajcjHQD8?=
 =?us-ascii?Q?aWWsw8+VIWXZjoKKdSH3mDFUDktlzu1xweYxOiI83hyhaJ2A18h5d5bQ9+vm?=
 =?us-ascii?Q?7DTMEJC1MTQVzPboGMSRc0g/Z4e+71JV/h4KqRPcXEWbPa6z06nyRtiLdF1h?=
 =?us-ascii?Q?bMTI+UJi+ap1/kaJo5RKB7PqWXWzidW01RV7YZ9qYJIXmxL57jVLK1LLVBrZ?=
 =?us-ascii?Q?dLwK7duvp3gqHhSOes/KAOSpHUvgpAmqog1SD8mdqEiWtuJkU2kT20k1XN+r?=
 =?us-ascii?Q?ZjlqvCnCWyNH8s8TKT4EOhb4pXbJ4DrX8x1zro10huTWQjQ+RM0Oaygbl22G?=
 =?us-ascii?Q?H7rqnQ3EFE7fmI1LfawNsNm5yT1UZxyZ+X4qXEgYe2tv5ag+bZ9+iPlTNMgo?=
 =?us-ascii?Q?aNh1xxp1x2F1Rl8dakfMJJ0Xx8eJkLslH9iA0ld+vE4qKLN5yuFjuHM8CYj1?=
 =?us-ascii?Q?CA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	1IenAApLP2M+VE62DlMM03WDWVFlMD25xNUKDE62VwpH2CweUvKsuvVF9CCDIiHsMDTvqTcZOejdfwgR+9fbqe0zAhf89lN6WzIhU6LRZJkgvbHwx/xpSOutb9IU4ddPVjg4VbDktizTGTKTeR0tAj7Oa6LhWyNcDlrUHkvDCVJnTTZjsTzsLdlIrjoDv/z1nl7IOwFlPB2FL4FaHQMt0LhUR9PW3AuLIC0ex3noyYBXPY9VC1vMQBvQpHJUiAJqS4PPMdERHhmCuwe/pKt5kuWVwFXm6Y5Th9yrYLUcgQfl1VuKwvdgRAxcRwogznuXOqytOcbvqmf5W/94DAc9Mzq4zACkXt9lgQ+io8UQfwTYvJE0+E1D96HTx4b2B9Jwn3AKaC+08Gd3G77OOD+c3T2w9ILNGdps4lcrlahSbPoGLWPMSLSouDajZbUV6MtBRH9juVjJ63kKs1lwtPTfyLWCPwcxJ8+8G7zLFABtG7K0ryQysP7uElKZcwjmLMjnpGHJGI7vYtYc2vwppBWyovMlGwXQCbqz78e4wXLhnpbTZPuex6qHoxsvYVHDJzoDYdRHnw2wHJQHkAZLv3alabRhWoHRKifI6XhK3nuHxSI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9decfb8-e41d-41b5-e5b6-08dc8c1378ca
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 01:44:03.9615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9fGuJVVYYXFB7hyFcpET7r0q75Q2jw9LNBVwTRCSs4k4Lj/FUjSX3Zd9ec0vPJxr3BN5v6ma+9+qxxWV95lT3stganohQ74aIqJ24jtWMok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5755
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_15,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406140008
X-Proofpoint-ORIG-GUID: ICQxOEpYu0amJn_xjXlrmMSH3Ui4nFV5
X-Proofpoint-GUID: ICQxOEpYu0amJn_xjXlrmMSH3Ui4nFV5


Christoph,

> Split the logic to pick the right discard mode into a little helper
> to prepare for further changes.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering

