Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8iUSIv7yIWpTQwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 23:49:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0200C643B0C
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 23:49:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ford.com header.s=ppford header.b=a4gjaJfh;
	dkim=pass header.d=azureford.onmicrosoft.com header.s=selector2-azureford-onmicrosoft-com header.b=Ms9hcmx2;
	dkim=pass header.d=saarlouis.ford.com header.s=ppserprodsaar header.b=WiMjk6Wo;
	dkim=pass header.d=ford.com header.s=ppfserpocford header.b=Fn3uExNe;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=ford.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1328593.1592996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVFwc-0003Q5-46; Thu, 04 Jun 2026 21:49:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328593.1592996; Thu, 04 Jun 2026 21:49:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVFwc-0003Ms-01; Thu, 04 Jun 2026 21:49:42 +0000
Received: by outflank-mailman (input) for mailman id 1328593;
 Thu, 04 Jun 2026 21:49:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wVFwa-0003Io-E4
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 21:49:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVFwZ-007iRJ-Qq
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 23:49:39 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a21f2be-2eae-0a2a0a5409dd-0a2a450ad506-38
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 23:49:39 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a21f2f2-56b3-0a2a450a0019-94a38ff12f76-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 23:49:39 +0200
Received: from pps.filterd (m0482515.ppops.net [127.0.0.1])
 by m0482515.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 654JnZMi440401
 for <xen-devel@lists.xenproject.org>; Thu, 4 Jun 2026 14:49:38 -0700
Received: from bn1pr04cu002.outbound.protection.outlook.com
 (mail-eastus2azon11010039.outbound.protection.outlook.com [52.101.56.39])
 by m0482515.ppops.net (PPS) with ESMTPS id 4ekfv1rwfs-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 14:49:37 -0700 (PDT)
