Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cHcIFj0sVmrY0gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2026 14:31:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D98754941
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2026 14:31:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ford.com header.s=ppford header.b=Oh9MmKoR;
	dkim=pass header.d=azureford.onmicrosoft.com header.s=selector2-azureford-onmicrosoft-com header.b=IwV7BiVn;
	dkim=pass header.d=saarlouis.ford.com header.s=ppserprodsaar header.b=l6pQq3WQ;
	dkim=pass header.d=ford.com header.s=ppfserpocford header.b=Yks6AME4;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=ford.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1362338.1614161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjcHy-0000QT-Vq; Tue, 14 Jul 2026 12:31:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1362338.1614161; Tue, 14 Jul 2026 12:31:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjcHy-0000OF-T3; Tue, 14 Jul 2026 12:31:06 +0000
Received: by outflank-mailman (input) for mailman id 1362338;
 Tue, 14 Jul 2026 12:31:05 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wjcHw-0000O9-Hb
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 12:31:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjcHv-00GyAZ-Dh
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 14:31:03 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a562bf8-5cb7-0a2a0a5109dd-0a2a4508e0d4-32
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 14:31:03 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a562c05-f659-0a2a45080019-94a392178704-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 14:31:03 +0200
Received: from pps.filterd (m0367123.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66EBO0MT2439351
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 12:31:01 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com
 (mail-eastus2azon11010037.outbound.protection.outlook.com [52.101.56.37])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4fd8qa54s9-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 12:31:00 +0000 (GMT)
Received: from CH2PR18CA0051.namprd18.prod.outlook.com (2603:10b6:610:55::31)
 by SA1PR16MB4729.namprd16.prod.outlook.com (2603:10b6:806:229::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 12:30:56 +0000
Received: from DS2PEPF000061C4.namprd02.prod.outlook.com
 (2603:10b6:610:55:cafe::6e) by CH2PR18CA0051.outlook.office365.com
 (2603:10b6:610:55::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.20 via Frontend Transport; Tue,
 14 Jul 2026 12:30:51 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 DS2PEPF000061C4.mail.protection.outlook.com (10.167.23.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9
 via Frontend Transport; Tue, 14 Jul 2026 12:30:50 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66EBQtwo188417
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 08:30:50 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4fc4wqtxbh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 08:30:49 -0400 (EDT)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id jcHewK0NsipGjjcHfwQQHV; Tue, 14 Jul 2026 12:30:49 +0000
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
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppford; bh=Me1P+D9/4IGJKkjELLl1ahTsPu9
	2uSkzKxpshLD9Gls=; b=Oh9MmKoRGgQPaD6a8CZcgBKawBbOUcfop5IRlTXqH7z
	hcBl/SB07zuLv9Id26UYqfkwR7I29MxSKNRHbCn+R50GRoZsZCj+kkIshFO0Gn6c
	5SjNn3liWBUpMb9ulvUUw56Ai6XvaMaUw1uBYmzawbyQBnwE+XLrFJ/XRcyM6WDh
	Mi2gLfDRwVxsemffdwpyQ0QECYOTFOAe4Y4igjBBY5AcL/HHTv7HZqvUyR2EK7BO
	UPDO9mxj2riyKRfR96/TGx98wDQuExHWaSW7ScQLQ/v4dNwRddrJsEHUCYwv5aGN
	c+zY8qOSUNrh4At226CHArPt4LXEGFqX3z+GWLqh7gw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EVXSQYkZKVlmBKM+ZfIFJN0Dk17XIWSfbc/oe9zXQRaLi4AKHSz070iyIklIR+Y4dupz1LkoSAzqCgcwgAYIVgSLbkpxKkoxZ8grRXSsHixxPuH4BX9lQtX3iansotueycpHzMzbW+OxEsNmKUEGP6FqWzOaPJ4oGIiLp7UM9Qy1vi3hnKPN2EEdrSuQ2gdgd+YcJ6l1RKRJIWZKFMHsXskrzzapVqVTEbBESwRSUD8dFHWrFwv05mVWwm5qd/5P8BwwP5l+Jpu8AdHLBrNj7w3KHpDdjsHseHJ1Qx3+mUb3wo674N46DGJu+GIhj8/VwjQUp4nWPxzqmU6D5ugptA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Me1P+D9/4IGJKkjELLl1ahTsPu92uSkzKxpshLD9Gls=;
 b=Q8v75vrG5EQMz/EJtLwJm1ApBYjqn6RBxSDFsuFkiNYoEaki/S5nSSSJPQliZ8RIVhRTCz3WNZiB9kFMllNePX6Y/EZwu4YFq1t4mH4terd93aA9d7VU0zZCauK+F71AW8xYHahlZb9IGxsL5Ln0iUVRjnRfnjRjB6krSPcHp9u51B1WPxUH/dfy21dvakLOoamWHORA8LRvwvr6VdUXMU5okvxoN8S1ncjckaa/Ag7XKBKJtSosrImQhljVy2ofPf5qBVyTBDVCJ7xAFW6YTOo2x5nDPMKtQ80yOUqcs+dyTpIAfQrMTiJoH6wn6CnzwydE3ikrSsGESpPmdMYtUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Me1P+D9/4IGJKkjELLl1ahTsPu92uSkzKxpshLD9Gls=;
 b=IwV7BiVn7YFFYFQ1Ulb4JaVyxfvZnS+XZKzOQiEK06PycuV1eW7ZDyCiY8F44up66Wf2vhb5k3OQtUfZaqrwOqvp/SNOHaplE6Aj3JNVznaBKaIL6Si6tBE+UhLlhiesAG1jsxQV6SjiZx6yQgGHYB2szvv+uTM9YJa33wONczY=
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
	 bh=Me1P+D9/4IGJKkjELLl1ahTsPu92uSkzKxpshLD9Gls=; b=l6pQq3WQOk49
	0j9RbV14EBPQSv03aDfjaRbSkBcyiTVX+9KbtlPIWVsTXQLf+9UdokYIuCgGgRNF
	inBTRAHMr1GQjBenARrP6xym+ZWkvEzP7/VUbCgir8lpnW3F+57tq8+txG57n4dP
	81y7qlCPop2i8nr8lTm/t1UOZeGiCz7s7z7PDI2yNbSRwltmhSyP3scg2Rq9Yl0t
	VN8hR//MErqTpkXcf4qqUlWov2V4K6AhFhF5JrE2WKHPPDt/50o2CRenfx+tO7F+
	CikoOqmvT2fVSVwElkKUcoqnD3aV9tinSRVq4jZHjH78/+TPeSEntdeqwX71+jhi
	Zk7+3GnLhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=Me1P+D9/4IGJKkjELLl1
	ahTsPu92uSkzKxpshLD9Gls=; b=Yks6AME4/9Y0QIiodXz4lCpr+VcgtEnwWma2
	Jj9eABS0Q2z8pVdU2lMe+obiv4yzKJwkN6U7t3w74rjOv0dRaZ+A7aFlCdB6Rprg
	2FkQIz75QeCVqDJLxDeNkuQwnX1YCu3ScSphpNgndi0VDehQor5h5MIOnEZPOSZd
	OdD8eydJ7reyQ6l2t0ZA98+0CngKh92ZB5SOiBaJCcKZaYlP/i+a2lp+2yvat8rn
	rBWbquerttx7UxaXoWS1Exbq6ymgm82+RjOC+fJ5kvP0m3jtHowrxRoITkHkY/Zm
	VaH/JwbKBoY329qCjSN53Ayouc3EmVKYq40Znlhq/E2J3DiBEA==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: jcHewK0NsipGjjcHfwQQHV
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Tue, 14 Jul 2026 05:30:46 -0700
To: Jan Beulich <jbeulich@suse.com>
Cc: dmukhin@ford.com, andrew.cooper3@citrix.com, anthony.perard@vates.tech,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v7 1/7] xen/console: promote conring{,_size} to
 __ro_after_init
Message-ID: <alYr9jCy/aq2odXN@kraken>
References: <20260713181619.672176-1-dmukhin@ford.com>
 <20260713181619.672176-2-dmukhin@ford.com>
 <93763802-ae88-48ce-ac3f-2b0ab79b4431@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <93763802-ae88-48ce-ac3f-2b0ab79b4431@suse.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140130
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C4:EE_|SA1PR16MB4729:EE_
X-MS-Office365-Filtering-Correlation-Id: ff59e635-9c04-4665-0009-08dee1a3bd93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|376014|36860700016|3023799007|6133799003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xAMWhzPjUGeiJNRKwRS1GT24hwyh6d4HwWbL4rk/CuoMLnbQ4iqYnO3dNn1Dsr2GMfZYhTwzgsMvVsWL919JrZBmpG+xvgroHZvvLo/0W7ZyP37oZ646AzlL7qqWKhFE+lkQ5YNDBCvdOEHdO/Q2XPldZ7QI5nbfOjTKaGV7q3ialYd81xLPuTi8XSJRU9sA/3aJFDc2inxpaT52oPg8oDwkPhEY6EjfUAvvhc+8h8FIGi/hbHA/9BxR4G5BPo7+9QdQRU6mNNW2d67bYfhlAZ30vBDcmjlo6SI0KBY2/TfseC/YgsddDsgvO7a4KsMHoeW7kfHnxoBmg0ymD6nyDEQW/zuoUDuBIPMstJddWlNyOJ/Z5qnNIwWazPgWU3KeWAbKzeZZgLKNWvyB+IwlMxu2KzVz7aN8IpuqkMYG/itlJsTv2Terj8iA8js58xd4s3sj2g4LLGj2P6pjEuNM8dyUSfYg2cNPsPBkkgodbEGpBlV5CN7B444S5Z+19nyNE+wOggoLK/o6WT/bV+Tq3T2XOSWwhk8r05iilBbYWrVD1G9A6Ct/Ari6yM82zdA1GRO1ji2s9TelncglOkzUhk2c4ff+RpJ7naNpzGCxO2PFXs5NuRd8jSc97fD2Rkxs8Xt2nHvgDiXx1ENsajQNO+STqzaYzBZBtEzOjMD1XTc0XNoRpJySX3IDNy3IFOuUsUKM0xK0/MFBMUoy/IErAg==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(376014)(36860700016)(3023799007)(6133799003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NDwNoSrKc6gXBHwuA2miK5IC5gEoiUyhnlXyeXEonA+p9I5DPhKIFHue4W4dC8Lg3ttXPKKhfVarlU6tH4tSXoXywiIX8iCFfCBMfy6UOiwb2DAaJqiJhbz2EMH8aG7SkoCuxXgyRRBzfcYFrWEV1xU3Dgh8XBxVlr2I2tf9CxqINE+buTFMilqMAhAQUkiZdvBWJHWC7ihug31Zs24DX/vmehjcaPxvQA1VEvH6sTE/NwROiGuueFT2tHlX9IGij3HiIVCGliNsTomsCQvNNK6NFDo7QV/3hvw9HZSbbGiBOu5/0ue4fjNXA9neHXI1Ss18aUU+pm28/bn0ks9vMRt/DDZTRfYNE01TyYZ33b9ny/NoPLgP7ms+EBhe0E6Sd86WNhp5KG10qzI2h8k8h7LbibMf4Z0ttcGhRksi8DO1aVcZKzbfFOCHkG6bALNb
X-Exchange-RoutingPolicyChecked:
	VAw4urTnCkNSmG4hdJpL5HMD+xwpxxesJH9QjJax3r5viW57ws5Q3wcOFgJwCCnhhNaEGR9dbPaMXllrUFV2zx5E3/CsbnI9JqBptiywec6nEzSpM2u6iVogRm0PHZzs7fSvjYYF4coHrrrM5sclikWWaLXv1X8dWXnwVv5MC6Fk1DILkExPbij9nIY+frkVDhjTVWlzGGPDKxd1YoesfqvD8YJoxkD4f1uMhSpGSDnwCmRxWv1FoKDVIX9ohGjHwNpIBRYWjCDDZnI9Cp8WARAXDCGtR0ecZXjvc13hhoZlcxAoUwlcDe1gt2XaGusRzPqM6cHOFhsMYNOSmOLiWA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	flKq/raHQj2tJgGepnZxmBWnWH6VUZVdxQ+cVOUFU6dFXX+wP5BP+qa5zAsNXzDyWr+/BvLaENbeW+X9AbVlAnKBLAtn02bnky/8CVlbBPY7OXdCmZYP5kJuvSEIRprXnNsKyCWxXvrOqFYdP3oNbuYAJYiPjyjRQTbHa5ynMT5AE/gY1CNWsR8gNDZDHwT5O9n1gh2nBGzUpme9Vo9XsyI/L9XAn1x7WDp/oAZ3b77PoGhMd7+TqCUdKl+vNHqR/U7Jl11oyEOxEC1yQW+OrDZ80ImoH2fnzTq4c3MD6pFdOygOn+XkRd4lEZ2P2vuz73lmoPjs96GXh5SBPjk6gwkFCeLcjEsrr5yigRMSnNZ4LBB0Fvq6m7M0ACfz74ZOeSghmkBwmdLJaXz+GLJaBkJzYiWSU7liT4sir1YhQ9fXX8rKiqrpP60W1jxszUxEg+KMrJbRGz9YKhYR9vop8Gnv6A6urzoXLHH3w8+B1DXMPa8TgcScp3+5PTmZMjfMJwlxd4oC6L2sK1G6PsYbpj0IlPK+jIlUgBy95/yHRMKUAC1s9TjqxW4ND6HsioasqqG+TFYbLxs5B00Qw1lKZ1f6icWnq/5SueZstvwqkp6eIbsByrtgzWxJxpgBB/YUM303NcO9M5BqrUNlG4jDkw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 12:30:50.7094
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff59e635-9c04-4665-0009-08dee1a3bd93
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR16MB4729
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzMCBTYWx0ZWRfX7goRHEYS7Q07
 6rDY5DRg7kjOxOxNy0mAU6ExPBDyxchMsgwgCTPJxllU64TLWKQAm9dRE/bV290yFKUPBbgajRr
 SqiQT241KxpSxJRB2eI/bU5xXVn4oej8p68B/0VgtBS94zDCgzRnyPEHI6KS2rmsXFTQQ9gRpvQ
 upiIqXXXMDT2LdI9Qb4OlID2QjFcgYmJEioVejJuSi1gbp1xnRslPNOolvsbJ6UNd1UfpTbGC8f
 gjwHlaZWBVxjTZO91AH0wS5rP1DSwe7vhhZ2Urx/dmxNh9hBd26aM7GHknHU4W2pb/Tc9C9PKbu
 Zq3fsrX0xryufkKeAnmhQgAQns/CENWR5FPAM0eC8EyluO6g7JbF738pf4jWNrwyfd3IqQalS0e
 Wa+Ui6BUytFOZtLzfFBEybyT7qpjzUnLiLZxpFWD6uOgTc/+EGTjJvXMtiJTSedYlE2XVShlgK5
 FasIWLfK7XZrNNhEsUw==
X-Authority-Analysis: v=2.4 cv=Ir8utr/g c=1 sm=1 tr=0 ts=6a562c04 cx=c_pps
 a=+7NNu1siU3MXiwb9s73WHg==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=N9_n2FxmZfwfyRXvS9-E:22
 a=cbNQJ9GKAAAA:8 a=tHz9FfFoAAAA:8 a=tjogBNL-8eSFkA3lrysA:9 a=CjuIK1q_8ugA:10
 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzMCBTYWx0ZWRfX+YhGGGY+Oq+P
 ony7mGj0Eq/av1W53DGs1xABCNcKgFazHX/7Om+IzgDfdMEe4lf0AfYQKlUOOgd7YyBwM8tGfQ3
 rKTuboZQnDiwJya+nLzkrqHil5j4I+Tt/4yoitUPvQOqIL2LCMiE
X-Proofpoint-ORIG-GUID: 32gp6T4ivdLpG5HMfabslb9nLtFaEEQ5
X-Proofpoint-GUID: 32gp6T4ivdLpG5HMfabslb9nLtFaEEQ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140130
X-purgate-ID: tlsNG-c1860d/1784032263-D6D4087B-B4F848DC/0/0
X-purgate-type: clean
X-purgate-size: 607
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:dmukhin@ford.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FROM_NO_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:from_mime,ford.com:email,ford.com:dkim,citrix.com:email,saarlouis.ford.com:dkim,kraken:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B2D98754941

On Tue, Jul 14, 2026 at 08:08:37AM +0200, Jan Beulich wrote:
> On 13.07.2026 20:16, dmukhin@ford.com wrote:
> > From: Denis Mukhin <dmukhin@ford.com> 
> > 
> > Both conring{,_size} should be RO after initialization is completed.
> > 
> > Change the conring integer parameters type to `unsigned int` as required
> > by CODING_STYLE.
> > 
> > Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes since v6:
> > - rebased
> 
> With no changes, where did my A-b go (offered on v5 with the types adjusted)?

Will resend.

