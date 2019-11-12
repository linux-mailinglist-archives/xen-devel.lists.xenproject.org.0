Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A77FF94D4
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 16:55:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUYTN-0008Id-Io; Tue, 12 Nov 2019 15:52:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WcyK=ZE=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iUYTM-0008IN-3m
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 15:52:52 +0000
X-Inumbo-ID: 7a001494-0564-11ea-a21f-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7a001494-0564-11ea-a21f-12813bfff9fa;
 Tue, 12 Nov 2019 15:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573573970;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=OCROyTxQTL/H5aAkwjqMKKsm39mk1MY9s7GZhTsUhuw=;
 b=ctNIKT/HG6WcpY/CwoS9eSYt51UJG/DDwX9D+pzZlN8XQzBGNLQbsjKL
 Qe95HQyht8PZth8R3tDm0KWSTSj3DuUgerxXXmqwoKCHrHI8ttJjg3EQf
 rCKamNwIp4q6MTNxAnWPcRbdOhRbdcu3F7eUWKa9rm85+aCplctfdBjdU M=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: KmqY2pAl5rlGvACUrusHHMdUZO9mbb/EOVV34b02ft5nVf/R8KgwVJCsPYpjg6lc7WBQwqS3Nh
 uDGpOAb9552Pw9LuLxyNxYE0WPG97rxhJVXfbrNpJU3xOZy6vfRK9GOawgohS7ZMQKCCojeC8B
 9awcRAXH8TIuH6lUxxu7V+oo3OYvXWLfrC3gBLCWeobq8l3AZMUrC1RQfF2hxBZdsCbfZz3fqL
 iOcJmCgoh3zwj5SkxjC9viEfxRBbWCKMFRpLvfDnyvVCpZdxY1K2YoIGK79QJLTD17oqZX2pAv
 akc=
X-SBRS: 2.7
X-MesageID: 8206726
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,296,1569297600"; 
   d="scan'208";a="8206726"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24010.54605.748579.576373@mariner.uk.xensource.com>
Date: Tue, 12 Nov 2019 15:52:45 +0000
To: Jim Fehlig <jfehlig@suse.com>
In-Reply-To: <38b0ce49-d9ab-047b-90fb-7a468f8163ab@suse.com>
References: <20191112120913.25864-1-ian.jackson@eu.citrix.com>
 <38b0ce49-d9ab-047b-90fb-7a468f8163ab@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [OSSTEST PATCH 1/2] ts-libvirt-build: Provide
 PKG_CONFIG_PATH
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
Cc: Juergen Gross <JGross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SmltIEZlaGxpZyB3cml0ZXMgKCJSZTogW09TU1RFU1QgUEFUQ0ggMS8yXSB0cy1saWJ2aXJ0LWJ1
aWxkOiBQcm92aWRlIFBLR19DT05GSUdfUEFUSCIpOgo+IE9uIDExLzEyLzE5IDU6MDkgQU0sIElh
biBKYWNrc29uIHdyb3RlOgo+ID4gKyAgICAgICAgUEtHX0NPTkZJR19QQVRIPSIkeGVucHJlZml4
L2xpYi9wa2djb25maWcvIiBcXAo+ID4gICAgICAgICAgIEdOVUxJQl9TUkNESVI9JGJ1aWxkZGly
L2xpYnZpcnQvJGdudWxpYi0+e1BhdGh9IFxcCj4gPiAgICAgICAgICAgICAgIC4vYXV0b2dlbi5z
aCAtLW5vLWdpdCBcXAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgLS13aXRoLWxpYnhs
IC0td2l0aG91dC14ZW4gLS13aXRob3V0LXhlbmFwaSAtLXdpdGhvdXQtc2VsaW51eCBcXAo+IAo+
IFVucmVsYXRlZCwgYnV0IHRoZSBsZWdhY3kgeGVuIGFuZCB4ZW5hcGkgZHJpdmVycyBoYXZlIGJl
ZW4gcmVtb3ZlZCBzbyB0aGUgCj4gLS13aXRob3V0LXt4ZW4seGVuYXBpfSBvcHRpb25zIGNvdWxk
IGJlIGRyb3BwZWQuCgpUaGFua3MgZm9yIHRoZSByZXZpZXcuICBJIHRoaW5rIHdlIHNob3VsZCBj
b25zaWRlciB0aGF0IGZvciBwb3N0IFhlbgpmcmVlemUuICBJIGRpZCBub3RpY2UgdGhlIHdhcm5p
bmcgbWVzc2FnZXMgYnV0IEkgdGhvdWdodCBsZWF2aW5nCi0td2l0aG91dC11bmtub3duLXRoaW5n
IHdvdWxkIGJlIE9LLCBhbmQgaXQgZGlkIGluZGVlZCBidWlsZC4KClRoYW5rcywKSWFuLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
