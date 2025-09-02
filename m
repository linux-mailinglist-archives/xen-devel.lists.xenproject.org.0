Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D675B4089B
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 17:11:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106970.1457560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utSev-00021l-M6; Tue, 02 Sep 2025 15:10:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106970.1457560; Tue, 02 Sep 2025 15:10:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utSev-0001yw-Ij; Tue, 02 Sep 2025 15:10:57 +0000
Received: by outflank-mailman (input) for mailman id 1106970;
 Tue, 02 Sep 2025 15:10:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a4ch=3N=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1utSet-0001xZ-BS
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 15:10:55 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 056b78ff-880f-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 17:10:54 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-45b8b7ac427so14627385e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 08:10:54 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d690f2edf1sm9386403f8f.16.2025.09.02.08.10.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 08:10:53 -0700 (PDT)
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
X-Inumbo-ID: 056b78ff-880f-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756825854; x=1757430654; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mqq8qu84oGzDsYr4FpIoL3NcNzsNZYmrqTXhCI2Lm3o=;
        b=dc50tKqtP5Xe3okvgx7TNCbxNNXNlbo9NQkQusnhKy9o0yEl0V8NyTaHThGDZ8eOE8
         Oblv6sn0UReBc6gVwPb0pRU5cc4Bheefkr0HmUrJ9VFUe4U/7W/gB3I+HtyWkmd4sZQv
         mr/91bGWNk0Wk77IGXLtY9WCE9cEvHbdI14ag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756825854; x=1757430654;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mqq8qu84oGzDsYr4FpIoL3NcNzsNZYmrqTXhCI2Lm3o=;
        b=V13eyoRhif9qHUaDiXcHZUrkf0mULsOtx/V4c2Kn5segITH54bbE266bTp4Z0QwGPz
         nPgqYjCfvH+GhU74tV8FgrEmQduSSyndk02G/4PVfKahDS5CGEm9lSg2aetkDPkuFJ9W
         uPMkBat2yyw3wHsZPR+BAbRXjeN+H6uh8dQYp34Or2nEBG4KpnV4RsyoiyUK0ToPQPm+
         n25Zq5npPuuBhKR+zjtI6E/6m2p01Fgcvzxth/tuttUfyH2OkFOrmcfz962OV+vylkD4
         cSh0S2/6OaTGygPV5DwYLEU1kEULlSNN8z1LrzmKFDwx2Ez8FfOI53+wzbkMV2vNRerz
         8d5A==
X-Forwarded-Encrypted: i=1; AJvYcCXaP+ZvfaBSFdkuu6Fca3U0PH6t4xczFsQsj8DimxzONKqNkn5WOg7Mfwgchk3Z+dO/8rzdh9GLeqI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxd3lS97+2a1rOZAHCQrfmMamrtVA+rHcvCNXkP70wcQK9I6FeZ
	f57ut/JlX8IjccE69oHfmG8SahZeSSGxNYmxsArM96v4JKUEsLpgyK/C9X4ZQp9zc68=
X-Gm-Gg: ASbGncuO84dj84xu7w3/26fNt9Hq5HZm/8TryKb3UxQxQvwywABd/OAZ2Wd3Ds5pxLt
	Y2uFKToCiEWbqHqG0JglH0Mb34jryyv1fI8Z/Q6BFWXuKM+sZaClXzTkTI4ktoP27xRY6lDkQKv
	TUtFE4n/Se2omre9uQgyIL+zaP5pHQKF03GQcgXFWZgnObAO8yZs89aARO7QZaszd7tSJWihsOX
	M6Wvh2FISmeArDHkobzku+sPmzX+rNoD5Gp9F3zRoexxZUgOWHvHs3Mf6DcQtO0Eh0b7TO2KS7s
	HLki7wQZOJ2PlndOKcUr0Z9Lps7PtOZQUh8FBrQ1rR2xXFYezdqOCRZpbySYERRiE1Zq2AyaIX3
	P2SgDvE6DXDpyCxqSTTJQRH3tZCClFy2K95XBG76dGg3V47Hjd1y5Ru9Ld38CycyKpHaU
X-Google-Smtp-Source: AGHT+IFxcnydYsJY8G91LGTTCPDcOlS7hXV2vpEXd+7pvtRmBr81WmY7fB/L0xsSIHEswoZIXg1qXg==
X-Received: by 2002:a05:6000:18a9:b0:3da:84e2:c076 with SMTP id ffacd0b85a97d-3da85016655mr2034582f8f.55.1756825853906;
        Tue, 02 Sep 2025 08:10:53 -0700 (PDT)
Message-ID: <63c9a5b5-6f9a-4abc-97de-19c85d80bf90@citrix.com>
Date: Tue, 2 Sep 2025 16:10:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Tidy up .gitignore
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20250902144937.1414411-1-andrew.cooper3@citrix.com>
 <7418184c-9798-4c86-ac7e-9898de5df089@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <7418184c-9798-4c86-ac7e-9898de5df089@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/09/2025 4:03 pm, Jan Beulich wrote:
> On 02.09.2025 16:49, Andrew Cooper wrote:
>> Drop unused or stale lines.
>>
>>  * While it's necessary to have .git and .hg in each others ignore files if
>>    using multiple SCMs (as we did for a while), they should not be in their
>>    own.
> Despite what you say you remove .hg from .gitignore though?

Oh, all .hg stuff was dropped in ba5bae659d907.  I can add a sentence to
that effect.

~Andrew

