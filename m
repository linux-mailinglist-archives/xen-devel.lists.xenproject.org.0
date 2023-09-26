Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E59B57AEFB6
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 17:29:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608450.946922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ql9ye-0008Sc-GN; Tue, 26 Sep 2023 15:27:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608450.946922; Tue, 26 Sep 2023 15:27:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ql9ye-0008PF-Cg; Tue, 26 Sep 2023 15:27:56 +0000
Received: by outflank-mailman (input) for mailman id 608450;
 Tue, 26 Sep 2023 15:27:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZoCt=FK=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1ql9yc-0008P7-QM
 for xen-devel@lists.xenproject.org; Tue, 26 Sep 2023 15:27:54 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20607.outbound.protection.outlook.com
 [2a01:111:f400:7e89::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4134ddac-5c81-11ee-878a-cb3800f73035;
 Tue, 26 Sep 2023 17:27:52 +0200 (CEST)
Received: from MW4PR03CA0031.namprd03.prod.outlook.com (2603:10b6:303:8e::6)
 by BN9PR12MB5098.namprd12.prod.outlook.com (2603:10b6:408:137::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.25; Tue, 26 Sep
 2023 15:27:46 +0000
Received: from CO1PEPF000044F9.namprd21.prod.outlook.com
 (2603:10b6:303:8e:cafe::7c) by MW4PR03CA0031.outlook.office365.com
 (2603:10b6:303:8e::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Tue, 26 Sep 2023 15:27:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6863.9 via Frontend Transport; Tue, 26 Sep 2023 15:27:45 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 26 Sep
 2023 10:27:45 -0500
Received: from [172.20.57.36] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 26 Sep 2023 10:27:44 -0500
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
X-Inumbo-ID: 4134ddac-5c81-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kqp8DU3Aj3wH6hqLLNZ1kyo//c1Lpawbtu+NRgM+6i3LQZgBiSc8B4PGwAP4dD3+q5i5jf1ZXv0DLz/quQ07PeF/oHTJJ2U6VxUyZaNHKrNq/b+8vQqi3v/QwwedS9WFFDwOlBcpl0GAXsaVl8JzQyz7u9kaOR6gv9wC11XW4kBCNhpj01hrdTBkn0KPDerqayhtNLK/WJBJrSRXY92cSSQ49sH8oCvgx7+msfmriAKppNya7zgFYofjft+T0xkhMYJVIAx1IKFq4lWEF6+rvB+AYW4hFwKvqxLG1g2RVzfKDVvNZo+KWoC5+SKtN58WNqS12hofz+jgEjW8qMzaTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MEzqKmuwoHB5XNbcaO9bs9bXpXVIreUDVmcaDQLXX8I=;
 b=mXCRJu/QohT8aR7WaOV7+OqZ2MJVKbjOCF+oM9dhKuT1ZjKdXj2o3LZglP2NrEx1y+ZpCH4bQzg5LcVLqV07fYZYBYmDm+DDYDJp4GlNfmSfUeVowQKnSzQC3O5Tl5GTlp2NIxOFe2nPLH9XbAvnFszISzxmHYWA+FQ23FOP+N3G5P+jLQPoS/0sGnpbX826QnQ2lONDHkJaEBsH11hyl8vk88dXUbLT8zLsEfITl1KwGEMbBJXD5cvgwiNRUjMQPf4wCc+PElqCvSrtd8fKRHXJ/hi2RMwQdTqR9cgJNfRHWAsl79dy019Mz3na41yURjYgFHbCB765kak7oonl3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MEzqKmuwoHB5XNbcaO9bs9bXpXVIreUDVmcaDQLXX8I=;
 b=iZsT68Esgb7cwRHUxi1n8i/cYMiD0AvYIp8TqSbA3j0YLpUxnTs6wSiGy3g4V8CPMsfrx2WZiZuTA+Xwu/u10CThz6EvzvQoCxWfL930uUJkPxWDJC0oZCXFI2JshTN8c5okmrgS/ASJPFG2Dh2Wh7t79nH6za44Krrv0WjchRQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <8a300dad-29d5-2017-70ad-09abc2c62368@amd.com>
Date: Tue, 26 Sep 2023 11:27:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v9 15/16] xen/arm: vpci: check guest range
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
 <20230829231912.4091958-16-volodymyr_babchuk@epam.com>
 <ZQ1T8vImUxAaeLdj@MacBookPdeRoger>
 <0a1bc845-28b7-4af8-d6d9-cd5fc7bb4d74@amd.com>
 <ZRKRNcypuvP26luu@MacBookPdeRoger>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <ZRKRNcypuvP26luu@MacBookPdeRoger>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F9:EE_|BN9PR12MB5098:EE_
X-MS-Office365-Filtering-Correlation-Id: f37165aa-b70e-47f1-f301-08dbbea52287
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fc/k+YIzh6PCFbXBD5cW+MykZxDo1Vgubi6omfJwGW05EXYSFu7exIt1tmnRE+1+JnpNwKfHCX5yaiHePrv21Fr3T1sv82n9fRkGoUjB5uNxQvWze6lbrVZnrlMp+6XkFOw5zdGTc2DGpdg058i7vCKs9oDTXxHm3WoncfmALfJM69ieAtl3O0GEiTq2JNmH/Jk8UHrwz0QqTebv+Pa6/X8BeK7OESiAFLr0r8ktizq92AUKPGakA+xY1WpaHhOW5og2Dndwbi8SQOFHPhTjs/Hqvlh1A4Awd3i4FJuq1E+B7nsvLFcUsQDZPZYLbwmm4gJCIj6t/maypNTfMZDhPcCwMbrIIi127FosVZg4oF+oweIZKNy6PiN8NMWaoBwyYvHvF6tEBcJX3RbdFHpwJxNapW55VssP6XlYTMxS9B/ntmF0qlbltPhTyU44dGkf3bd08a4jHyTnwvXeJlej9i5qGqJlEK89O9mhAY6j9/7B+V1H11dMU3Zhovz2rXu7lINC5QOBBNDBKlMVz4Zp4SKDj7tkkBknzHVKJMsoM8JdrkjB7f+bNgBz9sUw6F5yaSGMInxX7Gck1gvru6NsCiXND+WWKR6Huha75i2Vd73h78QcMiZkNb2SRxla4bIdE0xNpcfamz3G9idFRYmmhRh6s5VvLoI7QMhXyseHPYDAU62exSKFP1ZLM+u22ACeyhaVvV3xEgqW/4zxpHAl57lnPfa1Gza6BtV8gVBn6rbWJQAoZPNLZnu7IPN7AFW+5LwQVClYROXIFRCeYyHsSbxpxm+bnsOTEtzk0fSAPUJkdlA823SJegZBLqUviYZe
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(136003)(346002)(376002)(230922051799003)(1800799009)(82310400011)(451199024)(186009)(36840700001)(46966006)(40470700004)(2906002)(31686004)(5660300002)(44832011)(70586007)(70206006)(54906003)(478600001)(6916009)(2616005)(53546011)(26005)(8936002)(41300700001)(316002)(4326008)(8676002)(426003)(83380400001)(81166007)(47076005)(356005)(82740400003)(36756003)(40460700003)(86362001)(31696002)(336012)(36860700001)(16576012)(40480700001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 15:27:45.9554
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f37165aa-b70e-47f1-f301-08dbbea52287
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5098

On 9/26/23 04:07, Roger Pau Monné wrote:
> On Mon, Sep 25, 2023 at 05:49:00PM -0400, Stewart Hildebrand wrote:
>> On 9/22/23 04:44, Roger Pau Monné wrote:
>>> On Tue, Aug 29, 2023 at 11:19:47PM +0000, Volodymyr Babchuk wrote:
>>>> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>>>
>>>> Skip mapping the BAR if it is not in a valid range.
>>>>
>>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>>> ---
>>>>  xen/drivers/vpci/header.c | 9 +++++++++
>>>>  1 file changed, 9 insertions(+)
>>>>
>>>> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
>>>> index 1d243eeaf9..dbabdcbed2 100644
>>>> --- a/xen/drivers/vpci/header.c
>>>> +++ b/xen/drivers/vpci/header.c
>>>> @@ -345,6 +345,15 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>>>>               bar->enabled == !!(cmd & PCI_COMMAND_MEMORY) )
>>>>              continue;
>>>>
>>>> +#ifdef CONFIG_ARM
>>>> +        if ( !is_hardware_domain(pdev->domain) )
>>>> +        {
>>>> +            if ( (start_guest < PFN_DOWN(GUEST_VPCI_MEM_ADDR)) ||
>>>> +                 (end_guest >= PFN_DOWN(GUEST_VPCI_MEM_ADDR + GUEST_VPCI_MEM_SIZE)) )
>>>> +                continue;
>>>> +        }
>>>> +#endif
>>>
>>> Hm, I think this should be in a hook similar to pci_check_bar() that
>>> can be implemented per-arch.
>>>
>>> IIRC at least on x86 we allow the guest to place the BARs whenever it
>>> wants, would such placement cause issues to the hypervisor on Arm?
>>
>> Hm. I wrote this patch in a hurry to make v9 of this series work on ARM. In my haste I also forgot about the prefetchable range starting at GUEST_VPCI_PREFETCH_MEM_ADDR, but that won't matter as we can probably throw this patch out.
>>
>> Now that I've had some more time to investigate, I believe the check in this patch is more or less redundant to the existing check in map_range() added in baa6ea700386 ("vpci: add permission checks to map_range()").
>>
>> The issue is that during initialization bar->guest_addr is zeroed, and this initial value of bar->guest_addr will fail the permissions check in map_range() and crash the domain. When the guest writes a new valid BAR, the old invalid address remains in the rangeset to be mapped. If we simply remove the old invalid BAR from the rangeset, that seems to fix the issue. So something like this:
> 
> It does seem to me we are missing a proper cleanup of the rangeset
> contents in some paths then.  In the above paragraph you mention "the
> old invalid address remains in the rangeset to be mapped", how does it
> get in there in the first place, and why is the rangeset not emptied
> if the mapping failed?

Back in ("vpci/header: handle p2m range sets per BAR") I added a v->domain == pdev->domain check near the top of vpci_process_pending() as you appropriately suggested.

+    if ( v->domain != pdev->domain )
+    {
+        read_unlock(&v->domain->pci_lock);
+        return false;
+    }

I have also reverted this patch ("xen/arm: vpci: check guest range").

The sequence of events leading to the old value remaining in the rangeset are:

# xl pci-assignable-add 01:00.0
drivers/vpci/vpci.c:vpci_deassign_device()
    deassign 0000:01:00.0 from d0
# grep pci domu.cfg
pci = [ "01:00.0" ]
# xl create domu.cfg
drivers/vpci/vpci.c:vpci_deassign_device()
    deassign 0000:01:00.0 from d[IO]
drivers/vpci/vpci.c:vpci_assign_device()
    assign 0000:01:00.0 to d1
    bar->guest_addr is initialized to zero because of the line: pdev->vpci = xzalloc(struct vpci);
drivers/vpci/header.c:init_bars()
drivers/vpci/header.c:modify_bars()
    BAR0: start 0xe0000, end 0xe000f, start_guest 0x0, end_guest 0xf
    The range { 0-f } is added to the BAR0 rangeset for d1
drivers/vpci/header.c:defer_map()
    raise_softirq(SCHEDULE_SOFTIRQ);
drivers/vpci/header.c:vpci_process_pending()
    vpci_process_pending() returns because v->domain != pdev->domain (i.e. d0 != d1)
    BAR0 rangeset still contains { 0-f }
xl create finishes

Then during domU boot, guest initializes BAR0:

drivers/vpci/header.c:guest_bar_write()
    bar->guest_addr = 0x23000000
drivers/vpci/header.c:modify_bars()
    BAR0: start 0xe0000, end 0xe000f, start_guest 0x23000, end_guest 0x2300f
    The d1 BAR0 rangeset now contains both { 0-f } and { 23000-2300f }
drivers/vpci/header.c:defer_map()
    raise_softirq(SCHEDULE_SOFTIRQ);
drivers/vpci/header.c:vpci_process_pending()
    rangeset_consume_ranges(bar->mem, map_range, &data);
drivers/vpci/header.c:map_range()
    The range { 0-f } fails the permissions check and we crash the domU (back in vpci_process_pending)

