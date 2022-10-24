Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C65F760A257
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 13:41:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429019.679759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omvpX-000332-14; Mon, 24 Oct 2022 11:41:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429019.679759; Mon, 24 Oct 2022 11:41:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omvpW-00030m-UO; Mon, 24 Oct 2022 11:41:18 +0000
Received: by outflank-mailman (input) for mailman id 429019;
 Mon, 24 Oct 2022 11:41:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tdD1=2Z=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1omvpV-00030g-BW
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 11:41:17 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c38394ba-5390-11ed-91b5-6bf2151ebd3b;
 Mon, 24 Oct 2022 13:41:15 +0200 (CEST)
Received: from DM6PR17CA0011.namprd17.prod.outlook.com (2603:10b6:5:1b3::24)
 by MW4PR12MB6804.namprd12.prod.outlook.com (2603:10b6:303:20d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Mon, 24 Oct
 2022 11:41:12 +0000
Received: from DM6NAM11FT070.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1b3:cafe::9) by DM6PR17CA0011.outlook.office365.com
 (2603:10b6:5:1b3::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23 via Frontend
 Transport; Mon, 24 Oct 2022 11:41:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT070.mail.protection.outlook.com (10.13.173.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Mon, 24 Oct 2022 11:41:11 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 24 Oct
 2022 06:41:11 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 24 Oct
 2022 04:41:10 -0700
Received: from [10.71.192.110] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Mon, 24 Oct 2022 06:41:09 -0500
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
X-Inumbo-ID: c38394ba-5390-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cICzWlT9frtiiDqDDXrLdoXt3YYU0+oyvhdlJXzb0R7BmdWekNdpKzNA3LLaB5CnSkLkLp4FgRAaSZ44pIFqf3EJNFcQI5PH0wwzbSnRR2Lc+hhxOYdNtgAO9ezpSbVSh5nhgP5bmv3a3vWz2cxxbWrGsjxO+31/+wTIi5IijbLJe4juddR3+SvMiuN8ihAi3MD069QPL11LVhPOO8Qzq1L1rtMbbVRlKFQrdwIoojP0zzwirBSmaS+aazla8Gu+JaAO9bipSEK2+16m3sFTsoqTzNXjTcV7uIsNk99uRveUCIn+4DhZ69XzzusfHn6h5GQLACa3URAaqRRAT9dgnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TAsp3WKl3ZQxOWYHdKdVtkrDHaMbbXOFBlB3D9HaMFE=;
 b=HGDHa9iEcXUmwWiPjW/Qq/XVfZdJnd1nvujbx2gWth+Dqo5Muif9jpJ3wWfQez+B1uQRoSwT86JObPgkrEz6tGSc4tCBuxB4i2ge79DLPgV/G2iqrd92+iMXi3VY3q8y9ckd+8vtfZScD4RCZ8qJKFN8auM0v4mo1bcRJPa5b1MuG0fJMvE174D29terrzDocD/DMAB6qcGY7haOiNIVUF1IKy/ZB+GPyj+wBqQ4joWw6maUwzlx3BhAa9GpkKHR4ApNipabPzdAvzuZgX+uRG0WENl7I+mso6tct/rjZ9KV4r3c7R3g1bkd1Jz7UsXmznYnjnvS1mGL8A1yte+SwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TAsp3WKl3ZQxOWYHdKdVtkrDHaMbbXOFBlB3D9HaMFE=;
 b=g3Mm2pSmrlse57waxbseCN8qar9yOA1BzJARc4CUqCVb7l3GEbKSZBf21FHbYoo3mOmfc+HHUbAGFaRIDyVF/S8C8UwxWPas67GvbhGrW4SuaKgC4KESTbOMrmi0yQgFzxY4tyotLvDbZj1wiuZIgpiqA6cDnNbk8ivnNRsP3Bk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <6aefd6d6-45a2-a1f3-24da-8bbbba22fc08@amd.com>
Date: Mon, 24 Oct 2022 13:41:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: Deadcode discussion based on Arm NS phys timer
Content-Language: en-US
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
References: <d55938a3-aaca-1d01-b34f-858dbca9830b@amd.com>
 <8691e100-4548-9752-8e7e-b292643cae83@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <8691e100-4548-9752-8e7e-b292643cae83@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT070:EE_|MW4PR12MB6804:EE_
X-MS-Office365-Filtering-Correlation-Id: 1be55aee-f60b-44c0-b131-08dab5b4a656
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PK+0RVKkLvsa9cTH2rkUakH5xP6Xg64qaV3EfJFqobqR2l2TkueYrIY9ifjRiF9cmyNmOV7U9QwoBwvJF3iiIbNxDR8p2pnO5AOpV1ZgFdU6pHuyPpNP4yVPHMhm7sgQz9q4reSWzRG00RXM38ZaxJ61ySh30ss5Fyfv/eIqWZXWZOJx2HctXFvI6acRzqtC5Fhy/XpG2cUBMzhHy0EnIAR+NGLbPclar4zqIxMoO2p+NkRMdifxikRCm9OXHjdynfmb7+Uny51hceG7B4AzBt0yvKr5OWXoaB2NqkM+4wytYqyQBUc2bZsq+k6cni3njdxuCg7SCsTJ3F4ISE81rLABGH8iRnCkvD7D3EwUTX74WTigffQMXeB7Ui0++WU3yUpI1m9P/MYUmTtnk1K4MiK/yES6/1lOFMR5JInmP1xS1BzKZ2tbKtjHwpfBOl/skFYfE6iqVr8xU4KOVAvwL0S//Ngb6gSCoo020JLw9z5CoJZT+FC9TZ1v4FI3bfoRNzpVaa4+pBCl4TmuEDCmoXxsDjoCHjkx5e0A1Ny9OLgMYiKdh9Gtr8Kynyvpt6Et8wLRYu70DNfAM20KxXxjGXFZtwz/XNhLKqGsK3HH4HDOSfvDy0PABSnrJkOjpWaCeHzEuPqdtOP0Bh7N0ABlgQT2mHC/NWT91Kt4NEFldCTKJbU7uaswZj1WdrqZHhUniyIs4hmdm1cxkYvCcsKqMkNsLe2fNOlDb+6usXblpcWdSNYc7yCzAU/TfLU07Rx8QV5cFJMmU/6CozAdG3exuL617Zy/P1rJi6dVCydhIVP7ih7yBsMBc4pqKbGlnq9XaoWE/4Cn+YtFBUEWHuNa9w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(346002)(136003)(451199015)(40470700004)(46966006)(36840700001)(36756003)(31686004)(66899015)(36860700001)(86362001)(82740400003)(2906002)(44832011)(40460700003)(426003)(31696002)(336012)(2616005)(5660300002)(186003)(356005)(81166007)(83380400001)(47076005)(53546011)(26005)(316002)(16576012)(110136005)(54906003)(70586007)(70206006)(40480700001)(4326008)(8676002)(82310400005)(41300700001)(8936002)(478600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 11:41:11.5005
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1be55aee-f60b-44c0-b131-08dab5b4a656
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT070.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6804

Hi Julien,

On 24/10/2022 12:51, Julien Grall wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On 24/10/2022 10:07, Michal Orzel wrote:
>> Hello,
> 
> Hi Michal,
> 
>> Recently I came across a deadcode in Xen Arm arch timer code. Briefly speaking, we are routing
>> the NS phys timer (CNTP) IRQ to Xen, even though Xen does not make use of it (as it uses the hypervisor timer CNTHP).
>> This timer is fully emulated, which means that there is nothing that can trigger such IRQ. This code is
>> a left over from early days, where the CNTHP was buggy on some models and we had to use the CNTP instead.
>>
>> As far as the problem itself is not really interesting, it raises a question of what to do with a deadcode,
>> as there might be/are other deadcode places in Xen.
> 
> There are multiple definition of deadcode. Depending on which one you
> chose, then this could cover IS_ENABLED() and possibly #ifdef. So this
> would result to a lot of places impacted with the decision.
> 
> So can you clarify what you mean by deadcode?
In the timer example, I think we have both a deadcode and unreachable code.
For the purpose of this discussion, let's take the MISRA definition of a deadcode which is a "code that can be executed
but has no effect on the functional behavior of the program". This differs from the unreachable code definition that is
a "code that cannot be executed". Setting up the IRQ for Xen is an example of a deadcode. Code within IRQ handler is an unreachable code
(there is nothing that can trigger this IRQ).

What I mean by deadcode happens to be the sum of the two cases above i.e. the code that cannot be executed as well as the code that
does not impact the functionality of the program.

> 
>> One may say that it is useful to keep it, because one day,
>> someone might need it when dealing with yet another broken HW. Such person would still need to modify the other
>> part of the code (e.g. reprogram_timer), but there would be less work required overall. Personally, I'm not in favor of
>> such approach, because we should not really support possible scenarios with broken HW (except for erratas listing known issues).
> 
> The difference between "broken HW" and "HW with known errata" is a bit
> unclear to me. Can you clarify how you would make the difference here?
> 
> In particular, at which point do you consider that the HW should not be
> supported by Xen?
I'm not saying that HW should not be supported. The difference for me between broken HW and
HW with known errata is that for the former, the incorrect behavior is often due to the early support stage,
using emulators/models instead of real HW, whereas for the latter, the HW is already released and it happens to be that it is buggy
(the HW vendor is aware of the issue and released erratas). Do we have any example in Xen for supporting broken HW,
whose vendor is not aware of the issue or did not release any errata?

> 
>> Also, as part of the certification/FUSA process, there should be no deadcode and we should have explanation for every block of code.
> 
> See above. What are you trying to cover by deadcode? Would protecting
> code with IS_ENABLED() (or #ifdef) ok?
I think this would be ok from the certification point of view (this would at least means, that we are aware of the issue
and we took some steps). Otherwise, such code is just an example of a deadcode/unreachable code.

> 
>>
>> There are different ways to deal with a deadcode: > 1. Get rid of it completely
>> 2. Leave it as it is
>> 3. Admit that it can be useful one day and:
>>    3.1. protect it with #if 0
>>    3.2. protect it with a new Kconfig option (disabled by default) using #ifdef
>>    3.3. protect it with a new Kconfig option (disabled by default) using IS_ENABLED (to make sure code always compile)
>>    3.4. protect it with a command line option (allowing to choose the timer to be used by Xen)
>> ...
>>
>> Let me know what you think.
> 
> Before answering the question, I would need some clarifications on your aim.
> 
> Cheers,
> 
> --
> Julien Grall

~Michal

