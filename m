Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FE812D053
	for <lists+xen-devel@lfdr.de>; Mon, 30 Dec 2019 14:36:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ilvAs-0005rQ-M4; Mon, 30 Dec 2019 13:33:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4aY4=2U=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ilvAq-0005rL-OF
 for xen-devel@lists.xenproject.org; Mon, 30 Dec 2019 13:33:32 +0000
X-Inumbo-ID: f81bd218-2b08-11ea-a032-12813bfff9fa
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f81bd218-2b08-11ea-a032-12813bfff9fa;
 Mon, 30 Dec 2019 13:33:31 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id q9so12365617wmj.5
 for <xen-devel@lists.xenproject.org>; Mon, 30 Dec 2019 05:33:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=G2tqMMkE0iI7hstWCJutr3tCkW0EdPVXeNhoCfCgSKg=;
 b=XBHiowX6coFSICbQosulHFV8FQLdxCstTnHxoor4x3jchdNm4bgXPL9GJaPDwTrh3x
 pYEYvRnTLGWGf3pTvMbXhgtEv0+MmyRcXC1HP3QcezO6tlPH+KuikUuFc4XzUBi/JrKp
 b79Rs/NXPexa0/GgJQGRXeAsAmxaoFeyVH+L9XlxM38BNBUGOKAlCmL2wmZRN1eNyT+X
 kRH0gGDyC+0pTCNfOGC5wSBktzCqIpRDPnXBLmpOwR6zfDk+grqpnfb8YkB6Ozeoj9zE
 l0bSG3YLZ+sU6yKa+YBxat6MiZn86Z9S79blWD59BiCKK1aK9W/bYCc3VZ3XoWPg3rjQ
 I3aQ==
X-Gm-Message-State: APjAAAWQBwXXGbDfFqMdHepRNFIDhFZb/wMf4XML5TuK3Hjb5/k/rbLc
 U8AN9Dn+tztd5DiufEsxE+w=
X-Google-Smtp-Source: APXvYqxeKeaDNvF052lQuYdWyqsNamsb+4gkVW5WJubsXAi38Ts/YrtG5ij6t+H6R1STWijfXGZfGw==
X-Received: by 2002:a05:600c:2c7:: with SMTP id
 7mr33390348wmn.87.1577712810762; 
 Mon, 30 Dec 2019 05:33:30 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id y20sm20479277wmi.25.2019.12.30.05.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2019 05:33:29 -0800 (PST)
Date: Mon, 30 Dec 2019 13:33:28 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191230133328.lbme6htooxmy6mxd@debian>
References: <20191229183341.14877-1-liuwe@microsoft.com>
 <20191229183341.14877-5-liuwe@microsoft.com>
 <7b0392eb-34f0-79fe-8999-7bc7008666d2@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7b0392eb-34f0-79fe-8999-7bc7008666d2@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 4/8] x86/hyperv: setup hypercall page
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Michael Kelley <mikelley@microsoft.com>,
 Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBEZWMgMzAsIDIwMTkgYXQgMTI6NTU6MjJQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyOS8xMi8yMDE5IDE4OjMzLCBXZWkgTGl1IHdyb3RlOgo+ID4gQEAgLTcxLDYg
KzcyLDQwIEBAIGNvbnN0IHN0cnVjdCBoeXBlcnZpc29yX29wcyAqX19pbml0IGh5cGVydl9wcm9i
ZSh2b2lkKQo+ID4gICAgICByZXR1cm4gJm9wczsKPiA+ICB9Cj4gPiAgCj4gPiArc3RhdGljIHZv
aWQgX19pbml0IHNldHVwX2h5cGVyY2FsbF9wYWdlKHZvaWQpCj4gPiArewo+ID4gKyAgICB1bmlv
biBodl94NjRfbXNyX2h5cGVyY2FsbF9jb250ZW50cyBoeXBlcmNhbGxfbXNyOwo+ID4gKwo+ID4g
KyAgICAvKiBVbmZvcnR1bmF0ZWx5IHRoZXJlIGlzbid0IGEgcmVhbGx5IGdvb2Qgd2F5IHRvIHVu
d2luZCBYZW4gdG8KPiA+ICsgICAgICogbm90IHVzZSBIeXBlci1WIGhvb2tzLCBzbyBwYW5pYyBp
ZiBhbnl0aGluZyBnb2VzIHdyb25nLgo+ID4gKyAgICAgKgo+ID4gKyAgICAgKiBJbiBwcmFjdGlj
ZSBpZiBwYWdlIGFsbG9jYXRpb24gZmFpbHMgdGhpcyBlYXJseSBvbiBpdCBpcwo+ID4gKyAgICAg
KiB1bmxpa2VseSB3ZSBjYW4gZ2V0IGEgd29ya2luZyBzeXN0ZW0gbGF0ZXIuCj4gPiArICAgICAq
Lwo+ID4gKyAgICBodl9oeXBlcmNhbGxfcGFnZSA9IGFsbG9jX2RvbWhlYXBfcGFnZShOVUxMLCAw
KTsKPiA+ICsgICAgaWYgKCAhaHZfaHlwZXJjYWxsX3BhZ2UgKQo+ID4gKyAgICAgICAgcGFuaWMo
IkZhaWxlZCB0byBhbGxvY2F0ZSBIeXBlci1WIGh5cGVyY2FsbCBwYWdlXG4iKTsKPiA+ICsKPiA+
ICsgICAgaHZfaHlwZXJjYWxsID0gX19tYXBfZG9tYWluX3BhZ2VfZ2xvYmFsKGh2X2h5cGVyY2Fs
bF9wYWdlKTsKPiA+ICsgICAgaWYgKCAhaHZfaHlwZXJjYWxsICkKPiA+ICsgICAgICAgIHBhbmlj
KCJGYWlsZWQgdG8gbWFwIEh5cGVyLVYgaHlwZXJjYWxsIHBhZ2VcbiIpOwo+IAo+IEkgcmVhbGx5
IGhvcGUgdGhpcyBkb2Vzbid0IGFjdHVhbGx5IGZ1bmN0aW9uIGNvcnJlY3RseS7CoCBUaGlzIHNo
b3VsZAo+IHJlc3VsdCBpbiBhbiBOWCBtYXBwaW5nLgo+IAoKQWgsIHN0dXBpZCBtZS4gSSBoYWQg
YWN0dWFsbHkgbG9va2VkIGF0IFhlbidzIGltcGxlbWVudGF0aW9uIGFuZCB0aG91Z2h0CiJ3b3Vs
ZG4ndCBpdCBiZSBuaWNlIHRvIHNhdmUgb25lIHBhZ2UgaW4gdGhlIGltYWdlIi4gSSBjbGVhcmx5
IG1pc3NlZAp0aGF0IF9fbWFwX2RvbWFpbl9wYWdlX2dsb2JhbCBtYWtlcyB0aGUgcGFnZSBOWC4K
CldlaS4KCj4gU2VlIGZlZWRiYWNrIG9uIHRoZSBuZXh0IHBhdGNoIGZvciBhbiBhbHRlcm5hdGl2
ZSBzdWdnZXN0aW9uLgo+IAo+IH5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
