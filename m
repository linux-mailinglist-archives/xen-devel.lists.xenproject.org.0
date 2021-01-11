Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D535C2F1CFB
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 18:49:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65162.115449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1JH-0004nJ-NU; Mon, 11 Jan 2021 17:48:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65162.115449; Mon, 11 Jan 2021 17:48:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1JH-0004mu-KS; Mon, 11 Jan 2021 17:48:55 +0000
Received: by outflank-mailman (input) for mailman id 65162;
 Mon, 11 Jan 2021 17:48:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Ybk=GO=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1kz1JG-0004mi-1G
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 17:48:54 +0000
Received: from mail-wm1-x332.google.com (unknown [2a00:1450:4864:20::332])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 42ec4682-66d9-49fa-89eb-a925c2e86c28;
 Mon, 11 Jan 2021 17:48:53 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id y23so60497wmi.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Jan 2021 09:48:53 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o3sm396503wrc.93.2021.01.11.09.48.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 09:48:51 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B2CE01FF7E;
 Mon, 11 Jan 2021 17:48:50 +0000 (GMT)
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
X-Inumbo-ID: 42ec4682-66d9-49fa-89eb-a925c2e86c28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version:content-transfer-encoding;
        bh=HjFjB02VUOcj2JDmR/K56mtMUPw1JqKruxO3gsfgtG0=;
        b=Z1BLHnk/IllfoIqIlxKJ0XD2wgjI2evX/5XsMH9aGtoY/foB5Zp0OZr8+O18Z54N3P
         vFsoIVlUr7x9Y30UZt1g+VOvY8vJ0NhhFFf2vN/wzVP3Kpz1pVqYsTLQ3muqdwj0v8Y5
         F9VbBO51j75TEHi3Hsgg7/C+0sYNIOp0sLXBtkDC9Q/35JGz6cyiqvyi3+ptkFR33Rvf
         3RBT2H7VMu8ETRySwN8DK70ixgS2jWeoVWpQS1Wylo7thAyY7nH2Kq28D8Zatl3+Bobs
         TdnNFPVrst4l7kXfPxCLsQ62wZ5e8A8OpP+u3d7lU4jKfBn2zsMJ+iKqTpkuPX5Vqm2S
         db4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version:content-transfer-encoding;
        bh=HjFjB02VUOcj2JDmR/K56mtMUPw1JqKruxO3gsfgtG0=;
        b=Fqotfy5BMYiV0pPWCdlgD028TFwzAz85UcD5a9i7164fEBJ4/6WOcOIPxEr5vKt6y2
         kG+/8N7rEuyF3hZtFEKoAAvTC8eMDre73xmmuuQzyZJkhi0mikpkiBHSYfxLqaeWFQHe
         JbkJ2aA4PwW3Fq7nUayP55f7rgtnqAdsRPRR+TGgrsDZOh94Cp178M/wCYoqzUgmjGeX
         25iSUOQsLOESIo3F1tAxGSaaFkigoprSFMy4KNiNG9cnfjUPrBfx5XLR2mURwUw6yHX9
         zdPGdEK1UjcTEo4oG0chcz9HQgRg39tV4onTQJ0wAukUfhQam21BZ2svrVo9WxbyhJJM
         v8sA==
X-Gm-Message-State: AOAM533JV0VHTO8ndPv068ZMzbokJMB+s38vRZf3tJYuHQgx4AqTimFM
	xQ69vDpN1FS76YrRhF0MFpMOLw==
X-Google-Smtp-Source: ABdhPJxFl0pGJIm5UheooE53gyVfAACVfyEjNoEnS7yM3rBuAokl0gYAMKI4jSlEoOleDrcPABVpeg==
X-Received: by 2002:a1c:7213:: with SMTP id n19mr15554wmc.14.1610387332427;
        Mon, 11 Jan 2021 09:48:52 -0800 (PST)
References: <20210111152020.1422021-1-philmd@redhat.com>
 <20210111152020.1422021-3-philmd@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Huacai Chen <chenhuacai@kernel.org>, Greg Kurz
 <groug@kaod.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-trivial@nongnu.org, Amit Shah <amit@kernel.org>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, qemu-arm@nongnu.org, John Snow
 <jsnow@redhat.com>, qemu-s390x@nongnu.org, Paul Durrant <paul@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Kevin Wolf
 <kwolf@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, Max Reitz
 <mreitz@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Jason Wang <jasowang@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>, Halil
 Pasic <pasic@linux.ibm.com>, Fam Zheng <fam@euphon.net>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Cornelia Huck <cohuck@redhat.com>, David
 Hildenbrand <david@redhat.com>, qemu-block@nongnu.org, Christian
 Borntraeger <borntraeger@de.ibm.com>, Sunil Muthuswamy
 <sunilmut@microsoft.com>, David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <richard.henderson@linaro.org>, Laurent Vivier
 <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 2/2] sysemu: Let VMChangeStateHandler take boolean
 'running' argument
Date: Mon, 11 Jan 2021 17:48:41 +0000
In-reply-to: <20210111152020.1422021-3-philmd@redhat.com>
Message-ID: <87lfcznz3x.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> The 'running' argument from VMChangeStateHandler does not require
> other value than 0 / 1. Make it a plain boolean.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Seems reasonable

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

