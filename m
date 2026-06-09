Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Zb3FIsRqJ2qowQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 03:22:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAAC65B970
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 03:22:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ford.com header.s=ppford header.b=dUVIMuho;
	dkim=pass header.d=azureford.onmicrosoft.com header.s=selector2-azureford-onmicrosoft-com header.b=OMCAtKlk;
	dkim=pass header.d=saarlouis.ford.com header.s=ppserprodsaar header.b=WqTmaMxj;
	dkim=pass header.d=ford.com header.s=ppfserpocford header.b="p/Sv2tCo";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=ford.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1332188.1594844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWlA2-0000dX-JB; Tue, 09 Jun 2026 01:21:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332188.1594844; Tue, 09 Jun 2026 01:21:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWlA2-0000bH-GV; Tue, 09 Jun 2026 01:21:46 +0000
Received: by outflank-mailman (input) for mailman id 1332188;
 Tue, 09 Jun 2026 01:21:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wWlA1-0000bB-Sf
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 01:21:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWlA0-002JO5-8V
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 03:21:44 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a276a81-bab6-0a2a0a5309dd-0a2a4501cdd4-24
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 03:21:44 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a276aa6-c1f2-0a2a45010019-94a392177b5a-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 03:21:43 +0200
Received: from pps.filterd (m0482516.ppops.net [127.0.0.1])
 by m0482516.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 658KORF61994996
 for <xen-devel@lists.xenproject.org>; Mon, 8 Jun 2026 18:21:41 -0700
Received: from ph8pr06cu001.outbound.protection.outlook.com
 (mail-westus3azon11012040.outbound.protection.outlook.com [40.107.209.40])
 by m0482516.ppops.net (PPS) with ESMTPS id 4ep3912unu-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 18:21:41 -0700 (PDT)
