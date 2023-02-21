Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D32F369E97A
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 22:27:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499179.770223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUa9T-0001fW-Ue; Tue, 21 Feb 2023 21:26:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499179.770223; Tue, 21 Feb 2023 21:26:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUa9T-0001d0-RT; Tue, 21 Feb 2023 21:26:19 +0000
Received: by outflank-mailman (input) for mailman id 499179;
 Tue, 21 Feb 2023 21:26:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U5xX=6R=tibco.com=sdyasli@srs-se1.protection.inumbo.net>)
 id 1pUa9R-0001ct-Im
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 21:26:17 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f7d91f8-b22e-11ed-a089-e9535cc0f9c3;
 Tue, 21 Feb 2023 22:26:16 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id h16so22842476edz.10
 for <xen-devel@lists.xenproject.org>; Tue, 21 Feb 2023 13:26:16 -0800 (PST)
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
X-Inumbo-ID: 5f7d91f8-b22e-11ed-a089-e9535cc0f9c3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ontRbTiCbaS8agLcerZLCHDWnInQNV4DuMau5l48sng=;
        b=Z2SdCEOJV2uEqpU/ui01AbLiSvckGBYIL0kDcq6C4PfHbKn8Xp3w+OjZ58QEHq1n0u
         kbRPx/Jpz8l5iPY5NloYHCZXcFt0KY1VN5KCWXo/yb5FCcEsfmOol4rSS014iP+qW1QG
         FjeJGngd8+QZQ7JT9r7PVNHhu953/PxaHD58Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ontRbTiCbaS8agLcerZLCHDWnInQNV4DuMau5l48sng=;
        b=FlqX1ZzcPfjhYcV18MtTiOsHf6x2Gl7cdQIrUEgf7KQ6vyYRKDQocaKVS2OaXxSOIx
         J9iFIcAmSTwZAWuUKI4HlbcO5QQPvj9LZqYClRF75PzqQ6qqo5OaFUf19uA8uyXY05V+
         6YkJ9DPQdDtXEoSF3qOlDaJTnT5LPGXAL86cEwPJ8zITo4nVd/5xAatms1k9X/JweXwL
         fHUT+zWoWfz8+1cQbzXLxs1NmwKM3rcJ+1VSnBImUjXO+8LUrN2CPtB3L/t/CuxPeJxy
         geHn7+wq+ouIIeEiC84eXUfLecCmAvW7skVL74d/zYsxM7LK95SOvWwN2wX2W5b9KH8P
         ij3Q==
X-Gm-Message-State: AO0yUKVYYjC3LTJQ32nJz3TDFZzzVonaj33PmgyxwIECF/IMgUQDlbvh
	0XFd4Nn03dRjeiIKdz6PIy2Fx3LLt1D1rPYHWJ3Wew==
X-Google-Smtp-Source: AK7set/YpaYTqoZo2mpFEA1k42RwEc7aebJptWLdzOAdx42NV9ZnuPkQKmxJ+u3ftwvPJHOZJysmg0f++o3oqetZ75M=
X-Received: by 2002:a17:906:4f0b:b0:8b2:d871:d74a with SMTP id
 t11-20020a1709064f0b00b008b2d871d74amr6639811eju.10.1677014775450; Tue, 21
 Feb 2023 13:26:15 -0800 (PST)
MIME-Version: 1.0
References: <20230215153846.18582-1-sergey.dyasli@citrix.com>
 <20230215153846.18582-3-sergey.dyasli@citrix.com> <e608a174-c158-5e69-4650-51195dfee5fe@suse.com>
In-Reply-To: <e608a174-c158-5e69-4650-51195dfee5fe@suse.com>
From: Sergey Dyasli <sergey.dyasli@cloud.com>
Date: Tue, 21 Feb 2023 21:26:04 +0000
Message-ID: <CAPRVcucou5c+Lsj+QH=H529_GP=mhLxmxsmh5jAFKB4TSc6Z9Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] x86/ucode/AMD: late load the patch on every
 logical thread
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, Sergey Dyasli <sergey.dyasli@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 21, 2023 at 2:03 PM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 15.02.2023 16:38, Sergey Dyasli wrote:
> > --- a/xen/arch/x86/cpu/microcode/core.c
> > +++ b/xen/arch/x86/cpu/microcode/core.c
> > @@ -398,10 +398,16 @@ static int cf_check microcode_nmi_callback(
> >           (!ucode_in_nmi && cpu == primary) )
> >          return 0;
> >
> > -    if ( cpu == primary )
> > +    if ( boot_cpu_data.x86_vendor == X86_VENDOR_AMD )
>
> Given their origin, I'm pretty certain Hygon wants treating the same here
> and below.

Hygon? ucode_ops is currently initialised only for Amd and Intel.
Speaking of which, I'm thinking about adding a new function
is_cpu_primary() there. This would make the core code much cleaner.
I'll see if I can make it work.

Thanks,
Sergey

