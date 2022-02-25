Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC16F4C3A37
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 01:17:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278687.476039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNOHN-0004jD-Pa; Fri, 25 Feb 2022 00:16:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278687.476039; Fri, 25 Feb 2022 00:16:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNOHN-0004gP-LQ; Fri, 25 Feb 2022 00:16:13 +0000
Received: by outflank-mailman (input) for mailman id 278687;
 Fri, 25 Feb 2022 00:16:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z5Py=TI=wind.enjellic.com=greg@srs-se1.protection.inumbo.net>)
 id 1nNOHL-0004gJ-OO
 for xen-devel@lists.xen.org; Fri, 25 Feb 2022 00:16:11 +0000
Received: from wind.enjellic.com (wind.enjellic.com [76.10.64.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 1ec6ffc0-95d0-11ec-8eb8-a37418f5ba1a;
 Fri, 25 Feb 2022 01:16:05 +0100 (CET)
Received: from wind.enjellic.com (localhost [127.0.0.1])
 by wind.enjellic.com (8.15.2/8.15.2) with ESMTP id 21P0G3Lt005995;
 Thu, 24 Feb 2022 18:16:03 -0600
Received: (from greg@localhost)
 by wind.enjellic.com (8.15.2/8.15.2/Submit) id 21P0G2Hk005994;
 Thu, 24 Feb 2022 18:16:02 -0600
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
X-Inumbo-ID: 1ec6ffc0-95d0-11ec-8eb8-a37418f5ba1a
Date: Thu, 24 Feb 2022 18:16:02 -0600
From: "Dr. Greg" <greg@enjellic.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xen.org
Subject: Re: IGD pass-through failures since 4.10.
Message-ID: <20220225001602.GB5755@wind.enjellic.com>
Reply-To: "Dr. Greg" <greg@enjellic.com>
References: <20220214060011.GA24404@wind.enjellic.com> <198ef291-4dee-ddac-aef6-8451bc1e880c@suse.com> <20220217201534.GA29303@wind.enjellic.com> <dc1a4483-7dca-aa72-6b86-4217e6840efb@suse.com> <20220222185230.GA15532@wind.enjellic.com> <b9a77707-5d93-050a-f9ee-da284dbd0eac@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9a77707-5d93-050a-f9ee-da284dbd0eac@suse.com>
User-Agent: Mutt/1.4i
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.2.3 (wind.enjellic.com [127.0.0.1]); Thu, 24 Feb 2022 18:16:03 -0600 (CST)

On Wed, Feb 23, 2022 at 09:59:48AM +0100, Jan Beulich wrote:

Hi, I hope the end of the week is going well for everyone.

> On 22.02.2022 19:52, Dr. Greg wrote:
> > On Fri, Feb 18, 2022 at 08:04:14AM +0100, Jan Beulich wrote:
> >> On 17.02.2022 21:15, Dr. Greg wrote:
> >>> On Mon, Feb 14, 2022 at 09:56:34AM +0100, Jan Beulich wrote:
> >>> In the case of the logs above, the following command sequence is being
> >>> executed upon termination of the domain:
> >>>
> >>> # Unbind devices.
> >>> echo 0000:00:14.0 >| /sys/bus/pci/drivers/pciback/unbind
> >>> echo 0000:00:02.0 >| /sys/bus/pci/drivers/pciback/unbind
> >>>
> >>> # Rebind devices.
> >>> echo 0000:00:14.0 >| /sys/bus/pci/drivers/xhci_hcd/bind
> >>> echo 0000:00:02.0 >| /sys/bus/pci/drivers/i915/bind
> > 
> >> ... you may still want to try replacing these with
> >> "xl pci-assignable-add ..." / "xl pci-assignable-remove ...".
> > 
> > We tested using the 'xl pci-assignable-add/remove' sequences and we
> > believe this may have resulted in the proper return of the devices to
> > dom0 but haven't been able to verify that since the Windows VM is now
> > throwing the VIDEO_TDR error.
> > 
> > Unless we are misunderstanding something the 'xl
> > pci-assignable-remove' sequence requires the manual re-binding of the
> > devices to their dom0 drivers.

> Hmm, I thought drivers would be rebound, but I'm not a tool stack
> person.  Looking at libxl__device_pci_assignable_remove() at least
> support this assumption of mine. You did use the command's -r
> option, didn't you?

No we weren't and I now see the -r option.

We have already re-worked our setup scripts to use pci-assignable-add
and will verify the -r option works as advertised, thanks for the tip.

We had our lab machine broken for a couple of days where it wouldn't
start an IGD pass-through session in any way shape or form.  We got
that sorted out and will now go back to 4.15.2 and verify what works
and doesn't work and report back.

> Jan

Have a good weekend.

As always,
Dr. G.W. Wettstein, Ph.D.   Enjellic Systems Development, LLC.
4206 N. 19th Ave.           Specializing in information infra-structure
Fargo, ND  58102            development.
PH: 701-281-1686            EMAIL: greg@enjellic.com
------------------------------------------------------------------------------
"On the other hand, the Linux philosophy is 'laugh in the face of
 danger'.  Oops.  Wrong one.  'Do it yourself'.  Thats it."
                                -- Linus Torvalds

