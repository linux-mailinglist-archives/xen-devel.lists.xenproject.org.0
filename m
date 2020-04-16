Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0418D1AC242
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 15:26:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP4WR-0001SP-AJ; Thu, 16 Apr 2020 13:25:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gkLV=6A=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1jP4WP-0001SK-1e
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 13:25:37 +0000
X-Inumbo-ID: c16d0ad4-7fe5-11ea-8b92-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c16d0ad4-7fe5-11ea-8b92-12813bfff9fa;
 Thu, 16 Apr 2020 13:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587043537;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4YW9jmThK2p92tdAQyY4DWoKdL+iWXf8XE2lQN6cwP8=;
 b=YoKhRcGWt2zCIiytfHah03O8SW4A0XPEL0r2gG0mjiVrxnjTKqXPTi95
 qqpu7wIuTcYKqp3VogQrigmwmIGQ6kTxEphw2HD4bltl+3uRu1pwQpS4a
 C4JmrMlE0d/X12HIxg1Rg1SZmjjJpsoISc+4Y8NIZP6Ehm9Ba7RZ0xDqa M=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=christian.lindig@citrix.com;
 spf=Pass smtp.mailfrom=christian.lindig@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 christian.lindig@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="christian.lindig@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 christian.lindig@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="christian.lindig@citrix.com";
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
 envelope-from="christian.lindig@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: erBkGnVQCCT95l3wxpzgHk/xSSH2wlnQc5zxebzqmEj2RFTdin+b+ujL2JqSMsDDTCqAFZnNPs
 zhy8ZzfSB1T5zPbKebEbSByDM5QFHm5yR6rBnTihJH++6F0IQuRo11/5bI6RuQr1kbtYqCx87s
 K0kkKDmhAUjldWqr2zlfRdSuLOpOCzSdmhB0MtYWREDct1/NE1zrJRzfmitGhhTk0uQB/CDPS9
 KwhMn3Fa6CbG/pTJREqtWQI9exs9CIIMYKNLVvnBw8Z8p1LOHCEByqz629RlIb+j/1LbEi/zqd
 EJc=
X-SBRS: 2.7
X-MesageID: 15764106
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,391,1580792400"; d="scan'208";a="15764106"
From: Christian Lindig <christian.lindig@citrix.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, David Scott <dave@recoil.org>
Subject: Re: [PATCH 0/8] Fix build with using OCaml 4.06.1 and -safe-string
Thread-Topic: [PATCH 0/8] Fix build with using OCaml 4.06.1 and -safe-string
Thread-Index: AQHWBsiEF3guLbrjg0q8hVYSHUQ086h7lF0AgABCC8w=
Date: Thu, 16 Apr 2020 13:25:32 +0000
Message-ID: <1587043532025.36720@citrix.com>
References: <20200330192157.1335-1-julien@xen.org>,
 <67d3370c-779a-7007-e5fa-98d957a85ce9@xen.org>
In-Reply-To: <67d3370c-779a-7007-e5fa-98d957a85ce9@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 "dfaggioli@suse.com" <dfaggioli@suse.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Roger Pau
 Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

=0A=
The changes in the OCaml C stubs look good to me. They don't really touch t=
he interface but are mostly concerned with types on the C side by adding ca=
sts, const, and so on. The extended error handling is an improvement.=0A=
=0A=
-- Christian=0A=
=0A=
-- =0A=
Acked-by: Christian Lindig <christian.lindig@citrix.com>=0A=
=0A=
________________________________________=0A=
From: Julien Grall <julien@xen.org>=0A=
Sent: 16 April 2020 12:25=0A=
To: xen-devel@lists.xenproject.org; Christian Lindig; David Scott=0A=
Cc: dfaggioli@suse.com; Julien Grall; Stefano Stabellini; Volodymyr Babchuk=
; Jan Beulich; Andrew Cooper; Wei Liu; Roger Pau Monne; George Dunlap; Ian =
Jackson=0A=
Subject: Re: [PATCH 0/8] Fix build with using OCaml 4.06.1 and -safe-string=
=0A=
=0A=
Hi,=0A=
=0A=
Gentle ping. I am missing reviews for the OCaml part.=0A=
=0A=
Cheers,=0A=
=0A=
On 30/03/2020 20:21, Julien Grall wrote:=0A=
> From: Julien Grall <jgrall@amazon.com>=0A=
>=0A=
> Hi all,=0A=
>=0A=
> This series is meant to solve the build issue reported by Dario when=0A=
> using recent version of OCaml and -safe-string.=0A=
>=0A=
> I took the opportunity to harden a bit more the code by using const more=
=0A=
> often.=0A=
>=0A=
> This series was only build tested.=0A=
>=0A=
> Cheers,=0A=
>=0A=
> Julien Grall (8):=0A=
>    xen/guest_access: Harden copy_to_guest_offset to prevent const dest=0A=
>      operand=0A=
>    xen/public: sysctl: set_parameter.params and debug.keys should be=0A=
>      const=0A=
>    tools/libxc: misc: Mark const the parameter 'keys' of=0A=
>      xc_send_debug_keys()=0A=
>    tools/libxc: misc: Mark const the parameter 'params' of=0A=
>      xc_set_parameters()=0A=
>    tools/ocaml: libxc: Check error return in stub_xc_vcpu_context_get()=
=0A=
>    tools/ocaml: libxb: Harden stub_header_of_string()=0A=
>    tools/ocaml: libxb: Avoid to use String_val() when value is bytes=0A=
>    tools/ocaml: Fix stubs build when OCaml has been compiled with=0A=
>      -safe-string=0A=
>=0A=
>   tools/libxc/include/xenctrl.h       |  4 ++--=0A=
>   tools/libxc/xc_misc.c               |  8 ++++----=0A=
>   tools/libxc/xc_private.h            |  8 ++++++++=0A=
>   tools/ocaml/libs/xb/xenbus_stubs.c  |  6 +++---=0A=
>   tools/ocaml/libs/xb/xs_ring_stubs.c | 12 ++++++++++--=0A=
>   tools/ocaml/libs/xc/xenctrl_stubs.c |  6 ++++--=0A=
>   xen/include/asm-arm/guest_access.h  |  2 +-=0A=
>   xen/include/asm-x86/guest_access.h  |  2 +-=0A=
>   xen/include/public/sysctl.h         |  4 ++--=0A=
>   9 files changed, 35 insertions(+), 17 deletions(-)=0A=
>=0A=
=0A=
--=0A=
Julien Grall=

