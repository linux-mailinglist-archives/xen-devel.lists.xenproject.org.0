Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 450F787F1B6
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 22:04:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695132.1084679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmK9A-0004IF-5S; Mon, 18 Mar 2024 21:03:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695132.1084679; Mon, 18 Mar 2024 21:03:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmK9A-0004Gi-1s; Mon, 18 Mar 2024 21:03:52 +0000
Received: by outflank-mailman (input) for mailman id 695132;
 Mon, 18 Mar 2024 21:03:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Pz/=KY=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rmK99-0004Gc-Ee
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 21:03:51 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2417::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03328497-e56b-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 22:03:48 +0100 (CET)
Received: from PA7P264CA0001.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:2d3::9)
 by SA0PR12MB4413.namprd12.prod.outlook.com (2603:10b6:806:9e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26; Mon, 18 Mar
 2024 21:03:45 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10a6:102:2d3:cafe::c4) by PA7P264CA0001.outlook.office365.com
 (2603:10a6:102:2d3::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26 via Frontend
 Transport; Mon, 18 Mar 2024 21:03:43 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Mon, 18 Mar 2024 21:03:42 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 18 Mar
 2024 16:03:41 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 18 Mar
 2024 14:03:41 -0700
Received: from [172.22.164.0] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 18 Mar 2024 16:03:40 -0500
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
X-Inumbo-ID: 03328497-e56b-11ee-afdd-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CEjYYKsqsBRjMoKzzcL5HKtsUmF87Ir+n+uKak+3KG5TlZui0kP/5xD8Fis6j4sSB8ufmzWOkkuN7NZ+UQLdec86WStcPKjjxtbXQBdCTeZTZqYvjjvwJ9Jl7PimGUCVrBhVBQfsdBysuCi9V2UshqRD87lrQtH5Z28EOcouJpZ/dbKpxnE0iq7XFYhiWWVry1ey2r/Fg3+PHlnLkAQFG07+j3avYra4/0luRCZnwzwwPF+NjhY/WPPKUv6C9LqOhyN/V8cDHl89t/EXrySpI8oQR/H379BeMq+CKbixzijLqnpzJEqwx7PVkSoDpximUkfgdnBSI4alyj46Vt3xxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OqX99EhzTzI3Q6ELp8FMSA0vDL3ywxwbPu1ksn1z+d8=;
 b=oU8ToRvUvL+uWimpN0ChsqI7b1UGZNLxzUAlaGmK97MVvbrjFY3deEAK4Vx6Rik3A0qAn9J90YHSfo7Iz/5ld58lgZdQerDkqT4TLUiCnyrL9YCNkH6Z+BxbboSR5yzKKYSJmBkXgYWcztBbGJuDiydpZ+7yfxjRvyE6w3zozL0ZIlarJWo7oTc5Hdl4YxCQa+fGetQ3XIN/AUKskr429iR+PTuLvjWZfRrU67PPrit5IdmYTomT4lhOpJVPbxD9LqHuDVVPpHpFnYydB0iBeZaAC8l0IfploKEO0qjChyW4elk44vGpcFsveif1joLESV6WQzmZ8+KiDWkLIlLNkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OqX99EhzTzI3Q6ELp8FMSA0vDL3ywxwbPu1ksn1z+d8=;
 b=B/gaqIyH9gIf4u/EQo4KSCK8WpzKL7AQBiw7augeFGDSOCipItDjVetH9wgYzQixoU8ksNQMZUtGLoDJtNv8ClMGjAUUdgrPdIYRj6WSSLgWKsUxukP7NGkB+es+TWA9D4XGWoiV1TXOpCC9p7P5DwRiS7OvN8pzml92mEJm2Yo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <242f4ec0-c634-4044-833e-7df3c720abc5@amd.com>
Date: Mon, 18 Mar 2024 17:03:40 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v13 10/14] vpci/header: emulate PCI_COMMAND register for
 guests
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	"Julien Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	<xen-devel@lists.xenproject.org>
References: <20240202213321.1920347-1-stewart.hildebrand@amd.com>
 <20240202213321.1920347-11-stewart.hildebrand@amd.com>
 <180cac00-e7c4-4bea-bd13-c5983da707d7@suse.com>
