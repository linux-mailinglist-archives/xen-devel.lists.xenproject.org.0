Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 229BA85A3C2
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 13:48:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682834.1062020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc33s-0000sF-A0; Mon, 19 Feb 2024 12:47:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682834.1062020; Mon, 19 Feb 2024 12:47:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc33s-0000pp-6W; Mon, 19 Feb 2024 12:47:56 +0000
Received: by outflank-mailman (input) for mailman id 682834;
 Mon, 19 Feb 2024 12:47:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GzZz=J4=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rc33q-0000pR-5u
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 12:47:54 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:200a::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17cec957-cf25-11ee-8a52-1f161083a0e0;
 Mon, 19 Feb 2024 13:47:52 +0100 (CET)
Received: from MN2PR01CA0040.prod.exchangelabs.com (2603:10b6:208:23f::9) by
 DS7PR12MB8370.namprd12.prod.outlook.com (2603:10b6:8:eb::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7316.15; Mon, 19 Feb 2024 12:47:47 +0000
Received: from BL6PEPF0001AB71.namprd02.prod.outlook.com
 (2603:10b6:208:23f:cafe::58) by MN2PR01CA0040.outlook.office365.com
 (2603:10b6:208:23f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39 via Frontend
 Transport; Mon, 19 Feb 2024 12:47:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB71.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 19 Feb 2024 12:47:47 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 19 Feb
 2024 06:47:47 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 19 Feb
 2024 04:47:46 -0800
Received: from [172.30.63.250] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 19 Feb 2024 06:47:45 -0600
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
X-Inumbo-ID: 17cec957-cf25-11ee-8a52-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fMuR+2AZnfmgzS3BtBU3TOimf4Jxfb/Tpa9gJPXqjoizct+h0r0neAgMdYjCFYIApsbWEiNUnwjxAoRFLYhkhHz91cayQa9gswln0JtTsz9UP2p9sOLJU7NlRB2Us7Pw2Grwq6iHgwb5N6YAAxWK3w0oOlFMHnwoCjiT136jGqfPIQjdcz90voy5Yrgb0mWoWyFn0WZDCMpV4r58rp0PWBDu2OWRt48AxiuZdwJ/+1r+Cj6oft9uSgqqoqoKQqrJjunILur+RlUnrI6UkFHP7/t+3wCQj8uW2KX8Zo0qA24sDz6FX7nRr8ODzY5yv6HPwapjAH/LMwPTUv1v4hAfcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ACzMdtvp0ucmPu0SShkobBEMb/WPAruvaj5zOLYY+5c=;
 b=PqNmYwIy54Me/6RLBbBPZM9GBr8cuRHDYILJ7uIug50878y1NF/Ktmc8Tv+gXI2uyd5ht5r+cx30EsvBOoUgb6KT8LU5fXQxdDO4p/lti46h/YKJOJffnsMpdT1t9NaXkwj50UFnlyIZfEEiD6EYze7WrOSrnS8C8tqkyWde2UCrNZl4wQU7qNoxLlRJ95U0n8Q2gkbXnuSHNLnc/o4Z+GCya2/zmKkxUHys6G53sq469SXVkySKWSJV3hUb9jlQcnR2c6lJX0HHtopdEnGUllF69/FTzeLEXU4rxVD8TY6RF/G8OkCH60q+cOOhmNNVvVb41f8zWWghcJYsdSz/8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ACzMdtvp0ucmPu0SShkobBEMb/WPAruvaj5zOLYY+5c=;
 b=LwuIgmp4isZANVPeF371lHI7aba+gInHxYWOrO5x7tAN+xiMFtBtf4mdSLeLVQ9y2jhu466iZahZ/HSLO4DrKSKu8tHbJQgu8iZTwDnjBx/iYmpsxrEBMspK/JttufgH8czOSW/eKk3Us9MRVM2nMQXh3DKascvivpBLcO3MGgA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <68bb972c-5e45-4706-a06f-0dcd65c40581@amd.com>
Date: Mon, 19 Feb 2024 07:47:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13.2 01/14] vpci: use per-domain PCI lock to protect vpci
 structure
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Paul Durrant <paul@xen.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, <xen-devel@lists.xenproject.org>
References: <20240202213321.1920347-1-stewart.hildebrand@amd.com>
 <20240202213321.1920347-2-stewart.hildebrand@amd.com>
 <20240219114750.151730-1-stewart.hildebrand@amd.com>
 <8e807612-fd14-4d01-b200-1deb583afa22@suse.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <8e807612-fd14-4d01-b200-1deb583afa22@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB71:EE_|DS7PR12MB8370:EE_
X-MS-Office365-Filtering-Correlation-Id: b1b53d80-d5af-46ab-c067-08dc3148f9af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M7/nejeTeKolgFRBZOOYZ1HkVG36fEvQ74JyaW33GYCS/s8v4kH265hbHLsUk847EMwVyX9+A1ZS432qwfNsqZPswKnY9h6X2pvUvzop4Ug3qNLf8/+j03hDYPKg9qZ+g5x90iseXDYLLNb4hdbTN7nb5wvvNOtR3qzZ+sdlRDEr4afbXguvydIt4o1/aBejaSkCMN4iH8pZnwKkwbXA81TPJV7xSMQ141zPTaGYjyMVGcDW2AbcyrsSTmwbNiB1/7Bq9i4OkxRnYF1dhJFjtlphQr0CKtb3w117kKAt3y73m6zm8xfnlbJCL88G3wQuCSMgcW3ux8xwBwYnHANRasXuWiT2CQQoVmJLKPfXsOW+tzJ0J/vqBcwwmPVW046xRqgXn0wBDlzrJ4eH7uR8CCc1fmljmjTySoPi19iK2g1Dgd8Zr/Azb+2T+Xr0LsHbBvbzG/+IL5YJkEpzV0Ot+3ejNitCHqriLIbpspI2nDdsKGKydw8JHcz4yL5Ft0O8Zy7IPpT9NWS0V+Qte6hCLWx3Cx+91M6aso//+Xrz9vooGNSuMM7DJTCIXfezEy/kl2uwSoU3Np+LXxBCbqmuxsn1G4hZ8AXwYelHbz1+X8hphy12j/rHF9wU2iPNZfiIxEXSG5dWm6bsL5uowUfkJg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(46966006)(40470700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 12:47:47.5281
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1b53d80-d5af-46ab-c067-08dc3148f9af
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB71.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8370

On 2/19/24 07:10, Jan Beulich wrote:
> On 19.02.2024 12:47, Stewart Hildebrand wrote:
>> @@ -895,6 +891,15 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
>>  {
>>      unsigned int i;
>>  
>> +    /*
>> +     * Assert that d->pdev_list doesn't change. ASSERT_PDEV_LIST_IS_READ_LOCKED
>> +     * is not suitable here because it may allow either pcidevs_lock() or
>> +     * d->pci_lock to be held, but here we rely on d->pci_lock being held, not
>> +     * pcidevs_lock().
>> +     */
>> +    ASSERT(rw_is_locked(&msix->pdev->domain->pci_lock));
>> +    ASSERT(spin_is_locked(&msix->pdev->vpci->lock));
> 
> There's no "d" in sight here, so it's a little odd that "d" is being talked
> about. But I guess people can infer what's meant without too much trouble.

I can s/d->pci_lock/msix->pdev->domain->pci_lock/ for the next rev.

> 
>> @@ -313,17 +316,36 @@ void vpci_dump_msi(void)
>>                  {
>>                      /*
>>                       * On error vpci_msix_arch_print will always return without
>> -                     * holding the lock.
>> +                     * holding the locks.
>>                       */
>>                      printk("unable to print all MSI-X entries: %d\n", rc);
>> -                    process_pending_softirqs();
>> -                    continue;
>> +                    goto pdev_done;
>>                  }
>>              }
>>  
>> +            /*
>> +             * Unlock locks to process pending softirqs. This is
>> +             * potentially unsafe, as d->pdev_list can be changed in
>> +             * meantime.
>> +             */
>>              spin_unlock(&pdev->vpci->lock);
>> +            read_unlock(&d->pci_lock);
>> +        pdev_done:
>>              process_pending_softirqs();
>> +            if ( !read_trylock(&d->pci_lock) )
>> +            {
>> +                printk("unable to access other devices for the domain\n");
>> +                goto domain_done;
>> +            }
>>          }
>> +        read_unlock(&d->pci_lock);
>> +    domain_done:
>> +        /*
>> +         * We need this label at the end of the loop, but some
>> +         * compilers might not be happy about label at the end of the
>> +         * compound statement so we adding an empty statement here.
>> +         */
>> +        ;
> 
> As to "some compilers": Are there any which accept a label not followed
> by a statement? Depending on the answer, this comment may be viewed as
> superfluous. Or else I'd ask about wording: Besides a grammar issue I
> also don't view it as appropriate that a comment talks about "adding"
> something when its adjacent code that is meant. That something is there
> when the comment is there, hence respective wording should imo be used.

