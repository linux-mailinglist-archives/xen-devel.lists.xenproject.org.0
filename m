Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CAC2EBD19
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jan 2021 12:22:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62426.110552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kx6tD-0002iO-M5; Wed, 06 Jan 2021 11:22:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62426.110552; Wed, 06 Jan 2021 11:22:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kx6tD-0002hz-IL; Wed, 06 Jan 2021 11:22:07 +0000
Received: by outflank-mailman (input) for mailman id 62426;
 Wed, 06 Jan 2021 11:22:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eU9S=GJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kx6tC-0002hs-2f
 for xen-devel@lists.xenproject.org; Wed, 06 Jan 2021 11:22:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22ca98bb-3d4e-4f7f-b6df-384900871021;
 Wed, 06 Jan 2021 11:22:05 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 498F8ABC4;
 Wed,  6 Jan 2021 11:22:04 +0000 (UTC)
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
X-Inumbo-ID: 22ca98bb-3d4e-4f7f-b6df-384900871021
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609932124; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pewbCdDG99R4wtJepMFQOb3k0otLqPgMbULIV78F5T8=;
	b=vPZctkRZ1IJlta4/D3Li2T2H++TyAMLk6V2tJLaV+/Uix4TdkT/LUmK2oIkeCH8GyXyjTb
	C24bWjZYPdqKrhH1ZuavWmJixomhObLe+pYsGEunaMtqfHxP0Fy2gvilip4yXJA0RiqKtd
	BXA2YynJ7DNqGKVwXJf/CBybMmYyGrg=
Subject: Re: [PATCH] x86/dpci: EOI interrupt regardless of it's masking status
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20210105183143.94547-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <696e5198-9634-bf5f-d870-99614aeb5c2a@suse.com>
Date: Wed, 6 Jan 2021 12:22:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210105183143.94547-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 05.01.2021 19:31, Roger Pau Monne wrote:
> Modify hvm_pirq_eoi to always EOI the interrupt if required, instead
> of not doing such EOI if the interrupt is routed through the vIO-APIC
> and the entry is masked at the time the EOI is performed.
> 
> Further unmask of the vIO-APIC pin won't EOI the interrupt, and thus
> the guest OS has to wait for the timeout to expire and the automatic
> EOI to be performed.
> 
> This allows to simplify the helpers and drop the vioapic_redir_entry
> parameter from all of them.
> 
> Fixes: ccfe4e08455 ('Intel vt-d specific changes in arch/x86/hvm/vmx/vtd.')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> ---
> Kind of RFC, I've been trying to figure out how this was supposed to
> work, and couldn't find any reason why the EOI is not performed if the
> interrupt is masked on the emulated IO-APIC. I might be missing
> something, but relying on the EOI timeout in that case seems wrong.

Fully agree. If archeology didn't surface an explanation, I'd
assume the dependency was put in mistakenly, perhaps because
most other operations need to respect the mask bit.

Jan

