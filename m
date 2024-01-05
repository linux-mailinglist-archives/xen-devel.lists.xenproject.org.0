Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2140D8257C1
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 17:10:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662236.1032251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLmm7-0002Yl-PG; Fri, 05 Jan 2024 16:10:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662236.1032251; Fri, 05 Jan 2024 16:10:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLmm7-0002WX-ME; Fri, 05 Jan 2024 16:10:23 +0000
Received: by outflank-mailman (input) for mailman id 662236;
 Fri, 05 Jan 2024 16:10:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DU2f=IP=gmail.com=tamas.k.lengyel@srs-se1.protection.inumbo.net>)
 id 1rLmm5-0002WL-N2
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 16:10:21 +0000
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [2607:f8b0:4864:20::1133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eaeafa73-abe4-11ee-9b0f-b553b5be7939;
 Fri, 05 Jan 2024 17:10:18 +0100 (CET)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-5f0c0ca5ef1so17740557b3.2
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jan 2024 08:10:18 -0800 (PST)
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
X-Inumbo-ID: eaeafa73-abe4-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704471017; x=1705075817; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wIoh3KZ7V69xhJl51mNyC87qlkTU4QgvDupNxDwBSus=;
        b=lENNTULXVMLtjhK4YOr45XhqQrzuEfJbC2wDZBORqGZTF2K5FVMnEcXJAMXgjwpBXW
         RKG3yd9eRHLmOb9ss74fHUZYyKkGXYg9SydCaevvig6gyeCh5cSguphA0wy2tDU90RkO
         a3ftbvLZhGz4w/CPV9AYLYqzGh7CSM8T9V2FVSnKdpLN/jMDd5BAGW/IuI3uxY2YJXWr
         DVq6qYbyGxbbtXjnC3STFHKkDWCsNKh5nAJIYyf/Id2jUd7IbDdDHxSJspD7D9bIHpQx
         1zRqtJ3u5LIM0gFa6VqqqQVztYQQkcGUF/YJdu8ZIYu2GkFPN8p7NEjrifZE8AQVHvQv
         PJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704471017; x=1705075817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wIoh3KZ7V69xhJl51mNyC87qlkTU4QgvDupNxDwBSus=;
        b=JrYyLnA2HvfczlvrgM6qJKJyeHqzcQTFQpZo9B0tidYsmnMNBBCzYw4JRbvIvNPcUs
         1JWc65Z47ZLGJIoaEIxqar/jaY+3VkBFmennYYxQAti5Vqz9K9MXN14LKSbApk92sUHz
         YYzU+sTcVdYCL6C54el4xJDxUetsPGtXJfWDjxoGFzHtK1ZKUE16oBOKbKVqZllSGMu5
         MCGEFjOZA5jbilCaZSj81GM9h+JABftgpGSufFPa8GnSBFmZnir91JMcsCI/L/SCu7DM
         CiHRm3NOQKXS4dE98pd5UAX8h+I35f7rweqzNo7tx+/3w6R0veuTP6PoAQZ4dtGI9WFQ
         dIQw==
X-Gm-Message-State: AOJu0YyQB2Yyi2FK6q7kP5UU9xE1AskPCCYZBt9UqKA6KFXNLLF5Y7bH
	m372AZ4ikMdmARzynCSNMdyw5BPomVQKbiAJpp1X8/t7
X-Google-Smtp-Source: AGHT+IFNBhU4uqo0OOaKREkUnfSgTpSdWPjDW3WVKrYC6I1Ac628ywpPkGtLy3Ubn8Fr3ZSEkB3wNjwdRsQ+xthGHPQ=
X-Received: by 2002:a0d:c306:0:b0:5eb:1ec0:9c50 with SMTP id
 f6-20020a0dc306000000b005eb1ec09c50mr2135521ywd.43.1704471017185; Fri, 05 Jan
 2024 08:10:17 -0800 (PST)
MIME-Version: 1.0
References: <f0ac3890b5e2e1e98bfd3fe5fffcf3c3c031e12c.1704388276.git.tamas.lengyel@intel.com>
 <ba53053f-a2c6-4e4f-a805-4d60970bae39@suse.com>
In-Reply-To: <ba53053f-a2c6-4e4f-a805-4d60970bae39@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Fri, 5 Jan 2024 11:09:42 -0500
Message-ID: <CABfawhmovqKjTSRbjgSqhY7kDhANyHrXFHYyPTGhsrnT1cdtBQ@mail.gmail.com>
Subject: Re: [PATCH] x86/mwait-idle: fix ubsan warning
To: Jan Beulich <jbeulich@suse.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 5, 2024 at 2:34=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 04.01.2024 18:13, Tamas K Lengyel wrote:
> > Fix warning:
> > (XEN) UBSAN: Undefined behaviour in arch/x86/cpu/mwait-idle.c:1300:44
> > (XEN) left shift of 15 by 28 places cannot be represented in type 'int'
> >
> > Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> > Fixes: 5a211704e88 ("mwait-idle: prevent SKL-H boot failure when C8+C9+=
C10 enabled")
>
> No matter that I appreciate the change, I think this wants fixing by a
> patch to the (Linux) original, which we'd then import (like we do for
> other changes, including the one referenced by the Fixes: tag).

Feel free to submit it to other projects if the same issue applies to
them. I only ran into this with Xen and can only test it with Xen.

Tamas

