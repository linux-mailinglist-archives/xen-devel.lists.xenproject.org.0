Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC7E12477C
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 14:01:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihYsn-0001sD-6T; Wed, 18 Dec 2019 12:56:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kHBV=2I=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ihYsl-0001s3-Rq
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 12:56:51 +0000
X-Inumbo-ID: d85f486e-2195-11ea-9072-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d85f486e-2195-11ea-9072-12813bfff9fa;
 Wed, 18 Dec 2019 12:56:45 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y17so2190851wrh.5
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2019 04:56:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gfpxlJhEnmnQEAy6JjlMLI4GkmmmUT5fGpOXKgt7p/8=;
 b=I3LE5qseboujv0DBjgH2U2HkqTCm6dcDAN6g7L9FIgDnzLhfViXAZMdP7gMK8mUHe1
 GfWVkBzJKPQz1+luucu/htwo3SqZCYjp7yZpvNwFtutNTsHB3y8S9nHUP21QDH3GQarB
 gJUTO8US2GDIq4nV/A976dcnvIdWZf89f5GgUK2FgFj/4AdYiYIgU10Ez4TOzvhtTXAB
 eAfqA7b9A8l4LR/waRWtbHzu6FBdz14NGVANZbPkJ08mLcUrSH7fuYCPV+XvW85wBCjY
 5kfsKTjF0/iF25sgUCMGcj00ajbHo6tueTPGZ5C3ovTLiNbwkwhsxMXEtHEiF1yKd+yq
 RWuQ==
X-Gm-Message-State: APjAAAXGVHlyBYm1/S3w4kq74HEjp1tWGmELD1EF8J7+pdgdLfhNYyvz
 +mYkXinlQH8apC9084OE81A=
