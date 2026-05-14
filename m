Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBeeOcZZBmqhiwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 01:24:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1CC547C11
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 01:24:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309279.1580314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNfP4-0005i3-M1; Thu, 14 May 2026 23:23:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309279.1580314; Thu, 14 May 2026 23:23:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNfP4-0005f3-FZ; Thu, 14 May 2026 23:23:42 +0000
Received: by outflank-mailman (input) for mailman id 1309279;
 Thu, 14 May 2026 23:23:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wNfP2-0005ex-Fr
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 23:23:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNfP1-00GAkW-Rv
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 01:23:39 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a06594e-bab6-0a2a0a5309dd-0a2a450284ae-40
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 01:23:38 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a065977-af86-0a2a45020019-94a392174012-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 01:23:36 +0200
Received: from pps.filterd (m0482517.ppops.net [127.0.0.1])
 by m0482517.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 64EJ0JkU1662698
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 16:23:34 -0700
Received: from bl0pr03cu003.outbound.protection.outlook.com
 (mail-eastusazon11012050.outbound.protection.outlook.com [52.101.53.50])
 by m0482517.ppops.net (PPS) with ESMTPS id 4e5m601rej-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 16:23:33 -0700 (PDT)
Received: from BYAPR06CA0036.namprd06.prod.outlook.com (2603:10b6:a03:d4::49)
 by DS4PR16MB6827.namprd16.prod.outlook.com (2603:10b6:8:31d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.15; Thu, 14 May
 2026 23:23:30 +0000
Received: from BY1PEPF0001AE19.namprd04.prod.outlook.com
 (2603:10b6:a03:d4:cafe::45) by BYAPR06CA0036.outlook.office365.com
 (2603:10b6:a03:d4::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.19 via Frontend Transport; Thu, 14
 May 2026 23:23:30 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 BY1PEPF0001AE19.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Thu, 14 May 2026 23:23:29 +0000
Received: from pps.filterd (m0426315.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64EMmgcm3348713
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 19:23:28 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4e5m0yg904-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 19:23:28 -0400 (EDT)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id NfOnwIgnO9jbENfOow9sKa; Thu, 14 May 2026 23:23:27 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=ATB
	xlQzkMlBBhqJUrtzKUv1/x2JD0iJCkLqU8uZ7htY=; b=PTGf+2OGtNfZi5NFqLt
	kWuF/WeZ1nzwGlsxKYUMdzMPxncjiu0cVDkXp1P3bEF6QvUpuYNW4gT/TEIvp8y4
	QNZqnZWA/9uUZFAHpgkRiYJxesb/gxXoQiWwrQRhD03ndjix6HsQUb6WySYcTsfh
	BKPpaVx4m4kCqUtVFU9OlUS604X3QJ4nsPbd5t3aMD6c7VKHshkeg3KTJiWJptO0
	kVEsie4xRasZ6j6nS52B3yXqto8IahwoNNS6aFKOZia7mEMPVv6zkHiPmqtNWlZx
	IIylqVoU4BRljmq8CsGIi/QGPdvR/2V3rCx0CgC/J19n81CEeAXIpruNk0+UA1J3
	cHg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S046uC7U5PMXD76lUwajfyb6ex77L0FOtToPV0wswB0hq/fsHT9zDXJKCT+GzXpqWg9OgXtTxfEcUKJwMLx92r0ivR+78RCpfR0jPkuu7VajMLv5O+NhY3n0IC5LSRTxKWNOp6RtTLltn3pA1/b8C1bUJ51STM7TXKofCyMiys+LddbsX9MnzCfMyKYY50AA1Ks3nlyc2raaMG/lFbQIPvmOganTcgqywebCSmh3crmT39B2NkiOR78GwqbspQ+yn6ZI6pBPWoUSVsquM9YtZ4reGAxEFLGtXk2tVhSOQsvbnjoGTevm/xXg3e1S5RJJHuAemUfMnECC/QpKHBLCqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ATBxlQzkMlBBhqJUrtzKUv1/x2JD0iJCkLqU8uZ7htY=;
 b=EX2RHqJhP6UcgzwIicNemYP8W6CUdx/txpmcATj9V2iYeKK+UCe6kye3M6ugDIS9Xw5frHwWXhha/W/fK5HgmTzTXc+8ZD/rvPz1ntuB+mWRwvAhBnDc7tWE0PbJRroqeKR2yp49o0ep2T4uYynAdmyulo8H6ALeuVF4Mvtpp4Y56FKufYUDh86nTkIdXEE6MfKNDpoyaoYSucn2A3yT8HXCiPzIuz5yaooVIcTguxqxcz16zxK71jqDmZ5O37PkcItoAcH8q9hCREV95GmBOJ4srpe6IH3kc0Kpu5HYY0gH48hXpPkB053FHE7TPXjcrVn4owyeaGsNB/jaAcEqmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ATBxlQzkMlBBhqJUrtzKUv1/x2JD0iJCkLqU8uZ7htY=;
 b=DSBoGEfqQjOBeYmHf4b1ug2EI1dhuk1ASuaqd64Jaux5hmMBFRDQEQWFALWHdzN/Nh9vopYVKed+XeKgcQQ07V3ss54mS85rplvVqHHOxteXeMvoW9vJ2fgqvNW1wxpU9xhDyJ13RzYfHI1hc6KvjWqTLHnQr61aiCOn/1KpeoM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to; s=ppserprodsaar; bh=ATBxlQzkMlBBhqJUrtzKUv1/x2JD0iJ
	CkLqU8uZ7htY=; b=fOAYcCaB2eu6gEo9hW7nIinDJXBeERWFpp2YbWwJWbl6e6c
	aEyNiWpox0oKP9GcGWOEqGJYM3L4WAqiyn+/w9mKQAAe7TAp8kTZu9KF30OJvF+c
	mm+cN+70fxTEFe3VS615SMLO/cvMMojmF/JyRTZ3NnX9BS2ZlkgulkoXTDbpauFo
	VRc16eB7NaHDswVPBHE7Ctux1iWijFymZqPBZr4NVej48St89rDlvfC8xXL3upoa
	wgfne9kpnfAOMV06qxfpd4lwos4rIqZcPlP+9v+SfUw8VeEL8TCPLb06La6leHx5
	Zw+HGsZSoiYqX9C4F1qJA/L9BPB75DBaipMRUjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppfserpocford;
	 bh=ATBxlQzkMlBBhqJUrtzKUv1/x2JD0iJCkLqU8uZ7htY=; b=EQ1H6pQm4R7Z
	lu8N5cy3JsXRhJUXdesnxXjoJ6L9bJJBSsGqdQO7L1Z4KMe9e+WRqm0DRx6Nb+kZ
	EjaeWdqdWTkxiPzAJzhKDp96mbpvKQC/7t/yNmmHg4oIHycpiHkzOjM39T7TxpZ5
	BkqkFmM4bSKNZdJwrUDsD95syS7HAb0VFXilv0vgzPhOZDqTre/JeteB+NsdQgJH
	SHOKGbLUcGUQwx4ZyKQGcQF/xEFlznefL2ILyfDzZEW2A+fhWo0zC54X/OQBCyla
	qZKopr0IYr83SaVDATTYI6MMRgyDtY5m2Vk1odjKo/QJeooRej5a+60kVSkq+KXV
	stGZmlLBLQ==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: NfOnwIgnO9jbENfOow9sKa
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Thu, 14 May 2026 16:23:25 -0700
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
        anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
        michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
        dmukhin@ford.com
Subject: Re: [PATCH v7 10/16] emul/ns16x50: implement THR register
Message-ID: <agZZbUWUO5ont8Cs@kraken>
References: <20250908211149.279143-1-dmukhin@ford.com>
 <20250908211149.279143-11-dmukhin@ford.com>
 <CAGeoDV9+6fLR0ivJ0UisWk7gtqYehpnfDa_p2Kk0Ty7Czkbj0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGeoDV9+6fLR0ivJ0UisWk7gtqYehpnfDa_p2Kk0Ty7Czkbj0w@mail.gmail.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_06,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605140229
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE19:EE_|DS4PR16MB6827:EE_
X-MS-Office365-Filtering-Correlation-Id: 07cc11c5-d87d-4318-a7cb-08deb20fcebf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|56012099003|22082099003|18002099003|3023799003|11063799003|4143699003;
X-Microsoft-Antispam-Message-Info:
	jmQUsNE5rXULLmn6ZrEzhRmy878YXFZo9vQHaBBx5r4bx71FHDkgTJ/ofZBGpZbRzs26KtFmkiDGEbjCa6I2Oi7+IFu3877gzTNd35boNshFV5w57/0aIEBsklbOCfL7eQMRD5DJdqMBQ+GGNSYUNVbVIEcQIf0ptCmw29KlrOBkCk8fHv9neeG151+tw4HpKosI6ofTqD1i/emNi8ymOA9iuz0MfjR55eeRXcvnf5SF1+ty1RZCreaR9jgQm2r2Pd6GbIjYk3RXF4eZoX2CZJXjJglsEjq50332t45jCvuEDH8HMYw7AhL4zyyHzGaTAd0WD0Oziedu9h2Qh1LH8dwI6TvsnCqug6x9w0kmiMQjk05wC/Pr48kvzc2sWg/b8zuEHfGd5LQeceltg9sVIs8qeJkqCv64yEVlWeBEa+gb8AQhL/hU/zAOZVjDiaL+DvbQJSk0ko8vp7xO/7seLe4xTiNJDoaO33IutUgLCNKgnZP0bVMIkL/1LCMu6XDVI+OZ1AnESKhVR1yLCWs27qQHz4FfwrmRC5/yYOQ/IlVjsKhXeu4uxpAFG2fSyIRZcqkJ5ZKORJDQHsb1+yqDeQwuILTkEPaTRDjGQ9VPzImoP8Z/g+uggIVX0kVLmVURD+ynf2SyIz7Y4bzSKXCCycCguZOh/Cd40hxrLugWohX4PbczeleR0vYAjj/5YafCzoFOhhN8j+gwDkwuM9W9/lNhJqerQLANFtnDRYdpWBQ=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(56012099003)(22082099003)(18002099003)(3023799003)(11063799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WgGx4g1NFk3ZjquEkPQP98RMFH3qiK2vVM53lgGWpcQvL5rWmBuuHxmMnbwwyEHcgqWg9q3BuhEs0vkAPVz6mdWFaMyNjiXHzs03FnXKtMpCrelVu7WX1oeOeCalIne8QiLSfApa57DLYZ3+Uf+wR22M50D67/fP6zgsFL7nY1UnFmXlqK20IRh1K7QhiB3wFJWpdr+uOhqDiRM0kvG0ma4R8Ewrdc7PQWkHwjo57iICLKrCv+Yq2X6JKNmLPNxdckOjIhQ/v6qpC8xu5135y4Hyba0gDy4FbYzMlXjyhCrP167dBAtqY7k0JByeLpCDuNRa54KycMa+0NI0OZ2JnS60O8l7sf8kb/bC5csROGLopjeTlnyQGNRpktUQmU/aZl55A/HkvToOi5sJ+iP1wbTNJpr5Y4JfmWWXODc36ig1t2TpDzR6TRjVSKguVxCW
X-Exchange-RoutingPolicyChecked:
	JeAB6Cz9QNENllbek0+itoKcgToxl8pSKBCC3QDQTpBS/khj/CvZlU0s6OAZ5d/3JMMUcASVqW7c92rHdooBri6++Wt9T/FAe/HvDDaZIbx9ZgtXl6j62WpLNihoWeDPwfUSVPC5VBkSUkVd9bGiXgH9I81QCwXOuuO4GZ6xqOzBbaXMPm18btQkSgurVD0o1duZW6cvY+Oe1xjqI82GVPtchgXcgtZb2cqVEluKuKBY87WMHbdGx70bqW7bS+x/cMcAq2PYIW+YhDC7IQtVOVYwiSOvDQc+o86ONazNdaadCAsFK6BbPrwaPyiagjKq0SB9cS4vUnjB7dblCyIOaQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	D9v/q1rEIDQAso00zs3v2DQyzJMhntrD5mkncqOtizdMlU+m4mCBV9udsyaME+TG+B9kMSc1/ijr0OvZjv9j24/p1TAl/UAM0l+DoHcLxb0k5NlF7vSOOgIfegZZWU8XdaryuP/sAPPKHPfblSC/1NstO/D/5Ubdx+WbQBEEk1NDILiuNRwScaugu+jgOA3OabUZQAditPAxin2+JdZKuiHvtXli0w3452SUWDpLIfc258XSIrP1ktFx8NQdqDyEmouAxDIP4XriGvDHWmvFdsawd3KhIg1n82aRrowOobWFAMKu9rmwmK8Wz40NPu2o1sFCZn31HM/YH9bgelDyFeV/X6EFdXd5W35ejNeXIKa86YcXOPITe1tU//QdBm3oxG3/kLU2bCOjA17XRfsEAta5qPSes3/mAkQa6XU0lilinod5/G1y6p2S1AHLjJHJrAu0ckI4LWDGpmoi2VWLNoq4fEQ5dN+KLa0g4k3Pl+rocV6pNBUYKCCkEYjzlFrPx5s4UFTg7jVaMsKzcBwStUbB6wN420NApk3UKD3BUWaMlBwTvHa3M7nZ2X10Y3Kuq54HUX766GhX8duYh8aeLXG9u/U8mUyL7T9docDf3Jo3zV/DdsI2uo15vgMyHHnRuyksfMN3rKHOXHJyAgbiuw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 23:23:29.3317
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07cc11c5-d87d-4318-a7cb-08deb20fcebf
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE19.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR16MB6827
X-Authority-Analysis: v=2.4 cv=ap6CzyZV c=1 sm=1 tr=0 ts=6a065976 cx=c_pps
 a=Jpon84a9jUr9T0N/wBB0/Q==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=MLwXIh1eZMowsRZfVxRb:22
 a=mLnsDVdbAAAA:8 a=cbNQJ9GKAAAA:8 a=6gL7nlFioHPkPofxBa4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=G69WFyCBNqGPyalROSdv:22 a=xnp1pY6zelCj5OLna2To:22
X-Proofpoint-ORIG-GUID: 2pXY0gpZ7xS18VWZhp1C24NNqyBk5N_S
X-Proofpoint-GUID: 2pXY0gpZ7xS18VWZhp1C24NNqyBk5N_S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDIyOSBTYWx0ZWRfX3VYlizh4Pkb8
 vGwAz/y+1QHOhtIqBP0jSkKIMEoOgze1qMCot1YxsWerz6dE+ibKgZzEYw9znAHqCdfTudbiFY5
 27TuUvyXL82PZDxCsDzoOJ6u2Y8TkCsTzs4S8q3uAWvgTWenGNdHXfwBKwQOB4d0P4yk5YpltPp
 0bu/6IO/5EKfMgotV3JXres6NMW/4Tk1X6w3Qo0cxc7LsUWOFHFbQBsdCm8/D875OBTPQMvu+xk
 LTBI1GyJXr/9RSbk5bXUJBZplWDSC54N4CmQr3roJUPqz1Ex2c3CSTpMwqdR3yLmaKm7DOHkt3e
 WvWk/P9VdxHSyiApOfgJgETcxSYEtmylUQhpC7gY3ER+HMv3EUfBjWRjw/GVU3iBIEPwfXrc+7f
 BzXvTPw6uCh1WEpaWepUnQpZJjn7HsQSj9HeGqFLR8O5HcmD8Do+oROZJenB9eHCwmwJ2EHjkk1
 aPN8P/mZwAe5+onk6Ww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_06,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605140229
X-purgate-ID: tlsNG-720697/1778801018-81B70161-8D173360/0/0
X-purgate-type: clean
X-purgate-size: 3345
X-Rspamd-Queue-Id: 0A1CC547C11
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:email,ford.com:dkim,azureford.onmicrosoft.com:dkim,saarlouis.ford.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Action: no action

Hi Mykola,

Thanks for detailed review for v7 series, much appreciated!

Sorry, it's been a while for this and other series...
I am picking that up.

> 
> On Tue, Sep 9, 2025 at 1:26 AM <dmukhin@xen.org> wrote:
> >
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Add THR register emulation to the I/O port handlder.
> >
> > Add TX FIFO management code since THR depends on TX FIFO.
> >
> > TX FIFOs is not emulated as per UART specs for simplicity (not need to emulate
> > baud rate). Emulator does not emulate NS8250 (no FIFO), NS16550a (16 bytes) or
> > NS16750 (64 bytes).
> >
> > TX FIFOs is emulated by using xencons_interface which conveniently provides
> > primitives for buffer management and later can be used for inter-domain
> > communication similarly to vpl011.
> >
> > Account for DLL == 0: in this case, disable transmitter.
> >
> > Add UART_IIR_THR interrupt reason handling since it depends on THR register
> > access.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes since v6:
> > - added DLL == 0 case handling as per Mykola's suggestion
> > - dropped UART_IIR_THR clearing in UART_IIR register emulation in ns16x50_io_write8()
> > - simplified UART_IIR_THR handling
> > - updated ns16x50_iir_check_thr()
> > ---
> >  xen/common/emul/vuart/ns16x50.c | 82 ++++++++++++++++++++++++++++++++-
> >  1 file changed, 81 insertions(+), 1 deletion(-)
> >
> > diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
> > index 250411e0a7d8..137ce08f4e1d 100644
> > --- a/xen/common/emul/vuart/ns16x50.c
> > +++ b/xen/common/emul/vuart/ns16x50.c
> > @@ -149,6 +149,66 @@ static int ns16x50_fifo_rx_putchar(struct vuart_ns16x50 *vdev, char c)
> >      return rc;
> >  }
> >
> > +static bool ns16x50_fifo_tx_full(const struct vuart_ns16x50 *vdev)
> > +{
> > +    const struct xencons_interface *cons = &vdev->cons;
> > +
> > +    return cons->out_prod - cons->out_cons == ARRAY_SIZE(cons->out);
> > +}
> > +
> > +static void ns16x50_fifo_tx_reset(struct vuart_ns16x50 *vdev)
> > +{
> > +    struct xencons_interface *cons = &vdev->cons;
> > +
> > +    cons->out_cons = cons->out_prod;
> > +}
> > +
> > +/*
> > + * Flush cached output to Xen console.
> > + */
> > +static void ns16x50_fifo_tx_flush(struct vuart_ns16x50 *vdev)
> > +{
> > +    struct xencons_interface *cons = &vdev->cons;
> > +    struct domain *d = vdev->owner;
> > +    XENCONS_RING_IDX i, n, len = cons->out_prod - cons->out_cons;
> > +
> > +    ASSERT(len <= ARRAY_SIZE(cons->out));
> > +    if ( !len )
> > +        return;
> > +
> > +    i = MASK_XENCONS_IDX(cons->out_cons, cons->out);
> > +    n = min_t(XENCONS_RING_IDX, len, ARRAY_SIZE(cons->out) - i);
> > +    if ( n )
> > +        guest_printk(d, guest_prefix "%.*s", n, &cons->out[i]);
> > +
> > +    i = 0;
> > +    n = len - n;
> > +    if ( n )
> > +        guest_printk(d, guest_prefix "%.*s", n, &cons->out[i]);
> 
> ns16x50_fifo_tx_flush() splits wrapped output into two guest_printk()
> calls, so the log gets two prefixes for a single line:
>     (d1) PART1(d1) PART2
> 
> Could we linearize the wrapped buffer and emit a single guest_printk()
> (e.g. by printing both spans in one format string) to keep just one prefix?

Good idea, will do.

--
Denis

