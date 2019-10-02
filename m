Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB80C90DF
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 20:30:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFjMD-0007dh-R3; Wed, 02 Oct 2019 18:28:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bdjo=X3=gmail.com=f.fainelli@srs-us1.protection.inumbo.net>)
 id 1iFjMB-0007dY-CA
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 18:28:11 +0000
X-Inumbo-ID: 62ecdedc-e542-11e9-97fb-bc764e2007e4
Received: from mail-pf1-x444.google.com (unknown [2607:f8b0:4864:20::444])
 by localhost (Halon) with ESMTPS
 id 62ecdedc-e542-11e9-97fb-bc764e2007e4;
 Wed, 02 Oct 2019 18:28:10 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id y5so10916795pfo.4
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2019 11:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=izcdKMTlTPXdg1rZpK9PkNPTeAL5ACc5p0aT6ECn+3o=;
 b=nr6ZKcXN/729CI5YvKkqVc0Bz2wyp7AqMiNJbnneIbJ2S8a6/RpgT+vQxveooa1g8o
 Tzstjrebdj0ch6CBEQIhLHedt+Meqh8poQODSN2lg0OykjXXZCvv3ItaPXFO7ZImXqcW
 RuKmutNc32nfhTfdTSE+Gn+FP0hyvVehIb12ZNHr5rdWDezRIrhU/4qCY2koq02vv9hS
 0JYsKwzPEkKLeHC0o1yMLr4lNeC7nIidqjJQlgZ17X3hwG7uMGUGlb0FYDKstybAoxSN
 PuzGKEISFL71Mt9LOzHTLH19Bi/ikZqtSvsTTAUBs/9/pSrhf3mQrJw/Bi+Y2mWPIur/
 yzHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=izcdKMTlTPXdg1rZpK9PkNPTeAL5ACc5p0aT6ECn+3o=;
 b=o6ZHYiIEVAdEmcWED/Q1DPumnqt+AmtIP+E6GlLaehT5TwKQw/1HNmdNU8FZU6hjyO
 vWfCE9xwo3mu4ajGROsj1bMasZS9IvyKFODajiVrrti1pMjSRgfcjDqujYXRb98zptr0
 bUfUfKFtGlSDQOawCMuG/Tee6/SzTg77qQN/NaULh5NomQCdb1V6clkkARENuZjboZ1K
 Nf6KiinbQDZ2pv4v8MFNpL8C0h7WIyvhefp+ZSYRIj0EPjxgL9xGgtF2R0HPRTdDI91t
 f9bB0DUvjdUk7UNfVDTnb+BrzfNEmGAxtW+TmFGmUbtb231Dq5SP1ow+VIz9x3vHhNGn
 1rrA==
X-Gm-Message-State: APjAAAUoHG+LlvxR8XDQexFmLZQhMSFRd/Ywe8cMXGWQjEJCzjdc7Zp/
 X+c3tTAqScFJb7EZP1H/JA4=
X-Google-Smtp-Source: APXvYqwrs3FB89RH0+kgXBF3ejwmYPZLTgHaLNuUiXE1AjcShSZR76+3xPYW28RCBcE0p63294782w==
X-Received: by 2002:a17:90a:c214:: with SMTP id
 e20mr5758828pjt.81.1570040889544; 
 Wed, 02 Oct 2019 11:28:09 -0700 (PDT)
Received: from [10.69.78.41] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id b14sm162486pfi.95.2019.10.02.11.28.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Oct 2019 11:28:08 -0700 (PDT)
To: Robin Murphy <robin.murphy@arm.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Rob Herring <robh+dt@kernel.org>
References: <20190924181244.7159-1-nsaenzjulienne@suse.de>
 <CAL_Jsq+v+svTyna7UzQdRVqfNc5Z_bgWzxNRXv7-Wqv3NwDu2g@mail.gmail.com>
 <d1a31a2ec8eb2f226b1fb41f6c24ffb47c3bf7c7.camel@suse.de>
 <e404c65b-5a66-6f91-5b38-8bf89a7697b2@arm.com>
 <43fb5fe1de317d65a4edf592f88ea150c6e3b8cc.camel@suse.de>
 <CAL_JsqLhx500cx3YLoC7HL1ux3bBpV+fEA2Qnk7D5RFGgiGzSw@mail.gmail.com>
 <aa4c8d62-7990-e385-2bb1-cec55148f0a8@arm.com>
 <CAL_JsqKKYcHPnA80ZwLY=Sk3e5MqrimedUhWQ5+iuPZXQxYHdA@mail.gmail.com>
 <307b988d0c67fb1c42166eca12742bcfda09d92d.camel@suse.de>
 <c27a51e1-1adf-ae6a-dc67-ae76222a1163@arm.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <fbae48ca-fbd4-e32b-e874-92b5bba5df4d@gmail.com>
