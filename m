Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OD6yNroXFmrOhQcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 23:59:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A85A25DD074
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 23:59:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320179.1587551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRznR-0004VK-5G; Tue, 26 May 2026 21:58:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320179.1587551; Tue, 26 May 2026 21:58:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRznR-0004SQ-22; Tue, 26 May 2026 21:58:45 +0000
Received: by outflank-mailman (input) for mailman id 1320179;
 Tue, 26 May 2026 21:58:43 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wRznP-0004Pf-5W
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 21:58:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRznN-002NJd-V1
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 23:58:41 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a16173f-e002-0a2a0a5209dd-0a2a4508ab4c-34
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 23:58:41 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a16178f-63b5-0a2a45080019-94a392177be6-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 23:58:40 +0200
Received: from pps.filterd (m0482517.ppops.net [127.0.0.1])
 by m0482517.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 64QGZiPr1321050
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 14:58:39 -0700
Received: from cy3pr05cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11013016.outbound.protection.outlook.com
 [40.93.201.16])
 by m0482517.ppops.net (PPS) with ESMTPS id 4edf672p92-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 14:58:38 -0700 (PDT)
Received: from SJ0PR03CA0342.namprd03.prod.outlook.com (2603:10b6:a03:39c::17)
 by EA2PR16MB6255.namprd16.prod.outlook.com (2603:10b6:303:254::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 21:58:33 +0000
Received: from SJ1PEPF000023D2.namprd02.prod.outlook.com
 (2603:10b6:a03:39c:cafe::6d) by SJ0PR03CA0342.outlook.office365.com
 (2603:10b6:a03:39c::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.11 via Frontend Transport; Tue, 26
 May 2026 21:58:33 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 SJ1PEPF000023D2.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Tue, 26 May 2026 21:58:32 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64QJ1rMm1212577
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 17:58:32 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4ebuapbcex-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 17:58:32 -0400 (EDT)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id RznBwe2WGZ2SgRznCwFfCx; Tue, 26 May 2026 21:58:31 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=HFF
	gS7LNzprIErM29s6LiHfR1QmYVZ42sg+AvwyPl2A=; b=ZDI0549GoSQbPQueEeZ
	udXt24Vsmc6F66FcIVc35oY7wVZ13N3KQ1l83/IuWT+YfcYWp26tuXSNkzeQPEn8
	Wo1AI5j5x/GjGdHkkI07Ylh4MmCZY0y1oEZEETQXvvqT2QDoSay87LWL7LaTYScg
	be4MxHnEg7x+4LoGB+WPp+HdYZ3Eds47T+VAH7PZSqQ21qbxpaTV0M68tJ1D7pMt
	AuWMOudGy7NEdRXkJJ6hXCIFPqDNOhXPYNHmtlTw7FFfHKwMagVMcwtcADV5r/sG
	2dG9JNgmp4z2AQt5toQpNydPapY+enAaop4IAS9LDoW/MAR7XqG1zh5Al9ScF+im
	SCw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dYrjcApYWhKRuQbyPxhPrYPXXmhXSEwjyaINDBDF+/OntY4StONGyqpZqCFYs2b9pY03QIhCQ0P3tqeGxs8aB1q577fsdDzCkC2/04XEppSXVUWU6TGg2KL2dgtU4a2ZXrIs6mjocxosH3eWNAP91euK7n33yGMcVtLbYI/KYfZ4TVfKMVNMkbARmY5BAQPj35Wt/z6moUgVHKINuMvvSzwYZeKymHYzG0CspFNDwX/vrCn1ZgdL0pVqXUBHuiIyrzI8+hQ53NSdg5j9mu5LD1dSZWHFGPlysP7ybhCoj9M2ChLgpCQtEtaoMVY1rzUG2ahiZINUwOSZCuluBlZ2Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HFFgS7LNzprIErM29s6LiHfR1QmYVZ42sg+AvwyPl2A=;
 b=K/OnscqMtFyA33RH6YzeM3N/nlmOrAoMx0Ke41HL14kqrfNVduO9n8ADtICupPjw4z6VL23JltxvQE5dGGt17u7A9Bwm3n60PawzypIdPYLW1oiX6lzeCyFH1Jz+lFIPrWY/RI0iBLq+Usf584yocn+jsv3+TE/wbStqxiBkjXZyHMQPj5blSTD2xAQsvq5X5gzIeoA1Sk5JgtJZFo1So2qt6w2YKPf2YB5dWd604JtI3HYC8GtSorNShIhFT2SxgfqKkiaONzPLD2pwMZfEXhlgnhwXxmpBH/YCiLp24EPs4+DYwjPtsofZCYz8A7DbhLWCaVZxopWnTtNgYZnMnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HFFgS7LNzprIErM29s6LiHfR1QmYVZ42sg+AvwyPl2A=;
 b=if68sdUnnxvwxjFa3igKx187+BV51fmr8zI+VeG5dHhI+H69P+6ihQnUk8VRttE/pv7UiIn/dxWLX2MgfC9ZUNrGzsHA+21Lj8bw1wO8hqjP2zUSe57xWzX+EwfmvTt4/PA8UYIi3zwiVOG79NjXssDRfyw8lNnsyjAfgU7Ppqw=
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
	ppserprodsaar; bh=HFFgS7LNzprIErM29s6LiHfR1QmYVZ42sg+AvwyPl2A=; b=
	j+uQhqds8wc23BJAUbpUh4zGxtm+oeTzyxcN3awSd7V2anqs7eTIMiNoTLDdAjt0
	LskoBVdkWcSWkD6ifX4j0RPEVbD1TsLEXrXt4dlcnJpmlrfkIw662S29JHjxFvV4
	BKBrPw7hFpyb0zhfclDG6yra+OaYjayjjz20GimlUV35tFYVVBvaffQrQxZU/2+i
	1WdzUMDVbspWzDQj6ESIycJWaTNpw7FfQFuju9F6L3R0KAGysxld8JaP0kLfOTsD
	Cp6EadikXraM5UMmw2333+vYmcNf6mWkotcWA3jcR/7ybxGFpi231XTP/ykJmHAc
	NIGlkT+pHiLrKU4lXVaOlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=HFFgS7L
	NzprIErM29s6LiHfR1QmYVZ42sg+AvwyPl2A=; b=dao/8CiYwsbpbxnE1pIRPIg
	EmCOEaTSDRX2OgcDqp101tNkGfg9u74B7nlvjqaGO+3SVufJAIbl4M2HxmjO86U9
	0fChiRUfnndZnOj9jdaOz02uaLBoFCOZfGOQUBOooDusRmZzs7XhkNcqjMXv2Ynz
	fJOhB1H5mRKxnxl3sjQtjMxcpMF9MiVkAXjnrqKio57hBwDrQt6gdza2y0LWv9Fc
	wM82b6TXHFGOHXX0Vk+zHzR+br4uoCw+xcZgueKXEAutVWjO36aNw1umnDK8VZKj
	htnq1u/ywUxaYwFHNQH0NVWO2NWckFLEyH+aHUP0HyFlRA8vi9bI68bItdctDFA=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: RznBwe2WGZ2SgRznCwFfCx
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, christopher.w.clark@gmail.com,
        dpsmith@apertussolutions.com, dmukhin@ford.com,
        Mykola Kvach <mykola_kvach@epam.com>
Subject: [PATCH v3 1/6] argo: lower level of noisy connection-refused log
Date: Tue, 26 May 2026 14:58:18 -0700
Message-ID: <20260526215823.1452619-2-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526215823.1452619-1-dmukhin@ford.com>
References: <20260526215823.1452619-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260194
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D2:EE_|EA2PR16MB6255:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 37a2ab89-b8c0-4452-5159-08debb71eddd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	EfiPWXNjHGj+AtwWnim+cW6K34D1ze2afGTFVvLBEX292LY0+TkU3Y05N4I42+euAuhwAyvybf/IK+IzG8z63eOIfxDVTGYlUZdc2VRUSY3H2ezidGOIo7vDZeMfOAis4xdb5cXYfqWBZksvVK2hcidbYnI3Z85UJPq62pT7jbBK7z+Z/M6+hkkG8+MsKWWdlk08ktRj7Wq4rvj1uXjTv5Bi4bjEJvHuK+Z9l95yYVhhjT2mEmtUG6Hy7E9iKuGSHhqJ6rjieRbAuj6F/Kv7FSYOdFgdYVCxnfjO8tss86UivIBAnnnyjzB6hst0/sxpqrCG8KYl0uYshoTMxe8hj2DOR7msG2fsgOWrlwyF5vQrTNkB/zkth5MNqMlWYxSvW+o7Ivp7TxMG/klmcURJr6kKqRlWiYWbFZB1YdexbGKIz0jJy/CH0nbh/jLReaGZ+do+cWQtTfzqNyeP7vgqF98VRyJyb2gyZ1r5k1/H36bz8xJiR6Pmr6WXhFxKafYHh9khkG8aT9V971VDFbMM6oISSH5AT4nubU71n2iU08KtyGKLNmYO1Wl6pvS9Wf0PM4ISYUiVS8Ao+7N/JT6K5EgmApiRngKI20OdyT1Qm4YGazH9RJv/r823Mh08deR7DaQEMaYhtcO4IRblfz3o57dL2Z+AQCJl/pOPXZuBFk0Bj/OPs2nxuSGtXOAQLeFXNPv5ZVawSN4wGgrDhpkH2wphiTD8+Pnf9dIN7zFjucQ=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8DJnbAAJc88Tm/9PyhR/fhIjmL/Tp4oG+GLSUMxCSXed2/BpOk48BrwOK1nbLgQn19pNUMYH3UCDhgOvSq135/ytEmdFvq7k6IWBsu+EUWtLLBO/5eG51+JAWl7GyeKZsMimhc+jxxQow63ybEB3BnuHcodFA316F4FWP3eboeAar5QuhCltWlYraR4sHI3TvmXUgZU3qVS8W5H5OnXJeYRvq5gNzOxeDhqhijrbXFdpU3Slt1nvioWY8a1Wyrc6w1rMdCoOcjf6bQm+4/Knwe5Ryv490IifPXdEbJhwheX5OT7xVn9OywEJLH7Tz/8MlVv+42beTkKShTBDsp9tGKFAzZRtunPyV0LK7FWOK51VI3dKcNY+wGYu5oNATzJxA8l48f+3LDVDVIRDwV5eCJ2otuvZMkXDkbZzk5QXPKc+uIoJYQUbPAPdOVou8QRQ
X-Exchange-RoutingPolicyChecked:
	aCh3gztvSR2mXdRhvAzmTgzNRn8kzpmTF8yF/uHKEyXSwx/3huG6rLzhanyQOr32RULS7nMD072jWTtmKoU8+MOPiroLJ35NHnofs51nhd+06GvGCBhXClZRr2E+h1jflqHDsH27bcg8pyYfL0Vnl/yWTUtYtmf4gDjOHnAXG4oCioaz5GMVKLbeMwuwdZyknTlXTCI0bAtNj1lDxrXyRcPPp+AeC4r6+WvTP5OpmNw8c4yYDeP6LY+eB8SsIHE3I5cqxbECHEaFKIGSyzVdOrPKbBoerRbBdU1/+azpouSQIXwQQQQzGaZPBPwIRwGr1wZSous4meZfrdGzfA0PCw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	S5+N1A2H2WHBLC10KIiE4m3bmWzO97RNxpAjT0D2QgUV5Q6a4aWU0yCRQmPjX7jy3zTnHRAwA5E+OVnuqt9O9g/yJTHYZKveQParJ8BVsOtAIzb2EIMcOltwFKhnShyWjy9xp56jVpzh62OW90M1hA1cm6/IMn8wtuOA3Pwh8aB2bzOnjOzLV8Lt7+dRSSBycAudOUQlWUepzyDYTwdaef2mh5DpuhjoEqrbia1C1AGxk5/6azIq8vnsP9ufKzEkxLDrBl28wXEjGq7BsTWENSwCee31cyD4DbAiTT7uMcK41PQLz+qYi/MU4i68QSiOVq3FD0wxh4q17OT4XYTKsnWCN/rDd0PBHqWlBJdGlMnts3XT7u/eMleBonmnybUvq0gQsDuFJjb1lNRKGqW6GdR/iCIsiwXEJignGhHRxarKynO0NKfzaDdAJTdKNkbWkGysjbh2Mk8dz7eCkZEJj58a+6fx97slUxts4G7DUx/Sy9XCorrWBszO57EYjb0SldMDOJBSXPdOd3u5nO4rt/nv4F8kFWBbIceCA2JkIxwV2knaxeg61wrQywgZC4pkBBeN+u7tDEiXDqqN+yZAJLLx5PN9deST5tVyORryWXCHy/81IJYCgMRx46pxDOB8QhZm1dsgkkh2bQnA5XWmNQ==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 21:58:32.9072
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37a2ab89-b8c0-4452-5159-08debb71eddd
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA2PR16MB6255
X-Authority-Analysis: v=2.4 cv=VsgTxe2n c=1 sm=1 tr=0 ts=6a16178e cx=c_pps
 a=YOgfsySBG6Gh3lLixmEA+w==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=NGcC8JguVDcA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=MLwXIh1eZMowsRZfVxRb:22 a=cbNQJ9GKAAAA:8
 a=DBfv99YmAAAA:8 a=UgAm-RWKtkRDnoEujesA:9 a=3whSkbs7g9Me0DR5EJEX:22
X-Proofpoint-ORIG-GUID: 65UNNJWLG1sSlqXgO9J_s76xDjDP1bj1
X-Proofpoint-GUID: 65UNNJWLG1sSlqXgO9J_s76xDjDP1bj1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE5NSBTYWx0ZWRfXyCS8CPpqfFac
 yAj22TiKTiEhwOzcM6x79C3AohEd3++jTvxPRHxOsdxse9CWPc83vyWiWoxNwb+sq1hpRDxaItT
 mjJsYrzgyzaEF0eZ5cm1iFRacTy1tE6Bhe+WyAwXlSrY7v/8tvEY/G0Svs/FAbCiOAl3Hv5zp/B
 jYX0cfPZQ5o6hFAYGG4mQ9K/eIFbe+/O+ujZUvd9P7n4JU+qm0Cn5aAc3wqDAGw7ClQhF6D8Ach
 AqYwphwBK1qDXtExd2lygF9rtOWZRP24Fouq5oRKxXJV/DHkhXq6/0Uqeaj24YLsh3NV3vOfTKs
 aKlFtoDYYKxf1ET6Mjp3E70Vqe26KSCvM5zU7Y1QIGtJPmx9/Eb75KqrtoZTnKIlNlVjyV3PL47
 koUb1RwDz16PLLDfDqmMvyOa6yBUa2h5PEfZ63LeW4SbnIGBWtpmg5Sq29HG72pw6THgRsFEn5e
 P/92Tf1LDHLOvpbzwsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260195
X-purgate-ID: tlsNG-c1860d/1779832721-BFB7CDB1-B61150EB/0/0
X-purgate-type: clean
X-purgate-size: 1443
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,suse.com,xen.org,amd.com,kernel.org,gmail.com,apertussolutions.com,ford.com,epam.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:christopher.w.clark@gmail.com,m:dpsmith@apertussolutions.com,m:dmukhin@ford.com,m:mykola_kvach@epam.com,m:christopherwclark@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[16];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	NEURAL_HAM(-0.00)[-0.981];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:email,ford.com:mid,ford.com:dkim,epam.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo,azureford.onmicrosoft.com:dkim,saarlouis.ford.com:dkim]
X-Rspamd-Queue-Id: A85A25DD074
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Denis Mukhin <dmukhin@ford.com> 

Switch the log line to argo_dprintk() so it is enabled only in debug
environments, as it can spam the logs when a dom0 service using the Argo
hypercall tries to communicate with a domain that is still starting up.

Note that this also lowers the log level to debug when the argo_dprintk()
facility is enabled.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Reviewed-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes since v2:
- updated commit message
---
 xen/common/argo.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/xen/common/argo.c b/xen/common/argo.c
index 28626e00a8cb..98a3db7fd070 100644
--- a/xen/common/argo.c
+++ b/xen/common/argo.c
@@ -2034,10 +2034,9 @@ sendv(struct domain *src_d, xen_argo_addr_t *src_addr,
                                         src_id.domain_id);
     if ( !ring_info )
     {
-        gprintk(XENLOG_ERR,
-                "argo: vm%u connection refused, src (vm%u:%x) dst (vm%u:%x)\n",
-                current->domain->domain_id, src_id.domain_id, src_id.aport,
-                dst_addr->domain_id, dst_addr->aport);
+        argo_dprintk("vm%u connection refused, src (vm%u:%x) dst (vm%u:%x)\n",
+                     current->domain->domain_id, src_id.domain_id, src_id.aport,
+                     dst_addr->domain_id, dst_addr->aport);
 
         ret = -ECONNREFUSED;
     }
-- 
2.54.0


