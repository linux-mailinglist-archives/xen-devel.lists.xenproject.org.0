Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F97AE6ABB
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 17:23:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023862.1399930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU5Uv-0002eY-24; Tue, 24 Jun 2025 15:23:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023862.1399930; Tue, 24 Jun 2025 15:23:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU5Uu-0002d9-VV; Tue, 24 Jun 2025 15:23:44 +0000
Received: by outflank-mailman (input) for mailman id 1023862;
 Tue, 24 Jun 2025 15:23:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3yl0=ZH=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1uU5Ut-0002d1-MD
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 15:23:43 +0000
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com
 [2607:f8b0:4864:20::a2e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35ea255e-510f-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 17:23:42 +0200 (CEST)
Received: by mail-vk1-xa2e.google.com with SMTP id
 71dfb90a1353d-531426c7139so1679800e0c.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 08:23:42 -0700 (PDT)
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
X-Inumbo-ID: 35ea255e-510f-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1750778621; x=1751383421; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X1oXnDljvh/r0rEbTqu2LKLOLW/85W+U5jWcdXp0lOw=;
        b=aCvbBTV38cCDG+gu9ZQeYO+MkmAApZKk+kai5e04ySsZxZtFtQPQnMeKdOHwvZHY+D
         mq7XgIRsehARCLXUkkkD+W/4BYd4sriG76LGsW09WMU7SnszpGj9vIMBucMDeyoBUPbx
         zSUNG5Weaww41M+rqxZL/c3Z3RGBVm4yplGA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750778621; x=1751383421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X1oXnDljvh/r0rEbTqu2LKLOLW/85W+U5jWcdXp0lOw=;
        b=Q6iYp4py/E01FuIjKADX1SNQmVX5WxY39UiUReyi3Jh94zxXSCCiojgBNxDXvUtwPa
         KYaJt1dpFNSO/6lWo24G+TYrQrwZneO7k3GK1/aRIodna4DY+10j060mX5QkCLfQgo6j
         ajAyH3imSEVsnTR4KHli2fhEhx+kRATnDQXXqYjyOGF88YnAx5YQd7eBAlscFb8bYlkF
         drCkm1POOYS1ooX1PErISkKl40phelsS6MIKk6kU8FBa+ywlOGzNKsu1fsmGwJdS+pp4
         0pxZdJ7NivRKlRLK1mFKI64TrUPYhkHx242Jz2Y99MvDEfBxfs24x+6l65egRO9aLFvl
         CFow==
X-Gm-Message-State: AOJu0YxhKHhYv0io1OWs5xh/x9HvmfyiCdiMzmiQo90pIBnp+VvM601v
	m95lQdp2l7XTPtsN1UpaMCV3y8NW8t2Xaebmz1+1GMo71SdGG6OY2NHiQPYht68EgifW/xiX7h3
	q6iPzDlS/ywjCBLHQVvq7UlfJkyb3o/7R2gB14tBPhw==
X-Gm-Gg: ASbGncuJ+oQtf3GOc2o13zOvK4XtxVLmV3YxXP6Rpk6UEChbfzGuGUwqiCsWncHK1io
	hipQwiYz4n+qMMr8/OLKp71bFUyy4klMNN636SsLoQIXbhlSaBv8/4HwEUuQUzlAxe5TTjBlkQy
	WT3BSU0qGhEzzSfm2VQYhosgJ7Dw3U9BPEWZCeMXBynVWpjA==
X-Google-Smtp-Source: AGHT+IEHLJwL3LpSRe/Q+iHwf/l1EOsgDs0cunMwWo/BfYDTkyH+FAFmvyTifMh/2nWJz+ZurpwccuyfRGzGnog5qKw=
X-Received: by 2002:a05:6122:3c42:b0:531:2afc:462a with SMTP id
 71dfb90a1353d-531ad6c3e30mr10620157e0c.3.1750778621303; Tue, 24 Jun 2025
 08:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <47b7f870-e1d9-44c9-b8ea-5b9028843963@gmail.com> <b27dae37-f395-4be5-98ad-41f97e8cf05d@gmail.com>
In-Reply-To: <b27dae37-f395-4be5-98ad-41f97e8cf05d@gmail.com>
From: Edwin Torok <edwin.torok@cloud.com>
Date: Tue, 24 Jun 2025 16:23:29 +0100
X-Gm-Features: AX0GCFv--tcJdp_L9GQC1DMUioNA6x3uvZju0A-i6BB5KXaritUCPM3RsrJrWLA
Message-ID: <CAEfZLvmqotxJJffz=Xc6g6s8UKA2bnz+kxPaOnXaP1d7hRB1Qg@mail.gmail.com>
Subject: Re: xenstore - Suggestion of batching watch events
To: Andriy Sultanov <sultanovandriy@gmail.com>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, 
	ngoc-tu.dinh@vates.tech, Christian Lindig <christian.lindig@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 4:01=E2=80=AFPM Andriy Sultanov
<sultanovandriy@gmail.com> wrote:
>
> On 6/24/25 3:51 PM, Andriy Sultanov wrote:
>
> > Suggestion:
> > WATCH_EVENT's req_id and tx_id are currently 0. Could it be possible, f=
or
> > example, to modify this such that watch events coming as a result of a
> > transaction commit (a "batch") have tx_id of the corresponding
> > transaction
> > and req_id of, say, 2 if it's the last such watch event of a batch and =
1
> > otherwise? Old clients would still ignore these values, but it would
> > allow
> > some others to detect if an update is part of a logical batch that
> > doesn't end
> > until its last event.
>
> Come to think of it, since clients could watch arbitrary parts of
> what the transaction touched, this wouldn't be as simple, xenstored
> would have to issue the "batch ended" packet per token, tracking
> that somehow internally... Perhaps transaction_start and transaction_end
> could produce WATCH_EVENT (or some other similar packet) as well so
> that this tracking could be done client-side? (standard WATCH_EVENT
> would still need their tx_id to be modified)
>

The Windows PV drivers also write a huge amount of data to xenstore.
E.g. I see 74 entries under /data, grouped by 1st level:
/data/volumes: 39
/dta/scsi: 7
/data/vif: 3
/data/xd: 2
/data/cpus: 2
/data/...: 19

This is probably why the /data/updated optimization used to be beneficial.

/attr/os/hotfixes is also large (28 on this VM, but used to be in the
hundreds for older versions of Windows).

In some situations xenopsd could set up more granular watches, but
then you run into scalability issues due to having thousands of
watches per domain (although you've fixed the largest problem there:
connecting/disconnecting xenstore clients causing slowdowns due to
watch trie walks).

There is also the problem that watch events don't contain enough
information, so watch events only acts as signals to xenopsd, which
then goes on and fetches the entire xenstore subtree to figure out
what actually changed. Which is the result of some of the O(N^2)
performance issues we still have.
We used to have a prototype xenstore cache which avoided actually
making those fetches from oxenstored, and once something got into its
cache, it kept track of updates by setting up a watch on the key.
Although a cold start then took ~30m (worse than not having a cache at
all). Although a compromise could be to cache on-the-fly (instead of
precaching everything you see), e.g. I don't think we actually care
about the values under /data/volumes and attr/os/hotfixes, other than
for debugging purposes, so if xenopsd never fetches them, the cache
shouldn't either.

To avoid a lot of round-trips a new kind of watch event that tells you
the value(s) in addition to the keys might be useful. And then this
new kind of watch event could also be emitted once per transaction (I
think the events are already emitted at transaction commit time, and
not sooner).
If filtering watch events based on tree depths would be useful in some
situations then the new watch event could also try to do that.
But then one such "batched" watch event could become too big, larger
than what would fit into the xenstore ring (and for historic reasons
we don't support sending >4k packets through xenstore).

Best regards,
--Edwin

