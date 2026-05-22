Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KQRLIxWKEGrEZQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 18:53:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D195B7C96
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 18:53:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1317110.1586359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQT7N-0005lj-15; Fri, 22 May 2026 16:53:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1317110.1586359; Fri, 22 May 2026 16:53:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQT7M-0005hD-Qy; Fri, 22 May 2026 16:53:00 +0000
Received: by outflank-mailman (input) for mailman id 1317110;
 Fri, 22 May 2026 16:52:59 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wQT7L-0005eT-Iu
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 16:52:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQT7K-007HVv-VY
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 18:52:58 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a1089cb-e002-0a2a0a5209dd-0a2a4505ebfc-34
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 18:52:58 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a1089e9-aaa8-0a2a45050019-94a39217c210-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 18:52:58 +0200
Received: from pps.filterd (m0367124.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64MFAhTE3810781
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 16:52:56 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com
 (mail-southcentralusazon11011064.outbound.protection.outlook.com
 [40.93.194.64])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4easjas04x-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 16:52:56 +0000 (GMT)
Received: from CY5PR18CA0002.namprd18.prod.outlook.com (2603:10b6:930:5::25)
 by DS5PPFFE37258D0.namprd16.prod.outlook.com (2603:10b6:f:fc00::7eb) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 16:52:54 +0000
Received: from CH3PEPF0000000A.namprd04.prod.outlook.com
 (2603:10b6:930:5:cafe::33) by CY5PR18CA0002.outlook.office365.com
 (2603:10b6:930:5::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Fri, 22
 May 2026 16:52:54 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 CH3PEPF0000000A.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Fri, 22 May 2026 16:52:53 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64MGQhxX3360443
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 12:52:53 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4eactj8wk7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 12:52:53 -0400 (EDT)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id QT7Cw0mfhvRqcQT7CwYxPs; Fri, 22 May 2026 16:52:52 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=R1O
	WChNFvwomDsgWABRG20kkJtStsxIi7xL+8JAbvp8=; b=p2CZAHZQEtI0fx2ADkH
	7GpOjO1Sp4rChJpmvANTQ+OraDHTPZRIagKJQgaNPFnVAcMsy/qRxDmdDMmS2991
	v0ryetkRXfIU7kD83WxwNcrlu6z6ZGK2GUyK9aI8SQJ7lh2bGEVl5K3S08rEzedx
	uF2QbYy783hRgigqroUlHtMevSTdNR5n2fx81zFNm5XpysA4ypBHeDjbMsKcwc+1
	kct0F5DugDwoaCEXI5D2liYd3S2Ft5++Siq5EukilyT8Z5xuvNWOFvScrznEh0yT
	FGMB0sGmR36x8lquuDJURTB5BzLpPWjkdQCTqaWUdm7Px8mgNVGDfT2UPWoulg2Y
	gwQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FtULdALDMSz59cCtP/qWuH/LIqzYjiu+LLH0XoDxj8+elOPyi6D2JoMJbZ2icRscT0EimCy30KHUdl9GZRid9lybckJnueEFG94XFzx8oqLxjkCgATbI2OZnrg9h7rsHDgfWN0+i78PkWWLhBfWeCsqDS4MimmGPvRY0kqaEAgckW5UQ1UAwKlWMLl+jm3ZLpwvziw0HSin2eXY59wbPAWCk42sUGpqpHSFZdhGKqyo/dnYWrK+PPLaIEZ8gykTCS11hdjt1kEH0ixuSGkGlWeNgRO/+J42/wcrOSwoAi2r4QIIyaevxSfRFrox+1cYE6+d6P0kya1xkoQsE2cHfrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R1OWChNFvwomDsgWABRG20kkJtStsxIi7xL+8JAbvp8=;
 b=CxsDqemZYPJi9l5xTNMaD3MgNGhp70vjGmOPsTPwkprBOhWnML5t3rGoPJmKxZw6anem79Qs/oPHujBbnEYfP0z2XT/Gb24O5JnLR4VvcAnGAUIfaFlbNDBMVSKaWQEcG345rNmcPR6kkjXE1OhhAyUFZX2SfY6+bTzoR1glyp83fPAlwnYyo61qbex90tT0xZkLiVV71P7qAJSKga/LDAMazbEAX4CcAbGZxZq+AtGPEzJcV4kHdn+WaVozV9dutGzsKxniz3I9jqugyPWS93Pmm70jHYt4/QCAiuP64HLZMgAgPe2+vysfBdqqGqRG2T861A4pfvMsnORUdTzuzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R1OWChNFvwomDsgWABRG20kkJtStsxIi7xL+8JAbvp8=;
 b=JcnHQgUYj5w8FNeT8XCJJ+8MGPmNf07+6L0c5cbGv8c+4rQftPLL0UJjM28jsx6H0ScYTYN0/4nX3WpH0kr71CrPy644ZDOKoX5RYLDNOaItoV01XnHZSH5qUEPWj4w21ICJ3VHfoc1jDhoL9Y17ZZsD/w+Ycom9nWBO+IJ55x4=
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
	ppserprodsaar; bh=R1OWChNFvwomDsgWABRG20kkJtStsxIi7xL+8JAbvp8=; b=
	cJXX1y42VWz0mk0wA16xm1QqSeLQbiRS91wYIkmdDXp2vTuvS+zhxdRhm2C05gKq
	NakuWGywuiEEZF32BP4dYvIZnr/wBfuWZ0XOfeVUGhtnWnKl4PYoV2hPaSBtvVdM
	SdPCC/Fm6ee+l5i5eTPEKlShTeeqlI49cD+V7bLh/N8FHnxDJWVvuYsQ4gJMN0eQ
	2jo7EezRntsrvSNvtLGBOzAJnTZt8/2oMj0e3wdkUd/tYsVjOXVoSW40kI2nB4Jb
	GmxjWCXd7quAHu+bLPmQKTiY7ngLsx/0UVlnZbAaak27BTo3CM5PWXjYI6cTxHKH
	ZAsp6ir4K6BUjF37pIH1zg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=R1OWChN
	FvwomDsgWABRG20kkJtStsxIi7xL+8JAbvp8=; b=UJS0m33grqn+qv3Y5Spr2WH
	Af6nVo44ydltd6pMGAoP3I4emG6Qkvi0gLzYgbuh6Z+E9nDy7V7GbKzFQzu/kGFW
	IHT+mgW13Z1SjmCKgf4k9kSU/JcNjOYbOAE0AlD40+KSH7zqfMoBsbuO3PyUoipz
	Luwc2IzkZW4xCGPGB2Oc20Mi/PiwBr440nYs6KpDNlpZFniLNKI9jByQpedweBJS
	JUogVOdVUzNZAdLZKuEOHKedOi1htFqQYGyiUjuRLt+Koh5erViIKJPdkBwZhiix
	jRuoM1ibai4CLjkJy/SNxcMCTK6Nba3bKjeF36ktmJ6vdybtvTemuAS9UvRKg2Q=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: QT7Cw0mfhvRqcQT7CwYxPs
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, christopher.w.clark@gmail.com,
        dpsmith@apertussolutions.com, dmukhin@ford.com
Subject: [PATCH v2 2/3] argo: correct logline in ring_unmap()
Date: Fri, 22 May 2026 09:52:37 -0700
Message-ID: <20260522165238.844649-3-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522165238.844649-1-dmukhin@ford.com>
References: <20260522165238.844649-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220168
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000A:EE_|DS5PPFFE37258D0:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0f31d44f-99f9-44e1-3bc7-08deb822915c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|11063799006|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	QGOV/jwbCc/jooGBN9dR7ddXUO/XRP8kneEkyKRyLw5uF8ahiP7aMeyjeWHQzMS6dZkhpb/P4lKhw00g3d6eO09wL7rez6kxGhs5a3tCRbxg1+E2R5fn6IL4FQqtKBkxATxI4ZDgk31+mu87LjXqowHld4oRWrMwhpnG0kn5Dmr0St0u+xZuzDrsaT5xjg/R1bhzQCXUWVP1H8fn3ifIdZSNKAlEB0mWih4v01dPUhyJ5O29NNA8+ipCkw9/8VlTTnirwdD67Os14M8VbCs88ypZSWlqcKQOcnZw5c5sXqZ72xL85V9CULlznCYVzONKQz975fU+Hlz8wxxcOmO/xi22SGk50f6fzxmRdxbsMvxSaxastGW8eiOHxthJFlh+O0tDevoUypGk14dwAUZI16jdiwoI0lrLYg5RcUAqzuHmZnOKinl+fDypgKDdUlMhnoTr0XyyMjPblnx0YRxZ98gaJSw5N63O7gajjWH4+bku0E1geBHt7PVyArPU/40Dl0omFVpNTGSXZRTc0p3j1mbiw+KYlYuoShHSlLRXM+ZqQxifqEPvaYS56BJCMZ2EBIgx0vR3o0y6GOXxCPWz+s5C3oeYsI3TG3bvGvu6bhh38i+JlPyENb2+MAdgPWn+uWCAOxVhHpKVS1k7PqJJVOmn1TL55C+grkGlYHXSasGVfSbg7rcffOu8slKt+F1qy42XdfCwEUpEyz9c4O80HkWz+KAcOFhcp/lOLyWqc14=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(11063799006)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TT4mU2higYMD6i2hVQ1RPs7RRnR/8nN7PPD6800V+QaxZMOXv1hPdp53Ei0HWMm4RQasUMMJDebISOYX3GiQ2myQKRCgMdYrOQiAbT1AoO+xsXsWHV7SHCdRO4QMIksrIkxJ5U/cOMMJRPtUn5gv6ryyeNx7YJltR1nTna3HhMCOS1gDywTXXOmz5+pkr0Pz8uLqFLCRkUXsi00WZD2JfY9BDzskbR6qFLCeJ3Uj+Sf9UcQP8cCTvcIjJzpfwOVNHYJsbwrBpNt0zvRLSzyjTstJhhm2d3CiErDd5ymc2k/+Jy2HKCDMhO2OSwkTVPi9SRLe4dUDvAPUKbMMFpzPjBhUIvu+sL+TX5ChibBzcWFlAVcbMndxMZw09SHXw6DeBUVZvhSdZD9HK5FTutolDcnxIMdw2/LCzUOfDN2A/jmrKqGWMbCt2ZtXkxAyukCM
X-Exchange-RoutingPolicyChecked:
	nghd9dKrxVdY2fauj3Zkds03/5wRYxqg4892A4oSVQtTvctJs+8bqhpQHCLtrYk3DRr4V3h5m7xP0nZfE9NQmz1Psnd+WFeIMKWlAXOdsBioBPiZ1Dolr6dTg95JpC1rbEDmptr00qf0vSEpbyFZJjW6m9Z5g6Uhd2UelVRHr1FPGR5oo8bNySzdWLO24LuzIMmtMYy51WpR17DO0GFeam8BX0jrs/a4BHxfkZf1Xgba+90Y8YX+U2FpOVe6W39dKQfnPbCmidF/i08l/T36JBApo3bhdpVtw/Ca4nQGscZy84Jqv2WcDJ++k+U3k/IivUZm5vtOBEmum/lJOuqIcg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ShJqmSz+31GtH1X4DBRzAdlbeHo03QL3PtBdusqZrkU8sW3/qceu5YlQtDD6zl3syPwc8xLgrhndp678VAWSOGkiBGnjhXQyeJaF4cOtcLNHoPFduZTtElg9azO4vj3cxpfjkaILQR/4EXfgpLUxy76Km7VVwIQrIg3vEtLPiIgjwZ/6V58OxA/P8OpIfUHL2BmxNDfCgpnEIOAg4MTz5BEsTQDrxdaevW5OAQ4MOAZox8TW6KgLg/dgf2h7lAz+FKeBRTj6Y02nFCF6Chpl4kS87dTmq4uJ3AkULT6Eb0G7jDuoFH49u4rwlD4kYJtnm2cbzVNre58hns1n32ObsXHR0+j+XSsYzUAUb2uhg9qYkMJ1SVJgs5CLGfJlgm4VAprxZX4UB/4jwYpDEcHqL2rSL7TD2WNYCJbW+E/ugW8LoHAfBt7YOtKrMEmGGXu9943lem9JqbwDpNuCAJCqPDsTyA8cLTisDyM5t6bEhnSKyMYWhNmTthBcEjwydX83y5pw6ury9JS8PfeuWOP8tmzNwMdK1T2iXiNDoo0XiZjGuCc/ra5H7FFotwp+bgWgfkR9lUokFvmxrrz72Edkhz55CmGVfjZlonBnr3uqGEgZ3nlUB39v4dy/IMR2MUB1cC3A0i7sC0XMzWfuN2pwIA==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 16:52:53.8906
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f31d44f-99f9-44e1-3bc7-08deb822915c
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFFE37258D0
X-Authority-Analysis: v=2.4 cv=LLdWhpW9 c=1 sm=1 tr=0 ts=6a1089e8 cx=c_pps
 a=cAYAfY5XwGGlFG+HVYY7CQ==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=NGcC8JguVDcA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=YJXg7OVxOWrJwj3yZo-i:22 a=cbNQJ9GKAAAA:8
 a=WngjfBvNni4G5VxG9swA:9 a=P0bj-C3X3jJDpopQwM1U:22
X-Proofpoint-GUID: 6vkp8dNCRzA7SEuUZrpcL9r0ukB1TNAc
X-Proofpoint-ORIG-GUID: 6vkp8dNCRzA7SEuUZrpcL9r0ukB1TNAc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE2NyBTYWx0ZWRfX/F0xjmXQwYwh
 p98Ku1cnpW/DMKeYd2G1dK6AlCjJVFlfIVJhJfwyQL6KXc0atzWpzmGmpcS+R2Q82gojj5JYDoV
 UOMASZori8h++xYxoj6C3UTtyufJd1+kCcb2x48hSyVFmbseaZI480HvbgKffIB8zUzx9JSv2gQ
 OJ/tvfbqiRBzefhj7Uvg52o1HUf/aWWkhM50jKFybf52PYfXfO6wW9JuVE8BiM6HxHSKPlcbt+4
 G0USn0rs2Qn5gpo87hoI7DmBfL7l39udxeL3gVeB6XIKJIiBmFNiCKFHc5cJql4z2USsFwwcY3T
 aFNmd6eWEDuxynraTxZGCVz6cjh2/v29I5UcTzui8o/GaLHay2Ji1N9gXaTmSrxWMwfsFcBtSCd
 U8YfxgFmzcllQVNhhu9q0ab6XLsOTdn78C9aV4VGNcEK9YpbVTpXMkACpGrlN8RkIl2UE6CxdA3
 6TqvHtu41V0l4JYOdaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220167
X-purgate-ID: tlsNG-c201ff/1779468778-E2F94443-159A49F4/0/0
X-purgate-type: clean
X-purgate-size: 1034
X-Spamd-Result: default: False [2.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:christopher.w.clark@gmail.com,m:dpsmith@apertussolutions.com,m:dmukhin@ford.com,m:christopherwclark@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,suse.com,xen.org,amd.com,kernel.org,gmail.com,apertussolutions.com,ford.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	FROM_NO_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWELVE(0.00)[16];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.978];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[azureford.onmicrosoft.com:dkim,saarlouis.ford.com:dkim]
X-Rspamd-Queue-Id: 76D195B7C96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Denis Mukhin <dmukhin@ford.com> 

Drop XENLOG_ERR from the logline since argo_dprintk() already injects
the proper log level indicator.

Also, drop "argo: " prefix, since it is also injected by argo_dprintk()

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v1:
- dropped duplicate "argo: " prefix
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


