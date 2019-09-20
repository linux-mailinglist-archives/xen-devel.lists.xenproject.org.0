Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 198CEB8AA5
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 07:53:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBBnt-0003Wt-7i; Fri, 20 Sep 2019 05:50:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Cisk=XP=monstr.eu=monstr@srs-us1.protection.inumbo.net>)
 id 1iBBnr-0003WT-5x
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 05:49:59 +0000
X-Inumbo-ID: 79fa5ef6-db6a-11e9-b299-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 79fa5ef6-db6a-11e9-b299-bc764e2007e4;
 Fri, 20 Sep 2019 05:49:57 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r3so5410046wrj.6
 for <xen-devel@lists.xenproject.org>; Thu, 19 Sep 2019 22:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=monstr-eu.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uRLxhAVojptV7hgufrR07c/bFSb5W8HdGjW/XXrGNmU=;
 b=PJwrRasi1kvi4TmmQYpADULUr/CFngg3AmxStXvpOMMd9XLvfW6gLqmv9AnclVnZdR
 SuQ1zMH/YhetXtvCG729brMaADmj4KIkDQV9Ni60QWyN6rZLQ4t9xKUIJBF6FmmB3drE
 GpLZifw7YgMCRV0FXOBLZJdclkPTEfbN3vYABril5hbKhU1eT8u0Pr95hcxkjxFFN2OF
 qJUb6E7w4OdWUifrRkp3CUX0mHTukoji4GQDtnghQsabqlL2KFy6v+gNSJ1CfGG6afOE
 woxcInQwT3lg7vY7kYqHMRtm5EO2osE7C0HtTuLX+yoz33vClM6KLedQqiG0iEbqKMfM
 IPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uRLxhAVojptV7hgufrR07c/bFSb5W8HdGjW/XXrGNmU=;
 b=MBw1qrxD8zlJ8YugpgqaMJR57SEjfQQwPledILNK68r2Cc8iEwU3BBA5PGNz4fXvdE
 FeIpcrZcCtdMuglROm+CkYXIaTkWJiOdjwdTVJJ6gOvheBus4AtGJLEtoE+4hm4Wrv1G
 QRHky96U5PcaO5x58Yzul3UiaKDqqvU7p4nSxzShaVVTHt7yKdnz/cJkB+0HWJvspqNX
 j/SA5aT4tJUV50ZOdGveOseGI4hakjSoHm7jYVGkaqu36xLwERcd8tbRIEf8x8uGev5I
 Hu7UmO6tTmQNWA0Wv8MJ52wxhTysNEUKqWrRwX5I48wwS5D3R3NUVDvxnVLQ+BypQSVR
 hBnQ==
X-Gm-Message-State: APjAAAUO4pnWGzEOjGs0EKC/Q/RBIzlCBXQ+g1VMx6QygHs9Yn+TajSQ
 WuCPHu3m+xLUhmHrrcIK/2VOYw==
X-Google-Smtp-Source: APXvYqw84BAy83Ziqr1cUVL1uIreNc5GnWBmxBOqLpZzveJLBRsyNiy8z1SV97YD/7CEFzhiHlV8PA==
X-Received: by 2002:a5d:49cb:: with SMTP id t11mr2692912wrs.158.1568958596630; 
 Thu, 19 Sep 2019 22:49:56 -0700 (PDT)
Received: from [74.125.133.108] ([149.199.62.129])
 by smtp.gmail.com with ESMTPSA id i14sm903253wra.78.2019.09.19.22.49.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Sep 2019 22:49:55 -0700 (PDT)
To: Michael Ellerman <michael@ellerman.id.au>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <20190918152748.GA21241@infradead.org>
 <CAHk-=wjXF63BKNJH=GtnnoJmXZHEnRwjgeu4foJQvFYYBm9HHA@mail.gmail.com>
 <D422FEED-06F6-44BE-955F-90318693FD96@ellerman.id.au>
From: Michal Simek <monstr@monstr.eu>
Message-ID: <5cc09e92-96ce-dc40-4bc1-f10a4cad6f7d@monstr.eu>
Date: Fri, 20 Sep 2019 07:49:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <D422FEED-06F6-44BE-955F-90318693FD96@ellerman.id.au>
Content-Language: en-US
Subject: Re: [Xen-devel] [GIT PULL] dma-mapping updates for 5.4
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
Cc: xen-devel@lists.xenproject.org, iommu <iommu@lists.linux-foundation.org>,
 linux-mmc@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuIDA5LiAxOSAxOjE3LCBNaWNoYWVsIEVsbGVybWFuIHdyb3RlOgo+IAo+IAo+IE9uIDIw
