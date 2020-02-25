Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F2716C0B7
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 13:25:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6ZFV-0001xD-Rd; Tue, 25 Feb 2020 12:23:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xmvt=4N=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1j6ZFU-0001x7-Om
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 12:23:40 +0000
X-Inumbo-ID: a749134e-57c9-11ea-a490-bc764e2007e4
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a749134e-57c9-11ea-a490-bc764e2007e4;
 Tue, 25 Feb 2020 12:23:40 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id e10so15989831edv.9
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2020 04:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=q1cK4poFmCz8En5bwYcdJvyN0K21uuQlEKzQqdW9q2U=;
 b=aRICDOLyEeNFpvoRv5bpCApDo7IvXN3RbJifhg8ckFklmNXeLpd3cehdkKhJeK712d
 p/ld3a+6ZTh0Su4XSW4uSUJheG9Py5UuyYC4hqX6H+qiR+cftVUgeXs7/DNm92Fjarnz
 4sHpqN/x7A5UVkmsyPJUn3hpjG9N82ZrcTYMc0F//iPSMScQ0TmffmkpaaOSgyXjrloE
 W3hZhI35E/U6nUSzED8km0uYkQQwgMGSTvzXvwyCHopFcX7+WZ+YXgnZyTnh5Gv4lbhM
 cfICgUGuluaDNAN8A6088MQmjNSvDj1bYBUnMDtXB5/fgqiHeahRJI+lssZSN7ZMdgjr
 Sd2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=q1cK4poFmCz8En5bwYcdJvyN0K21uuQlEKzQqdW9q2U=;
 b=ON3l01auySgMsaL5Gkl+pPQoh10hkTM/hw1MMpdJg7K1ATodcv4j5biSCw1YID3NVC
 7ES0LXcXvSUrBhQjg9/OL26SJaRUuC16BLN4su8WCgdcIAjJ96WHgltLTuMa9XccSqkN
 1Y8SEZo9u4GAsqfm0d0N1e4wSMu3SkU5Ah+1+K/ddCm7lTsq6efHKXmu4k+WvlknULfh
 l3iJETUveKRhsa0OtQTFYleiVv2vUzwmEORorxznC1WT28/+ZH/CTpnSPpmH3E2yYmvE
 Ww/SXOGBK82E+yDB76S0+pKUOwMkOGrWLi0gAETM1Fk8hCy0VBfw44VXo8V96kmAKVWk
 3uDA==
X-Gm-Message-State: APjAAAW28ENzIi6RBayJVDN0bGc0upwhpwLWVSuvWr3pPRqwlknXJW13
 jbrH2UeSQFbRjemMlZ4RpPB+DrE9b3c=
X-Google-Smtp-Source: APXvYqxQURIDJ80BUv1Bcnsb33m7C53aC6qfrTgIZ1Z6HF8I3Ikq5F+GEBRM4mOBD0eAp/47msc78A==
X-Received: by 2002:aa7:df11:: with SMTP id c17mr49733271edy.326.1582633418668; 
 Tue, 25 Feb 2020 04:23:38 -0800 (PST)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com.
 [209.85.221.54])
 by smtp.gmail.com with ESMTPSA id f17sm960649eja.37.2020.02.25.04.23.37
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2020 04:23:37 -0800 (PST)
Received: by mail-wr1-f54.google.com with SMTP id r11so14490187wrq.10
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2020 04:23:37 -0800 (PST)
X-Received: by 2002:adf:f288:: with SMTP id k8mr77165617wro.301.1582633416980; 
 Tue, 25 Feb 2020 04:23:36 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582310142.git.tamas.lengyel@intel.com>
 <dff6668838b61fb7fe508588bef91d650cddfeb5.1582310142.git.tamas.lengyel@intel.com>
 <20200225100452.GA4679@Air-de-Roger>
 <CABfawhn8ukW3KrcM-epW7QwSQjLupQdQ4HDDe31R=0URF8tjJg@mail.gmail.com>
 <20200225120606.GB4679@Air-de-Roger>
