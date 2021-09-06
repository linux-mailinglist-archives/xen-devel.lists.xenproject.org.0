Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE16401D06
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 16:32:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179987.326462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNFfA-0003MQ-Sx; Mon, 06 Sep 2021 14:31:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179987.326462; Mon, 06 Sep 2021 14:31:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNFfA-0003KC-PC; Mon, 06 Sep 2021 14:31:56 +0000
Received: by outflank-mailman (input) for mailman id 179987;
 Mon, 06 Sep 2021 14:31:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNFf9-0003K6-Fo
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 14:31:55 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cbb728e0-af9f-43bc-8888-dc28a429f2c3;
 Mon, 06 Sep 2021 14:31:54 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-26-YH-nePbLM0mQl2P3n33QFw-1; Mon, 06 Sep 2021 16:31:52 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7037.eurprd04.prod.outlook.com (2603:10a6:800:125::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Mon, 6 Sep
 2021 14:31:50 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 14:31:50 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2PR09CA0020.eurprd09.prod.outlook.com (2603:10a6:101:16::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Mon, 6 Sep 2021 14:31:49 +0000
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
X-Inumbo-ID: cbb728e0-af9f-43bc-8888-dc28a429f2c3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630938713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EoJ9m66Pji9O6SyXYQfehum/FULzvCHrym3EdmuH0a4=;
	b=BM4hAG9WNwJZ+BCCoBvTO2GKcYgSeDnEILdo8e6/s1I3CocmRFGkN6x0sI8vPI1EnV7nqE
	8DgeYleszC2KmKlfSFTnCdmFWEC4Gu5Npaycqjq5AJN+GivZFBVMXiTLdWgbQ4joXfBMp8
	VXtdXTjaFnyDRCNtor02GL1k72Vaysk=
X-MC-Unique: YH-nePbLM0mQl2P3n33QFw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ign0+7h1XqoCzh5q+/7D4sRdvuLgoh9mwKAcYADT0Y+A95Oa9Ci4/qgc7Dz/J+ojrKtVoyucvcuRtGC7Eh0jI/Hkuq4eIwERKRe9FrAq4eagoxqSxAIs5eTQTGrt1k9L4xzFyCy6F3spL3UhCKKpwijnkwv52BSYMsh1LGHGgJ57fbVo3Fbq2ZXjnC+QOqPph62wjcL+7IVy2dLGiDspW8ftTZqUhygH5Ff/Y5wZYW11zWHhuu6kqo2JQKwceyoIhz6P+ZUl6fGHyoBiv88G+9xwus1F1wBdfMyEHqPR3lX5IbjMjHeryWvSmNoIbC0DLuMNTXnV1O353ob8rC+M2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=EoJ9m66Pji9O6SyXYQfehum/FULzvCHrym3EdmuH0a4=;
 b=XQMOnuvXPFYpYBXalxwSPSNNGH0AajrCdJ6ajNR5ELdpSIIlM6MqEfYA9aICGvbKNnjRiiKO5lrvb1iOfIRN0+nktOVkSYOhTDnLgvf3LxduK4/vjKaptOmZrJN6wSowjaqgmhQtfQROfI6UroL5X8ojSMS7n0U3Az+u3hIVrstggjCR5kRDFh34bAFWlJMFwdSP+TKbwgp8L6pM8+4zJ/scfVUSEFXqJ/bZVmMcyKl6KFRYBJZ7FL50vg0tTsAVySw0+IZ/P00456zvMdpQmRQCkKITasjTES/aJRJOOEkFPGZ8DrE388+UhYnvyVZZn5+rCbnnAxGMBmMHHlZhPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 5/9] vpci/header: Implement guest BAR register handlers
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-6-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1848521d-4179-f5ee-e3af-f4e6738f60e6@suse.com>
Date: Mon, 6 Sep 2021 16:31:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210903100831.177748-6-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR2PR09CA0020.eurprd09.prod.outlook.com
 (2603:10a6:101:16::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5f45ac3-d324-499f-354a-08d97143102f
X-MS-TrafficTypeDiagnostic: VI1PR04MB7037:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB70373E83E2912D45F355AECFB3D29@VI1PR04MB7037.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U7lwUZOpVePGij1GeL+s9zkHgRRcaOStPh7AgLoJTqCMK7ckk1EEOVgb7zp9Q4Lvvmbpz+o8OK7NqqxoMhZPXxZV2F/fJ7SQvEOFfs5Syl53a8oS49DcFR5kGiErAOgYoB1BwcHLm5AeXZc0WPKhl5v1eUBXxdI5nos9AI96FFImKlpEMCRF3LHn2VYb81rXFg5DQbXj1WfQUHl7Fslso7r3qL3J69Uc79a70KG+ZKHN2A10zWyFOtQozCrW0ajKhrm+RRUQ7dJTbdh+HyBiG04yzJH0cLnVJnvOrtAL2KsY7f6Rdf1G+khZNPkeuAEZTQSxcl+q7wJVjh8b32tbo7aMFpLAjYGSJ9WZHu0S+TCQlPFXOJc8JZwAtaMJkTbphVOn2kgCIjNGXATKPssYUX6s/bUDxQghFSiZNwYZUyXg/5M0ZiguDS/IvsHPevRZipS7ayEnIixDyI6ZHP4RXv9NO2R6r7wsH8zzLXmV7cyUodgyBLhE5btmyld1m9V+D7QXZ+N0p+Y2qtf8h2x+J1DebNH/UfMIx7WJBDd60zD4u9K8jCdkAzb9EjEUtDCKhJSZOChwy1Rc7GbbjKgjP24VmdeEojHxGdEyBdxO6iMSVT0R5fBggNYsekR2KqrsleA1RZMlJi5WIDeUsDvVH5dM6wdB/+f+KPTsvCfSqg0KXdk4GuWQMaxfYEptquZYd7XZrhqMtfs3cnF/Pk8NLd2hyvPLvu1PhJTtKGzeCGs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(39860400002)(376002)(396003)(366004)(66556008)(66476007)(8936002)(66946007)(478600001)(2906002)(83380400001)(36756003)(2616005)(186003)(31696002)(5660300002)(53546011)(7416002)(26005)(31686004)(86362001)(38100700002)(316002)(16576012)(6486002)(6916009)(4326008)(956004)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0x2MU9rQjQzakthaHhJVmQ1bk01RGgraVFGMDNJL2ZpVFJyY1JZeGFUdFJX?=
 =?utf-8?B?RUlONjFpYzlCdW5DcjVnVjBZUUx1dVZTMWQrYlpUNnovSTdWbnpDK2pxYzhz?=
 =?utf-8?B?RWppWU5hNklFZjMzKzFFLzZWVmNiRldudUQ4M2d6azBWZHJaWW9NZWU4L21r?=
 =?utf-8?B?NDBuTGxicG9XVlVjY04xVDZGZmVXbzNNTXE1TlgxU21GOHBuRTlWdXBEa1pO?=
 =?utf-8?B?N2VJNDJzYVQzNjFZUlpvaGR1N1BQRUt1eXNYdThsMktib0FsSVZFMFhyQzhR?=
 =?utf-8?B?bGZyck1odG82VGxNMGFEd3VXbThjTFFXb2c3bW05SzRYTlMzTUFJM29ma1d5?=
 =?utf-8?B?a2xSTlNVMVZNQzZoSHo3a3NjTnBQS0xiZDJvejE5Q1lweGk0Y085V1FONHFF?=
 =?utf-8?B?cFo3WEhRQ2pDMVJsNFRsNTZSZ2xJbmVLVWd5amZCRzdncGJGYnJTajAyOGNJ?=
 =?utf-8?B?UGtxNHd1Z2dXMkNnVVdvR0RwUVpEa0hETGlWSDAyL0pZV3RWdWRIZ1RnTGV6?=
 =?utf-8?B?QmdHRDloN3VOQUtFamluYjI0a2RZeGV4Nk0xMW9zNEMrLzN5eUJuRXk1bUtm?=
 =?utf-8?B?V1FSNEhKSDZjUzlNUjR6b1RWMXp2SHVMTTliZFlSYnY2QWxUWER4Sjh4ZUxC?=
 =?utf-8?B?SSt5d0o5SkQyeExxRC9JWWJkdXErbEJPbzhtbFZqc3ROZWJhYmk5bkk5czZY?=
 =?utf-8?B?d0ozSGc1NjdYaTNQU3YybmhUdUpyclk3Nk1Tb2ZzeUxtMkFHZ0lESkhjT3Y1?=
 =?utf-8?B?WVJsSjQzcUZ3cmprWkpKcFNkL1pJenA4U3BoMVpsYWE0NGpUWnRKcmZKbW9U?=
 =?utf-8?B?dVVvaURsNGhDMG1lMm9EMFVUK3Y4UEh1ODV1aFh0cC9hNG1aUGkzRjB0c01N?=
 =?utf-8?B?d1VxQVBWZE5sU0d5cUNOb3Q5RjJubXRvYklxUnV1N0Z6VGUxS1hCMVZtai9W?=
 =?utf-8?B?WlBtSEZSUWF6N1ZBaUROVnlESUlncFNvYzlyRDg5bzBVN3NNQXBNVVBPZk9p?=
 =?utf-8?B?TkVLVS95TEgwZUkrS1NiZ2tCaDljY2R6S0xhUUlkZzAvNEZscG1UN3BTN3ZK?=
 =?utf-8?B?cWlUZkpESHJQOTAydmwwaVdFWlB2T21ocmZFRWNJdUU0cjZ2TUZmVVQ5eWZj?=
 =?utf-8?B?czVtNGtwc0V4ZDZlSkhXMk13eXRDOWVqQXA2TUxCVjU4Qm1CVGN1NG5JZnNB?=
 =?utf-8?B?cFFtR3dHZFFCVjgxMVd2TDdCbXFlNGtIYW5QaHNWMC9tRDB3NXdCV2FKL3c2?=
 =?utf-8?B?SVZYQngrWW9vZElqNTZldG9SWThtQ3RFaEc5ZlUvQ0R5RmNJbzFQVGM1MEg1?=
 =?utf-8?B?OFJTWlBHeE5SVXB2bE9RbkZRZUc4emZHa0hRbkZhV3FjUWErN0xGWExwWi9M?=
 =?utf-8?B?TXlwemp5OGlZMWFhaTFzK2IwNzl5RGhpdytMMGtQVk9mMzdjZTdwSjd4eG1J?=
 =?utf-8?B?WTR6azZjYmUyQytEdXJiOWR3aFNFYUpjVmRrR0h5NitmZjVjNzVFNGN5WTl0?=
 =?utf-8?B?b0dkUXZZZDI3c2RvN0ZSMWVKSFF1Rk1idFpvOHpnNmpRK2lZajVIMlRON2lr?=
 =?utf-8?B?ZTQxYjhEYUdVMVhnbGlka1hlS1E1VHAzbzRYTUUxaHhaOWVYdkF3N2FKNTNp?=
 =?utf-8?B?WGxiTit3Q3A1RUppVXVSWGZ1Z1p1eHdGS1lGcUxNZE1zMVpRbUxCemxpK2dZ?=
 =?utf-8?B?OURuTVpUSnZINzNxMTl5bk45bzNkQlBuMyt0eUdCaW1MZHBqcngyK3EySG1I?=
 =?utf-8?Q?Yq50CZLOQ8WxK8vw3a3VJlx/SkcDGlB4KceARx0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5f45ac3-d324-499f-354a-08d97143102f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 14:31:49.9181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y82xFa4D+Nygj2ZL8d0b+X9ByfNkhzAcguHgiJvTh5Aw94D9ikVXaHkXad/3Ai/j0Ngb4Je8yP43TYTfy1399g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7037

On 03.09.2021 12:08, Oleksandr Andrushchenko wrote:
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -400,12 +400,72 @@ static void bar_write(const struct pci_dev *pdev, unsigned int reg,
>  static void guest_bar_write(const struct pci_dev *pdev, unsigned int reg,
>                              uint32_t val, void *data)
>  {
> +    struct vpci_bar *bar = data;
> +    bool hi = false;
> +
> +    if ( bar->type == VPCI_BAR_MEM64_HI )
> +    {
> +        ASSERT(reg > PCI_BASE_ADDRESS_0);
> +        bar--;
> +        hi = true;
> +    }
> +    else
> +        val &= PCI_BASE_ADDRESS_MEM_MASK;
> +    bar->guest_addr &= ~(0xffffffffull << (hi ? 32 : 0));
> +    bar->guest_addr |= (uint64_t)val << (hi ? 32 : 0);

What you store here is not the address that's going to be used, as
you don't mask off the low bits (to account for the BAR's size).
When a BAR gets written with all ones, all writable bits get these
ones stored. The address of the BAR, aiui, really changes to
(typically) close below 4Gb (in the case of a 32-bit BAR), which
is why memory / I/O decoding should be off while sizing BARs.
Therefore you shouldn't look for the specific "all writable bits
are ones" pattern (or worse, as you presently do, the "all bits
outside of the type specifier are ones" one) on the read path.
Instead mask the value appropriately here, and simply return back
the stored value from the read path.

>  }
>  
>  static uint32_t guest_bar_read(const struct pci_dev *pdev, unsigned int reg,
>                                 void *data)
>  {
> -    return 0xffffffff;
> +    struct vpci_bar *bar = data;
> +    uint32_t val;
> +    bool hi = false;
> +
> +    switch ( bar->type )
> +    {
> +    case VPCI_BAR_MEM64_HI:
> +        ASSERT(reg > PCI_BASE_ADDRESS_0);
> +        bar--;
> +        hi = true;
> +        /* fallthrough */
> +    case VPCI_BAR_MEM64_LO:
> +    {

Please don't add braces to case blocks when they're not needed.

> +        if ( hi )
> +            val = bar->guest_addr >> 32;
> +        else
> +            val = bar->guest_addr & 0xffffffff;
> +        if ( (val & PCI_BASE_ADDRESS_MEM_MASK_32) ==  PCI_BASE_ADDRESS_MEM_MASK_32 )

This is wrong when falling through to here from VPCI_BAR_MEM64_HI:
All 32 bits need to be looked at. Yet as per the comment further
up I think it isn't right anyway to apply the mask here.

Also: Stray double blanks.

> +        {
> +            /* Guests detects BAR's properties and sizes. */
> +            if ( hi )
> +                val = bar->size >> 32;
> +            else
> +                val = 0xffffffff & ~(bar->size - 1);
> +        }
> +        if ( !hi )
> +        {
> +            val |= PCI_BASE_ADDRESS_MEM_TYPE_64;
> +            val |= bar->prefetchable ? PCI_BASE_ADDRESS_MEM_PREFETCH : 0;
> +        }
> +        bar->guest_addr &= ~(0xffffffffull << (hi ? 32 : 0));
> +        bar->guest_addr |= (uint64_t)val << (hi ? 32 : 0);
> +        break;
> +    }
> +    case VPCI_BAR_MEM32:

Please separate non-fall-through case blocks by a blank line.

> @@ -522,6 +582,13 @@ static int add_bar_handlers(struct pci_dev *pdev, bool is_hwdom)
>              if ( rc )
>                  return rc;
>          }
> +        /*
> +         * It is neither safe nor secure to initialize guest's view of the BARs
> +         * with real values which are used by the hardware domain, so assign
> +         * all zeros to guest's view of the BARs, so the guest can perform
> +         * proper PCI device enumeration and assign BARs on its own.
> +         */
> +        bars[i].guest_addr = 0;

I'm afraid I don't understand the comment: Without memory decoding
enabled, the BARs are simple registers (with a few r/o bits).

> --- a/xen/include/xen/pci_regs.h
> +++ b/xen/include/xen/pci_regs.h
> @@ -103,6 +103,7 @@
>  #define  PCI_BASE_ADDRESS_MEM_TYPE_64	0x04	/* 64 bit address */
>  #define  PCI_BASE_ADDRESS_MEM_PREFETCH	0x08	/* prefetchable? */
>  #define  PCI_BASE_ADDRESS_MEM_MASK	(~0x0fUL)
> +#define  PCI_BASE_ADDRESS_MEM_MASK_32	(~0x0fU)

Please don't introduce an identical constant that's merely of
different type. (uint32_t)PCI_BASE_ADDRESS_MEM_MASK at the use
site (if actually still needed as per the comment above) would
seem more clear to me.

Jan


