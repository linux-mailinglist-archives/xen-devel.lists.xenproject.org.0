Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F66078BCA6
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 04:09:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591897.924463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qao95-0008UD-7P; Tue, 29 Aug 2023 02:07:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591897.924463; Tue, 29 Aug 2023 02:07:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qao95-0008R0-24; Tue, 29 Aug 2023 02:07:55 +0000
Received: by outflank-mailman (input) for mailman id 591897;
 Tue, 29 Aug 2023 02:07:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Epr=EO=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qao93-0008Qu-Fe
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 02:07:53 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20627.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db022673-4610-11ee-8783-cb3800f73035;
 Tue, 29 Aug 2023 04:07:50 +0200 (CEST)
Received: from SN7PR04CA0196.namprd04.prod.outlook.com (2603:10b6:806:126::21)
 by MW4PR12MB5644.namprd12.prod.outlook.com (2603:10b6:303:189::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 02:07:45 +0000
Received: from SA2PEPF000015C8.namprd03.prod.outlook.com
 (2603:10b6:806:126:cafe::3d) by SN7PR04CA0196.outlook.office365.com
 (2603:10b6:806:126::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35 via Frontend
 Transport; Tue, 29 Aug 2023 02:07:45 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015C8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.17 via Frontend Transport; Tue, 29 Aug 2023 02:07:44 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 28 Aug
 2023 21:07:43 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 28 Aug
 2023 19:07:43 -0700
Received: from [192.168.139.126] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 28 Aug 2023 21:07:42 -0500
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
X-Inumbo-ID: db022673-4610-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IlKouVS0sXD0AmHFz27fSPe9UkrYP8hSUUwFj117DIGmELmJcwGcg4Aoa7te0sjgG/TrJXdyw3sJ2RSFiu+dARft/muYc3CBx5d99bMpG8g2e6/RdvC1Wx3olGh73fVgejB/EciixE8ncfYvGD/K10/NmqnIjIW9UoQWia4c2I6cQgYqTIxpYOl3iQrW69mNDWDKciNOXW7WXXykyEZRtSCotyQs7XpRtYMqZSWQ/WJdC9KtAtQgYzocCBZ6wuGhCz/1RHrBnYnGEEVxfR29q7cQnRSD6cOmQaC2c/bdINyPjxyhrzCe5556Wgi/TpkC4muzLMFp+7m93B9NXlVTHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y5tywCrlNdNA4Sw8X0tODm8GPgaTAvMQP4Zqy/xqcEo=;
 b=UDYiFIKml+NvFPgU+Fg52OIvwSZr0G96xQcCx9woY3WFLjh+UIfloNWTAfDD7CVxfcYMJdQnlNYFuPAGPR/l45ceKj2mTgx7segyUxk+doHSuKqXKwKXTAfpFhAP9kd8woP2dmNKryRrun+5IKZnRAog/cksHNOwNKsqD8iPzZEfa8jnKomq83Luy0ZQggs5BO1fFTfxplJuFqCqIgs2JJQfCslIzKjxhHq4TJClU1kDdaR6tNBRn3PZjz2UmUfzZKDGcEpPi9m0gI7SoLuQGfTc0TQdKVEkvKd4HrLbqcT3faMHUhZdR2Esy4On2xvk4Yu8kUl5rx9H7Jebq409QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y5tywCrlNdNA4Sw8X0tODm8GPgaTAvMQP4Zqy/xqcEo=;
 b=2L3d9oU2zbKdwd6GeCHcwNJl4T5nR3RhdUj84ebCk4ntpRLVa3d9YX/BWa6zhY1GjtY1JqHTREq9QCJWy3pt4YvCGLjfPKB4h+AvR0UX+3XFk1RJsj/7+YeIXSa9lh5bUP/Xlfq8W0AD11AGmBdBk/Ruwe/4wwupIIevLFnOXqs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <88d0a91e-eeec-6fe0-6dc9-b22eb24af86a@amd.com>
Date: Mon, 28 Aug 2023 22:07:36 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 6/6] xen/vpci: header: filter PCI capabilities
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20230828175858.30780-1-stewart.hildebrand@amd.com>
 <20230828175858.30780-7-stewart.hildebrand@amd.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20230828175858.30780-7-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C8:EE_|MW4PR12MB5644:EE_
X-MS-Office365-Filtering-Correlation-Id: dbcb813e-3cfd-4ffe-07ca-08dba834bbc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g32zlMbNWrkX0j6Va96+3hoBq3nclFsvmb9PupytblDCQIUJ4/jHFbOGOdfsETbk01g+QR3bwHLSV17MeoFtSC59PAgf37R0mesrhHpLqV1mwb47F73MXvCPq8dSZMYzlu53N0/G1aHatRvsfuUU2Kq0pwlyegUz/HoG8lEuZU6kfHoMMTphLI3V7HN4uUSjP4Wb9kGyuBfSmAezLi4FkX08GXJvmX3rTJmqxN1JawOogwCmnrHF3Xx50FhhXCHPnDfSsKH4rh5mStMhkrAGsEjjzNSWQKZxcoootqHqqHicBeQNDSec2PDZcOP5eKk0rn5jI/AhybyWfuIXjb5rhFS1Eg9rcQJX/e6TwRljE8RYvbFGYy4Emkj02etd8in3Wuy4eySkRrzY7rNI4q77YsqVzwBHpBZUUyovCmEgJZEs77rVlEHr5kGL5KCjLz4OBHkQ0w35KCmHwhFP5pH+CsetElN/SxUu5t2AhJkil/vGmagwuk7h40kp78QOX5WMiT6pfwOLuUo3Nz2bUBslxHqvPLZ9ykG2XlfPmKtfP8MaIH0hT+gMVBr4mMSOasMc4m7GHw3QmGGRZHIEJEESBn9xsuYyGwI0agacoaYdATwLLfGNxdJXw7/US4O4QNL1+u5O/cB1F/Ucj0CL+XwJ9r3nmhzAEB3zy+q47bJkmuh1JSfTfhNHczF24jiY/JYYsn/n21UaXDwqTAtG5kj67NPcd/UpeKptfr3Dm60TmCF9WEusdG/ByImcB66XwBGFXLGlLxttzIl0wV8vL3bDHxwKVU8BAjkhAOCvA2s4tH3EZ9d3RWnr/yBLLmeUMvt1
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(346002)(376002)(39860400002)(451199024)(1800799009)(82310400011)(186009)(40470700004)(46966006)(36840700001)(31686004)(82740400003)(6666004)(40460700003)(40480700001)(86362001)(36756003)(31696002)(356005)(81166007)(47076005)(36860700001)(478600001)(2906002)(336012)(426003)(26005)(53546011)(70586007)(70206006)(41300700001)(4326008)(8676002)(8936002)(5660300002)(44832011)(2616005)(54906003)(316002)(16576012)(6916009)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 02:07:44.3603
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbcb813e-3cfd-4ffe-07ca-08dba834bbc4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5644

On 8/28/23 13:56, Stewart Hildebrand wrote:
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 4a4dbb69ab1c..919addbfa630 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -561,6 +573,71 @@ static int cf_check init_bars(struct pci_dev *pdev)
>      if ( rc )
>          return rc;
>  
> +    if ( !is_hardware_domain(pdev->domain) )
> +    {
> +        if ( !(pci_conf_read16(pdev->sbdf, PCI_STATUS) & PCI_STATUS_CAP_LIST) )
> +        {
> +            /* RAZ/WI */
> +            rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
> +                                   PCI_CAPABILITY_LIST, 1, (void *)0);
> +            if ( rc )
> +                return rc;
> +        }
> +        else
> +        {
> +            /* Only expose capabilities to the guest that vPCI can handle. */
> +            uint8_t next;

s/uint8_t/unsigned int/

> +            unsigned int ttl = 48;
> +
> +            next = pci_find_next_cap_ttl(pdev->sbdf, PCI_CAPABILITY_LIST,
> +                                         vpci_cap_supported, 0, &ttl);
> +
> +            rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
> +                                   PCI_CAPABILITY_LIST, 1,
> +                                   (void *)(uintptr_t)next);
> +            if ( rc )
> +                return rc;
> +
> +            next &= ~3;
> +
> +            if ( !next )
> +                /*
> +                 * If we don't have any supported capabilities to expose to the
> +                 * guest, mask the PCI_STATUS_CAP_LIST bit in the status
> +                 * register.
> +                 */
> +                header->mask_cap_list = true;
> +
> +            while ( next && ttl )
> +            {
> +                uint8_t pos = next;

s/uint8_t/unsigned int/

