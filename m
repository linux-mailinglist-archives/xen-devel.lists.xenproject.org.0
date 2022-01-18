Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A18E0492B1B
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 17:22:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258608.445577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9rF9-0006pV-2y; Tue, 18 Jan 2022 16:21:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258608.445577; Tue, 18 Jan 2022 16:21:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9rF8-0006mc-Vi; Tue, 18 Jan 2022 16:21:58 +0000
Received: by outflank-mailman (input) for mailman id 258608;
 Tue, 18 Jan 2022 16:21:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4BW1=SC=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1n9rF6-0006mW-Up
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 16:21:56 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf9a2b69-787a-11ec-a115-11989b9578b4;
 Tue, 18 Jan 2022 17:21:55 +0100 (CET)
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
X-Inumbo-ID: bf9a2b69-787a-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642522915;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cwPQlDwWU3IB3UlzNCSViyJ1tqa02RhqE+hVPqHbGOQ=;
  b=herKAHsz1xmCWd5hS3VDAbxlwcgL6GL5zupFx1KI0H3Oz8JoGCG1ir0E
   T8c3o3N8+DUOQ4KGZn0sFIsivlvHZS1nmRUXqe91LbppWRF/UT2WzzorM
   qK9cBXATQwyl0Vf5QGJAhCrwDOpnG7T9WelpRRpuFhbckM7J5hgpplYsf
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Rh3eWGnNFzhivLJzHitEowFhLZEiq+PQsNlZTaZE1d9E94wXKo7P2PO2CJQUyznkZ7ctFOHtfU
 SaRlKmcIyby1SGYZAxzFxg8ycFwpLb7Tvc/jDY3eJsUE1JcmU3cpT/81k2deYzxRlnEc040Fsq
 tUMTxWcZH2BQJuQEBotnhymsw35vPEvFJtqnEcYOODhBxhaUQjvQ45fv1X26rIOkgAUeUWKXyR
 bFwPf8nT20JRikZ1VYF2LTlR0wWqPD7g3d122HAA9e4Oq3I9KgkSwzs040SA5NwZnY5OWdYYar
 cJMY/ZV+mAvK38rnY39KtZA9
X-SBRS: 5.2
X-MesageID: 62156418
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:bi9kWq4B9NYhSo6bYoDQkwxRtHnBchMFZxGqfqrLsTDasY5as4F+v
 mobD2CGMvjZZjD2KIp0Oonjph9QsMLTzNZhSgRp/Cs2Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZg294w2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zy
 9lUlbXvdxcQGqz8nbQkbzR2My9sIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gQR6+DO
 ZZAOVKDajztfCxLOgsxNahikd+E3HPkNAZ0j2ya8P9fD2/7k1UqjemF3MDuUuKNQcJZj0OJv
 FXs9m7yAgwZHNGHwD/D+XWp7sfQmQvrVYRUE6e3ntZ6jVvWymENBRk+UVqgveL/mkO4Q8hYK
 UEf5mwpt6da3EamVMXnVhu05nuNpAcBWsF4Gvc/rgqKz8L84hmbLngJSCZbb94rv9NwQiYlv
 neLld70AT1ksJWOVGmQsLyTqFuaIjMJJGUPYSsFSwot4NT5pow3yBXVQb5LErOxj9DzMSH9x
 XaNtidWulkIpZdVjePhpwmB2m/y4MiSJuIo2unJdmGp9yNQO7C1Xqip2V2L1MptAqaXXEbU6
 RDohPOixOwJCJiMkgmET+MMAKyl6p65DdHMvbJ8N8J/rmrwohZPaagVuWgjfxkxbq7obBewO
 BeL0T698qO/K5dDgUVfR4uqQ/onwqH7fTgOfqCFN4EeCnSdmeLuwc2PWaJy9z21+KTPuftmU
 Xt+TSpKJSxFYUiA5GDnL9rxKZdxmkgDKZr7HPgXNSiP37uEf2KyQrwYKlaIZe1RxPra/F+Jr
 4oOaZfRkUg3vAjCjs//q9F7wbcidylTOHwLg5YPKr7rzvRORQnN9MM9MZt+Itc4zsy5Z8/D/
 22nW18w9bYMrSavFOl+UVg6MOmHdc8m9RoTZHVwVX71hSRLSdvxvc83KstmFZF6pbcL5aMlE
 JE4lzCoX64npsLvoWpNNPEQbeVKKXyWuO55F3H0P2hkIc8xHlyhFx2NVlKHyRTixxGf7aMWy
 4BMHCuCKXbabwg9XsvQdty1yFa94SoUlO5oBhOaKdhPYkT8toNtLnWp3PMwJsgNLzTFxyebi
 FnKUUtJ+7GVrt9n6sTNiICFs5ytT7l0EH1FEjSJ9r2xLyTboDaumNcSTOaScDnBf2ro46H+N
 /5NxvTxPaRfzlZHuoZxCZhxyqc664e9rrNW1F08Tn7Kc06qGvVrJXzfhZtDsahEx7l4vwqqW
 x3QpokGaOvRYM68SQwfPgsoaOiHxMo4oDiK4KRnOlj+6Q924KGDDRdYMS6ThXEPN7ByKo4kn
 7ss4ZZE9wylhxM2Gd+alSQIpX+UJ3kNXqh75JEXBIjn1lgixl1YOMGODyb35NeEaslWM1lsK
 TiR3fKQi7NZz0vEUnwyCXmSgrYN2cVQ4EhHnA0YOlCEutvZnftmjhRe/AM+QhlR0hgagfl4P
 XJmNhEtKKiDl9uyaBOvg4x499l9OSCk
