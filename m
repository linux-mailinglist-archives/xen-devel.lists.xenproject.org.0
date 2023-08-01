Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4408E76A7C4
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 06:07:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573628.898494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQgeG-0000Ln-Mb; Tue, 01 Aug 2023 04:06:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573628.898494; Tue, 01 Aug 2023 04:06:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQgeG-0000JE-JY; Tue, 01 Aug 2023 04:06:16 +0000
Received: by outflank-mailman (input) for mailman id 573628;
 Tue, 01 Aug 2023 04:06:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LgnD=DS=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qQgeF-0000J8-HT
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 04:06:15 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0d5a720-3020-11ee-b258-6b7b168915f2;
 Tue, 01 Aug 2023 06:06:13 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 37145drD098717
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 1 Aug 2023 00:05:44 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 37145aIv098716;
 Mon, 31 Jul 2023 21:05:36 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: c0d5a720-3020-11ee-b258-6b7b168915f2
Date: Mon, 31 Jul 2023 21:05:36 -0700
From: Elliott Mitchell <ehem+undef@m5p.com>
To: Ian Jackson <ijackson@chiark.greenend.org.uk>
Cc: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
        xen-devel@lists.xenproject.org, wl@xen.org,
        Anthony PERARD <anthony.perard@citrix.com>,
        Juergen Gross <jgross@suse.com>
Subject: Re: Python in Domain Configurations
Message-ID: <ZMiEkBrMfXAUvjgL@mattapan.m5p.com>
References: <ZKiN80e08QIojRSL@mattapan.m5p.com>
 <ZL7e6IcJWK38IHU7@mattapan.m5p.com>
 <ZMcxvdSbpQdWg5/r@mail-itl>
 <ZMflj1F5qDydEgbd@mattapan.m5p.com>
 <25799.60117.528120.26189@chiark.greenend.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <25799.60117.528120.26189@chiark.greenend.org.uk>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

On Mon, Jul 31, 2023 at 06:09:41PM +0100, Ian Jackson wrote:
> Elliott Mitchell writes ("Re: Python in Domain Configurations"):
> > On Mon, Jul 31, 2023 at 05:59:55AM +0200, Marek Marczykowski-Górecki wrote:
> > > So, IMHO reducing config file from a full python (like it used to be in
> > > xend times) into a static file with well defined syntax was an
> > > improvement. Lets not go backward.
> 
> I'm no longer working on this codebase, but since I've been CC'd:
> 
> I was one of the people who replaced the Python-based config parsing
> with the current arrangements.  We didn't just do this because we were
> replacing xend (whose use of Python as implementation language made it
> appear convenient to just read and execute the configs as Python
> code).
> 
> We did it for the reasons Marek gives.  It's true that the existing
> format is not as well specified as it could be.  It was intended as a
> plausible subset of Python literal syntax.  We chose that syntax to
> preserve compatibility with the vast majority of existing config files
> and to provide something familiar.  (And it seems we did achieve those
> goals.)
> 
> The disk configuration syntax is particularly warty, but we inherited
> much of that from the Python version.

Okay.  I do note allowing full Python does make domain creation by script
easier.  While I have one use for re-adding the functionality, I'm sure
someone else would come up with other high-value ones.


> > > As for your original problem, IIUC you would like to add some data that
> > > would _not_ be interpreted by libxl, right? For that you can use
> > > comments with some specific marker for your script. This approach used
> > > to work well for SysV init script, and in fact for a very similar use case
> > > (ordering and dependencies, among other things).
> > 
> > That is /not/ the issue.  `xl` simply ignores any variables which it
> > doesn't interpret (this is in fact a Bad Thing).
> 
> I forget, but isn't there some kind of scheme for warning about
> unrecognised configuration options ?

There certainly should be and there may have been one in the past, but no
there isn't one now.  One advantage for using Python is processed data
could be removed when creating the domain and anything left over could be
warned about.  Though such could be added to the existing parser too.

