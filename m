Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11009574CD5
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 14:06:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367655.598734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBxbh-0008Uj-Dg; Thu, 14 Jul 2022 12:06:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367655.598734; Thu, 14 Jul 2022 12:06:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBxbh-0008Sb-Ag; Thu, 14 Jul 2022 12:06:13 +0000
Received: by outflank-mailman (input) for mailman id 367655;
 Thu, 14 Jul 2022 12:06:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kqGS=XT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oBxbg-0008SV-Il
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 12:06:12 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70073.outbound.protection.outlook.com [40.107.7.73])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59dbea78-036d-11ed-bd2d-47488cf2e6aa;
 Thu, 14 Jul 2022 14:06:11 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB6584.eurprd04.prod.outlook.com (2603:10a6:20b:f5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Thu, 14 Jul
 2022 12:06:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.014; Thu, 14 Jul 2022
 12:06:09 +0000
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
X-Inumbo-ID: 59dbea78-036d-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lTqt/DUwXhNpyWP634WFNHQFHMJbrSxDD8KIvjY/FdeN1ODI0d2duLk4Jy6k0cLJv4CPJMj4+gtgs/d5z08j+clNpmGaJzX+J4rweyyvm3VrnUcpOVorHKx/lUGGHmS53wqZ6ZH2rnp6R+xRKcUadw2wiGUTf+KBFMTabI0hXxdEinGsfcjqy5ZtzQq9ZHAGx7cYKySme2Nr1c0RS2wzSBqBWxKcUfd+Ql0zAWwrDQVeft7nmDQh2Rxbsfp5sh64fQLSzGjoa59+YlkxAr2Fdu21I7VgFcba9xXTVVu0vDUwvlILMvhSd+Iky7xQnDFqrqoViKv+JRuSMWZ2y7QNWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bv9ZxjO+xZzNd8Lu6UIjQ0aHJCqx3bltUUDcdw/vLJ0=;
 b=ZTaGcU86ET0DOk8JMv2o01QhDTJbFh6y7BtZevY56FykFP1SISVsACOVPtup5NyVlvSKm58LCMkTqiuqygS6qx7qj7ONIcdpKXB13DcLAN62hA9Qmmv/qk8LgpcYuOsErE8VGQz0VXDSbWbA9pU8vabhjYUS3vpk8+VqJrfbPASwUj0tk0s5LWwnF6T/ICVuJ3HPFYLnFUsGwI1u54elvmHit6L3Zb5wN7ekag7EN06TpKWJkzySpf01fBHuYT+ocDpW+RC8jx3hpo7/FKl/O1ISi3kqLXZ1iwiGGa6gX1zV7v5LaOiirl3MsXWSbaEBtg/7NlBjv1K1Av6Fg9sYIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bv9ZxjO+xZzNd8Lu6UIjQ0aHJCqx3bltUUDcdw/vLJ0=;
 b=Iadi9p795IP6k819zfiMfwrDkTW0/ei0xcJhOwev4wz3+A8CDh1JtosCR6CVuh3vnWzoq/fG9tNWDgS2glDZ1tbd+sQTfsCNxiWK45RwZmmPjRY0SOPvM6FXe6lbCKTB5Cn4EzcJlqnUqW9fitj2mF50MrRMdX0MAVO0pW4awKyTnLYU16LNv/4ssb4qX40EbuqH3Y6+tJUcNL6+KOFzghcG8aP7HwmPLJP8j9uk9zjnuaxBMXdes9y7+7utj1cnRMvmeESVS347nq30prfUqYZdKVE8Rkl4dva3GPmriruRfRF5HwXO7WLSMh3sWXyLOiyxidWZtmFlW8SoT1ZJgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <50867e92-8d35-44d6-e10f-a26f35f53221@suse.com>
Date: Thu, 14 Jul 2022 14:06:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 9/9] xue: allow driving the rest of XHCI by a domain
 while Xen uses DbC
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
 <a1becf0ed2a19304ce122540e67675c06aee1702.1657121519.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a1becf0ed2a19304ce122540e67675c06aee1702.1657121519.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0143.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::28) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30496200-a505-4f46-88cd-08da65913cbd
