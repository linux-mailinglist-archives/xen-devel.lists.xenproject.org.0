Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAF87FBEEA
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 17:05:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643302.1003350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r80a1-00030a-MJ; Tue, 28 Nov 2023 16:04:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643302.1003350; Tue, 28 Nov 2023 16:04:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r80a1-0002yG-JV; Tue, 28 Nov 2023 16:04:57 +0000
Received: by outflank-mailman (input) for mailman id 643302;
 Tue, 28 Nov 2023 16:04:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FWLy=HJ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1r80Zz-0002yA-NG
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 16:04:55 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20614.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd85a7f8-8e07-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 17:04:53 +0100 (CET)
Received: from CY5PR13CA0003.namprd13.prod.outlook.com (2603:10b6:930::31) by
 DS7PR12MB6191.namprd12.prod.outlook.com (2603:10b6:8:98::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.29; Tue, 28 Nov 2023 16:04:45 +0000
Received: from CY4PEPF0000EE3D.namprd03.prod.outlook.com
 (2603:10b6:930:0:cafe::d6) by CY5PR13CA0003.outlook.office365.com
 (2603:10b6:930::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22 via Frontend
 Transport; Tue, 28 Nov 2023 16:04:45 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE3D.mail.protection.outlook.com (10.167.242.17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Tue, 28 Nov 2023 16:04:45 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 28 Nov
 2023 10:04:45 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 28 Nov
 2023 10:04:42 -0600
Received: from [172.27.137.28] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 28 Nov 2023 10:04:41 -0600
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
X-Inumbo-ID: dd85a7f8-8e07-11ee-98e3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A6tENTWW1x4vdP+PMAXBTTnoMAUjqTr0GRMvPBsZSV5cs7uuGNL3T68UKHXvG7pX+8c+FYrWxCjiG/TpGnkk6qCDKiDe36z/ihq6fpE8I3ao6WkwoRNr0SLJYX/gHZW68kVLSNS1weQzlIqi8n1mr+6ZVdIc+J4bJ4cEMy4g2A+HIF4Q9izZRtHKankgIdm4hzGRmvFGxlijnGVaFmIFlSdRJyXPsYJFz3omI3wAaC2kqF4RYXFARA+sKXDb7baj4ZPGQ8AW2mGIMBTcfGV6FDh7VyIUkg+h8DGd6QFDZe62kggOioe3tCisoUHliH0XUeBoQ2mwQVfhAJr9p1sA6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K10K4Me8LeQBqz5uKMbyg7fljiA7xEc58vSZdh4pzUo=;
 b=nLUn8n2QXjl4slApH2W5qiFcjxVfvhme5TQOmkv6lbyyWkt/eeyO0WqzAiSGDn9X7L+itLUi49cbQeayoMem2VcWEs7hzdUnBw5S7BOCWce2A9IfbcZX+LVfOQ+YeM+DjnpMNbHP7xrzRfWhbXkGn6iBvhXOX4ean0T42p/fYmcjRMhScF1/X2dTi+cp1p+dqsQrarrF5PJVe6S1xcQUtlCEjJ89yBGpiXcjorBQsP7wo8bH/dnAryU3w83ztouGZGN2jra+BLEGB6ci1TiWmUi79jpmGolzGtzKRjUvHQCrn/V66+gaFehb7yrQOI61aI5OKZ8vzy++PSkOukfn/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K10K4Me8LeQBqz5uKMbyg7fljiA7xEc58vSZdh4pzUo=;
 b=NYb0MZzWiil67Tr970G4iESAPezL4KjS0vbmrRODln4QFoBrMrxh88hfi8ju4Rgb+3f9VIeINWL4v+0tiB/1PoEQDuukSwEud6Q8hkLvhlm5Kan0o+32GC4t+5YRgVtv34eDB+8DcZCA6065vdAwyWrlVdSQ3TxIurFAMiSY/f4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <ddb153d2-0f57-42fd-a60a-c65647d49407@amd.com>
Date: Tue, 28 Nov 2023 11:04:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] xen/vpci: header: filter PCI capabilities
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20230913143550.14565-1-stewart.hildebrand@amd.com>
 <20230913143550.14565-3-stewart.hildebrand@amd.com>
 <ZVdSIUSDA5den3a3@macbook.local>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <ZVdSIUSDA5den3a3@macbook.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3D:EE_|DS7PR12MB6191:EE_
X-MS-Office365-Filtering-Correlation-Id: d74622e0-7d6d-434e-04da-08dbf02bbd75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iCj7m4NVKs+aO7pMZWFWpVC3ZsGNdmNOIsQSn1e9OxSL6E4di48mtliQUI1HZjTeuDHC+5p8DJRlfQVUOKhrm1OxNcMTMnlGjCQFQsmHRmeWD0pPseZqYvlXhATrJoagl1oKMshWbjEAfib1JS2qZ23JMJ0ekqThgV60BUiqAQB4VLqa5gg3NPv+l1ylqAMQjZYYoU/o6fg0vGlXrtmboF/UyOc0exTUsLpD4jHq8EoG2IpUxgvLHLpa2yzhWIvjG7PCgoIoYiBF7zPpcUvNtnt8v530BhnfvwbrRq5Dl68lehQ21IXKzpnog7ukrJ8eS0B+7aIgvAFkPGLe4gloRwLJvagPLXB1egQ4EdRQPyflhXW6sT1+I6GERgKlJM8FP8h/w/eREDkCBCFbiuarhqBkJueovt38vZc4EJcGh7oT8FXC45yUXzKwHjJ4MG03BUDBNyMJ5mJId+Fi5H03M84FgDtJzhqtqAa0dy8uG1Ae71AZK5b78zM59dkbBpuyZsDGCXmzjp7Y/ERvEosYJ6YGTozZmwnkAep/Ttc1YGkTDhrVUp8yA5eSOKPItSijioeMgW+V9o7kEjhcxpCXj15Md2MNC04olXPQ3Wn0XXTOePmMdMKMJK1jXu6RQ/pbtZAQ68S49aQgIyTXRP2H9S88Z9pzQ53UNkvNz/GwQl6ItSxSYCHg6EiXzDBHrzoMRepNJCuKuiFoa4AdwwQjber3oQoEU6Ebi3SQwCC+xGVvmXMAKQ+UjLpw+lFti/7FlifImTFDQmrDWa4rzQuoM6zQUnurvXDdcxwXEmQV+yM5A53WNP0D5qEtq3zvaHOu
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(39860400002)(396003)(376002)(230922051799003)(1800799012)(82310400011)(451199024)(64100799003)(186009)(40470700004)(36840700001)(46966006)(31686004)(5660300002)(2906002)(40480700001)(40460700003)(44832011)(36860700001)(41300700001)(478600001)(8936002)(8676002)(36756003)(4326008)(356005)(81166007)(82740400003)(336012)(426003)(47076005)(2616005)(53546011)(83380400001)(86362001)(31696002)(6916009)(316002)(70206006)(16576012)(54906003)(26005)(70586007)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 16:04:45.4942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d74622e0-7d6d-434e-04da-08dbf02bbd75
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6191

On 11/17/23 06:44, Roger Pau Monné wrote:
> On Wed, Sep 13, 2023 at 10:35:47AM -0400, Stewart Hildebrand wrote:
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
>> registers whose value doesn't change.
>>
>> Introduce pci_find_next_cap_ttl() helper while adapting the logic from
>> pci_find_next_cap() to suit our needs, and implement the existing
>> pci_find_next_cap() in terms of the new helper.
>>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> ---
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
>>  xen/drivers/pci/pci.c     | 26 +++++++++-----
>>  xen/drivers/vpci/header.c | 76 +++++++++++++++++++++++++++++++++++++++
>>  xen/drivers/vpci/vpci.c   | 12 +++++++
>>  xen/include/xen/pci.h     |  3 ++
>>  xen/include/xen/vpci.h    |  5 +++
>>  5 files changed, 113 insertions(+), 9 deletions(-)
>>
>> diff --git a/xen/drivers/pci/pci.c b/xen/drivers/pci/pci.c
>> index 3569ccb24e9e..8799d60c2156 100644
>> --- a/xen/drivers/pci/pci.c
>> +++ b/xen/drivers/pci/pci.c
>> @@ -39,31 +39,39 @@ unsigned int pci_find_cap_offset(pci_sbdf_t sbdf, unsigned int cap)
>>      return 0;
>>  }
>>  
>> -unsigned int pci_find_next_cap(pci_sbdf_t sbdf, unsigned int pos,
>> -                               unsigned int cap)
>> +unsigned int pci_find_next_cap_ttl(pci_sbdf_t sbdf, unsigned int pos,
>> +                                   bool (*is_match)(unsigned int),
>> +                                   unsigned int cap, unsigned int *ttl)
> 
> Maybe this has been discussed in previous patch versions, but why
> pass a match function instead of expanding the cap parameter to
> be an array of capabilities to search for?

Hm. I don't think we did discuss it previously. It's simple enough to change to an array, so I'll do this for v8.

> 
> I find it kind of weird to be able to pass both a specific capability
> to match against and also a match function.

Having two ways to specify it was a way to retain compatibility with the existing function pci_find_next_cap() without having to introduce another match function. But I'll change it to an array now.

> 
> What the expected behavior if the caller provides both a match
> function and a cap value?
> 
>>  {
>> -    u8 id;
>> -    int ttl = 48;
>> +    unsigned int id;
>>  
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
>> +        if ( (is_match && is_match(id)) || (!is_match && id == cap) )
>>              return pos;
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
>> +    return pci_find_next_cap_ttl(sbdf, pos, NULL, cap, &ttl) & ~3;
>> +}
>> +
>>  /**
>>   * pci_find_ext_capability - Find an extended capability
>>   * @sbdf: PCI device to query
>> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
>> index af267b75ac31..1e7dfe668ccf 100644
>> --- a/xen/drivers/vpci/header.c
>> +++ b/xen/drivers/vpci/header.c
>> @@ -513,6 +513,18 @@ static void cf_check rom_write(
>>          rom->addr = val & PCI_ROM_ADDRESS_MASK;
>>  }
>>  
>> +static bool cf_check vpci_cap_supported(unsigned int id)
>> +{
>> +    switch ( id )
>> +    {
>> +    case PCI_CAP_ID_MSI:
>> +    case PCI_CAP_ID_MSIX:
>> +        return true;
>> +    default:
>> +        return false;
>> +    }
>> +}
>> +
>>  static int cf_check init_bars(struct pci_dev *pdev)
>>  {
>>      uint16_t cmd;
>> @@ -545,6 +557,70 @@ static int cf_check init_bars(struct pci_dev *pdev)
> 
> We might have to rename this to init_header() now :).
> 
>>      if ( rc )
>>          return rc;
>>  
>> +    if ( !is_hardware_domain(pdev->domain) )
>> +    {
>> +        if ( !(pci_conf_read16(pdev->sbdf, PCI_STATUS) & PCI_STATUS_CAP_LIST) )
>> +        {
>> +            /* RAZ/WI */
> 
> That RAZ/WI acronym seems very Arm specific (TBH I had to search for
> it).
> 
> FWIW, it's my understanding that if the status register doesn't report
> the capability list support, the register is unimplemented, and hence
> would be fine to return ~0 from reads of PCI_CAPABILITY_LIST?
> 
> IOW: I'm not sure we need to add this handler for PCI_CAPABILITY_LIST
> if it's not supported.

Agreed, if the hardware itself doesn't have the PCI_STATUS_CAP_LIST bit set, there little to no point in emulating the PCI_CAPABILITY_LIST register. I'll fix this up for v8.

> 
> Thanks, Roger.

