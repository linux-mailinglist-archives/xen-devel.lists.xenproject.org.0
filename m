Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB08B7781F0
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 22:03:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582201.911835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUBsK-0002m4-Oa; Thu, 10 Aug 2023 20:03:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582201.911835; Thu, 10 Aug 2023 20:03:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUBsK-0002ik-La; Thu, 10 Aug 2023 20:03:16 +0000
Received: by outflank-mailman (input) for mailman id 582201;
 Thu, 10 Aug 2023 20:03:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eGPc=D3=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qUBsI-0002fI-JM
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 20:03:14 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed687588-37b8-11ee-b284-6b7b168915f2;
 Thu, 10 Aug 2023 22:03:09 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-523ba00a62aso675597a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 10 Aug 2023 13:03:09 -0700 (PDT)
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
X-Inumbo-ID: ed687588-37b8-11ee-b284-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691697789; x=1692302589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=czNDBwm2jJDIh7l7tzB+aDs6zI8rnPbTT69UXuSdg70=;
        b=DsjuaQgtHv/sbA0A5k3q0NLUiPCiGfoNRRcDxNRjzdBQR4G5HzQnR+s1ny84vDDr0k
         XD7HQaOYMvhokuLhqDexs5UYamZ+N/PTYYLPg155BWN+YyXYxKD3yecG7VVtRUCh6Tja
         2m7z/qMnN5zA/liXwYKsT01QfayfKQZ1qIJi4Hd0mkIB0fTnwA/ehltopubrV+ojffaU
         jD+C/bjEFnQMPlPAY4edJ4ZET87LavMNz61q+USUD/20SP59qICWzofDYpCnxA56rFUe
         AJkYgDedE6kEBbLuu9qXmm7vW0NdJuUgPn6tUpgUoZfvX91N8oE4tV/AeIkFtiiEonfY
         hS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691697789; x=1692302589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=czNDBwm2jJDIh7l7tzB+aDs6zI8rnPbTT69UXuSdg70=;
        b=kB3mLSN1bTuuG/ktiF7I9YjAR1XNSCTAa7uhAVoMj2+i/b270GM+9c+/OMWfRpiFwf
         wCDgsYnWOzzkK9+04VJgHyZxPxP+zVsb3ZEofbVOsN2eiPlRcxXmrAkajsGxnD08ZR9y
         U/l+3313M3uiicY3FR924W8AmYJ8N/2dGUOVGp5Xq7tba8GC60Ciq1X3yq4NPm5YY4CK
         vRJjNKeTni43qhHY18LZesHjb70oBRc+7k9FhLWRU+rDE8hWD/v9MrJ3M0fyFa3CgXZ1
         kaaSzdvt50G2rY2tf1wlKg51RD31Y1LF8Ct67xRt43p7n2V/+E2trQAwF0uyLZ2HlJtQ
         kyTw==
X-Gm-Message-State: AOJu0YxUjZQ3TFPUyWANaGveBvElMFbsc8Fag0mQomvEyChLjjtEC6O4
	NZjC93SaFsbG/MmyYvJ+V2D3dIwYfhZO7wbzEwCn4hLI
X-Google-Smtp-Source: AGHT+IHAhDpGUyha751ei6f8OAsLRHOQyrAzD3Vn6WJyC1O3FGwSx3cINEewdvYVyVYAoXlA1gCwFexQqkYzwJ6mwFs=
X-Received: by 2002:aa7:cf0f:0:b0:523:1400:2d7c with SMTP id
 a15-20020aa7cf0f000000b0052314002d7cmr6090edy.35.1691697788645; Thu, 10 Aug
 2023 13:03:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230809103305.30561-1-julien@xen.org> <20230809103305.30561-2-julien@xen.org>
In-Reply-To: <20230809103305.30561-2-julien@xen.org>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 10 Aug 2023 16:02:56 -0400
Message-ID: <CAKf6xpsVMjuVYhbJ3B7Ja76fn4cjix=Q9F-PxmOZscTAhEn2FA@mail.gmail.com>
Subject: Re: [PATCH 1/2] tools/libs: light: Remove the variable 'domainid' do_pci_remove()
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 9, 2023 at 6:34=E2=80=AFAM Julien Grall <julien@xen.org> wrote:
>
> From: Julien Grall <jgrall@amazon.com>
>
> The function do_pci_remove() has two local variables 'domid' and
> 'domainid' containing the same value.
>
> Looking at the history, until 2cf3b50dcd8b ("libxl_pci: Use
> libxl__ao_device with pci_remove") the two variables may have
> different value when using a stubdomain.
>
> As this is not the case now, remove 'domainid'. This will reduce
> the confusion between the two variables.
>
> Note that there are other places in libxl_pci.c which are using
> the two confusing names within the same function. They are left
> unchanged for now.
>
> No functional changes intented.
>
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

