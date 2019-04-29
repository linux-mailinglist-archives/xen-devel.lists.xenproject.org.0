Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FA1DF54
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 11:23:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL2Sj-0006V1-TD; Mon, 29 Apr 2019 09:20:37 +0000
Received: from mail6.bemta26.messagelabs.com ([85.158.142.42])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <daniel.kiper@oracle.com>) id 1hL2Si-0006Us-4p
 for xen-devel@lists.xensource.com; Mon, 29 Apr 2019 09:20:36 +0000
Received: from [85.158.142.100] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-a.eu-central-1.aws.symcld.net id AF/8D-23857-3E1C6CC5;
 Mon, 29 Apr 2019 09:20:35 +0000
Authentication-Results: mx.messagelabs.com; spf=pass 
 (server-6.tower-225.messagelabs.com: domain of oracle.com designates 
 156.151.31.85 as permitted sender) smtp.mailfrom=oracle.com; dkim=pass 
 (good signature) header.i=@oracle.com header.s=corp-2018-07-02; 
 dmarc=pass (p=none adkim=r aspf=r) header.from=oracle.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHKsWRWlGSWpSXmKPExsUyZ7p8qO6jg8d
 iDG7NNbC4N+U9uwOjx/a+XewBjFGsmXlJ+RUJrBmXf2gU/FerONp5ka2BsUuui5GLQ0hgBaPE
 tcWz2EAcFoGbLBJrd7UyQ2ReMkq8PtLADle2/udnRgjnNaPE1DPrWCGcjYwSzYf6mSCcHkaJc
 9/uAfVwAk1Tldg39wkTiM0moCNx8ctDoDgHh4iAssTz01og9cwCPxglNv75xwxSIyxgKtF9p4
 UNxOYVcJLoeD4basMmFoknh68wQiQEJU7OfMICYjMLaEnc+PeSCWQos4C0xPJ/HCBhTgFniWn
 3NoDdICqgItG5dA5YuYRAqMSLN4fAPpUQmMAkcezXLWZUCRD7KpPE3otuExjFZyFZNwvJulkI
 6xYwMq9itEwqykzPKMlNzMzRNTQw0DU0NNYFkmYGeolVuol6qaW6yal5JUWJQFm9xPJiveLK3
 OScFL281JJNjMCYSylkWLCDcc3S9EOMkhxMSqK8S7cdjRHiS8pPqcxILM6ILyrNSS0+xCjDwa
 EkwRt+4FiMkGBRanpqRVpmDjD6YdISHDxKIrwuIGne4oLE3OLMdIjUKUZ7ji/tj+Yyc8xpfQY
 k+zaCyIetn+cyC7Hk5eelSonzLgFpEwBpyyjNgxsKS1aXGGWlhHkZGRgYhHgKUotyM0tQ5V8x
 inMwKgnzBoJM4cnMK4Hb/QroLCags+LngZ1VkoiQkmpgzNJe9a+jqpahXmnSp5svnHfKKMj9N
 7vU9EVFW+iJjfb9MOduqYkuvzt4XY+d/SpeLc4068arSeEOb4P0DQVYfqsH8k4POBR7TtvH9c
 eCHsNr3AU/fZxO7DVtPp/+w11IY1tZzNbTGguMGuoKHiwXL1TymMabMW8aA7fh4UeTZ8ZLn43
 d+uuUEktxRqKhFnNRcSIAl9JkC1EDAAA=
X-Env-Sender: daniel.kiper@oracle.com
X-Msg-Ref: server-6.tower-225.messagelabs.com!1556529632!2669156!1
X-Originating-IP: [156.151.31.85]
X-SpamReason: No, hits=0.0 required=7.0 tests=newsletters: , UNPARSEABLE_RELAY
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16301 invoked from network); 29 Apr 2019 09:20:34 -0000
Received: from userp2120.oracle.com (HELO userp2120.oracle.com) (156.151.31.85)
 by server-6.tower-225.messagelabs.com with AES256-GCM-SHA384 encrypted SMTP;
 29 Apr 2019 09:20:34 -0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3T9Jb8P074401;
 Mon, 29 Apr 2019 09:20:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=yRuR2jOcLr35+cMJUK2kssBr2BAI8n0syYMWOr5dshI=;
 b=FMO/hlw7jnXZZ4cA6+osUe/lwdzLROxL/QEh5wb0AMGd5VLmD0z6quT3tF+RrDEbXhVI
 wHvggBZMRrT2FfR7NFpZ4akEHl604KjmyBkSerg9ZDPG3vdhyZoGVNb8Qgvp5AWR79ix
 TBdzZR7hericBNtVc1uUOHReYxbp4aArhW7XjwodrXW2PRJHPxwzj7wyx9lr2OsUvasH
 lvBCetz/9D78VvYvfRbqO59iTDRbzPcxMCMacQTgx1B3Fhjn5Dewsvc15FLnzTkBr+B/
 7CnzT/qzHWRPiTCQazmh9qaVioRAOw/1EkT+TWz2UmDUPyuQfLYtRU+t9tetGoDyeZsW xA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 2s4fqpw5ee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Apr 2019 09:20:14 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3T9JZsM010889;
 Mon, 29 Apr 2019 09:20:13 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 2s4yy8vks9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Apr 2019 09:20:13 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x3T9KC5u029623;
 Mon, 29 Apr 2019 09:20:12 GMT
