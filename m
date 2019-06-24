Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6DF509C1
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2019 13:27:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfN53-0007pY-PH; Mon, 24 Jun 2019 11:24:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1our=UX=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1hfN51-0007pT-VP
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2019 11:24:12 +0000
X-Inumbo-ID: 963acf93-9672-11e9-8980-bc764e045a96
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 963acf93-9672-11e9-8980-bc764e045a96;
 Mon, 24 Jun 2019 11:24:10 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5OBE3xr055940;
 Mon, 24 Jun 2019 11:24:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=Hse7pc/jkTeb5hGjha2juWuLsiZhvUbiJdlAWaOAP+s=;
 b=Nvc/JGvSSYWt+NysVO0DN4y4oM2xgyn2V4pOSzrNqZ79jsdvemzb5ATzpZPairUNv/7D
 z7FLlIBM77QE0E5orbJreVupNn8+CJ/xAgMHpB5qoY/TySo9tPeV75XFuejcuyM01GrX
 VlZEgDfqHdOLGHasB+t7iSLyS1lhghdbf3n3iRJd2c5o2tc6O52nwqpYJsflncpQ4cDo
 0jFDJFW/3BuD2uJQGVxJptOl3qnXOZALF+pVVneUZNgBIAmA9Fkx+0BLFG5wybZxCs7J
 VONDjT2pgWsyWESTRC9W2XzD7OBflXKoXD+AtoDbkaI211WjSVCDBGL+YIC1yYt/glB9 zA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2t9brswtnn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jun 2019 11:24:08 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5OBMfnd091790;
 Mon, 24 Jun 2019 11:24:07 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 2t9p6theq7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jun 2019 11:24:07 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5OBO6Mw001751;
 Mon, 24 Jun 2019 11:24:06 GMT
