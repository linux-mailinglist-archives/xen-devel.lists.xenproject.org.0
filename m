Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2507FDC05
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 16:55:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644107.1004682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Muc-0006cg-GR; Wed, 29 Nov 2023 15:55:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644107.1004682; Wed, 29 Nov 2023 15:55:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Muc-0006ZJ-DE; Wed, 29 Nov 2023 15:55:42 +0000
Received: by outflank-mailman (input) for mailman id 644107;
 Wed, 29 Nov 2023 15:55:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uyrv=HK=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1r8MuZ-0006Z9-SR
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 15:55:40 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eb2::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbc60fcc-8ecf-11ee-9b0f-b553b5be7939;
 Wed, 29 Nov 2023 16:55:37 +0100 (CET)
Received: from BL0PR0102CA0037.prod.exchangelabs.com (2603:10b6:208:25::14) by
 IA1PR12MB8586.namprd12.prod.outlook.com (2603:10b6:208:44e::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.29; Wed, 29 Nov 2023 15:55:32 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:25:cafe::32) by BL0PR0102CA0037.outlook.office365.com
 (2603:10b6:208:25::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29 via Frontend
 Transport; Wed, 29 Nov 2023 15:55:32 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Wed, 29 Nov 2023 15:55:32 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 29 Nov
 2023 09:55:29 -0600
Received: from [172.27.137.28] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 29 Nov 2023 09:55:28 -0600
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
X-Inumbo-ID: bbc60fcc-8ecf-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KbrEXsrduzYV1oPgLUkZWJZfDZwv7dNSgt33jqBAZvkLWGAcfAU3PplRk4gz7J1WiT9bywXPM6aZ4c5Nc4TRjw6G+w+eCEUYm+KB726/ETVCXezW7MkyMs2Y7t0qXEZJQ3rUVBdFl5eXqHaquMP+N7DJMmib/UWHdMmG4Nb5JqTCITGYIvOxmNAk4kv6UrlekSigzkj44/07tLExS7PrMo3+WSmdQ8ATU7f7987hB4Uvgv2o+ZeBYYQ6LX5k3qGzdM9GIbCK8jDUffuY8WPpCXMcm/bfoITSPyeafI6bRIIumuBUkcatCyWkkGHXFA7LkMfjKKb6JXqtJElVMQJgzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZP2lczezGp1Mbf67op031hoWzRqiLUyWTHsL7F1US78=;
 b=dVmAO8TB0LoqAzJSSsDhko7x5uBs/cke0p9n/8j74lSjrld9KC/tXkEHfXewaIsqXE3Mm6OA4PGWkI2A8EpTV7srBkspHLoOdWMeNHhqk+Wlviocrq3DO+vnT/ruQyA8EenMFq/0lsi+F7P4hXeMsBh0KSFilfX2lG3XY5P+m8Y2p//BOSlSqswqMK0DY0pVXd36c01JTGWnF4Ny7eNuYUj67iVdIQyv7ABfiKzkuIb7bIQSoqJ6QZhhDr45DtOKjHtfeOl77pbGq2Q2xzfJs5NvipEvCYhHLx4xS5OAMG1AZw+VjzGSE/jWT42xUEBvvX7A0eBdxHZc4fuKh9IDWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZP2lczezGp1Mbf67op031hoWzRqiLUyWTHsL7F1US78=;
 b=Ail3T7+zZIAF8hAFjNDjFcHE+5NKIHGdlxn3y4u9igB3bqBKW0hZSOQ8ioUFxolaMK3UyEeWFO4MTwRUOWlgVs7SaBe6j9jIehs9dhBy9pkoUON0h5ZGJOXszun5InCr4gwRuMfW4S1utEnXTjYP/NgBbZumAtwEU7nvXD+PsW4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <92b49bec-4d07-4f27-83f3-dca886e6fcc1@amd.com>
Date: Wed, 29 Nov 2023 10:55:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] xen/vpci: header: filter PCI capabilities
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20231128194427.2513249-1-stewart.hildebrand@amd.com>
 <20231128194427.2513249-3-stewart.hildebrand@amd.com>
 <ZWdFFa1J6l73kvxb@macbook>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <ZWdFFa1J6l73kvxb@macbook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|IA1PR12MB8586:EE_
