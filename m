Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zTmJOYqDIGpB4gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 21:42:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB9363AF02
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 21:42:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ford.com header.s=ppford header.b=uafiZPL9;
	dkim=pass header.d=azureford.onmicrosoft.com header.s=selector2-azureford-onmicrosoft-com header.b=ddgCzY5h;
	dkim=pass header.d=saarlouis.ford.com header.s=ppserprodsaar header.b=oGFV2087;
	dkim=pass header.d=ford.com header.s=ppfserpocford header.b=KJuCMfXb;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=ford.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1327104.1592333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUrTO-0001Bp-Nf; Wed, 03 Jun 2026 19:41:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327104.1592333; Wed, 03 Jun 2026 19:41:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUrTO-00015E-JC; Wed, 03 Jun 2026 19:41:54 +0000
Received: by outflank-mailman (input) for mailman id 1327104;
 Wed, 03 Jun 2026 19:41:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wUrTM-00010E-OY
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 19:41:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUrTM-0050SH-57
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 21:41:52 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a208352-2eae-0a2a0a5409dd-0a2a4504e472-46
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 21:41:52 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a20837e-1dec-0a2a45040019-94a39217e510-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 21:41:51 +0200
Received: from pps.filterd (m0384718.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 653I65bT2842805
 for <xen-devel@lists.xenproject.org>; Wed, 3 Jun 2026 19:41:50 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11010012.outbound.protection.outlook.com
 [40.93.198.12])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4ejp35kg8f-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 19:41:49 +0000 (GMT)
