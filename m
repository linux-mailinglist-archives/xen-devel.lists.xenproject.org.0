Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0001A72B40
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 11:17:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqDLK-0000VS-3A; Wed, 24 Jul 2019 09:13:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Fm8U=VV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hqDLI-0000VL-43
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 09:13:48 +0000
X-Inumbo-ID: 54669cee-adf3-11e9-82a0-8bed547028b3
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 54669cee-adf3-11e9-82a0-8bed547028b3;
 Wed, 24 Jul 2019 09:13:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 66594AEC5;
 Wed, 24 Jul 2019 09:13:40 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190528103313.1343-1-jgross@suse.com>
 <f2f3f5f2-8b9c-ac9c-00e8-1e601ec71070@citrix.com>
 <3cb1c2b777e623a55bf87dc12a155734667ab23e.camel@suse.com>
 <c8f4c719-ce7c-9ca0-7d5b-c34db3f21e38@citrix.com>
 <a57d18f4-e947-5c3e-3d8d-6e1371f0c9af@suse.com>
 <864742f0-9b84-e8fe-75be-fa94e217383f@citrix.com>
 <114b18be-6119-58b9-72fc-61c3b8077902@suse.com>
 <ab98171d-8cdc-f3f2-079b-90e69de655b2@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <2311b239-507e-f215-c5b6-01c0a45b7a4c@suse.com>