X-MS-Office365-Filtering-Correlation-Id: 2960b872-3c59-43c2-087b-08dbf0f39e5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q6FPZsKDYc1lsugYBSDb85+tLtV03ghVbmCWNozB2H+A/Ec50Jud0WpfxE5ltJLirK/EjE2dJuGH+Eg/WKy+ynGQ7Au7kQ9JbTDLf03pjCZhKrPtm4nZT/fh45+zre4jDQBTJw4o5123VlWeAQji2YUpmzzJ6bN5+E0ThEy3HPPesaqepEzYT/K4Y/uOidCA9knFQmGZ0OZ7TaF0zA9xlHLDnct5yPvQbZe0ScV6KAmyfKy85npP/iGAwUMwDzmOSKtd8hB05EfCC4A517PKitX3lZdjUUNYmLj9SdusVozmzeoi7ZCriAGOrtiIA3M4puvIzSfsf+P/KdhpXRh40A+1CPzSj9FR6Ow6a0VB/cb5TjV2UAJgeFm5MYuG9TfPl+NowTIcANvis5TwWNpe2R6pt5eZd7Qdr4HKZUU8gmc/HZxT/3Oj5ASwcyh6FmcKoNWs8uSQc98MtpavWW6u7cnvP8Z+eboy9SMnUhbbQqgENG/j9jjKcJqWaUnzuKbIe3b0rdq5+JKD1ZeLKRDjOi4gvwrkwiiDA68WmsVFvVI83VVr4phE6cXagdBHGgJ0IkClJmJc/0vRCAZyRIWxo5fiYUMhbWOzaVbkzjdWeWH10u90+7QlPPaUvCs/l+nGvfWesLDlQxFNU/Mp8qAErjPCnBgX8/kUbER6gRnK1RSCL95fbcr3f9x8dGr9lEoPen6srQUJ1MSoETP0dgQUhe5vJrneMxr4i24yXI/uV6H76rM6R1wZjWY0OcBN4A4mqpwB9zjijX2OprO5JmwPVKDrLLwUJbCNbO217epybH4GGRudmF1SOYuZLFY0wAcj
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(346002)(396003)(39860400002)(230922051799003)(451199024)(1800799012)(186009)(82310400011)(64100799003)(40470700004)(46966006)(36840700001)(31696002)(26005)(36756003)(40460700003)(44832011)(336012)(478600001)(82740400003)(426003)(83380400001)(2616005)(86362001)(4326008)(8676002)(8936002)(53546011)(2906002)(66899024)(36860700001)(16576012)(6916009)(54906003)(41300700001)(316002)(70586007)(70206006)(31686004)(40480700001)(5660300002)(356005)(81166007)(47076005)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 15:55:32.7335
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2960b872-3c59-43c2-087b-08dbf0f39e5f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8586

On 11/29/23 09:05, Roger Pau Monné wrote:
> On Tue, Nov 28, 2023 at 02:44:25PM -0500, Stewart Hildebrand wrote:
>> Currently, Xen vPCI only supports virtualizing the MSI and MSI-X capabilities.
>> Hide all other PCI capabilities (including extended capabilities) from domUs for
>> now, even though there may be certain devices/drivers that depend on being able
>> to discover certain capabilities.
>>
>> We parse the physical PCI capabilities linked list and add vPCI register
>> handlers for the next elements, inserting our own next value, thus presenting a
>> modified linked list to the domU.
>>
>> Introduce helper functions vpci_hw_read8 and vpci_read_val. The vpci_read_val
>> helper function returns a fixed value, which may be used for RAZ registers, or
>                                                                ^ read as zero

I'll change it

>> registers whose value doesn't change.
>>
>> Introduce pci_find_next_cap_ttl() helper while adapting the logic from
>> pci_find_next_cap() to suit our needs, and implement the existing
>> pci_find_next_cap() in terms of the new helper.
>>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> LGTM, some nits below:
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks!

