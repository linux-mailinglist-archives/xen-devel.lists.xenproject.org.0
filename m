Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9/jRLrkXFmr8hQcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 23:59:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF685DD071
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 23:59:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320189.1587595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRznf-0005tT-NG; Tue, 26 May 2026 21:58:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320189.1587595; Tue, 26 May 2026 21:58:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRznf-0005r4-Il; Tue, 26 May 2026 21:58:59 +0000
Received: by outflank-mailman (input) for mailman id 1320189;
 Tue, 26 May 2026 21:58:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wRznd-0005ms-9u
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 21:58:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRznc-00CFZ2-Lm
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 23:58:56 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a161795-2eae-0a2a0a5409dd-0a2a45048942-14
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 23:58:56 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a16179f-1dec-0a2a45040019-94a38ff1c466-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 23:58:56 +0200
Received: from pps.filterd (m0367128.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64QLjkCb426632
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 21:58:54 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11013054.outbound.protection.outlook.com
 [40.93.196.54])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4edkqj82bb-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 21:58:54 +0000 (GMT)
Received: from DS7PR03CA0025.namprd03.prod.outlook.com (2603:10b6:5:3b8::30)
 by SA5PPF7F57C1A6D.namprd16.prod.outlook.com (2603:10b6:80f:fc04::912) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 21:58:47 +0000
