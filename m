Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B41F58027E
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jul 2022 18:16:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374706.606856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oG0kZ-0008Iw-Ib; Mon, 25 Jul 2022 16:16:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374706.606856; Mon, 25 Jul 2022 16:16:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oG0kZ-0008Fg-FX; Mon, 25 Jul 2022 16:16:07 +0000
Received: by outflank-mailman (input) for mailman id 374706;
 Mon, 25 Jul 2022 16:16:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0h6O=X6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oG0kY-0008Fa-3P
 for xen-devel@lists.xenproject.org; Mon, 25 Jul 2022 16:16:06 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70073.outbound.protection.outlook.com [40.107.7.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14f11018-0c35-11ed-924f-1f966e50362f;
 Mon, 25 Jul 2022 18:16:04 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM5PR0402MB2724.eurprd04.prod.outlook.com (2603:10a6:203:97::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Mon, 25 Jul
 2022 16:16:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Mon, 25 Jul 2022
 16:16:02 +0000
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
X-Inumbo-ID: 14f11018-0c35-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GYV9Jcvl4ByIgm1wGejF8a9+71qljUKI01wDc88Lg1+nyade4t7lyn3cyPEMjIY09h9O0qIqHrSmMT7Q7HfqZwNmNWUu2Oy5ZJaJFW5nOG+RezUMJ+zT6cluJoIlMK/QUoYnzu8xMCAGecvE6eS6XBOSwbPZMPnUSUtGKlNqeMa4+CR5sop50b1/JeLPOSeCpwwB/ZST6xE8ZKJMbtrNCIlDZgYQNDfk+R+s5M42QeavNVharOvYRv8kuIUCawsYDZPrBsKlP7coiqHn5QK0pl7eKSFRnTqfo/Qih3Kdt2/i6ZgVWY2/1ALrmR/5awtPTZ/oFvoAviZ6nmLMyK0Q3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G3nTpai3WeGvgri+l+g5JnF3+TSlBuZUsjH2tkTfrDY=;
 b=jp16fZxwWcy7nJQa4UFo3EPYLrc4VNQdxuhFayUOWqcY6z107tV3zgOn7WFgYCSqXveNNAqfOWMYdKO0+OP31ZQwlH6baURDbDnoDOQrfhpW/IMtL+5q/YMQsv5n4sYn8jyFkd9Am9TKTu6Q2hpljZZlwnjushDh3++Qxap0WqOnW5pD2IdKrfE5agwFanDoEyrl/HLB1zeWk1UXeySvtUBd6rNfXyinwzWud9VwpnDSJu17g9CFNawHVDRjPJFVwXuhcJGLKCgW6tjQcTJiJ1cBTUzN/INYlDghHu5HniRi9t8gEA3sTOZGjUx8fBNTmEQciNVlIl4IHHTkn9wQvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G3nTpai3WeGvgri+l+g5JnF3+TSlBuZUsjH2tkTfrDY=;
 b=X1P1etFe300fCEqGThW284nmsfb5mMjhxKq6J7FeOQDddqyv7httpV4thTNWyLNHV2/RM9Gvjc1xDeer15BsLRWhRa/LcIsJecV6ZlUU/E9Kln3e03U01ZZDz12IJwKag55oZRsUOxo03w2A9ookKRYcl2lscWZrwdoXqXuuq5iOK8O7xMaGKdJh37duwYiKQkzaJqcfnlGhE1KqvZCWG7JcyhLqx93udSV0wPRfr3K6GAJHxtgTSh8TUznyGcmSiNiq2BMSaOFae5B8IunD/pmO0ZQL0Kz4PS6haoo3vhaY2iErws4ys73J+MWgpD7XEWiGJJ4CvMVcaUvApQ36eA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7d816c9d-412a-bcee-f1ab-3b4b46051b8a@suse.com>
Date: Mon, 25 Jul 2022 18:16:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Random crash during guest start on x86
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <65C0A220-EC7E-4915-AC45-77D87F4E411E@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <65C0A220-EC7E-4915-AC45-77D87F4E411E@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d170810-8f02-4258-324c-08da6e58f7f6
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2724:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u6CeFJVuRwGVr77k8g1nqFIawNtKrG2Cp5XTfRWm2oxA8xl1/IFchApAwphnxy48DBMrbu5ozPJ939+lSuRD4XWjTC7YKqEXrDV5ICxLx0sTcNFR5yj/oTUAMoRqAuMMjrzULUoNyQ/ET3K5ApUHTeGErUF64VHWIE6ufbZ+KqVElgE8cZpIy+hjephmd7SwVaY47wEwe2rcL6hjyI8wrLC6Oyiox5OmgUyS7Y/nGiv85nYasW2tKz0spNm8mUL9w6x5WvLQj3fwk8yZcbNEFnaXV7esC2LxZu2tNr+6eqxMw+CrioJm7M2XncDne/6tIVtJgEjMkIHSAx99mbiRp/YDYO79a3x8Ddirkwc1vG3NGeIs9w7OJHpy0DLRZ62FI3OQmPoN6oHzrDUln/U+qT/sFWD+T696cs7ti+jNPs756BQU1EdTm9RlwGv3pirzgYzZmcXrFVZ/PbWBFoKulEILjjNGwxdIkDK0cXO51zD2hXDMiW3YYB76HHoq4Tf+jGouuO2eL7wEjapL8axSVxfqByIfkLIxyVrwlq9USifgccWKbH9Jh19PqAqol94Wr41BKnQtrHriBy5oFcFdxCV0T0+cRAasISl4ZFwO/j4oy2/3IJCa6yLvevgJp4Wst5ud+iQQ2R6MAOkqE2xKP7OGwP+ZwcWZbSTUlO65VaXAskLIeO8Sx2cIt6NdLwpuEmNmstqSJugckT/PIRDAxL2/jpC5GulGvPFdLL4tuJFwh3NBbZTq6mJ3NnjRo/0AWrska+O7czbwe8ySbyA5Xbl6w8AlCWOdYeCTXeoRHCSOMsZIqC8poJWjPGHyev0nZVAo1y8mbu9iYbxTmS8yWQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(376002)(136003)(396003)(39860400002)(4326008)(5660300002)(478600001)(6486002)(41300700001)(6506007)(83380400001)(86362001)(2616005)(53546011)(31686004)(31696002)(6512007)(26005)(2906002)(45080400002)(54906003)(6916009)(186003)(8936002)(36756003)(66476007)(38100700002)(316002)(8676002)(66946007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L256c2VpdUhrUlFSTlQ0eTlFeEdXZVhVRnFPbnRvZUpyK0ZuaHFjT0NIS3Fj?=
 =?utf-8?B?MHgrYXEzZ3J0enNDaFJmMnJXUEJxcjNpWWl1R2h5amIvT1pUaldCbUhsaTlo?=
 =?utf-8?B?anZHT2RMRkM0eXJDeDNrN3FxU0g4Y3YwT3gxTDhJZzZCcUZkOVhrQWd0TkR3?=
 =?utf-8?B?TUJzMXlrVEJLWERsR1FLMXRUSjE2T2FIcTRyN09sbHQ0ZnhzTlRRUU1ZczZy?=
 =?utf-8?B?c21MblVoUjlHN3pLUitMa2RwT1lod1p4NlVZVElFdVpYM25Mdkpac056aUNy?=
 =?utf-8?B?Sm0vTndiejMrVi9oeHllVXdZOXo4VUcvcUZyR2EvMWJRYWQxb0NyaVZ5MTFy?=
 =?utf-8?B?dlZEVFFTcUxwY0hJd0xlR2dnT0h4TnhqdEc1aDN6M3NhVi91MVpha1h1bURV?=
 =?utf-8?B?Z1JLcXQybmNQb3BaZm4xMm5DT0Zkdlk4T0xnRGxRWU9ydEhJZXFoa3piN0Ru?=
 =?utf-8?B?Um5TZ1RIdWhqKzM5bmtOSTh6TUJhVGtYSzNkMCthcGJNajgyZW9lQm94M0ta?=
 =?utf-8?B?ZWRmM2hwSTFYOTdVVVQ1M3o3ZHY0RVBCb2Z6UFdJaVRadTdZV3I4RjZIZlVP?=
 =?utf-8?B?a29Da3JHVGtGNHFKRmNuRFRtK3loem5yTjJCSnRzRFBLQVhJVDFwc29WcHNE?=
 =?utf-8?B?YWZRU1JYaFVVc0RwZ3ZjNCtCVitJRWZRV0dINWJ0QVkzRlVDVmZ5YzRqWjdW?=
 =?utf-8?B?TTQyTlh3cG0rU0JZMVBOQlZ4c2FhQXZjdHcyZE5OR1hSM1hkaWNmcHd4SWVO?=
 =?utf-8?B?R1I3NlVtamFyNGlkNjl2RVIwMDhZbDV4RHQyUk9JYVlNbmVEWjdnKzBQOFJY?=
 =?utf-8?B?NzNpd2tZRjdCYm1JelVCT2ROWG1IbUpIRy9OUlYyM1h6eW5qTlRxdXJIeDVH?=
 =?utf-8?B?RCt5NTgvOEpubWo0WTd5OURtZEZPdUd3YUtiSEFpajdidGgweVg4YkQvQmU4?=
 =?utf-8?B?UGExUWRFRXJ5WCtkQXpNOWJCb0pXQ09wY0xMazBDdkxQd3lDZFJreU45YlpJ?=
 =?utf-8?B?c1RkZWNxcnc5aDVrQ1V4cHo4Q1RGdlNjeHlHYTVkclkzWkdtMUZ1VTFWSlFs?=
 =?utf-8?B?bzkzclRQRUJqNTdRcGMya0txcHJleUJVYW9oYXl2MkQ4cW9FMU5XZXA0Vmtz?=
 =?utf-8?B?ZVI0R0NXQ1VIWFpac0FobStZWEpyY1Uvc0htMDlIMnd5VlZNaFNsMUFqWHRu?=
 =?utf-8?B?QWlzVnJubSszdzJaQ0d6M3NEWjdpbE1URnoyajdWSGdOQk02cnVIS2E3V3B4?=
 =?utf-8?B?b1JtZ2w2Y0tuMWVkSnBuNnduYnRoamJkdmRLRVNwenV0emdHbnRyeU0vbXU2?=
 =?utf-8?B?YjFTNzJMN0gxSmRreG00MVJUS0h5Zk03TmR2ZUE1K0dTd3g4S2lpSnNPaVkw?=
 =?utf-8?B?YUJHWVg3eTU3eklsVUNRa2FRTEZrOVd3OU5GbFFyZnpuRFNyd3ExQWxpZEY3?=
 =?utf-8?B?RFZ5MUgraWpaV29yN2VGUFFERTkrVnhKRWFwcFZwOENqWTFYWHRGWXo0VzJ6?=
 =?utf-8?B?YXVwWUZsS25KcDhLTTZpS3k2ZFVSUVVnREtMNlNvOUFyMEtueGFzQlJGV2Vi?=
 =?utf-8?B?cnczdzBvc2JWNmhVVjNEWmIvZlpVd0s5dHVxNU1GSDFQL0djRGNmTUZwUE5V?=
 =?utf-8?B?WnJjL2JuanQ2RmNmOXB4YTQ0VEhnNXF4d256Z25Fa3h5TTI2OXJvYjFkTGti?=
 =?utf-8?B?ZmJ3TXNDeStXbSs2VHp4K2pOSmNCZGlCbkRBNTcwTE9pODhOZzU2YVM4N0Ri?=
 =?utf-8?B?cm1QN0RvM3YxTGZoMmJPbnFrQzNvcW1DdXI3a1BMV2IxVU1CNE1jazZldkVC?=
 =?utf-8?B?WmlEbTJJclRscmJvT3pZTGdTeGhRRGlqRUlVQWEzT1g2UXFycUJXUFJnSnh1?=
 =?utf-8?B?UWpqK2dVaWRkUjB6d3hHazNNNmFEOEg1YVVEek5rRzJoUFp5YzlOSlBTN05M?=
 =?utf-8?B?cExhc1ExcFVFSUZlK0RDTENzb3AxZ1hTbmNDU05GQjI5dCtwN1NvSzJxZGVC?=
 =?utf-8?B?djZySEZ3N1B5N1EyeGlhWmlVbjRsbVBodENjc2N4Ymc4Y0F2L3I2bXVWdktS?=
 =?utf-8?B?VllFaTJ3dUY0eTJtbkQ0Rlp6L0swQzQrUGE0UGlzQ0NLSnNUbzVnNUJndVZZ?=
 =?utf-8?Q?5QVlKdm3fFq+lL9y9x0Le2uDd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d170810-8f02-4258-324c-08da6e58f7f6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 16:16:02.3724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AQ6nIcDxrNRLK4jgQaBmVl1GJoXsqXTQDNdaltZT1LA6bOjdBhqh0f3fQnl6jnU3xQHSw8dhfvkvKQX6kbJ6FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2724

On 25.07.2022 17:51, Bertrand Marquis wrote:
> On our CI we have randomly a crash during guest boot on x86.

Afaict of a PV guest.

> We are running on qemu x86_64 using Xen staging.

Which may introduce unusual timing. An issue never hit on actual hardware
_may_ (but doesn't have to be) one in qemu itself.

> The crash is happening randomly (something like 1 out of 20 times).
> 
> This is always happening on the first guest we start, we never got it after first guest was successfully started.
> 
> Please tell me if you need any other info.
> 
> Here is the guest kernel log:
>[...]
> [    6.679020] general protection fault, maybe for address 0x8800: 0000 [#1] PREEMPT SMP NOPTI
> [    6.679020] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.17.6 #1
> [    6.679020] RIP: e030:error_entry+0xaf/0xe0
> [    6.679020] Code: 29 89 c8 48 39 84 24 88 00 00 00 74 15 48 81 bc 24 88 00 00 00 63 10 e0 81 75 03 0f 01 f8 90 90 90 c3 48 89 8c 24 88 00 00 00 <0f> 01 f8 90 90 90 eb 11 0f 20 d8 90 90 90 90 90 48 25 ff e7 ff ff

This is SWAPGS, which supposedly a PV guest should never hit. Data further
down suggests the kernel is still in the process of patching alternatives,
which may be the reason for the insn to still be there (being at a point
where exceptions are still unexpected).

> [    6.679020] RSP: e02b:ffffffff82803a90 EFLAGS: 00000046
> [    6.679020] RAX: 0000000000008800 RBX: 0000000000000000 RCX: ffffffff81e00fa7
> [    6.679020] RDX: 0000000000000000 RSI: ffffffff81e009f8 RDI: 00000000000000eb
> [    6.679020] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
> [    6.679020] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
> [    6.679020] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
> [    6.679020] FS:  0000000000000000(0000) GS:ffff88801f200000(0000) knlGS:0000000000000000
> [    6.679020] CS:  10000e030 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    6.679020] CR2: 0000000000000000 CR3: 000000000280c000 CR4: 0000000000050660
> [    6.679020] Call Trace:
> [    6.679020]  <TASK>
> [    6.679020] RIP: e030:native_irq_return_iret+0x0/0x2
> [    6.679020] Code: 41 5d 41 5c 5d 5b 41 5b 41 5a 41 59 41 58 58 59 5a 5e 5f 48 83 c4 08 eb 0a 0f 1f 00 90 66 0f 1f 44 00 00 f6 44 24 20 04 75 02 <48> cf 57 0f 01 f8 eb 12 0f 20 df 90 90 90 90 90 48 81 e7 ff e7 ff
> [    6.679020] RSP: e02b:ffffffff82803b48 EFLAGS: 00000046 ORIG_RAX: 000000000000e030
> [    6.679020] RAX: 0000000000008800 RBX: ffffffff82803be0 RCX: ffffffff81e00f95
> [    6.679020] RDX: ffffffff81e00f94 RSI: ffffffff81e00f95 RDI: 00000000000000eb
> [    6.679020] RBP: 00000000000000eb R08: 0000000090001f0f R09: 0000000000000007
> [    6.679020] R10: ffffffff81e00f94 R11: ffffffff8285a6c0 R12: 0000000000000000
> [    6.679020] R13: ffffffff81e00f94 R14: 0000000000000006 R15: 0000000000000006
> [    6.679020]  ? asm_exc_general_protection+0x8/0x30
> [    6.679020]  ? restore_regs_and_return_to_kernel+0x1b/0x27
> [    6.679020]  ? restore_regs_and_return_to_kernel+0x1b/0x27
> [    6.679020]  ? restore_regs_and_return_to_kernel+0x1c/0x27
> [    6.679020]  ? restore_regs_and_return_to_kernel+0x1b/0x27
> [    6.679020]  ? restore_regs_and_return_to_kernel+0x1c/0x27
> [    6.679020] RIP: e030:insn_get_opcode.part.0+0xab/0x180
> [    6.679020] Code: 00 00 8b 43 4c a9 c0 07 08 00 0f 84 bf 00 00 00 c6 43 1c 01 31 c0 5b 5d c3 83 e2 03 be 01 00 00 00 eb b7 89 ef e8 65 e4 ff ff <89> 43 4c a8 30 75 21 e9 8e 00 00 00 0f b6 7b 03 40 84 ff 75 73 8b
> [    6.679020] RSP: e02b:ffffffff82803b70 EFLAGS: 00000246
> [    6.679020]  ? restore_regs_and_return_to_kernel+0x1b/0x27
> [    6.679020]  insn_get_modrm+0x6c/0x120
> [    6.679020]  ? restore_regs_and_return_to_kernel+0x1b/0x27
> [    6.679020]  insn_get_sib+0x40/0x80
> [    6.679020]  insn_get_displacement+0x82/0x100
> [    6.679020]  insn_decode+0xf8/0x100
> [    6.679020]  optimize_nops+0x60/0x1e0
> [    6.679020]  ? rcu_nmi_exit+0x2b/0x140
> [    6.679020]  ? restore_regs_and_return_to_kernel+0x1b/0x27
> [    6.679020]  ? native_iret+0x3/0x7
> [    6.679020]  ? restore_regs_and_return_to_kernel+0x1c/0x27
> [    6.679020]  ? restore_regs_and_return_to_kernel+0x1b/0x27
> [    6.679020]  apply_alternatives+0x165/0x2e0

I have to admit that I'm a little lost with these "modern" stack traces,
where contexts apparently switch without being clearly annotated. It is
looking a little as if a #GP fault was happening somewhere here (hence
the asm_exc_general_protection further up), but I cannot work out where
(what insn) that would have come from.

You may want to add some debugging code to the hypervisor to tell you
where exactly that #GP (if there is one in the first place) originates
from. With that it may then become a little more clear what's actually
going on (and why the behavior is random).

As a final remark - you've Cc-ed the x86 hypervisor maintainers, but at
least from the data which is available so far this is more likely a
kernel issue. So kernel folks might be of more help ...

Jan

> [    6.679020]  ? insn_get_opcode.part.0+0xab/0x180
> [    6.679020]  ? insn_get_modrm+0x6c/0x120
> [    6.679020]  ? rcu_nmi_enter+0x2b/0xf0
> [    6.679020]  ? rcu_nmi_exit+0x2b/0x140
> [    6.679020]  ? irqentry_exit+0x29/0x30
> [    6.679020]  ? exc_xen_hypervisor_callback+0x8/0x10
> [    6.679020]  ? relocate_restore_code+0x22a/0x240
> [    6.679020]  alternative_instructions+0x8b/0x13a
> [    6.679020]  check_bugs+0xa87/0xadf
> [    6.679020]  ? __get_locked_pte+0xa8/0xf0
> [    6.679020]  start_kernel+0x64c/0x680
> [    6.679020]  xen_start_kernel+0x592/0x59f
> [    6.679020]  startup_xen+0x3e/0x3e
> [    6.679020]  </TASK>
> [    6.679020] Modules linked in:
> [    6.679020] ---[ end trace 0000000000000000 ]---
> [    6.679020] RIP: e030:error_entry+0xaf/0xe0
> [    6.679020] Code: 29 89 c8 48 39 84 24 88 00 00 00 74 15 48 81 bc 24 88 00 00 00 63 10 e0 81 75 03 0f 01 f8 90 90 90 c3 48 89 8c 24 88 00 00 00 <0f> 01 f8 90 90 90 eb 11 0f 20 d8 90 90 90 90 90 48 25 ff e7 ff ff
> [    6.679020] RSP: e02b:ffffffff82803a90 EFLAGS: 00000046
> [    6.679020] RAX: 0000000000008800 RBX: 0000000000000000 RCX: ffffffff81e00fa7
> [    6.679020] RDX: 0000000000000000 RSI: ffffffff81e009f8 RDI: 00000000000000eb
> [    6.679020] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
> [    6.679020] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
> [    6.679020] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
> [    6.679020] FS:  0000000000000000(0000) GS:ffff88801f200000(0000) knlGS:0000000000000000
> [    6.679020] CS:  10000e030 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    6.679020] CR2: 0000000000000000 CR3: 000000000280c000 CR4: 0000000000050660
> [    6.679020] Kernel panic - not syncing: Attempted to kill the idle task!
> 
> Cheers
> Bertrand
> 


