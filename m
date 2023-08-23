Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B156784F0C
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 05:03:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588868.920495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYe9P-0003si-B4; Wed, 23 Aug 2023 03:03:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588868.920495; Wed, 23 Aug 2023 03:03:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYe9P-0003pN-84; Wed, 23 Aug 2023 03:03:19 +0000
Received: by outflank-mailman (input) for mailman id 588868;
 Wed, 23 Aug 2023 03:03:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dNfX=EI=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qYe9N-0003pD-Qk
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 03:03:17 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20605.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 990e0d1d-4161-11ee-8782-cb3800f73035;
 Wed, 23 Aug 2023 05:03:15 +0200 (CEST)
Received: from SA0PR11CA0181.namprd11.prod.outlook.com (2603:10b6:806:1bc::6)
 by BY5PR12MB4886.namprd12.prod.outlook.com (2603:10b6:a03:1c5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 03:03:10 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:806:1bc:cafe::f8) by SA0PR11CA0181.outlook.office365.com
 (2603:10b6:806:1bc::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Wed, 23 Aug 2023 03:03:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.15 via Frontend Transport; Wed, 23 Aug 2023 03:03:09 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 22 Aug
 2023 22:03:08 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 22 Aug
 2023 20:03:07 -0700
Received: from [172.22.191.126] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 22 Aug 2023 22:03:06 -0500
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
X-Inumbo-ID: 990e0d1d-4161-11ee-8782-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VlychS8lp8pw471MySgtXYN4ThGDwsODfDrnE37kG3yOKHoxVTCJp83zFLX7sbs3hT8jNTxbs2qpDLYk5ULWMHGDhwFVwI01lTK+4dHBsF7YL03tuKd/MN6u3/mdif5dgJnWqhvJSDF77oc50nVLC0ys81HtiYGHJeMXfH76enTiOyDJh7boI0jjFl6oJd1wTBIwBddNoY/aorEYLxfLrYzg9zD8ll2LOZ9pCw0hYjOMp/RQC88R5J/ZjdXgtKh5BNX1/E4ipvWlVG3i33Bre+u/pGqMaUAqilgWNRZQl0JDqcCgbzep1q6N/KVFA6cxr+G1Oyr/p4JzLb4EcNP6zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Y5GmR1bldnGn180PaYbi+W9QCk0oY72SxkDRaeWjZs=;
 b=l9mdYp2J1WejXsZMtDb7sM8sYWdBd8h7rIB7oTLxCS8ftQGa6j1ZZZcHAdubMM5X/J30jJ+L9/VP9dOZaXCR/CTRDUCZinDzAkIlHB+tX6ajZfQAwV1jwcDTm+RnGW5f/ox7rdaKOK56r+ruz6uL1PHpBYSSfzALY3DPhwsv7x5I/+h//0O1BoOMO3DGDa7NKT1xpnH9NeXkKZfnsO9kcNpLf/q2IsEguDfCuGd6LF08J6VFiaG7sbgritlryklV/CL6w2uqI0DSnH+CTL304C8vSjg3JyCradolhreNUFyAvbE+iJlwzpmzTYeIyGzU+2PjmHtFwQwB7tUsvx9Rqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Y5GmR1bldnGn180PaYbi+W9QCk0oY72SxkDRaeWjZs=;
 b=djbz3apwEMSlt0rkDtb0txS2ItRLUj6RcooMoAhXzcVbFSaOXlEfFBaY6jTfzO0Hb3nKk5+EVPY5xJhXKnbz1yZwkhJ7ZrEMZKfkVjwYl4B98xXcriY+bM975dEuLFxHDtEV2oV+uT8OzXYCnz74TB6HO8ob3UjN27MfHVqKpNY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <e5bedf64-aeeb-2e10-7684-7e46590e92e8@amd.com>
Date: Tue, 22 Aug 2023 23:03:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 2/4] xen/pci: convert pci_find_*cap* to pci_sbdf_t
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant
	<paul@xen.org>, Kevin Tian <kevin.tian@intel.com>,
	<xen-devel@lists.xenproject.org>
