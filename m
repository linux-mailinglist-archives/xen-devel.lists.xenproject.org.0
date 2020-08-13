Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC5A2436FC
	for <lists+xen-devel@lfdr.de>; Thu, 13 Aug 2020 10:58:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k693Q-0001pq-6V; Thu, 13 Aug 2020 08:57:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lIW0=BX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k693O-0001pl-DC
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2020 08:57:42 +0000
X-Inumbo-ID: 81e505d2-e6b6-4243-9ee8-3c8b47f0c5a9
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81e505d2-e6b6-4243-9ee8-3c8b47f0c5a9;
 Thu, 13 Aug 2020 08:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597309060;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=w1FVKwGlour2InEfliYNgG5NoRs9YlR9YU4vXjOe2GM=;
 b=NUBfucHoteH57O4xqCz7D42METgeFxsH62rPDPyCwxsbHEyf11IgygQz
 gsq8eln+xqC8pYSpJywZuU9uWv6sfJOPLLtvRIt73WPrY4L3Y32VRnKU7
 N3S73sBD8DrUBYuwBkeGDdl1BzftH8Yr/fW+E/qA1OrqSaqOgVvcKdOFj Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: N1E274Bfx39ftsY8xSJNmie4beVNLdEhct3Z7l8IeAvutlUf5ogm6GR32VLz1khYUYWloAZw7O
 oiLTfHIFw0gnaBqG0KEOE7rTVvvrcV/lTh2MTYfwIGPFYm3IMIXg7inLNDXAvs7/jNV1enhhU2
 qTqvSQ8YY1Z3EWe/hpzz52Dz2ZeB7JEWnKIz9aO1b/yFy2NkS1ZEg+HHqevEcGrgHoDx47kcA5
 wn32XUg8kPp4LxKSQ/bUEAgvUc1WfaQfWTEGcOzflJoLjXlqHevvEHV4E7hz+CM3YTI8VdVQM7
 hMU=
X-SBRS: 2.7
X-MesageID: 24750817
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,307,1592884800"; d="scan'208";a="24750817"
Date: Thu, 13 Aug 2020 10:57:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <paul@xen.org>
CC: <xen-devel@lists.xenproject.org>, 'Wei Liu' <wl@xen.org>, 'Jan Beulich'
 <jbeulich@suse.com>, 'Andrew Cooper' <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/5] x86/viridian: switch synic to use the new EOI callback
Message-ID: <20200813085732.GE975@Air-de-Roger>
References: <20200812124709.4165-1-roger.pau@citrix.com>
 <20200812124709.4165-5-roger.pau@citrix.com>
 <004e01d6714c$748450d0$5d8cf270$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <004e01d6714c$748450d0$5d8cf270$@xen.org>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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

On Thu, Aug 13, 2020 at 09:33:43AM +0100, Paul Durrant wrote:
> > -----Original Message-----
> > From: Roger Pau Monne <roger.pau@citrix.com>
> > Sent: 12 August 2020 13:47
> > To: xen-devel@lists.xenproject.org
> > Cc: Roger Pau Monne <roger.pau@citrix.com>; Paul Durrant <paul@xen.org>; Wei Liu <wl@xen.org>; Jan
> > Beulich <jbeulich@suse.com>; Andrew Cooper <andrew.cooper3@citrix.com>
> > Subject: [PATCH 4/5] x86/viridian: switch synic to use the new EOI callback
> > 
> > Switch synic interrupts to use an EOI callback in order to execute the
> > logic tied to the end of interrupt. This allows to remove the synic
> > call in vlapic_handle_EOI.
> > 
> > Move and rename viridian_synic_ack_sint now that it can be made
> > static.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > I'm unsure about the logic in viridian_synic_deliver_timer_msg, as it
> > seems to only set the vector in msg_pending when the message is
> > already pending?
> 
> See section 11.10.3 of the TLFS (SynIC Message Flags)...
> 
> "The MessagePending flag indicates whether or not there are any
> messages pending in the message queue of the synthetic interrupt
> source. If there are, then an “end of message” must be performed by
> the guest after emptying the message slot. This allows for
> opportunistic writes to the EOM MSR (only when required). Note that
> this flag may be set by the hypervisor upon message delivery or at
> any time afterwards. The flag should be tested after the message
> slot has been emptied and if set, then there are one or more pending
> messages and the “end of message” should be performed."
> 
> IOW it's a bit like APIC assist in that it tries to avoid a VMEXIT
> (in this case an access to the EOM MSR) unless it is necessary.
> 
> Reading the code again I think it may well be possible to get rid of
> the 'msg_pending' flag since it only appears to be an optimization
> to avoid testing 'message_type'. I'll try dropping it and see what
> breaks.

Ack, I think the current approach in this patch would keep the same
behavior.

Thanks, Roger.

