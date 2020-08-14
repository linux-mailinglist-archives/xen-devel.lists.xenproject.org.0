Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A6724484E
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 12:53:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6XKE-0000t5-Jk; Fri, 14 Aug 2020 10:52:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S5ir=BY=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1k6XKC-0000sz-OY
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 10:52:40 +0000
X-Inumbo-ID: 324423b1-97c1-4336-b572-bfc4d04c9a3a
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 324423b1-97c1-4336-b572-bfc4d04c9a3a;
 Fri, 14 Aug 2020 10:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597402358;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kx2i6VHvG4dcECBbCCmZGcqn7OynD5vm0NKSaxsmyI0=;
 b=RmWZuW1TOTNrZjynVdPeA6dg71OdWGqIVliNpJT06+xnT9haqpu4YKM8
 0hnVWf4YAa+MnRZA3NVz/UeAvKA/RqeAYa+13CRDBK4qCzKd0Kfx3yX0q
 +poQKswy7VX8aiwYiR/5zP6s0lVPaXXZJ1BViB2oyFZ1gIuaonw2gTURm Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: SjQcVFCbLuoCYHRLuMhDta5Aepq+H8kFIZSterso4c85tqNUEOmEyLu+rd6WY2D3iKYcVT1rPK
 9Lf5Q8vBOLT4z5gQ6aC7ae/CYy6DNLzOTlN8jASbAffVgYxfNRbBC6BsOslnVozlpkVQOikVBF
 WZWfgsk0qbll0SPZniv6PwWPeOmUYk7sn22FSctfwOpQNpuuAvKxZZzv77Y/O53/RCE5y3CULg
 ZtuYeprabFQYOZM9PljtzmOFYVZppW7bQQOnHofTPpEpazV2eFTvN0NyKET4vEVFNgCLikVh4/
 A4Q=
X-SBRS: 2.7
X-MesageID: 24695500
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,312,1592884800"; d="scan'208";a="24695500"
Date: Fri, 14 Aug 2020 11:52:33 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <george.dunlap@citrix.com>, "Nick
 Rosbrook" <rosbrookn@ainfosec.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Subject: Re: [RFC PATCH 1/2] libxl: add Function class to IDL
Message-ID: <20200814105233.GD2024@perard.uk.xensource.com>
References: <cover.1595854292.git.rosbrookn@ainfosec.com>
 <7e1774dffe69c702f738566abeb04a3a9d29e21b.1595854292.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7e1774dffe69c702f738566abeb04a3a9d29e21b.1595854292.git.rosbrookn@ainfosec.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jul 27, 2020 at 09:26:32AM -0400, Nick Rosbrook wrote:
> Add a Function and CtxFunction classes to idl.py to allow generator
> scripts to generate wrappers which are repetitive and straight forward
> when doing so by hand. Examples of such functions are the
> device_add/remove functions.
> 
> To start, a Function has attributes for namespace, name, parameters,
> return type, and an indication if the return value should be interpreted as
> a status code. The CtxFunction class extends this by indicating that a
> libxl_ctx is a required parmeter, and can optionally be an async
> function.
> 
> Also, add logic to idl.parse to return the list of functions found in an
> IDL file. For now, have users of idl.py -- i.e. libxl/gentypes.py and
> golang/xenlight/gengotypes.py -- ignore the list of functions returned.
> 
> Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
> ---
>  
> +class Function(object):
> +    """
> +    A general description of a function signature.
> +
> +    Attributes:
> +      name (str): name of the function, excluding namespace.
> +      params (list of (str,Type)): list of function parameters.
> +      return_type (Type): the Type (if any), returned by the function.
> +      return_is_status (bool): Indicates that the return value should be
> +                               interpreted as an error/status code.

Can we get away without `return_is_status`? Couldn't we try to have
return_type=libxl_error to indicate that return is a kind of status?

> +    """
> +class CtxFunction(Function):
> +    """
> +    A function that requires a libxl_ctx.
> +
> +    Attributes:
> +      is_asyncop (bool): indicates that the function accepts a
> +                         libxl_asyncop_how parameter.

While CtxFunction can be a function that takes `libxl_ctx` as first
parameter, I don't think `is_asyncop` can be used. We can't know if
`ao_how` will be last or not. For some function, `ao_how` is second to
last. So, I guess `ao_how` might need to be listed in `params`

What do you think?

Thanks,

-- 
Anthony PERARD

