Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /2uqKzER/mm0mgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 18:37:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 714494F97C8
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 18:37:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1304039.1577239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLOBu-0004AR-QD; Fri, 08 May 2026 16:36:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1304039.1577239; Fri, 08 May 2026 16:36:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLOBu-00047W-N1; Fri, 08 May 2026 16:36:42 +0000
Received: by outflank-mailman (input) for mailman id 1304039;
 Fri, 08 May 2026 16:36:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wLOBs-00047Q-Ou
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 16:36:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLOBp-00GW9Y-Aw
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 18:36:38 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 69fe110a-5cb7-0a2a0a5109dd-0a2a4506a244-26
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 18:36:37 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 69fe1113-7371-0a2a45060019-94a38ff1baf8-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 18:36:36 +0200
Received: from pps.filterd (m0384717.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 648CB2RZ3850262
 for <xen-devel@lists.xenproject.org>; Fri, 8 May 2026 16:36:34 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11012004.outbound.protection.outlook.com
 [40.93.195.4])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4e181hxb6d-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:36:34 +0000 (GMT)
Received: from BN9PR03CA0574.namprd03.prod.outlook.com (2603:10b6:408:10d::9)
 by LV8PR16MB5838.namprd16.prod.outlook.com (2603:10b6:408:1ef::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 16:36:30 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:408:10d:cafe::7f) by BN9PR03CA0574.outlook.office365.com
 (2603:10b6:408:10d::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.19 via Frontend Transport; Fri,
 8 May 2026 16:36:30 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Fri, 8 May 2026 16:36:30 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 648FBGQj4098353
 for <xen-devel@lists.xenproject.org>; Fri, 8 May 2026 12:36:29 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4dyxwd3jg5-6
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 12:36:29 -0400 (EDT)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id LOBewzC4cdMWeLOBfwrp6J; Fri, 08 May 2026 16:36:29 +0000
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
	:references:subject:to; s=ppford; bh=ZIGg5HbFp6sGmdutasWExpocmgr
	EWJPzfspOR1qS70A=; b=I/OYbNX8LyvLx9vUPlLoNQbw08tuytXjT8FR2PSGmvX
	+1jpG7eLKQk2rZHcpagYX+nP2GrLHZmRfE8/S2tJm7+3bn9RPP2DXnbe/JAqJpBG
	F1io8wYnE1mjGiKbWIizafifxnWoIZd4KiRrbuIpk621o18ur6Va+wgs2ozbiTXK
	fOG5mAYw5iWltrUAaN8fQMTOY1dSnxgchwno7ftFBAudiTAvyu6djKy1OI9VDOcC
	2uV7MGCr6t4YAqE7tbOU3S/sO/yQiPHFnwRF5mNA5uYDmstc4rxmHj1c8rOLyvEX
	NHuvnrdOwLY8hK2UMezL3E3ADuBRKQSFsSAbVLae6Eg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LVhUWRRhabKqXm8WkSSheJ70s3ruEIHG9C73phFMtSZbGohDSQzqfGl6VntvGwuXjucPCT4sg5DEl90bGuI9AhX0awdLW3zOo646Oe81M+/bX3qc/AF5UvKaAHN6e7N8vmJt3ImVQefy1PoxB5IkQgorYfiOUJTASQ9gLnGJgCPNHc2khsD8WOh1rA6KOycr42zmkQ2yfkctEc+AcQ1SjSt0Sf/kTjNDIbkQgImSI8NOEoN0DkPzNhyicLwwLZxg6mXVG1PcsTWdjsOWXCDkk/uVCXpb/d2dxtZZlkkXvNHQY/Gq6j+fWak9AI9KCBpMd1S2AUMW8+BK09694/WtRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZIGg5HbFp6sGmdutasWExpocmgrEWJPzfspOR1qS70A=;
 b=WrUbHp1vZuORQBO612m3e6hBoZJ2Qu2L/IVk4yWFjCJbKO9xaay9g+xy4fvwFExNsG0T9EybzLuT8Gv7pjXMUrdTgdmbf2LH3Zmzgvyb4vSYl4eFQcTOVwOtnwoZBUEUKKCqZnVKTpbEPF+Ciz03nXpfHCsYoxeVl83TVV4p6fFlOcIOCjMQnSIhRIQMgumWoE07yC/7Phnx7zWDyExTF9Juj7IugnOBw9V9BeQYAf3mCaSNY8KyA9vqJ6L8oa5LilnaSwKB/WP8fgxMN5Gbb/F3VRMaFXbT/ERDaJAaHrKqiiUtyOT8DpKZHiuwzZKQUl09noxRXuptKrd1kPcf4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZIGg5HbFp6sGmdutasWExpocmgrEWJPzfspOR1qS70A=;
 b=e5aVybGGNPvxOs8g/84nJtPvhqF6h5LC1XtT2fU8/zsaAWBBQSbuXKdqrAMryT2+gUn7DOK7YBJ2N+NufBtCSicRgy7XhfLssD2K+7iTn6OSyiKLfxfPCHicxOp7eZ6pPGuYxYpFyWkdb8KncLdXZKDJ9tAxjmWaxWcKLjVYsIY=
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
	 bh=ZIGg5HbFp6sGmdutasWExpocmgrEWJPzfspOR1qS70A=; b=df7X0rUWm8tH
	rhJX2TQBtEjl7lAFqRXXbY8/FYAoBw/nJWvzr2YykX7LAFpcbnCbwevf14uL6cct
	KxISBk6cRK7dn3sav2I/F4dibcr92e1DqR4ljOhJD/BjKKjCToFhiTGrB/r40kJh
	Li1ZDrD4hEijdZDe747dshH8p8JyjgC0RXkH/UtvZwT9B8sUNVVd5zmosTTrxKZ5
	BFaMrabHg6NMvUDquzUTTD2+uV8W8kEk/bPVUl1YFLg8tXbsDXaWzHsgxMlvM4kV
	qy/C6xj/Wipf7MaKR+eHD88I3MlMQzKXYP3Hbgbp8YxcbPkabGIP/hKEe3R4fUGl
	72MzuAlcaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=ZIGg5HbFp6sGmdutasWE
	xpocmgrEWJPzfspOR1qS70A=; b=OGcWcmra6Qx2JOwrtZnfDJ9dvJtJd1Feqfk0
	+TArU3hBGHUmL3XhcMBVDEEEfXiuZBJ3i8ybuRD/BkoYm8VpP7sIcHm+2pqw/gnw
	s8uAWWq0fj7zQ+BQJJCLD+I8KTgW96n7SYVegQxcev58KeXzOxEmL0Jj9AJtdbq/
	Jx8QWBouHzZyuuG6aIpSQh/yD/De1vTRDOWYaYsM2HTO2c+i7AD6ABEuMq13v+yp
	r4+zFHiO+WaCERo+tUe0ORlp2pZOYRtDBkkrMae/B2HUEOlbr15IBwgjaEQd09jF
	5YWklh35S7ixKCZ6aDh+VnYf/4x0+MEKbIlzoicb85reMVILzQ==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: LOBewzC4cdMWeLOBfwrp6J
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Fri, 8 May 2026 09:36:26 -0700
To: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        Anthony PERARD <anthony.perard@vates.tech>,
        Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
        Julien Grall <julien@xen.org>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH] ns16550: add support for WCH CH382 serial adapters
