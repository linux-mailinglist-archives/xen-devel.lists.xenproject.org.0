Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A46957B031
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 19:37:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsW1h-0008UU-57; Tue, 30 Jul 2019 17:35:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2K5v=V3=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hsW1g-0008UN-6k
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 17:35:04 +0000
X-Inumbo-ID: 5c7cac4a-b2f0-11e9-8980-bc764e045a96
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5c7cac4a-b2f0-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 17:35:03 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id y17so38309281ljk.10
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2019 10:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TbtPdGMZhSpRPzNnFWrD1pdONZgEJzqeLG/CdVm5/P8=;
 b=o6gI4Crrxcue4xpZ6HpKbUk3rmYT6iQ8t7nJ6DxSMCXyqPuhvI/SQupRLQEzmOxA98
 l/YehHtY/WmF2IKWJSSmP+1fKIYmnYcZbeG+O22d5TI92lcVHRgZy5tTqTs+Ic2w959K
 KDgi4D61StrP5r2UyTfhKagXjpdlqIhGormio47O75+zb9mr57wclRusBeMQUdaPBSdW
 X19PXhsKRZONm+XDLewbp0ceuv9g+y1xN9II553+G6foGch+ymW2jisas+EE/ym4tRKe
 Z5G6W+tvr4pbulyA7/zJAftuCctdmHqR4teLNqyIFs5bq1kra2mGysIgYxfhki6Vmogo
 4GPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TbtPdGMZhSpRPzNnFWrD1pdONZgEJzqeLG/CdVm5/P8=;
 b=Lxi8BmXHd2Pobh4I/uTfYp8aDl2OSUEEeRrXQsRQJIepMbsHe1zsqoxFJxW5KWpUqD
 kksGwEmYYNNrY6huq47RTOce+IwJdUea+KO2Unne0pNA8idRJ6XvG8rKv1LN/WC09fhr
 ew4Cv7J9KOD9WhH1BKo5JDw0H2wXJb2N4vhaMwl/o+H6nuWzC+T5POhlv7yLUthnB/LM
 jEjx5zzDA5i0IMCcLIoTxsolRdUFv7WBygstm/Yg5j+eYcje0U9yJ1SmV4NmVKzLJMJT
 +O+S5xHS8k7l0Aa3c/2ESMTkffsSFmtliA32lFgW0lsWL3aKD209xdNbgb/MLf5/KRvU
 7Orw==
X-Gm-Message-State: APjAAAXeFh9w9p48ta2Ay0izKvJ2sOZWv32/saWS3+3pSDGuJwcNFa+w
 WWcOfVDjVhWNzUAjUgl8HGqnZtgv
X-Google-Smtp-Source: APXvYqxWDfKvFwzVBfSR/dzMYfltJJhbhcteJER/67D7ecvK7csmXONCZH99xaDNTFiocZqXqJhSpQ==
X-Received: by 2002:a2e:9ac4:: with SMTP id p4mr21424412ljj.185.1564508101456; 
 Tue, 30 Jul 2019 10:35:01 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 n1sm11312871lfk.19.2019.07.30.10.35.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Jul 2019 10:35:00 -0700 (PDT)
To: Julien Grall <Julien.Grall@arm.com>
References: <1543440731-21947-1-git-send-email-andrii.anisov@gmail.com>
 <1543440731-21947-2-git-send-email-andrii.anisov@gmail.com>
 <cfdf9c30-f3e1-4023-e044-959871d2f654@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <b7b24214-f7d0-41d0-b2c7-286d45f6da1a@gmail.com>
Date: Tue, 30 Jul 2019 20:34:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <cfdf9c30-f3e1-4023-e044-959871d2f654@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC 01/16] xen/arm: Re-enable interrupt later in
 the trap path
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
 nd <nd@arm.com>, Andrii Anisov <andrii_anisov@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gSnVsaWVuLAoKSXQgbG9va3MgSSBtaXNzZWQgYW5zd2VyaW5nIHRoaXMgZW1haWwuIFNv
