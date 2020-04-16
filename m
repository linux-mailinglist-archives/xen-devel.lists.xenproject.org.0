Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 687281ABF7F
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 13:36:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP2op-0007AS-Dl; Thu, 16 Apr 2020 11:36:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xq2g=6A=amazon.de=prvs=368a07d89=wipawel@srs-us1.protection.inumbo.net>)
 id 1jP2on-0007AN-Tu
 for xen-devel@lists.xen.org; Thu, 16 Apr 2020 11:36:30 +0000
X-Inumbo-ID: 836e2038-7fd6-11ea-9e09-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 836e2038-7fd6-11ea-9e09-bc764e2007e4;
 Thu, 16 Apr 2020 11:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1587036989; x=1618572989;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-id:mime-version:content-transfer-encoding:subject;
 bh=dPngK29NaQQoll/lqE2nCMTHqbTXqmYPy6JDuOY58JY=;
 b=JtGA35tfjSyVcxU5IuxtyLziQuZXSoLJ5ayaSi41mknXzsx2SYUClJHv
 3lWITy9UxFfFFCeCGoSwK7771d+iIrzoxhB3eBD25+7nw8Ocu2VpMgdUu
 me3qxxDs6ffNQd34s2Wbefwo+JN9lZlsLgWJKCWu4tE86UxC3H5VY79c6 k=;
IronPort-SDR: 93YY/2ZoeiPT42XaGaI2NNeR6NJkZTtvzgY/4iXX/qMwjrAA6kIXb+FdFfHZENgV8UwZixYcOw
 l5yuTQloafHw==
X-IronPort-AV: E=Sophos;i="5.72,390,1580774400"; d="scan'208";a="25822943"
Subject: Re: [XTF 2/4] lib: always append CR after LF in vsnprintf()
Thread-Topic: [XTF 2/4] lib: always append CR after LF in vsnprintf()
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-27fb8269.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 16 Apr 2020 11:36:17 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-27fb8269.us-east-1.amazon.com (Postfix) with ESMTPS
 id D77EEA1CF0; Thu, 16 Apr 2020 11:36:15 +0000 (UTC)
Received: from EX13D05EUB002.ant.amazon.com (10.43.166.45) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 16 Apr 2020 11:36:15 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB002.ant.amazon.com (10.43.166.45) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 16 Apr 2020 11:36:14 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1497.006;
 Thu, 16 Apr 2020 11:36:14 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Index: AQHWE9NFbSxUmGmFhkmqadsHpX8TWKh7iTMAgAAVnYA=
Date: Thu, 16 Apr 2020 11:36:14 +0000
Message-ID: <A2E046DD-9F85-4C54-9FED-BE240AA71E09@amazon.com>
References: <20200416094141.65120-1-wipawel@amazon.de>
 <20200416094141.65120-3-wipawel@amazon.de>
 <00549997-7633-a8c2-899a-fbc0b5a45541@citrix.com>
In-Reply-To: <00549997-7633-a8c2-899a-fbc0b5a45541@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.198]
Content-Type: text/plain; charset="us-ascii"
Content-ID: <19DBE9CA9BC8494AB39BDFE7569D8353@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Julien Grall <julien@xen.org>, "paul@xen.org" <paul@xen.org>,
 "semelpaul@gmail.com" <semelpaul@gmail.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, "Wieczorkiewicz,
 Pawel" <wipawel@amazon.de>, "Manthey, Norbert" <nmanthey@amazon.de>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On 16. Apr 2020, at 12:18, Andrew Cooper <andrew.cooper3@citrix.com> wrot=
e:
> =

> CAUTION: This email originated from outside of the organization. Do not c=
lick links or open attachments unless you can confirm the sender and know t=
he content is safe.
> =

> =

> =

> On 16/04/2020 10:41, Pawel Wieczorkiewicz wrote:
>> The explicit LFCR sequence guarantees proper line by line formatting
>> in the output.
>> The '\n' character alone on some terminals is not automatically
>> converted to LFCR.
>> =

>> Signed-off-by: Pawel Wieczorkiewicz <wipawel@amazon.de>
> =

> Up until now, all console destinations have expected POSIX text semantics.
> =

> I presume this is due to the COM1 use presented in the next patch?
> =


No, this is not about that.

> Unfortunately, this comes with collateral damage.
> =

> # ./xtf-runner hvm64 example
> Executing 'xl create -p tests/example/test-hvm64-example.cfg'
> Executing 'xl console test-hvm64-example'
> Executing 'xl unpause test-hvm64-example'
> --- Xen Test Framework ---
> =

> Found Xen: 4.14
> =

> Environment: HVM 64bit (Long mode 4 levels)
> =

> Hello World
> =

> Test result: SUCCESS
> =

> =

> Combined test results:
> test-hvm64-example                       CRASH
> =


I never use xtf-runner script to execute tests. I do it the old fashion way:

# xl create -c test-hvm64-example.cfg
Parsing config from test-hvm64-example.cfg
Guest cpuid information
                       Native cpuid:
                                      00000000:ffffffff -> 0000000d:756e654=
7:6c65746e:49656e69
                                                                           =
                     00000001:ffffffff -> 000306e4:00400800:f7ba2203:1fcbfb=
ff
                                                                           =
                                                                           =
    00000002:ffffffff -> 76036301:00f0b2ff:00000000:00ca0000
