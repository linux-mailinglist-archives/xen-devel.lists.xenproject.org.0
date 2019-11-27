Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C95D610AC51
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 09:57:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZt6o-0004lA-RB; Wed, 27 Nov 2019 08:55:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eB6N=ZT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iZt6n-0004l5-3D
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 08:55:37 +0000
X-Inumbo-ID: ad38dc20-10f3-11ea-83b8-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ad38dc20-10f3-11ea-83b8-bc764e2007e4;
 Wed, 27 Nov 2019 08:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574844936;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=q+jLwsBxRhVf5o8xiPUwJjieodPtmWqNqHf4gDSW3kE=;
 b=UWxfhs9IbQpRciqGKwqE3puwmo6QikBZg2Xk1Y2EkKmP49Up6wTG4DJg
 c/5EV+EudfqVZ/lsQVM3aDRct6yCeqaQTPrbARBSRqCiBgcxSh3580KWC
 usw/p8ZT+mdF3CzEkoS1TUyCbL5uKfWGOOhSW4G3O5vonz8bbM6drFK3w 0=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 7ZlygSnWK4a8jc2zCvPNtFrx22KiUn9NWqx93iyIVvpaBGNhcLSaG7vZUUxKO+mml+lszqn7b0
 QJSWWHgXRfwWjMxObSFw+w2wnykxgBRBeLWwonI21DgqmeUUFCjY5Gm8MQRnitLhZHaBPfifEq
 jR/hom/k3Vx27l15AoXMyfyaZP7cyt/YOCj+BGxnOCFDSX/iqn7FFfRzli2egZujKWGsZ4Ldga
 GfbsnzhU4vhRoX3qB/qipqvtBTpmPswYtpOzgJETGYKgc2LQtLPyipWdACNIQ82fCvGvVKVhRY
 /Ts=
X-SBRS: 2.7
X-MesageID: 9441457
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,248,1571716800"; 
   d="scan'208";a="9441457"
Date: Wed, 27 Nov 2019 09:55:26 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191127085526.GJ980@Air-de-Roger>
References: <20191126120357.13398-1-andrew.cooper3@citrix.com>
 <20191126120357.13398-3-andrew.cooper3@citrix.com>
 <20191126153436.GF980@Air-de-Roger>
 <12ed4e11-357d-6fb4-ce5a-ec022b23c7c1@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <12ed4e11-357d-6fb4-ce5a-ec022b23c7c1@citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
 Juergen Gross <jgross@suse.com>,
 "hange-folder>?" <toggle-mailboxes@Air-de-Roger>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>, y@Air-de-Roger,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBOb3YgMjYsIDIwMTkgYXQgMDQ6MDk6MDhQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyNi8xMS8yMDE5IDE1OjM0LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4g
