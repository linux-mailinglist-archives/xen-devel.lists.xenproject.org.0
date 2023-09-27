Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 702897AFE34
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 10:22:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608730.947398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlPoI-0008Ff-GG; Wed, 27 Sep 2023 08:22:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608730.947398; Wed, 27 Sep 2023 08:22:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlPoI-0008DR-DV; Wed, 27 Sep 2023 08:22:18 +0000
Received: by outflank-mailman (input) for mailman id 608730;
 Wed, 27 Sep 2023 08:22:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qlPoG-0008DL-PT
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 08:22:16 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2079.outbound.protection.outlook.com [40.107.7.79])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f71a7383-5d0e-11ee-878a-cb3800f73035;
 Wed, 27 Sep 2023 10:22:15 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by GVXPR04MB9996.eurprd04.prod.outlook.com (2603:10a6:150:117::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 08:21:46 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::afae:3fda:c84d:bcdc]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::afae:3fda:c84d:bcdc%7]) with mapi id 15.20.6838.016; Wed, 27 Sep 2023
 08:21:46 +0000
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
X-Inumbo-ID: f71a7383-5d0e-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eOMcSj4aJAnWbxXD79EjBwc3wArn22rO3A67btnyOg377885mvgKMicy8EDZF67zpbvpI/ydAxDyIJ9B+zqtJLitd1P5rbTOaMzXSvYm9xZ2h1yings9uYZ6U6xkaqGSnDV2NDPyMVM8WMBXWJ59pZkPVGCmks7Vbd53znA/l25+C9p9U+QwsPjIJQpKgoKVES7HBU/hNVfVoXKa13Vw8Y7fHsoCBK4GeKWnp+5nWV7uR2IHgccTpPKrATq/u5nwozPBaVVZtzr62nquCkxBfq+WBTtMNEKickFra8yCIK0UI8MkFgmmsSn2zj+L4DhtwakR0uBG4ploOQWrgkbHgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nWCqfDehM3YUSBk0KmVd4+CDG+IAxqCox5qWG6PRgl8=;
 b=UHuj+tvIfMrw55jYa9JPZE2GwUj5s3Uubp02oEtMNTidKGnx9thbsWhP/RSB19joETpJop+ehix9ufDUaNgpf8dgnnyweK9AisHUVN5zT4L3mAByL5p0KubVzPekQUj7pOyJJX9iDu+AhQVvqGQazEUb7ELQu52Hmirmtj3Z7OjCuqFHNYBcPUeXO1/jYglw7aVLTM83ttrJao7eCGkvlkshXesnTqiidV4OTz0e8c3GXcqWLq0jQE615EVMa7bQX2fsapiyTFPl4BozndvNqnKaLZgQgcp7wKozS5Z2xRaknt3KWCjaKL7C+MO9YsAZv6zm0oeMbNhsPVaOK96Wdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nWCqfDehM3YUSBk0KmVd4+CDG+IAxqCox5qWG6PRgl8=;
 b=hgcNUehhb6BRHLK00sRXRd7n6yz2Dba3ZJi8hzlygiWBtP9On8SKDrSp+fGRzOGM0MNYs239ZLSuEv/VkX41kU4r/Gv0nVxl3Uoy72iPWSsor5ojY8y82eQAZ1xuzBuTDBcDaYEatKBzPKk4medk1XQUuqxrXZEXvyYjMdK9XXTAgqB4OYJIyjA8Ik94f4qHwpK65UdxkezHgR5m2yT5W5GrR7v5/0tyX2l5EY6nQP5pPaU8FA/bASHGIUZuiL3pcvf/+yQnCKKj5NdcVatfvKXOzypEcH9e+cH9VND4OiddXRjplcY3B4MZBY8QXWUvzPHPjSIgPk+rQtVf35mdSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b045e8fe-ccf7-bbcd-ece8-036a13858d36@suse.com>
