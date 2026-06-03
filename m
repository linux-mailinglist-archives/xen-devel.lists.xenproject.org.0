Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8revLoaDIGo94gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 21:41:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC68363AEF5
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 21:41:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ford.com header.s=ppford header.b=h4Wdodqx;
	dkim=pass header.d=azureford.onmicrosoft.com header.s=selector2-azureford-onmicrosoft-com header.b=iLU8GoO2;
	dkim=pass header.d=saarlouis.ford.com header.s=ppserprodsaar header.b=YEQbOatN;
	dkim=pass header.d=ford.com header.s=ppfserpocford header.b=hbPjwiOA;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=ford.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1327102.1592314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUrTJ-0000cL-VF; Wed, 03 Jun 2026 19:41:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327102.1592314; Wed, 03 Jun 2026 19:41:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUrTJ-0000Zg-Pz; Wed, 03 Jun 2026 19:41:49 +0000
Received: by outflank-mailman (input) for mailman id 1327102;
 Wed, 03 Jun 2026 19:41:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wUrTH-0000Vw-WD
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 19:41:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUrTH-0050SH-Cx
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 21:41:47 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a20835c-2eae-0a2a0a5409dd-0a2a450cbb80-30
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 21:41:47 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a20837a-62f1-0a2a450c0019-94a38ff15f6a-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 21:41:47 +0200
Received: from pps.filterd (m0367130.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 653I5xgI1079095
 for <xen-devel@lists.xenproject.org>; Wed, 3 Jun 2026 19:41:45 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com
 (mail-eastusazon11011018.outbound.protection.outlook.com [52.101.52.18])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4ejq6xtnsm-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 19:41:45 +0000 (GMT)
Received: from SJ0PR03CA0275.namprd03.prod.outlook.com (2603:10b6:a03:39e::10)
 by LV8PR16MB6710.namprd16.prod.outlook.com (2603:10b6:408:25c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 19:41:42 +0000
Received: from SJ1PEPF000026C9.namprd04.prod.outlook.com
 (2603:10b6:a03:39e:cafe::20) by SJ0PR03CA0275.outlook.office365.com
 (2603:10b6:a03:39e::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 19:41:42 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 SJ1PEPF000026C9.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Wed, 3 Jun 2026 19:41:41 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 653JZLYC096985
 for <xen-devel@lists.xenproject.org>; Wed, 3 Jun 2026 15:41:40 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4egeh8ff3u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:41:40 -0400 (EDT)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id UrT8wKhOjpgi7UrT9wGCqS; Wed, 03 Jun 2026 19:41:40 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=HO4
	sgrYM85q5WDp6iJsWaYcI3Dejh0UmrUwZL5tEu44=; b=h4WdodqxDcJP4C0a66Z
	YljC+ZqfoHV3HXkunS0moY8rtki9yBl9b1vsVVOqaRYilOonUW9UnRAJzf0X/kDM
	ORcpsAkAEccABw8OXQJPsGqbI24F4KbF4GqENlSENFTgjytoN1U5P4F22sJCaSCS
	3yyD/KAEqJKUBDMFdOe9jFz5gRwBVGAAEy9mVc5qI8prHf95v93hMQ10vlqjZuMk
	WVSzFXoKfg3nvc0xJGhPjRNB4g2EURTo43spYa2aoHjDT2xxMcxDuyOeXM7pZdwP
	WdhQpcvwrup/DvCGVPvKUvJvzMMiK6l++qx5qlZa4u5YB3xry5LVLvc5VSyVB0WL
	rkQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fi7C6mq+Svn/YsgbILdZamvpEhe6+ejgFEFkBcw0jO3BOuQ0TkDyQVYmjXzLAapHm0HQjLfxBeUocfJPI/Yq4YP6at//Am/8Fxpc2n5gH3JfIaNx4+oQ42Lkz1EZJ6enlA57QH6JJrthVBpAtUYDoZ7dhIrCvVMSiqglz1WiHOKnkX5/rNeGGgv9eel+O7qGNbeHGgXbiIuYNPCRaVdk216tCasiQaU4CNr3Uata4xKG4I/v6TjecwypDPnWOp/FIs6sWaoSmwOSjGZSxITOIFNeyuCQLxNUvMmDd0pNtDKKz+F0y4oMnQN3jwlZsx8iyFndQbP0JHy+YxkNDyLZvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HO4sgrYM85q5WDp6iJsWaYcI3Dejh0UmrUwZL5tEu44=;
 b=SlnqE3x6azHiKnMOXk0JXNaxHF650/kmXbZtx543bNNo24HoT116aySPsRuL4VMWZ3FH/mak0Te/p20eShTQfQxgOrmcn+LyqC/P1dSghV7gDLNj4E935kLOb1pG7K6LHopdsBnen9wDGwZKUIWt4CvJLsboHVPfhSq6MSqE6WJJd/LdRVDK5HBb/hjewZODo3sNWOODh0XOhCL6zFmIjoD3JJZmTAzoYjzPSkmUgQpSAkQIuWqrRjNMQFjyH59MELuTn+17/zZrl2H5wUzbp9iQxlybAFy0qwvdQLXqyLv4EdJzcCmweabLwPtUP78C3TpWwdojeWnDh9vIJ7xHDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HO4sgrYM85q5WDp6iJsWaYcI3Dejh0UmrUwZL5tEu44=;
 b=iLU8GoO2GkgyG0816H7iTmMdrEkP5kM1beau5drLGpKWH6oubDs5AMlkGAOodylITLBJ3V8R7+Lytv7oo8dQRuAsyFCo8bGPRNv03ND+bydvr4GQsjGk3jeqq1b1qSclwt4txoXG0L/ah5viE02n4wZNivAwkQxlUjnZWmJI0a0=
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
	ppserprodsaar; bh=HO4sgrYM85q5WDp6iJsWaYcI3Dejh0UmrUwZL5tEu44=; b=
	YEQbOatN2xO9n27gfgMHrNDsekdQsu5x9CzVI6JOCLupp+A8462xSi2Go3pBBogU
	AdHAckZJ0b2UGMQ3myu0s0OagT3j60mx0q5ir5yHMzOE5KlvLI4vEHVey3IPwjLh
	M0aifiU9ssIP4AQB6uIz8o1f4qnqqP5HjnVYjeGG0g1oDGM4CiRHL8PGP+kOBDLE
	i7ux4znY96dwuh+5mdop2lA14K7jDp+XLskY4kmfDMZnu+ylqGBdNhZJnPm3EnjT
	SO0hhgxKE13NHxsUBwOoZDxmE9KB4lnbcgJb3eq1+v7uUSp8rV2Y8GJm7somBytM
	b8aGpwd34hwjo4u8n0RYXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=HO4sgrY
	M85q5WDp6iJsWaYcI3Dejh0UmrUwZL5tEu44=; b=hbPjwiOA9Oj/EtTxJ7ZctYh
	WZSBETJQ3LNePQ4Rl3jMhOXMd3YlF7ixJLOF9gb3OEvIT0BbUqor6jVo+mPvU2Tu
	ZGgkA4ketAtyI4E6s3ZqQ26zeYgUpKZejFNWmQRpWdUeCAdyE+KcnQjf7ZoCfjA5
	QeDk0Xw90ejKafyTEQ4VNDngkU4REVhr3upKsRklSWiE0GTFZ6Kfnh6hszWprJ9o
	utWpmvHLU0QTeIdG8fCZlguZRIClabPMGFgu7Cmza+3rfGECQ7u5x+Bdgfljwr4E
	Y26rjJurfmNJ0OhFR/9M161qidtgGDPtStwjrKlefgTbyrnilnsCTSSUeykA7/A=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: UrT8wKhOjpgi7UrT9wGCqS
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com,
        Mykola Kvach <mykola_kvach@epam.com>
Subject: [PATCH v5 2/6] argo: correct logline in ring_unmap()
Date: Wed,  3 Jun 2026 12:41:27 -0700
Message-ID: <20260603194131.1468654-3-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603194131.1468654-1-dmukhin@ford.com>
References: <20260603194131.1468654-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030191
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C9:EE_|LV8PR16MB6710:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6eea661e-27f9-41fb-1980-08dec1a82326
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Ukb7nehosVTHfSs1irg24N72ukD4iAuGjqGjs9lcYVacqeGXAsF6RgFQJYe1eGmxTkeHasd9+35VuXiSmSybzKiZ2UH52NtbC6AleQtZlGyOPimCUBQoPdNiJ8vwXtXpT98AzRQ/bVRr7FX2WHfP4Q1i/yetiVS5mRy7iFh8DA7JdwHI2AsTAAShOuDVsGVUeLBOCYBCTGhrqNeYYrIPGBcN8jlTVUzgJfoYaR5NVTJMcd8NDmEewUP/7EqTJSnLfyipNv60aHibROs609X1KkTfrp077vrt/Wiu0brPCVebRNvC2WiFJQaLuLBF6DYcaR6Uj/0Kp/AuVLPPJ7wmRc8ZL/QqaPCRa5MKkGsUQ3ub2LxfLV3VjlkgvtSPKe7UihN1TC8g0LxQVwGQtP4EoBeAc5JKQg2jMTftIJ3zAmi5PJ+0xQZxjx+jX7xQXkdSWbWEqO6D3XmtOKP9U7jgCUFY+fTCRPmELEFaQKN5bWUc+uqrDEG9ALsU7fisLwR2N1xb71Ann4Kyz8yI6sVhl2HfB5J0PARNPe5/nQ6uiESTytn8CH9Kh2SFL8UbdwSk8lzs9E3I4YW+3hMtn4ZTFik72lhXHoXl/mVGWrcd/afg94ynKSS2DoLpuY5CfaYEwjzAOrWQ2rXlA5JRNLFyT4bfq/DD4dWn8+rBOj5bHLy+sGdwUrCqoP22xlojSyo5vpRrVPy5u1H96v6YnZUw2m0kLP6O6g0fl5E5KVnOC8s=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+D3LljrH92Dtl8UOyy3conh1o4QQF4RTbS75NeYrlRqfOZLfz8X1kv+DDoC9rUYBq3XBel3Y/MCSyyuI5WwIzGS2fUx/2TtWowELd591+bBiVu6EIQ6omdmutyTA3Kauf1snmqRG020xBuNa1e9iwzxtyhILUA/ofaIHoHyTZmQ6bad41pvF9fLZ+Gxm9YmIU/rCwQxkjOTJYjwjPITLReg3dIyMjs7duYfOzqhQCMBGlrLQ2z31dY/EeDsNnaXq1tRZXYSPgAkicb+B19AvcFDtw4oIeB16CFo4dBxTDsS+ij3XUK1D47FTtYeZkhVAIB5cbJuxFo5WA7dv/PR/+5maP/NeVZPBj6jHOSrj8lMNwsWMOT3ynt17jouAU0WNwjoxzxQEV+1P8x3ynCKtBHCJTRdqA3cSRVeKGSjkUFbSHhk8etw/e+0Y9u5cRa1J
X-Exchange-RoutingPolicyChecked:
	dtp1j1Y503sI2E16mVE+V5qk7U1z7+gs68YJN+l+HhvDnjR5ghocTKLRV4kXb3YodFDM/eRRl/RR3AMygn34UfNgpAIh/I72uxGulc8+NVrq8NBJ+H7vkKH8HlxbOGXCspM5JTyHFqcUx8qjcloeR/ybEhoqutLXocwrZFa41CWla4WvD+4Sx6/2ntXsyf5hFAC09svpRqoc8pUgrv+wvzDcJ6UlN27wrwgJoiYROW7DOTAGAzf3P1ZLpHuTaV8CIQUx6wUM2/CHqcXODQrqPxKPHcK9yQ8dIr4EE9wMgN4A2PTB2PzjENW5uzagEu4ezSVc0pOAIQKA5wgPCMBrEA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AJEIMLr8mpqMmBg6MZzP8QdmeB2iz4RaxPz2blvyF7l0xVJCuvzu8U5RBUR37Lp7UrrI2ep1zsZ8iI0w3gLf5aSuIUgLjigfowmRmHRTZbnbJAtH6dfCKEo+fJJNpa15xZLMIdOesxokJAM3NaNWyOoJP2plpAY8mpIJKqp6Vg1WCj4d5qU34bHX2t6tyEHxraCv9gjHSJHt6TTqFmOhdoEdaqWari4CASghRFHr9FRMNbRx84JZ95tyNvMOw6Z98MgM7RP+/J3VPrRsMEflxkyqA+acN/O32d7GNLgrMR2eD9Wbvb+P3YdIGPVb/sloDEJJ8+lwTUgV2mBevmkn0hcuSCh6XwG+3F56f5AgwhAgLa5K1nk/9ybKnUeQtgy3hJxvCd1pUlgxIEXMWu6gNP/0kYYsKcgC6wApAntOogsz9KgGR7hcqdyliB+bKOe2xU/JPy14400yUNvpzNfDoEdZGbChgE0mPFzmtMYV6kJQ1w453v26gH4hcshzmuzlwzaSBQjuSPt//xxNjiTxECaVJPTBNTFWiFnYFPlcTArs8tGwo94IXVUPc7/KN8FBASKtoF8zVmHAq4p5IQYB1C9u4J6UExDJztZ6OuHTHXTH8vgOEs3JfMsJ465ObQc1
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 19:41:41.8147
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eea661e-27f9-41fb-1980-08dec1a82326
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR16MB6710
X-Proofpoint-GUID: agRrfR7lLK4P5IsO3Bg7GuyC3uG1Pafp
X-Authority-Analysis: v=2.4 cv=Vf/H+lp9 c=1 sm=1 tr=0 ts=6a208379 cx=c_pps
 a=gE6CMw9pMCRGQsgsFAL45Q==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=vnUQfov-gS4s1L7hHvr-:22 a=cbNQJ9GKAAAA:8
 a=DBfv99YmAAAA:8 a=VwQbUJbxAAAA:8 a=Pq0mfAL3NuNqQaD0pm4A:9
 a=3whSkbs7g9Me0DR5EJEX:22
X-Proofpoint-ORIG-GUID: agRrfR7lLK4P5IsO3Bg7GuyC3uG1Pafp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDE5MSBTYWx0ZWRfX1fUQB6CK09Ca
 eyFHl/Ha3ul4z5FIWOUdc3phxmFApvhnHjgZKaode3u1k9cAVqTMDP6EbafqzKU7vAmowPObw8r
 YG6Rs29mqoYuh0t4rEZssNfErI0yeyAOHzf1/iiiRK/GTCRt2qsqmTlwk3fTozLGDgyJHc8ZJ4I
 V94IM8a61v62fnhlILCJDsvNtR60irbKDSSeLZURZgY1G6Zy8T2LFh956YQRrZhr+8WwnVSvQmR
 EQZSXyY6Z4IUgj7r1D3I/WvvKiupbTlA82sBJbFU6UXipZgy62g8ZlZ+OYGhlN7p5oFjm2Xp3a0
 82k/fjWMUfIR1lupBBzxz7rNdKFrg/Kt58x1X5uFwJ0rMPJCjFhx9+GrOJoeq7Mjp9bAT2SglMt
 1O5U/FUSUWhkUI7Yx2OoCupoDafPXQdXC3JPBkmAKZ7FvmMLlTpoPZO9RdqQ5OUYel/y2OjxkIW
 cSoYfcLhZBmxFgyUTJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030191
X-purgate-ID: tlsNG-d25034/1780515707-DBB7CCF5-42BAFD19/0/0
X-purgate-type: clean
X-purgate-size: 1071
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
X-Rspamd-Queue-Id: EC68363AEF5

Drop XENLOG_ERR from the logline since argo_dprintk() already injects
the proper log level indicator.

Also, drop "argo: " prefix, since it is also injected by argo_dprintk()

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Reviewed-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes since v4:
- n/a
---
 xen/common/argo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/argo.c b/xen/common/argo.c
index 98a3db7fd070..5da14c929e14 100644
--- a/xen/common/argo.c
+++ b/xen/common/argo.c
@@ -474,7 +474,7 @@ ring_unmap(const struct domain *d, struct argo_ring_info *ring_info)
             continue;
 
         ASSERT(!mfn_eq(ring_info->mfns[i], INVALID_MFN));
-        argo_dprintk(XENLOG_ERR "argo: unmapping page %"PRI_mfn" from %p\n",
+        argo_dprintk("unmapping page %"PRI_mfn" from %p\n",
                      mfn_x(ring_info->mfns[i]), ring_info->mfn_mapping[i]);
 
         unmap_domain_page_global(ring_info->mfn_mapping[i]);
-- 
2.54.0


