Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B60ACB9EC
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 19:01:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003718.1383317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM8Wl-0006a3-HB; Mon, 02 Jun 2025 17:00:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003718.1383317; Mon, 02 Jun 2025 17:00:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM8Wl-0006YA-EY; Mon, 02 Jun 2025 17:00:47 +0000
Received: by outflank-mailman (input) for mailman id 1003718;
 Mon, 02 Jun 2025 17:00:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QKOU=YR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uM8Wj-0006XV-Vo
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 17:00:46 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f2a9802-3fd3-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 19:00:44 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-45024721cbdso36872105e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 10:00:44 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d7fb0654sm129639425e9.21.2025.06.02.10.00.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 10:00:42 -0700 (PDT)
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
X-Inumbo-ID: 1f2a9802-3fd3-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748883643; x=1749488443; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XaF1XeDmFm5BPaAg7i67sCNl7+5PLTKIgay5hbJydTA=;
        b=VBL97N5PDFjtNHHfdCaq7bVRWqGV1H+cHiCIm8dBTMfIp6GF6N3bibuZNHwZkvhc2e
         YLauuoczYdHjvTbhRPxjyQiU/mXMy/aXtJS2ATeBtMk4ZODzmrI1qxmUvjqNihqQ6uCn
         E6LeHEWBEqmX8Xo3b9oa3WvTVJT9yqwTfvbE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748883643; x=1749488443;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XaF1XeDmFm5BPaAg7i67sCNl7+5PLTKIgay5hbJydTA=;
        b=FWFlb7dMfAS33AYcAc3f09IVOWWyJS+GJakOnSXsbc53rERQAWcn3bm+IomYnOSWe/
         GU8dduFbiiSJ0aiSYq5QwNgtP17/JSAO6HPPFrLKGBAoblbN/pi1RE7yoj7MflsUhv70
         eZ0CFghQRPUpQiVx8cNsFB6c3kopIrAMp+QPkdjWJ6Wfeyjm+9+uGcWtRf6TNgJhJecF
         ZuRZsbPvsO7UEu+TK57crACeOtNYENbynqfklMAVA7oHmFibiC/bPxZZNKQlfg4fpFyh
         KhEmaf1iaRenVbRqwNAb/9a9gCqzwFsTx72H01W56n768odejuqk4MJVYGSL5hjfnaoY
         hq9w==
X-Forwarded-Encrypted: i=1; AJvYcCWR0a1JpPM15xb5dcsdVaZpDZA7txLiOeGL9l6rJvLIoPoISYq32V1I9arotplR1/NADBtlcWnyTKY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywg7VF/pq7XFbSO23Ph2mAGgm0JUxxJlkC3SvdHQrl2Ui1+uaW/
	7Hg0UQZYT41YZIMteUt935hi1Z/Uwdqqyw3r8m6ZEkCI8bPFTe1ofEKQPVLhPYNGEoU=
X-Gm-Gg: ASbGncuFZCpaLzgGpySLPbOyEdhcS3O5mqFetYSEbBIc/hQJY1+kxcbgBQnXI+Bqapl
	RVNKgw0BBBN8lcQ9+aJVuMWcoW6azPwRY50muP87zJos2I1nhbh1MgMNBwGL9xqMBX7cZWJlHw+
	swLCMYoHgYoD3F1nzHHWIAgYKcsz93ZAhkCaNFKlqj9om9hmMSmzNS2dq4gdAxaZGdDEin/6Cwl
	hxgKhLbCnJTk8H31xBWb9ZHW8nqqdnP8LIHMoB9by0F1evW3eqOYhd0PchYTWoWD83niJlzGIeC
	fC6ygECEmeT2DJJRKqN4soxv7B6xnJQP7IYFy2URFdCiU9CU4AVN7mf2CGWVHhhKtZHGyqMmmpD
	N18UZHErKpyLIj6sK
X-Google-Smtp-Source: AGHT+IE0WcvOIbm1gMLspAkTw/IBE4RQPOaCldLN4vUmdCKi5/liFVNT7fVSWGNkvisYsZr4yD5Abw==
X-Received: by 2002:a05:600c:5342:b0:450:ddb7:ee4d with SMTP id 5b1f17b1804b1-450ddb7ee6amr67661105e9.24.1748883643515;
        Mon, 02 Jun 2025 10:00:43 -0700 (PDT)
Message-ID: <214c8863-5cd4-4be9-948e-e44b67f541bd@citrix.com>
Date: Mon, 2 Jun 2025 18:00:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/19] x86: Replace boot_module with bootmodule
To: Alejandro Vallejo <agarciav@amd.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
 <20250530120242.39398-11-agarciav@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250530120242.39398-11-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/05/2025 1:02 pm, Alejandro Vallejo wrote:
> These types resemble each other very closely in layout and intent, and
> with "struct bootmodule" already in common code it makes perfect sense
> to merge them. In order to do so, add an arch-specific area for
> x86-specific tidbits.
>
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>

Yet this is a distinct backwards step in terms of legibility.

How about modifying the common code to be more legible, rather than
regressing the x86 code.

~Andrew

