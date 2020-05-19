Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9391D9AB4
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 17:06:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb3oP-0006Tb-Vk; Tue, 19 May 2020 15:05:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rpDv=7B=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jb3oO-0006TW-IB
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 15:05:44 +0000
X-Inumbo-ID: 356a1880-99e2-11ea-b9cf-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 356a1880-99e2-11ea-b9cf-bc764e2007e4;
 Tue, 19 May 2020 15:05:43 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 7OfRBbwAFIdeoyZ4RogUx6px3o7TbyFjVkKaHsBPJP1ELm20ETXeFANHeCnqM8HBlCxJiTtRi7
 al5H0E7VPfu8hDMEruEhrMJtQSdW1m6RloXpHA0AcexNYL40xcz2GhuScUzjqiztaTI8BXJWgm
 4RhdM98lIEXvHqGSP8V2AZWUUxOnl1n/CCNl1bogauPRyWnsDyG8Pmne8VVK8vKu4ODeMPNMxF
 JZEQGZcWk6hQKjwFkKlDF73L/ujYEXLbOoh6TR8nklzFALCUIus4ceqSySObVvVHeRNKJdz1K6
 gWw=
X-SBRS: 2.7
X-MesageID: 18599821
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,410,1583211600"; d="scan'208";a="18599821"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24259.62913.259268.987283@mariner.uk.xensource.com>
Date: Tue, 19 May 2020 16:05:37 +0100
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 6/7] xen/guest_access: Consolidate guest access helpers in
 xen/guest_access.h
In-Reply-To: <aa209d94-2b39-7932-919b-9842f376e0dc@xen.org>
References: <20200404131017.27330-1-julien@xen.org>
 <20200404131017.27330-7-julien@xen.org>
 <e2588f6e-1f13-b66f-8e3d-b8568f67b62a@suse.com>
 <041a9f9f-cc9e-eac5-cdd2-555fb1c88e6f@xen.org>
 <cf6c0e0b-ade0-587f-ea0e-80b02b21b1a9@suse.com>
 <c8e66108-7ac1-fb51-841f-21886b731f04@xen.org>
 <f02f09ec-b643-8321-e235-ce0ee5526ab3@suse.com>
 <69deb8f4-bafe-734c-f6fa-de41ecf539d2@xen.org>
 <c38f4581-42a6-bb4a-1f84-066528edd3ee@xen.org>
 <aa209d94-2b39-7932-919b-9842f376e0dc@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, George Dunlap <George.Dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi.  My attention was drawn to this thread.

As I understand it, everyone is agreed that deduplicating the
implementation is good (I also agree).  The debate is only between:

1. Put it in xen/ until an arch comes along that needs something
  different, at which point maybe introduce an asm-generic-style
  thing with default implementations.

2. Say, now, that this is a default implementation and it should go in
   asm-generic.

My starting point is that Julien, as the primary author of this
cleanup, should be given leeway on a matter of taste like this.
(There are as I understand it no wider implications.)

Also, ISTM that it can be argued that introducing a new abstraction is
an additional piece of work.  Doing that is certainly not hampered by
Julien's change.  So that would be another reason to take Julien's
patch as-is.

On the merits, I don't have anything to add to the arguments already
presented.  I am considerably more persuaded by Julien's arguments
than Jan's.

So on all levels I think this commit should go in, unless there are
other concerns that have not been discussed here ?

Thanks,
Ian.

