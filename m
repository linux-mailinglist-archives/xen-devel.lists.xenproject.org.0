Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B19461CBA
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 18:28:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234774.407421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrkRz-0000Up-H3; Mon, 29 Nov 2021 17:28:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234774.407421; Mon, 29 Nov 2021 17:28:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrkRz-0000T2-Dp; Mon, 29 Nov 2021 17:28:23 +0000
Received: by outflank-mailman (input) for mailman id 234774;
 Mon, 29 Nov 2021 17:28:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pv+C=QQ=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mrkRy-0000Pd-24
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 17:28:22 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf38e279-5139-11ec-976b-d102b41d0961;
 Mon, 29 Nov 2021 18:28:20 +0100 (CET)
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
X-Inumbo-ID: bf38e279-5139-11ec-976b-d102b41d0961
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638206899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xqOKj3IZWMqS0ugg10eOFI5oEB30iI5TJapcXH2ni4A=;
	b=IOCjwDnV+IhR2HGDg4wVW6lOUizRnX5reRLkcfy7IRV/nMGiAjTI2+oGxxK38tfywRFsWe
	EqGxuI8LaAsxJ91CSBaG/Ny4PUPGFBzKec91201k62zrl5ylKwAJ7VvLVyjvYcmX97yJgJ
	jlhghtbx5kqCMWQEAQ6Tj79vF6/jFLq9K638DL4nnmZC2uTuC7qHv+hQouGs+XwIrl6AVQ
	RUinNzARNB8tKdwysaZqzVoSHC6uvNgYZe9de/S/0+EwNCAoJtBFbB2VaL+3HemYbbawj9
	uMUhH7WxAWbpeHyhP/oMxZ6AFxKlmnDpauO3W1U1WL5S8emIaNO/cYOI7lRQAA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638206899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xqOKj3IZWMqS0ugg10eOFI5oEB30iI5TJapcXH2ni4A=;
	b=Ka5WIX7ljoOUvjodiScPWGQPf8TJxN+HN3R45g4Re/IWJ59DCK96971cDB4QWE5pYu9633
	JWWorprRZAvg0xAA==
To: Marc Zyngier <maz@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>, Kevin Tian
 <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>, Megha Dey
 <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Andrew Cooper <amc96@cam.ac.uk>, Juergen Gross
 <jgross@suse.com>, linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [patch 03/10] genirq/msi: Make MSI descriptor alloc/free ready
 for range allocations
In-Reply-To: <87a6hof5sr.ffs@tglx>
References: <20211126233124.618283684@linutronix.de>
 <20211127000918.664542907@linutronix.de> <8735ngs26o.wl-maz@kernel.org>
 <87a6hof5sr.ffs@tglx>
Date: Mon, 29 Nov 2021 18:28:18 +0100
Message-ID: <877dcqeurx.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, Nov 28 2021 at 20:17, Thomas Gleixner wrote:
> On Sun, Nov 28 2021 at 15:57, Marc Zyngier wrote:
> Hrm. The stupid search should terminated nevertheless. Let me stare at
> it again.

Found it. Just my inability to read xarray documentation.

Thanks,

        tglx

