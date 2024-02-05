Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7647C849F5E
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 17:18:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676376.1052532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX1fR-00079t-B4; Mon, 05 Feb 2024 16:17:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676376.1052532; Mon, 05 Feb 2024 16:17:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX1fR-00077X-8W; Mon, 05 Feb 2024 16:17:57 +0000
Received: by outflank-mailman (input) for mailman id 676376;
 Mon, 05 Feb 2024 16:17:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W3Sh=JO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rX1fP-00077R-UE
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 16:17:55 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1cfa0b6d-c442-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 17:17:53 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40fd2f7ef55so9959165e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 08:17:53 -0800 (PST)
Received: from [192.168.1.10] (host-92-3-248-192.as13285.net. [92.3.248.192])
 by smtp.gmail.com with ESMTPSA id
 iv15-20020a05600c548f00b0040efd192a95sm9143064wmb.1.2024.02.05.08.17.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 08:17:52 -0800 (PST)
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
X-Inumbo-ID: 1cfa0b6d-c442-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707149872; x=1707754672; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SFHnnRYvvg5yc0tc4E6hsQCgxM3uca7VhuRJZIGmQk0=;
        b=kbFBIiOddvN/tYo4hTO9s5Pp0MM/n08Z47xF4+7nsOO8acWSkUdBxfurPyNNDXJdvP
         kGgIrTJNvk4F04amWtjFGkcLD9IXZR32Eq2ZNyRP4VdH2RT7gzcVUpU7YjNvwEe9YC8Q
         aECyY1ctlxeCkjABwztcGeggs9ydL9T/aHL64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707149872; x=1707754672;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SFHnnRYvvg5yc0tc4E6hsQCgxM3uca7VhuRJZIGmQk0=;
        b=xC3iwww5FXV7P3qtNNfJeLVtsM1br+m89PX8niEzBznSM7zqrkSl5gBXcCQQfRMH51
         6zvdIzKpaxuJDPuK1kXL3bhlRudscG+uhYfepUz54cNio34CHyFD+v917pdmdWcS2z06
         2AS5mJrtggjHOyEyfEaYyBqFwDTAyRVzFOlljsl1pxyN1u0L3gH46z7ia9Ebu9QMkKdn
         XejckiDYNxbUYZtDPX5n6T3+/TPeIVAS+eCAW24/VoburLLkqwllulSHM1QZx8lKR7q7
         AgY15ogxgi56bqIMdfh3zExIKQ5Jg9rTo6LmwFe9jB8oGzCzDqLVXm4unUWnb13/wqiU
         TJiQ==
X-Gm-Message-State: AOJu0YxX7xsgB2LNpfdaihuzcyO/wBavBRfzH/e6JDkfbgTWN8kzkJnc
	iMx8Z5SAN5/4MxbgUOI67T1YDQe65FFbMpBXg/ZTPuVWny/CnzsX2T7jwbsidiQ=
X-Google-Smtp-Source: AGHT+IEFE3O30I7b2utP5Ec0cHpJvsnTFE4pou9vjqlemwSzGuXijm8OW4ScQywqPWtHmsrzz9J5Fg==
X-Received: by 2002:a05:600c:4f04:b0:40f:d242:a2d2 with SMTP id l4-20020a05600c4f0400b0040fd242a2d2mr97981wmq.12.1707149872349;
        Mon, 05 Feb 2024 08:17:52 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCX75qYoglkKH4/8z/AgN3JxK2+6XW+3JX/nTTNiP1859+bH4mqcPgA3U9Nro0yCVkvzteJReDG/Ea7765bRL3ezv4LOJ1QuKpCBL/1fSnEpp1QGwXRsLEUB9qs=
Message-ID: <11c0cf19-fe89-4ea8-acd2-8f165969b1dc@citrix.com>
Date: Mon, 5 Feb 2024 16:17:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpu: Fix mixed tabs/spaces
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240205141441.1880188-1-andrew.cooper3@citrix.com>
 <cb716326-4a1c-44ce-8d00-ec46cb112242@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <cb716326-4a1c-44ce-8d00-ec46cb112242@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/02/2024 2:33 pm, Jan Beulich wrote:
> On 05.02.2024 15:14, Andrew Cooper wrote:
>> Fixes: 660f8a75013c ("x86/CPU: convert vendor hook invocations to altcall")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Without the (or at least this very) Fixes: tag
> Acked-by: Jan Beulich <jbeulich@suse.com>
> The patch you mention didn't touch the padding at all. (It also didn't
> correct the prior inconsistency, but that's mainly because I didn't
> even notice.)

Oh, right.  I'll drop the fixes tag.

~Andrew

