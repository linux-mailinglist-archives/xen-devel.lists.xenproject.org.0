Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDbUHhWKEGriYwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 18:53:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBB55B7C94
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 18:53:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1317111.1586371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQT7P-00066o-A1; Fri, 22 May 2026 16:53:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1317111.1586371; Fri, 22 May 2026 16:53:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQT7P-00064j-6s; Fri, 22 May 2026 16:53:03 +0000
Received: by outflank-mailman (input) for mailman id 1317111;
 Fri, 22 May 2026 16:53:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wQT7N-0005wj-IB
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 16:53:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQT7M-002xdN-Uh
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 18:53:00 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a1089c0-5cb7-0a2a0a5109dd-0a2a4506ca6c-16
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 18:53:00 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a1089eb-7371-0a2a45060019-94a38ff1c144-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 18:53:00 +0200
Received: from pps.filterd (m0367129.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64MD6CW9432872
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 16:52:59 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com
 (mail-northcentralusazon11012040.outbound.protection.outlook.com
 [40.107.200.40])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4eaqr0j7by-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 16:52:59 +0000 (GMT)
Received: from IA1P220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:461::6)
 by SA1PR16MB5519.namprd16.prod.outlook.com (2603:10b6:806:38c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 16:52:52 +0000
Received: from MN1PEPF0000ECDA.namprd02.prod.outlook.com
 (2603:10b6:208:461:cafe::1f) by IA1P220CA0009.outlook.office365.com
 (2603:10b6:208:461::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Fri, 22
 May 2026 16:52:51 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 MN1PEPF0000ECDA.mail.protection.outlook.com (10.167.242.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Fri, 22 May 2026 16:52:50 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64MGb7lv3201690
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 12:52:50 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4eactprxv2-5
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 12:52:49 -0400 (EDT)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id QT79w7GmWmrl3QT7Aw7H3c; Fri, 22 May 2026 16:52:49 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=kr/
	m9p/JyQJZZujI+NHxVzrOAYyBvIY4VvVrEyr7zag=; b=oKR5WqioMZJ28XW/Xf/
	krLGE2ccN38IGMJ8yIxxPy92lVQyUXsfaRT9aa/3ugEbQUQFo5VkQscpmAYiaa/l
	eTQzE0/osaEyuudzrX/sZxuldBv1jEb2KmYvPsGJwIfPgAPBgZ8af3+4d+nCqnrR
	EjSpwt4CglVN1W9sJxGayW7iQyAj2mDyNyoopZE6vZtRwJVIVzwIyZPAf6v+KSBe
	LbuxXGA9SYpDIDW7kpDN2JrDxsm1nUu71dIbpbl7zPd1VzEqKl4rNhmUcTSox938
	6hJeShuBSh8HaKpJD19dercRQ/ChMyXwV6qfjICiDnU0512kzXMyKzAmMcTrAjO7
	6rA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fgrUtbjvDKe9X502/aZzCJZaFNsflL7h8NbzcXXOGHxi8Yu7DVVs2fLF4A1rTNi+x+Qh1FriF6Oi5PJyVpHCvLtUWicKJ6N07BBrz2MYIBFEA9yxY47BtMCBtUsFWQs4vxA4IdWd0jMynCak9ODW7RNWea8Cob4waAh47aXETqgR1Zt0Kwzcgg3tAWpF9XaxCWY0NOKEwMt8W+/QCVr+mfqQ1Zu1DACtuoVAoi05C6Ty+eBCNIgMOxJHzIZCkHgSCZqvaQAaeG352foMj8II8nqJLUiO6E1G+yTGCKyqPEkagy0fq+u4JCvnSQxN2F9hj/DU/QV2WyuPFZFTtRnPnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kr/m9p/JyQJZZujI+NHxVzrOAYyBvIY4VvVrEyr7zag=;
 b=Bt96qifQf71iZ5FHP5n46xk7cCp8MHUpHut41m4lpJqBxliVSPueU5kDllJlD7PLTAbt0FiVqjcBrQhGLGOtJeOpbP8rGA/+BuaGVkjO0llFhe4qrT4Ebqw1398Ul0wGT4bpEsNM8NFDhPJrbYBYvgWxyArJJdobdztecPBjozs/BUStJs0xvHpaRrV/xfnbDcEa4s4UO+TLQQ9STkBmlBlhsT4Xd9ysnZS5X5yyuwuoGxrokmZX0GYIM9UWI2tkmu/B5ul/jomTIKBlUlsLrpMubNAxuqLIllowfCQr6Vmauc1NjcPWPbOCSkfDATZ/4rsb8oZ+nymSXmh6mBiTiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kr/m9p/JyQJZZujI+NHxVzrOAYyBvIY4VvVrEyr7zag=;
 b=IsvgvEWuck5Q5j1ael9jQwkg3ofkznfn7PsmqOsLXsprwW+NQ/EXbFAcN9Y18u4AX+/sqEyRONJ/yqq8+uJlmeHFTj0G29HTSoO5YKkQUyWNMbsBv0+y/l4Cl9BYjKvF/1bXeVn/L49VuErGRjw19cLV0DtdP4ptJ/vmIoePrlc=
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
	ppserprodsaar; bh=kr/m9p/JyQJZZujI+NHxVzrOAYyBvIY4VvVrEyr7zag=; b=
	Yr3ZnmVmK+9XzTdSz2C2Nb+IKTWIj9FiD7ylXo5LR9WcGesUV3T/HjgZPgamDADf
	aUrNA0iEtKXbJR9mc2B4Wib/vpibYoj7DM1mo9q19pAwKjhCSzP8isKWzQQaDA7p
	5C1KOuOO8i4Qh+g55Kr8YC+VdXoqafowqKk4mAFlM83Rs0y21fpgFQgXTH6IwT4u
	PtDU2jBG2r/u3nEgkR7og76UmFQ162vhurfCsVUybcuEdVfpc3Er8JfCDn+1BMJ7
	f4yDZ6pOoQlUShBv7zGujLYnl19EWU53Qhtn4sTiNK4CoWpbaZFCSD/cesEVdeFe
	O+254guMMlfdm5ktBovPGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=kr/m9p/
	JyQJZZujI+NHxVzrOAYyBvIY4VvVrEyr7zag=; b=nWXJWqL+IrtwgCjzmx9Lzos
	shta863hpDaWDMZj5kFWg0na3YnFN7LGzoaSib2INARfBFxvrT/9WIhsWQwXeOrH
	go6FIZWvfbr5SSfzJR7QO6g8EnA5qVGVC+z02YtZVNH26NovzxpGxHklDxGaAmZ9
	K/RJ7pK67P/zB3ilfx0y3nF2YVcxZ/Qql7/qpCIwkVrjyR5T4xru9qFDmf9b4XAS
	xuqo6bGv1Sb8xQTfsBQPoxM9Mu3DwS59PuzZjeAENlCpVhE4Qfjqm6P+WbsSdyUB
	GstZAbhReEhKGq9CRZnZBGj39UTBm6WFWyobcv7DGia09YBt7yjO1daXjM0adTA=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: QT79w7GmWmrl3QT7Aw7H3c
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, christopher.w.clark@gmail.com,
        dpsmith@apertussolutions.com, dmukhin@ford.com
Subject: [PATCH v2 1/3] argo: lower level of noisy connection-refused log
Date: Fri, 22 May 2026 09:52:36 -0700
Message-ID: <20260522165238.844649-2-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522165238.844649-1-dmukhin@ford.com>
References: <20260522165238.844649-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220168
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDA:EE_|SA1PR16MB5519:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 21c515b0-1c67-499f-3441-08deb8228fa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|11063799006|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qdfQBcYz6V8ibns7YL692qOZCO5QtM/O8U521h4RJsUF1OWeLZqcjWJbIJrHQfpr3SXekT29lwjerLQEwPl2KpwQM1jHL5HGWv6WniDq4oq8m9NcTmGWYd/dr9zFGdBrF+R/HppuCbvu/XoKpsudBkGywkk8zFt+aAxz2qbGTGg6Sy91ktuiUW6vRL1AFWxjlfMAIfTcTVqB3AD7PBD2krcXRKfMkLTlx2uIuAqp+zwYoCXc1gh+Bt696+7d/VMfgTCTGpX8mTjh7lA2UNmQ00oy/vgMAH+QmPBtTLNn0XhcjtyF4UGB2Xo+ricRa7Jy4aSkE4/h1pDuFFJ+GLvv8dv1XTYWyUSc+1yRyp/IsgeQLe/iXljwTgQ5lGNZwyNBYqLMvMXiZGFGoCXpeynG9IfjOb39AN1tXm0tOAMWoIKAOkG432NKgqhI/xi6cCB8CNfyFNwgnxscDCUAle/mfi0V88UgI0ukrndDKV4mVbP09q2y01L1f7gC2t2/ha/7CO7t+ICPVA0+fJixTkwtF47a7rWf3JMbnJV4faYsRoa3HzCyaxH7hDZGzP2j+jgjMQonmqr3z38Fm4b04GBWnYuFNtPk6pgv/za3YZHN2Dm49qlKzDcQfUR3LpJXv64KorKc1ObhSVgTNiak7tgghddWKAY4Nr1D4NG5ZYIacnwr176vfO/kxP99mJKpNVAMwMakRShpd+BlccHJj7bwbvsLt/N5uNldVwPAtTWHZyM=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(11063799006)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bgUveZjE6UVRWNNrZoAY39gIYAN8WUZdedqgT2aVstZp6ZucgFiwbiFQx0apEREchxh+57iPtQiLhu6f3Wr6RoV7j3orzZTLmhZx/vyvIzXfCtDnHe+RBdgHbTFOo0GMQ7yKEtA07f/ANTp/zMk8tgER7NRjXWC5UohnTzCNPzSj0Y5Uw0AS/9mYJcuW5I2bym3m6CCNzaRYTLfwtEAtyCsSZQuQ+Ko2Hvys6ZHBwu5xlHftkr4sFPhd1eqUSOw8pHNUhjMGTrOkcRo0cwox3MxDYa0/zYaKMu1QroQNy5+yArGp8DN6EwaXODwhJrZW7NnN6k+qOM4ra7QoC94LHrbYlt2Y7hARUMqXCd3fuVny08VIq/o0hOpWKSCf5NdPkeijMKrRDnCfRPl00BQ92dMCYs9DMb5Ja4FmNT20wZ8NVUUgxc9ilp/YyXzFCJZ+
X-Exchange-RoutingPolicyChecked:
	kUimEsxRWhP/DPXl/m2RS/r0fHJbeeS6FwMbTpL5C5hcGmebQ2Qa/PtvVDD2KrvvLobBxZt4UDLR/NOGGhNRSwO+62nhcWTeeYc6gUxhtFUoiu8POQNNQ52mKvRRY4jnF2a0zfJxPTaIX7m+Y0uW3iYYwCdQ6UkvghQ3YeIEVi14YsnBgMO6AJYdO7gKkzQ0DUb60tPsP/vShWKkcKByR6OpEcmydxiFWnKqo0wSphrBaDjBNkk00h5WxCE7Ebh4S2nF8NN3SSByih/N6SylUAy7qcfcjvyd7VdKkZH6EtTjoyrW8uvjZq4BhQGh39YTOgoPM6ZkakONltn6HTpAWw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	f9l4dDVLFv5F7nvWLOcSrRaZYJ1FT3LRPf0NaN/2Xx7IjXwL53YUqIZzpvY4wGzLKHhzry5xz5zYjBg+EZDD7P/Z7I/LDo15YHQxjlnVIVu5/7gkdBABpb+GdXnx/6e69kzGiyahPC7odEYZcxzt3hPCQmIUjPtZRxuGlgFXGQRgtzZRjTSOpRqg/SL7nZmQgNFLP3vdKQvfWmM65zOfd5YVEkA+Q+BDvyAUxt9ypv9DNw23Osd6Hxn6LXT3t34gM69au4tT8OIXQHOTpULl1DKmaifkYZBU8drJjTF7+YRqppMxuLoGX9g5OG1d9TRpF5kFuwvZu/VlfR0Kep37So1e7LEDGRK8WnNO3CnS1NGAt5DrY002glpH4yoF4oxw+Fs4PoAnhe3VMFKkVgiO9iKjWyq17HU3opp7rDZnqfqplndoIpwW5MOrNBniKiafP2tvBvObaX7DMHmq6Rrk7FdYwssTSINbj3X02Bv1/BU34RGzHxnvY+yXuVDGRGwU00UsZJ6UdVjn4s0gHYjzHifIJ9peAuADWqJaqhbeWrDbJVCUrMuGF7ZSUZg8XHqQLHuBvYOQFxc/L3UXcddXk2tDRWGq12TAPnT9VCnEDXnNYZit2wuPaJuQUzuZ4oTlkG1tjZvkCGPGhSizHHDt0g==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 16:52:50.8731
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21c515b0-1c67-499f-3441-08deb8228fa7
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECDA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR16MB5519
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE2NyBTYWx0ZWRfX4qs5FZ7eN0tb
 Lc22jLRvDPO6Yt/ZdKvegyCcURGckDukym6SoZBUGyX9To1eeVT9co0V3+XJaRCYWD7eVKIrmUy
 WaanVEPqg57P7UmZxkY14ObQn8TJvOCVzQD8eqhoU0qZAEOX/bQyBNifg4wFdR8KCLq2mh2RX1Q
 4vOvS16X24mzXOsBHTsqhkvTcgPXLg/rc9tCnKfAu3m5s7xI8kI3uoQG7OOQYOs+Pnr1pHgD/NG
 ylv/utgkxG/TULUNL0UJPli7E9bCjmJz07tOX2MRC+e5h9YBVQbBZi4NR2p4WjjY+F4Q7+FeMKT
 mLgNbZZElhDetAcKO4akveaGIZ6mFzHyWDxpYdbj0CbJdj/3O0LHkN/YKMVwTwq8rKagQ0mDdoZ
 JiF4VulEXN4MYL3psUncwXAg1lCOpkPNHrEIa61+D0fpHdRDqite/J7zylsN92zPRSWKSOExsio
 thj+2u7egAa4VdNWUgA==
X-Proofpoint-GUID: X4aRJyA7cAhTcoi_SzjX0kO6dIE4ht1u
X-Authority-Analysis: v=2.4 cv=OM8XGyaB c=1 sm=1 tr=0 ts=6a1089eb cx=c_pps
 a=f2s2IY/meXrRFjAxVkB89g==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=NGcC8JguVDcA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=X3KReqg2EL6A36SYCKpz:22 a=cbNQJ9GKAAAA:8
 a=54Me3sMKcSjXOMnv11IA:9 a=3whSkbs7g9Me0DR5EJEX:22
X-Proofpoint-ORIG-GUID: X4aRJyA7cAhTcoi_SzjX0kO6dIE4ht1u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220167
X-purgate-ID: tlsNG-16d1c6/1779468780-8CC78D75-7C4EA1C0/0/0
X-purgate-type: clean
X-purgate-size: 1279
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
	NEURAL_HAM(-0.00)[-0.981];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[azureford.onmicrosoft.com:dkim,saarlouis.ford.com:dkim]
X-Rspamd-Queue-Id: 6EBB55B7C94
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Denis Mukhin <dmukhin@ford.com> 

Lower the log level of the "connection refused" log line, as it can
spam the logs when a dom0 service using the Argo hypercall tries to
communicate with a domain that is still starting up.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v1:
- dropped duplicate "argo: " prefix
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


