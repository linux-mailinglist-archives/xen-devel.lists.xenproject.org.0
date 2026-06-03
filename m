Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RYsCIJODIGpF4gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 21:42:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D904063AF15
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 21:42:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ford.com header.s=ppford header.b=NqcAFT8i;
	dkim=pass header.d=azureford.onmicrosoft.com header.s=selector2-azureford-onmicrosoft-com header.b=X9lSMfli;
	dkim=pass header.d=saarlouis.ford.com header.s=ppserprodsaar header.b=PfeyaT6w;
	dkim=pass header.d=ford.com header.s=ppfserpocford header.b=nuY1DYyt;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=ford.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1327111.1592353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUrTX-00025P-FU; Wed, 03 Jun 2026 19:42:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327111.1592353; Wed, 03 Jun 2026 19:42:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUrTX-00022w-Bh; Wed, 03 Jun 2026 19:42:03 +0000
Received: by outflank-mailman (input) for mailman id 1327111;
 Wed, 03 Jun 2026 19:42:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wUrTW-0001y9-1J
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 19:42:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUrTV-00D1nw-Du
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 21:42:01 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a208382-e002-0a2a0a5209dd-0a2a4505e0e4-6
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 21:42:01 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a208388-aaa8-0a2a45050019-94a38ff1edf4-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 21:42:01 +0200
Received: from pps.filterd (m0367127.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 653I6Ah93488837
 for <xen-devel@lists.xenproject.org>; Wed, 3 Jun 2026 19:41:59 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com
 (mail-eastusazon11011018.outbound.protection.outlook.com [52.101.52.18])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4ejpk3u5rs-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 19:41:59 +0000 (GMT)
Received: from BN0PR08CA0026.namprd08.prod.outlook.com (2603:10b6:408:142::28)
 by SA1PR16MB5824.namprd16.prod.outlook.com (2603:10b6:806:3ad::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 19:41:52 +0000
Received: from BN1PEPF00004681.namprd03.prod.outlook.com
 (2603:10b6:408:142:cafe::7a) by BN0PR08CA0026.outlook.office365.com
 (2603:10b6:408:142::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 19:41:52 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 BN1PEPF00004681.mail.protection.outlook.com (10.167.243.87) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Wed, 3 Jun 2026 19:41:51 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 653JOESG3761781
 for <xen-devel@lists.xenproject.org>; Wed, 3 Jun 2026 15:41:50 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4egeypqdm5-3
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:41:50 -0400 (EDT)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id UrTHw53NuonD5UrTJwXpu0; Wed, 03 Jun 2026 19:41:49 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=Lae
	zkBWZO6R96hcVi8Lk0+Msj51J7WGL0wLGQbrEmAA=; b=NqcAFT8iohOz5bSQvpZ
	BsFtn9e9H3AQozsgG/fegDV2KgUUfdkLsM6xQR4kuydauklv+EFhxbVoHzeKJEM6
	3lR1Dh3pV4+ZEhDGvR5uBtMRfi+l11OGV0WVN9MVMZWBvP8y8gsrayiO5oT21b0U
	p6UszY1E7U67kb8HULmTt8abwaPFf0zrMk2PFFKEWCYwF+AR7oKn31XlFHBWG/2X
	2/yIle5UqWHSJeQuI9AW+idVAx44pArQ/z9W2tVDK+1toX5MpCmxiu9zIVxigMye
	Ry3/wt8lmtmG0zMXosvBR67JCgDjyWuz63q5CW++RhuiMG76f+tIfa2/Puou7B7J
	1uw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C29J/rbzqMf+RsGvqUyUmlqym4fqUXFiPKksppcYVTNha1DDXo31YhGUQH3FDwr9BLdUuHvfEkRxet0aeSpTIBrjYAUErEsWSHJooJD22HbR/i3Jmu9RFZkHgcCpdyTan3G/2jlkOnbDhmPnqZOHDZ1yD1sHtkRYlFOEB2IPHrO+BXvzVYpFTfxFydXiNaYdw4QwFMGGWBPpML/Xv7Gx8hynsDCpwqS4a40WhMeCYx08aBrXAbcc2dPfmjbOuLkZDdiiOQG71totatCuPElzFtet8sONtKRe4vv91VpKD0RNJl0ConouXeS/6a5dhMBHJrD2Y4MtlbruUn41Accv+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LaezkBWZO6R96hcVi8Lk0+Msj51J7WGL0wLGQbrEmAA=;
 b=qWdMM0YH8S5f6PBA/FsroUMlR7BT04gD8A2DypAeQ5bc/hOJPvvTfi+GvdYi5RseUWELFJZIPLMVQoRHoZqRbhPFwN+FHM26ASc1tvD6Dk6GtAgqBs3pQkAd03WMnqovAxadV7z4dXv1JYUOCQ7KJCpiW4kqK6TBzNNnhsynUiOCgymy+Tm9bWLBAu6LIX0k2At8htAGwyZk8ERuTLRKfpVw8GOMqMndAhYlbYoKzMxiZe+rweVF/mEnfO0ttlzpzSK5NmVzTYsCCUKksxPI4Oi4TJzg6V90Iqe8tkDtLZZFCsWJ6p2y7CUeFsosu1C0KUln9VoJelbCn8dN8ahnHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LaezkBWZO6R96hcVi8Lk0+Msj51J7WGL0wLGQbrEmAA=;
 b=X9lSMfliIihAO75xAfPAKhwDnbbS48BvfW72edLLl/HBwBHoKj2SmjkgCthKLuEfP2Mh3ahRKnBtpkLseyVpwkcBqzfYZkLk8hej1BBpIMaqlZLeBTQdjzmh+wLtwwLAmJe6J3jx4NG+/ufMgbrw0B6Z5MlePJODcD1t/KpMvt0=
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
	ppserprodsaar; bh=LaezkBWZO6R96hcVi8Lk0+Msj51J7WGL0wLGQbrEmAA=; b=
	PfeyaT6wL2Rk1h30ijrBWHbMTOwu5tBGbrqQ9OeShA2kTxE5VsR7PCw21cVK5dd6
	g9ufR04Ghk2Drvxediy3VgYQ5QTsq9e0OayBuRBt9AfDVJcAahIfcjnPJSve+5Mu
	EBTttarOryI1RbLpV1Ts1jdohyE00f/KZx4KhDsC/5kOUCD1o733111eRB1KfU4e
	8KRuq/dD5I+83W85crVYEo4KAikJdLR3zE06tfqE16EbZRhMTtyS3wRcfWdJXaM8
	0pHwrL5OhNTmUudA0Fyqe34Qiv2cWTOqYAv/owkOLXQFq0HB2zMeeYi8IukUbdYR
	j3K0EQAZk7JtF0xftB6lHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=LaezkBW
	ZO6R96hcVi8Lk0+Msj51J7WGL0wLGQbrEmAA=; b=nuY1DYytuAtcdyRixPWlrTV
	laCVc3jkMQBJ/VQK7iYvfdrT3+l6AIqvdeODcD3dTaHaDTjF3RZ2fMADFm+PzU4M
	T8Q1nqCvdC5Wj09rZh1Gk5QsSMzPlF8I90zMWAmJaqX4zxg5ZdQBKn1Un7mSFWDB
	9v/zR7tByZzyN8etDHedJ2R10zkImq7VvJaev+ecV3TArFCynVCOuLqqMP35Tmh4
	Wza74lb+4TymlMfdwqFvwif+/ZQ8+IXNxgsamxrM4oAdgdo6Li8EOqYG2CYErk2L
	qwAf/N2hx0GTDbiPfvcb57AYSPUM0ILROE0qv6lI3rDXNPu5DjfrkYeT+lXjkaQ=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: UrTHw53NuonD5UrTJwXpu0
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v5 6/6] automation: enable Argo debugging in CI
Date: Wed,  3 Jun 2026 12:41:31 -0700
Message-ID: <20260603194131.1468654-7-dmukhin@ford.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004681:EE_|SA1PR16MB5824:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fe47bbfb-ca0b-4e3a-2165-08dec1a82910
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|13003099007|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	NyPuD9xIImTskrPwSFMZCuKVIrLB7EWMPBtVaP0zIIkdtXj1O91FPVkXUKqmaUqxBthhadJ9bU3qBWWgvvHFJ8Pc8NCgtHa6pLoJRKSrgfQJ9LV8Opf9DmY0tGE+K8uJsi9zHeyHoCNEfyY4CViyWomFegAjCW7TtLBHWJ5t43Nzcld+0YuxgnIIdjt3kjn9Eh04sbfXk6lx9a8VuX2lFVSxSFZ86hL+Yss+DuXSFKlxfL7O1EWdk9Dcmve8hyDJwypvbF8LfzR7/Gu2I9KP9GRDovQ9o7VCB+iBP97N171uo+4wM+WFSiGvjx4fUDQjZ2DuuwN8dXfz5yIOoTF6Wth9JnW7BCLRbAnDsnMpIvwa2tVZwW6anbStzYY2rqqZGF4DLC+Zn8h+JuqQPDfZgYNIuYzPoau9ryjUwlWB0TZ4nQ+mvM9tDvyZ8nbSoBnNd27KXEqoGFb5co3Q7iSYXHCm+06Xn2h6QemNmmEj5Dlndj5Kc1UBHgNpQw24CnBg0jS5ScMk9GKcSY6xguj5Ub0TsK6f5c5mvycwoC0npoyoxij3OVjnlLuAOuHu6wzU/OeMWqvGGX8Prn5O9y4WwLqGRaM3kOtYl42ggFtuUoMJBnvOXrkC1S3EG0BlFHQehFvffJM2hTcuTVNW0QEPw3EPBxLoL+mz/WV+LFdD8NWHDijCdn1s6yifeR09oANWy//6FYVR1JPZtbCm91HGG0L3rO+sKqTTKxk/cbIRohg=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(13003099007)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yJFdJ/wXHYKYQdJvGOPG7lWfIOrDqAaHLTyoflvY3UyH4w8gx+WbyLOZR80DaSNeXT9vLeArnCjCLCPOgwZ7u6fILK7J30SKrRtfmYtvWMFSL6u/BVsXc/VjM0W/1VV16ZzshzVxBFJuohvJylD+BI/11LxGPyVgvLc160crAb1drmr2sT37PzPbAjzh2FPLqUpR7TAsKWnAHIcM4hTztv358FNdDIoJRdsbRHeEBTjOy0bxcC+6Chhe8Sfp89HSpP/ej526CVddprJgBN/8F1DSxyKVEljZC63Ozt22gHvGfbxOAhdy61vv2HozrW2xEGKC/ihH3Ah/L9hkWx3zdI1XqahfVPs5wCcvTk0b5e20BefO5vg47gRYY+HzLYGJM4I3QL5bOBOXufM9HZG+fk5rFOSVyKxjfbkb+Wqq5TNsV9/UQPAKlqfR7lbOjY+u
X-Exchange-RoutingPolicyChecked:
	T2KiyugyYcT5U5ZE/TfIQ0DP80SwcxVPPY3ODi3iF86VVRo5Bq4arKIhgHZ8JAnpwtXa/1XXziJ5KIqh0WbpHD1k32DrPrFRYmelfmbpY1nNzcZetX6rS6bPneKwHb1+uQ1gYiXPg92eAKpIgqhKwuIYcD4gOotSQyGxXD8NoQulr87nAIrs7kD04GFXLSFBYZezdqTQBCd/hvrLsRcppMUvqiQilhzsWCSepnhVu4XIBAvSGNpoeXfOHgglnbMTSLi9lEkmrbM7Nf1tlpBYuBADnzHqW+/n+2cGb0aNPaoysyTdXbkeAX7k8XQ/AehYrpO5FX07wthmRbsieuAk+A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6TuNQy1wNsqZkbpb4l0BATEz/Iv9/IrYwwdkpcZOPpV4OP5PeoO+k/WLUVcQG3Hjee6jyA0ktQZxRrJkGtVJP13y1ci3SJUFEAQf++XZzIYcEiEEVE9YqBcrwGRq+7xo6ebU4KSkjnDTL/HhLBbQz3ORNxB6w3fVdItnbygCMVcpSwB+CijNNMrWTT9K19S9DQJ06I7qFubrNVP+Gmse2YzAqtwiCFBulJTU3sYnrddLzZJ2qjuhfzYm6vM+vMXe1+Ri2YFQL5v1wrAAwKfS9DO0qPQAI2E8RxqHZVR9uJSaAjHPt3bVwMizM2ZbuEnBFYyLM9/0leXaN+8e04ztLNpQz3zPVo7t70Ni52xgWNF3IJ1ssXnPCsQrBRvwofe1vgnsLpBQ+5X1X9cj9hLLU802ICAuJMwAdD4zwHzGQ27KjDnpn4oLiuMIc0UusswWXhLgAmq2n+BDkfN16tthAebeWOG/nbk5ujiOeeWFmw8Xa7ri7PX7DKXw6L21lyC0q1JBvSDAz8sZIDLCcK+mhfz0thXD8Fy/IYb35JZsGY8yqwXUzpG4GLV5VrdTslJ9QmCS8W/dfTTx9tUTZBjsq8uu4EUolJCtIHCdXQ7LO1mrjb/brSNx8XptaDx6mhdR
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 19:41:51.7433
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe47bbfb-ca0b-4e3a-2165-08dec1a82910
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004681.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR16MB5824
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDE5MSBTYWx0ZWRfXxKpmHUqeNohz
 XiNVFy58dcEhoMm+qdF+rAkpJODSA8PGXQ+VMBHpu6zS38ruoyWG65cYnRSPjnSAxJ3IapPt60R
 pClO4GL+ojgX4Ko9FJ42iSdpoeisGZTiV5jG5niH+xARLxe1YqA4jDespB8jGsCZzUzaqOePSZe
 feIu3Tg5h0bi4wJf/VEU8xov3IgfoA9nrmO1fPDy0u9XpUxwat6GPW6fI461pCq7dwKefgx6ltt
 MVsBT/eEhY4694RNUwR5/Jh54K8T1L3pYOgBOrBKvF+ylxYDMUlCqJmYONxc5OG72NK4OKGDXr6
 rKTedHcPrGvPoiF/jOyr+5BkyoNoqJy0eCgta6JMTCNw1GpkHgxa7cmOFs0a9zs9i5ayRpIFnwh
 BijE3FkGk2sljzJG2Tj0boVcQS0mAjIcXVjR6kQriAQsZ+VVA2u3O+no7Rme3YYT8EjsCrq2IcK
 IfsHXNn/O+VXSQsh2gA==
X-Proofpoint-ORIG-GUID: utIkbHAmnE9z1LoWScG0Ao_7VvMMap8R
X-Authority-Analysis: v=2.4 cv=OJIXGyaB c=1 sm=1 tr=0 ts=6a208387 cx=c_pps
 a=gE6CMw9pMCRGQsgsFAL45Q==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=dw5MciS7gY-znkhJuOLE:22 a=p0WdMEafAAAA:8
 a=cbNQJ9GKAAAA:8 a=dUaVGg0NMgzJYwoUstoA:9 a=3whSkbs7g9Me0DR5EJEX:22
X-Proofpoint-GUID: utIkbHAmnE9z1LoWScG0Ao_7VvMMap8R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 clxscore=1015 phishscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030191
X-purgate-ID: tlsNG-c201ff/1780515721-D9B70443-E9C193F5/0/0
X-purgate-type: clean
X-purgate-size: 1904
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[saarlouis.ford.com:dkim,ford.com:mid,ford.com:dkim,ford.com:from_mime,ford.com:email,azureford.onmicrosoft.com:dkim,gitlab.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D904063AF15

Enable extra Argo traces in CI to help analyze any potential Argo issues.

That covers eclair-*-allcode and alpine-3.18-gcc-debug jobs.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v4:
- n/a
- elcair-x86_64-allcode is green:
  https://gitlab.com/xen-project/people/dmukhin/xen/-/jobs/14680426572

Changes since v3:
- enabled CONFIG_ARGO_DEBUG for eclair-*-allcode jobs
  Note, eclair-x86_64-allcode is failing on staging (known):
  https://gitlab.com/xen-project/hardware/xen/-/pipelines/2567857238
- example of extra argo traces in CI:
  https://gitlab.com/xen-project/people/dmukhin/xen/-/jobs/14661834468
---
 automation/gitlab-ci/analyze.yaml | 2 ++
 automation/gitlab-ci/build.yaml   | 1 +
 2 files changed, 3 insertions(+)

diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
index 3f7532ee1d25..ae0929d13565 100644
--- a/automation/gitlab-ci/analyze.yaml
+++ b/automation/gitlab-ci/analyze.yaml
@@ -47,6 +47,7 @@ eclair-x86_64-allcode:
     RULESET: "monitored"
     EXTRA_XEN_CONFIG: |
       CONFIG_ARGO=y
+      CONFIG_ARGO_DEBUG=y
       CONFIG_DEBUG_INFO=n
       CONFIG_DEBUG_LOCK_PROFILE=y
       CONFIG_DEBUG_TRACE=y
@@ -127,6 +128,7 @@ eclair-ARM64-allcode:
     EXTRA_XEN_CONFIG: |
       CONFIG_ACPI=y
       CONFIG_ARGO=y
+      CONFIG_ARGO_DEBUG=y
       CONFIG_ARM64_SVE=y
       CONFIG_ARM_SMMU_V3=y
       CONFIG_BOOT_TIME_CPUPOOLS=y
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 0e5fb26c853e..b864443d0243 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -286,6 +286,7 @@ alpine-3.18-gcc-debug:
       CONFIG_EXPERT=y
       CONFIG_UNSUPPORTED=y
       CONFIG_ARGO=y
+      CONFIG_ARGO_DEBUG=y
       CONFIG_UBSAN=y
       CONFIG_UBSAN_FATAL=y
       CONFIG_MICROCODE_SCAN_DEFAULT=y
-- 
2.54.0