Message-ID: <af4RCveh5RkQB5VZ@kraken>
References: <20260508092813.12894-1-Zhao.Jiaqing@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508092813.12894-1-Zhao.Jiaqing@amd.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080166
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|LV8PR16MB5838:EE_
X-MS-Office365-Filtering-Correlation-Id: 285f6c94-7007-442b-165c-08dead1ff561
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	R+6oyIbh9HkpUNEYpRSBMu3hvBzRvZycT8FumTWt7AcrnzhZfpvkfFEngY1ADKDfwC+jZiOzlQnrr2FfJ0OsS+fjho7UkVuzCBHSCZ/ZTQRPL5PCizsSyk5MCWtJbWU/DcAD22KWywfZ1YeCWdRiDjzk6eEt2cCDNoBYRvSnHLynEjruRFRh2CrzWozny4hcqtg7zC+yn2knXehtUyyc3FLlLELzHeIQrUyYoP6KroEw2Iug9N4lqK3Uf+wwoCPpW4/Yt9RAg4jKIR1O0eqNDLLKIOsDsFbnA6stuZ+EUolHpgDvxDXRG57v0oq4NGOy7SDAbw46v72dJo1NF7+AFtOCsAjamPV9OMKh1YL7Kcndr+puDGwsppHY/5YtPumKk4biBK7GRxLnx/6MTIYw/ODFNUZ9fk1Iena8evc7nvWWL/HMWumKL+9jV6eML1sUVUS/ImJnGYgChLiCuXk01ofyr798xDA4DklXmC75oHo7fJAUdRh3qMpmnM5vNHlm0LUTMLNPSt9KvquptSGdQJKcpQBd8DVdO/iaZxr/v08NRLma6Va+jAFoU+W5gMIdxIIxcwIPN4r7QUUYFJAONvaVUhFm1tcXak+XODaWZxEUbGzKBk5spLrORtr5WXganhwz3HQAMGg0DBqM4WcKSwerhCbW5XiP14gm7qrVsyU=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	79nuKWS279dfA8BHg73j5Z32CrrjyEOM3hDWvdSW3jZGdH+C89B1IscW3//ipw9CXjllbjPMwFvKkm69s590Bprjsyu4SmlKpxN8HvThgxKgbeoQIbkYyd8Lwj/qve9+w7CxvzE9MF1P3g9Z4IhWjnn+oBhWxYQNVWcQc1L5jLM37YJHpwIelvylhLe9HVwJz+NK/AILQUqY2SXwfczXxSacu9P+ZkTb9xOZmCrshlDndj1AJKhDfwUgxZPmcoEd1fVe2BRYo7kTlw4yGZekW3U791Luk5j9Vh1TvBgcSfQGLytcNPCmBQA+R/ic79G3/BiDMwfHUyKKC6yZjDaXcChWD8/WYxuedTuS8gk6xUuW/AddrhQhp1IcwTECjMss+J1FUydu62rmOG6gJrjmLq2Qdc12AUId7y2cp9ISppoRw0gotI4d0wlP06YThjQs
X-Exchange-RoutingPolicyChecked:
	olzqCzcslujt7lFTArsPuq2+SzjqPb8oZbz9iX+NdehOiTIhkUVf5Fb7FgsJ2mGh0u3kFOjFj7aMVzLVIHaj/rUuZBkvEOw4psXA7sqAtZCxZGbXxnmrK/p0lkEsCIQM2/SWQHEiF4sCM/6c+YlNdUsv95eLw3TNUfcjB6Od+5xoAzQy3T6JzRAVgBdoxSS8AZpWIrbIEDChrTTOYi1L/SQIACmUce4UsUi6tIwfo8nHEMR8CctR84JQexIGTG5XjRFT8T9K8QrW0cA7BVXlirq7Q6sYpY860GiDW02smL/m8VR23K2SsZFopbHlt2AlPERTcBQuXlpI7U5id4/lGA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	R+AsyJMG45MAd8WSScLpgRpZbnxqrIeaHSh8DnSls0TnrAreT0+R0g0uxShQbTwRsyrxLTOE0hILKc7CoZL+xISS05Oo62s7rRtZe2Gr7uqQswqygJ1JTsBxe/PTyzmFNvwfC9OLYkZxUKDsHet2FgdweKuDpvj/4ISb/tyQNdrVzUu3lC8iQvzn1FwZz2oeRGfuLzOrCaNjj6rc/6zjeqklOQsRCb1fVVP+uJtd9WhMg6EllAef6RAGEsTj40tmCdDW2Jmw6BJ1kgQDAHvkhZkXseQZYcalDuuDFs9ZRPfBPPCb92UwFehirjTArx4wNj0N5VW9fKsdUEHLQv6+eKzPSQngOKEPV7knESQA89nZkNI2nWYc38QgDBh1Pgyv1XCeboqWEoiIX4P8JBXAsM4F3Z6SoVC82tK6JIrpjzXNOvrEpyFMKtvShF3UH7tWFnlwdgqfPsci66LI/oP8VZYPqufNLBfTyfhGeyslEoezKLPyoGb1uE15hLCtYDqhNjdN3siRFmx+txJednwBSp9wq3yUoixu2syOkXMfCj+POoPu/t1Sfxxx0NCtUgCGf2tAFnp29KJQUIFf6RhAV0oV7uwpapepla6zccmcT2KoWwJbwZVG/J85ruBVigA7
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 16:36:30.2469
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 285f6c94-7007-442b-165c-08dead1ff561
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR16MB5838
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE2NiBTYWx0ZWRfX//BkhmWb+4jk
 1rBH2wt1kvtzCPy1zQivNfki/6Y2XJuTAfUOB9UELzSvVzZ2j/oaA4AGKIsZT3JAlCHcS4Yq8pL
 ZUyePiI2lh8lanDmLWoJ0clFkNRJ12WidIbXnjgRBc5o+0ROFV+KTm3JLkNix7W5FH4R6dmQiZB
 w0bSdmqPRJVeeouBT4UjT5yzFOXmhq5DDR51zPqee6Pm7ZTzfzMqXWyhc1ugvTUoTD5D/dlu/j0
 HWL3b6d8ArjsJuqNF3ko6x9aLFJcuAu7jO6U2J7RW40QGDDd94fLFHcSMrrsnXpslrAG7cHX7zP
 rB4u8fiGoyqhaBCG71ZSWU6fQuHHOSTFIs7F7/MIOnv5FE8JaihsZ3z0+u0a2m3kWjEUULqH9aD
 mUCyytSvfcthWV2yeBHPA7Pfi2N0jdQutz15hwej8xvOb8iWNwRlnBd+XEVGhyoLJxLDP7alKI0
 BeqtH4kcvdYj1wk1wBA==
