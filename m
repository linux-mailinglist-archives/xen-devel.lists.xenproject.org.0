Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6285253B8F3
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jun 2022 14:24:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341123.566290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwjqo-0006VM-AU; Thu, 02 Jun 2022 12:22:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341123.566290; Thu, 02 Jun 2022 12:22:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwjqo-0006Sa-7Q; Thu, 02 Jun 2022 12:22:54 +0000
Received: by outflank-mailman (input) for mailman id 341123;
 Thu, 02 Jun 2022 12:22:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vp+S=WJ=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nwjqn-0006SU-4W
 for xen-devel@lists.xenproject.org; Thu, 02 Jun 2022 12:22:53 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b91ba473-e26e-11ec-bd2c-47488cf2e6aa;
 Thu, 02 Jun 2022 14:22:52 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id i10so7602158lfj.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jun 2022 05:22:52 -0700 (PDT)
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
X-Inumbo-ID: b91ba473-e26e-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VOQZA0pHYqK4XdbW9GaYy4EgHWG2TtOSiKjo+AkEHcM=;
        b=UnE1Rplcr6LJMmwXyiL8ub39B1DsH07ftzTp2OVzdHGbBuxHegfEbgNiYk0LTgRA8Q
         52K0TR54JuB4WxHpGvQ8tl2RYold0dDK00bsLnJbq8Yg+lCaOSCQFasYxpY0dLfInTgs
         7gQ19qYW1M6D6Z3e4mL14Y9+XIwN3YOm/MtYtG/Wv7bJJs9vyp/VNaV0eQM3FEhoyMIi
         3x7yA+IhqxRTNkOak9X+TW13moVPwvJqYCv4jKAf/TucWy6yL6+bZaHiQjnbCqwEN+ih
         cDn2R3aLAl1xQWUM+KA8AFT23ALZPYKaRyK6YHf/zAkApYAkW0pA3x1pXfoJQkUNTFDv
         g2wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VOQZA0pHYqK4XdbW9GaYy4EgHWG2TtOSiKjo+AkEHcM=;
        b=2TrWzO1Yu04Dun5X4rJedfYilqrMaof8tX97ZBFiJlmN72QYuIqNKBh40vQHP1uTXu
         UGfiInJim98hC0bFVK6ByuWL9+BaZaEOrlL+Ubb1DgX/sLs/yUyT8mEJYkQwh9U1aAw2
         ot1Sft4Vkyqw2nR8dSGs1OilgoQDR0V3IGigm6bJujs1aop09MqEFLLMkINK04/hGB2Q
         1+qfTlvuYpgjOLR2BvWC7tag/+yBHN3YJx04SvJKoyxXY6tpI4n9lmqI1fDeS6skn+gq
         md2sOR7y0+nnKSloxReWx64AG3k65nqJ7Unk/vCHNxhRola42mws+lJzcFpblnCF8PIT
         4hkw==
X-Gm-Message-State: AOAM531A/Nzshm59kvV2YjEJxpdaipryj0xCEZf/SXbjCgDlgpozNEQ4
	z3xnjNICJ90NIV+0vsMLN3lphrpiHMPzYAOc5GA=
X-Google-Smtp-Source: ABdhPJyVvZ/uTNq8sMKoJG6ijdTCL0j2WKweW33CgjPbnGda+c3G9nCqp0xIzgTsfNiXS+BPfYkG1BIjTPHHQt2wSv4=
X-Received: by 2002:a05:6512:b17:b0:478:d66d:f747 with SMTP id
 w23-20020a0565120b1700b00478d66df747mr17038767lfu.447.1654172571822; Thu, 02
 Jun 2022 05:22:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220601195341.28581-1-jandryuk@gmail.com> <YphSYfdzy8kekhTZ@infradead.org>
In-Reply-To: <YphSYfdzy8kekhTZ@infradead.org>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 2 Jun 2022 08:22:40 -0400
Message-ID: <CAKf6xpsbgyvJjdRGrE3ru114iuXv98rumf8nVvKu5WmErf+zTA@mail.gmail.com>
Subject: Re: [PATCH] xen-blkfront: Handle NULL gendisk
To: Christoph Hellwig <hch@infradead.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	xen-devel <xen-devel@lists.xenproject.org>, linux-block@vger.kernel.org, 
	open list <linux-kernel@vger.kernel.org>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 2, 2022 at 2:02 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Wed, Jun 01, 2022 at 03:53:41PM -0400, Jason Andryuk wrote:
> > When a VBD is not fully created and then closed, the kernel can have a
> > NULL pointer dereference:
> >

> >
> > info->rq and info->gd are only set in blkfront_connect(), which is
> > called for state 4 (XenbusStateConnected).  Guard against using NULL
> > variables in blkfront_closing() to avoid the issue.
> >
> > The rest of blkfront_closing looks okay.  If info->nr_rings is 0, then
> > for_each_rinfo won't do anything.
> >
> > blkfront_remove also needs to check for non-NULL pointers before
> > cleaning up the gendisk and request queue.
> >
> > Fixes: 05d69d950d9d "xen-blkfront: sanitize the removal state machine"
> > Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
>
> Tis looks ok, but do we have anything that prevents races between
> blkfront_connect, blkfront_closing and blkfront_remove?

Thanks for taking a look, Christoph.

blkfront_connect and blkfront_closing are called by the state machine
in blkback_changed.  blkback_changed is the xenbus_driver
.otherend_changed callback.  The xenwatch kthread calls callbacks
synchronously and one at a time, so that seems okay today.

blkfront_remove is the xenbus_driver .remove callback, so it is tied
to the life cycle of the device.  It's called after the
otherend_changed callback is unregistered, so those won't run when
blkfront_remove is running.

Given that, I think it's okay.

Regards,
Jason

