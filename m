Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ipC3MATzIWpVQwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 23:49:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 129F6643B0F
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 23:49:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ford.com header.s=ppford header.b=r8L8i5GJ;
	dkim=pass header.d=azureford.onmicrosoft.com header.s=selector2-azureford-onmicrosoft-com header.b=J8h50GWP;
	dkim=pass header.d=saarlouis.ford.com header.s=ppserprodsaar header.b=QgkmI8js;
	dkim=pass header.d=ford.com header.s=ppfserpocford header.b=i4y1bNiz;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=ford.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1328596.1593013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVFwi-0003vG-Q8; Thu, 04 Jun 2026 21:49:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328596.1593013; Thu, 04 Jun 2026 21:49:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVFwi-0003t6-K8; Thu, 04 Jun 2026 21:49:48 +0000
Received: by outflank-mailman (input) for mailman id 1328596;
 Thu, 04 Jun 2026 21:49:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wVFwh-0003n2-TA
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 21:49:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVFwh-007iRJ-9y
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 23:49:47 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a21f2dc-2eae-0a2a0a5409dd-0a2a4503898a-6
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 23:49:47 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a21f2f9-672d-0a2a45030019-94a3921772f6-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 23:49:46 +0200
Received: from pps.filterd (m0482516.ppops.net [127.0.0.1])
 by m0482516.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 654IemWQ982314
 for <xen-devel@lists.xenproject.org>; Thu, 4 Jun 2026 14:49:45 -0700
Received: from cy3pr05cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11013062.outbound.protection.outlook.com
 [40.93.201.62])
 by m0482516.ppops.net (PPS) with ESMTPS id 4ekeutsk6s-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 14:49:44 -0700 (PDT)
