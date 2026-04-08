Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PWcAtzn1mmXJggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 01:42:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2FA3C4D46
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 01:42:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276606.1561977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAcWF-0000k7-Kp; Wed, 08 Apr 2026 23:41:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276606.1561977; Wed, 08 Apr 2026 23:41:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAcWF-0000hS-Hn; Wed, 08 Apr 2026 23:41:11 +0000
Received: by outflank-mailman (input) for mailman id 1276606;
 Wed, 08 Apr 2026 23:41:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wAcWC-0000hK-Uq
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 23:41:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAcWB-006f8p-Lq
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 01:41:07 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 69d6e766-5cb7-0a2a0a5109dd-0a2a4502d386-6
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 01:41:07 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <dmukhin@ford.com>)
 id 69d6e791-42fa-0a2a45020019-94a392173d3a-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 01:41:07 +0200
Received: from pps.filterd (m0367123.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 638LtnUG1629759
 for <xen-devel@lists.xenproject.org>; Wed, 8 Apr 2026 23:41:05 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com
 (mail-centralusazon11010064.outbound.protection.outlook.com [52.101.61.64])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4ddyc78g8p-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 23:41:04 +0000 (GMT)
Received: from MN2PR18CA0023.namprd18.prod.outlook.com (2603:10b6:208:23c::28)
 by SA6PR16MB6588.namprd16.prod.outlook.com (2603:10b6:806:415::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Wed, 8 Apr
 2026 23:40:59 +0000
Received: from BL02EPF00029928.namprd02.prod.outlook.com
 (2603:10b6:208:23c:cafe::58) by MN2PR18CA0023.outlook.office365.com
 (2603:10b6:208:23c::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Wed,
 8 Apr 2026 23:40:50 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 BL02EPF00029928.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Wed, 8 Apr 2026 23:40:58 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 638JxUch777966
 for <xen-devel@lists.xenproject.org>; Wed, 8 Apr 2026 19:40:57 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4dcmrqjwtj-4
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 19:40:57 -0400 (EDT)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id AcVzwVEAeUZxsAcW0wIGfL; Wed, 08 Apr 2026 23:40:57 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:Message-ID:MIME-Version:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=ppford; bh=RQ/j706FzHcohf7qfylReK/Vk
	W8/+qooP0yijNDcb9w=; b=gcRoDdh4fpXYeaTgY8GhvjgHbJovy2eR6lZsjLpw3
	yAw0bXWbn1AayCdhw+A/iyirkmIktVHRnZsnuwVAqNggK+QMOyKkq4lFnu4BD3P0
	3uEIjx3Ys42noywJ2WR6k9IK5TXpi7vp2azNHIcSuPJjKTxQfUHgx9OSqB8Jcqsi
	AaX4Vbt9tLoSBxQA5ChjusdUi2XW0P3w5rMcVG03k5EFsZSw7PPr6DBOndw0Vhyw
	8z/h2hBqTC7sDln/BZ22As4Fpb/3WRbocF4obFJW+aaQn+mC4k/mKxY7tfsHmslR
	EQ1i2UfqSWeAWp4NpOTQWeZX4UwwUrTj9PSEARqU0+lzg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OT/qMrS2wAzELh3OHuwt7Ggx719Fc13nG9kJJzEh/Sv7Ukt7sbd5utoedF2oE5wOxGn3kMSjW7MITLrb/cXXyEW1Gkm+VPSHRiu8AHEm5SjD3NVEQicVFp/DMDepxZHyOoLibqMyXI5lweqmeddddttfxoysXSoP+wpQY59k6FgRa4oRBOooMSP9JfDVpA8BmT1VlqDwFnwoBp4yai2yKYHk4J2q+4V88tcCE0/WspgCWNSJD1mf3HuG+m23asgMqSBy/F2B59RT1AVidEtcyCsmg+przKs9ddotd4BAj4zlRpTnrVNtfOwiWaU41Qx4OWa+FlHU1sL/MAbrGm8xpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQ/j706FzHcohf7qfylReK/VkW8/+qooP0yijNDcb9w=;
 b=iiSqdAHivRoghNXRubUHUYPyMWGtmVUoIRTBxOWyX2w0TPVwMryTqMIfmcNXJjpyqrz5z67SXcPmmnx42Sy85m+NSN11P0dAEdKF7Xpvb8fvxrmH97ghaU9owCzlGiel1YVcffLFju/a3BecskhyKRKy0/1ED3I8c+dWv9iZUwlBRMuClyIy6CqutQYVJL2P2+XRjw9cUhZj7puXbPq2hn4kGomwCXorHfenI9BVbaohnnpEQhW/rIFQasXRoGsZIGEgyZwDRECDh7NC7x7FKlVJEwZsEcw3nu4Kvc/svGsTKXrHiOY40a3LYSJpw1Tvdc4pH0mx1blKvn9iByYYQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQ/j706FzHcohf7qfylReK/VkW8/+qooP0yijNDcb9w=;
 b=fsQNzp+Eguf0h0+k9tLBEY46n/a4y4H0pdJZFosaM0aZpvHZeirO2TbvsgN69bWXYJ4GH3GGVd/sttYI9eqvC8Do5RBO3nm6UKLMUZusotRLE3L1Z+uw5yJcr44yjHYetzzREbo48W+UmRNMgmQZL0oq3PxuQPsFLSgCehXzsG4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to; s=ppserprodsaar; bh=RQ/j706
	FzHcohf7qfylReK/VkW8/+qooP0yijNDcb9w=; b=kSerk4+WD9x4SdxbZTOKg9l
	ZtwQ8gyseBrkFe1ANZeOYRc81OodKAtt92MjMcLEMFhYI+er7usSF753t/fwARqP
	pNOu6YxvO5L5io2BCYZ1zJ8HkAYSm6gU6440SMclyoCsps5+wGcrmqdTKxaZfTm6
	hMcxirOs/XTtkunk9m37k+RO6uW8EUPROyY/5qUXENeS6AS+ww+06DMwtcq6MsSd
	wOao8B/Z5YB+TB4P16ZTig6Mxw6c5rTp/Z0eaoQKtYQePZ3oFbKhuzdppYwzdcLq
	tMuzmZYmekseKFc3gSV+DgV9gDwzc3VXZTXl9v2GlqrLZgXE6cgCzRNWXUJMvFw=
	=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=ppfserpocford; bh=RQ/j706FzHcohf7qfylReK/VkW8/+qo
	oP0yijNDcb9w=; b=ZWQ+b+8aHBTP1eOzrp5NC/t5+xQU17QV6dd33m2DVF/SCm5
	tuMzJoUfmwYDSiM/O7IRAow06rgr5eSUDaIa7dXYrwQ4rjz0S15VxHMb2F+0J5Np
	G4IouAaC/RywuO14gCsx5uDKbuUV5+fdsfsrsWfSnKNNlJNOCRMeIVvvcdHCBIm5
	yZTa5LD6eqOeQIvfawaehioufZ4pqA7ZfU57JqQAK54P1FHN6rNb1ip3w8P/N9J2
	75ZwZzEo8V7pKaTi6f6Av54Q54iF6za8I+ExRViJkl8VmOc1JQTe5/89zGUx4hXi
	es9Vp79BPRZKkSboRiB3X+GANTrdcZP7ciY9XkQ==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: AcVzwVEAeUZxsAcW0wIGfL
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v7] xen/domain: introduce DOMID_ANY
Date: Wed,  8 Apr 2026 16:40:46 -0700
Message-ID: <20260408234046.1314021-1-dmukhin@ford.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_06,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080219
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029928:EE_|SA6PR16MB6588:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2dbb223f-628e-4b2e-11e4-08de95c848e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|13003099007|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Q4kpmnRPMvqjYK7+URhHYdDIqJCv543mm14VqY4onvcnS2+gbU9io05F7ZbLH3IULCXmbgOz4NUNIo29MaFO6au25g0XnxvLTWtjYs7D/kgUTu4Qlpp4fD7cgE75XaS7uXKtEJSv9MwtEx/ZJsnkYJd8gOXw+0m42RJ3NtZdELjZmjnVldVgJKamo6QGFPFhr5tVNWIVfkTFUr5macuG/JP4PnFSn3u+7M4V2VnCyrDM2llesaISnJubfZ1zKi88PzGHzAxcQClUFE47lvwh89u+XpDKVGTgrsjQQB5aqb/tU5tvnryD8AVNQwtCiSw9YqjoZoK+F+Dri7pYXDWrr6U9Xr7bvUnzFfb1noZEPFrQBWmt8lH9jNPl8AhCGHfmlosv4RbD8lv2H/sEEG2R/aWteToGcuz1N2qqdVpYd9VXUESDHqaWFfTEueAKxo5wdIXpOfKz1JvYa0a4g7cMdWm/JL6iPt46s5TwEjhEruUobXsNtsT7BfRxfhZ22hRbk8NQ/dnc1NtzF4mXFv6ZmEB+EPSrQS4dFBbP5KO8C1MOAY6+djqQJH7ncQ5c6JWApeOXF+sC3kipJUAuQtB94orksRGgVUO+KGqbFLEdKcYmXc8Q9cEGEFnTkEiv4M7rVWvToqry/4mIVhq6yulhxTAoBVpn9VJbh3JzKoTQZY7RznzPfzDXOSM8lIwBv5jctEkKXAkh5dZlqkzjdW5GwDkHad1a9PB6JYlr2uSCTrM=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(13003099007)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NFVeN63SNt9Ki3Zr+Epdze6Lqf0zuxtt3FSqQYYyru2s38xkOvbwjjliOX195Gp9itJwOap8nMZ9d4W0KJ3KicxvtrfhF/w+H80MTaSBCEXra5XqEaOc1gdd2NKBNM+67h9o75QTJE5cNmNgxp9Kd8eRQaLaZag05e6EcT8o+0eMdtSRQzPuAv8Wsfk+hENJgAQTXMQzQro95uHowgtieh4NI9foNmf2y51CeK7tsiGd16nnJw2EjHiTQmhdiTadaDVnDdgvHDFVnMWncZi1qK5AOu1wH7dGlvbQjfZvynpztegYUFyAHYS5iZ7eC5pOMOJSYuVM1rZKXXYkMemC2GXLfXpmKiuOdyU6d/rE/2Mb+In01AfARDr/lL9OzPBFefDbrguj+aJdvs1SGpTAQA+rZSw5dFYhupUQ3teA/cX519wtCYGTTmfaKDBMHfBk
X-Exchange-RoutingPolicyChecked:
	uApO38a98059SlNOVT93f0fcgcgbZANlLeQocQuRDix72p/S1ZetGxSojbYhaThM+/dV7HcTV3xyVkBfYzRX9BHN/5/jWHibstfBRi+oxkrKlAiWAZGrYcEvf9epbusuFFUdLw4erykn64CoVEjHIXUZsqL9earlJX0lJPmbYKhNwOWTgUayDczr7icndlPxNuHnB1oqe2Xx5cplAfjtJVIf0hdlYJHm2ngwR+QiMUn45Aigh3gXGvX0EzPdp8RfWuSyepqni01ZPvDm5Gt7fsAo9Qary1PR3XQwCRmtDyICOCAfN0Ihi72Mo1WKeFwNa4tEHCIhKWjCZdrAwivxjA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yI+RdjJbfuhkg9iFKJrULmgawfnWWVG8B+hjiIRfcqZyrLVuTGr/cz9UKOJaUaKFM2WlB3yRa3lIZ/o5na1mns0XBx4IoEf2VT2CyzHX0reZPWsAaKYKBjTtJepz3pyNskUJNAflHgDGaq/k9KMjJJ/yv2WG/LS3v2I2fvErlUN1zZAtHwkJH8PbkKtjjRpEmFphgZRd1e+AOoAzxAM3Q+N9LU7Dy8jwn04KtrHDygWOuNYSYStP0U72073NI8iyyP/hppOsRepW0zhGKIWd3bmGlYN0jbRtrcd07ZTNBqOjhP+TSfTB66fmfwOVFyIJQ7NsSI4vgPW1FlcHlH0HMKrmZgIoSviWp7tAzCSoZxz7hBZgTPGVIWu7OLaZB/dE6TJ915fH5qeWbu5PrLSf2WSYj2dOWBQsQIWLqHZi67Gsab8M/86wFL50bjOb9NlG08kc0iRcoCXAz5BTaqYGye3rFmUJ9nSt1y88rq9Mkc93PCBdSqMdyAs83myuy0s8rsYty4MGHDZaQkjJdXdlA+FWfiQX3ubEg5FwmhWUJqO6+APY8AKyL4FEBBZUYRCTONPh1l+MrTvhZsZQx32apU5CSi9aKhgDmKKz0yImlYkMKnaS2EMR6HAtYxdYZCsHshlY8EcrPTLhpdcyweKkng==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 23:40:58.1147
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dbb223f-628e-4b2e-11e4-08de95c848e3
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029928.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR16MB6588
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDIxOSBTYWx0ZWRfX/2uPI++nX5mR
 uiczdAqVc81pHD0AHlP9tNeH521g48pdDEPbzQIoqKn1K/BJu0zO34XwbLqYxbJYf5tHl3YIuZE
 KWu7k5y7hf+WTFtJHDsQk5yyhYwmtTULbHW1p4KsCUYEEErQFbXFZvHrKw19YwQJqiGcGbx7YrL
 Xky4bVADAEWa/afA2hiag/JkPBPUEt0vtEpUgd2wcJJEC2L3ANw8yT/ne/UgwK10VYbwzy6nObl
 F+zMcwy6XekYrUAXnURxyjWCLyF1SSggCj9mO6aeBV3bfZQc+E5Zde9TwSdidRmb8GQJai9s5Xq
 7J5IdQbdfRWnzcgPWLV2NeVM2s8r81PZpQzNOa/rorY4R52EvSyKVJad+qyTuYCLbPO6sQAUN8I
 5B6k/76/D5kMzzwnDULf1NtK0vq4X0i6brAUHlyMozoAl5O8WeShpV2romFqtO5BPvumHbVBqGV
 KISqQfLm+GN77fnIx/w==
X-Proofpoint-GUID: OYkpjBt_wUx-X9StGkMFdKFCBjneb8ML
X-Proofpoint-ORIG-GUID: OYkpjBt_wUx-X9StGkMFdKFCBjneb8ML
X-Authority-Analysis: v=2.4 cv=Ida3n2qa c=1 sm=1 tr=0 ts=69d6e790 cx=c_pps
 a=0b+utHCzfji0ILmZHHcyhA==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=A5OVakUREuEA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=N9_n2FxmZfwfyRXvS9-E:22 a=VwQbUJbxAAAA:8
 a=cbNQJ9GKAAAA:8 a=p0WdMEafAAAA:8 a=UP8sGbTbwCjyvoZiEfAA:9
 a=G69WFyCBNqGPyalROSdv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_06,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080219
X-purgate-ID: tlsNG-720697/1775691667-AF323CD1-E8B5013A/0/0
X-purgate-type: clean
X-purgate-size: 7152
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,s:lists@lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	FROM_NO_DN(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,ford.com:dkim,ford.com:email,ford.com:mid,saarlouis.ford.com:dkim]
X-Rspamd-Queue-Id: 4D2FA3C4D46
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Denis Mukhin <dmukhin@ford.com> 

Add a new symbol DOMID_ANY to improve the readability of the code.

Update all relevant domid_alloc() call sites and harden the domid_alloc()
input value check.

Also, fix problem with passing invalid domain IDs in
XEN_DOMCTL_createdomain: turns out libxl__domain_make() (toolstack)
uses 0xffff as domain ID.

Amends: 2d5065060710 ("xen/domain: unify domain ID allocation")
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v6:
- fixed libxl_domid_valid_guest() check in libxl_create.c
- Link to v6: https://lore.kernel.org/xen-devel/20260307025451.3148078-2-dmukhin@ford.com/
- CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2438790748
---
 tools/libs/light/libxl_create.c         |  4 +++-
 tools/tests/domid/harness.h             |  1 +
 tools/tests/domid/test-domid.c          | 12 ++++++------
 xen/common/device-tree/dom0less-build.c |  2 +-
 xen/common/domctl.c                     |  3 +--
 xen/common/domid.c                      |  5 ++++-
 xen/include/public/xen.h                |  7 +++++++
 7 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index bfc9149096a3..6fd62d140389 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -681,8 +681,10 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
                     continue;
 
                 local_domid = v;
+            } else if (libxl_domid_valid_guest(info->domid)) {
+                local_domid = info->domid;
             } else {
-                local_domid = info->domid; /* May not be valid */
+                local_domid = DOMID_ANY;
             }
 
             ret = xc_domain_create(ctx->xch, &local_domid, &create);
diff --git a/tools/tests/domid/harness.h b/tools/tests/domid/harness.h
index 17eb22a9a854..65da0d075a2b 100644
--- a/tools/tests/domid/harness.h
+++ b/tools/tests/domid/harness.h
@@ -41,6 +41,7 @@ extern unsigned long find_next_zero_bit(const unsigned long *addr,
 
 #define DOMID_FIRST_RESERVED            (100)
 #define DOMID_INVALID                   (101)
+#define DOMID_ANY                       (102)
 
 #endif /* _TEST_HARNESS_ */
 
diff --git a/tools/tests/domid/test-domid.c b/tools/tests/domid/test-domid.c
index 5915c4699a5c..71cc4e7fd86d 100644
--- a/tools/tests/domid/test-domid.c
+++ b/tools/tests/domid/test-domid.c
@@ -41,20 +41,20 @@ int main(int argc, char **argv)
         domid_free(expected);
 
     /*
-     * Test that that two consecutive calls of domid_alloc(DOMID_INVALID)
+     * Test that that two consecutive calls of domid_alloc(DOMID_ANY)
      * will never return the same ID.
      * NB: ID#0 is reserved and shall not be allocated by
-     * domid_alloc(DOMID_INVALID).
+     * domid_alloc(DOMID_ANY).
      */
     for ( expected = 1; expected < DOMID_FIRST_RESERVED; expected++ )
     {
-        allocated = domid_alloc(DOMID_INVALID);
+        allocated = domid_alloc(DOMID_ANY);
         verify(allocated == expected,
                "TEST 3: expected %u allocated %u\n", expected, allocated);
     }
     for ( expected = 1; expected < DOMID_FIRST_RESERVED; expected++ )
     {
-        allocated = domid_alloc(DOMID_INVALID);
+        allocated = domid_alloc(DOMID_ANY);
         verify(allocated == DOMID_INVALID,
                "TEST 4: expected %u allocated %u\n", DOMID_INVALID, allocated);
     }
@@ -64,7 +64,7 @@ int main(int argc, char **argv)
         domid_free(expected);
     for ( expected = 1; expected < DOMID_FIRST_RESERVED / 2; expected++ )
     {
-        allocated = domid_alloc(DOMID_INVALID);
+        allocated = domid_alloc(DOMID_ANY);
         verify(allocated == expected,
                "TEST 5: expected %u allocated %u\n", expected, allocated);
     }
@@ -72,7 +72,7 @@ int main(int argc, char **argv)
     /* Re-allocate last ID from [1..DOMID_FIRST_RESERVED - 1]. */
     expected = DOMID_FIRST_RESERVED - 1;
     domid_free(DOMID_FIRST_RESERVED - 1);
-    allocated = domid_alloc(DOMID_INVALID);
+    allocated = domid_alloc(DOMID_ANY);
     verify(allocated == expected,
            "TEST 6: expected %u allocated %u\n", expected, allocated);
 
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 840d14419da2..3c18dae5e625 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -852,7 +852,7 @@ void __init create_domUs(void)
         if ( (max_init_domid + 1) >= DOMID_FIRST_RESERVED )
             panic("No more domain IDs available\n");
 
-        domid = domid_alloc(DOMID_INVALID);
+        domid = domid_alloc(DOMID_ANY);
         if ( domid == DOMID_INVALID )
             panic("Error allocating ID for domain %s\n", dt_node_name(node));
 
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 93738931c575..b969f5ada6cc 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -409,8 +409,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
 
     case XEN_DOMCTL_createdomain:
     {
-        /* NB: ID#0 is reserved, find the first suitable ID instead. */
-        domid_t domid = domid_alloc(op->domain ?: DOMID_INVALID);
+        domid_t domid = domid_alloc(op->domain);
 
         if ( domid == DOMID_INVALID )
         {
diff --git a/xen/common/domid.c b/xen/common/domid.c
index 2387ddb08300..b0258e477c1a 100644
--- a/xen/common/domid.c
+++ b/xen/common/domid.c
@@ -19,7 +19,7 @@ static DECLARE_BITMAP(domid_bitmap, DOMID_FIRST_RESERVED);
  * @param domid Domain ID hint:
  * - If an explicit domain ID is provided, verify its availability and use it
  *   if ID is not used;
- * - If DOMID_INVALID is provided, search [1..DOMID_FIRST_RESERVED-1] range,
+ * - If DOMID_ANY is provided, search [1..DOMID_FIRST_RESERVED-1] range,
  *   starting from the last used ID. Implementation guarantees that two
  *   consecutive calls will never return the same ID. ID#0 is reserved for
  *   the first boot domain (currently, dom0) and excluded from the allocation
@@ -31,6 +31,9 @@ domid_t domid_alloc(domid_t domid)
 {
     static domid_t domid_last;
 
+    if ( domid >= DOMID_FIRST_RESERVED && domid != DOMID_ANY )
+        return DOMID_INVALID;
+
     spin_lock(&domid_lock);
 
     /* Exact match. */
diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
index b12fd10e6315..f35a6f21f063 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -608,6 +608,13 @@ DEFINE_XEN_GUEST_HANDLE(mmuext_op_t);
 /* DOMID_INVALID is used to identify pages with unknown owner. */
 #define DOMID_INVALID        xen_mk_uint(0x7FF4)
 
+/*
+ * DOMID_ANY is used to signal no specific domain ID requested.
+ * Handler should pick a valid ID, or handle it as a broadcast value
+ * depending on the context.
+ */
+#define DOMID_ANY            xen_mk_uint(0x7FF5)
+
 /* Idle domain. */
 #define DOMID_IDLE           xen_mk_uint(0x7FFF)
 
-- 
2.53.0


