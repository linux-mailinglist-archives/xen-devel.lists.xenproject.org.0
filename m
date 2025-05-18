Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49326ABB097
	for <lists+xen-devel@lfdr.de>; Sun, 18 May 2025 16:47:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989249.1373484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGfIg-0004p3-Nx; Sun, 18 May 2025 14:47:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989249.1373484; Sun, 18 May 2025 14:47:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGfIg-0004mJ-Kh; Sun, 18 May 2025 14:47:38 +0000
Received: by outflank-mailman (input) for mailman id 989249;
 Sun, 18 May 2025 14:47:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GB/u=YC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uGfIe-0004mD-FU
 for xen-devel@lists.xenproject.org; Sun, 18 May 2025 14:47:36 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 088ea8cc-33f7-11f0-9ffb-bf95429c2676;
 Sun, 18 May 2025 16:47:34 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-601afe51106so1075005a12.1
 for <xen-devel@lists.xenproject.org>; Sun, 18 May 2025 07:47:34 -0700 (PDT)
Received: from [172.18.118.114] (ip-185-104-138-68.ptr.icomera.net.
 [185.104.138.68]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6004d501b60sm4495446a12.18.2025.05.18.07.47.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 May 2025 07:47:33 -0700 (PDT)
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
X-Inumbo-ID: 088ea8cc-33f7-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747579654; x=1748184454; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oa00Bkswp8uBCOnXui7xpUjTb/mRh0fE2T9ZTK73Yz8=;
        b=RrJ59aEi1QNg52cYLYAdZ8m8BSFluJk0HL/bn8y7kUWwyQyMOyCjAs9ZGIkTx7q7vt
         zyUeYcKnKVsZeD0rn+IV2f/J8x73w3F7UpxeF0uKNIXsNQKpom83EoylJlg9B9wnlWb9
         WshzxVcd44aY5/dvoqLgXuoaWeAVpbiPDFzI71nUtoh/B4GGZYX5jqijJJrgVLUptox6
         gyX2ikTWq9P0vLv2NLQEFP5id5y2fKssjg/Wg4oRCPWmMQsxhpaDfgRMNwzT6dfJLU8X
         Z1BSSOB+d5OWNTuUxj4dOg4DPGljSsI+Nz0ryQWUxW9qajmPhdMJ0XVwEF8rfbrU6rU7
         5Sfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747579654; x=1748184454;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oa00Bkswp8uBCOnXui7xpUjTb/mRh0fE2T9ZTK73Yz8=;
        b=tB8jClmXi4ApY7KxW/yteQj2oMyNhUa1n6YwajJQi2YCGTopaenup2q2NdSEmRU9KZ
         fBdy0Zav+umXbW0aXcnNZiCfLT5ZNPFwl2ZHZ/IqMOW0Rx35hUVBbc8EBExBIhubFkuP
         1mDpzperpST/LoxDVPXk60d6mtXEOQBeoof/ADJ8adEb0zveceGSJZuFyDKeXDfeEREd
         08j8rTqjBpjqFxZGI2ma7HMvTJd3MX1igjvw32zqLyXj9kg0wW6ApiDfdTk00/Jse1wm
         /ivHLSeQduq5XHxSVCFfpmIlrIPKbEN2Sam/RemhyGbH2S49kKdFLwHkLymHkRiGRbyf
         LtVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUrydwVnqugZFpNaRjVVV/CBmqjswurdAgxXkX44yloEJq45sW4j2ROa+BMFWL4nLu33QCW17uISg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx3EYrhspkUca69AaLEMHh5EHIik6l1TLhctgssaGJ5IReGpT4h
	eYro/XaxMNI3wlwJKnMH+VKY4zwv45Ayua16ha97h01YEeF673EkjnSKwrl+cWLBHw==
X-Gm-Gg: ASbGncvfmw64e65wlQWO9ZHTSjrCNv7vZGKDxkIQHzVCILMaZA/p62oYWuu2KSZSMov
	2v/KyKzI1cof0K9fSHAxoA3OPSqE+BCKEydXgzHwbQy+/PaHGj0L6DamlFRtfx60BQzmeqptd4A
	rN518j5XCdYDGQEuQZcPaIkiLwCYjMihGKbF5gIH50yPKddU/hGT6uqD0EIjHVKd9Y7pl/x8u4D
	g2cRn0qZPNLkFafPogAu97nZeTqcBDUvB5Qh7fA+RqyvH0y6X/1JUPhAJEXRs/n8vOGMzA5r213
	0b5BhjPX051Nm5gWThKLhZxHow5NLX+GW0C1PbetcH+X19X1Vj3iYcMshMnigPgcHpMfRZIxOQF
	AvBLBTb2mHULr4joAYOWyIZNp
X-Google-Smtp-Source: AGHT+IHpV3kVk2AZoWgkkzjL2lRZIKallXk1oBDfn6vKNbQk2vFcD7uG/9iYdT44cx6XEmNcULyxaw==
X-Received: by 2002:a05:6402:27d1:b0:5fc:3e6e:f048 with SMTP id 4fb4d7f45d1cf-6007e829240mr7776214a12.0.1747579653818;
        Sun, 18 May 2025 07:47:33 -0700 (PDT)
Message-ID: <48c71b8b-2b59-41aa-ad02-b237d53f1d6d@suse.com>
Date: Sun, 18 May 2025 16:47:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/10] vpci: Hide extended capability when it fails to
 initialize
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Huang Rui <ray.huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
 <20250509090542.2199676-7-Jiqian.Chen@amd.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250509090542.2199676-7-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.05.2025 11:05, Jiqian Chen wrote:
> --- a/xen/include/xen/pci_regs.h
> +++ b/xen/include/xen/pci_regs.h
> @@ -448,7 +448,10 @@
>  /* Extended Capabilities (PCI-X 2.0 and Express) */
>  #define PCI_EXT_CAP_ID(header)		((header) & 0x0000ffff)
>  #define PCI_EXT_CAP_VER(header)		(((header) >> 16) & 0xf)
> -#define PCI_EXT_CAP_NEXT(header)	(((header) >> 20) & 0xffc)
> +#define PCI_EXT_CAP_NEXT_MASK		0xFFF00000U
> +/* Bottom two bits of next capability position are reserved. */
> +#define PCI_EXT_CAP_NEXT(header) \
> +    (MASK_EXTR(header, PCI_EXT_CAP_NEXT_MASK) & 0xFFCU)

Please can the hex digits all be / remain to be lower case, with just
the U suffixes be upper case?

Jan

