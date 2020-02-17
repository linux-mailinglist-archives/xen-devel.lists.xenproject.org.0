Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7F01611E3
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 13:19:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3fKt-00052v-2H; Mon, 17 Feb 2020 12:17:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sxmF=4F=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j3fKr-00052p-Sr
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 12:17:13 +0000
X-Inumbo-ID: 6d01d54a-517f-11ea-bfda-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6d01d54a-517f-11ea-bfda-12813bfff9fa;
 Mon, 17 Feb 2020 12:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581941832;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=FOvawj0ci2wG5pS9Nws3+OO3RzD1MXR0veKR8TwdliE=;
 b=ExRDB/GvQP9LKNE180UvfwUzL4xNvVRvm37UX7mj8iIIoEEyNwRD3Mfa
 TMtg6kGkROo7a5wKxbV6nk0wvxvLHcIXnrsjoUl861vTy2knxO+2T5tRy
 qaDmR3MRr9pRiHhdYtHP+hRSVcDhk2il4aWEQ3pJ1MaoqeltSZ6WgedQR k=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: rIWZ/jvKdbU3/Efs4Dl2m9VTqRs45uEG8AWvI723S4ap9Am8BSdX6yNueM2oXbSesrsnl//gMK
 pcyNRDpLL2HeiVb5HPflx+iyhqm9pwjgAu7wwX3R6otS65YJAXJh1ACDs2akBjxuYLmmEDirNq
 0rcXiYHRSkZkdkZK6bg3Vmyl+oAJ+cpIOXl/tkLdd0r3FFRqISkzp1qHD0ixMiylK0+MNy697H
 H3fyb/WXcwdeT1POAcbRJi0Fj8ixVkyH3t0+zF+J/4YsnUV3T4kVZtu5iZFEl7nYSs1Vu1mTFL
 WvQ=
X-SBRS: 2.7
X-MesageID: 12552244
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,452,1574139600"; d="scan'208";a="12552244"
Date: Mon, 17 Feb 2020 13:17:04 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <20200217121704.GJ4679@Air-de-Roger>
References: <20200217072006.20211-1-jgross@suse.com>
 <20200217072006.20211-3-jgross@suse.com>
 <0e8018be-7551-9bdf-fc6a-fb388579ff18@xen.org>
 <4f29d05c-db7d-c1da-2fd9-8eed7dcdc587@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4f29d05c-db7d-c1da-2fd9-8eed7dcdc587@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 2/2] xen/rcu: don't use stop_machine_run()
 for rcu_barrier()
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMTcsIDIwMjAgYXQgMDE6MTE6NTlQTSArMDEwMCwgSsO8cmdlbiBHcm/DnyB3
cm90ZToKPiBPbiAxNy4wMi4yMCAxMjo0OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gSGkgSnVl
cmdlbiwKPiA+IAo+ID4gT24gMTcvMDIvMjAyMCAwNzoyMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToK
PiA+ID4gK3ZvaWQgcmN1X2JhcnJpZXIodm9pZCkKPiA+ID4gwqAgewo+ID4gPiAtwqDCoMKgIGF0
b21pY190IGNwdV9jb3VudCA9IEFUT01JQ19JTklUKDApOwo+ID4gPiAtwqDCoMKgIHJldHVybiBz
dG9wX21hY2hpbmVfcnVuKHJjdV9iYXJyaWVyX2FjdGlvbiwgJmNwdV9jb3VudCwgTlJfQ1BVUyk7
Cj4gPiA+ICvCoMKgwqAgaWYgKCAhYXRvbWljX2NtcHhjaGcoJmNwdV9jb3VudCwgMCwgbnVtX29u
bGluZV9jcHVzKCkpICkKPiA+IAo+ID4gV2hhdCBkb2VzIHByZXZlbnQgdGhlIGNwdV9vbmxpbmVf
bWFwIHRvIGNoYW5nZSB1bmRlciB5b3VyIGZlZXQ/Cj4gPiBTaG91bGRuJ3QgeW91IGdyYWIgdGhl
IGxvY2sgdmlhIGdldF9jcHVfbWFwcygpPwo+IAo+IE9oLCBpbmRlZWQuCj4gCj4gVGhpcyBpbiB0
dXJuIHdpbGwgcmVxdWlyZSBhIG1vZGlmaWNhdGlvbiBvZiB0aGUgbG9naWMgdG8gZGV0ZWN0IHBh
cmFsbGVsCj4gY2FsbHMgb24gbXVsdGlwbGUgY3B1cy4KCklmIHlvdSBwaWNrIG15IHBhdGNoIHRv
IHR1cm4gdGhhdCBpbnRvIGEgcncgbG9jayB5b3Ugc2hvdWxkbid0IHdvcnJ5CmFib3V0IHBhcmFs
bGVsIGNhbGxzIEkgdGhpbmssIGJ1dCB0aGUgbG9jayBhY3F1aXNpdGlvbiBjYW4gc3RpbGwgZmFp
bAppZiB0aGVyZSdzIGEgQ1BVIHBsdWcvdW5wbHVnIGdvaW5nIG9uOgoKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDIwLTAyL21zZzAwOTQwLmh0
bWwKClJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
