Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 275D768664F
	for <lists+xen-devel@lfdr.de>; Wed,  1 Feb 2023 13:58:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488286.756303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNCfr-00025T-EV; Wed, 01 Feb 2023 12:57:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488286.756303; Wed, 01 Feb 2023 12:57:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNCfr-00022n-Bd; Wed, 01 Feb 2023 12:57:15 +0000
Received: by outflank-mailman (input) for mailman id 488286;
 Wed, 01 Feb 2023 12:57:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jhIt=55=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pNCfp-00022h-6s
 for xen-devel@lists.xenproject.org; Wed, 01 Feb 2023 12:57:13 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20613.outbound.protection.outlook.com
 [2a01:111:f400:7e89::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id edd8ca91-a22f-11ed-b63b-5f92e7d2e73a;
 Wed, 01 Feb 2023 13:57:08 +0100 (CET)
Received: from DS7PR03CA0284.namprd03.prod.outlook.com (2603:10b6:5:3ad::19)
 by CH3PR12MB7739.namprd12.prod.outlook.com (2603:10b6:610:151::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25; Wed, 1 Feb
 2023 12:56:58 +0000
Received: from DM6NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ad:cafe::84) by DS7PR03CA0284.outlook.office365.com
 (2603:10b6:5:3ad::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.24 via Frontend
 Transport; Wed, 1 Feb 2023 12:56:58 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT010.mail.protection.outlook.com (10.13.172.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.22 via Frontend Transport; Wed, 1 Feb 2023 12:56:57 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 1 Feb
 2023 06:56:57 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 1 Feb
 2023 06:56:57 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 1 Feb 2023 06:56:56 -0600
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
X-Inumbo-ID: edd8ca91-a22f-11ed-b63b-5f92e7d2e73a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LvwyuiccdLpsKc4WckWj6G4ZADxbfwCdjbS5d69Yl+kDuGLGC3TvR8RH2hQkPnBL0+SX5PMC2bQqCbLOLoFA7gPXmB/kaZgiolCXwMpJpQU2bixpU+qvVsQ00jYZoWW8KPQ3q8C6Z2frcvk0D0i7oEIHwd8taVnf3Yk75NUOulJlDy+cC1usFx0H1tdevzEqywY8TGhfePQtgBhc8J4j5cUF0ImjeTvUDUijn6ciGkhQzHv7XInIT7pNv1H+f75LuI1xqufjG/iqG+feDbZ1a0a4CiFBiIx2QAfX/9mfEpby7REsMikDTnB/AnVBjkGWQEPKuBSwPeR1W9i7q7nykg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WvqYw0/lNPG2MdgZ9v8aXe2CpdozdWz6QrasYdhRl5A=;
 b=apwarLKg0qk/YSn8PsrJNNzWc8E4mLgdIEOEzw6bRYqToqigI6I0XAiVIshwgAwNKAPEbh+mJ0mhdfn/fAqrSHyesHKzjOc4wTqai3HplBFatdd4U+3BlF3SHgqqo2mx8JBX4byQPm8BCzShorRXE4zCJ2NBtyv4lax4uUGcHOH1ZsmfASrc9pNj4svZe8F1g0KvAYmS41PfXbkGayEkQSTnPxBXAH5rNz0cxllHKS2cHgJhXT0RQPeMx7aqBhxYMuLnSrod2UOrbbZyKG3NJuV4I0JXp5tcET7nfEcF6vP4k0g51KBrGET0bKBvYXnLrS4f11SanDgivarxwAam5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvqYw0/lNPG2MdgZ9v8aXe2CpdozdWz6QrasYdhRl5A=;
 b=41PKH6kBk0wM7vLSYPW1ZIUliv3ny5m/k86+2WLukdj2chI7IRDbp2kqqbHwWDENIhY8Kn4BGGKKCmz4fanPMGugvD1YvLde/jIifhjqMMfVi520qfr7KpWK4swSBo6Nsk1tdbg9fTWeu7Q81v0gOe5sViAwPQhTxdrbUcJpWRo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <bbb9e223-5112-4370-d569-c78b6ab609a8@amd.com>
Date: Wed, 1 Feb 2023 13:56:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] xen/arm: Add support for booting gzip compressed
 uImages
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<ayankuma@amd.com>
References: <20230131151354.25943-1-michal.orzel@amd.com>
 <20230131151354.25943-3-michal.orzel@amd.com>
 <653d05c1-a860-052c-4ce2-55998c77db42@xen.org>
 <442d7e6b-9b51-69bc-48ea-c844427a4a97@amd.com>
 <f45dfe55-ca51-7aa0-ef9a-2788cfead470@xen.org>
 <7c09b900-6568-e57d-3256-2cf72a73690c@amd.com>
 <6d3638e0-5613-ee7b-d919-1db3cd0ca2fb@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <6d3638e0-5613-ee7b-d919-1db3cd0ca2fb@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT010:EE_|CH3PR12MB7739:EE_
X-MS-Office365-Filtering-Correlation-Id: a8997248-9c50-4ce5-e502-08db0453cd83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Rjy8ZrcqC5UlpEbd5pkRAiczCudkympnTfHpZ8aM9WwjpN7yxsugEsTP39pzdl8BlJZWjuQ6nWRxC3cfzcuehmVC44mmcgVtKzWiwlw1mois7XJOr3q03KIva0PzBhV+RjnZiZPALRTaLtJkeveUwo63nU8IrO8j5FlI2Ird7SNFHNEUB8RbJZYA0geqZCkmqBRD3YKppUnJdA+8Tg4y1sr9rA/+t2DmTh797ne2GruaB8GrlkGpQ+n1lCkNWjALqM5MrksJCdRE5Fm5SV4JNxAxx4TqCUSGAWAfwKm21Nx8JUaivF358HekURYZCc/3gCuxGgCiyyFrP0tuM7c8fUY/s9TfMn8xvS06Agoziq2j5xWCFO0HY2gcfglmsNSQr+e4CkFF/uIhqJsQ61f/JwUih2a6+bokZySSHvK5qcSYlL/eTRyrjYnRZq53jJ3r8k/54kUbpFp6+Wx9O39U8QBVkNti0jaqkV69HvJ7aqfP/gjBHyHyiAjxJgXZdZfnhqtJIVk4rZJKgDsTwIjl7jhJtzkGqSJz8jRk4x5FXlF9poASddDJso6AheWob6xJw4HW9L8T0oVewyp4UiO+K5jUJg8ku8y5+3CAfRtt9/Cumywfrn1JbbZOpFb1kHqGySgvt2Qah21/7/1jjImEAIEUUZvB1KeWiABcRDamvKK5FxhehUVt7nw8cs/KOj++ItxEFYDaioDGKFKRl1rUreopDZYETCsLwonzARGuAWj6y8B/Envlar1nWhW4WR323Vib5KL5LiOE3Dz/i1jZMQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(39860400002)(346002)(376002)(451199018)(36840700001)(40470700004)(46966006)(36860700001)(44832011)(81166007)(40460700003)(41300700001)(478600001)(86362001)(31696002)(40480700001)(110136005)(16576012)(316002)(356005)(70206006)(70586007)(4326008)(8676002)(54906003)(186003)(26005)(8936002)(36756003)(53546011)(82740400003)(5660300002)(47076005)(426003)(83380400001)(82310400005)(31686004)(2616005)(2906002)(336012)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 12:56:57.8574
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8997248-9c50-4ce5-e502-08db0453cd83
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7739

Hi Julien,

On 01/02/2023 12:20, Julien Grall wrote:
> 
> 
> On 01/02/2023 11:01, Michal Orzel wrote:
>> I would prefer not to do this in this series as the goals are different. This series is to remove
>> the known Xen limitation.
> 
> The reason I am asking is it effectively change the way you would
> implement. If we were going to support zImage/Image within uImage, then
> we would need to fallthrough rather than calling kernel_decompress().
> 
> I am not aware of any at the moment. Better asking now than realizing
> after the fact that there is a need...
We need uImage support as there is more and more need to support booting
raw images of some RTOSes (there is always additional concern \wrt booting requirements
but at least the header allows to try to boot them). We are not aware of any need
to do some special handling to parse more than one header + from what I said earlier,
this is an unusual approach not seen to be handled by anyone.

> 
>>>> This could be solved by doing (not harmful in my opinion for common case)
>>>> addr &= PAGE_MASK.
>>> I don't quite understand your argument here. We need a check that work
>>> for everyone (not only in the common case).
>> As we assume the kernel module is at page aligned address (otherwise the issue you observed
>> can happen not only in uImage compressed case)
> 
> I am not aware of such assumption. It is allowed to use non page-aligned
> address and it is correct for Xen to not free the first part if it is
> not page aligned because the first part may contain data from another
> module (or else).
> 
>> , having a check like
>> this is generic. I.e. for normal usecase (no uImage compressed), addr &= PAGE_MASK
>> does not modify the address. For uImage compressed usecase it causes the addr to get
>> back to the previous value (before we added header size to it).
>>
>> Apart from the addr, we need to pass the correct size (as we extracted header size from it).
>> We could have the following (with appropriate comment):
>> size += addr - (addr & PAGE_MASK);
>> addr &= PAGE_MASK;
>> fw_unreserved_regions(addr, addr + size, init_domheap_pages, 0);
>>
>> It does not look great but solves the uImage issue and does not modify
>> the previous behavior. Anyway, I'm open for suggestions.
> 
> Two options:
>   1) Move the call to fw_unreserved_regions() outside of
> kernel_decompress().
>   2) Pass the offset of the gzip header to kernel_decompress().
> Something like where it would be  sizeof(uimage) in the uImage case or 0
> otherwise.
> 
> I have a slight preference for the latter.
That is cool.
I'm in favor of this as well because it would allow not to set mod->start,size
from kernel_uimage_probe. Everything can be done in kernel_decompress:

