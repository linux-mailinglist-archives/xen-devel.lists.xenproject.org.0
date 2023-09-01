Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C23E78F7A1
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 06:15:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594185.927414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbvYL-0003rH-KH; Fri, 01 Sep 2023 04:14:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594185.927414; Fri, 01 Sep 2023 04:14:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbvYL-0003nv-GC; Fri, 01 Sep 2023 04:14:37 +0000
Received: by outflank-mailman (input) for mailman id 594185;
 Fri, 01 Sep 2023 04:14:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=am4h=ER=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qbvYK-0003np-Kb
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 04:14:36 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20612.outbound.protection.outlook.com
 [2a01:111:f400:7e88::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c0082d0-487e-11ee-9b0d-b553b5be7939;
 Fri, 01 Sep 2023 06:14:31 +0200 (CEST)
Received: from DM6PR10CA0022.namprd10.prod.outlook.com (2603:10b6:5:60::35) by
 SJ1PR12MB6052.namprd12.prod.outlook.com (2603:10b6:a03:489::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.23; Fri, 1 Sep
 2023 04:14:25 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:5:60:cafe::9c) by DM6PR10CA0022.outlook.office365.com
 (2603:10b6:5:60::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22 via Frontend
 Transport; Fri, 1 Sep 2023 04:14:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.211) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.16 via Frontend Transport; Fri, 1 Sep 2023 04:14:24 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 23:14:24 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 23:14:24 -0500
Received: from [192.168.139.126] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 31 Aug 2023 23:14:22 -0500
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
X-Inumbo-ID: 0c0082d0-487e-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AEDX4V6/JURJ1lV5zIG6iAb3/y8gvRHavNJneOLN1fhkvfBT1VFwBeep/BK05+AdmS3iWIiYo/IDnnfYR4DCX35XCrkLGrcqvHSbsL77E6L+N59juQUieD9KD4N3ekXO7XjBLuw+ePUxFa6W3BqjvIkd3lpR2F2YTrzexU8uxBTeUCOlEmWewLMyQy634+ir4Vu9wGe/joTVYWiw7epdPLuP4tjxey5t/OB+Yy43miqGwFMWZwHDwI5haQXQG+V/OSRvtWkItp6+o4+bcpiSniagDQNRUyEWQvhEeW9HjqP3qxiELaAzql1X9Z+5/htDjuJ72mWEzhnJO1bMCqOuGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UoeJEapfFqJUJn4pp1oxqV35yBWUaOfGoxv8sXmIsHE=;
 b=IoJBl9+12iO+VHHL/842jZ04Keh5aVuJnBo5avmDJiUalzhL+BtjpFAz4RQiwWjYS7VrMKwQOTX1C4Oziu80PP4nZ8eOZ4BA1O7YBK53vrD2dQT20pk6A7h4bBzVNQ4b+jezMIr48YOlk5IK3atD1n2gn4vTDLFsuFdF2ThUuoHn9RS0SEY3+sURWdZmAECJCHYgGnkmW+SvbYuT76QMwxIntTG1wx4MJV/VKLYqAMGLo337kvhiiVcuwvVQyHGWdu1d85QUVqWL6OCxXFmAxGrg4BeTk5MeaR2Bj0kZdWAI/amICU1XZb+TNPtat0js8unOjbytIrcMlrOInVwTcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UoeJEapfFqJUJn4pp1oxqV35yBWUaOfGoxv8sXmIsHE=;
 b=Qn5PRU0kUan9+U43xasmHUi5E2AwdeF1lFh4wqHa5VyX9vtl3sxKP/rmatPu+4z0u6vyWx6eRY5zrO1CeJhmtVh4Shq3FhGTMtcIg5io38bM4BKshIcoE8UzXv8VNBQbIi9YndAlHe/1o9FYQl2aR0KsM8zElH+T6bj0EJQN/Ao=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <b76fbdab-9e72-996a-2ae3-afd13b086bad@amd.com>
Date: Fri, 1 Sep 2023 00:14:18 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 6/6] xen/vpci: header: filter PCI capabilities
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <20230828175858.30780-1-stewart.hildebrand@amd.com>
 <20230828175858.30780-7-stewart.hildebrand@amd.com>
 <059d3e2d-26f2-e24a-57fb-5ae10f6c2f5f@suse.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <059d3e2d-26f2-e24a-57fb-5ae10f6c2f5f@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|SJ1PR12MB6052:EE_
