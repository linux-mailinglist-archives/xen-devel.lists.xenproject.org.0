Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB836EF5A6
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 15:42:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526710.818606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prfP0-00073H-Vt; Wed, 26 Apr 2023 13:41:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526710.818606; Wed, 26 Apr 2023 13:41:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prfP0-00070G-Sz; Wed, 26 Apr 2023 13:41:46 +0000
Received: by outflank-mailman (input) for mailman id 526710;
 Wed, 26 Apr 2023 13:41:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m295=AR=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1prfOz-000708-1p
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 13:41:45 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20628.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11d15e6e-e438-11ed-8611-37d641c3527e;
 Wed, 26 Apr 2023 15:41:40 +0200 (CEST)
Received: from DM6PR13CA0018.namprd13.prod.outlook.com (2603:10b6:5:bc::31) by
 PH7PR12MB6811.namprd12.prod.outlook.com (2603:10b6:510:1b5::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.33; Wed, 26 Apr 2023 13:41:36 +0000
Received: from DM6NAM11FT093.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:bc:cafe::fb) by DM6PR13CA0018.outlook.office365.com
 (2603:10b6:5:bc::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21 via Frontend
 Transport; Wed, 26 Apr 2023 13:41:36 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT093.mail.protection.outlook.com (10.13.172.235) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.21 via Frontend Transport; Wed, 26 Apr 2023 13:41:36 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 26 Apr
 2023 08:41:35 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 26 Apr
 2023 08:41:35 -0500
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 26 Apr 2023 08:41:34 -0500
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
X-Inumbo-ID: 11d15e6e-e438-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lZh086fySMqdxCA/R2H/CW2/ZsafL/9K56j15SNW7DRM9a3C1jEUnkFZK7ViBQsgLDJfvzNjkhdBW5r6QRhutHo8dLQ5ZuVtFgITtjPnK/YNAmpxCQvkYPEFj5QvIaeirByQrWfdmqxLXONfVmapVbbbDpB87XrefUIPvkKBhoZzzvniW9roeyOi6UUMHSfisGC3Gsp+aAQdfdZzvGq6HaVt0o4ITpj8xj62UDXJ51fwHR7Wpj22aLdt0OfEzht4ZmaCCTgCc7UvPS9VDD9sERtnQ6ewv8R6rPIZpNNhuQX21fLhssOIqPzBfv7PZaqD+oJJg2NcnTiXGNQ71BFLXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E1eEH5BwC384RmlKdS6D0BJCyf0JUhERXAlfmnSiq6M=;
 b=hcJV2+Cq7oEh0GyVRBOnSTXcfjyJLn5TXtSR8tSjMm7OoK5bhzAs0FmZSmhrKhRkM3Ejk2bbCGeGaN0brW6JkmdSZ0sNJP8LiyFGv2be20jWqtB16RmT+LyiwRIF5mpWkHel1pdH4buq+ZHMANzQO6WLajYkIG5AzbRosELOsDdJbtAslMaRISl0o6s4sj68Lxyjn1bNBFY/RwMSbDZfpeN78wVIv8EDfh6LPfDbCLahJkvkRp1NRK3+2k/Qjiuq1L8/BjiW+zs2QiFm609DHRXMNcbDivw6ox2uI8jrtsfieiPyy99Tq83m16GQ1rsp+pYzo5MJRNs8t/V2/o4zxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E1eEH5BwC384RmlKdS6D0BJCyf0JUhERXAlfmnSiq6M=;
 b=YowstFeEecwFBdWeBTubyG/7sZ4n5wZVWmrjan1qdQNRb9PNtclQY8ZArnUK0Oo7mREqkGP9/Kf18Go4uWTbOdw1bBBM6rIrdKjLQhmFRs4S6KwAtmpkOeD18QLmzfmtnvwJElqNMOziUOZHsiOFPxyTIpwgl5sH93Z7GGvE864=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <a28b68fd-50e9-016f-71b3-6daa85619dad@amd.com>
Date: Wed, 26 Apr 2023 09:41:34 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH] xen/sched/null: avoid crash after failed domU
 creation
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, "Dario
 Faggioli" <dfaggioli@suse.com>
