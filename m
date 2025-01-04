Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFD9A0123D
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 05:16:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865291.1276592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTva4-0004Yt-Rt; Sat, 04 Jan 2025 04:16:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865291.1276592; Sat, 04 Jan 2025 04:16:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTva4-0004WA-Oq; Sat, 04 Jan 2025 04:16:08 +0000
Received: by outflank-mailman (input) for mailman id 865291;
 Sat, 04 Jan 2025 04:16:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTva3-0004PJ-An
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 04:16:07 +0000
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9dba050d-ca52-11ef-99a4-01e77a169b0f;
 Sat, 04 Jan 2025 05:16:05 +0100 (CET)
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
X-Inumbo-ID: 9dba050d-ca52-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735964164; x=1736223364;
	bh=soPD0FB9QjUSoBvYQ6OZyNdhJldQ4HFb+DqU2P123mc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=dMNpj63stWDnMyGqP5VhbSwJ5B+Gu8UYAYNsu+98VqIBhkdxCRRM+iUky0sGgY4JD
	 9yrv+SygVRiux/oVOE3DaYiOHvOzCpNj0c+8Q4qZVvqFd2JXqvMoxvkIKIL/WgG3cp
	 A2onNzcCr2KelWpaWKNC2Ukc4SOEf3i3I7/RRl3km7FXJSfkwRVpka4GuCokfXIF+M
	 YhOTv7/D/25hXvcpCcsISQJye5++ZsFAAz97Rq2XVH9orRov8DaOolhwJ9Qb0FAlzL
	 fSbDouEMI0ImNeDD/12YjvRvDSlaKBKmdkd3MssNrtPnPWMGZqhbx+9EjGecZdjQ5g
	 1KimsUCQCHRbg==
Date: Sat, 04 Jan 2025 04:16:00 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: Jason Andryuk <jason.andryuk@amd.com>, dmukhin@ford.com, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 20/35] xen/console: introduce console_owner_domid()
Message-ID: <8Zv1e7iWdEMFJlcI1f56hKoWS6X5bS9rGnlrz4eWzol8VRYj0E9ZZqkqHtdNeRXdbwmpDGdSXk3J9JpgESSFJlCxOF8kkUA_TVrj2sW8cTQ=@proton.me>
In-Reply-To: <b0b92749-f795-4e8e-b6fd-5c02e14aa83b@suse.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-20-e9aa923127eb@ford.com> <9be0addc-d4cf-47c4-937d-e1937898c010@amd.com> <b0b92749-f795-4e8e-b6fd-5c02e14aa83b@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 2292f6b6c80c54d99047a538cd2d90595e460958
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Tuesday, December 10th, 2024 at 11:33 PM, Jan Beulich <jbeulich@suse.com=
> wrote:

>
>
> On 10.12.2024 23:11, Jason Andryuk wrote:
>
> > On 2024-12-05 23:41, Denis Mukhin via B4 Relay wrote:
> >
> > > From: Denis Mukhin dmukhin@ford.com
> > >
> > > console_owner_domid() is introduced to obtain the "console owner" dom=
ain ID.
> > >
> > > The call is used in NS8250 emulator to identify the case when physica=
l xen
> > > console focus is owned by the domain w/ NS8250 emulator, in which cas=
e,
> > > messages from guest OS are formatted w/o '(XEN)' prefix.
> > >
> > > Signed-off-by: Denis Mukhin dmukhin@ford.com
> >
> > Reviewed-by: Jason Andryuk jason.andryuk@amd.com
> >
> > I expected this to be used immediately by patch 21, but it is not. You
> > might want to re-order it directly before its first use is introduced.
> > I haven't gotten far enough to know when that is.
>
>
> Plus, no matter how far in the future it is, there'll be a window where t=
he
> Misra rule of not having unreachable code in the project is violated. New
> functions now really need introducing when their first caller appears.

I see, thank you for the explanation.

>
> Jan



