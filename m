Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EECA1A97A3C
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 00:12:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963683.1354642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Lqc-0008PY-Ah; Tue, 22 Apr 2025 22:12:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963683.1354642; Tue, 22 Apr 2025 22:12:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Lqc-0008N4-7f; Tue, 22 Apr 2025 22:12:10 +0000
Received: by outflank-mailman (input) for mailman id 963683;
 Tue, 22 Apr 2025 22:12:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8D33=XI=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u7Lqa-0008My-2p
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 22:12:08 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2a45ee5-1fc6-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 00:12:04 +0200 (CEST)
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
X-Inumbo-ID: d2a45ee5-1fc6-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=ot7zphdvgnbhbibcztnz3ebdca.protonmail; t=1745359923; x=1745619123;
	bh=o5AHj7v0rUutiT+6KBYPqTIG1FrzXaYJUK/nbhzU95c=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=D5z+c6o1wmEQEyBinIeCqEuQl+z2qklKnX33s7IOmRX5PDZMLNCgEqpLJRwQYb3n9
	 m8Sj9PBDJiwxLQfPuDvg+uKWuuozS7E9wuoeoDk7JHmKidDHVGrjcXvMXPJpSmOKar
	 KomcSVw2HiMaq1/bX6VojmcogakQ5yQnJWKHDXrRacTha5XzS4VkYmMkbPJmuGm6Ui
	 umKGE78YdnVltntYFl3MCfib2fMFqQxKdyU2rvBCWftpLQAAd/Sm1PyhRz928/z9YB
	 LTaknsTaBn51dbgcPZxSFX4HaWN7POjbX8b+FU7s6YyMTGI5XbtJ3z99YGuxGv9h+S
	 j7rcTYBwEmqCQ==
Date: Tue, 22 Apr 2025 22:11:59 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, roger.pau@citrix.com, dmukhin@ford.com
Subject: Re: [PATCH v2] x86/vmx: Update __vmread() signature
Message-ID: <aAgUKi8DadC6ZPMI@starscream>
In-Reply-To: <c76427bb-87b4-4c51-a057-1942b9c3d92c@suse.com>
References: <20250422011530.3010312-1-dmukhin@ford.com> <c76427bb-87b4-4c51-a057-1942b9c3d92c@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: dbfef3c29a2f18c4cb6830008ae13af7b9b5baca
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 09:56:00AM +0200, Jan Beulich wrote:
> On 22.04.2025 03:15, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Current implementation of __vmread() returns the result via pointer arg=
ument
> > which leads to having excess code in some places.
> >
> > Update the signature of __vmread() to return `unsigned long` and drop t=
he
> > pointer argument as per suggestion in [1].
> >
> > Update all call sites everywhere in the VT-x code.
>=20
> You did read Andrew's reply to v1 before posting v2, didn't you?

I missed to address the function name change request, posted v3:
  https://lore.kernel.org/xen-devel/20250422215833.522007-1-dmukhin@ford.co=
m/

>=20
> Jan


