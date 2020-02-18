Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A64011625BF
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 12:47:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j41JE-0002st-SB; Tue, 18 Feb 2020 11:45:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9Xbw=4G=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j41JC-0002sk-SF
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 11:44:58 +0000
X-Inumbo-ID: 16493048-5244-11ea-8158-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 16493048-5244-11ea-8158-12813bfff9fa;
 Tue, 18 Feb 2020 11:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582026299;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=3PU67Ea+WyVoJwHmmzP7/684pdVHJ+OmthECTO+AkeY=;
 b=MRFzyzrVaP2RqznyLizWhyS5ZmUgco16wqh0PJraWmtfPpVKPayPMSUw
 QxdoncYVmAVk5itjhJ8loAQq/zPYq0mzfYhj5b2e/CC/bH+A+Yg84mwvv
 Upgsda959GXgvMW9lFs7FMHTCaysi01CpvCg58Puy4D9/e0lpyZo3xi2a s=;
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
IronPort-SDR: /VSxGygrbhmhsdiTmzMqPLH0ncX+X/SDZExrboTNGs1w7mfPNJGkz7V55edB8JLfSNyjvYvhPH
 J3sDXicmg8dB2/51AwojCU53tvMJjZqODXAEQZTkiClGzw2i1LE+3r09mjuVcXEwg3dOcX4XRI
 l/nBzS+7xLBc3jajPj5PW7Ek85TzIYrLo3PL07/1hh1Y5wBN0/Tt5ll+LvIcYLPu1nCMGylWms
 x1KPdNz4I6K9tmtibzPv9z1vRrufe6UHGfgSQNjQlBOTy8cReApHSYxvT8iOSHqzt9849P2rCm
 HIU=
X-SBRS: 2.7
X-MesageID: 12786659
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,456,1574139600"; d="scan'208";a="12786659"
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20200217184324.73762-1-roger.pau@citrix.com>
 <20200217184324.73762-6-roger.pau@citrix.com>
 <8faffe76-2ab2-170a-4d42-228254fc57ed@citrix.com>
 <20200218111039.GS4679@Air-de-Roger>
 <1071be16-b929-a251-f2f9-a55d40ce2e53@citrix.com>
 <14cd7c7a-85ac-6a6a-36ce-4df5a80c6a1f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b98217e0-c65b-f335-c47e-15341aaec4c8@citrix.com>
