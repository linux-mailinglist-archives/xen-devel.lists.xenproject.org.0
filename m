Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A872D96DD31
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 17:05:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791160.1200958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smE34-0003b8-2G; Thu, 05 Sep 2024 15:05:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791160.1200958; Thu, 05 Sep 2024 15:05:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smE33-0003YF-Vl; Thu, 05 Sep 2024 15:05:25 +0000
Received: by outflank-mailman (input) for mailman id 791160;
 Thu, 05 Sep 2024 15:05:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=942E=QD=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1smE33-0003Y8-34
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 15:05:25 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46c36f93-6b98-11ef-a0b3-8be0dac302b0;
 Thu, 05 Sep 2024 17:05:24 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a83562f9be9so97645266b.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2024 08:05:23 -0700 (PDT)
Received: from localhost ([52.166.251.127]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a62045817sm146890166b.81.2024.09.05.08.05.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Sep 2024 08:05:22 -0700 (PDT)
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
X-Inumbo-ID: 46c36f93-6b98-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725548723; x=1726153523; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6RvQFNGRMkTWIqhd5NRTdPUGurr7lUexdcdnb76dnwY=;
        b=XtgwDkVCdqQobqrWecmS2sswHbcY8+Jszi8z90xYVliBtZS+XHV7DgYDA2Y+LfZYl+
         h/suLEfSlSt6h5cz7aVFYyjklfBUdhgOhtxPzYEv8yoBa/OBAALO352riHMFtAFGWHUJ
         ogQBegfU2FDDNQ0oIQwm1dx0170D+TIr733vs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725548723; x=1726153523;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6RvQFNGRMkTWIqhd5NRTdPUGurr7lUexdcdnb76dnwY=;
        b=F2z54Qb/9COCHzYZAe537Lzr8Du7Hp0uy5bqv2/bOJTWydj7F8dN23fuxTlnQFRoOg
         m4z4qr2y6+o6ol0ZQ9Pn9XUyzXFD3ve2mq+QUdr5Jf6LuY8qj0ofleQIY7CzLiCEurr7
         +OsV659TupF22ghq0/Pom2NdvlwwLRZqH/jIlG9NbA53cMdijuVf/+/ss5dZFaTTNLcc
         X+U2npWcjve4SgbwU7WFFSOqjzJu8sittG1716Eayt7Ewkn/vLsc4hyHNF3oAxARzIjz
         tRrhBSzya3fTpoN546eoBebVhBdXXWjcDRjI8hIVAc6VrUyOD1Dww5MzmQxdJOM4+V67
         MGyg==
X-Forwarded-Encrypted: i=1; AJvYcCUYt1mJrZvWF/dunPfi/V/+G4ZkFm8a764/Ld16EXiPJOy6QhnZaxrJUffMqLRi2hDqYad/BW0PHiI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJbGZZfMgcps41Ifezx3dNAOXFh7Z3+C8RIw+rtMBJrJ3RC5ds
	CNMxLFdlXKsAzCADNYwPDqtRnh+eRzoFLifGpE0RYJwQBZ4mv7BbwTS9yn8SSPI=
X-Google-Smtp-Source: AGHT+IEJKzElgrkbFUalpp74TQTe6kfpBrEig076JkyKB2pLI/9Y7UqnuBF7S+LNtxpGVXHo5l+shQ==
X-Received: by 2002:a17:907:7ba3:b0:a7d:e5b1:bf65 with SMTP id a640c23a62f3a-a89b94c7384mr1415004266b.21.1725548723171;
        Thu, 05 Sep 2024 08:05:23 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Sep 2024 16:05:22 +0100
Message-Id: <D3YFYZHD1LCU.PZC83EWK8JAU@cloud.com>
Cc: "Jan Beulich" <JBeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Frediano Ziglio" <frediano.ziglio@cloud.com>
Subject: Re: [PATCH 1/3] x86/acpi: Drop acpi_video_flags and use
 bootsym(video_flags) directly
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Xen-devel"
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20240905130657.4075906-1-andrew.cooper3@citrix.com>
 <20240905130657.4075906-2-andrew.cooper3@citrix.com>
In-Reply-To: <20240905130657.4075906-2-andrew.cooper3@citrix.com>

On Thu Sep 5, 2024 at 2:06 PM BST, Andrew Cooper wrote:
> This removes a level of indirection, as well as removing a somewhat misle=
ading
> name; the variable is really "S3 video quirks".

nit: Would it be beneficial to rename video_flags to s3_video_flags?

>
> More importantly however it makes it very clear that, right now, parsing =
the
> cmdline and quirks depends on having already placed the trampoline; a
> dependency which is going to be gnarly to untangle.
>
> That said, fixing the quirk is easy.  The Toshiba Satellite 4030CDT has a=
n
> Intel Celeron 300Mhz CPU (Pentium 2 era) from 1998 when MMX was the headl=
ine
> feature, sporting 64M of RAM.  Being a 32-bit processor, it hasn't been a=
ble
> to run Xen for about a decade now, so drop the quirk entirely.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Frediano Ziglio <frediano.ziglio@cloud.com>
> CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
>  xen/arch/x86/acpi/power.c       |  2 +-
>  xen/arch/x86/dmi_scan.c         | 12 ------------
>  xen/arch/x86/include/asm/acpi.h |  1 -
>  3 files changed, 1 insertion(+), 14 deletions(-)

Always nice to see old hacks disappear.

  Reviewed-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Cheers,
Alejandro

