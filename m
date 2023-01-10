Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 700CF6646E9
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 18:03:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474859.736259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFI1c-0001FY-KT; Tue, 10 Jan 2023 17:03:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474859.736259; Tue, 10 Jan 2023 17:03:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFI1c-0001D4-GZ; Tue, 10 Jan 2023 17:03:00 +0000
Received: by outflank-mailman (input) for mailman id 474859;
 Tue, 10 Jan 2023 17:02:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+HTt=5H=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFI1b-0001Cy-7y
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 17:02:59 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2087.outbound.protection.outlook.com [40.107.241.87])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1267c03-9108-11ed-b8d0-410ff93cb8f0;
 Tue, 10 Jan 2023 18:02:57 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8867.eurprd04.prod.outlook.com (2603:10a6:20b:42e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 17:02:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 17:02:55 +0000
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
X-Inumbo-ID: a1267c03-9108-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jkohcWCfECVyCb6zKOCfQ4xFq40VD3aOkssTdTOc3V92DV4oyOosKsQ3T1uWQTqWYALxmBwuA0aEqcVPYwF13vabvqPrAcMgVIK4JMaU9DpQZ9NHPm5tWhbrauQQMzgFKix7GJIqTNKNVBA3hslltXWSuucQtLSFPmf2eXOqWJ9yiI8FORj3N9iBP6R6PFmh4hgMwMh3TluoNbDrod1ObVqF9nNeFfpY50TNXc1E0WtjrpGtIZNUntAFCjRx+geL8OX2q65Y2jy94ol4LZPidZCFyKhukueOei3YE/wj6c9qqYH91sU+ooS+bCEnGxm8BizVoT/m/JTQyJrpD8neCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vsvIstwP9A5FBf1MATw/te3HnzA+g/ivPO9HJCk33A0=;
 b=S7fKIWiJnK4hUzYza0p61ZaL+YYBY7UfaVVUDTrZLMF2HfCd5itiHj1VtvXUMrKhIQyoKni9wvBhL8iBOBGyvSDw+EmybGa7FuU+7l0nYxU9/zFrb6dQwfGeT7NCFFjK+4crXvQc0SjbW0rRgZvXjuWfAvODO+PdtXDgObNYBZzXM2dM/ynArArJems5W3VXeUiesROCe25/H5yBaXqE5rVt716uh1xy/59EynFMxGPrThGH3mLDhXa8qlcJ1x7P8hwoR6u2RiyOQdp2o4E6PxenRH4YKRmO2s7uMKXZRA0Qou94tvOmwv7Cmh4lpCorp25UkoNDuCEFfkyrWc4sdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsvIstwP9A5FBf1MATw/te3HnzA+g/ivPO9HJCk33A0=;
 b=MHOUpJchMY2aKAt7pZ/XzrO/glwxQLHvF0x7IovDYXCX0cFI5sS21RRDI+hzAgTgR9rS0dylhlyxDHhR5QJUVkcZbn1AcgGv1qUm7L4ej75m2JxLDcO0lGXLMYqnHC59moSofCdvaFVdQJDg3dfTqodEa7h3xZF2cb6qGNJ3Wwn41QjA+iea+Sr3d9hvf7+gNnfvG0v8zInjuTc4SYp2768hk7ZHZybMokO8pVoI4OXuvs714QFabXLrMCH9c8tcyaz+lGekOvAz0FMbNIOliwDUSroPLXuZySki93RO6wUshmYKGG7K4uDYFqrVbKwMc54YVET7AiyHD7jLm0UajQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <891d0830-7fdc-202a-5f12-2364cae5bce5@suse.com>
Date: Tue, 10 Jan 2023 18:02:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 1/6] xen/riscv: introduce dummy asm/init.h
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1673362493.git.oleksii.kurochko@gmail.com>
 <b1585373e39a7cbe023f485aa5a04b093e25ec80.1673362493.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b1585373e39a7cbe023f485aa5a04b093e25ec80.1673362493.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8867:EE_
