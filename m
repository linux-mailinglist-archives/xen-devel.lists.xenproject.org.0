Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLtwHGVgBmoMjQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 01:53:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2B6547DC6
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 01:53:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309303.1580333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNfrC-0002Di-3P; Thu, 14 May 2026 23:52:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309303.1580333; Thu, 14 May 2026 23:52:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNfrB-0002BR-Vv; Thu, 14 May 2026 23:52:45 +0000
Received: by outflank-mailman (input) for mailman id 1309303;
 Thu, 14 May 2026 23:52:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wNfrA-0002BK-2H
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 23:52:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNfr9-00EJA7-0T
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 01:52:43 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a066030-e002-0a2a0a5209dd-0a2a4502da82-8
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 01:52:42 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a066049-af86-0a2a45020019-94a392172a6c-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 01:52:42 +0200
Received: from pps.filterd (m0482516.ppops.net [127.0.0.1])
 by m0482516.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 64EJ0D3T1706175
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 16:52:40 -0700
Received: from sn4pr2101cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11012070.outbound.protection.outlook.com
 [40.93.195.70])
 by m0482516.ppops.net (PPS) with ESMTPS id 4e5m5xhw0u-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 16:52:40 -0700 (PDT)
Received: from SJ0PR03CA0082.namprd03.prod.outlook.com (2603:10b6:a03:331::27)
 by SA1PR16MB5743.namprd16.prod.outlook.com (2603:10b6:806:3d6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Thu, 14 May
 2026 23:52:37 +0000
Received: from SJ5PEPF000001D5.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::d6) by SJ0PR03CA0082.outlook.office365.com
 (2603:10b6:a03:331::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.13 via Frontend Transport; Thu,
 14 May 2026 23:52:37 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 SJ5PEPF000001D5.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Thu, 14 May 2026 23:52:37 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64ELiqDO3862938
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 19:52:36 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4e5m13g9t8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 19:52:36 -0400 (EDT)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id Nfqzw9gtdtgXKNfr0wAs90; Thu, 14 May 2026 23:52:35 +0000
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
	:references:subject:to; s=ppford; bh=rjkls871QgpOdbggwkgTqGJFQij
	NqTRuu1Y+e6u4TYY=; b=NFgjlFxPnH4Iwv9WD3TEoFtiwVcBIqaWS+rucCOoTIe
	9nFneU50LcbGVZP28jQWrX8Hd5lMeXmXz1n+e7yh+j4Wimu5Nl1HhvU8qhsyQZ4Q
	QPuW1mOokyVZIyX+s4/JGCuF1vih3leCe0WXHQkj+GLpBKUQkbiMKPxsXlh3PPy0
	kcl+O7+YDRMnjzz0h6WX3m9z+nq1By3W1VHZIvPS5fH4pHAcy7iAVP8xFN8vUVCi
	970LZl2187LkxyXHH+K+IOV3opB3vtw1VGOv0N+ihxzmIMWi5bfbN/kq+O0bP6Ew
	Pdp/CilvkL7Q25euJbZnpR/To7lEoWtDw5VQOMtyNMA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=utaCIU1AuOdtfnqUjqn2mw4nqFwrX9IS+R4B4ld7498gs0AHKb7ivKrCCXa/MrnOfU9PehFlQCnu7J7/GytbJVHmpBWZM4Tyq3UGqe3Zyx8ifaN4ZmAPCk3qLr21ZStUGllPAezqNMr11xIkOxeXeMExfvqUx0dXG+dO47+rM4foBBvFc97S7ybZ973lFPPLo9dSTb1h1898BaYv38SICpM+In68JSVPNvcO9w28mAVobMZzyxrUBr8LYNueDQnUKVzNn9P1l+Je7tdN9SznVbti6lMxoNOqYpCkX3HzPiIKsh3rZ+/WFAoHD5o/L04t6Wi1wwz+XWlVVArQ4uxpBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjkls871QgpOdbggwkgTqGJFQijNqTRuu1Y+e6u4TYY=;
 b=mrkmbRXaFXGEylmpa7nQkrerVvUtm1Nn9NXn+mY6BKK3EEf7Qhlg5Wmqrn/6PJjNd8AtB+n6AjIYZNDK/d/SRtV992farBCs7PVA7MTmkbj7J0PHJ9yzpmcBidb/ypGyIHOmSK6t+GhaZQiFGVOByrEyVRvdlvcVYvjwg7TstomsbIB4Rfl9/WtM8lKe+7dZ0dmpgJPf4ASq3AewfBwMiGxmc5wvi6amkJRmOzbZv9egYJTbVWDK2cke8KNIIJyIYqlN5L9nLDmaAuOYe/8HwPz3E05tekn41wR5zrsiFX+dU/H+w2aVGZh3/sY1gjtDdTXgKV69dZfw93qhBAgloQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjkls871QgpOdbggwkgTqGJFQijNqTRuu1Y+e6u4TYY=;
 b=U4WSjjT3J0FhGP0hpu06D7XvZpA7HDScfNv007KhypuNkPPwAsSn2zH/VJMHcm3X85FQvr8fPITyHYIguMY4DHBlBBMxH+B4LpyXLaGZCOtrFDhrJgr85tXbCYHX7wRs4NnsK93hbbzUC/5S3kPOtGmuSjlZVuwjfr6uy8EV2DU=
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
	 bh=rjkls871QgpOdbggwkgTqGJFQijNqTRuu1Y+e6u4TYY=; b=YPbVd2wPdS13
	oRNMyCrRS0/eygnPnVAmNAd9BtKVgB6NCGylCfD60MvstrDFAL8iISDJDoAtibLm
	Hv9QNwvEtSFADLwfAu1P4ZvH1xDVlT1C3kZB7fToJjVonLixAaZ91O1L8diD1nyP
	X4g/UxTybr2k5BBYIvGBGjKkoMUDj9eVRnsOHnSYL4DccNwpuOfovH0p3YD00CiA
	UrEVWSwRRkyMVpxp/w/LTGeZlRpM7mfrkG+TXdldhhyt39CwOG8mxXlYp84rxmYJ
	zC/N6NKQxPAGhDTQUPd/kA54U1+MTpsLukz09yPSMd3pf7kCIrB41lPld80PXlFi
	XsgwCllvIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=rjkls871QgpOdbggwkgT
	qGJFQijNqTRuu1Y+e6u4TYY=; b=p99wIAwjV9pZ9Yc36iUu49vTkBiXhEWa3BSy
	87gZc85b7FshHNiH/EyWWFZVPi5Y/qmxuCuiaX/XkGyYQr2HOp4Gq8vh+xRlxBMI
	/9G7dhl0w5l+sezX6rA0iXHtSAz7JzUG3uoUSJ55RE9DW9+s2w/+7jtdG6zbwAFo
	PGsj44a/1a45HY9xGVzCG7QmgnIP6ujYJOQDWAqIGeLLZnokpygh/Df/5iCSWWvB
	zLlZd5U+Aq3IWp3kKytUoZp05xAuzdJoEFtIS1K1vjhDLvPkSOnRkg8AGi5PDkSR
	rnpiIrOwvBCHpHrWCbVXyCTY7xgfRw/6hWdpkmGequCJhD1EFQ==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: Nfqzw9gtdtgXKNfr0wAs90
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Thu, 14 May 2026 16:52:32 -0700
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
        anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
        michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
        dmukhin@ford.com
Subject: Re: [PATCH v7 14/16] x86/domain: enable per-domain I/O port bitmaps
Message-ID: <agZgQKoZs8F/CH4+@kraken>
References: <20250908211149.279143-1-dmukhin@ford.com>
 <20250908211149.279143-15-dmukhin@ford.com>
 <CAGeoDV9bc4uNeSJ_H5G6WwbOiwdvkS+aZXpLr4K10mtRZX5vPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGeoDV9bc4uNeSJ_H5G6WwbOiwdvkS+aZXpLr4K10mtRZX5vPA@mail.gmail.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_06,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605140234
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D5:EE_|SA1PR16MB5743:EE_
X-MS-Office365-Filtering-Correlation-Id: e4b7c049-60a9-494b-60fe-08deb213e04f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|18002099003|22082099003|56012099003|11063799003|4143699003;
X-Microsoft-Antispam-Message-Info:
	ZDkaJv91VFH0a0rI/urgXthTSQ9E+YF3kCHA/Rvi1xUsvoeWnkvzoFlobqwrayJ/zCUCECq8icCAbExih8fijAvVgSOvpnZJuNiaR2yH44cgWxizKGIa0lFmCfuTSjNYubSTQUdKWqy9k4vY0pvs0+9uGGhx1DgGNvdmyNr34yHu8buDCcpzrtzxTRoyxzPPpya8/Yyynk9ZcOZvm5z4UmbM4EsuXRHfDJgiqGwb7n13zQRTUftkvAhbHq4cT1aUm7UgRoAttflv/rTYIJs3E6T3YGqXUIH3qeGYkoo/CtT3bMMZUC66B5LcS636Zvu4Rlj5WMrKFoot4mYuB4Zv/XA7lFcBDl3nx/t2W8XPgmgEIcgyq3zeOQDB36vBR+/F09ABdm2ClumOwOmzuIHYSe89v1WwojyGJ4VGvvWyuE89iVn/kG2wRWGkxzg9yr86efe/G+khuWh+uU7qMTtmWW/sFSBW1arkDtg6xHeepyZwk2AoIMAbhUjR4v+fe6XvEh1i7OBXw24Yhf3oSRDinxzMKZCn6L4reL8HEVFLVMr6InKkcAMQ+2mpSqU2yKcS3auS7WpVr7MhB22FPxEcXRwtIhkdPLsKvKqq2hEC3Plcmp/u/7wXIMhT/APx72M0aHmH3JI9Vrb5J7mDP4IcDQuPlhJqSudrcBeAdrg5DEtHwqNmT3s3gMQ+SAEPbc/N1dj943qPccc2+czw9TTh18vjiys2sSkFCICDt8ASnlE=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(22082099003)(56012099003)(11063799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XWrDQCXYr2F1oSGHeXGyEBIDw3uqoch6HOb9aYZIB0Go3qtfFXq8j4S/QIHZr3ZLmVmRrKc9fdiuW4uKWH/HKsUK6hou0mWxo38VioxZCcZDxXfpAJCRAribMzxaK6nd0Wj7PFtoR3OZUd5wrkQOQAiRm5qj2M+3oRylHqJXaIZKgNvJNw+JH1yJyw50QiM1vec+AKvT/kUgQD9Kh2Aj8x1+gaiJp6l1VHylxM/bgayviq/F7pFVY3ZC+96YfuAshSQfhLH5bCa6sZh0xH55qG8Vj2DgFaVGvx6cJdlsiD8i9X9eu1sKFGozxa+niXE7xdcRN7lYspG/KYeNsyGmhvUJXw9fANgZYHQv9gpAlX7RYMYHvNMftYtHGkkbgaU3XvAAr7qvBqnvLDVU3PF1Zja4M29o6NwbKkdlcZu+ndDjTMNMZcPZ4CzL3YuLlFSk
X-Exchange-RoutingPolicyChecked:
	P8QI53vImlsnw32twkjyS+q/5mfHne2Hcss0yiFHBL4PSZOyEI8CPy/TIpetUGGGEzSF1Q7aso8v7EiLbyJlsZx+zpq4fgQr5iqzxUaUw2dpWRLIYHovHxRLSQL1Vb4aZOiHjj2ZJyJdw4Z4GqobIuE/++4EEofhUoct+wWcZiYcFjrkKx2FecxjHH5Sb8gIHDPtAZXiVCocKgUMMAA6SVV0FYjiK3/kDIpvpUUYYb9SB0/C8CigiNWI+8AWtbjpSGTXyq7zJWW+dlGqyNQP/HYPMTXO5/2hLB2a9ngHb/mmT/r29lJXgJyCj2RtKsTgCaRYj3XtmErqS/QjYQu1aA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	K79G/n88nwuNsfBj8x8xjjEkIsGWYM2NoZaTw9SnCZnvTP6Xsnj6fjbz92DM3B0LfYwb1atIw6UwXkvmxeSJOB/tkSCxTyCwza56Y81cTvgJ+7/CsqplsNUtj0q+QauhrFiUDGbDSX/iHTOWKgi1t8WKi1XqUn+o+ZHu8DG02RFI0VBZG19GgWBr7oDeEVQzVD1XCGpm6o5KjKG/l58sH3kvF5hrVUbRP1DxU9UvW7b3Hele5ZQSfVeNE0kCP4Rt08HAAuvAGaDpClwOfXhGstPjrC0jq1/BlkJWS87TYOd54a78xFD1ZLlvOacXEAN+UMsw2NXQZrF9Q8iWhOufAq6nSMJ+HlVVqb67NGsv4By/zsjduBpfBFWPt4pj0/wyBkQt3kPvDaviTqaOQZxMvm41A0YBbm4GrV9ilOrwTWsj3P8dQg6E1h/tCIu1F+51GcQrB6jHmHlHETOIdjD+3wku91Hj2nnr9fsXlhdlgiUWp4QVWhFdF6nSsHaqXump9OIE1/IkUyKqS39QTHiVMXuhJQ6xv/M+A5u8bfWdFUTYdQheCLbnNaKGB0+n6KVL4KSqok9XvVhVwkpfDmVgGQtnJMFuiikmuOgwXiNeR5Uc+itwxuD/ZseEb37ipp2hGyEHEEJ1H5LX3uNTQGvOmg==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 23:52:37.0102
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4b7c049-60a9-494b-60fe-08deb213e04f
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR16MB5743
X-Authority-Analysis: v=2.4 cv=KfzidwYD c=1 sm=1 tr=0 ts=6a066048 cx=c_pps
 a=bGC7MwCPNpf+Sn14ocfQJQ==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=NvsXeTrgx-CJMFV-xl94:22
 a=JuReohN-NG2ie_615HIA:9 a=CjuIK1q_8ugA:10 a=P0bj-C3X3jJDpopQwM1U:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDIzNCBTYWx0ZWRfX1pKnvKb+nLpU
 2y67m+Z9mLg8nrd585Hg4wkRWp7XDNZrNQzpGlUA7MkuirjLVQv8CJdArknKHab4HMiFj4v5R8d
 JdqejKuZF/MPOagLPRQWT+DxAD2MzsLgKLMg8NqYlMKRghu69IsCUkgOn/EA8tDkCn1CIMoFrAy
 S1qpWIjl6Cofatk6dJn0owPG044OagFGaUJlc82swBhRBWe7YnIvekL/2PyzjgJsBS1xLjxAfa6
 2SiFhrAklkp8VHv1DDhP+ikQSoi3dqeGsoNzLySKUfwd9ci2EzM6oHSjz5F4zIOUDkoW7XewIJ5
 LFW8iahjmk6DJW7ZVoFziJz63blpgk9y0D4DcJIdqXE386JCRksmxPIrffBa9D2jXJKEufmK/7o
 RYHmZf5MtyHHl1RSgY7WlKVn+92Ai8AHbnHRiHqc5M5YdkPnB5FwJ7ZazmZT/Ho6uzTWg00NJmU
 NExkaZdv8/AnVYUHCjA==
X-Proofpoint-GUID: n1HmrDZ4CR3WzmcsxT3u9onayF2Oap0G
X-Proofpoint-ORIG-GUID: n1HmrDZ4CR3WzmcsxT3u9onayF2Oap0G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_06,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605140234
X-purgate-ID: tlsNG-720697/1778802762-83F66161-E31F4F5B/0/0
X-purgate-type: clean
X-purgate-size: 1660
X-Rspamd-Queue-Id: BA2B6547DC6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,saarlouis.ford.com:dkim,azureford.onmicrosoft.com:dkim]
X-Rspamd-Action: no action

On Tue, Nov 18, 2025 at 08:00:00AM +0200, Mykola Kvach wrote:
[..]

> > +/* Set the default IO Bitmap. */
> > +int ioports_setup_access(struct domain *d)
> > +{
> > +    unsigned int i, offs;
> > +    int rc;
> > +
> > +    if ( pv_shim )
> > +        return 0;
> > +
> > +#ifdef CONFIG_HVM
> 
> ioports_setup_access() now allocates a per-domain io_bitmap for all HVM domains:
> 
> > +    d->arch.hvm.io_bitmap = _xmalloc(HVM_IOBITMAP_SIZE, PAGE_SIZE);
> 
> but I only see this being freed for the hardware domain in the
> existing failure paths.
> Where is io_bitmap freed for non-hardware HVM domains?

Missed that.
I will add something like ioports_release_access() to release resources.

[..]

> >
> > diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
> > index c341f012d005..ea34c3ae598a 100644
> > --- a/xen/common/emul/vuart/ns16x50.c
> > +++ b/xen/common/emul/vuart/ns16x50.c
> > @@ -783,9 +783,20 @@ static int ns16x50_init(void *arg)
> >      struct vuart_ns16x50 *vdev = arg;
> >      const struct vuart_info *info = vdev->info;
> >      struct domain *d = vdev->owner;
> > +    int rc;
> >
> >      ASSERT(vdev);
> >
> > +    /* Disallow sharing physical I/O port */
> 
> Should this be undone on teardown and error paths?
> 
> > +    rc = ioports_deny_access(d, info->base_addr,
> > +                             info->base_addr + info->size - 1);
> 

AFAIR, there was a feedback on that during the earlier iterations of the
series and the agreement was - no need to release resources on teardown
since the domain is being destroyed at this point. 

Thanks,
Denis

