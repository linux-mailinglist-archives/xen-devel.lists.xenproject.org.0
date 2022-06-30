Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBDE5615AB
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 11:09:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358391.587584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6q9w-0004iY-2r; Thu, 30 Jun 2022 09:08:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358391.587584; Thu, 30 Jun 2022 09:08:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6q9v-0004gR-Vt; Thu, 30 Jun 2022 09:08:23 +0000
Received: by outflank-mailman (input) for mailman id 358391;
 Thu, 30 Jun 2022 09:07:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=89Zk=XF=hotmail.it=c.cesarano@srs-se1.protection.inumbo.net>)
 id 1o6q8t-0004RI-57
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 09:07:19 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-oln040092065079.outbound.protection.outlook.com [40.92.65.79])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a04e59c-f854-11ec-bd2d-47488cf2e6aa;
 Thu, 30 Jun 2022 11:07:17 +0200 (CEST)
Received: from AM7PR10MB3559.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:142::21)
 by AM6PR10MB2248.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:45::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Thu, 30 Jun
 2022 09:07:16 +0000
Received: from AM7PR10MB3559.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::110a:162b:f3a6:2e47]) by AM7PR10MB3559.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::110a:162b:f3a6:2e47%5]) with mapi id 15.20.5395.015; Thu, 30 Jun 2022
 09:07:15 +0000
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
X-Inumbo-ID: 0a04e59c-f854-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DcC73G1hxEdQtbdR3jOsYUbFmNIy4JhC+rMk/eFUla1+wLMNyaBD+3YYTyPIEeoU1CrMKbiR8MKvgx96VfrwA/+IAyYtNJuiAskrMprXqZDkgnAX/UtHZ7zYLqZFlH9addZ6iytuyLgZdB4+I/f9byuDym1nEquqm1pty65xaizufQgqfJE0tdu0gZaOjDaAJmDCW2VgBRy9LI0UozCtVSk4Dn7+AsQQeXC0OPtuPzaDm5YdEsmAOoyjVBmOrZGWXstV+pawDd2/kPpIm8G++hnW2xUwLkvHSBEOlkyq4Js+sAr6eYliEBNw6gp+dvVKlDkQSBGWikwEmCRD/G8D5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLRwKeMT9BR/oaega17Tb7kpao5jwz099J/KmMl1ndM=;
 b=MVrQ+mfCwIx+V+t4MQs7stzxZhWrcQGE3dGOeIBeEKrvCt3BjCzVWp1g+5Ukkta9QaJTMQTYXNcEPQWABJqmiOw1aTjgZn3KAkRv6BUI9MZGaVvkVd7E9E6Mts+yx8dsPmcsK/+o7oA267yTXT6ekmWER0WCdHyfPLkAnueHvvpQQMtyYZ3jAFk4RVPu8ce0AazXcinYmA+LhN6GjleNk5zEUiWwy0jm/LLchxGB9EyrHadK9RKYEE+Zh89qZ11xR0imgHzJTXWXIhQq014q3qo17hG+fVvTeq3bZXJ8aE2L5j30QTDNXiri8yTCYLbnhi05Emlgfz+xwq1cy7NyIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
From: Carmine Cesarano <c.cesarano@hotmail.it>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Subject: R: R: R: Crash when using xencov
Thread-Topic: R: R: Crash when using xencov
Thread-Index:
 AQHYihZvzMoBU/8d5kCvfMcwSUXjJK1jJQIAgAALHhCAAAKEgIAAD46vgAAFV6WAAXJk3oAB9oiAgAD5uEk=
Date: Thu, 30 Jun 2022 09:07:15 +0000
Message-ID:
 <AM7PR10MB355902159111F3CC8C6CDB94F8BA9@AM7PR10MB3559.EURPRD10.PROD.OUTLOOK.COM>
