Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB8A16C3E4
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 15:29:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6bAv-00063I-Gx; Tue, 25 Feb 2020 14:27:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xmvt=4N=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1j6bAu-000638-5e
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 14:27:04 +0000
X-Inumbo-ID: e4228bd6-57da-11ea-a490-bc764e2007e4
Received: from mail-ed1-x533.google.com (unknown [2a00:1450:4864:20::533])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e4228bd6-57da-11ea-a490-bc764e2007e4;
 Tue, 25 Feb 2020 14:27:03 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id e10so16415071edv.9
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2020 06:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mGHRLnRmPfVqNV6FIQ+IsCyoHGxeK022bP7mJWNRNf0=;
 b=a+G2nP/2uFuALP/OWdSO5fqIwZZ7isQPTGasYNlHQq5lTMjt4JSZwcJ7ZNw7CjxSW6
 GrS8BK72X0RQ3Ye3FUvFO+bs8Y1H4QF7ySnmY+pnZ6HlHHf46s/TzT26WIpiDk4jv3OT
 bm6Z8JA8CSNJKDtSahr/vWtpM9SrRNkLM68qLh45fFDBIgHZaZoZYUgzt+5wljQokcGQ
 ZKJ5EPbqJW/+wZAaLUJsKSngfPDqjNuBjhOkRp8+7H65K406y3eaGgjA+E7pORylTQvv
 UoZkjbyEncSyZ2vGXlLKFXDp367rcyqFculUFpX8BmtRtHiZKlU0uCz5ir5sHwTi+K+b
 8VZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mGHRLnRmPfVqNV6FIQ+IsCyoHGxeK022bP7mJWNRNf0=;
 b=RCL0TlUxzt6koPluDNrcFcyzItDUqckmMa13N5fT3slvpWNcE4Fumqu11KdjKll6Yz
 Pm2crWQ+40cFhUUyMQnpc6KnSUfiIdLP723K6OCB3K0l5m/dqEDOj3/FFIUK/ddE2sKt
 DHqR0D95QDSHNtG/+XwJVwuigUQPGiBgZITsvziRNmgV4sgw8pIHn3whIY1tt0qwALOY
 ajp47lKfMZZi41p5VUmIV1HgcCBedWfk9N2u+BOpfvZ25qr1Fu+DD8SDircHJsk1HBTY
 uVDxHWM/PQn0HVqCFdCpVAGoIPd+G6Jb9tNAq9rqN76faG/JV9iMUsx+KPijQKbL0ZbM
 I5zg==
X-Gm-Message-State: APjAAAXf2rPLMV0TQ6cHmAD4Flhp3sDYNzkdMul4vmFq8ByRskMpm5+g
 KakXLpoY0DbpPVjwr0XFm94SYfbZcDg=
X-Google-Smtp-Source: APXvYqz0R3MqZhePAxF6D5FIhcN1CeaoombRzBmB07csnib6j7kG61r4UFzgLFHYZxvAbSwsYiOVxA==
X-Received: by 2002:a05:6402:22cf:: with SMTP id
 dm15mr14866636edb.31.1582640822482; 
 Tue, 25 Feb 2020 06:27:02 -0800 (PST)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com.
 [209.85.221.46])
 by smtp.gmail.com with ESMTPSA id dc5sm1234662edb.61.2020.02.25.06.27.01
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2020 06:27:01 -0800 (PST)
Received: by mail-wr1-f46.google.com with SMTP id z3so14977654wru.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2020 06:27:01 -0800 (PST)
X-Received: by 2002:adf:9cca:: with SMTP id h10mr3292556wre.390.1582640821043; 
 Tue, 25 Feb 2020 06:27:01 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582310142.git.tamas.lengyel@intel.com>
 <818edf7f9407e377bba6564d58b9c65bce5e6493.1582310142.git.tamas.lengyel@intel.com>
 <20200224151250.GR4679@Air-de-Roger>
 <CABfawhmxwVbNH3o2wpn+SpH=cpVkYS2FsxPccFQt=XqQr=KMwA@mail.gmail.com>
 <c2c48b3c-4bbb-698f-2783-4bc2359cd985@suse.com>
 <CABfawhk1yZ66_xU0uOjpF1CyEh1V8HGCE4=-msCyqb_nxwrg9g@mail.gmail.com>
 <971a3211-68b5-f07e-f869-060cd63abad6@suse.com>