> >  I need to know what the limits to the syntax are.
> 
> I agree that it's not great that the syntax is not 100% documented.
> The parser is in
>   tools/libs/util/libxlu_cfg_y.y
>   tools/libs/util/libxlu_cfg_l.l
> I'm sure patches to improve the docs would be welcome.

That is merely the DFA for the grammar.  There is a bunch of extra for
interfacing with the parser, then there is the layer above.

> Note that it is still a *subset* of Python, so if you wish to use a
> Python interpreter to parse it in your own tooling, you're very
> welcome to do so.

Yup, and this will make that simpler.  Having Python dictionaries would
make some things even easier though.


> > Notice how many init scripts do `. /etc/default/<somefile>` to load
> > configuration?  I'm thinking it would be very handy to use a similar
> > technique to load domain.cfg files, with Python being the interpreter.
> 
> I don't think this is a good idea.  Both because I don't think the
> functionality available in a Python interpreter should be available in
> the libxl configuration, and because Python is a large and complex
> dependency which we don't want to pull in here.

While PvGRUB and Tianocore seem likely to displace PyGRUB, PyGRUB still
functions on ARM (which PvGRUB isn't ported to yet).  As such there is
still a dependency.

Too me the greater concern is the daemon process.  Issue is, for the
daemon process the large amount of functionality built into `xl` is a
similar liability.  Even the temporary data seems a large liability for
the daemon.  Additionally if that was a separate executable, then the
process name could be changed via execve() and make it clearer that
process was expected to remain behind.

> > I also think some portions of the domain.cfg format might work better
> > with full Python syntax.  For example might it be handier to allow:
> > 
> > disk = [
> > 	{
> > 		'vdev': 'xvda',
> > 		'format': 'raw',
> > 		'access': 'rw',
> > 		'target': '/dev/disk/by-path/foo-bar-baz',
> > 	},
> > ]
> 
> I agree that something like this would be nice.  I don't think it
> should be done by importing Python.  These two files - the main part
> of the existing parser - is only 183 loc including comments.
> Extending it (and the support code in libxlu_cfg.c) to do dictionaries
> as well as lists doesn't seem like it would make it too much bigger.

That ignores all the interfacing code.  Add in the interfacing and it is
closer to 2000 lines.  If you merely count the file parser that is only
1000 lines.

I suspect I could interface to libpython with 200-300 lines.  Those would
allow far more functionality than what is currently implemented.



On Mon, Jul 31, 2023 at 05:59:55AM +0200, Marek Marczykowski-Górecki wrote:
> I don't know full history here, but from my point of view, having a
> full-fledged script as a config file is undesirable for several reasons:
>  - it's easy to have unintended side effects of just loading a config
>    file
>  - loading config file can no longer be assumed to be "cheap"

If you use full Python functionality in the domain.cfg files, it could 
indeed do interesting things during config load.  This though is good
reason not to do those things.

Include in documentation, "please don't use complicated Python
functionality in domain configurations"?  Guarding against this seems to
be trying to guard against shooting oneself in the foot.  Users will find
ways to cause odd situations no matter what you do.

>  - dynamic config file means you can no long rely on file timestamp/hash
>    to check if anything changed (I don't think it's an issue for the
>    current xl/libxl, but could be for some higher level tools)

I'm not looking for dynamic configurations.  I'm mostly thinking of
allowing better configuration constructs.  Both disks and network could
use Python dictionaries for a better structure.

>  - leads to issues with various sandboxes - for example SELinux policy
>    allowing scripted config file would be excessively permissive

I suspect someone not using complex Python constructs could have simpler
SE Linux policy.

Having done a bit of experimentation, it appears libpython can be made to
disable some functionality during loading.  Notably it appears one could
restrict Python to mostly dumb assignments during loading.

Further, if this got to the stage of a PoC it should be possible for it
to live alongside the existing parser for a time.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



