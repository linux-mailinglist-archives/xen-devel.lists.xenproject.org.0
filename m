Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7B539AEA9
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jun 2021 01:28:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136576.253168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lowkP-0003Xx-HI; Thu, 03 Jun 2021 23:27:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136576.253168; Thu, 03 Jun 2021 23:27:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lowkP-0003Vy-Du; Thu, 03 Jun 2021 23:27:33 +0000
Received: by outflank-mailman (input) for mailman id 136576;
 Thu, 03 Jun 2021 23:27:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=alxE=K5=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1lowkO-0003Vg-BF
 for xen-devel@lists.xenproject.org; Thu, 03 Jun 2021 23:27:32 +0000
Received: from mail-io1-xd2a.google.com (unknown [2607:f8b0:4864:20::d2a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30ab5d5b-619e-4b66-8113-b7fabda593f5;
 Thu, 03 Jun 2021 23:27:31 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id 5so8161898ioe.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jun 2021 16:27:31 -0700 (PDT)
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
X-Inumbo-ID: 30ab5d5b-619e-4b66-8113-b7fabda593f5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2bLa2cn36ZEc9no+iBydwrLQbwFYoKkkb5hpP+GIeX0=;
        b=Xm1TsUUEvo/wZFLPb7jY0F2wP8tzUz0XnrAwbGb5hLgUXghkR5owIfVI1CuX22n6eo
         8cDZQ1dfGFPlWq579BrFGZ4GyzCS2uWRmCUbgbP8AnfGtzCtsaQ7ohpBj2Quuh9ZgoP0
         NgD/2+ahtgAqlOddfJeRf5tmcySwis2czISVEtzbD9hK7NNFdlZZ++rzYZHhGhtpAVHT
         e15Y482d0mz1k5ugaUqG8+hzXVW1FrS9eYe/nJeeRKtmTYQdVlwSUJpB7J6ZRZdfhin3
         Mdu7sWMLxnyxIB+HsE7UJAsd+8git5hkYSguKxvds9d8EJPHXtC8QYJFzrThvPd+M0rm
         jSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2bLa2cn36ZEc9no+iBydwrLQbwFYoKkkb5hpP+GIeX0=;
        b=N/XCRsD4Ia14OM4Omc22fvDOmSYS5BpyU48EPtAgUxdxzp1mSECPNM5cjHOFzpGZCm
         ySwgBr5otJIsf5eEhj274XHorDbqBSBhqw6UwysjkhoTiI8c9CWcLNhleck8NW89n9JZ
         A7bxRue+NYD13d3uq+8mt8N6jjBUI4SMh6XJacARzFjzOOzIvAM4NP6c6+P2b9zNMaW/
         a4bGRGiH3kkldqW2Xq0uLxsQPMwz3z9Hr0W1ldnUKkLVTzgupMkjSc4WGjRHcFHdFMNg
         +I9ssnxVIOJFjiH3AKg8Fcxwt/21kwuveZuOuKH42dODnaoOpl/q+oUPt0LNAgIvEcAy
         Twuw==
X-Gm-Message-State: AOAM532avacD0YznPn9i8/SdiPoMKOiFvLWtR4V8/TpIWYte/PkrisX1
	J+14caamz3ISKh9LcLtfSaqJKv/bl3jQCky4B4s=
X-Google-Smtp-Source: ABdhPJzpIZPGdmQqM7/dm+7loMErDRboUmfkJl4RDfGdCfWaKj6vb21ZXHJ7Vny0rdh/6F1830jCKrEN6fwE3WPMhSk=
X-Received: by 2002:a02:8784:: with SMTP id t4mr1300461jai.26.1622762851431;
 Thu, 03 Jun 2021 16:27:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1622676439.git.connojdavis@gmail.com> <d2d19b62bd2a570db97f2940e6152bf93dc01632.1622676439.git.connojdavis@gmail.com>
In-Reply-To: <d2d19b62bd2a570db97f2940e6152bf93dc01632.1622676439.git.connojdavis@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 4 Jun 2021 09:27:05 +1000
Message-ID: <CAKmqyKO0JQVOxfrO0jk_-4eBBZSkcQm1-pMhd2xzXaE55usXWQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] xen/char: Default HAS_NS16550 to y only for X86
 and ARM
To: Connor Davis <connojdavis@gmail.com>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>, 
	Bobby Eshleman <bobbyeshleman@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 3, 2021 at 9:38 AM Connor Davis <connojdavis@gmail.com> wrote:
>
> Defaulting to yes only for X86 and ARM reduces the requirements
> for a minimal build when porting new architectures.
>
> Signed-off-by: Connor Davis <connojdavis@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  xen/drivers/char/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
> index b572305657..2ff5b288e2 100644
> --- a/xen/drivers/char/Kconfig
> +++ b/xen/drivers/char/Kconfig
> @@ -1,5 +1,6 @@
>  config HAS_NS16550
>         bool "NS16550 UART driver" if ARM
> +       default n if RISCV
>         default y
>         help
>           This selects the 16550-series UART support. For most systems, say Y.
> --
> 2.31.1
>

