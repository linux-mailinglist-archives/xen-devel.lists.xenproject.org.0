Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE27650D15
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 15:14:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466135.724990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7Gtx-0003Cy-UX; Mon, 19 Dec 2022 14:13:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466135.724990; Mon, 19 Dec 2022 14:13:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7Gtx-0003Ae-Rs; Mon, 19 Dec 2022 14:13:57 +0000
Received: by outflank-mailman (input) for mailman id 466135;
 Mon, 19 Dec 2022 14:13:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u+i/=4R=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1p7Gtv-0003AQ-Vr
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 14:13:56 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ef9fc8e-7fa7-11ed-91b6-6bf2151ebd3b;
 Mon, 19 Dec 2022 15:13:55 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id h7so8764375wrs.6
 for <xen-devel@lists.xenproject.org>; Mon, 19 Dec 2022 06:13:55 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 u18-20020adfeb52000000b002423dc3b1a9sm10072017wrn.52.2022.12.19.06.13.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 06:13:54 -0800 (PST)
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
X-Inumbo-ID: 5ef9fc8e-7fa7-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nl4BGj1PyLBerZrWWS1NwXWllkrPCT7tq7b1VOTopDg=;
        b=Qoq1oc3WR/h+dr5nNxVF0P7U/ZkhFAEPkpf+fYnizATJ+5xL7j35kQRZlFPbDPYY6c
         xJ87qjQrF4tMPIewqjhAqQrO83nQpxuUaIk8jNhy/p3QqhwSRIlWhzki+GNhGPPoG5C0
         CNYt5ZkwEwcQIgYOHRqOtrZ+AXFqI9J/6J5r+RJ4DODPoxNNmlTVzRYWOtbR3RO7h6dH
         arAMC6XqWrhiNElK5I5Y8veR6sltuaZK3dnQXQHLIaG+vT7nPYnivs1S3YALat+eBHQf
         ZANg1H+/TYJ3rRMn24mhTyfWr76k9AvneEMnhGGVK7lIH9aqaGPda+t73IjSWL2d4qQa
         eNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nl4BGj1PyLBerZrWWS1NwXWllkrPCT7tq7b1VOTopDg=;
        b=XldZxe+gVHJgnYnumStCDD0xYPJXISXWJLlHxuILeVKwZEdYpVUCUfuZMlPWPu/Xc9
         YUlnCgowN0NW3kWJEPi4DedRVszNMiEjQG6w+y5lxoY9Ksgre/iuFWG+Cvxos5yMYcLb
         MOZHkcb0H+97xxyZ808cjj8om1Ks9WCf6qdCCjxhVR97Ee/9z4khhwDLOxBNa0s7KDJV
         nlgKtqM1yS7pob2iAHtTwAuAe5wtaubpgW0z4Yv5fVHIPkmLblaoaXN0hGZPf1zyJEpa
         Hz/oHyu4Su4YHDbkS6iFSPM09iuB1OIv6AhJ0IAU58KqytuDEB6WjpmgFDznTrWaubjr
         2qWg==
X-Gm-Message-State: ANoB5pm/nXJled6KvxJBn5k5CF1g30zLPV9WIDEbnpzZS0Dw7lOZH6ZD
	poLaCKxXiSQUEWB18vXCf+DXiQ==
X-Google-Smtp-Source: AA0mqf5JZ3r27fj5zYU0NkvBmgVgehhQjiBRs8UlsMH+e7JchlrgCR43+KyfXv8Tqx1/1uR9NmQ+jw==
X-Received: by 2002:adf:e992:0:b0:242:4035:622 with SMTP id h18-20020adfe992000000b0024240350622mr28575482wrm.31.1671459234482;
        Mon, 19 Dec 2022 06:13:54 -0800 (PST)
Message-ID: <542d86b6-3ca7-a1c4-51b1-af73d5434f57@linaro.org>
Date: Mon, 19 Dec 2022 15:13:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 4/6] util/error: add G_GNUC_PRINTF for various functions
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-ppc@nongnu.org,
 xen-devel@lists.xenproject.org, Laurent Vivier <lvivier@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, virtio-fs@redhat.com,
 Michael Roth <michael.roth@amd.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Paul Durrant <paul@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 David Gibson <david@gibson.dropbear.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Greg Kurz <groug@kaod.org>,
 Thomas Huth <thuth@redhat.com>
References: <20221219130205.687815-1-berrange@redhat.com>
 <20221219130205.687815-5-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221219130205.687815-5-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/12/22 14:02, Daniel P. Berrangé wrote:
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   util/error-report.c | 1 +
>   util/error.c        | 1 +
>   2 files changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