IFNlcHRlbWJlciAyMDE5IDY6MzM6NTAgYW0gQUVTVCwgTGludXMgVG9ydmFsZHMgPHRvcnZhbGRz
QGxpbnV4LWZvdW5kYXRpb24ub3JnPiB3cm90ZToKPj4gT24gV2VkLCBTZXAgMTgsIDIwMTkgYXQg
ODoyNyBBTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGluZnJhZGVhZC5vcmc+Cj4+IHdyb3RlOgo+
Pj4KPj4+IHBsZWFzZSBwdWxsIHRoZSBkbWEtbWFwcGluZyB1cGRhdGVzIGZvciA1LjQuCj4+Cj4+
IFB1bGxlZC4KPj4KPj4+IEluIGFkZGl0aW9uIHRvIHRoZSB1c3VhbCBLY29uZmlnIGNvbmZsaWNz
IHdoZXJlIHlvdSBqdXN0IHdhbnQgdG8ga2VlcAo+Pj4gYm90aCBlZGl0cyB0aGVyZSBhcmUgYSBm
ZXcgbW9yZSBpbnRlcmVzdGluZyBtZXJnZSBpc3N1ZXMgdGhpcyB0aW1lOgo+Pj4KPj4+ICAtIG1v
c3QgaW1wb3J0YW5seSBwb3dlcnBjIGFuZCBtaWNyb2JsYXplIGFkZCBuZXcgY2FsbGVycyBvZgo+
Pj4gICAgZG1hX2F0b21pY19wb29sX2luaXQsIHdoaWxlIHRoaXMgdHJlZSBtYXJrcyB0aGUgZnVu
Y3Rpb24gc3RhdGljCj4+PiAgICBhbmQgY2FsbHMgaXQgZnJvbSBhIGNvbW1vbiBwb3N0Y29yZV9p
bml0Y2FsbCgpLiAgVGhlIHRyaXZpYWwKPj4+ICAgIGZ1bmN0aW9ucyBhZGRlZCBpbiBwb3dlcnBj
IGFuZCBtaWNyb2JsYXplIGFkZGluZyB0aGUgY2FsbHMKPj4+ICAgIG5lZWQgdG8gYmUgcmVtb3Zl
ZCBmb3IgdGhlIGNvZGUgdG8gY29tcGlsZS4gIFRoaXMgd2lsbCBub3Qgc2hvdyB1cAo+Pj4gICAg
YXMgYSBtZXJnZSBjb25mbGljdCBhbmQgbmVlZHMgdG8gYmUgZGVhbHQgd2l0aCBtYW51YWxseSEK
Pj4KPj4gU28gSSBoYXZlbid0IGdvdHRlbiB0aGUgcG93ZXJwYyBvciBtaWNyb2JsYXplIHB1bGwg
cmVxdWVzdHMgeWV0LCBzbwo+PiBJJ20gbm90IGFibGUgdG8gZml4IHRoYXQgcGFydCB1cCB5ZXQu
Cj4+Cj4+IEludGVhZCwgSSdtIGNjJ2luZyBNaWNoYWVsIEVsbGVybWFuIGFuZCBNaWNoYWwgU2lt
ZWsgdG8gYXNrIHRoZW0gdG8KPj4gcmVtaW5kIG1lIHdoZW4gdGhleSBfZG9fIHNlbmQgdGhvc2Ug
cHVsbCByZXF1ZXN0cywgc2luY2Ugb3RoZXJ3aXNlIEkKPj4gbWF5IHdlbGwgZm9yZ2V0IGFuZCBt
aXNzIGl0LiBXaXRob3V0IGFuIGFjdHVhbCBkYXRhIGNvbmZsaWN0LCBhbmQKPj4gc2luY2UgdGhp
cyB3b24ndCBzaG93IHVwIGluIG15IGJ1aWxkIHRlc3RzIGVpdGhlciwgaXQgd291bGQgYmUgdmVy
eQo+PiBlYXN5IGZvciBtZSB0byBmb3JnZXQuCj4+Cj4+IE1pY2hhW2VdbCwgY2FuIHlvdSBib3Ro
IHBsZWFzZSBtYWtlIHN1cmUgdG8gcmVtaW5kIG1lPwo+IAo+IFllYWggSSB3YXMgYXdhcmUgb2Yg
aXQsIGFuZCB3aWxsIG1ha2Ugc3VyZSB0byByZW1pbmQgeW91IGluIG15IHB1bGwgcmVxdWVzdC4K
ClNhbWUgaGVyZS4KCk1pY2hhbAoKCi0tIApNaWNoYWwgU2ltZWssIEluZy4gKE0uRW5nKSwgT3Bl
blBHUCAtPiBLZXlJRDogRkUzRDFGOTEKdzogd3d3Lm1vbnN0ci5ldSBwOiArNDItMC03MjE4NDI4
NTQKTWFpbnRhaW5lciBvZiBMaW51eCBrZXJuZWwgLSBYaWxpbnggTWljcm9ibGF6ZQpNYWludGFp
bmVyIG9mIExpbnV4IGtlcm5lbCAtIFhpbGlueCBaeW5xIEFSTSBhbmQgWnlucU1QIEFSTTY0IFNv
Q3MKVS1Cb290IGN1c3RvZGlhbiAtIFhpbGlueCBNaWNyb2JsYXplL1p5bnEvWnlucU1QL1ZlcnNh
bCBTb0NzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
