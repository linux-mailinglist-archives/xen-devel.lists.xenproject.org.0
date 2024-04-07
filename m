Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F81589B3DB
	for <lists+xen-devel@lfdr.de>; Sun,  7 Apr 2024 22:01:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701674.1095987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtYgm-0007Hc-RJ; Sun, 07 Apr 2024 20:00:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701674.1095987; Sun, 07 Apr 2024 20:00:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtYgm-0007Fk-NR; Sun, 07 Apr 2024 20:00:28 +0000
Received: by outflank-mailman (input) for mailman id 701674;
 Sun, 07 Apr 2024 20:00:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CRZ/=LM=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rtYgl-0007Fe-7b
 for xen-devel@lists.xenproject.org; Sun, 07 Apr 2024 20:00:27 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 790b14a4-f519-11ee-a1ef-f123f15fe8a2;
 Sun, 07 Apr 2024 22:00:25 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2d6ff0422a2so46084141fa.2
 for <xen-devel@lists.xenproject.org>; Sun, 07 Apr 2024 13:00:25 -0700 (PDT)
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
X-Inumbo-ID: 790b14a4-f519-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712520024; x=1713124824; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m965x1xkDyUyEkwRlIQaHJy6L5GhiWVq9g0+EGe6DjE=;
        b=Ab1gr88C5MmzNNP0gCwVJSQXQWh/GHCenDmHPsOT5yK632a1TsaN/L8SNjRE+OuK2d
         L6qkakoGPaBZfbLBlyou8gF4Gtb7WCzic0rUYMkegfwmd8y8HZPXZTn6v/EmnK+UK/ck
         Xqqz2Dj8gGBxSZTwgVuJeJ+PY06UOrtk+/mhbpM5yzg/nIyq3d13wS64Aqxp+/eziGEY
         eL7SJECCrOQviB1qzW5M5jp/eCZg+pCzztWEJduLgt9kMszNUaW4nZS7xZH+4eWcsaQK
         KzcDrWkKM8P9l1ZyrEJkcyZxqFqo434V0z/EkeyD6X8u9KVx6jJtztUOqy/T0qLnEDqw
         2ouQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712520024; x=1713124824;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m965x1xkDyUyEkwRlIQaHJy6L5GhiWVq9g0+EGe6DjE=;
        b=n0cmuauBhmWq739whYLGLg9bvfjj+DNii2WiM49jHHfoW2I5o9dXi4Hor7tPP6pTK9
         IGVQjgooRIOH9hxFB0McyfOHEBKcFuMrxKYooo87oesG67Uev1m/0IW+fMnirbOnwRFc
         rvrXqVcYw+AYpBJM2eqDYQMpzIpolYFoFtjf9FmSE8LZWCrdygcxdXWaeSZ5KtHjVVGX
         0cWfxjVdcpYGmickjJud2zhzodj8Xyyyiey0AmmGg0XXyTCCOcdIelXf8pIpeJKHs7hN
         g9gr0cpSJAMRUlLXO6whznXx0SieiAu8J/gCWAPSjL9+qTwTlU/7iErpxQV+JE+g7Dr0
         TgzA==
X-Gm-Message-State: AOJu0YxUkjgyqytEnhZw4G1SFRGapefq40Pght5z5I45Z5gqv6lzLIaE
	hHuZ5DoBDWSJ+61In/4VqZ4JBOcwvEgGuaYkCL13DpxjvRqX+WrRoI08xqJ6s/96KS0mW6nSrt+
	Ds8TjkmaYprAu2+dvkziGON7ttJF4b0IK
X-Google-Smtp-Source: AGHT+IF4uWVpmpUMrjTc53b1P3fIZ9fE2buwmhLRJKl8xt8Nll/O27THYSxjqR+rje8/Gu6DUA43swEf7Y1kVIlyQ9Y=
X-Received: by 2002:a2e:9f09:0:b0:2d5:9703:263c with SMTP id
 u9-20020a2e9f09000000b002d59703263cmr5118931ljk.4.1712520023538; Sun, 07 Apr
 2024 13:00:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240407143633.24108-1-jandryuk@gmail.com>
In-Reply-To: <20240407143633.24108-1-jandryuk@gmail.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Sun, 7 Apr 2024 16:00:11 -0400
Message-ID: <CAKf6xpsciLssBNEkj_9=eE+yO8COX=t8xhAB5r4S=TJVgguDbw@mail.gmail.com>
Subject: Re: [PATCH v2] libxl: Enable stubdom cdrom changing
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, 
	Jason Andryuk <jason.andryuk@amd.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: multipart/mixed; boundary="000000000000ad3a0a06158723cf"

