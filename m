Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B23899A3188
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 02:00:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821446.1235264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1aOR-0006pZ-BR; Thu, 17 Oct 2024 23:58:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821446.1235264; Thu, 17 Oct 2024 23:58:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1aOR-0006o1-8Z; Thu, 17 Oct 2024 23:58:59 +0000
Received: by outflank-mailman (input) for mailman id 821446;
 Thu, 17 Oct 2024 23:58:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2/Py=RN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t1aOP-0006md-LU
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 23:58:57 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c406faee-8ce3-11ef-a0be-8be0dac302b0;
 Fri, 18 Oct 2024 01:58:55 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4305413aec9so15878375e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2024 16:58:55 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431605f8e0esm10321815e9.0.2024.10.17.16.58.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Oct 2024 16:58:53 -0700 (PDT)
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
X-Inumbo-ID: c406faee-8ce3-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729209534; x=1729814334; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0GPB8iwtQYxIXTVxPHbtqi7ZbMuQrAeIyutJnKz+h7A=;
        b=tC3z78+m2lr2SRbfI5Hs3YF9k1WC5C4jmaeRT59DC8FoDtrry/1wGqsVLLW2vmGaMm
         qfljYSPUcyyejEIepGDxVEcaWQFk0b9wHR2HMiOBK49pQwklUM9aMno70uC01XReI28h
         yH4aCoM+dNZD/plglEkmZIQK9Uw4QMYHx7hiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729209534; x=1729814334;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0GPB8iwtQYxIXTVxPHbtqi7ZbMuQrAeIyutJnKz+h7A=;
        b=DHCB/ZYJJ2qOYyZhaUV1I8UvlhBE2D/WCmdImR7Xe/NQ4lQoR0zOAS4FwuJ8tOFLY2
         THyf+ACp3BxnpHWNrMk9QTLWowkIemjNFwtxU4a4a8zb89ZpZmSFzy1d5m0sP7N7P4IQ
         Dx6TM5k0uCYj4oI5qsUt9d4wkxLudm/SDwneKYPxh0jidG4Jr19BNtT4TrNN9SKFo3oJ
         iyd1AXiBaiDbGLebonWAD9IXe5+yQ1t7l5dQQs0HXbXoRKTAG6iFZidbK5zdZ6dNjdTB
         DOnFCpjUSmPQG9PtMQBz37jseqfj0mtv5mtiJYIrHve/MjD19dpd55Ep4ESLKmhJ0UBE
         mAug==
X-Forwarded-Encrypted: i=1; AJvYcCW69kL8g27FTXncIUXwxFNIOQaZe1Xhd9yf+GnNHhZHoL0ci3gyEGvJyTK9+UkJMrAVyqvecdg503M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YynFbVtYgoJ8mHc67/LJexQFN0qagd8e7XCk1AtNt0zTNcpJLrm
	a9l+nR5Q3TCk3hZCiqOcxYd4VKLnDtdVvceGp5FDIISUJOkGSW4uEfQkom/nIJc=
X-Google-Smtp-Source: AGHT+IFp0bIRemccCA417iPH3iETP3GHiIi0YQ1kYl0jJHPUD2elO80lKncaWqpMZaA15eDdxEi3ZQ==
X-Received: by 2002:a05:600c:3b9b:b0:431:5d4f:73a3 with SMTP id 5b1f17b1804b1-43161655d48mr1963315e9.18.1729209534120;
        Thu, 17 Oct 2024 16:58:54 -0700 (PDT)
Message-ID: <5bc04cc7-b9ce-4d4a-9c69-62ae6ccc6acb@citrix.com>
Date: Fri, 18 Oct 2024 00:58:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/44] x86/boot: introduce boot module flags
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
 <20241017170325.3842-11-dpsmith@apertussolutions.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241017170325.3842-11-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/10/2024 6:02 pm, Daniel P. Smith wrote:
> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
> index 18281d80fa97..e8ba9390a51f 100644
> --- a/xen/arch/x86/include/asm/bootinfo.h
> +++ b/xen/arch/x86/include/asm/bootinfo.h
> @@ -39,6 +39,9 @@ struct boot_module {
>       */
>      unsigned long headroom;
>      enum bootmod_type type;
> +
> +    uint32_t flags;
> +#define BOOTMOD_FLAG_X86_RELOCATED     (1U << 0)

There are two parts to this request.  First, there's nothing X86
specific about any of the flags added (in this series at least), and the
FLAG infix doesn't feel as if it adds much.

But, looking over the code, I get the feeling it would be better as simply:

    /*
     * Misc flags  XXX docs
     */
    bool relocated:1;
    bool consumed:1;

(Possibly with an enclosing struct { ... } flags; but I don't think
that's necessary either.)

because flags is never operated on as a unit of multiple things, or
passed around separately from a bm-> pointer.  For misc independent
flags like this, bitfields lead to far more legible code because you're
not having to express everything as binary operators in the logic.

I know this will be a moderately invasive change, but I suspect the
improvement will speak for itself.  (Assuming there isn't a need to keep
it as a plain flags field later.)

~Andrew