X-MS-Office365-Filtering-Correlation-Id: 16b2347a-ce2b-4ba7-2a51-08dbaaa1ed54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QvOBHGA/7yxDhCzj2BhoZY9n9H/wKo4oZs1UazrdI+5zfauBWJgQ24qhfnddINc4HHHVYhI85tnyb7GinDot++px1ngCspl6q+bYdrEWCjtlvG4Urcy0tnKJkQ26fe/isbRwak6R9bkJzIiw2he9QzXNkp9/yAc4iUX5uV77H/kLrA81J74aifjGs33ldtgYvzd5Sc7E8RLWCYbUrloC839v84BVGDs0uquRet1EDL4W8bGtxH9Wj2BBkoiBg44LrPJFwGiBAFb2wiz3ZzHx70VpHPYrD3cC1GfyShJKkJkPTOEmEOlVqJIHLgk9N67IdTfW39Ht5FxdbWO6FuPVNsxWZ20NyipQbm6oiQ8OWoN/LKbgwivfSJbsmvI2/fVtZWQOgw2eCLpEA/NRoUFMzachIELTvQSMPHbVnBdRtjts4PyKlYgHAM/Cf4qsFMC4BGqeJ1JDtVl88Rug9kp7qMdG6H7FyDrQZRpiYqL77GU5SC3bVE6MWfAgTIPdKzjK9ftg6EMjo3yeFGmpc//e/lNotrJ5MMFIzdQrftb7UFTYMZ/QJvdsABoxjxNAHntlQPRDIrfkYHPBzz05yRPGbjcc8STeVvl1vDJJX/NTK9+L5p2DMs1O8R8g0K/eODr/8hzSTdRM391+iy0xyqK44cYSPBQzJTe1ikXdBt/QbVdGYC7RJ9+/BtHhfFihEg/lE0XBRwR68gKFLGgSjK+UpWyWRPNWH96qHS++7vwQGUQZ5dtedauZQ8mMTXS7mAzaQX4+wFkg+gCxRbzZRl8IlDKta8yjHgI6eQ1LltP5VUMbYxrt4q5r9TTPJBfs8c8f
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(396003)(346002)(136003)(186009)(82310400011)(1800799009)(451199024)(36840700001)(40470700004)(46966006)(6666004)(53546011)(478600001)(2616005)(26005)(336012)(426003)(2906002)(44832011)(6916009)(16576012)(54906003)(316002)(41300700001)(70206006)(70586007)(5660300002)(8676002)(8936002)(4326008)(40460700003)(40480700001)(47076005)(36756003)(36860700001)(86362001)(31696002)(82740400003)(81166007)(356005)(31686004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 04:14:24.9667
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16b2347a-ce2b-4ba7-2a51-08dbaaa1ed54
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6052

On 8/31/23 08:11, Jan Beulich wrote:
> On 28.08.2023 19:56, Stewart Hildebrand wrote:
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
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>> 
> Nevertheless a couple of remarks:
> 
>> --- a/xen/drivers/pci/pci.c
>> +++ b/xen/drivers/pci/pci.c
>> @@ -39,31 +39,44 @@ unsigned int pci_find_cap_offset(pci_sbdf_t sbdf, unsigned int cap)
>>      return 0;
>>  }
>>
>> -unsigned int pci_find_next_cap(pci_sbdf_t sbdf, unsigned int pos,
>> -                               unsigned int cap)
>> +unsigned int pci_find_next_cap_ttl(pci_sbdf_t sbdf, unsigned int pos,
>> +                                   bool (*is_match)(unsigned int, unsigned int),
>> +                                   unsigned int userdata, unsigned int *ttl)
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
>> +        if ( is_match(id, userdata) )
>>              return pos;
>>
>> -        pos += PCI_CAP_LIST_NEXT;
>> +        pos = (pos & ~3) + PCI_CAP_LIST_NEXT;
>>      }
>> +
>>      return 0;
>>  }
>>
>> +static bool cf_check is_cap_match(unsigned int id1, unsigned int id2)
>> +{
>> +    return id1 == id2;
>> +}
> 
> Personally I would have preferred to get away without yet another hook
> function here, by ...
> 
>> +unsigned int pci_find_next_cap(pci_sbdf_t sbdf, unsigned int pos,
>> +                               unsigned int cap)
>> +{
>> +    unsigned int ttl = 48;
>> +
>> +    return pci_find_next_cap_ttl(sbdf, pos, is_cap_match, cap, &ttl) & ~3;
> 
> ... passing NULL here and then suitably handling the case in that
> common helper.

Thinking in terms of reducing the amount of dead code, I'll change it

>> @@ -561,6 +573,71 @@ static int cf_check init_bars(struct pci_dev *pdev)
>>      if ( rc )
>>          return rc;
>>
>> +    if ( !is_hardware_domain(pdev->domain) )
>> +    {
>> +        if ( !(pci_conf_read16(pdev->sbdf, PCI_STATUS) & PCI_STATUS_CAP_LIST) )
>> +        {
>> +            /* RAZ/WI */
>> +            rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
>> +                                   PCI_CAPABILITY_LIST, 1, (void *)0);
>> +            if ( rc )
>> +                return rc;
>> +        }
>> +        else
>> +        {
>> +            /* Only expose capabilities to the guest that vPCI can handle. */
>> +            uint8_t next;
> 
> If this was "unsigned long", ...
> 
>> +            unsigned int ttl = 48;
>> +
>> +            next = pci_find_next_cap_ttl(pdev->sbdf, PCI_CAPABILITY_LIST,
>> +                                         vpci_cap_supported, 0, &ttl);
>> +
>> +            rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
>> +                                   PCI_CAPABILITY_LIST, 1,
>> +                                   (void *)(uintptr_t)next);
> 
> ... you'd avoid the need for the double cast here and again below. Yet
> then I realize that Misra would take offence at us doing so ...

As ugly as that double cast is, I think I prefer the next and pos declarations have consistent types (which I had intended to be unsigned int to match the prior patches, not uint8_t). As well as not making the MISRA situation any worse. The casts, after all, make it excruciatingly obvious what we're doing here, I hope.

Stew

