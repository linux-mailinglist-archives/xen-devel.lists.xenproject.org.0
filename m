Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D171A4BDA5
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 12:12:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900196.1308118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp3iB-0001rz-SE; Mon, 03 Mar 2025 11:11:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900196.1308118; Mon, 03 Mar 2025 11:11:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp3iB-0001pg-PF; Mon, 03 Mar 2025 11:11:51 +0000
Received: by outflank-mailman (input) for mailman id 900196;
 Mon, 03 Mar 2025 11:11:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8vS9=VW=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tp3iA-0001pY-It
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 11:11:50 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ce9b261-f820-11ef-9898-31a8f345e629;
 Mon, 03 Mar 2025 12:11:48 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4398e839cd4so32388105e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 03 Mar 2025 03:11:48 -0800 (PST)
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bbf2ed24asm42494365e9.23.2025.03.03.03.11.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Mar 2025 03:11:47 -0800 (PST)
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
X-Inumbo-ID: 4ce9b261-f820-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741000308; x=1741605108; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TXePp6d66/7K7zoMgGcEq1LiVC+8JxroBjUksCe1hiA=;
        b=y2RJK1hZTHDI3TWzkyYyEuGS2OuAMml1tVJxLvif0AySuI0YyF7cObSLjUYGS5JW7W
         OwqD3XmXqK407MdS9+abx0BrezC3lgXHQHzIf0SsWTmTvgFftO3G9kS41uIxNPH5KuUl
         yCY+ILtCy96X8Nk0uj4RFCxhgeTubyVQPYMxN7wTptx2BaEYltF2xoBqxAyghYlrBKQy
         Op/Q3G5YkAXJh5PGvqaYRMO2UtRr10vlTZggndT3tbVNKL0Z8QMY1UH/69hIzlor8oTv
         0XlIyiMISkCsFMJJXHxRAtV+Rg9FcD5bLg2e4XKLTPb5OGScKdkrLE1j0D5hpp2gNWub
         gu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741000308; x=1741605108;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TXePp6d66/7K7zoMgGcEq1LiVC+8JxroBjUksCe1hiA=;
        b=I5LeIZ13qgqiVav9tBOG85v2XF5Ki04Som5q4Kq0C5qfGak8srV1o9DMbnAIXuvIby
         CdvVkb5CFFw//ixfwki62A2VrU0WEUrfpQ1vhdSw/kqfNuigvyjtrnyt4HmO64jHx0fl
         Ntbz8umT6h9h//HuDZWcK20kpF4/kWd/4U/gvKR08BmIgivB2E9dqk4K7JaGmVTxgB8L
         Xbag9LLKpmOBpQ3cq3xSzz0qSC9zqOtKlg5Y4+Obve4T5V5GHvCPWnsL1NMBq2J8eXq3
         qqGEM5Tjw6n+0XAcEhKQ43nLNwVzR0w/idgUVTTlqPa3yuFVhhpxBlgzSkz+j5yLlFcE
         JkZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbnWebcSahbwd7TfD0II38uaIwAiNaxPBLiZ/SprIeVkkmXc3vqB1PvnPZxb8+i5XulgzwAFjX4Yk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxdNQab1YbZ6vapCwmG2ebUncOiiTT+/gK19c6TxRtD4KZo+sEb
	bifC9r3ZfZyqZ3tZwmzx7ssK3BVhxMlMubpDjDUn5mqk5XKqMAawo7qsLA2aAck=
X-Gm-Gg: ASbGncuih/2fOqygfDau46Kn7AF1AYjuWNYk3JDrNpfBUCnDenWCnVJG5Ry+PCP2L9h
	EhaDqqSEZln+/NB9QR8Edfmf6buTz27dR3C5G+kAAFbRuW1ijymVmkvvfBv859Ge84bHmVSH/7Z
	Ecdul3fpNtBZW/8PDFkLc5Xapwh3yT3FujWAryuJb6gbTIwoJrGd2jyvmguF7hpy5I5IhgATpFq
	IsZAIcMnl6o6o7+M3NBn2OFzPtqY98UFGrBrSH2qSchszy2ZhhvkyJbUEeHS6ZM5H/XaW3pxzYn
	8X6McOjbhdE532s819slKoQC2lgs7kgzrUiriCyL8333q8ciznPkhVj51mqpeN8xaKeEmYDvxj3
	VD78lxARBLO7o
X-Google-Smtp-Source: AGHT+IGm6SS0Tx3aVo8Pdxgek5Qs1D2aBRLNyFmmaDPbcCk+FIV0Ui7BeXW1FUaE9y+wPzMb01+N2A==
X-Received: by 2002:a05:600c:548b:b0:439:9737:675b with SMTP id 5b1f17b1804b1-43ba6256610mr102706775e9.7.1741000308067;
        Mon, 03 Mar 2025 03:11:48 -0800 (PST)
Message-ID: <6fca1ca3-5746-4ca4-b8f3-c96cfe93a9e9@linaro.org>
Date: Mon, 3 Mar 2025 12:11:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] xen: Build fixes and dust removal
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-arm@nongnu.org,
 Anthony PERARD <anthony@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 Vikram Garhwal <vikram.garhwal@bytedance.com>, Thomas Huth
 <thuth@redhat.com>, Jan Beulich <jbeulich@suse.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20250218162618.46167-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250218162618.46167-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/2/25 17:26, Philippe Mathieu-Daudé wrote:

>    accel/Kconfig: Link XenPVH with GPEX PCIe bridge
>    hw/arm: Do not expose the virt machine on Xen-only binary
>    hw/arm/xen-pvh: Do not allow specifying any CPU type
>    hw/xen/xen-pvh: Reduce included headers
>    hw/xen/xen-hvm: Reduce included headers
>    hw/xen/xen-bus: Reduce included headers
>    hw/xen/xen-legacy-backend: Remove unused 'net/net.h' header
>    meson: Remove support for Xen on 32-bit ARM hosts

Queuing 1-2, 4-7 as I understand #8 needs rewording, thanks.

