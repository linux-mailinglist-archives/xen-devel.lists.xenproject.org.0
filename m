Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AA94C1BC
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 21:53:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdgaZ-0000Ll-UL; Wed, 19 Jun 2019 19:49:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pFJR=US=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1hdgaY-0000L1-Rl
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 19:49:46 +0000
X-Inumbo-ID: 62d11ac9-92cb-11e9-8980-bc764e045a96
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 62d11ac9-92cb-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 19:49:45 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id 136so550157lfa.8
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jun 2019 12:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pIP9mPnn/DAJ3cZCzOpx5LWimmJhRp/swBnea5FtXOM=;
 b=jtliA6tR9FNRc/taHqDjWaj53A1P3DDwc5Ne1hiV5fifl8zWFhVMdflBpqNo1RvB7D
 opD12UdQLecdqAEMIvBWNdnkX+B0v+BMtdcMu6CxSHbRJG0hbxJaT9Gud7I70ZMRPyN1
 sXZAFrtSIFJcfRUJMCnc2yCo/sX8vto0UX3g9rR4HAMyOhDjm/Oqqy1XTmdbBCo4RU6s
 EgopYopusvt6jjf3/awC7zA32ENJBOI0zfxIGn8qdqeIkx6w1Ir58Ff//mE+G+D8dvPC
 TwZquPxZ97U+yNC8wAV+LfmMEHPYgu6UZacnlHxTNbylRAD1LKAt5cP/9pNeEGcnak5R
 aOsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pIP9mPnn/DAJ3cZCzOpx5LWimmJhRp/swBnea5FtXOM=;
 b=lgWoyG+zN5uGn7qwtUlZ6QsvWOX1pdokkgaKVUET2hsXHKOGn7OhQ3fM2awrlZtDW+
 SInh4bCTpzFM9A5QTBiPI/ZO6btJV9eiaJGP9wtxdy598wTYtU9L7cKF8ZZJnSLnR5v0
 NzTTT2jiQjnUqwuYtuDTuwpFY4Jq4S1EAS8zq8FNfHmknb3/CG+P5TnPQI2jJsC4HKu+
 VFuuGXeecEvY1voy7vduWH8YJPkR6Rj7W5rbtJ1+6QogMjTWUoY4g/BxlTY/9BXHPqvm
 UOg0JfAgd2qJk0TZbTsLA0Kit9Fpayf2w7/DoWA/KC3+FrGkDgY79GbR8GtQJU+wW3F3
 OHhA==
X-Gm-Message-State: APjAAAVXnG4K5MfeTpKLOqLKCfMfsY2ISFsDpy0d12381RQgg+2dzKKp
 oB14u98k9sszm/UfhJPHWo+BK15QjxD9iiq54G4=
X-Google-Smtp-Source: APXvYqweKl9VI06RjZeqD1UykaHHa9/mWok+gZcMtfHVEIDpNBejtWowracURBId+N+QhLlZCxAVEr3PoSjhA+ruAiQ=
X-Received: by 2002:a19:5515:: with SMTP id n21mr6350026lfe.26.1560973784065; 
 Wed, 19 Jun 2019 12:49:44 -0700 (PDT)
