Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD589715B5
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 12:55:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794273.1203086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snc2r-0004ZK-67; Mon, 09 Sep 2024 10:54:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794273.1203086; Mon, 09 Sep 2024 10:54:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snc2r-0004Xa-3d; Mon, 09 Sep 2024 10:54:57 +0000
Received: by outflank-mailman (input) for mailman id 794273;
 Mon, 09 Sep 2024 10:54:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/tbp=QH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1snc2p-0004XU-8z
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 10:54:55 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f20e4f47-6e99-11ef-a0b5-8be0dac302b0;
 Mon, 09 Sep 2024 12:54:54 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5c241feb80dso10010451a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 03:54:54 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25925d31sm321403366b.46.2024.09.09.03.54.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 03:54:53 -0700 (PDT)
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
X-Inumbo-ID: f20e4f47-6e99-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725879294; x=1726484094; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=x/hdbdl9IFUzun8vCL2VXUxT/Fvc+K47W/ykR2jY+gg=;
        b=KN6oIh9b8j30a6EmFUQ8s4QdTL9BilZ3d82dq4Y5cK7W9VhPGZcO+Uf3gSO2xOsvS4
         g/yMhAS8NRat+g2fRQUo2knC1+B1BCPblNssyS8gXB+u8xM14RosnFRgvbwQrpwLwl3i
         oDuw4enJBBncxpqKFhFiYL/qLKewNwhPWYyas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725879294; x=1726484094;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x/hdbdl9IFUzun8vCL2VXUxT/Fvc+K47W/ykR2jY+gg=;
        b=JEMDWGfvhC6PNYnMpyQJTmHprqdWYakQVrO8k5kf+z4viUgiP2YmjDzJjTmpFiu+Vz
         JoUBGcW4uctyZoKWO3ORw+SNEYJh96GoCdL+AaOBjm4NWndv9p97Vhv3+ZGY9I8Efc6H
         i/EU9qTEuorMtisNfiUpuRO1nI0ldcCq0jllHE3FxlV03UEJUwuTiPT3ume7rcXKxjIT
         d7q9f1X92OuWxNlWEW2sa/WTDhRxsOVxXWK71tfkFKM8GJj6FDH1+LwnMcrd16EHBLda
         0DEasXDw2V0ilhX1Ss7qfZyvcfF85CxMP8kPjNh21ZeDfdC1MAwRXeSGDeSTDrvMnO1j
         7yBA==
X-Gm-Message-State: AOJu0YyHQTxKp4KnrU7G2mcqi665Pz75gxd0py2Afd0+hUyXd9G/kDK+
	2z4qXRvJjFCvxfzBi1VgLCSYOYZMpLOTQE0nm+OM2QM521dAXhBXFrIhtSyQhxZiGlS4rmPLBwz
	V
X-Google-Smtp-Source: AGHT+IHHGOPcxO+Pq9xT3Rtl0GchuFxXeL5l5E+qzEQJouJNhE9Ub/TpqwhtxV//ocCDbM7T+RaLSg==
X-Received: by 2002:a17:907:9287:b0:a7d:c464:d5f3 with SMTP id a640c23a62f3a-a8a85fb7e90mr1165055466b.11.1725879293560;
        Mon, 09 Sep 2024 03:54:53 -0700 (PDT)
Message-ID: <ac005742-2b2b-4c07-91af-5ca8ea4fe5c8@citrix.com>
Date: Mon, 9 Sep 2024 11:54:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/boot: Optimise 32 bit C source code
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20240909104402.67141-1-frediano.ziglio@cloud.com>
 <6cbc9587-5e9c-4f59-b61f-940bcd7f408a@citrix.com>
 <CACHz=ZjNFqoFbzi5ZAPzdZq1-S34p09tM++WZ-GD5Mv1KdbYpg@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CACHz=ZjNFqoFbzi5ZAPzdZq1-S34p09tM++WZ-GD5Mv1KdbYpg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/09/2024 11:51 am, Frediano Ziglio wrote:
> On Mon, Sep 9, 2024 at 11:47 AM Andrew Cooper
> <andrew.cooper3@citrix.com> wrote:
>
>     On 09/09/2024 11:44 am, Frediano Ziglio wrote:
>     > The various filters are removing all optimisations.
>     > No need to have all optimisations turned off.
>     >
>     > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>     > ---
>     >  xen/arch/x86/boot/Makefile | 1 +
>     >  1 file changed, 1 insertion(+)
>     > ---
>     > Changes since v1
>     > - reuse optimization level from XEN_CFLAGS.
>     >
>     > diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
>     > index 8f5bbff0cc..8352ce023b 100644
>     > --- a/xen/arch/x86/boot/Makefile
>     > +++ b/xen/arch/x86/boot/Makefile
>     > @@ -16,6 +16,7 @@ $(call
>     cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
>     >  CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float -mregparm=3
>     >  CFLAGS_x86_32 += -nostdinc -include $(filter
>     %/include/xen/config.h,$(XEN_CFLAGS))
>     >  CFLAGS_x86_32 += $(filter -I%,$(XEN_CFLAGS))
>     > +CFLAGS_x86_32 += $(filter -O%,$(XEN_CFLAGS))
>
>     I'm pretty sure this can be part of the prior expression,
>
>     CFLAGS_x86_32 += $(filter -I% -O%,$(XEN_CFLAGS))
>
>     Happy to fix on commit.
>
>
>
> No objections.

Ok.  Will get that sorted.

>
> On a similar subject we don't pass -D__XEN__ to these files, this
> looks wrong to me, they are Xen sources.
> Should I send a separate patch after this with that change?

Yeah, we should be retaining that.  I can fold it in too, with a minor
adjustment to the commit message.

~Andrew

