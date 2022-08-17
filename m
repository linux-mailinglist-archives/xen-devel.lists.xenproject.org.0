Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B285B596F54
	for <lists+xen-devel@lfdr.de>; Wed, 17 Aug 2022 15:18:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388917.625695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOIvs-0004BF-6e; Wed, 17 Aug 2022 13:18:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388917.625695; Wed, 17 Aug 2022 13:18:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOIvs-0004AM-03; Wed, 17 Aug 2022 13:18:04 +0000
Received: by outflank-mailman (input) for mailman id 388917;
 Wed, 17 Aug 2022 13:18:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U7n3=YV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oOIvq-0003xz-2l
 for xen-devel@lists.xenproject.org; Wed, 17 Aug 2022 13:18:02 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2042.outbound.protection.outlook.com [40.107.21.42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03969f2d-1e2f-11ed-9250-1f966e50362f;
 Wed, 17 Aug 2022 15:18:00 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM4PR0401MB2244.eurprd04.prod.outlook.com (2603:10a6:200:50::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Wed, 17 Aug
 2022 13:17:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Wed, 17 Aug 2022
 13:17:56 +0000
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
X-Inumbo-ID: 03969f2d-1e2f-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MBcloOmzq7DGcotaPCTYhs4PAPzkDrMEfYVzwb6/RFtUMIAFYKKc669bLLV9/4ea/ZXYSRTKdVNh9dLMHU2yXVIc7XG+lKr4FC9VJXnMIefzU+90F0j09J7BaTo+4ei3Q2MMx3FW2EijCagrT4NuIGyBk5VIrqVvbBl9b0qrXyzNxu1N7OYq3e8nFF5gRUPn/KVRpMgyS8lpnV28HNDfF9OCW1aVh5ngiysI2wroZrvBSiM2OKny7NEuBX3PNY6F6ja5M9w3yA0ooQegbiAwLFmLebtCm0DBDLZK7X1Qn/u7Qf9uv9irp7T4WOC4Ow3/y3Gfxa/l9yXsiESz7q4Q4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uRpcOYlszBaVumNdKOGnc0MQfxakuVmA2tk4jR33b9E=;
 b=ROMpNJWOv2DA3BpsRVizV0rAVdD5JgrTSOV2QvjDGrhA3S8IbisKuUPvF1iHs5plt2UCEYoGTWTxc+gkp+k/HhN12ndQVgeNU0ns7z6K2RcRWFOEBXmdAXTLoFUQQ2yu7fH3Xn1s2nVIy+dsReXyEnIBOajstckv/FYCj1/Uy4123aHC1iO2mfJgrQDAZpZkOv95ADgaqK8b2yQLcmOZJ9trzTNBK8AnJmbAeHpzS2mOK2YLSjgCzFs7B/ZX5Chb7AReUKp/NEeP3UVX7iNrF6iSUk1jSJvdx4uwBn5U58Ec2VO2MtLrQQBCUkxcO/R4dQ5ppOBPROdkl/NDY7l9Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRpcOYlszBaVumNdKOGnc0MQfxakuVmA2tk4jR33b9E=;
 b=4b/ueSvr2kh2aPgDIuzrH+w2Fsdiskhvz1RzJ68YX6N40KNSJZ1dwUUrD6V4GunWyuyOtBDOtnBBUQ5okdgo19D0fWK/AqtIJFJXR1L6fPk2yAUCfBtGbhOmf59g4AlDssqdqFwWbRyIHq7Whdf+NX4Fgc/yTd9GbYAzQi6p28GXffBCC35ZcHdBngTUGFExA2gyZUrsYHnL5Wk8eLXcHDvsgKEU4QCJmaonnwCssTMfG3WNiVrXEkE6At8mry72XO2Cx3vtsvNPvOAVmi7bm1nL6OBsmi5nhDaDs8RETQZZR7qgYIWgQOSlAIMArIK2gusUhGeFukxYgqvRvjpI7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fd24b049-abf2-34e8-e0b0-2c2d2d1e1b0f@suse.com>
Date: Wed, 17 Aug 2022 15:17:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] xen/arm: acpi: Support memory reserve configuration table
Content-Language: en-US
To: Leo Yan <leo.yan@linaro.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Rahul Singh <Rahul.Singh@arm.com>, Peter Griffin <peter.griffin@linaro.org>,
 xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <jgrall@amazon.com>
References: <20220817105720.111618-1-leo.yan@linaro.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220817105720.111618-1-leo.yan@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0019.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::32) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44ba5728-02bf-49ba-3adb-08da8052e603
X-MS-TrafficTypeDiagnostic: AM4PR0401MB2244:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v9MMqxWdyg3gzFPVEZh/3hFs3q/5/86PLLMjZNhOLC939v2ZyRSeBf6Op2hlfVL4wYVePjMzmqTFBWNgpWzzivoIie5BeeUlhJ/1e3Y7Jal4jir2MFtFFV3TUbqtt+6tKdIbRWnSWJU6sw1RzSPa6fNeLvj2eHpp9RwmeTPOK8IxlTydteeojek7bTpa4SBQs3MISEM5AvqC8nb18cNdhxbm43RCPe2MsuaW3UQZh00EUBVs7k8RHszAgOQYkpo6efgF3l5Yy+eL3oHQsZB+1Em0GdTe/TmZ2D/0OYpe0lkVK1WjFHPQuo85yE0JjZk4YPJjIxGh3kXfOPmgxMt05fSCVywsrs4stZklUQr6y/bPHVSodGMqjaXyySujj6CT7rg8ZdSHiqalZocTCdqN1K8rSqpRRG0RgAP4g8B/48mtEGuqpTjILPz7n65lUjxg3odI9WOEEUsYYa+8hEY/lsVurg5g1IOGvW8xoIUMRZvAtj+yKT+pf8di7Qs81gLTxcYFnmPpZ7Jsie5p4DvJY18jvjuY4bqvcdM33KzOcwJ7JanrqDSqgb414TFchxrkXjhthL1+ARhMF8sNpOh2sX2EX5XDENNbo2URz2Z0obl/Kcp7S+KWA/RL/WP4elus94bkUUE5ToO8VZ/98Eaw9tOS7SxEeOzUIIw4/Qwm7/xY/IlYPu1S0GSBtVbWbiZSGRT2887CKqELSuVDvxnUa4IhDKD55FGGTmMv+rkbqvKXuwjD386k3NGBxcCcI8Eo9gGIrvx8nDzt0G1yILknUEiOG15ex4wcFQUD2ry2Ps/UhX/5EFnBBeRLqXWsCreVe1JitnZmYG0Di5nY9GLBUg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(39860400002)(376002)(136003)(346002)(366004)(26005)(316002)(41300700001)(2616005)(6666004)(6512007)(2906002)(66476007)(53546011)(66946007)(8676002)(4326008)(38100700002)(66556008)(186003)(5660300002)(31686004)(478600001)(31696002)(54906003)(6916009)(83380400001)(8936002)(45080400002)(86362001)(36756003)(6486002)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmFxVVJ5NVZBOTVzY1MrakJqVnNrWDkrTXFyS0E2VENaQlB4S3ZWMHFkVDIw?=
 =?utf-8?B?ZHh3d1NGYTAvNWUxcFZZVjc5clJYNWc3cDYxWXVMeGZwaUxkQnFuYzZsdCts?=
 =?utf-8?B?Ni9ucjVwS2M2endtNHhkVUdpU0Ivbm1rdEZybzI4T0pFVnlJakNnRWc0aTRW?=
 =?utf-8?B?eWcrYURELzBjTzFNZWRjQVJPSFhLK296OVJCRW1YMlE5ZnhKWGgzeUZuZ0Ry?=
 =?utf-8?B?MS95NHBleFJWZWhjQUY5QnYzcWpBY0V4MHA0NG1LdUN1ZWxOYVhGRGVyTkFC?=
 =?utf-8?B?YWNLWkVUeG96ajVJdUQvYU1KZm9YbGpEeTFYWDk1a0xZeVQ3aWx3emk3cndz?=
 =?utf-8?B?QnJnVkFwUC8wdys1NnN4b1VoRWFwOHRveHhKTHBJWHhIOGRBVVliT0g3WUhQ?=
 =?utf-8?B?RmJWQVgybDllMUZ2T1pZZ2VSeUZIQlZ4SkdYQmt5akhEZkE5ajhwcGNkQjhS?=
 =?utf-8?B?emg1Lzg4Y3NobXlBWTR4c2J2YTNITi9XZDA1Z1lDbG0rNXJZVmlrKzFWV1lO?=
 =?utf-8?B?bWxGVVlraWl3VjNzQlQvdVJWMFkvNlNZcytYeTN1dDNIR1cvTFJmd25TQkl6?=
 =?utf-8?B?azlvSkdVVUJVV2FsemRqZ2NwSVYwcVhKaUFvcFUrTGpTeFU5K3VtVG5tLy9a?=
 =?utf-8?B?S0xJYnpCOE5NZGN5RFRBZ29ZeGNZcFJESytLdEt3TU4vZHlKTkR5eWFLUjNy?=
 =?utf-8?B?WFVDUEpzbDZsczFMSFcwYkp2R21yTlhNeUxIeTN6NXVOSXdGVDd6SVFPQ0Qy?=
 =?utf-8?B?OUhGMVhqVWdzSlZFWkZyNlgxVFl4OVRGV1hWUGFWVURKWmw2eit1bm9CeW5G?=
 =?utf-8?B?cFdaSWhWaTJ5c1ozRkttd0lXQ2hUdG9KRzd3TTlqaG1iVWgzZmtuc3NNQlc5?=
 =?utf-8?B?QklmR3FQODYrREp3alQxR3hvS1FDV3JBbk5Ic0xrVUNtYmdlZUJ0U1pmMVVS?=
 =?utf-8?B?cDk5VlZLRWRKeVIyRVRLL0VISlpnREJKeVhNekRsdWFmVEZHZ0hXYUNtb1ZS?=
 =?utf-8?B?UGI1UnIyblZ2OG0xZlhhUmR3SG9rL3E2NURMZisvM3JMcCtuV0lVQlRpZ3Rh?=
 =?utf-8?B?a3U5bDJFeWtFdWEvQWhEa3AxQzErb3QwV1EvbGU4NVBqbFBqZS9HWjE2NnND?=
 =?utf-8?B?Ky82ZDJneUh5YmpuNDc5TlFROGVVRWphQVFEbTJJZXB2dWxxTFBJZUhtQTd3?=
 =?utf-8?B?a0srMUw4UnpDQ2NhUDJ4Q1VPaWFQekJsVXUvLy9GQ2dMYzErSzZzRUJtNW5h?=
 =?utf-8?B?blJPbWhlZHBlRWtrWDIvbEgzSjNhMWRQTmN2SmswWVVnY0FFcW15WHZUYlpN?=
 =?utf-8?B?QU9TNUFPQzFoU0x4bXZod0dHQm9uWEJ4aHpyM0FLRm1jUHJKTkdEZDZNL2FM?=
 =?utf-8?B?Q3NkeVFjVEF2SnFSdnFZWENCM0V0S01XOHRqb0pGSi9XenVLYUJhUU9jUDR5?=
 =?utf-8?B?b0VuRkZ1Q3crTEpSeHNIT0ExTnhUMGRwaTdhTTdFRWtzcmdqOWx5V3E3ZURo?=
 =?utf-8?B?NUtyOGw3cC9CYWZsOTV0N2l5U1l4V1dYc1k4T3B2dHE2TGgyNytLcjErZjNS?=
 =?utf-8?B?QUFJZ3FJMGplZitSMDB2dER4b2d5bmRmUWNuRGNrai9Kb2RaTmVyQ2QvS01z?=
 =?utf-8?B?TEMrbWVqa2tIdlpQeWNUM0xsQks0enZkT21XbXRYcHF1MFloMXB0OWcxaGl1?=
 =?utf-8?B?c1lIeGFPazhpME84TitIcUpPQkl2c29HekhxYTFvWkFzZGVtUEtDbEtVcC9T?=
 =?utf-8?B?ZmVWNEVVNVhWd28zTElvejh3VTZhalRYYnZDbzN1ZHk3NWRGaUVmTzZGamJP?=
 =?utf-8?B?UTdwWnlpSmZ0SWNSeWFsbTNwYXd6TUZIT1djQkl1dEFrdXl2bURiOC9IekZa?=
 =?utf-8?B?RDJiM1NxRUgxOHA1bUJuNDcwb0gwU3lDQVM1ZTJ0d1lvRDhNNktENDlkRysz?=
 =?utf-8?B?MEVDQTN5TUFWWVErM2lINEd6ZnVoaEdGZ2NkTEJGa2lmc1RyaWwxSkJBR2lr?=
 =?utf-8?B?dEp0bFMwU2FDUFdkcE9veHJTQkN1bzdVWmZBYWVxUGxHa3g2WmRDU2phOVRQ?=
 =?utf-8?B?T2RzeC9ydG1EWllGSnhYNkQ4WTNHYnU2K0NiU2wvSkw1L3p0ZjB4aFI1aEs2?=
 =?utf-8?Q?q5rV8Hu6hVdYO32GHcfBD3Ij7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ba5728-02bf-49ba-3adb-08da8052e603
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 13:17:56.2710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zWNA355EQhAHjG41utNECrVtYtFkAZAgKh94EpwFXxfKJoJWMmMna+fHGKPgx2s7XPtN1qvJiftJRknw8m1BBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0401MB2244

