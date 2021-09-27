Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CBD4191F3
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 12:04:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196634.349555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUnUN-0002IE-Ef; Mon, 27 Sep 2021 10:03:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196634.349555; Mon, 27 Sep 2021 10:03:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUnUN-0002Fc-BE; Mon, 27 Sep 2021 10:03:59 +0000
Received: by outflank-mailman (input) for mailman id 196634;
 Mon, 27 Sep 2021 10:03:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xtCR=OR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mUnUL-0002FW-IQ
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 10:03:57 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1af06e13-db75-4ea5-8b2f-1f183528c458;
 Mon, 27 Sep 2021 10:03:56 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-6elVGHwmMoOOsWz9khq24w-1; Mon, 27 Sep 2021 12:03:53 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3118.eurprd04.prod.outlook.com (2603:10a6:802:a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Mon, 27 Sep
 2021 10:03:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 10:03:51 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0071.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.10 via Frontend Transport; Mon, 27 Sep 2021 10:03:50 +0000
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
X-Inumbo-ID: 1af06e13-db75-4ea5-8b2f-1f183528c458
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632737035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JYRPyskItNKUUBpdGX7fZkaIYIjBrv5rwp9aY6ntDVI=;
	b=RSEWWU4zzLZZE96XVV+vDyQnlfhZFRIat9BvDYaNQUbzSpF+HrToavD5uArX7nM9gAvfHS
	vEmrB5WzQU604kFGrQYj5066NZ3IkmEBoJjIfmrqWCHxEXqUm4OtZYVLnX+yi8T0umDL1R
	Eo4YJQ76WHWxzJIwlJR/mL8QkAtpFe4=
X-MC-Unique: 6elVGHwmMoOOsWz9khq24w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZ7h5QuUlnjq5y/3D0u5JvgJP7wQL62YgGAEnf7SgNjZ0unBqe9A9S3k5sWkMQS0YctEMqtVZsyJwpJwhTwEHeyVXkdsGVr9MuuFn1qkPMa6lMhLwWO1eleUQ/0cgR+6EChBBiAPg3B+ykuh7d6+Bb7yofIDqZl/H6et3JT94g4EoONUHGDyTsFHz6vmSKwkBXigcJBAEDbqJSw9asNlWdmtH0NhhB51++fgIWZrwyHybxmn1+4q+wpsMYjcO58Jn5PwnUzewtxyfvKTunBxp5qiEGZPZciSH0R0mfC78ePHQfdypMGR1heZt5Ya3qPjwyu68BazYORD948SzxvO5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=JYRPyskItNKUUBpdGX7fZkaIYIjBrv5rwp9aY6ntDVI=;
 b=Bi75LK4LhhxRCOmNxozkhBnsf3WZEcwhgZQIeBcNY8+gJYvyziaLnCo4MFeNF/YouJC291wyHGarl07gM3W0fkI+knRVD+gCRzWCGIWmrsnIyf8aNAUpWUH/5e04QDhK3K4dQqnfZfAt+T1qZjEHAKv6JlWoUdwBY7Rlmci8N7FaWegHBTOmSHBUaiAO+/tf+gAI/pTjmiU/L4rofAa6DCZprHdoXt3RzJ6wDshx/XYdr4eVWSbmVznDTo/oARbySj2IPOBmdnQQLszEzugpAgFpq0sYH/pjCLhh5/ozVgQtdH2f0VvBdvV1INXT6ISZo5NQOXo07PPsEgTx53iIDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v3] xen: rework `checkpolicy` detection when using
 "randconfig"
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210908111727.440265-1-anthony.perard@citrix.com>
 <bb40484f-fbfb-a206-fa98-0e927f5398fa@suse.com> <YVGS9K1XqNpyxAxe@perard>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ed0f7470-69f4-f1bd-50bf-fea19fbbe535@suse.com>
