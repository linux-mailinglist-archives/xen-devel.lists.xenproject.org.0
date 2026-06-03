Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id p9AKM5CDIGpE4gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 21:42:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D6963AF12
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 21:42:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ford.com header.s=ppford header.b=p7V8dRoc;
	dkim=pass header.d=azureford.onmicrosoft.com header.s=selector2-azureford-onmicrosoft-com header.b="C0/7wvD+";
	dkim=pass header.d=saarlouis.ford.com header.s=ppserprodsaar header.b=YWGK5M1M;
	dkim=pass header.d=ford.com header.s=ppfserpocford header.b=qZtaKlRK;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=ford.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1327106.1592344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUrTR-0001Z7-4G; Wed, 03 Jun 2026 19:41:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327106.1592344; Wed, 03 Jun 2026 19:41:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUrTQ-0001X7-Vd; Wed, 03 Jun 2026 19:41:56 +0000
Received: by outflank-mailman (input) for mailman id 1327106;
 Wed, 03 Jun 2026 19:41:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wUrTP-0001Ud-TR
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 19:41:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUrTP-00D1nw-9S
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 21:41:55 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a208378-e002-0a2a0a5209dd-0a2a450aad20-16
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 21:41:55 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a208381-56b3-0a2a450a0019-94a38ff1ac78-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 21:41:55 +0200
Received: from pps.filterd (m0384717.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 653IeCwK1827087
 for <xen-devel@lists.xenproject.org>; Wed, 3 Jun 2026 19:41:53 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com
 (mail-eastusazon11012032.outbound.protection.outlook.com [52.101.53.32])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4ejsrfry0a-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 19:41:53 +0000 (GMT)
Received: from BN0PR08CA0011.namprd08.prod.outlook.com (2603:10b6:408:142::33)
 by SA0PR16MB3679.namprd16.prod.outlook.com (2603:10b6:806:8c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Wed, 3 Jun 2026
 19:41:49 +0000
Received: from BN1PEPF00004681.namprd03.prod.outlook.com
 (2603:10b6:408:142:cafe::94) by BN0PR08CA0011.outlook.office365.com
 (2603:10b6:408:142::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 19:41:49 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 BN1PEPF00004681.mail.protection.outlook.com (10.167.243.87) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Wed, 3 Jun 2026 19:41:48 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 653ITCLP3759945
 for <xen-devel@lists.xenproject.org>; Wed, 3 Jun 2026 15:41:47 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4egeypqdm4-2
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:41:47 -0400 (EDT)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id UrTFwW6NN8Hc9UrTGwpV8O; Wed, 03 Jun 2026 19:41:47 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=VAw
	TPK3851+ipE1vB+B7ZFUXoesngUJZjSVt4SHBm4U=; b=p7V8dRoc2V3n51+EXK9
	dC+0Lzbk+zsCdKiSlF4ECF8q9n0Q/10Gnlg0/bcr82Q7VvvU97b0WnvCZFt+P2eg
	vE6TPRpCmQvw0Sj4pE3PUtDKDhMxpqh3lcFsyXPeQI4MWCulolOf0CUrlfQ4Y2Mj
	8wkF6fdFGBAB7F5wphOpyeB5bseOjXpnPCcO7HeX/xKTnmxagujUEbkSDwiTzRu/
	31S/OpSwdJ2zDgyc4qrJrlN1pCB8cbPIIf/xbiU0L1lkoo+ErEvGVGy86ulsbuh3
	y8pY1+F1DGhVvQIwMM34mxoA/LzRk5uCPj1dqjhxhaKCkOI7Q0z2LKeX7a17WiHt
	WjA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bDY6hFNrFZozNoiDEmYr8+pAJwSVmNER/ZSrhcqM8VCkyzZj92IZ7GkIv9n1DJFA3UHm6b0wV4if7ZoAbMX0WBwu8SG1rw3hQTGK7MFLlvTiROQeMlGyTkx0XbY/q7ZGKU83uAV3VfIpTNEs5FgUcyytfjxJuY7dWAiTKZAxYeSfVwi/hFy5QOLG2WvSaDXqYt2c4BvIH1MNudddcFlOVxCzqheH7qvLFmmzOL/3sadSsQvrygeBQ9c15a6VT7FaYnSBk1csnIhWY+HN29AtBX5/1FY3+k49wPAE5s7Vxvj7tBW4R3ItybZfbD2ALM0hKiKQV/WRFYGp6MpuO+TrdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VAwTPK3851+ipE1vB+B7ZFUXoesngUJZjSVt4SHBm4U=;
 b=camajsVQANp1dBUxVYPu7v6mF/OJ0/pbvCkvsp8RovoLvxYrOcY4JON7gPnMW1X357S2DLZq4GBVgBrgVMXheVsNfXS6dUbl/pO/NG3P4VDrgR+VbLzkFdMH0UZZqIb/bBiPiLQL1ywT5Iwqdv6df4l6vfpae2Ui4oWwWBwYpQDjWZNuV9yi5RAOBCKPYY8JDssQ/L9zd1YBegsZhboFWh/5Pqj3WJokKOwHZ03+Jjf97A1+44BuZ0hYkF/ExU6dv1tRnqbkILGj5NBJn5bm6JtFtyiTqK+1yvQqK8fKUcu9gAVglCKUsCD34dIYUknF+/crtuXC5I6FJcu9ox2LWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VAwTPK3851+ipE1vB+B7ZFUXoesngUJZjSVt4SHBm4U=;
 b=C0/7wvD+cvJ7qor65Lbrkfs8onOhf0uVCIF8F/VWlsBnGQE7abxwp+dmajtf/S5O1cNHqa5od4EuXqHnX5qDl/uAsdYg1oiW2EVaNDm9EKHMUhJfQiGMTfGfaZdF8SCdA6Ug+e21w+NaJDTniPIlQPP9HsoY/NIs/zsDrOo8R6g=
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
	ppserprodsaar; bh=VAwTPK3851+ipE1vB+B7ZFUXoesngUJZjSVt4SHBm4U=; b=
	YWGK5M1MPUsBy5xS/FplOZgZ4VKfWI/AfGpteGKYTGmoDlOhnj8fOPfnrrzHb+Lz
	9+PbEucm//0P4RlAc+e7QP9TRCQElfEf6GUOJet/D5EHGpkifRg3wResaK+1iK0P
	VmrpESZUfOOrtSyvUYlq9j3hez2AAamc5Ak4p48Y/IHfXlmGvX12LzMgw3lFIKb8
	1BAMeFkfnc9MFPk0fIHZDcJXJcGZQ6f2Aj28MwFO+GbyNbA+6Nw8gIfUDm1uMw8v
	dqlQxNDyk7fulZdpYGXXDX8rWPDrTmuixhgOr8adwhmzGvf1fAXZGjuoYZUVBG0k
	ZwDadHWrpwv7SVWvPw11sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=VAwTPK3
	851+ipE1vB+B7ZFUXoesngUJZjSVt4SHBm4U=; b=qZtaKlRKwdecB0/Kxsh2EMs
	CmTcrnj/Yl/uzfgsiju1E5BFMAOHuwI1bbCkGsvfqR1VIcnpi9TifH5uoMawcksv
	InfQoQ6pvYBNQ1E9zV6QFfX4VPGVF+zld39+AkpZM8GB97OhnXH5hazgJMtLgGOg
	HTIHixzjzkReg1r4fXZHjSrOQlXtgfX/LBv7QRma5EQ94X/XuDxo2g8QGOS5yYlx
	qqZmUk4Enf4rShGOrSaGIAlRVd7jMov5YBxMRfq44DoEjrDCT9kaiRT+GV4NH+86
	syf1poSD9ibnLB6/zp4XRcPVsZlFLL8QghNeA5V04AySPjPgKUPJGCqin34ClEQ=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: UrTFwW6NN8Hc9UrTGwpV8O
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v5 5/6] argo: introduce CONFIG_ARGO_DEBUG
Date: Wed,  3 Jun 2026 12:41:30 -0700
Message-ID: <20260603194131.1468654-6-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603194131.1468654-1-dmukhin@ford.com>
References: <20260603194131.1468654-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030191
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004681:EE_|SA0PR16MB3679:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 20212114-5a9d-45fb-11d7-08dec1a8273d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	K+cwJ9h/8GuPu5K1iG2NksYv8oMNQFDYW7AF5w94TC5nqHC+STef4MyRqfjkwMjpzZMwIsKxBZdFGXyutTxasUv0Fv5iuHYFKH1X9gzLjMJroEz+snbvhGbryP/vvN1PfjLVX/uxvpLnVguskgSC+rp0QAnrcLUNtVZoyqhIzpBSQD+JIzT3bWhH9fNKfCEsEKigqFUDRh/qJzziH1GRqZAiSTHRz1oBo0ddY1Qwhfw+pJObQGTOFijWPnNJeEzQzr/UiSPUsupvas/Id9juMDzxUJqGdZCXY8aXmrov57PcYoOoHGGYqFCfUi71zFFo+hQ79OSxK/Z54x8ReXb7qbfNzTf05W6ySP19WmwX4XBoSWTNmbl93zPbe2/YPVRwgly63ThwjX4WePN/I5XkulEdE34FJ9XrRI9+64nTAznKlSGHZ+Sk2sjSsytFJ85pN+vx7Yv0Kboxtigd/j9y1gDiOtTpmD6y4gpj6mWHLB46ApKuerhTQF/fjINxpJ5/jBFxPpOO2GKtmnV1E8y9x2ZrOVNdJcIkLgoj7xwbktKgJcTImvgRNDOffaV1Z2O3bgkq9hl0niqNFAQY76NkpI80jGB3jH0nx/QyALF1aQtbeVYm4GgSBEwswcYfRsJNoFWXBPTqaBXDFvzklYsfRm3D54ARuvy2U0bQ6noekfwYGFLRpjrUhD1Zzhg8Ck7HRexir1R+ief39F5fA13uq52PMyrHMPQYmJV3bWz+198=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Auo1wfmU+1Klmj+3qlXoCdwFUQN1QqMBVTbOs6oAM574PYWlIXvB7btC/omkzIzisURILajDj5RINDFadpe91YyAG3jh2SA8u3q7le3ND+1pGq+Hnsu34+xtcqnJEleckby9MwdQE1xOXjZDkWmoRIWHTyurLZmiqib6SU4iMuOAPuSeVk+rCSZeBmcF/zrX4sMXmDaVVBgu4uPgG6b1Uq2x2ryWwjunof4yQPNjkia6A69U4112dZj/ELXWyLIxynC1nroRNnPzLXfYLp4A3UGj7DTdAHWKZzHj9wdrAAg5kC+3n3osZOnURpIht6BgxpzRMFDleUN2FPhI6Rwxl66JlEyBTCRT6E6jTWnYutUSum6mJoaocVh2H+fgBkssEqZn4QgvbCZQCr8OMmSv9flHXU+iLRlB1r8h424j6Cp7ZSv4WIEefu8eBEGutfj8
X-Exchange-RoutingPolicyChecked:
	oXS9HjsLtkQOqzA/SB9dS1Yh2CLFEZc807vetfvCvnbiK1QqfWaZTEXa85lB2khRJ+YYWlN9ZgU4OKyOAZElmmMOuNZ9E+Oc8eoBzCmfcp5yORBbEfjbeMz/PKeIiIhGz1u9vHuBB5GHVtlgAD0/Sprqrd7rh4+uw4my0GRsKUYZHPcnIiBgy2m6SBOlD+NxMC/nr+vxrYNdVllgaVDVxHH0ENG/Jmw2djRT+OCuAkabNrwuMb2iXNZKn3IGW94vf9Rmqy2aEjaAkWGbT91qC1atpS24hhLL9iKkG/4AQu96GquC3KnEKVflYnJ4d8EsYbfAA6iMHtLVH4urAQvswA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XYj2of3ymUVkLzrJiFk/2fPF8Zl87kOCXIkpEV7WKKpfPTUZlJWTWOGJimXzRrztnAv3PfvMRRT7qJruycx3C2kb6/Xz5+x0mT8KaG/GxEA9B45peyL5TQoCvQybHQyhY1zXB+OrNfCcDQ7/gHqSSVceGjkQDBn0P+rtAVsPjn7JfXgSlI9CgJuH6SO3/n2A+5JnyO8ZfvWb88CGO7VXDsFkN0GLtgXb3R23NfHQlBXnPZynX06tRnWKq5G7SUlhjJBjv6X2udT/K+cdZFiI0KU8N+6a71XB+74nOM4+oMI2Wvq+DfeaWqS264hcfghwsgjq8U3nNK6UYmCfV7xPoJpvRlRubgtbY8ivDLmkcY89fGAQFq+Jhlwrjik7tQOBvU7FMwixGJUkknOJHOy07tiFimQKCCvBFCYFGb6kBf2A2K/frGwQliWdFXX5K8ompSpJv7Q4GjlePCQop0EOtur38H/qBvxi4HFFWla2luf2UPStFe2eBLfh8dL3Zzahk4aRkxx2Bt0ZVeoXyfjexjJmYicL6hpOQ7bjZVn6rPXJL5zQrVCsX0HkofrmLeRaTPKLs4eLSFAiB2hNzRIUVCIv9MQ353Q0MOn1Tif+6/R4llMDbidpcjf1/dMWcDCR
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 19:41:48.6831
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20212114-5a9d-45fb-11d7-08dec1a8273d
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004681.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR16MB3679
X-Authority-Analysis: v=2.4 cv=Wag8rUhX c=1 sm=1 tr=0 ts=6a208381 cx=c_pps
 a=9n5CQ2h0WC+XkeHDVU/11Q==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=AHe91QgOk3R4nFVtG5At:22 a=cbNQJ9GKAAAA:8
 a=Q-jbZ8zFL_rIPxRkYqEA:9 a=G69WFyCBNqGPyalROSdv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDE5MSBTYWx0ZWRfX53gQnXbP+HJW
 PPXTNJYNCvSCepb7eSSZ53p2sBUHakAJQxXhJSmeYxUYSOkNI0LWEcRVKV6Ft9gRnoswbQt5LCJ
 uwE16uBfqx1pF/Nq2uvEwgcam4x9CIP+KI+/i3vqZVPSdlbzn7dWQQf6GVJMWCP6rD3/R+I6wWs
 56+xYB6sDkBdrmSWoFKZc/uis98xN3Pdfhf/WUjLr0Kj7tJBh0kEr0Wj7KmU76X+Jyvw+lTmNg1
 y2kodu9ttcMDRZmM+jiOctutrornGA1brhPOnTl33Dq9Ck7LDzz9iK2/fHkI4Ld/iStXzyI4vbX
 ekSPbh0A666y3O/u6Vr6Dh88q5WfqAmXOpl1Ih/1v2vV++kqBZ85HhoGjQU58O00zlkDs3JJy+E
 lmk9hYAhMC/GBZCgKL+Wgi4f2LBnXm5Y3XNWI+ey06ui02wkeW6S7Nsn00bAmhL1X45TlJHtmfw
 jXOE9Tr1U/PkFhrA+vw==
X-Proofpoint-GUID: Kw_x_6g87_AcBdg3ZdEwd4DQrm2BHHkc
X-Proofpoint-ORIG-GUID: Kw_x_6g87_AcBdg3ZdEwd4DQrm2BHHkc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030191
X-purgate-ID: tlsNG-4011c0/1780515715-6FB5F8B7-B514C7D7/0/0
X-purgate-type: clean
X-purgate-size: 1490
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[saarlouis.ford.com:dkim,ford.com:mid,ford.com:dkim,ford.com:from_mime,ford.com:email,azureford.onmicrosoft.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 28D6963AF12

Add Kconfig knob to enable traces for Argo debugging.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v4:
- fixed dependency on a new Kconfig knob on ARGO

Changes since v3:
- dropped uneeded "If unsure, say N." from new Kconfig description
---
 xen/common/Kconfig | 6 ++++++
 xen/common/argo.c  | 3 +--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 5ff71480eebe..7676a78dca71 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -491,6 +491,12 @@ config ARGO
 
 	  If unsure, say N.
 
+config ARGO_DEBUG
+	bool "Argo: enable debug traces (UNSUPPORTED)" if ARGO
+	depends on ARGO
+	help
+	  Enables extra debug traces for Argo debugging.
+
 source "common/sched/Kconfig"
 
 config CRYPTO
diff --git a/xen/common/argo.c b/xen/common/argo.c
index 3c38a51d09a2..b9b362064e7e 100644
--- a/xen/common/argo.c
+++ b/xen/common/argo.c
@@ -318,10 +318,9 @@ static DEFINE_RWLOCK(L1_global_argo_rwlock); /* L1 */
     ((LOCKING_Read_L1 && spin_is_locked(&(d)->argo->send_L2_lock)) || \
      LOCKING_Write_L1)
 
-#define ARGO_DEBUG 0
 #define argo_dprintk(fmt, args...)                      \
     do {                                                \
-        if ( ARGO_DEBUG )                               \
+        if ( IS_ENABLED(CONFIG_ARGO_DEBUG) )            \
             gprintk(XENLOG_DEBUG, "argo: " fmt, ##args);\
     } while ( 0 )
 
-- 
2.54.0


