Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2DA10C82A
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 12:47:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaIDZ-0007NQ-S9; Thu, 28 Nov 2019 11:44:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zRhs=ZU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iaIDY-0007NL-3j
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 11:44:16 +0000
X-Inumbo-ID: 66ff0dbb-11d4-11ea-a3d2-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 66ff0dbb-11d4-11ea-a3d2-12813bfff9fa;
 Thu, 28 Nov 2019 11:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574941456;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FhRqTxb1XmmOc+2CXdtAmfT7K3t3AmK5xGuxDE3AipU=;
 b=WE3t1KYXSXfm3y/yhey9XWIRRokcI+YJ1ijs/8RHY7veymOuMjbpQ6/w
 BQTEJyoSNBwNWWqwSaqAM6Z3NprkupThdNi5TxSkaFHmn/05Yq2BdqErb
 g+holNldpIdvoBTfHOXL40f/6CspjRyGyKX9MJGQLTbuXlVVzMZ8Qud6W k=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: IQldZEalgVHOwL0mdVu19rgnXwrZDQoRSMwPClltXUHOE7XxjmsyHXBC6dXTYCNeA5TmvXIaRb
 NZzfun9bnN6hXKLnonCdVCwWtCQ1FmguubXxx2hgk1ZRl8LF876lnqrz5tsfbHf5BgXXFDAbvr
 FTimVDNhtCLyyYMPkkVn5Xk8vg6Cr4qopI4Xm/ye4LgZt7msc6kH8lN0OL68DaTLtsbifQVmVA
 3Qz89Csh2NAulv7wO9TBDQJjJmMuFMfxxALsPQT6yJPdcSj5bB+DKp5lFNg5XEk44CyLhH+sAU
 pc8=
X-SBRS: 2.7
X-MesageID: 8944031
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,253,1571716800"; 
   d="scan'208";a="8944031"
Date: Thu, 28 Nov 2019 12:39:04 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191128113904.GU980@Air-de-Roger>
References: <7f82e319-1891-ec36-dcf0-e94253ba04a5@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7f82e319-1891-ec36-dcf0-e94253ba04a5@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86/IRQ: make internally used IRQs also
 honor the pending EOI stack
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBOb3YgMjgsIDIwMTkgYXQgMTI6MDM6NDdQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gQXQgdGhlIHRpbWUgdGhlIHBlbmRpbmcgRU9JIHN0YWNrIHdhcyBpbnRyb2R1Y2VkIHRo
ZXJlIHdlcmUgbm8KPiBpbnRlcm5hbGx5IHVzZWQgSVJRcyB3aGljaCB3b3VsZCBoYXZlIHRoZSBM
QVBJQyBFT0kgaXNzdWVkIGZyb20gdGhlCj4gLT5lbmQoKSBob29rLiBUaGlzIGhhZCB0aGVuIGNo
YW5nZWQgd2l0aCB0aGUgaW50cm9kdWN0aW9uIG9mIElPTU1VcywKPiBidXQgdGhlIGludGVyYWN0
aW9uIGlzc3VlIHdhcyBwcmVzdW1hYmx5IG1hc2tlZCBieQo+IGlycV9ndWVzdF9lb2lfdGltZXJf
Zm4oKSBmcmVxdWVudGx5IEVPSS1pbmcgaW50ZXJydXB0cyB3YXkgdG9vIGVhcmx5Cj4gKHdoaWNo
IGdvdCBmaXhlZCBieSAzNTljZjZmOGEwZWMgWyJ4ODYvSVJROiBkb24ndCBrZWVwIEVPSSB0aW1l
cgo+IHJ1bm5pbmcgd2l0aG91dCBuZWVkIl0pLgo+IAo+IFRoZSBwcm9ibGVtIGlzIHRoYXQgd2l0
aCB1cyByZS1lbmFibGluZyBpbnRlcnJ1cHRzIGFjcm9zcyBoYW5kbGVyCj4gaW52b2NhdGlvbiwg
YSBoaWdoZXIgcHJpb3JpdHkgKGd1ZXN0KSBpbnRlcnJ1cHQgbWF5IHRyaWdnZXIgd2hpbGUKPiBo
YW5kbGluZyBhIGxvd2VyIHByaW9yaXR5IChpbnRlcm5hbCkgb25lLiBUaGUgRU9JIGlzc3VlZCBm
cm9tCj4gLT5lbmQoKSAoZm9yIEFDS1RZUEVfRU9JIGtpbmQgaW50ZXJydXB0cykgd291bGQgdGhl
biBtaXN0YWtlbmx5Cj4gRU9JIHRoZSBoaWdoZXIgcHJpb3JpdHkgKGd1ZXN0KSBpbnRlcnJ1cHQs
IGJyZWFraW5nIChhbW9uZyBvdGhlcgo+IHRoaW5ncykgcGVuZGluZyBFT0kgc3RhY2sgbG9naWMn
cyBhc3N1bXB0aW9ucy4KCk1heWJlIHRoZXJlJ3Mgc29tZXRoaW5nIHRoYXQgSSdtIG1pc3Npbmcs
IGJ1dCBzaG91bGRuJ3QgaHlwZXJ2aXNvcgp2ZWN0b3JzIGFsd2F5cyBiZSBoaWdoZXIgcHJpb3Jp
dHkgdGhhbiBndWVzdCBvbmVzPwoKSSBzZWUgdGhlcmUncyBhbHJlYWR5IGEgcmFuZ2UgcmVzZXJ2
ZWQgZm9yIGhpZ2ggcHJpb3JpdHkgdmVjdG9ycwooe0ZJUlNUL0xBU1R9X0hJUFJJT1JJVFlfVkVD
VE9SKSwgd2hhdCdzIHRoZSByZWFzb24gZm9yIGh5cGVydmlzb3IKaW50ZXJydXB0cyBub3QgdXNp
bmcgdGhpcyByYW5nZT8KCklNTyBpdCBzZWVtcyB0cm91Ymxlc29tZSB0aGF0IHBlbmRpbmcgZ3Vl
c3RzIHZlY3RvcnMgY2FuIGRlbGF5IHRoZQppbmplY3Rpb24gb2YgaHlwZXJ2aXNvciBpbnRlcnJ1
cHQgdmVjdG9ycy4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
