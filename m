Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A92F93F8F9
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 17:03:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766881.1177424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYRuL-0006tF-0c; Mon, 29 Jul 2024 15:03:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766881.1177424; Mon, 29 Jul 2024 15:03:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYRuK-0006qf-So; Mon, 29 Jul 2024 15:03:28 +0000
Received: by outflank-mailman (input) for mailman id 766881;
 Mon, 29 Jul 2024 15:03:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+PZO=O5=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1sYRuI-0006eV-Tv
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 15:03:26 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4e5dea5-4dbb-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 17:03:26 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5af326eddb2so5021963a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 08:03:26 -0700 (PDT)
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
X-Inumbo-ID: b4e5dea5-4dbb-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722265406; x=1722870206; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r39w7G2DfUB7c3EusM9NnT8kZ1CCHY4LUzhurD4ImZ8=;
        b=JNMNOn7lhTy8PTZecp7Be/4kpav+dViVihWl6/TLcMqPc/lrIv09BQnKu5FK5kWYY4
         2Wx7Z8GovD9CaRj3zEI/Tbe63QIkwHOO6IUAOm42YK5cyB/nja8diI54+Ece3cYiuwC0
         DXXe9issOAvSVkKLg/zDWKAEFZxVzcc/0MRxYi8RVMCgZsjpSDwXERhzKY0bz0+PFona
         h9CKN7ouVsKsiW8Scz4ZOftT3CazOMFGKGb9Sg3n4t2m1H5nRJfj1deXUc2+R7RLEkJh
         mLaQwX//b0yXe1JvykiAVK340bTEdEW+bdNOkIHZiKL7CvQRPy0vwm7QW4C8SZXa5zu2
         FVHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722265406; x=1722870206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r39w7G2DfUB7c3EusM9NnT8kZ1CCHY4LUzhurD4ImZ8=;
        b=d7lVQKdT4kspXiabOvxuim/1ebHW9sPaelR7pY8mEzxWV+QvXuqFqD6CeW9j8EcXX+
         M5F8MSK1MUHj/3TXJ2bRTx7T1qC8qRoEJkhY1tyOV0TNuImr9IWr27UNpAlw4C4a/JsV
         /ITHTnUfJ0OmIa7kkGvvGIn9Iv7coW2ebBf0NDAB/Z+RB9htZhWzTSUPxBCXlPT1k8Kl
         VxrGdGn3eqxgYtH3ymrA4l4Bu7CjSTkEB6GWwZQ57NDbrSFhMtUW0HFVXeQ80ZMC1vsj
         3Qh7a7DfJn7pNR0Wp0MObUQeoFfHoTPhRy6FRGh4fjZYzKTehwYTat5AXYbO80Xh78LJ
         R+oQ==
X-Gm-Message-State: AOJu0YwVEvXmnAUbNX9NVls84u4Us7ij/ofGOR+PcNUgZPOqVXolRZq3
	57RIKhF10ZiJVpedsE/PpElO0iOGe2i09V6X5kMwKgFZD2vSjkeN9+D8560a14MstOY3YJmIxpd
	1Psnd8MNkxK0JQN4e5jiSH90rYsV9Ax/w
X-Google-Smtp-Source: AGHT+IEj9xkOR+maYcz+v3DVnsOKo+OcgTaN7vgXrp5yAilaAQO12h7bty+bd2Q5XnSbuSRL8+uuhd02nWm7BBBvVvE=
X-Received: by 2002:a50:a40e:0:b0:58c:b2b8:31b2 with SMTP id
 4fb4d7f45d1cf-5b0191acfddmr6963373a12.17.1722265405187; Mon, 29 Jul 2024
 08:03:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240728210856.310083-1-jandryuk@gmail.com> <ZqeoAElP7fWJc15s@l14>
In-Reply-To: <ZqeoAElP7fWJc15s@l14>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 29 Jul 2024 11:03:13 -0400
Message-ID: <CAKf6xpvoUnZ_Vrwm9t7PBM5hgjspQ=C6FmWj5gr7V22WsRXsMA@mail.gmail.com>
Subject: Re: [PATCH v4] libxl: Enable stubdom cdrom changing
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Jason Andryuk <jason.andryuk@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2024 at 10:32=E2=80=AFAM Anthony PERARD
<anthony.perard@vates.tech> wrote:
>
> On Sun, Jul 28, 2024 at 05:08:56PM -0400, Jason Andryuk wrote:
> > +static void cdrom_insert_stubdom_parse_fdset(libxl__egc *egc,
> > +                                             libxl__ev_qmp *qmp,
> > +                                             const libxl__json_object =
*response,
> > +                                             int rc)
> > +{
> > +    EGC_GC;
> > +    libxl__cdrom_insert_state *cis =3D CONTAINER_OF(qmp, *cis, qmp);
> > +    int devid;
> > +    int fdset;
> > +
> > +    if (rc) goto out;
> > +
> > +    /* Only called for qemu-xen/linux stubdom. */
> > +    assert(cis->dm_ver =3D=3D LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN);
> > +
> > +    devid =3D libxl__device_disk_dev_number(cis->disk->vdev, NULL, NUL=
L);
> > +    fdset =3D query_fdsets_find_fdset(gc, response, devid);
> > +    if (fdset =3D=3D ERROR_NOTFOUND) {
> > +        /* Give the stubdom a little time before trying again. */
> > +        rc =3D libxl__ev_time_register_rel(cis->ao, &cis->retry_timer,
> > +                                         cdrom_insert_stubdom_query_fd=
set,
> > +                                         200);
> > +        if (rc) goto out;
>
> There's a missing "return;" here.

Thank you for spotting that!  Now I feel silly that I missed it.  My
quick testing yesterday succeeded, but it must not have needed a
retry.  So I did not notice.  I have re-tested with your change and
verified that retries happen properly - I see two 'query-fdsets' QMP
commands sometimes.

> And looks like it's the only issue,
> with that fixed: Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,
Jason

