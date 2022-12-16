Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C79C464E9CB
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 11:54:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464374.722753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p68Lg-00041z-3o; Fri, 16 Dec 2022 10:53:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464374.722753; Fri, 16 Dec 2022 10:53:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p68Lg-0003zu-0M; Fri, 16 Dec 2022 10:53:52 +0000
Received: by outflank-mailman (input) for mailman id 464374;
 Fri, 16 Dec 2022 10:53:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PP9E=4O=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p68Le-0003zo-Mo
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 10:53:50 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cbc55ecb-7d2f-11ed-8fd4-01056ac49cbb;
 Fri, 16 Dec 2022 11:52:56 +0100 (CET)
Received: from BN9PR03CA0477.namprd03.prod.outlook.com (2603:10b6:408:139::32)
 by IA1PR12MB6305.namprd12.prod.outlook.com (2603:10b6:208:3e7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Fri, 16 Dec
 2022 10:53:44 +0000
Received: from BN8NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:139:cafe::ef) by BN9PR03CA0477.outlook.office365.com
 (2603:10b6:408:139::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.15 via Frontend
 Transport; Fri, 16 Dec 2022 10:53:44 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT050.mail.protection.outlook.com (10.13.177.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.15 via Frontend Transport; Fri, 16 Dec 2022 10:53:44 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 16 Dec
 2022 04:53:44 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 16 Dec
 2022 04:53:44 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 16 Dec 2022 04:53:43 -0600
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
X-Inumbo-ID: cbc55ecb-7d2f-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RNDUPN9/swBpdOxB3TcZW9lbKftkoHXSbJxPbAjP2+6Gbv/+t9EFNxG0LbGm8zBM/XvnRPY9hfYaKXAMRg8OTg/m3MGUAFCe3D/5pl6DohErpDNWZyidDtzmY+NTFfIs5ejjlEXANziPSwkLrkoP2ER2PdMFl1hBBapxGG6MwVT1I93fkHqTguSQhkF8hataosLXtiwyYeJITfDbUjgN0WfEyVPo0VIp+lbVm56dnb5fwUOQt5AkKNMaYA1HoK0QAjCnrIG5ZhLKz870pAACcqyNNBr99K+wmJSiIKwI26BNEPl0eb6o7wZmXTM4+hdrl1Rb1psclkFUSyjVhF9Eig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrG+Ru6g+bZ2ek+EHqZeGnz+8LnPzwUMgEKAmA+DmQU=;
 b=bZHTVaqaF7hKXuPgQVwBKhP6hV0uL1p4jYb9SHSn1Aas5umm2fBEEQR8Ki9un/Z4mrjfMiMB2HjCk/yPHUkhkmPhqCiQAPJdxCtVF2JsvI0UpU13vTEgllIXmWD+4M5o/YmNtxEFQNqcGj/IcgIITj3BZFjDYwqiB56+y2ZWJaQnXp8QU0Uzy0hZLhOPv+7zZIrfurmj33A2WQkkY/BZIL7A31MJiokX61hQYMlZCS0TmX7IE5bmujdE/yBxeJnXapJjPLBp93ZbKZmhXa52Ts4d8W4tDH/9knJvEylw/YB/9qegX7J6k23XnZ8CmUjHNiIr/uSdp2qA5NQTr02ihQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrG+Ru6g+bZ2ek+EHqZeGnz+8LnPzwUMgEKAmA+DmQU=;
 b=Qk550pj7hWb39WZ1DI2xHLc4I/eR/+s0w0NQGeqp2+UHF/PBuAF0mRb/2yxZK34SquoAPjCr+hrMHM4eEo1Zli0EMz3p9Dcq8KjzFrI5YavSzpSBDXy9XCRvCuqKZ1PIODW6+I/mXsYCNs9ydewnPJ1MK2c4OBu5zm2bviIyAuo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <22696c5b-f9cf-fddd-77aa-79f1c28f1cd9@amd.com>
Date: Fri, 16 Dec 2022 11:53:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [XTF-ARM] tests: Hypercall xen_version testing
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: <sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>
References: <20221215152511.10194-1-michal.orzel@amd.com>
 <58a87888-e839-8a5d-0e7f-7520e5e2c78a@suse.com>
 <235eaf7f-5b59-e8de-8657-ce9d202365c1@amd.com>
 <219f3764-dade-7ef5-fbd7-fa9d2ae20d8c@suse.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <219f3764-dade-7ef5-fbd7-fa9d2ae20d8c@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT050:EE_|IA1PR12MB6305:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d4bfb7b-66f8-4e47-ca2d-08dadf53cd63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rBAseJZXZEi9PP76MWxzNVxuCV7mmw9P4p1g2t1/du4HodcrQDz3s6R9bBDKGEIJqSc19cTNakiqD7w/sDAJZTU241MBCZ0vwiWKij2PNCFQgK1v2cvPGQEWOxSJN/ZeXTAvWJOecC/zZhL1pXxsmjHwzp9hzz44cIb+5O4w9sksi+XBUbge7aQMhvBv/HDZ3EYU3apgK2xRQoIl7ljWQq7MBY0w+YRenCIMsXC9qeG9QjVzvJFZ1im4QX7gP7uOJVi3VwYe0X+aZZQjgVenZAtAEITo7VEBYUnKfyd7YvICNKYH+Cmjuwt5TB5Wxl0eX7o5gjJ5KcI9X5hYTruvfhBIINUTRriScZnM+mbUTKMSJfpPj3SOaaYBqvKsqBOqxVCDhmvc5O3o2D7wdgJHDCHn4jjRhPuKNmT/DkFu029V7pV6CIGGCCF/SRg2+neOjJWprzTIUcZebsyXj4yUJsSbvLeZY4N7TmhAWVBbWp1vjvxjZOdlZf7v6ao+kF0w/g1oPrHtMassD0Qwavlg/AykSoWTMaNWKAgvRaGO74sjlRMO5M+Ea8EpfkrFdgYfE0qLmcE0aGl2cCaS9mejz4+T7vAnHJXALFdEhgzJOB22vlBjJtN4/gdN6U4q6Qz9VwCiGJ/V2gMSyHzqiYcHLyR23LacNMcphEIp4CAqIlWb3Z/bSrGrUel9ZAbnOtPQhUfqbCftLG8DiI0t0+SQj6iwuMYF0xPumwOiY4cWW+4qfVs1I9VJpeXz5aoeROwZE9/ar0KrwEHrSELMHzvL4A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(396003)(39860400002)(346002)(451199015)(36840700001)(40470700004)(46966006)(40460700003)(36756003)(31686004)(70206006)(16576012)(70586007)(4326008)(6916009)(44832011)(40480700001)(8676002)(36860700001)(2906002)(54906003)(316002)(82740400003)(81166007)(31696002)(86362001)(356005)(83380400001)(2616005)(186003)(26005)(53546011)(336012)(5660300002)(8936002)(41300700001)(82310400005)(426003)(478600001)(47076005)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 10:53:44.7026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d4bfb7b-66f8-4e47-ca2d-08dadf53cd63
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6305



On 16/12/2022 11:21, Jan Beulich wrote:
> 
> 
> On 16.12.2022 10:30, Michal Orzel wrote:
>> On 15/12/2022 16:48, Jan Beulich wrote:
>>> On 15.12.2022 16:25, Michal Orzel wrote:
>>>> --- /dev/null
>>>> +++ b/tests/hyp-xen-version/main.c
>>>> @@ -0,0 +1,105 @@
>>>> +/**
>>>> + * @file tests/hyp-xen-version/main.c
>>>> + * @ref test-hyp-xen-version
>>>> + *
>>>> + * @page test-hyp-xen-version Hypercall xen_version
>>>> + *
>>>> + * Functional testing of xen_version hypercall.
>>>> + *
>>>> + * @see tests/hyp-xen-version/main.c
>>>> + */
>>>> +#include <xtf.h>
>>>> +
>>>> +const char test_title[] = "Hypercall xen_version testing";
>>>> +
>>>> +#define INVALID_CMD -1
>>>> +
>>>> +void test_main(void)
>>>> +{
>>>> +    int ret;
>>>> +
>>>> +    printk("Checking XENVER_version:\n");
>>>> +    {
>>>> +        /*
>>>> +        * Version is returned directly in format: ((major << 16) | minor),
>>>> +        * so no need to check the return value for an error.
>>>> +        */
>>>> +        ret = hypercall_xen_version(XENVER_version, NULL);
>>>> +        printk(" version: %u.%u\n", ret >> 16, ret & 0xFFFF);
>>>> +    }
>>>> +
>>>> +    printk("Checking XENVER_extraversion:\n");
>>>> +    {
>>>> +        xen_extraversion_t xen_ev;
>>>> +        memset(&xen_ev, 0, sizeof(xen_ev));
>>>> +
>>>> +        ret = hypercall_xen_version(XENVER_extraversion, xen_ev);
>>>> +        if ( ret < 0 )
>>>> +            return xtf_error("Error %d\n", ret);
>>>
>>> This, ...
>>>
>>>> +        printk(" extraversion: %s\n", xen_ev);
>>>> +    }
>>>> +
>>>> +    printk("Checking XENVER_compile_info:\n");
>>>> +    {
>>>> +        xen_compile_info_t xen_ci;
>>>> +        memset(&xen_ci, 0, sizeof(xen_ci));
>>>> +
>>>> +        ret = hypercall_xen_version(XENVER_compile_info, &xen_ci);
>>>> +        if ( ret < 0 )
>>>> +            return xtf_error("Error %d\n", ret);
>>>
>>> ... this, and ...
>>>
>>>> +        printk(" compiler:       %s\n", xen_ci.compiler);
>>>> +        printk(" compile_by:     %s\n", xen_ci.compile_by);
>>>> +        printk(" compile_domain: %s\n", xen_ci.compile_domain);
>>>> +        printk(" compile_date:   %s\n", xen_ci.compile_date);
>>>> +    }
>>>> +
>>>> +    printk("Checking XENVER_changeset:\n");
>>>> +    {
>>>> +        xen_changeset_info_t xen_cs;
>>>> +        memset(&xen_cs, 0, sizeof(xen_cs));
>>>> +
>>>> +        ret = hypercall_xen_version(XENVER_changeset, &xen_cs);
>>>> +        if ( ret < 0 )
>>>> +            return xtf_error("Error %d\n", ret);
>>>
>>> ... this can fail because of XSM denying access. (Others can of course
>>> also fail for this reason, but here possible failure is kind of
>>> "intended" - see the dummy xsm_xen_version() handling.) Therefore I
>>> would like to suggest that you also special case getting back -EPERM,
>>> resulting in e.g. just a warning instead of an error.
>> When writing a test I did make sure to check xsm_xen_version *for the operations that I covered*
>> and my understanding is as follows:
>> For XENVER_version and XENVER_get_features, it returns 0 so deny is false.
>> For other commands I test, xsm_default_action is called with XSM_HOOK which returns 0 as well.
>> So AFAICT nothing can result in setting deny to true.
>> But even in case of setting deny to true, it would just result in copying "<denied>" into
>> the respective buffer. It would not alter the hypercall return value.
> 
> For dummy itself all is fine; arrangements there suggest to me though
> that the intention was that an actual Flask policy may be written such
> that some of these might actually be refused. My recollection actually
> is that when the distinction for the sub-ops was introduced, quite a
> bit of discussion happened as to what may or may not be (optionally
> or uniformly) be rejected.
Ok but in any case, in the current xen_version implementation, it will just
result in storing "<denied>". No -EPERM will be returned. So do you think it
would make sense to add handling for it in the test even though it cannot be
triggered?

> 
> Jan

~Michal


