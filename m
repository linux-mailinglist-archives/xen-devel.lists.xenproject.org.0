Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B260A5ACDF1
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 10:45:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398583.639456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV7iv-0004nJ-RN; Mon, 05 Sep 2022 08:44:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398583.639456; Mon, 05 Sep 2022 08:44:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV7iv-0004kZ-Nq; Mon, 05 Sep 2022 08:44:53 +0000
Received: by outflank-mailman (input) for mailman id 398583;
 Mon, 05 Sep 2022 08:44:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZxbR=ZI=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oV7iu-0004kT-3z
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 08:44:52 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2064.outbound.protection.outlook.com [40.107.93.64])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 002f866a-2cf7-11ed-af93-0125da4c0113;
 Mon, 05 Sep 2022 10:44:50 +0200 (CEST)
Received: from DS7PR06CA0010.namprd06.prod.outlook.com (2603:10b6:8:2a::17) by
 IA1PR12MB6353.namprd12.prod.outlook.com (2603:10b6:208:3e3::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.17; Mon, 5 Sep 2022 08:44:46 +0000
Received: from DM6NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2a:cafe::c4) by DS7PR06CA0010.outlook.office365.com
 (2603:10b6:8:2a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Mon, 5 Sep 2022 08:44:46 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT017.mail.protection.outlook.com (10.13.172.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5588.10 via Frontend Transport; Mon, 5 Sep 2022 08:44:46 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 5 Sep
 2022 03:44:45 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 5 Sep
 2022 03:44:45 -0500
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Mon, 5 Sep 2022 03:44:44 -0500
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
X-Inumbo-ID: 002f866a-2cf7-11ed-af93-0125da4c0113
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WlamoT03TVZfAQy1b1O06AxxseBENk/QEv+4k15SzhxOZ4AcGNudTnSvmlWi7qZ80O3oxXvbv/pQpAj59mhHmprWW6arUlzkSI02R1VOL+obt4j6nNclutLD2Yh/Kv8ryJcrK4Uqc2rj9c4plzn7gfVCVEmzA9+TzY2/4XlhZwhKBteVlBxLelPkbfvOsdQ9o75XiIkRdgORd49oVXWsdyB0UpsniJyvviN8oZw0de/nhYob6Ukc7rz4qXDMYMGNjfI1eGsKtQ6UUaUBS/ITCKx6trJoUDWghdO+geilP/qBBaRnp2WOiNmov4A09nheAWZ24AFOmU0w/aDfPNkXQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AwDs2ed147tl2UT5ygQg74PPniA3YTFZLRnX5MVHE6o=;
 b=C/IY7D+/zaetrOW5aKAKO389REACpgw0mWSIU6OxSJ77fommDWaPVnisMC1m3iEKh7UGUPRHY9DeSerR7aU7ZYwdkDRdpA3CCx7g/aVnfop2y/JcOvnhgs01UUorUWjrTqef5Nwi1fT2nJ6w9JSjyhTJnYIdx04IBjtVPoavIqeAZkXZqhPRudiI4s0YNySsc6xvd6plEa/JGTgBcGdNLZ4RdACTdYO9WoNW6eU119OAa5aBS7cw3djhphvKMyq3g6C5ylCBbuCKTOJe8kLYdMuypvKWAwISMDPxrFZd4r8MInq0zmVl7zRAXyQBa/N2nEGhZ7qnf3mOgyqZAwwMFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AwDs2ed147tl2UT5ygQg74PPniA3YTFZLRnX5MVHE6o=;
 b=wfLLHFaJaBXA88T3/PLrOlvRaCOXcHjAi6iYhdjQ0sNgxjiAPCPai4uaWvvNz90TixHKd9C4l3mFWugDD+MiV8oIb/NvWQrvxZo25no27LM6cTxUgG4fkY5wTv6xvQKjP0VcslJhYa6uFMRQnpOe0SfxBLy6m+vCTxEB6Fc3t5c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <98b712c1-2a02-9baa-b816-3c28cccaf74e@amd.com>
Date: Mon, 5 Sep 2022 10:44:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [for-4.17 3/3] automation: Add a new job for testing boot time
 cpupools on arm64
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
References: <20220902070905.1262-1-michal.orzel@amd.com>
 <20220902070905.1262-4-michal.orzel@amd.com>
 <alpine.DEB.2.22.394.2209021645160.3931@ubuntu-linux-20-04-desktop>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2209021645160.3931@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 703fa30f-85cd-42f0-13b1-08da8f1ae2b4
X-MS-TrafficTypeDiagnostic: IA1PR12MB6353:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cxzsgH9RhCwuxGqj6X2f7zX3sSSDYOgbDUvk14GW7AVSUQgs4c2j0/hUsOX/Pi10z3jpemHSwZKGK1j3Bg28dxO/bzCB1CBgett7xW5eyOEJxmGKLj0m5SQtH00ukov5FYbbMug3AmAx0j90KrDPOS796D23VZfT+H/TSQl+mr2s63NNRPnkiEwjuDwHmKwmnf1DwfKF/tnV1+uFmTnRuTfW6ENuy9uFmdiwY3Gi1Oer6hA7PCdfXa8QhVbXWMi/OBAN0ZeLNP9aPEctam8UsFptIi0pFQcDFqKzHDRTS7v13BytCPua7G1hkTqNitqob0nhisDB2+RZtJ8CF6lZMDoB1L/OvCp+PGV61NfrMisGSvhuZXm3g58iVfq7ByjpH3+bxXxLVySBc+sNlNk7GrY+tvQZiNmKYItZanAl/n2+ZfTelTtYLF2LUgk/z8Wp57VMDVyLmvO4Iq5smkb7S2N1XOIj7rKCPiT4abG9og0e4B+qXOXiQYEmUD48UnVCnR9QgLeGsyE7ud2K0t4K739RJzuUOfE9a9PmoY94cMhsyUAAZea9pX4fyC/Focf67/z53DfSRVT94RRzu5lVQQBLYVeLG+0mFla8Hc4Kp/Qdg4zNGxzNatGI3QLctMbstRvIOFM+SXRHVQdhnYV4btaSVM1ETFCCd3oUWFrOdb3mARhzZpb6FF8Ql+M75DOa4rrgHNFcmHogykETlpxjS5ioET109z8S5shphjzMkmHf8IWI8v/8BHEsLp0asTgHFuqbg3nkxrkZevmMZX9oSPZ/SKYrUtUmW8ys8hYgTjWEmicbk8vuSjSLOs6qL882FqlJDQOHcRvmz6cEl7+AhWpTSH3G5P2uDH/pL3Drr0Q=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(396003)(136003)(39860400002)(40470700004)(36840700001)(46966006)(336012)(186003)(2616005)(47076005)(426003)(82740400003)(8936002)(83380400001)(36860700001)(44832011)(5660300002)(70586007)(70206006)(4326008)(40480700001)(82310400005)(2906002)(8676002)(41300700001)(478600001)(40460700003)(26005)(316002)(16576012)(6916009)(54906003)(53546011)(31686004)(81166007)(36756003)(86362001)(31696002)(356005)(157313001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 08:44:46.0783
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 703fa30f-85cd-42f0-13b1-08da8f1ae2b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6353

Hi Stefano,

On 03/09/2022 01:49, Stefano Stabellini wrote:
> 
> 
> Currently this test fails with:
> 
> + fdtput binaries/virt-gicv2.dtb -p -t s /pl061@9030000 status disabled
> + [[ boot-cpupools == \b\o\o\t\-\c\p\u\p\o\o\l\s ]]
> ++ fdtget binaries/virt-gicv2.dtb -t x /cpus/cpu@1 phandle
> Error at 'phandle': FDT_ERR_NOTFOUND
My bad. The qemu version used by CI does not generate phandles for cpus.
So the fix is very straightforward and requires putting custom phandle for cpu@1.

diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-arm64.sh
index c2184850293c..158d5665d71d 100755
--- a/automation/scripts/qemu-smoke-arm64.sh
+++ b/automation/scripts/qemu-smoke-arm64.sh
@@ -50,8 +50,9 @@ fdtput binaries/virt-gicv2.dtb -p -t s /pl061@9030000 status disabled
 
 if [[ "${test_variant}" == "boot-cpupools" ]]; then
     # Create cpupool node and assign it to domU0
-    cpu_phandle="$(fdtget binaries/virt-gicv2.dtb -t x /cpus/cpu@1 phandle)"
+    cpu_phandle="0xfffffe"
     cpupool_phandle="0xffffff"
+    fdtput binaries/virt-gicv2.dtb -p -t x /cpus/cpu@1 phandle $cpu_phandle
     fdtput binaries/virt-gicv2.dtb -p -t s /chosen/cpupool compatible xen,cpupool
     fdtput binaries/virt-gicv2.dtb -p -t x /chosen/cpupool cpupool-cpus $cpu_phandle
     fdtput binaries/virt-gicv2.dtb -p -t x /chosen/cpupool phandle $cpupool_phandle

> 
> Given my other comment below, I would leave this code as is.
> 
> 
>> +if [[ "${test_variant}" == "boot-cpupools" ]]; then
>> +    # Create cpupool node and assign it to domU0
>> +    cpu_phandle="$(fdtget binaries/virt-gicv2.dtb -t x /cpus/cpu@1 phandle)"
>> +    cpupool_phandle="0xffffff"
>> +    fdtput binaries/virt-gicv2.dtb -p -t s /chosen/cpupool compatible xen,cpupool
>> +    fdtput binaries/virt-gicv2.dtb -p -t x /chosen/cpupool cpupool-cpus $cpu_phandle
>> +    fdtput binaries/virt-gicv2.dtb -p -t x /chosen/cpupool phandle $cpupool_phandle
>> +    fdtput binaries/virt-gicv2.dtb -p -t x /chosen/domU0 domain-cpupool $cpupool_phandle
>> +
>> +    # Check if domU0 (id=1) is assigned to Pool-1
>> +    passed="${test_variant} test passed"
>> +    dom0_check="if xl list -c 1 | grep -q Pool-1; then echo ${passed}; fi"
>> +fi
> 
> I would prefer to keep the device tree editing here to a minimum and
> instead add boot-cpupool support in ImageBuilder and add CPUPOOL* config
> options to the existing config file for ImageBuilder created in this
> file below. This way, we keep this test cleaner and we help more the
> user by proving a way to set boot-cpupools more easily in general, also
> useful outside gitlab-ci.

I agree that ImageBuilder is a great tool. However, I would opt for keeping what I did because of the following:
- current release schedule (we could benefit from having a test for 4.17 feature instead of waiting for the corresponding
  change to be done in ImageBuilder first and tested),
- test is already prepared and requires just a trivial fix,
- we should not enforce users willing to add tests to gitlab-ci to always prepare the ImageBuilder changes first.
  ImageBuilder is not meant to support all the features strictly because some of them require too much
  end-user knowledge and digging into device tree (it should stay as simple as possible),
- all in all we need to have a way to modify the dtb and fdtput is certainly better than sed as it does not
  require additional steps for decompilation/compilation and its commands look more clean than using sed transformation.

Let me know what you think.

On a side note, I can add boot-time cpupools support in ImageBuilder to my TODO list so that we can check if this is something
ImageBuilder should support. If yes, we can modify this test after the release.
I can already think of the following IB config options that would need to be introduced to properly support boot-time cpupools:
CPUPOOL[number] = "<list_of_cpus> <scheduler>" - to create cpupools
NUM_CPUPOOLS = "<number>" - to keep the number of created cpupools
DOMU_CPUPOOL[number] = "CPUPOOL[number]" - to assing domU to one of the created cpupools
So we already have 3 new options and the number of required sanity checks I can think of is significant.
Even then, we could easily trigger a failure e.g. if user assigns cpus of different type and does not pass hmp-unsafe=1.


~Michal

