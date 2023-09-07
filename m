Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E8A797311
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 16:29:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597441.931676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeG0A-0007H8-8F; Thu, 07 Sep 2023 14:28:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597441.931676; Thu, 07 Sep 2023 14:28:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeG0A-0007Dl-5O; Thu, 07 Sep 2023 14:28:58 +0000
Received: by outflank-mailman (input) for mailman id 597441;
 Thu, 07 Sep 2023 14:28:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+6JM=EX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qeG08-0007Df-7z
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 14:28:56 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2079.outbound.protection.outlook.com [40.107.13.79])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df044cbf-4d8a-11ee-9b0d-b553b5be7939;
 Thu, 07 Sep 2023 16:28:54 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8981.eurprd04.prod.outlook.com (2603:10a6:10:2e0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 7 Sep
 2023 14:28:24 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 14:28:24 +0000
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
X-Inumbo-ID: df044cbf-4d8a-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=md5xo0ePuzsX2JAQh+N5hA+MpTxStftUfJbwdYJs5+NhpvFvNlEgTz0MMjKfWi7gfdzuNym3u8pm3r4TBtHLUAAPr8AehvU3Y2TEs5VM80vRv0JMTyiq1h1Biw0nclwxElCk6jVWfx7RVtigqNkWTdi7QUVrZ1hdMM1KKfvdeu75mr6g9GAXt4Mjdv3iM7yHtDvAmYnmJTrVDuGVvWg+Uh9Wc6po2QySmNTeDnPNtlf/e04mwjLf7cgUedwn/iOfXIjTxt+L2lhr6IZG8YRHd83NuBXQtrkpF4NNpDCn+ZyJKaPlkBzryWGngRvDeu8c3c3ZUaa26l4RSyXFMvseRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TiCBhD+IhfAN28vO1QAQM86F+nxEnVn+3e3jFJX+R4s=;
 b=bmqYt2ja/p3gQ16U4fCyVz9zQ2zX/UZDdnohPNOGYQID/VzuXBrllCoiHGNwJmPBpFRlkgug2WfmDYXHHWyxMQnS7+soMQUuzvYSngSwX4hf216X2t040KOp0/MJpkzSf+whUQJEGSwDz0vNNkrP4rJCk8jcbtNZ9u4wg+oa4HXavOribzldVt6v9WpkZS048NRn2Lq2yjwcAXXwjgO+vhI2zzFDvegc7Wx9f3vqmIf2F/fxp4dE+BBy2HBiZIBumia1OGC6TF8KDmxMCeKkcaeOwu2XQTJL8mKjW8jNWwtZvEJwG5lH4x+cNTk36FjN3TbO1R3diqyBwpq3YIHKRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TiCBhD+IhfAN28vO1QAQM86F+nxEnVn+3e3jFJX+R4s=;
 b=eY0qYn5jqXMQZ8VUOFcaZN4zmd0VUh/KpX8ifgYrZvKbVlXPbBeyWRRUiOijeHB0ErmMr85Xg17LihIdJJbHA6gWYLGqO3AlZsdZhkI8srOauIEZxIrqcxdHze9OU9mJ7XLDcNCRC1d4jGXl87lbrjJWzMsJLGjQPv5uEehivQqK1Cmuo2i7RVbJTY5Mzw+TOmvREA/ebf8tINxmPYk248MkBLoWYGxVxKUZQPu6jUDlvdY8+vM33Ht0PKh/tJ/hz3Zts9wTBwpjPBMNSIr0K7R/B3ngVOcp6e5R/pNjvQsPGgr5d/HLjPDTgVMsO/dPZrjHDCvaaFG//PzN0LPv6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a198d472-4b1d-1da5-e336-232af98b87aa@suse.com>
Date: Thu, 7 Sep 2023 16:28:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 2/2] xen/x86: ioapic: Bail out from timer_irq_works() as
 soon as possible
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230818134441.45586-1-julien@xen.org>
 <20230818134441.45586-3-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230818134441.45586-3-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8981:EE_
