Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F327D4F9D
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 14:16:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621882.968760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvGKc-0008FR-FO; Tue, 24 Oct 2023 12:16:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621882.968760; Tue, 24 Oct 2023 12:16:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvGKc-0008DF-CO; Tue, 24 Oct 2023 12:16:22 +0000
Received: by outflank-mailman (input) for mailman id 621882;
 Tue, 24 Oct 2023 12:16:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+b+W=GG=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qvGKb-0008D9-Ii
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 12:16:21 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23cf3b8e-7267-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 14:16:20 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-31fa15f4cc6so3124455f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Oct 2023 05:16:20 -0700 (PDT)
Received: from [192.168.6.66] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 w5-20020adfee45000000b00317a04131c5sm9822690wro.57.2023.10.24.05.16.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Oct 2023 05:16:18 -0700 (PDT)
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
X-Inumbo-ID: 23cf3b8e-7267-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698149780; x=1698754580; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XqhLs0VKE4eYGQf3IxDeRGyPalLn8V/39qWJijHHo24=;
        b=NBCB72IoLbXH7IAQZcqnSsQZ5Koyq0948KaTOvNEIhaJnWKHIGn58WVVlbNNa9jdoL
         J7wnKEyBxuDzqpMmh6NH1qJF/Q/gpz+4Ktpx4LIAJqSWV0Y3Qr4ozFxKSZBOCK5CNq8T
         BO6AcwP8bxMuoZhznr1fkcTpvynrTbQcqqzyd6p0YP2wH28R0I9El5dbiTxDUqnicJkp
         l7uRUrEdfG+3DHrjbS5mw2thEF3LF69Cb/ZwNZ1s6P6Wn2K22mMp1eSENekUUGpTbfRt
         hCEgVsuNBp5t6dNp+wWUA6SMV/ODHHU58Ou8qhIK/mhdIlcK0SpAZ3nEkEcTG0UYc+BL
         QNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698149780; x=1698754580;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XqhLs0VKE4eYGQf3IxDeRGyPalLn8V/39qWJijHHo24=;
        b=MH7QNYD+60hOzjt/ym3epkASUTNH61Pd3GWrPPbHYjCKJRo8HiKwXQQaJUIBOKD40f
         TEl5HYGkaOBzXXAg2L8q6LFYfHLuZao7+5+dqTW4T3ElslUOMVvORoacdXkP8tW8fXOm
         EwCi6TA4IUw8G+4VflF3gXEf7DW+dGoFOa6GB2Qnp5xKWRetUcHgc12oXlhcocD0UMt7
         wEjlyQ4i1Um/WmIiHb1U1E6cSlEedEcDc5jeQ/bm+EM3U8K8oo6HJxE6rZ/EF3eX+nEI
         APQhwNfeFS+cfTaH1ut5a0vkhow+cfLeKwjubyWxBIEaRL6VHNTimoczkkDsdxZnvV/e
         dnBg==
X-Gm-Message-State: AOJu0YzEObhj2Ms08AJ70a/11flyiiUwybDG1j7xnAxaDmWQEBf8cDcv
	qFuwgvp3TieDGc+Zg482AGw=
X-Google-Smtp-Source: AGHT+IE4Z5n2fmffxWcQ/sQr9yuXr/uNARW3iYvgNsmcZBaWl9xNE3uVkib5/sqcnF5f4lyc4e1dbQ==
X-Received: by 2002:adf:e650:0:b0:32d:92fd:9f73 with SMTP id b16-20020adfe650000000b0032d92fd9f73mr7885913wrn.10.1698149779261;
        Tue, 24 Oct 2023 05:16:19 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <456aae8e-ea07-4861-a91b-7c7e28d2a22b@xen.org>
Date: Tue, 24 Oct 2023 13:16:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH 01/12] i386/xen: fix per-vCPU upcall vector for Xen
 emulation
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Marcelo Tosatti
 <mtosatti@redhat.com>, qemu-block@nongnu.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org
References: <20231016151909.22133-1-dwmw2@infradead.org>
 <20231016151909.22133-2-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20231016151909.22133-2-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2023 16:18, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The per-vCPU upcall vector support had two problems. Firstly it was
> using the wrong hypercall argument and would always return -EFAULT.
> And secondly it was using the wrong ioctl() to pass the vector to
> the kernel and thus the *kernel* would always return -EINVAL.
> 
> Linux doesn't (yet) use this mode so it went without decent testing
> for a while.
> 
> Fixes: 105b47fdf2d0 ("i386/xen: implement HVMOP_set_evtchn_upcall_vector")
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   target/i386/kvm/xen-emu.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Paul Durrant <paul@xen.org>


