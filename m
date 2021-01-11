Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD71B2F1CED
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 18:48:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65158.115437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1IJ-0004g0-9X; Mon, 11 Jan 2021 17:47:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65158.115437; Mon, 11 Jan 2021 17:47:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1IJ-0004fa-5r; Mon, 11 Jan 2021 17:47:55 +0000
Received: by outflank-mailman (input) for mailman id 65158;
 Mon, 11 Jan 2021 17:47:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Ybk=GO=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1kz1II-0004fV-3v
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 17:47:54 +0000
Received: from mail-wr1-x434.google.com (unknown [2a00:1450:4864:20::434])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af6c737f-7ac7-451d-bbf1-1701cd28b285;
 Mon, 11 Jan 2021 17:47:53 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id w5so624617wrm.11
 for <xen-devel@lists.xenproject.org>; Mon, 11 Jan 2021 09:47:53 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v20sm26616wml.34.2021.01.11.09.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 09:47:51 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8337D1FF7E;
 Mon, 11 Jan 2021 17:47:50 +0000 (GMT)
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
X-Inumbo-ID: af6c737f-7ac7-451d-bbf1-1701cd28b285
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version:content-transfer-encoding;
        bh=7PomrZU0jMeuj2pSx76rGsVMpY5/lWRJj77kNrVmTOQ=;
        b=eN3dBxOzR44brDRBdWt3v4cXwY6j30skPdqKuTGRWe/DKoQpXBEbYCNfUfWnxSmOMu
         XBy0JNbmcqHL9/5eTyQHRZK0TylvdmoTIQtrHYnXogIczvSNKQKMvqS2IDa41gSpOeb0
         jCa+KqJnWspIoTNo5Vo72FWylPM+UqOOAL93Y9lhyE/E+JSasH8i1x5Qt4PEIRazuKwW
         47iItS+Yn4S8d/GkngwvwwLE36JBsUFx206rpGBdpMxlY9JBo+PoakQ2ux2Lr1L6YVLy
         T4Sq750nq5cgVMPwYor3Gt9Bgx5x9vcasoQAVPtwwZubrFxLtHxMm/RPTAu3LFDIRtjD
         wmlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version:content-transfer-encoding;
        bh=7PomrZU0jMeuj2pSx76rGsVMpY5/lWRJj77kNrVmTOQ=;
        b=sIccY6MRaPfRWb2P16h7slmR84zZfrnYwA3J8FfnkDy9K7zzmjs10vjvUb2sG7iDYN
         OJbKhcCg4qQApPGVuSsZ8vdtaHVxcxo/n8fDPo3Vy93OtMoUcZE5OrVHpdeBN6EshO6S
         wS9CQTa1wnedHDxWbvy98SKPJrwGoNQvi3ZcxNV64ULvolAaxPQs8FK2S5sb6nUo0/wn
         hDyD0nUrlkeYTYV4yQF6wGgzojJrLD0egt0SF5ot19MsMBbKjgkiFE471gvDnBAjc8B6
         FQlpX2xWdueGv/NN4vWsqVhCZhmenS9Sg16NlytDZPqbUQkUQIWe30YkrcRnUcHdrQNj
         MM6Q==
X-Gm-Message-State: AOAM5322MKS598OkAjfr82ZnAaLq4N1wfgYXKpZjiokxxGji5vBzaNbf
	zvENkVNSt8K1dBFeFYJAHmmNbQ==
X-Google-Smtp-Source: ABdhPJyEoJCuSw+5tRtzaJyx6mVyGEBtWFwj20lKG9ywN4EzrcnynxBCh/RF0f45AqXVj56ADnb/VQ==
X-Received: by 2002:a5d:5385:: with SMTP id d5mr269757wrv.384.1610387272416;
        Mon, 11 Jan 2021 09:47:52 -0800 (PST)
References: <20210111152020.1422021-1-philmd@redhat.com>
 <20210111152020.1422021-2-philmd@redhat.com>
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
Subject: Re: [PATCH 1/2] sysemu/runstate: Let runstate_is_running() return bool
Date: Mon, 11 Jan 2021 17:46:36 +0000
In-reply-to: <20210111152020.1422021-2-philmd@redhat.com>
Message-ID: <87o8hvnz5l.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> runstate_check() returns a boolean. runstate_is_running()
> returns what runstate_check() returns, also a boolean.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

