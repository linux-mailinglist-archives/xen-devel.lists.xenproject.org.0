Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9C51B15E1
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 21:26:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQc3U-0008Mz-3K; Mon, 20 Apr 2020 19:26:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=61/n=6E=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jQc3S-0008Mu-CB
 for xen-devel@lists.xen.org; Mon, 20 Apr 2020 19:26:06 +0000
X-Inumbo-ID: c7008584-833c-11ea-83d8-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7008584-833c-11ea-83d8-bc764e2007e4;
 Mon, 20 Apr 2020 19:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587410766;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=EDcqMXALMDZFs73JCUMqOfAEFSoF6ZFBFx9LXx7DcQ4=;
 b=PG1PjNVfZw/mGF3cBFv2NePs+mfIP3yZgMrQV3zh9MWo2D7+TeXT6pxR
 X2ec59jP7sQF+GRJeip0i5VU8Rg287wUDv8vOdv7m/QDYibKVhgv31xrv
 8JlEb9REiMLamKG+xu4REKDbGnAIxq4Rt2eXojM9xxzOUD8ps5h35bPBH 0=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: reWQRjM2UxYwApXmal+vYP/g+hEi5Q3jury8H5z7azhUbZC//XXDeN3RfuYY/qQhFAEtv+HU2C
 54EauKVtl/jF41dzJNLCDevoE5QJPvtr4w/D+CtFsis7Ccy08vudfn281CfakXFIdypHI7N1kh
 HtIr19tO7NjSNtLCPvndswceRz/23btyNRW+pjqZpwH/FSpuEH9DxhdIv5XIXnnueMlyBKzKT+
 MMo8HKUenClgXfUxWZ9mn1cFHpXA9PsXmKFoaG00LYpB2fTc/HMWN/MD8l2F8vDqAFg5Yjs+oF
 IFQ=
X-SBRS: 2.7
X-MesageID: 16209848
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,407,1580792400"; d="scan'208";a="16209848"
Subject: Re: [XTF 2/4] lib: always append CR after LF in vsnprintf()
To: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
References: <20200416094141.65120-1-wipawel@amazon.de>
 <20200416094141.65120-3-wipawel@amazon.de>
 <00549997-7633-a8c2-899a-fbc0b5a45541@citrix.com>
 <A2E046DD-9F85-4C54-9FED-BE240AA71E09@amazon.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <5d319ae1-e244-23bb-d3fa-cbabb739c33c@citrix.com>
Date: Mon, 20 Apr 2020 20:26:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <A2E046DD-9F85-4C54-9FED-BE240AA71E09@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "semelpaul@gmail.com" <semelpaul@gmail.com>, "paul@xen.org" <paul@xen.org>,
 Julien Grall <julien@xen.org>, "Manthey, Norbert" <nmanthey@amazon.de>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16/04/2020 12:36, Wieczorkiewicz, Pawel wrote:
>> Unfortunately, this comes with collateral damage.
>>
>> # ./xtf-runner hvm64 example
>> Executing 'xl create -p tests/example/test-hvm64-example.cfg'
>> Executing 'xl console test-hvm64-example'
>> Executing 'xl unpause test-hvm64-example'
>> --- Xen Test Framework ---
>>
>> Found Xen: 4.14
>>
>> Environment: HVM 64bit (Long mode 4 levels)
>>
>> Hello World
>>
>> Test result: SUCCESS
>>
>>
>> Combined test results:
>> test-hvm64-example                       CRASH
>>
> I never use xtf-runner script to execute tests. I do it the old fashion way:
>
> # xl create -c test-hvm64-example.cfg
> Parsing config from test-hvm64-example.cfg

I presume you mean hvm64-cpuid here, but...

