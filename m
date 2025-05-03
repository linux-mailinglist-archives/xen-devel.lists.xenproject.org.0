Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A80AAA8133
	for <lists+xen-devel@lfdr.de>; Sat,  3 May 2025 17:09:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.975390.1362899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBEUQ-0004hS-B0; Sat, 03 May 2025 15:09:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 975390.1362899; Sat, 03 May 2025 15:09:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBEUQ-0004ea-82; Sat, 03 May 2025 15:09:18 +0000
Received: by outflank-mailman (input) for mailman id 975390;
 Sat, 03 May 2025 15:09:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9ZY/=XT=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1uBEUO-0004eT-Ft
 for xen-devel@lists.xenproject.org; Sat, 03 May 2025 15:09:16 +0000
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [2607:f8b0:4864:20::b2b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9132b9e9-2830-11f0-9ffb-bf95429c2676;
 Sat, 03 May 2025 17:09:11 +0200 (CEST)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e63a159525bso2408821276.2
 for <xen-devel@lists.xenproject.org>; Sat, 03 May 2025 08:09:11 -0700 (PDT)
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
X-Inumbo-ID: 9132b9e9-2830-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746284950; x=1746889750; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfJheMZa7oRhvBxc7nxCAcYw3tBHtFICarHmGPYO6Hs=;
        b=lff43ST873yLH8MQ/C/ttmwHTSARkpsUNK+nvKYrvRVo9LB7xIYJDTnfJHS5MmKR1+
         KMYWHXXc7LKgIB/W/DfK5Bosj6vDiGqvYJMfzd5TT3w+4uZJrSy6VAWDuzxqMApiQ+7y
         79DD4n6hMr36OUs05LZaNmTV4zrmOyNrft1fx824VpvuT1vDJ4hLY6401pFXAjqit8uj
         Q8qFgKNn6XAZLtOAmnhawDsT/QpYBCrp1zw0zig8ivIqDt3rsnVp19px7Xg01U+eW4oE
         Pzf4/01pIZ6jNU1cwhwux0iAA6WweRT8ZTZV5RHf9B5DJ0Irze/5dVCK5kmAfcG5goSk
         /pMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746284950; x=1746889750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qfJheMZa7oRhvBxc7nxCAcYw3tBHtFICarHmGPYO6Hs=;
        b=fgfPDt7yTVM7TUsHF6uInh9S9UZREu4Lx75hxlm0H7wAwjNg0/5rQRCkNnRri7h35d
         VaA6WoPQIkh4oKwow8/Pq1DPRlZ/zL+QelCTlpqt6eNxoLebGtfs8L0sj5LxG23Idx6/
         hBIknPt9/VzgjYBJ6BAQtRUc6354hccaw/VSpT4z/LqXSqS015Thc9q/vH13ttHHAlPE
         fP4Pr5ncdp8J3291hdDJUQvisYFXM7yVpNfBCcPfHGm36Zj0QqPRmrBEZCGaJio1C7Io
         6JE97wHPi4f4qUgwCQBA/K+radaWXAZmDlNX5A7flb4LRFYU7aje4bw+itjTHTCueb39
         M7iA==
X-Forwarded-Encrypted: i=1; AJvYcCXhDj6QFrofp46qEaz8psgGWxZDakJOdtJfGUjpaIuWkx1jnvivhz2cifqRC98Dj94vQZt9gQICWUM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJ17OmJ9wZ4GZgDe2IGC07F6Hgjpp6vDqBqPkFNACdyU6OZxdZ
	gLZICLYcaRnXuDxfbYPXFNztFXf1j8YFZcOXif/YYkKDBoCX/RMkD4XAgsQBe59QBwiF7xtsTCp
	3i5lrZCgjFjP5IZFFNdwPR7s6aeo=
X-Gm-Gg: ASbGnctAEHFpfbvWLBb5Gu1YPhMMdVGmAh8IBbUzHNX/nn1VGiwDOhdptp7bBCi9oKQ
	czWj55aXb+OtmFmu8R9Z9uk9rL1T9iOkrto5F9URlMgbek9weAaZQ+lYoo4fBGLb9AzP21Mb00m
	ReCyirExWKBAip1Dc0av5CtgAIPpwv1A==
X-Google-Smtp-Source: AGHT+IGLTFzWWqcM8q6dknKJ15Q8aT0A/F537d/AuTvJFtSy0akHqrNPmiHWhzgVHZ/e2yvaM2YdEktEGTubLM/0KWo=
X-Received: by 2002:a05:690c:7302:b0:6fe:eaac:e55f with SMTP id
 00721157ae682-708e11b3c47mr36276787b3.9.1746284950076; Sat, 03 May 2025
 08:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <ZO0WrR5J0xuwDIxW@mail-itl> <ZTUuRj6e5x5xFVqb@mail-itl>
 <ZgGjf3hpLHXXtb8z@mail-itl> <0f8c0e27-e60d-4e64-bc8a-6cb407c67ab2@xen.org>
 <ZlpTwbmDjNLkCNgH@mail-itl> <aAjgGKRAW95BnTiK@mail-itl> <CAKf6xpu7=2O96XK88WL02c-4po3qX-4P4i=2JbD2=o2JcM+_EQ@mail.gmail.com>
 <aBIBy5eQPypM_UbJ@mail-itl> <641aef98-5dde-4618-9fa4-7ccfa2e1989d@amd.com> <ea422f7c-64fb-4b19-b953-cb3d0404222a@suse.com>
In-Reply-To: <ea422f7c-64fb-4b19-b953-cb3d0404222a@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Sat, 3 May 2025 11:08:59 -0400
X-Gm-Features: ATxdqUGszREXZea456Tq2WloQP70-NlHT-_4C983tNQNTXiKYXX3_yxJFF_-dtg
Message-ID: <CAKf6xpu_qTqnLHv945Dq0FJ7oaghJa6ZATKsagapMOpX-PQZng@mail.gmail.com>
Subject: Re: NULL pointer dereference in xenbus_thread->...
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Julien Grall <julien@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 11:44=E2=80=AFAM J=C3=BCrgen Gro=C3=9F <jgross@suse=
.com> wrote:
> I have looked at this issue multiple times now.
>
> Just some remarks what IMO could go wrong (I didn't find any proof that
> this really happened, though), in case someone wants to double check:
>
> The most probably candidate for something going wrong is a use-after-free
> of a struct xb_req_data element (normally named "req" in the related code=
).
>
> Some words about the not really obvious locking scheme used for those
> elements: A "req" is owned by a thread as long as it isn't in any of the
> lists it can live in (xs_reply_list or xb_write_list). Putting it into on=
e
> of the lists or removing it again requires to hold the xb_write_mutex.

While I see how the ownership is transferred between lists and the
static variables in process_writes(), xs_wait_for_reply()/read_reply()
is looking at req, too.

> A "req" needs to be in a certain state when either in one of the lists or
> when being owned by a worker thread.
>
> I'm wondering whether it could happen that a thread waiting for a "req"
> could be woken up and the "req" is being freed before the waiting thread
> can react. Normally this shouldn't be possible, but "never say never".
> What catched my eye today is the test of req->state =3D=3D xb_req_state_w=
ait_reply
> in process_msg() just after dropping the xb_write_mutex. This looks a lit=
tle
> bit fishy, but OTOH the request has been just removed from the xs_reply_l=
ist,
> so no mutex should be needed for that test.
>
> Possible candidates for such an "impossible" scenario include a wrap of
> xs_request_id (not very probable, though, as having 4 billion Xenstore
> requests "in flight" is rather unlikely IMHO).

If read_reply() exits because req->err is set, and req->state is not
queued or wait_reply, the req will be freed in xs_wait_for_reply(),
but not removed from the list.  If it is on the xs_reply_list,
req->cb(req) could be called, but that would need req->state =3D=3D
wait_reply.  I don't see how this could happen, but it came to mind.

Put another way, kfree() in xs_wait_for_reply() doesn't know if the
req is on the list or not.  I wonder if it would be better to just
have
if (req->state =3D=3D xb_req_state_got_reply)
    kfree(req);
else
    req->state =3D xb_req_state_aborted;

Maybe also some sort of assertion that req is not on a list, too.
This would at least make it clear exactly when xs_wait_for_reply() is
supposed to free req.

Given these states:
enum xb_req_state {
xb_req_state_queued,
xb_req_state_wait_reply,
xb_req_state_got_reply,
xb_req_state_aborted
};

Being explicit on who frees each state would be good.

Or if all list manipulations have to be protected by xb_write_mutex,
then just let the "caller" xs_wait_for_reply() always unlink and
kfree()?

Yet it's unclear how req->cb(req) leads to a use-after-free.
req->cb() was valid to make the call, but then the waitqueue was
(probably) zeroed?  That seems like a race.  ... or is wake_up()
faulting because xs_wait_for_reply() woke up and freed the req before
wake_up() finished with it?

__wake_up_common (kernel/sched/wait.c:85) is:

list_for_each_entry_safe_from(curr, next, &wq_head->head, entry) {

I'l need to look more into the wake_up() implementation...

Regards,
Jason

