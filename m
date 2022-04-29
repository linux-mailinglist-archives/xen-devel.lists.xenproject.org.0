Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89ED95156B8
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 23:19:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317765.537264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkY1T-0006Jp-RK; Fri, 29 Apr 2022 21:19:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317765.537264; Fri, 29 Apr 2022 21:19:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkY1T-0006I0-O6; Fri, 29 Apr 2022 21:19:31 +0000
Received: by outflank-mailman (input) for mailman id 317765;
 Fri, 29 Apr 2022 21:19:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RDkX=VH=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1nkY1S-0006Hu-Fd
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 21:19:30 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c629d78-c802-11ec-8fc4-03012f2f19d4;
 Fri, 29 Apr 2022 23:19:28 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 23TLJ8rI060470
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 29 Apr 2022 17:19:14 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 23TLJ7RB060469;
 Fri, 29 Apr 2022 14:19:07 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 0c629d78-c802-11ec-8fc4-03012f2f19d4
Date: Fri, 29 Apr 2022 14:19:07 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] tools/xl: Sort create command options
Message-ID: <YmxWS8DZcUKuDZw0@mattapan.m5p.com>
References: <cover.1650422517.git.ehem+xen@m5p.com>
 <c145a7648025e9bbc2f47ab8bd5839c80c01933f.1650422518.git.ehem+xen@m5p.com>
 <YmuyT0/8Mfa0eM1b@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YmuyT0/8Mfa0eM1b@perard.uk.xensource.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

On Fri, Apr 29, 2022 at 10:39:27AM +0100, Anthony PERARD wrote:
> On Tue, Apr 19, 2022 at 06:56:03PM -0700, Elliott Mitchell wrote:
> > Hopefully simplify future changes by sorting options lists for
> > `xl create`.
> 
> I'm not sure that sorting options make changes easier, as it would mean
> one has to make sure the new option is sorted as well ;-). But sorting
> the options in the help message is probably useful; I've looked at a few
> linux utilities and they tend to have them sorted so doing this for xl
> create sound fine.

This ends up revolving around the question, is the work involved in
keeping things sorted more or less than the annoyance caused by having
them unsorted?  I tend towards keep them sorted since I find trying to
identify available option letters when they're in random order is rather
troublesome.

> > Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
> > ---
> > diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
> > index 435155a033..2ec4140258 100644
> > --- a/tools/xl/xl_vmcontrol.c
> > +++ b/tools/xl/xl_vmcontrol.c
> > @@ -1169,13 +1169,13 @@ int main_create(int argc, char **argv)
> >      int paused = 0, debug = 0, daemonize = 1, console_autoconnect = 0,
> >          quiet = 0, monitor = 1, vnc = 0, vncautopass = 0, ignore_masks = 0;
> >      int opt, rc;
> > -    static struct option opts[] = {
> > +    static const struct option opts[] = {
> 
> Could you add a note in the commit message that "opts" is now
> const?

Okay.

> > +        {"defconfig", 1, 0, 'f'},
> >          {"dryrun", 0, 0, 'n'},
> > +        {"ignore-global-affinity-masks", 0, 0, 'i'},
> >          {"quiet", 0, 0, 'q'},
> > -        {"defconfig", 1, 0, 'f'},
> >          {"vncviewer", 0, 0, 'V'},
> >          {"vncviewer-autopass", 0, 0, 'A'},
> > -        {"ignore-global-affinity-masks", 0, 0, 'i'},
> >          COMMON_LONG_OPTS
> >      };
> >  
> > @@ -1186,12 +1186,15 @@ int main_create(int argc, char **argv)
> >          argc--; argv++;
> >      }
> >  
> > -    SWITCH_FOREACH_OPT(opt, "Fnqf:pcdeVAi", opts, "create", 0) {
> > -    case 'f':
> > -        filename = optarg;
> > +    SWITCH_FOREACH_OPT(opt, "Ffnq:AVcdeip", opts, "create", 0) {
> 
> The list of short options aren't really sorted here. Also -q doesn't
> take an argument, but -f should keep requiring one.

Needed to reread the documentation on getopt() behavior.  I remembered
it being group before the colon didn't take options, ones after colon
did take options.  Instead it is colon for every option with argument.

Other issue is dictionary sort versus ASCII sort.  ie "AaBbCcDdEeFf..."
versus "A-Za-z".


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



