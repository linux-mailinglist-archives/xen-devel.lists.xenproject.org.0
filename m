Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBEB6F5C38
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 18:50:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529398.823777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puFft-0008ID-P9; Wed, 03 May 2023 16:49:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529398.823777; Wed, 03 May 2023 16:49:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puFft-0008FX-Lc; Wed, 03 May 2023 16:49:53 +0000
Received: by outflank-mailman (input) for mailman id 529398;
 Wed, 03 May 2023 16:49:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dYIa=AY=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1puFfs-0008FR-Ad
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 16:49:52 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20607.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8459330c-e9d2-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 18:49:50 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by CO6PR12MB5412.namprd12.prod.outlook.com (2603:10b6:5:35e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Wed, 3 May
 2023 16:49:47 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::5b9b:f31f:ac6d:be94]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::5b9b:f31f:ac6d:be94%7]) with mapi id 15.20.6363.022; Wed, 3 May 2023
 16:49:46 +0000
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
X-Inumbo-ID: 8459330c-e9d2-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C50VgqF/7/92gmrzb/0Y1CrOo3aKpqLOn8GhSOsdn+B8gPRCIGB7B1gsC+FHPhIFeR/tenSHrFYcaOU0zC4RVnUQBrlRwo6b09IMC3wAVEem5cMIq2H+jWJ03zK/dHszhKK5kf151TtOdE/JvolUMMUL1EHHZ5R9jccczawgumMAbDQlPeFYyZkYIecocEK+nJBy+cYoZ1se0PofKLTQhdUZk4aieWBoLmoR7qKkymooQc68rWbocdnpQEVnmyLmkgB1ImzE4qp54EwrXIQ4kguujOvc2ATSvkgcH264mMIa42jY6lTK0WyuzTLWWdvudkYgh3anH24POsalYHF4jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tw2kDdaQA48o2ztDNh7bwQ29b2De6+ByZ/x1YYln9oE=;
 b=Rtu7AosvgxaTmYHD00Q7FJJP32VbhSJMeuitmBUSHhoUzHXIgq9k7bFNleT0s3BDEpzSUn2N+YCvHh2G5fNvkbnWoN/h6RCnzi4ZHiegDwWhkOb2Go2TzmK0+2VWtbeMZVz254+3iJcSThHm0RUSUchx9q27RhLV16pSKUwvuA0bhcWQUA6QVbMyJdcbJGryD/l6lSlUgWlmpIq2y7HgEoreugeM33IyDiTx4y6KKSwMpztiHUcF+PpvrELNQZVhX051Gcq/6h8qjqdM2V5culG1H+MGBPnbuYr8lnJfQIsz1UqDOjjMV7ZFKso7O+sqX4TgdktacwB7vt5TRVU6oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tw2kDdaQA48o2ztDNh7bwQ29b2De6+ByZ/x1YYln9oE=;
 b=wPsiJ1kNsKdIdU/j4AQ4ntvvcuI/gRehwcq3XZ3KPda/w1IRBNBcheofwnPueA2rxEhesastPchSobdYfVmy6pti57OONfMrZTsVtwwBsUGt6B4jm6KnZTiE6RtHmmfvLe2mESESx4TEIr8AY6pttLMathqcIID0Ha+CyjrOGug=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <e9a95271-021f-523a-770a-302c638bfe73@amd.com>
Date: Wed, 3 May 2023 17:49:40 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [RFC PATCH] xen/arm: arm32: Enable smpboot on Arm32 based systems
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20230502105849.40677-1-ayan.kumar.halder@amd.com>
 <2d764f29-2eb9-ecff-84cd-9baf12961c54@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <2d764f29-2eb9-ecff-84cd-9baf12961c54@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0022.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::7) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|CO6PR12MB5412:EE_