References:
 <AM7PR10MB355942D32F58FF02379C398CF8B99@AM7PR10MB3559.EURPRD10.PROD.OUTLOOK.COM>
 <87d0667b-2b85-f006-ea3c-6f557b2bdc8e@xen.org>
 <AM7PR10MB355972A68A222CB9FBAC43D4F8B99@AM7PR10MB3559.EURPRD10.PROD.OUTLOOK.COM>
 <daa12b90-da87-d463-24c4-a13fba330f1d@xen.org>
 <AM7PR10MB35593AA7F46B4D4A0BBD9841F8B99@AM7PR10MB3559.EURPRD10.PROD.OUTLOOK.COM>
 <AM7PR10MB3559BB8CB733902773B1AD6AF8B99@AM7PR10MB3559.EURPRD10.PROD.OUTLOOK.COM>
 <AM7PR10MB3559A1984F6B53CEFB4FECC7F8B89@AM7PR10MB3559.EURPRD10.PROD.OUTLOOK.COM>
 <ef8b540c-d2c2-c999-d3fe-08fc88665ad9@xen.org>
In-Reply-To: <ef8b540c-d2c2-c999-d3fe-08fc88665ad9@xen.org>
Accept-Language: it-IT, en-US
Content-Language: it-IT
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [iTK+epqU2QfAYA6Mkoi0h3n+vH7dbsgj]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9f94accf-2d70-472a-bd18-08da5a77ed87
x-ms-traffictypediagnostic: AM6PR10MB2248:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 beOG8WPenjwBmEkBB9m1sKnDLbLfjuWWa3lKJvdRdPjDjweFomYQIKdcAYmP/J23tEqNgz1K2hAtTdc8r8uCjdOZYc3K2VoogMZe75oz55lRsm5OwQS27dtQ8virnHbmplS3hGbMYw/u5wOZYJ215lksyd3UlxDnQ5B/vGUkDA95fhoPCKGJkLEtfYS1puxpW2528N1MVACEwN60VGmXZZLyuK9YVwlACz3dJ/+vmQFF5MOa0tVmR2IVamHJkYNXGTXnG95GLASCPQxCipliFCCbPE7ewoegXwO47DQO6YEHiW0yXcLwgky17DjhqedV5JkAM2q9+5JJlTsyB3lBcj4bF0UbdDtrOgVdks+8mzVYjOJW+T04GigKkdiaYhs/1QH9KqpDkpjyYT1ydxwj4juaB9Wj6mTaxt76HxUEskd1rndqQv+NYPt+W1EfJ+qURDxM+Djrg2Y4DHGN+zbQ9D2urUXt3P211487sseb8XzRPaiOrNjbw3JSmVeRKlw6MSwaygN32tKX69z1h49RfIXpcqOE3hiUageigmJc9TTUFVwO8G7LqlSdNjYqoNFIiNrzVj2aseP5MTI2eIy+vuA07W8nPMT8jfIMwT2Ac8Mwipg0Is73JbdsIVAyyproKs2RTfdjywfhBGgqaW3OVQ==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?qIAuYqXM7uAlErqRDnE1dG0lbFTgHO3RPEZf27Y3M0eqYKliiQOlHkG7?=
 =?Windows-1252?Q?QRxcMHXQjZ9W24JGbYbGUdrMK+ijKdxUAYN5u6cMpjp7yzxr1TXt5kwN?=
 =?Windows-1252?Q?x6owHsUlOe1RHa4hPQ9TRXmSlu/qa98TmWo+X3msRcOjC/rLCFGwWzpM?=
 =?Windows-1252?Q?a3tI05M/aJD9/uKGvNgIbF4JhYpUvCctC3I9HoHOhO1HDjUJe4uGHdHn?=
 =?Windows-1252?Q?CmpoWf9TD6+kk3+3A/GPteSDsqb+m1yQ0VyUomXVerHl1hajH2OFr2cV?=
 =?Windows-1252?Q?j1qMq26+8KtBG191hQljwOSeqRRIfte8V1s4Z/6R1cxQVbjy1Xoi9zyq?=
 =?Windows-1252?Q?ivcYjqjTA3XHIkNtg431+/C1ZfxcJMsAh20udxnU1jUL9Jbrn5sFgZnO?=
 =?Windows-1252?Q?FN42GZMPJXZBo5H9MBGztefjAiqXd+hnOEIvvvRfBJvruky4x/tzYZRc?=
 =?Windows-1252?Q?iGl5mCIw8Yg47ACh1LXosxMMnQQ7MsCmHuQuuMZ5YCmZlaWPemd0vqXn?=
 =?Windows-1252?Q?ehOGOyW/nn2NIJKif8BavQxXB+OoHlh/fm6wZpddMgZF5USL/NE4LAeH?=
 =?Windows-1252?Q?1MSQXfQiIiV17FhvO0WqUjrbS7rBFJ4TH8c0ZurV1duNSbyv4eSsuXB2?=
 =?Windows-1252?Q?oUsSCF7Ol0bpBtTd6jI9aFlEwaf5lenB/5WXN1oDxlynzhQht4Lj6OTg?=
 =?Windows-1252?Q?uRq2hlBKQz5dP33LmQWKCortStk7ByGvmmrPsEnJojuhDqWsrVuG5VkQ?=
 =?Windows-1252?Q?85QMyEKSxHhGSdLPOQYUHpyse0/bKqr4v8m2A1HBXReVeqJ/pZaQyCDE?=
 =?Windows-1252?Q?5sBMvChPL8wRKUIB5Kfiy40qSy9bAdUvrBETZeCt3rxEZjME/hzQmvUT?=
 =?Windows-1252?Q?W3PjwqNqjKV617CbqclWI51fT34xG0Aw634mSjeiSEyhLD/QE/Sz8fEN?=
 =?Windows-1252?Q?dMEXDU14Ht+vnNxkOm7I8oWKh3pTdzwHrd7MMgjm5GzzrWCJ0x32yed/?=
 =?Windows-1252?Q?odFZK4WhtM0hhxkbF1BpWsBnVFFTaBSlv+0BIFGr1LNtpBchz1FdAOPw?=
 =?Windows-1252?Q?ZEVcjgIMrSsHT5N2wWTpqipqa8J+AkJ3Eyxu4Y5N/r3YgZtfBnTq4Uid?=
 =?Windows-1252?Q?ybm7w2AZP64nNTNtmmFKd4FrZR0sQrtNaIUGpntVWFXsNqZwB3Rp2fZ4?=
 =?Windows-1252?Q?htp1gAIBcQXKgA2oPuxA7wfJ1LLvJAMABYYqiB2QssGsj4V4qKBCtojA?=
 =?Windows-1252?Q?4fF8nKQ9GUGpDKbRK4z1cX8bzRx8HtwSJBQG54J2H5aRHqvy2SAQ+Sq0?=
 =?Windows-1252?Q?DZ6bud7vL1NL4tM7N9CG0iRToyBUNswIVBbccI1630ZYXb33t8P03d+V?=
 =?Windows-1252?Q?0amjVJgg+hqP1yUrN6p5rm3usp168g6vyUU=3D?=
