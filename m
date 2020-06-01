Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 250D91EB23A
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 01:36:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jftyl-0006X5-MC; Mon, 01 Jun 2020 23:36:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zqDJ=7O=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1jftyk-0006Wp-Am
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 23:36:26 +0000
X-Inumbo-ID: b56f2cc2-a460-11ea-8993-bc764e2007e4
Received: from mail-pj1-x1041.google.com (unknown [2607:f8b0:4864:20::1041])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b56f2cc2-a460-11ea-8993-bc764e2007e4;
 Mon, 01 Jun 2020 23:36:25 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id h95so533883pje.4
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2020 16:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tdEZ0FE2fCkDdeCvjfAB13a3HzQjvtrN7+bWKrDiVJY=;
 b=QSSR3Tj/yGlftLB9YcpZ1IPdp82Oq7+Xb1W/zB0ce8Lpd6c/K8euxhHRJQzAI4a1E3
 1KobbVvQyaCC1uCzRelaNzPSRDXazQXp0S4Dfysw3vyuEUTUMWHoEu2qjV8hhDAf2wNG
 fLvrpPn9nnwZP40nJV7l3OJj4NDHzApNYsv2Vm5kR4q7rI38ry719XhneDioE1H/su0b
 2YaVgNOMMBWxj1xn2kqrtmX2tU6r78lX7kW/dTQXAkKrfIJIWxAotPPZHRf9HLeUL1SX
 nzuSL6fROjjw1xXXE03lAqSXRjuxHPqkPTZlPC7ytxiuFFZzwk7+dOkN2fAa6qxcObH5
 sKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tdEZ0FE2fCkDdeCvjfAB13a3HzQjvtrN7+bWKrDiVJY=;
 b=Cb0cL4qtHA55cRu73GhoHoEz+dBEoduHcaJ5itU6nFSM3CY7OJgpldhTGJ0Rl+0vR7
 iK6Gjj/dnxxYQR7kalVNtAabJcPYquiGaN/U21UfsKV3GTM2XwcwfVLI0pxTJOmGWGpE
 lhQw4yQqdBp/JD59Dl99GiDBMTTEqd3PruJ04CaVKvhSCg76mCFvSn0WdGcnub1xqaYt
 JEV5K0DZxMmQ6EaqTdkAWNBwYzuF3D7xQsLVo9I6F5AXUDla9Y3qIgLnEe8SvIVirbY5
 0h9R7aZkOTn8CWHtwrsh5J7XpL+s3Qa+J9/9DgPQJV451jl5xf/Oas62YTFbln25RfrH
 Felg==
X-Gm-Message-State: AOAM532Vlu4CMbmx3mCql8yoannh7auXUi46cvTXZfHlRSFt1zoi1IC0
 qCrOWPnbTr2bNwbDF+Ss3Ieb6g==
X-Google-Smtp-Source: ABdhPJxpAGmqj3Dx0cH2lpPvMLKiH5ZdJ3xTJ4daeI/RNAe8QkFrgiIitY2pMAswbpMKPCy91j6fQA==
X-Received: by 2002:a17:90a:a08d:: with SMTP id
 r13mr1978033pjp.96.1591054585155; 
 Mon, 01 Jun 2020 16:36:25 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id x77sm454355pfc.4.2020.06.01.16.36.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 16:36:24 -0700 (PDT)
Subject: Re: [PATCH v2 4/8] hw/pci/pci_bridge: Use the IEC binary prefix
 definitions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200601142930.29408-1-f4bug@amsat.org>
 <20200601142930.29408-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <761761ff-13ef-acf7-094d-b0406a4f9a02@linaro.org>
Date: Mon, 1 Jun 2020 16:36:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200601142930.29408-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Helge Deller <deller@gmx.de>,
 Paul Durrant <paul@xen.org>, qemu-trivial@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 6/1/20 7:29 AM, Philippe Mathieu-Daudé wrote:
> IEC binary prefixes ease code review: the unit is explicit.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/pci/pci_bridge.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


