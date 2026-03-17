Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GelCTNfuWmrCgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2026 15:03:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 805AF2AB5CF
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2026 15:03:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256135.1550837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2V0S-0003gn-1X; Tue, 17 Mar 2026 14:02:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256135.1550837; Tue, 17 Mar 2026 14:02:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2V0R-0003dk-Ug; Tue, 17 Mar 2026 14:02:47 +0000
Received: by outflank-mailman (input) for mailman id 1256135;
 Tue, 17 Mar 2026 14:02:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wERr=BR=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1w2V0P-0003de-Ss
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2026 14:02:46 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f72ada8d-2209-11f1-b164-2bf370ae4941;
 Tue, 17 Mar 2026 15:02:43 +0100 (CET)
Received: from SA9PR13CA0157.namprd13.prod.outlook.com (2603:10b6:806:28::12)
 by DM6PR12MB4417.namprd12.prod.outlook.com (2603:10b6:5:2a4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 14:02:39 +0000
Received: from SN1PEPF0002BA50.namprd03.prod.outlook.com
 (2603:10b6:806:28:cafe::fa) by SA9PR13CA0157.outlook.office365.com
 (2603:10b6:806:28::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 14:02:37 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF0002BA50.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 14:02:39 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 17 Mar
 2026 09:02:38 -0500
Received: from [172.24.66.250] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 17 Mar 2026 09:02:38 -0500
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
X-Inumbo-ID: f72ada8d-2209-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B1NXYDbV9zjjwoa0Sx7DwBkSuM8RvDILkDjVG8XSL/QeUK+J4Hz41PIsm+hDl9Ndf9UoBTOjpZm4w9OfIAD88222GTrAeh4xKxiVPQ1BuqlhDFgnsUTZouEzN/wM5WdA1Ac2EPUs8pysF6rLzXef50XA112bN2WUuPurqJ28RWKyhlz+cCxGQ6O/A9wk1Yjvj7Xba0cOzp3WWV99vrTrHn6QHpJaZferUUtxJmhE1j7eeLLDlkOPf7dz4uoXAzw7O/wVvWHYu2ubLv1znaKPnoH68+OC0U8Y6FzcUP/El8PAgo9r/i4ZoDaQBpVq5DTFhe3TaW4ixqOl/GrCAJLORg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2WnqgkijuWbeWnj3nAVyJNEqnrR8a2gTEYVrpA262Xg=;
 b=eOZnlR66m4NaW50Iz1B5ZgcsIwOdL4WM3UaE3DqhzZuFixe8SUUteQvPCll6jDADa4pJM9/uEnSbT3N19Dx67slSgtpqOciUefVkcxfiEW5IPChXD3hbnPLVn2WuKDdXsmCzxCldKNtSJOT2H0GpQDuXurWaR/jeYp2LpeK2yTjso4B8Ogfz5vPFoeEt91Nn1gmap2taHq4fuOP/xEZOON3nqrbVgnaduC/3IiKVZDw3DE9tQEppR2SWnJgCi7umI4X2PUiaBLgn81gk+gZUipPTgu8tWNljDA8czSKR1wXVynNbhZxXRe+ak+hNPzCjSwBe3YHiij6XY/e4g7HCPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2WnqgkijuWbeWnj3nAVyJNEqnrR8a2gTEYVrpA262Xg=;
 b=tVqEAHNVUYSlKhKn4BKX39PSKskqiYQqARbfjhlr8xaN1y8Fy8gZsY1PMfBMw5tY8kGY5Rm9UlqpX13wDSGJ2z2Kof9uP2RbZp5E4OomNpIE9Y/l/p1eNPaXp7qTRVunOZkaXdEty2/sN1ZMkMuwzD4ceLeSUWl095GVry4n8/w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <251fa26d-dffa-434c-ba51-f4826282f82a@amd.com>
Date: Tue, 17 Mar 2026 10:02:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] vpci: add a wait operation to the vpci vcpu
 pending actions
To: Mykyta Poturai <Mykyta_Poturai@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1772806036.git.mykyta_poturai@epam.com>
 <ec941fbf4f8bde23fc3867e47f5ada028f8003aa.1772806036.git.mykyta_poturai@epam.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <ec941fbf4f8bde23fc3867e47f5ada028f8003aa.1772806036.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA50:EE_|DM6PR12MB4417:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b75f39b-0ae0-4b0c-de57-08de842dd996
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099003|18002099003|22082099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	KVq9Ccd1T15ulOfRvqt6vqTU5SgoyQuGUdMAXAJoXW9bbW8/tmIMw0xcrAg4CP/8MCZUh6TK53CCYFKt//EHvecO2+5dW4SDndaV6kj5T7XxGBWTYcVeTWvqfpivUnXMOE6XjeofWSRzxGQHJVd6lp/OSUEEHGbx9MO5Al/6wiUU6gqhDV1P56J2QTvkuDMlXW252Ias+MOXmgyLKE/14A1/5ZGBiEauvSkoOKZW/GKuORkq7TIuRwfWJHPXFS1SJkR1ws1mMPwQwUnCOQSsaVWLcQ0hD1VUVOaKeCqY5GhjHmV54dd7LPAGpjHV3PzA2930Oiz8YXRbEWRipZ2yfkB4WSTUHbX9Ab16Fqf6w8StomUVZK+jdxv/GqdLI4vj5JxKQppBpXn+XJMvhwRRP5X95R5JvZhtG20AgsWM2hLY954eJC6fMLLtvMqQ6JzAJqi+3zFfsKNRBAVb7gUb+MN5s7xjSkjBqzqA0VlnU9CiCUp/j1nz22zQ2GwrR8f2qpbn9cFKug3MzX5jrX7F1g7dUWe/DGPSPGsWMI1lGnKg7AlUDRiS5K+NCs9RMs2DDgiF9Cw0NmPizwW4PC09ufTY0XTS0Pivd03YDp63mCshBU73+siU0lnGgg1E1tL29KeE2KtOGI4q+4/9jEQ4EWzzeXzuSrafaq4Aaso/jrQ7TqeaKeBiHwRt1lx7H9wWUpzaotdhfwaWNbaTV7boRPsQTMxxYKovyO9R5bdIfKjPVjOvzfvlMndq5fsg/P0l0YRlrslwkzH6PLT77K/5Gw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(18002099003)(22082099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iGvy+Xs1G+alYDHGnhQ5n2Y5G8heVXwgkr4FDkxuBeVSYEyq3vJXvUR3eVvvcJF0Xm4wZfRCnoEMCLSrNnwm5Xeg6aJe+Tcf/zIp55nwosKMmvedfi72p90KYAZZh0O3WuqDF9F0YPeijbfsIlVnyysuiFols4l2bdE7JsIyz8jiT3ep7nixyE7uLinn0BrWNWJ+h71XWf/vFgWT0jBLPwZ7XK9l0chsLcjEQVDKGfJFKRIYaX9XFPvVQKP2tUxeu+9URsSEUySqOpcWjm1ikzsMEGodRjciZf3NGnrOUQa2/H0zd6K+0aTokNiU2FQNyUionGV8x0FZHkAHbsQ10R54OYAOPtutA+8ZdMRWLdFbhqtGALm6TrErKCqFhagdX1HyfgcGZBmJXn0PNamEhJDKxjUib8oMvA2tiEUqqXXGORDpuzPyMUySUKNjoNYU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 14:02:39.1816
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b75f39b-0ae0-4b0c-de57-08de842dd996
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA50.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4417
X-Spamd-Result: default: False [-2.18 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:query timed out];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[3];
	RBL_SEM_FAIL(0.00)[192.237.175.120:server fail];
	FORGED_SENDER_MAILLIST(0.00)[];
	SEM_URIBL_FRESH15_UNKNOWN_FAIL(0.00)[epam.com:server fail,citrix.com:server fail,amd.com:server fail];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	SEM_URIBL_UNKNOWN_FAIL(0.00)[citrix.com:server fail,amd.com:server fail,epam.com:server fail];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 805AF2AB5CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/9/26 07:08, Mykyta Poturai wrote:
> This allows waiting a specified number of cycles on the vcpu. Once the
> wait has finished a callback is executed.
> 
> Note that this is still not used, but introduced here in order to
> simplify the complexity of the patches that actually make use of it.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
> v1->v2:
> * new patch
> ---
>  xen/drivers/vpci/header.c | 125 ++++++++++++++++++++++----------------
>  xen/include/xen/vpci.h    |  19 ++++++
>  2 files changed, 90 insertions(+), 54 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index cb64d9b9fc..284964f0d4 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -175,76 +175,92 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
>  
>  bool vpci_process_pending(struct vcpu *v)
>  {
> -    const struct pci_dev *pdev = v->vpci.pdev;
> -    struct vpci_header *header = NULL;
> -    unsigned int i;
> -
> -    if ( !pdev )
> -        return false;
> -
> -    read_lock(&v->domain->pci_lock);
> -
> -    if ( !pdev->vpci || (v->domain != pdev->domain) )
> +    switch ( v->vpci.task )
>      {
> -        v->vpci.pdev = NULL;
> -        read_unlock(&v->domain->pci_lock);
> -        return false;
> -    }
> -
> -    header = &pdev->vpci->header;
> -    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
> +    case MODIFY_MEMORY:
>      {
> -        struct vpci_bar *bar = &header->bars[i];
> -        struct rangeset *mem = v->vpci.bar_mem[i];
> -        struct map_data data = {
> -            .d = v->domain,
> -            .map = v->vpci.cmd & PCI_COMMAND_MEMORY,
> -            .bar = bar,
> -        };
> -        int rc;
> +        const struct pci_dev *pdev = v->vpci.memory.pdev;
> +        struct vpci_header *header = NULL;
> +        unsigned int i;
>  
> -        if ( rangeset_is_empty(mem) )
> -            continue;
> +        if ( !pdev )
> +            break;
>  
> -        rc = rangeset_consume_ranges(mem, map_range, &data);
> +        read_lock(&v->domain->pci_lock);
>  
> -        if ( rc == -ERESTART )
> +        if ( !pdev->vpci || (v->domain != pdev->domain) )
>          {
> +            v->vpci.memory.pdev = NULL;
>              read_unlock(&v->domain->pci_lock);
> -            return true;
> +            break;
>          }
>  
> -        if ( rc )
> +        header = &pdev->vpci->header;
> +        for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>          {
> -            spin_lock(&pdev->vpci->lock);
> -            /* Disable memory decoding unconditionally on failure. */
> -            modify_decoding(pdev, v->vpci.cmd & ~PCI_COMMAND_MEMORY,
> -                            false);
> -            spin_unlock(&pdev->vpci->lock);
> +            struct vpci_bar *bar = &header->bars[i];
> +            struct rangeset *mem = v->vpci.bar_mem[i];
> +            struct map_data data = {
> +                .d = v->domain,
> +                .map = v->vpci.memory.cmd & PCI_COMMAND_MEMORY,
> +                .bar = bar,
> +            };
> +            int rc;
> +
> +            if ( rangeset_is_empty(mem) )
> +                continue;
>  
> -            /* Clean all the rangesets */
> -            for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
> -                if ( !rangeset_is_empty(v->vpci.bar_mem[i]) )
> -                     rangeset_purge(v->vpci.bar_mem[i]);
> +            rc = rangeset_consume_ranges(mem, map_range, &data);
>  
> -            v->vpci.pdev = NULL;
> +            if ( rc == -ERESTART )
> +            {
> +                read_unlock(&v->domain->pci_lock);
> +                return true;
> +            }
>  
> -            read_unlock(&v->domain->pci_lock);
> +            if ( rc )
> +            {
> +                spin_lock(&pdev->vpci->lock);
> +                /* Disable memory decoding unconditionally on failure. */
> +                modify_decoding(pdev, v->vpci.memory.cmd & ~PCI_COMMAND_MEMORY,
> +                                false);
> +                spin_unlock(&pdev->vpci->lock);
> +
> +                /* Clean all the rangesets */
> +                for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
> +                    if ( !rangeset_is_empty(v->vpci.bar_mem[i]) )
> +                        rangeset_purge(v->vpci.bar_mem[i]);
> +
> +                v->vpci.memory.pdev = NULL;
> +
> +                read_unlock(&v->domain->pci_lock);
>  
> -            if ( !is_hardware_domain(v->domain) )
> -                domain_crash(v->domain);
> +                if ( !is_hardware_domain(v->domain) )
> +                    domain_crash(v->domain);
>  
> -            return false;
> +                break;
> +            }
>          }
> -    }
> -    v->vpci.pdev = NULL;
> +        v->vpci.memory.pdev = NULL;
>  
> -    spin_lock(&pdev->vpci->lock);
> -    modify_decoding(pdev, v->vpci.cmd, v->vpci.rom_only);
> -    spin_unlock(&pdev->vpci->lock);
> +        spin_lock(&pdev->vpci->lock);
> +        modify_decoding(pdev, v->vpci.memory.cmd, v->vpci.memory.rom_only);
> +        spin_unlock(&pdev->vpci->lock);
>  
> -    read_unlock(&v->domain->pci_lock);
> +        read_unlock(&v->domain->pci_lock);
> +
> +        break;
> +    }

Nit: this is a lot of churn for a relatively small number of changes. Could the
indentation level be retained (reducing churn) by putting the block in a new
function?

> +    case WAIT:
> +        if ( NOW() < v->vpci.wait.end )
> +            return true;
> +        v->vpci.wait.callback(v->vpci.wait.data);
> +        break;
> +    case NONE:
> +        return false;
> +    }
>  
> +    v->vpci.task = NONE;
>      return false;
>  }
>  
> @@ -295,9 +311,10 @@ static void defer_map(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>       * is mapped. This can lead to parallel mapping operations being
>       * started for the same device if the domain is not well-behaved.
>       */
> -    curr->vpci.pdev = pdev;
> -    curr->vpci.cmd = cmd;
> -    curr->vpci.rom_only = rom_only;
> +    curr->vpci.memory.pdev = pdev;
> +    curr->vpci.memory.cmd = cmd;
> +    curr->vpci.memory.rom_only = rom_only;
> +    curr->vpci.task = MODIFY_MEMORY;
>      /*
>       * Raise a scheduler softirq in order to prevent the guest from resuming
>       * execution with pending mapping operations, to trigger the invocation
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index fa654545e5..47cdb54d42 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -212,7 +212,26 @@ struct vpci_vcpu {
>      /* Per-vcpu structure to store state while {un}mapping of PCI BARs. */
>      const struct pci_dev *pdev;

pdev can now be removed from here

>  #ifdef __XEN__
> +    enum {
> +        NONE,
> +        MODIFY_MEMORY,
> +        WAIT,
> +    } task;
>      struct rangeset *bar_mem[PCI_HEADER_NORMAL_NR_BARS + 1];
> +    union {
> +        struct {
> +            /* Store state while {un}mapping of PCI BARs. */
> +            const struct pci_dev *pdev;
> +            uint16_t cmd;
> +            bool rom_only : 1;
> +        } memory;
> +        struct {
> +            /* Store wait state. */
> +            s_time_t end;
> +            void (*callback)(void *);
> +            void *data;
> +        } wait;
> +    };
>  #endif
>      uint16_t cmd;
>      bool rom_only : 1;

cmd and rom_only can be removed from here

