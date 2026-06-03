Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lXAnIlHEH2qqpgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 08:06:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E93AC634833
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 08:06:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ford.com header.s=ppford header.b="a/S/LMkK";
	dkim=pass header.d=azureford.onmicrosoft.com header.s=selector2-azureford-onmicrosoft-com header.b=SMA3qvMQ;
	dkim=pass header.d=saarlouis.ford.com header.s=ppserprodsaar header.b=PLTXw05+;
	dkim=pass header.d=ford.com header.s=ppfserpocford header.b=aIdGI5Hi;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=ford.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1325654.1590962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUeji-0005Y8-F9; Wed, 03 Jun 2026 06:05:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325654.1590962; Wed, 03 Jun 2026 06:05:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUeji-0005WC-CC; Wed, 03 Jun 2026 06:05:54 +0000
Received: by outflank-mailman (input) for mailman id 1325654;
 Wed, 03 Jun 2026 06:05:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wUejf-0005W2-PS
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 06:05:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUejf-001q0p-2b
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 08:05:51 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a1fc436-5cb7-0a2a0a5109dd-0a2a450ba4ae-28
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 08:05:51 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a1fc43c-212f-0a2a450b0019-94a3921722b6-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 08:05:50 +0200
Received: from pps.filterd (m0482516.ppops.net [127.0.0.1])
 by m0482516.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6532WVFa2715869
 for <xen-devel@lists.xenproject.org>; Tue, 2 Jun 2026 23:05:48 -0700
Received: from dm5pr21cu001.outbound.protection.outlook.com
 (mail-centralusazon11011003.outbound.protection.outlook.com [52.101.62.3])
 by m0482516.ppops.net (PPS) with ESMTPS id 4ejbjwrx84-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 23:05:48 -0700 (PDT)