CC: George Dunlap <george.dunlap@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20230424210048.786436-1-stewart.hildebrand@amd.com>
 <16b10155-4dfb-6891-dc90-61a6b966ee6d@suse.com>
 <fd1cde5e-a12f-85f3-1c21-bc41a483be39@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <fd1cde5e-a12f-85f3-1c21-bc41a483be39@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT093:EE_|PH7PR12MB6811:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f3e85f4-70f2-4bf2-53de-08db465bf4a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hXHPdsxpe8taw6FEy27mJqZJ0H9ky7I0s73JlstGB9KSeavPjdc9OYHjLeXv4InN90XuEO0LTMhklu2gOYdPu0FwBpEvG7i51lX02zxoj4NF8Me7osnWVK+dPq19Tqj9DdHMbAF1t0nY6eaiCLcbhWYq6ryHapXN3S9wknmKE3XHC6Aunwy64m84ILyuK3vhadbz0yJ3aO9dMSDGB1sjz5dfy6o4pgQkcCOaEkD3diGi3pPKTwOTQQnVYilZQhcFxXUf7DoNAWCCU12KYnlqSzzaa10bInFOyPue8YvEvUEAepKTKpQ8vR0sbr4Xw73IQ+gVMXkAXSPbeGHAPUN+TjJfmMd0XefDYxxOtCns/gV2ifRh7xSrU6dvUROcv9E/8USDOvQSErdd5iC+EWiNnisjXCmS723GSkMtm0lQZvFCq8KpPl73MUf8EDBAazTyw0stcVoHw/0KfQnzHuxcGT36qaHeWn02kTOao2VBVfbiZiCt2pRaaRcO6SK2XiyQv4hmZp1f0ntGCDnFXIKhfi6lU0FsL9B5KHB/t04q3Jytv/7yP9XUYTEvCzsJFvun+d0xuqw5Jqn3hMG4ItxNIck7Tmbkzltf6RSDBVwn+YdZvXrHrnTDJLXyLBEiOqhq+ZpxxJiy5Tx3vkjUi+7m4V9kUrlBrnaQJHjktjEB0i4KWYivwoj2sX7UbtB+BpH+Hw+jhRlZKCGT8SwI6MBkGmibQh5CvK/Bz42DGjXPPhpgJf1R8eaEpZkr0zDO3SWqbGBCOkWfUBMImth3yW8iYA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(136003)(39860400002)(346002)(451199021)(46966006)(36840700001)(40470700004)(2906002)(2616005)(53546011)(4326008)(41300700001)(70206006)(8936002)(70586007)(26005)(186003)(316002)(478600001)(40480700001)(44832011)(54906003)(5660300002)(110136005)(8676002)(82740400003)(356005)(81166007)(86362001)(40460700003)(31696002)(36756003)(336012)(47076005)(36860700001)(83380400001)(82310400005)(426003)(31686004)(16576012)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 13:41:36.2785
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f3e85f4-70f2-4bf2-53de-08db465bf4a6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT093.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6811

On 4/25/23 03:42, Jan Beulich wrote:
> On 25.04.2023 08:36, Juergen Gross wrote:
>> On 24.04.23 23:00, Stewart Hildebrand wrote:
>>> When creating a domU, but the creation fails, we may end up in a state
>>> where a vcpu has not yet been added to the null scheduler, but
>>> unit_deassign() is invoked.
>>
>> This is not really true. The vcpu has been added, but it was offline at
>> that time. This resulted in null_unit_insert() returning early and not
>> calling unit_assign().
>>
>> Later the vcpu was onlined during XEN_DOMCTL_setvcpucontext handling,
>> resulting in null_unit_remove() calling unit_deassign().

Makes sense. I'll reword the message in the next revision.

>>> In this case, when running a debug build of
>>> Xen, we will hit an ASSERT and crash Xen:
>>>
>>> (XEN) ****************************************
>>> (XEN) Panic on CPU 0:
>>> (XEN) Assertion 'npc->unit == unit' failed at common/sched/null.c:379
>>> (XEN) ****************************************
>>>
>>> To work around this, remove the ASSERT and introduce a check for the
>>> case where npc->unit is NULL and simply return false from
>>> unit_deassign().
>>
>> I think the correct fix would be to call unit_deassign() from
>> null_unit_remove() only, if npc->unit isn't NULL. Dario might have a
>> different opinion, though. :-)

Yes, this seems cleaner to me, thanks for the suggestion. I did a quick test, and this approach works to avoid the crash too. I'll wait a few days in case anyone else wants to chime in, and if there aren't any more comments I'll send out a new patch following this suggestion.

> Furthermore, even if the proposed solution was (roughly) followed, ...
> 
>>> --- a/xen/common/sched/null.c
>>> +++ b/xen/common/sched/null.c
>>> @@ -376,7 +376,14 @@ static bool unit_deassign(struct null_private *prv, const struct sched_unit *uni
>>>       struct null_pcpu *npc = get_sched_res(cpu)->sched_priv;
>>>
>>>       ASSERT(list_empty(&null_unit(unit)->waitq_elem));
>>> -    ASSERT(npc->unit == unit);
>>> +
>>> +    if ( !npc->unit )
>>> +    {
>>> +        dprintk(XENLOG_G_INFO, "%d <-- NULL (%pdv%d)\n", cpu, unit->domain,
>>> +                unit->unit_id);
>>> +        return false;
>>> +    }
>>> +
> 
> ... shouldn't the assertion be kept, with the new if() inserted ahead of
> it? Plus the log message probably better wouldn't print a unit ID like a
> vCPU one, but instead use e.g. %pdu%u?

Sure, although, with Juergen's suggested fix in null_unit_remove(), I think we could simply drop this snippet and leave unit_deassign() unmodified.

Your suggested print format is an improvement, but perhaps it would be better suited for a separate patch since there are several more instances throughout null.c that would also want to be changed.

Example with %pdv%d:
# xl create ...
(XEN) common/sched/null.c:355: 3 <-- d1v0
# xl destroy ...
(XEN) common/sched/null.c:385: 3 <-- NULL (d1v0)

Example with %pdu%u:
# xl create ...
(XEN) common/sched/null.c:355: 3 <-- d1u0
# xl destroy ...
(XEN) common/sched/null.c:385: 3 <-- NULL (d1u0)