Content-Language: en-US
In-Reply-To: <180cac00-e7c4-4bea-bd13-c5983da707d7@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|SA0PR12MB4413:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ac4824b-5c71-4c5e-45cd-08dc478ee496
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Rrnt4itabgnVbY3dHwcg6H6xzw2xgk7RIThQV/c+JH66HKGzpkFTHOFW7OPFGspHg76BxzmCPjyg3rxhdV74C9m1s7BCdBVq3HyOmAxHV4j1kan/OmJ1QxyulbGD5Ir0a8scuG90NK69ofdon11M8Yim1yEKOSy5o1ftoPuRSdHYhTTPxfU6JJzZVd3F9ZEQ21QG8cEktvUO3Wj8NXU3BlFJhLyF9OV7Qv75yD3ab+S6IFKwjLKvErrD7+yWTbl9TJUZd7oBMp+9joKG88ZufdqvGs5IL3ZRtRM5D/bf24WYtCINeG5uGdrFlDplLP//A42jumCEWOEKBKmk8GAPsNPJvLXUxXoPVTFmO4ksHNHOOjw6y/TwlxuxW1ts4S64SUvTV6TaZ5OtIiqdTrJoozfVtTv9zwZKSCEwvzJlC0SnVi8fhQcrVpnXvbwGB7lwfMiYHsZoCmQSwa9106z8j7JipwexyLR0Y4jvjYnQnyy/iNxWnBR70hMm+hWyn67GxXiKPnMw4qOvxuYsOQkgNQLdLlJyeZH/+r1yqlJ8tEH7OFkGHhXVVd/bx12xBemMfcn2hubYxaDdarfj3j/zxv7ELDbNiODrtE7hGEuh7WrjNnKhKGxuxVZyrxI30SC6dNxto/OhvendX/DDGTu4riIp7aHXdV00/YvZx1mZvDMtN2eT6PuU9u3t8TScd7m6gkUhvc0BLhOOWUCyH3EmFA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400014)(7416005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 21:03:42.4655
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ac4824b-5c71-4c5e-45cd-08dc478ee496
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4413

On 2/14/24 10:41, Jan Beulich wrote:
> On 02.02.2024 22:33, Stewart Hildebrand wrote:
>> @@ -836,9 +870,20 @@ static int cf_check init_header(struct pci_dev *pdev)
>>      if ( pdev->ignore_bars )
>>          return 0;
>>  
>> -    /* Disable memory decoding before sizing. */
>>      cmd = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
>> -    if ( cmd & PCI_COMMAND_MEMORY )
>> +
>> +    /*
>> +     * Clear PCI_COMMAND_MEMORY and PCI_COMMAND_IO for DomUs, so they will
>> +     * always start with memory decoding disabled and to ensure that we will not
>> +     * call modify_bars() at the end of this function.
> 
> To achieve this, fiddling with PCI_COMMAND_IO isn't necessary. Which isn't
> to say its clearing should go away; quite the other way around: Why would
> we leave e.g. PCI_COMMAND_MASTER enabled? In fact wasn't it in an earlier
> version of the series that the guest view simply started out as zero? The
> patch description still says so.

Yep, clearing PCI_COMMAND_MASTER too for domUs makes sense to me, I'll
make this change in v14. I'll also try to improve the comment.

Roger suggested at [1] that we should reflect the state of the hardware
in the command register. I'll update the patch description accordingly.

Archaeology/notes/references follow, primarily for my own reference:

Note that the rsvdp_mask will be applied to the guest_cmd value before
being returned to the guest, so no need to apply masks here.

Clearing both PCI_COMMAND_MEMORY and PCI_COMMAND_IO for domUs was
suggested by Roger at [2] and [3]. It is currently problematic for
devices assigned to domUs to have memory decoding enabled at this stage
because we don't yet have a good/generic way to initialize
bar.guest_addr taking the domU memory layout into account.

Reminder that we want to leave the PCI_COMMAND_{MASTER,MEMORY,IO} bits
unchanged for devices assigned to dom0. A description of why can be
found in the commit message of:

53d9133638c3 ("pci: do not disable memory decoding for devices").

[1] https://lore.kernel.org/xen-devel/ZLqI65gmNj1XDBm4@MacBook-Air-de-Roger.local/
[2] https://lore.kernel.org/xen-devel/ZRquRcRz-K43WeMc@MacBookPdeRoger/
[3] https://lore.kernel.org/xen-devel/ZVy73iJ3E8nJHvgf@macbook.local/

>> --- a/xen/drivers/vpci/msi.c
>> +++ b/xen/drivers/vpci/msi.c
>> @@ -70,6 +70,13 @@ static void cf_check control_write(
>>  
>>          if ( vpci_msi_arch_enable(msi, pdev, vectors) )
>>              return;
>> +
>> +        /* Make sure domU doesn't enable INTx while enabling MSI. */
>> +        if ( !is_hardware_domain(pdev->domain) )
>> +        {
>> +            pci_intx(pdev, false);
>> +            pdev->vpci->header.guest_cmd |= PCI_COMMAND_INTX_DISABLE;
>> +        }
> 
> While here we're inside "if ( new_enabled )", ...
> 
>> --- a/xen/drivers/vpci/msix.c
>> +++ b/xen/drivers/vpci/msix.c
>> @@ -135,6 +135,13 @@ static void cf_check control_write(
>>          }
>>      }
>>  
>> +    /* Make sure domU doesn't enable INTx while enabling MSI-X. */
>> +    if ( new_enabled && !msix->enabled && !is_hardware_domain(pdev->domain) )
>> +    {
>> +        pci_intx(pdev, false);
>> +        pdev->vpci->header.guest_cmd |= PCI_COMMAND_INTX_DISABLE;
>> +    }
> 
> .. here you further check that it's actually a 0->1 transition? Why
> not alike for MSI?

Good catch, we should similarly check for a 0->1 transition for MSI.
I'll fix it.

