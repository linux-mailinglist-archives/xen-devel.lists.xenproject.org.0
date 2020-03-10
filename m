Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9011801F9
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 16:36:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBgsi-0000p1-Gj; Tue, 10 Mar 2020 15:33:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EhAh=43=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBgsh-0000ov-E5
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 15:33:19 +0000
X-Inumbo-ID: 77264350-62e4-11ea-add0-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 77264350-62e4-11ea-add0-12813bfff9fa;
 Tue, 10 Mar 2020 15:33:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 63C65AD1E;
 Tue, 10 Mar 2020 15:33:17 +0000 (UTC)
To: paul@xen.org
References: <20200309102304.1251-1-paul@xen.org>
 <20200309102304.1251-4-paul@xen.org>
 <ae9cc4a6-0378-571c-9d46-0561e536884f@suse.com>
 <001301d5f6e0$61aa5e00$24ff1a00$@xen.org>
 <bbb910df-2f61-2a67-b360-82b5988810d7@suse.com>
 <002d01d5f6ed$4b0b2000$e1216000$@xen.org>
 <1b2299fa-c19c-19fc-820a-783642ea85d5@suse.com>
 <002f01d5f6ee$e2edc3e0$a8c94ba0$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <89616d2f-62ae-8c08-377c-0a7c3f082884@suse.com>
Date: Tue, 10 Mar 2020 16:33:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <002f01d5f6ee$e2edc3e0$a8c94ba0$@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 3/6] x86 / pv: do not treat PGC_extra
 pages as RAM
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
Cc: xen-devel@lists.xenproject.org, 'Paul Durrant' <pdurrant@amazon.com>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 'Wei Liu' <wl@xen.org>, 'Andrew Cooper' <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDMuMjAyMCAxNjoxNiwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+
IFNlbnQ6IDEwIE1hcmNoIDIwMjAgMTU6MTMKPj4gVG86IHBhdWxAeGVuLm9yZwo+PiBDYzogeGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyAnUGF1bCBEdXJyYW50JyA8cGR1cnJhbnRAYW1h
em9uLmNvbT47ICdBbmRyZXcgQ29vcGVyJwo+PiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47
ICdXZWkgTGl1JyA8d2xAeGVuLm9yZz47ICdSb2dlciBQYXUgTW9ubsOpJyA8cm9nZXIucGF1QGNp
dHJpeC5jb20+Cj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgMy82XSB4ODYgLyBwdjogZG8gbm90
IHRyZWF0IFBHQ19leHRyYSBwYWdlcyBhcyBSQU0KPj4KPj4gT24gMTAuMDMuMjAyMCAxNjowNSwg
UGF1bCBEdXJyYW50IHdyb3RlOgo+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4+Pj4g
RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Pj4+IFNlbnQ6IDEwIE1hcmNo
IDIwMjAgMTQ6NTkKPj4+Pgo+Pj4+IEluIHJlcGx5IHRvIHBhdGNoIDYgSSBkaWQgc3VnZ2VzdCB0
bwo+Pj4+IGhhdmUgYSBzZXBhcmF0ZSBsaXN0LCBidXQgd2l0aG91dCB0YWtpbmcgdGhlc2UgcGFn
ZXMgb2ZmCj4+Pj4gZC0+cGFnZV9saXN0LAo+Pj4KPj4+IEhvdyB3b3VsZCB0aGF0IHdvcmsgd2l0
aG91dCBhZGRpbmcgYW4gZXh0cmEgcGFnZV9saXN0X2VudHJ5IGludG8gc3RydWN0IHBhZ2VfaW5m
bz8KPj4KPj4gQXMgc2FpZCB0aGVyZSwgaXQnZCBiZSBhIHNpbmdseSBsaW5rZWQgbGlzdCB1c2lu
ZyBhIF9fcGR4X3QKPj4gZmllbGQganVzdCBsaWtlIHRoZXJlIGFscmVhZHkgaXMgd2l0aCAibmV4
dF9zaGFkb3ciLCBpLmUuCj4+IHlvdSdkIGFkZCBhbm90aGVyIHVuaW9uIG1lbWJlciAibmV4dF9l
eHRyYSIgb3Igc29tZSBzdWNoLiBPZgo+PiBjb3Vyc2UgdGhlIGxpc3Qgc2hvdWxkbid0IGdyb3cg
dG9vIGxvbmcsIG9yIGVsc2UgaW5zZXJ0aW9uCj4+IGFuZCByZW1vdmFsIG1heSBiZWNvbWUgYSBi
b3R0bGVuZWNrLiBOb3Qgc3VyZSBob3cgd2VsbCB0aGlzCj4+IHdvdWxkIGZpdCBBcm0sIHRob3Vn
aDsgbWF5YmUgdGhleSB3b3VsZG4ndCBuZWVkIHRoaXMsIGJ1dAo+PiB0aGF0IGRlcGVuZHMgb24g
d2hldGhlciB0aGUgbGlzdCB3b3VsZCBiZSB1c2VkIGZvciBwdXJwb3Nlcwo+PiBiZXlvbmQgZHVt
cGluZy4KPiAKPiBUaGF0IHNlZW1zIG1vcmUgb2JzY3VyZSBhbmQgYnVnLXByb25lIHRoYW4gYW4g
ZXh0cmEgbGlzdCBoZWFkCj4gaW4gc3RydWN0IGRvbWFpbi4gSSdkIHJlYWxseSBwcmVmZXIgdG8g
c3RpY2sgd2l0aCB0aGF0IGV2ZW4KPiBpZiBpdCBkb2VzIG1ha2UgdGhpbmdzIGEgbGl0dGxlIG1v
cmUgdWdseSB1bnRpbCB4ZW5wYWdlX2xpc3QKPiBnb2VzIGF3YXkuCgpPa2F5IHdpdGggbWUgaWYg
dGhlcmUgcmVhbGx5IHdhcyBubyBwcm9wZXJ0eSAob3RoZXIgdGhhbgphc3NpZ25fcGFnZXMoKSB0
aGVuIG5lZWRpbmcgdG8gcGljayB0aGUgcmlnaHQgbGlzdCwgd2hpY2ggaXMKbm90IG11Y2ggZGlm
ZmVyZW50IGZyb20gbmVlZGluZyB0byBwdXQgdGhlIGV4dHJhIHBhZ2VzIG9uIHR3bwpsaXN0cykg
dGhhdCB5b3UnZCBsb3NlIGJ5IG5vIGxvbmdlciBoYXZpbmcgdGhlIHBhZ2VzIG9uIHRoZQpzYW1l
IGxpc3QuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
