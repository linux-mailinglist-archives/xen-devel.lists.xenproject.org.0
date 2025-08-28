Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADFDB39843
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 11:29:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097977.1452145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urYwF-0001tU-ET; Thu, 28 Aug 2025 09:28:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097977.1452145; Thu, 28 Aug 2025 09:28:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urYwF-0001qZ-Bg; Thu, 28 Aug 2025 09:28:59 +0000
Received: by outflank-mailman (input) for mailman id 1097977;
 Thu, 28 Aug 2025 09:28:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UDiq=3I=cloud.com=mark.syms@srs-se1.protection.inumbo.net>)
 id 1urYwE-0001qT-9i
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 09:28:58 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b5d08f0-83f1-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 11:28:56 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-afec5651966so120653766b.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 02:28:56 -0700 (PDT)
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
X-Inumbo-ID: 6b5d08f0-83f1-11f0-ae26-e363de0e7a9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1756373335; x=1756978135; darn=lists.xenproject.org;
        h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AOdA+ChG2OJRi9GeaHFeK6eceIsji99wtnfgd+DpFZg=;
        b=QGsGj0OIa2I1+RZUn2OujC/RfGE2azP/MpBzkgfvtNPrVF+13vKHtiOLqzZ07wlGhF
         Z6eB5PQj05OLK/8yjUwvjEVu32X3PM0MLV6M7qNcvdt47ao8dELwUZ4MLNxTBWC1uohd
         eAQx5RSiHhXvDV5CVUYVB5wt/mATrbSwltVZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756373335; x=1756978135;
        h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AOdA+ChG2OJRi9GeaHFeK6eceIsji99wtnfgd+DpFZg=;
        b=fw1NFPxcu44u/GR17gWVt3s+Dr1shTYDMxZFq3kz4zTshjcXGDBwWZF3PjKZSDOT9C
         kSK5k32kOoSgbhGsLkDBfT2zfJQIhDKOdAWX04r/11TzFlsafLTX8f7qrfYKVhmFmNlh
         3TwCTlZAGXecUmi8ohL/7nINXiZHYpdAoE+BshLfUKdW3b5JOqoGjL3KlIp+/NXJEEnf
         mAaLhLqVOxmhHYTb1oGN++Ja9d/B/S01glAZGJ7i+D8iHWH/EjMktuQ9RxuKqZtZaq3R
         EqA34zuHXwv0rlkYlYmASGsHHB7qvJL2tJPy627vuapgZKBljipr8pBGATRsv1XfSF4m
         YnBg==
X-Forwarded-Encrypted: i=1; AJvYcCU5q5ztSUYCAMzddxiyHA6FAqdlJn7PcIjxrQYd2qb8v80LnIYI6hKYxgCyW97JCQH7gY13+Mk3tjg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxyZgyXsCENR05Vfv/3606PZbFOpLbA8DtTZIXlHgUIvYUqFUVB
	eJYzEXdhIGan6tA5KvY0XCQeWdm4lh5KJf14D3SDSlHH5S8AOLm/unxKmVonmS4R5ag43LfsSiP
	VTRiTYK7flyqezRHUz2l39WehZE07hYM6Nww1A4LnYA==
X-Gm-Gg: ASbGncv2qd06IwBnIOBeYcgWNu45pcmfvIMCK2UOyY1oQrEKv1B1ivvYOrTaIYvCiHw
	PmFp+a7Isa2F4qHQQcTbSWSO6s4T05MpvoVr6WUbqe+QrHsl+s7LDPbpBrf3c1y0RbndtqkA8JN
	qk3wxgB71DctlxwVqjZRwZPepFHaxvPl/yGyuyW8eW7A6Wo5WOoxRNiDgzlVHHI+KAM/z4fa6RL
	coD6MjR
X-Received: by 2002:a17:907:846:b0:ae0:c690:1bed with SMTP id
 a640c23a62f3a-afe2954f636mt1705321166b.51.1756373335437; Thu, 28 Aug 2025
 02:28:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250827160841.351707-1-mark.syms@cloud.com> <aLAHoR3BtBz9G9Q0@Mac.lan>
In-Reply-To: <aLAHoR3BtBz9G9Q0@Mac.lan>
From: Mark Syms <mark.syms@cloud.com>
Date: Thu, 28 Aug 2025 10:28:44 +0100
X-Gm-Features: Ac12FXymndS46AxopGxYj9mkgbXiK1MJvc3NVcHdjpqTRtoppZ-Zsa6da0bUJvI
Message-ID: <CAPYKksW6df6cAf6fcH_gKj6+0tVADGtyKw-2weryr1pPfTqHsQ@mail.gmail.com>
Subject: Re: [PATCH] [xen-block] Return BLKIF_RSP_EOPNOTSUPP for unknown operation
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
	sstabellini@kernel.org, anthony@xenproject.org, paul@xen.org
Content-Type: text/plain; charset="UTF-8"

> The comment in blkif.h contains:
>
>  /* Operation not supported (only happens on barrier writes). */
> #define BLKIF_RSP_EOPNOTSUPP  -2
>
> So in principle BLKIF_RSP_EOPNOTSUPP is only to be used as a response
> for BLKIF_OP_WRITE_BARRIER or BLKIF_OP_FLUSH_DISKCACHE requests,
> however blkback already uses it as a response to unknown request
> types (like you propose here).
>
> Would you mind also sending a patch to adjust blkif.h in Xen to remove
> the "(only happens on barrier writes)" part of the comment?

Sure, no problem