> 
>> ---
>> v7->v8:
>> * use to array instead of match function
>> * include lib.h for ARRAY_SIZE
>> * don't emulate PCI_CAPABILITY_LIST register if PCI_STATUS_CAP_LIST bit is not
>>   set in hardware
>> * spell out RAZ/WI acronym
>> * dropped R-b tag since the patch has changed moderately since the last rev
>>
>> v6->v7:
>> * no change
>>
>> v5->v6:
>> * add register handlers before status register handler in init_bars()
>> * s/header->mask_cap_list/mask_cap_list/
>>
>> v4->v5:
>> * use more appropriate types, continued
>> * get rid of unnecessary hook function
>> * add Jan's R-b
>>
>> v3->v4:
>> * move mask_cap_list setting to this patch
>> * leave pci_find_next_cap signature alone
>> * use more appropriate types
>>
>> v2->v3:
>> * get rid of > 0 in loop condition
>> * implement pci_find_next_cap in terms of new pci_find_next_cap_ttl function so
>>   that hypothetical future callers wouldn't be required to pass &ttl.
>> * change NULL to (void *)0 for RAZ value passed to vpci_read_val
>> * change type of ttl to unsigned int
>> * remember to mask off the low 2 bits of next in the initial loop iteration
>> * change return type of pci_find_next_cap and pci_find_next_cap_ttl
>> * avoid wrapping the PCI_STATUS_CAP_LIST condition by using ! instead of == 0
>>
>> v1->v2:
>> * change type of ttl to int
>> * use switch statement instead of if/else
>> * adapt existing pci_find_next_cap helper instead of rolling our own
>> * pass ttl as in/out
>> * "pass through" the lower 2 bits of the next pointer
>> * squash helper functions into this patch to avoid transient dead code situation
>> * extended capabilities RAZ/WI
>> ---
>>  xen/drivers/pci/pci.c     | 31 ++++++++++++-------
>>  xen/drivers/vpci/header.c | 63 +++++++++++++++++++++++++++++++++++++++
>>  xen/drivers/vpci/vpci.c   | 12 ++++++++
>>  xen/include/xen/pci.h     |  3 ++
>>  xen/include/xen/vpci.h    |  5 ++++
>>  5 files changed, 104 insertions(+), 10 deletions(-)
>>
>> diff --git a/xen/drivers/pci/pci.c b/xen/drivers/pci/pci.c
>> index 3569ccb24e9e..1645b3118220 100644
>> --- a/xen/drivers/pci/pci.c
>> +++ b/xen/drivers/pci/pci.c
>> @@ -39,31 +39,42 @@ unsigned int pci_find_cap_offset(pci_sbdf_t sbdf, unsigned int cap)
>>      return 0;
>>  }
>>  
>> -unsigned int pci_find_next_cap(pci_sbdf_t sbdf, unsigned int pos,
>> -                               unsigned int cap)
>> +unsigned int pci_find_next_cap_ttl(pci_sbdf_t sbdf, unsigned int pos,
>> +                                   unsigned int *cap, unsigned int n,
>> +                                   unsigned int *ttl)
>>  {
>> -    u8 id;
>> -    int ttl = 48;
>> +    unsigned int id, i;
> 
> Nit: those can be defined inside the while loop.

I'll move them

> 
>> -    while ( ttl-- )
>> +    while ( (*ttl)-- )
>>      {
>>          pos = pci_conf_read8(sbdf, pos);
>>          if ( pos < 0x40 )
>>              break;
>>  
>> -        pos &= ~3;
>> -        id = pci_conf_read8(sbdf, pos + PCI_CAP_LIST_ID);
>> +        id = pci_conf_read8(sbdf, (pos & ~3) + PCI_CAP_LIST_ID);
>>  
>>          if ( id == 0xff )
>>              break;
>> -        if ( id == cap )
>> -            return pos;
>> +        for ( i = 0; i < n; i++ )
>> +        {
>> +            if ( id == cap[i] )
>> +                return pos;
>> +        }
>>  
>> -        pos += PCI_CAP_LIST_NEXT;
>> +        pos = (pos & ~3) + PCI_CAP_LIST_NEXT;
>>      }
>> +
>>      return 0;
>>  }
>>  
>> +unsigned int pci_find_next_cap(pci_sbdf_t sbdf, unsigned int pos,
>> +                               unsigned int cap)
>> +{
>> +    unsigned int ttl = 48;
>> +
>> +    return pci_find_next_cap_ttl(sbdf, pos, &cap, 1, &ttl) & ~3;
>> +}
>> +
>>  /**
>>   * pci_find_ext_capability - Find an extended capability
>>   * @sbdf: PCI device to query
>> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
>> index 351318121e48..d7dc0c82a6ba 100644
>> --- a/xen/drivers/vpci/header.c
>> +++ b/xen/drivers/vpci/header.c
>> @@ -18,6 +18,7 @@
>>   */
>>  
>>  #include <xen/iocap.h>
>> +#include <xen/lib.h>
>>  #include <xen/sched.h>
>>  #include <xen/softirq.h>
>>  #include <xen/vpci.h>
>> @@ -545,6 +546,68 @@ static int cf_check init_bars(struct pci_dev *pdev)
> 
> Could you please rename to init_header now that we do much more than
> dealing with the BARs?

Yes. Hm. Do you think it's deserving of a separate patch? It's a 2-line change.