Date: Tue, 18 Feb 2020 11:44:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <14cd7c7a-85ac-6a6a-36ce-4df5a80c6a1f@suse.com>
Content-Language: en-US
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 5/6] x86/smp: use a dedicated scratch
 cpumask in send_IPI_mask
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Sander Eikelenboom <linux@eikelenboom.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTgvMDIvMjAyMCAxMToyOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTguMDIuMjAyMCAx
MjoyMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTgvMDIvMjAyMCAxMToxMCwgUm9nZXIg
UGF1IE1vbm7DqSB3cm90ZToKPj4+IE9uIFR1ZSwgRmViIDE4LCAyMDIwIGF0IDEwOjUzOjQ1QU0g
KzAwMDAsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4gT24gMTcvMDIvMjAyMCAxODo0MywgUm9n
ZXIgUGF1IE1vbm5lIHdyb3RlOgo+Pj4+PiBAQCAtNjcsNyArNjgsMjAgQEAgc3RhdGljIHZvaWQg
c2VuZF9JUElfc2hvcnRjdXQodW5zaWduZWQgaW50IHNob3J0Y3V0LCBpbnQgdmVjdG9yLAo+Pj4+
PiAgdm9pZCBzZW5kX0lQSV9tYXNrKGNvbnN0IGNwdW1hc2tfdCAqbWFzaywgaW50IHZlY3RvcikK
Pj4+Pj4gIHsKPj4+Pj4gICAgICBib29sIGNwdXNfbG9ja2VkID0gZmFsc2U7Cj4+Pj4+IC0gICAg
Y3B1bWFza190ICpzY3JhdGNoID0gdGhpc19jcHUoc2NyYXRjaF9jcHVtYXNrKTsKPj4+Pj4gKyAg
ICBjcHVtYXNrX3QgKnNjcmF0Y2ggPSB0aGlzX2NwdShzZW5kX2lwaV9jcHVtYXNrKTsKPj4+Pj4g
KyAgICB1bnNpZ25lZCBsb25nIGZsYWdzOwo+Pj4+PiArCj4+Pj4+ICsgICAgaWYgKCBpbl9tYygp
IHx8IGluX25taSgpICkKPj4+Pj4gKyAgICB7Cj4+Pj4+ICsgICAgICAgIC8qCj4+Pj4+ICsgICAg
ICAgICAqIFdoZW4gaW4gI01DIG9yICNNTkkgY29udGV4dCBYZW4gY2Fubm90IHVzZSB0aGUgcGVy
LUNQVSBzY3JhdGNoIG1hc2sKPj4+Pj4gKyAgICAgICAgICogYmVjYXVzZSB3ZSBoYXZlIG5vIHdh
eSB0byBhdm9pZCByZWVudHJ5LCBzbyBkbyBub3QgdXNlIHRoZSBBUElDCj4+Pj4+ICsgICAgICAg
ICAqIHNob3J0aGFuZC4KPj4+Pj4gKyAgICAgICAgICovCj4+Pj4+ICsgICAgICAgIGFsdGVybmF0
aXZlX3ZjYWxsKGdlbmFwaWMuc2VuZF9JUElfbWFzaywgbWFzaywgdmVjdG9yKTsKPj4+Pj4gKyAg
ICAgICAgcmV0dXJuOwo+Pj4+IFRoZSBzZXQgb2YgdGhpbmdzIHlvdSBjYW4gc2FmZWx5IGRvIGlu
IGFuIE5NSS9NQ0UgaGFuZGxlciBpcyBzbWFsbCwgYW5kCj4+Pj4gZG9lcyBub3QgaW5jbHVkZSBz
ZW5kaW5nIElQSXMuwqAgKEluIHJlYWxpdHksIGlmIHlvdSdyZSB1c2luZyB4MmFwaWMsIGl0Cj4+
Pj4gaXMgc2FmZSB0byBzZW5kIGFuIElQSSBiZWNhdXNlIHRoZXJlIGlzIG5vIHJpc2sgb2YgY2xv
YmJlcmluZyBJQ1IyCj4+Pj4gYmVoaW5kIHlvdXIgb3V0ZXIgY29udGV4dCdzIGJhY2spLgo+Pj4+
Cj4+Pj4gSG93ZXZlciwgaWYgd2UgZXNjYWxhdGUgZnJvbSBOTUkvTUNFIGNvbnRleHQgaW50byBj
cmFzaCBjb250ZXh0LCB0aGVuCj4+Pj4gYW55dGhpbmcgZ29lcy7CoCBJbiByZWFsaXR5LCB3ZSBv
bmx5IGV2ZXIgc2VuZCBOTUlzIGZyb20gdGhlIGNyYXNoIHBhdGgsCj4+Pj4gYW5kIHRoYXQgaXMg
bm90IHBlcm1pdHRlZCB0byB1c2UgYSBzaG9ydGhhbmQsIG1ha2luZyB0aGlzIGNvZGUgZGVhZC4K
Pj4+IFRoaXMgd2FzIHJlcXVlc3RlZCBieSBKYW4sIGFzIHNhZmV0eSBtZWFzdXJlCj4+IFRoYXQg
bWF5IGJlLCBidXQgaXQgZG9lc24ndCBtZWFuIGl0IGlzIGNvcnJlY3QuwqAgSWYgZXhlY3V0aW9u
IGV2ZXIKPj4gZW50ZXJzIHRoaXMgZnVuY3Rpb24gaW4gTk1JL01DRSBjb250ZXh0LCB0aGVyZSBp
cyBhIHJlYWwsCj4+IHN0YXRlLWNvcnJ1cHRpbmcgYnVnLCBoaWdoZXIgdXAgdGhlIGNhbGwgc3Rh
Y2suCj4gQmVzaWRlcyB0aGUgaXNzdWUgb2YgYW55IGxvY2tzIG5lZWRpbmcgdGFraW5nIG9uIHN1
Y2ggcGF0aHMgKHdoaWNoCj4gbXVzdCBub3QgaGFwcGVuIGluIE5NSS8jTUMgY29udGV4dCksIHRo
ZSBvbmx5IHRoaW5nIGdldHRpbmcgaW4gdGhlCj4gd2F5IG9mIElQSSBzZW5kaW5nIGlzIC0gYWZh
aWNzIC0gSUNSMiwgd2hpY2ggY291bGQgYmUgc2F2ZWQgLwo+IHJlc3RvcmVkIGFyb3VuZCBzdWNo
IG9wZXJhdGlvbnMuCgpJdHMgdGhlIGltcG9ydGFudCB4QVBJQyByZWdpc3RlciBmb3Igc3VyZSwg
YnV0IHlvdSd2ZSBhbHNvIGdvdCB0bwphY2NvdW50IGZvciBjb21wb3VuZCBlZmZlY3RzIHN1Y2gg
YXMgY2F1c2luZyBhbiBMQVBJQyBlcnJvci4KCkl0IGlzIGZhciBlYXNpZXIgdG8gc2F5ICJ0aG91
IHNoYWx0IG5vdCBJUEkgZnJvbSBOTUkvTUNFIGNvbnRleHQiLApiZWNhdXNlIHdlIGRvbid0IGhh
dmUgY29kZSBuZWVkaW5nIHRvIGRvIHRoaXMgaW4gdGhlIGZpcnN0IHBsYWNlLgoKPiBUaGF0IHNh
aWQsIEJVRygpaW5nIG9yIHBhbmljKClpbmcKPiBpZiB3ZSBnZXQgaW4gaGVyZSBmcm9tIHN1Y2gg
YSBjb250ZXh0IHdvdWxkIGFsc28gYmUgc3VmZmljaWVudCB0bwo+IHNhdGlzZnkgdGhlICJzYWZl
dHkgbWVhc3VyZSIgYXNwZWN0LgoKTm8gLSBzYWZldHkgY2hlY2tzIGluIHRoZSBjcmFzaCBwYXRo
IG1ha2UgaXQgd29yc2UsIGJlY2F1c2UgaWYgdGhleQp0cmlnZ2VyLCB0aGV5IHJlbGlhYmx5IHRy
aWdnZXIgcmVjdXJzaXZlbHkgYW5kIG5ldmVyIGVudGVyIHRoZSBjcmFzaCBrZXJuZWwuCgpPbmNl
IHdlIGFyZSBpbiBjcmFzaCBjb250ZXh0LCB0aGUgbW9zdCBpbXBvcnRhbnQgdGFzayBpcyB0byBz
dWNjZXNzZnVsbHkKdHJhbnNpdGlvbiB0byB0aGUgY3Jhc2gga2VybmVsLsKgIFN1cmUgLSB0aGVy
ZSBpcyBubyBndWFyYW50ZWUgdGhhdCB3ZQp3aWxsIG1hbmFnZSBpdCwgYnV0IGhpdHRpbmcgcG9v
cmx5LXRob3VnaHQtdGhyb3VnaCBzYWZldHkgY2hlY2tzIHJlYWxseQpoYXMgd2FzdGVkIG1vbnRo
cyBvZiBjdXN0b21lciAoYW5kIG15KSB0aW1lIGR1cmluZyBpbnZlc3RpZ2F0aW9ucy4KCn5BbmRy
ZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
