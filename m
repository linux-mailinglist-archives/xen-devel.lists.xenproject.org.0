Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A27B4BA3A9
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 15:53:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274835.470435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKi9P-0006aa-2v; Thu, 17 Feb 2022 14:52:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274835.470435; Thu, 17 Feb 2022 14:52:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKi9O-0006Yl-Vx; Thu, 17 Feb 2022 14:52:54 +0000
Received: by outflank-mailman (input) for mailman id 274835;
 Thu, 17 Feb 2022 14:52:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mzVd=TA=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nKi9N-0006Yf-Cf
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 14:52:53 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4696ea34-9001-11ec-8eb8-a37418f5ba1a;
 Thu, 17 Feb 2022 15:52:51 +0100 (CET)
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
X-Inumbo-ID: 4696ea34-9001-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645109571;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Tr4ULkFu1o+lZzc5YMuT3c2t8RcmQKwmSur4ak2We0o=;
  b=QkssGENMDfsIvWyvJnXa8bpROwdlRzs5AyN2UPjeuW02iDKe2Z2dPRbQ
   R8DQxcyxA6Te+O6CltBY7vmJrkuDtXccxkWqwyChn6DkhjypvxHVLQuWj
   ikAFnVoxHnJAVJLtgO8k3xFwanqHZJtP48tukZl9ICPPTJ8UVyGgleV2I
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: lBTkOqFGFD+ObEvNJy0UneyyktmIazivQ5/YSeDK1KA+Eqy7qShmT/ZtoAQiaHltaY2tY7Wv8p
 XjO0RGQBhbuhbva/h5lp0DvvYLtW9y06DVz+FS8qRrPX91UzOoEPipOf2U+KfkKMGibor0H1KM
 NcRa23N4EwaE1cEF/GjhCmcQ0prd4KQjUl9H2wGqYIMb7keVWUpPuDDNfDWcLTIpctsJmIQcjD
 ocMQ9E2qlbDEoVG4NvWXnxLRpBaluiJ900Utr9IJTNrTFgN/Lt6yaEWxLHPEMsbyjdcWQ0eTHX
 NTl//i4RIL3Ato7S6q59jsTZ
X-SBRS: 5.1
X-MesageID: 64434574
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:AdtuIqiryZIHr8LIZcsdAgTkX161JxYKZh0ujC45NGQN5FlHY01je
 htvUD2FO/yNM2L9eIp+Po7k9U5SvJKAnd81GQU+/n82QyMb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rj2tQx3oDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1o9r2rVh53L5bWgeoaeTxSEyFcDaFJreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHiOp8fvXdxiynUF/88TbjIQrnQ5M8e1zA17ixLNaiCO
 5FFNGUzBPjGSztkNHMKAo1ipbiHl0v6Vn5HhlWJo5NitgA/yyQuieOwYbI5YOeiX8JOlFyfo
 WHA1234BB8dL9GUjzGC9xqEnfTTlCn2XIYTEryQ9fNwhlCXgGsJB3U+TVKmpdGph0j4XMhQQ
 2QW9TAptrMa71GwQ5/2WBjQiHyZuh8RXfJAHut87xuCooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9YVWZ+7SPrDKFHC8UNm4PZCIaZQYd6tylq4Y25jrNRNt+FK++jvXuBCr9h
 TuNqUAWmLE7ncMNkaKh8jj6bymE/8aTCFRvv0OOAzzjvlgRiJOZi5KAzBv69ulZcpeiVECPu
 1IhkcieztACAsTY/MCSe9klELas7veDFTTTh19zApUsnwiQF26fkZN4u28nehowWioQUXqwO
 RKI51sNjHNGFCbyNcdKj5SN59PGJEQKPfDsTbjqY9VHefCdnyfXrXg1NSZ8M40A+XXAcJ3T2
 7/HIK5A7l5AUMyLKQZaoc9HjtfHIQhkmAvuqWjTlUjP7FZnTCf9pU05GFWPdPsly6iPvR/Y9
 d1SX+PTlUkCCLahPHWKqtFORbzvEZTdLcqpwyCwXrTeSjeK5Ul7U6OBqV/fU9cNc1tpehfgo
 SjmBx4wJKvXjnzbMwSaAk2Pm5u0NauTWUkTZHR2VX7xgiBLSd/2sM83KstmFZF6pbcL5aMlE
 JE4lzCoX60npsLvoG9GM/EQbeVKKXyWuO55F3H0OmdhIc87FlehFx2NVlKHyRTixxGf7aMWy
 4BMHCuCKXbabwg9XsvQdty1yFa94SoUlO5oBhOaKdhPYkT8toNtLnWp3PMwJsgNLzTFxyebi
 FnKUUtJ+7GVrt9n6sTNiICFs5ytT7l0EH1FEjSJ9r2xLyTboDaumNcSTOaScDnBf2ro46H+N
 /5NxvTxPaRfzlZHuoZxCZhxyqc664e9rrNW1F08Tn7Kc06qGvVrJXzfhZtDsahEx7l4vwqqW
 x3QpokGaOvRYM68SQwfPgsoaOiHxMo4oDiK4KRnOlj+6Q924KGDDRdYMS6ThXEPN7ByKo4kn
 7ss4ZZE9wylhxM2Gd+alSQIpX+UJ3kNXqh75JEXBIjn1lgixl1YOMGODyb35NeEaslWM1lsK
 TiR3fKQi7NZz0vEUnwyCXmSgrYN2cVQ4EhHnA0YOlCEutvZnftmjhRe/AM+QhlR0hgagfl4P
 XJmNhEtKKiDl9uyaBOvg4x499l9OSCk
