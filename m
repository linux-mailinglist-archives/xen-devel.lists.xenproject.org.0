Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A457E7757
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 03:21:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629891.982446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1H8j-0008BR-6t; Fri, 10 Nov 2023 02:20:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629891.982446; Fri, 10 Nov 2023 02:20:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1H8j-000886-3y; Fri, 10 Nov 2023 02:20:57 +0000
Received: by outflank-mailman (input) for mailman id 629891;
 Fri, 10 Nov 2023 02:20:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MzE+=GX=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1r1H8i-000880-AN
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 02:20:56 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4b32cd9-7f6f-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 03:20:53 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 3AA2KW2u060846
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 9 Nov 2023 21:20:38 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.17.1/8.15.2/Submit) id 3AA2KWEw060845;
 Thu, 9 Nov 2023 18:20:32 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: c4b32cd9-7f6f-11ee-98da-6d05b1d4d9a1
Date: Thu, 9 Nov 2023 18:20:32 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Andrew Cooper <andcooper@tibco.com>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
        xen-devel@lists.xenproject.org
Subject: Re: Support situation for nestedhvm
Message-ID: <ZU2TcF09ldY1/YMK@mattapan.m5p.com>
References: <ZUqVnfZTtjb/W5EN@mattapan.m5p.com>
 <93db0a9e-1d99-4953-9e3f-7ad69f0e78bf@tibco.com>
 <654cab6f.050a0220.86158.519b@mx.google.com>
 <cc2e0788-fd03-4c54-b84a-a9bdc2851ef4@tibco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cc2e0788-fd03-4c54-b84a-a9bdc2851ef4@tibco.com>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-14) on mattapan.m5p.com

On Tue, Nov 07, 2023 at 08:15:32PM +0000, Andrew Cooper wrote:
> On 07/11/2023 7:53 pm, Elliott Mitchell wrote:
> > I ran into the nestedhvm via the following path.  I was considering the
> > feasibility of shedding tasks from a desktop onto a server running Xen.
> > I was looking at `man xl.cfg` and noticed "nestedhvm".
> >
> > Since one of the tasks the computer handled was running other OSes in
> > fully simulated environments, this seemed to be something I was looking
> > for.  No where did I ever see anything hinting "This configuration option
> > is completely unsupported and risky to use".
> 
> This one is explicitly covered in SUPPORT.md, and has had XSAs out
> against it in the past for being unexpectedly active when it oughtn't to
> have been.

$ wc -l SUPPORT.md 
1166 SUPPORT.md
$ grep -e^###\  SUPPORT.md | wc -l
129
$

Someone who was exclusively handling Xen system administration all the
time might be expected to memorize that.  Everyone else may recall some
of that, but will forget large portions rapidly.

> > Things simply started exploding without any warnings.
> 
> Things also explode if you try to create a VM with 10x more RAM than you
> have, or if you try `./xenwatchdogd --help`, or `xl debug-keys c`, or
> many other things. 

These of course /should/ be fixed.

> The xl manpage probably ought to state explicitly that the option is
> experimental, but that the extent of what I'd consider reasonable here.

This should have been done years ago.


On Thu, Nov 09, 2023 at 10:36:21AM +0000, Andrew Cooper wrote:
> On 09/11/2023 9:50 am, Alejandro Vallejo wrote:
> >
> > No, but we can prevent users unexpectedly shooting themselves in the foot.

> Like it or not, this knob is behaved in this way for 15 years.  You will
> be doing harm for no benefit by trying to change it.

Does your car feature spurs and ropes in order to be compatible with
horses?  Things do change over time.

> And if you need a cautionary tail on why this is a bad idea generally,
> as well as a background on why I will firmly object to technical
> countermeasures like this, read up on Xen's allow_unsafe command line
> parameter.

I can see why that experience would leave a mark.  Perhaps one of these
should create the domain with nestedhvm disabled, and overtly state it
needs to be enabled in two places.

Yet I reject your metaphor.  allow_unsafe was added as part of an urgent
security update.  This behavior would be released as part of a major
version upgrade.  Major upgrades need to be done with care since they're
the time when things break (hopefully this wouldn't break anything, but I
agree such could happen).


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



