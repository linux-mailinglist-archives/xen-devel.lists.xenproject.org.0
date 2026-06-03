Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id up7mI1HEH2qrpgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 08:06:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B2C634831
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 08:06:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ford.com header.s=ppford header.b=aJ5ksZvI;
	dkim=pass header.d=azureford.onmicrosoft.com header.s=selector2-azureford-onmicrosoft-com header.b=T1vZk2VS;
	dkim=pass header.d=saarlouis.ford.com header.s=ppserprodsaar header.b=Y5phDF4X;
	dkim=pass header.d=ford.com header.s=ppfserpocford header.b=noyziwXp;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=ford.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1325658.1590986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUejo-00067Y-Hh; Wed, 03 Jun 2026 06:06:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325658.1590986; Wed, 03 Jun 2026 06:06:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUejo-00062R-C1; Wed, 03 Jun 2026 06:06:00 +0000
Received: by outflank-mailman (input) for mailman id 1325658;
 Wed, 03 Jun 2026 06:05:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wUejn-0005u4-DY
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 06:05:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUejm-001q3f-QC
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 08:05:58 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a1fc442-5cb7-0a2a0a5109dd-0a2a450cbb02-18
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 08:05:58 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a1fc444-62f1-0a2a450c0019-94a392176bb4-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 08:05:58 +0200
Received: from pps.filterd (m0367124.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6533tJ1t1361196
 for <xen-devel@lists.xenproject.org>; Wed, 3 Jun 2026 06:05:56 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com
 (mail-westus3azon11011014.outbound.protection.outlook.com [40.107.208.14])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4ej50jbqgf-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 06:05:56 +0000 (GMT)
Received: from SJ0PR03CA0045.namprd03.prod.outlook.com (2603:10b6:a03:33e::20)
 by SJ0PR16MB4208.namprd16.prod.outlook.com (2603:10b6:a03:321::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 06:05:53 +0000
Received: from BY1PEPF0001AE16.namprd04.prod.outlook.com
 (2603:10b6:a03:33e:cafe::a2) by SJ0PR03CA0045.outlook.office365.com
 (2603:10b6:a03:33e::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 06:05:53 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 BY1PEPF0001AE16.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Wed, 3 Jun 2026 06:05:53 +0000
Received: from pps.filterd (m0426315.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6534fRp1034323
 for <xen-devel@lists.xenproject.org>; Wed, 3 Jun 2026 02:05:52 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4eghss4e0u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 02:05:52 -0400 (EDT)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id Uejew2fTk8Hc9Uejew0r88; Wed, 03 Jun 2026 06:05:52 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=bpL
	4PQ1sK3GRQcs9VpNRkHUlFeHUQT3HXXcDRRhWRL8=; b=aJ5ksZvIgLJUGd7ktjF
	lVuqfc+7SRX+VEcy5DvXe4khTOS6sIe9CX3XRCN3mGEPJvkjMzvQ9WLjyHz+W73c
	3UE/X/Rd+CBXl7V9TPb7gcl+V282PHO3nlPQeZ7EM4Wyn7ucPPURkw1o2nOEVXuL
	C+juM6zXszje1/8Bl8gA4Yg16ROlwLYRP3clIFM9aXmXwOdY3IfnK2Qrhui082Pe
	yzZxeZWg2skRqwTT0qkgucgjgxPSNThXBzWoJQ43VkZ1uTN2oYoGZDg1bX9bu2WG
	hLWfCEqfWKn4xQTryB9vCHoZqFI9ILtoZBjhv6i+e/zobkTl/gpSYNSl1RCccak8
	gqg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ycE0Ct3LenzGrQGkccAnFD0ziDFlDFOeRzTFFlXnMU/xHkCKanf0T1g0ijPPbktiv2FoOdvBiEk9eZ9grcgEQRQnqJSMH54oYfRF+qJ7sdIwarorM4CcUEQ8++15s3nf+MlPs4nrM2to+SECrWaNsmFI6mRZQmfOEaA+h0Yl/i4yHwdv+IIztxTxLfsGDfTOx4efMv532m7GW8rR/XN25NvRUOhO1DgpS3qrglGdJpOVFZmA5dC6hVhzujn0mB006udTfAPi2GMvJIugHjoKsRqvtvfGhxJQVJycFj9vTcml/wdLlqjY7TVFSurZCYgLqPptjgxN5OL9cM4oPNOuXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bpL4PQ1sK3GRQcs9VpNRkHUlFeHUQT3HXXcDRRhWRL8=;
 b=XoQ/wABBCnsfUUg7o/YpIzQwgZ5d2WfAmdTmsdic7XEtcPN7WMr/sYXFxz133ZZ0NOgKsaKSn6BKBGfunT2OtFGYNsm6qQFrlaY1RxqSxUOpMDy5CJ2slmrRQmiLL1fgRhe4g7OIUo3tU5eMrN+yoFB5noEN41ytyfM8YKM3EGhi0a5CP9cvQQ1AauqQ7C7l2bC2J8tGRwNnaBqc627+7COdzwe8GTXw6nuSxh8Eh4P3kMWxtNztIwX8VTbnTjp2PCA5FK3lVxvxP0uS/88srlh2xI51h4pkY2wNEqld8hP2ckTcsza5G2P18gRwovM7SVAbmUxbWnn0jrk04mc28w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bpL4PQ1sK3GRQcs9VpNRkHUlFeHUQT3HXXcDRRhWRL8=;
 b=T1vZk2VSraS/BPG/9TTcDh2xGfFqxGlJ30vXUZ649so1+Nyz748t3ZRrJu8biVMAAQlmzWgX6ERgNdPZFXU5IwQ+U3gvlxTBq9CfbLXkVABL7IzK6DNVhonCi5wTYLUe2acDiGJdwRK0622ZBSQnu93M6vOmASzIKCTK1GUJqsg=
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
	ppserprodsaar; bh=bpL4PQ1sK3GRQcs9VpNRkHUlFeHUQT3HXXcDRRhWRL8=; b=
	Y5phDF4XT4mFxJ2TEe9Iq2Y1+LxrXfapybTZwgsX7NB2T6btKbmWm+DchftejobA
	TzCpYUpICmCaTo950F/TrN/teT2lgtwk4rrtcKNhqQooR1CEzHzH/nipdq5i5WVH
	CgIpvQXbkchk1S6OO5QZ7ajAInJO8j/bCzEF+0S0Dy1dxPNXr0PF1t+XIJcdnR8L
	ccbpKPTW/K95iehPBHkPm3kagNVsenpyn/gRE/VgPnlV386R4twEtmG4VJUNbtU2
	qoqUMXmDcgfRc8XE363R7YIV+7LwV4INjceSNFq7XOpQHe9yP+ole5kKNCBRuWKj
	p3gvfI+1gZcTA4T+wcWaCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=bpL4PQ1
	sK3GRQcs9VpNRkHUlFeHUQT3HXXcDRRhWRL8=; b=noyziwXpb7ecz6Sjr42rXIC
	4AA60H4XEsfrldDo0ivjdneuRfnk17NhOD2i7QVHaOlLmxPW1RHlFFFTfMtkEgwK
	OI2vh9Jo+zeT8kfAbKUd4mpqZNaMoOEE/7+tJMdUISix9mK8DL/D3t+gxi6egm/s
	JEvahy0JPm82fnHa8Ihk0m9pq+se1gCol5jHV1HbB4mg33G8Qs8DhW2PM0ZCmHoh
	DjMr2cjT6qUc59ZL6heVcBbr/1iVo9MjMXrRuF20wV0trhyodt02a+X542Bxt5C8
	eCqqlvVdaiUNDa1d0adgiiqd+CQ3hD7i/voEjUp4UegxdXAmqUa6zLQmyKiGe5w=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: Uejew2fTk8Hc9Uejew0r88
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com,
        Mykola Kvach <mykola_kvach@epam.com>
Subject: [PATCH v4 3/6] argo: drop argo prefix from argo_dprintk() calls
Date: Tue,  2 Jun 2026 23:05:36 -0700
Message-ID: <20260603060539.1181809-4-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603060539.1181809-1-dmukhin@ford.com>
References: <20260603060539.1181809-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030056
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE16:EE_|SJ0PR16MB4208:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ad639781-d204-486e-6fd3-08dec1362b92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	mI7aJF7I7nWrRHBuzaTuBRjqy4q5Tk0CoqbwGVZYZ5P7yQrShXW0kot3VHGt/dSnxacJRU7Ua4flzONrDmjJW3vBw9WVVmmLn4gZ4aPjRWym5mqzmuwg0KVTerJfZkUkT/dF8oUxxkhAm/yR/y6gJTkcoilda1zTfavtq17F9bELbFRGQ91fI6gqlq1h/xBys++ab45z9hMHAAjGUGD7vTfEd2yab6/+RDCdns/+iVIMICoiOuO0SZsz4IRo/p3YZdL6m0tkhhGaSPuWB8yAlMy65STkOqPH/z13YqzbsYnGwHnH7rx76XGn2NFeji2hFoJq5ma1TZFn0IZrQf7Wx8shoq631Xo5JJqEX8sC/BtZu03RY7xWlZ2o0PelpOVfLit/oaT8tw8XZpZPELgVxeemVpUzucfQ8RA34aUky6+1X0PpszTagZwPSz9uEu58dtpweo3QFQmG4S2Wx1/7GtAs1nyCRkyAIlLD4DQrsURQ7dFiIsBgBO1PSkM9RxlBRVHhWEYY1nJ5vZIqmTgpC5jZ/juAxVao3YUCLS4l3SrLEo3XBTGqXVUbF00giwD42YeqCUfmHg5JvM7IJ2bIrm+Apm8+Warzi+1rPLH5K2h/8o2D4EOemTO0V57e7maV80pm+0wZ1sfPOQTDh22qj35Jy65UaFebPm3l341GlwCmiWPF3bhDpoKqwGRKw1O86Zh3Zr3g+iwYu3eixH7l5Yzv4udDvAve42viIyex33U=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tiGvczqdREPP9ASEnINj8IQXdYxlaa7MBqh6bKa2uKgZjNqiR8DuSwJQoX0L321/1OBExAPYrAdNOv9QZloUPJYMB2gltBoHw+RNyLBxTqBkJ1kkelPOUAgEiB3pNC7aw4AjMf4d18jZrn9hpd2L87wtJ9N+eUVcsV0xuyEZipJ0GTxW+AdOe3y8f/FUyhayQam0fWcErZ7TTD6hfs20GqQTFeqy0zpIgMkocPPSiDbC8DUg5H8R3hPJwKn2nutrN+M2sNMfit0iMJH6/bXZoFdQJk3MCJaYaDRc0WbSLHKG29S0M4yRb8hha4LxnRMdbJS9Vw9oMrDqAbhhbYl//xUZnlZkyFYT/hpOyGpxCU2jvUd+4uUQhem4Q8gQRzsx+wljyq9PMkOI7hGtlO5tBac79AThcPiAnR77sHR4+fF6o6tKgUNsd4yQk9mnd1Cg
X-Exchange-RoutingPolicyChecked:
	bcZJHk6rMnFD/H6kY+XWcqlbeO4MlgE//cw36fFiKJIcu53jQ1w9Q35Svm+VtosUDd3aI6LULUSW2D+yeh2YF7/u+/R6XiLp2w0juimzoIvJTkVARhIHUoCoEZx1vHTSjTCPHZ4r4KWVURzQOfbix7ri4njFeIFk5ufwy4ImFhaO8WslhpDuUDwDK/RtzlTutC2RRpRbXoxjRmHSpGscfCn3s1AhCRXujndGxxptahk1R0krS772hyOF6/u/rgGFnD3Z/sKaT4voeNQkRMyp846K8Q5cTdAH52Phja6WbZbeW+munNMK/wz7/j0bkRPeWgT/zLku8tjy11zNEVkHsw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MhrItVhA1wSQ4Uy+uNWuboTn1UsdDK1SYNmPld1TxjuKpD2YCPi3ucvuwI2KzeHpAzQp8PH5cd6qvlZ44Tb9Gf+BmU/RzJGS2uAMoVLVfdyy4Cho1EcEiz2RsLO5Y1t/mfxOodqSQD1W+K6jOHlTOOvOk7MqXnGHKuBIveGGABQ2VH86MAOSgpViZJJIKsoPc76UN4FGox8egwJOX2/Adcpn2265tTQW3OOtT7l9cteLKRfJgtvTiAP6Tfh4zFyPcOry9h39EB74hvQbnj/G6kSaH8IJMzbbxKmhcpe95RykyQdw4rv1XajchOspIXZ4pxOJLVIAuSU1wXbV5wRUjPitTDlKmVMj6FUdYQkQVb+0+qXAT91XoOyaoegWcPv2GtO9hwzE7B+0RL0DKo0eb8t9vfWgS/lA33NztDq5AK/+wUdwjI9I61kZrzQp4/mCHhxTcZWmoNbYKwsGYSnpwvNuXlZW4fk9QOzsX3q5eMeDJuyjN+DZudfxe4w6r/MTRbjTy1nF+W1cfKw25cdpa31WVDLbZDbga32wvoE6fHl1Ns+rfc0P8xWkLSlagiDjzKZ2wK9wH/Kg/yleOnqRwecMqBHRuL/2BQpsBc0lUM5XgMgi8wMbQL9xOyg15jNt
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 06:05:53.3978
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad639781-d204-486e-6fd3-08dec1362b92
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE16.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR16MB4208
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA1NSBTYWx0ZWRfX01ygyPrvcYxL
 /tEKSlI768bLUbb++uoKKSTbBGg+FspRbgLzFkwvhtT+uoNZCsqiSPfRA9fIL09UClaLiD+Cf1u
 koAB9DAA09buMmbzMxEmgR7R0nxGHDiobMkd/N1GJz2WQRwkkwHnT35SwyVykyWEFb62go+WzJY
 /kaOKffZC+WbazE7JfxBMqt8UwdvQtcnC+8lTdpOzbMCOPSO9vxG10wX1i6+IB9+cYvLohojJ/x
 q3SN0o0yIousaPbdKpEofksBLWmWDxC88PlOvA88uytlBmNbrMm+hDMt8uZjxxdQKUVJTMglwUZ
 ppX12hMtX6aDGZhypjlEF+2OQCIuJ5bj7t7YAHrxakkILJ5aTqVZjt9MQl6L+kT5xmWmIFqWK7J
 XSWK8nRY6GEViDv7+oULn9W6DixiuYAnzNiNVVm0dXpgzEoPYxcdCSwmQnXG0LNkJSXjnZzhF1S
 RxR9Liu1zzqIhUTqDTw==
X-Proofpoint-GUID: aetGZ0hv0S82gnul-uZlvZJ3EVXX2ir0
X-Authority-Analysis: v=2.4 cv=IuEutr/g c=1 sm=1 tr=0 ts=6a1fc444 cx=c_pps
 a=RGFq7D/WLd/IouGP2/vkQQ==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=YJXg7OVxOWrJwj3yZo-i:22 a=cbNQJ9GKAAAA:8
 a=DBfv99YmAAAA:8 a=VwQbUJbxAAAA:8 a=TweWIa6zg6WzoLAQ39YA:9
 a=G69WFyCBNqGPyalROSdv:22
X-Proofpoint-ORIG-GUID: aetGZ0hv0S82gnul-uZlvZJ3EVXX2ir0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030055
X-purgate-ID: tlsNG-d25034/1780466758-E2D73CF5-78BBF8A0/0/0
X-purgate-type: clean
X-purgate-size: 2395
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,epam.com:email,azureford.onmicrosoft.com:dkim,ford.com:mid,ford.com:dkim,ford.com:from_mime,ford.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 22B2C634831

argo_dprintk() prefixes all log lines with "argo: " automatically.

Remove duplicate prefixes from log messages in the Argo module where
applicable.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Reviewed-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes since v3:
- n/a
---
 xen/common/argo.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/common/argo.c b/xen/common/argo.c
index 5da14c929e14..ffa1f43437ab 100644
--- a/xen/common/argo.c
+++ b/xen/common/argo.c
@@ -1467,7 +1467,7 @@ find_ring_mfns(struct domain *d, struct argo_ring_info *ring_info,
     if ( ring_info->mfns )
     {
         /* Ring already existed: drop the previous mapping. */
-        argo_dprintk("argo: vm%u re-register existing ring "
+        argo_dprintk("vm%u re-register existing ring "
                      "(vm%u:%x vm%u) clears mapping\n",
                      d->domain_id, ring_info->id.domain_id,
                      ring_info->id.aport, ring_info->id.partner_id);
@@ -1527,7 +1527,7 @@ find_ring_mfns(struct domain *d, struct argo_ring_info *ring_info,
     {
         ASSERT(ring_info->nmfns == NPAGES_RING(len));
 
-        argo_dprintk("argo: vm%u ring (vm%u:%x vm%u) %p "
+        argo_dprintk("vm%u ring (vm%u:%x vm%u) %p "
                      "mfn_mapping %p len %u nmfns %u\n",
                      d->domain_id, ring_info->id.domain_id,
                      ring_info->id.aport, ring_info->id.partner_id, ring_info,
@@ -1741,7 +1741,7 @@ register_ring(struct domain *currd,
         list_add(&ring_info->node,
                  &currd->argo->ring_hash[hash_index(&ring_info->id)]);
 
-        argo_dprintk("argo: vm%u registering ring (vm%u:%x vm%u)\n",
+        argo_dprintk("vm%u registering ring (vm%u:%x vm%u)\n",
                      currd->domain_id, ring_id.domain_id, ring_id.aport,
                      ring_id.partner_id);
     }
@@ -1781,7 +1781,7 @@ register_ring(struct domain *currd,
             goto out_unlock2;
         }
 
-        argo_dprintk("argo: vm%u re-registering existing ring (vm%u:%x vm%u)\n",
+        argo_dprintk("vm%u re-registering existing ring (vm%u:%x vm%u)\n",
                      currd->domain_id, ring_id.domain_id, ring_id.aport,
                      ring_id.partner_id);
     }
-- 
2.54.0


