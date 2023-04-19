Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0906E779D
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 12:43:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523313.813252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp5Hj-0004Fe-Gv; Wed, 19 Apr 2023 10:43:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523313.813252; Wed, 19 Apr 2023 10:43:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp5Hj-0004CO-Dy; Wed, 19 Apr 2023 10:43:35 +0000
Received: by outflank-mailman (input) for mailman id 523313;
 Wed, 19 Apr 2023 10:43:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8hvW=AK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pp5Hi-0003M4-62
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 10:43:34 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20614.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 077a0a5c-de9f-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 12:43:32 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7671.eurprd04.prod.outlook.com (2603:10a6:20b:299::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 10:43:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 10:43:30 +0000
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
X-Inumbo-ID: 077a0a5c-de9f-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nWZusUWWS4XnvYn3sYaFSAyrB+noZ9zD46RCHxst2erhSvm6/hC1vRBx4Z/7w6TR+OitJit7Nc8C+289fZ6aZAWg36NqqyA6ysDNBKMV3MmtoGE4rckUPa7pXUYT0reudupigBsGkVXVPylaK7vN+3zqbWpbLJ5/jbppOa4H2XWj2rCtPKQ2oDBVUNb9bnbj/TEfM/qu8LcXAWLuHhwvHX2spoVcerE/9tmtbJK+tcFTGGcOWkN9vjLZgJILZBWxD7HSSi1XivKrnXZqlBoZYEAxUfm4GJ4e6aXOLWtTiZ7PmbSq260+ZphxC7gr2eKX+erzgB34wWiKxTOXLWvP7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1WLiDF52gwlGsA56jTGQEg+iCy+r7F/0Tm2Kl2/K1xA=;
 b=IgNZaSQkmnY7xhBhJQPJxsy6rO1B9sx999f5NrHyOWIaYzWEdOgstJc1roINwTtvshnCC1jZN0VhbEqnzjJXTg/F6402olEJ4C9wNLbdMzF/raX/2dQNmQm85qV+EVIlWWyc/UOkDYl/YVBd6lWQiVNT2i9iNtgbZoACCB1fSlg9XwnGsO7sKW0/+UOvmNRuiYTPOO4NtZJyt9FPliDL8TMPM6zgEkimGRkoox7oTYSA5a/+HNbO6YsgUWgSgH5UpEx5aXNNv/ZkzEwOUaacYlvmKKqC5VvKMq/nScZKzx8LkNVriFdVjBlzmFUgkLZWMGY+kLXq4HKDLKOlKrfbGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1WLiDF52gwlGsA56jTGQEg+iCy+r7F/0Tm2Kl2/K1xA=;
 b=t0HsMPW6fVjuf7p2ADgLhNu5QlgJLQnxfOChS6WCr6zzohDWLobOlRz0CpruFyu7EDNXL2f05/OR1XF0mqqbi1XLNx8EOhNuRAyRAlwU7mEtxoeRBajpCXZ1TtLfQ165L7xPSW3KoYreTD1mG0xcgpN7ZJ++y2PzV0Jkx+knMBeBBllT1R9Tgat5DDAv12De17SD85dq27TxhxZOIkL1gj8+UboTkZpim/DEod1ADTR8zmGvOIdO7CuIWlkOg/8CWpZ6a05WFz991Wsjg5fIFI6VhpAlUaDDxIt6CACW0V2rkpqsmAqU6N6cpTKuQaoL54m23/VxVfpWNqM3in08+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4b42e920-f007-186c-d838-a0294bfa86b5@suse.com>
Date: Wed, 19 Apr 2023 12:43:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/5] x86: reduce cache flushing overhead
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0161.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7671:EE_
X-MS-Office365-Filtering-Correlation-Id: 00dcff7c-defb-4db7-7c5b-08db40c2ea35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WFyGo7IyS7NTh2vE7ainYgSzvDmcOgt6C6z4GpZ78Yx0DAXCCAE0tlPXCxqYoan9d5bto5ceINwyQXnXPplqibVsRW0GanumBSNDEkaKmcCIpuGl8rDNcHQB+OlNaTg5HXnpK3e1kXd+vKTs5IkW5lza85i+71zzmx7LUds9fP/81LmAPUPhys6JH0/UDaC07eMcH2vUicI4j/rR6sdXWccqFGclHy5F1oCQamPVpSHzjdQyLiJDJazr5Nlyn9qgT1qUUs8aZs8LMYix3HNET7J4J+tVp1HnUBqtH0voOf9h/P/ovyIMXgRWkllskJqhfU6O7tTS/3AxRRoYfs3F3GMnV/f3OS0ISqTxgiHdPP/5rHTP4U25kiGLZqHg6pPkE/VPaH8QQXcTc/xgp8ex6bhJ53xJFgcpiFhblIkLhk0lrR2MFBlKFPOZn2lBeVczi8xQe07mqsQwje4h/YH08HGl/ftfo9GN/Ac+10StXG+sC8Mm0zCW0F8CYeXBUIypCPn9o5PU+Y6RFc1JC18xvM8EuLrzxVbPld7jXLXkxlEO3HQBTHrPI58CjXldaI5C3ZZP6iMiDGkyy7wgHixMUYdKTVBXwzwrfghRQzr6/lN8mxThCLma14pb/mqIYUYo12RiQ0TNMsmrFtGo4CO7jQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(346002)(39860400002)(376002)(366004)(451199021)(5660300002)(86362001)(2616005)(83380400001)(31696002)(6512007)(186003)(6506007)(26005)(38100700002)(8676002)(8936002)(54906003)(478600001)(6486002)(316002)(41300700001)(36756003)(4326008)(6916009)(66946007)(66556008)(31686004)(66476007)(2906002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2Z5MDVmYmxlL08reXV6OXdFM01Pc1VFNk00RW5yVkRHQTQrT1hBUU9PeEtN?=
 =?utf-8?B?S3dEc0pLU1gwdk9Yb2hXOFFJdFZ4VnJ6akhpY0pwdmRNN1pRK3VkZTBOTjM1?=
 =?utf-8?B?SDlmOTlTV092NnpmSlVvemVVbmtXYUpOMU45bGV3RExCcWNwZnFTLzQ4Q1Q5?=
 =?utf-8?B?VVFJZjN5dlhMUGxoZEtBSU51MjNiczZid3ViTjROWWlUd29kL1gwK1RmUE1M?=
 =?utf-8?B?R1NCVW5TYzZpNCtndlVmYytvMVFoelBtdVBFNDd1eXBKOEFtUnN6SzRpZnpa?=
 =?utf-8?B?UVh6cnNjN3A0aWdWNXB3TDZUc0dYUHFEazUvQUNubGtZMVl0T0VMeUlwelRx?=
 =?utf-8?B?THdEVEZCdHpWNEpubDVIWXhYdkR1Uk9kUGdiQU5vSmZ3WmovRWhuNEwxazNX?=
 =?utf-8?B?Zy9pYksxOXJucE1DVnBhWTRNY2RnVVE1QVY5QWhHVk52REtIUjRIazVpOEtt?=
 =?utf-8?B?VXFCaWEzTHc0aWlKZnBrSEtaeFNQckkycDNRNlBtbkRKMkpkVXM4YW84Sm85?=
 =?utf-8?B?NzFnYXUxMHA2VlpsdHBWaWRNNytpZzRMVnJHL2hGd2RYeW9NakRlZ2pGUFlw?=
 =?utf-8?B?Vm5td3RpM3NnUEJ3cDF4VjVDQVZocmlncHovN2toYlQyUzZ3TENibHdHZE04?=
 =?utf-8?B?OHVVL3V6NnhRRXB1WkovTTFCNWk4UUdMeWhob21wU2VXNC9nRzZMVHpQOFZq?=
 =?utf-8?B?OFhFc1VqYlc0NWFkNW0yZTR3NHhDbGR4Uis1TkxWY0h6b2U4T3FLbExCN1Uv?=
 =?utf-8?B?VkVqZEIweWlVdUdpdzZlWERLWGFjbHFVSnhCa21NQmIzbnJhZHIxWDUvcG55?=
 =?utf-8?B?T0p4TkdaWVZPWHMzeVBuTnErZTk3bm95OUQwV1RuZ2d3aE1TYnFQa0xOOUEy?=
 =?utf-8?B?Zk1zTW90VEtReTRweUdEN09zc0FMWEMvTCtMRHMvUG82NnNCUUVESkl4QlhU?=
 =?utf-8?B?T3NLT2pPT2ZLcUZtcnhJN0tZWTVKbDFUc3ErOEhvemVYcUxsRHZCWGM1OHFr?=
 =?utf-8?B?VE5QUTR4MHF4V3VBWmZnaGtQKzRlcEs2ZmpST2ZHVTZSRCtXaTlndmo4STlB?=
 =?utf-8?B?Tno1Uk1hUFZzWUpTanZzejZrRG9zUzZmc21pMmdLeHhSRm1WSjFhRGc4dWVk?=
 =?utf-8?B?YWt6c3dyMzZsYzRSOUcwWXhQK1pZU2tvSTZpN1lOb3owK0o1L0NnN0tkZGZH?=
 =?utf-8?B?NTV2bGFVNm02aW1ycTJBbU9KT0NEbWtPcGJkY1JHL3BZelpOSUhVeGVETVdh?=
 =?utf-8?B?d3NSaUJuamlzbldqNnVsYVZCL3FDb3U1b1dmMXBmMy8yZFFObXRQZG9KSkFU?=
 =?utf-8?B?RkN2WWFoM2g4U1QxOEJCNTRBME81VFk0NHZBUW1ONGUybUdzOVBPbHE4WVJr?=
 =?utf-8?B?RWl1dUxzakNINkJ5eWV5RCtHZWJncUkwY1V4NVI5MXNKdWtGZ2I0WTVqcThI?=
 =?utf-8?B?czV6K1Z0STczQ0xQT2pnMUttMk9vdS9IeW1VanNPWFZ2WDk0WFZpWXNWNWtN?=
 =?utf-8?B?T1ZnNDRSdWExYzN6YmZoaDQ4c3k4WWVrcTR2VFRuaTdENHVVUThLUURham12?=
 =?utf-8?B?dlM5bXJmWTJYMVNrYllPRUorRWVFQVBaMll1WDU5bHFZQXlOYzJPYnNTQWZ0?=
 =?utf-8?B?YWh6RlZESWZwMHJLQVBZd0Z2d2E0dzExS1l5MjNCekVMSXVIQzZOWFN4Qkt6?=
 =?utf-8?B?TWp3RmZDR2I3N1pIU0p6RU9NSXFnRDhpMjZwTVo5SVVzZ28zMWp5MHFDQktt?=
 =?utf-8?B?M3cxQ2ROSENBcmQxZG90My9Ud1dUUVhWVmRocTczWXBsY2N1VTE1b2tDb0E2?=
 =?utf-8?B?NTB5RVM4bm9yZUQrZE5RcVhnZDFZVVVxRG1iciswSkhockcyRmdhNlVoaWFF?=
 =?utf-8?B?Y0FlNFdJa1UwemJuMVZGRnMwVWFjcDVNdXhROTBZbnc4bXNPUVViMU1sL1Nz?=
 =?utf-8?B?M28ycU0xSzF2a2tNd0NxWDBMc1J3N1VXMGR0RTdxK3MxMUZFVkZmNWczNW1L?=
 =?utf-8?B?T0JUa2hkQlNsZkNrbXdtanlicUJZOGdOcDQ4TnUwWW1kUXBrbmJnM09MU01u?=
 =?utf-8?B?cmN2SGFjYlpKWVRGc05PeW42cCt5UG1ic1RDRjZ2VEgyWmtES0hzQlNMYTdK?=
 =?utf-8?Q?GW1nrg0LKPiX1+JV8vQWs+z2Z?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00dcff7c-defb-4db7-7c5b-08db40c2ea35
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 10:43:30.2466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YDbfOIhRX8IbIUUWytVwqrW39cqScV8DTIl5Uacri0uSMy0gCvPAqwX+CkmZtbNEdEbqMwmiWUFLU5Cttkptmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7671

..., first and foremost by using cache write-back operations instead
of flushing ones when available (and sufficient for the purpose).

In the context of making the last patch I started wondering whether
for PV we don't flush (write back) too little for MMUEXT_FLUSH_CACHE:
Just like for HVM, pCPU-s a vCPU has run on before could still hold
data in their caches. (We clearly still flush / write back too much
in MMUEXT_FLUSH_CACHE_GLOBAL even with this series in place.) We also
can't call this the guest's responsibility, as it may not have any
means to have one of its vCPU-s run on the intended pCPU.

1: x86: support cache-writeback in flush_area_local() et al
2: x86/HVM: restrict guest-induced WBINVD to cache writeback
3: x86/PV: restrict guest-induced WBINVD (or alike) to cache writeback
4: VT-d: restrict iommu_flush_all() to cache writeback
5: x86/HVM: limit cache writeback overhead

Jan

