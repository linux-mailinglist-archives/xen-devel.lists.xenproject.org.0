Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A130216270B
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 14:22:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j42ng-0003s2-6n; Tue, 18 Feb 2020 13:20:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0+gE=4G=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1j42nf-0003rx-8e
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 13:20:31 +0000
X-Inumbo-ID: 6f1cca1b-5251-11ea-8180-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 6f1cca1b-5251-11ea-8180-12813bfff9fa;
 Tue, 18 Feb 2020 13:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582032029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/sFMMkb4e3qwBsA4b31ISSU5c6HT2zaacb/ZY1KC50I=;
 b=ZXpTxiqFGD/E408VgFbdmF1ylp4y+2zsPKD/OaQRnDUcMgTKAvlAoFQu9NmCSXLxbiTM00
 8fUPabku5zm89weaMJK9N0J/vUX9Mu9jz/TDjQ322XGgfkqFP++OBQaubOx1RFXxM45r39
 6pGphNZgFykP207t4wePAH36FFOoXbI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-r6XED1IzMIaMQBy-wHi--A-1; Tue, 18 Feb 2020 08:20:28 -0500
Received: by mail-wr1-f71.google.com with SMTP id u8so10809049wrp.10
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2020 05:20:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q0b3JmegZIBOrzOx6D2WeXg3Fr4IgL8v1odhEcx6GCw=;
 b=pP8lpKXRiVcpavEp74MUJDZhN5gdcJBYji1cYWS+MRab52TQq+yOGG57SsI94nZQi/
 y8ClBwBBXZiiJhgd1JDf5HEchWxhrhuc7n2Ki+d6fA4QlNQVbYy9/Itkg8sCOsX+VlhO
 WtaKb3kw1PXmz0Dkc9jwDhf1QZvjplfifphtmSHNEMpavT10HCV5mdFw6hR+TN5++NPx
 RO/KExb/4bNO8gNebEfbEW8DAp4FIfHtLcSg4ndxxwxHgWINRdCpkvYVycjfEbgPnLG0
 kGu3JK3pTq7tFswJpnl+0qYzS8MOvhPQid9uJ61Mn6n+lBZMcdmpK9fmjAWZlSvjzS8r
 WHuQ==
X-Gm-Message-State: APjAAAWs9wJv8b4zxXOD03d4mglvGGpardwR7TGMtq5Eyv3/XPVoBGyB
 pmfpKFijHMUMuOgkoovfgi35s4Dv/jRFYnBBt7CUNZsjHYN2Xbvx5/yKAWtMxdrXeg4ptoXY7EF
 ZnzHxBHSjCgwqtPgK1d6CTNcyWFw=
X-Received: by 2002:adf:f491:: with SMTP id l17mr31157132wro.149.1582032025092; 
 Tue, 18 Feb 2020 05:20:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqyKkQEDaHDISgH6qvq3pjfhjQ41Yebtgf20dAvgvUG3VIO2Qwt5nwgZHZ29Nv8QGZy+aHbmpw==
X-Received: by 2002:adf:f491:: with SMTP id l17mr31157097wro.149.1582032024834; 
 Tue, 18 Feb 2020 05:20:24 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id m68sm3531219wme.48.2020.02.18.05.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 05:20:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 18 Feb 2020 14:20:23 +0100
