Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A376310AD2F
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 11:07:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZuCG-00038q-8P; Wed, 27 Nov 2019 10:05:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aWg5=ZT=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iZuCF-00038i-B4
 for xen-devel@lists.xen.org; Wed, 27 Nov 2019 10:05:19 +0000
X-Inumbo-ID: 6a1f3092-10fd-11ea-a55d-bc764e2007e4
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6a1f3092-10fd-11ea-a55d-bc764e2007e4;
 Wed, 27 Nov 2019 10:05:18 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id l17so6423384wmh.0
 for <xen-devel@lists.xen.org>; Wed, 27 Nov 2019 02:05:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yh8zbb/Q1mvsbixmW1DeCf+G82kxH7bgAwo+W4b4OEo=;
 b=BAHqD1LbZW6seC3o9aiBWgXubjY8LAq2pIpMSO2wG+Y9jttz5VWdblCPgAAUiN+mwB
 XCQse4q0fkxXajkbyDYDv6CJyqmwt+YVeVqVrEqQY2tUNHfmyB5CEut618GRwlRyYDKC
 YwKjn18FDkt7JpWG7r4+ubNV78KcLnbk88rtVrSF5YMyjLwNzHsP23lyqO9zKUfLdyXG
 MfYE/yddjwWeDQxDXVC/Yet72fqMeIyXlBWnGn4Ac7hU4Y+8adfynsDmolX7ZgsI2ta8
 c3x5F5hM2jJNFzm/fYSejeBXiVCskX+PbdCyKBL2Og6scXB037B4/zPdgDxKdBQPPdvg
 LfUg==
X-Gm-Message-State: APjAAAVPdsfnQ1d/m+37CUG5z0d992Ux48/ZhiX8HwaOp2ABXV8icimA
 hd20+ImNy32fm9CEcPBcqXA=
