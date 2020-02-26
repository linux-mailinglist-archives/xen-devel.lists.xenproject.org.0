Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A46EC1703A4
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 17:01:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6z5C-0004sF-Cc; Wed, 26 Feb 2020 15:58:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5J6w=4O=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1j6z5A-0004sA-UN
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 15:58:44 +0000
X-Inumbo-ID: dd76cb04-58b0-11ea-aba8-bc764e2007e4
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd76cb04-58b0-11ea-aba8-bc764e2007e4;
 Wed, 26 Feb 2020 15:58:44 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id p23so4375213edr.5
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2020 07:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OR2zVeuJbM6hakmvJg4T6qxyKmwVNE/2jAwKcnKBRl8=;
 b=0EvoiPHN2SbYKdAcGsPd8Z3q4juInSDetOS5dQ3yDQ2SDJmB2nnQd3a2p6RCY+ShLJ
 k3r8J+VtEKtjFa3Dn5sQ4FeNHNrHmujgY0RkNDjoOyW7CzhjJhZX/TdCT3Z0YYPb8y+V
 2GxHXvh3pnhzqmfqFdZg3Vmba1yWXfYkuQu7y/+QzkVYfcEbSGcYUuVCCIFxGvQ0nQLu
 X3gjnaKzpUNuhgUjuZKT8FEWl/6TqAgafi8bC43PNBsaV0qG7xQePngFojMM7fdyPWcw
 ECg5nphHeoXT1V4iuwN6Idm/Rnm0Is/ri+vm8RMKZd/Su9uew5sXZFUNm8Q+yyY72mmE
 oDyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OR2zVeuJbM6hakmvJg4T6qxyKmwVNE/2jAwKcnKBRl8=;
 b=JRNYF/0PNzriDGOdzz+NBnWXKKTr2pkjsQSdDyrBxDWzDjzw0yfb21ym40S1GoOf6J
 TWDnCs/uBeFMM5Ks/O6HFMMEQeAKiowg3i11nKw4gE+jRP/bwWAvybISFNvcCXn0Cs9Y
 DESjNf9HIK3gItFnAFZ9Qnji9n4O7CI/WlrqrbvmneQjRmzJ+owcFkzXzHpTlf8u5pK3
 RlIJXXz9eGnMM28k2I7uZCu0kcbAwStRe/D93DDg5T/xbFyn1G/ODoiILRoUK+DfDClq
 eLYxpcAvOzcCZ7NS2VoBXVEHpAsUBpkw5VFf6poovWd98tSpzwwkXH7KGKRZObx1anY5
 0JVw==
X-Gm-Message-State: APjAAAUpf+A0n0gs3D2nqxZWOYaBicO/7gsAHvbnOhxZ28QrO0XPGzjn
 1oKhGhuAeRh0J+K31/sQ3vNgNyhVmro=
X-Google-Smtp-Source: APXvYqy7KFpsGWp2fbnOfYlid67duwP+Y6P/d5uuZP7Y9G6GdqREwshF2pypqeWVVBfjEB/Hem4VBA==
X-Received: by 2002:aa7:c38e:: with SMTP id k14mr5369469edq.309.1582732723510; 
 Wed, 26 Feb 2020 07:58:43 -0800 (PST)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com.
 [209.85.128.44])
 by smtp.gmail.com with ESMTPSA id cw15sm157093edb.44.2020.02.26.07.58.42
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2020 07:58:42 -0800 (PST)
Received: by mail-wm1-f44.google.com with SMTP id p9so3661600wmc.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2020 07:58:42 -0800 (PST)
X-Received: by 2002:a7b:c779:: with SMTP id x25mr6318050wmk.77.1582732721968; 
 Wed, 26 Feb 2020 07:58:41 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582658216.git.tamas.lengyel@intel.com>
 <8df741964b56c10ed912f9187dcb31aae7251085.1582658216.git.tamas.lengyel@intel.com>
 <20200226151247.GF24458@Air-de-Roger.citrite.net>
 <CABfawhn1mDFcP3saj3DzritNS2Zxzs5tsLeHuobwYAG3SYWOzA@mail.gmail.com>
 <20200226153621.GH24458@Air-de-Roger.citrite.net>
