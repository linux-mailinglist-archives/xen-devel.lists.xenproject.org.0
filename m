Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 031AC13D9B0
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 13:11:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is3xl-0003cv-Aw; Thu, 16 Jan 2020 12:09:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nMvQ=3F=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1is3xk-0003cp-Bu
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 12:09:24 +0000
X-Inumbo-ID: 03976b68-3859-11ea-b89f-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 03976b68-3859-11ea-b89f-bc764e2007e4;
 Thu, 16 Jan 2020 12:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579176555;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=UbQsGXPgfEGjBOXrHfw5yECRdiPcWkTAdKjbVYyUncM=;
 b=dE9JzPw8r5eHmzcoIlAW3PxEtga7wFxinduEQanqa05LT8ndAxaSTxCz
 06A+YPc2a6/bRme9duMlXzwLNDhP7iF5oScx98X3GGw46FlrPvQYzpnX8
 4WB+IXn3zhu4hufkV7FYrwduI0TE2Hp/TkUmlMjmAo/9t/z1++885Idis o=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: OSeUB16oFK1GaoDCb1VJbNhZeb1ZUzWppPHmUISCaePWULG3Ex7jzNXvdPzmhQPCQ8rResg2Lz
 GRiJJF9b7dzGEgx7c95c8KDgfryVG9bSjKzb8T09fGIsx+W0FRqwhlIHlixPG5Me1737seNcDy
 7r89+kphpeCYefYdUNDRjOkt2iFg4pNLI28EOURp3G4ItdL+S6IMSuVKa+utN5a9yWTMlD0iyw
 xzt8ivtYvirk0srfsP7TGWyPPHsHstQMZtqTjTDy2tL6i2zHShlu18HUJVRYUrl8vNcZeKdBMX
 lBg=
X-SBRS: 2.7
X-MesageID: 11369610
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,326,1574139600"; d="scan'208";a="11369610"
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <1579030581-7929-1-git-send-email-igor.druzhinin@citrix.com>
 <20200115094703.GH11756@Air-de-Roger>
 <f9b7c06e-54df-bfb2-44d5-b3ef38f2a725@suse.com>
 <20200115115338.GL11756@Air-de-Roger>
 <c13cbf1e-2e1d-dc17-ec90-a1098a11ec58@suse.com>
 <20200115134408.GN11756@Air-de-Roger>
 <e7f91928-6013-75fc-d7ec-0a70654f4b64@suse.com>
 <20200116093354.GP11756@Air-de-Roger>
 <b7a410db-5305-dc52-775b-88f07740bf5a@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <dfd1b200-c09a-f984-7414-cd3c10387f33@citrix.com>
Date: Thu, 16 Jan 2020 12:09:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b7a410db-5305-dc52-775b-88f07740bf5a@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/time: update TSC stamp on restore from
 deep C-state
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
Cc: xen-devel@lists.xenproject.org, wl@xen.org, andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYvMDEvMjAyMCAwOTozOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTYuMDEuMjAyMCAx
MDozMywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4gT24gV2VkLCBKYW4gMTUsIDIwMjAgYXQg
MDU6MjE6MTZQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBPbiAxNS4wMS4yMDIwIDE0
OjQ0LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+Pj4+IE9uIFdlZCwgSmFuIDE1LCAyMDIwIGF0
IDAxOjQ5OjIyUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBXaGF0IEknbSB0aGVu
IHdvcnJpZWQgYWJvdXQgaXMgdG9vCj4+Pj4+IGxpdHRsZSBwcm9ncmVzcyBvYnNlcnZhYmxlIGJ5
IGd1ZXN0cy4gVGhlIFBWIHRpbWUgcHJvdG9jb2wKPj4+Pj4gb3VnaHQgdG8gYmUgZmluZSBpbiB0
aGlzIHJlZ2FyZCAoYW5kIGNvbnN1bWVycyBvZiByYXcgVFNDIHZhbHVlcwo+Pj4+PiBhcmUgb24g
dGhlaXIgb3duIGFueXdheSksIGJ1dCB3b3VsZG4ndCB5b3UgbmVlZCB0byB1cGRhdGUgVFNDCj4+
Pj4+IG9mZnNldHMgb2YgSFZNIGd1ZXN0cyBpbiBvcmRlciB0byBjb21wZW5zYXRlIGZvciB0aGUg
ZWxhcHNlZAo+Pj4+PiB0aW1lPwo+Pj4+Cj4+Pj4gVGhhdCB3aWxsIGJlIGRvbmUgd2hlbiB0aGUg
SFZNIHZDUFUgZ2V0cyBzY2hlZHVsZWQgaW4gYXMgcGFydCBvZiB0aGUKPj4+PiB1cGRhdGVfdmNw
dV9zeXN0ZW1fdGltZSBjYWxsIEFGQUlDVC4gY3N0YXRlX3Jlc3RvcmVfdHNjIHdpbGwgYWx3YXlz
IGJlCj4+Pj4gY2FsbGVkIHdpdGggdGhlIGlkbGUgdkNQVSBjb250ZXh0LCBhbmQgaGVuY2UgdGhl
cmUncyBhbHdheXMgZ29pbmcgdG8KPj4+PiBiZSBhIHZDUFUgc3dpdGNoIGJlZm9yZSBzY2hlZHVs
aW5nIGFueXRoaW5nIGVsc2UuCj4+Pgo+Pj4gV2hpY2ggc3RlcCB3b3VsZCB0aGlzIGJlPyBBbGwg
SSBzZWUgaXMgYSBjYWxsIHRvIGh2bV9zY2FsZV90c2MoKS4KPj4+IEluIHRpbWUuYyBvbmx5IHRz
Y19zZXRfaW5mbygpIGNhbGxzIGh2bV9zZXRfdHNjX29mZnNldCgpLgo+Pgo+PiBNeSBiYWQsIEkn
dmUgbWlzdGFrZW4gdGhlIHNjYWxpbmcgd2l0aCB0aGUgb2Zmc2V0Lgo+Pgo+PiBBY2NvdW50aW5n
IGZvciB0aGUgb2Zmc2V0IGluIHVwZGF0ZV92Y3B1X3N5c3RlbV90aW1lIHNlZW1zIHF1aXRlCj4+
IG1vcmUgY29tcGxpY2F0ZWQgdGhhdCBqdXN0IHVwZGF0aW5nIHRoZSBUU0MgaGVyZSwgc286Cj4+
Cj4+IFJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
PiAKPiBBbmQgdGhlbiAocHJlZmVyYWJseSB3aXRoICJkZWVwIiBkcm9wcGVkIGZyb20gdGhlIGRl
c2NyaXB0aW9uLAo+IGlmIHlvdSwgSWdvciwgYWdyZWUsIGFuZCB3aGljaCBjYW4gYmUgZG9uZSB3
aGlsZSBjb21taXR0aW5nKQo+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+CgpObyBvYmplY3Rpb24uIEZZSSBJIHRlc3RlZCBSb2dlcidzIGFwcHJvYWNoIHRoaXMgbmln
aHQgYW5kIGl0IHNlZW1zCnRvIHdvcmsgYXQgbGVhc3QgaW4gc2Vuc2Ugb2YgZml4aW5nIHRoZSBv
cmlnaW5hbCBpc3N1ZS4KCklnb3IKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
