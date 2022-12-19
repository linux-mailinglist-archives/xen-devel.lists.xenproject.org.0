Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D3A650B1B
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 13:04:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466016.724836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7Ert-0008MU-5z; Mon, 19 Dec 2022 12:03:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466016.724836; Mon, 19 Dec 2022 12:03:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7Ert-0008JN-2N; Mon, 19 Dec 2022 12:03:41 +0000
Received: by outflank-mailman (input) for mailman id 466016;
 Mon, 19 Dec 2022 12:03:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gyHb=4R=citrix.com=prvs=3454adc0d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1p7Err-0008JG-Se
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 12:03:39 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a9636f8-7f95-11ed-91b6-6bf2151ebd3b;
 Mon, 19 Dec 2022 13:03:38 +0100 (CET)
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
X-Inumbo-ID: 2a9636f8-7f95-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671451418;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=gsWbg3+vw5+5NyZ4Qtw3douJekKSx6M3du9vacnd+18=;
  b=e5EdqEz7SjWb0DtJ0cN9cCP9TXgWnMrMEeD2hg6oQDknXMeZ9fEpW/nM
   irFj6AVaeYuehL4kNHftk/WxdgCjlcm7d+0qvm0Ar7PlwKRf0hFhRfT4E
   A/q7oUveZzEUtXEdr3UCke0HgvhTV8pDmvNzJgGqTtupazx6Si75LneTz
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 89067484
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:jCkTHKw8QNIq5CfURfF6t+c7xirEfRIJ4+MujC+fZmUNrF6WrkUBy
 zFMDGuFOa3fZWHxfYolOozloEkO6JHcnYNiSVdvqSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U0HUMja4mtC5AVkPKET5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KVhs3
 94oEx48VAyoxPKQ57LlRNhdh+12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKQOHWjOX9OYH46tO6umnn4dSwesF+PrLA7y2PS0BZwwP7mN9+9ltmiFZQNwBnE9
 j6uE2LRDhsQc4OHlmC/0FGR19SMp37pZ6QdG+jtnhJtqALKnTFCYPEMbnOkpdGph0j4XMhQQ
 2QY8zQjhbI//0uqSp/6RRLQiG6JuFsQVsRdF8U+6RqR0ezE7gCBHG8GQzVdLts8u6cLqScCj
 wHT2YmzXHo27ePTGSn1GqqoQS2aAAo/D185Sx4+USBG8//EoN89vyPOZ4M2eEKqteHdFTb1y
 jGMiSExgbQPkMIGv5mGEUD7byGE/caQEFNsjunDdif8t14iOtb5D2C9wQKDhcusOrp1WbVoU
 JIsv8GFpN4DApiW/MBmaLVcRer5jxpp3dC1vLKOI3XD3272k5JAVdoKiN2bGKuOGphsRNMRS
 BWP0T69HbcKVJdQUYd5YpiqF+MhxrX6GNLuW5j8N4QRO8MhJFTZonE/NCZ8OlwBd2B1zckC1
 WqzK57wXR7294w8pNZJewvt+eBynX1vrY8ibZv60w6mwdKjWZJhcp9caAHmRrlgvMu5TPD9r
 4432z2il08OD4UTo0D/reYuELz9BSNiWMyu9JwPKr/rz8gPMDhJNsI9CIgJI+RN95m5XM+Sl
 p1hcie0EGbCuEA=
IronPort-HdrOrdr: A9a23:+Z1UsKxzFiwE6uSq9y/xKrPw2r1zdoMgy1knxilNoHxuH/BwWf
 rPoB17726TtN91YhsdcL+7V5VoLUmzyXcx2/hyAV7AZniAhILLFvAA0WKK+VSJdxEWtNQtsJ
 uIG5IUNDSaNykfsS+V2miF+9ZL+qj5zEir792usUuEm2tRGtBdBwQSMHfqLqVvLjM2fKbQjP
 Cnl7d6TzzLQwVuUu2LQkMrcsLkvNPxmJfvcXc9dmIaAFnnt0LS1FbieSLopCsjbw==
X-IronPort-AV: E=Sophos;i="5.96,255,1665460800"; 
   d="scan'208";a="89067484"
Date: Mon, 19 Dec 2022 12:03:31 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Edwin =?iso-8859-1?B?VPZy9ms=?= <edvin.torok@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v4 06/11] tools/ocaml: add .clang-format
Message-ID: <Y6BTExf6riHD1HLV@perard.uk.xensource.com>
References: <cover.1671214525.git.edwin.torok@cloud.com>
 <a3af11ec979d7559ba8db2d185bd51454858739d.1671214525.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a3af11ec979d7559ba8db2d185bd51454858739d.1671214525.git.edwin.torok@cloud.com>

On Fri, Dec 16, 2022 at 06:25:15PM +0000, Edwin Török wrote:
> Add a .clang-format configuration that tries to match CODING_STYLE where
> possible.

Is there going to be a patch applying this to "tools/ocaml", like you
did with "make format"?

> I was not able to express the special casing of braces after 'do'
> though, this can only be controlled generally for all control
> statements.
> It is imperfect, but should be better than the existing bindings, which
> do not follow Xen coding style.

There isn't a single CODING_STYLE for all code in the repo so it isn't
an issue if the binding where having a different coding style. But
having as few coding style as possible in the repo is probably helpful.

You could maybe add a CODING_STYLE in "tools/ocaml" to say that the
coding style is running `make format` or `clang-format ...`. And if
there other rules like how to name certain variable, that could go in
this file as well.


Cheers,

-- 
Anthony PERARD

