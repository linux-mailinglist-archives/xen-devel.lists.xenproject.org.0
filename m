Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 234FAB15DFB
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 12:19:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063702.1429426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh3u9-00045Z-8z; Wed, 30 Jul 2025 10:19:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063702.1429426; Wed, 30 Jul 2025 10:19:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh3u9-00042V-54; Wed, 30 Jul 2025 10:19:25 +0000
Received: by outflank-mailman (input) for mailman id 1063702;
 Wed, 30 Jul 2025 10:19:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BoeR=2L=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uh3u7-00040o-9c
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 10:19:23 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a88e2489-6d2e-11f0-b895-0df219b8e170;
 Wed, 30 Jul 2025 12:19:21 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-45617887276so37716305e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jul 2025 03:19:21 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b78d45d010sm6618197f8f.8.2025.07.30.03.19.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 03:19:20 -0700 (PDT)
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
X-Inumbo-ID: a88e2489-6d2e-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753870761; x=1754475561; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mJQvGtNqvCp4/zxx5QWKgLBZz/T0kSLyCmMkSS1lmjY=;
        b=LqVx/LiArTR/n36I1F7UN6iwc8jFilMk+eOEKi72ao1RMOx9pIUFg3DlKBTj7yRrXf
         gDyxtqtLGxTT4ZN8TLIrIyNDSntBD5t2j4e6M1Wc37yEtlTbD4GpBHyGY36Ov72q33yn
         kSKR+8o8EDB8cGVvguJzYVCR8Z2CukE+9mQfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753870761; x=1754475561;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJQvGtNqvCp4/zxx5QWKgLBZz/T0kSLyCmMkSS1lmjY=;
        b=qkHCOkEDQ6B2KCIw9eG2MraoZoo6qvsX6tnaVFEpsO3+YuzmNQnInowc0wNSaa6zZx
         9ykQn9UMB6dPzfw1vISABekNMRbBhyuTrvFjWajg/02vV4zfEmSFxyWTjFCrpBE4dqlV
         LPY8e+ZqE083GeB3fsn3Z5X1ZYyUezAEUNJ+bZjUldcgAQKR3UcgT3KJaUXXVcwC3xJY
         WFEMFI2XZA6FSkJx+FZiCaML6TCznUXPSsU8PiBNPN+DcqSRJrH4QRpju4YjHt46zF3K
         IQ+cbIIWpCvgVAY4f5je6+Q78qGzDObEy5SmJVGQcHJ4XPcWuEMeNnMbH5pinL/UezIY
         W83g==
X-Forwarded-Encrypted: i=1; AJvYcCViTh8+24/L5Mfq2IR715Xy+XyGz6EbXLFbrcPL5dtsQXx6rxyvpVAhQrwsTU8CJAHaCcz1pT46+6A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzZOspidTZUHKDPyyzu4vdus1xVFBNS6/49jW9nebOM/eI3o3pm
	RIx+66zF2qnRMcODS2tKmNDZLR8O3j6brI1edfW3TY6BN9n4zsHkMbguEvCxUqRmWiY=
X-Gm-Gg: ASbGncvOgG2kld5xfDspqBjC/YXzQnjAz/nc5DuOHtLXcl9KnImExGL43Ov+l6zFm7b
	s/zp1zjJZb2DWaRYeadnSLnJTk7FDrAP42zvEU7+G7Vr9b7e6dfLtOdwqwgYBSIBAdg+leil8wT
	BwAYj7RY+EoyZKvit3Ttd9TI6Z0v+Qn9hII0CGtHcuRK+/YQO4EpwugJ4G6t3NtKUTu2UFBam8w
	KfdFUaTOXpJKmoznFJrFEwRnsJUy80xrI/kGvvwrWb6tE88kiGbj8+dHLoSFkjnOogUQPh0/2W2
	v3EXTFUi2UMVwHAGSYqRLCJQD6QdZGduc0CywIZWxVJWgPPS10wQoQajBvN/3Kk89wCP0mOHyH6
	2gG9fPQvUz7viFo36JiyvOPLabZN9dAeyQaI/Ym93Rd3e6f1sYF3jhaJi7KtfSLUzVqnWmhTTap
	A/EZo=
X-Google-Smtp-Source: AGHT+IHGkZFL8nk0OgtKLco42GgL61KZJS39iQIUv0oBivAnjO5soeODE8hVO26w1lNLJ7QND9EHXQ==
X-Received: by 2002:a05:600c:1d2a:b0:456:1a87:a6cb with SMTP id 5b1f17b1804b1-4589be7b8ecmr6063835e9.19.1753870760755;
        Wed, 30 Jul 2025 03:19:20 -0700 (PDT)
Message-ID: <535c83e3-0626-4447-a20c-20e4c8e2a213@citrix.com>
Date: Wed, 30 Jul 2025 11:19:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/8] vpci: Hide extended capability when it fails to
 initialize
To: Jan Beulich <jbeulich@suse.com>, Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Huang Rui <ray.huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 "consulting@bugseng.com" <consulting@bugseng.com>
References: <20250728050401.329510-1-Jiqian.Chen@amd.com>
 <20250728050401.329510-5-Jiqian.Chen@amd.com>
 <8051d388-48f9-4878-8924-8e645f313238@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <8051d388-48f9-4878-8924-8e645f313238@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/07/2025 10:50 am, Jan Beulich wrote:
> On 28.07.2025 07:03, Jiqian Chen wrote:
>> +static int vpci_ext_capability_hide(
>> +    const struct pci_dev *pdev, unsigned int cap)
>> +{
>> +    const unsigned int offset = pci_find_ext_capability(pdev->sbdf, cap);
>> +    struct vpci_register *r, *prev_r;
>> +    struct vpci *vpci = pdev->vpci;
>> +    uint32_t header, pre_header;
>> +
>> +    if ( offset < PCI_CFG_SPACE_SIZE )
>> +    {
>> +        ASSERT_UNREACHABLE();
>> +        return 0;
>> +    }
>> +
>> +    spin_lock(&vpci->lock);
>> +    r = vpci_get_register(vpci, offset, 4);
>> +    if ( !r )
>> +    {
>> +        spin_unlock(&vpci->lock);
>> +        return -ENODEV;
>> +    }
>> +
>> +    header = (uint32_t)(uintptr_t)r->private;
>> +    if ( offset == PCI_CFG_SPACE_SIZE )
>> +    {
>> +        if ( PCI_EXT_CAP_NEXT(header) <= PCI_CFG_SPACE_SIZE )
>> +            r->private = (void *)(uintptr_t)0;
> Eclair regards this a Misra rule 11.9 violation. Elsewhere we use (void *)0,
> which I then would conclude is "fine". But I can't say why that is. Cc-ing
> Bugseng for a possible explanation.

Eclair is complaining that this isn't written r->private = NULL.

Given that private is a pointer, I don't understand why NULL isn't used
either.

~Andrew

