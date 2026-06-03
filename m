Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PBWwNmCCIGr/4QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 21:37:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBA263AE63
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 21:37:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ford.com header.s=ppford header.b="B/EdX3n2";
	dkim=pass header.d=azureford.onmicrosoft.com header.s=selector2-azureford-onmicrosoft-com header.b=Zx7i+b+v;
	dkim=pass header.d=saarlouis.ford.com header.s=ppserprodsaar header.b=eMqmqZqi;
	dkim=pass header.d=ford.com header.s=ppfserpocford header.b=pvon7zFP;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=ford.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1327091.1592291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUrOF-0006l9-RC; Wed, 03 Jun 2026 19:36:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327091.1592291; Wed, 03 Jun 2026 19:36:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUrOF-0006jY-NM; Wed, 03 Jun 2026 19:36:35 +0000
Received: by outflank-mailman (input) for mailman id 1327091;
 Wed, 03 Jun 2026 19:36:34 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wUrOC-0006jS-RG
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 19:36:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUrOC-008Ddh-7h
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 21:36:32 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a2081dc-2eae-0a2a0a5409dd-0a2a450992e6-48
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 21:36:26 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a208238-2497-0a2a45090019-94a38ff1113a-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 21:36:25 +0200
Received: from pps.filterd (m0367130.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 653I5x7V1079037
 for <xen-devel@lists.xenproject.org>; Wed, 3 Jun 2026 19:36:24 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com
 (mail-southcentralusazon11011030.outbound.protection.outlook.com
 [40.93.194.30])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4ejq6xtkms-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 19:36:23 +0000 (GMT)
Received: from SJ2PR07CA0003.namprd07.prod.outlook.com (2603:10b6:a03:505::26)
 by SA1PR16MB5486.namprd16.prod.outlook.com (2603:10b6:806:379::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 19:36:21 +0000
Received: from MWH0EPF000A672E.namprd04.prod.outlook.com
 (2603:10b6:a03:505:cafe::8d) by SJ2PR07CA0003.outlook.office365.com
 (2603:10b6:a03:505::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 19:36:21 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 MWH0EPF000A672E.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Wed, 3 Jun 2026 19:36:20 +0000
Received: from pps.filterd (m0373460.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 653J0Rp6913785
 for <xen-devel@lists.xenproject.org>; Wed, 3 Jun 2026 15:36:20 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4eggrxycbg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:36:20 -0400 (EDT)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id UrNxwVl1l8Hc9UrNywotKk; Wed, 03 Jun 2026 19:36:19 +0000
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
	:references:subject:to; s=ppford; bh=amhyky4sbxekiDoBkvBl0VDlkKA
	Rtj/xZxmTLbhregc=; b=B/EdX3n2rnINqAdl9BPMrNLV/bGQwlFnOFX10+LbIG3
	A//3S51yWMQIWjQQuz8zEkewZJevqFMGwz3Q2Rl1RywWFmzrlyeaJGVI0iiegLaI
	VE9zf0tv5HtawDY3ImBponcfIEbH52PJxMpZpYbcLA2ph+RgICvTVaDOLYxwsxMi
	oaLTolbRsq54+wPHpOLWQdRpBrdpwQJaL/nMQMtZB9cCHsGFz0domxGRzWjEoj6i
	teM5S0sjjdE4KgghHUtBqRKxsRCAuTMe7W34ujhu5wENB1naicTu9aC7MoOqf672
	v4lIAMHM5EYj/cwyt/ztG7anAwmmArO6uhJzmXRgtcQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vC/eRp15kt1HUB10m/m+rZem0vdWcTrge451NBTsSbU+4H6/oiZ/iQpvsn45HnqobgLXGaMqJBJrU999ZD4VneVvAePeltKqZKwGqmK7BkiiHMhqA+LqAC/rPA70YPAh19l7Kz2Rds5FY4EgAkaupsp93N++mw/P+L8hR87schejzopkK6H12o02lzwmSDrsdbOd9EOdvdmizWkMOJRXKsHXYxDpl8NkHUC4kU8E+PSCy/2D9B+keSJGH6CIEZQI7y+zwiTStJc7y/huQjw4vXGOjN4jTMZIeHBWYF2GBNuFm0QGBKgCGFOIrq3/FOCIpZBvehadXqUNxKxGyoMXcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=amhyky4sbxekiDoBkvBl0VDlkKARtj/xZxmTLbhregc=;
 b=vy1REXv5etWUpoN8GKKZwjvQTIogTKKOFDCNxoeU0JXxJuk07/3H45Zijb8J2auok9eJkCLHvG0qByHck62g/7+AcAB2iXmqam6iLi1NUSm/c1puLGemdF9fmU+JK7Q49P3FP/xHNVHvE/E4EQvvZIQdP0b3o6Aq90T5X6tgR7d7QSnBl1KaHOh1MWwh4XFE8FSPYs3XqH+AQw/w9g+pDNcEyT8J/TOjbZyeqxEDXYkQnFAUNxA1oNGORjC9S8IKSd3bVIY9bF/IUqET2AUlegZo6NGsqMOLCv/lEWQy62fcXTu66Fx3atxgt8MWmHU6NBFJexoDyOMcCqoimPV6WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=amhyky4sbxekiDoBkvBl0VDlkKARtj/xZxmTLbhregc=;
 b=Zx7i+b+vWPhRpj1Gtlw+Y0NoeFc3hV1x+AQoILEgi8r46udrGGrv6IOzZ8S1fdzGm9RPyxXhkLpTKCDWPz0FfNOvyP5DoCe58wMy6WjeGTFAh/2H5Zcrp7UEoPIo3nUePDXDmyTNZQU5Mr1fXQmzbDEVo36fsD9njChkjvyXHPQ=
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
	 bh=amhyky4sbxekiDoBkvBl0VDlkKARtj/xZxmTLbhregc=; b=eMqmqZqi0Cax
	Ja6d6CX/d+TBsUlGrv/tYgrYKGJRUbfQElR2zXXUMGHPm5yv7QotSgNaC6YurRGq
	WZRonRGUug4GhsRlZaeAHGZAMJahi8Sqnkb6GfPplDbmBoC6KbVTmxq4zu3Y0Wc6
	k76BjeefrTs8X98/PjOdy0NNTnCk9BvQ1yVJZARUSC1tuKW5zZDQMIn7xDu9bL5u
	9R2bulWvpBSvJH376sd/FCqhDtK76WfgVS9xrXuOjuIe5All4evY0VJvsbiCCrEE
	58OeWXDyjVeLxJKVFVt/T/Rfx+LBBs3pfbdL7kpS1q6R4chHT/OZ83I2GjGfLuC6
	drc4RVmxcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=amhyky4sbxekiDoBkvBl
	0VDlkKARtj/xZxmTLbhregc=; b=pvon7zFP+c2ew0AJ0qbl4NrancjnKZ7v/9SB
	0TfrgzkHqfwO/j/bcGQHVug1Hygd+PuiYq9gApfLWZBfIL4cYg4LgFetRAOuZe/T
	kQqfntaF4JgevfYuafyS+M50DZMXJ4ddUvgfZ6iXfHaaGQNyOaIKxLSCmMg1DkFY
	8QzhBggdjnxvo3+rZIJ4cvFIebAtpPRDyI+5L3B7Y7HDCv5bl8/UdFaZBYqbJrzz
	hooVkJzcieb+nP/IDyTQD4UipN6ooAZ+LGJHa38TxPusEvlPepJq1LueU3mB1ZH+
	1OfK3lp2CN8t42c674VviiHELQSo1mqoXEyIjBYb8M+tGtPrxQ==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: UrNxwVl1l8Hc9UrNywotKk
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Wed, 3 Jun 2026 12:36:16 -0700
To: Jan Beulich <jbeulich@suse.com>
Cc: dmukhin@ford.com, andrew.cooper3@citrix.com, anthony.perard@vates.tech,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 5/6] argo: introduce CONFIG_ARGO_DEBUG
Message-ID: <aiCCMGV1zsOzpZ34@kraken>
References: <20260603060539.1181809-1-dmukhin@ford.com>
 <20260603060539.1181809-6-dmukhin@ford.com>
 <1511b245-fb6a-412c-bd9a-32ea341e983a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1511b245-fb6a-412c-bd9a-32ea341e983a@suse.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0
 suspectscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030190
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672E:EE_|SA1PR16MB5486:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ea0353d-ff33-42c3-6d81-08dec1a763bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zoo7nvsBdAKX+dsUIf6q/l+MRrlRV7CCgY08ImBZRrJg8R6JqC1mkvz51dGNxpmBkTCwZuMZXvh1h7yggZicv/XaKQBcIqLeGj2ukGLnJ/wgdOvJHEd7pMpcSi4V9GO+4hb7DBK32m/ZHItZ8+9K5zRtAwbrFPJDNU3fLvS43vynYsjvtQ8N3y/SjEGrJzRVoX7iFfk40HOYDURhVBuQtgR8j0srDrhwxTk2cVgh6wia4/FgWZfUD8l/SF6DFfBj6EbRG1fPfnRQbzEH5wHmthU2ltPtUF5i2+tu1TkzfIWkv3wjxzUJT5pm7504SRrh/UwaLy+wvdeLYA4xVedDkrYycmVbXvwo/bGcTkCdrtqE9KGDtjes1G2stMexj2CZ1y9Z+LlANbZ7w5XxlvRGGL5UGKUsyy0mmnUT5Ou898okfXXbRNhEqLlDOpINo0MAs4x5nswQtu/wJD55cJ7roAkg6hJ9AHJgkcTrAfIYy+tBE/z0N5v5cGWkJMDYQ4Nh+Hds52y09P18tRwEZUGELB3DJqw6wCRs2wxWuxUooClM6jbgj15aAB/T32ZXWaGiwJcS17IYOiVPnP5SZunQnhXPGmFUmazu4oE2uCwVKE2QafgVSY7PtsOCo9IE466owsp/qsrSH0HLaXJBduKoR5NL8AUc1dnR10G6JeLMiuoMV7nsDcOXJiMib75Rgm2FHtPztugmO9eGpLu8NkNIbDf9YfMgdLIUohWThBFcA3A=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PefGajyum6lltGd0kxhKmXuevGf/ImNf/D4JwsEygvLKpD6vWd7zVucpSdo3wO5mUAUqTwNTzXQUjgUcLu0lMZu9ZyuJUhslnT7Sc9GDrReiqiIvEWpVOmrxOLurnPlwPprcIyAI2n7xwISB/Cwk1yEm864YPh8heb9zkacH37jASZBV0fqKB6Ww5Eoe4xrEXMiIIxGZ9Id9/o7sKg1PV3rQQk6QoVSvI556hJd9AazW+H4PXGITBSJS92vmj50e7fO07q23vIkO2nQNast3L3FvOJSzGxUWgrH46QIlW1mS3z2kzBDFMrHi1zaR+qh2o6PYc5aM6TkBhi9/mahPCeV+mn3Vmuk2+2LaXPkmoWOb7aWtqWbQucBm0TyHQO65fSVDKHyUUOapyVw8opQkUe6iryfPMX7r4YTcuTeLgX7uIa2+Ws5xAJhNlp5qLWxH
X-Exchange-RoutingPolicyChecked:
	TArlPHxz8jquFGk5fzibNf//o5sbY7Lw+TG0wAGVpCd/iWWlg7zu2lb+KcLAol4qnHfBWJRdlc6AhPpc2S7nDl21JpZfO1nYWMtSh8n1vWo1VhU2hBmkUqj+M+gxs6bW+OEeX1i+nGhXvJK9SBILCQIgX2nJmBW0qmD8/Np0miwpTR+qWQQ7UwTe78G++Cy8SN+c/sGExmaHmMo0hR2UQlzeiWvkmFnATaDj8C7Hg8UPGb23ohYeSbtVwQ1a/5qFV6UsU+wJH2Otow3ZuJNxFCzwPXvDB1OM8FAF/2DkK5Q5Wr9S3pFhNPVZ4y7t4mJAJW4q6jfrBq34HGypfoObjA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6VsUbVQFSRF2lu/4AQJ9KMELyVX6avZlIndXsap64f3z1IkLdgT1xAd2tO/zrAvbKkQF9WxgGdGniseFar3tGvfGf1ntVBB4Uyr4kDpXvBRXha0uiBXlG6B2YSusnZonqy04fNRmilhSF/DebxApfaAR3YrZ95BG9izk4rUP8WhUanwfPn5Gy2giPFMM33BlGuxKBm12RWnCY+do+urr5Gpz/ySaw9W0zaRGPFAG0Bsjg9PtHSnzPLEY5CNiXkfXAXUfE0QNjHCNRqexy293R0TXmQTm0jf7FvmXLuuqfLURqaXjKi6Fr+R35dz131gbyT9qf+hBPixcX6NWZgsYzaP9ySB8t6YiJh45SUI70WY1/A+vGQOsvPYlJc5quOZXtopxQyRrQeC1KxHIIydhyuVaYdADTNN+DEaLNGvHKGJi6fbBzt9dij352fr+2/7rZuFfyX5wQ5xNIkNVtvH2XrohoqJqbxoZEqUOGUOts+6xQCXvWbkG8WDbUmBr2HpI1ASYz6a8eoGfma7s2yyHL6LeBqnxwzHqr7qYijsNyDqGrTcuEUOyw/aqXWSyBPP+QfO+SKg1zQpoIIwnRAbl9lVhZdURgcPWwEThsm5NOfWFWhKn9/PaWFeTCIaituoQ
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 19:36:20.8805
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ea0353d-ff33-42c3-6d81-08dec1a763bb
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A672E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR16MB5486
X-Proofpoint-GUID: xsEwE4QTeKKBivrqYJWIBbHG5UZXj2wa
X-Authority-Analysis: v=2.4 cv=Vf/H+lp9 c=1 sm=1 tr=0 ts=6a208237 cx=c_pps
 a=e/sPstj0vE6DIEdYTBOJlw==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=vnUQfov-gS4s1L7hHvr-:22
 a=cbNQJ9GKAAAA:8 a=Lv5HXhxlOMfwyqDyKVUA:9 a=CjuIK1q_8ugA:10
 a=G69WFyCBNqGPyalROSdv:22
X-Proofpoint-ORIG-GUID: xsEwE4QTeKKBivrqYJWIBbHG5UZXj2wa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDE5MCBTYWx0ZWRfX7QX60Bcwzmx+
 SPrv9pF93Y/PR5Wvv9F8f+HORQn4tD8faL5sFMYvYKVVNXxQBA3AQ33HgClQlyzixz27rodwP2U
 2dZXoo721vUR+RKJVvJNy2NLzCfSDMo3QiEuCC3lfrJtXz8CNRmAh6l/Lgpnr0NKMIiE7tTpYfQ
 EwNnysCpQRMOiNfo51jV7bL2m5ZUw0OU5i2wjllGfvLihBtoyQQzBCRbH8b2tIGPhkftikmZn3b
 tFWcAWfwv8UTU1zq2b3NKcOElv3TkVBXvgyNneaDYqmEWa3r2O5pKnOzStmJFb32QByCdENkTdA
 OurT1GUalGkQl4TNdrJKLFT6lh9ZiUz7yE3zGbSj7u9AlvTEL4pZ5Kq+qJu2ISDvkdKblVQRXKR
 nh+E8QYe/jvleXDmmTcAjV9BaLi6Lw59JdOn5KpapUb5Wcc9CXwx4GTKKuljD7EuCdcvEyItLwT
 RNVh93gwrLPnEAPhxiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030190
X-purgate-ID: tlsNG-bad1c0/1780515386-41364A53-2722BCA2/0/0
X-purgate-type: clean
X-purgate-size: 737
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:dmukhin@ford.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FROM_NO_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kraken:mid,saarlouis.ford.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DBBA263AE63

On Wed, Jun 03, 2026 at 08:10:48AM +0200, Jan Beulich wrote:
> On 03.06.2026 08:05, dmukhin@ford.com wrote:
> > --- a/xen/common/Kconfig
> > +++ b/xen/common/Kconfig
> > @@ -491,6 +491,11 @@ config ARGO
> >  
> >  	  If unsure, say N.
> >  
> > +config ARGO_DEBUG
> > +	bool "Argo: enable debug traces (UNSUPPORTED)" if ARGO
> 
> I'm sorry, I should have spotted this in v3 already: This wants to be
> "depends on ARGO". The way you have it you only suppress the prompt,
> but not the option. Which has certain unwanted (here) effects. Can
> surely be sorted while committing (once 4.23 is open and once proper
> ARGO acks have arrived for the series).

Thanks for catching this.
Will update and re-send.

--
Denis

