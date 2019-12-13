Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D2F11E8B0
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 17:50:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifo6R-0003ua-Lm; Fri, 13 Dec 2019 16:47:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=WS5b=2D=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1ifo6Q-0003uV-NT
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 16:47:42 +0000
X-Inumbo-ID: 42cd2fa8-1dc8-11ea-a914-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 42cd2fa8-1dc8-11ea-a914-bc764e2007e4;
 Fri, 13 Dec 2019 16:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576255653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u59+uMKkDaHRCWZubKtqahmfKg0NMvg9oSlaElre/Ac=;
 b=jUb/t7EZAd8nELoDJqr5QFvqwcEHrHYevw1L5tKjNoekGClUD4HAb3GrLPTNOi+Frhr6RY
 wC3yvLG2ZZfTzGbL4ALapEj0kVBpGo76F/vJEj1UYJ2R045/FBFvg6ZmHat7Vuvr948xHJ
 KTQE3kZbuSL05iuk/yFkanWXrzViSo8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-0G5BabHsMMmbigMSm1MbCg-1; Fri, 13 Dec 2019 11:47:32 -0500
Received: by mail-wm1-f71.google.com with SMTP id f11so49543wmh.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Dec 2019 08:47:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xx4QpyhPJ7ddFApM5tN1aOYUoAAOoJoWqAv5YuUSmrQ=;
 b=TLUjsEvlGB3C4WUfnquIeioA/AeAFOWmbQ1Or6EG/VWbB9InRKeZfAYxvE+Dry8O4v
 /yhEVYaLqrbnZbM17vaP0KOXGEhx8t8FAJG72Vk0/ypkejltgnRY991AtwZSOmnN7GMr
 3o4QChxrcIqbAp4rAYCcr+3bsxOI3Q02Q7nl0oXoZmpd7Bmj4BjgkvaA2c51jQh/tiuh
 sc/SM2YjKVUpeDmHga6IHT2rnvKQa2/uEcpuyEy/VMq+VJWz+594Z+U5NcRRjcNJz19D
 tg4+dX37EPNfip4S2qKAEk3UtTSrBD6CyMhkfTa7QJpwmXfs7IOzWnQ6ktyFgrNHSTDe
 ayCg==
X-Gm-Message-State: APjAAAW6o3RJaC4uG01PsVXzJSymiAivObLdM4XnYjVDGvbP13swpgfy
 ydh/xoJL+gwm6sLrXUN60wUeL++QP+8zxEMJ/R98NmC4dJsnOKo1VNXEV1gP/1Ymjz9zZXT38fQ
 4z9udVSrwsLSnINDtSAJkyWfJdbw=
X-Received: by 2002:a05:600c:224d:: with SMTP id
 a13mr14931573wmm.57.1576255651298; 
 Fri, 13 Dec 2019 08:47:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqzyANQJHgFGh+Kl0t/Tp4kzuWcPKmbHesl5SsB4LGdPrxk9Inysuhlbrs/E4yJYrUC92LmqzA==
X-Received: by 2002:a05:600c:224d:: with SMTP id
 a13mr14931547wmm.57.1576255651048; 
 Fri, 13 Dec 2019 08:47:31 -0800 (PST)
