Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FD48222F7
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jan 2024 22:10:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660854.1030501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKm14-0004JA-EF; Tue, 02 Jan 2024 21:09:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660854.1030501; Tue, 02 Jan 2024 21:09:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKm14-0004GK-BO; Tue, 02 Jan 2024 21:09:38 +0000
Received: by outflank-mailman (input) for mailman id 660854;
 Tue, 02 Jan 2024 21:09:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oNM8=IM=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rKm12-0004FB-6G
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2024 21:09:36 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2009::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39ddaf13-a9b3-11ee-98ef-6d05b1d4d9a1;
 Tue, 02 Jan 2024 22:09:33 +0100 (CET)
Received: from DM6PR06CA0040.namprd06.prod.outlook.com (2603:10b6:5:54::17) by
 IA0PR12MB9047.namprd12.prod.outlook.com (2603:10b6:208:402::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7159.13; Tue, 2 Jan 2024 21:09:28 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10b6:5:54:cafe::d) by DM6PR06CA0040.outlook.office365.com
 (2603:10b6:5:54::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.21 via Frontend
 Transport; Tue, 2 Jan 2024 21:09:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7159.9 via Frontend Transport; Tue, 2 Jan 2024 21:09:27 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 2 Jan
 2024 15:09:26 -0600
Received: from [172.23.76.218] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 2 Jan 2024 15:09:25 -0600
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
X-Inumbo-ID: 39ddaf13-a9b3-11ee-98ef-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CkF5gg5gRHd9hPwad4UoUxdEGJENaPxR7uscHtjbfi06d5MlPfoWouLjlmkgZtniIhHGmx4Jn6NMRaVK0AAEPp/AxurHxhZCuJ5BWV4YNlnm4ECjNDYpu5HzGtAI/TBBNA7xHKh3Rr7enToq7oGKpY6tG+NH76L6tzAFxO8zGLGrUW/X+o+54vM9JXRZjGheXmmf7I2qli1no5kIP3Y8Q1cEmwVIOpVLNlH3Sq3sRke2OjVmps2wwjExBIgWip6v4+Kbbl4AVS5ZKe/McbWg7YycLEYdCN8hkUqt9Q4A2bF2Fk2ZWXaraz0lG1jWdtKajr6POz2u2R0ekIPDTturag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4CYnwMDi0gbgs6xNItHRJp5E5OCLunzKzpgM/T95x0M=;
 b=fxfMaG0VtBUh9YN4sgOJMIXVOpi1EFqHDigcfVDiKNoqMFON90WNhUNWnBVg4igPhPraM5/9ewtUVSle38m9ciaI65hXa3gMu9ruZwEWR3P4AcbcPeH2HnLdCFdR2J9DgsQrW/WZtZ8HsGw/nbz6k94RfxZJbTZXcK8kvm2nGuaCYmyz3b/PW8hnpss+s8XFmBlfeZ/7RNSlOVN34P8iex2GqDTrvgf/Q0yDTFldlyQtNZx1umFuDRLGVdVOVzqG3tfd3W7tfShr3PzQ9oz30Epud+7hUzzGubdpdOHjR4peWhmZ8B5bhxhK2EhqQgob5jj6Gp+mRYYJtgAw6pZBfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4CYnwMDi0gbgs6xNItHRJp5E5OCLunzKzpgM/T95x0M=;
 b=voP4yS/gGK/ThcKiWsG3cUH6Gx9rZ6RcqmT9YDH4jN38q0v3nQe4+jBpVKVv/3Rc+jJrByhsdp9+oVqkLZ1kMumcg2mty3VhsCDb7QAHaWs6IMiZtJeoD1CxDQCOlxZFFq9zgNY5nbYDzv5l5LFVBR9K7d2cU/pilEX7gBJ5vPY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <32cf97de-d769-46b2-8af4-3891bb2497e3@amd.com>
Date: Tue, 2 Jan 2024 16:09:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 07/17] vpci/header: implement guest BAR register
 handlers
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
 <20231202012556.2012281-8-volodymyr_babchuk@epam.com>
 <ZYRdKyxo6kfkijOF@macbook>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <ZYRdKyxo6kfkijOF@macbook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|IA0PR12MB9047:EE_