Date: Wed, 27 Sep 2023 10:21:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] x86/shutdown: change default reboot method preference
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230915074347.94712-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230915074347.94712-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0191.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::9) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|GVXPR04MB9996:EE_
X-MS-Office365-Filtering-Correlation-Id: dda13b41-1ee7-4ad7-7f69-08dbbf32c9e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jlp3/CSTfvBzUjRQwxSwAA5Mf050o5OyDznDMAIkVRB4faBiKpu+qQPiM6hnjIYQPXgDasjLSG5+9dFBbJlw76JrQVEL0RvB/6ObdDSGpMjy1g98UIOoCmtCd85TN7nKkRgM2vc3hIic8UPsZeuIz1zxjp4H/YZkvpE/ZDdg6penu7wqeAKj8Dn3v7d6aK+wT4roFdTQHgQiAuVtqgjkXgTXqYa+qSejXc070bZz0NeXjOiInuvjnDSxvh+HBM2NjORHwiAjh0FWLp88oAthgb4h0eWj/C0qxrN88tgbp3gBjFS6ne37N2pGZcQO34ULmNPtLLYFhxzN68rOK1C/bxi7z7Q/ivt3iaN0B/lkOkxu+utoHT1P/q9ovOwcQUibGWSrt6f8rzwOTScjcro+t9NUdMmYsGj016cJ9fP0vK0CtpG4suJKifyqITdsiFDqd31wiSsbx/GzMuYw/otY1EjKtBCvef0iv8jgc90lMbRzJ3L57j8f/jIdYBpVtbe9guZAGkMizRTrxmXh7qoWFJ2L6wfKiY9EbL5JEiM8X+q9MluZyDhwiqwdRIDc9LIVKwDRrYLP+6MVwVwRC5sYeIkz3ITx0fRL7hg++6nwQrGEuJU97WA0vt9nmWh8yU7ngGs49qUYkv1JrWuHw9YTRw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(396003)(376002)(346002)(366004)(230922051799003)(451199024)(186009)(1800799009)(66946007)(6512007)(53546011)(31696002)(86362001)(6486002)(26005)(2616005)(478600001)(38100700002)(83380400001)(66476007)(8936002)(5660300002)(6916009)(2906002)(41300700001)(316002)(8676002)(36756003)(4326008)(66556008)(6506007)(54906003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tys4OG1wVzRaOHdTUWdVbkY0WFlwSGpVZm4vMjF5UmFuVU4wZTNNVElBRzVX?=
 =?utf-8?B?dFFnUXplM281NURRYWhuak4rNHEwU1FLeXl4c2FkUUtEYjBmaFhTbnlleWhn?=
 =?utf-8?B?WTBPUGVkeFp5WWU4K2pKOVlkbWZjeXVGSlNjM3dEbkdYWnhFZFV0M0dtU3A5?=
 =?utf-8?B?QkNlcldFU2R3TURZZS9vbnh2eHhGa0JJMnpudFplTFByS0d2OUd0MmVKNFhI?=
 =?utf-8?B?Qm1BK1NJOG1MVUpOeG5FaUE4NUVKVFJ0M01UOTBiTjRKUEtRMnpiRHlpZW9w?=
 =?utf-8?B?MXBZaUxsZ25RREI4MlJTVzg5OUgraDc4dUU1eTVFODVBU3FYWFFsdEpTUHdX?=
 =?utf-8?B?M1BBQ1hWOWJuRlQ0dnNJZE5KZi9ObWQ1c3dkVy9sMnRJUGxrRk9FNTBxV1Q2?=
 =?utf-8?B?MEFnQzVqSVByR3I2VFZBTDNVT3pwQVBkSytRRHU3dVhyZk1mTSswYVRkdktt?=
 =?utf-8?B?bVRKNDBFTjcrb1BRTW1aeEJOdFlJZ2NVMGFnaEZYV01YUmdJYlBZMjRSUTZ4?=
 =?utf-8?B?MzNhallMZzJjS3Y4U3RuZHA3OGlSVDEvN01VYlVYV2I1VHlNdjJMa2o1SUFF?=
 =?utf-8?B?TkpJU3FNOUYrMEZiemc0RzFYOERnNkc3QzlCdVo2d1hzZ2FGZWJVVW44Zmll?=
 =?utf-8?B?NHJqQTc5dVQvcmlGMUR0WHFIRmZNMjYzdVRNZ1lyUWwvY01kVmF6N1k1d0lG?=
 =?utf-8?B?cFpwQXNSWWgyZnc5NUpXeHc2YTVPK09kQlVQbHl6WHRsM2MyN2VKMHc2UVR6?=
 =?utf-8?B?cEF0TTZhRmNYbGNsczNUNjhVZUkxdW50Ui9hVWt4TmlmZjJRY1hwTUV4RmRZ?=
 =?utf-8?B?UXN1MUNPN0tvdFFUTnpJN3V2NXBHSFNjdndnOEU4bVFMeGlFUnpYVDNOaVlJ?=
 =?utf-8?B?TW5yLzJFdDdkS2FaYVBEaHY1VFFsUFVURGpIZkpnNk50UE9reGJWT1labmVp?=
 =?utf-8?B?dEQwVWM1OWJTN0MyOTNQMk9CeW4zL2NCZ0tBSXdZUHlLMU9FdE5lY0IzeS9C?=
 =?utf-8?B?VlNTZHZYV2ZHbzdZWlVjTHZTTFN3NXJDVDM0Y29OVk5NT1A0a1c2UXhsalpj?=
 =?utf-8?B?UFhkcnRXSE91TzBya1pPK1ZpcnFGQkQ0K3VQN01maXViUkxOeG0zN0lmWWNT?=
 =?utf-8?B?Uk14ZlRmK1hiaEoxM2FKWHZETEloWWUrY2tJVmFBMnRDSE5tZllJM0xVZEFO?=
 =?utf-8?B?UXd0b3VnS3Y0L1pUM0dvY1I2bE5ETFYrQiszV2Nia1I0VUI4MTloelREVWQx?=
 =?utf-8?B?WWp4OXZPZHZxVmJQWWhyNnJCaUVsZkx1dDJSTDI2SGgvRDlRd0gva2lxMkd2?=
 =?utf-8?B?ZUx2K1VaemdSMFJlWGIyZHB6QlhTVjdWQWhsUjhTR3FoUEVBTXo0b0hsNnhI?=
 =?utf-8?B?VkN2RDhCbnZuMnJQTGNaQkQ2bVdwekMyQVdTQ0RuZHExWHB3Rk5ZMTJtWVhH?=
 =?utf-8?B?SlE0dVRNY3lPbytGQUg1ZHVsaVJ3YVRGNE5zYjk0T0o0Ym04VnZwSDJkdzBK?=
 =?utf-8?B?ZHl0M2RVcHYvaU15eTJlekh2dkkzT0ZBSy9IZGVPenN6TU41cit2NTlCSjdi?=
 =?utf-8?B?dHJzM3hFcVNOckhBUUhMSXRLMUw5WnQveURDekdmcTdmWm93aXo5ZWFGQ2NJ?=
 =?utf-8?B?blNqWlQ4TkpYMlRqTzUxZEpMNTBXSStYUCt5bjNzalBIc29Xd3BKOXozRG9S?=
 =?utf-8?B?cE80Njl5TWdpVWZScVRkRU5FSWxFcTBzU1pWZEE2T0VOVm5FNldBdWRsdlgr?=
 =?utf-8?B?S2ZyS1MwSlVROXNaR0VQTXQxcTdkWUhKbUtDMlJxLzRJcUJpOHlkV2FPZlVD?=
 =?utf-8?B?M2xSMFZNS204ODhhN3djbXkxVCt6eGtrTXJGdTJqaUZyN3B0NG84bEQ0U3pX?=
 =?utf-8?B?WGN1d0doY3o3S0tGQ05nWVgzRkd4M28xYTgyN1pIcXo1elNielFhaVNRaDA0?=
 =?utf-8?B?bzh5U090ZUlUZDJTWGpIbHhLNDJzUHg3NlRqMFlCbmM4ckZHcndrOFJ1U0V3?=
 =?utf-8?B?d2tMQWVUNjA4WUJRRVQ0TmpCL0dRSElBUitiWG1yV1pnKzd3ZTUxdHd4V1RC?=
 =?utf-8?B?Ukc1TnBHN25hb3NtLzNLbENVWkQ2cVZkcGpqblpFbHkycjkzRmFrQU9sMDds?=
 =?utf-8?Q?7vL9JlCIYjG/LdBiyfci+gtNH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dda13b41-1ee7-4ad7-7f69-08dbbf32c9e9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 08:21:46.0887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aJ9An48y1GRFXDwgWEYFmcSKKhsLPeTgki+AEDL5N7RoKhPgJdzaY1icUM21FsW9eDSS5DKlEHv1SZJNb+Q4QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9996

On 15.09.2023 09:43, Roger Pau Monne wrote:
> The current logic to chose the preferred reboot method is based on the mode Xen
> has been booted into, so if the box is booted from UEFI, the preferred reboot
> method will be to use the ResetSystem() run time service call.
> 
> However, that method seems to be widely untested, and quite often leads to a
> result similar to:
> 
> Hardware Dom0 shutdown: rebooting machine
> ----[ Xen-4.18-unstable  x86_64  debug=y  Tainted:   C    ]----
> CPU:    0
> RIP:    e008:[<0000000000000017>] 0000000000000017
> RFLAGS: 0000000000010202   CONTEXT: hypervisor
> [...]
> Xen call trace:
>    [<0000000000000017>] R 0000000000000017
>    [<ffff83207eff7b50>] S ffff83207eff7b50
>    [<ffff82d0403525aa>] F machine_restart+0x1da/0x261
>    [<ffff82d04035263c>] F apic_wait_icr_idle+0/0x37
>    [<ffff82d040233689>] F smp_call_function_interrupt+0xc7/0xcb
>    [<ffff82d040352f05>] F call_function_interrupt+0x20/0x34
>    [<ffff82d04033b0d5>] F do_IRQ+0x150/0x6f3
>    [<ffff82d0402018c2>] F common_interrupt+0x132/0x140
>    [<ffff82d040283d33>] F arch/x86/acpi/cpu_idle.c#acpi_idle_do_entry+0x113/0x129
>    [<ffff82d04028436c>] F arch/x86/acpi/cpu_idle.c#acpi_processor_idle+0x3eb/0x5f7
>    [<ffff82d04032a549>] F arch/x86/domain.c#idle_loop+0xec/0xee
> 
> ****************************************
> Panic on CPU 0:
> FATAL TRAP: vector = 6 (invalid opcode)
> ****************************************
> 
> Which in most cases does lead to a reboot, however that's unreliable.
> 
> Change the default reboot preference to prefer ACPI over UEFI if available and
> not in reduced hardware mode.
> 
> This is in line to what Linux does, so it's unlikely to cause issues on current
> and future hardware, since there's a much higher chance of vendors testing
> hardware with Linux rather than Xen.
> 
> Add a special case for one Acer model that does require being rebooted using
> ResetSystem().  See Linux commit 0082517fa4bce for rationale.
> 
> I'm not aware of using ACPI reboot causing issues on boxes that do have
> properly implemented ResetSystem() methods.

A data point from a new system I'm still in the process of setting up: The
ACPI reboot method, as used by Linux, unconditionally means a warm reboot.
The EFI method, otoh, properly distinguishes "reboot=warm" from our default
of explicitly requesting cold reboot. (Without taking the EFI path, I
assume our write to the relevant BDA location simply has no effect, for
this being a legacy BIOS thing, and the system apparently defaults to warm
reboot when using the ACPI method.)

Clearly, as a secondary effect, this system adds to my personal experience
of so far EFI reboot consistently working on all x86 hardware I have (had)
direct access to. (That said, this is the first non-Intel system, which
likely biases my overall experience.)

Jan

