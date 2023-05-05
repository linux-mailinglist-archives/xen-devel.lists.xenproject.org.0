Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FC66F869A
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 18:23:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530512.826172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puyDQ-0007Ey-UQ; Fri, 05 May 2023 16:23:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530512.826172; Fri, 05 May 2023 16:23:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puyDQ-0007D5-RT; Fri, 05 May 2023 16:23:28 +0000
Received: by outflank-mailman (input) for mailman id 530512;
 Fri, 05 May 2023 16:23:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fp4m=A2=citrix.com=prvs=4826eee3f=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1puyDP-0007Cz-4L
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 16:23:27 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2893022d-eb61-11ed-b226-6b7b168915f2;
 Fri, 05 May 2023 18:23:25 +0200 (CEST)
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
X-Inumbo-ID: 2893022d-eb61-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683303805;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LpW+04vmvMqG7/SbATjIMR3yKWBj0hCYyMl4I7nU1/Y=;
  b=CpIA3Fst/B9hO8TcBcKzDLXzc0qGYo8GjVfNveo7dxOAdPbXsv+8mNZX
   Cgqs1AgbJmtMNVOhWIwZT2byWuMFTnFaLEbhjJDA6h/2rndHB9sRuZaJa
   wjASqZ+7zs2B3kFV/lEyIb0XN+qWKPI849FyvQ+r4jdOMr1Fy5+felGVA
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 108429655
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:ANXpP6AkbIPg/BVW//Hjw5YqxClBgxIJ4kV8jS/XYbTApDghgj1Tx
 2sWXG/Ub/yMZGDwedl1bom19R4PvMTUyoVlQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFuspvlDs15K6p4G5A4wRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw1L1TDWQR2
 c0iIRMOcg+HvPmI8Iqnc7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTIJs4gOevgGi5azBCoUiZjaE2/3LS3Ep6172F3N/9I4TaGZ8EwBvFz
 o7A10qgHU9KHYbE8DuM43zwrbDwhmT4U41HQdVU8dY12QbOlwT/EiY+cUawqL+Xg0i1VtZbN
 mQd4C9opq83nGS7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZhRMcsA8vck6Axkjz
 EaUnsjBDCZq9raSTBq1ybqV6xiyNC49JHUHIyQDSGMt/N3LsIw1yBXVQb5LCqmuhMfyHjL26
 z+PpSk6wb4UiKYj1aqh+kvcqymxvZWPRQkwji3eRm+/5xl1TJKkbYevr1Pc6J59wJ2xFwfb+
 iJewo7Hsb5IVMvW/MCQfAkTNJ/yw/qAbxHtu1dMHIU+8w+2xU6bYbkFtVmSO3xV3tY4lS7BO
 RGD4lkMtcYKYxNGfocsPdvvVp1CIbzIUI28C6uKNocmjo1ZLlfvwc14WaKHM4kBemAImLp3B
 5qUeN3E4Z0yWfU+l2reqwvwPNYWKsECKYD7H8qTI+yPi+b2WZJsYe5t3KGyRu449riYhw7e7
 sxSMcCHoz0GDr2lOHOJrddCdQtVRZTeOa0aVuQNLrLTSuaYMDhJ5wDtLUMJJNU+wvU9ehbg9
 XChQE5IoGfCaYn8AVzSMBhLMeq/NauTWFpnZUTAy370gSl8CWtuhY9DH6YKkU4PrbM4lqEoF
 albI61twJ1nE1z6xtjUVrGlxKQKSfhhrVvm0/aNCNTnQ6Ndeg==
IronPort-HdrOrdr: A9a23:vL7GIq9mD7ygrZMLMaVuk+AcI+orL9Y04lQ7vn2ZKSY5TiX4rb
 HKoB1/73XJYVkqN03I9ervBEDiewK/yXcW2+ks1N6ZNWGLhILBFupfBODZsl7d8kPFl9K01c
 1bAtJD4N+bNykGsS4tijPIb+rJw7O8gd+Vbf+19QYIcenzAZsQlzuQDGygYypLbTgDP7UVPr
 yG6PFKojKxEE5nFfhSVhE+Lo7+T8SgruOeXSI7
