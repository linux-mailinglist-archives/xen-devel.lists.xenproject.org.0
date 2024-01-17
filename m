Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CAF82FF11
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 04:02:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668223.1040255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPwBQ-0000Mc-5K; Wed, 17 Jan 2024 03:01:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668223.1040255; Wed, 17 Jan 2024 03:01:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPwBQ-0000Ji-0z; Wed, 17 Jan 2024 03:01:40 +0000
Received: by outflank-mailman (input) for mailman id 668223;
 Wed, 17 Jan 2024 03:01:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9KYf=I3=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rPwBN-0000I4-Rr
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 03:01:37 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7699f88-b4e4-11ee-9b0f-b553b5be7939;
 Wed, 17 Jan 2024 04:01:33 +0100 (CET)
Received: from DS7PR03CA0261.namprd03.prod.outlook.com (2603:10b6:5:3b3::26)
 by LV2PR12MB5726.namprd12.prod.outlook.com (2603:10b6:408:17e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Wed, 17 Jan
 2024 03:01:27 +0000
Received: from DS1PEPF00017097.namprd05.prod.outlook.com
 (2603:10b6:5:3b3:cafe::7f) by DS7PR03CA0261.outlook.office365.com
 (2603:10b6:5:3b3::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.28 via Frontend
 Transport; Wed, 17 Jan 2024 03:01:26 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF00017097.mail.protection.outlook.com (10.167.18.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Wed, 17 Jan 2024 03:01:26 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 16 Jan
 2024 21:01:26 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Tue, 16 Jan
 2024 19:01:25 -0800
Received: from [172.23.114.18] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 16 Jan 2024 21:01:25 -0600
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
X-Inumbo-ID: b7699f88-b4e4-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qsc8TDzh7LFHkw9EsUQ5mQYXHCJlTesIqOYx62sedDL0cfTVkLM1O/3LoXnbhHa59kxgwRDyQGum1Isj0VK1GXzNLwBNUtVG2IovHuymXSwy2dVjSCQFe0JjNp9PFs9mB/HLIzA+m/CAvKXdjyoTxr9qkgxTFTbRs+T2wkqmAMWl63CRv6bRCcoP8+5AeXmRjHiKz/Na8+EkaPGaj0/i3MFCFriBVXsStlaCl36cjXjcGFYFjqswavATWvufSn+wCHlafV8iGEP/0hiiJRI7G4CKwZsIHz7Gkntee+C+rxAg7G4I2Oxhox6h0rZHqjocLOXPtF2b9k0UA7dkuv3RSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MNNHE6Ftb6vwaD5IemdXbcNRacTkAvCax9LPZskNdUU=;
 b=GrB6CciYu+EoMG4SykABHtb+k1injzeASqtRqi1ylIwIqFVwzE10Hphutgw0Vsh48sRgjlf648R8XnppMVPIpX+PXRqFOo81bV0+XCMBMJmaLa3xEli8HPU0rCbTV2vdTjnfWHi6PD8SEs4yhHkAqGOU9N4mqaMeN/v31X19+T/uxs0KQrcvj0w+OqLMm1VE9UM6uF7qzWA96+5c4ErcKLu7LrkGECiVHSAW1JSHP6bSiQA0E2B5K5g523pGBu8KZxgxvihbIrEIG+9DeTIiXO4LCFgL5+ASV4tL4QAqdrTzgmngvBzzUsRqH4egAJhK9GOHkMQqnYavUmT7BA1goQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNNHE6Ftb6vwaD5IemdXbcNRacTkAvCax9LPZskNdUU=;
 b=FDUdOFWQ/rHvCM4jDTqGXxI7WrjG3AX6069XZcfW5sDOBIflpUi8yp5bo1XB9FEWnLC1j0rwnRzJ3qO04UHyaosuNhsnTIDeRnaYMqSd7ExPGrAZaaPjFW9fY4JHpwEKzAg50KBcIXSI3HElzUYM3Msy4XhWqB1f1boVRRoBir0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <05298b1e-118d-41ed-8b6d-45c69bb09ea9@amd.com>
Date: Tue, 16 Jan 2024 22:01:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12.2 09/15] vpci/header: program p2m with guest BAR view
Content-Language: en-US
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
 <20240109215145.430207-10-stewart.hildebrand@amd.com>
 <20240115194406.45711-1-stewart.hildebrand@amd.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20240115194406.45711-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017097:EE_|LV2PR12MB5726:EE_
X-MS-Office365-Filtering-Correlation-Id: e4448138-4d03-4251-047f-08dc17089885
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3XiyRb1KbxpdvWYpV1P+ABB5YxFO2OuQdBrxJjYC4gxJBT11moKfil1f/B+Ww5l2JPVPC3nUqnYuAMYEs3Zl7qILOkdQE2WBO22k2/XASn3dW1x4Vwu7t7+C34pX+67qrbokBbQtJLZeqGcLpOFjwWZ3wf5Lx8UYPAtS9KoO419vXsAxLIkl1b08Ly/dHkwabaZnnlFfP/Cz7+ljzU5QzqR+wJ2+4/h6myBgQ9CHet97ZjI62ZJ0DpcIM9NmJ1YzBeK+kcTAACPsCRdN3gEOvJ/ACcdr84nVEYWDdurYi6h8griLRKuQPiclX/n58fC7ZS41sRnhW2/mTSnu5MViLOcQ5yiLpMvBf6IrFZ7pcAQef+9ojumj4S0y44ivr0vG7TVAvrKsjqPq+hf4IUgSLStuA8L0upYmXbSHuBNfFKymxLAtbayZPVVmv+y5+rl1OBnUE2Y1CZmf0zBsL0amdAAQUTkr9Um57/6IJXaqXjjQgvGBGIv4kXYoCvD3APyd5CTaYrcXDgl1fpguO3OyDRkqJAr/9z2kqWOPpS450IJsp0A69DIbg1pdC4i1k4/qpw8OaYwTEmDk0HkQCI0/+nymHJMtc/qbEVlJ17vS34aWhcc0pi9qvTSD0+bZCTfuQUM15X/muugy9MEzANhmZj/Q8r4Tfkbn526UzKp8nHHTq1wTqUuadoO+jBKSb9Am/9fGppKS8BlTEArcvFGrqP1ZvosFY9wPh9WgX3L9i0Ci5XIXUvTnrBmcDSA1+IqZ5x39bbkKzAHj4cJw7qXV8dwqnxmUti65PkDbQTMSDRDPs7Xb2hdPKYDApQR1jY8Oz8yJVuo8GZQWnhvi2yIKjw2l6o7lKGsIQiN7W3TjmI0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(396003)(136003)(346002)(230173577357003)(230922051799003)(230273577357003)(186009)(82310400011)(64100799003)(451199024)(1800799012)(46966006)(40470700004)(36840700001)(31686004)(40480700001)(40460700003)(426003)(336012)(26005)(53546011)(83380400001)(86362001)(31696002)(36756003)(82740400003)(81166007)(356005)(5660300002)(44832011)(8676002)(4326008)(2616005)(47076005)(36860700001)(54906003)(16576012)(6916009)(70586007)(70206006)(316002)(8936002)(41300700001)(2906002)(478600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 03:01:26.5018
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4448138-4d03-4251-047f-08dc17089885
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017097.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5726

On 1/15/24 14:44, Stewart Hildebrand wrote:
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index feccd070ddd0..8483404c5e91 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -41,13 +42,24 @@ static int cf_check map_range(
>      unsigned long s, unsigned long e, void *data, unsigned long *c)
>  {
>      const struct map_data *map = data;
> +    /* Start address of the BAR as seen by the guest. */
> +    unsigned long start_gfn = PFN_DOWN(map->bar->guest_addr);
> +    /* Physical start address of the BAR. */
> +    unsigned long start_mfn = PFN_DOWN(map->bar->addr);
>      int rc;
>  
>      for ( ; ; )
>      {
>          unsigned long size = e - s + 1;
> +        /*
> +         * Ranges to be mapped don't always start at the BAR start address, as
> +         * there can be holes or partially consumed ranges. Account for the
> +         * offset of the current address from the BAR start.
> +         */
> +        unsigned long map_mfn = start_mfn + s - start_gfn;
> +        unsigned long m_end = map_mfn + size - 1;
>  
> -        if ( !iomem_access_permitted(map->d, s, e) )
> +        if ( !iomem_access_permitted(map->d, map_mfn, m_end) )

Nit: since this check will now use map_mfn and m_end...

>          {
>              printk(XENLOG_G_WARNING
>                     "%pd denied access to MMIO range [%#lx, %#lx]\n",
>                     map->d, s, e);

... I'd like to also update the arguments passed to this print statement.

