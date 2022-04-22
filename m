Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0135250C265
	for <lists+xen-devel@lfdr.de>; Sat, 23 Apr 2022 00:59:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311268.528411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ni2EN-0001ZY-Ra; Fri, 22 Apr 2022 22:58:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311268.528411; Fri, 22 Apr 2022 22:58:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ni2EN-0001WS-Nt; Fri, 22 Apr 2022 22:58:27 +0000
Received: by outflank-mailman (input) for mailman id 311268;
 Fri, 22 Apr 2022 22:58:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pzHF=VA=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1ni2EM-0001WM-5z
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 22:58:26 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b634173e-c28f-11ec-8fc2-03012f2f19d4;
 Sat, 23 Apr 2022 00:58:24 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 23MMw1bM013129
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 22 Apr 2022 18:58:06 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 23MMw0jv013127;
 Fri, 22 Apr 2022 15:58:00 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: b634173e-c28f-11ec-8fc2-03012f2f19d4
Date: Fri, 22 Apr 2022 15:58:00 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 5/5] tools/xl: Fix potential deallocation bug
Message-ID: <YmMy+LaG1RqXMrlb@mattapan.m5p.com>
References: <cover.1640590794.git.ehem+xen@m5p.com>
 <2d1335a4056558d172d9aa3e59982eb761647418.1640590794.git.ehem+xen@m5p.com>
 <YdWzswCszMN1IE20@perard>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YdWzswCszMN1IE20@perard>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

Huh, never got around to replying to this.  Too many things going on, too
many distractions...

On Wed, Jan 05, 2022 at 03:05:23PM +0000, Anthony PERARD wrote:
> On Thu, Dec 10, 2020 at 03:09:06PM -0800, Elliott Mitchell wrote:
> > There is potential for the info and info_free variable's purposes to
> > diverge.  If info was overwritten with a distinct value, yet info_free
> > still needed deallocation a bug would occur on this line.  Preemptively
> > address this issue (making use of divergent info/info_free values is
> > under consideration).
> > 
> > Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
> > ---
> >  tools/xl/xl_info.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
> > index 3647468420..938f06f1a8 100644
> > --- a/tools/xl/xl_info.c
> > +++ b/tools/xl/xl_info.c
> > @@ -579,7 +579,7 @@ int main_list(int argc, char **argv)
> >                       info, nb_domain);
> >  
> >      if (info_free)
> > -        libxl_dominfo_list_free(info, nb_domain);
> > +        libxl_dominfo_list_free(info_free, nb_domain);
> >  
> >      libxl_dominfo_dispose(&info_buf);
> >  
> 
> I don't think this is the right thing to do with this patch.

I disagree with this statement.

> libxl_dominfo_list_free() should use the same variable that is used by
> libxl_list_domain(). What we want to free is the allocation made by
> libxl_list_domain().

I agree with this statement.

> "info_free" in the function seems to be used as a boolean which tell
> if "info" have been allocated or not. Actually, it probably say if
> "info" is a list of "libxl_dominfo" or not.

That may be what the author was thinking when they wrote lines 579 & 580.
Problem is info_free is a pointer to libxl_dominfo, *not* a boolean.

> So instead of just replacing "info" by "info_free" here, we should
> instead store the result from libxl_list_domain() into a different
> variable and free that, like it is done with "info_buf".
> 
> I hope that makes sense?

What you're describing seems to be precisely what the patch does.
Perhaps you got the roles of "info" and "info_free" reversed?

This actually points to an issue on lines 548 & 553.  Instead of storing
the return from libxl_list_domain() into "info" then copying to
"info_free" both should be set at the same time.

I had noticed this (and cringed), but didn't feel it was currently
worthwhile to go after lines 548 & 553.  If you want this additional
change to accept the patch, I'm up for that.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



