Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF0DA01237
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 05:12:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865272.1276572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTvWX-0003OY-6C; Sat, 04 Jan 2025 04:12:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865272.1276572; Sat, 04 Jan 2025 04:12:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTvWX-0003Mu-3D; Sat, 04 Jan 2025 04:12:29 +0000
Received: by outflank-mailman (input) for mailman id 865272;
 Sat, 04 Jan 2025 04:12:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTvWV-0003LJ-NR
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 04:12:27 +0000
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a8aec5b-ca52-11ef-99a4-01e77a169b0f;
 Sat, 04 Jan 2025 05:12:25 +0100 (CET)
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
X-Inumbo-ID: 1a8aec5b-ca52-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735963944; x=1736223144;
	bh=uhZP8p6QYcQZ1ODbjID9SHBqhQ44S4apHNuz3it1H24=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=AVCm7OaZbiqkDz18L3MkTF+dYUUQXjjDzaYVDm6CvdRDQChXPMRXz7H1oqYRRXTxf
	 XPKk49vEjlvJ6VH+PB6ANAzhEygvT5R1qoUTn70Nf22Mvis0JZx6kDbT8qhWesOIH7
	 4rVrze3riFaMeeIi0n+hxbq7HG3nFyKRwQx1qMrkEQ7seGGtH1U4w1tzMLaLNCrmRL
	 B6G7FvN0VrbdL88xy45syn3M3mju3/ev/R/5oCXvF6gs0NcicI5E6DEjJvsTOEvHSJ
	 D1LSN8vvOi83lvZT4GbKkP4GFZD+EIgvBmswMIlCBbhurjHPoKbYnDPMRuHFvmQo4k
	 5nnZQ3/xFER+Q==
Date: Sat, 04 Jan 2025 04:12:19 +0000
To: Jason Andryuk <jason.andryuk@amd.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 20/35] xen/console: introduce console_owner_domid()
Message-ID: <8dyLROo-eYubZyVWoTtQTNgDkO85q0PqjHBAGAWSquyJ-zg9nI-Pw45WN4158F96EaWBkF1cqKp6s85l2MrWkZZLALuuWUoiffMcx-Fju9E=@proton.me>
In-Reply-To: <9be0addc-d4cf-47c4-937d-e1937898c010@amd.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-20-e9aa923127eb@ford.com> <9be0addc-d4cf-47c4-937d-e1937898c010@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 471d34a585c22ae654f0ea8c41bbcbae951c9e07
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Tuesday, December 10th, 2024 at 2:11 PM, Jason Andryuk <jason.andryuk@am=
d.com> wrote:

>
>
> On 2024-12-05 23:41, Denis Mukhin via B4 Relay wrote:
>
> > From: Denis Mukhin dmukhin@ford.com
> >
> > console_owner_domid() is introduced to obtain the "console owner" domai=
n ID.
> >
> > The call is used in NS8250 emulator to identify the case when physical =
xen
> > console focus is owned by the domain w/ NS8250 emulator, in which case,
> > messages from guest OS are formatted w/o '(XEN)' prefix.
> >
> > Signed-off-by: Denis Mukhin dmukhin@ford.com
>
>
> Reviewed-by: Jason Andryuk jason.andryuk@amd.com
>
>
> I expected this to be used immediately by patch 21, but it is not. You
> might want to re-order it directly before its first use is introduced.
> I haven't gotten far enough to know when that is.

Yeah, sorry for that.
I ended up dropping this patch from the series.

>
> Regards,
> Jason



