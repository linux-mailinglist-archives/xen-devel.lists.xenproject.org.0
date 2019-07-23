Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5FA72131
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 23:01:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hq1qy-0007K2-Tn; Tue, 23 Jul 2019 20:57:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wtZi=VU=iki.fi=pasik@srs-us1.protection.inumbo.net>)
 id 1hq1qx-0007Jx-DX
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 20:57:43 +0000
X-Inumbo-ID: 80b105a8-ad8c-11e9-a4c9-7368f915c06a
Received: from emh03.mail.saunalahti.fi (unknown [62.142.5.109])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 80b105a8-ad8c-11e9-a4c9-7368f915c06a;
 Tue, 23 Jul 2019 20:57:38 +0000 (UTC)
Received: from ydin.reaktio.net (reaktio.net [85.76.255.15])
 by emh03.mail.saunalahti.fi (Postfix) with ESMTP id 04CD540156;
 Tue, 23 Jul 2019 23:57:35 +0300 (EEST)
Received: by ydin.reaktio.net (Postfix, from userid 1001)
 id 5A16A36C0F6; Tue, 23 Jul 2019 23:57:35 +0300 (EEST)
Date: Tue, 23 Jul 2019 23:57:35 +0300
From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20190723205734.GJ3433@reaktio.net>
References: <20190626133726.29896-1-jgross@suse.com>
 <20190627082834.ge2gr3lljjnomug5@MacBook-Air-de-Roger.local>
 <23846.12792.575466.223687@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23846.12792.575466.223687@mariner.uk.xensource.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [Xen-devel] [PATCH] libxl: fix pci device re-assigning after
 domain reboot
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpPbiBXZWQsIEp1bCAxMCwgMjAxOSBhdCAwNzo0NDowOFBNICswMTAwLCBJYW4gSmFj
a3NvbiB3cm90ZToKPiBSb2dlciBQYXUgTW9ubmUgd3JpdGVzICgiUmU6IFtYZW4tZGV2ZWxdIFtQ
QVRDSF0gbGlieGw6IGZpeCBwY2kgZGV2aWNlIHJlLWFzc2lnbmluZyBhZnRlciBkb21haW4gcmVi
b290Iik6Cj4gPiBPbiBXZWQsIEp1biAyNiwgMjAxOSBhdCAwMzozNzoyNlBNICswMjAwLCBKdWVy
Z2VuIEdyb3NzIHdyb3RlOgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+Cj4gPiA+IFRlc3RlZC1ieTogQ2hhbyBHYW8gPGNoYW8uZ2FvQGludGVsLmNv
bT4KPiA+IAo+ID4gUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPgo+IAo+IENvbW1pdHRlZCwgdGhhbmtzLgo+IAoKSSdkIGxpa2UgdG8gcmVxdWVzdCBi
YWNrcG9ydCBvZiB0aGlzIGNvbW1pdCB0byA0LjEyIGJyYW5jaC4KClRoYW5rcywKCi0tIFBhc2kK
Cj4gSWFuLgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
