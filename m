Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA80A011FC
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 03:58:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865008.1276281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTuMT-0007EV-EV; Sat, 04 Jan 2025 02:58:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865008.1276281; Sat, 04 Jan 2025 02:58:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTuMT-0007CK-By; Sat, 04 Jan 2025 02:58:01 +0000
Received: by outflank-mailman (input) for mailman id 865008;
 Sat, 04 Jan 2025 02:58:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTuMS-0007CE-My
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 02:58:00 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4ac9c89-ca47-11ef-a0de-8be0dac302b0;
 Sat, 04 Jan 2025 03:57:59 +0100 (CET)
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
X-Inumbo-ID: b4ac9c89-ca47-11ef-a0de-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735959478; x=1736218678;
	bh=E4Ia3cd3hJv6108BJqK6DAfB/eDvahoG2f548nG4GjI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Ow+TF6rCmjL5xsDEM9iMYq/qWsy+nV0qaxMs1JKnkcVKkIVXPH88YMWH4o2NaRpTk
	 1d2IWcPr9ue4bH41+vnTW+5QzYpuji4Od2VyXrBMJKBzSStFvrsSuxP5JF66Zqy/dd
	 YFiQyqBHkCsLsbxLzYLAW2BbNKbgt2HrXE/yGYJ2NA72SSz5YwEh9rR+Mno4ObpL1A
	 WQlIA5boO85o3ULZ9rCt4ugyvaVcq98somMfoGgeoFM1VQ3LImCmzgPX8i5iu1Tccq
	 J3+ghsjrcIAvxblWHALp8lxDl7Yd4xqbSV1btO2+ysrVL97dklrfNvA6C/HntXSVc9
	 HNTEr3bUYORTQ==
Date: Sat, 04 Jan 2025 02:57:54 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 16/35] xen/console: introduce printk_common()
Message-ID: <hYzpsKcLLQl-hDLJQHJZSrZtcT5PVx6qx3aKoTyDtH-EYxMtYA9XKavqTvfukRQshSpt9ffdH0MyiqSdglLWtNTSPGduWBOnUbb4DLfityc=@proton.me>
In-Reply-To: <9c9120f6-6291-43d1-93ac-deebdc222f3e@suse.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-16-e9aa923127eb@ford.com> <9c9120f6-6291-43d1-93ac-deebdc222f3e@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: ac4611139d91b031976d6bbd9d77977a5b45677d
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, December 10th, 2024 at 6:27 AM, Jan Beulich <jbeulich@suse.com>=
 wrote:

>
>
> On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
>
> > Introduce new printk() variant for convenient printouts which skip '(XE=
N)'
> > prefix on xen console. This is needed for the case when physical consol=
e is
> > owned by a domain w/ in-hypervisor UART emulation enabled.
>
>
> Imo it should still be guest_printk() which is then used from there.

I ended up w/ printk_noprefix(): vprintk_common() expects user-defined pref=
ix,
while original printk_common() does not expect prefix. Such inconsistency
may be confusing because both functions are named xxx_common().

>
> > --- a/xen/include/xen/lib.h
> > +++ b/xen/include/xen/lib.h
> > @@ -61,6 +61,9 @@ debugtrace_printk(const char *fmt, ...) {}
> > extern void printk(const char *fmt, ...)
> > attribute ((format (printf, 1, 2), cold));
> >
> > +extern void printk_common(const char *fmt, ...)
> > + attribute ((format (printf, 1, 2)));
>
>
> No "cold" attribute, compared to printk()?

Thanks, fixed.

>
> Jan



