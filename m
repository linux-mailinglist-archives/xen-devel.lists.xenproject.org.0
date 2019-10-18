Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B35D1DC0A8
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2019 11:14:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLOHK-0006sY-KG; Fri, 18 Oct 2019 09:10:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vaxl=YL=gmail.com=wei.liu.linux@srs-us1.protection.inumbo.net>)
 id 1iLOHJ-0006sT-8J
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2019 09:10:33 +0000
X-Inumbo-ID: 21856dbe-f187-11e9-93dc-12813bfff9fa
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 21856dbe-f187-11e9-93dc-12813bfff9fa;
 Fri, 18 Oct 2019 09:10:30 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id f22so5324278wmc.2
 for <xen-devel@lists.xenproject.org>; Fri, 18 Oct 2019 02:10:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tvcmzGhLeZkxuf9ToVdncFXWo0QaAaf8aWbn5IRZGzA=;
 b=fzokW3lSZ91HS0SGyandhccK7E9l24yPXPt3kZQQWIfV8X5qZuCEk22FQCU8x+3PMR
 76+37ydBNkJtu7b2opulq3iWwnk3b5XToKuVou5st/rAgMCeNkfiECwc6GpkFwy3vtlP
 GnDhapEdAJyJtBf3NPjennzAUfMQ8aFZsRQlR2KKWQmGkbFiCACL8bJxL9bqY+T414Ym
 Rgaq66aOdfXMmFfYgBDOdN2IWrD5kzVOqrzAxkGUM5X0ODQLMLE9p2JoXiSMnbqHCJxp
 CCtDqeg+7A396qrq0ri22K01KAx9+p4azY6i61SuOAdCRb6d16P2qaMwKzqmr/Mg3/Uv
 s0ow==
X-Gm-Message-State: APjAAAXeytj2dSOXHseQTNCIfh/MlEDZa5CzfHTbZmwUVrGEmmYUw5QP
 hFJrq6pIyBAVOdrwV4wMOMk=
X-Google-Smtp-Source: APXvYqziqZLR4vn4LyxCRSuWOYI9Qs0YPzQPmqLEKV0ZESE6R24Eq9bGX8+MRAg6L7/ls7/y22o9Uw==
X-Received: by 2002:a1c:6389:: with SMTP id x131mr6613679wmb.55.1571389829353; 
 Fri, 18 Oct 2019 02:10:29 -0700 (PDT)
Received: from debian (19.142.6.51.dyn.plus.net. [51.6.142.19])
 by smtp.gmail.com with ESMTPSA id l11sm4782010wmh.34.2019.10.18.02.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 02:10:28 -0700 (PDT)
Date: Fri, 18 Oct 2019 10:10:26 +0100
From: Wei Liu <wei.liu@kernel.org>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20191018091026.fu4gykxx2mmbdfk3@debian>
References: <20191018074549.4778-1-jgross@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191018074549.4778-1-jgross@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] xen/netback: fix error path of
 xenvif_connect_data()
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
Cc: Wei Liu <wei.liu@kernel.org>, Paul Durrant <paul@xen.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 xen-devel@lists.xenproject.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBPY3QgMTgsIDIwMTkgYXQgMDk6NDU6NDlBTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiB4ZW52aWZfY29ubmVjdF9kYXRhKCkgY2FsbHMgbW9kdWxlX3B1dCgpIGluIGNhc2Ug
b2YgZXJyb3IuIFRoaXMgaXMKPiB3cm9uZyBhcyB0aGVyZSBpcyBubyByZWxhdGVkIG1vZHVsZV9n
ZXQoKS4KPiAKPiBSZW1vdmUgdGhlIHN1cGVyZmx1b3VzIG1vZHVsZV9wdXQoKS4KPiAKPiBGaXhl
czogMjc5ZjQzOGUzNmMwYTcgKCJ4ZW4tbmV0YmFjazogRG9uJ3QgZGVzdHJveSB0aGUgbmV0ZGV2
IHVudGlsIHRoZSB2aWYgaXMgc2h1dCBkb3duIikKPiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5v
cmc+ICMgMy4xMgo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4KPiBSZXZpZXdlZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+CgpSZXZpZXdlZC1i
eTogV2VpIExpdSA8d2VpLmxpdUBrZXJuZWwub3JnPgoKPiAtLS0KPiAgZHJpdmVycy9uZXQveGVu
LW5ldGJhY2svaW50ZXJmYWNlLmMgfCAxIC0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24o
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQveGVuLW5ldGJhY2svaW50ZXJmYWNlLmMg
Yi9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay9pbnRlcmZhY2UuYwo+IGluZGV4IDI0MGY3NjJiMzc0
OS4uMTAzZWQwMDc3NWViIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL2lu
dGVyZmFjZS5jCj4gKysrIGIvZHJpdmVycy9uZXQveGVuLW5ldGJhY2svaW50ZXJmYWNlLmMKPiBA
QCAtNzE5LDcgKzcxOSw2IEBAIGludCB4ZW52aWZfY29ubmVjdF9kYXRhKHN0cnVjdCB4ZW52aWZf
cXVldWUgKnF1ZXVlLAo+ICAJeGVudmlmX3VubWFwX2Zyb250ZW5kX2RhdGFfcmluZ3MocXVldWUp
Owo+ICAJbmV0aWZfbmFwaV9kZWwoJnF1ZXVlLT5uYXBpKTsKPiAgZXJyOgo+IC0JbW9kdWxlX3B1
dChUSElTX01PRFVMRSk7Cj4gIAlyZXR1cm4gZXJyOwo+ICB9Cj4gIAo+IC0tIAo+IDIuMTYuNAo+
IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
