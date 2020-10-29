Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD57029E9C5
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 11:58:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14128.35093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kY5cQ-00079O-Nw; Thu, 29 Oct 2020 10:57:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14128.35093; Thu, 29 Oct 2020 10:57:22 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kY5cQ-00078z-Ke; Thu, 29 Oct 2020 10:57:22 +0000
Received: by outflank-mailman (input) for mailman id 14128;
 Thu, 29 Oct 2020 10:57:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UAOD=EE=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1kY5cO-00078u-UT
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 10:57:20 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 40eb2c34-5b67-46ad-95fc-b59a5684fa06;
 Thu, 29 Oct 2020 10:57:19 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=UAOD=EE=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
	id 1kY5cO-00078u-UT
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 10:57:20 +0000
X-Inumbo-ID: 40eb2c34-5b67-46ad-95fc-b59a5684fa06
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 40eb2c34-5b67-46ad-95fc-b59a5684fa06;
	Thu, 29 Oct 2020 10:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603969039;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tNjUvnugyUPqKcRpSygwhUcjNKEdo+iL0Ets3TLEYcg=;
  b=QOg1Ppj97I812SAuPQwSNHaV0cRo3QksQBiK2QJSUBrucfjXVkN4X0LB
   gs+2KzjUAqAAu1bFG8lVCkfyq/NBnOB/V2G0o43D/AWrwFA0N5M9dNoZn
   f/fgwwEqQWacTsnAvtbmb2+MjmNvRIkJOQMkIBcQmTlcUaQK7jIQUZZa4
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Vf9RLH2f0eDGqmSQISgS67B2/3ErBoNa90E5UUQJn44P8+fnmMS7WtmVRWAQ06ZahosTUtEl45
 KxiKEmto9P8zZFBxNCD8qnUgR4t+0OViP5Ztd5hvAETaapiVamC+vIcfZjedBF31oBd4kAtA7I
 ELyYoA11opINXzIqwAsTkgp+K4IEAsywk/VVBhm1oyBTo+ra6z5rQSBwA4NYRogjnI+78luQyY
 hjre/nT8hQv75KEOqbbVeuAsTeF6cjF3dg1UMKFhrsyoN6XdgQk4NW6wsL1yr0sgvOPCeVoi1w
 wHI=
X-SBRS: None
X-MesageID: 30295470
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,429,1596513600"; 
   d="scan'208";a="30295470"
Date: Thu, 29 Oct 2020 10:57:15 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, <xen-devel@lists.xenproject.org>,
	Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v1] libacpi: use temporary files for generated files
Message-ID: <20201029105715.GG2214@perard.uk.xensource.com>
References: <20201026204151.23459-1-olaf@aepfle.de>
 <68312718-c8ad-040b-be45-192d2c91ba8f@suse.com>
 <20201027112703.24d55a50.olaf@aepfle.de>
 <bc7a5e73-af27-45ae-5d82-f53176cd43a9@suse.com>
 <24025dd2-2c61-7e92-a9b1-2433eea2e909@citrix.com>
 <3880bcbd-9281-10a5-7de5-f73bcf74557a@suse.com>
 <20201028181344.GA273696@perard.uk.xensource.com>
 <4597e596-822e-041a-83de-9fcbfbd03933@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4597e596-822e-041a-83de-9fcbfbd03933@suse.com>

On Thu, Oct 29, 2020 at 09:47:09AM +0100, Jan Beulich wrote:
> On 28.10.2020 19:13, Anthony PERARD wrote:
> > On Tue, Oct 27, 2020 at 12:06:56PM +0100, Jan Beulich wrote:
> >> On 27.10.2020 11:57, Andrew Cooper wrote:
> >>> On 27/10/2020 10:37, Jan Beulich wrote:
> >>>> On 27.10.2020 11:27, Olaf Hering wrote:
> >>>>> Am Tue, 27 Oct 2020 11:16:04 +0100
> >>>>> schrieb Jan Beulich <jbeulich@suse.com>:
> >>>>>
> >>>>>> This pattern is used when a rule consists of multiple commands
> >>>>>> having their output appended to one another's.
> >>>>> My understanding is: a rule is satisfied as soon as the file exists.
> >>>> No - once make has found that a rule's commands need running, it'll
> >>>> run the full set and only check again afterwards.
> >>>
> >>> It stops at the first command which fails.
> >>>
> >>> Olaf is correct, but the problem here is an incremental build issue, not
> >>> a parallel build issue.
> >>>
> >>> Intermediate files must not use the name of the target, or a failure and
> >>> re-build will use the (bogus) intermediate state rather than rebuilding it.
> >>
> >> But there's no intermediate file here - the file gets created in one
> >> go. Furthermore doesn't make delete the target file(s) when a rule
> >> fails? (One may not want to rely on this, and hence indeed keep multi-
> >> part rules update intermediate files of different names.)
> > 
> > What if something went badly enough and sed didn't managed to write the
> > whole file and make never had a chance to remove the bogus file?
> 
> How's this different from an object file getting only partly written
> and not deleted? We'd have to use the temporary file approach in
> literally every rule if we wanted to cater for this.

I though that things like `gcc' would write the final object to a
temporary place then rename it to the final destination, but that
doesn't seems to be the case.

I tried to see what happens if the `sed' command fails, and the target is
created, empty, and doesn't gets deleted by make. So an incremental
build uses a broken file without trying to rebuild it.

If we want `make' to delete target when a rule fails, I think we need to
add '.DELETE_ON_ERROR:' somewhere. Or avoid creating files before the
command is likely to succeed.

Cheers,

-- 
Anthony PERARD

