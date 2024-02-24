Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 162A8862800
	for <lists+xen-devel@lfdr.de>; Sat, 24 Feb 2024 23:40:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685125.1065490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1re0fS-00066R-FF; Sat, 24 Feb 2024 22:38:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685125.1065490; Sat, 24 Feb 2024 22:38:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1re0fS-00063M-CB; Sat, 24 Feb 2024 22:38:50 +0000
Received: by outflank-mailman (input) for mailman id 685125;
 Sat, 24 Feb 2024 22:38:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NmKg=KB=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1re0fQ-00063G-Tl
 for xen-devel@lists.xenproject.org; Sat, 24 Feb 2024 22:38:48 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 787a80f6-d365-11ee-8a57-1f161083a0e0;
 Sat, 24 Feb 2024 23:38:47 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5643eccad0bso3013244a12.1
 for <xen-devel@lists.xenproject.org>; Sat, 24 Feb 2024 14:38:46 -0800 (PST)
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
X-Inumbo-ID: 787a80f6-d365-11ee-8a57-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708814325; x=1709419125; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tEluI7LvDw7LFX5VQEn063ItBW3HwsptymCLrHlIUGI=;
        b=cYX5yIyDwX6eLdJFt7Mmm8klzXu0DNj4gr7aEgbawu+qmiH+vaJm0LS7wE4WKIY/e0
         yXhn7KtTOQGQW9M5Zjo0iryL0ja1Ayy/CF1IiWZVtecj6egStG8Kta1RgOaLyJsJQtny
         d1JUDNgRgRR/ne4LZR0uGwMyaN0IzXKm4YPOUAXSScthS9eLxkh6SZC8K2N7xSjmrmXb
         YQH40+zdswVbThVe9SNaA30t/nHqpfcxDwwaKHKCJt5GkljI0bBefrf3TqtdTInUNiBY
         JN244UgUK2GKJvz5IMxTnzZp8JqhD9LkO40NuPhUAZolceVryXpBT9MSiz3HqhxrYq0C
         TNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708814325; x=1709419125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tEluI7LvDw7LFX5VQEn063ItBW3HwsptymCLrHlIUGI=;
        b=YOFMm8ontsmeydgkE0GYaVMkJuJgd2P7p+rwHBewzFDgajeH0eeZ1c0DV6jNtCOVq6
         Q/HrzkVh9Sht78FZGQvVl2pPBWf6h/IYSINl6GuCWLEKYkbQgnyBWPkNs09h5qlpUKPx
         /f7d3eWxmhRDwI8j63RaPdO/n8eiEiw0uDhkXV8Ky/U6J+9Up8w3HXSNyg/NtO3XWlp7
         6aCBCQuuqHmVIEk5MjwKgk2btiR0/YKLMivUDPaA9SJEUVgS7078id/kyysrGX3HfgVX
         6YqeCzhJRRxt3TXlcGo1NElYS2HiD/uWTNOZKbIybY7yy5zHqWjGvt6NfJPW9eSldFoi
         IAFg==
X-Forwarded-Encrypted: i=1; AJvYcCU5Y28vA3MZrxfsjhxn3GewFpR07Kray7rmSvqw4kS7kjLRXzqWfbH0qnbbb3AHC5HiRxLP0oYK/UJcvuLvLWXyZz+eyhWBw4ifjESCiSA=
X-Gm-Message-State: AOJu0YxjWPhp2hjTSmqc8fxFw1vvSM6vXEYHHeU8mINKhARgl4/XCCke
	50oCVhPno/cZujU/sigGQ+K1bSuAH8LsJ5uTcz53tlnjLAY77oj0wkKFn7Agqagt+WSAbR9aHxB
	ZILWQzei9tzKjPyLOJKnKD0hMlYU=
X-Google-Smtp-Source: AGHT+IGwfCWYBQmFql5XzZmlAw8qa0O4J9dpcMXcpQCXBSN7Uguk3jfvHidORqTaQL7tfMsnLqfxDxur1pU+ccJMDvc=
X-Received: by 2002:aa7:d385:0:b0:565:9b29:ad3e with SMTP id
 x5-20020aa7d385000000b005659b29ad3emr1736557edq.6.1708814325480; Sat, 24 Feb
 2024 14:38:45 -0800 (PST)
MIME-Version: 1.0
References: <20240219181627.282097-1-marmarek@invisiblethingslab.com> <20240219181627.282097-2-marmarek@invisiblethingslab.com>
In-Reply-To: <20240219181627.282097-2-marmarek@invisiblethingslab.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Sat, 24 Feb 2024 17:38:33 -0500
Message-ID: <CAKf6xpsA5dDgLavGFbT1Jyd1LQS2ZEwUH9G=GdLYnA+1ntohwg@mail.gmail.com>
Subject: Re: [PATCH 2/2] xen: fix stubdom PCI addr
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: qemu-devel@nongnu.org, 
	=?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0IChmZXBpdHJlKQ==?= <frederic.pierret@qubes-os.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, 
	Paul Durrant <paul@xen.org>, "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 19, 2024 at 1:49=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> From: Fr=C3=A9d=C3=A9ric Pierret (fepitre) <frederic.pierret@qubes-os.org=
>
>
> When running in a stubdomain, the config space access via sysfs needs to
> use BDF as seen inside stubdomain (connected via xen-pcifront), which is
> different from the real BDF. For other purposes (hypercall parameters
> etc), the real BDF needs to be used.
> Get the in-stubdomain BDF by looking up relevant PV PCI xenstore
> entries.
>
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>

Anthony made these comments on a different version of this patch:
https://lore.kernel.org/xen-devel/48c55d33-aa16-4867-a477-f6df45c7d9d9@pera=
rd/

(Sorry I lost track of addressing them at the time.)

Regards,
Jason