Received: from tomti.i.net-space.pl (/10.175.189.51)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 29 Apr 2019 02:20:11 -0700
Date: Mon, 29 Apr 2019 11:20:07 +0200
From: Daniel Kiper <daniel.kiper@oracle.com>
To: Steven Haigh <netwiz@crc.id.au>
Message-ID: <20190429092007.tbtvcxvuws7xwaht@tomti.i.net-space.pl>
References: <20170706191317.GE21146@char.us.oracle.com>
 <1499370325.22465.107.camel@fedoraproject.org>
 <CACJDEmq4rp7C3EMD2j7+5yi5R_Na_6ejuZhH4aY2=d+g6dBNbQ@mail.gmail.com>
 <1499372357.22465.108.camel@fedoraproject.org>
 <60eb4374d39aa140f82d94dc4dbf40548be87be1.camel@fedoraproject.org>
 <CAO9z1z9S1FE49VJUbOVAy0XWOsfYrXVKgq541fd9eA4eYUsauA@mail.gmail.com>
 <CAP+TRyNpaQgrg6tFezDHjTHTji+0xN_WQ479-pRx4V6wrARLuw@mail.gmail.com>
 <20190426181856.GB19604@char.us.oracle.com>
 <1556419477.10194.1@crc.id.au>
 <20190429085147.f7wx5mqzr3qnde26@tomti.i.net-space.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190429085147.f7wx5mqzr3qnde26@tomti.i.net-space.pl>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9241
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1904290068
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9241
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1904290068
Subject: Re: [Xen-devel] Criteria / validation proposal: drop Xen
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
Cc: Sumantro Mukherjee <sumukher@redhat.com>, peter.jones@redhat.com,
 "Xen-devel@lists.xensource.com" <xen-devel@lists.xensource.com>,
 Konrad Rzeszutek Wilk <konrad@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SSBoYXZlIG5vdCBoZWFyZCB0aGF0IFBldGVyIG1vdmVkIHRvIHRoZSBPcmFjbGUgOy0pKSksIHNv
