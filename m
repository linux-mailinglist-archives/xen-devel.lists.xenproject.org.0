Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F99B6B31DC
	for <lists+xen-devel@lfdr.de>; Fri, 10 Mar 2023 00:02:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508371.783006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paPGp-0000Lx-He; Thu, 09 Mar 2023 23:01:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508371.783006; Thu, 09 Mar 2023 23:01:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paPGp-0000Jr-E1; Thu, 09 Mar 2023 23:01:59 +0000
Received: by outflank-mailman (input) for mailman id 508371;
 Thu, 09 Mar 2023 23:01:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/dmD=7B=ellerman.id.au=mpe@srs-se1.protection.inumbo.net>)
 id 1paPGi-0000Jh-6x
 for xen-devel@lists.xenproject.org; Thu, 09 Mar 2023 23:01:57 +0000
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d039134-bece-11ed-956e-85ef70e17bfa;
 Fri, 10 Mar 2023 00:01:47 +0100 (CET)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PXl6q3NsJz4xD5;
 Fri, 10 Mar 2023 10:01:39 +1100 (AEDT)
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
X-Inumbo-ID: 5d039134-bece-11ed-956e-85ef70e17bfa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1678402899;
	bh=BWSn0lLbqlLFTN2KrlWGAvIfOF/lG9xhXJ2PJ5SfzFc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=gNMhkjOP+ETg7IZNFsVHqUxECrDXTSgVlwo20E9+dCd+JmK1tQd7yKE3V6vpP/Sbp
	 XHePmFPBNHK9ki+nDOVGrdP7RP+eUnwOKDGMvB/9E7GOwRVTml+2RGI7BZfOlZSLVS
	 maX7iIUQv+9K+7RL71Tjg3DdYWHK+Ywl+9Td+8g9AkwCqHpGuUh13Rb1AOuvMq+6tX
	 LTjUG/YG6TrYHQxiiPOOjt6wghYV8qhfpC31LOn1xyg5JeDVbWLp9/Fr/lZZrGhD3r
	 3LE1/Pp4gZavklbthU8XuRh7dlU304ovNPh6f/sdqlcgfwiVS01Sdod8gN2iPxOI1R
	 DQTpHu2akFDcw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>, Stefano
 Stabellini
 <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] hvc/xen: prevent concurrent accesses to the shared ring
In-Reply-To: <ZAm8BDGTMaI0XmMI@Air-de-Roger>
References: <20221130150919.13935-1-roger.pau@citrix.com>
 <alpine.DEB.2.22.394.2211301657200.4039@ubuntu-linux-20-04-desktop>
 <Y4nkFZal7oy+aICa@Air-de-Roger> <Y5cgYLNwtPbmP1JL@Air-de-Roger>
 <ZAm8BDGTMaI0XmMI@Air-de-Roger>
Date: Fri, 10 Mar 2023 10:01:39 +1100
Message-ID: <87zg8lo7fw.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Roger Pau Monn=C3=A9 <roger.pau@citrix.com> writes:
> On Mon, Dec 12, 2022 at 01:36:48PM +0100, Roger Pau Monn=C3=A9 wrote:
>> On Fri, Dec 02, 2022 at 12:40:05PM +0100, Roger Pau Monn=C3=A9 wrote:
>> > On Wed, Nov 30, 2022 at 05:08:06PM -0800, Stefano Stabellini wrote:
>> > > On Wed, 30 Nov 2022, Roger Pau Monne wrote:
>> > > > The hvc machinery registers both a console and a tty device based =
on
>> > > > the hv ops provided by the specific implementation.  Those two
>> > > > interfaces however have different locks, and there's no single loc=
ks
>> > > > that's shared between the tty and the console implementations, hen=
ce
>> > > > the driver needs to protect itself against concurrent accesses.
>> > > > Otherwise concurrent calls using the split interfaces are likely to
>> > > > corrupt the ring indexes, leaving the console unusable.
>> > > >
>> > > > Introduce a lock to xencons_info to serialize accesses to the shar=
ed
>> > > > ring.  This is only required when using the shared memory console,
>> > > > concurrent accesses to the hypercall based console implementation =
are
>> > > > not an issue.
>> > > >
>> > > > Note the conditional logic in domU_read_console() is slightly modi=
fied
>> > > > so the notify_daemon() call can be done outside of the locked regi=
on:
>> > > > it's an hypercall and there's no need for it to be done with the l=
ock
>> > > > held.
>> > >
>> > > For domU_read_console: I don't mean to block this patch but we need =
to
>> > > be sure about the semantics of hv_ops.get_chars. Either it is expect=
ed
>> > > to be already locked, then we definitely shouldn't add another lock =
to
>> > > domU_read_console. Or it is not expected to be already locked, then =
we
>> > > should add the lock.
>> > >
>> > > My impression is that it is expected to be already locked, but I thi=
nk
>> > > we need Greg or Jiri to confirm one way or the other.
>> >
>> > Let me move both to the 'To:' field then.
>> >
>> > My main concern is the usage of hv_ops.get_chars hook in
>> > hvc_poll_get_char(), as it's not obvious to me that callers of
>> > tty->poll_get_char hook as returned by tty_find_polling_driver() will
>> > always do so with the tty lock held (in fact the only user right now
>> > doesn't seem to hold the tty lock).
>> >
>> > > Aside from that the rest looks fine.
>
> I guess I could reluctantly remove the lock in the get_chars hook,
> albeit I'm not convinced at all the lock is not needed there.

I don't know the xen driver, but other HVC backends have a lock around
their private state in their get_chars() implementations.

See eg. hvterm_raw_get_chars().

cheers

