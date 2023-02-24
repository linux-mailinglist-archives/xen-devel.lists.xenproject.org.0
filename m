Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C4C6A1805
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 09:33:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500822.772335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVTWK-00070I-JP; Fri, 24 Feb 2023 08:33:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500822.772335; Fri, 24 Feb 2023 08:33:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVTWK-0006xg-GG; Fri, 24 Feb 2023 08:33:36 +0000
Received: by outflank-mailman (input) for mailman id 500822;
 Fri, 24 Feb 2023 08:33:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zq+K=6U=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pVTWJ-0006xa-No
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 08:33:35 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed4ed1cc-b41d-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 09:33:34 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id k37so7885083wms.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 00:33:34 -0800 (PST)
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
X-Inumbo-ID: ed4ed1cc-b41d-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nSl49mGmY1oiY0wg10A18ErwtxEKFR/x9DxEhoa4krA=;
        b=MLrMk44cxGG0CDuJp6lYh6pgUilu1KF7mlqE+ThhCun9vH/OTaGe7CBhcrtyxf5lDV
         D5Yl/X2y53Sqw0XIFj88nAAHXRedDjdG56Z1PbwbjGKJj+9pNBfDAWTCJ3n0jpZo3HNv
         Cy2QKkuu/ZjBhD1jVjGY8X0yrAcN3L9t3SQ8Fjngi3OUUYqvnMUndGmeQx8gLn04B/Rn
         7095xErUXZPK7hgGpOWKn4V00LfWW/jDdV8MLHysMenZHAm+hKVx1PCnX9hJAIrpSixj
         OPNNkP8CeSvs7JzZtW+hLcPCn9+MYcIQuCcga8dSLeYBdv2/QPl+3U1qFWgcaEuredI6
         RKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nSl49mGmY1oiY0wg10A18ErwtxEKFR/x9DxEhoa4krA=;
        b=JpV8hF/PnfKeHdfmBhc79vI1yfrJoLmRZPtx1vcB3zLr4iHTSXcXO1dR2X9LjN8vD7
         PZlQbs0KoxcWflZ9+w6GPh7SkDbXHRhhdWv0nQiSGmFpxDaFNCeV6xYZSSRDFPNSgBC3
         D9elEXJdU03EetAlkqiyk5pHXqoxUvh8krWWkiFMmmdlS37i4Ye9HPykSfcB7vA+ZPyB
         9xczQ4FkBtwDcZh3V8+0v1TLcN96/UERzPqqS5MDAVkV1YxWteZYKmE6LE7RqTrIx1XQ
         IR7m1jln/IhQULPw4AyjQmwfDH4BHgCmFC/55fDONOmcbm6yWx4x1eekDZZdxCUI0v3Y
         RRXA==
X-Gm-Message-State: AO0yUKU9eJZO2OFe6nKpyJ1/34g9yC1/zYDM40cH0oBOCeZNTIOytjhG
	T9izb1dQ3whj96CrlltBrkF4WlkNuiItWLE/MgD+gg==
X-Google-Smtp-Source: AK7set8AwgGZg5wrL8IOG3OSGFa1537q0qRRkXxJiVv/Zg4s2YTDjOXi1uIodb1q88gUQwVxtZ9KkIE97Fap5EKgM3c=
X-Received: by 2002:a05:600c:3b03:b0:3df:97b0:bab8 with SMTP id
 m3-20020a05600c3b0300b003df97b0bab8mr1061074wms.4.1677227614292; Fri, 24 Feb
 2023 00:33:34 -0800 (PST)
MIME-Version: 1.0
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <ede0da127fe74526e6b401e6b44d1407fe28cb70.1677079672.git.jens.wiklander@linaro.org>
 <Y/eZMEOjWXwYJJND@perard.citrite.net>
In-Reply-To: <Y/eZMEOjWXwYJJND@perard.citrite.net>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 24 Feb 2023 09:33:23 +0100
Message-ID: <CAHUa44HdD6kuRZ14uPCHq-5-eTZvnhn+SEMD4iELQRgBUQkQWw@mail.gmail.com>
Subject: Re: [XEN PATCH v7 03/20] tools: add Arm FF-A mediator
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Bertrand.Marquis@arm.com, 
	Marc Bonnici <marc.bonnici@arm.com>, Achin Gupta <achin.gupta@arm.com>, Wei Liu <wl@xen.org>, 
	Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 23, 2023 at 5:50 PM Anthony PERARD
<anthony.perard@citrix.com> wrote:
>
> On Wed, Feb 22, 2023 at 04:33:00PM +0100, Jens Wiklander wrote:
> > diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> > index 0cfad8508dbd..64fb570bc19a 100644
> > --- a/tools/libs/light/libxl_types.idl
> > +++ b/tools/libs/light/libxl_types.idl
> > @@ -494,7 +494,8 @@ libxl_gic_version = Enumeration("gic_version", [
> >
> >  libxl_tee_type = Enumeration("tee_type", [
> >      (0, "none"),
> > -    (1, "optee")
> > +    (1, "optee"),
> > +    (2, "ffa")
>
> Could you add a comma at the end of this line? This will avoid the need
> to change two lines the next time we are adding a tee_type (like you
> have to do now).
>
> Also, as you are changing libxl's API, could you add a LIBXL_HAVE_*
> macro in libxl.h? Something like:
>     /*
>      * arch_arm.tee field in libxl_domain_build_info has ffa value.
>      */
>     #define LIBXL_HAVE_BUILDINFO_ARCH_ARM_TEE_FFA 1

OK, I'll fix that.

Thanks,
Jens

>
> Thanks,
>
> --
> Anthony PERARD

