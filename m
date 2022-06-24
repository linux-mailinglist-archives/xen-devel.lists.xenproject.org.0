Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AABCE5599CD
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 14:46:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355522.583238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4ihQ-0006Rp-Ve; Fri, 24 Jun 2022 12:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355522.583238; Fri, 24 Jun 2022 12:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4ihQ-0006Pv-Rh; Fri, 24 Jun 2022 12:46:12 +0000
Received: by outflank-mailman (input) for mailman id 355522;
 Fri, 24 Jun 2022 12:46:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WzJM=W7=gmail.com=dunlapg@srs-se1.protection.inumbo.net>)
 id 1o4ihP-0006OQ-4Y
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 12:46:11 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c023013-f3bb-11ec-bd2d-47488cf2e6aa;
 Fri, 24 Jun 2022 14:46:04 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id b7so2654287ljr.6
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jun 2022 05:46:04 -0700 (PDT)
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
X-Inumbo-ID: 9c023013-f3bb-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PFlSWgy8YXnx55Xf+blzeHc6ct4HtMg7b30IIQJgP0c=;
        b=fzVaQHPwzE1Z0jBDIGptzMIAc9rhq7mH5oLrPP8RB7YI80wdi+hCAPsI2cWBh79YrX
         S/H8B4u2NNU9SADbbj/vAXAites+QEDYKjjIly+lSOY93wCD8EGKmHBZgMOVv2mGDwlf
         4l8t6SYqfZ3gk5X3TG/lc57LUl0JYs9nK6qr6n5Bpa3k85Rn+hLAlysUoqVTW4uOVhBw
         Kl7YvMOW/YDOXMtZbpgKkAs2JfEPelVnWDgUByEdMi2lGx/fEJbvCT6WWYnLlvEEUCE+
         jfKbE3uhjUTHg5odYCdO98wmINLC3bKbaOIuj8Hk5N/aRRrCqr61i/XI+i+MEb1liXEW
         fl0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PFlSWgy8YXnx55Xf+blzeHc6ct4HtMg7b30IIQJgP0c=;
        b=2Skz1EKAg8Naej2aqZcng0akGS4ZXCzqYNQ+VJhWKp+PoW3RQisSqNglsZu/5jkiPE
         TZIvAJ31PXGS8Ot6yXRd6jkSoTMK/wGiwWmybfPk8JZkr4w2SLHOv/Z0D3F+NCiowWGk
         uk6OAQAu4llpZccDS2YAX3bM5ZMAkE+C6trpAmgSDlMVFyZ2a51JoYSo+hdBxNFhaUVc
         EJ+0uktvxTDXZOUIUBAaHOI1PMrVfyeeTZF5mK6MdBjF6UIz3qUKdht1+F84ypjeGG3T
         FCjzUqFLXci9kLTHEFa+A4JqWXqDWJqMz0k7S4+WoQJ3eEXMRie9V/SwZcQyZZbe0Fp/
         wvzg==
X-Gm-Message-State: AJIora9tog5xnFzgOpP5klMVQQbTNn4A8nzqYYEmdY9PV5qnsaRhMbXh
	tBgEhm/a/2g9rp+7ElEo0ojq35e97C3PfqWz/Cw=
X-Google-Smtp-Source: AGRyM1v3/iO8C3mYcwsi8245fqTvEDODrhUaSg3ZzF/LhPIWBLViGrINGqpB0qB57vH0PzNn4VQkwh5dJ8w5XZD0/Us=
X-Received: by 2002:a05:651c:11d0:b0:25a:978e:4892 with SMTP id
 z16-20020a05651c11d000b0025a978e4892mr3681796ljo.517.1656074763913; Fri, 24
 Jun 2022 05:46:03 -0700 (PDT)
MIME-Version: 1.0
References: <1638982784-14390-1-git-send-email-olekstysh@gmail.com>
 <1638982784-14390-2-git-send-email-olekstysh@gmail.com> <YbjANCjAUGe4BAar@perard>
 <bce10079-abd6-c033-6273-ac0ea9f51668@gmail.com> <4c89e55d-4bf1-506e-d620-4a0ff18ef308@suse.com>
 <dc1b70ac-079d-5de8-cb13-6be4944cef0a@gmail.com> <813684b0-df71-c18b-cf4c-106cc286c035@suse.com>
In-Reply-To: <813684b0-df71-c18b-cf4c-106cc286c035@suse.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Fri, 24 Jun 2022 13:45:52 +0100
Message-ID: <CAFLBxZbm0KcLhpqs2tGXgx6-JP+3OtkMEReTaphBC-JHZ3sJDQ@mail.gmail.com>
Subject: Re: [PATCH V6 1/2] libxl: Add support for Virtio disk configuration
To: Juergen Gross <jgross@suse.com>
Cc: Oleksandr <olekstysh@gmail.com>, Anthony PERARD <anthony.perard@citrix.com>, 
	xen-devel <xen-devel@lists.xenproject.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>, 
	Nick Rosbrook <rosbrookn@ainfosec.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, George Dunlap <george.dunlap@citrix.com>
Content-Type: multipart/alternative; boundary="00000000000006517d05e230f4ef"

--00000000000006517d05e230f4ef
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 15, 2021 at 3:58 PM Juergen Gross <jgross@suse.com> wrote:

