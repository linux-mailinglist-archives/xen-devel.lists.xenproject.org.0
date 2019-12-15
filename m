Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E531A11F71A
	for <lists+xen-devel@lfdr.de>; Sun, 15 Dec 2019 11:01:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igQfn-0003Hb-EI; Sun, 15 Dec 2019 09:58:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HQhN=2F=redhat.com=mst@srs-us1.protection.inumbo.net>)
 id 1igQfl-0003HU-Dh
 for xen-devel@lists.xenproject.org; Sun, 15 Dec 2019 09:58:45 +0000
X-Inumbo-ID: 7878c720-1f21-11ea-9278-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 7878c720-1f21-11ea-9278-12813bfff9fa;
 Sun, 15 Dec 2019 09:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576403920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ojwrHY0zHg+5NLkr12eP+nk8VjcM3a/wtoqud6h53+8=;
 b=RSqSNJ9z74wGTFb39/WGdvVc0XFepJXUmmAXVHNWepT49l7O4xP0/jkcXJKCWDoKPwm1Gy
 SATIK8lRyddvzvvhTQ25oiA4g3KQIiu3F6xLtR0Xj0f3iuJgnYNTLnXmhTtdJzSh+5QBi3
 82l6JpEondGhHSIvB6wjmXrWn7/0DY0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-ExuwKdlIOtm4frHCkt-k0g-1; Sun, 15 Dec 2019 04:58:34 -0500
Received: by mail-qt1-f199.google.com with SMTP id c8so2602658qte.22
 for <xen-devel@lists.xenproject.org>; Sun, 15 Dec 2019 01:58:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=uglnVCAjnaUsXT9ZTT7mKFQQrU34w0ggWLPMx7AnQTk=;
 b=sG8CX1fn+JSA3olahZqaOzjc8llJxbUGuwbO56wTgNEDCZhPl54FzgWAfX7XkJQogP
 Au4WJ0ZuZfmWqsiA/2AcD6C1BZjywrD0nFh7H2s2TdLfpjy8OYhRa4XgKIQDd3WearVK
 xPR4nJ7Z9u260D0ozv0eW4lhvho8Z7P04j6ZNMgaXdcxwmKKih0tgZNzmPM2775MxvnA
 Zdv6NeDhBrYh6DWSO4z2HkYIcVQj5Yz55IG/1ingLlL4C/mOcEqKnNQTRHC484QjDycg
 Bui0SVIUtIKb75uJDiVlziiPZfQR+0QyfYhK/0yj2yUOBEwgtbAsqUVJjnJ0rnIn7+VE
 eM9g==
X-Gm-Message-State: APjAAAWZ8FsIci3Ed/L9+loJFLJdzsDDmUxWV2W8nLlqVTjMRbMlkTuw
 lj7hF9GjEWHXqt80YXRcDbQB2CxQ7cJgSwv0yQcm3xH36wMzuYjqfNrTrk7U8ZlzlxelxcqDBne
 CKPq7Z9VNnJjRPmoIkkFPwfniAmg=
X-Received: by 2002:ac8:2bb9:: with SMTP id m54mr20346509qtm.150.1576403914505; 
 Sun, 15 Dec 2019 01:58:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqxShGzMmQTP0GPg+U7XkjAABhRbEWqYV30OwRBbm04m47kjZ2QozlKgsELOkgUl7CsWCeS0Iw==
X-Received: by 2002:ac8:2bb9:: with SMTP id m54mr20346493qtm.150.1576403914297; 
 Sun, 15 Dec 2019 01:58:34 -0800 (PST)
Received: from redhat.com (bzq-79-181-48-215.red.bezeqint.net. [79.181.48.215])
 by smtp.gmail.com with ESMTPSA id 184sm4752304qke.73.2019.12.15.01.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2019 01:58:33 -0800 (PST)
Date: Sun, 15 Dec 2019 04:58:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Message-ID: <20191215045812-mutt-send-email-mst@kernel.org>
References: <20191213161753.8051-1-philmd@redhat.com>
 <20191213161753.8051-13-philmd@redhat.com>
 <d9792ff4-bada-fbb9-301d-aeb19826235c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <d9792ff4-bada-fbb9-301d-aeb19826235c@redhat.com>
