Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5702A0485C
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 18:34:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866749.1278108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVDSs-0000lk-5N; Tue, 07 Jan 2025 17:34:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866749.1278108; Tue, 07 Jan 2025 17:34:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVDSs-0000j6-1U; Tue, 07 Jan 2025 17:34:02 +0000
Received: by outflank-mailman (input) for mailman id 866749;
 Tue, 07 Jan 2025 17:34:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1Lmc=T7=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tVDSq-0000j0-9A
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 17:34:01 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92b890c6-cd1d-11ef-99a4-01e77a169b0f;
 Tue, 07 Jan 2025 18:33:57 +0100 (CET)
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
X-Inumbo-ID: 92b890c6-cd1d-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1736271236; x=1736530436;
	bh=NYf+6+hrft/X5UEK8JE1eueVbjg1RUDSbo+OVeRWfLw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=jqtSO8HJGmGS8rJ1CrKC/jm/IolByH+Hb3ZRpI8OjollejcSOPBdJDyz10lJK1yMD
	 E8+q90YhUXVUammnJ0ukjPaEoKkJRGUMFRd4kuxYJkGbf0EMIqUCkNJEyIL5I7iTv3
	 uopLvPFuH5qHp/rm+FMb86OHXDAfP61gATISVi6ujhm3FIgVtUDu+3fX0t/4ce5/k5
	 xgS8SX/59eiBrgTWF2XiczP46s9NpuDA65j0ghRSVOyKghgrmS3j/2bv5d5TCDG6Ux
	 cPtdpNlhHEoen4fid2JsHrPwnGqX+rsEW85qj81SjK5X4Lw8FVw7QjHh3lHPCeLmkz
	 hsEBONgFqkaZQ==
Date: Tue, 07 Jan 2025 17:33:50 +0000
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 33/35] x86/domain: implement domain_has_vuart()
Message-ID: <8GErGVsReNynzNxyHVTyoG09VZfDD9A46tDUhGYekYMJ5C6liUOAYyi-esuVmIFlqmWt7O633k8YXQlfkhFKZ_452-FLcejATCdi56FVLzI=@proton.me>
In-Reply-To: <Z31FONoeaHVRHVxY@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-33-e9aa923127eb@ford.com> <Z1wnUzDCPDzHKr6o@macbook.local> <Tz4Idf7hUa85arksVC6UYYRNbhinY-0wHXqxIInbLCWGNiGZSEIvGNGLmICNLmHK5o7m6MUMhnUlrJX10WO1XHhyRSgCX7Gknz0xBGZJiD8=@proton.me> <Z31FONoeaHVRHVxY@macbook.local>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 434f4034104a78e8273f61ef49c230db62ca0eed
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Tuesday, January 7th, 2025 at 7:16 AM, Roger Pau Monn=C3=A9 <roger.pau@c=
itrix.com> wrote:

>
>
> On Sat, Jan 04, 2025 at 05:19:07AM +0000, Denis Mukhin wrote:
>
> > On Friday, December 13th, 2024 at 4:23 AM, Roger Pau Monn=C3=A9 roger.p=
au@citrix.com wrote:
> >
> > > Albeit PVH is kind of HVM.
> >
> > PVH does not have vPIC so there's some more work to enable vUART
> > for PVH on x86: emulator currently supports only ISA IRQs.
>
>
> But it does support vIO-APIC (as it's used for hardware PVH domain),
> so serial interrupts could still be delivered using the vIO-APIC if
> the guest has correctly configured the pin?

re: virtual I/O APIC: correct, that's what I meant by "more work":
I did not debug PVH in detail yet.

My plan is to enable PVH in a separate patch (timeline - v4, since v3
it out recently).

>
> Thanks, Roger.

