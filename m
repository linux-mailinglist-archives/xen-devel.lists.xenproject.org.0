Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9997A6027D1
	for <lists+xen-devel@lfdr.de>; Tue, 18 Oct 2022 11:02:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424807.672515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okiUW-0001NU-W1; Tue, 18 Oct 2022 09:02:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424807.672515; Tue, 18 Oct 2022 09:02:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okiUW-0001Kx-SO; Tue, 18 Oct 2022 09:02:28 +0000
Received: by outflank-mailman (input) for mailman id 424807;
 Tue, 18 Oct 2022 09:02:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=im79=2T=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1okiUV-0001Kr-GS
 for xen-devel@lists.xenproject.org; Tue, 18 Oct 2022 09:02:27 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2062.outbound.protection.outlook.com [40.107.212.62])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9511a59c-4ec3-11ed-91b4-6bf2151ebd3b;
 Tue, 18 Oct 2022 11:02:25 +0200 (CEST)
Received: from BN9P223CA0007.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::12)
 by PH7PR12MB5710.namprd12.prod.outlook.com (2603:10b6:510:1e1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Tue, 18 Oct
 2022 09:02:22 +0000
Received: from BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10b:cafe::6e) by BN9P223CA0007.outlook.office365.com
 (2603:10b6:408:10b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30 via Frontend
 Transport; Tue, 18 Oct 2022 09:02:22 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT012.mail.protection.outlook.com (10.13.177.55) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Tue, 18 Oct 2022 09:02:22 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 18 Oct
 2022 04:02:21 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 18 Oct
 2022 02:02:21 -0700
Received: from [10.71.192.110] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Tue, 18 Oct 2022 04:02:20 -0500
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
X-Inumbo-ID: 9511a59c-4ec3-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SeS5ntB3Yqx4Gi3mTpCBFnn3Qu35kZcuY/3WHVfyl4VUTkl9wNsnY3KvLxY1KvZg7/t1lzKMwQdAy77Q5LcwD5/6RTtdMRMJOf8Rw/6l2teviLvr+adS86DBHDk0a7MtkZrFhkH27oWinaanQHnom63fBHNOaS0rQmK955uq790k7MLlTlNAVh1FJkUSHTju8BWoGqQPvDEFjbPFJ6WKRDeT1ceRp9s9aZprEjXd6Ia18/tJrCdplhrCXxoHCv2O3Nj5j2ZJ4n++VxvgUEy0mimcmVY/drDSqRY2zbdk0M1ABqjFY1OI9enBK1XTRjXqVKqSyHfQVzSvEtnKYIU+Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LAhAc+OIAwUW2yecFHQOqlRgNQVA19hhoZ1LlxWHUxI=;
 b=Gaz0RsW6gbCsRIaIyuuHGAuXHCf4YXgxH+K8pqlAC/PfIqmtlbZODWWhIzZufR9+KZV57tAjuQ+aEG6EH3SrR/1ejyJ1TdllGhGGL0uCzz8TiwsHk5dielFwpIsrVFuiMTSWvSxau8/MlyxufH6Tf1teqN39NGmg37ojFsAut0g1bcxbZ1fxeQ9pagMY2uGbHt9IRigWPBDKOVXx8ogFIH637Tz9VTMCL+44RnbFdTwzKmEp0CbMHIe/t2yRNG84e8YAzniYiqw6ZMsICZ5ft2+2RKA9+zcon1e/3/twCs+Ej9SYVwNk2LgspoSj1cONr66AOuASTP6dMeU7K8wyfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LAhAc+OIAwUW2yecFHQOqlRgNQVA19hhoZ1LlxWHUxI=;
 b=arH+neiBZuWVxwr3vRsDxBRcec57+kGddZC9eOO5OSzASlLYwpKALdCZqSIA5CtXH34jFE/YZo+GB5jvqMEVrX6eXM5HmYEywvuMYR7Iik7tiOa2HooTL9pLwodyjbnWBtSMN7MQgEtxJhNieg1aAvgSiQ2IyKdaYTzdWHimuis=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <ddef5ab7-c217-546d-0e5d-294465a49586@amd.com>
Date: Tue, 18 Oct 2022 11:02:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] xen/arm: p2m: fix pa_range_info for 52-bit pa range
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20221017173209.236781-1-burzalodowa@gmail.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221017173209.236781-1-burzalodowa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT012:EE_|PH7PR12MB5710:EE_
X-MS-Office365-Filtering-Correlation-Id: 392cec2c-5011-4a6f-0041-08dab0e777e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Iw9YTYY58Zr2duAgCybCfKfJqcBGFsimEXejGxF/4eToWMdAQjDb6pHzWhe4sEBs1szOfup86E4ALP6ogJbLNJqL5Gxr8QyRvsEiDcT0vPMa22FFyBLgC3dVws0AXFAnQG2vdNTI3zVn0fRlbYtmOAt9l4TDhOkEr4KQJYPgLp9xU/898KtmOEs9rqSWCO56i+cm9UFuInMPwUIIdDgpoaTUfUjx3fyuX2iyt6ov3Ndk5PLmFRdzR1UWLPLSlA2+8uJTuNm9EEI8iGixzFPemle9b31dfn2nK6qD/nRwij0FsMhwe22L0ykVPix0qRVhxldfIL/z8Rhvsv2LvuObfzJar0jo0R4SYPkq2a5QqkEaCDNZiyjlVKXLlgIv+DnAC7SBACcfSzsbfiwu7cu4Y6YJWO80qi84oE/A6RgDutU+q50WwlRJbiSBN+rDQLgAS17nvc+xUWJM+CDnLIoM43ogkosJFFmAOuoFNmvaAQMui/FMeiYRCrPiCmr+y530z546MK6MwzhJJdCf7sieFJ6rljZcy3hSjZGP5eA/jckyrx26F0xQ4RBP0c+XoVTgH8zNxh0PgWikHFoMTQnVNOfLSY1zQ+TCsFu4yMCC6cjZ3DovhMMTPuPvwRHz23HxmVrnkgOp/TgQWAb/JueXaRkl4qzNOF9YRfUGCxckseafyGdzqXEcpRT32+paxXlEWjGEQMatTucx2OFSx6YxbruoEcJujfD+20+XA49eQ0dy/XOCgidXTb7eU9SDSMbYk792Jbyas6GjFMSVIfrlhcOZHiyD6x/ZWiECs9d+/ImiplilQnr1r7bKGuO0oMXQINtT1NSyAs8m0pDlFXnA2w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(376002)(396003)(346002)(451199015)(46966006)(36840700001)(40470700004)(31686004)(36860700001)(26005)(53546011)(82310400005)(8936002)(110136005)(40460700003)(2906002)(41300700001)(83380400001)(4326008)(478600001)(5660300002)(316002)(54906003)(16576012)(40480700001)(8676002)(36756003)(82740400003)(356005)(2616005)(426003)(336012)(47076005)(44832011)(70206006)(31696002)(70586007)(81166007)(4744005)(86362001)(186003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 09:02:22.1111
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 392cec2c-5011-4a6f-0041-08dab0e777e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5710

Hi Xenia,

On 17/10/2022 19:32, Xenia Ragiadakou wrote:
> 
> 
> Currently the pa_range_info for the 52-bit pa range advertizes that the
> p2m root table consists of 8 concatenated tables at level 3, which does
> not make much sense.
I think the current code advertises 8 concatenated tables at level -1 (sl0=3 -> root_level=-1)
which is obviously incorrect, but the commit msg should be updated.
Funnily enough p2m_root_level is unsigned so it would lead to overflow
(p2m_root_level would end up with (1 << 32) - 1 instead of -1).

> In order to support the 52-bit pa size with 4KB granule, the p2m root
> table needs to be configured either as a single table at level -1 or
> as 16 concatenated tables at level 0.
> Since, currently there is not support for level -1, set the
> root_order and sl0 fields of the corresponding pa_range_info according
> to the second approach.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


