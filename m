Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D906B7EAFD0
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 13:26:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632354.986638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2sUE-0003Pj-Uh; Tue, 14 Nov 2023 12:25:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632354.986638; Tue, 14 Nov 2023 12:25:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2sUE-0003N5-S4; Tue, 14 Nov 2023 12:25:46 +0000
Received: by outflank-mailman (input) for mailman id 632354;
 Tue, 14 Nov 2023 12:25:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6V1E=G3=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2sUD-0003Mz-Bx
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 12:25:45 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee4f6a23-82e8-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 13:25:43 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-53e04b17132so8617674a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 04:25:43 -0800 (PST)
Received: from [192.168.69.100] (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr.
 [176.184.25.155]) by smtp.gmail.com with ESMTPSA id
 rs4-20020a170907036400b009a1a653770bsm5412508ejb.87.2023.11.14.04.25.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Nov 2023 04:25:42 -0800 (PST)
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
X-Inumbo-ID: ee4f6a23-82e8-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699964743; x=1700569543; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/OaNUIXzZbTozIX8X4xF9tfJTPhcFd4ZMAc/W8lKR1s=;
        b=zk8DWupF9N0cmWp66FR4v1J33Xs3YMYJPyNA/noejWJ/G3ZnqbJvkrvcT5iVpC9Ef3
         Nc4e383D0qYfnRvTZnKwHrVhbObKqHuIUBg7AtZndT+UrTIZrZQ2gAwzVZMTqOEKdoun
         15evxMjzMic/nYEnDrFyiVhgCc21KQlxkJgtSkY78JhhPEPOuG7+5+62oEExfATho4Uw
         s7wiu/YxL/xRUiflPV4n2tF3X5JH+xMkLznVIPxnYuFbuvflI/yVHVLKQm0YmJuDSVMI
         V1VNF6tH2MAyyrasl9CAtDQ08LxJ1Fa3c2yKMN8rmAkxPB8RUTx5xL6mnmoy6bAa6Fx5
         +1Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699964743; x=1700569543;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/OaNUIXzZbTozIX8X4xF9tfJTPhcFd4ZMAc/W8lKR1s=;
        b=h0jhAFzpYW4TztaaqAsnyiFPZUwSWClIDkJ7613JQjIkJyfPFw0TAaYzxHyP178+N+
         7fzUX5pPlBOaJiVo2U8jQnpzEaCziwm1INGoOFrgq3cfZ7q6PzzWRutwtX+owwMnsNtu
         axtlAZ2DvyrUT7vwb3Eqkwhq2r5+/4dktadQsA5Jndp8DwUQvP0u0f7pPjy/WOQAvuTa
         nPGGBrFCDbSVMskAjHdvgULuq6plkmlkm3oDw08QZAjKQlHr74NakqqEMsusuz6cu61P
         WmD10ZQw+U9UZ3RRSTBpUowrtAQ0wdc+vFcgeYecpHa0+jRyKiy+ZmLNDNmUUnUDlehu
         Mt6w==
X-Gm-Message-State: AOJu0YzvjHFTwDaF2bFtCfNRogrbJoCEDBnpkst+2G3d1olfRRQ1udKN
	XG1wk0R+pNqs9CzlkJkIKvlmkg==
X-Google-Smtp-Source: AGHT+IHM6IuBxGUDmhvjGjE56b7qH2UrMdIaZaFuXREseUVLlPhT1pToLbIdRgtL7O9mZ4K3ubCdVQ==
X-Received: by 2002:a17:906:5245:b0:9e5:2b1f:13f4 with SMTP id y5-20020a170906524500b009e52b1f13f4mr6552715ejm.42.1699964743415;
        Tue, 14 Nov 2023 04:25:43 -0800 (PST)
Message-ID: <86153cf2-129d-4e1e-8949-786764bdf607@linaro.org>
Date: Tue, 14 Nov 2023 13:25:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 07/10] sysemu/xen-mapcache: Check Xen availability
 with CONFIG_XEN_IS_POSSIBLE
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Paul Durrant <paul@xen.org>
References: <20231113152114.47916-1-philmd@linaro.org>
 <20231113152114.47916-8-philmd@linaro.org>
 <9ba10b4a92ac6782d0c581b1e1ee5d5efee44c33.camel@infradead.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <9ba10b4a92ac6782d0c581b1e1ee5d5efee44c33.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13/11/23 20:52, David Woodhouse wrote:
> On Mon, 2023-11-13 at 16:21 +0100, Philippe Mathieu-Daudé wrote:
>> "sysemu/xen.h" defines CONFIG_XEN_IS_POSSIBLE as a target-agnostic
>> version of CONFIG_XEN. Use it in order to use "sysemu/xen-mapcache.h"
>> in target-agnostic files.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> Noting that CONFIG_XEN_IS_POSSIBLE is for Xen accelerator support, and
> may not be set in all cases when we're hosting Xen-compatible guests,

As is CONFIG_XEN.

Maybe be worth renaming CONFIG_ACCEL_XEN if you think we need
guest hw specific CONFIG_foo_XEN variables.

> Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>

Thanks!