MIME-Version: 1.0
References: <4b6949fb8d84a255898ca4b285526f6513513371.1560888454.git.tsirakisn@ainfosec.com>
In-Reply-To: <4b6949fb8d84a255898ca4b285526f6513513371.1560888454.git.tsirakisn@ainfosec.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Wed, 19 Jun 2019 12:49:32 -0700
Message-ID: <CACMJ4GYPX6Y5ZP9++reFsrhk3sxSokdExkVuLNisf6w_dx0BUQ@mail.gmail.com>
To: Nicholas Tsirakis <niko.tsirakis@gmail.com>
Subject: Re: [Xen-devel] [PATCH] argo: suppress select logging messages
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Nicholas Tsirakis <tsirakisn@ainfosec.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMToxMCBQTSBOaWNob2xhcyBUc2lyYWtpcwo8bmlrby50
c2lyYWtpc0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gU29tZSBsb2dnaW5nIG1lc3NhZ2VzIG1hZGUg
bW9yZSBzZW5zZSBhcyBhcmdvIGRlYnVnCj4gbG9ncyByYXRoZXIgdGhhbiBzdGFuZGFyZCBYZW4g
bG9ncy4gVXNlIGFyZ29fZHByaW50awo+IHRvIG9ubHkgcHJpbnQgdGhpcyBpbmZvIGlmIGFyZ28g
REVCVUcgaXMgZW5hYmxlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IE5pY2hvbGFzIFRzaXJha2lzIDx0
c2lyYWtpc25AYWluZm9zZWMuY29tPgpSZXZpZXdlZC1ieTogQ2hyaXN0b3BoZXIgQ2xhcmsgPGNo
cmlzdG9waGVyLncuY2xhcmtAZ21haWwuY29tPgoKPiAtLS0KPiAgeGVuL2NvbW1vbi9hcmdvLmMg
fCA5ICsrKystLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0
aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vYXJnby5jIGIveGVuL2NvbW1vbi9h
cmdvLmMKPiBpbmRleCBjOGY0MzAyOTYzLi41OWI2NTVmNGM4IDEwMDY0NAo+IC0tLSBhL3hlbi9j
b21tb24vYXJnby5jCj4gKysrIGIveGVuL2NvbW1vbi9hcmdvLmMKPiBAQCAtMTQ1Niw3ICsxNDU2
LDcgQEAgZmluZF9yaW5nX21mbnMoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGFyZ29fcmluZ19p
bmZvICpyaW5nX2luZm8sCj4gICAgICBpZiAoIHJpbmdfaW5mby0+bWZucyApCj4gICAgICB7Cj4g
ICAgICAgICAgLyogUmluZyBhbHJlYWR5IGV4aXN0ZWQ6IGRyb3AgdGhlIHByZXZpb3VzIG1hcHBp
bmcuICovCj4gLSAgICAgICAgZ3ByaW50ayhYRU5MT0dfSU5GTywgImFyZ286IHZtJXUgcmUtcmVn
aXN0ZXIgZXhpc3RpbmcgcmluZyAiCj4gKyAgICAgICAgYXJnb19kcHJpbnRrKCJhcmdvOiB2bSV1
IHJlLXJlZ2lzdGVyIGV4aXN0aW5nIHJpbmcgIgo+ICAgICAgICAgICAgICAgICAgIih2bSV1OiV4
IHZtJXUpIGNsZWFycyBtYXBwaW5nXG4iLAo+ICAgICAgICAgICAgICAgICAgZC0+ZG9tYWluX2lk
LCByaW5nX2luZm8tPmlkLmRvbWFpbl9pZCwKPiAgICAgICAgICAgICAgICAgIHJpbmdfaW5mby0+
aWQuYXBvcnQsIHJpbmdfaW5mby0+aWQucGFydG5lcl9pZCk7Cj4gQEAgLTE1MTYsNyArMTUxNiw3
IEBAIGZpbmRfcmluZ19tZm5zKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBhcmdvX3JpbmdfaW5m
byAqcmluZ19pbmZvLAo+ICAgICAgewo+ICAgICAgICAgIEFTU0VSVChyaW5nX2luZm8tPm5tZm5z
ID09IE5QQUdFU19SSU5HKGxlbikpOwo+Cj4gLSAgICAgICAgZ3ByaW50ayhYRU5MT0dfREVCVUcs
ICJhcmdvOiB2bSV1IHJpbmcgKHZtJXU6JXggdm0ldSkgJXAgIgo+ICsgICAgICAgIGFyZ29fZHBy
aW50aygiYXJnbzogdm0ldSByaW5nICh2bSV1OiV4IHZtJXUpICVwICIKPiAgICAgICAgICAgICAg
ICAgICJtZm5fbWFwcGluZyAlcCBsZW4gJXUgbm1mbnMgJXVcbiIsCj4gICAgICAgICAgICAgICAg
ICBkLT5kb21haW5faWQsIHJpbmdfaW5mby0+aWQuZG9tYWluX2lkLAo+ICAgICAgICAgICAgICAg
ICAgcmluZ19pbmZvLT5pZC5hcG9ydCwgcmluZ19pbmZvLT5pZC5wYXJ0bmVyX2lkLCByaW5nX2lu
Zm8sCj4gQEAgLTE3MzAsNyArMTczMCw3IEBAIHJlZ2lzdGVyX3Jpbmcoc3RydWN0IGRvbWFpbiAq
Y3VycmQsCj4gICAgICAgICAgbGlzdF9hZGQoJnJpbmdfaW5mby0+bm9kZSwKPiAgICAgICAgICAg
ICAgICAgICAmY3VycmQtPmFyZ28tPnJpbmdfaGFzaFtoYXNoX2luZGV4KCZyaW5nX2luZm8tPmlk
KV0pOwo+Cj4gLSAgICAgICAgZ3ByaW50ayhYRU5MT0dfREVCVUcsICJhcmdvOiB2bSV1IHJlZ2lz
dGVyaW5nIHJpbmcgKHZtJXU6JXggdm0ldSlcbiIsCj4gKyAgICAgICAgYXJnb19kcHJpbnRrKCJh
cmdvOiB2bSV1IHJlZ2lzdGVyaW5nIHJpbmcgKHZtJXU6JXggdm0ldSlcbiIsCj4gICAgICAgICAg
ICAgICAgICBjdXJyZC0+ZG9tYWluX2lkLCByaW5nX2lkLmRvbWFpbl9pZCwgcmluZ19pZC5hcG9y
dCwKPiAgICAgICAgICAgICAgICAgIHJpbmdfaWQucGFydG5lcl9pZCk7Cj4gICAgICB9Cj4gQEAg
LTE3NzAsOCArMTc3MCw3IEBAIHJlZ2lzdGVyX3Jpbmcoc3RydWN0IGRvbWFpbiAqY3VycmQsCj4g
ICAgICAgICAgICAgIGdvdG8gb3V0X3VubG9jazI7Cj4gICAgICAgICAgfQo+Cj4gLSAgICAgICAg
Z3ByaW50ayhYRU5MT0dfREVCVUcsCj4gLSAgICAgICAgICAgICAgICAiYXJnbzogdm0ldSByZS1y
ZWdpc3RlcmluZyBleGlzdGluZyByaW5nICh2bSV1OiV4IHZtJXUpXG4iLAo+ICsgICAgICAgIGFy
Z29fZHByaW50aygiYXJnbzogdm0ldSByZS1yZWdpc3RlcmluZyBleGlzdGluZyByaW5nICh2bSV1
OiV4IHZtJXUpXG4iLAo+ICAgICAgICAgICAgICAgICAgY3VycmQtPmRvbWFpbl9pZCwgcmluZ19p
ZC5kb21haW5faWQsIHJpbmdfaWQuYXBvcnQsCj4gICAgICAgICAgICAgICAgICByaW5nX2lkLnBh
cnRuZXJfaWQpOwo+ICAgICAgfQo+IC0tCj4gMi4xNy4xCj4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
