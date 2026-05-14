Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAM1DWVcBmqcjAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 01:36:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EB3547CA9
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 01:36:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309294.1580324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNfaj-0007aU-NJ; Thu, 14 May 2026 23:35:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309294.1580324; Thu, 14 May 2026 23:35:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNfaj-0007Xt-KM; Thu, 14 May 2026 23:35:45 +0000
Received: by outflank-mailman (input) for mailman id 1309294;
 Thu, 14 May 2026 23:35:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wNfah-0007Xn-I6
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 23:35:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNfag-00EHkz-U3
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 01:35:42 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a065c10-e002-0a2a0a5209dd-0a2a450aa34a-26
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 01:35:42 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a065c4c-56b3-0a2a450a0019-94a39217a27e-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 01:35:41 +0200
Received: from pps.filterd (m0384718.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64EJ0S8A3073959
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 23:35:40 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com
 (mail-northcentralusazon11012054.outbound.protection.outlook.com
 [40.107.200.54])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4e5m62htag-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 23:35:39 +0000 (GMT)
Received: from BY3PR03CA0006.namprd03.prod.outlook.com (2603:10b6:a03:39a::11)
 by SA1PR16MB4706.namprd16.prod.outlook.com (2603:10b6:806:229::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Thu, 14 May
 2026 23:35:33 +0000
Received: from SJ1PEPF000026C3.namprd04.prod.outlook.com
 (2603:10b6:a03:39a:cafe::75) by BY3PR03CA0006.outlook.office365.com
 (2603:10b6:a03:39a::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.13 via Frontend Transport; Thu,
 14 May 2026 23:35:32 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 SJ1PEPF000026C3.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Thu, 14 May 2026 23:35:32 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64ELSIed664397
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 19:35:32 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4e5m0yg9gd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 19:35:31 -0400 (EDT)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id NfaSwcvdLxj2GNfaTwuIJX; Thu, 14 May 2026 23:35:31 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=LIj
	+1mCibHRzkDOLI6NPciksdPra6i7uppubfVT4rMk=; b=UkIc2Jfhax7x40zQvY8
	0ECya/0ndTanzZzjv4cAotmEPcYJPiR2bVTIRqe2xQhyrj4pKh+AAxWy0KfAU5E3
	XPvXnTr3mMZ1b7HYtACua/K5dTz1Ba8g00kvy7VV5dGj91KIr6WbiLGTHwrcwRE1
	FMZlRf7GDVEXwASeqIVk0pMM0+8T7IMktO1XJpIfKNWyMbDVR0Zi79Qd15roVmGB
	SAVvtDP0ng3KMEgMdnwvuEzBwN8dbv8oSRx0dC6bfkHfkJxo3xvsHGgzUMIvN4NQ
	O7XPXLGGsgtBZ5VY5Qqbx3I6/Vvb6vAe9Wzitsh9O6ti3+nU+sPXL80YFa9SwZKG
	vQg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fZBNM4+55XkBoubIy8H2j21BKgfKNVB7BdXIHfCI/4v456i8zkGyZvqQlHuiM4GvP9JdbAhyScRIhKVh9P+nQZGdnsF/9lGJy+DW24vQA2A+MtQSWK8SZenE/9ps+J/t4po9sm9qdeNOddWVdvpYNkyllCdwlZf8yfXUVh0dbqSrXIYTViyheJBxrjB4BP6EYlhD34l7qruYdqUmdfXY4coQDtLxfZiK3sIY+zyY8Erk4W9kpUz1od+uTAKZOCT1aDozBnGVoL6+/zo/e8Kesz05+t7QHv9yw1/SKlWGUuaO6kaBH4NpGPr0iiZB/uLDnyXRSMdizvW4fC29dFnH/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LIj+1mCibHRzkDOLI6NPciksdPra6i7uppubfVT4rMk=;
 b=n8OwvelyiZRSYOKwTeIKS6nyN6cwLGpg2meKF73izQKt8q4M+LAcgDZjG9RxXLXhIrMW+vZdwpoYfdvQaND9zdrR2qi8ztvLGUAUNNQMWWFnZJ94HttI2tzY16rC2umLzsHzD7A1XQK5wg7ADDkXvEgzAcwmw5O6ownruE9I4TplarZuAobfypAXAG61/vrjiGOK0ggBFjc+btVGQDS5CBslZoFG9DaLXZWPOe4yV8Y/LLHr380VdccDn6gl88IF3mWgpuSzXIEG18y7S6TfQp7VKOSqfLbuVvOZ7uPFYwJdQUGoLAqeVFYXyP3JSyyzSVlRmOi2L1VXTprS8jO0pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LIj+1mCibHRzkDOLI6NPciksdPra6i7uppubfVT4rMk=;
 b=VCLkqqZbkvc5dyfzY889uoPzShC5TJ1fxHre7sG4kWT3hRSzRviqQqWq1xGJpfm4vSAswQNlhrIzEAPGhAJ6gUHm7TpkfMb84eSxf01ciGh/kFkWns+l2aWxLHMcIAgaa0DxV7QWik8Ee4RU6ie41flrdGKoPBsEwfIICID0O8E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 205.220.161.53)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to; s=ppserprodsaar; bh=LIj+1mCibHRzkDOLI6NPciksdPra6i7
	uppubfVT4rMk=; b=h8RRb0YmKAzxB0cGdb7IvlyYL+OJBaZUKM9m+sSWQaqdyds
	BrXC0B9um/kaPezqQUKspa6thUFHxIBQy9qgt7r29txEZOP1/oIub5T5BZ8/RjnK
	vm2nBqGMY7LSur1gQIuQSkve+xrp2IRyKbrCeLdCTj9cDVmpAF6bvqdCZaGwT2fn
	LeKaRMkBI80o0kjdnhwMBTFl1oDqDooUt6Kx1/ccR8LJCCJ9hQ01/LjozcsgOmj/
	HvHANIbDClAxByldfgAUm70r18/viY1FWPxCMkMnFHOmaN7TAb/Qoc/6gBhv1uyv
	z78jL55nDlroLP8K/D/Nk1Bpq0VxtaJ4T9tlzcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppfserpocford;
	 bh=LIj+1mCibHRzkDOLI6NPciksdPra6i7uppubfVT4rMk=; b=Cj7/n9zQDYad
	h+X7o/jV2AhFuYuN7IPjAD93YrBNcOjd2IZ2owvaUV79d4Z9A/U3xMcEja7+xlep
	Q1O8u+9Ava0tf7Cdh9tpK5QLD1nHJmGeaDCneYDPPK8p/RCkHTfq80S96Fl/dLq8
	f2m4PdSPU18p6BXhAIetHKd/8DYJrPASROmbgkoUdA4aqwdC5mCNWFLTDgscOUn3
	SKfx6esIejxYoWXzsE4Rsn7bt7JSGqyMHCyUuQLPedJloT+t9hE44rBjCnHO/k4W
	ft7gV0Men2YjsD+w5T3YvxIvYk1NlVCR2gvrfp59lVymkB/z8yJHGF1vsUlNkla2
	bjXp6HkCTQ==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: NfaSwcvdLxj2GNfaTwuIJX
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Thu, 14 May 2026 16:35:28 -0700
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
        anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
        michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
        dmukhin@ford.com
Subject: Re: [PATCH v7 12/16] emul/ns16550: implement dump_state() hook
Message-ID: <agZcQD9RXzrCRR9c@kraken>
References: <20250908211149.279143-1-dmukhin@ford.com>
 <20250908211149.279143-13-dmukhin@ford.com>
 <CAGeoDV_g0kTbTMq4dSXWjzBD5Gjf2CVTxgPRWPZ23dRV3QCjzA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGeoDV_g0kTbTMq4dSXWjzBD5Gjf2CVTxgPRWPZ23dRV3QCjzA@mail.gmail.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_06,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605140232
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C3:EE_|SA1PR16MB4706:EE_
X-MS-Office365-Filtering-Correlation-Id: 60cad594-5236-4ab2-b104-08deb2117d8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|56012099003|22082099003|18002099003|4143699003|11063799003;
X-Microsoft-Antispam-Message-Info:
	egpSyWC89ubtgJED/1zc44Kz/42kQ8a2kLIAPTqSL1sKGKadBRGfwW06OnCo6w7IKDj3WJ4w8VbeCR58Zn8jl/hcqAemvxjicmiH24JnE0GTwayEnHdUHvSR6FmU2X1ox7nM36PBClo2+IOpMppudOtL/aXT/B5OPfax4pJyZpDE9qhQTxWkvlNfHRRiG8e/rybUa8ncbvCrQ8GnG38Z7azC7D1JWyMC0g4T86p+qQg2Hc5YIaj2N5XiLvJVED3YAIMM8cEzSYLM9axOF1cGbQtd4E0YOVSPWcMvB+8qQeLKKPXp26HTuM+ri1KoIbfkEk5etfi/rc3xKtSREnqYjcakyOE5KVV197GSDtruliP7894jSKAxfRiPvULjS2ilE34rQQZwU3gQSCrGZ5RdWoqIbS2xYTddAJyg4jUQdvdLm+5iSfx3I9dde5tOqamkbcmwDeHDcd8IsTvklQB8eKxEcBOIDvZyKdKXs2QWjSulkfsFGf8gO8mf7zHPz1s1anf9Wn3XAtsydJi6nLP1zjosgZ+krmSVoPWIO+Td57LB4GaFgYgsKI3JI6VFg05eevdMJJ5SZ5PnqnmySNnTBDvxuR8b/0U80HfZ+mMAPLeabyput8i8Wdm2hIAdcTc9FW3NYcksCWVog7e6+QkeDg0M1/q5jj2UMMfPSd1/E9/rdROO87B/dnM6pXx3MaTKwS1zASActUXVUFjik2qMICiEgqV4b/Tq3XgeKdeU0Ww=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(56012099003)(22082099003)(18002099003)(4143699003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qbOGsahftcVW07XECoY+0pqNLeDPTzogKkozee7PyGK04irGa8XpmGkC/EafrSwmuEZ8AYfy02oyXEey/ok4FmgyyuoweROhHAXuLvF1JB3cxriOAuipvq73jDvc7GDSev1emAiYNO5WZLTuoTBC3ge7pviVsmFvf+/sxWfmEcGy9aMshgeHq2GziN/LAIYgyge2NN2jMczv7yRMOPPyHXxfaDVL7A/R1aH+yTnuwZL3TzG2gqq25yZ6eGc0+D3kAq2RqIDJMI9CvuaodeNuj2Tb+N+TMpMSF8NfmPCdsQ2k/sNR3L7l3XFq6mEJf9VfVkcqS9YosQOT1ONkggXb3nvG29xyY7fPdaj5vHUeUKX4aTPe4tk031I/qSTYmqWH5jWPx78fCofF62UPjRovzQfoR6SmWAt5/Pc8nJznzLwgaEbKrYihRtRTi+XXorzF
X-Exchange-RoutingPolicyChecked:
	oIR2bROouSuNSEFhyyO3xqnfyn4/yFdK9tvlr6KtXBNyl4uTC+BUhBH0p79C6kFXLxQlEOpzMC8GSV2z9fe1cFx0g71g6Wk3hxuQMBRi/ZDURQIXJxR3FnHkAq4t1BMDNXGtt3fPhEg9hO/aJP7PxsCsqA05vPNdOefD3BYtB861gW0/Vo0x1a/zhx9Io1Wgz38awZ/MEE2R/LEDQZocnCpCmipE2zkyK/E6noYTVmBW0FS8Qy9Ys5g16MwjRXSGccfNUYx4wlEZeHFWeOPOvRCiTYUVt1uF2XsqS/mOOyQeNf68y/3B14G9oBtfwJQf0fqltwddScStbK9kEIMIig==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	d60WuVTPhxMQoLBXydeRNtod6t1EfAnPoYcJSST0N9XN13fL6hhxdInN7gcG4uRv1FleqM81ho+cRuJrmur8rzVcWfHvGlMThd2SgGQdAxo4ZS1NLpnuASA+6ypHh4yJYBtcbS2wsIL/ilyotXAuOuN1ezdZ15NTeQ9f9f61ouThTBC+ReR3b4qo1+/owADQlnsMfNv/lbMePUcsIfRN+T4A/CMYkQ1z+jlAUEzeH6lLCxk3S1xyidO+t1LIiCfSjt03nQ+fWnRnEnnGB6O648pfmB8KQBzCJjmXQthnkSztEfDJD1xO+igS0P5y5fo36zYdy9uL/7zpzdh2OS2tbBncKrwu2y5tTV9rjoct6B33HqjzCytDTs4NDZIhOI6fYFUHN0YQiiExwr9JuQHJZS7xD0RjkppacY1i4Mhjd1dr3mNImWvam+VQ7dmnSMymGFAaindnPW70GvRjTDpGulqvyv7wWf5m1fR9w4agEcqT3SPGMW/y+X3cWw52FfCWunRY3e7fpHOE5PVwese63wfeiVTNGFgmh3A4OiaCtY/+5CHUsKCN5K3PP+dfF1wlpzyuigkt7LhyQCZe97yzyKHwj7KB+D0KmJAx0LU9N9usL7e8Plqs3awpf8Bouwa6+YrNTCiaYoAFWyIK87n5rA==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 23:35:32.3402
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60cad594-5236-4ab2-b104-08deb2117d8e
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR16MB4706
X-Proofpoint-ORIG-GUID: Qb-4rCQrHrauOLUXWbuynIlDpyIAZQEo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDIzMiBTYWx0ZWRfX4bH23gC0j+JV
 0FVi0jNYT4SooRr23hTAHb7uczn6l6y9itIPxpBiaonvuTdREM/NmsNzHpOAE9emSEl+m0sW5sF
 0uTi26/r1TnX5GVyLDJGnqMoJ781VG/zN33QCmw6CR8JrkG3hPLtkRzl1fpiVxW/VrgiAXCh99p
 o1luIdtG0PhDWwkgpomjlWLP0FnPeN2eh6BVtZ4HdrJUfonYfCfm7inW6e1QJ94boi1g125tu8k
 1EawOubt7fih4MQHo+cje4eK+15BVXj5u4nGJK9WyTZUkZmRvUvH1U5My178C1wdfJaBJZMNZJA
 5wjmmnE6I4QS952G9TVroALjgxl8oDoXSuX7CgCe/FMJ1z/8khquc+bogWWKepRC9i80MykqF2a
 dHlDOPXdGN9lXLxc2ORfFQ1GamUwYTIdKZYAWges95CIDB7tSBhfs96UA6oii9T4DQzqkLuuyVA
 U6BRj6qQw1fIzi8lAVw==
X-Authority-Analysis: v=2.4 cv=Yps/gYYX c=1 sm=1 tr=0 ts=6a065c4b cx=c_pps
 a=tYoGMRiLV1KbapjTPXDBcg==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=ARvDHhclS48edyKYUbLB:22
 a=mRLuHoWqYc15Mm8Wc90A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-GUID: Qb-4rCQrHrauOLUXWbuynIlDpyIAZQEo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_06,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605140232
X-purgate-ID: tlsNG-4011c0/1778801742-7E38D8B7-156480D3/0/0
X-purgate-type: clean
X-purgate-size: 2417
X-Rspamd-Queue-Id: 77EB3547CA9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,saarlouis.ford.com:dkim,azureford.onmicrosoft.com:dkim,ford.com:dkim]
X-Rspamd-Action: no action

On Tue, Nov 18, 2025 at 08:00:00AM +0200, Mykola Kvach wrote:
> Hi Denis,
> 
> Thank you for the patch.
..
> 
> > +static void cf_check ns16x50_dump_state(void *arg)
> > +{
> > +#ifdef CONFIG_VUART_NS16X50_DEBUG
> > +    struct vuart_ns16x50 *vdev = arg;
> > +    const struct domain *d = vdev->owner;
> > +    const struct vuart_info *info = vdev->info;
> > +    const struct xencons_interface *cons;
> > +    const uint8_t *regs;
> > +
> > +    if ( !vdev )
> 
> Is this NULL check actually useful here? At this point we’ve already
> dereferenced vdev (vdev->owner / vdev->info), so if arg could be NULL
> we’d already be in UB. Either the hook never receives NULL (and we can
> drop the check or turn it into ASSERT(vdev)), or the check should be
> moved before the first dereference.

Will promote to ASSERT().

> 
> > +        return;
> > +
> > +    /* Allow printing state in case of a deadlock. */
> > +    if ( !spin_trylock(&vdev->lock) )
> > +        return;
> > +
> > +    cons = &vdev->cons;
> > +    regs = &vdev->regs[0];
> > +
> > +    printk("Virtual " pr_prefix " (%s) I/O port 0x%04x IRQ#%d owner %pd\n",
> > +            vdev->name, info->base_addr, info->irq, d);
> > +
> > +    printk("  RX FIFO size %ld in_prod %d in_cons %d used %d\n",
> > +            ARRAY_SIZE(cons->in), cons->in_prod, cons->in_cons,
> > +            cons->in_prod - cons->in_cons);
> > +
> > +    printk("  TX FIFO size %ld out_prod %d out_cons %d used %d\n",
> > +            ARRAY_SIZE(cons->out), cons->out_prod, cons->out_cons,
> > +            cons->out_prod - cons->out_cons);
> > +
> > +    printk("  %02"PRIx8" RBR %02"PRIx8" THR %02"PRIx8" DLL %02"PRIx8" DLM %02"PRIx8"\n",
> > +            UART_RBR,
> 
> Should this be using cons->in / cons->out instead of cons?

Yes, it should!
Thanks for the catch!

> 
> > +            cons->in[MASK_XENCONS_IDX(cons->in_prod, cons)],
> > +            cons->out[MASK_XENCONS_IDX(cons->out_prod, cons)],
> 
> As written, MASK_XENCONS_IDX() gets &vdev->cons (struct pointer), not the
> RX/TX arrays themselves, so its size/index calculation will use the size
> of the pointer/struct rather than the in[]/out[] ring size. I think this
> should be:
> 
>     cons->in[MASK_XENCONS_IDX(cons->in_prod, cons->in)],
>     cons->out[MASK_XENCONS_IDX(cons->out_prod, cons->out)],
> 
> 
> Best regards,
> Mykola

