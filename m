Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IvZEsGUD2p1NgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 01:26:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A49455ACAD6
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 01:26:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316100.1585673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQCmZ-0004OZ-1X; Thu, 21 May 2026 23:26:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316100.1585673; Thu, 21 May 2026 23:26:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQCmY-0004ME-St; Thu, 21 May 2026 23:26:26 +0000
Received: by outflank-mailman (input) for mailman id 1316100;
 Thu, 21 May 2026 23:26:25 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wQCmX-0004LG-QS
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 23:26:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQCmX-004cIy-6e
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 01:26:25 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a0f949e-5cb7-0a2a0a5109dd-0a2a4508e712-2
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 01:26:25 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a0f949f-63b5-0a2a45080019-94a38ff1984e-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 01:26:24 +0200
Received: from pps.filterd (m0367128.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64LKEe513214048
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 23:26:23 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com
 (mail-eastus2azon11011008.outbound.protection.outlook.com [52.101.57.8])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4ea7uyswva-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 23:26:21 +0000 (GMT)
Received: from DS1P221CA0006.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:451::19) by
 SJ5PPFB091F0E29.namprd16.prod.outlook.com (2603:10b6:a0f:fc02::ade)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 23:26:14 +0000
Received: from DS1PEPF00017096.namprd05.prod.outlook.com
 (2603:10b6:8:451:cafe::a3) by DS1P221CA0006.outlook.office365.com
 (2603:10b6:8:451::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Thu, 21
 May 2026 23:26:14 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 DS1PEPF00017096.mail.protection.outlook.com (10.167.18.100) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Thu, 21 May 2026 23:26:13 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64LMsd6E1923795
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 19:26:13 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4e9u9ys3q4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 19:26:13 -0400 (EDT)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id QCmIw3unChUj8QCmIwNjpl; Thu, 21 May 2026 23:26:12 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=Oiw
	CUSWzsfKuW30+2bJ+fcFpqLsWsgR+bYHn6BG+r88=; b=IBPc6OOHYvoGkG1BU4q
	PFd8dAJM1u7tNLaVGmPjZ29UZ8hOo9M1SNNXPCOrRtPD8MEc5iaOxcGHuvJR4/Zh
	uzU8xTi+4CCGtDYtRXpCyO3k9LfSaMJsxoxrJA0Wl11iNOdyxGtSM4fgmW9RgSM/
	RZ+VnMZuDUivgje7764HRxXjNj5yqOeiA7Gfuafu5/FnHfPibozD+/3vN+V+Khp3
	H7pMJZzPfT1Oc+jDT8eNFcBWaqKW5L9XZw1QnT/+JJtDMMZSUu8iUZFCnqGAbpus
	8bhlL9k93E5F3Cjcx1CVpVEWJHPO6dYADpP1GTM44KkMVP+9MiAhR3nma6W9rQP5
	iDA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OOE08tyyQ2cnAG5lo1Wms7wRgElEd56NxFM2sfQynXgh9T0SktrASeO49tKrXAHD+Q3+aGAu8bVEjpn9kE1IS0UiJ/WjFU62FTRYn3Z45fxfI3jSuSZd2C6yiWMUTH1EtXdal54BdHQUH+pU4KDVgGwhiuPicKnVfFg/sf/mq24N41MlG5+Ngu+sOMCxdb8J7qb9rYS1KR8jA7TadV6v6j1m/vnq0yEvzY6YtOAOWuox3biVR7Ix9B5GW6D4qGYIcVI3ceqY8/wqvDxSbIsoElQ9joYkbNV3QEdbPWuUCUg2n+0bfZUhc0S8IQxWsMDDTBev8WMjSrXbcBU7dP8dBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OiwCUSWzsfKuW30+2bJ+fcFpqLsWsgR+bYHn6BG+r88=;
 b=OE+RD7haG5CBuGUHFQ2VqM9H/cmYLuXTy141lQ+CKru782SNremdPv6RyOkDbltC4rKv0Iv6k5dhJTNtUwEIFLTyLb+ABLUkwYKOX16WjbTieX+xmQveAdQM6FCYkICDB1RoIQBKZ4b/N5IvZ/zh/RLZXB85YJF+HFwu7HBsT674XKC2osWB981PBYCY9d+K+RyDEEiJigGppA2xZNZbtOgbrBSOORf/JchVOH8yyZqexlJ7XnuTZKy2akYXpW8kTiC6pDPcxUzxVXvpH7+d98B/2iKM8NwOeXoh7WJqHbukejMJRCeOWIS/lIjJfeTvDrwahVK3uYCceumLGx8x6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OiwCUSWzsfKuW30+2bJ+fcFpqLsWsgR+bYHn6BG+r88=;
 b=SsN9hjua3o70Q+6s8IKGEP4tPX/2IWUMl79J4eGJS7sEwo6zY0UgjCw3Wy+MLqA5BEzKlHJCQXvzHnKREOChQ68qFFNz9o73sJbSXwL6wnjzGAZZydY8FzqHylEQIfz0XrD4SHxdaFh12iYrcjpfr2HX7nIzru+P0eGR88msUkY=
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
	ppserprodsaar; bh=OiwCUSWzsfKuW30+2bJ+fcFpqLsWsgR+bYHn6BG+r88=; b=
	n5CLiYZ/50Mk6ZFswIjwKIi5oRGO39uWAkhZIs8m3D3lzFcSpOGKuNw4t81pTcBi
	PJUllaKJIK1vdZ7U4BTL01Ze7GuAgUxADJeobNguVBg81BOTcmpg9jtQBo6P0hig
	RYyPiOpd2140jFq87nvesLstPolUW80b5c/eszQZ71LkmQWxsjDZNQf5tgNuH9Fw
	Vo9dxRIMXD+8Z79Quxv8a0cKf7J8gJgB8JOjwDKzhIRhChvvmDKoEEqvNlZ3OO46
	jN7byD4Aps7kduYYbCxPZGdEpFH0QAc8+sIp33ig8sxQxpfS44XNJgEHyPGzE0eS
	OX9baVtt/j6lCwrFj+zK1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=OiwCUSW
	zsfKuW30+2bJ+fcFpqLsWsgR+bYHn6BG+r88=; b=MRf7RHUOptE+8moiG1kKdCa
	NGTOFYY52CFDLSIPYHhoeefDCcZhhwAXdL+2gekGjqqe6mojGOsdhTmovIS+GuWN
	Utf9VC6bW4ZwzGODqiYUDKRvbufJPMOec05/T3hPApp7s0sh+kcxreawyo8c9QUo
	yh8SKqyV6Cjeu2lpxFAl8+LzHqWQXWHk+vg02Btvb0OmusHptyq68xZVT8jS8ZfK
	BYqvHBFs3ZE8nA2zaCMh/8+3ra/5peFno2AzuTjPSI4TlXOLza/CbIW5FeL6I2/g
	JA6b8bKHaXFG/jhmBKKn43R0onBHmHjUDl5O8gWOWct/+GV+sRbxCV9uPCcKK3Q=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: QCmIw3unChUj8QCmIwNjpl
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, christopher.w.clark@gmail.com,
        dpsmith@apertussolutions.com, dmukhin@ford.com
Subject: [PATCH 1/2] argo: lower level of noisy connection-refused log
Date: Thu, 21 May 2026 16:25:28 -0700
Message-ID: <20260521232529.694570-2-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521232529.694570-1-dmukhin@ford.com>
References: <20260521232529.694570-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210235
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017096:EE_|SJ5PPFB091F0E29:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8617ceab-3377-40a7-00b4-08deb79059b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|11063799006|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	xYIrxKqXi2gqqLscNBbeMKcytK5tVxyZyk1ORGmsii1wGWtwU4PT4+vu+jvpByVoEM0AT9Y8ojCg/Irybog+RAQSjY+1T1I9PoGlMfb4bnUNSYV9gEEzNecRVnEkiGrmz4aS/TbNyb24spRGainmlIOqiuVmvOgm0XgICaxBoHNF50BB5jU5UE1Qm+SSLmkNl4p32nPbtfG8lzEZ+Rdu/4bUDs5mhq9mKHXys9LWRkJxQzSM4CehFeXFXi3atmbSGDRbnPkV88zjNpy5revJI/ANIOjDIbnS9a23blK4gyVCwZiXCFhk0uf/H6iJxdJoB3tmcZJOJocIuENfFMtlvab1GnFGLrvU0mJgo9e9xWIykjUR6xz02+gDnWwN/uNm0kE3QPMixjfDnFfUfYX8ZHVEaRF5gTthlfxPB2SJ32BsrmeyreWM9Rk3C7cKETjLVrdBmXmHe4mPB/6LfwHTadZKjiL48XAwNQBdYUQU5iY2xtIlf0MKmDNUT/xlIcfwB38rPGB8OXcYu6j0FTlqDJb4E7P2M0O4/qQZINa7UzSNIk/j+zxYTpqMrzB/z8McbLx6eHidwxt7TppKpLgfhE6gKAjqpJJEHAYZR7n9q052h7gABA9lmK0PnLq1kJElgsRHwGACc4hvng5cbSvqu0SYJfGTs8ZVZJWzsqHn/mZSTZ9vuUE6Omc91yayGiAPkRQyAPga0AuiB74J+DBxVVUx2P/UzPzo3PQiYXjm38A=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(11063799006)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jFh3vzQ8gaHh6nPr1aoXIAMrUFXtw1ftWP00BqH9X94F1HnLCZSIeSREEwqIlkUX7LSbkka4ti2mCizJSvtuyVwhohuyqTq7tjPb+9aRggryxGTTooTWFivF/1I9TaWAWZCzDEcJuhF3jm/3kLNFfUexgHb7Nz5dVwe3CD44P4cFU4xyA8a7yZW5T+COfs0BFvKh8WAvndCRoYq7OYY7vCRJaty2/Q0jOeVWiJWVlfwtMGuFbOMGNtMDII9H13eXVFh/kcPDucjOmBbSVSNCgX+vCqjDF4YzibefO0E7C42RnUbeaTe/ZDGlu+JzuIkYbne4LJ3crW6MqI02glmAibkJoomfUvv8+HfAe6zA54//PEuS5BldnfOOC1mCgp9sazn56waNNK0yMJ0RFrwLoUjgeMnRWZpNXJL2+wMxdrvY18gRo7GYBNBr7TYk/L+E
X-Exchange-RoutingPolicyChecked:
	XQXMClmJjwrSqZkrsZqDI8i5UfnM2TApa0eUZVlJNYiloIEBTZnvUq65Q4RNm7XyQ6T1Hs/piIbZdDMrynohVwGjp6UstT9pnxDaU4WeDU2citDlMeanftFRFhp5sxutX+XqNfZTujW2hs5sk+mEOPW1kpV0HegruC0eYgzez6u559BMuKbBmYrCM917NMwbofQtXaU4+rvGbpXQClOFaHc6v46NY1b610h3sr8C6lnFMuho3jTfL1mzmDu3oO5osSyfH9dSIHAKACyQwvNVBz5Ghy1aU7Cb6zfZ7EiiPt7qgIoEw75Q0RESPae8k9q07d3JckZZ+J0ISC1bsCipQw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lRK8GcVSKvrOU0rgfTHl2yVF9DbW0ya8m0QEzSpTwpF/9lm2f6BtEbi9i2mu6n7N47Rj5DrMVigfhfFTiiTnrhTCS0yhM+NzI1iNjS5KOIPui5UZiKbZEMHcxo9KteSZaqQJ36kDLWdZRDGZ3qpxLn9AdMeaYzHobWU13sKV9E+Nfe94vq2mgV0rnuwai0udTK/SC1s1E80wXMVHVScYRr0HL2lhFrvKGGksLfGvCMlOp6RD0XwH2ljlkwaxHGLsRahBQd2xsVHE8omK9/6VXFztxqf0BkdiEtK18LrCxbfuKn14DLWv6sNNyRix/kFBXzQFHD4iUuLN7K+0qvecFJnw/4bJxhVAhr/lJWjEG+hkTIk7m/QlEqNp/fGLFY+FATW0svMZQIinykv1H/PrvdZ2A+ONIIiSjvp7x++qUB70cI9vQxY5nRY/J2xGMfTl0GBs4klAOSwRLqXiO5tD17wyPHrljXHwi14Ovub39jM4C2aL6JPPpqSit1wLyitKCzXnPxkpF//rX4hIs455Ahp5yJMgSL6pXOYCW6LD0BoKxb1P867I6f/+zlUXe/Sexs11c136Mmf7FTU+25+XcbEVGasNdI6o4krQFl9mjaS29vYfhbrBUaWb3HwNq6uCR9LuoLYSIu8w+Ds69ZZHFA==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 23:26:13.9099
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8617ceab-3377-40a7-00b4-08deb79059b2
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017096.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFB091F0E29
X-Authority-Analysis: v=2.4 cv=N+QZ0W9B c=1 sm=1 tr=0 ts=6a0f949f cx=c_pps
 a=zYHeo5UF1QI7fA+G+QDVSw==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=NGcC8JguVDcA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=WER9OelvoqQQjwJToBYG:22 a=cbNQJ9GKAAAA:8
 a=54Me3sMKcSjXOMnv11IA:9 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-GUID: -jzkl2GOF2LGuv5leACWRrBcLIilz3MC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDIzNSBTYWx0ZWRfX4rWyOsW/AK3w
 O3ZWQ/OrypNnZ0ZkMEMlFlok38GdWQppVzNJdPvIlX/EctpHufODPnBbK3o/SMHQ8Qetd7ABR04
 nYcGbzeAgx5hHflvZMOwy4wbQHUJdU5+PUXO5DXIZAky1IvyUJRFoXmyZZgX/Sk9SQ4YwJ360fz
 9m32B1yfJSEfUnwcRJ7yoJ2rOD5WrL+z2G4VHXGZjjT2qtsYR4pjGBSRIecslLfj10vvD1JToau
 PziUXziHyYv/1MRMYI+Sh/VXcUq78C+B0jRScRRO2B1GdDTFSSo5XG8ypcLRGuyKwc7lyfC4xqs
 ebNE/mkqNKmqnPFI/y+DRO9mP8fpbnwn/Yp23qNWnPOykLMcGuGgI0jS46ppHy5se3ziMZI+pw3
 w4DLDnWbdBnPqDJ/5/1MyWJDAMhObgw0FXaBRVMvWkt1v4hppOmZoy6p41KWZvRCqBvfQWjm38S
 uezMK2KTXCBk+D7iXGA==
X-Proofpoint-ORIG-GUID: -jzkl2GOF2LGuv5leACWRrBcLIilz3MC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 spamscore=0 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210235
X-purgate-ID: tlsNG-c1860d/1779405985-C447DDB1-7070168B/0/0
X-purgate-type: clean
X-purgate-size: 1224
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:email,ford.com:mid,ford.com:dkim,azureford.onmicrosoft.com:dkim,saarlouis.ford.com:dkim]
X-Rspamd-Queue-Id: A49455ACAD6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Denis Mukhin <dmukhin@ford.com> 

Lower the log level of the "connection refused" log line, as it can
spam the logs when a dom0 service using the Argo hypercall tries to
communicate with a domain that is still starting up.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/common/argo.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/xen/common/argo.c b/xen/common/argo.c
index 28626e00a8cb..4f894470698e 100644
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
+        argo_dprintk("argo: vm%u connection refused, src (vm%u:%x) dst (vm%u:%x)\n",
+                     current->domain->domain_id, src_id.domain_id, src_id.aport,
+                     dst_addr->domain_id, dst_addr->aport);
 
         ret = -ECONNREFUSED;
     }
-- 
2.54.0


