Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3270C10C573
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 09:51:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaFTq-00063q-Rk; Thu, 28 Nov 2019 08:48:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yOAp=ZU=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iaFTp-00063k-LV
 for xen-devel@lists.xen.org; Thu, 28 Nov 2019 08:48:53 +0000
X-Inumbo-ID: e75145aa-11bb-11ea-a55d-bc764e2007e4
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e75145aa-11bb-11ea-a55d-bc764e2007e4;
 Thu, 28 Nov 2019 08:48:53 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id b6so404490wrq.0
 for <xen-devel@lists.xen.org>; Thu, 28 Nov 2019 00:48:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=thKoPs1MjZo1VChXMS8mzf87IAnA59I1ScHrajJnpdU=;
 b=iS93zH3ZZ07mefSt8RGpsmobzLRlTMM1dSe84+5X5Oh7TWNOdmGY6WmjJ7XNBRLYro
 T8f4Uh5w1nvvlG+R0pITrPccZHVr4kiFpVrxqM9TcZOIii19ZY8x8Gsb3dEQHf9xpQeR
 R6m2e06eR+W7UaKQ9gdbJo94B6L3tCjyXdWuqGfXQaos+P6b9Qdy+rOZ7LFo7aWqyM5G
 /xpw7ow4M6tmYA+RuJY1tAUtOPy4sGz7KbmUbiJ4/aPJsDRw9K2Wm7ZZIyjn0VzfAt+w
 pxWX+tQrFZleVPColG34n5UOLo644z3PaTTpylrfAaCIG/BPkNOJd0quW7thmnuGzYZf
 WftA==
X-Gm-Message-State: APjAAAUiBdyyT+Nk+CVVl9ItZE+U+xQYOhADHQmM8rJfIE5ld+4t7hF2
 srb56wreUTkn4/E7qHSVoC0=
X-Google-Smtp-Source: APXvYqx9hbTRo9Q1FfrZNgcx+r6tLL7t4Cph/56Od1cBzkf29k+ohPM8pdVqW59b9tiRbt3J+LIChA==
X-Received: by 2002:a05:6000:149:: with SMTP id
 r9mr7349466wrx.147.1574930932231; 
 Thu, 28 Nov 2019 00:48:52 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id y15sm21336688wrh.94.2019.11.28.00.48.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Nov 2019 00:48:51 -0800 (PST)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20191122080226.6817-1-peng.fan@nxp.com>
 <alpine.DEB.2.21.1911221105360.11302@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.1911261241260.8205@sstabellini-ThinkPad-T480s>
 <942a60db-fd30-a63e-25b1-e6b739b17c4e@xen.org>
 <alpine.DEB.2.21.1911261306370.8205@sstabellini-ThinkPad-T480s>
 <e98515e2-8e2e-569a-557e-523e9f134bef@xen.org>
 <13d490f1-cd9e-e2aa-d118-2c96cf03eb9b@suse.com>
 <AM0PR04MB4481C1F43E0827D5652148F488440@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <e846a55b-3379-a22d-93db-862bc5279b64@suse.com>
 <alpine.DEB.2.21.1911270753580.27669@sstabellini-ThinkPad-T480s>
 <c6c26fc6-d9ab-5222-3787-3d083b3b7a97@xen.org>
 <3d63788e-b28a-c8fd-dae3-99ad9f4b9a04@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <9d32e677-dc13-cb56-6684-01ceabf4ae47@xen.org>
Date: Thu, 28 Nov 2019 08:48:50 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <3d63788e-b28a-c8fd-dae3-99ad9f4b9a04@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH V2] arch: arm: vgic-v3: fix GICD_ISACTIVER
 range
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
Cc: Peng Fan <peng.fan@nxp.com>, Alice Guo <alice.guo@nxp.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
 "julien.grall@arm.com" <julien.grall@arm.com>, committers@xenproject.org,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyOC8xMS8yMDE5IDA4OjMyLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+IE9uIDI4LjEx
