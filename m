Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKpmJLkXFmrOhQcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 23:59:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EB85DD06E
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 23:59:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320180.1587559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRznS-0004ht-D3; Tue, 26 May 2026 21:58:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320180.1587559; Tue, 26 May 2026 21:58:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRznS-0004fa-9S; Tue, 26 May 2026 21:58:46 +0000
Received: by outflank-mailman (input) for mailman id 1320180;
 Tue, 26 May 2026 21:58:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wRznQ-0004SK-Ix
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 21:58:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRznP-00CFSu-V5
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 23:58:43 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a16173d-bab6-0a2a0a5309dd-0a2a4505a130-32
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 23:58:43 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a161792-aaa8-0a2a45050019-94a39217900a-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 23:58:43 +0200
Received: from pps.filterd (m0367123.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64QJPBjr3088721
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 21:58:41 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com
 (mail-westus3azon11011020.outbound.protection.outlook.com [40.107.208.20])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4edhnn92cx-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 21:58:41 +0000 (GMT)
Received: from CY5PR13CA0034.namprd13.prod.outlook.com (2603:10b6:930:11::19)
 by IA6PR16MB6886.namprd16.prod.outlook.com (2603:10b6:208:5dd::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.18; Tue, 26 May
 2026 21:58:37 +0000
Received: from CH1PEPF0000AD7B.namprd04.prod.outlook.com
 (2603:10b6:930:11:cafe::83) by CY5PR13CA0034.outlook.office365.com
 (2603:10b6:930:11::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.11 via Frontend Transport; Tue, 26
 May 2026 21:58:36 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 CH1PEPF0000AD7B.mail.protection.outlook.com (10.167.244.58) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Tue, 26 May 2026 21:58:35 +0000
Received: from pps.filterd (m0426316.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64QJWqRf2291769
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 17:58:35 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4ebu9cu9g8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 17:58:35 -0400 (EDT)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id RznDwvgzUtgXKRznEwopbU; Tue, 26 May 2026 21:58:34 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=7nX
	DslCE3jJEMHu4E9rTO0AaUwmzTR7wlDimYZE7YyU=; b=n7hyCutXUVyTAyCeUqv
	hpBC5lLdhDO18+lDjE4hCdTj8aFVrKmNyMiG5vSo3+XEGmdKPFqQf9fwFGPDif/I
	sv3oQ5SEJ3t/TcNDDEE5+zKbGiVX0Z0B8DwUehxregM5qrZaIYyAxjTtsLSc/D7b
	upwae1+PDMMhxaOgrctW8nxA2+QgphY+ppuQhk/EqVQyGZQD8scQud/UL8B/3Bjr
	pwHtNN+ABPP1Bq4/2U1/dwCJ1k9b+aSxHzoKVGmWgekmZ1EHx2DauSig6xgqZ1n3
	3vMfTHc2eOdLcMGIMa9HShy5yGuLvx5ZTaIVHKqhx6xWGt7nqEKhyM3War5lH7NM
	kvw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uYxTsgxxCL6PL9pHVhES8qESftXpmwj/xsmVyBGZdl5a8H+9QWyIhRuSOZi/T/70YIvaouMATyQSFiRMSOOx2lIGm7iUNbEQOvHXcM4ry1zvqIagGlS+31L1Y0f9JowdiJGiqgs26ruOz+r2OGzsbMeQOGsuLvdKY8Vza6S4duiSEy75Z2ayaYcdo5DBwouPwuA+qYzKLRCzDgwQEjs0Ke7o1j2RMfOAhEP3zdCLUE3j0Kbt1+kip/+PY43pnXBDfGws4lVwRJ2JChSSY4nbsUy6ZooUzg7xhhqxDjKy2r4dP3Hn3vhfNCNf4d/YJAks//WcXfecohYl8rhBqr7Jtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7nXDslCE3jJEMHu4E9rTO0AaUwmzTR7wlDimYZE7YyU=;
 b=Aolyief5usfw8fiGQ5k2BPbuhDgEOYdbVrM+thdxcgql83NhGh2rEE4J9sDwn8bmH0H7UhTlr5v+YgVwY6yMoyljtGMeToZ/sculpsS6ehmt94WXL/iBlEldHEhNG+OY4z8bSZEmP5mMTreJg0MHSpKX1p7t1bHlK8kSazb7AoETVnReMH8hoLB7zLQR0MvNA+CCUFRVQexaMRVemnK8jUavlTktwmp/+6zmQD8cIRkcE6ddTOJVN4o0HWZYQwsSVIm5a08736vslIZ1G3G3OaOTJtUzq+bi+96lgcvpmzEU993rvpY+s5LZHfAsaj1/sVpoCJyBXSJQnPPKqSa6Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7nXDslCE3jJEMHu4E9rTO0AaUwmzTR7wlDimYZE7YyU=;
 b=KKEQKwLXSs06zE0R7K7rbWumr/05OmQx+/VYjqBykIgFFn2w5nNAsXYJcshM2i2L3+7QENzGRcdfZ0PzOg8XbufVJ6bem1+4CYD4XirA0HCajxs7eUlIsQnhY/z13xCYuji08xFd95d1trQmMT26eVzk9bx7KYUIl9cgBVUw79k=
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
	ppserprodsaar; bh=7nXDslCE3jJEMHu4E9rTO0AaUwmzTR7wlDimYZE7YyU=; b=
	pIYv43yDoVQMVO15VR+Xl4tygo4jCWIMbLAMUF0fvPm4Yby1MmYtLt0rXqAf32Bm
	87NHhdjP+PWOAr+cBkF3wZd0m6UVJODB+bVEeTjJ7OJBFi70xIx0Hc9LLNdgi8ln
	1fqJ4DexMYsQrNo17LMNrIOjWM2iz2sxmkPMQ2URLUIcEFiVochTocFrCpWI5kAh
	E2hzxiyofIHub3FsccdlTkidYxYBx5cKWcmLVleEg4d65tVOFOtk+9qc5N2qMtwP
	BZlQF/dANTp8kPaTxv+3esMJacSrX95LdK6MIndQxQXtI9zQNgjzQFWzugVimk4+
	37znu/nT2H8WqOk9wIcd4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=7nXDslC
	E3jJEMHu4E9rTO0AaUwmzTR7wlDimYZE7YyU=; b=P5uH6Cvy8sxbSELmo2V/2+B
	npxyzusS0bjwo0MNti6WPHvmWAFpDF8fvqHZlbTuxXD0yPUxW9ROJ2Gc/yEsONor
	/4FHHWc/KwAR8Nd2GGBmwbKfHEautSIwX2JK3yYU1gJ3XSqprWcrU2WdOk4rx4AZ
	vEngMEZC4TTi4QunSrgafQfTEX5xf3V9fnRNk5Fl325yo/oZ5xkCLdikHt8LznBM
	zzQXLBemU9yq2Ei83YIVfNf0RGH9ncCMJnKJtW5KwD2GIKG0odosxwxVO+DWlzsz
	5Vz72PvT6Q1dRAAW7nsuSwdVQM/Qie9gsF0LoJAjJyxK46AQerQ0Zqvj36Qhzsg=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: RznDwvgzUtgXKRznEwopbU
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, christopher.w.clark@gmail.com,
        dpsmith@apertussolutions.com, dmukhin@ford.com,
        Mykola Kvach <mykola_kvach@epam.com>
Subject: [PATCH v3 2/6] argo: correct logline in ring_unmap()
Date: Tue, 26 May 2026 14:58:19 -0700
Message-ID: <20260526215823.1452619-3-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526215823.1452619-1-dmukhin@ford.com>
References: <20260526215823.1452619-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260194
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7B:EE_|IA6PR16MB6886:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5ed08dde-9011-40b2-36c6-08debb71efbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	klZOxSkp1gJD9oDkoBiMxIw3dRk6+mCI6zN2QBXhyIxJTPmbn3Szy9y9oixtL8xqtfa52zFCjDH7uaruKv8/riEyxP0NzY+2rlD/4X9oQ47c3wqYxLzRmV8omZmI7exwAyjKkRbSFAdjfli6xIPkD26qOiS/REwBKsfY1Wa8gBz5g7yxA3UP0vNoQ1bDQ4FgT5sZ8zVsvLG2rY+flHSJYZuj4F5FNv4COx90g4hrjaLZsW8WFTxgTArIsEDSqKHKjr/gXcGD0N5HKn1lrhl/0dGuByOOouTYe5+hHG91f7Mu4IbIBqWie1pr8OC9VJ0gTB29iBOvFGEdaA4XH3I/RGMWGM01mZg4iMQzR7MTOYX3DTFpnLp6qMiKeS8mExbDyakkC61MyMmTXDYIuvHxo7zTKJjuYWHFnprnxjyZtbdt3+JsKnvl1/Kx4n5v/NURR+OKysVWBeOUDGYgoEa9a65llaGneOk4qeckBpRsv38ecs/v3NF5YZP4ldGBFp3KoZCkLD8jegz23U0yNjNiqNM+2rhExq3CxpYtCphrA5xih9MXHjmiHRh2ZwJblHn2MVm7HP0EkAPXXO7IYiMITcxGZND8U6fwANwpZ8JVbzZqRZ0Bazd2Stf3o7Ovi57Q2bBrRzc1Y0MCNNo140YXMGwJvBjA/Z3b79iIiHt51V7maM10MFVGdZnyZnT5zNxiwvg0FskIK6LkpeDYgRykILdJrY9AeXjiIV46YZXz6F8=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9UTYCQK81cGchGZYe+DJWoxhXkNjjg2+BytJkI9Y0eSgnA5vx/9UTDvXgb1d5hUfXlSuhDeT599CTvHpHFhWptth+LN6qzVP0taUeHk+DIFN5voG/dG7o+aYMLeOCqmNZMdgG62QAvGF0+esenp9MPG2uBSnIhes+UtfT3VM+j5pMGWOgewxUwONJhtpxmu+v9rKxeHWb9zwrM0SIKuUvP8Be7jEl6uusW5WmI0w9fy/tN/4ojuvatlFm6q3LelSE2bLirhb0/x/TTwBNRmbFtyRYctVSmoyAX77IqyBHuvthyXo2JZCPi9hJU85rcQ+39/1wmtxird+PeKb+Ha1CxlEPRq/wMO9QT6UIW6qjPuU+Af9wlELxCUfsXMo00MADEtgY/TME9Egx2JWa5Lctsf1ojaYR/1dkzqW9AwcpyCpkmm3VVmlpAdEovhqABmT
X-Exchange-RoutingPolicyChecked:
	QEL/XlJ2LXF1mbAPyADwMePnOucmPl2wIGsh6wCU4EK9XoCxwVTrTg4xxmjNW0DFdJPP+CVWeEIkfawDcUGrJl/UTpCu5tNN47s1zrdus2Ghize5AKbMLU3FxxnJ2rYuM43pzCcO1RJWKA0Fw3XU51/a+bBZB/f/Sfn+BsO/4gIgBzkpY+rENgkskQTMjTd/OADTbW0soMim8JAYcf+i6YSKDG9q1ncFiLUOU1wLWTpZJSvA29PGEdmZUe6wH5d+0JkupGMJtJOGUiV6HzwsR4Xu34IpCN4daTdbiGQtYZ064qqdqohq/P50ulbbnaP2y1jSm0zvZvFUB0ZSfe+QOg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TP2QCFz4HoJ6X9DZPYH9SivX/Mhb8sISQ8cgAmY6CPHZwlTT8BPWoB1ERQ/XZr+mXv1YPQ86UnBMBe+qfkTpz7g0wOF17QvsstkTvjVspeSq3hTBWDnTPkB3nu6RVBiZbzwaS4ePQVRb0McO14DyAR/g1Y6z5/rFIu8/6PgQbNrrafTQTvJ0DfZHx9OyUMx+zvyVkkZnvAYC6JaV/A58acOao7vnLKQfEQ5xy5GdcXXqretyfbPwmpU8e7jcigTPLuPQqhfAxcbQOzobSpmc65xcvXxtJbC//nVNlfe8IekiOTMxMh/1oyGKGRmFmn543fCOizE0JixXDzjvPertngK7n8SiTHl9j/UQv9Xx+HTfMTNHvNImrb88XJjsPihhwsAQPg9LE5VQjnph++XeB0CJ/yIe7bhPJQo8ihAEwXv9wTsp3Q+TAMZsIhuJQNorw9Awa+WhVi2rNv2NTFyyBl21NAv3T49iiP4UlO2YwtDzCKP0Q5uyPF7Z/hyBRHUhkUCHgMmux+V8JbRZJZkxzjYMBtQU/G4UNfnqR1lQEV0OegrymX/ShQ7MWTLXOpDI5jmbngXW8BMUbJnvGJWOSkbdP0B1Bsy6kNxrzAXZk5MpcFS0CX9CzK8tHnpgokHk0WH4OBaTEnJEEvvzzPUydw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 21:58:35.9338
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ed08dde-9011-40b2-36c6-08debb71efbf
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR16MB6886
X-Proofpoint-GUID: YVGyLSUUAorXE8ZgWgbr83WEJ-E1fpef
X-Authority-Analysis: v=2.4 cv=UqNT8ewB c=1 sm=1 tr=0 ts=6a161791 cx=c_pps
 a=KTjCFeyF3Vp3atYHcTGfzw==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=NGcC8JguVDcA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=N9_n2FxmZfwfyRXvS9-E:22 a=cbNQJ9GKAAAA:8
 a=DBfv99YmAAAA:8 a=WngjfBvNni4G5VxG9swA:9 a=P0bj-C3X3jJDpopQwM1U:22
X-Proofpoint-ORIG-GUID: YVGyLSUUAorXE8ZgWgbr83WEJ-E1fpef
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE5NSBTYWx0ZWRfXzjmneTkk0Ml+
 0UauLi5VjUHPI39TspeFge95zmr6RpF6PO5yMyLhYm3hFwxbZWSDJ64eL4FLE2NCWC0c+Q9uYpZ
 LGqYxmdAFZahj0FONZRa+vOMLeYZGb6+IR5H1J1OD+LffwMGt8HKxHFmBRw6bUeToCjUkuzNtl1
 mZlSJEUNoZnok93offIMtL8/fUyuzLViK3MJfFUYeg+2VgtqbUaaY47bLvIddX41AYTNWtu+itl
 E5euQPYFYAZPaL1OGCW7BeNdXpOCxUEnVMXSkLYuTXGjomMfJzalDR9eLQjN4kIS8PcjSqrGAL7
 wszVVNf6IwmxP9ELCLofdAvaBsbzjhKyuA9YqIhxE3iCKYfR1MHeKUv4ctj2gkE/UWGXmZDThVp
 V8effQsSMmci65kbw7YYhqgeuKrjlBePJlFkOPzKKcFYoBsSZuPhKIN6RgYMWJvUC5XF6Hg6NwM
 vP3rzbsO3rkS0eYqs5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260195
X-purgate-ID: tlsNG-c201ff/1779832723-E0461443-6983C944/0/0
X-purgate-type: clean
X-purgate-size: 1055
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,suse.com,xen.org,amd.com,kernel.org,gmail.com,apertussolutions.com,ford.com,epam.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:christopher.w.clark@gmail.com,m:dpsmith@apertussolutions.com,m:dmukhin@ford.com,m:mykola_kvach@epam.com,m:christopherwclark@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[16];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	NEURAL_HAM(-0.00)[-0.977];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[saarlouis.ford.com:dkim,azureford.onmicrosoft.com:dkim,ford.com:email,ford.com:mid,ford.com:dkim,epam.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo]
X-Rspamd-Queue-Id: 20EB85DD06E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Denis Mukhin <dmukhin@ford.com> 

Drop XENLOG_ERR from the logline since argo_dprintk() already injects
the proper log level indicator.

Also, drop "argo: " prefix, since it is also injected by argo_dprintk()

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Reviewed-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes since v2:
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


