Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC504CF2BC
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 08:39:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.285673.484911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nR7xU-0001ZH-4c; Mon, 07 Mar 2022 07:39:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 285673.484911; Mon, 07 Mar 2022 07:39:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nR7xT-0001WB-Vt; Mon, 07 Mar 2022 07:39:07 +0000
Received: by outflank-mailman (input) for mailman id 285673;
 Mon, 07 Mar 2022 07:39:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XxC1=TS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nR7xR-0001Vz-U3
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 07:39:05 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9ec8c77-9de9-11ec-8539-5f4723681683;
 Mon, 07 Mar 2022 08:39:04 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-gSzP6-RWOHm0eA4anPkE8w-1; Mon, 07 Mar 2022 08:39:03 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB7PR04MB5068.eurprd04.prod.outlook.com (2603:10a6:10:14::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Mon, 7 Mar
 2022 07:39:02 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 07:39:02 +0000
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
X-Inumbo-ID: a9ec8c77-9de9-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646638744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+A6exbRyakH8VBMY1Lm+YRC0U2Pe4ZMpXQkghKUaZ8c=;
	b=IoCDRoDI2CbGJynLeI0MWS9Njs5Oo2xZcXBRrsEN+NEvnYrBpcGCMSUHdVjx5IEBBodDGt
	xzkOtnXlUIKacxovG6coW2qwCiA2J2Iy7ArD1pay6YSy2XBSOxxDVPNpwHnZbVze1Dwd+B
	DdnRtc84VJmXKC3X4WV7Xu2zP8xdvdg=
X-MC-Unique: gSzP6-RWOHm0eA4anPkE8w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hq1qm8mTPxZ9yeWl0+QktU9my/TORkbo/VINNPh6VPvikpWUkX4Xw0Y6bo940L7+K1rDbfhmtqqHxXtneh8Dfz6he+9cYSBYoDj6GCf011vhsCiNKdCeqoUQRWRXwqQW/OPnUYNcE75HtZEDNdcHhYGpXe73KHqQrk/F9R0Z+BqUMuwBL83CPt9ME2TvsoFKvec8UBBcVFWOb0l3VOU/RUPyFuvPPtDXOEUC6ZgS7q9Uzd/Qg29rlGOasBhKOctJg/dqp4p+Bcge6cPFE49i/xU3wGI3lXdKm60jlETAl6v3s0YRTWJucq1xPczlw8mpTf3Q69Dkw/by7sRN/LI7Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+A6exbRyakH8VBMY1Lm+YRC0U2Pe4ZMpXQkghKUaZ8c=;
 b=HNTbySm3OBoCL6J2MoOF2qs/kSIyNA/EdqZJMSNtpJf1/yqxEHMgcYcmpZzCrCg3D0C0kDnrM0JR5mmqnWcMMqjJY+1ZNy7m+88vbp0r9ydRs5AiPby6YmibIymxCa+zuh4H67eqIcDW5GYCmF9VaQ7C4UxHmn8PzZxEu+sEHaHbhvEd66sY8MUVvDD5tXzYlA+exTT4h4JzBghOF1D7dLpztvWcmwhVmTGJc7FskiU3dcKvt2kYv7ntnmSrJJ+VIFbuC5/Km8eZmDcLubLS/nSHRhDGdW+BxPvalENGwiDk0buJpOn8v08cueH+iH5UqE/kaWYngHqgK6f1YzkfPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <07507a77-168a-9387-1f5a-11f00de587f6@suse.com>
Date: Mon, 7 Mar 2022 08:39:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 28/36] xen/arm: introduce xen_map_text_rw
Content-Language: en-US
To: Marco Solieri <marco.solieri@minervasys.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@unimore.it>,
 Andrea Bastoni <andrea.bastoni@minervasys.tech>,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 xen-devel@lists.xenproject.org
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
 <20220304174701.1453977-29-marco.solieri@minervasys.tech>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220304174701.1453977-29-marco.solieri@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0051.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e80160f-7e99-4620-60a3-08da000d8ccb