Received: from BL1PR13CA0288.namprd13.prod.outlook.com (2603:10b6:208:2bc::23)
 by SJ0PR16MB4604.namprd16.prod.outlook.com (2603:10b6:a03:425::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 21:49:36 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:2bc:cafe::9f) by BL1PR13CA0288.outlook.office365.com
 (2603:10b6:208:2bc::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Thu, 4
 Jun 2026 21:49:35 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Thu, 4 Jun 2026 21:49:35 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 654JQtxk098534
 for <xen-devel@lists.xenproject.org>; Thu, 4 Jun 2026 17:49:35 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4egeh8h3b4-2
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 17:49:34 -0400 (EDT)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id VFwTw0W5x5kHRVFwTwiWW3; Thu, 04 Jun 2026 21:49:34 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=i1v
	fvWeM944jUV/6u1QKjPpK5OPVweNgWIEOeivkA4M=; b=r8L8i5GJRW4edbq67rw
	T8P4UKkNLhS3lNQ/zgIl+92zo6ebDkjIFAjP+YrdjR2qrPzAe9r2OilgOBJfmneG
	fTHLSFxImgmmiA16N1kZa0ekXepfUn2NuooY2cxfhM3aAMT5cp3+hnzqrbIm1q2z
	VtOVMfT6d+VBbHt6c7J/w08JAo2ZCkrtoAqmPvuUb4d7/a3TDUHpEhZ/efqPGvus
	cprpI+6Pt3oPGFedSau6K3SRcnfskP7/01EVjiM4NsqEOB8RP9V/Md60P5fzCej8
	z8ljAAXuULC0OpxXkF3aaiH6PRcphY0tEZIi3hnMqkImyyKIauSjSzS2ytHT07gR
	KFw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MQX/Bn7gQEdTDiF2VmvEkHdWGgUThS3pCaq8jCVrw44J9NomI8XTNTS5fHB/uI/ZulducwyKewGsF6DShBEqQvWmqTfH1O0dhmcC/1LTHglIGrvOfnYbsQJsk3gEZheSa6qMPkoCK3UzoY8vNn4Nzzv7PwJ/QGVTrd5NSJhUzxxq2t/ctQd8kPSRtcAsIvqkLN9QAvJe6wMf08aR0rF0a94oBZMr8p/RWwZjFvhb8o+roj49VDEl2y9woFRMZZ8ByNzLM/pvksQWO2839I+KcJjH916jF2pE3+joqD2wit76+tc9HqEkfgiWkqbJbde+RmyUjNcLXlPZ5d7MwdH89Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1vfvWeM944jUV/6u1QKjPpK5OPVweNgWIEOeivkA4M=;
 b=U5227estgPK/6GLGd7x5ys8Ff5LeAoLPHhPJnVknHMoHaR70U1sG1jag6KDkLI+AGEqTM2t1FgZjX27XPl33bdiqCLRpchFV09MxHbN18Rj1ao6RLfZfnoIblc+WBOO0qkeT1b4FsPWIR4+79696IgI0JDCigAuJvyg6mzFrSDzrGedn/z7mxWnxKHekoWCoLIVOkTO4o8IvlciM7H+bSKxijHok9Dd8KSbg955vcD+1Hj+RbyZDxPsvJnzWL7VvE0i6hASB1S2Wj43Dlw+CnbZ+YftrtlSNJ1aL1exE9G16lvMcj5hLaNxxbCNN9br5AjZ+o6UkON7BVTB07W1HEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i1vfvWeM944jUV/6u1QKjPpK5OPVweNgWIEOeivkA4M=;
 b=J8h50GWPekLyir5U/MIn+ee7TR0cl1IA/8Gjaa1M2tKNKuB1X7AIDYAz7UGTNFd4D3v4EuFAOAt8ULK0mWl/TtMH9EtyEau88o/iIIUZ+Oucfs7dkS+Y+iOWuwyBCoe+vyHg0/7wXQrflQN2Rli3jhMaxKZk2DUt6e+ZXLlt7Qw=
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
	ppserprodsaar; bh=i1vfvWeM944jUV/6u1QKjPpK5OPVweNgWIEOeivkA4M=; b=
	QgkmI8jsVqZUfC4oE7pJBQODi8bg1z80doNCkjMQMfvx36SGq3gS9h8Dc2XFw6PG
	ZaPqsOsKwGzDi9REOWwnuPEFYKJpBlKNGZs3yhn0BhhH2gP/Uip7rpZOiYhLvwpt
	tKJ0g6AjWBeRfidmFnimQsht+qNjL6lCyXD5uC+325G/Y5SctnW6aOxjoqt+8b5g
	w2W58SfoVQB/nLxjlSGGtxEnHeDxQX7/UgyXt7wEOIrkOl2jEbzEkaMjIqdKcEHs
	/fVI8bP9ZOoleYb7P+LyJyGAvgYpODseWuGTkBRgk7HUXWQQhf8bdUQ/2wqbA8pG
	/FTIEldCN1V16z7bA48RUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=i1vfvWe
	M944jUV/6u1QKjPpK5OPVweNgWIEOeivkA4M=; b=i4y1bNizc8fbF8RrxkeT7rX
	F/vQE841rG7vNMBLQ5dJNfG4p+WIcovnxDC0y4lM1DZCOAEWSJQQ27sNj8irZALZ
	k5+w9pXsgmByJO9MZwNDv3kESlmfMP7Ib5tsu0WR3j7wpqR8Y5r+li4DHQ/r40cB
	JK0XHW3oTLeXJZhNDgGGLvwwfcdBrEBVu2qM358PQzY/pf+4gZUaencacOUkDdIl
	rvdJm7HYezokKZyckQB1P9BB5nP98mLK6cIMwItE9aP5uUaMQO9MNlmnmiXBFZae
	UpmhCk+FNUId4xT6nZzgsZWsiAF2pfGvHlHrI7injW0VnLnSmZlXa1vZzDHV2lQ=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: VFwTw0W5x5kHRVFwTwiWW3
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com,
        Mykola Kvach <mykola_kvach@epam.com>,
        Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v6 2/6] argo: correct logline in ring_unmap()