Date: Wed, 2 Oct 2019 11:28:06 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <c27a51e1-1adf-ae6a-dc67-ae76222a1163@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 00/11] of: Fix DMA configuration for non-DT
 masters
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
Cc: devicetree@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, etnaviv@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>,
 james.quinlan@broadcom.com, linux-pci@vger.kernel.org,
 "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>,
 xen-devel@lists.xenproject.org, Dan Williams <dan.j.williams@intel.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 Frank Rowand <frowand.list@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiA5LzI2LzIwMTkgNDoyMCBBTSwgUm9iaW4gTXVycGh5IHdyb3RlOgo+IE9uIDIwMTktMDkt
MjYgMTE6NDQgYW0sIE5pY29sYXMgU2FlbnogSnVsaWVubmUgd3JvdGU6Cj4+Pj4+PiBSb2Jpbiwg
aGF2ZSB5b3UgbG9va2VkIGludG8gc3VwcG9ydGluZyBtdWx0aXBsZSBkbWEtcmFuZ2VzPyBJdCdz
IHRoZQo+Pj4+Pj4gbmV4dCB0aGluZwo+Pj4+Pj4gd2UgbmVlZCBmb3IgQkNNIFNUQidzIFBDSWUu
IEknbGwgaGF2ZSBhIGdvIGF0IGl0IG15c2VsZiBpZiBub3RoaW5nCj4+Pj4+PiBpcyBpbgo+Pj4+
Pj4gdGhlCj4+Pj4+PiB3b3JrcyBhbHJlYWR5Lgo+Pj4+Pgo+Pj4+PiBNdWx0aXBsZSBkbWEtcmFu
Z2VzIGFzIGZhciBhcyBjb25maWd1cmluZyBpbmJvdW5kIHdpbmRvd3Mgc2hvdWxkIHdvcmsKPj4+
Pj4gYWxyZWFkeSBvdGhlciB0aGFuIHRoZSBidWcgd2hlbiB0aGVyZSdzIGFueSBwYXJlbnQgdHJh
bnNsYXRpb24uIEJ1dCBpZgo+Pj4+PiB5b3UgbWVhbiBzdXBwb3J0aW5nIG11bHRpcGxlIERNQSBv
ZmZzZXRzIGFuZCBtYXNrcyBwZXIgZGV2aWNlIGluIHRoZQo+Pj4+PiBETUEgQVBJLCB0aGVyZSdz
IG5vdGhpbmcgaW4gdGhlIHdvcmtzIHlldC4KPj4KPj4gU29ycnksIEkgbWVhbnQgc3VwcG9ydGlu
ZyBtdWx0aXBsZSBETUEgb2Zmc2V0c1sxXS4gSSB0aGluayBJIGNvdWxkCj4+IHN0aWxsIG1ha2UK
Pj4gaXQgd2l0aCBhIHNpbmdsZSBETUEgbWFzayB0aG91Z2guCj4gCj4gVGhlIG1haW4gcHJvYmxl
bSBmb3Igc3VwcG9ydGluZyB0aGF0IGNhc2UgaW4gZ2VuZXJhbCBpcyB0aGUgZGlzZ3VzdGluZwo+
IGNhcnZpbmcgdXAgb2YgdGhlIHBoeXNpY2FsIG1lbW9yeSBtYXAgeW91IG1heSBoYXZlIHRvIGRv
IHRvIGd1YXJhbnRlZQo+IHRoYXQgYSBzaW5nbGUgYnVmZmVyIGFsbG9jYXRpb24gY2Fubm90IGV2
ZXIgc3BhbiB0d28gd2luZG93cyB3aXRoCj4gZGlmZmVyZW50IG9mZnNldHMuIEkgZG9uJ3QgdGhp
bmsgd2UgZXZlciByZWFjaGVkIGEgY29uY2x1c2lvbiBvbiB3aGV0aGVyCj4gdGhhdCB3YXMgZXZl
biBhY2hpZXZhYmxlIGluIHByYWN0aWNlLgoKSXQgaXMgd2l0aCB0aGUgQnJvYWRjb20gU1RCIFNv
Q3Mgd2hpY2ggaGF2ZSBiZXR3ZWVuIDEgYW5kIDMgbWVtb3J5CmNvbnRyb2xsZXJzIGRlcGVuZGlu
ZyBvbiB0aGUgU29DLCBhbmQgbXVsdGlwbGUgZG1hLXJhbmdlcyBjZWxscyBmb3IgUENJZQphcyBh
IGNvbnNlcXVlbmNlLgoKRWFjaCBtZW1vcnkgY29udHJvbGxlciBoYXMgYSBkaWZmZXJlbnQgcGh5
c2ljYWwgYWRkcmVzcyBhcGVydHVyZSBpbiB0aGUKQ1BVJ3MgcGh5c2ljYWwgYWRkcmVzcyBtYXAg
KGUuZy46IE1FTUMwIGlzIDB4MCAtIDB4M2ZmZl9mZmZmLCBNRU1DMQoweDQwMDBfMDAwMCAtIDB4
N2ZmZmZfZmZmZiBhbmQgTUVNQzIgMHg4MDAwXzAwMDAgLSAweGJmZmZfZmZmZiwgbm90CmNvdW50
aW5nIHRoZSBleHRlbnNpb24gcmVnaW9ucyBhYm92ZSA0R0IpLCBhbmQgd2hpbGUgdGhlIENQVSBp
cwpzY2hlZHVsZWQgYW5kIGFyYml0cmF0ZWQgdGhlIHNhbWUgd2F5IGFjcm9zcyBhbGwgbWVtb3J5
IGNvbnRyb2xsZXJzCih0aHVzIG1ha2luZyBpdCB2aXJ0dWFsbHkgVU1BLCBhbG1vc3QpIGhhdmlu
ZyBhIGJ1ZmZlciBzcGFuIHR3byBtZW1vcnkKY29udHJvbGxlcnMgd291bGQgYmUgcHJvYmxlbWF0
aWMgYmVjYXVzZSB0aGUgbWVtb3J5IGNvbnRyb2xsZXJzIGRvIG5vdAprbm93IGhvdyB0byBndWFy
YW50ZWUgdGhlIHRyYW5zYWN0aW9uIG9yZGVyaW5nIGFuZCBidWZmZXIgZGF0YQpjb25zaXN0ZW5j
eSBpbiBib3RoIERSQU0gaXRzZWxmIGFuZCBmb3Igb3RoZXIgbWVtb3J5IGNvbnRyb2xsZXIgY2xp
ZW50cywKbGlrZSBQQ0llLgoKV2UgaGlzdG9yaWNhbGx5IGhhZCB0byByZXNlcnZlIHRoZSBsYXN0
IDRLQiBvZiBlYWNoIG1lbW9yeSBjb250cm9sbGVyIHRvCmF2b2lkIHByb2JsZW1hdGljIGNvbnRy
b2xsZXJzIGxpa2UgRUhDSSB0byBwcmVmZXRjaCBiZXlvbmQgdGhlIGVuZCBvZiBhCm1lbW9yeSBj
b250cm9sbGVyJ3MgcG9wdWxhdGVkIG1lbW9yeSBhbmQgdGhhdCBhbHNvIGluY2lkZW50YWxseSB0
YWtlcwpjYXJlIG9mIG5ldmVyIGhhdmluZyBhIGJ1ZmZlciBjcm9zcyBhIGNvbnRyb2xsZXIgYm91
bmRhcnkuIEVpdGhlciB5b3UKY2FuIGFsbG9jYXRlIHRoZSBlbnRpcmUgYnVmZmVyIG9uIGEgZ2l2
ZW4gbWVtb3J5IGNvbnRyb2xsZXIsIG9yIHlvdQpjYW5ub3QgYWxsb2NhdGUgbWVtb3J5IGF0IGFs
bCBvbiB0aGF0IHpvbmUvcmVnaW9uIGFuZCBhbm90aGVyIG9uZSBtdXN0CmJlIGZvdW5kIChvciB0
aGVyZSBpcyBubyBtb3JlIG1lbW9yeSBhbmQgdGhlcmUgaXMgYSBnZW51aW5lIE9PTSkuCgpUaGUg
d2F5IHdlIHJlc2VydmUgbWVtb3J5IHJpZ2h0IG5vdyBpcyBiYXNlZCBvbiB0aGUgZmlyc3QgcGF0
Y2gKc3VibWl0dGVkIGJ5IEppbToKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3BhdGNod29yay9w
YXRjaC85ODg0NjkvCgp3aGVyZWJ5IHdlIHJlYWQgdGhlIG1lbW9yeSBub2RlJ3MgInJlZyIgcHJv
cGVydHkgYW5kIHdlIG1hcCB0aGUgcGh5c2ljYWwKYWRkcmVzc2VzIHRvIHRoZSBtZW1vcnkgY29u
dHJvbGxlciBjb25maWd1cmF0aW9uIHJlYWQgZnJvbSB0aGUgc3BlY2lmaWMKcmVnaXN0ZXJzIGlu
IHRoZSBDUFUncyBCdXMgSW50ZXJmYWNlIFVuaXQgKHdoZXJlIHRoZSBtZW1vcnkgY29udHJvbGxl
cgphcGVydHVyZXMgYXJlIGFyY2hpdGVjdHVyYWxseSBkZWZpbmVkKSBhbmQgdGhlbiB3ZSB1c2Ug
dGhhdCB0byBjYWxsCm1lbWJsb2NrX3Jlc2VydmUoKSAobm90IHBhcnQgb2YgdGhhdCBwYXRjaCwg
aXQgc2hvdWxkIGJlIHRob3VnaCkuCi0tIApGbG9yaWFuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
