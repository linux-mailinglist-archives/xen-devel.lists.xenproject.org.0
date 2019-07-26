Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB49766F9
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 15:10:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqzvs-0003p1-8Q; Fri, 26 Jul 2019 13:06:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gQyu=VX=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hqzvq-0003ow-GL
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 13:06:46 +0000
X-Inumbo-ID: 37b02bc6-afa6-11e9-8980-bc764e045a96
Received: from mail-lj1-x230.google.com (unknown [2a00:1450:4864:20::230])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 37b02bc6-afa6-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 13:06:45 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id v18so51376592ljh.6
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2019 06:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/jsIBtsBNtqK957IC2RIhpPZ4aiKXQwihw8eVVlQOwE=;
 b=DZ6WgmJRIwc0xTVv6ZEqb2nrZ6+hYSuQg2iS3NilLVgfIIJjObOckjy4wCFdjY90/B
 +R1jbE67fI2QM/IGMTHnzN3RvTZPhoQ55W1cCS2ZV2s2Rme9S4xl4uVTvf1AZUAMz4Ok
 I3LTRVTmFGKKmUFbBtGdd1M9/CsYWi1ZvQD4Dr16AgBAcNnG9zTkM8F5uR/h+QwhaQwz
 sTweT5Eq7c5ePUzcLDNJbz6SW3BzCYw6X5/OC+gNBkPFC5NXQ7mKkrDlv/LFZOeJAtdw
 GuNMBc2YjeyRFseY2vYppqGQZldF7SajjoOP+2k/K/uBJU4D6V6HsNKMLctdOKGxN77u
 YOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/jsIBtsBNtqK957IC2RIhpPZ4aiKXQwihw8eVVlQOwE=;
 b=C3ICicfTZJTd66x3zwvdOgpKcaA/II1v5QqbI5NK4zxhhttA27ckl2Tl6YQKf148bm
 PANJZ2E2hZbI6OKaG0ZNEirWB6eZxWHwZ0oJedSvmU676AKw73V1Ek6FDdb89NWLpsa1
 tq66Jt9Lzxg1AvznPafTpbrIK8teDJ8l8V0AKpys4og7OSj62boh6M9PlPmrwqnrQ0sL
 EWBepP0JyUmnqLHPNdikn8D1ZuuqUFRnfZ/Fn0ja4BhfrerO9MQbMQQF1Jb5bKjVzsa8
 raa+kdI2HVvlde0DbyThT4nGs3PS2NL/X1khq1Lw0ctM5cxbjDa6FHyx440tuP9JvGwj
 HjSw==
X-Gm-Message-State: APjAAAXk5r82X/CXsqyscAz0MD9Vt84eilbQocBplsHIacEq/xOVNj6p
 z6qV3pCQq2n3wuLUcqJw+Gw=
X-Google-Smtp-Source: APXvYqzN/NvU7LVfue2zuY3PMqWiPhs5IY7bQmwqb8xev/zoiRKmsO3bRjMALDIKxtGmtOBOvu87qg==
X-Received: by 2002:a2e:970d:: with SMTP id r13mr49539157lji.126.1564146403747; 
 Fri, 26 Jul 2019 06:06:43 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 b68sm11422229ljb.0.2019.07.26.06.06.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 06:06:40 -0700 (PDT)
To: Dario Faggioli <dfaggioli@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
 <1564137460-25629-4-git-send-email-andrii.anisov@gmail.com>
 <3dbd34f4b4f6286c627b40ed464e565c02111fda.camel@suse.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <0fd1f291-59d0-4085-6393-ef7809b1c3f0@gmail.com>
