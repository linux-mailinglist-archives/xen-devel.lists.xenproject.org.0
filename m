Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2DD57C8E4
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jul 2022 12:26:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372627.604459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oETNO-0003yI-PR; Thu, 21 Jul 2022 10:25:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372627.604459; Thu, 21 Jul 2022 10:25:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oETNO-0003vY-Lv; Thu, 21 Jul 2022 10:25:50 +0000
Received: by outflank-mailman (input) for mailman id 372627;
 Thu, 21 Jul 2022 10:25:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=itvi=X2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oETNN-0003vS-Cx
 for xen-devel@lists.xenproject.org; Thu, 21 Jul 2022 10:25:49 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2051.outbound.protection.outlook.com [40.107.20.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c81922a-08df-11ed-bd2d-47488cf2e6aa;
 Thu, 21 Jul 2022 12:25:48 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8551.eurprd04.prod.outlook.com (2603:10a6:10:2d6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 21 Jul
 2022 10:25:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Thu, 21 Jul 2022
 10:25:26 +0000
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
X-Inumbo-ID: 7c81922a-08df-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RV0nHcu42Ovfq4JuHS+v6xpylUGRYvcOvyDtunqb/Jft4HjkflrK036X1V3zemzLKKYFfVZbF2jup4yto1KJrohFUYRv5i6uZAcFGJUMzsBzIgYgBXwxZKxiem7SbualbOc90xNaOnHA2Fx2LgzV49UxEy5fNTkk3pFjU//16J/rZY3rqLPR1BdO71hKxtUOs1tjSszLRbplDoasquBI6DZcZhCUexMgKWcnAhUEfrAd1zGqh3rL+SgTEZcbT2od2tcmPi3EnDpZoA0SYg6XjuGVuvm5u9ZdxTgAWZCKGLiQk0Aa8n/ANCi2gkAQY80yQueFFOZksrWA8H1HdaVqOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZ99+JJHEW7/SDCvKqCeZrkRtJt1Wc2lOVB9VpAxiHI=;
 b=V2zy61CburQRq3sDphcLe+StaYU7XZp4VFMYb7omoVcW1wip7WnCo3JpmMMuBAACaC1QBr6NgeVmFesXgFBWxalp0ZYaX9KJhqf35/wxNDKY/BX2i2iUaFpMMVw6xrzQ5rChY2NnuX9bMn0JOfOyaK0LNuE5o8nHBEhD93jF8gFm3tK1PdwsRPvRSnlrQm2wwjIZM0telxAjYuXizOHrjlbDLZWiEDHU0vHYG0ffIiMW8QomyPmgyu2DfWmmqAPIn3lK21NJGl6slnBDc/sgBkEPrgSQYD3aHa2071dvWdaburKOgnog2DCigVjMYhEWYLM6LWzOoMuXDJS0hbNr/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RZ99+JJHEW7/SDCvKqCeZrkRtJt1Wc2lOVB9VpAxiHI=;
 b=v7A7IXaO0xEDgFWvexzSJoK9zWgs47k053xPgJDMtQVgvrw322Bzkc420/jAAAE/lVWffyR24g6tpJgur/MSRHmzTTWu8BdO3FWoHeXtgE3cp7HsC0vF1TL0ynzxAt5fIw8fWE4lQt/5RojOYAfAhHMLcchwkHdmyZC8Y4U78ure0TzwsVr4QGweS/5nBOJmNb/LAMAaqwrwR964u0jNC8N1t+uaWaRBWyHsa6wOYsB/rn/NzlXIhgwgj2V2iXMJHFPM4CssaVv1coXm3gMH206G0ZGz/Rnfi50yzGF8MBYh3n3z7mw14g0FkU0wHLob1iy23eKu1iy2ah8SjmSltA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <923f6623-1ea4-9089-d693-7a21570327e4@suse.com>
Date: Thu, 21 Jul 2022 12:25:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/9] drivers/char: Add support for Xue USB3 debugger
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Connor Davis <connojdavis@gmail.com>
References: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
 <80051b9dc5c99532e18a10a941c3523945d77698.1657121519.git-series.marmarek@invisiblethingslab.com>
 <dc195aca-79e1-7faa-d29a-ea0626e257ad@suse.com> <YthhkXbFpFRSHHHR@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YthhkXbFpFRSHHHR@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0112.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f0119df-84aa-423e-c2ef-08da6b035412
X-MS-TrafficTypeDiagnostic: DU2PR04MB8551:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LUST/UAwObrYx5UYf0Fm44bsHDwjX8MMXJNvL3RG6m0VJhAAJlZqIYm7bUVHWl1dn3MtBU0W/WtgQBRZCnznElWTBJABfuZV/sivaYb2ckGQhkEAS0lunnRmlkdLlwRk1UtY++sBc+5MjQWCDFsp/JvWCU1TEy4+ILB3h50mQAYhok/kldALMdmEQurQrhCxvfAlWE67zkBiFHZmlq7CTy5vX4yO6F1l91JXLN9TCkskA5IQIgmFtT89Y0ymOVpbpAzlL7tAZNaMz8saD631xvJGOTxcjxxY7B6ausGwxvAl+WDJigqC27QiEy/+LYCN9xf1SXtTuxxoB8IZicbPkTna0dJnP/S6jYmr9KUhlrlmplyWWmtEZGrqh3dxDYIh6pHnbBTKDjYQWkYOLn/4rrHxfTFx+ehGAb8MWjcPNZFOkryNGHFgGerVtmHWqZk16VhKXlThZb7HXPoiPKioYlfNo2UxOnJd4WMIoYTV/f4optRnSzbZ7Q1FH0F2OWHAB4hxfO92uX+a1b5xNDyAUvLPtDLHXYcJuoL+7717PJUsuxldKmv6c71P5WwxGL07kSTgqkFHFUMNgwV/wjKyBHRStOllCLjtb6feR7MZPvFbmENIYvuAEaZq0JS9eKcNVhrckuAKF4t0sZiJ/X/rZ12vbWHd++2UL1gNdombsLh9fwPNXn+qc4ezxwvodr+G9kAcVcsS85HwV2NuOp6aTDWap91JOTqGeH9tNrnHJhb4dqBL7SLqCbXNWrUN3fythP7leRB8Om9amHTMRdyAsRJKtZQIL6xinfPnvjne6TRfwFVRMYBsZ+s6QKRS8UWWBTxehGA0XOwkWbRK6cOtrg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(39860400002)(136003)(346002)(376002)(36756003)(8936002)(26005)(6506007)(6512007)(6486002)(53546011)(478600001)(5660300002)(2906002)(41300700001)(31696002)(86362001)(66476007)(186003)(38100700002)(8676002)(4326008)(6916009)(66946007)(54906003)(66556008)(316002)(31686004)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2h0TWM3WmNpYSs4Wnp2dDJUTzFKSzM1YTd3Q1dGZ0VaK09qWWMzOHJXekVP?=
 =?utf-8?B?Y0wrQUoyNGVhMnUrcWUwLzZTczBMSFJma2VSMGt0cGhNbnllMVdGcXVLVC9u?=
 =?utf-8?B?dzd6VWlJbjFna2N6b1BPQjFUMys3S05vL0ZQTk5hZGJaNTVMTkpjMzh5bzZi?=
 =?utf-8?B?YVJWWFNkU1crNnp1WTI2UnpZMVpWM3JkNUtzcUoxMlZDT1RKWU9tblR2RU5X?=
 =?utf-8?B?cmVKNktpQWtnUGZjbHdneWpVM1IvWU9mSkJTRU1SQ0JkTXFlUFJWNUI4VnZN?=
 =?utf-8?B?ZkFYOGpOZXNOS255czRyOFM1SkJlMEU2ak9jcEYwaDBHeEFMQzRhQmswV3VX?=
 =?utf-8?B?YUxHbEt0MFArNncvcmpLNjkzM3FBN2ZndTFjSWJLM0p6QTVBbE5PQUdtSlU2?=
 =?utf-8?B?NTFjY0k5T3p0VTRhcFp5dGhiMWhyZjc0eXpNaUxpWmZRMEc2YWVRbkhjcUVL?=
 =?utf-8?B?bUh4WnZnZG4rd0k4M3l5bWtjKzBSKy9Ick5jeWZqRU9KcjlTM1VqQWlpYTVH?=
 =?utf-8?B?RWNTTC8yWnRNLzNKL2xDZEk1L2ZlekdYT1ZrLzVObFNSZ2ExNm42SUtCSjY2?=
 =?utf-8?B?Q0tQeStUSkFqeVdmYWtMM09ManFhR3dqQmQ2S0oydUx2bWZmcGlQd0FUbGJm?=
 =?utf-8?B?T0s0WXdnZXpLOWxqQXR3b1Z3THBpMHk4Und4aThRTmNnMW52cXc4S0JONFdu?=
 =?utf-8?B?MENkdCswQzRMS1dJaHZBc0VmM2RUTlVtc3V6ZlF0djQybEtrLzcxbThTWW9L?=
 =?utf-8?B?b3lHRm1NNG05Qi9DRUNsTklWMEN6RnJBZEtGbE0rVG95YzhPNUozVGlmNEU1?=
 =?utf-8?B?ZTVPM2RmWnp0ZlM1UmlaSGFZN2p5T0ZRdENwQW0vYzcrc2Myc0ozb25CNi9j?=
 =?utf-8?B?MllsMTBETkJicy8ySi9IWGZLMzVOSzdrVm9jWTFXckYyUlFwakt4bzB0Sk9Q?=
 =?utf-8?B?NnpTSnZFRTlBVXdQd3lXWUR2cVFUbjJVVTJSYkFjUDhjRmZxTXpaQkNRUmJD?=
 =?utf-8?B?QTlSTzIzUFhPWVNUQ1U5dDE2ZGs1am1IWkNKbGFOazdOWHJmZU9IWHl1U3c3?=
 =?utf-8?B?M1RUVDRWbFNja3FMdWoycFRVZktaTjB4elhDOUNlTWM5WHJnUEd0VUdJcjIw?=
 =?utf-8?B?QnR4NXFheE4yVVhHRTN2SzRDMVlpbk1yY0xtZ21jOXh0N0dZVStld24rZnQv?=
 =?utf-8?B?TWJMTzg5K3JsUUxDc3E2TmY1N2pjWEVYelV0ekhMLzcyS0NOcEs2akpkVE1i?=
 =?utf-8?B?NHJaaU5WaWNtcFR4Z3o5M2J0U2drTGJnSlZUc1VPblQyK2RBci9ucHJ3STE5?=
 =?utf-8?B?M2xqNm9IOHBVemNiYVdoSmhCK1FDTm1HaHAyNXdKZmNhSGExWUZmeVFidG9S?=
 =?utf-8?B?ZFJ4bEIyWlJiRW4vUlg4TkZhWFhKU1FRMlU5QzIwK3g3WmxPbURjazM3bnNQ?=
 =?utf-8?B?ODNieWhqOVBSZWtVYkhGcGtPeVZGYzlKZHRRSGczaVJrRlU0a1JyZndJVlVu?=
 =?utf-8?B?UzRmUGFJTEl3a1lpSmNFTHliWmtXSndaU0Q2WXk3VWpQVGVTUlBSalR5Z2NU?=
 =?utf-8?B?Q1NQK05lSExiUjhjc3RsQUpERGhWclAzMXZYZTJvV3h3WEZhdWVRcmRvbGZ2?=
 =?utf-8?B?dFFZalBqaUVuNDhiaUN3TEwvK2htcXdLakdCdS9HL0s4eE1MTlpRMFNDVEpW?=
 =?utf-8?B?cm1VbFMwS0tJeWVUUEM4N3hnQlBXZ1U2RFVtZU9pNE5QNExqeVBOZ0gxQ0NT?=
 =?utf-8?B?bnliNVRKVlVKQlFjbVFUazVNWS8yMFJTWkR3NzA3MTFIeUZ4NG5HU1gwQkVF?=
 =?utf-8?B?ai9TcThqSG9FNjRPYXB3VXlSclIxbzVXNllhWXl0S1pXZFUwa1lDRG1YTGcv?=
 =?utf-8?B?U0pRYjFRcDNJaHAzbzRHK3ZOaGFkbmN3Zk1Sc0RiNFVTYnZacVphVHRhRjZQ?=
 =?utf-8?B?M1JULzFZNWdzSjhJdzRWd0JMUEZWdnhXK005UzZkMHlYYkhxSkxWSm9NUDhR?=
 =?utf-8?B?NEJJSnoxeHQyRW1Xc2x3ckp0OHVxeTV5ZWtrUTNGZTNVSTNjVHlnankrM1Yw?=
 =?utf-8?B?QkRVOUw1S1pKUXQ1c0J3VGlTNC9nNDZVdTVoOHZxaTR5KzdLeWtDTGhYY1hY?=
 =?utf-8?Q?uFj4Ae3MUASROgcMnzLPjH/FF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f0119df-84aa-423e-c2ef-08da6b035412
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 10:25:26.7342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RVysfzuBqbkjONkOWMja5ruThx3CiYPF5IXWJZgT53e2RmUwbPdJocTgyxzHViC0X15hQOcR+J69lYM7O3xrRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8551

On 20.07.2022 22:12, Marek Marczykowski-Górecki wrote:
> On Thu, Jul 14, 2022 at 01:58:25PM +0200, Jan Beulich wrote:
>> On 06.07.2022 17:32, Marek Marczykowski-Górecki wrote:
>>> +static int xue_init_dbc(struct xue *xue)
>>> +{
>>> +    uint64_t erdp = 0;
>>> +    uint64_t out = 0;
>>> +    uint64_t in = 0;
>>> +    uint64_t mbs = 0;
>>> +    struct xue_dbc_reg *reg = xue_find_dbc(xue);
>>> +
>>> +    if ( !reg )
>>> +        return 0;
>>> +
>>> +    xue->dbc_reg = reg;
>>> +    xue_disable_dbc(xue);
>>> +
>>> +    xue_trb_ring_init(xue, &xue->dbc_ering, 0, XUE_DB_INVAL);
>>> +    xue_trb_ring_init(xue, &xue->dbc_oring, 1, XUE_DB_OUT);
>>> +    xue_trb_ring_init(xue, &xue->dbc_iring, 1, XUE_DB_IN);
>>> +
>>> +    erdp = virt_to_maddr(xue->dbc_ering.trb);
>>> +    if ( !erdp )
>>> +        return 0;
>>> +
>>> +    memset(xue->dbc_erst, 0, sizeof(*xue->dbc_erst));
>>> +    xue->dbc_erst->base = erdp;
>>> +    xue->dbc_erst->size = XUE_TRB_RING_CAP;
>>> +
>>> +    mbs = (reg->ctrl & 0xFF0000) >> 16;
>>> +    out = virt_to_maddr(xue->dbc_oring.trb);
>>> +    in = virt_to_maddr(xue->dbc_iring.trb);
>>> +
>>> +    memset(xue->dbc_ctx, 0, sizeof(*xue->dbc_ctx));
>>> +    xue_init_strings(xue, xue->dbc_ctx->info);
>>> +    xue_init_ep(xue->dbc_ctx->ep_out, mbs, xue_ep_bulk_out, out);
>>> +    xue_init_ep(xue->dbc_ctx->ep_in, mbs, xue_ep_bulk_in, in);
>>> +
>>> +    reg->erstsz = 1;
>>> +    reg->erstba = virt_to_maddr(xue->dbc_erst);
>>> +    reg->erdp = erdp;
>>> +    reg->cp = virt_to_maddr(xue->dbc_ctx);
>>
>> The only place this field is read looks to be xue_dump().
> 
> No, reg is MMIO, all those assignments are actually configuring the
> device.

Well, then the pointer would preferably be marked __iomem and the
writes should be carried out via writel() and friends.

Jan

