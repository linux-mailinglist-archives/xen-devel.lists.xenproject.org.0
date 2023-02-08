Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9303D68F027
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 14:53:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491804.761107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPksY-00077j-A1; Wed, 08 Feb 2023 13:52:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491804.761107; Wed, 08 Feb 2023 13:52:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPksY-00075y-76; Wed, 08 Feb 2023 13:52:54 +0000
Received: by outflank-mailman (input) for mailman id 491804;
 Wed, 08 Feb 2023 13:52:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z/8R=6E=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pPksX-00075s-6J
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 13:52:53 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2048.outbound.protection.outlook.com [40.107.7.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e111f423-a7b7-11ed-933c-83870f6b2ba8;
 Wed, 08 Feb 2023 14:52:51 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7477.eurprd04.prod.outlook.com (2603:10a6:10:1a9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.32; Wed, 8 Feb
 2023 13:52:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6064.036; Wed, 8 Feb 2023
 13:52:21 +0000
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
X-Inumbo-ID: e111f423-a7b7-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ho81jvmYQ2kSn4W9OKux8FDfKGMJLbDQLdSMIxnP/N9yl1K5rVoNo3nqB5FM8JeY+1VajRMdW7ixgkV/QUbXSGYA5NEpMMxkYR67hQilavZhs9HGIyCyRmRVsK1H1An6XqiR6F230h2n7PgaCGoOCk4hN7qO0rIxvJ8YHRMA5NlbVeX60JSSDLntAKUsbszw/26OluiQrdX0WfGwHDAo+/GO9xmSgKSTAYScb2OpOJZyAmtdH7k7b/IXwAI9v/5a8b23YpF4vvizYex0PNQu0tQzfcGmSsu39G3xz/iRZol0zhW2O9JVk9MFE6ufp4VJZ+bSanragJ68qvaIk5+kWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=okrVck6BRG6qGz81zprf1OrFP5YupAGMWlqt7WKoUmU=;
 b=Lt92cU1EYiNF2TBWZGUsLn4HlYDUxgDXnFgqDRBVpqtMBx8ulwkhbiNJH9Lmk97qF3UEzGV4E0ZCGfsQ1U8KtHKRbheDOztKNKHgEhOsi8q6LLxO5ZAK2lEhEXg5toUni9wDQZBgndpKJStVD5DUhE3KhIskFpS8awGoolUozKyT4HWhae2LM7ss2DyZSNSI2Bs1Tq0m16lNsNQ15GAwOiLeCpntwmh0iuaFIB8fgWk2/KvI3960po21m3nDiQqgVQdcrf7f5TX6b6AJvs2l39r73CZ6NXBIG071o3ZXyDzKawV7LcyqwXIIaeZjAAUiNM+bJl3qQha9RW1AryeOJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=okrVck6BRG6qGz81zprf1OrFP5YupAGMWlqt7WKoUmU=;
 b=dILqfusdiimURd9APnF/V0C70ZvPLNrXnLwmBY3YIjThofpsURlmDrP0RxihND9pBjajqbp3DC2dia+DiYnjxFOOKKl6SNKqTySBS50LLtmXJMW40Hs8OBe5eA0LrZOORGvdZ1IhnLYEA8TVHTjOFP55aWOew1JL9xbVHQ2tRnJdlFTKPA+GSDPfc6c+ms93ew6xa5+zmoB+rjmjFm1kRhZMsa5HVnDSjKQzC2KzywQDdqDtTQ8uw7uBS/6tLPIctBKoeuFuPMXfHRtd2Qzd43PpgEwnOaUTmB5VcGWPcGE7H94Jx7tFepCtAvZxjzOYazfPnhvBxez3ej544jgeng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <216343f3-6045-c6fe-ff4c-3a70d5061b78@suse.com>
Date: Wed, 8 Feb 2023 14:52:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [XEN v3 3/9] xen/drivers: ns16550: Use paddr_t for
 io_base/io_size
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, wl@xen.org,
 rahul.singh@arm.com, xen-devel@lists.xenproject.org
References: <20230208120529.22313-1-ayan.kumar.halder@amd.com>
 <20230208120529.22313-4-ayan.kumar.halder@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230208120529.22313-4-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7477:EE_
X-MS-Office365-Filtering-Correlation-Id: 5294a81f-66fe-44dd-6571-08db09dbb360
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MiCU6aphNvIky9mdVnq2/7cifwZr6e66WqBIgT4qVbNRoMp4Y9gpQNU4PBtHzuqiwO1QVmH9panFDWmTE1mOLFpb4RQvUftasGmKgbMUfOGjwBaGqDYr914/Tkt4qIlZex5899dmB+a1FEdNhisKfqvJ4R/GzwcHhtriIz9wPWOppbAa8TdQ0mymlUridSdyPk43bTdH8OqBRpbIrY+oRuGzRaqQN4S0Oc1/Id3SlBkCwUS9PLIC6A8PV5gox6VY8ojp0fkgZavXvkzhEEahyeqnKUmOCsVxAf8T8M4fTk/XV1x7H7wtKsZPT0ablPUdcwCkjwdEdvYUhlBgRjRTd+GQj7Ud+VHYcvn3HV+a3Ak0vUXYJc53BDqGqRMi47bQxfBAXo3WQHpHVss7QuCeCxrVYFAT7xY70RcHI/swc0bihjDuVE2lvsuOb7IuZf+cow1Aze97rgULXDQCsZFPEPrgvIq96c7Nlwlk7WGKXqzaBtGMj5sA3/uhrEdY0V6Yqtbsv1N0EU9oWTcLzUo9sOXExhS3YjDe2NFrDfvGJAip0TeWBUFV7Zfnqk5MEkCAKmkwiA4TkRkDYr6wx7yuDdKEfjDNUHyZuaxGI4LMdcOlfoAh4Y81ewuIFvz7VkFEi1Y27QhGbCx3idmiyQZHpUG8gZCvuAGNaJLEKSwvPthiAyuH3bRNXcj4NOAV/1hEHtR0vWgeMZ+P7crRFGHS+ooe8uA95TBAwuhoXkVmE/s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39850400004)(346002)(136003)(376002)(396003)(366004)(451199018)(6506007)(86362001)(5660300002)(53546011)(7416002)(26005)(6512007)(31686004)(186003)(66556008)(8936002)(2906002)(66946007)(6916009)(66476007)(4326008)(8676002)(38100700002)(41300700001)(316002)(2616005)(31696002)(478600001)(6486002)(36756003)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlZ3SlF4UFloSXp2TEJ3Q3BodkdzSG5RMmR2UnhDZnpZMnpIc2tROHhKZFBF?=
 =?utf-8?B?TTVuR2RGRGhWbTUxajk5ZXFWdFhZa25DYlpqMVNZd3RWZ0Z6QWxicE02RVJV?=
 =?utf-8?B?SW5JQWNZYmpFR3Vpcm9ydCt1Z2d1UTB6WU1oYWE4SkxMOS9OLzc2TlJFRGxw?=
 =?utf-8?B?R0xRbkFCK0lIVUIvYnB3SjN4aGgrMHFtSDVaOVFGc2l5TFd3Mlc2UEVGTkZ3?=
 =?utf-8?B?OXY4djFRMTRjMlJybmNZN09JVWlhb1lmcXEwblZLQStsUXJvNHMrc1JDNUdY?=
 =?utf-8?B?YVIrbFZlWHpZRk9RR0RGWFlSV2kzS3VuT0IxcGV4MUVXL1VOVmdQemVsV09E?=
 =?utf-8?B?RWtXc3BKa2ZZd0cwclVhYW5oMzUvTm9mbWY2VUZWN2ZVcXFibCtRaUMwR084?=
 =?utf-8?B?aFZwOHgyZGlPL21jRTdiZ3dJN1ArTnlDamlZOGkva1hmV2FweW1PUHpxbVpU?=
 =?utf-8?B?QlJLRTFEOVpHT3c3WG1qNlh5bWx6dG9mQjNGWGRmU2tKSUFVRjFHY1VjWUZv?=
 =?utf-8?B?eE5uOHhjdmZGd0JCcHJHSmZBYTNmN3daMlF1VEExelhQempoWkUzTDZEZWdM?=
 =?utf-8?B?Vlo2Ylk4cW9kV2R1bytMNnFJbVlmUURzMlI5T3E4djB1T1FtYnhSb3cxQzRl?=
 =?utf-8?B?U2pMdlBSNGt2VU9mUUdRbWxpWEpyRUR1cjlqUEduUnlScGZlZ3VQUUdXMENB?=
 =?utf-8?B?SGVsZkVBMWtySFZ5SXcycUFaNVpsSWdXeENOVU1WOFFKTjRUOTJGSDNjSjdQ?=
 =?utf-8?B?ZjdTaVp6bnVVZXA0aGh1TEt4SVZKdmlVNUY4bzE4WDBIa0RHa1FmUit0VlF2?=
 =?utf-8?B?QVdXTElRd1p4VDNYZ2FYWVlSSmdTN3NMWGFvMjZsVWJpVVozK2hRNHRmUCtW?=
 =?utf-8?B?TGR5S1FDVlVhVy9RV0dPNlFhY1R6b2R4L0QxaldINk1IRG1yZHVkanltTVdJ?=
 =?utf-8?B?VnZrcmtSaFBMaHBpalVjdlByeVowcEJ0M3QwbFZiMm53QUFCN1UrRGNTYXdn?=
 =?utf-8?B?TW55TVZnZ1BXOTRUN0tmaDArU1hoSnJKekxBcC8xc0l0dzFpZHR6eVdidEhu?=
 =?utf-8?B?VGtkd3A3K0tzRjNTdFlxZEgzQmF2SWdYMlJBOGRTbXAreGdIckxnOURGQ2I1?=
 =?utf-8?B?a1B6ZTRBSzd3aUQxR1JZNUZLRnEwSVZRZmtEcldaNmg2dkVxV1l0SC81NkZy?=
 =?utf-8?B?QmUzdnZ4My9nQ3pPbTYrQmxQZ2xld1I1ZUlKNUYzOWFCWGNWUTdZMy83VTBM?=
 =?utf-8?B?U2dVTnBiaUZWT1NvOWd4MUY1Y0Zrdmo5d1VvdFE2ME1zbkFtODNkdE9WYjd6?=
 =?utf-8?B?ODhSWXVMVUREWDNacDRiSlRIYWkyM1BKZWpaTGRTaWVPazlLNll6MlRWK0dU?=
 =?utf-8?B?UkZqdnBxQkpZVkdhK1E5WUU4d1RqVXo4YnBJM2ZvL0VvSGlLK2tiTFhMUWNE?=
 =?utf-8?B?cVZWdmxFOGZuaGFubU5LanNTUEEvN2tyVFl5Q1pDVXV1bGtMNWt6clE0ZThk?=
 =?utf-8?B?SUMvVVFEdFVoOFd4N2xEd1hFbjYrdUVDcHY0V1VBTEh1bGJncExFTG94USt1?=
 =?utf-8?B?NE1MN25qVEJnNm9kQ1FQcVJPUGQ1eHFEZ2dScDhGb1lyS2g5dmNVbkpaK2No?=
 =?utf-8?B?TjB3SWE3NnA1MmVyN3ZvbmEvbEF6Y3hpVTdITWU2b2FKNG1XZWdLOHlnbzVZ?=
 =?utf-8?B?VUhManBuaEFkRjVzbm8xalNIc3ZCVGw5S2kyUlg4VlQ5VW91WUtIWEhWT0Y1?=
 =?utf-8?B?elVhVFlBVzhNSlptaHJQSEZ1S2J5N08zVmxONnh5QVBEZWhVcXB2UUpCSDRD?=
 =?utf-8?B?a29iN3RIbGxBNllLYmFNaXNlUmliNmNtT2FSbi8vc25XYlJ6M3hkQW9zZnhN?=
 =?utf-8?B?WlQ4VDR5RWpIdTZzODAwQTBsWWhQNXZCa2t6UXVGU1NVTmlMZGZtb3d3YVdi?=
 =?utf-8?B?ejhtUlhtOC9mUUd4b3VpRTRCSzU4Zm01eEpHR2daZnhvTGl4VVZpMGIwbHp1?=
 =?utf-8?B?QmFGY1U5NURJUnVQRVVIR0NhbUxGVG5zczlMbGVUMUdKWTlMOVdwTjJFbnIy?=
 =?utf-8?B?dUhMWmxZMEZuc09GemxhdGtLU3MxYTMwTC9iUGs3YkFBZllOdWVqZWNReGYx?=
 =?utf-8?Q?Ej/+j6m4UfiDs22qyfxvykTD1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5294a81f-66fe-44dd-6571-08db09dbb360
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 13:52:21.6702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w1cg/Kqvep58LP6xWYgyoK+kFfOpkc1XxQeaDl7M3Itk16nmur9OhQRy+RgTdnKR+EjP6tjjZ/ado8sxriS/Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7477

On 08.02.2023 13:05, Ayan Kumar Halder wrote:
> @@ -1166,8 +1166,9 @@ static const struct ns16550_config __initconst uart_config[] =
>  static int __init
>  pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
>  {
> -    u64 orig_base = uart->io_base;
> +    paddr_t orig_base = uart->io_base;
>      unsigned int b, d, f, nextf, i;
> +    u64 pci_uart_io_base;

uint64_t please (also elsewhere as needed), assuming the variable
actually needs to survive. And if it needs to, please move it into
a more narrow scope (and perhaps shorten its name).

> @@ -1259,8 +1260,13 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
>                      else
>                          size = len & PCI_BASE_ADDRESS_MEM_MASK;
>  
> -                    uart->io_base = ((u64)bar_64 << 32) |
> -                                    (bar & PCI_BASE_ADDRESS_MEM_MASK);
> +                    pci_uart_io_base = ((u64)bar_64 << 32) |
> +                                        (bar & PCI_BASE_ADDRESS_MEM_MASK);
> +
> +                    /* Truncation detected while converting to paddr_t */
> +                    BUG_ON((pci_uart_io_base >> (PADDR_SHIFT - 1)) > 1);

Why would we want to crash during early boot at all? And then even at a
point where it'll be hard to figure out what's going on, as we're only
in the process of configuring the serial console?

> @@ -1532,7 +1539,12 @@ static bool __init parse_positional(struct ns16550 *uart, char **str)
>          else
>  #endif
>          {
> -            uart->io_base = simple_strtoull(conf, &conf, 0);
> +            uart_io_base = simple_strtoull(conf, &conf, 0);
> +
> +            /* Truncation detected while converting to paddr_t */
> +            BUG_ON((uart_io_base >> (PADDR_SHIFT - 1)) > 1);

All the same here.

Jan

