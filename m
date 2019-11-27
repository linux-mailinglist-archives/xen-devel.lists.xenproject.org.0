Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AE910ACAD
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 10:38:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZtk8-0000Am-4O; Wed, 27 Nov 2019 09:36:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bRVm=ZT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iZtk6-0000Ah-PS
 for xen-devel@lists.xen.org; Wed, 27 Nov 2019 09:36:14 +0000
X-Inumbo-ID: 596fe506-10f9-11ea-83b8-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 596fe506-10f9-11ea-83b8-bc764e2007e4;
 Wed, 27 Nov 2019 09:36:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 96AC4B119;
 Wed, 27 Nov 2019 09:36:11 +0000 (UTC)
To: Peng Fan <peng.fan@nxp.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20191122080226.6817-1-peng.fan@nxp.com>
 <alpine.DEB.2.21.1911221105360.11302@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.1911261241260.8205@sstabellini-ThinkPad-T480s>
 <942a60db-fd30-a63e-25b1-e6b739b17c4e@xen.org>
 <alpine.DEB.2.21.1911261306370.8205@sstabellini-ThinkPad-T480s>
 <e98515e2-8e2e-569a-557e-523e9f134bef@xen.org>
 <13d490f1-cd9e-e2aa-d118-2c96cf03eb9b@suse.com>
 <AM0PR04MB4481C1F43E0827D5652148F488440@AM0PR04MB4481.eurprd04.prod.outlook.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <e846a55b-3379-a22d-93db-862bc5279b64@suse.com>
