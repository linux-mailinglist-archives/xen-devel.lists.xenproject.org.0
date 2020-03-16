Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B351872F6
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2020 20:03:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jDuym-0005bm-UV; Mon, 16 Mar 2020 19:00:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ek3V=5B=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jDuyl-0005bc-FI
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2020 19:00:47 +0000
X-Inumbo-ID: 71b006d0-67b8-11ea-b881-12813bfff9fa
Received: from us-smtp-delivery-74.mimecast.com (unknown [63.128.21.74])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 71b006d0-67b8-11ea-b881-12813bfff9fa;
 Mon, 16 Mar 2020 19:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584385246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GTcwy5EcrKMKytC/WSeHnaZ/vMtgK6arLEK3I1pmChw=;
 b=MRXhj7jvgDZIebll4e+nSRm5IGZl7LsqRCNEzetxuQSi+1V21Gk5R3pxKVqOQ17MFSuc8W
 kKqVJ9l3fUFtlSahGTKkR77NN3sVtI9q4MfLB9j/AMd5sYevz5EoKv9hAWUQGy/5e62JPa
 09oHNtUcbHAPnUjY0qd7OMbVDh8Y2rM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-GBfE-FIWMXGRwkTPUOu-8Q-1; Mon, 16 Mar 2020 15:00:30 -0400
X-MC-Unique: GBfE-FIWMXGRwkTPUOu-8Q-1
Received: by mail-ed1-f70.google.com with SMTP id ce13so16053446edb.11
 for <xen-devel@lists.xenproject.org>; Mon, 16 Mar 2020 12:00:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SBoLIS60m/R8vVlNjtCKtaSpPA1mtOn0IkBdkHi07aA=;
 b=O/CMlWQsJEZb8oEsbo62o95sjrv0OCEpDdG3Nloj+V9YM/XWvWJyV3XfcihK6wlb5r
 85R3pRxCEGqCYerkMQnMlFoWwJWa86qBLhVBWC9nK6Ow4zL18/eAsL5+Z2WgYyWgfh35
 cwSpD7W5Kslk8Vy6fWLlNfl6zWXmb/1iIrmGot9jvxBnzAHNlvjKj3iA2y/rDTLEcCMD
 8Hi3mD1pywrWU7dJ8LbLmSVCjt+Img0X39ofcNqTQn9LKh/Lv+3oyhPhQPzh5U0VtrCY
 4h66/irq4gSPxXhwz3tZTQt1/2RncdziI2k7r35y5QNyZk9QRIqK07OGyveghw5amkz1
 uTKQ==
X-Gm-Message-State: ANhLgQ2knS1ZOYgT538SQJxZWeerRTcuJjyLHFIsEJz56CsYUY1/bag6
 rU6CyWjngcQmwa5erCesIeq4jt/ZRZmwTEuZQ+hVL8QCn/CKDlNvut3kfKZhMc14/MoPpya2dQE
 PLuQkc7VvH8aAvBhLJR7YAtRYAgA=
X-Received: by 2002:a05:6402:180a:: with SMTP id
 g10mr1396196edy.352.1584385228629; 
 Mon, 16 Mar 2020 12:00:28 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtBwTHbkTiIU9n1r6Qr6pyZg2hQ9rRIsQKNUEZ9lnKnt6gBUvvjzB3M5uPPCsZJF+W1RYG4Vw==
X-Received: by 2002:a05:6402:180a:: with SMTP id
 g10mr1396167edy.352.1584385228380; 
 Mon, 16 Mar 2020 12:00:28 -0700 (PDT)
Received: from [192.168.1.34] (96.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.96])
 by smtp.gmail.com with ESMTPSA id d9sm50792ejc.79.2020.03.16.12.00.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Mar 2020 12:00:27 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200316160634.3386-1-philmd@redhat.com>
 <20200316160634.3386-19-philmd@redhat.com>
 <CAFEAcA_bXb_RZFxMSYJ8FAoAahAxrq3c0PBzidu+Z0iXTzZqFw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9a627400-c8bd-fcee-8cf8-9896c5b3760f@redhat.com>
Date: Mon, 16 Mar 2020 20:00:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_bXb_RZFxMSYJ8FAoAahAxrq3c0PBzidu+Z0iXTzZqFw@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Xen-devel] [PATCH v3 18/19] hw/arm: Do not build to 'virt'
 machine on Xen
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, kvm-devel <kvm@vger.kernel.org>,
 Paul Durrant <paul@xen.org>, Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMy8xNi8yMCA2OjExIFBNLCBQZXRlciBNYXlkZWxsIHdyb3RlOgo+IE9uIE1vbiwgMTYgTWFy
