Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 035FD488637
	for <lists+xen-devel@lfdr.de>; Sat,  8 Jan 2022 22:02:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254924.436803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6IpX-0005ZV-2K; Sat, 08 Jan 2022 21:00:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254924.436803; Sat, 08 Jan 2022 21:00:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6IpW-0005WW-UO; Sat, 08 Jan 2022 21:00:50 +0000
Received: by outflank-mailman (input) for mailman id 254924;
 Sat, 08 Jan 2022 21:00:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bjy5=RY=durham.ac.uk=m.a.young@srs-se1.protection.inumbo.net>)
 id 1n6IpV-0005WQ-18
 for xen-devel@lists.xenproject.org; Sat, 08 Jan 2022 21:00:49 +0000
Received: from GBR01-CWL-obe.outbound.protection.outlook.com
 (mail-cwlgbr01on0710.outbound.protection.outlook.com
 [2a01:111:f400:fe14::710])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0bbef6a6-70c6-11ec-9ce5-af14b9085ebd;
 Sat, 08 Jan 2022 22:00:46 +0100 (CET)
Received: from LO4P265MB3790.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1d1::5)
 by LO0P265MB3227.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:15c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Sat, 8 Jan
 2022 21:00:43 +0000
Received: from LO4P265MB3790.GBRP265.PROD.OUTLOOK.COM
 ([fe80::fc6e:45e9:37f5:71a8]) by LO4P265MB3790.GBRP265.PROD.OUTLOOK.COM
 ([fe80::fc6e:45e9:37f5:71a8%4]) with mapi id 15.20.4867.011; Sat, 8 Jan 2022
 21:00:42 +0000
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
X-Inumbo-ID: 0bbef6a6-70c6-11ec-9ce5-af14b9085ebd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IE7jo5NG24eJjnOnZZ3qADB+DYOaAe3oiJBQ3s4JmrDWXaXrXWvXReVEc7Q36SYyrbebzfdlz6UCjlRubIkttbc7dfeiKOQ1koTQ8RXc20AqlzoJq3ziEmuY2yvc5Wkx4GVf64iOVevJS8+qQ7+PchPZd2EZrTsR4gtFHAMu+kvil203N7uVCLdYpQCWEYrrdPpyaRxtT76Qy9V6wvDFGytVkEIvMxndIz1085XYYP/TK7vLsev9XKXO0PVhU9Zv7bzftIEzENXN9+IUnL8fqPxB1117gndt6AmxlX7NSBNo78j+NOba7aZ2vR7JJ8qMZB9nTAt5zvK0P8RFwL+o6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLSILlpHb90Vh7CPi2j82QQnnUTRjVOzMVHjsmrIF8c=;
 b=FaSmbOvW40H7NNCUL3wyFjl+ACgXIlp/FMGsK0srxHtV3YLdjEgNb1QNklEvLCW6GoSAmdGGIyCc8PGD/gYROFHorx9JvVaeR69XIgQ2T1+wAoxI6KHMjptjiRmPXYrhWebBbMS5WrKUxgMLIj6adZgQ8EXUiSGmfqlwlvyHI+10DmoPQKXglmmCHGzTOzLresOcqMCli8NosV8uKYoC7robPfnA5o2wdVnDaGJWy2VqrP4UMvmA2dzCSs8kOxmiX42HZpnlTiLM0OUY1BBcN3y7YvRDW78cTS4i9yXGR8vEkrNzQSUOFb0wI8X5C4fT6DaqbVSoiE2Sk+Zz94joLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=durham.ac.uk; dmarc=pass action=none header.from=durham.ac.uk;
 dkim=pass header.d=durham.ac.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=durhamuniversity.onmicrosoft.com;
 s=selector2-durhamuniversity-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLSILlpHb90Vh7CPi2j82QQnnUTRjVOzMVHjsmrIF8c=;
 b=bZgOIHU8oMizttnPtmDT7/dawX6o7Tw3KlmzDFb47RbGjL7/0R17MPDK7HuyjVzXOKLUnRf9lDH4IZ0x2GaAr9r84BSE2xALzobU98TPU+t7UoHgucsJjKQy432e3cXRvcOCjxJiEZSHk8RFXMP4CxdFj78gbQ3EcDhBpU4GiFs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=durham.ac.uk;
