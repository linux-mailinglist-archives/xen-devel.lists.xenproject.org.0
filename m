Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dpskGAzzIWpYQwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 23:50:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D8F643B17
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 23:50:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ford.com header.s=ppford header.b=ry4M2PPX;
	dkim=pass header.d=azureford.onmicrosoft.com header.s=selector2-azureford-onmicrosoft-com header.b="LP/20d/G";
	dkim=pass header.d=saarlouis.ford.com header.s=ppserprodsaar header.b=REsVnYq4;
	dkim=pass header.d=ford.com header.s=ppfserpocford header.b=UH4qxJRF;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=ford.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1328599.1593031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVFwq-0004b9-HV; Thu, 04 Jun 2026 21:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328599.1593031; Thu, 04 Jun 2026 21:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVFwq-0004Wi-CD; Thu, 04 Jun 2026 21:49:56 +0000
Received: by outflank-mailman (input) for mailman id 1328599;
 Thu, 04 Jun 2026 21:49:54 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wVFwo-0004FJ-Ca
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 21:49:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVFwn-00BQcJ-P5
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 23:49:53 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a21f2db-5cb7-0a2a0a5109dd-0a2a45028e0a-18
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 23:49:53 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a21f300-af86-0a2a45020019-94a38ff1a648-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 23:49:53 +0200
Received: from pps.filterd (m0367129.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 654IpTmS2151826
 for <xen-devel@lists.xenproject.org>; Thu, 4 Jun 2026 21:49:52 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com
 (mail-centralusazon11010008.outbound.protection.outlook.com [52.101.61.8])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4ekf0uhf9k-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 21:49:51 +0000 (GMT)
Received: from MN2PR22CA0026.namprd22.prod.outlook.com (2603:10b6:208:238::31)
 by IA1PR16MB5335.namprd16.prod.outlook.com (2603:10b6:208:455::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 21:49:45 +0000
Received: from BL02EPF0002992D.namprd02.prod.outlook.com
 (2603:10b6:208:238:cafe::55) by MN2PR22CA0026.outlook.office365.com
 (2603:10b6:208:238::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Thu, 4
 Jun 2026 21:49:45 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 BL02EPF0002992D.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Thu, 4 Jun 2026 21:49:44 +0000
Received: from pps.filterd (m0426316.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 654LFBE51071552
 for <xen-devel@lists.xenproject.org>; Thu, 4 Jun 2026 17:49:44 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4egexd8rmc-11
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 17:49:44 -0400 (EDT)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id VFwcwOZOJ8Hc9VFwdwKuqs; Thu, 04 Jun 2026 21:49:44 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=vfm
	A5iZLMRx4x7ZS+yIsMU51DJF8y7i9uOOCwAxLLDg=; b=ry4M2PPXG9He0DOrMk5
	41mxsHLHBfgtfPsmtGFIE6JwQh36I362qkTCQ4VUvH7ipFManJhzVrZEPCT4zTey
	LK2XI0fAicNjTz+dgAetn5eE0XK7nfa3SMK/nIGHsICMoxYYv10BdIjTmmmazmdq
	z9B2FUEEcR3oYrgKV2gGpAxEMjARPT2mAkdFxMdegn6eVDjVOLS0HBpTbdt1cbaw
	jiXfjtjdk5yR1QyXUtX32jAU5dBcKfXBTsBFEGRV2nK6U9yBGLWbfuo5FPT44cPN
	eXC9D08yiwGBz8wCjHzsmIt987dnqPok4ZdSP/Iw9+qyTPpQk0WS+aRfsSwBCFP8
	Ufw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K5EM0bqXYsurP/FJAuC4irD7xQDnOhamy06YBkM6BnGmkMhs2oUcwe3DcGqXAAkc5rIUiq1KbyP5bwvHqfm9vgkg1UYlGThTwZ+LcZjNItrYSd2LfdSthbZNOxLAEH9qZVkJGusfXUTQsGiqs3A/z04SEuaISTq/Uf6EgpwTC0r/WBL3xbz+NshTNyIx1hLCNqQjfxNv0D+GLPMFHuTqDPLIqWpxVz4YJBdbWw5bXDQduWjaLXSvLxOZU1smHsVArHJCN6L5nT/wxhMemkIviKjxvTaMAez1OC6roYdO7PvSdu4urZrII5DA/xXlyCQSuuLlvbq+61mh88/m0TkdDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vfmA5iZLMRx4x7ZS+yIsMU51DJF8y7i9uOOCwAxLLDg=;
 b=Xm2qUOX3McwHMUXS4rxRH4w667EGg2o6IbK/wphB5RGFMdYmPF4m6UQa7PET81oi8RnzhFPNbBxy3AKBhiIQboEa6yZipOfJKh7G9wAF6y81xHVIDl4e0jU/dyYXLcb9Qpo4paOX1UV8stWuBkcxOBcU0ItqK8zXku2rgqOKz8ALzNoIbU9xPfiJgz8IyE4s45pItmLWkP1X0IioGxEniknLpeRs32vBLczQdkPJqwDCEvwbjdF7cs2zJPcZj1z9LNEyDUcXE9lj5uM6xgl7RsDiIHDSfUTsDQchxHJuIBWKGHIncQvAfEemOh0FEnR9Ypb+81P/u7xfeHZLK1K60A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfmA5iZLMRx4x7ZS+yIsMU51DJF8y7i9uOOCwAxLLDg=;
 b=LP/20d/G/8wDtcDx2gJ0iMqIvXdR/KrH6MsNCzl2EkV3s/iCw+pMLVkyubEBcyI8tcTp/xB6HJCM6sbHUGluSTcDk8lRq28bZZhDH38BenGAQyg1EskCsOOcWCqjDTzHqbY3W7xz+r+hivSF5tlRN8S7eHyNH8AStSdwBF6zhBY=
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
	ppserprodsaar; bh=vfmA5iZLMRx4x7ZS+yIsMU51DJF8y7i9uOOCwAxLLDg=; b=
	REsVnYq45Wd/SH63nGlHsWG6dTxyxsjwa84E1AExkky+NHfkPMZ8gKq+/3hH8FYF
	na/wlDGRWRqcJhBNVgWg7ErG+y4XRnBibKqW1R0o1UgMx/rbP96HWE0hT+Un5pK5
	57RRNWReQdbleZNCMa2N+rdEMK3xBRzGANpRbhTwpw5zCV91ryhu1SPTv1GELVMB
	BG0zAm7J+S/Rs5R150LzOnncKirswy/84VcIN7wAV/64KhX16wCiuWznZHcfSiOk
	Vhed76vIX847PLwQ1UZGg30VI5Ryo9dbuSK9b2PnB8yvXrOIKxdSuWqdiywrIi6X
	8N1YnPur87/32W7adEF0pQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=vfmA5iZ
	LMRx4x7ZS+yIsMU51DJF8y7i9uOOCwAxLLDg=; b=UH4qxJRFGdm92cYsdm/bZla
	Rh/DTuJgdOg9c8Dx/aEQEcn+VwTeVcrrAOIotitswLwdMA2h2VNmoo7l1C1ModeU
	pWniuieNUcODY2KOyPwVeOA2LDksJlvdnKjyxkPa8DluOd9trVZ147JbNKgP3lN+
	2N1bNf4OctII+KfnoDpzAZ9uVeUVQthSZeCodu4W1LrepWBvlPzaCmJKZm4xn7g2
	3GG5AaZC6rR3JvmjavrySWtpdZDtApQHSMYdU3G4tmtLsAlmpo+aiddTr0bHcqmv
	PIBksRHLYEz4Dnt1ldWmiaDp4mpFpi9RFYg+uBpJEe3/WHUkjFNnCuTPCFFdUkA=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: VFwcwOZOJ8Hc9VFwdwKuqs
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com,
        Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v6 5/6] argo: introduce CONFIG_ARGO_DEBUG
Date: Thu,  4 Jun 2026 14:49:25 -0700
Message-ID: <20260604214926.1735194-6-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260604214926.1735194-1-dmukhin@ford.com>
References: <20260604214926.1735194-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040213
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992D:EE_|IA1PR16MB5335:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cd4b225a-2254-42ef-b158-08dec28330d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	v363vlcOYqKKFYg1oeX2U5sNIGmxNOuefOHDIzOu8VexAJ5QghvF81F8ATBck3o5sjLfK14QndSSSojjdJv2DUawbGIfMDxD9dbcwd0LPupnJvoNHN8Wefr0CEII6mRTOeBy849pFYL+SKPktQhxA0oEwGggVSYrOrlYRbrdtRLSynME2JrVtWizXiBzwKpgNG6Zon2iO6md+FlKnfMp+1+CIBctTatECTmGIBR60p+t0yy+2IJ/O+utnjsjgBH7PjLMs9cXZXrLSkaKSZitOr8HxPvmDAZJqdP2SeLD0C9PmV2kVbp6vkhdCIdOJfcxwWOT+Ojs7SPS7VVGTW6Gh6b+cK97wODYNiztoYRb+rLbUzEaEt0wu9vkEfWt2OOcAlogqMBdKsG7EdZVbiydhEx33PoHZPoHKw+b0kDCo3eCuGPV/KQGwmkYvxD6VURW3r+EsfXDez7YJIT6S6w716/LA1Tnk0cotMp/+C3MF9c+oqxTzUdCmSls9zFgFe9GY2qBMRxCiLo+nmwTQHrBQ+gPo+N+suTjSmGeiegat36I6t3rGQnW7Uzs19y7Wtd9+XOoA+b6q5b8Mio5AigUaujbnH1c+3H7wn2qptAxLavKppmaaAlMkGWpUPqp9iLy+1gR0gPSR3PUcZ1Oe5ox++nBQI7hsv9xI0MymevAC3eXfscPkhqhuT/wi8tviIN+XH1qH4X5sE4XMwaNReed3KTJa6KHxGOpcj4PE8NT85s=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JxdbPlHqsmh9sK7XxWvjooSscRnfmMf6pOwEkvjpACe28TmoWTiihuX3tq6CsTrZvTaXDPSAQnD1qiyglj4zKpw701kg/T3L+WglTIcaJc3xY5HAb/oH9rqI6iVR7jEvOoQD5O5Ee/E76agmqHOR2LL+Oc4tldGrL86jsXfxdydPqhjDIDVASruELqYdnkx2kLLxZDJDwrJNxEhIDTdBjbajDhAZSnwZGI1HBjQ+54U7baJShJk631ikjni4r1VkeZ+6fsjf7T5w0iYrlx74BFoFERsyVrmpkwVWQpKWFaP/NyMaXhG/bG/7D23yJt08KN3xdpkJ5uO92wnJg2ZaFjr+mzeu7KJUXPQ1UEkVTc3iSkT9pHHBtnWc0qwmNn/0okEZDbhcdpsuLhJKCFmEtVZzSIRuyKam5H938Vnmeit8LXLHGdQdTlGNnClEgO/X
X-Exchange-RoutingPolicyChecked:
	L6CgNIxz+HVOaU9J5h2CUE8mm9pYLegQ18bCne9MdYOt4y+P7bs+A6Rh+gUBeelJihQB+Syx20Y8u/PPo1g6I2HO2v7zF5kP9fYKQ40xg6JgClhX4bYJaOCfe7CXdS+xSzS7oV2kny1jGWU/hqBBEoXxX9qfmsPqG7fPsBq1xGfiQ5EPxnGZ7juZBAfWNG8koWRs92T1b1HbJTOLA+ohZZMeeIN7XSnPhmmPpeRrODS5axk+CIKcPneY7Ct7Lnym3E4fA4HA+TrKrUoBX5+eliGaa/Em22t0SsRRpxL/aOwcbyz2Ud6Wj72yHx2K8UydSCOFUiqy4HUkeDust2necA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2p2f0NyI3jRWaY+yCB5e2aA+yYMPsBilWMvCaECvxS/qf9TMWuRc7AEqLGGSW+oIIoERpIYE0/ts3R3X6UVUb/xfO0Y11V27lfzpzYePW9ls7Vs4xxs9+GFtEQLrVSf89n92gdCUrr52gFpXSLGnoN8675CPGFaiuzGtHmia7RO5PrtpewrVSlPs2L7EVKV7Rk8/Irx5CczLScg3b4HYwIZz3XHx4zSLjfiYpIczP3l8DxgWpD41eTcvfU7btYv+CST2nx5RhKOGCJ70He7g0nrrDUR1L3ipUg6iPbIUlvsn4tHH1+RHLbNgvtbuW+7MRsR50b9290xKjPLgcXhXNG7BYfNcy0nJrnTFI5nQZcv3ZmykmlZziZsgNfOaZ+e4K6qLy8hpEmPkxxwWBJ6Rm5pJ77P2FrxNBDUyJ/Usj4XCGViCnVLFmGTbVwxXfVkfpKJf5mXFXRIjGHzIoNofhgAt720dt1QzI9i5M7j1zkpGcqxur148XlZ75I5OhmK0K9SXEej/kSl2RkWBk3Kmzs6ARn6lSWUCzVdN9YemOyyLcP5XPpkHeU7sKISQpRX3WsCTP/cxnL3/JBkFVR0sMPgbukp9Z9NfQNCyqtFwdbfUC0gHFyyN/7sTZ9ZfEZNs
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 21:49:44.8262
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd4b225a-2254-42ef-b158-08dec28330d9
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR16MB5335
X-Authority-Analysis: v=2.4 cv=bo18wkai c=1 sm=1 tr=0 ts=6a21f300 cx=c_pps
 a=E1AkXC+xFF28g4y6WI75Xg==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=X3KReqg2EL6A36SYCKpz:22 a=cbNQJ9GKAAAA:8
 a=zd2uoN0lAAAA:8 a=Q-jbZ8zFL_rIPxRkYqEA:9 a=G69WFyCBNqGPyalROSdv:22
X-Proofpoint-ORIG-GUID: mghsW2deCc3ZwvqxRdp5klvdvMWS02aj
X-Proofpoint-GUID: mghsW2deCc3ZwvqxRdp5klvdvMWS02aj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDIxNCBTYWx0ZWRfX9X0uUYPeOBhL
 PPokMbv7JOnH4M4duwUvCgo2aJqrKvxUofGtPyKg10njPc4yoXggm1B5F7ybxN9A7tDLLIK5jgs
 nh0pe3MWmtH6p9XjJq87sbDTNsG7fkzybd4j0LfV5j36b2RimuqIIsXmNCA6rjdjav3y5Yxyo3y
 MBdilc2gZbHtsJzOYQyUYCa9FDmEeGl6aYv66FHSf4qpshKmL//QLjxmPCfGbZC28slAL1pGo/P
 LnHO4+VnfhcDLlcxXSy8xeMpN94fYQ03JpXABX6QPJRRX+dAaYgT1T6ncpAu0PCh+lBs5rEHCZJ
 L1h07FkumfMDiEcDoDI1ybF2sAl3AyQTx0WXJC1nHTkvEilvJB+e/vKEC8CHnhGzd9yD3S4hML0
 pegyn4lg7GNoonOddMaZdYS1eYAwsl5ZTfPESM6ny6vdN7S9280XvD9Bhswj6urK9F9Hl6NsuNP
 pLkZqDVelGc8d32irgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040214
X-purgate-ID: tlsNG-720697/1780609793-81772161-4839C4AE/0/0
X-purgate-type: clean
X-purgate-size: 1663
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FROM_NO_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A9D8F643B17

From: Denis Mukhin <dmukhin@ford.com> 

Add Kconfig knob to enable traces for Argo debugging.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
Changes since v5:
- dropped 'if ARGO' from the Kconfig change
- added Jason's R-b

Changes since v4:
- fixed dependency on a new Kconfig knob on ARGO

Changes since v3:
- dropped uneeded "If unsure, say N." from new Kconfig description
---
 xen/common/Kconfig | 6 ++++++
 xen/common/argo.c  | 3 +--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 5ff71480eebe..79b7fa62e713 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -491,6 +491,12 @@ config ARGO
 
 	  If unsure, say N.
 
+config ARGO_DEBUG
+	bool "Argo: enable debug traces (UNSUPPORTED)"
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


