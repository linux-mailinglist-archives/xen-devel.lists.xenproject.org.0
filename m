Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A29E760CD4
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 10:20:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569527.890358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qODGM-0006oZ-LY; Tue, 25 Jul 2023 08:19:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569527.890358; Tue, 25 Jul 2023 08:19:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qODGM-0006mH-Is; Tue, 25 Jul 2023 08:19:22 +0000
Received: by outflank-mailman (input) for mailman id 569527;
 Tue, 25 Jul 2023 08:19:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nivo=DL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qODGL-0006mB-Kv
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 08:19:21 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2070.outbound.protection.outlook.com [40.107.7.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f056bb16-2ac3-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 10:19:13 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8619.eurprd04.prod.outlook.com (2603:10a6:20b:43a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 08:18:50 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 08:18:50 +0000
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
X-Inumbo-ID: f056bb16-2ac3-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kAFbrqzWFv0r4mtIyN+JYQgtBFophrHKKX6FdTu2D8Np1KRs52/lpWbZt8Yshu412fByp00an28axc32tEofkN1lH5CQPc4LFQqBNGd93pU67wyoql+Ds1IuT9bF8TPlM+h++Sfn8GLLnjVFzh0esRjV/xVnt+K60s+htqyM7VdtImTFfNvCw5hBGJaB6rQWMPtFbcXK6gM1kwLh5ja6WkTARUaWpRaSajhrvLyEba3uphGCnRyBO87UnCWdlQ8AgZp0gt9dbtmG69wVaF8BRe+DwGJNmMcru2OBvwjlmQpnlFeGm3CFrnphy5J+SwBTsWkyVO+vxISPJAYokvj7qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ODO1xSaXezWXoStZDdTbR/K3+TD1E18vrSVKt/DrhP8=;
 b=FY6v1JZJtg6e7KAD2thS92I5PGhlHPWLlKK2nf2fsD3rXeRSYx2sj0PxZS+B9hYC+afLF2xiPF6kgQ4aXq1/14yWBdM9lh4C4jU+swQQLWVzamFeQbF8GnYOpy5O6IDjnhr5cqq4W3N5EG5Ze0TdPnOIeVnxdRjv9uVV47GW8wt3efNQ1ykZjrD/aW/GuT5XpACWh41fjYkwKxSMrts7ZrfHFEGS8rKDfs45nJJ72BWwg3CZQwQEkNAPFgRv8zk9Ntxr/z7YfqrbLUPxpcobqbfeV+13zQk27wSINMc4bQWPvTIn7vYf4n2+ZSu2Hh42dr9ttXNsg85HGHHQ29hfCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ODO1xSaXezWXoStZDdTbR/K3+TD1E18vrSVKt/DrhP8=;
 b=phBhL78JjhxJkQnEMSRAgKdFjrR/a7p5MFlogyuE0RKUaUrVTZLiNcUeXyKGkZSenCImrreSohAt3MlFxnYxNQ2cfIQnydrQryOyzTHOT2Uk9DARoYchF9HlGrt6K+ICz2xnr8HI6Q8VC6Y506FoVuO1vJZuO9J90ALQXZ7HI6jXyF+XdIZirlDzyXWOa2iDhGHglud5eSd8rEpffCJ+vlduUqDxWoiJ4z8gQZlqvjGq8hUL4awotDVxr0CHHhXImLo8I0pr374r/a8DoMOZxTGdXNRMxb6/Uo8G6126POwr0JeH816Req9Sj/MNYgraParXmkugvH35Qtgz1srC0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <004fa0af-105b-63eb-2abc-53b0cbcfaef7@suse.com>
Date: Tue, 25 Jul 2023 10:18:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3] ns16550: add support for polling mode when device tree
 is used
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <d929b43814e6e1a247b954c4be40a35d61b6a45a.1690208840.git.oleksii.kurochko@gmail.com>
 <be0c9eb8-6561-f6bc-ff76-a1bfeaeaab9d@suse.com>
 <ab9e7a3f3b5faa4805b5b2c8ffc985bc3330c4a3.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ab9e7a3f3b5faa4805b5b2c8ffc985bc3330c4a3.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8619:EE_
X-MS-Office365-Filtering-Correlation-Id: 703b8edc-09ac-47a4-52ec-08db8ce7c69a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6JClz5A9GC+Yg5OAMui5zro8ArTFjOiwQBZRiIKLHtwKkdg1TrNi7eRTJVepC+lV+C3RNVZNJsr0SmRh7jtzlkhv3JhAIE89GLChBJOthdJ8rJrEeI4vp1yz8ErcGZqiCAqShWgAx8/o/WGihkUR5+0vO1PEggFfK/2VpvACYrNmtDxVIZ2TwFDDlbXuDYNQpO60rysv3OKvHAM0rdjgVdQjEUHG1ZCwgDekcxrDLcRi3s4CcunmBXf/VT9w3igHFtVA4yijEj2CZqK3Qlx1JJbTPIIn4pB+RXU1pOWTlroOEa+3QhhJWYaMwcxcUGWhhkO3llTJngz2qGIU+V5xDoknIVt3rkrHOsO5xAVMh2PHfXDonbzgiA1P9wdF3bHEcGW64HwJjQOlDjluk94a9y23nMLJ2I7EZ7BD7q/skDNJZ5fyJkx1kRtlC8rBInvGIxpTcnYD2rA6/u2YteVtjOc+0w2vxVQp3ZIiFXLxFgMyDf08dNrLPzOtpdCD6BO2JdzmPuyYECxYXH0BIAOVjfnWlzBsxvV1EgeDDAjH5+dHQR+IKVh8QAkpVcqr0QyItoHtjAewgQ4CvwA+kmVHDUMqm3Bf3PFT12vgZQND/xGUnTWFnB0mDjhyqS51TNwFoqO6LncUQe4ZhGkw4+xZQQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(136003)(376002)(366004)(39860400002)(451199021)(6486002)(478600001)(83380400001)(53546011)(6506007)(6512007)(26005)(4326008)(6916009)(54906003)(66556008)(66946007)(66476007)(2616005)(186003)(38100700002)(31686004)(5660300002)(8676002)(8936002)(2906002)(41300700001)(316002)(86362001)(31696002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZjZFSDd2bHI3Yko1dVBtSFNUbCtXTXNpZUQwVnFrZXhFM3hGT2xGOUlacTFZ?=
 =?utf-8?B?ZTlFdEZNaUhyNFlXY2hjSWN6eFpvaElJVi80dGRLZkxnMVNTaVNXUWRNS2E4?=
 =?utf-8?B?VlJ5VXFCWTEzYng0Ykc4Q25tcytvOTdhb0VidEZrY2htVmFwU0RxWHVWZHdT?=
 =?utf-8?B?RnI5Z1QxT1ZidWMrbkdEVi9rQXhBai9JWnZ2UnN1OHhySmlCOTM2ZkRSaEhD?=
 =?utf-8?B?QW5GM1lqSUhIeFJQRHh1YjMyVEVrS292ai9sNVZiU2ZRSzR6b1Jsc0pRK1BN?=
 =?utf-8?B?MTE1WVRhU2JJMC9lNkxzQy9oUDhRRStpMmYvZENYQVFwWVlzL3lOQW1SK3h6?=
 =?utf-8?B?aUxCQkxyZWRLMjc1dTN3UTRYZ000bkNrR3V5M2d2bEpTbGVVMmhwSThVNFIv?=
 =?utf-8?B?RDNVSVdkYVp1bHFISjNnUHJyekgrSHpCOTFRNm4zY09tbDdkS2NQRGdqR2dM?=
 =?utf-8?B?OWVweGNZZzA2OWlWQ08rNHVkOVh3Tk40OXdESk9qblZFd3BBVndOM3BYc2JS?=
 =?utf-8?B?eHRoQU92QlJ6Q3dBc282VXJ0VFNkTFh4OFdHMkhscDFtdldOVTlmZGpjbWpG?=
 =?utf-8?B?Z1krWXU4ZHMwMy91VnpTNDVVS1I0NWNIODRUL2RhaVpORmc4dktMVlc4bFlI?=
 =?utf-8?B?UkpHbng4d24zSXdEc1l6SThaR2NwbzFibHA0b1pVamlRWWNkMFp0T0p4c3FF?=
 =?utf-8?B?ZFJXVG9yanI5YS9XMEJ1OVFRWUcxT2ZQSVl2ZExiVEVKWnRyZ3N4VWZxVWc0?=
 =?utf-8?B?cUMyQ3pjVk51dHd1ckNBMmNTNjRxQkZXUk9icjllRU9nbWlOd29RcnZCbnhU?=
 =?utf-8?B?WUc0aVMzMk95Y3NFM2doRWt1VEE5NFpIbXhOdXZHZytTdWtlT0dNR0kxODA2?=
 =?utf-8?B?d2pWanVtay9nT3lCbmNsUldDcmNhejRrcXVNZTE0ZjVaU08rY2RzK0RCc3M3?=
 =?utf-8?B?dlRyVmlRS2UweStoYURNaVBsWFkrWXR5dGNlRlduMmVpcE1mYUpMS2prZmdJ?=
 =?utf-8?B?L2wxcGR5L2FiLzNWU2JHb1psQ20ycFE4ei9zQWlnd1F6YlVNMWk0OTZWNTU0?=
 =?utf-8?B?SVFiWjJwbGJOOGQ5aDkzZ0lMTlhrZ0xkby9tN2pvbjdUUUhhS2ptbUY0bHMx?=
 =?utf-8?B?Z3RMMksvUGthaWg4WHAzN3VveEw3MUZuQkVoVkdZcXZPYWg1UVZKTzZqNkNY?=
 =?utf-8?B?dmVHb2t4c2JlVUd4Z3N6MzhnSWJJaThHRTE3dHhTZlMxSy9iaVdCTXZYbmxD?=
 =?utf-8?B?dXZuQ3hwNkJocTUzWFByVkdzREkzRExOOUdMdkpLNnBTdkNodlk0WXNaa0ZV?=
 =?utf-8?B?Q1dXQWRDR0czYXpUSTJibXBmejBBNzdYalNZbkZiOTBVaWVma3RhcjlwWjh2?=
 =?utf-8?B?UnVFUTcyZGQ3dDNYQTJGK2djSmZvS2krK0d5YVh5YS9IMlh6SktDTk9ZMFpL?=
 =?utf-8?B?M3I5QkpzUXZXZUYrSC9PWFVqUHFGdkIrOVNpd3BtUis5VzhQOE5POC95SHRh?=
 =?utf-8?B?SGV4Y2dKcGN4dXNndjhaVm55SUE5dWpzZURFNVlWK3lLeHh4Sjc5MENtOTQy?=
 =?utf-8?B?RFlvL21TVEJNKy9KcWNRbnBzcjc1S09ueXk3d1dRb2tHaVNNZ1M2VGV2TFd4?=
 =?utf-8?B?UENCOEhkN2c1d2h5QmUxclRwRDA3My93K0dkRzJ0UUNJbUxMc2hNS1FVTEtN?=
 =?utf-8?B?SFNJMkJ2MU90cjBVU1lPelU3ek00YmpEb3ZuU1VvakxVSlh2bEdvVExQNUUr?=
 =?utf-8?B?UU00ZXFGampMZ1lXWGJHMy9TQWx6dytYWDRqYmFlNUt5Q3VGd0FPWVNiVlJS?=
 =?utf-8?B?ckFZKy9xL2V0eVZ6REFFYjljRk5UbUpkbUNhNStTcHhtcHI1c1h2d1p0RjhB?=
 =?utf-8?B?c0dITkdQYndnUUwrRWJXa1VZcGdWOTNKVjZqQy9vcWNCZW5EYURqMXA3RlJy?=
 =?utf-8?B?OTIrK2ZYZXYxZ0FaRklHdnNVenZ3STRiZ2JtN3c5Q2RZY0ppRHBDZlBLeTFs?=
 =?utf-8?B?RFJQMWxrZk52c3o1N1FGdGVQZ0QyTTQvaURXT1RVTXVhY3JYUUp5aWVoc29o?=
 =?utf-8?B?Y2VWS2lmU3FPOWMzWGdUUVY1UitQQnRtSEV5RmJiWk9GSGdFRjduS2xIK0h0?=
 =?utf-8?Q?ciXEzKq9bT3+78m5HQYQ+m//P?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 703b8edc-09ac-47a4-52ec-08db8ce7c69a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 08:18:50.1729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jNuwG6ObVMmQL/2E3DblRksXACdkZBJsW+pb60FYATsyQ7y6hUjkeWFpg0gRaNvsYkhrDm6MSCk40UrjZxfxng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8619

On 25.07.2023 10:15, Oleksii wrote:
> On Mon, 2023-07-24 at 16:43 +0200, Jan Beulich wrote:
>> On 24.07.2023 16:27, Oleksii Kurochko wrote:
>>> @@ -1330,9 +1341,12 @@ pci_uart_config(struct ns16550 *uart, bool_t
>>> skip_amt, unsigned int idx)
>>>                   * as special only for X86.
>>>                   */
>>>                  if ( uart->irq == 0xff )
>>> +                {
>>>                      uart->irq = 0;
>>> +                    uart->intr_works = polling;
>>> +                }
>>>  #endif
>>> -                if ( !uart->irq )
>>> +                if ( !uart->irq || (uart->intr_works == polling) )
>>>                      printk(XENLOG_INFO
>>>                             "ns16550: %pp: no legacy IRQ, using
>>> poll mode\n",
>>>                             &PCI_SBDF(0, b, d, f));
>>
>> Message and code (after your addition) continue to be out of sync.
>> As said before, any condition that leads to polling mode wants to
>> find itself expressed by uart->intr_works set to "polling".
> Well. It looks like it would be better to set 'uart->intr_works =
> polling' inside if ( !uart->irq ):
>   if ( !uart->irq || (uart->intr_works == polling) )
>   {
>       uart->intr_works = polling;
>       printk(XENLOG_INFO
>              "ns16550: %pp: using poll mode\n",
>              &PCI_SBDF(0, b, d, f));
>   }
> Then "uart->intr_works = polling;" can be removed from "if ( uart->irq
> == 0xff )" as in that case 'uart->irq = 0' means polling mode for X86.

I'm not fully convinced. Care needs to be taken that both the x86 case
and the general case continue to function as they did (unless proven to
be buggy).

Jan