IronPort-HdrOrdr: A9a23:WhwAG6qnNrdyWMyassCRiYIaV5oreYIsimQD101hICG8cqSj+f
 xGuM5rsSMc6QxhPU3I9ursBEDtex/hHNtOkO4s1NSZLWvbUQmTTL2KhLGKq1aLJ8S9zJ8/6U
 4JSdkZNDSaNzlHZKjBjzWFLw==
X-IronPort-AV: E=Sophos;i="5.88,297,1635220800"; 
   d="scan'208";a="62156418"
Date: Tue, 18 Jan 2022 16:21:48 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?=
	<roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v8 27/47] build: grab common EFI source files in arch
 specific dir
Message-ID: <YebpHJk1JIArcdvW@perard>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-28-anthony.perard@citrix.com>
 <57f03aed-c260-1c80-c604-0223d4603b4a@suse.com>
 <YeafMh0du+5K8YDD@perard>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YeafMh0du+5K8YDD@perard>

On Tue, Jan 18, 2022 at 11:06:38AM +0000, Anthony PERARD wrote:
> On Tue, Dec 21, 2021 at 02:53:49PM +0100, Jan Beulich wrote:
> > On 25.11.2021 14:39, Anthony PERARD wrote:
> > > +$(obj)/%.c: $(abs_srctree)/common/efi/%.c FORCE
> > > +	$(Q)ln -nfs $< $@
> > 
> > Like was the case before, I think it would be better if the links were
> > relative ones, at least when srctree == objtree (but ideally always).
> 
> I can give it a try.

How about:
    ln -nfs $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))/$(if $(building_out_of_srctree),source/)common/efi/$(<F) $@

This will result in the relative path "../../../common/efi/runtime.c"
for in-tree builds, and "../../../source/common/efi/runtime.c" for
out-of-tree builds. There's a "source" symlink that can be used which
point to the source tree when doing out-of-tree builds.

The part:
    $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))
means that if $(obj) were to be something other than "arch/*/efi", the
command would still works and give the right number of "../".
It does this steps to "arch/x86/efi":
    arch x86 efi
    .. .. ..
    ../../..

The added "source/" depends on whether we do out-of-tree build or not.

-- 
Anthony PERARD

