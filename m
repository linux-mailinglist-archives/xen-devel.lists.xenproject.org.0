Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE807448132
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 15:17:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223360.386031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk5SW-0004Zk-80; Mon, 08 Nov 2021 14:17:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223360.386031; Mon, 08 Nov 2021 14:17:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk5SW-0004Wx-4u; Mon, 08 Nov 2021 14:17:16 +0000
Received: by outflank-mailman (input) for mailman id 223360;
 Mon, 08 Nov 2021 14:17:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ivRQ=P3=netrider.rowland.org=stern+618c59fc@srs-se1.protection.inumbo.net>)
 id 1mk5SU-0004Wr-7R
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 14:17:14 +0000
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by se1-gles-flk1.inumbo.com (Halon) with SMTP
 id 8f7348cd-409e-11ec-a9d2-d9f7a1cc8784;
 Mon, 08 Nov 2021 15:17:11 +0100 (CET)
Received: (qmail 1667203 invoked by uid 1000); 8 Nov 2021 09:17:03 -0500
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
X-Inumbo-ID: 8f7348cd-409e-11ec-a9d2-d9f7a1cc8784
Date: Mon, 8 Nov 2021 09:17:03 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Borislav Petkov <bp@alien8.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
  Ayush Sawal <ayush.sawal@chelsio.com>,
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  Rohit Maheshwari <rohitm@chelsio.com>, Steven Rostedt <rostedt@goodmis.org>,
  Vinay Kumar Yadav <vinay.yadav@chelsio.com>, alsa-devel@alsa-project.org,
  bcm-kernel-feedback-list@broadcom.com, intel-gfx@lists.freedesktop.org,
  intel-gvt-dev@lists.freedesktop.org, linux-alpha@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
  linux-crypto@vger.kernel.org, linux-edac@vger.kernel.org,
  linux-fbdev@vger.kernel.org, linux-hyperv@vger.kernel.org,
  linux-iio@vger.kernel.org, linux-leds@vger.kernel.org,
  linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
  linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
  linux-remoteproc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
  linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
  linux-sh@vger.kernel.org, linux-staging@lists.linux.dev,
  linux-tegra@vger.kernel.org, linux-um@lists.infradead.org,
  linux-usb@vger.kernel.org, linux-xtensa@linux-xtensa.org,
  netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
  rcu@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org,
  xen-devel@lists.xenproject.org
Subject: Re: [PATCH v0 00/42] notifiers: Return an error when callback is
 already registered
Message-ID: <20211108141703.GB1666297@rowland.harvard.edu>
References: <20211108101157.15189-1-bp@alien8.de>
 <20211108101924.15759-1-bp@alien8.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211108101924.15759-1-bp@alien8.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Nov 08, 2021 at 11:19:24AM +0100, Borislav Petkov wrote:
> From: Borislav Petkov <bp@suse.de>
> 
> Hi all,
> 
> this is a huge patchset for something which is really trivial - it
> changes the notifier registration routines to return an error value
> if a notifier callback is already present on the respective list of
> callbacks. For more details scroll to the last patch.
> 
> Everything before it is converting the callers to check the return value
> of the registration routines and issue a warning, instead of the WARN()
> notifier_chain_register() does now.

What reason is there for moving the check into the callers?  It seems 
like pointless churn.  Why not add the error return code, change the 
WARN to pr_warn, and leave the callers as they are?  Wouldn't that end 
up having exactly the same effect?

For that matter, what sort of remedial action can a caller take if the 
return code is -EEXIST?  Is there any point in forcing callers to check 
the return code if they can't do anything about it?

> Before the last patch has been applied, though, that checking is a
> NOP which would make the application of those patches trivial - every
> maintainer can pick a patch at her/his discretion - only the last one
> enables the build warnings and that one will be queued only after the
> preceding patches have all been merged so that there are no build
> warnings.

Why should there be _any_ build warnings?  The real problem occurs when 
a notifier callback is added twice, not when a caller fails to check the 
return code.  Double-registration is not the sort of thing that can be 
detected at build time.

Alan Stern

> Due to the sheer volume of the patches, I have addressed the respective
> patch and the last one, which enables the warning, with addressees for
> each maintained area so as not to spam people unnecessarily.
> 
> If people prefer I carry some through tip, instead, I'll gladly do so -
> your call.
> 
> And, if you think the warning messages need to be more precise, feel
> free to adjust them before committing.
> 
> Thanks!

