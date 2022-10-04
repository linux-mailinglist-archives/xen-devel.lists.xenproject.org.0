Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8316E5F3F0F
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 11:01:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415292.659830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofdnl-0007cm-5v; Tue, 04 Oct 2022 09:01:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415292.659830; Tue, 04 Oct 2022 09:01:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofdnl-0007aa-2j; Tue, 04 Oct 2022 09:01:21 +0000
Received: by outflank-mailman (input) for mailman id 415292;
 Tue, 04 Oct 2022 09:01:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0IF=2F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ofdnk-0007aU-65
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 09:01:20 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70052.outbound.protection.outlook.com [40.107.7.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1bfa96ee-43c3-11ed-9377-c1cf23e5d27e;
 Tue, 04 Oct 2022 11:01:18 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7331.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.31; Tue, 4 Oct
 2022 09:01:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 09:01:17 +0000
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
X-Inumbo-ID: 1bfa96ee-43c3-11ed-9377-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LwxhwiaQO1T8phbWfZI4pCx+xYuOJzPCVJSXrDimaBQH40xeSM816EbIY31qcAC3XXR1PBluyZvtvLwtEUxEu+xSsFglymb3KeEGJp87O3+zjvcAyOegXs9YgpBCG17fA7/eZC3fgpd8+JMsR9a/s0T/myTkwl2vDrws3PWrVDp4plwAWfSjkT80g0kRQrTcqoP14CTX6Hv1lIPp7p6ILAeyTJZB9fHwFIPkbAt4Q5y81ZGy6NElkfRhxO050OFuPU+U32JXSvjfq50WU0H4vLEOY9HD5eI83fqj5o5xX0CHRYOw09uFZLbsJiHHCttfuAIZfb5Ts86LCnKckksftA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YoUS/O8YApbCBPHVh4q9PYlIAPnSZtyR0i4hIScy2rM=;
 b=jBYInax4ecJnVE3jcFfy9iRQXEIANHTmtXlO5HSrerPTc+qlgnRPojjxCFjuGj5wVoTlUI4ikSnC2rpavFGAfNqWnhGGojGM+zgmVeGYkSy/UFTZFf6nbhLRQXnT6kd0uNT5i5nUWuUYuuVrib1MsglBqzgHcjb0QK3KqMbwSuiJEmxMWcu5+g4CYPRz20EtVLhIad41uoXFxkfZs9fYhV49G5kx43JoON5EM3Jx/CXC/iukz9XebDrGGXoxXjXiSlSATj5ZBbs35r0ukRbTrLlQ6amYY31tfd84InOK23ITYxqaZFGjpPjsC0yby1QD9WadnqOMmmrw6LOUbqFYag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YoUS/O8YApbCBPHVh4q9PYlIAPnSZtyR0i4hIScy2rM=;
 b=tE4ZB8dsVWSBH0dM7M9DtwmjEenQ9uFuuHPuNca49AMtCOaHvXAHB8Ytvw6oifYjel8KzUEIcQzMMFaL7vDVoKNhxkc6S3pCFTTttvK24dLX36wc1/KPYz8bA4i1rVU2cICoW93YIinFxWdVQzpMbeO++hGZo8d5zBEVuaB9rXZ3gFd9C8bCzmtH6+D+qGGrN3uKtFj1ezjh/kbM5AfYWRr0WrRKoNRnijp4lCHsHAgc0GuJlC73Gd0Xw+0m37KFXdHerGD1RHK10+/Cybj3acKJXfWE1W/Hco4oeMqeABLTzmt8adxiHXnglQRzuSWbTIAKSZQSRTBLyvAPFIB9IA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e3235c0f-5964-0f95-fcc0-bcc44bf9d784@suse.com>
Date: Tue, 4 Oct 2022 11:01:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH for-4.17] x86/efi: don't translate EFI memory map MMIO
 regions to e820 RESERVED
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220930141737.67574-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220930141737.67574-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0062.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7331:EE_
X-MS-Office365-Filtering-Correlation-Id: 92759e34-ee2c-48f1-9ea5-08daa5e6ff54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3Ix7CZaghRm2R9ZDMmln6ydRjpd4iGCcX1tJ4xmTAkZrtD/sV1XekI03kfSbbVNDESDEhr0YtKfA+GTVz+uCOK9fx5t3YSQHeYeJSdigeMJY/woUk96zkDk6PUWj7Gh/MS4ANuso+MXpOz4VZlOhHtsTd7SEOZcwrvG1DwUJLsFyr2fj1ER+8/M6miw1wTyFmto+eUZ7OAoO71JxCk6S+dEAmS6qJP620QID+bGu0WoHjrntnOFUw+9dA51YyyHVGDVvNJ4dxvsqFBcbUj6PRkb+BH0pVr7e1+ikYcmeqRfmwgRP/yswcKy+tmWWn3FmKp/y3VJWSDtydggz5SpHwLIdQpRD0zFM9FdscgKC6kb/aMGtdA/zsI06LlO4uIdWJT1dL/ISuRBM8s7r4u5PXWHHCSPRCJxArFpnEkA7OCg2E5RmepNKisKK0MZVp3cDioJCKmO6+K4sRznq7rWdXAbvek1542s6deNMYNDdOWogXCs+va2DypThrxC3SvpWFre6bvqyRb54teJM2WClLOqAJe0Bl7Rf3nv3HrG+fjQwp38QytPPhOS6zopWfDWveyZ/q68StNPPuQNZkYU6dCXN39qQsf/5JX/m1BehdsbevFJHgXDCCZyU5GRtQM5punLD2YQf1cg7I2C9Ban4DpYecGYecEUGTRHpur5Sv/H3mGBK4BbYepQifY7OymDUwcyg6ncz2yq2I+GYWnLxYqDmwLUAkmyGCGYdYxDe8+LdfTr1cX7etrnbu0S2+SmGNWe+tMTIFBUlj1gOQMvgIXGrDjHYPR+gH1iR/B7hldU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(136003)(376002)(39860400002)(366004)(396003)(451199015)(5660300002)(41300700001)(2906002)(66556008)(66946007)(2616005)(6512007)(26005)(186003)(8676002)(4326008)(66476007)(38100700002)(36756003)(31686004)(6506007)(8936002)(83380400001)(6916009)(54906003)(6486002)(53546011)(478600001)(31696002)(316002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHljeHR4T2VzbEUwdnUxSUtRUWZHMGVUWE5QTUNBRXlMRHZkbHhsNWl3c3VI?=
 =?utf-8?B?bE0yTGo4S0tIejdvTU1pZG1PYWF1aTU5bnBlSDZJcEZ1R3dmbjY2TVVKQXA5?=
 =?utf-8?B?dXlFYzNha2NPUHlPdWg0T3VnNkRIdFcwNk1DdlFud0p0RWhrY3lYQ3h6UC9J?=
 =?utf-8?B?VDE4N2Mxc1ZVT3RZZlVUZjBKVk14UURLS3U2U0ZwSjAxZmg1eU83QTgzMnlS?=
 =?utf-8?B?aVVveWJFUDhxQWl6clA5RlFMTlNESk5jd2FjM0tlTy96K0UxY1QzYmJPTm1V?=
 =?utf-8?B?T01XSW1rYkdaWUdrMlZVRUdzQWIzU0hyMnQrR0M3WFcyc1hPVVRRaGxHQXkx?=
 =?utf-8?B?aVFYZENxbld1R3ZCUUdkN0RaaDBBMStOVG8ranRCT0V5aG55VzJhVUZQM0dk?=
 =?utf-8?B?YTEyd2VNUFd1NXpwN3Z6SFY5R2lkUTdYclU0WGIyWGtTa2U2cXhjbkdFUHNG?=
 =?utf-8?B?c0U5OUVFdEgxZFJGZHFrcDROMjlKOTNJNkUwYnhPZFFERUZxM3AzZ1p6Y1E3?=
 =?utf-8?B?d3lwRFRqeW9iamRrMzFqRnB0OGwrUDJqeEx3ZE8yYXd6cVU3VktLOUNxaHF0?=
 =?utf-8?B?VEVkZlFTNjRQcVdiZEtPR05ZMGpvZ0NWVzJEeFplSUo5cU12alZtL0w4ZnZ6?=
 =?utf-8?B?OWNjMFFwdDZUemNCYWxIeVlnWkdHRG45cGtaWERDdGUxT3E1bUs3RGp4Ti9q?=
 =?utf-8?B?aTNxTzZEZ3dvc3orTTkxTW5mcXVWQlVtQW04NkJmNTNWTzVabmhlRWUvb3FJ?=
 =?utf-8?B?ZEJxZFdLTFd5MHV3bDJYNS9ycEpObmFTN1VVQlpFcTRKNmdrdVVnaWc3eTlq?=
 =?utf-8?B?YXNnUytVcUloL3J2dnZjWEMwbVQvRUFISHNMbldjU0I4Z1RrUjVGSTkxbUNN?=
 =?utf-8?B?MERWb21lcFo0MlMyK1MrRFIycFM5VktQWWl5ZS8xMXhKTUErOGppdjY5RTVD?=
 =?utf-8?B?bVl3K0hZT3dPbWVGVW5KQmI5ajNpTFptNHFzNUduK3BtY0dVNHZJNzRmdzZ2?=
 =?utf-8?B?WFpBeVF5c3lTTnUrMWs5aG5rWnhvK0lrREVWMUlCTk1IZFN6RjNQT05KdE5E?=
 =?utf-8?B?SFJSMThnTmZBRklkVnJPZTdudFRwcGdwWFJIWW13Q2kwdEg2YUI3K3llUS9n?=
 =?utf-8?B?c0lleC9kQm5uVkcwSkFHanRhc0pURlZoVWpVTk5XVHJCeXpvRGdlSEVUNXA2?=
 =?utf-8?B?elRzV1lIaXkyZzA3MnYyQTVJeFZSMEk4QTdnQUZIcERzbzBqbmV2ZzRrMVdx?=
 =?utf-8?B?MnBtRk1oaS9WYUNPSXY4RGczQ2k1ZFhBMzJid1ozcG1JWjJoU2J5RTVOQTlz?=
 =?utf-8?B?VkNTdC9PSW9vbTI3b2Q1SnBub3pPYkxqUG5uOURvcm03TmZTNlZCYkJQU2Nl?=
 =?utf-8?B?ZmE0Z2d6VWhtVnYzbHZsOEpyZkltTEp3SmJJWW1jcXdSU1VyTjNlQ3RMT01T?=
 =?utf-8?B?bXFsRCt4bmlZZUp5Vi9UUCtlY2RILzJHVE5mUVVRdG1kRU9Ibisxd2NvZWNZ?=
 =?utf-8?B?d2tSNlJidjcvandiK0ZjTHYyNUphNWk2enV0SmZqZnlTMklJOXFUT0hnSDdu?=
 =?utf-8?B?WXk5OEpZaTI2MzVVTnFLWFlKclRjclUrMlA4VWFMWEJ2MVFvZ0Y2R0NBZWdI?=
 =?utf-8?B?dzFEcVZYTG1Td3E4M3g4K205Wkk2UzZJVEhRT2pUR292c2tjdFBHa2paTDU5?=
 =?utf-8?B?ZHZvUTE3M1ZOTFQ5eXUwcHdvcmVhMVhEWGZmci8zQ1JLbGtwQnNPYkZIaXFO?=
 =?utf-8?B?KzFjMDU4Zk5Da0JuYnVtdW53c2ZJaHgzUlE3Y2xpTlUwVG4vVkFraTFDVEUr?=
 =?utf-8?B?NzYrNmdmSkFTclJJSGlkOGFFUUdtQzBubEhhVlFRa0RreThFLzhYck5nTHMw?=
 =?utf-8?B?NWtFRE5DVDkrQXpIUmI4Y1l1ZmQxTHNCNHQwVlppdzFpRWMyNzE1UDNPYkJE?=
 =?utf-8?B?ZUlxV0VaSVZWOE5ybDFDemkwSWRLTzBFOWc5dzdYUXpvcDdTTDYrcEV0ZytQ?=
 =?utf-8?B?K1hZMFhXbnBOemQ0elJBNmVBOVUxOEs2SjRUR1FHZnEvME9ScmRtZis2cVZx?=
 =?utf-8?B?SGc3aDFyc1luVG1oUi9jY3BQL0F0VWtUTDFvM01wekc3RSt0THNobnVOWS9r?=
 =?utf-8?Q?WBeEbT9CS1SeskJVXr31xhHJD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92759e34-ee2c-48f1-9ea5-08daa5e6ff54
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 09:01:17.2236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uSnMEeITy3v2QsHKUTY1Oxp5ED/y+2JL4ZrGvD4r/0YrNHxC3KZ5Yh6i/+8oHym6uq0fYNwLawoabvlPzkss1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7331

On 30.09.2022 16:17, Roger Pau Monne wrote:
> The EFI memory map contains two memory types (EfiMemoryMappedIO and
> EfiMemoryMappedIOPortSpace) used to describe IO memory areas of
> devices used by EFI.
> 
> The current parsing of the EFI memory map was translating
> EfiMemoryMappedIO and EfiMemoryMappedIOPortSpace to E820_RESERVED on
> x86.  This is an issue because device MMIO regions (BARs) should not
> be positioned on reserved regions.  Any BARs positioned on non-hole
> areas of the memory map will cause is_memory_hole() to return false,
> which would then cause memory decoding to be disabled for such device.
> This leads to EFI firmware malfunctions when using runtime services.
> 
> The system under which this was observed has:
> 
> EFI memory map:
> [...]
>  00000fd000000-00000fe7fffff type=11 attr=800000000000100d
> [...]
> 0000:00:1f.5 disabled: BAR [0xfe010, 0xfe010] overlaps with memory map
> 
> The device behind this BAR is:
> 
> 00:1f.5 Serial bus controller [0c80]: Intel Corporation Lewisburg SPI Controller (rev 09)
> 	Subsystem: Super Micro Computer Inc Device 091c
> 	Flags: fast devsel
> 	Memory at fe010000 (32-bit, non-prefetchable) [size=4K]well
> 
> For the record, the symptom observed in that machine was a hard freeze
> when attempting to set an EFI variable (XEN_EFI_set_variable).
> 
> Fix by not adding regions with type EfiMemoryMappedIO or
> EfiMemoryMappedIOPortSpace to the e820 memory map, that allows BARs to
> be positioned there.
> 
> Fixes: 75cc460a1b ('xen/pci: detect when BARs are not suitably positioned')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

In the best case this is moving us from one way of being wrong to another:
So far we wrongly include BARs in E820_RESERVED (_if_ they can be
legitimately covered by a EfiMemoryMappedIO region in the first place,
which I'm not sure is actually permitted - iirc just like E820_RESERVED
may not be used for BARs, this memory type also may not be), whereas with
your change we would no longer report non-BAR MMIO space (chipset specific
ranges for example) as reserved. In fact I think the example you provide
is at least partly due to bogus firmware behavior: The BAR is put in space
normally used for firmware specific memory (MMIO) ranges. I think firmware
should either assign the BAR differently or exclude the range from the
memory map.

I guess instead we want to handle the example you give by a firmware quirk
workaround.

> ---
> I don't understand the definition of EfiMemoryMappedIOPortSpace:
> 
> "System memory-mapped IO region that is used to translate memory
> cycles to IO cycles by the processor."

That's something (only?) IA-64 used, where kind of as a "replacement" for
x86 I/O port accesses equivalents thereof were provided (iirc 4 ports
per page) via MMIO accesses. It is this compatibility MMIO space which is
marked this way. Such ranges should never be seen on (current) x86.

> But given its name I would assume it's also likely used to mark ranges
> in use by PCI device BARs.
> 
> It would also be interesting to forward this information to dom0, so
> it doesn't attempt to move the BARs of this device(s) around, or else
> issues will arise.

None of this is device specific. There's simply (typically) one MMIO
range covering the entire 64k or I/O port space.

Jan

