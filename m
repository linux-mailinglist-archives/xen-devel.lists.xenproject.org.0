Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD4BBD8368
	for <lists+xen-devel@lfdr.de>; Tue, 14 Oct 2025 10:37:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142568.1476681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8aX1-0006wF-DY; Tue, 14 Oct 2025 08:37:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142568.1476681; Tue, 14 Oct 2025 08:37:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8aX1-0006tj-AI; Tue, 14 Oct 2025 08:37:19 +0000
Received: by outflank-mailman (input) for mailman id 1142568;
 Tue, 14 Oct 2025 08:37:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+O4t=4X=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1v8aWz-0006td-T7
 for xen-devel@lists.xenproject.org; Tue, 14 Oct 2025 08:37:17 +0000
Received: from mail-yx1-xb129.google.com (mail-yx1-xb129.google.com
 [2607:f8b0:4864:20::b129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5d336f2-a8d8-11f0-980a-7dc792cee155;
 Tue, 14 Oct 2025 10:37:04 +0200 (CEST)
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-633bca5451cso5035602d50.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 Oct 2025 01:37:04 -0700 (PDT)
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
X-Inumbo-ID: f5d336f2-a8d8-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760431023; x=1761035823; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G2wXHawLphgjXMKUIBlNV42EVOVQetLfGGTkt4o3IG0=;
        b=E3zBq3rOsfKz+A+AL2rBNpb6yMT/VP4hzSH7gyFsTV/RldnQp7KXBxgeRm20KK93oG
         c+1m2B3qndBE0FWcnR2n1RuFy/liGsbxVuJtNxxsCvFSjRhT4pd9zN50bS7smB3HyOwA
         L+SVpKhp1rNZNQXZRlpxh8lga8/xo88GkFnuIkIy7Jg7GvWDi1uxwG0i5qYmgiTiuwTR
         W81PCOK+Gi5azR6IfxeeZ+QSr2UfTys6JFJC5tpRQEI7ajybOYHyRwBKkv69QXYsEr0U
         6AEY8AWMmvxC5GCUUubVchBHJDTlQHExsP1nszJh/9v0VaBgoe4CJ9xTcmKTodSGPVTV
         lNSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760431023; x=1761035823;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G2wXHawLphgjXMKUIBlNV42EVOVQetLfGGTkt4o3IG0=;
        b=dMc8Z2D9FUuJ9qKInVtdLIbbRogv07igWC3ThJv1g5PVGlUkCmDKIeqPl9tAMjcm/U
         p+nvP6XJr0Z/OBMDwU1vQJRZtul5wmI+HyLOWqC/rCdZMfCWisRSKJY55VRIG0Z00gEv
         LoC0At2QMF9qoXrNeFdzAQ04sSRYUs7TiZiTrpms0NUPBw6mahbwfdfEadxw4wovAmYE
         3bATyUqsZCOtWWSOARWIqklMwY6dADzJks1whCyEvtWyMm/RYAn8pRcV9oAVmL0aRM2/
         /DBInfMPGzwnRcrsbTbLlkosE0cZRAyM5+2Ka0iweLHXWrHPGUXLDWKtAJkNgugi7YEP
         0JmA==
X-Forwarded-Encrypted: i=1; AJvYcCVSSKclFThMmXUW3sd+WXRA+reQ5PJu2+o5TN2iR5Morx+gb43BF0Y0jT+J+DRihXzC3lkkLNSuJME=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJQXs+Z89ZTaLTlREnETFvmwn9S/xEgRVhIbQkT8naQSkZIdD8
	qQMrzOeQ7I0VDCAZ2tTpS6MfPG/DaRESaFAONGA1W/l+NUqYdm8hzsDJCuNpuU5663Cdb9hGR8Q
	s6eR+nixi4Sya+lCeYcpdiR/XhpD57zuHE6w425NKww==
X-Gm-Gg: ASbGncsqi2N+N3BLDp/Qn3y3fMdn+xL88kVB8dMra6NW7LUK9N0pFpHTGn0/pO01xpB
	mI3utaWukXq/bqONKlrRDyWu1zake16+F1GgxYNRP/ZU1TYX2S65sDf5ZhsAqSsxHw5CgfJ1UXD
	wp/22uelGPxjCZ2UJ6svmBNDj5qqjxMHZzhUGR1MtjbMVD+dGod39ttMucNGew0nqJVjQwqCYYJ
	jEGp/+ahPfm7TvoW2qDrZt4SCQEZoE=
X-Google-Smtp-Source: AGHT+IECuBWW7Mr3bdnefo9hCmYHcFbwqlQRLyVDhb767ve9pQExfrgwAwUBBTHQcYKoTbM+UVDSaLdeF/fMGFZKDEA=
X-Received: by 2002:a53:ea51:0:b0:63c:da95:21c7 with SMTP id
 956f58d0204a3-63cda9524edmr14064490d50.48.1760431023344; Tue, 14 Oct 2025
 01:37:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250729111226.3627499-1-armbru@redhat.com>
In-Reply-To: <20250729111226.3627499-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Oct 2025 09:36:51 +0100
X-Gm-Features: AS18NWDdnneHmaeFVDUQFGdg-xa0DZiF63LABZFsNDGIwihe3MoHxpb_nMM5usM
Message-ID: <CAFEAcA-UrCD7mrmX_4dCK0urMmY5+qs=Y268WerQVq1c+7nB=Q@mail.gmail.com>
Subject: Re: [PATCH] hw/display/xenfb: Replace unreachable code by abort()
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org, 
	paul@xen.org, edgar.iglesias@gmail.com, xen-devel@lists.xenproject.org, 
	qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Jul 2025 at 12:14, Markus Armbruster <armbru@redhat.com> wrote:
>
> xenfb_mouse_event() has a switch statement whose controlling
> expression move->axis is an enum InputAxis.  The enum values are
> INPUT_AXIS_X and INPUT_AXIS_Y, encoded as 0 and 1.  The switch has a
> case for both axes.  In addition, it has an unreachable default label.
> This convinces Coverity that move->axis can be greater than 1.  It
> duly reports a buffer overrun when it is used to subscript an array
> with two elements.

I think also that Coverity gets confused by QAPI's convention
in generated code of defining enumerations like this:

typedef enum InputAxis {
    INPUT_AXIS_X,
    INPUT_AXIS_Y,
    INPUT_AXIS__MAX,
} InputAxis;

Coverity thinks that INPUT_AXIS__MAX might be a valid
value it can see in move->axis, because we defined the
enum that way.

In theory I suppose that since the __MAX value is only
there to be an array or enumeration bound that we could
emit code that #defines it rather than making it part
of the enum.

thanks
-- PMM

