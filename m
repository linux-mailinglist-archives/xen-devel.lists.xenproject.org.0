Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9194183021
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 13:23:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCMqG-0003Qa-Oa; Thu, 12 Mar 2020 12:21:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZoK0=45=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jCMqE-0003QV-HU
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 12:21:34 +0000
X-Inumbo-ID: 029ba3a8-645c-11ea-b171-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 029ba3a8-645c-11ea-b171-12813bfff9fa;
 Thu, 12 Mar 2020 12:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584015694;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=OlpbRxXIfkcXSIu6bntfeEzoTSkkShs3aTIAfcv+zuI=;
 b=ZzOxkCmZHyWnPdlpQmuq51MGRqvGvdj7j1GJjP7vRXmEeXxkG+sbwJkZ
 /ZI7TSwaq4FZcTQ/q/DYDr2ww3Ll0I71VyZkZ9tC8gH8sqOk8k+UoUc/L
 eEvPNeErxTuQk+JtOja98GeIzKuFdnQPF3o/QCR6aNvJBvUTYTeB+rf3g s=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: tpFLNp+Hd/LLcShuITGImyl0pwOJMf3aDL53bv9cjd/IaqdiJXIhG6u2vfUO7JgDGf/oTLVwYs
 RJCaJa6MkND1IyRG6nlaUnrhIrgqOHkp49UsaJoFiByYp6+SYrCe12fWmwM9ML2ru/njhZwpd0
 EEA/WORsDSckfFxp6+TCeedTD9A72DDAtrfPYdLSBXhp54u8fNRtoFSLYcLsTcXaMFka7Sr2R3
 7xw8sq/w1ezQ1bfRY9Fj19mLiFnEwKJPH66YECNnnv2yqg7pB3wTuJP0h5TTa0gB1QMEMidHJv
 N5k=
X-SBRS: 2.7
X-MesageID: 14019806
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,544,1574139600"; d="scan'208";a="14019806"
To: Jan Beulich <jbeulich@suse.com>
References: <20200311183455.23729-1-andrew.cooper3@citrix.com>
 <2ad6f0e6-60ed-572f-18f5-1c701d3c9495@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <00989506-75dc-62dc-6de9-0920c6e8f114@citrix.com>
