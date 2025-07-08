Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02139AFCDF7
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 16:41:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036735.1409111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ9VT-0000Lh-3E; Tue, 08 Jul 2025 14:41:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036735.1409111; Tue, 08 Jul 2025 14:41:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ9VT-0000JM-0c; Tue, 08 Jul 2025 14:41:15 +0000
Received: by outflank-mailman (input) for mailman id 1036735;
 Tue, 08 Jul 2025 14:41:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xEP0=ZV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uZ9VR-0000J8-7u
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 14:41:13 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 926f179b-5c09-11f0-b894-0df219b8e170;
 Tue, 08 Jul 2025 16:41:03 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ae401ebcbc4so730805466b.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 07:41:03 -0700 (PDT)
Received: from [192.168.50.23] ([188.89.134.172])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f66e6f25sm898684266b.20.2025.07.08.07.40.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 07:40:59 -0700 (PDT)
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
X-Inumbo-ID: 926f179b-5c09-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751985662; x=1752590462; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kPF0OET4ZKGRKhfWGQRPazcps0cQIMR3oYf/Y6aK2Og=;
        b=nOPQG2qojGNg+ek3/d+A7GdtMHepnHBFX0Qv3WhGA1vfraIP9zYN/tKIlWVLhDY+qg
         3NhPoRRQbjY5IvdgFSHUv8aM/IKBivhmwwkD7q3G4XlXzSqgkJ9MkLK1n8pw4cqEY4kQ
         RtUFXqRbO5BWoSp3d5/cHZNqco16fY82X9Dm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751985662; x=1752590462;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kPF0OET4ZKGRKhfWGQRPazcps0cQIMR3oYf/Y6aK2Og=;
        b=oX96diH96bIkxcjLwXZQDQNm4HENzTGxCf8eROIjvJiv2DtLc3sQdfQgXGX7mkumzC
         bz+z7NkZTzgiLzLsEd31xlmBW7lgfY2BN2S6o+bfwJyBxg4r3tF9cqqAXQKmlcN/+pkZ
         vE+AdJdc2V0ohi5XKzP52phP+WCmnpyw74wG4rgm9T69hHuoJLdzOr0aFQWxeujVTc9d
         9b+lsZf8lrScR3L15GMnyLe6a9SHs6wk3sFxFElT/gKJZIogcGXEmPjKBOFqTQrvK9ad
         ebrexRAPgx3uvRCUob8y1nBAc0YweZcxt0suIGqvQ+nWndDbjRlWeynbgLynovbr/BjQ
         b7Vg==
X-Forwarded-Encrypted: i=1; AJvYcCXiJ1vwXvRO8a9AJ3kYDkNXZP4I4IYoTa1Rjaf6jxg/jtAwo+pSrnzT1JhWSRUAY5VUVobTTIOdt0g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwnozYJfoQVPKvFgBH4up2ayjz/S5tAosPGbIkbSIapRpvmJNZZ
	oWC4TEE/pRJPPp9IiuOpgaVHiFDv7bWYf9lkOQtbQLbpQvEqe0ZfSF+GrBbcKxby13A=
X-Gm-Gg: ASbGnctsuHUZzyQz5s1Uc12pgiKcTS3G1FggDRvaKTsOXl1w321TzYnHDwuIMKfiKQA
	fLOgJ+h5uHWlTSym8Og+iwh+DJbABKWMGwtOMbJzeuPfvY6g0lkHN5Gloi3W0fXjMp2w/JJ90jr
	0eyTE8S4Yk5+By2+bR7wBFFlemyVaPaRdVqNOTPC+deYwSN5M2OwwP2dk0hnle157kduPGnVVTU
	0/chbIr4+tLzUZjzz9L+3DgU+gD6keHK5QFJuJtPv80WxtER2UNFlFwPfhZho2WcAunhPSROvRf
	ytDQ1dNPiaEH1cyEa7KdZtgxSqiNOsn132rKfIRAelLGAP8BoqszEvcKZBe0KhuOcdU+TuetMqQ
	=
X-Google-Smtp-Source: AGHT+IFMm2X0AjoKSvUuMJaoHjjYf6vQuGg6PIeEZuKei8yVwftbukDNbZC38uw0Ky2tT3m/cVVWSA==
X-Received: by 2002:a17:907:d584:b0:ae0:c8b2:3fc0 with SMTP id a640c23a62f3a-ae6b0049675mr429183166b.10.1751985662420;
        Tue, 08 Jul 2025 07:41:02 -0700 (PDT)
Message-ID: <ecbd3cf2-f080-4938-a31f-cebebb68cbc3@citrix.com>
Date: Tue, 8 Jul 2025 15:40:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] x86/mwait-idle: (mainly) imports from Linux
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <1df49875-99b8-4302-aed7-5a75dbdd85ca@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1df49875-99b8-4302-aed7-5a75dbdd85ca@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/07/2025 1:55 pm, Jan Beulich wrote:
> ... with the exception of patch 1, which first tidies a few places. (As it
> turns out, we've been lagging quite significantly.)
>
> 1: adjust section annotations
> 2: Add AlderLake-N support
> 3: add Emerald Rapids Xeon support
> 4: Add Meteorlake support
> 5: add Grand Ridge SoC support
> 6: add Sierra Forest SoC support
> 7: add Granite Rapids Xeon support
> 8: add Granite Rapids Xeon D support
> 9: add Clearwater Forest SoC support

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

