Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pqTfC5krVWprkwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 20:16:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B49BC74E684
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 20:16:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ford.com header.s=ppford header.b=VOLqwDYw;
	dkim=pass header.d=azureford.onmicrosoft.com header.s=selector2-azureford-onmicrosoft-com header.b="i/It5xqa";
	dkim=pass header.d=saarlouis.ford.com header.s=ppserprodsaar header.b=AMD+p+n1;
	dkim=pass header.d=ford.com header.s=ppfserpocford header.b=S+kh+okH;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=ford.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1361818.1613913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjLCx-0005FR-TI; Mon, 13 Jul 2026 18:16:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361818.1613913; Mon, 13 Jul 2026 18:16:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjLCx-0005Ct-Oe; Mon, 13 Jul 2026 18:16:47 +0000
Received: by outflank-mailman (input) for mailman id 1361818;
 Mon, 13 Jul 2026 18:16:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wjLCv-0004wc-9c
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 18:16:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjLCu-00FGN2-ML
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 20:16:44 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a552b8b-2eae-0a2a0a5409dd-0a2a4508a5dc-2
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 20:16:44 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <dmukhin@ford.com>)
 id 6a552b8a-ee29-0a2a45080019-94a392176efa-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 20:16:44 +0200
Received: from pps.filterd (m0367124.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66DI3ImD4009233
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 18:16:42 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com
 (mail-westus2azon11010061.outbound.protection.outlook.com [52.101.46.61])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4fd326sp6n-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 18:16:42 +0000 (GMT)
Received: from CH2PR12CA0005.namprd12.prod.outlook.com (2603:10b6:610:57::15)
 by SJ0PR16MB5059.namprd16.prod.outlook.com (2603:10b6:a03:435::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 18:16:39 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::87) by CH2PR12CA0005.outlook.office365.com
 (2603:10b6:610:57::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend
 Transport; Mon, 13 Jul 2026 18:16:39 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9
 via Frontend Transport; Mon, 13 Jul 2026 18:16:38 +0000
Received: from pps.filterd (m0426315.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66DHUWUw2030223
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 14:16:38 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4fc7qrspvu-2
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 14:16:38 -0400 (EDT)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id jLCmwD46EdXbVjLCnw950E; Mon, 13 Jul 2026 18:16:38 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=5vM
	haQxVLDZSJAsEkxd2cCvcMsr5+XlGLr4Ey5KSvTg=; b=VOLqwDYwKBXpTqQZ9g6
	O0j0Kdos3vWppNoXbeZ+uoKMduIYlAqUI5OCrzQ9kt5KKGWoydsTPsQ54kgtFkHD
	gk57u1c6E9qojLe6I4N6tzryoyjQilXJzTZdIrFalvkPxTdrgUsDWmpzEuqtbbTr
	Zdm7fLK/KzI48JvJdYB4LlnFBfb8UuVtdQJp1w4Ch2l08jFR+2p4Pfd8UHHCIoW6
	g4dBHEy/0NpsZzwD+x4akpLp6MFUxIdiNyKahW4wnpBd30QJlFuE0/nKqXJV51Cs
	Q0paPstj/VtnsR/7JCrQlikr4j3n2mIx43BebLz4lTCo2zqQ/ljchAxrtNHQQji2
	ZIg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W9ieZKFKySWOSDZ8mjwlVmG4g7rdrs850kuiabjn7byDJqUTHiMOczAKczxkT69ZbiMtFW2JuRsWdFRZtSDNUS7bI8jkr30oCXg0FWXDC1ShyA881FkxS4LM/eRs6Y3vpy+Eix1GDdUlx4APIeDm2vOcOjvwgB3S+zG0ymFfNdZCHYF1uu+4jCqawZYSLpPojhwtpbXxCHcc2E7DbpNb6sr1ekapZ2Zgq8R1kMpXEuZL75pZNVV8kJFLYg2noTOCqDdD4I/30pYxcTZQM7VD6kLkiTrj3XGUeexmStxapBG8Q32HkQf5sWjOMCzduWGqHxXgYuOS91YiqBRGUJlTOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5vMhaQxVLDZSJAsEkxd2cCvcMsr5+XlGLr4Ey5KSvTg=;
 b=ywA2Ow+2H9p+eIO1QQGQcO7E0/njmdl+Y82+T34bsKB8cdR1Lt4XLBvnxyWq2BO5LkPkH4ra1qMCwHszsacd+odoT14aYPgVRx8PkztXAWMZjcf1nEerEp1pXgX7yyPSW+3H3xi2cxndUZmx3vMYYTq32fa3wKdteSE9qAEln25OtwEHi/C0XarKTY2i6myCcDjYXbGLl+/ITwxGTLpuJ5LS15FUNNRqsWe7MXUrMgEbR69NAfRZfWH8cb5s4wjaqRM6xJRDEc2yVG3OqVLQeXjID92sgzd8OQR0F8XFXWKPR32GtE1LVU4XNZx4oRWlV104eTzg7hDcBqGu1Fq9SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5vMhaQxVLDZSJAsEkxd2cCvcMsr5+XlGLr4Ey5KSvTg=;
 b=i/It5xqas1mYTLHcaFrgtkZ7iS4gHbUJamFydzQymNl69Ir6+PfZzGFm58BTZmZb046tdejQFlbhgszHOO2tw0QOPrXbqwGbbfTPbCG9ZE+9Jx95nI45VueD5mFnLp49HdgC76Ak5/U9Px4idzFU55pOXn0yU+t5Gsy7C3nX0gI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	ppserprodsaar; bh=5vMhaQxVLDZSJAsEkxd2cCvcMsr5+XlGLr4Ey5KSvTg=; b=
	AMD+p+n1ML0cXCIm1kZJlL6QUQPgTir0RJTrSZITpz3vEKTLcLDWHMz4p8Eqw45K
	azl0PP1g328HidPdHMZyMyt55ObZZ0KFWpPNGZsxXdvc/HSAsKrJVN5ck2SX7AqW
	ktVG64E+OJ+icIZ2Gte5s6929qXNhQCRKx4atLeCQqEsYWBnlBRG37vJ2RfPYut+
	7hADkgTZI4bcCGrmMMDDp1LqM9x2RFK6saHXsCja53ycXXtrAChW91chT8DaqwWs
	KU6zXA0TRsqJ4t9TLsTC/ov+5lgi+PtWFGPu1cy44O7eGBT0UksJkSGROKOn4GON
	IL31C889l2Kapbmez4f2Vw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=5vMhaQx
	VLDZSJAsEkxd2cCvcMsr5+XlGLr4Ey5KSvTg=; b=S+kh+okHxxjOoSqRBFmZiqj
	T/LmSGsS028/NSKhMvuB6UNZPqTsmkwiH2cvt7l/GiqtjUwzu78dxrn5+fFhcpZL
	2sVZ6tbXgbsIyan4q4/0Qy3WBkLuaTZLXj98zP8jXomsQKfUlxfr5l07D+xJcqmy
	aH+dq5BVKNOLwpE2KOGP/f+9W7Yrfj7f87z8V12dOv1PP61Sn7rw3jiTNKVWHgOg
	gm8TthyVZMsR1ymivFqtMwu5lAaHcHDEqu8/mAuHIeO2b0Tt9aRLXlWoNGzb99vH
	uasP6aiJRcz8HxYoXKEYsX6A/YFpx9DWT1Tr85SO048xonqRK3j7iJOTm+jim7A=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: jLCmwD46EdXbVjLCnw950E
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v7 5/7] xen/serial: drop stale SERIAL_NEVER_DROP_CHARS
Date: Mon, 13 Jul 2026 11:16:17 -0700
Message-ID: <20260713181619.672176-6-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260713181619.672176-1-dmukhin@ford.com>
References: <20260713181619.672176-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130189
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|SJ0PR16MB5059:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: be603b6d-b1f9-4ce9-46d4-08dee10ae205
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|1800799024|36860700016|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	TzGFp0dz8byqR83tVXZEINN4vx2gPxGeXoqplzGqu2jpFsE/tQoOJh7gLBB4EZ33fGkR1xovPVF47zUnp4puGhla7DIIXWhXFkWCKaQATB4p+YMK6MRjK0r5TA1RywDWCNJH92MOhX7UR9vdkAHNbsafnNK49w84gnKQaYVqCvjWYXhIFBM2t73/mXyhiPUlVPge4W2KCLvQw97ctV11/Yq4Bmu6KV20tnMSOSlH4R5t07gDu0LmtFAqp2sYoGwpSQ3o/nPsdF40PEF9KftnetZj6rUldGCyg4ubMkQbxYynqylz2TgBQ0+WPJykKwzAC5/xsFNp1skKrIzL3S0wuR4LW4x79ww0drYAcIOjXTx4FUE1HJFLSwaJMgkTkAmpF/mwzbgMYrJB0GzA+yS2OD5KmcYt/2xU/mLN24WB1K5qP0WHVzBDVh6o2hvF/tPWS164sQuRaVOqWnZ5Bxn9cX8ZS0LeHR6boFqLyeGyFzPPEklukwDGiS2xqkhyE2Yw0r6UXJ0SqA2dQ9LIMmgnlo/Kqy3GxsNobaiLUaJ+fCVBeLUepDnxTlGvBwsQrvLJ/yFzJ3xF4eWyBR297cCzqgSeUjtgBsqLjl6fjpv6hRGlbSJIndGj+SUeEuX94LuBZBPUqdxQnRvklt1Dpqpbe362y3fo9YK2MuRUoobxryJtsAz3e1pwa+msodQaoIXlVWYj0k1lqpzYdiVwqh9nKQ==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(1800799024)(36860700016)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uGoAlgtkRz1x50HwHYATZIWNrbSVHe4XviWSBih9jN88BzJGSpXcRi3+kFBAbRoTljwq6ElUwTHNjjZK6nGeqObet2caYrR3TY3nepl6b1ZDvPyxNS3pp0v1o6rabg7S0vHwbaW17EI+wuWs1qnEjpAriI52w+4rDzd7xEIiQU7e12pmNolV1bR6lIMuSC43ttGIWlojB1w9ZF3naLB9ms1cj72rTA0mVXF4ziNssFnmvXJl9o5Uw6n3obSeAxhNW/DDZb+OkSMuZPDqMxr6SkPBYu/Ip6YWhwjIcBHQUMEqgHVoWqikUg/qlhih22TDr2ngLxQi8uqnf+zbcwQhWXVFjXtOCz/uYKs8qSwWnhjpZg+laRUtOrFdm2ClABzBw3TeCI7LZAtXZyvPXWP1qouvUyz0FHexZpwdH5KavaaSeFue3Fa5h/85yED05RTI
X-Exchange-RoutingPolicyChecked:
	YXRqRFHkDLIC9nYocp6Wrb6e8o1CKYg6kkrcbEW28mY6uuIjPtuGU5kLD/hL5PMBrqhjV9uj9hEqTCMoZJmR1bEyXLgXzeQGfDjpiwpbgETeAehJ1KTgddsWlELr0A04jqfZmF4dDTETwQ9xrpezwCRqCbNQr2BW+W8KEULRE2su+BnSzjwEbMxtJpkDoHOljGF+bXcy0lfP2Nov2tfTPvS6PDJ5Dxr1R74c7aOmbaBRI6ZQtPEQqIaoTtlCXNUFJr/jBYlLPHdjW10w2dQiT0cxBY8nPLyA4eZmA9TNGthUWPWB2f7qzJTkXGfgaH0IhXnSciPptOxbOrs9cOcF4g==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	65Fgeydevh/Syo3NAC+S0ixdq4a0nQ+TOEGZIFOYv+CLOsS6g0A3ymiMaYmmyYQZJSIV5iuG94l+e2MjXFTX1nLDy8FkRiXNzKC7+MWKfELlBwNIHjgorQcESKL4jVxBa+uuzGn3PYTxSJELMQ8q4YrRmCLFp0hdXYuGPTKfL3eTCdauBT3do/ZR8Fyb3ltRcb6GNIpKfVdaoakPxWNOhsIgWoB8HhVvAgZ4CLBYmW92AG+01zpR4euz5B2r4vJKwsQtelH9j05JU7qaY7e2Nbzo/vVT9cFA0zvmWSzqLb0KAWoFNsZCNOA3SHCeld1ReleKPmfObjOfYAspHAPOmvmqVd/Xebxp6C5nJuABvoxApu0RJHLU2EBw6uqf3JEKBXoh/o/Yfq/yQhHNM8brZJ+UflrUN6jjbXM9pjClDcPa5D2mAWtWk4qqxq45cB5NCptCrl3Gnc3MslHWIuoYiiBS80Uo3XFGMMMsSQp66Moz+yAFlQqiX9z8NBrZf81GnYcC9sY3d/7CMK4I9I9bN2GxIeKI9WPwNj2eQl4qLj0H4HnF4S9ZQit2RLR5nHUl+IPqcFEMobrMirszHulPvMx/y4fxdNC+wj8Z5EhQ0OhSOn4afYXCfe//mC0GQCgicssSzXnOgU05zoFJLgfclg==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 18:16:38.9672
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be603b6d-b1f9-4ce9-46d4-08dee10ae205
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR16MB5059
X-Proofpoint-GUID: 2aj9twk-gKJfI_FQ5-lJ8k5jcUT1bzCf
X-Proofpoint-ORIG-GUID: 2aj9twk-gKJfI_FQ5-lJ8k5jcUT1bzCf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE4OSBTYWx0ZWRfX2MK8RyhhjyZ/
 TnmFyM/ppHNwE9va2nVRVS/RCUTlxNmDyc4Xi7yIHC/kLFRNmwQERObn94waSR4BjiQer7y6civ
 eJWgCn6nqanz//mykFJHMD39lHFKw5TrwJs1Bvwm1Vgkt5CGo/1A
X-Authority-Analysis: v=2.4 cv=C77ZDwP+ c=1 sm=1 tr=0 ts=6a552b8a cx=c_pps
 a=mkiEHwHV8KLcq3bIK/dapQ==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=YJXg7OVxOWrJwj3yZo-i:22 a=cbNQJ9GKAAAA:8
 a=uiXQ-VffUSv7w1kNJYgA:9 a=3whSkbs7g9Me0DR5EJEX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE4OSBTYWx0ZWRfX6ZCTqTc/u5Oz
 3opIsMn+xj0gzlQRS+8t/J0pQ206H1WkeMyHqerkWz8qqGqjiYxpoMFtHeF7wCIUS2HDqIW7Jmv
 oBJa8Bn2XXG1uJKunVa7jfAUrKszk34cIxWY29sVa3TmG2N6kyZuaHoAJN2av6bnu8nY0mvqLC3
 hQC4BdYhp3yv/TTQdbJ/jv/1A3wO719Tylg6ed/kXTKOTLU+BdfcBzq6qxvGEaUOvNKY+ncmEuR
 YnBFgkQ0VDPCdUv7/9mjGL1xPP1XkL2w4Ddn/4oxFgedJr/M+DW2+CQCN1EDq3ZqKtCkM30LFYZ
 BRSd1BtCSJeM3W5VQS0TgEiEX26M90n56pOMqgk8isASPvPO+OBdQxHYZkxZPm0ZaQlJ0ET8rVW
 my8LPnl8fIQTMWAv00Wks4YczpYAA3EXEieaWf1RQJUZJHe4+csQrtVgJccnr0/l3NuURvKCiHn
 jQu7/U0ex6F8yIaSDgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 spamscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130189
X-purgate-ID: tlsNG-c1860d/1783966604-1157601C-CDCAAFD4/0/0
X-purgate-type: clean
X-purgate-size: 691
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_TWELVE(0.00)[16];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,ford.com:from_mime,ford.com:mid,ford.com:email,ford.com:dkim,saarlouis.ford.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B49BC74E684

From: Denis Mukhin <dmukhin@ford.com> 

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v6:
- new patch
---
 xen/drivers/char/serial.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/xen/drivers/char/serial.c b/xen/drivers/char/serial.c
index bbbe7587882b..e3c356408987 100644
--- a/xen/drivers/char/serial.c
+++ b/xen/drivers/char/serial.c
@@ -15,9 +15,6 @@
 
 #include <asm/processor.h>
 
-/* Never drop characters, even if the async transmit buffer fills. */
-/* #define SERIAL_NEVER_DROP_CHARS 1 */
-
 unsigned int __ro_after_init serial_txbufsz = CONFIG_SERIAL_TX_BUFSIZE;
 size_param("serial_tx_buffer", serial_txbufsz);
 
-- 
2.54.0


