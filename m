Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC9C199B19
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 18:13:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJJT5-0001Fu-9N; Tue, 31 Mar 2020 16:10:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fshn=5Q=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jJJT4-0001Fp-CE
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 16:10:22 +0000
X-Inumbo-ID: 1ee408e4-736a-11ea-83d8-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ee408e4-736a-11ea-83d8-bc764e2007e4;
 Tue, 31 Mar 2020 16:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585671021;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ShFMSX0GUnIGXhQy6EKecc3KBiOALDuv+b0RZXrLdmI=;
 b=HMPbcCwfFXtjRLIcr0BjopmlCCR71rAZGbTDfDQ0LAKMO3xN35Nb92Uy
 eOMgmhPC3f1gGcTE7KE+S9IRHYPXgxnMHx1ZyVHhKLGlsxxU8ma8wAw63
 VH0IvXoB8seLZt34CTv+b3aFJP1kUASXYaRQ3NU/GyOfp5r9WeL0i1dQO 4=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: vF+BgNRqJMn+R5k/idBG9+Xr4q3ifBuyJo/ClE/WCumO6pdxNdZHVahZvSZBm1hvsO4ZPLE12I
 ZaX95T5TFx8/uC8GEVMRwaHlKVbjCtjL/TBuyvdalqJDEK3XRs9yvv3V9wxzha7pkLbYcZ8/g3
 PddhfXnQgi3uWikSJ2tclNtj6+E1GDJhxRADb7W3eZ29SjOkcuuwa2psW46uREfbdoWs+jA6qK
 ZVhFUIJpfTajHL+KQPNTRkXrxgeBNXMjcGu6ZHcapOL+dhXXZneLei76fnKBDdI3g4vvl8Aw8N
 0w4=
X-SBRS: 2.7
X-MesageID: 15350723
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,328,1580792400"; d="scan'208";a="15350723"
Subject: Re: [PATCH v2 2/2] x86emul: support SYSRET
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <e4b15b26-4492-efb0-c19a-288c0fd65ba9@suse.com>
 <86b9d307-4f08-463b-255a-ed84b67e2076@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <4f2a88d9-4ef8-3fcc-4aff-04936643fdad@citrix.com>
Date: Tue, 31 Mar 2020 17:10:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <86b9d307-4f08-463b-255a-ed84b67e2076@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 31/03/2020 16:58, Jan Beulich wrote:
> This is to augment SYSCALL, which we've been supporting for quite some
> time.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

In some copious free time I'll see about finishing off my XTF test for
these cases, but that will have to wait for now.

