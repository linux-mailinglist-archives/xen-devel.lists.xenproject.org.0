Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5207359730C
	for <lists+xen-devel@lfdr.de>; Wed, 17 Aug 2022 17:38:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389090.625907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOL74-0003Lz-1T; Wed, 17 Aug 2022 15:37:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389090.625907; Wed, 17 Aug 2022 15:37:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOL73-0003JE-UP; Wed, 17 Aug 2022 15:37:45 +0000
Received: by outflank-mailman (input) for mailman id 389090;
 Wed, 17 Aug 2022 15:37:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U7n3=YV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oOL72-0003J8-Ns
 for xen-devel@lists.xenproject.org; Wed, 17 Aug 2022 15:37:44 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2083.outbound.protection.outlook.com [40.107.21.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88ca104b-1e42-11ed-bd2e-47488cf2e6aa;
 Wed, 17 Aug 2022 17:37:43 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8900.eurprd04.prod.outlook.com (2603:10a6:20b:42f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Wed, 17 Aug
 2022 15:37:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Wed, 17 Aug 2022
 15:37:40 +0000
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
X-Inumbo-ID: 88ca104b-1e42-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iuURnG/WXMR4Y1GeO5/zMJwvMp9ZSYyMOMt8xQ91K2yheYNAl6xEV1JNouOi7t6mY3pCwz7CQUjO6dtc4YcpwUBdzamGbl3kJONoUdWuoeDQ+tjb1lHsSfFR0ZVKU79pH+IZO99CIHJohP8PQQ5ZzdKmoRp0SQ0sd8iCRaeGDy/UyHd1fAKZ212e0mI3u10kmaqAeGnRzOTzMGyM1Q3xVgGvB0ipdEITGPLM98Wy+ADeVC3TGffIBE/mptGHYjq4LAI9K9S/rUj+ATbWDD2Fro3B9UYHR6brR+xrreXGeVLdlLt75ZERlVkL6cHfOnv7jVkCCzzB+wKJaV8ofZQtqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=23uEh3Zz6pfkXbtioeShMTXgXhAMaur2LlFu/2JFUec=;
 b=eIeLPez+BDHEwb8NFHUnLdeh9ryalVpOGmSj7J6zkobOOFoRM6OvRiQkTStwdzRZYlT42tRV5m0QBIQRDbHhvciC7A64h0CRSTubzr0YHOVN2ssIN2Vqa+QYQJ0WAKnC7wCWCbxLmrOqyTdruIUBvSJV9h0rhxgxeXR2msNJEpSq7J28VKc4dMMpGGnQH+4hbM4Dy3axyp56ANsiBrsR0H+jAuXcBVRGhBDwOtW6PLsB8AFHGYIL87eGvkvDeqiHewlbAUzyO8R5nqG08njOZsHnB0ZpKXSNpst6JPBXf7OD59EMqlQCTG51d51EcS0Q98p5sFo4s2Ww4UunpURFdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=23uEh3Zz6pfkXbtioeShMTXgXhAMaur2LlFu/2JFUec=;
 b=uz/oAkWDRxJVGOksUzS4A09uA3zvFPJ473B1WvT1UNeS24laqWIxtFCHqu+ZX9kdVH7RlAHbV1QI6a6jMMwz3Chiu9TYcCOSN3TXdY4cc9jXZdxjBI89ECNtjqPqN4kNBRCj2BKbxq8Tt3xlgSIzgCw644G6m1DoeuwXmhIACwSH936pwedTUK+m9ERFkiFuGo+8YVnPlyypGfl4X1k3Y5HKecVxsDgmLZGZlybjwYUI46eqyf2PFCsXQ2rZchZK1JgECy0BW+bd/0E0c85NjUSd+4kl6WsZeuWSg1p1zdOLzoRwBNe7Pr3FuP5h79nglETscnzv3hnHmaBDG0oerQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <52808f64-ed7f-27d5-8da2-979091d10c68@suse.com>
Date: Wed, 17 Aug 2022 17:37:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 11/11] drivers/char: allow driving the rest of XHCI by
 a domain while Xen uses DbC
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.05bda81c2f5ff91948f96e397b6836bcede71ef8.1660354597.git-series.marmarek@invisiblethingslab.com>
 <403daba6911a3d40e4774b46ba555f6d76b3c249.1660354597.git-series.marmarek@invisiblethingslab.com>
 <141cb0d0-3563-1376-a6b0-a977142c1873@suse.com> <Yv0I9L/a+xR199r1@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yv0I9L/a+xR199r1@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0159.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a21bab76-5964-414c-f3d2-08da80666baf
X-MS-TrafficTypeDiagnostic: AS8PR04MB8900:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cBTXjvmGM73sq/soBhb2dUuMB+Jo1DNMgUdKhLqoQ9NFyHHURDr0NCIEbcqWciVEqzjsWao0mbrsEyyM6VBIydlxYr9C4bvyvm+VS21UXVYIb90Z8z84LY8Pz99PUet3fPDW57bzSZJ8PAlAMje1Y8MwabVMIc9CCo9uHJgoK4ZAvWvsmu7Q+5opWtapT8RPonExckfpSik7PgRhMcPIBCJbcsSTXxixmEB2svqvSIcarnxjA+sB4c3w8Ec08pdvHMIcdWWkPFeOQat94Dzj0r/sVZGyLfqu8NQmOGd/0pmloi/oOLl3xSJ27ED/+mVZIHGuIVqiY+vBVMyr6fXPaQM4XzODJ4Tj55HYkvb6/WLrnSEaRfBzMGdqIK6QMsb4RL8/Whe7eIGTawzGSNRhmqXDtAT4O0qtRqse88L/O3sNGO6DCulW3Rl5L2saShAIUYwo4Mw2IDpUqpA+ssWxK12swlD3kt5/0bk97+tz7P7/Ege4Y2cJGz80Tn6crxr4i/84RlLjkRvwsE1QvW8kDyIbiY2jotH09qj748SbE1iIi7FtFmk2T0VrrY5QZKDMwD0E0t92GPY4hMYDoHuViY5GQiMP1CZIsrjGmYgeTSl1F58qQpDVi71VZtqJ6lmEhdI2crJPFWF1ndqdrSwqsA0jQhnL7zFMXw+NAkYGr+XhZ12A912ND1SbquhfbAD5xCp4ZmUmY6N5CWkj4A+AX+UKSCfsKWuuGZhzTQ0zdOQ8kQgiBeH+hVb5uzYi2Epjf3o4VDPS9Jr10xLGJt5GJG+OYKn+f2dFA8WPZx+Fni0xAFXWR+wjlZS/sxeKETnm6YufBmD37RUSQVm2v2UK0Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(396003)(376002)(39860400002)(366004)(6916009)(316002)(4326008)(54906003)(478600001)(41300700001)(66476007)(8936002)(6486002)(66556008)(5660300002)(8676002)(66946007)(38100700002)(36756003)(6506007)(31686004)(2906002)(86362001)(31696002)(186003)(6512007)(2616005)(53546011)(83380400001)(26005)(66574015)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDAvNkR2ank0SjFTVkVrU1FhZDJOZkdwQjBCMy9pWDR1MVBrWDIyTUJrajZy?=
 =?utf-8?B?elFkUGtyMUNqNlVMWEZxdUxDOHdUU0NCK0o2RXlCZGpMdXlMcERKTzM0eFZW?=
 =?utf-8?B?N09GWlo4cHJtTTlIMkg3U2dyMXQ0M2tzNlFZMkFKVktDR2dnK1RNZno3eTE4?=
 =?utf-8?B?WldaM012S0tsUThnR2NWa2JhbUJvODQ5TEZLYm1LRThmMUlMT2R3VGk0dE1U?=
 =?utf-8?B?T1A1ZzMvSFhSaEs4RHhFS1ZpeTFIVTVlTFM5dCtvdTdEWmNmZmJLYjN5SUpU?=
 =?utf-8?B?b2dHcTU4Y3V3T0ZRVSt0MFlabFpGS3hnRGYxTk5RSVVTWkNYSHpINHpmK3U5?=
 =?utf-8?B?TytUYUpqcWtsQjliaFJuNW03TUJWK1lqZHpsWWR3UThmdDc5TklmUHh4RzRi?=
 =?utf-8?B?WVJkcmNCVitwQmV0SDUvWGVxWWRDU21GekxRZU1NUHZFK2h1ajlseXFIcm9M?=
 =?utf-8?B?V0xJUUpBQTNILy9iVHdJaVNqQldBWkZZejlFV0cxVzFyUThuS2cxSzI1SGtD?=
 =?utf-8?B?RFNybDBIOVJEeUliN1pmTERjY3lqM0V4d1U4OW5iMllOU0pDU1lZUDY2S2hr?=
 =?utf-8?B?bndnV09jVmlrZ0dsRjNLaXRWRjJ4Nmt2dXFFRUgzdlJTWDNRUC9SQ1Jka2R1?=
 =?utf-8?B?YndHbjZWampiMGVUZi9GdGZGaGlCanZPWE1OTzBNeFlrRWg0Nm4yd2FDeFVX?=
 =?utf-8?B?YUJPR0NNNzdnQUYyUFo3ZmZSdGNreTZUNC9yYXdjcDdDUnhUWVhDT3ZxNWlR?=
 =?utf-8?B?RS9HZE5hVDdXbW1BZVVZbXFHN0RCcjFXSkJRV01UN1VncTBzTzRjVkFFTHhq?=
 =?utf-8?B?bTExc0M4QWtlVWwwMWRtemh2NXBMSEhSaWJESmVZMmVRS0hSVkgwdnBXL1k3?=
 =?utf-8?B?L3hZN2xxbXZ4eTdhNHMyMXdDWTZrTUJIeTNnZnlBdWRDb1NlMS9udE9vUjg2?=
 =?utf-8?B?QWNyUThBR2IxcEl3MUdrT1VXOUozVDM2Ty96TWt5TnBLWjk1Nk5Rd1ltbjk2?=
 =?utf-8?B?bjNkMEJEa1lQSHB6WVJzTVlnTXltQVQ1ZFNtRUdwdHJrL3BzMGZOVTFKZVla?=
 =?utf-8?B?NVlkdzN2RS9UaVFiYmtrYW8zeWxRSHZmN2o4TG8rUHU0WlQvYmNqV09aZ1RS?=
 =?utf-8?B?MEN3WDZtVDRWVmExM2FXTE50ZW5LWlZRNHU5VlVnUEFDRWVvb3I2Q01pS0Y5?=
 =?utf-8?B?QjQ4ZlJDOHEyUFhRV2NmZndLL3FBR0JxekNybVBVWUU2ZGYyaVBMREd2bU5v?=
 =?utf-8?B?Z0xNM2xxdmZ1L1BqeklqK2NJTE4zSS9SakVaV0puaWhNbnRUdU5VbWJkWnJq?=
 =?utf-8?B?SGFEQXBLSzRNU29oRjRDWitBTUhIR0N2cEJ6eWdpZkpMV1hmeDV2cU1CdWFi?=
 =?utf-8?B?Y1lSbVBRWVFGWGV1dmRCeS9aNjZ2ekwwZDZodldsbkhGaG9yNlkrUFRjQUJy?=
 =?utf-8?B?RWlyVnVoSExDVzJOM2o2Z1o4M1FobVRaM3FZUTIweUpOZERLbmVzRFhQOTNz?=
 =?utf-8?B?K2ZnVVVPWC95amNBT2hvYW9CRXg1ckN4d3d3RUYrUllSR3JKYnFXYXh3UmhY?=
 =?utf-8?B?bHphbGVidzBBcG1WK3VKVHVEbnoxVHBhQnhHc3RQVThCTGFqc2pEakpveHRO?=
 =?utf-8?B?cEdCdlQxZE5hcVh4TEZKenp1clhzdUNqYWJRSXBZcWhWNENzOTVMc0FkdXc5?=
 =?utf-8?B?UDVEYUVlSFBaVGtoaElYbXFWTzlXbkEvN0dsaW9Fa2xRUkxRanVMTzdXSEwy?=
 =?utf-8?B?c1Nwa0JvZGZ1MXZUdTUwNFR3QVNzak5RUDJjMFhDeDBqbEZmbCt2RENVR2Uz?=
 =?utf-8?B?Z0ZrelJjUTdrM2ZZWTNnLzJ0eUV5Ulk2QVZDUFFYcCt3U2Npb3cxaWJ4dHh5?=
 =?utf-8?B?bjhGWjY0N0pTQisyQU1MditFTVpIaFM1dFcrM2xONDR5R1dMaDVkWWo2YWt3?=
 =?utf-8?B?eUpwS3NrTnp6TThtQUhLekg2aGdqOVFHS2pPN3RoLzJ2QjFlKzB5YkdEUXdl?=
 =?utf-8?B?RFFncXBrZU1tSm03UFpId3VKTjhvb1lVcHM0cWE1T0VpcjBraFpiaHYyQzhE?=
 =?utf-8?B?eE1EOVMwc2NmdFg0TzFYNEt0SW4vN3pUa1NwdGNBWlljM0dKTnRtMWVHMGR4?=
 =?utf-8?Q?I6pFfFiikUSxKwlpvNR3K/qTu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a21bab76-5964-414c-f3d2-08da80666baf
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 15:37:40.8840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KWgHNPK1zdEQTp9+2rH5TBDywP6cSuS2824vyAKsyraq8MVgd9XkrkcN90DFbx6OHeZ4heiM0agowcwxo8i6lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8900

On 17.08.2022 17:27, Marek Marczykowski-Górecki wrote:
> On Wed, Aug 17, 2022 at 05:08:35PM +0200, Jan Beulich wrote:
>> On 13.08.2022 03:39, Marek Marczykowski-Górecki wrote:
>>> --- a/xen/drivers/char/xhci-dbc.c
>>> +++ b/xen/drivers/char/xhci-dbc.c
>>> @@ -23,6 +23,7 @@
>>>  #include <xen/iommu.h>
>>>  #include <xen/mm.h>
>>>  #include <xen/param.h>
>>> +#include <xen/rangeset.h>
>>>  #include <xen/serial.h>
>>>  #include <xen/timer.h>
>>>  #include <xen/types.h>
>>> @@ -232,6 +233,14 @@ struct dbc_work_ring {
>>>      uint64_t dma;
>>>  };
>>>  
>>> +enum xhci_share {
>>> +    XHCI_SHARE_NONE = 0,
>>> +#ifdef CONFIG_XHCI_SHARE
>>> +    XHCI_SHARE_HWDOM,
>>> +    XHCI_SHARE_ANY
>>> +#endif
>>> +};
>>
>> Hmm, this suggests that Dom0 cannot use the controller without the Kconfig
>> enabled, which I hope is not the case. 
> 
> It is the case, because you requested reset quirk to be behind
> "experimental" tag in kconfig. This quirk is (currently) necessary even
> if just dom0 uses the controller.
> I'm happy to include the quirk by default, but I got impression you
> wouldn't accept it. And I'd rather avoid marking the whole driver as
> "experimental" (which hides it unless you select UNSUPPORTED) just
> because of a small code necessary to share it with dom0.

Hmm, well, I'm not happy about that quirk (and I did point out how it's
done for EHCI), but I agree we don't want to "hide" the entire drivers,
and I continue to think Dom0 should, by default, be able to use the
device (to the extent possible). So I guess I have no choice but to
accept the use of this quirk by default.

