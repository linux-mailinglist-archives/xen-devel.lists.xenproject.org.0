Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDuSHraG/mnDsQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 09 May 2026 02:58:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6863D4FD27C
	for <lists+xen-devel@lfdr.de>; Sat, 09 May 2026 02:58:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1304387.1577427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLW0l-0005US-UL; Sat, 09 May 2026 00:57:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1304387.1577427; Sat, 09 May 2026 00:57:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLW0l-0005So-QU; Sat, 09 May 2026 00:57:43 +0000
Received: by outflank-mailman (input) for mailman id 1304387;
 Sat, 09 May 2026 00:57:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wLW0j-0005Sb-He
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 00:57:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLW0i-00BEJu-Uv
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 02:57:40 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 69fe8667-2eae-0a2a0a5409dd-0a2a450a9aaa-26
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2026 02:57:40 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 69fe8681-56b3-0a2a450a0019-94a38ff1fd30-3
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2026 02:57:38 +0200
Received: from pps.filterd (m0482515.ppops.net [127.0.0.1])
 by m0482515.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 648JUeao525438
 for <xen-devel@lists.xenproject.org>; Fri, 8 May 2026 17:57:37 -0700
Received: from co1pr03cu002.outbound.protection.outlook.com
 (mail-westus2azon11010024.outbound.protection.outlook.com [52.101.46.24])
 by m0482515.ppops.net (PPS) with ESMTPS id 4e1dexqgcm-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 17:57:36 -0700 (PDT)