X-Google-Smtp-Source: APXvYqxrVHhieZscF0ObZzKfFVd2CV6Cu74P969UVaLgOZ/MYiJW2bBdPYTOduFLruZFqrzVMeaSag==
X-Received: by 2002:adf:ef10:: with SMTP id e16mr2608552wro.336.1576673804794; 
 Wed, 18 Dec 2019 04:56:44 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-234.amazon.com.
 [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id b16sm2579268wrj.23.2019.12.18.04.56.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2019 04:56:44 -0800 (PST)
To: Roman Shaposhnik <roman@zededa.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <CAMmSBy8Zh00tebTvz=__GDv478++b-2t4248YnkH0W9DVgqKbw@mail.gmail.com>
 <alpine.DEB.2.21.1912161814220.13474@sstabellini-ThinkPad-T480s>
 <CAMmSBy_EG6=20dHde7AHby48Q8aWoRLAX+LFWTTTuKeHi8M+dg@mail.gmail.com>
 <5db3b29a-2f07-c807-1ee2-503d779548f7@xen.org>
 <alpine.DEB.2.21.1912171029300.12921@sstabellini-ThinkPad-T480s>
 <CAMmSBy_EVnfw0yMpevhJ-PqXoKo1GgvojH1SXDMdm4FKGNDQPA@mail.gmail.com>
 <alpine.DEB.2.21.1912171058200.12921@sstabellini-ThinkPad-T480s>
 <CAMmSBy-bdEumC=6s6CVFweJWc50nh2-nkEmQ2jtkXjZzziD2_A@mail.gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <8645aa8e-bccd-b4df-46be-7730e0e6dd8b@xen.org>
Date: Wed, 18 Dec 2019 12:56:43 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <CAMmSBy-bdEumC=6s6CVFweJWc50nh2-nkEmQ2jtkXjZzziD2_A@mail.gmail.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] REGRESSION: Xen 4.13 RC5 fails to bootstrap Dom0 on
 ARM
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
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxOC8xMi8yMDE5IDAwOjA0LCBSb21hbiBTaGFwb3NobmlrIHdyb3RlOgo+ICAgICAg
ICAgIG1lbW9yeSB7Cj4gICAgICAgICAgICAgICAgICBkZXZpY2VfdHlwZSA9ICJtZW1vcnkiOwo+
ICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MCAweDAgMHgwIDB4NWUwMDAwMCAweDAgMHg1ZjAw
MDAwIDB4MCAweDEwMDAKPiAweDAgMHg1ZjAyMDAwIDB4MCAweGVmZDAwMCAweDAgMHg2ZTAwMDAw
IDB4MCAweDYwZjAwMCAweDAgMHg3NDEwMDAwCj4gMHgwIDB4MWFhZjAwMDAgMHgwIDB4MjFmMDAw
MDAgMHgwIDB4MTAwMDAwIDB4MCAweDIyMDAwMDAwIDB4MAo+IDB4MWMwMDAwMDA+Owo+ICAgICAg
ICAgIH07Cj4gCj4gICAgICAgICAgcmVzZXJ2ZWQtbWVtb3J5IHsKPiAgICAgICAgICAgICAgICAg
IHJhbmdlczsKPiAgICAgICAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDB4Mj47Cj4gICAgICAg
ICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwweDI+Owo+IAo+ICAgICAgICAgICAgICAgICAg
cmFtb29wc0AyMWYwMDAwMCB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgIGZ0cmFjZS1zaXpl
ID0gPDB4MjAwMDA+Owo+ICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zb2xlLXNpemUgPSA8
MHgyMDAwMD47Cj4gICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAgMHgyMWYwMDAw
MCAweDAgMHgxMDAwMDA+Owo+ICAgICAgICAgICAgICAgICAgICAgICAgICByZWNvcmQtc2l6ZSA9
IDwweDIwMDAwPjsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJyYW1v
b3BzIjsKPiAgICAgICAgICAgICAgICAgIH07Cj4gCj4gICAgICAgICAgICAgICAgICBsaW51eCxj
bWEgewo+ICAgICAgICAgICAgICAgICAgICAgICAgICBsaW51eCxjbWEtZGVmYXVsdDsKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgcmV1c2FibGU7Cj4gICAgICAgICAgICAgICAgICAgICAgICAg
IHNpemUgPSA8MHgwIDB4ODAwMDAwMD47Cj4gICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBh
dGlibGUgPSAic2hhcmVkLWRtYS1wb29sIjsKPiAgICAgICAgICAgICAgICAgIH07Cj4gICAgICAg
ICAgfTsKPiAKPiBJZiB5b3UgbG9vayBhdCB0aGUgUkVHIC0tIGl0IGRvZXMgbm93IGFkZCB1cCB0
byAyR2IsIGJ1dCBib290aW5nIFhlbgo+IHdpdGggaXQgaGFzIGV4YWN0bHkgdGhlCj4gc2FtZSBl
ZmZlY3QgYXMgYm9vdGluZyBpdCB3aXRoOiByZWcgPSA8MHgwIDB4MCAweDAgMHg4MDAwMDAwMD47
XAoKSWYgeW91IGJvb3QgWGVuIHVzaW5nIEVGSSwgdGhlIG1lbW9yeSBpbmZvcm1hdGlvbiB3aWwg
Y29tZSBmcm9tIEVGSSBhbmQgCnRoZSBEVCBub2RlIHdpbGwgYmUgaWdub3JlZC4gU28gdW5sZXNz
IFVFRkkgaXMgYWJsZSB0byBwaWNrIHVwIHRoZSAKbW9kaWZpY2F0aW9uIG9mIHRoZSBEVCBtZW1v
cnkgbm9kZSwgbW9kaWZ5aW5nIHRoZSBEVCBpcyBub3QgZ29pbmcgdG8gCmFmZmVjdCBhbnl0aGlu
Zy4KCj4gCj4gSSBhbSBhdHRhY2hpbmcgYSBmdWxsIGxvZywgYW5kIEkgc2VlIHRoZSBmb2xsb3dp
bmcgaW4gdGhlIGxvZ3M6Cj4gCj4gKFhFTikgQWxsb2NhdGluZyAxOjEgbWFwcGluZ3MgdG90YWxs
aW5nIDcyME1CIGZvciBkb20wOgo+IChYRU4pIEJBTktbMF0gMHgwMDAwMDAwODAwMDAwMC0weDAw
MDAwMDFjMDAwMDAwICgzMjBNQikKPiAoWEVOKSBCQU5LWzFdIDB4MDAwMDAwNDAwMDAwMDAtMHgw
MDAwMDA1ODAwMDAwMCAoMzg0TUIpCj4gKFhFTikgQkFOS1syXSAweDAwMDAwMDdiMDAwMDAwLTB4
MDAwMDAwN2MwMDAwMDAgKDE2TUIpCj4gCj4gV2hpY2ggc29ydCBvZiBtYWtlcyBzZW5zZSwgSSBn
dWVzcyAtLSBidXQgSSBzdGlsbCBkb24ndCB1bmRlcnN0YW5kCj4gd2hlcmUgYWxsIHRoZXNlIHJh
bmdlcwo+IGFyZSBjb21pbmcgZnJvbSBhbmQgaG93IGNvbWUgWGVuIGRvZXNuJ3Qgc2VlIHRoZSBm
dWxsIDJHYiBldmVuIHdpdGggdmFyaW91cwo+IGRldmljZXRyZWVzIEkgdHJpZWQuCgpUaGUgcmFu
Z2UgYWJvdmVzIGRlc2NyaWJlIHRoZSBtZW1vcnkgcmFuZ2UgZ2l2ZW4gdG8gRG9tMC4gRm9yIGFs
bCB0aGUgCm1lbW9yeSBnaXZlbiB0byBYZW4sbSB5b3Ugd2FudCB0byBsb29rIGF0IHRoZSB0b3Ag
b2YgeW91ciBsb2c6CgooWEVOKSBDaGVja2luZyBmb3IgaW5pdHJkIGluIC9jaG9zZW4KKFhFTikg
UkFNOiAwMDAwMDAwMDAwMDAwMDAwIC0gMDAwMDAwMDAwNWRmZmZmZgooWEVOKSBSQU06IDAwMDAw
MDAwMDVmMDAwMDAgLSAwMDAwMDAwMDA2ZGZlZmZmCihYRU4pIFJBTTogMDAwMDAwMDAwNmUwMDAw
MCAtIDAwMDAwMDAwMDc0MGVmZmYKKFhFTikgUkFNOiAwMDAwMDAwMDA3NDEwMDAwIC0gMDAwMDAw
MDAxZGI4ZGZmZgooWEVOKSBSQU06IDAwMDAwMDAwMzUwZjAwMDAgLSAwMDAwMDAwMDNkYmQyZmZm
CihYRU4pIFJBTTogMDAwMDAwMDAzZGJkMzAwMCAtIDAwMDAwMDAwM2RmZmZmZmYKKFhFTikgUkFN
OiAwMDAwMDAwMDQwMDAwMDAwIC0gMDAwMDAwMDA1YTY1M2ZmZgooWEVOKSBSQU06IDAwMDAwMDAw
N2FkYTAwMDAgLSAwMDAwMDAwMDdhZGEzZmZmCihYRU4pIFJBTTogMDAwMDAwMDA3YWVhODAwMCAt
IDAwMDAwMDAwN2FmYTlmZmYKKFhFTikgUkFNOiAwMDAwMDAwMDdhZmFhMDAwIC0gMDAwMDAwMDA3
ZWM3M2ZmZgooWEVOKSBSQU06IDAwMDAwMDAwN2VjNzQwMDAgLSAwMDAwMDAwMDdmZGRkZmZmCihY
RU4pIFJBTTogMDAwMDAwMDA3ZmRkZTAwMCAtIDAwMDAwMDAwN2ZlYTVmZmYKKFhFTikgUkFNOiAw
MDAwMDAwMDdmZWE2MDAwIC0gMDAwMDAwMDA3ZmY2ZGZmZgooWEVOKSBSQU06IDAwMDAwMDAwN2Zm
ZmYwMDAgLSAwMDAwMDAwMDdmZmZmZmZmCgpMb29raW5nIGF0IHRoZSBkaWZmZXJlbmNlcyB3aXRo
IHRoZSBMaW51eCBsb2dzLCB0aGVyZSBpcyBpbmRlZWQgc29tZSAKbWVtb3J5IG5vdCBkZXRlY3Rl
ZCBieSBYZW4uCgpPbiBYZW4sIHdlIG9ubHkgY29uc2lkZXIgdXN1YWJsZSBtZW1vcnkgYW55IEVG
SSBkZXNjcmlwdGlvbiB3aXRoIApFZmlDb252ZW50aW9uYWxNZW1vcnksIEVmaUJvb3RTZXJ2aWNl
c0NvZGUgYW5kIEVmaUJvb3RTZXJ2aWNlc0RhdGEuCgpMaW51eCBpbmNsdWRlIG1vcmUgdHlwZSBo
ZXJlLCBzbyB0aGlzIG1heSBleHBsYWluIHdoeSB3ZSBzZWUgYSBkaWZmZXJlbmNlLgoKV2hpbGUg
TG9va2luZyBhdCBpdCwgSSBoYXZlIGFsc28gbm90aWNlZCB0aGF0IHdlIGRvbid0IHNlZW0gdG8g
Y2FyZSAKYWJvdXQgdGhlIG1lbW9yeSBhdHRyaWJ1dGUuIEkgc3VzcGVjdCB0aGlzIGNvdWxkIGJl
IGFub3RoZXIgbGF0ZW50IGlzc3VlIAppbiBYZW4gaWYgdGhlIGF0dHJpYnV0ZSBkb2VzIG5vdCBt
YXRjaC4KCj4gCj4gQW55IGlkZWFzIGhlcmUgd291bGQgYmUgZ3JlYXRseSBhcHByZWNhaXRlZCEK
PiAKPiBUaGFua3MsCj4gUm9tYW4uCj4gCj4gUC5TLiBBbnkgZ3Vlc3MgYXQgd2hhdCB0aGVzZSBt
ZWFuPwo+IAo+IChYRU4pIHRyYXBzLmM6MTk3MzpkMHYwIEhTUj0weDkzODgwMDA2IHBjPTB4MDBm
ZmZmODczNTU1NTgKPiBndmE9MHhmZmZmODcyZjIwMDAgZ3BhPTB4MDAwMDAwMDAwZjAwMDAKPiAo
WEVOKSB0cmFwcy5jOjE5NzM6ZDB2MCBIU1I9MHg5Mzg4MDAwNiBwYz0weDAwZmZmZmI3MzRlNTU4
Cj4gZ3ZhPTB4ZmZmZmI3MmViMDAwIGdwYT0weDAwMDAwMDAwMGYwMDAwCj4gKFhFTikgdHJhcHMu
YzoxOTczOmQwdjAgSFNSPTB4OTM4ODAwMDYgcGM9MHgwMGZmZmY4ZjlkMjU1OAo+IGd2YT0weGZm
ZmY4Zjk2ZjAwMCBncGE9MHgwMDAwMDAwMDBmMDAwMAoKSXQgbWVhbnMgdGhhdCBMaW51eCBoYXMg
dHJpZWQgdG8gYWNjZXNzIHNvbWV0aGluZyB0aGF0IGhhcyBub3QgYmVlbiAKbWFwcGVkIGluIHN0
YWdlLTIuIEFzIERvbTAgaXMgbWFwcGVkIDE6MSwgdGhlIEdQQSBhbHNvIGdpdmUgeW91IHRoZSBo
b3N0IApwaHlzaWNhbCBhZGRyZXNzLiBJbiB0aGlzIGNhc2UsIGl0IGlzIHRyeWluZyB0byBhY2Nl
c3MgMHhmMDAwMC4KClRoaXMgc2VlbXMgdG8gYmVsb25nIHRvIHRoZSBSQU0sIGJ1dCB0aGlzIHBh
cnQgaGFzIG5vdCBiZWVuIGFsbG9jYXRlZCB0byAKRG9tMC4KCllvdSBtYXkgZ2V0IG1vcmUgaW5m
b3JtYXRpb24gZnJvbSBEb20wIGlmIHlvdSBhZGQgZWFybHljb249eGVuYm9vdCBvbiAKeW91ciBs
aW51eCBjb21tYW5kIGxpbmUuIFRoaXMgd2lsbCBnaXZlIHlvdSBzb21lIG91dHB1dCB1c2luZyB0
aGUgCmVhcmx5Y29uc29sZSBiZWZvcmUgdGhlIGNvbnNvbGUgc3Vic3l0ZW0gaXMgYWN0dWFsbHkg
aW5pdGlhbGl6ZS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
