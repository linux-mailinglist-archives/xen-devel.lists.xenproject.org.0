Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 049341835D0
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 17:03:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCQG4-00018A-CI; Thu, 12 Mar 2020 16:00:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FfMj=45=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jCQG3-000185-01
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 16:00:27 +0000
X-Inumbo-ID: 95dfd0a8-647a-11ea-b1c9-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 95dfd0a8-647a-11ea-b1c9-12813bfff9fa;
 Thu, 12 Mar 2020 16:00:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7A804AB6D;
 Thu, 12 Mar 2020 16:00:24 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>, Dario Faggioli <dfaggioli@suse.com>
References: <158402056376.753.7091379488590272336.stgit@Palanthas>
 <158402065414.753.15785539969715690913.stgit@Palanthas>
 <2e53ee4c-e2d9-f892-c8c3-62bff0c526ab@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <21abe34e-54f0-70e3-d2f1-cf6984b5773a@suse.com>
Date: Thu, 12 Mar 2020 17:00:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <2e53ee4c-e2d9-f892-c8c3-62bff0c526ab@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] xen: credit2: avoid vCPUs to ever reach
 lower credits than idle
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
Cc: Charles Arnold <carnold@suse.com>, Glen <glenbarney@gmail.com>,
 George Dunlap <george.dunlap@citrix.com>, Tomas Mozes <hydrapolic@gmail.com>,
 Sarah Newman <srn@prgmr.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDMuMjAgMTY6MjYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDEyLjAzLjIwMjAgMTQ6
NDQsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+PiAtLS0gYS94ZW4vY29tbW9uL3NjaGVkL2NyZWRp
dDIuYwo+PiArKysgYi94ZW4vY29tbW9uL3NjaGVkL2NyZWRpdDIuYwo+PiBAQCAtMjM0LDcgKzIz
NCw3IEBACj4+ICAgICogdW5pdHMgZG9lcyBub3QgY29uc3VtZSBjcmVkaXRzLCBhbmQgaXQgbXVz
dCBiZSBsb3dlciB0aGFuIHdoYXRldmVyCj4+ICAgICogYW1vdW50IG9mIGNyZWRpdCAncmVndWxh
cicgdW5pdCB3b3VsZCBlbmQgdXAgd2l0aC4KPj4gICAgKi8KPj4gLSNkZWZpbmUgQ1NDSEVEMl9J
RExFX0NSRURJVCAgICAgICAgICAoLSgxVTw8MzApKQo+PiArI2RlZmluZSBDU0NIRUQyX0lETEVf
Q1JFRElUICAgICAgICAgIElOVF9NSU4KPiAKPiBUaGUgdGl0bGUgc2F5aW5nICJsb3dlciB0aGFu
IiwgaXMgImVxdWFsIiBhY3R1YWxseSBmaW5lPyBMb29raW5nCj4gYXQgZS5nLiBydW5xX2luc2Vy
dCgpIEknbSBnZXR0aW5nIHRoZSBpbXByZXNzaW9uIGl0J3Mgbm90Lgo+IAo+IExvb2tpbmcgYXQg
dDJjX3VwZGF0ZSgpIEknbSBhbHNvIGdldHRpbmcgdGhlIGltcHJlc3Npb24gdGhhdAo+IHRoZXJl
J3MgVUIgd2hlbiB0aGUgc3VidHJhY3Rpb24gdW5kZXJmbG93cy4gQWZ0ZXIgYWxsLCBpZgo+IC0x
IDw8IDMwIHdhc24ndCBzbWFsbCBlbm91Z2ggYSB2YWx1ZSwgSSBkb24ndCBzZWUgd2h5IC0xIDw8
IDMxCj4gd291bGQgYmUuCgpZZXMsIEknZCBsaW1pdCBzdmMtPmNyZWRpdCBpbiB0MmNfdXBkYXRl
KCkgdG8gQ1NDSEVEMl9JRExFX0NSRURJVCsxCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
