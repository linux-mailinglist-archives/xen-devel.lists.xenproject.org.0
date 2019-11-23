Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CB110801E
	for <lists+xen-devel@lfdr.de>; Sat, 23 Nov 2019 20:24:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iYayU-0005ZW-Ku; Sat, 23 Nov 2019 19:21:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j6pY=ZP=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iYayT-0005ZR-8P
 for xen-devel@lists.xenproject.org; Sat, 23 Nov 2019 19:21:41 +0000
X-Inumbo-ID: 79b06744-0e26-11ea-b4d1-bc764e2007e4
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 79b06744-0e26-11ea-b4d1-bc764e2007e4;
 Sat, 23 Nov 2019 19:21:40 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id t26so8893053wmi.0
 for <xen-devel@lists.xenproject.org>; Sat, 23 Nov 2019 11:21:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bD0r/HtlRYngFKamVn6eot+P8tpkFiA0J3bbjVWhaNg=;
 b=fg68p7SOwU+nSW7FVAVnHmQ3z6ACAUMtcUQL70SIrJn9l5FJBl7Kd4jjYNFvX1RDnX
 gUeUhNHrKimnM91EVmroG5g3v7r4bbDIru5l5E4Sx0ivR7O2aSYIFmNjljy/K9UuPVaG
 E474tyPL8rVWsa09rOZhc3SYrprDkV5pkhtadjqM7bTnNB/QNex7azC9/x2PlIgysMUA
 pYm0EgtieWQMEFkLqSFy3Mz9+gzb6K+SHXLEWoR5YvrOzchWciIuupE0GSKq69rSzVFm
 joOA1olf1Fv+8P+r5RVcOAHvCX1zfi6i4aMjNfMA4POAP+YvKiXsiH/OahCf7nwpJkLJ
 Nv7Q==
X-Gm-Message-State: APjAAAVPHqvOdvhXQrCUgJ9v0PYNRsj6r3nJYyfYSHWLS3rO0G3QCd+E
 EkR3y35pHkUjdx3xObG8TYc=
X-Google-Smtp-Source: APXvYqxHnb93cm+ukBs67d5c8wua4BZgFOlaNiuN/W7Uu1bkYuZ80AmyC20eOPIHLn2wwq+eeuRnsg==
X-Received: by 2002:a1c:9917:: with SMTP id b23mr22054014wme.42.1574536899750; 
 Sat, 23 Nov 2019 11:21:39 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id w11sm3326543wra.83.2019.11.23.11.21.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Nov 2019 11:21:39 -0800 (PST)
To: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 xen-devel@lists.xenproject.org
References: <20191115200115.44890-1-stewart.hildebrand@dornerworks.com>
 <20191115200115.44890-4-stewart.hildebrand@dornerworks.com>
From: Julien Grall <julien@xen.org>
Message-ID: <66d7a36a-4c71-8d4f-d832-10a7171ed85a@xen.org>
Date: Sat, 23 Nov 2019 19:21:37 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191115200115.44890-4-stewart.hildebrand@dornerworks.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [XEN PATCH v3 03/11] xen: arm: Refactor
 route_irq_to_guest
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Ian Campbell <ian.campbell@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxNS8xMS8yMDE5IDIwOjAxLCBTdGV3YXJ0IEhpbGRlYnJhbmQgd3JvdGU6Cj4gRnJv
bTogSWFuIENhbXBiZWxsIDxpYW4uY2FtcGJlbGxAY2l0cml4LmNvbT4KPiAKPiBTcGxpdCBvdXQg
dGhlIGJpdCB3aGljaCBhbGxvY2F0ZXMgdGhlIHN0cnVjdCBpcnFhY3Rpb24gYW5kIGNhbGxzCj4g
X19zZXR1cF9pcnEgaW50byBhIG5ldyBmdW5jdGlvbiAoc2V0dXBfZ3Vlc3RfaXJxKS4gSSdtIGdv
aW5nIHRvIHdhbnQKPiB0byBjYWxsIHRoaXMgYSBzZWNvbmQgdGltZSBpbiBhIHN1YnNlcXVlbnQg
cGF0Y2guCj4gCj4gTm90ZSB0aGF0IHRoZSBhY3Rpb24gaXMgbm93IGFsbG9jYXRlZCBhbmQgaW5p
dGlhbGlzZWQgd2l0aCB0aGUgZGVzYwo+IGxvY2sgaGVsZCAoc2luY2UgaXQgaXMgdGFrZW4gYnkg
dGhlIGNhbGxlcikuIEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBhbgo+IGlzc3VlIChhbmQgYXZvaWRp
bmcgdGhpcyB3b3VsZCBtYWtlIHRoaW5ncyBtb3JlIGNvbXBsZXgpCj4gCj4gU2lnbmVkLW9mZi1i
eTogSWFuIENhbXBiZWxsIDxpYW4uY2FtcGJlbGxAY2l0cml4LmNvbT4KPiBTaWduZWQtb2ZmLWJ5
OiBTdGV3YXJ0IEhpbGRlYnJhbmQgPHN0ZXdhcnQuaGlsZGVicmFuZEBkb3JuZXJ3b3Jrcy5jb20+
Cj4gLS0tCj4gdjI6IE5ldyBwYXRjaCAobWF5YmUsIGl0J3MgYmVlbiBhIHdoaWxlLi4uKQo+IAo+
IHYzOiBSZWJhc2UgKyB0cml2aWFsIGZpeHVwcwo+IAo+IC0tLQo+IE5vdGU6IEkgaGF2ZSBub3Qg
Z2l2ZW4gbXVjaCB0aG91Z2h0IHJlZ2FyZGluZyBKdWxpZW4ncyBjb21tZW50IGluIFsxXQo+IAo+
IFsxXSBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVs
LzIwMTUtMTEvbXNnMDEwNDEuaHRtbAoKSSB3b3VsZCByYXRoZXIgYXZvaWQgdG8gZG8gbWVtb3J5
IGFsbG9jYXRpb24gd2l0aCBpbnRlcnJ1cHRzIGRpc2FibGVkLgoKWW91IG1heSBuZWVkIHRvIGlu
dHJvZHVjZSBhIG5ldyBmdW5jdGlvbiB0aGF0IHdpbGwgYWxsb2NhdGUvc2V0dXAgdGhlIAphY3Rp
b24sIGJ1dCBJIHRoaW5rIHRoaXMgaXMgd29ydGggdGhlIHRyb3VibGUuIE5vdGUgdGhhdCB0aGUg
bmV3IApmdW5jdGlvbiBjb3VsZCBsaWtlbHkgYmUgcmUtdXNlZCBpbiByZXF1ZXN0X2lycSgpIGFz
IHdlbGwuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
