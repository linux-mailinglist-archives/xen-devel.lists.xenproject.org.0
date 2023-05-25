Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 169F671150B
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 20:44:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539815.841058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2Fwb-0004ze-EG; Thu, 25 May 2023 18:44:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539815.841058; Thu, 25 May 2023 18:44:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2Fwb-0004xF-Bf; Thu, 25 May 2023 18:44:13 +0000
Received: by outflank-mailman (input) for mailman id 539815;
 Thu, 25 May 2023 18:44:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x5Sm=BO=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1q2Fwa-0004x9-3b
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 18:44:12 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 224c86de-fb2c-11ed-b230-6b7b168915f2;
 Thu, 25 May 2023 20:44:10 +0200 (CEST)
Received: from MW4PR04CA0198.namprd04.prod.outlook.com (2603:10b6:303:86::23)
 by BL3PR12MB6594.namprd12.prod.outlook.com (2603:10b6:208:38d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Thu, 25 May
 2023 18:44:07 +0000
Received: from CO1NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::65) by MW4PR04CA0198.outlook.office365.com
 (2603:10b6:303:86::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17 via Frontend
 Transport; Thu, 25 May 2023 18:44:06 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT014.mail.protection.outlook.com (10.13.175.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.17 via Frontend Transport; Thu, 25 May 2023 18:44:06 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 13:44:02 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 13:44:01 -0500
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 25 May 2023 13:44:00 -0500
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
X-Inumbo-ID: 224c86de-fb2c-11ed-b230-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TgWISFYeUtJBes0bFYE7R/AyboaVBXe+PsBVo6XGEEecYVET4P1Vg2c4DhpO0mdYM1o8wwrkg3FMa1D98WxmdzHms8kzler2s2HDsv5RKoKTDUD7RrvoCD3DPgddoX+ktWGdxOXH+hbKnMYPwgEpxabdxw8xvrtd0nfmHwFwmLWDPiqRddTgECh+MKzIkJXpIY7GMf1u64OLGp7jRxMZGFVw03JeBYpZ1DO/sebXgVfslugHRJdkteIIR9xu9EJ/wLDmLQ8FzjfdNQZEA3j9FVaoVRnXi1t6eQ42aYyq+RUxUK0+3Skg8rT5xBXWKxWDybe1ufieXVvWoZ+bMJovpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53IppQY8P00JUZOEakZOn5qLBVo1mulM6P3qTzEkU3E=;
 b=JNps74dxtQDk/afS8DlQ7oDXHXWfOevYQk0blHpLn8VaogllHh0ETQQzdg0X5F6CVf19B1Jx5b5KR+mxARQR0KV8yIllRkxcT6DrO3DIXB/MB3ARTlqqRq7ddK774y0xm8Ws7m12K9vqt1JsW64WhbLAjGJwL/kihBjBU2Gm4BKkZ6vwVVV7cgyFVnMNOGsf+X3gXj7OEU8LAcFfgQcn5yTzRKUThDXBHiY2EOEui5ZxsA+C7pcYdP6ALvRRa+kSwwZIca+lTsEGm8VRhpDnA8kT83zE8Ro8KuagszANiKJ60XTKJVIz6cMMmr4bbOxq/ejmi9LpRgvRIZ2KsNDfEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53IppQY8P00JUZOEakZOn5qLBVo1mulM6P3qTzEkU3E=;
 b=0/K3NRaXTQ/nDPUCeCTF9ihx0HRL/ESSiyEI9Hux1khaE4u8EYhPnAG6rM5l2dw2xyoCwyizFkF01QeGj5702PTbKGHQmdHKceDsrRYfpqeMoFotJIUG4LrSb3s96BmuhAvvLGaLRUKegYRKorHlY76btDouPyMxz5UNJEbuUMc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <c27e63fc-1952-6c90-158e-987274e78d6a@amd.com>
Date: Thu, 25 May 2023 14:43:59 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] xen/arm: un-break build with clang
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>
References: <20230525175115.110606-1-stewart.hildebrand@amd.com>
 <45621f03-2d3e-f208-1d0c-018479b5e8ef@citrix.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <45621f03-2d3e-f208-1d0c-018479b5e8ef@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT014:EE_|BL3PR12MB6594:EE_
X-MS-Office365-Filtering-Correlation-Id: 55fa35f9-7c27-416f-9c50-08db5d5004c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7XdkTIcFQGacXHVNqp80cuXtLp4dmbqJYfE+p2E8/wZvHbILCAVxAb7quufubArTvKm4TMZvY0449hioT+uZmBu+9FV8rCpEa6g10Tk7FIYpLBqmC7QWJff7TOl4o3IwVo8o8+BV1ZRs+PJo0B9nZ3M7fOvpGLiUd8psMhbVcYriaJkDQK++yzbbfrG5XW5Fgy7g7osT5Qekrf+BZ27PnmkgjhrVl67UEqFQ8TPaIQYi5dUjZ771Rpr2wRdPK9gZaVs3JW9hKHALt33pt/X5g5AgdZHF03xDd5xfNYhavFZq/fe07STLlHvrvOLsQcq+E7ax9GvmmVwJEtj9ZtItQkJ6x9v3AGcpCzvPCouEZ44l95rDseiYh9VFeTKCD123tJFzSMAqTDcuhUlR/l4yB6HKLCUEDxkoVDT01+F+y9ryJbYHy5XJdfT6cvbREBdWSvoOycKVrAiSc5bLs3j0jRhcPb0vqnbSRN9h/9/m3hZmyHXqe4bks39e4yVGgGr+2e0BGm6fIsdzrp6rYIT2rIsiZVCOf79Mwen4vtHmhH+Yy/FX5vajzsB4Zgcc+nXbUygRCR5xu0XSVAFTFg+byPuwWZl8EhLPRS7fkvQ/sAiL9l1RVtXgUCyim+JaZTztAtto0h3IppX38UboEsS/GQgf6HV0UXIFy4miR7FpYDa0As23NO8SB4lcSqYFWF62via83vWZsw/hNduCelcC00yp7OqSwDvYeY/QUpuT3sh76n98BtTi4FAbkXdFTxtuOWdvM/VtcrU30lS3bv5h+1njJQ0ZRddRUOuzCMZIqles1H6rvaF6llpuZ3kxKLPC
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(396003)(376002)(39860400002)(451199021)(36840700001)(40470700004)(46966006)(31686004)(82310400005)(36860700001)(336012)(426003)(356005)(44832011)(81166007)(36756003)(86362001)(31696002)(40460700003)(82740400003)(8676002)(47076005)(316002)(41300700001)(40480700001)(8936002)(70586007)(4326008)(2906002)(186003)(53546011)(5660300002)(478600001)(70206006)(54906003)(26005)(110136005)(2616005)(16576012)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 18:44:06.0517
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55fa35f9-7c27-416f-9c50-08db5d5004c8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6594

On 5/25/23 14:05, Andrew Cooper wrote:
> On 25/05/2023 6:51 pm, Stewart Hildebrand wrote:
>> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
>> index 38e2ce255fcf..af53e58a6a07 100644
>> --- a/xen/arch/arm/include/asm/setup.h
>> +++ b/xen/arch/arm/include/asm/setup.h
>> @@ -168,13 +168,13 @@ u32 device_tree_get_u32(const void *fdt, int node,
>>  int map_range_to_domain(const struct dt_device_node *dev,
>>                          u64 addr, u64 len, void *data);
>>
>> -extern DEFINE_BOOT_PAGE_TABLE(boot_pgtable);
>> +EXTERN_DEFINE_BOOT_PAGE_TABLE(boot_pgtable);
> 
> The problem is using DEFINE_$blah() when you mean DECLARE_$blah().
> They're split everywhere else in Xen for good reason.
> 
> But the macro looks like pure obfuscation to start with.  It should just
> be a simple
> 
> extern lpae_t boot_pgtable[XEN_PT_LPAE_ENTRIES];
> 
> The declaration shouldn't have an alignment or section attribute on, and
> deleting the macro makes the header easier to read.

This indeed makes much more sense. I will send v2 with simplified extern declarations.

To clarify, the definitions in xen/arch/arm/mm.c are to remain unchanged.