Received: from tomti.i.net-space.pl (/10.175.180.126)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 24 Jun 2019 04:24:06 -0700
Date: Mon, 24 Jun 2019 13:24:02 +0200
From: Daniel Kiper <daniel.kiper@oracle.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190624112402.thhrmu7tynfnjujw@tomti.i.net-space.pl>
References: <20190619110250.18881-1-roger.pau@citrix.com>
 <20190619110250.18881-4-roger.pau@citrix.com>
 <5D0A31210200007800239AC0@prv1-mh.provo.novell.com>
 <20190619150631.5dhiozx4bybqjbrl@MacBook-Air-de-Roger.local>
 <5D0C7A650200007800239F04@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5D0C7A650200007800239F04@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9297
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=965
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906240094
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9297
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906240094
Subject: Re: [Xen-devel] [PATCH 3/4] x86/linker: add a reloc section to ELF
 binary
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdW4gMjEsIDIwMTkgYXQgMTI6MzQ6MTNBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE5LjA2LjE5IGF0IDE3OjA2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMDY6NTc6MDVBTSAtMDYwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gPj4+IE9uIDE5LjA2LjE5IGF0IDEzOjAyLCA8cm9nZXIucGF1QGNp
dHJpeC5jb20+IHdyb3RlOgo+ID4+ID4gSWYgdGhlIGh5cGVydmlzb3IgaGFzIGJlZW4gYnVpbHQg
d2l0aCBFRkkgc3VwcG9ydCAoaWU6IG11bHRpYm9vdDIpLgo+ID4+ID4gVGhpcyBhbGxvd3MgdG8g
cG9zaXRpb24gdGhlIC5yZWxvYyBzZWN0aW9uIGNvcnJlY3RseSBpbiB0aGUgb3V0cHV0Cj4gPj4g
PiBiaW5hcnksIG9yIGVsc2UgdGhlIGxpbmtlciBtaWdodCBwbGFjZSAucmVsb2MgYmVmb3JlIHRo
ZSAudGV4dAo+ID4+ID4gc2VjdGlvbi4KPiA+PiA+Cj4gPj4gPiBOb3RlIHRoYXQgdGhlIC5yZWxv
YyBzZWN0aW9uIGlzIG1vdmVkIGJlZm9yZSAuYnNzIGZvciB0d28gcmVhc29uczogaW4KPiA+PiA+
IG9yZGVyIGZvciB0aGUgcmVzdWx0aW5nIGJpbmFyeSB0byBub3QgY29udGFpbiBhbnkgc2VjdGlv
biB3aXRoIGRhdGEKPiA+PiA+IGFmdGVyIC5ic3MsIHNvIHRoYXQgdGhlIGZpbGUgc2l6ZSBjYW4g
YmUgc21hbGxlciB0aGFuIHRoZSBsb2FkZWQKPiA+PiA+IG1lbW9yeSBzaXplLCBhbmQgYmVjYXVz
ZSB0aGUgZGF0YSBpdCBjb250YWlucyBpcyByZWFkLW9ubHksIHNvIGl0Cj4gPj4gPiBiZWxvbmdz
IHdpdGggdGhlIG90aGVyIHNlY3Rpb25zIGNvbnRhaW5pbmcgcmVhZC1vbmx5IGRhdGEuCj4gPj4K
PiA+PiBXaGlsZSB0aGlzIG1heSBiZSBmaW5lIGZvciBFTEYsIEknbSBhZnJhaWQgaXQgd291bGQg
YmUgY2FsbGluZyBmb3IKPiA+PiBzdWJ0bGUgaXNzdWVzIHdpdGggeGVuLmVmaSAoaS5lLiB0aGUg
UEUgYmluYXJ5KTogVGhlcmUgYSAucmVsb2MKPiA+PiBzZWN0aW9uIGlzIGdlbmVyYWxseSBleHBl
Y3RlZCB0byBjb21lIGFmdGVyICJub3JtYWwiIGRhdGEKPiA+PiBzZWN0aW9ucy4KPiA+Cj4gPiBP
Sywgd291bGQgeW91IGxpa2UgbWUgdG8gbGVhdmUgdGhlIC5yZWxvYyBzZWN0aW9uIGF0IHRoZSBw
cmV2aW91cwo+ID4gcG9zaXRpb24gZm9yIEVGSSBidWlsZHMgdGhlbj8KPgo+IFdlbGwsIHRoaXMg
cGFydCBpcyBhIHJlcXVpcmVtZW50LCBub3QgYSBxdWVzdGlvbiBvZiBtZSBsaWtpbmcgeW91Cj4g
dG8gZG8gc28uCj4KPiA+IE9yIGRvIHdlIHByZWZlciB0byBsZWF2ZSAucmVsb2Mgb3JwaGFuZWQg
aW4gdGhlIEVMRiBidWlsZD8KPgo+IERhbmllbCBtaWdodCBoYXZlIGFuIG9waW5pb24gaGVyZSB3
aXRoIGhpcyBwbGFucyB0byBhY3R1YWxseQo+IGFkZCByZWxvY2F0aW9ucyB0aGVyZSBpbiB0aGUg
bm9uLWxpbmtlci1nZW5lcmF0ZWQtUEUgYnVpbGQuIEkKPiBkb24ndCBoYXZlIGEgc3Ryb25nIG9w
aW5pb24gZWl0aGVyIHdheSwgYXMgbG9uZyBhcyB0aGUKPiBjdXJyZW50IG1ldGhvZCBvZiBidWls
ZGluZyBnZXRzIGxlZnQgYXMgaXMgKG9yIGV2ZW4gc2ltcGxpZmllZCkuCgpJIHdvdWxkIG5vdCBk
cm9wIC5yZWxvYyBzZWN0aW9uIGZyb20geGVuLXN5bXMgYmVjYXVzZSBpdCBjYW4gYmUgdXNlZnVs
CmZvciAibWFudWFsIiBFRkkgaW1hZ2UgcmVsb2NzIGdlbmVyYXRpb24uIEhvd2V2ZXIsIEkgYW0g
bm90IHN0cm9uZ2x5CnRpZWQgdG8gaXQuIElmIHlvdSB3aXNoIHRvIGRyb3AgaXQgZ28gYWhlYWQu
IEkgY2FuIHJlYWRkIGl0IGxhdHRlciBpZgpJIGdldCBiYWNrIHRvIG15IG5ldyBQRSBidWlsZCB3
b3JrLgoKRGFuaWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