X-Google-Smtp-Source: APXvYqxp5ov/E+EKyrIVxyd1rdEsEaNmUSgo3rfbmEz+XBchijJhF42Nf30SLVMBwgzvCtijowvQMw==
X-Received: by 2002:a1c:6485:: with SMTP id y127mr2829866wmb.19.1574849117672; 
 Wed, 27 Nov 2019 02:05:17 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-239.amazon.com.
 [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id 189sm6231809wmc.7.2019.11.27.02.05.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Nov 2019 02:05:17 -0800 (PST)
To: Peng Fan <peng.fan@nxp.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20191122080226.6817-1-peng.fan@nxp.com>
 <alpine.DEB.2.21.1911221105360.11302@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.1911261241260.8205@sstabellini-ThinkPad-T480s>
 <942a60db-fd30-a63e-25b1-e6b739b17c4e@xen.org>
 <alpine.DEB.2.21.1911261306370.8205@sstabellini-ThinkPad-T480s>
 <e98515e2-8e2e-569a-557e-523e9f134bef@xen.org>
 <13d490f1-cd9e-e2aa-d118-2c96cf03eb9b@suse.com>
 <AM0PR04MB4481C1F43E0827D5652148F488440@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <e846a55b-3379-a22d-93db-862bc5279b64@suse.com>
 <AM0PR04MB448168F303BEA1BA2EF598E288440@AM0PR04MB4481.eurprd04.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2c5ed7b2-a67a-cdbf-33dc-215d5f98aef8@xen.org>
Date: Wed, 27 Nov 2019 10:05:16 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <AM0PR04MB448168F303BEA1BA2EF598E288440@AM0PR04MB4481.eurprd04.prod.outlook.com>
Content-Language: en-GB
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

CgpPbiAyNy8xMS8yMDE5IDA5OjQ5LCBQZW5nIEZhbiB3cm90ZToKPj4gU3ViamVjdDogUmU6IFtY
ZW4tZGV2ZWxdIFtQQVRDSCBWMl0gYXJjaDogYXJtOiB2Z2ljLXYzOiBmaXggR0lDRF9JU0FDVElW
RVIKPj4gcmFuZ2UKPj4KPj4gT24gMjcuMTEuMTkgMTA6MzEsIFBlbmcgRmFuIHdyb3RlOgo+Pj4+
IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggVjJdIGFyY2g6IGFybTogdmdpYy12Mzog
Zml4Cj4+Pj4gR0lDRF9JU0FDVElWRVIgcmFuZ2UKPj4+Pgo+Pj4+IE9uIDI3LjExLjE5IDAxOjAx
LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4+IEhpLAo+Pj4+Pgo+Pj4+PiBPbiAyNi8xMS8yMDE5
IDIzOjE3LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+Pj4+PiBPbiBUdWUsIDI2IE5vdiAy
MDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4+Pj4gSGksCj4+Pj4+Pj4KPj4+Pj4+PiBPbiAy
Ni8xMS8yMDE5IDIwOjQzLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+Pj4+Pj4+ICsgSnVl
cmdlbgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBJIG1pc3NlZCB0aGF0IHlvdSB3ZXJlbid0IGluIENDIHRv
IHRoZSBvcmlnaW5hbCBwYXRjaCwgc29ycnkuCj4+Pj4+Pj4+IEkgdGhpbmsgdGhpcyBwYXRjaCBz
aG91bGQgZ28gaW4sIGFzIG90aGVyd2lzZSBMaW51eCA1LjQgY291bGQgcnVuCj4+Pj4+Pj4+IGlu
dG8gcHJvYmxlbXMuIEl0IGlzIGFsc28gYSBwcmV0dHkgc3RyYWlnaHRmb3J3YXJkIDQgbGluZXMg
cGF0Y2guCj4+Pj4+Pj4KPj4+Pj4+PiA1LjUgKG9yIDUuNikgaXMgbm90IGdvaW5nIHRvIHJ1biBv
biBYZW4gZm9yIG90aGVyIHJlYXNvbnMgKHN0aWxsCj4+Pj4+Pj4gaW4gdGhlIHZHSUMpLi4uIFNv
IEkgd291bGQgbm90IHZpZXcgdGhpcyBhcyBjcml0aWNhbC4KPj4+Pj4+Cj4+Pj4+PiA1LjUgaXMg
bm90IG91dCB5ZXQsIGluIGZhY3QsIHRoZSBkZXYgd2luZG93IGhhcyBqdXN0IG9wZW5lZC4gSXNu
J3QKPj4+Pj4+IHlvdXIgc3RhdGVtZW50IGEgYml0IHByZW1hdHVyZT8KPj4+Pj4KPj4+Pj4gVGhl
IEdJQ3Y0LjEgd29yayBbMV0gaXMgZ29pbmcgdG8gcHJldmVudCBMaW51eCBib290aW5nIG9uIGFs
bAo+Pj4+PiBjdXJyZW50IHZlcnNpb25zIG9mIFhlbi4gV2hpbGUgSSBjYW4ndCBjb25maXJtIHRo
aXMgaXMgZ29pbmcgdG8gYmUKPj4+Pj4gbWVyZ2VkIGluIDUuNSwgSSBjYW4gdGVsbCB5b3UgdGhp
cyB3aWxsIGJyZWFrLgo+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IEluIGFueSBjYXNlLCBldmVuIGlmIHBv
dGVudGlhbCBmdXR1cmUgTGludXggcmVsZWFzZXMgY291bGQgaGF2ZQo+Pj4+Pj4gb3RoZXIgYWRk
aXRpb25hbCBpc3N1ZXMsIEkgZG9uJ3QgdGhpbmsgaXQgc2hvdWxkIGNoYW5nZSBvdXIgY3VycmVu
dAo+Pj4+Pj4gdmlldyBvbiB0aGlzIHNwZWNpZmljIGlzc3VlIHdoaWNoIGFmZmVjdHMgNS40LCBq
dXN0IHJlbGVhc2VkLgo+Pj4+Pgo+Pj4+PiBUaGUgcGF0Y2ggaXMgZGVmaW5pdGVseSBub3QgYXMg
c3RyYWlnaHRmb3J3YXJkIGFzIHlvdSBtYXkgdGhpbmsuCj4+Pj4+IFBsZWFzZSByZWZlciB0byB0
aGUgZGlzY3Vzc2lvbiB3ZSBoYWQgb24gdGhlIGZpcnN0IHZlcnNpb24uIEkgdm9pY2VkCj4+Pj4+
IGNvbmNlcm4gYWJvdXQgdGhpcyBhcHByb2FjaCBhbmQgZ2F2ZSBwb2ludCB3aGF0IGNvdWxkIGdv
IHdyb25nIHdpdGgKPj4+PiBoYXBwZW4uCj4+Pj4+Cj4+Pj4+IFRoaXMgcGF0Y2ggbWF5IGJlIGJl
dHRlciB0aGFuIHRoZSBjdXJyZW50IHN0YXRlIChpLmUgY3Jhc2hpbmcpLCBidXQKPj4+Pj4gdGhp
cyB3YXNuJ3QgdGVzdGVkIGVub3VnaCB0byBjb25maXJtIHRoaXMgaXMgdGhlIGNvcnJlY3QgdGhp
bmdzIHRvCj4+Pj4+IGRvIGFuZCBubyBvdGhlciBidWcgd2lsbCBhcHBlYXIgKEkgZG9uJ3QgYmVs
aWV2ZSByZWFkaW5nIEkqQUNUSVZFUgo+Pj4+PiB3YXMgZXZlciB0ZXN0ZWQgYmVmb3JlKS4KPj4+
Pj4KPj4+Pj4gSXQgaXMgYW4gYW5ub3lpbmcgYnVnLCBidXQgdGhpcyBpcyBvbmx5IGFmZmVjdGlu
ZyA1LjQgd2hpY2ggaGFzIGp1c3QKPj4+Pj4gYmVlbiByZWxlYXNlZC4gSXQgZmVlbHMgdG8gbWUg
dGhpcyBpcyBhIGZhaXJseSByaXNreSBjaG9pY2UgdG8gbWVyZ2UKPj4+Pj4gaXQgcXV0aWUgbGF0
ZSBpbiB0aGUgcmVsZWFzZSB3aXRob3V0IGEgZ29vZCBncmFwcyBvZiB0aGUgcHJvYmxlbSAoc2Vl
Cj4+IGFib3ZlKS4KPj4+Pj4KPj4+Pj4gU28gSSB3b3VsZCBkZWZpbml0bHksIHByZWZlciBpZiB0
aGlzIHBhdGNoIGlzIGdldHRpbmcgdGhyb3VnaAo+Pj4+PiBiYWNrcG9ydCBvbmNlIHdlIGdldCBt
b3JlIHRlc3RpbmcuCj4+Pj4+Cj4+Pj4+IFdlIGNhbiBzdGlsbCBkb2N1bWVudCB0aGUgYnVnIGlu
IHRoZSByZWxlYXNlIG5vdGUgYW5kIHBvaW50IHBlb3BsZQo+Pj4+PiB0byB0aGUgcGF0Y2guCj4+
Pj4+Cj4+Pj4+IEFueXdheSwgdGhpcyBpcyBKdWVyZ2VuIGNob2ljZSBoZXJlLiBCdXQgYXQgbGVh
c3Qgbm93IGhlIGhhcyB0aGUKPj4+Pj4gZnVsbCBwaWN0dXJlLi4uCj4+Pj4+Cj4+Pj4+IENoZWVy
cywKPj4+Pj4KPj4+Pj4gWzFdCj4+Pj4+Cj4+IGh0dHBzOi8vZXVyMDEuc2FmZWxpbmtzLnByb3Rl
Y3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmx3bi4KPj4+Pj4KPj4+Pgo+PiBu
ZXQlMkZBcnRpY2xlcyUyRjgwMDQ5NCUyRiZhbXA7ZGF0YT0wMiU3QzAxJTdDcGVuZy5mYW4lNDBu
eHAuY28KPj4+PiBtJTdDZGNhCj4+Pj4+Cj4+Pj4KPj4gZGZiMzkyNDA3NDllZTY3NWUwOGQ3NzJm
Y2QzYmElN0M2ODZlYTFkM2JjMmI0YzZmYTkyY2Q5OWM1YzMwMTYzCj4+Pj4gNSU3QzAlNwo+Pj4+
Pgo+Pj4+Cj4+IEMwJTdDNjM3MTA0MzAyNTE5OTk2NTkyJmFtcDtzZGF0YT03SnYySWhJOEhaZ0JU
U3VZemtFcGxGeWhYMWx6bXYKPj4+PiBkNzN4YjUKPj4+Pj4gMmQ2RVJWUSUzRCZhbXA7cmVzZXJ2
ZWQ9MAo+Pj4+Pgo+Pj4+Cj4+Pj4gVGhhbmtzLCBKdWxpZW4sIGZvciBzaGFyaW5nIHlvdXIgb3Bp
bmlvbi4KPj4+Pgo+Pj4+IFdpdGggdGhhdCBzdGF0ZW1lbnQgSSdkIGxpa2UgdG8gZGVmZXIgdGhp
cyBwYXRjaCB0byA0LjE0Lgo+Pj4KPj4+IEJ1dCB3aXRob3V0IHRoaXMgcGF0Y2gsIDUuNCBrZXJu
ZWwgd2lsbCBjcmFzaC4gU28geW91IHByZWZlciB3ZQo+Pj4gZGV2ZWxvcCB0aGUgc29sdXRpb24g
YXMgSnVsaWVuIHN1Z2dlc3RlZCBmb3IgNC4xMz8KClllcyA1LjQgd2lsbCBjcmFzaCBvbiBYZW4g
NC4xMyAoYXMgYW55IHByZXZpb3VzIHZlcnNpb24gb2YgWGVuKS4gQnV0IEkgCmRvbid0IHRoaW5r
IHRoaXMgaXMgcmlnaHQgdG8gcHVzaCBhIHBhdGNoIGxhdGUgd2l0aG91dCBhIGNsZWFyIAp1bmRl
cnN0YW5kaW5nIG9mIHRoZSBwcm9ibGVtLgoKVGhlIGFyZ3VtZW50IHNvIGZhciBoYXMgYmVlbiB3
ZSBhbHJlYWR5IGltcGxlbWVudGVkIEkqQUNUSVZFUiBsaWtlIHRoYXQgCnNvIGl0IGlzIGZpbmUg
dG8gY29udGludWUgbGlrZSB0aGF0LiBIb3dldmVyLCBJIGFtIG5vdCBjb252aW5jZWQgdGhlIApw
YXRoIGhhcyBldmVyIGJlZW4gZXhlcmNpc2VkIHdpdGggb2xkZXIgcmVsZWFzZSBvZiBMaW51eCBh
bmQgNS40IHdpbGwgCndvcmsgYXMgaW50ZW5kZWQgb24gWGVuIDQuMTMgd2l0aCB0aGlzIHBhdGNo
LgoKU28gSSB3b3VsZCByZWNvbW1lbmQgdG8gcmVhZCBiYWNrIG15IGFuc3dlciBvbiB2MSBhbmQg
dHJ5aW5nIHRvIGV4cGxhaW4gCndoeSB0aGlzIGFwcHJvYWNoIGlzIGFjY2VwdGFibGUgdG8gaGF2
ZS4KCj4+Cj4+IEkgY2VydGFpbmx5IHdvbid0IHRha2UgYSBwYXRjaCBmb3IgNC4xMyB3aGVuIGEg
bWFpbnRhaW5lciBvZiB0aGUgcmVsYXRlZCBjb2RlCj4+IGhhcyByZXNlcnZhdGlvbnMgYWdhaW5z
dCBpdC4KPj4KPj4gSSB0aGluayB0aGUgYmVzdCB0aGluZyB0byBkbyBpcyB0byBkZXZlbG9wIGEg
cHJvcGVyIHBhdGNoIHRoZSBtYWludGFpbmVycyBhcmUKPj4gaGFwcHkgd2l0aCBhbmQgZG9uJ3Qg
dHJ5IHRvIGZvcmNlIGl0IGludG8gNC4xMyBub3cuCj4+IFN1Y2ggYSBwYXRjaCBjYW4gc3RpbGwg
YmUgYmFja3BvcnRlZCB0byA0LjEzIGxhdGVyLgo+IAo+IE9rLgo+IAo+IEp1bGllbiwKPiAKPiBX
aGF0J3MgeW91ciBzdWdnZXN0aW9uIHRvIGZpeCB0aGUgaXNzdWU/IERvIHlvdSBoYXZlIGEgcm91
Z2ggaWRlYT8KCllvdSBjYW4gaGF2ZSBhIGxvb2sgYXQgd2hhdCB0aGUgbmV3IHZHSUMgaXMgZG9p
bmcgKHNlZSAKdmdpYy92Z2ljLW1taW8uYykuIEkgZG9uJ3Qga25vdyBob3cgZmVhc2libGUgaXQg
aXMgd2l0aCB0aGUgY3VycmVudCB2R0lDLgoKSG93ZXZlciwgYXMgSSBwb2ludGVkIG91dCBwcmV2
aW91c2x5LCB0aGlzIHBhdGNoIHdvdWxkIGJlIGFjY2VwdGFibGUgZm9yIAp0aGUgbmV4dCB2ZXJz
aW9uIG9mIFhlbi4gQnV0IEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBzdWl0YWJsZSBmb3IgWGVuIDQu
MTMgCmJlY2F1c2Ugd2UgZG9uJ3QgaGF2ZSBlbm91Z2ggZGF0YSB0byBsb3dlciB0aGUgcmlzayBv
ZiB0aGlzIHBhdGNoLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
