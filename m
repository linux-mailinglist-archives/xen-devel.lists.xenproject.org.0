Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D22B16FE1F
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 12:54:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpVuQ-0005GF-3i; Mon, 22 Jul 2019 10:51:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZN+7=VT=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hpVuO-0005GA-FE
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 10:51:08 +0000
X-Inumbo-ID: 9b7b72e4-ac6e-11e9-8980-bc764e045a96
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9b7b72e4-ac6e-11e9-8980-bc764e045a96;
 Mon, 22 Jul 2019 10:51:07 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id p17so37135564ljg.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2019 03:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=O1p6env8P3YO40uluIjAEV7JFlSxiBGpK8LQBlI0Vhc=;
 b=dtDGRu661u8WfUH9+POgBwrqghKz++8LXQJMJIwme8aCpyEtEVO6SJVw5FoR+rklbP
 w2BHH/QylACHJo5lNLnyK1VHpo99ct/WKt0ItQ85gdAZdTdW+Jzix1VdB2hSZ32M/NGc
 MsAcSvaU043n4bSa8pd7xfjnxe6OL7ghCzlYAPcEPVNe41yORGSHOSwYkrTxuF7cjs2b
 dV1txcIQqiWvi0YG4mhTE8GfyF5AjEujRX79XeCvs79xIcjra++LbNxauvPklwLF23jc
 oquDnl00uGNff1SMPH/HB25HV6PUheXuf+1TWf/PBsVR6qbcue8rLopRtAD3uHdytIB6
 mm+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O1p6env8P3YO40uluIjAEV7JFlSxiBGpK8LQBlI0Vhc=;
 b=rreBqvcIWdMHw9uizfBKYhwFu2UXFR3xtZhauunZYmGg9e+oTNZT02yKrQGG5j3EdU
 PM356/bm9HKTr5K9gZoEE2jsQnSoNv/AbSYb8WpnZdTAF9yYnr+orBP0fCszNY8RVxVL
 1UIqivYp3nZQzrmjmfQIpgYLqNFajENjErDfB8C+UaSLpTVUD5O1hxRT4OK3L3GdUt9B
 iFtZvEyve6Y5IlTyzG/XQAEezoreog3p5Ui9f0zwqfJ3YhXhSWRT/rFkvDfNJDBbZ/LL
 JEE3/ygEWxSVTWB2b9+9U44xnUDQBgqL2crQh+taWecAeEbHczQY4pZTk/m+R8lQ1EeF
 Ewaw==
X-Gm-Message-State: APjAAAVthrItrrjZh7uSECAChR52yJrLtIor5++wYUSK1vW0vClqzxJA
 RGNgL9j5B3A2UAWRQf7nLXk=
X-Google-Smtp-Source: APXvYqxUY2r1xjQ8HVs5n7jFKpED+Bq5uylscNihh81Nr27NLQwEWJyizylJhgxRTzXxIh7FA5rPcQ==
X-Received: by 2002:a2e:9c85:: with SMTP id x5mr7289979lji.139.1563792665977; 
 Mon, 22 Jul 2019 03:51:05 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 z25sm5973252lfi.51.2019.07.22.03.51.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jul 2019 03:51:05 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>,
 Denis Obrezkov <denisobrezkov@gmail.com>, xen-devel@lists.xenproject.org
References: <8af4cfa481e24256b822f64efc6a0f45ae87cf65.1561750725.git.denisobrezkov@gmail.com>
 <a94734d2-ea51-3ba3-917b-e7cf21ace1d0@arm.com>
 <d304061e-f34e-d0e6-04a4-1a8bfc7414fa@gmail.com>
 <3261754d-f036-fbf1-d111-3ad10aa6f2eb@arm.com>
 <b2543b3f-a235-fc96-30f0-461de0458656@gmail.com>
 <375df026-85af-6c27-1dfb-ae1bccc0b2ab@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <234f2d7e-85bf-612e-fec2-61cbffecbd1f@gmail.com>
Date: Mon, 22 Jul 2019 13:51:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <375df026-85af-6c27-1dfb-ae1bccc0b2ab@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/arm: Switch OMAP5 secondary cores
 into hyp mode
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
Cc: hy-gsoc@hy-research.com, sstabellini@kernel.org,
 Iain Hunter <drhunter95@gmail.com>, andre.przywara@arm.com, tim@xen.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, baozich@gmail.com,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gSnVsaWVuLAoKSSBwdXQgbXkgdHdvIGNlbnRzIGluOgoKT24gMTguMDcuMTkgMTM6MDks
