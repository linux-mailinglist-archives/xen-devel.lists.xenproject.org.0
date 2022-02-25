Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F864C456D
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 14:09:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279077.476612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNaKZ-0003qb-JT; Fri, 25 Feb 2022 13:08:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279077.476612; Fri, 25 Feb 2022 13:08:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNaKZ-0003od-GV; Fri, 25 Feb 2022 13:08:19 +0000
Received: by outflank-mailman (input) for mailman id 279077;
 Fri, 25 Feb 2022 13:08:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E0Ll=TI=citrix.com=prvs=04808661d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nNaKY-0003oX-1t
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 13:08:18 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fbdd7409-963b-11ec-8539-5f4723681683;
 Fri, 25 Feb 2022 14:08:13 +0100 (CET)
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
X-Inumbo-ID: fbdd7409-963b-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645794496;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/dLasjR4QNQQl1HUPUWbJ6+yTkW58wF5ll0k2xMBRrg=;
  b=f+3NdM3PrvP6KwHhEPQ6Ywuf2/ux46THUPjT1OkNRZAxMiIkeqi/fFoJ
   8RQ5Mc9ZC9H45kA4L+u/6mbHJYfqxu+aScqVTnl8S848bvNxP8cWH9eOW
   nxUlW3e4XIYgHpLnrBH4GkNuHwuMJ7IHyYYjNqoRL+KOOPvpI23cCdAs+
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 64988098
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:a4Y5t6+02LZDjsfVNbrKDrUDG36TJUtcMsCJ2f8bNWPcYEJGY0x3m
 mVMXziAO/vbZ2byc9EnPI6+9BkC78ODzINjSQc6qyk8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw24LkW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCna6iQiNxZaHXpP1DDQNIFy5nNLRv0rCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFIoZpnFnyyCfFfs8SIrPa67L+cVZzHE7gcUm8fP2O
 ZZIOWo3PUSojxtnJ3FQE54/s8GTv3DbQQ9ElXOMmfRv7D2GpOB2+Oe0a4eEEjCQfu1rmUKfq
 nPD7n7OKBgQP9yCyhKI6nupwOTImEvTQ5kOHbe18vprhly7xWEJDhASE1yhrpGRgEOkR8hWL
 UBS/yM0tLUz72SiVNy7VBq9yFaHswAdXZxMEuQ8wACL1qfQpQ2eAwAsTCNHLtovt8Y0RDkj/
 l6Pg97tQzdotdW9Vna15rqS6zSoNkA9PWIEICMJUwYBy93iu50oyALCSM55F6y4hcGzHiv/q
 xiIozI5nK47ltMQ2uOw+lWvqzCxopnESCYl6wORWXiqhit7boO4Y42j6XDA8O1Nao2eSzG8U
 GMswpbEqrpUVNfUyXLLEL5l8KyVC+itAi/XpQY0E4Id7mrz4W6ncplZ+RhUKxI8WiobQgPBb
 EjWsAJXwZZcOnq2cKN6C76M59QWIbvIToq8CK2NBjZaSt0oLVLconkyDaKF9z21yCARfbcD1
 YB3mCpGJVITEuxZwTW/XI/xOpd7l3lllQs/qX0WpilLMIZyhlbJGN/p03PUN4jVCZ9oRi2Po
 r6z0OPQln1ivBXWOHW/zGLqBQliwYIHLZ73sddLUeWIPxBrHmosY9eIn+98JNA8w/kNzr+Ql
 p1YZqO+4ACu7ZEgAV/XAk2PlZu1BcovxZ7FFXZE0amUN4gLPt/0sfZ3m2ofdrg77u1zpcOYv
 NFeE/hs9s9nE2ydkxxENMGVhNU7KHyD2FLfVwL4MWNXV8MxGGT0FirMI1KHGN8mVXHs66PTY
 tSIi2vmfHb0b186XZaONan2lAvZULp0sLsaYnYk6+J7IC3EmLWG4QSr5hPrC6ng8Sn++wY=
IronPort-HdrOrdr: A9a23:FkSpfqODmAjYmcBcTsGjsMiBIKoaSvp037Eqv3oedfVwSL39qy
 nOpoV/6faaslsssR0b9exofZPwJk80lqQFg7X5X43DYOCOggLBR+tfBMnZsl7d8kXFh4hgPM
 xbEpSWZueeMWRH
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="64988098"
Date: Fri, 25 Feb 2022 13:08:08 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jane Malalane <jane.malalane@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH v3 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Message-ID: <YhjUuEIKs016T4yx@perard.uk.xensource.com>
References: <20220218172943.12182-1-jane.malalane@citrix.com>
 <20220218172943.12182-2-jane.malalane@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220218172943.12182-2-jane.malalane@citrix.com>

On Fri, Feb 18, 2022 at 05:29:42PM +0000, Jane Malalane wrote:
> Add XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_xapic and
> XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_x2apic to report accelerated xapic
> and x2apic, on x86 hardware.
> No such features are currently implemented on AMD hardware.
> 
> For that purpose, also add an arch-specific "capabilities" parameter
> to struct xen_sysctl_physinfo.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
> ---
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index 51a9b6cfac..333ffad38d 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -528,6 +528,13 @@
>  #define LIBXL_HAVE_MAX_GRANT_VERSION 1
>  
>  /*
> + * LIBXL_HAVE_PHYSINFO_ASSISTED_APIC indicates that libxl_physinfo has
> + * cap_assisted_x{2}apic fields, which indicates the availability of x{2}APIC

I think I'd rather have both cap_assisted_xapic and cap_assisted_x2apic
spelled out in the comment as that would allow to grep for both string.

> + * hardware assisted virtualization.
> + */
> +#define LIBXL_HAVE_PHYSINFO_ASSISTED_APIC 1


Otherwise, tools/ side looks good.

Thanks,

-- 
Anthony PERARD