Received: from CH0PR03CA0243.namprd03.prod.outlook.com (2603:10b6:610:e5::8)
 by SJ2PR16MB6064.namprd16.prod.outlook.com (2603:10b6:a03:577::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 01:21:38 +0000
Received: from CH1PEPF0000AD76.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::a9) by CH0PR03CA0243.outlook.office365.com
 (2603:10b6:610:e5::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.13 via Frontend Transport; Tue, 9
 Jun 2026 01:21:36 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 CH1PEPF0000AD76.mail.protection.outlook.com (10.167.244.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Tue, 9 Jun 2026 01:21:35 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6590vph93705767
 for <xen-devel@lists.xenproject.org>; Mon, 8 Jun 2026 21:21:35 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4en20229xx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 21:21:34 -0400 (EDT)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id Wl9owXrH28Hc9Wl9owhqtG; Tue, 09 Jun 2026 01:21:33 +0000
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
	:references:subject:to; s=ppford; bh=JoVpE57MsISXvZXcghisHu2g8EE
	aZPVSD++ppBV+dD4=; b=dUVIMuhofTelF8PNu2NwMzk8WpXDY0jKEiseFpemvZU
	mv5pwqqS2MtV366vtUF2i3rndH4tPmD4SrSIdbo1qWOHzJVaNcz5K2lvyfBAshFI
	IpFn9EhklWpZ5/5/9ddjQ0zwGW/PMZtUo1jPt5g1QA6AVgk/6GJ+IQ6R5kKJkkl9
	CTX/6RgwB/GmjAQmWZ5U3OrDcPjcDA+AwISOy229bJepbjCF9vvndY4LzmoKygFp
	aTcgVTcffTfB38wUxN5S4vc7ESEWI0yzaVNKY1Vlh4QfovwYbCu7eRgoRREp4ZAQ
	R/8U98hxBFCpGBbZA+GbxQZ+uTueXuF/23MMS/nXCBA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jh35JWR2JkjQJvVz/LVgPnaxgdeamYnbZZeeciwGDzSRaeZ8aVRFTSwjSL73vsP+W7NsYz71S5oTVtdRgYIwb8NL/FftRCpM1QaQJxVbg4vhSc7IBAH1FC6F8jUMjyixeQOzMh7/pVEk2MtIGWy5jsBpWhz2ThE+kNsvsFLsEf9PK8OO94LUsVAPBLqjYV8UIpoQ20hTvZLnbw58fLFbgAzKP2DgsuiWqbleLa3ksfvCiFm5+yyFUs8gCVPnB1O6qXYugK6hZefJmwr9Dvy36wWSRLBi6PjCYFH0GBjrMKg2jwiOFBRxnL8eu1qPokvkvy15MYe3/o//GwauBbQMyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JoVpE57MsISXvZXcghisHu2g8EEaZPVSD++ppBV+dD4=;
 b=eubqm9gBCsZ0vHBM/XbiA2fggeCdrqf8zceDIJcdV9kBAC/3AEdsj3diSlqKYu6W184VfV6V+ZAPpU1rj8gT05HlqZdEY59pPaDOE3T5lFiEvwk5xCTKs5wj9OXhG7eI3Xn3G9Eq5KDlIQD3LC8RyNhE1groZO+AIuN18HJbgoxQQMPODFJbP2Pu9bdiNbDZpfc5Oyl7lmi6zsISO8A5miThgggJh4MC50uQrZyGWMwfraJtPlSrUSpT1Z2I1utQP02GFvpyy0LQbehmHQ3Wa8Rlkz+4P7IyvQpvbMBLI9sbwz2tA5E+Z6TT7tmbHkaRBtLnVhLqit5tqcHu6rvUHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JoVpE57MsISXvZXcghisHu2g8EEaZPVSD++ppBV+dD4=;
 b=OMCAtKlkYjRwUZzm1eL3Vj2w4QYZESCT69+9q5qL7B9aXQ3yxhRmY1jr/94IW85V3ZwRMgwgOJ6OnJMCgsDkg3W0QogvXP4F+1xuTIw6WMiX6BCqf6xZNe7qg8Fz6KOkMkWL+FhqzwLYCWQWc3eCnlazvcFbNzq+ggptNkIC5Jg=
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
	 bh=JoVpE57MsISXvZXcghisHu2g8EEaZPVSD++ppBV+dD4=; b=WqTmaMxjhhgf
	q9mx9ZsStYd43u0j8AW16qy0OxhSvEtJX7uz8VNNfHOq9f6BxnnGg6EHXdDVrwW8
	jaIHewwESON51C4B7JzTZtgdQSU0j5/vAxPvWQX+AyTAieYEjMOINhZJaxjRccdQ
	mUFNU4GHliIXBgsBZAZ2q7osp8QxVsxCncYeyyw3c1hpozV4R8Jf0vieo5QzRw0q
	q5AWMk73LIF7KxHIWdOC2AgZg8pb814HXo7N12whnwrwBdFbhDZnwD+II0hK2wOR
	fgCIQkjl7DyyrVFk6laPI4zHJmwsqC3MnpxadASoYXV2QsrdT8j9hfQ+RIS7APV4
	EniaaZpi0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=JoVpE57MsISXvZXcghis
	Hu2g8EEaZPVSD++ppBV+dD4=; b=p/Sv2tCoBZFHLH+aPw9n8cixCUoh8cAzWcm6
	h27yKJZC7TNnsi5S4IvA0CUNMalmU/3GeL8kImjDK2c17fA490qkJ6+ue0QxulwP
	Aqt8zEoN02Wv4/lQ3m5e8oq8e34Da6wYqXdLhEPMBjoGkioDLEA/gSzOp9PARo0y
	2eWIzK4Bj/6nK1b490k+g7ayzIwUErMm5AwA6xPTXbUe1h61Ob9OUpmU5EUVoKsZ
	ZAk/X2XOpIS6CgQ3keh88SC2WDqZO824XarDG25pnXNYn6oQHuYe7j30t06Yf9rn
	RgO4HF6ZLdUtuCyqLDrOfFP2wSFeQMhKLVWgLByR9FRcRwsc5A==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: Wl9owXrH28Hc9Wl9owhqtG
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Mon, 8 Jun 2026 18:21:31 -0700
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org,
        andrew.cooper3@citrix.com, anthony.perard@vates.tech,
        jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com,
        roger.pau@citrix.com, sstabellini@kernel.org,
        christopher.w.clark@gmail.com
Subject: Re: [PATCH v3 6/6] automation: enable Argo debugging in CI
Message-ID: <aidqm4wKkSxNPr3O@kraken>
References: <20260526215823.1452619-1-dmukhin@ford.com>
 <20260526215823.1452619-7-dmukhin@ford.com>
 <e087af10-4fee-4fea-92fa-5a647524af80@apertussolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e087af10-4fee-4fea-92fa-5a647524af80@apertussolutions.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_06,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090010
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD76:EE_|SJ2PR16MB6064:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b33dc08-bf9e-4ca7-10ba-08dec5c572e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|13003099007|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	h7+i6HIsIXZ8zUIB2PHRP0oduz/5uBvjOZLHO5sdooKrfZWGtk0lzazi3zFxF/7VGmAstmwrcMZQguNqZQnJX7XSuiVszadJboN+m4q8TCJfbAL+ex57brImvBHKGKVaVh5j2N3FDeNa10MEBRIsHIu0NmlxvZcdTcDcWljKDR9yuNA+gYgumZ2iwhceQ1rSjBjYJcY+vAdaU9dErq4w/Tf21LqNo9uP3Ll3+DRUQ+GMMFtF4pTx7Mb/Xl7Q4OiQhcvTi09L+sA8HiEtTBKnW7wJCEK0mBZdcmJCeEMq8Ak/HTLmClXtChjnCNzxTnOvntYfaoiONigjv++aIu+Q7c7ZHaFrdc1bLWyVsKXkRNBtQVacLn3OXIL58wmBlP/2DkJuYjIhKCj3BVd6ndiRsQN/yXND2XUpJaKB6gbgkvfKaCiuKCggwljou5+5EP0/wgd2ysFv7xYrpu7nm/tXJH+3yK7SyTMiOZ3v3Ja8Jje0XtX3iQza975nOU1E7KRcw/D9w+u4fxHS6nib+arXr1oMwee6YwPO2ZIIsv1S0ua8bITEgvmI+7xjuxE+OQIOk3pdrJpXk3DX0FqCh7RbOlnvK+ABN8TPDucVYc2eey88OpXeu+M6dQ5LwC/zWhW03M5UMuc7oIPFRf/yln3mH9VjHVIsN014cVfWHFc+iLA8eyVEVJYgzO8PJyato5vj9QFU/kzjlEhs/Lu3FtA65cz2JqTQKkYuF72joaQzyk0=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(13003099007)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FxnRLwJH+Rx7PGAKx3bk3IITHskjepfs/GgeWURk8biLMby5B+wIRH+gPIo9nqAdXfu+PTNj4Ec+lLxdU2ZUzvIr/6LH4GoSonF/zSPVw4NZKr1cRc0SMioR/8N4lYsB+zbBzWVQruQvXspe3FdTpzWYrYSpQcyKDxc/RHTGqot3Jcuv7l32LatnUYt+VYvn5inAxTKaaj/Gxz6gQ0fA5uL68gnQ9Qtb7qKoEh4rqGh/U2aAzO7XRDWnzyiG+gquo9sOVvmfrsViOY+OdNXYnB+w/gcGYEyAWmip1kpnkF0Qxi+GLrekT+8ZZChaHZXw1tmu1MsKFzog/mw9yh1sZ6cRQYKYXnp1Q48e+vMZYIZMJlN+/5KGb8Zt50UVwllVelRkPM9mVc7yOtabLuO6nxu22/R9RV/ZPtevRccWmx7U8Lo9QG5XWbNHWrCzJURt
X-Exchange-RoutingPolicyChecked:
	Z7igTXgL5d/uQUNsjUvW+uqiKvADeEKS661tJAuyC+yqxVv/FwpE1gwYb/EAz9n9Fy4nz63SuDsEfJ3sa1fMZH6JUifA/xq8am/lar9/o1SozegF7VOa7kBWhENLTF4muN67zvHuaBSwEmKHPQArp0tU3HPIJzlFTUukMhLV67forcoSvIk6u64lhxhieznPyhdS8zt1CcW8wZ5TYdnmecPcb0inyNtXlVRDzqdo9jiN+U6/So4jMMhl9cfEavCH5PWmgbMqJEmpaU9gdBuNXe1KfOwGHIXXXgV4WVBs447q/3sQduM57J8HXevBZc6j9q1J0p3RivByUKRkrrXStA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3Wh04xF4U4xFdbWpYpnzzS1ru5B7s0zNIqH9t48Oxzy7/JrCG2xFBjKAoUSsBaue9IzeN1MmG+0sXBYJMB9RJlo7MzK8BikhL5SnHfuBnMpHcit9jjhEXYeGIqbI0cb+if81/dF9Knq7k9b0YvrdDo5LGyBileNGUkDr55QcZ4N76YCd7wXW+2sTm4oQyoRFtrPmt1Mc62rli66vGnlLpzsc8jlT5i3LDbZWRSmjkBLAvyxMP2lCN371huqTMyYa0rtcQW9Q9J/KdTtpBT1s3VmixCMWtSGvnzA78/r0zsO5Nebk/EXHciuuCcl3udz+LhTv4h4oB1zge3qAxEePnHR8hyFGxciS9q3DL4AtrSgpSrw+IU5sgv5Hc+W9iVUqkjts0W5ez9xDDDcicyn3G93nRyYZnY1xaGcJiOdlnNAfyZNL+lqzPk5R4+xLkDKiDBqjrlASq1aZjczTkHaB1JrQ79howAiTTCebb2YIkLeeXNfSyY0Uvw5SvwLryhY0b2WB1YvGaaxfTp+oVpaEtnU7gR1oIU0XZLSgCYSZE+lhUKwaZtsdfSgf3Awohnzxz9yhXWIdz64duNijR8juOBGBqMb/3FmPV27Q9MQjUWFsripTxj1m7jjG+25Fxadu
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 01:21:35.7448
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b33dc08-bf9e-4ca7-10ba-08dec5c572e2
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD76.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR16MB6064
X-Authority-Analysis: v=2.4 cv=S5fpBosP c=1 sm=1 tr=0 ts=6a276aa5 cx=c_pps
 a=n6quz47VtcdWtWxmUgX64A==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=NvsXeTrgx-CJMFV-xl94:22
 a=p0WdMEafAAAA:8 a=cbNQJ9GKAAAA:8 a=tVxlCLILtbLps3QRzyMA:9 a=CjuIK1q_8ugA:10
 a=G69WFyCBNqGPyalROSdv:22
X-Proofpoint-GUID: vgw11ve6D-fGlJFH-cAIkqYnSxFjSvsL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDAwOSBTYWx0ZWRfX1ZwV/34Yp3nM
 fXdLHvDhiUKRi32T52kboxaZSwf4XhngAoaNqOHkmPNUrD02I2tZmNNF7LrpsTs0Ir3W8jDI7K9
 cz5bPHY9QuthN1eswxAZdettuVHzOproz8GdVxxt3tiILVpL3MS44eTEWARs6oWOJ5fHqcLvLhH
 CjLirCr0hUUm2oJNXK6P1e0dz1C9frdqmqHx+P0PggzWdmMwALBARmIvfQGEg6ab7jkSWbw07ld
 axKMiavqM0gAzQY+8d93FwIVaEcTUoKK/dxzIw+iqwAs9fcHkakePnF+njk4amN5QII3MVCt3M1
 ukCFBKrvMc18pynVeqV1qJnkeYk/QxLR+N/fE/NdiQM6oc1/hIMWpuQnAZEmpAgO0pM9t3LrpT3
 IoY5MxL2sLE2iKedFTYFD3pFuX3gEyTP2gvbUaXmqen7y84KmqmsLu0Z67Optb7asIL6QlqSL6n
 2vLswdhDtttSag10e6w==
X-Proofpoint-ORIG-GUID: vgw11ve6D-fGlJFH-cAIkqYnSxFjSvsL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_06,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090009
X-purgate-ID: tlsNG-d62444/1780968104-AD1ADFF4-C3CC3099/0/0
X-purgate-type: clean
X-purgate-size: 1334
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
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dpsmith@apertussolutions.com,m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:christopher.w.clark@gmail.com,m:christopherwclark@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[ford.com,lists.xenproject.org,citrix.com,vates.tech,suse.com,xen.org,amd.com,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,saarlouis.ford.com:dkim,kraken:mid,ford.com:dkim,ford.com:email,ford.com:from_mime,gitlab.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9BAAC65B970

On Mon, Jun 08, 2026 at 04:18:49PM -0400, Daniel P. Smith wrote:
> 
> 
> On 5/26/26 5:58 PM, dmukhin@ford.com wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> > 
> > Enable extra Argo traces in CI to help analyze any potential Argo issues.
> > 
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes since v2:
> > - new patch
> > - example verbose log: https://gitlab.com/xen-project/people/dmukhin/xen/-/jobs/14552079442
> > ---
> >   automation/gitlab-ci/build.yaml | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> > index 7f5b5938e851..5f9192e53d63 100644
> > --- a/automation/gitlab-ci/build.yaml
> > +++ b/automation/gitlab-ci/build.yaml
> > @@ -319,6 +319,7 @@ alpine-3.18-gcc-debug:
> >         CONFIG_EXPERT=y
> >         CONFIG_UNSUPPORTED=y
> >         CONFIG_ARGO=y
> > +      CONFIG_ARGO_DEBUG=y
> >         CONFIG_UBSAN=y
> >         CONFIG_UBSAN_FATAL=y
> >         CONFIG_MICROCODE_SCAN_DEFAULT=y
> 
> Why not just set up a job with the variable ARGO_DEBUG=1 and not have to
> introduce the first and only Kconfig option turning on a debug logging flag?

My impression is that Kconfig is a preferred way for parametrizing the
hypervisor build and upstream Xen CI jobs.

--
Denis

