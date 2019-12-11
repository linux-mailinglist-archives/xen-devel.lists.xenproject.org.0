Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0391211BB33
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 19:14:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1if6Rb-0000Ak-Ll; Wed, 11 Dec 2019 18:10:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qa45=2B=gmail.com=sj38.park@srs-us1.protection.inumbo.net>)
 id 1if6RZ-0000Af-UA
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 18:10:37 +0000
X-Inumbo-ID: 88147fd6-1c41-11ea-b6f1-bc764e2007e4
Received: from mail-pg1-x542.google.com (unknown [2607:f8b0:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 88147fd6-1c41-11ea-b6f1-bc764e2007e4;
 Wed, 11 Dec 2019 18:10:37 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id a33so10915372pgm.5
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2019 10:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mc5ORNKDsv0ygGReB4brTZGP+nxF11a/con+3NutTy4=;
 b=Y79caoQ+lf7odw5APsp3kG+n/VzcsE2Qqxe+syQlgY/qPzHq6ZuRTkiyKhd6DRW3Ux
 f4D/PUQOZcZY+iqmcLRNz3NnTUHT7PfjJQBcLCnI2aqkwYC64sKRpzJdOHX7b974Fy+x
 vxhGhp7bD2wQgNDZqFK9859BBc+84xXdvvvgdiGw6b5OUf1XDwn5eIUu3Nd+OLcaHVXu
 eRQr7P/kICKCCL5Wa5S4U2wDcXekrBpZXOQ4jN149MsLmob8X+xfSLm6HCI8UNCzgpZ7
 XA23ImjbBjjHw/kDa///ygXqgIGoJ+g+oRi7pYN8mJ16gu5Nfl1yCDGyEiwtZ/QuogJT
 hYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mc5ORNKDsv0ygGReB4brTZGP+nxF11a/con+3NutTy4=;
 b=rEshB2HiEmhh++W8Im5wELX1QOPkrPAYndEZKOMA+DCdYH4VQjOdFg7FifpxA+XU2d
 oJxYmojFS+Cj/59M1DJr54g6SdOWv/A1+u61N5JBM3BttUyIzHVy4kTD3IDOMlz/AONu
 zDWAKw3HqxcyYUEvQwGUVuF2Eje3a9s89jxPjcF2t8dF7Nd039XFIei3Ay02laMuLYau
 JdfVRGToejYM+8o/Jcx9AZ30fSLtOkB6HoW3TjekGl6gULCgS5Y92wlsCoWCLN6aGbOg
 dB20yPL8DRnW7/TwlHhECJOw2txsJhah0D6XrBPaFsVh6yc+qpjati19s6MuzOSTDhgN
 Me3g==
X-Gm-Message-State: APjAAAXplwuMbIKfm9hhYsc9Zpn+mIxC9Fh4W1RJSJqrXVOmvOtnWoVP
 6Q7N0VTk7w49+W1VUCTYWQg=
X-Google-Smtp-Source: APXvYqxtH9H0dIabNUHI+R3GKkz0i7Pm3NwtvvVOQDnlczdsWX81V7kBBojdi2NWi9DqBPYpZqFihA==
X-Received: by 2002:a63:4723:: with SMTP id u35mr5415175pga.194.1576087836383; 
 Wed, 11 Dec 2019 10:10:36 -0800 (PST)
Received: from localhost.localdomain (campus-094-212.ucdavis.edu.
 [168.150.94.212])
 by smtp.gmail.com with ESMTPSA id x33sm3552651pga.86.2019.12.11.10.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2019 10:10:35 -0800 (PST)
From: SeongJae Park <sj38.park@gmail.com>
X-Google-Original-From: SeongJae Park <sjpark@amazon.de>
To: jgross@suse.com, axboe@kernel.dk, konrad.wilk@oracle.com,
 roger.pau@citrix.com
Date: Wed, 11 Dec 2019 18:10:13 +0000
Message-Id: <20191211181016.14366-1-sjpark@amazon.de>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v7 0/2] xenbus/backend: Add a memory pressure
 handler callback
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
Cc: linux-block@vger.kernel.org, sjpark@amazon.com, pdurrant@amazon.com,
 SeongJae Park <sjpark@amazon.de>, linux-kernel@vger.kernel.org,
 sj38.park@gmail.com, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

R3JhbnRpbmcgcGFnZXMgY29uc3VtZXMgYmFja2VuZCBzeXN0ZW0gbWVtb3J5LiAgSW4gc3lzdGVt
cyBjb25maWd1cmVkCndpdGggaW5zdWZmaWNpZW50IHNwYXJlIG1lbW9yeSBmb3IgdGhvc2UgcGFn
ZXMsIGl0IGNhbiBjYXVzZSBhIG1lbW9yeQpwcmVzc3VyZSBzaXR1YXRpb24uICBIb3dldmVyLCBm
aW5kaW5nIHRoZSBvcHRpbWFsIGFtb3VudCBvZiB0aGUgc3BhcmUKbWVtb3J5IGlzIGNoYWxsZW5n
aW5nIGZvciBsYXJnZSBzeXN0ZW1zIGhhdmluZyBkeW5hbWljIHJlc291cmNlCnV0aWxpemF0aW9u
IHBhdHRlcm5zLiAgQWxzbywgc3VjaCBhIHN0YXRpYyBjb25maWd1cmF0aW9uIG1pZ2h0IGxhY2sK
ZmxleGliaWxpdHkuCgpUbyBtaXRpZ2F0ZSBzdWNoIHByb2JsZW1zLCB0aGlzIHBhdGNoc2V0IGFk
ZHMgYSBtZW1vcnkgcmVjbGFpbSBjYWxsYmFjawp0byAneGVuYnVzX2RyaXZlcicgKHBhdGNoIDEp
IGFuZCB1c2UgaXQgdG8gbWl0aWdhdGUgdGhlIHByb2JsZW0gaW4KJ3hlbi1ibGtiYWNrJyAocGF0
Y2ggMikuICBUaGUgdGhpcmQgcGF0Y2ggaXMgYSB0cml2aWFsIGNsZWFudXAgb2YKdmFyaWFibGUg
bmFtZXMuCgpCYXNlIFZlcnNpb24KLS0tLS0tLS0tLS0tCgpUaGlzIHBhdGNoIGlzIGJhc2VkIG9u
IHY1LjQuICBBIGNvbXBsZXRlIHRyZWUgaXMgYWxzbyBhdmFpbGFibGUgYXQgbXkKcHVibGljIGdp
dCByZXBvOgpodHRwczovL2dpdGh1Yi5jb20vc2pwMzgvbGludXgvdHJlZS9ibGtiYWNrX3NxdWVl
emluZ192NwoKClBhdGNoIEhpc3RvcnkKLS0tLS0tLS0tLS0tLQoKQ2hhbmdlcyBmcm9tIHY2Ciho
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1ibG9jay8yMDE5MTIxMTA0MjQyOC41OTYxLTEt
c2pwYXJrQGFtYXpvbi5kZS8pCiAtIFJlbW92ZSBtb3JlIHVubmVjZXNzYXJ5IHByZWZpeGVzIChz
dWdnZXN0ZWQgYnkgUm9nZXIgUGF1IE1vbm7DqSkKIC0gQ29uc3RpZnkgYSB2YXJpYWJsZSAoc3Vn
Z2VzdGVkIGJ5IFJvZ2VyIFBhdSBNb25uw6kpCiAtIFJlbmFtZSAncmVjbGFpbScgaW50byAncmVj
bGFpbV9tZW1vcnknIChzdWdnZXN0ZWQgYnkgUm9nZXIgUGF1IE1vbm7DqSkKIC0gTW9yZSB3b3Jk
c21pdGggb2YgdGhlIGNvbW1pdCBtZXNzYWdlIChzdWdnZXN0ZWQgYnkgUm9nZXIgUGF1IE1vbm7D
qSkKCkNoYW5nZXMgZnJvbSB2NQooaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYmxvY2sv
MjAxOTEyMTAwODA2MjguNTI2NC0xLXNqcGFya0BhbWF6b24uZGUvKQogLSBXb3Jkc21pdGggdGhl
IGNvbW1pdCBtZXNzYWdlcyAoc3VnZ2VzdGVkIGJ5IFJvZ2VyIFBhdSBNb25uw6kpCiAtIENoYW5n
ZSB0aGUgcmVjbGFpbSBjYWxsYmFjayByZXR1cm4gdHlwZSAoc3VnZ2VzdGVkIGJ5IFJvZ2VyIFBh
dSBNb25uw6kpCiAtIENoYW5nZSB0aGUgdHlwZSBvZiB0aGUgYmxrYmFjayBzcXVlZXplIGR1cmF0
aW9uIHZhcmlhYmxlCiAgIChzdWdnZXN0ZWQgYnkgUm9nZXIgUGF1IE1vbm7DqSkKIC0gQWRkIGEg
cGF0Y2ggZm9yIHJlbW92YWwgb2YgdW5uZWNlc3Nhcnkgc3RhdGljIHZhcmlhYmxlIG5hbWUgcHJl
Zml4ZXMKICAgKHN1Z2dlc3RlZCBieSBSb2dlciBQYXUgTW9ubsOpKQogLSBGaXggY2hlY2twYXRj
aC5wbCB3YXJuaW5ncwoKQ2hhbmdlcyBmcm9tIHY0CihodHRwczovL2xvcmUua2VybmVsLm9yZy94
ZW4tZGV2ZWwvMjAxOTEyMDkxOTQzMDUuMjA4MjgtMS1zanBhcmtAYW1hem9uLmNvbS8pCiAtIFJl
bW92ZSBkb21haW4gaWQgcGFyYW1ldGVyIGZyb20gdGhlIGNhbGxiYWNrIChzdWdnZXN0ZWQgYnkg
SnVlcmdlbiBHcm9zcykKIC0gUmVuYW1lIHhlbi1ibGtiYWNrIG1vZHVsZSBwYXJhbWV0ZXIgKHN1
Z2dlc3RlZCBieSBTdGVmYW4gTnVlcm5idXJnZXIpCgpDaGFuZ2VzIGZyb20gdjMKKGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3hlbi1kZXZlbC8yMDE5MTIwOTA4NTgzOS4yMTIxNS0xLXNqcGFya0Bh
bWF6b24uY29tLykKIC0gQWRkIGdlbmVyYWwgY2FsbGJhY2sgaW4geGVuX2RyaXZlciBhbmQgdXNl
IGl0IChzdWdnZXN0ZWQgYnkgSnVlcmdlbiBHcm9zcykKCkNoYW5nZXMgZnJvbSB2MgooaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYmxvY2svYWYxOTUwMzMtMjNkNS0zOGVkLWI3M2ItZjZl
MmUzYjM0NTQxQGFtYXpvbi5jb20pCiAtIFJlbmFtZSB0aGUgbW9kdWxlIHBhcmFtZXRlciBhbmQg
dmFyaWFibGVzIGZvciBicmV2aXR5CiAgIChhZ2dyZXNzaXZlIHNocmlua2luZyAtPiBzcXVlZXpp
bmcpCgpDaGFuZ2VzIGZyb20gdjEKKGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3hlbi1kZXZlbC8y
MDE5MTIwNDExMzQxOS4yMjk4LTEtc2pwYXJrQGFtYXpvbi5jb20vKQogLSBBZGp1c3QgdGhlIGRl
c2NyaXB0aW9uIHRvIG5vdCB1c2UgdGhlIHRlcm0sIGBhcmJpdHJhcmlseWAKICAgKHN1Z2dlc3Rl
ZCBieSBQYXVsIER1cnJhbnQpCiAtIFNwZWNpZnkgdGltZSB1bml0IG9mIHRoZSBkdXJhdGlvbiBp
biB0aGUgcGFyYW1ldGVyIGRlc2NyaXB0aW9uLAogICAoc3VnZ2VzdGVkIGJ5IE1heGltaWxpYW4g
SGV5bmUpCiAtIENoYW5nZSBkZWZhdWx0IGFnZ3Jlc3NpdmUgc2hyaW5raW5nIGR1cmF0aW9uIGZy
b20gMW1zIHRvIDEwbXMKIC0gTWVyZ2UgdHdvIHBhdGNoZXMgaW50byBvbmUgc2luZ2xlIHBhdGNo
CgpTZW9uZ0phZSBQYXJrICgyKToKICB4ZW5idXMvYmFja2VuZDogQWRkIG1lbW9yeSBwcmVzc3Vy
ZSBoYW5kbGVyIGNhbGxiYWNrCiAgeGVuL2Jsa2JhY2s6IFNxdWVlemUgcGFnZSBwb29scyBpZiBh
IG1lbW9yeSBwcmVzc3VyZSBpcyBkZXRlY3RlZAoKIGRyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2sv
YmxrYmFjay5jICAgICAgIHwgMjMgKysrKysrKysrKysrKysrLS0KIGRyaXZlcnMvYmxvY2sveGVu
LWJsa2JhY2svY29tbW9uLmggICAgICAgIHwgIDEgKwogZHJpdmVycy9ibG9jay94ZW4tYmxrYmFj
ay94ZW5idXMuYyAgICAgICAgfCAgMyArKy0KIGRyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJv
YmVfYmFja2VuZC5jIHwgMzEgKysrKysrKysrKysrKysrKysrKysrKysKIGluY2x1ZGUveGVuL3hl
bmJ1cy5oICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwogNSBmaWxlcyBjaGFuZ2VkLCA1NiBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
