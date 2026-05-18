Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFz+HZS0Cmpp6AQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 08:41:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB193566D57
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 08:41:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311496.1581616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOrf8-0005lL-15; Mon, 18 May 2026 06:41:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311496.1581616; Mon, 18 May 2026 06:41:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOrf7-0005ik-UC; Mon, 18 May 2026 06:41:13 +0000
Received: by outflank-mailman (input) for mailman id 1311496;
 Mon, 18 May 2026 06:41:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wOrf5-0005iV-PT
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 06:41:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOrf5-004c8M-5O
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 08:41:11 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a0ab478-5cb7-0a2a0a5109dd-0a2a45039648-42
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 08:41:11 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a0ab485-672d-0a2a45030019-94a38ff1348e-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 08:41:10 +0200
Received: from pps.filterd (m0367129.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64I5dPDI923703
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 06:41:09 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com
 (mail-westus2azon11012044.outbound.protection.outlook.com [52.101.48.44])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4e7vtf8bae-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 06:41:09 +0000 (GMT)
Received: from DSSP221CA0004.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:3d5::16) by
 DS0PR16MB5296.namprd16.prod.outlook.com (2603:10b6:8:155::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.23; Mon, 18 May 2026 06:41:03 +0000
Received: from DS1PEPF0001709A.namprd05.prod.outlook.com
 (2603:10b6:8:3d5:cafe::61) by DSSP221CA0004.outlook.office365.com
 (2603:10b6:8:3d5::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.23 via Frontend Transport; Mon, 18
 May 2026 06:41:03 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 DS1PEPF0001709A.mail.protection.outlook.com (10.167.18.104) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.11
 via Frontend Transport; Mon, 18 May 2026 06:41:02 +0000
Received: from pps.filterd (m0426316.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64I5AlmT3676799
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 02:41:01 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4e77mbs5bm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 02:41:01 -0400 (EDT)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id OretwYYBp9jbEOreuwvqbi; Mon, 18 May 2026 06:41:01 +0000
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
	:references:subject:to; s=ppford; bh=wrvzmSblObR5S7F3IIrnAYzgpw7
	A4lZJRB1CL+RAQHI=; b=E+vk3iBRf39oI3xvgRTKWCPmGAOLYS/4I/zce/AkJBM
	X0VyCIF0AlIBMfR4+QId5PYHfHXNwrtmvuHrS8/6pNX98wgb5AI3wOOBwEMYX1XW
	PB5eypHRIDObbC9wZ1kCeOIhXh4sNuykB+buKEZVHylCVnYrtkDn01eAW4bBzGwS
	HWK25vfMTufruJ2kw+tVTBaUciWPadEonZczqtXVARGBvSMm9LOcILJidZNohTLf
	pvRxaS78VMeUVJkztoZZvxtOkudXFriozFQbqLAGOnZ+3vGCDJJ/eKAP7sOLuRFI
	JaSSFB8bQESPEmB5YoGG16sjkwQ2OC7ohMqOzZKEWPw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H6TpNZcEA+NY8AqG1voFDV9MDDODxVnMadB12+DGSCoxu9DNvhmt5I3Hzh0c5Orq5r4UpfgOBHVVRuhGUl1L0FIugLosIHo9hqFY52Oej3yFdXEVsQbAZ22Vsw5RkCuxE/7CYL9TGf9/PSq2Ra4MP/fXzOK5U0Uzc54a5txzIMEMzobD7PpL3K8e8HATXfl2oZTDp7er7GpwSux5Ec9ptnGjpnFjFbaiucqMPtBxc9G+hgHta3vp1DllnvvWGcFQ942UNqJkLx+0XUDtYWnMFaYTFtwXqtw+7ukvhi1o58jchE35q9HGj5xuyGxR/R1Az8nPm8hDbo25Q+WGwxMy2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wrvzmSblObR5S7F3IIrnAYzgpw7A4lZJRB1CL+RAQHI=;
 b=UGDaxx+juTQ2p9VQalpOkyWcYKZoiuHrHWCcYnAEqq+38BZ3meXlTAuRF8x35XkEY4aHHINsZnM3cKHGbkMazeVyuOnNshdF1IvqKIZcFyOV91tDXKzLfdfVAQHhm6cb2NJOUX97wY/a1CwB494zGg9SunYESK10m1nKxlGk1pwO4YU1SpHrDUjmUpHIfZM141MDpYJiQNVHUBW3+uJ0yAX4ypHlNAl3HPV4QkXtjEfQ30u5oadPrW/n9OUxHamKdu9L8ZIehyqn1rl0VwSTMd87LZ+RPowl/ZFrRAWjAJjB/H8r7sRUXzUGaYPU/etGiumqyLP31Zv1Gtqb8Bzv1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wrvzmSblObR5S7F3IIrnAYzgpw7A4lZJRB1CL+RAQHI=;
 b=lm2Wj+OzBslOHgxW164BVWrByK7Zmg4M6QrBchwnx8POH697ccetkxPZFEXCb3KqeSjNdDimAmSqvHLXEy3M8QoP/UIopFwMr4Tb6WU48oD1mJ0zXWM+KRb29jKMXPD6/wdaCGmaMwIDvra7Naa9hdG970BxhEeaXU8UYfLsprw=
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
	 bh=wrvzmSblObR5S7F3IIrnAYzgpw7A4lZJRB1CL+RAQHI=; b=ZbR0SfgmBS2O
	jUpiwrUNRjdnUUnvY3AhPQ8T38r4xuyzD09iUjalMa618sS02vN/14yFQRbv+bU4
	nRuXZOzksdvMVn/V8k6iqFDMfUnI+75ZIoKD0zFwc9UhtDKxUJ6w8U90XLu/ziMp
	R/O+d+3kosTVCgkQ5JI+0ijrujytCyXgqsUGpQD8CTGaGQaENyzrWGNyTwjFSTI3
	+cT2KKJUMjl+MEYfNsHZmtgIko7wZbfdzxeRnVQ2TvZ+LmZVwZ3EEqqTVA9y0aQq
	3z6F8jcM/uOkjCPJmWKll37nnPaVKybZxUXZ+y3bcBd8j7FctBzzD8RHg3tN0wgZ
	1oOIjeJmJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=wrvzmSblObR5S7F3IIrn
	AYzgpw7A4lZJRB1CL+RAQHI=; b=aKWpPPTEe1vkOL34TA4AsqmkySQp6eHtx/N9
	6kCp77U0eq4Fcal0ERr0cwefK8jkvlpG7lraN9UIdMT9T0o4AY/cDaH5nqWRTmcW
	oOf0/nY6TgeujwQ/3WyLSRr0ECBcDOVkTnsH9+Zse8T4ZHmRlh8UONuuc0L0pC8B
	y8TjLKX5SKA91wQtCzm0C/1FyOiEz6AgQLsfRn5LE3BXWiD2/hW17Cc6Xt7YQQwz
	4XYvxHWggYmq3MhuTZ5LMOd72Eu0O3Y7hVL4QhmOZAW3pfqra7L/Ky5+sBrHH+C5
	+NBlsr0yCjBRjIOzC/MxFRVjNzgYRsNsE/RZpeVOKLijPY941g==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OretwYYBp9jbEOreuwvqbi
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Sun, 17 May 2026 23:40:59 -0700
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Anthony PERARD <anthony.perard@vates.tech>,
        Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
        Julien Grall <julien@xen.org>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/2] xen/common: llc-coloring: clear color count on parse
 failure
Message-ID: <agq0e4qHqRilhLQq@kraken>
References: <cover.1778925998.git.mykola_kvach@epam.com>
 <cbb02d6c5af6606ada3e477e8d45d730ffe72723.1778925998.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cbb02d6c5af6606ada3e477e8d45d730ffe72723.1778925998.git.mykola_kvach@epam.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180061
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709A:EE_|DS0PR16MB5296:EE_
X-MS-Office365-Filtering-Correlation-Id: fc6bc428-6061-42a9-70fa-08deb4a86de3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|11063799003|4143699003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	IQd5xqqcALkBGwvXSEXcLtHRN/SEYvk4A73jxaOHeGwbDURK6aodqtqrsWbbl55dQOMXwqp5nqt40uciLTj4mm64VRMQEght29fl4HTPDkCpstTcdClz7kyFiEoIWVSfPS8Py7ZTqzcX4dnFfEhQxj58kgCtiZf0HTWPkh3CGrwkc04Wy3/HEz3ZETrlevav2Qw2Iwl73SK56+QKC5ef+6Jn+BUQGZFZyVlZUUz8IZo6KR2fZshDNjrpIx8JnzoKMSExtNOjdpzqFqvyGjTpuKrdPnpZmsKR8NyeIzSxPMze3vMqR6j8sHbgiqcZSloHV6StOloT0O1OilhTj3wtplBsKpIj2KVwH4Rw0mKcddSqioRoL1pdwj43Z1OhaUP0XGhw8ox6yM6Xk04syupUPgWKhRWsXiLmW+r0e3Cfbsv1qXVvGer8XStnHByAzoWyH7sL7qI6Rh6J2CbE0+YzC6Mih2aEPzen87xZF+xy9LMCvjXQtiYM5JxTFZ5e5HxXivqwXWscWglwjf860WxOL6kRlXNuzcWsbasFUrgctHYoFVBqupG4s8H0pipTY9rIq/vJ+8/pi69VKCXQa6FkOyrr4Nn71JqsDdySex2F49V4Hgd9dJvyhZJrjc4jKZnAbtBaFPGtLQpu+OqS1/BCARXLjTHf1pQQBQ/3shbnwHjQZIjk7WtoUTOFMNMvfFsm2Pf9kbpEO5w24Yb4+yPrPW7xOtKJumi4ofYucxCoZto=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(11063799003)(4143699003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DVY5FNqRHUPoTkL1KFnsTgBZfCWESdyyXeuIEzmGHVjOFnIF94W3yU9x4Ac9Pukwg28Nwu3OC5IWNZWsqQEYK14SkWm5fVjM6GXR2HadKfvHcVI82+UR/vjIKmyGhb9v4eRk2965+31R0CZenG0vNM2W/Wv8C0srgRGGiIKc/uL4QHmuMgqsaduV+BTX9q62oBa+fZ2waUKTIYO+0Kko3ltR6myMc5qctCtVObQsmf3KOKqYMDt3h3eZa87zuK7W3FIObslYSxnBZVQV3caSeb5kVrkA3ziJsuC+tbOLIvJCTdqxF/s3A/giqefUcgoi/LVpFZl6T1aYc/IJUrFgsxbUsrxMhTlpZhPQUBPmWUuJf1JmtWHYyd1wWyh0DI54qrUc+UIMKwKqvgVdSN9G3rhBpqBJ9xkTfgFOn8o67XsVK7ZPJP847C3pDsBynSTi
X-Exchange-RoutingPolicyChecked:
	VuB230T5f+NuMNKySQxlG5m05sPrbQ6MKY5VN3Arkqj0P3DBqCccTWqQ6vH6DO3GcWYZCJvB88PrMAIOv9YMv1nYc3E2aEiFzisgT1ueg6+/OYbRDRGKKedi6EiooubxwqztyZYNEcUn/DXeq7roOaRhX1x4bm4uciNdHUMw2YbRY/lmTm+Ji1af+fbWhsGbuDjsq4+vMk7GjM5IKNr6+Bf6wLWRLxSfGYIPG45NTChGXtbyB/eb4pslGS688mFs4mgJKJffgIGQ22UhAIoJJHScAijR6fuhXcwQQK1n3v/XDV2qFJjmHWssit4pLaLcHG7rPMh40NrwnDyhGqEe0w==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9Y/ZWTfoIpo35VutnusDMWqF+wtOPWgDPDDHWQHrjCs2eKnwdK1B3U6mv1EaNWGruRcBM8IGVwgq0Saok8e2AuqYLkXqz8MH0UcwklSQcNVu13s6XNeZeB0SnY8DJ5HSdWSSfWmPrp+K5AvaekCHyuk0Y2hIpAtsEZqwSAPhPetNitGAQ/qEBZwb6eeh43jILbr0OSNgwM+JhJlGqRfMtEvg8wRGtV4h2Ir6G/UKVTfavJIEB6udawVwNK+GztwhxSrmtJQBoYfAfInWBzF6V8oS06TNSaYfDrq+HmtRfOgU2N9ER96iKmHIYtPirqJ7cBP/a/fK4ZEWr5uJ9zjJg18xLPiVoq/Ejt/9DbGGmkHOgsVCPJN02idhTlfWruECcwBIEv0JW5EfLqfMUpcWWbSgwCUb8IPx6RfD8Za9G8xuR8hqsZ7Wu2MMmOiAZC9A1rgdkqDAsujw0GbuPZuflAOCxLbm+gsFH4QEhTRl/w59s4sO3SxJMz96ASgGM6rpYqf1/XgIQ282FYC/VYaSEJbFpjVlOpUZsAxyW2o9p4f4nDeb3Xyr/Bb6QdWv3LQ3TLA06S27NU11jSfwea+i19Zl63b45gFXrhX0Xalp57/nEo5VS2SGV/2vvOucpnIEMKN75LAp0ftOa/sS0GIpJQ==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 06:41:02.2460
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc6bc428-6061-42a9-70fa-08deb4a86de3
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR16MB5296
X-Proofpoint-ORIG-GUID: 7KzyWkEZfB5T-nvC47rBwwFm00yNKxe9
X-Authority-Analysis: v=2.4 cv=RaygzVtv c=1 sm=1 tr=0 ts=6a0ab485 cx=c_pps
 a=w14INr65hnrDDPfMN4rXVw==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=X3KReqg2EL6A36SYCKpz:22
 a=DBfv99YmAAAA:8 a=cbNQJ9GKAAAA:8 a=dKTS4Y0tjYD00X8KSDEA:9 a=CjuIK1q_8ugA:10
 a=G69WFyCBNqGPyalROSdv:22
X-Proofpoint-GUID: 7KzyWkEZfB5T-nvC47rBwwFm00yNKxe9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA2MiBTYWx0ZWRfXwexFmnXcdFN3
 VnTcL5xNza9OgYQ968EUDE8T/HSCY40k/1wHcuOpxvkZRZrTECcpIdshpX94jkxx8LTvXjoUz73
 GKu9jEatdD1mi78nBwFoRTjVFKRl1Lt8AFLsot2kfjzBab4EUm0HS0Df2VH9SbJdL1B3iZaTPc/
 qy1qDAevN724sWuwHIGcseRkIt6VyZmboSkateZmHTzd9XuWDt4JInhg8QGEy2UmclZ3/O4nqdK
 KAjsoUwRNGObMEGBx9qUiGhvkug9QMVJ1A50LLduNAeIZrowP7DwRfpkNWg1TvZK1sBdV7lNgmu
 wzFvdqPy4kl/QlioIcoRg750TKvQZPWKZ5o/96GOCjZs0OVGoZirn6fFihHB9qOIDyElSpo0pcZ
 9DnOS1ZpOt72rM5lJT3taO26xF+jNUoN9qElWb74Lo2lCvDajTD88BfBWa7jkiVlg2LA7ctRGKy
 Z8nLMlZ5uL715X4CH0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180062
X-purgate-ID: tlsNG-33051d/1779086471-36547938-4470605A/0/0
X-purgate-type: clean
X-purgate-size: 1647
X-Rspamd-Queue-Id: BB193566D57
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,saarlouis.ford.com:dkim,epam.com:email,ford.com:email,ford.com:dkim,azureford.onmicrosoft.com:dkim]
X-Rspamd-Action: no action

On Sat, May 16, 2026 at 06:03:11PM +0300, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> parse_color_config() updates the caller-provided color count while
> parsing. If parsing later fails, leave the count at zero so callers
> do not consume a partially parsed configuration.
> 
> Fixes: 6cdea3444eaf ("xen/arm: add Dom0 cache coloring support")
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>

Please consider

Reviewed-by: Denis Mukhin <dmukhin@ford.com> 

> ---
>  xen/common/llc-coloring.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
> index 6dc614739a..2606cb0977 100644
> --- a/xen/common/llc-coloring.c
> +++ b/xen/common/llc-coloring.c
> @@ -79,7 +79,7 @@ static int __init parse_color_config(const char *buf, unsigned int colors[],
>          if ( end >= NR_LLC_COLORS || start > end ||
>               (end - start) >= (UINT_MAX - *num_colors) ||
>               (*num_colors + (end - start)) >= max_num_colors )
> -            return -EINVAL;
> +            goto fail;
>  
>          /* Colors are range checked in check_colors() */
>          for ( color = start; color <= end; color++ )
> @@ -91,7 +91,14 @@ static int __init parse_color_config(const char *buf, unsigned int colors[],
>              break;
>      }
>  
> -    return *s ? -EINVAL : 0;
> +    if ( *s )
> +        goto fail;
> +
> +    return 0;
> +
> + fail:
> +    *num_colors = 0;
> +    return -EINVAL;
>  }
>  
>  static int __init parse_dom0_colors(const char *s)
> -- 
> 2.43.0
> 
> 

