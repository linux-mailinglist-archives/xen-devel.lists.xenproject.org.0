Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 940D6565A34
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 17:44:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.360446.589833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8OFQ-0007nF-PF; Mon, 04 Jul 2022 15:44:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 360446.589833; Mon, 04 Jul 2022 15:44:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8OFQ-0007lS-MW; Mon, 04 Jul 2022 15:44:28 +0000
Received: by outflank-mailman (input) for mailman id 360446;
 Mon, 04 Jul 2022 15:44:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sbiE=XJ=gmail.com=firemeteor.guo@srs-se1.protection.inumbo.net>)
 id 1o8OFP-0007lM-Nr
 for xen-devel@lists.xen.org; Mon, 04 Jul 2022 15:44:27 +0000
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f3ace72-fbb0-11ec-bd2d-47488cf2e6aa;
 Mon, 04 Jul 2022 17:44:26 +0200 (CEST)
Received: by mail-ed1-f44.google.com with SMTP id c13so12166350eds.10
 for <xen-devel@lists.xen.org>; Mon, 04 Jul 2022 08:44:26 -0700 (PDT)
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
X-Inumbo-ID: 2f3ace72-fbb0-11ec-bd2d-47488cf2e6aa
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JguyIQ9zQuw/qEKx9SRnZWuwO5GxzheQHwCkLi4bfew=;
        b=iNFPQks0C3KXzIF+A1QSItD5LWtyZ8AWyZ0I6Bly/2bbI44iTMeFHq++1s0ElZ9EPR
         /PJ7cj/X9gUHR+uNEhIo00zlwE8NhGHQfWG18GirSvDKt+gJEy3q9Gj+04hAgCjDzmy0
         ynP65E40bi6hqH/3Ko7ffhhY8RVUIeK6KpP5XR5UM3uadybB3i0JH6442w/CBcsldxlE
         6QmYpkicZ4t+RcjnqVHa8RyG3iMWGJBJJo5JU5KT+KpKGV1zPY+JJkzv1PfM3+y1Ykz/
         G7sxz7CcrJAavT5MgXolREdFPCoNvZ7TRPAqp5jGgxLMwncDssYZcDV+1INne3qm/KpM
         5jKQ==
X-Gm-Message-State: AJIora8Zfxk7E4ZAQhLQO3TJ7tYAsyavxz41CEOV3FlJwcI3TyCeWN10
	WOKnUAHtNHWVVoO1buwgbpMmHy1awxlC12pl7Pc=
X-Google-Smtp-Source: AGRyM1uE/zUUBHPhMjCCEVC/n+tYgyp89SIZiZYQ2PkYvg0ogJ1QN7WcoFSJuCIhGY58jn9BfOdMEOjZ4qzHehq4XgU=
X-Received: by 2002:a05:6402:1509:b0:435:6e97:2e51 with SMTP id
 f9-20020a056402150900b004356e972e51mr40120473edw.354.1656949466446; Mon, 04
 Jul 2022 08:44:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAKhsbWb4FyqWBraid=99mfr=_wbXQHfKq6jBszN9-WmV_OiBYw@mail.gmail.com>
 <YsK3/fDX8c0Tzfv0@MacBook-Air-de-Roger.local> <CAKhsbWakmx6Bw+fJZ49pbcmRx68WWuSCpYzJDg7uiYWuEnu0qg@mail.gmail.com>
 <YsLmlIrCBt/Ldg1G@MacBook-Air-de-Roger.local> <CAKhsbWZkbx8WrmuhAO3P_UxFihx_4UZHnUjrKZaFV1uwF6ifEg@mail.gmail.com>
 <YsMIO3E5/hzFgxSa@MacBook-Air-de-Roger.local>
In-Reply-To: <YsMIO3E5/hzFgxSa@MacBook-Air-de-Roger.local>
From: "G.R." <firemeteor@users.sourceforge.net>
Date: Mon, 4 Jul 2022 23:44:14 +0800
Message-ID: <CAKhsbWY2OwkGQQ-dqjOOr3Ed7dThdiFpAWbdUOnzbnOkYVqF4A@mail.gmail.com>
Subject: Re: PCI pass-through problem for SN570 NVME SSD
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 4, 2022 at 11:33 PM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=
 wrote:
>
> Right, so hvmloader attempts to place a BAR from 05:00.0 and a BAR
> from 00:17.0 into the same page, which is not that good behavior.  It
> might be sensible to attempt to share the page if both BARs belong to
> the same device, but not if they belong to different devices.
>
> I think the following patch:
>
> https://lore.kernel.org/xen-devel/20200117110811.43321-1-roger.pau@citrix=
.com/
>
> Might help with this.
>
> Thanks, Roger.
I suppose this patch has been released in a newer XEN version that I
can pick up if I decide to upgrade?
Which version would it be?

On the other hand, according to the other experiment I did, this may
not be the only issue related to this device.
Still not sure if the device or the SW stack is faulty this time...

Thanks,
G.R.