00000003:ffffffff -> 00000000:00000000:00000000:00000000
                                                          00000004:00000000=
 -> 7c000121:01c0003f:0000003f:00000000
                                                                           =
                                         00000004:00000001 -> 7c000122:01c0=
003f:0000003f:00000000
                                                                           =
                                                                           =
                        00000004:00000002 -> 7c000143:01c0003f:000001ff:000=
00000
                                                                           =
                                                                           =
                                                                           =
       00000004:00000003 -> 7c000163:04c0003f:00004fff:00000006
 00000004:00000004 -> 00000000:00000000:00000000:00000000
                                                           00000005:fffffff=
f -> 00000040:00000040:00000003:00001120
                                                                           =
                                          00000006:ffffffff -> 00000077:000=
00002:00000009:00000000
                                                                           =
                                                                           =
                         00000007:00000000 -> 00000000:00000281:00000000:9c=
000400
                                                                           =
                                                                           =
                                                                           =
        00000008:ffffffff -> 00000000:00000000:00000000:00000000
  00000009:ffffffff -> 00000000:00000000:00000000:00000000
                                                            0000000a:ffffff=
ff -> 07300403:00000000:00000000:00000603
                                                                           =
                                           0000000b:ffffffff -> 00000000:00=
000000:00000000:00000000
                                                                           =
                                                                           =
                          0000000c:ffffffff -> 00000000:00000000:00000000:0=
0000000
                                                                           =
                                                                           =
                                                                           =
         0000000d:00000000 -> 00000007:00000240:00000340:00000000
   0000000d:00000001 -> 00000001:00000000:00000000:00000000
                                                             0000000d:00000=
002 -> 00000100:00000240:00000000:00000000
                                                                           =
                                            40000000:ffffffff -> 40000005:5=
66e6558:65584d4d:4d4d566e
                                                                           =
                                                                           =
                           40000001:ffffffff -> 0004000b:00000000:00000000:=
00000000
                                                                           =
                                                                           =
                                                                           =
          40000002:ffffffff -> 00000001:40000000:00000000:00000000
    40000003:00000000 -> 00000006:00000000:002625a2:00000001
                                                              40000003:0000=
0001 -> 57b3c4d2:00030755:ccccc210:ffffffff
                                                                           =
                                             40000003:00000002 -> 002625a2:=
00000000:00000000:00000000
                                                                           =
                                                                           =
                            40000004:00000000 -> 0000001c:00000000:00000ac9=
:00000000
                                                                           =
                                                                           =
                                                                           =
           40000005:ffffffff -> 00000000:00000000:00000000:00000000
     40000100:ffffffff -> 00000000:00000000:00000000:00000000
                                                               80000000:fff=
fffff -> 80000008:00000000:00000000:00000000
                                                                           =
                                              80000001:ffffffff -> 00000000=
:00000000:00000001:2c100800
                                                                           =
                                                                           =
                             80000002:ffffffff -> 20202020:6e492020:286c657=
4:58202952
                                                                           =
                                                                           =
                                                                           =
            80000003:ffffffff -> 286e6f65:43202952:45205550:36322d35
      80000004:ffffffff -> 76203037:20402032:30352e32:007a4847
                                                                80000005:ff=
ffffff -> 00000000:00000000:00000000:00000000
                                                                           =
                                               80000006:ffffffff -> 0000000=
0:00000000:01006040:00000000
                                                                           =
                                                                           =
                              80000007:ffffffff -> 00000000:00000000:000000=
00:00000000
                                                                           =
                                                                           =
                                                                           =
             80000008:ffffffff -> 0000302e:00001000:00000000:00000000
     Test result: SUCCESS


There is no \r added to the console. I am not using serial console for this=
 example.

Also, qemu seems to do the right thing and appends \r when it is not there.

> which I believe is due to xenconsoled (or the intervening pty) also
> expanding \n to \r\n (and "Test result:" no longer being on the final
> line from xtf-runner's point of view).  Xen also expands \n to \r\n for
> the console, so ends up emitting \r\r\n.
> =

> Would it be better to have the com1 console handler do the expansion
> locally, to avoid interfering with the semantics of every other
> destination?  That said...

com1 handler works fine even without this patch

> =

>> ---
>> common/libc/vsnprintf.c | 10 ++++++++++
>> 1 file changed, 10 insertions(+)
>> =

>> diff --git a/common/libc/vsnprintf.c b/common/libc/vsnprintf.c
>> index a49fd30..3202137 100644
>> --- a/common/libc/vsnprintf.c
>> +++ b/common/libc/vsnprintf.c
>> @@ -285,6 +285,16 @@ int vsnprintf(char *buf, size_t size, const char *f=
mt, va_list args)
>>         if ( *fmt !=3D '%' )
>>         {
>>             PUT(*fmt);
>> +
>> +            /*
>> +             * The '\n' character alone on some terminals is not automa=
tically
>> +             * converted to LFCR.
>> +             * The explicit LFCR sequence guarantees proper line by line
>> +             * formatting in the output.
>> +             */
>> +            if ( *fmt =3D=3D '\n' && str < end )
>> +                PUT('\r');
> =

> ... doesn't this end up putting out \n\r ?

yes, it does

> =

> ~Andrew
> =

>> +
>>             continue;
>>         }
>> =

> =



Best Regards,
Pawel Wieczorkiewicz
wipawel@amazon.com



Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




