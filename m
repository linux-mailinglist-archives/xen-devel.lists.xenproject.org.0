Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 159688ADBD9
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 04:23:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710282.1109443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rz5n7-0004oW-8J; Tue, 23 Apr 2024 02:21:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710282.1109443; Tue, 23 Apr 2024 02:21:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rz5n7-0004mB-4w; Tue, 23 Apr 2024 02:21:53 +0000
Received: by outflank-mailman (input) for mailman id 710282;
 Tue, 23 Apr 2024 02:21:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KYzg=L4=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rz5n5-0004m5-SQ
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 02:21:51 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3bfa4631-0118-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 04:21:47 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a5544fd07easo567447666b.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 19:21:47 -0700 (PDT)
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
X-Inumbo-ID: 3bfa4631-0118-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713838907; x=1714443707; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9OHZgBu+2wjBy8eA55zRBogvek594Zb6SuInV0CdcU=;
        b=YZ9Oxm6KieBiu3iizCththofDEtyUEUCEYLuQr+XHpxsM48AoMxm2E2D7nAenbjMzR
         Zy8+eGKwFaeEYJiQ1oWIHCD2sfVeAcO6GbZtseYqdtrwUG3veve6CFbL6kkqnM87ZpTE
         Ear0Xay2A1WOkszGfDaj0CjSCaoLdetiGXL2JzQFrlu3C6NAzkAlwy80SM/pCio0mpSl
         WMgzsucLSyTUHaROxQaPcCiYO9icZUTyYjUaSQcgnzouEQY2HEHqzZDZDdmS60N511gV
         jLg/HdQrcopJ10NaiiOZJbK0AyWx5JkVz2rvUxV+WhdttdgkgIla+h3SoTi4SoqN8+F9
         DS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713838907; x=1714443707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a9OHZgBu+2wjBy8eA55zRBogvek594Zb6SuInV0CdcU=;
        b=g4whjEF8Yc1IJ3V9ZsLMKQMZ/Q3o/o9LY9zLPhGcbnGNVw3mEIem9gYt9o34lFlD9P
         RRDpikgsj0ZeZdn9hYu+T0MjeIURL2gLeztghPKF/DM9Fl6GXmXq0/hfAm2rAK5lLpY6
         I3yFaq9+epeo5YRe6JN+Ct1Bew9Abv6e7jqb0z/2wph5QuXV35ZuDe6yPXM/I8y8Ha/0
         7YkGY4DBZGmexYPu5LmYSB8aiE5AIIDKFyFxW8UOgH1u2pgiSrW2NawymDtOT642A2Zh
         CmShM9CwP8nxXvb4lzGtIy7NqRYiYyraGelWM4+uFlF0koDyAYpG9ZZM1G3jMe8t9N3I
         zelQ==
X-Gm-Message-State: AOJu0YyZ/5o5MUy8sWky4eXarYBfBQGBsUkUcL8NP4Dq6e4oSiJ/9Y8c
	V3Pdc8VIt8FKgwowCxQDBb4jKdSU+DmbWXUC/roKewX4GNk8l7l+iEaojLN75vewGVIFp6aI8Hp
	Uky6AolbdTXY3NhmU40p34KFMPXI=
X-Google-Smtp-Source: AGHT+IGs9ZFsSAI73AWyUVbPt6RLBymHB6VG+kSMPVTQxwJKKYLe1WgBt6av8wYCQ9KVVR2qLtHAKkQx/KDDukXfOSo=
X-Received: by 2002:a50:d787:0:b0:56b:ec47:a846 with SMTP id
 w7-20020a50d787000000b0056bec47a846mr6586149edi.25.1713838906619; Mon, 22 Apr
 2024 19:21:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240407204953.60442-1-jandryuk@gmail.com> <20240407204953.60442-2-jandryuk@gmail.com>
 <42f1eaef-d804-4816-b746-ee24d860e0f7@perard>
In-Reply-To: <42f1eaef-d804-4816-b746-ee24d860e0f7@perard>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 22 Apr 2024 22:21:34 -0400
Message-ID: <CAKf6xpuXPjheXgM1vSF0+mmmjCFzKnC8fUGiba4P4ehjx45PAQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] hotplug: Update block-tap
To: Anthony PERARD <anthony.perard@cloud.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Jason Andryuk <jason.andryuk@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 22, 2024 at 11:11=E2=80=AFAM Anthony PERARD
<anthony.perard@cloud.com> wrote:
>
> On Sun, Apr 07, 2024 at 04:49:51PM -0400, Jason Andryuk wrote:
> > diff --git a/tools/hotplug/Linux/block-tap b/tools/hotplug/Linux/block-=
tap
> > index 89247921b9..126e472786 100755
> > --- a/tools/hotplug/Linux/block-tap
> > +++ b/tools/hotplug/Linux/block-tap
> > @@ -18,11 +18,11 @@
> >  #
> >  # Usage:
> >  #
> > -# Target should be specified using the following syntax:
> > +# Disks should be specified using the following syntax:
> >  #
> > -# script=3Dblock-tap,vdev=3Dxvda,target=3D<type>:<file>
> > +# vdev=3Dxvda,backendtype=3Dtap,format=3Dvhd,target=3D/srv/target.vhd
>
> I still have unanswered question from the previous round:
>     Is `block-tap` still going to work with the current example given in
>     the script header? That is:
>         "script=3Dblock-tap,vdev=3Dxvda,target=3D<type>:<file>"
>     Or maybe, that example is already broken?

Oh, right.  Sorry about that.

> If it's not broken, there could be users which rely on it. But maybe
> it's not really broken, and the new syntax is better anyway.
>
> My guess is that using "script=3Dblock-tap,..." might still work, but
> we should say something in the CHANGELOG to encourage people to move to
> the new syntax, with "backendtype=3Dtap" to avoid issues.

I think the old syntax with "backendtype=3Dphy" would work except for this:
-    write_dev $dev
...
+    # dev, as a unix socket, would end up with major:minor 0:0 in
+    # physical-device if write_dev were used.  tapback would be thrown off=
 by
+    # that incorrect minor, so just skip writing physical-device.
+    xenstore_write "$XENBUS_PATH/physical-device-path" "$dev"

write_dev is needed for blkback to see physical-device and set things
up properly.

I could create a second script, but that's a little silly for just the
single line.  Another approach would be to differentiate off the
device type, vbd vs. vbd3, and use write_dev or not that way.  Should
I just do that?

block-tap will only support backendtype=3Dphy as long as blktap uses the
kernel driver.  In that case tap-ctl create is returning the kernel
module's block dev path.  Once the kernel drive support is removed,
backendtype=3Dtap will be the only option - without it there is no block
dev for blkback.

FYI, "backendtype=3Dtap" is more performant because it is a shorter data pa=
th:
blkfront -> tapback/tapdisk
vs
blkfront -> blkback -> /dev/xen/blktap-2/tapdevN -> tapdisk

There are extra copies between blktap and the tapdev.

> In any case, the patch looks good:
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,
Jason

