Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8E0BB3A7F
	for <lists+xen-devel@lfdr.de>; Thu, 02 Oct 2025 12:38:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1135687.1472711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Ggw-00025B-3S; Thu, 02 Oct 2025 10:37:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1135687.1472711; Thu, 02 Oct 2025 10:37:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Ggw-00022k-0I; Thu, 02 Oct 2025 10:37:42 +0000
Received: by outflank-mailman (input) for mailman id 1135687;
 Thu, 02 Oct 2025 10:37:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wm6k=4L=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v4Ggu-00022e-Fx
 for xen-devel@lists.xenproject.org; Thu, 02 Oct 2025 10:37:40 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0b15b90-9f7b-11f0-9809-7dc792cee155;
 Thu, 02 Oct 2025 12:37:38 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-46e52279279so6040635e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Oct 2025 03:37:38 -0700 (PDT)
Received: from [192.168.1.183] (host-92-22-57-86.as13285.net. [92.22.57.86])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e6917a577sm29345715e9.1.2025.10.02.03.37.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Oct 2025 03:37:37 -0700 (PDT)
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
X-Inumbo-ID: d0b15b90-9f7b-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759401457; x=1760006257; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QLxFSFBZuRn764rccwAa0DmZS0zngAdmpLz506CAVqE=;
        b=PGLdBeJwNr6o6k1QGL9h2weBpRbWEMD4DDgqyfqg5AdpnfhnF+PjQXGHlAUWrT0B01
         YPYLn53dWbuYJDYlSgv42YL1fymoU4cB9KmVf/92iUlhegyvOkvTrFTrb7gFCHIp6LIt
         BxwiK97jbJHfopJmOb3fxuVjneLLukhsUdw1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759401457; x=1760006257;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLxFSFBZuRn764rccwAa0DmZS0zngAdmpLz506CAVqE=;
        b=QC2ZGGlqMSUg0swPSO/b+ikt9A+12V/st1kRz2kHKHupl/RX2W+1dUvbsfMjTbh0Ap
         ZlNpQqjUmRLHuv1tt+9mKPWleSNjNjV+1mIgC2b3iToAwPRIMxz5S2E35zl2Y6vhrQr4
         CyEa4RgM6GF2xMZ1XelHO1WLiTtYt/k+H2zazSkXA46fS9TH9EvWGHunzlZ2cwt8i/Vf
         FQ19mCMSlKAc3hrtffXHp4jj//xPoYZbkRQ9ZWSOg1Ks7qdEhbhCyQBDs5o0k1beVWYh
         ebckdGEK0XXyAojRiJjnbitY8kRRCR73oX/jt/ggTTtg++HZHWlz8I7RYm9M5QRry8wZ
         /ByA==
X-Forwarded-Encrypted: i=1; AJvYcCX8J4tFa+Nl5gMtrym+wMp63VQ9uh9d3Sd5pg8827W1X8z+krJIwrmFE97Kz2vsFYSgmA4YAP+9Ep8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxvoppY6h2Dx49JPzsbG/9CozADebTTmg6jFpnnlVsrB0JzAFKQ
	iNkLOiqn7p2vrYh6fs0sp49gERZPlfPGvOeVGvSaUqdqYhbj/9vX5NdwPhoGwNtMLsk=
X-Gm-Gg: ASbGncuaXiDoKRlofuLOax+2kLZas3FtLrmJt8TBS5nMTQiHQtjCln78ys6W/AfMQYm
	D/fnn7F7EztUY9m6kwcQ7idgeWRIwdxYrqeg6JwP5D9xKGF9KthOK9ust9sgmU3iuO7iXYvRC6o
	gFBuqiiTwaOZQLVlN42Swrm+XnvKuxlJAsfExyL4q3Obxbvb17p9TXimtJTvo93NqtLAGNbeOk6
	Vgzpx3vKRHjyVhoiIncGAzTuQGUrcR72fr2zjxlJ1Igm1fBK2colzx6XSR+ApnFIFEBydlCYcd0
	oiGvqivxkU0REQLegQjTMyuDZbCsV+X4nfHJjEWQOBEvm+bmtJZjTE9LbozFySvK5hQm4+sLBgn
	fWwxB4VXFo2VcoEFzWnigGMD0o9Ek/4Gd3BoPk3aaSx5m/l0iL6PxheJBtbKZLjTyCF7Ynl6zBD
	zhsQyW8LGJqLuMZqJEB3uKMis=
X-Google-Smtp-Source: AGHT+IGG4GI2tDKdSmMLIRrOn6Ucxejnbxy50/tUexvKx27CwwAFDOd4ap8B3rBI40Ot0uN2Njo42g==
X-Received: by 2002:a05:600c:8b66:b0:46e:39e1:fc3c with SMTP id 5b1f17b1804b1-46e6fcae45bmr700435e9.5.1759401457391;
        Thu, 02 Oct 2025 03:37:37 -0700 (PDT)
Message-ID: <1b4bcb40-d62b-47b5-847f-b6e16906f52e@citrix.com>
Date: Thu, 2 Oct 2025 11:37:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] x86/hvm: fix reading from 0xe9 IO port if port
 E9 hack is active
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20251002102200.15548-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20251002102200.15548-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/10/2025 11:22 am, Roger Pau Monne wrote:
> Reading from the E9 port if the emergency console is active should return
> 0xe9 according to the documentation from Bochs:
>
> https://bochs.sourceforge.io/doc/docbook/user/bochsrc.html
>
> See `port_e9_hack` section description.
>
> Fix Xen so it also returns the port address.  OSes can use it to detect
> whether the emergency console is available or not.
>
> Fixes: d1bd157fbc9b ("Big merge the HVM full-virtualisation abstractions.")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

That's been wrong for rather a long time.  How did you find it?

CC-ing Oleksii as you've tagged this for 4.21.

> ---
>  xen/arch/x86/hvm/hvm.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 23bd7f078a1d..0c60faa39d7b 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -567,9 +567,15 @@ static int cf_check hvm_print_line(
>  
>      ASSERT(bytes == 1 && port == XEN_HVM_DEBUGCONS_IOPORT);
>  
> -    /* Deny any input requests. */
> -    if ( dir != IOREQ_WRITE )
> -        return X86EMUL_UNHANDLEABLE;
> +    if ( dir == IOREQ_READ )
> +    {
> +        /*
> +         * According to Bochs documentation, reading from the E9 port should
> +         * return 0xE9 if the "port E9 hack" is implemented.
> +         */
> +        *val = XEN_HVM_DEBUGCONS_IOPORT;
> +        return X86EMUL_OKAY;
> +    }
>  
>      if ( !is_console_printable(c) )
>          return X86EMUL_OKAY;


