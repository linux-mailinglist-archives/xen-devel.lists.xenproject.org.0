Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8199A876EF4
	for <lists+xen-devel@lfdr.de>; Sat,  9 Mar 2024 04:30:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690486.1076524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rinOq-0007fs-1h; Sat, 09 Mar 2024 03:29:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690486.1076524; Sat, 09 Mar 2024 03:29:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rinOp-0007eK-Ut; Sat, 09 Mar 2024 03:29:27 +0000
Received: by outflank-mailman (input) for mailman id 690486;
 Sat, 09 Mar 2024 03:29:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n0of=KP=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rinOo-0007eC-7p
 for xen-devel@lists.xenproject.org; Sat, 09 Mar 2024 03:29:26 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39e50be4-ddc5-11ee-afdb-a90da7624cb6;
 Sat, 09 Mar 2024 04:29:24 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5649c25369aso1865952a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 08 Mar 2024 19:29:24 -0800 (PST)
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
X-Inumbo-ID: 39e50be4-ddc5-11ee-afdb-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709954964; x=1710559764; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Va8ogusGZwdaKepctfLfXDDaga65WunO9ZGuU+9NtAE=;
        b=EZKiUTl2J+0oGvw1zXfb9yfyk/GpxOWWs3ds49qdc2Y+dn7HSmS9qsf+AYQAOuTrHg
         P9Wga+2MFxYhlCTgy37Qmv6o3kl0odkvmmu5t9nmX2s1EvsMfmJJfUTfkgGPMKE/G0k+
         w68U+QsoEnaHyeVyyElVLSnn6h2g3UpChKnBulz9hmGGViWG8PAREaQVke9NAq/mqP2D
         0lxp04b/ktEUf64jnL0K4HDGIvraceiwOVdK2ebxCcn/llJejbJ7jxPD3QX4DGPY14KS
         MjlHGJ+olCbZE8Tu5q42aevziTOrjVqO5CL9hCvX/Yg1nBRbLugjrtOknoyfKugQ/Z0e
         nr/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709954964; x=1710559764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Va8ogusGZwdaKepctfLfXDDaga65WunO9ZGuU+9NtAE=;
        b=Cx7NiieX7aFxqUYa23usHUR7Uu6y+Y1YSECpfi9YfAkUg+C2iSpS3xae81vzVL6SBP
         LgMM09wZvd2ExwZw38fAGuIfhDQVtp7R1sWKC0r6A++dHNAYEmQbi9NI6fN/OWwS/8Yd
         8DXQ1A199NxQs2hqR04Vj7wLqtKrWN5NO6DA0n9GQH60un2hGc1Caf9k5YuxygGd47gp
         YMivWtQyfGQ/KR84WvWWij3uJlXrTWOIlQIP7BQJ0bCFBZatA3KH3kq6ZlH9aahmEXq7
         VF55tDuG073rB5AeOHefaUk5bn/75uHomb3C7q60VDJBi1ICEu/Y/6XTXasQkkIN7fLV
         3I/A==
X-Forwarded-Encrypted: i=1; AJvYcCW29+wjabla2YOuGLKSDU5Vcot7Pa0oXPn9CVyN+qT8o1hJKOQy31WATVIHzdpcy6bxPCr8oqwRsdmXBZV0bFyfTwHedkfuK8q9dZKpX0I=
X-Gm-Message-State: AOJu0Yz3T02ZbmGfFAjXpq1h3ODHQcLKXHz7NzRDgIBYCK6lIY3XaAu9
	SqBH9XcLpBh70GSf1Or+UyUlPcXgx2SkdJPMi9YgcMhiS7wDk5LZULUERWCEvmaTTAfckCeY4iy
	vvP5qNOl9a6MCoSAvBGzdONrznBY=
X-Google-Smtp-Source: AGHT+IGAGGrOzMwhBAKfnLe170l7WdnKP+Is5I9SeSwO++dhjS2Gz++v7KuOxzYPkHCn5T2VAxp61pjrLtMX0iV+cac=
X-Received: by 2002:a50:d6d7:0:b0:568:1f9f:eca4 with SMTP id
 l23-20020a50d6d7000000b005681f9feca4mr553180edj.42.1709954963873; Fri, 08 Mar
 2024 19:29:23 -0800 (PST)
MIME-Version: 1.0
References: <20240305191312.321127-1-marmarek@invisiblethingslab.com>
In-Reply-To: <20240305191312.321127-1-marmarek@invisiblethingslab.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 8 Mar 2024 22:29:12 -0500
Message-ID: <CAKf6xpte=2ugj187gw1cxY361XGgM2As67PgAQEEheVYbG2n5g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hw/xen: detect when running inside stubdomain
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 5, 2024 at 2:13=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> Introduce global xen_is_stubdomain variable when qemu is running inside
> a stubdomain instead of dom0. This will be relevant for subsequent
> patches, as few things like accessing PCI config space need to be done
> differently.
>
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

