Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FA34019D2
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 12:30:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179601.325951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNBtJ-0002EN-1l; Mon, 06 Sep 2021 10:30:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179601.325951; Mon, 06 Sep 2021 10:30:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNBtI-0002CI-UT; Mon, 06 Sep 2021 10:30:16 +0000
Received: by outflank-mailman (input) for mailman id 179601;
 Mon, 06 Sep 2021 10:30:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNBtH-0002CC-PY
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 10:30:15 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 06a6541f-ce3f-4f1a-a113-55bf8351e0b5;
 Mon, 06 Sep 2021 10:30:14 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-8-r2swLOZBMM-JLY12322v_A-1;
 Mon, 06 Sep 2021 12:30:12 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5470.eurprd04.prod.outlook.com (2603:10a6:803:d6::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Mon, 6 Sep
 2021 10:30:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 10:30:10 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2P264CA0046.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Mon, 6 Sep 2021 10:30:09 +0000
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
X-Inumbo-ID: 06a6541f-ce3f-4f1a-a113-55bf8351e0b5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630924213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ld/f2dx1cE58n/YMzJDEy0DH6VXjkwcYdaqKpjFUdSg=;
	b=Eb+7ryE+zak+472LJ4pLf1WaaZXc1mAsJDvOOXyt+SNYN1E9i1evQ+HmxuqTtR3XbFBb18
	cLjySN9krS3zASj6735P/9pHpAY4FpN81SBcI5jqClT7MTxD3a+NpFmke5BZlN9kgByb/a
	V5DJdWQjMWDfuVXINnsGbYnJMWJeE9s=
X-MC-Unique: r2swLOZBMM-JLY12322v_A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HKLLUw5OGe9ljUCFPEp1GmutQSR6e5A1oJ6vFxbMgk67g3EUht+39Im0yr5dECSdSH7C0dmCluOojrp4Z3pQl+FqM3mKUA59Iq0+NS7eiS6IYBh7lLnboKG+g/vU/D5YU2ADztMfZ0B8IVWjOgv8DMHuS8QFijFsC+6eXO5apgOWzj7vwC5wfhM6BQureYg9r4MjElcsa0zLypfa7EdVFylar5R5vnu1dwpLHfd4B2A7wsvrjKmetmFErKMqqSe/fMtBpn7FvRXKiuOAYf2YnRrcAQdSoF5p9q1ItA4aspXKdJVPlINvoXySROIawgTm13TkSy+ZAn26bTRHGK8aIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Ld/f2dx1cE58n/YMzJDEy0DH6VXjkwcYdaqKpjFUdSg=;
 b=R1PjiE7mdimW/MIqkvFGXBxs52KySlIne9ltnszRY4jj9trvpkYO85rnhuc8x3zZBra4Gnc2pxv4zH5F0vfOAzPICGMRgs8mltWeQI80s0y0Tz9t0yCyGQqZxgGxQtAk8upLIChiREoZuvOVPMr5zcmVoDrx6vK26p5fX87JDIqhAJp71icL0dWCDWZbLSB8f3/ZiD6SwzWXdvUr6j06ngc1tNBwHQu4/i87Agc65pAr00E4ZNpgiSPDpxBcg6a49sBUlLv7UrUVElZi6FCTW5QtENf6+utHYcFUiSLt6A0NJzdaHK4+13gtWswRRTn53bXDH1wLBErFsS311LqfHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 01/51] build: introduce cpp_flags macro
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-2-anthony.perard@citrix.com>
 <ba3cfb06-1d89-ff62-1012-6edc2a9c5259@suse.com> <YTXoCQ3SSvN4eU/C@perard>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <280c5579-ee62-ed36-1f08-58fe5b9ca34f@suse.com>
