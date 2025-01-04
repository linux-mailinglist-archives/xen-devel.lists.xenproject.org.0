Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEBBA01200
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 04:05:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865030.1276302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTuTg-0002DK-E6; Sat, 04 Jan 2025 03:05:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865030.1276302; Sat, 04 Jan 2025 03:05:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTuTg-0002Bo-BG; Sat, 04 Jan 2025 03:05:28 +0000
Received: by outflank-mailman (input) for mailman id 865030;
 Sat, 04 Jan 2025 03:05:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTuTe-0002Bi-QF
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 03:05:26 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be38529b-ca48-11ef-99a4-01e77a169b0f;
 Sat, 04 Jan 2025 04:05:25 +0100 (CET)
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
X-Inumbo-ID: be38529b-ca48-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735959924; x=1736219124;
	bh=5oKx6WeDf6Un5PibySC+vB5JLbGbDqax3sVCR+8XQo0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=fM5ScKQlwIBp9+3urliuLc+URhmXXt6kU+ecgArd72oMIIWlwTZhIuU0opi9RhWzY
	 Kdx0vcqx4dbyNh5uYxut5AUr97+IdYHS8PwmsMtYeRv9SGHLBzMwaNsKaqDUm8QHi8
	 7rNvXLyRYGvaH6WFo/KYSweapVO4+H794RVjTlnCEpgCrKCLhhKVTLMiy72bzbrngY
	 Y5MaVPAcG+fJVkBLHa44WHMDh26M0I8wkSkkgPrTeAeDlvgLoWiE9vZfL7QiBkRX4N
	 yYRB5b2xqpy3GPZ/hVQa4d422MU4sqqAOGs8DRPH++ap8o5eftHZeaBwIaif68JMFP
	 9I0/pfMw0ZcvQ==
Date: Sat, 04 Jan 2025 03:05:20 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 18/35] xen/console: introduce use of 'is_console' flag
Message-ID: <HSEMyFF-F-Nf0DSu-ZTw0qEJf4AcjdWfg1rsri8NcLZMZVkFzp1rMeLMOd7ywC-6C22XUjW_4ssLdrht2SfZljxXgfUEjTKYOCjs5Zddjpk=@proton.me>
In-Reply-To: <7ab4786b-15fa-4504-9694-f63b0f71c5a2@suse.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-18-e9aa923127eb@ford.com> <7ab4786b-15fa-4504-9694-f63b0f71c5a2@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 4f2a294a9f13b23a56a86c609a45c2a919cf02c4
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Tuesday, December 10th, 2024 at 6:52 AM, Jan Beulich <jbeulich@suse.com>=
 wrote:

>
>
> On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
>
> > From: Denis Mukhin dmukhin@ford.com
> >
> > The code now inspects d->is_console flag to decide whether the console =
focus
> > should move to the domain w/ console after administrator presses <Ctrl+=
aaa>.
> >
> > Console owner domain switch logic updated accordingly.
> >
> > Signed-off-by: Denis Mukhin dmukhin@ford.com
>
>
> Just as a remark, as it's a pre-existing problem: I'm unconvinced that
> "is_console" is a good name here.

I think it should be called something like console_perm.
I kept name as is for now, but I can make a change.

>
> > @@ -509,14 +509,20 @@ static void console_find_owner(void)
> > domid =3D get_initial_domain_id();
> > else
> > domid =3D next_rx - 1;
> > +
> > d =3D rcu_lock_domain_by_id(domid);
> > - if ( d )
> > + if ( d =3D=3D NULL )
>
>
> Seeing the original code, the more "natural" transformation would be to
> !d (as we use elsewhere as well, to keep code short).

Fixed.

>
> Jan



