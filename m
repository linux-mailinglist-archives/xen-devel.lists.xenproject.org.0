Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B918CAD3369
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 12:18:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010671.1388828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOw3G-0002Wj-8a; Tue, 10 Jun 2025 10:17:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010671.1388828; Tue, 10 Jun 2025 10:17:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOw3G-0002UQ-5s; Tue, 10 Jun 2025 10:17:54 +0000
Received: by outflank-mailman (input) for mailman id 1010671;
 Tue, 10 Jun 2025 10:17:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NC6Z=YZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uOw3E-0002UK-MJ
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 10:17:52 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27f8917c-45e4-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 12:17:47 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-45300c82c1cso9158055e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 03:17:47 -0700 (PDT)
Received: from [192.168.86.29] ([90.250.112.104])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53244fd02sm11764767f8f.75.2025.06.10.03.17.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 03:17:46 -0700 (PDT)
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
X-Inumbo-ID: 27f8917c-45e4-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749550667; x=1750155467; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Lt6sfVsVl+j8zM2leOn1EGSSGr7V6Z/TllTIx5l3vS4=;
        b=q7uMp9nO5OUBOAFMrb7orSQn2/TOUHGpyUtW91CxMwGqZuZcKiMRVk9ZfrSSSW/tW1
         7phtsPiiY1QTfJ++uFf4enJQOweTZs5XcIcw2fD6gpTj+CM5tIPboOZZLroNrPs5j/Kr
         0NPn18wYtbV4gqdj3vPe3DMzshaGLMKPG5C5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749550667; x=1750155467;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lt6sfVsVl+j8zM2leOn1EGSSGr7V6Z/TllTIx5l3vS4=;
        b=HmroViXDEU1JxgED+iz8C6C+cDk4pZMRQq+p0ATA00udRddGuI8/sMedpzyXMAHSre
         L7IrA7X+vrjWktOn3FCENhiICdw/lESKBQ+QnshMBKUNFDbL2N0xwFn2SGVWIRUd1QRH
         4R4vLtJXnvJYwlGet+LyI1xFMccCjfh05/IDHdAg+NSomQ8hetEMIkwHzj6MKN7bLA0z
         YHCZZBZO3AoMJsB/dDTok46S4/rNG9nzvhiKeDjPPpcewX6tY+co2CWOtKfWNAU1qp5Q
         SobAgUP4MA+AYE+irozcLZOi+aVYIqCkeBD1DYVWL4oqBTK3e09GnrW92IwgRNHjza8g
         Jiiw==
X-Forwarded-Encrypted: i=1; AJvYcCU2tUcliojKRScgdEKpFqwYgBDj42pZcuyklcuQLno1Tjl8FpgBtvR3cS4WusX76PS7eu7GcqMJ/tY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyDiJIBrs/dXN5/eFZTfIOmGQsenMZAzRu9H/H7tk+0Q83XuVaZ
	9IxNW77lR5o0AHoX7KzoaRFhJlHaaJR7FyXsVGFrZIvZDcvcw+BuLWmA3R9ft52bkwc=
X-Gm-Gg: ASbGncvqKYxiVzsJ9OYzmuKBGGa6gf8Fbt7Nx58lELyGk0EsRj12uB2Ty2xrovhf1d1
	CgWI9FHVaSW8rDMrXwWaVxV4outHWUpHTO891Vd8PEmRHzKAymiJJaHYPIEja6ClrULLOYFKz4R
	Rgs1NLxRzoYbrUVra3DymhsVVF0itMy0SZHForyI1+YF1EzCagATYAqIse+YVKB3Kd2PA5mi27w
	XETPJdl8u/sacGniiZxO9dJuc7AEg4Bw2SN5zbArMOF/9BvisH5qIp5dYCVOCKCGeg4r+E5swo3
	Guwr8Lp75kDZygCv/6UqxtOcH2B83XHfKP24xb8/p43kl0XDfcMvQvlv1hopdzBvlJFptAgMFaU
	=
X-Google-Smtp-Source: AGHT+IFAB4+/ho0kisvEuICIT7fXbdXci8yh7szyDGCuL/0CrNFMBhw9RNMbvmvJXsJzKI687UOoKA==
X-Received: by 2002:a05:600c:4fce:b0:453:a95:f086 with SMTP id 5b1f17b1804b1-4530a95f7aamr88187015e9.12.1749550667180;
        Tue, 10 Jun 2025 03:17:47 -0700 (PDT)
Message-ID: <d89d5d6d-c366-4511-8ffd-5aa83c0fc034@citrix.com>
Date: Tue, 10 Jun 2025 11:17:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Strip xen.efi by default
To: Frediano Ziglio <freddy77@gmail.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250610101228.24460-1-freddy77@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250610101228.24460-1-freddy77@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/06/2025 11:12 am, Frediano Ziglio wrote:
> For xen.gz file we strip all symbols and have an additional
> xen-syms file version with all symbols.
> Make xen.efi more coherent stripping all symbols too.
> xen.efi.elf can be used for debugging.

Agreed.  What Xen previous had violates the principle of lease surprise.

> Signed-off-by: Frediano Ziglio <freddy77@gmail.com>

Did you intend to send this patch personally?

~Andrew

