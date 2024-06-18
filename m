Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C223A90C882
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 13:09:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742995.1149890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJWhp-0003ht-LV; Tue, 18 Jun 2024 11:08:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742995.1149890; Tue, 18 Jun 2024 11:08:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJWhp-0003ek-Ht; Tue, 18 Jun 2024 11:08:53 +0000
Received: by outflank-mailman (input) for mailman id 742995;
 Tue, 18 Jun 2024 11:08:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2ol3=NU=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1sJWho-0003ee-6I
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 11:08:52 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24ab607b-2d63-11ef-90a3-e314d9c70b13;
 Tue, 18 Jun 2024 13:08:51 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-57cb9efd8d1so3364548a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2024 04:08:51 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.212.55])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56da4486sm607939266b.1.2024.06.18.04.08.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 04:08:50 -0700 (PDT)
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
X-Inumbo-ID: 24ab607b-2d63-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718708931; x=1719313731; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TUa1inIX9KdwJHKeGFbDHGO0EDxxcgeVNNKp5ffKjYY=;
        b=Pf+dce7dXMNoVrgUQWLwSoCuWxN2zYnfhvFuU1uvsoTwJXRL/8TtnQrsN5uctLsaaY
         Lkch4H6ojtkrMxnAsXfFaTsHUo0zxfn+sSI5G6frkThK5cnuFDjnxmrKbQBt7XOlpdcn
         bvv1DVH14GjPOVGR0LSt0ui9Wn74/yk/U+Z2oWu7cpB7Bhbs7alsHJ5zJwYce/PlhNFN
         gcFme9SFkBYQ6nw5UoQMRlwg4xe/98FTq+NVw+a98NQXruPee6zmFQzsaROrJL8z90Wl
         j1ptqUGHkPPngk17mxWssUsSUJKtJCFNfh+MEMyNIa6F1+5rcdjvdoemeFYIEqUpnP8N
         zUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718708931; x=1719313731;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TUa1inIX9KdwJHKeGFbDHGO0EDxxcgeVNNKp5ffKjYY=;
        b=VrdAGxUt7UBtIBJNaLeesWd74XGh4iQtStCoOXayAdWrRk8pHwWBprBEzmoAZUk+By
         kP87YEhNDcgRQETuXhYi7gOTF5tyRGRT49eLBYTFJ9A4PfCSV0cdO1j3RAwcpP9SyTyz
         1/+WtnIs1C9OX7n759Msqx0jobKx55LlZe9xIMlp5sQBK6yBYJ4tGfg6Cj60vXF+nMlq
         zbSwJ13nqmmn0AQwrsJ4eCWZiOYFIqA2btb0aHFi8XeOZMOXz0tw9WN2EU43YDCDx73L
         2IZ8681sZQA2lZ2ZqHdO4mqWTg6fVAcJYE0AmrxzsIVF6zklNp3N8NuJg/6zpHVlw2Wn
         bmOA==
X-Forwarded-Encrypted: i=1; AJvYcCVtrTzkP6S3R/RlzFQtXSdFJtrxFtEfWA9fWVecAZpZ2c9o4QZVU+7o+xM3ETTTSX458ac/WDth+ta6sWku6c2hODmkQ9S9cNPAFpCDL1w=
X-Gm-Message-State: AOJu0YxQD72QdteWprpkDd2EYOoiipVLfHnvdPw9XR+5ZMfd5GL+HPeD
	bFnlyDM62lawF0IQxjkNNCOsk8nNDjqEkyyiMrJNlyVcJ06gS+vPOIQEehOFfEc=
X-Google-Smtp-Source: AGHT+IEWOyL7yTFsmsSyir5tQhxbluhVNQhJn74o5D642Kwf7mxM1ofGsp9yGSyxaAEYq/J2aUUHkg==
X-Received: by 2002:a17:906:b318:b0:a6f:259d:9a5f with SMTP id a640c23a62f3a-a6f9508e83cmr133167066b.35.1718708930655;
        Tue, 18 Jun 2024 04:08:50 -0700 (PDT)
Message-ID: <01fd70a0-30e3-45aa-ac95-ce36e593a264@linaro.org>
Date: Tue, 18 Jun 2024 13:08:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] stdvga: fix screen blanking
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org,
 Anthony PERARD <anthony@xenproject.org>
References: <20240605131444.797896-1-kraxel@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240605131444.797896-1-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/6/24 15:14, Gerd Hoffmann wrote:

> Gerd Hoffmann (3):
>    stdvga: fix screen blanking
>    ui+display: rename is_placeholder() -> surface_is_placeholder()
>    ui+display: rename is_buffer_shared() -> surface_is_allocated()

Since Marc-André reviewed, I'm queuing this series, thanks!