> Guest cpuid information
>                        Native cpuid:
>                                       00000000:ffffffff -> 0000000d:756e6547:6c65746e:49656e69
>                                                                                                 00000001:ffffffff -> 000306e4:00400800:f7ba2203:1fcbfbff
>                                                                                                                                                           00000002:ffffffff -> 76036301:00f0b2ff:00000000:00ca0000
> 00000003:ffffffff -> 00000000:00000000:00000000:00000000
>                                                           00000004:00000000 -> 7c000121:01c0003f:0000003f:00000000
>                                                                                                                     00000004:00000001 -> 7c000122:01c0003f:0000003f:00000000
>                                                                                                                                                                               00000004:00000002 -> 7c000143:01c0003f:000001ff:00000000
>                                                                                                                                                                                                                                         00000004:00000003 -> 7c000163:04c0003f:00004fff:00000006
>  00000004:00000004 -> 00000000:00000000:00000000:00000000
>                                                            00000005:ffffffff -> 00000040:00000040:00000003:00001120
>                                                                                                                      00000006:ffffffff -> 00000077:00000002:00000009:00000000
>                                                                                                                                                                                00000007:00000000 -> 00000000:00000281:00000000:9c000400
>                                                                                                                                                                                                                                          00000008:ffffffff -> 00000000:00000000:00000000:00000000
>   00000009:ffffffff -> 00000000:00000000:00000000:00000000
>                                                             0000000a:ffffffff -> 07300403:00000000:00000000:00000603
>                                                                                                                       0000000b:ffffffff -> 00000000:00000000:00000000:00000000
>                                                                                                                                                                                 0000000c:ffffffff -> 00000000:00000000:00000000:00000000
>                                                                                                                                                                                                                                           0000000d:00000000 -> 00000007:00000240:00000340:00000000
>    0000000d:00000001 -> 00000001:00000000:00000000:00000000
>                                                              0000000d:00000002 -> 00000100:00000240:00000000:00000000
>                                                                                                                        40000000:ffffffff -> 40000005:566e6558:65584d4d:4d4d566e
>                                                                                                                                                                                  40000001:ffffffff -> 0004000b:00000000:00000000:00000000
>                                                                                                                                                                                                                                            40000002:ffffffff -> 00000001:40000000:00000000:00000000
>     40000003:00000000 -> 00000006:00000000:002625a2:00000001
>                                                               40000003:00000001 -> 57b3c4d2:00030755:ccccc210:ffffffff
>                                                                                                                         40000003:00000002 -> 002625a2:00000000:00000000:00000000
>                                                                                                                                                                                   40000004:00000000 -> 0000001c:00000000:00000ac9:00000000
>                                                                                                                                                                                                                                             40000005:ffffffff -> 00000000:00000000:00000000:00000000
>      40000100:ffffffff -> 00000000:00000000:00000000:00000000
>                                                                80000000:ffffffff -> 80000008:00000000:00000000:00000000
>                                                                                                                          80000001:ffffffff -> 00000000:00000000:00000001:2c100800
>                                                                                                                                                                                    80000002:ffffffff -> 20202020:6e492020:286c6574:58202952
>                                                                                                                                                                                                                                              80000003:ffffffff -> 286e6f65:43202952:45205550:36322d35
>       80000004:ffffffff -> 76203037:20402032:30352e32:007a4847
>                                                                 80000005:ffffffff -> 00000000:00000000:00000000:00000000
>                                                                                                                           80000006:ffffffff -> 00000000:00000000:01006040:00000000
>                                                                                                                                                                                     80000007:ffffffff -> 00000000:00000000:00000000:00000000
>                                                                                                                                                                                                                                               80000008:ffffffff -> 0000302e:00001000:00000000:00000000
>      Test result: SUCCESS

... I have reproduced this locally.

However, I'd argue that this it is a bug in xenconsoled rather than
XTF.  In particular, modifying XTF would result in xenconsoled writing
out the logfile with windows line endings, which surely isn't intended.

>>> ---
>>> common/libc/vsnprintf.c | 10 ++++++++++
>>> 1 file changed, 10 insertions(+)
>>>
>>> diff --git a/common/libc/vsnprintf.c b/common/libc/vsnprintf.c
>>> index a49fd30..3202137 100644
>>> --- a/common/libc/vsnprintf.c
>>> +++ b/common/libc/vsnprintf.c
>>> @@ -285,6 +285,16 @@ int vsnprintf(char *buf, size_t size, const char *fmt, va_list args)
>>>         if ( *fmt != '%' )
>>>         {
>>>             PUT(*fmt);
>>> +
>>> +            /*
>>> +             * The '\n' character alone on some terminals is not automatically
>>> +             * converted to LFCR.
>>> +             * The explicit LFCR sequence guarantees proper line by line
>>> +             * formatting in the output.
>>> +             */
>>> +            if ( *fmt == '\n' && str < end )
>>> +                PUT('\r');
>> ... doesn't this end up putting out \n\r ?
> yes, it does

So the one type of line ending which isn't in common use?

~Andrew

