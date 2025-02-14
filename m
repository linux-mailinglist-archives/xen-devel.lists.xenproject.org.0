Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D36A7A35816
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 08:43:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888453.1297813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiqLu-0002m3-Po; Fri, 14 Feb 2025 07:43:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888453.1297813; Fri, 14 Feb 2025 07:43:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiqLu-0002jH-MQ; Fri, 14 Feb 2025 07:43:10 +0000
Received: by outflank-mailman (input) for mailman id 888453;
 Fri, 14 Feb 2025 07:43:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w5DB=VF=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tiqLs-0002is-KA
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 07:43:09 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 540d4357-eaa7-11ef-9896-31a8f345e629;
 Fri, 14 Feb 2025 08:43:06 +0100 (CET)
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
X-Inumbo-ID: 540d4357-eaa7-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1739518985; x=1739778185;
	bh=pUEjGZQurVCv8OvZM5l+TP/SNdoBojCtmzrGsfazBTg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=FYJMb7QrAmHnk9eUva7MawxNTqPztuZPjJwMzXKCscdsvLROuXEUxWQoERaVt0nDH
	 6n3BTpMmW9DYppif5MJIjKKc7c10pHrQV950eCYEjwltArIaMp/VpXV0kD1CYF1yp0
	 3oDwsKfS7ubq1ygN9fZXFqTiu+XaqYOp8vqFktwPGYfUnz7Mu/Cu6uqvePHNcPX/ln
	 nwElW1T10XNa3ORk4fWywUB3nH6iPRS8W2NXYpNLBYq/HQhfUCFSDUqCcAu4qG57lU
	 3OWA47dJ7Enu78IOtIvmbxiLtptOvItFZwftjTOih44RrXGNDgvMQgngxl3Jx4HBlH
	 55NnJbMtylzNA==
Date: Fri, 14 Feb 2025 07:42:59 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: xen-devel@lists.xenproject.org, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH] xen/console: pre-compute domain prefix for printouts
Message-ID: <KMnZyKFiAiumFkB8YqvHd5mUNC6noJlYDlScm4Qvw16kFuETniRGWZUBYqlsc-C6VZ0uJXBLaqjLXbNo2oYDmTSzFniBe5g-dtB_q7P3ts4=@proton.me>
In-Reply-To: <30dbb0ca-33d8-40fa-9c98-9ea266ff44c2@citrix.com>
References: <20250213214350.1745843-1-dmukhin@ford.com> <30dbb0ca-33d8-40fa-9c98-9ea266ff44c2@citrix.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 8877e18fa44a4eed40d40e591ac36d3aa78342de
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, February 13th, 2025 at 3:28 PM, Andrew Cooper <andrew.cooper3@=
citrix.com> wrote:

>
>
> On 13/02/2025 10:35 pm, dmkhn@proton.me wrote:
>
> > Every guest_printk() call computes "(d%d) " prefix on every call.
> > Move prefix generation to the domain creation time.
> >
> > Signed-off-by: Denis Mukhin dmukhin@ford.com
>
>
> I'm on the fence here.
>
> Part of that is speaking as someone who has had to shrink struct domain
> several times to keep it fitting within 1 page.
>
> But as to calculating it every time, does that matter? In production
> environments, we get a handful of print lines per domain across their
> lifetime. Is the saving really worth it?

Our setup should support domain restarts with heavy logging enabled.
While restarts are not expected to happen very often, when restart happens
the system shall boot to operational state pretty quickly.

Also, I was planning to use this code to address the feedback from:
  https://lore.kernel.org/xen-devel/cKowJ0lJhKcoHoaPgGOX4xdDu6PCcg7MVnhS_y5=
L4mVGJfNlG-xXJdSGXJkIys5OqdCeSdiYtNQmI4znkjXLaqtqHefgvM33MbvMX700nk0=3D@pro=
ton.me/

The code (unposted) is here:
  https://gitlab.com/xen-project/people/dmukhin/xen/-/commit/bf72477b77a098=
53c69319afed5280bff4eabb1d#f29178524efff3dcdb2342a5a4e5affb5fe99fd1

>
> ~Andrew

