Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHP9CXZ6D2rLMgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 23:34:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E03945AC218
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 23:34:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315977.1585601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQB1X-0006cO-Kk; Thu, 21 May 2026 21:33:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315977.1585601; Thu, 21 May 2026 21:33:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQB1X-0006ZU-HA; Thu, 21 May 2026 21:33:47 +0000
Received: by outflank-mailman (input) for mailman id 1315977;
 Thu, 21 May 2026 21:33:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wQB1V-0006ZO-Es
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 21:33:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQB1T-00F3IC-Cf
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 23:33:44 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a0f7a09-2eae-0a2a0a5409dd-0a2a45068bce-30
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 23:33:42 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a0f7a34-7371-0a2a45060019-94a3921776bc-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 23:33:42 +0200
Received: from pps.filterd (m0482517.ppops.net [127.0.0.1])
 by m0482517.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 64LKjdal922754
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 14:33:40 -0700
Received: from ch4pr04cu002.outbound.protection.outlook.com
 (mail-northcentralusazon11013062.outbound.protection.outlook.com
 [40.107.201.62])
 by m0482517.ppops.net (PPS) with ESMTPS id 4ea9cagcv2-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 14:33:40 -0700 (PDT)
Received: from MW4PR03CA0237.namprd03.prod.outlook.com (2603:10b6:303:b9::32)
 by LV3PR16MB6647.namprd16.prod.outlook.com (2603:10b6:408:27a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 21:33:36 +0000
Received: from MWH0EPF000C618A.namprd02.prod.outlook.com
 (2603:10b6:303:b9:cafe::d1) by MW4PR03CA0237.outlook.office365.com
 (2603:10b6:303:b9::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Thu, 21
 May 2026 21:33:36 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 MWH0EPF000C618A.mail.protection.outlook.com (10.167.249.122) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Thu, 21 May 2026 21:33:35 +0000
Received: from pps.filterd (m0426315.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64LKxCbi2047036
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 17:33:34 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4e7afrwvfh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 17:33:34 -0400 (EDT)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id QB1GwYsmqxj2GQB1HwxSR3; Thu, 21 May 2026 21:33:33 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppford; bh=syniypRRsUpjlhhY1OgRFFdGbkG
	N0+6TBd6U04YUH58=; b=FpP+s/F9i58AzLbC0yNrJvEAh7OO5Xx9uZ3vred18YC
	oPfl3fzQBysxKcqXMaXHH1Mjpe2krEmpmRi1xEL+kXYSlvq5X2T2WzUs3saKgB4y
	LcleAL2/Wlkq9eqda8RD7AUMpQxuxuMYmxdRW9umlzLqyA6OokMJUHyLKyACwNzp
	bg3Ucx4owlf72kZVH4cEpo6DYKJvl/jgo4cEflziVhy4mvn974dcCLqbmz4ADTRB
	yeacVnV1PZF4WW/9YWwxFD8rhxVUGaLfxY6v23ZDDFq5lgSWz8h7wOXe89ZQpNPd
	AKf7dRgOHm2RBOrlSlrtuykWJyBrkYjt1PgxFF4NeKA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OVYtuYr5iuH49XtMI4bTMIn9N3IXehvE+LHjEsUvox1CPW3+dyIlVJqQCBf1vU8mfZN4yL3S2bfOsqRewvTKR3vsh11zxWt7zjn/iGiUQDz8A10yjl1q2I8y4vR91pbkBah4hCXt8SWfny7fhw0iYe1p4VDB6zHTtF2kZWffMy5kRUN6lz/5j1S14wekItotpC+lrW/IKnCxxiRzssp1cpVLAYz+yY/FYsgX8nRe9pBQjeBcIGt1MXXVJSQjZsnMc8DpbtG5+eUROElksl0d6ZGPuiDsUvQUSI+iqnPilAcuqso3KPe2lUnm+GPRlJdileV88PzG7lr1s7J6mPL40A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=syniypRRsUpjlhhY1OgRFFdGbkGN0+6TBd6U04YUH58=;
 b=ESiT56EXagy+YXBkESCdrrBd7UpHk7ohClNaHpAMUuzTF5DpzrZQ4N6/7mhTNah25wKCSp4Zodn0ZI8XCkV0S9fUHkMQhTgBy0UFN45CIG+AAHxWCmzP0lh877+A0l/BMELWM2AshNP80LrbKMYwglP6p2TqbYpdGGEausAXRp2Y1/Kqs1e+sKGEBm1efjRcEO1XJUafqdBKzlPbRt6NVqMokJOQDfec1sO83xzGGFtcmUJIn4t2yb9goID8R0a6a01RTKaeNRlt+pkaKFz4BlaCHt2hLO4y0onySRklH2m2wmP4ETe4UbAwNnrSanMY9pOaWmjweEYPR1VCIkXhVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=syniypRRsUpjlhhY1OgRFFdGbkGN0+6TBd6U04YUH58=;
 b=Mcm5Avs0Miz+iMcqIp9eWcIKSJjOvoZIRbrw2iKwSNtX2P9me7PHxNW0Xd1XsM1J6U64ypl7d0CU64R5NaxoF6xvUe+CN/54TSB9tpgVMXK44C9RD0hRVQakvuv2gInFoDcBP6zyM8i67HBCPFMIV3iwttq5jgs70V3mG8NfGJs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppserprodsaar;
	 bh=syniypRRsUpjlhhY1OgRFFdGbkGN0+6TBd6U04YUH58=; b=kXnt6Bczvo5z
	8F7AEXaGgT5eOFpkezeuId/GW8VOsUYKzXIz5UCgybwZgqpH/3nOuQnd4hyNBjkR
	TYrDzi46n/v9Gb2b6IVEAgaxXMZQDWKLiOu9tLj32h6NTYlR3DmvulWR9ARcXOVv
	L6PO6VHc6j9jdbGlOFsCYRwCom9cOECwjspG3XRoHPybS6I/1o2So8CCxsfWrE0x
	T0FnxXRkF/eyPDUT2PcvokYlgda4polrovSdHpRrw6l8RaX77lYcuSM3GcBPwTeu
	0ojBGj84P3GmsdOwRM/WsE6B/VGNdcGVSYkC2KPjlpXNuYGPvcVa+J5x4280w2FR
	jDOOEUkSsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=syniypRRsUpjlhhY1OgR
	FFdGbkGN0+6TBd6U04YUH58=; b=S2ZCA15hGYnW0AvoDEwNMIQCWCeBUPppIdtX
	iAMstQqgb+5/aBZC8AQiS7esZB0UJ0L6k8iz/NTxxEIAbrzzqiXy2ACdoMPQ8z5f
	q8vfdyJyQDc+f5LTCpHMwgkRKBC5u20oUn2EvxOIZA88FOpp+QNP3cGnEO3o8Fpy
	1CZcUfXSNrvtyQYh8768JR25SU1DMyATWZhkQkq/DvOGgD3lI+sRglGgGebohDL7
	pWAcWxj4m+HAacSmC8GaNCbH9E0oIljA153kisXxZdeq5ypQEVwgAppTpzSodNPJ
	p6/xgQ8cpNQddXjRQAo5xO37MrwsORkZTscDjp5qK2k6QSbpdQ==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: QB1GwYsmqxj2GQB1HwxSR3
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Thu, 21 May 2026 14:33:30 -0700
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: xen-devel@lists.xenproject.org,
        Carlo Nonato <carlo.nonato@minervasys.tech>,
        Marco Solieri <marco.solieri@minervasys.tech>,
        Luca Miccio <luca.miccio@amd.com>,
        Mykola Kvach <mykola_kvach@epam.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Anthony PERARD <anthony.perard@vates.tech>,
        Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
        Julien Grall <julien@xen.org>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 2/2] xen/common: llc-coloring: reject empty color
 tokens
Message-ID: <ag96KkrGE7noKv/9@kraken>
References: <cover.1779388510.git.mykola_kvach@epam.com>
 <94d7290edbda36c652579b625acaa4d7cdf1aa68.1779388510.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94d7290edbda36c652579b625acaa4d7cdf1aa68.1779388510.git.mykola_kvach@epam.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210216
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618A:EE_|LV3PR16MB6647:EE_
X-MS-Office365-Filtering-Correlation-Id: e4499bdd-2d03-4033-6bf8-08deb7809d89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|18002099003|22082099003|56012099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	g2ApTCnaLOd5ijo2OSGKnOwKzjAI1ak8/MzYHYkguGfq4v2us8UVCdnPSwdhXMUQ0/AqSnVSLIYC+Zj+aR0+LjSFLRU1RVmblqnX1KtUJqlpBJ8lQrcsYzvOC1j6gMGDq6CsHo/dRAIz+ybFLNQExb2YEAmatBvJOJc90U4aaFHQKOJi1pw6y5yuJn1fhqy9ajM3r4jZ6WB1NdHsS1h1IkndqYyGGoiZfU++FRFY8WY/QQDkiiIcfj4X5alp1DxWuvPIuNH6j3kSVO4gtuJ85aLGlvqtNV/kXcVPCaeeCz0f5fUDdx28p2LjteAU6D0joSwikkfoGLfOlsM355jgu9AubrfsKvyVkovXoPx7jIagAt6cyhGKvIXCkB52Z5Hn6TfSS47RLdfOBHrM6DNgIjTwKs4DL7Py/4hafTlRFMD/mHTGNCDbi/UORDS5Swc08pG0aeyVsJKaZFODQWCI9DYJC7ln9Fh3nj4ht0EIEg7tVdVOwdOacTEHN1QxoQ36xoUinDbiyswA854ftO4NcFyi6EBCeN4J/Ikuf6bJlJ2M7i6tHY5RBctawIBcqR8sf+7dbwv+KYVkSGOjW1g65a8Dm5PXDvN1c7dXKLDYTi55QdqMwvaba7MQVPiOgjsCcQRNYkzUpNOXd9FY1bdHIxBHxYGpLFoAtnIgYEVxei1zmSb0RSAGnQ55R2Zwjg0u/M+DRuxhwYVNBW8n0CJgt4XuV1zs81iipvwGxwPazYA=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(18002099003)(22082099003)(56012099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	t4g5UQatuwoxMmzIbsd+6gzwQx0HxKjfWAibKrJWP8BLWfv0Yv2YfLMKDcH80Shv84zsvP3nm3v2GCJSIhEy3arPZu7fHFtKzCx+rA0+GybliA7MkB3mHeHRx/pT09yDVlkt+mi1b/12p5vppKtgdqMM3I71my9iBJn8mxdyTVxXV9dJRWyUIm0Zfwy3B3ljWkD9U4GCueSZY0XiB5CmdElrVqf4pzgFwctdpTsZaUM3OrVlAt9uErBRPj6zwWLSi7IKx57t9KUUWiuf4KlHv5Phgsc1AbZJgImlmXD3T9+aiAcWR313/v7bDH+NzSgaJneU7JuLkfQyNYaTMYzz8CsWcs/Tjq8so+2iZvuY3BPhlxyfh35HCzwy2p4MLyOOZyNeqhBFCH+I/icCIrpexh5qWGijDculd7JMmRMmxF+kW52IjvRGKse4/2fM2iYc
X-Exchange-RoutingPolicyChecked:
	oh3XPXp/ox65ZlZXlEng4VnUJHRqShCkCL51urkGM2xYp+lp/RdnjbOQ9OSjBq8xPz2jznmXmaiP6H/aVMX0VyRZLvo2DCegzxPQs4IRHnOBxsjnP8zg3IqVzkdmtWSdrGaLcXfSgwSUihH0+6I85P59chgBPlPy2nwCrXrLzA0PEbplOppTFbjeAa/AhtNxpFOWmEoY0/pMsN8fiGunjvWukpAj9McQym6uyjGqBPgEZoU1kCi+rupBNZ7ZO+da4mWmcsQFZSJRTMcXzTIcXcCJhElOBPGOoFGB+WGsDBlL5eRfIpbg+U0t7i1OMyHqlWwDgGQGOF6CIsUx7yDaQA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	N0+8bd7e1U5GuViSF9ZQ93np/E6Gcmso39CK96yfj9tRIF8z81ApJmuPja3XSIEVYzB2xhp7VaUTXep90OZD+TezJC5n4i9IieFkiksDQJe1eSM13a8TThX4PMk1b/bpCR5CzlzmHGCgjgRc7xLsxeZxX+dUyakOWqmA8qMakQbqVo39ZPskcq4xcXa1q6b1h9ElXJCXAlOnb2xuE1KKSonkTXW6C6i/XtQ1U6MtIjExkIIwYZEVcijrI3HGp2i3bgPAjp0+dyz2nJRq+lN1QM3kxjDsza3lEpDfBMLf0Bf3q/ZMvl+BC0NaHsVt/DaBbuSwIeof2a6cJaBkYuciuM7wGZtZ3LU40zjI6x000dtl7nHl7WcXIMb8hp3qq/AtNkhW6On9uEHZG2o4qkcqI8BacEv8VsDY1ucZac21CmMCcKFnprZeWKT5fxLGYiO/Fy6roi9aeg0/yWr7eEkApC5vR6Ykq6XXGQefxfUihkf35vUtQ9jEvU97OVMtOCU+fBViOUIbvP3KcGVM2ILFxqUSPA2p0g/unHjwcAXezZz9yDKBk0dQzc8IQ9PJqd7SnW6QcUuQMYYigVaevIDyKVCfZ3iJxofaKpAZepa5cd0tsofOsZitgTs+PGKEqcWTlQk11nIYPSYFEXn7Gu47jw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 21:33:35.6861
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4499bdd-2d03-4033-6bf8-08deb7809d89
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C618A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR16MB6647
X-Proofpoint-GUID: CXDT23BaQHpQSOZAY4zjbE9xGeiIJah1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDIxNyBTYWx0ZWRfX7gJmhGCyMVjZ
 XVYDFNglRYUU7EajH6KySconDJcOSwb1htdfWf+b6JeGbSB0A0NJLeT6wPS8MiLh/NGZoJygofv
 +6xdeExUIsSr/PgMGEzCVJ+UI61Vd170/64nCiXvExTImmUJbLrq891I/u/cXl4vL6c1ZRyqySH
 aeMJjqU9odxtt1UwYr1xnvpxaNkb2n5hvx0b78yaHC+1UkjRPhZ/MbQKLZfKzunxnBgFydewp4n
 5pnFqRSoUs5DjdWL8WZx2QJK+E7ASr/VdxbHXoFxEeyJRxrwm5bFSYAu98ytr7pQAU09ubMeM2O
 uj5owSz6nieOZXbjQBeu3y1/1hxyKu68zhv1zLAZkBPnFtbwFQiMVLUNPbcbtjbTAy3uxsf8GfQ
 Gt9h7w0cEYGoHKjVTLrUalSA2pGD8wAzdhQKKYvxkzsm3fIpReGBmPdJglQXaERlwKQG0vRAcT4
 6THqfQqgdMxrxC/1ETw==
X-Proofpoint-ORIG-GUID: CXDT23BaQHpQSOZAY4zjbE9xGeiIJah1
X-Authority-Analysis: v=2.4 cv=B7aJFutM c=1 sm=1 tr=0 ts=6a0f7a34 cx=c_pps
 a=2HCcruDS7e3rZRcUQV6B1Q==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=MLwXIh1eZMowsRZfVxRb:22
 a=DBfv99YmAAAA:8 a=zd2uoN0lAAAA:8 a=cbNQJ9GKAAAA:8 a=dEE_NiS0NobiUu1PXT0A:9
 a=CjuIK1q_8ugA:10 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210217
X-purgate-ID: tlsNG-16d1c6/1779399222-7F57ED75-B78ECEF7/0/0
X-purgate-type: clean
X-purgate-size: 801
X-Spamd-Result: default: False [1.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:carlo.nonato@minervasys.tech,m:marco.solieri@minervasys.tech,m:luca.miccio@amd.com,m:mykola_kvach@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,epam.com:email,azureford.onmicrosoft.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo]
X-Rspamd-Queue-Id: E03945AC218
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 09:41:22PM +0300, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> parse_color_config() currently accepts delimiters where a color value
> is expected because simple_strtoul() returns zero without advancing the
> input pointer. This makes strings such as ",2-6", "-10,19-20" or
> "1,,2" look as if an empty value was color 0.
> 
> Also fix the DT color parsing error message by adding the missing
> newline and including the domain ID, matching the style of the color
> validation error below.
> 
> Fixes: 6cdea3444eaf ("xen/arm: add Dom0 cache coloring support")
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Looks good, thanks!

Reviewed-by: Denis Mukhin <dmukhin@ford.com> 