X-MS-Office365-Filtering-Correlation-Id: 9583befc-75bd-4df0-6108-08db4bf66703
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zosjtUhAKz0EhQlnRXtL9YNgD7aN5uwrzpHoial+a7SAhmM225wQFr3zjhhBdoHMyUjPkWSKVyt16POS1rPpQAvFqGOFi2Vti2pGQQSKJpYA7b0B9nw2pRHp9ZvHt1utv9kvDDTmhXu9Bwdhmp/0MTDMAfG639siVUa+ygMC9hvQMa+72MoGwzg7X9l7UZ3/EvnaFx2BtUe5tFu/f/4/IHzhDBC3AojE7m935w6GzAOQWf4JNV9gmEocX54o4crNNnbz5IniRlJqjb4bWv5/r4scvmvo9GpbUpB4PY0GHqSKDRk/TL6tf+/naSuQ1jyCw3iWXZcIWg5/qZ5lVTJUs8OY1JN9sSS9DRUbj1eBBiyZu0eSyWZ5g+ApJsA9Hs7bLwny9KHiZyI8vMyp9Q0/MSYhOkpsG55WgjbvPMe1I2StejRmaPSEmtxvajrLFJtGu6L8BuZYjOAIxPtfUslXWnXPGrNVmtFN0aceUFiZFxhyRMzQgvea1hZYfqfoB/Eve0MDg3KYoInd8Maf5ImlrN/+pnmdV3Jc1auh7dtig7GDRwXW5BIZLDECZvG6aUQ6VzS6WiFk5a3QbD7gsw0DT79X4yAhrLgwKw3kWti1eVun8TKqZvqGXrgYnG/DIreLGp5SvwCA0bkBi6z/G80nwpTJPUybma0IH36FGa1jPYceLyLhwRLWP2RcxRkBkV9l
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(366004)(39860400002)(376002)(136003)(451199021)(6506007)(6512007)(83380400001)(2616005)(66556008)(478600001)(31686004)(31696002)(6486002)(966005)(26005)(6666004)(316002)(66476007)(4326008)(66946007)(110136005)(53546011)(186003)(41300700001)(2906002)(5660300002)(8676002)(8936002)(38100700002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1dvWTVXQkFqQ2Z5US9FSFJHQUFjZWxIeW1sUnVYcUFReklLejBGOGxhS1ZY?=
 =?utf-8?B?UEh0ZjliNkRDN2MxQXV5SEdXaXpBS0FYMFVxRGhkbzBPeDJIeDBYRng2SDFQ?=
 =?utf-8?B?c3dISWhzMWRETnlxU0pvWUxPMzZoRGFDSG9QTWU1ODBvQjkreERJdXJrdTFO?=
 =?utf-8?B?eDg4b0F1N3RqT2dTREo3aEFNWHBPVkdqNDEwWWdWODBkMHRZZ3ZuRm91a0M5?=
 =?utf-8?B?UUU0eElxaFZ3MUVWVlR3OCtUS0lmSzhiK3k2MkdOaU5lWTVPSUdhNXQzbUt0?=
 =?utf-8?B?bU1adkVhb2w0QXVYb3QwUG16VHhncEpac0VzNEFFcVFmNUtyQmlKY2xoR2ho?=
 =?utf-8?B?ZlVua0ZWNDliM1hvZFdvWmRCSWpUQnZqYVAvTDdTcXhGbGNnSVZkRXU4RGpn?=
 =?utf-8?B?ZGl6cTQzNVVmTFNHUEpSdUdtZ0F3amZWemdBSWZRMCt4TytjckVSZWJRVlBj?=
 =?utf-8?B?NzY5em9rZmFNQlFqMjFMVjdjOTlzbVl5VmdHUmNmZWNkTS9MS2c3Q3d1dCt1?=
 =?utf-8?B?VEpadmdmK3RBZjdUdjQwcFhIQldWT2haVitQdnFZWVhPWE9oTi9YajVrUFNF?=
 =?utf-8?B?bnhJYTQyREk1OVc5UW8yZlArcUFHY2VkVW16V2RPL3RNTHQ5ODNhTGtBTHc3?=
 =?utf-8?B?RW9zY0V4ZkFLWTZCUS9qbS9YNy9OcUFxZm5UWnM5NmZ2M0R4eW44N01iYjlQ?=
 =?utf-8?B?ejhuZzVoWW5kUGVnSlcxWHRrMk5xK2RtLzdFUndzKzc5VGMwYmdOYnMyYlFN?=
 =?utf-8?B?ckhOUDVIb1I3bnVMWS8zcVVXNW9wQmJFOTF1R0pqcjZ1ZVIrY2VBYW9yOVYy?=
 =?utf-8?B?UENHT3psYUc5aGV3RlduSEdaY3VmWXRWdmFlUmxMS201UW9yNFJvTDdndkFN?=
 =?utf-8?B?ZlQrR3RpZFR1OXlKelVxUmIxQkxocm9IcVU0Zk9pUjZaZUxJbTZOclNGT3JF?=
 =?utf-8?B?VGtXTXZZcmswV25CVVlGbjRXeXlQZkwxRVhuSkUzVFFsYTRFVnZaN05VbHRi?=
 =?utf-8?B?NGh4UkVPWU5nZEpBS3hhMkM4VnBvNlBieFg0T2NIcjcrNk5la2R6RU9va0FK?=
 =?utf-8?B?aGFCTjBEWmRHTEV4NDhZS1NTYTJISSszTlBqVzIzUWpaNDNpV3FIQTNjZWJn?=
 =?utf-8?B?K0JGWkZXVDRPSmVJSjg4Z0hBL2U1NE5QZVR0T0pPcnNFOXNWamk1YnJxcnJx?=
 =?utf-8?B?Y1MwNEdDNmphd3NidTZ6S0NvdGxiVjBpai9jWTkrTG12c3NXbXlPNWhTeWFO?=
 =?utf-8?B?eE9LZ05ZK0hSbjl2VWFmZDFSMkVXL2N3SE5GSnQ1RlF3WUFTZ3V3MEdkSVZK?=
 =?utf-8?B?QjNrQ2d3TGFtOG9TMTVpb1hWNVdJWXFFYXFCQkNSVGNPdTFFQzNlVFVpMnY0?=
 =?utf-8?B?TFNIbHkrQ1hFdjYzUFJPdEMwV1dJMThTOEd0ZFZGQXcrODhLSXMxbEhVbWdi?=
 =?utf-8?B?WTZQNDNkbk1BQ0RJT2RxUDVVaERSUTR3MnJUU3VpbDljS28wdElGTGppVElK?=
 =?utf-8?B?bWhDcDJQeGpTN3JWQ2xMSXFib1VhSlFpY3pwME1HWTdLM0hBcnZOSG5kTjVQ?=
 =?utf-8?B?aUh1ZkJzVStIK1F6TTZpT296VVp1SGg2Mk9MYlZ1c2E4NnJWaENIblVzMGUr?=
 =?utf-8?B?QkZxc1Jua3dGcFlLQkVJLzNKSWowNEVGWHZobDNCWHU5SEJYQjBUSi9KUU52?=
 =?utf-8?B?bmVYVVhsSWdpSlBKME5hOEx1VmJPd1h3b0s3ZU1nMHpZUE5rNTEvVEw0TWlw?=
 =?utf-8?B?SWlIM0JBa2ZlaUFQKy85OUtxc2g4NFBJcWNVbmZUNHkxV0JLYnVVWFNYWGtJ?=
 =?utf-8?B?c3FPejNEclRqY1dKanpIaXNMK2F3UnIwYUU1QnFDc0hjWkt2TEdCODZNbGMy?=
 =?utf-8?B?Mm1aT3ZrN0J2dVRhTVRpckFEQTJqSVNIcVJxNnl3UjNVRmhmQkFrNEw0Z2xa?=
 =?utf-8?B?NUZFbVZsd1ptNFBOb3JLL25nVkNjRGkxRzBxaHAveFc5Y3loOWxmdE9rRlVQ?=
 =?utf-8?B?aWhGc0VXZnphUllRSUZHN0lsOE5IQ3JXVXNWdndsQVJ4bzN1V29PQk1KZzBo?=
 =?utf-8?B?dVNVWXdNNmpIQUlOTEl6NTRxZE85ZG9HS0RRR3ZsNUdDZE5GZjhRSkNLTXZs?=
 =?utf-8?Q?Sdi6KhCf2McN85z2AMbsATWPo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9583befc-75bd-4df0-6108-08db4bf66703
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 16:49:46.7835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fgKudBZMl92uRWGb5gX1tyWNqs4Xr1QdBpy3rJQWgw44NeYBLAEyUAphN98oiVc4oZbZdM/7WCkT1DGmYLnRpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5412


On 03/05/2023 08:40, Julien Grall wrote:
> Hi,
Hi Julien,
>
> Title: Did you mean "Enable spin table"?
Yes, that would be more concrete.
>
> On 02/05/2023 11:58, Ayan Kumar Halder wrote:
>> On some of the Arm32 based systems (eg Cortex-R52), smpboot is 
>> supported.
>
> Same here.
Yes
>
>> In these systems PSCI may not always be supported. In case of 
>> Cortex-R52, there
>> is no EL3 or secure mode. Thus, PSCI is not supported as it requires 
>> EL3.
>>
>> Thus, we use 'spin-table' mechanism to boot the secondary cpus. The 
>> primary
>> cpu provides the startup address of the secondary cores. This address is
>> provided using the 'cpu-release-addr' property.
>>
>> To support smpboot, we have copied the code from 
>> xen/arch/arm/arm64/smpboot.c
>
> I would rather prefer if we don't duplicate the code but instead move 
> the logic in common code.
Ack
>
>> with the following changes :-
>>
>> 1. 'enable-method' is an optional property. Refer to the comment in
>> https://www.kernel.org/doc/Documentation/devicetree/bindings/arm/cpus.yaml 
>>
>> "      # On ARM 32-bit systems this property is optional"
>
> Looking at this list, "spin-table" doesn't seem to be supported
> for 32-bit systems. 

However, looking at 
https://developer.arm.com/documentation/den0013/d/Multi-core-processors/Booting-SMP-systems/SMP-boot-in-Linux 
, it seems "spin-table" is a valid boot mechanism for Armv7 cpus.


> Can you point me to the discussion/patch where this would be added?

Actually, this is the first discussion I am having with regards to 
adding a "spin-table" support on Arm32.

The logic that we will use for secondary cpu booting is similar to the 
"spin-table" mechanism used in arm64/smpboot.c.

This is :-

1. Write the address of init_secondary() to cpu-release-address register 
of the secondary cpu. (In my current patch, I attempt to achieve this.)

2. Write to the configuration register of the secondary cpu to bring it 
out of reset.

This is the corresponding patch (yet to be cleaned) which will be used 
to do step 2.

--- a/xen/arch/arm/platforms/amd-versal-net.c
+++ b/xen/arch/arm/platforms/amd-versal-net.c
@@ -36,6 +36,47 @@ static int versal_net_init_time(void)
      return 0;
  }

