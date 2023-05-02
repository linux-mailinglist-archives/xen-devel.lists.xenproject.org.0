Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B586F4207
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 12:53:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528486.821698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptndJ-0005kh-TU; Tue, 02 May 2023 10:53:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528486.821698; Tue, 02 May 2023 10:53:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptndJ-0005iR-PU; Tue, 02 May 2023 10:53:21 +0000
Received: by outflank-mailman (input) for mailman id 528486;
 Tue, 02 May 2023 10:53:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ptndH-0005fU-Mg
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 10:53:19 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2062f.outbound.protection.outlook.com
 [2a01:111:f400:fe16::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b9147d0-e8d7-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 12:53:18 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GVXPR04MB10069.eurprd04.prod.outlook.com (2603:10a6:150:121::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 10:53:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 10:53:13 +0000
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
X-Inumbo-ID: 8b9147d0-e8d7-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z6uT0owrnYItSFu/uyk+jGZ88jOexV6wNpyIKosz5LRvMk3MPjLOZu8hBYufVM1prSBJ4VByLr2kmnoUw5ZP1fhzdZdcHb8E5Yu49/JBi/diEWbJ4bq2WgRkXBYTj/RlnfK9an09nftBjfiI9mwwN+/1OsxOEl649CcGe8ksg16l+CdepOfsES7luJsKb2Pmf1mkYYLxR4jABet6K5MJfaqYMJi7ZoqaLgO4X2CZh92jwyLHuASTPzwvjNma/1BFDN1EtpUmTuZPFS0u8LV5h7s4UhvEiCNOJzNH/n+aN/koyct611mQgtwCvIQClFg3L2IieiUeHERrAwNyml30Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gXbRNs8L0HqQSzzKkVrPVszxsVNglD88jNZQ98h8eug=;
 b=dkmdwbyZ4TVCmhA9uFOUKpt2PH+f+y+J6xEcKTpoiRFtHUZkREq22J8X9yGtnYlABFLYpa1nmHEJ/5fwNhKGw8pwGiyZTxj5St5DhcVB+3cYI8BYYcmo1FyyFzcIZOtdp7l5kZb4fw7zqsxJ5me6eV7RqE6r1fhjkdQAK7NlX4D+vkeImZ+f26Y5khxD54KZPTbUByBEM3nMsK08YBK5cXAGWDIYimL+Ah/9Z2+JRgJFGVXC9tLDt3bVrSLMBWDy6OO4a3AbBErSxWgeyMH2bYgaf+lyZpprI/tMMGGpWoWw9P7QCHOVC9Rx71KRELfCRkys7BuiYY9XLH+cfrPx9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gXbRNs8L0HqQSzzKkVrPVszxsVNglD88jNZQ98h8eug=;
 b=C4sAanMrp7PQxeG+VeWAGxzwCCf5gEnyPtqPBaSy5HxiMQh6obHymTvaZBoyjJcDTMBf9J9BmQ8FmHGxIdtVO9FHoem27g4Q2P4jwNAqdL5j7ZXFVeuJKk9RUdDEvdfd0O0FKknpV5j+025msewB4zQ7Y59g92nc77WdpQW1+kTPrNGhxmWzZ2mPQZCGgkUX/SGCkgmJCmd419b+7IhjgoNJ6jPPuDxhN1gJOe7g/tuL94kxLR0+adq2cwEMYM3NMC8dS8XV8J/2hmwp2RmCrgH/QNzPQCBkkvMoa0oH6gkemgg5TulGRTkDFf4M9rEd1IGvxVkujwF2SD/Mj8Uuog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a3f2d048-78c5-9a5d-d44d-3a930ba780fd@suse.com>
Date: Tue, 2 May 2023 12:53:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2] ns16550: enable memory decoding on MMIO-based PCI
 console card
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230425143902.142571-1-marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230425143902.142571-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GVXPR04MB10069:EE_
X-MS-Office365-Filtering-Correlation-Id: 7718c9a2-cf9d-4a4e-d549-08db4afb6d34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Sm5t77WuXcH8imUj1HImIQ76wX0XxAhjV04HH9kM5pSFY66LhEDMLzNTCuF51olj2kY7dTx43pBcvCqNOM6KoEHWvik8bhYyirF4a+virPWqKe7T8k7PZIgvKgYls2I3+KvZVRXFkIPjZ87dm/TgpWcOyXIV2jHaXEa2Kci9KcvKjsAWCnbLnMR2IWcQV9hX74QzJEawmM7NTOYSgtzNTtBT1wyC9D4Ef8VQBBQl6ydomW6x9XaYRAQRTdbXIyNjVe/5S4Atpa7gsP5yfFDZiT2RwH5VLA9GiJGkVhjdsEm8T4OLWwODZeXlcvrtrAFuMkcc1cvO0XL7CZSzBeRLc+ZurzhhjDQXorHFSh0C/m+3bBQGq11c3vO36PQ792LSaoxFvBQMaaeO5RtQvhNteb45TrC20H0YPLn/cDNFAJdRMyMX3aMyccoq2FEAD/ohHvG2fcqOVGpCK1GxUO5AwcETIxc3Vf3PPHnf/2PoKDyPgxI0U4R0kCxH5Bb9xNkkaInDtGnrK8mirjUh5WE7Gf5rWQFyZ8AxiB0SWDHxi1758a/8QEuSgHxRfjHHO8KkYu06LA11SQVj3ArDKKuV+u6EIRVD837mULrxsivRq6EqBgoHj12MQNI+1m/62Eko4EsO2tWD+2f1B0SoI6URsA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(346002)(39860400002)(376002)(136003)(451199021)(8676002)(8936002)(36756003)(41300700001)(31696002)(316002)(66556008)(66946007)(6916009)(4326008)(66476007)(86362001)(54906003)(478600001)(38100700002)(6486002)(2906002)(2616005)(5660300002)(53546011)(26005)(6512007)(6506007)(31686004)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkMxZHNwbjVBSXZUa0RzTjZBQzBJbHVYOS9CN3Y4L01Gbkl2a3NOSkphVGhW?=
 =?utf-8?B?KzdCc01Ud0p0dS9PTGtIZk1sZ2FZdElhcXBBRW5aTmxuemVFc3loWFNBRmkz?=
 =?utf-8?B?cEIrRTBMY2VtREltSFRQOW1GTmVjckxwZDUrOEN6allGYWFhTXF1ODZvR1Za?=
 =?utf-8?B?SCtFejZ5cVAxOWswaFNyMzl3WENQOXhBZ1Axemp4TDNadUVMSWUvYXo0YXky?=
 =?utf-8?B?RGxRSHJOd29veGNRdDJPSHFGdWtDdWVLMTlaZDEvSUZtR29UVTM2emVJUStz?=
 =?utf-8?B?cXAxSFJVY3FNSStHaGRjMFFBQzNMYnloWlZ3UjN0U0NEZWM5Nm1DM1FQZDFU?=
 =?utf-8?B?N1RVSGd6SVppaHpsSEZNZ1lFQkp5TUl3bHNvbHFVdWM4eGkwR0l5azR5Z1Iv?=
 =?utf-8?B?OE83Zk8zcGhoQ3I0bDZIL3lhTTdZOVNPdGt5TE5KR0NydXdxY1Nma3EyYkpS?=
 =?utf-8?B?SjNKT3hiWDVNRFYyb0t6dTNHWmZ0Zks0RTlPNzJKU3dhbyttckQrY21LWWEy?=
 =?utf-8?B?S09mQm9iZnJyenhJMTd6ZTNiN3d5MU9JS1V6YjdCNXAzVlFmb2FLTy9mdXZ6?=
 =?utf-8?B?WDQ2Wi9xWmRzWnlkcEN5SXNjVCtOMmdyUzNxMUxkTDFBdmJpZ3d3bHN6SGln?=
 =?utf-8?B?NFlvSDVsQ0NiYWdGMjAzV25jam1Ta3ZBU3BpZklNQ0dWUW05RE5XN2w1d28v?=
 =?utf-8?B?Z0g0cng0dVhkTVYxeWJ1c1hhd1Vqa3UvS3EvcWVqdlhEeHh0dWdqU3R1cVE5?=
 =?utf-8?B?MnBZalJhNW5yZ0Rka2s4djlvY2JUMS9tSHJTR2F6MloxcEZJRTVLNzF0MnRt?=
 =?utf-8?B?UlpmazM4SWNyWDJNRGRjMWptR3Q3WHZ4dmJFb1RMOTFaeERUOEU1ckdpaksr?=
 =?utf-8?B?WmxVYjU2OWQ2UTdkM0pQOTAyRDUvRkZEdDdrdU9haWNTR2RGVzdzWGRRb0xw?=
 =?utf-8?B?Z1VBZkp0RzVBRllSZWJWQU91RDA4QTJBazVmYUN5T3ZMUGhpTzRPYmlUWGJN?=
 =?utf-8?B?dnp2MzBBQ0lGTXZwaE91SFp5UVh4dmZnemZQS3RxSTc5cEVFS04yTkErMER1?=
 =?utf-8?B?WkJrdHczMm51OFNLdGNHU1I4UG5jVVlXSG9sb3NGMU5HN2N1aVMydTQyL0ha?=
 =?utf-8?B?NGNEbkpBV3ZaL3E0S1FXanczTzFtbFBuVG1uN0dHbFZaVmdrai96YlBneDY4?=
 =?utf-8?B?a3cvdEFsblZMS2RNUnNvby85OUF4Y2FENVlsU2pyWXF6TUtDM3RVUWRCMWFi?=
 =?utf-8?B?N1c1d1ZNeDZBdDVFRmdkNFp2M0tpNTVmTGttM3VoMEt5Qm9ROWYvRHJkNGRz?=
 =?utf-8?B?emppODBqM1JqSjcyTlpSOVBGVzJzaHNPRHdWR1VSWllVSnNmSm1wYUl0WmtL?=
 =?utf-8?B?bWxiVTBmcGtmUmFuVEZJRXRHdzFMb3YwVW9VVVlRcnl4YzJhVENOcEQ1aWZK?=
 =?utf-8?B?VVZtR0JoM0cxbGlhQ0ZjQWFESFlWRUlkYXFLVk1zWFhqanpNNnB5YkZ6TmJ4?=
 =?utf-8?B?RVVXOG5mSmtXZW52R09vcHVnU3ZtYnlyOGNWZS9Ham5rQy9TZFQwbW5POG1P?=
 =?utf-8?B?L1J0OWZpUWZMalZoR2FGa055dXlua1BZbElNeEk3QjFmb0NWUnZ3c2g1dXNK?=
 =?utf-8?B?YVFMejZsS0pFRXduSktQMTU4RFVqalRvMjd0bVFjRFBiL0JJc1FRbmVhLzNW?=
 =?utf-8?B?djJpNGNHekRrT01icUR4Vm9pVlc4c1NlY1BwNDVnQmlwYkJtTFFuK3JBaFR1?=
 =?utf-8?B?by9IWnNpclkreFZEUGJ1NXRlbVhIbk12WGYzN2dhditVcEh6OW5PaStUVnV1?=
 =?utf-8?B?Nkg2MVRUQ094dnlhUytFbzF1OGllSU9jRlpET1U5aDYxaXZrWVhwSCtVQjky?=
 =?utf-8?B?K2NWWlR5UWhNY1FrLy9mdUtsUlI4cU1oWGFYK2lCTlhnbXlOT3JYcWttNDl4?=
 =?utf-8?B?ZEVvN3JRU2dXc3JNUWxaTytHZFRVQk5RN0ZvSzZ3WnRLVWtFT2dsTFIycHZy?=
 =?utf-8?B?c3RsZVcycmdxTEhpT2hlTVBkaWxRemROV3M4L0dkTm1XSXlVN2gxdCtOVDNo?=
 =?utf-8?B?Y2N5bEVEVCt0U1hMYmM1a2o1S0w1ODR1bEw4Zm9jTnFKTk4xNEFjcWp1b2VC?=
 =?utf-8?Q?igZylEpaZkLYUHU10vGMfUFDI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7718c9a2-cf9d-4a4e-d549-08db4afb6d34
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 10:53:13.3819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oKvXqdiy9789UbIXn3pStcbtOdm9qyK2k79rhBsYRKVavs51E0+aQoYzPTDSX7/25N9H/SknqEXW4OYPBYTNTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10069

On 25.04.2023 16:39, Marek Marczykowski-Górecki wrote:
> pci_serial_early_init() enables PCI_COMMAND_IO for IO-based UART
> devices, add setting PCI_COMMAND_MEMORY for MMIO-based UART devices too.

This sentence is odd, as by its grammar it looks to describe the current
situation only. The respective sentence in v1 did not have this issue.

> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -272,7 +272,15 @@ static int cf_check ns16550_getc(struct serial_port *port, char *pc)
>  static void pci_serial_early_init(struct ns16550 *uart)
>  {
>  #ifdef NS16550_PCI
> -    if ( !uart->ps_bdf_enable || uart->io_base >= 0x10000 )
> +    if ( uart->bar )
> +    {
> +        pci_conf_write16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
> +                                  uart->ps_bdf[2]),
> +                         PCI_COMMAND, PCI_COMMAND_MEMORY);
> +        return;
> +    }
> +
> +    if ( !uart->ps_bdf_enable )
>          return;
>  
>      if ( uart->pb_bdf_enable )

While I did suggest using uart->bar, my implication was that the io_base
check would then remain in place. Otherwise, if I'm not mistaken, MMIO-
based devices not specified via "com<N>=...,pci" would then wrongly take
the I/O port path.

Furthermore - you can't use uart->bar alone here, can you? The field is
set equally for MMIO and port based cards in pci_uart_config().

Jan

