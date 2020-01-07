Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 975F7131CC3
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 01:29:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iochE-0001F7-JU; Tue, 07 Jan 2020 00:26:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cF2B=24=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iochC-0001F2-Eb
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 00:26:06 +0000
X-Inumbo-ID: 4a571570-30e4-11ea-ab91-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a571570-30e4-11ea-ab91-12813bfff9fa;
 Tue, 07 Jan 2020 00:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578356765;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=lqStgTEmMrPGsznMw1BrAElsxwWVvu2LfjONeBcgjcw=;
 b=F/u4z4kPMJEbnGSq+SEakeUQkhyHqKqxuQ4vDeEiWs56zWH2TPqAj3sl
 rC0WP2mL4EQqGG0FbsIWWdmCozNkHzDF+uoSGNOFhyI5ifyU+xF+pG5z4
 PqQn/KfLSbScQ+otTzJDjyNVSxU5e9wAQyBSuSIFst9NDJK1nQUSBVH+e E=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: SD/d8sWC0V9G+wKb5IBdl9r9KnyHrcfx+1OrGPYUJqMrI0HadNWzIjCg2BKuefAsyQ2I5SvDck
 fJto57gzzeYm110EU8LzkgqwdxbYpTnZvHaJbU6oZ4VfiCJP+TWd01MOwdP/9kqzna9RzqcPPF
 4ybQ8CB+OyEnFVDKFSpPuDQBgo7kY6Z9Cp7g0iUvHHlEvF48vtj8W0kC6oIS8gUgf7jy+M26TP
 dMY7Bhd/GRyzXa1HiLKI9AQORiCnn1pSrhLKWGhaBhLnTBL0H76ALP7Q9qvHstdc+ib1RSeIkB
 1Gg=
X-SBRS: 2.7
X-MesageID: 11116270
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,404,1571716800"; d="scan'208";a="11116270"
To: Lars Kurth <lars.kurth@citrix.com>, xen-devel
 <xen-devel@lists.xenproject.org>
References: <4545D260-7F67-42DC-A33E-2F466011ED20@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <89173194-efd5-61fb-d3f5-dd1011579c91@citrix.com>
Date: Tue, 7 Jan 2020 00:25:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <4545D260-7F67-42DC-A33E-2F466011ED20@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] Community Call: Call for Agenda Items and call
 details for Jan 9, 16:00 - 17:00 UTC
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
Cc: Amit Shah <amit@infradead.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Doug Goldstein <cardoe@cardoe.com>, Brian
 Woods <brian.woods@xilinx.com>, Rich Persaud <persaur@gmail.com>,
 "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>,
 Matt Spencer <Matt.Spencer@arm.com>,
 Kevin Pearson <kevin.pearson@ortmanconsulting.com>,
 "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>, "Natarajan,
 Janakarajan" <jnataraj@amd.com>,
 "robin.randhawa@arm.com" <robin.randhawa@arm.com>,
 "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>,
 "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>,
 Robert Townley <rob.townley@gmail.com>, Rian Quinn <rianquinn@gmail.com>,
 Varad Gautam <varadgautam@gmail.com>, Juergen
 Gross <jgross@suse.com>, Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>,
 "lambert.olivier@gmail.com" <lambert.olivier@gmail.com>,
 "intel-xen@intel.com" <intel-xen@intel.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Sergey Dyasli <sergey.dyasli@citrix.com>, Paul
 Durrant <pdurrant@amazon.com>, Julien Grall <julien.grall@arm.com>, Jeff
 Kubascik <Jeff.Kubascik@dornerworks.com>, "Ji, John" <john.ji@intel.com>,
 Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYvMDEvMjAyMCAxOTo1NiwgTGFycyBLdXJ0aCB3cm90ZToKPiBEZWFywqBjb21tdW5pdHnC
oG1lbWJlcnMsCj4gwqAKPiBJIGhvcGUgeW91IGFsbCBoYWQgYSByZXN0ZnVsIGhvbGlkYXkgcGVy
aW9kIGFuZCBhIEhhcHB5IE5ldyBZZWFyISAKPgo+IFBsZWFzZSBzZW5kIG1lwqBhZ2VuZGHCoGl0
ZW1zwqBmb3LCoHRoaXMgVGh1cnNkYXknc8KgY29tbXVuaXR5wqBjYWxswqAod2UgYWdyZWVkIHRv
IG1vdmUgaXQgYnkgMSB3ZWVrKSBwcmVmZXJhYmx5IGJ5IFdlZG5lc2RheSEKPgo+IEEgZHJhZnTC
oGFnZW5kYcKgaXMgYXTCoGh0dHBzOi8vY3J5cHRwYWQuZnIvcGFkLyMvMi9wYWQvZWRpdC9FUlp0
TVlENWo2azBzdi1ORzZIdGwtQUovCj4gUGxlYXNlIGFkZMKgYWdlbmRhwqBpdGVtc8KgdG8gdGhl
IGRvY3VtZW50IG9yIHJlcGx5IHRvIHRoaXMgZS1tYWlsCgpJIHRoaW5rIGl0IHdvdWxkIGJlIHZl
cnkgaGVscGZ1bCBmb3IgdGhlIGNvbW11bml0eSBpbiBnZW5lcmFsIHRvIGtub3cKYW55IHNwZWNp
ZmljIHBsYW5zIGVhY2ggb2YgdXMgaGF2ZSBmb3IgdGhlIDQuMTQgdGltZWZyYW1lLgoKSSBwZXJz
b25hbGx5IGFtIGF3YXJlIG9mIGEgZmFpciBxdWFudGl0eSBvZiB3b3JrIGZyb20gdmFyaW91cyBw
ZW9wbGUsCmJ1dCBpdCBpcyBjbGVhciB0aGF0IHRoZSBjb21tdW5pdHkgYXMgYSB3aG9sZSBkb2Vz
bid0IHJlYWxseSBoYXZlIGFuCmlkZWEgb2Ygd2hvIGlzIHdvcmtpbmcgb24gd2hhdC4KCk15IGNv
bnRyaWJ1dGlvbiB0byB0aGUgZGlzY3Vzc2lvbiBzdGFydHMgd2l0aApodHRwczovL2xvcmUua2Vy
bmVsLm9yZy94ZW4tZGV2ZWwvOTQxY2YyM2MtMTNlZC0xNGExLWZkMjUtNDViMDAxZDk1NjRhQGNp
dHJpeC5jb20vVC8jdcKgCmJ1dCBJIHRoaW5rIGl0IHdvdWxkIGJlIGhlbHBmdWwgaWYgb3RoZXJz
IGdhdmUgYXQgbGVhc3QgYSBicmllZiBvdmVydmlldwpvZiBhbnkgcGxhbnMgYW5kIHdoZXRoZXIg
dGhleSBhcmUgaW50ZW5kaW5nIHRoZSB3b3JrIHRvIGhpdCB0aGUgbmV4dApyZWxlYXNlLCBvciB3
aGV0aGVyIGl0IGlzIG1vcmUgbGlrZWx5IHRvIGJlIGEgZnV0dXJlIHJlbGVhc2UuCgp+QW5kcmV3
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
