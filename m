Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A38151597C
	for <lists+xen-devel@lfdr.de>; Sat, 30 Apr 2022 03:06:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317909.537453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkbZ3-0001CR-DV; Sat, 30 Apr 2022 01:06:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317909.537453; Sat, 30 Apr 2022 01:06:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkbZ3-0001Ac-AR; Sat, 30 Apr 2022 01:06:25 +0000
Received: by outflank-mailman (input) for mailman id 317909;
 Sat, 30 Apr 2022 01:06:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yLwW=VI=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1nkbZ1-0001AW-I6
 for xen-devel@lists.xenproject.org; Sat, 30 Apr 2022 01:06:23 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be3da917-c821-11ec-a405-831a346695d4;
 Sat, 30 Apr 2022 03:06:21 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 23U1678B061213
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 29 Apr 2022 21:06:13 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 23U1643g061212;
 Fri, 29 Apr 2022 18:06:04 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: be3da917-c821-11ec-a405-831a346695d4
Date: Fri, 29 Apr 2022 18:06:04 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/2] tools/xl: Allow specifying JSON for domain
 configuration file format
Message-ID: <YmyLfNB07ff81e6n@mattapan.m5p.com>
References: <cover.1650422517.git.ehem+xen@m5p.com>
 <09213ac26738ee51401b454534c6b437766481b7.1650422518.git.ehem+xen@m5p.com>
 <YmvbYHbmfXYx47r2@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YmvbYHbmfXYx47r2@perard.uk.xensource.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

On Fri, Apr 29, 2022 at 01:34:40PM +0100, Anthony PERARD wrote:
> On Tue, Apr 19, 2022 at 06:23:41PM -0700, Elliott Mitchell wrote:
> > JSON is currently used when saving domains to mass storage.  Being able
> > to use JSON as the normal input to `xl create` has potential to be
> > valuable.  Add the functionality.
> 
> "potential", right, but it isn't hasn't been really tested. When
> implemented, I think the intend of the json format was for libxl to
> communicate with itself while migrating a guest (or save/restore). It
> would be nice to know if it actually can work.

What I wonder is why the behind the scenes format is flexible enough to
fully handle domain configuration, yet wasn't reused for domain
configuration.  Then I look at the parser for domain configuration files
and it isn't really that great.

Add those two together and moving towards domain configuration files
being JSON seems natural.  Look at the "vif" and "disk" sections.  Those
could be very naturally handled as JSON, while the current parser isn't
rather limited.

There may be need to modify libxl_domain_config_from_json() to ensure it
gives good error messages.

> > Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
> > ---
> > diff --git a/tools/xl/xl.h b/tools/xl/xl.h
> > index c5c4bedbdd..a0c03f96df 100644
> > --- a/tools/xl/xl.h
> > +++ b/tools/xl/xl.h
> > @@ -49,6 +49,11 @@ struct domain_create {
> >      int migrate_fd; /* -1 means none */
> >      int send_back_fd; /* -1 means none */
> >      char **migration_domname_r; /* from malloc */
> > +    enum {
> > +        FORMAT_DEFAULT,
> > +        FORMAT_JSON,
> > +        FORMAT_LEGACY,
> > +    } format;
> 
> I think the name "format" here is too generic, we are in the struct
> "domain_create" and this new format field isn't intended to specify the
> format of the domain. I think "config_file_format" would be better, as
> it is only used for the format of the config_file.

What about "config_format" to match below?

> Also I don't think having "_DEFAULT" would be useful, we need to know
> what the format is intended to be before starting to parse the file, and
> I don't think changing the default is going to work. So for the enum, we
> could have "_LEGACY = 0".
> 
> The prefix "FORMAT_" feels a bit generic, maybe "CONFIG_FORMAT_" would
> be better, or something else.

Okay.

Over time the default can be changed.  Document plans to move to JSON
exclusively.  Then after a few versions switch the default.  Then after
more versions remove the old format.

> >  };
> >  
> >  int create_domain(struct domain_create *dom_info);
> > diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
> > index f546beaceb..04d579a596 100644
> > --- a/tools/xl/xl_cmdtable.c
> > +++ b/tools/xl/xl_cmdtable.c
> > @@ -31,6 +31,8 @@ const struct cmd_spec cmd_table[] = {
> >        "-h                      Print this help.\n"
> >        "-p                      Leave the domain paused after it is created.\n"
> >        "-f FILE, --defconfig=FILE\n                     Use the given configuration file.\n"
> > +      "-j, --json              Interpret configuration file as JSON format\n"
> > +      "-J                      Use traditional configuration file format (current default)\n"
> 
> I don't think this new "-J" option would be useful, just the "-j" should be
> enough.

I was thinking of this as a transition mechanism.  Have "-J" for when the
default has been changed, but the code to handle the original format
hasn't been removed.

> >        "-n, --dryrun            Dry run - prints the resulting configuration\n"
> >        "                         (deprecated in favour of global -N option).\n"
> >        "-q, --quiet             Quiet.\n"
> > diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
> > index 2ec4140258..41bd919d1d 100644
> > --- a/tools/xl/xl_vmcontrol.c
> > +++ b/tools/xl/xl_vmcontrol.c
> > @@ -789,7 +789,7 @@ int create_domain(struct domain_create *dom_info)
> >                  extra_config);
> >          }
> >          config_source=config_file;
> > -        config_in_json = false;
> > +        config_in_json = dom_info.format == FORMAT_JSON ? true : false;
> 
> This doesn't build, "dom_info" is a pointer.
> 
> Also, "? true : false;" is weird in C.

Uh, yeah.  Too many different coding standards.  Plus things being
passed around.  Erk.  %-/

> >      } else {
> >          if (!config_data) {
> >              fprintf(stderr, "Config file not specified and"
> > @@ -1173,6 +1173,7 @@ int main_create(int argc, char **argv)
> >          {"defconfig", 1, 0, 'f'},
> >          {"dryrun", 0, 0, 'n'},
> >          {"ignore-global-affinity-masks", 0, 0, 'i'},
> > +        {"json", 0, 0, 'j'},
> >          {"quiet", 0, 0, 'q'},
> >          {"vncviewer", 0, 0, 'V'},
> >          {"vncviewer-autopass", 0, 0, 'A'},
> > @@ -1181,18 +1182,23 @@ int main_create(int argc, char **argv)
> >  
> >      dom_info.extra_config = NULL;
> >  
> > +    dom_info.format = FORMAT_DEFAULT;
> > +
> >      if (argv[1] && argv[1][0] != '-' && !strchr(argv[1], '=')) {
> >          filename = argv[1];
> >          argc--; argv++;
> >      }
> >  
> > -    SWITCH_FOREACH_OPT(opt, "Ffnq:AVcdeip", opts, "create", 0) {
> > +    SWITCH_FOREACH_OPT(opt, "FJfjnq:AVcdeip", opts, "create", 0) {
> >      case 'A':
> >          vnc = vncautopass = 1;
> >          break;
> >      case 'F':
> >          daemonize = 0;
> >          break;
> > +    case 'J':
> > +        dom_info.format = FORMAT_LEGACY;
> > +        break;
> >      case 'V':
> >          vnc = 1;
> >          break;
> > @@ -1212,6 +1218,9 @@ int main_create(int argc, char **argv)
> >      case 'i':
> >          ignore_masks = 1;
> >          break;
> > +    case 'j':
> > +        dom_info.format = FORMAT_JSON;
> 
> This setting is ignored, as "dom_info" is reset later.

Uh huh.  Indeed.  I saw the "dom_info.extra_config = NULL;" and figured
dom_info was valid at that point, but the memset() is later.  Certainly
need to remedy that.

Having looked, that has gotten pretty awful.  That really needs some
rework to avoid confusion.  Next version...


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



