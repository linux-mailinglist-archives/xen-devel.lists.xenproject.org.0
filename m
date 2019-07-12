Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C887C66FE7
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2019 15:21:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlvQP-0008Px-9u; Fri, 12 Jul 2019 13:17:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=72A3=VJ=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1hlvQN-0008Ps-PZ
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2019 13:17:19 +0000
X-Inumbo-ID: 5ef69ffc-a4a7-11e9-8980-bc764e045a96
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5ef69ffc-a4a7-11e9-8980-bc764e045a96;
 Fri, 12 Jul 2019 13:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VlGeJVpmyd9R7H/dBIzxTJuL54bqAskZGG2yOvnoI18=; b=F/F3QXrq28isRNxJASCYcmGzu
 NuUvd4dtT0vopyrMJtnfFiIi7h7y2LHeT1cYeQvbRqxpL/OOK42wQbpjMDbKmxDCc0T5fU8ZfxeEi
 5vROS/kWz1zyU9co2DGx96jc3Hh4YeNg2Qf/RfpFW9yePM/nE5diReCRFmaFdHADlHizdP7CqItap
 VlCTDeCE8XQNuvPHLwAyWKbk/4i8yxSpuU78w22RYrANZjhOtSrcAV4XZ4Ab2x/QwFc1+MrGlgIKa
 w5Y1EcYOKPyBQTIAlXn37B7oxw+lJ+vEKRI1pUfsOSZMhthFIiiyIuXF4PvxtQRH3mtpT5APRJXiI
 J1d84UJZg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=hirez.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hlvQH-0005lN-4R; Fri, 12 Jul 2019 13:17:13 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 1267D209772E7; Fri, 12 Jul 2019 15:17:10 +0200 (CEST)
Date: Fri, 12 Jul 2019 15:17:10 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Zhenzhong Duan <zhenzhong.duan@oracle.com>
Message-ID: <20190712131710.GS3419@hirez.programming.kicks-ass.net>
References: <1562832921-20831-1-git-send-email-zhenzhong.duan@oracle.com>
 <20190712120626.GW3402@hirez.programming.kicks-ass.net>
 <a5f5ea4c-f30d-122e-0161-be7b1cb4877c@oracle.com>
 <20190712130916.GR3419@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190712130916.GR3419@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH v2] xen/pv: Fix a boot up hang revealed by
 int3 self test
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, srinivas.eeda@oracle.com,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdWwgMTIsIDIwMTkgYXQgMDM6MDk6MTZQTSArMDIwMCwgUGV0ZXIgWmlqbHN0cmEg
d3JvdGU6Cj4gT24gRnJpLCBKdWwgMTIsIDIwMTkgYXQgMDk6MDQ6MjJQTSArMDgwMCwgWmhlbnpo
b25nIER1YW4gd3JvdGU6Cj4gPiAKPiA+IE9uIDIwMTkvNy8xMiAyMDowNiwgUGV0ZXIgWmlqbHN0
cmEgd3JvdGU6Cj4gPiA+IE9uIFRodSwgSnVsIDExLCAyMDE5IGF0IDA0OjE1OjIxUE0gKzA4MDAs
IFpoZW56aG9uZyBEdWFuIHdyb3RlOgo+ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni94ZW4v
ZW5saWdodGVuX3B2LmMgYi9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMKPiA+ID4gPiBpbmRl
eCA0NzIyYmEyLi4yMTM4ZDY5IDEwMDY0NAo+ID4gPiA+IC0tLSBhL2FyY2gveDg2L3hlbi9lbmxp
Z2h0ZW5fcHYuYwo+ID4gPiA+ICsrKyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYwo+ID4g
PiA+IEBAIC01OTYsNyArNTk2LDcgQEAgc3RydWN0IHRyYXBfYXJyYXlfZW50cnkgewo+ID4gPiA+
ICAgc3RhdGljIHN0cnVjdCB0cmFwX2FycmF5X2VudHJ5IHRyYXBfYXJyYXlbXSA9IHsKPiA+ID4g
PiAgIAl7IGRlYnVnLCAgICAgICAgICAgICAgICAgICAgICAgeGVuX3hlbmRlYnVnLCAgICAgICAg
ICAgICAgICAgICAgdHJ1ZSB9LAo+ID4gPiA+IC0JeyBpbnQzLCAgICAgICAgICAgICAgICAgICAg
ICAgIHhlbl94ZW5pbnQzLCAgICAgICAgICAgICAgICAgICAgIHRydWUgfSwKPiA+ID4gPiArCXsg
aW50MywgICAgICAgICAgICAgICAgICAgICAgICB4ZW5faW50MywgICAgICAgICAgICAgICAgICAg
ICAgICB0cnVlIH0sCj4gPiA+ID4gICAJeyBkb3VibGVfZmF1bHQsICAgICAgICAgICAgICAgIHhl
bl9kb3VibGVfZmF1bHQsICAgICAgICAgICAgICAgIHRydWUgfSwKPiA+ID4gPiAgICNpZmRlZiBD
T05GSUdfWDg2X01DRQo+ID4gPiA+ICAgCXsgbWFjaGluZV9jaGVjaywgICAgICAgICAgICAgICB4
ZW5fbWFjaGluZV9jaGVjaywgICAgICAgICAgICAgICB0cnVlIH0sCj4gPiA+IEknbSBjb25mdXNl
ZCBvbiB0aGUgcHVycG9zZSBvZiB0cmFwX2FycmF5W10sIGNvdWxkIHlvdSBlbHVjaWRhdGUgbWU/
Cj4gPiAKPiA+IFVzZWQgdG8gcmVwbGFjZSB0cmFwIGhhbmRsZXIgYWRkcmVzc2VzIGJ5IFhlbiBz
cGVjaWZpYyBvbmVzIGFuZCBzYW5pdHkgY2hlY2sKPiA+IAo+ID4gaWYgdGhlcmUncyBhbiB1bmV4
cGVjdGVkIElTVC11c2luZyBmYXVsdCBoYW5kbGVyLgo+IAo+IGdpdCBncmVwIHhlbl9pbnQzLCBm
YWlsZWQgbWUuIFdoZXJlIGRvZXMgdGhhdCBzeW1ib2wgY29tZSBmcm9tPwoKTi9tIEkgZm91bmQg
aXQuLi4gbXVzdCBiZSBibGluZCB0b2RheS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
