Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D428867524A
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 11:23:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481651.746690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIoYC-0003TM-2R; Fri, 20 Jan 2023 10:23:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481651.746690; Fri, 20 Jan 2023 10:23:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIoYB-0003Qb-Vn; Fri, 20 Jan 2023 10:23:11 +0000
Received: by outflank-mailman (input) for mailman id 481651;
 Fri, 20 Jan 2023 10:23:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nUaQ=5R=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pIoYA-0003QV-Ql
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 10:23:10 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6eb32298-98ac-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 11:23:08 +0100 (CET)
Received: from DM6PR07CA0120.namprd07.prod.outlook.com (2603:10b6:5:330::10)
 by CH2PR12MB4070.namprd12.prod.outlook.com (2603:10b6:610:ae::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 10:23:06 +0000
Received: from DM6NAM11FT096.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:330:cafe::b4) by DM6PR07CA0120.outlook.office365.com
 (2603:10b6:5:330::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27 via Frontend
 Transport; Fri, 20 Jan 2023 10:23:05 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT096.mail.protection.outlook.com (10.13.173.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Fri, 20 Jan 2023 10:23:05 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 20 Jan
 2023 04:23:05 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 20 Jan
 2023 04:23:05 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 20 Jan 2023 04:23:03 -0600
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
X-Inumbo-ID: 6eb32298-98ac-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CgR91RnMF5haE+FTUBDSUlC1KR+9idpSMuP8Cfu4yPM5i9ebiEd0S6yKqDTpbOtrG8uMJi0XZfRbfYQeFNDXVfrXkyoDYDXWjsLfIHpDyQ8EG9sTCimkxgYPnMobOB3FOpNckUuISa4Z0nILoADFhJc3EZlkwtlavZDOywKesbPF4d46/ISGP4+DjKeoJAcn9MgP6kwLJ8Vwl5YCZjNMJAcZDK6AKv5YuzdJjFw6CZP6dmhrL4HinzmZ122xqGKVWxBqNtBu1XdQ2V91NcmT1hmdBK/tJU4vi7VDlCQ4XT+qwdO2tM6OGPoOJ0flqLuRcFuihAS77hus5+egCQljeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xcFMsURAjmv2DipZImXEQQ2/KV3cXpq9aizwLCqNE4g=;
 b=Dk3xryFNut0crCc5Jid0glT8iLvh7Xm5RdV0qQrQN0xgPKjuQRyZtlm7UYduoogMljz3a/u02D1rAncngvUnXBmS2DFRFIZOva7cStmKdtBcHcTjQt3M5l14iN14UXmxOB/F4lFeMIxMXRlztXkCl+9PlxRMXsogoxTMnZwQ/soL5zAuoOA4LtDtLkRuj4RQ4UxP8xpgfFV8R14zlSTzVlmAHsMTv7frSwWntvFODell/Q5kCub2MWRf6079uM7dbz7ZL2Qo9F0aJlvMISQKv9hLTPbFxwYOB9PjwfLU7kWyK5FCWMiYKlHtRfLaLOxlu/id0kQEhxaGx6SqNYk91A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xcFMsURAjmv2DipZImXEQQ2/KV3cXpq9aizwLCqNE4g=;
 b=PCc8Td2n4ZBUi5yBTlz8sA/edr6rNZUqJmE6HNSeVdIRpdz0i7EZNAFLOMuPYwbPhw6cR2YS7zf9NuotEV9/eXtqBQ9Qjc7Fi1WA29bLMXo/TFso/dgY7ieq7NJCd7JNkiBUVyefdeVsPdr3vsxgMOAQvA0sg0NDRRU93hff9Pw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <d9861060-22ba-5fce-eef6-a7f2ef01526a@amd.com>
Date: Fri, 20 Jan 2023 11:23:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 3/3] xen/arm: Clean-up in p2m_init() and
 p2m_final_teardown()
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Wei Chen <wei.chen@arm.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230116015820.1269387-1-Henry.Wang@arm.com>
 <20230116015820.1269387-4-Henry.Wang@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230116015820.1269387-4-Henry.Wang@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT096:EE_|CH2PR12MB4070:EE_
X-MS-Office365-Filtering-Correlation-Id: 340cecde-e8c8-43e5-958f-08dafad051c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HfrpMEi3cOr7YzV8GrgEfVuYM40J1+YbkpaB6CmOcYIsziddUUXx1yJECDdRVixDHf15Lo6MshR0uH2fbHt+Dnsk6d+po38tZBoeTo9OFs2x0EimMlYDRbV4zkgStOEPwgRev5kR5L/ac03uqgnyndHXoDwHgJ7dkYqq+ATZyPjVzPtk7rv33K6qgfXoT8tmjaY1/suRUS6Gr8PYv5WofoLQc8voHRIbkmqjdr9T4cm+c8F2lZ2TDvbRb2c4dTuz26qef1lXdPWUX90+jMrkQ8ydvTQK2fx9OTO2Ov9ccND1PXfsGS0bTEiVx7xU7RXNpc003ch8H/+3cT7TXR5D4vP8EwMdRK7qCa/D4ORJKJijpoWkLFcg7aL077AGcP6YfDbmKiCRiaJHPqZ1X9dtmRVqQQ5Wd0TU7ebTB2Ex1ITNDse3lioFkiGsRHY7R2a6HqjriAKic7WcIg5E62GZWCN1xoEJ/whDJbhcpzhxRUOXq6ejzMTawxT2unFXVsQk9G64ntKUix2Stt+HhFuGf0PSgGO6JL9FoHMH1MX1eRuLVPHNeL3z46QxFZ5asZ1LhwhUvaedJM2TOhL/tOLY4paV7crJFCe330rXSkf82BRwqXJhYpyyAkX8dLVjcq5MnoMEchehhC/4pD9dhVi1k7qz08Fs23gRpZfYT2YLXwFczgjrAJmMhjbkYBscbImFGdJBLWVbgIPXlgqMM0p11YIuWbjZhWnc2ebp+TCXNl5adQIs7vTK3fk1aLqdnh8R6b3zFLCLidxJZXKYFSThnw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(39860400002)(136003)(376002)(451199015)(36840700001)(46966006)(40470700004)(36756003)(2616005)(41300700001)(5660300002)(8936002)(336012)(16576012)(316002)(4326008)(70586007)(70206006)(8676002)(26005)(186003)(82740400003)(82310400005)(356005)(81166007)(31696002)(86362001)(44832011)(2906002)(83380400001)(47076005)(40460700003)(426003)(36860700001)(40480700001)(478600001)(54906003)(110136005)(31686004)(53546011)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 10:23:05.7806
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 340cecde-e8c8-43e5-958f-08dafad051c8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT096.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4070

Hi Henry,

On 16/01/2023 02:58, Henry Wang wrote:
> 
> 
> With the change in previous patch, the initial 16 pages in the P2M
> pool is not necessary anymore. Drop them for code simplification.
> 
> Also the call to p2m_teardown() from arch_domain_destroy() is not
> necessary anymore since the movement of the P2M allocation out of
> arch_domain_create(). Drop the code and the above in-code comment
> mentioning it.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> ---
> I am not entirely sure if I should also drop the "TODO" on top of
> the p2m_set_entry(). Because although we are sure there is no
> p2m pages populated in domain_create() stage now, but we are not
> sure if anyone will add more in the future...Any comments?
> ---
>  xen/arch/arm/include/asm/p2m.h |  4 ----
>  xen/arch/arm/p2m.c             | 20 +-------------------
>  2 files changed, 1 insertion(+), 23 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
> index bf5183e53a..cf06d3cc21 100644
> --- a/xen/arch/arm/include/asm/p2m.h
> +++ b/xen/arch/arm/include/asm/p2m.h
> @@ -200,10 +200,6 @@ int p2m_init(struct domain *d);
>   *  - p2m_final_teardown() will be called when domain struct is been
>   *    freed. This *cannot* be preempted and therefore one small
>   *    resources should be freed here.
> - *  Note that p2m_final_teardown() will also call p2m_teardown(), to properly
> - *  free the P2M when failures happen in the domain creation with P2M pages
> - *  already in use. In this case p2m_teardown() is called non-preemptively and
> - *  p2m_teardown() will always return 0.
>   */
>  int p2m_teardown(struct domain *d, bool allow_preemption);
>  void p2m_final_teardown(struct domain *d);
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index 7de7d822e9..d41a316d18 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -1744,13 +1744,9 @@ void p2m_final_teardown(struct domain *d)
>      /*
>       * No need to call relinquish_p2m_mapping() here because
>       * p2m_final_teardown() is called either after domain_relinquish_resources()
> -     * where relinquish_p2m_mapping() has been called, or from failure path of
> -     * domain_create()/arch_domain_create() where mappings that require
> -     * p2m_put_l3_page() should never be created. For the latter case, also see
> -     * comment on top of the p2m_set_entry() for more info.
> +     * where relinquish_p2m_mapping() has been called.
>       */
> 
> -    BUG_ON(p2m_teardown(d, false));
Because you remove this,
>      ASSERT(page_list_empty(&p2m->pages));
you no longer need this assert, right?

Apart from that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

