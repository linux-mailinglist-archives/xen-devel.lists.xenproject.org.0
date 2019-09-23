Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC84BB24C
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 12:36:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCLea-0001ut-CP; Mon, 23 Sep 2019 10:33:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iV5N=XS=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iCLeY-0001ug-HX
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 10:33:10 +0000
X-Inumbo-ID: 8813bebc-dded-11e9-b299-bc764e2007e4
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8813bebc-dded-11e9-b299-bc764e2007e4;
 Mon, 23 Sep 2019 10:33:07 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 3so8683012wmi.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2019 03:33:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HSKPYgfUL9kRP9Y+ZT5zVEHE9uA28kktmBHLCdaGXlA=;
 b=fGsEFDH8yOC4YyreFTLTOhv8aTx1Ze9dh/UyfqFpx6AtpVptMY0zRfGqN6p/qU9eKm
 BuSVbNnk1AX/4/eQBBCU9WyhJlX/fXKz24wdgTXAYyQDNkSvFkX7JkY5QNuwo6vwDybk
 oMw//OS00r2iX7+LgB3+LJ0sh1JW/So96B6F6oknBGAUY1QATL3Z5f9nanbXBWUjEsa+
 QUHNjBiVXUEV2TEt3Uaf0bbu/ptONFkpm/vhcZ69Y9IME3ol47IwqnXgHterExLYssXT
 nAwFlm/2AyqeOSeIYCjpa+faLwRMfLRc1F/GTLyfjNlA5EeGaIp3wYZOgBpxOgrEWlsW
 9HVw==
X-Gm-Message-State: APjAAAWy+F78nvVV+tjuuHLlvjFs2n3bTTlju1didW2WsdwcGs0z0Ojs
 3rYIjo/Fg0Dy1XZvX6tmtEg=
X-Google-Smtp-Source: APXvYqxlBS5rALOSRPeytcaC1mhLdUVZnLkblWYRx0jw7Q8TTlNyiQNixsav5ABxAvixQ5vBjPCt2g==
X-Received: by 2002:a1c:cb05:: with SMTP id b5mr12866521wmg.79.1569234786812; 
 Mon, 23 Sep 2019 03:33:06 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id a13sm22316580wrf.73.2019.09.23.03.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 03:33:06 -0700 (PDT)
Date: Mon, 23 Sep 2019 11:33:04 +0100
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190923103304.am43a5mjd4yfhnsb@debian>
References: <c5ffff18-bded-486d-5883-da1f6e091d51@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c5ffff18-bded-486d-5883-da1f6e091d51@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v2] libxc/x86: avoid overflow in CPUID APIC
 ID adjustments
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBTZXAgMjAsIDIwMTkgYXQgMDM6NTQ6MTJQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gUmVjZW50IEFNRCBwcm9jZXNzb3JzIG1heSByZXBvcnQgdXAgdG8gMTI4IGxvZ2ljYWwg
cHJvY2Vzc29ycyBpbiBDUFVJRAo+IGxlYWYgMS4gRG91YmxpbmcgdGhpcyB2YWx1ZSBwcm9kdWNl
cyAwICh3aGljaCBPU2VzIHNpbmNlcmVseSBkaXNsaWtlKSwKPiBhcyB0aGUgcmVzcGVjdGl2ZSBm
aWVsZCBpcyBvbmx5IDggYml0cyB3aWRlLiBTdXBwcmVzcyBkb3VibGluZyB0aGUgdmFsdWUKPiAo
YW5kIGl0cyBsZWFmIDB4ODAwMDAwMDggY291bnRlcnBhcnQpIGluIHN1Y2ggYSBjYXNlLgo+IAo+
IE5vdGUgdGhhdCB3aGlsZSB0aGVyZSdzIGEgc2ltaWxhciBvdmVyZmxvdyBpbiBpbnRlbF94Y19j
cHVpZF9wb2xpY3koKSwKPiB0aGF0IG9uZSBpcyBiZWluZyBsZWZ0IGFsb25lIGZvciBub3cuCj4g
Cj4gTm90ZSBmdXJ0aGVyIHRoYXQgd2hpbGUgaXQgd2FzIGNvbnNpZGVyZWQgdG8gc3VwcHJlc3Mg
dGhlIG11bHRpcGxpY2F0aW9uCj4gYnkgMiBhbHRvZ2V0aGVyIGlmIHRoZSBob3N0IHRvcG9sb2d5
IGFscmVhZHkgcHJvdmlkZXMgYXQgbGVhc3Qgb25lIGJpdAo+IG9mIHRocmVhZCBJRCB3aXRoaW4g
QVBJQyBJRHMsIGl0IHdhcyBkZWNpZGVkIHRvIGF2b2lkIG1vcmUgY2hhbmdlIGhlcmUKPiB0aGFu
IHJlYWxseSBuZWVkZWQgYXQgdGhpcyBwb2ludC4KPiAKPiBBbHNvIHphcCBsZWFmIDQgKGFuZCBh
dCB0aGUgc2FtZSB0aW1lIGxlYWYgMikgRURYIG91dHB1dCBmb3IgQU1ELCBhcyBpdAo+IHNob3Vs
ZCBoYXZlIGJlZW4gZnJvbSB0aGUgYmVnaW5uaW5nLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkknbSBnb2luZyB0byBkZWZlciB0aGlzIHBhdGNo
IHRvIEFuZHJldy4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
