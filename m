Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FB512DA60
	for <lists+xen-devel@lfdr.de>; Tue, 31 Dec 2019 17:40:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1imKX2-00046E-Re; Tue, 31 Dec 2019 16:38:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=n71l=2V=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1imKX1-000468-OC
 for xen-devel@lists.xenproject.org; Tue, 31 Dec 2019 16:38:07 +0000
X-Inumbo-ID: e766ee2e-2beb-11ea-b6f1-bc764e2007e4
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e766ee2e-2beb-11ea-b6f1-bc764e2007e4;
 Tue, 31 Dec 2019 16:37:59 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p17so2237228wmb.0
 for <xen-devel@lists.xenproject.org>; Tue, 31 Dec 2019 08:37:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ttODupelBJ9Y9NIk8B5GpLvMP7KmFaBgQjfMaDaa7ZE=;
 b=meE37ptBzdKdHjAT2c6dWUteGlP81U0vwiwAIyag5XoHY9LQ1tHD4qE0nHtzBuscFN
 bnsTJv+3P95baAKXND1CN2bhl5OzdwUhOJMX08Wc7yGo9aGcyPeFe/fAAcq61BH1HG1v
 VQfgLeNOUNcgAfuYKymsEMrzUsZeqtof3DkRlEfe9eZX/Q+sEXydKGOn/FeAyuyuR7v0
 x8VhxXWteRZuJbXOqyBejh+1ibt6UeyZ39gYr6Rw46tdcj+Ay4wqd+Rz0JS/hd5KQe8f
 E9HKYj6VLG+hyiIgM28EpxeAwgtA4jcsYZVIqwPwqGYQHtcrrHWQI9+o7DBIWlObL3IH
 3zWg==
X-Gm-Message-State: APjAAAVg/8/dAVqoiLd2E56y7wfgv+kDuNWcnXYskg+UiXYOCyXf69Ko
 hiNt+XRurENiHz5AWtMY7+k=
X-Google-Smtp-Source: APXvYqw4gegAeuGuWrA56uGoikzlQW+j/voJ62CdduTPkIlFS6NNQG/S8ymMmBON6F/YHykOoj7TfA==
X-Received: by 2002:a05:600c:2c13:: with SMTP id
 q19mr5012346wmg.144.1577810278452; 
 Tue, 31 Dec 2019 08:37:58 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id p7sm2881916wmp.31.2019.12.31.08.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Dec 2019 08:37:58 -0800 (PST)
Date: Tue, 31 Dec 2019 16:37:56 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191231163756.osc4vxcxdnpas3nc@debian>
References: <20191217201550.15864-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191217201550.15864-1-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 0/4] Don't allocate dom->p2m_host[] for
 translated domains
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
 Wei Liu <wl@xen.org>, Varad Gautam <vrd@amazon.de>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMTcsIDIwMTkgYXQgMDg6MTU6NDZQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBWYXN0bHkgZHJvcCB4bCdzIG1lbW9yeSB1c2FnZSBmb3IgSFZNICh4ODYgYW5kIEFS
TSkgZ3Vlc3QgY29uc3RydWN0aW9uLgo+IAo+IFNlZQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3hlbi1kZXZlbC8xNTYyMTU5MjAyLTExMzE2LTEtZ2l0LXNlbmQtZW1haWwtdnJkQGFtYXpvbi5k
ZS9ULyN1Cj4gZm9yIHRoZSBvcmlnaW5zIG9mIHRoaXMgd29yaywgYnV0IHVsdGltYXRlbHkgSSB0
aGluayB0aGlzIGlzIGEgZmFyIGNsZWFuZXIKPiBzb2x1dGlvbiB0byB0aGUgcHJvYmxlbS4KPiAK
PiBBbmRyZXcgQ29vcGVyICg0KToKPiAgIHRvb2xzL2RvbWJ1aWxkZXI6IHhjX2RvbV94ODYgY2xl
YW51cAo+ICAgdG9vbHMvZG9tYnVpbGRlcjogUmVtb3ZlIFBWLW9ubHksIG1hbmRhdG9yeSBob29r
cwo+ICAgdG9vbHMvZG9tYnVpbGRlcjogUmVtb3ZlIHAybV9ndWVzdCBmcm9tIHRoZSBjb21tb24g
aW50ZXJmYWNlCj4gICB0b29scy9kb21idWlsZGVyOiBEb24ndCBhbGxvY2F0ZSBkb20tPnAybV9o
b3N0W10gZm9yIHRyYW5zbGF0ZWQKPiAgICAgZG9tYWlucwoKVGhlIGNvZGUgbG9va3MgZ29vZCB0
byBtZS4KCkFja2VkLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
