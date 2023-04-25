Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E1D6EDF68
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 11:38:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525942.817484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prF7T-0008FG-6a; Tue, 25 Apr 2023 09:37:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525942.817484; Tue, 25 Apr 2023 09:37:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prF7T-0008Ce-3t; Tue, 25 Apr 2023 09:37:55 +0000
Received: by outflank-mailman (input) for mailman id 525942;
 Tue, 25 Apr 2023 09:37:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+We=AQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1prF7S-0008CY-H0
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 09:37:54 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20604.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d976d55b-e34c-11ed-b223-6b7b168915f2;
 Tue, 25 Apr 2023 11:37:52 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB8018.eurprd04.prod.outlook.com (2603:10a6:20b:236::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Tue, 25 Apr
 2023 09:37:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Tue, 25 Apr 2023
 09:37:49 +0000
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
X-Inumbo-ID: d976d55b-e34c-11ed-b223-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OD2hcd+NEEGgFa02CRbSsnvk3yMWF/c2Yu1mSOrwzPj/gRimpox3FIFF1Y5n28eFhnKr7nFbHC15QCIqlqmp9Z6Vtgd5bo7SCdq2q21sBKSNaXpAhFeWZwLD1vY2ntzpbuZtgvZIqH2d4I1d+4KEpuyrPu+92zebLzGvFDZO/9M5vX10gImwepll/ySBta3skOzTC18ZV8UpVc4PuT2A6KbkkJdIGOQ/8k+i0TJjFifj2/DO26Hp8COIreG5ecTdqKPg75fySkgpg1Q0kXA5i5I2rtkSVrESIUmoFFRCL9gMUucbir1a9QzujQkVOqXusc14295AYSa87ZqoqARi5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ATNNVVqOrdW2aZ7VmVeCVcEoEOy2KfvMGzUwlyIuyQ=;
 b=ctZH0H5Cc2ov4nSmJ27CE6NJu7hTa0zWZJPH2GUMZNyNiFT/eLTSb+RnFhYA4LAvBysBgoU6eArloVIGHi2rzeaanU8PEOFSAvFEGa8ddLlt1wvlB6/0ws+vaRaZgyniGIIkDMjZsonm2zQeqBM6Ardw/HSJbxEUu1REv/gt8MlJYwMN1lsCgBTnrvZb+nbO0/eF4UCQYP03DcBX+uEkWY5uBChHRhVKbgCHbDGiqUp2AmJBlygmFuiw9yh1eSy0Y+xDYMk47awBWTpLH2//26oN113D/Gpp1JWYcJEdraw5s0/W4AkYgGKV6kiyTJXK8p9wlzM2jcg/dkTjW+X4Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ATNNVVqOrdW2aZ7VmVeCVcEoEOy2KfvMGzUwlyIuyQ=;
 b=qqqsOofUbDz8K/AJCQOA/A65Wt+kYSHyaK8Km29Ht/MuWMYoEThnmJH6byxW1E1M7QiZiu/CGG9227h18qv9HzvMxj0WTchyKFXe2rdqlQGl3A/qbOH364xHI6B0TbL0hCIwpy81jknlXnj8tt/FG6mZvBP+NF0JWS7BDNns+0hdkMqInoyxuQUh6czMMXzpm8STVQ4hDm+NluD4gf+KjahhXjmQePzNGoEdoB5RgsivYAxB8TnWm7XumhgxuWpnyl2qKH12Ai47Fm+tnoCual4zEGzkA9qO37QXR1NljCtNznY3vKfSronl3PTzJp0SvnFFeWnQFinzasR/xfSmew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <25123de7-c04e-1cf6-6076-6d3dcb9a4306@suse.com>
Date: Tue, 25 Apr 2023 11:37:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] ns16550: enable memory decoding on MMIO-based PCI console
 card
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230424233930.129621-1-marmarek@invisiblethingslab.com>
 <e93bd35b-42fb-3979-7e08-0d7f779e9ed1@suse.com> <ZEeb4ieUq1B1cQsg@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZEeb4ieUq1B1cQsg@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0130.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB8018:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ef1ee31-2c22-4fe0-f769-08db4570bbb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tnAbaoo+sfrAyONp6513hfGHluSo6IOg3ZUINDQwSxDZP9/sVdNxLxQKG2e+uumY+1r9Jw2/fKFJGkQz9DTJdkO/zKX9kLfk7+gYIYQi2YI4LwfNA6f6PqqA+HRJdrH+GOyX0wnbwOEx0beZ13myvyePKllPFPYdWcqZwDxMLl1lsAwPLGYP6XrmRy/FHspReL6ykD3pAqNM+Y+RsxeDuWHZ1lNV6YLxZkApj2LQJotcz0FF+8zOS5LIaC33wkDcvxlAqhZSvxPk78ERC92fCgyb2cgULjnl87dWUDnln1h2IxoT1fJhKDuNS6X3jN7YSw3ywcyJ/OGt12pWJYw4KooQrnZ8QCYjur9iiCVABXfcWlj4A3X2tEVZ/IkyIWB9hhT3E0mqSch9kxKcj8chzfBn367+vgsmvnXp+j/dxg4kFbVWYiskRVvb2C7cFTuXzurylHKZx7auOyIIzoCE64RkOTBhdqJMqf1Mo31+BqH70thknXnE1qfFpU2gcsOoXON0HwNONMTgjLw+E55UTjqNdy20meoaet4/SAUEod5otY/sTTgZ2viaivIpKJ1uJvukIrTwl5wfE0tHUTqpn8jV0dol27jmTDaXnCaXzxbFU3K15+XNZE42DZ5C960fAxv4emTyp+nQe20iGB3Z3w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(376002)(136003)(346002)(39860400002)(451199021)(2906002)(6486002)(6512007)(6506007)(2616005)(186003)(53546011)(66556008)(66476007)(66946007)(8676002)(8936002)(41300700001)(6916009)(4326008)(316002)(26005)(478600001)(5660300002)(54906003)(38100700002)(36756003)(86362001)(31696002)(83380400001)(66574015)(31686004)(66899021)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXc4VkpoSzdyZkZyc0Z1anR4WGcvU0IvaWorUVJGUW9ja1FBdDgzeUowUndZ?=
 =?utf-8?B?TDhJZEhpWXl1dmdnNThLYkV5UVRyaUl4eXNDUHJGaE51am5zZmRwSVB5TU1Q?=
 =?utf-8?B?QUJEa1E1MENVTHNHUFZ5YnU2WVZVUmtzQlQxcVRZbDBhMWF0clNmdTYyRHZE?=
 =?utf-8?B?aUxGQUxaeXRlNnd5emVKUEVseGliYVpvVWxGVkoxOXJTKzJQaE1vUjZsOVNh?=
 =?utf-8?B?Yi9EOFJJcHdXK29lYmdoZUxLUG96NElXcHNOY0wyMDFLKzllS3IrZUZnNDZa?=
 =?utf-8?B?dVhEd1dldHl1aFhFamFQUS8yOXNWUUJtbEZqeFdlTzNtaWRkNTBtbnd0TWdW?=
 =?utf-8?B?SHhCeHpJYnpncmVnUFhlVE8rSXMrclRveTM0d3V5b1NWeGdjV1cybUNqRkJW?=
 =?utf-8?B?V2VhYWcwZTI4US84WG1mVHBYOXhiMzF0Q2dscFJtaXlsNUErS2RlUjIycUpW?=
 =?utf-8?B?czFKY0hLVGI0SDRPS0oxZzRNNThqM2pNREkrOE54SFV4cElidUtYOWJNbDFN?=
 =?utf-8?B?VW1COWo3SG1UK05LS1ExRkd2dTRjMmtlRWwvZnMvbEdvUDZDMjhJOE8yRUtD?=
 =?utf-8?B?Zk9NS3dRNUMxNkVTT1dTNzhZNm8ySWV6STRJN3R0U3ZRblB6b2VPRG1UbGVC?=
 =?utf-8?B?L3ZWU0ZZWWNMdDJWdE1zUGtiaHVCeU1hR3NyS0FwVmR2L3BvVndIN0I0d2pD?=
 =?utf-8?B?T3l5dHZZdXZUTzNNVWF4ajlJZU5LcjVhR1hRSUJZQUVrZ01Kc0FrSEJrRHgw?=
 =?utf-8?B?WHJORGsvcWdtVUZsYjQxYVVwbUkrYzJtWkJyR0Uza214WVJWTDJ0WGJ4WjFZ?=
 =?utf-8?B?Uml5MEUvVlkrMFJRckJ1SEdDWWhualliNTZTelhRTG1tTjBndUJnZlF0cTdw?=
 =?utf-8?B?d1N4RzZwZVBEM1VpeUhncnFwa3JUY3l6bXhXaDFYNGZ2SDM3M25KTE1zNHEr?=
 =?utf-8?B?M1k5MUROcXVOVVhoNFBFUWtNV2ZhY284L0lzc21iaXNDOTlFWk1KQUk2ODZE?=
 =?utf-8?B?bE5GSHVOaVNrUFRtT3hRY3N1aG9DNzM5czlOSkx2dWEvUFNRL0k2MkpKT0Nu?=
 =?utf-8?B?cjdhMTd0U1Q3OHJUK1dZT1RkUnQvUXNkbUh0d3NWaG1jOEJ6S1Jtc1RxQlJT?=
 =?utf-8?B?UkFUZWFmY0YrWnpJNmlVNkpkVnJkazVjNjl0MWx4aVF0b1B4b3VLdWxoeHZj?=
 =?utf-8?B?c29WRTY1ZVhwS1VEMXE4MGhqN1IvV3RCS2FibUdNL3RPTW9WQ0RFVTJ1QTNK?=
 =?utf-8?B?UWQ4UkhFRFNwbmxjaExPOHZtSmkxOWp2d25DQnVxUWxIekR2U2NIRG9BSklD?=
 =?utf-8?B?K2FuQ1RKYzBRTkFzeWxTekhQZHZNVUxnZVhHZ05hajJKV0hhYzBiazQ4dy9y?=
 =?utf-8?B?K3ZwdXZuZjI5aUJQVmV3WTAyWDVRVUd1UTBkdE1NZTJVenI3Z0hvLzJlSnMx?=
 =?utf-8?B?M2UxRkNvck1wWkRDSGFYcFpKUndkL3Z3RzlKeVk0anJzeXR5aytKN3lUZ2VN?=
 =?utf-8?B?M2ZGVi9aMnY1TXFrUE5tR3l1allaajJYd29yeUtFYkY4S2k4cUY1S0ZscXJF?=
 =?utf-8?B?SkNaTWtyaVgvd2JnaFdIbzFadjJ6azkwWHNsWWsrQ0hMZW40b0ZXV3A5VTY5?=
 =?utf-8?B?R3grQjFPcSthc3dyV0VjZmdsVHBNME1YTHdZSnlTMXZ2b09NTldocnd4Mnc0?=
 =?utf-8?B?dzBraWl1Z0h3SC8yVjBkUzZuVlJDR3FQVXVJYzV5bVk1WGN5LzlSSDIwczZ6?=
 =?utf-8?B?bmZEVFJ3K0hzbWJnL213a0M1L0Jmc0p5VGVOYVVZNCtudFlrZEVIb0ExRFQ4?=
 =?utf-8?B?UTN0ckt6ZThqMjhpdWlEUTYvdVphQXdsU0tXWlBmYW5zenFISC9ScmEyRnhq?=
 =?utf-8?B?QzFSZ25TeEZNSlQ2UFNRVmZORm9ibWZsZTNWaGZrd3puRTdLejVsQzJQbkgw?=
 =?utf-8?B?NFlhZTltYnNOUU85OGVJT2p0L2dMdCt0M1JkTTY4b2hFclBJVmpHeUN1Mk5F?=
 =?utf-8?B?dTlhOWFYYzlLdzN1bE15U0xscXlscFl6N25wemF6WnpYa2JqZUwrK3c3RHB2?=
 =?utf-8?B?d2d5RlNTVzh0dkxWNktLN3FQR2pZbkwxS0Npb2ZiazNNa0s2T1NsVEplRlNC?=
 =?utf-8?Q?cA7e+RJMT1JAs5LIi9NoMCdH2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ef1ee31-2c22-4fe0-f769-08db4570bbb7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 09:37:49.3151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6c0A3eisTY6kgKp9hWuyJ3fG9Q5AcEmugxVFuYloCIARpnB3l4wDy+e/0EY4einG25lf22eeMkr9QmKYQrKdbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8018