Diff:

-static __init int kernel_decompress(struct bootmodule *mod)
+static __init int kernel_decompress(struct bootmodule *mod, uint32_t offset)
 {
     char *output, *input;
     char magic[2];
@@ -201,8 +201,14 @@ static __init int kernel_decompress(struct bootmodule *mod)
     struct page_info *pages;
     mfn_t mfn;
     int i;
-    paddr_t addr = mod->start;
-    paddr_t size = mod->size;
+
+    /*
+     * It might be that gzip header does not appear at the start address
+     * (i.e. in case of compressed uImage) so take into account offset to
+     * gzip header.
+    */
+    paddr_t addr = mod->start + offset;
+    paddr_t size = mod->size - offset;
 
     if ( size < 2 )
         return -EINVAL;
@@ -250,6 +256,13 @@ static __init int kernel_decompress(struct bootmodule *mod)
     for ( ; i < (1 << kernel_order_out); i++ )
         free_domheap_page(pages + i);
 
+    /*
+     * When freeing the kernel, we need to pass the module start address and
+     * size as they were before taking an offset to gzip header into account.
+     */
+    addr -= offset;
+    size += offset;
+
     /*
      * Free the original kernel, update the pointers to the
      * decompressed kernel

> 
> Cheers,
> 
> --
> Julien Grall

~Michal


