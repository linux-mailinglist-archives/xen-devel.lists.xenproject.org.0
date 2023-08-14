Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2C577C229
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 23:12:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583804.914138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVeqx-0000mD-VM; Mon, 14 Aug 2023 21:11:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583804.914138; Mon, 14 Aug 2023 21:11:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVeqx-0000k4-SD; Mon, 14 Aug 2023 21:11:55 +0000
Received: by outflank-mailman (input) for mailman id 583804;
 Mon, 14 Aug 2023 21:11:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D2Ba=D7=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qVeqw-0000jL-FF
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 21:11:54 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7e89::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f6565d8-3ae7-11ee-b289-6b7b168915f2;
 Mon, 14 Aug 2023 23:11:52 +0200 (CEST)
Received: from DS7PR03CA0065.namprd03.prod.outlook.com (2603:10b6:5:3bb::10)
 by DM4PR12MB6230.namprd12.prod.outlook.com (2603:10b6:8:a7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Mon, 14 Aug
 2023 21:11:47 +0000
Received: from DM6NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3bb:cafe::6c) by DS7PR03CA0065.outlook.office365.com
 (2603:10b6:5:3bb::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Mon, 14 Aug 2023 21:11:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT052.mail.protection.outlook.com (10.13.172.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Mon, 14 Aug 2023 21:11:47 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 14 Aug
 2023 16:11:46 -0500
Received: from [172.22.191.126] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 14 Aug 2023 16:11:45 -0500
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
X-Inumbo-ID: 2f6565d8-3ae7-11ee-b289-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E6+BJ84f+gmBTIxX3aWsgnTXJ+ifzr6zt7iHq8vUwrNQmjGI42SgyBozLVQOf+ZPw/uqWxHWfeGam0pmoBl9kSotthNHXC6ubcUwGXful+Qvj6MbI/tYKaITVje07/37MwJAQIQaFS30uGWWhDfXlL7am8JymJyzXJqozUwtFCq1VP01PfUBrP0fORZHE3KQVuaGr9vAA3S9pNOrTJfPsd4sXJWEw7ex/JL64MvF5Lbms/6dWwwKs84a6aeUAH8mRcFShedlZCb1H4tASZUx0Gx1Uyke3AvmDbcJkJfLxT1go1LBxkQwitClKxgPH2cuuNpOhltX/8PV+c3M3zLD8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s4JTDyEEsHa2kNkN+UNYtZOqWvRBgg/+PPDSmb9TdD4=;
 b=RJUvrVRjxl7LjSkLiK3BNo55qR8dqvAHtnmT6SYtfNSRwRjXKuxG32Q1x9u8AswDSZiM0ImBzi3FMVvx0E4eU7uldp+1N6iffY66jdNN3QkNX+MOuLVPRuaTP69I+TPs+QTVgN5CMWQGB7068J/cAxUljzaXMC3ofcM2Eu/M5OU1hfOb//ncNk23fcqZhVw4J72jNDu5Qgakl7U87fEZzjNuk4uxKwehd91/ZBQYE1e//yfw3cVQw/5avlw6FT2X39mfRR2vb+4PIpiciMaBn6o53mAinwxdwfriBUE+vHmX0d2n8JUteMTweAC2QvzUkTLaw0XDxTHnzFSzVhuOQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s4JTDyEEsHa2kNkN+UNYtZOqWvRBgg/+PPDSmb9TdD4=;
 b=SjtHConK8+8xOcLrZs6iqBnQ82SV5wDpyuTJBcvg1R4jHnpjT2U9i2gnEzfu5V/lPI5ett1NLmUgvxeje0wEuXrXkRbwfr5p8hEKnPvSfycdBbRMeVatyc0l9B/XuMuXrxaM3P1RMT+88pHsNK9ujdJKh7BsjAIRW7klRMl0eHc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <44c214e3-2e0c-0270-c318-c3992610ab1a@amd.com>
Date: Mon, 14 Aug 2023 17:11:44 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 3/3] xen/vpci: header: filter PCI capabilities
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <20230810191312.644235-1-stewart.hildebrand@amd.com>
 <20230810191312.644235-4-stewart.hildebrand@amd.com>
 <29d82586-550b-6e9f-f967-a2855d1c81a2@suse.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <29d82586-550b-6e9f-f967-a2855d1c81a2@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT052:EE_|DM4PR12MB6230:EE_
X-MS-Office365-Filtering-Correlation-Id: aa979bd3-db49-4ca5-1fe1-08db9d0b11c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wIAgpEziR/weJWGRkAEoSEBgjh7/m7772cAuX01REHeOUaBNE8cmEY4Ehiprz3tZj8WKbvHFg5PkCGkXQ4T8JZ3h5z0wsIzPhhZIMyQEjFyUNJqtPnIvXrSGRc+O5rND0dOoKALZf4RHhu73xMpP2NXntraZ4ApiBuZoovaeynaWd9r/xTNYZg3+qgn8x901WRcc5qE3DrdVHfVOGxDlG1vUvLDa/LCug8AXm6BAd1UB7uZUlOQXEfvgM7scv9n9qCwZxLb2GC4Jp42ne2W+XfJ6/Rt6IfZvEGC14ahQeHOfD/itaUh/KQvaYtKO+BVFRCm1bWa8j+rVcOC0p47xkGN/UKIgyC5yp6QzcxiHh4R4HutBvVAt0xPF8cUdt8NgYVM/132wVuhbDk8k3pt7TLYm4kmDlADZa0JW0dDqoaRJnWLqu1yvEApNzRN43FvUEqqR00uZHp+V748y9S+ArCrs1K8z5clzBn1MSy6nVPuImGQg8oGGSSZx9FuXhDjtXxlWuGLEpGZomlLPUDOMnoGBk0C5HgGo1YIqfZvJt023p/GHGb5tD5ujnaQMvGCSS0a1sIv9m3nX1Nu4ONdqljOAe8I5W47VPwPCEprxq62CmDib8uO84LQXtrqNQ0ocTLMeOs6P+2jSb4QL0dOz3gWekKccWqQUhJlnQclhFNOV+MlAovP09tta/z33Wn2Ue8wJ1MiZIbToNt4rqrQZ1ZP1bNqq9d+BB5r0nfpdetuYfocYRZR3Xx/4bfGZqeewR8BfTmkjB+w17dnsdiCPQvupLbpR0/laHEdDt552CudOl/LObuY3CduF9BuDeJRC
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(39860400002)(136003)(186006)(1800799006)(82310400008)(451199021)(46966006)(36840700001)(40470700004)(53546011)(478600001)(2616005)(426003)(336012)(83380400001)(2906002)(26005)(54906003)(41300700001)(16576012)(6916009)(316002)(70206006)(70586007)(44832011)(5660300002)(8936002)(8676002)(4326008)(31696002)(36756003)(40460700003)(47076005)(36860700001)(40480700001)(81166007)(82740400003)(356005)(86362001)(31686004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 21:11:47.0674
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa979bd3-db49-4ca5-1fe1-08db9d0b11c6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6230

On 8/14/23 10:58, Jan Beulich wrote:
> On 10.08.2023 21:12, Stewart Hildebrand wrote:
>> Xen vPCI only supports virtualizing the MSI and MSI-X capabilities, so all other
>> PCI capabilities should be hidden from a domU for now.
> 
> I'm not sure about "should"; imo this would need evaluating for every cap
> type separately. I'm okay though to take this as a starting point. What
> needs considering (and mentioning here) is that there may be (iirc: are)
> drivers which depend on being able to find/access certain capabilities.

OK, I will re-word the commit message.

> Also - what about extended capabilities? Don't we want to hide them all
> then as well (by returning 0 for the 32-bit value at 0x100)?

Yes, it certainly couldn't hurt to add a RAZ/WI handler at 0x100, so I'll do that.

>> --- a/xen/drivers/vpci/header.c
>> +++ b/xen/drivers/vpci/header.c
>> @@ -513,6 +513,36 @@ static void cf_check rom_write(
>>          rom->addr = val & PCI_ROM_ADDRESS_MASK;
>>  }
>>
>> +static uint8_t vpci_find_next_cap(pci_sbdf_t sbdf, uint8_t pos)
>> +{
>> +    uint8_t id;
>> +    int ttl;
>> +
>> +    if ( pos < 0x40 )
>> +        pos = pci_conf_read8(sbdf, PCI_CAPABILITY_LIST);
>> +    else
>> +        pos = pci_conf_read8(sbdf, pos + PCI_CAP_LIST_NEXT);
> 
> How about avoiding the if/else by having the caller pass in a useful
> value, rather than PCI_CAPABILITY_LIST? I.e.
> 
> #define PCI_CAP_LIST_FIRST (PCI_CAPABILITY_LIST - PCI_CAP_LIST_NEXT)

OK, yes, I will eliminate the if/else.

> 
>> +    for ( ttl = 48; ttl > 0; ttl-- )
>> +    {
>> +        if ( pos < 0x40 )
>> +            break;
>> +
>> +        pos &= ~3;
>> +        id = pci_conf_read8(sbdf, pos + PCI_CAP_LIST_ID);
>> +
>> +        if ( id == 0xff )
>> +            break;
>> +
>> +        if ( id == PCI_CAP_ID_MSI ||
>> +             id == PCI_CAP_ID_MSIX )
>> +            return pos;
> 
> Can this please start out as switch() right away?

Yes, certainly.

>> +        pos = pci_conf_read8(sbdf, pos + PCI_CAP_LIST_NEXT);
>> +    }
>> +    return 0;
>> +}
> 
> Nit: Blank line please ahead of main function return point.
> 
> I also notice that the function isn't really vPCI-specific in any way
> (except for the specific PCI_CAP_ID_* compared against). Would it
> perhaps make sense to have it be a general utility function, living in
> xen/drivers/pci/pci.c next to its relatives?

Yes. The the PCI_CAP_ID_* comparisons were the only reason I initially decided not to use the existing pci_find_next_cap() function, which performs an almost identical task. I just noticed that the existing pci_find_next_cap() doesn't appear to have any callers. Given this, I'd prefer to modify the existing pci_find_next_cap() to suit our needs.

>> @@ -544,6 +574,54 @@ static int cf_check init_bars(struct pci_dev *pdev)
>>      if ( rc )
>>          return rc;
>>
>> +    if ( !is_hardware_domain(pdev->domain) )
>> +    {
>> +        if ( (pci_conf_read16(pdev->sbdf, PCI_STATUS) & PCI_STATUS_CAP_LIST)
>> +             == 0 )
>> +        {
>> +            /* RAZ/WI */
>> +            rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
>> +                                   PCI_CAPABILITY_LIST, 1, NULL);
>> +            if ( rc )
>> +                return rc;
>> +        }
>> +        else
>> +        {
>> +            /* Only expose capabilities to the guest that vPCI can handle. */
>> +            uint8_t next, ttl;
>> +
>> +            next = vpci_find_next_cap(pdev->sbdf, PCI_CAPABILITY_LIST);
>> +
>> +            rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
>> +                                   PCI_CAPABILITY_LIST, 1,
>> +                                   (void *)(uintptr_t)next);
> 
> In vpci_find_next_cap() the low 2 bits were masked off. While reserved
> at present, I wonder whether we wouldn't be better off passing them
> "through".

Agreed

>> +            if ( rc )
>> +                return rc;
>> +
>> +            for ( ttl = 48; ttl > 0; ttl-- )
> 
> vpci_find_next_cap() already bounds its loops; you effectively allow for
> 48*48 iterations here. It would seem better if the ttl applied globally,
> and would hence want to be an in/out for vpci_find_next_cap().

OK

> Also note that according to ./CODING_STYLE ttl shouldn't be uint<N>_t
> (this likely extends to other uses of such types here), and plain int
> also isn't really appropriate for a value which can't go negative.

Good catch, this was an oversight on my behalf. I will fix it.

