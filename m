Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA5E2959C5
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 10:02:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10242.27152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVVXl-0001Xw-Dw; Thu, 22 Oct 2020 08:01:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10242.27152; Thu, 22 Oct 2020 08:01:53 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVVXl-0001XX-AU; Thu, 22 Oct 2020 08:01:53 +0000
Received: by outflank-mailman (input) for mailman id 10242;
 Thu, 22 Oct 2020 08:01:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z30Q=D5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVVXj-0001XS-U4
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 08:01:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 94db193d-5262-4ce4-819d-d849086619ad;
 Thu, 22 Oct 2020 08:01:51 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 270F9AE7A;
 Thu, 22 Oct 2020 08:01:50 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Z30Q=D5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVVXj-0001XS-U4
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 08:01:51 +0000
X-Inumbo-ID: 94db193d-5262-4ce4-819d-d849086619ad
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 94db193d-5262-4ce4-819d-d849086619ad;
	Thu, 22 Oct 2020 08:01:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603353710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=al5X9k9TmXnWVtHnDRc3HqlGbm+NoIWAXwyHFtAngDw=;
	b=cvLN1NFO4flcJ7AqVjmOAOYFNPxed6JADv1j2NB9NnIE/WIqa9Y1zTrnZjfjt9QbjwXhcp
	9vW4/GI6DGzMeNr16xacgc9d6c58Z1h1WWKIRVyyPWF/OKW6Q+52qGGG/ZMXYmMvuK3hoC
	gDRGji9S/lulT/lCAcVc6a7EupoAzZY=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 270F9AE7A;
	Thu, 22 Oct 2020 08:01:50 +0000 (UTC)
Subject: Re: [PATCH 0/5] xen: event handling cleanup
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 x86@kernel.org, linux-doc@vger.kernel.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Jonathan Corbet <corbet@lwn.net>
References: <20201022074214.21693-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9f2c78c8-da92-1b64-02ba-1130bfc79962@suse.com>
Date: Thu, 22 Oct 2020 10:01:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201022074214.21693-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22.10.2020 09:42, Juergen Gross wrote:
> Do some cleanups in Xen event handling code.
> 
> Juergen Gross (5):
>   xen: remove no longer used functions
>   xen/events: make struct irq_info private to events_base.c
>   xen/events: only register debug interrupt for 2-level events
>   xen/events: unmask a fifo event channel only if it was masked
>   Documentation: add xen.fifo_events kernel parameter description

With the two remarks to individual patches suitably taken care of
one way or another
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

