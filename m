Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D542084FB57
	for <lists+xen-devel@lfdr.de>; Fri,  9 Feb 2024 18:58:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678775.1056277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYV8L-0004zm-Eq; Fri, 09 Feb 2024 17:57:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678775.1056277; Fri, 09 Feb 2024 17:57:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYV8L-0004xL-Br; Fri, 09 Feb 2024 17:57:53 +0000
Received: by outflank-mailman (input) for mailman id 678775;
 Fri, 09 Feb 2024 17:57:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qnec=JS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rYV8K-0004vz-Ne
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2024 17:57:52 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd9c17e8-c774-11ee-98f5-efadbce2ee36;
 Fri, 09 Feb 2024 18:57:50 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a30e445602cso452899166b.0
 for <xen-devel@lists.xenproject.org>; Fri, 09 Feb 2024 09:57:50 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 qx10-20020a170906fcca00b00a384810f371sm963915ejb.190.2024.02.09.09.57.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 09:57:50 -0800 (PST)
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
X-Inumbo-ID: bd9c17e8-c774-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707501470; x=1708106270; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=X8dA/oVMrRThJ+rwgG6q9S6a3f0WD1rU2/Q4oEE47Ko=;
        b=cJctG8WZfuhgfGjG8obXjNsgDfAWF7eob8tEK1v6GTl5N9dHr+t4JtvEpkDRKhqEYv
         z6DnPOb4ay6j47WH41oRxCJcZHeQ5jYP04qjxpehP4wx+Ww0cYgb7lFFtgY8BATgGLZY
         EG4JYQRmY8OQxJ6GkTBvJF9qTfDWdLp+0VkmiEXNpzv/jcTUmGWXcfn/z75T12DPs1Ye
         ULiaqmdMoWmrQJGuDoTsCPvjkWubRnbleRaqOMG+V/Sh0Wm/pVj/dfb+p4UzAf5XRvhG
         N3i0lPNKcrOfSLalonEqkAAJc/Ee1vCH31aLsOiuMvoJ55nT9gXEVxzW5FHosymPYhhh
         30Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707501470; x=1708106270;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X8dA/oVMrRThJ+rwgG6q9S6a3f0WD1rU2/Q4oEE47Ko=;
        b=tK0apS8Uo1XQOnLTbMP9Bvzfvb2cUMGJi9Mi8WgD1NH1BHu5wBIaG9q7OU0PbCr574
         FvzeRrfL+Jq2sxmJFGhAY7nXqN9D2gU+OJeY2uSU3jv8yz+BseuST4xabHNcSS+F2HMV
         VqUdOUGGyKrILNvAGp30A81hX7mDG+fYfGVsLHInBJXu2iqMqu1QNaiVkAkdomZbib26
         tXuXGQuUB+hgrl+J4Noec7RVyFNSgR/n5zd3BrNGsRjonMdF7ToaJEOa936HxTTlQfqk
         edBCelnjB+yOy87jgkXxPCrnwTWX/zZng8ImHsnA0vnuX2itviL2T0tFg8x0mgwl3bnU
         apRA==
X-Forwarded-Encrypted: i=1; AJvYcCXMQfOjyybWtt68rWFY9mixUqbRk42RnB50fT0yjgq0MZI4Et2Vbw9yFC1JAXgpc1SH3Kxc2uPZLEgnzos+K4527+8bvELV4EB34b2aBo4=
X-Gm-Message-State: AOJu0YwUGiUrGzTybIHcT80hxN5Sy/GZccUq0DmCUtsR/eGw+xP06PkW
	jcHqr+cU5u4AFqbRN9/P7xAnspaPYw1TsP6IME9akToOGJNPkYLhf/ZCL4Yo
X-Google-Smtp-Source: AGHT+IH45wM1JKOEWOemDFLbi1dbLAoCuLTw92E5wJpGOoifnT/kiBRtA7ZmKMB4At6bKr2YfIivPQ==
X-Received: by 2002:a17:906:3589:b0:a3c:1111:4683 with SMTP id o9-20020a170906358900b00a3c11114683mr604238ejb.11.1707501470365;
        Fri, 09 Feb 2024 09:57:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW9PS5yNZlk5xlqoUR2iWdLtTds/Xvc+8UkF8ZwhLbR+NLy54yVGgMQD5zQyljpNowP7+ai7+vLyLe/C3u805CJZCGKrcdFmA1/Pgzu7nKJ3/zK9+ceJ5viYGdb3hoYeEr+eJONb0NIMyg5k4/02Qk0ewe9XWWiVGRH5K4KxHaW0944FzXUsA==
Message-ID: <b9e334235f4caf391521019b3e65c671246d1f12.camel@gmail.com>
Subject: Re: Xen 4.19 release status tracking list
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: committers@xenproject.org, community.manager@xenproject.org, Kelly Choi
	 <kelly.choi@cloud.com>
Date: Fri, 09 Feb 2024 18:57:49 +0100
In-Reply-To: <e18cf10d-0531-4b11-8ead-a65c853a7a90@xen.org>
References: 
	<CAMacjJzio2EDwudCUHoL6psKYztkHZOWwLNDknATvpN6Y0im=Q@mail.gmail.com>
	 <e18cf10d-0531-4b11-8ead-a65c853a7a90@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2024-02-08 at 16:58 +0000, Julien Grall wrote:
> Hi Oleksii,
Hi Julien,

>=20
> On 05/02/2024 19:23, Oleksii Kurochko wrote:
> > Hello everyone,
> >=20
> > I would like to share with you a list for status tracking based on
> > Xen ML:
> >=20
> > Arm:
> > =C2=A0=C2=A0 * [PATCH v5 00/13] Arm cache coloring [
> > https://lore.kernel.org/xen-devel/20240102095138.17933-1-carlo.nonato@m=
inervasys.tech/
> > ]
> > =C2=A0=C2=A0 * [PATCH v1 repost 0/4] xen/arm64: Rework the MMU-off code
> > (idmap)
> > so it is self-contained [
> > https://lore.kernel.org/xen-devel/20240116143709.86584-1-julien@xen.org=
/
> > ]
>=20
> This has been committed. You can mark it as resolved.
Great! Thanks for the update!

~ Oleksii

