Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3156B15D1E2
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2020 07:09:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2U6U-0006QQ-PW; Fri, 14 Feb 2020 06:05:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ut5K=4C=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j2U6T-0006QK-EF
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2020 06:05:29 +0000
X-Inumbo-ID: ff51869e-4eef-11ea-ade5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ff51869e-4eef-11ea-ade5-bc764e2007e4;
 Fri, 14 Feb 2020 06:05:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C6B2FAD77;
 Fri, 14 Feb 2020 06:05:26 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20200213125449.14226-1-jgross@suse.com>
 <1f5db5a6-e5c3-4d63-fdb4-e027d38bea18@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <f4622e07-acad-7c2c-f061-e8ca8584a2d8@suse.com>
Date: Fri, 14 Feb 2020 07:05:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <1f5db5a6-e5c3-4d63-fdb4-e027d38bea18@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 0/8] xen: don't let keyhandlers block
 indefinitely on locks
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Meng Xu <mengxu@cis.upenn.edu>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDIuMjAgMTk6MzgsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMTMvMDIvMjAyMCAx
Mjo1NCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gS2V5aGFuZGxlcnMgZHVtcGluZyBoeXBlcnZp
c29yIGluZm9ybWF0aW9uIHRvIHRoZSBjb25zb2xlIG9mdGVuIG5lZWQKPj4gdG8gdGFrZSBsb2Nr
cyB3aGlsZSBhY2Nlc3NpbmcgZGF0YS4gSW4gb3JkZXIgdG8gbm90IGJsb2NrIGluIGNhc2Ugb2YK
Pj4gc3lzdGVtIGluY29uc2lzdGVuY2llcyBpdCBpcyBjb252ZW5pZW50IHRvIHVzZSB0cnlsb2Nr
IHZhcmlhbnRzIHdoZW4KPj4gb2J0YWluaW5nIHRoZSBsb2Nrcy4gT24gdGhlIG90aGVyIGhhbmQg
YSBidXN5IHN5c3RlbSBtaWdodCBlYXNpbHkKPj4gZW5jb3VudGVyIGhlbGQgbG9ja3MsIHNvIHRo
aXMgcGF0Y2ggc2VyaWVzIGlzIGFkZGluZyBzcGVjaWFsIHRyeWxvY2sKPj4gdmFyaWFudHMgd2l0
aCBhIHRpbWVvdXQgdXNlZCBieSBrZXloYW5kbGVycy4KPiAKPiBUaGlzIGlzIGEgYmFja3dhcmRz
IHN0ZXAuCj4gCj4gS2V5aGFuZGxlcnMgYXJlIGZvciBkZWJ1Z2dpbmcgcHVycG9zZXMuwqAgV2hl
biBkZWJ1Z2dpbmcgaXQgaXMgZmFyIG1vcmUgCj4gaW1wb3J0YW50IHRvIGdldCB0aGUgcmVxdWVz
dGVkIGRhdGEsIHRoYW4gYWxtb3N0IGFueXRoaW5nIGVsc2UuCgpSaWdodC4KCj4gCj4gVGhlIHN5
c3RlbSB3aWxsIGNvcGUgd2l0aCBhIG11bHRpLXNlY29uZCBvdXRhZ2Ugb2NjdXJyaW5nIGFwcHJv
eGltYXRlbHkgCj4gbmV2ZXIuwqAgQSBwZXJzb24gZGVidWdnaW5nIHdobyBjYW4ndCBnZXQgdGhl
IGRhdGEgaGFzIG5vIGNoYW5jZSBvZiAKPiBmaXhpbmcgd2hhdGV2ZXIgcHJvYmxlbSB0aGV5IGFy
ZSBsb29raW5nIGZvci4KClJpZ2h0LgoKPiBUaGlzIHNlcmllcyBzZWVtcyB0byBiZSBicmVha2lu
ZyB0aGUgb25lIGNyaXRpY2FsIHVzZWNhc2UgZm9yIAo+IGtleWhhbmRsZXJzLCB0byBmaXggd2hh
dCAtIG5vdCBsZXQgZGVidWdnaW5nIGdldCBpbiB0aGUgd2F5IG9mIHRoZSAKPiBzbW9vdGggcnVu
bmluZyBvZiB0aGUgc3lzdGVtP8KgIEEgc3lzdGVtIGluIG5lZWQgb2YgZGVidWdnaW5nIGluIHRo
ZSAKPiBmaXJzdCBwbGFjZSBoYXMgYmlnZ2VyIHByb2JsZW1zIHRoYW4gbmVlZGluZyB0byBydW4g
c21vb3RobHkuCgpPa2F5LCB0aGlzIHdhcnJhbnRzIGEgbG9uZ2VyIGRlZmF1bHQgdGltZW91dC4K
CkEga2V5aGFuZGxlciBibG9ja2luZyBvbiBhIGxvY2sgd2lsbCBwcm9kdWNlIGV4YWN0bHkgbm8g
ZnVydGhlciBkYXRhLAphbmQgaXQgd2lsbCBwcm9iYWJseSBibG9jayBvdGhlciBrZXloYW5kbGVy
cywgdG9vLCBkdWUgdG8gaG9nZ2luZyBhdApsZWFzdCBvbmUgY3B1IGNvbXBsZXRlbHkuCgpXaXRo
IGEgbG9uZ2VyIGxvY2sgdGltZW91dCAoMSBzZWNvbmQ/KSB0aGVyZSBpcyBhIG11Y2ggaGlnaGVy
IGNoYW5jZQp0aGF0IHRoZSBrZXloYW5kbGVyIHdpbGwgZmluaXNoIGl0cyBqb2IgcHJvZHVjaW5n
IG1vcmUgZGF0YSB0aGFuCndpdGhvdXQgYW55IHRpbWVvdXQuCgpCVFcsIGR1cmluZyBkZXZlbG9w
bWVudCBvZiBteSBjb3JlIHNjaGVkdWxpbmcgc2VyaWVzIEkgd2FzIGhpdCBieSB0aGF0CnByb2Js
ZW0gbXVsdGlwbGUgdGltZXMuIFdpdGggdGhlIGxvY2sgdGltZW91dCBJJ2QgaGF2ZSBzcGFyZWQg
ZG96ZW5zIG9mCnJlYm9vdHMuCgo+IFRoZSBvbmx5IHRoaW5nIHdoaWNoIHNob3VsZCBoYXBwZW4g
dG8gaW1wcm92ZSBzeXN0ZW0gc3RhYmlsaXR5IGlzIGZvciAKPiBrZXloYW5kbGVycyB0byBkaXNh
YmxlIHRoZSBzeXN0ZW0gd2F0Y2hkb2cgd2hpbGUgdGhleSBhcmUgcnVubmluZywgaW4gCj4gY2Fz
ZSB0aGV5IGhhcHBlbiB0byBydW4gZm9yIHNlY29uZHMgb2Ygd2FsbGNsb2NrIHRpbWUuIFRoaXMg
aXMgYW4gaXNzdWUgCj4gd2hpY2ggaXNuJ3QgYWRkcmVzc2VkIGJ5IHRoZSBzZXJpZXMsIGJlY2F1
c2Ugb25jZSBhIGtleWhhbmRsZXIgZG9lcyBnZXQgCj4gYSBsb2NrLCBpdCBrZWVwcyBpdCB1bnRp
bCBpdCBpcyBkb25lLgoKUmlnaHQsIHdpbGwgYWRkIGRpc2FibGluZyB0aGUgd2F0Y2hkb2cgZHVy
aW5nIGtleWhhbmRsZXIgYWN0aW9uLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
