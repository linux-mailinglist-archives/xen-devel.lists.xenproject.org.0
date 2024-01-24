Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E94A883B2F7
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 21:21:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671220.1044462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSjkN-0000YT-PN; Wed, 24 Jan 2024 20:21:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671220.1044462; Wed, 24 Jan 2024 20:21:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSjkN-0000W9-MG; Wed, 24 Jan 2024 20:21:19 +0000
Received: by outflank-mailman (input) for mailman id 671220;
 Wed, 24 Jan 2024 20:21:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=87Ys=JC=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rSjkM-0000W3-Gb
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 20:21:18 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20620.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f471a31-baf6-11ee-9b0f-b553b5be7939;
 Wed, 24 Jan 2024 21:21:15 +0100 (CET)
Received: from CY5PR17CA0032.namprd17.prod.outlook.com (2603:10b6:930:12::28)
 by CY8PR12MB7729.namprd12.prod.outlook.com (2603:10b6:930:84::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Wed, 24 Jan
 2024 20:21:12 +0000
Received: from CY4PEPF0000EE33.namprd05.prod.outlook.com
 (2603:10b6:930:12:cafe::81) by CY5PR17CA0032.outlook.office365.com
 (2603:10b6:930:12::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22 via Frontend
 Transport; Wed, 24 Jan 2024 20:21:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE33.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7228.16 via Frontend Transport; Wed, 24 Jan 2024 20:21:07 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 24 Jan
 2024 14:21:06 -0600
Received: from [172.23.114.18] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 24 Jan 2024 14:21:04 -0600
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
X-Inumbo-ID: 1f471a31-baf6-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A7yRXSmYIwUk8mLZCCFbFTDA7+h4ryxav2QBzkBdYldA5h2nz+pLQFelr0rYSRQoHL1g/QXwk5/lupr1jA5RYwfdNdWpm0JAUIGVqY4g8SlXG/b6yYi3Yt17Vam9AoNEPgPgT52cZJgXjXRe8w3om5RSdTO77+Wel7bhX/WiCLy+rnrnH/k0es0DeHkjkcCNKzGRHniEOGmCHOQdVDPSE6V7TTGntd0nrIF0YYidjoiTqohMQVdgQf1Up6ZG7X2F05RY6Ao4QGU3Yl38AuKxW7IvNs2cksuL7Qu41qlWQQ8rIbPw9ckNfeDmuoacYUo33ccZx+Pajz0vXJ+EKORITw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V0JA7FoHuWcbjJZsa8jjyQSeGIximf/CWa4nHoAsF54=;
 b=TKSQijbEGCV1VZzykcGVR3MldpSun9E56vCS+KtVt41rr+JrdJl/ihzdWs4nGhiIkQlQ0iiWDXQyVIE1HTmUjhqsWFPFQSZRKgAAghyBYmzkNnaO72WF0LTjveIZcIa9ZQMDpULw1L6vhxwyUEWeGh+Oq+B0qbVAdVx4LvsZlExf3ykOyVuJNF7+NAvFO3jwQvqHXv8S6RH1itPKeM+PnmO65lotp8eC3irsCt9Mm2plNsh8R37YJ1ktLXvBIqAgAXDQR36ml3huDN1MQ8t96eQZY55qt7YGj1EfTTMb5G/0feiJJoU+Ek3seS2qEAM2JNOKV/W5bPCnAHZx4ThRDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V0JA7FoHuWcbjJZsa8jjyQSeGIximf/CWa4nHoAsF54=;
 b=oqLRuGUBo34kEqfirYj7WzL+Oxwp8Aao9La7sagdoJXXiIbsb2EnXC1lYwf41XLbpJLfpi99XnYs6vA0xHKLauTJNgbsMV4uYiFd2jG4pvfZAK35E+JykCpCgB8ICwISZtdNFiEpEO4bbYgD0yVxnaO261VMYIk+UdIoX/n4bYI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <3fa355a2-da4e-4a16-b4fe-0d402a290b14@amd.com>
Date: Wed, 24 Jan 2024 15:21:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12.2 01/15] vpci: use per-domain PCI lock to protect vpci
 structure
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Paul Durrant <paul@xen.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, <xen-devel@lists.xenproject.org>
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
 <20240109215145.430207-2-stewart.hildebrand@amd.com>
 <20240115194309.45683-1-stewart.hildebrand@amd.com>
 <7e936e6a-3218-4c4a-ac68-a58cd363a11d@suse.com>
 <e05e63ab-a86f-45c4-bd80-2b7d6b99aa3d@amd.com> <ZbDIoobsFmx-U5Xt@macbook>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <ZbDIoobsFmx-U5Xt@macbook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE33:EE_|CY8PR12MB7729:EE_
X-MS-Office365-Filtering-Correlation-Id: a9486e12-2fc4-49ae-63aa-08dc1d19ff1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4ZB5KK4o6Q9+8DvpgVhC05xC1RUiHlVzYyG2Wnf75QnI5vcz/53ATA5WcCA0T9ek+yKeGE6R2RhcNf3I5wgSyFRmEeHjLgdlg9NfIUBxYqtjqEPcQz1US0U1fjpbMN4+w8710OR6I1RFVxjBswepeX9FDSzJaUh4Aq41CIRPs6m8qm/yDpfdpI2i6RHcrSqjegr3Yngq54LVhCCNnTWzElHEZRwB+gbtTjMhLpHKJM8KmdNHpzlQuLG5R7PJD9MN8nTIdty47GC3A4FsIP2bD/RtyRXDIE1BO8rF2Q3a2GeFGeW0yyLuWxfqYSAl1XObt1jhuA7M9mb/bvxsaH0eFaiZr3Sh4z5+nKZOqn7gtr0AdIa+fGo/NhNdQA4WZVVJbH1Kwf+HUVYXskZut+9lqqo6o7aGOUapm6LrqCSwfN5jjmITk1vlAzeeDPZUFSmC3SQHbm381A2mY/Ug2guLimXM9bzgDgBiHf4rbN6SV8KH+sBDpqZN/gM+6ro5Oet/mwuRc1E/9YlLxjWkYX1GcqsNMlZdla6uGUQpG+2yoruXPZKicJpbYR/8GFrlmdIXCkfWnb8pE7+HHp3sEcgSbk426B8A3TBgRK0DO22e31IkCwkshRPQtRaH2TSLCvBiS+H6vAmz+m9rfi6aUE8P7GHzeHB0BaEUSMKUzSi5LM7zFTGPIWxPOZUQub9FTcs7kn5diMeF5jXT3UJK5qwZm3z86R6roi+GQYvWSyJ6MWAhwYuxbWEIQBiiUa6++9Ro2goO+ZCYn7q7X+wHFqC3yLgJjaluL7k0pD2BIj9oUWdH36fzogVzQTERqxWf5jzM
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(376002)(346002)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(82310400011)(40470700004)(36840700001)(46966006)(478600001)(31686004)(40480700001)(40460700003)(82740400003)(4326008)(8936002)(44832011)(5660300002)(8676002)(426003)(336012)(83380400001)(7416002)(2906002)(81166007)(36860700001)(31696002)(47076005)(26005)(54906003)(86362001)(70586007)(41300700001)(16576012)(53546011)(36756003)(6916009)(356005)(70206006)(316002)(2616005)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 20:21:07.0046
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9486e12-2fc4-49ae-63aa-08dc1d19ff1b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE33.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7729

On 1/24/24 03:21, Roger Pau Monné wrote:
> On Wed, Jan 24, 2024 at 12:07:28AM -0500, Stewart Hildebrand wrote:
>> On 1/23/24 09:29, Jan Beulich wrote:
>>> On 15.01.2024 20:43, Stewart Hildebrand wrote:
>>>> @@ -1043,11 +1043,11 @@ static int __pci_enable_msix(struct pci_dev *pdev, struct msi_info *msi,
>>>>  {
>>>>      struct msi_desc *old_desc;
>>>>  
>>>> -    ASSERT(pcidevs_locked());
>>>> -
>>>>      if ( !pdev || !pdev->msix )
>>>>          return -ENODEV;
>>>>  
>>>> +    ASSERT(pcidevs_locked() || rw_is_locked(&pdev->domain->pci_lock));
>>>> +
>>>>      if ( msi->entry_nr >= pdev->msix->nr_entries )
>>>>          return -EINVAL;
>>>
>>> Further looking at this - is dereferencing pdev actually safe without holding
>>> the global lock?
> 
> It is safe because either the global pcidevs lock or the per-domain
> pci_lock will be held, which should prevent the device from being
> removed.
> 
>> Are you referring to the new placement of the ASSERT, which opens up the possibility that pdev could be dereferenced and the function return before the ASSERT? If that is what you mean, I see your point. The ASSERT was placed there simply because we wanted to check that pdev != NULL first. See prior discussion at [1]. Hmm.. How about splitting the pdev-checking condition? E.g.:
>>
>>     if ( !pdev )
>>         return -ENODEV;
>>
>>     ASSERT(pcidevs_locked() || rw_is_locked(&pdev->domain->pci_lock));
>>
>>     if ( !pdev->msix )
>>         return -ENODEV;
> 
> I'm not specially worried about the position of the assert, those are
> just debug messages at the end.
> 
> One worry I have after further looking at the code, when called from
> ns16550_init_postirq(), does the device have pdev->domain set?
> 
> That case would satisfy the first condition of the assert, so won't
> attempt to dereference pdev->domain, but still would be good to ensure
> consistency here wrt the state of pdev->domain.

Indeed. How about this?

    if ( !pdev )
        return -ENODEV;

    ASSERT(pcidevs_locked() ||
           (pdev->domain && rw_is_locked(&pdev->domain->pci_lock)));

    if ( !pdev->msix )
        return -ENODEV;

And similarly in __pci_enable_msi(), without the !pdev->msix check. And similarly in pci_enable_msi(), which then should also gain its own if ( !pdev ) return -ENODEV; check.

