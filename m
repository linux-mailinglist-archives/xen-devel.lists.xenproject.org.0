Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD41782132
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 03:30:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587179.918503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qXtiy-0001zy-Kk; Mon, 21 Aug 2023 01:28:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587179.918503; Mon, 21 Aug 2023 01:28:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qXtiy-0001yK-Fv; Mon, 21 Aug 2023 01:28:56 +0000
Received: by outflank-mailman (input) for mailman id 587179;
 Mon, 21 Aug 2023 01:28:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BS7F=EG=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qXtix-0001yE-H1
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 01:28:55 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7e89::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1456d1cf-3fc2-11ee-9b0c-b553b5be7939;
 Mon, 21 Aug 2023 03:28:51 +0200 (CEST)
Received: from BYAPR05CA0066.namprd05.prod.outlook.com (2603:10b6:a03:74::43)
 by PH7PR12MB6657.namprd12.prod.outlook.com (2603:10b6:510:1fe::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 01:28:45 +0000
Received: from CO1PEPF000042A7.namprd03.prod.outlook.com
 (2603:10b6:a03:74:cafe::d) by BYAPR05CA0066.outlook.office365.com
 (2603:10b6:a03:74::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6723.10 via Frontend
 Transport; Mon, 21 Aug 2023 01:28:44 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042A7.mail.protection.outlook.com (10.167.243.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Mon, 21 Aug 2023 01:28:44 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sun, 20 Aug
 2023 20:28:43 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sun, 20 Aug
 2023 20:28:43 -0500
Received: from [172.22.191.126] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Sun, 20 Aug 2023 20:28:42 -0500
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
X-Inumbo-ID: 1456d1cf-3fc2-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ofyfXaaY1hZkpz/zJMRnfjWtI3qF6Ryw9lWtsFnFzbjzv9pDiHjGvW5L9+ll9vd5uxD46TYKSan37c0MWU0I/HP6UyXCtau2ATgZj4WkNK1PoSrkl64ua0VEpIn+8KrlcnSvUSiHqHUGde25y6jHTqvhMHoOC/1+9PMjXS1SM1A+hhyXWYHRmfODexO4wyT4KL+dvjo0rcsoxFtgmi+DZ1QkzbsErbSu71Yi4wtvYwY5xpnPRG2NEVn8s3sRKiOP+dEe94pgKIYwvf4b0fVMbaNvslo1kXr/CfcHdkSbQmSGVXXcd1hpb1HvK6a+x5AfupiFPWwgERXVB1XX4zLLrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QawFhNY1hP7c1fV/Uccd/vDghLmwuS2+B+Tf4M2K+r8=;
 b=ftdaNS5/H2c04ps8ubabURxhmYOF8xCTkf/Xc8TRp3kJyEZdbK2VeHiuHavAiQlPYgmcBl48JzMWhYiDkUgn8s1861CjEN+FyK2TFvIk2C+3XjAVXPCapTTnBkfnm2ijZ91F7M+v6AKeyMdv03pF2eSdcUhc7+8jOwtsgL6KeI8YJp/oVECufsZx/zN8y1X59XfShoRhZY0gVq/i48WBUfQQlrMzSVk9Zp64Tg1qHGnhpArV43ekLtr1TrvAmuVqdk29BEdsUZOb7G+rQhwp0KxkatWb+msUIxCgy/G6ffwYTRgxUJO22lAC0bH/obifV4IXpwviKmcxEpSgV8vF0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QawFhNY1hP7c1fV/Uccd/vDghLmwuS2+B+Tf4M2K+r8=;
 b=RaLZr9GRb1kjm9jcDB6JT/G4VOGIR6y6+mrkJEhooJJZhdXVX5bDQ5Fq8u8rqzrvmAqefqbSwy/O/ZCPxRpkt1Jrs1Qw92MmjXHfTQhfBsYwJzt/BALYweCtk1N+l8sDyxSoHNJF21BU41tl+MzL0bjAB9AeuwAC8152qrf5+xg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <7a0de486-9732-bc2e-3d70-ef2253caf8db@amd.com>
Date: Sun, 20 Aug 2023 21:28:36 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/2] xen/vpci: header: filter PCI capabilities
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <20230816185035.82994-1-stewart.hildebrand@amd.com>
 <20230816185035.82994-2-stewart.hildebrand@amd.com>
 <ce7768c8-41bb-bbd8-3b6d-bf4d42ab2f3d@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <ce7768c8-41bb-bbd8-3b6d-bf4d42ab2f3d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A7:EE_|PH7PR12MB6657:EE_
X-MS-Office365-Filtering-Correlation-Id: 784ce4bb-19bb-48eb-4a54-08dba1e5f5ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PQasw4r/e46N8BMvZv80VT7ezM4tNGua6cKMXYjsJVgVOgGox+JOy4p15VzEJ4iVc2gMJFdw9xAVsXGBc4C6Mw0S+xo8Rwy+yOJGzRIIU8znAB++qbBA/hcOPUot68Whd6ti+YNco5gOHgqurmyuEJQPwJMCZxFthZWZXpb+8FYMVydoM4/AipfsdJw6itp7uwdmHAjM7h03OxNggPNwizm8ZeEKZ9Um4F0KS2V+9VqXFSAJnSjTJFbhDRJTWLrpwMHMGRdU3O/DUOLGbQGjTgEY727LXM68fxHp5XPJrniuQK04Fy0gk0cJtfDv4OcHgs70hv63vzuCezGuchanhZNvI+nClA/2q2gTRIw8tarM92iruND2CWsr3Bg0XmQHnu9jer7t6Epu11btYFXRynjd5SOhkW2uWqnMUaiQits9WU6KDI7Dp/sPO8s4lPC10jCRrbtNGN7Q/w2Bs0XDtZaPxtjSG8f3Kt/c+QW+rMJYopTeFQh0KpOdq9ZdaZ3MvgnAJ0W3NKiYNhpPA/pzMTg6oStKAdSK6L6kBQ5IlpcSb3wN7pamUdcPoLA3z/3YVQqE+iB3KLJfQtWgfOPEtHea+EHaESKSi3VjfPUwO7SE9+X/4uaxooP8Ufrpi85XCYtAA8lRA7U6H6+61qCn78CUFW37rZ0WSTHrJRvUMvzvhUdDkff9uLM7VJ8Vxvk8U7WHtm3yLZhgYiAMMV8LNdrKpK11QMgRc+Q/JLpL0kf2ojvKCWXDkL8aoj8EQdj0wBMlNGWfOie5sWWRCrQ2AcH+0wmffK1hR3pHiTIxWVONo2W08kDW1LMxZaCEkFrFdb/O51DK1MOVhSGfkUl9vA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(136003)(346002)(376002)(186009)(1800799009)(82310400011)(451199024)(46966006)(36840700001)(40470700004)(31696002)(40480700001)(86362001)(36756003)(31686004)(356005)(40460700003)(16576012)(6916009)(316002)(70206006)(54906003)(70586007)(478600001)(41300700001)(82740400003)(81166007)(6666004)(26005)(47076005)(53546011)(426003)(336012)(36860700001)(8676002)(4326008)(2906002)(2616005)(44832011)(8936002)(5660300002)(43740500002)(36900700001)(357404004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 01:28:44.5014
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 784ce4bb-19bb-48eb-4a54-08dba1e5f5ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6657

On 8/17/23 08:57, Jan Beulich wrote:
> On 16.08.2023 20:50, Stewart Hildebrand wrote:
>> If there are no capabilities to be exposed to the guest, a future status
>> register handler likely would want to mask the PCI_STATUS_CAP_LIST bit. See [1]
>> for a suggestion of how this might be tracked in struct vpci_header.
> 
> Can we actually get away without doing this right away? I'm not sure
> consumers are required to range check what they read from PCI_CAPABILITY_LIST.

I think you're right, this should be done right away. I'll add a status register handler with PCI_STATUS_CAP_LIST bit masking in the next version of the series. This will include a modification to vpci_write_helper() be able to handle rw1c registers properly.

>> --- a/xen/drivers/pci/pci.c
>> +++ b/xen/drivers/pci/pci.c
>> @@ -39,27 +39,27 @@ int pci_find_cap_offset(u16 seg, u8 bus, u8 dev, u8 func, u8 cap)
>>      return 0;
>>  }
>>
>> -int pci_find_next_cap(u16 seg, u8 bus, unsigned int devfn, u8 pos, int cap)
>> +int pci_find_next_cap(pci_sbdf_t sbdf, uint8_t pos, bool (*is_match)(uint8_t),
>> +                      int *ttl)
> 
> Why plain int? When values can't go negative, respective variables generally
> want to be of unsigned types.

I'll change to unsigned int.

>>  {
>> -    u8 id;
>> -    int ttl = 48;
>> +    uint8_t id;
>>
>> -    while ( ttl-- )
>> +    while ( (*ttl)-- > 0 )
> 
> I don't see why you add "> 0" here.

I'll remove it.

>>      {
>> -        pos = pci_conf_read8(PCI_SBDF(seg, bus, devfn), pos);
>> +        pos = pci_conf_read8(sbdf, pos);
>>          if ( pos < 0x40 )
>>              break;
>>
>> -        pos &= ~3;
>> -        id = pci_conf_read8(PCI_SBDF(seg, bus, devfn), pos + PCI_CAP_LIST_ID);
>> +        id = pci_conf_read8(sbdf, (pos & ~3) + PCI_CAP_LIST_ID);
>>
>>          if ( id == 0xff )
>>              break;
>> -        if ( id == cap )
>> +        if ( is_match(id) )
>>              return pos;
>>
>> -        pos += PCI_CAP_LIST_NEXT;
>> +        pos = (pos & ~3) + PCI_CAP_LIST_NEXT;
>>      }
>> +
>>      return 0;
>>  }
> 
> As said in context of v1, this function should remain usable for its
> original purpose. That, to me, includes the caller not needing to care about
> ttl. I could see you convert the original function the way you do, but under
> a new name, and then implement the original one simply in terms of this more
> general purpose function.

Will do.

> Also, while I appreciate the sbdf conversion, that wants to be a separate
> patch, which would then want to take care of the sibling functions as well.

OK, will do. To be clear, this means converting the following 4 functions to use pci_sbdf_t, along with all the call sites:
pci_find_cap_offset
pci_find_next_cap
pci_find_ext_capability
pci_find_next_ext_capability

>> --- a/xen/drivers/vpci/header.c
>> +++ b/xen/drivers/vpci/header.c
>> @@ -513,6 +513,18 @@ static void cf_check rom_write(
>>          rom->addr = val & PCI_ROM_ADDRESS_MASK;
>>  }
>>
>> +static bool cf_check vpci_cap_supported(uint8_t id)
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
>> @@ -544,6 +556,60 @@ static int cf_check init_bars(struct pci_dev *pdev)
>>      if ( rc )
>>          return rc;
>>
>> +    if ( !is_hardware_domain(pdev->domain) )
>> +    {
>> +        if ( (pci_conf_read16(pdev->sbdf, PCI_STATUS) & PCI_STATUS_CAP_LIST)
>> +             == 0 )
> 
> This fits on a single line when written this more commonly used way:
> 
>         if ( !(pci_conf_read16(pdev->sbdf, PCI_STATUS) & PCI_STATUS_CAP_LIST) )

I'll do this.

> Otherwise it needs wrapping differently - binary operators at a wrapping
> point belong on the earlier line in our style.
> 
>> +        {
>> +            /* RAZ/WI */
>> +            rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
>> +                                   PCI_CAPABILITY_LIST, 1, NULL);
> 
> This last NULL is likely misleading to readers: It does not obviously
> represent the value 0 cast to void *. (Same then for the extended cap
> handler at the end.)

I'll change to (void *)0

>> +            if ( rc )
>> +                return rc;
>> +        }
>> +        else
>> +        {
>> +            /* Only expose capabilities to the guest that vPCI can handle. */
>> +            uint8_t next;
>> +            int ttl = 48;
>> +
>> +            next = pci_find_next_cap(pdev->sbdf, PCI_CAPABILITY_LIST,
>> +                                     vpci_cap_supported, &ttl);
>> +
>> +            rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
>> +                                   PCI_CAPABILITY_LIST, 1,
>> +                                   (void *)(uintptr_t)next);
>> +            if ( rc )
>> +                return rc;
>> +
>> +            while ( next && (ttl > 0) )
> 
> Don't you need to mask off the low two bits first (rather than [only] ...

Yes, I'll fix this.

> 
>> +            {
>> +                uint8_t pos = next;
>> +
>> +                next = pci_find_next_cap(pdev->sbdf, pos + PCI_CAP_LIST_NEXT,
>> +                                         vpci_cap_supported, &ttl);
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
> 
> ... here)?
> 
> Jan

