Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 332E17B0BD5
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 20:18:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609155.948060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlZ6z-0000dB-Al; Wed, 27 Sep 2023 18:18:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609155.948060; Wed, 27 Sep 2023 18:18:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlZ6z-0000b4-7X; Wed, 27 Sep 2023 18:18:13 +0000
Received: by outflank-mailman (input) for mailman id 609155;
 Wed, 27 Sep 2023 18:18:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PTSH=FL=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qlZ6x-0000ay-EK
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 18:18:11 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20608.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 355657ec-5d62-11ee-9b0d-b553b5be7939;
 Wed, 27 Sep 2023 20:18:08 +0200 (CEST)
Received: from BYAPR03CA0024.namprd03.prod.outlook.com (2603:10b6:a02:a8::37)
 by DM4PR12MB6544.namprd12.prod.outlook.com (2603:10b6:8:8d::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.26; Wed, 27 Sep 2023 18:18:03 +0000
Received: from CO1PEPF000044F0.namprd05.prod.outlook.com
 (2603:10b6:a02:a8:cafe::b8) by BYAPR03CA0024.outlook.office365.com
 (2603:10b6:a02:a8::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21 via Frontend
 Transport; Wed, 27 Sep 2023 18:18:02 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F0.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Wed, 27 Sep 2023 18:18:02 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 27 Sep
 2023 13:18:01 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 27 Sep
 2023 11:18:01 -0700
Received: from [172.20.57.36] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 27 Sep 2023 13:18:00 -0500
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
X-Inumbo-ID: 355657ec-5d62-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ncAln+xSowuJTJGNJUEfGixpmQzcH9roNYsY8427lKG4Gkyt6VsYjAwPdhex1LlHfWzpcYi3TLYEeuxJLrD+DiYPHWDGJs+a6VNV2Bcb5bUhhFjq6FECV3MCFj//tAN6QXIE9xWwIryh6z1aE7SXDjoeN4MZD5M/WLo7eryfM+c9ed4YqHPqfUxhtGleSxzzk/qHV7PzBVJUXPmAygcuVRiHEuiPHlmOshMuQSBcep3ZaI0FQFCE4on5TByOvlike24My6HkB9oaMizCSSV+qqoycIMsbIzVoKLvih/13zsUpA1Sg6E0p91A7nWv69HwW6V2kH8IktbjhTS5gQFgfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQnMk1kdUzPx0umjAMVNF7OS1oL0eGWwyXm40MxTW5o=;
 b=VTkA3fwLnn7X4EVmIBH4SPQzYQ5Q96o6/vz/R/aXigVTUt7PChQ+t7QN5TbaKLLINbGQtM10NyFvk1/T6B/rkNzny7T8wSv/S/KJ/toSAcVt6de7YpHAL+lNu5WwqPeUrMjHobZoDADu4tVvhWIKWMCT+6/Hd67YBmUj4MDz77zSNlEcyXEJ69Rjc4v9rV0qd7ztf3Q/X32hOqBiS6w5u/a6rpEZvYk70Qt9z1HjCqQBc3y4U6BOURzLBzSEbBbxeVn7n85CjBEfpA4u/if/1VAQSFyRwyRu8pNeaeJFvfJkWRJ9uAftlVAtQPWvJrp3UcIx5IPhAK+UYjUf2KXpHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQnMk1kdUzPx0umjAMVNF7OS1oL0eGWwyXm40MxTW5o=;
 b=rGacOHuJfH2QNkoO9ovMV3KjUJz6llWQumasgZ8dFKkm013V9aNWsbq0Y8pnAyF92lDgfPJiziHxLn7+tRi076PkcQIliDrWuv34d0oo8EyEjxo/R9ku/yX7pMT92damImyL7gT5N7EeOLDNnGYuqvB0RB6qq4tyMpYK5eHFHDc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <80e75099-e6c1-4a92-ede0-2db6f06e801d@amd.com>
Date: Wed, 27 Sep 2023 14:18:11 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v9 08/16] vpci/header: handle p2m range sets per BAR
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
 <20230829231912.4091958-9-volodymyr_babchuk@epam.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20230829231912.4091958-9-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F0:EE_|DM4PR12MB6544:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f9b2c0f-694c-47b4-ecdd-08dbbf861667
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BqcH3x6WGZLADTy7sMCNzg/385R3UGRf7rGYadsgC7sJ6ckGpH9K6aTbWrAsaqYUSM4Kc1Z26T9yVfMf9UzkcBNULqYnF9kKEwpL9K3935B3P3SUTZoVo25MZWSGMmFrEaDjFzHIaTl37mc4EP3Q4sp84MUVpvGY3RAyILST9RpMxw1ZGCmOlzQDdV63d9RYk5F6LpvCvDb9pAnGiqIpl6nvOaKziXZodlmQLuxoCyuiNJW7cU4sn6PzwpFstvXZrHZUL8e4RbgjFhMbLSU3aoB8aEwbJ6lFkKGcC6ijqpUztkOyEKW1K78NgfJjMjt/caHpOIXLzWbpvbdyGmXYKrE7chJ4KnzBtKLawYpudd2J09XqJGV0LMlwhIyLFP3vdn7+qee2tUO9ed6SMjmmu4oKhVgqTBZKwKwqV8wZjdX5C861bLg9hwal0iU7AAeoAGcuKopvFZSMehfPsfrGQMQyTGjId3KZMWB0QhytZROt6/pkZMUmZA/6qTLUTRF+r1+dI7HW7CZZgYltJ1UUFZNllskSxxcm1G1xVQJglwyGOQNxhfDLpfWAs6uGlea5trWrlt6+f/vAyDr8hpQ4Se98BpdAHce6kvc5ykRNb9BgD14+tYTLVsw9FMbHjaQlntZGAC9P+85wE7Kk0W0lmDp6dU4ya/5JTNh3GO/HzM3comUzaQe/v1fIsOYEfqqMmUHdmf74kJuPwksy1MP1kRL32TAxHg/sDBXcMGGXnqBSpqJT4mcu6u8UB8obMBiMpQ37DZLjXA8vGpEUWnqgihW9g5svizdD4QSWUQcnYI8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(39860400002)(136003)(376002)(230922051799003)(82310400011)(1800799009)(186009)(451199024)(40470700004)(36840700001)(46966006)(84970400001)(2906002)(5660300002)(44832011)(86362001)(16576012)(41300700001)(316002)(110136005)(8936002)(31696002)(70206006)(8676002)(70586007)(54906003)(478600001)(4326008)(31686004)(6666004)(26005)(53546011)(356005)(82740400003)(81166007)(40460700003)(2616005)(83380400001)(426003)(40480700001)(336012)(36860700001)(47076005)(36756003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 18:18:02.4083
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f9b2c0f-694c-47b4-ecdd-08dbbf861667
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6544

On 8/29/23 19:19, Volodymyr Babchuk wrote:
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index e96d7b2b37..3cc6a96849 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -161,63 +161,101 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
> 
>  bool vpci_process_pending(struct vcpu *v)
>  {
> -    if ( v->vpci.mem )
> +    struct pci_dev *pdev = v->vpci.pdev;
> +    struct map_data data = {
> +        .d = v->domain,
> +        .map = v->vpci.cmd & PCI_COMMAND_MEMORY,
> +    };
> +    struct vpci_header *header = NULL;
> +    unsigned int i;
> +
> +    if ( !pdev )
> +        return false;
> +
> +    read_lock(&v->domain->pci_lock);
> +    header = &pdev->vpci->header;
> +    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>      {
> -        struct map_data data = {
> -            .d = v->domain,
> -            .map = v->vpci.cmd & PCI_COMMAND_MEMORY,
> -        };
> -        int rc = rangeset_consume_ranges(v->vpci.mem, map_range, &data);
> +        struct vpci_bar *bar = &header->bars[i];
> +        int rc;
> +
> +        if ( rangeset_is_empty(bar->mem) )
> +            continue;
> +
> +        rc = rangeset_consume_ranges(bar->mem, map_range, &data);
> 
>          if ( rc == -ERESTART )
> +        {
> +            read_unlock(&v->domain->pci_lock);
>              return true;
> +        }
> 
> -        write_lock(&v->domain->pci_lock);
> -        spin_lock(&v->vpci.pdev->vpci->lock);
> -        /* Disable memory decoding unconditionally on failure. */
> -        modify_decoding(v->vpci.pdev,
> -                        rc ? v->vpci.cmd & ~PCI_COMMAND_MEMORY : v->vpci.cmd,
> -                        !rc && v->vpci.rom_only);
> -        spin_unlock(&v->vpci.pdev->vpci->lock);
> -
> -        rangeset_destroy(v->vpci.mem);
> -        v->vpci.mem = NULL;
>          if ( rc )
> -            /*
> -             * FIXME: in case of failure remove the device from the domain.
> -             * Note that there might still be leftover mappings. While this is
> -             * safe for Dom0, for DomUs the domain will likely need to be
> -             * killed in order to avoid leaking stale p2m mappings on
> -             * failure.
> -             */
> -            vpci_deassign_device(v->vpci.pdev);
> -        write_unlock(&v->domain->pci_lock);
> +        {
> +            spin_lock(&pdev->vpci->lock);
> +            /* Disable memory decoding unconditionally on failure. */
> +            modify_decoding(pdev, v->vpci.cmd & ~PCI_COMMAND_MEMORY,
> +                            false);
> +            spin_unlock(&pdev->vpci->lock);
> +
> +            v->vpci.pdev = NULL;
> +
> +            read_unlock(&v->domain->pci_lock);
> +
> +            if ( is_hardware_domain(v->domain) )
> +            {
> +                write_lock(&v->domain->pci_lock);
> +                vpci_deassign_device(v->vpci.pdev);

s/v->vpci.pdev/pdev/ since v->vpci.pdev was assigned NULL a few lines earlier.