IDIwMjAgYXQgMTY6MDgsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNv
bT4gd3JvdGU6Cj4+Cj4+IFhlbiBvbiBBUk0gZG9lcyBub3QgdXNlIFFFTVUgbWFjaGluZXMgWypd
LiBEaXNhYmxlIHRoZSAndmlydCcKPj4gbWFjaGluZSB0aGVyZSB0byBhdm9pZCBvZGQgZXJyb3Jz
IHN1Y2g6Cj4+Cj4+ICAgICAgQ0MgICAgICBpMzg2LXNvZnRtbXUvaHcvY3B1L2ExNW1wY29yZS5v
Cj4+ICAgIGh3L2NwdS9hMTVtcGNvcmUuYzoyODoxMDogZmF0YWwgZXJyb3I6IGt2bV9hcm0uaDog
Tm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo+Pgo+PiBbKl0gaHR0cHM6Ly93aWtpLnhlbnByb2pl
Y3Qub3JnL3dpa2kvWGVuX0FSTV93aXRoX1ZpcnR1YWxpemF0aW9uX0V4dGVuc2lvbnMjVXNlX29m
X3FlbXUtc3lzdGVtLWkzODZfb25fQVJNCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1h
dGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KPj4gLS0tCj4+IENjOiBTdGVmYW5vIFN0
YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4+IENjOiBBbnRob255IFBlcmFyZCA8
YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPj4gQ2M6IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4u
b3JnPgo+PiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4+IC0tLQo+PiAgIGh3
L2FybS9LY29uZmlnIHwgMSArCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4+
Cj4+IGRpZmYgLS1naXQgYS9ody9hcm0vS2NvbmZpZyBiL2h3L2FybS9LY29uZmlnCj4+IGluZGV4
IDhlODAxY2QxNWYuLjY5YThlMzAxMjUgMTAwNjQ0Cj4+IC0tLSBhL2h3L2FybS9LY29uZmlnCj4+
ICsrKyBiL2h3L2FybS9LY29uZmlnCj4+IEBAIC0xLDUgKzEsNiBAQAo+PiAgIGNvbmZpZyBBUk1f
VklSVAo+PiAgICAgICBib29sCj4+ICsgICAgZGVwZW5kcyBvbiAhWEVOCj4+ICAgICAgIGRlZmF1
bHQgeSBpZiBLVk0KPj4gICAgICAgaW1wbHkgUENJX0RFVklDRVMKPj4gICAgICAgaW1wbHkgVEVT
VF9ERVZJQ0VTCj4+IC0tCj4gCj4gVGhpcyBzZWVtcyBvZGQgdG8gbWU6Cj4gKDEpIHRoZSBlcnJv
ciBtZXNzYWdlIHlvdSBxdW90ZSBpcyBmb3IgYTE1bXBjb3JlLmMsIG5vdCB2aXJ0LmMKClRoaXMg
aXMgdGhlIGZpcnN0IGRldmljZSB0aGUgdmlydCBib2FyZCBzZWxlY3RzOgoKY29uZmlnIEFSTV9W
SVJUCiAgICAgYm9vbAogICAgIGltcGx5IFBDSV9ERVZJQ0VTCiAgICAgaW1wbHkgVEVTVF9ERVZJ
Q0VTCiAgICAgaW1wbHkgVkZJT19BTURfWEdCRQogICAgIGltcGx5IFZGSU9fUExBVEZPUk0KICAg
ICBpbXBseSBWRklPX1hHTUFDCiAgICAgaW1wbHkgVFBNX1RJU19TWVNCVVMKICAgICBzZWxlY3Qg
QTE1TVBDT1JFCiAgICAgLi4uCgo+ICgyKSBzaG91bGRuJ3QgdGhpcyBiZSBwcmV2ZW50ZWQgYnkg
c29tZXRoaW5nIHNheWluZyAiZG9uJ3QgYnVpbGQKPiBndWVzdCBhcmNoaXRlY3R1cmUgWCBib2Fy
ZHMgaW50byBZLXNvZnRtbXUiLCByYXRoZXIgdGhhbiBhIHNwZWNpZmljCj4gZmxhZyBmb3IgYSBz
cGVjaWZpYyBhcm0gYm9hcmQgPwoKWWVzLCBhZ3JlZWQuIFRoaXMgc3VyZ2ljYWwgY2hhbmdlIHdh
cyBxdWlja2VyIGZvciBteSB0ZXN0aW5nLCBidXQgd2UgCmRvbid0IG5lZWQgdGhpcyBwYXRjaCBy
aWdodCBub3csIHNvIGxldCdzIGRyb3AgaXQuCgo+IAo+IHRoYW5rcwo+IC0tIFBNTQo+IAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
