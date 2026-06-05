Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pA2LF6gGI2oBgwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 19:26:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1682A64A247
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 19:25:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ford.com header.s=ppford header.b=eKALd3B+;
	dkim=pass header.d=azureford.onmicrosoft.com header.s=selector2-azureford-onmicrosoft-com header.b=ZLuSrRA3;
	dkim=pass header.d=saarlouis.ford.com header.s=ppserprodsaar header.b=gZEx2h9w;
	dkim=pass header.d=ford.com header.s=ppfserpocford header.b=Fv8Ip7+v;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=ford.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1329868.1593756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVYHq-0002rg-4D; Fri, 05 Jun 2026 17:24:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329868.1593756; Fri, 05 Jun 2026 17:24:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVYHq-0002pc-1J; Fri, 05 Jun 2026 17:24:50 +0000
Received: by outflank-mailman (input) for mailman id 1329868;
 Fri, 05 Jun 2026 17:24:48 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wVYHm-0002pW-Vu
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 17:24:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVYHm-008EjS-Bx
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 19:24:46 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a230655-2eae-0a2a0a5409dd-0a2a450be09a-24
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 19:24:46 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a23065c-212f-0a2a450b0019-94a38ff1b3f8-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 19:24:45 +0200
Received: from pps.filterd (m0367129.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 655EJwum868537
 for <xen-devel@lists.xenproject.org>; Fri, 5 Jun 2026 17:24:44 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com
 (mail-southcentralusazon11011021.outbound.protection.outlook.com
 [40.93.194.21])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4em04h23t6-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 17:24:44 +0000 (GMT)
Received: from BN0PR10CA0029.namprd10.prod.outlook.com (2603:10b6:408:143::7)
 by PH0PR16MB5110.namprd16.prod.outlook.com (2603:10b6:510:295::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.9; Fri, 5 Jun 2026
 17:24:41 +0000
Received: from BN3PEPF0000B06D.namprd21.prod.outlook.com
 (2603:10b6:408:143:cafe::6c) by BN0PR10CA0029.outlook.office365.com
 (2603:10b6:408:143::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.9 via Frontend Transport; Fri, 5
 Jun 2026 17:24:40 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 BN3PEPF0000B06D.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.2
 via Frontend Transport; Fri, 5 Jun 2026 17:24:40 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 655HDn6F3759945
 for <xen-devel@lists.xenproject.org>; Fri, 5 Jun 2026 13:24:39 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4egeyptbtv-5
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 13:24:39 -0400 (EDT)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id VYHdwczNKfWWnVYHewN274; Fri, 05 Jun 2026 17:24:39 +0000
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
	:references:subject:to; s=ppford; bh=w9aI1eSfG4UUnfqQcZmCpgTVs3c
	Du7Fon9xzFxTJSUM=; b=eKALd3B+yWQkPJmhh7YxS2e1XLe7WSgc+/CRnUnPAz3
	a++jaVAFVnL9Amu6xZjSyEOIWlkiAXg+8jQqTM5AyEVmkfupMVb8YcupGli9zmLV
	W3E7OVC8kqknkABHi6z5WnJmD0niXDCwVQraetjJhPrOgxI+QPXsRS9BFG+/zeiP
	LXPSb1N5n7B0c1G1wI9jbP6Ymnw/tPGqnVbQHWwMRjzpl4MuhsXRJ05+MRKqXjGp
	UrsmvU6hassUY3SZR8Ae0qkmfmGVQH4mF71EeR2Te9i2lCa49MJtMGFExUcYmOyE
	j6rI43ZE8h13pd+vcCK11/Um7yx+VbKL0gyn0otjmqA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WihX7uGltcmxfKdK30mloIK8GqX7eQxW+FOxaMzOmMK6DGs8y/jFL36OQn3UiPWosyTe69/2VftJ0epMBzV5ttnULx2vIsD+wfTZ0VsOttHjuzxk7HQh0pxdcrM5TfOL6bZ23QK1Jso+Cb0d+0JXIAq0mvqgrLz7H0Zy2vdoJV+G+5u8314dYl1oMKkYf009gtG6SKfX8WS13I2iLbwO/s45HOh9YuUC998bmkPQaeX5fHgnvnLSCsuD8hXx8Q9ZfWJrIz29dEcWdLNa8S2mbE+wjknUkTC+zZ+mhweja6bo9jj+en2Ww5k9VIThv/PAMhep1T8oP3Hlw9bafuaRFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9aI1eSfG4UUnfqQcZmCpgTVs3cDu7Fon9xzFxTJSUM=;
 b=eAuYQuCu7TKy1y34vy9MCcIqGy2kxQV8t1cgHTvno8UdjBrStqXyRFZ5KUmLgOvl7swIFgGSpD56MR0VvDv3p/7YR5ogUjNwWJUQLKXmHglrL3DxjPwh1LEigjqZ0PReBUbQiPgQ1V1ZDs4dAcdBqiFfMbRc4DlDTw55O3nep3SoHT4RzaGexSiIMbowfROQMmgcPbtUalx329RCyimJx/aE8dJ3gUTESTpA/FPPDTVrx9B0gKfk0z0hLyS9lhJwNQ2n97Pdusgy7wqn+imEMg5aY5NjMeKwCn41IZl003o+VvJPqccF58O4XdVi1xRDAAr7YNQVRLKPVeKiQ6J2gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9aI1eSfG4UUnfqQcZmCpgTVs3cDu7Fon9xzFxTJSUM=;
 b=ZLuSrRA3XyS1PmyftYACGDOI7UQkuy2yTcAButNWHC3e6vKi+mXuWMf7AiFAtnkYazpRSVDqOM/WCqDsmpHLa56ljPcUf7xRBVGQgdo+QT129YD86ZPA54O80YayE57M0JBA7nkhQuaIEfUFumRcve7UYKJcP/ecT87RGR31qDQ=
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
	 bh=w9aI1eSfG4UUnfqQcZmCpgTVs3cDu7Fon9xzFxTJSUM=; b=gZEx2h9wMoDh
	/nQHHGWcQv4K6s1Yt1s/6S58uBYQO++8WftaWGT3a+bps6PT+CLAJBLQyNpQnDyI
	OWKRXpUE/5UdO1jg6tZ9hfbCVGF5IQXvir6iHMnHxoTygxjP4XoPiMCP3gq09ZuZ
	w9pGPVpGjlmsLGQindTXUdHlzjkq3XlLloMBB+S6kdg9hI9+y84iVfdpDvRHjiVA
	xXYAVF9+A0njLtUxpR0jhARhOQ9wCz12fppz3y8oljQoWmXfBayw2Usql5SJVY52
	m+ZspX3tUrsLguNdOZ+sDajbxPbDqZ4E1BN5dLDHrALFUYNLpNFsFIqarhAeYo1D
	qBGWrE7jDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=w9aI1eSfG4UUnfqQcZmC
	pgTVs3cDu7Fon9xzFxTJSUM=; b=Fv8Ip7+vkEpLfyRBE735CJJiSx1ruol08c+c
	JehIWl3LtObADYaNbBiuRSNj0d4WRc8oAUJLov2jM4h6a3uciJgnq/J2Ihci43IE
	lix4VFNk2E1ya0OEYB3DfpCnm/N5G3BNlLPcMgwEFaWBsCCJJb59ZsOgJQXjKuID
	Fw4Db3tL5kQtaRhLn4ech0Jc6csywvVDuKbwflj87vFceXpRoB8NIs2WPvCdOJZy
	wXLY4ZF1TFObqFqukOIivc8L47XAJrTdoEH+0mm79+ctn7vWfmlRj+73+odAz8tx
	IljAcfXPKwJAxrDkEBDRtTRjPYopFcmtMOcWP678JYGwphPhpQ==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: VYHdwczNKfWWnVYHewN274
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Fri, 5 Jun 2026 10:24:36 -0700
To: Jan Beulich <jbeulich@suse.com>
Cc: dmukhin@ford.com, andrew.cooper3@citrix.com, anthony.perard@vates.tech,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 0/6] argo: few log fixes
Message-ID: <aiMGVAl7TvVnRcTX@kraken>
References: <20260604214926.1735194-1-dmukhin@ford.com>
 <029a2474-775b-4846-90b5-26509c2bb655@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <029a2474-775b-4846-90b5-26509c2bb655@suse.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606050171
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06D:EE_|PH0PR16MB5110:EE_
X-MS-Office365-Filtering-Correlation-Id: 3733078b-9f4e-49d0-5a06-08dec32753bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|4143699003|11063799006|56012099006|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	D07xhmAvQ/A68Fh28iA671rDPK40I0+deuMK9yyHFTeI+NVYF8LkNihX6AuiQrKAuMGSUPoP6LUHqwjaQWo9lPvV0Lh5yHEdw3+JOAwiwXPlJxNRIzHnIyskm/04kSTRc4RoeFS/G+zx3fGxIHf9/Oz3qEJbe73Wf/aHEibQRFiLq5MrGdQMGd3Yd6caIr1lQzGNpb+DadpSZeCCq6sq+R+nrVQ/h3rP0efRFBC9ECCnOnzpLIaC+MagbEFSmkMzqtKKOGcDXw2qFIB9JcT4Dwc6/fxm3RZj/xH0T3j4Rwrnpaty5uMCAhy7ecTurun/rtXkbduDzvAXtVl9wcrNt99ghbR/4d9Pg77bdegMAiSyiYMWT89kxbiRJa0TMwuni0R7HeWv7ThnBnqqSlPPFJwP5+P7VonfZdJePNXXOoUM3Ia9A1xf5Oybxql43+iiugeM9bpCQRunGJ+EYXLetWcVTxivGP4jfqT0/s9WTCO7hd9qmb3v7jbxR+wXz3VC3ZSfzdlOAP/6KNfSMy8X18nLm8IMYI0oxG7lGnzXc54U9RiF9YWrb3nfvJL6Mc6evAQkgdUIfGGmTK1sY41E6kfqY+f5C34ucjWzLZch/kTUrIukDCPb7p0fxA/CpWbu2lx0oQ54QUWKShbF6CKmca4G1xn9VlFBvM2Bfhk5tPnKWb54HPbUDk+VPmBlR3dgTyORMAhF+3AK7xkpMMjqoFL2L/Rdqyqv7UxUrGO1eZZMZkNUyyU2i9M9VniVSTUx
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KiHUg0Yopc7en0X2ytCamGx1E3ZhWsrwkoTgiBaZCjStaAtHUU3xkUrDUEKCyA62I5jg3FqjPpxIYfFmCa/m9BxSxdMzcV7jWHSwQ5z5XutDXrcGHIIEpjBS6kX65zBofLlOVfGNKqiCA795SKxumnGMRmjg4zEQ67iDd0v+LxF90VYMdhrF/lakZjZeioFf+G9oSCaL0WXNBDAupAGmFn2msAyQamksBRLk7x5uUVbUx2kCdyDsHDjzkXKWqwmw0DLsPSy5BmIxzIBmzDKUIkP1w9lsZFVqwaJsiimQhiCHsljJ1CAQklM2c8FfobQ2Ipg7I8jRjKCy9SsBJFCmoBaY8petcBuLITfYh1BjHEpH+hGVRuIKB+lnVb66kPK1zEp0gYtumIAGqW9rAzlPocKBTieYoCakHHtRkrdtih+FsQhbiGZ8UrQfvWNssKyw
X-Exchange-RoutingPolicyChecked:
	gbqRJv2s0PJg6UDflHmyXmGVsfuw9eBUqz3nZng++j30xFbjvCIbV67zW86lFWd0xB//2BHOuyXlbagZmVW5c6SMX003z56DVMhomBhtg31xFEEq7JdYHWo0DPzIai26lfAdd0eg9Utjm83soNqWqjfOiiPkrioUfUVbwtQmLp3j0mrocDJhiBCgSkGTOzNPvhhlafH2H4+hzSCAJyEeKtwyMUnHDOcLsBJBGVYBwyxhAN82Ffd3uyVMsxK5ZmgPdBe0R5s7yb7hSC0ITfWz/kGT1CenEgDM1H7r0U/CG3LK6nPggISzryNFiosDa4Ho1pjWN5tSgRMMU0g5ip8Vdw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	msguyMfSSnsi9i+8AwSVYThLQy6Z5ZszVd+nKwQGbzKaYJXces8qS7jAAkLzNZEBdlTgE7Vc50EKSsM7jzZVggKKEyRP+gMgVx3K7vTLg7UrmESPEqYEUK7sTpwD5RBAm51mRgyag+EnyG+NvD2HGEpG7Ro17mbhWhIRivi/6OX848qOBnEfEFZvEZcQN3bOMamcAfV9HiXxNSDT4jirV5WweX8xOndso4kvK6E8J50vmno/KNApZO5FyDSREwcK2COq+ausbnMTq5spjNSimFF4om6KPjC8pdwMwDo2QH3yaznHldDmL9P/tT7R4tnIB6ns03PFhvFzn3t2Fw4RL4Qpz1JjhSPyfMScgWZtfnU5zwLMWuZihW9ttpACXRCXnF/oTBZq1mGhPzEQUds6FwTMlxUD4KE1wMBbeTxxm2SJ2BBMnNNfQh3Wmfe5VomTpoH4rhDfpmAFgkX0KCTFTDFkpQwrORzfsMJAsszhhGBOie3SIxp7On5nhRt8VisGFpgd2QnobRDVSu1qyw3Hg92eYUL73b9tnZWDBFgzMhSX7eqPLLk765ldadvlHz/bfJlJtxa2geQr7cjRDzGX5Um7uaS8y6wQI4oFCWs8/lHQrSnOOUaLuphJlvMp8JtM
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 17:24:40.5945
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3733078b-9f4e-49d0-5a06-08dec32753bd
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR16MB5110
X-Authority-Analysis: v=2.4 cv=QKBYgALL c=1 sm=1 tr=0 ts=6a23065c cx=c_pps
 a=2plZotBPgSoI6Rnih3N6KA==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=X3KReqg2EL6A36SYCKpz:22
 a=p0WdMEafAAAA:8 a=VwQbUJbxAAAA:8 a=cbNQJ9GKAAAA:8 a=ff7NaItP40EVMNSKKJAA:9
 a=CjuIK1q_8ugA:10 a=G69WFyCBNqGPyalROSdv:22
X-Proofpoint-GUID: WQhpozjK27d85E1Y0FpTAGGBv6zlALvS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDE3MSBTYWx0ZWRfX4TSRxAQsvn3g
 0M5IKIglWGrbr8E+St5OMZEhOoi0YI8QZySN+uh1lWGf/rsIl3n+7ie/Do/COLca6LRLVmFhR8k
 LtwJ/HWhpibhipj6nNgGGkVQaZYAWoOM+WCvu6y5bi2DKldLMLMVrcz4zmvY+B7PsevO8t227z7
 7IOhq0c9kbwBI9/VgQJLFcG8iGIJQsvcwM3PB0Jwib6Es/9JV9imLtGxh2mijKvy7A7Opl8JgsC
 JSSuS9XhbgCn7yiBIRotErv6mnMNzKCjxPmFH0zI8KTECGmsyLQVzlKTmDH4iWezdr0rr/l3xqu
 9EhMPFpvk3Wp0rgtBGa2XOLFhOcKEI4VSnG3bKVYX55+ZHJUbW0c392ngbmH4XBvSFzZyiAJKME
 N8Yzw7gOZX/7ggs0WneCuNnkm4B35ffP34wcjxDjutXhI3Sq5zv8Bmh7HDXt75QjEg4GNhq5uK5
 UmCLvbi23zItmo9Bigg==
X-Proofpoint-ORIG-GUID: WQhpozjK27d85E1Y0FpTAGGBv6zlALvS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050171
X-purgate-ID: tlsNG-42698a/1780680286-12D77F3B-0811CB0B/0/0
X-purgate-type: clean
X-purgate-size: 1490
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,ford.com:dkim,ford.com:from_mime,ford.com:email,azureford.onmicrosoft.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1682A64A247

On Fri, Jun 05, 2026 at 08:23:18AM +0200, Jan Beulich wrote:
> On 04.06.2026 23:49, dmukhin@ford.com wrote:
> > This series corrects Argo module tracing.
> > 
> > Patch 1 lowers the verbosity of a spammy log message.
> > Patch 2 corrects the debug logline.
> > Patch 3 cleans up existing loglines by dropping duplicate prefixes.
> > Patch 4 re-wires argo_dprintk() to gprintk() to include mode debugging
> >         context.
> > Patch 5 adds new Kconfig for short-circuiting extra verbose Argo traces.
> > Patch 6 enables extra verbose Argo traces in CI for ease of catching
> >         potential issues.
> > 
> > CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2577682899
> > Link to v5: https://lore.kernel.org/xen-devel/20260603194131.1468654-1-dmukhin@ford.com/
> > 
> > Denis Mukhin (6):
> >   argo: lower level of noisy connection-refused log
> >   argo: correct logline in ring_unmap()
> >   argo: drop argo prefix from argo_dprintk() calls
> >   argo: fixup argo_dprintk()
> >   argo: introduce CONFIG_ARGO_DEBUG
> >   automation: enable Argo debugging in CI
> 
> I understand you want to be helpful with sending these updates in rapid succession.
> Yet as (attempted to) hint(ed) at before, please either do it properly or leave it
> at "committer can do minor adjustments", when that was offered. This time round you
> lost Oleksii's R-a-b. But no, please _do not_ send a v7 for that.

Thanks for help with the series!

--
Denis

