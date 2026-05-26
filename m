Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /LbuK7kXFmr6hQcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 23:59:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FA45DD06F
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 23:59:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320182.1587578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRznW-0005Ab-2W; Tue, 26 May 2026 21:58:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320182.1587578; Tue, 26 May 2026 21:58:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRznV-00058j-UL; Tue, 26 May 2026 21:58:49 +0000
Received: by outflank-mailman (input) for mailman id 1320182;
 Tue, 26 May 2026 21:58:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wRznU-00057l-Vw
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 21:58:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRznU-00CFZ2-Bp
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 23:58:48 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a161795-2eae-0a2a0a5409dd-0a2a45048942-4
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 23:58:48 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a161797-1dec-0a2a45040019-94a38ff18824-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 23:58:48 +0200
Received: from pps.filterd (m0482515.ppops.net [127.0.0.1])
 by m0482515.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 64QLWo8W1912125
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 14:58:46 -0700
Received: from bn8pr05cu002.outbound.protection.outlook.com
 (mail-eastus2azon11011059.outbound.protection.outlook.com [52.101.57.59])
 by m0482515.ppops.net (PPS) with ESMTPS id 4edkhg84kv-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 14:58:46 -0700 (PDT)
Received: from CH2PR12CA0030.namprd12.prod.outlook.com (2603:10b6:610:57::40)
 by IA0PPFDD91408BF.namprd16.prod.outlook.com
 (2603:10b6:20f:fc04::fe6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Tue, 26 May
 2026 21:58:41 +0000
Received: from CH1PEPF0000AD83.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::f) by CH2PR12CA0030.outlook.office365.com
 (2603:10b6:610:57::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.11 via Frontend Transport; Tue, 26
 May 2026 21:58:41 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 CH1PEPF0000AD83.mail.protection.outlook.com (10.167.244.85) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Tue, 26 May 2026 21:58:41 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64QJVqfr1022937
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 17:58:40 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4ebuapbcf7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 17:58:40 -0400 (EDT)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id RznJwe2xkZ2SgRznKwFfxB; Tue, 26 May 2026 21:58:39 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=TYK
	MWBptyNTugkzl1Rf1mcoBPwr1cqpI/bXH+6shRHw=; b=oPMJWfRVCVV9QGUlC9u
	yi8zxlyUYR4s0zr8JLaKkwWsaGRQZV74MiYnkJZOCBcweax/VLxSIn6EbegK/yD+
	mQGkJck/NofvoKrrrsyzPDFIn26pGWKRybzLqdobu//fdAltRxjgeTLlQwLFeWVd
	/2nS522UPIgmR0acprpdZyiqdLRTXpBrQpHJEPjUj6YlrIAPUdlk2foyr/6/y77z
	IQAlhI/5Pb9oWQjIAa5+4bAp1DbCwBPRZV3NwIhvyXIKR4jwiTx1FTpQ6gsrD8kM
	mQRqdsdMAWPuPZmez+aTdfVQyGAWMKbIdVKGJ219euAB2RJSK1RsVZ3BQ7ctl92d
	npA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ChTxvQ9nPzz/8wLWcXhZZKceCbE17Rrm8W/0v0G0riY+E2WugxT+2rVVkPEK6FEM1PDANNKvdtGQQ5H6QwW8YJ6DkPaeOj0+nT0HFIlEgCIC2TTLdAwymyACC+VgUXtq790ciwGq1/ZAPsfhJ195/NV7I44Iab+xNEgW7e3YaAI9HRmgJOdtbP+jJhoU0i9pvf6NV7uGnkeT8UaUNdgwiNGMGqlZcGzUDIF8ZfL5/AbweYTRRKGiXHYR139wBHub9htl84AyJjoldc95oduCyjO2fObIHHBsZL6D5HMDyhABs40XM4Nadwr3Z87Rng3HSlGd0oA82HUNWYpHNCYyyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TYKMWBptyNTugkzl1Rf1mcoBPwr1cqpI/bXH+6shRHw=;
 b=JzGYjztRtq67VrEm6yYjABsjOXt+BtVEpl203x+uOniwYluO/JO5GklFUHLlP1sPxHIrWCRAlNTaZdo91X4JVX7FAkWyKRJ6SUuuaaC8a/JMQqGOlFHt7Aivk+tGiQceHEvxyEZ1lP8jekCYV0WOdBIfZ06tsP2m2YNCOIKm47nfnZOsptg4BCaU72n2oYP3oQlfyMB+5KnxseR58MBGHbkuNo9W8U1QAl/2fYs0tT915A8tHMw1495ZeBWU0S405D6lt3ZEBipnZevn20t3SW6M+SfY+Loa+uI1xP3hAmc9w1ODElY4mknqq3e43bee7rJg/t2apDPk67zycLkhJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TYKMWBptyNTugkzl1Rf1mcoBPwr1cqpI/bXH+6shRHw=;
 b=X/QJaH2oBEHc0UGF9WqwIDIud58ifyTX5DXm0kVFNe+Bpmtn7DvfWAhmKYZtDrg42kMQeps4fmwBQ47zdF3HCd6IeCjIKBlVwvVq2oM1PgMCV1T1cN7kNKcWadmjf+KHNFXztLu6kYBsEfSoi2dX7Gy2E3413dBbEK4FND9XPRE=
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
	ppserprodsaar; bh=TYKMWBptyNTugkzl1Rf1mcoBPwr1cqpI/bXH+6shRHw=; b=
	RsABrFpE7CtxSEmyTdzVoXYnz3Tu9XVrkefbWlwNFkreFK8zIp4WpYcp4kCQ9XoH
	fqcRvOyD+YQPvKVhe1AHg/VTOliKq1u0ytWEi+wcspaPjFCWLb62khXWwq7OLsA7
	lx+ntwaC7mNDkxuy05IfrG6mRWRHwGiegS06HhD8sg4nItOYEZb7nKmJJIxUcUfc
	YrKESlapfl24U6daCDTjBd9wjjNZtQIQJBkJlQ1mNk0SM2DRCHzKRhm5ES72vwYG
	cKEy14mbqgboMF7X6Mwgp4zKP7FW6V8+CjzTSMdz64RzdzIZ5/7bsLYKQda6BSHv
	vQn/OwhQhcW3P/5xv1uL/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=TYKMWBp
	tyNTugkzl1Rf1mcoBPwr1cqpI/bXH+6shRHw=; b=ovxeq+6mtfoH/hKbaJnOsWp
	pzPn5AnVFmaaQ/ykTwAs5zatZ/2bCI/XlCv4hN0HAhgMHp81zrs4aKkDohCoMEfo
	+163C8tuwFgKQpbb7yVj1sgsbci+1yzthjCKEwP/N8tKlaimc5jd4VXE3m1tbcqm
	/fLhjOKYYF2mvuu4lwvZjIZtwqIU0X+dIvwdKOyAE7VK71R24tXaeNouvAjX3s6T
	yT64m+obZMl2M21lp2xhJ00zJVwFRhoHp7yctbhttVNWE4NQgEbu9CiZeJSoa5k4
	jE6tOwNC98ztLdqT5CU7dXZnuAYKukTjl+zFxWVfoBpCuUPwVEPONEJEb1THrCw=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: RznJwe2xkZ2SgRznKwFfxB
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, christopher.w.clark@gmail.com,
        dpsmith@apertussolutions.com, dmukhin@ford.com
Subject: [PATCH v3 4/6] argo: fixup argo_dprintk()
Date: Tue, 26 May 2026 14:58:21 -0700
Message-ID: <20260526215823.1452619-5-dmukhin@ford.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD83:EE_|IA0PPFDD91408BF:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fa06e38f-fe50-475f-5dc8-08debb71f2e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	EdQ2MqwnPl1B6b3QDR0EkHK7FHBD5ceMA3kD6IVZP2ciaiiaNOemOBwbZnB7hyMwh/kSI7EGMb9c/38XElKi7uk2li2wLVKA5DomblLyAQmroRQlndROYWKF8Z6tfIY2cR9p0yraoT7pwV/CQCRKUhmd4zAiR0aV9K2n8ZmgubCTgRJVr1j0hzJBVxthA5BvICuWVMxQJ3PO7wV+ZG5J4fAZTNygI22O4fjYFqq1BkjhhwqalLQlggFqgWwHkdTSZu2kEPy/MLKPvHBdEK2EpZJhpi7Pawz506aqFM+t0LkSClk5FzJU566ksspvJkTeKMyvFkO4iXP+yYtvyh5exLQdOjhYjY6maZZ9caa4CVW4WJHVsu3OeU86ms3iTSNL8TDg+xSmkyIJiD7qDDJOc7LOsmP2JzTheL6NayF/wSPQnSP3mPTjdwJzlr0vVXHAbkJBCCR14qki8DeYuSZm2TRUUht9dzNnNsCt16H+QbwNZyNFtpKwfS9ANCbe+BSFgGQfyzGj8Ng1MO+OZYqHUzek/WgHZqEfVlq6tDvpyEB8UCPikTEGezyucW6sdQxoUJ0S4kfY+9Qxnqo8CUkXHIsDDCoyQ9D/M3jaawprbZTjoAtmgsta9hEjzc0pFquBYnAVAvzbZooPSSAYMrTLGix2WiYSS/8MwxCzCuqlzRf4CF8bvomo0hR8nlYb4++s1qsCSt6VVRsYAjqJTBARFQdgs8GiGkeM/JFnslrQOKQ=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8uPdxKX2HAppsRGkqqsEBhVSB7+yl2fo/dkQVRXv6YKdxu2Joka6k8/73FVVZQpAUmtp/G5w0TGA9JGsE+u2b82BgT/7yf49UV2NbaF2IwKCtaFtEmf+Gq02Qj9/8JFIs4C9PwpaWnX9KU8MwlyhSylT7gqxFlJnXme5zLdfYXSuVFrsFPnKpquRijeWkUxIyyuYofcu0JVcEJg31+dx3Va7tw7hhuMqTgO2qklL+oGQmB4JMwekHBs4sCfpmRQ9K7BW4HYFq3PfFwiyvcEHWfUI7/x8BBaA0CPdcxAWpZicqMAJnZt5/Ju9Fk2P+dO1aDhbJGl87y4fMw+ilBsS1rHa7NH+V6x1yyoEhwCDLxSToNn1QQxmgfx/gjcUbmkMzBcCK65ixpox2mY1h0+A/9B7RTb8eeiQyYqLL1S2CwwDmC9dAt7WLlaLX037fSsT
X-Exchange-RoutingPolicyChecked:
	UsjnWdwwFs/G1NuN/mY9miLBGlYm03GRNDa7Maty3Kf/Y7vanMKEVXEKQFOKZykdlEGVzKjrvgaBm2kRz+PtE/losjA1RDYIWq/SkLJwbsD9gyf9gJ+qysMWb4y+viy0XfXzm0KRziXgiVYn4QI9DfaOwam1USJ//hE66MsswyQ2+EwcuuhmHk6DaU4O3A90dSxhzPHfyW63XRMocBFOBOIVT3YC/yNZT09i6dxozU1tKYhR3cZIIHMnYGdcOuTni6lPBHe4IR8J4qPrWJYOJZZ/bss8NdrgPURwXqtfgEfKKGlmAK5hhODp2NBIjS41qGC+8N38q/geidaAwy9uxA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1aSHMkyGNaac/FcQ1XXitiXCbm7olT581IuIBF0weCdLcUALG/UcVpX90vpILWiTzclQcJS0uEEH5QlnH0eGkyMGioGs2Sn039Pcf1SOOf3muE0t2eORNuhOv0Nq69rb6dWZHwg04oPXybS5+FThf4vOn+thLg2UZK5GUGiB+goPCDZRnBTErx+HGI/BH3ccEE/cdGJL7JgWEHwweySbdhofYi2/+8irYiKvPaGmURnhAc24J3L76MnfztLx8aumKlAvfJigraQnHaxNnSe/7Cu8W5lRab6reDMuwJGM3nltlIBXQ1SqOBjHjdSiHKMY6WyFsal1DOdXjPbX4n0MSmtXcjNWNqWUmtsdkAnZui51nH244Uq3ES6QQOgijivcEnCdzDKIzD04aXc4Z4VHyNQnydAHJjCTds+JDMBiKtj6D/r9qog3S5Roqr86r8HhBA/3k1VUxrj3EgEgKD8HtZJBHpR2067+QN3Baz3d3dPsFeeYDJblpvdOdo3qhZwIe1lCNjPriaKcuFVeyET2lb5ai7sOr0182ri8ZzXugjuaVsSTwZ19hs7eM/t2CC6rObtKvDlAf+dDrhqLOCAdcJEGxqzgSvas+Kx8FiIxR0ttgIPUVhaW9oVnhE3Ee60/5iNn6lnMUomwgkpi87BsEg==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 21:58:41.1179
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa06e38f-fe50-475f-5dc8-08debb71f2e7
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD83.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFDD91408BF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE5NSBTYWx0ZWRfX8A1vfclHC+I3
 hyKBM/dZXtHYVFPKobZfgas75AIxEFAW1mo1Ol/xCMXsJjBdsScydKSxIuLNOk5dB9NZe9PYpXv
 Et1Jn5BKeyVdRcjUZ6RB2YLg1xQPTW2q34Su07qhyKUlulQOzwy4ucBbIT5xXiL0U9VfSAHdDtN
 qgWXo7rxYiZHGoODYPe4Ne/262W9f4h9mlmcZl3F8SbJMskiBc6tWbBNok0dqGg5jn+NsC3cF+Q
 vSZW5DAD+Ey48yeDPCmA6bWxRAeuSYjddhjinAqy04zULzPmfNRmqpMm0azwQSW9hnX5cAGtKax
 sveCJfP3e/j6alHWDj/ZXVK7t5/tfKCnRF3pJjbvylIBuRxvQzYeb3LNF4gtRBFZHsDgv7GJec4
 cOJODpnkg776wnKh0sypAlyCvFumG9gWzjbjP8qj0f1b7J3O7aJlMVpaH1AFzVKdfo+BuKmdvki
 S52BH8Lx54A/epKpFEA==
X-Proofpoint-GUID: qvZhq1pgzajqUicZxfptvIRamRqvv4rx
X-Proofpoint-ORIG-GUID: qvZhq1pgzajqUicZxfptvIRamRqvv4rx
X-Authority-Analysis: v=2.4 cv=NvbhtcdJ c=1 sm=1 tr=0 ts=6a161796 cx=c_pps
 a=J5CYyyHZZtesdUd/yj239g==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=NGcC8JguVDcA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=0GA0A_IKJoUHBEAzNTkD:22 a=cbNQJ9GKAAAA:8
 a=UEeNNP3tciHXUiOZOm8A:9 a=3whSkbs7g9Me0DR5EJEX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260195
X-purgate-ID: tlsNG-ebf023/1779832728-43F6D3FF-11E0971E/0/0
X-purgate-type: clean
X-purgate-size: 936
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
	NEURAL_HAM(-0.00)[-0.984];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[azureford.onmicrosoft.com:dkim,ford.com:email,ford.com:mid,ford.com:dkim,saarlouis.ford.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo]
X-Rspamd-Queue-Id: 24FA45DD06F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Denis Mukhin <dmukhin@ford.com> 

Current argo_dprintk() implementation is a wrapper around raw printk().

Rewire it through gprintk() to allow for better debugging context
(such as domain ID).

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v2:
- new patch
---
 xen/common/argo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/argo.c b/xen/common/argo.c
index ffa1f43437ab..3c38a51d09a2 100644
--- a/xen/common/argo.c
+++ b/xen/common/argo.c
@@ -322,7 +322,7 @@ static DEFINE_RWLOCK(L1_global_argo_rwlock); /* L1 */
 #define argo_dprintk(fmt, args...)                      \
     do {                                                \
         if ( ARGO_DEBUG )                               \
-            printk(XENLOG_DEBUG "argo: " fmt, ##args);  \
+            gprintk(XENLOG_DEBUG, "argo: " fmt, ##args);\
     } while ( 0 )
 
 /*
-- 
2.54.0