Content-Type: multipart/alternative;
	boundary="_000_AM7PR10MB355902159111F3CC8C6CDB94F8BA9AM7PR10MB3559EURP_"
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-6b909.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR10MB3559.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f94accf-2d70-472a-bd18-08da5a77ed87
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2022 09:07:15.8425
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2248

--_000_AM7PR10MB355902159111F3CC8C6CDB94F8BA9AM7PR10MB3559EURP_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hello,
Sorry for the images on the ML.
If I wanted to change my setup instead, is there a tested and working versi=
on of gcc for xencov features on xen stable-4.16?
(I read GCC 3.4 or later in the documentation).

Cheers,

Carmine Cesarano

Da: Julien Grall<mailto:julien@xen.org>
Inviato: mercoled=EC 29 giugno 2022 20:02
A: Carmine Cesarano<mailto:c.cesarano@hotmail.it>
Cc: xen-devel@lists.xenproject.org<mailto:xen-devel@lists.xenproject.org>; =
Andrew Cooper<mailto:andrew.cooper3@citrix.com>
Oggetto: Re: R: R: Crash when using xencov

(moving the discussion to xen-devel)

On 28/06/2022 16:32, Carmine Cesarano wrote:
> Hi,

Hello,

Please refrain to top-post and/or post images on the ML. If you need to
share an image, then please upload them somewhere else.

> I made two further attempts, first by compiling xen and xen-tools with gc=
c 10 and second with gcc 7, getting the same problem.
>
> By running =93xencov reset=94, with with both compilers, the line of code=
 associated with the crash is:

Discussing with Andrew Cooper on IRC, it looks like the problem is
because Xen and GCC disagrees on the format. There are newer format that
Xen doesn't understand.