Date: Mon, 6 Sep 2021 12:30:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <YTXoCQ3SSvN4eU/C@perard>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR2P264CA0046.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b42c405e-6058-4ebf-6842-08d971214d69
X-MS-TrafficTypeDiagnostic: VI1PR04MB5470:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5470D9706271C37D03730CEEB3D29@VI1PR04MB5470.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	H5tffAjQbLpV02jAOP50qHOcz4dp92GBmz8+6WBT0agGzkjyP8RzNn3o2qxZbsZZ8hSeYt/gZuUNL128utTmaczxJ5qWFaWGil6J4gkREMv4oXfdxm1DQ/9YopVQ1FKu9vaKWMTOv0E4YRZ1D0K+/EYo+2kscBitq8P6f5eOtpCZvjRdrSYwNgxg+L9OzEKUgC4Vu8theYoIgbFLjBM9mbUF34vG5pRtM974eisM+CapuX0nUwLRAVsXPxJndQPSImGKzbed+HtdEPV1IKH40oS/1EXtlajl6v4EVm2qbVyUhr157AKFUI7Izmf8mO5NNELf/04z2AXsBsgOPRqnH0CMqBKNNONlPIAG9FPBbOu2M+ZBuEsi5ec2CUItXhOqmfe2mwEylLkxvCmi4XzZ01Miw2fq0+NXEO6GUJw8LcqGLeFVV/uSmQk/dnGXK+JWe6sZcNjpqi8SKgSWyH395rmxn+2veUiepAGm4pt4C/O5cdcwdS0T7aJtcT3bE+qflZQOuqn3AJuOHyjV/sMqocMy//3MCP9hxbWWE26AH3x6N7c/Sf4XUIAtJxT2utyhwGooFH3g8EvDZeLP1iwHYcD3DH2GKkC32l6WHAFtwN4qteoLTWQvxBKeSDgQGBmrI5Fr/rUEyR/0D2rWyVjpXn6D7Hz65qCfL1l+G6r67gZLIQr8b59JSKxCaAeYgd8lE6EyPMpTaLykpgJNUdqhKdxb6jueQ4NzrV6cL+q/z9I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(39860400002)(366004)(346002)(396003)(66476007)(66556008)(54906003)(478600001)(86362001)(186003)(7416002)(8936002)(956004)(36756003)(53546011)(31696002)(4326008)(2616005)(16576012)(8676002)(2906002)(316002)(66946007)(38100700002)(6916009)(31686004)(6486002)(83380400001)(26005)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFFKK1hlV2Nxc3lZMGFBM2lkZGhHa0xmcU9SZ2JLK0RBL0xURFVlYWFKYVFt?=
 =?utf-8?B?VlhURHA4Mk9pMTRkRUxMbzIrY3ZUVDZXcTZKL3BRaVo2b2x5dldjZEUwYUpw?=
 =?utf-8?B?ZTBlKzVVdndhNzcvVzNUZUtXa21YSnVneFNRZ2xRSXhDQkJvT2d3Q1dBdjU0?=
 =?utf-8?B?ZlgwOHJ1ZUYyR3ZhYVg1TnFtMXp6aW9uYm1RZUZSZHRYL2paLzFCdEtDQVBD?=
 =?utf-8?B?MXE0dkY5SnJUdG05dTExZEJ1RGk5ZGVrSkNYVC9jQTZnbGhpRXMyUDZBQm15?=
 =?utf-8?B?SkQvVkcvZWUzMmtQNU8wN2VUUUd3ZUw1NzB1NFFXQ0QxOVAvN2hDbHFvTXNX?=
 =?utf-8?B?YVhYeFdKMXFJd29uRFVuckl6RENrdHRXVzFxbWxiYTlzNksyYm5LVndRay9l?=
 =?utf-8?B?ZWVaa2pJYTBMU1BySkttYTJDS0Y3bTVKd2R4b3RaMHpCVDFVbTlOcU4yTXA0?=
 =?utf-8?B?NGRHcnpkTjNQR01RekMxMEh2M2N1Mitpa0RQMytvMU95M1FGcjVjWFBHWkJJ?=
 =?utf-8?B?RldWdG16UFc1K2Eza2JheENIOUVMUU5rTHNLTldjK1pET2hHREhCcHZxS3k0?=
 =?utf-8?B?Q2pWclZzcGtRSDgydFZ0amhMVWxvTU90d2V0TVlxSEptR1VQODNVQWpPenZX?=
 =?utf-8?B?WTFPRCtKQmgzYUZSR2k1Tzk2cnNUN2QxNmdlSjVOTEhFSHNNZWhoU0RlUzhx?=
 =?utf-8?B?SlhOVk9ocjlqeVNjK0JEd28rVUZrWmZudGszU0E0V0JVQnZoaEhEUGpzSjJG?=
 =?utf-8?B?LzBkSUlJdkdWc2dWL1lZbVBOSDllRi9nOHR1Ty9qSnJwcHZVak1aTXhQQkM1?=
 =?utf-8?B?Ym1mSmJXbmNXakxTRDBRQWM1SlpRUEREaGdMem5WWXBNTnZXdTFNbjdNY2l5?=
 =?utf-8?B?dmNxa1ZLZGx1RWFpTENubVJFNU5mdnVoSXIxcERTdWIxbjdQb2FTYm1HQTl3?=
 =?utf-8?B?NVBxaXFSZ00vMG9NbEIwL1Y4Y1VJVVhOaVAxOXh6ZFc4T2k4czdnYnEwUGhI?=
 =?utf-8?B?bklVcGxWa2w3TThwUTZZaE1EeStWLzVZYkliRjArQWVuWlNjSlAxcGFQMnZk?=
 =?utf-8?B?dGlHc2UrSVB6akd6ZThmOU1LRUpqUEZJelVjcWM2eUVDakNqREc5aTQ5VC9K?=
 =?utf-8?B?cXZpMWRNWWN4RUoxNXlqVTIyZnFFaFZOWWVQOHBzY04xT2hXblNNZ05QdE9k?=
 =?utf-8?B?SVdtd291NnNrYmN4MlptK3JVaDdncXhLemppK2c3YjBTemZBaFg2RkZKQlVC?=
 =?utf-8?B?czB1T3ZVMFRMVkkvbzlKdnUzR1d2T3BOQnpvMmM4TWRCNFd1dVk0TE1HMTFL?=
 =?utf-8?B?UWtmd3o2VVRIYjBhMDZla2daR2lnWWpKZ1hjdmhtMFN2Z0liaXBQTlhROStJ?=
 =?utf-8?B?Y1diY1lWMzBIa3k0SVVWZmRKckk2QXAwNTMzdTU3d0hHUHR4S0NyanpQY29D?=
 =?utf-8?B?NE16WlRFN2I1b281Ty9YS3pkOEdhT3k5VHkzMGZsWlJLRHpyNjVGcWNVMHM4?=
 =?utf-8?B?NTkyTHBvTWJ1bmpGcFlTQ2F4dExWM1hPeGdkVFFYTTF3V29aQmx3WHFCVnFl?=
 =?utf-8?B?eGo5MGVkRk92UWlTa0xWZ3VpdlZNVHlxQWpEaW1aUng1d1l6cVRtUFBKeURV?=
 =?utf-8?B?ODNmNHNSalhyVUl1bVpOQThiWGdFK2l3T3UyeHF0VUp3U3hzcXF5TElmL3kz?=
 =?utf-8?B?d3p1SnkyMTh3R2xLTTlqeTRnRjljbk4ra213d2thUGZDdi9RaGEwbnl1T0k5?=
 =?utf-8?Q?Fptj31m2heZSr06CwIGEEUemStvSo8KZth/aBkf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b42c405e-6058-4ebf-6842-08d971214d69
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 10:30:09.7937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YUfEkUo9myD/ZgFwmDA5yc4uNyaYRrGdU14+FmpWeub1gCbRqRFjj4S0/YyTXbINqQoxuwY+UHKpm1km6DP0wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5470