X-MS-TrafficTypeDiagnostic: AM6PR04MB6584:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a1USaZAF763HeGxhdOcyH8gKtEXJd07LxsgDf86yUY9NxFL+qF6v4vs4A9zEy4cviW24/BwCcxn6fsaG4yLwznAeXZ3/o6PRv3o5K1HurJSdpk2AJxdkG/8xefl73nvyO8JJ3IHKLF30/7DU9tF7OpWsXhATiBgyenDQSg9+M0hLsBpU77idZGbg62BqSS4fIdVjuVDoSlDX8uXg9apyuKvNghu/AKuwyIdp/+BvHPhEJ95aD0zFQA872yOaEzlkKsTgvShSCW/3FLyTWrt5rAjceudo6UyY0oDjGPptd+4WxE/f/ELbm4/luBYZ3fmZ9lF/141aQgK7iQ+gXHZZknLyupRf4rgQJ4b8eaJk2ulNF7fgHRM5sJay4LG2XK/ijos30byxfcwqC9YRMCVsAVhZGg4sJe8W1UUq3ygJdIT2amvQjBbjyLrdJkJaRqHIdU+TfQ/p0S0M2tyqQobHCidvuLOKE02pBOjWoAu923OwG4HlRm7V40/yw4gS63nRMCjaUDYtfy5NGRess40nkWxvEhZ1M5pGkgkfNMUG5lM0sIaFC6pXw3ADg8VF/rMRRZyE7HreOJnq5Crz7YHaf0mrGt5BTX/aQiD9funMYw4HaIo/NWr1odnvxhQifgvL7RzmaplJAISLFoO1FN1hOmayrNZevCJYqnlkDwixu1ejGjUfz8z9nA5p4SAcFDKcywLgXcloUKQsCapNrWexZ6GpS0neIfj4xJH+h31m42fYCWjB7ITL6efafMtF/YgQk17+szw+zSb0MxrHY1qGDnB8dDK1ar7SOts5mq5LnKSYSu18UOPu1hcpi/+jKD8rpKHOkPcUIqwc907sS+nEzJyBiSZyruIQ2UHgk7NvvQk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(396003)(136003)(366004)(346002)(39860400002)(4326008)(66574015)(53546011)(6506007)(6486002)(66556008)(86362001)(478600001)(8676002)(66476007)(66946007)(5660300002)(31696002)(41300700001)(8936002)(83380400001)(2906002)(54906003)(38100700002)(186003)(316002)(31686004)(6916009)(36756003)(2616005)(26005)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmpScmd6Slp6VHBRWnFEQjBxMkxJbHk0cGV5dm8ySlZvdDFFTmZUallIcFhC?=
 =?utf-8?B?MlZ0ZlhxcXVYNERCWGNHcjk2ZWpBdlFycnBmcDlOMktzSTJuMkNPSDZ3ZWVw?=
 =?utf-8?B?NlBobGxLbWU0Sm5ZMGh2KzRCTm9ZQVNYbHNGOHdxcE1URmhyQ2VJR2p3TjdE?=
 =?utf-8?B?NnI1OHppRWpUYXRwemh5RnljSmpLd2h1WjBLb3JnbnhCNXFuWnBqUmR6ZjJS?=
 =?utf-8?B?cndRSDFDdnpDQlgweldHRmloZlQrRFZNZkx5bFZzdGcySUZLSXFSQW9Gc1Fr?=
 =?utf-8?B?ek90ZHM4bnhKdnBEOE1NVkVHNnVCc1JORnlUU0ZxMjM3ckR2SnA5blBJLzZq?=
 =?utf-8?B?MjJSSE5iOXdsRWg2S1ljRE12RjArOHpnQWorM2NxbkdrUGQ2RnVob2JFVGlN?=
 =?utf-8?B?NGV0cmo5d1NNcG5SUC9PNXV6N3plQnZKY09TOCtUMEJuZjlGVFFEdEF3Y0c5?=
 =?utf-8?B?d1FybUQwTGlXY0ZiR09uNUJPRFpzb2U5ZWZzQ3BiSm8rZ0pYTXNpWHZWdlRU?=
 =?utf-8?B?b01leEFoWUE4cGZVZ1QvdDVYdk9MUEI4aXI3Mmo3RHY2VlJwc2k4eDBDNkdq?=
 =?utf-8?B?N1c2OWR4VmlERkhtUEdBVFdFMmRqeVlUNFpKeW8xU1BJNzZxdzBybmZRZ3F4?=
 =?utf-8?B?OEJROW0wNW5TelIySWlBUGtpNU56ZmZUalU0V1BZaWdnWTdRa050MUlvaWhF?=
 =?utf-8?B?SGRZRHBUd09adlBxTy9qZXhBYnZ0UVRUbHJ0ZWJIa3JUTkorVUZJeU52MW5K?=
 =?utf-8?B?WWpsaG9GSzNoREx4ak13cDVQaHVWZnRzd0NGMTdpd0RrUHM1Nmg2cFNLVXdq?=
 =?utf-8?B?dHluL2loT0tOWmlIVmpBYUpsQm9xa29QdU1iaXpNeWdYczF4STR2M29KZjkr?=
 =?utf-8?B?WjJ3K0ozN3ZqMkxxZ2k5TUNHV01sYUJ6VE92MWlUYjVyaUtucTYrWXNiSWRa?=
 =?utf-8?B?Z1lPcWNhQWdZNEZoNWpzVG1PcFl5OVFmQjdDZHdaMmFZcTBlQ2hzaU4zNUVI?=
 =?utf-8?B?T2ExRk5rNVNDVkZRcUU1K0RoZUw2NlNhYXQ0TVJMWjQ0VDg2MnRVRWtxM0p5?=
 =?utf-8?B?ZG5rOTFkNlhVRkxoWG52VVU1eDBORWxvbm9OWnExT3R3VzlqZFBDVFk2ejhE?=
 =?utf-8?B?alVLTW9zK3Y4WTV0R0JVR3lndDVub0M5NXN1Mm1HQjUrcExrTkl2dCtKMHp2?=
 =?utf-8?B?SEJJL3g5R0NlT2xqZmlFeXJ4VEdxczNkRm9MeWwwQjBtbkZFcExScFZiT2hL?=
 =?utf-8?B?a3ljcVEwNjJvRjQveVlQc0taQ2d3aW1KSUtwam1Tb2F6aFU2V2I5eUJHKzNS?=
 =?utf-8?B?dGhDNHZaeDBDZW9DSHhEcHVubXIwSmt2aXFWYytISExiZlR5cDdybWxCZGtT?=
 =?utf-8?B?bHFOd3hYaDFJSWJoUTNnODFPN2tEQ0IrNVRDMXo0bHluLzdlZlI0NldFUXBi?=
 =?utf-8?B?b3lrZ24vZTd0dnZja1FwdUxXT1h6ZTZscVJPMFNHRjN0RWFqMWVzYnFrRzVT?=
 =?utf-8?B?K1VzdDZXOTcvekpaTXF4U0s5RVBFK0VwY211NzNsRDQwQjhyMmE2RHorSER0?=
 =?utf-8?B?LzBqZjRGSVRqNks2RVFyK2xhajdFZHdteFAxMjd6aXlVb0FzVSt6M0xsWkRK?=
 =?utf-8?B?aXY1N3lnRkx1NGVHbXFPRzI0UmtKaTQ4OTBaMnRHWktCRUhCVmt2WFJ5M3Rx?=
 =?utf-8?B?dGhwNmQ4aUttWmZUOEVGeUF5V1dGcmo3THplQkZXd21YaldDc0Nwa2Z5blN5?=
 =?utf-8?B?bkloZU9tRDZ0TjJtWEhGc2UzTFVLVzg2dit0Wjk2UzV2UHRUTG5CWC8rWnM0?=
 =?utf-8?B?U20zUnZhRW9BWVAyUys4dUZJazZ1VFFVek91Q2xaMnNFT0VnMVQrY0pXMVZB?=
 =?utf-8?B?eGVZNU8rdHJWd3hBS29IUFlTY0p4aUpJWWhmL2VjMHQrdFFDcUJjc3RzYk1P?=
 =?utf-8?B?T0hmRFRYSzdWRkdBb1Z5amsxMVhOSTZsejZGNkdCL2huQUtUaFlrZWRGMlZz?=
 =?utf-8?B?aXJIZFZGTW9mOXkrb3luemRJTkdKdHM3bTNobjRNOS85RnlSc2NFZWdWUkwz?=
 =?utf-8?B?cVZHSERaY1Q5a054K2Q5azBGRkd2bXZpalBLRTdIS3NCWlk2cjV2elBxRm1w?=
 =?utf-8?Q?kJIDJE2Dh/o29cW2fr8aF9+Y5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30496200-a505-4f46-88cd-08da65913cbd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 12:06:09.1470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zDq88xCyrXKv9od0c6jdQmwV/W1AzkJGb4aTaPcEK6NOGeMjEwkVVbR5LONKjzndmZq7HFxGlswT2del81SWSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6584

