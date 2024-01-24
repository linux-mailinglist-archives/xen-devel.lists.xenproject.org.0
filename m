Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AD983A0D5
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 06:01:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670714.1043665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSVNk-0008TH-8A; Wed, 24 Jan 2024 05:01:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670714.1043665; Wed, 24 Jan 2024 05:01:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSVNk-0008QX-50; Wed, 24 Jan 2024 05:01:00 +0000
Received: by outflank-mailman (input) for mailman id 670714;
 Wed, 24 Jan 2024 05:00:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=87Ys=JC=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rSVNj-0008QR-Cj
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 05:00:59 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:200a::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8def6d6c-ba75-11ee-9b0f-b553b5be7939;
 Wed, 24 Jan 2024 06:00:56 +0100 (CET)
Received: from MW4PR04CA0360.namprd04.prod.outlook.com (2603:10b6:303:8a::35)
 by DM6PR12MB4353.namprd12.prod.outlook.com (2603:10b6:5:2a6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Wed, 24 Jan
 2024 05:00:50 +0000
Received: from CO1PEPF000044F8.namprd21.prod.outlook.com
 (2603:10b6:303:8a:cafe::1b) by MW4PR04CA0360.outlook.office365.com
 (2603:10b6:303:8a::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.38 via Frontend
 Transport; Wed, 24 Jan 2024 05:00:49 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7228.0 via Frontend Transport; Wed, 24 Jan 2024 05:00:49 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 23 Jan
 2024 23:00:46 -0600
Received: from [172.23.114.18] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 23 Jan 2024 23:00:45 -0600
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
X-Inumbo-ID: 8def6d6c-ba75-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FkPDxIit7CVD86FJRxUyHPyGbwghoiJNp3LovfmhA2jPK0bG1jW2Ap9R46rCSF08Xmb3z/mdCiDIRAu2VOlicz7C5/ss5xN60cuRV48uz8brIXkAUdicIAb0Tmc00Uz/vBio85dlRwpfeZTv5WkjpamteWOu1RZKEtuM+ysIYSS3rbPaeW0AM5/wTjFGDwqFXpSGHiomCa76g9vKYBYUoC6pOLDax8uwP+k66idEYAwzmYz11HEF1Yi3t+FGR1Ux1CE39aoAlz3IRmPuUOz+GxeFe01Um5gPXUoXJfZoQUh3DttZoaBnaJOJBEM+kZKEZAVVPWMjUrrJKi7gcTjjQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=daKAEf94PhbZ9hRj/TDn2v6ZtbA/LJclSAowjn1m8Ok=;
 b=V9hu4g2ZUH5efRDvLaXfoP+CI2/g6mlj98A3YgKRVl0ZKCAj1gNNp14hGRxEJVH3ScmP/uns9P1eQZUR8byWoKOyqWCNB8jw8co2Yqf5s/nv+cTzlQPcCdhn/eyVVYhr9iAJ0Pgmrmpew39wnPMyS403KOETkh16FBJ+0u0ZrRYfryBk3jmmCAD40IhZr/zqd85g01Wr6WNfL7PsMruV7q0aYWqUVJ3coXi5Ki5nx2V9Un/3bl6lAG1+JzlVWUb8YaPNGyREBOMn4eFO7NhlnxmnK0hhcqhUksKADbhDm+AElUkiErlFaVNqCbFWiremgNnxl05xzctPDVD/GQgEbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=daKAEf94PhbZ9hRj/TDn2v6ZtbA/LJclSAowjn1m8Ok=;
 b=I8czKUbpmoYyS+BbZJTQWa6p2XFmP0kr2QUqZiNMtk93+33Axcb4fRl2KJbyxpOMJVIuGBs/id7vjRX6hwmaqejfcJfT2gxHXKHODpPa3IgG9nt9nGxsYakBKxzx+9KE9F3ternSAVC9fV2m23fSz+1UIhVKAXr5odhzEzZVHBA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <2df1ffd4-827f-4e28-9547-293a60f590b0@amd.com>
Date: Wed, 24 Jan 2024 00:00:44 -0500
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
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
 <20240109215145.430207-2-stewart.hildebrand@amd.com>
 <20240115194309.45683-1-stewart.hildebrand@amd.com>
 <715e40c9-1776-4677-9565-dac1565a2aa8@suse.com> <Za_WGzS14Eqt8yZF@macbook>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <Za_WGzS14Eqt8yZF@macbook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F8:EE_|DM6PR12MB4353:EE_
X-MS-Office365-Filtering-Correlation-Id: b3fb8de9-8082-4147-d7ba-08dc1c996f1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JY44LoeBVuOZUd9QypdYlrZOI1mhg/9jawokLkk/SvX3WqM+ozfmrbZ5a/VrSDm84GNPM4bo+ucsGZQa1GbN0Wg3ZrtXZFCwiRzCwwV+IjqAB5zjdL21mc5A8/3nImGiXN7UmEQJZWuT8QuI8CJpLteumXVhs0Jcoir0SUccXSCWwLi2MdtZcwHL/NhczZA6KZKvPSAAt1RWMez5atu7y0UNHKLTs9yhO17ORwvqv8dGeENJ2RhooR74Up40MP+ex2A5JKydBn374hpk9WUD15tZ6NwmqTWJ7IHKHrRPUz2Lf7HYaQk1jI9LgWjlwiZyGwkYVw/ovIaF7o6TP5n9BtAyUfM+UeowDeH0jKWai9IJqFlesIiNzS7WTBscsNFB0H3O2r/eF3Ziazf/5D3PP9SnEvFQlscItKqoh1igmoNWUn4tZE9aRhFTMrFdzEj2+A9Q8Dv3LUAdfDTOTZlAkeTJDsJ8Zrql75PDX9H0eJfZGQknBdZkTxrxL39PxNHdWu6iFqMtOnI1/aRKdAK0KVQAYJfG+MV8gxNqczN8YT5Vjgt4iHaeg+eGGJsHeP0qpWtIicWPX0cOt22bx03juQu2YzNGeWLD3INzGiyOMbAQxoZ8rSfYtM0Yt/9pz/liA2M1iR4GmeWhFSvi9rfYrVx/rTqak4emIdUlkHJ5YR2Wsyt+5zONUTvxzjHrn/QyM5Dym2bF3J2tN4YIdEL4HBbquPTeMQPg4ch9KdNBifZr68a6vGsc7Dn75RynS8jRbYYfDUbSu7WhrtJ2UXUqPoBJeTJSe4VdTNX6BWc9OAc=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(39860400002)(396003)(346002)(230922051799003)(186009)(82310400011)(64100799003)(1800799012)(451199024)(40470700004)(36840700001)(46966006)(31686004)(110136005)(40480700001)(40460700003)(5660300002)(2906002)(7416002)(44832011)(316002)(16576012)(54906003)(4326008)(8936002)(41300700001)(70206006)(70586007)(8676002)(81166007)(82740400003)(356005)(478600001)(31696002)(36756003)(86362001)(47076005)(26005)(426003)(336012)(36860700001)(2616005)(83380400001)(53546011)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 05:00:49.8031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3fb8de9-8082-4147-d7ba-08dc1c996f1b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4353

On 1/23/24 10:07, Roger Pau Monné wrote:
> On Tue, Jan 23, 2024 at 03:32:12PM +0100, Jan Beulich wrote:
>> On 15.01.2024 20:43, Stewart Hildebrand wrote:
>>> @@ -2888,6 +2888,8 @@ int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
>>>  {
>>>      int irq, pirq, ret;
>>>  
>>> +    ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock));
>>
>> If either lock is sufficient to hold here, ...
>>
>>> --- a/xen/arch/x86/physdev.c
>>> +++ b/xen/arch/x86/physdev.c
>>> @@ -123,7 +123,9 @@ int physdev_map_pirq(domid_t domid, int type, int *index, int *pirq_p,
>>>  
>>>      case MAP_PIRQ_TYPE_MSI:
>>>      case MAP_PIRQ_TYPE_MULTI_MSI:
>>> +        pcidevs_lock();
>>>          ret = allocate_and_map_msi_pirq(d, *index, pirq_p, type, msi);
>>> +        pcidevs_unlock();
>>>          break;
>>
>> ... why is it the global lock that's being acquired here?
>>
> 
> IIRC (Stewart can further comment) this is done holding the pcidevs
> lock to keep the path unmodified, as there's no need to hold the
> per-domain rwlock.
> 

Although allocate_and_map_msi_pirq() was itself acquiring the global pcidevs_lock() before this patch, we could just as well use read_lock(&d->pci_lock) here instead now. It seems like a good optimization to make, so if there aren't any objections I'll change it to read_lock(&d->pci_lock).

