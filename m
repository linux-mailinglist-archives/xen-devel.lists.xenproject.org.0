Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FBB44D9D1
	for <lists+xen-devel@lfdr.de>; Thu, 11 Nov 2021 17:06:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224805.388310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlCZO-00035E-Ql; Thu, 11 Nov 2021 16:04:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224805.388310; Thu, 11 Nov 2021 16:04:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlCZO-00032W-Mw; Thu, 11 Nov 2021 16:04:58 +0000
Received: by outflank-mailman (input) for mailman id 224805;
 Thu, 11 Nov 2021 16:04:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6S8D=P6=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mlCZN-00032Q-2O
 for xen-devel@lists.xenproject.org; Thu, 11 Nov 2021 16:04:57 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b1d94fb-4309-11ec-9787-a32c541c8605;
 Thu, 11 Nov 2021 17:04:54 +0100 (CET)
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
X-Inumbo-ID: 1b1d94fb-4309-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636646694;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jzt3iLkfGm8Seg3dbo9owiWRM6tdxsiliPIy4rV4sH0=;
  b=fMB93JxKeTHEn8qWJSCUvfOaYzHShwBy7rS2+7JvLzT2WsbMWLWmMFGy
   JXIXHmfWpPNVDqe4OwBgThPNMX74+cNlD3ozeradXPHl01gCk85fKEuNs
   34BoSiYBEUi05aQa2OUAqhdH5iC0qc6lni2LNWav5B+7tL0O/gdMYyIP/
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: JWe+8uhq33k9f5OneyswnZc7zdlRqug28PkSh7VsEP3fTAGnK+D0Gp/CTjnkQEoke2w07mER/n
 kcFzFonGcrbtwb7yR+EUWzL6ZbEOwGF3qCyPKNTj1YNmwC0KK30JJOytLIpa3qd1v3R9u/qP97
 28GqIxYlhdyojcR+kT6OjA5V+deujqkD75+q1yj2cQrWsg7F/A5T+C5MapbegO59CH7J+h1JBS
 O+smYgLuWnfBdKqLZR3Kn8rI5aSQ4ESOumy2qG0yfUlGl45fm4UV3yrBffayWbuHIINWcGbnQV
 RPhsenn+irhfZhbqwtizHw4/
X-SBRS: 5.1
X-MesageID: 59582803
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:LiPyXqlsw0QXpN9D3R7/I+Lo5gwRIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIWCmnSMvfYYzfzc4pya9y28UIP6pTWmtZjHgo6qioyEyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA187IMsdoUg7wbdg29cx2YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 OpNroPhTCMUB73nlrkCbkRASRpaMKITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBMDtIIMYvGAm1TzDBOwqaZvCX7/L9ZlT2zJYasVmQKeDN
 5BJMWEHgBLoWzJjHEYGNp8Ejr2hq3CkWhF0iAqSjP9ii4TU5FMoi+W8WDbPQfSIWMFUk0Cwt
 m/AuWPjDXkyL8eDwDCI9natgO7nni7hXo8WUrqi+ZZCn1m71mEVThoMWjOTo/O0l0q/UNJ3M
 FEP92wlqq1a3E6kVN7mRDWjvWWJ+BUbXrJ4A+A8rQ2A1KfQywKYHXQfCC5MbsQ8s807TiBs0
 UWG9/voGj5HoLCTUWia9LqfsXW1Iyd9EIMZTXZaF01fuYCl+dxtyEKUJjp+LEKrpuL1Ai6hx
 hS3lTgViegMsJMTjZ6f8F+S1lpAuaP1ZgIy4wzWWEes4QV4eJOpauSU1LTL0RpTBN3HFwfc5
 RDoj+DbtblTVs/VyERhVc1UROnxj8tpJgEwlrKG83MJ0z22s0CucolLiN2VDBc4a51UEdMFj
 aK6hO+w2HOxFCf1BUOUS9joYyjP8UQGPY20PhwzRoAeCqWdjCfdoElTibe4hggBanQEn6AlI
 ou8es2xF3scAqkP5GPoHLlAj+50ln1hmjy7qXXHI/KPiOv2iJm9E+dtDbdzRrphsPPsTPv9r
 76zyPdmOz0ACbajM0E7AKYYLEwQLGhTOHwFg5c/SwJ3GSI/QDtJI6aImdsJItU594wIxrag1
 izsASdwlQug7UAr3C3XMxiPnpu0Bs0hxZ/6VARxVWuVN48LPdzysfxBLsRvJtHKNoVLlJZJc
 hXMQO3Yatwnd9gN0251gUDVoNMweRK1qxiJOib5MjEzc4Q5H17C+8P+fxup/y4LV3Llucw7q
 rym9wXaXZtcGFgyUJeIMKqinwGroHwQuONuRE+UcNNdT1rhrdpxICvrg/5pf8xVcUffxiGX3
 hq9CAsDobWfuJc89dTE3PjWr4qgH+ZkMFBdGm3XseS/OSXApzLxyo5cSueYOzvaUTqsqqmlY
 OxUydD6MeEGwwkW49YtTe4zwPtntdX1prJcwgB1J1nxbgymWuF6P32L/chTrakRlLVXjhS7B
 xCU8d5ANLTXZM68SAwNJBAoZ/io3O0PnmWA9uw8JUj36XMl/LeDVkkObRCAhDYEcelwOYIhh
 +wgpNQX+0q0jR9zaoSKiSVd9mKtKH0cUvp46sFGUdGz0gd7mEtfZZH8CzPt5MDdYtpBBUAmP
 zuIifeQnL9b3EfDLyI+GHWlMTCxXnjSVMSmFGM/Gmk=
