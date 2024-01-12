Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 574BF82C120
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 14:51:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666892.1037826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOHvv-0001LJ-ME; Fri, 12 Jan 2024 13:50:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666892.1037826; Fri, 12 Jan 2024 13:50:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOHvv-0001I5-It; Fri, 12 Jan 2024 13:50:51 +0000
Received: by outflank-mailman (input) for mailman id 666892;
 Fri, 12 Jan 2024 13:50:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vfvq=IW=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rOHvu-0001Hz-3n
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 13:50:50 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95c79a8a-b151-11ee-9b0f-b553b5be7939;
 Fri, 12 Jan 2024 14:50:47 +0100 (CET)
Received: from DM6PR06CA0089.namprd06.prod.outlook.com (2603:10b6:5:336::22)
 by IA0PR12MB7700.namprd12.prod.outlook.com (2603:10b6:208:430::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Fri, 12 Jan
 2024 13:50:43 +0000
Received: from CO1PEPF000042AD.namprd03.prod.outlook.com
 (2603:10b6:5:336:cafe::f2) by DM6PR06CA0089.outlook.office365.com
 (2603:10b6:5:336::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21 via Frontend
 Transport; Fri, 12 Jan 2024 13:50:42 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AD.mail.protection.outlook.com (10.167.243.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Fri, 12 Jan 2024 13:50:42 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 12 Jan
 2024 07:50:41 -0600
Received: from [172.23.76.218] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Fri, 12 Jan 2024 07:50:40 -0600
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
X-Inumbo-ID: 95c79a8a-b151-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HSlIpMIsKL5cpOr+lbMSwoY4hd5td8fIdvVAqHCGRLPXvsd+M/4lFsRaVMcyOTYq2VIwAN5LsvyPIbhdJSYtQ7mwUOMT+UHnI978GmwJsn8x9RLFhBPkoDST3PzkAzcDq+JLmfmjxcj3RFER5uyMX7OvusvIkCIhrVxZncbZx6PSs3MEJ2249twgCQ459fv05zKGF/JG6rOu8vSHiDJ8P5cfjMJzxwxCUvnQ38rvSqfZE90RsxaLtUkjgRYCs2Z4WevNyRrsBga/hyxCwZ344LNZatIOUmZ+YGM/alAY0eLrUylhORY+ywt7WAHrBJOo/wZCkwHbN25yxIkjJGNoPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gN6DhG3pJAvtFPFPedn4aa2WTMysDp5MNUjyuuO+5fI=;
 b=Ds84SYhvBHRjT/78b5zXbW/irbzcrbM67S+z3Daq/qK7VjYRKEx/y56iBu4fcRJsWfSkZ8XYXMvMloS7ZT1hMOqR8tMhZ3U8xbUe4fvwbBGLzDzZudbAI7ofhpV/io80MTRNyJYEdcqRTNcJjdYIbnCF3uRlaL4yxBvAekw+wdy8fofHQNzQ30d+RYlLafASMGUnlloU4ayGCSDv563rl/U3suVR5DrfHzOv4fJBIQ7BWRtSw/CiwHp/GnaBo72+CuSd19SgTgle3C5jpTPLkp9BR7g5CZxtbKyy+x4Kt3HwiZwQx1jEhIQN1ac7HwemWPOZOrrIN98vPHFZsktjYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=cloud.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gN6DhG3pJAvtFPFPedn4aa2WTMysDp5MNUjyuuO+5fI=;
 b=kX8s9sMHPgAtvXJhG40WebRiqmG5+Dtp6qMTBKf4EvJ3BsDl4GdStakCcrNiHBVRdLBfgNxRf34Si4R2qt3O0oDLroybmmMpbzVpGOd5d1ax9gj1UGZvb/9qfr27WUmiYRCebZFLTM83TqPt6Pe9k5i5vPT0i4SO4yIU+XhpHOU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <39c114b7-2384-4209-bae5-edabb243226e@amd.com>
Date: Fri, 12 Jan 2024 08:50:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 11/15] vpci: add initial support for virtual PCI bus
 topology
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
CC: <xen-devel@lists.xenproject.org>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
 <20240109215145.430207-12-stewart.hildebrand@amd.com>
 <CA+zSX=Z33cixDd1w10zwC-c80z-sB4E8Nu__nTNi30n-FW6GwA@mail.gmail.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <CA+zSX=Z33cixDd1w10zwC-c80z-sB4E8Nu__nTNi30n-FW6GwA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AD:EE_|IA0PR12MB7700:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b57d654-5328-4275-72ef-08dc13757814
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pWh20Ja52tPJ8EXKY/TMtWm+ph+V5u13mJBVIly8aHaUaW3c0x81GzYcdfdas6HooHvi9qk5ZHFXWxfP6Kwsev9wm6JURtSOBujCpD6WG0jITshORYiHBlgfkT1HuKdNcrqiw01PF76xdjEM4tngVvXK4gzNe+pP9cC3/pen//JhMHnD+1OyqHjS+qQ+UzJyQ1xXf+8jSN21KL7mvvA2HaEVDuCYjC2J5QjKwys1om59Dfco1+V/cEgG/7dj6NfMtwQeG9z93LphPd88A9OoJgAtDyJhSraNtf3rE9zLtRbwAXxg8gQhbDnIPN7AkysMlzBSZDnZp9onIb+6cN/T0ZgNySyUbgIWdfki+cFQ8VJmvu6/vQmyTbh8Q2JOB50DSbZN/hXs/SFmsKdVTI+nUCY4gRRTtPo3hKhlJiVVYiOaQEkIdXgAk4DmGN+GauWFGRVsiAIezjSh6BkfA3tZnISmivXYd48OyNZAIxCUtILf9rqZa866w5XpT5j1PZ/PA0SR5A8J7LWY5vBL7b4JofX8fB65mudNtIpMHno1UTWTJNAUMWhx7baSVkPlD5X8dri0ZGsbGniV1260AkM8W6/b5AfB2WvvTLZodP5OGs3136gPr1Cuas1Zy7c3rjHE+EVJtgvsxMCiX6aWwB0XWusQGkNEfpr69Oq9Cien9h9xj/O9rUy4woNjMJOJY3mb6+Ez0skeL3PkTqAwHvHosUC+cifWJz7KcOl9klGrDksCqW+TNgwcuetJzi5zVDc5o3CXz3/DQoHZIY80QjCNmPctdIJnXNXpxA28F4uTLUg=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(396003)(39860400002)(136003)(230922051799003)(64100799003)(82310400011)(186009)(451199024)(1800799012)(40470700004)(36840700001)(46966006)(40480700001)(40460700003)(31686004)(83380400001)(356005)(86362001)(81166007)(41300700001)(70586007)(70206006)(36756003)(31696002)(47076005)(36860700001)(316002)(426003)(26005)(336012)(478600001)(53546011)(7416002)(2616005)(2906002)(82740400003)(5660300002)(6916009)(16576012)(8676002)(4326008)(8936002)(54906003)(44832011)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 13:50:42.4443
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b57d654-5328-4275-72ef-08dc13757814
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7700

On 1/12/24 06:46, George Dunlap wrote:
> On Tue, Jan 9, 2024 at 9:54 PM Stewart Hildebrand
> <stewart.hildebrand@amd.com> wrote:
>> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
>> index 37f5922f3206..b58a822847be 100644
>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -484,6 +484,14 @@ struct domain
>>       * 2. pdev->vpci->lock
>>       */
>>      rwlock_t pci_lock;
>> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
>> +    /*
>> +     * The bitmap which shows which device numbers are already used by the
>> +     * virtual PCI bus topology and is used to assign a unique SBDF to the
>> +     * next passed through virtual PCI device.
>> +     */
>> +    DECLARE_BITMAP(vpci_dev_assigned_map, VPCI_MAX_VIRT_DEV);
>> +#endif
>>  #endif
> 
> Without digging through the whole series, how big do we expect this
> bitmap to be on typical systems?
> 
> If it's only going to be a handful of bytes, keeping it around for all
> guests would be OK; but it's large, it would be better as a pointer,
> since it's unused on the vast majority of guests.

Since the bitmap is an unsigned long type it will typically be 8 bytes, although only 4 bytes are actually used. VPCI_MAX_VIRT_DEV is currently fixed at 32, as we are only tracking D (not the whole SBDF) in the bitmap so far.