X-Talos-CUID: 9a23:aYtV6W3x7/TEOXakRai9drxfNJsBfniC4EbqKmy7FXltc6areWeMwfYx
X-Talos-MUID: 9a23:UehdgQjZSfBUqhLRyUqqusMpGp53vfSHUhs0kJwXtZWvahNrfDSWg2Hi
X-IronPort-AV: E=Sophos;i="5.99,252,1677560400"; 
   d="scan'208";a="108429655"
Date: Fri, 5 May 2023 17:23:19 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook
	<rosbrookn@gmail.com>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v6 10/12] xen/tools: add sve parameter in XL configuration
Message-ID: <da845262-9bb3-467e-9f04-18c9eb06c2eb@perard>
References: <20230424060248.1488859-1-luca.fancellu@arm.com>
 <20230424060248.1488859-11-luca.fancellu@arm.com>
 <996db21b-e963-4259-884d-2131c548ca1e@perard>
 <8C3DC6ED-83D8-4DD0-9C99-B34449304373@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8C3DC6ED-83D8-4DD0-9C99-B34449304373@arm.com>

On Tue, May 02, 2023 at 07:54:19PM +0000, Luca Fancellu wrote:
> > On 2 May 2023, at 18:06, Anthony PERARD <anthony.perard@citrix.com> wrote:
> > On Mon, Apr 24, 2023 at 07:02:46AM +0100, Luca Fancellu wrote:
> >> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> >> index ddc7b2a15975..1e69dac2c4fa 100644
> >> --- a/tools/libs/light/libxl_arm.c
> >> +++ b/tools/libs/light/libxl_arm.c
> >> @@ -211,6 +213,12 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
> >>         return ERROR_FAIL;
> >>     }
> >> 
> >> +    /* Parameter is sanitised in libxl__arch_domain_build_info_setdefault */
> >> +    if (d_config->b_info.arch_arm.sve_vl) {
> >> +        /* Vector length is divided by 128 in struct xen_domctl_createdomain */
> >> +        config->arch.sve_vl = d_config->b_info.arch_arm.sve_vl / 128U;
> >> +    }
> >> +
> >>     return 0;
> >> }
> >> 
> >> @@ -1681,6 +1689,26 @@ int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
> >>     /* ACPI is disabled by default */
> >>     libxl_defbool_setdefault(&b_info->acpi, false);
> >> 
> >> +    /* Sanitise SVE parameter */
> >> +    if (b_info->arch_arm.sve_vl) {
> >> +        unsigned int max_sve_vl =
> >> +            arch_capabilities_arm_sve(physinfo->arch_capabilities);
> >> +
> >> +        if (!max_sve_vl) {
> >> +            LOG(ERROR, "SVE is unsupported on this machine.");
> >> +            return ERROR_FAIL;
> >> +        }
> >> +
> >> +        if (LIBXL_SVE_TYPE_HW == b_info->arch_arm.sve_vl) {
> >> +            b_info->arch_arm.sve_vl = max_sve_vl;
> >> +        } else if (b_info->arch_arm.sve_vl > max_sve_vl) {
> >> +            LOG(ERROR,
> >> +                "Invalid sve value: %d. Platform supports up to %u bits",
> >> +                b_info->arch_arm.sve_vl, max_sve_vl);
> >> +            return ERROR_FAIL;
> >> +        }
> > 
> > You still need to check that sve_vl is one of the value from the enum,
> > or that the value is divisible by 128.
> 
> I have probably missed something, I thought that using the way below to
> specify the input I had for free that the value is 0 or divisible by 128, is it
> not the case? Who can write to b_info->arch_arm.sve_vl different value
> from the enum we specified in the .idl?

`xl` isn't the only user of `libxl`. There's `libvirt` as well. We also
have libxl bindings for several languages. There's nothing stopping a
developer to write a number into `sve_vl` instead of choosing one of the
value from the enum. I think we should probably sanitize any input that
comes from outside of libxl, that's probably the case, I'm not sure.

So if valid values for `sve_vl` are only numbers divisible by 128, and
some other discrete numbers, then we should check that they are, or
check that the value is one defined by the enum.

Cheers,

-- 
Anthony PERARD