X-MS-Office365-Filtering-Correlation-Id: 43bd6634-322d-4368-7bc6-08dc0bd71b13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sKtRyDP5slIkeOl2KGA3v6NzX91IhWhfL4BONg3fhfk+ptj7aa+3yfKFIcTOT6cTEtNoVW4Dz8tNOK+wSG/1oo6Rw7Sl0W8Bmf0TWZb90CrrIHeaY0tKbQc5nK0IQWWEB3aO3TCFi42865pQB1rvkmNqgdlBbOFWg5GFYUl0eyHI8fpFeoLZ/AwWXLRP8O1vCB/mvJOosOCrd9rKBCUBCgOSuI3UPFgWO7+Os9xaoLjL7AmJi4IbVP3deCNqUN7oNsD/QZNrl7Bjb+ZbLMnQBjaGr8yD1QJGfkIfmUFbdfQF/Nd/qYnkLZS/QcfNa9GkNNl3zci5RNKM6rCMYDcn0+AvxPcG7zNz9g+Zj6Q5j2yOKhetBFSlUunBq+2503aKDMW0mfufdveslkHaUrz/CKSXuzcTertyLF3HtL29WZYfjTSQLhSl+KtCyPJXmigx9Qd1Y5qZKwBrSYhuLTB1i5gofHq7mZyUnBvhDsiWJrvtgxx14SceYgJ1SNIaplY/AEr3bHIi9kR9JICE6NA5nd0CEAq1ok2849Ri/SMq/UiFsJYDw7mLep5dsbSa2SuL20wIBLL4BI8qtp9cwBqoNgAFkW3rvBEyjdhg+i5D8fYur7j7+oDNZqlH914t0QO6WnIvXEMLGbHNjpgCWvS+H8XNDO9Iy58SqQyLyzV5k3bjrUslVnjXqkllz8KXEaZGgDTavVSRctAJZyPK55WKevMI0qLasSw/rKIFl+HCTZbc2Oe1hTscOx9whgoBYM1x7JUkXUPwoZQV3CavNpW+poTtV/hV5Jtw9CeTZY0iJsit5QeJJ+a5ipMVP1x24H2VKJMZAfFllJvStTNPxpSpNg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(136003)(376002)(39860400002)(230922051799003)(230273577357003)(230173577357003)(64100799003)(82310400011)(186009)(451199024)(1800799012)(46966006)(40470700004)(36840700001)(31686004)(36756003)(40480700001)(40460700003)(70206006)(53546011)(70586007)(31696002)(86362001)(336012)(83380400001)(41300700001)(426003)(81166007)(356005)(82740400003)(26005)(2616005)(47076005)(36860700001)(2906002)(6666004)(478600001)(5660300002)(44832011)(16576012)(110136005)(316002)(8676002)(54906003)(8936002)(4326008)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2024 21:09:27.9123
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43bd6634-322d-4368-7bc6-08dc0bd71b13
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9047

On 12/21/23 10:43, Roger Pau Monné wrote:
> On Sat, Dec 02, 2023 at 01:27:04AM +0000, Volodymyr Babchuk wrote:
>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>
>> Add relevant vpci register handlers when assigning PCI device to a domain
>> and remove those when de-assigning. This allows having different
>> handlers for different domains, e.g. hwdom and other guests.
>>
>> Emulate guest BAR register values: this allows creating a guest view
>> of the registers and emulates size and properties probe as it is done
>> during PCI device enumeration by the guest.
>>
>> All empty, IO and ROM BARs for guests are emulated by returning 0 on
>> reads and ignoring writes: this BARs are special with this respect as
>> their lower bits have special meaning, so returning default ~0 on read
>> may confuse guest OS.
>>
>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> 
> Just a couple of nits.
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks!

