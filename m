Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C1DA011F5
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 03:49:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864965.1276232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTuED-0002Br-Sq; Sat, 04 Jan 2025 02:49:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864965.1276232; Sat, 04 Jan 2025 02:49:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTuED-00029w-Q6; Sat, 04 Jan 2025 02:49:29 +0000
Received: by outflank-mailman (input) for mailman id 864965;
 Sat, 04 Jan 2025 02:49:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aU+0=T4=protonmail.com=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTuEB-00029m-RP
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 02:49:28 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 825323c3-ca46-11ef-99a4-01e77a169b0f;
 Sat, 04 Jan 2025 03:49:25 +0100 (CET)
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
X-Inumbo-ID: 825323c3-ca46-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1735958964; x=1736218164;
	bh=6ngrASUQxIp4Qsgrox320tZHgYlM3fZX3kGH+4ZHzvs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=YVHymixHQG9nIxI/rQHnDWP3UyvaRl2eznAfa4LqnHZidW0HDMdVtogy/CQqHu5et
	 Ze/t5DANTBRur77BnO+D5xP/tGGZpmbvnJKqbPKDXHgBNctlLhBXaUzw6qevWAdd5M
	 /skAgrq4ne3sBGozx4rfyyaBAQ+ePhGLrORPhJrF26G+mRMSKj5CO+1g2XnTnEJUUe
	 CUH45p74nyecIKHg0DQOu+l+RlzZMZxuqSEB98I3mSnOlNT5M96R/aHmjfECqAnHUO
	 RczfXLtuTKr5zRHyulM6SaaI+6C03VmkcXG8vuCzDaHeE55dzY2A7mNSeqzK7jnNGo
	 ClqzhbauFBdgg==
Date: Sat, 04 Jan 2025 02:49:17 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@protonmail.com>
Cc: dmukhin@ford.com, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 12/35] xen/console: move vpl011-related code to vpl011 emulator
Message-ID: <nYIZUZ8P8_11UqKc4051P3o20npdWRNgy90-oNXkEj1y6AVPkUWM2-ARVJ7XLcdeah8qhATCd9U6-hdT0OxBKFTwpHh0hyxgA-nTGXNFRsk=@protonmail.com>
In-Reply-To: <ad47f490-c2a2-4a61-b9ed-a5830d93c3a4@suse.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-12-e9aa923127eb@ford.com> <ad47f490-c2a2-4a61-b9ed-a5830d93c3a4@suse.com>
Feedback-ID: 33633869:user:proton
X-Pm-Message-ID: daf682176c56f00bc9ebcb148926af85f6848ba0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, December 10th, 2024 at 5:33 AM, Jan Beulich <jbeulich@suse.com>=
 wrote:

>
>
> On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
>
> > --- a/xen/arch/arm/include/asm/vpl011.h
> > +++ b/xen/arch/arm/include/asm/vpl011.h
> > @@ -69,7 +69,7 @@ struct vpl011_init_info {
> > int domain_vpl011_init(struct domain *d,
> > struct vpl011_init_info *info);
> > void domain_vpl011_deinit(struct domain *d);
> > -void vpl011_rx_char_xen(struct domain *d, char c);
> > +int vpl011_rx_char_xen(struct domain *d, char c);
>
>
> If you make the function return an error indicator, ...
>
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -559,9 +559,7 @@ static void __serial_rx(char c)
> > * domain, without a full PV ring to Dom0 (in that case input
> > * comes from the PV ring), then send the character to it.
> > */
> > - if ( d !=3D NULL &&
> > - !d->arch.vpl011.backend_in_domain &&
> > - d->arch.vpl011.backend.xen !=3D NULL )
> > + if ( d !=3D NULL )
> > vpl011_rx_char_xen(d, c);
> > else
> > printk("Cannot send chars to Dom%d: no UART available\n",
>
>
> ... how come that return value then isn't used anywhere?

That I overlooked; fixed.

>
> Jan

