Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E761126898A
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 12:45:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHlzY-0007vh-EM; Mon, 14 Sep 2020 10:45:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lZiK=CX=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kHlzX-0007vc-69
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 10:45:47 +0000
X-Inumbo-ID: 5a55ec61-57cd-420b-a7f9-10af8de050aa
Received: from mail2.protonmail.ch (unknown [185.70.40.22])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5a55ec61-57cd-420b-a7f9-10af8de050aa;
 Mon, 14 Sep 2020 10:45:35 +0000 (UTC)
Date: Mon, 14 Sep 2020 10:45:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
 s=protonmail; t=1600080334;
 bh=y0O8PTWTMHDZc4EDoZhh3djaDTijYkpFOYbbkj2uDbU=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=sGK8np4+SYgcyvXZ1+vIKVN8to1ufI3dKuMZF+u2jlAVTBoP18PS0ytC1RT+LJPYU
 2W5OJVguBwur6XVtVGhsmFg5lQuZ+BHIqE3KPU+quVeiQYGgR6pdiEsRACLn8qbwN+
 YJnie2PQAhQBVfaPmQJDIo01M96neZjfSBhVUXfg=
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Trammell Hudson <hudson@trmm.net>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 2/4] efi/boot.c: add file.need_to_free and split
 display_file_info()
Message-ID: <pqzUSnNRnX2V2C92B6EGpMwCCjcQY39Ev8N4rWuuJLqH35guLwJC7RV4bs1xscYId9EOljNqPPgwMXNhdFW6QV-lnlOfefviwaWTbPb1NUA=@trmm.net>
In-Reply-To: <20200914090557.GB753@Air-de-Roger>
References: <20200907190027.669086-1-hudson@trmm.net>
 <20200907190027.669086-3-hudson@trmm.net> <20200914090557.GB753@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: Trammell Hudson <hudson@trmm.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Monday, September 14, 2020 5:05 AM, Roger Pau Monn=C3=A9 <roger.pau@citr=
ix.com> wrote:

> Thanks! Being picky you likely wan to split this into two separate
> commits: one for adding need_to_free and the other for
> display_file_info. There's no relation between the two that would
> require them to be on the same commit.

Ok.  I'll address that in the v4 of the patch.

> [...]
> > +static void __init display_file_info(CHAR16 *name, struct file *file, =
char *options)
>
> I think name at least could be constified?

Oh, I wish.  There should be a major pass to constify the EFI functions.
So many of them are not const-correct and it worries me that
literal strings are passed to those functions.

> Also efi_arch_handle_module seem to do more than just printing file
> info, hence I would likely rename this to handle_file_info to be more
> representative of what it does.

Ok. Fixed in v4.

--
Trammell