Received: from [192.168.1.35] (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id p17sm10589868wrx.20.2019.12.13.08.47.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Dec 2019 08:47:30 -0800 (PST)
To: qemu-devel@nongnu.org
References: <20191213161753.8051-1-philmd@redhat.com>
 <20191213161753.8051-13-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d9792ff4-bada-fbb9-301d-aeb19826235c@redhat.com>
Date: Fri, 13 Dec 2019 17:47:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191213161753.8051-13-philmd@redhat.com>
Content-Language: en-US
X-MC-Unique: 0G5BabHsMMmbigMSm1MbCg-1
X-Mimecast-Spam-Score: 0
Subject: Re: [Xen-devel] [PATCH 12/12] hw/i386/pc: Move PC-machine specific
 declarations to 'pc_internal.h'
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Sergio Lopez <slp@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMTMvMTkgNToxNyBQTSwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6Cj4gSGlz
dG9yaWNhbGx5LCBRRU1VIHN0YXJ0ZWQgd2l0aCBvbmx5IG9uZSBYODYgbWFjaGluZTogdGhlIFBD
Lgo+IFRoZSAnaHcvaTM4Ni9wYy5oJyBoZWFkZXIgd2FzIHVzZWQgdG8gc3RvcmUgYWxsIFg4NiBh
bmQgUEMKPiBkZWNsYXJhdGlvbnMuIFNpbmNlIHdlIGhhdmUgbm93IG11bHRpcGxlIG1hY2hpbmVz
IGJhc2VkIG9uIHRoZQo+IFg4NiBhcmNoaXRlY3R1cmUsIG1vdmUgdGhlIFBDLXNwZWNpZmljIGRl
Y2xhcmF0aW9ucyBpbiBhIG5ldwo+IGhlYWRlci4KPiBXZSB1c2UgJ2ludGVybmFsJyBpbiB0aGUg
bmFtZSB0byBleHBsaWNpdCB0aGlzIGhlYWRlciBpcyByZXN0cmljdGVkCj4gdG8gdGhlIFg4NiBh
cmNoaXRlY3R1cmUuIE90aGVyIGFyY2hpdGVjdHVyZSBjYW4gbm90IGFjY2VzcyBpdC4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+
Cj4gLS0tCj4gTWF5YmUgbmFtZSBpdCAncGNfbWFjaGluZS5oJz8KCkkgZm9yZ290IHRvIGRlc2Ny
aWJlIGhlcmUgKGFuZCBpbiB0aGUgY292ZXIpLCB3aGF0J3MgZm9sbG93IGFmdGVyIHRoaXMgCnBh
dGNoLgoKUGF0Y2ggIzEzIG1vdmVzIFBDTWFjaGluZUNsYXNzIHRvCgpJZiB5b3UgaWdub3JlIFBD
TWFjaGluZVN0YXRlLCAiaHcvaTM4Ni9wYy5oIiBub3cgb25seSBjb250YWlucyA3NiBsaW5lcywg
CmFuZCBpdCBpcyBlYXNpZXIgdG8gc2VlIHdoYXQgaXMgUEMgbWFjaGluZSBzcGVjaWZpYywgd2hh
dCBpcyBYODYgCnNwZWNpZmljLCBhbmQgd2hhdCBpcyBkZXZpY2UgZ2VuZXJpYyAobm90IFg4NiBy
ZWxhdGVkIGF0IGFsbCk6CgotIEdTSSBpcyBjb21tb24gdG8gWDg2IChQYW9sbyBzZW50IFszXSwg
WzZdKQotIElPQVBJQyBpcyBjb21tb24gdG8gWDg2Ci0gaTgyNTkgaXMgbXVsdGlhcmNoIChQYW9s
byBbMl0pCi0gUENJX0hPU1QgZGVmaW5pdGlvbnMgYW5kIHBjX3BjaV9ob2xlNjRfc3RhcnQoKSBh
cmUgWDg2Ci0gcGNfbWFjaGluZV9pc19zbW1fZW5hYmxlZCgpIGlzIFg4NiAoUGFvbG8gc2VudCBb
NV0pCi0gaHBldAotIHRzYyAoUGFvbG8gc2VudCBbM10pCi0gMyBtb3JlIGZ1bmN0aW9ucwoKU28g
d2UgY2FuIG1vdmUgaGFsZiBvZiB0aGlzIGZpbGUgdG8gInBjX2ludGVybmFsLmgiIGFuZCB0aGUg
b3RoZXIgdG8KCk9uZSBwcm9ibGVtIGlzIHRoZSBRMzUgTUNIIG5vcnRoIGJyaWRnZSB3aGljaCBk
aXJlY3RseSBzZXRzIHRoZSBQQ0kgClBDTWFjaGluZVN0YXRlLT5idXMgaW4gcTM1X2hvc3RfcmVh
bGl6ZSgpLiBUaGlzIHNlZW1zIGEgUU9NIHZpb2xhdGlvbiAKYW5kIGlzIHByb2JhYmx5IGVhc2ls
eSBmaXhhYmxlLgoKTWF5YmUgSSBjYW4gYXBwbHkgUGFvbG8ncyBwYXRjaGVzIGluc3RlYWQgb2Yg
dGhpcyAjMTIsIG1vdmUgWDg2LWdlbmVyaWMgCmRlY2xhcmF0aW9ucyB0byAiaHcvaTM4Ni94ODYu
aCIsIGFuZCBkaXJlY3RseSBnaXQtbW92ZSB3aGF0J3MgbGVmdCBvZiAKImh3L2kzODYvcGMuaCIg
dG8gInBjX2ludGVybmFsLmgiLgoKWzNdIGh0dHBzOi8vd3d3Lm1haWwtYXJjaGl2ZS5jb20vcWVt
dS1kZXZlbEBub25nbnUub3JnL21zZzY2NDYyNy5odG1sClsyXSBodHRwczovL3d3dy5tYWlsLWFy
Y2hpdmUuY29tL3FlbXUtZGV2ZWxAbm9uZ251Lm9yZy9tc2c2NjQ3NjUuaHRtbApbNV0gaHR0cHM6
Ly93d3cubWFpbC1hcmNoaXZlLmNvbS9xZW11LWRldmVsQG5vbmdudS5vcmcvbXNnNjY0NzU0Lmh0
bWwKWzZdIGh0dHBzOi8vd3d3Lm1haWwtYXJjaGl2ZS5jb20vcWVtdS1kZXZlbEBub25nbnUub3Jn
L21zZzY2NDc2Ni5odG1sCgo+IC0tLQo+ICAgaHcvaTM4Ni9wY19pbnRlcm5hbC5oIHwgMTQ0ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAgaW5jbHVkZS9ody9p
Mzg2L3BjLmggIHwgMTI4IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAg
IGh3L2kzODYvYWNwaS1idWlsZC5jICB8ICAgMSArCj4gICBody9pMzg2L3BjLmMgICAgICAgICAg
fCAgIDEgKwo+ICAgaHcvaTM4Ni9wY19waWl4LmMgICAgIHwgICAxICsKPiAgIGh3L2kzODYvcGNf
cTM1LmMgICAgICB8ICAgMSArCj4gICBody9pMzg2L3BjX3N5c2Z3LmMgICAgfCAgIDEgKwo+ICAg
aHcvaTM4Ni94ZW4veGVuLWh2bS5jIHwgICAxICsKPiAgIDggZmlsZXMgY2hhbmdlZCwgMTUwIGlu
c2VydGlvbnMoKyksIDEyOCBkZWxldGlvbnMoLSkKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBody9p
Mzg2L3BjX2ludGVybmFsLmgKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