X-MS-TrafficTypeDiagnostic: DB7PR04MB5068:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB5068DF66CBCE6B714B3F7C6FB3089@DB7PR04MB5068.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sbMZxic7Q4Tz16VOV4Buim5euFQCWFjS8PyqAbYaWP1oFNzNVrfIESWMIyGtQvU54uup/Q2KlW+/VAH9fwQpQfvAbZi+9Sojd0EOouoj5Ognyt0lFcrCoLBDDYfBNG9oXhTxFsbme5+KQkpkSKZgJEThtoU8cyGUpAU8XrC44/LfSGohDwK/Ydbuoc6GI1/DZWOGvNJ+crmV/x0pKTcOBUAdbPY+slma7Z4k0LFIkTSijElvW+BvUYqSIcQ+eQ3JLzKX3eZC75vELyDtvtwbO6jlcBvknxclblM+b4nPVRSe87s3w2C7MNfqwxeKbjcAglehPw6m5lc/mMS9O9SouzqCe7phqvRxL5IDx4sC8gdeB3fuIGleAnLz9pEMk54wLo8RSwgoP5wwJzBHQxzbXGUHEraxqtgXtBKYdzY2wYD0kkTswu2NSlejgvIx8HShFSlScvppCuQHDOiRJmr3hVDU8/rEhQlt2WelTYMpXttLgdYTsyHmR7ijCjuDvOhXp/5eOFL6JxJkEiGOKF7qHo3ZmI7PxQwxKKoNpxGcKAYehIal2YhvMmg2+M4MAnh9VAQ57J9z629h4o6XDeuNJiNwLjxBP0jkwJT7VBJtcqrLw18EICPPQ2RLFEdT3DTWxP2Ayz6f2aCTtSAUxW6zmpFGvFkDcnZ+vMh3qQsOYNz2i+qCRvKle1JEuHaMrNiVSoZc4g/Z/Tvabp1iwFPFlHyZHMf4TwhnJIG2PbKLGYo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(54906003)(86362001)(316002)(38100700002)(31686004)(53546011)(2906002)(26005)(66476007)(66556008)(8676002)(31696002)(4326008)(2616005)(186003)(5660300002)(4744005)(7416002)(8936002)(36756003)(6486002)(508600001)(66946007)(6506007)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmIwY1M2RXpyVENxWUFlcm50dC9yNnlNb1h4MUZuRzJ4MS93Vkl0WXpZQ2lw?=
 =?utf-8?B?c0ZkQ1ZaWmZ0VXl3bXUvK2pSRERNSWtzT251WW1iQWpPM3Q5aTU2NXhZZXBX?=
 =?utf-8?B?WENxSkFXNmduTUFWMnh2M3QzWmVhVjlsT0NXMXNlZTMvTmYwVms4MVgxT3Zm?=
 =?utf-8?B?cHJ5UytZOHhnRm1XVzdKU1NOZ3VqMVAvT09YcTEwcFNJdkdYa1FvVjVDOHhu?=
 =?utf-8?B?cHBaU0dEa2ZFdXBnNkpCS2VXbmxoMXlZbHVScTIvMUlzbWxHYWo0bnRZYnNh?=
 =?utf-8?B?NnNrcENuVVdrdlF1bFFZaWtOZERYaTNzb04zekwwZEJrbWp0NUc3U3JCMzlR?=
 =?utf-8?B?U1BpbW4vSjRaaHZOSWZBQnIvOXY4U05JbVBYMGRuQVRtV2x2TklaMHVLU1RI?=
 =?utf-8?B?VkFFQmlKNEc3TmlOWi8wcXFpNzNQRk1ObG45aVF1N1B2UlRRejQxN01aMjBE?=
 =?utf-8?B?TlR6UWpaYlFETndVZ2JLNlNJWnFLdEpvNWZFaTRHeE5JaElRdmlCYk9NTi8w?=
 =?utf-8?B?OXpXVlVXNUc4ZGpDRit5UlBkYUxzZFJkaFFkMGtmRDRuc0dRa3YvWks3dUh4?=
 =?utf-8?B?NFZHKzIxejBjTTZyeG5GOXhwRTB3SnRGUXpWN3BJT0F5TXR4L052VTZRVm5G?=
 =?utf-8?B?Kzc5cHVkRHBvaWlGOFkxem5JZjgrRWxlcEpYVkVwOWgyckN6eEFwMkRnUDE0?=
 =?utf-8?B?RWhwMHZubXdRZFlTODV4MGJRT3NzYit1RHo5U0FtQTdTZUxISnNneW5jdGxZ?=
 =?utf-8?B?VjZBcGowWnlISmg0ZGIrcHByZmQ4TDRPek94TmFJRFVRODhsWFd6Z1RvNkJS?=
 =?utf-8?B?Q1lmb2dveGtkeVB0RUNuUjJDNVJPSVp3YWx6eE5hMndIb1UxcWtKZ1lHK1NT?=
 =?utf-8?B?aG9PbHFCbytqaFo0cWFyUk9leHA4emVYQkdEdVZvaW43OTBtNXk2RGJyWjRW?=
 =?utf-8?B?dVd2bmdLcGMvRnZKeUFXMEVhUnQyY2JjRU5BbS80akE5K1dMb1ZjSjJkT3I4?=
 =?utf-8?B?LzExKzhSdDRBSDRFeXF1TTRRYVBna2gvZjM5WGhUQ2t6M082a2hZNXpldVNN?=
 =?utf-8?B?RDFNeHVXN2RqeHh5Z0JDcFRuM1VBdWxJaldrRWNvcllpeHFGNkNQa1d1c0sx?=
 =?utf-8?B?czk3cGtSNGxtMWJocnhMMmFrSjNOVEpvUE5CZ2tWbmo4K3VGcU1pZlUyZFQ0?=
 =?utf-8?B?RzRZUDZiNkI3WEgxSnFQbkxLcUpYNWJYamVqblhsbDk1MnVQNlpvR3lNYkh1?=
 =?utf-8?B?ZUlwVW1VaEVjYlRiaFdUZGJRYnROWFVkNUl4M0lJQzRsRDVQZllVclJ0dnVX?=
 =?utf-8?B?VUhjWTRkaXdadlY5TUhiVEdjUXJNcll1bVJsMm8yWTZLbXAyRUtGYk9EOEpC?=
 =?utf-8?B?b0ROSEh5d2VkMjNTTU4wdWVmOXk2ZXNSYUI1L3dxblVGdUMrUHdINVBwOVhI?=
 =?utf-8?B?Z1ZLZjk4OWpKdWxCYWxjQnE3RWxtbXNqQU1PTWZwSVFqdS9FZ0RjWHpvUW54?=
 =?utf-8?B?RXBOOUVlZ0xMN29YZklPVEpmNG5HVkhGMUFITlhnOFZWV0ZhY2VZQkhZa29C?=
 =?utf-8?B?dnB5N1VtN2FzWHQ3SHprSHNya1h5TWtqZ0F5TEpvSkY5c2V2b0ladkc2MVFj?=
 =?utf-8?B?dUhRSUtOWUJMWTgzNkx4NE9ORHp2U09RNFc0UjZHblkxRnA5S1lxTkFzR3NC?=
 =?utf-8?B?VTllUCtRbjlFOEF0eUM2ajBWM1RTNFhzSFhtdUxTRFZPeFB0b1lhOFNzYmZw?=
 =?utf-8?B?YjZiMk01MmMzVUo2Z0VVOStQQWwyQ3dIN2oyVS9zLytleXRya0oxYXBuTm9H?=
 =?utf-8?B?ZEJWeHBVT1ExcVB3QWpyZjlndTY1b01icXUydVlDN0p3SmhneXdlaUpKbFRZ?=
 =?utf-8?B?MUlpZHdnNEcyektyNlozM09obXRyWCtaK3FnbzNBSmNJUXFyNzNnbkhjeGJS?=
 =?utf-8?B?NnpuRTVKNTZrUUhmRDVSYys3OUR5UVQxMWoxTGFwaUVHOFRNZjhma1o2NC8v?=
 =?utf-8?B?dGd5dUoyMWM1Y2tLb1p1ZklDSWx3NW5WazRCVlhjZHdmZVhRRmF6SnNac0t6?=
 =?utf-8?B?aE1yNlQ4TnloQ05ZK3B5YWw1YThxdU1YeEFMSGxFWWpHRTVCZkU5NWlsWEx6?=
 =?utf-8?B?Z2JxQzNRakE4UUdsUUNvUnNSVlRML2k0UVNBbmhvbEgvRDR1bStaWTRsWmpS?=
 =?utf-8?Q?a080/3D31lu6ciimDMs+G78=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e80160f-7e99-4620-60a3-08da000d8ccb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 07:39:02.4466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0wUYobbZGEOypd3PwD9UgTwBuXb8af0kwUASio0JzpQblkgbE7aD/7TQJRnqI7gPMOGqqpQIA2WTHHZDTzlrYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5068

On 04.03.2022 18:46, Marco Solieri wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> Introduce two new arm specific functions to temporarily map/unmap the
> Xen text read-write (the Xen text is mapped read-only by default by
> setup_pagetables): xen_map_text_rw and xen_unmap_text_rw.
> 
> There is only one caller in the alternative framework.
> 
> The non-colored implementation simply uses __vmap to do the mapping. In
> other words, there are no changes to the non-colored case.
> 
> The colored implementation calculates Xen text physical addresses
> appropriately, according to the coloring configuration.
> 
> Export vm_alloc because it is needed by the colored implementation of
> xen_map_text_rw.

I'm afraid I view vm_alloc() as strictly an internal function to
vmap.c. Even livepatching infrastructure has got away without making
it non-static.

Jan


