Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F796302FFF
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 00:21:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74558.134022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4BAH-0002Di-5b; Mon, 25 Jan 2021 23:20:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74558.134022; Mon, 25 Jan 2021 23:20:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4BAH-0002DJ-2B; Mon, 25 Jan 2021 23:20:57 +0000
Received: by outflank-mailman (input) for mailman id 74558;
 Mon, 25 Jan 2021 23:20:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wS9q=G4=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1l4BAF-0002DE-C5
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 23:20:55 +0000
Received: from mail-ej1-x62d.google.com (unknown [2a00:1450:4864:20::62d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9c6ed374-a59c-4c2f-b464-ed3cbe259dd8;
 Mon, 25 Jan 2021 23:20:54 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id 6so20498879ejz.5
 for <xen-devel@lists.xenproject.org>; Mon, 25 Jan 2021 15:20:54 -0800 (PST)
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
X-Inumbo-ID: 9c6ed374-a59c-4c2f-b464-ed3cbe259dd8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BboUDNpi1qHV92/H5x807xexcMW30ods8/jbdOk29x4=;
        b=vG7uXI8qsdq4hmydKxfuyqDNgRvvKBGliwxX4Sd2bQ7W2NHWiZA7YXFaDnaRiggSId
         6aYdl4WJ38yGfHyXUX+ACBIsQh6MCM4/CaBpYcmlw+uGKa6e3oUY8K7QMb5a56gAKgi4
         cjf/WqA+/1HAO+uMP/pH59LTbv9l/4+Y3xn0zaBoGe06Fw4NazhexRbalxRMibm9jiMB
         +QlDa+EoAYnntJfFifcl9w0TkUEJOZYJDlMCK03S5wITvuOw8BJXn+dcVbwKUtMkeTlQ
         0I7dDqN7+c7KmaSeQxgVe0inwD49x3GGAFEADfij+cQ0oXnGSilzpiZF7wa4tA7jZQGE
         lYuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BboUDNpi1qHV92/H5x807xexcMW30ods8/jbdOk29x4=;
        b=H+2bRsmiYwgjAOEmN+K4SSlJtDYfkiTAmFCU/9snw2vHp3op5gVOgr3vKN8VlcULwy
         1QQa2bMbi/cSS4c//UI0osjR/ZHoGeSq8Ny1YegKDxf+BFeGc+QJaZy2UN2jqwsA025E
         y30l3eqCJ8HF0vuP7/vkI6QMSEw8A6TOb7War645YJUXOOnraTNLPxfFubbxy8GZWA/H
         OWu48htxU4u00u+XtPOyL1x1soYmlC0YsfMRskoSkL5Ku4fo5igJtZS5YXEkl2F8CA1f
         qTeUVR1jH/6vkIZRghpWIc6M5GO81AP7nVpQzCSOgOCo+pRARhgxddYbgR7ugEOPBqfG
         /gvw==
X-Gm-Message-State: AOAM533ya0gwR+s9TdcxPQq44yftydNn5COsOmXSCDxtMeIyYNwsR8Ia
	s4vscthZfI7paM2JcezQuxYLH6LjddbpZ/4ajJg=
X-Google-Smtp-Source: ABdhPJxwzFBqbjnJrt9b4PPtTelaW7Gyr6rhHcZmARgA+xNqZusO99bUxwkcjTWcOgErhb4HmiiAx6ez9OC5XSNI60c=
X-Received: by 2002:a17:906:46d3:: with SMTP id k19mr1711584ejs.546.1611616853694;
 Mon, 25 Jan 2021 15:20:53 -0800 (PST)
MIME-Version: 1.0
References: <161160798888.13183.15031685460985886988@c667a6b167f6> <alpine.DEB.2.21.2101251255430.20638@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2101251255430.20638@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Mon, 25 Jan 2021 23:20:42 +0000
Message-ID: <CAJ=z9a2YpESuHGfZXoRTGj5mxhwar37Na3eYkX90QffYKf1r1Q@mail.gmail.com>
Subject: Re: [PATCH V5 00/22] IOREQ feature (+ virtio-mmio) on Arm
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>, famzheng@amazon.com, 
	Doug Goldstein <cardoe@cardoe.com>, Wei Liu <wl@xen.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 25 Jan 2021 at 20:56, Stefano Stabellini <sstabellini@kernel.org> wrote:
>
> Julien,

Hi,

>
> This seems to be an arm randconfig failure:
>
> https://gitlab.com/xen-project/patchew/xen/-/pipelines/246632953
> https://gitlab.com/xen-project/patchew/xen/-/jobs/985455044

Thanks! The error is:

#'target_mem_ref' not supported by expression#'memory.c: In function
'do_memory_op':
memory.c:1210:18: error:  may be used uninitialized in this function
[-Werror=maybe-uninitialized]
 1210 |             rc = set_foreign_p2m_entry(currd, d, gfn_list[i],
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 1211 |                                        _mfn(mfn_list[i]));
      |                                        ~~~~~~~~~~~~~~~~~~

I found a few references online of the error message, but it is not
clear what it means. From a quick look at Oleksandr's branch, I also
can't spot anything unitialized. Any ideas?

Cheers,

