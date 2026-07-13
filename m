Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LxxiJ5grVWpkkwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 20:16:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3332074E678
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 20:16:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ford.com header.s=ppford header.b=Kr1e3IgB;
	dkim=pass header.d=azureford.onmicrosoft.com header.s=selector2-azureford-onmicrosoft-com header.b=PQznrmxL;
	dkim=pass header.d=saarlouis.ford.com header.s=ppserprodsaar header.b=C1RMOwWp;
	dkim=pass header.d=ford.com header.s=ppfserpocford header.b=gOh+OiCJ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=ford.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1361814.1613886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjLCm-0004TH-W9; Mon, 13 Jul 2026 18:16:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361814.1613886; Mon, 13 Jul 2026 18:16:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjLCm-0004Qy-TH; Mon, 13 Jul 2026 18:16:36 +0000
Received: by outflank-mailman (input) for mailman id 1361814;
 Mon, 13 Jul 2026 18:16:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wjLCl-0004E9-6c
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 18:16:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjLCk-00El2B-JX
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 20:16:34 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a552b72-e002-0a2a0a5209dd-0a2a450ae58e-10
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 20:16:34 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <dmukhin@ford.com>)
 id 6a552b7f-ec7d-0a2a450a0019-94a38ff12bb2-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 20:16:33 +0200
