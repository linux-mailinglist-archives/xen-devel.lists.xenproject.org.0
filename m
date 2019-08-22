Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 798039A383
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2019 01:09:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0wAr-0003dJ-Fg; Thu, 22 Aug 2019 23:07:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hGY0=WS=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1i0wAq-0003dE-2R
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2019 23:07:20 +0000
X-Inumbo-ID: 970654d6-c531-11e9-8980-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 970654d6-c531-11e9-8980-bc764e2007e4;
 Thu, 22 Aug 2019 23:07:19 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j16so6886094wrr.8
 for <xen-devel@lists.xenproject.org>; Thu, 22 Aug 2019 16:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xSeyZ04Bbt0S1RJDLcj/JSA4+N4DDFBS6c+TTSqxLJ8=;
 b=ksgNae889U12+CmQmn8aRujZuT/csSsc5dy0CS7EkMTR3ItUyNcXuSv61azH2cZesZ
 83eKKEGhPZ0oKzClwOAWLsSZ5r/jBKNfMps9dGCbKcfOjxmRpct9npxLDFP38V9aOg/w
 KkOx2x/1cKut6LSljcENoUWF6oFh5y5e4Y27FFAt4lTCU60pB71ykVvWJqzTnfrhU3NL
 LQe8xq+GMnz5lMjUPOSKxwoAceykmNACI3n38ldvSuRujf2mDrpOvYKVhOcscwZfOCoZ
 b5P+P9MK2NZzQH4TECu8PWY2xilav+Za2Gp3WPVtfTFhQSLOFnLEePL6V2aXoW0Iq/If
 5fLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xSeyZ04Bbt0S1RJDLcj/JSA4+N4DDFBS6c+TTSqxLJ8=;
 b=qThR9DMUJ6Em1oQ47oU8jXrUNz+DvEQrtEYhWV67tPUEzkkoF6MEGJvpBDhdQy4PcR
 Eh6jqqioKJ5C9MF+bLnESVP0Hzjd7wElM4UuovFqjiP5un7Q74lUXXRA5m928W3uQkOr
 oTp5sNXoFuoTbMmicdxUbhqGDg+J2BUqHt6Jity+hCx4o89KD7Iz1UOWD7bTvq1N9CyR
 fYS0YPTeP6BGOSbUklxh/eZKCTNOvEp0jQA7ublikelewIk5dx4Wz3QFf7hQLQGlRgNg
 lBD4sAvezxhP0/hnLevcUHwO1UPehW9trHn8Cb6vAMj3EiHwYH6r2hQYBIBUyDuxpdIy
 2wzA==
X-Gm-Message-State: APjAAAWS1NOKGDPlo/CZyzjPc3eS+nLGh0z1nnL2/iqNnmXu6DPF6VTy
 SIaAAgCEgnEN5QXQWCzD29zVMAKkGlBNv0D+IyI=
X-Google-Smtp-Source: APXvYqzYWGG1hld2Cx+uS3TSuNmzES/1ryQvbawQ38vVOz2Qx1Bj1YdLEKD2GBiOq43YpepkdbyjtqCaDJBQEaw5DeM=
X-Received: by 2002:adf:facc:: with SMTP id a12mr1189386wrs.205.1566515238521; 
 Thu, 22 Aug 2019 16:07:18 -0700 (PDT)
MIME-Version: 1.0
References: <15a4c482-1207-1d8a-fd2a-dc4f25956c27@cs.rochester.edu>
 <79c7b71f-0b61-2799-4a79-644536a9c891@citrix.com>
 <d55da430-0d73-8a92-73e7-99e1aa70680c@cs.rochester.edu>
 <5b190182-4938-52b4-eeb2-df77224711c3@citrix.com>
 <587225E8-C0DE-40BA-B39E-E30F9CE69B92@gmail.com>
 <74cb4fb4-9983-0000-9dbb-8fc24921a372@citrix.com>
