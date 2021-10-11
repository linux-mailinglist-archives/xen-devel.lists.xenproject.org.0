Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E344290FD
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 16:12:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206081.361563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZw2f-0001a3-QD; Mon, 11 Oct 2021 14:12:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206081.361563; Mon, 11 Oct 2021 14:12:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZw2f-0001Xa-M8; Mon, 11 Oct 2021 14:12:37 +0000
Received: by outflank-mailman (input) for mailman id 206081;
 Mon, 11 Oct 2021 14:12:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rMo6=O7=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mZw2e-0001XO-6B
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 14:12:36 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 46de8504-2a9d-11ec-80de-12813bfff9fa;
 Mon, 11 Oct 2021 14:12:35 +0000 (UTC)
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
X-Inumbo-ID: 46de8504-2a9d-11ec-80de-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1633961554;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q9DDiOQc6nS711ZZkf1Afq/jYapjqNbh/eg5pS6gwtc=;
  b=gGqjt10C8Dzd8epz3/cerBxxcrIhVs6nf0YUYog81+FKZPQKquWlBKwe
   5PyCbQh/7ILLIA1tCer+mAZYGC+xspFgNdCDmSyA1yJ5qlvCjrB0xQ4/J
   T+dsHpq5WUZgrRrV/T00uz+1lKeAgWk3lys+5zizTMmSNMBVjPtvoUalf
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: VgVycDkYrk7WxhHFemZzUDg/qA3DK4I+2CGrOLPR4k2k6PkLfHEmP0R3RpD0woCEN4G7xG01yr
 VQnujWJ7BXeevV+oKufdRbQ092PzxXbXSPT7qo2dDcJd72WElw8T4rRY8E/PSjTg9fiDCsCSyl
 Kd11U4UwnIMOJCyEqSCyTPf/pc29Pxrv+0lzj64hIWsOLo0jsiHOnXsIgG+SkxEZFUCukYK3N2
 KgoJmDKLku6xCJaXb/N/UdrndU+OSriWOJgbqiVYoLMz9fBCB1cZNQpAi5hOnEFNBw6m7acHlb
 pcWssJ6DoE7R8cwJWvi77gt1
X-SBRS: 5.1
X-MesageID: 55289248
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Ukimn6xnM4ANKLtnDaJ6t+e6wSrEfRIJ4+MujC+fZmUNrF6WrkUGn
 DdOWm7TOanZZmXxLdh/YY+19EIF78Pdm9NlT1FpqiAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAsLeNYYH1500s6w7dg2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt81ay
 e9LpK2fc1kGBYriptVeXz0HIwgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVors0lMMnsOpJZonx6xCvVJf0nXYrCU+PB4towMDIY250UTaeEO
 5pxhTxHRgndTD1UK0guDtFkkKSZmGnkd2JRkQfAzUYwyzeKl1EguFT3C/LOYcCDT8hRmkeep
 0rF8n7/DxVcM8aQoRKa9lq8i+mJmjn0MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN80igkoLU29UerZsLgRBD+q3mB1jYdRNh4A+A88BuKyKff/0CeHGdsZjxcbN0rsucmSDps0
 UWG9+4FHhQ27ufTEyjEsO7J83XiYkD5MFPuewcZZgo/5cjSj7ttoSnoYOhSU6KR0e3cTGSYL
 y+xkAAygLAajMgu3qq9/Ezajz/EmqUlXjLZ9S2MATr7tlIRiJqNItXyswCCvKkowJOxFwHZ5
 BA5d96iAPfi5H1nvBeGR/kRB/mX7vKBPSy0bbVHTsR5qWrFF5JOe+ltDNBCyKVBbpZsldzBO
 ha7VeZtCHl7ZibCgUhfOdPZNijS5fK8fekJr9iNBja0XrB/dRWc4AZlblOK0mbmnSAEyP9kY
 sfKKZn1VCpEUsyLKQZaoc9Gi9fHIQhklAvuqW3TlUz7gdJymlbEIVv6DLd+Rr9gt/7VyOkk2
 91eK9GL231ivB7WOUHqHXooBQlSdxATXMmuw+QOL7LrClc2SQkJVq6KqZt8KtMNokigvrqRl
 p1LchQDkwSXaLyuAVjiV02Pn5u2Bcwh8ilhYXB1VbtqslB6CbuSAG4kX8NfVdEaGCZLl5aYl
 tEJJJeNBOphUDPC92hPZJXxttU6Jh+qmRiPL2yuZz1mJ8xsQAnA+9nFeArz9XZRUnrr5JVm+
 7DwhBnGRZcjRhh5CJqEYvyY0F7s72MWn/h/XhWUL4ALKlns6oVjNwf4kuQzf5MXMRzGyzbDj
 1SWDB4UqPPjuYgw9NWV16mIo53wS7l1H1ZAHnmd5rGzbHGI8m2myI5GceCJYTGCCz+kpPT8P
 b1YlqiuPucGkVBGt5tHP4xqla9utcHyo7J6zxh/GCmZZVqcFb49cGKN2tNCt/MRy+YB6xe2Q
 E+G5vJTJa6NZJH+CFcUKQcoMraD2PUTlmWA5Pg5Ohyntip+/b7BWkROJRiczidaKeItYo8ix
 O4gvu8Q6hC+1UV2YorX0HgM+jTeNGEEXoUmqooeUd3ihQccw11fZYDRV33t65aVZtQQakQnL
 1d4XkYZa2iwEqYaT0cOKA==
