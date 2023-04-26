Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A566EF562
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 15:19:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526700.818587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prf2c-00031Y-U4; Wed, 26 Apr 2023 13:18:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526700.818587; Wed, 26 Apr 2023 13:18:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prf2c-0002yt-R0; Wed, 26 Apr 2023 13:18:38 +0000
Received: by outflank-mailman (input) for mailman id 526700;
 Wed, 26 Apr 2023 13:18:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+pP=AR=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1prf2b-0002yX-CB
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 13:18:37 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9da07c5-e434-11ed-b224-6b7b168915f2;
 Wed, 26 Apr 2023 15:18:36 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5067736607fso12339116a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Apr 2023 06:18:36 -0700 (PDT)
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
X-Inumbo-ID: d9da07c5-e434-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682515116; x=1685107116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ltWBGgzcaAeAi6ZraUXkneLShSmABFkQKDgE0zSXC6E=;
        b=clZ8lXI4mHvxbh7aetR3IpbtjD54eZYHy3c/LDx/KG/g5vdmlLqjYNHM+7K5XOZJfN
         5BSRfjWMYdV+qG2qqiycdfhLe5yy74BIp9eZeY1QJ6T8n4LX0meM+RmMRBTDwwminlDp
         orSP19114X18cyfwrRRWgXlZcL2mAjNooL8WPDK4cWI+fPsaV1x7L5P8ptEJ3tAc43er
         tVAu1aRFKl+SSwoyX4+/rpIeyQk+Lt0fSiue8Vs/J5UG8txdOO3NMyOxAqjKzUTS91WP
         /FWiS9o/2CcDptGW34N7mXu6bPso48kzL8LBrQhgY2IUAOLHnikC97Xk9IGiOW8d5RbM
         HyxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682515116; x=1685107116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ltWBGgzcaAeAi6ZraUXkneLShSmABFkQKDgE0zSXC6E=;
        b=PjMXnbsMtVXNMsrNkWGWaSAgsjEbse4V3w8ddDnyKZ79gzZnXbHRY0R+ziIh30wkAX
         I9bhtJqU3J2zDW/99L98iWdp1JX2R+BQYj0wLSmBAUq+8Zkp+udaPkyT9/hEybepNd2c
         zBntcO7MnG384cc0Txtfw8qhcflenLGd3jKV3+QozEBQSXQkxAzQ9sWqLjrNrDRelbaB
         71IZSg0D8P60MrMLt7QaVSwj9s3z7Cg87LHCjcv3ItaePgGcmhhKXSnacB9tMMngqea2
         jaOaWDjs1kRbUcEtRz7eZtdxFxiyXZstxYXzrMcY2qGFl2a5G+zun26P1+llGlVedSqw
         teFA==
X-Gm-Message-State: AAQBX9dq2irmfU/ZqgeAnZru1Q8XtuoBQGjFAYJH74l/dN884QxHQTSA
	lOZFrvgYcnYTDpSM65dgX4tdruCqgpv+wUC9Zr8=
X-Google-Smtp-Source: AKy350aBVj63qmhSE1Wj+S3BPAHWgkYLiYZoqlv4elusUOeM36jjC1N9EFzGPt7CAuPOA4wJH4LSlAoQih52v/wuyzs=
X-Received: by 2002:a05:6402:158:b0:4fe:9689:96bb with SMTP id
 s24-20020a056402015800b004fe968996bbmr21081563edu.35.1682515115728; Wed, 26
 Apr 2023 06:18:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230425194622.114869-1-jandryuk@gmail.com> <20230425194622.114869-2-jandryuk@gmail.com>
 <1085873c-13dd-aae4-55f2-9d69635b37be@suse.com>
In-Reply-To: <1085873c-13dd-aae4-55f2-9d69635b37be@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 26 Apr 2023 09:18:23 -0400
Message-ID: <CAKf6xpvu68FJKAkoeXOQUFA8XCxGxBHT56-MWxUTz-R8nYAUrQ@mail.gmail.com>
Subject: Re: [PATCH] libxl: device_backend_callback() print rc on error
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 26, 2023 at 4:39=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 25.04.2023 21:46, Jason Andryuk wrote:
> > Print the rc when an error is found in device_backend_callback() so the
> > user can have some idea of why things went wrong.
> >
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> > ---
> >  tools/libs/light/libxl_device.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
>
> While patches which are part of a series should be sent as replies to the
> cover letter, may I ask that you do not send individual patches as replie=
s
> to other (unrelated) patches (or, in general, really as replies to anythi=
ng,
> i.e. also not as replies to e.g. an earlier discussion)?

Certainly.  Sorry about that.  I formatted the patches individually,
but sent them with a single git send-email command.  Looks like I
should have added --no-thread to have them sent individually.

Regards,
Jason

