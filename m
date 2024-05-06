Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6748C8BD1D7
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 17:54:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717743.1120249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s40f9-0002Sr-41; Mon, 06 May 2024 15:53:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717743.1120249; Mon, 06 May 2024 15:53:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s40f9-0002Q6-0P; Mon, 06 May 2024 15:53:59 +0000
Received: by outflank-mailman (input) for mailman id 717743;
 Mon, 06 May 2024 15:53:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2hIh=MJ=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1s40f8-0002PZ-0Y
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 15:53:58 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d81063de-0bc0-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 17:53:56 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a59a5f81af4so524509666b.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 08:53:56 -0700 (PDT)
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
X-Inumbo-ID: d81063de-0bc0-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1715010835; x=1715615635; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQu0cUZw8AUQ4Wyu0ySWc7HzzX+i8CY7BjnLCCYsj5c=;
        b=kpoKVyDmOsNJsv/qLDEpJ7eoxKyHtIeRU//e6fx1WiGMij8BQRkudYMDdqUH+iQGQ8
         9iSoZCoLlgF4YVSOi+rD002yeiLHWJETJrz8lGSi1d1TGHplUwS4fzdv3HT4giNFNg2I
         y9lkZahmFXbwZmLC3AFaKI8Ms5WBr+5yG+9X3ad2u0+k9ydVROa6803iETEjf69X67b8
         CCa3DlcJsLjjaH7GUQZi9udu4XVTI4RihnAajDP85iahkuODSvJT+YdUxXPxuCz1yyiV
         XcHy/w04tkCq2JTMZL1+hbchZIlUNEM/T8sBVjjniR7oXgduowkuMSeL2QexQ2AYAKky
         GCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715010835; x=1715615635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQu0cUZw8AUQ4Wyu0ySWc7HzzX+i8CY7BjnLCCYsj5c=;
        b=BLpAukxGqYQsFv45J/SXg2Aw5aoHfJo5BS6xrrba6UGwmufrKbwcVLaAPjxh4Qlvre
         0Ttbd++qkG8QSdnaMYry45nCJX0E1Md1XK2sNWP5QIPqUK3HTm1XXbNwBUwiozf1PzgH
         A7jNPj+Dk2ppipPTv+pzju/PwjjnGcZOQSZb9jsFtKd3M1g/y341dt/D6GHrk5eepSTw
         1bR5knrwMWC0va9zBfGZ0Jp2waCVgw7xVhc83Nq891NF9EEiGg3a2ebgfpqUhMbJh5tV
         ziZPgkxyD7Aj9+iBsNbAnkC0UxaVnw58xp2zeU39NcCdP2HlPQGZPBNt7ezmi+/PuT0M
         JVuw==
X-Forwarded-Encrypted: i=1; AJvYcCUWfeb8Rz0hP9e0vtRJK1ep8REI7MK6aZMncUfOoZ90OY/CbI/WDI/n6r1V1UvY4TZuZG3RYsM0zA3eITpZDBmUE8dPv2qtNE9CC/+sNe8=
X-Gm-Message-State: AOJu0YyFyGTe1JRToR621yFbcLi8yaNoQNzb3UAmbMXO34TClusISdOt
	pDGs5NcxjmCMYeOPP6kldD1/lrJ13/DvxSzrFAaLQ6npS8VOIlbADqqV7CHzKW3lN1oC4PjwDTO
	bKP1xqqsVQUmPX7L0rOZ9f7JGHShiLVf/2miVvQ==
X-Google-Smtp-Source: AGHT+IEDKgCWSD6Vf5aYEhpIsjg5XbmSLtKFLK/obXv5f4bSlhLj9p3fYMaLLJQIqjOvv4ldUWZufFiNwr4yxWU9gCs=
X-Received: by 2002:a17:907:6e87:b0:a59:d063:f602 with SMTP id
 sh7-20020a1709076e8700b00a59d063f602mr1982800ejc.29.1715010835480; Mon, 06
 May 2024 08:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240502165533.319988-1-carlo.nonato@minervasys.tech>
 <20240502165533.319988-5-carlo.nonato@minervasys.tech> <8fbd50df-6c9a-4177-8001-39c0f15e715e@suse.com>
In-Reply-To: <8fbd50df-6c9a-4177-8001-39c0f15e715e@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Mon, 6 May 2024 17:53:44 +0200
Message-ID: <CAG+AhRX3oUiGxwYphQDcKo_W+4V3kzMoDh_NVGQcCBXxYT0YAg@mail.gmail.com>
Subject: Re: [PATCH v8 04/13] xen/arm: add Dom0 cache coloring support
To: Jan Beulich <jbeulich@suse.com>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Mon, May 6, 2024 at 2:01=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 02.05.2024 18:55, Carlo Nonato wrote:
> > Add a command line parameter to allow the user to set the coloring
> > configuration for Dom0.
> > A common configuration syntax for cache colors is introduced and
> > documented.
> > Take the opportunity to also add:
> >  - default configuration notion.
> >  - function to check well-formed configurations.
> >
> > Direct mapping Dom0 isn't possible when coloring is enabled, so
> > CDF_directmap flag is removed when creating it.
> >
> > Based on original work from: Luca Miccio <lucmiccio@gmail.com>
> >
> > Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> > Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> albeit ...
>
> > v8:
> > - added bound check on dom0_num_colors
> > - default colors array set just once
> > v7:
> > - parse_color_config() doesn't accept leading/trailing commas anymore
> > - removed alloc_colors() helper
> > v6:
> > - moved domain_llc_coloring_free() in this patch
>
> ... I'm having trouble seeing why this was done: Dom0 isn't ever cleaned =
up
> after, is it?

domain_destroy() is never called for dom0, right? If so, yes this is wrongl=
y
placed here.

Thanks.

> Jan

