Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7BB1EB23E
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 01:36:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jftz7-0006eL-Cr; Mon, 01 Jun 2020 23:36:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zqDJ=7O=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1jftz5-0006dr-Mo
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 23:36:47 +0000
X-Inumbo-ID: c22a70ac-a460-11ea-8993-bc764e2007e4
Received: from mail-pf1-x441.google.com (unknown [2607:f8b0:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c22a70ac-a460-11ea-8993-bc764e2007e4;
 Mon, 01 Jun 2020 23:36:47 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id f3so4159674pfd.11
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2020 16:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=utp8UPhvpVOjKQDHheJJZxOdw9rN2rKIwvixqFfY6I0=;
 b=xTG7Mc8Ke+P7C8o56JElmLFbH18twbQfttKAc5G/dIXmkm2onWlNspWFfvusLOTgLg
 pTRDJq/tgRyR7y8JuLP6CZFE2Egd7bg09ZKOeD396awq3y3Wt4q7J+Liinm2BBOuvUrx
 PPw+rh9aMrrdNIj2zKTtH0aArySoR9V7wv0LwGc+yun4GQvO89nczwsvBnve0Xlf9HLH
 7jA8bUorURzKagLbFYICNCER7T+CBwhJkzcywpFi0y9NCCGAjDZRm5Uhst8GI6Mk+SKq
 qe0DI8YoF1wc321Lg2a7uLv3QwcS6piwxXYRRqVkl86ZgCgMmu7bDWT6NTv4v2CVRdQd
 XsRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=utp8UPhvpVOjKQDHheJJZxOdw9rN2rKIwvixqFfY6I0=;
 b=Y+5JKUB04BBOZgp9V0mWMZGd7vsNQx+s1KrWExHUJRFjUNhSOphbXF2a9wzTHw35DO
 Icn+MT4qim71A+HC6O4L7mFrDUTU4cQtJ5HVdt1Q8hrjIUFTJfOiUVfoEd9WmYLsHWgj
 r3lEMgum1NbVqQZFD6Hgsdy2SeBrlAKIm/SLdH/2e3rqabaTm6+jyeTDj0bW15KbWDRM
 QTzRfRbzdiXVlUu8rg5d00BnVJm5rzIjFPQaihhv1UEWwwjRX81FaefD63/w+ny3ieiA
 HRNuP0r1hQuDVRD8UHpTsgEcIN+qkoZW8frqGPCEYY0dRw+C/dGkRkEVb/sANl8GmJtB
 E8ww==
X-Gm-Message-State: AOAM532oTL018Hxmy3D4Pszw+okWUfEwuf48GIBg8VkXyqWxi+9/HX9B
 CMHjXMwmIrItpkn+XRfNoewzmg==
X-Google-Smtp-Source: ABdhPJylPCz6NJ8Nv/4CwG5eFZALKyaW9WbeoXC1cmJzPEV4oHq3Rbd3WXYgkQZHOnN28B1WNZx0MQ==
X-Received: by 2002:aa7:8c53:: with SMTP id e19mr22646004pfd.264.1591054606599; 
 Mon, 01 Jun 2020 16:36:46 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id k7sm452101pga.87.2020.06.01.16.36.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 16:36:45 -0700 (PDT)
Subject: Re: [PATCH v2 5/8] hw/pci-host: Use the IEC binary prefix definitions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200601142930.29408-1-f4bug@amsat.org>
 <20200601142930.29408-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2aa683fc-ff9d-17ed-a35f-f177bb5c9e77@linaro.org>
Date: Mon, 1 Jun 2020 16:36:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200601142930.29408-6-f4bug@amsat.org>
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
>  hw/pci-host/i440fx.c    | 3 ++-
>  hw/pci-host/q35.c       | 2 +-
>  hw/pci-host/versatile.c | 5 +++--
>  3 files changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


