Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C8214D8BD
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 11:12:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix6mn-0001Ud-87; Thu, 30 Jan 2020 10:10:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=avZM=3T=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ix6mm-0001UY-8X
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 10:10:56 +0000
X-Inumbo-ID: cd81b628-4348-11ea-8a28-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd81b628-4348-11ea-8a28-12813bfff9fa;
 Thu, 30 Jan 2020 10:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580379056;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=iRLhGMDwMFyJV1/P4Y0gBvWpCgSPCtNlM3+j83XrUvg=;
 b=MqFPyWtKdtWgJIQFFSRVTioJzitZLOBIJHi0w4JC1jW5f04y22OFNKEW
 rix6fpwIYCaTKVFbolacRXCuQkMAzfvYDfraF74Skv1GqB4omNMdoXbQN
 lgClB+tcuwGgC4UgkVj4zKykftY6b7q+2K+smLFA35gVRkXhbSavRjqVp k=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: R+1Q3nz93fWJbPQP+stWdgaBqmDeUnXnSkEPv07IPkyj3n/o8oIztp7J80nxzXweR0ZDDm0Qg3
 F2eClPelFYmyX7ZjzjjSI5cnqDXP1Efv5IgbYR5VAXhzjblXf/fd2PLNbM9Zik2o5rbrJ1ow2O
 GbyzaS6x3X//3Ce7RigHoMo604XyKMkoGsAmbCkBOCQ6us6mXtsZqbWU/AdFD6XwK2x/NXIFw5
 R3M6dHfgkZOFFrdaJyZxysNU+/+kHhc0GHfzxBmgiG0ISvkFhhjHfPbHD70A2/qw2fhoh601ax
 OXQ=
X-SBRS: 2.7
X-MesageID: 11845395
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,381,1574139600"; d="scan'208";a="11845395"
Date: Thu, 30 Jan 2020 11:10:48 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200130101048.GE4679@Air-de-Roger>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-4-liuwe@microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200129202034.15052-4-liuwe@microsoft.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v5 03/12] x86/smp: don't online cpu if
 hypervisor_ap_setup fails
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMjksIDIwMjAgYXQgMDg6MjA6MjVQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBQdXNoIGh5cGVydmlzb3JfYXBfc2V0dXAgZG93biB0byBzbXBfY2FsbGluLgo+IAo+IFRha2Ug
dGhlIGNoYW5jZSB0byByZXBsYWNlIHhlbl9ndWVzdCB3aXRoIGNwdV9oYXNfaHlwZXJ2aXNvci4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgoKUmV2aWV3
ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKVGhhbmtzLCBS
b2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