In-Reply-To: <971a3211-68b5-f07e-f869-060cd63abad6@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 25 Feb 2020 07:26:25 -0700
X-Gmail-Original-Message-ID: <CABfawhmO1wdNdGbiKRoLAJY7hOb=tp1bS8nCLz6iN18FKFUOSA@mail.gmail.com>
Message-ID: <CABfawhmO1wdNdGbiKRoLAJY7hOb=tp1bS8nCLz6iN18FKFUOSA@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v9 4/5] x86/mem_sharing: reset a fork
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiA+PiBJbiBzdWNoIGEgY2FzZSwgcGxlYXNlIHB1dCBpbiBhIGNvbW1lbnQgZXhwbGFpbmluZyB3
aHkgZmFpbHVyZSBpcwo+ID4+IGltcG9zc2libGUuIEluIHRoZSBnZW5lcmFsIGNhc2UgZS5nLiBh
IDJNYiBwYWdlIG1heSBuZWVkIHNwbGl0dGluZywKPiA+PiB3aGljaCBtYXkgeWllbGQgLUVOT01F
TS4gU3VjaCBhIGNvbW1lbnQgd2lsbCB0aGVuIGFsc28gYmUgdXNlZnVsIGluCj4gPj4gY2FzZSBh
IG5ldyBmYWlsdXJlIG1vZGUgZ2V0cyBhZGRlZCB0byAtPnNldF9lbnRyeSgpLCB3aGVyZSBpdCB0
aGVuCj4gPj4gd2lsbCBuZWVkIGp1ZGdpbmcgd2hldGhlciB0aGUgYXNzdW1wdGlvbiBoZXJlIHN0
aWxsIGhvbGRzLiAoVGhpcyBpcwo+ID4+IGFsc28gd2h5IGluIGdlbmVyYWwgaXQnZCBiZSBiZXR0
ZXIgdG8gaGFuZGxlIHRoZSBlcnJvci4gSXQnbGwgc3RpbGwKPiA+PiBiZSBiZXR0ZXIgdG8gY3Jh
c2ggdGhlIGd1ZXN0IHRoYW4gdGhlIGhvc3QgaW4gY2FzZSB5b3UgY2FuJ3QuIFNlZQo+ID4+IHRo
ZSBib3R0b20gb2YgLi9DT0RJTkdfU1RZTEUuKQo+ID4KPiA+IFRoZSBtZW1fc2hhcmluZyBjb2Rl
YmFzZSB1c2VzIEFTU0VSVCghcmMpIG9uIHAybS0+c2V0X2VudHJ5IGFscmVhZHkKPiA+IHdoZW4g
cmVtb3ZpbmcgcGFnZXMgbGlrZSB3ZSBkbyBoZXJlIChzZWUgcmVsaW5xdWlzaF9zaGFyZWRfcGFn
ZXMpLgo+ID4gVGhpcyBvbmx5IGdldHMgY2FsbGVkIG9uIHNoYXJlZCBwYWdlcyB0aGF0IHdlIGtu
b3cgZm9yIHN1cmUgYXJlCj4gPiBwcmVzZW50LiBTaW5jZSB0aGVzZSBhcmUgc2hhcmVkIHBhZ2Vz
IHdlIGtub3cgdGhhdCB0aGVpciBzaXplIGlzIDRrCj4gPiB0aHVzIHRoZXJlIGlzIG5vIHNwbGl0
dGluZy4gSSBjYW4gY2VydGFpbmx5IGFkZCBhIGNvbW1lbnQgdG8gdGhpcwo+ID4gZWZmZWN0IHRv
IHNwZWxsIGl0IG91dCB3aHkgdGhlIEFTU0VSVCBpcyBhcHByb3ByaWF0ZS4KPgo+IFdlbGwsIGlm
IHRoaXMgaXMgYSBwcmUtZXhpc3RpbmcgcGF0dGVybiBpbiB0aGUgZmlsZSwgdGhlbiAtIHlvdQo+
IGJlaW5nIHRoZSBtYWludGFpbmVyIC0gc28gYmUgaXQuIEkgY29uc2lkZXIgdGhpcyBiYWQgcHJh
Y3RpY2UgdGhvdWdoLAo+IGFuZCBJIHdvdWxkIHN1Z2dlc3QgdGhhdCBldmVyeSBzdWNoIHNpdGUg
bmVlZHMgYSBjb21tZW50IChwb3NzaWJseQo+IGFsbCBidXQgb25lIHNpbXBseSByZWZlcnJpbmcg
dG8gdGhlIG9uZSB3aGVyZSB0aGluZ3MgZ2V0IGFjdHVhbGx5Cj4gZXhwbGFpbmVkKS4KPgoKTm90
ZWQuIEkgdGhpbmsgZm9yIGFuIGV4cGVyaW1lbnRhbCBjb2RlLWJhc2UgaXQncyBmaW5lLgoKVGFt
YXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
