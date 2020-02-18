Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A795A1632AF
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 21:11:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j499U-0000Iq-Jb; Tue, 18 Feb 2020 20:07:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0+gE=4G=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1j499S-0000Il-Jm
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 20:07:26 +0000
X-Inumbo-ID: 48075060-528a-11ea-ade5-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 48075060-528a-11ea-ade5-bc764e2007e4;
 Tue, 18 Feb 2020 20:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582056445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=imQEmwhGbbuDtVJHtCc17rDNhQZDMqNVR4B8mNPvFe8=;
 b=VhhOF3qpi5SspaKvZKQ9S7PrJry3u7ovP/feM5uzG4RXooXVt6Wti9Dx9ls25EIccdhgl2
 rZgS3ibdQJxYcAuxzg1FFadGXXKWLmSL0dI4TjubAERpeGZlpmHYcPWaPrMcUvjQbye9Cc
 dRaT/lAWqfb5bM375NzAraZEp+2qSlM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-gMfhZvpjNbqcS_ashw_vzQ-1; Tue, 18 Feb 2020 15:07:21 -0500
Received: by mail-wr1-f71.google.com with SMTP id o9so11470202wrw.14
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2020 12:07:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fB3Wm4tuTuHZXMhhL/GvlweCikb9oi76N5t38wjItwQ=;
 b=QezXuNsAwsXYBbjFhqhpKcFk4hMlnSGvFh0v6u2RevZnQi+POWv7azbtroReyxKmdl
 bZBiBdh9/mVewBisPDMV6Mg1kxNUwj7HSSkj+QWQ5vQ4d0OOHyXQESYo+/L1os03rjDc
 nFIGHfzkavOAWweju56FLsIzzGCotn9d4qbSi0rLqlS8b+XTFwwJkOx4waCczWj5sGr9
 UFoLmEQMiyeQllCTNWB5/qGEXWbmun8dvONS+JI1G1pcCxx4HJGTIpD2O9JxzuWIZvws
 oT2m0RAuuQ2/Od2cxZafgJoNAj+fGAoP42PzRksrlmwAFfpcclGoz3yuXGc3rjkZH7ab
 pn1A==
X-Gm-Message-State: APjAAAVYC16EJ7sCFvokPlWd62DBjaveeuyYZjg5gL67BaEsjjJKEFQN
 uc7XFn8zdE6zSOLXFZ3f8DYQgX0TIUyBs0x7X5ED2I/BuRN2DN3uH0kwbaAwZdc/pBmg5sV03HE
 Wp9aHFuSOP3MiUN1kByDxQ6YPPjY=
X-Received: by 2002:adf:b605:: with SMTP id f5mr29414062wre.383.1582056440418; 
 Tue, 18 Feb 2020 12:07:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqyPI+w3k02V1gsRQPOpAFrfSTNrgI0Lt+9d76EBZMw30h3gWZQNni8kwQ7kMtrlp7uVsuZg6A==
X-Received: by 2002:adf:b605:: with SMTP id f5mr29414039wre.383.1582056440142; 
 Tue, 18 Feb 2020 12:07:20 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id t12sm7294853wrq.97.2020.02.18.12.07.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2020 12:07:19 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>
References: <20200218132023.22936-1-philmd@redhat.com>
 <87e06de3-179b-54a1-3451-39a0a30b65f0@weilnetz.de>
 <CAFEAcA9Jr2Yi1K8_9MGUJYt8C=OcKbWDh1UJjTQG1EspLux3JQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <af34169f-fccc-da44-7b8e-1b38da4a203c@redhat.com>
