Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 911D8AE086D
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jun 2025 16:17:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020162.1396554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSG4h-0005qV-Td; Thu, 19 Jun 2025 14:17:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020162.1396554; Thu, 19 Jun 2025 14:17:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSG4h-0005oV-Qz; Thu, 19 Jun 2025 14:17:07 +0000
Received: by outflank-mailman (input) for mailman id 1020162;
 Thu, 19 Jun 2025 14:17:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P6RS=ZC=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uSG4g-0005oP-MM
 for xen-devel@lists.xenproject.org; Thu, 19 Jun 2025 14:17:06 +0000
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [2001:4860:4864:20::34])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12d8c8df-4d18-11f0-b894-0df219b8e170;
 Thu, 19 Jun 2025 16:17:04 +0200 (CEST)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-2e8f7ca7ca3so427860fac.2
 for <xen-devel@lists.xenproject.org>; Thu, 19 Jun 2025 07:17:04 -0700 (PDT)
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
X-Inumbo-ID: 12d8c8df-4d18-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1750342623; x=1750947423; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/VE80N0vYRpCgRaxRRg8M65kU0kSzEc2wthrdvj03c=;
        b=XEsMsQQ+3A7mkkQL3VjEYMeKryleGJ827GJ4jkG2KBrPhP/pIe0CL1KMTuqHdOldrT
         W7vcMFlMHoraDjwvdOoIvbNYUiy/oFeeKHXwy6tSokfoaoio67hJjqt6tb5ujEqMZg10
         NsZQh/ixFxcGzN7Mb0sjob1pf/JUAsbsB7sd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750342623; x=1750947423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3/VE80N0vYRpCgRaxRRg8M65kU0kSzEc2wthrdvj03c=;
        b=rE1+Ii2FYz9MuqeZPYSWQeVuhaONe+V+soquAy0vtWmle1Ww2jXpCySofCJ/ql2ouh
         Rm7u+U0u7Kv3Ee+wMEkQlvQQTmErOUM3I/ZlUr866VeogPAOtJr9KMrba8YQx41n0zE0
         yHh8XVMuSgdtlTQ/XDVv9x9huMcsqiypB6X5aLsXtEYP5mX8UId7HoTkSUUmwONSshgQ
         f4rx5daCnGYFByRIpLm1XHYg9rXVIsYP7SjuUFwK0on3bA9kqHlOFkbxuPiAZoVZVlmd
         fvVCkWz3Yo5C+pWONultgE8bfwl02Hv0zyMu6mkpQmwmpgDMtjgKcHAB2XXh86i1rbjs
         XKwA==
X-Gm-Message-State: AOJu0YzgH/zP9mzZFHOz6VOEHXHRXhNNH8teyLy1tIooAIWlDJXAQ2du
	V/LqzjVYxxm/CNqppKNBVI9T5DItCeD78simMPRcXnXjYDFbqjg0rtBnHWOipaYks7jlRjpsWm/
	gHR3V5Gx23zZiGxSemMthGFUBkrj7HzukR8VJARAN
X-Gm-Gg: ASbGncv6kMxZVQ4EGjYALKml9iEg7DI7N/digIwiDJAm6NrjiWozK/KxwAQK/OpLVoQ
	BMjoEi9ydiMVeiYC36i1aK0cSkrhtw6iRYhTHuwlh5zzgYmukiIDZjB0miJztkdRB7cjxpRQ+Np
	NKbYTCt9K/akJk3sgNqBEPhR+mhWCh0Bm9NzMkigxYYw==
X-Google-Smtp-Source: AGHT+IGEMIlhEL6YQ2HmbALMvwV+xF3VBtajHqs4aHx30iNYN2NxUqfJ3xc6pmaY2/GWe+hiYncuVehIQT6gLVgV73Y=
X-Received: by 2002:a05:6871:647:b0:2c2:3ae9:5b9c with SMTP id
 586e51a60fabf-2eaf0464484mr13633766fac.2.1750342623223; Thu, 19 Jun 2025
 07:17:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250611235851.167385-1-andrew.cooper3@citrix.com>
In-Reply-To: <20250611235851.167385-1-andrew.cooper3@citrix.com>
From: Ross Lagerwall <ross.lagerwall@cloud.com>
Date: Thu, 19 Jun 2025 15:16:51 +0100
X-Gm-Features: Ac12FXyC8RqGw1phw9QTkSiE_GXduLqoofXH228KFzNtjkuJJa9EBZ__-Y6rvxM
Message-ID: <CAG7k0Eo3yzpUJjO-371j_h6NGrHFky9a6Sr4NWfMHfarTzpR=A@mail.gmail.com>
Subject: Re: [PATCH] docs: UEFI Secure Boot security policy
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, security@xen.org, Juergen Gross <jgross@suse.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Trammell Hudson <hudson@trmm.net>, Frediano Ziglio <frediano.ziglio@cloud.com>, 
	Gerald Elder-Vass <gerald.elder-vass@cloud.com>, Kevin Lampis <kevin.lampis@cloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 12:58=E2=80=AFAM Andrew Cooper
<andrew.cooper3@citrix.com> wrote:
...
> +In Progress
> +-----------
> +
> +.. warning::
> +
> +   The following work is still in progress.  It is provisional, and not
> +   security supported yet.
> +
> +
> +Secure Boot Advanced Targeting
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +SBAT is a recovation scheme for Secure Boot enabled components, using a
> +generation based scheme.  See `Shim SBAT.md
> +<https://github.com/rhboot/shim/blob/main/SBAT.md>`_ for full details.
> +
> +Upstream Xen provides the infrastructure to embed SBAT metadata in
> +``xen.efi``, but does not maintain a generation number itself.  Downstre=
ams
> +are expected to maintain their own generation numbers.
> +
> +
> +Lockdown Mode
> +^^^^^^^^^^^^^
> +
> +A mode which causes the enforcement of the properties necessary to confo=
rm to
> +the Secure Boot specification.  Lockdown Mode is forced active when Secu=
re
> +Boot is active in the platform, but may be activated independently too f=
or
> +development purposes with the ``lockdown`` command line option.
> +
> +TODO
> +^^^^
> +
> + * Command Line

These two are also in progress since they have had patch series posted:

> + * Livepatching
> + * Kexec

I think a section on PCI passthrough is also warranted. i.e. preventing mis=
use
of a device to exploit Secure Boot.

Ross

