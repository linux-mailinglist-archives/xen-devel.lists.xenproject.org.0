Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIbFAMUUDWqotAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 03:56:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A45586A78
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 03:56:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313485.1583587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPW9O-0000xE-RI; Wed, 20 May 2026 01:55:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313485.1583587; Wed, 20 May 2026 01:55:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPW9O-0000uK-NL; Wed, 20 May 2026 01:55:10 +0000
Received: by outflank-mailman (input) for mailman id 1313485;
 Wed, 20 May 2026 01:55:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wPW9M-0000uD-Vk
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 01:55:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPW9L-00EMmy-CW
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 03:55:07 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a0d13a0-5cb7-0a2a0a5109dd-0a2a450aa8ae-42
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 03:55:06 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a0d1477-56b3-0a2a450a0019-94a38ff1303e-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 03:55:04 +0200
Received: from pps.filterd (m0367127.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64JLGTZi351902
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 01:55:03 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com
 (mail-westus2azon11012047.outbound.protection.outlook.com [52.101.48.47])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4e8ymtse2u-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 01:55:03 +0000 (GMT)
Received: from BN9PR03CA0644.namprd03.prod.outlook.com (2603:10b6:408:13b::19)
 by LV8PR16MB6669.namprd16.prod.outlook.com (2603:10b6:408:25d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Wed, 20 May
 2026 01:54:59 +0000
Received: from BN1PEPF00006001.namprd05.prod.outlook.com
 (2603:10b6:408:13b:cafe::9b) by BN9PR03CA0644.outlook.office365.com
 (2603:10b6:408:13b::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Wed, 20
 May 2026 01:54:59 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 BN1PEPF00006001.mail.protection.outlook.com (10.167.243.233) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.11
 via Frontend Transport; Wed, 20 May 2026 01:54:59 +0000
Received: from pps.filterd (m0426315.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64JM5OYH2047490
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 21:54:59 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4e7afru6h3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 21:54:58 -0400 (EDT)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id PW9BwBlrMFYU6PW9CwVFCs; Wed, 20 May 2026 01:54:58 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppford; bh=1D4UgvbHh94Oq8u6W/BBTtRllYP
	APk7p1yXXigji2QQ=; b=cKyHx+GMVn8G+bFgn2gDLDeednQG+eR1gA2T66xy09h
	0eXRZafsAboMaNkUroOC2Bxk5zOmUVZTGdBZToqbdAW1EFGB0crDyf7n/swK/HpW
	Xw5uOPPb4BUtxXZOV5AtebtBezXutM73tbwnSG//nOxZhjSMUYPz/0td0oAene+8
	hIjhlusO9ta50e+I0MSyCFqb+HI61MwT70NL2lrnFlQ3tzaw9bF0izIm/YabolKW
	jwhJ3ymb+l/rObOrP/va/ss7IKBtPb1CPGr53Mb6y3JcLcniyXSVtzJC2GC51V7E
	AaJwMCF+lImdUDEv2dmDDEgM5VP3/lbQHJbqTuaynkA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H2cddTvPR9/zoEdZn74Kfu/kjswMuBaJDq5ziBnTFIKtULNyNcuFEYu3dC5V4lxQHl2Wf7mOBZDdoWtcg8lwYIPc/UYQQWpL+KyQwQKY7+irmuAWggqZHZGZpMVkpLAc7vho7fILDocUwDYK/iS2de50PeccUCM34dgLzmSNsakBF0rkmylHhR7L8O7ocG32ZyJgH3EGs1e98x6xXVgrUmRcTlHJlg0NlqsyJGrpOo1nS4ZldRr7d9teHQgjfOFdxY2qJQGSMT+CswdDGdEH0JX+7hhHLxeb/B5lOGaRZj3ioM4S8W5g8FMhlqNyftENYDVIxdDlzh8OyPOjFAx1kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1D4UgvbHh94Oq8u6W/BBTtRllYPAPk7p1yXXigji2QQ=;
 b=rcwfmLq5zBsdANMDEy3TYNPewzuXyQIW+Wz3zM+TSuUDpFeQp+Lkrp7Gt5hhRZCJQGP629M7MT1TGnD3vz1cY6dFXwxGAJ8CGs7B2B+Ur9d+9QPI0f6gpgTPR3xyE4dRJKfi6OukOP/rpcYK0PB2dPZeeAVVYz+uVy4umsFANYvKhaT6oI96telVFVAT+aI2TilUgndC6of+FVHa/oi3dDQyHw+veAVMmtSMzUE5f2Z7NJ91qdqPd6LARonKTYWxCaLjllCcWHfbhI05t9MMadDXDn6CiZrK0jwjA/fGe+IJ2RzeKvOVRKBzq93IxaaU/Jqcif5oPP57wJTBJGCUnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1D4UgvbHh94Oq8u6W/BBTtRllYPAPk7p1yXXigji2QQ=;
 b=ij6NnsLNqUBrPXUIt26WmrgD9YRAvnzfKEWYZiLhT0jV/Cm6eNZOz15wVi2uzS6MEIMZ+9GnT2FEy37p2H766KpN/BD/5+f1pmRf0YhNCTBPjTG0QafD7QB9iM2KWcN3GYmn1kEG8/5GTpe2mm2/YhZxWCYvFphXP9EB/xRlhvY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppserprodsaar;
	 bh=1D4UgvbHh94Oq8u6W/BBTtRllYPAPk7p1yXXigji2QQ=; b=d+7bLJxX1Zal
	XmLXagP3P7jJIpS/WvKzfJcd8neuHZJZHMv0pavSwDwQlz9FnQnTbxbSlAUk+8qB
	8F7hD7eXMSQwwB/nxMF8zKuDZP6Tb0nmQSEf7oU1kMfWAhgYvZEG0nQxdwimJi3y
	xRun9I8OOqBzX/f21tIqRHBop2vYNJizjCA2ca59SAyO7fu4So160zU3B4imN3pl
	AddnJR/JRQLYCmJUz0aCjfqLXCT/LkFnJt3VMbXrczQpKXLregbWpxlEOoTYw91A
	Pg6XpMivzBGQPu+sfubzQgIcEgpWGgTVl0qtHlkV4r0WHneouNZgErgiLyTCs49S
	i7WjvEeC4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=1D4UgvbHh94Oq8u6W/BB
	TtRllYPAPk7p1yXXigji2QQ=; b=tdFUImluXI3SGkP/yHIXyh+t6M08feQL113S
	SGNxWqVHFScV9TQJF9AMg5BJvJ0thyMboVm4W1tpir44aMZY+ZKGs3+OBhGIJ8Uj
	sl3JTP/2tz5zJ94dFWKl5xjQHCv1pLXZIRPzpUX0kO8ceRwWl4I6Qw9kVwRxeiLV
	PkkmHGfoqkw2g9TJxorM/YUYvd+rucagsqsXTUaJaSr/jZa0qWJ5YTO2VlCAsfEO
	KpAm1tEPJKs1btXlRpz9KkxaqAUhv7iPLoq6JOh4RTD/eoZIOrRS4vp7l+i0BF9y
	iEeRHdPOHAAhvHleZ2FfhGzESzOCLOyIdTb5VoPNHmrI1tZ4Lw==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: PW9BwBlrMFYU6PW9CwVFCs
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Tue, 19 May 2026 18:54:56 -0700
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH] tools: Fix helpers build
Message-ID: <ag0UcD6QLjuH5G9B@kraken>
References: <7c5cdad207571e98ad324f07c7c754f79e8ce044.1779089580.git.mykyta_poturai@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c5cdad207571e98ad324f07c7c754f79e8ce044.1779089580.git.mykyta_poturai@epam.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200015
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006001:EE_|LV8PR16MB6669:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d6fd302-d8f2-4a7b-22d8-08deb612ccdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|11063799006|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/7b1EJa/LLaRPTfEM7ZjDZtk5Rj4awnrHB3cIiVLWSQ3Zj0iNb3ubjRS8/jrJrufriAIvrqllqY5pgvwVKRXl6v+4fjHwtws1AoO0SlcqbycmxJJTkhqXIyfwQ0QjJBb5FyPdz43WIntEtI9Btqt88VOLFRl8bWEC9PjoIj/+45tFSAS3c6EGC8p9KsBT0vkOIbeVKHwCO4KCJLujynoxcuUWcOv9kRTt5hfEUAG4KZhqIz6efKkhTqpm8Ph7wEgz5N7GRvGznzf3c5iIY7XUfkvCEoGcNmjbGG26wJgogRwvLkVfEhv6lZOb+zVR5N5F3TBqVApLsM8TmV3Av251FFaDjxDVaQHZYmq6gJAv2eVyxdWpKAWldq85aV1T5c6fG7bVS4qNoGxHgTiM2mbTsnJmq4sS6yKjsl2hyVdvvSopqNeIMvR70icI9cGJ6lQgxZ9QUOqQG1Sa9/wtMhCFjT5hhiwvRMDYlYrvImCzZvw4jy3F55geIhh9hDZh4RhyP3UADHssIjLtqvBUcZfhfPChr1Z0k8gsjIZE/l+3Ma3uS2+xocubvMbKvZdC8FdzarA6Q6K529/Q4DrOPp367FFgit7Gpk/Ur/iG0uQJmefV1zuL/5E0Sbq+ngCClURpycoNN/XDuTpenMcW5hXHd2zOjjT6lVn5ciXSMHJm2lcN05V/v7gGdMXV27jyF6VFqb+Z2B7Wyr5sAk3t4vpD2Np4LZAOt/f8wbNExbp/Aw=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(11063799006)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QhBHyMUVe/N/19kbHsS88RY4I7qvxwlSB8vHnHx2LiMmJIDWRklZTQpBj6J500WF0wz98I2m+E2bmBeDoO9z17edJN/FFK/+btOzhW5OWekHrQa4kyUib/amL3pACkYmCAXKj7oPUm8vChGpVF4HA4zm8jm/Y8mUXypAYzjTVLOCQcGAn3jTTnKMu61gyOqnMQABOi+kyxWirI3uXIMqJWAbLqMSOi/Phb+k6jOs+nIuJDfVwnxB5ZkEzIB+C6RydlkpngFoNz6qk4lK5IyiWbH2nxsD2+pQzzsLDxh3vfK3YoE8nb0AWq3r9309P/SPUPV8iYASIp7iHGBA/8PrbMcsNuEKGiLittSk5jRhAj4kuKNbmyeZkR0jPx4l9Avua9v2eKpk/ERcyJdQlrd+yqB5E8MtwILK7Grm1V+9IWWTtb6q3fwgQqN3i/cYvi4X
X-Exchange-RoutingPolicyChecked:
	lvrmHk5BCJdZejQrGd3HAj0XzG/t5+m1NTd8OhSgKzUVI4sJliN1/lhVszlK2WSr6sb9ryQ7PeAqhzFvnuSbj6v05VQpC0nn+8A/gx9RkRVpGdp9nzIOENxG2Bhnw/3ADfG/egqOFwZqh1RycqYokeh3lBfBnKgJzmZO8LF1oanvUFe7tmpsrGbl3LTQpF4MZgI9SdGNF4jjs2ENsbAslDCZqBNHbDu1FFEunIZsAjTCdtLtcn46y2GJr6SPEvk3vVdWzQwmGuzz/FjQMgNikSGfep/41cBIqvYILUYYFwsyJPgi/9FPzNfARToUZE7LLVto5N+jT/3A2VOTe0nrfw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8hvZXX/tfkIqBgg0PJIPNaL1a0cD3Ed9tO9iEAFGEVc2R6juuFPSO8cD2AHvj3/yZrOmaXctRDWfzCxn1vUb91yehpH2w2B1r4iTOA5NZMetE8dkUS7tacrRZ7mltPhoU0JNab8uyutcHD8Tb3kcgwm9SvSHbOqgpyqY254diMREYFeLrc7tKENCyfgJpeqrMHGkyomj1G0cW3xfuAU1mCcYFlSz0FXCjxmdqtKmUt8I7AJvDt1hmJ8qlP6zdjiAILvYGEegv1nCZAx7zfl1lBSSDeEadfDeKFIowMjFp2vFrEyZIfRNcs8DD/zPBE9Epl+QnrWvSC/wgOf2ekbZ5fxnvfl871ixFhYEYqmb0PGpfvVBF7b6JWTKJlNNUWprHBtvrvhgXoLe/NA+RPrDD//51yHRFJ3QcX03mMn6aNRYG5UELjF5wFNM47udgGuiMCbic+jzZfgb4gnLSNP2WeFK6yuiLR3+R+ZSIzQA9LlMTf5xdzNQnzVREfEG5VMnn5k+I390pO7fLyi2k/z4OR/GUk/q4G7vYhaBJD2w0rdy2wEznllromaUoBjL+V0B6muZZ8SliPC+cSKuB4wjq/1l+Zf6FGQU8+SvgZWcw0o2fNaSRHdP/GUaTSa9El3cUJvRco7F20yJJVZn4S/Ivg==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 01:54:59.4292
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d6fd302-d8f2-4a7b-22d8-08deb612ccdb
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006001.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR16MB6669
X-Proofpoint-GUID: N_gHIkURAK7gBrQXVBYMIEjQMvYwur1Z
X-Proofpoint-ORIG-GUID: N_gHIkURAK7gBrQXVBYMIEjQMvYwur1Z
X-Authority-Analysis: v=2.4 cv=Wuob99fv c=1 sm=1 tr=0 ts=6a0d1477 cx=c_pps
 a=nAh4yJc8K/mwxcjpRfPwJQ==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=dw5MciS7gY-znkhJuOLE:22
 a=DBfv99YmAAAA:8 a=cbNQJ9GKAAAA:8 a=w6iLRhPts_XBajjz8_4A:9 a=CjuIK1q_8ugA:10
 a=3whSkbs7g9Me0DR5EJEX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDAxNSBTYWx0ZWRfX0/S0y3Bc7EiX
 qVKaEL5JeGvhtHdmyEFM2Zbv8atsvRMQmVu21EQY6Rbtfcfz2q5E6hMaqYao0MqWWdvDtAxWoMA
 IeKdsr/6LEvsTE/5Mfp2PVZN8ziYWCPNxhbkZ6ZxZ+P+9GCB1EHxWyPRD+6jaYhu6QpRiuNTcBH
 iCzG3Joe94cZT37oNSYLugO3Z62B4klZfrp/k3wSY2FX8snocggZVSmILC043XubQ6hsNz6H9/T
 i/BGUS9t2lUt5gFysiTiSf9XFBqT8NYy/pXh50BJuxJnLYEKZHwI59BGn61YJsQ7xPn19p0YcSo
 xArczdUGqhmdmvYmOrGyap/HnMbRNC59mOjBMXiQUPf0oQlfanaL54Zr5xsUYw0OyqSM44Kqvm7
 yP3G6P6MUQmjdXiQd6XYyd6dGFNetInYDyGYPfkEZGAPNGkM73OU6+34+cKAbHqC0gxfw+aJqZ7
 1W/fk/z6XEBf35qtstA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200015
X-purgate-ID: tlsNG-4011c0/1779242106-7D5868B7-B36272C6/0/0
X-purgate-type: clean
X-purgate-size: 741
X-Spamd-Result: default: False [-1.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[azureford.onmicrosoft.com:dkim,ford.com:email,ford.com:dkim]
X-Rspamd-Queue-Id: 35A45586A78
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 07:35:43AM +0000, Mykyta Poturai wrote:
> Init helpers sometimes fail to rebuild after switching branches,
> which results in runtime faults.
> 
> Fix this by adding missing DEPS_INCLUDE to the Makefile.
> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

Reviewed-by: Denis Mukhin <dmukhin@ford.com> 

> ---
>  tools/helpers/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tools/helpers/Makefile b/tools/helpers/Makefile
> index 8262d9e75a..11db7d8982 100644
> --- a/tools/helpers/Makefile
> +++ b/tools/helpers/Makefile
> @@ -64,3 +64,5 @@ clean:
>  	$(RM) *.o $(TARGETS) $(DEPS_RM)
>  
>  distclean: clean
> +
> +-include $(DEPS_INCLUDE)
> -- 
> 2.51.2
> 