Date: Thu,  4 Jun 2026 14:49:22 -0700
Message-ID: <20260604214926.1735194-3-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260604214926.1735194-1-dmukhin@ford.com>
References: <20260604214926.1735194-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040214
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|SJ0PR16MB4604:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cbd5e204-b8cf-49ad-fff6-08dec2832b60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	R8u4RPuqBz8oUtGCt7jVUeC/xc9FVSqbczGa0/dL60r1VpvYB5jwDDW7bvYwX7lpt52JSolIMOX9lVw7Jqzxi3KRevi2zDFwNo5D1l5ZcYZWBwwVCogPpl1+x2RmTY8wA6safGUtvFfJ/BzYkPwe02WrRhKprLSgsZbVrXq7mbbC6SJ/nREf2dNmK636/vcdkylHbJbq0xkihZII/cDcB259rfcsqG/KA609ZEMNl0gAdlkNJvwILBxrdHCHXcr0LP/OSUWXcEn7Y8U9xhJbDIU4Nua3cTKhRM1hRL/Vko6fZDuyWs7nORnMc8yKxuQLUEwbaQYL6yvfbiojwectP/MdLhOd9LZJ4JhH4AZPqzuto3Y/9WR1boIPGgJoEEuhAITT+VL+/nPMzuMGuu/gTG+dLcgO3blIihFsExJOCPjX5olsbeYlOKidNRiJtZDE+RatJ7wFINeH9QLnh9VgXlnTwykQ1iRvRAct4x7xPoprA1fiyFEzentATxD9EAkxwT7gAsYzryzlLm8Q18X4yw/IZSNvGsepzOACDRYyBxsPcxo7+XxAul0M/9nGvQWc9afV4akAXuWzyd30eLGcx6FbahOHFXj+UbrFiRmFhMPir2v1Ol5TaGCnhbM4vhdEiW7gMTmhAxgKF5uHcz3HEbvUC8tanS2amWB7wP12rvcgz4bM04pouA9mE9WTltIVcFsH3LiKVX2B9joMMauaYCV2Ei+5c9VqGR3TpzbQcKY=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9j867Z0SGlgAhIm+1qPU6LqYMqpkkoh4Lm0WeQSBmp0gypnLK0LUA8Mc5TbWJFKnl4UoL+H09VjFoEJwrU+fxvCuK9W2OcNxu7A1fuA2lHcPU8Cms8a7FjDsqVl00x29WI0irybaHEAtqi71peItXSZXNVGCnjjMX3W4v8GJ/D+pKlrnUWHxmt4j+Uav3ktjint8UYf7wTCo5SlcX8N4t/zRRLe91Zf/qoP1fqUAwM4ZcQXxocjYdTcUuTudKlUi6yHgv+6oQMh+5+XVZL/Fv2hL2wq9i7XubzrPb+H2oRh07jdOH6VYjkPVuVQWUhqEIf8qJNCPzkmv+u+ADJsH49xgBU7qSKu/pRbmtClbRvrJT7OQr0kZq+HsgAwZg666hbjGqBV1rIRVlLiZMXS+f8pBtYgunbBZ4x/6FSFOi2M4a45hSX+Bub09EmfXjq4o
X-Exchange-RoutingPolicyChecked:
	RyPexpdg0T2yhiO84svXYgztgdbmPR1/sfVPmavoCUQT2PvCFn+4pUMXhzC6LV4+srVHDksQJ/E+eHul93ihFzZGp6k9rKfYwqnVtTJn9CyF3v3fK1yQ+r58QnMfgWbdcjC+h1LZ/Yd9um2a9Dsra7/hT4Ji5N43aN6I0vRTWyr+n4NuCo9qMs04it0qJRajrn+vL+xRfVTe6yRTj+tAyu7flZfS+o8rN6YYmj0pP+Y+RnVfPMN6RKmr6mP3RbBUzJM/Ns9rpC1X4C6Ult8fsvRRjQUyA4CHptT0nnTvsRTDhsQbABWqdZ7b8HXWdEYFDB8qXkrApMaxyq93LaUAiQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NY7vK+u9DuYsKanbb54hMaUJt7xTPLrDj8MFermbcFiYBJnpeOzeslwfwSbKtB+02OgCwu9DveMzbXz7b8U9g8dJuYAbE36jyjCZ48TXD/Fe1gSC4h+quTrD1fjyi/RRmcw0l00FfxdHY1POqmxi68A/OGq4yFQ3kMImRJ1/w6PvRJlFgr+Cuj22aHbtr3IWgkBjYb0bpr46PkokoS5+1GZf8tDMXgy5VrBE2P95ZG1BP8bQZ2pumWDplcRhtE5MLFck7H9PXVjLh1EMXng7gdgLjlDx1KgONVU5YAqb2LvyWwm6kIXhUel4uzQg7Y/pYtE+JotwGHt6iHvJkLJx/r1BQj59UcHjk8fAUZfddwTmCmq0jb7be3ZuvH2Jy5EEt8LhAuZWJPOmZKTu3BXm4Ldfz1cnOrr+BSit1tBWq8bJ/0n9OJKD+5s8lpMk3VWdjZXGLuesXKZ46yH/gcgjXgVHdIkBHRv7urCUmgYc2i/C79bmerTMFlrpwJBAd22vbgxbbrOBE0xQQOSbE95UA1lwiIbeTnmGCpxHU8dW0ZN3FzwUQ/dbxW9w3k4kQChXonbNZwhhvxmfBF65OFdKErYgrnv2KFsXOO8UGCZ33W13F6bglxYC4E9XYBdLt9Cl
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 21:49:35.6442
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbd5e204-b8cf-49ad-fff6-08dec2832b60
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR16MB4604
X-Proofpoint-GUID: Ix1IHtc02dYy33RcNFNOZUfei8dlWaht
X-Authority-Analysis: v=2.4 cv=ffKdDUQF c=1 sm=1 tr=0 ts=6a21f2f8 cx=c_pps
 a=RBuBYZrARuxyk0NLsDi/4w==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=NvsXeTrgx-CJMFV-xl94:22 a=cbNQJ9GKAAAA:8
 a=DBfv99YmAAAA:8 a=VwQbUJbxAAAA:8 a=zd2uoN0lAAAA:8 a=WngjfBvNni4G5VxG9swA:9
 a=G69WFyCBNqGPyalROSdv:22
