Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02879199ADB
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 18:05:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJJLg-0000Qj-Eq; Tue, 31 Mar 2020 16:02:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fshn=5Q=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jJJLf-0000Qd-5S
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 16:02:43 +0000
X-Inumbo-ID: 0d546412-7369-11ea-9e09-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d546412-7369-11ea-9e09-bc764e2007e4;
 Tue, 31 Mar 2020 16:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585670563;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=mAuqavpYv4hwHsOaFEb9o3lPd75IRd4hPs+Ym+imXtc=;
 b=ALzpcVny0lpHS42XlgXPWBerYMVvC6FuWNxj8jALInQz0UdqRv4J136Z
 9xM395YaqIDGBeCEOqUbFC4hIvQNj8BfYQpKBRhM/XYPCBbdGxjiFGI++
 cwfP4FwpE67cLiGkvtWmpm2LueYrNuYuaa5ugDL8TZSIbrPehUz+Pu+JF k=;
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
IronPort-SDR: 9pKbB/vQMBsHU0WLHFQWC2dyeydZT789u9s/+Xpl6q3hcbAdUuH1XI0osuM37iFV+GxKgyKokp
 cTB4HEPCXFplR1Qmr1Daj9pxA1ON613yb32oWW+LdAvB9cMCaF8Y4vRtGvmNhGUE6862EiTTdf
 61MYFdfGDJII8b0QvzootMv+DYyOSQTyt/nalEPPpZAJmyPr+ADRdLoVkitTXI7LKFdo3Zca63
 Y5OSfdJWbu6GLstE96BWcL1XpO9WQFgxaJ4lMTTj6K/fNrXZQygPAtrfyCnr3VR/I85pucEt1y
 Uyk=
X-SBRS: 2.7
X-MesageID: 14952890
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,328,1580792400"; d="scan'208";a="14952890"
Subject: Re: [PATCH v2 1/2] x86emul: vendor specific SYSCALL behavior
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <e4b15b26-4492-efb0-c19a-288c0fd65ba9@suse.com>
 <d87ee7fe-b658-2b6d-e492-55589cadc7b5@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <867a9c8d-8d79-1ed8-93dc-e37e618951c5@citrix.com>
Date: Tue, 31 Mar 2020 17:02:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <d87ee7fe-b658-2b6d-e492-55589cadc7b5@suse.com>
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
> AMD CPUs permit the insn everywhere (even outside of protected mode),
> while Intel ones restrict it to 64-bit mode. While at it also comment
> about the apparently missing CPUID bit check.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

