Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A84F2192ADF
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 15:13:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH6kk-0006qb-Bo; Wed, 25 Mar 2020 14:11:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K3jc=5K=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jH6kj-0006q1-97
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 14:11:29 +0000
X-Inumbo-ID: 84f1355c-6ea2-11ea-b34e-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 84f1355c-6ea2-11ea-b34e-bc764e2007e4;
 Wed, 25 Mar 2020 14:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585145488;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=oJHuPy8YVX64cOHCh4EvAjVSh9fcgSV/J0qLjsaiK+k=;
 b=X1hZ+JCRFmF537LHCqO7+GFiYz8LA5iXClVkhtna37Ok3hzAiy3cIo+P
 qG5SG4QGmH3lm07SJ84IZhz1Etol5wWLIgmQ5g3BUoVUrh+zbOKYuxipg
 C4MqhZvpO/T+Ph05rQ41TyuF2hIVkcXOo+dmB67/PrEHDekjPhYbY12PM I=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: A1PPyh5CsjyzHyx57e+odKbO37hfNg1ckxSc7j+LOztaE5lM2VjwKom1VuvmMDqKp0QOH5s4fV
 D9hIJOIU/y0VYIgXuLCYS8CooBSuOlmw7i4YFa8OFhEbJJevzpzQF2N4ZRAosy4YvRTSk53Exu
 nZsDof/8qlxE9Fpa/iM/Fag1q1DJgDL24/975SJd/yHbu5s80ctxVXwqudhzc8vy5W6jOYgzfN
 6hlldjQwZYskZQzwR2PNUYgzQg4xE6LRUIzBv7jaP2SpvrlcGRx/O65LhfQU+c+kAdcVNWv0l8
 BSU=
X-SBRS: 2.7
X-MesageID: 15265134
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,304,1580792400"; d="scan'208";a="15265134"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <cfeb8fcf-3ba6-674c-17a9-93be9e746930@suse.com>
 <fbabdcdb-3123-75e7-896c-9c7dd844f409@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c4c0245a-753f-1725-705b-769179db609c@citrix.com>
Date: Wed, 25 Mar 2020 14:11:24 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <fbabdcdb-3123-75e7-896c-9c7dd844f409@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 4/7] x86emul: vendor specific near indirect
 branch behavior in 64-bit mode
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24/03/2020 16:27, Jan Beulich wrote:
> Intel CPUs ignore operand size overrides here, while AMD ones don't.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