--000000000000ad3a0a06158723cf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 7, 2024 at 10:36=E2=80=AFAM Jason Andryuk <jandryuk@gmail.com> =
wrote:
>
> To change the cd-rom medium, libxl will:
>  - QMP eject the medium from QEMU
>  - block-detach the old PV disk
>  - block-attach the new PV disk
>  - QMP change the medium to the new PV disk by fdset-id
>
> The QMP code is reused, and remove and attach are implemented here.
>
> The stubdom must internally handle adding /dev/xvdc to the appropriate
> fdset.  libxl in dom0 doesn't see the result of adding to the fdset as
> that is internal to the stubdom, but the fdset's opaque fields will be
> set to stub-devid:$devid, so libxl can identify it.  $devid is common
> between the stubdom and libxl, so it can be identified on both side.
> The stubdom will name the device xvdY regardless of the guest name hdY,
> sdY, or xvdY, but the stubdom will be assigned the same devid
> facilitating lookup.  Because the stubdom add-fd call is asynchronous,
> libxl needs to poll query-fdsets to identify when add-fd has completed.
>
> For cd-eject, we still need to attach the empty vbd.  This is necessary
> since xenstore is used to determine that hdc exists.  Otherwise after
> eject, hdc would be gone and the cd-insert would fail to find the drive
> to insert new media.
>
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---

Also, these are the stubdom side changes.

The stubdom QEMU command line should gain a qmp socket for the script:
-chardev socket,server=3Don,wait=3Doff,path=3D/tmp/qemu-cdrom.qmp,id=3Dm-cd=
rom
-mon chardev=3Dm-cdrom,mode=3Dcontrol

mdev.conf:
# Only add for addition
xvd[a-d] 0:0 660 @qemu-xvdc-add-fd.sh

And the attached qemu-xvdc-add-fd.sh script to call add-fd with
"opaque" set as "stub-devid:$devid".  DEVPATH is only set on hot plug
and not cold plug.  Using it when available avoids IO - busybox
`readlink` will need to be installed in the stubdom.  If cold plugging
is not performed, libxl skips issuing the remove-fd call when it can't
find a matching fdset.

Regards,
Jason

--000000000000ad3a0a06158723cf
Content-Type: application/x-shellscript; name="qemu-xvdc-add-fd.sh"
Content-Disposition: attachment; filename="qemu-xvdc-add-fd.sh"
Content-Transfer-Encoding: base64
Content-ID: <f_lupy3qdb0>
X-Attachment-Id: f_lupy3qdb0

IyEvYmluL3NoCgpleGVjIDE+L2Rldi9jb25zb2xlIDI+JjEKCmFkZCgpIHsKCWlmIFsgLW4gIiRE
RVZQQVRIIiBdIDsgdGhlbgoJCSMgUGFyc2UgREVWUEFUSD0vZGV2aWNlcy92YmQtMjA4MC9ibG9j
ay94dmRjCgkJZGV2aWQ9IiR7REVWUEFUSCMvZGV2aWNlcy92YmQtfSIKCQlkZXZpZD0iJHtkZXZp
ZCUvYmxvY2svJHtNREVWfX0iCgllbHNlCgkJZGV2aWQ9IiQoIHJlYWRsaW5rICIvc3lzL2Jsb2Nr
LyRNREVWL2RldmljZSIgKSIKCQlkZXZpZD0iJHtkZXZpZCMqL3ZiZC19IgoJZmkKCglxbXBfaGVs
bG89JChwcmludGYgJ3siZXhlY3V0ZSI6InFtcF9jYXBhYmlsaXRpZXMiLCJpZCI6MX1cclxuJykK
CXFtcF9hZGRmZD0kKHByaW50ZiAneyJleGVjdXRlIjoiYWRkLWZkIiwgImFyZ3VtZW50cyI6IHsg
Im9wYXF1ZSI6ICIlcyIgfSwgImlkIjo0MiB9XHJcbicgInN0dWItZGV2aWQ6JGRldmlkIiApCgoJ
ZWNobyAiYWRkICRNREVWIHRvIGZkc2V0ICRmZHNldCIKCglmZD0vZGV2L2ZkLzkKCWlmIFsgIiQo
IGNhdCAvc3lzL2NsYXNzL2Jsb2NrLyIkTURFViIvcm8gKSIgLWVxIDEgXSA7IHRoZW4KCQlleGVj
IDk8L2Rldi8iJE1ERVYiCgllbHNlCgkJZXhlYyA5PD4vZGV2LyIkTURFViIKCWZpCgoJYWRkLWZk
IC90bXAvcWVtdS1jZHJvbS5xbXAgIiRmZCIgIiRxbXBfaGVsbG8kcW1wX2FkZGZkIiAiNDIiCgll
Y2hvIGFkZC1mZCByZXR1cm5lZCAiJD8iCgoJZXhlYyA5PCYtCn0KCmNhc2UgIiRBQ1RJT04iIGlu
CglhZGQpCgkJYWRkCgkJOzsKZXNhYwo=
--000000000000ad3a0a06158723cf--

