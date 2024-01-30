Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3B8842767
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 16:00:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673533.1047875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUpb2-0001W1-Hi; Tue, 30 Jan 2024 15:00:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673533.1047875; Tue, 30 Jan 2024 15:00:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUpb2-0001Tm-E1; Tue, 30 Jan 2024 15:00:20 +0000
Received: by outflank-mailman (input) for mailman id 673533;
 Tue, 30 Jan 2024 15:00:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cYm+=JI=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rUpb0-0001Tb-SI
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 15:00:18 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2417::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4682e6b6-bf80-11ee-98f5-efadbce2ee36;
 Tue, 30 Jan 2024 16:00:16 +0100 (CET)
Received: from SJ0PR03CA0107.namprd03.prod.outlook.com (2603:10b6:a03:333::22)
 by IA0PR12MB8254.namprd12.prod.outlook.com (2603:10b6:208:408::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Tue, 30 Jan
 2024 15:00:12 +0000
Received: from SJ1PEPF00001CDE.namprd05.prod.outlook.com
 (2603:10b6:a03:333:cafe::92) by SJ0PR03CA0107.outlook.office365.com
 (2603:10b6:a03:333::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34 via Frontend
 Transport; Tue, 30 Jan 2024 15:00:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CDE.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Tue, 30 Jan 2024 15:00:12 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 30 Jan
 2024 09:00:07 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 30 Jan
 2024 08:59:51 -0600
Received: from [172.23.114.18] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 30 Jan 2024 08:59:50 -0600
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
X-Inumbo-ID: 4682e6b6-bf80-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aLcxriRrHAsu7JlCqyVU2f3MCOsb4JOI4S5RV6G05W9U8p6UlusI+4t08FacYwZLU1xWmJOZWoayxQR1+7rISzm/90PpuGAh1GjyYxNZN/H4fz0wrs2JRSJqb9hGFr3ygIlkK+/p1585y3YJbn6Va/cNuVQv17QPIOzRZYhIodlhNhIFz8eWQR7lPT+PCebbR0feotGUolpvp0qikvyICn+RCl7iJd1YE0QIo0GoYNUMBEfqqHoe10hGb6Gk+x3Nkzg8m3CLfba7kEtxJuEsMTynkn2nVIAr7D1wta3RIiVc5FWsnc8dhevXX5QKayONTAiG8XvFrpN/P9kMvd0bSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u6ON6/VbrVMQALM5lG/NOPJDuBJFzRAmmCfxKkR2QkQ=;
 b=JKT5/6eI5KOKJnW8Pr/R5Hc7JCULN1Ub1IPuqeF2axd7hq1DaBOaVjMhij6SsKWS4RzOGt+mGW4tadhKQfajtOdIjXbfjy38BZfJstILLmv72B9Hx7oaq+otXQqE1EFaWZGb5D1RT855DiI0IFobgBeTUePc/0mBL/dci3OfHwv/KcuSTS3+bG4JqjSCIZurZSgrFGamdSADVjJjZgDeH+jtsyUkK+sDibEJZjEr6hr0lWWi1tK2mDYLlnpJWO3aHDzlC1fGHYCAvnwsbxnrlwJmj7rE7VRUXP5jUHTi4OBB4LweFF0weFsLAfz1GD84N4c3oNDq22t9V6LIuqQYWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6ON6/VbrVMQALM5lG/NOPJDuBJFzRAmmCfxKkR2QkQ=;
 b=iTvfJhef4nyolUJ4I/Ljt1X+3QXaX7f22I3+BbpSxqfk96XPLjggakbGq//7+L6K4K6AbJgmDQ5Y6rYvVUY5QoRLY4SUbogqBwKU2Ko2ZuaR8gQqOzMjxd1WGfQQIgOQy8ZIsiBBhdhoMkSll/Fhw+4eSNkzLQzKbRITBlv1OPw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <3c1023c4-25fb-41f1-83eb-03cbc1c3720e@amd.com>
Date: Tue, 30 Jan 2024 09:59:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12.2 01/15] vpci: use per-domain PCI lock to protect vpci
 structure
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
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
 <2df1ffd4-827f-4e28-9547-293a60f590b0@amd.com>
In-Reply-To: <2df1ffd4-827f-4e28-9547-293a60f590b0@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDE:EE_|IA0PR12MB8254:EE_
X-MS-Office365-Filtering-Correlation-Id: b7096efc-e4ab-4d92-3939-08dc21a428cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7OSnUCt0OdrMp6jYN8DHfP9DQhfROT1wMTiCosr54+1e2GrdWQxuPfyrQk94UbSgHHazAuZD6otpd9RlxHk5LrlFmHFKmfib58z53oQ2Kkm9lV39uukb7oo5kIpZ4oOKpzu/e0coJqzQWYV9GTClF0H0fZgQ3J+jc/MP2+c2cZRPihrvhJMjxnL//2o70YrgCuFBrIs93wOt2ZXl3DvR2Xbh/8D2LoiQKtKJ6HwWu6fNKtnkdheyXFVLuw3JDYJepU0IJ4jy2dGdvcWduPv/A2vPipUPfsfRTq/2AHijfSRQFdJSNUuN9H4qQ2GvyrKWluPRbYTgRHhsXLjiS+KMFUeKK4yOcV9HmzBilh4wpK78vRuSfB5f9D+Hv9WBCOIPqvdb85qvGxvmDNySdFYPRAHLS+JmNVaK+QH2HCnVxXw22pb/EcZy65GvrqofS/p+kr9sA8FTLmUQ46bfrXMQldqw7ghJGmm5GEPEZOqmR1iCQ6nI/XbWoM7vY1tPhR62EI/DoAOnkp1JPc5slVawHBB51Bno9bTYOmOLOuPv/yzuVHcan/XSco6AHNGxGoZYmSvmD7IucjdYJINYrtL+XupvqN7K0u18mvQnNPx8TJlInh35FL5mf04209wkGWHFAgQgz8gMwWSh1yZSCAvi2LhdKZ6gsqL/1oIHrgXKXSdiis4/MGrOqPs1PSN9Utz+//soofFFrKEplxEjX5theh8ytxDlKT3roS2uDXEjiPWFAQm3Z7dkNUFUBlubzAPP1pPAnqpnqOwsPqtqlASGGtN5xA46jStAY7cU0ycJzF8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(136003)(376002)(39860400002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(82310400011)(36840700001)(46966006)(40470700004)(41300700001)(31696002)(478600001)(86362001)(2616005)(54906003)(53546011)(5660300002)(44832011)(2906002)(7416002)(8936002)(4326008)(110136005)(16576012)(8676002)(70586007)(316002)(36860700001)(70206006)(31686004)(83380400001)(47076005)(426003)(356005)(26005)(336012)(36756003)(81166007)(40480700001)(82740400003)(40460700003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 15:00:12.1187
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7096efc-e4ab-4d92-3939-08dc21a428cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8254

On 1/24/24 00:00, Stewart Hildebrand wrote:
> On 1/23/24 10:07, Roger Pau Monné wrote:
>> On Tue, Jan 23, 2024 at 03:32:12PM +0100, Jan Beulich wrote:
>>> On 15.01.2024 20:43, Stewart Hildebrand wrote:
>>>> @@ -2888,6 +2888,8 @@ int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
>>>>  {
>>>>      int irq, pirq, ret;
>>>>  
>>>> +    ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock));
>>>
>>> If either lock is sufficient to hold here, ...
>>>
>>>> --- a/xen/arch/x86/physdev.c
>>>> +++ b/xen/arch/x86/physdev.c
>>>> @@ -123,7 +123,9 @@ int physdev_map_pirq(domid_t domid, int type, int *index, int *pirq_p,
>>>>  
>>>>      case MAP_PIRQ_TYPE_MSI:
>>>>      case MAP_PIRQ_TYPE_MULTI_MSI:
>>>> +        pcidevs_lock();
>>>>          ret = allocate_and_map_msi_pirq(d, *index, pirq_p, type, msi);
>>>> +        pcidevs_unlock();
>>>>          break;
>>>
>>> ... why is it the global lock that's being acquired here?
>>>
>>
>> IIRC (Stewart can further comment) this is done holding the pcidevs
>> lock to keep the path unmodified, as there's no need to hold the
>> per-domain rwlock.
>>
> 
> Although allocate_and_map_msi_pirq() was itself acquiring the global pcidevs_lock() before this patch, we could just as well use read_lock(&d->pci_lock) here instead now. It seems like a good optimization to make, so if there aren't any objections I'll change it to read_lock(&d->pci_lock).
> 

Actually, I take this back. As mentioned in the cover letter of this series, and has been reiterated in recent discussions, the goal with this is to keep existing (non-vPCI) code paths as unmodified as possible. So I'll keep it as pcidevs_lock() here.

