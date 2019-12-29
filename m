Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AF112CB4C
	for <lists+xen-devel@lfdr.de>; Mon, 30 Dec 2019 00:01:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ilhVs-000436-5M; Sun, 29 Dec 2019 22:58:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=F+c7=2T=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ilhVq-000431-Ld
 for xen-devel@lists.xenproject.org; Sun, 29 Dec 2019 22:58:18 +0000
X-Inumbo-ID: aeb18c6e-2a8e-11ea-a1e1-bc764e2007e4
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aeb18c6e-2a8e-11ea-a1e1-bc764e2007e4;
 Sun, 29 Dec 2019 22:58:09 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id u2so12905595wmc.3
 for <xen-devel@lists.xenproject.org>; Sun, 29 Dec 2019 14:58:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kY0Or9b2LWFtdfKj8o4W64WVVugAqnybu5Dv2VRUSfs=;
 b=NgYVQ8ZEi612u3RraQix1cqp4E0/wMEZZQKQ5QbEuSfIR70eNApWb0WHrbuyzIB03Z
 JmWWBLxu3y/yE8xPYf8tlIpZ5OieszHYATsao/DJhoSL2LVIsoikXaDqDsrvNYUnUdsg
 l+lBY/q7h5Byei+2jV60JPslHj19uvk5quL6xgAmIiZCmz33RCret36ZKz/ttyM1BWkY
 F4+6fQMyGus2CRT9dukgAf+hRMBWdiPaP/ELss31IO5poa8BS4IH4Z6EEOjXG/Acpc3E
 zvlEedcfonvXutmYPT0HnIdRFk67tWXU5+1lqHizw1RMpHefyFnQNLb0DUseMV8T389+
 rcaQ==
X-Gm-Message-State: APjAAAUW5NsVlKfBM182AZ0etevAWyhv0dEZGPPSTJlC3olZd8WS4eSd
 1LIb8WYS87YNCQJohPdzd1I=
X-Google-Smtp-Source: APXvYqxUQQL9B+UKj0M9LOLmn6tjK9ZtOhAqOaUtTT21kQ5l9SKNgPAXLf2NbRWMdzDl/oA4zn9dzw==
X-Received: by 2002:a1c:a949:: with SMTP id s70mr30702896wme.69.1577660288946; 
 Sun, 29 Dec 2019 14:58:08 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id u24sm18728378wml.10.2019.12.29.14.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Dec 2019 14:58:08 -0800 (PST)
