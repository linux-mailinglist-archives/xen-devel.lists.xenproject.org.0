Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A20822348
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jan 2024 22:33:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660859.1030512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKmMm-0001Tx-8r; Tue, 02 Jan 2024 21:32:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660859.1030512; Tue, 02 Jan 2024 21:32:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKmMm-0001Rv-5x; Tue, 02 Jan 2024 21:32:04 +0000
Received: by outflank-mailman (input) for mailman id 660859;
 Tue, 02 Jan 2024 21:32:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oNM8=IM=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rKmMk-0001RW-G7
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2024 21:32:02 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5be80520-a9b6-11ee-9b0f-b553b5be7939;
 Tue, 02 Jan 2024 22:31:58 +0100 (CET)
Received: from DM6PR07CA0068.namprd07.prod.outlook.com (2603:10b6:5:74::45) by
 SJ1PR12MB6363.namprd12.prod.outlook.com (2603:10b6:a03:453::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7159.13; Tue, 2 Jan 2024 21:31:54 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:5:74:cafe::b2) by DM6PR07CA0068.outlook.office365.com
 (2603:10b6:5:74::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.20 via Frontend
 Transport; Tue, 2 Jan 2024 21:31:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7159.9 via Frontend Transport; Tue, 2 Jan 2024 21:31:54 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 2 Jan
 2024 15:31:53 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 2 Jan
 2024 15:31:53 -0600
Received: from [172.23.76.218] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 2 Jan 2024 15:31:52 -0600
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
X-Inumbo-ID: 5be80520-a9b6-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ylb/4QdCh2smlKSVcrNYh43YusqbLvF2R6YMWAhH1R1U5QgIH0HJI7p7As1CioIzJq2meBgy+x0L5tkGWeD6A3kv38nBf9jHnjKvbLieFp54Xm2lxrds1u+uhc9Am9/W5yckQyTDh1RRMbnevoSpggxNaiXDKqpKevSOCIHkvcGfdSY6/meoP+h3xWwkCQ51frHhFAxDwp/NVqNVFPfIPONeciSR4ORBdXLvHWLAVNKt/kIS+v6bMZWRWBk0xWrK0nKH8ZP7SydVzHFsyVGWyTVG/AhlfouFW9MiXo3N0BW2Tj7hckhQqw8W8pgQYfzMzDGqKc0QhlkDHK52z1DzlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XG6vUQ6DENq+W56RI8NWXjugR1dCYi6z16wlbBg63yk=;
 b=YLr4maTLU6Qs0m92uYxz4GJaSgvV3utuMFqDJN5Dv0+PJ8Fbu/FQnRhm5HmdlRYnjnXYPYJyQNpvca6EK5Lcy5nNTBZuaWY+K6kqZIGg3O8Wlj2gd2S1p+XgdLElIAk1i4XSh/dOdIyNxLa3aBlOI3l5S3eaoZhLQZ9dzNCxFIytkEaSUu7YZfv0txexjCFxLK75mxg3aoYmHmo/B11i8yD0l2JqYBYYUGI17FVRjoCO3gx3tfoMYPeUMhPSUkkZnFUz87q0f6DOGqyGNQXZ/JOr6MXiywsEdK2HNSYZKZZNAgLbrx2XD8veiA318CKQQnH9UnosmWUhKnPZcf4GgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XG6vUQ6DENq+W56RI8NWXjugR1dCYi6z16wlbBg63yk=;
 b=LccmGFdyn8xjTjLjnNnRdi+EeVJTYRKrFDPyFn2gqhyDVONCougAbmSbqQm89LJqBViwSH7Sz+Ojn4I8lfumswiFBlI7myS5Ae066JP/dxoyhkdrKzA632RJvrljGad9VVwtGC3EOgrRn6wRyR1M76CBjTt9gCOVk+ukxAGoEhE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <fc4eae35-82d5-4aae-9dd5-f2f50785bc3e@amd.com>
Date: Tue, 2 Jan 2024 16:31:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 10/17] vpci/header: handle p2m range sets per BAR
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
 <20231202012556.2012281-11-volodymyr_babchuk@epam.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20231202012556.2012281-11-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|SJ1PR12MB6363:EE_
