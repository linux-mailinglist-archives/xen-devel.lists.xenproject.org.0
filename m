Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2E91348DE
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 18:10:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipEnf-0007w9-L1; Wed, 08 Jan 2020 17:07:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cnPU=25=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1ipEnd-0007w4-Sz
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 17:07:17 +0000
X-Inumbo-ID: 51d2138a-3239-11ea-b85e-12813bfff9fa
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 51d2138a-3239-11ea-b85e-12813bfff9fa;
 Wed, 08 Jan 2020 17:07:15 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1578503236; h=Content-Transfer-Encoding: Content-Type: Cc: To:
 Subject: Message-ID: Date: From: In-Reply-To: References: MIME-Version:
 Sender; bh=6ijSmsEiqkz8CDsZ5X6qZshw71riQ9fjSiehkght7S0=;
 b=iSZWardrjlVFlVgvc/jCtq7U1gT9doj3q2rJs9n0sNTGAO3l1z+MupuHMB7aj+rpStOscxtE
 v38tGejk04raBvrTWtiC2frywTC1GmtuSSdm3dEEpMj+PRH4sUFEhYXlqn9NUysYmdYOXSaC
 q5JGxrRQK43PeSFL1B42AiKvxpM=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mxa.mailgun.org with ESMTP id 5e160c3e.7fb36e7da070-smtp-out-n03;
 Wed, 08 Jan 2020 17:07:10 -0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id f129so3305973wmf.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2020 09:07:10 -0800 (PST)
X-Gm-Message-State: APjAAAUHsBSZpMlQFqQrUKK6spJX1Kic/tsgl7wMdyNQKTGYtm/iesLd
 Mhd4XGlP0WLLNrTwR88WYvHnjFf2GROSfEWZuZ4=
X-Google-Smtp-Source: APXvYqxgGqkwsy7CwNvw8exvQO/CKHYBu6hBcIVhrmGE5FVgmMNqp0M5JQ1y50SRZdUoeG1SClZiSElLfTXR+6tzDWU=
X-Received: by 2002:a1c:22c6:: with SMTP id i189mr5384644wmi.15.1578503228640; 
 Wed, 08 Jan 2020 09:07:08 -0800 (PST)
MIME-Version: 1.0
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
 <e05a394d-b5da-85aa-7196-c89664a0a358@citrix.com>
In-Reply-To: <e05a394d-b5da-85aa-7196-c89664a0a358@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 8 Jan 2020 10:06:32 -0700
X-Gmail-Original-Message-ID: <CABfawhmBVhjOcwQ3s3rs--aJD8k9Rg+yNjigLHR4y=jua=vRfw@mail.gmail.com>
Message-ID: <CABfawhmBVhjOcwQ3s3rs--aJD8k9Rg+yNjigLHR4y=jua=vRfw@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
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
 Anthony PERARD <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gOCwgMjAyMCBhdCA5OjM0IEFNIEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5s
YXBAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiAxMi8zMS8xOSAzOjExIFBNLCBSb2dlciBQYXUg
TW9ubsOpIHdyb3RlOgo+ID4gT24gVHVlLCBEZWMgMzEsIDIwMTkgYXQgMDg6MDA6MTdBTSAtMDcw
MCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+ID4+IE9uIFR1ZSwgRGVjIDMxLCAyMDE5IGF0IDM6
NDAgQU0gUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4+
Pgo+ID4+PiBPbiBNb24sIERlYyAzMCwgMjAxOSBhdCAwNTozNzozOFBNIC0wNzAwLCBUYW1hcyBL
IExlbmd5ZWwgd3JvdGU6Cj4gPj4+PiBPbiBNb24sIERlYyAzMCwgMjAxOSBhdCA1OjIwIFBNIEp1
bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPj4+Pj4KPiA+Pj4+
PiBIaSwKPiA+Pj4+Pgo+ID4+Pj4+IE9uIE1vbiwgMzAgRGVjIDIwMTksIDIwOjQ5IFRhbWFzIEsg
TGVuZ3llbCwgPHRhbWFzQHRrbGVuZ3llbC5jb20+IHdyb3RlOgo+ID4+Pj4+Pgo+ID4+Pj4+PiBP
biBNb24sIERlYyAzMCwgMjAxOSBhdCAxMTo0MyBBTSBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToKPiA+Pj4+Pj4gQnV0IGtlZXAgaW4gbWluZCB0aGF0IHRoZSAiZm9yay12bSIg
Y29tbWFuZCBldmVuIHdpdGggdGhpcyB1cGRhdGUKPiA+Pj4+Pj4gd291bGQgc3RpbGwgbm90IHBy
b2R1Y2UgZm9yIHlvdSBhICJmdWxseSBmdW5jdGlvbmFsIiBWTSBvbiBpdHMgb3duLgo+ID4+Pj4+
PiBUaGUgdXNlciBzdGlsbCBoYXMgdG8gcHJvZHVjZSBhIG5ldyBWTSBjb25maWcgZmlsZSwgY3Jl
YXRlIHRoZSBuZXcKPiA+Pj4+Pj4gZGlzaywgc2F2ZSB0aGUgUUVNVSBzdGF0ZSwgZXRjLgo+ID4+
Pgo+ID4+PiBJTU8gdGhlIGRlZmF1bHQgYmVoYXZpb3Igb2YgdGhlIGZvcmsgY29tbWFuZCBzaG91
bGQgYmUgdG8gbGVhdmUgdGhlCj4gPj4+IG9yaWdpbmFsIFZNIHBhdXNlZCwgc28gdGhhdCB5b3Ug
Y2FuIGNvbnRpbnVlIHVzaW5nIHRoZSBzYW1lIGRpc2sgYW5kCj4gPj4+IG5ldHdvcmsgY29uZmln
IGluIHRoZSBmb3JrIGFuZCB5b3Ugd29uJ3QgbmVlZCB0byBwYXNzIGEgbmV3IGNvbmZpZwo+ID4+
PiBmaWxlLgo+ID4+Pgo+ID4+PiBBcyBKdWxpZW4gYWxyZWFkeSBzYWlkLCBtYXliZSBJIHdhc24n
dCBjbGVhciBpbiBteSBwcmV2aW91cyByZXBsaWVzOgo+ID4+PiBJJ20gbm90IGFza2luZyB5b3Ug
dG8gaW1wbGVtZW50IGFsbCB0aGlzLCBpdCdzIGZpbmUgaWYgdGhlCj4gPj4+IGltcGxlbWVudGF0
aW9uIG9mIHRoZSBmb3JrLXZtIHhsIGNvbW1hbmQgcmVxdWlyZXMgeW91IHRvIHBhc3MgY2VydGFp
bgo+ID4+PiBvcHRpb25zLCBhbmQgdGhhdCB0aGUgZGVmYXVsdCBiZWhhdmlvciBpcyBub3QgaW1w
bGVtZW50ZWQuCj4gPj4+Cj4gPj4+IFdlIG5lZWQgYW4gaW50ZXJmYWNlIHRoYXQncyBzYW5lLCBh
bmQgdGhhdCdzIGRlc2lnbmVkIHRvIGJlIGVhc3kgYW5kCj4gPj4+IGNvbXByZWhlbnNpdmUgdG8g
dXNlLCBub3QgYW4gaW50ZXJmYWNlIGJ1aWx0IGFyb3VuZCB3aGF0J3MgY3VycmVudGx5Cj4gPj4+
IGltcGxlbWVudGVkLgo+ID4+Cj4gPj4gT0ssIHNvIEkgdGhpbmsgdGhhdCB3b3VsZCBsb29rIGxp
a2UgInhsIGZvcmstdm0gPHBhcmVudF9kb21pZD4iIHdpdGgKPiA+PiBhZGRpdGlvbmFsIG9wdGlv
bnMgZm9yIHRoaW5ncyBsaWtlIG5hbWUsIGRpc2ssIHZsYW4sIG9yIGEgY29tcGxldGVseQo+ID4+
IG5ldyBjb25maWcsIGFsbCBvZiB3aGljaCBhcmUgY3VycmVudGx5IG5vdCBpbXBsZW1lbnRlZCwg
KyBhbgo+ID4+IGFkZGl0aW9uYWwgb3B0aW9uIHRvIG5vdCBsYXVuY2ggUUVNVSBhdCBhbGwsIHdo
aWNoIHdvdWxkIGJlIHRoZSBvbmx5Cj4gPj4gb25lIGN1cnJlbnRseSB3b3JraW5nLiBBbHNvIGtl
ZXBpbmcgdGhlIHNlcGFyYXRlICJ4bCBmb3JrLWxhdW5jaC1kbSIKPiA+PiBhcyBpcy4gSXMgdGhh
dCB3aGF0IHdlIGFyZSB0YWxraW5nIGFib3V0Pwo+ID4KPiA+IEkgdGhpbmsgZm9yay1sYXVuY2gt
dm0gc2hvdWxkIGp1c3QgYmUgYW4gb3B0aW9uIG9mIGZvcmstdm0gKGllOgo+ID4gLS1sYXVuY2gt
ZG0tb25seSBvciBzb21lIHN1Y2gpLiBJIGRvbid0IHRoaW5rIHRoZXJlJ3MgYSByZWFzb24gdG8g
aGF2ZQo+ID4gYSBzZXBhcmF0ZSB0b3AtbGV2ZWwgY29tbWFuZCB0byBqdXN0IGxhdW5jaCB0aGUg
ZGV2aWNlIG1vZGVsLgo+Cj4gU28gZmlyc3Qgb2YgYWxsLCBUYW1hcyAtLSBkbyB5b3UgYWN0dWFs
bHkgbmVlZCB0byBleGVjIHhsIGhlcmU/ICBXb3VsZAo+IGl0IG1ha2Ugc2Vuc2UgZm9yIHRoZXNl
IHRvIHN0YXJ0IG91dCBzaW1wbHkgYXMgbGlieGwgZnVuY3Rpb25zIHRoYXQgYXJlCj4gY2FsbGVk
IGJ5IHlvdXIgc3lzdGVtPwoKRm9yIG15IGN1cnJlbnQgdG9vbHMgJiB0ZXN0cyAtIG5vLiBJIGRv
bid0IHN0YXJ0IFFFTVUgZm9yIHRoZSBmb3JrcyBhdAphbGwuIFNvIGF0IHRoaXMgcG9pbnQgSSBk
b24ndCBldmVuIG5lZWQgbGlieGwuIEJ1dCBJIGNhbiBmb3Jlc2VlIHRoYXQKYXQgc29tZSBwb2lu
dCBpbiB0aGUgZnV0dXJlIGl0IG1heSBiZWNvbWUgbmVjZXNzYXJ5IGluIGNhc2Ugd2Ugd2FudAph
bGxvdyB0aGUgZm9ya2VkIFZNIHRvIHRvdWNoIGVtdWxhdGVkIGRldmljZXMuIFdpcmluZyBRRU1V
IHVwIGFuZAptYWtpbmcgdGhlIHN5c3RlbSBmdW5jdGlvbmFsIGFzIGEgd2hvbGUgSSBmb3VuZCBp
dCBlYXNpZXIgdG8gZG8gaXQgdmlhCnhsLiBUaGVyZSBpcyBqdXN0IHdheSB0b28gbWFueSBtb3Zp
bmcgY29tcG9uZW50cyBpbnZvbHZlZCB0byBkbyB0aGF0CmFueSBvdGhlciB3YXkuCgo+Cj4gSSBh
Y3R1YWxseSBkaXNhZ3JlZSB0aGF0IHdlIHdhbnQgYSBzaW5nbGUgY29tbWFuZCB0byBkbyBhbGwg
b2YgdGhlc2UuCj4gSWYgd2UgZGlkIHdhbnQgYGV4ZWMgeGxgIHRvIGJlIG9uZSBvZiB0aGUgc3Vw
cG9ydGVkIGludGVyZmFjZXMsIEkgdGhpbmsKPiBpdCB3b3VsZCBicmVhayBkb3duIHNvbWV0aGlu
ZyBsaWtlIHRoaXM6Cj4KPiBgeGwgZm9yay1kb21haW5gOiBPbmx5IGZvcmtzIHRoZSBkb21haW4u
Cj4gYHhsIGZvcmstbGF1bmNoLWRtYDogKG9yIGF0dGFjaC1kbT8pOiBTdGFydCB1cCBhbmQgYXR0
YWNoIHRoZQo+IGRldmljZW1vZGVsIHRvIHRoZSBkb21haW4KPgo+IFRoZW4gYHhsIGZvcmtgIChv
ciBtYXliZSBgeGwgZm9yay12bWApIHdvdWxkIGJlIHNvbWV0aGluZyBpbXBsZW1lbnRlZCBpbgo+
IHRoZSBmdXR1cmUgdGhhdCB3b3VsZCBmb3JrIHRoZSBlbnRpcmUgZG9tYWluLgoKSSByZWFsbHkg
ZG9uJ3QgaGF2ZSBhIHN0cm9uZyBvcGluaW9uIGFib3V0IHRoaXMgZWl0aGVyIHdheS4gSSBjYW4g
c2VlCml0IHdvcmtpbmcgZWl0aGVyIHdheS4gSGF2aW5nIHRoZW0gYWxsIGJ1bmRsZWQgdW5kZXIg
YSBzaW5nbGUKdG9wLWxldmVsIGNvbW1lbnQgZG9lc24ndCBwb2xsdXRlIHRoZSBoZWxwIHRleHQg
d2hlbiBzb21lb25lIGlzIGp1c3QKbG9va2luZyBhdCB3aGF0IHhsIGNhbiBkbyBpbiBnZW5lcmFs
LiBNYWtlcyB0aGF0IGNvbW1hbmQgYSBsb3QgbW9yZQpjb21wbGV4IGZvciBzdXJlIGJ1dCBJIGRv
bid0IHRoaW5rIGl0J3MgdG9vIGJhZC4KCj4KPiAoVGhpcyBpcyBzaW1pbGFyIHRvIGhvdyBgZ2l0
IGFtYCB3b3JrcyBmb3IgaW5zdGFuY2U7IGludGVybmFsbHkgaXQgcnVucwo+IHNldmVyYWwgc3Rl
cHMsIGluY2x1ZGluZyBgZ2l0IG1haWxzcGxpdGAsIGBnaXQgbWFpbGluZm9gLCBhbmQgYGdpdAo+
IGFwcGx5LXBhdGNoYCwgZWFjaCBvZiB3aGljaCBjYW4gYmUgY2FsbGVkIGluZGl2aWR1YWxseS4p
Cj4KPiBJIHRoaW5rIEkgd291bGQgYWxzbyBoYXZlOgo+Cj4gYHhsIGZvcmstc2F2ZS1kbWA6IENv
bm5lY3Qgb3ZlciBxbXAgdG8gdGhlIHBhcmVudCBkb21haW4gYW5kIHNhdmUgdGhlIGRtCj4gZmls
ZQoKQXllLCBjb3VsZCBiZSBkb25lLiBGb3Igbm93IEkgZGlkbid0IGJvdGhlciBzaW5jZSBpdHMg
dHJpdmlhbCB0byBkbwptYW51YWxseSBhbHJlYWR5LgoKPgo+IFRoZW4gaGF2ZSBgeGwgZm9yay1s
YXVuY2gtZG1gIGVpdGhlciB0YWtlIGEgZmlsZW5hbWUgKHNhdmVkIGZyb20gdGhlCj4gcHJldmlv
dXMgc3RlcCkgb3IgYSBwYXJlbnQgZG9tYWluIGlkIChpbiB3aGljaCBjYXNlIGl0IHdvdWxkIGFy
cmFuZ2UgdG8KPiBzYXZlIHRoZSBmaWxlIGl0c2VsZikuCj4KPiBBbHRob3VnaCBpbiBmYWN0LCBp
cyB0aGVyZSBhbnkgcmVhc29uIHdlIGNvdWxkbid0IHN0b3JlIHRoZSBwYXJlbnQKPiBkb21haW4g
SUQgaW4geGVuc3RvcmUsIHNvIHRoYXQgYHhsIGZvcmstbGF1bmNoLWRtYCBjb3VsZCBmaW5kIHRo
ZSBwYXJlbnQKPiBieSBpdHNlbGY/ICAoQWx0aG91Z2ggdGhhdCwgb2YgY291cnNlLCBpcyBzb21l
dGhpbmcgdGhhdCBjb3VsZCBiZSBhZGRlZAo+IGxhdGVyIGlmIGl0J3Mgbm90IHNvbWV0aGluZyBU
YW1hcyBuZWVkcy4pCgpDb3VsZCBiZSBkb25lLiBCdXQgSSBzdG9yZSBJRCBpbnRlcm5hbGx5IGlu
IG15IHRvb2xzIGFueXdheSBzaW5jZSBJCm5lZWQgaXQgdG8gaW5pdGlhbGl6ZSBWTUkuIFNvIGhh
dmluZyBpdCBpbiBYZW5zdG9yZSBpcyBub3QgcmVxdWlyZWQKZm9yIG1lLiBJbiBmYWN0IEkgd291
bGQgcHJlZmVyIHRvIGxlYXZlIFhlbnN0b3JlIG91dCBvZiB0aGVzZQpvcGVyYXRpb25zIGFzIG11
Y2ggYXMgcG9zc2libGUgY2F1c2UgaXQgd291bGQgc2xvdyB0aGluZ3MgZG93bi4gSW4gbXkKbGF0
ZXN0IHRlc3RzIGZvcmtpbmcgaXMgZG93biB0byAwLjAwMDdzLCBoYXZpbmcgdG8gdG91Y2ggWGVu
c3RvcmUgZm9yCmVhY2ggd291bGQgc2xvdyB0aGluZ3MgZG93biBjb25zaWRlcmFibHkuCgpUaGFu
a3MsClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