In-Reply-To: <20200226153621.GH24458@Air-de-Roger.citrite.net>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 26 Feb 2020 08:58:05 -0700
X-Gmail-Original-Message-ID: <CABfawhkp6nvPt4KM8rOsE06D=h_1iyeCRi9aS2i3OvFBnHL6KA@mail.gmail.com>
Message-ID: <CABfawhkp6nvPt4KM8rOsE06D=h_1iyeCRi9aS2i3OvFBnHL6KA@mail.gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [Xen-devel] [PATCH v10 1/3] xen/mem_sharing: VM forking
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

T24gV2VkLCBGZWIgMjYsIDIwMjAgYXQgODozNiBBTSBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIEZlYiAyNiwgMjAyMCBhdCAwODoyMDoz
MEFNIC0wNzAwLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gPiA+ID4gK3N0YXRpYyBpbnQgcG9w
dWxhdGVfc3BlY2lhbF9wYWdlcyhzdHJ1Y3QgZG9tYWluICpjZCkKPiA+ID4gPiArewo+ID4gPiA+
ICsgICAgc3RydWN0IHAybV9kb21haW4gKnAybSA9IHAybV9nZXRfaG9zdHAybShjZCk7Cj4gPiA+
ID4gKyAgICBzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IHBhcmFtc1tdID0KPiA+ID4gPiArICAg
IHsKPiA+ID4gPiArICAgICAgICBIVk1fUEFSQU1fU1RPUkVfUEZOLAo+ID4gPiA+ICsgICAgICAg
IEhWTV9QQVJBTV9JT1JFUV9QRk4sCj4gPiA+ID4gKyAgICAgICAgSFZNX1BBUkFNX0JVRklPUkVR
X1BGTiwKPiA+ID4gPiArICAgICAgICBIVk1fUEFSQU1fQ09OU09MRV9QRk4KPiA+ID4gPiArICAg
IH07Cj4gPiA+ID4gKyAgICB1bnNpZ25lZCBpbnQgaTsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICBm
b3IgKCBpPTA7IGk8NDsgaSsrICkKPiA+ID4KPiA+ID4gTml0OiBjYW4geW91IHBsZWFzZSBhZGQg
c29tZSBzcGFjZXMgYXJvdW5kIHRoZSBvcGVyYXRvcnM/Cj4gPgo+ID4gU3VyZS4KPiA+Cj4gPiA+
Cj4gPiA+ID4gKyAgICB7Cj4gPiA+ID4gKyAgICAgICAgdWludDY0X3QgdmFsdWUgPSAwOwo+ID4g
PiA+ICsgICAgICAgIG1mbl90IG5ld19tZm47Cj4gPiA+ID4gKyAgICAgICAgc3RydWN0IHBhZ2Vf
aW5mbyAqcGFnZTsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgICAgaWYgKCBodm1fZ2V0X3BhcmFt
KGNkLCBwYXJhbXNbaV0sICZ2YWx1ZSkgfHwgIXZhbHVlICkKPiA+ID4gPiArICAgICAgICAgICAg
Y29udGludWU7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgICAgIGlmICggIShwYWdlID0gYWxsb2Nf
ZG9taGVhcF9wYWdlKGNkLCAwKSkgKQo+ID4gPiA+ICsgICAgICAgICAgICByZXR1cm4gLUVOT01F
TTsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgICAgbmV3X21mbiA9IHBhZ2VfdG9fbWZuKHBhZ2Up
Owo+ID4gPiA+ICsgICAgICAgIHNldF9ncGZuX2Zyb21fbWZuKG1mbl94KG5ld19tZm4pLCB2YWx1
ZSk7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgICAgIHJldHVybiBwMm0tPnNldF9lbnRyeShwMm0s
IF9nZm4odmFsdWUpLCBuZXdfbWZuLCBQQUdFX09SREVSXzRLLAo+ID4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBwMm1fcmFtX3J3LCBwMm0tPmRlZmF1bHRfYWNjZXNzLCAtMSk7
Cj4gPiA+Cj4gPiA+IEkgdGhpbmsgeW91IGFsc28gbmVlZCB0byBjb3B5IHRoZSBjb250ZW50cyBm
cm9tIHRoZSBwYXJlbnQgcGFnZSBoZXJlLgo+ID4KPiA+IFRoZSB0b29sc3RhY2sgc2ltcGx5IGNs
ZWFycyB0aGVzZSBwYWdlcyBkdXJpbmcgcmVzdG9yZSBzbyBJJ20gbm90IHN1cmUKPiA+IChzZWUg
aHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1ibG9iO2Y9dG9vbHMv
bGlieGMveGNfc3JfcmVzdG9yZV94ODZfaHZtLmM7aD0zZjc4MjQ4ZjMyZmVjMjM5ZGI3N2IwZTQ4
M2IwMTk1MjExZTZiOTc0O2hiPUhFQUQjbDYxKS4KPiA+IEkgZG9uJ3Qgc2VlIHdoeSB5b3Ugd291
bGQgaGF2ZSB0byBjbGVhciB0aGUgcGFnZXMgZmlyc3QgaWYgdGhleSBnZXQKPiA+IG92ZXJ3cml0
dGVuIGJ5IHNhdmVkIHZlcnNpb25zIGxhdGVyLiBPciB0aGVzZSBwYWdlcyBhcmUgZXhwZWN0ZWQg
dG8gYmUKPiA+IHRvcm4tZG93biBieSB0aGUgc2F2ZS9yZXN0b3JlIGF3YXJlIGd1ZXN0cz8KPgo+
IEd1ZXN0cyB1c2luZyB0aG9zZSBwYWdlcyBrbm93IHRoZXkgYXJlIHRvcm4gZG93biBkdXJpbmcg
c3VzcGVuZC9yZXN1bWUKPiBhbmQgZXhwZWN0IHRvIGZpbmQgYSBjbGVhbiBzdGF0ZSB3aGVuIHJl
c3VtaW5nLiBUaGF0J3Mgbm90IHRoZSBjYXNlIHdpdGgKPiBmb3JraW5nIGhvd2V2ZXIsIGFzIHRo
ZSBndWVzdCBpcyBjb21wbGV0ZWx5IHVuYXdhcmUgb2YgdGhlIGZvcmsKPiBoYXBwZW5pbmcuCj4K
PiBPbmUgdGhpbmcgSSdtIG5vdCBzdXJlIG9mIGlzIHdoZXRoZXIgdGhlIGJhY2tlbmRzICh4ZW5z
dG9yZWQsCj4geGVuY29uc29sZWQpIHdpbGwgY29wZSB3aXRoIHRob3NlIHBhZ2VzIGJlaW5nIGFs
cmVhZHkgcG9wdWxhdGVkIG9uCj4gZ3Vlc3QgY3JlYXRpb24uCj4KPiBBRkFJQ1QgYW5vdGhlciBp
c3N1ZSBpcyB0aGF0IHhlbnN0b3JlIHdhdGNoZXMgYXJlIG5vdCBjb3BpZWQgb3ZlciBmcm9tCj4g
dGhlIHBhcmVudCwgc28gYW55IHdhdGNoZXMgdGhlIHBhcmVudCBtaWdodCBoYXZlIHNldCB3aWxs
IG5vdCBmaXJlIG9uCj4gdGhlIGNoaWxkLiBUaGF0IHdvdWxkIHJlcXVpcmUgc29tZSBraW5kIG9m
IGludGVyYWN0aW9uIHdpdGggeGVuc3RvcmVkCj4gaW4gb3JkZXIgdG8gcmVxdWVzdCBhIGd1ZXN0
IHN0YXRlIHRvIGJlIGNvcGllZCBvdmVyIHRvIGFub3RoZXIgZ3Vlc3QuCgpTb3VuZHMgbGlrZSBp
dCBtb3N0IGxpa2VseSB3b3VsZCBuZWVkIHRvIGJlIGhhbmRsZWQgaWYgdGhlIGd1ZXN0IHVzZXMK
dGhlbS4gSSdtIG5vdCBzdXJlIGlmIGEgZGVmYXVsdCBMaW51eCBIVk0gZ3Vlc3QgdXNlcyB0aGVt
IHRob3VnaC4gQQpXaW5kb3dzIEhWTSBndWVzdCB3aXRob3V0IHRoZSBQViBkcml2ZXJzIGlzIGNl
cnRhaW5seSBub3QgWGVuIGF3YXJlIHNvCnRoZXJlIHRoaW5ncyBhbHJlYWR5IHdvcmsganVzdCBm
aW5lIGFuZCB0aGF0IGlzIG91ciBwcmltYXJ5IHRhcmdldCBmb3IKb3VyIHVzZS1jYXNlLiBQVkhW
TS9QVkggTGludXggZ3Vlc3RzIGFyZSBub3QuIFNvIHRoYXQncyByZWFsbHkgb3V0c2lkZQp0aGUg
c2NvcGUgb2Ygd2hhdCBJIGNhbiBjb250cmlidXRlIGF0IHRoZSBtb21lbnQuCgpUaGFua3MsClRh
bWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
