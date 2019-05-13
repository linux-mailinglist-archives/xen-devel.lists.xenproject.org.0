Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 625D91B8AB
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 16:42:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQC7d-0003OI-94; Mon, 13 May 2019 14:40:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aHtp=TN=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hQC7b-0003Kz-UW
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 14:40:08 +0000
X-Inumbo-ID: 00557d20-758d-11e9-8980-bc764e045a96
Received: from mail-io1-xd2e.google.com (unknown [2607:f8b0:4864:20::d2e])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 00557d20-758d-11e9-8980-bc764e045a96;
 Mon, 13 May 2019 14:40:06 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id q21so6984004iog.13
 for <xen-devel@lists.xenproject.org>; Mon, 13 May 2019 07:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Km6WCL9jJcCPeyQduXaHQ6UxY0oGPWkAl6FNfCNv2p0=;
 b=bpWwOUPklEF4urt6sM+OyNA9UcmCT5SMKvYXkn5xIt95JqBHIutwyuCgp5vbnEzlO3
 3YIFxJkgI4GJmY66676us7SmoUH9fLnTQtweOBFjaBcgwXUPsiWXSKs5qwIQ/eOuf9RE
 UVNTt89Y4z/ibT3cE/nrPnplLWY4Iw5cjpokkBvv2/2Z5btrqjp3fDyoROhKEDv4pPRN
 SyeW/0R6VO9MoulBaCXTwU1G8l5URw6TM1KWz1H275pYjiubmBPpgbc/lTBFLdBj660p
 EwtyOoxS+xn842onBqCFDi+JIRPSB8OfZ4Eb16HlWCi350jy/V+JobpT7zY/0WyKaHsC
 aEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Km6WCL9jJcCPeyQduXaHQ6UxY0oGPWkAl6FNfCNv2p0=;
 b=Oliky29dlJ0z05kTVm5ZccMg3G2DJ4UD1wlrK3Ktn2f8WPxN/qBWJZrgGiX4Z2FtS5
 75YwDH3erk6vu8G+HnQIiK0T8p8wZ1Xw2N2cpXfxvevWpih3G1HB+CRCzOR+AcqjPCeP
 ztonQtL+d6LlYr7Cqt9WYE5WPaMaPIpbKvldfVBjvB1bQDBcIEZMJCA9slPviPpN6qrS
 dzMz7VzAtluIT7QIRgHOvoDyu7cGaKISpQwiiUJe0NW84vRhUATep445cH80eRAq7+uI
 UOQLlo3NvmopoMJnWrCF+GL121/oxG50s0azmGCp3ljqR35+6/zO4FuXunmS1Re+Lu6B
 uYzg==
X-Gm-Message-State: APjAAAVU9OmWmtnj5H8snSJOWbmA5cwXTOMGB4q2Sy3xpJfVH7p9h9uu
 kKB9+GtkOz8X5WMprsbajvMpM32tO1vlQd95v/o=
X-Google-Smtp-Source: APXvYqxVKVmCOefNzjQTcxNBvfrrffvyVFnagcpcjwbfhpAfRDD2tNbN3LxIqngr/MF/t560Z3/Lu//XYQpvkYTxdKU=
X-Received: by 2002:a6b:7008:: with SMTP id l8mr15668634ioc.210.1557758406146; 
 Mon, 13 May 2019 07:40:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAOcoXZaMLfHSyLSE04xRFZZY0hLkFcJ5cBqHTdmwDoqwcreD1w@mail.gmail.com>
 <ff543e3c-0619-5aa6-b36a-e1a8b8cce886@arm.com>
 <20190503110819.GA5900@zion.uk.xensource.com>
 <63ea8905-87ca-a419-95bf-ae497bf1ff85@arm.com>
 <20190503134133.GC5900@zion.uk.xensource.com>
 <b0947b60-d89a-54a5-a11b-708b64ff8053@arm.com>
 <20190503141952.GD5900@zion.uk.xensource.com>
 <CAOcoXZZau01-5Tmab9eCcYKJavzrT_9KdNa_dR+QN5zKmmXMoA@mail.gmail.com>
 <4fb5058d-9810-7a1b-91f4-db31bad82a85@arm.com>
 <CAOcoXZbDdX3rXL+nzEwUCT47UUbCDqJPZ7SP-dYn9SYdkm=isg@mail.gmail.com>
 <20190513104336.GA2798@zion.uk.xensource.com>
