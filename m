Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A363A7C552B
	for <lists+xen-devel@lfdr.de>; Wed, 11 Oct 2023 15:23:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615508.956781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqZAj-0007Zb-Ey; Wed, 11 Oct 2023 13:22:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615508.956781; Wed, 11 Oct 2023 13:22:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqZAj-0007Wx-BM; Wed, 11 Oct 2023 13:22:45 +0000
Received: by outflank-mailman (input) for mailman id 615508;
 Wed, 11 Oct 2023 13:22:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3gNM=FZ=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qqZAh-0007Wq-Cj
 for xen-devel@lists.xenproject.org; Wed, 11 Oct 2023 13:22:43 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41d9dae3-6839-11ee-98d4-6d05b1d4d9a1;
 Wed, 11 Oct 2023 15:22:42 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-533d31a8523so12125259a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Oct 2023 06:22:42 -0700 (PDT)
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
X-Inumbo-ID: 41d9dae3-6839-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697030562; x=1697635362; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwj/RqxGPkzuOtK1UNPuFzJw65gTRa5z9/nkxrTcS64=;
        b=UGevgIhq6TZq/6Pd3xbJqHUVfpaGdo+MQKia7crn9JTAYD8TNMeEPAqQXgslGMi/QY
         IgKjFRFTsRm2wZH8y8jUIopjgR8J2vBPm7QK8z3VFuRvSnGA7k+O0oyPCjCn2p+hdOkZ
         t8K798Wx+VuPBA6FCB5DjZAAJqshkkPUiXXoU2OH8oda/4/yGjcSzqKAZ5ydp7vmUGNs
         YtNfZ7E1CH4u2zoTMiVgnAdnZTrZ8KjuFf3gP2ywgr6/6HFu7nDus+KX8VfBtOrzwhHX
         zw2wi2PG8iYDOiVKpot1uTuAzfQA9xivjrzzJMW753gh0gAsHy5mP8Hm9aRYCb/BcUcF
         Dxyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697030562; x=1697635362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gwj/RqxGPkzuOtK1UNPuFzJw65gTRa5z9/nkxrTcS64=;
        b=B8DVihdqfqnHQFokCTKQ1q/3mqChbzuDP3KywaZutnp+ocXjP05SL+ddwsPObh0pce
         yhHredrJb4okm8QYIfJm+jpmyeM86GPIvStfHy7Rp4aITrPQgKWK7zroFfLnccPRGVqW
         j5V3V54UJcXvSrn/+Sqh1z6InikVe0VNsNg4nULeqnmnKarmtUIqhU38XJhwBK9eosXC
         0/7YBa+ubo6C7la295yN7lwbIGLlVuGA3QHmgT1D91Ecq0WCqOI1lju8lcJ/CDVzmq05
         jRZV09RpB8J696pMC8XjyBszrykVxKhq6MRq8oZwXa8/YdmyhgZjHS287+I6wChEFTga
         GLxQ==
X-Gm-Message-State: AOJu0YylqFH0nNlKGa46V6TfeTw54IPOt5N+iDHLF6BWUkmYtC/ThtHn
	+2i5GNJSwIdkLFSCeuRHyJHszuSt+SFixEUmvgE=
X-Google-Smtp-Source: AGHT+IFjwPBdU24OWt+9rcNzyGAp61bEypdrM0CvK15jqMZomnmNG0qOl212jrCcTf9kSexYP8Ppu/QQjvKHxhdmt1k=
X-Received: by 2002:a05:6402:60e:b0:523:33eb:1103 with SMTP id
 n14-20020a056402060e00b0052333eb1103mr19266775edv.14.1697030561468; Wed, 11
 Oct 2023 06:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <ZSRMosLuJJS5Y/io@work>
In-Reply-To: <ZSRMosLuJJS5Y/io@work>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 11 Oct 2023 09:22:29 -0400
Message-ID: <CAKf6xpu4vQSKFykwygcCtnnJtcQbgVTuaNvAwDLeV8cZAectHg@mail.gmail.com>
Subject: Re: [PATCH][next] xen/xenbus: Add __counted_by for struct read_buffer
 and use struct_size()
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, xen-devel@lists.xenproject.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 9, 2023 at 2:55=E2=80=AFPM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
>
> Prepare for the coming implementation by GCC and Clang of the __counted_b=
y
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
> array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
>
> While there, use struct_size() helper, instead of the open-coded
> version, to calculate the size for the allocation of the whole
> flexible structure, including of course, the flexible-array member.
>
> This code was found with the help of Coccinelle, and audited and
> fixed manually.
>
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

