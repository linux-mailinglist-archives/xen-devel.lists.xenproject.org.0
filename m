Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EFfUFp3yIWpAQwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 23:48:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B55643AD4
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 23:48:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ford.com header.s=ppford header.b=HFNYdEF0;
	dkim=pass header.d=azureford.onmicrosoft.com header.s=selector2-azureford-onmicrosoft-com header.b=BMjdpEkn;
	dkim=pass header.d=saarlouis.ford.com header.s=ppserprodsaar header.b=OJS9LxAK;
	dkim=pass header.d=ford.com header.s=ppfserpocford header.b=WO6wwkd5;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=ford.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1328573.1592960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVFuD-0001Gg-Q4; Thu, 04 Jun 2026 21:47:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328573.1592960; Thu, 04 Jun 2026 21:47:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVFuD-0001EG-NA; Thu, 04 Jun 2026 21:47:13 +0000
Received: by outflank-mailman (input) for mailman id 1328573;
 Thu, 04 Jun 2026 21:47:12 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wVFuB-0001Cd-BR
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 21:47:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVFu8-00BQLk-NA
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 23:47:08 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a21f258-bab6-0a2a0a5309dd-0a2a450aa900-8
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 23:47:08 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a21f25a-56b3-0a2a450a0019-94a38ff110c0-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 23:47:07 +0200
Received: from pps.filterd (m0482515.ppops.net [127.0.0.1])
 by m0482515.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 654JnVVc440297
 for <xen-devel@lists.xenproject.org>; Thu, 4 Jun 2026 14:47:06 -0700
Received: from dm1pr04cu001.outbound.protection.outlook.com
 (mail-centralusazon11010015.outbound.protection.outlook.com [52.101.61.15])
 by m0482515.ppops.net (PPS) with ESMTPS id 4ekfv1rw24-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 14:47:06 -0700 (PDT)
