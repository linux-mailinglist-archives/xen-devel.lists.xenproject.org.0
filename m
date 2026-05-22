Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEnsJRWKEGrGZQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 18:53:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EB05B7C97
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 18:53:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1317113.1586380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQT7U-0006NT-Hu; Fri, 22 May 2026 16:53:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1317113.1586380; Fri, 22 May 2026 16:53:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQT7U-0006Kr-Ei; Fri, 22 May 2026 16:53:08 +0000
Received: by outflank-mailman (input) for mailman id 1317113;
 Fri, 22 May 2026 16:53:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wQT7T-0006Jj-5g
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 16:53:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQT7S-008DYy-IK
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 18:53:06 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a1089bd-e002-0a2a0a5209dd-0a2a450882de-18
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 18:53:06 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a1089f1-63b5-0a2a45080019-94a38ff1fe32-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 18:53:06 +0200
Received: from pps.filterd (m0367127.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64MG81FM1233800
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 16:53:04 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com
 (mail-eastusazon11011058.outbound.protection.outlook.com [52.101.52.58])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4eanr3bb4u-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 16:53:04 +0000 (GMT)
Received: from SJ0PR13CA0017.namprd13.prod.outlook.com (2603:10b6:a03:2c0::22)
 by EA2PR16MB5584.namprd16.prod.outlook.com (2603:10b6:303:25b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Fri, 22 May
 2026 16:52:58 +0000
Received: from SJ1PEPF000026C6.namprd04.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::6b) by SJ0PR13CA0017.outlook.office365.com
 (2603:10b6:a03:2c0::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.9 via Frontend Transport; Fri, 22
 May 2026 16:52:57 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 SJ1PEPF000026C6.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Fri, 22 May 2026 16:52:57 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64MGQhxa3360443
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 12:52:56 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4eactj8wka-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 12:52:56 -0400 (EDT)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id QT7FwLPIgdhUUQT7Fwxs9g; Fri, 22 May 2026 16:52:55 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=wUY
	hExMRJeVtPFOqPMzPbKjHtBvWIYREvKb+RihaRCU=; b=e8L2tuBtRIOLb7SaKkg
	myIsRLZ08BWcET1zYWpMJZZ0P78hDVO6ThtsGNi2GejZ8KGgq0upo3BpsJ368wFC
	hxNoVdXssJjFYy36PXTt7G7l8pINxM5iWTTRFK2K2cSCCdUz1a3uHumZcLFgsRO5
	1ygEpE/6xlp7C2Q+uHgKbBL4onlIrF66EZ7FvYo+GiYqi3+tU8+LxQNn2nnnPnOv
	fHcFK6tAdr+hwiw1vGcBGsNDPjzjRtQt/LZ//i3FFvpnm2FczGW7pAxub/k0+k1X
	QbLo943AddzdIIQdCg/gbagaNEV0QO6ylE77vMbqqzUOaS4d82cjrsCh4D/QKIDS
	WUA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FVCYAiDzE6AKvRYSEC2vqEfFxpuJcJklAbL/HuyeXPr4WTCDjNSdUkT/i6JnL4Fb7qLTp4d2DOftCbx0JBFvuMwiAOWxmZo8t5+bxd+ptgUW8KFyXH48j1nOwOGw7R+W+OzNCzYNhAhJyCve6uFbLOcCNfGtDF5kUjkxnFryKS9H1JwV7vjMW4aN8Od2NkuMEJ5srdDqUxi1dP4CEGTDAJ2PE1CSxaQygTk5k+o3Dq1H0ikGhfyJKZt/o6n7aqAUQVB3w/6bISIZKR/ebibMN2CuqRgpKC5N350qpqUH/zauDuD1WXbVuc9/Xz2597C+AumLDgP0Bdu/PumC0OAOwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wUYhExMRJeVtPFOqPMzPbKjHtBvWIYREvKb+RihaRCU=;
 b=VzLQH5n9bT0/PscF2lMYfgs7pBKSsA0FNntRPURoog3o3ghHOTxZRIcZ2IHnDYJlBxFZLQjt5sVFgWQGLByYjdSMsMLuNz8ZEurFvEVw8o7qZArAS8P+CIxZryFLgU3Q7d67g/siRGFtoXb4Uzj20RX2G20HvuAJtSDr9Q28iqkq6KpLQCGGEd/VxhPwlp54wtOk6d7E8IMaQjvbdI+E4ruwAMLdkb0/5log/H1XlVud/agsytDQlhvvLXkVDOzgJ2rGlVozrrL99LnU5C1CDDynoHGRBQO/Gsg903oZYMP27hTpUp0emALSE9NxiHZJrwAruUcBZNt8xfLgIE345g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wUYhExMRJeVtPFOqPMzPbKjHtBvWIYREvKb+RihaRCU=;
 b=S0vLkqpubkvCUWbvzIK6UlzZ1vnJSJ8uSqc6arsoF3+4/TAABUxkDQdhg8qMdjhOmzCIEkPp3LExdHysb9Ool2fNlliaym97q0c8lNHpvMJmP1U/5NmuMA9I+peZiOLMaqLu+jsPanonAutQ1X+BtYnnSaIGGKczU7RbJCRDuNw=
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
	ppserprodsaar; bh=wUYhExMRJeVtPFOqPMzPbKjHtBvWIYREvKb+RihaRCU=; b=
	mlyZi0VCEaZ65KnjW64jmWEBY0/nYEnQWbAZmtdnACqhziFb9Z3w6oU2MpEvt30N
	9Oke7L3V4Fij/045XzEkK7WVDZv+vcwd60tn4g0uAgA+O8vBA+GCgsrMEI8lkITs
	912esTFMpKkZsEd5KlzLYzwTidC8IqPBoskb1S2wxM4cMdxfbdWakVpl25tELfNy
	j615fzBKZIB37vxm41150H0C4dgXlefGQVe+Jd5kEs69rQ3hZebM/wmgaFplWKKX
	oDHeFXsJ77qBMePpvNYga8D3ABfy/uJwiBxoROvfdgLtqErHD0xYP8uwsm1T4Q05
	zhB4rH3rBX04XvcAqZPHKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=wUYhExM
	RJeVtPFOqPMzPbKjHtBvWIYREvKb+RihaRCU=; b=porAMq9C6CSG32JkCpz0413
	PwgKk40UxUhKCp5iEDsgg7Zp9SxaSnoT1PlIRPWRm7N0qJMjfO1dUywhyiXqRKBS
	OkLC4PnLw2sERIYTWOJ8aTyfHS+kDaEI7JKJNt1hokoEHTK6Krw8RGtaDZSJ8JBv
	zFGnN2O0zkWrqzRejkjpiCGO8BRqkXm2GZFUPd7sVGqYohA69Dp+kNgoGEoT0LWD
	13mWISeQ3pGcv2vD+voQl+DOHcur5YEBTUoS7OC+zP9oAmZI9HBSwhjDYapL/+n8
	C5+MwKjuJJJkZfzb1Bous4EdSZ/s+AgvSEfyIlwVbyA8nT+Ko+o9Dz3OOJRmAQQ=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: QT7FwLPIgdhUUQT7Fwxs9g
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, christopher.w.clark@gmail.com,
        dpsmith@apertussolutions.com, dmukhin@ford.com
Subject: [PATCH v2 3/3] argo: drop argo prefix from argo_dprintk() calls
Date: Fri, 22 May 2026 09:52:38 -0700
Message-ID: <20260522165238.844649-4-dmukhin@ford.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C6:EE_|EA2PR16MB5584:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d6b9ea90-91f0-45bb-7bcb-08deb8229378
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|22082099003|18002099003|56012099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	VnUaKgb+o2RPf2+5g/xUfcU8zsKb/JZcvRRD4vsl4T/CsCngjX7fDjkmgq6XXNLzlFVyTvNHAlw5/L+ABw+M+kwIX+b0OfVGe6xYKY+ttWz95LXVPkW9jXQh7O2iLhpgKiBYa7ZdmF6otHv4DFDPwwiS1fXRUETLYhWWWk47pFODarEX4JEZ2WbcoPpKlbh4miLX6FlxGqfMdd5MlTmGMtxal/LwdQ/bT0vlKSqJKnVg2mJaUFYX9OgPcNpmU1SJD62IrtZta5c8kAiZhaagrvxFMTY30ADqhm8a80tmKKAxqYdyK9y558ewPcvuT3TS6JAqnomahnBVQrdJAhDRGJ3GmKBUeDZU1kJsl9M2SJ8w89TrF2yx9GfOzA9qSPtX6ZKPKSh6pS0dssznn+XsXnobI7i55PJcfx2gP7l5fSQkAPxR0+ukWieCEPrVwKgX21I2HDxC8hBt9ML5ssPhbJoGJsyg2K8JlVAgiRNTbHbNGPFp+FE9fm5YDgfEfWF23fy0TBI0ENahgCpy+udznY/+Lq0P3aBTyKH9PPRT6XSmESUU9RtdDq6MHd44KWO1/7kjFuzK4QkhekEci0iC/L50l8fd4j/CCGfoP269+C472ySspj1aqG08/yd9Jc6FLSg3RXCCwVtDGzQj4yClClcs3w2+oJ51Sm2bvytbNzTzOX1xCfGOKawHAnFqF2O/KJXazC03Yxm7dVOy+b/EakPCxL3uwVi2iT07yBkvvz0=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(22082099003)(18002099003)(56012099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3SKca9K9Sw/yXHNZQO+aNO1dGBIl9RzXNHpWRjbXb1ttJ785/1FSGW+2fmlZgyFviVK3yqjCaveF430ut8MV2oUe2HsaaVe4eStExDdJbOPYRAVQyfQ/kWAnnwUX/hav0W7wBATwSS8xtxZVhcV6KxaLbvkHoJ5uuIbyg26sW6eNk1PTgIy4WO8vzwqncGzYNTJiiQVObaSGpL/IUtM3dOyP5S4rww+4khuImcPWHSFuVQ3VMB6TLB5J3Soor7/sOCROAK37YC1DUBRl0Rcck19qsYUx+8JBvUrT0OqEJHPiHVhRik6IcVtOTJ0nfb6FONfHC0RVJKRFPbNTA75PjK4cKJKQnqfa/IW9/KqHKfoyn4JG1lI39dVjDBDU9STsyVJrHZoRiViqCi1gkIDBq2S1hSAhB0uiAaD5EuZc3pfytaQBrxSZ4fw9uHL9504A
X-Exchange-RoutingPolicyChecked:
	RuWKIj5ywdxUYYHQkzOzrbugB6+oexsOEmtg34ZFIvWPJkww4NvKMnImCyIhuj99DucVIydxvsX1KCiiAfg7aWHuee/W2g4jwqGrzS4LW0JKlzdd7AfhRDTZj5xYWaScHJzcuwsQ+hgJRsxeYXKuLQccI78BgKy82g56/dGRRECuZFdHmjpaMBI89BDT/6EpQqIAjIa/HdE0Zb0oNv9XW4bCTofQ/lCtjnJWq+NIyM8dLzdRuG+zLWrpxSbIcsR0ilGshw4U6ThF6I3Axtao4Pr7aWk1TNmDuPqPel1Ocvoo9sHXSyevBwvFk6SvCp3o/SvzLrIxNPLre/iPSF5n6A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0aZAZUVcgVHUJEAqyW+Mnl0iPsLW/Di8dtNl6E/nxiEiU6seZ/z/wZt5xs/DHwV4PX08cokX+U+efOXf5bv1J/4Z4sMWTGWmaRcyi59wx8Et5/mZauGpG3rfdTeqJ5amQtyifRX9jg8hcuSDSCDngBsSwju5w/gb7mQxNVtI3fDo4uMDpnX9/TD22nB3wDlX7O/0PZdncZzsWhbdaqx0cTRaWvY4QRuI7BLc0g8TvlPgB55Pv/xsFQYQfWot1Bu2KOTb7r4IOLnsW04VftiWFo4W5R2+qaQMV/Xt5kce8ORKkMO5vkmtLDi3ObO3pzTwE0qRj3QCRTG6cTpLxZaLkTUJzF6YkVYiBv/GtM/beNLaGTR1s/1QPUkK3ETmO/hZWhvtimdjeC+9D3fk2LY+faa1nHhp45Nwp0avGtZX8vNMp2SJa0dKxDiIt5zbieugNyxC+cPtzjYywbwZbV/Tj94jpK6b898HtjYHPEu+VwlwXr4+w5RoxMX858frM9efUmeLpAP1qHMy302pverOyTucmOok0XRHJ4KyxIBFFN+werpMB6GSStTJyc5Ge+Hv3a5TZjAEzH2JiSBzzt7DhhGWoMfvJXQBrB2x87B6mvnSNZESApBvbkpKuxZ+iXHXllaTDHlo7YyXrEU8mf8wnQ==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 16:52:57.2922
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6b9ea90-91f0-45bb-7bcb-08deb8229378
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA2PR16MB5584
X-Authority-Analysis: v=2.4 cv=UptT8ewB c=1 sm=1 tr=0 ts=6a1089f0 cx=c_pps
 a=V6MklVWPegrOQeIbI7BYwA==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=NGcC8JguVDcA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=dw5MciS7gY-znkhJuOLE:22 a=cbNQJ9GKAAAA:8
 a=TweWIa6zg6WzoLAQ39YA:9 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-ORIG-GUID: EyXdaORpgwsxdcYU0v-hYTJvAAfqj9OE
X-Proofpoint-GUID: EyXdaORpgwsxdcYU0v-hYTJvAAfqj9OE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE2OCBTYWx0ZWRfX/jaQGJJacz3Q
 b9OuDip6b2Xz7xRfPNHJZJBgRuhCjLKZpiz+II2FOM1x09dWdy/GvYn3+lzRc3QQZcabZvPlMMc
 B+kMxGLWlyYxDRzo4h6NtNKhmixTJfuIWTMcJsCUKwngdA/tkzWoziGgoT1sGddRKzwFoA9LnLu
 nC0tc3aFaB/aVpcPQD6VU2GKUEFREWPhNKo3exXm8fQMtfciYMbLEcEnR8/N5kZrc5NTOWUFIg1
 afJ+xnMYB2RJJbhD365Sdmw4XczsfTiiue28U8M1FhGKptQehmAi3blXf6/nu+HI6iA+wXXceZZ
 4UgTgB3gzG+uEPQYk2sBod01bs/UHYu/In2WCJGfF/pZ+PpCJwf6YxuynIZ9+5qn41kpFvZobz1
 ZbBY4mGNdJv0Cjh3nKZn+L6dinox1YhFhfx1KGbcUqSRxgxrIPfdzqB84ryUM3jWOuPpSdKoyD7
 tqU1GUalTj6FwxqSJdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220168
X-purgate-ID: tlsNG-c1860d/1779468786-B6368DB1-453F8493/0/0
X-purgate-type: clean
X-purgate-size: 2334
X-Spamd-Result: default: False [2.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,suse.com,xen.org,amd.com,kernel.org,gmail.com,apertussolutions.com,ford.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:christopher.w.clark@gmail.com,m:dpsmith@apertussolutions.com,m:dmukhin@ford.com,m:christopherwclark@gmail.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.981];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[saarlouis.ford.com:dkim,azureford.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 21EB05B7C97
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Denis Mukhin <dmukhin@ford.com> 

argo_dprintk() prefixes all log lines with "argo: " automatically.

Remove duplicate prefixes from log messages in the Argo module where
applicable.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v1:
- new patch
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