On 17.08.2022 12:57, Leo Yan wrote:
> On Arm64, when boot Dom0 with the Linux kernel, it reports the warning:
> 
> [    0.403737] ------------[ cut here ]------------
> [    0.403738] WARNING: CPU: 30 PID: 0 at drivers/irqchip/irq-gic-v3-its.c:3074 its_cpu_init+0x814/0xae0
> [    0.403745] Modules linked in:
> [    0.403748] CPU: 30 PID: 0 Comm: swapper/30 Tainted: G        W         5.15.23-ampere-lts-standard #1
> [    0.403752] pstate: 600001c5 (nZCv dAIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    0.403755] pc : its_cpu_init+0x814/0xae0
> [    0.403758] lr : its_cpu_init+0x810/0xae0
> [    0.403761] sp : ffff800009c03ce0
> [    0.403762] x29: ffff800009c03ce0 x28: 000000000000001e x27: ffff880711f43000
> [    0.403767] x26: ffff80000a3c0070 x25: fffffc1ffe0a4400 x24: ffff80000a3c0000
> [    0.403770] x23: ffff8000095bc998 x22: ffff8000090a6000 x21: ffff800009850cb0
> [    0.403774] x20: ffff800009701a10 x19: ffff800009701000 x18: ffffffffffffffff
> [    0.403777] x17: 3030303035303031 x16: 3030313030303078 x15: 303a30206e6f6967
> [    0.403780] x14: 6572206530312072 x13: 3030303030353030 x12: 3130303130303030
> [    0.403784] x11: 78303a30206e6f69 x10: 6765722065303120 x9 : ffff80000870e710
> [    0.403788] x8 : 6964657220646e75 x7 : 0000000000000003 x6 : 0000000000000000
> [    0.403791] x5 : 0000000000000000 x4 : fffffc0000000000 x3 : 0000000000000010
> [    0.403794] x2 : 000000000000ffff x1 : 0000000000010000 x0 : 00000000ffffffed
> [    0.403798] Call trace:
> [    0.403799]  its_cpu_init+0x814/0xae0
> [    0.403802]  gic_starting_cpu+0x48/0x90
> [    0.403805]  cpuhp_invoke_callback+0x16c/0x5b0
> [    0.403808]  cpuhp_invoke_callback_range+0x78/0xf0
> [    0.403811]  notify_cpu_starting+0xbc/0xdc
> [    0.403814]  secondary_start_kernel+0xe0/0x170
> [    0.403817]  __secondary_switched+0x94/0x98
> [    0.403821] ---[ end trace f68728a0d3053b70 ]---
> 
> In the Linux kernel, the GIC driver tries to reserve ITS interrupt
> table, and the reserved pages can survive for kexec/kdump and will be
> used for secondary kernel.  Linux kernel relies on MEMRESERVE EFI
> configuration table for memory page , but this table is not supported
> by Xen.
> 
> This patch adds a MEMRESERVE configuration table into the system table,
> it points to a dummy data structure acpi_table_memreserve, this
> structure has the consistent definition with the Linux kernel.
> Following the method in Xen, it creates a table entry for the structure
> acpi_table_memreserve.
> 
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
> Cc: Rahul Singh <Rahul.Singh@arm.com>
> Cc: Peter Griffin <peter.griffin@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---
>  xen/arch/arm/acpi/domain_build.c | 24 ++++++++++++++++++++++++
>  xen/arch/arm/efi/efi-dom0.c      | 19 ++++++++++++++++---
>  xen/arch/arm/include/asm/acpi.h  |  1 +
>  xen/include/acpi/actbl.h         | 17 +++++++++++++++++
>  xen/include/efi/efiapi.h         |  2 ++
>  5 files changed, 60 insertions(+), 3 deletions(-)