X-Proofpoint-ORIG-GUID: Ix1IHtc02dYy33RcNFNOZUfei8dlWaht
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDIxNCBTYWx0ZWRfX6YG6O29eAbB1
 cyblq2Wsy/jTsNzBQGoDrbz0EPULzZvzQyk9LMeTvbMIvw9pltLo2k17uCjrdsU0QxxwpmdLMJk
 MlFIJ3MLOTrzCQoHSBQn2wwkhwYSWP6reUO5hfGt4lPa9U/J0G4pFONYJSmK3LIzdytgDcaWDyO
 Q0gR6AELqK/ZUxhfLUmuhJku9ACeofxQLMC19rKYL2YXGQogH/5aYNdywGVYOOGDXAwsHaaEKOB
 Qnqbzp9+PLZ+vgfgeGU+AHiZMSEoYoeeIm8dgz/yYJAN7Ql0Z4kYwJzLajUJLojT/97GZwCyMjN
 y8cTn5Y9JH+7aI7HfYRhsHE1NxC55+EPWbwazdpqVhnkcGubitLzxvRZh6fg4jjWG3QE6zzfIpA
 FkYEfzhZB4SaBqmD1ci697SP2SKILbatEpa0PCtVcj/99z/pfOoHmTCbgGgtTrwTLa+GCGgpgvM
 2LJoBn3hxJ6PHUwnUIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040214
X-purgate-ID: tlsNG-33051d/1780609787-41D91938-26808B0A/0/0
X-purgate-type: clean
X-purgate-size: 1207
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
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,m:mykola_kvach@epam.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FROM_NO_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 129F6643B0F

From: Denis Mukhin <dmukhin@ford.com> 

Drop XENLOG_ERR from the logline since argo_dprintk() already injects
the proper log level indicator.

Also, drop "argo: " prefix, since it is also injected by argo_dprintk()

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Reviewed-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
Changes since v5:
- added Jason's R-b

Changes since v4:
- n/a
---
 xen/common/argo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/argo.c b/xen/common/argo.c
index 98a3db7fd070..5da14c929e14 100644
--- a/xen/common/argo.c
+++ b/xen/common/argo.c
@@ -474,7 +474,7 @@ ring_unmap(const struct domain *d, struct argo_ring_info *ring_info)
             continue;
 
         ASSERT(!mfn_eq(ring_info->mfns[i], INVALID_MFN));
-        argo_dprintk(XENLOG_ERR "argo: unmapping page %"PRI_mfn" from %p\n",
+        argo_dprintk("unmapping page %"PRI_mfn" from %p\n",
                      mfn_x(ring_info->mfns[i]), ring_info->mfn_mapping[i]);
 
         unmap_domain_page_global(ring_info->mfn_mapping[i]);
-- 
2.54.0