Date: Sat, 8 Jan 2022 21:00:42 +0000 (GMT)
From: Michael Young <m.a.young@durham.ac.uk>
To: xen-devel@lists.xenproject.org
Subject: Re: HVM failing on 4.16.0 without qemu-xen-traditional
In-Reply-To: <e5ef58a7-3615-2e47-bda7-fa90a7593969@austen5.home>
Message-ID: <7c7d1b39-967-752b-21a-cd32aa746792@austen5.home>
References: <e5ef58a7-3615-2e47-bda7-fa90a7593969@austen5.home>
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-ClientProxiedBy: LO4P123CA0478.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::15) To LO4P265MB3790.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:1d1::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16323e90-b054-4f4b-79e0-08d9d2e9eeec
X-MS-TrafficTypeDiagnostic: LO0P265MB3227:EE_
X-Microsoft-Antispam-PRVS:
	<LO0P265MB3227684D301CD8CE19B77B58874E9@LO0P265MB3227.GBRP265.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1VQ6bagYVhqxjIAezI9z7sbBnx3WD9o3A3cV5FKlfizfibsR84a4aG1YTmC2/8vrjH4YBjA8NO9w/VhzgDR9AUsFaKlB69kfvPmdexPi8EJqzeGtrJg7WqsQydeeAq3CgqCQpZIukwhM4xJuz9+VkgPrSM+FTil7fkC3kY7Q4WenR5Re0LjEdVayFh2YqdcAB7nPs8VnIiTyPX0LHfQ4BhoCzml2Mg6TWRLVrlSLgkicoyqNTeDPmH5fxaoGLWF/kkB4Y80p1r/dhoI5T+b4so4FfoSJXx0nz335P6nQrEPnK7FyDOz/Wt/Khz1m8BL8QTVtASbmVWdeG9VWDCQ5KhAw6+FOVNVf9ORx85p0e0262niL3nw7e8RFAccP6yJvt8+sG8kboq+r6UO6olmxhxkAw3yG67G1UjgE6vsitHUOAYGKy+1oU6o8N4Sj+wwvy5QOgO2DrZMMk3F0/XNxo7IrtWRKXZPp9wxjCqyUYw1h/WX0T5dIAtNZKoEJooM+144c31Prbc/BDPoEDSehcyCf8k9RSw5Ys5BAmjcg+5HupHJPrkMtHxU6X59mUB1UzKxUChuGnUzeMaDCvC6DtCEgYSrl/KIJ3n4AdVgOjWELUnbpDWpQ7OoC+yrwNfxsrDBX+1YChngS/sB2NjVs+g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO4P265MB3790.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(508600001)(2906002)(9686003)(36756003)(186003)(6512007)(86362001)(66556008)(66476007)(6506007)(6916009)(38100700002)(66946007)(786003)(316002)(5660300002)(8936002)(4744005)(8676002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6mlkZVGFwhOc4L5w9pDnIHS1YyUE/i6MENkUXn0HWhzvfNdJ0Tq4Cyv+pzKQ?=
 =?us-ascii?Q?zVvBc/iAhTDrVHyigRGBi6hgmu14/9xgHhUNqigTdBkhOGZSg3Ugw+RSmKW1?=
 =?us-ascii?Q?QZoWqRDi7xXYgtWmnfjVhOYIciAOZFFZDRzrcZL7NF6EckOfChCTwn2lIhCy?=
 =?us-ascii?Q?A2cSvtX4rt298PJ4FncaNO/sPDn/mR5U81AV5l2OPTReeUhmCslJVDJjjctN?=
 =?us-ascii?Q?ALvl4gUkR8BllKiXdrFi4uWjeCO3iMG2bkw4EhwOr9XKrfpzIXJp6+nxQcYR?=
 =?us-ascii?Q?7igi54SiFaSTcMul45XhxsR1rjcAIcCngzm9FFGra4hnFyIxUNbfZUsN1O1u?=
 =?us-ascii?Q?9ju8GXQlGJ3cJijQU+QoLTTW6eXJ0PTbant8/xFIjE3kju4RiD3khR3pqOY3?=
 =?us-ascii?Q?R4B6QejyvIl8+sk2SNdw/4pnvHqFHRvtqwxPpxdk6Q2/hap53WGBO+s0wGqw?=
 =?us-ascii?Q?ZkKWHs/FgmQU+3FmjcGIggUvnZARhEO76354Qh/LHrLlkpqoOpkO7KTKXHVN?=
 =?us-ascii?Q?K69Mqb3tsxDcupseflZXXe1dXuNIuZi4e8hVo7c9epQax8DH0qs8Jfr7+K6S?=
 =?us-ascii?Q?vmQysdm5PLy2Z4SOrUivcfcOl8gI7jXt3eaM+vhA/mqXMQOO5CR8bJCDHfOx?=
 =?us-ascii?Q?qYB/dAfTKj8uhtZvWrRxrvKHqwI5/N76LN7brmxTyr3s4pzx1SBsxVbPCytl?=
 =?us-ascii?Q?XVN6B/WCu0dDBhvcbjW5sm/FKd2LnyA+TwD9ROZ48yyGOnWmwtb6CXsB2lPc?=
 =?us-ascii?Q?udM/TF89up8jsl+xxU8eeaNqh7l8Ul0OUTiFUhFYZjNDT322M+ycS3xh2t2x?=
 =?us-ascii?Q?VI4BVFYHBAivXWowQ+yZZwtqQQixo6gxFNwThnej7utALFSPdhxFpGisfq7V?=
 =?us-ascii?Q?Hs2DCfcUKTFpfG7Izid/TggnNTqe698PvalTptivFMNSwAfHYxJBao2/6mSV?=
 =?us-ascii?Q?I+76ie/P0vOIMB410GKAOxgSJR1nBUocBXskFktYKWDsHiKqbx+Z6Mb0p8DD?=
 =?us-ascii?Q?sDvkEhdJY7KYgpGmLMzDq8q4OaemX1HiyvKjt9uLG6+1Zyk9jjjdinb4KUsd?=
 =?us-ascii?Q?8JpR56L8jP1vaWEhdhbSp7Hct84MSST7wIuF/iPVVcXJ8PuuHsi0VniwDe11?=
 =?us-ascii?Q?J+nP7SO6jA9e1ExgR/UAnzi6LwVOTS/SgI7OjMQZlCsk+sl8xKTccWH/MD+y?=
 =?us-ascii?Q?4YVaBX+M4c0nwCVHvnOGqx8J3JyQDQzoC1rf8nnW4rNCnU451mv48YBmQQ+Q?=
 =?us-ascii?Q?eeRn4FXIuvotRizLqMKHcv5Eejv6jLn0TgC6/Ck1YBdxCrJ9t4GKSHsmPUSN?=
 =?us-ascii?Q?wilAgE4VY5GNb1r/JOadLu2Cnw+as7JehSid6nrkrxJzFrpVBmgAZYcuICSB?=
 =?us-ascii?Q?/URqRxG0O3EMw/3NSU5piAGracLaxhAX6NGVqol7MznVjwNxBriDT8Gqo2br?=
 =?us-ascii?Q?hJ5XEMECExsrc9fCkgWxU1DM/l3q4y7yn+8kBcdkirYnoq3qixuaKqk/MvsS?=
 =?us-ascii?Q?kckpqd9Qr5XBXwiLjbG4vmwvXUWB45kBn0YDevbJYY6KdETj7xr/Q52bmeuF?=
 =?us-ascii?Q?UrL87XsAcS/xpLigilzbjIAj4U7SSbxfwwx9nmi0ZxWbm9qiQ1v3egZ/q3+R?=
 =?us-ascii?Q?GV4cIADUmtesmm306Ol4HXdKk0ha6v58UoEzTvZJxrfOkbKGBpkwpxWOycTK?=
 =?us-ascii?Q?A1gw4y3aZpdwYTEqHFL1Sy5sQDI=3D?=
X-OriginatorOrg: durham.ac.uk
X-MS-Exchange-CrossTenant-Network-Message-Id: 16323e90-b054-4f4b-79e0-08d9d2e9eeec
X-MS-Exchange-CrossTenant-AuthSource: LO4P265MB3790.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2022 21:00:42.9041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7250d88b-4b68-4529-be44-d59a2d8a6f94
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DTi7IthayNSwfk5BMh6ut/bT2Qu462O5JLjY2nBCAd3YgxMGq2L6l+uFs29bpaNJ2uyyfH3MTf2beI2aayYLSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB3227

On Sat, 8 Jan 2022, Michael Young wrote:

> I have been trying to build xen 4.16.0 on Fedora without 
> qemu-xen-traditional, but it is failing to start HVM guests.
...

Ignore this. The problem is in my rpm spec file which hasn't been properly 
modified for the no qemu-xen-traditional state.

 	Michael Young

