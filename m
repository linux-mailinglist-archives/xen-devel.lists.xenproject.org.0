Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3054681853
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 19:07:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487117.754600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMYYE-0006rW-Pv; Mon, 30 Jan 2023 18:06:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487117.754600; Mon, 30 Jan 2023 18:06:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMYYE-0006oF-MW; Mon, 30 Jan 2023 18:06:42 +0000
Received: by outflank-mailman (input) for mailman id 487117;
 Mon, 30 Jan 2023 18:06:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dpD8=53=citrix.com=prvs=3879b2cf9=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pMYYD-0006my-3W
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 18:06:41 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d72873d0-a0c8-11ed-93eb-7b0ecb3c1525;
 Mon, 30 Jan 2023 19:06:39 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: d72873d0-a0c8-11ed-93eb-7b0ecb3c1525
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675101999;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YNKQLtgZEG5dWxVtP2OQaAUcPcCNC2dDfECDbqrmXBA=;
  b=F3qQHKBxz0z4L5K4aA3aU7lGtHEcsL4IJbEc+mIUKs+A1sRu/tUG1jLE
   UWE31XlGCDTu/CJfCthLEcV2DYu4v4YdLSnvCMX/GEQgIqMeX/abF+6lN
   KKW1GdO/c4QlrZspqMtA2LZQIlBWRH1+XglVY9vJEG2Pw0rPFY428vV0u
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 94816167
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:FiTmoaxzsShjXMvpxG16t+cBxirEfRIJ4+MujC+fZmUNrF6WrkUFy
 TEeXW6FMv/ZZmfwKo8iOdi29x9T7MLdz4Q2TgE9ryAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UwHUMja4mtC5QRnPqgT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KUd2q
 ucdEWsWVy2Si7icmKCKEMtijMt2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZQJzh/G/
 zyZl4j/KhsUO9W9yzaLyyKxhc7XgiDfXaIAPZTto5aGh3XMnzdOWXX6T2CTrfCnh2akVtlYK
 khS/TAhxYA77EGxR8PxdwG5qnWD+BUbXrJ4A+A8rQ2A1KfQywKYHXQfCC5MbsQ8s807TiBs0
 UWG9/vrCiZoq6a9Um+G+/GfqjbaETcRBX8PY2kDVwRt3jX4iNht1FSVFI8lSfPryISvQlkc3
 gxmsgAYv+oIiPdQzJyG7FydqWq+l8LrQAQ6s1C/sn2e0it1Y4usZoqN4Ffd7OpdIIvxcmRtr
 EToiODFsrlQUMjleDilBbxUQer3v6rt3Cj02wYHInU3y9i6F5dPl6h06So2GkpmO91sldTBM
 B6K4lM5CHO+0RKXgU5Lj2CZUZ9CIUvIT46NuhXogj1mP/BMmPevpn0GWKJp9zmFfLIQua8+I
 4yHVs2nEGwXD69qpBLvGbhAieZ0n3BinTKMLXwe8/hA+ePODEN5tJ9faAfeBgzHxPzsTPrpH
 yZ3aJLRlkQ3vBzWaSjL648DRW3m3lBiba0aX/d/L7bZSiI/QTFJNhMk6e95E2CTt/gPx7igE
 7DUchMw9WcTclWccF7SMysyNeqHsFQWhStTABHA9G2AgxALCbtDJo9GH3frVdHLLNBe8MM=
IronPort-HdrOrdr: A9a23:77ZirquTaLyRMkqvfp2etxwL7skCq4Aji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJh5o6H8BEGBKUmskKKdkrNhQYtKPTOW81dASbsN0WKM+UyYJ8STzJ8/6U
 4kSdkFNDSSNykxsS+Z2njBLz9I+rDum8rI5ds2jU0dNj2CAJsQizuRfzzrdHGeMzM2YqbReq
 DshPZvln6FQzA6f867Dn4KU6zqoMDKrovvZVorFgMq8w6HiBKv8frfHwKD1hkTfjtTyfN6mF
 K13zDR1+GGibWW2xXc32jc49B/n8bg8MJKAIihm9UYMTLljyevfcBEV6eZtD44jemz4BIBkc
 XKoT0nI8NvgkmhM12dkF/I4U3NwTwu43jtxRuzmn34u/H0Qzo8Fo5omZ9ZWgGx0TtvgPhMlI
 Zwm06JvZteCh3N2A7n4cLTah1snk2o5VI/jO8oiWBFW4d2Us4RkWVfxjIULH4zJlO51GkVKp
 gqMCga3ocTTbquVQGbgoCo+q3qYp18JGbBfqFIgL3r79EfpgEG86Jf/r1Rol4wsKsnTZ9K/u
 LFNbktuo1vY6YtHPpALdZEeNCwDGPVRxLKLSa1GnTIUI86G1+lke+v3F0SjNvaIqDgCKFCw6
 jpQRdWs3U/dFnpDtDL1JpX8grVSGH4Rjj1zNpCjqIJzIEUaYCbRRFrcmpe5PeIsrEaGInWSv
 yzMJVZD7vqKnbvA59A20n7V4NJIXcTXcUJspJjMmj+6v7jO8nvrKjWYfzTLL3iHXItXX7+GG
 IKWHz2KN9b5k6mV3fkiFzaWm/reEb44ZVseZKqttQ72cwILMlBowIVgVO26oWCLiBDqLU/eA
 9kLLbugsqA1ByLFKbznhdU0zZmfzVoCe/bIgJ3TCcxQjPJTYo=
X-IronPort-AV: E=Sophos;i="5.97,258,1669093200"; 
   d="scan'208";a="94816167"
Date: Mon, 30 Jan 2023 18:06:28 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>, Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, Edwin Torok <edvin.torok@citrix.com>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: Re: [PATCH 2/6] tools: Introduce a non-truncating
 xc_xenver_extraversion()
Message-ID: <Y9gHJLTaeVKWgeS8@perard.uk.xensource.com>
References: <20230117135336.11662-1-andrew.cooper3@citrix.com>
 <20230117135336.11662-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230117135336.11662-3-andrew.cooper3@citrix.com>

On Tue, Jan 17, 2023 at 01:53:32PM +0000, Andrew Cooper wrote:
> ... which uses XENVER_extraversion2.
> 
> In order to do sensibly, use manual hypercall buffer handling.  Not only does
> this avoid an extra bounce buffer (we need to strip the xen_varbuf_t header
> anyway), it's also shorter and easlier to follow.
> 
> Update libxl and the ocaml stubs to match.  No API/ABI change in either.
> 
> With this change made, `xl info` can now correctly access a >15 char
> extraversion:
> 
>   # xl info xen_version
>   4.18-unstable+REALLY LONG EXTRAVERSION
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

