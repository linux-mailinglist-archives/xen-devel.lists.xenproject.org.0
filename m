Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1392041F96E
	for <lists+xen-devel@lfdr.de>; Sat,  2 Oct 2021 04:36:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200895.355462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWUs7-0000dx-HF; Sat, 02 Oct 2021 02:35:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200895.355462; Sat, 02 Oct 2021 02:35:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWUs7-0000cD-E4; Sat, 02 Oct 2021 02:35:31 +0000
Received: by outflank-mailman (input) for mailman id 200895;
 Sat, 02 Oct 2021 02:35:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dbdP=OW=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1mWUs5-0000c7-Rs
 for xen-devel@lists.xenproject.org; Sat, 02 Oct 2021 02:35:29 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 675dc3a6-2329-11ec-bde5-12813bfff9fa;
 Sat, 02 Oct 2021 02:35:28 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 1922ZGs4028143
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 1 Oct 2021 22:35:22 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 1922ZG44028142;
 Fri, 1 Oct 2021 19:35:16 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 675dc3a6-2329-11ec-bde5-12813bfff9fa
Date: Fri, 1 Oct 2021 19:35:16 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: HVM/PVH Balloon crash
Message-ID: <YVfFZKRIPTYi/9bH@mattapan.m5p.com>
References: <YTZ+XsnoKNnV4IOz@mattapan.m5p.com>
 <1b3d4cb1-ba61-0f61-5097-9978462a2401@suse.com>
 <YTd/SFtvuzejeiik@mattapan.m5p.com>
 <935dc03f-74f5-4b49-3a45-71148364fb5a@suse.com>
 <YUFdIPLo1AfM5BT2@mattapan.m5p.com>
 <3efe115b-1ff7-dcf1-8198-37bd7d7fb52f@suse.com>
 <YVD59QVbmdVwzYQI@mattapan.m5p.com>
 <033cc499-34de-d27a-7b1b-2a0a7ce38672@suse.com>
 <YVSGvGZc67ZLMdKm@mattapan.m5p.com>
 <03052a89-cb51-250d-4fcd-b9d8ceb93e39@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03052a89-cb51-250d-4fcd-b9d8ceb93e39@suse.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

On Thu, Sep 30, 2021 at 09:08:34AM +0200, Jan Beulich wrote:
> On 29.09.2021 17:31, Elliott Mitchell wrote:
> > 
> > Copy and paste from the xl.cfg man page:
> > 
> >        nestedhvm=BOOLEAN
> >            Enable or disables guest access to hardware virtualisation
> >            features, e.g. it allows a guest Operating System to also function
> >            as a hypervisor. You may want this option if you want to run
> >            another hypervisor (including another copy of Xen) within a Xen
> >            guest or to support a guest Operating System which uses hardware
> >            virtualisation extensions (e.g. Windows XP compatibility mode on
> >            more modern Windows OS).  This option is disabled by default.
> > 
> > "This option is disabled by default." doesn't mean "this is an
> > experimental feature with no security support and is likely to crash the
> > hypervisor".
> 
> Correct, but this isn't the only place to look at. Quoting
> SUPPORT.md:

You expect everyone to memorize SUPPORT.md (almost 1000 lines) before
trying to use Xen?

Your statement amounts to saying you really expect that.  People who want
to get work done will look at `man xl.cfg` when needed, and follow
instructions.

Mentioning something in `man xl.cfg` amounts to a statment "this is
supported".  Experimental/unsupported options need to be marked
"EXPERIMENTAL: DO NOT ENABLE IN PRODUCTION ENVIRONMENTS".


> Yet that's still a configuration error (of the guest), not a bug in
> Xen.

Documentation that poor amounts to a security vulnerability.



I would suggest this needs 2 extra enablers.

First, this has potential to panic the hypervisor.  As such there needs
to be an "enable_experimental=" option for the Xen command-line.  The
argument would be a list of features to enable ("nestedhvm" for this
case).  If this is absent, the hypervisor should ideally disable as much
of the code related to the unsupported/experimental features as possible.

Second, since this needs to be enabled per-domain, there should be a
similar "enable_experimental" setting for xl.cfg options.



I think this really is bad enough to warrant a security vulnerability
and updates to all branches.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



