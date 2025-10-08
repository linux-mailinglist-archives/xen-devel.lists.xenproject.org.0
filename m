Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E238BC51E1
	for <lists+xen-devel@lfdr.de>; Wed, 08 Oct 2025 15:05:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139641.1474911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6Tqa-0004CL-Cc; Wed, 08 Oct 2025 13:04:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139641.1474911; Wed, 08 Oct 2025 13:04:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6Tqa-0004AN-A2; Wed, 08 Oct 2025 13:04:48 +0000
Received: by outflank-mailman (input) for mailman id 1139641;
 Wed, 08 Oct 2025 13:04:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bWZK=4R=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v6TqY-0004AF-5x
 for xen-devel@lists.xenproject.org; Wed, 08 Oct 2025 13:04:46 +0000
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [2a00:1450:4864:20::342])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59fead68-a447-11f0-9809-7dc792cee155;
 Wed, 08 Oct 2025 15:04:41 +0200 (CEST)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-46e491a5b96so42091245e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Oct 2025 06:04:40 -0700 (PDT)
Received: from [192.168.1.183] (host-92-22-57-86.as13285.net. [92.22.57.86])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8f011bsm30390433f8f.46.2025.10.08.06.04.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 06:04:39 -0700 (PDT)
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
X-Inumbo-ID: 59fead68-a447-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759928680; x=1760533480; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9pnjQV8/IKyJ19meyrA4ftenJqRkmyUX9Yqv/Bp8oOU=;
        b=gOFtkO0XjXfFzy4WAzrBzpXmYKLAuyoRoXqg1hn7tsX+iO+VyLXdPOHuogkO0sHBUY
         nrRhZnJWnUreXVtdAprmivzJ0CEU/NeiHVFegn7HvaHzeaiDZEPD/sOrZkpcQ/Zi3Ujj
         e3EImBD+MxNv9H2Ow8MZsypAUWQwvHr2cyTjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759928680; x=1760533480;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9pnjQV8/IKyJ19meyrA4ftenJqRkmyUX9Yqv/Bp8oOU=;
        b=TCzWBSTpzTfKTcy5dvTwnGhhvvXaByhTs7TQnVQ6zfoWIASs1H/tbYoXKH+dep8Uvq
         h5JUHnZysMoWr6s4AzPocOGYnfc5Rb9REM3qccrOjwL2ihNlyWUB02qOuT0j7w5WeIJO
         hbq+tmu4U7DmNyqfXSZ8DybQCupNedc0necy9GWqauB3OPMBmgLMbiXJ0I0ez/GqqbS3
         KO+E8LsSOzPlMSiDzYzmwldn26m3Is4jGbSgRKzCkvxDi009xVUkVqsPAgZj/GUAmOiw
         xKD+mq5s3OeRFNaZLYpp/8YMmEJ+s8bt72Tpc/ubiGzVZZlWd9vQcsEVAIt466bMzZXN
         euyA==
X-Forwarded-Encrypted: i=1; AJvYcCVOndXok1oXVbQ0tbFmy4750B8I5zXq9iIeTfhaoioflkco9yJEdSGwgJHBm02r3weCloAtESF+Z0c=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxbp7QTUfC/8cesBxs3YafkBuNz3sPGtVYbEtyy5UjGNbhsSss8
	R5TPQL7phMF0DlMiy+bvqru3TxiT1wW3viD1KZR/rIZetIGfQGELu1LEtpw3K8dIaI8=
X-Gm-Gg: ASbGncufvSzP54/MZlSLNasEH2Kk1nRXvsdXg6XcffHXTYF7cIF/flBTFBWSXIu4SIt
	eoEnj7sKfq2OtZtDvBI+FhIdA10NAjzQ9iEi0BJ5tI3H+sSZNTLdPM4v+xtpjeUhxU3z/pHD0Kr
	a3qo4rkBq5+Uy65EkwR+zW2ARkM2mpLr0zgkP/khDwbE4P6IUq2C8q3df+qhVT7hgiOvJeZqyLx
	bdopBgXJPB3vUljl9FJUbhhQLWdSsN0GuCaC63id4EQSvUDYfAXULwpui6xb6ymYe38HYXcXLVr
	7NkNQv/pTxZlhlG1k1y/3RmP745uMPpLsYYGtncPBGimvUjKnUio0Ad7VcTnqY+snpAnSZNWR6w
	9vvaix9T9ewHfCdWVygohiTApLOanfX9FNYkdiZjRWyCtI7BfnMY1YErgnE/njZ1WzMrpxro+xO
	HS7GLj/DJ6awlp
X-Google-Smtp-Source: AGHT+IFZy2zy1D307JjwVJvbXY2QoSBNXHFFNRrCw051AiLUA5dsLWef4M9xisOJmieIvodM++b9bg==
X-Received: by 2002:a05:600c:a41c:b0:46f:aac5:daf with SMTP id 5b1f17b1804b1-46faac50ea8mr13861305e9.35.1759928680250;
        Wed, 08 Oct 2025 06:04:40 -0700 (PDT)
Message-ID: <e8fa4e2e-d788-4dcc-b1b5-9a3e0a70ef49@citrix.com>
Date: Wed, 8 Oct 2025 14:04:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21??? 1/3] x86/vLAPIC: add indirection to LVT
 handling
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <265d5053-af61-42cb-a3b9-ef60df39c21b@suse.com>
 <dd6b46f8-76f7-46d3-b3be-083b58781f32@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <dd6b46f8-76f7-46d3-b3be-083b58781f32@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/10/2025 1:08 pm, Jan Beulich wrote:
> In preparation to add support for the CMCI LVT, which is discontiguous to
> the other LVTs, add a level of indirection.

It's not the only extra LVT.

AMD have Extended LVTs, which are necessary if we want to get virt-PMU
working.

https://sandpile.org/x86/apic.htm is a recent addition which covers all
of this.

>  Rename the prior
> vlapic_lvt_mask[] while doing so (as subsequently a 2nd array will want
> adding, for use by guest_wrmsr_x2apic()).
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I'm afraid this introduces a vulnerability.

APIC_LVR is a toolstack-provided value.  Nothing bounds checks the
MAX_LVT value in it AFAICT, and previously this did not matter (from a
security point of view at least) because the loop bounds were constant.

~Andrew