X-MC-Unique: ExuwKdlIOtm4frHCkt-k0g-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 12/12] hw/i386/pc: Move PC-machine specific
 declarations to 'pc_internal.h'
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Sergio Lopez <slp@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBEZWMgMTMsIDIwMTkgYXQgMDU6NDc6MjhQTSArMDEwMCwgUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgd3JvdGU6Cj4gT24gMTIvMTMvMTkgNToxNyBQTSwgUGhpbGlwcGUgTWF0aGlldS1E
YXVkw6kgd3JvdGU6Cj4gPiBIaXN0b3JpY2FsbHksIFFFTVUgc3RhcnRlZCB3aXRoIG9ubHkgb25l
IFg4NiBtYWNoaW5lOiB0aGUgUEMuCj4gPiBUaGUgJ2h3L2kzODYvcGMuaCcgaGVhZGVyIHdhcyB1
c2VkIHRvIHN0b3JlIGFsbCBYODYgYW5kIFBDCj4gPiBkZWNsYXJhdGlvbnMuIFNpbmNlIHdlIGhh
dmUgbm93IG11bHRpcGxlIG1hY2hpbmVzIGJhc2VkIG9uIHRoZQo+ID4gWDg2IGFyY2hpdGVjdHVy
ZSwgbW92ZSB0aGUgUEMtc3BlY2lmaWMgZGVjbGFyYXRpb25zIGluIGEgbmV3Cj4gPiBoZWFkZXIu
Cj4gPiBXZSB1c2UgJ2ludGVybmFsJyBpbiB0aGUgbmFtZSB0byBleHBsaWNpdCB0aGlzIGhlYWRl
ciBpcyByZXN0cmljdGVkCj4gPiB0byB0aGUgWDg2IGFyY2hpdGVjdHVyZS4gT3RoZXIgYXJjaGl0
ZWN0dXJlIGNhbiBub3QgYWNjZXNzIGl0Lgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBw
ZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+Cj4gPiAtLS0KPiA+IE1heWJlIG5h
bWUgaXQgJ3BjX21hY2hpbmUuaCc/Cj4gCj4gSSBmb3Jnb3QgdG8gZGVzY3JpYmUgaGVyZSAoYW5k
IGluIHRoZSBjb3ZlciksIHdoYXQncyBmb2xsb3cgYWZ0ZXIgdGhpcwo+IHBhdGNoLgo+IAo+IFBh
dGNoICMxMyBtb3ZlcyBQQ01hY2hpbmVDbGFzcyB0bwo+IAo+IElmIHlvdSBpZ25vcmUgUENNYWNo
aW5lU3RhdGUsICJody9pMzg2L3BjLmgiIG5vdyBvbmx5IGNvbnRhaW5zIDc2IGxpbmVzLCBhbmQK
PiBpdCBpcyBlYXNpZXIgdG8gc2VlIHdoYXQgaXMgUEMgbWFjaGluZSBzcGVjaWZpYywgd2hhdCBp
cyBYODYgc3BlY2lmaWMsIGFuZAo+IHdoYXQgaXMgZGV2aWNlIGdlbmVyaWMgKG5vdCBYODYgcmVs
YXRlZCBhdCBhbGwpOgo+IAo+IC0gR1NJIGlzIGNvbW1vbiB0byBYODYgKFBhb2xvIHNlbnQgWzNd
LCBbNl0pCj4gLSBJT0FQSUMgaXMgY29tbW9uIHRvIFg4Ngo+IC0gaTgyNTkgaXMgbXVsdGlhcmNo
IChQYW9sbyBbMl0pCj4gLSBQQ0lfSE9TVCBkZWZpbml0aW9ucyBhbmQgcGNfcGNpX2hvbGU2NF9z
dGFydCgpIGFyZSBYODYKPiAtIHBjX21hY2hpbmVfaXNfc21tX2VuYWJsZWQoKSBpcyBYODYgKFBh
b2xvIHNlbnQgWzVdKQo+IC0gaHBldAo+IC0gdHNjIChQYW9sbyBzZW50IFszXSkKPiAtIDMgbW9y
ZSBmdW5jdGlvbnMKPiAKPiBTbyB3ZSBjYW4gbW92ZSBoYWxmIG9mIHRoaXMgZmlsZSB0byAicGNf
aW50ZXJuYWwuaCIgYW5kIHRoZSBvdGhlciB0bwo+IAo+IE9uZSBwcm9ibGVtIGlzIHRoZSBRMzUg
TUNIIG5vcnRoIGJyaWRnZSB3aGljaCBkaXJlY3RseSBzZXRzIHRoZSBQQ0kKPiBQQ01hY2hpbmVT
dGF0ZS0+YnVzIGluIHEzNV9ob3N0X3JlYWxpemUoKS4gVGhpcyBzZWVtcyBhIFFPTSB2aW9sYXRp
b24gYW5kIGlzCj4gcHJvYmFibHkgZWFzaWx5IGZpeGFibGUuCj4gCj4gTWF5YmUgSSBjYW4gYXBw
bHkgUGFvbG8ncyBwYXRjaGVzIGluc3RlYWQgb2YgdGhpcyAjMTIsIG1vdmUgWDg2LWdlbmVyaWMK
PiBkZWNsYXJhdGlvbnMgdG8gImh3L2kzODYveDg2LmgiLCBhbmQgZGlyZWN0bHkgZ2l0LW1vdmUg
d2hhdCdzIGxlZnQgb2YKPiAiaHcvaTM4Ni9wYy5oIiB0byAicGNfaW50ZXJuYWwuaCIuCgpZZWEg
dGhhdCBzb3VuZHMgYSBiaXQgYmV0dGVyLgoKPiBbM10gaHR0cHM6Ly93d3cubWFpbC1hcmNoaXZl
LmNvbS9xZW11LWRldmVsQG5vbmdudS5vcmcvbXNnNjY0NjI3Lmh0bWwKPiBbMl0gaHR0cHM6Ly93
d3cubWFpbC1hcmNoaXZlLmNvbS9xZW11LWRldmVsQG5vbmdudS5vcmcvbXNnNjY0NzY1Lmh0bWwK
PiBbNV0gaHR0cHM6Ly93d3cubWFpbC1hcmNoaXZlLmNvbS9xZW11LWRldmVsQG5vbmdudS5vcmcv
bXNnNjY0NzU0Lmh0bWwKPiBbNl0gaHR0cHM6Ly93d3cubWFpbC1hcmNoaXZlLmNvbS9xZW11LWRl
dmVsQG5vbmdudS5vcmcvbXNnNjY0NzY2Lmh0bWwKPiAKPiA+IC0tLQo+ID4gICBody9pMzg2L3Bj
X2ludGVybmFsLmggfCAxNDQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrCj4gPiAgIGluY2x1ZGUvaHcvaTM4Ni9wYy5oICB8IDEyOCAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCj4gPiAgIGh3L2kzODYvYWNwaS1idWlsZC5jICB8ICAgMSArCj4g
PiAgIGh3L2kzODYvcGMuYyAgICAgICAgICB8ICAgMSArCj4gPiAgIGh3L2kzODYvcGNfcGlpeC5j
ICAgICB8ICAgMSArCj4gPiAgIGh3L2kzODYvcGNfcTM1LmMgICAgICB8ICAgMSArCj4gPiAgIGh3
L2kzODYvcGNfc3lzZncuYyAgICB8ICAgMSArCj4gPiAgIGh3L2kzODYveGVuL3hlbi1odm0uYyB8
ICAgMSArCj4gPiAgIDggZmlsZXMgY2hhbmdlZCwgMTUwIGluc2VydGlvbnMoKyksIDEyOCBkZWxl
dGlvbnMoLSkKPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGh3L2kzODYvcGNfaW50ZXJuYWwuaAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
