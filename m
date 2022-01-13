Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4125A48D6A1
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 12:23:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257083.441556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7yBz-000599-IF; Thu, 13 Jan 2022 11:22:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257083.441556; Thu, 13 Jan 2022 11:22:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7yBz-00056n-Eb; Thu, 13 Jan 2022 11:22:55 +0000
Received: by outflank-mailman (input) for mailman id 257083;
 Thu, 13 Jan 2022 11:22:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GUHC=R5=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1n7yBy-00056g-BQ
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 11:22:54 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 241097eb-7463-11ec-a563-1748fde96b53;
 Thu, 13 Jan 2022 12:22:51 +0100 (CET)
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
X-Inumbo-ID: 241097eb-7463-11ec-a563-1748fde96b53
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642072971;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gLv3QU/ED4FnN8pI9uIsb1oYMySqPBbBAcAZCQyTsrg=;
  b=J/az6FwBr4a0UBX4U2qoSHcfuFDJnJskhhbxoqdSkVN8jwIbH+huVnXt
   dIFvDQf+UW+mR4MByfsaNmlmV2UQbHDQyBsAVseeUTPtBWuPDAEsVakZw
   q77ddVrEooJ0ie0OAkmxAxRAntk+D2InMPYcMvxL8+tCPtlRCqfQ4qLjS
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: XLFbTPXtLHGPZQGZu7Xgsclu28YyXT9HxO5qPg+EuH8OV/+B/woIhVo+JtIm6jM4+ZtrIXFiS9
 WuvIsX4OHyk3k6fGACFTy/WdCz87UIdHlp5igflknAcbAUOBmWatLcnvSXX59g15Y1ZeJu4a/Q
 Y4j3MKBv1bOdnJqxfGJDT9NVCt1iEYFm1rGvmRTab9IjuEP+3cCRxqSN3dqGiL9tAfEiqqdYmh
 3pHnjzBBLTZc+JQO6pT0NCsifTaF/eix9TpmqKidlN8BRUcyW22mLUXjZXwlGpppUd6dHii7/6
 hlhc18Isctx726ZbL4UEDzUx
X-SBRS: 5.2
X-MesageID: 64035930
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:20wJqaN1j1vPc8HvrR1ZkMFynXyQoLVcMsEvi/4bfWQNrUoq1WAGn
 WFLWzvVMvyPZmr1f9slaISwpxkD7Z6Dz4dhHgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En150Es4w7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYowyyovdp9
 4RJiZePdy0XOvP9kt0wSSANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YuBqmsQkKtitJI4Fs2ts5TrYEewnUdbIRKCiCdpwgmto3Z0fRq62i
 8wxMmdeU0vPOEd0G3glNs0yhNumunPjfGgNwL6SjfVuuDWCpOBr65D2K8bccNGOQcRTn26bq
 3jA8mC/BQsVXPSAzRKV/3TqgfXA9Qv5RYYTGbuQ5vNsxlqJyQQ7ChcbSF+6qvmRkVOlVpRUL
 El80jojq+0++VKmSvH5XgakuziUsxgEQd1SHuYmrgaXxcLpDx2xXzZeCGQbMZp/6ZFwFWdCO
 kK1c83BPAdSl6WqGHah/Yiqhw22ZxkfFEIYXHpRJeca2OXLrIY2hxPJa99sFq+pk9H4cQ3NL
 yC2QDsW3OtK05NSv0mv1RWe2m/3+MCVJuIgzliPBgqYAhVFiJlJjmBCwXzS9r5+IYmQVTFtV
 1BUypHFvIji4Xxg/RFhodnh/pn1tp5p0xWG2DaD+qXNERz3qxZPmqgKsVlDyL9BaJpsRNMQS
 Ba7VfltzJFSJmC2SqR8fpi8Dc8npYC5S4i/DqmPNoQSMsMrHONiwM2ITRTAt4wKuBJ9+ZzTx
 L/BKZr8ZZrkIfkPIMWKqxc1juZwm3FWKZL7TpHn1RW3uYdyl1bOIYrpxGCmN7hjhIvd+V292
 48Ga6OilksDOMWjPHi/2dNDfDgicClgbbir+pM/SwJ2Clc8cI3XI6WPkepJlk0Mt/k9q9okC
 VnmCxAIkwSu1CSXQehIA1g6AI7SsV9EhSpTFUQR0ZyAghDPuK6js/UScYUZZ74i+LAxxPJ4V
 aBdKc6BHu5OWnLM/DFENcvxq4lrdRKKgwOSPnX6PGhjLsA4HwGZqMX5egbP9TUVCnblv8UJv
 LD9hBjQRoAORlo+AZ+OOu6v1V64oVMUhPl2AxnTOtBWdUi1qNpqJiX9g+UZOcYJLRmflDKW2
 xzPWUUTpPXXop9z+97M3PjWo4CsGup4P0xbA2iEsurmaXiEpjKumNYSXvyJcDbRUHLP1J+jP
 egFnevhNPAnnUpRt9YuGbhc0q9jtcDkoKVXz1o4ESyTPUirEL5pPlKPwdJL6v9W3rZctAa7B
 hCP991dNenbMc/pCgdMdg8sb+DF3vAIgDjCq/8yJRyitiNw+bOGV2RUPgWN13MBfOckbtt9z
 LdzotMS5iy+lgEuY4SPgS1j/miRKmANDvc8vZYADY630gcmxzmuu3AH5vMaNH1XV+hxDw==
