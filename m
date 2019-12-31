Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 949E212D999
	for <lists+xen-devel@lfdr.de>; Tue, 31 Dec 2019 16:05:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1imJ1A-0004R9-2h; Tue, 31 Dec 2019 15:01:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Skpz=2V=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1imJ18-0004R4-M0
 for xen-devel@lists.xenproject.org; Tue, 31 Dec 2019 15:01:06 +0000
X-Inumbo-ID: 58f1dd28-2bde-11ea-a914-bc764e2007e4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58f1dd28-2bde-11ea-a914-bc764e2007e4;
 Tue, 31 Dec 2019 15:00:56 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1577804457; h=Content-Transfer-Encoding: Content-Type: Cc: To:
 Subject: Message-ID: Date: From: In-Reply-To: References: MIME-Version:
 Sender; bh=IAAXbcQhL/5krAOINUPzFumNU/J76DrVfXDiQJ7wCTY=;
 b=KfPU+0jtuPR94mFcp5LGe6hAPLu0hUA5xp6Pp7h8XyF3ii/4xo5utAq57QZYJAjY5tI+1x3d
 4EBf9cD+MZQP+BdaNOCYxD8rYkodZgwh+39yrG56iqGoPRFsVUAtbp6pcoWezlIsvc8+uOjn
 RkvAxNJqaUNHf1HNRD2kySdvJ+M=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mxa.mailgun.org with ESMTP id 5e0b62a6.7ff8f027af30-smtp-out-n03;
 Tue, 31 Dec 2019 15:00:54 -0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id y11so35349512wrt.6
 for <xen-devel@lists.xenproject.org>; Tue, 31 Dec 2019 07:00:54 -0800 (PST)
X-Gm-Message-State: APjAAAW///7tGyeCihymUVw1DHe+Qjrhs6dJdDzgYKERvS4peaCC+m3Q
 hTfFP9xorr82EK+Qdwj6kJoVoC1ZMBzIhDPr6eE=
X-Google-Smtp-Source: APXvYqwckWOuaOKAtTjVEglnuf5reCFRYz9aydDAQXuPwHzdOtSbD7JdzZH5jaPFjJmJ6GTfHfDR18pLP64zlCvMwmY=
X-Received: by 2002:adf:f586:: with SMTP id f6mr70081373wro.46.1577804453627; 
 Tue, 31 Dec 2019 07:00:53 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576697796.git.tamas.lengyel@intel.com>
 <20191219094814.GB11756@Air-de-Roger>
 <CABfawhnVZmYOZb=wuc2TVDewH9nNtJBTBvJYUk-RDHLCGRVzPw@mail.gmail.com>
 <20191230175900.GF11756@Air-de-Roger>
 <CABfawhkiB=6zvTo6TBCE6y_-to65DFGDVRcqk7ANpSGdwwveFQ@mail.gmail.com>
 <3ff918fc-02a3-1413-4135-a378d65a19ab@xen.org>
 <CABfawh=Wvn16sWp8_MPy0kGAp-OhkCmug4nY272igyg+u4PKBw@mail.gmail.com>
 <CAF3u54B2+3q90jFftH+ZcuhdH6i8cOEpjiOjrVdNJCiBSzBtng@mail.gmail.com>
 <CABfawh=F8dsn4LLtdfYR4nb0djaswofEioDtqi2TKVJ0zCBK0Q@mail.gmail.com>
 <20191231104022.GG11756@Air-de-Roger>
In-Reply-To: <20191231104022.GG11756@Air-de-Roger>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 31 Dec 2019 08:00:17 -0700
X-Gmail-Original-Message-ID: <CABfawh=tDFzsp61MmFxpmcBbNT2GXa4C=-eXD=044L1gdxPEpw@mail.gmail.com>
Message-ID: <CABfawh=tDFzsp61MmFxpmcBbNT2GXa4C=-eXD=044L1gdxPEpw@mail.gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
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
 Alexandru Isaila <aisaila@bitdefender.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMzEsIDIwMTkgYXQgMzo0MCBBTSBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIERlYyAzMCwgMjAxOSBhdCAwNTozNzoz