Received: from SA1P222CA0036.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2d0::21)
 by DM4PR16MB5459.namprd16.prod.outlook.com (2603:10b6:8:185::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Sat, 9 May
 2026 00:57:31 +0000
Received: from SN1PEPF00036F41.namprd05.prod.outlook.com
 (2603:10b6:806:2d0:cafe::48) by SA1P222CA0036.outlook.office365.com
 (2603:10b6:806:2d0::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.20 via Frontend Transport; Sat,
 9 May 2026 00:57:31 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 SN1PEPF00036F41.mail.protection.outlook.com (10.167.248.25) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.8
 via Frontend Transport; Sat, 9 May 2026 00:57:31 +0000
Received: from pps.filterd (m0373460.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 648LwpRL2254113
 for <xen-devel@lists.xenproject.org>; Fri, 8 May 2026 20:57:30 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4e1j9d0t8g-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 20:57:30 -0400 (EDT)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id LW0VwCgLg8dSWLW0Ww0qPr; Sat, 09 May 2026 00:57:30 +0000
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
	:mime-version:subject:to; s=ppford; bh=uoMw8oYw+/re4inManVJEtjmN
	jWTs+EgvjkcXbZqY94=; b=V/PxcKPy0z9X+8GyMcekgtLTn1ypvpAnJvvdDx7G2
	TvtOYyL+DLjGO3HJP0cTFjnApR63oltz0SeHfmye2/7I3BubcLZTUJQ1p8JKAlmo
	rJl+C6mVBIodZzbAH9+hvdpezZMDmPfJ5Ex/X1dsjtMZIyXR22xiV0qOQqSa753F
	ZEWv88ZR8XW4PiGu/57mCjYSDAUtTuhLRLbrgIy8VP7mMqGr9NsE4Ax28RnBXWX9
	T+gN5dLWXibscYAYw/GmWZ91DCkygMwBMflbfkfrbZYXLm71xAUNT1ruab1YCz2+
	aRPZhpFH+nNuyMBJJTLHjYDaSJ7onNG0MTQfDwlJCPpgg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x2X2RQ8SAqTgkxXlv+QZWSVPIw9l5dE1kSNxSZugFJpAoIJYzzy8IGpKXOB1du+b4RJqN6d54NHqrwYw7UN3fR1bnhbW7IvnTf8fO8weD02RB3lhNAaPDzBtIdvVOzSKHxg/GRpYI7ntkLY3ajA0szLGA9mk3zF0TvyUactmgpJ/KaNE/GAetzv+I8LWFiiGvID4Xe9AI1EaXuEp4FiNxnfvYgLnVy9x7Ik2MkSWYBfDmsx/GL+eaLjoi3tBR9fbx535fDxu7S6P0cO74gmnMyO1T6eFgYM/zxBHsx6wIpLnujXTfnx8are4BLqW3minDujtkd69IOpeKYq7f1Wyug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uoMw8oYw+/re4inManVJEtjmNjWTs+EgvjkcXbZqY94=;
 b=UU3kZsavRDeO8cwtxCm0oQc2uAFQlRdSPkNs2w13n9rGXK6K93Hzmo22cXI7FzLVxRQ+kRVVom0ieQ4fCZhGABAs1Zu/YtplwQ8hsQwNkB6vWDZhfFhuqUjSQUAHvwNHxQj0iHi01PA7jCqwupEknpANEz+YQ4fHpwTg0YgH45sXs6d2T3KqlTcLU8DOpbFe/Ye0Uyvg7rPa46ce/Y1LtXw11pgIY2bq7gXPXnj0qIrz4QkRJJ6iTF/eJ+5KbajUjWvczLxqt1da2Ss+uvFCiAnZvFGSL+87eFlpQudngADYy1JRYscKctUPb79Cg1NsouXEfds0WnyLz3d6DduFqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uoMw8oYw+/re4inManVJEtjmNjWTs+EgvjkcXbZqY94=;
 b=IqdlY62b+EUwnE7ZoGbPHdt1lM0fwBL9vXtqnqDQh7X6yveHv2UBXjEBIBlfmlr8lU4D/wjDHMlY26RaN8I17tFBjYYwfp2naD929wWCMS3RzHdLVd8feBkHwYgD25CeP6LBskDBEbe4aRhGfo131b8oQ/QvVfoipQ1H37TAuY4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 205.220.161.53)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to; s=ppserprodsaar; bh=uoMw8oY
	w+/re4inManVJEtjmNjWTs+EgvjkcXbZqY94=; b=mKPB+s7VNs2iJwxfOcD1qu3
	BaYVtRmaXfhE4ag1e/mdyE+gxswRXwkCzLEvbhw9EMN4RnBFcQ3tdFk0HjoPQX7O
	ARwif9/YPDYsBNLOnJYAcbqeNJLoY/zhW0THiClgByUuQjO1HMvp4M6BGyGlmcTR
	vPcvj1Xoy2HtuqcvnncE1lXicFRz8pr0iINRvvBVKI4+XP6stbVdTUZlHDGnJkVL
	Zn0Fwh0wKZhJccOa3s4Qnd0T9IvGGs3ppzpqiV9xRGZOTRFhrJhhMsjZxpShE1mU
	z2wPYGJSYhn1odmPR+IJUUZIXnFd+42Gm1dyyWCjsg+FEj38aLr9mkHbICIVq7A=
	=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=ppfserpocford; bh=uoMw8oYw+/re4inManVJEtjmNjWTs+E
	gvjkcXbZqY94=; b=nnysrIQmcPVBmKVSZIZZ9AvFTKU5ULBFFpT9OjkScTTc9hD
	58gG+Ioxs4e8ckrySOR+Hns1c2kYsPwa2CAp09VO0j3NgvEzLtleSKoQP5hlRxCG
	p93kmdoFPt1bqxHdcPh6S0tEKteGGVC8GwKeMaSjUxmBStQMhjfm9Ma2564FbUtg
	WgtciWrs2HofgG7DfF3qFTKreQAsQtuIzeOvSoQ0BstTkf+jdfezZ3SyJYuV8ONw
	IxOD/x6xYpLU4A6egN1X3RCbVLd+sOAB9N/sgE1e3257slsqylmm9+7OijgjywUi
	MplTYolML9Ig4g3OAhKCBBwiETZa5MDrlV7qvjA==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: LW0VwCgLg8dSWLW0Ww0qPr
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v6 0/4] xen/console: configurable conring size
Date: Fri,  8 May 2026 17:57:10 -0700
Message-ID: <20260509005714.892018-1-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605090007
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F41:EE_|DM4PR16MB5459:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e79e94a1-fb6c-46ba-c612-08dead65f2fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|13003099007|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	3ZTDjxSFpUNHxK0Deud2leZtmLKZB7Z4YB5sFZZIFNZZuqfBqH+zdoUT5mAnlC+W3cvre7k/POGO9DRFwBuwd4GaHhrcxOiqgv5JePjS7VgweIEwh6TI0lzkz8Wunu229MaYX9vAwjcT7nMv0DKpL0kBGLaJNZbMu3PMgvRszFirXLfXSqGsZF9aAatrkOpGAiVjr3eI5lkl3rRGPkIZp0Ilvy+RopW1C2SZ5uu/KK3MYUTvN+ubYMOjCu+1G85P5iD7uTR0yVwA+qman+acQ6FIQBFRPTnaPWeRCryLDHHXECZ83x9EQuEXvdKMlnSPJf0t1rdggnyixsMd7SHZSZy7aRROsNzKjmpeEfF8RFslXAiMpjfAxOtToQreSPTwnfVOVbH0OribwgZ5xhEfMmo6biqHzI4hq5+XG8AGKNBLJsx04BUZQ1j3ul8VPQR3oCRhANSAXgCDK1CB3lMDq1QxuB1zJNONtPZBFipxnDrX18SHJmPmgCe//s13i/rNUx0Ff/CHdx7DnsNe1cnibEDfS95+0XQTVhbOips+ERkF6jZuelHtBWt4M8AzJziXm5tote4KwmIWIL6wB3Ee1GXhPdMnsyS5yThj1v5rRlgPdbZLeeKIkfor1hedXWlaGbODkKUho+QNLolUcpyPUK/pMtE8db94K4Pw9YLs/whE5FNMmE+gVL4FMwJ9FPYjfljRgj99jQknb6v6rxP3m4GkKK7qtU1BD5uNyviJRyZR0EuwfGva0v1S9sZf8NS1
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(13003099007)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+HQf4eO5mrWCcXJ0Rwr8jYKAlcmyNOfFkvtslPIkALGT9ai0KG235vp+nUiRHhotCHy//tSTOTivLbF3jHtQxCp1BNWQV3V15Y+bPXHQqAZNuXOkFl06eeuMzqr24p+dI7t7Txt1N4CKjqEqI1sFt2HKiVCawzqBWtUQk6D9K3ufK0oqh9jqNgS8XxHCH4xrjuZs0b4yoklRFQiG2WnQ8i0jLUioqjFhhjgwm3S++KRj3DdYmSX4yYGblhupY+7lyZ9n8AqUq/Z1YrNGYJ4Z7sqef8VHk7L17FvBhd724owmu6OBXXf6Et15l6Mb4h6eeZqfAMXVM8IBYwgtwdiFwu6vM3bHgga3DY2cmYkwxpJMuyDCVfEh9H9A5tF9uoJps+AOtXXLYVUTBnarDgCSBTLEDrqKaDOoWVOI3jDd/KsjIt6ju8+vjlWjrGgGEiNj
X-Exchange-RoutingPolicyChecked:
	jXoyGK91MtOmqX7ZCu5AYDOLh7XgiF72zX6QI96rNdZwgHv7nZv0q17mQG1Giyxj5XGJgwHTEHjp4mMf5J0Y2FwM/JSiTYjm1Lz4VkiACgPSzzPRtMk1Pyg3SlzWcr4EITry4t0wvVaQzly83K2/4+sibPNHiuiwSMiCoM48vdAlqinsDkBAuEZ/J4+e0itmUfpIvNbT0UMcL0KWuqeiZL0PMVAiZ0YgRciF0XtRXysO6ofAz+qJRdujzGiA6IhsHG5tm+1RYNLfxJHTsDrfgT0InL3KP/MvrQacrmjOX/J4dnQSOj0BlbJ74Sp/dYuYrhBLRRW4WIzmUCNwUajokw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	l3EtDdhlDJsYzDe2BOiHRTVQbv5saPwwFeHbViQYN9pT5iRWwljUlV2Fp96iW5XZQetfr2Q+3iogaZS7pHIrTXqJQ4JXCU70aiaBtVd8RkzzJhYgKo/Ul2N+0ygymWShe+tYOY5CCuHs8dPZVNpbjOiD/iQUTjX9aMcCTTxBWqNlYBzQk/DY9US3qzi0xro6PgiWI039aBjxUH4qksnSEtW889lsu2stEcaH+e2XuvICzry6OHtETNlZrkpq4KX/67bn4iZim3LJOoXkZZ3foKNBvP6PYKjkI9/F+1FdNHC4gVQhDXCPk53D80iI0rdFD1543eaNEf3Fuq3dO+oLD3eSisxCFwuNfRjeQBeU3GfqooqE9bBWzu15aVoS+UfN4t1HTY7R3438zgizODhN/nvdevIO8erK5QIMhBAPqv5AoiwZQnqnEVpx+e3xBXCR4Nrj1NBx1oEGzv2vxsZltRHiJ5eO5bJjtDmn/sSkeJsQFirG4fpxrGYTBjF8YuIcbpHsj4M1EOomf8nfhx5HCzlozE6my3yo8+tXeNXBPQ5o7TKUbhRYB5TB8XOgF7sZW5Qa3TADIE/Z4mDWhJsEcQR6Js5DekxEWbhbhsbwNDU1lN7OVU5U3mdy5WrcP5OG+/fmFGARmEoRC9GOrCSq5A==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 00:57:31.1521
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e79e94a1-fb6c-46ba-c612-08dead65f2fd
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F41.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR16MB5459
X-Authority-Analysis: v=2.4 cv=dLqWXuZb c=1 sm=1 tr=0 ts=69fe8681 cx=c_pps
 a=J0oTDZHsw5jmD/+vARdUUA==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=NGcC8JguVDcA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=0GA0A_IKJoUHBEAzNTkD:22 a=VwQbUJbxAAAA:8
 a=cbNQJ9GKAAAA:8 a=tHz9FfFoAAAA:8 a=p0WdMEafAAAA:8 a=9Tw_VFh0EWTJ7hsjlrQA:9
 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDAwNyBTYWx0ZWRfX4xryv+RYF5Js
 ovOFY+FAiFa1Cuuz9zOLATEke6O873DaUs1O4Ksj+6sK0Z1czxQvBaOVzg3s/zrHI+VRj48tc2m
 97zJppAGZD0RfDVO9aQnAZudwGDCx9MhyheRLK0pnWQFcVVgWrIQR9fimZlhaukWPk2yLjipZqw
 Mz/MYtfM/gLQBoaJDJexZTSje0JUEeNEaxgZk9kETWQG9mPcEWG3O4/ZB0OzmPuy4+xT7lii8dr
 g6ykUEgl5dFgwDT8bXegJv644Ieg7EdTP4le8c1zzzDC3SfLChN1dqHbR9PTYW653NSxX8ucysY
 zkfn1s4HkPNfWKn7VIpJDzhx+zDol1RJXgwyxnydEdzRdcF4gheP9buBfosUgyWC24WwO5a+9Zw
 MkbEAXMISgNM0LYqQockT1RNssd1/v+4dcMOEkiOVqhRpVG/qrVMaCi6n8hcWT7tG4wFFsaVrcS
 6Q3I8U+IuBgWovynzPA==
X-Proofpoint-ORIG-GUID: Z695j7cGBsMqida2ff6hOMAhCKmv3ytN
X-Proofpoint-GUID: Z695j7cGBsMqida2ff6hOMAhCKmv3ytN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605090007
X-purgate-ID: tlsNG-4011c0/1778288260-7FF798B7-7E208F0E/0/0
X-purgate-type: clean
X-purgate-size: 1157
X-Rspamd-Queue-Id: 6863D4FD27C
X-Rspamd-Server: lfdr
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
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_TWELVE(0.00)[16];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,ford.com:mid,ford.com:dkim]
X-Rspamd-Action: no action

Series introduces compile-time configurable conring size along
with few cleanups in conring management.

Patch 1 introduces CONRING_CONRING_SHIFT to select compile-time
conring buffer size.

Patch 2 updates conring{,_size} annotations to __ro_after_init as per [2].

Patch 3 optimizes switch from early conring to permanent conring.

Patch 4 update the conring buffer allocation code.

[1] Link to v6: https://lore.kernel.org/xen-devel/20260205013606.3384798-1-dmukhin@ford.com/
[2] https://lore.kernel.org/xen-devel/1a5ed8ad-0cc7-4e05-9b9c-cd6930d9b9ea@citrix.com
[3] Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2511597097

Denis Mukhin (4):
  xen/console: make console buffer size configurable
  xen/console: promote conring{,_size} to __ro_after_init
  xen/console: use memcpy() in console_init_ring()
  xen/console: switch conring runtime allocation to xvmalloc

 docs/misc/xen-command-line.pandoc |  5 +--
 xen/drivers/char/Kconfig          | 15 ++++++++
 xen/drivers/char/console.c        | 60 +++++++++++++++++++++++--------
 3 files changed, 63 insertions(+), 17 deletions(-)

-- 
2.54.0