X-MS-Office365-Filtering-Correlation-Id: 41bf9c23-6f68-4d24-77b4-08dc0bda3d9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EZp1mJZjcR9IdpQtY/Awe+UX+Ou0aQpxr3EB/8PQchF0AgE0pCgk6ePktW9EFSEabDLHP2UP++pgzPgF0trdnqjvmaJw1wcCEV3+6EA4vkff4esyA/90bEBAeSOwONIwdKTiv6nsXWepatZWdJI+VgPn+QTKLNVb7gRIqaeCNDMFIbI3s/+0vwV1Hi9Malmr9QbRT4UMKGPC8Mrvly0AQKCc5WXADNopjiq8L91HkwwIdrdb1OGisBTVSJ/7+EHRySc6IPuJSJ4aI1+ctVrZ+a6BiW1INE7Kij5CEVD4QQwp4WfPUmYVb8pW1rNymoYyAv8+xKt++Gykrv4cGykTzKlRnRB3rapr2625cqZJUEUYgdTML4DjPL2ANv0D0MY5M9vajhHL0RqjeAjLEdW0q8NIBs375+pjaQXY841MF8iYiFtzMuKCS66Tbx8x5s71khjm8Div/KfVPCcQjmxQvV9r15Dq7WCI8EJuZZNXsLdjVTkKsw2XEW66csDZLusyXysIGMelhJQ1qLAU/4kKTdYNkTU2pBvl/iljg5l97ZOAGdZ7CJT98ThZqZig24lVGRctp91SU+zdYLrIXzVGv5kXaE7zr45XhdJ0ICPIcGCkztk+8Hk4ccpu4Mm9EjN+O6oul0DEeCvFxaCilDbl6HHIcFeWooDYYqgMnQ31UKDuh7iWqQ8zQ/n5Br96I8zrQ+FenBYxwSyJuzl9Xjy8DRiMWj3ltPzpObemC7TjW44Sk8onhAL/D/4mQzqWr+Z1G3WkvyuK9WwkUbSi1N3Z3SgB61Blh4qYD030vUeCm+apBhMykRrnK7tPNdeqYHAN3BLChtL1NPXXXrZPyj1/665o5LmsoEESfdVA2ZwfkBA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(396003)(136003)(376002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(82310400011)(40470700004)(46966006)(36840700001)(426003)(26005)(336012)(2616005)(36860700001)(81166007)(356005)(82740400003)(70586007)(110136005)(47076005)(70206006)(16576012)(54906003)(36756003)(316002)(478600001)(31696002)(86362001)(5660300002)(31686004)(2906002)(44832011)(8936002)(8676002)(4326008)(40460700003)(40480700001)(53546011)(41300700001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2024 21:31:54.3623
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41bf9c23-6f68-4d24-77b4-08dc0bda3d9f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6363

On 12/1/23 20:27, Volodymyr Babchuk wrote:
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 43216429d9..7c84cee5d1 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -598,6 +675,18 @@ static void cf_check rom_write(
>          rom->addr = val & PCI_ROM_ADDRESS_MASK;
>  }
>  
> +static int bar_add_rangeset(const struct pci_dev *pdev, struct vpci_bar *bar,
> +                            unsigned int i)
> +{
> +    char str[32];
> +
> +    snprintf(str, sizeof(str), "%pp:BAR%u", &pdev->sbdf, i);
> +
> +    bar->mem = rangeset_new(pdev->domain, str, RANGESETF_no_print);
> +
> +    return !bar->mem ? -ENOMEM : 0;
> +}
> +
>  static int cf_check init_bars(struct pci_dev *pdev)
>  {
>      uint16_t cmd;
> @@ -679,6 +768,10 @@ static int cf_check init_bars(struct pci_dev *pdev)
>          else
>              bars[i].type = VPCI_BAR_MEM32;
>  
> +        rc = bar_add_rangeset(pdev, &bars[i], i);
> +        if ( rc )
> +            goto fail;
> +
>          rc = pci_size_mem_bar(pdev->sbdf, reg, &addr, &size,
>                                (i == num_bars - 1) ? PCI_BAR_LAST : 0);
>          if ( rc < 0 )
> @@ -728,6 +821,12 @@ static int cf_check init_bars(struct pci_dev *pdev)
>                                     rom_reg, 4, rom);
>              if ( rc )
>                  rom->type = VPCI_BAR_EMPTY;
> +            else
> +            {
> +                rc = bar_add_rangeset(pdev, rom, i);

Although purely cosmetic, it looks like this should use num_bars, not i.

> +                if ( rc )
> +                    goto fail;
> +            }
>          }
>      }
>      else

