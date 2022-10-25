Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8595560C8FA
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 11:53:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429713.680881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onGcW-0002JI-3V; Tue, 25 Oct 2022 09:53:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429713.680881; Tue, 25 Oct 2022 09:53:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onGcW-0002HU-05; Tue, 25 Oct 2022 09:53:16 +0000
Received: by outflank-mailman (input) for mailman id 429713;
 Tue, 25 Oct 2022 09:53:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N5aB=22=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1onGcU-0002HO-G8
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 09:53:14 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062.outbound.protection.outlook.com [40.107.92.62])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5df316c-544a-11ed-91b5-6bf2151ebd3b;
 Tue, 25 Oct 2022 11:53:12 +0200 (CEST)
Received: from BN8PR07CA0034.namprd07.prod.outlook.com (2603:10b6:408:ac::47)
 by PH8PR12MB7375.namprd12.prod.outlook.com (2603:10b6:510:215::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Tue, 25 Oct
 2022 09:53:09 +0000
Received: from BN8NAM11FT094.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ac:cafe::fc) by BN8PR07CA0034.outlook.office365.com
 (2603:10b6:408:ac::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28 via Frontend
 Transport; Tue, 25 Oct 2022 09:53:08 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT094.mail.protection.outlook.com (10.13.176.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Tue, 25 Oct 2022 09:53:08 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 25 Oct
 2022 04:53:07 -0500
Received: from [10.71.192.110] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Tue, 25 Oct 2022 04:53:06 -0500
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
X-Inumbo-ID: d5df316c-544a-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XOQz80UAMO7/e57TCNwy+IW3vdfnWj7dFK3ay6tP7HeUmwy10+O1dzN06a8qe0dcZpstmB1bsizFnJ1ZOD9hIEJz4W28y3KFxeAeUZ/bc1SxOyQLCI4N5rZ/5znIzyJQFJEwg+H7F5AmbW9k8sJoLXBIAfRMF4LY/fDJuvxOlAkg82HN7spHGL/Fs42uStVZnLzqaybIYlu5MJlDr4jNbVXhehnKnt8AG8TRDmYsHPSOsObyQX306PY/r2wLDlXqLYXMS+Uw73ThzJnNE9ZS4nDyklzTLCeA9fhGB+DnPF+qeMH8+fgyEExwuE3IAeo2hehBEMW4LRSrfJHAL0xuKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0YaOHtMnSNT4PZxeNifK/eY0BAagSfNYbflkwrC+ywI=;
 b=krTyagdNbDRNh78PdiR+twGTiyP8oDo3CdSMnmk9f4rNhB4NQP4Y/mxid8R6skOXgB+E4XUY46tixxrZuZrgbfzUMaup/xNK/Ubf0bg+4TjwpWC7rEDrZThpkJ7Td4iX68q6zHLYgoK030FMU57Xm6RLbAuowll0Do3q2AlZuZVD4SnRyf2/PctBtjbQqmaV8WOXdw3gyr9jwv5OVPSDuZk/Vbr3umHoQyZxC2t0d0/zj82u0paERxLcDG9K7VzxJADE/LtdxUKCAAmt35xArFuhWEOUxbI7fZRW3O7THByktQOizGOJWwL2oegR3kAokEhuGtfXISN/KF70PPWr7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0YaOHtMnSNT4PZxeNifK/eY0BAagSfNYbflkwrC+ywI=;
 b=g/yMNgzwiLStW7qUY7Bq0Zk4FLRUbEPSWHKwyhZdSp1rZSzvG8ITtPxvW7EXPcGrBkNn4xx/tOqHCmUg+xvo3U9w55TsWSgPzgjycSliDGkY/q8wjLOTtotp+DrQ/fujcvRGdON+ZotrxSRv/gvAmRDdPgqcSz06nN/AVlNciLQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <f50c3f5c-fa71-3963-d95a-d48fe801ad9e@amd.com>
Date: Tue, 25 Oct 2022 11:53:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [RFC v2 03/12] xen/arm32: head: Introduce an helper to flush the
 TLBs
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <marco.solieri@minervasys.tech>, <lucmiccio@gmail.com>,
	<carlo.nonato@minervasys.tech>, Julien Grall <jgrall@amazon.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221022150422.17707-1-julien@xen.org>
 <20221022150422.17707-4-julien@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221022150422.17707-4-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT094:EE_|PH8PR12MB7375:EE_
X-MS-Office365-Filtering-Correlation-Id: 89faed8e-089c-4135-2f2a-08dab66eb87b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O1RmdxB7k8J62CJJ3LTV12kMF2TrxtaAfrVv9zK/JKn53185UarpgnQTJANAJezy+n7OdlpOl9UHRpncJbntSirhgCp1RyfS2QxuuLb5nlsDpGSNo1+1WBmsLL3ktRlSPdA9Lojo34j1N7gRZ+KrGed94vUCKPdCyk7ELfKpdl6EZLiT+EZiJd1vPdZuvlU3Sb1+7fuklFm+3MtFEInwZJemSbqjS56T8Tlu65DUy8CKCYcwAZQOYSjU2BYIlPH49LoMJMQFcYZy0D1UWWIYVHeSgaEf6FiOSlVolC3Nt3vZaFTzmdFPrtcf1bdGFGJM/B2ZiizSVh6XnE39ulwOYxD0/FuWrYzw2+1oKipah7odiLNF2bnEFkUg8LSk/iV4RVGGKmA26YXMCqegeV5XAA3pUOb2u0JNWEJuMlkEp9fzrvNgH/bWGQ6vka3NLP6KIdfLvVp9aPsj7JXdvQKehrzq2+IHvc33MlRXzSjTZJKXySPh8ZOmHlY6FuDKBcr7EyqdJNkJf7G2jyvaIg9woUEF1FFYUcBCIlhdaXvBxbUQDbZci0MXE0v9Whdlx/Io+eiLSjD44rkqmGktmlVTXmIMtAj5xnFRA0Vye/yIbyUlrOTfr0LVdlYQ8VkchhWKVbu8uCygyWTRKbQcLp5QspnJOA7EgFqX9/ZdhS+9Flg/PhIag8you+y/w+TUPzvhjA/BXDSRL9Ov0YQUm0bIgqhG3rv2rJzBLv9gWogFB0a+F+TLpxOKYa26pzNLoJLrlJhIwao1eZ38C2TbvJyCTtS6gsGY7p2PA/g7Yi4fqDBFrWo/Z0FjUxTZbQPLerQC5B0Smzs5bYophqZvKsbtuA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(396003)(136003)(376002)(451199015)(36840700001)(40470700004)(46966006)(8676002)(110136005)(8936002)(70206006)(82740400003)(316002)(26005)(53546011)(16576012)(41300700001)(86362001)(54906003)(40480700001)(70586007)(4326008)(478600001)(40460700003)(81166007)(2616005)(44832011)(36756003)(356005)(31696002)(83380400001)(82310400005)(47076005)(5660300002)(31686004)(36860700001)(186003)(2906002)(426003)(336012)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 09:53:08.3616
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89faed8e-089c-4135-2f2a-08dab66eb87b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT094.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7375

Hi Julien,

On 22/10/2022 17:04, Julien Grall wrote:
> 
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> The sequence for flushing the TLBs is 4 instruction long and often
> require an explanation how it works.
s/require/requires/

> 
> So create an helper and use it in the boot code (switch_ttbr() is left
> alone for now).
> 
> Note that in secondary_switched, we were also flushing the instruction
> cache and branch predictor. Neither of them was necessary because:
>     * We are only supporting IVIPT cache on arm32, so the instruction
>       cache flush is only necessary when executable code is modified.
>       None of the boot code is doing that.
>     * The instruction cache is not invalidated and misprediction is not
>       a problem at boot.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
>  xen/arch/arm/arm32/head.S | 31 ++++++++++++++++++-------------
>  1 file changed, 18 insertions(+), 13 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index 163bd6596dec..aeaa8d105aeb 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -66,6 +66,21 @@
>          add   \rb, \rb, r10
>  .endm
> 
> +/*
> + * Flush local TLBs
> + *
> + * tmp1:    Scratch register
I would love to adhere to the way of describing macro params like you did in mov_w. This would mean:
@tmp: scratch register

Apart from that, the change looks ok.

Question on the side:
Why do we use nshst in assembly and ishst in TLB helper macro?
Is it because the latter is also used to flush the inner TLBs whereas the former only local ones?

~Michal


