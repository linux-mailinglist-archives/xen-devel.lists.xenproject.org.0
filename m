Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C165385F5F
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 12:17:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvfRh-00008h-Mh; Thu, 08 Aug 2019 10:14:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=u8RY=WE=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hvfRg-00008c-KK
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 10:14:56 +0000
X-Inumbo-ID: 5db6e999-b9c5-11e9-8980-bc764e045a96
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5db6e999-b9c5-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 10:14:55 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id m23so88261613lje.12
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2019 03:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=RpEe1aE5myPn0PfJprho9YViWtkR8aW/IF5eKfgs1HY=;
 b=o4BjwLn5ByNGePoT3YCLth/Puj0eYKHWeYerxAMYZHpCtB0zsukePKB2t82ia9WZwN
 gOMYBFG+chaRtnDJetEdtOebbrxHleUKhC41FBLVDEZSDRl7ZYTopS/CnozP1N+c1+Be
 nsuMSMmF7nNzcO0PwFWVbg/gfi4hMG5ocpvQ9Uk8Nb2XYlLyuk2eUC2MHOSURtwFMiBf
 ZWFWbILCL9QmLoo6SR+g3f7dXA4hK3jVcFmpUfY0Vh+IXAvba4bAX9CC3zxEqeGYAq7I
 wCr9mGyXdxqTM/DzsisBf2JliIYVyNyavKHRCLxMHCRNCKpGD/O+PcMwf3AcZDAOBOJE
 aKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=RpEe1aE5myPn0PfJprho9YViWtkR8aW/IF5eKfgs1HY=;
 b=YikNjDwn3pXwV8k9slqBh9vaZ4L/IAvBeTdEka0qpOAn3/WFmefXQVnGK9qekqQ/I3
 vfgmtKHPOleK2+eiwDiTYLhtxM6uNZtauojCOlDGUNuqMAEwQq1j3bzoDuCuwZ5W0UB4
 kQztV32hPt20bf6TjFUKCrgvaSJQ+wdNBV9dvdTHQh3l7+Whsbqf5aO9g2jFVrM8wba5
 emiW8Tp5aE7u51Q3072Ns7/RBwid/WTtqhoNol2+zhkYmkLcjbblSXiX9iXME5y0PPi3
 ifIzS4q9+1RimUNIKq9ZzeJZuoJcJAGdpCnoyvp83rrLETEptA0GVmeg/XMLz2SF8rl7
 wKBw==
X-Gm-Message-State: APjAAAV51rWpJ5y17Z0nUt/dLYziKD1pNoLJVNpFrIeUiCwCgZ87MBDw
 013gwCt4An0nvoJBRjLwbdQ=
X-Google-Smtp-Source: APXvYqy9jTO032zHOmjYzUtFNPiu2/eAXnaQ+Z0/tD+sn4UglzOB/gqT18zObAPUQBCb3vOJw3IfVA==
X-Received: by 2002:a2e:89c8:: with SMTP id c8mr7943803ljk.70.1565259293662;
 Thu, 08 Aug 2019 03:14:53 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id l22sm18735499ljc.4.2019.08.08.03.14.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Aug 2019 03:14:53 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>
References: <1564763985-20312-1-git-send-email-olekstysh@gmail.com>
 <1564763985-20312-7-git-send-email-olekstysh@gmail.com>
 <OSBPR01MB453664F7A6D6AA717761BC07D8D40@OSBPR01MB4536.jpnprd01.prod.outlook.com>
 <a49eccf6-935c-c87a-1fcc-fdc12a67d58e@gmail.com>
 <42cc28a7-5ab3-e24f-16d3-7a287f7f14e8@arm.com>
 <CAPD2p-kJe6=YZ_rPrdDpay-u+r3GDPp58LpxqLpBg0oN_3W1-g@mail.gmail.com>
 <7cecce50-31e9-0e3f-d41c-a051ea6f9971@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <11de4dee-2d2f-2578-57ae-4313c985e645@gmail.com>
