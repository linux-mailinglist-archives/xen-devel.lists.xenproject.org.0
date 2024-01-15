Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D303682DC87
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 16:42:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667482.1038794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPP6e-0000Xs-Ui; Mon, 15 Jan 2024 15:42:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667482.1038794; Mon, 15 Jan 2024 15:42:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPP6e-0000UR-QZ; Mon, 15 Jan 2024 15:42:32 +0000
Received: by outflank-mailman (input) for mailman id 667482;
 Mon, 15 Jan 2024 15:42:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ghqi=IZ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rPP6d-0000TC-VT
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 15:42:32 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20621.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afbefa0a-b3bc-11ee-9b0f-b553b5be7939;
 Mon, 15 Jan 2024 16:42:29 +0100 (CET)
Received: from MN2PR04CA0006.namprd04.prod.outlook.com (2603:10b6:208:d4::19)
 by CY8PR12MB7196.namprd12.prod.outlook.com (2603:10b6:930:58::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Mon, 15 Jan
 2024 15:42:25 +0000
Received: from MN1PEPF0000F0E4.namprd04.prod.outlook.com
 (2603:10b6:208:d4:cafe::7e) by MN2PR04CA0006.outlook.office365.com
 (2603:10b6:208:d4::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23 via Frontend
 Transport; Mon, 15 Jan 2024 15:42:24 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0E4.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Mon, 15 Jan 2024 15:42:24 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 15 Jan
 2024 09:42:24 -0600
Received: from [172.23.114.18] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 15 Jan 2024 09:42:22 -0600
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
X-Inumbo-ID: afbefa0a-b3bc-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CWGKTIVKeOxsWiJTb18zYT0WOCdc5U3wgjEoGNFaL5VEnvf8pEb3MWsWKzYpw69z0xNrJ4ZVOzSze51Abw3kklkbmpNrvsxaFJlcP6sKdUt0vI2ecyfWCUG8oRBqrnVPNkFeRvuV2Ms2PQjFyR/itChzoabwVspk2zBFibUb+sBySChKdEevElhGjpdZ5pveBJMyPAj/gWPsYl601QAttFst7rGRqPs3gvegrXAhjOkd5+c/9atQ9uJWXa6RQbURblCWklsVN2/AW3ozndl6Uxs71AEMSGznxJwHIpG14qrs3zfsEpIWhT0tUBh6DriIt/BTVXHZI0QNA1Qkvg59mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8LyQ3kFZs9jUVPfPzYWAGrMiG0wFz6CBulE1PQ/kcE=;
 b=KJwPHYtH1Ef8Tom54z2UQBgfnN759fXIpmTkYy7xuNpGLZ+CcAt2ZjAx38Is6qB6yeTowUjQbkNpktOskEsm+Qyx6chDj5vt1ZW9DztkBTNH1X/SA6VSztqk+JlZPZq3OnfisZA+r3oqJx+dl1jOmTRSpxHfN3CFYv82tZ4CHzM5czk+7PazR0Ybzr3QZcZU7WzeRJkHWZj1++MqtVMtw82+sR0RLVVk6+EsrIpWED02RXpBi0W6jdsAw/sbfbt0chemAjIIbCmBqcwomC2NkrCCnpzTFf2oaYZNTLI6T9jMZAyj6tT8l7mqwKZk9xNWNVqm3/UYSyGkQ4p917kHoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X8LyQ3kFZs9jUVPfPzYWAGrMiG0wFz6CBulE1PQ/kcE=;
 b=seeQB8YtdXXdkHxUaKgl8CakDR6vjE+fUlGUH5bygc3JsID+SU5T9MVt13nD2cGH/BB1s0SYL+UPDsORYqLXDZzUL+ayL9yaUkSO8/p6mqrOf6g0Ye/AkbbZmmUevnfl2QbElojAnpYk8rTprVe16JLG1fGhUgX1Bm/6PAY8kZw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <ad4b7b5b-8abb-4693-9f7e-ef94bcb0d3a4@amd.com>
Date: Mon, 15 Jan 2024 10:42:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12.1 01/15] vpci: use per-domain PCI lock to protect vpci
 structure
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Paul Durrant <paul@xen.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, <xen-devel@lists.xenproject.org>
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
 <20240109215145.430207-2-stewart.hildebrand@amd.com>
 <ZaFDS7uZgW5l0eHG@macbook> <590a157a-b9d4-4d2d-8aff-6584da3045c3@amd.com>
 <20240112181442.674031-1-stewart.hildebrand@amd.com>
 <34b4cbf1-989d-43a0-aaea-717f06a79960@suse.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <34b4cbf1-989d-43a0-aaea-717f06a79960@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E4:EE_|CY8PR12MB7196:EE_
X-MS-Office365-Filtering-Correlation-Id: 42303067-9fb2-4838-0eee-08dc15e09201
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9DW+XHcZEZmKoPzO0j3hLhccyTPptkbC3tK+OaFSyFFwKdNNNpd3ic2hL+t3xZ0uR2oAensuxolUkKWWGKBVpOuDc2QmZ8X80qbZXdSDUrystzbSVRC8fRRP6d6LOInTdLOqCBASGONf2dno2Pmuf2jX6HAQxuzykGkvNNxm5uv2YT+M9M4shsqf+spShb0x3ecVZqXsXoFLUL5Iko80anZ9weebXOx4USD9R/C7/jfF0zb5G2zjItHiIfeF4QBjcGT3Be0JK8hW/I7AVk0OyJBspa4Mjq/JBDwi3Y01NHTPG/tXX+0gX51F+9dgH76sj8TnMiWqX4x3Mp2gt6x9xX3+K6dHOHJMJTUhBleSya3yLjWAMA6WRweWhOd4tGB7YqHXtGvUYCNg0zX5KWe8CGYNSXrNIAqWeib9MK/xoTWL4cEAEpPHyJywfl2/3RJ9wCF69f0ieAnMir8kCNE1bGplnRhdqr6jGNlTRQzaH2uGg10vkWdgS62ON8GnpSZsb/TjBx6KJ81I2nVo2Dq2MnmO8Xr+Yui4LDl/eo3HvwG9F2X32yeVDOSzGNSWsgyHtHfhgJEWOmFU1aRWvIF4H+0rPeRI/GoUDAS++VjtlIoZTYkSohBAUYsHxzJrOAK9PP1nXuWrJXtaUb++9nT0RNV89fYUxXnUpzOeIgpwmrljdXx3jqpvip8iMVFgfVH52ontiSnCW8n/gLfiD+7i8p2uxqoymg7VYNr/4n1XjCBHYPG6Wy92xUC1iD0haLcSNlDx01UR1nC1f1q5NN9zSlo5xtTwutd8Joo/ewWVhWiPxCjPhG87/5kh8WSQMIZS
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(346002)(39860400002)(376002)(230922051799003)(82310400011)(64100799003)(1800799012)(451199024)(186009)(46966006)(40470700004)(36840700001)(40480700001)(31686004)(40460700003)(66899024)(83380400001)(70586007)(81166007)(31696002)(86362001)(36756003)(356005)(70206006)(41300700001)(47076005)(36860700001)(5660300002)(82740400003)(426003)(54906003)(336012)(26005)(2616005)(478600001)(8936002)(316002)(16576012)(53546011)(44832011)(110136005)(2906002)(8676002)(4326008)(7416002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 15:42:24.5699
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42303067-9fb2-4838-0eee-08dc15e09201
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7196

On 1/15/24 03:58, Jan Beulich wrote:
> On 12.01.2024 19:14, Stewart Hildebrand wrote:
>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>
>> Use the per-domain PCI read/write lock to protect the presence of the
>> pci device vpci field. This lock can be used (and in a few cases is used
>> right away) so that vpci removal can be performed while holding the lock
>> in write mode. Previously such removal could race with vpci_read for
>> example.
>>
>> When taking both d->pci_lock and pdev->vpci->lock, they should be
>> taken in this exact order: d->pci_lock then pdev->vpci->lock to avoid
>> possible deadlock situations.
>>
>> 1. Per-domain's pci_lock is used to protect pdev->vpci structure
>> from being removed.
>>
>> 2. Writing the command register and ROM BAR register may trigger
>> modify_bars to run, which in turn may access multiple pdevs while
>> checking for the existing BAR's overlap. The overlapping check, if
>> done under the read lock, requires vpci->lock to be acquired on both
>> devices being compared, which may produce a deadlock. It is not
>> possible to upgrade read lock to write lock in such a case. So, in
>> order to prevent the deadlock, use d->pci_lock in write mode instead.
>>
>> All other code, which doesn't lead to pdev->vpci destruction and does
>> not access multiple pdevs at the same time, can still use a
>> combination of the read lock and pdev->vpci->lock.
>>
>> 3. Drop const qualifier where the new rwlock is used and this is
>> appropriate.
>>
>> 4. Do not call process_pending_softirqs with any locks held. For that
>> unlock prior the call and re-acquire the locks after. After
>> re-acquiring the lock there is no need to check if pdev->vpci exists:
>>  - in apply_map because of the context it is called (no race condition
>>    possible)
>>  - for MSI/MSI-X debug code because it is called at the end of
>>    pdev->vpci access and no further access to pdev->vpci is made
>>
>> 5. Use d->pci_lock around for_each_pdev and pci_get_pdev_by_domain
>> while accessing pdevs in vpci code.
>>
>> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> While I know Roger did offer the tag with certain adjustments, ...
> 
>> @@ -913,7 +911,12 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
>>              struct pci_dev *pdev = msix->pdev;
>>  
>>              spin_unlock(&msix->pdev->vpci->lock);
>> +            read_unlock(&pdev->domain->pci_lock);
>>              process_pending_softirqs();
>> +
>> +            if ( !read_trylock(&pdev->domain->pci_lock) )
>> +                return -EBUSY;
>> +
>>              /* NB: we assume that pdev cannot go away for an alive domain. */
>>              if ( !pdev->vpci || !spin_trylock(&pdev->vpci->lock) )
>>                  return -EBUSY;
> 
> ... I'm sure he was assuming you would get this right, in also
> dropping the 1st-try-acquired lock when this 2nd try-lock fails.

Thanks for catching this, and I appreciate the suggestion. I'll make sure both locks are dropped if needed on all error paths in vpci_msix_arch_print(), and adjust vpci_dump_msi() accordingly.

> Personally I feel this is the kind of change one would better not
> offer (or take) R-b ahead of time.

I'll drop Roger's R-b for v12.2.

> 
> I further think the respective comment in vpci_dump_msi() also wants
> adjusting from singular to plural.

I'll fix for v12.2, thanks for suggesting this.

