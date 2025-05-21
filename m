Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C16ABFF08
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 23:38:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992618.1376303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHr8E-0003fM-Ry; Wed, 21 May 2025 21:37:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992618.1376303; Wed, 21 May 2025 21:37:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHr8E-0003cJ-OT; Wed, 21 May 2025 21:37:46 +0000
Received: by outflank-mailman (input) for mailman id 992618;
 Wed, 21 May 2025 21:37:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iqa2=YF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uHr8E-0003cD-2Y
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 21:37:46 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3138249-368b-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 23:37:42 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so58780495e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 14:37:42 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a360b0b766sm20633531f8f.56.2025.05.21.14.37.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 14:37:40 -0700 (PDT)
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
X-Inumbo-ID: d3138249-368b-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747863461; x=1748468261; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GpPVPXCCPXF7BOwGXNat6gwQ/ZskJE75+M8RZ/VSvII=;
        b=gOcxIp09NPkpjYPE0hFLfUvPRQ3iw2+Wo8WWTep8wSAcEEq28LTpnBlHVYa3tXq7kS
         mK+AqFET0EYARIvpJ1WUJEqVsyK32gY/3YCpGXXCI1MEyRdSZwcelyFm6hWmktEDqkLe
         Zz9HEffXqiFcRpqnXgYtbBiOQ4WWK7uctmyvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747863461; x=1748468261;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GpPVPXCCPXF7BOwGXNat6gwQ/ZskJE75+M8RZ/VSvII=;
        b=YagNrVq+dRtIKqDY5NSlbqHbABuQFg2C6XGh+73Ym+Wgu3bgN/aiz9EP6DNizzG7m1
         WFHN6bx4DsRl0pc/b5eDyKdYjT7dDpWmul34blFDRoofzxYsPpenWiSJo6DfTPxpXjBV
         q8i8MS+BuZuYgsXWkhe79CUGC2i3WMLIbqbSY4QmZVyDOUm+oUmB7VtVEp191xeV7PH2
         +oj24WW9F/vOlID4m56qhbkJFq0NMMVG67OjMsmFJfiW2sr+4Bf9X5C+IKO51GKouB5E
         ACcBvI9WauESsRC1xKrL8QeZ66Ux+VpE1XHpXE1WOv4XwH/s708FrctfXdpIvMQCHm2d
         0oxA==
X-Forwarded-Encrypted: i=1; AJvYcCU+cfGTTOPI3f9ojNfUpVHaeFRIenq1TyPtNx5yxa1xRyciFJuqZTJleWiX4Hl5FKthbtNHij7yCQU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyEw8nASfxNv/ZgGlnDfS2/p8IsOBA/vxxYNv9/kBHgThdVEIKH
	Nj051rGSiSHnqcD8xo7s8Erd1Uqxj0oAVtLBoUzQxarEypKfpAUzgrNyOZd/LSpudrQ=
X-Gm-Gg: ASbGncuPNNrkg9TeYGhNwNNuLxNsSI64PIy397n5Oj7MWN1aWqatf/Sk4eS+YsZ0grl
	FSE2pXzVNUNiMVcLLMOY/jm+F4qlbX/+7MxJgafr6B9JuIIvqC3ZRee8u1JB3EoHhDDrmeHpNy/
	w5iKcwwiKZYOfBBoyq/ZouQQdZVeBkHENyMov9VD4vQIS17RAQvq31RQ1EubhmVLnQB1Emb9PA7
	SUV2o0LsfgT8CYbFWLhxNZitqVhqBroVojgaL3o16e/5jYVPreYlMdp0H0fSE3Br+mSgFtoN08c
	aaK9r/tQGl/c7reUZYTyw/eBKQG+ENiAD9jFYIMvEn9wxBtV3XONYbDtBOhcRqYPNzzBcTM5W+C
	IYt7qr3lGBRnyzo42
X-Google-Smtp-Source: AGHT+IG7j7fTiCb7HixBcTg2DDSPGF0YhzCcauQTNEN39hdXWtacDaJ3x86PMRl9BDGptA2oj/utag==
X-Received: by 2002:a05:600c:1d88:b0:442:ccf9:e6f2 with SMTP id 5b1f17b1804b1-442fd64452bmr269549855e9.16.1747863461365;
        Wed, 21 May 2025 14:37:41 -0700 (PDT)
Message-ID: <850d4bf8-3e98-4aee-9d41-e298be34893a@citrix.com>
Date: Wed, 21 May 2025 22:37:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XTF PATCH v2 2/2] tests/argo: use event channel to get own
 domain ID
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, dpsmith@apertussolutions.com,
 michal.orzel@amd.com, persaur@gmail.com, dmukhin@ford.com
References: <20250521211742.2997890-1-dmukhin@ford.com>
 <20250521211742.2997890-3-dmukhin@ford.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250521211742.2997890-3-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/05/2025 10:18 pm, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
>
> The existing argo test depends on xenstore to retrieve the domain ID.
>
> Also, test does not perform peer-to-peer communication using Argo hypercall, it
> communicates with itself.
>
> Since xenstore currently runs in dom0, xenstore adds unnecessary dependency on
> dom0 for the test in x86 QEMU environment.
>
> Use event channel to identify the domain ID which eliminates dom0 dependency
> for the test.
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v1:
> - dropped hack of hardcoding test's own domain ID to 0, reworked getting own
>   domain ID by relying on message channel.
>
> Thanks to Michal Orzel and Andrew Cooper for helping with that.

Thanks, although this needs integrating into the pending series I've
already got.  Notably, we want to use the CPUID if it's available.

It also needs to be ahead of the argo test to avoid a bisection hazard.

I'll pick this up and sort things out.

~Andrew