Date: Thu, 8 Aug 2019 13:14:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7cecce50-31e9-0e3f-d41c-a051ea6f9971@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V2 6/6] iommu/arm: Add Renesas IPMMU-VMSA
 support
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Lars Kurth <lars.kurth@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IEhpLAoKSGksIEp1bGllbi4KCgo+Cj4+IFNvcnJ5IGZvciB0aGUgcG9zc2libGUgZm9ybWF0
IGlzc3Vlcy4KPj4KPj4KPj4gwqDCoMKgwqAgPiBObywgaXQgaXMgbm90IGRpc2FibGVkLiBCdXQs
IGlwbW11X2lycSgpIHVzZXMgYW5vdGhlciAKPj4gbW11LT5sb2NrLiBTbywgSQo+PiDCoMKgwqDC
oCA+IHRoaW5rLCB0aGVyZSB3b24ndCBiZSBhIGRlYWRsb2NrLgo+PiDCoMKgwqDCoCA+Cj4+IMKg
wqDCoMKgID4gT3IgSSByZWFsbHkgbWlzc2VkIHNvbWV0aGluZz8KPj4gwqDCoMKgwqAgPgo+PiDC
oMKgwqDCoCA+IElmIHdlIHdvcnJ5IGFib3V0IGlwbW11X3RsYl9pbnZhbGlkYXRlKCkgd2hpY2gg
aXMgY2FsbGVkIGhlcmUgKHRvCj4+IMKgwqDCoMKgID4gcGVyZm9ybSBhIGZsdXNoIGJ5IHJlcXVl
c3QgZnJvbSBQMk0gY29kZSwgd2hpY2ggbWFuYWdlcyBhIHBhZ2UgCj4+IHRhYmxlKQo+PiDCoMKg
wqDCoCA+IGFuZCBmcm9tIHRoZSBpcnEgaGFuZGxlciAodG8gcGVyZm9ybSBhIGZsdXNoIHRvIHJl
c3VtZSBhZGRyZXNzCj4+IMKgwqDCoMKgID4gdHJhbnNsYXRpb24pLCBJIGNvdWxkIHVzZSBhIHRh
c2tsZXQgdG8gc2NoZWR1bGUgCj4+IGlwbW11X3RsYl9pbnZhbGlkYXRlKCkKPj4gwqDCoMKgwqAg
PiBmcm9tIHRoZSBpcnEgaGFuZGxlciB0aGVuLiBUaGlzIHdheSB3ZSB3b3VsZCBnZXQgdGhpcyAK
Pj4gc2VyaWFsaXplZC4gV2hhdAo+PiDCoMKgwqDCoCA+IGRvIHlvdSB0aGluaz8KPj4KPj4gwqDC
oMKgIEkgYW0gYWZyYWlkIGEgdGFza2xldCBpcyBub3QgYW4gb3B0aW9uLiBZb3UgbmVlZCB0byBw
ZXJmb3JtIHRoZSBUTEIKPj4gwqDCoMKgIGZsdXNoIHdoZW4gcmVxdWVzdGVkIG90aGVyd2lzZSB5
b3UgYXJlIGludHJvZHVjaW5nIGEgc2VjdXJpdHkgaXNzdWUuCj4+Cj4+IMKgwqDCoCBUaGlzIGlz
IGJlY2F1c2UgYXMgc29vbiBhcyBhIHJlZ2lvbiBpcyB1bm1hcHBlZCBpbiB0aGUgcGFnZSAKPj4g
dGFibGUsIHdlCj4+IMKgwqDCoCByZW1vdmUgdGhlIGRyb3AgdGhlIHJlZmVyZW5jZSBvbiBhbnkg
cGFnZSBiYWNraW5nIHRoYXQgcmVnaW9uLiAKPj4gV2hlbiB0aGUKPj4gwqDCoMKgIHJlZmVyZW5j
ZSBpcyBkcm9wcGVkIHRvIHplcm8sIHRoZSBwYWdlIGNhbiBiZSByZWFsbG9jYXRlZCB0byBhbm90
aGVyCj4+IMKgwqDCoCBkb21haW4gb3IgZXZlbiBYZW4uIElmIHRoZSBUTEIgZmx1c2ggaGFwcGVu
IGFmdGVyLCB0aGVuIHRoZSBndWVzdCAKPj4gbWF5Cj4+IMKgwqDCoCBzdGlsbCBiZSBhYmxlIHRv
IGFjY2VzcyB0aGUgcGFnZSBmb3IgYSBzaG9ydCB0aW1lIGlmIHRoZSAKPj4gdHJhbnNsYXRpb24g
aGFzCj4+IMKgwqDCoCBiZWVuIGNhY2hlZCBieSB0aGUgYW55IFRMQiAoSU9NTVUsIFByb2Nlc3Nv
cikuCj4+Cj4+Cj4+Cj4+IEkgdW5kZXJzdGFuZCB0aGlzLiBJwqBhbSBub3QgcHJvcG9zaW5nIHRv
IGRlbGF5IGEgcmVxdWVzdGVkIGJ5IFAyTSAKPj4gY29kZSBUTEIgZmx1c2ggaW4gYW55IGNhc2Uu
IEkganVzdCBwcm9wb3NlIHRvIGlzc3VlIFRMQiBmbHVzaCAod2hpY2ggCj4+IHdlIGhhdmUgdG8g
cGVyZm9ybSBpbiBjYXNlIG9mIHBhZ2UgZmF1bHRzLCB0byByZXNvbHZlIGVycm9yIGNvbmRpdGlv
biAKPj4gYW5kIHJlc3VtZSB0cmFuc2xhdGlvbnMpIGZyb20gYSB0YXNrbGV0IHJhdGhlciB0aGFu
IGZyb20gaW50ZXJydXB0IAo+PiBoYW5kbGVyIGRpcmVjdGx5LiBUaGlzIGlzIHRoZSBUTEIgZmx1
c2ggSSBhbSBzcGVha2luZyBhYm91dDoKPj4KPj4gaHR0cHM6Ly9naXRodWIuY29tL290eXNoY2hl
bmtvMS94ZW4vYmxvYi9pcG1tdV91cHN0cmVhbTIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJt
L2lwbW11LXZtc2EuYyNMNTk4IAo+Pgo+Pgo+PiBTb3JyeSBpZiBJIHdhcyB1bmNsZWFyLgo+Cj4g
TXkgbWlzdGFrZSwgSSBtaXNyZWFkIHdoYXQgeW91IHdyb3RlLgo+Cj4gSSBmb3VuZCB0aGUgZmx1
c2ggaW4gdGhlIHJlbmVzYXMtYnNwIGFuZCBub3QgTGludXggdXBzdHJlYW0gYnV0IGl0IGlzIAo+
IG5vdCBjbGVhciB3aHkgdGhpcyBpcyBhY3R1YWxseSByZXF1aXJlZC4gWW91IGFyZSBub3QgZml4
aW5nIGFueSAKPiB0cmFuc2xhdGlvbiBlcnJvci4gU28gd2hhdCB0aGlzIGZsdXNoIHdpbGwgZG8/
Cj4KPiBSZWdhcmRpbmcgdGhlIHBsYWNlbWVudCBvZiB0aGUgZmx1c2gsIHRoZW4gaWYgeW91IGV4
ZWN1dGUgaW4gYSB0YXNrbGV0IAo+IGl0IHdpbGwgbGlrZWx5IGJlIGRvbmUgbGF0ZXIgb24gd2hl
biB0aGUgSVJRIGhhcyBiZWVuIGFja25vd2xlZGdlLiAKPiBXaGF0J3MgdGhlIGltcGxpY2F0aW9u
IHRvIGRlbGF5IGl0PwoKCkxvb2tzIGxpa2UsIHRoZXJlIGlzIG5vIG5lZWQgdG8gcHV0IHRoaXMg
Zmx1c2ggaW50byBhIHRhc2tsZXQuIEFzIEkgCnVuZGVyc3RhbmQgZnJvbSBTaGltb2RhLXNhbidz
IGFuc3dlciBpdCBpcyBPSyB0byBjYWxsIGZsdXNoIGhlcmUuCgpTbywgbXkgd29ycnkgYWJvdXQg
Y2FsbGluZyBpcG1tdV90bGJfaW52YWxpZGF0ZSgpIGRpcmVjdGx5IGZyb20gdGhlIAppbnRlcnJ1
cHQgaGFuZGxlciBpcyBub3QgYWN0dWFsIGFueW1vcmUuCi0tLS0tLS0tLS0KVGhpcyBpcyBteSB1
bmRlcnN0YW5kaW5nIHJlZ2FyZGluZyB0aGUgZmx1c2ggcHVycG9zZSBoZXJlLiBUaGlzIGNvZGUs
IApqdXN0IGZvbGxvd3MgdGhlIFRSTSwgbm8gbW9yZSBubyBsZXNzLAp3aGljaCBtZW50aW9ucyBh
Ym91dCBhIG5lZWQgdG8gZmx1c2ggVExCIGFmdGVyIGNsZWFyaW5nIGVycm9yIHN0YXR1cyAKcmVn
aXN0ZXIgYW5kIHVwZGF0aW5nIGEgcGFnZSB0YWJsZSBlbnRyaWVzICh3aGljaCwgSSBhc3N1bWUs
IG1lYW5zIHRvIApyZXNvbHZlIGEgcmVhc29uIHdoeSB0cmFuc2xhdGlvbi9wYWdlIGZhdWx0IGVy
cm9yIGFjdHVhbGx5IGhhdmUgCmhhcHBlbmVkKSB0byByZXN1bWUgYWRkcmVzcyB0cmFuc2xhdGlv
biByZXF1ZXN0LgoKQnV0LCB3aXRoIG9uZSByZW1hcmssIGFzIHlvdSBoYXZlIGFscmVhZHkgbm90
ZWQsIHdlIGFyZSBub3QgdHJ5aW5nIHRvIApoYW5kbGUvZml4IHRoaXMgZmF1bHQgKHVwZGF0ZSBw
YWdlIHRhYmxlIGVudHJpZXMpLCBkcml2ZXIgZG9lc24ndCBtYW5hZ2UgCnBhZ2UgdGFibGUgYW5k
IGlzIG5vdCBhd2FyZSB3aGF0IHRoZSBwYWdlIHRhYmxlIGlzLiBXaGF0IGlzIG1vcmUsIGl0IGlz
IAp1bmNsZWFyIHdoYXQgYWN0dWFsbHkgbmVlZCB0byBiZSBmaXhlZCBpbiB0aGUgcGFnZSB0YWJs
ZSB3aGljaCBpcyBhIENQVSAKcGFnZSB0YWJsZSBhcyB0aGUgc2FtZSB0aW1lLgoKSSBoYXZlIGhl
YXJkIHRoZXJlIGlzIGEgYnJlYWstYmVmb3JlLW1ha2Ugc2VxdWVuY2Ugd2hlbiB1cGRhdGluZyB0
aGUgCnBhZ2UgdGFibGUuIFNvLCBpZiBkZXZpY2UgaW4gYSBkb21haW4gaXMgaXNzdWluZyBETUEg
c29tZXdoZXJlIGluIHRoZSAKbWlkZGxlIG9mIHVwZGF0aW5nIGEgcGFnZSB0YWJsZSwgdGhlb3Jl
dGljYWxseSwgd2UgbWlnaHQgaGl0IGludG8gdGhpcyAKZmF1bHQuIEluIHRoaXMgY2FzZSB0aGUg
cGFnZSB0YWJsZSBpcyBjb3JyZWN0IGFuZCB3ZSBkb24ndCBuZWVkIHRvIGZpeCAKYW55dGhpbmcu
Li4gwqAgQmVpbmcgaG9uZXN0LCBJIGhhdmUgbmV2ZXIgc2VlbiBhIGZhdWx0IGNhdXNlZCBieSAK
YnJlYWstYmVmb3JlLW1ha2Ugc2VxdWVuY2UuCgo+Cj4gQ2hlZXJzLAo+Ci0tIApSZWdhcmRzLAoK
T2xla3NhbmRyIFR5c2hjaGVua28KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
