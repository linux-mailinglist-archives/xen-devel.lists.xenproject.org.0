Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BD37E7AF2
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 10:35:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630049.982715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Nub-0006WF-GF; Fri, 10 Nov 2023 09:34:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630049.982715; Fri, 10 Nov 2023 09:34:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Nub-0006TZ-DE; Fri, 10 Nov 2023 09:34:49 +0000
Received: by outflank-mailman (input) for mailman id 630049;
 Fri, 10 Nov 2023 09:34:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jLlG=GX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r1NuZ-0006S7-Ta
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 09:34:47 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6314b565-7fac-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 10:34:47 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7584.eurprd04.prod.outlook.com (2603:10a6:102:ed::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.10; Fri, 10 Nov
 2023 09:34:44 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.010; Fri, 10 Nov 2023
 09:34:44 +0000
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
X-Inumbo-ID: 6314b565-7fac-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B/mwU26/HX6YgGTuxPNOSy48C0lg50X7WEnYRWFtsgFr48sk/YccsnQE6p+kwyCQ/wxW62LZ+9RyFS4LTSsTOXYYtuh4bYwC/lbWwruhR2ftbMvqd7k+vJM+pgRowySAQCQj9H4lJ8JH0+Jh7G51HhZO2kuyzViHB4N9YPj5z5u56cp4RZc2JEPlUylv7m2lkqSjkgxbQk7DWe1fj2vH+0fkgcaPaF1POmvOxfv1lJy3PFJNzAu2YvB4X/22f3PO/Q5ZZYRAuWHZRi+C+qlBYbn4kMNKGN+qCCGhPrTiQlfXMJeKtyMIEI64RIqcDX/xQXtKvI4qUY0o0gm4h5B/bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQMTXp8hgQIkI/VQbbdppFggdV0nhGdskW9+sMqBag0=;
 b=DIkmjy9IKJ5KslL++EZYMTc5bkiYbqLERvyLLdwIHT69yO59J7okVt9hG7bQZV8ahqFB3sgU5HW12kvnmXBAhnXr7h1BPMoQoumroM5D5x54Y1YNN2PAmI547LwWYChq107DREKsOFsbqVocetXsMGbYIUKWkEyneLTq19n+t4TBtABLPIhZYycmjtg8TFofHHwZSmJ3tIqAPF4NQU1VAZpljVTTfC0/n6kKHZuBCLFJE6zD1ueulcYUwDD3kq3BXI7BkjZJ5QzRbaFph6M9yOtMcni3pkR4I8xgVLb9NoxMGgbeqCifFUNOUONGV8IKUMWOay3Rfi8hLSCWipBWSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQMTXp8hgQIkI/VQbbdppFggdV0nhGdskW9+sMqBag0=;
 b=WeQ9SEJy90NqCdmfouUcItImkjzDk/zGjL6RmdC8rl10E0Wgk5nzdHgI7yBlENb6MWd/TJFfY2krw9Gj7rHA/PnfwZFdkiChfgdKAbaS6DBb77MrgC/kJKIUhi+mxogQzWvsJOKCuIF6/DAyUyee6wGAprz5JtpLfXvKnnQ+rBkPfXwHq8eGqtyeTiVXY1yAgtcWvSDWRKenCeVpffZPFvP0/6f+D6EPwmRrUojk7J2Kj37usLYOyEQkb9hhm/IRKpWpsc8EWRR3a1Q0UkalJVePI8J/bsu/zH37TppO/Tu82ONYgTAL+lHOykWyU0u6T+Cerv2FzLFLJxwnxHg7JQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3d411372-8092-5f78-6905-56e13a418bec@suse.com>
Date: Fri, 10 Nov 2023 10:34:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] xen: avoid generation of stub <asm/pci.h> header
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <f3fff005a4f9af419144d768afcf2fd4de3f21a4.1698833709.git.oleksii.kurochko@gmail.com>
 <1d89dceb97c82504d4ed66d95f799f0a2e433716.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1d89dceb97c82504d4ed66d95f799f0a2e433716.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7584:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e7c9c3f-814b-4e86-e650-08dbe1d04607
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UbZ8xWTy8cY5F+9BXDkCpMts560qYpfWM5j6iHFk/3BVvQgVJXuofP5j0e7W9El5Ycl/iNssJygT/CciZK1O/owGhyZQ1GePv+sQaYrxePmFlGGBEFrBOEmihUbeZFkjJPlFQawfPI2PJCJv0e0K6x7X6JCTZU1mOPcUUsAtjWiRn+biGuZKJT35yX+aLua1pfElURoLIOA0G/EbNAwDiU4KpEpzJAenIdn1ZKfiv9Y0p643QScXQQEkO38EnWYj5o2qCQ4BhWh+rymkAQcQ1fYvR6+iyPJEsqjD1O4TJGpsKyXEz9bMH/k+HHTuC+33cmfjOgwtF6gJ8isOAulgALLdabiEEjwdGm06vZdBND1QQ58DBfXaWaR5d6pL3nxqXl48K26L/IX6q6a3LjI3haW5xj091KdnlVt5TLS2j9QsGdbBOFCfHs81cidT02AwKWf77JkoEmA6MNw9Yny9oJOqDUvejXMl4FpbppwM2+fH+mFzLvM4rFwsFhHooySVPsWUTGtKVmNAk7jjAvK9kq2GDKtAlK8YtjvzVQ4MlkuAAP6FOVa72FTda15myR9laHwxZHXVrNDRAMM3Vxjgvzx5UiZ6y1glSAeXUr7waiUjfE0VQliWab1mp4iSYtnCDL1BAYyK+0Cv3qtr/gbVPA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(136003)(366004)(376002)(346002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(31686004)(6506007)(53546011)(83380400001)(38100700002)(2616005)(6512007)(558084003)(2906002)(5660300002)(8936002)(8676002)(41300700001)(4326008)(86362001)(7416002)(36756003)(31696002)(316002)(66556008)(66476007)(54906003)(66946007)(6916009)(26005)(478600001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3RwaGlGc21mTE0ra2pCMDdmSkFQT1FwOXY0MmdXRkRyalNuemxrNlJtTksv?=
 =?utf-8?B?c3BRalU2OEhYVit4ZnZvRFdORHRSTzJRY0FvL1BSRlJVU0pnYlpvZGIrZE84?=
 =?utf-8?B?UWg3SStDNzA3NXlxZGloUmtlT2Y0VmJZd0tCWjdmS0tlLzFpL1pVcDY4TElD?=
 =?utf-8?B?N2U3UDV4ZmhHbi82cHp0QXc2bDlkNHEyRElZeGxmOUQ1OVgxelNvOW5EMzIy?=
 =?utf-8?B?dDVXMVZhZEdzanJSVE5MM2JERnJaUnFqZ05ZaDlndDhBSXNOSnNVSEZycFBD?=
 =?utf-8?B?ekJNK05sb0xRSi81SVVrSnlaUkNmZElJdHROR2NjMG1IUno1V00wYkxHQ3hv?=
 =?utf-8?B?blMwem93SUdwRWM4d0htWklqVWMvME04V0VveDUwNGRQclo5eVQ3a2tuYXNy?=
 =?utf-8?B?cUpROVNHUEI4UEtQNFAwc0I4TW9DU2pNMXFHY25CQnFvNGhPS3FJTjBVOUMz?=
 =?utf-8?B?TmhRZ2hMRFQ0bGo0UHNaTHBraExaNW5DU1NqZjdkczZ2TXo3NFB1QXo3Yjdm?=
 =?utf-8?B?c3YvcXVxZWlpMnl1ZDJnQ3hIbXdRNUVMdncrS2hQc25VYlpGSENFeDVMNFIy?=
 =?utf-8?B?SUdVWmRXeTVodnc3dmRUSnFSRWg0NEgxU3RMeEdpZnNJRDQrUytma2plUEVs?=
 =?utf-8?B?TURpSHI4WlBPUkYzVGZzcnlpcUxOUFFueTN5QlFkbXVWU2NTYVBiVmFvTjdU?=
 =?utf-8?B?WU83dHhDSE95aXZBM1FQa0ZaQ1MzbjBBdEt0YmtCRGpOVmpVbXVqdDZlWFJk?=
 =?utf-8?B?eE9DRjJManNGRFUwaW1rckVoUnI2UWZGYVVJSkVaOTFoaHFNc0NtK1MvcVhh?=
 =?utf-8?B?TWFveGNoeHN0MGlXQldMWW1Sc0phY1BrN2VTR0lhWHlJQVJOQVRlZDdxQnlz?=
 =?utf-8?B?alAvSndUcTJqM3JtUHIvUUpGWEt4QXJuSkF6bkNaTzV1M0hvcVFaZGtjSEZk?=
 =?utf-8?B?b3E1TDMwVkRKcWc2eFVNY1AvSUdBK0gyV1hMejFNbTA5cE5IdkdqMGFSak5Q?=
 =?utf-8?B?ZmRDMkxFRUMzSkZHZzhpdjNjZzVqckRvQUNraENtWGZwMHFRSE5sQjBOV2xU?=
 =?utf-8?B?RVRuVnJ4WGtPWlR4bGkwTFB6Rm4xTGdrekYwN0N2OXZ3YlJSOEl3c2pnNkNu?=
 =?utf-8?B?THNPc3NNN2ZncU1lQkxrTTVIUEk3ZkY5NmM2ZHpLZnAySWZnczlFQkZreUw0?=
 =?utf-8?B?VlZMQ0VxTkd2OUVvUWNIa3lLcHFEblkxSlYweCtzV2g5VUlkcVVQSWx3SDlu?=
 =?utf-8?B?bmJMLzgzb2orTDBQMmJYZU1WSGhzWnBORURhdmdKUUVnaGNFczd6VEcwYnJR?=
 =?utf-8?B?R2lXS3VJek41eHB0WHlad0hETGkvbTBtZytCcVdvNUZaQ2gyem1UdDlLR1Rt?=
 =?utf-8?B?YUNPbnhzOHhTMU5RZXh6MEluTlhwNDVBbTZsZTRxMGZnQ0t6U0tOWnFWdkRV?=
 =?utf-8?B?ZHJ1VE9nWXVwQU5XZlZJc2hTUDJwN3FWRWR0R0s0QTdBejdEZDk2NkRpSlBU?=
 =?utf-8?B?T1lpVXdza256OW5aVkd1WlZjNE1EVEFrb3hRcDM4M093ejNPVWY2R3BUZG50?=
 =?utf-8?B?K0lvcUUxSk5XN1JJZHh6MW5venNiRjQwZUtURUJ6Z09yMnNIYmtpdEcrdGll?=
 =?utf-8?B?ODFZQ2pGVlEwaWEvV1BRVWZiUDZlTVlKRmFjbS9LeWpmZmZCaU04emZGbUFZ?=
 =?utf-8?B?U0dCNTdIYlVpUU96QWtxeWU0bHI4YXRXUkJ1WkRyNGpUR0ZVSFRHdnNoR0M1?=
 =?utf-8?B?bERjazlHaEx3OUZlSjJaY0NWUXdPanVjT2FURTR3ZlJkbXdhdExta2dmRmhI?=
 =?utf-8?B?Y1RyN0J6THhWTmQyOUxZekdRVER2Z3Nqc09oL1diejZuNlRQVTd0VjBkTjh3?=
 =?utf-8?B?Rm9sSTF3Si9LUkJmaDVOenNQcGg0ZmxhT09vTkRjZHFYdXdDdHZXZ2JGQW1n?=
 =?utf-8?B?bGRsaWM2MjZ2VkZCcDlvL0pXcGVnMTQyK3lqY1hlRTNqbUdUcTlqb01Ob21r?=
 =?utf-8?B?Yjd0enAxT3l0WjZLTnJNWFJ0L1NJSHU4TVZQb1lBVkxmR05CN2lVZFdheDVv?=
 =?utf-8?B?ZEt0bllacnE5VGp2cG1GWmJNVTIreUI3Yi9vZnpjUGVaN3JSbWMzd3pWaWtD?=
 =?utf-8?Q?m1x1wmK42XubEMX3RY+vYnXNl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e7c9c3f-814b-4e86-e650-08dbe1d04607
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 09:34:44.8962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VjachBA1dwBTmDni+CUJFImkFSDhWSnmtTFhdHmrkCyKhC54aittqjso43nCW8V1l+wPlAVhTRyw6YTKQS7M7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7584

On 10.11.2023 10:30, Oleksii wrote:
> I forgot to update xen/arch/{arm,ppc}/include/asm/Makefile:
>     generic-y += pci.h
> 
> Should I send a new patch version or it can be updated durig merge?

See the reply regarding delay.h.

Jan


