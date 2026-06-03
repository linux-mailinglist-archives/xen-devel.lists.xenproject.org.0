Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DWe0ClTEH2qtpgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 08:06:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B36BE634843
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 08:06:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ford.com header.s=ppford header.b="Aa/x0Gcu";
	dkim=pass header.d=azureford.onmicrosoft.com header.s=selector2-azureford-onmicrosoft-com header.b=eULxBhXT;
	dkim=pass header.d=saarlouis.ford.com header.s=ppserprodsaar header.b="OP/lLSSB";
	dkim=pass header.d=ford.com header.s=ppfserpocford header.b="Oxi1BH//";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=ford.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1325659.1590998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUejs-0006YT-Rn; Wed, 03 Jun 2026 06:06:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325659.1590998; Wed, 03 Jun 2026 06:06:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUejs-0006Uy-M6; Wed, 03 Jun 2026 06:06:04 +0000
Received: by outflank-mailman (input) for mailman id 1325659;
 Wed, 03 Jun 2026 06:06:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wUejr-0006Sr-6H
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 06:06:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUejq-00E2xQ-J3
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 08:06:02 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a1fc446-bab6-0a2a0a5309dd-0a2a450b973e-12
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 08:06:02 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a1fc448-212f-0a2a450b0019-94a392178eca-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 08:06:02 +0200
Received: from pps.filterd (m0367123.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 652KYqKl3077311
 for <xen-devel@lists.xenproject.org>; Wed, 3 Jun 2026 06:06:00 GMT
Received: from byapr05cu005.outbound.protection.outlook.com
 (mail-westusazon11010008.outbound.protection.outlook.com [52.101.85.8])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4ej6baav0y-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 06:06:00 +0000 (GMT)
Received: from SJ0PR13CA0082.namprd13.prod.outlook.com (2603:10b6:a03:2c4::27)
 by BN7PPF81D206FB4.namprd16.prod.outlook.com
 (2603:10b6:40f:fc02::715) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 06:05:57 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::1c) by SJ0PR13CA0082.outlook.office365.com
 (2603:10b6:a03:2c4::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 06:05:57 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Wed, 3 Jun 2026 06:05:55 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6531WFSt3759767
 for <xen-devel@lists.xenproject.org>; Wed, 3 Jun 2026 02:05:55 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4egeypmnbh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 02:05:55 -0400 (EDT)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id Uejgwr0MwonD5UejhwCj14; Wed, 03 Jun 2026 06:05:54 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=3aA
	1EY4eaU9okt1ObDhHrDDu+HiPM1BTn9QeKTM2k+Y=; b=Aa/x0GcuDTQREBeghqW
	+OMPquyGuQuxWfJ69CFwf/EW3HTAOAQ+fjEZWi2nbgI2Q7ReTNLLXoInhV7ZxrU6
	KOKCVLpH3m/OHPkPLSlOluYapa4h4/hmbh4E15lFs6OdC42EGxnaaCgRrOFPi4zN
	EPoNlJH0ZGt2AzohfJDwwb8ihinFES0o6A0y9m5RCH69bEjXzzWxONbD2c5v6hII
	VrBSKdhDT3AykPjb6FJeCBN3yRfRODlTNfQuA7RkTO00OXOhOtKosbhRAYIJg5q/
	6W8ULD8g2FLPSALB4MYGeP++kpIJikSrLwwqHpBNCJw6C02BEsZGKM+4Eki5BQbd
	Esg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y7G9D6C68hrBwP7awZY5NkXO3a/gVcuiej+CWRL2uZylyn4eCVXtdaIvuNIoNdLvST4A19v/LNGnz3h+nQ02rgPxSjQMHx+l2RJegXEEK2NYRHFdaX97kKpq2ZcWvGiOSMeIq5Ehry3SgRdnMzARstoXgjbVQcCYqBK0DplpGOjA01pYVgGdOJZI07xtZMhGcqV8g6bR4bh+O91c8svKKor7R4KxKwY89Ke1bw3UXvDeufASon5fRxeF8mvo0xOhW8h2WXMtBMw/45qVi/NM42kBkdMyoHeJpTmYpHCTNB0awtI8CDvZrfUUeKOYuhu9mPs68ZeMXKfYx5wNY5Ej7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3aA1EY4eaU9okt1ObDhHrDDu+HiPM1BTn9QeKTM2k+Y=;
 b=yBFFC5OarirrmEE++nIHBALE9/9RYzQnVPPTkhFTWM5p8F3zdwzd2sLqg7nPlGHZOYNuXAmNTJRC1Bb43EynDzdh9+bLErB+2FgTRMiO5flmXklav9yLT5t3vWy4Wo/GvT3KvW+xyXhBjs3gwx9tL2Lut5VPAkCYhW3cw2MX0juyOdOr3WnU09W8G9WPVZvZAqtfpWWBLm4ey1k2H6CMPR260kSl0vLAT3D4I6p0AMzIEBhoIa0mAvGa0pp6LAUhdmaxTdziFj3w5hUCcUSRwIo3J/LX8WxAfEd72LlSC5Vy1X2utQ3yGPgCJjpAvOPjoEO2uie8FvcdDkRaeGE9Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3aA1EY4eaU9okt1ObDhHrDDu+HiPM1BTn9QeKTM2k+Y=;
 b=eULxBhXTZzXJwJdefHEqCZdJVka/UiUpn/fBT1zlM1Itk1JhEOlFqPa6ZnPw24CRfCM5aZQzfyxHmXxptZNT6tFC+CHvsprI0+1jcnCfS+C5FgK3a1xI8grO5m9MyhHk3DlOwzNOaUnw4JsS0dVz+S2cDSzFN8mHgGHS2ZMS7cA=
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
	ppserprodsaar; bh=3aA1EY4eaU9okt1ObDhHrDDu+HiPM1BTn9QeKTM2k+Y=; b=
	OP/lLSSBS6vbxIQ1YRbwDjOpCBgk8bbGJmDV8dn0CVJfcmGvG23W5HtupndRfb5n
	o4Qyq4YWcSdDWwbP5z2tbLZBL+xuY0y/FA9UbO/EzSWdEpFi21rdPnQwtH0RdN7k
	FRq9nkSIloZllfAfk199+bHwPyOxUZH0TB+LoRLpMWJcpTJiHDMJ6vBaD2xVaqlg
	27pWj8n8MUr5iw69auCKn+E49VcLT/w16PgSV72tjPyn2RMgVZ/tim4p4sIgZFIh
	PXKuBcq0oJHNbBIORFoe6m8amxTYCDzCOUcQDAzSN+zSSJrgEr1rhHHxmuVdTcqj
	70fZ6J9KTiudIfntSrfrhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=3aA1EY4
	eaU9okt1ObDhHrDDu+HiPM1BTn9QeKTM2k+Y=; b=Oxi1BH//gwkmCON6FYgi50d
	bo6R/xfv1yU8XBUQ1zj+D5MQxcfcDN1bMijgoZ+2jkMsBYCQyk2YjDKdg5A9NWMx
	Dr0OeUZ/h3KcFSZq3hCCPRkIFTd5G3rb2LAye7y5nBxS0t5AunPXz0Pc5NR2wWcn
	UcGFi2i4b6rY/CZRvDPp7iAajZJUIuDuc76eIc5hX0WXmxRFQ47f0NMdc/DRB2F5
	nX3jWTePF+d6gnCjkRbsU4XjoQUb0yau5cUwKPrEhzKpl+V+3xTuXBAdbvwW15a2
	jJqVlkR6iDFCGCLD6YZrBPvG6jAq2qxMSQ2IM55tyg3thpXuol/MmdzYnp0Pqig=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: Uejgwr0MwonD5UejhwCj14
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v4 4/6] argo: fixup argo_dprintk()
Date: Tue,  2 Jun 2026 23:05:37 -0700
Message-ID: <20260603060539.1181809-5-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603060539.1181809-1-dmukhin@ford.com>
References: <20260603060539.1181809-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030056
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|BN7PPF81D206FB4:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 51597b04-da4f-4ca3-5657-08dec1362cb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	9HWjTqkxHPVpD+IDx6Yz8LnwzLpacOu50m3IaJNr4Z5BOR3f8qPUKBfCCgwFjFigfnOm2qBRJ0nTUuFSE4FRxUyy//mDDFOanCUNWp3YP6W9xI878Ej0Ig3psRpTQve888ZTkJxMJ397ZdKq8E7d5pCfH/CoLrqJlfeu3TZbiZLvSKnnSzr/Sr7nxbpEyZ14BnRIV0w8XN17qcYGwX0pJBo2RiiQwuRGPD7V9fMklD0ofQ9qSYftiwLgB7pnrWvyyMc5aIM0o/CZ/55UFgqim/uEw/kfFWyRhDojt7a8TZTTnBLZPjZN4REkPsqKbZtQR5mcUtKwwSTY6VwoqTg/nCo5m3s7FpqnM/rkTt0NkHaZg1TZpAsnxXDtEIPwLw/HBYPnGXwMO6mQkp5u59Ppsut5cHbdL8cEDZFWfDl38rJTMZxty4pip7QwA7Ubr5nUU+/R27tfhnxpBtSVIyggU1N5TMgw32Q8VvUUd2uySyMdQxSh25S2f7zNGQnGhxZ+jHGsr9X0AoQghKy3zs8ABSPAx3kYfeb5m7vGDMxsTYzdDqZjK4x/AnirNL9mIu4LX/AdF5mgg61IIwidS2taVisPKWwNCuU1XBPeCg/nupVLnCEWYVI1rO2UZ+g0trVJ3tuqqJXfZorP8ZNJm7FyGzQOQiATKwsVwMteSQRh92qWdmImWfr6qJQEF2+poMNelNuG9b4XyVOrdiXn9wxmAbraH5bKvylBNwsX1JXMr9o=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	esg/m3aSDjDxLztjopdKYPk9F5phYq49Co4DtWixRtFlMQ9Uy1acDgh7hpo/P2pWVUQi6DM/ES3oi3KTJ7WQLBH8oGPkWFgWupbOqmBe4GJR3TufEWpAF447wtXWnWH9xN3Ygf931S8U9C8JON3+g6ZmtVm22bb7bnKMY75Kre+t4s7NfM2eZntOTS4mKsX9UiFJl2ISbIwXpgBbVkn18gpVmFp/wt1WfEpDy1KVwX8ucpmITTZXsIG/HTwQEeKswICrPMvYlODp8DM72U78M4FYYXLuQ/7IigzrdNr8XApsFvSxzGMuo+DC6EMKfzxVCeIEJaR5Hc4NZShMXquqfUswfEwPRCfKmRCkKGjA/NNV57Xf1m8YpAA69rLmHAkoyhwTxu29AYGXcshhDlUQGXDVWzp6q0KitQ23W9YZOJNDqFl07ZYUXyshjXv4pnEo
X-Exchange-RoutingPolicyChecked:
	XbU7CQcQHGjoxEWPvdH1y8BiKi8XPigF31TnVAGQm/chbTeiOU/sRBMmULimVKoM77/O7Ncn7uNNrp9VY1X7YZMnJVLEedbMUB2kYzueyZAs/ZmZgHaNdhuTxaLEOcbQsd9/+pVllXbZdyOyeJbI0ihlBkmbnqvKoN3/po/WjDJ18TuaHbfzZj5Y8ZF2AGJhcXo4IhFXzlqM1du1VXDdYm894ftHXh7Cfd5/mli5TPfSsvQ6lNPLExbenUyigGEqdN+fD3CoNCis9cduufCZvPZUdm2r8EDd/y+rDUXOV9DVnGMzc3v/UWaXmqZ5AWDdoQQihtVTfbePRAdebDHpeg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QvdHl65Cf62rHSs94H8t95hPACAyWA797plww7F8oQ2mjpGkFuse8gwGAbhWZCYdWZKvgHBoMyjvpiU8fUIMYN1CW/44Fn558a849HPikvL0I//ud/Smr8XvzQmoqLdgidKMV7YHXCQ2XG4Dr9lEP3owY+FXQT8OgvZEU/y7tG942dB7GfZE2RKndSpOC91YZNTtjUqE4qHOx13i66mFsEswcvH7WOzU8Ks9SWdqZcw16iGYG+ZUacoQ0HuRK2Cl2OaxHu++tGfBthHx5bleTO2Q8iDVqeGN/69daixBByADofhyGaXRiP8F30VKv9+Va5V25OlsPz1V67cOHZ4Z8Kk8wCSlDPl91O2S7M76UlNjBC1liaCtJMcg8gEchyzwV78kYFDA+BVXfYmjoAgYy3e48IwZsPSgXNdA3MLT1desG8mzTG9UZgcXkyIyoJSkOH3PyjG/aJKcbPAu1Cs5gC1Hcyds4cP9l4O1LLsIB6c+QAFtLaazJQ6rNWnaRjDOKRMzW3D8TS6blnBkMBAN+03Cnz8hmg90hIUzMEHyvSPdO2RFMuP3ow7CkBaOrcda6WT9OfQ0w6qGD0EpqfkKOcp8Z90hZlAKVV6vVEsP+FgIwmuh+RGBLZOVMEmRsAf/
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 06:05:55.5284
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51597b04-da4f-4ca3-5657-08dec1362cb7
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF81D206FB4
X-Proofpoint-ORIG-GUID: QNDPsamN4g3OxCbBIjHd9YFBqHkY1wz4
X-Proofpoint-GUID: QNDPsamN4g3OxCbBIjHd9YFBqHkY1wz4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA1NSBTYWx0ZWRfX8fVayBq0X217
 0k7leP/oEc4ahPGZaQfBO1OTTbf4eybdD1H0hlfX90GK5Oxep6zXroyHZio5J9zc4riy9VCiYWq
 N02aN23kvLQAh2nB12Jrn1o888RiKu3d3pKcMGttzTk6q9WJwvVLFW5FNLv9x6eUEQ6qq2qcVAm
 AYYK9N83kXbZAau63M4gV+V34djc6r4w1rJQq1QBhABQXy2c3NLYFL+ajygFRuvj3ZuR8xqiujs
 gJ8tZaju5IWgjLg6niUTcdQ3JWM1SbdDaBG/UuaV8vbfXHrulDKuxGT8PUgO89pi4cbmEciV2yv
 FJcBDVIldVJQFEkorGwujQ5RvTy6mTAObrx8t3DiQl8xxRDuTsHHcgzgL2kQbNfbQ1lIsvzRvoq
 FYbfPCKlFjZFUK84duTSSSSGqQ3NOkhA5bnR+sveh72TADS9LjCDjvh1Ws7wwUr6aoalm47zy0Y
 vqFPo4EDqaz7pKFEDLA==
X-Authority-Analysis: v=2.4 cv=VZnH+lp9 c=1 sm=1 tr=0 ts=6a1fc448 cx=c_pps
 a=WNBGq+kRZA72juK154DUDw==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=N9_n2FxmZfwfyRXvS9-E:22 a=cbNQJ9GKAAAA:8
 a=VwQbUJbxAAAA:8 a=pEvCPAv3zxDdP9UjV28A:9 a=3whSkbs7g9Me0DR5EJEX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030055
X-purgate-ID: tlsNG-42698a/1780466762-18563F3B-DC346E65/0/0
X-purgate-type: clean
X-purgate-size: 946
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:mid,ford.com:dkim,ford.com:from_mime,ford.com:email,azureford.onmicrosoft.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B36BE634843

Current argo_dprintk() implementation is a wrapper around raw printk().

Rewire it through gprintk() to allow for better debugging context
(such as domain ID).

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes since v3:
- n/a
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


