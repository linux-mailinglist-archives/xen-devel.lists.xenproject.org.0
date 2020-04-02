Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6AF19C01E
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 13:24:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJxvW-0006un-31; Thu, 02 Apr 2020 11:22:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8h32=5S=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jJxvU-0006ui-LX
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 11:22:24 +0000
X-Inumbo-ID: 39152e1c-74d4-11ea-bbb2-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 39152e1c-74d4-11ea-bbb2-12813bfff9fa;
 Thu, 02 Apr 2020 11:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585826543;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=XmkrE30c4AIpnSY4hot20plgsx2trYGUvHcFv55q0FM=;
 b=EQhsxK3pKYC/3Fd3T8RUIaLxnLgo/3BilnXg8G5Ieqls8widws/qIzmd
 BnMKAL3g1MaZFadNAbC34gL5XxsNaO+8oZe8MEr3quJ+uZu3t987vpqVi
 DNCC5+WUKi5w5ZUW4165yX5TmQRFxfSn2cOD3zPemlGlrds9IgXA1WYqT I=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 8lMofdGJW2ThPHHjO71YLbENLJq7cAPkkbtgJc+qsmqhJAlnSE2p8rBanQb+IqdRl6g880eiie
 1gygY+IBOFjU94WKUzlLF6OprpNNEZythrCYps/wpowS+djiwVoTLbw+H94TmBwYGAqKLGzvcr
 GdpS1yyZUhD8isHVhAlIHLX8TTGva4+YWH0W31zMTan/65QfrxfvVV+YwwbIE7xQu9zGkPLNWE
 P1+t9mR0Q9MLUyEdvLgYx69K2aOLeFdJlvc4kG5QU8DWqKHrFXKpYjVsQmhpm+aqi1oZOwMSMX
 yT4=
X-SBRS: 2.7
X-MesageID: 15043671
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,335,1580792400"; d="scan'208";a="15043671"
Subject: Re: [PATCH v2] x86emul: suppress "not built" warning for test harness
 for run targets
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <4c5af3e1-836f-4104-99a8-79755c8034e1@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <8e5228cf-248b-863f-4faf-16a2b77f6ed0@citrix.com>
Date: Thu, 2 Apr 2020 12:22:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <4c5af3e1-836f-4104-99a8-79755c8034e1@suse.com>
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
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20/03/2020 16:11, Jan Beulich wrote:
> The run* targets can be used to test whatever the tool chain is capable
> of building, as long as at least the main harness source file builds.
> Don't probe the tools chain, in particular to avoid issuing the warning,
> in this case. While looking into this I also noticed the wording of the
> respective comment isn't quite right, which therefore gets altered at
> the same time.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

