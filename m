Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DD5105F94
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 06:21:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iY1Jt-0006Dm-S6; Fri, 22 Nov 2019 05:17:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5Q5S=ZO=soleen.com=pasha.tatashin@srs-us1.protection.inumbo.net>)
 id 1iXwqb-0001hr-GL
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 00:30:53 +0000
X-Inumbo-ID: 56c3f90c-0cbf-11ea-9631-bc764e2007e4
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 56c3f90c-0cbf-11ea-9631-bc764e2007e4;
 Fri, 22 Nov 2019 00:30:52 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id t11so4403816eds.13
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2019 16:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p8S5GRxfxB7MPCj+Eww2v+N3SSDa3SwY872hQxbGyeE=;
 b=SwDeNapr8C2hZtNWi6QBd3lpU7IbLJ10rTgPoY37OuwGIIHILjqN8ZXIj83SFbbr7g
 YzAi6ZwttEnHRQxMLHdr0KR362IBbLpoJ5EQeuCtrhGYhqHmbxJ2UblkssOkCiA4sPgS
 Rml0Bkr1b8tqWCIvh+G9oBFMyxor3gMwJDbS/53jn8rJ3kmsZTBXA1PjvNfIKfTdTwLC
 wF3jnFSC3C9BdMkjWYAGvnrnEMotMC0HvDkDZ3uMzOkU+lr7w1aQmLJPPyOQb/OkjBFA
 PHVlsE9Glij+peO87AM8pBwdkmSWP8tNYMCmSsqv0mrQedYRcQNccHHzELqAuMzRn8/g
 566A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p8S5GRxfxB7MPCj+Eww2v+N3SSDa3SwY872hQxbGyeE=;
 b=IAN8rrYMG5ZFY75NAzaxF10Eym+FnGHWTxPzvRyd4UtZ8UA0f2F939nFrW1meVohlR
 T6VihwBI4UEMiiIFQ66gpjlxFEI2/YUCL3cmuQln7VmO7d1/B74JA52ZxqZyQzV8KMMQ
 X5MWFjY9T4mpAMZzjXxPu5c9OP35h1vGwJK0bnO+gYmew6DbpsalyzkP6gSZTsCw810O
 wX3MJcMCPnIB4oCpNaRwRPFe7CX3dZ5euYLO9oyStvVsiCZRIpHDJN7c4j7PCehJW4qI
 gCKusYWZ7P65B2O5zs6lpUhAa8tZkq+9knob17FCt3QsFlWx+KnSQtrPywYwqH2+E9gM
 z6/g==
X-Gm-Message-State: APjAAAWcvJWuiF4lp4A12dISHhSsIyCdOlgqmuSQwvvNCdxY865o0S+X
 DJPQDy0NZoLR3mkwBjvEYIRa7SKt4ZVHpO0/c5mbEQ==
X-Google-Smtp-Source: APXvYqybAjsW4IBztIRMQztbxdt6s24fSxLSh87RJOD7czfT0URIvB2H9RrIUrGlfVNwROY40qStEmAhGA2156oOCE0=
X-Received: by 2002:a17:906:90b:: with SMTP id
 i11mr18003315ejd.109.1574382651825; 
 Thu, 21 Nov 2019 16:30:51 -0800 (PST)
MIME-Version: 1.0
References: <20191121184805.414758-1-pasha.tatashin@soleen.com>
 <20191121184805.414758-2-pasha.tatashin@soleen.com>
 <20191122002258.GD25745@shell.armlinux.org.uk>
In-Reply-To: <20191122002258.GD25745@shell.armlinux.org.uk>
From: Pavel Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 21 Nov 2019 19:30:41 -0500
Message-ID: <CA+CK2bDtADA2eVwJAUEPhpic8vXWegh8yLjo6Q6WmXZDxAfJpA@mail.gmail.com>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
X-Mailman-Approved-At: Fri, 22 Nov 2019 05:17:22 +0000
Subject: Re: [Xen-devel] [PATCH 1/3] arm/arm64/xen: use C inlines for
 privcmd_call
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, stefan@agner.ch,
 Masahiro Yamada <yamada.masahiro@socionext.com>, Will Deacon <will@kernel.org>,
 boris.ostrovsky@oracle.com, Sasha Levin <sashal@kernel.org>,
 sstabellini@kernel.org, James Morris <jmorris@namei.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 xen-devel@lists.xenproject.org, Vladimir Murzin <vladimir.murzin@arm.com>,
 Marc Zyngier <marc.zyngier@arm.com>, alexios.zavras@intel.com,
 Thomas Gleixner <tglx@linutronix.de>, allison@lohutok.net, jgross@suse.com,
 steve.capper@arm.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, James Morse <james.morse@arm.com>,
 info@metux.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiA+ICsjaWZkZWYgQ09ORklHX0NQVV9TV19ET01BSU5fUEFOCj4gPiArc3RhdGljIF9fYWx3YXlz
X2lubGluZSB2b2lkIHVhY2Nlc3NfZW5hYmxlKHZvaWQpCj4gPiArewo+ID4gKyAgICAgdW5zaWdu
ZWQgbG9uZyB2YWwgPSBEQUNSX1VBQ0NFU1NfRU5BQkxFOwo+ID4gKwo+ID4gKyAgICAgYXNtIHZv
bGF0aWxlKCJtY3IgcDE1LCAwLCAlMCwgYzMsIGMwLCAwIiA6IDogInIiICh2YWwpKTsKPiA+ICsg
ICAgIGlzYigpOwo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQg
dWFjY2Vzc19kaXNhYmxlKHZvaWQpCj4gPiArewo+ID4gKyAgICAgdW5zaWduZWQgbG9uZyB2YWwg
PSBEQUNSX1VBQ0NFU1NfRU5BQkxFOwoKT29wcywgc2hvdWxkIGJlIERBQ1JfVUFDQ0VTU19ESVNB
QkxFLgoKPiA+ICsKPiA+ICsgICAgIGFzbSB2b2xhdGlsZSgibWNyIHAxNSwgMCwgJTAsIGMzLCBj
MCwgMCIgOiA6ICJyIiAodmFsKSk7Cj4gPiArICAgICBpc2IoKTsKPiA+ICt9Cj4KPiBSYXRoZXIg
dGhhbiBpbnZlbnRpbmcgdGhlc2UsIHdoeSBub3QgdXNlIHVhY2Nlc3Nfc2F2ZV9hbmRfZW5hYmxl
KCkuLgo+IHVhY2Nlc3NfcmVzdG9yZSgpIGFyb3VuZCB0aGUgWGVuIGNhbGw/CgpUaGFuayB5b3Ug
Zm9yIHN1Z2dlc3Rpb246IHVhY2Nlc3NfZW5hYmxlKCkgYW5kIHVhY2Nlc3NfZGlzYWJsZSgpIGFy
ZQpjb21tb24gY2FsbHMgd2l0aCBhcm02NCwgc28gSSB3aWxsIG5lZWQgdGhlbSwgYnV0IEkgdGhp
bmsgSSBjYW4gdXNlCnNldF9kb21haW4oKSB3aXRoIERBQ1JfVUFDQ0VTU19ESVNBQkxFIC9EQUNS
X1VBQ0NFU1NfRU5BQkxFIGluc2lkZQp0aGVzZSBpbmxpbmVzLgoKUGFzaGEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
