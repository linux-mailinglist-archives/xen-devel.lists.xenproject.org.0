Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aS7/JpgrVWpjkwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 20:16:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAD674E676
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 20:16:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ford.com header.s=ppford header.b=epDkQHuu;
	dkim=pass header.d=azureford.onmicrosoft.com header.s=selector2-azureford-onmicrosoft-com header.b=IxCwwUr5;
	dkim=pass header.d=saarlouis.ford.com header.s=ppserprodsaar header.b="Am/lnIY6";
	dkim=pass header.d=ford.com header.s=ppfserpocford header.b=c3wXetF8;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=ford.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1361815.1613896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjLCq-0004hP-97; Mon, 13 Jul 2026 18:16:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361815.1613896; Mon, 13 Jul 2026 18:16:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjLCq-0004eo-5i; Mon, 13 Jul 2026 18:16:40 +0000
Received: by outflank-mailman (input) for mailman id 1361815;
 Mon, 13 Jul 2026 18:16:39 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wjLCp-0004eK-04
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 18:16:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjLCo-00El2B-D4
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 20:16:38 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a552b72-e002-0a2a0a5209dd-0a2a450ae58e-12
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 20:16:38 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <dmukhin@ford.com>)
 id 6a552b84-ec7d-0a2a450a0019-94a392172880-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 20:16:38 +0200
Received: from pps.filterd (m0482517.ppops.net [127.0.0.1])
 by m0482517.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66DI3Jw23980199
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 11:16:36 -0700
Received: from ph8pr06cu001.outbound.protection.outlook.com
 (mail-westus3azon11012004.outbound.protection.outlook.com [40.107.209.4])
 by m0482517.ppops.net (PPS) with ESMTPS id 4fd3299m7n-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 11:16:35 -0700 (PDT)