References: <20230822012955.312930-1-stewart.hildebrand@amd.com>
 <20230822012955.312930-3-stewart.hildebrand@amd.com>
 <31d4ae2d-1b25-b272-a5c1-2fef3dffb7af@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <31d4ae2d-1b25-b272-a5c1-2fef3dffb7af@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|BY5PR12MB4886:EE_
X-MS-Office365-Filtering-Correlation-Id: c578f59b-1d24-4fd0-ed9c-08dba3857b49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MbW7AVGALtYiuq4e0jol+Z2Bc628hNrheoIC/NXqDSKGxviSIrapnw27ljtBQCLKANohifLeF4IE0DA5XPTnZqjJm2hrWoqllOD3rTWfzxxPYtgGobEx2zzNnJy9QvjhMhpi7QPF5lZKEZorgJ1ZQr/Rs8cFlzzrrP0H4YWcjgZkQKJ7cZSls/KMzdlF/73t/hvhZfJiIWeJ25p7P+CrHI54CrS14/Gryt0V5G9Utvhsd/YcGz0KRpvRc9CRn1cLN9lLZ8WbaTOMuEWknbfq+U+gXZP7vgONIDttG97UEA/RvhOZKhPlX4F7q5xzF1C6gZfXwlQF+1nC012LT7W1PGshAaQNq49Z+Zv5EODYhvJ/AKLabyIIV9aQnAkqiw8hp4O+wdCTkgnd8Yl0Vq/njSQVfDl37WaSOaowvlPte6m3DscBXH6nd87uxk/YOI2WZsY/OjO5WarHbNMYpxgiGADNUmkU7ba04eAay1hi67brfhyJ2zSM/xiO007IPfXd38vyoFYNtQmj2x2s58u2JbXeelc5cTz6MruCcfHBugSfqh4WSX3OJ64wbvxUrbD/9Y/G5cDke7YTYhUeNnVnSDPRleqmqXPbiFxesov/VLAUNJyblUfars8LJArnFM1IR6HenU4OtwWV7QA3DAs33Zy0sappdCSAWOK4rdg0iT+bbf1CU/bdbTHmOLMAOc0BNnYFXIZWslM0KSpuyi6vU3vb+y8Nifx6Bbvcc2y4Az8tGkDlDmQxwMWSaRHsNxGuSHjouMMHSCQJMR4yqEe+fPME2jGvhFgy4RB9QJm96fU0KYZAdHZa4fhXyf71au5Y
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(136003)(396003)(376002)(451199024)(82310400011)(1800799009)(186009)(36840700001)(40470700004)(46966006)(2906002)(7416002)(40480700001)(53546011)(83380400001)(5660300002)(44832011)(426003)(336012)(26005)(31686004)(36860700001)(31696002)(86362001)(47076005)(8676002)(2616005)(8936002)(4326008)(70586007)(316002)(6916009)(54906003)(16576012)(66899024)(70206006)(478600001)(356005)(81166007)(82740400003)(40460700003)(36756003)(41300700001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 03:03:09.6852
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c578f59b-1d24-4fd0-ed9c-08dba3857b49
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4886

On 8/22/23 08:53, Jan Beulich wrote:
> On 22.08.2023 03:29, Stewart Hildebrand wrote:
>> @@ -291,12 +291,9 @@ static void msi_set_enable(struct pci_dev *dev, int enable)
>>  static void msix_set_enable(struct pci_dev *dev, int enable)
>>  {
>>      int pos;
>> -    u16 control, seg = dev->seg;
>> -    u8 bus = dev->bus;
>> -    u8 slot = PCI_SLOT(dev->devfn);
>> -    u8 func = PCI_FUNC(dev->devfn);
>> +    u16 control;
> 
> As you touch such places, it would be nice to also switch to uint16_t at
> the same time. (Similarly when you touch "pos" declarations anyway,
> converting them to unsigned int when they're wrongly plain int would also
> be nice.)

OK. For clarity's sake (and for my own sake), I'll bound the scope of these changes to lines/statements/declarations that are being modified anyway as a result of the switch to pci_sbdf_t. Also, with the s/int/unsigned int/ changes, I will remove "No functional change" from the commit description (not sure it should have been there in the first place).

>> @@ -318,17 +315,12 @@ static bool msi_set_mask_bit(struct irq_desc *desc, bool host, bool guest)
>>  {
>>      struct msi_desc *entry = desc->msi_desc;
>>      struct pci_dev *pdev;
>> -    u16 seg, control;
>> -    u8 bus, slot, func;
>> +    u16 control;
>>      bool flag = host || guest, maskall;
>>
>>      ASSERT(spin_is_locked(&desc->lock));
>>      BUG_ON(!entry || !entry->dev);
>>      pdev = entry->dev;
>> -    seg = pdev->seg;
>> -    bus = pdev->bus;
>> -    slot = PCI_SLOT(pdev->devfn);
>> -    func = PCI_FUNC(pdev->devfn);
>>      switch ( entry->msi_attrib.type )
>>      {
>>      case PCI_CAP_ID_MSI:
> 
> You don't further alter the function, so this looks like an unrelated
> (but still desirable for at least Misra) change.

Right. These instances of -Wunused-but-set-variable warnings were the result of a previous pci_sbdf_t conversion. I'll split it into a separate patch, perhaps with a fixes tag:
Fixes: 0c38c61aad21 ("pci: switch pci_conf_write32 to use pci_sbdf_t")

>> @@ -685,8 +674,8 @@ static u64 read_pci_mem_bar(u16 seg, u8 bus, u8 slot, u8 func, u8 bir, int vf)
>>      {
>>          struct pci_dev *pdev = pci_get_pdev(NULL,
>>                                              PCI_SBDF(seg, bus, slot, func));
> 
> With this, ...
> 
>> -        unsigned int pos = pci_find_ext_capability(seg, bus,
>> -                                                   PCI_DEVFN(slot, func),
>> +        unsigned int pos = pci_find_ext_capability(PCI_SBDF(seg, bus, slot,
>> +                                                            func),
>>                                                     PCI_EXT_CAP_ID_SRIOV);
> 
> ... please use pdev->sbdf here. Albeit I guess some further re-arrangement
> is wanted here, to eliminate all of those PCI_SBDF() (and then also dealing
> with the otherwise necessary NULL check). IOW perhaps fine the way you have
> it, and then to be subject to a follow-on change.

OK. I'll keep it as-is in this patch, then create a follow-on patch that: uses pdev->sbdf instead of PCI_SBDF inside this code block, and moves the NULL check earlier.

>> --- a/xen/include/xen/pci.h
>> +++ b/xen/include/xen/pci.h
>> @@ -193,11 +193,10 @@ int pci_mmcfg_read(unsigned int seg, unsigned int bus,
>>                     unsigned int devfn, int reg, int len, u32 *value);
>>  int pci_mmcfg_write(unsigned int seg, unsigned int bus,
>>                      unsigned int devfn, int reg, int len, u32 value);
>> -int pci_find_cap_offset(u16 seg, u8 bus, u8 dev, u8 func, u8 cap);
>> -int pci_find_next_cap(u16 seg, u8 bus, unsigned int devfn, u8 pos, int cap);
>> -int pci_find_ext_capability(int seg, int bus, int devfn, int cap);
>> -int pci_find_next_ext_capability(int seg, int bus, int devfn, int start,
>> -                                 int cap);
>> +int pci_find_cap_offset(pci_sbdf_t sbdf, u8 cap);
>> +int pci_find_next_cap(pci_sbdf_t sbdf, u8 pos, int cap);
>> +int pci_find_ext_capability(pci_sbdf_t sbdf, int cap);
>> +int pci_find_next_ext_capability(pci_sbdf_t sbdf, int start, int cap);
> 
> The remaining types want converting, too: Neither fixed-width nor plain int
> are appropriate here. (It's a few too many type adjustments to make, for me
> to offer doing so while committing.)

Understood, I'm happy to make the change for v4. Is the following what you'd expect it to look like?

unsigned int pci_find_cap_offset(pci_sbdf_t sbdf, unsigned int cap);
unsigned int pci_find_next_cap(pci_sbdf_t sbdf, unsigned int pos,
                               unsigned int cap);
unsigned int pci_find_ext_capability(pci_sbdf_t sbdf, unsigned int cap);
unsigned int pci_find_next_ext_capability(pci_sbdf_t sbdf, unsigned int start,
                                          unsigned int cap);

