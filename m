Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F5164E8A0
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 10:31:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464258.722598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6736-0005Xl-VG; Fri, 16 Dec 2022 09:30:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464258.722598; Fri, 16 Dec 2022 09:30:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6736-0005VG-Rg; Fri, 16 Dec 2022 09:30:36 +0000
Received: by outflank-mailman (input) for mailman id 464258;
 Fri, 16 Dec 2022 09:30:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PP9E=4O=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p6734-0005VA-Hv
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 09:30:34 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 490f5f17-7d24-11ed-91b6-6bf2151ebd3b;
 Fri, 16 Dec 2022 10:30:32 +0100 (CET)
Received: from DS7P222CA0007.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::24) by
 DS7PR12MB5885.namprd12.prod.outlook.com (2603:10b6:8:78::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.19; Fri, 16 Dec 2022 09:30:29 +0000
Received: from DM6NAM11FT074.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2e:cafe::ca) by DS7P222CA0007.outlook.office365.com
 (2603:10b6:8:2e::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.15 via Frontend
 Transport; Fri, 16 Dec 2022 09:30:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT074.mail.protection.outlook.com (10.13.173.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.15 via Frontend Transport; Fri, 16 Dec 2022 09:30:29 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 16 Dec
 2022 03:30:27 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 16 Dec
 2022 01:30:16 -0800
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 16 Dec 2022 03:30:15 -0600
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
X-Inumbo-ID: 490f5f17-7d24-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QY3tboN7fz8DV5qt3OWtHQH6XTQ1X5YdMcjfdyaGdd7rUhycD+1Pm1YIqfQ25P7HxNFI9bmdHMWsQQT/Fpa7WPDrlEPBtFYS3WFKq049sIfH/RoAud9gqtY7FYrNKru0kN1bZbJrGk8qVAHyDPzNuahV5p10K7AjQHjlApYFVnribKK4OSVIbjaM/CZ56GXzG6zSPPlU6Z3pJtqrokK7wS/2UUXvvp22sq1lgrEYazS7GZGp/JXbu9/222748B7vZefGv9p/d1Yhq727wjv9Sz+fK3Q2QnvWuoHsqlj/+2WSxbfAMNTlhd2fszXGi9zcqp/C9t2DDHOfaYYABcaH4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=20TEK8Yja4dovbT41oQYdC3wJuGtpe9t9FoV9SK5oeA=;
 b=KDAWj800XPm3hmYysfZMXiFLCcOEVO2CSjLuGq2AaY637bPsaDZHu7k9d3jx8eA9y4uv9p0D0/TN+ylkuQgPCUU1xtbxqRbL5OSOENi2Sk9fvgC45j6mrUSvdcPYGiExA0GBGjYAfS1DxpFo1rP9r9FkxL5pExeLs97V2C8Jl0efih2FxaClzHyZDAVJYQF9PAAl2WzFfVQswhKmud/kQDnsjVLvs93yJopaT8/fFe/nH0zjSTUQqgKpdvwqiquUYu4LFCQDpcmaczM8ECX6/HtRQpP8oObXleYmrNpreKYOJB/kJxJh5CytK0kPh0CrAjYEWkvkRVzF0jXXpAp+4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=20TEK8Yja4dovbT41oQYdC3wJuGtpe9t9FoV9SK5oeA=;
 b=wdNJZf9eFEo+UAo0GwBpzKiKsgBqZiGs8LQdIdRrdBDsSgKtnh50Ogbhzl2ieXq64p9GtAfoWlfrvux9IB6S06flw66JEkCtlof1+y0GjmQDSrsu4DajSdd10gZy4cXO63q8C/ZduW3jEQnhVNssomuwrYctrbYxZmT+1SmGuy8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <235eaf7f-5b59-e8de-8657-ce9d202365c1@amd.com>
Date: Fri, 16 Dec 2022 10:30:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [XTF-ARM] tests: Hypercall xen_version testing
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: <sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>
References: <20221215152511.10194-1-michal.orzel@amd.com>
 <58a87888-e839-8a5d-0e7f-7520e5e2c78a@suse.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <58a87888-e839-8a5d-0e7f-7520e5e2c78a@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT074:EE_|DS7PR12MB5885:EE_
X-MS-Office365-Filtering-Correlation-Id: db64824f-5df8-44c2-13cf-08dadf482c38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9f7YnSzxiUMUXnK2XL0/uH4BCyJAAgKUMMlVt5EIUo/poiFepOjcWdM2+w4+Zeyb0kyyRTIO3V23gqfwF2GpQAZ0j1t9xY38VQFMAhA+2CbW0EfZMSWT/9MmShoz1a16eOV1TMO4wQ/kCIVV7TXWD3aSqGw5k8uSuYmzbpff9zi86QkIxt6uwvyFvGcEO33g4hu6iV5g5mFdcIFg7GfNkER/WBHKfpN8KUeb/28H4VbfL/DYrMGEmI1HLidumJze8DXi0QCbzZNVOn24VwBBh2d+MqvQT9cs3A6RV60T1IdLQp189HCzLdZiJOPfRYbtbIHj9+MNikjXjUi+oJ8E0WFPV5vgJiaWFdavzGoEn05uWXZ0ZUIhzW7MJDcl2N4jDHDv9BCuJmS8cTJa/7WJo231ZcmpbikaI+yIkB/g+PMnzR1h+qIkNUgOmxc8aoWsYWOAtamaECQtBnyjgNCWhzLLrReeOB7Omq1qJIN8OZPvRZkQ+Gcq8Gonz9pZSLo4NkzREt13iVC0YZUYawoVmbFxY74w9ff2wInjYbiNmjjPr5DF59Oi9RI8cp7rPu/4LcsW4r0t6WOno77WJgS2BC4JzGrChrL89ZUfYMKcxO+hnInUKZ7VVJyq1kJZjkKBTWnjFyza64WcuCh0JWe/SoeTgu7CjuUmN2Yin68fVbZxxG3Du9HoS4McL8mhXGw4oxxFuZtRYyosG1uePB/96PnlWE4QabdZ+Cu0jAnGXTyZnEqWz+YaMXcf1l0ffmf2jUHFq73itVoCC3Cnco8VZA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(136003)(396003)(346002)(451199015)(46966006)(36840700001)(40470700004)(8676002)(5660300002)(8936002)(70586007)(36756003)(4326008)(53546011)(41300700001)(186003)(70206006)(26005)(478600001)(16576012)(82310400005)(47076005)(316002)(83380400001)(54906003)(6916009)(2616005)(426003)(40460700003)(82740400003)(336012)(31696002)(86362001)(31686004)(40480700001)(356005)(81166007)(44832011)(36860700001)(2906002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 09:30:29.8077
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db64824f-5df8-44c2-13cf-08dadf482c38
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT074.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5885

Hi Jan,

Thanks for the feedback.

On 15/12/2022 16:48, Jan Beulich wrote:
> 
> 
> On 15.12.2022 16:25, Michal Orzel wrote:
>> Add a new test hyp-xen-version to perform functional testing of
>> xen_version hypercall. Check the following commands (more can be added
>> later on):
>>  - XENVER_version,
>>  - XENVER_extraversion,
>>  - XENVER_compile_info,
>>  - XENVER_changeset
>>  - XENVER_get_features,
>>  - passing invalid command.
>>
>> For now, enable this test only for arm64.
> 
> What's wrong with exposing this uniformly?
There is nothing wrong. I can remove the ARCH restriction.

> 
>> --- /dev/null
>> +++ b/tests/hyp-xen-version/main.c
>> @@ -0,0 +1,105 @@
>> +/**
>> + * @file tests/hyp-xen-version/main.c
>> + * @ref test-hyp-xen-version
>> + *
>> + * @page test-hyp-xen-version Hypercall xen_version
>> + *
>> + * Functional testing of xen_version hypercall.
>> + *
>> + * @see tests/hyp-xen-version/main.c
>> + */
>> +#include <xtf.h>
>> +
>> +const char test_title[] = "Hypercall xen_version testing";
>> +
>> +#define INVALID_CMD -1
>> +
>> +void test_main(void)
>> +{
>> +    int ret;
>> +
>> +    printk("Checking XENVER_version:\n");
>> +    {
>> +        /*
>> +        * Version is returned directly in format: ((major << 16) | minor),
>> +        * so no need to check the return value for an error.
>> +        */
>> +        ret = hypercall_xen_version(XENVER_version, NULL);
>> +        printk(" version: %u.%u\n", ret >> 16, ret & 0xFFFF);
>> +    }
>> +
>> +    printk("Checking XENVER_extraversion:\n");
>> +    {
>> +        xen_extraversion_t xen_ev;
>> +        memset(&xen_ev, 0, sizeof(xen_ev));
>> +
>> +        ret = hypercall_xen_version(XENVER_extraversion, xen_ev);
>> +        if ( ret < 0 )
>> +            return xtf_error("Error %d\n", ret);
> 
> This, ...
> 
>> +        printk(" extraversion: %s\n", xen_ev);
>> +    }
>> +
>> +    printk("Checking XENVER_compile_info:\n");
>> +    {
>> +        xen_compile_info_t xen_ci;
>> +        memset(&xen_ci, 0, sizeof(xen_ci));
>> +
>> +        ret = hypercall_xen_version(XENVER_compile_info, &xen_ci);
>> +        if ( ret < 0 )
>> +            return xtf_error("Error %d\n", ret);
> 
> ... this, and ...
> 
>> +        printk(" compiler:       %s\n", xen_ci.compiler);
>> +        printk(" compile_by:     %s\n", xen_ci.compile_by);
>> +        printk(" compile_domain: %s\n", xen_ci.compile_domain);
>> +        printk(" compile_date:   %s\n", xen_ci.compile_date);
>> +    }
>> +
>> +    printk("Checking XENVER_changeset:\n");
>> +    {
>> +        xen_changeset_info_t xen_cs;
>> +        memset(&xen_cs, 0, sizeof(xen_cs));
>> +
>> +        ret = hypercall_xen_version(XENVER_changeset, &xen_cs);
>> +        if ( ret < 0 )
>> +            return xtf_error("Error %d\n", ret);
> 
> ... this can fail because of XSM denying access. (Others can of course
> also fail for this reason, but here possible failure is kind of
> "intended" - see the dummy xsm_xen_version() handling.) Therefore I
> would like to suggest that you also special case getting back -EPERM,
> resulting in e.g. just a warning instead of an error.
When writing a test I did make sure to check xsm_xen_version *for the operations that I covered*
and my understanding is as follows:
For XENVER_version and XENVER_get_features, it returns 0 so deny is false.
For other commands I test, xsm_default_action is called with XSM_HOOK which returns 0 as well.
So AFAICT nothing can result in setting deny to true.
But even in case of setting deny to true, it would just result in copying "<denied>" into
the respective buffer. It would not alter the hypercall return value.

The only command causing the return value to be -EPERM in case deny is set to true is XENVER_build_id
which I did not covered in my test.

> 
> Jan

~Michal