>>> @@ -1128,10 +1181,34 @@ static void __init cf_check dbc_uart_init_postirq(struct serial_port *port)
>>>      init_timer(&uart->timer, dbc_uart_poll, port, 0);
>>>      set_timer(&uart->timer, NOW() + MILLISECS(1));
>>>  
>>> -    if ( pci_ro_device(0, uart->dbc.sbdf.bus, uart->dbc.sbdf.devfn) )
>>> -        printk(XENLOG_WARNING
>>> -               "Failed to mark read-only %pp used for XHCI console\n",
>>> -               &uart->dbc.sbdf);
>>> +    switch ( uart->dbc.share )
>>> +    {
>>> +    case XHCI_SHARE_NONE:
>>> +        if ( pci_ro_device(0, uart->dbc.sbdf.bus, uart->dbc.sbdf.devfn) )
>>> +            printk(XENLOG_WARNING
>>> +                   "Failed to mark read-only %pp used for XHCI console\n",
>>> +                   &uart->dbc.sbdf);
>>> +        break;
>>> +#ifdef CONFIG_XHCI_SHARE
>>> +    case XHCI_SHARE_HWDOM:
>>> +        if ( pci_hide_device(0, uart->dbc.sbdf.bus, uart->dbc.sbdf.devfn) )
>>> +            printk(XENLOG_WARNING
>>> +                   "Failed to hide %pp used for XHCI console\n",
>>> +                   &uart->dbc.sbdf);
>>> +        break;
>>> +    case XHCI_SHARE_ANY:
>>> +        /* Do not hide. */
>>> +        break;
>>> +#endif
>>> +    }
>>> +#ifdef CONFIG_X86
>>> +    if ( rangeset_add_range(mmio_ro_ranges,
>>> +                PFN_DOWN(uart->dbc.xhc_mmio_phys + uart->dbc.xhc_dbc_offset),
>>> +                PFN_UP(uart->dbc.xhc_mmio_phys + uart->dbc.xhc_dbc_offset +
>>> +                       sizeof(*uart->dbc.dbc_reg)) - 1) )
>>> +        printk(XENLOG_INFO
>>> +               "Error while adding MMIO range of device to mmio_ro_ranges\n");
>>> +#endif
>>
>> I did comment on this last part before. There very minimum that I'd expect
>> to appear here is a comment as to the issue with other elements living on
>> the same page which a domain's driver may actually find a need to write to.
>> As said before - as soon as such a report would surface, we'd likely need
>> to add write emulation support for the leading/traling parts of the page(s)
>> that Xen doesn't use itself.
> 
> I did included paragraph in the commit message:
> | In any case, to avoid Linux messing with the DbC, mark this MMIO area as
> | read-only. This might cause issues for Linux's driver (if it tries to
> | write something on the same page - like anoter xcap), but makes Xen's
> | use safe. In practice, as of Linux 5.18, it seems to work without
> | issues.
> 
> Do you want this as a code comment too?