> 
>> ---
>> In v11:
>> - Access guest_addr after adjusting for MEM64_HI bar in
>> guest_bar_write()
>> - guest bar handlers renamed and now  _mem_ part to denote
>> that they are handling only memory BARs
>> - refuse to update guest BAR address if BAR is enabled
>> In v10:
>> - ull -> ULL to be MISRA-compatbile
>> - Use PAGE_OFFSET() instead of combining with ~PAGE_MASK
>> - Set type of empty bars to VPCI_BAR_EMPTY
>> In v9:
>> - factored-out "fail" label introduction in init_bars()
>> - replaced #ifdef CONFIG_X86 with IS_ENABLED()
>> - do not pass bars[i] to empty_bar_read() handler
>> - store guest's BAR address instead of guests BAR register view
>> Since v6:
>> - unify the writing of the PCI_COMMAND register on the
>>   error path into a label
>> - do not introduce bar_ignore_access helper and open code
>> - s/guest_bar_ignore_read/empty_bar_read
>> - update error message in guest_bar_write
>> - only setup empty_bar_read for IO if !x86
>> Since v5:
>> - make sure that the guest set address has the same page offset
>>   as the physical address on the host
>> - remove guest_rom_{read|write} as those just implement the default
>>   behaviour of the registers not being handled
>> - adjusted comment for struct vpci.addr field
>> - add guest handlers for BARs which are not handled and will otherwise
>>   return ~0 on read and ignore writes. The BARs are special with this
>>   respect as their lower bits have special meaning, so returning ~0
>>   doesn't seem to be right
>> Since v4:
>> - updated commit message
>> - s/guest_addr/guest_reg
>> Since v3:
>> - squashed two patches: dynamic add/remove handlers and guest BAR
>>   handler implementation
>> - fix guest BAR read of the high part of a 64bit BAR (Roger)
>> - add error handling to vpci_assign_device
>> - s/dom%pd/%pd
>> - blank line before return
>> Since v2:
>> - remove unneeded ifdefs for CONFIG_HAS_VPCI_GUEST_SUPPORT as more code
>>   has been eliminated from being built on x86
>> Since v1:
>>  - constify struct pci_dev where possible
>>  - do not open code is_system_domain()
>>  - simplify some code3. simplify
>>  - use gdprintk + error code instead of gprintk
>>  - gate vpci_bar_{add|remove}_handlers with CONFIG_HAS_VPCI_GUEST_SUPPORT,
>>    so these do not get compiled for x86
>>  - removed unneeded is_system_domain check
>>  - re-work guest read/write to be much simpler and do more work on write
>>    than read which is expected to be called more frequently
>>  - removed one too obvious comment
>> ---
>>  xen/drivers/vpci/header.c | 135 +++++++++++++++++++++++++++++++++-----
>>  xen/include/xen/vpci.h    |   3 +
>>  2 files changed, 122 insertions(+), 16 deletions(-)
>>
>> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
>> index e6a1d58c42..43216429d9 100644
>> --- a/xen/drivers/vpci/header.c
>> +++ b/xen/drivers/vpci/header.c
>> @@ -477,6 +477,75 @@ static void cf_check bar_write(
>>      pci_conf_write32(pdev->sbdf, reg, val);
>>  }
>>  
>> +static void cf_check guest_mem_bar_write(const struct pci_dev *pdev,
>> +                                         unsigned int reg, uint32_t val,
>> +                                         void *data)
>> +{
>> +    struct vpci_bar *bar = data;
>> +    bool hi = false;
>> +    uint64_t guest_addr;
>> +
>> +    if ( bar->type == VPCI_BAR_MEM64_HI )
>> +    {
>> +        ASSERT(reg > PCI_BASE_ADDRESS_0);
>> +        bar--;
>> +        hi = true;
>> +    }
>> +    else
>> +    {
>> +        val &= PCI_BASE_ADDRESS_MEM_MASK;
>> +    }
>> +
>> +    guest_addr = bar->guest_addr;
>> +    guest_addr &= ~(0xffffffffULL << (hi ? 32 : 0));
>> +    guest_addr |= (uint64_t)val << (hi ? 32 : 0);
>> +
>> +    /* Allow guest to size BAR correctly */
>> +    guest_addr &= ~(bar->size - 1);
>> +
>> +    /*
>> +     * Xen only cares whether the BAR is mapped into the p2m, so allow BAR
>> +     * writes as long as the BAR is not mapped into the p2m.
>> +     */
>> +    if ( bar->enabled )
>> +    {
>> +        /* If the value written is the current one avoid printing a warning. */
>> +        if ( guest_addr != bar->guest_addr )
>> +            gprintk(XENLOG_WARNING,
>> +                    "%pp: ignored guest BAR %zu write while mapped\n",
>> +                    &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
>> +        return;
>> +    }
>> +    bar->guest_addr = guest_addr;
>> +}
>> +
>> +static uint32_t cf_check guest_mem_bar_read(const struct pci_dev *pdev,
>> +                                            unsigned int reg, void *data)
>> +{
>> +    const struct vpci_bar *bar = data;
>> +    uint32_t reg_val;
>> +
>> +    if ( bar->type == VPCI_BAR_MEM64_HI )
>> +    {
>> +        ASSERT(reg > PCI_BASE_ADDRESS_0);
>> +        bar--;
>> +        return bar->guest_addr >> 32;
>> +    }
>> +
>> +    reg_val = bar->guest_addr;
>> +    reg_val |= bar->type == VPCI_BAR_MEM32 ? PCI_BASE_ADDRESS_MEM_TYPE_32 :
>> +                                             PCI_BASE_ADDRESS_MEM_TYPE_64;
>> +    reg_val |= bar->prefetchable ? PCI_BASE_ADDRESS_MEM_PREFETCH : 0;
>> +
>> +    return reg_val;
>> +}
>> +
>> +static uint32_t cf_check empty_bar_read(const struct pci_dev *pdev,
>> +                                        unsigned int reg, void *data)
>> +{
>> +    return 0;
>> +}
>> +
>>  static void cf_check rom_write(
>>      const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
>>  {
>> @@ -537,6 +606,7 @@ static int cf_check init_bars(struct pci_dev *pdev)
>>      struct vpci_header *header = &pdev->vpci->header;
>>      struct vpci_bar *bars = header->bars;
>>      int rc;
>> +    bool is_hwdom = is_hardware_domain(pdev->domain);
>>  
>>      ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
>>  
>> @@ -578,8 +648,11 @@ static int cf_check init_bars(struct pci_dev *pdev)
>>          if ( i && bars[i - 1].type == VPCI_BAR_MEM64_LO )
>>          {
>>              bars[i].type = VPCI_BAR_MEM64_HI;
>> -            rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, reg,
>> -                                   4, &bars[i]);
>> +            rc = vpci_add_register(pdev->vpci,
>> +                                   is_hwdom ? vpci_hw_read32 :
>> +                                                        guest_mem_bar_read,
> 
> Nit: I would usually indent this as:
> 
> is_hwdom ? vpci_hw_read32
>          : guest_mem_bar_read,

Will fix

> 
>> +                                   is_hwdom ? bar_write : guest_mem_bar_write,
>> +                                   reg, 4, &bars[i]);
>>              if ( rc )
>>                  goto fail;
>>  
>> @@ -590,6 +663,14 @@ static int cf_check init_bars(struct pci_dev *pdev)
>>          if ( (val & PCI_BASE_ADDRESS_SPACE) == PCI_BASE_ADDRESS_SPACE_IO )
>>          {
>>              bars[i].type = VPCI_BAR_IO;
>> +            if ( !IS_ENABLED(CONFIG_X86) && !is_hwdom )
>> +            {
>> +                rc = vpci_add_register(pdev->vpci, empty_bar_read, NULL,
>> +                                       reg, 4, NULL);
>> +                if ( rc )
>> +                    goto fail;
>> +            }
>> +
>>              continue;
>>          }
>>          if ( (val & PCI_BASE_ADDRESS_MEM_TYPE_MASK) ==
>> @@ -606,6 +687,15 @@ static int cf_check init_bars(struct pci_dev *pdev)
>>          if ( size == 0 )
>>          {
>>              bars[i].type = VPCI_BAR_EMPTY;
>> +
>> +            if ( !is_hwdom )
>> +            {
>> +                rc = vpci_add_register(pdev->vpci, empty_bar_read, NULL,
>> +                                       reg, 4, NULL);
>> +                if ( rc )
>> +                    goto fail;
>> +            }
>> +
>>              continue;
>>          }
>>  
>> @@ -613,28 +703,41 @@ static int cf_check init_bars(struct pci_dev *pdev)
>>          bars[i].size = size;
>>          bars[i].prefetchable = val & PCI_BASE_ADDRESS_MEM_PREFETCH;
>>  
>> -        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, reg, 4,
>> -                               &bars[i]);
>> +        rc = vpci_add_register(pdev->vpci,
>> +                               is_hwdom ? vpci_hw_read32 : guest_mem_bar_read,
>> +                               is_hwdom ? bar_write : guest_mem_bar_write,
>> +                               reg, 4, &bars[i]);
>>          if ( rc )
>>              goto fail;
>>      }
>>  
>> -    /* Check expansion ROM. */
>> -    rc = pci_size_mem_bar(pdev->sbdf, rom_reg, &addr, &size, PCI_BAR_ROM);
> 
> Nit: I guess you could do something like:
> 
> rc = is_hwdom ? pci_size_mem_bar(pdev->sbdf, rom_reg, &addr, &size, PCI_BAR_ROM)
>               : 0;
> 
> And that would avoid having to re-indent the whole block?
> 
> You could still place the domU code on an else ( !is_hwdom ) branch.
> 
> Overall I'm not sure what I prefer, as the re-indentation would be
> better done in a non-functional change IMO.

I'm in favor of a smaller diffstat for now. I'll do as you suggest with the ternary/conditional operator.

> 
> Thanks, Roger.