X-MS-Office365-Filtering-Correlation-Id: eac8c3eb-386c-4242-d14b-08daf32c847b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sPDQEnOnDMusjKjxsxZY24UIDfaNw1Xct/XDpkZk6KWQ/OxOC5x4Mt5jlzQEKAt3K6AUbgbHehmi/g1WjLitrLWFHHiQTBxh4j6+e7fBhIuVmoljT8zUG8hMlel7NPF7VPF+nGvt6j4HYx/EfpMLX1N9lce8/gg8Hzy9rfflYhyylH3ZJes2FIvZ+aUzsRyNN5upViaoT6XGisTcqxIA1PoNMDl73X6WHzyrw2Z8652+4TUmEWOwHwdU+Q4OME0DVMRPWEaGGNzdy18noSDA3IwWzZQImk/k2/d9Lmc1f7rqDrRH4yIYdiNdcaJRBzTqEolVdNSMfObKxu4BDF5jP+5tSIsoOKQvY7hWNbsSKCFK91LyPAkCq1sKc7L60T5j+D9pH/A/rmesHszGRm8cc+i7W62ks1M9KBlKknxY7qDbi83hjIMQbFvexVuxOyUAOTcKUQB3YPCa6jQSzqeKN3ugjQLbfWSVe5Z3YqDlAs9W5NM9cuhYpQyBPa4fjCkoGDpC1Qr8qtj9TlHLayrBhuw2y5Ti0ea7Gc6dEoTf2MPSKa6GDmy3at6pCrlUs+GYDAK45R2ShKUOejbgTgYWqGifqmxEddZvxt3coxlbaxg/tcjW3zokvXDcTQ7ISkndFj91efxNo/SHo9JOaemoSVbja/0rbUD2OkoUlweE79vG748XrXr8B7HbnW/laB/PwEPIzEiXTg/wPyLWSKSquic1c63WekjbOaV/npP45KI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(39860400002)(396003)(376002)(136003)(451199015)(36756003)(8936002)(186003)(2906002)(7416002)(41300700001)(5660300002)(4326008)(66476007)(8676002)(66556008)(66946007)(316002)(4744005)(54906003)(110136005)(38100700002)(26005)(2616005)(6512007)(31686004)(31696002)(83380400001)(86362001)(478600001)(53546011)(6486002)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qjl5V2RSYXlJeFM0YTQ4Sys3V3lSQ1gwUWV2eU1ZcFYwU3czWUpoZVR4ckxz?=
 =?utf-8?B?Uyt4bldzcmpFTUVuNDVVVm9VaWJwaUtEdyszMkg2OHlqSEVQVVJtZ3RFNGVR?=
 =?utf-8?B?dWtXM3VnZmFQcSs5ZG5kVXJBTVNmM2pQM3dmMzQ4UFRQcXo5Wk5sYnlxYldM?=
 =?utf-8?B?clZQM3dybzZ3VFpmWXZ2M0xGUVZ4SG1ZYlNGaWJ5dzJwalZoNjRzdWRWNXFz?=
 =?utf-8?B?Y05xVWsyS1d4blJJU0haR0dmemZhSFFQbUVzZVUrSmphREVHbW1TQUEvKzds?=
 =?utf-8?B?MVVHcW1DNDAwUlhzQlk1clBpSWFBSmxxRmN2THhQUU9Va3Vza1JzUElOOVpJ?=
 =?utf-8?B?OGFKVGpUZ3dDTjkzU1ZBMEFLbnhqelEvYmN1Tm40UEZPb2JLTElXdUtLK3pp?=
 =?utf-8?B?RFJXQkFwMm5hQm9hejBpOWc2T3lhT0RybXZXQnBBN1BlMmJZbGtnRUtpdnM0?=
 =?utf-8?B?NXZzTmF5OUYzOVEvaEVsL0xsUnRKTlltNXcrYlJ5Y2EreEUveVRaRDRDWjdV?=
 =?utf-8?B?YUVCcDFTeGZ0UXVnakt5eDZTVlpDeEpoS0FZdHJRSzlPdUw4NUlFczBaSllv?=
 =?utf-8?B?ODkwY3BSVUNQdTJNT1IvU2ZRU2IvVjZtQUJzOWhyMXErZFlhSGhkNnFmN29y?=
 =?utf-8?B?aTdxUmtvWlB6R211cWJPdHVmMkhDd3FKdENQekJzUUZzZ0ZUbVJuNitDUy9p?=
 =?utf-8?B?ak5iU1hMQjhXZ3pFbncyemRzNG5XRjhKVkRRcHNGZ2JOQXJldjRKNTZxRWVj?=
 =?utf-8?B?WVpEODBTbFVYMlVmYWgrUkloc2doYVBaOTR0ZSs2RW9ZaVFRKzhaWE1XTHBI?=
 =?utf-8?B?VW9GL3FjeFY5T25VZ01ibXhqNXBNWHlJY2l6Mkx3b3BJWHZqbDFCUnBrUVI1?=
 =?utf-8?B?ZlZRTlFzWlBIR1pYZmZaa3lhTWdBRTEwOFEwWWg1bDFybGVMemlOcFp2N1Bv?=
 =?utf-8?B?dHdWOXZDT0hiZERNUVFrQXBtL2NoNnlrcGs5bE1DTExnZVhTYnl1RlBPWXNq?=
 =?utf-8?B?Ym5nN01xL1RWcnE4NXd2U0swWmkybmJ1WEVnamJ6NTJpK3p0cm1FYlhxcHJv?=
 =?utf-8?B?SlhnNEs1OXA1bXVadVF6UWE1bEZCbmVqQU5GelMzc1hESEtSNjVZRGxqYUxD?=
 =?utf-8?B?RVNGY2pDaEhlZGU4eVp2WUVuN2NQa2pobXlzeFpBVWhmVHRROGxNTVArQUNX?=
 =?utf-8?B?b2ZDSkZvRlh0N2REL0VES01xcU84aFpsOWhDR1VXd0cwSE1SdlQyWmFJaDhI?=
 =?utf-8?B?TkFPeWl2c29ra2oyYlhJQkpyaGsydUpJeWZ3MDR4Z1NRN1kzK0tTVEZ5Tlda?=
 =?utf-8?B?SDhUVDdURG1lVlV3K0pnVEZxNXpIMElLWFAwYmFjblQ3dVljanhMWnNVdkVj?=
 =?utf-8?B?Y2h0S2dwVmYvU0g1TjdaM3BOWmFsc01Na3VOaUI1L2pUZ0RJTStNeDBWSGtB?=
 =?utf-8?B?YW9YMDNoWXlvcHlaa3I0eElZOUViT0VyUWJZekk3ZW5YYUsraTc3dHVMbTNq?=
 =?utf-8?B?SHpYSmN4Q3dpdzJMQmUwVDZQUVZPSFJDbVZJZnBubTAwTmkxWndqejk5VThN?=
 =?utf-8?B?K3N0cVpqb1U2UVJST0FxaytKaGFHWkwxaTBYTld0WUIvclBpczY2QjFRYmhv?=
 =?utf-8?B?VDRlMjV6dEJ5anJ2ZStUVURiUlBzdHRJbDUyNWsrSkpyVU40YndQZjdXbVB5?=
 =?utf-8?B?YTFrVXVGenVXNjJ5ZkxQbVZIRkVsV2QvQ0ErOUh6cDhCSzd3VitkcFp0N3Ft?=
 =?utf-8?B?QzVnamlvc0VtOExxMk0zSjVoYUxyNFlpNEJpRXlocjAra2pxUlIwd0JoWjM5?=
 =?utf-8?B?QjRJd1FSTlJnWFFzZ3k3OXRVWWVLL2ltd2NmdlIvNEV3Qi93SFVZNU9kTlVm?=
 =?utf-8?B?a080ZjNPaXhYNkdYdTBoL1IvcmpPaTNaSXVBbGk0dXJEdmVWUnFtbHlrbGxh?=
 =?utf-8?B?K2N5RFJjbVF1WUxZZUJNQjY4Z2Q5QlF2bG5Kbzk1M2thRlF2TFNhek9FNTVK?=
 =?utf-8?B?alFqc2pSckYrN3FTZ3BGQ3p6SWRPOFJHTVlsUTc2SkdOYUxXV3VKVElhY2x0?=
 =?utf-8?B?aW5DYjhyR0RCVVNJU0JMWnpESGRLQnZ6SkRIejRFNUQ3ZU40TkJIQXhRcmt1?=
 =?utf-8?Q?tM9CPaMStMpAiwTbqNgjXRRVj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eac8c3eb-386c-4242-d14b-08daf32c847b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 17:02:55.5976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FR0ci2buY+BbuFMclTtxuqEknftc9FvGQo3OR1nKyDK/RsscWZ++PyKZ+9+tL6q/Ww+1nLNXuF0SC4N8/uBx7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8867

Arm maintainers,

On 10.01.2023 16:17, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/init.h
> @@ -0,0 +1,12 @@
> +#ifndef _XEN_ASM_INIT_H
> +#define _XEN_ASM_INIT_H
> +
> +#endif /* _XEN_ASM_INIT_H */

instead of having RISC-V introduce an empty stub matching what x86 has,
what would it take to empty Arm's as well, allowing both present ones to
go away and no new one to be introduced? The only thing you have in there
is struct init_info, which doesn't feel like it's properly placed in this
header (x86 has such stuff in setup.h) ...

Jan

