Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E477C13753
	for <lists+xen-devel@lfdr.de>; Tue, 28 Oct 2025 09:10:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151979.1482525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDemC-0001nl-F2; Tue, 28 Oct 2025 08:09:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151979.1482525; Tue, 28 Oct 2025 08:09:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDemC-0001kw-CD; Tue, 28 Oct 2025 08:09:56 +0000
Received: by outflank-mailman (input) for mailman id 1151979;
 Tue, 28 Oct 2025 08:09:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=alTg=5F=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1vDemA-00017m-SW
 for xen-devel@lists.xenproject.org; Tue, 28 Oct 2025 08:09:54 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b980b0a-b3d5-11f0-980a-7dc792cee155;
 Tue, 28 Oct 2025 09:09:53 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-475dbb524e4so20298175e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Oct 2025 01:09:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:404:4d10:9f16:e9b1:dc97:28e6?
 ([2a01:e0a:404:4d10:9f16:e9b1:dc97:28e6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952df682sm18709406f8f.43.2025.10.28.01.09.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 01:09:52 -0700 (PDT)
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
X-Inumbo-ID: 7b980b0a-b3d5-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761638993; x=1762243793; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5o79HTrwKutaocALjFgRBFk+W1FD9POxl9sF26qwAFo=;
        b=J7bAdNvXjpmYZDX45EV5ZL/B9q7DBSi6al1/RupQDVKGyLP5D5IOiUbvVyw3Iw6Pum
         kWGvVT6lWGR6qF529u2a41bUBlqkpZaYiqx5WbgIq0T5+Q/dFyOwIk8xWYP8c+ez2SBF
         VCqdGV51NESdvmdvDXMaE9fEi4Glw3bXTD3IypQ9RrlLQMCOwwRLz+hfl83HAja6lLrA
         B2HaPo2oxzJlPeOxFqqhlfb55RSfBQtZQSiBxFAzZBZryGegydd94/2GrKkj7poZnjWd
         hoPTp1PacS6rAxqpsm2mDeg5MuG56K5eMrOOah9YH1caSMvBB7oiAh8pNhibbPH5spjM
         TsSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761638993; x=1762243793;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5o79HTrwKutaocALjFgRBFk+W1FD9POxl9sF26qwAFo=;
        b=TYP5s7xNXllMMKp+ZobDSFsr1atVe4PVUVGq+68Iaw6BrfGl0D82hW/6LZ4PIkIifG
         b+SncYNdsktOSD92Tuko7pEjLFug9vaWj3kmeyYEUUEb77QgaHYMai4dIAmc/zWHfj6r
         4tiKZ1kuR9Ot2NjHZziwGDfTFEhSw3v+eikaxpNb6zLdlovZMLLU4qsnPHkBMHTUUbH/
         MbB99mwvAicLzFBI7Jk7vLeiyD1XAUEnFGDMzoN9MeCRz6xDjF1137Vmlt1emfzjklCE
         5EztvN0wPs1+gJaaehVVkmWtOZSZL8RJ1J14I4YCOp+O680Tnudyhe7uAGkGm/AxvX61
         uCPw==
X-Forwarded-Encrypted: i=1; AJvYcCV1mlO5X265NrPO0Y0gF+PJX31h1iHMnTPzHbBLOjlt+wqBAewcB9ZVNEh8M1g7ULzTFsp0PqZxtjk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy0tySsJ4aMDKswbQtzTqPeGdw/u/4L/QlnIe33cVgsgUDVbqhQ
	qUac6WXhV4c2FxUNp1kG4nY3+tExqTbLhvvQo426TEedHcFHNAyseZGksn9Gb7hSfLI=
X-Gm-Gg: ASbGncsgdquuYJiAEDpphmCmnyTaFUwWocrdbS0PUz3tGB/SBDMbIUK9KGZelQquIaT
	lQ9eoHy7XeKdyzgCCMNygy/jRYn5Jn1enNM0x7N7xMymHmI9PfTyaljavOCDqNu8jjszgp+MZmX
	ktM1KzPXn+mjIswIQPCRsFixjk7IpWtZ6shijlvIYySM/YaDo0Hbb230qMYczd4CHCOJvjKmQFr
	IEWMNMbrfqfM2vnRxCG81IRuD7E9Twh06GZJIELwfgh+8kP9ZxO2E48R14adPMqUmcjGrWqEKvS
	siiNWt5hzbObq6+Ex6g6oOIP473mI5oOz98OuuyhoGZJFoat+KYrEK7bHVPwb1JWRJjkvse9Y2g
	TlYsGiyGmd1k/wc56XH2J5I8o297rUUz4UF1XH824sicuyHmPkHoG3y6QtWEzIa070Pv70FIRVC
	Vf8BGlYApEDwkxcRj5PzpuqHxOhTKfcu/VnFQrTf3Jv2kwqhziqNY5FOY=
X-Google-Smtp-Source: AGHT+IG8WnEd3rtSmYijCGk8un9q2hWj+EkrVhAxHMmyi3ZNajwLYrqwT75wz5yMjleeWzji1yqPog==
X-Received: by 2002:a05:600d:8304:b0:456:1a69:94fa with SMTP id 5b1f17b1804b1-47719a0e688mr5508395e9.13.1761638992731;
        Tue, 28 Oct 2025 01:09:52 -0700 (PDT)
Message-ID: <9e4ad29e-1dda-4c5b-844c-d950b91b8591@linaro.org>
Date: Tue, 28 Oct 2025 09:09:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] hw/xen: Build only once
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org,
 Paul Durrant <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anton Johansson <anjo@rev.ng>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20251022140114.72372-1-philmd@linaro.org>
 <20251022140114.72372-4-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251022140114.72372-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025-10-22 16:01, Philippe Mathieu-Daudé wrote:
> Now than hw/xen/ files don't use any target-specific code,
> we can build all file units once, removing the need for the
> xen_specific_ss[] source set.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/xen/meson.build | 22 +++++++++-------------
>   1 file changed, 9 insertions(+), 13 deletions(-)
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


