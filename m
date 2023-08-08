Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECBC7739A0
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 12:35:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579586.907635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTK3z-00075r-CK; Tue, 08 Aug 2023 10:35:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579586.907635; Tue, 08 Aug 2023 10:35:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTK3z-00073h-9T; Tue, 08 Aug 2023 10:35:43 +0000
Received: by outflank-mailman (input) for mailman id 579586;
 Tue, 08 Aug 2023 10:35:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6lST=DZ=citrix.com=prvs=577b0fef7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qTK3x-0006fM-QQ
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 10:35:41 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51591192-35d7-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 12:35:40 +0200 (CEST)
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
X-Inumbo-ID: 51591192-35d7-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1691490940;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BrTXV0zGTCBFA5cHhsVl+NKGNpqGumAs1gqFHvWjauQ=;
  b=iiOElW66YpPhbOBsD1caQKQ3C1hqSMkW6ssglK1ter9KL2K7/FxylCMs
   qFLWJ15MwIASVpAb2VZRe+Z18G4RMP7q8H7oUvYwpAcuvWgOvsPZkqXNe
   c5vJNANTPZf/84IakVn+xXw6XTNmUy21wr1PkyoH6MwttPHuIyIU/VGPr
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 118117886
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:+bfqqayD6Gk4bTN9ZpZ6t+cWxirEfRIJ4+MujC+fZmUNrF6WrkUEm
 2IdWmzVa62Majb2e9Agbdzkp0wA75DVz983HQdp/yAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EoHUMja4mtC5QRuPa8T5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KVBt1
 78mOXMIVTqS19uyy4iqYfdnqtt2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZwMzh/B+
 TKWoQwVBDk+a/iH8RSAqUuCreCXxGTWVdg5BOSBo6sCbFq7mTVIVUx+uUGAifu2kEmlQPpEN
 lcZvCEpqMAa5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAbShZRZdpgs9U5LRQjz
 lKTlsnlLSBuuraSD3ma89+pQSiaYHZPazVYPGldEFVDuoO4yG0usv7RZudAMu2Ln57wIhvhk
 wmOpxIvrKsYodFegs1X4mv7qz6ro5HISCs86QPWQn+p42tFWWK1W2C7wQOFtKgdde51WnHE5
 SFZwJbGsIjiGLnXzESwrPMx8KZFDhpvGBnVmhZREpYo7FxBEFbzLNkLsFmSyKqEW/vomAMFg
 meJ4Wu9B7cJZhNGiJObhKrvY/nGNYC6SbzYugn8N7KimKRZeg6d5z1JbkWNxW3rm0VEufhha
 M7HKp32XCpKUPQPIN+KqwA1i+ZD+8zD7TmLGcCTI+qPjtJym0J5uZ9aaQDTP4jVHYuPoRnP8
 sY3Cid540w3bQEKWQGOqdR7BQlTfRAG6WXe95Q/mhirflA3RwnMypb5ndscRmCSt/8IyrmRp
 innCxMwJZiWrSSvFDhmo0tLMNvHNauTZ1piVcDwFT5EA0QeXLs=
IronPort-HdrOrdr: A9a23:zn3B1KvD6nsNZQQEOhHbbVwk7skDe9V00zEX/kB9WHVpm62j5q
 OTdZsgvyMc5Ax9ZJhCo7C90cu7L080nKQdieIs1NGZMDUO01HIEGgN1+Tf6gylNQW7y/VU0r
 1pebV/Dtr5CDFB/KTH3DU=
X-Talos-CUID: 9a23:j5IceW+2nFkrPCtv1A2Vv383OIMbYz7Y913Bc3a8Alx4Y6OeZUDFrQ==
X-Talos-MUID: 9a23:XCLWnAp1AhyKqvcRnlgezxU9EN9QzaH1MW4mns1f/OSJbwdgYg7I2Q==
X-IronPort-AV: E=Sophos;i="6.01,263,1684814400"; 
   d="scan'208";a="118117886"
Date: Tue, 8 Aug 2023 11:35:28 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/2] tools: add configure option for libfsimage
Message-ID: <4679e0f5-f5ea-4182-887c-0fe65539f9c2@perard>
References: <20230804060000.27710-1-jgross@suse.com>
 <20230804060000.27710-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230804060000.27710-3-jgross@suse.com>

On Fri, Aug 04, 2023 at 08:00:00AM +0200, Juergen Gross wrote:
> The only in-tree user of libfsimage is pygrub. Now that it is possible
> to disable the build of pygrub, the same should be possible for
> libfsimage.
> 
> Add an option for controlling the build of libfsimage. The default is
> on if pygrub is being built, and off if it isn't. Without pygrub the
> build of libfsimage can be enabled via --enable-libfsimage.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> diff --git a/tools/configure.ac b/tools/configure.ac
> index 9947bcefc6..aea24eb982 100644
> --- a/tools/configure.ac
> +++ b/tools/configure.ac
> @@ -185,6 +185,19 @@ AS_IF([test "x$enable_rombios" = "xyes"], [
>  ])
>  AC_SUBST(rombios)
>  
> +AC_ARG_ENABLE([libfsimage],
> +    AS_HELP_STRING([--enable-libfsimage],
> +                   [Enable libfsimage, (DEFAULT is on if pygrub is enabled,
> +                    otherwise off)]),,[
> +    AS_IF([test "x$enable_pygrub" = "xno"], [
> +        enable_libfsimage="no"
> +    ], [
> +        enable_libfsimage="yes"
> +    ])
> +])
> +AS_IF([test "x$enable_libfsimage" = "xyes"], [libfsimage=y], [libfsimage=n])
> +AC_SUBST(libfsimage)
> +

Should we issue an error if one does "--disable-libfsimage
--enable-pygrub" ? Or just let the build of pygrub fails?
Also, "--disable-libfsimage" alone will keep "pygrub" enabled, so we
should probably check.

Thanks,

-- 
Anthony PERARD