On 06.07.2022 17:32, Marek Marczykowski-Górecki wrote:
> That's possible, because the capability was designed specifically to
> allow separate driver handle it, in parallel to unmodified xhci driver
> (separate set of registers, pretending the port is "disconnected" for
> the main xhci driver etc). It works with Linux dom0, although requires
> an awful hack - re-enabling bus mastering behind dom0's backs.
> Linux driver does similar thing - see
> drivers/usb/early/xhci-dbc.c:xdbc_handle_events().

Isn't there a risk that intermediately data was lost?

> To avoid Linux messing with the DbC, mark this MMIO area as read-only.

In principle this would want to happen quite a bit earlier in the
series. I'm okay with it being kept here as long as it is made
very obvious to and easily noticeable by committers that this series
should only be committed all in one go.

Also along with this is where I'd see the pci_hide_device() go.

> @@ -817,6 +819,16 @@ static void xue_flush(struct xue *xue, struct xue_trb_ring *trb,
>          xue_enable_dbc(xue);
>      }
>  
> +    /* Re-enable bus mastering, if dom0 (or other) disabled it in the meantime. */
> +    cmd = pci_conf_read16(xue->sbdf, PCI_COMMAND);
> +#define XUE_XHCI_CMD_REQUIRED (PCI_COMMAND_MEMORY|PCI_COMMAND_MASTER)
> +    if ( (cmd & XUE_XHCI_CMD_REQUIRED) != XUE_XHCI_CMD_REQUIRED )
> +    {
> +        cmd |= XUE_XHCI_CMD_REQUIRED;
> +        pci_conf_write16(xue->sbdf, PCI_COMMAND, cmd);
> +    }
> +#undef XUE_XHCI_CMD_REQUIRED
> +
>      xue_pop_events(xue);
>  
>      if ( !(reg->ctrl & (1UL << XUE_CTRL_DCR)) )
> @@ -916,6 +928,13 @@ static void __init cf_check xue_uart_init_postirq(struct serial_port *port)
>      serial_async_transmit(port);
>      init_timer(&uart->timer, xue_uart_poll, port, 0);
>      set_timer(&uart->timer, NOW() + MILLISECS(1));
> +
> +#ifdef CONFIG_X86
> +    if ( rangeset_add_range(mmio_ro_ranges,
> +                PFN_DOWN(uart->xue.xhc_mmio_phys + uart->xue.xhc_dbc_offset),
> +                PFN_UP(uart->xue.xhc_mmio_phys + uart->xue.xhc_dbc_offset + sizeof(*uart->xue.dbc_reg)) - 1) )
> +        printk(XENLOG_INFO "Error while adding MMIO range of device to mmio_ro_ranges\n");
> +#endif
>  }

According to my counting there are three overly long lines in these
two hunks.

Jan

