Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C01FB16C3CE
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 15:26:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6b89-0005sH-1e; Tue, 25 Feb 2020 14:24:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xmvt=4N=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1j6b87-0005s8-Oi
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 14:24:11 +0000
X-Inumbo-ID: 7d677de8-57da-11ea-aba8-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d677de8-57da-11ea-aba8-bc764e2007e4;
 Tue, 25 Feb 2020 14:24:11 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id p3so16421483edx.7
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2020 06:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hZOJOw3QnopEoPIhpLNYq1exKPV3pfyiogM5yaZMluU=;
 b=JK5dy9aoMpdffS1i7qiH38I8rM5aMxOwoZS/ZNtQmixHke1IsS8Ub3gPSGFWesW/aD
 mpAQR9cEXY2L1u4IPh7DlSr2JCpxheIBYVv7Rf1Fdw5basGGHcq0/ktxoWXwrofhM3my
 DLSBaGQ8fHMi5yjmPkokCk6X70CxOjO8Fjrcfh+Ke7CqaEizma+mFL74918pDMC2dPMI
 zngP7xYBs3uVVjInXdDoWuyAVj29LXVI3IqdDauxIWS1ZDV3yObu3R7BWcmGAtemW1gx
 dS31bvuutk6EipyBmQJ0av1ZINb94Bk7gghx2+7omA8vfSynnLtPcihLn5330YX1Bboe
 PLwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hZOJOw3QnopEoPIhpLNYq1exKPV3pfyiogM5yaZMluU=;
 b=pVlwYx+dwjsj4PhZ/qvkj7Vw8KtE248vop7zrHhoLIC4liyh6yTRudW5UOgbSoHL9z
 O+onUVc/Mj6qhWqv0uAmM3xaf+KnC54ZBH9IhyE8D4HrgKUfqWZE4WKdYlygnct0MeXA
 jzcB18vLdJZPPm0e5sIKVSXtJvzOG4MCNZ7OCLO5JXUgPqUvwv/3L3EzB9rNqOQRGTbK
 CIXyWzEtE4FEAKW6RJgxAgtOFgYQpjquEyJCPCshH1rMBuw0+JlwBCIlPZ3otnrzl19L
 wXSOW2Xn1i/uPxe+35RDQULdjcmmX+9UGbyMu63FmLahAan1vDK2H2yafTKuRWGtdusR
 tMUg==
X-Gm-Message-State: APjAAAWU2ea1vQmwcJfmPFCXEBuWJTU7qvPaEohD7TcKLgJTRcq2pGMl
 WTepb/YijvjWbNis/lJu4VoROr3uuWA=
X-Google-Smtp-Source: APXvYqzgds3s3GpI5P6DG1Wj8GTF/hoHMyCfMuJzaXZFfIleE4a8RvM3sKJe2JQhoba9p3RLeckJ0Q==
X-Received: by 2002:a17:906:a3c6:: with SMTP id
 ca6mr51664812ejb.265.1582640649985; 
 Tue, 25 Feb 2020 06:24:09 -0800 (PST)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com.
 [209.85.221.45])
 by smtp.gmail.com with ESMTPSA id k5sm1197515edx.58.2020.02.25.06.24.08
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2020 06:24:09 -0800 (PST)
Received: by mail-wr1-f45.google.com with SMTP id m16so14919183wrx.11
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2020 06:24:08 -0800 (PST)
X-Received: by 2002:adf:fe4c:: with SMTP id m12mr16175633wrs.386.1582640648020; 
 Tue, 25 Feb 2020 06:24:08 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582310142.git.tamas.lengyel@intel.com>
 <dff6668838b61fb7fe508588bef91d650cddfeb5.1582310142.git.tamas.lengyel@intel.com>
 <20200225100452.GA4679@Air-de-Roger>
 <CABfawhn8ukW3KrcM-epW7QwSQjLupQdQ4HDDe31R=0URF8tjJg@mail.gmail.com>
 <20200225120606.GB4679@Air-de-Roger>
 <CABfawhmrnpiWaM_rUTTS0QF4oZKFpwe3UjpsVNMgHmq48igOyw@mail.gmail.com>
In-Reply-To: <CABfawhmrnpiWaM_rUTTS0QF4oZKFpwe3UjpsVNMgHmq48igOyw@mail.gmail.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 25 Feb 2020 07:23:31 -0700
X-Gmail-Original-Message-ID: <CABfawhndDa1zFtUG6X-eBMo=963_Sosqo_UVjvv4hEJzcrn3=g@mail.gmail.com>
Message-ID: <CABfawhndDa1zFtUG6X-eBMo=963_Sosqo_UVjvv4hEJzcrn3=g@mail.gmail.com>
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

