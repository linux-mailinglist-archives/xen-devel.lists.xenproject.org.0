Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B60173138C9
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 17:04:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82940.153451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l990h-0002PP-4M; Mon, 08 Feb 2021 16:03:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82940.153451; Mon, 08 Feb 2021 16:03:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l990g-0002Oz-WD; Mon, 08 Feb 2021 16:03:35 +0000
Received: by outflank-mailman (input) for mailman id 82940;
 Mon, 08 Feb 2021 16:03:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l990f-0002Ou-Cw
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 16:03:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l990f-0007ZJ-A0
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 16:03:33 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l990f-0006Hj-9A
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 16:03:33 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l990c-0002s1-2l; Mon, 08 Feb 2021 16:03:30 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=ULoVTlqYjIo5XPRNUVxoY3zeGP2Wlvk1S89eRa24Ado=; b=djMfHjqlfuMEn9okbZfhmvxWca
	tkcf4Ay1KJ8w1eclFe5+OeQV+yLTRE4mFNwSQMif3am51rCW/3rzqQNPJ/nRPriXNNBaYzrrQyjnS
	nkLY7hQRcBjaCENqcJz1+lOibo4CMkOKN9fAoLvGkK0xe7v02s429fXwb7oTz9uD/pfg=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24609.24785.791060.128298@mariner.uk.xensource.com>
Date: Mon, 8 Feb 2021 16:03:29 +0000
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v20210111 05/39] tools: add with-xen-scriptdir configure option
In-Reply-To: <20210111174224.24714-6-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
	<20210111174224.24714-6-olaf@aepfle.de>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Olaf Hering writes ("[PATCH v20210111 05/39] tools: add with-xen-scriptdir configure option"):
> In the near future all fresh installations will have an empty /etc.
> The content of this directory will not be controlled by the package
> manager anymore. One of the reasons for this move is to make snapshots
> more robust.

As I wrote in September 2019 I don't agree with it, if it's intended
as a claim about all systems that Xen will run on.

However, this seems to be an accidental retention in the commit
message, since the content of the commit is now what I asked for,
which is to make this directory configurable.

So I approve of the contents of this patch in principle.

> As a first step into this direction, add a knob to configure to allow
> storing the hotplug scripts to libexec because they are not exactly
> configuration. The current default is unchanged, which is
> /etc/xen/scripts.

I suggest this commit message as a compromise:

  Some distros plan for fresh installations will have an empty /etc,
  whose content will not be controlled by the package manager
  anymore.

  To make this possible, add a knob to configure to allow storing the
  hotplug scripts to libexec instead of /etc/xen/scripts.

Olaf, would that be OK with you ?


As for detailed review:

> diff --git a/m4/paths.m4 b/m4/paths.m4
> index 89d3bb8312..0cec2bb190 100644
> --- a/m4/paths.m4
> +++ b/m4/paths.m4
...
> +AC_ARG_WITH([xen-scriptdir],
> +    AS_HELP_STRING([--with-xen-scriptdir=DIR],
> +    [Path to directory for dom0 hotplug scripts. [SYSCONFDIR/xen/scripts]]),
> +    [xen_scriptdir_path=$withval],
> +    [xen_scriptdir_path=$sysconfdir/xen/scripts])
...
> -XEN_SCRIPT_DIR=$XEN_CONFIG_DIR/scripts
> +XEN_SCRIPT_DIR=$xen_scriptdir_path
>  AC_SUBST(XEN_SCRIPT_DIR)

It is not clear to me why the deefault is changed from
"$XEN_CONFIG_DIR/scripts" to "$sysconfdir/xen/scripts" and there isn't
any explanation for this in the commit message.  I think this may make
no difference but an explanation is called for.


As for the release ack question: there is a risk that this patch would
break the build, by causing the scripts to go somewhere wrong.  This
risk seems fairly low and osstest would catch it.

However, I find it difficult to analyse the consequence of the changed
way the default is calculated.

So, a conditional release ack:

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

subject to changing this patch to make the actual implemented default
to still be $XEN_CONFIG_DIR/scripts.

Ian.

