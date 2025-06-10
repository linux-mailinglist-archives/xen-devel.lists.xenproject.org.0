Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68667AD4183
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 20:03:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011173.1389525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP3JC-0004Yo-2t; Tue, 10 Jun 2025 18:02:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011173.1389525; Tue, 10 Jun 2025 18:02:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP3JB-0004W7-WC; Tue, 10 Jun 2025 18:02:50 +0000
Received: by outflank-mailman (input) for mailman id 1011173;
 Tue, 10 Jun 2025 18:02:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zL97=YZ=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uP3JA-0004Vu-3R
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 18:02:49 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c5d5569-4625-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 20:02:45 +0200 (CEST)
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
X-Inumbo-ID: 1c5d5569-4625-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1749578564; x=1749837764;
	bh=lP+1boryBoTrLDczj08ya9tFiHtdDJnTdW/1WXfteec=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=aTnuZsMN5DwoevPTDf+oazaturUYG16D3m6M8FhyZWq8x6H73jDbqxya8QMt5sVAE
	 DTypxXz9L09rvMMd2uFKxTgPsYq76I45wbBP9rqIYDxTOfUha64xDK70wjSs1mkVlU
	 jys6RAs0rWkglGGPcHAvh6RxfBFPvzSPhxMSuTSc4DLcSFXAkpYxh2wgsdJDf3JC77
	 Ptjq9/ttyEg+89Dr7178e6GzFew9AFFJGIpGQUMJ7t2yD6HAOc3f5t+pirDD7CGXpQ
	 00Yg1akQMNSbX3NY4srcjxFwgeuybqPUGBqpEZUe2iNZypmZU7hFmKG/ZlQBAmZjag
	 EfTN8lHhL9OBw==
Date: Tue, 10 Jun 2025 18:02:38 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
From: dmkhn@proton.me
Cc: Jan Beulich <jbeulich@suse.com>, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1] xen/console: group pbuf under console field
Message-ID: <aEhzOcbcfNydaqST@kraken>
In-Reply-To: <7f965335-68d9-4da5-8ce3-db68583db9a2@citrix.com>
References: <20250606194937.2412579-1-dmukhin@ford.com> <db9d23ee-9115-45db-b428-104aeaabcb2a@suse.com> <7f965335-68d9-4da5-8ce3-db68583db9a2@citrix.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 4cd813df7ea11700607002f6fb653d55a637d142
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 12:24:57PM +0100, Andrew Cooper wrote:
> On 10/06/2025 9:10 am, Jan Beulich wrote:
> > On 06.06.2025 21:49, dmkhn@proton.me wrote:
> >> From: Denis Mukhin <dmukhin@ford.com>
> >>
> >> Group all pbuf-related data structures under domain's console field.
> > Fine with me in principle, as I was indeed wondering about the lack of
> > grouping when the sub-struct was introduced, but ...
> >
> >> @@ -654,6 +648,12 @@ struct domain
> >>
> >>      /* Console settings. */
> >>      struct {
> >> +        /* hvm_print_line() and guest_console_write() logging. */
> >> +#define DOMAIN_PBUF_SIZE 200
> >> +        char *pbuf;
> >> +        unsigned int pbuf_idx;
> >> +        spinlock_t pbuf_lock;
> >> +
> >>          /* Permission to take ownership of the physical console input=
. */
> >>          bool input_allowed;
> >>      } console;
> > ... since all uses of the fields need touching anyway, can we perhaps
> > think of giving the fields better names? I never understood what the
> > 'p' in "pbuf" actually stands for, for example.
>=20
> I always assumed it was Hungarian notation, so pointer.
>=20
> As it's namespaced within .console, plain .buf, .idx and .lock names
> work fine.

Ack.

>=20
> Separately, 200 is a silly and arbitrary number.=C2=A0 Furthermore the
> allocation is unconditional, despite the fact that in !VERSBOSE builds,
> domUs can't use this facility.=C2=A0 Also, where's the input buffer?

Thanks!

I will try to address those under individual changes.

re: arbitrary number: Will bumping the buffer size to the next power of 2 =
=3D=3D
256 work?

re: input buffer: Looks like there's only global serial_rx_ring buffer in
current design. My guess - because the input buffer is shared between domai=
ns
and Xen itself which does not have domain struct associated with it.

>=20
> ~Andrew