IronPort-HdrOrdr: A9a23:2c0Ds6uyrE68FYg7yHG5N1rD7skDdNV00zEX/kB9WHVpmszxra
 GTddAgpHjJYVcqKRUdcL+7VJVoLUmyyXcx2/h2AV7AZniChILLFvAA0WKK+VSJcEeSygce79
 YDT0EXMqyIMbEQt6bHCWeDfeod/A==
X-IronPort-AV: E=Sophos;i="5.87,226,1631592000"; 
   d="scan'208";a="59582803"
Date: Thu, 11 Nov 2021 16:04:47 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v2.2 07/15] xen: generate hypercall interface related code
Message-ID: <YY0/H7pPal9tg1Ct@perard>
References: <20211103102059.19621-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211103102059.19621-1-jgross@suse.com>

On Wed, Nov 03, 2021 at 11:20:59AM +0100, Juergen Gross wrote:
> diff --git a/xen/Makefile b/xen/Makefile
> index a3189eb47c..dfdae47e74 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -405,6 +406,7 @@ $(TARGET): delete-unfresh-files
>  	$(MAKE) -f $(BASEDIR)/Rules.mk -C include
>  	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) include
>  	$(MAKE) -f $(BASEDIR)/Rules.mk include/asm-$(TARGET_ARCH)/asm-offsets.h
> +	$(MAKE) -f $(BASEDIR)/Rules.mk include/xen/hypercall-defs.h
>  	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) $@
>  
>  # drivers/char/console.o contains static banner/compile info. Blow it away.
> @@ -466,6 +468,14 @@ include/asm-$(TARGET_ARCH)/asm-offsets.h: asm-offsets.s
>  	  echo ""; \
>  	  echo "#endif") <$< >$@
>  
> +quiet_cmd_genhyp = GEN     $@
> +define cmd_genhyp
> +    awk -f scripts/gen_hypercall.awk <$< >$@
> +endef
> +
> +include/xen/hypercall-defs.h: include/hypercall-defs.i scripts/gen_hypercall.awk FORCE
> +	$(call if_changed,genhyp)
> +

Is there a reason to generate "hypercall-defs.h" here? Could this be
moved to include/Makefile instead?

Then, when moved to include/Makefile, I think you would need to add both
"xen/hypercall-def.h" and "hypercall-defs.i" to $(targets) to avoid them
been rebuilt needlessly.

Thanks,

-- 
Anthony PERARD