A shorter form thereof perhaps, but yes, absolutely. Getting at that
information shouldn't require locating the commit.

>>> @@ -1228,6 +1310,41 @@ void __init xhci_dbc_uart_init(void)
>>>  
>>>          dbc->sbdf = PCI_SBDF(0, bus, slot, func);
>>>      }
>>> +    opt = e;
>>> +
>>> +#ifdef CONFIG_XHCI_SHARE
>>> +    /* other options */
>>> +    while ( *opt == ',' )
>>> +    {
>>> +        opt++;
>>> +        e = strchr(opt, ',');
>>> +        if ( !e )
>>> +            e = strchr(opt, '\0');
>>> +
>>> +        if ( !strncmp(opt, "share=", 6) )
>>> +        {
>>> +            int val = parse_bool(opt + 6, e);
>>> +            if ( val == -1 && !cmdline_strcmp(opt + 6, "hwdom") )
>>
>> Nit: Blank line please between declaration(s) and statement(s).
>>
>> Any reason you're using parse_bool() and not parse_boolean() here?
>> That would save you the open-coded strncmp() afaict.
> 
> I can probably use parse_boolean() too, but then handling "hwdom"
> variant would be a bit weird. I could skip 'share=hwdom' parsing at all,
> since that's default if the kconfig option is enabled, but I'm not sure
> if that's a good idea.

May I suggest that you take a look at xen/arch/x86/spec-ctrl.c's uses
of parse_boolean()? Maybe you consider some of those "weird" as well,
but it's not like these have been around forever and are now deemed
"bad".

>> Finally a remark seeing the opt_dbgp use here and the identically
>> named option in ehci-dbgp.c, taken together with your multiple-
>> serial-consoles patch: Since the two option consumers are now
>> different, they can't sensibly coexist anymore. There were issues
>> already before - it doesn't seem to be possible this way to run
>> EHCI and XHCI based consoles in parallel. (An exceptional case
>> would be if <integer> for both was intended to be same number.)
>> IOW I think one of the options needs renaming; it was a mistake of
>> mine to not have pointed this out before committing patch 1.
>> Following the name of the source file as well as e.g. the title
>> here - maybe "dbc="?
> 
> Yes, I can rename the option here. That requires also registering new
> SERHND_* and inventing new value for console= parameter (implemented in
> serial_parse_handle()). "dbc" there too?

Probably best to be halfway consistent with the naming, yes.

Jan

