Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E69FD140FC4
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 18:20:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isVFi-00031z-LX; Fri, 17 Jan 2020 17:17:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=D/C+=3G=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1isVFi-00031u-4e
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 17:17:46 +0000
X-Inumbo-ID: 44b0cf1e-394d-11ea-b5a3-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 44b0cf1e-394d-11ea-b5a3-12813bfff9fa;
 Fri, 17 Jan 2020 17:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579281462;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=7HtEZ7J59Gwp8PIzRRN3TbCZI8WIgxiQN7+kBDkVD50=;
 b=a6jXDcv/YNR44SEKbdrOZcMhsul6/F4iExIu19bVisRH9W1KgWNpjYuW
 1qXlYO4FhV9LtAGhh1LytWaS4lCGvu+ivpkWe9vpw3YRu2K+NzY7rNH+/
 +i03yOOc2F2sTtKNovl/hLLnefjCD/jSctHsNCxu8emAEIO99FN+oTiD+ E=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
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
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: xDrHjNWng9VUu70VOTZZ0zZDTJiljXsIyaYSDJUcVDx6IK2Y40IzwP7tNQ1bPvLdIEWNim63En
 N0yw/wl87vQuFUgGj5Q6jAtAIW9qPJGH4LZgZMImVGvTAXOVX9Qao20KvmFbT7DxFGzXD7GFmM
 HYI5C0PLnAV7vdIHc8kcf/iAfenKgBwn70Kc/Qo1+6nCRHIDLQKiV5OrXFs7cuYNDwG1UuCJFN
 wLcUkaxgzxuRo+s9X9GAlK0DXKdRT/ZEwRTy237d89ckuSx/qRuAjryj2upgq0F9EjCejAW5gj
 79U=
X-SBRS: 2.7
X-MesageID: 11516938
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,330,1574139600"; d="scan'208";a="11516938"
To: Anthony PERARD <anthony.perard@citrix.com>,
 <xen-devel@lists.xenproject.org>
References: <20200117105358.607910-1-anthony.perard@citrix.com>
 <20200117105358.607910-7-anthony.perard@citrix.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <1d8fb41b-2813-300b-bb22-706b97e922d0@citrix.com>
Date: Fri, 17 Jan 2020 17:17:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200117105358.607910-7-anthony.perard@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v2 06/12] xen/test/livepatch: remove
 include of Config.mk
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
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMS8xNy8yMCAxMDo1MyBBTSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gbGl2ZXBhdGNoL01h
a2VmaWxlIHNlZW1zIHRvIG9ubHkgYmUgdXNlZCB2aWEgUnVsZXMubWssIHdoaWNoIGFscmVhZHkK
PiBpbmNsdWRlcyBDb25maWcubWssIGF2b2lkIHRoZSBzZWNvbmQgaW5jbHVkZS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KClJl
dmlld2VkLWJ5OiBSb3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdlcndhbGxAY2l0cml4LmNvbT4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
