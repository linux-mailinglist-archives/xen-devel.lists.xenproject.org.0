Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D8B27E77B
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 13:12:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582.1959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNa1i-0004mW-U8; Wed, 30 Sep 2020 11:12:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582.1959; Wed, 30 Sep 2020 11:12:02 +0000
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
	id 1kNa1i-0004m7-QX; Wed, 30 Sep 2020 11:12:02 +0000
Received: by outflank-mailman (input) for mailman id 582;
 Wed, 30 Sep 2020 11:12:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eJ1H=DH=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kNa1h-0004lz-91
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 11:12:01 +0000
Received: from mail-40136.protonmail.ch (unknown [185.70.40.136])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2d85d170-cc69-4fcf-9cdc-58ccc03a348f;
 Wed, 30 Sep 2020 11:11:59 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=eJ1H=DH=trmm.net=hudson@srs-us1.protection.inumbo.net>)
	id 1kNa1h-0004lz-91
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 11:12:01 +0000
X-Inumbo-ID: 2d85d170-cc69-4fcf-9cdc-58ccc03a348f
Received: from mail-40136.protonmail.ch (unknown [185.70.40.136])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 2d85d170-cc69-4fcf-9cdc-58ccc03a348f;
	Wed, 30 Sep 2020 11:11:59 +0000 (UTC)
Date: Wed, 30 Sep 2020 11:11:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
	s=protonmail; t=1601464317;
	bh=imp635jJa3iL4NpQGjJJxCQnz0Vh7SsZBMFaBKYhfwc=;
	h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
	b=xNyok8XE4bsQXCi1hQ0cb76sMetQqtWwdI6lJk/uYi1tiWAjqyMdKkXEYtvBqYfCg
	 4F/WK8bueW+k2UoOc0rrZO8UaOQKG8h11vHpHAtCkOJaK6BUWmTDf51kX+3kvYmy4U
	 DmH+3uyodBT1sPTkAAxlh0Gluo0TkT2z8wvqM9q0=
To: Jan Beulich <jbeulich@suse.com>
From: Trammell Hudson <hudson@trmm.net>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "wl@xen.org" <wl@xen.org>
Reply-To: Trammell Hudson <hudson@trmm.net>
Subject: Re: [PATCH v7 1/5] efi/boot.c: add file.need_to_free
Message-ID: <NeOsS0l9cobBgjrZe88P_y0tt80FE6nNo5EM_J7TxLvjIbKmPhaZYU6glmwOaUPqVDT1E24NOaiFikRAzY_CYwDenVyfkI2Gv2ctLCwczEg=@trmm.net>
In-Reply-To: <25429a64-2b60-19a2-c7d5-987eecd63c56@suse.com>
References: <20200929181717.1596965-1-hudson@trmm.net> <20200929181717.1596965-2-hudson@trmm.net> <25429a64-2b60-19a2-c7d5-987eecd63c56@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
	autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
	mailout.protonmail.ch

On Wednesday, September 30, 2020 2:49 AM, Jan Beulich <jbeulich@suse.com> w=
rote:
> On 29.09.2020 20:17, Trammell Hudson wrote:
> > -   if ( dtbfile.addr && dtbfile.size )
> > -   if ( dtbfile.need_to_free )
> >     efi_bs->FreePages(dtbfile.addr, PFN_UP(dtbfile.size));
> >     if ( memmap )
> >     efi_bs->FreePool(memmap);
> >
>
> I'm afraid this isn't enough of a change for Arm, due to what
> fdt_increase_size() may do.

You're right.  It looks like there are also potential memory leaks
in the fdt_increase_size() error paths as well.  I've added free
calls in v8.

--
Trammell


