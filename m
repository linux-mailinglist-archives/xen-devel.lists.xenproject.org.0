Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0528075812A
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 17:41:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565385.883497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLmoN-0002nG-PO; Tue, 18 Jul 2023 15:40:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565385.883497; Tue, 18 Jul 2023 15:40:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLmoN-0002kX-Mh; Tue, 18 Jul 2023 15:40:27 +0000
Received: by outflank-mailman (input) for mailman id 565385;
 Tue, 18 Jul 2023 15:40:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g6ux=DE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLmoM-0002kA-Lw
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 15:40:26 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20615.outbound.protection.outlook.com
 [2a01:111:f400:7d00::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 688263c1-2581-11ee-8611-37d641c3527e;
 Tue, 18 Jul 2023 17:40:23 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBAPR04MB7400.eurprd04.prod.outlook.com (2603:10a6:10:1b3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Tue, 18 Jul
 2023 15:40:21 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 15:40:21 +0000
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
X-Inumbo-ID: 688263c1-2581-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IlP9YKq5WMTz9lrJVM7/r/vs2hV1wC33T0GzD0lCE8LbwIRv0j2YHCy7svl6DFnkvZT6vRuT2/y7Gj4dwjV+qmOmRPZS70ZCHhhpIRXcBdtrUQRNwto3ATidBR40IYsMfkC3m15emzpccIb+OqsNxEasnUrkjZ0uQ7a4gLk2U90Rp5yFtfu3k1d137dbOUvGiFgnuwwewlBxMZ8CuDRF2fk7T7GCfamGdbWSAN1laSzY6rSi0pUyQlwAQVm2ek0u3lq7OHjeNwrXc5/A8EJKoVckqEbCVY7fIS00kXpI1vK7AoqVAL1NklQ6D6mr5NqiFnFeW+3mYLfLgCQRQYIxAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iGNqzj5auuECKCtrg/wRT+UMA+m5RQVhzkueY9/jP3o=;
 b=YT7JGXzoqnXOuwW0dTo1kxF9qgJcy7hQGWFRczuRXSp7ko+sU4n+Ri1xFp3FU1zJEQJ4gb36rVCjJ4sIMY8LQxurTP0uuGW98RywnUJAoqOkQvHNiVgvDnLAxvBGqWydUxInlZlV8ghAzUe3pH8y6XAmAaT1D2nfg5f4GNPdWJGdp0VsAgCgjC6moMcXRvhWMtRgOBFauzlht4Mb8SfvyA9sp6m2dCqRPXB1dudRhWiRNedrxrbZgWAqszuGxxhQp64eYBcoS3+upg74oSYBXEcERGVAzFLiTe5OifgQ83On8tsGZpxKD2VBnMN5pQcIknuG103VOxxM3hXyns1f3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGNqzj5auuECKCtrg/wRT+UMA+m5RQVhzkueY9/jP3o=;
 b=soxjhSwWyYbusf+Ih/P7kuUef5588HnBaoDM/PAmeKBvRIiVwoZMopOWbx0ZAXrtwT+rA5cUDzOxUgJWpHWN6hjqZxluvrAVRXslR60ZSBM8IrJsWRyCNTGzmadvTLWcnfXbWUh6c55tdncetViNLUK0ahBCc+N9IdeU0zjaDT+xH+AvSRUmwHUAK9az+5x7tCs8Ab3dFnGM4rjSs1bFQ5U3/ZdwS5Y7eYj7yGCFSb4K2iiQ/WzC3lo4Xes93o3Egu1FPBxnIK0qWM9mxQlWUoeyiqJHSWIi87vB4x/l4o7PdSi5t3FsTGiDVwdy0dcTmTzuN5H2tyJVD36VLg7Gdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1bc67bb2-9b01-eb18-eb6a-741067a9b35c@suse.com>
Date: Tue, 18 Jul 2023 17:40:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/5] x86/ioapic: RTE modifications must use
 ioapic_write_entry
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230718124334.36548-1-roger.pau@citrix.com>
 <20230718124334.36548-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230718124334.36548-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0246.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBAPR04MB7400:EE_
X-MS-Office365-Filtering-Correlation-Id: 44289657-e060-4425-96f8-08db87a54b77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5hUMdrxU+EIhkjqaOdIzDA1wh7gXgh4UtAZ3WhIoEF04kTIanHD0GUYnMklHpwGx8xcdnn2z5TxGb0UOQmYWjiE9W7m9Z1mvLocllV1pfuUB2jgaGeodsoR1OYk94QNzcTaZ1Ob8ZXzFOqNX5TTp0kcJ9LyXzXIQ4JUYHB9SHHs1pUjXxhXk+eivv/XWmnUTCYFjzjwWm8XW5xfH2TODVbFATI2/RgRHRFFRH1dzukoH49KqC3kVnmMOQlzUIZ1rqnenGI1GVe1XVQuOnTbGSywQmU+5y/SvSQAFXxaf9zh7Uv+7gJYiUln/fnKipjyAQnTTsDxih8dciJntA/RAliogEvET4htUOFTHnaCwiUfVdsXYEj5zkaOUdKUSdrqHuibftSw4fs2XIVzoVZfPpWSiF0YgriyKGGYqJl5+1BYDY1yxADuxpAgbdAVE6mOVK8HjoW0ueEEORf+SwG4SH8RdsEFO72a+srmz+t/oiXMZ75BKiHAfTjEKL+HjJm5d6CzMLDNh8G7yjuC4X7B1akpSTtq+tCVR9Ww31qL97qTKFxRlKaTERj5B4JVKAFSbosZt4SEP9vSDBzp4qE30sRr5nDT+bujdT4HeHvDO+vGgAIBSGMSjs+07nsYe32nay6smXMTC1e/gvuUJzp1hmA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(366004)(39860400002)(346002)(136003)(451199021)(8936002)(8676002)(31686004)(66476007)(66556008)(41300700001)(6512007)(6486002)(66946007)(316002)(4326008)(6916009)(5660300002)(54906003)(36756003)(6666004)(2906002)(478600001)(26005)(83380400001)(53546011)(6506007)(2616005)(31696002)(38100700002)(86362001)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1F3Wmk0R1BlR3dUTlM5c0sxZWl1VU54T3BXM2VSRDFqTHpJTk1EeTRoNlJZ?=
 =?utf-8?B?MGpReTk0eW1SV2pJV1VDeGIxZWtjUXZtaFVwKzk1QVNLSVFVSGV3NWFHRHlz?=
 =?utf-8?B?ZmlSaW5tWEFRdkR2NGpZN2FKcldJMmFhWWhHa0lmSkE0RkVMUXRLUUlqYlN5?=
 =?utf-8?B?a1JTUTNXVlRSQmhxRHBFNjZvbm83SUVka25iS2dab2pOWm5pRkh3U3ZRYTNI?=
 =?utf-8?B?MkxNbVFNT3ZqZlcxR3BxaXhYL3JTRmR0cGpEdXFQQXp2WEZmdXB3NWxrbzQy?=
 =?utf-8?B?QVdjNWNSSzA4N0UyYms2dmVWWmMxd3hMMm9nTVltM2ZpS1hYcFE2bk91RFpt?=
 =?utf-8?B?Qm01RUhWYlFrRG5TMkcvdXZTWkFuQWRJM2s4dHp5QnhQS2hEUUtTS0M4R05J?=
 =?utf-8?B?dVc5NlVzN1VBMXpEOFFHTS95djhYNWxlczZjVUxqeEhOWVE0cVFzclZzd3VJ?=
 =?utf-8?B?Y09XZHhDNXVyUDRBWG10Tmpra1lKcHdtdDlUa0s2dGRGeXl3SVNndnE0aVdE?=
 =?utf-8?B?Z2NsZjRnYmJJd2p1V2JzVU5LWTc1NDZJTWRnUHdqZjZkeVR3YVFkREhjTzhn?=
 =?utf-8?B?ekVXdS9KK0M4U0ZxQXFCRTF6R29FMUdsZ1BYRWtBODU4UW1rYVMwVzVOMkho?=
 =?utf-8?B?YlZPODUydVhnYlZMSEZIY3ZuWFY3ZzE4bFhBTzZPR2xHa2xWb1RYdDFxRktn?=
 =?utf-8?B?Zzd0QnRiWG0ySUdFQk9ZQ3RjdlpZRldTTFlkQ0dUYmtLM0N5UUY2RCs0ZTdK?=
 =?utf-8?B?RUxyS3RJMDhIa3dPRzJiUTQvZVhuMUUwWlJxOWxIMlJ6dEVkakNzb0pzVkFW?=
 =?utf-8?B?ZFJhNHgwK3hGOHFNVzQ3VnZaOTAzTUt0T2puUUd2Qk94ZUdQQldodEgya3Vv?=
 =?utf-8?B?cXpqclZURTNsQzlBUEZUdE12eXpEeDB4UE52MGVkM29mbyt0dXpHdDlNRlg3?=
 =?utf-8?B?ZVAxdnNTbVQ0eE9QQ3J4WlBPM29BSXlleDAxQWp0S3N6Y3RuSlpibUU3ZnZY?=
 =?utf-8?B?VXd0K2xOOHBKbnhoWkd3Y2xJU0lpa3duU2V6S1MvNy92akE2TGM1VUN3Z3l3?=
 =?utf-8?B?ZWVLcU9mUlgxdjhEWmZCUzlSblNmYTN1bEVRYmdMNEhYc1lMVEJrN0gzWmEz?=
 =?utf-8?B?L3FYUXhPN0ZoV1pIOUt5UXFIUi96SzNvd05RSnduelZJZkRUVjQ3Q1ZoOUV0?=
 =?utf-8?B?WUxXc05tZkJ6OFpPNHdGMEgvTHV1aWNSWEtmRlZKWFBEa1U1VHY0bDk5QnVK?=
 =?utf-8?B?Z0g0cWY2a2tvc0N2dFFCYWNiWHJRckF6a0xFRTJhbVNtSTY1aU5DQXBGWGpC?=
 =?utf-8?B?M3I5b1pvR0dkZEhLeDNZK1lOU2prRCtZKzdhN0Fxd2J0dUpBOFE1Um5VcGJ6?=
 =?utf-8?B?WjhBY1hxdi9tQm1zYlM0cG1reHJadjkrbjJyNFhZRTVVMG54dmZHcVdNVllP?=
 =?utf-8?B?TFl6M0s5UmVnQzdsR0RSQXB4bUNSdXI2V3FpZFA3bXJaeGxSK2IxWHRzL1Ji?=
 =?utf-8?B?eXhpMk1pUG14NDNTeGpKUkgxaUh1Q3NVdFZmOFU1eU8yM2prcU1kK0tTYytJ?=
 =?utf-8?B?UkNSSzBKeEl5UE96c3dsa3M0WVVNNUZxcm9KSHdCU055bWhiRGljVnZEQUFu?=
 =?utf-8?B?SXBjTnpncWxvdVYvcU1LU1RjRkJrV2dxOG80eTBOblR5eVlqVUJYUnVETExs?=
 =?utf-8?B?VE1RdzhOdC92SmpHTSt4QitNQ1RBbWJrYnVCTU14bVEvcTN1amVEcy9UTDd1?=
 =?utf-8?B?Y2habmRudlVTdTlyZUl5SExOaU55YzBOc2pzU1NiZGpRZm1scUJOVFExWWJn?=
 =?utf-8?B?SG4wVk9zZ0tBK2IveUdIR1dPSU1RYjdNK0FNS1NWSXFoVDJuanR2cmZrN3d3?=
 =?utf-8?B?MHZDNnVQWHVpQ3huWk13dDFGYzNSS25pM2NaZ0oxOTBnMUprMkh1Vm9MM0Vm?=
 =?utf-8?B?S1NMTG1zT05MTkJKeVE4cDZtOWMxQ0M4MDFVWjhsbDlDbWZkREpTYTQxOXBw?=
 =?utf-8?B?dVdHZkRWb1lwVGdlSmptMkJRUjVOU1Aram1DZDZYekZVaXorSVFFSER3ZTZR?=
 =?utf-8?B?cy9zVS9KcHkyR201OC90VjkrS0c3M0xLUEJzRUViTlF6MzZrNFBIV1VlQloz?=
 =?utf-8?Q?EYXJiyPongYRX4COqmICrVRFu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44289657-e060-4425-96f8-08db87a54b77
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 15:40:21.2130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ToAB2L29/lp8cq1asTJj5zUjnr/RBXcYqq4Erpl8o5T2bB7LTrWPgqABxT1xpJmkckJOC34XGJiOdbO/RkaECQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7400

On 18.07.2023 14:43, Roger Pau Monne wrote:
> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -269,15 +269,15 @@ void __ioapic_write_entry(
>  {
>      union entry_union eu = { .entry = e };
>  
> -    if ( raw )
> +    if ( raw || !iommu_intremap )
>      {
>          __io_apic_write(apic, 0x11 + 2 * pin, eu.w2);
>          __io_apic_write(apic, 0x10 + 2 * pin, eu.w1);
>      }
>      else
>      {
> -        io_apic_write(apic, 0x11 + 2 * pin, eu.w2);
> -        io_apic_write(apic, 0x10 + 2 * pin, eu.w1);
> +        iommu_update_ire_from_apic(apic, 0x11 + 2 * pin, eu.w2);
> +        iommu_update_ire_from_apic(apic, 0x10 + 2 * pin, eu.w1);
>      }
>  }

I think __ioapic_read_entry() wants updating similarly, so that both
remain consistent.

> @@ -433,16 +433,17 @@ static void modify_IO_APIC_irq(unsigned int irq, unsigned int enable,
>                                 unsigned int disable)
>  {
>      struct irq_pin_list *entry = irq_2_pin + irq;
> -    unsigned int pin, reg;
>  
>      for (;;) {
> -        pin = entry->pin;
> +        unsigned int pin = entry->pin;
> +        struct IO_APIC_route_entry rte;
> +
>          if (pin == -1)
>              break;
> -        reg = io_apic_read(entry->apic, 0x10 + pin*2);
> -        reg &= ~disable;
> -        reg |= enable;
> -        io_apic_modify(entry->apic, 0x10 + pin*2, reg);
> +        rte = __ioapic_read_entry(entry->apic, pin, false);
> +        rte.raw &= ~(uint64_t)disable;
> +        rte.raw |= enable;
> +        __ioapic_write_entry(entry->apic, pin, false, rte);

While this isn't going to happen overly often, ...

> @@ -584,16 +585,16 @@ set_ioapic_affinity_irq(struct irq_desc *desc, const cpumask_t *mask)
>              dest = SET_APIC_LOGICAL_ID(dest);
>          entry = irq_2_pin + irq;
>          for (;;) {
> -            unsigned int data;
> +            struct IO_APIC_route_entry rte;
> +
>              pin = entry->pin;
>              if (pin == -1)
>                  break;
>  
> -            io_apic_write(entry->apic, 0x10 + 1 + pin*2, dest);
> -            data = io_apic_read(entry->apic, 0x10 + pin*2);
> -            data &= ~IO_APIC_REDIR_VECTOR_MASK;
> -            data |= MASK_INSR(desc->arch.vector, IO_APIC_REDIR_VECTOR_MASK);
> -            io_apic_modify(entry->apic, 0x10 + pin*2, data);
> +            rte = __ioapic_read_entry(entry->apic, pin, false);
> +            rte.dest.dest32 = dest;
> +            rte.vector = desc->arch.vector;
> +            __ioapic_write_entry(entry->apic, pin, false, rte);

... this makes me wonder whether there shouldn't be an
__ioapic_modify_entry() capable of suppressing one of the two
writes (but still being handed the full RTE).

Jan

