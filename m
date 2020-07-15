Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DDE22131A
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 19:03:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvkoK-0007Rj-74; Wed, 15 Jul 2020 17:03:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3pvp=A2=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jvkoJ-0007Rc-1b
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 17:03:11 +0000
X-Inumbo-ID: 0f23504e-c6bd-11ea-9426-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f23504e-c6bd-11ea-9426-12813bfff9fa;
 Wed, 15 Jul 2020 17:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594832589;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=h9cQtaiuufh23WdS0XPBhjmP1otLEwg0Lui2su8Vyjc=;
 b=OFr68LEMmGcnebM3OrcR/9Z+sS4QtKfajQFxZrkwpVp/dhIvHjm6f4JH
 hqG7gGEWd48J/sftbJdvAxMjbJmhwc9A+/ms6So4zk27A8s1Qrdcmkfzy
 /LokJaD7QzgFUdVGTAw9nWe2Y8lnnamkbDdKGyLXiUHdzNc+kNme8Mb95 I=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 0WHqnRHcG2Q+KSilCWSNrM81dMHowC7dUaLdom3SDVgZ7yy+CQTyqUVQZZWhv1HnC3dy6x5iZo
 MjVlMlxDkGrnHrF0K2gHTltr2I4r5cC1rCWW2eBz6zjmv5wbl56NYv+Q7uijcHKCfXjB02Devb
 YXseRlW4c3hymo24cvZAoCn3x9z0lFNnW75QiqPFH8xj9aceCeEbxH9ogAjcTGaBJLWB0Q8v9Y
 GO604ENJxGa/4VkBIEJV5DFF+z3eLANaBp2oCZ2OPG5Ft+vN1qroHF8KIjY4UIoZAsXf2PENYp
 pd4=
X-SBRS: 2.7
X-MesageID: 23304575
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,355,1589256000"; d="scan'208";a="23304575"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24335.14023.865810.803319@mariner.uk.xensource.com>
Date: Wed, 15 Jul 2020 18:03:03 +0100
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 00/12] tools: move more libraries into tools/libs
In-Reply-To: <alpine.DEB.2.21.2007150945230.4124@sstabellini-ThinkPad-T480s>
References: <20200715162511.5941-1-ian.jackson@eu.citrix.com>
 <alpine.DEB.2.21.2007150945230.4124@sstabellini-ThinkPad-T480s>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@dornerworks.com" <xen-devel@dornerworks.com>,
 Julien Grall <julien@xen.org>,
 "incoming+61544a64d0c2dc4555813e58f3810dd7@incoming.gitlab.com"
 <incoming+61544a64d0c2dc4555813e58f3810dd7@incoming.gitlab.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>, Jan
 Beulich <jbeulich@suse.com>, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Stefano Stabellini writes ("Re: [PATCH 00/12] tools: move more libraries into tools/libs"):
> On Wed, 15 Jul 2020, Ian Jackson wrote:
> > [ NB: this patch series is actually from Juergen Gross.
> > 
> >   It is being experiemntally handled as a Merge Reqeust in gitlab, in
> >   part to see what problems there are with that workflow that will
> >   need extra tooling or whatever.
> > 
> >   I have manually generated this series using git-format-patch,
> >   scripts/add_maintainers.pl, and git-send-email.  I expect that if we
> >   adopt this as a real workflow, we will want to make a robot do some
> >   of that.
> > 
> >   I have set replies to go to the Gitlab comment thread and to
> >   xen-devel.  Again this is experimental.  We are likely to need
> >   something to automatically collect acks, at the very least.
> > 
> >   Reviewers: for now, please review this series as normal.  You may
> >   reply to the messages by email.  Please, for now, send your replies
> >   to gitlab and to the mailing list.  I think I have set the reply-to
> >   appropriately.
> > 
> >   Alternatively you may review the code in the gitlab web UI.  But
> >   please do not use the line-by-line comment system: write only to the
> >   main MR discussion thread.
> 
> Thanks for doing this Ian.
> 
> I am curious about this: why not the line-by-line comment system? It
> looks like it would be the most similar to emails comments. Is it
> because comments done that way cannot be sent via email while the main
> MR discussion thread can?

Well, they can sort of go by email but they can't be created by email
and the webpage mouse UI is clearly primary for them.

Also they are difficult to archive, so difficult to look at later.

I guess this is an experiemnt, so feel free to try it but be prepared
to c&p many messages manually to the list...

Ian.

