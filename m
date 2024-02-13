Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A89858536B3
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 17:58:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680084.1057930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZw72-000695-Jh; Tue, 13 Feb 2024 16:58:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680084.1057930; Tue, 13 Feb 2024 16:58:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZw72-00066x-Gs; Tue, 13 Feb 2024 16:58:28 +0000
Received: by outflank-mailman (input) for mailman id 680084;
 Tue, 13 Feb 2024 16:58:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SLZZ=JW=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rZw71-0005tv-K7
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 16:58:27 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20600.outbound.protection.outlook.com
 [2a01:111:f403:2408::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19d03c51-ca91-11ee-98f5-efadbce2ee36;
 Tue, 13 Feb 2024 17:58:25 +0100 (CET)
Received: from DM6PR03CA0068.namprd03.prod.outlook.com (2603:10b6:5:100::45)
 by SA1PR12MB8142.namprd12.prod.outlook.com (2603:10b6:806:334::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25; Tue, 13 Feb
 2024 16:58:20 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:5:100:cafe::89) by DM6PR03CA0068.outlook.office365.com
 (2603:10b6:5:100::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.41 via Frontend
 Transport; Tue, 13 Feb 2024 16:58:20 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 13 Feb 2024 16:58:20 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 13 Feb
 2024 10:58:19 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 13 Feb
 2024 08:58:19 -0800
Received: from [172.27.131.30] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 13 Feb 2024 10:58:18 -0600
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
X-Inumbo-ID: 19d03c51-ca91-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FMvpHEGFBJyCWvdLFWcxeGU6T7rjS/krUXHMqzEEM8mekmoFwsSZgbOmHCDjSuRi5UjwBJhlcvveftArZ7MWrQkuPx+Emf8yKmt7DITw9r7pfdYdzXJAZwRSwlGQDbc+mjhHuLg8A8knqyJ2Jt+vJMJiirlKT4H4R+ykdyPgKT58IsOxNOgYYN2AdYv/9MHKWswGK4euHP5Yc6SOxHAO5k/ZhivrSBSOPee/QY2ncWw710N+KvrAOMZNT7lby4Ozv6OtEG8Zr5HUucGBwAkXoOSfOnPfKm7NzL/ganGAEF7IKw4HpENXBuulmywadFj+9qRUow6v1vNq57kyliaifA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cF4kq4/gZXL/ma7LW3N023XPKQzfYSmH+abcvn4PgpU=;
 b=gvb9b+hlJVX4b7SoMCdHcB6WJlXukZfdXpAdVxrCgyqmR4EtGJfN9gk+jgaf3vdj/WLFQ+yc4Sdl01k15J4heY5SvUDOxLxbAvHiOfx4zCBW8zHJ4VQfF5sHFlPV7H8qL+Y1KHNTkUzcmd+BMvFAFtGGp99SSRFJkBDwUdc+3TGzmi4DElKM7gslxrmXnsasHYYv8q7w0MR3s6jcv4SP5PGgQ70i6cDLcCwew5uBwPwzOyYUI0ivf6p2AX7EmSBIcaQdvuhRWPO368D2K456+QMLX1LsTZd3Hq9yKGB980s3bGf9m0lL0h3X4rU+ikWJQcLrTvsP5+nZqNX3udBdZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cF4kq4/gZXL/ma7LW3N023XPKQzfYSmH+abcvn4PgpU=;
 b=ZF/r17fWPFNSHDjRV9+YrU2Cjk5R/47ZcwZHOS3xDPhjw77taM0tK+gnh7Q7ye6ojWLmCKqHPoT5dfy5VLLXmROWofWuVXENxp4X0I/MOanwVpW95XOe1SPy8+Ekza7OlB/U85pE90H8TNpaWidY3gOt4m49W01lfGEpsy3QHCM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <f3b34d97-17b5-44ef-ad9e-ad04a96754d0@amd.com>
Date: Tue, 13 Feb 2024 11:58:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 01/14] vpci: use per-domain PCI lock to protect vpci
 structure
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Paul Durrant <paul@xen.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>
References: <20240202213321.1920347-1-stewart.hildebrand@amd.com>
 <20240202213321.1920347-2-stewart.hildebrand@amd.com>
 <Zcsp15Aqve11Icjb@macbook> <ec5d0c39-1559-4f10-9574-98cfa0542993@suse.com>
 <ZcswBFHtINB1XMAS@macbook> <db0ce984-88e3-4394-b270-c5db585f8209@suse.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <db0ce984-88e3-4394-b270-c5db585f8209@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|SA1PR12MB8142:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e8fa776-338c-4bd5-1613-08dc2cb4fb82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Zlaq9/D9S5FWqYmKuBbEc+RpPpjuvLAzS8py/4pFm+zxFLKtzT7550/posokZMJhOyEZx9wv+ryOP6i12AfGcFKcXlJJi7T9RWAVwMm1jHO0tPM3VH7LhZzCt+BNwuMvq9uS2MQeeNM0t9dNg7gLfyCLbmsQAuaXTn8HDJj6K2MLHpCs5Gu7b1WDrqZW/0CFA5Pbmrgo4qtIQ/c9FBK0MF0bvsfi9IGkFf1B4n1+Jyn3U//PuhfAVPgvLI9/xPE03ULsadDLcpHtYevsJzQK/UQV8nLPXXumOFpMGClUoTRmsrokj3a0YFJZ9L/CphHAVv20tPSKhbPvNucS5E9cwhRMOUt4ZJpfmVequy/TG8/pzaHTglGqOYn6qSuyx0NRhkWNkl289SyptrqC2K2tE2SS9DjHSz85c7g8HcLTTxNJwjssU2EIDJX4Xx/UNeUYZC3r2zwyCv32oXGRYjSUil419Ei5IovvAy2CcWKVs+xqyHAy7UCwvYgRxmJhbqc5vAVfEVEDBGxKqegvz07k0tDjc3AcHr7w7wlhRC+g3YikV/XVCE306pq33mO/Gaj235WTDAWki0eq5fC8C9AeyOZUl5EfNcUJnJi5/aMTLwI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(346002)(39860400002)(376002)(230922051799003)(451199024)(1800799012)(82310400011)(186009)(64100799003)(46966006)(36840700001)(40470700004)(31696002)(86362001)(31686004)(8676002)(70586007)(8936002)(5660300002)(70206006)(82740400003)(4326008)(7416002)(2906002)(478600001)(44832011)(426003)(336012)(26005)(2616005)(83380400001)(81166007)(356005)(66899024)(36756003)(54906003)(316002)(16576012)(110136005)(41300700001)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 16:58:20.4328
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e8fa776-338c-4bd5-1613-08dc2cb4fb82
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8142

On 2/13/24 04:05, Jan Beulich wrote:
> On 13.02.2024 10:01, Roger Pau Monné wrote:
>> On Tue, Feb 13, 2024 at 09:44:58AM +0100, Jan Beulich wrote:
>>> On 13.02.2024 09:35, Roger Pau Monné wrote:
>>>> On Fri, Feb 02, 2024 at 04:33:05PM -0500, Stewart Hildebrand wrote:
>>>>> --- a/xen/include/xen/sched.h
>>>>> +++ b/xen/include/xen/sched.h
>>>>> @@ -462,7 +462,8 @@ struct domain
>>>>>  #ifdef CONFIG_HAS_PCI
>>>>>      struct list_head pdev_list;
>>>>>      /*
>>>>> -     * pci_lock protects access to pdev_list.
>>>>> +     * pci_lock protects access to pdev_list. pci_lock also protects pdev->vpci
>>>>> +     * structure from being removed.
>>>>>       *
>>>>>       * Any user *reading* from pdev_list, or from devices stored in pdev_list,
>>>>>       * should hold either pcidevs_lock() or pci_lock in read mode. Optionally,
>>>>> @@ -628,6 +629,18 @@ struct domain
>>>>>      unsigned int cdf;
>>>>>  };
>>>>>  
>>>>> +/*
>>>>> + * Check for use in ASSERTs to ensure that:
>>>>> + *   1. we can *read* d->pdev_list
>>>>> + *   2. pdevs (belonging to this domain) do not go away
>>>>> + *   3. pdevs (belonging to this domain) do not get assigned to other domains
>>>>
>>>> I think you can just state that this check ensures there will be no
>>>> changes to the entries in d->pdev_list, but not the contents of each
>>>> entry.  No changes to d->pdev_list already ensures not devices can be
>>>> deassigned or removed from the system, and obviously makes the list
>>>> safe to iterate against.
>>>>
>>>> I would also drop the explicitly mention this is intended for ASSERT
>>>> usage: there's nothing specific in the code that prevents it from
>>>> being used in other places (albeit I think that's unlikely).
>>>
>>> But pcidevs_locked(), resolving to spin_is_locked(), isn't reliable. The
>>> assertion usage is best-effort only, without a guarantee that all wrong
>>> uses would be caught.
>>
>> Do we want to protect this with !NDEBUG guards then?
> 
> Yes, that would look to be desirable.

We will then also need a definition of pdev_list_is_read_locked() in the
#else case so we don't risk running into "error: implicit declaration of
function 'pdev_list_is_read_locked'".

Such a definition might look like:

#define pdev_list_is_read_locked(d) ({ (void)d; ASSERT_UNREACHABLE(); false; })

so that we still evaluate d exactly once in the NDEBUG case.

>>>>> + * This check is not suitable for protecting other state or critical regions.
>>>>> + */
>>>>> +#define pdev_list_is_read_locked(d) ({                           \
>>>>
>>>> I would be tempted to drop at least the '_read_' part from the name,
>>>> the name is getting a bit too long for my taste.
>>>
>>> While I agree with the long-ish aspect, I'm afraid the "read" part is
>>> crucial. As a result I see no room for shortening.
>>
>> OK, if you think that's crucial then I'm not going to argue.
>>
>>>>> +        struct domain *d_ = (d);                                 \
>>>>
>>>> Why do you need this local domain variable?  Can't you use the d
>>>> parameter directly?
>>>
>>> It would be evaluated then somewhere between 0 and 2 times.
>>
>> It's ASSERT code only, so I don't see that as an issue.
> 
> Fair point.
> 
>>  Otherwise d_ needs to be made const.
> 
> Indeed, but for assert-only code I agree the option is slightly better,
> ideally suitably commented upon.

Is "the option" here referring to making d_ const, or using d directly
(with suitable comment)?

