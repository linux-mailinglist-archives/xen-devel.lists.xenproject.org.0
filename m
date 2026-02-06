Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sI9xAxBHhWkN/QMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 02:42:40 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52951F8FEC
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 02:42:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222672.1530437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voArW-0004T0-Ul; Fri, 06 Feb 2026 01:42:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222672.1530437; Fri, 06 Feb 2026 01:42:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voArW-0004RH-S5; Fri, 06 Feb 2026 01:42:22 +0000
Received: by outflank-mailman (input) for mailman id 1222672;
 Fri, 06 Feb 2026 01:42:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FjYH=AK=ford.com=dmukhin@srs-se1.protection.inumbo.net>)
 id 1voArU-0004RB-Na
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 01:42:21 +0000
Received: from mx0b-00498f03.pphosted.com (mx0b-00498f03.pphosted.com
 [148.163.143.241]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10337af4-02fd-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 02:42:15 +0100 (CET)
Received: from pps.filterd (m0367130.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 616193Ys030491
 for <xen-devel@lists.xenproject.org>; Fri, 6 Feb 2026 01:42:14 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com
 (mail-eastusazon11012000.outbound.protection.outlook.com [52.101.53.0])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4c4yx8bf96-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 06 Feb 2026 01:42:14 +0000 (GMT)
Received: from BYAPR08CA0004.namprd08.prod.outlook.com (2603:10b6:a03:100::17)
 by SJ2PR16MB5527.namprd16.prod.outlook.com (2603:10b6:a03:548::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 01:42:10 +0000
Received: from SJ1PEPF00002327.namprd03.prod.outlook.com
 (2603:10b6:a03:100:cafe::b1) by BYAPR08CA0004.outlook.office365.com
 (2603:10b6:a03:100::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Fri,
 6 Feb 2026 01:42:07 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 SJ1PEPF00002327.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Fri, 6 Feb 2026 01:42:09 +0000
Received: from pps.filterd (m0373460.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6161F7203164864
 for <xen-devel@lists.xenproject.org>; Thu, 5 Feb 2026 20:42:06 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4c23g0wj3m-2
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Feb 2026 20:42:05 -0500 (EST)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id oArDvhTbCkQ6qoArEvHcXl; Fri, 06 Feb 2026 01:42:05 +0000
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
X-Inumbo-ID: 10337af4-02fd-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppford; bh=7APvWfqG+hCXb8s66oQoapLTBze
	vhzXm7V+emeMXqOE=; b=TSnKGz2iSquydDCU9hCod2pXEtn1GSGXy7dAPn+U/RP
	OBfUZQhgf8hg2di+NVocJt/VUS4nLQxIAzSxv/VVoXA4OcK9nVxX6dRP9QvPpYrp
	1Hs9MpfFuxxLwPeuiTVsh0sv7crYWA3rgM0w2cs9gf5gd8jtkP+YKN43XS6SV6aH
	FUHzW8ywe0Zzr/4fCA9ph0KYQUIevGn1K0ymNPIvxOGWz+RJX/fZNgldCDbwf5ps
	ulGziPAElRwWYsUOzwYxjoxPv6qi1XJaCkMu0wo9XDr6CBc1IvSkRcgHJK7qTPlU
	xiwpLMMf9w8KZoDSIzx7r9zOF5MfDSsbZeIxFRBpHeA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yeSVBtMCZJFagyzMHaQ+hpb7I4a99Jx9q9JzQWMk+B7D76YlR98lTbzAE281DQa3xV58xaYTpZwTG25N64I6bEqi1JIboTH0NMBpNve1xJ4qwt4EcxRB5+akKdzFWsWBAnBPttpfQYyLe21/03cpeW+VWOxvpXV0oSfgHOC0nc401y23k7HQ9BGgYPrPzkNPbCzZN2GJMtL+E69hh34g6A9KVRLy9hVFhT01tPij+Gzm0nUZQHOdq+tPxJ4rRmNv0XmPpz64FsBdhhMOapEnCNyLhh5IDirL1tPj85JL5kROeLSiKAa21sDBYomkj+hj7sg0J6bzqTgclWeAjV8+OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7APvWfqG+hCXb8s66oQoapLTBzevhzXm7V+emeMXqOE=;
 b=O2DOxcUbwL1HeAzixrCqFBAJO2djcqoD+rdvC86TAYZQgxW7Hromfxhmysdr4crQ5NMQd8CnLfVxhRVIiap81mmTbRLW3PTDN3+0ipCDB1cEKL/0Q1setywhlGXVpYcboyz5aTW5K76D1saOZB9UGbkge4AH+wk43QgIshaBMsOCyMWoqriXu0P3Xhu2k9R4t6NVUV2t5904VCfM8BMtLmuQ4z07GeOsKEccmiFiY8ONSJZjRMUVDlP5sK0ZU43lQLDf1/zGzoz6Z3KVJ8/3x9q4HnmR7VxMqwT9V9VCDlnpjKaLvQ08rrVd8GNSqozWR7bDPA7Sf6B8IPmHH7jIEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7APvWfqG+hCXb8s66oQoapLTBzevhzXm7V+emeMXqOE=;
 b=SjD4Nh8G7S5EUxXss8qkpAepNVAtdgsvMEZieNHmRhuYHN+EAF8L5NNWHnp8W7uT2pTn2j3I7XB2YpuyyOHHvfwKlD3AbyjqvprlafFYrkOZHdJbbvFQF0+wULYnRoBQL6jhN4doPdd1i8eZR2Zi48WVqV/lSs3+0g/A13EM3AA=
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
	 bh=7APvWfqG+hCXb8s66oQoapLTBzevhzXm7V+emeMXqOE=; b=oKd5rhlQV75n
	pvoWCBFhhNNXqcImffyybzNgme7SJxMn2u3eNs12/R8rF+EgUdvITXw0y91IYIEu
	dnKbiYWdpfR3g3qVIUdlMQCFAckdompyFKrs9SkLp4BLWLxfJCbFvyAztES2JjDb
	1ZlsFWYODeqg4E4REAU9VUHOBup5zBI7Y8vf3D37Gdh9QHQnQQw2pj9HTbL2Bk0s
	J8EG88qdchTHSqLfUWxP2DWX2+JX/p7eZSBqY9+6+WDnTXzxU75iD4swPZ3+AmVy
	mSTXpsBzR1ZhZWm+uReVyLuth+s+J6cTZTtH2mfnArDyoow8FMgEaZomEHQ2YFOE
	eVzMrOi2MA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=7APvWfqG+hCXb8s66oQo
	apLTBzevhzXm7V+emeMXqOE=; b=kCI0V4H+ScOevv60AWiK+JUQlb/qHC/Pn0sX
	b3t9U25mt5cR5zzk6zqDc5NUSBIphZsIZozsXjzRu1GWi7JCVAyub6p/4QGY74CP
	yIC13IjRdQG7QFrZwJiuklt8VKfX16v+CUGDJreRy5fus7Nb8mq7cOS/qaeEviWj
	WpmFY/EWEFPBxlR8J4dgdQVJbxgs4OX+WBvWA0DnBqnGCfEuSbRVx+Ys9nIku/5f
	IsBJGUXyDYfHbX8Mg3kzfQC4DTbVJ1TUolr974IYERxOjBEta/e7KSmPPR+3WZ41
	umnl0QA8RYnO5pY6CZ+06tYN01y/kwHyfoKEe/DRuK3FIW0Cyw==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: oArDvhTbCkQ6qoArEvHcXl
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Thu, 5 Feb 2026 17:42:03 -0800
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
        anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
        michal.orzel@amd.com, roger.pau@citrix.com, dmukhin@ford.com
Subject: Re: [PATCH v2 3/4] tests: use unit test fragment in PDX test
Message-ID: <aYVG6+jvmUrgOXYe@kraken>
References: <20260111041145.553673-1-dmukhin@ford.com>
 <20260111041145.553673-4-dmukhin@ford.com>
 <alpine.DEB.2.22.394.2601231708190.7192@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2601231708190.7192@ubuntu-linux-20-04-desktop>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_06,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602060012
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002327:EE_|SJ2PR16MB5527:EE_
X-MS-Office365-Filtering-Correlation-Id: 32d898fc-8413-4a2e-d90a-08de6520f185
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QYgRWiOn6s4Yl5lgKySyfwVZZ8O6iLllB5uL2UMcm/041Nweu9oDMkoclv2c?=
 =?us-ascii?Q?qE6iFuKqZspMQrFK1tlLtXmUL7cK+4Tf0z9v1dg8de6m4D8dNAAaBmxJW753?=
 =?us-ascii?Q?woHt6brW9sU0pqL7HoAIt74t/qiEGsT5FznBdyPoRFnTeTeWnKnw/MQh/gYD?=
 =?us-ascii?Q?wMNl4J/9L+Cvayq2F+0Fna11OTD9RC6dXnEN0jQ3M+mvdufd3wqNoLyxIf+e?=
 =?us-ascii?Q?x+kp5RtLqCbPygnllTKzlFbRXiGyOOImjGThLqPDbnVSjZqC0D0yNFDb9wto?=
 =?us-ascii?Q?uSMtRf1ijvJ1z3HU4f1N4kbwxy9e3HjOWUVhRfHQuVxKz+sGgIRU3pQLfJ3i?=
 =?us-ascii?Q?LMILt3l+OeX9Xm0pJnkcbCTEN5if8EVFO4Py6s+QhFMDoCt8HDl2mzUIiFFN?=
 =?us-ascii?Q?SjzyZmtdHJCRkmsUIKVdga95I3xt/Mjk4uWc08kgx3PB+Wx3XOzXsp2E4lyt?=
 =?us-ascii?Q?ql3LzMYY3jszAIumgB1hYteiPZepJQPuYf8g59aQV2NdSg2Dn7L+RAIsPOrD?=
 =?us-ascii?Q?nt6vEboHjXV4YZIMtD8+mDJGTNRdweUWyVlYCRZO+DO668pjiIblpAPVYgAw?=
 =?us-ascii?Q?engJq9gdOubyGsvkCvIt/3ihQDfdDVPRizwFejFlPLLUsWf33Vyi2yfA2TTD?=
 =?us-ascii?Q?o0OzXB6epZoISCd3acI0vwhEUHvJuIRjII+OOBh3TyRtKuF2uiQM7z3HDzhS?=
 =?us-ascii?Q?MbAhW5lB22J/bMRiV++oMIL9U+MQFny+ttorGa/zA3WUPcrlrnUkoP58DcQY?=
 =?us-ascii?Q?hDs3BZ7bqltX3+PA4xjmBifptXKWP72pz2RdeEl8eMN7csdlGEiKPjfufxDV?=
 =?us-ascii?Q?s0PeqoJ7r4t93u4DBJ7xvpFb3vXomM8sX8aPmt0Jw/eASKv826wPbMPwtPrD?=
 =?us-ascii?Q?DvCK4uqUODboSeXdPEXE1jKaFjebsWa6rKrB2sCb1wnyDgkQOvemIOZvwYJL?=
 =?us-ascii?Q?DyHr+f+6DE3ZPLzi4T+1jOxaocbsg/S0AzAKeww1+iWc0cybDxYjTx+nJw/q?=
 =?us-ascii?Q?6IDR5qgiMERw/GBc06oW62PeQL/qVV1b3D3uIQNHlNOXwjwChA+JVJRmCBEr?=
 =?us-ascii?Q?sf9yDNCkX4GbI/PlNlq3wK3O5QxQ2eV+ti3jTZyvjcbEGhbeFiLpFGRa9kpx?=
 =?us-ascii?Q?4sERHwJW+JQYHZx/49t+L1NxtU12I1g+yHwsgqILFxAatKzJwJuypNUqmA4U?=
 =?us-ascii?Q?ZHY8i31cIzYBr0zigHnMb5fGf2kdK4S7UJZ1Vuky2RJVVABSHHKBxj25tNp0?=
 =?us-ascii?Q?7irwTBvOWRrsCK/KdHA2upIN5yd+dt7NjnZsQ3J5n7P3Lcaim0kry+m4ysDs?=
 =?us-ascii?Q?u9ajt5fwqlnYGvIkkmAx1A4HZ+81nXpyBhuQjmmZBeSVgcaD5cithn+oduHu?=
 =?us-ascii?Q?xi6wdl60hTRW1mq1xpowj6FpfzXSx/mYFKZsP4wcrKdnarETUBPnuLxt4P2Z?=
 =?us-ascii?Q?1FsX4KbjPYbIfDCZt4+1drBNgrLtlHwQakLP6N8n7Xq1WLVV92Vf/01Gw5tI?=
 =?us-ascii?Q?OMJTX1l0n5QOCv0Ht3yKj+GW+QQS00xjLP5+oO8uhUSIQtKw5Qe68HsWdCAU?=
 =?us-ascii?Q?r+3tQPKc5C4d4CwErmneUn0P/q3iqMAjLw8RicMBs+RYXTx1HsdvyuS5ejh3?=
 =?us-ascii?Q?+V3kkLNcdGG4XtvYhX07DQmc4MZWwuAIus6RyoUmzglkQfEo5LgEOo7rM+rM?=
 =?us-ascii?Q?v3T2eg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hZyedsdwnuy64KqJ6iBfjA3y6gq2P7CR/tmndKsFCLkdD2mgy8TRQoi5j+XggOwAzLKsSg5lGPnK+2gjYiXGr3DEUfOw0nvsOCnnHZQVLu25FkjpgYOwwudQPyYnS4JPN2d8bc34DZ3jQ+jGlj9ZfLFhvjkGh0Vu1xgnfiIX8uDF2HNOV9ht06/50XVsvFuuR1My/s+C1vM1lReqh9r2Qwc0DHT1cVQ/F4sDNmBodWmVEP2dkV6UMUNI3Nulg6+0uA9L4c5/UFihRAIUEu7CXqD5gSc27P1y/BAwMR8d4axPAbFe1nGjbsv5woBRS0iG/8Yw4FuC0xXfDbTUheaW/N4xxHQvhymvUye4usP9NVniekCNoG56vvQlNGNx7jbHsSWN1ShkPOC40kc0i1/0pvU34PN9UEHKN2fWFdEulCvl5wT10Q/NXTWCIaju0Arr
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mG0+9nTjHFVZec3kORpfL2ZZAgU1ZZTtX4ZEYiav2lZBc/DYEUOyLYRNrbHhFJEpxXUo0k+o7jcP2JxtyDKppb8xqIFajzw8lSzIK7bswqasEIrxMNV5eTCvjDLMsFVS9xk2wtl53wmln/62kUp+Mf7P0xjBXravJqZB0CeQjAXQTJPL8lbMU5+f/bPRLc74HnVNNQocy9rcN9vjsQISONEP/aBbUN1ZYc/MSMMqf7j5nAHux/p4CPtZd24Vrusdw6r7hwXqNMDSTHlfPaD7qC+QntzvZ+E0eBvcAVSLnOUj6eA9QVYAY6vj2UStH8BjCea0tdqkyl0IXVFNUaRLRrMOy0T3hkmZ3KwCh8I6rq77IJn1lsGpyL1y3So6ZAFb+qQ9hkJaU7Tjh5Jmoa3rOltwCR/V0Ufdck65VGNuIK527oDYugYpb32PVdP7XJ5I31vhmA2Y/ycpvDQ5r8p7Uteqv/SVnuIceMM5Z2ijWj0kGHH5VAwzN98AQ9BAekEXcybzWQ/5yEvAElpC5QW395ldIhpr2bF1XL0N8sYZRgErrn2rDTpILee/LFXtLSPTRE87vw4Euyzs3xXzMO9w1OpChjWLodF6oF74lgEfwV3sAn8ZOMZ3B3ePcV608rcC
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 01:42:09.8132
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32d898fc-8413-4a2e-d90a-08de6520f185
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002327.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR16MB5527
X-Proofpoint-ORIG-GUID: P_flqzgq-vM3Q8N9_e0rWxkP3MSM8lf3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDAxMiBTYWx0ZWRfX6q36dcQSQCtF jCisMRifrqXfgzYgTF03nUq00Zuo3scVEbcKEsWZceCbmjJ65Z83ccllCWv51RHn7ZNSOQF/xiJ cLheERPgrbqCPcBo0SBbvGYAfuJdAgS+grYZJWZxYYVf4zYv8ubKHc+n4RcYDShUX9xA4A0xkzT
 tT/DzLpsHCb8a3iDXReQUQs17hXmWY0it1SCX1E+IrEEZvDZoQu4/50vMRJRble/NmoxJufgLET 3YL903RGFHHQHFA+7859G9r6WXgDtp08Usb5ALPlLC7b+zSI200GInj0JY1hEdStcytjPNEvq9v JqBPLuwpki1KaHsIk+rSOSXeUAGMNBqpklaJGp++0/4Ivrynzklce59D5RlU8m3Q7RLJfqI7YuR
 2vdOPSgfKlSse9pHDHSQg7epRVPA929fmlTgiYi/GB2pRcIkNHr8Vbms2TcEFztBLZdDn1QkJgw 16f/HnAIfZgHIHVSJCg==
X-Proofpoint-GUID: P_flqzgq-vM3Q8N9_e0rWxkP3MSM8lf3
X-Authority-Analysis: v=2.4 cv=YoUChoYX c=1 sm=1 tr=0 ts=698546f6 cx=c_pps a=0Za+SRInewOPUeHoNPGlYA==:117 a=lOEMawUel/sSvQipkIvNbg==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10
 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=mLnsDVdbAAAA:8 a=cbNQJ9GKAAAA:8 a=vpxLyrnmyxfuXQSD9IgA:9 a=CjuIK1q_8ugA:10 a=DqJYxgmhk6moR-_7_KoZ:22 a=xnp1pY6zelCj5OLna2To:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_06,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2601150000 definitions=main-2602060012
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
	FORGED_RECIPIENTS(0.00)[m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:dmukhin@ford.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FROM_NO_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,ford.com:email,ford.com:dkim,xen.org:email,saarlouis.ford.com:dkim]
X-Rspamd-Queue-Id: 52951F8FEC
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 05:09:05PM -0800, Stefano Stabellini wrote:
> On Sat, 10 Jan 2026, dmukhin@xen.org wrote:
> > From: Denis Mukhin <dmukhin@ford.com> 
> > 
> > Use the new make fragment to generate test harness code for the PDX unit test.
> > 
> > Move <xen/bitops.h> earlier in xen/common/pdx.c to ensure harness.h is
> > included before triggering the #ifndef MAX_PFN_RANGES check when building a
> > unit test.
> > 
> > Additionally, use real <xen/pdx.h> in harness.h instead of a locally
> > copied version.
> > 
> > Update .gitignore to exclude generated test build-time dependencies.
> > 
> > Not a functional change.
> > 
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes since v1:
[..]
> > -
> > -test-pdx-mask: CFLAGS += -DCONFIG_PDX_MASK_COMPRESSION
> > -test-pdx-offset: CFLAGS += -DCONFIG_PDX_OFFSET_COMPRESSION
> 
> The test with -DCONFIG_PDX_OFFSET_COMPRESSION is lost?

Whoops, thanks for catching this!