Received: from SJ0PR03CA0028.namprd03.prod.outlook.com (2603:10b6:a03:33a::33)
 by BL3PR16MB4394.namprd16.prod.outlook.com (2603:10b6:208:339::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Wed, 3 Jun
 2026 19:41:44 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:a03:33a:cafe::13) by SJ0PR03CA0028.outlook.office365.com
 (2603:10b6:a03:33a::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 19:41:44 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Wed, 3 Jun 2026 19:41:43 +0000
Received: from pps.filterd (m0426315.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 653JCAq0035079
 for <xen-devel@lists.xenproject.org>; Wed, 3 Jun 2026 15:41:42 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4eghss7bg8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:41:42 -0400 (EDT)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id UrTAwW62g8Hc9UrTBwpUVs; Wed, 03 Jun 2026 19:41:42 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=qIm
	sTviORXUZipzsL/9ak61cQEum4Pv9cghsd2aYr38=; b=uafiZPL9XavAIc8agiL
	buNxTe/0Yh/+DuKX4odcg800Vq1cfd+XLTr6/VSwTJc1YYrLXn7kbOACAhmCZTcT
	xc+cS4K9MWGXnLgtKE7JLyuQIoFOeyaNVgbT5kRuJfgkNfR68CRN0MfNKTK4APvA
	b0Cht2dmW8sz701EzQKvOHu9JJLhClmi83AfIFAxstDTrhA6pijYsD2l1TQE5zSl
	jMbwtu188lubAuYkJHo8F7/AEdB4eaX9j7vIj0yOPMtKNzsuipD6qz2xzB2OUQWm
	10c7oXi9kSLELO9f6BVKa//3GoXcM2Kq1z2uSIM92LpB6NNn+wZZSxG6ma2ksdYk
	ZeA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w8N8Sm9yC4Xj0VfYPpPvI6Q8B580TBcooDo5w0Zjusq7jZLIg1s06NxDPXv5k+fVfW+4r6uh6qOmnMKQm42+MEI8o0mAmJHwt8Z0gEVAcxeqaTY+vwZ+pr6fd9Vx3vTos4UgDLwoDhxkla91PaPd98oA0qD0VLfC8VGdVLehprxuxjb7jdGWujA7SDy/Zxwj5tbM9NzyailkwbMmj10It6ncRgN92a4SXpH8nxaHC71umjRqR219S4czsDjoHOWhgsgddqOd7HbrMUfloTBUgPmPySoxtNS3p/GXza/lc6Fq0vimboDbLfSiYyqrsa8olhfwqGoAUdlOrkiivfXO2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qImsTviORXUZipzsL/9ak61cQEum4Pv9cghsd2aYr38=;
 b=FL1BRC+qucsqSLidAzBa37si6hH4UBwL/2PX0cSW2Wnmu49tu8gX/TyJCyeB0apXZcGyDJUZptXz9gjAJ6Y1OFJ/Rmk1u8C3YwyJN9CK/3rmi2OMFXq99thrnuw9kx877VuWt3AbKcm+NEm8edxQugDvq+k/vDqdHfzxTnSwVPPILbYTYgXEXfjLlsYpC7oDqD8RV5SmY0Zk9sdf3Vtvj+jtxs9VSvv60nlSUX9yHymmlfuMcUzkr56ngzh5Yu1A/rjDCZ3wJQ8Oi79gLZiWyYVDmJnYmS/qEZzHHUAO90ByHjXxMGp1lBGa0rD9YoqfkjTFDaQZ9wiFnCLPMLdejA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qImsTviORXUZipzsL/9ak61cQEum4Pv9cghsd2aYr38=;
 b=ddgCzY5hHWl3xTzjdMk+XG37zafVZcNfUJPKyXgS35BXW1dr5E85knqRgZJVVPhGjqnL4lVMtj8QnXhozWB0gMfV4zbG2PI4I63cVPQgVL7ZCaLcWzsVa6iJq/c/MLsbMkG3JrM2UMeja2bI9XRy9su/H9Q4pCj0NGDnjL5u5bA=
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
	ppserprodsaar; bh=qImsTviORXUZipzsL/9ak61cQEum4Pv9cghsd2aYr38=; b=
	oGFV2087wMek6u6WdSw/GFB1w5khe6Xy0GQ3zHOI6tC9ZpTC5jK+zNcjyhE2T52h
	i7NNng76ld6V8sjLIsY3gizeXxx7T2b/T5mC6HDt+H9QlEd85lIjpjovp7Nd1RpS
	NNHpkM+2pqEzeVQODRo4XgOUAHZz+GEFrRi5YV2g8PAE7IBsqvs4yNp0HIC5526e
	D4JgKHEFu6rytt2vU9N25VeyOR0F5KTIBMTYOWS+77g9IYM4dAcM/yaPUkuU3NF1
	UGFTRGbPNf5B24J1uWmYb2z2/Ljdz8Yrqtt0KNt9MbPQaOKuNX7f0JDqtN38J5nk
	DDQXkYjWKvPO5nUcWhOoRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=qImsTvi
	ORXUZipzsL/9ak61cQEum4Pv9cghsd2aYr38=; b=KJuCMfXbVfQYqqeZ/zGt993
	3wAE1I/Qi+AcvAz9vDTXEY9bwsO45RBKKhhxU+CSwlMQ5L/rZ4N4olFY5OpVqRiS
	V4X1SYVBFHag85EVdrJRyhHvI8SWhS1fJp9u+MIN8HNu6+gl6q42qxBC5DBuBuAg
	INpusJZgATIppwdMWqVL2fnrlsJIQ4IeEI9wbK+biqFl6Ktc36/D1/Eji9kWb85I
	0NakVca+cMoajnyWX2yrUg0sq7N111g93WUGZ+e0hNh9EycrdaKizw91v4pOrqIo
	8bSmak7r4NkXO2ipWEr1+jscPNjwFg8XEvLUr2P6aF9xJLnpXfVa5D6RK43ykRQ=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: UrTAwW62g8Hc9UrTBwpUVs
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com,
        Mykola Kvach <mykola_kvach@epam.com>
Subject: [PATCH v5 3/6] argo: drop argo prefix from argo_dprintk() calls
Date: Wed,  3 Jun 2026 12:41:28 -0700
Message-ID: <20260603194131.1468654-4-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603194131.1468654-1-dmukhin@ford.com>
References: <20260603194131.1468654-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030191
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|BL3PR16MB4394:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bc672c73-0032-493e-7e16-08dec1a82406
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	O0QWr43i20GsBxkTR8qoeEe53fYaxKk/L9vpo0gUGKfANGLhsNYUybaYmGK7+l45AeKdx37/TMqV3hhn8wyQXuL3XmwO0JRTBYoXUP7Ycy8h/O7XQIxKAc1QWXnupTCF3u1rxnlSZ5lER5XF/+6brpqqSz5FPK1rCBvcEMcPfoGbhRq+9tbth7kIZG4hz4o+AamwhZNCtqpBKl3NceOP1SxZkN/dLRX5cMfcRowJZHJOXBEZk+SL7vqO7nozYexFEtqpqxI/ZvPpjTEth2GNS50c5jCFr2ffWIx2yYWjV1rlMlT4+rRjbR4JwAvNtxnKHwHkIyBOg9B6+SXz7u9uaPdF0vRmsqH1mYwoSgiXdAZ+3DlMauz8o3HNmZtTwHi9q3zJdWF4rug3b7wLbVh6cKsQALHyH3dcNiP3sYXieVVbuQuKNm/kjGl1B0lhc7ZPwJl3JAX80enEYDpOyus56hucCUTZ3Ok0xH5JzWJv1qrRsyapPOIvyNeZ6EYHmMfX+V0z1WM0950AGgkAMjQ5EQ2udydwII62H7PwrgGewiisz5a6R4/SVEDTCtX0LuBlHxasAZ4bYAqb3Gva+L5sDu9Sgl0o3hCHcmz4l33Z3xRNlFgZ94xyufzMwijd59PinseuzsV6ehPdj9RWCxdoLo22Pk6pUU5MQ73QnAe3mzaltNxUbx8dEV5nMssc0VmVT5PZIe54K31tFd/bh891gu85kg17kzK5eSbRNc30A9U=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eD7kfx4v12fhBpZMD+uCQYRBOA+5/nj22K9e2abF36nqFZfr2Bewui/ZsF8QydcYgDNzXcIILfOso64H1ZJaaeKUlMORpW9z9kirjkRDRFpqvFE0aR/oaH4SHu5xAGR5uYhY+zv2NnWDZzw9yn9XIB64Nf/Is9EDssjdsC2o/jqNSMOCWI+FOEG2DMMhZDr1N7pfOjsU4Q/9FSKEkBBUCHVG6lNHkvv8or5rjYOnlItnH1804JILYTXADaCXHwGpHkI8Zbgrqbve8JHJsIuNr21OI9VPDMJ4vgj1OkKrrKNMcsa24LeTcXkTXinLIZq510e1OZezUd8/+zC45kmrZ8g/9VTaXBl8F5vSOLZWBzlOkd6GSMgDAScILLIR60gSuBntU4eZdRe/UNKbbB0tr60vnSvSd5NOjBSrzrTxsLSilqhMlK0rpeonQa06cJsK
X-Exchange-RoutingPolicyChecked:
	UpQnovDwLusJMIpdjVrd1lL4651bz98KGHRa+HeEX+PxfKnOWRo+esUQoAe72mmjOvYRkoeK6GtzErYt+p1Z43rNZV4J0287yz4ZvKEWw7BAXWqMT0if436v0/HVF/O6jMIEqjNF4Vfm0RoCBFRC5171cnZM/tBRjCfzZYu6IzSmUsoVqi87V5cuxAHnsBAMBjr9pHbijkTkI/tuZeRubpVTKoGcWIB3sMA8xMgPI6Lc55/kdxJMOH7u0xJB4kQOQnSYCgZ1TbAjNYWY2emtQuEjTgrv7OYp0ACe5Vu1rr675E4Pc9nnh0rOIgt9N6i5a20qo/9mY8KJTzMaKlfsHg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/S6jOBho7fTYzxekXYn1YqmtWlsoql44hWQUDeRrYt/f5mCfT9p/jiPT1+xpKOAnspyuMWYyOUilQUlfzR8EUHzURLHbXMBDschFbxLgROBEL3XiFDBPSs178eOJu761G5Ejn1wkjPywekY+KChLopc05vHHHU7g3xZCbkDLQV32qiLY9lvLBQwkte0FoR9RSC76QAKP1T+CKfXASzQzAMHFVq4KwCf6qMcTB5yBFzSF1V00WJq0S/eS1+vNGxuJIkHev+QHAP2jfTiwO0yciacBhbQUSbLpk58NT0uARWYL05nuLvvfTHLX5xAc40939wruKQuHHaMETC2TIdQ7LwkqdiCMbvdBp8oF9+ChkS2wP+3ld4SXilFBy50iwuRmThuH+n9+oce6N4gifAgR+HfuJycgQxyDjkAswYAU90zhcnNi2F5rLLp9M3pGpnKxIR4nEdpzkUrL5tRDmPwFseclzsvpMjRYqIfGtL1ggwA+tTNy3ks8AJE0TiWdKjPsxu7ZSfmqYNr5Vs2ceOW2s/F3gpI4Dod0EhcdZ/YoZ7Gzk05zjPeUzKO6ygI+lq6ntXl4g6e+cTN1dbruZVbY/Yzrm+QnR1SdGw7IfLoozefG+mjfoa021ekRzf+qo+Cv
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 19:41:43.3455
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc672c73-0032-493e-7e16-08dec1a82406
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR16MB4394
X-Authority-Analysis: v=2.4 cv=e442j6p/ c=1 sm=1 tr=0 ts=6a20837d cx=c_pps
 a=Ho/Krdd5x/ljPkV1+9yTnA==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=ARvDHhclS48edyKYUbLB:22 a=cbNQJ9GKAAAA:8
 a=DBfv99YmAAAA:8 a=VwQbUJbxAAAA:8 a=TweWIa6zg6WzoLAQ39YA:9
 a=G69WFyCBNqGPyalROSdv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDE5MSBTYWx0ZWRfX3kDojk8avYys
 DGfJVPwomoOGPuC8NaFouiy9mR8ONiiXd5YsfZatcmKe+qwMv0BGUhPOH5qlAi7H1nEc4rk7cKW
 VikRrP0Cib3QNyoVXTMNXqodMC+O06qYJoJRqr+MyX3PPGxCd+qUykJVh6lntdO9ls19WC306nq
 7u0I097DPbV6OUzn845jbfn5oLhqw7dcBVMysT9FbOyrtGuQOp1H0xZABsyvdGhmYpOgS/lGJyv
 mtJv9ozFyNYRH2hspv/CcE2XBXPrnF1NoxLLgDfaXHM1Uc9++bUMnz6cF+fkOZy2Qae+gds9bOJ
 nLtOgsBD6LXlQDnGJ74i6qJebac0OFQp5eKGUT9pFaI/qSuU+wPkeRkFS+voxQ60Y9UtyjUzxjV
 EnWCu82x8suP6IAK1xQKfdFjK5lzR/uisDyK/K8yJdOsQYKM5AznKDq+Tq67IroR8ZZFo+o8FjG
 /d9ZYaTFSLnxb6DSBOw==
X-Proofpoint-ORIG-GUID: Ec4SyGj_g7QhDia13tps7JxJWZwe_djH
X-Proofpoint-GUID: Ec4SyGj_g7QhDia13tps7JxJWZwe_djH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030191
X-purgate-ID: tlsNG-ebf023/1780515712-4014E3FF-33CFC7D9/0/0
X-purgate-type: clean
X-purgate-size: 2395
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
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,m:mykola_kvach@epam.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[16];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FROM_NO_DN(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[saarlouis.ford.com:dkim,ford.com:mid,ford.com:dkim,ford.com:from_mime,ford.com:email,azureford.onmicrosoft.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7CB9363AF02

argo_dprintk() prefixes all log lines with "argo: " automatically.

Remove duplicate prefixes from log messages in the Argo module where
applicable.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Reviewed-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes since v4:
- n/a
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