LCBjaGFuZ2luZyBoaXMKYWRkcmVzcyBiYWNrIHRvIFJlZEhhdCBvbmUuIEFuZCBkcm9wcGluZyBG
ZWRvcmEgdGVzdGluZyBtYWlsaW5nIGxpc3QKYWRkcmVzcyBiZWNhdXNlIEkgZG8gbm90IGhhdmUg
cGVybWlzc2lvbnMgdG8gc2VuZCB0byBpdC4uLgoKT24gTW9uLCBBcHIgMjksIDIwMTkgYXQgMTA6
NTE6NDdBTSArMDIwMCwgRGFuaWVsIEtpcGVyIHdyb3RlOgo+IFNvcnJ5IGZvciB0b3AgcG9zdGlu
Zy4uLgo+Cj4gRllJLCBJIGFtIG9uIHZhY2F0aW9uIHJpZ2h0IG5vdy4gSSB3aWxsIGJlIGJhY2sg
bmV4dCB3ZWVrLiBTbywgaWYgaXQgaXMKPiBub3QgdXJnZW50IEkgd2lsbCBleHBsYWluIGFsbCB0
aGUgc3R1ZmYgYW5kIHVwZGF0ZSByZWxldmFudCBidWcgYXQgdGhlCj4gYmVnaW5uaW5nIG9mIG5l
eHQgd2Vlay4gU29ycnkgZm9yIGRlbGF5Lgo+Cj4gRGFuaWVsCj4KPiBPbiBTdW4sIEFwciAyOCwg
MjAxOSBhdCAxMjo0NDozN1BNICsxMDAwLCBTdGV2ZW4gSGFpZ2ggd3JvdGU6Cj4gPiAoYW5kIHNl
bmRpbmcgdG8gdGhlIGxpc3QgdGhpcyB0aW1lIGR1ZSB0byBHZWFyeSBiZWluZyByYXRoZXIgZmVh
dHVyZWxlc3MKPiA+IG1haWwgY2xpZW50KQo+ID4KPiA+IEFzIG9uZSBvZiB0aG9zZSBiZWluZyBj
YXVnaHQgYnkgcmVncmVzc2lvbnMgdXBncmFkaW5nIEYyOSB0byBGMzAgdW5kZXIgWGVuCj4gPiBE
b21VJ3MsIEkgdGhpbmsgdGhpcyBpcyBhIGJhZCBpZGVhLgo+ID4KPiA+IEl0IHNob3dzIHRoYXQg
aXQgd2Fzbid0IHRlc3RlZCwgYmVjYXVzZSBpdCBkb2Vzbid0IHdvcmsuIFRvIG1lLCB0aGlzIGV4
cG9zZXMKPiA+IHdlYWtuZXNzZXMgaW4gdGhlIHRlc3RpbmcgYW5kIHRoZSBzb2x1dGlvbiBzaG91
bGRuJ3QgYmUgIlRoZSBjaGVjayBmYWlscywKPiA+IHJlbW92ZSB0aGUgY2hlY2siLgo+ID4KPiA+
IE9uIFNhdCwgQXByIDI3LCAyMDE5IGF0IDQ6MTggQU0sIEtvbnJhZCBSemVzenV0ZWsgV2lsawo+
ID4gPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+IHdyb3RlOgo+ID4gPiBPbiBGcmksIEFwciAyNiwg
MjAxOSBhdCAxMDoyMjoxM1BNICswNTMwLCBTdW1hbnRybyBNdWtoZXJqZWUgd3JvdGU6Cj4gPiA+
ID4gIFl1cCArMSBmcm9tIG15IHNpZGUgdG9vLiBYZW4gaXMgaGFyZGx5IHRlc3RlZCBzaW5jZSBh
IGxvdCBvZiB0aW1lLgo+ID4gPgo+ID4gPiBIaSEKPiA+ID4KPiA+ID4gQW5kIHRoYXQgaXMgdGhh
bmtzIHRvIG9uZSBvZiB0aGUgR1JVQjIgYnVncyB0aGF0IG5lZWRzIHNvbWUgbG92ZQo+ID4gPiBm
cm9tIFBldGVyIEpvbmVzLgo+ID4gPgo+ID4gPiBBcyB3aXRob3V0IHRoYXQgYnVnIGJlaW5nIGZp
eGVkIC0gaXQgaXMgdmVyeSBkaWZmaWN1bHQgdG8gdGVzdCBpdCAtIGFzCj4gPiA+IHlvdSBjYW4n
dCBldmVuIGxvYWQgWGVuIQo+ID4gPgo+ID4gPiBJJ3ZlIGFza2VkIHRoZSB1cHN0cmVhbSBHUlVC
IG1haW50YWluZXIgdG8gc2hlZWQgc29tZSBsaWdodCBvbiB0aGUKPiA+ID4gY29uZnVzaW9uIGFi
b3V0IG11bHRpYm9vdDIgKyBTZWN1cmVCb290IC0gaG9wZWZ1bGx5IHRoYXQgd2lsbCByZXNvbHZl
Cj4gPiA+IHRoZSBxdWVzdGlvbi4KPiA+ID4KPiA+ID4gTXkgdm90ZSBpcyB0byBoYXZlIGl0IHJl
bWFpbiBhcyBpcy4KPiA+ID4KPiA+ID4gVGhhbmsgeW91Lgo+ID4gPiA+Cj4gPiA+ID4gIE9uIEZy
aSwgQXByIDI2LCAyMDE5IGF0IDEwOjA3IFBNIEdlb2ZmcmV5IE1hcnIgPGdtYXJyQHJlZGhhdC5j
b20+Cj4gPiA+ID4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiAgPiBTaW5jZSBGMjQsIEkgaGF2ZW4n
dCBzZWVuIG9yIGhlYXJkIG9mIGFueW9uZSB3aG8gdXNlcyBYZW4gb3ZlciBLVk0KPiA+ID4gPiAg
PiBhbnl3aGVyZSBvdGhlciB0aGFuIHRoaXMgdGhyZWFkLi4uIEknbSArMSBmb3IgbWFraW5nIHRo
aXMgdGVzdCBhbgo+ID4gPiA+ICA+ICJPcHRpb25hbCIgb25lLgo+ID4gPiA+ICA+Cj4gPiA+ID4g
ID4gR2VvZmYgTWFycgo+ID4gPiA+ICA+IElSQzogY29yZW1vZHVsZQo+ID4gPiA+ICA+Cj4gPiA+
ID4gID4KPiA+ID4gPiAgPiBPbiBGcmksIEFwciAyNiwgMjAxOSBhdCAxMDozMyBBTSBBZGFtIFdp
bGxpYW1zb24gPAo+ID4gPiA+ICA+IGFkYW13aWxsQGZlZG9yYXByb2plY3Qub3JnPiB3cm90ZToK
PiA+ID4gPiAgPgo+ID4gPiA+ICA+PiBPbiBUaHUsIDIwMTctMDctMDYgYXQgMTM6MTkgLTA3MDAs
IEFkYW0gV2lsbGlhbXNvbiB3cm90ZToKPiA+ID4gPiAgPj4gPiBPbiBUaHUsIDIwMTctMDctMDYg
YXQgMTU6NTkgLTA0MDAsIEtvbnJhZCBSemVzenV0ZWsgV2lsayB3cm90ZToKPiA+ID4gPiAgPj4g
PiA+ID4gPiBJIHdvdWxkIHByZWZlciBmb3IgaXQgdG8gcmVtYWluIGFzIGl0IGlzLgo+ID4gPiA+
ICA+PiA+ID4gPgo+ID4gPiA+ICA+PiA+ID4gPiBUaGlzIGlzIG9ubHkgcHJhY3RpY2FsIGlmIGl0
J3MgZ29pbmcgdG8gYmUgdGVzdGVkLCBhbmQKPiA+ID4gPiB0ZXN0ZWQKPiA+ID4gPiAgPj4gcmVn
dWxhcmx5Cj4gPiA+ID4gID4+ID4gPiA+IC0gbm90ICpvbmx5KiBvbiB0aGUgZmluYWwgcmVsZWFz
ZSBjYW5kaWRhdGUsIHJpZ2h0IGJlZm9yZQo+ID4gPiA+IHdlIHNpZ24KPiA+ID4gPiAgPj4gb2Zm
Cj4gPiA+ID4gID4+ID4gPiA+IG9uIHRoZSByZWxlYXNlLiBJdCBuZWVkcyB0byBiZSB0ZXN0ZWQg
cmVndWxhcmx5IHRocm91Z2hvdXQKPiA+ID4gPiB0aGUKPiA+ID4gPiAgPj4gcmVsZWFzZQo+ID4g
PiA+ICA+PiA+ID4gPiBjeWNsZSwgb24gdGhlIGNvbXBvc2VzIHRoYXQgYXJlICJub21pbmF0ZWQg
Zm9yIHRlc3RpbmciLgo+ID4gPiA+ICA+PiA+ID4KPiA+ID4gPiAgPj4gPiA+IFJpZ2h0LCB3aGlj
aCBpcyB3aHkgSSBhbSBoYXBweSB0aGF0IHlvdSBoYXZlIHBvaW50ZWQgbWUgdG8KPiA+ID4gPiB0
aGUgcmlnaHQKPiA+ID4gPiAgPj4gPiA+IHBsYWNlIHNvIEkgY2FuIGJlIHVwLXRvLWRhdGUuCj4g
PiA+ID4gID4+ID4KPiA+ID4gPiAgPj4gPiBHcmVhdCwgdGhhbmtzLiBTbyBsZXQncyBsZWF2ZSBp
dCBhcyBpdCBpcyBmb3Igbm93LCBidXQgd2UnbGwKPiA+ID4gPiBrZWVwIGFuCj4gPiA+ID4gID4+
ID4gZXllIG9uIHRoaXMgZHVyaW5nIEYyNyBjeWNsZS4gSWYgd2UgZ2V0IHRvLCBzYXksIEJldGEg
YW5kCj4gPiA+ID4gdGhlcmUgYXJlIG5vCj4gPiA+ID4gID4+ID4gcmVzdWx0cyBmb3IgdGhlIHRl
c3QsIHRoYXQncyBnb25uYSBiZSBhIHByb2JsZW0uIFRoYW5rcyEKPiA+ID4gPiAgPj4KPiA+ID4g
PiAgPj4gU28sIGZvciBGZWRvcmEgMzAsIHRoaXMgd2FzIG5vdCB0ZXN0ZWQgdGhyb3VnaG91dCB0
aGUgd2hvbGUKPiA+ID4gPiBjeWNsZS4gSQo+ID4gPiA+ICA+PiB0aGluayB3ZSBjYW4gY29uc2lk
ZXIgdGhlIHByb3Bvc2FsIHRvIHJlbW92ZSB0aGUgY3JpdGVyaW9uIGFjdGl2ZQo+ID4gPiA+ICA+
PiBhZ2Fpbi4KPiA+ID4gPiAgPj4gLS0KPiA+ID4gPiAgPj4gQWRhbSBXaWxsaWFtc29uCj4gPiA+
ID4gID4+IEZlZG9yYSBRQSBDb21tdW5pdHkgTW9ua2V5Cj4gPiA+ID4gID4+IElSQzogYWRhbXcg
fCBUd2l0dGVyOiBBZGFtV19GZWRvcmEgfCBYTVBQOiBhZGFtdyBBVAo+ID4gPiA+IGhhcHB5YXNz
YXNzaW4gLiBuZXQKPiA+ID4gPiAgPj4gaHR0cDovL3d3dy5oYXBweWFzc2Fzc2luLm5ldAo+ID4g
PiA+ICA+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
ID4gPiA+ICA+PiB0ZXN0IG1haWxpbmcgbGlzdCAtLSB0ZXN0QGxpc3RzLmZlZG9yYXByb2plY3Qu
b3JnCj4gPiA+ID4gID4+IFRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8KPiA+ID4gPiB0
ZXN0LWxlYXZlQGxpc3RzLmZlZG9yYXByb2plY3Qub3JnCj4gPiA+ID4gID4+IEZlZG9yYSBDb2Rl
IG9mIENvbmR1Y3Q6Cj4gPiA+ID4gaHR0cHM6Ly9nZXRmZWRvcmEub3JnL2NvZGUtb2YtY29uZHVj
dC5odG1sCj4gPiA+ID4gID4+IExpc3QgR3VpZGVsaW5lczoKPiA+ID4gPiBodHRwczovL2ZlZG9y
YXByb2plY3Qub3JnL3dpa2kvTWFpbGluZ19saXN0X2d1aWRlbGluZXMKPiA+ID4gPiAgPj4gTGlz
dCBBcmNoaXZlczoKPiA+ID4gPiAgPj4gaHR0cHM6Ly9saXN0cy5mZWRvcmFwcm9qZWN0Lm9yZy9h
cmNoaXZlcy9saXN0L3Rlc3RAbGlzdHMuZmVkb3JhcHJvamVjdC5vcmcKPiA+ID4gPiAgPj4KPiA+
ID4gPiAgPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
ID4gPiA+ICA+IHRlc3QgbWFpbGluZyBsaXN0IC0tIHRlc3RAbGlzdHMuZmVkb3JhcHJvamVjdC5v
cmcKPiA+ID4gPiAgPiBUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIHRlc3QtbGVhdmVA
bGlzdHMuZmVkb3JhcHJvamVjdC5vcmcKPiA+ID4gPiAgPiBGZWRvcmEgQ29kZSBvZiBDb25kdWN0
OiBodHRwczovL2dldGZlZG9yYS5vcmcvY29kZS1vZi1jb25kdWN0Lmh0bWwKPiA+ID4gPiAgPiBM
aXN0IEd1aWRlbGluZXM6Cj4gPiA+ID4gaHR0cHM6Ly9mZWRvcmFwcm9qZWN0Lm9yZy93aWtpL01h
aWxpbmdfbGlzdF9ndWlkZWxpbmVzCj4gPiA+ID4gID4gTGlzdCBBcmNoaXZlczoKPiA+ID4gPiAg
PiBodHRwczovL2xpc3RzLmZlZG9yYXByb2plY3Qub3JnL2FyY2hpdmVzL2xpc3QvdGVzdEBsaXN0
cy5mZWRvcmFwcm9qZWN0Lm9yZwo+ID4gPiA+ICA+Cj4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+ICAt
LQo+ID4gPiA+ICAvL3N1bWFudHJvCj4gPiA+ID4gIEZlZG9yYSBRRQo+ID4gPiA+ICBUUklFRCBB
TkQgUEVSU09OQUxMWSBURVNURUQsIEVSR08gVFJVU1RFRAo+ID4gPiA+IDxodHRwczovL3JlZGhh
dC5jb20vdHJ1c3RlZD4KPiA+ID4KPiA+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiA+ID4gWGVuLWRldmVsIG1haWxpbmcgbGlzdAo+ID4gPiBYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiA+ID4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
