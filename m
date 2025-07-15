Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8BBB066C1
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 21:25:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044694.1414778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ublHd-00085J-Ja; Tue, 15 Jul 2025 19:25:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044694.1414778; Tue, 15 Jul 2025 19:25:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ublHd-000830-GH; Tue, 15 Jul 2025 19:25:45 +0000
Received: by outflank-mailman (input) for mailman id 1044694;
 Tue, 15 Jul 2025 19:25:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZCKb=Z4=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1ublHb-00082t-CA
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 19:25:43 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f223331-61b1-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 21:25:42 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a6d1369d4eso3321429f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 12:25:42 -0700 (PDT)
Received: from [192.168.69.239] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454d5032e9esm208334115e9.3.2025.07.15.12.25.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 12:25:40 -0700 (PDT)
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
X-Inumbo-ID: 7f223331-61b1-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752607541; x=1753212341; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=epbtau3mfk9DJMdMl9jVXDpnXezgjmAx1/t4HCFUui4=;
        b=JLC0r4kOd4NUwFVhZ8kcrilKVEg8vhZLzNasY6k1KJ75nCjhqBMvuRh0GDijnV8tEx
         UPD8liTs9vWG4BcxNelGQdHzPJZ1YYZiU7OQerjEMKl3wTtur9ttriw3Rx3eIiRrsACh
         UlQ+fATiUHiHGVZe/RvKQ5/5wfSssStjJxy3l+EgUZFQ3QShiCEqAxP+0GBIyDqta79z
         zZiTfvVorxq4yQ3KvgL/9W2ZNLmcoSTqb0TBBbwg0jSxs/UisqmgVY6JiqqXzkGhO9bW
         U6uAnByPuMn269pF4GUu6hg8wzVCQAi1b2NW4NLqWExuO2xVgupXP546IGbTU+/tYyVb
         Ghxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752607541; x=1753212341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=epbtau3mfk9DJMdMl9jVXDpnXezgjmAx1/t4HCFUui4=;
        b=TJM+jrtZ7gjdUGB7ksb1L/GzigLKHSfnh5opoMeC5UWh/0SqqLccz+yRMf2QPQE30D
         O+PXq+vGYNv2vsV5NUhksLUnzXJVtrLSb7MudhTNfv1++OYnQ1nNLwzCggdH41mQHvel
         xSGOm6rNy0S6PLEYP17PWJrQivyC3wamQuA285H5xdiLTwDK1YfGYZ3Bw9ntDSbxBqsU
         SKw7YI83IDukwjZ0hJBL5++NAql6ZuEi5EiwAeFHw9u5JgpzfTWCSw1oDjGVmp/KIR/s
         CJmaGksh2UeEfXQlEAsywqaOn6FKIPdGa+ClRgAtjPobT7/c+lx9xouC+B4TkRO8PS5V
         3OMA==
X-Forwarded-Encrypted: i=1; AJvYcCUdKitCAQMM66w6pUaN28gnDo9m/AzkJOgFub+gE56v0y3YCWIN1S6HphAI5OF3l+P/fCgIYaTjgVU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyY069c8VJl24Itm4xGmYKJahJjm8sJghg5m2eJedSPfuyG5G4n
	IiVv4ua5l9FvIQGblsJ0HarzhA9jTwbCLo6tYYrA/wlAn2yeC88wlWjYjWc98YfxPK8=
X-Gm-Gg: ASbGncsFPx8TQJyv+hSDCsPEdhANq1rV7CeugDVjLio9xs06oV3MRbLPkS34zLRtzMM
	FpzO38KyOVIuhWH6onMQcv4MhM9mAnDiSs7l0NG4iOuJ0ydl1Mg39kzL7UOO7qUKWlhZen5i9Eh
	G2gfHZXRxTlgci8uVaBDJzXBedYjxB6n0KL+OAfNJ7nNbEPv+kWJeQcPAwStjosafNISX2zqqfy
	QVbuGE8ykcVExiyBtNCSsmTcKE8PfgP5+PaVhP2l28ClmzNzcgSaZB0fOyD8s/g5YHFHdk3AEv6
	xTNuTT3QiH3gO3Mx+cU4rZSyLWbR0IVGnzgv6CvO3vNLIEkYgOO/hb7QcTNWR8JosGWUvjxfAS5
	ogjSBAxJtQd+ambvBf7nW+JEb97n+HJWvsDYKKUInhgKSu3f7/l2lZOPhWA1VgxuGjFI0HQE=
X-Google-Smtp-Source: AGHT+IFpze0b7WsXfdePVDOr1+gg0YPpVi33rfy6T+pguMPneExVvnAdiPASoy/Fln+H+OoB9yKF3g==
X-Received: by 2002:a5d:5e8a:0:b0:3b5:e6bf:5e0c with SMTP id ffacd0b85a97d-3b60dd95baemr277349f8f.31.1752607541370;
        Tue, 15 Jul 2025 12:25:41 -0700 (PDT)
Message-ID: <98715ba8-a2b2-4a07-9cac-cc6a40a9f7aa@linaro.org>
Date: Tue, 15 Jul 2025 21:25:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/xen/arch_hvm: Unify x86 and ARM variants
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony@xenproject.org>,
 David Woodhouse <dwmw@amazon.co.uk>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20250513171737.74386-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250513171737.74386-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13/5/25 19:17, Philippe Mathieu-Daudé wrote:
> As each target declares the same prototypes, we can
> use a single header, removing the TARGET_XXX uses.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/arm/xen_arch_hvm.h  |  9 ---------
>   include/hw/i386/xen_arch_hvm.h | 11 -----------
>   include/hw/xen/arch_hvm.h      | 14 ++++++++++----
>   hw/arm/xen-pvh.c               |  1 -
>   4 files changed, 10 insertions(+), 25 deletions(-)
>   delete mode 100644 include/hw/arm/xen_arch_hvm.h
>   delete mode 100644 include/hw/i386/xen_arch_hvm.h

Queued, thanks.