IronPort-HdrOrdr: A9a23:2kulx6vLPzezvtTbK/U52+tV7skDdtV00zEX/kB9WHVpmszxra
 6TddAgpHvJYVcqKRQdcL+7VZVoLUmxyXcx2/h3AV7AZniFhILLFuFfBOLZqlWKcREWtNQttp
 uIG5IObuEYZmIasS+V2maFL+o=
X-IronPort-AV: E=Sophos;i="5.88,284,1635220800"; 
   d="scan'208";a="64035930"
Date: Thu, 13 Jan 2022 11:22:45 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] build: adjust include/xen/compile.h generation
Message-ID: <YeALhTgXh7g2QdbB@perard>
References: <4f0766b2-cabd-cf5e-ed84-cc2b773bf5f8@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4f0766b2-cabd-cf5e-ed84-cc2b773bf5f8@suse.com>

On Tue, Jan 11, 2022 at 03:16:17PM +0100, Jan Beulich wrote:
> Prior to 19427e439e01 ("build: generate "include/xen/compile.h" with
> if_changed") running "make install-xen" as root would not have printed
> the banner under normal circumstances. Its printing would instead have
> indicated that something was wrong (or during a normal build the lack
> of printing would do so).

So, having several line of logs with one generating "compile.h", and
several object rebuild plus the re-linking of xen isn't enough has to
indicate that something is wrong?

Also, with this patch, the banner would no longer be printed on rebuild,
unless one doesn't try to prevent regeneration of "compile.h" by
exporting two variables.

I kind of like having the banner been nearly always printed, but I'm not
opposed to the change.

> Further aforementioned change had another undesirable effect, which I
> didn't notice during review: Originally compile.h would have been
> re-generated (and final binaries re-linked) when its dependencies were
> updated after an earlier build. This is no longer the case now, which
> means that if some other file also was updated, then the re-build done
> during "make install-xen" would happen with a stale compile.h (as its
> updating is suppressed in this case).

So, the comment:
    Don't refresh this files during e.g., 'sudo make install'
wasn't correct?

On the other hand, it's probably not good to not regen the file when the
prerequisite changes. It's kind of weird to "rm" the target, but I don't
have a better solution at the moment.

> Restore the earlier behavior for both aspects.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> An alternative to removing the target would be to replace "! -r $@" by
> "-n '$?'" in the shell "if", but that would cause unhelpful alteration
> of what gets recorded in include/xen/.compile.h.cmd. (The command
> normally changes every time anyway, due to the inclusion of
> $(XEN_BUILD_TIME), but I consider that different from varying the
> conditions of the "if".)
> 
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -424,6 +424,7 @@ targets += .banner
>  quiet_cmd_compile.h = UPD     $@
>  define cmd_compile.h
>      if [ ! -r $@ -o -O $@ ]; then \
> +	cat .banner; \
>  	sed -e 's/@@date@@/$(XEN_BUILD_DATE)/g' \
>  	    -e 's/@@time@@/$(XEN_BUILD_TIME)/g' \
>  	    -e 's/@@whoami@@/$(XEN_WHOAMI)/g' \
> @@ -441,7 +442,7 @@ define cmd_compile.h
>  endef
>  
>  include/xen/compile.h: include/xen/compile.h.in .banner FORCE
> -	@cat .banner
> +	$(if $(filter-out FORCE,$?),rm -fv $@)

Is there a reason for -v? Do we care if the file existed?

Do we want to log "rm -f compile.h" ? Or could you just prefix the line
with $(Q)?

Thanks,

-- 
Anthony PERARD

