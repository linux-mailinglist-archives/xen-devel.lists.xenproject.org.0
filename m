Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D6B57CC5B
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jul 2022 15:44:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372830.604808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEWT8-0002FP-3w; Thu, 21 Jul 2022 13:43:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372830.604808; Thu, 21 Jul 2022 13:43:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEWT8-0002Cd-0g; Thu, 21 Jul 2022 13:43:58 +0000
Received: by outflank-mailman (input) for mailman id 372830;
 Thu, 21 Jul 2022 13:43:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K6kJ=X2=citrix.com=prvs=194f9e755=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oEWT7-0002CX-H5
 for xen-devel@lists.xenproject.org; Thu, 21 Jul 2022 13:43:57 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29a51dfc-08fb-11ed-bd2d-47488cf2e6aa;
 Thu, 21 Jul 2022 15:43:56 +0200 (CEST)
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
X-Inumbo-ID: 29a51dfc-08fb-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658411035;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=AS5ZTLxZhyXYtjfXkjHVwAkEdEESCEmnz1nW+OJSAkc=;
  b=SUNMhjtuxgtVGC5b9HW56CKI1ZJk7VpCcNk9BXy4RphlIe9gCGukPplZ
   NuiW/WzZO0HIe0WhRYRDv/JKEZoK0pLOsZja62kX3CINkIZ17pVlG7iZb
   46mYrt2a48sD0tSFlUXnQ78bSN0fcNwbgh+Qv6HI9nir/q8L6u5tbRghX
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 76327238
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:p/RdG6o6mUWR4dcyocCqJtZMR4NeBmIeZRIvgKrLsJaIsI4StFCzt
 garIBmOOfeDNjH1L9t2boXl9E1VuZDcnd9lG1Bo+S48EX9H9ZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNPg06/gEk35q6q52lB5gZWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqU14LcvPUdQp
 MVEAykCdTmOwKGG+ZiSH7wEasQLdKEHPasas3BkizrYEewnUdbIRKCiCd1whWlqwJoURLCHO
 pRfOWEHgBfoOnWjPn8eDo4+m+G5wGHyaTRCpHqepLYt4niVxwt0uFToGIWLIYbVH54F9qqej
 iGewE7fECg0DdyCyhzY3GqT3vDWrBquDer+E5Xnr6U30TV/3Fc7EwYKXFG2pf24jE+WWN9FL
 UEQvC00osAa/0WxQt7wdxaxunKDs1gXXN84O/037kSBx7TZ5y6dB3MYVXhRZdo+rsg0SDc2k
 FiTkLvBGjhHoLCTD3WH+d+pQSiaYHZPazVYPGldEFVDs4KLTJwPYgznY8wySJKTkIzMRRrpz
 CujoW99t4w5pJtev0mkxmwrkw5At7CQEFNlvFyNDz78hu9qTNX7PtL1sDA3+d4Fdd/EFQfZ4
 RDojuDEtIgz4YexeDthqQnnNJWg/L67PTLVmjaD9LFxpm32qxZPkW29iQySxXuF0e5eIFcFm
 GeJ5WtsCGZ7ZRNGl5NfbYOrENgNxqP9D9njXf28RoMQP8gqKFXeono/Pxb4M4XRfK8EyPpXB
 HtmWZz0USZy5VpPl1JauNvxIZd0n3tjlAs/tLjwzgi90Kr2WUN5vYwtaQLWBshkvfzsnekg2
 4wAXyd840kADbaWj+i+2dJ7EG3m2lBgXsis9JMGJ7frz8gPMDhJNsI9CIgJI+RN95m5XM+Sl
 p1hcie0EGbCuEA=
IronPort-HdrOrdr: A9a23:tQWXjqMAjQ6DLsBcTvmjsMiBIKoaSvp037Eqv3oRdfVwSL3+qy
 nIpoV86faUskd0ZJhOo7y90cW7Lk80sKQFmLX5Xo3SOTUO2lHYT72KhLGKq1aLdhEWtNQtt5
 uIG5IOcOEYZmIbsS+V2meFL+o=
X-IronPort-AV: E=Sophos;i="5.93,289,1654574400"; 
   d="scan'208";a="76327238"
Date: Thu, 21 Jul 2022 14:43:50 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"wl@xen.org" <wl@xen.org>, "sstabellini@kernel.org" <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH v2 0/4] Some improvement for gitlab CI jobs
Message-ID: <YtlYFvVMCpND91yX@perard.uk.xensource.com>
References: <20220721124602.9910-1-anthony.perard@citrix.com>
 <b7aaa9c3-bd06-4d76-36f5-381333247697@citrix.com>
 <YtlQABtrS1yk1AZY@perard.uk.xensource.com>
 <2bba32aa-6ff5-f1f2-87c6-682c65dcf84e@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2bba32aa-6ff5-f1f2-87c6-682c65dcf84e@citrix.com>

On Thu, Jul 21, 2022 at 01:14:41PM +0000, Andrew Cooper wrote:
> On 21/07/2022 14:09, Anthony PERARD wrote:
> > On Thu, Jul 21, 2022 at 01:03:41PM +0000, Andrew Cooper wrote:
> >> On 21/07/2022 13:45, Anthony Perard wrote:
> >>> Patch series available in this git branch:
> >>> https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.gitlab-ci-improvement-v2
> >>>
> >>> v2:
> >>> - rebased
> >>>
> >>> Allow build and test jobs to run concurently.
> >>>
> >>> Avoid running "test artifact" jobs on branch "master" and other, when test jobs
> >>> aren't runned.
> >>>
> >>> Anthony PERARD (4):
> >>>   automation: fix typo in .gcc-tmpl
> >>>   automation: add a templates for test jobs
> >>>   automation: only run test artifact jobs when needed
> >>>   automation: use "needs" instead of "dependencies" for test jobs
> >> LGTM.  Got a CI run of these?
> > Yes,
> >
> > patchew's commit is in progress:
> > https://gitlab.com/xen-project/patchew/xen/-/pipelines/593479157
> >
> > A run in my private repo:
> > https://gitlab.com/xen-project/people/anthonyper/xen/-/pipelines/593340820
> > (no failure due to this change)
> >
> > Running on one of my branch called "stable-wip" doesn't create any
> > pipeline, as expected.
> >
> 
> 
> Cool.  I'll get these 4 committed in due course.

Thanks.

> One thing, looking at this right now.  Is there anything we can we
> prioritize the builds used to run the qemu smoke tests?  We've currently
> got x86 smoke tests waiting while the workers are building hypervisors
> unrelated to the tests.

I think the only way would be to create a new stage before the "build"
stage which would have all the build jobs needed by the tests jobs. But
that kind of became more complicated.

-- 
Anthony PERARD

