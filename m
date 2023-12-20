Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FCD81A002
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 14:40:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657798.1026895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFwo8-0002CP-4R; Wed, 20 Dec 2023 13:40:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657798.1026895; Wed, 20 Dec 2023 13:40:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFwo8-0002Al-19; Wed, 20 Dec 2023 13:40:20 +0000
Received: by outflank-mailman (input) for mailman id 657798;
 Wed, 20 Dec 2023 13:40:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=265R=H7=gmail.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1rFwo7-0002Af-AW
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 13:40:19 +0000
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [2607:f8b0:4864:20::c2f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4fbb9966-9f3d-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 14:40:18 +0100 (CET)
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-58d06bfadf8so3997980eaf.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 05:40:18 -0800 (PST)
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
X-Inumbo-ID: 4fbb9966-9f3d-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703079617; x=1703684417; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uMd4ADOFvkzah5me9T/+HHhJ6VCiXe+Wthd/vIvVj/o=;
        b=jJ6kALfM59GKxftGllmAALOADIkc3z0jXHySHOy3S9A108YwKO3kV8xVjxiC8B3anO
         +Ccj7wVhkvjgzO6uTa/Dy6zcABXoC9fi6YPMR1FKhzGQikePJV1Fxjvr5q39gB4tfVuY
         uO28a1tQBYYEEr6jnKvRBcVki4+NKE+hX4XNYNWUbLLQsV5tQgVvWBADBPEjtiCBU8Pb
         xAJ0nmehFaObZVl6caXiD1EtQIvO/dN/KlDoj53E1MoKEiIZW6Kldhd/L2zGiB11Vi8+
         VYReJTH41I96mlVcbQ1s3PNPMxBYd5xeAhvmBPFdiH8wfYqTZ56IwCTE+t1YkCDeW1O1
         jvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703079617; x=1703684417;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uMd4ADOFvkzah5me9T/+HHhJ6VCiXe+Wthd/vIvVj/o=;
        b=ibF880IloGRxdxK9u/PITZ+a38ns3mgj2IiHx6RHq3em1ebqs0c37K4hKqCk7G16ep
         6a7j7xf57K4Bk67CJBcPe176abnTpWFicwLRgPy95IEKdcGbXs7xwqiUy1wELGwVbK7A
         37Iv/gHRSaOrCYjBY6v/ZleqKBvaag0wUxJfV02x6TWk9pLRd42EMC7dG/ZDqQmmPsIa
         blzMfy1zbxIe7xkz0u49hBQcvjcqbUfrHrQ6NaVO24+pCgvYTp9mglEfesWVo644HHkS
         Y0xiJ7NpcOT/ckI5jOOLe4XBpa65cTOV3E0HVRwIAzzax0xHgA5A6E7ooBtEc5l1zmNN
         nhdQ==
X-Gm-Message-State: AOJu0YxtF3ldihPRZzWdghJHrhb/FEQITUJOpVSVuZE8aDX7aZwwAWnt
	irRN8VxmvKx+aLihTf8heDEgLe70LIJc2H3sbwg=
X-Google-Smtp-Source: AGHT+IG4wiFT4rUzLfQAVpvMwGvhbloaVAniWXFbzQNYl02YYRfoCtVhV2QvGtYv0LsqGi1jEHbDB4q4s7vK0gg2PG4=
X-Received: by 2002:a4a:8c26:0:b0:593:e06a:5ade with SMTP id
 u35-20020a4a8c26000000b00593e06a5ademr2000642ooj.14.1703079616936; Wed, 20
 Dec 2023 05:40:16 -0800 (PST)
MIME-Version: 1.0
References: <20231205182011.1976568-1-stefanha@redhat.com> <20231205182011.1976568-5-stefanha@redhat.com>
 <ZYG2mSe1JWnC0tq_@redhat.com> <ZYHew2poxuJJRyhC@redhat.com>
 <CAJSP0QX0fg0TGWuveJz6+QbF9EmY=vPiU-c99fHZMN=1jAnXkw@mail.gmail.com> <ZYK0pUSPFQiU4Qs_@redhat.com>
In-Reply-To: <ZYK0pUSPFQiU4Qs_@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 20 Dec 2023 08:40:04 -0500
Message-ID: <CAJSP0QXc2RVDHC_-CxbB_rvKOR36Q_wz5wWgCgaFtYt37oE6XA@mail.gmail.com>
Subject: Re: [PATCH v2 04/14] aio: make aio_context_acquire()/aio_context_release()
 a no-op
To: Kevin Wolf <kwolf@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, Cleber Rosa <crosa@redhat.com>, 
	Xie Changlong <xiechanglong.d@gmail.com>, Paul Durrant <paul@xen.org>, Ari Sundholm <ari@tuxera.com>, 
	Jason Wang <jasowang@redhat.com>, Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Wen Congyang <wencongyang2@huawei.com>, 
	Alberto Garcia <berto@igalia.com>, Anthony Perard <anthony.perard@citrix.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org, 
	Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>, 
	Fabiano Rosas <farosas@suse.de>, Hanna Reitz <hreitz@redhat.com>, Zhang Chen <chen.zhang@intel.com>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Peter Xu <peterx@redhat.com>, 
	Emanuele Giuseppe Esposito <eesposit@redhat.com>, Fam Zheng <fam@euphon.net>, Leonardo Bras <leobras@redhat.com>, 
	David Hildenbrand <david@redhat.com>, Li Zhijian <lizhijian@fujitsu.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Dec 2023 at 04:32, Kevin Wolf <kwolf@redhat.com> wrote:
>
> Am 19.12.2023 um 22:23 hat Stefan Hajnoczi geschrieben:
> > The following hack makes the test pass but there are larger safety
> > issues that I'll need to look at on Wednesday:
>
> I see, you're taking the same approach as in the SCSI layer: Don't make
> things thread-safe, but just always access them from the same thread.

Yes, but it feels like a hack to me. You pointed out that other parts
also don't look thread-safe (e.g. the clients list) and I agree. I've
started annotating the code and will try to come up with a full fix
today.

Stefan

