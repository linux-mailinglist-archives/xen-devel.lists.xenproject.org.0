Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA15F75FA15
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 16:44:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569006.889296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNwmf-0004Qb-97; Mon, 24 Jul 2023 14:43:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569006.889296; Mon, 24 Jul 2023 14:43:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNwmf-0004Nt-5g; Mon, 24 Jul 2023 14:43:37 +0000
Received: by outflank-mailman (input) for mailman id 569006;
 Mon, 24 Jul 2023 14:43:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vJ35=DK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qNwmd-0004Nl-R8
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 14:43:35 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2042.outbound.protection.outlook.com [40.107.13.42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f9f094a-2a30-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 16:43:21 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 14:43:04 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 14:43:04 +0000
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
X-Inumbo-ID: 6f9f094a-2a30-11ee-8612-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MFsLyc9T6msZGLf3kgGUUw6qfwJd+sBV/7GPYvzkOW7nlBumCUOqGYuKQyBB1UjycdkvFskzSBqeuYGh/SgBemK4SshPQ1KD4+Ey5dgyFlCThPIKvx5fntnnxkzE+T1bVf7rgiAC6efzarJTUM81aj1TJWRH/b2GqiVtxa3VjEjJvnLAv3DDLMy1kcp2XW2Wb5xMCsSnZKed1doWbR5mP5FiAOMOqLdqwjQRmnsxBGh1QBSZItDCZ8pV9XcOPcQEZbqdR5X0vJH+MJ6Gp8j4xlJ7qorkSaMjruhhoFnTSjne97Fn6ndzPxDYj1vZiqzyIgQG/JgvbtAAyyViOmxBnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SNzGTM1o3xIa9kcRiIs6wQ13+/1OY8o/5kHg68wZ0Cs=;
 b=OrMqb93/ZlXgYGaR9fXEZHlRKHL/mHY2Cda4nU9413UgGIr9kJc2u4J8KAhWU/Es4uebY08K+ymWUeJpozvqssrj4qpkoAyA+hciaAdVhgbLDj+GuYtzpVA2KQnSG6IycNO5XHlBieplE/QokgpNtktUpD2XFFQMXbldVt2VwjlzTtxH1Z0u+6OPJHf2HEXX1CyIUwuyuZbwGd78aNgpi8FS20tbZDfcaWjmi13LTomiMBAR2K9xrsYIHXmYmfyGhEsLfOjh5fJyca0m494RtkFyOQalygRvwYOzSY0VxB/S4qEWBAgRWWlURXefqK8n8QRqkomPN1UQtRd08HKgjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SNzGTM1o3xIa9kcRiIs6wQ13+/1OY8o/5kHg68wZ0Cs=;
 b=iESZDMAHpLSvLgm4HwNapUmo7NGwliaZbcfumIH5/Ew9JlliSDPYG4xyepeDT8P4PuWUNI3u9rRqd5+W01MpVB+VmY9HwfcECBsRsE3DKbef+U0d0IDsh/gO7Tg9P4x9LU3WU9mQTi5V0IMiRUpmy/gNzUVN0DeUmotAZWpqWvVuxPBCVNGTWKSHdbn9s6+/PnR98YBzt/RlZvaIvF+qFHQcpnbzzihiZcxZAkXyY2T9hp8j0tXqaN01A9KNEm/12uGBvX3ebZ+gmi3a+VslEQbLUaUCpYsJDbIzupktNxraMGhxyVnn0yQCJTU51gpYZcosHU6k8WEY8J5CxnNMYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <be0c9eb8-6561-f6bc-ff76-a1bfeaeaab9d@suse.com>
Date: Mon, 24 Jul 2023 16:43:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3] ns16550: add support for polling mode when device tree
 is used
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <d929b43814e6e1a247b954c4be40a35d61b6a45a.1690208840.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d929b43814e6e1a247b954c4be40a35d61b6a45a.1690208840.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM7PR04MB7157:EE_
X-MS-Office365-Filtering-Correlation-Id: 086ed71f-551d-45e3-728d-08db8c5449a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wHxfHob7HqlQ/ddlgOGBGW2k5mK1gX5nomeIKti/W0/bVYqjwLkF1GwZss7nRCpmbHDTuRzTnneZt3p0QbsgfOS8iclDN3G4viJjpLfBrvGibw2WUZ9TGzOgtJwkGWM2bxg/lSKD7GiLuPTCfSyFZQp8RaETTKZDuEtP0FLZ0zJUFhIh2TKd1ohUP7rEYcvP/sCP9HbFl3u/G/i1z6GvM0JZ6NkDoWsa9vefLgeQNBwdytIFbs+B/lSCkpaoWYfbgelo9dsb0/kWVbzv6jetMR+zPl83LfLWao8e4VPpn17VUsX73QaVprwjzhR2DE8vyRYSy24kJDQ7LnYaUEqRet/h99EMxcDX0uIdO1+CWZRoIpvso8GtbdACqaE2kwltXAjE3pKPqLiq5xL3Kw1TOJty5Y4wx5dUJJpHf5ngDH7GDLNiE8yL44KeNmQM6K/cJUrik67qem+tP9rzP6YzAVBkFCbuPitchTiee+0dtZ/JQjFpJiwIpl3OaoOtAjvg6XLqRSUISu3S6hjNwjjkIGiPhANfs/UdzyQZt7YtRGM0rUR2MK0KXY7fwto6+enqmrz0swqCIuTZT4gwWbIo9aEvrOKqsqUyCLgGJL/i4haMIOR+l8ip9j9r7FncZEvKpmIs514bXms5+0+FLbMJIw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(376002)(366004)(396003)(39850400004)(451199021)(478600001)(6486002)(66899021)(54906003)(8936002)(8676002)(5660300002)(2906002)(36756003)(86362001)(31696002)(4326008)(6916009)(38100700002)(66476007)(66946007)(66556008)(41300700001)(316002)(31686004)(83380400001)(186003)(2616005)(53546011)(26005)(6506007)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEJ6eis4emszSVlId3YxV3lOdG1mcEpyZ0JJQmNxdFd6TW80OG1Bdjh6YUth?=
 =?utf-8?B?TVF3akpibVVhU0dMdGtmZWNuU2hvYm5YeHo5ejhjNkM0RlU0ZnFhZytOWngw?=
 =?utf-8?B?RGFMWmMvMlRFVzdPSEg1Nyt3S2ZZVHpaUndtcHE1N2dienp2RnFkeUFWRkFE?=
 =?utf-8?B?WjFKVWxBYjg2cWk1TW5uT1B4U3hBbll3dTRqWlM3WFZkWnZDeGRzZ0N1bFYy?=
 =?utf-8?B?ZUx3dWwrd2l1NVdrWjFCVFl2eG15eEpwTVhLSkd6WTBlU1RrL1MzR3BleU9H?=
 =?utf-8?B?Z2paVDFYUGdXUVVXdmVLSFliUlEwK3UzMm9DQ1J0WGp2Z1ZJTSswVjV0VlhV?=
 =?utf-8?B?dFRyMG5wUE90bHZrT3RxTUZnRk5SRVRyamlsajkyYXROSEVOT1JnTGExMU83?=
 =?utf-8?B?TTltdzV0eHJITk9hb1hqMVUrN2FzM2xrKzQwQWovV0habWtoZkJsb2hOejZz?=
 =?utf-8?B?VFNyUHhkTUNJTGZ5TFlkaEtVa2d4c2hzM1hDOWdRM0JNTHdYb2swRUpWcGla?=
 =?utf-8?B?SmVXTXMvMFJ6cE1QNnpKWUZEdjRTdTZFVE1mRWszQXJRNkgvZW12MUNwaC9C?=
 =?utf-8?B?S01lT2ROUFU0S29vVGlyc3cyMXdhUW1LWUpLSnNDd0tIUHE0VklveWlLM0xn?=
 =?utf-8?B?SzZhaWxDQit3dFNHVGpHYmtUcUx6WndQaUw1RllJd3BYZTdLT0JWWHhYTGVW?=
 =?utf-8?B?SDVhOVVGUHlIY3R6WGlYR3A4MDZzVSsrNmJSbHZ6M1cxVURIaTFIZWMvRGVP?=
 =?utf-8?B?dXpFcDJ2MVB3bHoyNTcxSEljK3RPOUhPdDVnbUxodlZjdHBCVXVkU0FFYU9u?=
 =?utf-8?B?Q0RFd3VORDdldjNHQ3Y5VFNPcUpQcVRhZVZ0Q04yQnYzdXVkOStiM2puMERU?=
 =?utf-8?B?SXc5TnpuK2pnSno4RWh4dS9zcDRUaW9LYzJwY21Tc1ByMWkzbmVtZDVMRzZK?=
 =?utf-8?B?akZRUjEvNkxHaUw2a3ZzOEhGTU1nQnR2TVdQaGJsb241QXZPZnRmbkExSTMx?=
 =?utf-8?B?N0gvL3ZwUkRGa0lWQW56dmtHUTRKQWRTbFk1M1U1ejQwZ3ZEVEk2cks1MlFI?=
 =?utf-8?B?WXlwRXBlK3JSM0xYSU0wd0VoTHpRUE9Bd1VFT2l1aTdLMUdmYVVTZ25XU01G?=
 =?utf-8?B?REQxM0FVQVpLNHhwWjg2TGN4eTJSaWQzT0UzTjl0UENYclhyUCtMZ0tyU2V0?=
 =?utf-8?B?c01MNHBjR1FMWHhPdXRaT3huc3NhK29HVm54eUZOZXJ4bStQdVFNWUVaTTlw?=
 =?utf-8?B?WTNpdUZ0R0t6N2lFREc2blVQS1BhcjRRbjVveFhETUtIUGZxam52UHpJSk4r?=
 =?utf-8?B?VVN0TmcxWW11NElVdS9nVXV0V0xKNk9Cb2FMZGwxSnFxRkp3UE9xMDUzNHV2?=
 =?utf-8?B?OHdLeWwwckxuQkliVVJRUXo0UnVmclUzU1Z5WGMrcHZSMm5nUlJYdnFiMW53?=
 =?utf-8?B?WENTWndldWJhaWlCK2hBc2pGTUhZQU9EYlpWMkVpV2N4QXliUlR4SFYrMmdR?=
 =?utf-8?B?QzlTc2JSUmI0djRDUFZGdk1FVjRoRVFaT2hQMkRGc0p2TkJqQXJZRHpRaWxH?=
 =?utf-8?B?ZFVsMXYrVFF3Z1ExR1hIQUNtbkdud2NUanJWZ0p3NXBaZlRPY1NYSGV5UCsr?=
 =?utf-8?B?ai8ycTBqUE9jaXAvMzVnN0FqbTJsUTI5UzVrUFRHMDNZcWlUMUpRQjVkQlRD?=
 =?utf-8?B?WG9MdmZTc1JNOXZrVDIweUU3dGppQ0xOTk5mUzNiNVZaMWRoQU42T205YVV1?=
 =?utf-8?B?bCttNmlIYUtpekd2S3FkOXY2ejUzQ1ZkbWZsL3VwVmc3bGVEaElab2xHUlhC?=
 =?utf-8?B?N0hhZEc3T3BGL3UweTdMNjF0alhvQi9ONFlNQXdSZUVBOWdDY3V1OWlIMjBm?=
 =?utf-8?B?ZkQvNlJULzhQVUhyOENnWm1nWFYvOEVEaE9GL1hIYmFwdno3Z1BWSE9WcG1S?=
 =?utf-8?B?Mzh6a21qYWQvQ0lHU0NLSTEyUk9rMU00bHAxWmI3dGVRZkZLZm1NWEtMZ29N?=
 =?utf-8?B?SUdRRzd0NEtTWm9FRnZXUHZ3M0d1VG1WYWYvMzY4TEQzOTdOZTVjRFRCOEM0?=
 =?utf-8?B?Rk5pdkJGdUdFYURncUwvdjZScG04cFVERU9BenJnZ2ZPSG5PL05sLy94bkV5?=
 =?utf-8?Q?tjcYVf0kVS9OPkv9qYOn4jX1I?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 086ed71f-551d-45e3-728d-08db8c5449a3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 14:43:04.4702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4RG5b+u3xkVIZh9GFJy1FNFXK8c2D+dc8ZgqU/64S7JlqiMOfMvqblq40ztT5z+NY+T9VF7om82pzO0e8PudWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7157

