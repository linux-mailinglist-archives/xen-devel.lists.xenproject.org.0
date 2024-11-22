Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3F79D6076
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2024 15:37:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841923.1257395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEUlh-0001er-4d; Fri, 22 Nov 2024 14:36:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841923.1257395; Fri, 22 Nov 2024 14:36:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEUlh-0001dO-1w; Fri, 22 Nov 2024 14:36:21 +0000
Received: by outflank-mailman (input) for mailman id 841923;
 Fri, 22 Nov 2024 14:36:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M8TA=SR=codewreck.org=asmadeus@srs-se1.protection.inumbo.net>)
 id 1tEUlf-0001dI-2x
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2024 14:36:20 +0000
Received: from submarine.notk.org (submarine.notk.org [2001:bc8:3310:100::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 1ffad40e-a8df-11ef-99a3-01e77a169b0f;
 Fri, 22 Nov 2024 15:36:14 +0100 (CET)
Received: from gaia.codewreck.org (localhost [127.0.0.1])
 by submarine.notk.org (Postfix) with ESMTPS id E1E2B14C1E1;
 Fri, 22 Nov 2024 15:36:09 +0100 (CET)
Received: from localhost (gaia.codewreck.org [local])
 by gaia.codewreck.org (OpenSMTPD) with ESMTPA id df0f998c;
 Fri, 22 Nov 2024 14:36:08 +0000 (UTC)
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
X-Inumbo-ID: 1ffad40e-a8df-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIwMDE6YmM4OjMzMTA6MTAwOjoxIiwiaGVsbyI6InN1Ym1hcmluZS5ub3RrLm9yZyJ9
X-Custom-Transaction: eyJpZCI6IjFmZmFkNDBlLWE4ZGYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMjg2MTc0LjczMzc4Niwic2VuZGVyIjoiYXNtYWRldXNAY29kZXdyZWNrLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org;
	s=2; t=1732286173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w8v3+aQO1zVNTDKznW1DiFi9l9+YX7MeVTMpaVHPOvE=;
	b=H9pW8oao5PKjueGtaVXyFvQ8wm/8qmT4yo9QeGkV5eRrBUvsTVNtF2Oqqy7rpW04CjGwiq
	y9/5ObirE/rFJocrKksXYSnhCpP0FfhO6QwaIR92CiD2R8r45kdnGbjfkFDOuuIuoRqUV9
	h6Wj8QVbhjQF/pcolpMhMNKrS3IlRV5PqjFapY528TnG9TaFOZkBRh1jhjuh/yodWfrA7B
	+vBZdEFa2XLDDxNgBdoWvoFMcERcTn0tz5CQmOn0RSCmFHaVpTfWxICqiaUSL0XyEUSCWl
	wCRswW2eU430Xw3NhFtdT5xTD+yOaj+4000L6gpSEvMosWAaqb+NLaqKNB4f0A==
Date: Fri, 22 Nov 2024 23:35:53 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Alexander Merritt <alexander@edera.dev>, v9fs@lists.linux.dev,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alex Zenla <alex@edera.dev>, Ariadne Conill <ariadne@ariadne.space>
Subject: Re: [PATCH] 9p/xen: fix release of IRQ
Message-ID: <Z0CWyXuMiifOv7HO@codewreck.org>
References: <20241121225100.5736-1-alexander@edera.dev>
 <Zz_F9wMda68xhvKa@codewreck.org>
 <a6570b47-217c-4e92-a64c-16fc34494e3e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a6570b47-217c-4e92-a64c-16fc34494e3e@suse.com>

Jürgen Groß wrote on Fri, Nov 22, 2024 at 02:54:06PM +0100:
> > (style) I don't recall seeing much `a = b = 0` in the kernel, and
> > looking at it checkpatch seems to complain:
> > CHECK: multiple assignments should be avoided
> > #114: FILE: net/9p/trans_xen.c:290:
> > +		priv->rings[i].evtchn = priv->rings[i].irq = 0;
> > 
> > Please run checkpatch on the patches you send (b4 can do it for you if
> > you want to start using it)
> > 
> > 
> > code-wise,
> > I also don't see where unbinf_from_irqhandler would free the evtchn, so
> > is it leaking here, or is it implicit from something else?
> > We only free it explicitly on error binding the irq.
> 
> unbind_from_irqhandler()
>   unbind_from_irq()
>     __unbind_from_irq()
>       close_evtchn()

Thank you, I didn't go far enough.

And also, bah; I just spent 30 minutes thinking why would setting irq to
zero prevent anything, but the bulk of the patch was using the correct
device for unbind (as the commit correctly says, I just saw double-free
and setting something to 0 after free as being related)
I'll just remove this darned line, as the free function can't walk a
ring twice anyway.


Also this made me notice xen_9pfs_front_init calls xen_9pfs_front_free()
on error, but that init is part of a front_changed call and I'd bet
xen_9pfs_front_remove() will still be called afterwards.
If init failure ought to free then it probably should unset drvdata
first like remove, and remove (and possibly many other dev_get_drvdata
calls) should check for null; otherwise it's probably best to leave it
to remove to call free exactly once...

-- 
Dominique Martinet | Asmadeus

