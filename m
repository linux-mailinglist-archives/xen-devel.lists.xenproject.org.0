Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B257F183A
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 17:12:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637088.992802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r56sp-0001f9-Im; Mon, 20 Nov 2023 16:12:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637088.992802; Mon, 20 Nov 2023 16:12:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r56sp-0001cX-Fz; Mon, 20 Nov 2023 16:12:23 +0000
Received: by outflank-mailman (input) for mailman id 637088;
 Mon, 20 Nov 2023 16:12:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KKU3=HB=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1r56so-0001cR-Cm
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 16:12:22 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94e9459f-87bf-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 17:12:20 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5094727fa67so6310689e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Nov 2023 08:12:20 -0800 (PST)
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
X-Inumbo-ID: 94e9459f-87bf-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700496740; x=1701101540; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lzNv8UwcYyilet5rI/wD95vpeCkUNcHzAF1dSv4CkQk=;
        b=VQ6O9iyF5ap5FOUjFohKBgdB7X68KvW87gNXb9+zbGlL/YbyruSyIdncRsUckmoa3x
         cBZRK4MCOafdYA7wP9FetXC+t8A01ZdxdKd9C9Elqez/XQwGCb0o5oF8SnnimoYkJntf
         CjrrAHsFB9x7BGvsr+hHCZSyBIUsXG2NK6yKIK28Z5NLRJmtx1n8LtdtT/j7Vsk52pbE
         B3WD762xi3GVd09BN+1Np+K5iNW206/mpz1sei0NTweRwidbwOX10qKY2shMt+wHAf5P
         CVfyaNZyt+qoMNxKcN3BfllRWag1ppymb1DETAV0KZD8dlYuM5RgqXAgjcOLjmTGNAUU
         A/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700496740; x=1701101540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lzNv8UwcYyilet5rI/wD95vpeCkUNcHzAF1dSv4CkQk=;
        b=dl5dcbCG3WLgGP27JMYwHRKw63hc+ervMeWWXh8d7htPzNuz4wF54aJibGexRk42a5
         X0fgGkw9xl2YTpzxaMgZZKRSW0/3Zc/IKfQaXDW1i7/O6CIGmQ6LN7XF8uF0IGWznms3
         ZN44aA2PDL4VRZ2sfoWYgUhuPztziJK+8QHRuq2di+DrmUUruP9D72lmLt6x0hD1ix4A
         otZ2FmbnA7Iy7BAjQsQhBklioR5m++A5h4UXLu8NKt+KVMY2aVAGj3QcDwFtNlSld7OW
         HIm0eZmwLe0KhYLxzuAvPD5C+R7uBG96FOQhiKgZOxh8cM23xoQH7Ipztznp0qayANlQ
         RuUA==
X-Gm-Message-State: AOJu0YyedP3Mqcaw5gYMMVugrF3Fmq7cMpRE/rp9yoP1nfphhUokOp4Q
	IMiZlx4et+xneILbVCXMtOZP/FuxAJarX5w27XI=
X-Google-Smtp-Source: AGHT+IFEfiuecU4ulT6L7vOvWDO3c576UjMyrQhtW4ZdcK7jG0JZFGFNzyH3NL136PeQCylRIWgmMRM+SLtHh4LKtNc=
X-Received: by 2002:ac2:5a44:0:b0:506:87a3:c27c with SMTP id
 r4-20020ac25a44000000b0050687a3c27cmr5627546lfn.53.1700496739413; Mon, 20 Nov
 2023 08:12:19 -0800 (PST)
MIME-Version: 1.0
References: <20231110160804.29021-1-jgross@suse.com> <20231110160804.29021-5-jgross@suse.com>
In-Reply-To: <20231110160804.29021-5-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 20 Nov 2023 11:12:07 -0500
Message-ID: <CAKf6xpuaXjZjZHFqxFKpQ9XnW0SJuGOhWRd+Rtt5Dcu--oCdjg@mail.gmail.com>
Subject: Re: [PATCH v2 04/29] tools/xenlogd: add transport layer
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 10, 2023 at 1:27=E2=80=AFPM Juergen Gross <jgross@suse.com> wro=
te:
>
> Add the transport layer of 9pfs. This is basically the infrastructure
> to receive requests from the frontend and to send the related answers
> via the rings.
>
> In order to avoid unaligned accesses e.g. on Arm, add the definition of
> __packed to the common-macros.h header.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Thanks,
Jason

