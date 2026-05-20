Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0D1JHD4rDWo2uAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 05:32:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D47E587434
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 05:32:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313525.1583639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPXf2-00086z-GM; Wed, 20 May 2026 03:31:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313525.1583639; Wed, 20 May 2026 03:31:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPXf2-000848-DS; Wed, 20 May 2026 03:31:56 +0000
Received: by outflank-mailman (input) for mailman id 1313525;
 Wed, 20 May 2026 03:31:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wPXf0-000842-Qt
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 03:31:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPXez-00BGbx-OY
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 05:31:53 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a0d2add-bab6-0a2a0a5309dd-0a2a4508ec9a-42
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 05:31:53 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a0d2b28-63b5-0a2a45080019-94a38ff13634-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 05:31:53 +0200
Received: from pps.filterd (m0482515.ppops.net [127.0.0.1])
 by m0482515.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 64JNTDbr1972049
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 20:31:52 -0700
Received: from ch5pr02cu005.outbound.protection.outlook.com
 (mail-northcentralusazon11012013.outbound.protection.outlook.com
 [40.107.200.13])
 by m0482515.ppops.net (PPS) with ESMTPS id 4e91k1h6bp-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 20:31:51 -0700 (PDT)
Received: from MW4PR03CA0159.namprd03.prod.outlook.com (2603:10b6:303:8d::14)
 by SA2PR16MB4201.namprd16.prod.outlook.com (2603:10b6:806:14c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 03:31:42 +0000
Received: from MWH0EPF000C6195.namprd02.prod.outlook.com
 (2603:10b6:303:8d:cafe::a4) by MW4PR03CA0159.outlook.office365.com
 (2603:10b6:303:8d::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.23 via Frontend Transport; Wed, 20
 May 2026 03:31:42 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 MWH0EPF000C6195.mail.protection.outlook.com (10.167.249.105) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.11
 via Frontend Transport; Wed, 20 May 2026 03:31:40 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64K0bmVC1617510
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 23:31:39 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4e7777ue3k-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 23:31:39 -0400 (EDT)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id PXejwCy5KFYU6PXekwWqAg; Wed, 20 May 2026 03:31:38 +0000
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
	:references:subject:to; s=ppford; bh=ZkVQ/+lc7/A8VC6aUc0zG6RgnHm
	K/DD/MKcdedcbPMI=; b=tPNKo7Cu5t5dcdsL7rdoshidtkPg5w8r5HzIiOAYJxd
	YblCFOOoETElrH6aGNAoLRP4fhEIoE2XezbzuOFaseiZTC6WdS+DQGHc/hWNtjHc
	L7jGN/GNC5zqYi2fcMx5r5qEsTnImXhfI+OtUzvVIN93b88Y3NeNPnfVVPD1X33h
	FWF9MeqXSeKP82tp27SvUDRFDp0lVI5VD3ylnWPWjrJDy6KgQzIrIYQdnTYyDjwF
	3ZsECxwn4m6WswdG9ajZqFddjUEpX+OaicdFeBMtwZ9fs3PBRUlnbVuFdMPe6S4F
	S2Ck82MfRWPEzcQVU/e7ShjTivz5FO3rSG22/W3ajjg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H4mG2HtCEe/dZxFc6ophkCYMPHGgbJggv5BHUjYfMJ9GkC5gFMxD3DlJiPDLGDGqwdlxsdlX3mZNZ0h0s6k939aH60nEtFveTwUFhsrMlLnU6KfPiNcyQfcHF56HvppBbs9+LkCZ4IPb3HsIGCuYcMLwxwiBWOc+kTVvM9Ub2QzL4eG8tkCFCPdZ/F4Z5ZJ/dVzraACXbFz6cmOqOMDTSBQ3XBgV5mESs7hUhvz0/d8wRLoDxAdmmpqlm88hGOYucniSUiwZP0j1uxTzAOsHr4IyplqhTVRNJpotIGPUy1YVW0MHetAkrWIdzcIrcrNwBlAGIOR1lMHcWb5ZgG0GTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZkVQ/+lc7/A8VC6aUc0zG6RgnHmK/DD/MKcdedcbPMI=;
 b=i8OhMOjT1xiaTVTOIeCWbyfhOVbmKDgmp5zTOneb13GPp6XJb7ARZQmsoUxzhijL5L1pp9WSgjfDcRcMA9V7BkA9Xu2MW8ZeAYS/S9xYzzUXIKUNi7+qL9lMXLY/prphsC5kd1waZBCYYm/xOGbSUEBXSprnCv4PIzSToGhNjXIcECcJSLcy+p874oKO/Bl9vMMWN9EvLG3cpqnpH1mZBAVmqSQ+GTX0rqrOigKaT9P84uxr1ORd15vbOG7sDMbpuwEy/rBwzUF3pXFLb6SpN35RH69EAdmCQeH0/Kaft1nBJ75SibBarWvKnFvNy3D+9yQOkij+XC93hgL0sA174A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkVQ/+lc7/A8VC6aUc0zG6RgnHmK/DD/MKcdedcbPMI=;
 b=VAsVkrJO61YNd0VMyf7wP41Ta40TxccHs4x1ty+xZlXsponvtthk0zvVCG6+ruz2d7f6n87IVvy5t3aCDujk+gIzsCDZzji4pDdm0wFORDqNDvD+YTGr58NWQQsQiotbgWpV00tHyzgPlZdpyFMUlQpfraQQWivuvXWgFV7phfQ=
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
	 bh=ZkVQ/+lc7/A8VC6aUc0zG6RgnHmK/DD/MKcdedcbPMI=; b=EEoouxSAIwt4
	LoDC/qorYKNnJvYPMyevv0zInTT4GhPLlp3f27e+5/LdioNjK6OjiIstxkooZp89
	O/rWwj3yNG5fSYCc62S2zNhroSbS1RdTgkiwbyTfeVYBdp+YLcHr5ZMOo0oRUGei
	Nhsi0hISFdSHfVUgCgchfDt/a3cTvycMjVnIzaM78+gP714bm30iV04AiZ/b1+fJ
	5pKs9Z2BggN/d6//UWiLGviY8tCj0+6Rvi4XXzL/fa/BpcEmJjodkpClRUA5LQ3N
	68+DVe/29DmTN0P8oEPwWa3sQSdcX6AtgbUIvJxlyCKu9v58pL/qjBlAJ37f+m4t
	gE3G9MlK3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=ZkVQ/+lc7/A8VC6aUc0z
	G6RgnHmK/DD/MKcdedcbPMI=; b=tj+P5LoEAylnly4jnHbHBcjbXh73wrjc7L5y
	QaOhkRHn6+9x9tAlCFG4dIvIzbfW4OTY3ohB6fJKqulJw0A7rMYfqyVQ11WQF80y
	hndIH5xYoPhYPvzpibw1DfaNqoYHkn9SEGAUWYWrb9RnWl96XKS+JZpW29de5jfi
	MzEdCTNjmcZTjsTEb6e3A6FtC5QJTyNfX5tA/htkG8F8RNdOD3VU6m4Xi6flkhJF
	b4yH8Zt4CGDeZ+i+wgQj5WL3hIGnq9xvP5MwD57fufyhTa0J9VApehr9F2qs+3rk
	cxDt0ENwuHo09wNwGTmhrngYOc6OOdq05ld0Nr/Lr4g8B5DysQ==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: PXejwCy5KFYU6PXekwWqAg
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Tue, 19 May 2026 20:31:37 -0700
To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
        Anthony PERARD <anthony.perard@vates.tech>,
        Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
        Julien Grall <julien@xen.org>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH 4/5] pci: Parse into pci_sbdf_t directly
Message-ID: <ag0rGfmOwqMFXvi5@kraken>
References: <cover.1779116255.git.teddy.astie@vates.tech>
 <1779117763.8631fc262581453bbf619ec5b2062170.19e3baeac47000f373@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1779117763.8631fc262581453bbf619ec5b2062170.19e3baeac47000f373@vates.tech>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200030
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6195:EE_|SA2PR16MB4201:EE_
X-MS-Office365-Filtering-Correlation-Id: 30c0b826-463e-4410-6c20-08deb6204e92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|13003099007|4143699003|11063799006|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	YbMkH1uSRow2W2RxhNhmz6mIW/iQukeXoxXqgTYfkkjMabQtjvhSxQqUdJlbp6lLyYi23TbnMCYWbtXpmsNhO0acAwiPlmLZxXHBVSrjsuAbf9FGei+9SWN4Qsl+N+IIrYeGbQxs+kiCG1lgA7/udTTMJdb49Mr8xQdVAyYzLSk1x6DaGgkYDjvFl14V7xl6PV9k+L25vL582txbQ57vwB+9FattAsA0yBWKK6ubNCJYCFIag8r20UnJaxDg/y6OtRV/OUzZg5vZ64yuBUNO7ziciPb98J1NigETc5poUNVb5XtVuiC0euiqByXd7QtqlHnZiUMX5a+yUqhWyeGddAT9AEtzU7tFPOozX8Gy/U2/bV+tWuhV6UR8lUUt0vWtukPOhkePn0g1UjvAp8l0qp6gPz1FvmdBKNg7EsubIlWqbgfoy1xwvdVAWBatWuOsCSZabF1vTMWTUtR/BiBta4D+LI1aUgyThho7EbS2uPyNsxgd51S/9EqgKhzcYC5SFrlJO8Z9ORrYSlHnsgzgLzgESl9pbPmPjxl/kUdUW4PgB6J+HkrtNkZTgL9eQs2brRMDiDrzLAy7SXprW6Ha99ZGFdtl5UtyqcdMmdaM3IAkI1Vf8aO3scjXPoYAaqiGTVribkd81540SOjptg3JyEG5vsMcQF8yddgdL2t9UFg=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(13003099007)(4143699003)(11063799006)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/ukFXrrXLBNy2cf5wZnxfHLNjYei08aFIdayi4g+D/4PBtkghWGMwjwDzrozfnNDp41Cov7Mv2VglBRqB1FnRuaEpwBJNG0aUh/pwUP3G4PddUHrtG+v74Egb75YjCYaFPyLPteOyfS4KNxgrnyci1BmC+0NpBtxGGGVDHp7voJAOyRyXz7GBOnFUHulDLE3Y2Ri4L++r1IF8M+m10I8WtI//GcBQmioNPXx9jiQgTigZq1wjYG+ZRNtm9u3Fj3waFVe6r2RGVHQLPifzs+/M+HVJrA6KHHoTDtcr5lu8pav2vz5vOBEbdFZJctyKkcZObgf/OiCcaPP2ekz/pzZKwOa0etbrnbo4fpD6gTcrxu+rcBN+Tj2nXj2g+hYJ8IurpVJ30F0rnwO5A+O8x6gK6p15qOkTEfrYYGzPuYQdz+f3X1rV5nqAZgjwf/pQg0E
X-Exchange-RoutingPolicyChecked:
	N5TIpcPAB3C5oejN+/IrUzEJxFP/MQ0kLK8Wb7Sp/Imls+y7ja0k4oduS0Ru9KiBWA2kDLk0zCAf8OKJ/IiJJm8vTyhKkkl1SxvRASfP45AYgWoz0gbkFImwnt7lOPWkUreb1SKhSFCwNSo5tSno8U9d9b2HQOrJgrgYLjXzHgH+DSN1K1sXswb/8qZwhxmM/rZZBH5/xMSvdJHqH2YPdCPcya4pR0tcmQjR83yN3p27t/rr8RVyYXzq99PL2K539CjfTaqiYLFYMz+CWAgcZ3WVvZ8BOE0EydZEvyEqS/skPtD1bfHvpid64hvm1ySTYds25dmKC/ZMt2RQHr2hLw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	107gY8brd5yscvZRicMG1ks75+xMhzEzDRk97XErBucD2jB3xK8ny9KM+xa/QfF3UVbsFtEIpGWgq6u2P39hWmu+0Mw/knQ509bT/8xquWJLGAfCZ64wJ7sKLCHQU4jRQVHaCzNvPlYUF7ZyaDLB0tash5UmR87nutUJ15EN9gVvziVSZaqSFKE3oaJ9LFtUDqzaAINA33o69A2lObnwMNDEZ1qOT1ZmR4Hx7c7f51+ccv07RW5eK7O41TwqeHwMMl5X9qVQPrAuGcV9/U6Dxy5Lfo7QHgnvnVDXVm3QcAupOgHO0MVHWMkA72AmtTa5aNWeb939TzVZ4YO0RHjZR6BJjX2zQUdtdewNYqPBiPzVhNstFkjz92uWp8fK0JxgJXwFkCDuwtLCyHTk2v5S9d6SASYCPgsz/8VyA46tqx3qmFffk5x9VVaecHJ9DGzfU4ngdwvXBn+AM7CCSEcGt8Uo5PhgZGd/ueWFZcDx0itgWSMoqSxhxyXVHWgHc2+vfFPS/HjCfhm+E3YWNN2sBemf5HBCCdXeRr7gUEfU01ykttrAdu97JaqYVtNtgInSBt567gTMNaMEtOIK0Ps5OBjay4rdxgtI5p3me7AzwPBPn8G6s6IQgjz7uixM3SXNz5vtJ5Rx/3VkB7AOoUx4mQ==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 03:31:40.3768
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30c0b826-463e-4410-6c20-08deb6204e92
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6195.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR16MB4201
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDAzMCBTYWx0ZWRfX+rcjIJJBZSRA
 x4UNPRSj84g8ZOgKIWXCED2/sy7a12ge+XFvkW1HdkJU4S8CHqOqmURz2ke7LFXtLNfsXUn/At4
 SP7LCHvtV3rZJ8ygOVu1vxPuuC2V7o54K3eqz5w5mMvOHqffiwgr9FGFfsV8Cl/dP+z7KvXrUsH
 VTRolBkb/O3Eveu4x7L0c8rpsjX9t7pniFQ9WvMT4IJXU63nemtly9CC6/pRCQcJs8K0xHrZYRZ
 JpmcmCWLHEbzDMIjk7S68OYEsjZK5V4pj6PSIbbe7r2amM6JH5A44y5Q9DStcZTsh3mgkxzMl5Y
 ZpbbUM6zWOHOcMJNqRWMNGJ2lhyGhx2/PP3jfur6eCbM6PGB1K6WQtMhAWJoZcWmkt+LifRHB/b
 1/JyhDD3rbOjieLa3Umuss+eUDcA4AW9vsgDvT6H7ce9GmgG1WdCAbZzG4rgHVZTMVOvOYjYAaX
 3VZp4PeHOAROaKKHIHA==
X-Proofpoint-GUID: NTDOGD7rqT73AmNQmLFpZTMdabmOwQ0a
X-Authority-Analysis: v=2.4 cv=Ne3WEWD4 c=1 sm=1 tr=0 ts=6a0d2b27 cx=c_pps
 a=qiA9p8iyC6UfobZpVQ7+mQ==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=0GA0A_IKJoUHBEAzNTkD:22
 a=-RI0ju8yAAAA:8 a=1ix22XOsDN3X6mACLtEA:9 a=CjuIK1q_8ugA:10
 a=3whSkbs7g9Me0DR5EJEX:22 a=UsJdYLK5l2RqpxBViBoK:22
X-Proofpoint-ORIG-GUID: NTDOGD7rqT73AmNQmLFpZTMdabmOwQ0a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200030
X-purgate-ID: tlsNG-c1860d/1779247913-C5187DB1-F8952286/0/0
X-purgate-type: clean
X-purgate-size: 9204
X-Spamd-Result: default: False [0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,saarlouis.ford.com:dkim,ford.com:dkim,vates.tech:url,vates.tech:email,azureford.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 9D47E587434
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 05:21:28PM +0200, Teddy Astie wrote:
> Use the newly introduced parse_pci_sbdf() and parse_pci_sbdf_seg() in order
> to parse into a pci_sbdf_t directly instead of reconstructing it afterward.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
>  xen/drivers/char/ns16550.c               | 24 +++++++++++-----------
>  xen/drivers/char/xhci-dbc.c              |  6 +++---
>  xen/drivers/passthrough/amd/iommu_acpi.c | 26 ++++++++++++------------
>  xen/drivers/passthrough/vtd/dmar.c       |  7 +++----
>  4 files changed, 31 insertions(+), 32 deletions(-)
> 
> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> index 878da27f2e..fa2d0e5991 100644
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -1572,22 +1572,22 @@ static bool __init parse_positional(struct ns16550 *uart, char **str)
>  #ifdef CONFIG_HAS_PCI
>      if ( *conf == ',' && *++conf != ',' )
>      {
> -        unsigned int b, d, f;
> +        pci_sbdf_t sbdf;
>  
> -        conf = parse_pci(conf, NULL, &b, &d, &f);
> +        conf = parse_pci_sbdf(conf, &sbdf);

Original logic considered only devices from PCI segment 0, now
all segments are allowed.

I think docs should be updated.

>          if ( !conf )
>              PARSE_ERR_RET("Bad port PCI coordinates");

Unrelated to the patch: I think it will be good to print the bad
string value in the error message.

> -        uart->pci_device = PCI_SBDF(0, b, d, f);
> +        uart->pci_device = sbdf;
>          uart->ps_bdf_enable = true;
>      }
>  
>      if ( *conf == ',' && *++conf != ',' )
>      {
> -        unsigned int b, d, f;
> +        pci_sbdf_t sbdf;
>  
> -        if ( !parse_pci(conf, NULL, &b, &d, &f) )
> +        if ( !parse_pci_sbdf(conf, &sbdf) )
>              PARSE_ERR_RET("Bad bridge PCI coordinates");
> -        uart->pci_bridge = PCI_SBDF(0, b, d, f);
> +        uart->pci_bridge = sbdf;
>          uart->pb_bdf_enable = true;
>      }
>  #endif
> @@ -1671,22 +1671,22 @@ static bool __init parse_namevalue_pairs(char *str, struct ns16550 *uart)
>  
>          case port_bdf:
>          {
> -            unsigned int b, d, f;
> +            pci_sbdf_t sbdf;
>  
> -            if ( !parse_pci(param_value, NULL, &b, &d, &f) )
> +            if ( !parse_pci_sbdf(param_value, &sbdf) )
>                  PARSE_ERR_RET("Bad port PCI coordinates\n");
> -            uart->pci_device = PCI_SBDF(0, b, d, f);
> +            uart->pci_device = sbdf;
>              uart->ps_bdf_enable = true;
>              break;
>          }
>  
>          case bridge_bdf:
>          {
> -            unsigned int b, d, f;
> +            pci_sbdf_t sbdf;
>  
> -            if ( !parse_pci(param_value, NULL, &b, &d, &f) )
> +            if ( !parse_pci_sbdf(param_value, &sbdf) )
>                  PARSE_ERR_RET("Bad bridge PCI coordinates\n");
> -            uart->pci_bridge = PCI_SBDF(0, b, d, f);
> +            uart->pci_bridge = sbdf;
>              uart->pb_bdf_enable = true;
>              break;
>          }
> diff --git a/xen/drivers/char/xhci-dbc.c b/xen/drivers/char/xhci-dbc.c
> index c1ff528de6..c7fd554be0 100644
> --- a/xen/drivers/char/xhci-dbc.c
> +++ b/xen/drivers/char/xhci-dbc.c
> @@ -1357,9 +1357,9 @@ static int __init cf_check xhci_parse_dbgp(const char *opt_dbgp)
>      }
>      else if ( strncmp(opt_dbgp + 4, "@pci", 4) == 0 )
>      {
> -        unsigned int bus, slot, func;
> +        pci_sbdf_t sbdf;
>  
> -        e = parse_pci(opt_dbgp + 8, NULL, &bus, &slot, &func);
> +        e = parse_pci_sbdf(opt_dbgp + 8, &sbdf);
>          if ( !e || (*e && *e != ',') )
>          {
>              printk(XENLOG_ERR
> @@ -1368,7 +1368,7 @@ static int __init cf_check xhci_parse_dbgp(const char *opt_dbgp)
>              return -EINVAL;
>          }
>  
> -        dbc->sbdf = PCI_SBDF(0, bus, slot, func);
> +        dbc->sbdf = sbdf;
>      }
>      opt = e;
>  
> diff --git a/xen/drivers/passthrough/amd/iommu_acpi.c b/xen/drivers/passthrough/amd/iommu_acpi.c
> index 39ae637959..7b40da33ae 100644
> --- a/xen/drivers/passthrough/amd/iommu_acpi.c
> +++ b/xen/drivers/passthrough/amd/iommu_acpi.c
> @@ -682,8 +682,8 @@ static int __init cf_check parse_ivrs_ioapic(const char *str)
>  {
>      const char *s = str;
>      unsigned long id;
> -    unsigned int seg, bus, dev, func;
>      unsigned int idx;
> +    pci_sbdf_t sbdf;
>  
>      if ( *s != '[' )
>          return -EINVAL;
> @@ -692,7 +692,7 @@ static int __init cf_check parse_ivrs_ioapic(const char *str)
>      if ( *s != ']' || *++s != '=' )
>          return -EINVAL;
>  
> -    s = parse_pci(s + 1, &seg, &bus, &dev, &func);
> +    s = parse_pci_sbdf(s + 1, &sbdf);
>      if ( !s || *s )
>          return -EINVAL;
>  
> @@ -707,7 +707,7 @@ static int __init cf_check parse_ivrs_ioapic(const char *str)
>          }
>      }
>  
> -    ioapic_sbdf[idx].sbdf = PCI_SBDF(seg, bus, dev, func);
> +    ioapic_sbdf[idx].sbdf = sbdf;
>      ioapic_sbdf[idx].id = id;
>      ioapic_sbdf[idx].cmdline = true;
>  
> @@ -719,7 +719,7 @@ static int __init cf_check parse_ivrs_hpet(const char *str)
>  {
>      const char *s = str;
>      unsigned long id;
> -    unsigned int seg, bus, dev, func;
> +    pci_sbdf_t sbdf;
>  
>      if ( *s != '[' )
>          return -EINVAL;
> @@ -728,12 +728,12 @@ static int __init cf_check parse_ivrs_hpet(const char *str)
>      if ( id != (typeof(hpet_sbdf.id))id || *s != ']' || *++s != '=' )
>          return -EINVAL;
>  
> -    s = parse_pci(s + 1, &seg, &bus, &dev, &func);
> +    s = parse_pci_sbdf(s + 1, &sbdf);
>      if ( !s || *s )
>          return -EINVAL;
>  
>      hpet_sbdf.id = id;
> -    hpet_sbdf.sbdf = PCI_SBDF(seg, bus, dev, func);
> +    hpet_sbdf.sbdf = sbdf;
>      hpet_sbdf.init = HPET_CMDL;
>  
>      return 0;
> @@ -1399,13 +1399,13 @@ static int __init cf_check parse_ivmd_param(const char *s)
>          }
>  
>          do {
> -            unsigned int seg, bus, dev, func;
> +            pci_sbdf_t sbdf;
>  
>              if ( nr_ivmd >= ARRAY_SIZE(user_ivmds) )
>                  return -E2BIG;
>  
> -            s = parse_pci(s + 1, &seg, &bus, &dev, &func);
> -            if ( !s || seg )
> +            s = parse_pci_sbdf(s + 1, &sbdf);
> +            if ( !s || sbdf.seg )
>                  return -EINVAL;
>  
>              user_ivmds[nr_ivmd].start_address = start << PAGE_SHIFT;
> @@ -1413,16 +1413,16 @@ static int __init cf_check parse_ivmd_param(const char *s)
>              user_ivmds[nr_ivmd].header.flags = ACPI_IVMD_UNITY |
>                                                 ACPI_IVMD_READ | ACPI_IVMD_WRITE;
>              user_ivmds[nr_ivmd].header.length = sizeof(*user_ivmds);
> -            user_ivmds[nr_ivmd].header.device_id = PCI_BDF(bus, dev, func);
> +            user_ivmds[nr_ivmd].header.device_id = sbdf.bdf;
>              user_ivmds[nr_ivmd].header.type = ACPI_IVRS_TYPE_MEMORY_ONE;
>  
>              if ( *s == '-' )
>              {
> -                s = parse_pci(s + 1, &seg, &bus, &dev, &func);
> -                if ( !s || seg )
> +                s = parse_pci_sbdf(s + 1, &sbdf);
> +                if ( !s || sbdf.seg )
>                      return -EINVAL;
>  
> -                user_ivmds[nr_ivmd].aux_data = PCI_BDF(bus, dev, func);
> +                user_ivmds[nr_ivmd].aux_data = sbdf.bdf;
>                  if ( user_ivmds[nr_ivmd].aux_data <
>                       user_ivmds[nr_ivmd].header.device_id )
>                      return -EINVAL;
> diff --git a/xen/drivers/passthrough/vtd/dmar.c b/xen/drivers/passthrough/vtd/dmar.c
> index 9f9b639eba..dafe1b62f6 100644
> --- a/xen/drivers/passthrough/vtd/dmar.c
> +++ b/xen/drivers/passthrough/vtd/dmar.c
> @@ -1215,7 +1215,7 @@ static int __init cf_check parse_rmrr_param(const char *str)
>          do {
>              bool def_seg = false;
>  
> -            stmp = parse_pci_seg(s + 1, &seg, &bus, &dev, &func, &def_seg);
> +            stmp = parse_pci_sbdf_seg(s + 1, &sbdf, &def_seg);
>              if ( !stmp )
>                  return -EINVAL;
>  
> @@ -1224,12 +1224,11 @@ static int __init cf_check parse_rmrr_param(const char *str)
>               * Segment will be replaced with one from first device.
>               */
>              if ( user_rmrrs[nr_rmrr].dev_count && def_seg )
> -                seg = PCI_SEG(user_rmrrs[nr_rmrr].sbdf[0]);
> +                sbdf.seg = PCI_SEG(user_rmrrs[nr_rmrr].sbdf[0]);
>  
>              /* Keep sbdf's even if they differ and later report an error. */
>              dev_count = user_rmrrs[nr_rmrr].dev_count;
> -            user_rmrrs[nr_rmrr].sbdf[dev_count] =
> -               PCI_SBDF(seg, bus, dev, func).sbdf;
> +            user_rmrrs[nr_rmrr].sbdf[dev_count] = sbdf.sbdf;
>  
>              user_rmrrs[nr_rmrr].dev_count++;
>              s = stmp;
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

