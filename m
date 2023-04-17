Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF846E4011
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 08:47:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521759.810599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poIe0-0004SW-Aw; Mon, 17 Apr 2023 06:47:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521759.810599; Mon, 17 Apr 2023 06:47:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poIe0-0004P8-7d; Mon, 17 Apr 2023 06:47:20 +0000
Received: by outflank-mailman (input) for mailman id 521759;
 Mon, 17 Apr 2023 06:47:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1poIdy-0004P2-0H
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 06:47:18 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20618.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b120e13c-dceb-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 08:47:16 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9776.eurprd04.prod.outlook.com (2603:10a6:10:4f0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Mon, 17 Apr
 2023 06:47:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 06:47:13 +0000
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
X-Inumbo-ID: b120e13c-dceb-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CqpyRRbk21QSISyV2TR+VZv6X9ueppvEXNWDLkWNjO3T5++bFzF9fOHmGO+egj1fZV63GZxwBr7g9eLcMdf0tIBzWDrmv/k+fzFV7WWU8Hh49y0n/CvB7EzWZEa+WnAYUTJEmm5ZXgJ9TJQfDQOpXGz2W6FHwomLhn1wiEQBYbN1TZ8tWW0f1B+IaKuADpebNZPhCDudXaTS0EiZecTj/loI1QECXU7FuGaNC58MiZdAZIaboFgGGqKvh9zGpofdgUo2lOtzn6zeu7naU8xSILa6PwcalhfwhTuDtxhFSTbS7qWDGW4zW5ntjH+Du/S9YMNiRL5bfiPn/Tyg1BNtCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNN16guSb2UEKvY1cXgGIaAE7s/NGut5AB7BbY3dch4=;
 b=j31cs1grh0L33WcxbPnYhRwrWjpMHpySg2VBMnfaXmr0BE0DEKcSB6oegT43gYrBkpyZ0bTyjLS6eXbui4rH8rlI0xOqaphQ8byTthiubuqmbg/FM+99tpbIbKdTDq5Vn9hooAikqkFNt4vXvIDT0qOaDRaBZ52I5RgMKbAu8oHE8R3DvamYGMvHRX8vKY7gyo0/xpsRBCiG6NszRgUTWlzU9VHyLIj4oWm05rWXHGaejjaOZHNK0UFJqm/lzKunUuzbjnyylPIm+/zSe5DpE2pVIYw7YYyle0CyBajfgyyOMUehtcESpIN+DvpShfRltcIowsYu90D4oFc3Yqc2xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNN16guSb2UEKvY1cXgGIaAE7s/NGut5AB7BbY3dch4=;
 b=FTfeZ98b+1zeiTUFjqptjhc1tao5M5b1L+xakGsmvUBptBzg4NbH2f6FKtSk/NDE99+TVYHk0V+rEnz6iwumUW395QLkBvsWOSerABebKPrfce11/RZRokVdYdjjSbVf4zb4peQ+tcU4HSJB0ji5O+gJAHfCZQ55hv5oNTvmoCuEf82NHmy6BSYg5fwh/iYBQcxbRMHOgd/TI9lvqWJTaNXJLi5VYiAVWr5hwdaVMTPkoi9+tpT9UqmBTEgBOEBvaiy85/03f5v49wUW9oEoxuQz4VhOOHtRVnBUyUdDrEYp+B+7zk4EDTVw5X8rKjiAZXbhtsnpjDe340BiCJnYRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <910bd8aa-8289-25e2-bc8e-0b01d25992d9@suse.com>
Date: Mon, 17 Apr 2023 08:47:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v3 1/6] xen: add reference counter support
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
 <20230314205612.3703668-2-volodymyr_babchuk@epam.com>
 <57c7c2e4-ae68-19c4-2140-f5a41fc1a6d3@suse.com> <87a5zexcw0.fsf@epam.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <87a5zexcw0.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9776:EE_
