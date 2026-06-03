Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lAUrClPEH2qspgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 08:06:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8E063483E
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 08:06:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ford.com header.s=ppford header.b=n5lT7sse;
	dkim=pass header.d=azureford.onmicrosoft.com header.s=selector2-azureford-onmicrosoft-com header.b="Xs/GYmOm";
	dkim=pass header.d=saarlouis.ford.com header.s=ppserprodsaar header.b=MZrpFyOs;
	dkim=pass header.d=ford.com header.s=ppfserpocford header.b=YYdEBK3m;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=ford.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1325657.1590980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUejo-00061P-43; Wed, 03 Jun 2026 06:06:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325657.1590980; Wed, 03 Jun 2026 06:06:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUejn-0005yv-Va; Wed, 03 Jun 2026 06:05:59 +0000
Received: by outflank-mailman (input) for mailman id 1325657;
 Wed, 03 Jun 2026 06:05:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wUejl-0005ke-KJ
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 06:05:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUejl-00E2xQ-11
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 08:05:57 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a1fc444-bab6-0a2a0a5309dd-0a2a4505afde-6
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 08:05:56 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a1fc443-aaa8-0a2a45050019-94a392175bf0-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 08:05:56 +0200
Received: from pps.filterd (m0384718.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65335aag3385409
 for <xen-devel@lists.xenproject.org>; Wed, 3 Jun 2026 06:05:54 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com
 (mail-northcentralusazon11012010.outbound.protection.outlook.com
 [40.107.200.10])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4ej4p93xmb-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 06:05:54 +0000 (GMT)
Received: from MN0PR04CA0016.namprd04.prod.outlook.com (2603:10b6:208:52d::8)
 by SA1PR16MB6433.namprd16.prod.outlook.com (2603:10b6:806:3e8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Wed, 3 Jun 2026
 06:05:52 +0000
Received: from BL6PEPF0001AB71.namprd02.prod.outlook.com
 (2603:10b6:208:52d:cafe::44) by MN0PR04CA0016.outlook.office365.com
 (2603:10b6:208:52d::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 06:05:51 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 BL6PEPF0001AB71.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Wed, 3 Jun 2026 06:05:51 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65329jLc3761574
 for <xen-devel@lists.xenproject.org>; Wed, 3 Jun 2026 02:05:50 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4egeypmnba-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 02:05:50 -0400 (EDT)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id UejbwgfZBntbrUejcw82YD; Wed, 03 Jun 2026 06:05:49 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=LzO
	+LJf9IV+vPH9pD6BDtTpbvMcZLEyrARubD5xRvFU=; b=n5lT7sseffMFCCqJnwq
	YiX5fYQ6AflTIS1A+s/DFZk05/IEFojFFnNd+/ZRPAw/cMJ3Lz2a87gPtB8/nLSU
	5hLftjCqa0NPwWGVdoha+F81A9O6HftdfaYEhUFiComGVoeaNcd/aaw8TpFnsofu
	fHeU82nvzzBxugOlp755asiJ3XyKbKy5c2gvMmJha+mhg7mB+/wKDZLq8k+7M2Oz
	xTPLElYbk8P379MiDztk7814H+Tj9VHg+GbCtfapkno12TvgAIIMqAHtWzCl2d8M
	U9LdeqfmRFIC7ezPN0iuB1+JUaxIOeaoSWQ6ImUg7nF+nMslwz6YlyQMph+fOmpY
	HLg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EVUctkuQNOxtfdDoQC7DFkHm8F21Ap3g3jP8TkNaBIIGR+nPcsTq56wG122DTeLh0Y8bPExCBfjcel+B1D8/6pBWKP3jJ37vUVfijyx8+POobSVAwxhlJuOahXLIWQ4O92pXtNstuEEKG/KSnjG9Ba+7qXbflSc3WdiFDxFOZYkWJa43X7328uWaBk/3g0/h13dZX+7yMiw5a4Nl4NP+jRC5DPZZPqscZOImUiRUodKcnPd7If39swT0vPG5Ql27/jRjHvdJnQ0F/eOduKELXSnZJ+Q/dTmZtFWrLQLGQFv7atevOiRJfx0E9A6X7Q8K7S1GnhRzpGMyBGzFMip0hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LzO+LJf9IV+vPH9pD6BDtTpbvMcZLEyrARubD5xRvFU=;
 b=KOlz5Z+vHrlIFJiePwyVmTY3Blw8lg89thfcX3HFMLTVtb20Xx1mAxHnIbfJ5mYn8GHFxIDbNhyweWwKr5xssKFUuvjt9Jv/ly/qcWJU9L/FArypPS0f5Dwcgd2SSBwZgaRAbvU/8bSXWbYXZM+5pqP7cLedtPkTxdGO/4SRRwZUZixBeiWSEGGGcE9IQuEZp+Fn474e8KWu2EeA0EEA4DjCDpX9zKSHlxstATqlZfblI5swj0lFCw91ZGyg334tDHk6K+H4LYdNRjeV9E4UB4BKwFDkNWmNC7WlQcuXdlbGH8/aXz8kjBklHzYYOw9j1vbRi1vrh6+h7NPc3Q5Q1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzO+LJf9IV+vPH9pD6BDtTpbvMcZLEyrARubD5xRvFU=;
 b=Xs/GYmOmp6qmlrW1L4ToXlIZxHE+nrSp/XccFtP4DTP8DnWbixefvKBbpdw20QXCmc3yCR5BYtyhXfB4yTLIMVYUtN/TxDSCqCeFeKCQnfF6/b9qP83y7iz4YFJVs2PrSwi5m6hKPaXcZvgJY2h1KXFr2Iv2uNFT/MsGaInANUA=
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
	ppserprodsaar; bh=LzO+LJf9IV+vPH9pD6BDtTpbvMcZLEyrARubD5xRvFU=; b=
	MZrpFyOsTb0y5sEnUbrsrgR3PnShVzFQ9UDVBZJsW425hh8lP07Ip/woHd+UwX5d
	ZL10oLN5BA6R5z3k5bfLpOfYK0bq5u2W+i3cS73ZZyWIfAYAMdVD3ppl1SItZ2e2
	oySxWHfRH7/aewJXf+0SY98qVfzXu3j0GI5EUM9RpjkTlMzZyh4UIpXd0a39j+Kc
	Ism9RC2+gjICNsYb87vQt/Huy/ML5TtQ1SzMbd58LkGZ7PiFH1cfpJO7h4QvWA1d
	pwSgE3mg5iL7ndlOzYespv+GCzxSZRvKA1zLxT2bx3aaPbIVft7bwDWXo/w0z5rU
	iLiiouwoPj1WYb7NaGTmPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=LzO+LJf
	9IV+vPH9pD6BDtTpbvMcZLEyrARubD5xRvFU=; b=YYdEBK3m27I7gBfU87G/2tl
	nip/XaML5bS1DDyMFU79mTy3TuO1y/pFun6FF9fcfb9P70vuLNvFlLum7QP8moow
	mjCExHeJfDitU/+HhV6LyFlu0Gm/5a8Uf/xSzl/aQ9UKF8aJ6oWyG+ggH6QiZ1tL
	7NM24wHYMtu5IN9DNP9i/WXzDFwKVsdaWampND00b61Kqo0aERp0k6fEKROZJe8u
	7UaSROgQTsxR9+EDLyhZkFIOpaxSujv6gac/0BHKDmqJMrO1avGSVjd9L8j2W49W
	M+V8lKgapCpEcZoHg3GrA9TM5V4a/KwFXfn/AxdwKfBYtWLsoMlSIaH9l0LpsfA=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: UejbwgfZBntbrUejcw82YD
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com,
        Mykola Kvach <mykola_kvach@epam.com>
Subject: [PATCH v4 2/6] argo: correct logline in ring_unmap()
Date: Tue,  2 Jun 2026 23:05:35 -0700
Message-ID: <20260603060539.1181809-3-dmukhin@ford.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB71:EE_|SA1PR16MB6433:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 84442923-b731-44e7-4632-08dec1362a57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	2lqvahrSEglvkpwl/f0lCknuNKI0GSPeKu+ugjM+7R0wCqWFXw6XrdqHt2uqPNYftkyWs3xlWslZhK8iSOzWKLZq/bK0JdcKScASyeYmWwCMeGGyyoBQ/SsryCxVhF19mHvRmG4EdHG23MILoAGGBV5g7SY9aONmVlCQez792i4EjTdBpzkpfCYHjM+mc6WlQsbnUHc1oZGm7zvgbr1vJsHORZJ7te6uYHUSUusmvHI8ircC+w6ELaOyr5FRMVu+sOj9yRkd/DF6FwEwI7xdNUWtMCzFCM3LG3NhrT+49/738rpIDnyjj7HAzpMbl/EOPkKSb8b+EOt93R+JO43z2vFWlwgeUnECfwGKu2zanbyFR8amhbX6wv9tp4DCKEg7lwgKN3g8pleMlYnI5uOGV2c82XhVsIPW2amsQUlGYwjN7H7YDqougYbnEAJBlH6v5wS0eA5AtW7Pr6v1HvSrJ9po2AXUou268OFWC4SMAgXqcLsTyY+aiGbVIWPEl8JQY1QiKKm/EnKWv+JZckITWvVShBaTuco0AHUiHE2IvwxTnFezZ73F+S81yJk30BZXNeaHYO1KM3cpRceO2VNUsVB3oLsJdl+XLN0donKRUbI+xO35WOud37Y8AG6oAXfxIBQZ0ED5jvcH7hBQ+MRD2ZRs6NfGRWYmk6AvyZ1amy/18Bee4LCj7RT3TwVPr2SqZnNH6qwCGsW1lN3W8DsLldX+Aekrjfo0yt5/VzdTmLc=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bGaPTjU7mRn0rvKCOQk/DRRw6W6BZzPqjudbOb5yupAwA3R1+XT3jwkiSzBT7FfhxsTT9UYZYrNqYuetGc3mPYQakSWJ9vNQ4h7J37LwKGuD+wFzEXimoOF2hsBUFsGQ5JCLdFCivhKRNbFMzaMeK0qxu36SpGxrQXpGU0wzOJ/rzEtVTXxFs97OhJJDQSV4HaoW97zcSkgBEdzwJwDBFiO7VqG1iaQBSaTWFcoSPyeY69xNU3b/DygQKATc8zcvfjq/rvxxmhsz3BbZcWAh2vM27bLFXXQmmDZApUlVJiguGdIWFBK0R1DRS4LnsMB1VOF2fbINhXlTCHFUgEhK9vCOmpiqEcm2BgqomEVpP/fYfC7WnMSKLvudGCENkQ3nXgp6zjoDtLauN11DyD/Zv38CZfPDxNx4Y0VGlq35bPj7DMW1erpgdXvD6DylDs+Y
X-Exchange-RoutingPolicyChecked:
	c9dTJEu0M0N/yQ5bQ5ddJ2b3s92MrnczZNxrTEydKmNlEoiJ3sAR7xzz8dSYjmTTm/A4SlKymdevsBHgX6G7VjaqMzHRWo/3G68cCXAP0huGA2VQJKfGM6Xy/EB0g3tn/stBOAKsfm4I4AmtpHjC4zx5H1nmV2bcUPKtkX8KFMF4mLuhr3X9WPGxMMrfzKZt2c0iYmvmfQJQd+8E3LbXcJ4bjvvTEtZNTpsORlHln31eE2x505NAkW7ZDLvz78wcsVVsHoVs+Q9/q5a/ggsUO+TeBv7TMw9xWznsYlBKp+x+ZPTGP+ZjdlQe3cEPdRkAdX+z5rAYo+sVY2K6PLQ4rA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6SdFxOgF3Y18odII38Gv8WsjZWO/CZBcSkgsGgjAiCjP2op53L7cFPm6CVvsXrcONVBT2d47p11OayHgS9/8KycGx/f2paC/pPiiSq+pMnNCrJFwc+6d8aIMo9CVat/Qszqy6yLLoRCdb8h5nAnPRGXNlCAxR9k/hhTC/gv6GTXn+hjS7D+JOfVeWEQOQhTG6lYQEshfDH6JrJqKiWSZTuwoCqRPbMthESPJwLFxBscDWcI32o0ZRz9fpXTSy9eYMIedwY+k3M7NUP5QC37EQsuOQIhLlBKgCTH1bpmfaHqFSP+kSYZ9nX8CukgMS+ZPGmNdgQGZNi4tM5fZBFTMmdANle0brSFDkwFV9Oc1m60KmZlzhyy9oGvDip4V2JVa140PQ+Og8wc6Pz6oEV8DnTzdOfy9DS0ZUUhjRjNdpwgx8c/FhH8QYuFPekGTNsT+aS1cqxEbZLiAd0WgFIby2/+GKb+NB/T5BmtUBG2+UXuIJ9gM5Nkj/MCDyWpfYcqODMEERHtWq61lkE354nWnzMg0OHJfq8xTHHwXLj1GjU8GWaPFKlX7ONK8wNNNK8raZ1nWJii7JtdSR3r16VPFMLJIva7wCI5rgwVXBhUNe8eUkLWbagk8AuyWj7HGe398
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 06:05:51.2508
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84442923-b731-44e7-4632-08dec1362a57
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB71.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR16MB6433
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA1NSBTYWx0ZWRfX0j1S4O6M+47c
 dY7Zcm6G/d8A9PUowdpvlW35TADk6naahy9jE5G2idNsaeQ3YrS1aSqXHNk0jz1VlAEKbHx+JKS
 gQtbery6ejLGUIkNU1GEeUQCcvRx5wyStdyft6xRvXvXWDaHXLdl6rRPyC9GSCaL7J8L046RxKe
 JBBMwAk7AqRDxm0AwBr6CkCHGaBpPDCzkyKuDQBZJ829FSBjlKVTyjCC1ur1LTz4ekhYxVl/UmT
 tGXGvP8qj94lsHhUr2bwoLWkLykVcEt9UAhNK1f9tOaWiyzQX/Cu2XuTBWHUiv2UOjR/yfPp1fi
 NF5ZmxA9pXEpetNrtUwX82x/m7S3jJYL+8uhl1QQHDZTbA9cPVccVN9a+orfEom7UFCRSrSUMcE
 zQHDnK/YgxZbhWyaK/lHOyo2imm1risiNif3CM6clJIqYw7DJ8MQBMfLSt+gDhzC4NLL6C4kgF4
 3Vg4WD1FRqzBlO4AwYw==
X-Proofpoint-GUID: itYoMTHJvoRzyYzr_Pho2xtAbGr5vSmc
X-Proofpoint-ORIG-GUID: itYoMTHJvoRzyYzr_Pho2xtAbGr5vSmc
X-Authority-Analysis: v=2.4 cv=MptiLWae c=1 sm=1 tr=0 ts=6a1fc442 cx=c_pps
 a=I0dIGTHPrmtoUi9UVMbYOA==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=ARvDHhclS48edyKYUbLB:22 a=cbNQJ9GKAAAA:8
 a=DBfv99YmAAAA:8 a=VwQbUJbxAAAA:8 a=Pq0mfAL3NuNqQaD0pm4A:9
 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030055
X-purgate-ID: tlsNG-c201ff/1780466756-DBB60443-1E6CD561/0/0
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,ford.com:mid,ford.com:dkim,ford.com:from_mime,ford.com:email,azureford.onmicrosoft.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AE8E063483E

Drop XENLOG_ERR from the logline since argo_dprintk() already injects
the proper log level indicator.

Also, drop "argo: " prefix, since it is also injected by argo_dprintk()

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Reviewed-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes since v3:
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