T24gVHVlLCBOb3YgMjYsIDIwMTkgYXQgMTI6MDM6NTZQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiA+PiBJQ0VCUCBpc24ndCBoYW5kbGVkIHdlbGwgYnkgU1ZNLgo+ID4+Cj4gPj4gVGhl
IFZNZXhpdCBzdGF0ZSBmb3IgYSAjREItdmVjdG9yZWQgVEFTS19TV0lUQ0ggaGFzICVyaXAgcG9p
bnRpbmcgdG8gdGhlCj4gPj4gYXBwcm9wcmlhdGUgaW5zdHJ1Y3Rpb24gYm91bmRhcnkgKGZhdWx0
IG9yIHRyYXAsIGFzIGFwcHJvcHJpYXRlKSwgZXhjZXB0IGZvcgo+ID4+IGFuIElDRUJQLWluZHVj
ZWQgI0RCIFRBU0tfU1dJVENILCB3aGVyZSAlcmlwIHBvaW50cyBhdCB0aGUgSUNFQlAgaW5zdHJ1
Y3Rpb24KPiA+PiByYXRoZXIgdGhhbiBhZnRlciBpdC4gIEFzIElDRUJQIGlzbid0IGRpc3Rpbmd1
aXNoZWQgaW4gdGhlIHZlY3RvcmluZyBldmVudAo+ID4+IHR5cGUsIHRoZSBzdGF0ZSBpcyBhbWJp
Z3VvdXMuCj4gPj4KPiA+PiBUbyBhZGQgdG8gdGhlIGNvbmZ1c2lvbiwgYW4gSUNFQlAgd2hpY2gg
b2NjdXJzIGR1ZSB0byBJbnRyb3NwZWN0aW9uCj4gPj4gaW50ZXJjZXB0aW5nIHRoZSBpbnN0cnVj
dGlvbiwgb3IgZnJvbSB4ODZfZW11bGF0ZSgpIHdpbGwgaGF2ZSAlcmlwIHVwZGF0ZWQgYXMKPiA+
PiBhIGNvbnNlcXVlbmNlIG9mIHBhcnRpYWwgZW11bGF0aW9uIHJlcXVpcmVkIHRvIGluamVjdCBh
biBJQ0VCUCBldmVudCBpbiB0aGUKPiA+PiBmaXJzdCBwbGFjZS4KPiA+Pgo+ID4+IFdlIGNvdWxk
IGluIHByaW5jaXBsZSBzcG90IHRoZSBub24taW5qZWN0ZWQgY2FzZSBpbiB0aGUgVEFTS19TV0lU
Q0ggaGFuZGxlciwKPiA+PiBidXQgdGhpcyBzdGlsbCByZXN1bHRzIGluIGNvbXBsZXhpdHkgaWYg
dGhlIElDRUJQIGluc3RydWN0aW9uIGFsc28gaGFzIGFuCj4gPj4gSW5zdHJ1Y3Rpb24gQnJlYWtw
b2ludCBhY3RpdmUgb24gaXQgKHdoaWNoIGdlbnVpbmVseSBoYXMgZmF1bHQgc2VtYW50aWNzKS4K
PiA+Pgo+ID4+IFVuY29uZGl0aW9uYWxseSBpbnRlcmNlcHQgSUNFQlAuICBUaGlzIGRvZXMgaGF2
ZSBhIHRyYXAgc2VtYW50aWNzIGZvciB0aGUKPiA+PiBpbnRlcmNlcHQsIGFuZCBhbGxvd3MgdXMg
dG8gbW92ZSAlcmlwIGZvcndhcmRzIGFwcHJvcHJpYXRlbHkgYmVmb3JlIHRoZQo+ID4+IFRBU0tf
U1dJVENIIGludGVyY2VwdCBpcyBoaXQuICBUaGlzIG1ha2VzIHRoZSBiZWhhdmlvdXIgb2YgI0RC
LXZlY3RvcmVkCj4gPj4gc3dpdGNoZXMgY29uc2lzdGVudCBob3dldmVyIHRoZSBJQ0VCUCAjREIg
Y2FtZSBhYm91dCwgYW5kIGF2b2lkcyBzcGVjaWFsIGNhc2VzCj4gPj4gaW4gdGhlIFRBU0tfU1dJ
VENIIGludGVyY2VwdC4KPiA+Pgo+ID4+IFRoaXMgaW4gdHVybiBhbGxvd3MgZm9yIHRoZSByZW1v
dmFsIG9mIHRoZSBjb25kaXRpb25hbAo+ID4+IGh2bV9zZXRfaWNlYnBfaW50ZXJjZXB0aW9uKCkg
bG9naWMgdXNlZCBieSB0aGUgbW9uaXRvciBzdWJzeXN0ZW0sIGFzIElDRUJQJ3MKPiA+PiB3aWxs
IG5vdyBhbHdheXMgYmUgc3VibWl0dGVkIGZvciBtb25pdG9yaW5nIGNoZWNrcy4KPiA+Pgo+ID4+
IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
Cj4gPiBSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+
Cj4gPgo+ID4gQUZBSUNUIHRoaXMgYnJpbmdzIEFNRCBpbXBsZW1lbnRhdGlvbiBpbmxpbmUgd2l0
aCBJbnRlbCB0aGF0IGFsc28gd2lsbAo+ID4gdW5jb25kaXRpb25hbGx5IHZtZXhpdCBvbiBpY2Vi
cD8KPiAKPiBWVC14IGFuZCBTVk0gaGFuZGxlIHRoaW5ncyBxdWl0ZSBkaWZmZXJlbnRseS4KPiAK
PiBWVC14IGhhcyBubyBpbnN0cnVjdGlvbiBpbnRlcmNlcHQgZm9yIElDRUJQLCBidXQgdGhlICNE
QiBpbnRlcmNlcHQgd2lsbAo+IHRyaWdnZXJlZCBieSBhbiBJQ0VCUCBpbnN0cnVjdGlvbi7CoCBJ
Q0VCUCBoYXMgaXRzIG93biBldmVudCB0eXBlCj4gKFByaXZpbGVnZWQgU29mdHdhcmUgRXhjZXB0
aW9uLCB3aGljaCBpcyBhbiBhbXVzaW5nIG5hbWUgY29uc2lkZXJpbmcgaXQKPiBpcyBhbiB1bnBy
aXZsZWdlZCBpbnN0cnVjdGlvbiwgYnlwYXNzZXMgcHJpdmlsZWdlIGNoZWNrcywgYW5kIHNldHMg
dGhlCj4gRXh0ZXJuYWwgYml0IGluIGFuIGVycm9yIGNvZGUpLgo+IAo+IFNWTSBkb2VzIGhhdmUg
YW4gaW5zdHJ1Y3Rpb24gaW50ZXJjZXB0IGZvciBJQ0VCUCwgYnV0IHRoZSAjREIgZnJvbQo+IElD
RUJQJ3MgZG9uJ3QgdHJpZ2dlciB0aGUgbm9ybWFsICNEQiBpbnRlcmNlcHQuwqAgSG93ZXZlciwg
c2Vjb25kYXJ5Cj4gI0RCJ3MgZ2VuZXJhdGVkIGJ5IElDRUJQJ3MgdW5pbnRlcmNlcHRlZCAjREIg
ZG8gdHJpZ2dlciB0aGUgI0RCIGludGVyY2VwdC4KPiAKPiBGb3Igc2FmZXR5IHJlYXNvbnMgd2Ug
bXVzdCBpbnRlcmNlcHQgI0RCIHRvIHByZXZlbnQgQ1BVIGRlYWRsb2Nrcy7CoCBUaGlzCj4gbWVh
bnMgdGhhdCBJQ0VCUCBhcmUgaW4gcHJhY3RpY2UgYWx3YXlzIGludGVyY2VwdGVkIG9uIEludGVs
IGR1ZSB0bwo+IHRoZWlyICNEQiBzaWRlIGVmZmVjdCwgYnV0IHRoZXkgd2VyZW4ndCBpbnRlcmNl
cHRlZCBvbiBBTUQsIHdoaWNoIGlzIHdoeQo+IHRoZSBtb25pdG9yIHN1YnN5c3RlbSBoYWQgYSB3
YXkgb2YgdHVybmluZyBpbnRlcmNlcHRpb24gb24uCj4gCj4gU28geWVzLCB0aGUgb3ZlcmFsbCBl
ZmZlY3QgaXMgdGhhdCBJQ0VCUHMgd2lsbCBub3cgdW5jb25kaXRpb25hbGx5Cj4gdm1leGl0IG9u
IGJvdGggSW50ZWwgYW5kIEFNRCwgYnV0IHVuZGVybHlpbmcgbWVjaGFuaXNtIGZvciB3aHkgdGhl
eQo+IHZtZXhpdCBpcyBzdGlsbCB2ZW5kb3Itc3BlY2lmaWMuCgpUaGFua3MgZm9yIHRoZSBkZXRh
aWxlZCBleHBsYW5hdGlvbiwgSSByZWFsaXplZCB2bXggZGlkbid0IGhhdmUgYQpJQ0VCUCBzcGVj
aWZpYyBWTUVYSVQgcmVhc29uLCBidXQgSSBhc3N1bWVkIHRoZSAjREIgd291bGQgYmUgdHJhcHBl
ZAphcyB0aGF0J3MgaG93IHRoZSBtb25pdG9yIHN5c3RlbSBpbnRlcmNlcHRzIHRob3NlLgoKUm9n
ZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
