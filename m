Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD3B2B4B26
	for <lists+xen-devel@lfdr.de>; Mon, 16 Nov 2020 17:31:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28536.57641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kehP6-00039l-O0; Mon, 16 Nov 2020 16:30:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28536.57641; Mon, 16 Nov 2020 16:30:56 +0000
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
	id 1kehP6-00039M-KQ; Mon, 16 Nov 2020 16:30:56 +0000
Received: by outflank-mailman (input) for mailman id 28536;
 Mon, 16 Nov 2020 16:30:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ru3m=EW=kernel.org=luto@srs-us1.protection.inumbo.net>)
 id 1kehP5-00039H-Di
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 16:30:55 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3e48c782-6f97-48db-a3e1-60d15c4574d2;
 Mon, 16 Nov 2020 16:30:54 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AC8B520776
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2020 16:30:53 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id s8so19326221wrw.10
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2020 08:30:53 -0800 (PST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ru3m=EW=kernel.org=luto@srs-us1.protection.inumbo.net>)
	id 1kehP5-00039H-Di
	for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 16:30:55 +0000
X-Inumbo-ID: 3e48c782-6f97-48db-a3e1-60d15c4574d2
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 3e48c782-6f97-48db-a3e1-60d15c4574d2;
	Mon, 16 Nov 2020 16:30:54 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id AC8B520776
	for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2020 16:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605544254;
	bh=2O3LBp1HPw0KQ1G2spNpvOUgelxUM0n8eKWWsC7ds30=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dqOsYI+0YGbb9NsAnIzVJVzN0+ZCeTcljVXkHY3Ca9c9X+hnuCJH8G2FUn67vfd9U
	 obw74aqxw/UPBefBUp/bAQMVgF7JOQ9WyTuYSFtDMR4oweOAreMWzRFjeNPN566/DC
	 MYCetQ39nn4CSqfi8ZhF3wCBDvpGh7bvgBDqVpPc=
Received: by mail-wr1-f49.google.com with SMTP id s8so19326221wrw.10
        for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2020 08:30:53 -0800 (PST)
X-Gm-Message-State: AOAM533uDR5uUtsH+0gO/orTWljHAQYcyONIpxXUtiPGPN8BEqsn6PlY
	gzybpLrYE+3R+s8JBWU4SWkTkIcZLItyo4y0tTNdpw==
X-Google-Smtp-Source: ABdhPJxRrSLHlH4ScZov5CaCHz95dre2M6ViQYOjxHY5oh3r9MUJXokIlLxakAYO4Hpet3isswmFWL/5m9Ab6jgvvwU=
X-Received: by 2002:a5d:5482:: with SMTP id h2mr9404192wrv.18.1605544252224;
 Mon, 16 Nov 2020 08:30:52 -0800 (PST)
MIME-Version: 1.0
References: <20201116152301.24558-1-jgross@suse.com> <20201116152301.24558-5-jgross@suse.com>
In-Reply-To: <20201116152301.24558-5-jgross@suse.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Mon, 16 Nov 2020 08:30:38 -0800
X-Gmail-Original-Message-ID: <CALCETrVMX+D1fv3bbb7F_Cp2SfrFBudUqJk=uR3AJkgQ_KCniQ@mail.gmail.com>
Message-ID: <CALCETrVMX+D1fv3bbb7F_Cp2SfrFBudUqJk=uR3AJkgQ_KCniQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] x86/xen: drop USERGS_SYSRET64 paravirt call
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, X86 ML <x86@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	Linux Virtualization <virtualization@lists.linux-foundation.org>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Deep Shah <sdeep@vmware.com>, 
	"VMware, Inc." <pv-drivers@vmware.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 16, 2020 at 7:23 AM Juergen Gross <jgross@suse.com> wrote:
>
> USERGS_SYSRET64 is used to return from a syscall via sysret, but
> a Xen PV guest will nevertheless use the iret hypercall, as there
> is no sysret PV hypercall defined.
>
> So instead of testing all the prerequisites for doing a sysret and
> then mangling the stack for Xen PV again for doing an iret just use
> the iret exit from the beginning.
>
> This can easily be done via an ALTERNATIVE like it is done for the
> sysenter compat case already.
>
> While at it remove to stale sysret32 remnants.

s/to/the/

