Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1882F39B4A
	for <lists+xen-devel@lfdr.de>; Sat,  8 Jun 2019 07:38:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hZTyk-0007uk-Jq; Sat, 08 Jun 2019 05:33:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4/yG=UH=oracle.com=ankur.a.arora@srs-us1.protection.inumbo.net>)
 id 1hZTyj-0007uf-JL
 for xen-devel@lists.xenproject.org; Sat, 08 Jun 2019 05:33:21 +0000
X-Inumbo-ID: e9ca56cc-89ae-11e9-8f3c-1fdbd2fb449d
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e9ca56cc-89ae-11e9-8f3c-1fdbd2fb449d;
 Sat, 08 Jun 2019 05:33:15 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x585UAcs070273;
 Sat, 8 Jun 2019 05:33:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=eiAzEcwEsrXend+6SD1rxPdREd1UzGq+EuVlOEUZbFs=;
 b=G9b4fDqNvqgEhKP1VCgHDVOPH2TZn7tBWB5wVy2yQ5F5CJT/Z59JldhXNlUBRV6GjpwV
 +4MHJzRK6M2ugKuwx/pnl7jzw9U1iY9rhuHVcmSmYbeMQixGUAHYY93p9gD3HZjRdYYU
 IZB7dUn2NE5K1L+6SfhoCvgm7bMfdMQ2JZI4rG2amTLoonCQOMNXURQmvAFq6wZOC6SV
 BSV8X75dsHL5YRLu+Lo30VJ2uB8k8/g8NmaIdoJlGk93D25/909FlbMFvWSVNrwIazR9
 PkEiuPgrtooWILslFWb0I2uJjp1LaUSV5/kfp0K6lSdpYKYDWNBWaMt29q93hB9UOAKX eQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2t04et87pp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 08 Jun 2019 05:33:13 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x585WdSB069308;
 Sat, 8 Jun 2019 05:33:12 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 2t04bkhpur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 08 Jun 2019 05:33:12 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x585XBVI018659;
 Sat, 8 Jun 2019 05:33:11 GMT
Received: from [192.168.0.110] (/70.36.60.91)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 07 Jun 2019 22:33:11 -0700
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20190509172540.12398-1-ankur.a.arora@oracle.com>
 <5649cfd1-24df-2196-2888-b00fc3ace7ad@suse.com>
From: Ankur Arora <ankur.a.arora@oracle.com>
Message-ID: <a5620ab0-7dc5-f75a-cc1e-9142b21570a8@oracle.com>
Date: Fri, 7 Jun 2019 22:33:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5649cfd1-24df-2196-2888-b00fc3ace7ad@suse.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9281
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906080042
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9281
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906080042
Subject: Re: [Xen-devel] [RFC PATCH 00/16] xenhost support
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
Cc: pbonzini@redhat.com, boris.ostrovsky@oracle.com, sstabellini@kernel.org,
 joao.m.martins@oracle.com, konrad.wilk@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAxOS0wNi0wNyA3OjUxIGEubS4sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gT24gMDkuMDUu
