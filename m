Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F8B6CFC03
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 08:56:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516433.800496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phmBu-0007t6-PA; Thu, 30 Mar 2023 06:55:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516433.800496; Thu, 30 Mar 2023 06:55:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phmBu-0007r5-M4; Thu, 30 Mar 2023 06:55:22 +0000
Received: by outflank-mailman (input) for mailman id 516433;
 Thu, 30 Mar 2023 06:55:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKpO=7W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phmBt-0007qz-Hh
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 06:55:21 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0620.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5611bfc-cec7-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 08:55:20 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS5PR04MB10058.eurprd04.prod.outlook.com (2603:10a6:20b:683::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22; Thu, 30 Mar
 2023 06:55:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 06:55:17 +0000
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
X-Inumbo-ID: d5611bfc-cec7-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JuP7ZS7JaS82xgIPPnCKTFLVC6emAqQlvEM8QChTBpWO0NB74XTi6Kh1mZd2kU4EQoEkVkYZ5HW7pD/P6Gk7lSYPYRKpYF5tT6NN0vH6TYjHlYaQxOB0lb4Se3cdnVGIxvcXBigM1IK6rRwLU10n9dGmVNN8QQFRyHycYPjKETC8kknxtoCM2UPF4nDbohIbnN0CIO559/XEEgR7M3S2cWfWiew7ZyauXmTXwfF8wBuF6OEydEd06QJu7XCgtZyDA/f4Kw24LCJ5LbUfxsHO2nw9/tPDSf1ctl/3KRlS77PZ0QsZHOiDUaZWNJQ2QV9NCXT/AjpXsls51t0uSpnJ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ig8A952EM7iw9scAtj6SUv+cQh/8f3uyhdczDEc3b8g=;
 b=h+QbLXfhylTW41/DKG/mIls9wE+Afz0ejkWUuCmScN9fPp9M8qLwZk2zxlamhcoZqL9EwKsgjJBTcTYsRbe3k8rt/xi4t2mTiJySxNCCtl5htsU/pal2FFTZSyeQBfq/NN2N4TSj5AxgGklD+N2/l7ZYhpdeTCglv6tFGDPXIfZuNS8iDRIYopK+o0QlL540ONHFDze0SbbAuqVEse4TGBfiTkk3IWQkZ/joURk7acAYlshZ0pZ97D1i6eC3Zda10H/p21jKMN6u0ZlV3iReSMRGXBj0G0xju5X/GsvT5s1uwf3hlQyfLwZV6a8CNSo/hqfGi1H6AZF1d3mqle9QRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ig8A952EM7iw9scAtj6SUv+cQh/8f3uyhdczDEc3b8g=;
 b=EExd9uEvsc+qyD0VuCwAGLeaVDd9v/1kXoSVlB2aYgAWm/Dw1yR2ePnHKKylV7UiD3+BDP/JXH2Y5k6bKm/fYoanFR7qD/rLQUDPxzOOE/NcuCXkWlzph2t3RaYncwLwX+U3S17yIRU2vWk+oKtpETu7CaSA9PwAkXd0gGFmNZCGSJeSxf4nCC/spG2fRMZSvQbA99gJ+/JMtm7KD9aM07wGedAhlAj3ZBYiiIVlPSX2ZyLLE/ptIzNSJngvrb/8kCrempg51eZwD0oun162IPL86asQnzZx2MSv88fGGqETw8/AAkgvzvF/V/87OjPCmxS16DkOwZ7t8PW/cjC5GA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6196e90f-752e-e61a-45ce-37e46c22b812@suse.com>
Date: Thu, 30 Mar 2023 08:55:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [XEN v4 04/11] xen/drivers: ns16550: Use paddr_t for
 io_base/io_size
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, wl@xen.org,
 rahul.singh@arm.com, xen-devel@lists.xenproject.org
References: <20230321140357.24094-1-ayan.kumar.halder@amd.com>
 <20230321140357.24094-5-ayan.kumar.halder@amd.com>
 <197973ce-2361-f3e4-fd38-40b4ad802acf@suse.com>
 <3e403b20-fa1a-5e0c-8e14-b89afbb10a0f@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3e403b20-fa1a-5e0c-8e14-b89afbb10a0f@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS5PR04MB10058:EE_
X-MS-Office365-Filtering-Correlation-Id: bc73646c-703c-4204-7ea7-08db30ebb839
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UjbwyEh34MksPHWTolHzwr96WGgaWwyxvnclzE7yv22U/exjg69KPz5uemrz+AJ3yDBRQUD27o4o2AI1nzc74g3w/aKUdvjakIuqSjv8LjX+AdtXVfDKhCufOEWkvgQGijXC+NTC9/0AqTgplugdSUXOBjtfZs5GM42QVtg2Mb34undrWiglrOkoX1+az9mNhAEftkKS+gpEUFVv0PPcyOv7l/APsyjgPY3sbQTW7e9GUw5QbGUB5E9mNPSzaRytQ4UOknpiMQIaxaIHZZ6FefIZddUv5b5BJOL5YpU5c9VK2DDUJtIlPNGwnMG15gXWRMbu6HqN3LMAniA5/Ojnb4UdQLJEaeaBDVUloRGruf01GEPbeQZlvyvxQB+CwiPXgXMOjA/9jOrJ6JLWfOj/pSGrBtPiwdc+fjjorfCiA/kpHFZOBWVJ5GaWBqKTMirwo7vG6wxWsSrCSyXAIDULf1p9y1sk6XRJ1nma7G4o3faxA+8sk9i/0IVIhXosbsDm5Yfmuu5wy4dp88296Hw5rROfm60s5h4MbP6XE30lQW9fhY9Bu8LcEDc+KTAp3dgjDPBKeOwuWidefyhMbRXcWMVSMkrQ55QRPnhYlBVVsm82qX+jTv74Sz1O5IW1hwEu8YGlh5fVammFrSQ5+uqBMA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(376002)(39860400002)(366004)(396003)(451199021)(186003)(316002)(66946007)(110136005)(31686004)(4326008)(53546011)(6506007)(6512007)(66556008)(66476007)(8676002)(26005)(41300700001)(478600001)(8936002)(2616005)(83380400001)(5660300002)(7416002)(2906002)(6486002)(38100700002)(36756003)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXZwTGsrUmtHSS9FY2RKbEJjNmVWK2hGNEs0SHhFTzJHa1owSndJS3duVTYr?=
 =?utf-8?B?U0RVbSsxMUVCeEpwUUExVTB6VEpLZkVmdkt0cGlqbVZWQkx0cUxmQ1RVUmJZ?=
 =?utf-8?B?aHNiMEtYMlpxVlkydzAxSjFVUzF5OWM1OEJjVitkWXZiSDFvbGFyVDJoZWda?=
 =?utf-8?B?T0tLbmxMekZFZXpWWk9mYllPZzJjT2cwb2J6YXZLOXZUR2NMbjkvb3dFbnRN?=
 =?utf-8?B?aTNIbllIZ0dwbzFZQno0bWkwaWowSTcza2VSQVBCSDdXTEMweEhxWEVIWnBD?=
 =?utf-8?B?dlppNXJFc05DcHpJNXNsaG1YSEhvLy9rZTZscU9zNHp6V05ZbUx4aVpJaXB1?=
 =?utf-8?B?Z01jc1RCWXdjTmllQzBMSzEvWFJTdUlLZjk1QU14RndGb0UwMWNzMk9aNml4?=
 =?utf-8?B?aVJkMk0xdFpKamxNSGFIYUtNWEg1VkR0QWZ4bkdUZkpaQ2lrc01IbERrR0t2?=
 =?utf-8?B?UGxTTER1Z0hHSXNiZlJVR1RmcGx3MWVMTVlYTHdZbDV5NzlxTXJQelZLTHlk?=
 =?utf-8?B?RXFPdlcvc0tFYmpBRnZkMFRiZjJ0VG5pL0hNc0J4ZEVnTkpncnBPaVZJVitP?=
 =?utf-8?B?UmtiVTBOMDJmdmVlVlRBTWNYQU1XNXZLNzRCZC82bDFrbzQ1czlMNEpTcnlk?=
 =?utf-8?B?a0tVcG5UWXdLaTRjdkNmYy9HV1o1SWgyTlg4dWJFQkQ2aWc1Wm5scFhxREc5?=
 =?utf-8?B?elFDMVZWQWZzcm5ycitKeldqRVhNeE44ZVhOL0JyMVl1dVo4UXFIZUNrb3o5?=
 =?utf-8?B?NlRqcXd3ZE4wQTU3ZUd0T0ZvQTRmSVBWQXpmeHNPZ3FMSzN0a2tjdDdQYU1Z?=
 =?utf-8?B?eXcrZEpDZHRPTW00TkVCaWEweDJoeUVYVDMvTjVmVjl0QzZhUE5KMHdwNWZF?=
 =?utf-8?B?ZGVBMG1ucVNoeEh5ZDdvQ0lHRlMrS3RJcm1aS2NXN0h0TW5sek1IUHpNbTBT?=
 =?utf-8?B?QVZHay9QbENPM0haUDNRZVhVMEZ4NEwzZHg3aDRnd3p6dHFNcFhmM29pVnVt?=
 =?utf-8?B?MlZDMXRTWXlLMjlybFJDMXRWMG9uQ2JGcDRnMFFoQnpaeWZJaEd5Q0pSalB1?=
 =?utf-8?B?eGNBRkwzRlVuSzdJOXRhQi93T0tRRnhIaWJmUGkzdjBnWG5DYmRuVUQzeFQz?=
 =?utf-8?B?cGdwZldFYWI0bHVhdWk1dXdmWlZSMXVsNnA4SXRRSW1UWGxuRkR5ZWNCZ0FD?=
 =?utf-8?B?d3ZHR3QvWGUwTTZmeGxDQ1hnWXdNMlRHV2JpVER3QjliSUl0b1lOcFhkVHAx?=
 =?utf-8?B?a2ZlTUc0Ym5semZxWm1McG9CRGtsK0lHS1JjeTZXaHJhTWg5dEx3MU1FU1dQ?=
 =?utf-8?B?ZlEvNzJRNkhNaEtZQkx5OVhQQndOL3NLYyszOHUxM2tpOTNyaWdkbSt5bjVX?=
 =?utf-8?B?aWx5UTkxNmNabi9CTmpVdUE2VTNUNWs5WFVzV3dYUWcwNGd6ekoreVJQeFNQ?=
 =?utf-8?B?OUtEY3JxZjJ0WnFTbEs5UThKZGZGYyt1aVMwR1NQSGtINit3UVh0aHZGaUZ0?=
 =?utf-8?B?bzFmcmJIL09oT1FxU2dzYnNxMm1MRnh2WlJLanNmT3k5TDFYQll4ZXlYd0ly?=
 =?utf-8?B?b2QxcHV0SW5JVEJrQW0zVWZ0bkJMa1dueno2bGNCMHJwbWh2Z0JqZS9rc0hF?=
 =?utf-8?B?NWVDS3ZFa01zRG9tVEVyWDJmUUVaUVV0STdCNVlKR05ZZXo4Nmd5Z2lUWXEw?=
 =?utf-8?B?NGFWL3FtTXVWd1RqZlhXbHAxNTFnRGNQYkRobklSREFVUDNCZEZyU1laMjdU?=
 =?utf-8?B?VnNHaFJUQXdGWllYMVZQUjVYbFkyenNiM3VVbEhadTNod01FNjZxSUhId0Ja?=
 =?utf-8?B?RlVweTRiMmp3NFlkTjliTjVKeFBEU1VYajlZa2dpck1idGFZN1FmVVpQU0o0?=
 =?utf-8?B?VmVtNGlXUUlzRzhZSEZqcTlDaWZJTzFNYmJwNWdEL2gvbkdGYW9DRThYbzZO?=
 =?utf-8?B?a1Vmd0R5NnBiaGN6R0pFa1JSa1NQd1d4TndMUGlITUtncU5qTjBTdDVBdmVs?=
 =?utf-8?B?dEFSemFNTkxEQW55S1JiTlprc2pYWkMreEs5N0lIQ1NkQ29Lalh0RUIvNUor?=
 =?utf-8?B?bm9RMUpLa0xwdHdlaTFUMjYyTE5YTXpSajFvNjBRZEpmWnhnYXErZmVMb2pP?=
 =?utf-8?Q?hSzClnnli7PZAfB3i9QFBi/SP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc73646c-703c-4204-7ea7-08db30ebb839
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 06:55:17.0918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I6aB5uM4wBS5J+PhbbFscGzSEhwN+PehEA54VFMdPbYEGEcs6b25Djdpw9Gs8JBUlK/vBxYL++gtfDgoVdjAGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10058

On 29.03.2023 16:35, Ayan Kumar Halder wrote:
> Please let me know if the below patch looks fine.

Apart from the comments below there may be formatting issues, which
I can't sensibly comment on when the patch was mangled by your mailer
anyway. (Which in turn is why it is generally better to properly send
a new version, rather than replying with kind-of-a-new-version on an
earlier thread.)

Additionally, up front: I'm sorry for the extra requests, but I'm
afraid to sensibly make the changes you want to make some things need
sorting first, to avoid extending pre-existing clumsiness. This is
irrespective of the present state of things clearly not being your
fault.

> @@ -1235,6 +1235,8 @@ pci_uart_config(struct ns16550 *uart, bool_t 
> skip_amt, unsigned int idx)
>                   /* MMIO based */
>                   if ( param->mmio && !(bar & PCI_BASE_ADDRESS_SPACE_IO) )
>                   {
> +                    uint64_t pci_uart_io_base;
> +
>                       pci_conf_write32(PCI_SBDF(0, b, d, f),
>                                        PCI_BASE_ADDRESS_0 + bar_idx*4, ~0u);
>                       len = pci_conf_read32(PCI_SBDF(0, b, d, f),
> @@ -1259,8 +1261,17 @@ pci_uart_config(struct ns16550 *uart, bool_t 
> skip_amt, unsigned int idx)
>                       else
>                           size = len & PCI_BASE_ADDRESS_MEM_MASK;
> 
> -                    uart->io_base = ((u64)bar_64 << 32) |
> -                                    (bar & PCI_BASE_ADDRESS_MEM_MASK);
> +                    pci_uart_io_base = ((uint64_t)bar_64 << 32) |
> +                                        (bar & PCI_BASE_ADDRESS_MEM_MASK);
> +
> +                    /* Truncation detected while converting to paddr_t */
> +                    if ( pci_uart_io_base != (paddr_t)pci_uart_io_base )
> +                    {
> +                        printk("ERROR: Truncation detected for io_base 
> address");
> +                        return -EINVAL;
> +                    }

Further down the function returns -1, so here you assume EINVAL != 1.
Such assumptions (and mixing of value spaces) is generally not a good
idea. Since there are other issues (see below), maybe you really want
to add a prereq patch addressing those? That would include changing the
"return -1" to either "return 1" or making it use some sensible and
properly distinguishable errno value.

> @@ -1519,20 +1530,40 @@ static bool __init parse_positional(struct 
> ns16550 *uart, char **str)
>   #ifdef CONFIG_HAS_PCI
>           if ( strncmp(conf, "pci", 3) == 0 )
>           {
> -            if ( pci_uart_config(uart, 1/* skip AMT */, uart - 
> ns16550_com) )
> +            int ret;
> +
> +            ret = pci_uart_config(uart, 1/* skip AMT */, uart - 
> ns16550_com);
> +
> +            if ( ret == -EINVAL )
> +                return false;
> +            else if ( ret )
>                   return true;

With skip_amt != 0 the function presently can only return 0. You're
therefore converting pre-existing dead code to another form of dead
code. Otoh (and as, I think, previously indicated) ...

> +
>               conf += 3;
>           }
>           else if ( strncmp(conf, "amt", 3) == 0 )
>           {
> -            if ( pci_uart_config(uart, 0, uart - ns16550_com) )
> +            int ret = pci_uart_config(uart, 0, uart - ns16550_com);
> +
> +            if ( ret == -EINVAL )
> +                return false;
> +            else if ( ret )
>                   return true;

... the equivalent of this in parse_namevalue_pairs() not checking
the return value is bogus. But it is further bogus that the case
where skip_amt has passed 1 for it sets dev_set to true
unconditionally, i.e. even when no device was found. IOW I also
question the correctness of the final "return 0" in pci_uart_config().
I looks to me as if this wants to be a skip_amt-independent
"return -ENODEV". skip_amt would only control whether uart->io_base is
restored before returning (leaving aside the question of why that is).

Jan

