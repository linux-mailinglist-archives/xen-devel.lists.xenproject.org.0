Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4091C01D2
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 11:09:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDmDu-0006OX-I3; Fri, 27 Sep 2019 09:07:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jwcO=XW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iDmDs-0006OS-TN
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 09:07:32 +0000
X-Inumbo-ID: 3c1db58d-e106-11e9-9671-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by localhost (Halon) with ESMTPS
 id 3c1db58d-e106-11e9-9671-12813bfff9fa;
 Fri, 27 Sep 2019 09:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569575252;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=rilyCf/FG6iy4JMkiGNZt0nVAyXz5oAhwWt8kpaEgTA=;
 b=RdJJkisV47auHF111q+6VZUU+QZ2jy11tzNssB8xEBUA0WuE1zQi7TE1
 VL3J3lMlhyQE0AbG3v/ySEIcgVJ7GYedlYPaX5EzEYTcoWrkEox1xps46
 UPLPrxB8YQxBHsdxt5HKlxlGikZrZFmzcmIeYhyFPQB9TYdJQfe/XoiQx k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /KgtNMMNjONXJEMKz/1Hz97jDq6RucMN++TFBZLwzHSKpOttsUhha/fbXwzW/ZbxUcs+zm1WOC
 ZyM/leAK+4fa2nRJD7eT4jqd4j8HNJn4gyVsMOcLHZz6UDS8uKFJlXTbcYxQMABGDcIkHL4nGV
 VGc4E+o1zyB3by7mWium3pEPHAEyysfrWo6iRFZTiXV0S2m9rjlaMU/okxgTDFUS0Vy6lruA4R
 35TCmKHknM+SHcjrqUTE29Z8iU+SpnMNkI07OVbyvyM1seUnjGF3YT7zCo6bQ0OC4qSyFfhxSy
 kmk=
X-SBRS: 2.7
X-MesageID: 6392942
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,554,1559534400"; 
   d="scan'208";a="6392942"
Date: Fri, 27 Sep 2019 11:07:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Joe Jin <joe.jin@oracle.com>
Message-ID: <20190927090724.wdaslq5tz32day6g@Air-de-Roger>
References: <70457d4e-068f-0160-532b-e00dd295b3b1@oracle.com>
 <20190913103335.ijzx6tuy4iwb5dt5@Air-de-Roger>
 <89c9c9b5-a99f-bfdb-c42c-df64e308a98e@oracle.com>
 <20190924154242.nwhetdvkgmkhjgph@Air-de-Roger>
 <8a81e76c-b342-05b5-b592-c7e6912e6a9f@oracle.com>
 <20190927084202.pjjgpufvbqdye6ux@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190927084202.pjjgpufvbqdye6ux@Air-de-Roger>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH RFC] pass-through: sync pir to irr after
 msix vector been updated
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
Cc: xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Joao Martins <joao.m.martins@oracle.com>, Jan
 Beulich <jbeulich@suse.com>, "DONGLI.ZHANG" <dongli.zhang@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBTZXAgMjcsIDIwMTkgYXQgMTA6NDI6MDJBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBBbHNvLCBJIHRoaW5rIEknbSBzdGlsbCBjb25mdXNlZCBieSB0aGlzLCBJJ3Zl
IGp1c3QgcmVhbGl6ZWQgdGhhdCB0aGUKPiBQSSBkZXNjcmlwdG9yIHNlZW1zIHRvIGJlIG1vdmVk
IGZyb20gb25lIHZDUFUgdG8gYW5vdGhlciB3aXRob3V0Cj4gY2xlYXJpbmcgUElSUiwgYW5kIGhl
bmNlIEknbSBub3Qgc3VyZSB3aHkgeW91IGFyZSBsb3NpbmcgaW50ZXJydXB0cyBpbgo+IHRoYXQg
Y2FzZS4gSSBuZWVkIHRvIGxvb2sgZGVlcGVyIGluIG9yZGVyIHRvIGZpZ3VyZSBvdXQgd2hhdCdz
IGdvaW5nCj4gb24gdGhlcmUuCgpGb3JnZXQgYWJvdXQgdGhlIGFib3ZlIHBhcmFncmFwaCwgaXQn
cyBjb21wbGV0ZWx5IGJvZ3VzLiBUaGUgdmVjdG9yIG9uCnRoZSBuZXcgdkNQVSBtaWdodCBiZSBj
b21wbGV0ZWx5IGRpZmZlcmVudCwgYW5kIGhlbmNlIHRoZSBQSVJSIG11c3QKYmUgZmx1c2hlZCBi
ZWZvcmUgbW92aW5nLiBMZXQgbWUgdHJ5IHRvIGNvbWUgdXAgd2l0aCBhIHBhdGNoIGZvciB5b3UK
dG8gdGVzdC4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