+static __init void versal_net_populate_plat_regs(void)
+{
+    /* TODO :- Parse 0xEB58C000 ie CORE_1_CFG0 from dtb */
+}
+
+static __init int versal_net_init(void)
+{
+    versal_net_populate_plat_regs();
+
+    return 0;
+}
+
+static __init int versasl_net_smp_init(void)
+{
+    return 0;
+}
+
+static __init int versal_net_cpu_up(int cpu)
+{
+    uint32_t __iomem *cpu_rel_addr = ioremap_nocache(0xEB58C000, 4);
+    uint32_t i = 0;
+
+    writel(1, cpu_rel_addr);
+
+    /* Delay has been added due to some platform nuance */
+    __iowmb();
+    for (i=0; i<0xF000000; i++)
+        __asm __volatile("nop");
+
+    writel(0, cpu_rel_addr);
+
+    /* Delay has been added due to some platform nuance */
+    __iowmb();
+    for (i=0; i<0xF000000; i++)
+        __asm __volatile("nop");
+
+    iounmap(cpu_rel_addr);
+
+    return 0;
+}
+
  static const char * const versal_net_dt_compat[] __initconst =
  {
      "xlnx,versal-net",
@@ -44,5 +85,8 @@ static const char * const versal_net_dt_compat[] 
__initconst =

  PLATFORM_START(versal_net, "XILINX VERSAL-NET")
      .compatible = versal_net_dt_compat,
+    .init = versal_net_init,
+    .smp_init = versasl_net_smp_init,
+    .cpu_up = versal_net_cpu_up,
      .init_time = versal_net_init_time,
  PLATFORM_END

>
>>
>> 2. psci is not currently supported as a value for 'enable-method'.
>>
>> 3. update_identity_mapping() is not invoked as we are not sure if it is
>> required.
>
> This is not necessary at the moment for 32-bit. This may change in the 
> future as we make the 32-bit boot code more compliant. For now, I 
> would not add it.

Ack.

- Ayan

>
> Cheers,
>

