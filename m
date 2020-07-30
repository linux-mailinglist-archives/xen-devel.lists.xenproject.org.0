Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F9A233533
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 17:19:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1AJW-00026G-J3; Thu, 30 Jul 2020 15:17:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uTMv=BJ=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1k1AJV-00026B-Px
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 15:17:45 +0000
X-Inumbo-ID: d016cc02-d277-11ea-aade-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d016cc02-d277-11ea-aade-12813bfff9fa;
 Thu, 30 Jul 2020 15:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596122263;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=2UWeugfy3yHZRI0/TOl8DyLMdDVKj2LrqM1+xVgFZJE=;
 b=Z7qQPXPl+rAueJJdI3NXAYHm8S2GAoMzvQPh9ogmiHPc1s1ZOOclkAcN
 XabuSMEIA8D0ggCO7SkgNf2w3xRAekk5QPob0IIuX9y7EmJZTLzjr8WX0
 grJvjYJmcNZKEsxtk5IA7BKN/tSdC7EWEpOScv8vmVQcC49DRaS9tn1zg I=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 7IrFBHSHhHcwoKZqdN/1wSRELn98nkgt3SEYN4mcF8nYCibAqhEh105GCcOReM1vha7AOBYCnf
 QrgT05hen46j6GkVakLVvp7lO2HELCJvSFO9aA6n8UiOooH3U3axY/ek7jv08wgITU30VbZmxy
 PEHbG2UYh/TVIBbJBJ7j3Lo9Ny8NzGJwca7R0GD5+Sk+u16gofwLpNisSaBpuy6qMc8+HOUE9e
 Kj4glk1r6xqEtk1gRp92JI9AmVP0LwWBae5IBv9XINQP72camv573Gfry3X+9wUhwFw6OCPRnL
 Wsg=
X-SBRS: 2.7
X-MesageID: 23543145
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,414,1589256000"; d="scan'208";a="23543145"
From: George Dunlap <George.Dunlap@citrix.com>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>, "intel-xen@intel.com"
 <intel-xen@intel.com>, "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>,
 Roger Pau Monne <roger.pau@citrix.com>, Sergey Dyasli
 <sergey.dyasli@citrix.com>, Christopher Clark
 <christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>, "Kevin
 Pearson" <kevin.pearson@ortmanconsulting.com>, Juergen Gross
 <jgross@suse.com>, Paul Durrant <pdurrant@amazon.com>, "Ji, John"
 <john.ji@intel.com>, "Natarajan, Janakarajan" <jnataraj@amd.com>,
 "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>,
 "robin.randhawa@arm.com" <robin.randhawa@arm.com>, Artem Mygaiev
 <Artem_Mygaiev@epam.com>, Matt Spencer <Matt.Spencer@arm.com>,
 "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>, "Stewart
 Hildebrand" <Stewart.Hildebrand@dornerworks.com>, Volodymyr Babchuk
 <volodymyr_babchuk@epam.com>, "mirela.simonovic@aggios.com"
 <mirela.simonovic@aggios.com>, Jarvis Roach <Jarvis.Roach@dornerworks.com>,
 Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Ian Jackson
 <Ian.Jackson@citrix.com>, Rian Quinn <rianquinn@gmail.com>, "Daniel P. Smith"
 <dpsmith@apertussolutions.com>,
 =?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLRG91ZyBHb2xkc3RlaW4=?=
 <cardoe@cardoe.com>, George Dunlap <George.Dunlap@citrix.com>, "David
 Woodhouse" <dwmw@amazon.co.uk>,
 =?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQW1pdCBTaGFo?= <amit@infradead.org>,
 =?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLVmFyYWQgR2F1dGFt?=
 <varadgautam@gmail.com>, Brian Woods <brian.woods@xilinx.com>, Robert Townley
 <rob.townley@gmail.com>, Bobby Eshleman <bobby.eshleman@gmail.com>, "Olivier
 Lambert" <olivier.lambert@vates.fr>, Andrew Cooper
 <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: RESCHEDULED Call for agenda items for Community Call, August 13 @
 15:00 UTC
