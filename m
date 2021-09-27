Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1341D4191C7
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 11:48:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196610.349521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUnEQ-0006tO-DT; Mon, 27 Sep 2021 09:47:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196610.349521; Mon, 27 Sep 2021 09:47:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUnEQ-0006rO-AU; Mon, 27 Sep 2021 09:47:30 +0000
Received: by outflank-mailman (input) for mailman id 196610;
 Mon, 27 Sep 2021 09:47:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ztgo=OR=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mUnEP-0006rI-O9
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 09:47:29 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ecff94cd-1f77-11ec-bc43-12813bfff9fa;
 Mon, 27 Sep 2021 09:47:28 +0000 (UTC)
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
X-Inumbo-ID: ecff94cd-1f77-11ec-bc43-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632736048;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pe2Yv5qXjCbIqx+PwmhV7IzjnJZEO3e5PooDSPv7Se0=;
  b=MVDkrgFau0XkHOB6b5/aZeeBN/OOA8GEkCMuhdl6Ge9IpclMvm3wHVvr
   kDKs6WNtQ2QlDMpKYRAEJ2PC/q5NsJ50ifrgPmgQIQ0/bp+bxC53sLXqU
   sntp/O0hbIkPSKk1drXdEAx0Ki0YTVXcCW2WfTKsQr/vBV3u6D/eRDrn8
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: EGGhILMTlmtiBVsJnK/TGDqlGDuPnfyZHCJnQwjCChIZobt577AuqjWQkSANQgEJIDVoTsRHDn
 tHxhwRuliqPEM00ofNyZYsl28tgVGacgeQQz5q8tqEooia2h4EqztTqHX8YJTI2bK1F70oNkoL
 tkulHGRXWGuwnjrUpCCzOmlngAFrnzCYhj3HieVPJ38PDBgsedFWReVWq1S/W9aPbQgRxtjlYT
 9YG5KjO4hPACGrHMaov1F30HKKOTiInAJtCbcGe2zPcJmN7Cq10AyQKFPgDUDdhRn3s74BkouZ
 mg1nYosIwexmKYBHwg7zOS1e
X-SBRS: 5.1
X-MesageID: 53706513
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:XxP0K6idXHXRunnhnhxzRr5LX1614hcKZh0ujC45NGQN5FlHY01je
 htvWjqGMvqPYGXzc41xOd+39koEu8OAnIQ3HgpqrykxQ34b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0FU/NtTo5w7Rg2t8y3oDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /0QuJW3eSwjBpHU2/8MQyAJSQtdYY9JreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHiOp8fvXdxiynUF/88TbjIQrnQ5M8e1zA17ixLNauFO
 JJHNGM0BPjGSzoTJ3JJCos9oPuPqCTkQhFahUOrpbVitgA/yyQuieOwYbI5YOeiXt5Jl0yVo
 mbH+WXRARwAMtGbjz2f/RqEmevnjS79HoUIG9WQ5vNsxVGe2GEXIBkXTkeg5+m0jFakXNBSI
 FBS/TAhxYAw/kG2Stj2XzWjvWWJ+BUbXrJ4EvI4wBGAzLLO5ASUDXRCSSROAPQkqcs3SDoCx
 lKP2dTzClRSXKa9ECzHsO3O9HXrZHZTfTRqiTI4oRUtvtTqp7EYhCrzVpV4Ab6M34ffOm3Sz
 GXfxMQhvIk7gckO3qS92FnIhTOwu5TEJjIIChXrsnGNtF0gO9/8D2C8wR2Lta8fcNbxokyp5
 iBspiSI0AwZ4XhhfgSjR/8RVJWg+vqIKjHVhVMH83IJrG/2oy/LkWy9+lhDyKZV3iQsJWGBj
 Kz741o5CHpv0J2CNvYfj2WZUZhC8EQYPY65Ps04l/IXCnSLSCeJ/Tt1eWmb1H33nU4nnMkXY
 MnAK5j8VCpLV/Q9llJaotvxN5dwn0jSIkuJGfjGI+mPi+LCNBZ5t59fWLdxUgzJxPzd+1iEm
 zquH8CL1w9eQIXDjtr/q+YuwaQxBSFjX/je8pUPHsbae1YOMDxxWpf5nOJ6E6Q4zvs9qws91
 izkMqOu4AGk3iOvxMTjQi0LVY4Dqr4l9i9kYXxwYwz4s5XhCK72hJoim1IMVeFP3IReITRcE
 pHpou2MXaZCTCrp4TMYYcWvpYBubk3z1wmPIzCkcH40eJs5H17F/drtfw3O8igSD3Xo6Zti8
 uP4jg6LE4AeQwlCDdrNbK79xV2GonVAyvl5WFHFI4cPdRy0opRqMSH4ktQ+P9oIdUfY3jKf2
 gvPWUUYqODBrpUb6t7MgazY/Y6lH/EnRhhRHnXB7KbwPi7fpzLxzYhFWeeOXDbcSGKrp/nyO
 bQLl6nxaaRVkkxLvoxwF6dQ4Zg/v9a/9aVHyglEHWnQawj5AL1XPXTbj9JEsbdAx+EFtFLuC
 F6P4NRTJZ6AJNjhTAwKPAMgY+mOiaMUlz3V4ahnKUn2/nYqrr+OUEEUNBiQki1NarByNdp9k
 +smvccX7S25iwYrbYna3nwFqTzUIyxSSbgju7EbHJTv21gixVx1aJDBDjP7vcOUYNJWP0h2e
 jKZicIuXViHKpYup5brKUXw4A==