Date: Fri, 26 Jul 2019 16:06:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3dbd34f4b4f6286c627b40ed464e565c02111fda.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC 3/6] sysctl: extend XEN_SYSCTL_getcpuinfo
 interface
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyNi4wNy4xOSAxNToxNSwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gWWVwLCBJIHRoaW5r
IGJlaW5nIGFibGUgdG8ga25vdyB0aW1lIHNwZW50IHJ1bm5pbmcgZ3Vlc3RzIGNvdWxkIGJlCj4g
dXNlZnVsLgoKV2VsbCwgbXkgaW50ZW50aW9uIHdhcyB0byBzZWUgaHlwZXJ2aXNvciBydW4gYW5k
IHRydWUgaWRsZSB0aW1lLgoKV2l0aCB0aGlzIGZ1bGwgc2VyaWVzIEkgc2VlIHRoZSBkaXN0aW5j
dCBkaWZmZXJlbmNlIGluIHhlbnRvcCBkZXBlbmRpbmcgb24gdGhlIHR5cGUgb2YgbG9hZCBpbiBk
b21haW5zOgoKT24gbXkgcmVndWxhciBzeXN0ZW0gKEhXIGxlc3MgRG9tMCwgTGludXggd2l0aCBV
SSBha2EgRG9tRCwgQW5kcm9pZCB3aXRoIFBWIGRyaXZlcnMgYWthIERvbUEpLCBJIHNlZSBmb2xs
b3dpbmc6CgpJZGxlIHN5c3RlbToKCnhlbnRvcCAtIDEwOjEwOjQyICAgWGVuIDQuMTMtdW5zdGFi
bGUKMyBkb21haW5zOiAxIHJ1bm5pbmcsIDIgYmxvY2tlZCwgMCBwYXVzZWQsIDAgY3Jhc2hlZCwg
MCBkeWluZywgMCBzaHV0ZG93bgolQ1BVKHMpOiAgICA3LjAgZ3UsICAgIDIuNiBoeSwgIDM5MC40
IGlkCk1lbTogODI1NzUzNmsgdG90YWwsIDgyNTc1MzZrIHVzZWQsIDk5MDIwayBmcmVlICAgIENQ
VXM6IDQgQCA4TUh6CiAgICAgICBOQU1FICBTVEFURSAgIENQVShzZWMpIENQVSglKSAgICAgTUVN
KGspIE1FTSglKSAgTUFYTUVNKGspIE1BWE1FTSglKSBWQ1BVUyBORVRTIE5FVFRYKGspIE5FVFJY
KGspIFZCRFMgICBWQkRfT08gICBWQkRfUkQgICBWQkRfV1IgIFZCRF9SU0VDVCAgVkJEX1dTRUNU
IFNTSUQKICAgICAgIERvbUEgLS1iLS0tICAgICAgICAgNzYgICAgMy4zICAgIDYyNTg0NTYgICA3
NS44ICAgIDYyNTk3MTIgICAgICA3NS44ICAgICA0ICAgIDAgICAgICAgIDAgICAgICAgIDAgICAg
MCAgICAgICAgMCAgICAgICAgMCAgICAgICAgMCAgICAgICAgICAwICAgICAgICAgIDAgICAgMAog
ICBEb21haW4tMCAtLS0tLXIgICAgICAgICAxNCAgICAxLjAgICAgIDI2MjE0NCAgICAzLjIgICBu
byBsaW1pdCAgICAgICBuL2EgICAgIDQgICAgMCAgICAgICAgMCAgICAgICAgMCAgICAwICAgICAg
ICAwICAgICAgICAwICAgICAgICAwICAgICAgICAgIDAgICAgICAgICAgMCAgICAwCiAgICAgICBE
b21EIC0tYi0tLSAgICAgICAgMTExICAgIDIuOCAgICAxMTgxOTcyICAgMTQuMyAgICAxMjQ2MjA4
ICAgICAgMTUuMSAgICAgNCAgICAwICAgICAgICAwICAgICAgICAwICAgIDAgICAgICAgIDAgICAg
ICAgIDAgICAgICAgIDAgICAgICAgICAgMCAgICAgICAgICAwICAgIDAKCgpTeXN0ZW0gd2l0aCBD
UFUgYnVybmVycyBpbiBhbGwgZG9tYWluczoKCnhlbnRvcCAtIDEwOjEyOjE5ICAgWGVuIDQuMTMt
dW5zdGFibGUKMyBkb21haW5zOiAzIHJ1bm5pbmcsIDAgYmxvY2tlZCwgMCBwYXVzZWQsIDAgY3Jh
c2hlZCwgMCBkeWluZywgMCBzaHV0ZG93bgolQ1BVKHMpOiAgMzg5LjEgZ3UsICAgMTAuOSBoeSwg
ICAgMC4wIGlkCk1lbTogODI1NzUzNmsgdG90YWwsIDgyNTc1MzZrIHVzZWQsIDk5MDIwayBmcmVl
ICAgIENQVXM6IDQgQCA4TUh6CiAgICAgICBOQU1FICBTVEFURSAgIENQVShzZWMpIENQVSglKSAg
ICAgTUVNKGspIE1FTSglKSAgTUFYTUVNKGspIE1BWE1FTSglKSBWQ1BVUyBORVRTIE5FVFRYKGsp
IE5FVFJYKGspIFZCRFMgICBWQkRfT08gICBWQkRfUkQgICBWQkRfV1IgIFZCRF9SU0VDVCAgVkJE
X1dTRUNUIFNTSUQKICAgICAgIERvbUEgLS0tLS1yICAgICAgICAxMTUgIDEyOS43ICAgIDYyNTg0
NTYgICA3NS44ICAgIDYyNTk3MTIgICAgICA3NS44ICAgICA0ICAgIDAgICAgICAgIDAgICAgICAg
IDAgICAgMCAgICAgICAgMCAgICAgICAgMCAgICAgICAgMCAgICAgICAgICAwICAgICAgICAgIDAg
ICAgMAogICBEb21haW4tMCAtLS0tLXIgICAgICAgIDEyMCAgMTI5LjggICAgIDI2MjE0NCAgICAz
LjIgICBubyBsaW1pdCAgICAgICBuL2EgICAgIDQgICAgMCAgICAgICAgMCAgICAgICAgMCAgICAw
ICAgICAgICAwICAgICAgICAwICAgICAgICAwICAgICAgICAgIDAgICAgICAgICAgMCAgICAwCiAg
ICAgICBEb21EIC0tLS0tciAgICAgICAgMTYzICAxMjkuNiAgICAxMTgxOTcyICAgMTQuMyAgICAx
MjQ2MjA4ICAgICAgMTUuMSAgICAgNCAgICAwICAgICAgICAwICAgICAgICAwICAgIDAgICAgICAg
IDAgICAgICAgIDAgICAgICAgIDAgICAgICAgICAgMCAgICAgICAgICAwICAgIDAKCgpTeXN0ZW0g
d2l0aCBHUFUgbG9hZCBydW4gYm90aCBpbiBEb21EIGFuZCBEb21BOgoKeGVudG9wIC0gMTA6MTQ6
MjYgICBYZW4gNC4xMy11bnN0YWJsZQozIGRvbWFpbnM6IDIgcnVubmluZywgMSBibG9ja2VkLCAw
IHBhdXNlZCwgMCBjcmFzaGVkLCAwIGR5aW5nLCAwIHNodXRkb3duCiVDUFUocyk6ICAxNjUuNyBn
dSwgICA1MS40IGh5LCAgMTgyLjkgaWQKTWVtOiA4MjU3NTM2ayB0b3RhbCwgODI1NzUzNmsgdXNl
ZCwgOTkwMjBrIGZyZWUgICAgQ1BVczogNCBAIDhNSHoKICAgICAgIE5BTUUgIFNUQVRFICAgQ1BV
KHNlYykgQ1BVKCUpICAgICBNRU0oaykgTUVNKCUpICBNQVhNRU0oaykgTUFYTUVNKCUpIFZDUFVT
IE5FVFMgTkVUVFgoaykgTkVUUlgoaykgVkJEUyAgIFZCRF9PTyAgIFZCRF9SRCAgIFZCRF9XUiAg
VkJEX1JTRUNUICBWQkRfV1NFQ1QgU1NJRAogICAgICAgRG9tQSAtLWItLS0gICAgICAgIDI1MCAg
IDYwLjggICAgNjI1ODQ1NiAgIDc1LjggICAgNjI1OTcxMiAgICAgIDc1LjggICAgIDQgICAgMCAg
ICAgICAgMCAgICAgICAgMCAgICAwICAgICAgICAwICAgICAgICAwICAgICAgICAwICAgICAgICAg
IDAgICAgICAgICAgMCAgICAwCiAgIERvbWFpbi0wIC0tLS0tciAgICAgICAgMTU5ICAgIDIuMSAg
ICAgMjYyMTQ0ICAgIDMuMiAgIG5vIGxpbWl0ICAgICAgIG4vYSAgICAgNCAgICAwICAgICAgICAw
ICAgICAgICAwICAgIDAgICAgICAgIDAgICAgICAgIDAgICAgICAgIDAgICAgICAgICAgMCAgICAg
ICAgICAwICAgIDAKICAgICAgIERvbUQgLS0tLS1yICAgICAgICAyNzUgIDEwMi43ICAgIDExODE5
NzIgICAxNC4zICAgIDEyNDYyMDggICAgICAxNS4xICAgICA0ICAgIDAgICAgICAgIDAgICAgICAg
IDAgICAgMCAgICAgICAgMCAgICAgICAgMCAgICAgICAgMCAgICAgICAgICAwICAgICAgICAgIDAg
ICAgMAoKCllvdSBjYW4gc2VlIHRoYXQgcmlzZSBvZiBDUFUgdXNlZCBieSBoeXBlcnZpc29yIGl0
c2VsZiBpbiBoaWdoIElSUSB1c2UtY2FzZSAoR1BVIGxvYWQpLgoKPiBJIGNvbmZpcm0gd2hhdCBJ
IHNhaWQgYWJvdXQgcGF0Y2ggMTogaWRsZSB0aW1lIGJlaW5nIHRoZSB0aW1lIGlkbGVfdmNwdQo+
IHNwZW50IGluIFJVTlNUQVRFX2Jsb2NrZWQsIGFuZCBoeXBlcnZpc29yIHRpbWUgYmVpbmcgdGhl
IHRpbWUgaWRsZV92Y3B1Cj4gc3BlbnQgaW4gUlVOU1RBVEVfcnVubmluZyBzb3VuZHMgcXVpdGUg
Y29uZnVzaW5nIHRvIG1lLgoKQXMgSSBzYWlkIGJlZm9yZSwgdGhpbmsgb2YgaWRsZV92Y3B1IGFz
IGh5cGVydmlzb3JfdmNwdSA7KQoKLS0gClNpbmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
