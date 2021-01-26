Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BF6304485
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 18:07:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75354.135663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4RoM-00019S-NW; Tue, 26 Jan 2021 17:07:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75354.135663; Tue, 26 Jan 2021 17:07:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4RoM-000193-KM; Tue, 26 Jan 2021 17:07:26 +0000
Received: by outflank-mailman (input) for mailman id 75354;
 Tue, 26 Jan 2021 17:07:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4RoK-00018x-QJ
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 17:07:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d360b26e-3326-4be9-bf3d-dc6784222cd2;
 Tue, 26 Jan 2021 17:07:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B4E4CAB92;
 Tue, 26 Jan 2021 17:07:22 +0000 (UTC)
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
X-Inumbo-ID: d360b26e-3326-4be9-bf3d-dc6784222cd2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611680842; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=12zF1yxqIS+nqv4aRBVRF0QF7ZcuJMMaeM4a5urbkqg=;
	b=h3kKwv6R/k49jfMQfdfiKRBc6MnkYtsNSJryVAT5r3uYWOuz2rFLtuH+63xXabtvHzCKUF
	4DYsHpzXoDE62Agh+Mr96+RhldO1Vb2R6xqdutFSgFC5ME2d4GUuxH8/Vi5gz5n5kHiKWC
	iRma9M/vajyLAKZzvwPwD0d70DMldrc=
Subject: Re: [PATCH v3 0/6] x86/intr: HVM guest interrupt handling
 fixes/cleanup
To: Ian Jackson <iwj@xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210126134521.25784-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f5d10743-676e-d723-6d3a-32b9c8b4d4fd@suse.com>
Date: Tue, 26 Jan 2021 18:07:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210126134521.25784-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Ian,

On 26.01.2021 14:45, Roger Pau Monne wrote:
> The following series aims to fix some shortcomings of guest interrupt
> handling when using passthrough devices. The first 5 patches are
> bugfixes or cleanups, which I think should solve the issue(s) that
> caused the dpci EOI timer to be introduced. However neither me nor
> others seem to be able to reproduce the original issue, so it's hard to
> tell.
> 
> It's my opinion that we should remove the timer and see what explodes
> (if anything). That's the only way we will be able to figure out what
> the original issue was, and how to fix it without introducing yet
> another per-guest-irq related timer.
> 
> Thanks, Roger.
> 
> Roger Pau Monne (6):
>   x86/vioapic: top word redir entry writes don't trigger interrupts
>   x86/vioapic: issue EOI to dpci when switching pin to edge trigger mode
>   x86/vpic: force int output to low when in init mode
>   x86/vpic: don't trigger unmask event until end of init
>   x86/vpic: issue dpci EOI for cleared pins at ICW1
>   x86/dpci: remove the dpci EOI timer

while half of this series was still submitted in time, I'd still
like to raise the question of including part or all of it in
4.15. In particular the last change is one which I would prefer
to see happen early in a release cycle. Risk assessment is
pretty difficult, I'm afraid (Roger can correct me here), as at
least some of what gets adjusted are cases we don't normally
expect to be exercised. (FAOD patch 5 is still pending a R-b
tag.)

Roger, if you could give your own judgement on which of the
changes you would view as more or less clear 4.15 candidates,
this may help Ian take a decision.

Jan