IronPort-HdrOrdr: A9a23:GQrDDaDsgaHY57nlHegjsceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U4ssQIb6Ku90ci7MDjhHPtOjbX5Uo3SODUO1FHIEGgm1/qa/9SCIVy1ygc+79
 YGT0EWMrSZYjZHZITBkW+F+r0bsbq6GdWT9ILjJgBWPGNXgs9bjztRO0K+KAlbVQNGDZ02GN
 63/cxcvQetfnwRc4CSGmQFd/KrnayGqLvWJTo9QzI34giHij2lrJTgFQKD4xsYWzRThZ8/7G
 n+lRDj7KnLiYD19vac7R6c031loqqg9jJxPr3OtiHTEESvtu+cXvUhZ1RFhkFxnAjg0idvrD
 CGmWZbAy060QKtQojym2qh5+Co6kdT11byjVCfmnftusr/WXYzDNdAn5tQdl/D51Mnp8wU6t
 M844u1jesiMfr7plWL2zEIbWAbqmOk5X451eIDhX1WVoUTLLdXsIwE5UtQVJMNBjjz5owrGP
 RnSJi03ocfTXqKK3TC+mV/yt2lWXo+Wh+AX0gZo8SQlzxbhmpwwUcUzNEW2n0A6JU+QZ9Z4P
 msCNUgqJheCssNKa5tDuYIRsW6TmTLXBLXKWqXZU/qEakWUki93qIfII9Flt1CVKZ4sqfaqa
 6xI2+w71RCBH4GIff+raF2zg==
X-IronPort-AV: E=Sophos;i="5.88,376,1635220800"; 
   d="scan'208";a="64434574"
Date: Thu, 17 Feb 2022 14:52:44 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Nick Rosbrook
	<rosbrookn@ainfosec.com>, Juergen Gross <jgross@suse.com>, Paul Durrant
	<paul@xen.org>
Subject: Re: [RFC v2 6/8] tools/arm: Introduce force_assign_without_iommu
 option to xl.cfg
Message-ID: <Yg5hPMd86GOPt/ni@perard.uk.xensource.com>
References: <cover.1644341635.git.oleksii_moisieiev@epam.com>
 <d333126d12f2281f8df92e66cfba1c9eb2425dca.1644341635.git.oleksii_moisieiev@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d333126d12f2281f8df92e66cfba1c9eb2425dca.1644341635.git.oleksii_moisieiev@epam.com>

On Tue, Feb 08, 2022 at 06:00:12PM +0000, Oleksii Moisieiev wrote:
> If set, Xen is allowed to assign the devices even if they are not under
> IOMMU.
> Can be confugired from dom.cfg in the following format:
> force_assign_without_iommu = 1
> 
> This parameter has the same purpose as xen,force-assign-without-iommu
> property in dom0less archtecture.
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> ---
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index 2a42da2f7d..1080966c33 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -564,6 +564,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
>      ("apic",             libxl_defbool),
>      ("dm_restrict",      libxl_defbool),
>      ("tee",              libxl_tee_type),
> +    ("force_assign_without_iommu", libxl_defbool),

As you are making changes to libxl's API, could you add a LIBXL_HAVE_*
macro in "tools/include/libxl.h", they are plenty of example there about
adding new fields in "libxl_domain_build_info".

Thanks,

-- 
Anthony PERARD