On 25.04.2023 11:22, Marek Marczykowski-Górecki wrote:
> On Tue, Apr 25, 2023 at 10:05:25AM +0200, Jan Beulich wrote:
>> On 25.04.2023 01:39, Marek Marczykowski-Górecki wrote:
>>> pci_serial_early_init() enables PCI_COMMAND_IO for IO-based UART
>>> devices, do similar with PCI_COMMAND_MEMORY for MMIO-based UART devices.
>>
>> While I agree that something like this is needed (and in fact I have been
>> wondering more than once why this wasn't there), what you say above isn't
>> really correct imo: You do not really make things similar to port-based
>> handling. For one you don't respect uart->pb_bdf_enable. And then you also
>> don't write the BAR. When you use the BDF form of com<N>=, I don't see how
>> else the BAR could be written to the value that you (necessarily) have to
>> also specify on the command line. 
> 
> I don't think MMIO-based UART is going to work without "pci" on the
> command line at all. Setting the BAR is one of the reasons (there is
> more to it than just setting (or reading) PCI_BASE_ADDRESS_0, as many
> cards have UART registers at an offset), but also other parameters like
> fifo_size. So, I don't think it's a good idea to set PCI_BASE_ADDRESS_0
> to what user provided in io_base.

While the BDF way of setting the device to use is meant for the most basic
configurations only anyway, I'm okay with you to leave out that aspect as
well, so long as you mention it as (another) dissimilarity with the port-
based logic.

>> As said on Matrix, using the "pci"
>> sub-option together with the BDF one isn't intended (and would probably
>> better be rejected), according to all I can tell. Which in turn means that
>> for the "pci" sub-option alone to also have the effect of - if necessary -
>> enabling I/O or memory decoding, a further adjustment would be needed
>> (because merely keying this to uart->ps_bdf_enable then isn't enough). I
>> guess like e.g. ns16550_init_postirq() you'd want to also check uart->bar.
> 
> Yes, checking also uart->bar makes sense.
> 
>> That said, I'm not meaning to mandate you to particularly deal with the
>> bridge part of the setup, not the least because I consider bogus what we
>> have. But you should at least mention in the description what you leave
>> untouched (and hence dissimilar to port-based handling).
>>
>> As to rejecting invalid combinations of sub-options: See e.g. the dev_set
>> variable in parse_namevalue_pairs(). That's a wee attempt to go in the
>> intended direction.
> 
> That makes sense with the current code shape. At some point IMO it's
> worth having an option to choose which PCI device to use, also for
> MMIO-based cards, but I don't have a need for this feature right now.

Well, in a very limited way this is already possible - see pci_uart_config()'s
"idx" parameter. The primary thing needed is extending ns16550_com[] to more
than two entries, or introducing a suitable level of indirection.

Jan