X-MS-Office365-Filtering-Correlation-Id: 085592ec-6b4d-4d4f-7644-08dbafaeb1b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UK8WbvGngJJPu57uquy9b+9A/oXFQkYxp9J84eZyUSwy0o336jY4Exol9FMYmqO+PkO0KMCDDEI1yngd3DI6DLcEPXxwjLr2izhW6fnAtXvlXSgpON+CX8LcyDGQq4XghTBKZQzE0mH4LvV+k6nI7eaSuklj9yzDUe2haajASA94i1D+uTJUBHUqZdgUp5lDaPPuduAsIUuPl11gunIy1b84lc2f+A0L7WOBXoiuaFkH7tbqxV5G8Ov+lErZiTmGQ8DiJDMDFX3haagGUuAizo3eE+81NK1J/1LxgXqlkuYVfqmxEnN0/yihEeXTHzfOSxzRdSpkl+dCwxN7PjZgnooqRR28qPZR0973sccYDvTmqSxFwOURRJ87CWYs+8ZuuH8oRx44mA+QjklZjD/31TsVoMzhZQGGQ2YR35J7oD9Fo19KntIfmDmZHK70pyb5u8xe6ecvY3ao9lda0ErjwIV/jF0nN/SpqsPDC//2Kg7YczHn0jthzYltoKhpU+70z8o49oaqPumGGPWk+XbwoUNbnLdvH5cF4H0biICTqkGHWiqSQFruMm0r+xCoHYrHl4nG8rMFC79/PCgFDiv9KnqkERwsGbCObLeu4RFX0dPxDY6iUekJOqsi/3IJAtw3H0ZPd5mwgixbojzx3ZlehQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(39860400002)(376002)(366004)(451199024)(186009)(1800799009)(31686004)(6666004)(53546011)(6486002)(6506007)(38100700002)(86362001)(31696002)(36756003)(2616005)(26005)(6512007)(83380400001)(478600001)(4326008)(8936002)(8676002)(5660300002)(66556008)(66946007)(54906003)(2906002)(6916009)(316002)(66476007)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXJpeitjYzRwYy83dUx5dEZRQUQ4bnpYMk1ndXdJZjZlMFhUVTliSTNrdGNU?=
 =?utf-8?B?ZnNlRG1LQ1pQZ2dXR0xFRThUbzlnTmpTcWdHeUg1aU9hMnVqcU1aUWMzcDZR?=
 =?utf-8?B?NzFTR0llcFl6MXR0bnozZFV2QUZhL1NHbVorS2lHWWYyK1YvWE1qS1VwUmYw?=
 =?utf-8?B?Mkp0OHgrMXE0TXVMZG9PVStneTRKaDhlN2Z4VjNPNHN5NDcxc2VINURNdS9o?=
 =?utf-8?B?TlpGNytiekpzVmFEckN4S2c5OEYwZnNoZ3RiNHZyK25pZ0FORlh1L3VXS0Np?=
 =?utf-8?B?cFIyNVRBZmRPd1pNbzdXTHFuMUdXN0Vya0NVVk9VeEV1alJ4TXU1aTllaWEv?=
 =?utf-8?B?cThPTWlmd2tUcng1MjlaZTZTb2t1WnVTVk1Pa01jSHpwU283b0pROXcrK2c4?=
 =?utf-8?B?Y2RWZHhHMnVqbW1EbTNybDZWbXM5N3ZvRUo0REJCV28vWTR0ZTJ3NFlBZGJp?=
 =?utf-8?B?N2pIa1dqdlRYbk5aem9HcnRrdTRtYUVLVVRXK0xpQ0pzQndGelZMNXhmZEF6?=
 =?utf-8?B?Ykc1YlQ2U1VsaHFEdFpUTUkxNjY4ZjRtYUc2cC9XMy9HeS9RREZZQkpYa3cv?=
 =?utf-8?B?VzBMekZLd1RmT1ZreHJ1VkF5akVPZ2hGR2dPWnJBUlovQTMramJRb041ZmFY?=
 =?utf-8?B?bHNRRzhyb3lYbzRlNWJsSDZkMEdoUXAzZmtiaTJITGZOamNINE1BYkMvU3NG?=
 =?utf-8?B?bTYzRVFVZ1hhTlBUQnJ1dzlFUWw5aVVxdWVraFZvZUxaOTRjY3NNYXBxSUM4?=
 =?utf-8?B?bzY5RXpiU1ZxalRpY0pqSndydTIvSlhHUkdMbVluU2o2WnRxOUhNWllNT1Fh?=
 =?utf-8?B?ZWVxUnRUck1mYjhZR2dEaTBSazRSZDcwRFhlQ1ZLTlZrZFF6TmZXYXBiMmNk?=
 =?utf-8?B?ZVE4VG1RL2tidzZUZVE0cWFwOERNUy9PZk8rbnU0NTNZQTJMb09DZXFyTFNJ?=
 =?utf-8?B?bHp0UXNzbXE2NWZCN3ZsU3VzKy9pN2ZaeGZtVzByV01LekVXcWp3aDh3V09N?=
 =?utf-8?B?ckV5ZHc5OStsWk1kbms0UGsrS21TakRNYjVKeHhMT0k0VG8wbUpPZkJLVERz?=
 =?utf-8?B?ZThSRFNnQ3FjNkdLd01jNWNLY1pweE1HUEpKQ09RTlQrb01aZnBnN2thQjdn?=
 =?utf-8?B?ek9TOTZTNFZNODFzRkpZMm9zNG1nOURCTHBPakhzWWVFSS81VlUydjdENTRR?=
 =?utf-8?B?c0FxbWpiU25KaWx0VmlXaGZCTStETFBPMzRyTzJnTmh2UCtYNEhUc1ZUSzdP?=
 =?utf-8?B?ZVBZT0FpNUFKbS9KVmZJZjBwU1lCS2ExUGQwR3A2endzZkNHdmx2QjQwUnlJ?=
 =?utf-8?B?TGtha1dQcXVQZEIxcjFidHdDRXVhZWZzeU5uN3krK0xWT0Y4ZjJaV3J2Njda?=
 =?utf-8?B?UTMrYjBObDFXRExYL0FUVjV6MFhFcFhTOUFUS212R3M1ZEYvMEw5RE0zVmRt?=
 =?utf-8?B?YVdXTTh2WG5HaTQzYTNEMnFQaFg3R3B2RUw2UTZ4aGRKTWlDb2MrSy9WSzMy?=
 =?utf-8?B?ZWE5S2hqS1o4WGxMOG44TTZZb3lSTzBsSkZPcVhsdVlKOVppQkJVN3dEcVI2?=
 =?utf-8?B?aldPb3loMDFCTWpSbGFRWEhuK2xKeXZyb2hpd2U0ZWNOQWRTREJRUXJTbzhq?=
 =?utf-8?B?VVhUM1pHcUZsSGRaYVhpZzNuMDJOdWZpaDRzbmNVbnNGS2lyc3UvTDR3WDdw?=
 =?utf-8?B?OCtVUHBkak5DU3FVaGt3cWFuS3E4aW94QVRUQzV5UzFNU0VORGR5Nm92QkV1?=
 =?utf-8?B?ZCtzdUR1N21wT0RBMFByKzFYMFNERXZzVlU2bTZGT2o2enN1QXBNOGRRVGRa?=
 =?utf-8?B?eWtENmltUXB2VE9uekRGN1MzbTh3ZU1CdDZqOGMwbG5LNlJuQ0VOblUrRUUz?=
 =?utf-8?B?T3ZQbUhLOEJEU0NkZjYraTNoRzd3OGU4KzVRMGYzRDBENEIyU003bHBFREV6?=
 =?utf-8?B?MGF1SHMyMUNhby9HQ1hhTzhEYUR3NjdremZ5THc5RHMxai9QUGhZc0l3cGJ4?=
 =?utf-8?B?aStvdFhxYzlha2tGak1mcUJRQkJ3elFQSmdOTlVPMEoyU0FWVUFiZmlFRksz?=
 =?utf-8?B?SUVRVTlnREpvdHdEc3hMT2xQUTZMTk9zYnhpeEIraUd1Y1VCQ1M0VHRUOTh4?=
 =?utf-8?Q?od3t3Sn762d3jc142R2rm9277?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 085592ec-6b4d-4d4f-7644-08dbafaeb1b1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 14:28:24.4406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QUkBzjSC/oaFrcQko+TjWicXsRntISwVV73KpP8ytAVo4klYHrsPG4TGe3bPK20nlfqIQH3kN6fb1lfzztKX0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8981

