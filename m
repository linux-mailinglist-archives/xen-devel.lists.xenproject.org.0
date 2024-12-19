Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2893E9F7739
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 09:26:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860863.1272840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOBqd-0004yy-UE; Thu, 19 Dec 2024 08:25:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860863.1272840; Thu, 19 Dec 2024 08:25:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOBqd-0004wM-RD; Thu, 19 Dec 2024 08:25:31 +0000
Received: by outflank-mailman (input) for mailman id 860863;
 Thu, 19 Dec 2024 08:25:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4rXU=TM=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1tOBqb-0004wG-IC
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 08:25:29 +0000
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [2607:f8b0:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd3c6893-bde2-11ef-a0d7-8be0dac302b0;
 Thu, 19 Dec 2024 09:25:28 +0100 (CET)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-7273967f2f0so630071b3a.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2024 00:25:28 -0800 (PST)
Received: from [157.82.203.37] ([157.82.203.37])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72aad90b2dcsm731694b3a.171.2024.12.19.00.25.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Dec 2024 00:25:26 -0800 (PST)
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
X-Inumbo-ID: cd3c6893-bde2-11ef-a0d7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1734596727; x=1735201527; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o67QXlwUSaMvrSq2RNzS6auV65CBM03JHc8UWQQqHC0=;
        b=qkAUyzHa5X2C3WH9VCbeL21WWP83dxNkLC6vPnL5oXp6bbpZw35DOwjncaVMMasO9L
         E+vZPfxurjCPGKBq9LVAU+qUgBSecrex/BNoSqJ4jZbxhuCDihfeLo9RNOh9TlpI9ttI
         qm+yi9zDVTWPcSKGZuSlwbB3LG2Ve/DZKy27+F/Z164CS3604M6me37tv3DK7lxv3Xx4
         1JNYGtwVqSAkkfDJWbOLWwJeAb2/pidETbQC+7ZJ9QRi8HCdCU82J+cZ+xe904xAbh19
         6t1mufiH0Al5gedKFLEbhzBsX9giP0YR/uhtCP38k4kRhBCKS7+gDwUPsGBiwvs5ZjNj
         n5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734596727; x=1735201527;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o67QXlwUSaMvrSq2RNzS6auV65CBM03JHc8UWQQqHC0=;
        b=A2h9pXTlssW98k91GmyZEqMz8pI6CiFQXIeyiIJjyAaVIdfFpy0vTSmvcjMsE+WhBu
         wk0NGBnsPUoFy3Uo5Kz4FARZIyV0q/z50KhlmAVz0O9GouTSFX/gdC9CFJwRe1QjGZcf
         8qaG22Ohc/fVQQL8gms6PFEk1nDWJ/jwUxRPfG+FH21XSocSrL5pIN+2rhRzOl9UJmcU
         I1xXv8tw6pQ8zLMp8N7bgmkYXBVnnZ5Hb5lo+phkB4+1hFSLULaFjJcwga0FNbJ72zbi
         8WWr++RLSWBkxw02V7bg54YKnPKkzx0luMsnEg+mePJxemZqbB9SdYCHhBtHr1LGv+s+
         URsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCIefbw504tAiBiyoHVtJdlDiwVczDEHDU8ov8gbTvZwX2mM6VM+Tf5oJqQGua4tNq4mwksBH5hho=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzVy0Sejrds3A2yUwp5XljJwa5T9Dc1wkPB1tYFAmd1ta2RqOgC
	tawiE+OId2UTlRSEgEwrhT3C1FIEdpntdB8xe7nHLLc9yvxTVpjFl2oFbcHwYrA=
X-Gm-Gg: ASbGnct87fM0DYMo5w59NgydzA9yagqSCXDJM/I6XPg718bzVcT9tdkbyArGeTBr3gU
	qhAJ/91k+YH18SFdZLq0kVtSJEEhXsOm/8Bmlfc2nYKkSX7KBEonU3EygHuQSpG0lBPWBuLHSr1
	OKVMI4g171OmiHlN4DKjQpJWaXYDWmQfqJTYuupcOXOz11LIxJvpT5LJxI0NYWFCo5b7FA/l0FU
	ImEDcX+VVvZf1sFiOYdEM3cfthdziTo/pwizVEj4I9ddqqGRGdMGjqK0B2CZApHgD0=
X-Google-Smtp-Source: AGHT+IFQJijP415U6JCAjCp82uq02Rg1oj+u9Wub9o3NGSctFU+2+abvxdsWCEhdbfKwmOkWOvHyhA==
X-Received: by 2002:a05:6a20:7faa:b0:1e1:3970:d75a with SMTP id adf61e73a8af0-1e5c74f3244mr3839079637.9.1734596726802;
        Thu, 19 Dec 2024 00:25:26 -0800 (PST)
Message-ID: <6c0ed1a4-d416-4d52-bbfd-40faadac35c4@daynix.com>
Date: Thu, 19 Dec 2024 17:25:17 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 41/71] hw/net: Constify all Property
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Jason Wang <jasowang@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Pavel Pisa
 <pisa@cmp.felk.cvut.cz>, Francisco Iglesias <francisco.iglesias@amd.com>,
 Vikram Garhwal <vikram.garhwal@bytedance.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 Bernhard Beschow <shentey@gmail.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Steven Lee <steven_lee@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Helge Deller <deller@gmx.de>, Thomas Huth <huth@tuxfamily.org>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Jan Kiszka <jan.kiszka@web.de>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Sven Schnelle <svens@stackframe.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
 Rob Herring <robh@kernel.org>, "open list:Allwinner-a10"
 <qemu-arm@nongnu.org>, "open list:e500" <qemu-ppc@nongnu.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20241213190750.2513964-1-richard.henderson@linaro.org>
 <20241213190750.2513964-46-richard.henderson@linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20241213190750.2513964-46-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024/12/14 4:07, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>

