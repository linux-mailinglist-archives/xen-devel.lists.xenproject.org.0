Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 064AD1A0E58
	for <lists+xen-devel@lfdr.de>; Tue,  7 Apr 2020 15:28:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLoGS-0003yZ-Dd; Tue, 07 Apr 2020 13:27:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Iuu=5X=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jLoGQ-0003yU-Ua
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 13:27:38 +0000
X-Inumbo-ID: 8c11f35e-78d3-11ea-9e09-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8c11f35e-78d3-11ea-9e09-bc764e2007e4;
 Tue, 07 Apr 2020 13:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586266058;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=HFK0JCEQulhb7pY2LjrwzdaGUMOEOlcM47IPVKd2dkA=;
 b=S+xVGQfDjVEr46vNxSsWsDVAuDlWzFglWQ+sH+roKeu/etIlHtE86pC7
 o9AKW+m/jH/1tHkr4kVzQshLDq5+bk8YIYHVJwOABbgwLWZ1o6QnzAFFS
 IoHaUEaOvsXT09ULrrTN12JysAxqqEX3fbydNyCfGUMlVOYTt9Tnmou/t c=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: eSdLFT4xH8aCgUjy/BwWIkNlTNaErAO49LhuMuMuc9o2PrSN0tgHuQCorNffnj1COK7/ClogFc
 LaToiTg2U2DaaHjINCFuRkEulXfwN8g1V+T6D+DnrzMaob7IwAd0VWzTr0YT1kMZyra9u3s8AL
 7jqU1EW+4w2Kkkk1wA1mUx9/y5nFQl1K96TNrp6hGQ2x4piOA6t+LbV8qitfN7P3awy3051GMv
 HzlK1Xp1CvSWNRLeU+euIynZI6advA8H6uaoVkilWunHEek/XEyITysYdD+AWuVCukPIrgZwc0
 lWo=
X-SBRS: 2.7
X-MesageID: 15310640
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,354,1580792400"; d="scan'208";a="15310640"
Subject: Re: [PATCH] x86/PoD: correct ordering of checks in
 p2m_pod_zero_check()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <5da96b29-7f80-4bfd-eb30-5547f415d2b8@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <8780ba3d-11dc-4a88-34cb-6b0fe7fe01bd@citrix.com>
Date: Tue, 7 Apr 2020 14:27:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <5da96b29-7f80-4bfd-eb30-5547f415d2b8@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07/04/2020 12:07, Jan Beulich wrote:
> Commit 0537d246f8db ("mm: add 'is_special_page' inline function...")
> moved the is_special_page() checks first in its respective changes to
> PoD code. While this is fine for p2m_pod_zero_check_superpage(), the
> validity of the MFN is inferred in both cases from the p2m_is_ram()
> check, which therefore also needs to come first in this 2nd instance.
>
> Take the opportunity and address latent UB here as well - transform
> the MFN into struct page_info * only after having established that
> this is a valid page.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

