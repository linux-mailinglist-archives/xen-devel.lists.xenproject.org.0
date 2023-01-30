Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACBD680805
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 09:59:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486648.754060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMPzs-00085B-Fu; Mon, 30 Jan 2023 08:58:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486648.754060; Mon, 30 Jan 2023 08:58:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMPzs-00082l-Bq; Mon, 30 Jan 2023 08:58:40 +0000
Received: by outflank-mailman (input) for mailman id 486648;
 Mon, 30 Jan 2023 08:58:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6cZ7=53=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pMPzq-00082c-Hp
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 08:58:38 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2082.outbound.protection.outlook.com [40.107.94.82])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 463c5aa1-a07c-11ed-b8d1-410ff93cb8f0;
 Mon, 30 Jan 2023 09:58:34 +0100 (CET)
Received: from MW4PR04CA0051.namprd04.prod.outlook.com (2603:10b6:303:6a::26)
 by MW4PR12MB8609.namprd12.prod.outlook.com (2603:10b6:303:1e2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 08:58:26 +0000
Received: from CO1NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6a:cafe::f7) by MW4PR04CA0051.outlook.office365.com
 (2603:10b6:303:6a::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36 via Frontend
 Transport; Mon, 30 Jan 2023 08:58:26 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT028.mail.protection.outlook.com (10.13.175.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.22 via Frontend Transport; Mon, 30 Jan 2023 08:58:25 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 30 Jan
 2023 02:58:24 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 30 Jan 2023 02:58:23 -0600
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
X-Inumbo-ID: 463c5aa1-a07c-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bM0V34Uxl3bUaY9A7n20C6sISq59iXYQu6hsAsYNbOf2Mqe5gX2Z3Lle5awE+HuAsmTlJiNpBtpDms7UvqfhnNNd+jsm624bT7gYpLqn8EEHAIbdzYH8PL+nUKGTYL6F8p4vRK9kPrkEqaAjB6SevB/XcDZXxRbKVXw8qPEPBJLtQPQLAglkRL4U5ZFPXg+AAOIAgJQyVpbhekQ5DrUULB7+Tg4BigED9kC8aP+sShWIgaKVTCqvbqeORPBQFTYHjT6V25/1XCwK+1Wq4dAXOopLjxk7IBBzw2aCX9FPEXZ849rhrhPE4J0v/XOT2fQ3XAE/jJ5SCkGzZoEjLH272w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MD4Ak62XVoYyV1FkkTpqciDvLoLSM+HT5y72qDbWiio=;
 b=Qa6fBndA3fuGIYhmPYGyIfP5HXecTHfdPuUdjSqUPnjHvbkUEVztTZ8YvvOe2kLabFng79vVpZFkKraqRdCrtw2YEDTsT9HKGVS+GBvKAK6tgl1ydpk35lzsMoyMwTHtmzl69YZHa0Blna2Kv05XWfmVxDsCoiwKBMQpc7hscCnTHScSKU5PKUISqfly9CyKSva6ub6FniXrwzXj98cX4ZVdsp1wAsjk3vSkZRcQ0pxoSJWqamUdOIf725wrjiqjiTV+5C5LWiu4jHXhxw+P5Yc2PIo/A94L6ID48xrNYvn6H0yF//4YePD/NJwzD53e9bctGzwuGMjoAftunPSYTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MD4Ak62XVoYyV1FkkTpqciDvLoLSM+HT5y72qDbWiio=;
 b=SEjKk4m79wxCdycfBS14+hg25LHltFn9tE9bM0wfDUbL0OchEVbHq/hg8EwGJMw5Zau+FGyIEK1/BTwwPT6EYv0eGxWtJTjwLwngQpEUaJi96RmqJU7CkW/7+bkasNLdATmx8hbKyk496OrTZwyiQ7lGQ2XowqCryYokQOqXgC0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <3872442b-b9d0-4594-0869-d505aefa5aa5@amd.com>
Date: Mon, 30 Jan 2023 09:58:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 1/5] xen/arm32: head: Widen the use of the temporary
 mapping
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Julien Grall <jgrall@amazon.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230127195508.2786-1-julien@xen.org>
 <20230127195508.2786-2-julien@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230127195508.2786-2-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT028:EE_|MW4PR12MB8609:EE_
X-MS-Office365-Filtering-Correlation-Id: 56fdb194-2161-4422-4822-08db02a0260d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KT3yLMPu4612ylXsc/K4dADwMnayTDfw7LhBiH+qYuX4SRabhHfQzhhU4ayoto2ZRxWr9sA3AjVt+R78JElugyAb/r3tJ5ThdgH53ZMWE6Rqrxg6DVUxw9SoSJCIkWkQEG50dmRjO8QkZ5Uby5O2OOwi8lXacrrSZQ+YISgZyYmZY9cHLTOKoC7MIbArVZaIZy1EJOvXcWz6RKQVN868LCK/D3aM5PKu5GIf+Wba12SaJMq3vPx6mPqXox78Iij6ZlP1FxK4Hg4ncD5Q180BOAyk8gppHBdX1w+Raj4Od+7hFV9lrYntz1TXicTsLcA+qWAN9GKOGPHEeHe2E5v3+gwx+AecEMRWK+fEJPAChqbXzjRI1O/cm2DNuIrFzjn4gBucVlX+4blB/Ccc1zptllyKeVywNwRwrKewHM44Re+PMOzAYvb886sJujAIN9RF67hxOd+6Uz6adxrXfm2ywhFB820yWGHLR8X1qhDmqh4cocReO08f7KTVIMewzHbwR3MYcIxAJHRBzvD9aXx4vC/Mg11anBBaE2K1PQZnT5fFNDr31Ek+nQ5PIZDE7elD22cnRFgEjmleU5XoXa9uqzEWy8vOjmCg6DME4SlQmx7h7rvPeQPYyClvZHwka7QUwjJVN0EpM0+cmtB3k3HvYdYQDX9x9NSvy/YpH+b3kGyryruMcvszF7FCtQORgkcNMuH3/ggbegdaVXncFZMRRtijihVqiQaL/NjmCbl/l+uak7VPn40NSWqMsqbXnb5+YBep+4P2U4pK1GgoaYlcBg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(136003)(396003)(39860400002)(451199018)(40470700004)(36840700001)(46966006)(8676002)(8936002)(41300700001)(2616005)(4326008)(70206006)(70586007)(47076005)(5660300002)(44832011)(83380400001)(426003)(336012)(53546011)(478600001)(16576012)(110136005)(54906003)(316002)(26005)(186003)(81166007)(356005)(40460700003)(36756003)(40480700001)(82310400005)(31696002)(86362001)(2906002)(82740400003)(36860700001)(31686004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 08:58:25.7922
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56fdb194-2161-4422-4822-08db02a0260d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB8609

Hi Julien,

On 27/01/2023 20:55, Julien Grall wrote:
> 
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> At the moment, the temporary mapping is only used when the virtual
> runtime region of Xen is clashing with the physical region.
> 
> In follow-up patches, we will rework how secondary CPU bring-up works
> and it will be convenient to use the fixmap area for accessing
> the root page-table (it is per-cpu).
> 
> Rework the code to use temporary mapping when the Xen physical address
> is not overlapping with the temporary mapping.
> 
> This also has the advantage to simplify the logic to identity map
> Xen.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
> 
> Even if this patch is rewriting part of the previous patch, I decided
> to keep them separated to help the review.
> 
> The "follow-up patches" are still in draft at the moment. I still haven't
> find a way to split them nicely and not require too much more work
> in the coloring side.
> 
> I have provided some medium-term goal in the cover letter.
> 
>     Changes in v5:
>         - Fix typo in a comment
>         - No need to link boot_{second, third}_id again if we need to
>           create a temporary area.
> 
>     Changes in v3:
>         - Resolve conflicts after switching from "ldr rX, <label>" to
>           "mov_w rX, <label>" in a previous patch
> 
>     Changes in v2:
>         - Patch added
> ---
>  xen/arch/arm/arm32/head.S | 85 +++++++--------------------------------
>  1 file changed, 15 insertions(+), 70 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index df51550baa8a..93b0af114b0c 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
...
> @@ -675,33 +641,12 @@ remove_identity_mapping:
>          /* r2:r3 := invalid page-table entry */
>          mov   r2, #0x0
>          mov   r3, #0x0
> -        /*
> -         * Find the first slot used. Remove the entry for the first
> -         * table if the slot is not XEN_FIRST_SLOT.
> -         */
Could you please add an empty line here to improve readability?

> +        /* Find the first slot used and remove it */

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