Date: Tue, 18 Feb 2020 21:07:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9Jr2Yi1K8_9MGUJYt8C=OcKbWDh1UJjTQG1EspLux3JQ@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: gMfhZvpjNbqcS_ashw_vzQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Xen-devel] [PATCH] Avoid cpu_physical_memory_rw() with a
 constant is_write argument
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMi8xOC8yMCA3OjQ5IFBNLCBQZXRlciBNYXlkZWxsIHdyb3RlOgo+IE9uIFR1ZSwgMTggRmVi
IDIwMjAgYXQgMTc6NTcsIFN0ZWZhbiBXZWlsIDxzd0B3ZWlsbmV0ei5kZT4gd3JvdGU6Cj4+Cj4+
IEFtIDE4LjAyLjIwIHVtIDE0OjIwIHNjaHJpZWIgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6k6Cj4+
Cj4+PiBUaGlzIGNvbW1pdCB3YXMgcHJvZHVjZWQgd2l0aCB0aGUgaW5jbHVkZWQgQ29jY2luZWxs
ZSBzY3JpcHQKPj4+IHNjcmlwdHMvY29jY2luZWxsZS9hcy1ydy1jb25zdC5wYXRjaC4KPj4+Cj4+
PiBJbnNwaXJlZC1ieTogUGV0ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPgo+
Pj4gU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQu
Y29tPgo+Pj4gLS0tCj4+PiBCYXNlZC1vbjogPDIwMjAwMjE4MTEyNDU3LjIyNzEyLTEtcGV0ZXIu
bWF5ZGVsbEBsaW5hcm8ub3JnPgo+PiBbLi4uXQo+Pj4gZGlmZiAtLWdpdCBhL3RhcmdldC9pMzg2
L2hheC1hbGwuYyBiL3RhcmdldC9pMzg2L2hheC1hbGwuYwo+Pj4gaW5kZXggYThiNmU1YWViOC4u
ZjU5NzFjY2M3NCAxMDA2NDQKPj4+IC0tLSBhL3RhcmdldC9pMzg2L2hheC1hbGwuYwo+Pj4gKysr
IGIvdGFyZ2V0L2kzODYvaGF4LWFsbC5jCj4+PiBAQCAtMzc2LDggKzM3Niw4IEBAIHN0YXRpYyBp
bnQgaGF4X2hhbmRsZV9mYXN0bW1pbyhDUFVBcmNoU3RhdGUgKmVudiwgc3RydWN0IGhheF9mYXN0
bW1pbyAqaGZ0KQo+Pj4gICAgICAgICAgICAqICBoZnQtPmRpcmVjdGlvbiA9PSAyOiBncGEgPT0+
IGdwYTIKPj4+ICAgICAgICAgICAgKi8KPj4+ICAgICAgICAgICB1aW50NjRfdCB2YWx1ZTsKPj4+
IC0gICAgICAgIGNwdV9waHlzaWNhbF9tZW1vcnlfcncoaGZ0LT5ncGEsICh1aW50OF90ICopICZ2
YWx1ZSwgaGZ0LT5zaXplLCAwKTsKPj4+IC0gICAgICAgIGNwdV9waHlzaWNhbF9tZW1vcnlfcnco
aGZ0LT5ncGEyLCAodWludDhfdCAqKSAmdmFsdWUsIGhmdC0+c2l6ZSwgMSk7Cj4+PiArICAgICAg
ICBjcHVfcGh5c2ljYWxfbWVtb3J5X3JlYWQoaGZ0LT5ncGEsICh1aW50OF90ICopJnZhbHVlLCBo
ZnQtPnNpemUpOwo+Pj4gKyAgICAgICAgY3B1X3BoeXNpY2FsX21lbW9yeV93cml0ZShoZnQtPmdw
YTIsICh1aW50OF90ICopJnZhbHVlLCBoZnQtPnNpemUpOwo+Pgo+Pgo+PiBNYXliZSB0aG9zZSB0
eXBlIGNhc3RzIGNvdWxkIGJlIHJlbW92ZWQsIHRvby4gVGhleSBhcmUgbm8gbG9uZ2VyIG5lZWRl
ZAo+PiBhZnRlciB5b3VyIG1vZGlmaWNhdGlvbi4KPiAKPiBJIHRoaW5rIHRoYXQgd2Ugc2hvdWxk
IGZpeCB0aGUgaW5jb25zaXN0ZW5jeSB3aGVyZSB0aGVzZSBmdW5jdGlvbnMKPiBhbGwgdGFrZSAi
dWludDhfdCogYnVmIjoKPiAKPiAgIC0gYWRkcmVzc19zcGFjZV9ydygpCj4gICAtIGFkZHJlc3Nf
c3BhY2VfcmVhZCgpCj4gICAtIGFkZHJlc3Nfc3BhY2Vfd3JpdGUoKQo+ICAgLSBhZGRyZXNzX3Nw
YWNlX3dyaXRlX3JvbSgpCj4gICAtIGNwdV9waHlzaWNhbF9tZW1vcnlfcncoKQo+ICAgLSBjcHVf
bWVtb3J5X3J3X2RlYnVnKCkKPiAKPiBidXQgdGhlc2UgdGFrZSB2b2lkKjoKPiAgIC0gY3B1X3Bo
eXNpY2FsX21lbW9yeV9yZWFkKCkKPiAgIC0gY3B1X3BoeXNpY2FsX21lbW9yeV93cml0ZSgpCj4g
ICAtIGFkZHJlc3Nfc3BhY2Vfd3JpdGVfY2FjaGVkKCkKPiAgIC0gYWRkcmVzc19zcGFjZV9yZWFk
X2NhY2hlZF9zbG93KCkKPiAgIC0gYWRkcmVzc19zcGFjZV93cml0ZV9jYWNoZWRfc2xvdygpCj4g
ICAtIHBjaV9kbWFfcmVhZCgpCj4gICAtIHBjaV9kbWFfd3JpdGUoKQo+ICAgLSBwY2lfZG1hX3J3
KCkKPiAgIC0gZG1hX21lbW9yeV9yZWFkKCkKPiAgIC0gZG1hX21lbW9yeV93cml0ZSgpCj4gICAt
IGRtYV9tZW1vcnlfcncoKQo+ICAgLSBkbWFfbWVtb3J5X3J3X3JlbGF4ZWQoKQoKSSBkb24ndCB1
bmRlcnN0YW5kIHdlbGwgY3B1X3BoeXNpY2FsX21lbW9yeSooKS4gQXJlbid0IHRoZXNlIG9ic29s
ZXRlPwpUaGV5IGNvbmZ1c2UgbWUgd2hlbiB1c2luZyBtdWx0aS1jb3JlIENQVXMuCgo+IAo+IERl
cGVuZGluZyBvbiB3aGljaCB3YXkgd2UgZ28gd2Ugd291bGQgZWl0aGVyIHdhbnQgdG8gcmVtb3Zl
IHRoZXNlCj4gY2FzdHMsIG9yIG5vdC4KPiAKPiBJIGd1ZXNzIHRoYXQgd2UgaGF2ZSBtb3JlIGNh
c2VzIG9mICd2b2lkKicsIGFuZCB0aGF0IHdvdWxkCj4gY2VydGFpbmx5IGJlIHRoZSBlYXNpZXIg
d2F5IHRvIGNvbnZlcnQgKG90aGVyd2lzZSB3ZSBwcm9iYWJseQo+IG5lZWQgdG8gYWRkIGEgYnVu
Y2ggb2YgbmV3IGNhc3RzIHRvIHVpbnQ4X3QqIGluIHZhcmlvdXMgY2FsbHNpdGVzKSwKPiBidXQg
SSBkb24ndCBoYXZlIGEgc3Ryb25nIG9waW5pb24uIFBhb2xvID8KCkkgdGhvdWdodCBhYm91dCBp
dCB0b28gYnV0IGl0IGlzIHF1aXRlIHNvbWUgd29yaywgYW5kIEkndiB0byBhZG1pdCBJIApsb3N0
IHNvbWUgZmFpdGggd2l0aCBteSBwcmV2aW91cyBjaGFyZGV2IGNvbnZlcnNpb24uIFRoZXJlIFBh
b2xvL0RhbmllbCAKYWdyZWVkIHRvIGZvbGxvdyB0aGUgbGliYyByZWFkKCkvd3JpdGUoKSBwcm90
b3R5cGVzLgoKPiAKPiB0aGFua3MKPiAtLSBQTU0KPiAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
