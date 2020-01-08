Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1225134819
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 17:38:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipEIU-0004lk-3x; Wed, 08 Jan 2020 16:35:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qxLJ=25=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ipEIS-0004lf-Ab
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 16:35:04 +0000
X-Inumbo-ID: cce730e6-3234-11ea-b1f0-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cce730e6-3234-11ea-b1f0-bc764e2007e4;
 Wed, 08 Jan 2020 16:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578501294;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ln6MdccApKMToyWeHCIHR7HZriG7yfWpTsEL0nQJiyg=;
 b=QY6F20LERAlsESsDXkIlzCDBQtg6GSqhhtTARE5yjqxnhxfyuIMXgunn
 IBrXxO1GnjGU6KGPnlMDGEd8CZJ/TtHCFy1ISkmvpJdC8WpPyFkGh22EU
 J9mdQeekrp2ZynrlygQ3yWPjCIwJXqOltFQabMnARm5hfeHTsuKL8pNzp E=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: KZ3tREYwKZS+ME/YeITkdJ8JjlI25R7kmFulLTnbo+5/4+Bk3oK1+CMJPajMihyv74Xy1uxt7b
 yuYxM31QpY+t+Uoe+/QWTvSLsjxB1nVqqtVAeHVtW5AG+nmyQcUa86kKckQHWy98dEXrBEKACQ
 l7iOpYEyoDN0n8bnoeKQtnN/lc1zJKe6m/8jkOzVy9fmt1T8siJ3OQ8KLuQZp5/D6dF9HhqPyE
 aitvGbUHf4uzVH92w+fS9+lrRIFzU6bqbpfXF7RTyUL7j1DECYqAjdXajPypMmCKy039T/ntYx
 5Ak=
X-SBRS: 2.7
X-MesageID: 11009388
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,410,1571716800"; d="scan'208";a="11009388"
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Tamas K Lengyel
 <tamas@tklengyel.com>
References: <20191219094814.GB11756@Air-de-Roger>
 <CABfawhnVZmYOZb=wuc2TVDewH9nNtJBTBvJYUk-RDHLCGRVzPw@mail.gmail.com>
 <20191230175900.GF11756@Air-de-Roger>
 <CABfawhkiB=6zvTo6TBCE6y_-to65DFGDVRcqk7ANpSGdwwveFQ@mail.gmail.com>
 <3ff918fc-02a3-1413-4135-a378d65a19ab@xen.org>
 <CABfawh=Wvn16sWp8_MPy0kGAp-OhkCmug4nY272igyg+u4PKBw@mail.gmail.com>
 <CAF3u54B2+3q90jFftH+ZcuhdH6i8cOEpjiOjrVdNJCiBSzBtng@mail.gmail.com>
 <CABfawh=F8dsn4LLtdfYR4nb0djaswofEioDtqi2TKVJ0zCBK0Q@mail.gmail.com>
 <20191231104022.GG11756@Air-de-Roger>
 <CABfawh=tDFzsp61MmFxpmcBbNT2GXa4C=-eXD=044L1gdxPEpw@mail.gmail.com>
 <20191231151107.GJ11756@Air-de-Roger>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <e05a394d-b5da-85aa-7196-c89664a0a358@citrix.com>
Date: Wed, 8 Jan 2020 16:34:49 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191231151107.GJ11756@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 00/20] VM forking
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@gmail.com>,
 Alexandru
 Isaila <aisaila@bitdefender.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMzEvMTkgMzoxMSBQTSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUdWUsIERl
YyAzMSwgMjAxOSBhdCAwODowMDoxN0FNIC0wNzAwLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4+
IE9uIFR1ZSwgRGVjIDMxLCAyMDE5IGF0IDM6NDAgQU0gUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4KPj4+IE9uIE1vbiwgRGVjIDMwLCAyMDE5IGF0IDA1
OjM3OjM4UE0gLTA3MDAsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPj4+PiBPbiBNb24sIERlYyAz
MCwgMjAxOSBhdCA1OjIwIFBNIEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGdtYWlsLmNvbT4g
d3JvdGU6Cj4+Pj4+Cj4+Pj4+IEhpLAo+Pj4+Pgo+Pj4+PiBPbiBNb24sIDMwIERlYyAyMDE5LCAy
MDo0OSBUYW1hcyBLIExlbmd5ZWwsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPiB3cm90ZToKPj4+Pj4+
Cj4+Pj4+PiBPbiBNb24sIERlYyAzMCwgMjAxOSBhdCAxMTo0MyBBTSBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPiB3cm90ZToKPj4+Pj4+IEJ1dCBrZWVwIGluIG1pbmQgdGhhdCB0aGUgImZv
cmstdm0iIGNvbW1hbmQgZXZlbiB3aXRoIHRoaXMgdXBkYXRlCj4+Pj4+PiB3b3VsZCBzdGlsbCBu
b3QgcHJvZHVjZSBmb3IgeW91IGEgImZ1bGx5IGZ1bmN0aW9uYWwiIFZNIG9uIGl0cyBvd24uCj4+
Pj4+PiBUaGUgdXNlciBzdGlsbCBoYXMgdG8gcHJvZHVjZSBhIG5ldyBWTSBjb25maWcgZmlsZSwg
Y3JlYXRlIHRoZSBuZXcKPj4+Pj4+IGRpc2ssIHNhdmUgdGhlIFFFTVUgc3RhdGUsIGV0Yy4KPj4+
Cj4+PiBJTU8gdGhlIGRlZmF1bHQgYmVoYXZpb3Igb2YgdGhlIGZvcmsgY29tbWFuZCBzaG91bGQg
YmUgdG8gbGVhdmUgdGhlCj4+PiBvcmlnaW5hbCBWTSBwYXVzZWQsIHNvIHRoYXQgeW91IGNhbiBj
b250aW51ZSB1c2luZyB0aGUgc2FtZSBkaXNrIGFuZAo+Pj4gbmV0d29yayBjb25maWcgaW4gdGhl
IGZvcmsgYW5kIHlvdSB3b24ndCBuZWVkIHRvIHBhc3MgYSBuZXcgY29uZmlnCj4+PiBmaWxlLgo+
Pj4KPj4+IEFzIEp1bGllbiBhbHJlYWR5IHNhaWQsIG1heWJlIEkgd2Fzbid0IGNsZWFyIGluIG15
IHByZXZpb3VzIHJlcGxpZXM6Cj4+PiBJJ20gbm90IGFza2luZyB5b3UgdG8gaW1wbGVtZW50IGFs
bCB0aGlzLCBpdCdzIGZpbmUgaWYgdGhlCj4+PiBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgZm9yay12
bSB4bCBjb21tYW5kIHJlcXVpcmVzIHlvdSB0byBwYXNzIGNlcnRhaW4KPj4+IG9wdGlvbnMsIGFu
ZCB0aGF0IHRoZSBkZWZhdWx0IGJlaGF2aW9yIGlzIG5vdCBpbXBsZW1lbnRlZC4KPj4+Cj4+PiBX
ZSBuZWVkIGFuIGludGVyZmFjZSB0aGF0J3Mgc2FuZSwgYW5kIHRoYXQncyBkZXNpZ25lZCB0byBi
ZSBlYXN5IGFuZAo+Pj4gY29tcHJlaGVuc2l2ZSB0byB1c2UsIG5vdCBhbiBpbnRlcmZhY2UgYnVp
bHQgYXJvdW5kIHdoYXQncyBjdXJyZW50bHkKPj4+IGltcGxlbWVudGVkLgo+Pgo+PiBPSywgc28g
SSB0aGluayB0aGF0IHdvdWxkIGxvb2sgbGlrZSAieGwgZm9yay12bSA8cGFyZW50X2RvbWlkPiIg
d2l0aAo+PiBhZGRpdGlvbmFsIG9wdGlvbnMgZm9yIHRoaW5ncyBsaWtlIG5hbWUsIGRpc2ssIHZs
YW4sIG9yIGEgY29tcGxldGVseQo+PiBuZXcgY29uZmlnLCBhbGwgb2Ygd2hpY2ggYXJlIGN1cnJl
bnRseSBub3QgaW1wbGVtZW50ZWQsICsgYW4KPj4gYWRkaXRpb25hbCBvcHRpb24gdG8gbm90IGxh
dW5jaCBRRU1VIGF0IGFsbCwgd2hpY2ggd291bGQgYmUgdGhlIG9ubHkKPj4gb25lIGN1cnJlbnRs
eSB3b3JraW5nLiBBbHNvIGtlZXBpbmcgdGhlIHNlcGFyYXRlICJ4bCBmb3JrLWxhdW5jaC1kbSIK
Pj4gYXMgaXMuIElzIHRoYXQgd2hhdCB3ZSBhcmUgdGFsa2luZyBhYm91dD8KPiAKPiBJIHRoaW5r
IGZvcmstbGF1bmNoLXZtIHNob3VsZCBqdXN0IGJlIGFuIG9wdGlvbiBvZiBmb3JrLXZtIChpZToK
PiAtLWxhdW5jaC1kbS1vbmx5IG9yIHNvbWUgc3VjaCkuIEkgZG9uJ3QgdGhpbmsgdGhlcmUncyBh
IHJlYXNvbiB0byBoYXZlCj4gYSBzZXBhcmF0ZSB0b3AtbGV2ZWwgY29tbWFuZCB0byBqdXN0IGxh
dW5jaCB0aGUgZGV2aWNlIG1vZGVsLgoKU28gZmlyc3Qgb2YgYWxsLCBUYW1hcyAtLSBkbyB5b3Ug
YWN0dWFsbHkgbmVlZCB0byBleGVjIHhsIGhlcmU/ICBXb3VsZAppdCBtYWtlIHNlbnNlIGZvciB0
aGVzZSB0byBzdGFydCBvdXQgc2ltcGx5IGFzIGxpYnhsIGZ1bmN0aW9ucyB0aGF0IGFyZQpjYWxs
ZWQgYnkgeW91ciBzeXN0ZW0/CgpJIGFjdHVhbGx5IGRpc2FncmVlIHRoYXQgd2Ugd2FudCBhIHNp
bmdsZSBjb21tYW5kIHRvIGRvIGFsbCBvZiB0aGVzZS4KSWYgd2UgZGlkIHdhbnQgYGV4ZWMgeGxg
IHRvIGJlIG9uZSBvZiB0aGUgc3VwcG9ydGVkIGludGVyZmFjZXMsIEkgdGhpbmsKaXQgd291bGQg
YnJlYWsgZG93biBzb21ldGhpbmcgbGlrZSB0aGlzOgoKYHhsIGZvcmstZG9tYWluYDogT25seSBm
b3JrcyB0aGUgZG9tYWluLgpgeGwgZm9yay1sYXVuY2gtZG1gOiAob3IgYXR0YWNoLWRtPyk6IFN0
YXJ0IHVwIGFuZCBhdHRhY2ggdGhlCmRldmljZW1vZGVsIHRvIHRoZSBkb21haW4KClRoZW4gYHhs
IGZvcmtgIChvciBtYXliZSBgeGwgZm9yay12bWApIHdvdWxkIGJlIHNvbWV0aGluZyBpbXBsZW1l
bnRlZCBpbgp0aGUgZnV0dXJlIHRoYXQgd291bGQgZm9yayB0aGUgZW50aXJlIGRvbWFpbi4KCihU
aGlzIGlzIHNpbWlsYXIgdG8gaG93IGBnaXQgYW1gIHdvcmtzIGZvciBpbnN0YW5jZTsgaW50ZXJu
YWxseSBpdCBydW5zCnNldmVyYWwgc3RlcHMsIGluY2x1ZGluZyBgZ2l0IG1haWxzcGxpdGAsIGBn
aXQgbWFpbGluZm9gLCBhbmQgYGdpdAphcHBseS1wYXRjaGAsIGVhY2ggb2Ygd2hpY2ggY2FuIGJl
IGNhbGxlZCBpbmRpdmlkdWFsbHkuKQoKSSB0aGluayBJIHdvdWxkIGFsc28gaGF2ZToKCmB4bCBm
b3JrLXNhdmUtZG1gOiBDb25uZWN0IG92ZXIgcW1wIHRvIHRoZSBwYXJlbnQgZG9tYWluIGFuZCBz
YXZlIHRoZSBkbQpmaWxlCgpUaGVuIGhhdmUgYHhsIGZvcmstbGF1bmNoLWRtYCBlaXRoZXIgdGFr
ZSBhIGZpbGVuYW1lIChzYXZlZCBmcm9tIHRoZQpwcmV2aW91cyBzdGVwKSBvciBhIHBhcmVudCBk
b21haW4gaWQgKGluIHdoaWNoIGNhc2UgaXQgd291bGQgYXJyYW5nZSB0bwpzYXZlIHRoZSBmaWxl
IGl0c2VsZikuCgpBbHRob3VnaCBpbiBmYWN0LCBpcyB0aGVyZSBhbnkgcmVhc29uIHdlIGNvdWxk
bid0IHN0b3JlIHRoZSBwYXJlbnQKZG9tYWluIElEIGluIHhlbnN0b3JlLCBzbyB0aGF0IGB4bCBm
b3JrLWxhdW5jaC1kbWAgY291bGQgZmluZCB0aGUgcGFyZW50CmJ5IGl0c2VsZj8gIChBbHRob3Vn
aCB0aGF0LCBvZiBjb3Vyc2UsIGlzIHNvbWV0aGluZyB0aGF0IGNvdWxkIGJlIGFkZGVkCmxhdGVy
IGlmIGl0J3Mgbm90IHNvbWV0aGluZyBUYW1hcyBuZWVkcy4pCgpUaG91Z2h0cz8KCiAtR2Vvcmdl
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