Received: from CH2PR07CA0008.namprd07.prod.outlook.com (2603:10b6:610:20::21)
 by LV1PR16MB941225.namprd16.prod.outlook.com (2603:10b6:408:3f2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 21:47:03 +0000
Received: from DS2PEPF000061C3.namprd02.prod.outlook.com
 (2603:10b6:610:20:cafe::86) by CH2PR07CA0008.outlook.office365.com
 (2603:10b6:610:20::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Thu, 4
 Jun 2026 21:47:03 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 DS2PEPF000061C3.mail.protection.outlook.com (10.167.23.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Thu, 4 Jun 2026 21:47:02 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 654LWUZV3759767
 for <xen-devel@lists.xenproject.org>; Thu, 4 Jun 2026 17:47:01 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4egeyps40m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 17:47:01 -0400 (EDT)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id VFtywz0pCfWWnVFtzwFWLJ; Thu, 04 Jun 2026 21:47:00 +0000
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
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppford; bh=3rkXkEswGjjazpEzcRwcbtrCGdq
	lbg1ua9p2WVNs/X8=; b=HFNYdEF0kqP4XInRbeSmRPmxfCHBQn8izceF2mg/l/z
	VzOA2EmwqickWsNV+EevR4HRIW88luCa2FDGTBPZ0+FUBo7fxAmfIX63hjnhMy/z
	ES7KTXX5Z0gK1EMZjoMfkBP5D6q9uJgR0ixZp8uyIW7E3C9F0wOxc7JAjcjF4ZEk
	oBbT6ZWecgISJoH1SjgzvwhsqqqOMO8xlxYCEDjuKRn+MEfawHHV9hXo9HJCFvcl
	jb6UD8JxVm6jOC2Bzfva34aEumno8OG0bjbSaSJIe7xI0TODVikNQPmMcANxPMhE
	R8xrjUa5oOSLWqDdXltEsy6EbXh8i8QazpNsXZvbKDA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dNGJnH2ZsgEQrz7nVeu/eTFP8vgyBHCwO1EdyR0+7pfMrI1C1WKoSJXBwSyNwtzRRoT3FdZW6+c15xhzoilH5PbpmtiRaRNrh/fZ7cPV7FUFrzzagFrtImRCgwjSqQZY+EHHFLFpa5ejmBI2gX4BJBF9zSmNxJ5OZTUIwh2olmn51RngyqXeOkgLDNBvckfC+wIPMfZH3ZUoE5zGaCQAl9sTyYnSfHgQPiu7VsCnkVq2HYLllrIyRsz0RqPfh0gymd//Oh2grDDgHwrDYzyIxPqbBo/CTvlyEZjziaJMIRq9oVu+Z/DnGHl3U9IwPMNZof9UnSalRR8gOQTwFyzDjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rkXkEswGjjazpEzcRwcbtrCGdqlbg1ua9p2WVNs/X8=;
 b=tOcz1Im7pcAVojHy0nc9Xnsw3vzRYv/xIuPdEhiMY+xfaMJzil+ucQA/qw3fQwkH+KZtWClzp2+YzU7bbivlIFfLy7o4nsgZOrVxmzEE9kXuaPQri8sUPQcBkX+0Fq6enewzH4ZjgLzDNNa52WSlVVh8Ok4GZcJADDsA7Mz/dNj7YtPVFvA6wAq5G7Z+hgz2LtTkIGmygwr58kdf94yKlTrfcXhY5eoDa/S1mlV6QHUyXehRTmP4yPFwkQL4oRDooJJqkM4pUMtRyAMg+VXGZuKH54xFRAcK+g7i88dNHViyaWx6J8e6c3TfiV89UFRnfiJBwsycqvkgc8AidsXxIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rkXkEswGjjazpEzcRwcbtrCGdqlbg1ua9p2WVNs/X8=;
 b=BMjdpEknuM4aZ6JMR+FHxMEncePb8pdYv3uzYQPLm3QByMVGqrh7OTZJx9qRC8ON8DjTgFofQyqR+rRtZJqlf2Mc+bowq4pJtOrwAmXIJmPYgCPmGnBTKfA9LoD/AtkBduRE//odxd+xqSm6Kf7s2l/vzLqcZV0s2cSZechP/3Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 205.220.161.53)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppserprodsaar;
	 bh=3rkXkEswGjjazpEzcRwcbtrCGdqlbg1ua9p2WVNs/X8=; b=OJS9LxAKkv8K
	oQRzTMpHWxy4kwReXjM0nKarCVOOKdEWmO76ylOmlNLdlPfpA16SOmA3pMe64MxM
	p0pX9DJuUJjRpTD9qvFMy2IMa9sQq+q+2rEy1zia3s4FrtuNTzi9zre09CzYQWzw
	ZwbWlRm3YCZ1PiKGoQACBkxShatnaGMCR0htJEMHs2jsJIG2Lvp+bsE0nF1XtPTj
	3vw8c43ar7ETXvPQyx0czXK855ATbuW+VhnDdxsNlOiohBx2LQ2bzJixHlTi6Pau
	tksYvXUL48dyoyTwnG6T1+oY9iuA3UIrqAkHfFhEL66bRkNTMykbI8LbAWf8bBdn
	QLU9WYHFLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=3rkXkEswGjjazpEzcRwc
	btrCGdqlbg1ua9p2WVNs/X8=; b=WO6wwkd5965EIivGcoG8RI0k2DnpJxN7KZP3
	q2CTNeBsm3ZWIleJdGR0rP15MbI0Zd1S+Ld0H5UWRsXbzy0ifTYpDJcrutVQryJK
	TbsAJq1bd1KG/inaopvJLz6xQv/Ww7uvFg3JM1ZH51JXjV6RKyptIx3IEnZB6bna
	cL6lx6tlF1Vlqv3GgaWeX88UG0jzCwDmXKpoWc5JmcMSb2Ef7lmiAuZc15gSllvf
	eto5sBnw+PkyGf5zEZNhi+Xu56YoBdFnfsvYpxIhF7odnRJCJDUIXWvLL4UgQcta
	c+q/QW9daEwhdUO9vICsGmvrZniVlj2QglO0OSz+VVL60F8L/A==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: VFtywz0pCfWWnVFtzwFWLJ
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Thu, 4 Jun 2026 14:46:58 -0700
To: Jan Beulich <jbeulich@suse.com>
Cc: dmukhin@ford.com, andrew.cooper3@citrix.com, anthony.perard@vates.tech,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 5/6] argo: introduce CONFIG_ARGO_DEBUG
Message-ID: <aiHyUuYWaT1QBI4W@kraken>
References: <20260603194131.1468654-1-dmukhin@ford.com>
 <20260603194131.1468654-6-dmukhin@ford.com>
 <34ddb2d2-d3ec-4042-a57c-7095513c099c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34ddb2d2-d3ec-4042-a57c-7095513c099c@suse.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040213
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C3:EE_|LV1PR16MB941225:EE_
X-MS-Office365-Filtering-Correlation-Id: 37697b6e-eeb7-4c06-8722-08dec282d00f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	TBItVnFPlQGf+2O5gl0NDYV/iBwoS6vxW+oTTB0yX29K7yvL+Nu1Xy2bgak5v9hCzip+HNQZrPK8WzS2txnjeRNq0IlHKuQG+LQNENUOqtjI4vX0xGUBGLkI9s7JMlEDgJ6xddsjMVzfFiqZBoymBZJZcgFfgFmza47gOXvfkYR6JQKCzzC3LvPe69UoOnOt1O4wybFQmXhkOBXJ6EW2tsDOH9vMelLbUeWaDnCUe33+zU7PpIFEWBeUEXuIe15eqQianNJi3AzIJwqbol45HH2CBjAhGcWonGjw1kIZvFVBDT4Ut3uJdO3dtk4W/c8FOlWCfZA/ICGy+Is04hH+thYuaHbn8itiHW6NZKvq1J8FZWQ//SJhRAUrVsi941JR+oJoU06A+imhlKh+/pf3dsoIXk45N9TzrFbhOyOE2u6uyP2tknSe8TKcZIvlIWxVPcfaNHg2/cP2MG4JezYOjO7NfWql+EAvoXG1ZUYq+u3usMVJc7twwfWIqp0A2sNdZh6DFI0WK5P9Hzd109DKkUCGhGt5x+/8NTZ6dco7YQZUBxsNAIBfT8v15M5GkURpADNGW9RSgb7GyH4H54wn8JSZD22OOSGgDaNoARPlE2ZDCh4+Tg7ThoYyHfiFcz4gAPIdYQoRXoNO5jvbtLeBwECD5G2bkti10MZ471gZlFYMsFmnghiHr2vqqAM6vgIZe74rKcf0WYBR2dNsoMmnjbn+M3+nANaYXVeVgFRxCwU=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FdzQa8tpD/5cOaDpu/U0omoX66bnHfRGAXPrZSoEYB3fEl/pCqSsMu3u3v+SM+sVA5/6WMPxIZjFAOYaGrd9kJ7tiro8UFrmVjGWf/w9dZvf/7Iro1J5eNJLutf9a1Ic2r6qzALI22A+vc/iosrQA/YCs53YDvt38tyfLozgyAvM3r0nWI2M7A3u6l0xci6L6JXR4vdfSFT1hFvzF+aECmqvAcDQMdb4HrEAGKtOjnZLrNedPLSTGNK5qLv9TwUWRQ0S33m0i6QcFFZtpBj+8yeW9LxlqNvPj3xt6ly2KSsLW6IPzq1od/QuMc+XfhSyXRr4ZJAxlx45OrgB9xketrhRIiW+GLD6ssRdhzkVhiuEkLdNNFnIaQS5cFFCZQGnt+taD5flUkNzogSHzyCCvtqh7q/itAi8RHIeUo9xIHBIOE8FJ035ZxS6m+Ng8YWx
X-Exchange-RoutingPolicyChecked:
	ZwJJSxQXk4jdnat9xvgJEyYlvAZcLjWeCMJLuIMwQNJpNSLNqHw9qw7iLMIMLXZo7uBBmi9LrNxo8bXC5GSvxuEBtAoGXjYrX+s8bQjKcADxZBP3wXY5zERHSNQ8puTvDdbNed0CEHvfTJdJNUs4lONLeIbw4DOVniC/goDPtS5UijMJ8FuAFPhqtm4n+krIpEe/lCh2ppDWwA8OLuu6cZu8ix66b99v8Z9ID3L3ijIdT7fknDjx3iOtrJm4SvW3nS80BRL/9Odh5SX+QQUT6fQnWSA+D5JaatoQ5QIjscNn2kQFZczF+2tSIPYBSXT0rN90bcwha+F78lqfj1JkGQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jNWR5v6Mnq0LHGBkesNAxRANCYJXWLjI2Im2u7L+51CapYED03WUBH9MImuYOnHIAixjk70hFIV4oV1v1ud9wjmYQYG6faqnvu/ksSR5r7UVYo9h2AOCLs9kewIOYZyxOwKY5aNrdgrqeq+hqETQWVH6Bx/VaySX6IcrAER/ASU628lSrCpr23Oafjez8FT0LvTzHBpMsXJ9R6eT1jB3d4SG1EfvzmCQCIAXojIOT6ryXLlRvLNJSCc1t39voRXpVjLyVO/SLCA5Howw1TUUwpUD1CL3AYpCLMDX/kxFy4f1KnLHf+TSqWTaHPATuXLSqVk0ZkfqGDX87n3eprQKLf5QjoBGtEMAAQIRAj9Aw6hhASDMdX7fiFC7TgsFToNhKqr6dwGfgJ2TEoGGIHs1SQ2Q+Y25vjrFkmTWIQusXUdabr2piz+NujG1m5kE7wXUTSiTG0oJZenj5eyH63dphrwGh9FWiXAcvlggEC/zA/vNR34BEjxhEbrhEfitjmhUYoIf9uUNpQQ2FMaVd3iqFFgJ9w02SGBrrDfO+9qPo7HUs8EQY3UYQvhoOFGQz02ylz8V9hd4sKKUVtk13DXC/0l8MTiTH9jbUhFBdwf4kAHWsEehdkItAvK5moFFscdy
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 21:47:02.3279
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37697b6e-eeb7-4c06-8722-08dec282d00f
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR16MB941225
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDIxMyBTYWx0ZWRfX49XFGjxi1cHC
 1lxaOBAOpuZPb+aEjqUKwoYKzLvIHNCzirxF74cXPGtyl+t6N64P0+bhTd7W1R/HXqPghyAnLBk
 MDJLEmr48km8GiJi7Vu7y+O16tFttwMpi9485dfkZl0jhQ0J1Et/ywNjFKI6mpXTI38onNLzIDL
 qnLSUE9QjWTK6+L/F7796vk8ChCAUgNdn9ZKnVkHJmOhNK3pSpcuRahwkukZEVWlFkxVUU+GRWS
 QXEuy7ryzXBXWT4DllcPsJdEd8+TRtb4SLqt0YBUK560o+g96eGHtrdJDI4YmhSiL/3f8i4nbh9
 cptNdkwgjijdlhheXp62GW4jFWZBKh7KYE9Dc64osG0bXkMCFoXgNigvT7m7WQ55LgKUvHWCqzg
 HQsKb6DgTdQNiRxOqslCq2UVBgWH4bn8Rb+9LuREptSovWRKJRdmDLAojc8BbFxNB1Wg1OKYAaq
 mCrQxC9h9CWAi1WjR+Q==
X-Proofpoint-GUID: tB2_DO-BVJOjilgmR4Qv2vAk6NQ6vp44
X-Authority-Analysis: v=2.4 cv=Ify3n2qa c=1 sm=1 tr=0 ts=6a21f25a cx=c_pps
 a=85i0V4ggiSMiQM2jsTwpvQ==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=0GA0A_IKJoUHBEAzNTkD:22
 a=cbNQJ9GKAAAA:8 a=zBuQnPAgi8yKKLfrsoQA:9 a=CjuIK1q_8ugA:10
 a=G69WFyCBNqGPyalROSdv:22
X-Proofpoint-ORIG-GUID: tB2_DO-BVJOjilgmR4Qv2vAk6NQ6vp44
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040213
X-purgate-ID: tlsNG-4011c0/1780609628-7DD828B7-375086BB/0/0
X-purgate-type: clean
X-purgate-size: 1339
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:dmukhin@ford.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 23B55643AD4

On Thu, Jun 04, 2026 at 07:37:28PM +0200, Jan Beulich wrote:
> On 03.06.2026 21:41, dmukhin@ford.com wrote:
> > Add Kconfig knob to enable traces for Argo debugging.
> > 
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes since v4:
> > - fixed dependency on a new Kconfig knob on ARGO
> > 
> > Changes since v3:
> > - dropped uneeded "If unsure, say N." from new Kconfig description
> > ---
> >  xen/common/Kconfig | 6 ++++++
> >  xen/common/argo.c  | 3 +--
> >  2 files changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> > index 5ff71480eebe..7676a78dca71 100644
> > --- a/xen/common/Kconfig
> > +++ b/xen/common/Kconfig
> > @@ -491,6 +491,12 @@ config ARGO
> >  
> >  	  If unsure, say N.
> >  
> > +config ARGO_DEBUG
> > +	bool "Argo: enable debug traces (UNSUPPORTED)" if ARGO
> 
> Why is the "if ARGO" still there? That's fully redundant with ...
> 
> > +	depends on ARGO
> 
> ... this. I said the v4 issue could be fixed while committing. Now you've
> posted another version (adding to overall mail volume) and an adjustment
> still needs doing.

I was not expecting this series to be approved for 4.22, so decided
to send an update, supposedly so no adjustments are needed in the future.

Let me fix that.

--
Denis

