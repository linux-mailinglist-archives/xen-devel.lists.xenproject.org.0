Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gbkwNoyDIGpC4gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 21:42:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6753A63AF06
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 21:42:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ford.com header.s=ppford header.b="R72UkA/I";
	dkim=pass header.d=azureford.onmicrosoft.com header.s=selector2-azureford-onmicrosoft-com header.b=PssV5tj8;
	dkim=pass header.d=saarlouis.ford.com header.s=ppserprodsaar header.b="Z/W0Mlor";
	dkim=pass header.d=ford.com header.s=ppfserpocford header.b=C1LVPiFh;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=ford.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1327103.1592327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUrTO-00015B-BB; Wed, 03 Jun 2026 19:41:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327103.1592327; Wed, 03 Jun 2026 19:41:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUrTO-000122-7a; Wed, 03 Jun 2026 19:41:54 +0000
Received: by outflank-mailman (input) for mailman id 1327103;
 Wed, 03 Jun 2026 19:41:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wUrTM-0000zw-IT
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 19:41:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUrTL-0050SH-VE
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 21:41:51 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a208352-2eae-0a2a0a5409dd-0a2a4504e472-44
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 21:41:51 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a20837e-1dec-0a2a45040019-94a38ff18e80-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 21:41:51 +0200
Received: from pps.filterd (m0367128.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 653I67vM3791116
 for <xen-devel@lists.xenproject.org>; Wed, 3 Jun 2026 19:41:50 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com
 (mail-eastusazon11012067.outbound.protection.outlook.com [52.101.53.67])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4ejs88s9x2-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 19:41:50 +0000 (GMT)
Received: from PH5P220CA0006.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::7)
 by MN0PR16MB6474.namprd16.prod.outlook.com (2603:10b6:208:4ca::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 19:41:47 +0000
Received: from CY4PEPF0000EE33.namprd05.prod.outlook.com
 (2603:10b6:510:34a:cafe::5a) by PH5P220CA0006.outlook.office365.com
 (2603:10b6:510:34a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 19:41:46 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 CY4PEPF0000EE33.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Wed, 3 Jun 2026 19:41:46 +0000
Received: from pps.filterd (m0373460.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 653HiJpR912828
 for <xen-devel@lists.xenproject.org>; Wed, 3 Jun 2026 15:41:45 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4eggrxycfr-16
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:41:45 -0400 (EDT)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id UrTCwy44ZbrKTUrTDw0Yzc; Wed, 03 Jun 2026 19:41:45 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=kkU
	OyJY1LbcdgYZnCI7pAXvD6QE+RD6OVyTm47+DbO4=; b=R72UkA/Iz1VY9WSO4/n
	Sp8ul0U0QxDg6BquF+LLgYub/32bnKVkMlWG2VLNconaEqDsPXJGOVaqmSDO4D0D
	ygKpXUD0HEy26SNCBxq7Oh5f7PRCNVH/9tFaZssYBFZK5Mwv7q7Sie82AIICISyr
	9/8tBOdiZxQ3VNkZVToBjvoO4f8W53rA8nGjiPw/GHI55D/UJnPjZ2OGtdE/tJ5k
	4NAO5gcjYwMMHp3k4MlPA+pCAcI3eLM1NFIZfa+nL5fwqUyM/paIpBQkP/x77zWB
	V8RuUmmLCGmNthw2Ep9H+1IEgZKLPM9LN4lCbYu+bi+wtzsZ3MmDk6L924TLA+9n
	pCw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CeVPDbONnyDgSjGG8bLRZzX4U6oGpLoQUGW1iGJDb5R7EM6IfOo4tbrO3qJTcC5ibf93hQ03kpa8oLkEw9VLfaF8Z4rGNm57DLX/EJs6ZDJ11RKLrrdPp9biXVQiae5A2kyklezlZD2+lVe0YLo+3k3EJsC8oQqo0fX4+hhtmGSZkQxqFmnbTlrtQzNt+JF3PcHiliOyzjfYI52jHu5jnacabPdf2T+Uo37kIv+MhzQW6L0QIoL346qgCnukoRfWG7f5PsK5b50h6lwESAfmgp9+CW+FKGQEIQjMSIn+xu9Q1pQtDQju2vOz6RK0rIU3vqTUJfXEfhXxNR12glhDRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kkUOyJY1LbcdgYZnCI7pAXvD6QE+RD6OVyTm47+DbO4=;
 b=sKusjbwEpGlIj1q5o25eKwie0TYAvIMVqKVw/NZxPwLyD6ecmni7ciat7Qa2fNRqUmaMFWPycbElpWbPYOTYS56MmG3Px9WG8wHsfsCYaWRveIoWdhODbqxQAGdKStvj778fuRkZwybpwfEWaLmiG8qpLgGmalrmhWjP/I9vPu+c1uwJ/sGyqOncErVWT3KtZHIrrvAkSsN3oRPf19oBDWY9AvYj/Ojd8AEmcoH14yXy43Z66MN9wBLn1fkvVJc7t9taJ9HSFMsPLxV2fd8cLX1lSbxeCbn967q01d843yn/0bshLwfHwfGlJBqHlFb3jVKevncM7HWqRdDYAQZJkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kkUOyJY1LbcdgYZnCI7pAXvD6QE+RD6OVyTm47+DbO4=;
 b=PssV5tj8DHkpPT/PsYmd64kGIjKTp+aKIypb5irMypg1SM+PxZEldMlq8mh0g02PG04uQ2HH+W+ngKH2NgLIPIVcrxtCSY+Oq7mDEGLeRU2IRumwR6vPjnftPECs/gQV5E3ibYMHJ6b3VLm0aMaXC/MKwcYspyrGzMOIgiuEFfY=
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
	ppserprodsaar; bh=kkUOyJY1LbcdgYZnCI7pAXvD6QE+RD6OVyTm47+DbO4=; b=
	Z/W0MlorFxP7pWBStXTXk74MVxsoWJN+uJmS5LZqufKq+gERByf/tdGZjnlFTuUi
	B66qtiFjvZ9jkpYNxlGzlcUeJPSCbdeJEpCx9Vwvr39BrhxXbLXKkI3HrpzwNg0o
	FGBFTQcLLhej+xn+agL2JsET6lylyHIUjjEGY2184BkphjqDQ0rxgwoHmAeP/uHQ
	xiMf/zsFguJx8zIsLBMFVjdp7sGG/pHIhOghDJwDutvBOQwLh0/+UrbBMwv8H7OO
	zUJdI9ShNP/zu/BLc9Jvun3UBsRawPVlhcovPk3TuBvZ7lwxGK+ZuwRtSQrPsDXh
	iTkK4lXfKMS3AmN1C2RIMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=kkUOyJY
	1LbcdgYZnCI7pAXvD6QE+RD6OVyTm47+DbO4=; b=C1LVPiFhue1wfIiHFKbGthd
	BURoSZBNymsPYTq1eJK3XoyUWfZskeFmGlz/ym1m+ZozzdMXaNLOk8ikHoqWaTEs
	6NcBKtsXZj6Q/JMFgn38GFqEMOjPYNM3zGEzxtH0ViBm5h7OjucVr7hBu1zlSp49
	8GSpVqNEOzVWUqqcByxPbThy8TlVcne5BCf9VxQLw6YTGmAzoI9mfxaZqgUUtij9
	TaF8OfMciHyS6lUVa2HIe2vD16TI5FcIwRKgBTeuS1nMb42+nIhlFasidBWCNeC8
	Q5fBjZfyfv3HNI4+ZRA4N0CTp7iT78oVtPY1UFv+zZ4CtztXIWNK5vRxRAqtdaQ=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: UrTCwy44ZbrKTUrTDw0Yzc
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v5 4/6] argo: fixup argo_dprintk()
Date: Wed,  3 Jun 2026 12:41:29 -0700
Message-ID: <20260603194131.1468654-5-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603194131.1468654-1-dmukhin@ford.com>
References: <20260603194131.1468654-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0
 suspectscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030191
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE33:EE_|MN0PR16MB6474:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d48d06f0-10c1-4ff4-9501-08dec1a825ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	m5kmXhcSS9vfZR2y/vtAY3HnsW4zWUqpXBetNYzTgjKx8g85xAunfT03rRphDGXRhUAImCG5l26C6t+XUUYDcpv58Xc4l2I+oIDbTIEjpoUG5qoUK4MN4QhJkPhYMkMgxAP3R7V24YTgtITjcu86s+b3Jn99pelZZ2cit7AZRE/n088tUu9FhwHIsuH20GtG2FoktLot1hdmilGaDP05SitmqxHwKcdrJamxZubVa5oGQFbCbX1KLp0Uu7H7P7EsI86LUX0sRd5zLD3HW1jQswQafoG9kMRX8vLduZfql6JE5ZLbt/kDMnFuf9pFlreazF6g+JMOMlNhuzr+4aR4C91OEE2eo268ZtKLW2TBI3GRMEANZKD2Mm5fCCj6cpm+rR2+vqHpQb8bZURRMyuv/B7tfbTnu4J153LTdbe0GBe9q6THcTUJbpldRvwfNIdz5o5icnhZw6Zzahq7B8J/bkCDnsjzaigG3ApaMXTH5iaiypNgBAjMjMUMk1Z+kFmZ04QQOjrGpq0pX9AM8pn2PhEHTw4NRYIQC5vzpX90ms42Xu03EuxZ7FHM4w8kAHAkmJS0hds372ZoGUks36VGdVw3n652ojAS+0n9RNuEZ3kAELli0ODNEz8pXSBeJoKjNIRr3oMCqFuaFvTSVh2TiO/SCIy6LxVbAY10zIiU7YICWnVY81t7vLl7ghqVkPMthyQszK+fze0k8XCf0wV6KS62K3Gc30QZa1GU3rsuNuk=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yiCYX8LfHRVcNNBrEtvOVNJ2JfAT8lyYgyGMA3ul+qACsLAS/bzuKsCsZZWV3mpygdNAkI2bz3s8oxkTicsr92oV2R9eaZBEQv9xEhgcYathkAzih7DiPL47RFqNePocUfXiVpkehh7tBqEEDQ8i+El9vWbYYEFQYjsgczHf52ooSO56NElLidpp+S4MC3bAs83brPOJMaMnkxBY/h8Ut1FcVhIKyBXvaAQuBXLTDDzLrmBUnPamwQjrPc3LVlPbfO9CCgXHkdQ0P3PN1MJhyat0Q/k9TQjonzO7M5RO8q6H/Oxa19jgyS4jnc9ObkEa/P+TVXFiKGJJmA0ibDamCf9TbN+RmUMvYPmYHXJdaf40VpMbhAOdiOUOf4xrl9TvZvvrouhOApQxBmqsk2Nhf/wDMLsEwMr/SnIB4bE1dyG9hCEH++4cJv966hjrAT+U
X-Exchange-RoutingPolicyChecked:
	jUTnbMf09R/YXdlLzyJILOM6/GN0xexM9LQCeNoq9qg256wIX71dwk/9NRgke/Icjnozc4NPoq7sZX7YObuxnqjJsiDRjVPhOkqOMj39XpSovpUAdXflgT1VoP9peajIKKpQvRiwDLKDpES6466b228ZXfGTPVRJZKzQ7qrmcRsL95QeaM0adDzKaQyjJfh4Ns/gWeYhnSX+oc6PKZntpXLyyw2OEhRKWGP+0DxerzQPkJjemEwENlzd7zbIog6jz2pbigJoeq3Byr9BhJ95x0PJuI+bKlNE2CpUA8g4yQfuaGQH+S0kY2naTJlaD3AESALeGABIGhVl/3Bm7oOtTg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZhOyfzwD16/Fg5d8IZNC0H9WtJ1605Us7Sf/TVZATLdQ9VZDE2eson8B+LN/VakT1Q5yeOQXa3k2ZwJVubUsCYHhS5Z8rfCdI/vT815CK3igK+IB0VcziJGl94o4sb42hpeKdY+Z82714IeDAThejHJRf9yWtsLJ/R0lC1Zry/5hHiIqKvn0ZZogeyXEc6LyfB3AYB5iy3JZweXdUNt608ggq49ceTwVp2ORJSLIFOmL78P8G/YlcrRNzF+62ESF04eOlAQ73va6Pz7WDqF6K7J+kg9p/TA8YypisRA3lvq3kMM4GBRhzugYDoSAML6BW2zrJHsIVF4uvqzD7pLaJZof/rwONtMIkThAy6eFovd0cEPJPyPiFCtGWC05c0ChjzHwI8CZoJn3OmivdYvZGDPv4S7C1l/RLhIJV4Bbzp1xcDn4smsghCOn4ztyyIrRfDRK4RDC9mIn8uV4/qArxFNaKY1mnDBNtvgS2r1gJwcayGaaqmUGeijjXtDbRRrzMOU347/f5SoYmwMUdZ68wo/rlYdBB3gr00ncg1U2hK/zJOYrWCOoNRIlWJu3vp79T0njs/IhXUATb+tRR2jKdOyx1fzOusLiHHvqJglCgxcoq4wLs1hQ4ksZRaldvBWO
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 19:41:46.2532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d48d06f0-10c1-4ff4-9501-08dec1a825ad
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE33.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR16MB6474
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDE5MSBTYWx0ZWRfX1/xeUFfNr56k
 JGHwsuBub9sQLLR1mRz/xB1JyjQrCC35kaO/n79m3DKjFZT1rhe5IM934zA88G6RPa7p93yR5j7
 OhBIs8DHcyuQ70PRL8HoDer1PYUnXbOeKompjVYM3L3MAKcehSivuXVel0JPg1JZDJmV/Fis8PX
 PBXHUKrr4dAAGgcbXSFInzpYFsF9p3354eKWN39rE/b/7CQwSXRqwFXXGY1oQkba96IWmUmuzlr
 jHFukGfmln6Xiuy4l3HIuXjixUSZxSWZJnHabo7552sPaAhrctw+E5snuCv+XkNuN4Ker7VcbPK
 kReqVUS2I7lOWW1Om5dFv8ELCmwy4j/gsBPK3QRC/31Krbau9E6Qu7Io+DlsXtoVN1S7DanQwKB
 3//95oaud9dzinwlov0aT4Wtu6jhEJRUslvnWxD6zMl4XbZLfyqfmeS5K9TJxVUrIi3mWcWBcl2
 rjOD8nGGlbpZ083jTzA==
X-Proofpoint-ORIG-GUID: AKoQTx5sZqu3xNEpRVvwDvKJyhIaj1-8
X-Authority-Analysis: v=2.4 cv=Iv4utr/g c=1 sm=1 tr=0 ts=6a20837e cx=c_pps
 a=2WPJyM168hjBdVADO68ohQ==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=WER9OelvoqQQjwJToBYG:22 a=cbNQJ9GKAAAA:8
 a=VwQbUJbxAAAA:8 a=pEvCPAv3zxDdP9UjV28A:9 a=P0bj-C3X3jJDpopQwM1U:22
X-Proofpoint-GUID: AKoQTx5sZqu3xNEpRVvwDvKJyhIaj1-8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030191
X-purgate-ID: tlsNG-ebf023/1780515711-2AF653FF-7341D548/0/0
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[saarlouis.ford.com:dkim,ford.com:mid,ford.com:dkim,ford.com:from_mime,ford.com:email,azureford.onmicrosoft.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6753A63AF06

Current argo_dprintk() implementation is a wrapper around raw printk().

Rewire it through gprintk() to allow for better debugging context
(such as domain ID).

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes since v4:
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