Thread-Topic: RESCHEDULED Call for agenda items for Community Call, August 13
 @ 15:00 UTC
Thread-Index: AQHWZoSNRscNI50zO02VynkLplKjzQ==
Date: Thu, 30 Jul 2020 15:17:35 +0000
Message-ID: <1E023F6E-0E3C-4CD5-A074-7BF62635E123@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <1FB6EE734F640240A5CF592535F87624@citrix.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGV5IGFsbCwNCg0KVGhlIGNvbW11bml0eSBjYWxsIGlzIHNjaGVkdWxlZCBmb3IgbmV4dCB3ZWVr
LCA2IEF1Z3VzdC4gIEksIGhvd2V2ZXIsIHdpbGwgYmUgb24gUFRPIHRoYXQgd2VlazsgSSBwcm9w
b3NlIHJlc2NoZWR1bGluZyBpdCBmb3IgdGhlIGZvbGxvd2luZyB3ZWVrLCAxMyBBdWd1c3QsIGF0
IHRoZSBzYW1lIHRpbWUuDQoNClRoZSBwcm9wb3NlZCBhZ2VuZGEgaXMgaW4gWlpaIGFuZCB5b3Ug
Y2FuIGVkaXQgdG8gYWRkIGl0ZW1zLiAgQWx0ZXJuYXRpdmVseSwgeW91IGNhbiByZXBseSB0byB0
aGlzIG1haWwgZGlyZWN0bHkuDQoNCkFnZW5kYSBpdGVtcyBhcHByZWNpYXRlZCBhIGZldyBkYXlz
IGJlZm9yZSB0aGUgY2FsbDogcGxlYXNlIHB1dCB5b3VyIG5hbWUgYmVzaWRlcyBpdGVtcyBpZiB5
b3UgZWRpdCB0aGUgZG9jdW1lbnQuDQoNCk5vdGUgdGhlIGZvbGxvd2luZyBhZG1pbmlzdHJhdGl2
ZSBjb252ZW50aW9ucyBmb3IgdGhlIGNhbGw6DQoqIFVubGVzcywgYWdyZWVkIGluIHRoZSBwZXJ2
aW91cyBtZWV0aW5nIG90aGVyd2lzZSwgdGhlIGNhbGwgaXMgb24gdGhlIDFzdCBUaHVyc2RheSBv
ZiBlYWNoIG1vbnRoIGF0IDE2MDAgQnJpdGlzaCBUaW1lIChlaXRoZXIgR01UIG9yIEJTVCkNCiog
SSB1c3VhbGx5IHNlbmQgb3V0IGEgbWVldGluZyByZW1pbmRlciBhIGZldyBkYXlzIGJlZm9yZSB3
aXRoIGEgcHJvdmlzaW9uYWwgYWdlbmRhDQoNCiogSWYgeW91IHdhbnQgdG8gYmUgQ0MnZWQgcGxl
YXNlIGFkZCBvciByZW1vdmUgeW91cnNlbGYgZnJvbSB0aGUgc2lnbi11cC1zaGVldCBhdCBodHRw
czovL2NyeXB0cGFkLmZyL3BhZC8jLzIvcGFkL2VkaXQvRDl2R3ppaFB4eEFPZTZSRlB6MHNSQ2Yr
Lw0KDQpCZXN0IFJlZ2FyZHMNCkdlb3JnZQ0KDQoNCg0KPT0gRGlhbC1pbiBJbmZvcm1hdGlvbiA9
PQ0KIyMgTWVldGluZyB0aW1lDQoxNTowMCAtIDE2OjAwIFVUQyAoZHVyaW5nIEJTVCkNCkZ1cnRo
ZXIgSW50ZXJuYXRpb25hbCBtZWV0aW5nIHRpbWVzOiBodHRwczovL3d3dy50aW1lYW5kZGF0ZS5j
b20vd29ybGRjbG9jay9tZWV0aW5nZGV0YWlscy5odG1sP3llYXI9MjAyMCZtb250aD01JmRheT03
JmhvdXI9MTUmbWluPTAmc2VjPTAmcDE9MTIzNCZwMj0zNyZwMz0yMjQmcDQ9MTc5DQoNCg0KIyMg
RGlhbCBpbiBkZXRhaWxzDQpXZWI6IGh0dHBzOi8vd3d3LmdvdG9tZWV0Lm1lL0dlb3JnZUR1bmxh
cA0KDQpZb3UgY2FuIGFsc28gZGlhbCBpbiB1c2luZyB5b3VyIHBob25lLg0KQWNjZXNzIENvZGU6
IDE2OC02ODItMTA5DQoNCkNoaW5hIChUb2xsIEZyZWUpOiA0MDA4IDgxMTA4NA0KR2VybWFueTog
KzQ5IDY5MiA1NzM2IDczMTcNClBvbGFuZCAoVG9sbCBGcmVlKTogMDAgODAwIDExMjQ3NTkNClVr
cmFpbmUgKFRvbGwgRnJlZSk6IDAgODAwIDUwIDE3MzMNClVuaXRlZCBLaW5nZG9tOiArNDQgMzMw
IDIyMSAwMDg4DQpVbml0ZWQgU3RhdGVzOiArMSAoNTcxKSAzMTctMzEyOQ0KU3BhaW46ICszNCA5
MzIgNzUgMjAwNA0KDQoNCk1vcmUgcGhvbmUgbnVtYmVycw0KQXVzdHJhbGlhOiArNjEgMiA5MDg3
IDM2MDQNCkF1c3RyaWE6ICs0MyA3IDIwODEgNTQyNw0KQXJnZW50aW5hIChUb2xsIEZyZWUpOiAw
IDgwMCA0NDQgMzM3NQ0KQmFocmFpbiAoVG9sbCBGcmVlKTogODAwIDgxIDExMQ0KQmVsYXJ1cyAo
VG9sbCBGcmVlKTogOCA4MjAgMDAxMSAwNDAwDQpCZWxnaXVtOiArMzIgMjggOTMgNzAxOA0KQnJh
emlsIChUb2xsIEZyZWUpOiAwIDgwMCAwNDcgNDkwNg0KQnVsZ2FyaWEgKFRvbGwgRnJlZSk6IDAw
ODAwIDEyMCA0NDE3DQpDYW5hZGE6ICsxICg2NDcpIDQ5Ny05MzkxDQpDaGlsZSAoVG9sbCBGcmVl
KTogODAwIDM5NSAxNTANCkNvbG9tYmlhIChUb2xsIEZyZWUpOiAwMSA4MDAgNTE4IDQ0ODMNCkN6
ZWNoIFJlcHVibGljIChUb2xsIEZyZWUpOiA4MDAgNTAwNDQ4DQpEZW5tYXJrOiArNDUgMzIgNzIg
MDMgODINCkZpbmxhbmQ6ICszNTggOTIzIDE3IDA1NjgNCkZyYW5jZTogKzMzIDE3MCA5NTAgNTk0
DQpHcmVlY2UgKFRvbGwgRnJlZSk6IDAwIDgwMCA0NDE0IDM4MzgNCkhvbmcgS29uZyAoVG9sbCBG
cmVlKTogMzA3MTMxNjk5MDYtODg2LTk2NQ0KSHVuZ2FyeSAoVG9sbCBGcmVlKTogKDA2KSA4MCA5
ODYgMjU1DQpJY2VsYW5kIChUb2xsIEZyZWUpOiA4MDAgNzIwNA0KSW5kaWEgKFRvbGwgRnJlZSk6
IDE4MDAyNjY5MjcyDQpJbmRvbmVzaWEgKFRvbGwgRnJlZSk6IDAwNyA4MDMgMDIwIDUzNzUNCkly
ZWxhbmQ6ICszNTMgMTUgMzYwIDcyOA0KSXNyYWVsIChUb2xsIEZyZWUpOiAxIDgwOSA0NTQgODMw
DQpJdGFseTogKzM5IDAgMjQ3IDkyIDEzIDAxDQpKYXBhbiAoVG9sbCBGcmVlKTogMCAxMjAgNjYz
IDgwMA0KS29yZWEsIFJlcHVibGljIG9mIChUb2xsIEZyZWUpOiAwMDc5OCAxNCAyMDcgNDkxNA0K
THV4ZW1ib3VyZyAoVG9sbCBGcmVlKTogODAwIDg1MTU4DQpNYWxheXNpYSAoVG9sbCBGcmVlKTog
MSA4MDAgODEgNjg1NA0KTWV4aWNvIChUb2xsIEZyZWUpOiAwMSA4MDAgNTIyIDExMzMNCk5ldGhl
cmxhbmRzOiArMzEgMjA3IDk0MSAzNzcNCk5ldyBaZWFsYW5kOiArNjQgOSAyODAgNjMwMg0KTm9y
d2F5OiArNDcgMjEgOTMgMzcgNTENClBhbmFtYSAoVG9sbCBGcmVlKTogMDAgODAwIDIyNiA3OTI4
DQpQZXJ1IChUb2xsIEZyZWUpOiAwIDgwMCA3NzAyMw0KUGhpbGlwcGluZXMgKFRvbGwgRnJlZSk6
IDEgODAwIDExMTAgMTY2MQ0KUG9ydHVnYWwgKFRvbGwgRnJlZSk6IDgwMCA4MTkgNTc1DQpSb21h
bmlhIChUb2xsIEZyZWUpOiAwIDgwMCA0MTAgMDI5DQpSdXNzaWFuIEZlZGVyYXRpb24gKFRvbGwg
RnJlZSk6IDggODAwIDEwMCA2MjAzDQpTYXVkaSBBcmFiaWEgKFRvbGwgRnJlZSk6IDgwMCA4NDQg
MzYzMw0KU2luZ2Fwb3JlIChUb2xsIEZyZWUpOiAxODAwNzIzMTMyMw0KU291dGggQWZyaWNhIChU
b2xsIEZyZWUpOiAwIDgwMCA1NTUgNDQ3DQpTd2VkZW46ICs0NiA4NTMgNTI3IDgyNw0KU3dpdHpl
cmxhbmQ6ICs0MSAyMjUgNDU5OSA3OA0KVGFpd2FuIChUb2xsIEZyZWUpOiAwIDgwMCA2NjYgODU0
DQpUaGFpbGFuZCAoVG9sbCBGcmVlKTogMDAxIDgwMCAwMTEgMDIzDQpUdXJrZXkgKFRvbGwgRnJl
ZSk6IDAwIDgwMCA0NDg4IDIzNjgzDQpVbml0ZWQgQXJhYiBFbWlyYXRlcyAoVG9sbCBGcmVlKTog
ODAwIDA0NCA0MDQzOQ0KVXJ1Z3VheSAoVG9sbCBGcmVlKTogMDAwNCAwMTkgMTAxOA0KVmlldCBO
YW0gKFRvbGwgRnJlZSk6IDEyMiA4MCA0ODENCuKAi+KAi+KAi+KAi+KAi+KAi+KAiw0KDQpGaXJz
dCBHb1RvTWVldGluZz8gTGV0J3MgZG8gYSBxdWljayBzeXN0ZW0gY2hlY2s6DQoNCmh0dHBzOi8v
bGluay5nb3RvbWVldGluZy5jb20vc3lzdGVtLWNoZWNrDQo=

