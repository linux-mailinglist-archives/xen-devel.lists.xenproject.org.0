Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1519419BF49
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 12:25:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJx0E-000236-7a; Thu, 02 Apr 2020 10:23:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8h32=5S=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jJx0C-000231-9r
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 10:23:12 +0000
X-Inumbo-ID: f41d9ac2-74cb-11ea-b58d-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f41d9ac2-74cb-11ea-b58d-bc764e2007e4;
 Thu, 02 Apr 2020 10:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585822992;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Y8LCM/pBPhxwBWME6Rc+dCIWJCwOZHigAysnBgEo1j4=;
 b=Iytpkjejcr8F5jqULgVd0P/w33JYnH61zWorOU5GqNC9wHYA+iA07/l7
 LVVMpeGw21/Ek39PfwNUy/Nx5TT/WhEj8/rnd2c5WZYJv4gkxfl4THflV
 vQaixxKCuGXVez/0EUhPZhks7ggRREE3uBD+1l+p0SqR2ey2uBoc7XshV A=;
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
IronPort-SDR: PmIXRldKAlznqTrSX38cf/QgGDOmpqz3/bd8vTE7VdquFi+PE2RiKriVHyAQpNsi2iMRlCPEwb
 qUrzENRU1hW9bABbz/r2wJRuY0JgSJDeNBOh3ABcEuyaucQexdztUCsXlxy+DPO+kTV6cIOQFE
 S27uX7gM3Z5v8y3Kvs6VQkNoCvjun+ON536efOXO1/tYR8O70Zdgu9SaI+E1b5jhM1c58n/xjQ
 90jO783RAApMckuqzKAOt5uAUrflhX4i9MHeJ//TUuxYDAHW988DP61TxoHi4bJ7QLK6vnFpoe
 zKY=
X-SBRS: 2.7
X-MesageID: 15068231
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,335,1580792400"; d="scan'208";a="15068231"
Subject: Re: [PATCH] x86emul: inherit HOSTCC when building 32-bit harness on
 64-bit host
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <842a0920-60ed-cf51-7f6c-37af40173160@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <09789474-7e62-67cc-0420-7c25b9572bce@citrix.com>
Date: Thu, 2 Apr 2020 11:23:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <842a0920-60ed-cf51-7f6c-37af40173160@suse.com>
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 02/04/2020 10:43, Jan Beulich wrote:
> We're deliberately bringing XEN_COMPILE_ARCH and XEN_TARGET_ARCH out of
> sync in this case, and hence HOSTCC won't get set from CC. Therefore
> without this addition HOSTCC would not match a possible make command
> line override of CC, but default to "gcc", likely causing the build to
> fail for test_x86_emulator.c on systems with too old a gcc.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