Received: from DS3PEPF0000C37B.namprd04.prod.outlook.com
 (2603:10b6:5:3b8:cafe::aa) by DS7PR03CA0025.outlook.office365.com
 (2603:10b6:5:3b8::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.11 via Frontend Transport; Tue, 26
 May 2026 21:58:46 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 DS3PEPF0000C37B.mail.protection.outlook.com (10.167.23.5) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Tue, 26 May 2026 21:58:46 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64QL1loJ1935847
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 17:58:45 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4ebtp4kdgq-2
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 17:58:45 -0400 (EDT)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id RznPwG1B9evQgRznPwLubL; Tue, 26 May 2026 21:58:44 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=3VF
	Yd1gSHcI0Qg082/4gZnpm40+XBqe+AFW8r+HaymE=; b=J4yWBgVGT6jn0ExheA4
	qhmfou99PJEjYxbdWsBaz9bTr0Yy8ViH98XufhNJ3g5QIDHeC/+4IEzea1f8Fptp
	oCUi0qTnhUnRlvpLtid8VaMRA7KsQtyQecKwDD7Hu95dxVX5Qcf7ljbVBYGI1S/C
	tpSkXHU+h9izENmUz4bY0SWnL3kQHqYnmucQriqurN7c2kPZN7mfinasQMGQ1TxQ
	d0BHTwWBSi9J+e9lTGToZCa7b2naWdAVuZXK8FcaWUNnxrapQNZyEWIv3dQn6BhP
	YXKwbDNZDER+vTis6laZ7c7Li6yh8OWm31UIEv/bYoaz1C9H2G3sFIEb5q/cXAYx
	BSA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SARfran2oeSoRcNBUjDOOwjUqtn93fBhy9Jx178QPE5X5m6zyLezplfpLW2a6OssRSEpJ9Dyi0FVQSFFJsfvR6V4uzTNZyurxwZ+zfcJrtwiB5Ioe896A1GGt/yJP0DWQrY7G/4+TAGuTFquNv3OBb/Gou0eoO6PdOZfI3P6wcBUiRyXLSf62HVTWRebKTMS9mBLR8Rtr09cmyjre8bMCbp39ly6FhA/SZ7C1Ftlp0mszOQcp56+GPWENV1PDIn6cMjFX1f8+n0FZ5VqK2oUuXqBmvpJqmcWEiFRIcQI9UKj+cMxatihlU55MvhKJqzBWzsLpaOzDaflEF2g5ZgSWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3VFYd1gSHcI0Qg082/4gZnpm40+XBqe+AFW8r+HaymE=;
 b=n/bxSilYqVc5c5qGHcwG9brkCqniNr+Z0GkevUsdiZ0PA/Kh6eCE32ciOStDxc/RK7DbKTLmwBQW6//eepx0mWyy4BDFgEvsgn1cNif/z21WWzHzicoMP0K/gH4rAAa+7QEB+QQ3y81puyPzLlt2oEaC63yTkqQp8srhU7b8PgZ8qg/52UXG0WyiEpz/J+SJEnDBWDMKXw6L1ZBBVo75axdK+VTTgadVQuKD1a8jqx3XghazT1R9rVRM/wzM/chN+MfkgLP3phCLZkxFFHJHeOWx6Qp9zLhSd9gv4JwM5veUNFSFPGtAF/Cil6R71+EQdlW6JYIDUlgiAUC3mlETag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3VFYd1gSHcI0Qg082/4gZnpm40+XBqe+AFW8r+HaymE=;
 b=g33Bn0ZL3b2tUDAkkNvet+S5x2fc0IUGCytniF0j580Q3CHnupm6V1nwRQXszHkwW0lHGqSyelk4NAUPW5cipfRE3PUYD99zK+Cgn2SAgQYxfjAUabAigAFngnJfssSFZoVrz1AqbiJFbT3aET3D9qCjirQRt5TmLwQBkyoOEk8=
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
	ppserprodsaar; bh=3VFYd1gSHcI0Qg082/4gZnpm40+XBqe+AFW8r+HaymE=; b=
	WNgzYpjkFKna7n19wPReKEOcfTDw0KIlJDVN02Yq1UuF97rGMToLzKdM5KsQUaxy
	DmK9w4AuGFFfIEpcOKZI9W6y/APapSsMqLU+/h9mAdFIwM71i2WSU/z5DpBLUn6c
	uTy7a43/HS2cb38I1uJYyMB7A9khSVEZtHi3GzZ0lqVnYW3PDHX23lUw1vvwgClh
	u4bXxR6rFlzXNcc8QSu8/Dk5BlifK6DX8j9qV0XI5v4T8B8fy+1iuKyiKjDk24ke
	9QV4DVlS/YpUbyA9bS6gINWNepub/iqVpR23G1Sxm19Q9qXSuLCRNrkmqV+0lRl2
	/Zdkj8tdJicuQgPHCJ5xrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=3VFYd1g
	SHcI0Qg082/4gZnpm40+XBqe+AFW8r+HaymE=; b=Ju86YRhrWgEIMeJ/CZnvgCa
	YJoxRiIXGxPaBaOtoIIK7Vk04xPGMJbhfvp7KC7gJNb8TY7Q1b/ckL3zhP7ZizKP
	Elnt8yKRrW+fq5Td6fBoqldryyk3WQRE1G4w74bUmpBAPd7DQ2YJpb81fOcH0AcR
	QKdGsqTyYPlUYCiaZFuGGThf+bgn4Z4gHzPSu9beUDlVKYHiM4cj7x1Jel3Xy7hM
	B295HVh1LDCuZ0HAsKBg1ujR6PyS8Jc+F+SXu/O7X1UKzIk3uQZPL3C+eZH3gO8w
	k0WMLq7eWBII8ODNFmBDrqq8jpRGZsXXxrv6zggpDkGwuCZ4OJ0JpaInmamg4bQ=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: RznPwG1B9evQgRznPwLubL
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, christopher.w.clark@gmail.com,
        dpsmith@apertussolutions.com, dmukhin@ford.com
Subject: [PATCH v3 6/6] automation: enable Argo debugging in CI
Date: Tue, 26 May 2026 14:58:23 -0700
Message-ID: <20260526215823.1452619-7-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526215823.1452619-1-dmukhin@ford.com>
References: <20260526215823.1452619-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260194
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37B:EE_|SA5PPF7F57C1A6D:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b3fac53c-903c-4783-f328-08debb71f5df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099006|13003099007|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	x/or4bFoXY64afCbiVHN+on8pbnITDBlurYoSVF5iYNS7r2pzfgaEktbETai//Vbdw5MmiA+w2U3zCafHHlk+1LSvJltt3X5ne2ZVTBxEkWCwhnjOl07dKeLdkE1qN6LkHX3yW/Y7JwpjsgiyF1+V8dFehwJnawavrs1IL1xg8PXSWcZWo8WKiKbP+cwkZB0wPAORJmOBYrB11tSznbgywiGxpBojWqv/Tg6nBvSFEISDiLwXWjUEs1GR/E0g53PkAZXt0RSjyi/zcpkVQ4R/RlK5Npulcn2UQJdTm+kURo8I9zvxxYW/hcXlQNzXslBd7pC9y7x94OkXEAs5jhinFi1mc4W/dw3X8sXveZcdkf9LpD09prcRR9oLZu5EOh+vKslvrHATYvXpbsNoiemiEp0hAYqCbfGNvbTajMlosCBJLOoTq/Pbaajao90SJ7YHfocGyCwkpAIHUjcX8N61Ljlsfq7QXfMhJw2OT9qagDR7I1Dwi2lRvafTPnnuUUICPdI4P5jZf0IlbDJ3VbEHwjkZxInU+ljVv9DECO6LlPMMTL0WSIqB7Xxvf8YPbYe8d8rtZZtC+FsqRonRSdICF+uvXXmO0s2wdnh+HGnyILgCVFRs16Dfs8WQvB+fxN5kNEgt3L5dtpFQmxDh4taZncF69c5G9NeDAir+PwSPRN/BBncWrxhJWdIFOCDdNQE8tcm/ddlucSy6l1gzc0M8usB6IVUz2SpzOPxfD4DFLCd0k/tGoFRODu8CGy85Cz7
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099006)(13003099007)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	n1fnI+IkdpOi+UfswCWo8R6FMqKLdH6YOEMeGWeLqV0jzo3iOgwgmS8YN0N3p+baEtrMfT1QReYxkJvFvxfWYmj68MbIoAPyPPCbl3EpsgmG+3Yb9OqQhAmurT3JV0R8XyrTRHYBqpxRNTpv7VyVh/F6py6VEFp0AfCSOLBDAVTIFb5/JwhWTt6XVr5xPM8wyCaFt+o+5x7bIGoePQNcIYaxrfHhr/eNFlpbDfaPJyYWZi5NvBZ2RdljS6cjuQ+5Vb6Rv0FvOXam0aht8HWe9H6UgUb5Qe8cNUhTn+2eaMscinNvecyDP5uzg9iKGdjbLyarpvxh7+zOv7LJQequTqPsRYzqa/lqAI2TQshVpnYvuDgCU+G8uRoaI05WsYFLU3Cf4Kh4cIXBpfFa7jNUerISkmES8WN/V43GhcT0vXjeN9Og4YgmNpyKd1OtXttw
X-Exchange-RoutingPolicyChecked:
	Iglc0NTTgNwoEgxleStZK9JtsHKgBKKcfQFqwdEs53Pxwi18bZff1LJMyRznmp6jzMGbP+3YEONJpH7/JGPP7V+jOn3J4QI1i4jtaYtwsZaEoZoYnBDCGbsu2RLJqj0SfjmooeFGMkuj0szdNb+rOJttCcvMNGIfCrxi7WeISXI4RMXmeJQZZ8OewUde8NvSCbeN3YKAQI4nOWaxkaD7Fi94q/y2v2e8GCUL6n8DzsCA+Dai9/41Z+ck+BsPWh62UagDe6nu3JElQvSYGk7sUf6QfptjJKbo7IWACUHspF7UDil+Ilh9qRSLlMhGnvOacb3iMho1Yz7io3JltKhHsw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	H7VZBr+feXh63adu4JBiB5rtJJzm0yKyUzs+UMR/WDR7whFSfEr8OgX8v0C7ozKRy65e9I+auRKSBZ+hKoNtPijUC5Gi/AdOPsRundDS5qGPWZWbGM4qqsZY86gSpwcN2HzQLubLk1mw+vhsZxL5WOwYSYLqLJubnh7LVjJoa9dcKVeyWWeDmG9lGTJ+jPmNaX5HIo0rwAB2YOsu8Vs4KVWiKA6yDoxI2u4oZyrGrt5CRfrfXr7h3yl37l4fIMvRgvzvjXa/z/qVAq4c5hnDLYwWRj5yL+f0oJI3EQYlODwHJG20nFwyQUEzaF4dhgvUgOanHuLwA0KTu0RzvuHAREg4SP20DA8G1d+eFaNmZrUOtu1b4Kz5QiVcHlffYb1tY69qclaNeZccVGikxsi4zsroSkHKwb+iwywB/EhCfYZdyXQiR2ZTE2rSt5KBBoJLRMI0kC1ScDmtbef25yzFSR93CbTw9SO67mNgWoLFbI9BNo9ByBRp7xQ/wghex297Vss9tGXXdWvDlFV3Q9SjbWjhWghx3eXPW/sJllH5YH+dAlyaYMwBW/cNYzQywyugk4LA6q8ClsXsz8GYrh0g5GwhqI83N+6oadQZiNNqLtAYse589fm0uF9jSro8BvdzW/hBaVemLVZypdN4t7xp9A==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 21:58:46.1863
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3fac53c-903c-4783-f328-08debb71f5df
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF7F57C1A6D
X-Authority-Analysis: v=2.4 cv=F6FnsKhN c=1 sm=1 tr=0 ts=6a16179e cx=c_pps
 a=S/uo/C2bPHUhgLefKkPNaQ==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=NGcC8JguVDcA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=WER9OelvoqQQjwJToBYG:22 a=p0WdMEafAAAA:8
 a=cbNQJ9GKAAAA:8 a=W6yYvYeWeSynHnNRtr4A:9 a=G69WFyCBNqGPyalROSdv:22