X-Proofpoint-ORIG-GUID: wrtJ6toKEpe8vsJCpYCH_dvI_53oRrwC
X-Authority-Analysis: v=2.4 cv=eJwjSnp1 c=1 sm=1 tr=0 ts=69fe1112 cx=c_pps
 a=eN70jGNn7EKSdYhrfilGAg==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=AHe91QgOk3R4nFVtG5At:22
 a=YevQRCLIAAAA:8 a=zd2uoN0lAAAA:8 a=cbNQJ9GKAAAA:8 a=U4kg86Iv_G8tikhSs-UA:9
 a=CjuIK1q_8ugA:10 a=DqJYxgmhk6moR-_7_KoZ:22 a=BY5erhXd-_4Bw9I01UXG:22
X-Proofpoint-GUID: wrtJ6toKEpe8vsJCpYCH_dvI_53oRrwC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080166
X-purgate-ID: tlsNG-16d1c6/1778258197-8ED88D75-C60E9A3C/0/0
X-purgate-type: clean
X-purgate-size: 2242
X-Rspamd-Queue-Id: 714494F97C8
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:Zhao.Jiaqing@amd.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,azureford.onmicrosoft.com:dkim,saarlouis.ford.com:dkim]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 05:28:13PM +0800, Jiaqing Zhao wrote:
> Add support for the WCH (Nanjing Qinheng Microelectronics Co., Ltd.)
> CH382 PCIe dual port serial adapter. The CH382 is available in two
> variants:
>  - CH382 2S   [1c00:3253]: 2 serial ports
>  - CH382 2S1P [1c00:3250]: 2 serial ports + 1 parallel port
> 
> This chip uses IO BAR0, base baud rate 115200, ports starting at offset
> 0xc0 and spaced 8 bytes apart, and a 256-byte FIFO. [1]
> 
> [1] https://www.wch-ic.com/downloads/CH382DS1_PDF.html
> 
> Signed-off-by: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
> ---
>  xen/drivers/char/ns16550.c | 23 +++++++++++++++++++++++
>  xen/include/xen/pci_ids.h  |  2 ++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> index 878da27f2e..106ef56316 100644
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -95,6 +95,7 @@ struct ns16550_config {
>          param_exar_xr17v354,
>          param_exar_xr17v358,
>          param_intel_lpss,
> +        param_wch_ch382,
>      } param;
>  };
>  
> @@ -861,6 +862,16 @@ static const struct ns16550_config_param __initconst uart_param[] = {
>          .mmio = 1,
>          .max_ports = 1,
>      },
> +    [param_wch_ch382] = {
> +        .base_baud = 115200,
> +        .first_offset = 0xc0,
> +        .uart_offset = 8,
> +        .reg_width = 1,
> +        .fifo_size = 256,
> +        .lsr_mask = UART_LSR_THRE,
> +        .bar0 = 1,
> +        .max_ports = 2,
> +    },
>  };
>  
>  static const struct ns16550_config __initconst uart_config[] =
> @@ -1189,6 +1200,18 @@ static const struct ns16550_config __initconst uart_config[] =
>          .dev_id = 0x7adc,
>          .param = param_intel_lpss
>      },
> +    /* WCH CH382 2S */
> +    {
> +        .vendor_id = PCI_VENDOR_ID_WCH,
> +        .dev_id = 0x3253,
> +        .param = param_wch_ch382
> +    },
> +    /* WCH CH382 2S1P */
> +    {
> +        .vendor_id = PCI_VENDOR_ID_WCH,
> +        .dev_id = 0x3250,
> +        .param = param_wch_ch382
> +    },

Suggest to keep the records sorted by .dev_id field.

With that:

Reviewed-by: Denis Mukhin <dmukhin@ford.com> 

