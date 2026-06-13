Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id q4QGNR/LLGq1WQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 05:14:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 716FE67D98B
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 05:14:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ford.com header.s=ppford header.b=DBHm+xEf;
	dkim=pass header.d=azureford.onmicrosoft.com header.s=selector2-azureford-onmicrosoft-com header.b=Yx0JGAys;
	dkim=pass header.d=saarlouis.ford.com header.s=ppserprodsaar header.b=OvfLRzmp;
	dkim=pass header.d=ford.com header.s=ppfserpocford header.b=rorpUzTb;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=ford.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1337126.1598767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYEo8-0002DL-FB; Sat, 13 Jun 2026 03:13:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1337126.1598767; Sat, 13 Jun 2026 03:13:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYEo8-0002Ac-8P; Sat, 13 Jun 2026 03:13:16 +0000
Received: by outflank-mailman (input) for mailman id 1337126;
 Sat, 13 Jun 2026 03:13:14 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wYEo6-0002AE-1B
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 03:13:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wYEo3-0045rb-JA
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 05:13:12 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a2ccaaa-2eae-0a2a0a5409dd-0a2a450781ba-16
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 05:13:07 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a2ccac0-229c-0a2a45070019-94a392170536-3
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 05:13:06 +0200
Received: from pps.filterd (m0367126.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65CHOmdc3659630
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 03:13:03 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com
 (mail-westusazon11012006.outbound.protection.outlook.com [52.101.43.6])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4erpg6uuc2-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 03:13:03 +0000 (GMT)
Received: from BN9PR03CA0910.namprd03.prod.outlook.com (2603:10b6:408:107::15)
 by IA6PR16MB7029.namprd16.prod.outlook.com (2603:10b6:208:5da::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Sat, 13 Jun
 2026 03:13:00 +0000
Received: from BN2PEPF000055E1.namprd21.prod.outlook.com
 (2603:10b6:408:107:cafe::2d) by BN9PR03CA0910.outlook.office365.com
 (2603:10b6:408:107::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.14 via Frontend Transport; Sat,
 13 Jun 2026 03:13:00 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 BN2PEPF000055E1.mail.protection.outlook.com (10.167.245.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.0
 via Frontend Transport; Sat, 13 Jun 2026 03:12:59 +0000
Received: from pps.filterd (m0373460.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65D0PeDv2807341
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 23:12:59 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4eqe733e51-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 23:12:58 -0400 (EDT)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id YEnowuNsJEF2CYEnpwesGr; Sat, 13 Jun 2026 03:12:58 +0000
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
	:references:subject:to; s=ppford; bh=hTLFjc2IvsmM6YThWVCY1qXEPlT
	s7mtXgR52UGkorUU=; b=DBHm+xEf3R02aNxfNKU1nYTgBduiCk51+WfdL6WOrZ4
	SUBjDsRYTdS5ixaiorTkGdwZLmdJfJVan3AnpSpg1iGJhnJna1UOKYV4xN4ZjisC
	FzeVNW7wv7l6qynkJcxF2OiQCB+RBbbVbv5h1qo3b0a8Rqu7jTzAPZ0uzlC6nDYf
	OeL8aET5rGVsmmKz93YeleW59bDVKtatFru7e0WveuK/rSiKJU3D3FY8JXwPuZvp
	x78dLRO3teM3wxAx9BsEKRmWC6L2S/vrn/PMQERfMu/qJ6miPnxqvqWJ0e+7hh1x
	TAjyCRsR+hZ5spLW9ztuY7GslAmOaW8MK6qED6ZjiMw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JBDeo9dKFrKP+d/uoIbiu7eBs5Ftr+QGatiIYmbfCbt5mZxpw0TQNS38Z0nQD3l5vF3+CfjkwUsJ2wzd0VX4UQx/iNjagUc0aU7OnAXWGNBhen9oomEiCFTlRNPKLCLKZYYOdP1qfcrArOndDykbrSgDjl6DUJhqRP095FmxIeA0pgEIj++vyt4jR4ogOnl5OXwvgS6RMqQ8gaTYgw5Nn/ME3nz79FjqIE6upobZ2ENXBkQ7ySvYGkMabVo+O6Z05hByS8P2BvZJM/CPhdqVOE7lC12YmvI+Y6mdJo3rspDvTouCNwiRvO6muepqFjTpsho12kOGdsqkMdvFiE8+iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hTLFjc2IvsmM6YThWVCY1qXEPlTs7mtXgR52UGkorUU=;
 b=UWajFasNH7LjAQAIqsXeUWxxFFfu5CFU97jkMmNby40Yufy4CbxAOyyyyI++b0p2pFGVNDVI1VWbLOMiou2M2GHSrrYLqT94cgXAESKJ5ZUChtptsgpA9x4lhKEJ/kIwo4rmia8ozao9IQuZ0CqqXMgXyRjk7elF+ZloYqSAxGxOe2CVcc1mOeHChbcpTzDi7PG8AvcMi6zHdPSqf/gy6rDMPi3qhteIqhqHYP8Erv9acIeSml3OTY6buAw4ZhGe+05dqz37vb6/pyydBxkOansacNG15BX1Ra0NAhVpG2XorSN+iRhSuTl1+SrUmr/EyINLlV86FGyvRzWPQam85A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTLFjc2IvsmM6YThWVCY1qXEPlTs7mtXgR52UGkorUU=;
 b=Yx0JGAysZma2FZYUsbqx3qBp7wSyFRh4hByner9GNPQRYrhSV0a5yxka5sqJ+MmQYgaANu6EK28wSAbboMOdSO/W35UvXaOMKFvsKG+hXVHf6CpAoNHMSF/XxqIuO1ikp5izxJaVk5JBPs2ffFjMR4jVizGne5PaACStXCvHbAQ=
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
	 bh=hTLFjc2IvsmM6YThWVCY1qXEPlTs7mtXgR52UGkorUU=; b=OvfLRzmpQT2+
	EDx/BexD1lxMntTvjwifqiR2pp8REoJk5jbZuUOmBqjcipg45S46ncA6I7NrYdmW
	fNxVNdQDOX48guuSaxAFwUukDlScdqurp8knPvYAjSAcZ9SI+Ndr6mGWkoL9XiX8
	FxzZV9Kqfz+pPIaAu9wS5zI8vbkAWiBdSJAmLpyD4Sa4j2mb3VknqKVIgh+Vxdke
	zG8tQsBfLlHS+PrjMYk/8DK4bPo9h5Ss2dGSY38vbN+MDj4Vfc6Fd8tQWhKZkumw
	r3pbrm/Yhz8wQ3k5Gvp4XGPK+Ea1wfeDdlyHzN1qWJorbEHopg+zqU0YWXKyPJFI
	9cwQK0NRLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=hTLFjc2IvsmM6YThWVCY
	1qXEPlTs7mtXgR52UGkorUU=; b=rorpUzTb3iy8nhQQYE4NMS4gNRsW03FRemRv
	UDrQfnXGDVmiT3lWN2P++pVL/OlAVi4+7fRderbxdXklyP6PN57q5S5k1gcAGLhO
	iPzw3RDya5NAdNTCld0V0NimgjL7OwPY/O5ySjwdYU01dkSw2HtgSqjhj3ELZxnY
	S53RG1OOlBCOWTAskfXWfhxXcc6JNdR5ljAz5T/elpwJoh9zPs3oJsJfthm8mvC0
	jkGnyiVgKP3T6oalyM3B8XZ0xG4CveD0IA1SyHVTbH20yrqZfeAipwZ7hvhH9II2
	8pEYJlqCLuSWNUfzEEGxbnD2Sz86mjad3QRjbimIkUjfhRIElA==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: YEnowuNsJEF2CYEnpwesGr
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Fri, 12 Jun 2026 20:12:56 -0700
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
        Anthony PERARD <anthony.perard@vates.tech>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Michal Orzel <michal.orzel@amd.com>,
        Doug Goldstein <cardoe@cardoe.com>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
        Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.22 0/7] CI: Refresh Alpine containers
Message-ID: <aizKuCorSE4myOJ9@kraken>
References: <20260612230924.3181154-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612230924.3181154-1-andrew.cooper3@citrix.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606130028
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E1:EE_|IA6PR16MB7029:EE_
X-MS-Office365-Filtering-Correlation-Id: 0af7e2b4-4e98-4ff6-971b-08dec8f9acad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|6133799003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	wbu8NAdshNNJa9kiPD4pAaqmLdz6IUFugmYFXt4f/loiycC3pvYxAP9X6OXvRF1zOsGhuJ2R36hpqx7H+pMag82ynMPkHFbx3h/cdNZD1mq4UEOjLsUsrX9FX5aTL4+oKZkS2V6h78FatYI9vKFAxW+k49dX6O7cMyX21BIX+4zYrvRLL35FG3JoQhjE75korRzkUGIz0EF5B2eCbDjOdoHYhQk9KYo+bNdpnRRhUyL3AHEKHMkgVabvR/TPIO99/f3UEVAyg4a4tt7qGaA/uuTZKhG1n9KN5cMEPKsj5pHILbVCK4hMVQqpSEsbOIx32jveUiwyGrwwMk/xrktIl9HS4lmqpzMPhp7vPJrRJUZiwooXFIijYop79JTro/rJmH94YOJWkXTxpeyXxdDx9bEi8hq44mUyr0uEoaBGngwHzEMwHBLQPuGHkucR/pWwWhuzB7XSTSut3hQgiGzjzqVUYE44bOW1Gg/zA5OCCc7fL45mcWUkrl4HrN1tzPeXwVBmOz+TxKWp9B4CXlfhm7ttwbps+xfh3OegEOm4xH36pPAzyp1PFUj1itox0+PfrIcGedSa3AxYt0qMOI+c+mPJRPAc4JyhuglBJHRTPhUknap4nX/7ey3ArpCuWxRU9T6ey4YKmUDgJaiJRja0W+H4CAUOIxIvWQSChYiSsxuYvc7HRq8RTC+46sJXzEHt2XPMCEBGIwcn24FqbfhUP7dH7r3xft2dJJp3w79Twb4=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gfZDevKhDjen6YHH3/pgh02ACQzj2JxkhG02WHv7ZWsh7BXFhALQL458nSm7YcqN4c45T9u1P0bakqs5TKrOdp7UHyqJ0AZP770sRw3c7QVxlW3iBHZ07zdnfpkUcutZ5kZe8dnmTStzj/glckwUlJGl975uIib9GjFDTCbr5SDZqHD4EjiWbvpvH02LgHDAnmD85nMj6tuNx2krsbgmtQbRzJoA8WcqL9Jx1v1W34jCBdKbBYF+hIzhhiWjZDR+Y5NBvhfQPM/8AYAnFbPXZ5CU2a0bJPzFTnQMuETYzpu4kX+P3lQFshS+DQnJqcS1F0K4xgcOAjf63fk7BrBGzMziDnYLen1anHIZVo78sP0AEpITKzMdh01s/D2KthRHpuC3BF/NF6QhzsPK+Wo6Xb3NsBbp93xBSAxLLSkBChu88ni3kfrmm9ShNupQS88B
X-Exchange-RoutingPolicyChecked:
	lfP9KVCWn+Xotew/RYJOOJUb343JU4tzK/vXTpp5OQPr+OYu06sWI8CUkR4hTlWM46k6FZgRpLB9+zi7W9roFpXgPudDA0JJm1XtGyl9A0kqqpynzswUaapn6X9XfJyS5dWLCICYgPQVcLn169Lo30zX10o6BUdYsI5SxK95sCtBjwysh+iKiZ1OFyLxuRmCLHfBoiJ/JQ+hfEHwN8IKQIy1yBlJFoFTk88byPAY8epTOGSlfyKbrAXvHU4DWYvDPp+CdtP11OKbf8SEGrhFZX70BbpSVuCVCgP7qC+ZQmcvmMUylrJ/c5IyVpf11uVTlY1SrvVKSvi1P/MyG/LgBQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RDldZ0vbCR7V3FVpsDO9IvREToFOC+q/BnFW8Q2k8HN4AIKrzyjOTtUXRk3W1p4JeMwZ2PYhHK5NkwIG3eFJgj8F6vgROtUcb7+l6nzMzgHXGDLN1Y4q2iWo0d1MrYAIqcYQ2pi/HoBnQ721+1N3yf9mE+1jReJEP/vbU4xC54d06OVgtGFPorwicCkeigikyd2VKTf1xeKJLYq8a7iv8FkMAc1gg5eIX9YOVD+pAro0AEx+L2HtbblyFYPOOrVUQOFXy/8LKbGT6ZN1fempnZDgvTaZYjXoOoAz+gej5sg322oS+t6xw3Nq/3L2orir+zY4UA8Zmtvwne9qkxJrR9Ek1rp96wN0YWdw7rh21kReoJcNrcoyB5SBEeZT8Or87lNjBUeq6byLGA/pBTPTUv10BcTM4r1MpVomnSs2rFJJk6qPXVswtQ+T1ukb8v43ICRJTFVsHZRv5v7QWEj0tOswezN57c3qp77WIWT/lgXzucx+ngpUFVgHQ4tvXnqasve8eDtKNWPhcSAt58g7JQMhathbJOHU1PsKM2MK2TntBsvtXhdTL9ts0KUufNzzpaLF+b6SLqwU9xM3yjkriXiKiK56TZpNnjqLEhKuSxXC1MEry8UBaQg1lLCH2Z1pP/MrIA8RQapqyCcIM6nUEw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2026 03:12:59.9587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0af7e2b4-4e98-4ff6-971b-08dec8f9acad
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055E1.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR16MB7029
X-Proofpoint-GUID: H7m7M3EjMs551KhVWtjWjHfMwEf4Yfnd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDAyOSBTYWx0ZWRfX9LnjlN6q0FAO
 OVAm4D0okZ71BnNF2phVSStQMMqWmifXzlxrMBLw2mmfzBXsvsqkuKDTELRyAjf76+U2mGeE0eG
 2A0lBhYppuBcK4ut08jNRVLyQdLeR6mLWImhA6lrQtujK49/IH98
X-Authority-Analysis: v=2.4 cv=cverVV4i c=1 sm=1 tr=0 ts=6a2ccabf cx=c_pps
 a=JXicDZ6CVi74U63V4YFJkg==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=-OawqTZBqJjt90xPb8wn:22
 a=p0WdMEafAAAA:8 a=cbNQJ9GKAAAA:8 a=aTUU4wccGdjc4uoG5QAA:9 a=CjuIK1q_8ugA:10
 a=3whSkbs7g9Me0DR5EJEX:22
X-Proofpoint-ORIG-GUID: H7m7M3EjMs551KhVWtjWjHfMwEf4Yfnd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDAyOSBTYWx0ZWRfX9RJHiZUWCqlO
 fB5VCZcEIPBEoeJOmiWln9bOH8xZ9sE7V4mB3Wnu8W9svs4ZU6NyRYEM2ujANBPMzoK2gG1/WVJ
 QPW6CY1KSUPKiLPjI242auB4Bb5L4mICBZ0Svm99EMhP2zJ3rsVddPuRWe75a3NLYi72674COH/
 ENIjkM0EdBtdpS/npXiREum5eRtsHQzEtleigoWkGBKUGMHadnQ+JuvOAaeeDQmAaeu+lklAFw2
 POz9bd1J4Yi0rFVfketkkCmTPutwErq1lTUXk3bdIlyFbs6oLeqgtxRXD2aXmi9UVUj7W/5EeEa
 4STrPAy4X8C8jO82cvmy8LhoX6B3GZYwQKAkw51erwefzBv7dvBiPApPNkHQY4lku1sJLzVLXfQ
 osBRaizZ+AvZMVpqyQ57q+AEiOitbn0MODYRHxETeOnovdQa1qlTTHMYpDVT15HoVn4DZkq715y
 auTPc9LZQbIkzuRcQeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130029
X-purgate-ID: tlsNG-ef75cf/1781320387-0A573C48-2888CEF9/0/0
X-purgate-type: clean
X-purgate-size: 2602
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,vates.tech,kernel.org,amd.com,cardoe.com,citrix.com,invisiblethingslab.com,gmail.com];
	TO_DN_ALL(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:cardoe@cardoe.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	FROM_NO_DN(0.00)[];
	FORWARDED(0.00)[mailman];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 716FE67D98B

On Sat, Jun 13, 2026 at 12:09:17AM +0100, Andrew Cooper wrote:
> Refresh and update the Alpine containers.
> 
> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2598243590
> 
> This gets us off an obsolete version of Alpine, and finishes several
> improvement projects (naming, and non-root containers) all at once.
> 
> Andrew Cooper (7):
>   tools/xenalyze: Work around GCC-15 -Werror=nonnull false positive
>   Config.mk: Update QEMU to include pip-25.2 bugfix
>   CI: Introduce new qubes-hw-runner.dockerfile
>   CI: Update the Alpine x86_64 container to 3.24
>   CI: Update the Alpine arm64 container to 3.24
>   CI: Fix inconsistent use of x86-{64,32} vs x86_{64,32}
>   CI: Remove x86 microcode from arm32 jobs

Please consider

Reviewed-by: Denis Mukhin <dmukhin@ford.com> 

for the entire series.

> 
>  Config.mk                                     |   4 +-
>  .../build/alpine/3.18-arm64v8.dockerfile      |  51 ---
>  automation/build/alpine/3.18.dockerfile       |  52 ---
>  .../build/alpine/3.24-arm64v8.dockerfile      |  53 +++
>  .../build/alpine/3.24-x86_64.dockerfile       |  65 +++
>  .../build/alpine/qubes-hw-runner.dockerfile   |  21 +
>  automation/gitlab-ci/build.yaml               | 202 ++++-----
>  automation/gitlab-ci/test.yaml                | 385 +++++++++---------
>  automation/scripts/containerize               |   2 +-
>  .../{xtf-x86-64-config => xtf-x86_64-config}  |   0
>  ...86-64-efi-config => xtf-x86_64-efi-config} |   0
>  .../include/{xtf-x86-64 => xtf-x86_64}        |   0
>  .../{xtf-x86-64-efi => xtf-x86_64-efi}        |   0
>  .../{qubes-x86-64.sh => qubes-x86_64.sh}      |   0
>  tools/xentrace/xenalyze.c                     |  11 +
>  15 files changed, 444 insertions(+), 402 deletions(-)
>  delete mode 100644 automation/build/alpine/3.18-arm64v8.dockerfile
>  delete mode 100644 automation/build/alpine/3.18.dockerfile
>  create mode 100644 automation/build/alpine/3.24-arm64v8.dockerfile
>  create mode 100644 automation/build/alpine/3.24-x86_64.dockerfile
>  create mode 100644 automation/build/alpine/qubes-hw-runner.dockerfile
>  rename automation/scripts/include/configs/{xtf-x86-64-config => xtf-x86_64-config} (100%)
>  rename automation/scripts/include/configs/{xtf-x86-64-efi-config => xtf-x86_64-efi-config} (100%)
>  rename automation/scripts/include/{xtf-x86-64 => xtf-x86_64} (100%)
>  rename automation/scripts/include/{xtf-x86-64-efi => xtf-x86_64-efi} (100%)
>  rename automation/scripts/{qubes-x86-64.sh => qubes-x86_64.sh} (100%)
> 
> -- 
> 2.39.5
> 
> 

