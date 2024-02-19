Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFCE85A58E
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 15:14:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682893.1062123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc4PZ-000216-Os; Mon, 19 Feb 2024 14:14:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682893.1062123; Mon, 19 Feb 2024 14:14:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc4PZ-0001zE-Lf; Mon, 19 Feb 2024 14:14:25 +0000
Received: by outflank-mailman (input) for mailman id 682893;
 Mon, 19 Feb 2024 14:14:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GzZz=J4=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rc4PY-0001z6-5y
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 14:14:24 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20600.outbound.protection.outlook.com
 [2a01:111:f403:240a::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2caf5a4a-cf31-11ee-98f5-efadbce2ee36;
 Mon, 19 Feb 2024 15:14:21 +0100 (CET)
Received: from SA0PR11CA0170.namprd11.prod.outlook.com (2603:10b6:806:1bb::25)
 by SJ2PR12MB9005.namprd12.prod.outlook.com (2603:10b6:a03:53d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.20; Mon, 19 Feb
 2024 14:14:15 +0000
Received: from SA2PEPF000015C9.namprd03.prod.outlook.com
 (2603:10b6:806:1bb:cafe::69) by SA0PR11CA0170.outlook.office365.com
 (2603:10b6:806:1bb::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39 via Frontend
 Transport; Mon, 19 Feb 2024 14:14:15 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015C9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 19 Feb 2024 14:14:15 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 19 Feb
 2024 08:14:14 -0600
Received: from [172.30.63.250] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 19 Feb 2024 08:14:13 -0600
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
X-Inumbo-ID: 2caf5a4a-cf31-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gSzhBZFx/pPqKpy+H7xCJyDmzFgpnoBBJI4rs8qPmnZY16KzwvIadoZVyyhiljxowgdNERJzFnmpdkLw3LV8tqgoSPD2Seu73cFxTZ0AS7e4ZWqH6WnV6VWgP+8ukXLmaynIKQBUDQgs6WBbowVdzfVmZcxcJr5yBZiiUGY7YFxU3HgmPJ/6wo7/8xn2iGgJvXjKznU+i9XGCrPNbm9C8XsTV7E8wenKnlacX7ypbPfvJrA+VINrw7yJA8MakHpJ1Zuy/rmGbexIqPKdNHAj+yzKdGeUQBoqte/0sSTgcKR3k3azAOtyS7oJZMysMyNAs0wUq++RHcnPXhqzqeM6pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cj7gA1sm3uWjyRxLyFk5BtQpLh30GWilhCVGfPP9bQk=;
 b=Cg6MjuAs1143ED73DNQ6axZUDf9uvS9R8/533Cq8bjF2Q8tsoo/WImgQiU7hKcn5VwagDk3YrbZ8TjJJPZ1XHbffaT5vDyX3ZzeRpAQfWEJPFqoe8ElEBWarEkjyXfKFiDBiMrVDguHkNlvSzfkaYJFZm0MasseQXKm7AimrsT4hB9UBYWulja4bVfWS+4AxT9k98C5v7PJWtOzqMutn27M1GzllEvMgtSEyR9fpL2vQXHMGu/L5KqF0MK77LPv3XVqlI49gqgXVYhgm1CodXJqjC5SbwtPi8ALspmM1cN+wS8hQwjQadc9O+n3oA2QMhRDz29NE8J/sH56CwAYitA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cj7gA1sm3uWjyRxLyFk5BtQpLh30GWilhCVGfPP9bQk=;
 b=3opHjx3BdvOd0UNZTsW77b4SHu5tCWWamzt0gGYJNOrksdkokhXZOwe4RqS96mXaPR8GcixB8ZY952VUzsZRWTVZQPP94Lj+rfVM4ygIFGMgIB8s+WPJHHPj4EngHPqg9IjE09osLIWajZYxeCX+KocEy4mjNDN2M4q/30CCNZc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <6587ee51-5943-4a81-814b-917f7ec71c01@amd.com>
Date: Mon, 19 Feb 2024 09:14:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13.2 01/14] vpci: use per-domain PCI lock to protect vpci
 structure
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
 <68bb972c-5e45-4706-a06f-0dcd65c40581@amd.com>
 <39e8845b-8d41-40e5-8e7a-49e734012d78@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <39e8845b-8d41-40e5-8e7a-49e734012d78@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C9:EE_|SJ2PR12MB9005:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e43acaa-612b-414a-6092-08dc31550de6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D5KV2ol3TSTRn65If5U6yTJbnLls9usiQHlC9/+xj4eq4sPxE3Wi4o1RtW89lgRl8POB8Bof3Cod3iHn8c2ks36VB95gc3Ye031SdmIdn3rqKBTp4AxdnNZib+ZY8UFLVzpqXrSxJE9XzK8ERMc8FcWZKZa8v0qmLVMgkfvozwzkrammzVQ4JzxOUhY3ecCglYCBInYbppb55orm/goMQtPH/SGKRoh8Aqx0jFj0e1WoHaIFlDjwhZWNn2Q3y1jJ+hbuhfNWW95Eq6cosB9BB7cIYBpG8VFRLlzzhJGagzI52oX3Weod+h2T7WW/0SaQpYV0B1bceGiIn3GpAhOt6b10gYDS5xUUi2h6KOeIPe5y8IWURIOfCOArUB7rEPueQzzDyUSCXDuot6XTJFTsAFVo4vB5N2EZPN06IuOrlo72N0ZgyyVfY2SIE30qpwsZihCe/W03zBPSbG4NWp2BlW7lNVsEZyWLelw4NWej4KApJTwSWdztjW9wwveYpgcGg3BBvqBAtOQVBaezAiR8PqGooAwEboshrJm0TAg/oBKeL5g9UgIa39Mlv7KYJGIHc6UUbxXi3REk62HKdlzg+lF2eZ6T+A1jIlXv2ZXQBUnrNGQEQUQgBTGIW4qFLe3urr5kUtCtTZVnivo18p2fcA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(40470700004)(46966006);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 14:14:15.4325
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e43acaa-612b-414a-6092-08dc31550de6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9005

On 2/19/24 08:12, Jan Beulich wrote:
> On 19.02.2024 13:47, Stewart Hildebrand wrote:
>> On 2/19/24 07:10, Jan Beulich wrote:
>>> On 19.02.2024 12:47, Stewart Hildebrand wrote:
>>>> @@ -895,6 +891,15 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
>>>>  {
>>>>      unsigned int i;
>>>>  
>>>> +    /*
>>>> +     * Assert that d->pdev_list doesn't change. ASSERT_PDEV_LIST_IS_READ_LOCKED
>>>> +     * is not suitable here because it may allow either pcidevs_lock() or
>>>> +     * d->pci_lock to be held, but here we rely on d->pci_lock being held, not
>>>> +     * pcidevs_lock().
>>>> +     */
>>>> +    ASSERT(rw_is_locked(&msix->pdev->domain->pci_lock));
>>>> +    ASSERT(spin_is_locked(&msix->pdev->vpci->lock));
>>>
>>> There's no "d" in sight here, so it's a little odd that "d" is being talked
>>> about. But I guess people can infer what's meant without too much trouble.
>>
>> I can s/d->pci_lock/msix->pdev->domain->pci_lock/ for the next rev.
> 
> Or simply drop the d-s? That would be better for readability's sake,
> I think.

OK

>>>> @@ -313,17 +316,36 @@ void vpci_dump_msi(void)
>>>>                  {
>>>>                      /*
>>>>                       * On error vpci_msix_arch_print will always return without
>>>> -                     * holding the lock.
>>>> +                     * holding the locks.
>>>>                       */
>>>>                      printk("unable to print all MSI-X entries: %d\n", rc);
>>>> -                    process_pending_softirqs();
>>>> -                    continue;
>>>> +                    goto pdev_done;
>>>>                  }
>>>>              }
>>>>  
>>>> +            /*
>>>> +             * Unlock locks to process pending softirqs. This is
>>>> +             * potentially unsafe, as d->pdev_list can be changed in
>>>> +             * meantime.
>>>> +             */
>>>>              spin_unlock(&pdev->vpci->lock);
>>>> +            read_unlock(&d->pci_lock);
>>>> +        pdev_done:
>>>>              process_pending_softirqs();
>>>> +            if ( !read_trylock(&d->pci_lock) )
>>>> +            {
>>>> +                printk("unable to access other devices for the domain\n");
>>>> +                goto domain_done;
>>>> +            }
>>>>          }
>>>> +        read_unlock(&d->pci_lock);
>>>> +    domain_done:
>>>> +        /*
>>>> +         * We need this label at the end of the loop, but some
>>>> +         * compilers might not be happy about label at the end of the
>>>> +         * compound statement so we adding an empty statement here.
>>>> +         */
>>>> +        ;
>>>
>>> As to "some compilers": Are there any which accept a label not followed
>>> by a statement? Depending on the answer, this comment may be viewed as
>>> superfluous. Or else I'd ask about wording: Besides a grammar issue I
>>> also don't view it as appropriate that a comment talks about "adding"
>>> something when its adjacent code that is meant. That something is there
>>> when the comment is there, hence respective wording should imo be used.
>>
>> It seems like hit or miss whether gcc would accept it or not (prior
>> discussion at [1]). I agree the comment is rather lengthy for what it's
>> trying to convey. I'd be happy to either remove the comment or reduce
>> it to:
>>
>>     domain_done:
>>         ; /* Empty statement to make some compilers happy */
>>
>> [1] https://lore.kernel.org/xen-devel/98b8c131-b0b9-f46c-5f46-c2136f2e3b4e@amd.com/
> 
> This earlier discussion only proves that there is at least one compiler
> objecting. There's no proof there that any compiler exists which, as a
> language extension, actually permits such syntax. Yet if the comment
> was purely about normal language syntax, then imo it should be zapped
> altogether, not just be shrunk.

I'll zap it

