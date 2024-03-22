Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E01748864F1
	for <lists+xen-devel@lfdr.de>; Fri, 22 Mar 2024 02:56:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696632.1087709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnU8E-0003el-5M; Fri, 22 Mar 2024 01:55:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696632.1087709; Fri, 22 Mar 2024 01:55:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnU8E-0003bp-2V; Fri, 22 Mar 2024 01:55:42 +0000
Received: by outflank-mailman (input) for mailman id 696632;
 Fri, 22 Mar 2024 01:55:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DExB=K4=smartx.com=yong.huang@srs-se1.protection.inumbo.net>)
 id 1rnU8C-0003bj-K2
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2024 01:55:40 +0000
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [2607:f8b0:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45e419f2-e7ef-11ee-a1ee-f123f15fe8a2;
 Fri, 22 Mar 2024 02:55:36 +0100 (CET)
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-5dbd519bde6so1046235a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 18:55:35 -0700 (PDT)
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
X-Inumbo-ID: 45e419f2-e7ef-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smartx-com.20230601.gappssmtp.com; s=20230601; t=1711072534; x=1711677334; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EzIedkjP0LEiwr8PUCzEsIhUTFBbw9IsPgV6MMV2IDk=;
        b=TdNC6oroXVksr+MNbZxxWcAxVbI5+JIv8kFF9bCnkeNt8nUoI8JXsCfQf9TkNrZYvO
         GBZW75de0mCO0I8kSLrt7FUa9jhIJQcZHAHGVtAQzTb8GoVi7RlUtgrGY7T2W6MsMeI3
         DrXlwTcxRpEp6T3tmt+Kg1nRuE0EKlxAex5xQYkqcNbU8ryc2qB6T3Q5iFWTwX3mGDze
         HGfTS4VhMZ2KUvR4+3UfebVEDf5+Nl8j4ZvbZ49Nc1CK5d+O7stZVvgHdk5tvZb6mIEk
         BvyQF+9i31glQscUE2scyVcCQYj/SzQ1lrbp8cenx5fqkEdXMxOWZRQEk0VAu7FL/QZf
         xYTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711072534; x=1711677334;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EzIedkjP0LEiwr8PUCzEsIhUTFBbw9IsPgV6MMV2IDk=;
        b=wjGcUMjL6s8HwVic7DL1KHgyaan3e7a2C6raWKnQHxOwyqu7xmxfJLiP5sn9m0CPa3
         OgIX2YKoj5kbhHDfjYfaD5Yiuq/1qpe6+WA3+zyr4mdjwxtDzsbhfkV18K8egtG2iQhb
         f4m/eR16cU0ML4C4EuJE7EP4Wo+2HC40Ytpw2ixrjhpbKTh2bImy8X52rLQo7Ca+KCJ0
         rjT+ldTCfe9Sj3X97pFbU/ynyTI7jF8vDK62ErbGHPhmOd1gBfwq266unxgCQuEOr3ND
         unDkwLDOA/MeecHuckMu+xKFQ5oyn5qp+/A7wp9sDj56G7X8fkLhx3sEC/Xv1JJCvKk7
         4RVA==
X-Forwarded-Encrypted: i=1; AJvYcCW6mASJD35yk/SIh+a0fG4aZj4aw9UCnCFc0wQNW5iaggns1LHAHA+c1c+SGQUkd5Amk5KE2KvS9UMOyvR7p5zu0ApFlA7zu8af6InJ/oc=
X-Gm-Message-State: AOJu0YzNzR2FAXwXVnGEQud3uw0+wOF8bLoTc33fFHb7DiaOIW4kHlRY
	CYtfbufvvGzLoMaQpwS0pw0iwB2Jwl4XxitB9+hIkzrJAZHufaYwsq/Sb9OegvNZ7pLgdPlWQak
	t1hng7d+rH0rN5Ce9QRFhEwpcMMNULSdQ8aaNDQ==
X-Google-Smtp-Source: AGHT+IEbo5r7yzg00gqOHO1oaR9WuKR/d65AU7VaDJ8KqEEbxNGXkejY0G5rWbPV2hOyHqThe5iTa82tY2r5TYnRxNo=
X-Received: by 2002:a17:90a:d705:b0:2a0:2b14:9593 with SMTP id
 y5-20020a17090ad70500b002a02b149593mr1169651pju.6.1711072534302; Thu, 21 Mar
 2024 18:55:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240320064911.545001-1-clg@redhat.com> <20240320064911.545001-12-clg@redhat.com>
 <Zfr-W0aubJC_lfaK@x1n>
In-Reply-To: <Zfr-W0aubJC_lfaK@x1n>
From: Yong Huang <yong.huang@smartx.com>
Date: Fri, 22 Mar 2024 09:55:18 +0800
Message-ID: <CAK9dgmYyV-vH8YA=vkL8afXMByCTdnYUNM=XtG8xv5kpu4t6_A@mail.gmail.com>
Subject: Re: [PATCH for-9.1 v5 11/14] memory: Add Error** argument to the
 global_dirty_log routines
To: Peter Xu <peterx@redhat.com>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-devel@nongnu.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, 
	Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
	David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Fabiano Rosas <farosas@suse.de>, Alex Williamson <alex.williamson@redhat.com>, 
	Avihai Horon <avihaih@nvidia.com>, Markus Armbruster <armbru@redhat.com>, 
	Prasad Pandit <pjp@fedoraproject.org>, xen-devel@lists.xenproject.org, 
	Hailiang Zhang <zhanghailiang@xfusion.com>
Content-Type: multipart/alternative; boundary="00000000000097d4950614361ece"

--00000000000097d4950614361ece
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 20, 2024 at 11:19=E2=80=AFPM Peter Xu <peterx@redhat.com> wrote=
:

> On Wed, Mar 20, 2024 at 07:49:07AM +0100, C=C3=A9dric Le Goater wrote:
> > Now that the log_global*() handlers take an Error** parameter and
> > return a bool, do the same for memory_global_dirty_log_start() and
> > memory_global_dirty_log_stop(). The error is reported in the callers
> > for now and it will be propagated in the call stack in the next
> > changes.
> >
> > To be noted a functional change in ram_init_bitmaps(), if the dirty
> > pages logger fails to start, there is no need to synchronize the dirty
> > pages bitmaps. colo_incoming_start_dirty_log() could be modified in a
> > similar way.
> >
> > Cc: Stefano Stabellini <sstabellini@kernel.org>
> > Cc: Anthony Perard <anthony.perard@citrix.com>
> > Cc: Paul Durrant <paul@xen.org>
> > Cc: "Michael S. Tsirkin" <mst@redhat.com>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: David Hildenbrand <david@redhat.com>
> > Cc: Hyman Huang <yong.huang@smartx.com>
> > Signed-off-by: C=C3=A9dric Le Goater <clg@redhat.com>
>
> Just to mention that for the rest users (dirtylimit/dirtyrate/colo) the
> code still just keeps going even if start logging failed even after this
> series applied as a whole.  Migration framework handles the failure
> gracefully, not yet the rest.
>
> That might be an issue for some, e.g., ideally we should be able to fail =
a
> calc-dirty-rate request, but it's not supported so far.  Adding that coul=
d
> add quite some burden to this series, so maybe that's fine to be done
>
Indeed, for the GLOBAL_DIRTY_DIRTY_RATE and GLOBAL_DIRTY_LIMIT
dirty tracking, they should handle the failure path of logging start.
The work may be done once the current patchset is merged.


> later.  After all, having a VFIO device (that can fail a start_log()), pl=
us
> any of those features should be even rarer, I think?
>
> It seems at least memory_global_dirty_log_sync() can be called even witho=
ut
> start logging, so I expect nothing should crash immediately. I spot one i=
n
> colo_incoming_start_dirty_log() already of such use.  My wild guess is it
> relies on all log_sync*() hooks to cope with it, e.g. KVM ioctl() should
> fail with -ENENT on most archs I think when it sees dirty log not ever
> started.
>
> For those bits, I'll wait and see whether Yong or Hailiang (cced) has any
> comments. From generic migration/memory side, nothing I see wrong:
>
> Acked-by: Peter Xu <peterx@redhat.com>
>
> Thanks,
>
> --
> Peter Xu
>
>

--=20
Best regards

--00000000000097d4950614361ece
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:&quot;comic sans ms&quot;,sans-serif"><br></div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 20, 20=
24 at 11:19=E2=80=AFPM Peter Xu &lt;<a href=3D"mailto:peterx@redhat.com">pe=
terx@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:so=
lid;border-left-color:rgb(204,204,204);padding-left:1ex">On Wed, Mar 20, 20=
24 at 07:49:07AM +0100, C=C3=A9dric Le Goater wrote:<br>
&gt; Now that the log_global*() handlers take an Error** parameter and<br>
&gt; return a bool, do the same for memory_global_dirty_log_start() and<br>
&gt; memory_global_dirty_log_stop(). The error is reported in the callers<b=
r>
&gt; for now and it will be propagated in the call stack in the next<br>
&gt; changes.<br>
&gt; <br>
&gt; To be noted a functional change in ram_init_bitmaps(), if the dirty<br=
>
&gt; pages logger fails to start, there is no need to synchronize the dirty=
<br>
&gt; pages bitmaps. colo_incoming_start_dirty_log() could be modified in a<=
br>
&gt; similar way.<br>
&gt; <br>
&gt; Cc: Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org" t=
arget=3D"_blank">sstabellini@kernel.org</a>&gt;<br>
&gt; Cc: Anthony Perard &lt;<a href=3D"mailto:anthony.perard@citrix.com" ta=
rget=3D"_blank">anthony.perard@citrix.com</a>&gt;<br>
&gt; Cc: Paul Durrant &lt;<a href=3D"mailto:paul@xen.org" target=3D"_blank"=
>paul@xen.org</a>&gt;<br>
&gt; Cc: &quot;Michael S. Tsirkin&quot; &lt;<a href=3D"mailto:mst@redhat.co=
m" target=3D"_blank">mst@redhat.com</a>&gt;<br>
&gt; Cc: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D=
"_blank">pbonzini@redhat.com</a>&gt;<br>
&gt; Cc: David Hildenbrand &lt;<a href=3D"mailto:david@redhat.com" target=
=3D"_blank">david@redhat.com</a>&gt;<br>
&gt; Cc: Hyman Huang &lt;<a href=3D"mailto:yong.huang@smartx.com" target=3D=
"_blank">yong.huang@smartx.com</a>&gt;<br>
&gt; Signed-off-by: C=C3=A9dric Le Goater &lt;<a href=3D"mailto:clg@redhat.=
com" target=3D"_blank">clg@redhat.com</a>&gt;<br>
<br>
Just to mention that for the rest users (dirtylimit/dirtyrate/colo) the<br>
code still just keeps going even if start logging failed even after this<br=
>
series applied as a whole.=C2=A0 Migration framework handles the failure<br=
>
gracefully, not yet the rest.<br>
<br>
That might be an issue for some, e.g., ideally we should be able to fail a<=
br>
calc-dirty-rate request, but it&#39;s not supported so far.=C2=A0 Adding th=
at could<br>
add quite some burden to this series, so maybe that&#39;s fine to be done<b=
r></blockquote><div><div class=3D"gmail_default"><font face=3D"comic sans m=
s, sans-serif"></font></div><div class=3D"gmail_default"><font face=3D"comi=
c sans ms, sans-serif">Indeed, for the=C2=A0GLOBAL_DIRTY_DIRTY_RATE and=C2=
=A0GLOBAL_DIRTY_LIMIT</font></div><div class=3D"gmail_default"><span style=
=3D"font-family:&quot;comic sans ms&quot;,sans-serif">dirty tracking, they =
should handle the failure path of logging start.</span></div></div><div cla=
ss=3D"gmail_default"><span style=3D"font-family:&quot;comic sans ms&quot;,s=
ans-serif">The work may be done once the current patchset is merged.=C2=A0<=
/span></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-=
left-color:rgb(204,204,204);padding-left:1ex">
later.=C2=A0 After all, having a VFIO device (that can fail a start_log()),=
 plus<br>
any of those features should be even rarer, I think?<br>
<br>
It seems at least memory_global_dirty_log_sync() can be called even without=
<br>
start logging, so I expect nothing should crash immediately. I spot one in<=
br>
colo_incoming_start_dirty_log() already of such use.=C2=A0 My wild guess is=
 it<br>
relies on all log_sync*() hooks to cope with it, e.g. KVM ioctl() should<br=
>
fail with -ENENT on most archs I think when it sees dirty log not ever<br>
started.<br>
<br>
For those bits, I&#39;ll wait and see whether Yong or Hailiang (cced) has a=
ny<br>
comments. From generic migration/memory side, nothing I see wrong:<br>
<br>
Acked-by: Peter Xu &lt;<a href=3D"mailto:peterx@redhat.com" target=3D"_blan=
k">peterx@redhat.com</a>&gt;<br>
<br>
Thanks,<br>
<br>
-- <br>
Peter Xu<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"comic sans ms, sans-serif">Best regards</font>=
</div></div></div>

--00000000000097d4950614361ece--

