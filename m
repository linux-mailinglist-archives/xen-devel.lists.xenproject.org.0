Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E72B0AD08D5
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 21:48:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008778.1387945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNd25-0003UH-8p; Fri, 06 Jun 2025 19:47:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008778.1387945; Fri, 06 Jun 2025 19:47:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNd25-0003SE-5W; Fri, 06 Jun 2025 19:47:17 +0000
Received: by outflank-mailman (input) for mailman id 1008778;
 Fri, 06 Jun 2025 19:47:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fxa/=YV=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uNd23-0003S8-B6
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 19:47:16 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09df2f02-430f-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 21:47:12 +0200 (CEST)
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
X-Inumbo-ID: 09df2f02-430f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1749239231; x=1749498431;
	bh=BnQE95nEhr0HeFTdXiQDqAjIj1g84try2SvlY9hQV+A=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=YIbBOrtn7M3MJiF7TYxMud2A3RgFlZmO9P1tahoLxn1ma9VYNXDJQS4ZeWw8BJ7qj
	 HKmORPiq3rAVsPaJPjKRwF52lde3nsuA5kmDPsUbFisjeKalLGJW3/Vcrh5vqSXh2e
	 3RErj7ACjahspGrtCLrlfsTpzaFHW2ZXkJW7W1MXT/TqJyKj9SQueK6QxqIoL5+NSW
	 2MGRidLa0GTY2pwfOwd+otP71eVt9xGcVIfqfwqDPQmcYH7TVRdxVoe+uLlScEqV0N
	 Lac5TXz8f5/uaNBN+xpxQlQMYv4tDnNAZd9NaWyAcdUYDFF0eJa49y4TAVJt4oXeOb
	 lRiZdPCPLvMBg==
Date: Fri, 06 Jun 2025 19:47:04 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v2 2/2] xen/console: unify printout behavior for UART emulators
Message-ID: <aENFsfo8J5HGg4tN@kraken>
In-Reply-To: <a3145ba8-3372-4c3a-af39-df8cb84229ef@suse.com>
References: <20250605004601.1142090-1-dmukhin@ford.com> <20250605004601.1142090-3-dmukhin@ford.com> <842528df-d0ba-4ab2-b182-b6f824c82dc1@suse.com> <aEKTfxwSZwE78mr5@kraken> <a3145ba8-3372-4c3a-af39-df8cb84229ef@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 2d98d9230effb9e26878d248d16ae17a9faf88e3
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 06, 2025 at 09:12:06AM +0200, Jan Beulich wrote:
> On 06.06.2025 09:06, dmkhn@proton.me wrote:
> > On Thu, Jun 05, 2025 at 08:18:34AM +0200, Jan Beulich wrote:
> >> On 05.06.2025 02:46, dmkhn@proton.me wrote:
> >>> From: Denis Mukhin <dmukhin@ford.com>
> >>>
> >>> If virtual UART from domain X prints on the physical console, the beh=
avior is
> >>> updated to (see [1]):
> >>> - console focus in domain X: do not prefix messages;
> >>> - no console focus in domain X: prefix all messages with "(dX)".
> >>>
> >>> Use guest_printk() without rate-limiting in all current in-hypervisor=
 UART
> >>> emulators. That aligns the behavior with debug I/O port 0xe9 handler =
on x86 and
> >>> slightly improves the logging since guest_printk() already prints the=
 domain
> >>> ID. guest_printk() was modified to account for console focus ownershi=
p.
> >>>
> >>> Modify guest_console_write() for hardware domain case by adding domai=
n ID to
> >>> the message when hwdom does not have console focus.
> >>>
> >>> [1] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.24121216553=
60.463523@ubuntu-linux-20-04-desktop/
> >>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> >>> ---
> >>> Changes since v1:
> >>> - dropped change for debug port and for HYPERVISOR_console_io hyperca=
ll
> >>
> >> Yet then what about ...
> >>
> >>> --- a/xen/arch/arm/vuart.c
> >>> +++ b/xen/arch/arm/vuart.c
> >>> @@ -89,7 +89,7 @@ static void vuart_print_char(struct vcpu *v, char c=
)
> >>>          if ( c !=3D '\n' )
> >>>              uart->buf[uart->idx++] =3D '\n';
> >>>          uart->buf[uart->idx] =3D '\0';
> >>> -        printk(XENLOG_G_DEBUG "DOM%u: %s", d->domain_id, uart->buf);
> >>> +        guest_printk(d, "%s", uart->buf);
> >>>          uart->idx =3D 0;
> >>>      }
> >>>      spin_unlock(&uart->lock);
> >>
> >> ... this dropping of XENLOG_G_DEBUG? In fact I'd have expected such to
> >> be _added_ where presently missing.
> >
> > vUART is a debugging facility. This flavor of UART is specifically for =
guest OS
> > early boot debugging.
> > I think it is not desirable to potentially lose guest messages while do=
ing such
> > early guest OS boot debugging.
>=20
> That is the host admin's decision, not a policy we should enforce.

re: policy: agreed, I will drop that hunk.

I think for the policy control, there can be a compile time setting (separa=
te
patch) which enables/disables the debug output rate-limiting - and that set=
ting
applies to:
  - vUARTs (currently vpl011 and "vuart", later ns16550 (x86) and upcoming
    emulator for RISC-V)
  - debug port on x86
  - HYPERVISOR_console_io

What do you think?

>=20
> Jan


