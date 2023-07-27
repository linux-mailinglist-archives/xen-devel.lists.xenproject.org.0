Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79978765279
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 13:32:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571036.893892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOzE4-0000ip-Ga; Thu, 27 Jul 2023 11:32:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571036.893892; Thu, 27 Jul 2023 11:32:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOzE4-0000hB-DN; Thu, 27 Jul 2023 11:32:12 +0000
Received: by outflank-mailman (input) for mailman id 571036;
 Thu, 27 Jul 2023 11:32:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o85N=DN=citrix.com=prvs=5659ebe79=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qOzE2-0000gu-5w
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 11:32:10 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 373ec5da-2c71-11ee-b247-6b7b168915f2;
 Thu, 27 Jul 2023 13:32:08 +0200 (CEST)
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
X-Inumbo-ID: 373ec5da-2c71-11ee-b247-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690457527;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ru4DxDajKdtMdEVunn88lORpczmvQj/BqUIh0L27F7A=;
  b=JFOMWvMeJC/YI99t8EGJ28+eJbIsKIuXXcgp70b/YkgyN9dLiOhGCfa6
   04UnbJram7XRu1iHHgXa+JsW96rs2NMIvV640RUiuVgE02JclmPUXZEFr
   UXYKZGsPE67M/ePgvQXoG5iG3gRKeWtR96TOslPHzZ3rOgbhcp6tAF8AS
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 118065567
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:bdqBCapBL9T69rjhw0tpkFD0ZGNeBmIxZRIvgKrLsJaIsI4StFCzt
 garIBmHOPaJZWuneN93O9m3oB9Q6JLSmN9jHVdo+S4xFC1G8ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GpwUmAWP6gR5weBzSZNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXADsqQB2YrPjo+YLhbtNsi99/KIrLPZxK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVRrk6VoqwmpXDe1gVr3JDmMcbPe8zMTsJQ9qqdj
 jufrzynX0xEa7RzzxLd0WKI2fHguh/2Z5BNKeKA0vVVm1GMkzl75Bo+CgLg/KjRZlSFc9BWL
 UAO6zcthac3/U2vCNL6WnWQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3OcpQRQ62
 1nPmMnmbRRturCITXOW9p+PsCi/fyMSKAcqbDcJVwIf7/H/oYs4iVTESdMLLUKupoSrQ3eqm
 WnM9XVgwexJ1qbnyplX43jMpByhvbPTEDcFvCHtXm++sgc6RI+6MtnABUfg0RpQEGqIZgDf7
 SBfypPOtLxm4YKlz3LUHrhUdF29z7PcaWCH3wYyd3U03271k0NPa7y8992XyK1BFs8fMQHkb
 0bI0e+6zM8CZSD6BUObjm/YNijL8UQDPY6/PhwsRoASCqWdjSfelM2UWWae3nr2jG8nmrwlN
 JGQfK6EVChLUf82kmDpFrxFjtfHIxzSI0uJG/gXKDz+j9KjiIO9E+9ZYDNikMhnhE97nOkl2
 4kGbJbbo/mueOb/fjPW4eYuwaMidBAG6WTNg5UPLIare1M2cFzN/teNmdvNjaQ5xfUK/goJl
 1nhMnJlJK3X3CKccljbNSg4M9sCn/9X9BoGAMDlBn7ws1BLXGplxP13m0cfFVX/yNFe8A==
IronPort-HdrOrdr: A9a23:3qOgE6F7Ybujv/+ApLqEw8eALOsnbusQ8zAXPiFKOHlom6mj/a
 2TdZsguSMc5Ax/ZJhYo6H4BEDiewK/yXcW2+ks1N6ZNWHbUQ2TQr2KhrGSoAEIdReeygdr79
 YFT0EvMrbN5IBB/L3HCdODYrAdKQS8gceVbDvlvg9QpN9RGttd0zs=
X-Talos-CUID: 9a23:Z3p6fG5//3oMPs6PJdss/2k6F9sOaCPk/C30GU+1EjptC52UVgrF
X-Talos-MUID: =?us-ascii?q?9a23=3A8t4olAxY5ke/tbpV/qYSQp5Mn2OaqPyNGGRSj7o?=
 =?us-ascii?q?hh8S7J3NNZA+5hwusTpByfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,234,1684814400"; 
   d="scan'208";a="118065567"
Date: Thu, 27 Jul 2023 12:32:01 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Jan Beulich
	<jbeulich@suse.com>
Subject: Re: [PATCH v7 11/15] xenpm: Print HWP/CPPC parameters
Message-ID: <882c0e9f-8e66-4be3-aecf-477d38da9371@perard>
References: <20230726170945.34961-1-jandryuk@gmail.com>
 <20230726170945.34961-12-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230726170945.34961-12-jandryuk@gmail.com>

On Wed, Jul 26, 2023 at 01:09:41PM -0400, Jason Andryuk wrote:
> @@ -772,6 +812,32 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
>                 p_cpufreq->u.s.scaling_min_freq,
>                 p_cpufreq->u.s.scaling_cur_freq);
>      }
> +    else
> +    {

I feel like this could be confusing. In this function, we have both:
    if ( hwp ) { this; } else { that; }
and
    if ( !hwp ) { that; } else { this; }

If we could have the condition in the same order, or use the same
condition for both "true" blocks, that would be nice.


> +        const xc_cppc_para_t *cppc = &p_cpufreq->u.cppc_para;
> +
> +        printf("cppc variables       :\n");
> +        printf("  hardware limits    : lowest [%u] lowest nonlinear [%u]\n",
> +               cppc->lowest, cppc->lowest_nonlinear);

All these %u should be %"PRIu32", right? Even if the rest of the
function is bogus... and even if it's probably be a while before %PRIu32
is different from %u.

Thanks,

-- 
Anthony PERARD

