Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA80A8674F
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 22:37:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947868.1345482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3L7v-0003K2-SZ; Fri, 11 Apr 2025 20:37:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947868.1345482; Fri, 11 Apr 2025 20:37:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3L7v-0003H5-P3; Fri, 11 Apr 2025 20:37:27 +0000
Received: by outflank-mailman (input) for mailman id 947868;
 Fri, 11 Apr 2025 20:37:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cS7z=W5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u3L7u-0003Gz-Fv
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 20:37:26 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c65037a9-1714-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 22:37:24 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43ea40a6e98so21656695e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 13:37:24 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f2075fc99sm99736345e9.29.2025.04.11.13.37.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Apr 2025 13:37:22 -0700 (PDT)
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
X-Inumbo-ID: c65037a9-1714-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744403844; x=1745008644; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BldrPVfIQESeMIsapKQksSXRFPvAdGURowrke8ew/hQ=;
        b=lg4/9otxwtXpIYiIjJUsP1AaDLiLcPAixfZdvj+wahCslPJM5FvWUvPHgg18On0ID+
         7HJ3T4rjS5o0hujX7gwZo5FSWtYCuzdJ8ZvDMvvX0l/61GnY3ZtZXGJvXmlZquCcq7+s
         cyw9Xu4eTqRLd/odnWbUD9z9ILy/D7k6iXVEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744403844; x=1745008644;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BldrPVfIQESeMIsapKQksSXRFPvAdGURowrke8ew/hQ=;
        b=NeUQL00VzOlqZNQgs1Jnv76B+TlWb9fVC5KISynmtzhomFz/82fIGV6agWpwjwwrRE
         S4LB1uAHcuVbu89brOYiuG4vN00+7/hBQ9yKJxQqMhyQm8if1CjRDnH9K0dQZDz8eAde
         ZzVc7kuDlfTNrP9B44ohbQplPhUfx6uRh/aoJSNOCPqkM6Z/c9d59zzgj0wzOdslWwo/
         hwKoMs1Kv+z6953D6oBGxxWo3GTwgr9TQPRXKVtio0PIY8zrA3p51R5r9+/i86GXdIkf
         My5k0M8Q14wBssrbm5FQ0GlUXEr3bw65KMIj1xyWpxWe4LXnNfoPqCdFVMQLaauMTI58
         Cy8g==
X-Forwarded-Encrypted: i=1; AJvYcCVRL6IwmYx1HYbCeqolNsvAcVjSRqd3XIjLrpw1OyqLn4bjHl7xGwLSYhBjyXEl/cX+FnsmEvuo7K0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwouvsXj8QR34Awl2jDY/XCiiD84IYyiYDcCD8JdHiXgVtPcajn
	33Lggi9j9UzWk8e+HnDW4omCK44AZBi5yXMuCdWi27ZMWEWqbNmezXzd66bH9Y4=
X-Gm-Gg: ASbGncvz7ea5kTX3fGP6txfeS9omPbOnOsW3X12b/sOIq/Z2DLZb0juEH6h2cdKqCmf
	xsNJsImY9LiXOuMXaJY6f/WcdVqEW85OrTauhAxieHlFj/1U/RQzoqTUghVgwEwWPw6A4qRD1j4
	pTlRRGhWIIRN0DwZ+9yISRGmP2SnaT8Lpv22MqPtmld2/FQd+9gVjtKVaoIhl7uea91acCvgX12
	EHmORXg0SGPeYYexUc4mMyaGmZx2//9Znk0vxNyl8IhfD5qvP+UOjf+PV7zIlTgJodLwLv1Yw25
	U/K2cY7EWPrbYxKC7hKv2ERYKomBHyUz6dXOHSQaKVqur8iTRWx3idc9eamLHpnSpEEX7A4IyEO
	VvNjhmw==
X-Google-Smtp-Source: AGHT+IH0QL9ucguHRKkteX//RYL6CZhIksBdPwm28e/uI1U15yPd0MwmCGPPFqt6ygOJ+MbiagncUw==
X-Received: by 2002:a05:600c:4e13:b0:43d:4686:5cfb with SMTP id 5b1f17b1804b1-43f3a9add63mr42820185e9.27.1744403843830;
        Fri, 11 Apr 2025 13:37:23 -0700 (PDT)
Message-ID: <76cbff87-3afd-43f1-a1e0-716a14074a32@citrix.com>
Date: Fri, 11 Apr 2025 21:37:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] CI: wait for Xen to start before waiting for test
 to complete
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.146eb3617cc9cf442dd4fc7a0a8950fb1bc191c8.1744403499.git-series.marmarek@invisiblethingslab.com>
 <3f1ef15b54a84573576e647314ec61ea43d4e3af.1744403499.git-series.marmarek@invisiblethingslab.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <3f1ef15b54a84573576e647314ec61ea43d4e3af.1744403499.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/04/2025 9:32 pm, Marek Marczykowski-Górecki wrote:
> Add additional stage in console output parsing - wait for first message
> from Xen. The message is defined via BOOT_MSG variable. This has two
> effects:
> - distinguishes failing Xen to load at all from later test failures
> - resets timeout when Xen starts loading
>
> The latter is especially relevant for hardware tests where firmware +
> network boot may take some time before Xen starts booting. The two-stage
> timeout is more robust solution than increasing the overall timeout.
> The issue has been observed on some dom0pvh-hvm jobs, at least on
> runners hw3 and hw11. This patch is a first stage before qubes-x86-64.sh
> is switched to use expect in the next stage.
>
> While at it, consistently use 'expect -re' for all matches. This
> especially allows matching newlines ("\n"), which will become relevant
> in the next patch. And document variables used in console.exp.
>
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