Received: from IA4P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:558::8)
 by LV8PR16MB5813.namprd16.prod.outlook.com (2603:10b6:408:1e4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 3 Jun 2026
 06:05:46 +0000
Received: from BN3PEPF0000B36E.namprd21.prod.outlook.com
 (2603:10b6:208:558:cafe::63) by IA4P220CA0004.outlook.office365.com
 (2603:10b6:208:558::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 06:05:46 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 BN3PEPF0000B36E.mail.protection.outlook.com (10.167.243.165) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.0 via
 Frontend Transport; Wed, 3 Jun 2026 06:05:45 +0000
Received: from pps.filterd (m0373460.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6532gYQQ913809
 for <xen-devel@lists.xenproject.org>; Wed, 3 Jun 2026 02:05:44 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4eggrxvknf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 02:05:44 -0400 (EDT)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id UejVwr0DHonD5UejWwCine; Wed, 03 Jun 2026 06:05:43 +0000
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
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=ppford; bh=zCvTRVacJa6kwRGoXuL845LZF
	4r4Ssnxzpuz4dBO7T0=; b=a/S/LMkKnHAmhYgL+9OFGQMdNx85H8QR6lJuob2Ek
	xk5g6rv+SOn1X3YmIV6sTU5jUYQ9MzcHcYMJzslhoBNEX85pKqDlSbT9TB6Rir8f
	haA9z/MnZ3FBBTEEMYQxeXf/6X3U5XPXz39v6HFgnExFh5UwoS746nVIiJTuXkcK
	BfOiCYLgMGjTwrpvST7jWgndYEayzXH9MSwxSA63pFTP33TQfX2nh5H2dDcedKQa
	+jNx6nubhFLC0kjxTgpcQgrxYBSNlrvFnBdlGlYxbNxwp0/YHxqOHlis1WRB6hvc
	2grCHoKOFSv7wYG2FypRetJqq9WxnTqT8RydXZTKqB63w==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Srvdh9zXpS/8o8JhEqBLvcIQlBinb348hfq1BQ3c+Ax17HORP0M2Y4dNFMA58YUhttprrsoPDh02VuqbY14ckmQeXQHEbPX4+btG+w/YDKrTpNe2TeQ/+cNghMPjdF8vozT/Ys3dV2ofJeVgqxTZ1NKiYOjGJL2jCZqg0tgAS7UrSCjAqazVpoBY21o1ENvVaBbBAQJu0/GJbsebFxNqSUdQzCg8ul2BEUosIrRDkRWKoEztbLgW2Fih+M0hzTrTWkyp0S0sB7Sd2qwe+oCI2snKhm2SalcQ7b+fS3MKBg3H1MGqHT2lYq6l2cXvbz3OdcQc+/QkXLkit+zZAO113Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zCvTRVacJa6kwRGoXuL845LZF4r4Ssnxzpuz4dBO7T0=;
 b=gTxBaUepcVBPs3BM4tRyo5sSm66bTYpYG+9o3XwhMcj8dvZXZtVRC/ocxUY7g4MRHFwEilX1S4ixXdYdiu2AvVPIQSWGMQstKqANrc26uiLcxGUKh9bt34Dhfmglwr4Hd6xdwY30SG+U4p9RcjgSNUtZVUnkIDQuNKLjcZMnNMAt/tum3OhMC0KkHaJDagfmouphQ/AH+kGyt5GOXX9vaYQRFB1+r+DHpd50bOYTm7XCF0WG4Td4ggqq33TUk3go1Ichtb3pdVW78U8VOGuOy+TZaCRhiBW/AhzY3hE87+gh5tLMXTjyuBvSpMypI5RNNPcUPjkjoKlm19WOOyvWJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zCvTRVacJa6kwRGoXuL845LZF4r4Ssnxzpuz4dBO7T0=;
 b=SMA3qvMQoLk4KPLHXKQBaeUsni25wgK2R5K4rKJC4iTc+EPQ9ZdYcailOcYFNATHKhmfwblODst+6dy2ILc2aQTN/syRiV21goIzRmKrz34Y/e85hG91GySU0jA/Ty9JX4+k2U56OSLu5aHWSiU6mnhN/1JPnfwzbhDtax/imV4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 205.220.161.53)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to; s=ppserprodsaar; bh=zCvTRVa
	cJa6kwRGoXuL845LZF4r4Ssnxzpuz4dBO7T0=; b=PLTXw05+eENOCtzNx3jyrTx
	J7BH/bDBTNyqABioRePVhj4eZ6FmLoGESIspOx3Fj81pUIyoGg3K7Eova2LUriEz
	D/kRJFF/WyTMCrF4avatDQbmQ6S0g6ExX+FWlIPvQtq2SGF3AmIUEWpWlZrQ4RvU
	trcX4OhaWrwoI0UodBqfhBpBLxeaU82QPgYwQABR8ewGVS965865YninBNLjteAK
	RPJhSEXovcsP0PHUqm+AFquQwzpSsuIWqo53J2qpLXAiInIpjcKbgc6dw27pri+4
	HGQ3huWgTAKjoVIq52/ndX5ry+2G2Kc35Az1hP4elnMq3936d7J2L9CZdfKvQYg=
	=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=ppfserpocford; bh=zCvTRVacJa6kwRGoXuL845LZF4r4Ssn
	xzpuz4dBO7T0=; b=aIdGI5HiV2v6Ttjn0cR4dD7L16VnmQIo3cuBu9ZYuWrCQXS
	9i6Tv0bKjl4A0os4+5ympbatt7f9C2bqTpDnpLuuZS/FZ9K59Ks3wa5Fc5FwF4A9
	d9PZgYVN5GMC7qh4h/UsV5aq2Ts4ozdTNa6u+Ry/OmSzD/mP4E+7jmvnfWcKMzgO
	oCiZqGT6OLEr5szsiEGbxcW6L06OoqkToMW8WFaTSCaBYJU1qTMeOGc1PsdS4MXH
	QV78rV1ULvjVNhqEzuDn9ZaOyW9ye/cWAnv0+bq2+2e71Q/3F3LbPGUlo9Y3kC9n
	3oSJi4XVPZ5W5gkVvVSMuMKt3hE5vgspbfA/byg==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: UejVwr0DHonD5UejWwCine
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v4 0/6] argo: few log fixes
Date: Tue,  2 Jun 2026 23:05:33 -0700
Message-ID: <20260603060539.1181809-1-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0
 suspectscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030056
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36E:EE_|LV8PR16MB5813:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d9bdb1e0-70aa-44be-d4df-08dec13626d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	lV2R58DZDOKT1Nb4c9v50S5bHbFCyZQUaVpsBMRAO4829320UwnwbY1XWslsmQH2BBocl12PIapwj1NBcW9JkL2otgITk2P4tzGQGzFkl9XphZqiTRz6Y7bVXTnmVYPZFoJ1Ih/L09BdLQpd4WXgXPytK2yI6lgqoNsqIBXRXTvZpa4SEzFG8DOyvncDP0y/6uVzrrSmRHXRb9ZM2vBzrydba8Jjszco/uqAaZTwRBwNXIVt9DiRNkfliREVp9cHQSD8pLpsy4t1cNmZO2Xoy55Z0G9J4t2rVQZiYW6ljHfseacoENylrRq8aD+FNPNFf+TbNoi5Pyr6LQQeMJLEYlscMSgBaq41z2OTOHx0dtx0d9eg4gwojNof7HbX52Tau1Le5ICD0u23GTyE6BpDaf00bR6XaceFz57WVCLL1IcEbcDTmZ4E93wNQzTQEGKZJGV+Bc6jPZoR5AIs+QCmoZ0vuxQWo3kIj2pbarqpva7xxUoTehf2WSEPjPa1+uGpX4qG3pIiEl/IBlSEsdlnDEjNIF4xOqRhxJMLkDV61HNh7xaIyskFmL6sCa/8EiBlC6zUgfsqEehxyoc/+ti+9pxl+vq60oOnzLYNcwIh4+EKFNxBP4zeJk3F9jjiLgEVNadsYKjahe2EXGE1/VI4lBMuvo1vXN2HvOQ6MlwMeeRpumDd+4YXHWLDru8+SJXnV6LEWuDC7DhE4RbKj80zViV8iebJdgzZ/NoB2kgXlZpSWCbPKl2n8Pytpj4EG/rK
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9vYPCHPZ/LL5GKqfoWqyQmygp5wvv/tEWK4IeNCQPPS557Q0mbj1xBoEFORM6ZV2np46rYnp+iRefMWL4fIBU/0/Fa8hMaDAiXKyRZaYmMYCfpdskGzsbSalKdGkzTMlAdW+JrK0CWwnhvPQEXtrfTs+B/ipOZ38w0non94bZsLV1B6fdMMn9o9NUuvzyGI9RUVwGq+254NVOn4zXRhUbaHkmDlK9sP1uZonfPkAfVDSE8F5KdqxGxm7nLHcRZTAOTtmbiTZC4uvDoV0+u8p6p1csREMJ+/VNYZbPAPFBJmmjwJafyCNTsKZ1cGPDMShI+3awC6Eo8LCdDbyxlZliAhzLDGdl8Mrq3yPDpzTqGctx7TItJLMuYA4wD1OeNT+4K294SgyYgFOM818IQIayN5bTS7sAy9SITVnXutISCQRUCUw1qxj/HwEWFeT3ZCv
X-Exchange-RoutingPolicyChecked:
	g9obt04DKitNgUvIsztz68R4tixpHpQ0Rtw9PzkvnPLW61YhJVMI6BSHrOM93Byrz9aORltOMw4RPVQHtlCM0cisYU6a6brAv1BkNOlsh69m9cTuSES7SuspsvPHjtgoAcS5H+FSFVn47DSTV77v0QeHgf8zQ/LUVrifIOOyylIe8nucjKw4kT0bXH6qNbuiJue7+87eAdAgpl0HecpWC9JJr3OvNBsCwPwmlPZ1GwupmQFIKtOKYo30N2yGdy6sjkQLrmTKWi1m/h/otbOvaN1z2oM7wrTHzbscSj8VXeKRIgMU5nLMgbIY3D0Hpr9s15Rk49QaB/v7Ecec75ZUNQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GlfwrhO68pNXqgtmjELdDHkS5mnaS+WfRnTik6C5oS2p0KGN26P32ZzwJlRlTvqpko5o5VH3iGojvzjGCHgtIz7FTcm9dpL6pe4Fi6pedWIb77tRb/yUsQU9k/qhkjfOrq5ma13GZu3kBaKi8lKCOwvk5AqrZM7K40fCe+Rg8ZIjcLkjZaI0RebxdmzOz+coCYOM/nBAjzg/mEJab3+qgnfMM00tI5itK8v5GjGtu6KdB+whqNU4vhoiKGBgYug+yJbryS8gT37HwDnyv0AQ/KLnYPfXXrBMZLnjxgWIFXmyMLl8iZSRJvDwf6OoaupFnuuTbwbpgYm7QFzI78gBjg2q5jIgvMAZtBJhtxh3V1JyGlx4JbIH4kKApP+KQDcYdSLqquxkEBeoY7t0mVwrCH+J53SBXijjqQ2ia9rtCFysVCH635vengwMwm+adaXOCVrqQoQTWfNz8LRgwmEot+kwiNIEjg2hBWTSQ8llrSW4w4+CDF4I7nWT/SPQFSeE2gO0yRre/0wwRw6HnyMArPr48eAic+pNd22maI4/8mICuOTfqrpScbNFPfrBgI17Q2Dhl8fwDNi1UF1uWgbSCY3IMUrjBvbKyWqTf6dHtBkNF9HTPsXgv9ndHzewxj6w
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 06:05:45.4679
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9bdb1e0-70aa-44be-d4df-08dec13626d7
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR16MB5813
X-Proofpoint-GUID: wFPoP_a6gOZamHItD1oUNQR1Sk39j7qD
X-Authority-Analysis: v=2.4 cv=H5TrBeYi c=1 sm=1 tr=0 ts=6a1fc43c cx=c_pps
 a=G+edI3GLQse3gACT8XNfSw==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=NvsXeTrgx-CJMFV-xl94:22 a=p0WdMEafAAAA:8
 a=9Rjklcs_zL7GqLz8L0MA:9 a=3whSkbs7g9Me0DR5EJEX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA1NSBTYWx0ZWRfX1+Cihe1/bSRn
 99wLsM0vJNcB9YPd7w2g/sxfp94sKCuopuDZ3gTkhGWUjU/DFLTivH1uXEcYzTkQUWqENahhmX4
 AhdjxL5XV5gFdKwCpVGFbKQd+cqwKmHldZOXeCoRUgiQ4PsC2wsoLXZ8q3J4GWkXXrHfpYy3Tq0
 TBQkeBHMjlu9QZVNbcOqf+9JPyyNuFM543alnVc/7uSo3tlj2VJJQrJQBajZc0H2dvEX24vg8in
 DqfeiUegDM9+NVVFVa/6X73JGghqy3ayb0YS8DYHrFP+/lYg4BKkxadOg/teUEuD8iOrwrjvfZw
 TF5gluQOJRSJSQQ1mPv7Dkus+J6IIFco9pf1X/N6thav33ZLyieazpjhd9QFWPX2pq0EIXzbudu
 qefCkt3yTiQl9G4Qd3YIJsuqz43ta+KiK/LPI8w14IklgowK71x75oS2q7kJRk5hfumSyj9bD9t
 s7WmIVlrqEvu0SBUoYg==
X-Proofpoint-ORIG-GUID: wFPoP_a6gOZamHItD1oUNQR1Sk39j7qD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030055
X-purgate-ID: tlsNG-42698a/1780466751-19F6EF3B-4537A1C0/0/0
X-purgate-type: clean
X-purgate-size: 1094
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:mid,ford.com:from_mime,ford.com:dkim,azureford.onmicrosoft.com:dkim,gitlab.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E93AC634833

This series corrects Argo module tracing.

Patch 1 lowers the verbosity of a spammy log message.
Patch 2 corrects the debug logline.
Patch 3 cleans up existing loglines by dropping duplicate prefixes.
Patch 4 re-wires argo_dprintk() to gprintk() to include mode debugging
        context.
Patch 5 adds new Kconfig for short-circuiting extra verbose Argo traces.
Patch 6 enables extra verbose Argo traces in CI for ease of catching
        potential issues.

CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2571555053

Denis Mukhin (6):
  argo: lower level of noisy connection-refused log
  argo: correct logline in ring_unmap()
  argo: drop argo prefix from argo_dprintk() calls
  argo: fixup argo_dprintk()
  argo: introduce CONFIG_ARGO_DEBUG
  automation: enable Argo debugging in CI

 automation/gitlab-ci/analyze.yaml |  2 ++
 automation/gitlab-ci/build.yaml   |  1 +
 xen/common/Kconfig                |  5 +++++
 xen/common/argo.c                 | 22 ++++++++++------------
 4 files changed, 18 insertions(+), 12 deletions(-)

-- 
2.54.0