IronPort-HdrOrdr: A9a23:LbFiKamRWS5VsOI2Nkcxs5n/tLjpDfIu3DAbv31ZSRFFG/Fxl6
 iV/cjz8SWE7wr5OUtQ/exoV5PtfZqxz/FICMwqTNGftWrdyQ6VxeNZnOjfKlTbckWUnINgPO
 VbAspD4bXLfCFHZK3BgDVQfexP/OW6
X-IronPort-AV: E=Sophos;i="5.85,326,1624334400"; 
   d="scan'208";a="53706513"
Date: Mon, 27 Sep 2021 10:46:28 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v3] xen: rework `checkpolicy` detection when using
 "randconfig"
Message-ID: <YVGS9K1XqNpyxAxe@perard>
References: <20210908111727.440265-1-anthony.perard@citrix.com>
 <bb40484f-fbfb-a206-fa98-0e927f5398fa@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <bb40484f-fbfb-a206-fa98-0e927f5398fa@suse.com>

On Thu, Sep 16, 2021 at 05:34:00PM +0200, Jan Beulich wrote:
> On 08.09.2021 13:17, Anthony PERARD wrote:
> > --- a/Config.mk
> > +++ b/Config.mk
> > @@ -137,12 +137,6 @@ export XEN_HAS_BUILD_ID=y
> >  build_id_linker := --build-id=sha1
> >  endif
> >  
> > -ifndef XEN_HAS_CHECKPOLICY
> > -    CHECKPOLICY ?= checkpolicy
> > -    XEN_HAS_CHECKPOLICY := $(shell $(CHECKPOLICY) -h 2>&1 | grep -q xen && echo y || echo n)
> > -    export XEN_HAS_CHECKPOLICY
> > -endif
> 
> Is there a particular reason to go from XEN_HAS_CHECKPOLICY to ...
> 
> > --- a/xen/Makefile
> > +++ b/xen/Makefile
> > @@ -17,6 +17,8 @@ export XEN_BUILD_HOST	?= $(shell hostname)
> >  PYTHON_INTERPRETER	:= $(word 1,$(shell which python3 python python2 2>/dev/null) python)
> >  export PYTHON		?= $(PYTHON_INTERPRETER)
> >  
> > +export CHECKPOLICY	?= checkpolicy
> > +
> >  export BASEDIR := $(CURDIR)
> >  export XEN_ROOT := $(BASEDIR)/..
> >  
> > @@ -178,6 +180,8 @@ CFLAGS += $(CLANG_FLAGS)
> >  export CLANG_FLAGS
> >  endif
> >  
> > +export HAS_CHECKPOLICY := $(call success,$(CHECKPOLICY) -h 2>&1 | grep -q xen)
> 
> ... HAS_CHECKPOLICY? As soon as things get put in the environment,

Not really anymore, it's just left over from having put this in Kconfig
in previous version of the patch.

> I'm always suspecting possible name collisions ...

Yes, it's probably better to keep the XEN_ prefix.

> > @@ -189,14 +193,24 @@ ifeq ($(config-build),y)
> >  # *config targets only - make sure prerequisites are updated, and descend
> >  # in tools/kconfig to make the *config target
> >  
> > +# Create a file for KCONFIG_ALLCONFIG which depends on the environment.
> > +# This will be use by kconfig targets allyesconfig/allmodconfig/allnoconfig/randconfig
> > +filechk_kconfig_allconfig = \
> > +    $(if $(findstring n,$(HAS_CHECKPOLICY)),echo 'CONFIG_XSM_FLASK_POLICY=n';) \
> > +    $(if $(KCONFIG_ALLCONFIG), cat $(KCONFIG_ALLCONFIG), :)
> 
> Nit: It would be nice if you were consistent with the blanks after
> commas in $(if ...). Personally I'm also considering $(if ...)s the
> more difficult to follow the longer they are. Hence for the 2nd one
> I wonder whether
> 
>     $(if $(KCONFIG_ALLCONFIG),cat,:) $(KCONFIG_ALLCONFIG)
> 
> wouldn't be easier to read.

How about:

    $(if $(KCONFIG_ALLCONFIG), cat $(KCONFIG_ALLCONFIG);) \
    :

.. instead, as that would be more consistent with the previous line,
that is there would be only one branch to the $(if ) and no else, and
thus probably easier to read.

> > +.allconfig.tmp: FORCE
> > +	set -e; { $(call filechk_kconfig_allconfig); } > $@
> 
> Is there a particular reason for the .tmp suffix?

Yes, .*.tmp are already ignored via .gitignore.

Thanks,

-- 
Anthony PERARD

