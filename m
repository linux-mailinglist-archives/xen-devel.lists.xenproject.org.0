Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDKFGzJOhmkVLwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 21:25:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD9D103163
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 21:25:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223848.1531207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voSNk-0007vP-CJ; Fri, 06 Feb 2026 20:24:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223848.1531207; Fri, 06 Feb 2026 20:24:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voSNk-0007st-8U; Fri, 06 Feb 2026 20:24:48 +0000
Received: by outflank-mailman (input) for mailman id 1223848;
 Fri, 06 Feb 2026 20:24:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FjYH=AK=ford.com=dmukhin@srs-se1.protection.inumbo.net>)
 id 1voSNh-0007sY-Ry
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 20:24:46 +0000
Received: from mx0b-00498f03.pphosted.com (mx0b-00498f03.pphosted.com
 [148.163.143.241]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db3738cc-0399-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Feb 2026 21:24:37 +0100 (CET)
Received: from pps.filterd (m0482515.ppops.net [127.0.0.1])
 by m0482515.ppops.net (8.18.1.2/8.18.1.2) with ESMTP id 616IODDq009026
 for <xen-devel@lists.xenproject.org>; Fri, 6 Feb 2026 12:24:36 -0800
Received: from ch5pr02cu005.outbound.protection.outlook.com
 (mail-northcentralusazon11012060.outbound.protection.outlook.com
 [40.107.200.60])
 by m0482515.ppops.net (PPS) with ESMTPS id 4c5dukdd23-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 06 Feb 2026 12:24:36 -0800 (PST)
Received: from BY3PR04CA0012.namprd04.prod.outlook.com (2603:10b6:a03:217::17)
 by DM6PR16MB3832.namprd16.prod.outlook.com (2603:10b6:5:2bf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Fri, 6 Feb
 2026 20:24:33 +0000
Received: from CO1PEPF00012E80.namprd03.prod.outlook.com
 (2603:10b6:a03:217:cafe::62) by BY3PR04CA0012.outlook.office365.com
 (2603:10b6:a03:217::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Fri,
 6 Feb 2026 20:24:10 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 CO1PEPF00012E80.mail.protection.outlook.com (10.167.249.55) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Fri, 6 Feb 2026 20:24:31 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 616HGWL51842312
 for <xen-devel@lists.xenproject.org>; Fri, 6 Feb 2026 15:24:30 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4c218c6fa3-4
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 06 Feb 2026 15:24:30 -0500 (EST)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id oSNQv5OIqlOqboSNRvNL0E; Fri, 06 Feb 2026 20:24:30 +0000
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
X-Inumbo-ID: db3738cc-0399-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=ET+
	jvimhv0hTD8RcCXIsoFo2fNr0oqaiC0W5T80dNhk=; b=TuaJmXYXVOckGjY+fvp
	JUtcQkBW9Nykwq/RgwLkQTAom9MYzHo3aHDuAtyVzo8lSOnex4VJTp7OjfKP2UqC
	HyNs3BJzzvHlvp9Ux5y18ja6rShUJ7jRXwgancXepTvqyJBlsb6Pqmyzu9JFfv/t
	wG5JlYFjnmDzluK0tXzXzBThkKJqoUV2y+YBCaY+ImYmQSlQMs4hgzLW+3QYRF3T
	h8BsTIdlnhmywXG8uumKQXG9P/Bj0+Nv//mSq7yGqrFoNhp9gM6b+j0e2Ryticsm
	pME1rkF3xMeeeZEYXT81MyexMZX1Kg//PYWIrHAe5Jt7Y4sImI6bCKzYuN7/UZk1
	l4A==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=la1hr4hTtfbe7e5SNMcliJIWPp7OXqxb+GJHjRaT2oRVhQ/IiSoaLEy9pjbRAFoN+qtkLFQtDm6mpW0MfaT48P3iJ3FLvF95ViOy+HgIeCXU2hFTH81KLfC8XDZuCXF4LJEicnSqUVMB9lgl27ibcfGHpSHAGVM65Xj/sNz9P/rT/5O2YfkOTUdjBLuZC8aqvBtkAu5nhsksVkakQpykgje8MzOwUURhCcyfR/gkUeRLPl8JwzHbeleiq/mzFFSuK1ZZ2/z1uEjDeZtFm8yrOIrre6Pxfgu64sxwpQIIvsHitvaKJscLqNp9/jYlENVmbgTZvEx4/3kPy74ns1g26w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ET+jvimhv0hTD8RcCXIsoFo2fNr0oqaiC0W5T80dNhk=;
 b=LksH4VI5X45NpIQAZi5wSjkFITiFGPR+eQ4VJ53I5FNS2V4CS7mWmS+KMVX5IIUF8Y4g8Z1CzweGnohc6KMtH0g0wE/mPkeHmP9Mbc/Gt7Gn3KqH5OX8AqItOQV8CZCpQDPO4QkKB+mLgOG0Iuwc26piq5BJAckPNRB+WYlDb+XRqvdDNTllmeudgkwNanO8wce+VWGcycODeSHB1DISDX2J45jR/teIrzBSaPuGfYhoZLn0UEGbl68pqmq6uFvvgDPtAMUYchKkwrSssf/F2Yrm0oA+NhV4SsiQGsPED2/2C+R529Zx4POCJy8DghlwyhANWeXRLh1D9ggPiqLT0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ET+jvimhv0hTD8RcCXIsoFo2fNr0oqaiC0W5T80dNhk=;
 b=AB1dhG1AMSaKfFHWNN+2EM+U2gx3AfGTqPkKVZ71NKSGji/TQ0evaCrMS5wszhcKvV8GNB9Ul87x8K5zvUPrjIymI543JJLeotT7ezpTalV9YQLopJTgE5+YrsNCmA1vte22k0FS05zxDpr0ejWUYUAs0Rg6g0CtlfGjtzsZTS4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	ppserprodsaar; bh=ET+jvimhv0hTD8RcCXIsoFo2fNr0oqaiC0W5T80dNhk=; b=
	HZc8oJ7KwAZ08gDMJP3FrICClIjt895zb5B6EPJj4D1XixGP6Xa9Ri9S6XHG4pQO
	v+DijJdG7tVsi3Vny5yK9Kh83+JDmUyMC2eBY1zJfBP2uwlKs8eTfMOWkO5RqM8G
	eR2csPUzCAH0WktNv0/5M64MLAWWfarQcsbVDSEIobIiB9zVBeKlYjNfy2cOever
	ALnpy058tRVu9LvCQlTiQ+UPFOmRvLgKmF68goPCmf55v+G+WDuz/K0UdTnhqp+W
	04eBdptMjo4tnjmRfFMEa+gV6VjJA/B086uc5dL6H5K7H6KEW82t6dxzOtYzpAh6
	hqYh6y3hrCd6PdETgMvn+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=ET+jvim
	hv0hTD8RcCXIsoFo2fNr0oqaiC0W5T80dNhk=; b=rDuiJofUrN1DNiHr5A6BMbF
	0N3MTC39gGo8i0a4w9ZMsWTD7hFlRcDfSOJkGfEavcYdb7Lb/0M65shlrp8Wdiu+
	bUH8Y66LGrXPxICwkvXZ08nHjx6jqvEypronxrIVWDv8pNuzeM4wYmc3FS526OWh
	tyuZ9rs570rKfHg2urAjHieRvE84iT1DzV1VASpVUShMQDjsFtIp57HNlpssrBwA
	lUKYx5WHpBpsakKy3T3cU4x3LIdg7TrqZTeYBPnj4zMo1gybMXujoJctOc/9B43u
	vKo8g7cveWT0VH4EU+BV9hXbXnwPke2HD7jcOiGd3knw9ibYqNZ1nkaOIVlbz1A=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: oSNQv5OIqlOqboSNRvNL0E
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2 1/7] xen/console: remove __printk_ratelimit() from lib.h
Date: Fri,  6 Feb 2026 12:24:18 -0800
Message-ID: <20260206202424.2054758-2-dmukhin@ford.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206202424.2054758-1-dmukhin@ford.com>
References: <20260206202424.2054758-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602060151
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E80:EE_|DM6PR16MB3832:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 57674b96-e0e5-4552-140d-08de65bdbc60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7t3gSzPmm9Vt6MQEo1h66wt9Fy82cXY2jKvnv4nCbc7xv2M9GY9FVrNd6Db1?=
 =?us-ascii?Q?6QHeTFBlho7hbkv/AiqklxFA04Ka3E/bTx/0dFpQUG6sBfNgClM5dZ18E8x3?=
 =?us-ascii?Q?mTvgxTBnH4e2EjIXYHHIBd/ki5WsCOHBKzGm/PTnEWkRDxFb7PSMF73jHKH6?=
 =?us-ascii?Q?yv0yROXD8mvnl3V8oB3k+Uq8xygBjw0v5091aMNi0+lvemD9Ry8mFDdF7yZW?=
 =?us-ascii?Q?v5X7zXflAoVytHRKq1w0wy8dLrn4e3+8zxJ5IQO6n+VFmu9a9f5m90upeOiY?=
 =?us-ascii?Q?19mEzEEQuz2mF1UdPibDQnb7bAc2Dx10UF7fmW/3DMMSn7WpTe3pCwzUdgkX?=
 =?us-ascii?Q?dDokZgfm5dU0/CREePoE46vg4G3HvWbyRkQaLSQIvhsBaCQuQtmXj58QDRRa?=
 =?us-ascii?Q?gnFMw8YO1USYsn3/sIvfFl9xTNJ3JKh3JYyFf7W4qpLHL1JPfCT9oyCDtuQo?=
 =?us-ascii?Q?SgHiLwRiVAsjzjJMhlUB7TQdGt5gJk2b+7KDrc4LkkqJfMixv+b0+4mMgaj8?=
 =?us-ascii?Q?wWNw+aqWjsRMCBqHyxU8oVb2LgKvXACa3zRaj/y0pTK50FauSuBQNFZCSyEE?=
 =?us-ascii?Q?x85o1kBZdlZFiPzdV/6jYQAbQWJonU2w1uTuozLvnLAuGdT/Fon4qoUVJAKV?=
 =?us-ascii?Q?oWMG8IsuqbsyIavf2x/eZqnSdVzcyWddUsXUkI/nTZuLH41grBJ7OGEsdjOv?=
 =?us-ascii?Q?VbDF3Is7jphHzcD5HegfI9WyjyM3d/NooOQmi0gF+0D6U/LyzBG/0DFxulpY?=
 =?us-ascii?Q?Aop/40gLZaKNlqzbxprqg7TJuPHZwErLhomYcH6LN53/hdeI9kcUxaX5lWgw?=
 =?us-ascii?Q?4eED0hfoqEpsZ90N6Awn4rRq4ozQXbQ42uZ0xDA9Chl8ftO7GTFe1qjVcIC+?=
 =?us-ascii?Q?E4W0vC/YuXJsGGgpMQJmdDZ5CNeAgDJbInPL4Rp0yQbMiReOYNc1MLLVqOmb?=
 =?us-ascii?Q?UCt99+4l4W686LfTOhbwo3kjTuFR41KZLlmQz+ReocX3FxtxpkJwTzkAH5GJ?=
 =?us-ascii?Q?NxYAQ1w4JMM1ndoLdbTCtLTQJJ5woAWAHMJrDaAArpXtpJVjVCRZ8VZbQsNv?=
 =?us-ascii?Q?8HsymnzyP/SsXyP8yTDxH9EA/ERKcZ0N5xT40H+wjtjcKzO4Aed/NvVSRi7l?=
 =?us-ascii?Q?Fw3zHbJHrMrrIpyRDUuYMLKX1fj5t3uQ+tO955zdmXB5TmcEYyiNAxzF+tp/?=
 =?us-ascii?Q?CAHQpQl191niJualIbWGfiS0Ml7YkdCILwg+1vrjnBJ7BFdQDeTZH67qUGeM?=
 =?us-ascii?Q?DHRFh/Qh0teJYvXZ1JUVk9hmpUc7HAshD0ZvDcLAYME9P44v17rhAUa1AlC0?=
 =?us-ascii?Q?Uc9e1dPskUR2oAFaCD8pNuGSFogDj2qBCjOQUazP4mKa3MWP6ierJKw1bacn?=
 =?us-ascii?Q?SoDZJJaTSBffVZdyGrf9xjgOyh+sr/1zbf06oY1yrmHu4QH5BK9Mln6tOc+s?=
 =?us-ascii?Q?iKCFWaRL2/2COAKRad0ehvFMRMrpF6OJY72O8RqxRoJ+ANonziR6N2uX04wg?=
 =?us-ascii?Q?/+MAyYRnP1SuZN2Mr4Usd6yy/OrjhCv9qdufk31XLnZpaaMnFv+LJAJKJoyC?=
 =?us-ascii?Q?HONb4fRR/Av85ITxXIOHx5LgEon5UIozVuc67qbjG5APXQgNI44FS4eBiQZ7?=
 =?us-ascii?Q?Z9OQQrgiK+WVKI6i1jn3BUFckITkLwzrhB/Wt3qOaCwRrMX1J2p6+K2DRL9m?=
 =?us-ascii?Q?9iG/FA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	o+QUaML6HrR5ebvSJ2q/k+dWnvU65/nl2SOYj0D9ar1jNrlOIkaZRa8+kNECaDN+sYKxkjskvngS1GtEl2QbIhm051yM4na5+s7C8clYds5Wm0WZNPUKq/nggpW0L8/RJ1KVKOhZw1zcQMHILgpLQe3ihN7ziCTXrqSYoq1iPTRiywHrldswQaacgpERHLkOELXXkzBmbfcLET125G2nU6NSVMCeaPR+xHoKe3daG8K/s08cFl1dHq54ApVquXI517FK2PeNBqQj1yFiOvcx4VK1A8kja8yJa+rOTzWwcKd/tX5ZviwNKveaQP5tGbuQ3cDwHqyg1NW+CTLsHMllEuIKsTGcg2hlbBWX2/gmJgLM5jNdLOo7Or5L9HyvA6i4Pfr5Uux3fm4BE359Vpn/XELj4Yy8VK3JXyQcinRTxMdc10b91AQzgNFk9EKIt0S0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vhXdALSNUf5UL/rncfCA3uim18MlY5pxuIcuYebgdfaoPckl0YJ1xvZ14dK0hnKpgtoEJY9jAJPjqVcy35Yye42cwNEPhO1Np3AWAlwcxpsPZb7Q4p+sAo3G5u86oMzpqisSEzKyQOgDIJ2CvPEQvsKO0ASwHbC3zyDAjZMocPagv7gbx1qtsFNJY1KUhaaeGG2YLhsQCHUPW4HaiTtezRs/+75jP1Rl3txupiT2d6YiNTCpKZvm6tvWnDFIwQErRWnE+0zyoutw688SPlb7LuPrNOI1ncUox5qnLJQuIOJ6kq6+aYqBop2s385n4dC5oVIHkABOX0KXyNVQunxGMdqDq4fh83j/L88rVw3ewahQNsgZrx5HoXOGi4qy6W+0LFIiUWqDu8yxp2gf1floxxi12cU2mtADorl6E00nQXIghkQ3EpGCpOXnDkTL/AZZe5sD4EpaWB4TCncMYL8qTQQji9tB1k0z4wMQxuGRSyH0MMkPyht0+CeXjw2YzuJrPNzXZajq2eE2ccHRpm73DUe+CM3gMJNpdL4Nz4bYGhFikUXT1sEdlVePmjGqR8T3FDmWbdeL1ML5UbKEA+Wzbn0lPEvkVjW/sDprSJRoMOcz7XsTk3OgybDP2gnwWyXf
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 20:24:31.3981
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57674b96-e0e5-4552-140d-08de65bdbc60
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E80.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR16MB3832
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDE1MSBTYWx0ZWRfX5JCEipSBW380 PZEKmEJcM5C0LTW58G8sq5WJNu2chwZNkmslgRWMPEKlL28Kw637j9HdNreoPFiNchl5WfjzyFm /0sb9IXpaC/HavATSVgU+ImqWeBhsIIv5d/EivUV1hsCOabLjxPhKs6vh1u85WPLKlRaOX3eOub
 d21o4fJV5Vfc2BarTuBgMHf6D0Stn/3QtSv1S1z1vxG+qt0qN7lDKsnQ5Lbl1eT8smtuw3GLspe gKxPrRfLI+LP8XeG5GvmESrQSEFV9uD2Gjma6UbRv+fHErpWVguFtOsCGNX2lmlZ8xOPAjAlLbh xkPFoGsmtJqvU4dZVlV2cicuIJlKm8J2aMQtsKueWCrny3Aslhx54IWQmfEJ4hjtwYxE8pRU7bn
 RbWyjV0DGi1CmKvVHXSKJPlXn3RyethnkkOu/wlPffp7DfeSHX85UT2OXMp6lRBhKpoOf68/fX2 ZRGxdvetz4A0EcaeAmQ==
X-Proofpoint-GUID: 8m2QTyhIk_Rb8yABjFxMejuevYNTGaR1
X-Proofpoint-ORIG-GUID: 8m2QTyhIk_Rb8yABjFxMejuevYNTGaR1
X-Authority-Analysis: v=2.4 cv=B8m0EetM c=1 sm=1 tr=0 ts=69864e04 cx=c_pps a=P3LZRqt57NYhn536gl30yA==:117 a=b7IhknPlfT0FN1EembXvig==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=HzLeVaNsDn8A:10 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=cbNQJ9GKAAAA:8 a=oa5hPvwPiI9YOEVbZ-QA:9 a=G69WFyCBNqGPyalROSdv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 bulkscore=0
 phishscore=0 malwarescore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2601150000 definitions=main-2602060151
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	NEURAL_HAM(-0.00)[-0.994];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_TWELVE(0.00)[14];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:email,ford.com:dkim,ford.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 0FD9D103163
X-Rspamd-Action: no action

From: Denis Mukhin <dmukhin@ford.com> 

There's no users of __printk_ratelimit() outside console driver.

Remove the declaration from lib.h header and make the function local to
console driver.

While doing it, drop double underscores to satisfy MISRA; rename function
to do_printk_ratelimit().

Not a functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v1:
- made __printk_ratelimit() static to console driver
---
 xen/drivers/char/console.c | 7 ++++---
 xen/include/xen/lib.h      | 2 --
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 2bdb4d5fb417..af9ed38da553 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -981,7 +981,7 @@ vprintk_common(const char *fmt, va_list args, const char *prefix)
     char         *p, *q;
     unsigned long flags;
 
-    /* console_lock can be acquired recursively from __printk_ratelimit(). */
+    /* console_lock can be acquired recursively from do_printk_ratelimit(). */
     local_irq_save(flags);
     rspin_lock(&console_lock);
     state = &this_cpu(state);
@@ -1273,7 +1273,8 @@ void console_end_sync(void)
  * This enforces a rate limit: not more than one kernel message
  * every printk_ratelimit_ms (millisecs).
  */
-int __printk_ratelimit(unsigned int ratelimit_ms, unsigned int ratelimit_burst)
+static int do_printk_ratelimit(unsigned int ratelimit_ms,
+                               unsigned int ratelimit_burst)
 {
     static DEFINE_SPINLOCK(ratelimit_lock);
     static unsigned long toks = 10 * 5 * 1000;
@@ -1327,7 +1328,7 @@ static const unsigned int printk_ratelimit_burst = 10;
 
 int printk_ratelimit(void)
 {
-    return __printk_ratelimit(printk_ratelimit_ms, printk_ratelimit_burst);
+    return do_printk_ratelimit(printk_ratelimit_ms, printk_ratelimit_burst);
 }
 
 /*
diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index bb0fd446b484..f516215ca8e4 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -82,8 +82,6 @@ extern void guest_printk(const struct domain *d, const char *fmt, ...)
     __attribute__ ((format (printf, 2, 3)));
 extern void noreturn panic(const char *fmt, ...)
     __attribute__ ((format (printf, 1, 2)));
-extern int __printk_ratelimit(unsigned int ratelimit_ms,
-                              unsigned int ratelimit_burst);
 extern int printk_ratelimit(void);
 
 #define gprintk(lvl, fmt, args...) \
-- 
2.52.0


