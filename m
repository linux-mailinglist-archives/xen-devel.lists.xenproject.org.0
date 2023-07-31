Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92305769D1D
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 18:47:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573205.897701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQW3X-0003jM-3C; Mon, 31 Jul 2023 16:47:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573205.897701; Mon, 31 Jul 2023 16:47:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQW3W-0003gs-Vs; Mon, 31 Jul 2023 16:47:38 +0000
Received: by outflank-mailman (input) for mailman id 573205;
 Mon, 31 Jul 2023 16:47:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z1vb=DR=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qQW3V-0003gm-7w
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 16:47:37 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f24da96b-2fc1-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 18:47:35 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 36VGlC1P096718
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 31 Jul 2023 12:47:17 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 36VGlB0k096717;
 Mon, 31 Jul 2023 09:47:11 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: f24da96b-2fc1-11ee-b255-6b7b168915f2
Date: Mon, 31 Jul 2023 09:47:11 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, iwj@xenproject.org, wl@xen.org,
        Anthony PERARD <anthony.perard@citrix.com>,
        Juergen Gross <jgross@suse.com>
Subject: Re: Python in Domain Configurations
Message-ID: <ZMflj1F5qDydEgbd@mattapan.m5p.com>
References: <ZKiN80e08QIojRSL@mattapan.m5p.com>
 <ZL7e6IcJWK38IHU7@mattapan.m5p.com>
 <ZMcxvdSbpQdWg5/r@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZMcxvdSbpQdWg5/r@mail-itl>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

On Mon, Jul 31, 2023 at 05:59:55AM +0200, Marek Marczykowski-Górecki wrote:
> On Mon, Jul 24, 2023 at 01:28:24PM -0700, Elliott Mitchell wrote:
> > On Fri, Jul 07, 2023 at 03:13:07PM -0700, Elliott Mitchell wrote:
> > > 
> > > The only context I could find was 54fbaf446b and
> > > https://wiki.xenproject.org/wiki/PythonInXlConfig which don't explain
> > > the reasoning.
> > > 
> > > Would the maintainers be amenable to revisiting the decision to remove
> > > support for full Python in domain configuration files?
> > 
> > Any chance of this getting a response?
> > 
> > On examination it appears domain configuration files are a proper subset
> > of Python.  The interface to the parser is a bit interesting, but it
> > looks fairly simple to replace the parser with libpython.
> > 
> > My goal is to create an init script for some automatically started
> > domains.  Issue is there can be ordering concerns with domain start/stop,
> > and this seems best handled by adding an extra setting to the
> > configuration files.  If full Python syntax is available, I can use that
> > for this extra data.

> I don't know full history here, but from my point of view, having a
> full-fledged script as a config file is undesirable for several reasons:
>  - it's easy to have unintended side effects of just loading a config
>    file
>  - loading config file can no longer be assumed to be "cheap"
>  - dynamic config file means you can no long rely on file timestamp/hash
>    to check if anything changed (I don't think it's an issue for the
>    current xl/libxl, but could be for some higher level tools)
>  - leads to issues with various sandboxes - for example SELinux policy
>    allowing scripted config file would be excessively permissive
> 
> So, IMHO reducing config file from a full python (like it used to be in
> xend times) into a static file with well defined syntax was an
> improvement. Lets not go backward.

I wouldn't really call the existing format "well defined".  While there
are patterns which are followed, some of those have rather a lot of
wiggle room.

I'm still looking, but I suspect libpython can be told to only accept
trivial operations (assignments to variables) and reject anything which
includes a jump or conditional.


> As for your original problem, IIUC you would like to add some data that
> would _not_ be interpreted by libxl, right? For that you can use
> comments with some specific marker for your script. This approach used
> to work well for SysV init script, and in fact for a very similar use case
> (ordering and dependencies, among other things).

That is /not/ the issue.  `xl` simply ignores any variables which it
doesn't interpret (this is in fact a Bad Thing).  I need to know what the
limits to the syntax are.

Notice how many init scripts do `. /etc/default/<somefile>` to load
configuration?  I'm thinking it would be very handy to use a similar
technique to load domain.cfg files, with Python being the interpreter.


I also think some portions of the domain.cfg format might work better
with full Python syntax.  For example might it be handier to allow:

disk = [
	{
		'vdev': 'xvda',
		'format': 'raw',
		'access': 'rw',
		'target': '/dev/disk/by-path/foo-bar-baz',
	},
]


It looks pretty feasible to replace the low-level parser with libpython.
Now to examining the "ast" module and finding out whether a file can be
loaded while rejecting conditionals.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



