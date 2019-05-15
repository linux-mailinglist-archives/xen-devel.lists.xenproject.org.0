Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEFD1EAF4
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2019 11:32:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQqDS-0008SZ-1h; Wed, 15 May 2019 09:28:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0eB+=TP=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQqDQ-0008SU-D6
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 09:28:48 +0000
X-Inumbo-ID: d540d79e-76f3-11e9-a4e2-1355af688353
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d540d79e-76f3-11e9-a4e2-1355af688353;
 Wed, 15 May 2019 09:28:44 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=wei.liu2@citrix.com;
 spf=SoftFail smtp.mailfrom=wei.liu2@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 wei.liu2@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa6.hc3370-68.iphmx.com: domain of
 wei.liu2@citrix.com is inclined to not designate 23.29.105.83
 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 mx include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 include:_spf.salesforce.com ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: RBayvhLPvPGGDMX3MFsVnppNzPMLKHKZ6UY7XLrWKgbIT53LSanTH6BN2S96kClsdLCmIk057+
 YJbPtMSisOTGUisUDUYqb+EQLcbsoA8Lx8tzbFTgaodMfvtw+8CrrWakEdD43JrEfpB+KVtnLE
 4wDBL1DO2mZJA0tntitYHUSNpP4SxstG0gUZWj/X7XeAol/fBQ9cgjwDaR49VSJSeEVBqyDkfR
 bvjlywbTWdTohsuttpiSHlCcx6po6X1q70SrBmZPZfSd8+4HnJldY3k7YyKGtO5Fcy2YQjdodP
 oXI=
X-SBRS: 2.7
X-MesageID: 437921
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,472,1549947600"; 
   d="scan'208";a="437921"
Date: Wed, 15 May 2019 10:28:37 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: George Dunlap <george.dunlap@citrix.com>
Message-ID: <20190515092837.GK2798@zion.uk.xensource.com>
References: <1557850437-27656-1-git-send-email-rcojocaru@bitdefender.com>
 <20190515065342.GJ2798@zion.uk.xensource.com>
 <7fcc90c5-35c4-5ce4-e6c0-8e2276fedcd7@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7fcc90c5-35c4-5ce4-e6c0-8e2276fedcd7@citrix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH] x86/altp2m: move
 altp2m_get_effective_entry() under CONFIG_HVM
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
Cc: Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>,
 george.dunlap@eu.citrix.com, andrew.cooper3@citrix.com, jbeulich@suse.com,
 xen-devel@lists.xenproject.org, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMDk6NTU6MzBBTSArMDEwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiBPbiA1LzE1LzE5IDc6NTMgQU0sIFdlaSBMaXUgd3JvdGU6Cj4gPiBPbiBUdWUsIE1h
eSAxNCwgMjAxOSBhdCAwNzoxMzo1N1BNICswMzAwLCBSYXp2YW4gQ29qb2NhcnUgd3JvdGU6Cj4g
Pj4gQWxsIGl0cyBjYWxsZXJzIGxpdmUgaW5zaWRlICNpZmRlZiBDT05GSUdfSFZNIHNlY3Rpb25z
Lgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0
ZGVmZW5kZXIuY29tPgo+ID4gCj4gPiBSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0
cml4LmNvbT4KPiAKPiBBY2tlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRy
aXguY29tPgoKQXBwbGllZC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
