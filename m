Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Gfb3IVHEH2qopgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 08:06:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CE0634832
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 08:06:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ford.com header.s=ppford header.b=rvyyvRLW;
	dkim=pass header.d=azureford.onmicrosoft.com header.s=selector2-azureford-onmicrosoft-com header.b=fTCxxj93;
	dkim=pass header.d=saarlouis.ford.com header.s=ppserprodsaar header.b=eHAg3jrj;
	dkim=pass header.d=ford.com header.s=ppfserpocford header.b=WTPy+2D1;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=ford.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1325655.1590971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUejm-0005nJ-Pe; Wed, 03 Jun 2026 06:05:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325655.1590971; Wed, 03 Jun 2026 06:05:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUejm-0005l5-MN; Wed, 03 Jun 2026 06:05:58 +0000
Received: by outflank-mailman (input) for mailman id 1325655;
 Wed, 03 Jun 2026 06:05:56 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wUejk-0005jr-Ix
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 06:05:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUejj-005GxG-PG
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 08:05:55 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a1fc442-e002-0a2a0a5209dd-0a2a450b962a-18
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 08:05:55 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a1fc441-212f-0a2a450b0019-94a38ff19ae8-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 08:05:54 +0200
Received: from pps.filterd (m0367129.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 652LYb1t3416429
 for <xen-devel@lists.xenproject.org>; Wed, 3 Jun 2026 06:05:53 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com
 (mail-southcentralusazon11011014.outbound.protection.outlook.com
 [40.93.194.14])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4ej77aab39-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 06:05:52 +0000 (GMT)
Received: from SA9P223CA0005.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::10)
 by IA0PPFEEF394D01.namprd16.prod.outlook.com (2603:10b6:20f:fc04::fe7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 06:05:50 +0000
Received: from SN1PEPF00036F3C.namprd05.prod.outlook.com
 (2603:10b6:806:26:cafe::2b) by SA9P223CA0005.outlook.office365.com
 (2603:10b6:806:26::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 06:05:49 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 SN1PEPF00036F3C.mail.protection.outlook.com (10.167.248.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Wed, 3 Jun 2026 06:05:47 +0000
Received: from pps.filterd (m0373460.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6532gYQS913809
 for <xen-devel@lists.xenproject.org>; Wed, 3 Jun 2026 02:05:47 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4eggrxvknh-2
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 02:05:46 -0400 (EDT)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id UejYwblOgpOFEUejZwW4bK; Wed, 03 Jun 2026 06:05:46 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=pjO
	ud2VHcJNKpSqn9X3Zh4MzFJlMqzam/N5pBG8cFDY=; b=rvyyvRLW9Ojde0+lcIJ
	y6MMMjlDPXRlx9Z4xfXHFgdO7OeCfBX03aeB2ThNhax1xu8ILRYUCQavI/CWXVCQ
	5GJqOb2gOrhD1tnBMHxx2rhu5GXKCUiXCt44v7TbILn1kIN6sVRl/eOpmKdMlGH5
	cRC4VznKBGDnYZegvvMOBd9tIjjb3tIiedgcvXx8ljVFTGbMiQXOY3qLIUcfyteL
	5KuO/o1d1WBTrpgsGAztenQcBNdGLiAJ3XuGbVlmxOuBdJam4NboqghyUw79HnPq
	ugyN/lXffKq/1QmlorK5gIkkIwiR4T4QSPUApd2m4ZqAJavLi7nnVzRy2/CV8WuW
	Zog==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uwBvBvaBkVoNnCQfAASCOB66FlxLcFZqUqU9n0giqJ2y8mj7nFoo6C+R8gzwZVOQgdPVFMIr0LSs9vfe8IfcEcYLTeBAkIVuwiSZRcdcrdVXqe/YZbI5Qgbz5CGt3lPgqcN30aF26Rlar13dsTWfkBfeDDYJBeZxp5GYNC2La2BRb/To0pfdC1kJtx/jd+ZpTLiUO2HXGDx1JiM+Ro13V6nk1DpQhmZM7iHTlBIOpYxL4uyEmPkuDit3P5AxF6fFdJu90Hph1ymmX9xkCCJYPwMHvvdMz317jHBeSgEXcKKLMcyWq0WOXiSP66hseimGZoLmp8fceLnYyMCZIRIiNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pjOud2VHcJNKpSqn9X3Zh4MzFJlMqzam/N5pBG8cFDY=;
 b=V5H48FMLrYAp6Q7JYQ9+Pp72YMxS09Pzw68A47MLJg5q/e/knuii9XtvQlUR9NjbLh+Wy/MyKlThFWcHhtSR/AgmUVssXbOTU3/fj/N+KVk7l5JDHSSjlyc0Rg2aUzUckvhkzxeBzkvnbLv5F4yzKjhE7Lkv3v+qHVbT7wjK5OKdKvnAMNJ/JFauT0ZuVJRctuerG63N2Tov9qqasvjZTxPuB07XDXRDDVfdDK2PinfC799sYqAhQkrPLFThIJIxGZ+zV37WrXsNtJOPjpGP90N5tPQL6FMvYyD8esQltZfgfxjhmcMfZmvNN/EU3i3WqkCAIQ3d1Gtish+QIMXeBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjOud2VHcJNKpSqn9X3Zh4MzFJlMqzam/N5pBG8cFDY=;
 b=fTCxxj93gERStj08wAn24LoqHFSGjtdxx1bL82GuvAADvAgyKlAbebv7JDrdavT9JH8kUwuz0TZ+Hn13V8Ou+lVcex4O6O9SZWFveFf6Tdy62kRm3EmjtrlKBpS/uMIkq8nc7XPAeRVIXVQ2laf58JpoQ2kM8EdCY/j56zIhEWA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 205.220.161.53)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	ppserprodsaar; bh=pjOud2VHcJNKpSqn9X3Zh4MzFJlMqzam/N5pBG8cFDY=; b=
	eHAg3jrj50ywN/bJDKf87Pj7oyTNLck5RfYZ7GIJVuDcEFrSxnvxqPjnszYKl+s8
	jibrC3v7UiKLtwgQ1RU+VhC1AWjBNuXuhAGCcmIlCMS/7TbkalS77b5oQL+Jixxx
	LrdZ2H8XVq+2mzFeNPw0h6im2rZyBza61QifTXw5QgI/sJFuslSBExHSC38I/CgX
	Hzrh8oJcHOr2JCkik1DH5XFhSB9KJC8sbt5C+bl5IjzJed+ufEpDptHyfK0OVW3t
	4GZpnmFZYk+xEwk1IQtN4pp9+4EQWKbB+7kebRedn/cbqtO/4i2dS6bklLVKrqla
	Gwc3Gzc2ejZ27J4/L0EH7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=pjOud2V
	HcJNKpSqn9X3Zh4MzFJlMqzam/N5pBG8cFDY=; b=WTPy+2D1+xtIN4YRnGGz0yt
	L2MOAaYGlVG8UpKsShiYkxC0rinomnTqfjVxLF2HrAawlN5dtEIBtWsp+U+Z3N4Q
	i9HMAyLQ7F2ovxiIoxQG0eQcLrgQGfmenyEiRn16ZLdlwu5Jm1Po7ke5DXWL1AaB
	A61iw63Kztxm6y6RYW/SGf4LPfXK5FP5Kxevb3+eVDptIpzxxeOBYoom9DJu86rF
	FuILQVBeorxOvOyXI6aDLmcDty4a6SGTy+X5mrHUOGEYfq+kuVkUJ6hBvi8Dw73f
	HDL8yllEa18K9N7jXt/VTv/LoSp0VGHDtLbA1KsfCFfIBJuAtqJKwkH7HKQ6Shg=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: UejYwblOgpOFEUejZwW4bK
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com,
        Mykola Kvach <mykola_kvach@epam.com>
Subject: [PATCH v4 1/6] argo: lower level of noisy connection-refused log
Date: Tue,  2 Jun 2026 23:05:34 -0700
Message-ID: <20260603060539.1181809-2-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603060539.1181809-1-dmukhin@ford.com>
References: <20260603060539.1181809-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0
 suspectscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030056
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3C:EE_|IA0PPFEEF394D01:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 852b9bb2-058e-40b3-8c71-08dec1362830
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	gN6i/eIQljm7jyoHK6IRvREZT7dbMlT+juIkaw85Tx2ouKWtT8Tkp3cGrAw5g2/T6gr2tXyLICZOJvwYeGPHFL02G3M5CFEo0i2QIVifKVEoGuPCFaVMXg3Jjc30QVp5ZZhZKkwO+61AwFP5zMHYJDRxLIzP+Cm0mJnWh2M3kpYNq3kmNkxKBKFht1Ux18Ghel+dzel3Ix8TNsxaKrEN4Q1rSbY0NstCq02u1D+MnSoRkQWJiyuodol+pq4eX1GSk20mezhXWmVBwGYdi0H7G+SgPao20GFSxp+mIPBKOcq0c6BYhI52l7CbFZfFkdlmnUoRwdOEfgYzdHzW5cm7ItRjPYXrG/74HtRHDK92l0+dQVKDHEsVYlRsB5u8IvqLnYiKDZgpbmtmgXuMCQJRjpdbDOYxI1TZl6bcvYjCz1zDrWryDceX4jY8v8xQe23DeSZgyvRfxsgoiI8decT9wl4F2E5Wd0d34M+Rz+juy2H8C63vaT1bLp7+Szxe8SbwjQ5XIO8CZFIRPGNVHQ8arr651S1aAJWK5ioaXj6OwclbpDFi9QBYQdoHlyBC797uYnJmebyqzscXxruOi0eSbZ8o9DpKDTNsVdpwiaHzkGUY3RTI7GenFPqwWeDNTSpB1jdYxARxqHkdZDsq/aLgV2acfD9BPCQAd8Tik8Vq+JqdFsGWNajPK12nYvi6Vqx+qeKDzhjr3lnpGvD+9xLvdrWTawgRhJWd6+viGQ6oNZg=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZADrfIxyf9f7H4M0eSnyIKVbfRRyWwaJvCTqlNRSfN67KZSbtqiFqw3ikK7xslR8JIPJdkxkh8QbY2XUPXz2vWFZgqWh3w18TSTgW+K0STzq21RFj0S0bWJhd2pCq4p3dgPgpHKmUwXEW06sCAaR8A9dLKJCAMH8KjI5T7M5dXOO6DsFZg/XFJ0v/aTRexwghtCJDzn767S95PokVMyG5cZeDS6s3UKl0+gRiVTf7VadoBJhOkTjXrBnWY1T44vg8X7Fe3XZjuTB4uBtrgC4WaCEJAyB0GerZUruNQt7ZjDzXzVXEv2e4hmbPCjjSSIxahdCOLLbl5mAVls8PErjSpQgln8gkIptEtS4MFiWsw9t9avjOz63elD88x6Cg6yW944A6THHpGAkOKgiaWxB1gzwAvmLMs1erKV3W1QG/lrHcUnsUeJ+vR2RDf+mMJfv
X-Exchange-RoutingPolicyChecked:
	hGqjlhJsHcaatHIsI/L009TDcFuuPCKybQoW77KMB7CGMRm9F8xpVimGpQ3hi+841xypTVrnvEYWHg71j3R8r7tuyKKn7LbdrNIEMFNITeeyv2RZb3SqF37CkXbTwRJiJ+a1fYKDzFmYJ0UWdQHVxe/yX3ykE5JVcpE3dqpCnCL6fg/T9WGdfgC+tZ2fA/aSsPvu9adyLkhn1AY8xlfeLp57q6z2EisDND5PNU2KOnKy68KYp44sxZTdLaLvoBjj3lD4OtCkwQ61trWzFhPnk8r/rZFKnjebpJQH6fYGXAW7jJub111sq3lvpira9Q73rZN827TK7H843jEy6/rhdg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KTxuyHqeQxoOLZq8vv58NR8hNGNCEyafCuiiOP2jJDX917/PZWI+Ok6/qFL0owmV80uuIY3hOGm+abm0PAw3JkqSsDJULHQgcxc8cYSScr+WPc2rhvnJTIL0JG1CX5JbOcyfNvJsE+ZQJROkXbSbNoXMwsYdP5MebH7hh6fmRx6AJKstCh+5jXDuqWXGyAk9JQJxVom7KX6dSms0G0L8PDM/V2v+gseHIht/QnP3JTO3mSlVvjFadsSJCRS8dJBj/ZGZGpRRgLE9BKQX9Nz9ds0B4DE+7k006LOaRKYovqG9eOcodKleCQad3lChjjTwkaicai0hdNof55S5lYonEdAZLcASSaN5JesUxirIssFnaobAB04cRSvCl+goQtK023whDWtUCd85sytY0rE3m/APz47iaDVLNXdcDJVYKee/ABQB1VNqyT9X+xYpGGke33wSYv32yMguXMosG2TA78zXQ9axTuSaridtBzzbqeq60rzWRQYnKzMHKjW5QS2scf0054mvliQsAfmoF1P5yImB8I0f7YquRuTCVCX6NkyOJZ/5tzIKL+uF3gjiptOOQKX6FO/5WBl/8Jj6GdaONwqQoveZQYlJroXcQGlQNaNKsO9L1NnuTlv8qxJ/hKJL
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 06:05:47.7739
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 852b9bb2-058e-40b3-8c71-08dec1362830
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFEEF394D01
X-Proofpoint-ORIG-GUID: YBHNgLOVeOWiGowCED_qMKPRfuvXB1BK
X-Proofpoint-GUID: YBHNgLOVeOWiGowCED_qMKPRfuvXB1BK
X-Authority-Analysis: v=2.4 cv=fuPsol4f c=1 sm=1 tr=0 ts=6a1fc440 cx=c_pps
 a=u5a0R1DJIqwdmu/eAz29vw==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=X3KReqg2EL6A36SYCKpz:22 a=cbNQJ9GKAAAA:8
 a=DBfv99YmAAAA:8 a=VwQbUJbxAAAA:8 a=Pq0mfAL3NuNqQaD0pm4A:9
 a=P0bj-C3X3jJDpopQwM1U:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA1NSBTYWx0ZWRfX9nMeOGqCPtgK
 v71J8XLglQaUr85/qIAd864flSpQiOwL6GfXyeTdKA1TuePgbBytNspctIusqLSYUu6jQUgY7Cm
 TaDqiyDkB+OtHevBJwbbzTARtiJrAwQzu9AYGRu1F0cufOXt606zN9vddUXDLKuQhYQjra3Rfvl
 yyNhIb0Dw9FhW/1XzXdBmtGwjM6EG+1f4jiJt9AgXQnvU7cExdcCchPtFAJj/RjxrbOgpoj/rCI
 H8MHW/H8bnw2WfsmTadVCFya10ICK/jHOPa5gguugbgqYfEamaF7GEnx0vWXinLVl1xI1itvdL7
 lRXugL1xE89Spw7zcpKqW84rO43RGAbxQ5c24IGc9pTMmy4QgTzcYg3aLnEt8T0chCOh+2KFdco
 TcAD1wzxYuOTf7/qqwRBpqgSg5BY3t9upssf4wbe3y9ue0+k1F5YHA1anN+Qrl6+El1CPdFb/nc
 tHQt+SerzU6cUeOFUSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030055
X-purgate-ID: tlsNG-42698a/1780466754-19364F3B-B6816D85/0/0
X-purgate-type: clean
X-purgate-size: 1440
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,m:mykola_kvach@epam.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[16];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FROM_NO_DN(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,azureford.onmicrosoft.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,ford.com:mid,ford.com:dkim,ford.com:from_mime,ford.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 49CE0634832

Switch the log line to argo_dprintk() so it is enabled only in debug
environments, as it can spam the logs when a dom0 service using the Argo
hypercall tries to communicate with a domain that is still starting up.

Note that this also lowers the log level to debug when the argo_dprintk()
facility is enabled.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Reviewed-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes since v3:
- n/a
---
 xen/common/argo.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/xen/common/argo.c b/xen/common/argo.c
index 28626e00a8cb..98a3db7fd070 100644
--- a/xen/common/argo.c
+++ b/xen/common/argo.c
@@ -2034,10 +2034,9 @@ sendv(struct domain *src_d, xen_argo_addr_t *src_addr,
                                         src_id.domain_id);
     if ( !ring_info )
     {
-        gprintk(XENLOG_ERR,
-                "argo: vm%u connection refused, src (vm%u:%x) dst (vm%u:%x)\n",
-                current->domain->domain_id, src_id.domain_id, src_id.aport,
-                dst_addr->domain_id, dst_addr->aport);
+        argo_dprintk("vm%u connection refused, src (vm%u:%x) dst (vm%u:%x)\n",
+                     current->domain->domain_id, src_id.domain_id, src_id.aport,
+                     dst_addr->domain_id, dst_addr->aport);
 
         ret = -ECONNREFUSED;
     }
-- 
2.54.0