MTkgMTk6MjUsIEFua3VyIEFyb3JhIHdyb3RlOgo+PiBIaSBhbGwsCj4+Cj4+IFRoaXMgaXMgYW4g
UkZDIGZvciB4ZW5ob3N0IHN1cHBvcnQsIG91dGxpbmVkIGhlcmUgYnkgSnVlcmdlbiBoZXJlOgo+
PiBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOS80LzgvNjcuCj4gCj4gRmlyc3Q6IHRoYW5rcyBm
b3IgYWxsIHRoZSBlZmZvcnQgeW91J3ZlIHB1dCBpbnRvIHRoaXMgc2VyaWVzIQo+IAo+PiBUaGUg
aGlnaCBsZXZlbCBpZGVhIGlzIHRvIHByb3ZpZGUgYW4gYWJzdHJhY3Rpb24gb2YgdGhlIFhlbgo+
PiBjb21tdW5pY2F0aW9uIGludGVyZmFjZSwgYXMgYSB4ZW5ob3N0X3QuCj4+Cj4+IHhlbmhvc3Rf
dCBleHBvc2Ugb3BzIGZvciBjb21tdW5pY2F0aW9uIGJldHdlZW4gdGhlIGd1ZXN0IGFuZCBYZW4K
Pj4gKGh5cGVyY2FsbCwgY3B1aWQsIHNoYXJlZF9pbmZvL3ZjcHVfaW5mbywgZXZ0Y2huLCBncmFu
dC10YWJsZSBhbmQgb24gdG9wCj4+IG9mIHRob3NlLCB4ZW5idXMsIGJhbGxvb25pbmcpLCBhbmQg
dGhlc2UgY2FuIGRpZmZlciBiYXNlZCBvbiB0aGUga2luZAo+PiBvZiB1bmRlcmx5aW5nIFhlbjog
cmVndWxhciwgbG9jYWwsIGFuZCBuZXN0ZWQuCj4gCj4gSSdtIG5vdCBzdXJlIHdlIG5lZWQgdG8g
YWJzdHJhY3QgYXdheSBoeXBlcmNhbGxzIGFuZCBjcHVpZC4gSSBiZWxpZXZlIGluCj4gY2FzZSBv
ZiBuZXN0ZWQgWGVuIGFsbCBjb250YWN0cyB0byB0aGUgTDAgaHlwZXJ2aXNvciBzaG91bGQgYmUg
ZG9uZSB2aWEKPiB0aGUgTDEgaHlwZXJ2aXNvci4gU28gd2UgbWlnaHQgbmVlZCB0byBpc3N1ZSBz
b21lIGtpbmQgb2YgcGFzc3Rocm91Z2gKWWVzLCB0aGF0IGRvZXMgbWFrZSBzZW5zZS4gVGhpcyBh
bHNvIGFsbG93cyB0aGUgTDEgaHlwZXJ2aXNvciB0bwpjb250cm9sIHdoaWNoIGh5cGVyY2FsbHMg
Y2FuIGJlIG5lc3RlZC4KQXMgZm9yIGNwdWlkLCB3aGF0IGFib3V0IG5lc3RlZCBmZWF0dXJlIGRp
c2NvdmVyeSBzdWNoIGFzIGluCmdudHRhYl9uZWVkX3YyKCk/CihUaG91Z2ggZm9yIHRoaXMgcGFy
dGljdWxhciBjYXNlLCB0aGUgaHlwZXJjYWxsIHNob3VsZCBiZSBmaW5lLikKCj4gaHlwZXJjYWxs
IHdoZW4gZS5nLiBncmFudGluZyBhIHBhZ2UgdG8gTDAgZG9tMCwgYnV0IHRoaXMgc2hvdWxkIGJl
Cj4gaGFuZGxlZCB2aWEgdGhlIGdyYW50IGFic3RyYWN0aW9uIChldmVudHMgc2hvdWxkIGJlIHNp
bWlsYXIpLgo+IAo+IFNvIElNTyB3ZSBzaG91bGQgZHJvcCBwYXRjaGVzIDItNS4KRm9yIDMtNSwg
SSdkIGxpa2UgdG8gcHJ1bmUgdGhlbSB0byBwcm92aWRlIGEgbGltaXRlZCBoeXBlcmNhbGwKcmVn
aXN0cmF0aW9uIGFiaWxpdHkgLS0gdGhpcyBpcyBtZWFudCB0byBiZSB1c2VkIGZvciB0aGUKeGVu
aG9zdF9yMC94ZW5ob3N0X2xvY2FsIGNhc2UuCgpBbmt1cgoKPiAKPj4gKFNpbmNlIHRoaXMgYWJz
dHJhY3Rpb24gaXMgbGFyZ2VseSBhYm91dCBndWVzdCAtLSB4ZW5ob3N0IGNvbW11bmljYXRpb24s
Cj4+IG5vIG9wcyBhcmUgbmVlZGVkIGZvciB0aW1lciwgY2xvY2ssIHNjaGVkLCBtZW1vcnkgKE1N
VSwgUDJNKSwgVkNQVSBtZ210Lgo+PiBldGMuKQo+Pgo+PiBYZW5ob3N0IHVzZS1jYXNlczoKPj4K
Pj4gUmVndWxhci1YZW46IHRoZSBzdGFuZGFyZCBYZW4gaW50ZXJmYWNlIHByZXNlbnRlZCB0byBh
IGd1ZXN0LAo+PiBzcGVjaWZpY2FsbHkgZm9yIGNvbXVuaWNhdGlvbiBiZXR3ZWVuIEx4LWd1ZXN0
IGFuZCBMeC1YZW4uCj4+Cj4+IExvY2FsLVhlbjogYSBYZW4gbGlrZSBpbnRlcmZhY2Ugd2hpY2gg
cnVucyBpbiB0aGUgc2FtZSBhZGRyZXNzIHNwYWNlIGFzCj4+IHRoZSBndWVzdCAoZG9tMCkuIFRo
aXMsIGNhbiBhY3QgYXMgdGhlIGRlZmF1bHQgeGVuaG9zdC4KPj4KPj4gVGhlIG1ham9yIHdheXMg
aXQgZGlmZmVycyBmcm9tIGEgcmVndWxhciBYZW4gaW50ZXJmYWNlIGlzIGluIHByZXNlbnRpbmcK
Pj4gYSBkaWZmZXJlbnQgaHlwZXJjYWxsIGludGVyZmFjZSAoY2FsbCBpbnN0ZWFkIG9mIGEgc3lz
Y2FsbC92bWNhbGwpLCBhbmQKPj4gaW4gYW4gaW5hYmlsaXR5IHRvIGRvIGdyYW50LW1hcHBpbmdz
OiBzaW5jZSBsb2NhbC1YZW4gZXhpc3RzIGluIHRoZSBzYW1lCj4+IGFkZHJlc3Mgc3BhY2UgYXMg
WGVuLCB0aGVyZSdzIG5vIHdheSBmb3IgaXQgdG8gY2hlYXBseSBjaGFuZ2UgdGhlCj4+IHBoeXNp
Y2FsIHBhZ2UgdGhhdCBhIEdGTiBtYXBzIHRvIChhc3N1bWluZyBubyBQMk0gdGFibGVzLikKPj4K
Pj4gTmVzdGVkLVhlbjogdGhpcyBjaGFubmVsIGlzIHRvIFhlbiwgb25lIGxldmVsIHJlbW92ZWQ6
IGZyb20gTDEtZ3Vlc3QgdG8KPj4gTDAtWGVuLiBUaGUgdXNlIGNhc2UgaXMgdGhhdCB3ZSB3YW50
IEwwLWRvbTAtYmFja2VuZHMgdG8gdGFsayB0bwo+PiBMMS1kb20wLWZyb250ZW5kIGRyaXZlcnMg
d2hpY2ggY2FuIHRoZW4gcHJlc2VudCBQViBkZXZpY2VzIHdoaWNoIGNhbgo+PiBpbi10dXJuIGJl
IHVzZWQgYnkgdGhlIEwxLWRvbTAtYmFja2VuZCBkcml2ZXJzIGFzIHJhdyB1bmRlcmx5aW5nIGRl
dmljZXMuCj4+IFRoZSBpbnRlcmZhY2VzIHRoZW1zZWx2ZXMsIGJyb2FkbHkgcmVtYWluIHNpbWls
YXIuCj4+Cj4+IE5vdGU6IEwwLVhlbiwgTDEtWGVuIHJlcHJlc2VudCBYZW4gcnVubmluZyBhdCB0
aGF0IG5lc3RpbmcgbGV2ZWwKPj4gYW5kIEwwLWd1ZXN0LCBMMS1ndWVzdCByZXByZXNlbnQgZ3Vl
c3RzIHRoYXQgYXJlIGNoaWxkcmVuIG9mIFhlbgo+PiBhdCB0aGF0IG5lc3RpbmcgbGV2ZWwuIEx4
LCByZXByZXNlbnRzIGFueSBsZXZlbC4KPj4KPj4gUGF0Y2hlcyAxLTcsCj4+IMKgwqAgIng4Ni94
ZW46IGFkZCB4ZW5ob3N0X3QgaW50ZXJmYWNlIgo+PiDCoMKgICJ4ODYveGVuOiBjcHVpZCBzdXBw
b3J0IGluIHhlbmhvc3RfdCIKPj4gwqDCoCAieDg2L3hlbjogbWFrZSBoeXBlcmNhbGxfcGFnZSBn
ZW5lcmljIgo+PiDCoMKgICJ4ODYveGVuOiBoeXBlcmNhbGwgc3VwcG9ydCBmb3IgeGVuaG9zdF90
Igo+PiDCoMKgICJ4ODYveGVuOiBhZGQgZmVhdHVyZSBzdXBwb3J0IGluIHhlbmhvc3RfdCIKPj4g
wqDCoCAieDg2L3hlbjogYWRkIHNoYXJlZF9pbmZvIHN1cHBvcnQgdG8geGVuaG9zdF90Igo+PiDC
oMKgICJ4ODYveGVuOiBtYWtlIHZjcHVfaW5mbyBwYXJ0IG9mIHhlbmhvc3RfdCIKPj4gYWJzdHJh
Y3Qgb3V0IGludGVyZmFjZXMgdGhhdCBzZXR1cCAKPj4gaHlwZXJjYWxscy9jcHVpZC9zaGFyZWRf
aW5mby92Y3B1X2luZm8gZXRjLgo+Pgo+PiBQYXRjaCA4LCAieDg2L3hlbjogaXJxL3VwY2FsbCBo
YW5kbGluZyB3aXRoIG11bHRpcGxlIHhlbmhvc3RzIgo+PiBzZXRzIHVwIHRoZSB1cGNhbGwgYW5k
IHB2X2lycSBvcHMgYmFzZWQgb24gdmNwdV9pbmZvLgo+Pgo+PiBQYXRjaCA5LCAieGVuL2V2dGNo
bjogc3VwcG9ydCBldnRjaG4gaW4geGVuaG9zdF90IiBhZGRzIHhlbmhvc3QgYmFzZWQKPj4gZXZ0
Y2huIHN1cHBvcnQgZm9yIGV2dGNobl8ybC4KPj4KPj4gUGF0Y2hlcyAxMCBhbmQgMTYsICJ4ZW4v
YmFsbG9vbjogc3VwcG9ydCBiYWxsb29uaW5nIGluIHhlbmhvc3RfdCIgYW5kCj4+ICJ4ZW4vZ3Jh
bnQtdGFibGU6IGhvc3RfYWRkciBmaXh1cCBpbiBtYXBwaW5nIG9uIHhlbmhvc3RfcjAiCj4+IGlt
cGxlbWVudCBzdXBwb3J0IGZyb20gR05UVEFCT1BfbWFwX2dyYW50X3JlZiBmb3IgeGVuaG9zdHMg
b2YgdHlwZQo+PiB4ZW5ob3N0X3IwICh4ZW5ob3N0IGxvY2FsLikKPj4KPj4gUGF0Y2ggMTIsICJ4
ZW4veGVuYnVzOiBzdXBwb3J0IHhlbmJ1cyBmcm9udGVuZC9iYWNrZW5kIHdpdGggeGVuaG9zdF90
Igo+PiBtYWtlcyB4ZW5idXMgc28gdGhhdCBib3RoIGl0cyBmcm9udGVuZCBhbmQgYmFja2VuZCBj
YW4gYmUgYm9vdHN0cmFwcGVkCj4+IHNlcGFyYXRlbHkgdmlhIHNlcGFyYXRlIHhlbmhvc3RzLgo+
Pgo+PiBSZW1haW5pbmcgcGF0Y2hlcywgMTEsIDEzLCAxNCwgMTU6Cj4+IMKgwqAgInhlbi9ncmFu
dC10YWJsZTogbWFrZSBncmFudC10YWJsZSB4ZW5ob3N0IGF3YXJlIgo+PiDCoMKgICJkcml2ZXJz
L3hlbjogZ250dGFiLCBldnRjaG4sIHhlbmJ1cyBBUEkgY2hhbmdlcyIKPj4gwqDCoCAieGVuL2Js
azogZ250dGFiLCBldnRjaG4sIHhlbmJ1cyBBUEkgY2hhbmdlcyIKPj4gwqDCoCAieGVuL25ldDog
Z250dGFiLCBldnRjaG4sIHhlbmJ1cyBBUEkgY2hhbmdlcyIKPj4gYXJlIG1vc3RseSBtZWNoYW5p
Y2FsIGNoYW5nZXMgZm9yIEFQSXMgdGhhdCBub3cgdGFrZSB4ZW5ob3N0X3QgKgo+PiBhcyBwYXJh
bWV0ZXIuCj4+Cj4+IFRoZSBjb2RlIGl0c2VsZiBpcyBSRkMgcXVhbGl0eSwgYW5kIGlzIG1vc3Rs
eSBtZWFudCB0byBnZXQgZmVlZGJhY2sgCj4+IGJlZm9yZQo+PiBwcm9jZWVkaW5nIGZ1cnRoZXIu
IEFsc28gbm90ZSB0aGF0IHRoZSBGSUZPIGxvZ2ljIGFuZCBzb21lIFhlbiBkcml2ZXJzCj4+IChp
bnB1dCwgcGNpYmFjaywgc2NzaSBldGMpIGFyZSBtb3N0bHkgdW5jaGFuZ2VkLCBzbyB3aWxsIG5v
dCBidWlsZC4KPj4KPj4KPj4gUGxlYXNlIHRha2UgYSBsb29rLgo+IAo+IAo+IEp1ZXJnZW4KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
