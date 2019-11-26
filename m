Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BB710A1BA
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 17:11:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZdOv-0003Rx-LH; Tue, 26 Nov 2019 16:09:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/P3v=ZS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iZdOt-0003Rs-R7
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 16:09:15 +0000
X-Inumbo-ID: 16fd71c6-1067-11ea-a3a3-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 16fd71c6-1067-11ea-a3a3-12813bfff9fa;
 Tue, 26 Nov 2019 16:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574784554;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ulCLMOgeCtqZS556jYgGgqhUmgDD7i7Xc3jOFL8aeqI=;
 b=PDaQ5s7V0kVok+hb+xqCpSHtcPF9fbfvE7OP2uHftpesVpTRF6vGL008
 a7QsKJSuKk8EwVdIJ60qIpBROTxOLKmzJG47E1fDhryyGF5kRkRv6BEbj
 Gqo/4PtRiEfvc3o2ttNZMAdNWb7IT4ILiv5f7ifoZnwVSYFxNkrObcKny o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: CZMg/O297P2zlzH2HVOHsnfp4wsMOUABfxkl131vAQLOBfJNeLyqlhxGGisaDFhRRAy3uY/HDl
 qNr9MO33Wo8VsQf7z+S3avgMDalRNBc41QR77y1HhR4tnjT2uBKHpygV+/wxfsFDTIuinhJMjW
 nKXgpMBwIGwpHMIslfA0swQiePLoyJSGMOUCLFjkRG/7EOG8hrGS1oJzE3ga59XiknCdGTAfEM
 Li5+lEj2OtP1PkPx7OdkhBaShro6hYBEyr8Qw+BX5nSpzGFu4+eIo4pPvCC1Mlkbu5gxrEFtFN
 clM=
X-SBRS: 2.7
X-MesageID: 9269503
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,246,1571716800"; 
   d="scan'208";a="9269503"
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191126120357.13398-1-andrew.cooper3@citrix.com>
 <20191126120357.13398-3-andrew.cooper3@citrix.com>
 <20191126153436.GF980@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <12ed4e11-357d-6fb4-ce5a-ec022b23c7c1@citrix.com>
