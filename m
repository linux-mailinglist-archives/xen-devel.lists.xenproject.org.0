Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 206B19A9302
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2024 00:09:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823942.1238024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t30ag-0003dC-A3; Mon, 21 Oct 2024 22:09:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823942.1238024; Mon, 21 Oct 2024 22:09:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t30ag-0003bg-7I; Mon, 21 Oct 2024 22:09:30 +0000
Received: by outflank-mailman (input) for mailman id 823942;
 Mon, 21 Oct 2024 22:09:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fGSZ=RR=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1t30ae-0003ba-EG
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 22:09:28 +0000
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [2607:f8b0:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21fcffd7-8ff9-11ef-99a3-01e77a169b0f;
 Tue, 22 Oct 2024 00:09:25 +0200 (CEST)
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-3e6095eacc9so52366b6e.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 15:09:25 -0700 (PDT)
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
X-Inumbo-ID: 21fcffd7-8ff9-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729548564; x=1730153364; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vkWW2BZ3ezllvIUS0dsSu68WrzHVPP8TMndLIssIw94=;
        b=daRtup86uENNA3J318nZ58NxYh8+cNwpvQjtU4RbvVhHkAtFQUFW9BohGrVb1l5rXH
         0mCdmuhjxS2XKe9N7rjogGuarNijcGZVYdmaxCJ/YXIVBM4pvNeF7uHskNuhKGHXoJUW
         h4oGHsxhBfVccB3djLOf02e3S7WkGE4kLo0zpAnKTgd8F1hY1th2Dg9Riis/fb8bnxGn
         0H23JqD7qtzDNkONx3eUavMQkfhFIVjxG7KMyf20MywyGmfESJzwqSIi2BCK9PMjKD9e
         s7dh+wgubpxyN/TnxjAde3hfqfDYfOTDoUnOLqJZQICAECiaztaRlXy5jmfY8k71lWal
         cC8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729548564; x=1730153364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vkWW2BZ3ezllvIUS0dsSu68WrzHVPP8TMndLIssIw94=;
        b=Gng2C8D374bdfZHPxK6ehVgAGcpCSi4Hq8JKZUNTIX6cjsb1qXESCt+NkE8ZdXWoVv
         cK/RLE9lvMp0HvNmuGZ6a3GFLBk8i1QIJR3dvpEqlfHebhzuY9hMUMjILPPIX6Z+KSTq
         4AblA0BhlF4aVp7MEg/1GH3KQ/zZVisJvbUwpodB78EAl/G0vSM6HDBvX12EdCCyzSCh
         W6NVRuR7NZ8zl7kmskmC5TfMnRNzclPwihIWe6XOrzcEhNMAjXx2aTmq5HchTF1T4bi6
         ZXcu1ZRE556o8Pia9LC9DGOFesaVKw+3d8nOjFWwEzevXwiELLktC0xwftDfDUKRvBQA
         ZZrw==
X-Forwarded-Encrypted: i=1; AJvYcCVa3YrBL0h6oEkrfj/wmroJSnPb08nBMzrtBXbRsxsHqwgydq0kqqtJS5ThlDFHhnwz0eL/SZSrThQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwF5u2CJROzFMhaDH+Rh9VBre6HPOsSKiLI+/0kYZ6vX+dDfbDV
	1NJP2W9EiqyrF33PrI0/O4Nmo6FnRU2ZRVHNWmunFmP+/4JIAGlQ2kh5HY9yznppTQTRoXlr5WI
	cxCp5+dMuyn2lKNBtGZAZveut8pU=
X-Google-Smtp-Source: AGHT+IHK9ZoPF5J00BJlCCCF8TFFVIljnIFDN6HsaOV3HKF39e99YvVS/g/GK4ghPNaBeKQwuq2nXLKCKLZudTtotsk=
X-Received: by 2002:a54:4493:0:b0:3e0:3e5e:c8b1 with SMTP id
 5614622812f47-3e602c7c2b9mr2865161b6e.1.1729548564450; Mon, 21 Oct 2024
 15:09:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1718038855.git.w1benny@gmail.com> <dd1b3db5-6f48-4644-90f6-bdcad98e62bd@suse.com>
In-Reply-To: <dd1b3db5-6f48-4644-90f6-bdcad98e62bd@suse.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Tue, 22 Oct 2024 00:09:13 +0200
Message-ID: <CAKBKdXi+nkhOa6SCgTDYnq6VLnXOzeNB4odg0W8+yZQAEvgiKA@mail.gmail.com>
Subject: Re: [PATCH for-4.19? v6 0/9] x86: Make MAX_ALTP2M configurable
To: Jan Beulich <jbeulich@suse.com>
Cc: Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, 
	Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Nick Rosbrook <rosbrookn@gmail.com>, Tamas K Lengyel <tamas@tklengyel.com>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 12:10=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wr=
ote:
> While the first two patches did go in, the rest is still pending afaict. =
If
> the series is still deemed relevant, would you please either chase the
> missing but necessary acks, or re-submit with review comments addressed (=
if
> any)? If instead it was abandoned, could you please also indicate so?

I plan to resubmit, I would like to see these patches in 4.20. I just
got caught up in different project meanwhile.

P.