> On 15.12.21 16:02, Oleksandr wrote:


> In practice we are having something like the "protocol" already today:
> the disk device name is encoding that ("xvd*" is a Xen PV disk, while
> "sd*" is an emulated SCSI disk, which happens to be presented to the
> guest as "xvd*", too). And this is an additional information not
> related to the backendtype.
>
> So we have basically the following configuration items, which are
> orthogonal to each other (some combinations might not make sense,
> but in theory most would be possible):
>
> 1. protocol: emulated (not PV), Xen (like today), virtio
>
> 2. backendtype: phy (blkback), qdisk (qemu), other (e.g. a daemon)
>
> 3. format: raw, qcow, qcow2, vhd, qed
>
> The combination virtio+phy would be equivalent to vhost, BTW. And
> virtio+other might even use vhost-user, depending on the daemon.
>

Sorry to fly in here 7 months after the fact to quibble about something,
but since we're baking something into an external interface, I think it's
worth making sure we get it exactly right.

It seems to me that the current way that "backendtype" is used is to tell
libxl how to set up the connection.  For "phy", it talks to the dom0
blkback driver, and hands it a file or some other physical device.  For
qdisk, it talks to the QEMU which is already associated with the domain:
either the qdisk process started up when the PV/H domain was created, or
the emulator started up when the HVM guest was created.  (Correct me if
I've made a mistake here.)

Given that, "other" is just wrong.  The toolstack needs to know
*specifically* how to drive the thing that's going to be providing the
protocol.  I'm not sure what you're expecting to use in this case, but
presumably if we're adding a third thing (in addition to blkback and QEMU),
then at some point we're going to be adding a fourth thing, and a fifth
thing as well.  What do we call them?  "Other other" and "other other
other"?

If we're planning on having a general interface for these daemons that are
going to be be virtio providers, we should come up with a specific name for
them as a class, and use that for the name.

Furthermore, "virtio+phy == vhost" is just wrong: phy means that libxl is
using blkback, and blkback can't speak the virtio protocol.  If we want to
use vhost (or something like it), then it will need its own separate
backendtype.

 -George

--00000000000006517d05e230f4ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Dec 15, 2021 at 3:58 PM Juergen G=
ross &lt;<a href=3D"mailto:jgross@suse.com">jgross@suse.com</a>&gt; wrote:<=
br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On 15.12.21 16:02, Oleksandr wrote:=C2=A0</blockquote><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><br>
In practice we are having something like the &quot;protocol&quot; already t=
oday:<br>
the disk device name is encoding that (&quot;xvd*&quot; is a Xen PV disk, w=
hile<br>
&quot;sd*&quot; is an emulated SCSI disk, which happens to be presented to =
the<br>
guest as &quot;xvd*&quot;, too). And this is an additional information not<=
br>
related to the backendtype.<br>
<br>
So we have basically the following configuration items, which are<br>
orthogonal to each other (some combinations might not make sense,<br>
but in theory most would be possible):<br>
<br>
1. protocol: emulated (not PV), Xen (like today), virtio<br>
<br>
2. backendtype: phy (blkback), qdisk (qemu), other (e.g. a daemon)<br>
<br>
3. format: raw, qcow, qcow2, vhd, qed<br>
<br>
The combination virtio+phy would be equivalent to vhost, BTW. And<br>
virtio+other might even use vhost-user, depending on the daemon.<br></block=
quote><div><br></div><div>Sorry to fly in here 7 months after the fact to q=
uibble about something, but since we&#39;re baking something into an extern=
al interface, I think it&#39;s worth making sure we get it exactly right.</=
div><div><br></div><div>It seems to me that the current way that &quot;back=
endtype&quot; is used is to tell libxl how to set up the connection.=C2=A0 =
For &quot;phy&quot;, it talks to the dom0 blkback driver, and hands it a fi=
le or some other physical device.=C2=A0 For qdisk, it talks to the QEMU whi=
ch is already associated with the domain: either the qdisk process started =
up when the PV/H domain was created, or the emulator started up when the HV=
M guest was created.=C2=A0 (Correct me if I&#39;ve made a mistake here.)<br=
></div><div><br></div><div>Given that, &quot;other&quot; is just wrong.=C2=
=A0 The toolstack needs to know *specifically* how to drive the thing that&=
#39;s going to be providing the protocol.=C2=A0 I&#39;m not sure what you&#=
39;re expecting to use in this case, but presumably if we&#39;re adding a t=
hird thing (in addition to blkback and QEMU), then at some point we&#39;re =
going to be adding a fourth thing, and a fifth thing as well.=C2=A0 What do=
 we call them?=C2=A0 &quot;Other other&quot; and &quot;other other other&qu=
ot;?</div><div><br></div><div>If we&#39;re planning on having a general int=
erface for these daemons that are going to be be virtio providers, we shoul=
d come up with a specific name for them as a class, and use that for the na=
me.</div><div><br></div><div>Furthermore, &quot;virtio+phy =3D=3D vhost&quo=
t; is just wrong: phy means that libxl is using blkback, and blkback can&#3=
9;t speak the virtio protocol.=C2=A0 If we want to use vhost (or something =
like it), then it will need its own separate backendtype.</div><div><br></d=
iv><div>=C2=A0-George</div><div><br></div></div></div>

--00000000000006517d05e230f4ef--