On 06.09.2021 12:06, Anthony PERARD wrote:
> On Thu, Sep 02, 2021 at 12:08:58PM +0200, Jan Beulich wrote:
>> On 24.08.2021 12:49, Anthony PERARD wrote:
>>> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> albeit with a remark:
>>
>>> --- a/xen/Rules.mk
>>> +++ b/xen/Rules.mk
>>> @@ -133,6 +133,9 @@ endif
>>>  # Always build obj-bin files as binary even if they come from C source. 
>>>  $(obj-bin-y): XEN_CFLAGS := $(filter-out -flto,$(XEN_CFLAGS))
>>>  
>>> +# To be use with $(a_flags) or $(c_flags) to produce CPP flags
>>> +cpp_flags = $(filter-out -Wa$(comma)% -flto,$(1))
>>
>> Afaics this has nothing to do with Linux'es cpp_flags, so what we do here
>> is entirely up to us. If this is strictly intended to be used the another
>> macro, wouldn't it make sense to have
>>
>> cpp_flags = $(filter-out -Wa$(comma)% -flto,$($(1)))
>>
>> here and then e.g. ...
>>
>>> @@ -222,13 +225,13 @@ $(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): %.init.o: %.o FORCE
>>>  	$(call if_changed,obj_init_o)
>>>  
>>>  quiet_cmd_cpp_i_c = CPP     $@
>>> -cmd_cpp_i_c = $(CPP) $(filter-out -Wa$(comma)%,$(c_flags)) -MQ $@ -o $@ $<
>>> +cmd_cpp_i_c = $(CPP) $(call cpp_flags,$(c_flags)) -MQ $@ -o $@ $<
>>
>> ... the slightly simpler / easier to read
>>
>> cmd_cpp_i_c = $(CPP) $(call cpp_flags,c_flags) -MQ $@ -o $@ $<
>>
>> here?
> 
> I don't think this is better or simpler. "cpp_flags" don't need to know
> the name of the variable to be useful. I think it is better to know that
> "cpp_flags" act on the value of the variable rather than the variable
> itself, when reading "$(call cpp_flags, $(a_flags))".

Well, yes. This way one could also pass more than just the expansion of
either of these two variables. The thing that made me think of the
alternative is the comment: Would you mind if I inserted "e.g." in there,
to make clear this isn't limited to these two variables?

Jan


