Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F18B116B9C
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 11:59:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieGio-0003SX-MO; Mon, 09 Dec 2019 10:56:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3VR8=Z7=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1ieGim-0003SK-PN
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 10:56:56 +0000
X-Inumbo-ID: 9cea116c-1a72-11ea-88e7-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 9cea116c-1a72-11ea-88e7-bc764e2007e4;
 Mon, 09 Dec 2019 10:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575889014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MyLNwJy5spN/uUGKJwSwII6IVS9lQ48y4YIQ5w8/IR4=;
 b=Q2/mZUnncEgeNj7tHoVrlKUEzPSEaXe0rdKKSDQecvDDeyHkddhL/7g8gSezjCHno25kTk
 97Ehq9vurJi9hRST3OD5iQya4eIF6TdvdE30uTRhXBGsfcn20CbkH56zOpMi1FReSH1ok3
 jmoQ37wfBGr+qMesxHKYBAG/qHroJz8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-pFLKzYuPPK2q-C8BLxRibw-1; Mon, 09 Dec 2019 05:56:52 -0500
Received: by mail-wr1-f70.google.com with SMTP id h30so7336330wrh.5
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2019 02:56:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WjNJQQkZsO+8a1bmft+Oyorvw86PENBNNrPDsjmoKus=;
 b=OdW3MlKGyZ3D1z/4k5HvoV247HQiihkiVRRsB782gLRrLCSRIlSocH8MnZUvA4bPqw
 3VCKiquZuKXFSl6T+R5aJI/Mk1lNf1YAidqJQk4fSBHKzCJwL+m/8pKzSl56FrBa6M95
 TESoXkdOFVX0mvA/CEf+9yz74xUrbxws54MvB9pMijZflxhf3hIKYI0kTFTDqNrKaBWD
 7+bY/AdMy2tTjJbWCGZ3lTrmqjcUo9Fw2A9F8bQ5JG3AX+e0wBnL7W1CitLpO0xYVD+L
 yqMOjMUpupUoPrhTRSjMRMoDlwapk+nLB3F3V1++995/+GbRC4DZuvsv9EHmKzwlYhhL
 8Gtg==
X-Gm-Message-State: APjAAAU7VE68i+XUCWs0tpjmG98oEvPGaZZKNv0MHyZ0VibPMuuxwUxi
 jQ2iJj+9I+JLQEqyugXsJqFmv9WIv/i8fDiqIPz/v0qv9fhYY6EE+dhAaoEBqpb7lOnNgbv9WbK
 EWouL2S+5z+pcxTdUJbZr0DVCc3A=
X-Received: by 2002:a5d:4b8f:: with SMTP id b15mr1520258wrt.100.1575889011338; 
 Mon, 09 Dec 2019 02:56:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqy8/NxkJgUssuIKetq74Jwb56vwNb32qApCH3ThHTiCxkbweCvCG/vldgScvR32sdud2xIfBA==
X-Received: by 2002:a5d:4b8f:: with SMTP id b15mr1520226wrt.100.1575889011060; 
 Mon, 09 Dec 2019 02:56:51 -0800 (PST)
Received: from [192.168.1.35] (182.red-88-21-103.staticip.rima-tde.net.
 [88.21.103.182])
 by smtp.gmail.com with ESMTPSA id l4sm12624415wml.33.2019.12.09.02.56.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2019 02:56:50 -0800 (PST)
To: Paolo Bonzini <pbonzini@redhat.com>, "Durrant, Paul"
 <pdurrant@amazon.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20191209095002.32194-1-philmd@redhat.com>
 <20191209095002.32194-7-philmd@redhat.com>
 <3f1702b0765841b19328366af11fd3ed@EX13D32EUC003.ant.amazon.com>
 <083d0d7f-766d-9e72-5395-b4e82858ef4d@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4e9dee3e-05b5-640d-33df-4341c2e01b8b@redhat.com>
Date: Mon, 9 Dec 2019 11:56:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <083d0d7f-766d-9e72-5395-b4e82858ef4d@redhat.com>
Content-Language: en-US
X-MC-Unique: pFLKzYuPPK2q-C8BLxRibw-1
X-Mimecast-Spam-Score: 0
Subject: Re: [Xen-devel] [PATCH-for-5.0 v3 6/6] hw/pci-host: Add Kconfig
 entry to select the IGD Passthrough Host Bridge
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
Cc: Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvOS8xOSAxMTo0MiBBTSwgUGFvbG8gQm9uemluaSB3cm90ZToKPiBPbiAwOS8xMi8xOSAx
MToxMCwgRHVycmFudCwgUGF1bCB3cm90ZToKPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBw
ZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+Cj4+PiAtLS0KPj4+IHYzOiBPbmx5
IGRlZmF1bHQgd2l0aCBYZW4gKEFsZXggV2lsbGlhbXNvbikKPj4+Cj4+PiBJIGRpZCBub3QgdXNl
ZCAnZGVwZW5kcyBvbiBYRU4nIGFzIHN1Z2dlc3RlZCBieSBBbGV4IGJ1dAo+Pj4gJ2RlZmF1bHQg
eSBpZiBYRU4nLCBzbyBvbmUgY2FuIGJ1aWxkIFhFTiB3aXRob3V0IHRoaXMgZmVhdHVyZQo+Pj4g
KGZvciBleGFtcGxlLCBvbiBvdGhlciBBUkNIIHRoYW4gWDg2KS4KPiAKPiBJIHRoaW5rIHdoYXQg
eW91IHdhbnQgaXMgYWNoaWV2ZWQgYnkKPiAKPiAJZGVmYXVsdCB5Cj4gCWRlcGVuZHMgb24gWEVO
ICYmIFBDX0k0NDBGWAoKSSB0aGluayBzbywgYnV0IHdpdGggUENfSTQ0MEZYIC0+IFBDSV9JNDQw
RlggOykKCkl0IHdvdWxkIGJlIGNsZWFuZXIgdG8gcGFzcyB0aGUgQ09ORklHX1hFTl9QQ0lfUEFT
U1RIUk9VR0ggdmFyaWFibGUgdG8gCktjb25maWcgYW5kIHVzZSBpdCAodXNlICdkZXBlbmRzIG9u
IFhFTl9QQ0lfUEFTU1RIUk9VR0gnKS4KClRoaXMgY2FuIGJlIGFub3RoZXIgc3RlcCwgc28gaWYg
dGhpcyBzZXJpZXMgbG9va3MgT0sgdG8geW91IHNvIGZhciwgZG8gCnlvdSBtaW5kIGZpeGluZyB0
aGlzIGFuZCB0aGUgY29tbWVudCBpbiB0aGUgcHJldmlvdXMgcGF0Y2ggbm90aWNlZCBieSAKVGhv
bWFzOgoKLSBFeHRyYWN0IGl0IGludG8gYSBuZXcgZmlsZSwgJ2h3L3BjaS1ob3N0L2lnZF9wdC5j
Jy4KKyBFeHRyYWN0IGl0IGludG8gYSBuZXcgZmlsZSwgJ2h3L3BjaS1ob3N0L3hlbl9pZ2RfcHQu
YycuCgpUaGFua3MhCgpQaGlsLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