Date: Tue, 26 Nov 2019 16:09:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191126153436.GF980@Air-de-Roger>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 2/3] x86/svm: Always intercept ICEBP
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Juergen Gross <jgross@suse.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>, Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYvMTEvMjAxOSAxNTozNCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUdWUsIE5v
diAyNiwgMjAxOSBhdCAxMjowMzo1NlBNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBJ
Q0VCUCBpc24ndCBoYW5kbGVkIHdlbGwgYnkgU1ZNLgo+Pgo+PiBUaGUgVk1leGl0IHN0YXRlIGZv
ciBhICNEQi12ZWN0b3JlZCBUQVNLX1NXSVRDSCBoYXMgJXJpcCBwb2ludGluZyB0byB0aGUKPj4g
YXBwcm9wcmlhdGUgaW5zdHJ1Y3Rpb24gYm91bmRhcnkgKGZhdWx0IG9yIHRyYXAsIGFzIGFwcHJv
cHJpYXRlKSwgZXhjZXB0IGZvcgo+PiBhbiBJQ0VCUC1pbmR1Y2VkICNEQiBUQVNLX1NXSVRDSCwg
d2hlcmUgJXJpcCBwb2ludHMgYXQgdGhlIElDRUJQIGluc3RydWN0aW9uCj4+IHJhdGhlciB0aGFu
IGFmdGVyIGl0LiAgQXMgSUNFQlAgaXNuJ3QgZGlzdGluZ3Vpc2hlZCBpbiB0aGUgdmVjdG9yaW5n
IGV2ZW50Cj4+IHR5cGUsIHRoZSBzdGF0ZSBpcyBhbWJpZ3VvdXMuCj4+Cj4+IFRvIGFkZCB0byB0
aGUgY29uZnVzaW9uLCBhbiBJQ0VCUCB3aGljaCBvY2N1cnMgZHVlIHRvIEludHJvc3BlY3Rpb24K
Pj4gaW50ZXJjZXB0aW5nIHRoZSBpbnN0cnVjdGlvbiwgb3IgZnJvbSB4ODZfZW11bGF0ZSgpIHdp
bGwgaGF2ZSAlcmlwIHVwZGF0ZWQgYXMKPj4gYSBjb25zZXF1ZW5jZSBvZiBwYXJ0aWFsIGVtdWxh
dGlvbiByZXF1aXJlZCB0byBpbmplY3QgYW4gSUNFQlAgZXZlbnQgaW4gdGhlCj4+IGZpcnN0IHBs
YWNlLgo+Pgo+PiBXZSBjb3VsZCBpbiBwcmluY2lwbGUgc3BvdCB0aGUgbm9uLWluamVjdGVkIGNh
c2UgaW4gdGhlIFRBU0tfU1dJVENIIGhhbmRsZXIsCj4+IGJ1dCB0aGlzIHN0aWxsIHJlc3VsdHMg
aW4gY29tcGxleGl0eSBpZiB0aGUgSUNFQlAgaW5zdHJ1Y3Rpb24gYWxzbyBoYXMgYW4KPj4gSW5z
dHJ1Y3Rpb24gQnJlYWtwb2ludCBhY3RpdmUgb24gaXQgKHdoaWNoIGdlbnVpbmVseSBoYXMgZmF1
bHQgc2VtYW50aWNzKS4KPj4KPj4gVW5jb25kaXRpb25hbGx5IGludGVyY2VwdCBJQ0VCUC4gIFRo
aXMgZG9lcyBoYXZlIGEgdHJhcCBzZW1hbnRpY3MgZm9yIHRoZQo+PiBpbnRlcmNlcHQsIGFuZCBh
bGxvd3MgdXMgdG8gbW92ZSAlcmlwIGZvcndhcmRzIGFwcHJvcHJpYXRlbHkgYmVmb3JlIHRoZQo+
PiBUQVNLX1NXSVRDSCBpbnRlcmNlcHQgaXMgaGl0LiAgVGhpcyBtYWtlcyB0aGUgYmVoYXZpb3Vy
IG9mICNEQi12ZWN0b3JlZAo+PiBzd2l0Y2hlcyBjb25zaXN0ZW50IGhvd2V2ZXIgdGhlIElDRUJQ
ICNEQiBjYW1lIGFib3V0LCBhbmQgYXZvaWRzIHNwZWNpYWwgY2FzZXMKPj4gaW4gdGhlIFRBU0tf
U1dJVENIIGludGVyY2VwdC4KPj4KPj4gVGhpcyBpbiB0dXJuIGFsbG93cyBmb3IgdGhlIHJlbW92
YWwgb2YgdGhlIGNvbmRpdGlvbmFsCj4+IGh2bV9zZXRfaWNlYnBfaW50ZXJjZXB0aW9uKCkgbG9n
aWMgdXNlZCBieSB0aGUgbW9uaXRvciBzdWJzeXN0ZW0sIGFzIElDRUJQJ3MKPj4gd2lsbCBub3cg
YWx3YXlzIGJlIHN1Ym1pdHRlZCBmb3IgbW9uaXRvcmluZyBjaGVja3MuCj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gUmV2aWV3
ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+Cj4gQUZBSUNU
IHRoaXMgYnJpbmdzIEFNRCBpbXBsZW1lbnRhdGlvbiBpbmxpbmUgd2l0aCBJbnRlbCB0aGF0IGFs
c28gd2lsbAo+IHVuY29uZGl0aW9uYWxseSB2bWV4aXQgb24gaWNlYnA/CgpWVC14IGFuZCBTVk0g
aGFuZGxlIHRoaW5ncyBxdWl0ZSBkaWZmZXJlbnRseS4KClZULXggaGFzIG5vIGluc3RydWN0aW9u
IGludGVyY2VwdCBmb3IgSUNFQlAsIGJ1dCB0aGUgI0RCIGludGVyY2VwdCB3aWxsCnRyaWdnZXJl
ZCBieSBhbiBJQ0VCUCBpbnN0cnVjdGlvbi7CoCBJQ0VCUCBoYXMgaXRzIG93biBldmVudCB0eXBl
CihQcml2aWxlZ2VkIFNvZnR3YXJlIEV4Y2VwdGlvbiwgd2hpY2ggaXMgYW4gYW11c2luZyBuYW1l
IGNvbnNpZGVyaW5nIGl0CmlzIGFuIHVucHJpdmxlZ2VkIGluc3RydWN0aW9uLCBieXBhc3NlcyBw
cml2aWxlZ2UgY2hlY2tzLCBhbmQgc2V0cyB0aGUKRXh0ZXJuYWwgYml0IGluIGFuIGVycm9yIGNv
ZGUpLgoKU1ZNIGRvZXMgaGF2ZSBhbiBpbnN0cnVjdGlvbiBpbnRlcmNlcHQgZm9yIElDRUJQLCBi
dXQgdGhlICNEQiBmcm9tCklDRUJQJ3MgZG9uJ3QgdHJpZ2dlciB0aGUgbm9ybWFsICNEQiBpbnRl
cmNlcHQuwqAgSG93ZXZlciwgc2Vjb25kYXJ5CiNEQidzIGdlbmVyYXRlZCBieSBJQ0VCUCdzIHVu
aW50ZXJjZXB0ZWQgI0RCIGRvIHRyaWdnZXIgdGhlICNEQiBpbnRlcmNlcHQuCgpGb3Igc2FmZXR5
IHJlYXNvbnMgd2UgbXVzdCBpbnRlcmNlcHQgI0RCIHRvIHByZXZlbnQgQ1BVIGRlYWRsb2Nrcy7C
oCBUaGlzCm1lYW5zIHRoYXQgSUNFQlAgYXJlIGluIHByYWN0aWNlIGFsd2F5cyBpbnRlcmNlcHRl
ZCBvbiBJbnRlbCBkdWUgdG8KdGhlaXIgI0RCIHNpZGUgZWZmZWN0LCBidXQgdGhleSB3ZXJlbid0
IGludGVyY2VwdGVkIG9uIEFNRCwgd2hpY2ggaXMgd2h5CnRoZSBtb25pdG9yIHN1YnN5c3RlbSBo
YWQgYSB3YXkgb2YgdHVybmluZyBpbnRlcmNlcHRpb24gb24uCgpTbyB5ZXMsIHRoZSBvdmVyYWxs
IGVmZmVjdCBpcyB0aGF0IElDRUJQcyB3aWxsIG5vdyB1bmNvbmRpdGlvbmFsbHkKdm1leGl0IG9u
IGJvdGggSW50ZWwgYW5kIEFNRCwgYnV0IHVuZGVybHlpbmcgbWVjaGFuaXNtIGZvciB3aHkgdGhl
eQp2bWV4aXQgaXMgc3RpbGwgdmVuZG9yLXNwZWNpZmljLgoKfkFuZHJldwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