Received: from SJ0PR13CA0219.namprd13.prod.outlook.com (2603:10b6:a03:2c1::14)
 by IA1PR16MB5286.namprd16.prod.outlook.com (2603:10b6:208:44d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 18:16:32 +0000
Received: from SJ5PEPF000001D3.namprd05.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::88) by SJ0PR13CA0219.outlook.office365.com
 (2603:10b6:a03:2c1::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9 via Frontend Transport; Mon, 13
 Jul 2026 18:16:32 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 SJ5PEPF000001D3.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9
 via Frontend Transport; Mon, 13 Jul 2026 18:16:31 +0000
Received: from pps.filterd (m0426316.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66DHnh4x2009028
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 14:16:30 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4fc4vbhue1-13
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 14:16:30 -0400 (EDT)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id jLCdwMbj1912WjLCdwbjax; Mon, 13 Jul 2026 18:16:29 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=Z/1
	eZ7NabN9phDoxNJO0LQc0/KD3mXYVM4udypdjZEM=; b=epDkQHuunRU0R4wbbtF
	izLZTi3DUPfO3C4ZKPh3IDFGFDwws080MKTi0eTbQ8j7T4shurdnixpXqlgh86Q5
	0jebf+UQEKShdyi5l7i/wwttkHGzFSIvwIkTcK0LM8XYzgcPFj3ZGfZOxnvKXJ9L
	8mxZ801Q7Vpg3xFxqiCgPpjBtbn4ToDRFONw1hGFs7Sbg2AZXiEX0hv98Iun/spa
	GJxFCdIiwqBWnfpYlF8KjCETcczV/NMbnHGxvs+hfYSOnfLkgGWQrIASwkUXz1wl
	f72AuopPTcA6Dp9+HulH2bENg/2IkdxtBWIbWfoma60gRjkiQ476lJW5RRSPOtey
	JlA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q4DC3SfcoFcDgPXeG0Q1w7E3mBUuZDgQGshNHUmxSsrXMgygVAaUTMTqN1+hzvjp/7bOI+uOk4OSNjk3mpqncR52ZIbtp4zF1Gr3pb5NR21eYJLqaB0k+mh9YW7DZTMKHl8ygQY3hOqjy/4UzJH/8NIcFvdmJfNuKM+G5OhsgssTfl3f3Dmc4oe4JHEpxSOCAq1x5JG4aSs+A0tERc5g/X3V2QifhciBu7Y16c1nspbrEedjuXD7PgOH7xb05+5IY1vHG7JBXa2K8B8XdgsBVCxXvM4dh21QMPUEr225we98c6COT0BN07gSd2pXSM47QXcXbMHz2uqAUP7zZl0gNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/1eZ7NabN9phDoxNJO0LQc0/KD3mXYVM4udypdjZEM=;
 b=Vl5Yoq5FKM050vtQCKQRzAej9WNySHHRGs9l2qY/+nAUhqKShDVCdEdXKRxucwr+RvB73VLWrvw0h/WY+LRwAAfs75UwQ2eae/8IcUokm8Qdn+NU9Xm/PGUgbfimNfE1UhTXbwxhIHia6eJ//m2ph3KXU3DfuetbNcFH7STDO8htZOxOzQTD+DONwJDhyGT3we3++gsBSzhF07k8y0FHiSK5NxwpvKrKDwQ+M4BZTaaDWTyYKv/NaPX2cree5jNNRXAd6hBdVpw5pUMD2osbonrB+Zl4lhrBJ/y2OPEIlZrcdceQjlPAFpOmh2pIULY9CyIXCyezkXre0J0YMXsy4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z/1eZ7NabN9phDoxNJO0LQc0/KD3mXYVM4udypdjZEM=;
 b=IxCwwUr511phKdN417OCsIiS3Gt7+f72Lx7UE7A6YyPdm2blR/+QLL4P7dsuGka5fVhXDWIk6pcaV3vnq9C7jb5hF8LTjamiYJHUYnMRpp3YxRPtwb6YO6y+BoRzGvRVnz+s2JlX5CDpDPbKKdHPF2vaGOX4KdyC4Yxfc+iWMKs=
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
	ppserprodsaar; bh=Z/1eZ7NabN9phDoxNJO0LQc0/KD3mXYVM4udypdjZEM=; b=
	Am/lnIY60nVU9wiK0Q29Oz0ISKYySF92/Ga8lGgji6YGtng3o5aAh+B0MMWAnFgj
	z9PWubkX13h6EM2k6QsPivZJ+4ckfgUB/wpFCTUYE6pCFxFwRiDdByiwjVhAOzcm
	Y+CJndyy0KqKCEFUTJwa4nVkC0ulYDSxDWD8owLWDcPJDkhyAUb2lqecoVnTdXOV
	4Dnaor19zgp5mNqlEEu+2DfqQxdBpVu6BOgzzrDOKIRT9zW/6l2/C0X4PDnUeYKj
	jsFoxN9CmprOaqT2MmZvQcEGy5BE5GDkwTOftpJErIXsaoerTOIXDsKmTLzINmDR
	FsR5XBUbBjP4icFtOU67gg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=Z/1eZ7N
	abN9phDoxNJO0LQc0/KD3mXYVM4udypdjZEM=; b=c3wXetF8qzPiPM0XbUHLOwK
	AiW/Hqo3eteyl9ezXYZs4e5nwpE2dO7131Zhk5r83T89q9CBudDLN0hJ5nRPsHVE
	Pz6ppX3ZY98ng+SRttgvvnx/MKmgL+G+PAF9ft5j0pOkzRPa+nU2y+NT7dRahVF1
	OO03AhLu9sLSou9Wt6VPwAq1/iu/vfruLhaDZ7wnInIkj6h5VrjZuWajUS8AtYke
	aaS0dmWmj/xADdrnyC4Rg/h0ELkwm0vWzkkRO628iBS83BjpyIJ8UlPm23Ay1pZi
	vsmz0pmu5SYsnp+j8txecCT9w3J1Idn/yR12CLRr+VxmCnwbvkstXS5LDLG7W2w=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: jLCdwMbj1912WjLCdwbjax
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v7 2/7] xen/console: use memcpy() in console_init_ring()
Date: Mon, 13 Jul 2026 11:16:14 -0700
Message-ID: <20260713181619.672176-3-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260713181619.672176-1-dmukhin@ford.com>
References: <20260713181619.672176-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130189
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D3:EE_|IA1PR16MB5286:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d679dcc7-2efc-4069-b18b-08dee10add86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|23010399003|6133799003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	dyLvHlsPy6oXF5uye0NZGTywu+D2CMiV3hWAxuxvVJ4P2PcORrmJIIISZQF2YkMFxmtfH+Mxnki8bKhFHtuklR8zAsqeJR6QhDkAwDtA+pgHsvwbS2envshhra0NHE8ba/Xo6RvX+jblT5MgofJNXFLxN4ZCTgX4kT9lSIiD1CWv7gHC0sz7F88hrrNhNCY/fHDsVVCNHQE9JwW9oaRfyA1KPYD5BnOcXyxC4/efvfSTGIvyhUJiDDPh+VpccbnMKRKz531E6f3ixlLRuRH0FyjfFG4lj2TEAQKMfZW2NOlZfuZgRsqV9I7vmuw6svRKcaoS1fZjscB0HmRcfjZqCKBte+wQsXDUkn6aoC9/eWBrFlN0RC7UzDVficn2gEJyzY0+6r0z02+VwAof95zSTAvPdKuZeiisZfOvsrAZ3AVCtR6XeOepX8MdRLGnP8STB+asCMwfAt/1XrHK68s22W58njYxY4fKIeL+y3MHY4YftJVFXznp3HwYoV+UfASVc5oYt7fXyWi3xAcf4+bcyjyDtA424HfYQx5r6+6YCxC2rlT7CB9BK+fwtJb27ywb5D84uLnTBdPay49kNSqoSrlnuxgslThoZ0YUJezx74w85UJ67ePTnTacSxrDzpaOygzav5XA4OpdyUZkzHaQbhmdvaRjeqXLUExfrLzfnxFDc63w6aK7PrW6WjxmH3twJ+kumN+9X2HBDER9quvi9w==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(23010399003)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/ow4CMUKWbdI76eK1WYTQaw3yXJgJRABRoTkyajcq9UO035Sp8CCTeKKqG4BMJVetrrsbQytfpS16HMT+Zst0y9mZwCfFKxSdfYbR4BKzRPKXONW+K50hXac/LqZuj3zt8tIq75l/2Jn9tICMY0535seIDuJGsAOAc0uniIRYPSiSLr3u2ihP5Iy8SpeuddvMGpNRPX5wPb7ulPEEDILs4ttxMvO1pXez3ujf48+C6G+6Vc0yJ9qtIA4fROzPEwjFUSV162UbKkxBPAIxVwrZntAAcar62mU1Aa4spXY4wL+otfuo0MqaLCzj56tN5Af04R2LlL2JesGHdewejzSisWpvYmgStUROu2JHx9zMgA2/mbg/bJWh+BR6WecUxlVLz3B9DJ0ucTdwma5hMmgalyY0Cure6HxTJqP5UQ+8DiS+Xag3QlF7RSFpBqxzFKH
X-Exchange-RoutingPolicyChecked:
	n44wwQhUgsUSDItcTwcbkwL+KvLX9E9CgVnU90XJ2z/vgfassEMVGOXxbn+gCTVkQ6jJLDJATSJQGMvJHuVZfJFF0peHyQqtAB8V8OjHMIv1br9rl44CoFkFsQf1FwXchwkuJ7tuW7TZe15hCHXCAgVSGc/4grVAR8UFXXS90o8GxSLI1wsFuEcKIUoxCuCT8ses2WJYFTH2n4KVlG75QbRJodcq2qSFjD2huL70/mfTmv9e42vNJM9+vNGRLAws9FQ6+ez0XVfJs1zH39baZ8jIrSQlXCC1kbzuUJ4zT/3bJl9qK1DlCPZDp3m69PFu/S9AhTrW3UKgSRKpMFKT5g==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HOZ3QayRkVmhDLv82K+E21AQyNUUO8rnPFYjP6PvVcJo5w29i2OOzRHsesx9rQA7VNiasgiJYI2GU5aXIHz8axEzCcqOwTwJUdIVZY07sKir/moN3zqZTmFst5XmEyUNl++dETn+CsGFen31efpPOxfQ/kHspY8rc+KNX6rerndD0XaB5xyw70ex2CglDyR72x2Vw8MblABQ8WhybNE7lNMgLn+tS/IbgbMN1YzWBX5x/ji8XoqGPD2d6rfomi3Zhw3BUFDk23qp73tdbvfbBI4iRFQVBVolOnDy7FNyniAro1u6Ez6ejHJQYk6GfsBKsbl3wuN/5TuxHL4CAFrLLo4V5Ju83gmdYAvPv75RQD8zc8pm7ntCpI+8c2d7YUYk+O0IZXKIZaUPEuSoP50Gs7r+fFaQkh4fxQFWcVJOxzCLS8fUsuFDugVWnN+NQBYrKlAOZEiaRJNC9BuPhy84ZCt412tntDKis0AZTChv6kwkMl/T5+i3glLfmk7ktdmRAjb/OOPOg93QTNeWQyCwPHYvQvIYxUi20J5BZj+r9Su6+5bnu+RxeROHODLN3jxdyYIJiIFNaDQFqtW3Qa1MoKNu/C1MeYFackM+j4lFa4/7DZ9TwiDcS8gbt3BEXWXQJWEEAD3yr3t4Fqly3bAgIA==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 18:16:31.3064
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d679dcc7-2efc-4069-b18b-08dee10add86
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR16MB5286
X-Authority-Analysis: v=2.4 cv=av+CzyZV c=1 sm=1 tr=0 ts=6a552b83 cx=c_pps
 a=dAhe3p+MvHJ8ujFi5nYcpA==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=MLwXIh1eZMowsRZfVxRb:22 a=cbNQJ9GKAAAA:8
 a=tHz9FfFoAAAA:8 a=bfffGLb1BPHTRRR5J6cA:9 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-ORIG-GUID: 6y3Xw95usSIdVVpC27vj642OPskriu_I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE4OSBTYWx0ZWRfX/S99l/rnaWm9
 S6sA1qDGeKwdRaQW+3iS/LNdgWinjb0Z700Q72vcr/Ut4IPaXtSSNPkGdibFFDV7viPIHvsa6h4
 uOryBKgn6uI4FKktfeb+nhDXi2e4NHfvrlBlU0TLZhR1IRl3FOGSTFVuUmkmQTaxi4f3AK4CQHu
 aJyLhORAE9p98ZtQwK982hffzkZa9vF2D3Z72ZZbpGvC/Lj02+sD5Otxdfa1bgZKigaYr9zyu2+
 khNxTeme7R3eOumgUC9xZxex5ImXPTqfXeDQSQBkMuVKfG/pZUTkrjGZvnnxxFN+EDdIJ938BXg
 XTeyCvlZ7BSA9ysz/MfvZ58aLW82WIhv3/fhh4Gxk+uFv6WIWDrBsiM8RZFz+PFtEjnILJCloou
 UE1FzLjeVvTL9n1xle3y+f4xoX9hsxOGmFxcvTf2EEldbLQx5JQ7HBMZu6Gwm6bQuEUtzFaO4e8
 ebT++TMrQBSc4iLy1Ng==
X-Proofpoint-GUID: 6y3Xw95usSIdVVpC27vj642OPskriu_I
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE4OSBTYWx0ZWRfX2IjJoL4AaKJY
 Dtd8uPGpcvj1RuzY5gYTyh5tIkWt3nzuPJ+kG/zOATcjKQ9/gM8/pkHUTXir7LVqZcoJzYJY1fj
 y75jbvRxxnexhzYn+Wnaqov9/RVXtWbMylWrUryFEx9CPqc507/F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130189
X-purgate-ID: tlsNG-4011c0/1783966598-ACD46248-A9C218AF/0/0
X-purgate-type: clean
X-purgate-size: 1872
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
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,ford.com:from_mime,ford.com:mid,ford.com:email,ford.com:dkim,saarlouis.ford.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2DAD674E676

From: Denis Mukhin <dmukhin@ford.com> 

Make console_init_ring() more efficient by using memcpy()'s, rather than
copying the ring a byte at a time.

No functional change intended.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Acked-by: Roger Pau Monne <roger.pau@citrix.com>
---
Changes since v6:
- addressed Roger's feedback
- added Roger's A-b
---
 xen/drivers/char/console.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 5ebbbf63c092..37ea84403180 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -463,7 +463,8 @@ static void cf_check conring_dump_keyhandler(unsigned char key)
 void __init console_init_ring(void)
 {
     char *ring;
-    unsigned int i, order, memflags;
+    XENCONS_RING_IDX done, size, n;
+    unsigned int order, memflags;
     unsigned long flags;
 
     if ( !opt_conring_size )
@@ -479,8 +480,19 @@ void __init console_init_ring(void)
     opt_conring_size = PAGE_SIZE << order;
 
     nrspin_lock_irqsave(&console_lock, flags);
-    for ( i = conringc ; i != conringp; i++ )
-        ring[i & (opt_conring_size - 1)] = conring[i & (conring_size - 1)];
+
+    size = conringp - conringc;
+    for ( done = 0; done < size; done += n )
+    {
+        XENCONS_RING_IDX src = (conringc + done) & (conring_size - 1);
+        XENCONS_RING_IDX dst = (conringc + done) & (opt_conring_size - 1);
+
+        n = min(opt_conring_size - dst, conring_size - src);
+        n = min(size - done, n);
+
+        memcpy(&ring[dst], &conring[src], n);
+    }
+
     conring = ring;
     smp_wmb(); /* Allow users of console_force_unlock() to see larger buffer. */
     conring_size = opt_conring_size;
-- 
2.54.0