In-Reply-To: <20200225120606.GB4679@Air-de-Roger>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 25 Feb 2020 05:23:00 -0700
X-Gmail-Original-Message-ID: <CABfawhmrnpiWaM_rUTTS0QF4oZKFpwe3UjpsVNMgHmq48igOyw@mail.gmail.com>
Message-ID: <CABfawhmrnpiWaM_rUTTS0QF4oZKFpwe3UjpsVNMgHmq48igOyw@mail.gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [Xen-devel] [PATCH v9 3/5] xen/mem_sharing: VM forking
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMjUsIDIwMjAgYXQgNTowNiBBTSBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIEZlYiAyNSwgMjAyMCBhdCAwNDo0Mzoz
MEFNIC0wNzAwLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gPiBPbiBUdWUsIEZlYiAyNSwgMjAy
MCBhdCAzOjA1IEFNIFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90
ZToKPiA+ID4KPiA+ID4gT24gRnJpLCBGZWIgMjEsIDIwMjAgYXQgMTA6NDk6MjFBTSAtMDgwMCwg
VGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+ID4gPiA+IFZNIGZvcmtpbmcgaXMgdGhlIHByb2Nlc3Mg
b2YgY3JlYXRpbmcgYSBkb21haW4gd2l0aCBhbiBlbXB0eSBtZW1vcnkgc3BhY2UgYW5kIGEKPiA+
ID4gPiBwYXJlbnQgZG9tYWluIHNwZWNpZmllZCBmcm9tIHdoaWNoIHRvIHBvcHVsYXRlIHRoZSBt
ZW1vcnkgd2hlbiBuZWNlc3NhcnkuIEZvcgo+ID4gPiA+IHRoZSBuZXcgZG9tYWluIHRvIGJlIGZ1
bmN0aW9uYWwgdGhlIFZNIHN0YXRlIGlzIGNvcGllZCBvdmVyIGFzIHBhcnQgb2YgdGhlIGZvcmsK
PiA+ID4gPiBvcGVyYXRpb24gKEhWTSBwYXJhbXMsIGhhcCBhbGxvY2F0aW9uLCBldGMpLgo+ID4g
Pgo+ID4gPiBJJ3ZlIGp1c3QgcmVhbGl6ZWQgdGhhdCBJJ20gbm90IHN1cmUgaG93IGFyZSBzcGVj
aWFsIHBhZ2VzIGhhbmRsZWQsCj4gPiA+IHdoYXQgaGFwcGVucyB0byB0aGUgeGVuc3RvcmUsIGNv
bnNvbGUsIHNoYXJlZCBpbmZvIHBhZ2VzLCBvciB0aGUKPiA+ID4gdmNwdSBpbmZvIHBhZ2VzIGlm
IHRoZSBwYXJlbnQgaGFzIHRob3NlIHJlZ2lzdGVyZWQ/Cj4gPgo+ID4gVGhlIGZvcmsgc3RhcnRz
IG91dCB3aXRoIGFuIGVtcHR5IHAybSBzbyB0aGVzZSBwYWdlcyBhcmUgbm90IHByZXNlbnQuCj4g
PiBJbiBjYXNlIHRoZSBndWVzdCBpdHNlbGYgdHJpZXMgdG8gYWNjZXNzIHRoZXNlIHBhZ2VzLCBv
ciBhIGZvcmVpZ24KPiA+IG1hcHBpbmcgaXMgc2V0IHVwIGZvciB0aGVtLCB0aGVuIHRoYXQgd2ls
bCB0cmlnZ2VyIGZvcmtfcGFnZSBmcm9tIHRoZQo+ID4gcGFyZW50LiBJIHNlZSB0aGF0IGluIHRo
ZSBWTSByZXN0b3JlIHBhdGggY2xlYXJzIHRoZSBwYWdlcyBmb3IKPiA+IEhWTV9QQVJBTV9DT05T
T0xFX1BGTiwgSFZNX1BBUkFNX1NUT1JFX1BGTiwgSFZNX1BBUkFNX0lPUkVRX1BGTiBhbmQKPiA+
IEhWTV9QQVJBTV9CVUZJT1JFUV9QRk4gYnV0IGRvZXNuJ3QgcmVhbGx5IGV4cGxhaW4gd2h5IHRo
YXQgd291bGQgYmUKPiA+IHJlcXVpcmVkLiBJIGNhbiBjZXJ0YWlubHkgYWRkIHRoZSBzYW1lIHNw
ZWNpYWwgaGFuZGxpbmcgZm9yIHRoZXNlIEhWTQo+ID4gcGFyYW1zIHdoZW4gdGhleSBnZXQgY29w
aWVkIGR1cmluZyB0aGUgZm9yayBoeXBlcmNhbGwuCj4KPiBUaG9zZSBwYXJhbXMgYXJlIGxpa2Vs
eSBzZXQgYnkgdGhlIHRvb2xzdGFjayB3aGVuIGNyZWF0aW5nIHRoZSBkb21haW4uCj4gSSB0aGlu
ayB5b3Ugd2lsbCBoYXZlIHRvIGF0IGxlYXN0IGNvcHkgdGhlIHZhbHVlcyBmcm9tIHRoZSBwYXJl
bnQgYW5kCj4gbWF5YmUgcHJlLXBvcHVsYXRlIHRoZW0gd2hlbiBmb3JraW5nLCB0aGF0IGRlcGVu
ZHMgb24gd2hldGhlciBpbnRlcm5hbAo+IFhlbiBhY2Nlc3NlcyB3aWxsIGFsc28gdHJpZ2dlciB0
aGUgcG9wdWxhdGUgbG9naWMuCgpBbGwgcGFyYW1zIGFuZCB0aGUgaHZtIGNvbnRleHQgZ2V0cyBj
b3BpZWQgZnJvbSB0aGUgcGFyZW50IGFscmVhZHkuCldoZXRoZXIgb3Igbm90IHRoZXNlIHBhZ2Vz
IG5lZWQgdG8gYmUgbWFudWFsbHkgcG9wdWxhdGVkLCBJJ20gbm90CnN1cmUuIEkgaGF2ZW4ndCBu
b3RpY2VkIGFueSBpc3N1ZXMgd2hlbiBmb3JraW5nIGEgc3RhbmRhcmQgVk0gYW5kIG5vdApwcmUt
cG9wdWxhdGluZyB0aGVzZSBwYWdlcy4gQnV0IEkgZ3Vlc3MgaXQgZG9lc24ndCBodXJ0IHRvIGJl
IGFzIGNsb3NlCnRvIHRoZSBzYXZlL3Jlc3RvcmUgcm91dGluZSBhcyBwb3NzaWJsZS4KCj4KPiA+
IEFzIGZvciB0aGUgdmNwdSBpbmZvIHBhZ2UsIEknbSBub3Qgc3VyZSB3aGVyZSB0aGF0IGdldHMg
YWxsb2NhdGVkIGFuZAo+ID4gbWFwcGVkIG5vcm1hbGx5LiBJIGRvbid0IHNlZSBhbnkgc3BlY2lh
bCBoYW5kbGluZyBmb3IgdGhhdCBpbiB0aGUKPiA+IHNhdmUvcmVzdG9yZSBwYXRocy4KPgo+IFRo
ZSBzaGFyZWQgaW5mbyBwYWdlLCB0aGUgdmNwdSBpbmZvIGFuZCB0aGUgc3RvbGVuIHRpbWUgcGFn
ZXMgYXJlIHRlYXIKPiBkb3duIGR1cmluZyBzdXNwZW5kL3Jlc3RvcmUsIGFuZCB0aGUgZ3Vlc3Qg
cmUtcmVnaXN0ZXJzIHRoZW0gd2hlbgo+IHJlc3VtaW5nLiBTaW5jZSB0aGUgZ3Vlc3QgaXMgbm90
IGF3YXJlIG9mIHRoZSBmb3JrIGhhcHBlbmluZywgeW91IHdpbGwKPiBoYXZlIHRvIHBvcHVsYXRl
IHRob3NlIG9uIGZvcmsgYW5kIG1ha2Ugc3VyZSB0aGUgZG9tYWluIGZpZWxkcwo+IHBvaW50aW5n
IHRvIHRoZW0gYXJlIHVwZGF0ZWQsIHNvIHRoYXQgWGVuIGNhbiBjb250aW51ZSB1cGRhdGluZyB0
aGlzCj4gc2hhcmVkIGFyZWFzLgoKQ291bGQgeW91IHBvaW50IG1lIHRvIHdoZXJlIHRoaXMgY29k
ZSBsaXZlcyBvciB3aGVyZSB0aGVzZSBwYWdlcyBhcmUKYmVpbmcgbWFwcGVkIGludG8gdGhlIGd1
ZXN0PyBJJ3ZlIGJlZW4gZ3JlcHBpbmcgZm9yIGEgd2hpbGUgbm93IGFuZAppdCdzIG5vdCBjbGVh
ciB0byBtZSBzdGlsbC4KCj4KPiA+IFdlIHVzZSB0aGUgc3RhbmRhcmQgY3JlYXRlZG9tYWluIGh5
cGVyY2FsbCB0bwo+ID4gc2V0dXAgdGhlIFZNIHRoYXQgd2lsbCBiZSB1c2VkIGZvciB0aGUgZm9y
aywgdGhlbiB1c2UgdmNwdV9jcmVhdGUgdG8KPiA+IGJyaW5nIHVwIHRoZSB2Q1BVcyBhbmQganVz
dCBsb2FkIHRoZW0gd2l0aCB0aGUgaHZtIGNvbnRleHQsIHByZXR0eQo+ID4gbXVjaCB0aGUgc2Ft
ZSB3YXkgdGhlIHJlc3RvcmUgcGF0aCB3b3VsZC4KPgo+IERlcGVuZGluZyBvbiBob3cgbXVjaCBv
ZiB0aGUgY3JlYXRpb24gcHJvY2VzcyB5b3Ugc2tpcCB5b3UgbWlnaHQgZW5kCj4gdXAgbWlzc2lu
ZyBiaXRzLCB0aGVyZSBhcmUgYSBidW5jaCBvZiBoeXBlcmNhbGxzIGludm9sdmVkIGluIGRvbWFp
bgo+IGNyZWF0aW9uLgoKSSBtb2RlbGVkIHRoZSBmb3JraW5nIHByb2Nlc3NlcyBoZWF2aWx5IG9u
IHRoZSBzYXZlL3Jlc3RvcmUgcm91dGluZXMuClNvIGV2ZXJ5dGhpbmcgdGhhdCBnZXRzIGNhbGxl
ZCBkdXJpbmcgYSBWTSByZXN0b3JlIGdldHMgY2FsbGVkIGR1cmluZwphIFZNIGZvcmssIGV4Y2Vw
dCBpdCBoYXBwZW5zIHdpdGhpbiBYZW4gaW5zdGVhZCBvZiB0aGUgdG9vbHN0YWNrCmlzc3Vpbmcg
YSBidW5jaCBvZiBoeXBlcmNhbGxzIHNpbmNlIHRoYXQncyBhIGxvdCBhIGZhc3Rlci4gVGhlIG9u
bHkKZGlmZmVyZW5jZSBiZXR3ZWVuIGEgc2F2ZS9yZXN0b3JlIGFuZCBhIGZvcmsgc2hvdWxkIGJl
IHRoYXQgdGhlIHAybSBvZgp0aGUgZm9yayBpc24ndCBwb3B1bGF0ZWQgc2luY2UgdGhhdCBoYXBw
ZW5zIGR1cmluZyBydW50aW1lLgoKPgo+IE5vdGUgYWxzbyB0aGF0IGR1cmluZyBhIHJlc3RvcmUg
dGhlIGd1ZXN0IGlzIGF3YXJlIG9mIHN1Y2ggcHJvY2VzcywKPiBhbmQgd2lsbCBrbm93IHRoYXQg
aXQgbmVlZHMgdG8gcmUtcmVnaXN0ZXIgc29tZSBzdHVmZiwgYnV0IHRoYXQncyBub3QKPiB0aGUg
Y2FzZSB3aGVuIGZvcmtpbmcsIHNpbmNlIHRoZSBndWVzdCBpcyBub3QgYXdhcmUgeW91IG5lZWQg
dG8gbWFrZQo+IHN1cmUgZXZlcnl0aGluZyBpcyBpbiBwbGFjZS4gVGhlcmUgYXJlIGFsc28gdGhl
IGdyYW50IHRhYmxlIHBhZ2VzLAo+IHdoaWNoIEkgdGhpbmsgc2hvdWxkIGFsc28gYmUgaGFuZGxl
ZCBzb21laG93IChvciB3ZSBuZWVkIHRvIGF0IGxlYXN0Cj4gbm90ZSB0aGlzIGlzbid0IGhhbmRs
ZWQgYW5kIHdpbGwgbmVlZCBmaXhpbmcpLgoKVHJ1ZSwgdGhlIGZvcmsgaXMgbm90IGF3YXJlIHRo
YXQgc29tZXRoaW5nIGhhcHBlbmVkIChhbmQgd2Ugd2FudCB0bwprZWVwIGl0IHRoYXQgd2F5KS4g
QnV0IHJpZ2h0IG5vdyBldmVyeXRoaW5nIHNlZW1zIHRvICJqdXN0IHdvcmsiIGFzCmZhciBhcyBh
IHN0YW5kYXJkIFZNIGlzIHVzZWQuIFRoZXJlIG11c3QgYmUgYSBtaWxsaW9uIGNvcm5lcmNhc2Vz
IGxlZnQKdGhhdCBJIGhhdmVuJ3QgY292ZXJlZCBmb3Igc3VyZS4KClRhbWFzCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