LjE5IDA5OjE0LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBJbiBzaG9ydCwgSSB0aGluayB0aGUg
cGF0Y2ggc2hvdWxkIGdvIGluIG5vdyBhbmQgdGhlcmUgYXJlIG5vIGRvd25zaWRlcwo+Pj4gdG8g
aXQuIFRoYXQncyBpdCwgSSByZXN0IG15IGNhc2UuIEp1bGllbiwgSSBob3BlIHlvdSdsbCByZWNv
bnNpZGVyLgo+PiBJIGRvbid0IHJlYWxseSBzZWUgdGhlIHBvaW50IHRvIHRyeSB0byBhbGxvdyBM
aW51eCA1LjQgYm9vdGluZyBvbiBYZW4gCj4+IDQuMTMgd2l0aG91dCBrbm93aW5nIHdoZXRoZXIg
d2UgYXJlIG5vdCBnb2luZyB0byB1bmNvdmVyZWQgbW9yZSBCVUcgCj4+IGFyb3VuZCBJKkFDVElW
RVIuCj4gCj4gU29ycnksIGJ1dCB0aGlzIGlzIGEgcmF0aGVyIHdlaXJkIHN0YXRlbWVudC4KPiAK
PiBJSVVDIHlvdSBhcmUgc2F5aW5nIHRoYXQgYSB0eXBvIGJsb2NraW5nIGJvb3Qgb2YgTGludXgg
NS40IHNob3VsZCBub3QgYmUKPiBmaXhlZCBhcyB5b3UgYXJlIG5vdCBzdXJlIHRoZXJlIGFyZSBu
byBvdGhlciBidWdzPwoKVGhlIGltcGxlbWVudGF0aW9uIG9mIEkqQUNUSVZFUiB3YXMgaW5jb3Jy
ZWN0IGJ1dCBnb25lIHVubm90aWNlZCBiZWNhdXNlIApuby1vbmUgdXNlZCBpdCB1bnRpbCA1LjQu
IEl0IGFsc28gaGFwcGVuIHRoYXQgd2UgZGlkbid0IGNvdmVyIGFsbCB0aGUgCkkqQUNUSVZFUiBy
ZWdpc3RlcnMsIHNvIDUuNCBjcmFzaGVzIGluc3RlYWQgb2YgdXNpbmcgdGhlIHdyb25nIGJlaGF2
aW9yLgoKVGhpcyBwYXRjaCBpcyBiYXNpY2FsbHkgcmVwbGFjaW5nIGEgZ3Vlc3QgY3Jhc2ggYnkg
YSBiZWhhdmlvciB3ZSBkb24ndCAKZnVsbHkgdW5kZXJzdGFuZC4KCj4gCj4+IElmIHlvdSByZWFs
bHkgd2FudCB0aGlzIHBhdGNoIGluIFhlbiA0LjEzLCB0aGVuIHlvdSBzaG91bGQgcmVhZCBteSAK
Pj4gbWFpbCBvbiB0aGUgZmlyc3QgdmVyc2lvbiBhbmQgdHJ5aW5nIHRvIGFuc3dlciBtZSB3aHkg
dGhpcyA1LjQgaXMgCj4+IGdvaW5nIHRvIGJlIHNhZmUgcnVubmluZyBvbiBYZW4gNC4xMy4KPiAK
PiBPciBkbyB5b3UgdGhpbmsgdGhhdCB3aXRoIHRoZSB0eXBvIGZpeGVkIGFuZCBydW5uaW5nIExp
bnV4IDUuNCBndWVzdHMKPiB3aWxsIGRlc3RhYmlsaXplIHRoZSBob3N0PwoKSXQgaXMgbm90IGdv
aW5nIHRvIGRlc3RhYmlsaXplIHRoZSBob3N0cy4gQnV0IHRoaXMgaXMgbm90IGdvaW5nIHRvIG1h
a2UgCjUuNCBydW5uaW5nIGNvcnJlY3RseSBhcyBYZW4gZ3Vlc3QuCgpDaGVlcnMsCgotLSAKSnVs
aWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