On 18.08.2023 15:44, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Currently timer_irq_works() will wait the full 100ms before checking
> that pit0_ticks has been incremented at least 4 times.
> 
> However, the bulk of the BIOS/platform should not have a buggy timer.
> So waiting for the full 100ms is a bit harsh.
> 
> Rework the logic to only wait until 100ms passed or we saw more than
> 4 ticks. So now, in the good case, this will reduce the wait time
> to ~50ms.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

In principle this is all fine. There's a secondary aspect though which
may call for a slight rework of the patch.

> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -1509,6 +1509,8 @@ static void __init setup_ioapic_ids_from_mpc(void)
>  static int __init timer_irq_works(void)
>  {
>      unsigned long t1, flags;
> +    /* Wait for maximum 10 ticks */
> +    unsigned long msec = (10 * 1000) / HZ;

(Minor remark: I don't think this needs to be unsigned long; unsigned
in will suffice.)

> @@ -1517,19 +1519,25 @@ static int __init timer_irq_works(void)
>  
>      local_save_flags(flags);
>      local_irq_enable();
> -    /* Let ten ticks pass... */
> -    mdelay((10 * 1000) / HZ);
> -    local_irq_restore(flags);
>  
> -    /*
> -     * Expect a few ticks at least, to be sure some possible
> -     * glue logic does not lock up after one or two first
> -     * ticks in a non-ExtINT mode.  Also the local APIC
> -     * might have cached one ExtINT interrupt.  Finally, at
> -     * least one tick may be lost due to delays.
> -     */
> -    if ( (ACCESS_ONCE(pit0_ticks) - t1) > 4 )
> +    while ( msec-- )
> +    {
> +        mdelay(1);
> +        /*
> +         * Expect a few ticks at least, to be sure some possible
> +         * glue logic does not lock up after one or two first
> +         * ticks in a non-ExtINT mode.  Also the local APIC
> +         * might have cached one ExtINT interrupt.  Finally, at
> +         * least one tick may be lost due to delays.
> +         */
> +        if ( (ACCESS_ONCE(pit0_ticks) - t1) <= 4 )
> +            continue;
> +
> +        local_irq_restore(flags);
>          return 1;
> +    }
> +
> +    local_irq_restore(flags);
>  
>      return 0;
>  }

While Andrew has a patch pending (not sure why it didn't go in yet)
to simplify local_irq_restore(), and while further it shouldn't really
need using here (local_irq_disable() ought to be fine), I can see that
you don't want to make such an adjustment here. But then I'd prefer if
we got away with just a single instance, adjusting the final return
statement accordingly (easiest would likely be to go from the value of
"msec").

Jan

