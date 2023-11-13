Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD077EA2A9
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 19:16:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631943.985714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2bUC-0003wt-J3; Mon, 13 Nov 2023 18:16:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631943.985714; Mon, 13 Nov 2023 18:16:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2bUC-0003tR-GT; Mon, 13 Nov 2023 18:16:36 +0000
Received: by outflank-mailman (input) for mailman id 631943;
 Mon, 13 Nov 2023 18:16:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aZgi=G2=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1r2bUA-0003tK-FN
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 18:16:34 +0000
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c56defc5-8250-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 19:16:32 +0100 (CET)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1cc53d0030fso36323825ad.0
 for <xen-devel@lists.xenproject.org>; Mon, 13 Nov 2023 10:16:32 -0800 (PST)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 ju10-20020a170903428a00b001c59f23a3fesm4142792plb.251.2023.11.13.10.16.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Nov 2023 10:16:30 -0800 (PST)
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
X-Inumbo-ID: c56defc5-8250-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699899391; x=1700504191; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xGaoCvEhVKgnKhzAuH2lcBIsGnVExx6jtGAjreAN1U0=;
        b=R4ha/AsGlmBVEdRPNCYQiFdOxQp64cG2+3PrSKeL9pGHtEjzx0/coDh4Ps+kHsAdqj
         AFIwEcIY6FimqrjBQAnzWWuC3G4DQZhcfyVyAksLJQWSeIPu4/vgC2qQPVvz04G7/U90
         kYZ4MRR3/VTEZ1kTpWaDXgmxyijmtgx2psNNDWFhYkz/kZ2K7Bj+vx/e+skG1ahEDqUu
         C8eRwmeShmfFw3wRLM6Xt2e05K91wT07YSjK+0rs0BM4UgTOCBCFpQ+5s0tLUleJM9af
         +H+vZpFispeE3/TqEeDPvWM2Mj0givF70uCEwqPyCPtLAsRYsIiS368Cq4393pWhGosw
         BIug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699899391; x=1700504191;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xGaoCvEhVKgnKhzAuH2lcBIsGnVExx6jtGAjreAN1U0=;
        b=f/ho0OoGC9XZzXI6p8kTQbUbGd2GQgZsA2GLOFdrtegnqcjSk2IdYaRaqqbHGeKxsW
         082sN7e19FCxN48+djV0QfbO9tufXDiJne5kbuP8j3/KcsQveSz3oHoUNnNMoLNo0sLE
         LibZJ4Y28hkGonD2fncaYIXE6rguSzj4UOT32UG/Sz90ZGVA9kJzvErC4oDC0mMrppbL
         gIVW1MOR6+8z10dMw0gjHg1rpd5lLJrH0p6yCf+31YIy7UjNWR6kqJWGcIoff22g1hnF
         LTHm132sfDma9rLNcVYZKdzFyyAgjnEYvpZPW+RcXjG/1VWJUehuabuj2f0RxiAkJ4s3
         WDGg==
X-Gm-Message-State: AOJu0YyCT/pvM0P2KNjJqjjikjJHMmqYkY3S9bPXdbWPpjdd3pdC/weh
	REu1Z2yMzq4y2QeiV0U/GYZDFA==
X-Google-Smtp-Source: AGHT+IFGtFwOCO00qTve4imDefB/v7Y14ItQYfH6PPqxvc6xD2b0XUfTEVU90N6JSOVtl3xeUhxBSg==
X-Received: by 2002:a17:902:b693:b0:1c0:afda:7707 with SMTP id c19-20020a170902b69300b001c0afda7707mr310903pls.34.1699899391077;
        Mon, 13 Nov 2023 10:16:31 -0800 (PST)
Message-ID: <a50b0790-03d7-458c-834b-907e130bb5fd@linaro.org>
Date: Mon, 13 Nov 2023 10:16:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 04/10] hw/xen: Factor xen_arch_align_ioreq_data()
 out of handle_ioreq()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Woodhouse <dwmw@amazon.co.uk>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Paul Durrant <paul@xen.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20231113152114.47916-1-philmd@linaro.org>
 <20231113152114.47916-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231113152114.47916-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/13/23 07:21, Philippe Mathieu-Daudé wrote:
> diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
> index c028c1b541..03f9417e7e 100644
> --- a/hw/xen/xen-hvm-common.c
> +++ b/hw/xen/xen-hvm-common.c
> @@ -426,10 +426,7 @@ static void handle_ioreq(XenIOState *state, ioreq_t *req)
>       trace_handle_ioreq(req, req->type, req->dir, req->df, req->data_is_ptr,
>                          req->addr, req->data, req->count, req->size);
>   
> -    if (!req->data_is_ptr && (req->dir == IOREQ_WRITE) &&
> -            (req->size < sizeof (target_ulong))) {
> -        req->data &= ((target_ulong) 1 << (8 * req->size)) - 1;
> -    }


I suspect this should never have been using target_ulong at all: req->data is uint64_t.


r~

