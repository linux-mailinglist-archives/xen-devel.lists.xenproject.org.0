Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C95312D4C7D
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 22:07:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48746.86247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn6g8-0002ri-PX; Wed, 09 Dec 2020 21:07:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48746.86247; Wed, 09 Dec 2020 21:07:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn6g8-0002rH-MF; Wed, 09 Dec 2020 21:07:16 +0000
Received: by outflank-mailman (input) for mailman id 48746;
 Wed, 09 Dec 2020 21:07:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/1wO=FN=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1kn6g7-0002r0-Af
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 21:07:15 +0000
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5ec88874-25f3-4748-be12-9189e4afa396;
 Wed, 09 Dec 2020 21:07:13 +0000 (UTC)
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
X-Inumbo-ID: 5ec88874-25f3-4748-be12-9189e4afa396
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1607548032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L7i3CPNAPt2KU+IZb9dhE7iSR6cyuRM8HyieTAr/YYg=;
	b=kq1OHmCQNTXmjFxRiiYQCtMcgHsW2nl9XwXEhd2UDC34JY4VqsuqNqWdgTS3YK0B2HTN0a
	GLiGRqcl4feIgRGti60S5LHayQAwiZFaJ2AcyKwnEyQbepXQ2jz8X8vNbxqDaot95wevaf
	Lz67AUgT8+6fwzbCvE7SbExB3ThHr/fHr+UAilkliO85KAQIMK7eww5bH7SAetpnob4Kqc
	q6ySWnueDo4tqYCw7qzFmoI9zbcSv58CxsWPgdnODOP/uZ4j59J5/wPRhcDpcZpcic0r+V
	wcfFMs/wLf2fAEfHBp8cin02bVRhQTrk424mMLHkmAmUY5hzxKqvWbPQgnwCnw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1607548032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L7i3CPNAPt2KU+IZb9dhE7iSR6cyuRM8HyieTAr/YYg=;
	b=htO3ZaH9N+kRa526lyS/ICS9mPFUq9txIKXd3dIhl9PtBy0srICRWtTNhIRq5W11XlRqAu
	yEM17S/seRxu7uBg==
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, x86@kernel.org, linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
Cc: peterz@infradead.org, luto@kernel.org, Juergen Gross <jgross@suse.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Deep Shah <sdeep@vmware.com>, "VMware\, Inc." <pv-drivers@vmware.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 03/12] x86/pv: switch SWAPGS to ALTERNATIVE
In-Reply-To: <20201120114630.13552-4-jgross@suse.com>
References: <20201120114630.13552-1-jgross@suse.com> <20201120114630.13552-4-jgross@suse.com>
Date: Wed, 09 Dec 2020 22:07:12 +0100
Message-ID: <871rfylmdb.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Nov 20 2020 at 12:46, Juergen Gross wrote:
> SWAPGS is used only for interrupts coming from user mode or for
> returning to user mode. So there is no reason to use the PARAVIRT
> framework, as it can easily be replaced by an ALTERNATIVE depending
> on X86_FEATURE_XENPV.
>
> There are several instances using the PV-aware SWAPGS macro in paths
> which are never executed in a Xen PV guest. Replace those with the
> plain swapgs instruction. For SWAPGS_UNSAFE_STACK the same applies.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Andy Lutomirski <luto@kernel.org>
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

