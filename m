Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E433510C594
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 10:03:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaFep-0007hA-4t; Thu, 28 Nov 2019 09:00:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FMNu=ZU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iaFen-0007h5-JY
 for xen-devel@lists.xen.org; Thu, 28 Nov 2019 09:00:13 +0000
X-Inumbo-ID: 7c2e99ce-11bd-11ea-a55d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c2e99ce-11bd-11ea-a55d-bc764e2007e4;
 Thu, 28 Nov 2019 09:00:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4D35AACF1;
 Thu, 28 Nov 2019 09:00:11 +0000 (UTC)
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20191122080226.6817-1-peng.fan@nxp.com>
 <alpine.DEB.2.21.1911221105360.11302@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.1911261241260.8205@sstabellini-ThinkPad-T480s>
 <942a60db-fd30-a63e-25b1-e6b739b17c4e@xen.org>
 <alpine.DEB.2.21.1911261306370.8205@sstabellini-ThinkPad-T480s>
 <e98515e2-8e2e-569a-557e-523e9f134bef@xen.org>
 <13d490f1-cd9e-e2aa-d118-2c96cf03eb9b@suse.com>
 <AM0PR04MB4481C1F43E0827D5652148F488440@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <e846a55b-3379-a22d-93db-862bc5279b64@suse.com>
 <alpine.DEB.2.21.1911270753580.27669@sstabellini-ThinkPad-T480s>
 <c6c26fc6-d9ab-5222-3787-3d083b3b7a97@xen.org>
 <3d63788e-b28a-c8fd-dae3-99ad9f4b9a04@suse.com>
 <9d32e677-dc13-cb56-6684-01ceabf4ae47@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <4b5f402d-1c24-4a27-6f6c-1c134c15d83c@suse.com>
Date: Thu, 28 Nov 2019 10:00:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <9d32e677-dc13-cb56-6684-01ceabf4ae47@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V2] arch: arm: vgic-v3: fix GICD_ISACTIVER
 range
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
Cc: Peng Fan <peng.fan@nxp.com>, Alice Guo <alice.guo@nxp.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
 "julien.grall@arm.com" <julien.grall@arm.com>, committers@xenproject.org,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMTEuMTkgMDk6NDgsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSwKPiAKPiBPbiAyOC8x
MS8yMDE5IDA4OjMyLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+PiBPbiAyOC4xMS4xOSAwOToxNCwg
SnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+IEluIHNob3J0LCBJIHRoaW5rIHRoZSBwYXRjaCBzaG91
bGQgZ28gaW4gbm93IGFuZCB0aGVyZSBhcmUgbm8gZG93bnNpZGVzCj4+Pj4gdG8gaXQuIFRoYXQn
cyBpdCwgSSByZXN0IG15IGNhc2UuIEp1bGllbiwgSSBob3BlIHlvdSdsbCByZWNvbnNpZGVyLgo+
Pj4gSSBkb24ndCByZWFsbHkgc2VlIHRoZSBwb2ludCB0byB0cnkgdG8gYWxsb3cgTGludXggNS40
IGJvb3Rpbmcgb24gWGVuIAo+Pj4gNC4xMyB3aXRob3V0IGtub3dpbmcgd2hldGhlciB3ZSBhcmUg
bm90IGdvaW5nIHRvIHVuY292ZXJlZCBtb3JlIEJVRyAKPj4+IGFyb3VuZCBJKkFDVElWRVIuCj4+
Cj4+IFNvcnJ5LCBidXQgdGhpcyBpcyBhIHJhdGhlciB3ZWlyZCBzdGF0ZW1lbnQuCj4+Cj4+IElJ
VUMgeW91IGFyZSBzYXlpbmcgdGhhdCBhIHR5cG8gYmxvY2tpbmcgYm9vdCBvZiBMaW51eCA1LjQg
c2hvdWxkIG5vdCBiZQo+PiBmaXhlZCBhcyB5b3UgYXJlIG5vdCBzdXJlIHRoZXJlIGFyZSBubyBv
dGhlciBidWdzPwo+IAo+IFRoZSBpbXBsZW1lbnRhdGlvbiBvZiBJKkFDVElWRVIgd2FzIGluY29y
cmVjdCBidXQgZ29uZSB1bm5vdGljZWQgYmVjYXVzZSAKPiBuby1vbmUgdXNlZCBpdCB1bnRpbCA1
LjQuIEl0IGFsc28gaGFwcGVuIHRoYXQgd2UgZGlkbid0IGNvdmVyIGFsbCB0aGUgCj4gSSpBQ1RJ
VkVSIHJlZ2lzdGVycywgc28gNS40IGNyYXNoZXMgaW5zdGVhZCBvZiB1c2luZyB0aGUgd3Jvbmcg
YmVoYXZpb3IuCj4gCj4gVGhpcyBwYXRjaCBpcyBiYXNpY2FsbHkgcmVwbGFjaW5nIGEgZ3Vlc3Qg
Y3Jhc2ggYnkgYSBiZWhhdmlvciB3ZSBkb24ndCAKPiBmdWxseSB1bmRlcnN0YW5kLgo+IAo+Pgo+
Pj4gSWYgeW91IHJlYWxseSB3YW50IHRoaXMgcGF0Y2ggaW4gWGVuIDQuMTMsIHRoZW4geW91IHNo
b3VsZCByZWFkIG15IAo+Pj4gbWFpbCBvbiB0aGUgZmlyc3QgdmVyc2lvbiBhbmQgdHJ5aW5nIHRv
IGFuc3dlciBtZSB3aHkgdGhpcyA1LjQgaXMgCj4+PiBnb2luZyB0byBiZSBzYWZlIHJ1bm5pbmcg
b24gWGVuIDQuMTMuCj4+Cj4+IE9yIGRvIHlvdSB0aGluayB0aGF0IHdpdGggdGhlIHR5cG8gZml4
ZWQgYW5kIHJ1bm5pbmcgTGludXggNS40IGd1ZXN0cwo+PiB3aWxsIGRlc3RhYmlsaXplIHRoZSBo
b3N0Pwo+IAo+IEl0IGlzIG5vdCBnb2luZyB0byBkZXN0YWJpbGl6ZSB0aGUgaG9zdHMuIEJ1dCB0
aGlzIGlzIG5vdCBnb2luZyB0byBtYWtlIAo+IDUuNCBydW5uaW5nIGNvcnJlY3RseSBhcyBYZW4g
Z3Vlc3QuCgpIYXZlIHlvdSB2ZXJpZmllZCBpdCBpc24ndCBydW5uaW5nIGNvcnJlY3RseSBvciBk
byB5b3UganVzdCB0aGluayBpdApjb3VsZCBoaXQgcHJvYmxlbXM/CgpJbiBib3RoIGNhc2VzIEkg
c2VlIG5vIHJlYXNvbiB0byBrZWVwIHdyb25nIGNvZGUuCgpFaXRoZXIgdGhlIHBhdGNoIHdpbGwg
bGV0IHJ1biBMaW51eCA1LjQgZmluZSAtIHRoZW4gdGhlIHBhdGNoIHNob3VsZApkZWZpbml0ZWx5
IGJlIHRha2VuLgoKT3IgdGhlIHBhdGNoIHdpbGwgbGV0IExpbnV4IDUuNCBib290IGZ1cnRoZXIs
IGJ1dCBzb21lIHByb2JsZW1zIHdpbGwKb2NjdXIuIFRoZW4gaXQgd2lsbCBiZSBwb3NzaWJsZSB0
byBhbmFseXplIHRob3NlIHByb2JsZW1zIGFuZCB0cnkgdG8KZml4IHRoZW0sIHZlcnkgcG9zc2li
bHkgd2l0aCB0aGUgc2FuZSBhcHByb2FjaCB5b3UgYXJlIGhvcGluZyBmb3IuCgoKSnVlcmdlbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