Date: Sun, 29 Dec 2019 22:58:06 +0000
From: Wei Liu <wl@xen.org>
To: Michael Kelley <mikelley@microsoft.com>
Message-ID: <20191229225806.vxlvjzx6d6p3otj5@debian>
References: <20191229183341.14877-1-liuwe@microsoft.com>
 <20191229183341.14877-5-liuwe@microsoft.com>
 <CY4PR21MB062925DC63C164F52805EFCFD7240@CY4PR21MB0629.namprd21.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CY4PR21MB062925DC63C164F52805EFCFD7240@CY4PR21MB0629.namprd21.prod.outlook.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 4/8] x86/hyperv: setup hypercall page
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU3VuLCBEZWMgMjksIDIwMTkgYXQgMDc6NTQ6MzBQTSArMDAwMCwgTWljaGFlbCBLZWxsZXkg
d3JvdGU6ClsuLi5dCj4gPiAKPiA+ICtzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfaHlwZXJjYWxs
X3BhZ2Uodm9pZCkKPiA+ICt7Cj4gPiArICAgIHVuaW9uIGh2X3g2NF9tc3JfaHlwZXJjYWxsX2Nv
bnRlbnRzIGh5cGVyY2FsbF9tc3I7Cj4gPiArCj4gPiArICAgIC8qIFVuZm9ydHVuYXRlbHkgdGhl
cmUgaXNuJ3QgYSByZWFsbHkgZ29vZCB3YXkgdG8gdW53aW5kIFhlbiB0bwo+ID4gKyAgICAgKiBu
b3QgdXNlIEh5cGVyLVYgaG9va3MsIHNvIHBhbmljIGlmIGFueXRoaW5nIGdvZXMgd3JvbmcuCj4g
PiArICAgICAqCj4gPiArICAgICAqIEluIHByYWN0aWNlIGlmIHBhZ2UgYWxsb2NhdGlvbiBmYWls
cyB0aGlzIGVhcmx5IG9uIGl0IGlzCj4gPiArICAgICAqIHVubGlrZWx5IHdlIGNhbiBnZXQgYSB3
b3JraW5nIHN5c3RlbSBsYXRlci4KPiA+ICsgICAgICovCj4gPiArICAgIGh2X2h5cGVyY2FsbF9w
YWdlID0gYWxsb2NfZG9taGVhcF9wYWdlKE5VTEwsIDApOwo+ID4gKyAgICBpZiAoICFodl9oeXBl
cmNhbGxfcGFnZSApCj4gPiArICAgICAgICBwYW5pYygiRmFpbGVkIHRvIGFsbG9jYXRlIEh5cGVy
LVYgaHlwZXJjYWxsIHBhZ2VcbiIpOwo+ID4gKwo+ID4gKyAgICBodl9oeXBlcmNhbGwgPSBfX21h
cF9kb21haW5fcGFnZV9nbG9iYWwoaHZfaHlwZXJjYWxsX3BhZ2UpOwo+ID4gKyAgICBpZiAoICFo
dl9oeXBlcmNhbGwgKQo+ID4gKyAgICAgICAgcGFuaWMoIkZhaWxlZCB0byBtYXAgSHlwZXItViBo
eXBlcmNhbGwgcGFnZVxuIik7Cj4gPiArCj4gPiArICAgIHJkbXNybChIVl9YNjRfTVNSX0hZUEVS
Q0FMTCwgaHlwZXJjYWxsX21zci5hc191aW50NjQpOwo+ID4gKyAgICBoeXBlcmNhbGxfbXNyLmVu
YWJsZSA9IDE7Cj4gPiArICAgIGh5cGVyY2FsbF9tc3IuZ3Vlc3RfcGh5c2ljYWxfYWRkcmVzcyA9
IHBhZ2VfdG9fbWFkZHIoaHZfaHlwZXJjYWxsX3BhZ2UpOwo+IAo+IFRoZSAiZ3Vlc3RfcGh5c2lj
YWxfYWRkcmVzcyIgZmllbGQgaXMgYWN0dWFsbHkgdGhlIGd1ZXN0IHBoeXNpY2FsIHBhZ2UgbnVt
YmVyLgo+IFNvIHRoZSBwaHlzaWNhbCBhZGRyZXNzIG5lZWRzIHRvIGJlIHJpZ2h0IHNoaWZ0ZWQg
MTIgYml0cyBiZWZvcmUgYmVpbmcgc3RvcmVkCj4gaGVyZS4gIEknZCByZWNvbW1lbmQgdXNpbmcg
SFZfSFlQX1BBR0VfU0hJRlQgZnJvbSBoeXBlcnYtdGxmcy5oIGFzCj4gdGhlIHNoaWZ0IHZhbHVl
OyBpdCB3YXMgaW50cm9kdWNlZCB0byBkZWFsIHdpdGggdGhlIHBvc3NpYmlsaXR5IHRoYXQgdGhl
IHBhZ2UKPiBzaXplIHVzZWQgYW5kIGV4cGVjdGVkIGJ5IHRoZSBIeXBlci1WIGludGVyZmFjZSBp
cyBkaWZmZXJlbnQgZnJvbSB0aGUgcGFnZQo+IHNpemUgdXNlZCBieSB0aGUgZ3Vlc3QgVk0gKHdo
aWNoIGNhbiBoYXBwZW4gb24gQVJNNjQsIHRob3VnaCBub3Qgb24geDg2KS4KCkdvb2QgY2F0Y2gs
IGFuZCB0aGFua3MgZm9yIHRoZSB0aXAgaGVyZS4KCkkgd2lsbCBmaXggdGhpcyBpbiB0aGUgbmV4
dCB2ZXJzaW9uLgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
