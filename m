Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8D5D680B
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 19:11:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iK3o1-0008MO-2p; Mon, 14 Oct 2019 17:06:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R0Yg=YH=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iK3nz-0008MJ-UP
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 17:06:47 +0000
X-Inumbo-ID: 01219190-eea5-11e9-9384-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 01219190-eea5-11e9-9384-12813bfff9fa;
 Mon, 14 Oct 2019 17:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571072807;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=s0z80HFQ1PTwEEZO8PE7+hOEgpwmnRkwJwWWhx/yE1Y=;
 b=J26CfmmCjPOELjtTepnwKCh6MBK71zggunmuZ1ce9I/rFNF12UMWBwOS
 3AW7j8qgKdFUMUvGmZFo4BjRLgx1NswtK8VzzAVwr4pLO/j7LloMh31Z9
 47WFn8CH1zkvfg/Ar8sHrs7gkFwXk0e2oY2CYb/3YMVs0SYGz3PJAXnvY g=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: diBNOrijdHfwBwa2sJC/TnYC1fpl98lLy8g31YMXqg5b8UqAcynihxUHsWENOGBg2ZDB2CilXc
 IfLGoyHdlRCa7BjhnjabWbTvG21vHvY0ZzkRV815sTDbrENCm7+ciOGEfVc+hc1ScIYpN4DlZs
 xeq60Z4rF1cB1gJzMpwK1GGg0+1LTUqBVyxYWwDBSkk3461HlLoF4MonnMaLpYUiB4X+fLceJ8
 n4pOMzAoAc/xeaWzCBjp5Xs0nSjcV3P1qtMFW3gbv2wir7Cbr/wwMhtVH7IPNUHyPpFEQ/Fc+L
 zY0=
X-SBRS: 2.7
X-MesageID: 7134088
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,296,1566878400"; 
   d="scan'208";a="7134088"
Date: Mon, 14 Oct 2019 18:06:44 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20191014170644.GC1138@perard.uk.xensource.com>
References: <20191010151111.22125-10-ian.jackson@eu.citrix.com>
 <CAFLBxZapoPdDx+2rokrq0KPE_-mTgYtyE-rk4hFsvjX8g76iZQ@mail.gmail.com>
 <23968.33869.906302.573866@mariner.uk.xensource.com>
 <33aee478-52b9-df46-67d7-f81702e5e0f9@suse.com>
 <23968.44828.940652.851219@mariner.uk.xensource.com>
 <CACCGGhAqS+hQybfin6v7durB0jn-gX6oMYyr050-8_=uf0wQ1A@mail.gmail.com>
 <23972.40372.377662.700932@mariner.uk.xensource.com>
 <20191014164429.ltk64qeoo2ckzwet@debian>
 <23972.42710.205681.915082@mariner.uk.xensource.com>
 <23972.42872.768049.55036@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23972.42872.768049.55036@mariner.uk.xensource.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [XEN PATCH v4 for-4.13 10/10] libxl/xl: Overhaul
 passthrough setting logic passthrough setting logic
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <dunlapg@umich.edu>,
 Paul Durrant <pdurrant@gmail.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBPY3QgMTQsIDIwMTkgYXQgMDU6NTE6MDRQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gLS0tCj4gdjQ6IEZpeCB0cmFpbGluZyB3aGl0ZXNwYWNlCj4gICAgIE5vIGxvbmdlciBj
aGFuZ2UgInVua25vd24iIHRvICJ1bnNwZWNpZmllZCIuCgo+IGRpZmYgLS1naXQgYS9kb2NzL21h
bi94bC5jZmcuNS5wb2QuaW4gYi9kb2NzL21hbi94bC5jZmcuNS5wb2QuaW4KPiBpbmRleCA2NGJl
ZDMwYmNlLi43ZTIyMGQwYzIwIDEwMDY0NAo+IC0tLSBhL2RvY3MvbWFuL3hsLmNmZy41LnBvZC5p
bgo+ICsrKyBiL2RvY3MvbWFuL3hsLmNmZy41LnBvZC5pbgo+IEBAIC02NjAsNiArNjYwLDEyIEBA
IGluIHByZWZlcmVuY2UuIEhvd2V2ZXIsIHRoZSBhdmFpbGFiaWxpdHkgb2YgdGhpcyBvcHRpb24g
aXMgaGFyZHdhcmUKPiAgc3BlY2lmaWMuIElmIEI8eGwgaW5mbz4gcmVwb3J0cyBCPHZpcnRfY2Fw
cz4gY29udGFpbmluZwo+ICBCPGlvbW11X2hhcF9wdF9zaGFyZT4gdGhlbiB0aGlzIG9wdGlvbiBt
YXkgYmUgdXNlZC4KPiAgCj4gKz1pdGVtIEI8dW5zcGVjaWZpZWQ+CgpEb24ndCBmb3JnZXQgdG8g
Y2hhbmdlIHRoZSBtYW4gcGFnZSBhcyB3ZWxsIDstKS4KCi0tIApBbnRob255IFBFUkFSRAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