Please make sure you Cc all maintainers of all files that you touch.
Albeit, see below, you could indeed have avoided Cc-ing me if you
hadn't misplaced stuff in two of the headers that you fiddle with.

> --- a/xen/arch/arm/efi/efi-dom0.c
> +++ b/xen/arch/arm/efi/efi-dom0.c
> @@ -38,7 +38,7 @@ size_t __init estimate_efi_size(unsigned int mem_nr_banks)
>  {
>      size_t size;
>      size_t est_size = sizeof(EFI_SYSTEM_TABLE);
> -    size_t ect_size = sizeof(EFI_CONFIGURATION_TABLE);
> +    size_t ect_size = sizeof(EFI_CONFIGURATION_TABLE) * 2;
>      size_t emd_size = sizeof(EFI_MEMORY_DESCRIPTOR);
>      size_t fw_vendor_size = sizeof(xen_efi_fw_vendor);
>      unsigned int acpi_mem_nr_banks = 0;
> @@ -63,7 +63,8 @@ void __init acpi_create_efi_system_table(struct domain *d,
>  
>      table_addr = d->arch.efi_acpi_gpa
>                   + acpi_get_table_offset(tbl_add, TBL_EFIT);
> -    table_size = sizeof(EFI_SYSTEM_TABLE) + sizeof(EFI_CONFIGURATION_TABLE)
> +    table_size = sizeof(EFI_SYSTEM_TABLE)
> +	         + sizeof(EFI_CONFIGURATION_TABLE) * 2
>                   + sizeof(xen_efi_fw_vendor);

Nit: Indentation.

> @@ -75,7 +76,7 @@ void __init acpi_create_efi_system_table(struct domain *d,
>      efi_sys_tbl->Hdr.HeaderSize = table_size;
>  
>      efi_sys_tbl->FirmwareRevision = 1;
> -    efi_sys_tbl->NumberOfTableEntries = 1;
> +    efi_sys_tbl->NumberOfTableEntries = 2;

This is the 3rd magic "2" - I think there wants to be some consolidation,
such that it becomes obvious which "2"-s really are the same (and would
change together if, like you do here, another entry is needed).

> @@ -86,6 +87,18 @@ void __init acpi_create_efi_system_table(struct domain *d,
>      efi_conf_tbl->VendorTable = (VOID *)tbl_add[TBL_RSDP].start;
>      efi_sys_tbl->ConfigurationTable = (EFI_CONFIGURATION_TABLE *)(table_addr
>                                                                    + offset);
> +
> +    /*
> +     * Configuration table for MEMRESERVE is used in Linux kernel for
> +     * reserving pages, its main purpose is used for kexec/kdump to
> +     * reserve persistent pages (e.g. GIC pending pages) for the secondary
> +     * kernel.
> +     */
> +    offset += sizeof(EFI_CONFIGURATION_TABLE);
> +    efi_conf_tbl = (EFI_CONFIGURATION_TABLE *)(base_ptr + offset);
> +    efi_conf_tbl->VendorGuid = (EFI_GUID)LINUX_EFI_MEMRESERVE_TABLE_GUID;
> +    efi_conf_tbl->VendorTable = (VOID *)tbl_add[TBL_MRSV].start;
> +
>      xz_crc32_init();
>      efi_sys_tbl->Hdr.CRC32 = xz_crc32((uint8_t *)efi_sys_tbl,
>                                        efi_sys_tbl->Hdr.HeaderSize, 0);

Rather than adjusting offset and calculating efi_conf_table fdrom scratch,
perhaps better simply efi_conf_table++? That way there would be one less
cast, which are always somewhat risky.

> --- a/xen/include/acpi/actbl.h
> +++ b/xen/include/acpi/actbl.h
> @@ -302,6 +302,23 @@ struct acpi_table_fadt {
>  #define ACPI_FADT_HW_REDUCED        (1<<20)	/* 20: [V5] ACPI hardware is not implemented (ACPI 5.0) */
>  #define ACPI_FADT_LOW_POWER_S0      (1<<21)	/* 21: [V5] S0 power savings are equal or better than S3 (ACPI 5.0) */
>  
> +/*******************************************************************************
> + *
> + * MEMRESERVE - Dummy entry for memory reserve configuration table
> + *
> + ******************************************************************************/
> +
> +struct acpi_table_memreserve {
> +	int size;		/* allocated size of the array */
> +	int count;		/* number of entries used */
> +	u64 next;		/* pa of next struct instance */
> +	struct {
> +		u64 base;
> +		u64 size;
> +	} entry[];
> +};

This header holds ACPI spec defined data structures. This one looks
to be a Linux one, and hence shouldn't be defined here. You use it
in a single CU only, so I see no reason to define it there.

Furthermore - what if Linux decided to change their structure? Or
is there a guarantee that they won't? Generally such structures
belong in the public interface, guaranteeing forward compatibility
even if Linux decided to change / extend theirs (at which point
consuming code there would need to do translation, but maybe using
a Xen-defined struct [plus translation in Linux] right away would
be best).

Finally, style-wise, please don't use u64 in new code anymore; we
are trying hard to move over to standard uint<N>_t types. Plus,
unless indeed mandated by Linux, please avoid signed types for
fields (or variables) which can never go negative.

> +
> +
>  /* Values for preferred_profile (Preferred Power Management Profiles) */

Please don't add double blank lines anywhere.

> --- a/xen/include/efi/efiapi.h
> +++ b/xen/include/efi/efiapi.h
> @@ -882,6 +882,8 @@ typedef struct _EFI_BOOT_SERVICES {
>  #define SAL_SYSTEM_TABLE_GUID    \
>      { 0xeb9d2d32, 0x2d88, 0x11d3, {0x9a, 0x16, 0x0, 0x90, 0x27, 0x3f, 0xc1, 0x4d} }
>  
> +#define LINUX_EFI_MEMRESERVE_TABLE_GUID    \
> +    { 0x888eb0c6, 0x8ede, 0x4ff5, {0xa8, 0xf0, 0x9a, 0xee, 0x5c, 0xb9, 0x77, 0xc2} }

This header holds EFI spec mandated definitions (generally taken
from the gnu-efi project), when this one again looks to be a Linux
one (and again looks to be used in only a single CU).

Jan