On 24.07.2023 16:27, Oleksii Kurochko wrote:
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -993,6 +993,8 @@ void __init console_init_preirq(void)
>  #endif
>          else if ( !strncmp(p, "none", 4) )
>              continue;
> +        else if ( !strncmp(p, "polling", 7 )
> +            continue;
>          else if ( (sh = serial_parse_handle(p)) >= 0 )
>          {
>              sercon_handle = sh;

Looks like you mean the new option to go under "console=". Besides
this being guesswork because of you not updating the command line
doc, this also is wrong, as the property then applies to all
consoles. What you mean is a control for a specific instance of a
16550 console, which can only possibly go under "com<N>=". I would
suggest to simply extend [<irq>|msi] there to [<irq>|msi|poll].

> @@ -595,7 +601,9 @@ static void __init cf_check ns16550_endboot(struct serial_port *port)
>  static int __init cf_check ns16550_irq(struct serial_port *port)
>  {
>      struct ns16550 *uart = port->uart;
> -    return ((uart->irq > 0) ? uart->irq : -1);
> +
> +    return ( uart->intr_works != polling ) ?
> +            uart->irq : -1;
>  }

Please don't corrupt previously correct style. You can keep things
almost like they were (albeit there's no strict need for any of the
parentheses):

    return ((uart->intr_works != polling) ? uart->irq : -1);

> @@ -1330,9 +1341,12 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
>                   * as special only for X86.
>                   */
>                  if ( uart->irq == 0xff )
> +                {
>                      uart->irq = 0;
> +                    uart->intr_works = polling;
> +                }
>  #endif
> -                if ( !uart->irq )
> +                if ( !uart->irq || (uart->intr_works == polling) )
>                      printk(XENLOG_INFO
>                             "ns16550: %pp: no legacy IRQ, using poll mode\n",
>                             &PCI_SBDF(0, b, d, f));

Message and code (after your addition) continue to be out of sync.
As said before, any condition that leads to polling mode wants to
find itself expressed by uart->intr_works set to "polling".

> @@ -1552,6 +1566,7 @@ static bool __init parse_positional(struct ns16550 *uart, char **str)
>              conf += 3;
>              uart->msi = true;
>              uart->irq = 0;
> +            uart->intr_works = polling;

How that? "msi" is specifically asking for interrupt driven mode,
just that the IRQ number isn't known yet. (Seeing this I notice that
parse_namevalue_pairs() offers no way of selecting MSI mode. But
that's not something you need to sort out.)

Jan

