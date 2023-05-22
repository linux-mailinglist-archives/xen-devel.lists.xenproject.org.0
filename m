Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B691770C15F
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 16:44:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538000.837709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q16l2-00035J-37; Mon, 22 May 2023 14:43:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538000.837709; Mon, 22 May 2023 14:43:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q16l2-00032o-0D; Mon, 22 May 2023 14:43:32 +0000
Received: by outflank-mailman (input) for mailman id 538000;
 Mon, 22 May 2023 14:43:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yzf4=BL=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1q16l0-00032f-Ea
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 14:43:30 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 040c9f5f-f8af-11ed-b22d-6b7b168915f2;
 Mon, 22 May 2023 16:43:29 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-96652cb7673so975759866b.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 May 2023 07:43:29 -0700 (PDT)
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
X-Inumbo-ID: 040c9f5f-f8af-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684766608; x=1687358608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pC21Wt79F0ocPDNkemtlfkU3jZZKz4hZTtPDV2VYO3c=;
        b=DQalti/cz4Z23gv4roSvFIVC9PPLMBk2SJPEM9VksL+7ZRyclHv+epcDNfZXqtCD04
         WCVnuPv2i/2uBgGvI/mMw8lSj+mQtwH5z3B13K7VGGQc2Jpt1vdBsiQEFb6ZlILO0eIf
         aXz9PlFy55KzLdrNH9iyebCX8DVK/1mcwnwlYW/62rgsVVx1efNRLGBsoYz4Ol49nmYu
         5yuyS0RCIsZhljMd25N380+CKKarR2PoimHQO5YRTNjT3jvtZyA/gOBrVwFqmP1tX4ju
         fE7VjgqvoAxFZp7W4AM39O19VNDWHoBYjUKA6Qmpajw+avhIzE85vFKYZd93wpVVSPv1
         nWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684766608; x=1687358608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pC21Wt79F0ocPDNkemtlfkU3jZZKz4hZTtPDV2VYO3c=;
        b=hhUaTYG8lFmzQAegtOcX7ZqIX4I6xGCOqc3msXTzjgRFYerNlO7CZn3eYaDxjD90Q7
         N9YVTndPfs+xIre1iwTZbCxEsfZcemtMLGdmR7sNKMd3HUKfgaVgy6Q6sj+7saqrmAgj
         YGJqv17/7N9ph3DWZHxYI2lgEGMb6zNWnECZ0OT+GCioBCxIWUK1153HGZ0K8uzJLSBx
         YF/u2n3Cgx7b/sVYGRLYKyZPXHt3zKmyPoHKf1S4o26pbhRIWpwWH4AkPwK3ArqWPx9r
         Q8fFXIb46NpdVIOiFKKRjY2S9PXQcWy0B2Ltyi7+of1Ng3u5Wwh8f2yoLQ4VZU6cWni6
         Wf9Q==
X-Gm-Message-State: AC+VfDyIXP0iRw7quSbFEkMaL+j8GSmuKfkbCwb7at0SgoBb5nqCcpUU
	CxyA4ARqIIxV9sEz0DCdOUFoq7lHNmpvm92ahcM=
X-Google-Smtp-Source: ACHHUZ78FtPyo6gMtcvvdGIMLHmE24bokwLE8lG9CMeQSCb9560NBylM0oGgwx2jCoG/ilHOICyZ6ZPi0ozP2dgjCI4=
X-Received: by 2002:a17:907:74d:b0:94f:7edf:8fa1 with SMTP id
 xc13-20020a170907074d00b0094f7edf8fa1mr10151530ejb.32.1684766608315; Mon, 22
 May 2023 07:43:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230501193034.88575-1-jandryuk@gmail.com> <20230501193034.88575-11-jandryuk@gmail.com>
 <1166bdf1-4d54-30bb-bdf9-65dfaeb6b29e@suse.com> <CAKf6xpti23_fmwVWOafjUU+OPHPOA7EWOfkShGT9Qqr9=mR9zQ@mail.gmail.com>
 <602ff9ef-e573-279e-441f-463ca7613fa6@suse.com>
In-Reply-To: <602ff9ef-e573-279e-441f-463ca7613fa6@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 22 May 2023 10:43:16 -0400
Message-ID: <CAKf6xptFN4s4yazcmmgqMWqNqmyYQjE+PaV6f=NdjR5g=NUx_g@mail.gmail.com>
Subject: Re: [PATCH v3 10/14 RESEND] xen: Add SET_CPUFREQ_HWP xen_sysctl_pm_op
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 22, 2023 at 9:11=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 22.05.2023 14:45, Jason Andryuk wrote:
> > On Mon, May 8, 2023 at 7:27=E2=80=AFAM Jan Beulich <jbeulich@suse.com> =
wrote:
> >>
> >> On 01.05.2023 21:30, Jason Andryuk wrote:
> >>> +    if ( set_hwp->activity_window & ~XEN_SYSCTL_HWP_ACT_WINDOW_MASK =
)
> >>> +        return -EINVAL;
> >>
> >> Below you limit checks to when the respective control bit is set. I
> >> think you want the same here.
> >
> > Not sure if you mean feature_hwp_activity_window or the bit in
> > set_params as control bit.  But, yes, they can both use some
> > additional checking.  IIRC, I wanted to always check
> > ~XEN_SYSCTL_HWP_ACT_WINDOW_MASK, because bits should never be set
> > whether or not the activity window is supported by hardware.
>
> I took ...
>
> >>> +    if ( !feature_hwp_energy_perf &&
> >>> +         (set_hwp->set_params & XEN_SYSCTL_HWP_SET_ENERGY_PERF) &&
> >>> +         set_hwp->energy_perf > IA32_ENERGY_BIAS_MAX_POWERSAVE )
> >>> +        return -EINVAL;
> >>> +
> >>> +    if ( (set_hwp->set_params & XEN_SYSCTL_HWP_SET_DESIRED) &&
> >>> +         set_hwp->desired !=3D 0 &&
> >>> +         (set_hwp->desired < data->hw.lowest ||
> >>> +          set_hwp->desired > data->hw.highest) )
> >>> +        return -EINVAL;
>
> ... e.g. this for comparison, where you apply the range check only when
> the XEN_SYSCTL_HWP_* bit is set. I think you want to be consistent in
> such checking: Either you always allow the caller to not care about
> fields that aren't going to be consumed when their controlling bit is
> off, or you always check validity. Both approaches have their pros and
> cons, I think.

Ok, good point.  I wrote it inconsistently because the SDM states the
desired limit: "When set to a non-zero value (between the range of
Lowest_Performance and Highest_Performance of IA32_HWP_CAPABILITIES)
conveys an explicit performance request hint to the hardware;
effectively disabling HW Autonomous selection."  And I was trying to
follow that.  But later "The HWP hardware clips and resolves the field
values as necessary to the valid range." seems to override that.  I'll
test to verify that it is correct, and drop the lowest/highest
checking if so.

Thanks,
Jason

