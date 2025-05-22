Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B110AC0DF8
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 16:23:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994090.1377136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI6oy-00035F-V3; Thu, 22 May 2025 14:22:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994090.1377136; Thu, 22 May 2025 14:22:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI6oy-00032H-Rs; Thu, 22 May 2025 14:22:56 +0000
Received: by outflank-mailman (input) for mailman id 994090;
 Thu, 22 May 2025 14:22:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ckVG=YG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uI6ox-0002zG-PP
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 14:22:55 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40a33811-3718-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 16:22:55 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ad56cbc7b07so664067166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 07:22:55 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d06b497sm1073300766b.42.2025.05.22.07.22.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 May 2025 07:22:54 -0700 (PDT)
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
X-Inumbo-ID: 40a33811-3718-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747923775; x=1748528575; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0Ix5KPQ+kVCua0Abuh8XfJpV2LATPjGLg5HSelMo16c=;
        b=FqbgJYza002xkTUT47CL+5Gv08EnxbQzKlPpnb5hvFS4i+w1/Ox8bWTLWiq98FPsw8
         s5OhVfpXlRTBTPEx9hL8dHEtbIP/O7Dv2CdAjCH+ZRil/fzwaWpmrKk86vqCN9J5hjTx
         pClj59AjBQCb2QPcI1i6DN8ZX4Yrhv4RRhaaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747923775; x=1748528575;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Ix5KPQ+kVCua0Abuh8XfJpV2LATPjGLg5HSelMo16c=;
        b=dOtzyBlrPOogaDgz1uFwah7wAoqXM/Z3Y4EUsgvu8gBVFUkhjUMMOZ1MNSySwZzwaH
         XEIVG805KRWxdAS/A32N0eZSbrYFm+T7gZxN9Fx8376Uw2LBEMkGlPWyHek+7PPxOq/H
         dEWFYnMcyTgA7t+Uw0hzyjJoRtQfj+FHVBl4O0EtMyxhy4MRWwnqtddlR/ub2EXFgM4W
         g9mKG0l2cXWGaluRfsTB5e5p6IT92BESHuAUuk3UvctdzbMwRIo0t6lsdhqorrwBPhu8
         HCxYWE+fIEjnd5FsXdEssRTseomr8p3JiEDHocyQ4DG+m2gZsNRHyBjK5N2WI4+qsZiT
         JPKg==
X-Forwarded-Encrypted: i=1; AJvYcCWXqe7e0/RE9H7g/bIIqBfR57oJKUK4dusPpNfL0uQLfurZZsOQQESLVIRMKlHn9/Xz6cLTJeydeQs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz6Wd4jv2PdgI/pii7UK7z+NBM7vczPgb1ojiZUTrYiE3FAst2Y
	49jOJfNmoPWxvzD0646qFk2DtgSDkTzKy/mjvsK2kv9qpXK4T9QSwuY11N75VHvJUT8=
X-Gm-Gg: ASbGncuMwWELdsE7PlQjF/tCmnUfTVadk8bOGRVuYPXewVcITm9m8tbN35RosJZV6gs
	yHDkX3uCNEMkAYXsaVXEtyZaoss1/gTBbCJrAr0w4LMBbY1Mj5bAz/lnrvgf4fAsCvcBqrggIZf
	90HwycRN5RCo8heIxIKfdI8ACAdmIQW/dbqezJARE2Il72uevpqRr4jwjXZYDPsZ0ZX4S21754N
	oMNNqI3MpeDfI2E6nQEgPbysNA1YE50+OgQnTOZHXK99hbhecxKamAG+/hKtpkbHBoVouj4SDSL
	JVZt5hd+LlxnVjax+p9aPoE1/056akDR8Louawn8nZ61GR2+4lrFWwrB3KBrcz8/5XnvzTJ/NsH
	92lfRDsElRQto/d9V
X-Google-Smtp-Source: AGHT+IG9jJvmklsdYecQkZ3q4OJUM3b3nBNP1034iCLd8MQFDiZCcAmX19fOcFfHbEf2/qU72TqcHQ==
X-Received: by 2002:a17:907:97cf:b0:ad2:4eef:d33a with SMTP id a640c23a62f3a-ad52d49b55cmr2251551066b.15.1747923774662;
        Thu, 22 May 2025 07:22:54 -0700 (PDT)
Message-ID: <ee13677a-e4ea-4d11-92d0-196b86a7df48@citrix.com>
Date: Thu, 22 May 2025 15:22:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/vpci: refuse to map BARs at position 0
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20250522140356.5653-1-roger.pau@citrix.com>
 <20250522140356.5653-3-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250522140356.5653-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/05/2025 3:03 pm, Roger Pau Monne wrote:
> A BAR at position 0 is not initialized (not positioned).  While Xen could
> attempt to map it into the p2m, marking it as mapped will prevent dom0 to
> change the position of the BAR, as the vPCI code has a shortcomming of not

Minor grammar point.  "prevent dom0 from changing".

> allowing to write to BAR registers while the BAR is mapped on the p2m.
>
> Workaround this limitation by returning false from pci_check_bar() if the
> BAR address is 0, thus causing the bar->enabled field to also be set to
> false and allowing bar_write() to change the BAR position.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/pci.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/xen/arch/x86/pci.c b/xen/arch/x86/pci.c
> index 26bb7f6a3c3a..39fd5a16a4aa 100644
> --- a/xen/arch/x86/pci.c
> +++ b/xen/arch/x86/pci.c
> @@ -101,6 +101,15 @@ int pci_conf_write_intercept(unsigned int seg, unsigned int bdf,
>  
>  bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end)
>  {
> +    /*
> +     * Refuse to map BARs at position 0, those are not initialized.  This might

"0, as they are not"

> +     * be required by Linux, that can reposition BARs with memory decoding

"Linux, which may reposition".

Otherwise, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> +     * enabled.  By returning false here bar->enabled will be set to false, and
> +     * bar_write() will work as expected.
> +     */
> +    if ( mfn_eq(start, _mfn(0)) )
> +        return false;
> +
>      /*
>       * Check if BAR is not overlapping with any memory region defined
>       * in the memory map.