PiA+IE5vdGUgYWxzbyB0aGF0IGR1cmluZyBhIHJlc3RvcmUgdGhlIGd1ZXN0IGlzIGF3YXJlIG9m
IHN1Y2ggcHJvY2VzcywKPiA+IGFuZCB3aWxsIGtub3cgdGhhdCBpdCBuZWVkcyB0byByZS1yZWdp
c3RlciBzb21lIHN0dWZmLCBidXQgdGhhdCdzIG5vdAo+ID4gdGhlIGNhc2Ugd2hlbiBmb3JraW5n
LCBzaW5jZSB0aGUgZ3Vlc3QgaXMgbm90IGF3YXJlIHlvdSBuZWVkIHRvIG1ha2UKPiA+IHN1cmUg
ZXZlcnl0aGluZyBpcyBpbiBwbGFjZS4gVGhlcmUgYXJlIGFsc28gdGhlIGdyYW50IHRhYmxlIHBh
Z2VzLAo+ID4gd2hpY2ggSSB0aGluayBzaG91bGQgYWxzbyBiZSBoYW5kbGVkIHNvbWVob3cgKG9y
IHdlIG5lZWQgdG8gYXQgbGVhc3QKPiA+IG5vdGUgdGhpcyBpc24ndCBoYW5kbGVkIGFuZCB3aWxs
IG5lZWQgZml4aW5nKS4KPgo+IFRydWUsIHRoZSBmb3JrIGlzIG5vdCBhd2FyZSB0aGF0IHNvbWV0
aGluZyBoYXBwZW5lZCAoYW5kIHdlIHdhbnQgdG8KPiBrZWVwIGl0IHRoYXQgd2F5KS4gQnV0IHJp
Z2h0IG5vdyBldmVyeXRoaW5nIHNlZW1zIHRvICJqdXN0IHdvcmsiIGFzCj4gZmFyIGFzIGEgc3Rh
bmRhcmQgVk0gaXMgdXNlZC4gVGhlcmUgbXVzdCBiZSBhIG1pbGxpb24gY29ybmVyY2FzZXMgbGVm
dAo+IHRoYXQgSSBoYXZlbid0IGNvdmVyZWQgZm9yIHN1cmUuCj4KCkkndmUgaW1wbGVtZW50ZWQg
Zm9ya2luZyBmb3IgdGhlIHZjcHVfaW5mbyBwYWdlcyBhbmQgd2hpbGUgSSB3YXMKdGVzdGluZyBJ
IG5vdGljZWQgdGhhdCBhIExpbnV4IFZNIGJlaGF2ZXMgZGlmZmVyZW50bHkgZHVyaW5nIGZvcmtp
bmcKY29tcGFyZWQgdG8gYSBXaW5kb3dzIFZNLiBGb3JraW5nIGEgV2luZG93cyBWTSBhdCBydW50
aW1lIHdvcmtzIGFsbApmaW5lLCBWTkMgc2NyZWVuIGlzIHJlc3BvbnNpdmUsIGNhbiBsb2cgaW4g
YW5kIGluIGV2ZXJ5IHdheSB0aGUgZm9yawpiZWhhdmVzIGxpa2UgYSByZWd1bGFyIGRvbWFpbi4g
Rm9ya2luZyB0aGUgTGludXggVk0gaG93ZXZlciBhdCBydW50aW1lCnJlc3VsdHMgaW4gYSBmcm96
ZW4gVk5DIHNjcmVlbi4gVGhlIFZNIHJ1bnMgZmluZSBvdGhlcndpc2UsIEkgdXNlIGl0CmluIG15
IGZ1enogdGVzdHMgYW5kIHRyYWNpbmcgaXQgdmlhIFZNSSBzaG93cyB0aGF0IGJvdGggdGhlIGtl
cm5lbCBhbmQKdXNlcnNwYWNlIHByb2dyYW1zIGNvbnRpbnVlIHRvIGV4ZWN1dGUgaW4gdGhlIGZv
cmsgbm9ybWFsbHkuIFNvIHRoZXJlCm11c3QgYmUgc29tZSAiZ2x1ZSIgdGhlIExpbnV4IGd1ZXN0
IG5lZWRzIHRvIHdpcmUgdGhpbmdzIHVwIHdpdGggdGhlCnRvb2xzdGFjayB0aGF0IEknbSBtaXNz
aW5nLiBXaGVuIEkgZmlyc3Qgc2F2ZSB0aGUgTGludXggVk0gYW5kIHJlc3RvcmUKaXQgd2l0aCAi
eGwgcmVzdG9yZSAtcCIgYW5kIHRoZW4gY3JlYXRlIGZvcmtzIHRoZSBWTkMgY29uc29sZSBiZWNv
bWVzCnJlc3BvbnNpdmUganVzdCBhcyB3aXRoIHRoZSBXaW5kb3dzIFZNLgoKQXQgdGhlIG1vbWVu
dCBpdCdzIG5vdCBlbnRpcmVseSBjbGVhciB0byBtZSB3aGF0IEknbSBtaXNzaW5nIHRoYXQgdGhl
CkxpbnV4IGd1ZXN0IG5lZWRzIHNvIEknbSBpbmNsaW5lZCB0byBkZWNsYXJlIHRoaXMgYSBrbm93
biBsaW1pdGF0aW9uCmFuZCBtb3ZlIG9uIHNpbmNlIGl0J3Mgbm90IGNyaXRpY2FsIGZvciBvdXIg
dXNlLWNhc2UuCgpUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
