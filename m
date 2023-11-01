Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D09497DE171
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 14:24:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626481.976744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyBC7-0002sT-M8; Wed, 01 Nov 2023 13:23:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626481.976744; Wed, 01 Nov 2023 13:23:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyBC7-0002px-JH; Wed, 01 Nov 2023 13:23:39 +0000
Received: by outflank-mailman (input) for mailman id 626481;
 Wed, 01 Nov 2023 13:23:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R8ij=GO=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qyBC5-0002p4-Pz
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 13:23:37 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbb26032-78b9-11ee-9b0e-b553b5be7939;
 Wed, 01 Nov 2023 14:23:34 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-53de0d1dc46so11574874a12.3; 
 Wed, 01 Nov 2023 06:23:34 -0700 (PDT)
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
X-Inumbo-ID: dbb26032-78b9-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698845014; x=1699449814; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27hvzOK9t8MeAptJDJLZpG7S335m3EOL6W7StWN64c0=;
        b=kUOmae47UJiAixlNZ8LA9HvJUaaxpOHZzmguvR3kLjYiRD00R0ZWt2lpC//djeBcx3
         AA/Fbx9xCqoXdbghLUkzrQSQp2Zl9qPxEgcZWHPwHq0m8jeDwgH83t5Q3Z1qLvwaZHvs
         tS5vnA9hwaIPFNmHX2LrJP+eyy3egBvUmzq4ntaNGCIN/4SZAqs0AUDtV7HoAPTgLNTg
         IoyJd1Ww2CStjEKQeTTnMsrg/HRc2VmG5DVbOxww0hdU0FaKkG4Zutw2i3q40A0B8ea2
         7PJgczyorvTmW6H5HTWGqY8ehHTMKFfBE6bCz3L1WUbxmpgaLFT8w7ktzY9Un3zWUfzH
         rx7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698845014; x=1699449814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27hvzOK9t8MeAptJDJLZpG7S335m3EOL6W7StWN64c0=;
        b=QzMdyZH1/7YQH0v2Whf/0VGI3G3QTP8M/Q3AYhzBwElbYysxOsF+bBZly31zopbWcO
         Sq63tlvJquLlrSMgAjcwv1MTYC3otv+1VBdiIj2ujm9d3axyB0WVaPCjNnfwPrakJwQU
         tRO08wJEKI2qNznQ/oJkh5pgzwQIcaRoqr0uMom3hglmQl+u/iiHW0oY0f0fKaE4RiGn
         4Yq0w9s27FzxEQLNpci8yUZnjwNP82fm1UbEkrfRImG1gQdOKtaiDz0cPFJvhrSf+gdE
         NlcTsAlweWr4YmKReN28dhg1NkxQW/8UD2p/mKUUS5c5SzI8JvfhiepLwccCPVtAGNG2
         auIg==
X-Gm-Message-State: AOJu0Yw3YCgHCVih7KX6h7DB2fB+z7liRUv7hhU9rCPxIlMGj8tD5lEu
	jhSQHxQWgFBD81NoZHPFFXBfIlqDHMlih2yvfrTX5vNp
X-Google-Smtp-Source: AGHT+IHlwpBf5Gwplo2xTsPwodrcbvvSEeUM22CeML7ZiphMdmoY3Muj3Tj6EtE6+c/A3JiYfSOatnvLd0HTSAdWUak=
X-Received: by 2002:aa7:c645:0:b0:53f:2671:e0f4 with SMTP id
 z5-20020aa7c645000000b0053f2671e0f4mr11691706edr.38.1698845013981; Wed, 01
 Nov 2023 06:23:33 -0700 (PDT)
MIME-Version: 1.0
References: <20231101090024.28934-1-jgross@suse.com> <20231101090024.28934-3-jgross@suse.com>
In-Reply-To: <20231101090024.28934-3-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 1 Nov 2023 09:23:22 -0400
Message-ID: <CAKf6xptG7r1H_fxS7OcO0+moMvgHr46h=Ap0dz3enMHqUGBTgw@mail.gmail.com>
Subject: Re: [PATCH 2/3] Mini-OS: don't crash if no shutdown node is available
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, 
	samuel.thibault@ens-lyon.org, wl@xen.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 1, 2023 at 5:06=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> It might be perfectly fine not to have a control/shutdown Xenstore
> node. If this is the case, don't crash, but just terminate the
> shutdown thread after issuing a message that shutdown isn't available.
>
> In fini_shutdown() clearing the watch can result in an error now, in
> case the early exit above was taken. Just ignore this error now.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

