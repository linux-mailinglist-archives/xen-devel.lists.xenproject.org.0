Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E7E3001B7
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 12:37:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72701.130957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2ulB-0000tR-NM; Fri, 22 Jan 2021 11:37:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72701.130957; Fri, 22 Jan 2021 11:37:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2ulB-0000t0-IX; Fri, 22 Jan 2021 11:37:49 +0000
Received: by outflank-mailman (input) for mailman id 72701;
 Fri, 22 Jan 2021 11:37:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=83/a=GZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l2ulA-0000sn-FX
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 11:37:48 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 02527e93-90c2-4c2b-98c3-ad5fcc467b1f;
 Fri, 22 Jan 2021 11:37:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B7028AC4F;
 Fri, 22 Jan 2021 11:37:46 +0000 (UTC)
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
X-Inumbo-ID: 02527e93-90c2-4c2b-98c3-ad5fcc467b1f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611315466; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5fEMuR81WAbwUUpUnl9gfrKTh7f01kWJIh3wylQXtVs=;
	b=HlSHa2cFBxku4ZZWMLqNUdZQK29AwQU3mZv+zSdeq4pACS8JJ+RneJUsEfZmeRtwc9Sur8
	TrNdDapBThsLPpKuwAwo/7RgPPvALZ3l8M3TVdHYjGcSsEy3oX9VpfDKvrKooC0+VSOmCm
	kShvNCGkl/H9EtVah/1ovm60MnxTpH0=
Subject: Re: [PATCH v2 4/4] x86/dpci: remove the dpci EOI timer
To: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210115142820.35224-1-roger.pau@citrix.com>
 <20210115142820.35224-5-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f16c54ce-2b3d-eaf6-1668-5fd73b151937@suse.com>
Date: Fri, 22 Jan 2021 12:37:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210115142820.35224-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 15.01.2021 15:28, Roger Pau Monne wrote:
> Current interrupt pass though code will setup a timer for each
> interrupt injected to the guest that requires an EOI from the guest.
> Such timer would perform two actions if the guest doesn't EOI the
> interrupt before a given period of time. The first one is deasserting
> the virtual line, the second is perform an EOI of the physical
> interrupt source if it requires such.
> 
> The deasserting of the guest virtual line is wrong, since it messes
> with the interrupt status of the guest. This seems to have been done
> in order to compensate for missing deasserts when certain interrupt
> controller actions are performed. The original motivation of the
> introduction of the timer was to fix issues when a GSI was shared
> between different guests. We believe that other changes in the
> interrupt handling code (ie: proper propagation of EOI related actions
> to dpci) will have fixed such errors now.
> 
> Performing an EOI of the physical interrupt source is redundant, since
> there's already a timer that takes care of this for all interrupts,
> not just the HVM dpci ones, see irq_guest_action_t struct eoi_timer
> field.
> 
> Since both of the actions performed by the dpci timer are not
> required, remove it altogether.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with ...

> Changes since v1:
>  - Add parentheses.

... this, as you've already clarified, indeed having happened.
I understand this change is independent of the earlier ones in
this series. The minor adjustment could be taken care of while
committing, and I'm inclined to not wait ...

>  xen/drivers/passthrough/vtd/x86/hvm.c |  3 -

... for Kevin's ack on this obvious part of the change,
considering his prior input on the discussion we've had (where
he did signal agreement with the removal).

However, despite this series having been posted before the
deadline, it feels to me like a change that doesn't come
without risk (and hence would have been better to have earlier
in the release cycle). Hence, Ian, I'd like to gather your
release manager opinion on taking this now vs postponing for
4.16 (and then still being a likely backporting candidate). My
vote is "pro", in case it matters.

Jan

