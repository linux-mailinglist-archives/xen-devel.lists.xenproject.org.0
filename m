Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NWqIbaG/mnDsQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 09 May 2026 02:58:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E29D4FD27E
	for <lists+xen-devel@lfdr.de>; Sat, 09 May 2026 02:58:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1304391.1577461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLW0s-0006G8-93; Sat, 09 May 2026 00:57:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1304391.1577461; Sat, 09 May 2026 00:57:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLW0s-0006Cy-3n; Sat, 09 May 2026 00:57:50 +0000
Received: by outflank-mailman (input) for mailman id 1304391;
 Sat, 09 May 2026 00:57:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wLW0q-00067L-GZ
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 00:57:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLW0p-00BEJu-TW
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 02:57:47 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 69fe8632-2eae-0a2a0a5409dd-0a2a4502b864-36
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2026 02:57:47 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 69fe868a-af86-0a2a45020019-94a3921705c2-3
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2026 02:57:47 +0200
Received: from pps.filterd (m0367126.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 648JTV4G704841
 for <xen-devel@lists.xenproject.org>; Sat, 9 May 2026 00:57:45 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com
 (mail-westusazon11012066.outbound.protection.outlook.com [52.101.43.66])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4e1fcnpf6h-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2026 00:57:45 +0000 (GMT)
Received: from CH0PR04CA0098.namprd04.prod.outlook.com (2603:10b6:610:75::13)
 by PH0PR16MB7135.namprd16.prod.outlook.com (2603:10b6:510:38d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Sat, 9 May
 2026 00:57:43 +0000
Received: from CH3PEPF00000010.namprd04.prod.outlook.com
 (2603:10b6:610:75:cafe::d2) by CH0PR04CA0098.outlook.office365.com
 (2603:10b6:610:75::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.19 via Frontend Transport; Sat,
 9 May 2026 00:57:42 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 CH3PEPF00000010.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.8
 via Frontend Transport; Sat, 9 May 2026 00:57:42 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 648LDDXW4098353
 for <xen-devel@lists.xenproject.org>; Fri, 8 May 2026 20:57:41 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4dyxwd48n7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 20:57:41 -0400 (EDT)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id LW0gwpjXNMM0lLW0hwt9Ul; Sat, 09 May 2026 00:57:40 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=QYm
	8EAry6WG8/+zkqrDQqEF0fU/zew7ZJhkCv6bfAns=; b=JkxXdL369QbapykPgYI
	EgQXFGYOYeiOqooneYfQXwmTQh5SD3KbpScly2l3OH7gx7+Mm0KJy98PI6d5YhcH
	PO2Z5KOY6ZxTV5tXzHpXpIZMUj6sBDVCMOYWm1UoR7Iw/qjuOQZ34l1yop2rA3mb
	nLoixTCY3PMQAHfHERI9Yt2KRfKNBAFmtrsR+QOa/sMJN4XE9QTcBZCG8S1R6wcx
	/oSW0Wj7tI9SPMG+hLvTV5f3iWMYeziwGrRN3pORZcLF7YPNGPHL8LgP2a76V4F8
	EuOBbOF4tmgeHpwbi+jWuJG3BHpaFvPI1CrQNvQpmgoX20oDK25Tz+oaO1T4/jVL
	Qlw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xBah3hE6FUezzwxApmOYVTnuPz+RAapmDqurdg7guGv9q1ljDEM7DuC1eAQBuvRehoQzRbgqR2gBbOmEG+FdkBfr7bNp3bTOH+UyxFShZCMWL6Z98CwM5SRwoM/w2j+8zi9iViGDxYxv479zDcdjCSjXOxERTdOMdlodMUTdQw6JZSsSK47UPYeYYo7gOzdECFnFwmvRiuICUVjIQazF+52bhUvfQpMKq36KHV2SLGp48TD5T1/ODVzWBZYPiIHrCYyTGK7DoXvW34XbYPW0a2ZGwun9QiN3R/Bbrf4PKc1Ohl9oQ9tAdzxrw4SB3b3z+i6iR0jTNim1S3z1hKgS6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QYm8EAry6WG8/+zkqrDQqEF0fU/zew7ZJhkCv6bfAns=;
 b=Ip4d7rn6W86+SgtfK2XYX0MaFjgx9WafG6aewBPdnCboG9Ft3TWKxYON/tQJE0E/YHaEfBkjAd7cVxyVSIYLMQBJLIHQqoRMNONfrPVaE/Y8iVK3wzMoMA9SPuZlJrD7vKSXlf1lQ4Xz0m5rtAN1SHXNU4Sjebo/kVGVnOCfu42dFr5U7l3t+1mnWgkUNOI4tM4uMJWjQAQGCHafqAopbf2PpPLfGet7mk9fgpMfRvWKDm99mCnaurYv43CNxI+XruSSVa88HAtXgyj69UZBsKiD+0esme4BbsJpWTdDo/gtN6cTgCSDdD/QYaVsvsCNxec/HdPyrWINbWDn50WkFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QYm8EAry6WG8/+zkqrDQqEF0fU/zew7ZJhkCv6bfAns=;
 b=fi6LUty4rlMszp3AX9pZhWtM4OFYn5R/gsds9HCbMqgWx2kqXeYTCpQbTlqA7QTCvsXoZGCLm1aCm7Hg8zrpbJJvEZCpLZ/GfsNHL4KTuWOEjBB/P8T+0tPddr4d46zOJd/sVH6/aDPm0/F+wCC5rmOO8s8IcfXfnsy21rKjIZM=
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
	ppserprodsaar; bh=QYm8EAry6WG8/+zkqrDQqEF0fU/zew7ZJhkCv6bfAns=; b=
	M+vRX2TGSfVAPnRwwFTTj0/CHBAyVBK2+v20/YVppuGyj6ZuGh0en/EmeApM8DM2
	sIJsGmGgVkEJyifplO7Cohho1SywdQ4z2lQREv+59U5GSf+84cKfyuqE2HWwgMnd
	eG+1ayBpY+hvvVTR6bLo9p03/nl4VRnuqe51T+bAzB2krrdjxASdGDAg3at/X9Sl
	+D7rRSgwVNXdeU9RfhnXob1pxWpXAazCmhZoQLmVczbLQXKclZwFZ3KE/l8qCqmy
	D/GvEqfVDj4GHnaKUcYjoKYhRuKL4bgffJuDs6RpnnxBWMFnaQIc4JU6xTcMqlMV
	7ESb0OXGMdtMdW0Op7tiWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=QYm8EAr
	y6WG8/+zkqrDQqEF0fU/zew7ZJhkCv6bfAns=; b=HBNRMUXU7oTUF4iVnThgCYg
	wzbwkxQouy8MvOnJYVaU+hXCbhr7B6HSGV6FUKrRXCaVJGkkeeTjKxRZIDJfYTiA
	s0x96pOj9vUFQJUMy7IgcNENwLOuTFGakw+TjFeqchu3bw/qbAH8R0XZM8r0jMWo
	KKTFXiXxamvwuy2P/rjMcHdBOw2n5/i8ATtywOiLEWOJrlXnIlX9zTKKhrQ8I6uG
	rwHhqXgtmhQlUuaYXeosHnaA744hHBlzaJZt6c8Hav45uAK4gDVdOC90pQauiJ42
	eOIesgZfEtcHM0Bw7KWqhuCWg+d++T+QuTUZmllsi+H7/9XUeTPJIH2qQGoXzFw=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: LW0gwpjXNMM0lLW0hwt9Ul
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v6 4/4] xen/console: switch conring runtime allocation to xvmalloc
Date: Fri,  8 May 2026 17:57:14 -0700
Message-ID: <20260509005714.892018-5-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260509005714.892018-1-dmukhin@ford.com>
References: <20260509005714.892018-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605090007
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000010:EE_|PH0PR16MB7135:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 98321d86-240d-43cc-06f8-08dead65f997
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|3023799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NXu5i1Bpbi+l6apB3xZ68UcMIoU+WIvXjuwwonEDtUGahOaqsDXkZ5BwKs+eqxBr0E2KPOsEq7RJWq4OGoEsSZfiX0jKqAFn0CsfsC5JsstwIlyJJ0oJCyATUzz5kB/lxp8wWkGtYwYaLOw/eODAS4uPtbIT7bDRA4or7ZZHmpCeGs5X7dm6/vblY9u1zHNAh55OpNdalMcjGfd2wlJLoh1bhH6DTYmO4DtDvp2h1woxULtE2lT1oLBIdpQHKfaaI5HswwcSwlJaGTdJyL4o+94Pat5gvpIN9CEGCWBr8LCopXAhsGt/RidH/Kf95cn0KAPfqjESueBE41I307Pcq6QK5fv3SfYhauJvPnjx9dGB+53oaj8U/shXG2Lh10iFdOyppNkOl4YVmDs4Pf5CDk/tMX9WbSUG1F2ykvYpfFBX0oOmJQdQlQ3czYd21QjMcbOnKjLn/DcLlQZGMXizzh+e3r4HYeVGSxausItvVhjz3zoUsb/tin63SCwX3AzDBASAv5qdL+hwAt9cSecVB/OrHldVSEA2PlbJUtXi96qw5J5N35k22Af1YC07vtImnV8uQ8aKnt1mLJbfvFk0UVLItgb+8gEZHmwhRyin7x1fUwzIW8b7lsT4TdQZE/t3TaL+sDtnblXR7OlZRTYSbPjP2NKZloSXyMFIFEtQ/VfKdju3CPw2qSx+l6vQxQSf7Eblql9wkhQMSAvJZF7qmsubpPQhTtyRWXQUpNpwfOo=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(3023799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cvBLFj5q763Z+5bOkodq9O/DuEeq3T33pzBAqARFKowiRJR2SEt2m4JUgcNyB1bme0icuztDAmlldZkqlfjlmsA28X91uPIFQH0q9KGBCLDKJBaruPNY1ad8TX4j0QHhVCdBN8D0b/mFCscP3lMAIiEdOdZrtF3fNJtYBDmuTb2mCQ2GuRYLBY2/z4ttWFldtNzKd6uq9JYpWb/xS+eSF59dyIhjyIfDcnVAI9vKpJbRXvA5RTSXf132tcrI4Sv4SYfMetsbVH25wqiM9TRQV1TVVmuN2jMWA0UgYlVXpvXfoyWuSnM9TAtRi3Nr2L12kJa5pT5k1uaiVcjx846hJUVYNOodlPuppGfTqPXl1rCz3Tx3SlmGjOVAScTM6zVo8GbtmEiK5mwuSqIDItFc2FRuCuOAhqDV0btqwTxMe7QfGBHzRMhxaBQ3jRpXDbQ7
X-Exchange-RoutingPolicyChecked:
	aMg45yWi5xhD/LI/LrsR4RcWj4byK04ELBpPrownMWXD9/KFAkixEYuEWL3HyLSCItt3eDxK8ZcD2IM268AsqxH9bxtcPgbT6SHp7h+yVbiQ4+EjGkNZSvQTgayHPlCdtrLbqLP5QoZTcfViKZ86slNJXdgICdiWCrLvVE8nwYgWv5xm1p7D2UGm0m7rZGRTSEHeeVHRa9XLIqcEg7pyuRZW/cugjgYL/d0UAzPv/y7Qd/J3AXSLWRT1o8wgqg9dXAJxaEmaeuCiIeBezefbD3R6A5sVg+OOpi8bxD3mDccyw9M6gEKbKDHNp1y31lSEGIevTymzxDmBzRS6WzlETw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fDt0TKX7+G225770N5T6DD/c3xWGBJ5xADTiLpe66243PFL8tF+fvipscyt4WbwJU31tYcbyqKYD6X0W3V8Vlv27rU4g1bOwBXIT3bB/vo868I6yViOaiwGa3qWX60yT4zYYjvb+imVUjAg4fVt7AY5LekY8peGjnHauFUQaAMDE7wINtDTCLVfgACA61UzABDyEKk5wHp3T0noRt/v6vXyZ7X3lcZN/nQZCo7pGsNxhuxQn2KOqfY7ndbScQaiPLbZ9dL0H9kYQUixdEPJ1d4DXDnxDDD31UGSa888TwMkOsfQ1R/DERY+1UyXsB9IghCAoeBHi3nkGVSAl37HBT82c5yNvIaRfQiV9aH2doy7FX7zbtMoxyGrjfljFEh09YOjFp2fvGaJjcrL9LcznPEWaxkakVF1VPthurYaD4PAXMULq5BgXI+VK3e6G7wzg98fu6yIJDXFuBQfr1u2kv+VmuSwQHsADEluLOwn5PZlt2zSX+bnXIg0iO4DT7XlGdfueaDrVP4QZ6RrxTztBofejO2pap/Rj9/hxiv6Wdz0tBhRsjenRSjjifk1vD00Ay+S0Q6J9M3WgWAUc+ZfiQNYhB5p2v1wM78bkx9l8+vrbTkcyQvNfiIB4qLEDvRXIOhLpoxazZ9tmBz+aW7FU4w==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 00:57:42.1672
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98321d86-240d-43cc-06f8-08dead65f997
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000010.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR16MB7135
X-Authority-Analysis: v=2.4 cv=e+s2j6p/ c=1 sm=1 tr=0 ts=69fe8689 cx=c_pps
 a=yPbt1s1ZvotafXW9/QH5sA==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=NGcC8JguVDcA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=-OawqTZBqJjt90xPb8wn:22 a=cbNQJ9GKAAAA:8
 a=tHz9FfFoAAAA:8 a=FS9jIqOaDyTR5aBss1MA:9 a=3whSkbs7g9Me0DR5EJEX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDAwNyBTYWx0ZWRfX2Yw9ML7cyrrm
 OcMLE8Yh7gIAxgK4WzX9Ch48GFk7eHMIFW8QcL/zQHyd7UDedFxb/t4nKkvDmwi5SwZjShY+/pW
 adTnxVOj0/oCthFtYQCHMHO/3w0j05BzpFW06RSBZfn4JyVfExRE7XTq5fH6OTgOOguu3brWICJ
 Cqh4tkVnIG4qy6qNxxMNBn7PdcNUHaAQLHehawwk2W3PxCoDvicLr8ltkROHty2VEOXVf9wyx18
 LEYyLEl7XaJTj8Puh3RLzdv7rTgYfH4GhHa4D3mU1lCtgLKxcEQu6ReN7d8YrQuO2DAsi7weFUd
 bYqzietAcYSH/t3ACAsH45hsGFIqqgBvVKdF1Kar7+eljRML2TCX2XG/Yo0V0usT4XRh6t6IB9y
 xBljLOggFahltKvB72WCJv5QzkiifUSZAgu+Ksyj1weg0sIrJzNGe9NLS20jWLsTKYgS1JvGnuo
 GeTA63PXTIgdEjGbLnQ==
X-Proofpoint-ORIG-GUID: n05sY_7FcK_XUK5qGGydE9NoG03faJ_Z
X-Proofpoint-GUID: n05sY_7FcK_XUK5qGGydE9NoG03faJ_Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605090007
X-purgate-ID: tlsNG-720697/1778288267-AB563161-EB1E07E5/0/0
X-purgate-type: clean
X-purgate-size: 2767
X-Rspamd-Queue-Id: 6E29D4FD27E
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,ford.com:email,ford.com:mid,ford.com:dkim]
X-Rspamd-Action: no action

From: Denis Mukhin <dmukhin@ford.com> 

The console ring only needs to be virtually contiguous; it does not need
a naturally aligned or physically contiguous allocation. Replace the
runtime xenheap allocation in console_init_ring() with an xvmalloc-backed
buffer.

Also clamp the user-configured ring size to the supported range and emit
warnings when the requested size is adjusted.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v5:
- switched to xvmalloc_array()
- fixed conring size checks
- corrected diagnostic messages
---
 xen/drivers/char/console.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 5cac87d052b9..29b9359468e7 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -33,6 +33,7 @@
 #include <asm/setup.h>
 #include <xen/sections.h>
 #include <xen/consoled.h>
+#include <xen/xvmalloc.h>
 
 #ifdef CONFIG_X86
 #include <asm/guest.h>
@@ -343,6 +344,7 @@ static void cf_check do_dec_thresh(unsigned char key, bool unused)
 static unsigned int __initdata opt_conring_size;
 size_param("conring_size", opt_conring_size);
 
+#define CONRING_SIZE_MIN    (1U << 14)
 #define _CONRING_SIZE       (1U << CONFIG_CONRING_SHIFT)
 #define CONRING_IDX_MASK(i) ((i) & (conring_size - 1))
 static char __initdata _conring[_CONRING_SIZE];
@@ -464,20 +466,33 @@ void __init console_init_ring(void)
 {
     char *ring;
     XENCONS_RING_IDX i, size;
-    unsigned int order, memflags;
+    unsigned int order;
     unsigned long flags;
 
     if ( !opt_conring_size )
         return;
 
     order = get_order_from_bytes(max(opt_conring_size, conring_size));
-    memflags = MEMF_bits(crashinfo_maxaddr_bits);
-    while ( (ring = alloc_xenheap_pages(order, memflags)) == NULL )
+    size = PAGE_SIZE << order;
+    if ( size != opt_conring_size )
     {
-        BUG_ON(order == 0);
-        order--;
+        opt_conring_size = size;
+        printk(XENLOG_WARNING "Normalizing console ring size.\n");
     }
-    opt_conring_size = PAGE_SIZE << order;
+    if ( opt_conring_size < CONRING_SIZE_MIN )
+    {
+        opt_conring_size = 0;
+        printk(XENLOG_WARNING "Ignoring too-small console ring size override.\n");
+        return;
+    }
+    else if ( opt_conring_size > GB(2) )
+    {
+        opt_conring_size = GB(2);
+        printk(XENLOG_WARNING "Limiting user-configured console ring size to 2 GiB.\n");
+    }
+
+    ring = xvmalloc_array(char, opt_conring_size);
+    BUG_ON(ring == NULL);
 
     nrspin_lock_irqsave(&console_lock, flags);
 
-- 
2.54.0