In-Reply-To: <74cb4fb4-9983-0000-9dbb-8fc24921a372@citrix.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Thu, 22 Aug 2019 17:06:41 -0600
Message-ID: <CABfawhm-8Y1X8KZutdBWzGCqUmK__2=g3nEFsN+7oLUMyf-2ow@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] More questions about Xen memory layout/usage,
 access to guest memory
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Rich Persaud <persaur@gmail.com>, "Johnson, Ethan" <ejohns48@cs.rochester.edu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgMjIsIDIwMTkgYXQgNDo0MCBQTSBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToKPgo+IE9uIDIyLzA4LzIwMTkgMjE6NTcsIFJpY2ggUGVy
c2F1ZCB3cm90ZToKPiA+PiBPbiBBdWcgMjIsIDIwMTksIGF0IDA5OjUxLCBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPiA+Pgo+ID4+PiBPbiAyMi8wOC8y
MDE5IDAzOjA2LCBKb2huc29uLCBFdGhhbiB3cm90ZToKPiA+Pj4KPiA+Pj4gRm9yIEhWTSwgb2J2
aW91c2x5IGFueXRoaW5nIHRoYXQgY2FuJ3QgYmUgdmlydHVhbGl6ZWQgbmF0aXZlbHkgYnkgdGhl
Cj4gPj4+IGhhcmR3YXJlIG5lZWRzIHRvIGJlIGVtdWxhdGVkIGJ5IFhlbi9RRU1VIChzaW5jZSB0
aGUgZ3Vlc3Qga2VybmVsIGlzbid0Cj4gPj4+IGV4cGVjdGVkIHRvIGJlIGNvb3BlcmF0aXZlIHRv
IGlzc3VlIFBWIGh5cGVyY2FsbHMgaW5zdGVhZCk7IGJ1dCBJIHdvdWxkCj4gPj4+IGV4cGVjdCBl
bXVsYXRpb24gdG8gYmUgbGltaXRlZCB0byB0aGUgcmVsYXRpdmVseSBzbWFsbCBzdWJzZXQgb2Yg
dGhlIElTQQo+ID4+PiB0aGF0IFZNWC9TVk0gY2FuJ3QgbmF0aXZlbHkgdmlydHVhbGl6ZS4gWWV0
IEkgc2VlIHRoYXQgeDg2X2VtdWxhdGUuYwo+ID4+PiBzdXBwb3J0cyBlbXVsYXRpbmcganVzdCBh
Ym91dCBldmVyeXRoaW5nLiBVbmRlciB3aGF0IGNpcmN1bXN0YW5jZXMgZG9lcwo+ID4+PiBYZW4g
YWN0dWFsbHkgbmVlZCB0byBwdXQgYWxsIHRoYXQgZW11bGF0aW9uIGNvZGUgdG8gdXNlPwo+ID4+
IEludHJvc3BlY3Rpb24sIGFzIEkgc2FpZCBlYXJsaWVyLCB3aGljaCBpcyBwb3RlbnRpYWxseSBh
bnkgaW5zdHJ1Y3Rpb24uCj4gPiBDb3VsZCBpbnRyb3NwZWN0aW9uLXNwZWNpZmljIGVtdWxhdGlv
biBjb2RlIGJlIGRpc2FibGVkIHZpYSBLQ29uZmlnPwo+Cj4gTm90IHJlYWxseS4KPgo+IEF0IHRo
ZSBwb2ludCBzb21ldGhpbmcgaGFzIHRyYXBwZWQgZm9yIGVtdWxhdGlvbiwgd2UgbXVzdCBjb21w
bGV0ZSBpdCBpbgo+IGEgbWFubmVyIGNvbnNpc3RlbnQgd2l0aCB0aGUgeDg2IGFyY2hpdGVjdHVy
ZSwgb3IgdGhlIGd1ZXN0IHdpbGwgY3Jhc2guCj4KPiBJZiB5b3UgZG9uJ3Qgd2FudCBlbXVsYXRp
b24gZnJvbSBpbnRyb3NwZWN0aW9uLCBkb24ndCBzdGFydAo+IGludHJvc3BlY3RpbmcgaW4gdGhl
IGZpcnN0IHBsYWNlLCBhdCB3aGljaCBwb2ludCBndWVzdCBhY3Rpb25zIHdvbid0Cj4gdHJhcCBp
biB0aGUgZmlyc3QgcGxhY2UuCgpUaGF0J3MgaW5jb3JyZWN0LCB5b3UgY2FuIGFic29sdXRlbHkg
ZG8gaW50cm9zcGVjdGlvbiB3aXRoIHZtX2V2ZW50cwphbmQgTk9UIGVtdWxhdGUgYW55dGhpbmcu
IFlvdSBjYW4gaGF2ZSBhbHRwMm0gaW4gcGxhY2Ugd2l0aCBkaWZmZXJlbnQKbWVtb3J5IHBlcm1p
c3Npb25zIHNldCBpbiBkaWZmZXJlbnQgdmlld3MgYW5kIHN3aXRjaCBiZXR3ZWVuIHRoZSB2aWV3
cwp3aXRoIE1URiBlbmFibGVkIHRvIGFsbG93IHRoZSBzeXN0ZW0gdG8gY29udGludWUgZXhlY3V0
aW5nLiBUaGlzIGRvZXMKbm90IHJlcXVpcmUgZW11bGF0aW9uIG9mIGFueXRoaW5nLiBJIHdvdWxk
IGJlIGJlaGluZCBhIEtDT05GSUcgb3B0aW9uCnRoYXQgdHVybnMgb2ZmIHBhcnRzIG9mIHRoZSBl
bXVsYXRvciB0aGF0IGFyZSBvbmx5IHVzZWQgYnkgYSBzdWJzZXQgb2YKaW50cm9zcGVjdGlvbiB1
c2VjYXNlcy4gQnV0IHRoaXMgc2hvdWxkIG5vdCBiZSBhbiBvcHRpb24gdGhhdCB0dXJucwpvZmYg
aW50cm9zcGVjdGlvbiBpdHNlbGYsIHRoZSB0d28gdGhpbmdzIGFyZSBOT1QgaW50ZXItZGVwZW5k
ZW50LgoKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
