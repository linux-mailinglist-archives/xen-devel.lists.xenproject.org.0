Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E53194A9AE7
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 15:26:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265643.459064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFzXC-0002zI-1c; Fri, 04 Feb 2022 14:25:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265643.459064; Fri, 04 Feb 2022 14:25:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFzXB-0002x3-UU; Fri, 04 Feb 2022 14:25:57 +0000
Received: by outflank-mailman (input) for mailman id 265643;
 Fri, 04 Feb 2022 14:25:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gJ0=ST=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFzXA-0002wv-0q
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 14:25:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c728625-85c6-11ec-8f75-fffcc8bd4f1a;
 Fri, 04 Feb 2022 15:25:54 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2053.outbound.protection.outlook.com [104.47.9.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-OoMTu6F8N0ym8v04yEzRMg-1; Fri, 04 Feb 2022 15:25:53 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DBAPR04MB7334.eurprd04.prod.outlook.com (2603:10a6:10:1aa::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 4 Feb
 2022 14:25:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 14:25:46 +0000
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
X-Inumbo-ID: 5c728625-85c6-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643984754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ge2ppEOwPJftV5u4q7KZ5wUkkrkBrNaJNszKBa6VVnE=;
	b=mLYWZFhyZRjevWOCUvFqFPw021yVj4FIbMOalfKJiUaTUmeQfZtr0WAprF8J5tL4TfDJUc
	H0zWYu/1o5FkWk66oEKxI/Tqb1T0fs6ISLEyzJqvGPz3L0VA03gk/Uou813DW68F0ORLi3
	mptD5acsM3v+9+4e6Jm4yznssWvlnNU=
X-MC-Unique: OoMTu6F8N0ym8v04yEzRMg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gwg2Nbv240ENxwcVGP+NAUsrkqWN8JJW51aBX7cNOL+4OZznmsnOaNNfrTc9c+WrXhdmSavAiCkgbUGJsucA/f2OHntpqnLlI2C025XL0vZ6L3Zmq2qSH2ahvd44g2y8nb+VIq5Sj6H4VdyFNI7zvWocbPRYzqcM5K6uWNyH/8CC39lWsFZ7esdr3EyiyQZDufpdbfe6g8Xar8f7R5FZ4OkUmD0w0SH6n4xptsHdW4FqSHKMy96ZPT07qM0cuGSl1LX87hSGDPqa+W0Fj+cphhPldeXTQXqwrkUu5wM9YloGMY7m1phyW5wO/AHAseDy5iMafh8rTZxNfjJ1AxWROQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ge2ppEOwPJftV5u4q7KZ5wUkkrkBrNaJNszKBa6VVnE=;
 b=Bw23Tce9Vb3yMGO8UuhOzzhcdjYfJ3TUCZknixsZarpHur4wtgnxu7lWHGvC7tuHIYMdC69ZBOzpoqdAzjk7EQ/lycHMGUyEkpHtPnl2qKayAu6/ngCa6oLXnmumzvycn8b9on7GtX6ogN0ZlMrt9uq1FXpsipLfjjroeo/j7emDzhJrVUpRDzxZ2euJnRXfU7hmbNR9MGL5enwWng1Z96+H1uFxC5XaiKLo5/MF9pGLCNg2oQQbvPUqK/txxlPLnmdDItxL1BwIE6SINfMHT4cvGd3rPu8UgsQkgotj9BoQVbvHS8N7cI+WUpGRZPI+71T4m3Ya4zQ6hBwhs2+ZVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7df2379e-1c30-c362-3106-c7ef23af5c73@suse.com>
Date: Fri, 4 Feb 2022 15:25:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 09/13] vpci/header: emulate PCI_COMMAND register for
 guests
Content-Language: en-US
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, artem_mygaiev@epam.com, roger.pau@citrix.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, paul@xen.org,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-10-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220204063459.680961-10-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0040.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7168e303-af33-4bf0-7492-08d9e7ea3c1e
X-MS-TrafficTypeDiagnostic: DBAPR04MB7334:EE_
X-Microsoft-Antispam-PRVS:
	<DBAPR04MB73347B6C6D26B14AB5A0C3CDB3299@DBAPR04MB7334.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EIpiFdASnMdChQFGZ6F1qpaL2EpumaZC1fKiuqKTGJv5MihHKOi0vlR1HYZwblmN1n39yUdVgajvD0xr8ODPiTauUbgWmzAIfFX0zpheBuW2DGMqMPuMgC7+R5COzTV4rmztTN3sDPpi2+GeF9ImIU/GihC8EWGDVxX1yHinZ95G0h+HPnhSviHn239Jga70UsDwtGiLpav6PV3zcCRSQzOEDUz0jfwFsYGXDKsPTcjdiibhPsPM00jxXb+nJoAH3/gYE2fy9GDKlk3CXc5S8KhbZJvMYq3tDek9MWug3TE5YIWtAiFW5XMzZB01BM0VZ6HIYvLmvG31HxeiXbMo2sJBS8meTVVF1D7qEmu8FxR9ELF8biHBtMiSXRNW+RIc659K+JEqlbJOeBjeHoTX7UEnHsJ8G9LItCG7aaoCPVh2ID75o3CGZQfG6pA0l/Lb+SSizTAPwGai+6geJ4BV5afxfgcZLewi1CQdsxR87bzkklKCLlPyEIEiuMTuoIVlt4h3OA24cb2CxY/YSKZ91hBnwhBmVoWMyygj8iLqhx990V2H0HQmGcjwkErQbk4K7hUcVWdOgdYoYdbE3bAUAuCdHj4qmji+d3QZMLLTLNAW3z0RmcYA0Pc1RWXj+wh8dDod7La2J4e7zFVA1jklg3rhQHyUIL12qAv09aaLQCdiLIqyFAHgavI8WumcPOUc0Pgu10H9PuTFgbDzyC5k2/1TIq3SRbW4YUmrSh6VpKc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(4326008)(5660300002)(36756003)(6916009)(83380400001)(31686004)(508600001)(66946007)(38100700002)(7416002)(186003)(66476007)(66556008)(8676002)(86362001)(31696002)(6512007)(6506007)(53546011)(2906002)(6486002)(2616005)(26005)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUFtT2FLdk94QmRQZVRzU1NLNExkYWkrQ0hmTUFBc29hSzhsTWxXU1JLcGZ4?=
 =?utf-8?B?eXRwRDRMdVlEa3l5SVdiczJnODdKSHlndC85L0U5ekxtYXdDYUthTjZPUDcy?=
 =?utf-8?B?UlJrTDdVU0Z1Y1QwUVlCMEtCQmhuUjk2TDhiNTd2b3JHM2VWYmlaREFiOFNR?=
 =?utf-8?B?RkJleGpUbWU1c2QzNktpbnJPOGczWklYZ3RFNzIwazI2TkFWQTRKcS80V3NQ?=
 =?utf-8?B?dDlPa2QrVStrZnVzaG5LdFVYUXo2SU1NWlFnZE5NQ1dnOXJXRmJjZU4xYkRK?=
 =?utf-8?B?MERubHc1OEVyMTdRa2IrYk1IdkVKaHFZUDFGV0hEK2J2T3JlTkhodXQrYmlh?=
 =?utf-8?B?cW5tajZubFFYeHNHdTYxNmtGblA0aXpmRGZyelk0VmhwRmU0WVBUM2hQTUJI?=
 =?utf-8?B?TTFZT040SFFQd2dKZWdWK09odVZqajlXMEc1b1RHYllLK2pkZTRlTEx4TGUy?=
 =?utf-8?B?Nnh5b2JvVlA0Wllza0FwNkI0ait1WUI1Uzd1RWt2RGFvb0hITFArWkE0a0Zr?=
 =?utf-8?B?bWZvZzFJT3hsQzdtaGUwUjNHUkJTWTlkbzBTeEZiUjVtVFF3Q1BxdG9KdnMy?=
 =?utf-8?B?Q3czMGtpVGhWL0t4K1B4UHlrcHFoNGFpMlRHelJKdlNvVjBwaUwzTDgzcGp3?=
 =?utf-8?B?czNTVlVTRURXb0pPU1dPVndMdUhWVThMU2JoUTVlTS9wbURsSGhsRVAzMGtk?=
 =?utf-8?B?ZFpkMXNybjVGbUFodW8vdUcwbStNQXQ4WWJKK0JaVVcvaWdNa01sYTNUc2FF?=
 =?utf-8?B?QUU5alg3ZHQ3Ym5CS09ibTVWS1ZhNjZIOFlIbGtVSitOYlRtSmNleVlIVmhM?=
 =?utf-8?B?SGYxWnRyUlkwNGgrQWErN3hKbE40eGtEb1RuS1FIYmd0ckRyME5lUmVCN3FK?=
 =?utf-8?B?Y1BLNklTVnJ2TVZ2U2VDY3pEemp4aUdjdFJhc2x4VUtjU1hCUm1FMjdvTkx0?=
 =?utf-8?B?Z20wU29GSHNWUGJnaUhkUjFxT3E0cmhvRHdER2ViOWYxT0M5VnllUE5NSU9B?=
 =?utf-8?B?VXBwazZDeSthSFRES1JpNnhEck9QNWduU0JkTlhPcHRCbjUxdjRlbTVYZUl3?=
 =?utf-8?B?MytGWXgvQ1B4UWFKMDRCcUhpVVNlcjkxTldUdlhEaFdHZlFRVzROdWRFQ2Nu?=
 =?utf-8?B?M1BzREhYeTA4ZmdMNVE2dVUxOENES0lkend0ZGJQbExwTWphVmN1RDZOello?=
 =?utf-8?B?bVY3OXFmTW5KSVd5aTVFOWw2QmUvRVVjNHFVVHNaZ0hRN21BUXFydzFWcks5?=
 =?utf-8?B?Z3RyODdWTzR6aUJmTjBLSmdFZ2hBVjVYdlhZZnVsU0FkaXF4aGZ5WEdFRmY0?=
 =?utf-8?B?VmxZbkV5aDVVRFNOMEpzNCtZWGJCVlBhU3BFT0lRajFIRkI1NzNVQThOQjdo?=
 =?utf-8?B?dmczdlRxWkhvRExZNytWZ0FrSTJoSFFHSGpkUTlqdGk4NC81U0w5bFQ3WWRq?=
 =?utf-8?B?VUwxdFVuaFc1MXo5ODlZVFVIMFdiLzBBTDhWNWxSUkF2WWNnWm1DbVpCVnJx?=
 =?utf-8?B?Y3lmSGdCdWxJbU1yaXI0dlJ4dVFQOE9yRUhsOVByRkl1aSszUXg0Szk1VUQ1?=
 =?utf-8?B?VGMxK1JDeFkwTE1tekxHUzZRSG9pZUZXc3hxM1o0Yy9mc25CL3ZleFc1OVcy?=
 =?utf-8?B?c2ZLa1ZuSWFsMGVid3dTSmlPb3QxR1BFNkNLbzJXdnFIbFBMTkczTzBML3Rj?=
 =?utf-8?B?V0piS1FJcDVGZ1F2bC9xTmNJWlFCMW5jWHc1bTlxMmhpSkp5UG9TaENKOHlS?=
 =?utf-8?B?NVlxQTlXNlBZNnoyU2xCQkY4Q085TkRWd0p4K3RDaEh6eDlIa295VWpRakNv?=
 =?utf-8?B?QWJpdy9NMTAxMzZXVldiZGNod1Y3Sy94UitLMFR5WVhBWTFGVmVMdS9EUXI4?=
 =?utf-8?B?WFVsa3dmSUZEbWlnQWx5R2VSMnROTktKbTNsY3VMV1BncVVkZHVRb25pYllO?=
 =?utf-8?B?aFB4U3JscFg1MGErNnRad2xlc2cvVExqOXMzRVhOOGprVVJtZ0xTN2RlU1Aw?=
 =?utf-8?B?UndYUUdZaCticC9EL1dhVkR6UVZ3WjR0QmZ5OCs4Vmh2WUY3Znhkd3J6ZklE?=
 =?utf-8?B?dUphY0NOSXRocExVNWUxQjJ3K1lOUnEwNkt6cEhWVjNqWk00NGltT1RhR2xR?=
 =?utf-8?B?K1lMQlRXMS8xajFxZk9yVTB0WHpxUTF0YUdnZDlmZFdsRHBqUzd1bDZUcjRP?=
 =?utf-8?Q?E5ifeDOQSN05CU7ZI0Jclmc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7168e303-af33-4bf0-7492-08d9e7ea3c1e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 14:25:46.7721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NctcU29Gz05xPQZQjUGNWJazIq7QPdXFLB8t5WdurdSH3OowamBl+3W4Z08AfeNvrs7AIYnCl6JQl1d5POF3sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7334

On 04.02.2022 07:34, Oleksandr Andrushchenko wrote:
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -454,6 +454,22 @@ static void cmd_write(const struct pci_dev *pdev, unsigned int reg,
>          pci_conf_write16(pdev->sbdf, reg, cmd);
>  }
>  
> +static void guest_cmd_write(const struct pci_dev *pdev, unsigned int reg,
> +                            uint32_t cmd, void *data)
> +{
> +    /* TODO: Add proper emulation for all bits of the command register. */
> +
> +#ifdef CONFIG_HAS_PCI_MSI
> +    if ( pdev->vpci->msi->enabled || pdev->vpci->msix->enabled )
> +    {
> +        /* Guest wants to enable INTx. It can't be enabled if MSI/MSI-X enabled. */
> +        cmd |= PCI_COMMAND_INTX_DISABLE;
> +    }
> +#endif
> +
> +    cmd_write(pdev, reg, cmd, data);
> +}

It's not really clear to me whether the TODO warrants this being a
separate function. Personally I'd find it preferable if the logic
was folded into cmd_write().

With this and ...

> --- a/xen/drivers/vpci/msi.c
> +++ b/xen/drivers/vpci/msi.c
> @@ -70,6 +70,10 @@ static void control_write(const struct pci_dev *pdev, unsigned int reg,
>  
>          if ( vpci_msi_arch_enable(msi, pdev, vectors) )
>              return;
> +
> +        /* Make sure guest doesn't enable INTx while enabling MSI. */
> +        if ( !is_hardware_domain(pdev->domain) )
> +            pci_intx(pdev, false);
>      }
>      else
>          vpci_msi_arch_disable(msi, pdev);
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -92,6 +92,10 @@ static void control_write(const struct pci_dev *pdev, unsigned int reg,
>          for ( i = 0; i < msix->max_entries; i++ )
>              if ( !msix->entries[i].masked && msix->entries[i].updated )
>                  update_entry(&msix->entries[i], pdev, i);
> +
> +        /* Make sure guest doesn't enable INTx while enabling MSI-X. */
> +        if ( !is_hardware_domain(pdev->domain) )
> +            pci_intx(pdev, false);
>      }
>      else if ( !new_enabled && msix->enabled )
>      {

... this done (as requested) behind the back of the guest, what's the
idea wrt the guest reading the command register? That continues to be
wired to vpci_hw_read16() (and hence accesses the underlying hardware
value irrespective of what patch 4 did).

Jan