IronPort-HdrOrdr: A9a23:+GrCnqwZeaogAklgDeBcKrPwKL1zdoMgy1knxilNoEpuA6ilfq
 GV/MjzuiWetN98YhsdcLO7WZVoI0myyXcv2/h1AV7KZmCPhILPFuxfBODZrQEIdReTygbzv5
 0QFJSXpLfLfDtHZWeR2njbL+od
X-IronPort-AV: E=Sophos;i="5.85,364,1624334400"; 
   d="scan'208";a="55289248"
Date: Mon, 11 Oct 2021 15:11:59 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v7 16/51] build: generate "include/xen/compile.h"
 with if_changed
Message-ID: <YWRGL6DiSfxOl5iw@perard>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-17-anthony.perard@citrix.com>
 <e895337f-e640-f7ea-2737-036797fc939a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e895337f-e640-f7ea-2737-036797fc939a@suse.com>

On Thu, Oct 07, 2021 at 04:55:01PM +0200, Jan Beulich wrote:
> On 24.08.2021 12:50, Anthony PERARD wrote:
> > --- a/.gitignore
> > +++ b/.gitignore
> > @@ -332,7 +332,6 @@ xen/include/compat/*
> >  xen/include/config/
> >  xen/include/generated/
> >  xen/include/public/public
> > -xen/include/xen/*.new
> 
> While this indeed looks to only have been here for compile.h, I'm
> not convinced it is a good idea to delete the entry here. Does it
> cause any harm if left in place?

That's a complicated question. I would prefer to have in this file only
artefacts of the build system but other developer and maintainer
disagree. So it's fine I guess to leave the entry, it just hide any
*.new file from `git status` and make it harder to commit them.

> > --- a/xen/Makefile
> > +++ b/xen/Makefile
> > @@ -368,7 +368,7 @@ _clean: delete-unfresh-files
> >  		-o -name "*.gcno" -o -name ".*.cmd" -o -name "lib.a" \) -exec rm -f {} \;
> >  	rm -f include/asm $(TARGET) $(TARGET).gz $(TARGET).efi $(TARGET).efi.map $(TARGET)-syms $(TARGET)-syms.map *~ core
> >  	rm -f asm-offsets.s arch/*/include/asm/asm-offsets.h
> > -	rm -f .banner
> > +	rm -f .banner include/xen/compile.h
> 
> Isn't this redundant with ...
> 
> > @@ -425,10 +419,16 @@ include/xen/compile.h: include/xen/compile.h.in .banner
> > +
> > +include/xen/compile.h: include/xen/compile.h.in .banner FORCE
> >  	@cat .banner
> > -	@sed -rf tools/process-banner.sed < .banner >> $@.new
> > -	@mv -f $@.new $@
> > +	$(call if_changed,compile.h)
> > +targets += include/xen/compile.h
> 
> ... this? I would have hoped that $(targets) is included in the
> generic cleaning logic ...

Not yet. It's probably a good idea, I'll work on a patch.

Thanks,

-- 
Anthony PERARD

