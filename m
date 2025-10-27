Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B860FC10BBF
	for <lists+xen-devel@lfdr.de>; Mon, 27 Oct 2025 20:17:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151753.1482294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDSiv-0001Nw-58; Mon, 27 Oct 2025 19:17:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151753.1482294; Mon, 27 Oct 2025 19:17:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDSiv-0001Kz-1X; Mon, 27 Oct 2025 19:17:45 +0000
Received: by outflank-mailman (input) for mailman id 1151753;
 Mon, 27 Oct 2025 19:17:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=asFF=5E=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1vDSit-0001Kt-G9
 for xen-devel@lists.xenproject.org; Mon, 27 Oct 2025 19:17:43 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99d4d8b1-b369-11f0-980a-7dc792cee155;
 Mon, 27 Oct 2025 20:17:38 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-475dae5d473so27516075e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Oct 2025 12:17:38 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd4a5cc4sm148220435e9.11.2025.10.27.12.17.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 12:17:36 -0700 (PDT)
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
X-Inumbo-ID: 99d4d8b1-b369-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761592658; x=1762197458; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OX4zfCLoPvhE7+rhyNGlBqoW+O/OVNQrXavKW0oZ7hg=;
        b=wa99TbTxBOv68nsiLCPBItX4W6xa4gsCNWhTt8U3E+u3TvggKEte2UBwP8rvq+pyuF
         Q3OkyARkuOS0L0IslLkjfaiMNth+QGVarhHJ/W0N6FC8Xc24ZOCmOx3ScwQWgBn9RweS
         c0g2yuZVuWDF0O2RpbXgifRemyFsQezolRL7JzywoFQu/RKb7r0zMuKwBi4uNprWhPny
         vZJMLXwOVKG6/y3AZe32TFnE4gdDF0oLCx20wzj6fu7uwrBvHPtjyFfCvMPD7y00G42c
         hCIYzvy3wkUB3HG3S0XibSX6K4dxjqY6PaP6LZku4SB7GLrM+cM7fw4sX7boVYeiFDiX
         PL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761592658; x=1762197458;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OX4zfCLoPvhE7+rhyNGlBqoW+O/OVNQrXavKW0oZ7hg=;
        b=dpwfBm94gGkLKrmkcFcAmgs3UaZ8lJLPsnXE5K8Rfi/5neFeHV94IOGOx/0O4EbBhU
         ixDdsNhVJfwC91CgQoHunc91tc6120YH0j/TbZru7QNzFrc4Kete/Y/cnSM4VUmjtiww
         Lt8mPHW28fUs0fyhMP3yLWPQV/IVO4C2VaLqN3dsgJN+9q8+wPdv5SCJFdGQudvYOYRb
         72R2ToqJ69EiIPd74WETSnNOwVoCYvs66xSG7VIpEF4q3Lbs1FoFjVFYVF5Mf1BtTlW0
         b9nLNERjNLca+8WZ0yQiRRXKPPfaw+izxZoUHhiiRXOuOqJooFOKCeA+UO7D9jH/bLiS
         B3QQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCu0xAEbkNc/o35Mxlt/HpvvLpOKxzK4DjsBgPMPFJeG43NEAVgb2EprYxmbeJGU8Kto9RRalo7dw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YylbgI6l1G42azqHBmfUxPHo2i8sm5CtGh/9xwpTVFY8QtvkOly
	p6rYGnRQyb5H2A5wI4xCEwbrXWCMMZDiYlmh+tRkR07z6LTFH8R445vr2ZGHzIFWWmI=
X-Gm-Gg: ASbGncusYs+kQoIljLFYAm5J4PSMuWus/Kd0f20TcVd4mi5sSlWx23sc6D2qPrYXMw9
	Xhef5Bn+iqlfErTOo9rvdNU+gDyhhWjkKP8b48mrTay+sPO1LnpO4aueSbFDVUguyIWYIi6RjuK
	YUWCfkzf8adBsq8KHPfOmepABhk4S2ArTAlN2Fzqg+k151oZwS8Spv3huEXACrbMGP5Tg3b+QZA
	N5unw7oSNZlK6JTO92x07wDrgT8xnYlbJF1NaX+cHKZoLFvZzH0e/kE9Fqc9zetIu+71WQAGypb
	l5CxYP5vX1EBVYKtdylyDbeMOctAzmpwbJXxtTDegU2s0/3xGS+zR/cGEz1jE/NIuQWxH6tWFAU
	KQ880Kmx5t5n+RlWCAq0wv2RKxoeXcZId6mZT+qkjsm2Ya2t88tW9vMYzF3/FWiiS1qMQcCkIxA
	ovD/PeoBHwnYZT0Vxof31CjJfgmMWInxyVjBY86Oy4b87UxyDUbKDnqQ==
X-Google-Smtp-Source: AGHT+IE6bsd48TMgBcJRd8xWdvttKaErtSwdPfBofrIhRIW/1pPh7lT8y/cKFUSZgcIose3NawzhVQ==
X-Received: by 2002:a05:600c:3511:b0:476:84e9:b561 with SMTP id 5b1f17b1804b1-47717e587d1mr8807005e9.32.1761592657798;
        Mon, 27 Oct 2025 12:17:37 -0700 (PDT)
Message-ID: <64b66fb0-f297-494a-8e79-b38c02c070b1@linaro.org>
Date: Mon, 27 Oct 2025 20:17:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] hw/xen: Build only once
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, Paul Durrant <paul@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Anton Johansson <anjo@rev.ng>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20251022140114.72372-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251022140114.72372-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22/10/25 16:01, Philippe Mathieu-Daudé wrote:
> Replace target-specific code to allow building
> hw/xen/ files once.
> 
> Philippe Mathieu-Daudé (3):
>    hw/xen: Use BITS_PER_BYTE & MAKE_64BIT_MASK() in req_size_bits()
>    hw/xen: Replace target_ulong by agnostic target_long_bits()
>    hw/xen: Build only once

ping?