> 
>>      if ( rc )
>>          return rc;
>>  
>> +    if ( !is_hardware_domain(pdev->domain) )
>> +    {
>> +        if ( pci_conf_read16(pdev->sbdf, PCI_STATUS) & PCI_STATUS_CAP_LIST )
>> +        {
>> +            /* Only expose capabilities to the guest that vPCI can handle. */
>> +            unsigned int next, ttl = 48;
>> +            unsigned int supported_caps[] = {
> 
> const?

Will do

> 
> We likely need to find a way to do this programmatically, so that when
> a new capability is supported we don't need to go and modify the list
> here every time.  We can sort that out at a later point however.
> 
>> +                PCI_CAP_ID_MSI,
>> +                PCI_CAP_ID_MSIX,
>> +            };
>> +
>> +            next = pci_find_next_cap_ttl(pdev->sbdf, PCI_CAPABILITY_LIST,
>> +                                         supported_caps,
>> +                                         ARRAY_SIZE(supported_caps), &ttl);
>> +
>> +            rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
>> +                                   PCI_CAPABILITY_LIST, 1,
>> +                                   (void *)(uintptr_t)next);
>> +            if ( rc )
>> +                return rc;
>> +
>> +            next &= ~3;
>> +
>> +            if ( !next )
>> +                /*
>> +                 * If we don't have any supported capabilities to expose to the
>> +                 * guest, mask the PCI_STATUS_CAP_LIST bit in the status
>> +                 * register.
>> +                 */
>> +                mask_cap_list = true;
>> +
>> +            while ( next && ttl )
>> +            {
>> +                unsigned int pos = next;
>> +
>> +                next = pci_find_next_cap_ttl(pdev->sbdf,
>> +                                             pos + PCI_CAP_LIST_NEXT,
>> +                                             supported_caps,
>> +                                             ARRAY_SIZE(supported_caps), &ttl);
>> +
>> +                rc = vpci_add_register(pdev->vpci, vpci_hw_read8, NULL,
>> +                                       pos + PCI_CAP_LIST_ID, 1, NULL);
>> +                if ( rc )
>> +                    return rc;
>> +
>> +                rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
>> +                                       pos + PCI_CAP_LIST_NEXT, 1,
>> +                                       (void *)(uintptr_t)next);
>> +                if ( rc )
>> +                    return rc;
>> +
>> +                next &= ~3;
>> +            }
>> +        }
>> +
>> +        /* Extended capabilities read as zero, write ignore */
>> +        rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL, 0x100, 4,
>> +                               (void *)0);
>> +        if ( rc )
>> +            return rc;
>> +    }
>> +
>>      /* Utilize rsvdp_mask to hide PCI_STATUS_CAP_LIST from the guest. */
>>      rc = vpci_add_register_mask(pdev->vpci, vpci_hw_read16, vpci_hw_write16,
>>                                  PCI_STATUS, 2, NULL,
>> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
>> index 96187b70141b..99307e310bbb 100644
>> --- a/xen/drivers/vpci/vpci.c
>> +++ b/xen/drivers/vpci/vpci.c
>> @@ -137,6 +137,18 @@ static void cf_check vpci_ignored_write(
>>  {
>>  }
>>  
>> +uint32_t cf_check vpci_read_val(
>> +    const struct pci_dev *pdev, unsigned int reg, void *data)
>> +{
>> +    return (uintptr_t)data;
>> +}
>> +
>> +uint32_t cf_check vpci_hw_read8(
>> +    const struct pci_dev *pdev, unsigned int reg, void *data)
>> +{
>> +    return pci_conf_read8(pdev->sbdf, reg);
>> +}
>> +
>>  uint32_t cf_check vpci_hw_read16(
>>      const struct pci_dev *pdev, unsigned int reg, void *data)
>>  {
>> diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
>> index 50d7dfb2a2fd..b2dcef01a1cf 100644
>> --- a/xen/include/xen/pci.h
>> +++ b/xen/include/xen/pci.h
>> @@ -205,6 +205,9 @@ int pci_mmcfg_read(unsigned int seg, unsigned int bus,
>>  int pci_mmcfg_write(unsigned int seg, unsigned int bus,
>>                      unsigned int devfn, int reg, int len, u32 value);
>>  unsigned int pci_find_cap_offset(pci_sbdf_t sbdf, unsigned int cap);
>> +unsigned int pci_find_next_cap_ttl(pci_sbdf_t sbdf, unsigned int pos,
>> +                                   unsigned int *cap, unsigned int n,
>> +                                   unsigned int *ttl);
>>  unsigned int pci_find_next_cap(pci_sbdf_t sbdf, unsigned int pos,
>>                                 unsigned int cap);
>>  unsigned int pci_find_ext_capability(pci_sbdf_t sbdf, unsigned int cap);
>> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
>> index 8e8e42372ec1..3c14a74d6255 100644
>> --- a/xen/include/xen/vpci.h
>> +++ b/xen/include/xen/vpci.h
>> @@ -52,7 +52,12 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size);
>>  void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
>>                  uint32_t data);
>>  
>> +uint32_t cf_check vpci_read_val(
>> +    const struct pci_dev *pdev, unsigned int reg, void *data);
> 
> A small comment could be helpful: helper to return the value passed in the data
> parameter.

Will do

> 
> Thanks, Roger.