If you are interested to support GCOV on your setup, then I would
suggest to look at the documentation and/or look at what Linux is doing
for newer compiler.

>
>    *   /xen/xen/common/coverage/gcc_4_7.c:123
> By running =93xencov read=94, I get two different behaviors with the two =
compilers:
>
>    *   /xen/xen/common/coverage/gcc_4_7.c:165   [GCC 11]
>    *   /xen/xen/common/coverage/gcov.c:131          [GCC 7]
>
> Attached are the logs captured with a serial port.
>
> Cheers,
>
> Carmine Cesarano
> Da: Julien Grall<mailto:julien@xen.org>
> Inviato: luned=EC 27 giugno 2022 14:42
> A: Carmine Cesarano<mailto:c.cesarano@hotmail.it>
> Oggetto: Re: R: Crash when using xencov
>
> Hello,
>
> You seemed to have removed xen-users from the CC list. Please keep it in
> CC unless the discussion needs to private.
>
> Also, please avoid top-posting.
>
> On 27/06/2022 13:36, Carmine Cesarano wrote:
>> Yes, i mean stable-4.16. Below the logs after running "xencov reset". Th=
e situation for "xencov read" is similar.
>>
>> (XEN) ----[ Xen-4.16.2-pre  x86_64  debug=3Dy gcov=3Dy  Not tainted ]---=
-
>> (XEN) CPU:    0
>> (XEN) RIP:    e008:[<ffff82d040257bd2>] gcov_info_reset+0x87/0xa9
>> (XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor (d0v0)
>> (XEN) rax: 0000000000000000   rbx: ffff82d04056bdc0   rcx: 00000000000c0=
00b
>> (XEN) rdx: 0000000000000000   rsi: 0000000000000001   rdi: ffff82d04056b=
dc0
>> (XEN) rbp: ffff83023a7e7cb0   rsp: ffff83023a7e7c88   r8:  7ffffffffffff=
fff
>> (XEN) r9:  deadbeefdeadf00d   r10: 0000000000000000   r11: 0000000000000=
000
>> (XEN) r12: 0000000000000001   r13: ffff82d04056be28   r14: 0000000000000=
000
>> (XEN) r15: ffff82d04056bdc0   cr0: 0000000080050033   cr4: 0000000000172=
620
>> (XEN) cr3: 000000017ea0b000   cr2: 0000000000000000
>> (XEN) fsb: 00007fc0fb0ca200   gsb: ffff88807b400000   gss: 0000000000000=
000
>> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
>> (XEN) Xen code around <ffff82d040257bd2> (gcov_info_reset+0x87/0xa9):
>> (XEN)  1d 44 89 f0 49 8b 57 70 <4c> 8b 24 c2 49 83 c4 18 48 83 05 a6 81 =
4c 00 01
>> (XEN) Xen stack trace from rsp=3Dffff83023a7e7c88:
>> (XEN)    ffff82d04056bdc0 0000000000000001 ffff82d04070f180 000000000000=
0001
>> (XEN)    0000000000000000 ffff83023a7e7cc8 ffff82d040257a6a ffff83023a7e=
7db0
>> (XEN)    ffff83023a7e7ce8 ffff82d040257547 ffff83023a7e7fff ffff83023a7e=
7fff
>> (XEN)    ffff83023a7e7e58 ffff82d040255d5f ffff83023a7e7d68 ffff82d0403b=
5e8b
>> (XEN)    000000000017d5b2 0000000000000000 ffff83023a6b5000 000000000000=
0000
>> (XEN)    00007fc0fb348010 800000017ea0e127 0000000000000202 ffff82d04039=
9fd8
>> (XEN)    0000000000005a40 ffff83023a7e7d68 0000000000000206 ffff82e002fa=
b640
>> (XEN)    ffff83023a7e7e58 ffff82d0403bb29d ffff83023a69f000 000000003a7e=
7fff
>> (XEN)    000000017ea0f067 0000000000000000 000000000017d5b2 000000000017=
d5b2
>> (XEN)    0000001400000014 0000000000000002 ffffffffffffffff 000000000000=
0000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000=
0000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000=
0000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000=
0000
>> (XEN)    0000000000000000 ffff83023a7e7ef8 0000000000000001 ffff83023a69=
f000
>> (XEN)    deadbeefdeadf00d ffff82d04025579d ffff83023a7e7ee8 ffff82d04038=
7f62
>> (XEN)    00007fc0fb348010 deadbeefdeadf00d deadbeefdeadf00d deadbeefdead=
f00d
>> (XEN)    deadbeefdeadf00d ffff83023a7e7fff ffff82d0403b2c99 ffff83023a7e=
7eb8
>> (XEN)    ffff82d04038214c ffff83023a69f000 ffff83023a7e7ed8 ffff83023a69=
f000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000=
0000
>> (XEN)    00007cfdc58180e7 ffff82d0404392ae 0000000000000000 ffff88800f48=
4c00
>> (XEN) Xen call trace:
>> (XEN)    [<ffff82d040257bd2>] R gcov_info_reset+0x87/0xa9
>
> Thanks! There are multiple versions of gcov_info_reset() in the tree.
> The one used will depend on the compiler you are using.
>
> Can you use addr2line (or gdb) to find out the file and line of code
> associated with the crash?
>
> For addr2line you could do:
>
>     addr2line -e xen-syms 0xffff82d040257bd2

Cheers,

--
Julien Grall


--_000_AM7PR10MB355902159111F3CC8C6CDB94F8BA9AM7PR10MB3559EURP_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 2.0cm 2.0cm 2.0cm;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"IT" link=3D"blue" vlink=3D"#954F72" style=3D"word-wrap:break-=
word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello,</p>
<p class=3D"MsoNormal">Sorry for the images on the ML.</p>
<p class=3D"MsoNormal">If I wanted to change my setup instead, is there a t=
ested and working version of gcc for xencov features on xen stable-4.16?</p=
>
<p class=3D"MsoNormal">(I read GCC 3.4 or later in the documentation).</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Cheers,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Carmine Cesarano</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"mso-element:para-border-div;border:none;border-top:solid #E1E=
1E1 1.0pt;padding:3.0pt 0cm 0cm 0cm">
<p class=3D"MsoNormal" style=3D"border:none;padding:0cm"><b>Da: </b><a href=
=3D"mailto:julien@xen.org">Julien Grall</a><br>
<b>Inviato: </b>mercoled=EC 29 giugno 2022 20:02<br>
<b>A: </b><a href=3D"mailto:c.cesarano@hotmail.it">Carmine Cesarano</a><br>
<b>Cc: </b><a href=3D"mailto:xen-devel@lists.xenproject.org">xen-devel@list=
s.xenproject.org</a>;
<a href=3D"mailto:andrew.cooper3@citrix.com">Andrew Cooper</a><br>
<b>Oggetto: </b>Re: R: R: Crash when using xencov</p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">(moving the discussion to xen-devel)<br>
<br>
On 28/06/2022 16:32, Carmine Cesarano wrote:<br>
&gt; Hi,<br>
<br>
Hello,<br>
<br>
Please refrain to top-post and/or post images on the ML. If you need to <br=
>
share an image, then please upload them somewhere else.<br>
<br>
&gt; I made two further attempts, first by compiling xen and xen-tools with=
 gcc 10 and second with gcc 7, getting the same problem.<br>
&gt; <br>
&gt; By running =93xencov reset=94, with with both compilers, the line of c=
ode associated with the crash is:<br>
<br>
Discussing with Andrew Cooper on IRC, it looks like the problem is <br>
because Xen and GCC disagrees on the format. There are newer format that <b=
r>
Xen doesn't understand.<br>
<br>
If you are interested to support GCOV on your setup, then I would <br>
suggest to look at the documentation and/or look at what Linux is doing <br=
>
for newer compiler.<br>
<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp; /xen/xen/common/coverage/gcc_4_7.c:123=
<br>
&gt; By running =93xencov read=94, I get two different behaviors with the t=
wo compilers:<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp; /xen/xen/common/coverage/gcc_4_7.c:165=
&nbsp;&nbsp; [GCC 11]<br>
&gt;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp; /xen/xen/common/coverage/gcov.c:131&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [GCC 7]<br>
&gt; <br>
&gt; Attached are the logs captured with a serial port.<br>
&gt; <br>
&gt; Cheers,<br>
&gt; <br>
&gt; Carmine Cesarano<br>
&gt; Da: Julien Grall&lt;<a href=3D"mailto:julien@xen.org">mailto:julien@xe=
n.org</a>&gt;<br>
&gt; Inviato: luned=EC 27 giugno 2022 14:42<br>
&gt; A: Carmine Cesarano&lt;<a href=3D"mailto:c.cesarano@hotmail.it">mailto=
:c.cesarano@hotmail.it</a>&gt;<br>
&gt; Oggetto: Re: R: Crash when using xencov<br>
&gt; <br>
&gt; Hello,<br>
&gt; <br>
&gt; You seemed to have removed xen-users from the CC list. Please keep it =
in<br>
&gt; CC unless the discussion needs to private.<br>
&gt; <br>
&gt; Also, please avoid top-posting.<br>
&gt; <br>
&gt; On 27/06/2022 13:36, Carmine Cesarano wrote:<br>
&gt;&gt; Yes, i mean stable-4.16. Below the logs after running &quot;xencov=
 reset&quot;. The situation for &quot;xencov read&quot; is similar.<br>
&gt;&gt;<br>
&gt;&gt; (XEN) ----[ Xen-4.16.2-pre&nbsp; x86_64&nbsp; debug=3Dy gcov=3Dy&n=
bsp; Not tainted ]----<br>
&gt;&gt; (XEN) CPU:&nbsp;&nbsp;&nbsp; 0<br>
&gt;&gt; (XEN) RIP:&nbsp;&nbsp;&nbsp; e008:[&lt;ffff82d040257bd2&gt;] gcov_=
info_reset+0x87/0xa9<br>
&gt;&gt; (XEN) RFLAGS: 0000000000010202&nbsp;&nbsp; CONTEXT: hypervisor (d0=
v0)<br>
&gt;&gt; (XEN) rax: 0000000000000000&nbsp;&nbsp; rbx: ffff82d04056bdc0&nbsp=
;&nbsp; rcx: 00000000000c000b<br>
&gt;&gt; (XEN) rdx: 0000000000000000&nbsp;&nbsp; rsi: 0000000000000001&nbsp=
;&nbsp; rdi: ffff82d04056bdc0<br>
&gt;&gt; (XEN) rbp: ffff83023a7e7cb0&nbsp;&nbsp; rsp: ffff83023a7e7c88&nbsp=
;&nbsp; r8:&nbsp; 7fffffffffffffff<br>
&gt;&gt; (XEN) r9:&nbsp; deadbeefdeadf00d&nbsp;&nbsp; r10: 0000000000000000=
&nbsp;&nbsp; r11: 0000000000000000<br>
&gt;&gt; (XEN) r12: 0000000000000001&nbsp;&nbsp; r13: ffff82d04056be28&nbsp=
;&nbsp; r14: 0000000000000000<br>
&gt;&gt; (XEN) r15: ffff82d04056bdc0&nbsp;&nbsp; cr0: 0000000080050033&nbsp=
;&nbsp; cr4: 0000000000172620<br>
&gt;&gt; (XEN) cr3: 000000017ea0b000&nbsp;&nbsp; cr2: 0000000000000000<br>
&gt;&gt; (XEN) fsb: 00007fc0fb0ca200&nbsp;&nbsp; gsb: ffff88807b400000&nbsp=
;&nbsp; gss: 0000000000000000<br>
&gt;&gt; (XEN) ds: 0000&nbsp;&nbsp; es: 0000&nbsp;&nbsp; fs: 0000&nbsp;&nbs=
p; gs: 0000&nbsp;&nbsp; ss: e010&nbsp;&nbsp; cs: e008<br>
&gt;&gt; (XEN) Xen code around &lt;ffff82d040257bd2&gt; (gcov_info_reset+0x=
87/0xa9):<br>
&gt;&gt; (XEN)&nbsp; 1d 44 89 f0 49 8b 57 70 &lt;4c&gt; 8b 24 c2 49 83 c4 1=
8 48 83 05 a6 81 4c 00 01<br>
&gt;&gt; (XEN) Xen stack trace from rsp=3Dffff83023a7e7c88:<br>
&gt;&gt; (XEN)&nbsp;&nbsp;&nbsp; ffff82d04056bdc0 0000000000000001 ffff82d0=
4070f180 0000000000000001<br>
&gt;&gt; (XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 ffff83023a7e7cc8 ffff82d0=
40257a6a ffff83023a7e7db0<br>
&gt;&gt; (XEN)&nbsp;&nbsp;&nbsp; ffff83023a7e7ce8 ffff82d040257547 ffff8302=
3a7e7fff ffff83023a7e7fff<br>
&gt;&gt; (XEN)&nbsp;&nbsp;&nbsp; ffff83023a7e7e58 ffff82d040255d5f ffff8302=
3a7e7d68 ffff82d0403b5e8b<br>
&gt;&gt; (XEN)&nbsp;&nbsp;&nbsp; 000000000017d5b2 0000000000000000 ffff8302=
3a6b5000 0000000000000000<br>
&gt;&gt; (XEN)&nbsp;&nbsp;&nbsp; 00007fc0fb348010 800000017ea0e127 00000000=
00000202 ffff82d040399fd8<br>
&gt;&gt; (XEN)&nbsp;&nbsp;&nbsp; 0000000000005a40 ffff83023a7e7d68 00000000=
00000206 ffff82e002fab640<br>
&gt;&gt; (XEN)&nbsp;&nbsp;&nbsp; ffff83023a7e7e58 ffff82d0403bb29d ffff8302=
3a69f000 000000003a7e7fff<br>
&gt;&gt; (XEN)&nbsp;&nbsp;&nbsp; 000000017ea0f067 0000000000000000 00000000=
0017d5b2 000000000017d5b2<br>
&gt;&gt; (XEN)&nbsp;&nbsp;&nbsp; 0000001400000014 0000000000000002 ffffffff=
ffffffff 0000000000000000<br>
&gt;&gt; (XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 0000000000000000 00000000=
00000000 0000000000000000<br>
&gt;&gt; (XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 0000000000000000 00000000=
00000000 0000000000000000<br>
&gt;&gt; (XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 0000000000000000 00000000=
00000000 0000000000000000<br>
&gt;&gt; (XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 ffff83023a7e7ef8 00000000=
00000001 ffff83023a69f000<br>
&gt;&gt; (XEN)&nbsp;&nbsp;&nbsp; deadbeefdeadf00d ffff82d04025579d ffff8302=
3a7e7ee8 ffff82d040387f62<br>
&gt;&gt; (XEN)&nbsp;&nbsp;&nbsp; 00007fc0fb348010 deadbeefdeadf00d deadbeef=
deadf00d deadbeefdeadf00d<br>
&gt;&gt; (XEN)&nbsp;&nbsp;&nbsp; deadbeefdeadf00d ffff83023a7e7fff ffff82d0=
403b2c99 ffff83023a7e7eb8<br>
&gt;&gt; (XEN)&nbsp;&nbsp;&nbsp; ffff82d04038214c ffff83023a69f000 ffff8302=
3a7e7ed8 ffff83023a69f000<br>
&gt;&gt; (XEN)&nbsp;&nbsp;&nbsp; 0000000000000000 0000000000000000 00000000=
00000000 0000000000000000<br>
&gt;&gt; (XEN)&nbsp;&nbsp;&nbsp; 00007cfdc58180e7 ffff82d0404392ae 00000000=
00000000 ffff88800f484c00<br>
&gt;&gt; (XEN) Xen call trace:<br>
&gt;&gt; (XEN)&nbsp;&nbsp;&nbsp; [&lt;ffff82d040257bd2&gt;] R gcov_info_res=
et+0x87/0xa9<br>
&gt; <br>
&gt; Thanks! There are multiple versions of gcov_info_reset() in the tree.<=
br>
&gt; The one used will depend on the compiler you are using.<br>
&gt; <br>
&gt; Can you use addr2line (or gdb) to find out the file and line of code<b=
r>
&gt; associated with the crash?<br>
&gt; <br>
&gt; For addr2line you could do:<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; addr2line -e xen-syms 0xffff82d040257bd2<br>
<br>
Cheers,<br>
<br>
-- <br>
Julien Grall<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_AM7PR10MB355902159111F3CC8C6CDB94F8BA9AM7PR10MB3559EURP_--

