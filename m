Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0073E1BC0AB
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 16:08:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTQty-0004L3-Pd; Tue, 28 Apr 2020 14:07:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NU6p=6M=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jTQtx-0004JX-0f
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 14:07:57 +0000
X-Inumbo-ID: a750e0be-8959-11ea-9867-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a750e0be-8959-11ea-9867-12813bfff9fa;
 Tue, 28 Apr 2020 14:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588082875;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=5OhOUoQl2/DHZ7IzNIxIAeEo7gVuL/FeA3J14VLMssI=;
 b=PGdIsfQ+meNyJDZ/rkveUnkevmmgWiE76N2yyljF0GWxlOziSWuKXnq7
 OYtDIeFhluvimKa7ob7tkd/l8/zM5vcBlIOVbvymkvDa2fK1I1mxwda4Y
 FGFjuN2DKtWDENDHHaNjbxolNivcq12hqO/leu5F6RKtr4ShevgCWrqJd A=;
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
IronPort-SDR: 9CAhl/zs8Ogk/RBGZ6jNVnZP3Cf4fxN2gvwm5M10M9MmGyOUDfUzDY0/PJkEpF50xyreWYUFf3
 UZhPHht45gzBcVr6gI52vFrUDXf7vPqUC4hGM6QKdcxv+3vwtmnAFAuYBlJey4IcDGZbx2W75s
 3ZYy05eg64Fre0f0fv/qnRmUqVMwVT0rdxx3KSGie4wE6aU63xnUwdcCtGZKJ4tz2VaHaM8CSt
 /xqgrwzmroUmo8vhFrF4IRs7ikoAaQC+q48y9GAcH4Iyt0PHa17BMqbZdNWb15cFbK/zheuEuf
 2gs=
X-SBRS: 2.7
X-MesageID: 17062337
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,327,1583211600"; d="scan'208";a="17062337"
Subject: Re: [PATCH] PCI: drop a redundant variable from pci_add_device()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <75d1c852-e6ea-d3f3-3624-c77fb678412a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <88fdaeee-1c4f-0e11-dfdd-f3a81b4b7f0d@citrix.com>
Date: Tue, 28 Apr 2020 15:07:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <75d1c852-e6ea-d3f3-3624-c77fb678412a@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28/04/2020 13:59, Jan Beulich wrote:
> Surrounding code already uses the available alternative, after all.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