IEp1bGllbiBHcmFsbCB3cm90ZToKPiBPbiA3LzE3LzE5IDEwOjU1IFBNLCBEZW5pcyBPYnJlemtv
diB3cm90ZToKPj4gSGksCj4gSGksCj4gCj4+PiBXZWxsLCBYZW4gaGFzIGJlZW4gc3VwcG9ydGVk
IHRoZSBvbWFwNSBmb3IgcXVpdGUgYSB3aGlsZS4gU28gdGhlcmUgYXJlCj4+PiB0d28gcG9zc2li
aWxpdGllcyByZWdhcmRpbmcgdGhlIGN1cnJlbnQgU01QIGNvZGU6Cj4+PiDCoMKgwqAgMSkgSXQg
aXMgdG90YWxseSBicm9rZW4gYW5kIHRoZXJlZm9yZSBuZXZlciB3b3JrZWQgb24gYW55IG9tYXA1
Cj4+PiBwbGF0Zm9ybS4KPj4+IMKgwqDCoCAyKSBJdCB3b3JrcyBidXQgd2l0aCBtYXliZSBtb2Rp
ZmljYXRpb24gaW4gVS1ib290LgoKSXQgd29ya3Mgb24gSmFjaW50bzYgKGRyYTd4eCkgd2l0aCBt
b2RpZmljYXRpb25zIGluIHUtYm9vdC4gQXMgc3VnZ2VzdGVkIGluIDQ1NTdjMjI5Mjg1NGQwNDdi
YThlNDRhNjllMmQ2MGQ5OTUzM2QxNTUuIEknZCBjaXRlIHRoZSBtZXNzYWdlOgoKICAgICBBcyBw
YXJ0IG9mIHRoaXMgY2hhbmdlIGRyb3Agc3VwcG9ydCBmb3Igc3dpdGNoaW5nIGZyb20gc2VjdXJl
IG1vZGUgdG8gTlMgSFlQIGFzCiAgICAgd2VsbCBhcyB0aGUgZWFybHkgQ1BVIGtpY2suIFhlbiBu
b3cgcmVxdWlyZXMgdGhhdCBpdCBpcyBsYXVuY2hlZCBpbiBOUyBIWVAKICAgICBtb2RlIGFuZCB0
aGF0IGZpcm13YXJlIGNvbmZpZ3VyZSB0aGluZ3Mgc3VjaCB0aGF0IHNlY29uZGFyeSBDUFVzIGNh
biBiZSB3b2tlbgogICAgIHVwIGJ5IGEgcHJpbWFybHkgQ1BVIGluIEhZUCBtb2RlLiBUaGlzIG1h
eSByZXF1aXJlIGZpeGVzIHRvIGJvb3Rsb2FkZXJzIG9yIHRoZQogICAgIHVzZSBvZiBhIGJvb3Qg
d3JhcHBlci4KCkknbSBub3Qgc3VyZSB3aGF0IENoZW4gdXBzdHJlYW1lZCBmb3IgT01BUDUuIFBy
aW9yIHRvIDQ1NTdjMjI5MiB0aGVyZSBpcyBubyBtb2RlIHN3aXRjaCBjb2RlIGZvciBvbWFwNS4g
TWF5YmUsIGl0IHdhcyBhIHN3aXRjaCBpbiB1LWJvb3QgZnJvbSB0aGUgYmVnaW5uaW5nLgoKSWYg
d2UgYXJlIHRhbGtpbmcgYWJvdXQgYmVhZ2xlYm9hcmQteDE1IGl0IGhhcyBubyBPTUFQNSwgYnV0
IGhhcyBTaXRhcmEgQU01NzI4IFNvQy4gU3VycHJpc2luZ2x5LCBpbiBhbTU3eHgtYmVhZ2xlLXgx
NS1jb21tb24uZHRzaSwgSSBzZWUgdGhlIGZvbGxvd2luZzoKICAgICAKICAgICBjb21wYXRpYmxl
ID0gInRpLGFtNTcyeC1iZWFnbGUteDE1IiwgInRpLGFtNTcyOCIsICJ0aSxkcmE3NDIiLCAidGks
ZHJhNzQiLCAidGksZHJhNyI7CgpJIGd1ZXNzIHdlIGFsc28gbmVlZCBhbm90aGVyIHBhdGNoIHdo
aWNoIGFkZHMgInRpLGFtNTcyOCIgYXMgdGhlIHBsYXRmb3JtIHN1cHBvcnRlZCBieSBYRU4uCgo+
Pj4gTG9va2luZyBhdCB0aGUgbWFpbGluZyBsaXN0IGFyY2hpdmUgYW5kIHdpa2ksIEkgYmVsaWV2
ZSAyKSBpcyBjbG9zZXIgdG8KPj4+IHRoZSBjdXJyZW50IHJlYWxpdHkuIFNvIHRoaXMgcmFpc2Ug
dGhlIHF1ZXN0aW9uIHdoZXRoZXIgeW91ciBwYXRjaCB3aWxsCj4+PiBicmVhayBhbnkgZXhpc3Rp
bmcgc2V0dXAuCgpJJ2QgYmV0LCB0aGUgcGF0Y2ggd2lsbCBub3QgYnJlYWsgc3VwcG9ydCBvZiBh
bnkgZXhpc3Rpbmcgc2V0dXAuCk9NQVA1IGlzIGRpc2NvbnRpbnVlZCBsb25nIGFnby4KSmFjaW50
bzYgKGRyYTd4eCkgaXMgZnJvbSBhIGNvbnNlcnZhdGl2ZSBhdXRvbW90aXZlIHdvcmxkLiBFeGlz
dGluZyBzZXR1cHMgbGlrZWx5IHdvdWxkIG5vdCBiZSB1cGRhdGVkLiBBdCBsZWFzdCBibGluZGx5
LiAoSSBob3BlKS4KU2l0YXJhIFNvQydzIGFyZSBub3Qgc3VwcG9ydGVkIHlldC4KCj4gaWYgbm9u
ZSBpcyByZWNlaXZlZCB0aGVuIHBsZWFzZSBnbyBhaGVhZCByZXNlbmRpbmcgYSB2ZXJzaW9uIHdp
dGggbXkgYW5hbHlzaXMKCiBGcm9tIG15IHBvaW50IG9mIHZpZXcsIHRoZSBjb21taXQgbWVzc2Fn
ZSBzaG91bGQgZGVzY3JpYmUsIHRoYXQgd2UgYXJlIHN3aXRjaGluZyBmcm9tIHRoZSBtb2RlbCBz
dWdnZXN0ZWQgaW4gNDU1N2MyMjkyODU0ZDA0N2JhOGU0NGE2OWUyZDYwZDk5NTMzZDE1NSB0byBh
IGRpZmZlcmVudCBvbmUuIFdpdGggdGhlIGFwcHJvcHJpYXRlIHJlYXNvbmluZywgZS5nLiBhbGln
bmluZyB0byBMaW51eCBrZXJuZWwuCgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
