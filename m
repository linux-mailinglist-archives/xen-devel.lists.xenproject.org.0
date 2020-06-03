Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E29BF1ED2FF
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 17:08:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgUzM-0007T5-DD; Wed, 03 Jun 2020 15:07:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vZjh=7Q=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jgUzL-0007T0-AL
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 15:07:31 +0000
X-Inumbo-ID: f18f2b52-a5ab-11ea-9947-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f18f2b52-a5ab-11ea-9947-bc764e2007e4;
 Wed, 03 Jun 2020 15:07:30 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: /WgkDs/icnrRkxrfZ5EuDKaR7SvsXSddDbMaxvp4qdegV01Q6FsqD1EMTL1E0Vr9ftNRBzjE7J
 Zw6bIsqlRad+xFB959P+xnslb3FHqVgUeSA59fQ+GfFMjbHJfk9QS0spNVsCmjkvavwzxkVLam
 muX/9JsZs7FiwkPbIRpa9XKwVEGonQfH/pDUSP7zccolISm2o8DSh5M7vjybKk8+CZHXtS4GzH
 Hee0dRXPss9u7aJMIWcggEGiHL5z6qDdUwUiTUUq2tzs5BVX6mjTixpyWjC4SS54M/uqUkgtGu
 n4o=
X-SBRS: 2.7
X-MesageID: 19425457
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,467,1583211600"; d="scan'208";a="19425457"
Date: Wed, 3 Jun 2020 17:07:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v4 for-4.14] x86/monitor: revert default behavior when
 monitoring register write events
Message-ID: <20200603150721.GF1195@Air-de-Roger>
References: <20200603125237.100041-1-tamas@tklengyel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200603125237.100041-1-tamas@tklengyel.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 03, 2020 at 06:52:37AM -0600, Tamas K Lengyel wrote:
> For the last couple years we have received numerous reports from users of
> monitor vm_events of spurious guest crashes when using events. In particular,
> it has observed that the problem occurs when vm_events are being disabled. The
> nature of the guest crash varied widely and has only occured occasionally. This
> made debugging the issue particularly hard. We had discussions about this issue
> even here on the xen-devel mailinglist with no luck figuring it out.
> 
> The bug has now been identified as a race-condition between register event
> handling and disabling the monitor vm_event interface. The default behavior
> regarding emulation of register write events is changed so that they get
> postponed until the corresponding vm_event handler decides whether to allow such
> write to take place. Unfortunately this can only be implemented by performing the
> deny/allow step when the vCPU gets scheduled.
> 
> Due to that postponed emulation of the event if the user decides to pause the
> VM in the vm_event handler and then disable events, the entire emulation step
> is skipped the next time the vCPU is resumed. Even if the user doesn't pause
> during the vm_event handling but exits immediately and disables vm_event, the
> situation becomes racey as disabling vm_event may succeed before the guest's
> vCPUs get scheduled with the pending emulation task. This has been particularly
> the case with VMS that have several vCPUs as after the VM is unpaused it may
> actually take a long time before all vCPUs get scheduled.
> 
> In this patch we are reverting the default behavior to always perform emulation
> of register write events when the event occurs. To postpone them can be turned
> on as an option. In that case the user of the interface still has to take care
> of only disabling the interface when its safe as it remains buggy.
> 
> Fixes: 96760e2fba10 ('vm_event: deny register writes if refused by vm_event
> reply').
> 
> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>

Thanks!

Reviewed-by: Roger Pau Monné <rogerpau@citrix.com>

I would like to get some input from Bitdefender really, and whether
they are fine with this approach.

