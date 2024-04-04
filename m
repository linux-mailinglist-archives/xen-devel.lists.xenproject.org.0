Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E216A898974
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 16:02:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700907.1094704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsNfK-0006n0-Qj; Thu, 04 Apr 2024 14:02:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700907.1094704; Thu, 04 Apr 2024 14:02:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsNfK-0006l1-Nb; Thu, 04 Apr 2024 14:02:06 +0000
Received: by outflank-mailman (input) for mailman id 700907;
 Thu, 04 Apr 2024 14:02:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Y/v=LJ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rsNfJ-0006ki-3v
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 14:02:05 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2418::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9a47bb9-f28b-11ee-afe5-a90da7624cb6;
 Thu, 04 Apr 2024 16:02:04 +0200 (CEST)
Received: from BYAPR01CA0035.prod.exchangelabs.com (2603:10b6:a02:80::48) by
 SA3PR12MB9092.namprd12.prod.outlook.com (2603:10b6:806:37f::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.46; Thu, 4 Apr 2024 14:01:54 +0000
Received: from SJ1PEPF00001CDF.namprd05.prod.outlook.com
 (2603:10b6:a02:80:cafe::3c) by BYAPR01CA0035.outlook.office365.com
 (2603:10b6:a02:80::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46 via Frontend
 Transport; Thu, 4 Apr 2024 14:01:50 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CDF.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Thu, 4 Apr 2024 14:01:49 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 4 Apr
 2024 09:01:47 -0500
Received: from [172.21.219.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 4 Apr 2024 09:01:46 -0500
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
X-Inumbo-ID: e9a47bb9-f28b-11ee-afe5-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Je9qRnshnFEYkIoCyjbREvt1/1/n/VM5Z3uxroP1HVMJko6j85SH3MhdsKMseSCJ/ix2JoGd9kXqxt+Z7cCGQPHe1DJkZ2MBYnNHOI8zy7JpFAF19xDIXvY7oQX/ZnNIy/zb54hK7xBMIKCDuZc7U8GhhKtIdE919fSr3Tbt7lBs6Ub0uuG6vhZ+ppw7+Oqk6fppQa60FAkkaW5k1eH2xmVqOzbU+tlP4quKF+TH4DjmQkhzdUgqoysCj4gloxd4+WZhyQuTs5zZsVFyBorsJ1xVicTZMWZ1rMS7k+qHZyWrBboaZgi8WdmryjDwhU2fk4Q4e6jWoomAwvljHxQjOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqLJfNF3hEqM/OGyHc7d56iagiJuTCvVHIYNPuwQfL0=;
 b=esrl5J8SLNvPcfFH3wk9xNwzPThsaAfbBd3zX4X0PCcB5TlL1cOtj7it6bC67wFQ4GRHPFRUnJ3Y1DeDAg+/pWPecQLJ3t6tV3TL69RypHRkGutjKkB0KB4Q/AsYZj4amS6YWDCmE5/RrBNHtmuJ01zV4aga/k7E+MxIr5E1SoGy7riJ4pfH78zVPjXsRtE5rqUbD+mCfVZax7UBGIqzDPzUxNJUNOi6iqXGo7mnpdWiqxSXzknZqbMPlucR4TMsCqhaazS5CrBnNgL9pafUXyUlfCHB60DX/fvNgIb/UY7L4gg8PSEhVF3z3KxleGEORD//y1jWeQ08b6oKdVVuZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqLJfNF3hEqM/OGyHc7d56iagiJuTCvVHIYNPuwQfL0=;
 b=MPtwtItkqU3DQBg0NxKXWwsC2N9UuA27OPvAOm+sp+1KwdY+sSHj5Yi3naarcK1/C5WMk1KY3Y2MOaqiHHDU82OznDouSjwhEDAq0j+WxFyz0RNoCZxI+npODYaSPcnFQ5UbocWb0ujXUUx2x3Vl10WDtsdNXPIYBI5IRu/NfPY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <8ccb0cb3-0855-4729-8be6-a522b0fc365c@amd.com>
Date: Thu, 4 Apr 2024 10:01:43 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v6 4/4] x86/PVH: Support relocatable dom0 kernels
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>
References: <20240327215102.136001-1-jason.andryuk@amd.com>
 <20240327215102.136001-5-jason.andryuk@amd.com>
 <46a99837-fbb4-4dc9-a78c-634bee5c00a5@suse.com>
Content-Language: en-US
In-Reply-To: <46a99837-fbb4-4dc9-a78c-634bee5c00a5@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDF:EE_|SA3PR12MB9092:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ae618b1-d1d6-405b-2c72-08dc54afc63f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5e7wYsWXQwwd23iGDVBcm2JjzFEVESqgnYVnIFLPwy/VirYUh6ql95DPeV7IgZYYfpEQSnFYoor11U2vv+4vEsPyygC1GUBet7ECCVPLJiXoqk54TjyUpsK3nG20w0W7yIFNZlj9lH4V/ciBkIzkpCdXHtXpUjuLlIRlRB898ojvOLfWFKuZiF61eZ85Fpc1Zs9wdRSY6sPUAkWVMRt6gAv49jV0PzhJ0QEffxYMW3GVrHTYqtTE9Avb8JbShuSrJqVlVW+zavVBe8dCVIlT4jMPhFGS4MH257Q90m+jIGI7aS21nOrtLRRPu4f4zKyXSpuchgSdklbUgB9eUEjk1TAsjFMDxYXmeV/TwgpwM01dZIjJQxpDde0yIF6sRZmHP3vSyKfmF0eO+sXqYy4kntn2ER9yt/u1PIpZVfgtH5dtzF6g5xXAvRe4YrJu71jk66GrOCVMnsuiWts86FAn442zH42xvsaeFJnWB9rMuKjEI57P6fVFj+KvxkV8pxSF05tsZzA+PaBsOmWifpqh6qEStyzNLbGaCHx1d4pJQJr5iEblO6Y3xY5kRSeR+b8blY5cRR+I6w2m0Grr9S0JsnoiNmgH+fgXWHwzZ3awPgCU8JayMG8CI0gtL78efrED0z8GN4lTtQvexnFsazZXrFK0gdrGZdkHsddcQHUZ5bCDWktFk6RkhZK2oS4nOb85GqtZcLjx/VTUzal91zjAvYeLBLNhfiXBqmURr4sgqUqutbQlii3F1USGxXJsnaqQ
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(376005)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 14:01:49.8837
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ae618b1-d1d6-405b-2c72-08dc54afc63f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9092

On 2024-04-02 10:34, Jan Beulich wrote:
> On 27.03.2024 22:51, Jason Andryuk wrote:
>> v6:
>> Select alignment from, in order, Note, PHDRs, then default
> 
> The comment in the public header also needs to reflect this change.

Yes.  I'll update.

I'm going to tweak the code from elf->palign > PAGE_SIZE to >=, since 
PAGE_SIZE is a reasonable value to use.

>> +static bool __init check_and_adjust_load_address(
>> +    const struct domain *d, struct elf_binary *elf, struct elf_dom_parms *parms)
>> +{
>> +    paddr_t reloc_base;
>> +
>> +    if ( check_load_address(d, elf) )
>> +        return true;
>> +
>> +    if ( !parms->phys_reloc )
>> +    {
>> +        printk("%pd kernel: Address conflict and not relocatable\n", d);
>> +        return false;
>> +    }
>> +
>> +    reloc_base = find_kernel_memory(d, elf, parms);
>> +    if ( !reloc_base )
>> +    {
>> +        printk("%pd kernel: Failed find a load address\n", d);
>> +        return false;
>> +    }
>> +
>> +    if ( opt_dom0_verbose )
>> +        printk("%pd kernel: Moving [%p, %p] -> [%"PRIpaddr", %"PRIpaddr"]\n", d,
>> +               elf->dest_base, elf->dest_base + elf->dest_size - 1,
>> +               reloc_base, reloc_base + elf->dest_size - 1);
>> +
>> +    parms->phys_entry = reloc_base +
>> +                            (parms->phys_entry - (uintptr_t)elf->dest_base);
> 
> I think this would be easier to read as
> 
>      parms->phys_entry =
>          reloc_base + (parms->phys_entry - (uintptr_t)elf->dest_base);
> 
> Everything else looks good to me now.

Sounds good to me.

Thanks,
Jason

