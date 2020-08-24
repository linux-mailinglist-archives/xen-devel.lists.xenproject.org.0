Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EA7250014
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 16:45:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kADiP-0000ze-Kn; Mon, 24 Aug 2020 14:44:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=61pB=CC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kADiO-0000zZ-5m
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 14:44:52 +0000
X-Inumbo-ID: 04f570f1-9b09-4a98-a41a-e526f53506ce
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 04f570f1-9b09-4a98-a41a-e526f53506ce;
 Mon, 24 Aug 2020 14:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598280290;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=z0c5UWXeYuqDOtZFchgoE3q/MCsur2gyt/hJOrPCp00=;
 b=fn+/tguKM5AJbLfffod8Ci8pJ0hpRDQ/J/7EdO70tRqE5BZfUDO7O4UQ
 Zpcw38nGuXpTmM94m8kB/inwXnKy/pRpcboqixF1qzfsiXNrfuboXKjFm
 eS8eHrr/8yqiBcwNZNdvhUtET8GEMjDSND2V+8o97YjHYer7ChTIkYyzn g=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 2GrgPmNRa7AoNBmtjhM3rGhUGXhQIAAFGhH0nNr1DlSchTOq3sir1QyKaY1M70+PIiVfkTziLE
 afN+YlkuQCpNDONFcAgubEVS7Yj+fu6h5oEolRWDr8dEQ80K9eQxlpgirW+nkx8iJlhN11V8xO
 /ETXKLjlAYy+1zSBT8oRljTafTQkdLCD/cq0HyBr6z9bGFJzELteVKO577Z5/utULnEcnCqZj2
 NN7KddSc+erh9+LP+cMYsRqcIisXcIMwXudZCbNG3yx2gN7cV6xFUoAOdzgy/G7l0kMJnoV+Bw
 Lj8=
X-SBRS: 2.7
X-MesageID: 26095207
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,349,1592884800"; d="scan'208";a="26095207"
Date: Mon, 24 Aug 2020 16:44:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
 <paul@xen.org>
Subject: Re: [PATCH 3/5] x86/vmsi: use the newly introduced EOI callbacks
Message-ID: <20200824144440.GD1587@Air-de-Roger>
References: <20200812124709.4165-1-roger.pau@citrix.com>
 <20200812124709.4165-4-roger.pau@citrix.com>
 <0d3afbb2-a2a8-f570-6f59-fd3c3d56e6dd@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <0d3afbb2-a2a8-f570-6f59-fd3c3d56e6dd@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Aug 24, 2020 at 04:06:31PM +0200, Jan Beulich wrote:
> On 12.08.2020 14:47, Roger Pau Monne wrote:
> > Remove the unconditional call to hvm_dpci_msi_eoi in vlapic_handle_EOI
> > and instead use the newly introduced EOI callback mechanism in order
> > to register a callback for MSI vectors injected from passed through
> > devices.
> 
> In patch 2 you merely invoke the callback when the EOI arrived,
> but you don't clear the callback (unless I've missed something).
> Here you register the callback once per triggering of the IRQ,
> without clearing it from the callback itself either.

It gets cleared on the next call to vlapic_set_irq_callback, or set to
a new callback value if the passed callback is not NULL.

> Why is it
> correct / safe to keep the callback registered?

The next vector injected is going to clear it, so should be safe, as
no vector can be injected without calling vlapic_set_irq_callback.

> What about
> conflicting callbacks for shared vectors?

In this callback model for vlapic only the last injected vector
callback would get executed. It's my understanding that lapic
vectors cannot be safely shared unless there's a higher level
interrupt controller (ie: an IO-APIC) that does the sharing.

I have further patches that also add EOI callbacks to vIO-APIC and
8259A PICs, so that all interrupt controllers can handle EOI
callbacks.

Thanks, Roger.

