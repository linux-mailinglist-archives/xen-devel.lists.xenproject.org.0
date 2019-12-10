Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDB5118F63
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 18:58:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iejjg-000084-Kx; Tue, 10 Dec 2019 17:55:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jFD4=2A=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iejjf-00007s-Te
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 17:55:47 +0000
X-Inumbo-ID: 4a88d2d2-1b76-11ea-89d7-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a88d2d2-1b76-11ea-89d7-12813bfff9fa;
 Tue, 10 Dec 2019 17:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576000546;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=aZBzFUNif6MVXCfTSIuE13Hh27aX6Pf21/CqEtiY9DM=;
 b=KJzfkCYsuUB5k5ilG5SZzQOGsxgrEp0CUo876MFKGq65AlROdM38STfO
 iMl0ucZQ16dQZQBrAN2JlSOF3LsE+ne/HVwBx3xoeuHb42/drUVZ0cP2l
 /HQQn3C9CW4O+AGajSV3uYD2ARDjzeZs2167CSSIn0lmyrHlAIGdp04x7 c=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4TU2ShugrOm+XPUwhNcXpA0jdXCqPw56AeODuX9C+RQX8dARevcMC1n83FESTqUIwLAK8mktZT
 171DVxipaXFyEVvE+42HLOfUAJhKbON/1prrJQDDG7IxnZ7pT/jmXrN7HLinFbC/DoYLR0Dxkq
 aunHfoG6hZnTIz3woLdK9Na8qLZnrGyHZgx0/iIIsdLwfy48iO3tI0xPvKfzylBNWowA54fAYJ
 GCcwu0vWwLNn9sgVKzeqFFhTCNUz+8fQdX3UXrxKD018eIAO+ywXV8ii5X4Mg8Ivv0S8L245jc
 6xw=
X-SBRS: 2.7
X-MesageID: 9483038
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,300,1571716800"; 
   d="scan'208";a="9483038"
To: Jan Beulich <jbeulich@suse.com>
References: <20191205223008.8623-1-andrew.cooper3@citrix.com>
 <20191205223008.8623-6-andrew.cooper3@citrix.com>
 <60ae5d0a-8290-42ed-74e7-894515c5dea3@suse.com>
 <300fe43e-fbe9-b0e0-1ac8-000e2a55f276@citrix.com>
 <7a1c0f6b-6f41-8a1f-7170-9ea235bf1bc9@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <c5aceeb7-ea60-a692-ce9c-f6939d1c413b@citrix.com>
Date: Tue, 10 Dec 2019 17:55:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7a1c0f6b-6f41-8a1f-7170-9ea235bf1bc9@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 5/6] xen/tasklet: Return -ERESTART from
 continue_hypercall_on_cpu()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMTIvMjAxOSAwODo1NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDkuMTIuMjAxOSAx
ODo0OSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDkvMTIvMjAxOSAxNjo1MiwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAwNS4xMi4yMDE5IDIzOjMwLCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+IFNvbWUgaHlwZXJjYWxscyB0YXNrbGV0cyB3YW50IHRvIGNyZWF0ZSBhIGNvbnRpbnVh
dGlvbiwgcmF0aGVyIHRoYW4gZmFpbCB0aGUKPj4+PiBoeXBlcmNhbGwgd2l0aCBhIGhhcmQgZXJy
b3IuICBCeSB0aGUgdGltZSB0aGUgdGFza2xldCBpcyBleGVjdXRpbmcsIGl0IGlzIHRvbwo+Pj4+
IGxhdGUgdG8gY3JlYXRlIHRoZSBjb250aW51YXRpb24sIGFuZCBldmVuIGNvbnRpbnVlX2h5cGVy
Y2FsbF9vbl9jcHUoKSBkb2Vzbid0Cj4+Pj4gaGF2ZSBlbm91Z2ggc3RhdGUgdG8gZG8gaXQgY29y
cmVjdGx5Lgo+Pj4gSSB0aGluayBpdCB3b3VsZCBiZSBxdWl0ZSBuaWNlIGlmIHlvdSBtYWRlIGNs
ZWFyIHdoYXQgcGllY2Ugb2Ygc3RhdGUKPj4+IGl0IGlzIGFjdHVhbGx5IG1pc3NpbmcuIFRvIGJl
IGhvbmVzdCwgSSBkb24ndCByZWNhbGwgYW55bW9yZS4KPj4gSG93IHRvIGNvcnJlY3RseSBtdXRh
dGUgdGhlIHJlZ2lzdGVycyBhbmQvb3IgbWVtb3J5ICh3aGljaCBpcyBzcGVjaWZpYwo+PiB0byB0
aGUgaHlwZXJjYWxsIHN1Ym9wIGluIHNvbWUgY2FzZXMpLgo+IFdlbGwsIGluLW1lbW9yeSBhcmd1
bWVudHMgY2FuIGJlIGFjY2Vzc2VkIGFzIGxvbmcgYXMgdGhlIG1hcHBpbmcgaXMKPiB0aGUgcmln
aHQgb25lICh3aGljaCBpdCB0eXBpY2FsbHkgd291bGRuJ3QgYmUgaW5zaWRlIGEgdGFza2xldCku
IERvCj4gZXhpc3RpbmcgY29udGludWVfaHlwZXJjYWxsX29uX2NwdSgpIHVzZXJzIG5lZWQgdGhp
cz8gTG9va2luZyBvdmVyCj4gcGF0Y2ggNCBhZ2FpbiwgSSBkaWRuJ3QgdGhpbmsgc28uIChXaGlj
aCBpc24ndCB0byBzYXkgdGhhdCByZW1vdmluZwo+IHRoZSBsYXRlbnQgaXNzdWUgaXMgbm90IGEg
Z29vZCB0aGluZy4pCj4KPiBJbi1yZWdpc3RlciB2YWx1ZXMgY2FuIGJlIGNoYW5nZWQgYXMgbG9u
ZyBhcyB0aGUgcmVzcGVjdGl2ZSBleGl0Cj4gcGF0aCB3aWxsIHN1aXRhYmx5IHBpY2sgdXAgdGhl
IHZhbHVlLCB3aGljaCBJIHRob3VnaHQgd2FzIGFsd2F5cwo+IHRoZSBjYXNlLgo+Cj4gSGVuY2Ug
SSdtIGFmcmFpZCB5b3VyIHNpbmdsZSByZXBseSBzZW50ZW5jZSBkaWRuJ3QgcmVhbGx5IGNsYXJp
ZnkKPiBtYXR0ZXJzLiBJJ20gc29ycnkgaWYgdGhpcyBpcyBqdXN0IGJlY2F1c2Ugb2YgbWUgYmVp
bmcgZGVuc2UuCgpIb3csIHBoeXNpY2FsbHksIHdvdWxkIHlvdSBhcnJhbmdlIGZvciBjb250aW51
ZV9oeXBlcmNhbGxfb25fY3B1KCkgdG8KbWFrZSB0aGUgcmVxdWlzaXRlIHN0YXRlIGFkanVzdG1l
bnRzPwoKWWVzIC0gcmVnaXN0ZXJzIGFuZCBtZW1vcnkgY2FuIGJlIGFjY2Vzc2VkLCBidXQgb25s
eSB0aGUgaHlwZXJjYWxsCihzdWI/KW9wIGhhbmRsZXIga25vd3MgaG93IHRvIG11dGF0ZSB0aGVt
IGFwcHJvcHJpYXRlbHkuCgpZb3UnZCBoYXZlIHRvIGNvcHkgdGhlIG11dGF0aW9uIGxvZ2ljIGlu
dG8gY29udGludWVfaHlwZXJjYWxsX29uX2NwdSgpLAphbmQgcGFzcyBpbiBvcC9zdWJvcHMgYW5k
IGEgdW5pb24gb2YgYWxsIHBvaW50ZXJzLCAqYW5kKiB3aGF0ZXZlcgppbnRlcm1lZGlhdGUgc3Rh
dGUgdGhlIHN1Ym9wIGhhbmRsZXIgbmVlZHMuCgpPciB5b3UgY2FuIHJldHVybiAtRVJFU1RBUlQg
YW5kIGxldCB0aGUgY2FsbGVyIERUUlQgd2l0aCB0aGUgc3RhdGUgaXQKaGFzIGluIGNvbnRleHQs
IGFzIGl0IHdvdWxkIGluIG90aGVyIGNhc2VzIHJlcXVpcmluZyBhIGNvbnRpbnVhdGlvbi4KCj4K
Pj4+PiBUaGVyZSBpcyBvbmUgUkZDIHBvaW50LiAgVGhlIHN0YXRlbWVudCBpbiB0aGUgaGVhZGVy
IGZpbGUgb2YgIklmIHRoaXMgZnVuY3Rpb24KPj4+PiByZXR1cm5zIDAgdGhlbiB0aGUgZnVuY3Rp
b24gaXMgZ3VhcmFudGVlZCB0byBydW4gYXQgc29tZSBwb2ludCBpbiB0aGUgZnV0dXJlLiIKPj4+
PiB3YXMgbmV2ZXIgdHJ1ZS4gIEluIHRoZSBjYXNlIG9mIGEgQ1BVIG1pc3MsIHRoZSBoeXBlcmNh
bGwgd291bGQgYmUgYmxpbmRseQo+Pj4+IGZhaWxlZCB3aXRoIC1FSU5WQUwuCj4+PiAiV2FzIG5l
dmVyIHRydWUiIHNvdW5kcyBsaWtlICJjb21wbGV0ZWx5IGJyb2tlbiIuIEFmYWljdCBpdCB3YXMg
dHJ1ZQo+Pj4gaW4gYWxsIGNhc2VzIGV4Y2VwdCB0aGUgcHVyZWx5IGh5cG90aGV0aWNhbCBvbmUg
b2YgdGhlIHRhc2tsZXQgZW5kaW5nCj4+PiB1cCBleGVjdXRpbmcgb24gdGhlIHdyb25nIENQVS4K
Pj4gVGhlcmUgaXMgbm90aGluZyBoeXBvdGhldGljYWwgYWJvdXQgaXQuwqAgSXQgcmVhbGx5IHdp
bGwgZ28gd3Jvbmcgd2hlbiBhCj4+IENQVSBnZXRzIG9mZmxpbmVkLgo+IEFjY2VwdGVkLCBidXQg
aXQncyBzdGlsbCBub3QgbGlrZSAiY29tcGxldGVseSBicm9rZW4iLgoKSSBkaWRuJ3QgbWVhbiBp
dCBsaWtlIHRoYXQuwqAgSSBtZWFuICJpdCBoYXMgbmV2ZXIgaGFkIHRoZSBwcm9wZXJ0eSBpdApj
bGFpbWVkIiwgd2hpY2ggaXMgZGlzdGluY3QgZnJvbSAidGhlIGNsYWltIHVzZWQgdG8gYmUgdHJ1
ZSwgYnV0IHdhcwp0aGVuIGFjY2lkZW50YWxseSByZWdyZXNzZWQiLgoKPiBJIHdvdWxkIGV2ZW4K
PiBzdXBwb3NlIHRoZSBjYXNlIHdhc24ndCBjb25zaWRlcmVkIHdoZW4gQ1BVIG9mZmxpbmluZyBz
dXBwb3J0IHdhcwo+IGludHJvZHVjZWQsIG5vdCB3aGVuIGNvbnRpbnVlX2h5cGVyY2FsbF9vbl9j
cHUoKSBjYW1lIGludG8gZXhpc3RlbmNlCj4gKHdoaWNoIHByZXN1bWFibHkgaXMgd2hlbiB0aGUg
Y29tbWVudCB3YXMgd3JpdHRlbikuCj4KPiBBbnl3YXkgLSB5ZXMsIEkgYWdyZWUgdGhpcyBpcyBh
IGZhaXIgc29sdXRpb24gdG8gdGhlIGlzc3VlIGF0IGhhbmQuCj4KPj4+PiBUaGUgY3VycmVudCBi
ZWhhdmlvdXIgd2l0aCB0aGlzIHBhdGNoIGlzIHRvIG5vdCBjYW5jZWwgdGhlIGNvbnRpbnVhdGlv
biwgd2hpY2gKPj4+PiBJIHRoaW5rIGlzIGxlc3MgYmFkLCBidXQgc3RpbGwgbm90IGdyZWF0LiAg
VGhvdWdodHM/Cj4+PiBXZWxsLCB0aGF0J3MgYSBndWVzdCBsaXZlIGxvY2sgdGhlbiBhaXVpLgo+
PiBJdCBzaW1wbHkgY29udGludWVzIGFnYWluLsKgIEl0IHdpbGwgbGl2ZWxvY2sgb25seSBpZiB0
aGUgaHlwZXJjYWxsIHBpY2tzCj4+IGEgYmFkIGNwdSBhbGwgdGhlIHRpbWUuCj4gT2gsIEkgc2Vl
IEkgd2FzIG1pc2xlYWQgYnkgY29udGludWVfaHlwZXJjYWxsX3Rhc2tsZXRfaGFuZGxlcigpIG5v
dAo+IHVwZGF0aW5nIGluZm8tPmNwdSwgbm90IHBheWluZyBhdHRlbnRpb24gdG8gaXQgYWN0dWFs
bHkgZnJlZWluZyBpbmZvLgo+IFBsdXMgYSBjcnVjaWFsIGFzcGVjdCBsb29rcyB0byBiZSB0aGF0
IHRoZXJlIGFyZSBubyAiY2hhaW5lZCIgdXNlcyBvZgo+IGNvbnRpbnVlX2h5cGVyY2FsbF9vbl9j
cHUoKSBhbnltb3JlICh0aGUgbWljcm9jb2RlIGxvYWRpbmcgb25lIGJlaW5nCj4gZ29uZSBub3cp
IC0gYWZhaWN0IGFueSBzdWNoIHdvdWxkbid0IGd1YXJhbnRlZSBmb3J3YXJkIHByb2dyZXNzIHdp
dGgKPiB0aGlzIG5ldyBtb2RlbCAod2l0aG91dCByZWNvcmRpbmcgc29tZXdoZXJlIHdoaWNoIENQ
VXMgaGFkIGJlZW4gZGVhbHQKPiB3aXRoIGFscmVhZHkpLgoKSSdkIGZvcmdvdHRlbiB0aGF0IHdl
IGhhZCB0aGF0LCBidXQgSSBjYW4ndCBzYXkgSSdtIHNhZCB0byBzZWUgdGhlIGJhY2sKb2YgaXQu
wqAgSSByZWNhbGwgYXQgdGhlIHRpbWUgc2F5aW5nIHRoYXQgaXQgd2Fzbid0IGEgY2xldmVyIG1v
dmUuCgpGb3Igbm93LCBJIHN1Z2dlc3QgdGhhdCB3ZSBpZ25vcmUgdGhhdCBjYXNlLsKgIElmIGFu
IHdoZW4gYSByZWFsIHVzZWNhc2UKYXBwZWFycywgd2UgY2FuIGNvbnNpZGVyIG1ha2luZyBhZGp1
c3RtZW50cy4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