Date: Thu, 12 Mar 2020 12:21:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <2ad6f0e6-60ed-572f-18f5-1c701d3c9495@suse.com>
Content-Language: en-US
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/vvmx: Fix deadlock with MSR bitmap
 merging
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMDMvMjAyMCAwOToyMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTEuMDMuMjAyMCAx
OTozNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gYy9zIGM0Nzk4NGFhYmVhZCAibnZteDogaW1w
bGVtZW50IHN1cHBvcnQgZm9yIE1TUiBiaXRtYXBzIiBpbnRyb2R1Y2VkIGEgdXNlIG9mCj4+IG1h
cF9kb21haW5fcGFnZSgpIHdoaWNoIG1heSBnZXQgdXNlZCBpbiB0aGUgbWlkZGxlIG9mIGNvbnRl
eHQgc3dpdGNoLgo+Pgo+PiBUaGlzIGlzIG5vdCBzYWZlLCBhbmQgY2F1c2VzIFhlbiB0byBkZWFk
bG9jayBvbiB0aGUgbWFwY2FjaGUgbG9jazoKPj4KPj4gICAoWEVOKSBYZW4gY2FsbCB0cmFjZToK
Pj4gICAoWEVOKSAgICBbPGZmZmY4MmQwODAyMmQ2YWU+XSBSIF9zcGluX2xvY2srMHgzNC8weDVl
Cj4+ICAgKFhFTikgICAgWzxmZmZmODJkMDgwMzIxOWQ3Pl0gRiBtYXBfZG9tYWluX3BhZ2UrMHgy
NTAvMHg1MjcKPj4gICAoWEVOKSAgICBbPGZmZmY4MmQwODAzNTYzMzI+XSBGIGRvX3BhZ2VfZmF1
bHQrMHg0MjAvMHg3ODAKPj4gICAoWEVOKSAgICBbPGZmZmY4MmQwODAzOGRhM2Q+XSBGIHg4Nl82
NC9lbnRyeS5TI2hhbmRsZV9leGNlcHRpb25fc2F2ZWQrMHg2OC8weDk0Cj4+ICAgKFhFTikgICAg
WzxmZmZmODJkMDgwMzE3MjlmPl0gRiBfX2ZpbmRfbmV4dF96ZXJvX2JpdCsweDI4LzB4NjkKPj4g
ICAoWEVOKSAgICBbPGZmZmY4MmQwODAzMjFhNGQ+XSBGIG1hcF9kb21haW5fcGFnZSsweDJjNi8w
eDUyNwo+PiAgIChYRU4pICAgIFs8ZmZmZjgyZDA4MDI5ZWViMj5dIEYgbnZteF91cGRhdGVfZXhl
Y19jb250cm9sKzB4MWQ3LzB4MzIzCj4+ICAgKFhFTikgICAgWzxmZmZmODJkMDgwMjk5ZjVhPl0g
RiB2bXhfdXBkYXRlX2NwdV9leGVjX2NvbnRyb2wrMHgyMy8weDQwCj4+ICAgKFhFTikgICAgWzxm
ZmZmODJkMDgwMjlhM2Y3Pl0gRiBhcmNoL3g4Ni9odm0vdm14L3ZteC5jI3ZteF9jdHh0X3N3aXRj
aF9mcm9tKzB4YjcvMHgxMjEKPj4gICAoWEVOKSAgICBbPGZmZmY4MmQwODAzMWQ3OTY+XSBGIGFy
Y2gveDg2L2RvbWFpbi5jI19fY29udGV4dF9zd2l0Y2grMHgxMjQvMHg0YTkKPj4gICAoWEVOKSAg
ICBbPGZmZmY4MmQwODAzMjA5MjU+XSBGIGNvbnRleHRfc3dpdGNoKzB4MTU0LzB4NjJjCj4+ICAg
KFhFTikgICAgWzxmZmZmODJkMDgwMjUyZjNlPl0gRiBjb21tb24vc2NoZWQvY29yZS5jI3NjaGVk
X2NvbnRleHRfc3dpdGNoKzB4MTZhLzB4MTc1Cj4+ICAgKFhFTikgICAgWzxmZmZmODJkMDgwMjUz
ODc3Pl0gRiBjb21tb24vc2NoZWQvY29yZS5jI3NjaGVkdWxlKzB4MmFkLzB4MmJjCj4+ICAgKFhF
TikgICAgWzxmZmZmODJkMDgwMjJjYzk3Pl0gRiBjb21tb24vc29mdGlycS5jI19fZG9fc29mdGly
cSsweGI3LzB4YzgKPj4gICAoWEVOKSAgICBbPGZmZmY4MmQwODAyMmNkMzg+XSBGIGRvX3NvZnRp
cnErMHgxOC8weDFhCj4+ICAgKFhFTikgICAgWzxmZmZmODJkMDgwMmEyZmJiPl0gRiB2bXhfYXNt
X2RvX3ZtZW50cnkrMHgyYi8weDMwCj4+Cj4+IENvbnZlcnQgdGhlIGRvbWhlYXAgcGFnZSBpbnRv
IGJlaW5nIGEgeGVuaGVhcCBwYWdlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+Cj4KPj4gSSBzdXNwZWN0IHRoaXMgaXMgdGhlIG5vdC1xdWl0ZS1j
b25zaXN0ZW50LWVub3VnaC10by1iaXNlY3QgaXNzdWUgd2hpY2gKPj4gT1NTVGVzdCBpcyBoaXR0
aW5nIGFuZCBpbnRlcmZlcmluZyB3aXRoIHB1c2hlcyB0byBtYXN0ZXIuCj4gSGF2aW5nIGxvb2tl
ZCBhdCBhIG51bWJlciBvZiAoYWxiZWl0IG5vdCBhbGwpIGZhaWx1cmVzLCBJIGRvbid0Cj4gdGhp
bmsgSSd2ZSBzZWVuIGFueSBzaWduIG9mIGEgY3Jhc2ggbGlrZSB0aGUgb25lIGFib3ZlLiBEbyB5
b3UKPiB0aGluayB0aGVyZSBhcmUgbW9yZSBzdWJ0bGUgbWFuaWZlc3RhdGlvbnMgb2YgdGhlIGlz
c3VlPwoKVGhpcyBzdGFjayB0cmFjZSB3YXMgcHJvZHVjZWQgYnkgYW4gTk1JIHdhdGNoZG9nIHRp
bWVvdXQsIGFuZCBJIHRob3VnaHQKT1NTVGVzdCBkaWRuJ3QsIGJ1dCBJIHNlZSBJJ20gd3Jvbmcu
CgpJbiB3aGljaCBjYXNlIHRoaXMgcHJvYmFibHkgaXNuJ3Qgd2FudCBPU1NUZXN0IGlzIHNlZWlu
ZywgYnV0IGl0IGlzIGEKZ2VudWluZSBpc3N1ZS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
