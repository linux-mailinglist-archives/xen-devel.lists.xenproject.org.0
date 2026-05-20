Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHtuEN4oDWo8twUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 05:22:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 649545872DA
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 05:22:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313510.1583622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPXUp-0005lY-9M; Wed, 20 May 2026 03:21:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313510.1583622; Wed, 20 May 2026 03:21:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPXUp-0005jG-5l; Wed, 20 May 2026 03:21:23 +0000
Received: by outflank-mailman (input) for mailman id 1313510;
 Wed, 20 May 2026 03:21:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wPXUn-0005j9-60
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 03:21:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPXUm-00E5GA-2c
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 05:21:20 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a0d2885-2eae-0a2a0a5409dd-0a2a450aa69c-40
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 05:21:19 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a0d28ad-56b3-0a2a450a0019-94a38ff152d6-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 05:21:18 +0200
Received: from pps.filterd (m0367128.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64K1ZPdI778971
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 03:21:16 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com
 (mail-eastusazon11011020.outbound.protection.outlook.com [52.101.52.20])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4e93e68gum-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 03:21:16 +0000 (GMT)
Received: from DS7P222CA0020.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::16) by
 DS5PPF87C293F87.namprd16.prod.outlook.com (2603:10b6:f:fc00::7d9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.17; Wed, 20 May
 2026 03:21:11 +0000
Received: from DS1PEPF00017095.namprd03.prod.outlook.com
 (2603:10b6:8:2e:cafe::6b) by DS7P222CA0020.outlook.office365.com
 (2603:10b6:8:2e::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Wed, 20
 May 2026 03:21:11 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 DS1PEPF00017095.mail.protection.outlook.com (10.167.17.138) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.11
 via Frontend Transport; Wed, 20 May 2026 03:21:10 +0000
Received: from pps.filterd (m0373460.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64K2bK022376315
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 23:21:09 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4e79ewuej5-2
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 23:21:09 -0400 (EDT)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id PXUYwV8MZxj2GPXUZwJnbV; Wed, 20 May 2026 03:21:08 +0000
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
	:references:subject:to; s=ppford; bh=ougHQYWlbhyrFg+BbYoKluHUxte
	kDVPtmi7BzvvH2c0=; b=ci+IfMAW8CQn7rvWCo1obe1SJPvM0kXakj8PAPDEVb3
	TgQrrYIvM+2sz/1Ottm6Et0w//OPgow1l/k45kGpvmRfHHdaTm4hcg/HP7gXc+Jz
	m7BexO0L/GPEhvGG63PcCnG9aUt2LgBmJ6AT7Dnjse+ZxOuWHUAIp5S1GvVGCX5t
	et1dTYFz27n6HGB50QBzsBMNuvK7+fHEPFKq2/Vnz++BmBQAvCsbX2tq2suNe2GU
	p2FQM3h9aopA3zTMl3pegXjtLzsq8sBAziQkHNUi8gJkTiYMWQ7X3Vg4jIUw43zA
	+QQ32KxGw2XgoikDteNnpyaFkaob6NFfSuI6nxqa5Ug==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gh+IfLPs63DBeUlz4xni67q6ncJ/Puwh0PNVdRKiq+yqXwxK8GDTl+UNoE8b0jZBZE5UYQUj5sVGymBqoZINkDHqU/oepR3YMdFGKybwwZvGYxbKLgSXnDcTWGBvdpQmiSYjs8XgZ1CFDGoEWI45JKs1D2IZsV9kHKpmwHbPSHhZMxMB6qKQhsDr7LhHCDUchPabT2K6voLEl6A2Csj4CD9FbvocWIYZvoHnvsuFtBZOZ2zfcoRxKTiDVCQKiLrV2E6Qo4tss3XppAkQQmGNb47lxdFnQ0LheqqO8dHwgI/e//A/Z1eK0/jW9vbk2OAOZe+nNYj7+4pDANULzvxfaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ougHQYWlbhyrFg+BbYoKluHUxtekDVPtmi7BzvvH2c0=;
 b=HtS5SU5ZFNqHM1mY0LGfz/G1UitFUcn5aGjg0qtCdPSqkFrlqAU6Z7TTZCVoMevNui55aK26RrVHpXjri3xxbhDlpWRr4SpTpzpJASbNA1ugD+B6/AXHnHLr8eCdhvIZkkq2SCvcXgwYRI+Ve6o0v3EAY/0eyheQr+x7MbJImf+NrS1g1H2fk6c9aFjvv9zMQDR2fv1Taz0Gn06pbYrLCoxVNjO7W6G795y2r2BpaWskBzI4tPXL2jrwiJmDfz12ydkpwYnbhf6Ag5rI3UPOHWqreunz3VlmCsF5A+4DDcpQS6K8CfjY02/54oOGIcIlNduKMrZ+pKAVLgC3cBqmeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ougHQYWlbhyrFg+BbYoKluHUxtekDVPtmi7BzvvH2c0=;
 b=dOtaTyxIbeBL0+7h7e/l3eWq+5we76p1bAvbAE2GIqsp8fapTj/xfL8OV/BAiB9pgAIn819agUF+LefUeu9XvyB4+K/SXe3MhgfSTEDz+UF41AoB9qTcMzqYtdsbkATNy4DORiSsTQO0uidhzfoBpLk+Cd8VBS5Ly60C6uPe8Ko=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 205.220.161.53)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppserprodsaar;
	 bh=ougHQYWlbhyrFg+BbYoKluHUxtekDVPtmi7BzvvH2c0=; b=lB3r6ZmkJuAF
	anZok4PfWVbIOn5yG5L6N+OZajuNKYqEprY40BOTgS128VWHaRAryqtFzkJmiC+j
	5yo0rWFHfgf+E/9d8wTRHjcEhplSHETYz9+5mFVMiUdT8akfTNUnff52PWA17/SX
	eNqJ0QYfuXRwch6ZV5IKALwh15aw6Oemmzr68zVS3QtYgzD/8k4/40+3ZkqJENFT
	BW/JJKRbZpIUUKRXPjtaanVDDxwAUn2PQZO4jKrAiLcd7hC9o4I0kR71t8gIdQ/t
	DFsOwCq65rt8wtsAipOe6+m6Ge8Yi193P1P88rF38qhoDqSVjmxheHmzeW2QxvCY
	y1xhw68SQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=ougHQYWlbhyrFg+BbYoK
	luHUxtekDVPtmi7BzvvH2c0=; b=Kyly4zjVF8/ZlHyjhU84qXLv88A/gNyufWzF
	e1EURFwukzCJCXxRTFJVph+Tz7HIRgm2jFRXfgagm0G5CPgVOBq1gLzes+VRua7X
	eUg6xkzeDtx7as5RVltcA4FxfB7XcrJBAnu+870qgtXve9jjMD+zylvAk+2KuJEi
	WrCv/A82kntolnvlTnHhXb/5AhL9cDjtSD7TBtjo6WfbJALPo2beDAZ05A9vCXSP
	YfHJp3NWiWN0OHKLG23g84GzNyw2PFQVshVV/pq0evSZa5eZBTKafojdOZP9SHkW
	R65kl0Nmyr7aBS5n129C6/Zxn7VdCWcHFCdCr3uwgPAWZhl5Qg==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: PXUYwV8MZxj2GPXUZwJnbV
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Tue, 19 May 2026 20:21:06 -0700
To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
        Anthony PERARD <anthony.perard@vates.tech>,
        Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
        Julien Grall <julien@xen.org>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 3/5] pci: Use pci_sbdf_t in pci_device_detect()
Message-ID: <ag0oovFrGircUaut@kraken>
References: <cover.1779116255.git.teddy.astie@vates.tech>
 <1779117762.8631fc262581453bbf619ec5b2062170.19e3baea7d1000f373@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1779117762.8631fc262581453bbf619ec5b2062170.19e3baea7d1000f373@vates.tech>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200030
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017095:EE_|DS5PPF87C293F87:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c0d1253-f171-4491-9553-08deb61ed6d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|3023799007|18002099003|22082099003|4143699003|13003099007|11063799006|56012099003;
X-Microsoft-Antispam-Message-Info:
	OBdZJYt7rg54qNWLJeB5U3dpGUsT0hzmb6oyk6q2zzO4N2jKobyzaeJxSguQDBhjtBMtBQSnwLGF2ypVkqROx/87jvKC40XGOPnYqFeymC8uielsysimX5w8hQ7UHSs6E+VxhSoJ/UGK//P10E34w5AxynxQg3hCCij+X8FM05skqiPmBIrsDnoICLMovgY3+dkOpf+gIgK1Dz3Wmk0zFOg0TQEdiCzEaausIbqy8IIZR1jeIXLnpf9E7l7VGRR+iVEiYX6Axnm70Z0W9AqBbz/vhSLzqOSZRVVY7Xen5/470H8UU2DNPbDRsoAR2xJAXNpaBmhxfBJ0WOxc2UsSr7m8UHqEsGJ8JoDtFUnvTowPS5l6eXX7qZjEUnroeWbZdvBPYKXfD9ecIEvEj2LVmQSEiJq17qQb9lUrDz8DBLd86qenm1DWzkWwAeuoXSr8I1m+OYLgvYby+fNlpk4lmLjJf8iCm+5utr9WJ7siqWpuXegT4FsvkWlh4TNGxe65QHHl50+g2wvso/fPmGeVKQJ5Z7ofW9rz7z/aGBhtmlh/0fSxIo+uW++9pb5wHyuyzalM5d0tTnmTg5V56XGtcNupJVMXXxmddbn+iDtyn+9qV0eYgOVmqAebuaKLiUP7BWkhDczlNCybADjyJNBvnLpj5ZFqdVdmMlPt9OK0cvFDamCwxFYSt7qacWvQ8Epz
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(3023799007)(18002099003)(22082099003)(4143699003)(13003099007)(11063799006)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fPY8JgSm6KoUOZ6iLUcQPbpzUssDUcUofMNkpwckpRVb22jwzAbckgIctdgaNQbCg5mgtvS2m7Agrf0T3nsVnFws4H4xByyzm6ilBw0q/fHabySL0M4zmdo2myKPcNpySm8uVuGlfFT9W9+IjFK8/udFFVLfFWHYo1bENJnJZQm23hsxga0LILgI8HXvnRpZBL1zyyD6TXUTNJccI2XNcHtGMu4PGyIROSGs3XCu+9hPYLK8GjUjLoI5RdpCWl/KNFE9ea4wUAxrpIJXXCmJVeeg926PeO/Kh/F7YnqUXb74HdLhiXOpHaBW57JY0PycN7z9p9dhQy0DoHYp0rZSZudwBXmaX0qsTRKh+TdJTEWEPc7j6wCZYNH5S8W54EQbOZs3c0b68yIoJbqey9P2xNnx0T1Mhfj/rwA/DY9trLqiqQWR23RbOZqvmTmb48nT
X-Exchange-RoutingPolicyChecked:
	bs1Om16I3/r3CQIaXOouJv4XX04ne9pM2sqX4LLnx4QdY4UUJWrd/v1VhhMLGOT7o9J64cWDrgUFyfb4NrcUS7Ye7DwisomXtafL3dRZizEnu4doEpsf88sW9n2j8wWB35WIRsaikhtmy903i/RwXhaIzEf54iOneNEo4RZQV0M374/blgnzRtazl3XVq0eGlR8/ZJNUnSL0h6DuWvQp4sAvWvTzBtw9U1K0og/tRLDdhVmGvt647vkxisQBqyQz/cbvwVXAmiqGNlOsw2e1VxgDBisrJdDiv9rDsfku5hGeEbdTgK/jk9oYJew33EQmLHludTib2xFRoFK0amKyZA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IdFwMTRg1teuzCwwBWatyvvwvXbkDXCvJB1NrBoYxH3rOZj9Hk9NvqDX9RZcVRVcqe82h8jbAB8WGI8VnvtITQSTQ2b/IQABFF5LhuDyYNsNjOaegn529FoQBxlDNhG9e9mDaZDl6E78U7GYdWs709moX6aYPX+lxnCXRReON717VpQdWWiIUeS1sY3BUeIocBEJXohs1GTVWJhLB/GrfkPo4ZjJ3YbwMwikjlgaoEn/YUstpAKhmnW5I+u8JXedzP9V7ebsELK/MXBHCbErjr3NL7h9yizMYVPMbLxKzaSSqULuY5IWtHVRlSfhyySBEuA7AlaViwJNWm/2NKkMUrCAg526Pthn+ks1LpsLkxuviQrXdYDXjMQsZzQG4MfDPnWAOSZjAQYoJL+Smm+SuzzkTQ1HBo9ECWISpLm1UfZ8PwzgS6cElWpxfvPVddQXcRA1QaLyntDdiKM1cqUCV1vT7/Fti4aC876V8myk5XZ+EGIBS0nw/OxaYVsKx9HJMFlKC8MH/5fSOFba434WhcdE2AADDYuqVq6HUQcIM7avJWkW6SPPejVszKFkmXDcRBwNP6Wd1TB2jzf7cfGqvigjFx3Pjr9XaV2bqWs4lcThvzcVK/y/DuDmiVSbcwdY4GzNg6wlU6mXfM0SQc9Bmw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 03:21:10.0757
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c0d1253-f171-4491-9553-08deb61ed6d0
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF87C293F87
X-Authority-Analysis: v=2.4 cv=NKLlPU6g c=1 sm=1 tr=0 ts=6a0d28ac cx=c_pps
 a=x0D8RYL8GqfJKF6oaN0fjw==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=WER9OelvoqQQjwJToBYG:22
 a=-RI0ju8yAAAA:8 a=V9oHlWqBRc9fk6rsD3wA:9 a=CjuIK1q_8ugA:10
 a=DqJYxgmhk6moR-_7_KoZ:22 a=UsJdYLK5l2RqpxBViBoK:22
X-Proofpoint-ORIG-GUID: h7PKsS6EqIVuVHCW7htr-cfVR3Jd4ABi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDAzMCBTYWx0ZWRfXx61eWAMktJDn
 LUAHhYSJj4gUqg7wmi6l/cIFVUIkeckGXA1l2Zc+/Mueub+PgRTidk+JGg+hS4eysXrbd37uo06
 7IL6E/CgQfWa9rpGzldj9MY8GNOS4tb8QtKVagx+h6+EBxWpM/5P9m7Mfv06IYf2VJVrh39M8xi
 uFn6xsgf3VTdgYCvV6DP+FI8JEdjP9kd2TVj98NtJj5RZHIrzO/3MTKCZ3i9Cd9D5bG7MRM9vdJ
 eME5IaohZWVZrwrNv4fYXsRQLhVnaqnf+3kYrhsJLk07Da0fJ9HfOM6zGKIrY4q8XRHSbyv4W34
 sM3S64v5b68hPS3wjl8lsrRb51+pASLk5iKehIu0FHZB6hMlesxHChyMzeuC5/gbIYs6NSBRMmB
 4YQ77Lw9Zjy8E/c5blrEeFFwQxOVIH4EX1HHuh5XKLjxek2G4vv0XB/0PVpmne6iojsXWHAYeHB
 /dv/eqOWnFctCUHK7eg==
X-Proofpoint-GUID: h7PKsS6EqIVuVHCW7htr-cfVR3Jd4ABi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200030
X-purgate-ID: tlsNG-4011c0/1779247279-70F618B7-A5B10A0C/0/0
X-purgate-type: clean
X-purgate-size: 10974
X-Spamd-Result: default: False [-1.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FROM_NO_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[azureford.onmicrosoft.com:dkim,vates.tech:url,vates.tech:email,ford.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo]
X-Rspamd-Queue-Id: 649545872DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 05:21:27PM +0200, Teddy Astie wrote:
> Use a single pci_sbdf_t instead of each of its part as individual parameters.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
>  xen/drivers/char/ehci-dbgp.c       | 35 ++++++++++++++----------------
>  xen/drivers/passthrough/pci.c      | 16 +++++++-------
>  xen/drivers/passthrough/vtd/dmar.c | 33 +++++++++++-----------------
>  xen/include/xen/pci.h              |  2 +-
>  4 files changed, 38 insertions(+), 48 deletions(-)
> 
> diff --git a/xen/drivers/char/ehci-dbgp.c b/xen/drivers/char/ehci-dbgp.c
> index a5c79f56fc..39a047eb3f 100644
> --- a/xen/drivers/char/ehci-dbgp.c
> +++ b/xen/drivers/char/ehci-dbgp.c
> @@ -681,16 +681,14 @@ static int dbgp_control_msg(struct ehci_dbgp *dbgp, unsigned int devnum,
>      return ret;
>  }
>  
> -static unsigned int __init __find_dbgp(u8 bus, u8 slot, u8 func)
> +static unsigned int __init __find_dbgp(pci_sbdf_t sbdf)
>  {
> -    uint32_t class = pci_conf_read32(PCI_SBDF(0, bus, slot, func),
> -                                     PCI_CLASS_REVISION);
> +    uint32_t class = pci_conf_read32(sbdf, PCI_CLASS_REVISION);
>  
>      if ( (class >> 8) != PCI_CLASS_SERIAL_USB_EHCI )
>          return 0;
>  
> -    return pci_find_cap_offset(PCI_SBDF(0, bus, slot, func),
> -                               PCI_CAP_ID_EHCI_DEBUG);
> +    return pci_find_cap_offset(sbdf, PCI_CAP_ID_EHCI_DEBUG);
>  }
>  
>  static unsigned int __init find_dbgp(struct ehci_dbgp *dbgp,
> @@ -704,20 +702,20 @@ static unsigned int __init find_dbgp(struct ehci_dbgp *dbgp,
>          {
>              for ( func = 0; func < 8; func++ )
>              {
> +                pci_sbdf_t sbdf = PCI_SBDF(0, bus, slot, func);
>                  unsigned int cap;
>  
> -                if ( !pci_device_detect(0, bus, slot, func) )
> +                if ( !pci_device_detect(sbdf) )
>                  {
>                      if ( !func )
>                          break;
>                      continue;
>                  }
>  
> -                cap = __find_dbgp(bus, slot, func);
> +                cap = __find_dbgp(sbdf);
>                  if ( !cap || ehci_num-- )
>                  {
> -                    if ( !func && !(pci_conf_read8(PCI_SBDF(0, bus, slot, func),
> -                                                   PCI_HEADER_TYPE) & 0x80) )
> +                    if ( !func && !(pci_conf_read8(sbdf, PCI_HEADER_TYPE) & 0x80) )
>                          break;
>                      continue;
>                  }
> @@ -1510,25 +1508,24 @@ void __init ehci_dbgp_init(void)
>      }
>      else if ( strncmp(opt_dbgp + 4, "@pci", 4) == 0 )
>      {
> -        unsigned int bus, slot, func;
> -
> -        e = parse_pci(opt_dbgp + 8, NULL, &bus, &slot, &func);
> +        pci_sbdf_t sbdf = PCI_SBDF(0, 0, 0, 0);
> +        
> +        e = parse_pci_sbdf(opt_dbgp + 8, &sbdf);

The original logic was ignoring PCI segment, now the full PCI address
is allowed.

Looks like
  docs/misc/xen-command-line.pandoc
needs update; but the documentation also says that debug port should be
in PCI segment 0...

>          if ( !e || *e )
>              return;
>  
> -        dbgp->bus = bus;
> -        dbgp->slot = slot;
> -        dbgp->func = func;
> +        dbgp->bus = sbdf.bus;
> +        dbgp->slot = sbdf.dev;
> +        dbgp->func = sbdf.fn;
>  
> -        if ( !pci_device_detect(0, bus, slot, func) )
> +        if ( !pci_device_detect(sbdf) )
>              return;
>  
> -        dbgp->cap = __find_dbgp(bus, slot, func);
> +        dbgp->cap = __find_dbgp(sbdf);
>          if ( !dbgp->cap )
>              return;
>  
> -        dbgp_printk("Using EHCI debug port on %02x:%02x.%u\n",
> -                    bus, slot, func);
> +        dbgp_printk("Using EHCI debug port on %pp\n", &sbdf);
>      }
>      else
>          return;
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 464bb0fee4..7b2898bd5a 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -1166,11 +1166,11 @@ out:
>      return ret;
>  }
>  
> -bool __init pci_device_detect(u16 seg, u8 bus, u8 dev, u8 func)
> +bool __init pci_device_detect(pci_sbdf_t sbdf)
>  {
>      u32 vendor;
>  
> -    vendor = pci_conf_read32(PCI_SBDF(seg, bus, dev, func), PCI_VENDOR_ID);
> +    vendor = pci_conf_read32(sbdf, PCI_VENDOR_ID);
>      /* some broken boards return 0 or ~0 if a slot is empty: */
>      if ( (vendor == 0xffffffffU) || (vendor == 0x00000000U) ||
>           (vendor == 0x0000ffffU) || (vendor == 0xffff0000U) )
> @@ -1221,24 +1221,24 @@ static int __init cf_check _scan_pci_devices(struct pci_seg *pseg, void *arg)
>          {
>              for ( func = 0; func < 8; func++ )
>              {
> -                if ( !pci_device_detect(pseg->nr, bus, dev, func) )
> +                pci_sbdf_t sbdf = PCI_SBDF(pseg->nr, bus, dev, func);
> +
> +                if ( !pci_device_detect(sbdf) )
>                  {
>                      if ( !func )
>                          break;
>                      continue;
>                  }
>  
> -                pdev = alloc_pdev(pseg, bus, PCI_DEVFN(dev, func));
> +                pdev = alloc_pdev(pseg, bus, sbdf.devfn);
>                  if ( !pdev )
>                  {
>                      printk(XENLOG_WARNING "%pp: alloc_pdev failed\n",
> -                           &PCI_SBDF(pseg->nr, bus, dev, func));
> +                           &sbdf);
>                      return -ENOMEM;
>                  }
>  
> -                if ( !func && !(pci_conf_read8(PCI_SBDF(pseg->nr, bus, dev,
> -                                                        func),
> -                                               PCI_HEADER_TYPE) & 0x80) )
> +                if ( !func && !(pci_conf_read8(sbdf, PCI_HEADER_TYPE) & 0x80) )
>                      break;
>              }
>          }
> diff --git a/xen/drivers/passthrough/vtd/dmar.c b/xen/drivers/passthrough/vtd/dmar.c
> index c36f4bbd7b..9f9b639eba 100644
> --- a/xen/drivers/passthrough/vtd/dmar.c
> +++ b/xen/drivers/passthrough/vtd/dmar.c
> @@ -382,7 +382,7 @@ static int __init acpi_parse_dev_scope(
>              if ( iommu_verbose )
>                  printk(VTDPREFIX " endpoint: %pp\n", &dev_sbdf);
>  
> -            if ( drhd && pci_device_detect(seg, dev_sbdf.bus, dev_sbdf.dev, dev_sbdf.fn) )
> +            if ( drhd && pci_device_detect(dev_sbdf) )
>              {
>                  if ( pci_conf_read8(dev_sbdf,
>                                      PCI_CLASS_DEVICE + 1) != 0x03
> @@ -505,7 +505,6 @@ acpi_parse_one_drhd(struct acpi_dmar_header *header)
>          acpi_register_drhd_unit(dmaru);
>      else
>      {
> -        u8 b, d, f;
>          unsigned int i = 0;
>          union {
>              const void *raw;
> @@ -519,18 +518,16 @@ acpi_parse_one_drhd(struct acpi_dmar_header *header)
>          for ( p.raw = dev_scope_start; i < dmaru->scope.devices_cnt;
>                i++, p.raw += p.scope->length )
>          {
> +            pci_sbdf_t sbdf = PCI_SBDF(drhd->segment, dmaru->scope.devices[i]);
> +
>              if ( p.scope->entry_type == ACPI_DMAR_SCOPE_TYPE_IOAPIC ||
>                   p.scope->entry_type == ACPI_DMAR_SCOPE_TYPE_HPET )
>                  continue;
>  
> -            b = PCI_BUS(dmaru->scope.devices[i]);
> -            d = PCI_SLOT(dmaru->scope.devices[i]);
> -            f = PCI_FUNC(dmaru->scope.devices[i]);
> -
> -            if ( !pci_device_detect(drhd->segment, b, d, f) )
> +            if ( !pci_device_detect(sbdf) )
>                  printk(XENLOG_WARNING VTDPREFIX
>                         " Non-existent device (%pp) in this DRHD's scope!\n",
> -                       &PCI_SBDF(drhd->segment, b, d, f));
> +                       &sbdf);
>          }
>  
>          acpi_register_drhd_unit(dmaru);
> @@ -559,17 +556,14 @@ static int __init register_one_rmrr(struct acpi_rmrr_unit *rmrru)
>  
>      for ( ; i < rmrru->scope.devices_cnt; i++ )
>      {
> -        u8 b = PCI_BUS(rmrru->scope.devices[i]);
> -        u8 d = PCI_SLOT(rmrru->scope.devices[i]);
> -        u8 f = PCI_FUNC(rmrru->scope.devices[i]);
> +        pci_sbdf_t sbdf = PCI_SBDF(rmrru->segment, rmrru->scope.devices[i]);
>  
> -        if ( pci_device_detect(rmrru->segment, b, d, f) == 0 )
> +        if ( pci_device_detect(sbdf) == 0 )
>          {
>              dprintk(XENLOG_WARNING VTDPREFIX,
>                      " Non-existent device (%pp) is reported"
>                      " in RMRR [%"PRIx64", %"PRIx64"]'s scope!\n",
> -                    &PCI_SBDF(rmrru->segment, b, d, f),
> -                    rmrru->base_address, rmrru->end_address);
> +                    &sbdf, rmrru->base_address, rmrru->end_address);
>              ignore = true;
>          }
>          else
> @@ -753,15 +747,13 @@ static int __init register_one_satc(struct acpi_satc_unit *satcu)
>  
>      for ( ; i < satcu->scope.devices_cnt; i++ )
>      {
> -        uint8_t b = PCI_BUS(satcu->scope.devices[i]);
> -        uint8_t d = PCI_SLOT(satcu->scope.devices[i]);
> -        uint8_t f = PCI_FUNC(satcu->scope.devices[i]);
> +        pci_sbdf_t sbdf = PCI_SBDF(satcu->segment, satcu->scope.devices[i]);
>  
> -        if ( !pci_device_detect(satcu->segment, b, d, f) )
> +        if ( !pci_device_detect(sbdf) )
>          {
>              dprintk(XENLOG_WARNING VTDPREFIX,
>                      " Non-existent device (%pp) is reported in SATC scope!\n",
> -                    &PCI_SBDF(satcu->segment, b, d, f));
> +                    &sbdf);
>              ignore = true;
>          }
>          else
> @@ -1184,8 +1176,9 @@ int cf_check intel_iommu_get_reserved_device_memory(
>  static int __init cf_check parse_rmrr_param(const char *str)
>  {
>      const char *s = str, *cur, *stmp;
> -    unsigned int seg, bus, dev, func, dev_count;
> +    unsigned int dev_count;
>      unsigned long start, end;
> +    pci_sbdf_t sbdf;
>  
>      do {
>          if ( nr_rmrr >= MAX_USER_RMRR )
> diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
> index 7bfc59cd75..d816dcad05 100644
> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -218,7 +218,7 @@ static always_inline bool pcidevs_trylock(void)
>  #endif
>  
>  bool pci_known_segment(u16 seg);
> -bool pci_device_detect(u16 seg, u8 bus, u8 dev, u8 func);
> +bool pci_device_detect(pci_sbdf_t sbdf);
>  int scan_pci_devices(void);
>  enum pdev_type pdev_type(u16 seg, u8 bus, u8 devfn);
>  int find_upstream_bridge(u16 seg, u8 *bus, u8 *devfn, u8 *secbus);
> -- 
> 2.52.0
> 
> 
> 
> --
> Teddy Astie | Vates XCP-ng Developer
> 
> XCP-ng & Xen Orchestra - Vates solutions
> 
> web: https://vates.tech