X-Proofpoint-GUID: y_fj_QkNbblw9Agn8cSZ6HIDrrQGkDkS
X-Proofpoint-ORIG-GUID: y_fj_QkNbblw9Agn8cSZ6HIDrrQGkDkS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE5NSBTYWx0ZWRfX6muROVqamFKO
 meypm+7rqmucDtF1nIPy2hH6EhaIjYyual9p3UpQ4yKbuZYh1uS7avE2QVJHLIAEP33xkxwXJey
 o0aEm8kQtSwYyltkBB2Boxr6p4QcGnHHGESptuIeDdYwIPjEboE4E6zCHYhm/r0hCe7w90BpKJA
 qqPwrralPVALclKa6tBb3PlSL7WIZkEwzE3fkzdJmb/qLN+qpL8JQ2DZRHygBmS5+ouWAb+xVCc
 vCEhWt2zwbfadT2ENseBAh3TJJgtD/j5Ypnpkv40ZLCo9Xu/FJ6SHwfTaTtAISK5/tjxMsLDOr1
 AiWXU0TfuvdO4bRFBsADsLAJwH6YJowZhG6SjYLeNt251xnMFNwMiyjQXzDU02w4rX1X2ACpsvP
 ykfm+92KrERsLe0ruiPO3fZiYnATi4iEeYMnBZy1+i7rOrrdacUl/9f2IQ9P7czNP+avmubA1Vc
 NUvyUQZ16k1biNGEPag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260195
