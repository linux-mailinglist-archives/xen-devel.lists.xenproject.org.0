Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D83ADAA6413
	for <lists+xen-devel@lfdr.de>; Thu,  1 May 2025 21:28:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974280.1362175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAZZd-00035W-MV; Thu, 01 May 2025 19:27:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974280.1362175; Thu, 01 May 2025 19:27:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAZZd-00033e-Jh; Thu, 01 May 2025 19:27:57 +0000
Received: by outflank-mailman (input) for mailman id 974280;
 Thu, 01 May 2025 19:27:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tswP=XR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uAZZc-00033Y-JN
 for xen-devel@lists.xenproject.org; Thu, 01 May 2025 19:27:56 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f11c30d-26c2-11f0-9ffb-bf95429c2676;
 Thu, 01 May 2025 21:27:51 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43edecbfb46so6284505e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 May 2025 12:27:51 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b8a3156asm21079815e9.38.2025.05.01.12.27.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 May 2025 12:27:50 -0700 (PDT)
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
X-Inumbo-ID: 5f11c30d-26c2-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746127670; x=1746732470; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=k/K5CHS4PFRvrbulwFYhzRcaFPzKuSUn1ebv5iLnyZE=;
        b=dALH6LH0gYT3AGlKKj8eYDjFM9sTwZYpWQY503eJnbu5P2naOchc/mV7/Dcs3uWYzT
         CJuP6SHj32E1/oZxOBHoAYT2ZZmGmX84akwdTYP5dmB4XimxX2dj5gh/SRf6yT4b3Lzg
         xzvNPsZjoxtLBjmdIoLW3MNTfOPc4ajSz+ZTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746127670; x=1746732470;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/K5CHS4PFRvrbulwFYhzRcaFPzKuSUn1ebv5iLnyZE=;
        b=rDBj2h7XVCH1OX5oHF5/RvEgk6FEEW+Z0hQSNiMgzERKr9kd9yMw1zJsbuU6Qo6c5A
         0tMEAkDvDRlMDQdLIDV0XfOZCI99d8tfXbScgHXxnwrbf3/OMSiDwqvwQ84JoHB2lI25
         aQ/5CcYDG+/Xjw7z/YyM49vfHiKCIbxlSEOs6zuIN1rFBeTyjdFOTF7rshiARwyPP8N6
         kj3JRapvk+JLRikrFEuU0ZddCwV4f0kuvw2kFFTwFuh4CtFiywfhRRo7ek0c1uyX6j0x
         KysGTgiWadZ5sP/DbKcd70hp7uiQptTo9TYn6qzveuU2TKzCpcuE3Zlp+atPwKVIZPm9
         iiCA==
X-Forwarded-Encrypted: i=1; AJvYcCUq5FS8B7uB1la+d1jswc7P2RlotLfBgMXY1xZiMN6sbyppAkdxWblASfL/IC0qm5AvcMZr1Lv1llk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxHZvIu8O5y61/+/zkuhXqg02hP6oSEaD/xofYnWnnaAYz21OcJ
	gTxa/uCz1y1cZTEWo7xhNK9DkniLLQu2xJWheKio0bdn76pQq/XFYJ+D4g6Wgxw=
X-Gm-Gg: ASbGncu2nE65bhBFbZs/YmfIryTYvJXhOtiTKrZTG8wgg0y8jBYR1WB9XuPSymFMIEk
	2AWjNwIxuSN2SCpNxdkdtfElkLL8WxDOO4yAZnyFD6ZyEj4196u4YDWI/X5ihLOh5brU/O92Fxn
	V8Oq+4jCOBj4e0wWrAZ8hBFI3IRGSkXGijoOTiYEVQndGn1DaHWRIuNMzVyGlwaGWEPiJJXCkC5
	mODFVV8p+aRns3v1X8732C76/euNzVS60DCJceN+deel3WiOV7Wyw+Auzu2yvXLHH4lTVobHXZh
	bjsLUtOCBX+BkDlBbzC8rqHj2sgAKboTK9NKlFkVBdZLcYzRRv4E79787o1u3Kkt1ww4k1tJ8L2
	n5oAv0w==
X-Google-Smtp-Source: AGHT+IGHAKP3nQ76sM2ePPPgnjkPnkWWdBgaSJ+PafHGuFma8BBMr3jMXTdMNsCvB/23K5uDOcJpTw==
X-Received: by 2002:a05:600c:8289:b0:43c:f629:66f4 with SMTP id 5b1f17b1804b1-441bbe2677amr1034415e9.0.1746127670514;
        Thu, 01 May 2025 12:27:50 -0700 (PDT)
Message-ID: <49485e48-827b-450c-9d19-2615d012a576@citrix.com>
Date: Thu, 1 May 2025 20:27:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: update list of GCC extensions used by Xen
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, nicola.vetrini@bugseng.com, michal.orzel@amd.com,
 anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
 roger.pau@citrix.com
References: <20250501192424.197012-1-stefano.stabellini@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250501192424.197012-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/05/2025 8:24 pm, Stefano Stabellini wrote:
> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
>
> __inline and __inline__ are already handled by ECLAIR but
> C-language-toolchain.rst doesn't reflect that. Update the doc.
>
> No functional change.
>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks, I do think this is the better way around to do things.

