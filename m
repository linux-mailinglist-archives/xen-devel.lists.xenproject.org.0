Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A80942D4C68
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 22:04:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48708.86163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn6cn-0001zw-Cy; Wed, 09 Dec 2020 21:03:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48708.86163; Wed, 09 Dec 2020 21:03:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn6cn-0001zX-8k; Wed, 09 Dec 2020 21:03:49 +0000
Received: by outflank-mailman (input) for mailman id 48708;
 Wed, 09 Dec 2020 21:03:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/1wO=FN=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1kn6cm-0001zP-BB
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 21:03:48 +0000
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5508bce5-3da2-469e-899c-6132280d8484;
 Wed, 09 Dec 2020 21:03:47 +0000 (UTC)
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
X-Inumbo-ID: 5508bce5-3da2-469e-899c-6132280d8484
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1607547826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vH7YX6Q8hF6owa+mw8R0RFamxdvfP3I6NKP6vgDZYXk=;
	b=4dfcI2KN69tAMiPB1RlzL+VJZBM9MiERByCXwyO77yIXJSfgKBurVkcVv/1WUd35OqMzx6
	+pOlgB5wRy4xEGOOepk2c4S5oXiKY4juJE+1UQWI7G8pNUuIxv/ltZSAGNiWUOg7wJVXYy
	IcofZHjaAmAOrUcOjze6mBHLF7ALWMq+hQSJxRIdd1OSbrQr+zkX8EBI3vkbyBshl6Gf7w
	zOgK8/ZzJx5gNn58BdUxsRBZ5Or3fntZgYXFITjFwuzr22F9yJiJeJ/hDn0aGoIqvBSc78
	wrVSsSrY2OzpSbZyaCZiiiIIJkxyrAFDFPgcPIaJ/TUYnfLbVTP9HTN0ylNqAA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1607547826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vH7YX6Q8hF6owa+mw8R0RFamxdvfP3I6NKP6vgDZYXk=;
	b=Y/yO9t+Cv1wex1RlcyfpDs0lGoIkdsSOId+znpJt0SIpjdwY4lFZTBM1lsCIKwK1UJn79A
	foY/KqON7X1HpbBQ==
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, x86@kernel.org, linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, luto@kernel.org, Juergen Gross <jgross@suse.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 02/12] x86/xen: use specific Xen pv interrupt entry for DF
In-Reply-To: <20201120114630.13552-3-jgross@suse.com>
References: <20201120114630.13552-1-jgross@suse.com> <20201120114630.13552-3-jgross@suse.com>
Date: Wed, 09 Dec 2020 22:03:45 +0100
Message-ID: <874kkulmj2.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Nov 20 2020 at 12:46, Juergen Gross wrote:
> Xen PV guests don't use IST. For double fault interrupts switch to
> the same model as NMI.
>
> Correct a typo in a comment while copying it.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

