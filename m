Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 638816EE384
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 15:58:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526090.817568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prJBd-0004Zc-Ej; Tue, 25 Apr 2023 13:58:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526090.817568; Tue, 25 Apr 2023 13:58:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prJBd-0004Xd-Bq; Tue, 25 Apr 2023 13:58:29 +0000
Received: by outflank-mailman (input) for mailman id 526090;
 Tue, 25 Apr 2023 13:58:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v3bG=AQ=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1prJBc-0004XW-Ek
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 13:58:28 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4097ac8e-e371-11ed-b223-6b7b168915f2;
 Tue, 25 Apr 2023 15:58:27 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-94ed7e49541so877107166b.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Apr 2023 06:58:27 -0700 (PDT)
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
X-Inumbo-ID: 4097ac8e-e371-11ed-b223-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682431107; x=1685023107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wIWeMc9o17CKQ0OUZe12x31/iPLhRnin8xVXaGqeYpA=;
        b=Rb+VuDNYs28yW0WYOIvdnYfvtJpGDiQK0y4UhkwQfM7O6IgEl/aezgT2nBCEwX9M5x
         6KmaDprPA4SYNUuOQ4I2EalgNmlvSqSBuK7/Ow/JtFJafmnWkXYsWE34vh2eSTX/IHue
         6XLbChAqjIylc0rSDWMoYoQpZARTtW/OSVRCriH2Zde6LHfhwHnFM3GbA3r/BEMLmE3+
         qYBxzM/fqXJQq1w7gRriI92+e02I0I1FJ3e9KsdT4x7389GPLP+NQnJLddKT4fIaNWPp
         WKINBSE/0rfPTdzW9bNygzBT1Dk9GALMY1si3plWgQtueBSXgRvLmIrw+yYdS1oea4HH
         XQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682431107; x=1685023107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wIWeMc9o17CKQ0OUZe12x31/iPLhRnin8xVXaGqeYpA=;
        b=OPcq2j/OmG8M4/89jnnZTfLqhY8LVpjKHkWzUEfOAtZaSBXLE+Q14BUCXRbEe0AFOE
         ESQG14wicaVZUYov5tzURKZkDIZsniGbLHxQj060JZDZt7ZpsLN4r/rJo3F87ZrMQoDO
         pTl9yJyyD46r6Pdm8Kyt2F39K7R0g195lKegAqU4iqeuCN2HY28hhULWr1JqMvNrLpX+
         AxpinXBFMWWgq4AUjYkk7BgEOi8Zot4V+ySFu3R8RmLYrR1CISKWz0tnKWJwtJxQgFQu
         of4lTekiygVjRofTAhAyF7buCVJLS7Iqj14KATQZIr2TI6IxMQ9CKk4XtPT+lRPASbXC
         PifA==
X-Gm-Message-State: AAQBX9f+cmkEno5amfkT67iXEHca3PRRSSNg1knDQKxK31T6GpXQVE3Z
	xnWoS34cV8I8Te2rAaNFGLtBhD9xTFlWZUhtW10=
X-Google-Smtp-Source: AKy350b5ev7765OJdt+6XmlRn+b+ZUQ5QqXnDgaS/HE/fDBJbyO2HyTg9as9UCV+Xv7FBEO/Bpf0dCYMoxyz+i6gX3Q=
X-Received: by 2002:a17:906:72dc:b0:94c:dcac:4b24 with SMTP id
 m28-20020a17090672dc00b0094cdcac4b24mr13523937ejl.49.1682431106886; Tue, 25
 Apr 2023 06:58:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.52ddd01da196853766a5b39a89c631f3e4652dd9.1682369736.git-series.marmarek@invisiblethingslab.com>
 <b01494665d1a8cce5c426be70beca2c519215eca.1682369736.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <b01494665d1a8cce5c426be70beca2c519215eca.1682369736.git-series.marmarek@invisiblethingslab.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 25 Apr 2023 09:58:15 -0400
Message-ID: <CAKf6xpvg-NQrJhekDdNi+RS0KyDQBtOOWTYmdQCtpdF5Ggfr2g@mail.gmail.com>
Subject: Re: [PATCH 5/6] automation: PCI passthrough tests on ADL hw
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Marek,

On Mon, Apr 24, 2023 at 4:57=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
> +    elif [ "$PCIDEV_INTR" =3D "MSI" ]; then
> +        # depending on the kernel version and domain type, the MSI can b=
e
> +        # marked as '-msi', 'PCI-MSI', or 'PCI-MSI-<SBDF>'; be careful t=
o not match
> +        # -msi-x nor PCI-MSI-X
> +        domU_check=3D"$domU_check
> +grep -- '\\(-msi\\|PCI-MSI\\( \\|-[^X]\\)\\).*eth0' /proc/interrupts
> +"

This will match -msi-x.  Do you want to make the first part "-msi "?

Regards,
Jason