IGRvIHRoaXMgbm93OgoKT24gMjkuMTEuMTggMDA6MDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBP
biAyOC8xMS8yMDE4IDIxOjMxLCBBbmRyaWkgQW5pc292IHdyb3RlOgo+PiBGcm9tOiBKdWxpZW4g
R3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+Pgo+PiBUaGlzIG1ha2VzIGZ1bmN0aW9uIGVu
dGVyX2h5cGVydmlzb3JfaGVhZCgpIGJlaW5nIGV4ZWN1dGVkIHdpdGgKPj4gaXJxcyBsb2NrZWQu
IFRoaXMgYWxzbyBnaXZlIGEgZmluZSBzaWRlIGVmZmVjdCAtIGl0IGFzc3VyZXMgdGhhdAo+PiBM
UnMgYXJlIGNsZWFyZWQgcHJpb3IgdG8gYW55IElSUXMgcHJvY2Vzc2luZywgd2hpY2ggbGVhZHMg
dG8gYQo+PiBiZXR0ZXIgKGZhc3RlcikgSVJRcyBwcm9jZXNzaW5nLgo+IAo+IEFnYWluLCB0aGlz
IG5lZWQgc29tZSByYXRpb25hbGUgd2h5IGlzIGl0IGZhc3Rlci4gQW5kIGhvdyB0aGlzIGlzIGdv
aW5nCj4gdG8gaW1wYWN0IHRoZSBvdGhlciB2R0lDLi4uCgpXaXRoIHRoZSBjdXJyZW50IGNvZGUs
IHRoZXJlIGlzIGEgY2hhbmNlIHRoYXQgaHlwZXJ2aXNvciBwZXJmb3JtcyBkb19JUlEoKSBiZWZv
cmUgZmV0Y2hpbmcgTFJzIHdpdGggdGhlIGluZm9ybWF0aW9uIGFib3V0IElSUXMgYmVpbmcgcHJv
Y2Vzc2VkIGJ5IGEgZ3Vlc3QuIFRoaXMgY291bGQgaGFwcGVuIGluIGd1ZXN0IHRyYXAgcGF0aHMg
d2hlcmUgaW50ZXJydXB0cyBhcmUgZW5hYmxlZCBiZWZvcmUgYGVudGVyX2h5cGVydmlzb3JfaGVh
ZCgpYCBjYWxsLgoKUGVyZm9ybWluZyBgZG9fSVJRKClgIHByaW9yIHRvIGB2Z2ljX3N5bmNfZnJv
bV9scnMoKWAgaXMgYXNzdW1lZCBhcyBsZXNzIGVmZmljaWVudCB0aGFuIGRvaW5nIGl0IHZpY2Ug
dmVyc2EgZm9yIGhpZ2ggSVJRIHJhdGUgdXNlLWNhc2VzIHdpdGggdGhlIG51bWJlciBvZiBkaWZm
ZXJlbnQgaW50ZXJydXB0cyAoc3BlY2lmaWMgZm9yIG11bHRpbWVkaWEgc2NlbmFyaW9zKS4KCiAg
LSBGb3IgdGhlIG9sZCB2Z2ljIGltcGxlbWVudGF0aW9uLCBgdmdpY19zeW5jX2Zyb21fbHJzKClg
IHJlbGVhc2UgTFJzIGZyb20gcHJvY2Vzc2VkIGludGVycnVwdHMgYWxzbyBzaG9ydGVucyBgaW5m
bGlnaHRfaXJxc2Agc29ydGVkIGxpc3QuIFNvIGBkb19JUlEoKWAgaGFzIGJldHRlciBjaGFuY2Vz
IHRvIHdyaXRlIElSUSBkaXJlY3RseSB0byBMUiBpbnN0ZWFkIG9mIHNhdmluZyBpdCBpbnRvIGBs
cl9wZW5kaW5nYCBsaXN0IGFuZCBwb3NzaWJseSBmYXN0ZXIgaW5zZXJ0IHRoZSBuZXcgSVJRIGlu
dG8gYGluZmxpZ2h0X2lycXNgIGxpc3QuCgogIC0gRm9yIHRoZSBuZXcgdmdpYyBpbXBsZW1lbnRh
dGlvbiwgYHZnaWNfc3luY19mcm9tX2xycygpYCBmZXRjaGVzIGFib3V0IHByb2Nlc3NlZCBpbnRl
cnJ1cHRzIGZyb20gTFJzIGFuZCBzaG9ydGVucyBgYXBfbGlzdGAuIFNvIGBkb19JUlEoKWAgY291
bGQgcG90ZW50aWFsbHkgZmFzdGVyIGluc2VydCB0aGUgbmV3IGludGVycnVwdCBpbnRvIGBhcF9s
aXN0YC4KCgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgouCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
