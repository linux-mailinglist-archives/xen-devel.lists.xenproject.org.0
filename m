Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42880F4464
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 11:22:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT1OC-0003j3-4s; Fri, 08 Nov 2019 10:21:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5eKS=ZA=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1iT1OB-0003iv-AM
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 10:21:11 +0000
X-Inumbo-ID: 7b8684a2-0211-11ea-a1d4-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7b8684a2-0211-11ea-a1d4-12813bfff9fa;
 Fri, 08 Nov 2019 10:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573208470;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=p88Gb9aIW9x4V/oA/oDhYn2oFyb02cCJkEDplCRgty0=;
 b=X5Gf1/MJEVOBUtiMe9WPobnzJ4GofL1wrSJtJDoPyQ1ryXH9X7YAlHoE
 UHA3ibJhA1LmVADIQGeZGGMUPnCPLi55kxNBe/Pncq+wWjJX8Ig1xvtcm
 GGceII/xF8KEBfQpMC9cteFqG9exciZGPrS4TU+OP5/DauCGkRxla/qfu E=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
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
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /tVLS/6cHF5W/bkM5xjREEnEOy2SNeyvEDJGlTI/CrBjh82ynsEnx/H39cneYQWJ6q6SeQ8B7+
 ebMp0Qyuh6SocyPWLtQMpCrxtOuzCGipNmPrKMVg65Q/IrBMd6wCX8h4Bk5BBcmpSNmfwaFfC3
 g8fWxAVApWEl09yjUTa1PqUQnoPR8zcPnvktX1rWN6oUktCijaFrBtptAiFsRm/HFTDHi+3bFr
 fzFTfVjyBfeKqPZgrkaq83OssBA2WzF3DyT/TcgnFdJUEka5mkLFLDzgsnNoAcbAr59QLajWXN
 DKM=
X-SBRS: 2.7
X-MesageID: 8403094
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,281,1569297600"; 
   d="scan'208";a="8403094"
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
References: <20191105194317.16232-1-andrew.cooper3@citrix.com>
 <20191105194317.16232-2-andrew.cooper3@citrix.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <db32f8fa-2ca5-79e8-c967-137a26b0440f@citrix.com>
Date: Fri, 8 Nov 2019 10:21:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191105194317.16232-2-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] xen/livepatch: Add a return value to
 load hooks
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvNS8xOSA3OjQzIFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9uZSB1c2Ugb2YgbG9h
ZCBob29rcyBpcyB0byBwZXJmb3JtIGEgc2FmZXR5IGNoZWNrIG9mIHRoZSBzeXN0ZW0gaW4gaXRz
Cj4gcXVpZXNjZWQgc3RhdGUuICBBbnkgbm9uLXplcm8gcmV0dXJuIHZhbHVlIGZyb20gYSBsb2Fk
IGhvb2sgd2lsbCBhYm9ydCB0aGUKPiBhcHBseSBhdHRlbXB0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTog
Um9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