Received: from PH7PR17CA0069.namprd17.prod.outlook.com (2603:10b6:510:325::29)
 by CO6PR16MB4051.namprd16.prod.outlook.com (2603:10b6:303:aa::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 21:49:34 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:510:325:cafe::7f) by PH7PR17CA0069.outlook.office365.com
 (2603:10b6:510:325::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Thu, 4
 Jun 2026 21:49:34 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Thu, 4 Jun 2026 21:49:34 +0000
Received: from pps.filterd (m0426315.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 654I8Q8l034326
 for <xen-devel@lists.xenproject.org>; Thu, 4 Jun 2026 17:49:33 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4eghss8yx3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 17:49:33 -0400 (EDT)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id VFwRwEQVqpgi7VFwSwnRrm; Thu, 04 Jun 2026 21:49:33 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=GD6
	wQDucYXx3bpD8hOg2ayaGsb/wMnxUAdOoavBa/S8=; b=a4gjaJfh60NOmeh+Xj/
	75/R+wwh2Z9iizqpv/ImMR6yK9IwN3ZmLDDj6fswxNob/NlkcTCIAchNhh9jqQ6p
	pU9MG8gVIyRmSFu7C7Ku7TL6Rg/ZVYOU+/vczlsdu/hTFJQqRjckVYlprQflC6JN
	5jY9vYQjmctPCD08DpCfXVSi1lneoKxC8NDKBvNyJPym5qwpYfpOgW+IrbQ0KMsm
	6cF+x4mdLkn499OUmoXUvuroJtN94njwVKgymAlNGAoP/tK8COxCDjIDnjbEBR1L
	YcFa76/TtsCyv+RSnW1k06Sx9vkhFx4Im2t/Rhl4cea6kC6lU/oxvnCyjWbNhPZ+
	3oQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kdk+pSTcoCg7S9VyST6brhkR9gHWYGF36TlLjqudQQD+hbLokwkGw/0aRsJ3r+eebQa+4ZbWlAqyxzcxbfTuu+/cKMzelGoYiA1Uv/QAUqGeSPkMymWR/YjzBHNeFoveDw8Lfm5rThPNCsyBIoBnilxAjbCwY3790J+W+CeM4Mq1UpdyYXM9M3coxABQydaTHb9yFf6zbLw/NmKWJb22BMHEMgog/53oO7CuNdTQPrNelbxD5ndUAf69+F0eb0sP6IXWXGZO+584/PdxDT450luAV5gp/Eb3Gi6qNqmGwd4LHLD2ETl+4U2ATyjZ6duMkTHGZGKZHIV0xHEJEh8qWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GD6wQDucYXx3bpD8hOg2ayaGsb/wMnxUAdOoavBa/S8=;
 b=pheZvj7vX0QSMA1zuZcgFSpZAYAhu3VdhGC2k29Wuy69zxZr7nJc7/okcDp8i7yvciWx0NIf20RL6UpZ1U+VT45RI41f/a0MKk8jsbwDx9e7ulQn+LtDskwbKgt7ALISuoxG0h8iEtLmsFCjzy3pIWSiK209VEScDS5bXG5rG3b867JaOtyHLttaP/Wagh0Q0U2e8MQ0o3GEzl07uieGOYd5FADIr9SZC53dAq//WKZUbpMRiBYyHOjHtHD3OnyxAz7yGUxC5jBIj5prOd0Eyas7D2SPXV2qqqIF+cNALeCk2WRVsVU+cv5Bx0YdgIRNSVIG9TizF1zBs8vonJdn9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GD6wQDucYXx3bpD8hOg2ayaGsb/wMnxUAdOoavBa/S8=;
 b=Ms9hcmx26yEqL0Panu6g6l6B+v4wy0bcvNUR1w91HaKPlEOaNjcFDHQE9Fgr1ar6qV4Gvr3yPU8H0TSTWGamcW/JloP+82eqLcvYAnLSrozppIUoI6GJMIrdSThE5KJSdHPh5GfNqKOwTTX3MEiJVTF/E6kMdMNOnEU97JyHz+g=
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
	ppserprodsaar; bh=GD6wQDucYXx3bpD8hOg2ayaGsb/wMnxUAdOoavBa/S8=; b=
	WiMjk6Wo4RGX5lk9agFBH70qGBd26qBOeYNv0t2ACYe4GhYKVrynSAEVg9G3Y3oX
	osgU7f2BxXqmiWhyYguDQfuKTgTR33HOhcVYR1/2e31pqeIZ1FfX1KKCpuQZpRBS
	1MeEnqNXhvwbjuhgq8AuqjbGz1Ha69ZxBQ9zZlRf5r4vPa2s0rkIogBaUh9ahGp1
	ArQMIAXs896w+g8D0WNsXGUQuwN7D7bKFW7/oKBx1xdHHBWPDk2y+KUombixkqxE
	8gJeoc3zujbYgr7rdQhHO3jCQAOAHJYOE/+GkRw1szUNwgR+HSmmG7fa6ES42BpS
	IaW6DYDylWI1LUx4bKxG/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=GD6wQDu
	cYXx3bpD8hOg2ayaGsb/wMnxUAdOoavBa/S8=; b=Fn3uExNe3BOHjdkZUxdnQgT
	QrhjtlPt2SkZ3s95uKXZbYM3VrZs+Q0cxKElglPUkHQHGdg0575zV66LlYfcsmII
	nJbRMxm47agf4cwGKZcuMxS2seUJIE1Em2sLmFeoFhVokhwfpvtYi3vHE0zhPWAz
	Xs41nTdh6vK95StKRr2v8m+kLO0BFX9ssAdeih6J9IhA//h4h/hg9e1DwexM+qMV
	1a5+Q2QzIvsVzapZ2HQishcW5+11IHBRLzcCLxklE+gqQbmvnuDtwmd0svpapWvg
	c/nHo9sr17xoNlHaHa9zfFkzLbPbY7n2QrrxjkBo1HNirGY5zOlRuqp+QicUxng=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: VFwRwEQVqpgi7VFwSwnRrm
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com,
        Mykola Kvach <mykola_kvach@epam.com>,
        Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v6 1/6] argo: lower level of noisy connection-refused log
Date: Thu,  4 Jun 2026 14:49:21 -0700
Message-ID: <20260604214926.1735194-2-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260604214926.1735194-1-dmukhin@ford.com>
References: <20260604214926.1735194-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040214
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|CO6PR16MB4051:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 60c368e4-7028-48c8-52b6-08dec2832a87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	5PGknDHIO5g+xUYRi5byXCNC6o8Dw4JkoXZIUeJvAXQ4QIZgzUXFQCKr34jvNus75YH0SoSbsGkO3pRy1rooWJ3LtqAeE77ANWU8BagDwBnmQ+ugNOAnp34zG0V2dnyolbi770WtEu38OMh0HXvJF55q0bJa3dpeC6rozq/RVft8Pq1uiBqMVGdWqxZjI2PhVuwQcwU+cBW++5ZygAaWb/Tz85GjJA/RcOm34M792xTh3DJSs+57b2hpj1vcgyToCL87WGTqrmccCrHtaIgS2DfpxbrbD8rKFrw5p2zE3R/sOHFHgcpzcHoAWOedph7J2gsJUdQXXdD/iCDSQyMnpCniVeIaYtdSlw7eSJTbY7QQR8DfOBRp0sSlC68m2kL5jIxSuJQht3QkI+XhwjKQP5NSCQqhgl8LMjkAFA1PN3BqqYlF4RklmQfWejg6YN7dmnnQY9/kLFiyT+MsKZgiv8dGfOSDObzuYq4L7pmVoeA0E4NP64PWC/1RpXCi1AfJkrjosduCZCmprNsSe+qrRpSMfj+M/L/z+Dmly++rJXVlxqop3Yp4MmgtSfzBjV3mL0xfBk9YMmIoOp8+tfrK+H6fbK0OmNJuKUhUBujFm+wCjGbXd4PeIjtJjQ5PvdA4APG/ybS1DEw5lmke/yrZLN8hRtABp8vTTS24teG9fUU88O1cLf8f0OHK85oKPVfbLiDkXLD47SoXdO4381PotMGG25M4sHo5W2NJtfIkozE=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UHBVE7GL/UzAC4IuTkh3A9RLhKYWdkDqrO4bAszyaiBXarKy8pSAlMetxnWgOBGMjtNiSWB930MGz+PHFvwpuJVYlUmCeGA3gKvGTfAF6eZbIVMiD7RmoatleNt7RKufBn520pkqEKwD9uxsasI2VM4SQ6Fqtv+mynuN+W78JmkiAj2Ro59eiQneIeFKTWY+rOtYALCHstIyAGVGiNUb4WOO3pXfmdPn0ulYx3XmberEVWxTMurUIl4uq5txdnnD4jZza6RtCNkxNcUUH/2cDJWRhjK3YagezE7ZtC02zB5yeoBjx0smmxajaBegU0BhDxuNDdrIeePlyqS2vzZESfWaM0cW9KX95fbwDenNbeZ/bM5irvpZyBRaShkvILCvwcB6Fhg62bUpaoPw9dr3TLzqc7itctLEC9ZtG209v/o1iyOwD8AGg5hsm/VP2LZu
X-Exchange-RoutingPolicyChecked:
	IaqkJK9loDJs6rR7cH6ZXinKnKLF5PSTGqwH1WNUAxxy9F3EBv1vJ9D/q69e8HtBhGz6l1Ecp94n53J1POjJWqZtWv2u2Ho/jtmOwmUdmYggqlbj79G7+/muZD8f5QZ39UbBN6gD/NADyAOc2s1E6FOngdTyUNFuK9+RzzUAqZnu4m+KiZRfGiCpEkoELLaBSpLdk5HxH3ueKtHdw36dBGOyxRlEjfOAE5yuLIJ8tL1endeMaS//p3QW6xsLxpcjU3rmp/nNX/D698R50b/2/zK57LS5omkOA3GAmSljxxIW0KCO5fXY5RCxBtLcUmTczQeR3c74hWpzwFZDytIkXA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ugGaDe/hXBTym57G/PC01aO586eDRJVCA9Pl41hwRstDxnMBZNnD6RvXaVqxY3FokwD7rQ45/Xs7eb6dVRFxMG5KqtWEpRouFhfCiReP07wO+m0JxJyOJsGskI19J2WvVL9IfYocs+W5hIjPjtjMDQRVqn+H22gNnAdNPXJKQvL1a3qCgi2C3v7gyte1bMib4X8wtmdBQ19D4OcodZxJn0IN/OdFBggSCezIuRS98BrIs5M8eci6rRfutQlFs0Irdxno9vfIueuwc+aXYEOa4o7ULHG7PJlo1Dc3i/kPHuOA76pS3hXlnVGEAaylpJsNqKQ+B+4mfd5sARrDggg4Ma706+OEmnsGZ+uvfeb8joc3bsGSrwwFnPhaPqjQ1tYVJD3xDDdWbOYXr5AzaD06x37yew+g6t2mFlckav7lsilpZl4YdziPfjsozAI/TINDyyfXzfPCYSp3Ibexb5+hoTAK8NzA4Zehg4b1dmDT68UGnMIQrFZLyBVTwAJ/AA1tUxmFqv2er/UWMQdDplH/KdVLM+bq30FIt0KhCSlTdQyyH4E9zcfnFgX3hwZWLeq7mSJRfHyQnytTPOm/btaL7kV5K3rYGWlN3+9Ui95kQK3ffBx2VaFEj3Cq62Rf8Qlm
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 21:49:34.1248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60c368e4-7028-48c8-52b6-08dec2832a87
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR16MB4051
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDIxNCBTYWx0ZWRfXxQud+YkW+TcW
 IqW3KwtJ94B1YOKkPU1TNE5z/o8fcCtcCrpsG3blNpXNSypJ9r6RWiK1jGC0Jp/zQu1FwuMbVyd
 0LcTB/oxfP00sFfv5fUWFj5Ki6ix1ltt0GfiTp3afy2j/G6sCp6X2xOq+oriXhSeatP38sIf7N4
 rNl9iFZ2UfjDM3CekdwKn4uaB50RU4YLT/F3hsYvT9c2wv6KgQgedx9L62N53yb9Wpbgk6NQRe4
 FMZVSd5TqSxp+fXLNfvYyDifhwNINPV9EdtHmSH0goYEjHM+EWyGBPFjRdaS50uvMVDf5Wiw8So
 C1S4Uy/NpHMhzevTulj2lPx49rCfCaQ+PNvJR+yLJdo8Lbah4ShVPGxC0me4rWs9QOPyl2MoEtC
 n5VqVHVSdZBU0kttrYgfMobyKdATRS4pPgNyiraVYTchqb3NiDuAujS9mdEZdFNG/66BhydURlw
 ewJIuM+n+tOqfkmp/WQ==
X-Proofpoint-GUID: RDgtVfrslup7-LaUinnKblSjNTGWKJa8
X-Authority-Analysis: v=2.4 cv=Ify3n2qa c=1 sm=1 tr=0 ts=6a21f2f1 cx=c_pps
 a=BlIXLFXQXelmgi4pYy3AOQ==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=0GA0A_IKJoUHBEAzNTkD:22 a=cbNQJ9GKAAAA:8
 a=DBfv99YmAAAA:8 a=VwQbUJbxAAAA:8 a=zd2uoN0lAAAA:8 a=UgAm-RWKtkRDnoEujesA:9
 a=3whSkbs7g9Me0DR5EJEX:22
X-Proofpoint-ORIG-GUID: RDgtVfrslup7-LaUinnKblSjNTGWKJa8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040214
X-purgate-ID: tlsNG-4011c0/1780609779-7196E8B7-3BF7F652/0/0
X-purgate-type: clean
X-purgate-size: 1576
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,m:mykola_kvach@epam.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0200C643B0C

From: Denis Mukhin <dmukhin@ford.com> 

Switch the log line to argo_dprintk() so it is enabled only in debug
environments, as it can spam the logs when a dom0 service using the Argo
hypercall tries to communicate with a domain that is still starting up.

Note that this also lowers the log level to debug when the argo_dprintk()
facility is enabled.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Reviewed-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
Changes since v5:
- added Jason's R-b

Changes since v4:
- n/a
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