Date: Wed, 24 Jul 2019 11:13:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <ab98171d-8cdc-f3f2-079b-90e69de655b2@citrix.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 00/60] xen: add core scheduling support
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 RobertVanVossen <robert.vanvossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMDcuMTkgMTY6MjIsIFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4gT24gMTkvMDcvMjAxOSAx
NDo1NywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiAKPj4gSSBoYXZlIG5vdyBhIGdpdCBicmFuY2gg
d2l0aCB0aGUgdHdvIHByb2JsZW1zIGNvcnJlY3RlZCBhbmQgcmViYXNlZCB0bwo+PiBjdXJyZW50
IHN0YWdpbmcgYXZhaWxhYmxlOgo+Pgo+PiBnaXRodWIuY29tL2pncm9zczEveGVuLmdpdCBzY2hl
ZC12MWIKPiAKPiBNYW55IHRoYW5rcyBmb3IgdGhlIGJyYW5jaCEgQXMgZm9yIHRoZSBjcmFzaGVz
LCB2Y3B1X3NsZWVwX3N5bmMoKSBvbmUKPiBzZWVtcyB0byBiZSBmaXhlZCBub3cuIEJ1dCBJIGNh
biBzdGlsbCByZXByb2R1Y2UgdGhlIHNodXRkb3duIG9uZS4KPiBJbnRlcmVzdGluZ2x5LCBpdCBu
b3cgaGFwcGVucyBvbmx5IGlmIGEgaG9zdCBoYXMgcnVubmluZyBWTXMgKHdoaWNoCj4gYXJlIGF1
dG9tYXRpY2FsbHkgcG93ZXJlZCBvZmYgdmlhIFBWIHRvb2xzKToKPiAKPiAoWEVOKSBbICAzMzIu
OTgxMzU1XSBQcmVwYXJpbmcgc3lzdGVtIGZvciBBQ1BJIFM1IHN0YXRlLgo+IChYRU4pIFsgIDMz
Mi45ODE0MTldIERpc2FibGluZyBub24tYm9vdCBDUFVzIC4uLgo+IChYRU4pIFsgIDMzNy43MDM4
OTZdIFdhdGNoZG9nIHRpbWVyIGRldGVjdHMgdGhhdCBDUFUxIGlzIHN0dWNrIQo+IChYRU4pIFsg
IDMzNy43MDk1MzJdIC0tLS1bIFhlbi00LjEzLjAtOC4wLjYtZCAgeDg2XzY0ICBkZWJ1Zz15ICAg
Tm90IHRhaW50ZWQgXS0tLS0KPiAoWEVOKSBbICAzMzcuNzE2ODA4XSBDUFU6ICAgIDEKPiAoWEVO
KSBbICAzMzcuNzE5NTgyXSBSSVA6ICAgIGUwMDg6WzxmZmZmODJkMDgwMjQwNDFjPl0gc2NoZWRf
Y29udGV4dF9zd2l0Y2hlZCsweGFmLzB4MTAxCj4gKFhFTikgWyAgMzM3LjcyNzM4NF0gUkZMQUdT
OiAwMDAwMDAwMDAwMDAwMjAyICAgQ09OVEVYVDogaHlwZXJ2aXNvcgo+IChYRU4pIFsgIDMzNy43
MzMzNjRdIHJheDogMDAwMDAwMDAwMDAwMDAwMiAgIHJieDogZmZmZjgzMDgxY2M2MTViMCAgIHJj
eDogMDAwMDAwMDAwMDAwMDAwMQo+IChYRU4pIFsgIDMzNy43NDEzMzhdIHJkeDogZmZmZjgzMDgx
Y2M2MTYzNCAgIHJzaTogZmZmZjgzMDgxY2M3MjAwMCAgIHJkaTogZmZmZjgzMDgxY2M3MjAwMAo+
IChYRU4pIFsgIDMzNy43NDkzMTJdIHJicDogZmZmZjgzMDgxY2M4ZmRjMCAgIHJzcDogZmZmZjgz
MDgxY2M4ZmRhMCAgIHI4OiAgMDAwMDAwMDAwMDAwMDAwMAo+IChYRU4pIFsgIDMzNy43NTcyODRd
IHI5OiAgMDAwMDAwMDAwMDAwMDAwMCAgIHIxMDogMDAwMDAwNGQ4OGZjNTM1ZSAgIHIxMTogMDAw
MDAwNGRmODY3NWNlNwo+IChYRU4pIFsgIDMzNy43NjUyNTZdIHIxMjogZmZmZjgzMDgxY2M3MjAw
MCAgIHIxMzogZmZmZjgzMDgxY2M3MjAwMCAgIHIxNDogZmZmZjgzMDgxY2NiMGU4MAo+IChYRU4p
IFsgIDMzNy43NzMyMzJdIHIxNTogZmZmZjgzMDgxY2M2MTViMCAgIGNyMDogMDAwMDAwMDA4MDA1
MDAzYiAgIGNyNDogMDAwMDAwMDAwMDE1MjZlMAo+IChYRU4pIFsgIDMzNy43ODEyMDZdIGNyMzog
MDAwMDAwMDBkZDJhMTAwMCAgIGNyMjogZmZmZjg4ODA5ZWQxZmI4MAo+IChYRU4pIFsgIDMzNy43
ODcxMDBdIGZzYjogMDAwMDAwMDAwMDAwMDAwMCAgIGdzYjogZmZmZjg4ODBhMzhjMDAwMCAgIGdz
czogMDAwMDAwMDAwMDAwMDAwMAo+IChYRU4pIFsgIDMzNy43OTUwNzJdIGRzOiAwMDJiICAgZXM6
IDAwMmIgICBmczogMDAwMCAgIGdzOiAwMDAwICAgc3M6IGUwMTAgICBjczogZTAwOAo+IChYRU4p
IFsgIDMzNy44MDI1MjVdIFhlbiBjb2RlIGFyb3VuZCA8ZmZmZjgyZDA4MDI0MDQxYz4gKHNjaGVk
X2NvbnRleHRfc3dpdGNoZWQrMHhhZi8weDEwMSk6Cj4gKFhFTikgWyAgMzM3LjgxMDY3Ml0gIDAw
IDAwIGViIDE4IGYzIDkwIDhiIDAyIDw4NT4gYzAgNzUgZjggZWIgMGUgNDkgOGIgN2UgMzAgNDgg
ODUgZmYgNzQgMDUgZTgKPiAoWEVOKSBbICAzMzcuODE5MDgwXSBYZW4gc3RhY2sgdHJhY2UgZnJv
bSByc3A9ZmZmZjgzMDgxY2M4ZmRhMDoKPiAoWEVOKSBbICAzMzcuODI0NzEzXSAgICBmZmZmODMw
ODFjYzcyMDAwIGZmZmY4MzA4MWNjNzIwMDAgMDAwMDAwMDAwMDAwMDAwMCBmZmZmODMwODFjYzYx
NWIwCj4gKFhFTikgWyAgMzM3LjgzMjc3Ml0gICAgZmZmZjgzMDgxY2M4ZmUwMCBmZmZmODJkMDgw
MjQwNGUwIDAwMDAwMDAwMDAwMDAwODIgZmZmZjgzMDgxY2NiMGU5OAo+IChYRU4pIFsgIDMzNy44
NDA4MzJdICAgIDAwMDAwMDAwMDAwMDAwMDEgZmZmZjgzMDgxY2NiMGU5OCAwMDAwMDAwMDAwMDAw
MDAxIGZmZmY4MmQwODA2MDI2MjgKPiAoWEVOKSBbICAzMzcuODQ4ODk1XSAgICBmZmZmODMwODFj
YzhmZTYwIGZmZmY4MmQwODAyNDBhY2EgMDAwMDAwNGQ4NzNiZDY2OSAwMDAwMDAwMDAwMDAwMDAx
Cj4gKFhFTikgWyAgMzM3Ljg1Njk1Ml0gICAgZmZmZjgzMDgxY2M3MjAwMCAwMDAwMDA0ZDg3M2Jk
YzFjIGZmZmY4MzA4MDAwMDAwZmYgZmZmZjgyZDA4MDViYmEwMAo+IChYRU4pIFsgIDMzNy44NjUw
MTJdICAgIGZmZmY4MmQwODA1YmI5ODAgZmZmZmZmZmZmZmZmZmZmZiBmZmZmODMwODFjYzhmZmZm
IDAwMDAwMDAwMDAwMDAwMDEKPiAoWEVOKSBbICAzMzcuODczMDcyXSAgICBmZmZmODMwODFjYzhm
ZTkwIGZmZmY4MmQwODAyNDIzMTUgMDAwMDAwMDAwMDAwMDA4MCBmZmZmODJkMDgwNWJiOTgwCj4g
KFhFTikgWyAgMzM3Ljg4MTEzMl0gICAgMDAwMDAwMDAwMDAwMDAwMSBmZmZmODJkMDgwNjAyNmYw
IGZmZmY4MzA4MWNjOGZlYTAgZmZmZjgyZDA4MDI0MjM2YQo+IChYRU4pIFsgIDMzNy44ODkxOTZd
ICAgIGZmZmY4MzA4MWNjOGZlZjAgZmZmZjgyZDA4MDI3YTE1MSBmZmZmODJkMDgwMjQyMzE1IDAw
MDAwMDAxMDY2NWYwMDAKPiAoWEVOKSBbICAzMzcuODk3MjU2XSAgICBmZmZmODMwODFjYzcyMDAw
IGZmZmY4MzA4MWNjNzIwMDAgZmZmZjgzMDgwNjY1ZjAwMCBmZmZmODMwODFjYzYzMDAwCj4gKFhF
TikgWyAgMzM3LjkwNTMxM10gICAgMDAwMDAwMDAwMDAwMDAwMSBmZmZmODMwODA2Njg0MDAwIGZm
ZmY4MzA4MWNjOGZkNzggZmZmZjg4ODA5ZWUwODAwMAo+IChYRU4pIFsgIDMzNy45MTMzNzNdICAg
IGZmZmY4ODgwOWVlMDgwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAw
MDAwMDAwMDAwMDMKPiAoWEVOKSBbICAzMzcuOTIxNDM0XSAgICBmZmZmODg4MDllZTA4MDAwIDAw
MDAwMDAwMDAwMDAyNDYgYWFhYWFhYWFhYWFhYWFhYSAwMDAwMDAwMDAwMDAwMDAwCj4gKFhFTikg
WyAgMzM3LjkyOTQ5N10gICAgMDAwMDAwMDA5Njk2OGFiZSAwMDAwMDAwMDAwMDAwMDAwIGZmZmZm
ZmZmODEwMDEzYWEgZmZmZmZmZmY4MjAzYzE5MAo+IChYRU4pIFsgIDMzNy45Mzc1NTRdICAgIGRl
YWRiZWVmZGVhZGYwMGQgZGVhZGJlZWZkZWFkZjAwZCAwMDAwMDEwMDAwMDAwMDAwIGZmZmZmZmZm
ODEwMDEzYWEKPiAoWEVOKSBbICAzMzcuOTQ1NjE1XSAgICAwMDAwMDAwMDAwMDBlMDMzIDAwMDAw
MDAwMDAwMDAyNDYgZmZmZmM5MDA0MDBhZmViMCAwMDAwMDAwMDAwMDBlMDJiCj4gKFhFTikgWyAg
MzM3Ljk1MzY3NF0gICAgMDAwMDAwMDAwMDAwYmVlZiAwMDAwMDAwMDAwMDBiZWVmIDAwMDAwMDAw
MDAwMGJlZWYgMDAwMDAwMDAwMDAwYmVlZgo+IChYRU4pIFsgIDMzNy45NjE3MzZdICAgIDAwMDBl
MDEwMDAwMDAwMDEgZmZmZjgzMDgxY2M3MjAwMCAwMDAwMDAzNzljNjZkYjgwIDAwMDAwMDAwMDAx
NTI2ZTAKPiAoWEVOKSBbICAzMzcuOTY5Nzk3XSAgICAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAw
MDAwMDAwMDAgMDAwMDA2MDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwCj4gKFhFTikgWyAgMzM3
Ljk3Nzg1Nl0gWGVuIGNhbGwgdHJhY2U6Cj4gKFhFTikgWyAgMzM3Ljk4MTE1Ml0gICAgWzxmZmZm
ODJkMDgwMjQwNDFjPl0gc2NoZWRfY29udGV4dF9zd2l0Y2hlZCsweGFmLzB4MTAxCj4gKFhFTikg
WyAgMzM3Ljk4ODA4M10gICAgWzxmZmZmODJkMDgwMjQwNGUwPl0gc2NoZWR1bGUuYyNzY2hlZF9j
b250ZXh0X3N3aXRjaCsweDcyLzB4MTUxCj4gKFhFTikgWyAgMzM3Ljk5NTc5Nl0gICAgWzxmZmZm
ODJkMDgwMjQwYWNhPl0gc2NoZWR1bGUuYyNzY2hlZF9zbGF2ZSsweDJhMy8weDJiMgo+IChYRU4p
IFsgIDMzOC4wMDI4MTddICAgIFs8ZmZmZjgyZDA4MDI0MjMxNT5dIHNvZnRpcnEuYyNfX2RvX3Nv
ZnRpcnErMHg4NS8weDkwCj4gKFhFTikgWyAgMzM4LjAwOTY2NF0gICAgWzxmZmZmODJkMDgwMjQy
MzZhPl0gZG9fc29mdGlycSsweDEzLzB4MTUKPiAoWEVOKSBbICAzMzguMDE1NDcxXSAgICBbPGZm
ZmY4MmQwODAyN2ExNTE+XSBkb21haW4uYyNpZGxlX2xvb3ArMHhiMi8weGM5Cj4gKFhFTikgWyAg
MzM4LjAyMTk3MF0KPiAoWEVOKSBbICAzMzguMDIzOTY1XSBDUFU3IEAgZTAwODpmZmZmODJkMDgw
MjQyZjk0IChzdG9wX21hY2hpbmUuYyNzdG9wbWFjaGluZV9hY3Rpb24rMHgzMC8weGEwKQo+IChY
RU4pIFsgIDMzOC4wMzIzNzJdIENQVTUgQCBlMDA4OmZmZmY4MmQwODAyNDJmOTQgKHN0b3BfbWFj
aGluZS5jI3N0b3BtYWNoaW5lX2FjdGlvbisweDMwLzB4YTApCj4gKFhFTikgWyAgMzM4LjA0MDc3
Nl0gQ1BVNCBAIGUwMDg6ZmZmZjgyZDA4MDI0MmY5NCAoc3RvcF9tYWNoaW5lLmMjc3RvcG1hY2hp
bmVfYWN0aW9uKzB4MzAvMHhhMCkKPiAoWEVOKSBbICAzMzguMDQ5MTgyXSBDUFUyIEAgZTAwODpm
ZmZmODJkMDgwMjQyZjlhIChzdG9wX21hY2hpbmUuYyNzdG9wbWFjaGluZV9hY3Rpb24rMHgzNi8w
eGEwKQo+IChYRU4pIFsgIDMzOC4wNTc1OTFdIENQVTYgQCBlMDA4OmZmZmY4MmQwODAyNDJmOWEg
KHN0b3BfbWFjaGluZS5jI3N0b3BtYWNoaW5lX2FjdGlvbisweDM2LzB4YTApCj4gKFhFTikgWyAg
MzM4LjA2NTk5OV0gQ1BVMyBAIGUwMDg6ZmZmZjgyZDA4MDI0MmY5YSAoc3RvcF9tYWNoaW5lLmMj
c3RvcG1hY2hpbmVfYWN0aW9uKzB4MzYvMHhhMCkKPiAoWEVOKSBbICAzMzguMDc0NDA2XSBDUFUw
IEAgZTAwODpmZmZmODJkMDgwMjUzMmQxIChuczE2NTUwLmMjbnNfcmVhZF9yZWcrMHgyMS8weDQy
KQo+IChYRU4pIFsgIDMzOC4wODE3NzNdCj4gKFhFTikgWyAgMzM4LjA4Mzc2NF0gKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgo+IChYRU4pIFsgIDMzOC4wODkyMjZdIFBh
bmljIG9uIENQVSAxOgo+IChYRU4pIFsgIDMzOC4wOTI1MjFdIEZBVEFMIFRSQVA6IHZlY3RvciA9
IDIgKG5taSkKPiAoWEVOKSBbICAzMzguMDk2OTQwXSBbZXJyb3JfY29kZT0wMDAwXQo+IChYRU4p
IFsgIDMzOC4xMDA0OTFdICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioK
PiAoWEVOKSBbICAzMzguMTA1OTUxXQo+IChYRU4pIFsgIDMzOC4xMDc5NDZdIFJlYm9vdCBpbiBm
aXZlIHNlY29uZHMuLi4KPiAoWEVOKSBbICAzMzguMTEyMTA1XSBFeGVjdXRpbmcga2V4ZWMgaW1h
Z2Ugb24gY3B1MQo+IChYRU4pIFsgIDMzOC4xMTczODNdIFNob3QgZG93biBhbGwgQ1BVcwo+IAo+
IEFuZCBzaW5jZSBJZ29yIG1hbmFnZWQgdG8gZml4IGtkdW1wLCBJIGNhbiBub3cgcG9zdCBiYWNr
dHJhY2VzIGZyb20KPiBhbGwgQ1BVcyBhcyB3ZWxsOiBodHRwczovL3Bhc3RlLmRlYmlhbi5uZXQv
MTA5MjYwOS8KClRoYW5rcyBmb3IgdGhlIHRlc3QgKGFuZCByZXBvcnQpLgoKVGhlIGZpeCBpcyBh
IG9uZS1saW5lci4gOi0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jIGIveGVu
L2NvbW1vbi9zY2hlZHVsZS5jCmluZGV4IGYwYmM1YjMxNjEuLmRhOWVmYjE0N2YgMTAwNjQ0Ci0t
LSBhL3hlbi9jb21tb24vc2NoZWR1bGUuYworKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKQEAg
LTIyMDcsNiArMjIwNyw3IEBAIHN0YXRpYyBzdHJ1Y3Qgc2NoZWRfdW5pdCAKKnNjaGVkX3dhaXRf
cmVuZGV6dm91c19pbihzdHJ1Y3Qgc2NoZWRfdW5pdCAqcHJldiwKICAgICAgICAgIGlmICggdW5s
aWtlbHkoIXNjaGVkdWxlcl9hY3RpdmUpICkKICAgICAgICAgIHsKICAgICAgICAgICAgICBBU1NF
UlQoaXNfaWRsZV91bml0KHByZXYpKTsKKyAgICAgICAgICAgIGF0b21pY19zZXQoJnByZXYtPm5l
eHRfdGFzay0+cmVuZGV6dm91c19vdXRfY250LCAwKTsKICAgICAgICAgICAgICBwcmV2LT5yZW5k
ZXp2b3VzX2luX2NudCA9IDA7CiAgICAgICAgICB9CiAgICAgIH0KCgpKdWVyZ2VuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