Date: Wed, 27 Nov 2019 10:36:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <AM0PR04MB4481C1F43E0827D5652148F488440@AM0PR04MB4481.eurprd04.prod.outlook.com>
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
Cc: "julien.grall@arm.com" <julien.grall@arm.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 Alice Guo <alice.guo@nxp.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMTEuMTkgMTA6MzEsIFBlbmcgRmFuIHdyb3RlOgo+PiBTdWJqZWN0OiBSZTogW1hlbi1k
ZXZlbF0gW1BBVENIIFYyXSBhcmNoOiBhcm06IHZnaWMtdjM6IGZpeCBHSUNEX0lTQUNUSVZFUgo+
PiByYW5nZQo+Pgo+PiBPbiAyNy4xMS4xOSAwMTowMSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4g
SGksCj4+Pgo+Pj4gT24gMjYvMTEvMjAxOSAyMzoxNywgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3Rl
Ogo+Pj4+IE9uIFR1ZSwgMjYgTm92IDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+Pj4gSGks
Cj4+Pj4+Cj4+Pj4+IE9uIDI2LzExLzIwMTkgMjA6NDMsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPj4+Pj4+ICsgSnVlcmdlbgo+Pj4+Pj4KPj4+Pj4+IEkgbWlzc2VkIHRoYXQgeW91IHdlcmVu
J3QgaW4gQ0MgdG8gdGhlIG9yaWdpbmFsIHBhdGNoLCBzb3JyeS4KPj4+Pj4+IEkgdGhpbmsgdGhp
cyBwYXRjaCBzaG91bGQgZ28gaW4sIGFzIG90aGVyd2lzZSBMaW51eCA1LjQgY291bGQgcnVuCj4+
Pj4+PiBpbnRvIHByb2JsZW1zLiBJdCBpcyBhbHNvIGEgcHJldHR5IHN0cmFpZ2h0Zm9yd2FyZCA0
IGxpbmVzIHBhdGNoLgo+Pj4+Pgo+Pj4+PiA1LjUgKG9yIDUuNikgaXMgbm90IGdvaW5nIHRvIHJ1
biBvbiBYZW4gZm9yIG90aGVyIHJlYXNvbnMgKHN0aWxsIGluCj4+Pj4+IHRoZSB2R0lDKS4uLiBT
byBJIHdvdWxkIG5vdCB2aWV3IHRoaXMgYXMgY3JpdGljYWwuCj4+Pj4KPj4+PiA1LjUgaXMgbm90
IG91dCB5ZXQsIGluIGZhY3QsIHRoZSBkZXYgd2luZG93IGhhcyBqdXN0IG9wZW5lZC4gSXNuJ3QK
Pj4+PiB5b3VyIHN0YXRlbWVudCBhIGJpdCBwcmVtYXR1cmU/Cj4+Pgo+Pj4gVGhlIEdJQ3Y0LjEg
d29yayBbMV0gaXMgZ29pbmcgdG8gcHJldmVudCBMaW51eCBib290aW5nIG9uIGFsbCBjdXJyZW50
Cj4+PiB2ZXJzaW9ucyBvZiBYZW4uIFdoaWxlIEkgY2FuJ3QgY29uZmlybSB0aGlzIGlzIGdvaW5n
IHRvIGJlIG1lcmdlZCBpbgo+Pj4gNS41LCBJIGNhbiB0ZWxsIHlvdSB0aGlzIHdpbGwgYnJlYWsu
Cj4+Pgo+Pj4+Cj4+Pj4gSW4gYW55IGNhc2UsIGV2ZW4gaWYgcG90ZW50aWFsIGZ1dHVyZSBMaW51
eCByZWxlYXNlcyBjb3VsZCBoYXZlIG90aGVyCj4+Pj4gYWRkaXRpb25hbCBpc3N1ZXMsIEkgZG9u
J3QgdGhpbmsgaXQgc2hvdWxkIGNoYW5nZSBvdXIgY3VycmVudCB2aWV3IG9uCj4+Pj4gdGhpcyBz
cGVjaWZpYyBpc3N1ZSB3aGljaCBhZmZlY3RzIDUuNCwganVzdCByZWxlYXNlZC4KPj4+Cj4+PiBU
aGUgcGF0Y2ggaXMgZGVmaW5pdGVseSBub3QgYXMgc3RyYWlnaHRmb3J3YXJkIGFzIHlvdSBtYXkg
dGhpbmsuCj4+PiBQbGVhc2UgcmVmZXIgdG8gdGhlIGRpc2N1c3Npb24gd2UgaGFkIG9uIHRoZSBm
aXJzdCB2ZXJzaW9uLiBJIHZvaWNlZAo+Pj4gY29uY2VybiBhYm91dCB0aGlzIGFwcHJvYWNoIGFu
ZCBnYXZlIHBvaW50IHdoYXQgY291bGQgZ28gd3Jvbmcgd2l0aAo+PiBoYXBwZW4uCj4+Pgo+Pj4g
VGhpcyBwYXRjaCBtYXkgYmUgYmV0dGVyIHRoYW4gdGhlIGN1cnJlbnQgc3RhdGUgKGkuZSBjcmFz
aGluZyksIGJ1dAo+Pj4gdGhpcyB3YXNuJ3QgdGVzdGVkIGVub3VnaCB0byBjb25maXJtIHRoaXMg
aXMgdGhlIGNvcnJlY3QgdGhpbmdzIHRvIGRvCj4+PiBhbmQgbm8gb3RoZXIgYnVnIHdpbGwgYXBw
ZWFyIChJIGRvbid0IGJlbGlldmUgcmVhZGluZyBJKkFDVElWRVIgd2FzCj4+PiBldmVyIHRlc3Rl
ZCBiZWZvcmUpLgo+Pj4KPj4+IEl0IGlzIGFuIGFubm95aW5nIGJ1ZywgYnV0IHRoaXMgaXMgb25s
eSBhZmZlY3RpbmcgNS40IHdoaWNoIGhhcyBqdXN0Cj4+PiBiZWVuIHJlbGVhc2VkLiBJdCBmZWVs
cyB0byBtZSB0aGlzIGlzIGEgZmFpcmx5IHJpc2t5IGNob2ljZSB0byBtZXJnZQo+Pj4gaXQgcXV0
aWUgbGF0ZSBpbiB0aGUgcmVsZWFzZSB3aXRob3V0IGEgZ29vZCBncmFwcyBvZiB0aGUgcHJvYmxl
bSAoc2VlIGFib3ZlKS4KPj4+Cj4+PiBTbyBJIHdvdWxkIGRlZmluaXRseSwgcHJlZmVyIGlmIHRo
aXMgcGF0Y2ggaXMgZ2V0dGluZyB0aHJvdWdoIGJhY2twb3J0Cj4+PiBvbmNlIHdlIGdldCBtb3Jl
IHRlc3RpbmcuCj4+Pgo+Pj4gV2UgY2FuIHN0aWxsIGRvY3VtZW50IHRoZSBidWcgaW4gdGhlIHJl
bGVhc2Ugbm90ZSBhbmQgcG9pbnQgcGVvcGxlIHRvCj4+PiB0aGUgcGF0Y2guCj4+Pgo+Pj4gQW55
d2F5LCB0aGlzIGlzIEp1ZXJnZW4gY2hvaWNlIGhlcmUuIEJ1dCBhdCBsZWFzdCBub3cgaGUgaGFz
IHRoZSBmdWxsCj4+PiBwaWN0dXJlLi4uCj4+Pgo+Pj4gQ2hlZXJzLAo+Pj4KPj4+IFsxXQo+Pj4g
aHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBz
JTNBJTJGJTJGbHduLgo+Pj4KPj4gbmV0JTJGQXJ0aWNsZXMlMkY4MDA0OTQlMkYmYW1wO2RhdGE9
MDIlN0MwMSU3Q3BlbmcuZmFuJTQwbnhwLmNvCj4+IG0lN0NkY2EKPj4+Cj4+IGRmYjM5MjQwNzQ5
ZWU2NzVlMDhkNzcyZmNkM2JhJTdDNjg2ZWExZDNiYzJiNGM2ZmE5MmNkOTljNWMzMDE2Mwo+PiA1
JTdDMCU3Cj4+Pgo+PiBDMCU3QzYzNzEwNDMwMjUxOTk5NjU5MiZhbXA7c2RhdGE9N0p2MkloSThI
WmdCVFN1WXprRXBsRnloWDFsem12Cj4+IGQ3M3hiNQo+Pj4gMmQ2RVJWUSUzRCZhbXA7cmVzZXJ2
ZWQ9MAo+Pj4KPj4KPj4gVGhhbmtzLCBKdWxpZW4sIGZvciBzaGFyaW5nIHlvdXIgb3Bpbmlvbi4K
Pj4KPj4gV2l0aCB0aGF0IHN0YXRlbWVudCBJJ2QgbGlrZSB0byBkZWZlciB0aGlzIHBhdGNoIHRv
IDQuMTQuCj4gCj4gQnV0IHdpdGhvdXQgdGhpcyBwYXRjaCwgNS40IGtlcm5lbCB3aWxsIGNyYXNo
LiBTbyB5b3UgcHJlZmVyCj4gd2UgZGV2ZWxvcCB0aGUgc29sdXRpb24gYXMgSnVsaWVuIHN1Z2dl
c3RlZCBmb3IgNC4xMz8KCkkgY2VydGFpbmx5IHdvbid0IHRha2UgYSBwYXRjaCBmb3IgNC4xMyB3
aGVuIGEgbWFpbnRhaW5lciBvZiB0aGUKcmVsYXRlZCBjb2RlIGhhcyByZXNlcnZhdGlvbnMgYWdh
aW5zdCBpdC4KCkkgdGhpbmsgdGhlIGJlc3QgdGhpbmcgdG8gZG8gaXMgdG8gZGV2ZWxvcCBhIHBy
b3BlciBwYXRjaCB0aGUKbWFpbnRhaW5lcnMgYXJlIGhhcHB5IHdpdGggYW5kIGRvbid0IHRyeSB0
byBmb3JjZSBpdCBpbnRvIDQuMTMgbm93LgpTdWNoIGEgcGF0Y2ggY2FuIHN0aWxsIGJlIGJhY2tw
b3J0ZWQgdG8gNC4xMyBsYXRlci4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
