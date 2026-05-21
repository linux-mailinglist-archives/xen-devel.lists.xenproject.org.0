Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePjGHfhgDmoD+QUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 03:33:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA8F59DAF3
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 03:33:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1314745.1584730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPsH6-00006X-C1; Thu, 21 May 2026 01:32:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1314745.1584730; Thu, 21 May 2026 01:32:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPsH6-0008Un-6i; Thu, 21 May 2026 01:32:36 +0000
Received: by outflank-mailman (input) for mailman id 1314745;
 Thu, 21 May 2026 01:32:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wPsH4-0008Ub-60
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 01:32:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPsH2-0012zv-V8
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 03:32:32 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a0e603e-2eae-0a2a0a5409dd-0a2a4509e73c-36
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 03:32:32 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a0e60af-2497-0a2a45090019-94a39217468c-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 03:32:32 +0200
Received: from pps.filterd (m0367123.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64KMLbO11599809
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 01:32:30 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com
 (mail-eastusazon11011044.outbound.protection.outlook.com [52.101.52.44])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4e9g97mba4-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 01:32:30 +0000 (GMT)
Received: from SJ0P220CA0017.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::27)
 by MW3PR16MB3723.namprd16.prod.outlook.com (2603:10b6:303:4c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Thu, 21 May
 2026 01:32:26 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:a03:41b:cafe::69) by SJ0P220CA0017.outlook.office365.com
 (2603:10b6:a03:41b::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Thu, 21
 May 2026 01:32:26 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.11
 via Frontend Transport; Thu, 21 May 2026 01:32:26 +0000
Received: from pps.filterd (m0426315.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64KMXRio2047155
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 21:32:25 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4e7afrvq1g-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 21:32:25 -0400 (EDT)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id PsGrwT9S7vRqcPsGtwpQ5w; Thu, 21 May 2026 01:32:24 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=fail header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=Puz
	TPHS5hV1NatTLHAKBVgLynXstsQwI2Jr2fksyHxQ=; b=DcONT0v5AX3HSFEJRdB
	m49Fi6WI+wTa/Ns5WB2+5PYA9f//rWv/Lo7kNK1p8hcICWRzqi1nQgpl09AZ8vuE
	/ONAAKw4m8YwO4N678dnJhsYDY7VkJKnbSwxqR4sJ4YvaSFCgwYB2epoCf4MTmrp
	Oa+IMPpLTJyqdXQLJQoY/90N0oYS/O7TWbiuxF2NARSXUlJwCYokLRCLV6op4qgy
	7mlXCrZgrVaBDiWPfF/IVZxIOrBe7FvUgu2qSeiYzdvAgP8522geqaVgfk5UyQ1E
	flHA2UdcQTp5tSrlmTq2qYIFP2QLLBjfJyoB3tEKPh3X/7fgMMW6NPou4APM9+GB
	ARA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h7kfaMiB9pTIHsw+UawH1gj0fs3ZJwHCm62gTc+be55dHxH923++cjO7Cy2LrZdyLNbevfkEIIBBwDT+qjG9TOYTinWFtZvf5ilL+foo470NWGQnm5eEdebEMo8NFucCJ4yfUACSyP0LUw1WRS0VKh+eoeMpiRwC1aeQh9Oe7CgnZ5nnBv+2PceKTx+M9JKhPYyN+TIyqz9hWpNE9X5TwuDdx4vDxCoQVS1yDJClDRg+UyEOtAJxihAQWNHbryB/CtNRsIG4UVJ/+4wlR+x6ZtqB4eCX0Pp2TsfcwABF88OVKJvuzTPvQemLH4AFWykLiPAuI6ury91B1fHak2xJ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VM02yeOMyT3DINqHV98cZq4VmXxuKOIjewDO7nNRGPc=;
 b=Lj7zrTcInv7Gz3rO8CdF3VMmSSROUgJ3hVRe7pMpQyzyfNWOnN4DtCOM2du1vi4Qdh/tG5xD4UKxbx9VP7DFgSOZko3vmT5aEenHi5bHLyWtsmEAaoWyGXdm06rM2a+jLdA95bRhx/91+DoMwh9efIpn3C8CnGQtF+4vpB8+tli1s/dKzENRL/WgrfWC9lwHeVAnzpJIXlroRXDfFpxyv3BdSO7g4xV9PnQ4Ow3DYQHqfQady1/i14Oeo1BQUj6lvu4IEG2gM0A+X1zHnVJEWOi5UvfY2sNV+eRcW935+Oks5ls8/MS0cIi5opaeOjYtspJOxU0llmY7JGV8TJJDLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VM02yeOMyT3DINqHV98cZq4VmXxuKOIjewDO7nNRGPc=;
 b=BzJN2aqaFGOoUQg3ZSIDTdmrzTBCQMuf5tG90yNWVNdUBwNy8stPhaFYrgkOq7fkfySXe+y/NTZUpH60lKQVrQdZfvRTbjM4OVjyPxdEW/xUHLzFcjxS9VcoCqQvWntAeGI9qst1lsJtoVyh0m++j+63ncpjaSkbw0kUSmVPxpI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to; s=ppserprodsaar; bh=PuzTPHS5hV1NatTLHAKBVgLynXstsQw
	I2Jr2fksyHxQ=; b=LeOeStt/ty6vJ/JlO3/jQoVvjhU26ai5gOt10w/hiwu06kV
	qHtRZ7kJ3hH/UxZF0R/g33vR3X7ifvd/DF99w5zlvQijdJJjlREtB1f/SjNTPHOj
	h25M0b76ZirAgjuXrmuAtM5sgFpevMfvI3q+r847F4AnuNph5aeJl86HjeZP4EsQ
	L1iRnnc5Z6DuEbNCyZeWyypiCW51Nkqq6hB81GBmfsxt40nq93vpTnkSFmf/3m2F
	u90qeWcDvxnu/47Z2uruGkXAMSR0V8LimE88sstBYEea64hcVr33uJV7gu6vHRhx
	H5oSGnOwO77idyJnYSyRQZkiWUWgOG5UHdvsn4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppfserpocford;
	 bh=PuzTPHS5hV1NatTLHAKBVgLynXstsQwI2Jr2fksyHxQ=; b=tbedkb5KInxa
	KNrZM8VaEUAf76ojiAezc7qPzDe+f18ajLmy6s5ZfQ4h2J0NL/svh6XNkfxRebqF
	7V/NawNKUHF9g5n5V4TZsDx/G/bMMAJ1JfRYY5sE2G1sfDGp6Q1t2RQBc6+ubNCF
	RxjQ6cgYpgHOBJj/KyNPwI9KQfml1cUTeqRVt1sWQgZfZR/mvN/cTYQR+6bUgPLH
	9saDbbD/EB4BBYEfefG/hzob6T4sfawmiimihneA6tgeMIw88eA9UwSHx34AOHAG
	qRH8+Os2QDAkAR35NCVs/+3sLghYavKRa5OvEGT+xD8st8/ne85hUkpZ3QR8NhZJ
	Kz0yOpNO9A==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: PsGrwT9S7vRqcPsGtwpQ5w
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Wed, 20 May 2026 18:32:21 -0700
To: Teddy Astie <teddy.astie@vates.tech>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Anthony PERARD <anthony.perard@vates.tech>,
        Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
        Julien Grall <julien@xen.org>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/5] pci: Introduce parse_pci_sbdf{_seg}()
Message-ID: <ag5gpWNFGHg79gay@kraken>
References: <cover.1779116255.git.teddy.astie@vates.tech>
 <1779117760.8631fc262581453bbf619ec5b2062170.19e3bae9f48000f373@vates.tech>
 <ag0e3ZgNDQN9A6Vn@kraken>
 <1779271208.8631fc262581453bbf619ec5b2062170.19e44d40e68000f373@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1779271208.8631fc262581453bbf619ec5b2062170.19e44d40e68000f373@vates.tech>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210012
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|MW3PR16MB3723:EE_
X-MS-Office365-Filtering-Correlation-Id: ab1cab3c-8940-4fe0-190f-08deb6d8d0dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|11063799006|18002099003|56012099003|22082099003|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info:
	m2Rm9tK1zP25DWEJm4dPFC0uIVdESxpc6t5ef1GTucXZBtP20a++f6qbaLdffhjPgSf9rWHJLL7Uoa2CA9VMsP9RnQJTgQmS0mvMg4vPR5KaWzup8ITPUkhgZyMA7SJ81qHgPF0MNf6uRKNr0edlwTZcVbNPdMmsNQyFcde44nQxTbStxGA6eCWI2BmNuz32mXnAUc/bPqwbD1HZaxyYFWSmpS1lenQQzQo4t7w/aZdaVV22oeLus1xBCMhGiLvVLKk5rJcKOfPqMw6+R8PrPGdJtgI9Z7vGcqHCMqnKjGvA+9RepeY5qpbP4afEe75op8X+xJvwzg17FFdImy5BOf2FoLLSwGbvOjmimVj+2JPnlJberzJb7kBbGfvH5++VmaJ/1aDWELYAY/R2LsthraOGlS5GrLPtGIZoYNDmRegcoOnTOlIbQyszgBV2iBukhxfSpKeXaHVUQ/fy7G9FX64NclY0nX+R/DRD89Lk9jv1/HxkjuU81svUJoR7qIiRHG5trENQIRdg20YD80bFHIOU4TqtmHEzOlM1t+gAJ2/gXFnH36VQaWyCzBl3Y/6VHjkIgMBt2PUN1e2W/2cL3Yd/6jOuNjypFORWmI7Xyao5e/pgUCSHbDbJTkTf1BA0oguixBDxRJ2UQMcfPiGKc7zRL/LqJbiG6kjp1lOvVVxaIa0jt9r18eEIxl0L+1dMSAQ0nbr5unrJ/15oYkCx0tPa5nHJ3SJOo1wHmy74dQk=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(11063799006)(18002099003)(56012099003)(22082099003)(4143699003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HJLkwFwwQok1eTCddzNd3wzzMmY6lgHXSW2Zm6NQ8tvWDH1PbuNJ4TPeL60ToX5+tvBv6m5Wi6IWNNwcBEWpCaHEhOKi8WbbqGhAYknzm/vkQc/9bSk2MgQifwEkZ/SDqNIDp7nqrWGpDIiWR2bNBz2nt2QLTtsBicYkdFaJuxIzya7zedZSxsrdgdLC8Kqt0RR27cEMh/vT+edJp7W72r2ytNhVagSIXrlJJ62hje3oyR4hWOHZ82/mCTQXMSsFS0Aq1QY9HaFI1Al6XBAh9u1inrik9PMRoIp1HG3y4m2Gh/44h962KMdC/KQO7HSO1WGAmmk1fk8F3Redsqzmqbk4okyuoPxMKsTLxglhCfvYNKThB6uIUk2ucwLZc7TI3maIpbobKHBS59TA69GorFWxXwOeiLR+AxMx0eS7ao78w9lUKm7JglkWg+8oE3pz
X-Exchange-RoutingPolicyChecked:
	NvaSErCxhOPrzZahQGHh6abUQRAm7HRqQ9/9TECCQh+HhRbSNQMLB+3OB82s4mEG9nfgw9xb6n/RxeZhQFurRBZatTPBDQ9sh4MAt2PPV7W95gVYaAMYZpbhnhQYeYEiefahAy8yfQS3fNO5lJNZVYEgx5DOOJD0/l/RCZHxHyrBEdiPIpqhP4FOO//KOSSBefgVHHkhR4wTCCMLP0AY7+FQ/LhjKauCLAKmC0pWw4mUf12gc9a7C+0tzl/GYvHkFTTF66RB1as2a/5NFuhmKoYhoann9zP9+/K21xi7fGWohZTLgxzlqLxfAK8lLnESQQeERGlWlVbUT+o12c3z0w==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hERbyJt4OpBuhsqAfukj6lccSzz4kK8B83c1gx9Low5YkLANZdT2taEJwNVmZ2Dok5iED0vXXixwj6Orf4Ek3hPRco+UdD12A6XCZXZIhRumB6Hxmo7K8MNEWS7eTBkG4MHMPbj8VIZs4LfWvTJimPi5B2Q5I/9ztoU6Ne3tjlRXKlX14oFUdcAP+xrXUCz8HhyP5nLqKYQUbal1QEWEf8v+SvREdJCsb5vKavWvBjRk1BPbTuTKQjuCLuDE7IHQOEzzVy2i2sNrEGmGDdYIRprA31RmCC/4VGMDUlIucHCi5nK4++GY8OXHzq3LCjCm/DV9URTRZsycwz9W+HLajvdy1heuHfX5Zf1HsaAO9+xlNXUVuMxG2+sC60oM2NKcPghf6+VgVKiJfQ4Z2RUlmxhNIqhsD4E4n0FmRkoOSmZREyVVhlfbX6mNltbveYr4dDYVCo5t0biaYIPsLtT+ByRfg4Eb9U0xLyEisxIzir9syhlpldVKJ6gvsPagTL7Wtz/O29oE/38LhhenN2cbR3ZIQyx3ogWafzuOIm02GEcoTxngD+khZ3nTZ+Halqj/prBtxh8XofhrORnFDMIp6uvsYKv83vpVFfK0xfrNV3gHk7TCu64EyNajMqsNuM3Mb8w9tNZYq4S8wsMFOhsVNQ==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 01:32:26.3707
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab1cab3c-8940-4fe0-190f-08deb6d8d0dd
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR16MB3723
X-Authority-Analysis: v=2.4 cv=SvagLvO0 c=1 sm=1 tr=0 ts=6a0e60ae cx=c_pps
 a=7DaYBXCyACNMaGCgbs47fw==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=8nJEP1OIZ-IA:10 a=NGcC8JguVDcA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=N9_n2FxmZfwfyRXvS9-E:22
 a=cbNQJ9GKAAAA:8 a=L6KX61kmC91rAXb0BzgA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=O8hF6Hzn-FEA:10 a=P0bj-C3X3jJDpopQwM1U:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDAxMiBTYWx0ZWRfX07U6W3J1Irlq
 c6VWfhEzpqMeIFvZls7ilzfEuoKoJ8ffmFgM6es+NypV2a/CEmSKOftPqbNnFRxtSQ0ppDreQ5a
 h1eWGFinSTWJ3VGpc5fSCbyivi5tbw08bZeX1lhpPMX34qWuEjwm03dSaCd3v9SfI7bTK1GC9UJ
 16LySX4l2BWH+MGzFnShNN56neBBjeFR+0II5jP1hb1dTaUhy43lVLMUSKhprWAOHUkc4AUGSZd
 +Nmcq/8XmiuBzdMhaTT5Qfzffu9XJ5V0Ryk7WpzYQN1YxAP56ejgAzX9XMBD/OcUVV5TQQ1KXQg
 CmWNWMCkHmqi1eOI9UMUy6SkbgrRrnjI4u2RSsd9+HO4Fnv/EavfkP6PhhknUr7zKU9jApYmlLT
 3H+85SdWed7CKruoz07peReUqUvG7WkS5eeGGxZ0oiFu3hw3+DDpW0T1Lg2ut+i0DXOV/+OBklL
 iHUwjqLaNEZ1UFOi6Fg==
X-Proofpoint-GUID: -g8i4shkhdxQz2SydSNZcamrPRLBV6W7
X-Proofpoint-ORIG-GUID: -g8i4shkhdxQz2SydSNZcamrPRLBV6W7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210012
X-purgate-ID: tlsNG-bad1c0/1779327152-37374A53-5231C720/0/0
X-purgate-type: clean
X-purgate-size: 2198
X-Spamd-Result: default: False [0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[ford.com,reject];
	FORWARDED(0.00)[mailman];
	R_DKIM_REJECT(0.00)[azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:-,saarlouis.ford.com:+];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWELVE(0.00)[16];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_NO_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 9EA8F59DAF3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 12:00:07PM +0200, Teddy Astie wrote:
> Le 20/05/2026 à 04:43, dmukhin@ford.com a écrit :
> > On Mon, May 18, 2026 at 05:21:25PM +0200, Teddy Astie wrote:
> > > In many places, we're parsing a PCI string into individual parts
> > > (seg, bus, dev, fn) and then transform it into a pci_sbdf_t using PCI_SBDF
> > > macro. Rather than converting from parts to pci_sbdf_t and vice versa,
> > > introduce a new function that parses a PCI string into a pci_sbdf_t structure
> > > directly.
> > > 
> > > Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> > > ---
> > >   xen/drivers/pci/pci.c | 18 ++++++++++++++++++
> > >   xen/include/xen/pci.h |  3 +++
> > >   2 files changed, 21 insertions(+)
> > > 
> > > diff --git a/xen/drivers/pci/pci.c b/xen/drivers/pci/pci.c
> > > index 084be3880c..1d06cb035b 100644
> > > --- a/xen/drivers/pci/pci.c
> > > +++ b/xen/drivers/pci/pci.c
> > > @@ -202,3 +202,21 @@ const char *__init parse_pci_seg(const char *s, unsigned int *seg_p,
> > >       return s;
> > >   }
> > > +
> > > +const char *parse_pci_sbdf(const char *s, pci_sbdf_t *sbdf)
> > > +{
> > > +    unsigned int seg, bus, dev, func;
> > > +    const char *out = parse_pci(s, &seg, &bus, &dev, &func);
> > 
> > IMO, both parse_pci() and parse_pci_seg() should be merged into
> > parse_pci_sbdf() and parse_pci_sbdf_seg() at the end of the series,
> > since there will be no remaining consumers of the old APIs.
> > 
> > What do you think?
> > 
> 
> That was my plan, but parse_phantom_dev() (in xen/drivers/passthrough/pci.c)
> wants to parse the PCI string without the function part (i.e XXXX:YY:ZZ)
> which can't be expressed with a full SBDF parse function.

I see.
Perhaps adding "SBD" parsing in-place in parse_phantom_dev() is OK?
Like duplicate a small amount of code but drop old APIs.

> 
> It currently works by passing NULL to `func_p`, which has special handling
> in parse_pci.
> 
> We could eventually allow omitting PCI function and make default it to zero,
> so that we will be able migrate parse_phantom_dev to this new function (so
> it now allows parsing full SBDF, but ignore the function part of it).
> 

