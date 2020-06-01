Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 109501EB243
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 01:37:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jftzi-0006og-M4; Mon, 01 Jun 2020 23:37:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zqDJ=7O=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1jftzh-0006oN-Bs
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 23:37:25 +0000
X-Inumbo-ID: d892e504-a460-11ea-81bc-bc764e2007e4
Received: from mail-pj1-x1042.google.com (unknown [2607:f8b0:4864:20::1042])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d892e504-a460-11ea-81bc-bc764e2007e4;
 Mon, 01 Jun 2020 23:37:24 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id fs4so488206pjb.5
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2020 16:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PlBT1B/hjs0RZ4Sv/xaBn5v/munjW/EVMnZ0HWetFtY=;
 b=h0ouO/8u5iRqZlDoPrAMhkSSqFRTrfSwQdo19a4i9ahzvmGjW0r6DS5w0CXaMbbJtL
 /So9QK85DTtEQdWnTr0axxftFQZvGnF2jLt5EJ82ylkw5vJgvgWrdemTxnGl2T/EDVPy
 tkR6x9ZtBtuv7G7WnqinFAypKDbsLrHF/El7N5SmOAmTwcd1ObkvDQR+XLnQz3/9dSLv
 0ZcCXDtQJwZmlIpqQUJaKcsDiDMKHRBkg+3uD47Izs61TD3fhbbFgPUiS3tX1lMruyO8
 oXK1ML5f8Zah4SLGKt/6mY+IX6klJBO8Hynj6yjeHoSrie0ul9t9XWocNqYuw8RjfcaO
 h/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PlBT1B/hjs0RZ4Sv/xaBn5v/munjW/EVMnZ0HWetFtY=;
 b=hshqRu888yUQTP48XBnPkL8nqLOkRkYoxYhQ7PYa1zSqs7EBmiUv1RURT/rqcJHGrP
 viPp7ah3XhnaW1sknPEfV843RrWvEc2cuQj0CWn5p9eH/SVa0WTshC/T7REuwMbau2Qx
 GZCsVn9/tZfff6EH9coSA45/u2jXRXvIocf+Wov8Buf8B0P727hUmXae/VyEU/4OYDjq
 LB5rwpCB5VlMYfFTOVlhXbSs9af8RPjbLyX+zXeoh7OVM1NoqmJ2Nux5ySShNbHA9VYk
 M3oGjZw2xCgBF2kx76DDGJsqgIAYrXvrREZexC+kTONgeMm4BbcWNF+ozpq5L+KIBscT
 Fa/A==
X-Gm-Message-State: AOAM530vTCf9t8QIP/NlzHKlYBTaaBXDykC4tJifnxzax0h988LdI20r
 kSe5wJbvrzhb08obq3rkrlAEYA==
X-Google-Smtp-Source: ABdhPJzzzU+9Uf4BtnV7qNbKvl+iUuKO6qwD6miyTuur8YHPtfQ7XV0BnKoxEbCJaOSgLcuxhYk+Pw==
X-Received: by 2002:a17:902:710b:: with SMTP id
 a11mr6593788pll.156.1591054644135; 
 Mon, 01 Jun 2020 16:37:24 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id l187sm400253pfl.218.2020.06.01.16.37.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 16:37:23 -0700 (PDT)
Subject: Re: [PATCH v2 6/8] hw/hppa/dino: Use the IEC binary prefix definitions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200601142930.29408-1-f4bug@amsat.org>
 <20200601142930.29408-7-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <57783e28-09e5-8545-7a90-e52ad0dac9d8@linaro.org>
Date: Mon, 1 Jun 2020 16:37:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200601142930.29408-7-f4bug@amsat.org>
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
>  hw/hppa/dino.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


