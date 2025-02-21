Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 157DAA4015E
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2025 21:54:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894643.1303361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tla16-0006dF-B1; Fri, 21 Feb 2025 20:53:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894643.1303361; Fri, 21 Feb 2025 20:53:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tla16-0006bs-7o; Fri, 21 Feb 2025 20:53:00 +0000
Received: by outflank-mailman (input) for mailman id 894643;
 Fri, 21 Feb 2025 20:52:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ozyL=VM=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tla13-0006bi-4x
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2025 20:52:58 +0000
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2602f3b-f095-11ef-9aa9-95dc52dad729;
 Fri, 21 Feb 2025 21:52:54 +0100 (CET)
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
X-Inumbo-ID: d2602f3b-f095-11ef-9aa9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1740171173; x=1740430373;
	bh=kiu/Yz2n60UR+N0rXDXqBAoQl9a7dIt1haXLcHeOG0o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=TL0MYrbY6sCeLGEL8ZKvS4sE1O8Oru9giCGEC2Wx/bqwLPt+O17Q33OJCz9toAoUr
	 B9FyXPBE6N5qrxSb60MM0qB8/xKmbpcikYg5ZT4AGb6RRWobr5InQCW+7C3lCvFKmp
	 uWIFxeDXbNfmWQNkpLho2ETvzZxwL6dHXJdQFPA4qPDsLmeCCUKXuhUOEEz3gxnS93
	 2egwsUMZyF6ym7y0aaCJkrkeMDbfp5hGF9V74K9N58geMF1le7Ws+yhqNCepmeaRqx
	 BIvYN3AGDNGMnGZknicmcdyZDl6NfbgvlQ+sphFA+sT08TAzWs5oPokEL1BRhfVq8C
	 T9uMM1StoK61g==
Date: Fri, 21 Feb 2025 20:52:47 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/console: make console buffer size configurable
Message-ID: <o_C90Tb8fjLMkG-pSNmxycIsYytdAxHSTU7yrudH07-h6L9e4XGirmyyKKSRQsLuOyYwA6b-9jd8kOOnM21yC8I-6q5EzcX2lsLHcbgGqec=@proton.me>
In-Reply-To: <4203576f-0b93-4647-9983-e36c15fa1d0c@suse.com>
References: <20250212222157.2974150-1-dmukhin@ford.com> <4203576f-0b93-4647-9983-e36c15fa1d0c@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: e217e8c6944afedbfa414427c8a00c9394c75840
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, February 18th, 2025 at 8:05 AM, Jan Beulich <jbeulich@suse.com>=
 wrote:

>
>
> On 12.02.2025 23:31, dmkhn@proton.me wrote:
>
> > --- a/xen/drivers/char/Kconfig
> > +++ b/xen/drivers/char/Kconfig
> > @@ -96,6 +96,18 @@ config SERIAL_TX_BUFSIZE
> >
> > Default value is 32768 (32KiB).
> >
> > +config CONRING_SIZE
> > + int "Console buffer size"
> > + default 32768
> > + range 16384 134217728
> > + help
> > + Select the boot console buffer size (in bytes).
>
>
> Why in bytes when ...
>
> > + Note, the value provided will be rounded down to the nearest power of=
 2.
>
>
> ... this rounding is done anyway? Why have people type in complicated num=
bers?
> A granularity of 1k would already be an improvement; yet better would be =
if
> this was a power-of-two value altogether.

My understanding that the semantics of new CONFIG_CONRING_SIZE build-time s=
etting
should be consistent with existing boot-time conring_size=3D behavior (stri=
ng value
converted to number of bytes).

I can update both to round up to 1k boundary.

I also agree that having power of 2s for both (e.g. similar to Linux'es CON=
FIG_LOG_BUF_SHIFT)
will be the simplest (implementation) and non-ambigous.
I had it done earlier:
  https://lore.kernel.org/xen-devel/20241205-vuart-ns8250-v1-26-e9aa923127e=
b@ford.com/

Also, since there's a build-time configuration parameter along with the boo=
t-time
configuration, perhaps it makes sense to retire boot-time setting in favor =
of
build-time setting?

>
> Jan