In-Reply-To: <20190513104336.GA2798@zion.uk.xensource.com>
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Mon, 13 May 2019 17:39:55 +0300
Message-ID: <CAOcoXZaLGtpe4DsnQoYynR5iFh43EM5q8pj7fKWJZ=odJy46DA@mail.gmail.com>
To: Wei Liu <wei.liu2@citrix.com>, Julien Grall <julien.grall@arm.com>
Subject: Re: [Xen-devel] Xen GCC coverage ARM64 testing - Unexpected Trap:
 Data Abort
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii_Anisov@epam.com, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgV2VpIGFuZCBKdWxpZW4sCgpUaGFuayB5b3UgZm9yIHRoZSBoaW50cyBwcm92aWRlZC4gSXQg
aXMgYXBwZWFyZWQgdGhhdCBpdCB3YXMgWW9jdG8gWGVuCnJlY2VpcHQgaXNzdWUgYW5kIG5vdCBY
ZW4gY292ZXJhZ2UgZmVhdHVyZSBpc3N1ZS4KV2Ugc2VlIHRoYXQgeGVuY292KiB0b29scyBhcmUg
YnVpbHQgYW55d2F5LCBldmVuIGluIHRoZSBjYXNlIHdoZW4KQ09ORklHX0NPVkVSQUdFIGlzIG5v
dCBlbmFibGVkIGluIGh5cGVydmlzb3IgS2NvbmZpZy4KSXMgdGhlcmUgYSByZWFzb24gZm9yIHRo
aXM/CgpUbyBzdW1tYXJpemUsIHRoZXJlIGlzIG5vIG5lZWQgdG8gZW5hYmxlIGNvdmVyYWdlIGZl
YXR1cmUgaW4gdHdvCnBsYWNlcywgb25seSBpbiBLY29uZmlnLCBhcyBtZW50aW9uZWQgaW4gZG9j
dW1lbnRhdGlvbi4KSXQgaGFzIGJlZW4gcmVjaGVja2VkIHdpdGggWGVuIDQuMTIsIGFuZCB3b3Jr
cyB3ZWxsIGFzIGV4cGVjdGVkLgoKLS0tClhlbiA0LjEzIGhhcyBub3QgYmVlbiBjaGVja2VkIHll
dCB3aXRoIHRoZSBwYXRjaC4gQ3VycmVudGx5LCB4ZW4gNC4xMwpzdGFnaW5nIGZhaWxzIHRvIGJv
b3QgZHVlIHRvIHVua25vd24gcmVhc29uLi4uIGl0IHdvcmtlZCBzb21lIGRheXMKYWdvLgpJdCBo
YW5ncyBhZnRlciB0aGUgbmV4dCBsb2cgY3VycmVudGx5OgooWEVOKSBGYWlsZWQgdG8gYnJpbmcg
dXAgQ1BVIDcgKGVycm9yIC01KQooWEVOKSBCcm91Z2h0IHVwIDQgQ1BVcwooWEVOKSBQMk06IDQ0
LWJpdCBJUEEgd2l0aCA0NC1iaXQgUEEgYW5kIDgtYml0IFZNSUQKKFhFTikgUDJNOiA0IGxldmVs
cyB3aXRoIG9yZGVyLTAgcm9vdCwgVlRDUiAweDgwMDQzNTk0CihYRU4pIEkvTyB2aXJ0dWFsaXNh
dGlvbiBkaXNhYmxlZAooWEVOKSBidWlsZC1pZDogZjRlYTJjOTNmZjA5MjI1YmVlZDA1ZjYyOWEz
ODEzYjRlMzFjNDIwZAooWEVOKSBhbHRlcm5hdGl2ZXM6IFBhdGNoaW5nIHdpdGggYWx0IHRhYmxl
IDAwMDAwMDAwMDAzNDNkNTggLT4gMDAwMDAwMDAwMDM0NDQxOAotLS0KCkp1bGllbiwgYXJlIHlv
dSBnb2luZyB0byBpbnRlZ3JhdGUgdGhlIHBhdGNoPwoKVGhhbmtzCgpPbiBNb24sIE1heSAxMywg
MjAxOSBhdCAxOjQzIFBNIFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4g
T24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDE6Mjk6MTJQTSArMDMwMCwgVmlrdG9yIE1pdGluIHdy
b3RlOgo+ID4gPiA+IGFhcmNoNjQtcG9reS1saW51eC1nY2MgICAtREJVSUxEX0lEIC1mbm8tc3Ry
aWN0LWFsaWFzaW5nIC1zdGQ9Z251OTkKPiA+ID4gPiAtV2FsbCAtV3N0cmljdC1wcm90b3R5cGVz
IC1XZGVjbGFyYXRpb24tYWZ0ZXItc3RhdGVtZW50Cj4gPiA+ID4gLVduby11bnVzZWQtYnV0LXNl
dC12YXJpYWJsZSAtV25vLXVudXNlZC1sb2NhbC10eXBlZGVmcyAgIC1PMgo+ID4gPiA+IC1mb21p
dC1mcmFtZS1wb2ludGVyCj4gPiA+ID4gLURfX1hFTl9JTlRFUkZBQ0VfVkVSU0lPTl9fPV9fWEVO
X0xBVEVTVF9JTlRFUkZBQ0VfVkVSU0lPTl9fIC1NTUQgLU1GCj4gPiA+ID4gLmhhbmRsZXJlZy5v
LmQgLURfTEFSR0VGSUxFX1NPVVJDRSAtRF9MQVJHRUZJTEU2NF9TT1VSQ0UgICAtV2Vycm9yCj4g
PiA+ID4gLVdtaXNzaW5nLXByb3RvdHlwZXMgLUkuL2luY2x1ZGUKPiA+ID4gPiAtSS9ob21lL2Mv
dy9yY2FyX2gzX3VidW50dTE2MDRfeW9jdG8vYnVpbGQvdG1wL3dvcmsvYWFyY2g2NC1wb2t5LWxp
bnV4L3hlbi80LjEyLjAuMCtnaXRBVVRPSU5DK2ZkMmEzNGM5NjUtcjAvZ2l0L3Rvb2xzL2xpYnMv
dG9vbGNvcmUvLi4vLi4vLi4vdG9vbHMvaW5jbHVkZQo+ID4gPiA+ICAgLWMgLW8gaGFuZGxlcmVn
Lm8gaGFuZGxlcmVnLmMKPiA+ID4KPiA+ID4gLi4uIHRoaXMgbG9va3MgbGlrZSBhIHRvb2wgYnVp
bGRpbmcgZXJyb3Igd2hlbiBJIG9ubHkgdG91Y2ggdGhlCj4gPiA+IGh5cGVydmlzb3IgcGFydC4g
QXJlIHlvdSBjZXJ0YWluIHRoaXMgaXMgbXkgcGF0Y2ggYW5kIG5vdCBhbm90aGVyIGVycm9yCj4g
PiA+IGluIFhlbiA0LjEyIChvciBhbnkgcGF0Y2ggeW91IGhhdmUgb24gdG9wKT8KPiA+Cj4gPiBK
dWxpZW4sIHlvdSBhcmUgcmlnaHQsIGl0IHdhcyBsb2NhbCBlbnZpcm9ubWVudCBidWlsZCBpc3N1
ZSAoc29ycnkgZm9yIHRoYXQpLgo+ID4gWGVuIEdDQyBjb3ZlcmFnZSBmZWF0dXJlIHdvcmtzIHdl
bGwgd2l0aCBBYXJjaDY0IHdpdGggdGhpcyBwYXRjaC4KPiA+IENoZWNrZWQgYm90aCBjb21tYW5k
cywgeGVuY292IHJlYWQgYW5kIHhlbmNvdiByZXNldCAtIGJvdGggd29yayB3ZWxsCj4gPiAobm8g
Y3Jhc2hlcyBhbnltb3JlKS4KPiA+Cj4gPiBQbGVhc2UgYWxzbyBub3RlIHRoYXQgdXNlIGNhc2Ug
bWVudGlvbmVkIGluIFhlbiBkb2N1bWVudGF0aW9uCj4gPiAoeGVuY292X3NwbGl0KSBpcyBhbHNv
IG9rIHdpdGggZ2VuZXJhdGVkIGNvdmVyYWdlLmRhdCBpbnB1dDoKPiA+IHhlbi5naXQveGVuJCBz
c2ggcm9vdEBob3N0IHhlbmNvdiByZWFkID4gY292ZXJhZ2UuZGF0Cj4gPiB4ZW4uZ2l0L3hlbiQg
Li4vdG9vbHMveGVuY292X3NwbGl0IGNvdmVyYWdlLmRhdCAtLW91dHB1dC1kaXI9Lwo+ID4geGVu
LmdpdC94ZW4kIGdlbmluZm8gLiAtbyBjb3YuaW5mbwo+ID4geGVuLmdpdC94ZW4kIGdlbmh0bWwg
Y292LmluZm8gLW8gY292Lwo+ID4geGVuLmdpdC94ZW4kICRCUk9XU0VSIGNvdi9pbmRleC5odG1s
Cj4gPgo+ID4gLS0tLS0tLS0KPiA+IE1pbm9yIG9ic2VydmF0aW9uIGFib3V0IGNvdmVyYWdlIGJ1
aWxkIHByb2NlZHVyZS4gRG9jdW1lbnRhdGlvbiBzdGF0ZXM6Cj4gPiAiVG8gYnVpbGQgd2l0aCBj
b3ZlcmFnZSBzdXBwb3J0LCBlbmFibGUgQ09ORklHX0NPVkVSQUdFIGluIEtjb25maWcuIgo+ID4g
SG93ZXZlciwgdG8gYnVpbGQgaXQgcHJvcGVybHksIGl0IG5lZWRzIHRvIGVuYWJsZSBjb3ZlcmFn
ZSBmZWF0dXJlIGluCj4gPiB0d28gcGxhY2VzIC0gbWFpbiB4ZW4gbWFrZSBjb21tYW5kIGxpbmUg
YW5kIGh5cGVydmlzb3IgLmNvbmZpZyBmaWxlLgo+ID4gSXMgaXQgZXhwZWN0ZWQgd2F5IHRvIGJ1
aWxkIHhlbiB3aXRoIGNvdmVyYWdlIGZlYXR1cmU/IElmIHllcywKPiA+IHByb2JhYmx5IHdlIHNo
b3VsZCBpbXByb3ZlIChvciBhdCBsZWFzdCBkb2N1bWVudCkgaXQgc29tZSBkYXkuLi4KPgo+IFdo
YXQgZG9lcyB5b3VyIG1ha2UgY29tbWFuZCBsaW5lIGxvb2sgbGlrZT8KPgo+IFdlaS4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
