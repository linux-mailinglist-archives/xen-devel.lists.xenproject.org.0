Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eF/jEsGUD2o1NgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 01:26:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC415ACAD8
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 01:26:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316099.1585663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQCmW-00049y-Nf; Thu, 21 May 2026 23:26:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316099.1585663; Thu, 21 May 2026 23:26:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQCmW-00048F-Kj; Thu, 21 May 2026 23:26:24 +0000
Received: by outflank-mailman (input) for mailman id 1316099;
 Thu, 21 May 2026 23:26:23 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wQCmV-0003wr-HX
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 23:26:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQCmU-004cIy-U1
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 01:26:22 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a0f949e-5cb7-0a2a0a5109dd-0a2a4508e712-0
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 01:26:22 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a0f949d-63b5-0a2a45080019-94a39217fad4-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 01:26:22 +0200
Received: from pps.filterd (m0367124.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64LN0SZe1003372
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 23:26:20 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11010008.outbound.protection.outlook.com
 [40.93.198.8])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4eabbhg3ta-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 23:26:20 +0000 (GMT)
Received: from CH2PR05CA0021.namprd05.prod.outlook.com (2603:10b6:610::34) by
 DM6PR16MB3765.namprd16.prod.outlook.com (2603:10b6:5:294::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.17; Thu, 21 May 2026 23:26:17 +0000
Received: from DM2PEPF00003FC5.namprd04.prod.outlook.com
 (2603:10b6:610:0:cafe::ac) by CH2PR05CA0021.outlook.office365.com
 (2603:10b6:610::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via Frontend Transport; Thu, 21
 May 2026 23:26:17 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 DM2PEPF00003FC5.mail.protection.outlook.com (10.167.23.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Thu, 21 May 2026 23:26:17 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64LM1EPb1815538
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 19:26:16 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4e7777x54u-2
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 19:26:16 -0400 (EDT)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id QCmLw3uqPhUj8QCmMwNjtH; Thu, 21 May 2026 23:26:15 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=auf
	8g2N78hDKKhKdiw09OpQe5vMp48j3NWYn9L2v7Hw=; b=quR89Q1Av7xCihpB2Ha
	7gGI3///Abw8N507ZaU/LPpcFsXCrmB2bmW7wg2yjzpSzCyf4nNFf51ZZFz/MevR
	LhT3d3VXuIyyHrh7NJcbG1or6HkH85MdMK7jzY5VDLdlEF4AW15irhT8B6Vcj+1k
	P2ULYAbcO3SHibwySrU0OLwLMWovmj7wPk2c0Rh8KcLuVQtxLBNru0+193zFPtNw
	ZGbePeKV7VNOjr6+3UROBcgO2bxUtoMdP3LrgpCJEDUASzGDUiWHbXaMOmg5k8HU
	+CwKd0s1U5x8e6LiAUlva6bT4ukOmrOlUwKiNqO45mk56gnM5WaNDbIBH47vXdLh
	mww==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c4tGOfOoKip3vZQuA8CTiRRCPm5AtKePhRzxfUpkEjmPwriOrrTxKr4YLLUefIMVnPwyXWj+lVubJxggq816eDui8oHNWs4yA2EJW12FbegWMU7ETkwRvOjt11z6JBVyneEi9PPWUv+YwjbX1Jbj0su57vdFetuinrnIkdnGfsaCu96tk3kIuLAUy8EE7sWfNmuwpK9tSK7iZAzv9jBhUPtlOFejscnUtaniVdl2spbudczX+oME8Sx/7l6dJ0Y8mjvXU+Y9mlrkWBGm054ACxcOAQCHTMZgJD3xHeg9JJa4LgVkx5iUJp2K1e93X8UarAvZbN1NCh8oBg6Uy/HRsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=auf8g2N78hDKKhKdiw09OpQe5vMp48j3NWYn9L2v7Hw=;
 b=lTjjV3N5csMhr2t5dIGzh7X7pyfRFr+lJwQdqb2EjLDf5px9d1RqCm3hqgsuSVFFuJoggGOELrWiLGtboYL2RvkCRFo7UgMI0HXp++JY0cIX1oAtmnHMe1YpY76hnCpZbnj/bRTl+VoJkBjPlvkyUXk4ZNdgev5t6g2OCZkm73pgIzMRHyACMXF5JkUVho+AVUA8Yx6mFS3txqIDcpQU++jPjOdgV4CD18vRSdfg4F73S2Gmvay/psU8lNSnh6obfJzZNOd/1Boah/7ILivyysCRLbr3wUlkma8GHBVey5u7RbZK+vfUUO49nibHdEIBH0V6fTZOM63yKzk/mZWkWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=auf8g2N78hDKKhKdiw09OpQe5vMp48j3NWYn9L2v7Hw=;
 b=cReLtkvLygJTvxyiuu9QhPypM5tV2IVhsBskHncFJZm1rxhlwEuhJ1wIQyEKoamlC+V3MFf2ZstUlKZOGJArAAr5gKksH1vkqM0WSIGXEHzfKVhoEJ4HBi5jvwaWM0hBhz1PGI6TfiAC7Jf9JdwDtonA0dsJ6mezZqlm4xH9IQs=
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
	ppserprodsaar; bh=auf8g2N78hDKKhKdiw09OpQe5vMp48j3NWYn9L2v7Hw=; b=
	kqx2gC/HkdlPEX9oTtI8AQIb01l88o/PnPeeYxJrodqOmYmGP7ksN9VuC0EgJgyL
	7/+IsL1A55/yylBSsCNxKnzbqePg2Be+CMhrO18PsGW7MMYLcOVZhwqKbvS3MtDh
	BJsbyopMqYAfXmbyVPF5N4J5OMEa7uZn41ibJlaEaK6z6SzfFgJcGQW43oNLdP3t
	lP1PNjcuSRq6wZIbvXVZH3TPm8dh1pVfhitHEJSJPgCV6qEBpnhllkjWfMLR5GES
	UMiF/UzXSNfUn7BPmUC79O97nYTl9xbz+yry+5MiznxGTv9ZBlkbdWik8cYWJU0s
	K9Nthl3Ga9/6qXFlStJ2yg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=auf8g2N
	78hDKKhKdiw09OpQe5vMp48j3NWYn9L2v7Hw=; b=hjestMZSkZDdW9MoBz4fTzj
	Bpx8dFwc7DrwbFDHFaHVgwwU9sAyEXNsAV1k+bkcO6fNxCi5RKTUmM6S2GhtgWhd
	4Ti7vr6e9hdnKG1P+OCxtciXEqpPicA0Ji3eN63l3al83tjl4DsOrkzLh7Bt+E/6
	OccB2XTAkgZnwGHSyq/CylzgmSVylHPs5sMqfZwlXUTLAXOJHg6kDI35qJnLWuN6
	2bnLzMH3pHO40VKJto4OcWW/WPNtG9x75cUUt7ohMe5XjW8PXai6fvf6ee5FueWx
	h0hViHeyPUo3zCiPK/sFemyYncL7YAwCTbSYsLDcLrRSNu8/ningXigIEq27S3w=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: QCmLw3uqPhUj8QCmMwNjtH
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, christopher.w.clark@gmail.com,
        dpsmith@apertussolutions.com, dmukhin@ford.com
Subject: [PATCH 2/2] argo: correct logline in ring_unmap()
Date: Thu, 21 May 2026 16:25:29 -0700
Message-ID: <20260521232529.694570-3-dmukhin@ford.com>
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
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210235
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC5:EE_|DM6PR16MB3765:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: aab0a8bb-8d25-49e6-f6cc-08deb7905ba8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|11063799006|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	fRaFnHN5xP75sUDvVxUt/5YFGT+CHiE2fkF4UGR00hHH/DRceL3ifjV7Nn0Yg+buRgFxz8+hUnHboJF4Ff730+nv3/qKng/7/15k6rMmMZ5hxthzlvZZA4bwxw4VYi4deVV11Ft6kj5xlxzCM0YUHY4SdlPjCA+vuMT36uGHpfZhcKpgBoiTZi4gks1j5Uzim0Qgjk2ScW2nFtqp9EiLQ4/5X1vjlsOroqtnYj/uwiRnHmJ7lTen9PZQvqrD0X+reMoKmz9LkQ4vh+xoFF3p3yXLSf/bZT+LSBxDIoPK9sA3+bkmpldANn+OiL+Cq5P7KtQXevKeVvytAUQ4M4aqRYqoRt2WWzI/RyWZLj9/foZDPQ5QlQ4aF9KsSQlMQPh4lv2/0Aua1T79nMlDO9hL8dj2kJ+hJcydMMXd1t1kqmZp3j0wc7iHoIjEab1+YeEs72xtJ37tvyrihiPSV5dGycNrn96JIA+bxceTKFDh3H5lPbCjgI72Se3+ot1IhghTzOJ5kbJkdPNhIH2l9RCpE1q5RoLCkbXaNGVPVKN3SLSdzgs6udyDaFNi9oL+Bljxd+VCLtVWumSV1vB50TX+u9j+vAr5CLbrVM8Cnx+2cpPQc5Uwl47nY+z1fzH+oMu/ha0rfuzf2px+CvmconCr+tTle/oUNRH+fB1jxxVscAEu0RP8kQq7OUnfpbm0wO7UU/nktSbau7+hVYcQJF7yW5sNgXsaQpMsZUZ0ZwqMqiY=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(11063799006)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	x2srf5sYsK3lL0mJVXkeQNXccoPD+K9WRSmL5BCtdR7PovcNbZXSLTJizRCmIF3ET8FGhBahDFJPYQLaHQPgb6gcnANkxqFaVJ6axpmDgfis46P/D3Qzfm2IlhcPzz2Sy5hAOuBmXEo3pl0DfO0O8ZphT8FTGIxhYdJacJGsGPGyi02Mpa0pq/Vz+S9gywWjpeqw2yqF3LXfR+d5+wYL5wghBRb37vId8H1xqRsR3Yfej3UkplL262E/4MyBfxFu5JRaTa+PEp2bOYGvIWU1cYYyGidKQbcV6Hvvswg9QFBbyqnhtwXjO9l6U2mbtFw61AN6PJL6m/KYgg9a9bzQorhbjD7a6q6+VGno1t462hMgy+nnOUj4W+SvAXCmI6VIHZdBI4HgwiYlmsPKosw5KNk7ZPeW6Tzh8TaeTFpkPN3RVW/1lkrkgigOsHMBnq20
X-Exchange-RoutingPolicyChecked:
	KKAWelL0SFmnAZ427JGl9LyCL6Xu8wYEXQ+eph30thTuZ15lRDYzIrAZqEp/7HqqdZxXHL5xbIqKlMY7zPoLEgDna1zINJWczDMx//IFcYDxNr6BolnivTe3IxrVM0a4KfVgSNOfik7G0cKprAF2OhW7oNevt6p2bovRITAGr+eXOYTAgIDdWBZV7Xf8Omw0D8YYeWkZnkqflx7fKkmJEdScM+zZtKe/2oULbUMYIeCOpP3zcI4C/9W5Ob6WUdNPMRRPg0hEhQQBeeXpNhVCpwR8Rt4BwVz6jVbyJmdB65gLPwalskXcBREbjrezpJlW/apKvHFeKoQn0BH0DAF6Bg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jwZOM/SkDv/Ov3Z5UXnJQV87KxzMLuad7FMy0MS3Z7ZEDT1Iwc4TPd6jyyaT19lrwyr/rlEOBxj8OsSuXLHiofDpGw0ojCW6Q7l5TX13OMLblS7lz9xV7UVX8WNTTeAdemns9ed71pX4IXM4PpDtPhDaPu8aUpADcHehaHw8nzvktwxm/NAancDjgSfqWi8qQU4mFqQB2Ihlcq+xgIX7yEUmOlEkszfabpFO//b+lmQxV+6aG/MWUBZ68H4+l5qNpqFrc5molj7SeQrhjefhJAP+uQPSKDcTDCHsqh7FaOYGn2n3CykuHrnG+NzDgmMf7d1+WVuBVEuYEsKMvIgYqs73CGGQuUn+PEZn6NuCpYvlMawpMoVebBHkfODBXFIm/ICDCca5Q/GfdA1pXMy8dopMGO+4V207GiNka/jT5rBCRhBt42RC6EjbLNI3a0fLFFlMuy+RllLNYlVZHclbO30h7o/xzzzan/O4pi9qyI8xO+3cAMnL38VFGljvwAzM2uvCu1XGrCP7cBsgWbWEegIijT18EkkGAkjCW82SSHWiv9ix6alaQFvqWWY0gJZ6NbXnKo2k1sfW/1mgr474EgDpSegZdvkBPvPAttV99MQIWjgCF0O0RPtyrDlys/Frxqc0/hUt6vJ93MAvjljCwQ==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 23:26:17.2224
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aab0a8bb-8d25-49e6-f6cc-08deb7905ba8
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM2PEPF00003FC5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR16MB3765
X-Proofpoint-ORIG-GUID: O0RyI6B-GBTwaXSE-PQKWv-Lou1DTjOf
X-Authority-Analysis: v=2.4 cv=LOdWhpW9 c=1 sm=1 tr=0 ts=6a0f949c cx=c_pps
 a=ugQZG2M6WJJQC2vHgpB33g==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=NGcC8JguVDcA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=YJXg7OVxOWrJwj3yZo-i:22 a=cbNQJ9GKAAAA:8
 a=hsdAAiz330OmmusoZBYA:9 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-GUID: O0RyI6B-GBTwaXSE-PQKWv-Lou1DTjOf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDIzNSBTYWx0ZWRfX81i7eoULKubR
 S+0+Oue88R4C+hFxVoCtiURdHpELI81oQCUOYh0l+Rykt9CB/ouHRvVR6g5YTZ8O90wyVkkLev4
 7Uf2eGrc01/CtBvY+zMef7QHDO3kzPGdaHj6LKzEpRmc8HLGlb4wj61cZ9Si8mwEeDL5LT6m16x
 T8gCmnMQwdMNjldlbXFhyFoWxw/4NkLQ74mofodmZ56zVy52mcvoymAyLbYZ7IHd8KyE4eGxd5q
 Indvi0ahltdnFGQLLlbklnE0+ec7jMCKmuoroIhX6RARKLoKt0w2c5IxkejjAYeIyHu2wdC7HEs
 IssZvlErEdtXjSBdjquDE2JHzRERHMbn2NCunPdtAvuV5wKr1Q2bMTz/CTt9x5VH6GJpDNWfyhN
 pWwT2ELT4692FWGdqwoxYGfqqrk8X5i3hHz1sVnTHEEjIChbYL7lvvXzv/DSjtzVcMOOmEpIx8M
 GEsDHYmJ8NK76bCkilw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210235
X-purgate-ID: tlsNG-c1860d/1779405982-B6368DB1-75009217/0/0
X-purgate-type: clean
X-purgate-size: 904
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
X-Rspamd-Queue-Id: AAC415ACAD8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Denis Mukhin <dmukhin@ford.com> 

Drop XENLOG_ERR from the logline since argo_dprintk() already injects
the proper log level indicator.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/common/argo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/argo.c b/xen/common/argo.c
index 4f894470698e..c66632486800 100644
--- a/xen/common/argo.c
+++ b/xen/common/argo.c
@@ -474,7 +474,7 @@ ring_unmap(const struct domain *d, struct argo_ring_info *ring_info)
             continue;
 
         ASSERT(!mfn_eq(ring_info->mfns[i], INVALID_MFN));
-        argo_dprintk(XENLOG_ERR "argo: unmapping page %"PRI_mfn" from %p\n",
+        argo_dprintk("argo: unmapping page %"PRI_mfn" from %p\n",
                      mfn_x(ring_info->mfns[i]), ring_info->mfn_mapping[i]);
 
         unmap_domain_page_global(ring_info->mfn_mapping[i]);
-- 
2.54.0