Message-Id: <20200218132023.22936-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-MC-Unique: r6XED1IzMIaMQBy-wHi--A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Xen-devel] [PATCH] Avoid cpu_physical_memory_rw() with a constant
 is_write argument
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBjb21taXQgd2FzIHByb2R1Y2VkIHdpdGggdGhlIGluY2x1ZGVkIENvY2NpbmVsbGUgc2Ny
aXB0CnNjcmlwdHMvY29jY2luZWxsZS9hcy1ydy1jb25zdC5wYXRjaC4KCkluc3BpcmVkLWJ5OiBQ
ZXRlciBNYXlkZWxsIDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6IFBo
aWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KLS0tCkJhc2VkLW9uOiA8
MjAyMDAyMTgxMTI0NTcuMjI3MTItMS1wZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+CgpNYXliZSBj
YW4gYmUgc3F1YXNoZWQgaW4gUGV0ZXIncyBwYXRjaD8KCkNvY2NpIHNjcmlwdCBjYW4gYmUgd3Jp
dHRlbiBhczoKCiAgICBAQAogICAgZXhwcmVzc2lvbiBFMSwgRTIsIEUzLCBFNCwgRTU7CiAgICBz
eW1ib2wgdHJ1ZSwgZmFsc2U7CiAgICBAQAogICAgKAogICAgLSBhZGRyZXNzX3NwYWNlX3J3KEUx
LCBFMiwgRTMsIEU0LCBFNSwgZmFsc2UpCiAgICArIGFkZHJlc3Nfc3BhY2VfcmVhZChFMSwgRTIs
IEUzLCBFNCwgRTUpCiAgICB8CiAgICAtIGFkZHJlc3Nfc3BhY2VfcncoRTEsIEUyLCBFMywgRTQs
IEU1LCAwKQogICAgKyBhZGRyZXNzX3NwYWNlX3JlYWQoRTEsIEUyLCBFMywgRTQsIEU1KQogICAg
fAogICAgLSBhZGRyZXNzX3NwYWNlX3J3KEUxLCBFMiwgRTMsIEU0LCBFNSwgdHJ1ZSkKICAgICsg
YWRkcmVzc19zcGFjZV93cml0ZShFMSwgRTIsIEUzLCBFNCwgRTUpCiAgICB8CiAgICAtIGFkZHJl
c3Nfc3BhY2VfcncoRTEsIEUyLCBFMywgRTQsIEU1LCAxKQogICAgKyBhZGRyZXNzX3NwYWNlX3dy
aXRlKEUxLCBFMiwgRTMsIEU0LCBFNSkKICAgICkKCiAgICBAQAogICAgZXhwcmVzc2lvbiBFMSwg
RTIsIEUzOwogICAgQEAKICAgICgKICAgIC0gY3B1X3BoeXNpY2FsX21lbW9yeV9ydyhFMSwgRTIs
IEUzLCBmYWxzZSkKICAgICsgY3B1X3BoeXNpY2FsX21lbW9yeV9yZWFkKEUxLCBFMiwgRTMpCiAg
ICB8CiAgICAtIGNwdV9waHlzaWNhbF9tZW1vcnlfcncoRTEsIEUyLCBFMywgMCkKICAgICsgY3B1
X3BoeXNpY2FsX21lbW9yeV9yZWFkKEUxLCBFMiwgRTMpCiAgICB8CiAgICAtIGNwdV9waHlzaWNh
bF9tZW1vcnlfcncoRTEsIEUyLCBFMywgdHJ1ZSkKICAgICsgY3B1X3BoeXNpY2FsX21lbW9yeV93
cml0ZShFMSwgRTIsIEUzKQogICAgfAogICAgLSBjcHVfcGh5c2ljYWxfbWVtb3J5X3J3KEUxLCBF
MiwgRTMsIDEpCiAgICArIGNwdV9waHlzaWNhbF9tZW1vcnlfd3JpdGUoRTEsIEUyLCBFMykKICAg
ICkKLS0tCiBody94ZW4veGVuX3B0X2dyYXBoaWNzLmMgICAgICAgICAgICAgfCAgMiArLQogdGFy
Z2V0L2kzODYvaGF4LWFsbC5jICAgICAgICAgICAgICAgIHwgIDQgKystLQogc2NyaXB0cy9jb2Nj
aW5lbGxlL2FzX3J3X2NvbnN0LmNvY2NpIHwgMjAgKysrKysrKysrKysrKysrKysrKy0KIDMgZmls
ZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9ody94ZW4veGVuX3B0X2dyYXBoaWNzLmMgYi9ody94ZW4veGVuX3B0X2dyYXBoaWNzLmMKaW5k
ZXggYjY5NzMyNzI5Yi4uYTNiYzdlMzkyMSAxMDA2NDQKLS0tIGEvaHcveGVuL3hlbl9wdF9ncmFw
aGljcy5jCisrKyBiL2h3L3hlbi94ZW5fcHRfZ3JhcGhpY3MuYwpAQCAtMjIyLDcgKzIyMiw3IEBA
IHZvaWQgeGVuX3B0X3NldHVwX3ZnYShYZW5QQ0lQYXNzdGhyb3VnaFN0YXRlICpzLCBYZW5Ib3N0
UENJRGV2aWNlICpkZXYsCiAgICAgfQogCiAgICAgLyogQ3VycmVudGx5IHdlIGZpeGVkIHRoaXMg
YWRkcmVzcyBhcyBhIHByaW1hcnkgZm9yIGxlZ2FjeSBCSU9TLiAqLwotICAgIGNwdV9waHlzaWNh
bF9tZW1vcnlfcncoMHhjMDAwMCwgYmlvcywgYmlvc19zaXplLCAxKTsKKyAgICBjcHVfcGh5c2lj
YWxfbWVtb3J5X3dyaXRlKDB4YzAwMDAsIGJpb3MsIGJpb3Nfc2l6ZSk7CiB9CiAKIHVpbnQzMl90
IGlnZF9yZWFkX29wcmVnaW9uKFhlblBDSVBhc3N0aHJvdWdoU3RhdGUgKnMpCmRpZmYgLS1naXQg
YS90YXJnZXQvaTM4Ni9oYXgtYWxsLmMgYi90YXJnZXQvaTM4Ni9oYXgtYWxsLmMKaW5kZXggYThi
NmU1YWViOC4uZjU5NzFjY2M3NCAxMDA2NDQKLS0tIGEvdGFyZ2V0L2kzODYvaGF4LWFsbC5jCisr
KyBiL3RhcmdldC9pMzg2L2hheC1hbGwuYwpAQCAtMzc2LDggKzM3Niw4IEBAIHN0YXRpYyBpbnQg
aGF4X2hhbmRsZV9mYXN0bW1pbyhDUFVBcmNoU3RhdGUgKmVudiwgc3RydWN0IGhheF9mYXN0bW1p
byAqaGZ0KQogICAgICAgICAgKiAgaGZ0LT5kaXJlY3Rpb24gPT0gMjogZ3BhID09PiBncGEyCiAg
ICAgICAgICAqLwogICAgICAgICB1aW50NjRfdCB2YWx1ZTsKLSAgICAgICAgY3B1X3BoeXNpY2Fs
X21lbW9yeV9ydyhoZnQtPmdwYSwgKHVpbnQ4X3QgKikgJnZhbHVlLCBoZnQtPnNpemUsIDApOwot
ICAgICAgICBjcHVfcGh5c2ljYWxfbWVtb3J5X3J3KGhmdC0+Z3BhMiwgKHVpbnQ4X3QgKikgJnZh
bHVlLCBoZnQtPnNpemUsIDEpOworICAgICAgICBjcHVfcGh5c2ljYWxfbWVtb3J5X3JlYWQoaGZ0
LT5ncGEsICh1aW50OF90ICopJnZhbHVlLCBoZnQtPnNpemUpOworICAgICAgICBjcHVfcGh5c2lj
YWxfbWVtb3J5X3dyaXRlKGhmdC0+Z3BhMiwgKHVpbnQ4X3QgKikmdmFsdWUsIGhmdC0+c2l6ZSk7
CiAgICAgfQogCiAgICAgcmV0dXJuIDA7CmRpZmYgLS1naXQgYS9zY3JpcHRzL2NvY2NpbmVsbGUv
YXNfcndfY29uc3QuY29jY2kgYi9zY3JpcHRzL2NvY2NpbmVsbGUvYXNfcndfY29uc3QuY29jY2kK
aW5kZXggMzBkYTcwNzcwMS4uYzlhMzlmMWFiZSAxMDA2NDQKLS0tIGEvc2NyaXB0cy9jb2NjaW5l
bGxlL2FzX3J3X2NvbnN0LmNvY2NpCisrKyBiL3NjcmlwdHMvY29jY2luZWxsZS9hc19yd19jb25z
dC5jb2NjaQpAQCAtMSw2ICsxLDYgQEAKIC8vIEF2b2lkIHVzZXMgb2YgYWRkcmVzc19zcGFjZV9y
dygpIHdpdGggYSBjb25zdGFudCBpc193cml0ZSBhcmd1bWVudC4KIC8vIFVzYWdlOgotLy8gIHNw
YXRjaCAtLXNwLWZpbGUgYXMtcnctY29uc3Quc3BhdGNoIC0tZGlyIC4gLS1pbi1wbGFjZQorLy8g
IHNwYXRjaCAtLXNwLWZpbGUgc2NyaXB0cy9jb2NjaW5lbGxlL2FzX3J3X2NvbnN0LmNvY2NpIC0t
ZGlyIC4gLS1pbi1wbGFjZQogCiBAQAogZXhwcmVzc2lvbiBFMSwgRTIsIEUzLCBFNCwgRTU7CkBA
IC0yOCwzICsyOCwyMSBAQCBleHByZXNzaW9uIEUxLCBFMiwgRTMsIEU0LCBFNTsKIAogLSBhZGRy
ZXNzX3NwYWNlX3J3KEUxLCBFMiwgRTMsIEU0LCBFNSwgMSkKICsgYWRkcmVzc19zcGFjZV93cml0
ZShFMSwgRTIsIEUzLCBFNCwgRTUpCisKKy8vIEF2b2lkIHVzZXMgb2YgY3B1X3BoeXNpY2FsX21l
bW9yeV9ydygpIHdpdGggYSBjb25zdGFudCBpc193cml0ZSBhcmd1bWVudC4KK0BACitleHByZXNz
aW9uIEUxLCBFMiwgRTM7CitAQAorKAorLSBjcHVfcGh5c2ljYWxfbWVtb3J5X3J3KEUxLCBFMiwg
RTMsIGZhbHNlKQorKyBjcHVfcGh5c2ljYWxfbWVtb3J5X3JlYWQoRTEsIEUyLCBFMykKK3wKKy0g
Y3B1X3BoeXNpY2FsX21lbW9yeV9ydyhFMSwgRTIsIEUzLCAwKQorKyBjcHVfcGh5c2ljYWxfbWVt
b3J5X3JlYWQoRTEsIEUyLCBFMykKK3wKKy0gY3B1X3BoeXNpY2FsX21lbW9yeV9ydyhFMSwgRTIs
IEUzLCB0cnVlKQorKyBjcHVfcGh5c2ljYWxfbWVtb3J5X3dyaXRlKEUxLCBFMiwgRTMpCit8Cist
IGNwdV9waHlzaWNhbF9tZW1vcnlfcncoRTEsIEUyLCBFMywgMSkKKysgY3B1X3BoeXNpY2FsX21l
bW9yeV93cml0ZShFMSwgRTIsIEUzKQorKQotLSAKMi4yMS4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