X-MS-Office365-Filtering-Correlation-Id: d1b8bbf4-a0c4-4205-7514-08db3f0f9305
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KsebxhSm78uark9E6C3Ci0GoQcUcCCrrREWOimHSlA6u19EUxLqorcLs6DXvv/ZqVWi6hC51BlTwo+YoDzEvxPzDTiVDIwpXQTW08iKWKqd+wV57nLIMJMKSGs+eTgqQZWiLX0SDXcpQH3oYQAWzbZ6VJh+WPEPIAbPL9xKIaWEwPxkFRkJuFdRIclV8iyLMDOH75VbtD120gQJDDOaA+9bmozgLk7C91EsKikEeDEeVOoUmROVqmjgNW79hjoHLZy9Vrz49d77JGeuw8UPBN8nnCUNNSihVAtfAQxserZv17YKXHl1q7p8yup9ZsrsviAYtMHZD3Oo5Q8UwIorPPJJZ/jtMAydl8hMmGoqC/z0D5nz/3MSjcGKEroeeW4uncAsttvMNaNC28YT86v3CZQpdusHZ17l3F+uw6d+qZoqF8RQM/7LE0GbQFjZpw943aAQDHSFstVWVNVg0l8OpXcdmxj7xOZIu53jVDR+vDjLhy/WWzIKtffDVkuZbZEWP9fwi95/fkck0/4u8cZ3d7yS0O+i9uBVuSg2uI3XEtxTn7XS9G1LwxIELC0RUX8wq23I/U/lke6r6mspFheV0o8KYIdG+61b0+5v2MZlpcDA5egPICqzFeAT+SHr0agfvuumClQOxYNEOXCwq3ty3IA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(39860400002)(396003)(136003)(366004)(451199021)(31696002)(2616005)(83380400001)(54906003)(6486002)(6666004)(478600001)(6512007)(186003)(26005)(6506007)(38100700002)(36756003)(5660300002)(4326008)(66556008)(53546011)(66476007)(66946007)(41300700001)(8676002)(2906002)(6916009)(8936002)(86362001)(316002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVFtdE9yaDFldmhkbkVPYXptUGt0RllKRVJIL2loKzRERTZsZDNMUEFnQ1ls?=
 =?utf-8?B?NDljZ1UwWWYxNUVIa0ZGTEZObEpEN2ZPeVRFeFdPY0t2OHBlMlE4K0d4bTg4?=
 =?utf-8?B?MXdPeUozckFKRkU1RkwxQ0RxU3R3ODc0YTBoVy8yZVlUa1RRTWxCUFJUVGlk?=
 =?utf-8?B?dnM0RTB3NkprRS9VZ3RhK0lVVU4xcGorSS8rU0RGVnpIM0FROTZ5RzdFZE8v?=
 =?utf-8?B?R0F1QXN0cU4rQkJMMjNLMEtoNmJFOHZROEVmRHVyUG9IWHgwYWxvNWY5cklt?=
 =?utf-8?B?dlorSFY1dWdMTTU4dzduRXRNcGVkOXdQL0VyVkh4SFRvZVBKTEVRaEd0REFa?=
 =?utf-8?B?QUt2aXByM3VnOENZZkgzeFpKK3R2Z0JPbzBUaXFOS0xZZkQ5VGF1OVVnMlh1?=
 =?utf-8?B?Wkx6R29XRWJ5aHh5STQzRHBLbEhIeVFUNVhaanRDTVJibGZDSXBGOHZ5VTFK?=
 =?utf-8?B?NHdBaVFBVWpnSnB6WDhGTEwrQTRCV2s0R0VqczFpSG5nc0RYY1MxRjhDTy9W?=
 =?utf-8?B?Ym81dktqR0VGUVlwNFpoQUJibEdCeDdiMU8yWHlRYVEreTcwTmQrRytlSUE3?=
 =?utf-8?B?U1BtdXNELzhKY0hCMTBmZmFkV05FWkZhTG8rR0I2ZDRQblB0NUFaY0wwU1Ez?=
 =?utf-8?B?NzJKbG9CQzNvcDBGSzU4YmxaMWd6RWZsdjVBV2JLVnpxUkFONzFZSEpnd3or?=
 =?utf-8?B?ODU4cW1uMTV6V3c5SGxWU3BRcTFKTXZGQkpFeDBNaTRscmI0NEtUL2xxQ09G?=
 =?utf-8?B?bDRXZlBmK2EraWIydFEyYnB2WDM2NTlXWVBaaUFMMUxDQSsyY3ZNdGU2dCt3?=
 =?utf-8?B?OWwvdkhScFBUTThzRzN0bzhNUTY3d3lpYWMyS0piTUNyU0NtTVVNVHVmYlpW?=
 =?utf-8?B?QjgrdzBHejF6U1p4TWlMZmpBbFpldmZ0enhSUk01ZzM3eUNGMW9jQ29nTmV2?=
 =?utf-8?B?U1Fya0dJNlU2dnoyQmxQMUIrUDZNaGtvV056Vi96RXEvRzlva0VpWGRwQVpz?=
 =?utf-8?B?WjNsNjJnWnBoT1lkZjhiMGNqSzN2QnhDanRmTVoyTjRXMkFNbVhXZlBzT1Rv?=
 =?utf-8?B?V2w5eTdvTFpPZXFJd25tU0NUcEVIa3VOU2hoQ2hMZ2lNMVV2WTd1VTJ5MnRI?=
 =?utf-8?B?TDVBNk5KZzJmYTZpSkJFOUcwdEhIdzE3NE9BMmd3RSt3QUVCU2ZOZlV3MnF5?=
 =?utf-8?B?WHUxKzFXZ3F3OTBFR2U0cVN5NmZaamRPU0RySCtFemRCTWlhNE5rSUUzaHZB?=
 =?utf-8?B?bkRRWUJILzNyazdMS0VGMXQ2ZDlTOThHeTlwN1NJdUlWbEl0cEpKOTVCTCs3?=
 =?utf-8?B?akJ6WGwwak50cFNRR2dFTnNmNmVVVXNUQVBwT2VUdlNjS0hMMnNRd0x5Q1BP?=
 =?utf-8?B?dnZOdmNCd090K0dEUmtpUzh3MGJ2TWt2ejFxOVR0TE9XZ3l5MXJUd2lvNVlF?=
 =?utf-8?B?b3I5N3ZIVVVKcVBkb1JPSld0bTEzc0dyYnZZYmZNNS95UUVZK0pxZjVOZFVq?=
 =?utf-8?B?QVFrUkpxVXJnUU5LaXIwQUZBTDhGUE92S0NyOHNUODdrQmlTbFFOSnlQbE4z?=
 =?utf-8?B?azE4UzZ0ZktIYVRnVE90aUZzTjRYTWpwYTV6NUZaZTVyVWpTdDBqWlVVQ3hI?=
 =?utf-8?B?R0Z4OXpaNjlUaUdyM0dFTmdYbmRwemI3akF6ZGE4R0hmK3VybStRWndQTEtR?=
 =?utf-8?B?dy8xMXlKZ1ZTMUM4L1VMTTRERE5rWUJ6US9YQlYzeFdLVldpQnpJei9sZy8y?=
 =?utf-8?B?Q25GcUNEa0cvRUQxUkdFSUlRMm5rYWhibWNmRmh1MDgrU1h5dlhIL2lmWDMv?=
 =?utf-8?B?RDJ4YUVWWXRmZWovYnhGTW9HQitraGlDdlptTVhQbWRlOVVSWFFiZlVOeUVR?=
 =?utf-8?B?R0doZzFCVVp6aEVNY29pY2RzSWMvMDc3UFJvQUMwdUdaSnpTM21SaitNSmtn?=
 =?utf-8?B?eEw5OUhOL212M3Q0TFhYNUluNzlaN1E1OVNlRWpjcmU3M3lOd3VvMkN0S3Rv?=
 =?utf-8?B?UHBUOVY1TzRES1JRaGNVeHUrKy90R09lZGMwUjdsamxRMjRpMGp4TFVsK2pB?=
 =?utf-8?B?U2NKVU9rUmtYRlNUd1ZVMU9GZXljczFDZXFQQk1uams0dUltSGFLOUIyekJr?=
 =?utf-8?Q?axvaIjqPQRQvfwHq1zmU3w+ho?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1b8bbf4-a0c4-4205-7514-08db3f0f9305
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 06:47:12.9564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tZMg/WSCCO7TZzNYhVQyPSeAzI3oTzNC7JO8YuGsUae6tIxp2q9PBGFMIedU9soOvS3fI2IbOCWKG/P2rtTN6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9776

On 12.04.2023 00:38, Volodymyr Babchuk wrote:
> Jan Beulich <jbeulich@suse.com> writes:
>> On 14.03.2023 21:56, Volodymyr Babchuk wrote:
>>> +static inline void refcnt_put(refcnt_t *refcnt, void (*destructor)(refcnt_t *refcnt))
>>
>> Hmm, this means all callers need to pass (and agree on) the supposedly
>> single destructor function that needs calling. Wouldn't the destructor
>> function better be stored elsewhere (and supplied to e.g. refcnt_init())?
>>
> 
> I tried to replicate Linux approach. They provide destructor function
> every time. On other hand, kref_put() is often called from a wrapper
> function (like pdev_put() in our case), so destructor in fact, is
> provided only once.

If provided via wrappers, that'll be fine of course.

>>> +{
>>> +    int ret = atomic_dec_return(&refcnt->refcnt);
>>> +
>>> +    if ( ret == 0 )
>>> +        destructor(refcnt);
>>> +
>>> +    if ( unlikely(ret < 0))
>>> +    {
>>> +        atomic_set(&refcnt->refcnt, REFCNT_SATURATED);
>>
>> It's undefined whether *refcnt still exists once the destructor was
>> called (which would have happened before we can make it here). While
>> even the atomic_dec_return() above would already have acted in an
>> unknown way in this case I don't think it's a good idea to access the
>> object yet another time. (Same for the "negative" case in
>> refcnt_get() then.)
> 
> Okay, then I'll remove saturation logic.

Wait. Saturating on overflow might still be a reasonable concept. But
here you convert an underflow to the "saturated" value.

Jan

