Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 448914F13A7
	for <lists+xen-devel@lfdr.de>; Mon,  4 Apr 2022 13:13:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298271.508058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbKdo-0003PI-Fc; Mon, 04 Apr 2022 11:13:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298271.508058; Mon, 04 Apr 2022 11:13:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbKdo-0003NY-BN; Mon, 04 Apr 2022 11:13:00 +0000
Received: by outflank-mailman (input) for mailman id 298271;
 Mon, 04 Apr 2022 11:12:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Xnj=UO=citrix.com=prvs=086167401=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nbKdm-0003Iy-Ve
 for xen-devel@lists.xenproject.org; Mon, 04 Apr 2022 11:12:59 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2daac6d0-b408-11ec-a405-831a346695d4;
 Mon, 04 Apr 2022 13:12:57 +0200 (CEST)
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
X-Inumbo-ID: 2daac6d0-b408-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649070777;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=79qDxru4c++3uxXdUmYexzW+Mtka9KfIZxQrlvhRDFA=;
  b=HdUgbQwSO0Tws6cSc3mF5T9fpposvfxL4fKlJJIgP64LZKFYOzZpNNQ7
   9ab21Ha/fphhrDHm38p6BXuG/014uUowQxYwIlIUgu4DCJXtsD+0/aqVD
   SCM0caK0PXVdLsvLnBlmus4vls8fZPuk8gEhUxqzVhL2/NZtQZAIESnV3
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 67928760
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:jgReRKjBTsvbdjY3A9lUofkZX161TRAKZh0ujC45NGQN5FlHY01je
 htvUWjTbqqLYTb1edt1YYy2pENXvcXXyoNiGwtupCk0Enwb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhX1vR4
 YqaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YVkSPYPdtOhaaBQGQwtYZfNo153XD0Hq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bknhm0THeC+dgWZ3ZSr/GzdRZwC0xloZFGvO2i
 88xN2U+NkSfPUUn1lE/CpVnkL7zvHrGLhYEg0zSlJY15C/M5VkkuFTqGIWMIYHbLSlPpW6Dv
 X7P9Wn9BhAcNfScxCCD/3bqgfXA9QvkXKoCGbv+8eRl6HWR22gSBRs+RVa95/6jhSaWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8U44gyQzqvf4y6CG3MJCDVGbbQbWNQeHGJwk
 AXTxpWwWGIp4Ob9pW+hGqm88wixFzk5ISg5aHFUZy1dvffMgpEdt0eaJjp8K5KdgtrwEDD25
 jmFqikimrke5fI2O7WHEUPv2Gz1+MWQJuIhzkCOBz/+sFslDGKwT9bwgWU3+8qsO2pworOpm
 HEf0/aT4+kVZX1mvHzcGb5ddF1FChvsDdE9vbKNN8R6n9hO0yT6FWy13N2YDB00WirjUWW0C
 HI/QSsLuPdu0IKCNMebmb6ZBcUw1rTHHt/4TP3SZdcmSsEvKF7fpnkyOBLLgzyFfK0QfUcXY
 8rznSGEVyhyNEia5GDuG7d1PUEDmEjSOl8/tbiklk/6gNJylVaeSKsfMUvmUwzKxPjsnekhy
 P4Gb5Hi40wGCIXWO3CLmaZOfQFiBSVqXvje9p0IHtNv1yI7QQnN/deKmuh/E2Gk9owI/tr1E
 oaVARQHmAKm1SSYcW1nqBlLMdvSYHq2llpjVQREALpi8yNLjVqHhEvHS6YKQA==
IronPort-HdrOrdr: A9a23:reG6BKCHHi4XrGjlHemU55DYdb4zR+YMi2TC1yhKKCC9Vvbo8P
 xG+85rsyMc6QxhPE3I9urtBEDtexzhHNtOkPAs1NSZLWzbUQmTXeJfBOLZqlWKcUDDH6xmpM
 VdmsBFeaXN5DNB7foSjjPXL+od
X-IronPort-AV: E=Sophos;i="5.90,234,1643691600"; 
   d="scan'208";a="67928760"
Date: Mon, 4 Apr 2022 12:12:51 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 2/2] tools/firmware: do not add a .note.gnu.property
 section
Message-ID: <YkrSs7DtAh95ndOZ@perard.uk.xensource.com>
References: <20220404104044.37652-1-roger.pau@citrix.com>
 <20220404104044.37652-3-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220404104044.37652-3-roger.pau@citrix.com>

On Mon, Apr 04, 2022 at 12:40:44PM +0200, Roger Pau Monne wrote:
> Prevent the assembler from creating a .note.gnu.property section on
> the output objects, as it's not useful for firmware related binaries,
> and breaks the resulting rombios image.
> 
> This requires modifying the cc-option Makefile macro so it can test
> assembler options (by replacing the usage of the -S flag with -c) and
> also stripping the -Wa, prefix if present when checking for the test
> output.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v1:
>  - Add the option to CFLAGS.
> ---
>  Config.mk               | 2 +-
>  tools/firmware/Rules.mk | 4 ++++
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Config.mk b/Config.mk
> index f56f7dc334..82832945e5 100644
> --- a/Config.mk
> +++ b/Config.mk
> @@ -91,7 +91,7 @@ PYTHON_PREFIX_ARG ?= --prefix="$(prefix)"
>  #
>  # Usage: cflags-y += $(call cc-option,$(CC),-march=winchip-c6,-march=i586)
>  cc-option = $(shell if test -z "`echo 'void*p=1;' | \
> -              $(1) $(2) -S -o /dev/null -x c - 2>&1 | grep -- $(2) -`"; \
> +              $(1) $(2) -c -o /dev/null -x c - 2>&1 | grep -- $(2:-Wa$(comma)%=%) -`"; \
>                then echo "$(2)"; else echo "$(3)"; fi ;)

Hopefully, changing "-S" to "-c" in this macro will not break anything.
I would be of the opinion to create a new macro which deal with
assembler options. But if that works and doesn't changes CFLAGS in the
testing we do in GitLab, I guess that would be OK.

Whether you introduce a macro or keep this one:
Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

