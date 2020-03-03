Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4847B17772F
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 14:34:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j97dd-0001we-Hq; Tue, 03 Mar 2020 13:31:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TLdZ=4U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j97dc-0001wY-LZ
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 13:31:08 +0000
X-Inumbo-ID: 3d101f10-5d53-11ea-b7d4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d101f10-5d53-11ea-b7d4-bc764e2007e4;
 Tue, 03 Mar 2020 13:31:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2B679B11F;
 Tue,  3 Mar 2020 13:31:07 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20200303122750.26996-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8bde8418-420f-6862-760e-1dd6e25b8852@suse.com>
Date: Tue, 3 Mar 2020 14:31:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200303122750.26996-1-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/sched: fix onlining cpu with core
 scheduling active
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
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDMuMjAyMCAxMzoyNywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiAtLS0gYS94ZW4vY29t
bW9uL3NjaGVkL2NwdXBvb2wuYwo+ICsrKyBiL3hlbi9jb21tb24vc2NoZWQvY3B1cG9vbC5jCj4g
QEAgLTYxNiw3ICs2MTYsOCBAQCBzdGF0aWMgaW50IGNwdXBvb2xfY3B1X2FkZCh1bnNpZ25lZCBp
bnQgY3B1KQo+ICAgICAgZ2V0X3NjaGVkX3JlcyhjcHUpLT5jcHVwb29sID0gTlVMTDsKPiAgCj4g
ICAgICBjcHVzID0gc2NoZWRfZ2V0X29wdF9jcHVtYXNrKGNwdXBvb2wwLT5ncmFuLCBjcHUpOwo+
IC0gICAgaWYgKCBjcHVtYXNrX3N1YnNldChjcHVzLCAmY3B1cG9vbF9mcmVlX2NwdXMpICkKPiAr
ICAgIGlmICggY3B1bWFza19zdWJzZXQoY3B1cywgJmNwdXBvb2xfZnJlZV9jcHVzKSAmJgo+ICsg
ICAgICAgICBjcHVtYXNrX3dlaWdodChjcHVzKSA+PSBjcHVwb29sX2dldF9ncmFudWxhcml0eShj
cHVwb29sMCkgKQoKV2h5ID49ICwgbm90ID09ID8gQW5kIGlzIHRoZSBvdGhlciBwYXJ0IG9mIHRo
ZSBjb25kaXRpb24gbmVlZGVkPwpJc24ndCB0aGlzIHJhdGhlciBhIGNvbmRpdGlvbiB0aGF0IGNv
dWxkIGJlIEFTU0VSVCgpZWQsIGFzIENQVXMKc2hvdWxkbid0IG1vdmUgb3V0IG9mIHRoZSAiZnJl
ZSIgc2V0IGJlZm9yZSByZWFjaGluZyB0aGUKZ3JhbnVsYXJpdHk/CgpKYW4KCj4gICAgICAgICAg
cmV0ID0gY3B1cG9vbF9hc3NpZ25fY3B1X2xvY2tlZChjcHVwb29sMCwgY3B1KTsKPiAgCj4gICAg
ICByY3VfcmVhZF91bmxvY2soJnNjaGVkX3Jlc19yY3Vsb2NrKTsKPiAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
