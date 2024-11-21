Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE56C9D5664
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2024 00:46:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841696.1257196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEGrT-0000JD-GB; Thu, 21 Nov 2024 23:45:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841696.1257196; Thu, 21 Nov 2024 23:45:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEGrT-0000HS-DE; Thu, 21 Nov 2024 23:45:23 +0000
Received: by outflank-mailman (input) for mailman id 841696;
 Thu, 21 Nov 2024 23:45:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zSRA=SQ=codewreck.org=asmadeus@srs-se1.protection.inumbo.net>)
 id 1tEGrQ-0000FZ-N3
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2024 23:45:22 +0000
Received: from submarine.notk.org (submarine.notk.org [62.210.214.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id a890ffed-a862-11ef-99a3-01e77a169b0f;
 Fri, 22 Nov 2024 00:45:16 +0100 (CET)
Received: from gaia.codewreck.org (localhost [127.0.0.1])
 by submarine.notk.org (Postfix) with ESMTPS id 3FFB014C1E1;
 Fri, 22 Nov 2024 00:45:12 +0100 (CET)
Received: from localhost (gaia.codewreck.org [local])
 by gaia.codewreck.org (OpenSMTPD) with ESMTPA id 4c7bd5de;
 Thu, 21 Nov 2024 23:45:10 +0000 (UTC)
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
X-Inumbo-ID: a890ffed-a862-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjYyLjIxMC4yMTQuODQiLCJoZWxvIjoic3VibWFyaW5lLm5vdGsub3JnIn0=
X-Custom-Transaction: eyJpZCI6ImE4OTBmZmVkLWE4NjItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMjMyNzE2LjI0Mjg4MSwic2VuZGVyIjoiYXNtYWRldXNAY29kZXdyZWNrLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org;
	s=2; t=1732232715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u8f+LwLszrHbolnXZg0ayVqT0diIxwr+pKK0O36nMkc=;
	b=TCI0vHQCYt9Ne5WwZakn3LuGnVwTUvRvp9HbK3hL08JRMIEqVU4Z7hNN4kzh0FVPwjAywi
	6O2LwTnY39QT6MRKEFrIm9uGYcDoWuq4dQf0a4aUjR833EJy/yeN2Mdk8c+bfe2WcqtUeu
	oAYPLqA2/lsSbaWQOfoekEjym6gncUNJbeT54wSJJvPfhpDFgN9l3WaVuyX2dFabERrGS9
	Hm2w+ZiwnSt5fGV+olA5QUn3EqcgnwI7F/z4A5HpQYVV1rFbMGUrylqptro+d5JCF2kNcv
	iWbMtn1rwVDyyXM3q1xNGfag91TQzAA8bQAcpofwEFJ6sMQy33q0gAVyvIJNsw==
Date: Fri, 22 Nov 2024 08:44:55 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: Alexander Merritt <alexander@edera.dev>
Cc: v9fs@lists.linux.dev, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alex Zenla <alex@edera.dev>, Ariadne Conill <ariadne@ariadne.space>
Subject: Re: [PATCH] 9p/xen: fix release of IRQ
Message-ID: <Zz_F9wMda68xhvKa@codewreck.org>
References: <20241121225100.5736-1-alexander@edera.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241121225100.5736-1-alexander@edera.dev>

Alexander Merritt wrote on Thu, Nov 21, 2024 at 10:51:00PM +0000:
> From: Alex Zenla <alex@edera.dev>
> 
> Kernel logs indicate an IRQ was double-freed.

Nit: if you still have the log it'd be great to include it in the commit
message, rather than paragraphing it.

The rationale is that someone with the same problem will likely just
search for the error as is first, and having it in the commit log will
be an easy hit.

(This alone wouldn't need a resend, I can add it if you just reply to
the mail with it; it's also fine if you no longer have the log, that'll
be a remark for the next patch)


> 
> Pass correct device ID during IRQ release.
> 
> Fixes: 71ebd71921e45 ("xen/9pfs: connect to the backend")
> Signed-off-by: Alex Zenla <alex@edera.dev>
> Signed-off-by: Alexander Merritt <alexander@edera.dev>
> Signed-off-by: Ariadne Conill <ariadne@ariadne.space>



> ---
>  net/9p/trans_xen.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/net/9p/trans_xen.c b/net/9p/trans_xen.c
> index dfdbe1ca5338..198d46d79d84 100644
> --- a/net/9p/trans_xen.c
> +++ b/net/9p/trans_xen.c
> @@ -286,7 +286,8 @@ static void xen_9pfs_front_free(struct xen_9pfs_front_priv *priv)
>  		if (!priv->rings[i].intf)
>  			break;
>  		if (priv->rings[i].irq > 0)
> -			unbind_from_irqhandler(priv->rings[i].irq, priv->dev);
> +			unbind_from_irqhandler(priv->rings[i].irq, ring);
> +		priv->rings[i].evtchn = priv->rings[i].irq = 0;

(style) I don't recall seeing much `a = b = 0` in the kernel, and
looking at it checkpatch seems to complain:
CHECK: multiple assignments should be avoided
#114: FILE: net/9p/trans_xen.c:290:
+		priv->rings[i].evtchn = priv->rings[i].irq = 0;

Please run checkpatch on the patches you send (b4 can do it for you if
you want to start using it)


code-wise,
I also don't see where unbinf_from_irqhandler would free the evtchn, so
is it leaking here, or is it implicit from something else?
We only free it explicitly on error binding the irq.



Thanks,
-- 
Dominique Martinet | Asmadeus