OFBNIC0wNzAwLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gPiBPbiBNb24sIERlYyAzMCwgMjAx
OSBhdCA1OjIwIFBNIEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGdtYWlsLmNvbT4gd3JvdGU6
Cj4gPiA+Cj4gPiA+IEhpLAo+ID4gPgo+ID4gPiBPbiBNb24sIDMwIERlYyAyMDE5LCAyMDo0OSBU
YW1hcyBLIExlbmd5ZWwsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPiB3cm90ZToKPiA+ID4+Cj4gPiA+
PiBPbiBNb24sIERlYyAzMCwgMjAxOSBhdCAxMTo0MyBBTSBKdWxpZW4gR3JhbGwgPGp1bGllbkB4
ZW4ub3JnPiB3cm90ZToKPiA+ID4+IEJ1dCBrZWVwIGluIG1pbmQgdGhhdCB0aGUgImZvcmstdm0i
IGNvbW1hbmQgZXZlbiB3aXRoIHRoaXMgdXBkYXRlCj4gPiA+PiB3b3VsZCBzdGlsbCBub3QgcHJv
ZHVjZSBmb3IgeW91IGEgImZ1bGx5IGZ1bmN0aW9uYWwiIFZNIG9uIGl0cyBvd24uCj4gPiA+PiBU
aGUgdXNlciBzdGlsbCBoYXMgdG8gcHJvZHVjZSBhIG5ldyBWTSBjb25maWcgZmlsZSwgY3JlYXRl
IHRoZSBuZXcKPiA+ID4+IGRpc2ssIHNhdmUgdGhlIFFFTVUgc3RhdGUsIGV0Yy4KPgo+IElNTyB0
aGUgZGVmYXVsdCBiZWhhdmlvciBvZiB0aGUgZm9yayBjb21tYW5kIHNob3VsZCBiZSB0byBsZWF2
ZSB0aGUKPiBvcmlnaW5hbCBWTSBwYXVzZWQsIHNvIHRoYXQgeW91IGNhbiBjb250aW51ZSB1c2lu
ZyB0aGUgc2FtZSBkaXNrIGFuZAo+IG5ldHdvcmsgY29uZmlnIGluIHRoZSBmb3JrIGFuZCB5b3Ug
d29uJ3QgbmVlZCB0byBwYXNzIGEgbmV3IGNvbmZpZwo+IGZpbGUuCj4KPiBBcyBKdWxpZW4gYWxy
ZWFkeSBzYWlkLCBtYXliZSBJIHdhc24ndCBjbGVhciBpbiBteSBwcmV2aW91cyByZXBsaWVzOgo+
IEknbSBub3QgYXNraW5nIHlvdSB0byBpbXBsZW1lbnQgYWxsIHRoaXMsIGl0J3MgZmluZSBpZiB0
aGUKPiBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgZm9yay12bSB4bCBjb21tYW5kIHJlcXVpcmVzIHlv
dSB0byBwYXNzIGNlcnRhaW4KPiBvcHRpb25zLCBhbmQgdGhhdCB0aGUgZGVmYXVsdCBiZWhhdmlv
ciBpcyBub3QgaW1wbGVtZW50ZWQuCj4KPiBXZSBuZWVkIGFuIGludGVyZmFjZSB0aGF0J3Mgc2Fu
ZSwgYW5kIHRoYXQncyBkZXNpZ25lZCB0byBiZSBlYXN5IGFuZAo+IGNvbXByZWhlbnNpdmUgdG8g
dXNlLCBub3QgYW4gaW50ZXJmYWNlIGJ1aWx0IGFyb3VuZCB3aGF0J3MgY3VycmVudGx5Cj4gaW1w
bGVtZW50ZWQuCgpPSywgc28gSSB0aGluayB0aGF0IHdvdWxkIGxvb2sgbGlrZSAieGwgZm9yay12
bSA8cGFyZW50X2RvbWlkPiIgd2l0aAphZGRpdGlvbmFsIG9wdGlvbnMgZm9yIHRoaW5ncyBsaWtl
IG5hbWUsIGRpc2ssIHZsYW4sIG9yIGEgY29tcGxldGVseQpuZXcgY29uZmlnLCBhbGwgb2Ygd2hp
Y2ggYXJlIGN1cnJlbnRseSBub3QgaW1wbGVtZW50ZWQsICsgYW4KYWRkaXRpb25hbCBvcHRpb24g
dG8gbm90IGxhdW5jaCBRRU1VIGF0IGFsbCwgd2hpY2ggd291bGQgYmUgdGhlIG9ubHkKb25lIGN1
cnJlbnRseSB3b3JraW5nLiBBbHNvIGtlZXBpbmcgdGhlIHNlcGFyYXRlICJ4bCBmb3JrLWxhdW5j
aC1kbSIKYXMgaXMuIElzIHRoYXQgd2hhdCB3ZSBhcmUgdGFsa2luZyBhYm91dD8KCj4KPiA+ID4K
PiA+ID4gIElmIHlvdSBmb3JrIHRoZW4gdGhlIGNvbmZpZ3VyYXRpb24gc2hvdWxkIGJlIHZlcnkg
c2ltaWxhci4gUmlnaHQ/Cj4gPiA+Cj4gPiA+IFNvIHdoeSBkb2VzIHRoZSB1c2VyIHJlcXVpcmVz
IHRvIHByb3ZpZGUgYSBuZXcgY29uZmlnIHJhdGhlciB0aGFuIHRoZSBjb21tYW5kIHRvIHVwZGF0
ZSB0aGUgZXhpc3Rpbmcgb25lPyBUbyBtZSwgaXQgZmVlbHMgdGhpcyBpcyBhIGNhbGwgdG8gbWFr
ZSBtaXN0YWtlIHdoZW4gZm9ya2luZy4KPiA+ID4KPiA+ID4gSG93IGlzIHRoZSBuZXcgY29uZmln
IGRpZmZlcmVudCBmcm9tIHRoZSBvcmlnaW5hbCBWTT8KPiA+Cj4gPiBUaGUgY29uZmlnIG11c3Qg
YmUgZGlmZmVyZW50IGF0IGxlYXN0IGJ5IGdpdmluZyB0aGUgZm9yayBhIGRpZmZlcmVudAo+ID4g
bmFtZS4gVGhhdCdzIHRoZSBtaW5pbXVtIGFuZCBpdCdzIGVub3VnaCBvbmx5IGlmIHRoZSBWTSB5
b3UgYXJlCj4gPiBmb3JraW5nIGhhcyBubyBkaXNrIGF0IGFsbC4KPgo+IEFkZGluZyBhbiBvcHRp
b24gdG8gcGFzcyBhbiBleHBsaWNpdCBuYW1lIGZvciB0aGUgZm9yayB3b3VsZCBiZSBoYW5keSwK
PiBvciBlbHNlIHhsIGNvdWxkIGNvbWUgdXAgd2l0aCBhIG5hbWUgYnkgaXRzZWxmLCBsaWtlIGl0
J3MgZG9uZSBmb3IKPiBtaWdyYXRpb24sIGllOiA8b3JpZ25hbCBuYW1lPi0tZm9yazxkaWdpdD4u
Cj4KPiA+IElmIGl0IGhhcyBhIGRpc2ssIHlvdSBhbHNvIGhhdmUgdG8gdXBkYXRlCj4gPiB0aGUg
Y29uZmlnIHRvIHBvaW50IHRvIHdoZXJlIHRoZSBuZXcgZGlzayBpcy4gSSdtIHVzaW5nIExWTSBz
bmFwc2hvdHMKPiA+IGJ1dCB5b3UgY291bGQgYWxzbyB1c2UgcWNvdzIsIG9yIHdoYXRldmVyIGVs
c2UgdGhlcmUgaXMgZm9yIGRpc2stQ29XLgo+ID4gVGhlIGZvcmsgY2FuIGFsc28gaGF2ZSBkaWZm
ZXJlbnQgb3B0aW9ucyBlbmFibGVkIHRoYW4gaXQncyBwYXJlbnQuIEZvcgo+ID4gZXhhbXBsZSBp
biBvdXIgdGVzdC1jYXNlLCB0aGUgZm9ya3MgaGF2ZSBhbHRwMm0gZW5hYmxlZCB3aGlsZSB0aGUK
PiA+IHBhcmVudCBWTSBkb2Vzbid0LiBUaGVyZSBjb3VsZCBiZSBvdGhlciBvcHRpb25zIGxpa2Ug
dGhhdCBzb21lb25lCj4gPiBtaWdodCB3YW50IHRvIGVuYWJsZSBmb3IgdGhlIGZvcmsocykuIElm
IHRoZXJlIGlzIG5ldHdvcmtpbmcgaW52b2x2ZWQKPiA+IHlvdSBsaWtlbHkgYWxzbyBoYXZlIHRv
IGF0dGFjaCB0aGUgZm9yayB0byBhIG5ldyBWTEFOIGFzIHRvIGF2b2lkCj4gPiBNQUMtYWRkcmVz
cyBjb2xsaXNpb24gb24gdGhlIGJyaWRnZS4gU28gdGhlcmUgYXJlIHF1aXRlIGEgbG90IG9mCj4g
PiB2YXJpYXRpb24gcG9zc2libGUsIGhlbmNlIGl0cyBiZXR0ZXIgdG8gaGF2ZSB0aGUgdXNlciBn
ZW5lcmF0ZSB0aGUgbmV3Cj4gPiBjb25maWcgdGhleSB3YW50IGluc3RlYWQgb2YgeGwgY29taW5n
IHVwIHdpdGggc29tZXRoaW5nIG9uIGl0cyBvd24uCj4KPiBQYXNzaW5nIGEgbmV3IGNvbmZpZyBm
aWxlIGZvciB0aGUgZm9yayBpcyBpbmRlZWQgZmluZSwgYnV0IG1heWJlIHdlCj4gZG9uJ3Qgd2Fu
dCB0aGlzIHRvIGJlIHRoZSBkZWZhdWx0IGJlaGF2aW9yLCBhcyBzYWlkIGFib3ZlIEkgdGhpbmsg
aXQncwo+IHBvc3NpYmxlIHRvIGZvcmsgYSBWTSB3aXRob3V0IHBhc3NpbmcgYSBuZXcgY29uZmln
IGZpbGUuCj4KPiA+ID4KPiA+ID4gQXMgYSBzaWRlIG5vdGUsIEkgY2FuJ3Qgc2VlIGFueSBwYXRj
aCBhZGRpbmcgZG9jdW1lbnRhdGlvbi4KPiA+Cj4gPiBJdCdzIG9ubHkgYW4gZXhwZXJpbWVudGFs
IGZlYXR1cmUgc28gYWRkaW5nIGRvY3VtZW50YXRpb24gd2FzIG5vdCBhCj4gPiBwcmlvcml0eS4g
VGhlIGRvY3VtZW50YXRpb24gaXMgcHJldHR5IG11Y2ggaW4gdGhlIGNvdmVyIGxldHRlci4gSSdt
Cj4gPiBoYXBweSB0byBhZGQgaXRzIGNvbnRlbnQgYXMgYSBmaWxlIHVuZGVyIGRvY3MgaW4gYSBw
YXRjaCAod2l0aCB0aGUKPiA+IGFib3ZlIGV4dHJhIGluZm9ybWF0aW9uKS4KPgo+IFBsZWFzZSBh
bHNvIGRvY3VtZW50IHRoZSBuZXcgeGwgY29tbWFuZChzKSBpbiB0aGUgbWFuIHBhZ2UgWzBdLgoK
QWNrLgoKVGhhbmtzLApUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
