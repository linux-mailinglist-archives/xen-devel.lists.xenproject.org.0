Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDED995545F
	for <lists+xen-devel@lfdr.de>; Sat, 17 Aug 2024 02:47:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778844.1188855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sf7Zz-0003uy-Gg; Sat, 17 Aug 2024 00:46:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778844.1188855; Sat, 17 Aug 2024 00:46:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sf7Zz-0003rt-Dj; Sat, 17 Aug 2024 00:46:03 +0000
Received: by outflank-mailman (input) for mailman id 778844;
 Sat, 17 Aug 2024 00:46:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QUm3=PQ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sf7Zx-0003rl-M7
 for xen-devel@lists.xenproject.org; Sat, 17 Aug 2024 00:46:01 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20612.outbound.protection.outlook.com
 [2a01:111:f403:2009::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 124d0921-5c32-11ef-a505-bb4a2ccca743;
 Sat, 17 Aug 2024 02:45:59 +0200 (CEST)
Received: from BN9PR03CA0709.namprd03.prod.outlook.com (2603:10b6:408:ef::24)
 by LV3PR12MB9412.namprd12.prod.outlook.com (2603:10b6:408:211::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Sat, 17 Aug
 2024 00:45:53 +0000
Received: from BL6PEPF00020E63.namprd04.prod.outlook.com
 (2603:10b6:408:ef:cafe::3c) by BN9PR03CA0709.outlook.office365.com
 (2603:10b6:408:ef::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19 via Frontend
 Transport; Sat, 17 Aug 2024 00:45:53 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00020E63.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Sat, 17 Aug 2024 00:45:53 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 16 Aug
 2024 19:45:48 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 16 Aug
 2024 19:45:45 -0500
Received: from [172.24.94.179] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 16 Aug 2024 19:45:45 -0500
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
X-Inumbo-ID: 124d0921-5c32-11ef-a505-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F8vrRC7roj99wmz41J6BY5Y2/SHa85GIugxghpM64KHak6LADmf7INUNpMCe0ntQU//bLG19qT8j/deMG0cHAphj6uDeUxpTY9LkJCWugau/WYukJ6JlEWQcGNDhHyw6Eb3XZ6eV8fgv7OcF7OCZZYy42Y4+p27qwGHO7FlY7EzqHtTtajvuxZwl8nunpPGmekS006W+RsgybZnkHsL7R6ABraH4Quw5T5jMufNDz4GJHXrHjHey71PdakVd1yIB6R3lTbdH7lDWt+tRVqirmCwu2scYzmaghJpZOfwFTiUVtrrtf+AV6uYwYRkeF93sGOXDCagXwD/2WP0OOHRoXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m4SVgnne9erkuAhrAeM3VCVOKRFMY2Is89F35hd+2Sk=;
 b=cPfOm+jmZ25g1hPXYcCsoWQGD7wSYrL6ypUPgO0k/Pb+1acw4OVQaMn4ViQxVVkpoMXZ54T5JeQlHP1Lmcrjasvuo+7jsaWKQCGQjQrlsBdKnlWUo8JPUNiw1+cm1JHFL4dVndkqTue87rJsKEwwQPoXgJ+hwXNSV/JMl10K1ERpjx0oWQvfSOShYm49cBSrqWKM8qR/HbvlBSzwuRJmkhG7GseIXWxOF/3AyVQcUyRJm3Fq57c0BasdNPa6w+SlqU9yzPiOUbOZEEzplbRk1/kBryBRdCLijKqROJ3nbTELfGxly9kWm9VN/TKaDnliDtq1vAsprzYW44TomNNjhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m4SVgnne9erkuAhrAeM3VCVOKRFMY2Is89F35hd+2Sk=;
 b=yyKe+f4OwTp3AbVgJbDKlFsVXBIeDFU4JTkfv34I+I96d0YRfxFOc6iQzyqW5B02vYhnbBJ6dBXjoSWqWgwADYjYkg0BokTQmOYEwgpspcB0YXITk4Guv8N9T4keFnmdBDRZiBKLZO1r5U4YfdiiI9vg0F1FVvbetqx0wo6IgXE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <93de8d6d-6123-4038-a566-d134206ba608@amd.com>
Date: Fri, 16 Aug 2024 18:58:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/10] hw/arm: xenpvh: Add support for SMP guests
To: Stefano Stabellini <sstabellini@kernel.org>, "Edgar E. Iglesias"
	<edgar.iglesias@gmail.com>
CC: <qemu-devel@nongnu.org>, <anthony@xenproject.org>, <paul@xen.org>,
	<peter.maydell@linaro.org>, <alex.bennee@linaro.org>,
	<xenia.ragiadakou@amd.com>, <edgar.iglesias@amd.com>,
	<xen-devel@lists.xenproject.org>, <qemu-arm@nongnu.org>,
	<andrew.cooper3@citrix.com>
References: <20240812130606.90410-1-edgar.iglesias@gmail.com>
 <20240812130606.90410-5-edgar.iglesias@gmail.com>
 <alpine.DEB.2.22.394.2408121650590.298534@ubuntu-linux-20-04-desktop>
 <ZruRm34zIMtUm7oH@zapote>
 <alpine.DEB.2.22.394.2408131550080.298534@ubuntu-linux-20-04-desktop>
 <ZryZwOoadeb1UWK8@zapote>
 <alpine.DEB.2.22.394.2408141719400.298534@ubuntu-linux-20-04-desktop>
 <CAJy5ezrUbGZCaF=HiYhyLCoXRL3d=t-QbmLeKvu7ByWksV888g@mail.gmail.com>
 <alpine.DEB.2.22.394.2408160949320.298534@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2408160949320.298534@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E63:EE_|LV3PR12MB9412:EE_
X-MS-Office365-Filtering-Correlation-Id: ba8e23ee-e94c-44f2-3cd6-08dcbe55f2a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OXBSTWZPd2lwZ3FaZWh2Tk9UZXo3VnVSeXkvMWl5cngwNWZOZXErQSt4Nmo5?=
 =?utf-8?B?Q0ozNXhaM1VoTkFsS0tYcTYyVTh4dnh0Slpoa3p5K29BMVJ5OVVrVHl6RGtl?=
 =?utf-8?B?VXU1MkRvdGM5ZW5lalFwR3d5MzYzZDByRXFtQTE2UjI2V0tleVQ5eFA5RytI?=
 =?utf-8?B?d1VyT2VYemxxSGtta0NTaXREZzVkdS90eTZvaGprUFZHdUgrd04yT0ZuQ0N3?=
 =?utf-8?B?U1prSCtRVyttanBaMlkycFo1dVp2UW0xY0c4RGZhOHM5YUVJTjJQY2FJLzVW?=
 =?utf-8?B?NnY5S3NUdEVyMGVVMkxlN0MzN29HMm9INnpuZ3F6c1NmV1F0aUxvQUJlb3dx?=
 =?utf-8?B?UndiMU9sOG82d0RrdDZlb0hKZmpKRWxoM1hpZmpOSGZHa0hleithd1JremZN?=
 =?utf-8?B?NG5WcnRkcE1RYlVYSmZsL1dJREtBaGwyWkhJd1FJb1pmbnJDSnVzRXZvMUZ5?=
 =?utf-8?B?b3ZFNll0cEoxUHFDQlk1YXJrNnJxSzFhNmlib2lLK1AycTVTVHBNandDcW15?=
 =?utf-8?B?cHhpc3NTMUpia29XQ1JPSzQrSmhqaFcwVTZzRHFXQzlpeUFBbndUNUJlY2Y0?=
 =?utf-8?B?UmM5cnAzeFBzYThoTnAzNm1pUW1aZGdVWVVqRE15OVdYRXVVbitPakxORlpQ?=
 =?utf-8?B?c1dMaVRmbkw4NUhFQ1ZQSnVwUFlBcDJYcE1zREloSjY5dkdjS3E0dkt1Y0hW?=
 =?utf-8?B?YWVvYXhNYVRmc0JoRXBrcW9HUGY5WWNMUjR2RmozdGdmNTlZU3dYd3hoODFK?=
 =?utf-8?B?UXAvWjdHSUJoRzdURGgyajY3bGVMaGptUVIxUGZ5d3FUa05ydllIWGN2NFNE?=
 =?utf-8?B?YWd6dzRaODN3UllRTG9CNjgxUUVEcEdkMHJYeVpaUUpUYnZlZVRHY04xS3c3?=
 =?utf-8?B?VXBEcFAxN3FZVWU1SFZ3U1o2bWV5SzJxRzBnM1g4b05zamk3M29WcnRmNmwv?=
 =?utf-8?B?UjRXcEJxcWVVczFOTXZJelhzRWV3QjZ2Mm9UKzg3eHV2WmsvaTFNaEMwc2x0?=
 =?utf-8?B?SjAwUG84UmVObmsvUXhyeFUydDAyaVdNcVpldE5qNDlQU3hpTHZ3OXYxMUxp?=
 =?utf-8?B?enNSWTNtMWZ1Q2pCcmMzdVpXMUppOXRQOE9HRmdDVyt4VTUvdURielFTR2Zx?=
 =?utf-8?B?c1I5aEpCbEFnODNRdU1KUU5IWnY2L01zSjVUQ0tkOXo4YnF3cHNKVzBnamFo?=
 =?utf-8?B?MVpFdEdML0UycUR6NEYvYS95azVKR04zZ0x5YU0xUDJXV2JObGh2NG0yeDd1?=
 =?utf-8?B?MStRS0xpcUJGc25nRFUydTZtZkJnSzZJSFZidysxaExOSTVzenlCU3FoUC9B?=
 =?utf-8?B?K0VTTXpxdlFaZmk3WlZnYTdoSWdwZGtiSHBXNXVzL3JNZzB3OUh6VGw1TFNr?=
 =?utf-8?B?VUhyOENnVmw2UXhod0NxRTRySzhkK3JyZTlncUJYeXlYcWFBOGx5K05IczhQ?=
 =?utf-8?B?dEhpVzBQdUdiWVdwSUF4ME5YaElmMnoxVzZGcVl0aGhLdElvdVZkTVZzN2tW?=
 =?utf-8?B?aFVNb0x4K0dIeFZabklKcmROYVlvZzhiVTg4bms4QnpIaVFmYkVCU0NueTNK?=
 =?utf-8?B?M2xLbmtkMVBMcWVpODlYYlB2SFhSZnlCUm5JOVRhNFlDK1FmQWEzelFOdDYy?=
 =?utf-8?B?dmRjUHBLeHNMSHVHYnNsOUZpQTZ0cmlIa29rWDNvTFdSaHJDZDJRcXJmaG1y?=
 =?utf-8?B?ZWZKMFBYc1J1VW03MW13eFpKTVVOODV4NmtVd1BTaEZ1dGV3L2gvOEQ4cExG?=
 =?utf-8?B?MWxKTkxCZmdIbko0QVBQdklkMTA4a21WWnI4UWdkaHlzU0FJdE9OSmFWN21J?=
 =?utf-8?B?eGZxYjdkNld6cEVWQlc5K3NLeU1DV3RZdDdYUEt5dllpTDYxcXJETDIyTkpS?=
 =?utf-8?B?N1F4WWc3ZXZsams2MVM1RlBEUWxmMWwyV21YbzVOOER0RHFGRXZaN0gvZVRq?=
 =?utf-8?Q?20ss47yP/frVMvZbzfb+u/lvoXVO/JWk?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2024 00:45:53.1399
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba8e23ee-e94c-44f2-3cd6-08dcbe55f2a5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9412

On 2024-08-16 12:53, Stefano Stabellini wrote:
> On Fri, 16 Aug 2024, Edgar E. Iglesias wrote:
>> On Thu, Aug 15, 2024 at 2:30 AM Stefano Stabellini <sstabellini@kernel.org> wrote:
>>        On Wed, 14 Aug 2024, Edgar E. Iglesias wrote:
>>        > On Tue, Aug 13, 2024 at 03:52:32PM -0700, Stefano Stabellini wrote:
>>        > > On Tue, 13 Aug 2024, Edgar E. Iglesias wrote:
>>        > > > On Mon, Aug 12, 2024 at 06:47:17PM -0700, Stefano Stabellini wrote:
>>        > > > > On Mon, 12 Aug 2024, Edgar E. Iglesias wrote:
>>        > > > > > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
>>        > > > > >
>>        > > > > > Add SMP support for Xen PVH ARM guests. Create max_cpus ioreq
>>        > > > > > servers to handle hotplug.
>>        > > > > >
>>        > > > > > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
>>        > > > > > ---
>>        > > > > >  hw/arm/xen_arm.c | 5 +++--
>>        > > > > >  1 file changed, 3 insertions(+), 2 deletions(-)
>>        > > > > >
>>        > > > > > diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
>>        > > > > > index 5f75cc3779..ef8315969c 100644
>>        > > > > > --- a/hw/arm/xen_arm.c
>>        > > > > > +++ b/hw/arm/xen_arm.c
>>        > > > > > @@ -173,7 +173,7 @@ static void xen_arm_init(MachineState *machine)
>>        > > > > >
>>        > > > > >      xen_init_ram(machine);
>>        > > > > >
>>        > > > > > -    xen_register_ioreq(xam->state, machine->smp.cpus, &xen_memory_listener);
>>        > > > > > +    xen_register_ioreq(xam->state, machine->smp.max_cpus, &xen_memory_listener);
>>        > > > > >
>>        > > > > >      xen_create_virtio_mmio_devices(xam);
>>        > > > > >
>>        > > > > > @@ -218,7 +218,8 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
>>        > > > > >      MachineClass *mc = MACHINE_CLASS(oc);
>>        > > > > >      mc->desc = "Xen PVH ARM machine";
>>        > > > > >      mc->init = xen_arm_init;
>>        > > > > > -    mc->max_cpus = 1;
>>        > > > > > +    /* MAX number of vcpus supported by Xen.  */
>>        > > > > > +    mc->max_cpus = GUEST_MAX_VCPUS;
>>        > > > >
>>        > > > > Will this cause allocations of data structures with 128 elements?
>>        > > > > Looking at hw/xen/xen-hvm-common.c:xen_do_ioreq_register it seems
>>        > > > > possible? Or hw/xen/xen-hvm-common.c:xen_do_ioreq_register is called
>>        > > >
>>        > > > Yes, in theory there's probably overhead with this but as you correctly
>>        > > > noted below, a PVH aware xl will set the max_cpus option to a lower value.
>>        > > >
>>        > > > With a non-pvh aware xl, I was a little worried about the overhead
>>        > > > but I couldn't see any visible slow-down on ARM neither in boot or in network
>>        > > > performance (I didn't run very sophisticated benchmarks).
>>        > >
>>        > > What do you mean by "non-pvh aware xl"? All useful versions of xl
>>        > > support pvh?
>>        >
>>        >
>>        > I mean an xl without our PVH patches merged.
>>        > xl in upstream doesn't know much about PVH yet.
>>        > Even for ARM, we're still carrying significant patches in our tree.
>>
>>        Oh I see. In that case, I don't think we need to support "non-pvh aware xl".
>>
>>
>>        > > > > later on with the precise vCPU value which should be provided to QEMU
>>        > > > > via the -smp command line option
>>        > > > > (tools/libs/light/libxl_dm.c:libxl__build_device_model_args_new)?
>>        > > >
>>        > > > Yes, a pvh aware xl will for example pass -smp 2,maxcpus=4 based on
>>        > > > values from the xl.cfg. If the user doesn't set maxvcpus in xl.cfg, xl
>>        > > > will set maxvcpus to the same value as vcpus.
>>        > >
>>        > > OK good. In that case if this is just an initial value meant to be
>>        > > overwritten, I think it is best to keep it as 1.
>>        >
>>        > Sorry but that won't work. I think the confusion here may be that
>>        > it's easy to mix up mc->max_cpus and machine->smp.max_cpus, these are
>>        > not the same. They have different purposes.
>>        >
>>        > I'll try to clarify the 3 values in play.
>>        >
>>        > machine-smp.cpus:
>>        > Number of guest vcpus active at boot.
>>        > Passed to QEMU via the -smp command-line option.
>>        > We don't use this value in QEMU's ARM PVH machines.
>>        >
>>        > machine->smp.max_cpus:
>>        > Max number of vcpus that the guest can use (equal or larger than machine-smp.cpus).
>>        > Will be set by xl via the "-smp X,maxcpus=Y" command-line option to QEMU.
>>        > Taken from maxvcpus from xl.cfg, same as XEN_DMOP_nr_vcpus.
>>        > This is what we use for xen_register_ioreq().
>>        >
>>        > mc->max_cpus:
>>        > Absolute MAX in QEMU used to cap the -smp command-line options.
>>        > If xl tries to set -smp (machine->smp.max_cpus) larger than this, QEMU will bail out.
>>        > Used to setup xen_register_ioreq() ONLY if -smp maxcpus was NOT set (i.e by a non PVH aware xl).
>>        > Cannot be 1 because that would limit QEMU to MAX 1 vcpu.
>>        >
>>        > I guess we could set mc->max_cpus to what XEN_DMOP_nr_vcpus returns but I'll
>>        > have to check if we can even issue that hypercall this early in QEMU since
>>        > mc->max_cpus is setup before we even parse the machine options. We may
>>        > not yet know what domid we're attaching to yet.
>>
>>        If mc->max_cpus is the absolute max and it will not be used if -smp is
>>        passed to QEMU, then I think it is OK to use GUEST_MAX_VCPUS
>>
>> Looking at this a little more. If users (xl) don't pass an -smp option we actually default to smp.max_cpus=1.
>> So, another option is to simply remove the upper limit in QEMU (e.g we can set mc->max_cpus to something very large like UINT32_MAX).
>> That would avoid early hypercalls, avoid using GUEST_MAX_VCPUS and always let xl dictate the max_cpus value using the -smp cmdline option.
> 
> As the expectation is that there will be always a smp.max_cpus option
> passed to QEMU, I would avoid an extra early hypercall.
> 
> For the initial value, I would use something static and large, but not
> unreasonably large as UINT32_MAX to be more resilient in (erroneous)
> cases where smp.max_cpus is not passed.
> 
> So I would initialize it to GUEST_MAX_VCPUS, or if we don't want to use
> GUEST_MAX_VCPUS, something equivalent in the 64-256 range.
> 
> Alternative we can have a runtime check and exit with a warning if
> smp.max_cpus is not set.

FYI, xl only passes a -smp option when the domU has more than 1 vcpu. 
Though that implies only a single vcpu.

Regards,
Jason

