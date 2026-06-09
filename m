Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lhggBSBnJ2oZwQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 03:06:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 042C165B88E
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 03:06:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ford.com header.s=ppford header.b=mq75HtfO;
	dkim=pass header.d=azureford.onmicrosoft.com header.s=selector2-azureford-onmicrosoft-com header.b=gYhYOrON;
	dkim=pass header.d=saarlouis.ford.com header.s=ppserprodsaar header.b="SPYJ/UWH";
	dkim=pass header.d=ford.com header.s=ppfserpocford header.b=KrHanj8+;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=ford.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1332174.1594827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWkum-0004ve-3N; Tue, 09 Jun 2026 01:06:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332174.1594827; Tue, 09 Jun 2026 01:06:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWkul-0004u4-UD; Tue, 09 Jun 2026 01:05:59 +0000
Received: by outflank-mailman (input) for mailman id 1332174;
 Tue, 09 Jun 2026 01:05:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wWkuj-0004ty-NK
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 01:05:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWkui-00ENyv-IA
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 03:05:56 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a2766ba-2eae-0a2a0a5409dd-0a2a450cdc14-28
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 03:05:56 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a2766f1-62f1-0a2a450c0019-94a392171588-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 03:05:54 +0200
Received: from pps.filterd (m0367124.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 658MeBW42080813
 for <xen-devel@lists.xenproject.org>; Tue, 9 Jun 2026 01:05:53 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com
 (mail-westus3azon11012036.outbound.protection.outlook.com [40.107.209.36])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4ep6qnrnsv-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 01:05:52 +0000 (GMT)
Received: from CH2PR15CA0028.namprd15.prod.outlook.com (2603:10b6:610:51::38)
 by MW3PR16MB3658.namprd16.prod.outlook.com (2603:10b6:303:4d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.17; Tue, 9 Jun 2026
 01:05:49 +0000
Received: from CH3PEPF00000018.namprd21.prod.outlook.com
 (2603:10b6:610:51:cafe::57) by CH2PR15CA0028.outlook.office365.com
 (2603:10b6:610:51::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.13 via Frontend Transport; Tue, 9
 Jun 2026 01:05:49 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 CH3PEPF00000018.mail.protection.outlook.com (10.167.244.123) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.1
 via Frontend Transport; Tue, 9 Jun 2026 01:05:49 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6590sZjr234057
 for <xen-devel@lists.xenproject.org>; Mon, 8 Jun 2026 21:05:48 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4en267t7xc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 21:05:48 -0400 (EDT)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id WkuYw5cUkfWWnWkuZwXxDs; Tue, 09 Jun 2026 01:05:48 +0000
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
	:references:subject:to; s=ppford; bh=kUs4fdNNIJG4R2XY9tCpvSCNBlJ
	MPMQTQ3sA7P5UEII=; b=mq75HtfOs3kxqPRExxv5I3mzK1NAeQRZ2m3igt8/vd/
	zZkIz8LOTH1AIe5m/0PXKRlfAWvfAwk18nKhooSTth6mCAtuYrVigJUhHEJhLkGP
	Am6/rgGycYHNqezPMp9PY5hdCahL83bQ2IMfF1zc/ahcE0b+FzywQRrQQqDKuAb8
	IVJ7GFpUtQzvChQB7nb4qbpI0N7vUNnFtBm2y5OD50++Iz6EXnKmCzF1cD/GZVqf
	LD8ZOsyUP6xS0CvmDsEfRKOoFxY83eBleFBfKgLcXWWhSxigT+v13Fvc+dga/kjt
	3iV78mYSygTZapgg0w2ti3sTLscraApeZWDMPIB/m0g==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S6CSEiEXzlYO48yp9BKXdhQ18DR/3KzUzJkfHVGnvKOhyJIr6thmokICpbkoXugH4Xl2p+J55k1M/+956YHNUcdEX+nJu3Bs1qiVnVTqOWPL7t4LW6Ubw9bvSX6CXnFQ8H7iuaWpi/MhAkbOBEJ035FaoO6DsTZEBuBoSR7/lOXdFSnXVuF3M2/+ekzpoyYxfvDzk9iwsoVCIYBmUIPuzpf2RpLwJutN5jDzba1m++TRSmi4+iqRzePlX+2hnsGrTo9WgrFH9uteYePjGbyzdxqEsbX7boi+jyX7RE5K1P/zPOnly2fAVc79kXzZj2XxpCATqderydmahnuqW2QVNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kUs4fdNNIJG4R2XY9tCpvSCNBlJMPMQTQ3sA7P5UEII=;
 b=IsWlCV0FsoISth9aGH5FZs9l4B7spTGWrP/o/vmAKps4ltLqj+w1fDuf4eBYDB3zql0Di51nfQhxelt5Txb8HI9fkeRiicz3xDmJUkUOtYloAFPbPYHBxdDs2pHnBLd4lQo2qIi179qSuF+uiCjXeWb+zK/bd8QNcbyKCyERrE2MqA24/aB2y4xJjeVSUQmY+cgbm1FR7hD21xpEESdN6Rqbp8usk3pNE+ybEg3IQyaoB6bcurJSfl4/EDJv9M9NPh8PDGuXw9Gb9Ztuoy9gBBCcjDiGqrCWrzmYWjmPDAL9i91lC1L9yW8IdEUrxK3kO9myjaDt5FSyOMAS/BvT5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kUs4fdNNIJG4R2XY9tCpvSCNBlJMPMQTQ3sA7P5UEII=;
 b=gYhYOrON6KY6H0jzSaO3PrnuIs155itUcvLO9DGln4Ifx2qvv/yVrnsEfnAcN9fcgLF9vZEbvFI8/XrWpZ7gOGlQk5f3e/uH/FTCuU9Ndvo/r1D6IK/KFraykE11UrqGvMXGfbui6uzdu9j2uMloAunJOm221SD3eBVgwC6xaME=
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
	 bh=kUs4fdNNIJG4R2XY9tCpvSCNBlJMPMQTQ3sA7P5UEII=; b=SPYJ/UWHwAqF
	JjfWV3zOooL1ZNeypuGWLQSZNDq2QP3pprPMastvJ5ykM4TWM21hmF6SIDAZ+erY
	pdXvj3bfgX6VHWvbiMk5qVkkFChXJmJenAfKqpm5iPiJhV/legXLby7DYLmLiyAA
	ni+qDb+UueKhrN8pFP1HEMfvNXDs3TSUgO8RJQaqbVRJdWx41mW9x6nPtnqwNOnU
	FO1ILEBVLRglc1LqS7AvVgnPSpd8Bt5ZDzTbP7wREyhVpfAO+fRLHOyCnSqi8d8V
	yQu1rgh4JB1IrttQuH1tvJS9RYGAcIjjL0pS/+TL1r2GYmqg1dxt7rWExioTXMyZ
	93V6FbumwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=kUs4fdNNIJG4R2XY9tCp
	vSCNBlJMPMQTQ3sA7P5UEII=; b=KrHanj8+ymLQVe5hRGQFWfaohoeVUWv1+kpY
	eMokRhj9JowMpX+s7yOB8FbqnGecoutDR09QmdBqIOY8Yr6NJoNWG1A953HXnPqq
	zVczeV/bdHEpN5oqoQjuI6FGFhqYiXMw9AeX8SWz2bqqrwepKtNC/LC/SB9vFN21
	38OIgyxmaxAaipRpiSvC5zqg3cOUm+3aBnLJ8XbZVtQ/G3J6YCYa07Zae4AqTMKA
	dbwAEXxW5jn2TEWq+JEGUJ283wNHfES1pByY6k3n+fNv1Zvmx/JNtO3plCT/sSmC
	5zk9EjazhfGs0QuZLDZaaeioYxdF6HT4G1U6nCj5Ys89x+ddwg==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: WkuYw5cUkfWWnWkuZwXxDs
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Mon, 8 Jun 2026 18:05:45 -0700
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org,
        andrew.cooper3@citrix.com, anthony.perard@vates.tech,
        jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com,
        roger.pau@citrix.com, sstabellini@kernel.org,
        christopher.w.clark@gmail.com, Mykola Kvach <mykola_kvach@epam.com>
Subject: Re: [PATCH v3 1/6] argo: lower level of noisy connection-refused log
Message-ID: <aidm6a7lYS/JbCK9@kraken>
References: <20260526215823.1452619-1-dmukhin@ford.com>
 <20260526215823.1452619-2-dmukhin@ford.com>
 <ae19de19-aef5-47af-833d-87a46efb9afc@apertussolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae19de19-aef5-47af-833d-87a46efb9afc@apertussolutions.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_06,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090007
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000018:EE_|MW3PR16MB3658:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c1dad2f-0aee-4946-cdd7-08dec5c33ea2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|18002099003|56012099006|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	OUCynO1Q5XmGh7Jfv6umtdML9rrmm4ciDkGBZhnWi4yhLX3OmIbNxWzCIpMZ99zREdHt9HbY3Zq4vokzqFEjhcuQAk3+OZAoky+L0eiQmWyCdMx/GKwhC61fJEJgzzWCQsPTU9ng1tYjNKIUF6YIEg3irTjItdFcvuhcTlpzunJhKVlEnvvqvGdmMXkgkZwWNQ423nDI9Z13MhTPUeDbRuVFiv9GlBETps/IKBQEu4+rPvxQ2i6/JQXcjAkwssf4n4VpIuIsmEQB+gx1uPA6O7Yr4WTYt/GeHKHXxP/h+RrRUj6IhbGKqbUPpGBzmzrQIFaUSQ9Susav2X+SbZkfgo5ivo+OFp1sY3GJ2WX0nhQZJer0VpEoDBjbFNB+3Km69E7GHy9UuadEodti6YzZ4N0aOTGaoZJkQmnKY83SUy37h+HIlfF2W5Lmyz5f8HQa4rANi3pws7eeDvaeA52wGXfv/glZp+UM91U9sSLZbEVZdX7cIOlZ1eD39n4ISBfHg3RZtPnNYKuZPXHBYcMw/NNyEmgwGgSkNRbFOv9vzVgarBBVWtz5hslkg9Tz0JmUQL/3aJ8auT82+rYSFD2r94eMqBqbzJAE8vQoSOZScraVIsbDVoX6ePlbR4FXMFBCGziHZWAVgDsvU3KGr0aJRvnu2jSQsCS3jHtIqF3rUO86gzu6DakI55TDAt6OJPmZ1EbvJAaEFJxyQjsRgmvRmx1TPG/nZffVmJj6X+INfh4=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(18002099003)(56012099006)(22082099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	j7+j604GK6C9ku4K9vfsLzUodY2qsBAdKQKunseUb6vivC5Ef3zOypi6Dki4wIBnfnMOImE0aNjFs6LT+SLaXBdx+3MfGlJcdlC9T+W+IT3kCo3HndpNV6SfSLpxzUtpGxadknWx7yOyTC/5PizxvNejTyaY7/d5IeSa2NVdkLh2T+5oXDHGslnRm8h2kos7ufQWOLG6AvfLIC00uKwSo7+gHThUw8JfmxAqXCLhB940ORw9F4hDwj76fkkyOkGtGYHZ5Ct6nkWDSOUjl7tYDO+1W20+GBgGVpjtjDIPVLqtnHNSw8DHK2HUaw2ve5O5eKRRJrcOjk4m4gy2nTsrgBVGlKU9x6/MgE+r6z9VMBVJNC+A+gsfa5FfWHAF46MRLxRNNUIuQRcQiVlMsaghfWG+QbWs2uLwmGbmityiegxEEtWfjKNXCyYuKqGPoEa3
X-Exchange-RoutingPolicyChecked:
	hFb99PmXPORF1ep2gP87rxcPMCFXfedT9DAzGlL653u3mkNyBYMyzqyb3zZxxZTeJWlEnCB0tj0paAfetFrKbPUOrW7QOlmUiYaEr4oS1lETBk2I+BW+KGlU1+QuaAl/rSMuHcupurJL7cv32Yh15NV0EO/0znE3NbtGDbF2Idsr5KLmYIqByZFONg4+8uXhX1reiATmbNHKcIhgAJJzzhqYa/cbRQ+2fLs1i+M/DST3YC8zYmvwULVE5hFt3eNyW5DP5Tr8C4HHYMZ7VyJGiGhwdVMZoaMTdQvnDeqV4bRE+4M0XOvXzyvxcVWesxGXNzHzCRZr/br35x6gf8J0bA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ll1qUc46k9P0mgi+TI0IyzX9e06nbcKZvZMbE65o9TluREkp4/jcFcB56KIBLRIjOTgVMRmK2EaRce05latHBmg+4XYgFbRqUEsWfkxzreo6s8PsalIH5RxD0pVNK1/AhqZVWsX8bJ3h8FZZWQbxVhyZi49XZDN7thV847iLWVHaLxVdhSPZgmq+jaAJlfURn9PeeDpRYr2EO2cxS5ggGPb56TRVCOs48b87a1gj41jX0+tcK5As+/wvy5FqKixrilwV98XjYb5KObInzfNA978OOmSj/vnUF7660aPSJyyJHPbl4RTTrmJbod3TikavXIDuEnirwuRWTStZhL2h9ZN6QlfwG9Oz5sjK2tWyN4gCi/KS7fu2JAiIW07l30kECjgZC0P+7IcFT3EuIZUNL54hDG0dDjDVrjNdMOormhi8+e4HEh0cieeVLi47Lm0c9zX3ZqeSo4VzzmKcX7P5Trg/5Zb7SiX07hfFpbrWwjPUi5UjPu1+xWyr1J91J2rkzzC7BXnqJ6ziEVXgmIR300m9iu19e35/a8wbM6i8vdWH7vyC6DTWkG3jenRniSf7SquzrQCbJfMvq8mS0hKvWuujTRwurpf+Wschzvr3STAovkDX0Q/NZy0eKGN5+iiN
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 01:05:49.1928
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c1dad2f-0aee-4946-cdd7-08dec5c33ea2
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000018.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR16MB3658
X-Authority-Analysis: v=2.4 cv=eZINubEH c=1 sm=1 tr=0 ts=6a2766f0 cx=c_pps
 a=1PQ19NIIScYLh/jfzFkFww==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=YJXg7OVxOWrJwj3yZo-i:22
 a=cbNQJ9GKAAAA:8 a=DBfv99YmAAAA:8 a=6U8o1_yNbxzEspG5Fc8A:9 a=CjuIK1q_8ugA:10
 a=G69WFyCBNqGPyalROSdv:22
X-Proofpoint-GUID: AxAunq6eWmQ_nGFTMeRQ5lsoI-3dVtV5
X-Proofpoint-ORIG-GUID: AxAunq6eWmQ_nGFTMeRQ5lsoI-3dVtV5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDAwNyBTYWx0ZWRfXxYG32rEG15ye
 54W6j4hroA4ZoX+u0Bby51CsOsdAzxCDlY781LMT+EfAfeJJgfFSWfVDxnkMZG4fEvmvijg0ZHo
 jGLcbz94S0M7ffdlnUGYd93hCmgzCnOobH7Ts+srYVF7TPo0p+ofrCjHIcTUklpJHHaiJp8UeId
 Oc/4yPQmiWU7TG0PbSvPqymY9pbAStj6oDqqbfvbU7bD17lW9f3q+fXLePpbgn0sS2BePBtv6/R
 vR07Pi4pRe8Ad3JyN0rt3jov8abT/L2WS7eDTeiaTvTNoV/mKxfU2JC7oczDtaEhKj+CA7E1FIE
 +LAd+aHqL0mZxxrPTaG9Pf7lX5kJR2za67BKC8wOqDqmWinUFSIqbZq8GOB1phnGmkhLIBvdEP8
 Cu31Lsn/eXG038wzv7a0YympuamU0r3HB1Nwala67qBPpmiPYVeho2eFmRJMkiMoIOHTqSXTiQ1
 oohFBxwYzLdAwoey6vg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_06,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090007
X-purgate-ID: tlsNG-d25034/1780967156-F5386CF5-6630EF98/0/0
X-purgate-type: clean
X-purgate-size: 2897
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:dpsmith@apertussolutions.com,m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:christopher.w.clark@gmail.com,m:mykola_kvach@epam.com,m:christopherwclark@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[ford.com,lists.xenproject.org,citrix.com,vates.tech,suse.com,xen.org,amd.com,kernel.org,gmail.com,epam.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:dkim,ford.com:email,ford.com:from_mime,saarlouis.ford.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 042C165B88E

On Mon, Jun 08, 2026 at 03:54:51PM -0400, Daniel P. Smith wrote:
> 
> 
> On 5/26/26 5:58 PM, dmukhin@ford.com wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> > 
> > Switch the log line to argo_dprintk() so it is enabled only in debug
> > environments, as it can spam the logs when a dom0 service using the Argo
> > hypercall tries to communicate with a domain that is still starting up.
> > 
> > Note that this also lowers the log level to debug when the argo_dprintk()
> > facility is enabled.
> > 
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > Reviewed-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes since v2:
> > - updated commit message
> > ---
> >   xen/common/argo.c | 7 +++----
> >   1 file changed, 3 insertions(+), 4 deletions(-)
> > 
> > diff --git a/xen/common/argo.c b/xen/common/argo.c
> > index 28626e00a8cb..98a3db7fd070 100644
> > --- a/xen/common/argo.c
> > +++ b/xen/common/argo.c
> > @@ -2034,10 +2034,9 @@ sendv(struct domain *src_d, xen_argo_addr_t *src_addr,
> >                                           src_id.domain_id);
> >       if ( !ring_info )
> >       {
> > -        gprintk(XENLOG_ERR,
> > -                "argo: vm%u connection refused, src (vm%u:%x) dst (vm%u:%x)\n",
> > -                current->domain->domain_id, src_id.domain_id, src_id.aport,
> > -                dst_addr->domain_id, dst_addr->aport);
> > +        argo_dprintk("vm%u connection refused, src (vm%u:%x) dst (vm%u:%x)\n",
> > +                     current->domain->domain_id, src_id.domain_id, src_id.aport,
> > +                     dst_addr->domain_id, dst_addr->aport);
> >           ret = -ECONNREFUSED;
> >       }
> 
> My apologies but this is not the wisest approach, hitting this is a real
> error and shouldn't be getting silenced. If you are seeing a lot of these
> messages, I would suggest asking yourself why. Without further context on
> how you are using it, one suggesting is perhaps your connection model might
> need to be revisited.

Thanks for the feedback!

The reason I wrote this patch is because there can be a lot of those messages
from a real domU which is in a boot loop and/or boots for a significant amount
of time.

With -ECONNREFUSED propagated back to the caller having Xen logging the state
of each sendv() with XENLOG_ERR on the shared (dom0) diag console can be a bit
problematic.

Yes, I understand that programs issuing the Argo hypercall could be rewritten
in a particular way so that the Argo hypercall is issued only if the domain is
up and Argo on the other side is initialized and, ideally, domain should not
be boot-looping...

However, I think, that hypervisor should not depend on assumptions made in the
userspace (e.g. retry/logging policy).

De-prioritizing the logline from XENLOG_ERR to XENLOG_DEBUG can be another
potential solution.

--
Denis

