Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDF9A80933
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 14:51:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942041.1341361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u28Q5-0003yO-8Y; Tue, 08 Apr 2025 12:51:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942041.1341361; Tue, 08 Apr 2025 12:51:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u28Q5-0003wa-5r; Tue, 08 Apr 2025 12:51:13 +0000
Received: by outflank-mailman (input) for mailman id 942041;
 Tue, 08 Apr 2025 12:51:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Iqs=W2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u28HP-0007mm-8F
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 12:42:15 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5e479e5-1476-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 14:42:14 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-39141ffa9fcso5993718f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 05:42:14 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec163107csm166477405e9.3.2025.04.08.05.42.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Apr 2025 05:42:13 -0700 (PDT)
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
X-Inumbo-ID: e5e479e5-1476-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744116134; x=1744720934; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MPTldhIQfRLwcVLvaiBL4d+c/HRQggoyWNJhb5PJcJs=;
        b=FyqHi/5OjFB+U9uNOlQ9xKSlJQH4Gtzru2GgH9R8bUkQCMWjIDDtR5AQ+NpUXt8lim
         059ymxZwRdtRH1oIIa6TdZxolbGTPHIufQWaG2V078NQO9z2dknj4VTtt+UDt/1QiD8o
         M+k+94a4+AIXAgdhU01u072Ea3EjXUJ/5aBXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744116134; x=1744720934;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MPTldhIQfRLwcVLvaiBL4d+c/HRQggoyWNJhb5PJcJs=;
        b=G9+WDfIlrXgz1vKTdwQECmAV85C0eOh9Xg4Ak7lDHst9eUnakHFRUFtFBfJk7PsBLF
         FVNeNbeBaU2XzwhBKvufu0//pSHU0e+H4QsR9i7DETZSpIitd10OHkqDScji/SGktj2n
         blq115VwuJNSf1W36Q47xfYIBizDmAIgGigpIvJbuhXdqixIVUuehhWSto1Ql0mBGQ0N
         OcmLGorXPOnEeq2ns9IjW/i378WOHyxt4dM56f+EgvM5ViV1ZZS7w0SQJYiZlT27LXKR
         B42GjTezEz4tY0DnXaQjwi0tMc0/Bz7rsKy171ztIn1HIiz1PBKVjH/U+lfr6qMrfQ4l
         jtPg==
X-Forwarded-Encrypted: i=1; AJvYcCWwGskxSkh8QpZrMe9nBPlEbZcvX9KZ58iIBzyyqV7jQyPD35Ryldz5mMvlm3IYGlQNDPWp4UmrCjo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx87TYQOI3VzdHuEh+kB+9nilExwze1o6dEsvVV2Jer8RT3oQFh
	4Ok4lnUZ63W1Hk0qNChqsa9GpaodjPEi5f+7/0mQazoW1ke2xj1TqcUUC2/+nJM=
X-Gm-Gg: ASbGncvKq25UaerT21/IZLqosWTywkLujoBOXGeUXqs//TTkcGic2CDxh7yflsQdGov
	2tuyfiCJW1zIu7FKksmy8HwbIhqVB0E0Nv4DhbmeAtKD3dNjrA0xcdbBDF4ky8+KT3jthcx5RgG
	ti5hT5mxvk4zISh3APW9r74VWQ1+q3AYKGZbK+4f4nHo7NXUAXU/ex+SJVLSPW/29yWzFwRrrDn
	5CRjDFv28dTDufKspZQT3YDxYuDU7ZcqSStRw87wFT3G3vIKovDVKADj5S/o4T44NozvBIJOqOh
	+uoCLu2EWrwMfxhhNRS+7o5bSVsIhKrC2PspAlsrrMkm8eSC76gsKW8OCxSAASNOPmykEtkAmIG
	dnvBxGhw5Kg==
X-Google-Smtp-Source: AGHT+IGinObwr50GT0K/SutzBZDR1ogRRfWK0xEtIad4bXZgSFnIp82yowWE0wsDyc4xG13I6j0luQ==
X-Received: by 2002:a05:6000:381:b0:39c:1258:7e1a with SMTP id ffacd0b85a97d-39d6fd54a93mr8726137f8f.59.1744116133941;
        Tue, 08 Apr 2025 05:42:13 -0700 (PDT)
Message-ID: <e3c49856-5c98-4a89-a0ff-10a4ed13038d@citrix.com>
Date: Tue, 8 Apr 2025 13:42:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul/test: drop check for AVX512-4FMAPS
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <779957ca-3250-4b33-ac1d-ace1dcdaafc0@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <779957ca-3250-4b33-ac1d-ace1dcdaafc0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/04/2025 1:28 pm, Jan Beulich wrote:
> Use of Xeon Phi features was dropped earlier on; this one was overlooked.
>
> Fixes: 85191cf32180 ("x86: drop Xeon Phi support")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
> In principle it looks as if we could now drop all of this checking, as
> gcc5 supports all of the features we check for. AVX512-4FMAPS is an
> example though where checking helps, as this and other Xeon Phi features
> were supported by an intermediate range of gcc versions.

Whatever's easiest.  This is just a test harness.

~Andrew

