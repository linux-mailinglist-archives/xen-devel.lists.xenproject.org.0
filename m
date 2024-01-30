Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CE0842786
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 16:05:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673541.1047914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUpfh-0003ii-Sj; Tue, 30 Jan 2024 15:05:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673541.1047914; Tue, 30 Jan 2024 15:05:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUpfh-0003g1-Ow; Tue, 30 Jan 2024 15:05:09 +0000
Received: by outflank-mailman (input) for mailman id 673541;
 Tue, 30 Jan 2024 15:05:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cYm+=JI=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rUpfg-0003fN-1t
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 15:05:08 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2417::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2f5a384-bf80-11ee-98f5-efadbce2ee36;
 Tue, 30 Jan 2024 16:05:06 +0100 (CET)
Received: from BN9PR03CA0524.namprd03.prod.outlook.com (2603:10b6:408:131::19)
 by SJ2PR12MB9116.namprd12.prod.outlook.com (2603:10b6:a03:557::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Tue, 30 Jan
 2024 15:05:02 +0000
Received: from BN3PEPF0000B078.namprd04.prod.outlook.com
 (2603:10b6:408:131:cafe::f6) by BN9PR03CA0524.outlook.office365.com
 (2603:10b6:408:131::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34 via Frontend
 Transport; Tue, 30 Jan 2024 15:05:02 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B078.mail.protection.outlook.com (10.167.243.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Tue, 30 Jan 2024 15:05:01 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 30 Jan
 2024 09:04:59 -0600
Received: from [172.23.114.18] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 30 Jan 2024 09:04:58 -0600
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
X-Inumbo-ID: f2f5a384-bf80-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ew6UIdRM6DpUbVH1lZGJMzlFZv5pm6GR+T6jqDPfN3CEaWq0wvCYKZDnyut0o8Q9hAviUOCWCN3Mj8CJomCg8t3LRrVHx283JjC39jx8m/B0avemifuzayEETApp6Qb2ULQYil0ZO2d2lBwAI0z24+hZRPRJkYF6TnzjHXB/FvlUsA3z67RAtBm7i4qlV9+d6GTaxyhV13S/yz83S5MLfma3hPQ3Hh8T8bbHuWmniNiDEBQQsB5CKy7/rooCIL/rUgqz/QZL5KndbvU6QOnO5z92ZSA8R4VgrjOzu5xieqTywtQLCDeBHGuW+haiZZ2K8K27Ke7g1XVx3kA62o115w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQTpddNwzURPcDGIxeQ2sWtSlB7qpOv0tLPkRvkcjL4=;
 b=MLQ1qJ+dAwkwvoykw0qWeZnzWrN4Ol5AK1PZ478AyhsYnBSn3PwA5Y/x9T77bV7w1FcSq5iwo99brAkSInodEfH0o3C0u6rC54o7wRTMHHW6KUnAxPz26T0TgE+4PnFK1TH2718lLJ/3dm6UuN26kGL9u9E7bJoJMtLZ/NSG0ZlpYbr/sUJiKtg3VSFsJDUZBHel4WTzEqEy7jCKQWTF/IbkWxk7zFuAw9JBXRKaZSPJMLu6POU+QkB8yyX9UDi8Z/WdtqNaLCMIM0FWVpiWAosN4XphctEvjRb4YwR4xnFO0/sgGBFLHiyDI6kB/3c5WLRBqgGxHrmONNC6gEiM7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQTpddNwzURPcDGIxeQ2sWtSlB7qpOv0tLPkRvkcjL4=;
 b=mgf5tgqT3nYrJwIrWkFNthpL8ul1tJwwMV38FO0jWIxpYe4974iIMaHEMtk8+MP1OKlx+VGfRa98aY5MV1jmowAX+q3/VVjoq75ImLjT/weSi3kw60RDFckFWqKGYnxBn2rSzfVxrM5sOYEB2pCJVXzcMfLCF/e2FQb71QCISEU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <2ac68097-a497-46fb-8d77-1b6a5ef78a77@amd.com>
Date: Tue, 30 Jan 2024 10:04:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12.2 01/15] vpci: use per-domain PCI lock to protect vpci
 structure
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Paul Durrant <paul@xen.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, <xen-devel@lists.xenproject.org>
References: <20240115194309.45683-1-stewart.hildebrand@amd.com>
 <715e40c9-1776-4677-9565-dac1565a2aa8@suse.com> <Za_WGzS14Eqt8yZF@macbook>
 <ae7a57f2-2433-4b75-ab45-c8be55d489c9@suse.com> <ZbDXXyucJhLJ4u9H@macbook>
 <a3233487-965b-49ae-bebe-e5476fcda29c@suse.com> <ZbFOE6kV7NXFrNjb@macbook>
 <fa7df700-06f1-4110-bc76-c59d59e5d887@suse.com> <ZbIkVcYkcuT2iF8e@macbook>
 <247df339-e631-4c50-85e4-b6a486235564@suse.com> <ZbJU_PuYo9EEzyac@macbook>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <ZbJU_PuYo9EEzyac@macbook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B078:EE_|SJ2PR12MB9116:EE_
X-MS-Office365-Filtering-Correlation-Id: 15889b35-6b4e-459b-63a5-08dc21a4d57d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jYHx2uC9uXKkyA/YeqlaMlsGQ+y6cI8D8l7G3ERjQK1uRlUntg9XO+WYiy9luIlWjgaJCOcohYQjwMQwKuORqU8GVEdzMFvac2gDyETa75elzJ0ExWcIunv8cQ2TSxCUBxxE5PGx+mpCdi1subBapoUqcmcnUXAtWC9elEz3qBo7vYj1CyjWOw5IxDilA8KNqvI+nCCGE+XiNOCpjIRRKj9IEVzdNhybIRtNwxhg1zYu7Ekagb/e+KrEg+YV9FPwGrukSsrohBl2uYUyIVlRVDjqYcD99Gr5pnfNGXed2cYn3qcxswoXKVzujqwgSFtk+mG5hOBu2nMohUjPaiSI/smX6rR3nxseJvbFQsb0MBlJltr0XhrgpW0geb3Xb9vK1izxzBrpeNU8Nza6uN33sdLMUOIXGdhQvWQtZPRc4nx5PxHppa3Lq/eJdVD0EZp/hDcAzokMGvPYGd5Gw9gcpROMSHLOjVlPcN34gVV0MuLm8ZQWfE9rbbEbwNsyV58u/UrUo43tVbhYfk74Z5A3m8W9nAlR6HdoJyUnh6rr+mA7W38XpRKRe1iJe6M76LXUT3ZhqcW1sgK+0j5xEPdGyRv1Jw4QCNjf0TxzEy3c5Ekcl3HJQasXpwckt4DTApNzcuPDLE/p6CSL+fya7gX+LGxfCs49fthb3RNZuXY0YvEF1QFe+KHFpnO+Ba26QxzbVDQle/rYUrIO0If2fDb2/96gi+mo/4yIh68UTmyKZw27rk23qKFKYvg0MlkPWpNMwqFnaSajuxGN0Ei8u5eTPwMq4XqD4y9fMTTmPLHYCmY5fhtySHpqGO0iRESdQpZv
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(396003)(346002)(376002)(230922051799003)(451199024)(1800799012)(82310400011)(64100799003)(186009)(36840700001)(46966006)(40470700004)(70586007)(316002)(4326008)(8936002)(7416002)(8676002)(16576012)(110136005)(83380400001)(70206006)(36860700001)(31686004)(478600001)(86362001)(31696002)(5660300002)(2906002)(44832011)(54906003)(2616005)(53546011)(36756003)(81166007)(336012)(82740400003)(40460700003)(40480700001)(426003)(47076005)(356005)(26005)(41300700001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 15:05:01.9416
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15889b35-6b4e-459b-63a5-08dc21a4d57d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B078.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9116

On 1/25/24 07:33, Roger Pau Monné wrote:
> On Thu, Jan 25, 2024 at 12:23:05PM +0100, Jan Beulich wrote:
>> On 25.01.2024 10:05, Roger Pau Monné wrote:
>>> On Thu, Jan 25, 2024 at 08:43:05AM +0100, Jan Beulich wrote:
>>>> On 24.01.2024 18:51, Roger Pau Monné wrote:
>>>>> On Wed, Jan 24, 2024 at 12:34:10PM +0100, Jan Beulich wrote:
>>>>>> On 24.01.2024 10:24, Roger Pau Monné wrote:
>>>>>>> On Wed, Jan 24, 2024 at 09:48:35AM +0100, Jan Beulich wrote:
>>>>>>>> On 23.01.2024 16:07, Roger Pau Monné wrote:
>>>>>>>>> On Tue, Jan 23, 2024 at 03:32:12PM +0100, Jan Beulich wrote:
>>>>>>>>>> On 15.01.2024 20:43, Stewart Hildebrand wrote:
>>>>>>>>>>> @@ -2888,6 +2888,8 @@ int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
>>>>>>>>>>>  {
>>>>>>>>>>>      int irq, pirq, ret;
>>>>>>>>>>>  
>>>>>>>>>>> +    ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock));
>>>>>>>>>>
>>>>>>>>>> If either lock is sufficient to hold here, ...
>>>>>>>>>>
>>>>>>>>>>> --- a/xen/arch/x86/physdev.c
>>>>>>>>>>> +++ b/xen/arch/x86/physdev.c
>>>>>>>>>>> @@ -123,7 +123,9 @@ int physdev_map_pirq(domid_t domid, int type, int *index, int *pirq_p,
>>>>>>>>>>>  
>>>>>>>>>>>      case MAP_PIRQ_TYPE_MSI:
>>>>>>>>>>>      case MAP_PIRQ_TYPE_MULTI_MSI:
>>>>>>>>>>> +        pcidevs_lock();
>>>>>>>>>>>          ret = allocate_and_map_msi_pirq(d, *index, pirq_p, type, msi);
>>>>>>>>>>> +        pcidevs_unlock();
>>>>>>>>>>>          break;
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> IIRC (Stewart can further comment) this is done holding the pcidevs
>>>>>>>>> lock to keep the path unmodified, as there's no need to hold the
>>>>>>>>> per-domain rwlock.
>>>>>>>>
>>>>>>>> Yet why would we prefer to acquire a global lock when a per-domain one
>>>>>>>> suffices?
>>>>>>>
>>>>>>> I was hoping to introduce less changes, specially if they are not
>>>>>>> strictly required, as it's less risk.  I'm always quite worry of
>>>>>>> locking changes.
>>>>>>
>>>>>> In which case more description / code commenting is needed. The pattern
>>>>>> of the assertions looks dangerous.
>>>>>
>>>>> Is such dangerousness perception because you fear some of the pcidevs
>>>>> lock usage might be there not just for preventing the pdev from going
>>>>> away, but also to guarantee exclusive access to certain state?
>>>>
>>>> Indeed. In my view the main purpose of locks is to guard state. Their
>>>> use here to guard against devices here is imo rather an abuse; as
>>>> mentioned before this should instead be achieved e.g via refcounting.
>>>> And it's bad enough already that pcidevs_lock() alone has been abused
>>>> this way, without proper marking (leaving us to guess in many places).
>>>> It gets worse when a second lock can now also serve this same
>>>> purpose.
>>>
>>> The new lock is taken in read mode in most contexts, and hence can't
>>> be used to indirectly gain exclusive access to domain related
>>> structures in a safe way.
>>
>> Oh, right - I keep being misled by rw_is_locked(). This is a fair
>> argument. Irrespective it would feel better to me if an abstraction
>> construct was introduced; but seeing you don't like the idea I guess
>> I won't insist.
> 
> TBH I'm not going to argue against it if you and Stewart think it's
> clearer, but I also won't request the addition of such wrapper myself.
> 
> Thanks, Roger.

Overall, I think there are two sources of confusion:

    1. This patch is using the odd-looking ASSERTs to verify that it is safe to *read* d->pdev_list, and/or ensure a pdev does not go away or get reassigned. The purpose of these ASSERTs is not immediately obvious due to inadequate description.

    2. At first glance, the patch appears to be doing two things: using d->pci_lock for d->pdev_list/pdev protection, and using d->pci_lock for pdev->vpci protection.

Regarding #1, while the review experience could have been improved by introducing a wrapper construct, I think it would also (more importantly) be valuable to have such a wrapper for the sake of code readability. I think it is important to get this right and hopefully avoid/reduce potential future confusion. I'll add something like this in v13, e.g. in sched.h:

/* Ensure pdevs do not go away or get assigned to other domains. */
#define pdev_list_is_read_locked(d) ({                           \

        struct domain *d_ = (d);                                 \

        pcidevs_locked() || (d_ && rw_is_locked(&d_->pci_lock)); \

    })

Example use:

    ASSERT(pdev_list_is_read_locked(d));

Regarding #2, the patch description primarily talks about protecting the pdev->vpci field, and the d->pdev_list read / pdev reassignment protection seems an afterthought. However, the use of pcidevs_lock() for pdev protection is pre-existing. Now that vPCI callers are going to use d->pci_lock (instead of pcidevs_lock()), we are simultaneously changing the allowable mechanism for protecting d->pdev_list reads and pdevs going away or getting reassigned. I briefly experimented with splitting this into two separate patches, but I chose not to pursue this further because then we'd have a brief odd intermediate state, not to mention the additional test/review burden of evaluating each separate change independently. Keep in mind this patch as a whole has already been through much test/review, and at this point my primary focus is to improve readability and avoid confusion. I will plan to add appropriate description and rationale for v13.

Since I will be changing to use a wrapper construct and updating the descriptions, I will plan to drop Roger's R-b tag on this patch for v13.

Lastly, as has already been mentioned in the cover letter and reiterated in discussions here, for the non-vPCI code paths already using pcidevs_lock() I will plan to keep them using pcidevs_lock().