X-purgate-ID: tlsNG-ebf023/1779832736-28B733FF-72C3A128/0/0
X-purgate-type: clean
X-purgate-size: 830
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,suse.com,xen.org,amd.com,kernel.org,gmail.com,apertussolutions.com,ford.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:christopher.w.clark@gmail.com,m:dpsmith@apertussolutions.com,m:dmukhin@ford.com,m:christopherwclark@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FROM_NO_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[azureford.onmicrosoft.com:dkim,ford.com:email,ford.com:mid,ford.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo,saarlouis.ford.com:dkim,gitlab.com:url]
X-Rspamd-Queue-Id: 2BF685DD071
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Denis Mukhin <dmukhin@ford.com> 

Enable extra Argo traces in CI to help analyze any potential Argo issues.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v2:
- new patch
- example verbose log: https://gitlab.com/xen-project/people/dmukhin/xen/-/jobs/14552079442
---
 automation/gitlab-ci/build.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 7f5b5938e851..5f9192e53d63 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -319,6 +319,7 @@ alpine-3.18-gcc-debug:
       CONFIG_EXPERT=y
       CONFIG_UNSUPPORTED=y
       CONFIG_ARGO=y
+      CONFIG_ARGO_DEBUG=y
       CONFIG_UBSAN=y
       CONFIG_UBSAN_FATAL=y
       CONFIG_MICROCODE_SCAN_DEFAULT=y
-- 
2.54.0


