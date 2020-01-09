Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB16013532F
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 07:27:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipRF4-00048G-7y; Thu, 09 Jan 2020 06:24:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=J+Nm=26=gmail.com=xumengpanda@srs-us1.protection.inumbo.net>)
 id 1ipRF2-00048B-9X
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 06:24:24 +0000
X-Inumbo-ID: ad640310-32a8-11ea-b1f0-bc764e2007e4
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ad640310-32a8-11ea-b1f0-bc764e2007e4;
 Thu, 09 Jan 2020 06:24:23 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id j17so4678580edp.3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2020 22:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6K1TtHVDTfP1qxKYLCv6IErnPj2l56A1/0d/HhjoNnM=;
 b=Lp879OCavkFDANgHvdcW2ybq0J2VmfrOESGAF0X9iZW/u00B5cR4Tx7NyAT0qTH/Rc
 oErtVA9g3zXAd+lRlKFnmeXe4Z8EVxNh3P7OWTpNZdW9XkLETh5MAyFhzT4ouP9xRDIo
 1+jxY5XuIuYQt912GUo3fIYZSo+hKKVgt1DGyCf91US3b1ZlJ9p+s+7Qq9GIVy2Lujt2
 EnFfmUkcTtbnFLemTo1VvktFdWVlX4iITENWhoE/SqD+29IsJyRLitZYLQi1prkU6pxs
 wo6iuapo5QjoMI55ogImZaVtr5m4JhGGYQBpeXHn8jIBpX/LrT9NfSoQrDM4vzVuvxty
 0VQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6K1TtHVDTfP1qxKYLCv6IErnPj2l56A1/0d/HhjoNnM=;
 b=buP2WGhsX+IMkZRcsovi7A1xsHLAzMrjtK4Nj771TxJdpexGnzEFwZ9XfEsllrk17x
 /7Zf2jF+EwaJtFUsZMc0bB0PvCcdogQegm2M3vRSE5ctovI4AS+NGuot0xKRyslXbcvt
 /V9XR2O5LkfnW1LWNwpRH+MekO0sDnkD9A2kmyEO1lRnBFRCtVSiC+e/RfG5Bbs4wxcd
 1vlW+nl0V+Q0BtyQ2aIrnCvUriqVLCFXngDPZr95+FsNg/dSww8nLgeCfQlmePxLeaJ5
 jjYLut6MReo1l+8szwuERlwzmpdIvNXnNXJvkfw3M4+a+jXQqmppBnmGqE0xYqgrdj/T
 /ZEw==
X-Gm-Message-State: APjAAAXyff+934jqJ+FwK6cXs+2xfPfhY6Dmd2SZqpp25XDmeGH3msCC
 SaPluF8DhY3ZG3y+XDiFgR/4ZVePi0Qktplumg==
X-Google-Smtp-Source: APXvYqxnXLQF9TbCBJDjoCH1mM/4td2pyEMm0sMLNyWXN7K3wk5B3OFWqLs9EGSwcSyjAxGXpGsgOvalZucJPsTeWsE=
X-Received: by 2002:a17:906:4e46:: with SMTP id
 g6mr8589090ejw.309.1578551062936; 
 Wed, 08 Jan 2020 22:24:22 -0800 (PST)
MIME-Version: 1.0
References: <20200108152328.27194-1-jgross@suse.com>
 <20200108152328.27194-8-jgross@suse.com>
In-Reply-To: <20200108152328.27194-8-jgross@suse.com>
From: Meng Xu <xumengpanda@gmail.com>
Date: Wed, 8 Jan 2020 22:23:46 -0800
Message-ID: <CAENZ-+n1HUP3Zzp6mgCPqx-yykbcca7a0rNyp7SX3B1rwk71NA@mail.gmail.com>
To: Juergen Gross <jgross@suse.com>
Subject: Re: [Xen-devel] [PATCH v2 7/9] xen/sched: switch scheduling to bool
 where appropriate
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
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Jan Beulich <jbeulich@suse.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gOCwgMjAyMCBhdCA3OjI0IEFNIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4gd3JvdGU6Cj4KPiBTY2hlZHVsaW5nIGNvZGUgaGFzIHNldmVyYWwgcGxhY2VzIHVzaW5n
IGludCBvciBib29sX3QgaW5zdGVhZCBvZiBib29sLgo+IFN3aXRjaCB0aG9zZS4KPgo+IFNpZ25l
ZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiAtLS0KPiBWMjoKPiAt
IHJlbmFtZSBib29sICJwb3MiIHRvICJmaXJzdCIgKERhcmlvIEZhZ2dpb2xpKQo+IC0tLQo+ICB4
ZW4vY29tbW9uL3NjaGVkL2FyaW5jNjUzLmMgfCAgOCArKysrLS0tLQo+ICB4ZW4vY29tbW9uL3Nj
aGVkL2NvcmUuYyAgICAgfCAxNCArKysrKysrLS0tLS0tLQo+ICB4ZW4vY29tbW9uL3NjaGVkL2Nw
dXBvb2wuYyAgfCAxMCArKysrKy0tLS0tCj4gIHhlbi9jb21tb24vc2NoZWQvY3JlZGl0LmMgICB8
IDEyICsrKysrKy0tLS0tLQo+ICB4ZW4vY29tbW9uL3NjaGVkL3ByaXZhdGUuaCAgfCAgMiArLQo+
ICB4ZW4vY29tbW9uL3NjaGVkL3J0LmMgICAgICAgfCAxOCArKysrKysrKystLS0tLS0tLS0KPiAg
eGVuL2luY2x1ZGUveGVuL3NjaGVkLmggICAgIHwgIDYgKysrLS0tCj4gIDcgZmlsZXMgY2hhbmdl
ZCwgMzUgaW5zZXJ0aW9ucygrKSwgMzUgZGVsZXRpb25zKC0pCj4KCkFzIHRvICB4ZW4vY29tbW9u
L3NjaGVkL3J0LmMsCgpSZXZpZXdlZC1ieTogTWVuZyBYdSA8bWVuZ3h1QGNpcy51cGVubi5lZHU+
CgpDaGVlcnMsCgpNZW5nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
