Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9130A1492E2
	for <lists+xen-devel@lfdr.de>; Sat, 25 Jan 2020 03:01:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ivAiV-0007H8-R3; Sat, 25 Jan 2020 01:58:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=i6Vi=3O=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1ivAiU-0007H3-Vd
 for xen-devel@lists.xenproject.org; Sat, 25 Jan 2020 01:58:31 +0000
X-Inumbo-ID: 2ea11eb2-3f16-11ea-9fd7-bc764e2007e4
Received: from mail-yb1-xb42.google.com (unknown [2607:f8b0:4864:20::b42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2ea11eb2-3f16-11ea-9fd7-bc764e2007e4;
 Sat, 25 Jan 2020 01:58:30 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id n66so1969057ybg.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jan 2020 17:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=TPe5pI+rGS7uwZtTvb9o5tisrUV+jwgtRPnoEsCWdz8=;
 b=sCLXpPOojOUj8p+xF53gCxFcTbNDusnyLpo1k6IcLhzG+OJzWcl0aJnaoEdjPijPGZ
 oRixjHouHB6DTg1iRNpWMtyMsuq7rG0y9ay5OyYQ5w+LRJ4blK/BfrvEtqFt+TXmGt5t
 3aswFrlh5gdVTFCU+cppUj3b+gCyw1+adt2IbMi7whjDodvNlNIpOA3oT3DPOBdObSK8
 yYbcyqjheBkq6jgmPE6zHY/HO8lIa4XB7F6qawwbCeTpqy2bejzDofmsT62Ocq+mHxoJ
 AUDXCAbF2c0Xy2dYELt7PozDDsDhwU1ePii7+khelHxbgZxamqnuR0MxkEHCAtfNDUz3
 PpXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=TPe5pI+rGS7uwZtTvb9o5tisrUV+jwgtRPnoEsCWdz8=;
 b=QjKgkbjou07SxSB6J1ySuoxH621Hg1xicwbN1F5A/zRK6mgCG4v9xj0Oaw/u04YZqZ
 wLCyc+JEx8og3kM/j+SB8tEOt7a/wd/2dAUwvOPtoH/QKJ31bbZx4BwLDzhe0ktwoiC4
 QQZ2QMHa11OxHdRCLokVoYYqmggZ+s8Ho6lVyC8iIabqjReYrvNips6ycoYzzJUvmN+O
 0MY/a31MiTE/Letil7cCLg7WF6ByrJo5buPsWml2hBc9V4vDDg8B0NqHrkJunG6qN94U
 NMDhi5WHn2hwrU3V2oOL6NB9fpnu0BTxg3qT0uz6gQiVIqERB+T7x0M4yMIDrD/d8oNO
 126Q==
X-Gm-Message-State: APjAAAVZTA2QgWZcaQo4l2Mp50CHmlh3XTUkLui+5skpftnBtutmejsU
 v3ItcOMogYB4gumEi6ZxKno=
X-Google-Smtp-Source: APXvYqwAeE7oZyC6e74tW2iUdfiYpwdrXMP+e00lLw5EOxkY1M/G+DZThsf4oDBG7JIFK4Etq1ZD+Q==
X-Received: by 2002:a25:4d88:: with SMTP id a130mr3606138ybb.516.1579917508753; 
 Fri, 24 Jan 2020 17:58:28 -0800 (PST)
Received: from bobbye-pc ([216.186.244.35])
 by smtp.gmail.com with ESMTPSA id z12sm3108462ywl.27.2020.01.24.17.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2020 17:58:28 -0800 (PST)
Date: Fri, 24 Jan 2020 19:58:24 -0600
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200125015824.GA11702@bobbye-pc>
References: <cover.1579615303.git.bobbyeshleman@gmail.com>
 <f8ca4739-83c7-5829-4663-b1e5796e6490@citrix.com>
 <20200123051945.GB6612@bobbye-pc>
 <b951559a-aacb-39a0-682c-e4080c35a47c@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b951559a-aacb-39a0-682c-e4080c35a47c@citrix.com>
Subject: Re: [Xen-devel] [RFC XEN PATCH 00/23] xen: beginning support for
 RISC-V
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Bobby Eshleman <bobby.eshleman@starlab.io>,
 Dan Robertson <dan@dlrobertson.com>,
 Alistair Francis <alistair.francis@wdc.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMjMsIDIwMjAgYXQgMDQ6MDI6NTZQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiAKPiBXZSBoYXZlIGh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC94ZW4vcGlw
ZWxpbmVzIHdoaWNoIHJ1bnMgYSBsb2FkCj4gb2YgY29udGFpbmVyaXNlZCBidWlsZHMuwqAgSG93
IGVhc3kgaXMgaXQgdG8gc2V0IHVwIGEgY29udGFpbmVyaXNlZAo+IFJJU0MtViBjcm9zcy1jb21w
aWxlciBlbnZpcm9ubWVudD8KPiAKCkl0J3MgcHJldHR5IGVhc3kuICBJIHBlcnNvbmFsbHkgdXNl
IGEgRG9ja2VyIGNvbnRhaW5lciB0aGF0IGhhcyB0aGUgYmlucwpidWlsdCBmcm9tIHNvdXJjZSBm
cm9tIGJvdGggdGhlIFJJU0MtViBnY2MgdG9vbGNoYWluIGFuZCBRRU1VLgoKPiBUaGUgdGVzdCBz
dGVwIGFsc28gYm9vdHMgWGVuIHVuZGVyIFFlbXUgc29mdHdhcmUgZW11bGF0aW9uIHRvIGNoZWNr
IHRoYXQKPiB3ZSBkb24ndCBoYXZlIGFueSBib290LXRpbWUgc2NyZWFtZXJzLsKgIEEgcmVhc29u
YWJsZSBzZWNvbmQgc3RlcCBtaWdodAo+IGJlIHRvIGhhdmUgc3RhcnRfeGVuKCkgcGFuaWMoKSBh
dCB0aGUgZW5kLCBhbmQgY2hlY2sgZm9yIHRoYXQgaW4gdGhlCj4gY29uc29sZSBsb2csIHdoaWNo
IHdvdWxkIGFsbG93IGZvciBzb21lIGtpbmQgb2YgYm9vdCB0ZXN0aW5nIGJlZm9yZQo+IGdldHRp
bmcgYWxsIHRoZSB3YXkgdG8gImFuZCBoZXJlIGlzIGRvbTAgcmVhZHkgdG8gcnVuIi4KPiAKPiBB
bGwgY29uZmlndXJhdGlvbiBpcyBpbiAuZ2l0bGFiLWNpLnltbCBhbmQgYXV0b21hdGlvbi8uCj4g
CgpUaGF0IHNvdW5kcyBpZGVhbCBhbmQgbGlrZSBhIHBlcmZlY3QgcGxhY2UgdG8gc3RhcnQuCgpU
aGFua3MhCi1Cb2JieQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
