Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6BF6EA539
	for <lists+xen-devel@lfdr.de>; Fri, 21 Apr 2023 09:50:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524484.815463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pplWf-0003jW-P2; Fri, 21 Apr 2023 07:49:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524484.815463; Fri, 21 Apr 2023 07:49:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pplWf-0003gw-M9; Fri, 21 Apr 2023 07:49:49 +0000
Received: by outflank-mailman (input) for mailman id 524484;
 Fri, 21 Apr 2023 07:49:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v1kD=AM=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pplWe-0003gq-2P
 for xen-devel@lists.xenproject.org; Fri, 21 Apr 2023 07:49:48 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20629.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14c3ac6c-e019-11ed-b220-6b7b168915f2;
 Fri, 21 Apr 2023 09:49:46 +0200 (CEST)
Received: from DM6PR14CA0071.namprd14.prod.outlook.com (2603:10b6:5:18f::48)
 by IA1PR12MB7520.namprd12.prod.outlook.com (2603:10b6:208:42f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Fri, 21 Apr
 2023 07:49:41 +0000
Received: from DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:18f:cafe::f9) by DM6PR14CA0071.outlook.office365.com
 (2603:10b6:5:18f::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.27 via Frontend
 Transport; Fri, 21 Apr 2023 07:49:41 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT034.mail.protection.outlook.com (10.13.173.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6319.26 via Frontend Transport; Fri, 21 Apr 2023 07:49:41 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 21 Apr
 2023 02:49:40 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 21 Apr
 2023 00:49:40 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 21 Apr 2023 02:49:38 -0500
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
X-Inumbo-ID: 14c3ac6c-e019-11ed-b220-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IR8ZY4E6Dt/Mu58+I1NZIZA1KOfsBM6Wo9YxNzlS06YuSiUbZRnswKSetQ5ktsFz/7mRV+I2HrR+qYjPlMfsyK3tseiy3VeKDhqPE7XAxDkm/Pu2Sj2UXCjBKfjiH8hRDFcz7UnYQbWowBL9MfywE09TWsUE068sasiAqf4kCFJxdvGPgEmDMpXm0HEWA5d2V/1ovLw5QkLAv1sys5HjpaDvbT4wD8G+WEHuga0ZdM55ZXPK7nSg0TpjzhYsh/jHmdHvAK9KYTYhbBtvbKUJekUh2K1bfRYY0nQvuHqMK1zzhK3MywzxYhKDx15ooM1lG+p60Krdn1IQhAnk3wlfLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/8wNm6Kyq3OBhCcHR2i62pZvaTXgVwUALR9ycD4YwzY=;
 b=PIE1wBeLpGpFp3lVs18jKmXfvGznL3foJ2IwSOjb02sVFIyNAGzjzGi+94iYT9mkhLpjYOIMP7iw5CUi1LBHFGM8cpOEDuJ3RCtOYRuWQenT9GHlWobhvArRa4tFtht0pBdgQR6KGfzTBbk0qlXOegpuNditaSmtlGebAy8kE4kfiR2pyApqkx0cRzFhEKxnCnqvg8x6AVqR186xv+oqx3SUpVk6JhGmGD3+QFgufbpl3BMQcMa4Rt/A4oqqCo7fC6qk5Uyt68wWP7+5ULM9QL84FDvRWiuF6VdqAXP7b8GdNiF5nHwl8tn5vEdn8yGWX5KwbYHi/B8GFFhiJ09+YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8wNm6Kyq3OBhCcHR2i62pZvaTXgVwUALR9ycD4YwzY=;
 b=OzbioPs4CIqU780Vihe5icCDPFRFhuTzTdqbTEXW6OgJ0viKunCmP8XSKwKpFyuoPGpRIB1wh2I5wJJGY7nxPZY4w8+k7FMIosMkG+Ugh8p68epoRs9UdyQHqKQtTXoT3vDh62dXTkBRHqnlQyvBl9DPAWP/n4S3SOg1gXsTuuc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <d5cb19c1-33e5-73ed-20fe-c98588eb5abc@amd.com>
Date: Fri, 21 Apr 2023 09:49:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [XEN v5 03/10] xen/arm: Introduce a wrapper for
 dt_device_get_address() to handle paddr_t
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>
References: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
 <20230413173735.48387-4-ayan.kumar.halder@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230413173735.48387-4-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT034:EE_|IA1PR12MB7520:EE_
X-MS-Office365-Filtering-Correlation-Id: f7bc61f4-1deb-41e9-520f-08db423cf70b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NSOgwxmKTNZLj2gcz/5iHHkR/SXfShhoYT8qf/JLzF6kHWTZlhE1x26l2XdGLVyxiJ7l6qQCvYGQ6oGdQqs+EPiz2u+OnNHIYA3Wufu8CMEdmAgmvCaSutQZ1Kp0n3BaMdGKpsoSg0pSrcUekeUuitFWcuyoE2rhwz3TJzMttSVqE9HyL/vSeXia6zemwkH9jA6tzeVdZG/lvIxFRjJMUMmgAKh2wKxtQ7ztdjqIqR/mKtj+9OaQ6k/+8o50t4XKHLbfJo8mcNM9GUs8CJSaENG6PD1UpJNpw4zigWwav8bBcigoP6ekQuNC7t+ymMNkjgGhdZxpynty6mgPIB5V664kgaWb+e2EMcGVtoCyaesVctt/cAnhgObNS7S6HpGec5eQlsFdNmAj1VEDa7UUSK+IZIfnuIcUdCtC/dCjlYW0cU5ejEBHXrPDTTFkrkslV7VW2Sy/c1o07C9bJYXxXXKPdR6E1w6vFrHgQL5HJm0ZzYDCrvvL1jqZnY1mLhpqYNDVYYR4cPqbPYhWwEa8dBepiUhmq9ImZDfifkwp0DpPkFH6DXW1ODVa/t4mVXmeb0f5YMTnj/UWwgL5zfOgu6ItSoTd8F5iiTAcxxeSKEb+nsC4qOSa0/EMBV37ypqdmokZOema71B+jlR3HoJVrMsYdMQsyqfgPVIdRBzTpatiCXu41o6H0I7LNeSd7VWYHE6ntVGErupjIpZUeJYD8sA9aMRuedUlIx3bI2hIRTLLR2xNylwyKOCYxT3xpvfu
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(346002)(136003)(396003)(451199021)(46966006)(36840700001)(40470700004)(36860700001)(82310400005)(36756003)(4326008)(53546011)(966005)(8676002)(8936002)(86362001)(41300700001)(31686004)(31696002)(7416002)(44832011)(316002)(70586007)(5660300002)(70206006)(26005)(54906003)(478600001)(16576012)(110136005)(81166007)(2906002)(40460700003)(356005)(82740400003)(47076005)(186003)(2616005)(40480700001)(83380400001)(426003)(336012)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 07:49:41.2304
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7bc61f4-1deb-41e9-520f-08db423cf70b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7520

Hi Ayan,

On 13/04/2023 19:37, Ayan Kumar Halder wrote:
> 
> 
> dt_device_get_address() can accept uint64_t only for address and size.
> However, the address/size denotes physical addresses. Thus, they should
> be represented by 'paddr_t'.
> Consequently, we introduce a wrapper for dt_device_get_address() ie
> dt_device_get_paddr() which accepts address/size as paddr_t and inturn
> invokes dt_device_get_address() after converting address/size to
> uint64_t.
> 
> The reason for introducing this is that in future 'paddr_t' may not
> always be 64-bit. Thus, we need an explicit wrapper to do the type
> conversion and return an error in case of truncation.
> 
> With this, callers can now invoke dt_device_get_paddr().
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from -
> 
> v1 - 1. New patch.
> 
> v2 - 1. Extracted part of "[XEN v2 05/11] xen/arm: Use paddr_t instead of u64 for address/size"
> into this patch.
> 
> 2. dt_device_get_address() callers now invoke dt_device_get_paddr() instead.
> 
> 3. Logged error in case of truncation.
> 
> v3 - 1. Modified the truncation checks as "dt_addr != (paddr_t)dt_addr".
> 2. Some sanity fixes.
> 
> v4 - 1. Some sanity fixes.
> 2. Preserved the declaration of dt_device_get_address() in
> xen/include/xen/device_tree.h. The reason being it is currently used by
> ns16550.c. This driver requires some more changes as pointed by Jan in
> https://lore.kernel.org/xen-devel/6196e90f-752e-e61a-45ce-37e46c22b812@suse.com/
> which is to be addressed as a separate series.
> 
>  xen/arch/arm/domain_build.c                | 10 +++----
>  xen/arch/arm/gic-v2.c                      | 10 +++----
>  xen/arch/arm/gic-v3-its.c                  |  4 +--
>  xen/arch/arm/gic-v3.c                      | 10 +++----
>  xen/arch/arm/pci/pci-host-common.c         |  6 ++--
>  xen/arch/arm/platforms/brcm-raspberry-pi.c |  2 +-
>  xen/arch/arm/platforms/brcm.c              |  6 ++--
>  xen/arch/arm/platforms/exynos5.c           | 32 ++++++++++----------
>  xen/arch/arm/platforms/sunxi.c             |  2 +-
>  xen/arch/arm/platforms/xgene-storm.c       |  2 +-
>  xen/common/device_tree.c                   | 35 ++++++++++++++++++++++
>  xen/drivers/char/cadence-uart.c            |  4 +--
>  xen/drivers/char/exynos4210-uart.c         |  4 +--
>  xen/drivers/char/imx-lpuart.c              |  4 +--
>  xen/drivers/char/meson-uart.c              |  4 +--
>  xen/drivers/char/mvebu-uart.c              |  4 +--
>  xen/drivers/char/omap-uart.c               |  4 +--
>  xen/drivers/char/pl011.c                   |  6 ++--
>  xen/drivers/char/scif-uart.c               |  4 +--
>  xen/drivers/passthrough/arm/ipmmu-vmsa.c   |  8 ++---
>  xen/drivers/passthrough/arm/smmu-v3.c      |  2 +-
>  xen/drivers/passthrough/arm/smmu.c         |  8 ++---
>  xen/include/xen/device_tree.h              | 13 ++++++++
>  23 files changed, 116 insertions(+), 68 deletions(-)
> 
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index 6c9712ab7b..fdef74e7ff 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -955,6 +955,41 @@ int dt_device_get_address(const struct dt_device_node *dev, unsigned int index,
>      return 0;
>  }
> 
> +int dt_device_get_paddr(const struct dt_device_node *dev, unsigned int index,
> +                        paddr_t *addr, paddr_t *size)
> +{
> +    uint64_t dt_addr = 0, dt_size = 0;
no need for these assignments

> +    int ret;
> +
> +    ret = dt_device_get_address(dev, index, &dt_addr, &dt_size);
> +    if ( ret )
> +        return ret;
> +
> +    if ( addr )
Since dt_device_get_paddr() is a wrapper for dt_device_get_address(), I think you should maintain the same
error logic for addr i.e. if no addr was specified (NULL), you return -EINVAL:
if ( !addr )
    return -EINVAL;

> +    {
> +        if ( dt_addr != (paddr_t)dt_addr )
> +        {
> +            printk("Error: Physical address 0x%"PRIx64" for node=%s is greater than max width (%zu bytes) supported\n",
> +                   dt_addr, dev->name, sizeof(paddr_t));
> +            return -ERANGE;
> +        }
> +
> +        *addr = dt_addr;
> +    }
> +
> +    if ( size )
> +    {
> +        if ( dt_size != (paddr_t)dt_size )
> +        {
> +            printk("Error: Physical size 0x%"PRIx64" for node=%s is greater than max width (%zu bytes) supported\n",
> +                   dt_size, dev->name, sizeof(paddr_t));
> +            return -ERANGE;
> +        }
add empty line

~Michal