Date: Mon, 27 Sep 2021 12:03:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YVGS9K1XqNpyxAxe@perard>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63a2a16b-8d4f-4c80-ebd5-08d9819e1b56
X-MS-TrafficTypeDiagnostic: VI1PR04MB3118:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB31184B18555649A1FDAE69D0B3A79@VI1PR04MB3118.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YZsQ4tmR4SZTFV5QG/1D9R/hD5jSzqk4Z9oItS2xinlaCAQ4QEUTd5GLP6X0miSkRT0ZS1u8+zU4H/eowjvfeQJai6LyBSef6NjzpvSSJIWp5hCD2BMC583k33uCXatQ8fkB/cYePAqGd9k3OdSlGp/J22E1EUkshLue92uWL99j5NduVizvJ0MnVgArGGKDOS0ERuKgGlSvdk7yiQui0XkcfLXJraD/oApMkUO27uaEAVAuc9mdJip6x62QRQLxIAJRLEUGEXR+j1ootWrhd/AFYWWiF9q3rRfI51wpM+jw8Yd3h6Zb7eBoMH6MSRacUZWu18+oLSY9ZeSwu2hxz0RsuLnw+JY0WSrPRYMFkPouTD3ft0EXymRJc4p/hxzF+g+RkQ+Br5pBnMhB0P4pk8MGePdoV8Ylkb5KDS7es7DYljrEhFpRJ7MaPXniAzjdr5bNjvTRzRHmTxpd1jt8vI4EF3iXEPUQ1HjMB95UknGsc1J30u7JUzgT5VbRdPmr5AUTX+5OJjZCdzd+qMF8GlEep1ky7/PBbRRZADuWbJdlKLHDlV4aMfUWByZdthRqaSFb2zP4Y3GnRtE8/u4cs4V+pKk1k5+sVejM0M+a3KCc4W95D7F/nfk9Mf+8HxUBvjOPaCpvxmYNyqEgaX2172R6ildkz3xI+ZvD85aBqQFgoWKfXddjQKJeQm7MrBeFGgXgtm+GtNjoQ0Wj2VnG6B+RSNm3HApCCxI2R0z6tnEMh2ptloJFtADIVftCNjDXLBA1mtsa8y+inlsPw1aDpQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(956004)(6916009)(16576012)(83380400001)(31686004)(53546011)(6486002)(2616005)(26005)(186003)(4326008)(8936002)(38100700002)(316002)(5660300002)(508600001)(2906002)(36756003)(66476007)(66556008)(66946007)(8676002)(86362001)(31696002)(81973001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDZJQXhKUVNDdERtWnN3ckUxdllleUZyYmdvT1EySlhlcWlpR3J1Z2hmNGpI?=
 =?utf-8?B?dWFYOWFrWS9KNnhqUkh2ZkwvWVBEZ3QrWTFDV3BZUHEwUDNvamRiREpxaElQ?=
 =?utf-8?B?S1FSemU2bU5YZzlGb2tUNno4R0ZCSmp3QU5zUEJqVEtjWUI0b0JzcjRPV1Rh?=
 =?utf-8?B?bHd5TWdaZUFpcHc5NVBJQnQrY1ZQbDQwOFZ2aUF2OXlNOGM3TUNhUlgyY053?=
 =?utf-8?B?eEFjYkpxNllwUC95Z1crTGV2cjdzdnRrc3JGVERpWmEwYU9HWmdXSHRtNlgz?=
 =?utf-8?B?aEl2djJnUWdwNk82T2N4RHlpaG0xR2F1UVQ4YjhqL0lVaWN5aTBNNHR1bmt4?=
 =?utf-8?B?U3dNSVpKOHZLR1RCLzd4N3NWdXVSZStLWTVLcEkxQ3RUSHQ5TTVUMEpabk1Y?=
 =?utf-8?B?ck8reFFHa0FRUFYxYi9qdXJDc3k3bEZHT1RMZjFBaUdPczBQd0NxcHl4UmFL?=
 =?utf-8?B?cGpySFkxeEo2UDJHUWdkOVVnd0tNUC83RTkxZlNtVDR1Y2RqYmNvaitVb3hk?=
 =?utf-8?B?ck82SGg4MUdLenZGK1JiYndpVEpSSmF1eHlLMVJsRXl3S1czd0g4WlJycGJw?=
 =?utf-8?B?cTJlWTZKSExOcHQzVlRMVkwwVGorSlVpMDg5WTNtUGM3K0J4TzRpSWJxMFdu?=
 =?utf-8?B?TkFxV2UzUkRGdlNSKys4TGRueVFvYzg0WG83SVRaTHNNckw5dlJpMlFpd0Yx?=
 =?utf-8?B?ZjdxQW9XUGNPWVdXNU90Q0RJdzBEL1RHOHc1RE8xL3FIY1RWMUJlazZuTVha?=
 =?utf-8?B?UW5UL0RLVG5wd2J3b3BiZTA3TmtGTXRVVGVBUWEzSmFNTDZ6NEt5MlRxU2p4?=
 =?utf-8?B?QmlpeVpIUmNCVGZyV2tXMmh5U3Q5NDZ4RkZybFg3Um5VZy9CMTcvWDFKUVgy?=
 =?utf-8?B?MVBCcWNJanJ1ZFZHdDYySUFJZ3o5dkF3cjhoTytoOGNaa3hnelc3Vk5VbGhO?=
 =?utf-8?B?MzdrMXB6aVY5cURKaGowZlFSekordmJsTm8vRjRnWHk4V0J0dG16cnVHWnpn?=
 =?utf-8?B?ejVMT2luMzkxS1d3WUJzY3lnV1g5akwxaWdhL05xUk1MR1R2aUtjOEdvb2oy?=
 =?utf-8?B?MzJkYTFQNnRvR0JmWit4NEtBYnM1elJJRENWdThXWWphZkhndU9XK1E5VTYy?=
 =?utf-8?B?SUJCNlZVbmJSQ3FxTzlhdCtJekl4TGY1ZXE0cDRXbHdWZ1NIOEZpRW02MWpp?=
 =?utf-8?B?aUVzVkg0SGJtaFNPRm1mQ25VQmFYUzJNSDFNMkNmRDdTWHUwMmluVEk0ZTgz?=
 =?utf-8?B?K2dYYmpXQ2NCVDJ2NWFiVmtZZG4wRDYyNHloMmNySS80MXpHMXRZMzdrMmN1?=
 =?utf-8?B?anYyTXR6YytBbkRWY0RCQ01IZnozTFloZFl5WVNQK3h0V2gwc0lmd0NNUFRk?=
 =?utf-8?B?cmo5cWxrUEl3TkI5dXZMTXNxWFhHU09Od1JQeUtNSVlzOWxaaTc4OTRqSXc2?=
 =?utf-8?B?em9qWjlBRTMyeWQ2RkswSm5oY052OGdQTklZVW1LNyt4QzhQS1kxUzBWL3BW?=
 =?utf-8?B?OExDaUVrMWlXNGQzNFpMTE9IVE5TbCt3eXlLSS93VGoxbkJWcTl6Rzh6R2Ux?=
 =?utf-8?B?b0dzZFRxUlZPdmFTZW9KTldYYVlHRHZtYjNvOW5GMnNkdmo4NFNnSmlLZk1o?=
 =?utf-8?B?aDIyN0lqVGw4QkxyV1o1REJvcXBjcTF0d0RqeUFzYU1ONDF5RmJ0OHlPakdh?=
 =?utf-8?B?NEVIU05GbkM0MlRMZEhRcVdpQ0RnaUV0anlOSmwzcjc1OC9RVlJnTFN0aWkx?=
 =?utf-8?Q?6yT9C9a2zpKXswmWW9kMb7GYkFhGxTUlgxbV5m6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63a2a16b-8d4f-4c80-ebd5-08d9819e1b56
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 10:03:51.4082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zEoSPFpa/nsCEe6kJwK0IGDA1min9i04ybpSwB7JbArC8zllw+VNS05HVskxHBr9agS4IMxDKqx7Lu6gI9kQ4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3118

On 27.09.2021 11:46, Anthony PERARD wrote:
> On Thu, Sep 16, 2021 at 05:34:00PM +0200, Jan Beulich wrote:
>> On 08.09.2021 13:17, Anthony PERARD wrote:
>>> @@ -189,14 +193,24 @@ ifeq ($(config-build),y)
>>>  # *config targets only - make sure prerequisites are updated, and descend
>>>  # in tools/kconfig to make the *config target
>>>  
>>> +# Create a file for KCONFIG_ALLCONFIG which depends on the environment.
>>> +# This will be use by kconfig targets allyesconfig/allmodconfig/allnoconfig/randconfig
>>> +filechk_kconfig_allconfig = \
>>> +    $(if $(findstring n,$(HAS_CHECKPOLICY)),echo 'CONFIG_XSM_FLASK_POLICY=n';) \
>>> +    $(if $(KCONFIG_ALLCONFIG), cat $(KCONFIG_ALLCONFIG), :)
>>
>> Nit: It would be nice if you were consistent with the blanks after
>> commas in $(if ...). Personally I'm also considering $(if ...)s the
>> more difficult to follow the longer they are. Hence for the 2nd one
>> I wonder whether
>>
>>     $(if $(KCONFIG_ALLCONFIG),cat,:) $(KCONFIG_ALLCONFIG)
>>
>> wouldn't be easier to read.
> 
> How about:
> 
>     $(if $(KCONFIG_ALLCONFIG), cat $(KCONFIG_ALLCONFIG);) \
>     :
> 
> .. instead, as that would be more consistent with the previous line,
> that is there would be only one branch to the $(if ) and no else, and
> thus probably easier to read.

Oh, sure, even better if that works.

>>> +.allconfig.tmp: FORCE
>>> +	set -e; { $(call filechk_kconfig_allconfig); } > $@
>>
>> Is there a particular reason for the .tmp suffix?
> 
> Yes, .*.tmp are already ignored via .gitignore.

I see. Could you add two words to the description saying so? Or
maybe even just a post-commit-message remark would do.

Jan