It seems like hit or miss whether gcc would accept it or not (prior
discussion at [1]). I agree the comment is rather lengthy for what it's
trying to convey. I'd be happy to either remove the comment or reduce
it to:

    domain_done:
        ; /* Empty statement to make some compilers happy */

[1] https://lore.kernel.org/xen-devel/98b8c131-b0b9-f46c-5f46-c2136f2e3b4e@amd.com/

> 
>> --- a/xen/include/xen/pci.h
>> +++ b/xen/include/xen/pci.h
>> @@ -171,6 +171,19 @@ void pcidevs_lock(void);
>>  void pcidevs_unlock(void);
>>  bool __must_check pcidevs_locked(void);
>>  
>> +#ifndef NDEBUG
>> +/*
>> + * Check to ensure there will be no changes to the entries in d->pdev_list (but
>> + * not the contents of each entry).
>> + * This check is not suitable for protecting other state or critical regions.
>> + */
>> +#define ASSERT_PDEV_LIST_IS_READ_LOCKED(d)                               \
>> +        /* NB: d may be evaluated multiple times, or not at all */       \
>> +        ASSERT(pcidevs_locked() || ((d) && rw_is_locked(&(d)->pci_lock)))
> 
> Is there actually any case where d can be NULL here?

Yes, when called from ns16550 driver, if the driver failed to make the
device RO.

> 
>> +#else
>> +#define ASSERT_PDEV_LIST_IS_READ_LOCKED(d) ({ (void)(d); })
> 
> Evaluating d here isn't very useful when the assertion expression doesn't
> guarantee single evaluation. Plus even if it needed evaluating, there would
> be no need to use a compiler extension here:
> 
> #define ASSERT_PDEV_LIST_IS_READ_LOCKED(d) ((void)(d))

OK, I can make this change.

