Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8CD64E8A1
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 10:32:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464265.722609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p674N-00065y-8t; Fri, 16 Dec 2022 09:31:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464265.722609; Fri, 16 Dec 2022 09:31:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p674N-00063N-5G; Fri, 16 Dec 2022 09:31:55 +0000
Received: by outflank-mailman (input) for mailman id 464265;
 Fri, 16 Dec 2022 09:31:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PP9E=4O=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p674M-00062y-J2
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 09:31:54 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2050.outbound.protection.outlook.com [40.107.94.50])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7887f28e-7d24-11ed-91b6-6bf2151ebd3b;
 Fri, 16 Dec 2022 10:31:53 +0100 (CET)
Received: from DS7PR03CA0185.namprd03.prod.outlook.com (2603:10b6:5:3b6::10)
 by IA1PR12MB8405.namprd12.prod.outlook.com (2603:10b6:208:3d8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.15; Fri, 16 Dec
 2022 09:31:49 +0000
Received: from DS1PEPF0000E64E.namprd02.prod.outlook.com
 (2603:10b6:5:3b6:cafe::e7) by DS7PR03CA0185.outlook.office365.com
 (2603:10b6:5:3b6::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.15 via Frontend
 Transport; Fri, 16 Dec 2022 09:31:48 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0000E64E.mail.protection.outlook.com (10.167.18.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.8 via Frontend Transport; Fri, 16 Dec 2022 09:31:48 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 16 Dec
 2022 03:31:48 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 16 Dec
 2022 01:31:48 -0800
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 16 Dec 2022 03:31:47 -0600
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
X-Inumbo-ID: 7887f28e-7d24-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OWuQXnZGXHx/Y6vv0f4CBmr87rKYNyZmhJhjTUpK8C6DyDNE8umBkzux96mYtsdzjX0ZwSxohmwSY1jxTeTEoXMI9bHUJfQpW3hCneV02dq+58u7eJcR6NT5l8lNS4pzbdnoTQjRTOpl11qKhBrECX1iRbAacW4dia8GYi4nw2Lf6suO3D2SnRhICJwyXo6J6UbBpTKvXW25+KxPyy9teC3pVcOi+kPQQfxVXHMPaAqw27k9Vw66xZ1C1oggA7lEaa1Cup6RRB56jAZSHVCuqdQJMiWudurIBtJsstdY6IQ1fsvCuw6W5JbJEoIFvjlZ3W02IfkJqFx7OiJ4VApbTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fidLWj+lVO2NuRNu/kgRIIV8xUQWIjGeR3sqB4FgImY=;
 b=oKIi7qqVfHW5yDV8hc8pMpzNzpKKJ6AUkuSt+FJ26Qw+38TwX/dYR505IhXGD/D0QVfsiUR5X3IRTx2tdDbLtfbC3852nks2m0vtlOFjvxDpmriXI3N36YoTkK7CPNUdz8OSjdxBA754tLRr9JD5S4fnL088nSNO+RP9InS/T1joS2q2wqaFUKldilDGk5Pp52Rj48l6nhY2dVU4AgUfn64ZVi5pZl31tGAMXpK8fA3IZXPiBcv+zoW2P3x7nPBZVh+rMTREJ5zOXdAzrlmTv9B1Rm06/Nz4XDLk54kjm2+DmOvVFO7Xago2wss0mjwyBxgUHqYNvjiRUAkhxvhSIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fidLWj+lVO2NuRNu/kgRIIV8xUQWIjGeR3sqB4FgImY=;
 b=m9wMmcGn8z/MM3H3Iprp5OGZuriCpqcNmwoBW473crgps1Xveog0vog4YWal9OzzMMlvLFiwNadondMzmXkWmFZi462Ha0+XzgnYu+GbRk4UPH+pOWsLFvvAtcUNCRGLLh/h0XE3Zur8HJ2ST0gxpPgelZx9nJs1yNkfWv4Baxo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <d5449314-4289-46bd-8d98-f54063fbf5a3@amd.com>
Date: Fri, 16 Dec 2022 10:31:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/2] automation: Add support for using XTF for arm64
 testing
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
References: <20221215152538.10266-1-michal.orzel@amd.com>
 <20221215152538.10266-2-michal.orzel@amd.com>
 <alpine.DEB.2.22.394.2212151303150.315094@ubuntu-linux-20-04-desktop>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2212151303150.315094@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E64E:EE_|IA1PR12MB8405:EE_
X-MS-Office365-Filtering-Correlation-Id: b2304492-37f3-43d3-2f7f-08dadf485b55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2VANDQZoYvu7ecA8idEsr23fF+mjxVjH1locx8Sj1vN43TOjhQAbQaQv8h6+5cUnqz2p8JGGWz+hl95CTlI6mjMfjDSsQUmqRBU5OEDpZHsiJtFm9kHuaoMBABUx96H8hwy/cDhhOyBfJF94+ThX6avYHawM0pXLHU2eJOk4CWtFKRU9ubns1ptFslKdcvPR9RMJAsSiDmofi3T+xFIKuBqHiWx/3UgoP+iuEe9wKpKys8rGHo+SvC531Rw5FmxJQQfDctUgKo0bNySVOlk5T7aTFKSk76OSzh1kEIcYl2ClMkp6jc9MSAxBUJAZb7VIxf0rpjLKUSUCRIpSY9O/3wPoxGTAispWYJAehOeY6fiNy2sN7W0j6/aJlnyCbwCUFmz8OMCAb5Eih3nxA6yh1rRpuICr79OcncQVc0F4Zbk3QQFZHh8s9HQBDD/XmWq+k5OOa2Wc9hBqNje5TvkRJnOkxdGjT4y2eKnZcdtVD8DTyHTtd+XFbPuSoc12EVMcgJ48hKzm19elUBMdiyXtXRXG1k2SrP+c12bvx3uW2X5vbkgcbanSDgG1N82grrd5jQqPV68Bmo3Jt56xDrZhV3igFGmZl7KPn6nP09jOtrvhHodd2bV3RMd9gqqS7hJ70vEz9GEF6KOvNKSLxsD0NS5U0ZFlweFbkCaKze2T8cScf+hIM28oxE91WGE93zSXKNe9ovurIzxlLmdNczXDPuuk8wLMIsD1XqLN0UpS09+9KYj/aB9fYp8fRPVraNjtatILdtKI0ZxBCnCNDGd9y1DOU76Zkaw+7hlxSATITibLb3rJCQ6GW/IejAGzqoTJbGtT3wNCQtAiVCJfs5inggU0+ObPGXvlODiJFq46cEA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(396003)(136003)(376002)(451199015)(36840700001)(40470700004)(46966006)(82740400003)(31686004)(36860700001)(70206006)(41300700001)(70586007)(8676002)(82310400005)(5660300002)(4326008)(356005)(44832011)(81166007)(478600001)(40460700003)(83380400001)(966005)(6916009)(316002)(36756003)(54906003)(47076005)(426003)(2906002)(16576012)(53546011)(186003)(26005)(8936002)(86362001)(31696002)(40480700001)(2616005)(45080400002)(336012)(21314003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 09:31:48.8514
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2304492-37f3-43d3-2f7f-08dadf485b55
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E64E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8405

Hi Stefano,

On 15/12/2022 22:05, Stefano Stabellini wrote:
> 
> 
> On Thu, 15 Dec 2022, Michal Orzel wrote:
>> Introduce support for using XTF on Arm to perform low-level testing.
>> For the purpose of the CI testing, let's use the fork [1] from upstream
>> XTF with implemented support for arm64 (the upstream XTF only supports
>> x86).
>>
>> Add a new script under automation/scripts to be used by the CI XTF test
>> jobs to perform the following tasks:
>>  - Compiling XTF,
>>  - Creating dom0 rootfs,
>>  - Generating u-boot script using ImageBuilder,
>>  - Running Xen with Linux as dom0 and XTF as a dom0less domU using Qemu,
>>  - Checking test result.
>>
>> The script takes the name of the XTF test to run as a first parameter.
>>
>> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.com%2Fxen-project%2Ffusa%2Fxtf.git&data=05%7C01%7Cmichal.orzel%40amd.com%7C92d389df450446d2916608dadee01c9d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638067351382726466%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=WSQJe1s9%2B67c%2FxvYu3OP9Hr1ZZXWSpjXNnCbIwbw2OU%3D&reserved=0 (branch xtf-arm)
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>>  automation/scripts/qemu-xtf-dom0less-arm64.sh | 97 +++++++++++++++++++
>>  1 file changed, 97 insertions(+)
>>  create mode 100755 automation/scripts/qemu-xtf-dom0less-arm64.sh
>>
>> diff --git a/automation/scripts/qemu-xtf-dom0less-arm64.sh b/automation/scripts/qemu-xtf-dom0less-arm64.sh
>> new file mode 100755
>> index 000000000000..321d1abc543b
>> --- /dev/null
>> +++ b/automation/scripts/qemu-xtf-dom0less-arm64.sh
>> @@ -0,0 +1,97 @@
>> +#!/bin/bash
>> +
>> +set -ex
>> +
>> +# Name of the XTF test
>> +xtf_test=$1
>> +
>> +# Message returned by XTF in case of success
>> +passed="Test result: SUCCESS"
>> +
>> +# XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
>> +curl -fsSLO https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fqemu%2Fqemu%2Fraw%2Fv5.2.0%2Fpc-bios%2Fefi-virtio.rom&data=05%7C01%7Cmichal.orzel%40amd.com%7C92d389df450446d2916608dadee01c9d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638067351382726466%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=f9gY1ubTk0NssPcr38A5BUuFzdrIAm8rJXsuMNuGXYs%3D&reserved=0
>> +./binaries/qemu-system-aarch64 \
>> +   -machine virtualization=true \
>> +   -cpu cortex-a57 -machine type=virt \
>> +   -m 2048 -smp 2 -display none \
>> +   -machine dumpdtb=binaries/virt-gicv2.dtb
>> +
>> +# XXX disable pl061 to avoid Linux crash
>> +fdtput binaries/virt-gicv2.dtb -p -t s /pl061@9030000 status disabled
>> +
>> +# XTF
>> +# Build a single XTF test passed as a first parameter to the script.
>> +# Build XTF with GICv2 support to match Qemu configuration and with SBSA UART
>> +# support, so that the test will use an emulated UART for printing messages.
>> +# This will allow us to run the test on both debug and non-debug Xen builds.
>> +rm -rf xtf
>> +git clone https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.com%2Fxen-project%2Ffusa%2Fxtf.git&data=05%7C01%7Cmichal.orzel%40amd.com%7C92d389df450446d2916608dadee01c9d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638067351382726466%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=WSQJe1s9%2B67c%2FxvYu3OP9Hr1ZZXWSpjXNnCbIwbw2OU%3D&reserved=0 -b xtf-arm
>> +make -C xtf TESTS=tests/${xtf_test} CONFIG_SBSA_UART=y CONFIG_GICV2=y -j$(nproc)
>> +cp xtf/tests/${xtf_test}/test-mmu64le-${xtf_test} binaries/xtf-test
>> +
>> +# DOM0 rootfs
> 
> Given that we don't actually need dom0 for anything, maybe we could only
> run xtf as the only domU guest without dom0 (pure dom0less
> configuration)?
This is what I thought at the beginning. It definitely makes sense because at the moment
we do not test pure dom0less configuration. I will do this in v2.

~Michal