Received: from pps.filterd (m0367128.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66DI3KiK4008915
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 18:16:31 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com
 (mail-centralusazon11011007.outbound.protection.outlook.com [52.101.62.7])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4fd20a2nrg-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 18:16:31 +0000 (GMT)
Received: from BN9PR03CA0115.namprd03.prod.outlook.com (2603:10b6:408:fd::30)
 by PH0PR16MB4040.namprd16.prod.outlook.com (2603:10b6:510:55::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Mon, 13 Jul
 2026 18:16:28 +0000
Received: from BL6PEPF0001AB4D.namprd04.prod.outlook.com
 (2603:10b6:408:fd:cafe::76) by BN9PR03CA0115.outlook.office365.com
 (2603:10b6:408:fd::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Mon,
 13 Jul 2026 18:16:28 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 BL6PEPF0001AB4D.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9
 via Frontend Transport; Mon, 13 Jul 2026 18:16:27 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66DHfpGP2048501
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 14:16:26 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4fc4wqswt6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 14:16:26 -0400 (EDT)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id jLCZwI4F9Mm2yjLCaw8hM7; Mon, 13 Jul 2026 18:16:26 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=JIy
	iTu7QCzAjlfuDW1hzX2VhrdEr2rHhHBlHANAcsfE=; b=Kr1e3IgBeSYDG0C+oBL
	gmX8AnSDnxZi2xcym5hXOFSbl7UwbwmMbKpUV+s9NRXis1JCG6RmLiC/QVR0xLdi
	40jvrlx09htC+nBgRj3t0lNAMGgveENGIJEWIxSCY/2n3WCNcTxl0b6QRkEV4LX9
	N3vF8w9BrDA8SG4ulPmj0NObfddLqRk3ekX22o3Cawps5IYfV/B8q5DsfEpvBrFH
	+SMrF2R/hHYU1Qw0qd4eknoiEDlE7LgI5FJzXZFgzhyW5rpz3t4RxVp/KrFAVS6D
	yhW/MgTCiSdmvYi/WfgU7FZWqZ34JuuPmUj7sCEW7xIotAeVX7fzEhXy1kZ62Kdo
	50Q==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gVncxdmsDfMW+zhlrtDcOSNF6CIFvQgv7FwiZ/yWDld2x4/CyUSIdPAsvLDAcCEbgBiuYs+YD9HXyIgZ5+AG80YfCZSdGtmQ/9BJqDZVHp2fO8R3WfG/PNg4AzL5r9TlRIUONFhgrI0c5Ffr1Hxcb07Ew3wT+0uiw84FkVEls2v/oPD9wb8ac1OrvpzwH4hLsrhXPzzFNVYkjit2I2BkI9SoilrpMBRv3s4obo6eR4O/NxWaD+LLTvCOcJBCXoW215zH7+c87pU852fuImi/v8tyQUTBPOvEjMi5xKFojjqUizY1Y6FMTaUCqSDEhYu4CF8HryaZGRumT0occ6a9IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JIyiTu7QCzAjlfuDW1hzX2VhrdEr2rHhHBlHANAcsfE=;
 b=pDAO5Ws9eLR4uog8IaCUqAC34NaZUvVnkASs46LjX6wVe6ziDSjXCId+4MnXcE54m8Xl72FefIFiPot2hmZBxBg12a9hGSjKvDIX3c3sLb4bn/bo+JO0hGf3Fip2KiUMrDLZmH9aXcrdDNd5+Si+2zwmQIU3wEX8u9MRu5KbeixsXMKlv1hImTODO7g+8aO/hCEq8V2aG4/5t9xAM9saUcIBnk944y2HVS4Cqff31VefMXGnHl4CRS4rXEbqyrRwq3AjXmveim2d/mP/U2rGzzZaRHhkbupMtcQjHEwzHG/0+COVskoCpFcbWLjLEZPD+FglTJ2KlzhqtuRMUkkwPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JIyiTu7QCzAjlfuDW1hzX2VhrdEr2rHhHBlHANAcsfE=;
 b=PQznrmxL2+z6ZvlODkRiXY3jbdfhp4LwrqV0Isx+Icb4T0M7hXuBuUBaGlTBklket/BgzHBVqAD0qGjUPpjXbqRRk4pFJx/E1gOC0VzgUY2G0ZXEeSPQ3CUNOEd9gZi+TcrrNMPJEkxNgA90rfxsqjh0jL5b9oitxZyqC3Knbvc=
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
	ppserprodsaar; bh=JIyiTu7QCzAjlfuDW1hzX2VhrdEr2rHhHBlHANAcsfE=; b=
	C1RMOwWpoH4Xfqob4W1Wj8VcQ6F5F3955habByobVgc2LgV8fVqfObr+f/MHXYLd
	YoEL829tCbS3BwWu+8WcO79p2i7hnDvLmad6wjN1ymBwsK/2Y0YBYezH2dvBN1pV
	YbheRLDKvNp/CWTG283KZ1s/s6JwpnK712RGsuIsG85skEvWYtGFA1TZiJzJxUW5
	jcDC1BXMNmzbmUjt2R6cpjrNEO/dV1Oqm8XvUu+uxN1+wXBMhIQoesToPjLo/09N
	j6Vtvum55vjFFWvKzmDxvDj4gJJNU1YKkrbSV6kABZ9CXg3WhpxeS+jZpLdK2BIu
	uUVd/2Vl71OdMtLOg1entg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=JIyiTu7
	QCzAjlfuDW1hzX2VhrdEr2rHhHBlHANAcsfE=; b=gOh+OiCJxShutkpVXwvxd8K
	zrKsnzc8tPuZt307cr0aZxNwFYMj8S5FdN8nKBW6qDJ5YU3+HmNnxrNyZjs5xTa2
	+UgMwWIZQlQ2K1FQGSK3769fWg0sYpY/RGJAzkWeImC6IJVZHiN4XGuJ43cGQE9z
	6fkyPE/rkO5We3z+gYJbbhff61vJTLJa+1lzebDw1cFFVqN2F8QuMa/cPovN/me/
	c40x923l+z/+AWcYKONeR1ENCCBnL9WflLU85a01w6NCldGsb/QAQo2ZylCwrvhg
	RXnzXuwbmiInX/GYA28H5VK8fu5Axe6ekNlqn+uv1MASXbc3mNXzPheFO55Z1qw=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: jLCZwI4F9Mm2yjLCaw8hM7
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v7 1/7] xen/console: promote conring{,_size} to __ro_after_init
Date: Mon, 13 Jul 2026 11:16:13 -0700
Message-ID: <20260713181619.672176-2-dmukhin@ford.com>
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
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130189
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4D:EE_|PH0PR16MB4040:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 01d98f4e-0910-4712-8d3b-08dee10adb7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|22082099003|18002099003|3023799007|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	GrZlptCUF7VWxAT1Wrg1zcCu696SwxkzfRbmpM3V5YuAIB6BYq98rgEK3VYSmWLmta1nS4hL/aDdskCBmdoIAW4wauxP7UZb+/SyABZ+bYBJ/2vUjEFVkyTLpVM/z7hkTJh2mo5EJ3G74lSG7/sWzous8NGLpKQ8FMhLdWY41wC03MuhzRTtUbMDfxK1oGDMmmo22y0TJIznCBP/RAqeEkQUpEpEmeYq4uT0YXJttMyCynTCwjxdkX0YRFyx0sYz1zT0vv2/7Isv+5qyJ8mDcX6QQ2uKmmdabyY0DrQy0hVIQbSJa62GiiPKJe9s12GC1/d9lLtPP5d5JzE9bId1qfmFnsDi6p2p/Tz7hDRJ2dTeWEfa+THiIYwBmS4cetIHSi3CdduKNakxhtm7wnHCiaZ/3KUY2tCVKntj5qnyKDdCRA0ELAPUaaV7HA2DZzmJpLRwkkVtDkZ8aSPgURVZPEcnH4E7MyZI2mVkiNAyvRCtLrZ6CLRT9PVyw6PFs06f2AxmFHa5RVDGNcj4nhjRCCXzFIwVJnNp0tIGoi1zjOxakGO8YgeYLsuvbUs4omUMGJeIWRXTx2JZ41hCrG/BjSdrHl5GtKKPYDA2rpOofTvHY9Q2QWtcrAuYXhhqoTTqBxiQ7GHEWYX8MsLQfU2bU9k9Qj0Q1auyt32whgV5U+YqX37ql6BAri7wQnaW4LYoJpXlpQbjyN3ATu9nkepPQw==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rk0BK1y81F0fmvF1h5pgxrrXAgQCJM7LdClesjROKrcgqBEcz6jiBAEKmBCFa1dWYrPqyAkRbtZjlZDKBBGQ3L/wmzlx6U9BdeaTqmtKU51fUUGXEzUu0v1vZWwpyixQD25u2/WHs43RtzNV1vLBgO95te6H12eBvMEsB56bAEq2QEbYucQ8JnNYFAqg5fSvrUKE0ALGfTfcxiicIvSntMNP57dUp+1dqSTyzQcKNI9AUAgIVviZxqpveu3McJzcr8YXSiYTF7c2AURxGPZeklWQg+xAe5p7vlN/GyW9+xvu3Oo+oAlkHRCFhOYHvHaVendqTLyuXYtzikaqfGv96fhCzWJ2FNSjSB3FO8/82xdufQTMpCclWY6ubXCdIhtULBCAQAtSDzSfX+bbFKxOyWYl59pTSI7Id8Giu8nXLJuH7b68hFBkh5pG0tkxgws2
X-Exchange-RoutingPolicyChecked:
	Ulyktjs23rEYNLnagOlDtCOwLTPP6EBbXSZOJHDcnG14MObDpBFuTibVpXW3n4EGxrGvXgcEIJ7xT1Uqm4/6XD3CVWmUQZ1sXGxxLKIcnhqrZvTv+cZwm4bK3h7LjTJMfL+uLp/TEAiBJhHl7G7pw9Fs/GxT6GQIqSPVHJr97OGy1ia9iPbI/WqxFgzPU2Ii3qpXVyXWAwCS+ESeMAPSVsiSZ1JvU/tr8RFQ4D2cJW9/8CdIoA3vhtXUj694gXOmPeg/Gp9x5m/ibB7wWI39DhOJk4DP0eVPMdchK0asmfv0M9L1DX1zBWzCXW3Om519wENlSF0EjEBJX2IXIy1pmQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+xghdHhv8AxPHNprb/crKOkU4L+/1qFwr4J46SDnGsN0QZbh4QMzDQQmg+7+1ojOcsXSUyZZ0tHDQI/mHNFEtJHkblias0VSpLEgurfbLhrmM9xvah0HVllF9HXzfFKIXmAoC+tO+yNHvgn9nqg8gNzeRFKXaH9YuhQS0kg7/BRvxMAN+HtJFBK5FBI36grfiVYRvCFiwYen6yMCz1k12R0dZzH0PbySpNX8l5zoFosdGzPKGlPtGlALrms8cVVypjKrbR1uLeygGatm9hXNYrqllBWwQ+w7acxZJ3a0GrAvv7YvLTOI3x0hc0JcXo1Md+Wz0teuY9xu3PMsOB/eDX9+7enlD/Q3Y+GQpbw3TDIv2SMTnI/reWBKL26nbW4zaP3G5ceMePkg6ZnlB6BSG1GWFKctXzj7kP6xetfY7kHlb6qV1+rhDAbqzG9cdjA+6Ry4mwb+biohZeH7GZC59dEUlJhrNgF/gypv/EZvNXUP8aj/6nfTR+PqT1PQ4ZYH2O+jpFLil+jCGBMiQz5frRQtqU7J6EZ1FgSahUvHGgvN4nHM24wtkimkIn4BBNyJNQS35x9vbFV0mhM8Hh1v5KgXD5f0f+ymovFTtO5u1f2kkWjMvaQUiNJMxzxL7g3LKs49P08WRsHP1i7TRhBCFQ==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 18:16:27.8273
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01d98f4e-0910-4712-8d3b-08dee10adb7b
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR16MB4040
X-Authority-Analysis: v=2.4 cv=XYC5Co55 c=1 sm=1 tr=0 ts=6a552b7f cx=c_pps
 a=KjzTqp3n3Gc09/MFY+gPWg==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=WER9OelvoqQQjwJToBYG:22 a=cbNQJ9GKAAAA:8
 a=tHz9FfFoAAAA:8 a=KJnTikxRzMM2nk4UrzYA:9 a=P0bj-C3X3jJDpopQwM1U:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE4OSBTYWx0ZWRfXxowCfhq9cLjj
 yPwezLHgZLDU+TkZqGO2BJ2ORqQwCFcNt8qEXYxtZYBq1mKV0jZbb20WujgE0UB+7nzTdgZ+ljd
 kijyMWr9VPS1uNB42ZK0lIF0ZO1k1V+Hd1D2ojETWsJEsGLvrc/g9QpvDjNiOM7ikGu8h2yu7l8
 RXXJntXuGXRakjI64x+wP6+5OWcSKnflxm2G1cgfU6ejaMqLHe1HfHrRXZ0BUqd3V3f3GZAlFKX
 P+Z3HXEXdtay5YAGTWh//psE636YujpuW78ig+WQhaELHvT5fl837w+qpSL82RqfeOT+sTb6yuc
 2nezfLOLgjYq3qYO9ChYe+a5jXS+G6zJdgNThZ7+6VeufsZfd/rNVaRk68I9Oj/9SVx4+QV+NQi
 9cTdPwc9eSBYXzqqM7HRG0tQaFQRxpjCIEn6+UNptzgSr/hvw3ezVmvJf1QzkapayMu2HHm91iO
 WiMdbU8x+boptRmDHOA==
X-Proofpoint-ORIG-GUID: 0GSFW6DwP2Xl_MqnJLDHD-vbJ9VsB0u5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE4OSBTYWx0ZWRfX7SA+c1SwInD4
 gHQoeTobSm+QJdPeWZ3RzcpX388swmIpFUIY21OqPjR4z/Dk6jNgXgZZDYzDRi2ZNLVqFRVwia1
 9fOSQCCtJW+/7FqRFMh/C7YqJsLgqKoCKe1t7r7BZMjHmnU1eo2Z
X-Proofpoint-GUID: 0GSFW6DwP2Xl_MqnJLDHD-vbJ9VsB0u5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130189
X-purgate-ID: tlsNG-4011c0/1783966594-ACF47248-84451B3C/0/0
X-purgate-type: clean
X-purgate-size: 1463
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
X-Rspamd-Queue-Id: 3332074E678

From: Denis Mukhin <dmukhin@ford.com> 

Both conring{,_size} should be RO after initialization is completed.

Change the conring integer parameters type to `unsigned int` as required
by CODING_STYLE.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v6:
- rebased
---
 xen/drivers/char/console.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index dbda7f259668..5ebbbf63c092 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -340,15 +340,15 @@ static void cf_check do_dec_thresh(unsigned char key, bool unused)
  */
 
 /* conring_size: allows a larger console ring than default (16kB). */
-static uint32_t __initdata opt_conring_size;
+static unsigned int __initdata opt_conring_size;
 size_param("conring_size", opt_conring_size);
 
 #define _CONRING_SIZE 16384
 #define CONRING_IDX_MASK(i) ((i)&(conring_size-1))
 static char __initdata _conring[_CONRING_SIZE];
-static char *__read_mostly conring = _conring;
-static uint32_t __read_mostly conring_size = _CONRING_SIZE;
-static uint32_t conringc, conringp;
+static char *__ro_after_init conring = _conring;
+static unsigned int __ro_after_init conring_size = _CONRING_SIZE;
+static unsigned int conringc, conringp;
 
 static void cf_check conring_notify(void *unused)
 {
-- 
2.54.0


