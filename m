Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 539D630C1B
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 11:55:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWeDc-0005Zi-If; Fri, 31 May 2019 09:53:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hWeDa-0005ZD-Qv
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 09:52:58 +0000
X-Inumbo-ID: de246c34-8389-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id de246c34-8389-11e9-8980-bc764e045a96;
 Fri, 31 May 2019 09:52:57 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 31 May 2019 03:52:56 -0600
Message-Id: <5CF0F9770200007800233E04@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 31 May 2019 03:52:55 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CF0F8530200007800233DE0@prv1-mh.provo.novell.com>
In-Reply-To: <5CF0F8530200007800233DE0@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH 2/4] x86: further speed-up to hweight{32,64}()
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWNjb3JkaW5nIHRvIExpbnV4IGNvbW1pdCAwMTM2NjExYzYyICgib3B0aW1pemUgaHdlaWdodDY0
IGZvciB4ODZfNjQiKQp0aGlzIGlzIGEgZnVydGhlciBpbXByb3ZlbWVudCBvdmVyIHRoZSB2YXJp
YW50IHVzaW5nIG9ubHkgYml0d2lzZQpvcGVyYXRpb25zLiBJdCdzIGFsc28gYSBzbGlnaHQgZnVy
dGhlciBjb2RlIHNpemUgcmVkdWN0aW9uLgoKU3VnZ2VzdGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vYXJjaC94ODYvS2NvbmZpZworKysgYi94ZW4vYXJj
aC94ODYvS2NvbmZpZwpAQCAtMTIsNiArMTIsNyBAQCBjb25maWcgWDg2CiAJc2VsZWN0IEhBU19D
UFVGUkVRCiAJc2VsZWN0IEhBU19FSENJCiAJc2VsZWN0IEhBU19FWF9UQUJMRQorCXNlbGVjdCBI
QVNfRkFTVF9NVUxUSVBMWQogCXNlbGVjdCBIQVNfR0RCU1gKIAlzZWxlY3QgSEFTX0lPUE9SVFMK
IAlzZWxlY3QgSEFTX0tFWEVDCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
